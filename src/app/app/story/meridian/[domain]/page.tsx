'use client';

import { useState, useCallback, useEffect, useRef } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAINS } from '@/lib/constants';
import { DOMAIN_COLORS } from '@/lib/story-constants';
import { getMeridianChapter } from '@/lib/story-content';
import { DomainChapter } from '@/lib/story-types-v2';
import VisualNovelEngineV2 from '@/components/story/VisualNovelEngineV2';
import { awardXpClient } from '@/lib/award-xp-client';
import { XP_REWARDS } from '@/lib/xp-rewards';

// ─── Progress persistence ─────────────────────────────────

const SCENE_STORAGE_KEY = (domainId: number) =>
  `meridian_progress_d${domainId}_scene`;

function loadSceneIndex(domainId: number): number {
  if (typeof window === 'undefined') return 0;
  const raw = localStorage.getItem(SCENE_STORAGE_KEY(domainId));
  return raw ? parseInt(raw, 10) || 0 : 0;
}

function saveSceneIndex(domainId: number, index: number): void {
  localStorage.setItem(SCENE_STORAGE_KEY(domainId), String(index));
}

function clearSceneIndex(domainId: number): void {
  localStorage.removeItem(SCENE_STORAGE_KEY(domainId));
}

// ─── Act gate (quiz requirement) ─────────────────────────

function ActGate({
  label,
  domainId,
  color,
  onContinue,
}: {
  label: string;
  domainId: number;
  color: string;
  onContinue: () => void;
}) {
  return (
    <div
      className="rounded-2xl p-8 text-center space-y-4"
      style={{ background: '#111a2e', border: `1px solid ${color}44` }}
    >
      <div className="text-5xl">⚔️</div>
      <h2 className="text-xl font-bold" style={{ color: '#e2e8f0' }}>
        {label}
      </h2>
      <p className="text-sm" style={{ color: '#94a3b8' }}>
        Complete a quick quiz to continue the story. 70% to pass.
      </p>
      <div className="flex gap-3 justify-center">
        <Link
          href={`/app/story/${domainId}/field-test`}
          className="px-6 py-2 rounded-lg text-sm font-bold transition-all hover:opacity-90"
          style={{ background: color, color: '#080c14' }}
        >
          Take Field Test
        </Link>
        <button
          onClick={onContinue}
          className="px-6 py-2 rounded-lg text-sm font-bold border transition-all hover:opacity-80"
          style={{ borderColor: `${color}44`, color }}
        >
          Skip for now
        </button>
      </div>
    </div>
  );
}

// ─── Completion screen ────────────────────────────────────

function CompletionScreen({
  chapter,
  xpEarned,
  domainId,
  color,
}: {
  chapter: DomainChapter;
  xpEarned: number;
  domainId: number;
  color: string;
}) {
  const nextDomain = domainId < 8 ? domainId + 1 : null;
  return (
    <div
      className="rounded-2xl p-8 text-center space-y-5"
      style={{ background: '#111a2e', border: `1px solid ${color}44` }}
    >
      <div className="text-5xl">{chapter.locationEmoji}</div>
      <h2 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>
        Domain {domainId} Complete
      </h2>
      <p className="text-sm" style={{ color: '#94a3b8' }}>
        {chapter.domainName} — {chapter.location}
      </p>

      <div
        className="inline-block px-5 py-2 rounded-full text-base font-bold"
        style={{ background: 'rgba(255,215,0,0.1)', border: '1px solid #ffd70033', color: '#ffd700' }}
      >
        +{xpEarned} XP earned
      </div>

      <div className="flex gap-3 justify-center flex-wrap">
        <Link
          href={`/app/story/${domainId}/boss-battle`}
          className="px-6 py-2 rounded-lg text-sm font-bold transition-all hover:opacity-90"
          style={{ background: color, color: '#080c14' }}
        >
          Boss Battle
        </Link>
        {nextDomain && (
          <Link
            href={`/app/story/meridian/${nextDomain}`}
            className="px-6 py-2 rounded-lg text-sm font-bold border transition-all hover:opacity-80"
            style={{ borderColor: `${color}44`, color }}
          >
            Next Domain →
          </Link>
        )}
        <Link
          href="/app/story"
          className="px-6 py-2 rounded-lg text-sm font-bold border transition-all hover:opacity-80"
          style={{ borderColor: '#1e2d4a', color: '#94a3b8' }}
        >
          Story Hub
        </Link>
      </div>
    </div>
  );
}

