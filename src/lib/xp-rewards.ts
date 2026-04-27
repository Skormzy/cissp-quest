// Phase 2 XP reward constants. Single source of truth — every awardXp() caller
// must reference one of these instead of hard-coding a number.
// Tunable here without redeploying schema.

export const XP_REWARDS = {
  QUIZ_CORRECT_EASY:    10,
  QUIZ_CORRECT_MEDIUM:  20,
  QUIZ_CORRECT_HARD:    35,
  QUIZ_INCORRECT:       2,
  SCENE_COMPLETED:      50,
  DOMAIN_UNLOCKED:      200,
  TLATM_GAUNTLET_PASSED: 500,
} as const;

export type XpRewardKey = keyof typeof XP_REWARDS;

// Helper: pick reward for a quiz answer given correctness + difficulty.
export function quizReward(
  isCorrect: boolean,
  difficulty: 'easy' | 'medium' | 'hard',
): number {
  if (!isCorrect) return XP_REWARDS.QUIZ_INCORRECT;
  if (difficulty === 'easy')   return XP_REWARDS.QUIZ_CORRECT_EASY;
  if (difficulty === 'medium') return XP_REWARDS.QUIZ_CORRECT_MEDIUM;
  return XP_REWARDS.QUIZ_CORRECT_HARD;
}
