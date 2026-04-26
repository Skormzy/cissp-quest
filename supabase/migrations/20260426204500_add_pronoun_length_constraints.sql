-- Defense-in-depth length caps on pronoun fields.
-- The wizard already enforces maxLength at the UI layer; these CHECK constraints
-- enforce the same bound at the storage layer. 1..14 chars accommodates the
-- longest realistic pronoun forms (e.g. "themselves" = 10) plus headroom for
-- custom neopronouns, while preventing arbitrary-length input via direct API.

ALTER TABLE public.player_profile
  ADD CONSTRAINT pronoun_subject_length
    CHECK (char_length(pronoun_subject) BETWEEN 1 AND 14);

ALTER TABLE public.player_profile
  ADD CONSTRAINT pronoun_object_length
    CHECK (char_length(pronoun_object) BETWEEN 1 AND 14);

ALTER TABLE public.player_profile
  ADD CONSTRAINT pronoun_possessive_length
    CHECK (char_length(pronoun_possessive) BETWEEN 1 AND 14);

ALTER TABLE public.player_profile
  ADD CONSTRAINT pronoun_reflexive_length
    CHECK (char_length(pronoun_reflexive) BETWEEN 1 AND 14);
