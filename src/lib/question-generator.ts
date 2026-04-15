// ═══════════════════════════════════════════════════════════
// Question Generation System
// Template-based system for generating CISSP questions
// using Claude API (future sprint) or manual authoring
// ═══════════════════════════════════════════════════════════

import { CognitiveLevel, QuestionType } from './irt-engine';
import { DifficultyRating, assignIRTParameters } from './irt-defaults';
import { STEM_PATTERNS, DISTRACTOR_RULES, validateQuestion } from './cissp-question-rules';

// ─── Types ───────────────────────────────────────────────

export interface GenerationTarget {
  domain_id: number;
  topic_cluster: string;
  topic_name: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  difficulty_rating: DifficultyRating;
  count: number;
}

export interface GeneratedQuestion {
  domain_id: number;
  topic_cluster: string;
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
  mnemonic_hint?: string;
  library_topic_id?: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  difficulty_rating: DifficultyRating;
  irt_a: number;
  irt_b: number;
  irt_c: number;
  source: 'manual' | 'ai_generated';
  generation_batch?: string;
}

export interface GenerationBatch {
  batchId: string;
  targets: GenerationTarget[];
  generatedAt: string;
  totalGenerated: number;
  totalValid: number;
  questions: GeneratedQuestion[];
}

// ─── Prompt Template Builder ─────────────────────────────
// Builds structured prompts for Claude API question generation

export interface PromptContext {
  domain_id: number;
  domain_name: string;
  topic_cluster: string;
  topic_name: string;
  key_concepts: string[];
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  difficulty_rating: DifficultyRating;
  count: number;
}

/**
 * Build a generation prompt for Claude API.
 * The prompt includes CISSP-specific rules, distractor design
 * guidance, and structured output format.
 */
export function buildGenerationPrompt(context: PromptContext): string {
  // Find matching stem patterns
  const patterns = STEM_PATTERNS.find(p => p.type === context.question_type);
  const patternExamples = patterns
    ? patterns.patterns.slice(0, 3).join('\n  ')
    : 'Use standard question format.';

  // Pick relevant distractor rules
  const distractorGuidance = DISTRACTOR_RULES
    .slice(0, 4)
    .map(r => `- ${r.name}: ${r.description}`)
    .join('\n');

  const cognitiveGuidance = getCognitiveGuidance(context.cognitive_level);
  const difficultyGuidance = getDifficultyGuidance(context.difficulty_rating);

  return `You are an expert CISSP exam question writer. Generate ${context.count} questions for the following specification.

## Domain
${context.domain_id}. ${context.domain_name}

## Topic
${context.topic_cluster}: ${context.topic_name}

## Key Concepts to Test
${context.key_concepts.map(c => `- ${c}`).join('\n')}

## Question Type: ${context.question_type}
Stem patterns to use:
  ${patternExamples}

## Cognitive Level: ${context.cognitive_level}
${cognitiveGuidance}

## Difficulty: ${context.difficulty_rating}
${difficultyGuidance}

## Distractor Design Rules
${distractorGuidance}

## CISSP-Specific Rules
- Use FIRST, BEST, MOST, PRIMARY, EXCEPT as appropriate
- Think Like a Manager: favor governance/risk/business answers over technical
- All 4 options must be plausible to a partially-informed candidate
- Correct answer length should be similar to distractors
- Avoid "All of the above" or "None of the above"
- Avoid negative stems unless using EXCEPT/NOT format
- Each explanation must state WHY the correct answer is right AND why the best distractor is wrong

## Output Format (JSON array)
[
  {
    "question_text": "...",
    "options": ["A. ...", "B. ...", "C. ...", "D. ..."],
    "correct_index": 0,
    "explanation": "...",
    "mnemonic_hint": "..." (optional memory aid)
  }
]

Generate exactly ${context.count} questions. Each must be unique and test different aspects of the topic.`;
}

// ─── Cognitive Level Guidance ────────────────────────────

