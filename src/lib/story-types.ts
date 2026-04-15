// Story Mode types — Visual Novel Engine + 5-act structure

// ─── 8 Node Types ─────────────────────────────────────────

export interface DialogueNode {
  type: 'dialogue';
  id: string;
  speaker: string;
  speakerSide: 'left' | 'right';
  text: string;
  leftCharacter?: string;   // characterId from NPC registry
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
  choices?: DialogueChoice[];
}

export interface DialogueChoice {
  text: string;
  response: string;
  xpBonus?: number;
  nextNodeId?: string;
}

export interface EvidenceNode {
  type: 'evidence';
  id: string;
  title: string;
  classification: 'CLASSIFIED' | 'TOP SECRET' | 'CONFIDENTIAL' | 'UNCLASSIFIED';
  content: string;             // markdown body
  evidenceItems?: EvidenceItem[];
  speaker?: string;
  speakerSide?: 'left' | 'right';
  dialogue?: string;           // optional NPC commentary
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
}

export interface EvidenceItem {
  label: string;
  value: string;
  highlight?: boolean;
}

export interface KnowledgeCheckNode {
  type: 'knowledgeCheck';
  id: string;
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  memoryHack?: string;
  conceptName?: string;        // for mastery tracking
  speaker?: string;
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
}

export interface TimedDecisionNode {
  type: 'timedDecision';
  id: string;
  scenario: string;
  timeLimit: number;            // seconds (default 30)
  options: TimedOption[];
  conceptName?: string;
  speaker?: string;
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
}

export interface TimedOption {
  text: string;
  isOptimal: boolean;
  feedback: string;
  xpBonus?: number;
}

export interface ThinkLikeManagerNode {
  type: 'thinkLikeManager';
  id: string;
  scenario: string;
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  managerInsight: string;
  conceptName?: string;
  speaker?: string;
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
}

export interface VisualAidNode {
  type: 'visualAid';
  id: string;
  title: string;
  aidType: 'table' | 'diagram' | 'list' | 'comparison';
  headers?: string[];
  rows?: string[][];
  items?: { label: string; description: string }[];
  speaker?: string;
  dialogue?: string;
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
}

export interface TransitionNode {
  type: 'transition';
  id: string;
  location: string;
  description: string;
  animation: 'fade' | 'slide' | 'glitch';
  timeSkipText?: string;
}

// ─── NEW: Interactive Image Node ─────────────────────────

export interface InteractiveImageHotspot {
  id: string;
  label: string;
  x: number;        // percentage from left (0-100)
  y: number;        // percentage from top (0-100)
  width: number;    // percentage width
  height: number;   // percentage height
  shape: 'circle' | 'rectangle';
  npcSpeaker: string;
  dialogue: string;
  detail?: string;
  discovered?: boolean;
}

export interface InteractiveImageNode {
  type: 'interactiveImage';
  id: string;
  title: string;
  imageType: 'exploration' | 'process_flow' | 'comparison' | 'calculation' | 'decision_map' | 'timeline';
  backgroundGradient: string;     // CSS gradient for placeholder bg
  hotspots: InteractiveImageHotspot[];
  speaker?: string;
  dialogue?: string;              // initial NPC dialogue below image
  completionDialogue?: string;    // NPC dialogue when all hotspots discovered
  leftCharacter?: string;
  leftExpression?: string;
  rightCharacter?: string;
  rightExpression?: string;
  conceptName?: string;
}

// ─── Union Type ───────────────────────────────────────────

export type StorySceneNode =
  | DialogueNode
  | EvidenceNode
  | KnowledgeCheckNode
  | TimedDecisionNode
  | ThinkLikeManagerNode
  | VisualAidNode
  | TransitionNode
  | InteractiveImageNode;

// ─── Character / NPC Types ────────────────────────────────

export type NPCExpression = 'neutral' | 'serious' | 'smile' | 'worried' | 'angry' | 'surprised' | 'thinking';

export interface NPCDefinition {
  id: string;
  name: string;
  role: string;
  accentColor: string;
  silhouetteColor: string;
  expressions: NPCExpression[];
}

// ─── Act / Chapter Definitions ────────────────────────────

export interface ActDefinition {
  actNumber: number;
  title: string;
  description: string;
  nodes: StorySceneNode[];
  xpReward: number;
  conceptsCovered?: string[];
  estimatedMinutes?: number;
}

export interface DomainChapterDefinition {
  domainId: number;
  title: string;
  location: string;
  locationGradient: string;
  acts: (ActDefinition | null)[];  // null = not yet authored
}

