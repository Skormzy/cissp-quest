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
