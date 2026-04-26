# CISSP Quest — Manual Test Plan

> Created during Phase 1 (Player Identity System). Append new sections per phase.

## Phase 1: Player Identity System

### Smoke test (golden path)

1. **Fresh signup**
   - Open an incognito window. Visit `/signup`.
   - Sign up with a brand-new email. Confirm via the magic link.
   - **Expected:** After auth lands you anywhere under `/app/*`, middleware redirects you to `/app/app/create-character` (no `player_profile` row yet).

2. **Wizard happy path**
   - Step 1 — Gender: pick `Woman`.
   - Step 2 — Pronouns: confirm subject/object/possessive/reflexive auto-populate to `she / her / her / herself`.
   - Step 3 — Skin: pick any swatch.
   - Step 4 — Eyes: pick a shape and a color (e.g. Hazel).
   - Step 5 — Hair: pick a style and color.
   - Step 6 — Outfit: pick any outfit.
   - Step 7 — Identity: enter a display name (e.g. `Maya`), pick a future exam date.
   - Click **Save**.
   - **Expected:** Redirect to `/app/dashboard`. No console errors.

3. **Database verification**
   - In Supabase Studio (or `mcp__claude_ai_Supabase__execute_sql`), run:
     ```sql
     select user_id, display_name, gender, pronoun_subject, eye_color, exam_date
     from player_profile
     where user_id = '<the-new-user-uid>';
     ```
   - **Expected:** Exactly one row. `gender = 'female'` (not `Woman`). Pronouns match step 2. `display_name = 'Maya'`. `exam_date` is the chosen ISO date.

4. **Middleware gate after onboarding**
   - With the same authenticated session, visit `/app/dashboard` directly.
   - **Expected:** Loads normally. No redirect loop.
   - Visit `/app/app/create-character` directly.
   - **Expected:** Wizard loads (edit-in-place mode allowed by design — `upsert` handles re-saves).

5. **Token substitution in story**
   - Visit `/app/story/meridian/1` (or any unlocked Meridian domain).
   - Advance through dialogue.
   - **Expected:** Any line that previously read `Alex` now shows the chosen display name. Pronouns in token-substituted lines (`{pronoun}`, `{pronounObject}`, etc.) match the wizard input.

### Edge cases

6. **Pronouns step — manual override**
   - In a fresh wizard run, pick `Man`, advance, then go back, change to `Non-binary`.
   - **Expected:** Pronouns auto-update to `they / them / their / themself` (because `pronounsTouched` is still `false`).
   - Now manually edit the subject pronoun to `xe`.
   - Go back, switch gender to `Woman`.
   - **Expected:** Pronouns do **not** auto-overwrite (`pronounsTouched` flipped to `true`).

7. **Display name validation**
   - Try saving with an empty name. **Expected:** error message, save blocked.
   - Try saving with a name containing one of the profanity-filter words. **Expected:** error message.
   - Try a 41-character name. **Expected:** error message about max length.

8. **Exam date validation**
   - Open the date popover. **Expected:** Today and all past dates are disabled (greyed out / unselectable).

9. **Direct-URL access without a profile**
   - Sign up a second fresh user. Do **not** complete the wizard. Manually navigate to `/app/dashboard`.
   - **Expected:** Redirected to `/app/app/create-character`.
   - Try `/app/quiz`. **Expected:** Same redirect.
   - Try `/api/stripe/checkout` (any API route). **Expected:** API responds normally — middleware skips `/api/*`.

10. **Sign out / sign in round-trip**
    - Sign out. Sign back in with the user from step 1 (who has a profile).
    - **Expected:** Lands on `/app/dashboard`, no redirect to wizard.

### Regression checks

11. **Avatar variety preserved**
    - In `CharacterAvatar` previews across the wizard and dashboard, confirm the existing variety (skin/eyes/hair/outfit option counts) is unchanged. Eye color is purely additive — never required.

12. **Legacy `user.character_*` reads**
    - Visit `/app/profile`, `/app/dashboard`, and any page still reading `user.character_name` / `character_gender`.
    - **Expected:** Still work (the `user` slot in the Zustand store is untouched). Story pages prefer `profile.display_name` first, fall back to `user.character_name`, then `'Agent'`.

### Manual evidence to capture per session

For each smoke-test pass, capture:
- Browser console: clean (no errors, no React warnings).
- Network tab: `player_profile` upsert returns 200/201 with a single row.
- Supabase RLS: confirm the insert was made by the authenticated client (not service role) — i.e. the row's `user_id` matches `auth.uid()`.
