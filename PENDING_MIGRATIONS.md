# Pending DB Migrations

Two migrations need to be applied via the **Supabase dashboard → SQL Editor** before the redesign is fully active. Until applied, the app falls back to a legacy non-idempotent path with a `console.warn` so it keeps working.

## How to apply

1. Open Supabase dashboard for project `yebfaucgvblhctchlbvr`.
2. SQL Editor → New query.
3. Paste the contents of each file below in order. Run each.

## Files

### 1. `supabase/migrations/20260427120000_xp_grant_idempotency.sql`
Creates `xp_grant_log` with `UNIQUE(user_id, reason)` so the same XP grant cannot be paid twice.

### 2. `supabase/migrations/20260427150000_award_xp_rpc.sql`
Adds `award_xp_idempotent()` Postgres function — atomic single-transaction grant. Eliminates the partial-state bug where the log row could outlive a failed profile update.

### 3. `supabase/migrations/20260427180000_library_content_expansion.sql`
Expands the 40 seeded library topics with full content (markdown body, key formulas, exam tips, Think Like a Manager, memory hacks).

## After applying

The `console.warn` lines from `src/lib/progression.ts` will stop appearing in server logs. XP grants become atomic and idempotent, level-ups stop firing on raw scene clicks.

## Verification queries

```sql
-- 1. Confirm xp_grant_log exists and is empty (or populated as expected)
SELECT COUNT(*) FROM xp_grant_log;

-- 2. Confirm RPC exists
SELECT proname FROM pg_proc WHERE proname = 'award_xp_idempotent';

-- 3. Smoke test (replace UUID with a real user_id from player_profile)
SELECT * FROM award_xp_idempotent(
  '00000000-0000-0000-0000-000000000000'::uuid,
  10,
  'smoke-test-1'
);
-- First call: delta=10, no_op=false
-- Second call same args: delta=0, no_op=true
```
