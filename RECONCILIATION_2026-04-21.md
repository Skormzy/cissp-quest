# CISSP Quest Reality vs Spec Reconciliation

> Reconciliation date: 2026-04-23
> Reference spec: CISSP_QUEST_PERSONAL_BUILD_SPEC.md + PART2 + PLAYER_IDENTITY_ADDENDUM.md
> Purpose: Codebase is materially further along than handoff docs claimed. This file restates ground truth.

---

## Section 1: shadcn components inventory

### Installed in `src/components/ui/`
```
alert-dialog.tsx   badge.tsx          button.tsx         card.tsx
chart.tsx          command.tsx        dialog.tsx         dropdown-menu.tsx
input.tsx          input-group.tsx    label.tsx          MasteryRing.tsx
popover.tsx        progress.tsx       scroll-area.tsx    select.tsx
separator.tsx      sheet.tsx          skeleton.tsx       slider.tsx
sonner.tsx         switch.tsx         tabs.tsx           textarea.tsx
tooltip.tsx
```

### Against the spec list

| Spec component     | Status  | Notes |
|--------------------|---------|-------|
| button             | PRESENT | |
| card               | PRESENT | |
| input              | PRESENT | |
| select             | PRESENT | |
| radio-group        | MISSING | Needed for character creator and decision scenes (spec 3.2, 5.3) |
| checkbox           | MISSING | Needed for quiz builder filters, settings |
| dialog             | PRESENT | |
| sheet              | PRESENT | |
| tabs               | PRESENT | |
| accordion          | MISSING | Needed for Library topic collapsibles |
| badge              | PRESENT | |
| alert              | MISSING | Have `alert-dialog` but not `alert` (inline banner) |
| sonner             | PRESENT | |
| tooltip            | PRESENT | |
| popover            | PRESENT | |
| dropdown-menu      | PRESENT | |
| navigation-menu    | MISSING | Likely replaceable by existing custom `Navbar.tsx` |
| sidebar            | MISSING | Needed for Reference Library left nav |
| table              | MISSING | Needed for Library comparison tables and admin views |
| scroll-area        | PRESENT | |
| separator          | PRESENT | |
| progress           | PRESENT | |
| slider             | PRESENT | |
| switch             | PRESENT | |
| form               | MISSING | Needed for character creator wizard (spec 3.2) |
| command            | PRESENT | |
| avatar             | MISSING | Needed for NPC portraits in chat UI |

**Components in `ui/` that are NOT shadcn primitives (move out):**
- `MasteryRing.tsx` — custom domain-progress visual, not a shadcn primitive. Should move to `src/components/dashboard/` or `src/components/medals/`.

**Extra shadcn primitives installed beyond spec (keep):**
- `alert-dialog`, `chart`, `input-group`, `label`, `skeleton`, `textarea`

**Net install list for next shadcn add call:** `radio-group checkbox accordion alert navigation-menu sidebar table form avatar` (9 components).

---

## Section 2: Database schema inventory

Spec Section 4 wants these new tables: `player_profile`, `story_acts`, `story_scenes`, `story_decisions`, `knowledge_checks`, `player_progress`, `player_act_progress`, `player_scene_progress`, `player_question_history`, `failed_concepts`, `player_achievements`, `scene_images`, `library_topics` (already exists but schema diverges), `toolkit_saved_states`. Plus ALTER COLUMNs on `questions`.

### Existing 40 tables, classified

