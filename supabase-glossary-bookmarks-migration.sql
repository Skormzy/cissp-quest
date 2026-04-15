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
