-- ============================================================================
-- CISSP Quest - Complete Database Migration
-- Paste this entire file into Supabase SQL Editor and run
-- ============================================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- TABLES
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT,
  character_name TEXT,
  character_gender TEXT,
  character_skin INT DEFAULT 1,
  character_hair INT DEFAULT 1,
  character_hair_color TEXT DEFAULT '#2d1b00',
  character_outfit INT DEFAULT 1,
  xp INT DEFAULT 0,
  level INT DEFAULT 1,
  streak_count INT DEFAULT 0,
  streak_last_date DATE,
  subscription_tier TEXT DEFAULT 'free',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.library_topics (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  topic_number TEXT NOT NULL,
  title TEXT NOT NULL,
  one_liner TEXT,
  content_markdown TEXT,
  key_formulas JSONB,
  comparison_table JSONB,
  exam_tips TEXT,
  think_like_manager TEXT,
  memory_hack TEXT,
  memory_anchor TEXT,
  related_topic_ids JSONB DEFAULT '[]',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  question_text TEXT NOT NULL,
  options JSONB NOT NULL,
  correct_index INT NOT NULL CHECK (correct_index BETWEEN 0 AND 3),
  explanation TEXT,
  story_context TEXT,
  source TEXT,
  bloom_level TEXT,
  mnemonic_hint TEXT,
  library_topic_id UUID REFERENCES public.library_topics(id),
  is_active BOOLEAN DEFAULT true,
  times_shown INT DEFAULT 0,
  times_correct INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.user_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id),
  selected_index INT NOT NULL,
  is_correct BOOLEAN NOT NULL,
  time_spent_seconds INT,
  xp_earned INT DEFAULT 0,
  session_id UUID,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.story_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  chapter_id INT NOT NULL,
  scene_index INT DEFAULT 0,
  domain_id INT NOT NULL,
  is_complete BOOLEAN DEFAULT false,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, chapter_id)
);

CREATE TABLE IF NOT EXISTS public.achievements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  badge_id TEXT NOT NULL,
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, badge_id)
);