// ─── Evidence Board Types ─────────────────────────────────

export interface EvidenceBoardItem {
  conceptName: string;
  analogyName: string;
  npcId: string;
  domainNumber: number;
  sceneId: string;
  masteryLevel?: 'unseen' | 'struggling' | 'learning' | 'improving' | 'mastered';
  accuracyPercentage?: number;
  connections?: string[];    // related concept names
}

// ─── Database Row Types (v2 schema) ──────────────────────

export interface StoryModeProgress {
  id: string;
  user_id: string;
  domain_number: number;
  current_act: number;
  act1_completed: boolean;
  act2_completed: boolean;
  field_test_passed: boolean;
  field_test_score: number | null;
  field_test_best_score: number | null;
  field_test_attempts: number;
  act4_completed: boolean;
  boss_battle_passed: boolean;
  boss_battle_score: number | null;
  boss_battle_best_score: number | null;
  boss_battle_attempts: number;
  domain_conquered: boolean;
  conquered_at: string | null;
  total_time_spent_minutes: number;
  created_at: string;
  updated_at: string;
}

export interface SceneUnlock {
  id: string;
  user_id: string;
  scene_id: string;
  domain_number: number;
  act_number: number;
  unlocked_at: string;
  replay_count: number;
  last_replayed_at: string | null;
}

export interface SceneDefinition {
  scene_id: string;
  domain_number: number;
  act_number: number;
  scene_order: number;
  title: string;
  description: string | null;
  concepts_covered: string[];
  glossary_terms: string[];
  library_topics: string[];
  estimated_minutes: number;
  has_timed_decision: boolean;
  has_tlatm: boolean;
  scene_type: 'teaching' | 'narrative' | 'evidence' | 'briefing' | 'debrief';
  analogy_name: string | null;
  analogy_npc: string | null;
  interactive_image_type: string | null;
}

export interface ConceptAnalogy {
  concept_name: string;
  analogy_name: string;
  analogy_description: string;
  npc_owner: string;
  domain_number: number;
  scene_id_introduced: string | null;
  image_reference: string | null;
}

export interface FinalChapterProgress {
  id: string;
  user_id: string;
  tlatm_gauntlet_completed: boolean;
  tlatm_gauntlet_score: number | null;
  final_boss_passed: boolean;
  final_boss_score: number | null;
  final_boss_best_score: number | null;
  final_boss_attempts: number;
  cissp_legend_earned: boolean;
  completed_at: string | null;
}

export interface WeakTopic {
  id: string;
  user_id: string;
  topic_name: string;
  domain_number: number;
  accuracy_percentage: number;
  total_questions: number;
  correct_answers: number;
  review_recommended: boolean;
  scene_id: string | null;
  analogy_name: string | null;
  last_calculated_at: string;
}

export interface ConceptMastery {
  id: string;
  user_id: string;
  concept_name: string;
  domain_number: number;
  mastery_level: 'unseen' | 'struggling' | 'learning' | 'improving' | 'mastered';
  accuracy_percentage: number;
  total_attempts: number;
  correct_attempts: number;
  last_tested_at: string | null;
  last_reviewed_at: string | null;
  aha_moment_triggered: boolean;
}

export interface SpacedRepetitionSchedule {
  id: string;
  user_id: string;
  scene_id: string;
  concept_name: string;
  last_reviewed_at: string;
  next_review_at: string;
  review_interval_days: number;
  nudge_dismissed: boolean;
}

// ─── Engine Props ─────────────────────────────────────────

export interface VisualNovelEngineProps {
  scenes: StorySceneNode[];
  playerName: string;
  onSceneComplete?: (sceneId: string) => void;
  onActComplete?: () => void;
  onKnowledgeCheckAnswer?: (nodeId: string, isCorrect: boolean) => void;
  onConceptDiscovered?: (item: EvidenceBoardItem) => void;
  isReplayMode?: boolean;
  replaySource?: string;
  domainId?: number;
  actNumber?: number;
}

export interface StoryQuizConfig {
  questionCount: number;
  timeLimitMinutes: number;
  passingPercentage: number;
  difficulties: ('easy' | 'medium' | 'hard')[];
  domainId?: number;
  domainWeights?: Record<number, number>;  // For final boss: { 1: 8, 2: 5, ... }
  title: string;
  subtitle: string;
  theme: 'cyan' | 'gold' | 'red';
}

export interface StoryQuizEngineProps {
  config: StoryQuizConfig;
  onPass: (score: number, totalXp: number) => void;
  onFail: (score: number, weakDomains: number[]) => void;
}
