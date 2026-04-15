'use client';

import { useState, useCallback } from 'react';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAIN_COLORS } from '@/lib/story-constants';
import { DOMAINS } from '@/lib/constants';
import CATQuizEngine from '@/components/quiz/CATQuizEngine';
import { CAT_CONFIGS, CATResults } from '@/lib/cat-session';

export default function FinalBossPage() {
  const { user } = useUserStore();
  const supabase = createClient();

  const [result, setResult] = useState<'idle' | 'pass' | 'fail'>('idle');
  const [score, setScore] = useState(0);
  const [weakDomains, setWeakDomains] = useState<number[]>([]);

  const handlePass = useCallback(async (results: CATResults) => {
    setScore(results.accuracy);
    setResult('pass');
    if (!user) return;

    const { data: existing } = await supabase
      .from('final_chapter_progress')
      .select('final_boss_best_score, final_boss_attempts')
      .eq('user_id', user.id)
      .single();

    const bestScore = Math.max(results.accuracy, existing?.final_boss_best_score || 0);
    const attempts = (existing?.final_boss_attempts || 0) + 1;

    await supabase
      .from('final_chapter_progress')
      .update({
        final_boss_passed: true,
        final_boss_score: results.accuracy,
        final_boss_best_score: bestScore,
        final_boss_attempts: attempts,
        cissp_legend_earned: true,
        completed_at: new Date().toISOString(),
      })
      .eq('user_id', user.id);
  }, [user, supabase]);

  const handleFail = useCallback(async (results: CATResults) => {
    setScore(results.accuracy);
    const weak = Object.entries(results.domainBreakdown)
      .filter(([, d]) => d.total > 0 && (d.correct / d.total) < 0.5)
      .map(([id]) => parseInt(id));
    setWeakDomains(weak);
    setResult('fail');
    if (!user) return;

    const { data: existing } = await supabase
      .from('final_chapter_progress')
      .select('final_boss_best_score, final_boss_attempts')
      .eq('user_id', user.id)
      .single();

    const bestScore = Math.max(results.accuracy, existing?.final_boss_best_score || 0);
    const attempts = (existing?.final_boss_attempts || 0) + 1;

    await supabase
      .from('final_chapter_progress')
      .update({
        final_boss_score: results.accuracy,
        final_boss_best_score: bestScore,
        final_boss_attempts: attempts,
      })
      .eq('user_id', user.id);
  }, [user, supabase]);

  if (result === 'pass') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: 'linear-gradient(135deg, #1a1a00, #2a2a10)', border: '2px solid #ffd700' }}>
          <div className="text-6xl mb-4">🎓</div>
          <h2 className="text-3xl font-bold mb-2" style={{ color: '#ffd700' }}>CISSP LEGEND</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-6" style={{ color: '#94a3b8' }}>
            You have defeated the Final Boss and proven mastery across all 8 CISSP domains.
            The title of CISSP Legend is yours.
          </p>
          <Link href="/app/story/final" className="inline-block px-8 py-3 rounded-xl text-sm font-bold" style={{ background: '#ffd700', color: '#080c14' }}>
            Return to Final Chapter
          </Link>
        </div>
      </div>
    );
  }

  if (result === 'fail') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #ef444444' }}>
          <div className="text-5xl mb-3">👹</div>
          <h2 className="text-xl font-bold mb-2" style={{ color: '#ef4444' }}>The Final Boss Stands</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>
            You need 70% to earn the CISSP Legend title. Review your weak areas and return stronger.
          </p>
          {weakDomains.length > 0 && (
            <div className="mb-6 p-3 rounded-lg inline-block" style={{ background: '#0d1220' }}>
              <p className="text-xs font-bold mb-2" style={{ color: '#ef4444' }}>Focus Areas</p>
              {weakDomains.map((d) => {
                const wd = DOMAINS.find((dom) => dom.id === d);
                const color = DOMAIN_COLORS[d];
                return (
                  <p key={d} className="text-xs flex items-center gap-2" style={{ color: '#94a3b8' }}>
                    <span className="w-2 h-2 rounded-full" style={{ background: color }} />
                    {wd?.name || `Domain ${d}`}
                  </p>
                );
              })}
            </div>
          )}
          <div className="flex gap-3 justify-center">
            <button onClick={() => setResult('idle')} className="px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#ef4444', color: 'white' }}>
              Retry Final Boss
            </button>
            <Link href="/app/story/final" className="px-6 py-2 rounded-lg text-sm" style={{ border: '1px solid #1e2d4a', color: '#94a3b8' }}>
              Back
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-3xl mx-auto">
      <Link href="/app/story/final" className="text-xs inline-flex items-center gap-1 mb-4" style={{ color: '#64748b' }}>
        ← Back to Final Chapter
      </Link>

      <div className="rounded-xl p-5 mb-6" style={{ background: '#111a2e', border: '1px solid #ef444433' }}>
        <div className="flex items-center gap-3 mb-2">
          <span className="text-2xl">👹</span>
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#ef4444' }}>Final Boss</h2>
            <p className="text-xs" style={{ color: '#64748b' }}>Adaptive: 50-75 questions. All 8 domains. 75 minutes.</p>
          </div>
        </div>
        <p className="text-sm" style={{ color: '#94a3b8' }}>The ultimate adaptive test across all 8 domains</p>
      </div>

      <CATQuizEngine
        config={CAT_CONFIGS.final_boss()}
        onPass={handlePass}
        onFail={handleFail}
      />
    </div>
  );
}
