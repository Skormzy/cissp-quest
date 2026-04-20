'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import dynamic from 'next/dynamic';
import CATQuizEngine from '@/components/quiz/CATQuizEngine';
import { CAT_CONFIGS, CATResults } from '@/lib/cat-session';
import { useUserStore } from '@/stores/useUserStore';

const IPassedCeremony = dynamic(
  () => import('@/components/quiz/IPassedCeremony'),
  { ssr: false },
);

type Phase = 'briefing' | 'exam' | 'ceremony' | 'results';

const DOMAIN_WEIGHTS = [
  { id: 1, name: 'Security & Risk Management', weight: '15%' },
  { id: 2, name: 'Asset Security', weight: '10%' },
  { id: 3, name: 'Security Architecture & Engineering', weight: '13%' },
  { id: 4, name: 'Communication & Network Security', weight: '13%' },
  { id: 5, name: 'Identity & Access Management', weight: '13%' },
  { id: 6, name: 'Security Assessment & Testing', weight: '12%' },
  { id: 7, name: 'Security Operations', weight: '13%' },
  { id: 8, name: 'Software Development Security', weight: '11%' },
];

export default function PracticeExamPage() {
  const router = useRouter();
  const { user } = useUserStore();
  const [phase, setPhase] = useState<Phase>('briefing');
  const [results, setResults] = useState<CATResults | null>(null);
  const [confirmed, setConfirmed] = useState(false);

  const handlePass = (r: CATResults) => {
    setResults(r);
    setPhase('ceremony');
  };
  const handleFail = (r: CATResults) => {
    setResults(r);
    setPhase('results');
  };

  if (phase === 'exam') {
    return (
      <CATQuizEngine
        config={CAT_CONFIGS.practice_exam()}
        onPass={handlePass}
        onFail={handleFail}
      />
    );
  }

  if (phase === 'ceremony' && results) {
    const pct = Math.round((results.correctAnswers / results.totalQuestions) * 100);
    return (
      <IPassedCeremony
        score={pct}
        domainsCompleted={8}
        totalXP={results.xpEarned}
        streakDays={user?.streak_count ?? 1}
        onContinue={() => setPhase('results')}
        onShare={() => {
          const text = `I just scored ${pct}% on a full CISSP practice exam (250 questions, 6 hours)! 🎯 Studying with CISSP Quest — gamified adaptive learning. #CISSP #CyberSecurity`;
          navigator.clipboard?.writeText(text).catch(() => {});
        }}
      />
    );
  }

  if (phase === 'results' && results) {
    const pct = Math.round((results.correctAnswers / results.totalQuestions) * 100);
    const passed = pct >= 70;
    return (
      <div className="min-h-screen flex items-center justify-center p-4" style={{ background: '#080c14' }}>
        <div className="max-w-2xl w-full space-y-6">
          <div className="text-center">
            <div
              className="inline-block text-8xl font-black mb-2"
              style={{ color: passed ? '#ffd700' : '#ef4444' }}
            >
              {pct}%
            </div>
            <div className="text-2xl font-bold text-white mb-1">
              {passed ? '🎉 Practice Exam Passed' : '📚 Keep Studying'}
            </div>
            <p className="text-gray-400">
              {results.correctAnswers} correct out of {results.totalQuestions} questions
            </p>
          </div>

          <div className="grid grid-cols-3 gap-4">
            {[
              { label: 'Score', value: `${pct}%` },
              { label: 'Questions', value: results.totalQuestions },
              { label: 'Theta (IRT)', value: results.finalTheta.toFixed(2) },
            ].map(({ label, value }) => (
              <div key={label} className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}>
                <div className="text-xl font-bold" style={{ color: '#00e8ff' }}>{value}</div>
                <div className="text-xs text-gray-400 mt-1">{label}</div>
              </div>
            ))}
          </div>

          {results.domainBreakdown && Object.keys(results.domainBreakdown).length > 0 && (
            <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}>
              <h3 className="text-sm font-semibold text-gray-300 mb-3">Domain Breakdown</h3>
              <div className="space-y-2">
                {Object.entries(results.domainBreakdown).map(([domainId, data]) => {
                  const domain = DOMAIN_WEIGHTS.find(d => d.id === parseInt(domainId));
                  const pctCorrect = data.total > 0 ? Math.round((data.correct / data.total) * 100) : 0;
                  return (
                    <div key={domainId} className="flex items-center gap-3">
                      <div className="text-xs text-gray-400 w-40 truncate">{domain?.name || `Domain ${domainId}`}</div>
                      <div className="flex-1 h-2 rounded-full bg-gray-800">
                        <div
                          className="h-full rounded-full transition-all"
                          style={{
                            width: `${pctCorrect}%`,
                            background: pctCorrect >= 70 ? '#22c55e' : pctCorrect >= 50 ? '#f59e0b' : '#ef4444',
                          }}
                        />
                      </div>
                      <div className="text-xs text-gray-300 w-10 text-right">{pctCorrect}%</div>
                    </div>
                  );
                })}
              </div>
            </div>
          )}

          <div className="flex gap-3">
            <button
              onClick={() => { setPhase('briefing'); setResults(null); setConfirmed(false); }}
              className="flex-1 py-3 rounded-xl font-semibold text-white"
              style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}
            >
              Retake Exam
            </button>
            <Link
              href="/app/dashboard"
              className="flex-1 py-3 rounded-xl font-semibold text-center"
              style={{ background: '#ffd700', color: '#080c14' }}
            >
              Back to Dashboard
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center p-4" style={{ background: '#080c14' }}>
      <div className="max-w-2xl w-full space-y-6">
        {/* Header */}
        <div className="text-center">
          <div className="text-xs font-mono tracking-widest mb-2" style={{ color: '#ffd700' }}>
            SENTINEL DYNAMICS — CISSP CERTIFICATION PREP
          </div>
          <h1 className="text-4xl font-black text-white mb-2">Practice Exam</h1>
          <p className="text-gray-400">Full 250-question CISSP simulation with adaptive difficulty</p>
        </div>

        {/* Exam specs */}
        <div className="grid grid-cols-3 gap-3">
          {[
            { icon: '📋', label: 'Questions', value: 'Up to 250' },
            { icon: '⏱️', label: 'Time Limit', value: '6 Hours' },
            { icon: '🎯', label: 'Pass Score', value: '70%+' },
          ].map(({ icon, label, value }) => (
            <div key={label} className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}>
              <div className="text-2xl mb-1">{icon}</div>
              <div className="text-sm font-bold text-white">{value}</div>
              <div className="text-xs text-gray-500">{label}</div>
            </div>
          ))}
        </div>

        {/* Domain weights */}
        <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}>
          <h3 className="text-sm font-semibold text-gray-300 mb-3">Domain Distribution</h3>
          <div className="grid grid-cols-2 gap-2">
            {DOMAIN_WEIGHTS.map(d => (
              <div key={d.id} className="flex justify-between items-center py-1 border-b border-gray-800/50">
                <span className="text-xs text-gray-400 truncate pr-2">D{d.id}. {d.name}</span>
                <span className="text-xs font-mono font-bold shrink-0" style={{ color: '#00e8ff' }}>{d.weight}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Rules */}
        <div className="rounded-xl p-5" style={{ background: '#0a1628', border: '1px solid #ffd70033' }}>
          <h3 className="text-sm font-semibold mb-3" style={{ color: '#ffd700' }}>Exam Rules</h3>
          <ul className="space-y-1.5">
            {[
              'The exam adapts to your ability level in real time using IRT.',
              'Questions stop automatically when your score is sufficiently precise.',
              'You cannot go back to previous questions.',
              'The timer counts down from 6 hours — submit before it expires.',
              'Your IRT theta score and domain breakdown are shown at the end.',
            ].map((rule, i) => (
              <li key={i} className="text-xs text-gray-300 flex gap-2">
                <span style={{ color: '#ffd700' }}>›</span>
                {rule}
              </li>
            ))}
          </ul>
        </div>

        {/* Confirmation */}
        <label className="flex items-center gap-3 cursor-pointer">
          <input
            type="checkbox"
            checked={confirmed}
            onChange={e => setConfirmed(e.target.checked)}
            className="w-4 h-4 rounded accent-yellow-400"
          />
          <span className="text-sm text-gray-300">
            I understand this is a timed exam and I cannot pause once started.
          </span>
        </label>

        <div className="flex gap-3">
          <Link
            href="/app/dashboard"
            className="flex-1 py-3 rounded-xl font-semibold text-center text-gray-400"
            style={{ background: '#111a2e', border: '1px solid #1e3a5f' }}
          >
            Cancel
          </Link>
          <button
            onClick={() => setPhase('exam')}
            disabled={!confirmed}
            className="flex-1 py-3 rounded-xl font-bold text-black transition-all disabled:opacity-40 disabled:cursor-not-allowed"
            style={{ background: confirmed ? '#ffd700' : '#4a4020' }}
          >
            Start Practice Exam
          </button>
        </div>
      </div>
    </div>
  );
}
