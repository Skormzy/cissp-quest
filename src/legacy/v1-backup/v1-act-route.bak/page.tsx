'use client';

import { useState, useCallback } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAINS } from '@/lib/constants';
import { DOMAIN_COLORS, ACT_XP_REWARDS } from '@/lib/story-constants';
import { getActData } from '@/data/story';
import VisualNovelEngine from '@/components/story/VisualNovelEngine';
import { awardXpClient } from '@/lib/award-xp-client';
import { XP_REWARDS } from '@/lib/xp-rewards';

function getProgressKey(domainId: number, actNumber: number) {
  return `story_progress_d${domainId}_act${actNumber}_node`;
}

function loadSavedNodeIndex(domainId: number, actNumber: number): number {
  if (typeof window === 'undefined') return 0;
  const saved = localStorage.getItem(getProgressKey(domainId, actNumber));
  return saved ? parseInt(saved, 10) || 0 : 0;
}

export default function ActPlayerPage() {
  const params = useParams();
  const domainId = parseInt(params.domain as string);
  const actNumber = parseInt(params.act as string);
  const { user, updateXp } = useUserStore();
  const supabase = createClient();

  const [completed, setCompleted] = useState(false);
  const [xpAwarded, setXpAwarded] = useState(0);
  const [initialNodeIndex] = useState(() => loadSavedNodeIndex(domainId, actNumber));

  const domain = DOMAINS.find((d) => d.id === domainId);
  const actData = getActData(domainId, actNumber);
  const color = DOMAIN_COLORS[domainId] || '#00e8ff';

  // Validate params
  if (domainId < 1 || domainId > 8 || ![1, 2, 4].includes(actNumber) || !domain) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">🔒</div>
        <p style={{ color: '#64748b' }}>Invalid act</p>
        <Link href="/app/story" className="text-sm mt-4 inline-block" style={{ color: '#00e8ff' }}>Back to Story Hub</Link>
      </div>
    );
  }

  // Coming soon for acts without content
  if (!actData) {
    return (
      <div className="max-w-2xl mx-auto text-center py-20">
        <Link href={`/app/story/${domainId}`} className="text-xs inline-flex items-center gap-1 mb-8" style={{ color: '#64748b' }}>
          ← Back to Chapter
        </Link>
        <div className="text-5xl mb-4">🚧</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Coming Soon</h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>
          Act {actNumber} for Domain {domainId}: {domain.name} is under development.
        </p>
        <Link
          href={`/app/story/${domainId}`}
          className="inline-block mt-6 px-6 py-2 rounded-lg text-sm font-bold transition-all hover:opacity-90"
          style={{ background: color, color: '#080c14' }}
        >
          Back to Chapter
        </Link>
      </div>
    );
  }

  const handleNodeChange = useCallback((index: number) => {
    localStorage.setItem(getProgressKey(domainId, actNumber), String(index));
  }, [domainId, actNumber]);

  const handleSceneComplete = async (sceneId: string) => {
    if (!user) return;
    // Award SCENE_COMPLETED only on the FIRST unlock of this scene; replays
    // are tracked via replay_count separately and do not re-pay XP.
    const { data: existing } = await supabase
      .from('scene_unlocks')
      .select('id')
      .eq('user_id', user.id)
      .eq('scene_id', sceneId)
      .maybeSingle();

    await supabase.from('scene_unlocks').upsert({
      user_id: user.id,
      scene_id: sceneId,
      domain_number: domainId,
      act_number: actNumber,
    }, { onConflict: 'user_id,scene_id' });

    if (!existing) {
      await awardXpClient(XP_REWARDS.SCENE_COMPLETED, `scene:${sceneId}`);
    }
  };

  const handleActComplete = async () => {
    if (!user) return;
    const xpReward = ACT_XP_REWARDS[actNumber] || 100;

    // Read current progress (maybeSingle avoids error when no row exists)
    const { data: existing } = await supabase
      .from('story_progress')
      .select('current_act')
      .eq('user_id', user.id)
      .eq('domain_number', domainId)
      .maybeSingle();

    const nextAct = Math.max(existing?.current_act || 1, actNumber + 1);

    let dbError: unknown = null;

    if (existing) {
      // Row exists — update only the relevant fields
      const { error } = await supabase
        .from('story_progress')
        .update({
          act1_completed: actNumber === 1 ? true : undefined,
          act2_completed: actNumber === 2 ? true : undefined,
          act4_completed: actNumber === 4 ? true : undefined,
          current_act: nextAct,
          updated_at: new Date().toISOString(),
        })
        .eq('user_id', user.id)
        .eq('domain_number', domainId);
      dbError = error;
    } else {
      // No row yet — insert with ALL required columns and proper defaults
      const { error } = await supabase
        .from('story_progress')
        .insert({
          user_id: user.id,
          domain_number: domainId,
          current_act: nextAct,
          act1_completed: actNumber === 1,
          act2_completed: actNumber === 2,
          act4_completed: actNumber === 4,
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
      dbError = error;
    }

    if (dbError) {
      console.error('[Story] Failed to save act completion:', dbError);
      // Still show completion — the XP and UX should not block on a transient DB error.
      // The next act page will re-check the gate anyway.
    }

    // Award XP via awardXp service (player_profile is canonical).
    // Final act of the domain (act 4) fires DOMAIN_UNLOCKED; earlier acts fire
    // SCENE_COMPLETED as a per-act milestone. xpReward retained for the local
    // popup/animation totals only — it no longer writes to legacy users.xp.
    const reward =
      actNumber === 4 ? XP_REWARDS.DOMAIN_UNLOCKED : XP_REWARDS.SCENE_COMPLETED;
    const reason =
      actNumber === 4
        ? `domain-unlocked:d${domainId}`
        : `act-complete:d${domainId}:act${actNumber}`;
    await awardXpClient(reward, reason);
    updateXp(xpReward);

    // Clear saved progress since act is complete
    localStorage.removeItem(getProgressKey(domainId, actNumber));

    setXpAwarded(xpReward);
    setCompleted(true);
  };

  const playerName = user?.character_name || 'Agent';

  if (completed) {
    return (
      <div className="max-w-2xl mx-auto">
        <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: `1px solid ${color}44` }}>
          <div className="text-5xl mb-4">🎖️</div>
          <h2 className="text-2xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Act {actNumber} Complete!</h2>
          <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>{actData.title}</p>

          <div className="inline-block px-4 py-2 rounded-lg mb-6" style={{ background: 'rgba(255, 215, 0, 0.1)', border: '1px solid #ffd70033' }}>
            <span className="text-lg font-bold" style={{ color: '#ffd700' }}>+{xpAwarded} XP</span>
          </div>

          <div className="flex gap-3 justify-center">
            <Link
              href={`/app/story/${domainId}`}
              className="px-6 py-2 rounded-lg text-sm font-bold transition-all hover:opacity-90"
              style={{ background: color, color: '#080c14' }}
            >
              Back to Chapter
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-3xl mx-auto">
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <Link href={`/app/story/${domainId}`} className="text-xs inline-flex items-center gap-1" style={{ color: '#64748b' }}>
          ← Back to Chapter
        </Link>
        <div className="flex items-center gap-2">
          <span className="text-xs font-bold px-2 py-0.5 rounded-full" style={{ background: `${color}22`, color }}>
            D{domainId} Act {actNumber}
          </span>
        </div>
      </div>

      {/* Act title */}
      <div className="mb-4">
        <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>{actData.title}</h2>
        <p className="text-xs" style={{ color: '#64748b' }}>{actData.description}</p>
      </div>

      {/* Visual Novel Engine */}
      <VisualNovelEngine
        scenes={actData.nodes}
        playerName={playerName}
        onSceneComplete={handleSceneComplete}
        onActComplete={handleActComplete}
        domainId={domainId}
        actNumber={actNumber}
        initialNodeIndex={initialNodeIndex}
        onNodeChange={handleNodeChange}
      />
    </div>
  );
}