CREATE TABLE IF NOT EXISTS public.chapter_lessons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  chapter_id INT NOT NULL,
  domain_id INT NOT NULL,
  title TEXT NOT NULL,
  content_markdown TEXT,
  knowledge_check_questions JSONB,
  library_topic_ids JSONB DEFAULT '[]',
  display_order INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.user_bookmarks (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  topic_id UUID NOT NULL REFERENCES public.library_topics(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY(user_id, topic_id)
);

CREATE TABLE IF NOT EXISTS public.user_question_schedule (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  times_seen INT DEFAULT 0,
  times_correct INT DEFAULT 0,
  interval_days INT DEFAULT 1,
  next_review DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(user_id, question_id)
);

-- ============================================================================
-- ROW LEVEL SECURITY
-- ============================================================================

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.library_topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.story_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.chapter_lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_bookmarks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_question_schedule ENABLE ROW LEVEL SECURITY;

-- Users: own row only
CREATE POLICY "Users can view own profile" ON public.users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON public.users FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON public.users FOR INSERT WITH CHECK (auth.uid() = id);

-- Questions: public select
CREATE POLICY "Anyone can view questions" ON public.questions FOR SELECT USING (true);

-- Library topics: public select
CREATE POLICY "Anyone can view library topics" ON public.library_topics FOR SELECT USING (true);

-- Chapter lessons: public select
CREATE POLICY "Anyone can view chapter lessons" ON public.chapter_lessons FOR SELECT USING (true);

-- User answers: own row
CREATE POLICY "Users can view own answers" ON public.user_answers FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own answers" ON public.user_answers FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Story progress: own row
CREATE POLICY "Users can view own story progress" ON public.story_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own story progress" ON public.story_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own story progress" ON public.story_progress FOR UPDATE USING (auth.uid() = user_id);

-- Achievements: own row
CREATE POLICY "Users can view own achievements" ON public.achievements FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own achievements" ON public.achievements FOR INSERT WITH CHECK (auth.uid() = user_id);

-- User bookmarks: own row
CREATE POLICY "Users can view own bookmarks" ON public.user_bookmarks FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own bookmarks" ON public.user_bookmarks FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can delete own bookmarks" ON public.user_bookmarks FOR DELETE USING (auth.uid() = user_id);

-- User question schedule: own row
CREATE POLICY "Users can view own schedule" ON public.user_question_schedule FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own schedule" ON public.user_question_schedule FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own schedule" ON public.user_question_schedule FOR UPDATE USING (auth.uid() = user_id);

-- ============================================================================
-- SEED DATA: LIBRARY TOPICS (40+ topics across 8 domains)
-- ============================================================================

-- DOMAIN 1: Security and Risk Management (5 topics)
-- ============================================================================
-- CAT ENGINE TABLES
-- ============================================================================
-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — CAT Engine Migration
-- IRT-based Computerized Adaptive Testing tables
-- ═══════════════════════════════════════════════════════════

-- ─── 1. cat_questions ────────────────────────────────────
-- Stores all questions with IRT parameters

CREATE TABLE IF NOT EXISTS cat_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Content
  domain_id INTEGER NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  topic_cluster TEXT NOT NULL,
  question_text TEXT NOT NULL,
  options JSONB NOT NULL,                    -- string[] (4 options)
  correct_index INTEGER NOT NULL CHECK (correct_index BETWEEN 0 AND 3),
  explanation TEXT NOT NULL,
  mnemonic_hint TEXT,
  library_topic_id TEXT,

  -- IRT Parameters (3PL)
  irt_a DOUBLE PRECISION NOT NULL DEFAULT 1.0,   -- Discrimination (0.5–2.5)
  irt_b DOUBLE PRECISION NOT NULL DEFAULT 0.0,   -- Difficulty (-3.0–+3.0)
  irt_c DOUBLE PRECISION NOT NULL DEFAULT 0.25,  -- Pseudo-guessing (0.20–0.25)

  -- Question metadata
  cognitive_level TEXT NOT NULL DEFAULT 'understand'
    CHECK (cognitive_level IN ('remember', 'understand', 'apply', 'analyze')),
  question_type TEXT NOT NULL DEFAULT 'scenario'
    CHECK (question_type IN (
      'scenario', 'best_answer', 'most_likely', 'first_action',
      'except_not', 'comparison', 'calculation', 'tlatm', 'definition'
    )),
  difficulty_rating TEXT NOT NULL DEFAULT 'medium'
    CHECK (difficulty_rating IN ('easy', 'medium', 'hard', 'very_hard')),

  -- Calibration tracking
  times_administered INTEGER NOT NULL DEFAULT 0,
  times_correct INTEGER NOT NULL DEFAULT 0,
  last_calibrated_at TIMESTAMPTZ,
  calibration_sample_size INTEGER NOT NULL DEFAULT 0,
  is_calibrated BOOLEAN NOT NULL DEFAULT false,
  is_active BOOLEAN NOT NULL DEFAULT true,

  -- Source tracking
  source TEXT DEFAULT 'manual',              -- 'manual' | 'ai_generated' | 'imported'
  generation_batch TEXT,                     -- batch ID for AI-generated questions

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for item selection queries
CREATE INDEX IF NOT EXISTS idx_cat_questions_domain ON cat_questions(domain_id);
CREATE INDEX IF NOT EXISTS idx_cat_questions_active ON cat_questions(is_active);
CREATE INDEX IF NOT EXISTS idx_cat_questions_topic ON cat_questions(topic_cluster);
CREATE INDEX IF NOT EXISTS idx_cat_questions_cognitive ON cat_questions(cognitive_level);
CREATE INDEX IF NOT EXISTS idx_cat_questions_difficulty ON cat_questions(difficulty_rating);
CREATE INDEX IF NOT EXISTS idx_cat_questions_domain_active ON cat_questions(domain_id, is_active);
CREATE INDEX IF NOT EXISTS idx_cat_questions_selection ON cat_questions(domain_id, is_active, cognitive_level);

-- RLS: Everyone can read active questions, only admins can write
ALTER TABLE cat_questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read active questions"
  ON cat_questions FOR SELECT
  USING (is_active = true);

CREATE POLICY "Service role can manage questions"
  ON cat_questions FOR ALL
  USING (auth.role() = 'service_role');


-- ─── 2. cat_sessions ────────────────────────────────────
-- Stores each CAT testing session

CREATE TABLE IF NOT EXISTS cat_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,

  -- Session configuration
  session_type TEXT NOT NULL DEFAULT 'field_test'
    CHECK (session_type IN (
      'field_test', 'boss_battle', 'final_boss', 'gauntlet', 'custom'
    )),
  domain_filter INTEGER,                     -- NULL for multi-domain (final_boss)

  -- CAT configuration snapshot
  config JSONB NOT NULL DEFAULT '{}',        -- CATConfig at session start

  -- Session results
  final_theta DOUBLE PRECISION,
  final_se DOUBLE PRECISION,
  passed BOOLEAN,
  cut_score DOUBLE PRECISION,
  total_questions INTEGER NOT NULL DEFAULT 0,
  correct_answers INTEGER NOT NULL DEFAULT 0,

  -- Timing
  time_limit_seconds INTEGER,
  time_spent_seconds INTEGER,
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,

  -- Response history (ordered array of responses)
  responses JSONB NOT NULL DEFAULT '[]',     -- {question_id, response, theta_after, se_after, time_spent}[]

  -- Theta progression for charts
  theta_history JSONB NOT NULL DEFAULT '[]', -- {question_number, theta, se}[]

  -- Domain performance breakdown
  domain_breakdown JSONB NOT NULL DEFAULT '{}', -- {domain_id: {correct, total, topics: string[]}}

  -- XP awarded
  xp_earned INTEGER NOT NULL DEFAULT 0,

  -- Status
  status TEXT NOT NULL DEFAULT 'active'
    CHECK (status IN ('active', 'completed', 'abandoned', 'timed_out')),

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for session queries
CREATE INDEX IF NOT EXISTS idx_cat_sessions_user ON cat_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_cat_sessions_type ON cat_sessions(session_type);
CREATE INDEX IF NOT EXISTS idx_cat_sessions_user_type ON cat_sessions(user_id, session_type);
CREATE INDEX IF NOT EXISTS idx_cat_sessions_domain ON cat_sessions(domain_filter);
CREATE INDEX IF NOT EXISTS idx_cat_sessions_status ON cat_sessions(status);

-- RLS: Users can only see their own sessions
ALTER TABLE cat_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own sessions"
  ON cat_sessions FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own sessions"
  ON cat_sessions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own sessions"
  ON cat_sessions FOR UPDATE
  USING (auth.uid() = user_id);


-- ─── 3. question_performance ─────────────────────────────
-- Per-question performance metrics for IRT calibration

CREATE TABLE IF NOT EXISTS question_performance (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID NOT NULL REFERENCES cat_questions(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  session_id UUID REFERENCES cat_sessions(id) ON DELETE SET NULL,

  -- Response data
  response INTEGER NOT NULL CHECK (response IN (0, 1)),  -- 0=wrong, 1=correct
  response_time_seconds DOUBLE PRECISION,

  -- Ability at time of response (for calibration)
  theta_at_response DOUBLE PRECISION,
  se_at_response DOUBLE PRECISION,

  -- Position in test
  question_number INTEGER NOT NULL,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for calibration queries
CREATE INDEX IF NOT EXISTS idx_qp_question ON question_performance(question_id);
CREATE INDEX IF NOT EXISTS idx_qp_user ON question_performance(user_id);
CREATE INDEX IF NOT EXISTS idx_qp_session ON question_performance(session_id);
CREATE INDEX IF NOT EXISTS idx_qp_question_response ON question_performance(question_id, response);

-- RLS: Users can see own performance, service role can read all for calibration
ALTER TABLE question_performance ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own performance"
  ON question_performance FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own performance"
  ON question_performance FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Service role can read all performance"
  ON question_performance FOR SELECT
  USING (auth.role() = 'service_role');


-- ─── Updated timestamp triggers ──────────────────────────

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_cat_questions_updated_at
  BEFORE UPDATE ON cat_questions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_cat_sessions_updated_at
  BEFORE UPDATE ON cat_sessions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();


-- ─── Migration notes ─────────────────────────────────────
--
-- This migration creates:
-- 1. cat_questions — question bank with IRT parameters (a, b, c)
-- 2. cat_sessions — adaptive test session records
-- 3. question_performance — per-item response data for calibration
--
-- All tables have RLS enabled.
-- Run this after the base schema migration.

-- ============================================================================
-- STORY MODE TABLES (detailed)
-- ============================================================================
-- ══════════════════════════════════════════════════════════════
-- Story Mode Phase 1: Foundation Migration (v2)
-- 8 tables for the visual novel engine + 5-act structure
-- ══════════════════════════════════════════════════════════════

-- Enable uuid extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ─── story_progress ─────────────────────────────────────────
-- Per-user, per-domain progress through 5 acts (2 teaching + field test + 1 teaching + boss battle)
CREATE TABLE IF NOT EXISTS story_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  domain_number INTEGER NOT NULL CHECK (domain_number BETWEEN 1 AND 8),
  current_act INTEGER NOT NULL DEFAULT 1 CHECK (current_act BETWEEN 1 AND 5),
  act1_completed BOOLEAN DEFAULT false,
  act2_completed BOOLEAN DEFAULT false,
  field_test_passed BOOLEAN DEFAULT false,
  field_test_score INTEGER,
  field_test_best_score INTEGER,
  field_test_attempts INTEGER DEFAULT 0,
  act4_completed BOOLEAN DEFAULT false,
  boss_battle_passed BOOLEAN DEFAULT false,
  boss_battle_score INTEGER,
  boss_battle_best_score INTEGER,
  boss_battle_attempts INTEGER DEFAULT 0,
  domain_conquered BOOLEAN DEFAULT false,
  conquered_at TIMESTAMPTZ,
  total_time_spent_minutes INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, domain_number)
);

ALTER TABLE story_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own story_progress"
  ON story_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own story_progress"
  ON story_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own story_progress"
  ON story_progress FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own story_progress"
  ON story_progress FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX idx_story_progress_user ON story_progress(user_id);

-- ─── scene_unlocks ──────────────────────────────────────────
-- Tracks individual scene completion for replay access
CREATE TABLE IF NOT EXISTS scene_unlocks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  scene_id TEXT NOT NULL,
  domain_number INTEGER NOT NULL,
  act_number INTEGER NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT NOW(),
  replay_count INTEGER DEFAULT 0,
  last_replayed_at TIMESTAMPTZ,
  UNIQUE(user_id, scene_id)
);

