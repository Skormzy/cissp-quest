-- 20260427_150000 atomic award_xp_idempotent RPC
--
-- Replaces the two-round-trip awardXp pattern (insert log, then update
-- profile) with a single SECURITY DEFINER function that performs both
-- writes inside one Postgres transaction. Eliminates the partial-state
-- bug where the log row could outlive a failed profile update.
--
-- Returns a row containing the new state plus delta + leveledUp /
-- rankedUp flags. The caller does NOT need to read player_profile
-- separately.

-- Helper: level for a given xp total. Mirrors src/lib/leveling.ts so
-- the server is the source of truth, not the client.
CREATE OR REPLACE FUNCTION public.level_for_xp(p_xp INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
  IF p_xp < 0 THEN RETURN 1; END IF;
  -- Linear schedule: 100 xp per level. Adjust here if the client ever
  -- changes its leveling curve.
  RETURN GREATEST(1, FLOOR(p_xp / 100.0)::INTEGER + 1);
END;
$$;

CREATE OR REPLACE FUNCTION public.rank_for_level(p_level INTEGER)
RETURNS TEXT
LANGUAGE plpgsql
IMMUTABLE
AS $$
BEGIN
  IF p_level >= 50 THEN RETURN 'CISSP Legend';        END IF;
  IF p_level >= 35 THEN RETURN 'Senior Architect';    END IF;
  IF p_level >= 25 THEN RETURN 'Senior Analyst';      END IF;
  IF p_level >= 15 THEN RETURN 'Analyst';             END IF;
  IF p_level >= 8  THEN RETURN 'Junior Analyst';      END IF;
  IF p_level >= 3  THEN RETURN 'Trainee';             END IF;
  RETURN 'Recruit';
END;
$$;

CREATE OR REPLACE FUNCTION public.award_xp_idempotent(
  p_user_id UUID,
  p_amount  INTEGER,
  p_reason  TEXT
)
RETURNS TABLE (
  new_xp     INTEGER,
  new_level  INTEGER,
  new_rank   TEXT,
  delta      INTEGER,
  leveled_up BOOLEAN,
  ranked_up  BOOLEAN,
  no_op      BOOLEAN
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
DECLARE
  v_old_xp     INTEGER;
  v_old_level  INTEGER;
  v_old_rank   TEXT;
  v_new_xp     INTEGER;
  v_new_level  INTEGER;
  v_new_rank   TEXT;
  v_inserted   BOOLEAN := FALSE;
BEGIN
  IF p_user_id IS NULL THEN
    RAISE EXCEPTION 'award_xp_idempotent: p_user_id is required';
  END IF;
  IF p_amount IS NULL OR p_amount < 0 OR p_amount > 10000 THEN
    RAISE EXCEPTION 'award_xp_idempotent: amount out of range (got %)', p_amount;
  END IF;
  IF p_reason IS NULL OR length(p_reason) = 0 OR length(p_reason) > 200 THEN
    RAISE EXCEPTION 'award_xp_idempotent: reason must be 1-200 chars';
  END IF;

  -- Lock the player_profile row for the duration of this transaction.
  SELECT xp, current_level, rank_title
    INTO v_old_xp, v_old_level, v_old_rank
    FROM player_profile
   WHERE user_id = p_user_id
   FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'award_xp_idempotent: player_profile row not found for user %', p_user_id;
  END IF;

  -- Idempotency gate: try to claim the grant. ON CONFLICT DO NOTHING
  -- so a duplicate (user_id, reason) returns zero affected rows.
  INSERT INTO xp_grant_log (user_id, reason, amount)
       VALUES (p_user_id, p_reason, p_amount)
  ON CONFLICT (user_id, reason) DO NOTHING;

  GET DIAGNOSTICS v_inserted = ROW_COUNT;

  IF v_inserted = 0 THEN
    -- Already granted for this reason. Return current state, delta=0.
    RETURN QUERY SELECT
      v_old_xp,
      v_old_level,
      v_old_rank,
      0,
      FALSE,
      FALSE,
      TRUE;
    RETURN;
  END IF;

  v_new_xp    := COALESCE(v_old_xp, 0) + p_amount;
  v_new_level := public.level_for_xp(v_new_xp);
  v_new_rank  := public.rank_for_level(v_new_level);

  UPDATE player_profile
     SET xp            = v_new_xp,
         current_level = v_new_level,
         rank_title    = v_new_rank,
         updated_at    = NOW()
   WHERE user_id = p_user_id;

  RETURN QUERY SELECT
    v_new_xp,
    v_new_level,
    v_new_rank,
    p_amount,
    (v_new_level > COALESCE(v_old_level, 1)),
    (v_new_rank IS DISTINCT FROM COALESCE(v_old_rank, 'Recruit')),
    FALSE;
END;
$$;

REVOKE ALL ON FUNCTION public.award_xp_idempotent(UUID, INTEGER, TEXT) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.award_xp_idempotent(UUID, INTEGER, TEXT) TO authenticated, service_role;

COMMENT ON FUNCTION public.award_xp_idempotent IS
  'Atomic XP grant. Single transaction: inserts xp_grant_log + updates player_profile. Returns no_op=true on duplicate (user_id, reason). The caller never needs a separate read.';