| Table | Rows | Classification | Spec mapping / note |
|-------|-----:|----------------|---------------------|
| players (auth.users) | — | — | Supabase auth; spec references via FK |
| users | 0 | PRESENT, REPLACES | Legacy profile table. Spec replaces with `player_profile`. Decide: drop or migrate data. |
| player_profile | — | **MISSING, NEEDED** | Spec 3.1. Blocks middleware gate. |
| story_acts | — | **MISSING, NEEDED** | Spec 4.1. Currently hardcoded in `src/lib/story-content.ts`. |
| story_scenes | — | **MISSING, REPLACED BY** `scene_definitions` | `scene_definitions` (71 rows) stores scenes but columns do not match spec (`scene_id` TEXT key `d1a1s1` vs UUID + act_id FK; no `content JSONB`). Decide: migrate existing data into new `story_scenes` or adapt spec to keep `scene_definitions` schema. |
| scene_definitions | 71 | PRESENT, REPLACES | Holds 71 seeded scenes (Domain 1 Act 1 etc). Data is keeper. Schema mismatch with spec. |
| story_decisions | — | **MISSING, NEEDED** | Spec 4.1. Decision data currently embedded in story-content.ts. |
| knowledge_checks | — | **MISSING, NEEDED** | Spec 4.1. Partially overlaps with `questions` table. |
| questions | 240 | PRESENT, NEEDED | Spec keeps table, adds `trap_type`, `technique`, `cross_domain`, `library_topic_slug` columns (ALTER). Current schema uses `library_topic_id` UUID not `library_topic_slug`. |
| cat_questions | 1340 | PRESENT, NEEDED | CAT engine source. Spec does not redefine. Keep as-is. |
| cat_sessions | 0 | PRESENT, NEEDED | CAT run state. Keep. |
| question_performance | 20 | PRESENT, NEEDED | Calibration data for IRT. Keep. |
| pending_questions | 0 | PRESENT, UNCLEAR | Not in spec. Appears to be AI-generated question review queue. Keep for now. |
| player_progress | — | **MISSING, REPLACED BY** `story_progress` / `story_progress_v2` | Two legacy progress tables exist, both empty. Decide: drop both and create `player_progress` per spec. |
| story_progress | 0 | PRESENT, REPLACES | Legacy v1, empty. Safe to drop. |
| story_progress_v2 | 0 | PRESENT, REPLACES | Legacy v2, empty. Safe to drop. |
| player_act_progress | — | **MISSING, NEEDED** | Spec 4.2. |
| player_scene_progress | — | **MISSING, REPLACED BY** `scene_unlocks` | `scene_unlocks` (26 rows) tracks unlocked scenes per user but missing `decision_choice`, `knowledge_check_correct`, `time_spent_seconds` columns. Decide: ALTER existing or create new. |
| scene_unlocks | 26 | PRESENT, REPLACES | Real play data exists. Migrate, do not drop. |
| player_question_history | — | **MISSING, REPLACED BY** `user_question_history` | Columns likely overlap. Verify and rename or adapt. |
| user_question_history | 0 | PRESENT, REPLACES | Empty — safe to rename to `player_question_history` or deprecate. |
| user_question_schedule | 0 | PRESENT, UNCLEAR | Spaced repetition scheduler. Not in spec's Section 4 but used by `src/lib/cat-session.ts`? Keep pending audit. |
| user_answers | 0 | PRESENT, UNCLEAR | Possibly overlapping with `user_question_history`. Dedupe. |
| spaced_repetition_schedule | 0 | PRESENT, NEEDED | Spec Section 9 implies resurfacing logic. Keep. |
| failed_concepts | — | **MISSING, REPLACED BY** `weak_topics` | `weak_topics` empty. Decide: rename or recreate per spec. |
| weak_topics | 0 | PRESENT, REPLACES | Empty, safe to drop/rename. |
| concept_mastery | 0 | PRESENT, UNCLEAR | Mastery tracking not explicit in spec Section 4 but implied by dashboard. Keep. |
| concept_analogies | 0 | PRESENT, UNCLEAR | Narrative-encoding content table. Likely keeper. |
| player_achievements | — | **MISSING, REPLACED BY** `achievements` | `achievements` empty. Rename or recreate. |
| achievements | 0 | PRESENT, REPLACES | Empty. |
| scene_images | — | **MISSING, NEEDED** | Spec 4.4. Referenced by `scene_definitions.background_image_key` pattern. |
| library_topics | 37 | PRESENT, SCHEMA DIVERGES | Spec 4.5 uses `slug`, `short_description`, `content_md`, `visualization_component`, `exam_traps`, `related_scenes`. Current uses `topic_number`, `one_liner`, `content_markdown`, `think_like_manager`, `memory_anchor`, `key_formulas`, `comparison_table`. Real content (37 rows) exists for Domain 1. Decide: ALTER to add missing columns vs rewrite spec to match reality. |
| toolkit_saved_states | — | **MISSING, NEEDED** | Spec 4.6. Unblocks tool persistence for Risk Calculator etc. |
| user_glossary_bookmarks | 0 | PRESENT, NEEDED | Glossary bookmarks feature. |
| user_bookmarks | 0 | PRESENT, UNCLEAR | Dedupe with `user_glossary_bookmarks`. |
| exam_countdown | 0 | PRESENT, DEFERRED | Exam date now lives on `player_profile`. Drop. |
| daily_brief_completions | 0 | PRESENT, NEEDED | Dashboard Daily Brief tracking. |
| tlatm_sessions | 0 | PRESENT, NEEDED | Think-Like-A-Manager meter sessions (spec Section 7.4). |
| ghost_pov_progress | 0 | PRESENT, NEEDED | Ghost POV feature progress. |
| final_chapter_progress | 0 | PRESENT, NEEDED | Final chapter (Act 8) progress. |
| chapter_lessons | 0 | PRESENT, UNCLEAR | Possibly duplicates `scene_definitions`. |
| tanaka_notebook_unlocks | 0 | PRESENT, NEEDED | Tanaka notebook lore unlocks. |
| constellation_nodes | 0 | PRESENT, NEEDED | Evidence Constellation graph state. |
| domain_medals | 0 | PRESENT, NEEDED | Medal system. |
| prestige_records | 0 | PRESENT, NEEDED | Prestige after full completion. |
| hall_of_fame | 0 | PRESENT, DEFERRED | Community surface. Stage 2. |
| chatroom_messages | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| weekly_scores | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| notification_queue | 0 | PRESENT, DEFERRED | Notifications. Stage 2. |
| forum_posts | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| forum_comments | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| forum_votes | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| study_squads | 0 | PRESENT, DEFERRED | Community. Stage 2. |
| squad_members | 0 | PRESENT, DEFERRED | Community. Stage 2. |

