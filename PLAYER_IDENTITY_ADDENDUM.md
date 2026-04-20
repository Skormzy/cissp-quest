# Player Identity Requirement Addendum
> Added 2026-04-20 as an override to `MASTER_REBUILD_PLAN.md` and `CISSP-Quest-Full-Rebuild-Spec.md`.
> Where any prior document conflicts with this addendum, THIS DOCUMENT WINS.

## Summary

The player character is NOT a fixed "Alex Mercer" protagonist. The narrative originally written around a named, gendered character must be generalized so every user creates their own identity at onboarding and sees it reflected across the entire experience.

## Hard requirements

1. **Custom player name.** The user types their own name at onboarding. This name is used by NPCs in dialogue (spoken and written), shown on the dashboard, results screens, leaderboards, achievement certificates, and the "I Passed" ceremony.

2. **Gender selection.** Male or female at minimum. Drives the base character model AND the pronoun system used in NPC dialogue about the player.

3. **Appearance customization.** At minimum:
   - Skin tone (existing: 6 options, may expand)
   - Eye color (NOT in existing system, must be added)
   - Hair style (existing: 8 options, may expand)
   - Hair color (NOT explicitly in existing system, verify and add if missing)
   - Outfit (existing: 5 options, may expand)

4. **Persistence.** Customization is loaded on every page: dashboard, story scenes, quizzes, results, leaderboards, community features. Character appearance is rendered as an SVG overlay (not generated via Replicate per scene) so it can stay consistent for any player's choices.

## Database schema implication

Add a new table to the story schema (placed before `player_progress` in `CISSP-Quest-Full-Rebuild-Spec.md` section 1.5):

```sql
CREATE TABLE player_profile (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT NOT NULL CHECK (char_length(display_name) BETWEEN 1 AND 40),
  gender TEXT NOT NULL CHECK (gender IN ('male', 'female')),
  pronoun_subject TEXT NOT NULL,     -- "he" / "she" / "they"
  pronoun_object TEXT NOT NULL,      -- "him" / "her" / "them"
  pronoun_possessive TEXT NOT NULL,  -- "his" / "her" / "their"
  skin_tone TEXT NOT NULL,
  eye_color TEXT NOT NULL,
  hair_style TEXT NOT NULL,
  hair_color TEXT NOT NULL,
  outfit TEXT NOT NULL,
  onboarding_completed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE player_profile ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read their own profile"
  ON player_profile FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own profile once"
  ON player_profile FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their appearance but not identity"
  ON player_profile FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
```

Note: the policy names above are a starting point. The RLS design needs adversarial review before production (see CRITICAL issue #2 in `REVIEW_FINDINGS_2026-04-19.md`: tier client-writable vulnerability. The same discipline applies here. The app should never allow a user to write display_name, gender, etc. via a client-side write that bypasses server validation for profanity, length, or anything else).

## Story content templating convention

Every narrative script (story_scenes, story_decisions, NPC dialogue, results screens) MUST use template placeholders instead of hardcoded "Alex":

| Placeholder | Replaced with | Example |
|-------------|---------------|---------|
| `{playerName}` | display_name | "Good work, {playerName}." |
| `{pronoun}` | pronoun_subject | "{pronoun} walks into the SOC." |
| `{pronounObject}` | pronoun_object | "Tanaka hands {pronounObject} the laptop." |
| `{pronounPossessive}` | pronoun_possessive | "{pronounPossessive} fingers hover over the keyboard." |
| `{Pronoun}` | capitalized pronoun_subject | "{Pronoun} is right." |

Substitution happens at render time in the VisualNovelEngine before each scene displays. Do not substitute at content-authoring time because users can change their name/gender retroactively (edge case, but the system should support it).

## NPC dialogue authoring rules (CRITICAL)

Writers working on story content MUST follow these rules to avoid breaking gender-neutral rendering:

1. **Never use "Alex" in any new content.** Always `{playerName}`.
2. **Never use "he/she/him/her/his" to refer to the player.** Always `{pronoun}` / `{pronounObject}` / `{pronounPossessive}`.
3. **Avoid appearance-dependent language.** If a line says "her red hair flashed" that breaks for users who chose other hair colors. Either omit or make generic ("their hair catches the light").
4. **Gender-specific honorifics need branching.** "Mr. {playerName}" or "Ms. {playerName}" requires a `{playerTitle}` placeholder that derives from gender. Prefer gender-neutral address ("Analyst {playerName}") where narratively plausible.
5. **The one exception:** NPCs can have fixed gendered references to themselves or other NPCs. Only references TO THE PLAYER need templating.

## Image generation strategy (IMPORTANT)

The 79 Replicate image prompts in `scripts/image-prompts-manifest.json` include one specifically named `title_screen` with "Alex Mercer silhouette." Two things need to happen:

1. **Remove or rewrite that prompt.** The title screen should either (a) not feature the player character at all, (b) show a silhouette with the customized SVG overlaid on top at render time, or (c) show a generic cybersecurity scene without a character.

2. **Audit all other prompts** for any that feature the player. Scenes that include the player should be composed with the player OFF-SCREEN, SILHOUETTED from behind, or rendered as the SVG avatar in a separate layer on top of the Replicate background. Do NOT generate images that bake in a fixed player appearance.

## Existing code changes needed

Based on discovery at 2026-04-20:
- `src/components/character/CharacterAvatar.tsx` - needs expansion to include eye color and explicit hair color attributes. Verify it accepts all profile fields as props.
- `src/app/app/create-character/page.tsx` - needs to add: name input field, gender selector, eye color picker, hair color picker. Needs to wire through to a Supabase insert to the new `player_profile` table. Needs to gate access to Act 1 until `onboarding_completed_at` is set.
- `src/middleware.ts` (verify exists) - should redirect authenticated users who have no `player_profile` row to `/app/create-character` before letting them access any other `/app/*` route.

## Onboarding flow
User signs up -> auth.users row created
|
v
Middleware check: does player_profile row exist?
|
No (first time)
v
Redirect to /app/create-character (cannot be bypassed)
|
v
User fills in: display_name, gender, skin_tone, eye_color, hair_style, hair_color, outfit
|
v
Submit -> insert into player_profile with onboarding_completed_at = NOW()
|
v
Redirect to /app/dashboard (NOW accessible)
|
v
First Act auto-starts (or prompt to begin)

## Where this overrides the source documents

**MASTER_REBUILD_PLAN.md** - Every "Alex" reference is either a placeholder example OR a Dr. Tanaka line that speaks about the player. These need to be rewritten to either (a) use placeholder syntax, (b) be noted as authoring-time examples where the writer should substitute the player's actual customization at render, or (c) be generalized to not reference the player by name/gender at all.

**CISSP-Quest-Full-Rebuild-Spec.md** - Section 1.1 through 1.5 use "Alex" and gendered references extensively as narrative prose. These should be rewritten to describe the PLAYER EXPERIENCE in generic terms ("The player is an entry-level analyst" instead of "Alex Mercer is an entry-level analyst"). Section 1.3's NPC table should replace the "Alex Mercer | Player character" row with "{playerName} | Player character (customizable)".

**scripts/image-prompts-manifest.json** - Audit for player-character prompts. Replace/remove per image generation strategy above.

## Timeline for applying this addendum

This addendum is applied FIRST in any session that begins work on Acts, content, onboarding, or the DB schema. No narrative content should be written using fixed "Alex" language after 2026-04-20. Existing hardcoded content can be grandfathered until touched, but any edit to an existing scene/decision/dialogue must bring it into compliance with this addendum.

---

*Last updated: 2026-04-20 by Seymour. Non-negotiable.*
