'use client';

import { useState, useCallback } from 'react';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import CATQuizEngine from '@/components/quiz/CATQuizEngine';
import { CAT_CONFIGS, CATResults } from '@/lib/cat-session';

export default function GauntletPage() {
  const { user } = useUserStore();
  const supabase = createClient();

  const [result, setResult] = useState<'idle' | 'pass' | 'fail'>('idle');
  const [score, setScore] = useState(0);

  const handlePass = useCallback(async (results: CATResults) => {
    setScore(results.accuracy);
    setResult('pass');
    if (!user) return;

    const { data: existing } = await supabase
      .from('final_chapter_progress')
      .select('id')
      .eq('user_id', user.id)
      .single();

    if (existing) {
      await supabase
        .from('final_chapter_progress')
        .update({
          tlatm_gauntlet_completed: true,
          tlatm_gauntlet_score: results.accuracy,
        })
        .eq('user_id', user.id);
    } else {
      await supabase
        .from('final_chapter_progress')
        .insert({
          user_id: user.id,
          tlatm_gauntlet_completed: true,
          tlatm_gauntlet_score: results.accuracy,
        });
    }
  }, [user, supabase]);

  const handleFail = useCallback((results: CATResults) => {
    setScore(results.accuracy);
    setResult('fail');
  }, []);

  if (result === 'pass') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #ffd70044' }}>
          <div className="text-5xl mb-3">💼</div>
          <h2 className="text-2xl font-bold mb-2" style={{ color: '#ffd700' }}>Gauntlet Passed!</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-6" style={{ color: '#94a3b8' }}>
            You think like a manager. The Final Boss awaits!
          </p>
          <Link href="/app/story/final" className="inline-block px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#ffd700', color: '#080c14' }}>
            Continue to Final Chapter
          </Link>
        </div>
      </div>
    );
  }

  if (result === 'fail') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #f9731644' }}>
          <div className="text-5xl mb-3">💼</div>
          <h2 className="text-xl font-bold mb-2" style={{ color: '#f97316' }}>Not Quite</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-6" style={{ color: '#94a3b8' }}>
            The manager mindset takes practice. Review and try again!
          </p>
          <div className="flex gap-3 justify-center">
            <button onClick={() => setResult('idle')} className="px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#ffd700', color: '#080c14' }}>
              Retry Gauntlet
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

      <div className="rounded-xl p-5 mb-6" style={{ background: '#111a2e', border: '1px solid #ffd70033' }}>
        <div className="flex items-center gap-3 mb-2">
          <span className="text-2xl">💼</span>
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#ffd700' }}>Think Like a Manager Gauntlet</h2>
            <p className="text-xs" style={{ color: '#64748b' }}>Management perspective. No time limit. 70% to pass.</p>
          </div>
        </div>
      </div>

      <CATQuizEngine
        config={CAT_CONFIGS.gauntlet()}
        onPass={handlePass}
        onFail={handleFail}
      />
    </div>
  );
}
