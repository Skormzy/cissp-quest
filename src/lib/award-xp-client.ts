'use client';

// Client-side wrapper for /api/progression/award. DRY entry point so every
// quiz/scene/gauntlet site posts XP through the same place — and so the
// level-up / rank-up toast UX lives in one file instead of 7.
//
// Server is the source of truth. Toast feedback fires only on a successful
// response. Failures are logged; the user sees no error toast (XP grants
// are non-critical UX).

import { toast } from 'sonner';
import { useUserStore } from '@/stores/useUserStore';

export interface AwardXpResponse {
  ok: boolean;
  newXp: number;
  newLevel: number;
  newRank: string;
  leveledUp: boolean;
  rankedUp: boolean;
  delta: number;
  reason: string;
}

export async function awardXpClient(
  amount: number,
  reason: string,
): Promise<AwardXpResponse | null> {
  if (!Number.isFinite(amount) || amount <= 0) return null;

  try {
    const res = await fetch('/api/progression/award', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ amount, reason }),
    });
    if (!res.ok) {
      console.warn('[awardXpClient] server returned', res.status);
      return null;
    }
    const data = (await res.json()) as AwardXpResponse;

    useUserStore.getState().applyProgression(data.newXp, data.newLevel, data.newRank);

    if (data.rankedUp) {
      toast.success(`Rank up! You are now ${data.newRank}`, {
        description: `Lv.${data.newLevel} · ${data.newXp.toLocaleString()} XP total`,
      });
    } else if (data.leveledUp) {
      toast.success(`Level up! Lv.${data.newLevel}`, {
        description: `${data.newXp.toLocaleString()} XP total`,
      });
    }

    return data;
  } catch (err) {
    console.warn('[awardXpClient] network error', err);
    return null;
  }
}
