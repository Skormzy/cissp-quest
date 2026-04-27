// Phase 2 leveling math. Pure functions, no IO.
// Curve: XP needed to advance from level N to N+1 is 100 * N^1.5, rounded.
// Tunable here; awardXp() in progression.ts derives current_level via levelForXp().

export interface RankBand {
  title: string;
  minLevel: number;
  maxLevel: number; // inclusive; Number.POSITIVE_INFINITY for the top band
}

export const RANK_BANDS: RankBand[] = [
  { title: 'Recruit',    minLevel: 1,  maxLevel: 5 },
  { title: 'Analyst',    minLevel: 6,  maxLevel: 10 },
  { title: 'Operative',  minLevel: 11, maxLevel: 15 },
  { title: 'Specialist', minLevel: 16, maxLevel: 20 },
  { title: 'Sentinel',   minLevel: 21, maxLevel: 25 },
  { title: 'Architect',  minLevel: 26, maxLevel: Number.POSITIVE_INFINITY },
];

// XP required to advance FROM level n TO level n+1.
function xpStep(n: number): number {
  if (n < 1) return 0;
  return Math.round(100 * Math.pow(n, 1.5));
}

// Cumulative XP to reach `level` (level 1 = 0 XP).
export function xpForLevel(level: number): number {
  if (level <= 1) return 0;
  let total = 0;
  for (let n = 1; n < level; n++) total += xpStep(n);
  return total;
}

// Level achieved with the given cumulative XP. Always >= 1.
export function levelForXp(xp: number): number {
  if (xp <= 0) return 1;
  let level = 1;
  let consumed = 0;
  // Cap iteration to avoid runaway if a bug ever feeds enormous XP.
  while (level < 100) {
    const step = xpStep(level);
    if (consumed + step > xp) break;
    consumed += step;
    level++;
  }
  return level;
}

export function rankForLevel(level: number): string {
  for (const band of RANK_BANDS) {
    if (level >= band.minLevel && level <= band.maxLevel) return band.title;
  }
  return RANK_BANDS[0].title;
}

export interface XpProgress {
  current: number;       // XP earned within the current level
  needed: number;        // XP required to clear the current level
  percentage: number;    // 0..100, rounded
  totalXp: number;       // raw input
  level: number;         // current level
  nextLevelTotal: number; // cumulative XP at start of next level
}

export function xpProgressToNext(xp: number): XpProgress {
  const safe = Math.max(0, xp);
  const level = levelForXp(safe);
  const floorXp = xpForLevel(level);
  const nextLevelTotal = xpForLevel(level + 1);
  const needed = nextLevelTotal - floorXp;
  const current = safe - floorXp;
  const percentage = needed === 0 ? 100 : Math.round((current / needed) * 100);
  return { current, needed, percentage, totalXp: safe, level, nextLevelTotal };
}

// How many levels remain until the user enters the next rank band.
// Returns null if already in the top band.
export function levelsToNextRank(level: number): { nextRank: string; levelsRemaining: number } | null {
  const currentBandIndex = RANK_BANDS.findIndex(
    (b) => level >= b.minLevel && level <= b.maxLevel,
  );
  if (currentBandIndex === -1 || currentBandIndex === RANK_BANDS.length - 1) return null;
  const nextBand = RANK_BANDS[currentBandIndex + 1];
  return { nextRank: nextBand.title, levelsRemaining: nextBand.minLevel - level };
}
