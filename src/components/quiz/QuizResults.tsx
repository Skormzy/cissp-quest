'use client';

import { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Button } from '@/components/ui/button';
import { cn } from '@/lib/utils';
import { DOMAINS } from '@/lib/constants';
import { thetaToScaledScore } from '@/lib/irt-engine';
import type { DomainSubscore } from '@/lib/irt-engine';
import {
  RadarChart,
  Radar,
  PolarGrid,
  PolarAngleAxis,
  ResponsiveContainer,
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  CartesianGrid,
} from 'recharts';
import {
  Trophy,
  Star,
  RotateCcw,
  BookOpen,
  ArrowRight,
  Zap,
  Target,
  Clock,
  CheckCircle,
  XCircle,
  Medal,
} from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

export interface QuizResultsProps {
  scaledScore: number;
  passed: boolean;
  accuracy: number;
  totalQuestions: number;
  correctAnswers: number;
  avgTimeSeconds: number;
  xpEarned: number;
  domainSubscores?: DomainSubscore[];
  thetaHistory?: number[];
  onReviewAnswers?: () => void;
  onTryAgain?: () => void;
  onContinueStory?: () => void;
  sessionLabel?: string;
}

// ─── Medal config ─────────────────────────────────────────────────────────

const MEDALS = [
  { threshold: 950, label: 'Platinum',   color: '#e2e8f0', icon: '🏆' },
  { threshold: 850, label: 'Gold',       color: '#ffd700', icon: '🥇' },
  { threshold: 750, label: 'Silver',     color: '#94a3b8', icon: '🥈' },
  { threshold: 700, label: 'Bronze',     color: '#f97316', icon: '🥉' },
  { threshold: 0,   label: 'Challenger', color: '#ef4444', icon: '⚡'  },
] as const;

function getMedal(score: number) {
  return MEDALS.find((m) => score >= m.threshold) ?? MEDALS[MEDALS.length - 1];
}

// ─── Count-up hook ────────────────────────────────────────────────────────

function useCountUp(target: number, duration = 1800) {
  const [value, setValue] = useState(0);
  const frameRef = useRef<number | null>(null);

  useEffect(() => {
    const start = performance.now();

    const tick = (now: number) => {
      const elapsed = now - start;
      const progress = Math.min(elapsed / duration, 1);
      // Ease-out cubic
      const eased = 1 - Math.pow(1 - progress, 3);
      setValue(Math.round(eased * target));
      if (progress < 1) frameRef.current = requestAnimationFrame(tick);
    };

    frameRef.current = requestAnimationFrame(tick);
    return () => { if (frameRef.current) cancelAnimationFrame(frameRef.current); };
  }, [target, duration]);

  return value;
}

// ─── Stat Card ────────────────────────────────────────────────────────────