ALTER TABLE scene_unlocks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own scene_unlocks"
  ON scene_unlocks FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own scene_unlocks"
  ON scene_unlocks FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own scene_unlocks"
  ON scene_unlocks FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own scene_unlocks"
  ON scene_unlocks FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX idx_scene_unlocks_user ON scene_unlocks(user_id);
CREATE INDEX idx_scene_unlocks_scene ON scene_unlocks(scene_id);

-- ─── scene_definitions (reference table) ────────────────────
-- SELECT only for authenticated users
CREATE TABLE IF NOT EXISTS scene_definitions (
  scene_id TEXT PRIMARY KEY,
  domain_number INTEGER NOT NULL,
  act_number INTEGER NOT NULL,
  scene_order INTEGER NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  concepts_covered TEXT[] DEFAULT '{}',
  glossary_terms TEXT[] DEFAULT '{}',
  library_topics TEXT[] DEFAULT '{}',
  estimated_minutes INTEGER DEFAULT 5,
  has_timed_decision BOOLEAN DEFAULT false,
  has_tlatm BOOLEAN DEFAULT false,
  scene_type TEXT DEFAULT 'teaching' CHECK (scene_type IN ('teaching', 'narrative', 'evidence', 'briefing', 'debrief')),
  analogy_name TEXT,
  analogy_npc TEXT,
  interactive_image_type TEXT CHECK (interactive_image_type IN ('exploration', 'process_flow', 'comparison', 'calculation', 'decision_map', 'timeline', NULL))
);

