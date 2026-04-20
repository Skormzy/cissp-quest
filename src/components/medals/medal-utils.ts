// Medal system utilities for CISSP Quest
// 8 domains × 4 tiers = 32 medals total

export type MedalTier = 'bronze' | 'silver' | 'gold' | 'platinum';

export interface MedalRequirement {
  tier: MedalTier;
  label: string;
  description: string;
  minScore: number;          // percentage (0–100)
  requiresPrestige?: boolean;
}

export const MEDAL_REQUIREMENTS: Record<MedalTier, MedalRequirement> = {
  bronze: {
    tier: 'bronze',
    label: 'Bronze',
    description: 'Complete the domain story and score ≥ 50% on the Field Test',
    minScore: 50,
  },
  silver: {
    tier: 'silver',
    label: 'Silver',
    description: 'Score ≥ 70% on the Boss Battle',
    minScore: 70,
  },
  gold: {
    tier: 'gold',
    label: 'Gold',
    description: 'Score ≥ 85% on the Boss Battle',
    minScore: 85,
  },
  platinum: {
    tier: 'platinum',
    label: 'Platinum',
    description: 'Score ≥ 95% OR complete Prestige Mode for this domain',
    minScore: 95,
    requiresPrestige: true,
  },
};

export const MEDAL_TIERS: MedalTier[] = ['bronze', 'silver', 'gold', 'platinum'];

export const MEDAL_COLORS: Record<MedalTier, { fill: string; stroke: string; glow: string }> = {
  bronze:   { fill: '#cd7f32', stroke: '#8B4513', glow: 'rgba(205, 127, 50, 0.4)'  },
  silver:   { fill: '#C0C0C0', stroke: '#808080', glow: 'rgba(192, 192, 192, 0.4)' },
  gold:     { fill: '#ffd700', stroke: '#b8860b', glow: 'rgba(255, 215, 0, 0.4)'   },
  platinum: { fill: '#e5e4e2', stroke: '#9ca3af', glow: 'rgba(229, 228, 226, 0.5)' },
};

/**
 * Determine if a given score earns a specific medal tier.
 * For platinum, prestige flag is an alternative path.
 */
export function getMedalForScore(
  score: number,
  tier: MedalTier,
  completedPrestige = false,
): boolean {
  const req = MEDAL_REQUIREMENTS[tier];
  if (tier === 'platinum' && completedPrestige) return true;
  return score >= req.minScore;
}

/**
 * Given a domain's current best score and prestige status, return
 * which tiers have been earned.
 */
export function getEarnedMedals(
  bestScore: number,
  completedPrestige = false,
): Record<MedalTier, boolean> {
  return {
    bronze:   getMedalForScore(bestScore, 'bronze', completedPrestige),
    silver:   getMedalForScore(bestScore, 'silver', completedPrestige),
    gold:     getMedalForScore(bestScore, 'gold', completedPrestige),
    platinum: getMedalForScore(bestScore, 'platinum', completedPrestige),
  };
}

/**
 * Returns the next medal tier the user hasn't yet earned,
 * plus the score needed to achieve it.
 */
export function getNextMedalRequirement(
  bestScore: number,
  completedPrestige = false,
): { tier: MedalTier; pointsNeeded: number; requirement: MedalRequirement } | null {
  for (const tier of MEDAL_TIERS) {
    const earned = getMedalForScore(bestScore, tier, completedPrestige);
    if (!earned) {
      const req = MEDAL_REQUIREMENTS[tier];
      return {
        tier,
        pointsNeeded: Math.max(0, req.minScore - bestScore),
        requirement: req,
      };
    }
  }
  return null; // All medals earned
}

/**
 * Returns the highest earned tier for a given score.
 */
export function getHighestEarnedTier(
  bestScore: number,
  completedPrestige = false,
): MedalTier | null {
  let highest: MedalTier | null = null;
  for (const tier of MEDAL_TIERS) {
    if (getMedalForScore(bestScore, tier, completedPrestige)) {
      highest = tier;
    }
  }
  return highest;
}

/**
 * Domain initial letters for medal center display.
 */
export const DOMAIN_INITIALS: Record<number, string> = {
  1: 'R',  // Risk
  2: 'A',  // Asset
  3: 'E',  // Engineering
  4: 'N',  // Network
  5: 'I',  // Identity
  6: 'T',  // Testing
  7: 'O',  // Operations
  8: 'S',  // Software
};