// ─── Page ─────────────────────────────────────────────────

export default function MeridianDomainPage() {
  const params = useParams();
  const domainId = parseInt(params.domain as string);
  const { user, profile, updateXp } = useUserStore();

  const chapter = getMeridianChapter(domainId);
  const domain = DOMAINS.find((d) => d.id === domainId);
  const color = DOMAIN_COLORS[domainId] || '#00e8ff';

  const [initialSceneIndex] = useState(() => loadSceneIndex(domainId));
  const [xpTotal, setXpTotal] = useState(0);
  const [showActGate, setShowActGate] = useState(false);
  const [actGateLabel, setActGateLabel] = useState('Field Test');
  const [gatePassedSceneIndex, setGatePassedSceneIndex] = useState<number | null>(null);
  const [chapterComplete, setChapterComplete] = useState(false);

  // Save scene progress every 3 scenes via the onSceneComplete callback
  const sceneCountRef = useRef(0);

  const handleSceneComplete = useCallback(
    async (sceneId: string, sceneIndex: number) => {
      // Save progress
      saveSceneIndex(domainId, sceneIndex + 1);

      sceneCountRef.current += 1;

      // Act gate at scene 8 (index 7) and scene 15 (index 14)
      if (sceneIndex === 7 && !showActGate) {
        setActGateLabel('Field Test — Scene 8 Gate');
        setGatePassedSceneIndex(sceneIndex + 1);
        setShowActGate(true);
        return;
      }
      if (sceneIndex === 14 && !showActGate) {
        setActGateLabel('Boss Battle — Scene 15 Gate');
        setGatePassedSceneIndex(sceneIndex + 1);
        setShowActGate(true);
        return;
      }

      // Persist scene unlock to Supabase if user is logged in
      if (!user) return;
      const supabase = createClient();

      // Award SCENE_COMPLETED only on first unlock; replays don't re-pay.
      const { data: existing } = await supabase
        .from('scene_unlocks')
        .select('id')
        .eq('user_id', user.id)
        .eq('scene_id', sceneId)
        .maybeSingle();

      await supabase.from('scene_unlocks').upsert(
        {
          user_id: user.id,
          scene_id: sceneId,
          domain_number: domainId,
          act_number: 1, // Meridian chapters are all mapped to act 1 for progress tracking
        },
        { onConflict: 'user_id,scene_id' },
      );

      if (!existing) {
        await awardXpClient(XP_REWARDS.SCENE_COMPLETED, `meridian-scene:${sceneId}`);
      }
    },
    [domainId, user, showActGate],
  );

  const handleXPEarned = useCallback(
    (amount: number) => {
      setXpTotal((prev) => prev + amount);
      updateXp(amount);
    },
    [updateXp],
  );

  const handleChapterComplete = useCallback(async () => {
    clearSceneIndex(domainId);
    setChapterComplete(true);

    if (!user) return;
    const supabase = createClient();

    // Domain conquered — fire DOMAIN_UNLOCKED. The xpTotal accumulator was
    // historically written to legacy users.xp; it's now superseded by
    // awardXp grants fired at each scene unlock.
    await awardXpClient(XP_REWARDS.DOMAIN_UNLOCKED, `meridian-domain-complete:d${domainId}`);

    // Mark domain as having the Meridian chapter completed
    const { data: existing } = await supabase
      .from('story_progress')
      .select('current_act')
      .eq('user_id', user.id)
      .eq('domain_number', domainId)
      .maybeSingle();

    if (existing) {
      await supabase
        .from('story_progress')
        .update({
          act1_completed: true,
          act2_completed: true,
          act4_completed: true,
          current_act: 5,
          updated_at: new Date().toISOString(),
        })
        .eq('user_id', user.id)
        .eq('domain_number', domainId);
    } else {
      await supabase.from('story_progress').insert({
        user_id: user.id,
        domain_number: domainId,
        current_act: 5,
        act1_completed: true,
        act2_completed: true,
        act4_completed: true,
        field_test_passed: false,
        field_test_score: null,
        field_test_best_score: null,
        field_test_attempts: 0,
        boss_battle_passed: false,
        boss_battle_score: null,
        boss_battle_best_score: null,
        boss_battle_attempts: 0,
        domain_conquered: false,
        conquered_at: null,
        total_time_spent_minutes: 0,
      });
    }
  }, [domainId, user, xpTotal]);

  // ── Error states ─────────────────────────────────────────

  if (domainId < 1 || domainId > 8 || !domain) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">🔒</div>
        <p style={{ color: '#64748b' }}>Domain not found</p>
        <Link
          href="/app/story"
          className="text-sm mt-4 inline-block"
          style={{ color: '#00e8ff' }}
        >
          Back to Story Hub
        </Link>
      </div>
    );
  }

  if (!chapter) {
    return (
      <div className="max-w-2xl mx-auto text-center py-20">
        <Link
          href="/app/story"
          className="text-xs inline-flex items-center gap-1 mb-8"
          style={{ color: '#64748b' }}
        >
          ← Back to Story Hub
        </Link>
        <div className="text-5xl mb-4">🚧</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>
          Coming Soon
        </h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>
          The Meridian chapter for Domain {domainId}: {domain.name} is under
          development.
        </p>
        <Link
          href="/app/story"
          className="inline-block mt-6 px-6 py-2 rounded-lg text-sm font-bold hover:opacity-90"
          style={{ background: color, color: '#080c14' }}
        >
          Back to Story Hub
        </Link>
      </div>
    );
  }

  // ── Render ────────────────────────────────────────────────

  return (
    <div className="max-w-3xl mx-auto">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-3">
          <Link
            href="/app/story"
            className="text-xs inline-flex items-center gap-1"
            style={{ color: '#64748b' }}
          >
            ← Story Hub
          </Link>
          <span style={{ color: '#1e2d4a' }}>·</span>
          <Link
            href={`/app/story/${domainId}`}
            className="text-xs inline-flex items-center gap-1"
            style={{ color: '#64748b' }}
          >
            Domain Overview
          </Link>
        </div>
        <div className="flex items-center gap-2">
          <span
            className="text-xs font-bold px-2 py-1 rounded-full"
            style={{ background: `${color}22`, color }}
          >
            D{domainId} · Meridian
          </span>
          {xpTotal > 0 && (
            <span
              className="text-xs font-bold px-2 py-1 rounded-full"
              style={{ background: 'rgba(255,215,0,0.1)', color: '#ffd700' }}
            >
              +{xpTotal} XP
            </span>
          )}
        </div>
      </div>

      {/* Chapter title */}
      <div className="mb-6">
        <h1 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>
          {chapter.locationEmoji} {chapter.location}
        </h1>
        <p className="text-xs" style={{ color: '#64748b' }}>
          The Meridian Global Breach · Domain {domainId}: {chapter.domainName}
        </p>
      </div>

      {/* Chapter complete */}
      {chapterComplete && (
        <CompletionScreen
          chapter={chapter}
          xpEarned={xpTotal}
          domainId={domainId}
          color={color}
        />
      )}

      {/* Act gate */}
      {!chapterComplete && showActGate && (
        <ActGate
          label={actGateLabel}
          domainId={domainId}
          color={color}
          onContinue={() => setShowActGate(false)}
        />
      )}

      {/* Visual Novel Engine */}
      {!chapterComplete && !showActGate && (
        <VisualNovelEngineV2
          chapter={chapter}
          initialSceneIndex={
            gatePassedSceneIndex !== null
              ? gatePassedSceneIndex
              : initialSceneIndex
          }
          playerName={profile?.display_name || user?.character_name || 'Agent'}
          onSceneComplete={handleSceneComplete}
          onChapterComplete={handleChapterComplete}
          onXPEarned={handleXPEarned}
        />
      )}
    </div>
  );
}
