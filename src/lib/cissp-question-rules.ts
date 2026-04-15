// ═══════════════════════════════════════════════════════════
// CISSP Question Generation Rules
// Phrasing patterns, distractor design, and validation
// for authentic CISSP-style questions
// ═══════════════════════════════════════════════════════════

import { CognitiveLevel, QuestionType } from './irt-engine';

// ─── Question Stem Patterns ─────────────────────────────
// CISSP uses specific phrasing patterns that test at different
// cognitive levels. These patterns guide question generation.

export interface StemPattern {
  type: QuestionType;
  cognitiveLevel: CognitiveLevel;
  patterns: string[];
  description: string;
  example: string;
}

export const STEM_PATTERNS: StemPattern[] = [
  // ── FIRST / PRIMARY ────────────────────────────────────
  {
    type: 'first_action',
    cognitiveLevel: 'analyze',
    patterns: [
      'What should be the FIRST action {role} takes when {scenario}?',
      'What is the FIRST step in {process}?',
      'What should {role} do FIRST after discovering {event}?',
      'What is the PRIMARY concern when {scenario}?',
      'What is the MOST important first step when {scenario}?',
    ],
    description: 'Tests prioritization and incident response ordering. The candidate must rank actions by urgency and importance.',
    example: 'What should be the FIRST action a security analyst takes when a ransomware infection is discovered on a production server?',
  },

  // ── BEST / MOST APPROPRIATE ────────────────────────────
  {
    type: 'best_answer',
    cognitiveLevel: 'apply',
    patterns: [
      'Which of the following BEST describes {concept}?',
      'What is the BEST approach to {scenario}?',
      'Which control would BEST mitigate {risk}?',
      'What is the MOST appropriate {action} for {scenario}?',
      'Which of the following is the BEST reason for {action}?',
    ],
    description: 'All options may be partially correct. Tests ability to identify the optimal choice among plausible alternatives.',
    example: 'Which of the following BEST describes the purpose of a business impact analysis?',
  },

  // ── MOST LIKELY ────────────────────────────────────────
  {
    type: 'most_likely',
    cognitiveLevel: 'analyze',
    patterns: [
      'What is the MOST likely cause of {event}?',
      'Which attack is MOST likely being described?',
      'What is the MOST likely outcome of {action}?',
      'Which vulnerability is MOST likely exploited in {scenario}?',
    ],
    description: 'Tests threat analysis and diagnostic reasoning. Candidate must evaluate probability across scenarios.',
    example: 'A user reports they can access files they should not be able to see after a system migration. What is the MOST likely cause?',
  },

  // ── EXCEPT / NOT ───────────────────────────────────────
  {
    type: 'except_not',
    cognitiveLevel: 'remember',
    patterns: [
      'All of the following are {category} EXCEPT:',
      'Which of the following is NOT a {category}?',
      'Which of the following would NOT be included in {document}?',
      '{concept} includes all of the following EXCEPT:',
    ],
    description: 'Reversed logic — three options are correct, one is wrong. Tests comprehensive knowledge of a category.',
    example: 'All of the following are components of a Business Continuity Plan EXCEPT:',
  },

  // ── SCENARIO-BASED ─────────────────────────────────────
  {
    type: 'scenario',
    cognitiveLevel: 'apply',
    patterns: [
      '{role} at {org_type} discovers {event}. What should they do?',
      'An organization is {situation}. Which {solution_type} should be implemented?',
      'During a {activity}, {role} notices {observation}. What does this indicate?',
      'A company needs to {goal}. Which approach is MOST appropriate?',
    ],
    description: 'Presents a realistic workplace scenario. Tests practical application of concepts in context.',
    example: 'A security manager at a financial institution discovers that a third-party vendor has been storing customer data in an unencrypted cloud bucket. What should be the manager\'s PRIMARY concern?',
  },

  // ── THINK LIKE A MANAGER ───────────────────────────────
  {
    type: 'tlatm',
    cognitiveLevel: 'analyze',
    patterns: [
      'As a security manager, what is your PRIMARY concern regarding {scenario}?',
      'From a governance perspective, what is the MOST important consideration for {scenario}?',
      'What should management PRIMARILY focus on when {scenario}?',
      'As a CISO, how would you BEST justify {action} to the board?',
    ],
    description: 'Tests manager/executive perspective. Focuses on governance, risk, business alignment, and strategic thinking over technical solutions.',
    example: 'As a security manager, what is your PRIMARY concern when the development team wants to adopt a new open-source framework?',
  },

  // ── COMPARISON ─────────────────────────────────────────
  {
    type: 'comparison',
    cognitiveLevel: 'understand',
    patterns: [
      'What is the PRIMARY difference between {concept_a} and {concept_b}?',
      'How does {concept_a} differ from {concept_b}?',
      'Which of the following BEST distinguishes {concept_a} from {concept_b}?',
      'Compared to {concept_a}, {concept_b} is characterized by:',
    ],
    description: 'Tests understanding of relationships between similar concepts. Requires clear differentiation.',
    example: 'What is the PRIMARY difference between a hot site and a warm site?',
  },

  // ── CALCULATION ────────────────────────────────────────
  {
    type: 'calculation',
    cognitiveLevel: 'apply',
    patterns: [
      'Given {values}, what is the {metric}?',
      'If {asset} has an asset value of {value} and {factor}, what is the {result}?',
      'Calculate the {metric} given the following: {parameters}.',
      'An organization has {data}. What is the {calculated_value}?',
    ],
    description: 'Requires numerical computation. Common: ALE, SLE, ARO, MTTR, MTBF, availability.',
    example: 'An asset valued at $100,000 has an exposure factor of 40% and an ARO of 0.5. What is the ALE?',
  },

  // ── DEFINITION ─────────────────────────────────────────
  {
    type: 'definition',
    cognitiveLevel: 'remember',
    patterns: [
      'Which of the following BEST defines {term}?',
      'What is {term}?',
      '{term} is defined as:',
      'The purpose of {concept} is to:',
    ],
    description: 'Direct recall of definitions. Lowest cognitive level but still requires precise understanding.',
    example: 'Which of the following BEST defines the concept of non-repudiation?',
  },
];

