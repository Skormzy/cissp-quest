-- 20260427_120000 XP grant idempotency
--
-- Eliminates double/triple/N-tuple XP grants caused by:
--   - React Strict Mode double-mount
--   - Client-side dedupe race conditions
--   - User navigation that re-fires scene-completion handlers
--
-- The server's awardXp() reads from this log before granting. If a row
-- already exists for (user_id, reason), the grant is a no-op. If not,
-- the row is inserted in the same transaction as the player_profile
-- update, so partial states cannot occur.

CREATE TABLE IF NOT EXISTS xp_grant_log (
  id          BIGSERIAL PRIMARY KEY,
  user_id     UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  reason      TEXT NOT NULL CHECK (char_length(reason) BETWEEN 1 AND 200),
  amount      INTEGER NOT NULL CHECK (amount >= 0 AND amount <= 10000),
  granted_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT xp_grant_log_user_reason_unique UNIQUE (user_id, reason)
);

CREATE INDEX IF NOT EXISTS idx_xp_grant_log_user
  ON xp_grant_log(user_id, granted_at DESC);

ALTER TABLE xp_grant_log ENABLE ROW LEVEL SECURITY;

-- Users can read their own grant history (for "XP earned" lists).
CREATE POLICY "xp_grant_log_select_own"
  ON xp_grant_log FOR SELECT
  USING (auth.uid() = user_id);

-- Inserts happen ONLY through the server route (service role). No client
-- INSERT policy is intentionally provided.

-- Audit comment.
COMMENT ON TABLE xp_grant_log IS
  'Append-only ledger of XP grants. Unique (user_id, reason) enforces idempotency at the database level so awardXp() cannot double-pay the same trigger.';
