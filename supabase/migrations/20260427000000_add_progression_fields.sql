-- Phase 2 progression fields on player_profile.
-- xp: cumulative experience earned across all activities (quiz, story, gauntlet).
-- current_level: derived from xp via levelForXp() in src/lib/leveling.ts; persisted
--   so the sidebar/dashboard can render without recomputing on every read.
-- rank_title: derived from current_level via rankForLevel(); persisted alongside
--   so leaderboards/profile cards can read a single row without a code lookup.
-- All three are kept in sync by awardXp() in src/lib/progression.ts.

ALTER TABLE public.player_profile
  ADD COLUMN IF NOT EXISTS xp integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS current_level integer NOT NULL DEFAULT 1,
  ADD COLUMN IF NOT EXISTS rank_title text NOT NULL DEFAULT 'Recruit';