// ─── Distractor Design Rules ─────────────────────────────
// Every wrong answer must be plausible. These rules guide
// how to craft effective distractors.

export interface DistractorRule {
  id: string;
  name: string;
  description: string;
  example: {
    correct: string;
    distractor: string;
    why_plausible: string;
  };
}

export const DISTRACTOR_RULES: DistractorRule[] = [
  {
    id: 'same_domain',
    name: 'Same-Domain Distractor',
    description: 'Use a concept from the same CISSP domain that is related but incorrect in this context.',
    example: {
      correct: 'Business Impact Analysis identifies critical functions',
      distractor: 'Risk Assessment identifies critical functions',
      why_plausible: 'Both are assessment activities in Domain 1, but BIA specifically focuses on critical business functions',
    },
  },
  {
    id: 'common_misconception',
    name: 'Common Misconception',
    description: 'Use an answer that reflects a commonly held but incorrect belief.',
    example: {
      correct: 'Encryption provides confidentiality',
      distractor: 'Encryption provides integrity',
      why_plausible: 'Many confuse encryption (confidentiality) with hashing (integrity)',
    },
  },
  {
    id: 'partial_truth',
    name: 'Partially True',
    description: 'An answer that is true in some contexts but not the BEST/FIRST/MOST answer.',
    example: {
      correct: 'Contain the incident first',
      distractor: 'Document everything first',
      why_plausible: 'Documentation is important but containment is the priority during active incidents',
    },
  },
  {
    id: 'scope_error',
    name: 'Scope/Level Error',
    description: 'Correct concept but wrong scope — operational answer when strategic is needed, or vice versa.',
    example: {
      correct: 'Report to senior management (strategic)',
      distractor: 'Implement a firewall rule (tactical)',
      why_plausible: 'The tactical response addresses the symptom but misses the governance requirement',
    },
  },
  {
    id: 'close_concept',
    name: 'Close Concept Substitution',
    description: 'Substitute a closely related term that sounds similar but means something different.',
    example: {
      correct: 'Due diligence',
      distractor: 'Due care',
      why_plausible: 'Both are legal concepts in security governance but have distinct meanings',
    },
  },
  {
    id: 'order_error',
    name: 'Sequence/Order Error',
    description: 'Correct action but at the wrong step in a process or lifecycle.',
    example: {
      correct: 'Eradication comes after containment',
      distractor: 'Eradication comes before containment',
      why_plausible: 'Both are incident response phases, but the order matters',
    },
  },
];

