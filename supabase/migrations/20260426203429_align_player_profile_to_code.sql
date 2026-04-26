-- Align player_profile schema to wizard CharacterConfig code.
-- Source of truth: src/app/app/create-character/page.tsx handleSave payload.
--
-- Changes:
--   1. Add eye_shape integer NOT NULL DEFAULT 1.
--   2. Convert skin_tone, hair_style, outfit from text to integer.
--      USING ::integer is safe: zero rows present at migration time
--      (verified pre-apply); no dirty data to handle.
--   3. Drop CHECK constraints on pronoun_subject/object/possessive/reflexive
--      so users can enter custom pronouns (xe/xem/xyr, etc.).
--      The Step-2 wizard input is free text; the prior whitelists were
--      copy-pasted from defaultPronounsFor() and rejected legitimate input.
--      gender_check (male/female/nonbinary) and display_name_check (1..40)
--      are preserved — they match avatarGenderToDb output and NAME_MAX.
--   4. Add created_at timestamptz NOT NULL DEFAULT now() for hygiene.

ALTER TABLE public.player_profile
  ADD COLUMN IF NOT EXISTS eye_shape integer NOT NULL DEFAULT 1;

ALTER TABLE public.player_profile
  ALTER COLUMN skin_tone TYPE integer USING skin_tone::integer;

ALTER TABLE public.player_profile
  ALTER COLUMN hair_style TYPE integer USING hair_style::integer;

ALTER TABLE public.player_profile
  ALTER COLUMN outfit TYPE integer USING outfit::integer;

ALTER TABLE public.player_profile
  DROP CONSTRAINT IF EXISTS player_profile_pronoun_subject_check,
  DROP CONSTRAINT IF EXISTS player_profile_pronoun_object_check,
  DROP CONSTRAINT IF EXISTS player_profile_pronoun_possessive_check,
  DROP CONSTRAINT IF EXISTS player_profile_pronoun_reflexive_check;

ALTER TABLE public.player_profile
  ADD COLUMN IF NOT EXISTS created_at timestamptz NOT NULL DEFAULT now();
