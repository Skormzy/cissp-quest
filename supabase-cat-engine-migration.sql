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