// ─── Cognitive Level Distribution Targets ────────────────
// CISSP targets higher-order thinking

export const COGNITIVE_DISTRIBUTION: Record<string, Record<CognitiveLevel, number>> = {
  field_test: {
    remember: 0.20,
    understand: 0.35,
    apply: 0.30,
    analyze: 0.15,
  },
  boss_battle: {
    remember: 0.10,
    understand: 0.25,
    apply: 0.35,
    analyze: 0.30,
  },
  final_boss: {
    remember: 0.05,
    understand: 0.20,
    apply: 0.35,
    analyze: 0.40,
  },
  gauntlet: {
    remember: 0.00,
    understand: 0.00,
    apply: 0.40,
    analyze: 0.60,
  },
};

// ─── Question Type Distribution Targets ──────────────────

export const TYPE_DISTRIBUTION: Record<string, Partial<Record<QuestionType, number>>> = {
  field_test: {
    scenario: 0.25,
    best_answer: 0.20,
    definition: 0.15,
    comparison: 0.15,
    most_likely: 0.10,
    first_action: 0.10,
    except_not: 0.05,
  },
  boss_battle: {
    scenario: 0.30,
    best_answer: 0.20,
    first_action: 0.15,
    most_likely: 0.10,
    tlatm: 0.10,
    comparison: 0.05,
    except_not: 0.05,
    calculation: 0.05,
  },
  final_boss: {
    scenario: 0.30,
    tlatm: 0.20,
    first_action: 0.15,
    best_answer: 0.15,
    most_likely: 0.10,
    calculation: 0.05,
    except_not: 0.05,
  },
  gauntlet: {
    tlatm: 0.60,
    scenario: 0.25,
    first_action: 0.15,
  },
};

// ─── Validation ──────────────────────────────────────────

export interface ValidationResult {
  isValid: boolean;
  errors: string[];
  warnings: string[];
}

export interface QuestionToValidate {
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  domain_id: number;
  topic_cluster: string;
}

/**
 * Validates a question against CISSP standards.
 * Returns errors (must fix) and warnings (should review).
 */