function StatCard({ icon: Icon, label, value, color }: {
  icon: React.ElementType;
  label: string;
  value: string;
  color: string;
}) {
  return (
    <motion.div
      className="flex flex-col gap-1 rounded-xl p-4"
      style={{ background: '#111827', border: '1px solid #1e2d4a' }}
      initial={{ opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
    >
      <div className="flex items-center gap-2 mb-1">
        <Icon size={14} style={{ color }} />
        <span className="text-xs" style={{ color: '#64748b' }}>{label}</span>
      </div>
      <p className="text-lg font-bold" style={{ color: '#e2e8f0' }}>{value}</p>
    </motion.div>
  );
}

// ─── Domain Bar ───────────────────────────────────────────────────────────

function DomainBar({ domainId, correct, total }: { domainId: number; correct: number; total: number }) {
  const domain = DOMAINS.find((d) => d.id === domainId);
  const pct = total > 0 ? (correct / total) * 100 : 0;

  return (
    <div className="flex items-center gap-3">
      <span className="text-xs shrink-0 w-28 truncate" style={{ color: '#94a3b8' }}>
        {domain?.name ?? `Domain ${domainId}`}
      </span>
      <div className="flex-1 h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
        <motion.div
          className="h-full rounded-full"
          style={{ background: domain?.color ?? '#00e8ff' }}
          initial={{ width: 0 }}
          animate={{ width: `${pct}%` }}
          transition={{ duration: 0.7, ease: 'easeOut', delay: 0.3 }}
        />
      </div>
      <span className="text-xs font-mono w-10 text-right" style={{ color: '#64748b' }}>
        {pct.toFixed(0)}%
      </span>
    </div>
  );
}

// ─── Radar chart data builder ─────────────────────────────────────────────

function buildRadarData(subscores: DomainSubscore[]) {
  return subscores.map((s) => {
    const domain = DOMAINS.find((d) => d.id === s.domain_id);
    return {
      domain: domain?.name.split(' ').slice(-1)[0] ?? `D${s.domain_id}`,
      score: s.correct > 0 ? Math.round((s.correct / s.count) * 100) : 0,
    };
  });
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function QuizResults({
  scaledScore,
  passed,
  accuracy,
  totalQuestions,
  correctAnswers,
  avgTimeSeconds,
  xpEarned,
  domainSubscores = [],
  thetaHistory = [],
  onReviewAnswers,
  onTryAgain,
  onContinueStory,
  sessionLabel,
}: QuizResultsProps) {
  const animatedScore = useCountUp(scaledScore, 2000);
  const animatedXP = useCountUp(xpEarned, 1500);
  const medal = getMedal(scaledScore);

  const radarData = buildRadarData(domainSubscores);

  const thetaChartData = thetaHistory.map((t, i) => ({
    q: i + 1,
    theta: Number(t.toFixed(3)),
    score: thetaToScaledScore(t),
  }));

  const wrongAnswers = totalQuestions - correctAnswers;

  return (
    <div className="w-full max-w-3xl mx-auto space-y-6 py-6 px-4">

      {/* Hero score card */}
      <motion.div
        className="relative rounded-2xl overflow-hidden p-8 text-center"
        style={{
          background: 'linear-gradient(135deg, #0d1220, #111827)',
          border: `2px solid ${passed ? '#22c55e44' : '#ef444444'}`,
        }}
        initial={{ opacity: 0, scale: 0.96 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.5 }}
      >
        {/* Medal */}
        <motion.div
          className="text-4xl mb-2"
          initial={{ scale: 0, rotate: -20 }}
          animate={{ scale: 1, rotate: 0 }}
          transition={{ delay: 0.4, type: 'spring', stiffness: 200 }}
        >
          {medal.icon}
        </motion.div>

        {/* Score */}
        <motion.div
          className="text-8xl font-black tracking-tighter"
          style={{ color: passed ? '#22c55e' : '#ef4444' }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          {animatedScore}
        </motion.div>

        {/* PASS / FAIL badge */}
        <motion.div
          className="inline-flex items-center gap-2 mt-3 px-5 py-2 rounded-full text-sm font-bold uppercase tracking-widest"
          style={{
            background: passed ? 'rgba(34,197,94,0.15)' : 'rgba(239,68,68,0.15)',
            color: passed ? '#22c55e' : '#ef4444',
            border: `1px solid ${passed ? '#22c55e44' : '#ef444444'}`,
          }}
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.6 }}
        >
          {passed ? <CheckCircle size={15} /> : <XCircle size={15} />}
          {passed ? 'Pass' : 'Fail'} — {medal.label}
        </motion.div>

        {sessionLabel && (
          <p className="mt-2 text-xs" style={{ color: '#475569' }}>{sessionLabel}</p>
        )}

        {/* XP badge */}
        <AnimatePresence>
          <motion.div
            className="absolute top-4 right-4 flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-sm font-bold"
            style={{ background: 'rgba(0,232,255,0.1)', color: '#00e8ff', border: '1px solid #00e8ff33' }}
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.8 }}
          >
            <Zap size={14} />
            +{animatedXP} XP
          </motion.div>
        </AnimatePresence>

        {/* Pass threshold note */}
        <p className="mt-3 text-xs" style={{ color: '#64748b' }}>
          Pass threshold: 700 / 1000
        </p>
      </motion.div>

      {/* Stat cards */}
      <motion.div
        className="grid grid-cols-2 md:grid-cols-4 gap-3"
        initial="hidden"
        animate="show"
        variants={{ show: { transition: { staggerChildren: 0.08 } } }}
      >
        <StatCard icon={Target}   label="Accuracy"     value={`${(accuracy * 100).toFixed(1)}%`} color="#00e8ff" />
        <StatCard icon={CheckCircle} label="Correct"   value={`${correctAnswers}/${totalQuestions}`} color="#22c55e" />
        <StatCard icon={Clock}    label="Avg Time"     value={`${avgTimeSeconds.toFixed(1)}s`} color="#eab308" />
        <StatCard icon={Medal}    label="Medal"        value={medal.label} color={medal.color} />
      </motion.div>

      {/* Domain breakdown */}
      {domainSubscores.length > 0 && (
        <motion.div
          className="rounded-2xl p-5 space-y-4"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3 }}
        >
          <h3 className="text-sm font-bold uppercase tracking-wider" style={{ color: '#64748b' }}>
            Domain Breakdown
          </h3>

          <div className="grid md:grid-cols-2 gap-6 items-center">
            {/* Bars */}
            <div className="space-y-3">
              {domainSubscores.map((s) => (
                <DomainBar
                  key={s.domain_id}
                  domainId={s.domain_id}
                  correct={s.correct}
                  total={s.count}
                />
              ))}
            </div>

            {/* Radar */}
            {radarData.length >= 3 && (
              <div className="h-52">
                <ResponsiveContainer width="100%" height="100%">
                  <RadarChart data={radarData} cx="50%" cy="50%" outerRadius="70%">
                    <PolarGrid stroke="#1e2d4a" />
                    <PolarAngleAxis dataKey="domain" tick={{ fill: '#64748b', fontSize: 10 }} />
                    <Radar
                      name="Score"
                      dataKey="score"
                      stroke="#00e8ff"
                      fill="#00e8ff"
                      fillOpacity={0.15}
                    />
                  </RadarChart>
                </ResponsiveContainer>
              </div>
            )}
          </div>
        </motion.div>
      )}

      {/* Theta history chart */}
      {thetaChartData.length > 2 && (
        <motion.div
          className="rounded-2xl p-5"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4 }}
        >
          <h3 className="text-sm font-bold uppercase tracking-wider mb-4" style={{ color: '#64748b' }}>
            Ability Progression (θ over questions)
          </h3>
          <div className="h-36">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={thetaChartData} margin={{ top: 4, right: 4, left: -20, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1e2d4a" />
                <XAxis dataKey="q" tick={{ fill: '#475569', fontSize: 10 }} />
                <YAxis tick={{ fill: '#475569', fontSize: 10 }} domain={[-3, 3]} />
                <Tooltip
                  contentStyle={{ background: '#0d1220', border: '1px solid #1e2d4a', borderRadius: 8 }}
                  labelStyle={{ color: '#94a3b8', fontSize: 11 }}
                  itemStyle={{ color: '#00e8ff', fontSize: 11 }}
                />
                <Line
                  type="monotone"
                  dataKey="theta"
                  stroke="#00e8ff"
                  strokeWidth={2}
                  dot={false}
                  activeDot={{ r: 4, fill: '#00e8ff' }}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>
          <p className="text-xs mt-2 text-center" style={{ color: '#475569' }}>
            θ = 0.7 ≈ passing threshold (scaled 700)
          </p>
        </motion.div>
      )}

      {/* CTA buttons */}
      <motion.div
        className="flex flex-wrap gap-3 justify-center"
        initial={{ opacity: 0, y: 12 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.6 }}
      >
        {onReviewAnswers && (
          <Button
            variant="outline"
            className="gap-2"
            onClick={onReviewAnswers}
            style={{ borderColor: '#1e2d4a' }}
          >
            <BookOpen size={15} />
            Review Answers
          </Button>
        )}
        {onTryAgain && (
          <Button
            variant="outline"
            className="gap-2"
            onClick={onTryAgain}
            style={{ borderColor: '#1e2d4a' }}
          >
            <RotateCcw size={15} />
            Try Again
          </Button>
        )}
        {onContinueStory && (
          <Button
            className="gap-2"
            onClick={onContinueStory}
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            Continue Story
            <ArrowRight size={15} />
          </Button>
        )}
      </motion.div>
    </div>
  );
}
