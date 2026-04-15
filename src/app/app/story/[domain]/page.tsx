'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAINS } from '@/lib/constants';
import { DOMAIN_CHAPTERS, DOMAIN_COLORS, ACT_TIMELINE, isActUnlocked, isActCompleted } from '@/lib/story-constants';
import { StoryModeProgress } from '@/lib/story-types';
import { getActData } from '@/data/story';
import { validateGameState } from '@/lib/qa-validation';

export default function DomainChapterPage() {
  const params = useParams();
  const domainId = parseInt(params.domain as string);
  const { user } = useUserStore();
  const [progress, setProgress] = useState<StoryModeProgress | null>(null);
  const [loading, setLoading] = useState(true);

  const domain = DOMAINS.find((d) => d.id === domainId);
  const chapter = DOMAIN_CHAPTERS.find((c) => c.domainId === domainId);
  const color = DOMAIN_COLORS[domainId] || '#00e8ff';

  useEffect(() => {
    if (!user) return;
    let cancelled = false;
    const load = async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from('story_progress')
        .select('*')
        .eq('user_id', user.id)
        .eq('domain_number', domainId)
        .maybeSingle();

      if (cancelled) return;
      setProgress(data);
      setLoading(false);

      // QA: warn about impossible states in dev
      if (process.env.NODE_ENV === 'development' && data) {
        const warnings = validateGameState(data);
        if (warnings.length > 0) {
          console.warn(`[QA] Domain ${domainId} progress warnings:`, warnings);
        }
      }
    };
    setLoading(true);
    load();
    return () => { cancelled = true; };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user?.id, domainId]);

  if (domainId < 1 || domainId > 8 || !domain || !chapter) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">🔒</div>
        <p style={{ color: '#64748b' }}>Domain not found</p>
        <Link href="/app/story" className="text-sm mt-4 inline-block" style={{ color: '#00e8ff' }}>Back to Story Hub</Link>
      </div>
    );
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto" style={{ borderColor: color, borderTopColor: 'transparent' }} />
      </div>
    );
  }

  const progressData = progress ? {
    act1_completed: progress.act1_completed,
    act2_completed: progress.act2_completed,
    act4_completed: progress.act4_completed,
    field_test_passed: progress.field_test_passed,
    boss_battle_passed: progress.boss_battle_passed,
  } : null;

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      {/* Back nav */}
      <Link href="/app/story" className="text-xs inline-flex items-center gap-1" style={{ color: '#64748b' }}>
        ← Back to Story Hub
      </Link>

      {/* Domain header */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: `1px solid ${color}33` }}>
        <div className="flex items-center gap-3 mb-3">
          <span className="text-2xl">{domain.icon}</span>
          <div>
            <span className="text-xs font-bold px-2 py-0.5 rounded-full" style={{ background: `${color}22`, color }}>
              Domain {domainId}
            </span>
            <span className="text-xs ml-2" style={{ color: '#64748b' }}>{domain.weight}</span>
          </div>
        </div>
        <h1 className="text-xl font-bold mb-1" style={{ color: '#e2e8f0' }}>{chapter.title}</h1>
        <p className="text-sm" style={{ color: '#94a3b8' }}>{chapter.location}</p>
        <p className="text-xs mt-1" style={{ color: '#64748b' }}>{domain.name}</p>

        {progress?.domain_conquered && (
          <div className="mt-3 px-3 py-1.5 rounded-lg inline-flex items-center gap-2" style={{ background: `${color}11`, border: `1px solid ${color}33` }}>
            <span className="text-sm">🏆</span>
            <span className="text-xs font-bold" style={{ color }}>DOMAIN CONQUERED</span>
          </div>
        )}
      </div>

      {/* Timeline */}
      <div className="space-y-3">
        {ACT_TIMELINE.map((item, i) => {
          const unlocked = isActUnlocked(item.key, progressData);
          const completed = isActCompleted(item.key, progressData);
          const actData = item.actNumber > 0 ? getActData(domainId, item.actNumber) : null;
          const hasContent = item.isQuiz || actData !== null;

          // Determine link
          let href = '';
          if (item.isQuiz) {
            href = `/app/story/${domainId}/${item.key}`;
          } else {
            href = `/app/story/${domainId}/${item.actNumber}`;
          }

          // Quiz details
          const quizDetail = item.key === 'field-test'
            ? `15Q | 22 Min | 70% to Pass${progress?.field_test_best_score ? ` | Best: ${progress.field_test_best_score}%` : ''}`
            : item.key === 'boss-battle'
              ? `30Q | 45 Min | 70% to Pass${progress?.boss_battle_best_score ? ` | Best: ${progress.boss_battle_best_score}%` : ''}`
              : '';

          return (
            <div key={item.key} className="relative">
              {/* Connecting line */}
              {i > 0 && (
                <div
                  className="absolute left-5 -top-3 w-0.5 h-3"
                  style={{ background: completed ? color : '#1e2d4a' }}
                />
              )}

              <div
                className="rounded-xl p-4 flex items-center gap-4 transition-all"
                style={{
                  background: completed ? `${color}08` : '#111a2e',
                  border: `1px solid ${completed ? color + '44' : '#1e2d4a'}`,
                  opacity: unlocked ? 1 : 0.5,
                }}
              >
                {/* Status circle */}
                <div
                  className="w-10 h-10 rounded-full flex items-center justify-center shrink-0"
                  style={{
                    background: completed ? `${color}22` : '#0d1220',
                    border: `2px solid ${completed ? color : unlocked ? '#1e2d4a' : '#0d1220'}`,
                  }}
                >
                  {completed ? (
                    <span style={{ color }}>✓</span>
                  ) : item.isQuiz ? (
                    <span className="text-sm">{item.key === 'field-test' ? '⚔️' : '👹'}</span>
                  ) : (
                    <span className="text-xs font-bold" style={{ color: unlocked ? '#e2e8f0' : '#64748b' }}>{item.actNumber}</span>
                  )}
                </div>

                {/* Info */}
                <div className="flex-1 min-w-0">
                  <h3 className="text-sm font-bold" style={{ color: completed ? color : unlocked ? '#e2e8f0' : '#64748b' }}>
                    {item.label}
                  </h3>
                  {actData && (
                    <p className="text-xs truncate" style={{ color: '#64748b' }}>
                      {actData.title}
                      {actData.estimatedMinutes ? ` • ~${actData.estimatedMinutes} min` : ''}
                      {actData.conceptsCovered ? ` • ${actData.conceptsCovered.length} concepts` : ''}
                    </p>
                  )}
                  {item.isQuiz && (
                    <p className="text-xs" style={{ color: '#64748b' }}>{quizDetail}</p>
                  )}
                  {!hasContent && !item.isQuiz && (
                    <p className="text-xs" style={{ color: '#64748b' }}>Coming soon</p>
                  )}
                </div>

                {/* Action button */}
                {unlocked && (
                  <Link
                    href={href}
                    className="px-4 py-2 rounded-lg text-xs font-bold shrink-0 transition-all hover:opacity-90"
                    style={{
                      background: completed ? 'transparent' : color,
                      color: completed ? color : '#080c14',
                      border: completed ? `1px solid ${color}44` : 'none',
                    }}
                  >
                    {completed ? 'Replay' : hasContent ? 'Play' : 'Coming Soon'}
                  </Link>
                )}

                {!unlocked && (
                  <span className="text-xs shrink-0" style={{ color: '#64748b' }}>🔒</span>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