export function validateQuestion(q: QuestionToValidate): ValidationResult {
  const errors: string[] = [];
  const warnings: string[] = [];

  // ── Stem validation ────────────────────────────────────

  if (!q.question_text || q.question_text.trim().length < 20) {
    errors.push('Question stem must be at least 20 characters.');
  }

  if (q.question_text.length > 1000) {
    warnings.push('Question stem is very long (>1000 chars). Consider trimming.');
  }

  if (!q.question_text.includes('?') && !q.question_text.endsWith(':')) {
    warnings.push('Question stem should end with ? or : for clarity.');
  }

  // Check for CISSP keyword presence in appropriate question types
  const cisspKeywords = ['FIRST', 'BEST', 'MOST', 'PRIMARY', 'EXCEPT', 'NOT'];
  const hasCisspKeyword = cisspKeywords.some(kw => q.question_text.includes(kw));

  if (['first_action', 'best_answer', 'most_likely', 'except_not'].includes(q.question_type) && !hasCisspKeyword) {
    warnings.push(`Question type "${q.question_type}" should use CISSP keywords (FIRST, BEST, MOST, EXCEPT).`);
  }

  // ── Options validation ─────────────────────────────────

  if (!q.options || q.options.length !== 4) {
    errors.push('Must have exactly 4 options.');
  } else {
    // Check option lengths
    for (let i = 0; i < q.options.length; i++) {
      if (q.options[i].trim().length < 5) {
        errors.push(`Option ${String.fromCharCode(65 + i)} is too short (< 5 chars).`);
      }
    }

    // Check for duplicate options
    const uniqueOptions = new Set(q.options.map(o => o.trim().toLowerCase()));
    if (uniqueOptions.size < 4) {
      errors.push('Options must be unique — found duplicates.');
    }

    // Check option length balance — no option should be >2x the length of any other
    const lengths = q.options.map(o => o.length);
    const minLength = Math.min(...lengths);
    const maxLength = Math.max(...lengths);
    if (minLength > 0 && maxLength > minLength * 2) {
      warnings.push(`Option length imbalance: longest (${maxLength} chars) is >2x shortest (${minLength} chars). Balance option lengths.`);
    }
  }

  // ── Correct index validation ───────────────────────────

  if (q.correct_index < 0 || q.correct_index > 3) {
    errors.push('Correct index must be 0-3.');
  }

  // ── Explanation validation ─────────────────────────────

  if (!q.explanation || q.explanation.trim().length < 20) {
    errors.push('Explanation must be at least 20 characters.');
  }

  if (q.explanation && !q.explanation.toLowerCase().includes('correct') &&
      !q.explanation.toLowerCase().includes('answer') &&
      !q.explanation.toLowerCase().includes('because')) {
    warnings.push('Explanation should reference why the correct answer is right.');
  }

  // ── Domain validation ──────────────────────────────────

  if (q.domain_id < 1 || q.domain_id > 8) {
    errors.push('Domain ID must be 1-8.');
  }

  // ── Topic cluster validation ───────────────────────────

  if (!q.topic_cluster || q.topic_cluster.trim().length < 3) {
    errors.push('Topic cluster is required.');
  }

  // ── TLATM-specific validation ──────────────────────────

  if (q.question_type === 'tlatm') {
    const managerKeywords = ['manager', 'management', 'governance', 'business', 'risk',
      'strategic', 'executive', 'board', 'organization', 'compliance', 'policy', 'CISO'];
    const hasManagerContext = managerKeywords.some(kw =>
      q.question_text.toLowerCase().includes(kw.toLowerCase()));
    if (!hasManagerContext) {
      warnings.push('TLATM questions should include management/governance context.');
    }
  }

  // ── Calculation-specific validation ────────────────────

  if (q.question_type === 'calculation') {
    const calcKeywords = ['calculate', 'value', 'cost', 'rate', 'percentage', '%',
      'ALE', 'SLE', 'ARO', 'MTTR', 'MTBF', 'availability', 'given'];
    const hasCalcContext = calcKeywords.some(kw =>
      q.question_text.toLowerCase().includes(kw.toLowerCase()));
    if (!hasCalcContext) {
      warnings.push('Calculation questions should include numerical values or formulas.');
    }
  }

  return {
    isValid: errors.length === 0,
    errors,
    warnings,
  };
}

/**
 * Batch validate multiple questions and return a summary.
 */
export function validateQuestionBatch(
  questions: QuestionToValidate[]
): { total: number; valid: number; invalid: number; results: (ValidationResult & { index: number })[] } {
  const results = questions.map((q, index) => ({
    index,
    ...validateQuestion(q),
  }));

  return {
    total: questions.length,
    valid: results.filter(r => r.isValid).length,
    invalid: results.filter(r => !r.isValid).length,
    results: results.filter(r => !r.isValid || r.warnings.length > 0),
  };
}

// ─── Option Shuffling ───────────────────────────────────
// Randomizes option order so correct answer position is unpredictable.
// Uses Fisher-Yates shuffle for uniform distribution.

