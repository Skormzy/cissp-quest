import { XP_VALUES, GRADES } from './constants';

export function calculateLevel(xp: number): number {
  return Math.floor(1 + Math.sqrt(xp / 100));
}

export function xpForLevel(level: number): number {
  return Math.pow(level - 1, 2) * 100;
}

export function xpToNextLevel(currentXp: number): { current: number; needed: number; progress: number } {
  const currentLevel = calculateLevel(currentXp);
  const currentLevelXp = xpForLevel(currentLevel);
  const nextLevelXp = xpForLevel(currentLevel + 1);
  const progress = ((currentXp - currentLevelXp) / (nextLevelXp - currentLevelXp)) * 100;
  return {
    current: currentXp - currentLevelXp,
    needed: nextLevelXp - currentLevelXp,
    progress: Math.min(progress, 100),
  };
}

export function calculateQuestionXp(
  difficulty: 'easy' | 'medium' | 'hard',
  isCorrect: boolean,
  streak: number,
  timeSpent: number
): { baseXp: number; streakBonus: number; speedBonus: number; isCriticalHit: boolean; totalXp: number } {
  if (!isCorrect) {
    return { baseXp: XP_VALUES.wrong, streakBonus: 0, speedBonus: 0, isCriticalHit: false, totalXp: XP_VALUES.wrong };
  }

  const baseXp = XP_VALUES[difficulty];
  const streakBonus = streak >= XP_VALUES.streakStart ? (streak - XP_VALUES.streakStart + 1) * XP_VALUES.streakBonus : 0;
  const speedBonus = timeSpent <= XP_VALUES.speedThreshold ? XP_VALUES.speedBonus : 0;
  const isCriticalHit = Math.random() < XP_VALUES.criticalHitChance;

  let totalXp = baseXp + streakBonus + speedBonus;
  if (isCriticalHit) {
    totalXp *= XP_VALUES.criticalHitMultiplier;
  }

  return { baseXp, streakBonus, speedBonus, isCriticalHit, totalXp };
}

export function getGrade(accuracy: number): { grade: string; color: string } {
  const pct = accuracy * 100;
  for (const g of GRADES) {
    if (pct >= g.min) return g;
  }
  return GRADES[GRADES.length - 1];
}

export function getTitleForLevel(level: number): string {
  if (level >= 50) return 'CISSP Legend';
  if (level >= 40) return 'Security Architect';
  if (level >= 30) return 'Senior Analyst';
  if (level >= 20) return 'Cyber Specialist';
  if (level >= 15) return 'Security Analyst';
  if (level >= 10) return 'Field Agent';
  if (level >= 7) return 'Junior Agent';
  if (level >= 5) return 'Trainee';
  if (level >= 3) return 'Recruit';
  return 'Rookie';
}
