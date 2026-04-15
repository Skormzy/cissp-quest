// ═══════════════════════════════════════════════════════════
// IRT Parameter Assignment — Default Parameters
// Assigns initial IRT parameters (a, b, c) to questions
// before empirical calibration data is available
// ═══════════════════════════════════════════════════════════

import { IRTParameters, CognitiveLevel, QuestionType } from './irt-engine';

// ─── Difficulty Ratings ──────────────────────────────────

export type DifficultyRating = 'easy' | 'medium' | 'hard' | 'very_hard';

// Base difficulty (b parameter) by difficulty rating
// Maps to the IRT difficulty scale: -3.0 to +3.0
const DIFFICULTY_BASE: Record<DifficultyRating, number> = {
  easy:      -1.5,   // Below average ability needed
  medium:     0.0,   // Average ability needed
  hard:       1.5,   // Above average ability needed
  very_hard:  2.5,   // Very high ability needed
};

// ─── Cognitive Level Adjustments ─────────────────────────
// Higher cognitive levels = harder + more discriminating

const COGNITIVE_DIFFICULTY_OFFSET: Record<CognitiveLevel, number> = {
  remember:    -0.5,  // Recognition/recall is easier
  understand:   0.0,  // Baseline
  apply:        0.3,  // Application requires transfer
  analyze:      0.6,  // Analysis requires decomposition
};

const COGNITIVE_DISCRIMINATION: Record<CognitiveLevel, number> = {
  remember:    0.8,   // Low discrimination — many can recall
  understand:  1.0,   // Baseline discrimination
  apply:       1.3,   // Better separates ability levels
  analyze:     1.5,   // High discrimination — only experts do well
};

// ─── Question Type Adjustments ───────────────────────────
// Some question formats are inherently more discriminating

const TYPE_DISCRIMINATION_MODIFIER: Record<QuestionType, number> = {
  definition:    -0.3,  // Simple recall, low discrimination
  best_answer:    0.0,  // Baseline
  scenario:       0.2,  // Scenarios require application
  first_action:   0.2,  // Prioritization requires judgment
  most_likely:    0.1,  // Probability judgment
  except_not:    -0.1,  // Reversed logic can confuse at all levels
  comparison:     0.1,  // Comparing concepts
  calculation:    0.3,  // Precise knowledge required
  tlatm:          0.4,  // Manager perspective — high discrimination
};

const TYPE_DIFFICULTY_MODIFIER: Record<QuestionType, number> = {
  definition:    -0.3,  // Definitions are usually easier
  best_answer:    0.0,  // Baseline
  scenario:       0.2,  // Context adds complexity
  first_action:   0.3,  // Ordering adds difficulty
  most_likely:    0.1,  // Slight increase
  except_not:     0.2,  // Reversal adds cognitive load
  comparison:     0.1,  // Slight increase
  calculation:    0.4,  // Calculations are harder
  tlatm:          0.5,  // Manager perspective is hardest
};

// ─── Pseudo-Guessing (c parameter) ──────────────────────
// For 4-option MCQ, theoretical random = 0.25
// We reduce slightly based on distractor quality assumptions

const GUESSING_BASE = 0.25;    // 4-option MCQ theoretical floor

const GUESSING_BY_TYPE: Record<QuestionType, number> = {
  definition:    0.22,  // Better distractors possible for definitions
  best_answer:   0.20,  // All options plausible reduces guessing
  scenario:      0.20,  // Complex scenarios reduce random success
  first_action:  0.20,  // Prioritization harder to guess
  most_likely:   0.22,  // Some elimination possible
  except_not:    0.25,  // Negation makes guessing more likely
  comparison:    0.22,  // Some elimination possible
  calculation:   0.20,  // Must actually calculate
  tlatm:         0.20,  // Manager reasoning hard to guess
};

// ─── Main Assignment Function ────────────────────────────

export interface IRTAssignmentInput {
  difficulty_rating: DifficultyRating;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
}

/**
 * Assigns initial IRT parameters to a question based on its metadata.
 * These are prior estimates — actual parameters will be refined
 * through empirical calibration once response data accumulates.
 *
 * Parameter ranges:
 *   a (discrimination): 0.5 – 2.5
 *   b (difficulty):    -3.0 – +3.0
 *   c (guessing):       0.15 – 0.30
 */
export function assignIRTParameters(input: IRTAssignmentInput): IRTParameters {
  // Difficulty (b): base + cognitive offset + type offset
  let b = DIFFICULTY_BASE[input.difficulty_rating]
    + COGNITIVE_DIFFICULTY_OFFSET[input.cognitive_level]
    + TYPE_DIFFICULTY_MODIFIER[input.question_type];

  // Clamp to valid range
  b = Math.max(-3.0, Math.min(3.0, b));

  // Discrimination (a): base from cognitive level + type modifier
  let a = COGNITIVE_DISCRIMINATION[input.cognitive_level]
    + TYPE_DISCRIMINATION_MODIFIER[input.question_type];

  // Clamp to valid range
  a = Math.max(0.5, Math.min(2.5, a));

  // Pseudo-guessing (c): type-based
  let c = GUESSING_BY_TYPE[input.question_type] ?? GUESSING_BASE;
  c = Math.max(0.15, Math.min(0.30, c));

  // Round to 2 decimal places for clean storage
  return {
    a: Math.round(a * 100) / 100,
    b: Math.round(b * 100) / 100,
    c: Math.round(c * 100) / 100,
  };
}

/**
 * Batch-assign IRT parameters to multiple questions.
 * Returns a map of question ID → IRTParameters.
 */
export function batchAssignIRTParameters(
  questions: (IRTAssignmentInput & { id: string })[]
): Map<string, IRTParameters> {
  const result = new Map<string, IRTParameters>();
  for (const q of questions) {
    result.set(q.id, assignIRTParameters(q));
  }
  return result;
}

// ─── Reference Tables ────────────────────────────────────
// For display/debugging — shows what parameters each combo gets

export function getParameterPreview(
  difficulty: DifficultyRating,
  cognitive: CognitiveLevel,
  type: QuestionType
): { a: number; b: number; c: number; description: string } {
  const params = assignIRTParameters({
    difficulty_rating: difficulty,
    cognitive_level: cognitive,
    question_type: type,
  });

  const diffDesc = difficulty === 'easy' ? 'Easy' : difficulty === 'medium' ? 'Medium'
    : difficulty === 'hard' ? 'Hard' : 'Very Hard';
  const cogDesc = cognitive.charAt(0).toUpperCase() + cognitive.slice(1);

  return {
    ...params,
    description: `${diffDesc} / ${cogDesc} / ${type}: a=${params.a}, b=${params.b}, c=${params.c}`,
  };
}