export interface ShuffleResult {
  options: string[];
  correctIndex: number;
}

/**
 * Shuffles question options using Fisher-Yates algorithm.
 * Returns new option order and updated correct answer index.
 */
export function shuffleOptions(options: string[], correctIndex: number): ShuffleResult {
  const indices = options.map((_, i) => i);

  // Fisher-Yates shuffle
  for (let i = indices.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [indices[i], indices[j]] = [indices[j], indices[i]];
  }

  return {
    options: indices.map(i => options[i]),
    correctIndex: indices.indexOf(correctIndex),
  };
}

// ─── Set-Level Pattern Validation ────────────────────────
// Detects exploitable patterns across a SET of questions.

export interface SetValidationResult {
  valid: boolean;
  issues: string[];
}

/**
 * Validates a set of questions for exploitable patterns.
 * Checks position distribution, length bias, qualifier patterns,
 * and banned phrases like "all/none of the above".
 */
export function validateQuestionSet(
  questions: { options: string[]; correct_index: number }[]
): SetValidationResult {
  const issues: string[] = [];
  const total = questions.length;
  if (total < 4) return { valid: true, issues: [] };

  // ── Correct answer position distribution ────────────
  // Each position (0,1,2,3) should be 20-30%, flag if >35%
  const positionCounts = [0, 0, 0, 0];
  questions.forEach(q => {
    if (q.correct_index >= 0 && q.correct_index <= 3) {
      positionCounts[q.correct_index]++;
    }
  });

  for (let i = 0; i < 4; i++) {
    const pct = (positionCounts[i] / total) * 100;
    if (pct > 35) {
      issues.push(
        `Position ${String.fromCharCode(65 + i)} has correct answer ${pct.toFixed(0)}% of the time (target: 20-30%, max: 35%)`
      );
    }
  }

  // ── Correct answer length bias ──────────────────────
  // Flag if correct answer is the longest option >35% of the time
  let correctIsLongest = 0;
  questions.forEach(q => {
    if (q.options && q.options.length === 4) {
      const lens = q.options.map(o => o.length);
      const maxLen = Math.max(...lens);
      if (q.options[q.correct_index]?.length === maxLen) {
        correctIsLongest++;
      }
    }
  });

  const longestPct = (correctIsLongest / total) * 100;
  if (longestPct > 35) {
    issues.push(
      `Correct answer is the longest option ${longestPct.toFixed(0)}% of the time (max: 35%)`
    );
  }

  // ── Qualifier phrase patterns ───────────────────────
  // Flag if a specific phrase appears as correct answer >15%
  const qualifierPhrases = [
    'conduct a risk assessment',
    'perform a risk analysis',
    'implement controls',
    'notify management',
    'update the policy',
  ];

  const phraseCounts = new Map<string, number>();
  questions.forEach(q => {
    const correctText = q.options[q.correct_index]?.toLowerCase() || '';
    qualifierPhrases.forEach(phrase => {
      if (correctText.includes(phrase)) {
        phraseCounts.set(phrase, (phraseCounts.get(phrase) || 0) + 1);
      }
    });
  });

  phraseCounts.forEach((count, phrase) => {
    const pct = (count / total) * 100;
    if (pct > 15) {
      issues.push(
        `Qualifier pattern: "${phrase}" is correct ${pct.toFixed(0)}% of the time (max: 15%)`
      );
    }
  });

  // ── Banned phrases ─────────────────────────────────
  // "All of the above" and "None of the above" should never appear
  const bannedPhrases = ['all of the above', 'none of the above'];
  questions.forEach((q, i) => {
    q.options.forEach(opt => {
      bannedPhrases.forEach(banned => {
        if (opt.toLowerCase().includes(banned)) {
          issues.push(`Question ${i + 1} contains banned phrase: "${banned}"`);
        }
      });
    });
  });

  return {
    valid: issues.length === 0,
    issues,
  };
}
