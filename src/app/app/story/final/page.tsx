'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { FinalChapterProgress } from '@/lib/story-types';

export default function FinalChapterPage() {
  const { user } = useUserStore();
  const supabase = createClient();

  const [allConquered, setAllConquered] = useState(false);
  const [finalProgress, setFinalProgress] = useState<FinalChapterProgress | null>(null);
  const [loading, setLoading] = useState(true);
  const [conqueredCount, setConqueredCount] = useState(0);

  useEffect(() => {
    if (!user) return;
    const load = async () => {
      // Check all 8 domains conquered
      const { data: storyData } = await supabase
        .from('story_progress')
        .select('domain_number, domain_conquered')
        .eq('user_id', user.id);

      if (storyData) {
        const conquered = storyData.filter((p) => p.domain_conquered).length;
        setConqueredCount(conquered);
        setAllConquered(conquered >= 8);
      }

      // Load final chapter progress
      const { data: finalData } = await supabase
        .from('final_chapter_progress')
        .select('*')
        .eq('user_id', user.id)
        .single();

      if (finalData) setFinalProgress(finalData);
      setLoading(false);
    };
    load();
  }, [user, supabase]);

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto" style={{ borderColor: '#ffd700', borderTopColor: 'transparent' }} />
      </div>
    );
  }

  if (!allConquered) {
    return (
      <div className="max-w-2xl mx-auto text-center py-20">
        <div className="text-5xl mb-4">🔒</div>
        <h2 className="text-2xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Final Chapter Locked</h2>
        <p className="text-sm mb-6" style={{ color: '#94a3b8' }}>
          {conqueredCount}/8 Domains Conquered — Complete all 8 to unlock.
        </p>
        <Link href="/app/story" className="inline-block px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
          Back to Story Hub
        </Link>
      </div>
    );
  }

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <Link href="/app/story" className="text-xs inline-flex items-center gap-1" style={{ color: '#64748b' }}>
        ← Back to Story Hub
      </Link>

      {/* Title */}
      <div className="text-center py-4">
        <div className="text-4xl mb-2">🏆</div>
        <h1 className="text-2xl font-bold mb-1" style={{ color: '#ffd700' }}>The Final Chapter</h1>
        <p className="text-sm" style={{ color: '#94a3b8' }}>
          You&apos;ve conquered all 8 domains. Two challenges remain.
        </p>
      </div>

      {/* TLATM Gauntlet Card */}
      <Link
        href="/app/story/final/gauntlet"
        className="block rounded-xl p-6 transition-all hover:scale-[1.02]"
        style={{
          background: finalProgress?.tlatm_gauntlet_completed
            ? 'linear-gradient(135deg, #1a1a00, #2a2a10)'
            : '#111a2e',
          border: `1px solid ${finalProgress?.tlatm_gauntlet_completed ? '#ffd700' : '#ffd70044'}`,
        }}
      >
        <div className="flex items-center gap-4">
          <span className="text-3xl">💼</span>
          <div className="flex-1">
            <h3 className="font-bold" style={{ color: '#ffd700' }}>Think Like a Manager Gauntlet</h3>
            <p className="text-xs" style={{ color: '#94a3b8' }}>10 management-perspective questions. Untimed. 70% to pass.</p>
          </div>
          {finalProgress?.tlatm_gauntlet_completed ? (
            <span className="text-xs font-bold px-2 py-1 rounded-full" style={{ background: '#ffd70022', color: '#ffd700' }}>
              PASSED ({Math.round(finalProgress.tlatm_gauntlet_score || 0)}%)
            </span>
          ) : (
            <span className="text-xs font-bold px-3 py-1 rounded-lg" style={{ background: '#ffd700', color: '#080c14' }}>
              Begin
            </span>
          )}
        </div>
      </Link>

      {/* Final Boss Card */}
      <div
        className="rounded-xl p-6"
        style={{
          background: finalProgress?.final_boss_passed
            ? 'linear-gradient(135deg, #1a0000, #2a1010)'
            : '#111a2e',
          border: `1px solid ${finalProgress?.final_boss_passed ? '#ef4444' : '#ef444444'}`,
          opacity: finalProgress?.tlatm_gauntlet_completed ? 1 : 0.5,
        }}
      >
        <div className="flex items-center gap-4">
          <span className="text-3xl">👹</span>
          <div className="flex-1">
            <h3 className="font-bold" style={{ color: '#ef4444' }}>Final Boss</h3>
            <p className="text-xs" style={{ color: '#94a3b8' }}>50 questions across all domains. 75 minutes. 70% to pass.</p>
            {finalProgress?.final_boss_best_score && (
              <p className="text-[10px]" style={{ color: '#64748b' }}>
                Best: {finalProgress.final_boss_best_score}% | Attempts: {finalProgress.final_boss_attempts}
              </p>
            )}
          </div>
          {finalProgress?.final_boss_passed ? (
            <span className="text-xs font-bold px-2 py-1 rounded-full" style={{ background: '#22c55e22', color: '#22c55e' }}>
              CISSP LEGEND
            </span>
          ) : finalProgress?.tlatm_gauntlet_completed ? (
            <Link
              href="/app/story/final/boss"
              className="text-xs font-bold px-3 py-1 rounded-lg"
              style={{ background: '#ef4444', color: 'white' }}
            >
              Challenge
            </Link>
          ) : (
            <span className="text-xs" style={{ color: '#64748b' }}>🔒 Pass Gauntlet first</span>
          )}
        </div>
      </div>

      {/* CISSP Legend Badge */}
      {finalProgress?.cissp_legend_earned && (
        <div className="rounded-xl p-8 text-center" style={{ background: 'linear-gradient(135deg, #1a1a00, #2a2a10)', border: '2px solid #ffd700' }}>
          <div className="text-6xl mb-3">🎓</div>
          <h2 className="text-2xl font-bold mb-2" style={{ color: '#ffd700' }}>CISSP Legend</h2>
          <p className="text-sm" style={{ color: '#e2e8f0' }}>
            You have mastered all 8 CISSP domains and defeated the Final Boss. You are a CISSP Legend.
          </p>
        </div>
      )}
    </div>
  );
}