### Truly missing (must create)
1. `player_profile` (Spec 3.1) — **blocker for middleware gate.**
2. `story_acts` (Spec 4.1) — story structure parent.
3. `story_decisions` (Spec 4.1) — decision scenes.
4. `knowledge_checks` (Spec 4.1) — or explicitly reuse `questions`.
5. `player_progress` (Spec 4.2) — overall progression.
6. `player_act_progress` (Spec 4.2).
7. `scene_images` (Spec 4.4) — image asset registry.
8. `toolkit_saved_states` (Spec 4.6).
9. ALTER `questions` ADD `trap_type`, `technique`, `cross_domain`, `library_topic_slug`.

### Schema reconciliation decisions owed
- `scene_definitions` vs spec `story_scenes` — 71 rows of real data. Adapt spec to existing shape, or write migration.
- `library_topics` current schema vs spec — 37 rows of real content. Adapt spec columns.
- `scene_unlocks` has 26 rows of play data. Extend, do not drop.
- `story_progress` + `story_progress_v2` + `user_question_history` + `weak_topics` + `achievements` + `exam_countdown` — all empty, all duplicated by new spec names. Safe to drop-and-rename.

---

## Section 3: Source code inventory

### `src/app/` (App Router)
```
(auth)/{confirm, login, reset-password, signup}
api/stripe/
app/{community, create-character, dashboard, domains, history, library,
     profile, quiz, ranks, readiness, results, story, tools, upgrade,
     layout.tsx}
auth/{callback, layout.tsx, login, signup}
favicon.ico, globals.css, layout.tsx, page.tsx
```
**Summary:** Auth routes exist in two places (`(auth)/` and `/auth/`) which is duplicate and needs consolidation. `/app/*` is the authenticated shell with 14 feature folders including all the spec's major surfaces (create-character, dashboard, story, library, quiz, tools). Stripe API route exists but is Stage 2 per spec.

### `src/components/`
```
audio/           AudioSettings.tsx
character/       CharacterAvatar.tsx
community/       DomainLounge.tsx, WeeklyLeaderboard.tsx
dashboard/       DailyBrief.tsx, ExamCountdown.tsx
layout/          AppShell.tsx
medals/          MedalBadge.tsx, MedalGrid.tsx, medal-utils.ts
nav/             Navbar.tsx
quiz/            CATQuizEngine.tsx, IPassedCeremony.tsx, QuizCard.tsx, QuizResults.tsx
story/           CrisisWire, DialogueRenderer, EvidenceBoard, EvidencePanel,
                 ForensicTimeline, InteractiveImageDisplay, KnowledgeCheck(+Popup),
                 portraits/, StoryQuizEngine, TanakaNotebook, ThinkLikeManagerPopup,
                 TimedDecisionOverlay, TLATMMeter, TransitionOverlay,
                 VisualAidDisplay, VisualNovelEngine, VisualNovelEngineV2
tools/           AccessControlLab, CryptoWorkbench, EvidenceConstellation,
                 IRCommander, NetworkTopologyTracer, RiskCalculator
ui/              (shadcn — see Section 1)
visual-novel/    VisualNovelScene.tsx
```
**Summary:** Story engine is the deepest area: 17 scene-type components including all 10 spec scene types (dialogue, investigation via hotspots, decision, knowledge check, evidence board, TLATM meter, transitions, visualizations). Two visual novel engine versions (v1 + v2) coexist — needs decision. Tools area already has 6 of the ~10-12 interactive features the spec calls for. Community components exist but are Stage 2.

