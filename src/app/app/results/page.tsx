'use client';

import Link from 'next/link';
import { useQuizStore } from '@/stores/useQuizStore';
import { useUserStore } from '@/stores/useUserStore';
import { getGrade } from '@/lib/xp';
import { DOMAINS } from '@/lib/constants';

export default function ResultsPage() {
  const quiz = useQuizStore();
  const { user } = useUserStore();

  if (quiz.answers.length === 0) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">📊</div>
        <p style={{ color: '#64748b' }}>No quiz results to display</p>
        <Link href="/app/quiz?mode=quick&count=10" className="inline-block mt-4 px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
          Take a Quiz
        </Link>
      </div>
    );
  }

  const correct = quiz.answers.filter((a) => a.isCorrect).length;
  const total = quiz.answers.length;
  const accuracy = correct / total;
  const grade = getGrade(accuracy);

  // Domain breakdown
  const domainBreakdown: Record<number, { correct: number; total: number }> = {};
  quiz.answers.forEach((answer, i) => {
    const q = quiz.questions[i];
    if (!domainBreakdown[q.domain_id]) domainBreakdown[q.domain_id] = { correct: 0, total: 0 };
    domainBreakdown[q.domain_id].total++;
    if (answer.isCorrect) domainBreakdown[q.domain_id].correct++;
  });

  return (
    <div className="max-w-lg mx-auto space-y-6">
      {/* Grade Card */}
      <div className="rounded-xl p-8 text-center" style={{ background: 'linear-gradient(135deg, #111a2e, #1a2540)', border: '1px solid #1e2d4a' }}>
        <div className="text-7xl font-bold mb-3" style={{ color: grade.color }}>{grade.grade}</div>
        <p className="text-xl font-bold mb-1" style={{ color: '#e2e8f0' }}>Quiz Complete!</p>
        <p className="text-sm" style={{ color: '#64748b' }}>
          {accuracy >= 0.85 ? 'Excellent work, Agent!' :
            accuracy >= 0.7 ? 'Good job! Keep studying.' :
              accuracy >= 0.5 ? 'Getting there. Review the Library.' :
                'Time to hit the books. Check the Library.'}
        </p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-3 gap-4">
        <div className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-2xl font-bold" style={{ color: '#22c55e' }}>{correct}/{total}</div>
          <div className="text-xs" style={{ color: '#64748b' }}>Correct</div>
        </div>
        <div className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>{Math.round(accuracy * 100)}%</div>
          <div className="text-xs" style={{ color: '#64748b' }}>Accuracy</div>
        </div>
        <div className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-2xl font-bold" style={{ color: '#ffd700' }}>+{quiz.totalXpEarned}</div>
          <div className="text-xs" style={{ color: '#64748b' }}>XP Earned</div>
        </div>
      </div>

      {/* Level Info */}
      {user && (
        <div className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <p className="text-sm" style={{ color: '#64748b' }}>
            Level <span className="font-bold" style={{ color: '#ffd700' }}>{user.level}</span> &bull; Total XP: <span className="font-bold" style={{ color: '#ffd700' }}>{user.xp.toLocaleString()}</span>
          </p>
        </div>
      )}

      {/* Domain Breakdown */}
      {Object.keys(domainBreakdown).length > 0 && (
        <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="font-bold mb-3" style={{ color: '#e2e8f0' }}>Domain Breakdown</h3>
          <div className="space-y-2">
            {Object.entries(domainBreakdown).map(([domainId, stats]) => {
              const domain = DOMAINS.find((d) => d.id === parseInt(domainId));
              const pct = Math.round((stats.correct / stats.total) * 100);
              return (
                <div key={domainId} className="flex items-center gap-3">
                  <span className="text-sm w-8">{domain?.icon}</span>
                  <div className="flex-1">
                    <div className="h-2 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
                      <div className="h-full rounded-full" style={{ width: `${pct}%`, background: domain?.color }} />
                    </div>
                  </div>
                  <span className="text-xs w-16 text-right" style={{ color: domain?.color }}>{stats.correct}/{stats.total}</span>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Actions */}
      <div className="flex gap-3">
        <Link
          href="/app/library"
          className="flex-1 py-3 rounded-xl text-sm font-medium text-center transition-all"
          style={{ border: '1px solid #1e2d4a', color: '#00e8ff' }}
        >
          📖 Study Library
        </Link>
        <Link
          href="/app/dashboard"
          className="flex-1 py-3 rounded-xl text-sm font-bold text-center transition-all hover:opacity-90"
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          Dashboard
        </Link>
      </div>
    </div>
  );
}
