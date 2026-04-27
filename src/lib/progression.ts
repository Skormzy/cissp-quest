// Phase 2 progression service. Single entry point for awarding XP.
// Every quiz/scene/gauntlet completion path goes through awardXp() so:
//   1. xp / current_level / rank_title stay in sync on every write
//   2. level-up + rank-up events are detectable for UI feedback
//   3. tuning happens in one place (see leveling.ts + xp-rewards.ts)
//   4. (NEW) idempotency is enforced at the database level via the
//      xp_grant_log table's UNIQUE(user_id, reason) constraint, so
//      Strict-Mode double-mount, scene-replay, and user click-mashing
//      cannot grant the same reward twice.

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

// Server-side XP grant. Idempotent on (userId, reason). The xp_grant_log
// row is inserted FIRST. If the unique constraint fires, the grant is a
// no-op (returns current xp/level with delta=0). Only on a successful log
// insert does player_profile get updated.
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

  // Zero-amount or no-op exit before touching the log.
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

  // Try to claim the grant. The UNIQUE(user_id, reason) constraint on
  // xp_grant_log is the idempotency gate. If it already exists, we DO NOT
  // pay out again, even if the client retries.
  const { error: logError } = await supabase
    .from('xp_grant_log')
    .insert({ user_id: userId, reason, amount: Math.round(amount) });

  if (logError) {
    const code = (logError as unknown as { code?: string }).code;
    // Postgres unique-violation is "23505". Treat as benign no-op.
    const isDuplicate =
      code === '23505' ||
      logError.message.toLowerCase().includes('duplicate') ||
      logError.message.toLowerCase().includes('unique');
    if (isDuplicate) {
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
    // Postgres "relation does not exist" is "42P01". Migration hasn't been
    // applied yet — fall through to the legacy non-idempotent behavior with
    // a warning so the app keeps working. Apply the migration to unlock the
    // idempotency gate.
    const isMissingTable =
      code === '42P01' ||
      logError.message.toLowerCase().includes('does not exist');
    if (!isMissingTable) {
      return { ok: false, error: logError.message };
    }
    console.warn(
      '[awardXp] xp_grant_log table missing - apply 20260427120000 migration to enable idempotency',
    );
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

  if (writeError) {
    // The log row was created but the profile update failed. Leave the
    // log row in place; on retry the duplicate-key check will short-circuit
    // back to a no-op so the user is not double-billed. We surface the
    // error so the client knows the grant was lost.
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
