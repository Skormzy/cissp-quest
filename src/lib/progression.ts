// Phase 2 progression service. Single entry point for awarding XP.
//
// Atomic via the award_xp_idempotent Postgres RPC (migration
// 20260427150000): the log insert + profile update happen in one
// transaction. No partial states, no double grants, no silent loss.
//
// If the RPC is missing (migration not applied yet), the code falls
// back to a non-idempotent legacy path with a clear console warning so
// the app still works in that one window.

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

interface RpcRow {
  new_xp: number;
  new_level: number;
  new_rank: string;
  delta: number;
  leveled_up: boolean;
  ranked_up: boolean;
  no_op: boolean;
}

export async function awardXp(
  userId: string,
  amount: number,
  reason: string,
): Promise<AwardXpReturn> {
  if (!userId) return { ok: false, error: 'awardXp: userId required' };
  if (!Number.isFinite(amount) || amount < 0) {
    return { ok: false, error: `awardXp: invalid amount ${amount}` };
  }
  if (!reason || reason.length === 0 || reason.length > 200) {
    return { ok: false, error: 'awardXp: reason must be 1-200 chars' };
  }

  const supabase = await createClient();

  // Path A: atomic RPC.
  const { data, error } = await supabase.rpc('award_xp_idempotent', {
    p_user_id: userId,
    p_amount:  Math.round(amount),
    p_reason:  reason,
  });

  if (!error && Array.isArray(data) && data.length > 0) {
    const row = data[0] as RpcRow;
    return {
      ok: true,
      newXp: row.new_xp,
      newLevel: row.new_level,
      newRank: row.new_rank,
      leveledUp: row.leveled_up,
      rankedUp: row.ranked_up,
      delta: row.no_op ? 0 : row.delta,
      reason,
    };
  }

  // Path B: RPC missing (migration not applied yet). Fall through to a
  // legacy single-query update so the app still works.
  const code = error ? (error as unknown as { code?: string }).code : undefined;
  const isMissingRpc =
    code === '42883' ||
    code === '42P01' ||
    (error?.message?.toLowerCase().includes('does not exist') ?? false);

  if (error && !isMissingRpc) {
    return { ok: false, error: error.message };
  }

  if (isMissingRpc) {
    console.warn(
      '[awardXp] award_xp_idempotent RPC missing - apply 20260427150000 migration. Falling back to legacy non-atomic path.',
    );
  }

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

  if (amount === 0) {
    return {
      ok: true,
      newXp: oldXp,
      newLevel: oldLevel,
      newRank: oldRank,
      leveledUp: false,
      rankedUp: false,
      delta: 0,
      reason,
    };
  }

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

  if (writeError) return { ok: false, error: writeError.message };

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
