'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import CharacterAvatar from '@/components/character/CharacterAvatar';
import { xpToNextLevel, getTitleForLevel } from '@/lib/xp';
import { CHAPTERS, DOMAINS, ACHIEVEMENTS } from '@/lib/constants';
import { StoryModeProgress, SpacedRepetitionSchedule } from '@/lib/story-types';
import { getDomainStatus } from '@/lib/story-constants';

export default function DashboardPage() {
  const { user } = useUserStore();
  const [stats, setStats] = useState({ totalAnswered: 0, accuracy: 0, dueReviews: 0 });
  const [storyProgress, setStoryProgress] = useState<Record<number, StoryModeProgress>>({});
  const [earnedBadges, setEarnedBadges] = useState<string[]>([]);
  const [reviewNudges, setReviewNudges] = useState<SpacedRepetitionSchedule[]>([]);
  const supabase = createClient();

  useEffect(() => {
    if (!user) return;

    const loadStats = async () => {
      // Load answer stats
      const { data: answers } = await supabase
        .from('user_answers')
        .select('is_correct')
        .eq('user_id', user.id);

      if (answers) {
        const total = answers.length;
        const correct = answers.filter((a) => a.is_correct).length;
        setStats((s) => ({
          ...s,
          totalAnswered: total,
          accuracy: total > 0 ? Math.round((correct / total) * 100) : 0,
        }));
      }

      // Load story mode progress
      const { data: progress } = await supabase
        .from('story_progress')
        .select('*')
        .eq('user_id', user.id);

      if (progress) {
        const map: Record<number, StoryModeProgress> = {};
        progress.forEach((p: StoryModeProgress) => { map[p.domain_number] = p; });
        setStoryProgress(map);
      }

      // Load achievements
      const { data: badges } = await supabase
        .from('achievements')
        .select('badge_id')
        .eq('user_id', user.id);

      if (badges) {
        setEarnedBadges(badges.map((b) => b.badge_id));
      }

      // Load due reviews count
      const today = new Date().toISOString().split('T')[0];
      const { count } = await supabase
        .from('user_question_schedule')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', user.id)
        .lte('next_review', today);

      setStats((s) => ({ ...s, dueReviews: count || 0 }));

      // Load spaced repetition nudges
      const now = new Date().toISOString();
      const { data: nudges } = await supabase
        .from('spaced_repetition_schedule')
        .select('*')
        .eq('user_id', user.id)
        .eq('nudge_dismissed', false)
        .lte('next_review_at', now)
        .limit(5);

      if (nudges) {
        setReviewNudges(nudges);
      }
    };

    loadStats();
  }, [user]);

  if (!user) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading dashboard...</p>
        </div>
      </div>
    );
  }

  const levelProgress = xpToNextLevel(user.xp);
  const title = getTitleForLevel(user.level);

  // Find next uncompleted domain
  const nextChapter = CHAPTERS.find((ch) => !storyProgress[ch.domainId]?.domain_conquered);
  // Check if ALL 8 domains are conquered
  const allChaptersComplete = CHAPTERS.every((ch) => storyProgress[ch.domainId]?.domain_conquered);
  const completedCount = CHAPTERS.filter((ch) => storyProgress[ch.domainId]?.domain_conquered).length;

  // Find current in-progress chapter
  const currentInProgress = CHAPTERS.find((ch) => {
    const p = storyProgress[ch.domainId];
    return p && !p.domain_conquered;
  });

  return (
    <div className="space-y-6">
      {/* Character Header */}
      <div className="rounded-xl p-6 flex flex-col sm:flex-row items-center gap-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <CharacterAvatar
          skin={user.character_skin}
          hair={user.character_hair}
          hairColor={user.character_hair_color}
          gender={user.character_gender || 'Male'}
          outfit={user.character_outfit}
          size={100}
        />
        <div className="text-center sm:text-left flex-1">
          <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>{user.character_name}</h1>
          <p className="text-sm mb-3" style={{ color: '#00e8ff' }}>{title}</p>
          {/* Level Progress */}
          <div className="flex items-center gap-3">
            <span className="text-xs font-bold" style={{ color: '#ffd700' }}>Lv.{user.level}</span>
            <div className="flex-1 h-3 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
              <div
                className="h-full rounded-full transition-all"
                style={{ width: `${levelProgress.progress}%`, background: 'linear-gradient(90deg, #00e8ff, #00b8cc)' }}
              />
            </div>
            <span className="text-xs" style={{ color: '#64748b' }}>{levelProgress.current}/{levelProgress.needed} XP</span>
          </div>
        </div>
      </div>

      {/* Stats Row */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
        {[
          { label: 'Total XP', value: user.xp.toLocaleString(), icon: '⚡', color: '#ffd700' },
          { label: 'Streak', value: `${user.streak_count} days`, icon: '🔥', color: '#f97316' },
          { label: 'Accuracy', value: `${stats.accuracy}%`, icon: '🎯', color: '#22c55e' },
          { label: 'Answered', value: stats.totalAnswered.toString(), icon: '📝', color: '#06b6d4' },
        ].map((stat, i) => (
          <div key={i} className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-2xl mb-1">{stat.icon}</div>
            <div className="text-lg font-bold" style={{ color: stat.color }}>{stat.value}</div>
            <div className="text-xs" style={{ color: '#64748b' }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {/* Story Mode Progress Card */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #00e8ff33', boxShadow: '0 0 20px rgba(0, 232, 255, 0.05)' }}>
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Operation Shadow Protocol</h2>
            <span className="text-xs" style={{ color: '#64748b' }}>{completedCount}/8 Domains Conquered</span>
          </div>
          <Link
            href="/app/story"
            className="px-3 py-1.5 rounded-lg text-xs font-bold"
            style={{ background: '#00e8ff22', color: '#00e8ff', border: '1px solid #00e8ff33' }}
          >
            Story Hub
          </Link>
        </div>

        {/* Progress bar */}
        <div className="h-2 rounded-full overflow-hidden mb-4" style={{ background: '#0d1220' }}>
          <div
            className="h-full rounded-full transition-all"
            style={{ width: `${(completedCount / 8) * 100}%`, background: 'linear-gradient(90deg, #00e8ff, #22c55e)' }}
          />
        </div>

        {/* Current chapter in progress */}
        {currentInProgress && (
          <Link
            href={`/app/story/${currentInProgress.domainId}`}
            className="flex items-center gap-3 p-3 rounded-lg transition-all hover:scale-[1.01]"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          >
            <span className="text-xl">{currentInProgress.emoji}</span>
            <div className="flex-1">
              <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>
                {currentInProgress.title}
              </div>
              <div className="text-xs" style={{ color: '#64748b' }}>
                {getDomainStatus(storyProgress[currentInProgress.domainId])} — {currentInProgress.location}
              </div>
            </div>
            <span className="text-xs font-bold px-3 py-1 rounded-lg" style={{ background: '#00e8ff', color: '#080c14' }}>
              Continue
            </span>
          </Link>
        )}

        {allChaptersComplete && (
          <Link
            href="/app/story/final"
            className="flex items-center gap-3 p-3 rounded-lg"
            style={{ background: 'rgba(255, 215, 0, 0.05)', border: '1px solid #ffd70033' }}
          >
            <span className="text-xl">🏆</span>
            <div className="flex-1">
              <div className="text-sm font-bold" style={{ color: '#ffd700' }}>Final Chapter Available</div>
              <div className="text-xs" style={{ color: '#94a3b8' }}>TLATM Gauntlet + Final Boss</div>
            </div>
            <span className="text-xs font-bold px-3 py-1 rounded-lg" style={{ background: '#ffd700', color: '#080c14' }}>
              Enter
            </span>
          </Link>
        )}
      </div>

      {/* Spaced Repetition Nudges */}
      {reviewNudges.length > 0 && (
        <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #f59e0b33' }}>
          <div className="flex items-center gap-2 mb-4">
            <span className="text-lg">🔄</span>
            <h2 className="text-lg font-bold" style={{ color: '#f59e0b' }}>Review Recommended</h2>
            <span className="text-xs px-1.5 py-0.5 rounded-full" style={{ background: '#f59e0b22', color: '#f59e0b' }}>
              {reviewNudges.length}
            </span>
          </div>
          <div className="space-y-2">
            {reviewNudges.map((nudge) => (
              <Link
                key={nudge.id}
                href={`/app/story/replay/${nudge.scene_id}?from=/app/dashboard`}
                className="flex items-center gap-3 p-3 rounded-lg transition-all hover:scale-[1.01]"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              >
                <div className="w-8 h-8 rounded-full flex items-center justify-center" style={{ background: '#f59e0b11', border: '1px solid #f59e0b33' }}>
                  <span className="text-xs" style={{ color: '#f59e0b' }}>🔄</span>
                </div>
                <div className="flex-1 min-w-0">
                  <div className="text-sm font-bold truncate" style={{ color: '#e2e8f0' }}>
                    {nudge.concept_name}
                  </div>
                  <div className="text-[10px]" style={{ color: '#64748b' }}>
                    Last reviewed: {new Date(nudge.last_reviewed_at).toLocaleDateString()}
                  </div>
                </div>
                <span className="text-xs" style={{ color: '#f59e0b' }}>Replay</span>
              </Link>
            ))}
          </div>
        </div>
      )}

      {/* World Map Progress */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>World Map</h2>
          <span className="text-xs" style={{ color: '#64748b' }}>{completedCount}/8 chapters complete</span>
        </div>
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
          {CHAPTERS.map((ch) => {
            const progress = storyProgress[ch.domainId] || null;
            const isComplete = progress?.domain_conquered;
            const isNext = nextChapter?.id === ch.id;
            const status = getDomainStatus(progress);

            return (
              <Link
                key={ch.id}
                href={`/app/story/${ch.domainId}`}
                className="rounded-lg p-3 text-center transition-all hover:scale-105"
                style={{
                  background: isComplete ? 'rgba(34, 197, 94, 0.1)' : isNext ? 'rgba(0, 232, 255, 0.1)' : '#0d1220',
                  border: `1px solid ${isComplete ? '#22c55e' : isNext ? '#00e8ff' : '#1e2d4a'}`,
                }}
              >
                <div className="text-2xl mb-1">{ch.emoji}</div>
                <div className="text-xs font-bold" style={{ color: isComplete ? '#22c55e' : isNext ? '#00e8ff' : '#94a3b8' }}>
                  D{ch.domainId}
                </div>
                <div className="text-[10px]" style={{ color: '#64748b' }}>{ch.location.split(',')[0]}</div>
                <div className="text-[10px] mt-0.5" style={{ color: isComplete ? '#22c55e' : '#64748b' }}>
                  {status}
                </div>
              </Link>
            );
          })}
        </div>
      </div>

      {/* Action Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {/* Continue Story */}
        {nextChapter && (
          <Link
            href="/app/story"
            className="rounded-xl p-6 transition-all hover:scale-[1.02]"
            style={{ background: 'linear-gradient(135deg, #111a2e, #1a2540)', border: '1px solid #00e8ff', boxShadow: '0 0 20px rgba(0, 232, 255, 0.1)' }}
          >
            <div className="text-3xl mb-2">🎬</div>
            <h3 className="font-bold mb-1" style={{ color: '#00e8ff' }}>Continue Story</h3>
            <p className="text-sm" style={{ color: '#94a3b8' }}>Operation Shadow Protocol</p>
            <p className="text-xs mt-1" style={{ color: '#64748b' }}>{completedCount}/8 domains conquered</p>
          </Link>
        )}

        {/* Quick Actions */}
        <div className="grid grid-cols-2 gap-3">
          <Link
            href="/app/quiz?mode=quick&count=10"
            className="rounded-xl p-4 text-center transition-all hover:scale-105"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
          >
            <div className="text-2xl mb-2">⚡</div>
            <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>Quick Quiz</div>
            <div className="text-xs" style={{ color: '#64748b' }}>10 questions</div>
          </Link>

          <Link
            href="/app/domains"
            className="rounded-xl p-4 text-center transition-all hover:scale-105"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
          >
            <div className="text-2xl mb-2">🗺️</div>
            <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>Study Domain</div>
            <div className="text-xs" style={{ color: '#64748b' }}>Pick a domain</div>
          </Link>

          <Link
            href="/app/quiz?mode=review"
            className="rounded-xl p-4 text-center transition-all hover:scale-105 relative"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
          >
            <div className="text-2xl mb-2">🔄</div>
            <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>Review</div>
            <div className="text-xs" style={{ color: '#64748b' }}>Weak areas</div>
            {stats.dueReviews > 0 && (
              <span className="absolute top-2 right-2 text-[10px] font-bold px-1.5 py-0.5 rounded-full" style={{ background: '#ef4444', color: 'white' }}>
                {stats.dueReviews}
              </span>
            )}
          </Link>

          <Link
            href="/app/quiz/custom"
            className="rounded-xl p-4 text-center transition-all hover:scale-105"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
          >
            <div className="text-2xl mb-2">🎯</div>
            <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>Custom Quiz</div>
            <div className="text-xs" style={{ color: '#64748b' }}>Build your own</div>
          </Link>
        </div>
      </div>

      {/* Daily Challenges */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>Daily Challenges</h2>
        <div className="space-y-3">
          {[
            { task: 'Answer 10 questions', reward: '50 XP', icon: '📝', progress: Math.min(stats.totalAnswered, 10), max: 10 },
            { task: 'Read 3 library topics', reward: '30 XP', icon: '📖', progress: 0, max: 3 },
            { task: 'Get a 5-question streak', reward: '75 XP', icon: '🔥', progress: Math.min(user.streak_count, 5), max: 5 },
          ].map((challenge, i) => (
            <div key={i} className="flex items-center gap-3 p-3 rounded-lg" style={{ background: '#0d1220' }}>
              <span className="text-xl">{challenge.icon}</span>
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between mb-1">
                  <span className="text-sm" style={{ color: '#e2e8f0' }}>{challenge.task}</span>
                  <span className="text-xs font-medium" style={{ color: '#ffd700' }}>{challenge.reward}</span>
                </div>
                <div className="h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
                  <div
                    className="h-full rounded-full"
                    style={{ width: `${(challenge.progress / challenge.max) * 100}%`, background: '#00e8ff' }}
                  />
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Achievement Badges */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>Achievements</h2>
        <div className="grid grid-cols-4 sm:grid-cols-6 gap-3">
          {ACHIEVEMENTS.slice(0, 12).map((badge) => {
            const earned = earnedBadges.includes(badge.id);
            return (
              <div
                key={badge.id}
                className="text-center p-2 rounded-lg transition-all"
                style={{ opacity: earned ? 1 : 0.3 }}
                title={`${badge.name}: ${badge.description}`}
              >
                <div className="text-2xl mb-1">{badge.icon}</div>
                <div className="text-[10px]" style={{ color: earned ? '#ffd700' : '#64748b' }}>{badge.name}</div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