ALTER TABLE scene_definitions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read scene_definitions"
  ON scene_definitions FOR SELECT
  TO authenticated
  USING (true);

CREATE INDEX idx_scene_definitions_domain_act ON scene_definitions(domain_number, act_number);

-- ─── concept_analogies (reference table) ────────────────────
-- SELECT only for authenticated users
CREATE TABLE IF NOT EXISTS concept_analogies (
  concept_name TEXT PRIMARY KEY,
  analogy_name TEXT NOT NULL,
  analogy_description TEXT NOT NULL,
  npc_owner TEXT NOT NULL,
  domain_number INTEGER NOT NULL,
  scene_id_introduced TEXT,
  image_reference TEXT
);

ALTER TABLE concept_analogies ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read concept_analogies"
  ON concept_analogies FOR SELECT
  TO authenticated
  USING (true);

-- ─── final_chapter_progress ─────────────────────────────────
-- Tracks TLATM Gauntlet + Final Boss completion
CREATE TABLE IF NOT EXISTS final_chapter_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE UNIQUE,
  tlatm_gauntlet_completed BOOLEAN DEFAULT false,
  tlatm_gauntlet_score INTEGER,
  final_boss_passed BOOLEAN DEFAULT false,
  final_boss_score INTEGER,
  final_boss_best_score INTEGER,
  final_boss_attempts INTEGER DEFAULT 0,
  cissp_legend_earned BOOLEAN DEFAULT false,
  completed_at TIMESTAMPTZ
);