function getCognitiveGuidance(level: CognitiveLevel): string {
  const guidance: Record<CognitiveLevel, string> = {
    remember: 'Test recall of facts, definitions, and terminology. The candidate should recognize or recall specific information.',
    understand: 'Test comprehension and interpretation. The candidate should explain concepts in their own words and understand relationships.',
    apply: 'Test practical application in realistic scenarios. The candidate should use knowledge to solve problems in new situations.',
    analyze: 'Test evaluation and judgment. The candidate should break down complex scenarios, compare options, and make decisions based on multiple factors.',
  };
  return guidance[level];
}

// ─── Difficulty Guidance ─────────────────────────────────

function getDifficultyGuidance(difficulty: DifficultyRating): string {
  const guidance: Record<DifficultyRating, string> = {
    easy: 'Straightforward questions testing core concepts. A well-prepared candidate should answer correctly 75-85% of the time.',
    medium: 'Questions requiring solid understanding. Distractors should reflect common misconceptions. Expected accuracy: 55-70%.',
    hard: 'Complex scenarios requiring deep knowledge and judgment. Multiple plausible answers. Expected accuracy: 35-50%.',
    very_hard: 'Expert-level questions combining multiple concepts. Requires analysis of nuanced scenarios. Expected accuracy: 20-35%.',
  };
  return guidance[difficulty];
}

// ─── Process AI Response ─────────────────────────────────
// Parse and validate questions returned from Claude API

export function processGeneratedQuestions(
  rawResponse: string,
  context: PromptContext
): GeneratedQuestion[] {
  try {
    // Extract JSON from response (handle markdown code blocks)
    const jsonMatch = rawResponse.match(/\[[\s\S]*\]/);
    if (!jsonMatch) return [];

    const parsed = JSON.parse(jsonMatch[0]);
    if (!Array.isArray(parsed)) return [];

    const questions: GeneratedQuestion[] = [];

    for (const raw of parsed) {
      // Strip option prefixes (A., B., etc.) if present
      const options = (raw.options || []).map((opt: string) =>
        opt.replace(/^[A-D]\.\s*/, '').trim()
      );

      // Assign IRT parameters
      const irtParams = assignIRTParameters({
        difficulty_rating: context.difficulty_rating,
        cognitive_level: context.cognitive_level,
        question_type: context.question_type,
      });

      const question: GeneratedQuestion = {
        domain_id: context.domain_id,
        topic_cluster: context.topic_cluster,
        question_text: raw.question_text || '',
        options,
        correct_index: raw.correct_index || 0,
        explanation: raw.explanation || '',
        mnemonic_hint: raw.mnemonic_hint || undefined,
        cognitive_level: context.cognitive_level,
        question_type: context.question_type,
        difficulty_rating: context.difficulty_rating,
        irt_a: irtParams.a,
        irt_b: irtParams.b,
        irt_c: irtParams.c,
        source: 'ai_generated',
      };

      // Validate before adding
      const validation = validateQuestion({
        question_text: question.question_text,
        options: question.options,
        correct_index: question.correct_index,
        explanation: question.explanation,
        cognitive_level: question.cognitive_level,
        question_type: question.question_type,
        domain_id: question.domain_id,
        topic_cluster: question.topic_cluster,
      });

      if (validation.isValid) {
        questions.push(question);
      }
    }

    return questions;
  } catch {
    return [];
  }
}

// ─── Manual Question Builder ─────────────────────────────
// Helper for manually creating questions with auto-assigned IRT params

export function createManualQuestion(input: {
  domain_id: number;
  topic_cluster: string;
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
  mnemonic_hint?: string;
  library_topic_id?: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  difficulty_rating: DifficultyRating;
}): GeneratedQuestion {
  const irtParams = assignIRTParameters({
    difficulty_rating: input.difficulty_rating,
    cognitive_level: input.cognitive_level,
    question_type: input.question_type,
  });

  return {
    ...input,
    irt_a: irtParams.a,
    irt_b: irtParams.b,
    irt_c: irtParams.c,
    source: 'manual',
  };
}
