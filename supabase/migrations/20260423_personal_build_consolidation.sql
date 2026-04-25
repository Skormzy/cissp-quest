-- ===========================================================================
-- Personal Build Consolidation Migration
-- Date authored: 2026-04-25  (slug 20260423 keeps logical ordering with spec)
-- Spec refs: CISSP_QUEST_PERSONAL_BUILD_SPEC.md (Sections 3.1, 4.1-4.6)
--            RECONCILIATION_2026-04-21.md (Section 5 + Section 6 step 2)
--
-- Scope: Closes the gap between live DB (40 tables) and Stage 1 spec.
--   - Adds player_profile + 5 genuinely-missing tables
--   - Extends questions with 4 tag columns
--   - Renames 3 legacy tables to spec naming
--   - Drops 5 confirmed-empty duplicates
--   - Leaves 71 rows of scene_definitions, 37 rows of library_topics,
--     26 rows of scene_unlocks, 240 rows of questions, 1340 rows of
--     cat_questions completely untouched.
-- ===========================================================================


-- ===========================================================================
-- BLOCK 1: player_profile  (Spec Section 3.1, with addendum's nonbinary path)
-- ===========================================================================

CREATE TABLE IF NOT EXISTS player_profile (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT NOT NULL CHECK (char_length(display_name) BETWEEN 1 AND 40),
  gender TEXT NOT NULL
    CHECK (gender IN ('male', 'female', 'nonbinary')),
  pronoun_subject TEXT NOT NULL
    CHECK (pronoun_subject IN ('he', 'she', 'they')),
  pronoun_object TEXT NOT NULL
    CHECK (pronoun_object IN ('him', 'her', 'them')),
  pronoun_possessive TEXT NOT NULL
    CHECK (pronoun_possessive IN ('his', 'her', 'their')),
  pronoun_reflexive TEXT NOT NULL
    CHECK (pronoun_reflexive IN ('himself', 'herself', 'themself')),
  skin_tone TEXT NOT NULL,
  eye_color TEXT NOT NULL,
  hair_style TEXT NOT NULL,
  hair_color TEXT NOT NULL,
  outfit TEXT NOT NULL,
  exam_date DATE,                                     -- powers Exam Countdown widget
  onboarding_completed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE player_profile ENABLE ROW LEVEL SECURITY;

CREATE POLICY "player_profile_select_own"
  ON player_profile FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "player_profile_insert_own"
  ON player_profile FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "player_profile_update_own"
  ON player_profile FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);


-- ===========================================================================
-- BLOCK 2: Genuinely-missing tables
-- ===========================================================================

-- ---------- story_acts (Spec 4.1) -- public read --------------------------
CREATE TABLE IF NOT EXISTS story_acts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_number INT NOT NULL UNIQUE CHECK (act_number BETWEEN 1 AND 8),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  domain_weight_percent INT NOT NULL,
  title TEXT NOT NULL,
  subtitle TEXT NOT NULL,
  location TEXT NOT NULL,
  description TEXT,
  estimated_minutes INT,
  hero_image_url TEXT,
  unlock_condition TEXT NOT NULL DEFAULT 'sequential'
    CHECK (unlock_condition IN ('free', 'sequential', 'always')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE story_acts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "story_acts_public_read"
  ON story_acts FOR SELECT
  USING (true);

-- ---------- player_progress (Spec 4.2) ------------------------------------
CREATE TABLE IF NOT EXISTS player_progress (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  current_act INT DEFAULT 1,
  current_scene INT DEFAULT 1,
  total_xp INT DEFAULT 0,
  level INT DEFAULT 1,
  title TEXT DEFAULT 'Security Recruit',
  streak_current INT DEFAULT 0,
  streak_longest INT DEFAULT 0,
  streak_last_date DATE,
  tlatm_score INT DEFAULT 50,
  total_study_seconds INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE player_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "player_progress_select_own"
  ON player_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "player_progress_insert_own"
  ON player_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "player_progress_update_own"
  ON player_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ---------- player_act_progress (Spec 4.2) --------------------------------
CREATE TABLE IF NOT EXISTS player_act_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  act_id UUID NOT NULL REFERENCES story_acts(id),
  status TEXT NOT NULL DEFAULT 'locked'
    CHECK (status IN ('locked', 'in_progress', 'completed')),
  scenes_completed INT DEFAULT 0,
  total_scenes INT,
  assessment_score_percent FLOAT,
  best_assessment_score FLOAT,
  attempts INT DEFAULT 0,
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  UNIQUE (user_id, act_id)
);

ALTER TABLE player_act_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "player_act_progress_select_own"
  ON player_act_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "player_act_progress_insert_own"
  ON player_act_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "player_act_progress_update_own"
  ON player_act_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ---------- scene_images (Spec 4.4) -- public read ------------------------
CREATE TABLE IF NOT EXISTS scene_images (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  image_key TEXT NOT NULL UNIQUE,
  image_type TEXT NOT NULL
    CHECK (image_type IN ('background','character','evidence','diagram','ui','transition')),
  storage_path TEXT NOT NULL,
  public_url TEXT NOT NULL,
  prompt_used TEXT,
  seed INT,
  generated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE scene_images ENABLE ROW LEVEL SECURITY;

CREATE POLICY "scene_images_public_read"
  ON scene_images FOR SELECT
  USING (true);

-- ---------- toolkit_saved_states (Spec 4.6) -------------------------------
CREATE TABLE IF NOT EXISTS toolkit_saved_states (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tool_key TEXT NOT NULL,
  state_name TEXT,
  state_data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE toolkit_saved_states ENABLE ROW LEVEL SECURITY;

CREATE POLICY "toolkit_saved_states_select_own"
  ON toolkit_saved_states FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "toolkit_saved_states_insert_own"
  ON toolkit_saved_states FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "toolkit_saved_states_update_own"
  ON toolkit_saved_states FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
CREATE POLICY "toolkit_saved_states_delete_own"
  ON toolkit_saved_states FOR DELETE USING (auth.uid() = user_id);


-- ===========================================================================
-- BLOCK 3: ALTER existing questions table (additive, no data loss)
-- The existing library_topic_id UUID column stays. library_topic_slug is
-- added as a parallel for spec compatibility; both can coexist.
-- ===========================================================================

ALTER TABLE questions ADD COLUMN IF NOT EXISTS trap_type TEXT;
ALTER TABLE questions ADD COLUMN IF NOT EXISTS technique TEXT;
ALTER TABLE questions ADD COLUMN IF NOT EXISTS cross_domain INT[];
ALTER TABLE questions ADD COLUMN IF NOT EXISTS library_topic_slug TEXT;


-- ===========================================================================
-- BLOCK 4: Rename legacy tables for spec naming consistency
-- All three source tables are confirmed empty (per RECONCILIATION_2026-04-21).
-- ===========================================================================

ALTER TABLE user_question_history RENAME TO player_question_history;
ALTER TABLE achievements           RENAME TO player_achievements;
ALTER TABLE weak_topics            RENAME TO failed_concepts;

-- failed_concepts: add columns the spec wants (kept nullable; backfill +
-- SET NOT NULL on exam_objective handled in a separate content migration).
ALTER TABLE failed_concepts ADD COLUMN IF NOT EXISTS exam_objective TEXT;
ALTER TABLE failed_concepts ADD COLUMN IF NOT EXISTS resurfaced_in_act INT;
ALTER TABLE failed_concepts ADD COLUMN IF NOT EXISTS resolved BOOLEAN DEFAULT false;
ALTER TABLE failed_concepts ADD COLUMN IF NOT EXISTS resolved_at TIMESTAMPTZ;


-- ===========================================================================
-- BLOCK 5: Drop confirmed-empty legacy duplicates
-- All five tables had 0 rows at reconciliation time. CASCADE included to
-- defang any stale FK references; nothing should depend on these.
-- ===========================================================================

DROP TABLE IF EXISTS story_progress     CASCADE;  -- replaced by player_progress
DROP TABLE IF EXISTS story_progress_v2  CASCADE;  -- replaced by player_progress
DROP TABLE IF EXISTS exam_countdown     CASCADE;  -- exam_date now on player_profile
DROP TABLE IF EXISTS user_answers       CASCADE;  -- duplicate of player_question_history
DROP TABLE IF EXISTS user_bookmarks     CASCADE;  -- duplicate of user_glossary_bookmarks


-- ===========================================================================
-- BLOCK 6: Explicit KEEP-AS-IS list (no DDL — documentation only)
-- ===========================================================================
-- KEEP: scene_definitions       (71 rows of seeded story content)
-- KEEP: library_topics          (37 rows of seeded library content)
-- KEEP: scene_unlocks           (26 rows of real play data)
-- KEEP: questions, cat_questions, cat_sessions, question_performance
-- KEEP: chatroom_messages, weekly_scores, forum_posts, forum_comments,
--       forum_votes, study_squads, squad_members, hall_of_fame,
--       notification_queue                       (Stage 2 community surface)
-- KEEP: users (legacy)                           (revisit in separate migration)


-- ===========================================================================
-- BLOCK 7: Sanity-check queries (commented; run manually after apply)
-- ===========================================================================
-- SELECT COUNT(*) FROM scene_definitions;  -- expect 71
-- SELECT COUNT(*) FROM library_topics;     -- expect 37
-- SELECT COUNT(*) FROM scene_unlocks;      -- expect 26
-- SELECT COUNT(*) FROM questions;          -- expect 240
-- SELECT COUNT(*) FROM cat_questions;      -- expect 1340
-- SELECT 1 FROM information_schema.tables
--   WHERE table_schema = 'public' AND table_name = 'player_profile';  -- expect 1