ALTER TABLE final_chapter_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own final_chapter_progress"
  ON final_chapter_progress FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own final_chapter_progress"
  ON final_chapter_progress FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own final_chapter_progress"
  ON final_chapter_progress FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own final_chapter_progress"
  ON final_chapter_progress FOR DELETE
  USING (auth.uid() = user_id);

-- ─── weak_topics ────────────────────────────────────────────
-- Tracks areas where user struggles for targeted review
CREATE TABLE IF NOT EXISTS weak_topics (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  topic_name TEXT NOT NULL,
  domain_number INTEGER NOT NULL,
  accuracy_percentage DECIMAL DEFAULT 0,
  total_questions INTEGER DEFAULT 0,
  correct_answers INTEGER DEFAULT 0,
  review_recommended BOOLEAN DEFAULT true,
  scene_id TEXT,
  analogy_name TEXT,
  last_calculated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, topic_name)
);

ALTER TABLE weak_topics ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own weak_topics"
  ON weak_topics FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own weak_topics"
  ON weak_topics FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own weak_topics"
  ON weak_topics FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own weak_topics"
  ON weak_topics FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX idx_weak_topics_user ON weak_topics(user_id);
CREATE INDEX idx_weak_topics_user_review ON weak_topics(user_id, review_recommended);