### `src/lib/`
```
audio/ambient-audio.ts
cat-session.ts, cissp-question-rules.ts, constants.ts
ghost-pov-content.ts, irt-calibration.ts, irt-defaults.ts, irt-engine.ts
qa-validation.ts, question-generator.ts
replicate/client.ts
story-characters.ts, story-constants.ts, story-content.ts,
story-types.ts, story-types-v2.ts
stripe/config.ts
supabase/{client.ts, middleware.ts, server.ts}
types.ts, utils.ts, xp.ts
```
**Summary:** CAT/IRT engine is built. Story content is hardcoded in TS files (should migrate to DB per spec). Supabase middleware helper exists and is wired. Two story-types versions coexist. Stripe is scaffolded only (Stage 2 — remove or shelve).

### `src/stores/`
```
useQuizStore.ts  useStoryModeStore.ts  useStoryStore.ts  useUserStore.ts
```
**Summary:** Four Zustand stores. Two story stores (useStoryStore + useStoryModeStore) — needs consolidation.

---

## Section 4: Story/Library content inventory

### library_topics (37 rows)
Sample rows (ordered by domain_id, topic_number):
```
CIA Triad                       | domain 1 | "The three pillars of information security: Confidentiality, Integrity, and Availability."
Security Awareness and Training | domain 1 | "Security awareness turns every employee into a human firewall through ongoing education, phishing simulations, and role-based training."
Risk Management Frameworks      | domain 1 | "Structured approaches to identifying, assessing, and mitigating organizational risk."
```
**Narrative read:** These are pure CISSP fundamentals. No "Meridian / Sentinel Dynamics / Tanaka" narrative is baked into Library content — Library is neutral reference prose, which matches spec intent (Library is the textbook, story is the theater). The narrative lives in `scene_definitions`.

**Schema divergence from spec (already flagged):** current uses `one_liner`, `content_markdown`, `think_like_manager`, `memory_anchor`, `key_formulas`, `comparison_table`; spec 4.5 uses `slug`, `short_description`, `content_md`, `memory_hack`, `exam_traps`, `visualization_component`, `related_scenes`, `difficulty`.

### scene_definitions (71 rows)
Sample rows:
```
d1a1s1  | domain 1 act 1 scene 1 | "The Shadow Protocol" | narrative
d1a1s2  | domain 1 act 1 scene 2 | "Three Vault Locks"   | teaching
d1a1s3  | domain 1 act 1 scene 3 | "CIA's Evil Twin"     | teaching
```
**Narrative read:** Titles match the "Operation Shadow Protocol" narrative style from the spec. Scene IDs use a text composite key (`d{domain}a{act}s{scene}`) not UUID — spec uses UUID + act_id FK. 71 scenes across 8 domains suggests ~9 scenes per domain on average — far below the 12-20 per Act spec envisions for full builds but substantial content already exists.

### scene_unlocks (26 rows)
Tracks per-user scene completion. Columns: `id, user_id, scene_id, domain_number, act_number, unlocked_at, replay_count, last_replayed_at`.
Sample rows show real play data from user `e1df2c53...` on 2026-03-09 across `d1a1-s4-*` scenes. This means the app has been played end-to-end at least through Act 1 Scene 4.

### cat_questions (1,340 rows) and questions (240 rows)
Sample question row:
```
id:              00264a1e-651e-46ab-a08f-f4a0aa27f919
domain_id:       5
difficulty:      hard
question_text:   "OAuth 2.0 and OpenID Connect (OIDC) are often confused. What is
                  the MOST accurate distinction between them?"
options:         ["OAuth 2.0 handles authentication; OIDC handles authorization",
                  "OAuth 2.0 is an authorization framework; OIDC adds an
                   authentication layer on top of OAuth 2.0",
                  "OAuth 2.0 is for web applications; OIDC is for mobile apps",
                  "OAuth 2.0 uses tokens; OIDC uses certificates"]
correct_index:   1
explanation:     "OAuth 2.0 is an AUTHORIZATION framework. OIDC adds an
                  AUTHENTICATION layer on top of OAuth 2.0..."
bloom_level:     analyze
mnemonic_hint:   "OAuth 2.0 = AUTHORIZATION (\"what can you do?\"). OIDC =
                  AUTHENTICATION + authorization. \"OIDC = OAuth + ID.\""
library_topic_id: 00562b3d-b393-4408-9685-61e73b35188f  (UUID, not slug)
is_active:       true
times_shown:     0
times_correct:   0
```
**Quality read:** Content quality is strong. Mnemonic embedded, explanation teaches, Bloom level tagged, library FK populated. This is not placeholder content.

