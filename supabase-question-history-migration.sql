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