-- ─── concept_mastery ────────────────────────────────────────
-- Per-concept mastery tracking with accuracy and level
CREATE TABLE IF NOT EXISTS concept_mastery (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  concept_name TEXT NOT NULL,
  domain_number INTEGER NOT NULL,
  mastery_level TEXT DEFAULT 'unseen' CHECK (mastery_level IN ('unseen', 'struggling', 'learning', 'improving', 'mastered')),
  accuracy_percentage DECIMAL DEFAULT 0,
  total_attempts INTEGER DEFAULT 0,
  correct_attempts INTEGER DEFAULT 0,
  last_tested_at TIMESTAMPTZ,
  last_reviewed_at TIMESTAMPTZ,
  aha_moment_triggered BOOLEAN DEFAULT false,
  UNIQUE(user_id, concept_name)
);

ALTER TABLE concept_mastery ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own concept_mastery"
  ON concept_mastery FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own concept_mastery"
  ON concept_mastery FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own concept_mastery"
  ON concept_mastery FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own concept_mastery"
  ON concept_mastery FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX idx_concept_mastery_user ON concept_mastery(user_id);
CREATE INDEX idx_concept_mastery_user_level ON concept_mastery(user_id, mastery_level);

-- ─── spaced_repetition_schedule ─────────────────────────────
-- Tracks when concepts are due for review
CREATE TABLE IF NOT EXISTS spaced_repetition_schedule (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  scene_id TEXT NOT NULL,
  concept_name TEXT NOT NULL,
  last_reviewed_at TIMESTAMPTZ DEFAULT NOW(),
  next_review_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '3 days'),
  review_interval_days INTEGER DEFAULT 3,
  nudge_dismissed BOOLEAN DEFAULT false,
  UNIQUE(user_id, concept_name)
);

ALTER TABLE spaced_repetition_schedule ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own spaced_repetition_schedule"
  ON spaced_repetition_schedule FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own spaced_repetition_schedule"
  ON spaced_repetition_schedule FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own spaced_repetition_schedule"
  ON spaced_repetition_schedule FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own spaced_repetition_schedule"
  ON spaced_repetition_schedule FOR DELETE
  USING (auth.uid() = user_id);

CREATE INDEX idx_spaced_rep_user_next ON spaced_repetition_schedule(user_id, next_review_at);

-- ============================================================================
-- CISSP Quest - Glossary Bookmarks Table Migration
-- Paste this into Supabase SQL Editor and run
-- ============================================================================

-- Create the user_glossary_bookmarks table
CREATE TABLE IF NOT EXISTS public.user_glossary_bookmarks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  term TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, term)
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_glossary_bookmarks_user ON public.user_glossary_bookmarks(user_id);

-- Enable Row Level Security
ALTER TABLE public.user_glossary_bookmarks ENABLE ROW LEVEL SECURITY;

-- RLS Policies: users can only manage their own bookmarks
CREATE POLICY "Users can view own glossary bookmarks"
  ON public.user_glossary_bookmarks
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own glossary bookmarks"
  ON public.user_glossary_bookmarks
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own glossary bookmarks"
  ON public.user_glossary_bookmarks
  FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================================================
-- CISSP Quest - Question History Table Migration
-- Paste this into Supabase SQL Editor and run
-- ============================================================================

-- Create the user_question_history table
CREATE TABLE IF NOT EXISTS public.user_question_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  domain_id INT NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  selected_answer INT NOT NULL,
  correct_answer INT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT false,
  time_spent_seconds INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes for fast filtering and querying