---

## Section 5: What's actually missing (assessment)

### Genuinely missing (must build)
1. **`player_profile` table + create-character wizard wire-up** — middleware gate cannot function without it. The `create-character` route exists but has no DB to write to. **Effort: 1 session** (table + RLS + update the page to insert + middleware check).
2. **Story content table migration** — decide schema reconciliation between `scene_definitions` (71 rows, keeper) and spec's `story_acts`/`story_scenes`/`story_decisions`. Write migration. **Effort: 1-2 sessions** depending on whether we preserve data.
3. **ALTER `questions`** to add `trap_type`, `technique`, `cross_domain`, `library_topic_slug` (or keep slug vs id decision). Then backfill tags on the 240 rows. **Effort: 0.5 session** for schema, ongoing for content tagging.
4. **`player_progress`, `player_act_progress`, `failed_concepts`/`weak_topics`, `player_achievements`, `toolkit_saved_states`, `scene_images`** — new tables per spec 4.x. Migration is mechanical. **Effort: 1 session** for all.
5. **shadcn add: radio-group, checkbox, accordion, alert, sidebar, table, form, avatar** — 8 primitives. Needed before character creator wizard + library sidebar + comparison tables can be built cleanly. **Effort: 30 minutes** via `npx shadcn add`.
6. **Consolidate duplicates**: `(auth)/` vs `/auth/` route groups; `VisualNovelEngine` vs `V2`; `useStoryStore` vs `useStoryModeStore`; `story-types` vs `story-types-v2`; `user_question_history` vs `user_answers`. **Effort: 1 session** to audit + collapse.
7. **Library schema divergence** — decide to keep current columns or migrate to spec columns. Real content (37 rows) makes keep-and-adapt-spec the likely winner. **Effort: 0.5 session** decision + 0.5 session ALTER (add slug if missing).
8. **Stage 2 table cleanup** — drop `story_progress`, `story_progress_v2`, `weak_topics`, `exam_countdown`, `user_answers`, legacy `users` (after migration). **Effort: 0.5 session**.
9. **Remove Stripe scaffolding** per spec ("Out for Stage 1"). Keep files in a `stage-2/` parking lot branch or delete. **Effort: 0.25 session**.

### Already built (not rebuild)
- Entire story engine component suite (17 components covering all 10 scene types).
- CAT/IRT engine, question bank (1,580 total questions), calibration data.
- 6 of the interactive tools (Risk Calculator, Access Control Lab, Crypto Workbench, Evidence Constellation, IR Commander, Network Topology Tracer).
- Dashboard scaffolding, medal system, audio system, character avatar renderer.
- Supabase auth + middleware helper.
- shadcn foundation (18 of 27 spec primitives).

### Total missing effort estimate
**~5-6 focused sessions** to close the gap, not the "weeks of greenfield rebuild" the handoff docs implied.

---

## Section 6: Recommended next 3 steps (by leverage)

### 1. Create `player_profile` + wire create-character wizard end-to-end
Highest leverage: unblocks the middleware gate, unblocks Act 1 gating, unblocks pronoun/name templating across every story scene. Every downstream feature depends on having a real player identity row. One session.

### 2. Write the consolidation migration (schema reconciliation)
The spec was written before I understood the real DB state. Now that we know `scene_definitions` (71 rows), `library_topics` (37 rows), `scene_unlocks` (26 rows), `questions` (240 rows), and `cat_questions` (1,340 rows) are all keepers, write ONE migration that:
- Adds the genuinely-missing tables (`player_profile`, `story_acts`, `player_progress`, `player_act_progress`, `scene_images`, `toolkit_saved_states`, `failed_concepts`).
- ALTERs `questions` with the four tag columns.
- Renames `user_question_history` → `player_question_history`, `achievements` → `player_achievements`.
- Drops the confirmed-empty legacy tables.
- Leaves `scene_definitions` and `library_topics` alone (spec adapts to them, not vice versa).
This is a single cohesive migration file, applied via Supabase MCP. One session.

### 3. shadcn add the 8 missing primitives + move `MasteryRing.tsx` out of `ui/`
Pure hygiene but removes friction for every UI task that follows. Character creator wizard needs `form`, `radio-group`; Library needs `sidebar`, `accordion`, `table`; dashboards need `avatar`, `alert`, `checkbox`. 30 minutes.

**After these three:** the codebase matches the spec's structural assumptions. All remaining work is content (more scenes, more Library topics, more questions) plus the Stage 1 feature polish the spec already has exhaustively detailed.
