'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { motion } from 'framer-motion';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { DOMAINS } from '@/lib/constants';

// CISSP domain weights per official ISC2 exam outline
const DOMAIN_WEIGHTS: Record<number, number> = {
  1: 0.15, 2: 0.10, 3: 0.13, 4: 0.13,
  5: 0.13, 6: 0.12, 7: 0.13, 8: 0.11,
};

const DOMAIN_COLORS: Record<number, string> = {
  1: '#ef4444', 2: '#f97316', 3: '#eab308', 4: '#22c55e',
  5: '#06b6d4', 6: '#8b5cf6', 7: '#ec4899', 8: '#00e8ff',
};

// Theta → readiness % mapping (IRT-calibrated)
// theta -3→0%, -1→30%, 0→50%, 0.5→65%, 1→80%, 1.5→90%, 2+→95%+
function thetaToReadiness(theta: number): number {
  if (theta <= -3) return 5;
  if (theta >= 2) return 95 + Math.min(5, (theta - 2) * 5);
  const points = [[-3, 5], [-1.5, 20], [-0.5, 35], [0, 50], [0.5, 63], [1, 76], [1.5, 88], [2, 95]];
  for (let i = 0; i < points.length - 1; i++) {
    const [x0, y0] = points[i];
    const [x1, y1] = points[i + 1];
    if (theta >= x0 && theta <= x1) {
      return y0 + ((theta - x0) / (x1 - x0)) * (y1 - y0);
    }
  }
  return 50;
}

interface DomainStats {
  totalAnswered: number;
  correctAnswers: number;
  avgTheta: number;
  lastSession: string | null;
}

function ReadinessMeter({ score }: { score: number }) {
  const color = score >= 80 ? '#22c55e' : score >= 60 ? '#ffd700' : score >= 40 ? '#f97316' : '#ef4444';
  const label = score >= 80 ? 'Exam Ready' : score >= 60 ? 'Good Progress' : score >= 40 ? 'Needs Work' : 'Just Starting';
  const circumference = 2 * Math.PI * 54;
  const dash = (score / 100) * circumference;

  return (
    <div className="flex flex-col items-center gap-3">
      <div className="relative w-36 h-36">
        <svg className="w-full h-full -rotate-90" viewBox="0 0 120 120">
          <circle cx="60" cy="60" r="54" fill="none" stroke="#1e2d4a" strokeWidth="8" />
          <motion.circle
            cx="60" cy="60" r="54" fill="none"
            stroke={color} strokeWidth="8"
            strokeLinecap="round"
            strokeDasharray={circumference}
            initial={{ strokeDashoffset: circumference }}
            animate={{ strokeDashoffset: circumference - dash }}
            transition={{ duration: 1.5, ease: 'easeOut' }}
          />
        </svg>
        <div className="absolute inset-0 flex flex-col items-center justify-center">
          <span className="text-3xl font-black" style={{ color }}>{Math.round(score)}%</span>
          <span className="text-[10px] text-gray-500">Readiness</span>
        </div>
      </div>
      <div
        className="text-xs font-bold px-3 py-1 rounded-full"
        style={{ background: `${color}22`, color, border: `1px solid ${color}44` }}
      >
        {label}
      </div>
    </div>
  );
}

function DomainBar({ domainId, readiness, answered, weight }: {
  domainId: number; readiness: number; answered: number; weight: number;
}) {
  const domain = DOMAINS.find(d => d.id === domainId);
  const color = DOMAIN_COLORS[domainId];
  const barColor = readiness >= 80 ? '#22c55e' : readiness >= 60 ? '#ffd700' : readiness >= 40 ? '#f97316' : '#ef4444';

  return (
    <div className="flex items-center gap-3">
      <div className="w-36 truncate">
        <span className="text-xs text-gray-400 truncate">{domain?.name ?? `Domain ${domainId}`}</span>
        <div className="text-[9px] text-gray-600">{Math.round(weight * 100)}% of exam · {answered}Q</div>
      </div>
      <div className="flex-1 h-3 rounded-full bg-gray-800 overflow-hidden">
        <motion.div
          className="h-full rounded-full"
          style={{ background: barColor }}
          initial={{ width: 0 }}
          animate={{ width: `${readiness}%` }}
          transition={{ duration: 1, delay: (domainId - 1) * 0.08, ease: 'easeOut' }}
        />
      </div>
      <div className="w-10 text-right text-xs font-bold" style={{ color: barColor }}>
        {Math.round(readiness)}%
      </div>
      <div
        className="w-2 h-2 rounded-full shrink-0"
        style={{ background: color }}
      />
    </div>
  );
}