CREATE INDEX IF NOT EXISTS idx_question_history_user_id ON public.user_question_history(user_id);
CREATE INDEX IF NOT EXISTS idx_question_history_domain ON public.user_question_history(user_id, domain_id);
CREATE INDEX IF NOT EXISTS idx_question_history_created ON public.user_question_history(user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_question_history_difficulty ON public.user_question_history(user_id, difficulty);
CREATE INDEX IF NOT EXISTS idx_question_history_correct ON public.user_question_history(user_id, is_correct);

-- Enable Row Level Security
ALTER TABLE public.user_question_history ENABLE ROW LEVEL SECURITY;

-- RLS Policies: users can only see and insert their own records
CREATE POLICY "Users can view own question history"
  ON public.user_question_history
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own question history"
  ON public.user_question_history
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own question history"
  ON public.user_question_history
  FOR DELETE
  USING (auth.uid() = user_id);

-- ============================================================================
-- NEW FEATURE TABLES (Exam Countdown, Daily Brief, Ghost POV, TLATM)
-- ============================================================================

-- exam_countdown: stores user's target CISSP exam date
CREATE TABLE IF NOT EXISTS public.exam_countdown (
  user_id UUID PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  exam_date DATE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE public.exam_countdown ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own exam_countdown" ON public.exam_countdown FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- daily_brief_completions: tracks which daily briefs a user has seen
CREATE TABLE IF NOT EXISTS public.daily_brief_completions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  brief_date DATE NOT NULL DEFAULT CURRENT_DATE,
  completed_at TIMESTAMPTZ DEFAULT NOW(),
  questions_answered INT DEFAULT 0,
  correct_answers INT DEFAULT 0,
  UNIQUE(user_id, brief_date)
);
ALTER TABLE public.daily_brief_completions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own daily_brief_completions" ON public.daily_brief_completions FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE INDEX IF NOT EXISTS idx_daily_brief_user_date ON public.daily_brief_completions(user_id, brief_date);

-- ghost_pov_progress: tracks Ghost's POV scene unlocks (premium)
CREATE TABLE IF NOT EXISTS public.ghost_pov_progress (
  user_id UUID PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  scene_a_unlocked BOOLEAN DEFAULT false,
  scene_b_unlocked BOOLEAN DEFAULT false,
  scene_c_unlocked BOOLEAN DEFAULT false,
  scene_a_completed BOOLEAN DEFAULT false,
  scene_b_completed BOOLEAN DEFAULT false,
  scene_c_completed BOOLEAN DEFAULT false,
  unlocked_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE public.ghost_pov_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own ghost_pov_progress" ON public.ghost_pov_progress FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- tlatm_sessions: Think Like A Manager meter per story session
CREATE TABLE IF NOT EXISTS public.tlatm_sessions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  domain_number INTEGER NOT NULL,
  act_number INTEGER NOT NULL,
  manager_score INTEGER DEFAULT 0,
  technician_score INTEGER DEFAULT 0,
  total_decisions INTEGER DEFAULT 0,
  final_rating TEXT CHECK (final_rating IN ('pure_manager','lean_manager','balanced','lean_technician','pure_technician')),
  completed_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE public.tlatm_sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own tlatm_sessions" ON public.tlatm_sessions FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE INDEX IF NOT EXISTS idx_tlatm_user ON public.tlatm_sessions(user_id);

-- tanaka_notebook_unlocks: which notebook entries are unlocked
CREATE TABLE IF NOT EXISTS public.tanaka_notebook_unlocks (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  domain_number INTEGER NOT NULL CHECK (domain_number BETWEEN 1 AND 8),
  unlocked_at TIMESTAMPTZ DEFAULT NOW(),
  read_count INTEGER DEFAULT 0,
  last_read_at TIMESTAMPTZ,
  PRIMARY KEY(user_id, domain_number)
);
ALTER TABLE public.tanaka_notebook_unlocks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own tanaka_notebook_unlocks" ON public.tanaka_notebook_unlocks FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- constellation_nodes: tracks which knowledge graph nodes a user has unlocked
CREATE TABLE IF NOT EXISTS public.constellation_nodes (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  concept_id TEXT NOT NULL,
  domain_number INTEGER NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT NOW(),
  mastery_level TEXT DEFAULT 'seen' CHECK (mastery_level IN ('seen','learning','mastered')),
  PRIMARY KEY(user_id, concept_id)
);
ALTER TABLE public.constellation_nodes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users can manage own constellation_nodes" ON public.constellation_nodes FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE INDEX IF NOT EXISTS idx_constellation_user ON public.constellation_nodes(user_id);
