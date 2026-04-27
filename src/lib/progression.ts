// Phase 2 progression service. Single entry point for awarding XP.
// Every quiz/scene/gauntlet completion path goes through awardXp() so:
//   1. xp / current_level / rank_title stay in sync on every write
//   2. level-up + rank-up events are detectable for UI feedback
//   3. tuning happens in one place (see leveling.ts + xp-rewards.ts)

import { createClient } from '@/lib/supabase/server';
import { levelForXp, rankForLevel } from '@/lib/leveling';

export interface AwardXpResult {
  newXp: number;
  newLevel: number;
  newRank: string;
  leveledUp: boolean;
  rankedUp: boolean;
  delta: number;
  reason: string;
}

export interface AwardXpError {
  ok: false;
  error: string;
}

export interface AwardXpSuccess extends AwardXpResult {
  ok: true;
}

export type AwardXpReturn = AwardXpSuccess | AwardXpError;

// Server-side XP grant. Reads current xp from player_profile, computes
// new level/rank, writes all three back atomically. Caller passes a `reason`
// (e.g. 'quiz:correct:hard', 'scene:completed:domain-2:act-3') for audit.
export async function awardXp(
  userId: string,
  amount: number,
  reason: string,
): Promise<AwardXpReturn> {
  if (!userId) return { ok: false, error: 'awardXp: userId required' };
  if (!Number.isFinite(amount) || amount < 0) {
    return { ok: false, error: `awardXp: invalid amount ${amount}` };
  }
  if (amount === 0) {
    // No-op grants happen (e.g. reward 0 for some reason). Read-only return.
    const supabase = await createClient();
    const { data, error } = await supabase
      .from('player_profile')
      .select('xp, current_level, rank_title')
      .eq('user_id', userId)
      .single();
    if (error || !data) return { ok: false, error: error?.message ?? 'profile not found' };
    return {
      ok: true,
      newXp: data.xp,
      newLevel: data.current_level,
      newRank: data.rank_title,
      leveledUp: false,
      rankedUp: false,
      delta: 0,
      reason,
    };
  }

  const supabase = await createClient();

  const { data: existing, error: readError } = await supabase
    .from('player_profile')
    .select('xp, current_level, rank_title')
    .eq('user_id', userId)
    .single();

  if (readError || !existing) {
    return { ok: false, error: readError?.message ?? 'profile not found' };
  }

  const oldXp = existing.xp ?? 0;
  const oldLevel = existing.current_level ?? 1;
  const oldRank = existing.rank_title ?? 'Recruit';

  const newXp = oldXp + Math.round(amount);
  const newLevel = levelForXp(newXp);
  const newRank = rankForLevel(newLevel);

  const { error: writeError } = await supabase
    .from('player_profile')
    .update({
      xp: newXp,
      current_level: newLevel,
      rank_title: newRank,
      updated_at: new Date().toISOString(),
    })
    .eq('user_id', userId);

  if (writeError) {
    return { ok: false, error: writeError.message };
  }

  return {
    ok: true,
    newXp,
    newLevel,
    newRank,
    leveledUp: newLevel > oldLevel,
    rankedUp: newRank !== oldRank,
    delta: Math.round(amount),
    reason,
  };
}