export default function ReadinessPage() {
  const { user } = useUserStore();
  const [domainStats, setDomainStats] = useState<Record<number, DomainStats>>({});
  const [sessionCount, setSessionCount] = useState(0);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user) { setLoading(false); return; }

    const load = async () => {
      const supabase = createClient();

      // Load question performance joined with domain from cat_questions
      const { data: perf } = await supabase
        .from('question_performance')
        .select('response, theta_at_response, created_at, cat_questions!question_id(domain_id)')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false });

      if (perf) {
        const stats: Record<number, DomainStats> = {};
        for (const row of perf) {
          const cqRaw = row.cat_questions as unknown;
          const cq = Array.isArray(cqRaw) ? (cqRaw[0] as { domain_id: number } | undefined) : (cqRaw as { domain_id: number } | null);
          const d = cq?.domain_id;
          if (!d) continue;
          if (!stats[d]) stats[d] = { totalAnswered: 0, correctAnswers: 0, avgTheta: 0, lastSession: null };
          stats[d].totalAnswered++;
          if (row.response === 1) stats[d].correctAnswers++;
          stats[d].avgTheta = (stats[d].avgTheta * (stats[d].totalAnswered - 1) + (row.theta_at_response ?? 0)) / stats[d].totalAnswered;
          if (!stats[d].lastSession) stats[d].lastSession = row.created_at;
        }
        setDomainStats(stats);
      }

      const { count } = await supabase
        .from('cat_sessions')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', user.id);

      setSessionCount(count ?? 0);
      setLoading(false);
    };

    load();
  }, [user]);

  // Compute weighted overall readiness
  const overallReadiness = Object.entries(DOMAIN_WEIGHTS).reduce((sum, [dId, weight]) => {
    const domId = parseInt(dId);
    const stats = domainStats[domId];
    if (!stats || stats.totalAnswered === 0) return sum; // 0 for unattempted
    return sum + thetaToReadiness(stats.avgTheta) * weight;
  }, 0);

  // Weighted by answered domains only (scale up)
  const attemptedWeight = Object.entries(DOMAIN_WEIGHTS).reduce((sum, [dId, weight]) => {
    return domainStats[parseInt(dId)]?.totalAnswered ? sum + weight : sum;
  }, 0);

  const scaledReadiness = attemptedWeight > 0 ? overallReadiness / attemptedWeight : 0;

  // Sort domains: weakest first
  const sortedDomains = [1, 2, 3, 4, 5, 6, 7, 8].sort((a, b) => {
    const ra = domainStats[a]?.totalAnswered ? thetaToReadiness(domainStats[a].avgTheta) : 0;
    const rb = domainStats[b]?.totalAnswered ? thetaToReadiness(domainStats[b].avgTheta) : 0;
    return ra - rb;
  });

  const weakDomains = sortedDomains.slice(0, 3).filter(d => (domainStats[d]?.totalAnswered ?? 0) > 0 && thetaToReadiness(domainStats[d]?.avgTheta ?? -3) < 70);
  const strongDomains = sortedDomains.slice(-3).filter(d => (domainStats[d]?.totalAnswered ?? 0) > 0 && thetaToReadiness(domainStats[d]?.avgTheta ?? -3) >= 70);

  const totalAnswered = Object.values(domainStats).reduce((s, d) => s + d.totalAnswered, 0);

  return (
    <div className="max-w-4xl mx-auto space-y-6 py-4">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-black text-white">Exam Readiness</h1>
          <p className="text-xs text-gray-500">Based on your IRT theta scores across {totalAnswered} answered questions</p>
        </div>
        <Link href="/app/quiz/practice-exam"
          className="px-4 py-2 rounded-xl text-xs font-bold"
          style={{ background: '#ffd70022', border: '1px solid #ffd70044', color: '#ffd700' }}
        >
          Full Practice Exam →
        </Link>
      </div>

      {loading ? (
        <div className="flex items-center justify-center py-20">
          <div className="w-10 h-10 rounded-full border-2 animate-spin" style={{ borderColor: '#00e8ff44', borderTopColor: '#00e8ff' }} />
        </div>
      ) : totalAnswered === 0 ? (
        /* No data yet */
        <motion.div
          className="rounded-2xl p-10 text-center"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
        >
          <div className="text-5xl mb-4">📊</div>
          <h2 className="text-xl font-bold text-white mb-2">No Data Yet</h2>
          <p className="text-sm text-gray-400 mb-6 max-w-sm mx-auto">
            Answer questions across domains to build your readiness profile. Start with a quick quiz or dive into a domain.
          </p>
          <div className="flex gap-3 justify-center">
            <Link href="/app/quiz?mode=quick&count=10"
              className="px-6 py-2 rounded-xl text-sm font-bold"
              style={{ background: '#00e8ff', color: '#080c14' }}
            >
              Quick Quiz
            </Link>
            <Link href="/app/quiz/practice-exam"
              className="px-6 py-2 rounded-xl text-sm font-bold"
              style={{ background: '#1a1400', border: '1px solid #ffd70044', color: '#ffd700' }}
            >
              Practice Exam
            </Link>
          </div>
        </motion.div>
      ) : (
        <>
          {/* Top row: overall + sessions */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <motion.div
              className="rounded-2xl p-6 flex flex-col items-center"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
            >
              <ReadinessMeter score={scaledReadiness} />
            </motion.div>

            <motion.div
              className="rounded-2xl p-6 col-span-2 grid grid-cols-3 gap-4"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              initial={{ opacity: 0, y: 16 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.1 }}
            >
              {[
                { label: 'Questions', value: totalAnswered, icon: '📝' },
                { label: 'Sessions', value: sessionCount, icon: '🎯' },
                { label: 'Domains Active', value: Object.keys(domainStats).length, icon: '🗺️' },
              ].map(({ label, value, icon }) => (
                <div key={label} className="text-center py-4 rounded-xl" style={{ background: '#111a2e' }}>
                  <div className="text-2xl mb-1">{icon}</div>
                  <div className="text-2xl font-black" style={{ color: '#00e8ff' }}>{value}</div>
                  <div className="text-xs text-gray-500">{label}</div>
                </div>
              ))}

              {/* Weak vs Strong */}
              <div className="col-span-3 grid grid-cols-2 gap-3 mt-1">
                {weakDomains.length > 0 && (
                  <div className="rounded-xl p-3" style={{ background: 'rgba(239,68,68,0.08)', border: '1px solid rgba(239,68,68,0.2)' }}>
                    <p className="text-[10px] font-bold text-red-400 mb-1 uppercase tracking-widest">Focus Areas</p>
                    {weakDomains.map(d => (
                      <p key={d} className="text-xs text-gray-400">• {DOMAINS.find(dom => dom.id === d)?.name ?? `Domain ${d}`}</p>
                    ))}
                  </div>
                )}
                {strongDomains.length > 0 && (
                  <div className="rounded-xl p-3" style={{ background: 'rgba(34,197,94,0.08)', border: '1px solid rgba(34,197,94,0.2)' }}>
                    <p className="text-[10px] font-bold text-green-400 mb-1 uppercase tracking-widest">Strong Domains</p>
                    {strongDomains.map(d => (
                      <p key={d} className="text-xs text-gray-400">• {DOMAINS.find(dom => dom.id === d)?.name ?? `Domain ${d}`}</p>
                    ))}
                  </div>
                )}
              </div>
            </motion.div>
          </div>

          {/* Domain breakdown */}
          <motion.div
            className="rounded-2xl p-6"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
          >
            <h3 className="text-sm font-bold text-white mb-4">Domain Readiness Breakdown</h3>
            <div className="space-y-3">
              {[1, 2, 3, 4, 5, 6, 7, 8].map(d => {
                const stats = domainStats[d];
                const readiness = stats?.totalAnswered ? thetaToReadiness(stats.avgTheta) : 0;
                return (
                  <DomainBar
                    key={d}
                    domainId={d}
                    readiness={readiness}
                    answered={stats?.totalAnswered ?? 0}
                    weight={DOMAIN_WEIGHTS[d]}
                  />
                );
              })}
            </div>
          </motion.div>

          {/* Action recommendations */}
          <motion.div
            className="rounded-2xl p-6 grid md:grid-cols-3 gap-4"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.3 }}
          >
            <div>
              <h3 className="text-xs font-bold text-white mb-3 uppercase tracking-widest">Recommended Next</h3>
              <div className="space-y-2">
                {weakDomains.length > 0 ? (
                  weakDomains.map(d => (
                    <Link
                      key={d}
                      href={`/app/quiz?mode=domain&domain=${d}&count=20`}
                      className="flex items-center gap-2 rounded-lg p-2 text-xs transition-all"
                      style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}
                    >
                      <span className="w-2 h-2 rounded-full shrink-0" style={{ background: DOMAIN_COLORS[d] }} />
                      Quiz Domain {d} — {DOMAINS.find(dom => dom.id === d)?.name?.split(' ')[0]}
                    </Link>
                  ))
                ) : (
                  <p className="text-xs text-gray-500">All domains covered — take a practice exam!</p>
                )}
              </div>
            </div>

            <div>
              <h3 className="text-xs font-bold text-white mb-3 uppercase tracking-widest">Story Progress</h3>
              <Link
                href="/app/story"
                className="flex items-center gap-2 rounded-lg p-3 text-xs"
                style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}
              >
                <span className="text-lg">📖</span>
                <div>
                  <div className="font-semibold text-white text-sm">Continue Story</div>
                  <div>Story mode teaches context first</div>
                </div>
              </Link>
            </div>

            <div>
              <h3 className="text-xs font-bold text-white mb-3 uppercase tracking-widest">Full Simulation</h3>
              <Link
                href="/app/quiz/practice-exam"
                className="flex items-center gap-2 rounded-lg p-3 text-xs"
                style={{ background: 'rgba(255,215,0,0.05)', border: '1px solid rgba(255,215,0,0.2)', color: '#94a3b8' }}
              >
                <span className="text-lg">📋</span>
                <div>
                  <div className="font-semibold" style={{ color: '#ffd700' }}>Practice Exam</div>
                  <div>250Q · 6 hours · Full CISSP sim</div>
                </div>
              </Link>
            </div>
          </motion.div>
        </>
      )}
    </div>
  );
}
