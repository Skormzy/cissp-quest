// Database types for CISSP Quest

export interface User {
  id: string;
  display_name: string | null;
  character_name: string | null;
  character_gender: string | null;
  character_skin: number;
  character_hair: number;
  character_hair_color: string;
  character_outfit: number;
  xp: number;
  level: number;
  streak_count: number;
  streak_last_date: string | null;
  subscription_tier: 'free' | 'premium' | 'elite';
  created_at: string;
}

export interface Question {
  id: string;
  domain_id: number;
  difficulty: 'easy' | 'medium' | 'hard';
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
  story_context: string | null;
  source: string | null;
  bloom_level: string | null;
  mnemonic_hint: string | null;
  library_topic_id: string | null;
  is_active: boolean;
  times_shown: number;
  times_correct: number;
  created_at: string;
}

export interface UserAnswer {
  id: string;
  user_id: string;
  question_id: string;
  selected_index: number;
  is_correct: boolean;
  time_spent_seconds: number | null;
  xp_earned: number;
  session_id: string | null;
  created_at: string;
}

export interface StoryProgress {
  id: string;
  user_id: string;
  chapter_id: number;
  scene_index: number;
  domain_id: number;
  is_complete: boolean;
  completed_at: string | null;
}

export interface Achievement {
  id: string;
  user_id: string;
  badge_id: string;
  earned_at: string;
}

export interface LibraryTopic {
  id: string;
  domain_id: number;
  topic_number: string;
  title: string;
  one_liner: string | null;
  content_markdown: string | null;
  key_formulas: { formula: string; description: string }[] | null;
  comparison_table: { headers: string[]; rows: string[][] } | null;
  exam_tips: string | null;
  think_like_manager: string | null;
  memory_hack: string | null;
  memory_anchor: string | null;
  related_topic_ids: string[] | null;
  created_at: string;
}

export interface ChapterLesson {
  id: string;
  chapter_id: number;
  domain_id: number;
  title: string;
  content_markdown: string | null;
  knowledge_check_questions: KnowledgeCheckQuestion[] | null;
  library_topic_ids: string[] | null;
  display_order: number;
}

export interface KnowledgeCheckQuestion {
  question: string;
  options: string[];
  correct_index: number;
  explanation: string;
}

export interface UserBookmark {
  user_id: string;
  topic_id: string;
  created_at: string;
}

export interface UserQuestionSchedule {
  user_id: string;
  question_id: string;
  times_seen: number;
  times_correct: number;
  interval_days: number;
  next_review: string;
}

// App-specific types

export interface QuizSession {
  id: string;
  questions: Question[];
  currentIndex: number;
  answers: QuizAnswer[];
  mode: 'story' | 'quick' | 'domain' | 'review';
  domainFilter: number | null;
  streak: number;
  totalXpEarned: number;
  startedAt: number;
}

export interface QuizAnswer {
  questionId: string;
  selectedIndex: number;
  isCorrect: boolean;
  timeSpent: number;
  xpEarned: number;
  isCriticalHit: boolean;
}

export interface StoryScene {
  id: string;
  type: 'dialogue' | 'choice' | 'narration';
  background: string;
  locationName: string;
  leftCharacter?: CharacterDisplay;
  rightCharacter?: CharacterDisplay;
  speaker?: string;
  speakerSide?: 'left' | 'right';
  dialogue: string;
  choices?: StoryChoice[];
}

export interface StoryChoice {
  text: string;
  xpBonus: number;
  response: string;
}

export interface CharacterDisplay {
  name: string;
  emoji: string;
  color: string;
}

export interface ChapterData {
  id: number;
  domainId: number;
  title: string;
  location: string;
  locationEmoji: string;
  description: string;
  scenes: StoryScene[];
  briefingContent: string;
  knowledgeCheckQuestions: KnowledgeCheckQuestion[];
  quizQuestionCount: number;
}

export type Grade = 'S' | 'A' | 'B' | 'C' | 'D';

export interface DomainInfo {
  id: number;
  name: string;
  weight: string;
  icon: string;
  color: string;
  location: string;
  locationEmoji: string;
}
