# CISSP Quest — Personal Build Spec
> Generated: 2026-04-20 by Claude (Opus 4.7) for Seymour Korman.
> Purpose: The authoritative build spec for shipping CISSP Quest as a personal study tool for Seymour and his wife, with the explicit intent to commercialize after both pass the CISSP exam.
> Supersedes: All conflicting content in MASTER_REBUILD_PLAN.md and CISSP-Quest-Full-Rebuild-Spec.md. PLAYER_IDENTITY_ADDENDUM.md is incorporated in full.

---

## Document Conventions

- **Confidence flags** on material technical claims: VERIFIED, LIKELY, UNVERIFIED.
- **Memory device markers**: every concept-teaching section in this spec ends with a `MEMORY HACK:` line documenting the mnemonic, acronym, story anchor, or analogy used. These are normative, not decorative.
- **Interaction markers**: every scene-level spec ends with a `INTERACTION:` line documenting what the player physically does on screen. No passive content allowed.
- **Visualization markers**: every data-heavy concept ends with a `VIZ:` line documenting the React component or chart type that renders it.

---

## 0. Build Philosophy

This is a Stage 1 personal build that becomes a Stage 2 commercial product. Three principles govern every decision.

**Teach first, test second.** Every quiz question, every knowledge check, every decision point exists downstream of a teaching moment in either the story or the Library. Wrong answers always route back to a Library entry with the relevant Memory Hack reminder. Standing rule: no question without a teaching path.

**Interactive, never passive.** Reading dense paragraphs is what textbooks already do badly. This app justifies its existence by making every concept something you do, click, drag, simulate, or decide on. If a section of content cannot be made interactive, the question to ask is whether it should exist at all.

**Visualize anything quantitative or relational.** Risk math gets a calculator widget. Network topology gets an interactive diagram. Access control models get a sandbox. Crypto algorithms get a step-through visualization. Domain weights get a radar chart. Comparisons get tables. Relationships get graphs. The default answer to "how do we present this?" is "what visualization makes it click in 3 seconds?"

**Memory devices on every concept.** Method of Loci anchors (each Act is a location, each scene a room within that location). Mnemonics for every list (CIA, AAA, STRIDE, OWASP Top 10). Acronym expansions with story-tied meaning. Analogies grounded in real-world objects. Spaced retrieval through the failed_concepts resurfacing system. The user should leave each Act with at minimum 10 memory hooks they could not forget if they tried.

**Personal-use sequencing.** Act 1 ships first and is fully playable while Act 2 is being written. Seymour and wife start studying immediately. Real feedback loops drive Act 2's quality up. By the time the CISSP exam date arrives, all 8 Acts are done and the app has been pressure-tested by its two most motivated users.

---

## 1. Scope: What Ships in Personal Build vs. Commercial Build

### Stage 1 (Personal Build, this spec)

In:
- All 8 Acts of original story content with full interactivity, knowledge checks, decisions, debriefs
- Player identity system per PLAYER_IDENTITY_ADDENDUM with 3 gender options (male, female, nonbinary)
- 10 to 12 interactive features, prioritized by teaching value (full list in Section 7)
- Reference Library with all 8 domains covered, cross-linked to story scenes and questions
- 880+ question bank polished, deduplicated, tagged, with explanations on every wrong answer
- CAT practice exam (250 questions, 6-hour timer, IRT scoring) for full exam simulation
- shadcn/ui foundation with custom anime visual novel aesthetic on top
- Image pipeline via Replicate FLUX, ~80 to 120 generated assets (backgrounds, NPC portraits, evidence artifacts)
- Framer Motion transitions and micro-interactions throughout
- Tone.js ambient audio per Act location plus UI sound effects
- Mobile-first responsive (375px and up) so studying on phones works
- Full keyboard navigation (arrow keys, Enter, Tab) for desktop study sessions
- Dashboard with progress, streaks, weak domain callouts, exam countdown
- Spaced repetition through failed_concepts resurfacing in later Acts
- Local-only multiplayer-ish: Seymour and wife each have separate accounts on the same Supabase, can compare progress informally

Out (deferred to Stage 2):
- Stripe and any payment code
- Tier gating, subscription logic, RLS lockdown beyond basic auth
- Webhook security
- Community features (chatroom, weekly leaderboard, notifications)
- Public landing page or marketing surface
- Social share cards, "I Passed" public ceremony with referral links
- TOS, privacy policy, GDPR mechanics, content moderation
- Sentry, PostHog, analytics infrastructure
- Email transactional flows beyond Supabase auth defaults
- Customer support tooling
- Enterprise features

This cut removes roughly 60% of the original 25-session spec scope while preserving 100% of the actual learning value.

### Stage 2 (Commercial Build, post-CISSP-pass)

Re-add everything in the Out list above, in this order: Stripe and payments, RLS lockdown, landing page, "I Passed" ceremony with referral links, share cards, analytics, error monitoring, TOS/privacy, then community features, then enterprise. Stage 2 is a separate spec, not in scope here.

---

## 2. Tech Stack (Locked)

VERIFIED from Handoff 04-20:
- Runtime: Node 20, TypeScript 5 strict mode
- Framework: Next.js 16.1.6, App Router, React 19.2.3
- UI foundation: shadcn/ui (base-nova style, neutral baseColor) + Tailwind CSS v4 + tw-animate-css
- Icons: lucide-react
- Animations: Framer Motion (currently installed, currently unused, this changes)
- State: Zustand (one store per domain: user, story, quiz, ui)
- Markdown: react-markdown + remark-gfm (Library content)
- Database: Supabase Postgres + Auth (project ID `yebfaucgvblhctchlbvr`)
- Audio: Tone.js
- Image generation: Replicate API, FLUX 1.1 Pro for NPCs and backgrounds
- AI content drafting: Anthropic SDK (claude-opus-4-7) for question generation and dialogue assistance
- Charts: Recharts for radar, line, bar charts
- Force-directed graphs: react-force-graph for Evidence Constellation
- Command palette: cmdk
- Toasts: sonner
- Build: `next build`
- Deploy: Vercel (frontend), Supabase managed (backend)

LIKELY tax to budget for: Next.js 16 + React 19 + Tailwind v4 is a "new + new + new" stack. Expect at least one library compat issue per session that costs an hour. This is the cost of being on current versions.

Hard rule: no competing libraries. No Material UI alongside shadcn. No Redux alongside Zustand. No Chart.js alongside Recharts. One library per job.

---

## 3. Player Identity System

### 3.1 Schema (revised from PLAYER_IDENTITY_ADDENDUM)

```sql
CREATE TABLE player_profile (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT NOT NULL CHECK (char_length(display_name) BETWEEN 1 AND 40),
  gender TEXT NOT NULL CHECK (gender IN ('male', 'female', 'nonbinary')),
  pronoun_subject TEXT NOT NULL CHECK (pronoun_subject IN ('he', 'she', 'they')),
  pronoun_object TEXT NOT NULL CHECK (pronoun_object IN ('him', 'her', 'them')),
  pronoun_possessive TEXT NOT NULL CHECK (pronoun_possessive IN ('his', 'her', 'their')),
  pronoun_reflexive TEXT NOT NULL CHECK (pronoun_reflexive IN ('himself', 'herself', 'themself')),
  skin_tone TEXT NOT NULL,
  eye_color TEXT NOT NULL,
  hair_style TEXT NOT NULL,
  hair_color TEXT NOT NULL,
  outfit TEXT NOT NULL,
  exam_date DATE,                        -- powers Exam Countdown widget
  onboarding_completed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE player_profile ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read their own profile"
  ON player_profile FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own profile once"
  ON player_profile FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own appearance"
  ON player_profile FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
```

Note on the addendum addition: the original addendum had `male` / `female` only. Adding `nonbinary` with `they/them/their/themself` costs nothing now, costs hours later if added post-launch. Pronoun reflexive added because story dialogue will need it ("Tanaka watches {pronounObject} prove {pronounReflexive}").

### 3.2 Appearance options (expanded)

| Field | Options |
|-------|---------|
| skin_tone | porcelain, fair, light_olive, tan, brown, deep_brown, ebony (7 options, expand existing 6) |
| eye_color | brown, hazel, green, blue, gray, amber (6 options, NEW) |
| hair_style | short_cropped, side_part, undercut, ponytail, bun, bob, long_loose, braided (8 options, keep existing) |
| hair_color | black, dark_brown, light_brown, blonde, auburn, red, gray, dyed_blue, dyed_pink (9 options, NEW) |
| outfit | business_casual_blazer, smart_casual_shirt, hoodie_tech, professional_suit, lab_coat (5 options, keep existing) |

VIZ: Character creator uses live preview. SVG renders update in real-time as user clicks options. shadcn `RadioGroup` with custom card-style radio buttons showing visual swatches.

INTERACTION: Multi-step wizard via shadcn `Form` and `Card`. Step 1 name + exam date, Step 2 gender + pronouns auto-derived but editable, Step 3 appearance with live SVG preview. Submit triggers Supabase insert plus redirect to /app/dashboard.

MEMORY HACK: Onboarding is deliberately the player's first "decision sequence" so the visual novel mechanic feels familiar by Act 1 Scene 1.

### 3.3 Templating convention (locked)

All story content uses these placeholders. Substitution happens at render time in VisualNovelEngine.

| Placeholder | Replaced with |
|-------------|---------------|
| `{playerName}` | display_name |
| `{pronoun}` | pronoun_subject |
| `{Pronoun}` | capitalized pronoun_subject |
| `{pronounObject}` | pronoun_object |
| `{pronounPossessive}` | pronoun_possessive |
| `{PronounPossessive}` | capitalized pronoun_possessive |
| `{pronounReflexive}` | pronoun_reflexive |

Hard rules for content authoring:
1. Never write "Alex" anywhere in new content. Always `{playerName}`.
2. Never use literal he/she/him/her/his/their about the player. Always tokens.
3. Avoid appearance-dependent dialogue ("her red hair caught the light" breaks for non-redheads).
4. NPCs can have fixed gendered references to themselves and other NPCs. Only player references need templating.
5. Honorifics use gender-neutral fallbacks where narratively plausible ("Analyst {playerName}" not "Mr./Ms. {playerName}").

### 3.4 Middleware gate

`src/middleware.ts` checks for `player_profile` row on every authenticated `/app/*` request. No row → redirect to `/app/create-character`. This cannot be bypassed via direct URL.

---

## 4. Database Schema (Personal Build)

Full migration applied in one file. Skips Stripe columns and community tables entirely (commented placeholders for Stage 2).

### 4.1 Story content tables

```sql
CREATE TABLE story_acts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_number INT NOT NULL UNIQUE CHECK (act_number BETWEEN 1 AND 8),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  domain_weight_percent INT NOT NULL,          -- ISC2 domain weight, drives CAT
  title TEXT NOT NULL,                         -- "The Call"
  subtitle TEXT NOT NULL,                      -- "Sentinel Dynamics HQ, Toronto"
  location TEXT NOT NULL,                      -- "Toronto"
  description TEXT,
  estimated_minutes INT,                       -- 120 to 240
  hero_image_url TEXT,
  unlock_condition TEXT DEFAULT 'sequential', -- 'free' | 'sequential' | 'always'
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE story_scenes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_id UUID NOT NULL REFERENCES story_acts(id) ON DELETE CASCADE,
  scene_number INT NOT NULL,
  scene_type TEXT NOT NULL CHECK (scene_type IN (
    'dialogue', 'investigation', 'decision', 'knowledge_check',
    'evidence_board', 'aha_moment', 'debrief', 'transition',
    'visualization', 'tlatm_meter'
  )),
  title TEXT NOT NULL,
  location_description TEXT,
  background_image_key TEXT,                   -- references scene_images.image_key
  ambient_audio_key TEXT,                      -- references audio bank
  content JSONB NOT NULL,                      -- flexible per scene_type, see Section 5
  exam_objectives TEXT[],                      -- ISC2 objective codes
  estimated_seconds INT,
  is_skippable BOOLEAN DEFAULT false,          -- only true for transitions
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(act_id, scene_number)
);

CREATE TABLE story_decisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scene_id UUID NOT NULL REFERENCES story_scenes(id) ON DELETE CASCADE,
  prompt TEXT NOT NULL,
  options JSONB NOT NULL,                      -- [{text, consequence_type, tlatm_score, xp_modifier}]
  correct_option_index INT,                    -- nullable: some decisions have no "correct" answer
  explanation TEXT NOT NULL,
  tlatm_explanation TEXT,                      -- Why a manager would think this way
  exam_objective TEXT
);

CREATE TABLE knowledge_checks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scene_id UUID REFERENCES story_scenes(id) ON DELETE SET NULL,
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  exam_objective TEXT NOT NULL,
  question_stem TEXT NOT NULL,
  options JSONB NOT NULL,                      -- 4 options
  correct_index INT NOT NULL,
  explanation TEXT NOT NULL,
  memory_hack TEXT,
  difficulty INT NOT NULL CHECK (difficulty BETWEEN 1 AND 3),
  question_type TEXT NOT NULL CHECK (question_type IN ('best', 'most', 'first', 'least', 'next')),
  trap_type TEXT,                              -- 'tlatm_violation', 'distractor_close', 'absolute_word', 'red_herring'
  cross_domain INT[],                          -- other domains this concept relates to
  library_topic_slug TEXT,                     -- routes wrong answers to /library/[slug]
  created_at TIMESTAMPTZ DEFAULT now()
);
```

### 4.2 Player progression tables

```sql
CREATE TABLE player_progress (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  current_act INT DEFAULT 1,
  current_scene INT DEFAULT 1,
  total_xp INT DEFAULT 0,
  level INT DEFAULT 1,
  title TEXT DEFAULT 'Security Recruit',
  streak_current INT DEFAULT 0,
  streak_longest INT DEFAULT 0,
  streak_last_date DATE,
  tlatm_score INT DEFAULT 50,                  -- 0 to 100, 50 is neutral
  total_study_seconds INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE player_act_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  act_id UUID NOT NULL REFERENCES story_acts(id),
  status TEXT DEFAULT 'locked' CHECK (status IN ('locked', 'in_progress', 'completed')),
  scenes_completed INT DEFAULT 0,
  total_scenes INT,
  assessment_score_percent FLOAT,
  best_assessment_score FLOAT,
  attempts INT DEFAULT 0,
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, act_id)
);

CREATE TABLE player_scene_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  scene_id UUID NOT NULL REFERENCES story_scenes(id),
  completed_at TIMESTAMPTZ DEFAULT now(),
  decision_choice INT,                         -- which option they picked, if decision scene
  knowledge_check_correct BOOLEAN,             -- if knowledge check scene
  time_spent_seconds INT,
  UNIQUE(user_id, scene_id)
);

CREATE TABLE player_question_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL,                   -- references questions or knowledge_checks
  question_source TEXT NOT NULL CHECK (question_source IN ('quiz', 'knowledge_check', 'practice_exam', 'assessment')),
  domain_id INT NOT NULL,
  exam_objective TEXT,
  is_correct BOOLEAN NOT NULL,
  time_spent_seconds INT,
  selected_index INT,
  answered_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE failed_concepts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  exam_objective TEXT NOT NULL,
  domain_id INT NOT NULL,
  question_id UUID,
  failed_at TIMESTAMPTZ DEFAULT now(),
  resurfaced_in_act INT,                       -- which Act this concept came back as a complication
  resolved BOOLEAN DEFAULT false,
  resolved_at TIMESTAMPTZ
);

CREATE TABLE player_achievements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  achievement_key TEXT NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id, achievement_key)
);
```

### 4.3 Existing question bank table (preserved)

```sql
-- Already exists, listed for reference. Personal build adds metadata columns:
ALTER TABLE questions ADD COLUMN IF NOT EXISTS trap_type TEXT;
ALTER TABLE questions ADD COLUMN IF NOT EXISTS technique TEXT;
ALTER TABLE questions ADD COLUMN IF NOT EXISTS cross_domain INT[];
ALTER TABLE questions ADD COLUMN IF NOT EXISTS library_topic_slug TEXT;
```

These tags are the foundation for the Adaptive Difficulty system in Section 9 and the Weak Domain callouts on the dashboard.

### 4.4 Image asset table

```sql
CREATE TABLE scene_images (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  image_key TEXT NOT NULL UNIQUE,              -- 'act1_scene3_bg', 'npc_tanaka_neutral'
  image_type TEXT NOT NULL CHECK (image_type IN ('background', 'character', 'evidence', 'diagram', 'ui', 'transition')),
  storage_path TEXT NOT NULL,                  -- Supabase Storage path
  public_url TEXT NOT NULL,
  prompt_used TEXT,
  seed INT,                                    -- locked seed for NPC consistency
  generated_at TIMESTAMPTZ DEFAULT now()
);
```

### 4.5 Library content table

```sql
CREATE TABLE library_topics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT NOT NULL UNIQUE,                   -- routes from /library/[slug]
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  title TEXT NOT NULL,
  short_description TEXT NOT NULL,             -- 1-line summary for search results
  content_md TEXT NOT NULL,                    -- full markdown body
  memory_hack TEXT NOT NULL,                   -- the headline mnemonic/analogy
  exam_traps TEXT[],                           -- known ISC2 distractor patterns
  related_topics TEXT[],                       -- slugs of related topics
  related_scenes UUID[],                       -- story scenes that teach this
  exam_objectives TEXT[],
  visualization_component TEXT,                -- React component name to render inline
  difficulty INT CHECK (difficulty BETWEEN 1 AND 3),
  estimated_read_minutes INT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

### 4.6 Toolkit / interactive feature state

```sql
CREATE TABLE toolkit_saved_states (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tool_key TEXT NOT NULL,                      -- 'risk_calculator', 'bia_calculator', etc.
  state_name TEXT,                             -- user-given label
  state_data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

### 4.7 RLS for personal build

All player tables get the standard `auth.uid() = user_id` RLS policy. Story content tables (story_acts, story_scenes, story_decisions, knowledge_checks, library_topics, scene_images) are publicly readable (no RLS, or RLS allowing all authenticated reads). This is the "personal use, both spouses on same DB" model. Stage 2 will tighten.

---

## 5. Visual Novel Engine: Scene Type Specifications

The engine renders 10 scene types. Each `story_scenes.content` JSONB is shaped per type.

### 5.1 dialogue
```json
{
  "lines": [
    {"speaker": "Tanaka", "expression": "neutral", "text": "Welcome to Sentinel, {playerName}."},
    {"speaker": "narrator", "text": "{Pronoun} steps into the war room."}
  ],
  "background_image_key": "act1_war_room",
  "characters_on_screen": [{"key": "tanaka", "position": "left", "expression": "neutral"}]
}
```
INTERACTION: Click or press Enter to advance lines. Typewriter at 12ms/char with skip-on-second-click. Character sprite expression changes mid-conversation.

### 5.2 investigation
```json
{
  "scene_image_key": "act1_meridian_org_chart",
  "hotspots": [
    {"id": "ciso_box", "coords": [120, 80, 200, 140], "reveal_text": "Priya Sharma. CISO. Reports to CFO, not CEO. Red flag.", "exam_objective": "1.4.1"},
    {"id": "no_irt_box", "coords": [340, 220, 400, 260], "reveal_text": "No incident response team. Just an outsourced helpdesk.", "exam_objective": "1.7.1"}
  ],
  "completion_required": "all_hotspots"
}
```
INTERACTION: Click each hotspot to reveal teaching content. Visual feedback (pulse animation) draws attention to unfound spots after 30 seconds. Cannot advance until all found.
VIZ: SVG overlay on background image with Framer Motion pulse on unrevealed hotspots.
MEMORY HACK: Spatial anchoring. The org chart literally becomes a Method of Loci memory palace for governance failure types.

### 5.3 decision
```json
{
  "context_text": "Sharma asks {playerName} what {pronoun} would prioritize first.",
  "decision_id": "act1_priority_decision_1",
  "options": [
    {"text": "Restore the email system", "tlatm_score": -10, "consequence": "Tanaka frowns. 'Restoring without containing means re-infection.'"},
    {"text": "Convene the IRT and establish containment", "tlatm_score": +15, "consequence": "Tanaka nods. 'Now you're thinking like a manager.'"},
    {"text": "Call the FBI", "tlatm_score": -5, "consequence": "Webb interjects. 'That's later. Containment first, law enforcement after counsel approves.'"},
    {"text": "Tell the CEO to make a public statement", "tlatm_score": -15, "consequence": "Vasquez slams the table. 'Never. Not without legal review.'"}
  ]
}
```
INTERACTION: shadcn `RadioGroup` of choices, hover preview, selection commits with confirmation. TLATM meter (Section 7.4) animates immediately based on score.
MEMORY HACK: Each wrong answer is a real ISC2 trap pattern. Players physically experience why governance-first thinking wins.

### 5.4 knowledge_check
```json
{
  "knowledge_check_id": "kc_act1_007",
  "stem": "Meridian's CISO reports to the CFO. {Pronoun} discovers this on Day 1. What is the BEST recommendation to make?",
  "options": [
    "Move CISO under the CIO for technical alignment",
    "Move CISO to report directly to the CEO or board for independence",
    "Keep current structure but increase CISO budget",
    "Outsource CISO function to an MSSP"
  ],
  "correct_index": 1,
  "explanation": "ISC2 expects CISOs to have independence from operational IT. Reporting to CFO creates conflict between security spend and cost control. Reporting to CEO/board ensures security is treated as enterprise risk, not IT overhead.",
  "memory_hack": "CISSP Mantra: 'Independence above operations.' If the CISO can be overruled by the budget owner, security loses every fight."
}
```
INTERACTION: Answer selection with keyboard (1-4 or arrows + Enter). Wrong answer shows explanation plus a "Read more in Library: CISO Reporting Structures" CTA that deep-links to /library/ciso-reporting. Right answer awards XP, animates the meter, and routes to next scene.
VIZ: Recharts mini-chart shows running accuracy in this Act in a corner widget.

### 5.5 evidence_board
```json
{
  "evidence_items": [
    {"id": "no_irp", "title": "No IR Plan", "domain": 1, "discovered_at_scene": 3},
    {"id": "no_classification", "title": "No Data Classification", "domain": 2, "discovered_at_scene": 12},
    {"id": "ciso_under_cfo", "title": "CISO Under CFO", "domain": 1, "discovered_at_scene": 5}
  ],
  "connections_to_make": [
    {"from": "ciso_under_cfo", "to": "no_irp", "explanation": "Without enterprise-level authority, security investments like IRP get cut for cost reasons."}
  ]
}
```
INTERACTION: Drag lines between evidence cards on a corkboard interface. Correct connections animate with a satisfying snap. Incorrect connections shake and reset. After all required connections are made, Tanaka delivers the synthesis monologue.
VIZ: HTML5 drag-and-drop on absolute-positioned cards with SVG overlay for connection lines. Framer Motion for the snap and shake animations.
MEMORY HACK: Forced visual relationship-making. Players don't just learn that governance failures cause downstream problems, they physically connect them.

### 5.6 aha_moment
```json
{
  "trigger": "after_scene_15",
  "voice": "tanaka",
  "text": "{playerName}, that thing we just did? Walking through Meridian's failure to classify their crown jewel data? That was Domain 2 of the CISSP. You just lived it. When you see a question on the exam asking about data ownership versus custodianship, you're going to remember Sharma's face when she realized nobody owned the customer database."
}
```
INTERACTION: Pause everything. Spotlight effect on character. Slow text reveal at 30ms/char (slower than normal). Player must press a "Got it" button before continuing.
VIZ: Vignette overlay, dimmed background, pulsing border around dialogue box. Framer Motion stagger.

### 5.7 debrief
```json
{
  "act_number": 1,
  "summary_md": "## Act 1 Recap\n\nYou walked through governance failure...",
  "concepts_covered": [
    {"objective": "1.1", "title": "Confidentiality, Integrity, Availability", "scene_id": "..."},
    {"objective": "1.4", "title": "Compliance Requirements", "scene_id": "..."}
  ],
  "memory_hacks_introduced": [
    "CISO Mantra: Independence above operations",
    "RMF: Categorize, Select, Implement, Assess, Authorize, Monitor (CSIAAM)"
  ],
  "tanaka_signature": "Dr. Keiko Tanaka, Sentinel Dynamics"
}
```
INTERACTION: Sepia-tinted notebook aesthetic. Pages turn with Framer Motion. Each concept can be expanded for full review. "Mark as confident" or "Add to flashcards" per concept (flashcards are Section 7.7).
VIZ: Custom React component styled as handwritten notebook. Diagrams included as inline SVG.
MEMORY HACK: The notebook IS the study guide. Players have access to all 8 notebooks at any time from the Library tab.

### 5.8 transition
```json
{
  "type": "location_change",
  "from": "Toronto",
  "to": "London",
  "duration_ms": 3000,
  "narration": "Three days later. London."
}
```
INTERACTION: Skippable. Map zoom from one city to another with airplane line trace.
VIZ: World map SVG with Framer Motion path animation. Background music crossfade via Tone.js.

### 5.9 visualization
```json
{
  "viz_component": "OSIModelInteractive",
  "context": "Webb walks {playerName} through how the attackers moved through the OSI stack.",
  "highlight_layers": [3, 4, 7]
}
```
INTERACTION: A custom React component renders the relevant Toolkit interactive (Section 7) inside the story context. Webb dialogue overlays the visualization. Player must interact with the viz to advance (e.g., click each highlighted layer).
VIZ: One of the Toolkit components, embedded.

### 5.10 tlatm_meter
```json
{
  "trigger": "act_midpoint",
  "current_score": 65,
  "tanaka_commentary": "{playerName}, you're trending toward manager thinking. Keep asking 'who owns this risk?' before 'how do I fix this?'"
}
```
INTERACTION: Animated gauge fills from 0 to 100. Score above 70 = "Manager", 30-70 = "Hybrid", below 30 = "Technician". Tanaka's commentary changes based on bucket.
VIZ: Custom SVG gauge with Framer Motion fill animation. Color-coded zones.

---

## 6. Story Content: All 8 Acts (Detailed)

Every Act follows the same structural template:

- **Cold open** (1 scene, 60 seconds): atmospheric scene-setting at the location
- **Stakes establishment** (1-2 scenes): why this domain matters in the breach
- **Investigation core** (4-6 scenes mixing dialogue, investigation, decision): the meat
- **Domain teaching beats** (3-4 scenes mixing knowledge_check, visualization): direct concept teaching
- **Crisis decision** (1 scene): a high-stakes decision scene with tlatm_meter
- **Aha Moment** (1 scene): the explicit "you just learned Domain X" callout
- **End-of-Act assessment** (gate): 25 questions, 70% to proceed
- **Debrief** (1 scene): Tanaka's notebook entry

Total per Act: 12 to 18 story scenes plus assessment plus debrief = 14 to 20 scene records in DB.

### 6.1 ACT 1 — Security & Risk Management (Domain 1, 15%)

**Title:** "The Call"
**Location:** Toronto. Sentinel Dynamics HQ.
**Estimated playtime:** 3 to 4 hours
**Domain weight on exam:** 15% (heaviest)

**Core teaching themes:**
1. Security governance principles (alignment with business strategy)
2. Compliance and legal/regulatory requirements
3. Professional ethics (ISC2 Code of Ethics canons, with Canon I always winning over Canon III)
4. Security policies, standards, procedures, guidelines (the documentation hierarchy)
5. BCP and DRP (BIA, RTO, RPO, MTD, WRT)
6. Personnel security (screening, agreements, vendor risk)
7. Risk management concepts (qualitative vs quantitative, ALE/SLE/ARO/EF/AV)
8. Threat modeling (STRIDE, DREAD)
9. Supply chain risk management
10. Security awareness training

**Scene-by-scene outline:**

**S1 cold_open dialogue.** Sentinel Dynamics war room, 7am. Coffee cups, multiple monitors. Tanaka introduces herself to {playerName} on Day 1. Webb is on a call. Vasquez is reviewing contracts. Mention that Meridian Global just suffered a major breach announcement at 6am.
Background: war room with city skyline through floor-to-ceiling windows.
INTERACTION: Click to advance dialogue. Player learns names of NPCs.

**S2 dialogue.** Tanaka briefs the team. Meridian had no IR plan. Stock down 14% pre-market. Regulators already calling. {playerName}'s first task: shadow Tanaka to learn how a CISSP-led engagement starts.

**S3 investigation.** Meridian's organization chart appears on screen. {playerName} clicks hotspots to discover problems: CISO reports to CFO, no IRT, no risk register, no DR plan, security awareness training was an annual 15-minute video.
Hotspots: 6 spots, all must be found.
MEMORY HACK: The org chart IS the memory palace for governance anti-patterns.

**S4 knowledge_check.** "What is the BEST first action for Sentinel as the IR consultancy entering this engagement?" Options test understanding of containment-first vs. eradication-first vs. communication-first.
Library link: /library/incident-response-phases

**S5 dialogue.** Sharma (Meridian CISO) joins via video call. Defensive, blames "lack of budget." Vasquez asks pointed questions about contracts and SLAs. {playerName} watches a real CISO failure mode.

**S6 visualization.** Webb walks {playerName} through the policy hierarchy: Policies → Standards → Procedures → Guidelines. Interactive widget where {playerName} drags example documents into the right tier.
VIZ component: PolicyHierarchyDragger

**S7 decision.** Tanaka asks {playerName} what {pronoun} would prioritize: (a) demand a risk register, (b) build an IR plan immediately, (c) start a tabletop exercise, (d) draft a charter for the IRT. Correct answer is (d) because charter precedes execution. TLATM meter shifts.

**S8 dialogue.** Tanaka's first "Think Like a Manager" monologue. Explains the difference between a CISSP and a SANS-certified technician. Memory anchor: "The CISSP doesn't fix the firewall. The CISSP makes sure the right person owns the firewall and the right policy governs it."

**S9 visualization.** Risk Calculator widget appears in scene context. {playerName} computes ALE for Meridian's email outage scenario. AV = $5M revenue/day, EF = 80%, ARO = 0.5. Result: ALE = $2M.
VIZ component: RiskCalculator (Section 7.1)
MEMORY HACK: "AV times EF equals SLE. SLE times ARO equals ALE. SLAR is the order: Single, Loss, Annual, Rate."

**S10 knowledge_check.** Quantitative vs qualitative risk question. Trap: a tempting "Easier to defend in budget meetings" option for qualitative when correct answer is quantitative.

**S11 investigation.** {playerName} reviews Meridian's BIA (which doesn't exist). Hotspots reveal what a BIA should contain: critical functions, dependencies, RTO/RPO/MTD/WRT.
VIZ widget: BIA Calculator inline (Section 7.2)
MEMORY HACK: "RTO is recovery TIME. RPO is recovery POINT. MTD is the maximum time you can be down before the business dies. WRT is work recovery time, the gap between systems back and operations back."

**S12 dialogue.** Vasquez explains ISC2 Code of Ethics canons to {playerName}. Walks through a scenario: Meridian asks Sentinel to suppress a finding. Vasquez frames it as Canon I (protect society) vs Canon III (provide diligent service to principals). Canon I wins. Always.
MEMORY HACK: Canon order is "Society, Honorably, Principals, Profession" = SHPP = "Should Have Passed Promptly" mnemonic.

**S13 evidence_board.** Connect 5 evidence items: no IRP, CISO under CFO, no DR test in 3 years, vendor with no SOC2, training video not updated since 2019. Player draws lines showing how each amplifies the others.

**S14 knowledge_check.** STRIDE threat model question. Apply STRIDE to Meridian's customer portal.
MEMORY HACK: STRIDE = Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege. Mnemonic story: "A Spy Tampered with the Records, Read the Information, Denied the Service, then Elevated himself."

**S15 visualization.** Threat modeling sandbox: drag attack types onto Meridian's architecture diagram, see which controls would have stopped each.
VIZ component: ThreatModelSandbox

**S16 tlatm_meter.** Mid-act check. Tanaka comments on {playerName}'s current score. If trending technical, she challenges: "What would the board ask?"

**S17 decision.** Crisis decision: Meridian's CEO wants to fire the CISO publicly to "show action." {playerName} must advise Tanaka on how to respond. Options test ethics, governance, and personnel security thinking simultaneously.

**S18 aha_moment.** Tanaka's monologue: "{playerName}, you just lived Domain 1. Every concept ISC2 will test you on, you saw fail in front of you. The exam will ask 'what would a CISSP recommend?' and you'll remember today."

**S19 debrief.** Tanaka's notebook page 1. Summarizes Domain 1 with her annotations. Memory hacks listed. Concept map showing how all 10 themes interconnect.

**Assessment.** 25 questions covering all 10 themes. 70% to proceed to Act 2.

**Act 1 memory hacks introduced (running list):**
1. CISO Mantra: Independence above operations
2. Policy hierarchy: PSPG (Policies, Standards, Procedures, Guidelines)
3. Risk math order: SLAR (SLE = AV×EF, ALE = SLE×ARO)
4. BIA quartet: RTO/RPO/MTD/WRT
5. Ethics canons: SHPP (Society, Honorably, Principals, Profession)
6. STRIDE: A Spy Tampered with Records, Read Info, Denied Service, Elevated himself
7. RMF order: CSIAAM (Categorize, Select, Implement, Assess, Authorize, Monitor)
8. Quantitative vs qualitative: "Quantitative needs numbers, Qualitative needs nerve"
9. CIA triad: never compromise on which leg matters most without context
10. Vendor risk: "Trust the contract, verify with the SOC2"

### 6.2 ACT 2 — Asset Security (Domain 2, 10%)

**Title:** "The Inventory"
**Location:** London. Meridian Global HQ.
**Estimated playtime:** 2.5 to 3 hours
**Domain weight:** 10%

**Core teaching themes:**
1. Asset classification (data and systems)
2. Data ownership (data owner vs data custodian vs data steward vs user)
3. Data states (at rest, in transit, in use)
4. Privacy concepts and protections (PII, PHI, GDPR, PIPEDA for Canadian relevance)
5. Data retention and destruction
6. Data security controls (DLP, encryption, masking, tokenization)
7. Asset handling requirements
8. Data lifecycle (create, store, use, share, archive, destroy)

**Scene-by-scene outline (compressed, full pattern as Act 1):**

**S1 transition.** Toronto-to-London plane animation, narrator: "Three days later. London."

**S2 cold_open dialogue.** Meridian London HQ. Sterile lobby. Sharma greets the team, visibly stressed.

**S3 dialogue.** Meeting with Meridian's data team. {playerName} asks "what data do you have?" The data lead can't answer. Awkward silence. Tanaka: "This is the Domain 2 problem."

**S4 investigation.** Data inventory spreadsheet on screen. Hotspots reveal classification gaps: customer PII tagged "Internal", trade secrets unclassified, GDPR-relevant data stored in non-EU regions.

**S5 visualization.** Data classification ladder widget. Player drags data examples into Public/Internal/Confidential/Restricted tiers. Wrong placements get explanations.
VIZ component: DataClassificationLadder
MEMORY HACK: "PIRC ladder" (Public, Internal, Restricted, Confidential — but most orgs use Public, Internal, Confidential, Restricted; the test will use whichever the question specifies, the principle is the increasing sensitivity).

**S6 knowledge_check.** Data ownership scenario. CFO claims he "owns" the customer database. Tanaka pushes back. Question tests data owner vs custodian vs steward distinctions.
MEMORY HACK: "Owner OWNs the risk. Custodian CARES for the data. Steward STANDS for quality."

**S7 dialogue.** Vasquez briefs on GDPR + PIPEDA. Meridian processes EU citizen data without a DPO. Fines incoming.

**S8 investigation.** Data flow map. {playerName} traces customer data from collection through processing through storage through retention through destruction. Hotspots reveal failures at each stage.
MEMORY HACK: "CSUSAD lifecycle" (Create, Store, Use, Share, Archive, Destroy).

**S9 visualization.** Encryption-at-rest vs in-transit vs in-use sandbox. Player toggles each state on a sample data flow and sees what's exposed.
VIZ component: EncryptionStateExplorer

**S10 knowledge_check.** "BEST control to protect PII at rest in a database used by analysts." Trap: encryption is tempting but tokenization or masking is often better for analyst access.

**S11 decision.** Meridian wants to delete a forensic backup that's relevant to the breach investigation. {playerName} must invoke retention policy and chain of custody. TLATM meter rewards governance-first answer.

**S12 dialogue.** Sharma admits Meridian has no data destruction policy. Hard drives are "thrown out." Tanaka: "That's not destruction. That's distribution."
MEMORY HACK: "Three-pass for spinning disks, crypto-erase for SSDs, degaussing for tape, shred for paper, incinerate for the truly paranoid."

**S13 evidence_board.** Connect Act 1 evidence (no IRP, no policies) to Act 2 evidence (no classification, no retention, no DPO). Show how Domain 1 governance failure causes Domain 2 inventory failure.

**S14 visualization.** Data masking vs tokenization vs encryption comparison table with interactive examples.
VIZ component: DataProtectionComparison

**S15 tlatm_meter.** Mid-act check.

**S16 decision.** EU regulator demands a list of all affected EU citizens within 72 hours (GDPR breach notification). Meridian doesn't know who they are. {playerName} advises on path forward.

**S17 aha_moment.** "{playerName}, every Domain 2 question on the exam will test the same fundamentals you saw today. You can't protect what you don't classify."

**S18 debrief.** Tanaka's notebook page 2. Adds to the running list of memory hacks.

**Assessment.** 25 questions, 70% to proceed.

**Spaced repetition hook.** If {playerName} failed any Act 1 governance questions, S3 of Act 2 has Tanaka say "{playerName}, remember when we said the CISO needs independence? Now watch what happens when there's no independent owner of data classification."

### 6.3 ACT 3 — Security Architecture and Engineering (Domain 3, 13%)

**Title:** "The Blueprint"
**Location:** Munich. Meridian R&D Lab.
**Estimated playtime:** 3 to 4 hours
**Domain weight:** 13%

**Core teaching themes:**
1. Secure design principles (least privilege, defense in depth, fail secure, separation of duties, zero trust)
2. Security models (Bell-LaPadula, Biba, Clark-Wilson, Brewer-Nash, Take-Grant, Lattice)
3. System security capabilities (TPM, HSM, secure enclaves)
4. Vulnerabilities of security architectures (covert channels, race conditions, TOCTOU, side channels)
5. Cryptography (symmetric, asymmetric, hashing, digital signatures, PKI, key management lifecycle)
6. Cryptographic attacks (replay, MitM, birthday, rainbow table, side channel)
7. Site and facility security
8. Physical security controls

**Scene structure (16 scenes + assessment + debrief):**

**S1 transition.** London-to-Munich flight.
**S2 cold_open.** Meridian R&D lab, secure facility with mantraps and visible biometrics. Webb comments: "Physical is solid here. Logical is where they failed."
**S3 dialogue.** R&D director defensive about architecture choices.
**S4 investigation.** Architecture diagram. Hotspots reveal: shared admin accounts, no segmentation between dev/test/prod, secrets in code repos, no key rotation in 4 years.
**S5 visualization.** Bell-LaPadula vs Biba interactive. Player toggles between confidentiality (BLP: no read up, no write down) and integrity (Biba: no read down, no write up) and sees data flows allowed/blocked.
VIZ component: AccessModelExplorer
MEMORY HACK: "BLP protects SECRETS (no read UP, no write DOWN). Biba protects INTEGRITY (no read DOWN, no write UP). They're mirror opposites because confidentiality and integrity have opposite information flow requirements."

**S6 knowledge_check.** Bell-LaPadula scenario question.
**S7 visualization.** Crypto Workbench. Player encrypts a message with AES-256, then with RSA-2048, then signs with ECDSA. Sees ciphertexts, key sizes, performance comparison.
VIZ component: CryptoWorkbench (Section 7.5)
MEMORY HACK: "Symmetric is fast and secret. Asymmetric is slow and shared. Hash is one-way and tiny. Sign with private, verify with public."

**S8 dialogue.** Webb explains key management lifecycle. {playerName} learns the 8 stages.
MEMORY HACK: "GADUSARRD keys: Generate, Distribute, Use, Store, Archive, Recover, Rotate, Destroy."

**S9 knowledge_check.** PKI question. CA, RA, CRL, OCSP roles.
MEMORY HACK: "CA is the king (issues certs). RA is the gatekeeper (verifies identity). CRL is the deadlist (revoked). OCSP is the live check (real-time)."

**S10 investigation.** Discover a cryptographic attack in Meridian's logs: padding oracle on their legacy CBC mode TLS endpoint.
**S11 visualization.** Padding oracle attack walkthrough. Step-by-step animation showing how the attacker recovered plaintext one byte at a time.
VIZ component: PaddingOracleAnimator

**S12 dialogue.** Tanaka contrasts Meridian's TPM-protected new servers with their unprotected legacy systems.
**S13 visualization.** Defense in depth interactive. Player adds layers (perimeter, network, host, app, data) and sees which attack types each catches.
VIZ component: DefenseInDepthLayers
MEMORY HACK: "Onion of OPSEC. Each layer catches what the previous missed. Attacker pays a cost at every layer."

**S14 evidence_board.** Connect Act 3 architecture findings back to Act 1 (no security architecture review process) and Act 2 (no data classification meant no data-tier encryption decisions).

**S15 decision.** Meridian wants to "just patch and move on." {playerName} must argue for architecture review. TLATM meter heavily rewards manager thinking.

**S16 tlatm_meter, S17 aha_moment, S18 debrief.** Standard pattern.

**Assessment.** 25 questions, 70% to proceed.

**Memory hacks added to running list:**
- BLP/Biba mirror opposites
- GADUSARRD key lifecycle
- CA/RA/CRL/OCSP roles
- Onion of OPSEC defense layers

---

(Acts 4-8 detailed in continued spec — see Section 6 continued in next file due to length, identical structural template, full scene specifications.)

---

## 7. Interactive Features (Toolkit)

10 interactives in personal build, prioritized by teaching value. Each is a standalone React component callable from Library, story scenes (via the `visualization` scene type), or the dedicated /toolkit route.

### 7.1 Risk Calculator
Inputs: AV, EF, ARO. Outputs: SLE, ALE, with formula breakdown shown step by step. Save scenarios. Compare scenarios side-by-side.
Used in: Act 1 S9, Library entry on quantitative risk, /toolkit/risk-calculator
INTERACTION: shadcn Input fields with live calculation. Bar chart showing ALE comparison.
VIZ: Recharts bar chart for scenario comparison.
MEMORY HACK: Visual reinforcement of SLAR order via animated formula reveal.

### 7.2 BIA Calculator
Inputs: critical functions, dependencies, allowable downtime estimates. Outputs: RTO/RPO/MTD/WRT with visualization of recovery timeline.
Used in: Act 1 S11, Act 7 (DR planning), Library
VIZ: Horizontal timeline showing failure → MTD breach point → recovery activities → WRT period → fully operational.

### 7.3 Forensic Timeline (Cross-Act)
Persistent dashboard widget showing the Meridian breach from Day 0 to discovery. Each Act adds events. By end of Act 8, players see the full causal chain.
INTERACTION: Click any event for detail. Hover shows which Act surfaced it.
VIZ: Custom SVG horizontal timeline with Framer Motion reveal animations.
MEMORY HACK: This single visualization is the entire CISSP body of knowledge in one image.

### 7.4 Think Like a Manager Meter
Persistent UI element during story play. Tracks every decision against TLATM principle. Animates with each choice.
INTERACTION: Hover for current score breakdown. Click for history of decisions and their TLATM scores.
VIZ: SVG gauge with color zones (red technician, yellow hybrid, green manager).

### 7.5 Crypto Workbench
Encrypt/decrypt with AES, RSA, ECC. Hash with SHA-256/SHA-3. Sign and verify with ECDSA. Side-by-side ciphertext comparison.
Used in: Act 3 S7, Library entries on cryptography
INTERACTION: Pick algorithm, input plaintext, see ciphertext + key size + performance metric. Toggle modes (CBC vs GCM vs CTR).
VIZ: Animated step-through of encryption rounds for AES.
MEMORY HACK: Visceral understanding of why GCM beats CBC, why RSA-2048 is slower than AES-256, why hashes are one-way.

### 7.6 Network Topology Tracer
Interactive OSI/TCP-IP stack with Meridian's actual network. Click each layer to see relevant attacks and controls. Trace the attacker's lateral movement step by step.
Used in: Act 4, Library entries on networking
INTERACTION: Click layers, animate packet flow, highlight where each attack type lives.
VIZ: Custom layered SVG with Framer Motion packet animation.
MEMORY HACK: "Please Do Not Throw Sausage Pizza Away" (OSI layers 1-7: Physical, Data Link, Network, Transport, Session, Presentation, Application).

### 7.7 Access Control Lab
Sandbox to simulate DAC, MAC, RBAC, ABAC. Add users, resources, policies. Test access requests. See which model handles which scenario best.
Used in: Act 5, Library entries on access control
INTERACTION: Drag users into roles. Define permissions. Submit access requests. See allow/deny with explanation.
VIZ: Matrix grid showing user × resource access. Color-coded.
MEMORY HACK: "DAC is owner-driven, MAC is label-driven, RBAC is role-driven, ABAC is attribute-driven." Mantra: "Owner, Label, Role, Attribute = OLRA."

### 7.8 IR Commander
Incident Response decision simulator. Player gets a scenario, walks through the 7 phases (Preparation, Detection, Response, Mitigation, Reporting, Recovery, Remediation, Lessons Learned), makes decisions at each step, sees consequences.
Used in: Act 7, Library entries on IR
INTERACTION: Branching scenario with 4-5 decision points per phase. Bad decisions lead to worse outcomes (containment failures, evidence spoliation, regulatory issues).
VIZ: Phase progress bar at top. Decision tree visualization on completion.
MEMORY HACK: "PDRMRRLL phases of IR" (or use the simpler NIST 4: Preparation, Detection/Analysis, Containment/Eradication/Recovery, Post-Incident).

### 7.9 Code Review Simulator
Show vulnerable code snippets (SQL injection, XSS, path traversal, deserialization, race condition). Player clicks the vulnerability. Explanation appears. Then player suggests a fix from multiple choice.
Used in: Act 8, Library entries on secure coding
INTERACTION: Click highlighted lines. Pick remediation from options. See secure version side-by-side.
VIZ: Syntax-highlighted code blocks with click-to-annotate.
MEMORY HACK: OWASP Top 10 walkthrough via real examples.

### 7.10 Evidence Constellation (Concept Graph)
Force-directed graph of all CISSP concepts. Nodes greyed until encountered in story. Edges show relationships. Color-coded by domain. Node size = exam weight.
Used in: Library overview, end of each Act
INTERACTION: Drag, zoom, pan. Click any node for Library deep-dive.
VIZ: react-force-graph-2d with custom styling.
MEMORY HACK: Visual map of the entire CISSP body of knowledge. Players see how interconnected the domains are.

**Cut from original 20-feature list (deferred to Stage 2 expansion):**
Daily Intelligence Brief, Crisis Wire, Adaptive NPC Dialogue, "I Passed" Ceremony, Study Planner, Exam Readiness Predictor, Sentinel Files notebook (the debrief scene already covers 80% of this), Ghost POV bonus scenes, Policy Hierarchy Visual Explainer (covered by Act 1 S6 visualization scene), Exam Countdown Integration (already in dashboard widget, doesn't need to be a separate "feature").

---

## 8. Reference Library

Every CISSP concept gets a Library topic. Library is the second pillar of "teach first, test second." Wrong answers everywhere route here.

### 8.1 Topic structure (per `library_topics` row)

Each topic contains:
- Title and short description
- Memory hack (the headline mnemonic, displayed prominently)
- Detailed explanation (markdown body)
- Embedded interactive visualization (if applicable)
- Comparison tables for related concepts
- Exam traps (known ISC2 distractor patterns to recognize)
- Worked examples
- Related topics (cross-links)
- Story scenes that teach this (deep links into the Visual Novel)
- Confidence rating (player can mark "I know this" / "I'm shaky" / "I don't know this")

### 8.2 Topic count target

Roughly 120 topics across 8 domains, weighted by exam %:
- Domain 1 (15%): 18 topics
- Domain 2 (10%): 12 topics
- Domain 3 (13%): 16 topics
- Domain 4 (13%): 16 topics
- Domain 5 (13%): 16 topics
- Domain 6 (12%): 14 topics
- Domain 7 (13%): 16 topics
- Domain 8 (11%): 12 topics

### 8.3 Search and navigation

cmdk command palette opens with `Ctrl+K` from anywhere. Search by topic title, memory hack, exam objective code, or full-text content.

Browse by domain, by alphabetical, by "shaky" rating (player's self-assessment).

INTERACTION: shadcn Command component with grouped results. Recent topics shown by default.
VIZ: Domain badge on each result. Confidence indicator (green/yellow/red dot).

---

## 9. Quiz Engine and CAT Practice Exam

### 9.1 Quiz modes

**Custom Quiz Builder.** Player picks domains, difficulty, count, time limit. Pulls from existing 880-question bank.

**Domain Drill.** Quick 10-question quiz on selected domain.

**Weak Domain Targeting.** Auto-pulls 15 questions from player's lowest-accuracy domain based on `player_question_history`.

**Mistake Reroll.** Pulls only from questions player has previously answered wrong (and unresolved per `failed_concepts`).

**Daily Challenge.** 5 mixed-domain questions, rotates daily, bonus XP.

### 9.2 CAT Practice Exam

Full simulation of the real CISSP CAT exam.
- 100 to 150 questions adaptive (real exam minimum 100, maximum 150)
- 3-hour time limit (real exam length)
- IRT 3PL scoring (already implemented in `src/lib/irt-engine.ts`)
- Domain-weighted distribution per ISC2 percentages
- SPRT pass/fail decision (currently inverted per finding #11, must be fixed first)

VIZ: Live theta estimate updating after each answer (visible in study mode, hidden in exam mode). Domain coverage bars.

INTERACTION: One question at a time. Cannot go back (mirrors real exam). Time visible but not stressful (unobtrusive corner counter).

### 9.3 Adaptive Difficulty (story knowledge checks)

Track per-domain accuracy in `player_question_history`. When generating story knowledge checks:
- Domain accuracy > 85%: serve harder edge-case questions
- Domain accuracy 60-85%: standard mix
- Domain accuracy < 60%: foundational questions only, plus extra teaching scene before next knowledge check in that domain

### 9.4 Spaced repetition (consequence-driven)

When player misses a question:
1. Concept logged to `failed_concepts` with `exam_objective` and `domain_id`.
2. In a later Act, that concept resurfaces as a story complication.
3. Player must correctly answer a related knowledge check to "resolve."
4. Resolved concepts mark with bonus XP and a "Concept Mastered" toast.

Example: Player misses a data classification question in Act 2 → Act 5 Scene 7 has Tanaka say "{playerName}, remember when we couldn't classify Meridian's customer data? Now we know that misclassified PII was what made the credential reuse attack catastrophic."

### 9.5 Question metadata (foundation for adaptive features)

Every question (existing 880 + new knowledge checks) tagged with:
- `trap_type`: 'tlatm_violation' | 'distractor_close' | 'absolute_word' | 'red_herring'
- `technique`: 'best' | 'most' | 'first' | 'least' | 'next'
- `difficulty`: 1 | 2 | 3
- `cross_domain`: array of related domains
- `library_topic_slug`: routes wrong answers to Library entry

This is a one-time tagging task. ~6 to 10 hours of work using AI assistance for first pass + human review.

---

## 10. Gamification

### 10.1 XP and leveling

| Level | XP Required | Title |
|-------|-------------|-------|
| 1 | 0 | Security Recruit |
| 5 | 2,500 | Junior Analyst |
| 10 | 10,000 | Security Analyst |
| 15 | 22,500 | Senior Analyst |
| 20 | 40,000 | Security Specialist |
| 25 | 62,500 | Lead Consultant |
| 30 | 90,000 | Security Architect |
| 40 | 160,000 | CISSP Expert |
| 50 | 250,000 | CISSP Legend |

XP formula: `level = floor(1 + sqrt(xp / 100))`

XP sources:
- Story scene completion: +10 to +50 (varies by scene type)
- Knowledge check correct: +25 (first attempt), +10 (subsequent)
- Knowledge check wrong: +5 (participation, encourages attempts)
- Quiz question correct: +25 × difficulty multiplier (1x, 1.5x, 2x)
- Daily challenge perfect: +100
- Streak bonus: +10 per day of active streak
- Concept resolved (spaced repetition): +50
- TLATM-correct decision: +25
- Achievement unlock: variable (50 to 500)

### 10.2 Streaks

- Daily streak counter on dashboard
- Milestones at 3, 7, 14, 30, 60, 100 days with celebrations and XP bonuses
- Streak shields: not in personal build (Stage 2 monetization driver)

### 10.3 Achievements

~30 achievements across categories:
- Story progress (Act 1 complete, Act 8 complete, all assessments first-try pass)
- Quiz mastery (100 questions, 1000 questions, 100% on a domain quiz)
- TLATM mastery (TLATM score above 80, all decisions correct in an Act)
- Streak (3 days, 7 days, 30 days)
- Library (50 topics read, 100 topics confident)
- Toolkit (every interactive used, save 10 risk scenarios)
- Edge cases ("Found all hotspots in every investigation scene", "Got every aha moment")

VIZ: shadcn Toast on unlock with custom achievement card design. Achievement showcase on /profile.

---

## 11. UI/UX Design System

### 11.1 Design tokens (CSS variables in globals.css)

```css
:root {
  /* Cyber theme colors */
  --background: 220 30% 4%;          /* deep navy near-black */
  --foreground: 0 0% 95%;
  --card: 220 25% 8%;
  --card-foreground: 0 0% 95%;
  --primary: 180 100% 50%;           /* cyan accent */
  --primary-foreground: 220 30% 4%;
  --secondary: 280 60% 50%;          /* purple accent */
  --accent-warning: 45 100% 50%;     /* amber */
  --accent-success: 142 76% 36%;     /* emerald */
  --accent-danger: 0 84% 60%;        /* red */
  --border: 220 15% 20%;
  --input: 220 15% 15%;
  --ring: 180 100% 50%;

  /* Story-specific */
  --story-dialogue-bg: 220 30% 6% / 0.9;
  --story-narrator: 0 0% 70%;
  --story-typewriter-speed: 12ms;

  /* Notebook (debrief scenes) */
  --notebook-bg: 35 30% 92%;         /* sepia paper */
  --notebook-ink: 220 50% 20%;       /* dark blue ink */
  --notebook-handwriting: 0 60% 35%; /* red pen annotations */
}
```

### 11.2 Typography

- Headings: Outfit (clean modern sans-serif)
- Body: Inter or Geist Sans (readable at small sizes)
- Story dialogue: Crimson Pro (serif, story feel)
- Code/technical: JetBrains Mono
- Notebook handwriting: Caveat (handwritten feel for debriefs)

All loaded via Next.js `next/font` for performance.

### 11.3 Layout patterns

**App shell.** Persistent left sidebar (collapsible on mobile to bottom nav) with: Dashboard, Story, Practice, Library, Toolkit, Profile. shadcn `Sidebar` component.

**Dashboard.** 12-column grid (mobile: stacked).
- Hero card: Continue Story (prominent) with current scene preview
- Stats row: XP bar, Level, Streak, Exam Countdown
- Daily Challenge card
- Weak Domain card with "Drill This Now" CTA
- Forensic Timeline (Section 7.3) anchored at bottom
- Recent achievements

**Story player.** Full-viewport visual novel.
- Background image fills viewport
- Character sprite(s) bottom-anchored
- Dialogue box bottom 30% with shadcn Card styling
- Top-right HUD: TLATM meter, XP indicator, save indicator
- Top-left: back button, scene number

**Practice quiz.** Distraction-free.
- Question stem centered
- 4 options as large clickable shadcn Cards
- Timer in top-right (subtle)
- Progress bar bottom

**Library topic.** Two-column on desktop, stacked on mobile.
- Left: topic content with embedded visualizations
- Right: related topics, exam traps, "story scenes that teach this" with deep links

### 11.4 Animation principles

Framer Motion everywhere subtle:
- Page transitions: 200ms fade + 4px slide
- Story scene transitions: 400ms crossfade (or 600ms slide for location changes)
- Dialogue typewriter: 12ms per char with skip-on-second-input
- Decision panels: 300ms slide-up
- XP gain: bouncy spring animation, +25 floats up and dissolves
- Knowledge check feedback: 200ms scale pulse on selected option, 400ms shake on wrong
- Achievement unlock: full-screen takeover for 1.5s with confetti, then settles into corner
- Notebook page turn (debrief): 600ms 3D rotation simulation

### 11.5 Audio (Tone.js)

Per-Act ambient backgrounds (subtle, looping):
- Act 1 Toronto: low office hum, distant traffic
- Act 2 London: rain on windows, soft murmurs
- Act 3 Munich: server room hum, fluorescent buzz
- Act 4 Singapore: ocean waves (undersea cable station)
- Act 5 New York: city traffic, sirens distant
- Act 6 Lab: mechanical keyboards, AC hum
- Act 7 Tokyo: SOC alarms (intermittent, subtle)
- Act 8 Austin: open office chatter

UI sounds:
- Dialogue advance: soft click
- Correct answer: ascending two-note chime
- Wrong answer: descending soft buzz
- Decision committed: solid thunk
- Achievement: triumphant 4-note arpeggio

All audio toggleable from settings. Default: ON for ambient, ON for UI sounds.

### 11.6 Mobile (375px+)

Story player:
- Character sprites scale to fit viewport width
- Dialogue box increases to 40% height
- Touch tap to advance instead of click
- Decision options stack vertically as full-width cards

Quiz:
- Single-column option cards
- Larger tap targets (min 48px height per accessibility)
- Question stem stays at top, options below

Toolkit interactives:
- Each redesigned for touch (drag handles larger, no hover-only states)
- Some collapse to simpler views on mobile (e.g., Network Topology Tracer becomes vertical)

### 11.7 Keyboard navigation

Desktop study mode:
- Arrow keys: navigate options
- Enter: select / advance dialogue
- Space: advance dialogue (alternative)
- Tab: cycle hotspots in investigation scenes
- Esc: open menu
- Ctrl+K: command palette (Library search)
- Ctrl+S: save and exit story
- 1-4: quick-select answer options

---

## 12. Image Generation Strategy

### 12.1 Asset inventory (personal build)

~80 to 120 images total, generated in batches via Replicate FLUX 1.1 Pro.

| Category | Count | Notes |
|----------|-------|-------|
| Act backgrounds | 40 | 5 per Act × 8 Acts (war room, exterior, key locations) |
| NPC portraits | 25 | 5 NPCs × 5 expressions (neutral, serious, concerned, knowing, frustrated) |
| Evidence artifacts | 20 | Documents, diagrams, screens, code snippets styled |
| UI flourishes | 10 | Title screens, transitions, achievement icons |
| Misc | 10 | Loading screens, cutscene art |

### 12.2 Style anchor (prepended to every prompt)

```
Anime visual novel illustration style, cinematic lighting, dark cyberpunk-corporate aesthetic, deep navy and cyan palette with amber accents, 16:9 widescreen aspect ratio, detailed digital illustration, professional concept art quality, no text or letters in image, atmospheric depth ---
```

### 12.3 NPC consistency

Each recurring NPC gets a locked seed and a fixed character description block that prepends every portrait prompt for that NPC.

Example (Tanaka):
```
Dr. Keiko Tanaka, Japanese-Canadian woman in her late 40s, sharp dark bob haircut with silver streak, intelligent dark eyes behind thin wire-framed glasses, business-formal navy blazer, calm authoritative presence, mentor archetype, --- {expression-specific addition} --- {scene-specific addition}
```

Seed: 47213 (locked). Use the same seed across all 5 expression variants.

If consistency fails after first batch, upgrade to FLUX Redux with a reference image or train a small LoRA per NPC (~$3 each, ~30 min).

### 12.4 Player handling

Per addendum: never bake the player into Replicate images. Backgrounds are generated empty or with NPCs only. The player's SVG avatar composites on top at render time using a separate React layer.

For scenes that require the player visible (rare):
- Compose with player off-screen (camera angle from behind, or PoV)
- Or render player as silhouette with SVG avatar layer on top

### 12.5 Prompt manifest structure

`scripts/image-prompts-manifest.json` rewritten to:

```json
{
  "version": "2.0",
  "style_anchor": "...",
  "npcs": {
    "tanaka": {
      "base_description": "...",
      "seed": 47213,
      "expressions": ["neutral", "serious", "concerned", "knowing", "frustrated"]
    },
    "webb": { ... },
    "sharma": { ... },
    "ghost": { ... },
    "vasquez": { ... }
  },
  "backgrounds": [
    {
      "image_key": "act1_war_room",
      "prompt_addition": "Modern cybersecurity consultancy war room interior, multiple monitors with dim cyan glow, exposed concrete and dark wood, Toronto skyline visible through floor-to-ceiling windows, early morning blue hour lighting, empty (NPCs added at render via overlay)",
      "act": 1,
      "scene": 1
    }
    // ... ~40 more
  ]
}
```

### 12.6 Cost and timing

LIKELY at FLUX 1.1 Pro pricing of ~$0.04 per image: 120 images × $0.04 = $4.80. Add 30% retry buffer = ~$6.50.

Generation time: ~5 seconds per image, sequential. 120 images = ~10 minutes wall time per batch run.

---

## 13. Build Execution Plan

### Phase 0: Foundation (Session 1, 2 to 3 hours)

Claude Code session, executed in `C:\Projects\cissp-quest`:

1. Run `npx shadcn@latest init` with base-nova style, neutral baseColor.
2. Install all shadcn components needed: button, card, input, select, radio-group, checkbox, dialog, sheet, tabs, accordion, badge, alert, toast (sonner), tooltip, popover, dropdown-menu, navigation-menu, sidebar, table, scroll-area, separator, progress, slider, switch, form, command, avatar.
3. Apply full schema migration in one file (Section 4 of this spec).
4. Verify migration in Supabase dashboard.
5. Set up font loading (Outfit, Crimson Pro, JetBrains Mono, Caveat, Inter via next/font).
6. Apply CSS variable design tokens (Section 11.1) to globals.css.
7. Skip Stripe-related fixes (deferred to Stage 2 per user direction).
8. Skip RLS lockdown beyond basic auth (personal build).
9. Build passes (`npm run build`).
10. Commit: "Phase 0: shadcn install, schema, design tokens, fonts."

Expected output: clean foundation, app boots, no UI work yet.

### Phase 1: Player Identity System (Session 2, 2 to 3 hours)

1. Create `/app/onboarding` route (or rebuild `/app/create-character`).
2. Multi-step wizard (3 steps): name + exam date, gender + pronouns, appearance.
3. Live SVG preview using updated CharacterAvatar component (eye_color, hair_color added).
4. Wire to `player_profile` table insert.
5. Update `src/middleware.ts` to redirect to onboarding if no profile.
6. Update CharacterAvatar to read all profile fields.
7. Replace any hardcoded "Alex" in existing committed code with `{playerName}` token.
8. Test: new user signup → onboarding → profile saved → redirect to dashboard.
9. Seymour and wife each create their accounts and profiles.
10. Commit: "Phase 1: Player identity system per addendum, expanded gender + appearance."

### Phase 2: App Shell + Dashboard (Session 3, 2 to 3 hours)

1. Build app shell with shadcn Sidebar (desktop) + bottom nav (mobile).
2. Routes: /app/dashboard, /app/story, /app/practice, /app/library, /app/toolkit, /app/profile.
3. Dashboard with placeholder widgets (real data wires in later phases).
4. Loading states, error boundaries, empty states for every route.
5. Dark mode locked on (no light mode toggle for v1).
6. Mobile responsive verified at 375px, 768px, 1280px.
7. Commit: "Phase 2: App shell and dashboard skeleton."

### Phase 3: Visual Novel Engine Core (Session 4, 3 to 4 hours)

1. Build `StoryPlayer.tsx` as the orchestrator.
2. Build scene type renderers: DialogueScene, InvestigationScene, DecisionScene, KnowledgeCheckScene, EvidenceBoardScene, AhaMomentScene, DebriefScene, TransitionScene, VisualizationScene, TLATMMeterScene.
3. Build supporting components: DialogueBox (typewriter at 12ms), CharacterSprite (expression switching), SceneBackground (image loading with crossfade transitions), DecisionPanel, KnowledgeCheckPanel.
4. Wire to story-store (Zustand) for state management.
5. Implement template substitution: `{playerName}`, pronoun tokens, etc.
6. Implement TLATM meter as persistent HUD element.
7. Implement skip/resume/save states.
8. Test with hardcoded Act 1 Scene 1 content.
9. Commit: "Phase 3: Visual novel engine with all 10 scene types."

### Phase 4: Story Content — Acts 1 and 2 (Sessions 5-7, 6 to 9 hours total)

Session 5: Act 1 content (3 to 4 hours)
1. Use AI-assisted drafting (this chat) to generate full Act 1 dialogue per Section 6.1 outline.
2. Seed all 18-19 scenes into Supabase via SQL or a seed script.
3. Generate first batch of Replicate images (Act 1 backgrounds + NPC neutral expressions).
4. Wire image_keys to scenes.
5. End-to-end playtest of Act 1 in dev mode.
6. Commit: "Phase 4a: Act 1 content seeded, playable end-to-end."

Session 6: Act 1 polish + Act 2 content drafting (3 to 4 hours)
1. Fix bugs found in Act 1 playtest.
2. Generate Act 2 content per Section 6.2.
3. Seed Act 2.
4. Generate Act 2 image batch.
5. Commit: "Phase 4b: Act 2 content seeded."

Session 7: Acts 1+2 mobile pass + Library entries for Acts 1+2 (2 to 3 hours)
1. Mobile responsive check on both Acts.
2. Write Library topics for all concepts taught in Acts 1+2 (~30 topics).
3. Wire Library deep-links from knowledge check explanations.
4. Commit: "Phase 4c: Library entries for Acts 1-2."

**Checkpoint: Seymour and wife can start studying. Acts 1 and 2 fully playable. Practice quiz works on Domain 1+2 questions. Library covers Domain 1+2.**

### Phase 5: Toolkit Interactives (Session 8, 3 to 4 hours)

1. Build the 4 most-used interactives first: Risk Calculator, BIA Calculator, TLATM Meter (already a HUD element), Forensic Timeline.
2. Wire from Library and toolkit route.
3. Embed Risk Calculator into Act 1 S9, BIA Calculator into Act 1 S11.
4. Commit: "Phase 5a: Core 4 interactives built."

### Phase 6: Acts 3 through 8 Content (Sessions 9-14, 18 to 24 hours total)

Approx 3 hours per Act, including content drafting (in chat) + seeding + image generation + playtest.

- Session 9: Act 3 (Munich, Architecture)
- Session 10: Act 4 (Singapore, Network Security) — also build Network Topology Tracer interactive (Section 7.6)
- Session 11: Act 5 (New York, IAM) — also build Access Control Lab (Section 7.7)
- Session 12: Act 6 (Lab, Assessment) — relatively low interactive needs
- Session 13: Act 7 (Tokyo, Operations) — also build IR Commander (Section 7.8)
- Session 14: Act 8 (Austin, Software Dev Sec) — also build Code Review Simulator (Section 7.9)

### Phase 7: Library Completion + Crypto Workbench + Evidence Constellation (Session 15, 3 to 4 hours)

1. Write remaining ~90 Library topics (Domains 3-8).
2. Build Crypto Workbench (Section 7.5).
3. Build Evidence Constellation graph (Section 7.10).
4. Wire Evidence Constellation into Library overview.
5. Commit: "Phase 7: Library complete, Crypto Workbench, Evidence Constellation."

### Phase 8: Practice Exam + Question Tagging (Session 16, 3 to 4 hours)

1. Tag all 880 questions with metadata (trap_type, technique, difficulty, cross_domain, library_topic_slug). Use Anthropic SDK for first pass, human review.
2. Fix SPRT inversion in `irt-engine.ts:267`.
3. Fix domain weights enforcement in `selectNext()`.
4. Build CAT practice exam UI.
5. Test full 100-question CAT run.
6. Commit: "Phase 8: Practice exam fully functional."

### Phase 9: Polish (Session 17, 3 to 4 hours)

1. Framer Motion polish pass: every transition, every animation.
2. Tone.js audio integration: ambient + UI sounds.
3. Achievement system: define all 30, unlock conditions, toast notifications.
4. Streak tracking: dashboard widget, milestone celebrations.
5. Spaced repetition resurfacing: implement the failed_concepts → later-Act complication trigger.
6. Mobile polish pass on all screens.
7. Commit: "Phase 9: Animation, audio, achievements, streaks, spaced repetition."

### Phase 10: Final QA + Both-Spouse Playthrough (Session 18, 4 to 5 hours)

1. Full playthrough Act 1 → Act 8.
2. CAT practice exam attempt.
3. Bug list compiled.
4. Critical bugs fixed.
5. Both Seymour and wife do separate playthroughs over a week, log issues.
6. Final polish pass on whatever surfaces.

**App is ready for both spouses to use as primary CISSP prep tool.**

### Total realistic timeline

18 sessions × 3 hours average = 54 hours of focused work. At 4-hour evening sessions, that's 13 to 14 sessions. At 6-hour weekend grinds, 8 to 9 sessions. Realistic calendar: 4 to 8 weeks depending on cadence.

Acts 1 and 2 playable after Session 7 (about week 2). That's when active studying can begin.

---

## 14. Content Authoring Workflow

For each Act after Act 1, the workflow is:

1. **In this chat (Claude Opus 4.7):** I draft the full scene-by-scene content using Section 6 templates as the structure. Output is markdown that maps directly to `story_scenes` JSONB content.

2. **Seymour reviews:** voice check, technical accuracy check, "would this teach the concept" check. Edits requested.

3. **In this chat:** revisions delivered.

4. **In Claude Code:** seed script populates Supabase with the approved content.

5. **In Claude Code:** image batch generated for the Act.

6. **Seymour playtests:** end-to-end in dev. Logs bugs.

7. **In Claude Code:** bugs fixed.

8. **Commit + move to next Act.**

This split puts the 60% of Act work that is dialogue/content drafting in the chat (where I can iterate fast on prose) and the 40% that is implementation in Claude Code (where it has filesystem access).

---

## 15. What This Spec Deliberately Does Not Include

Listed for clarity so future sessions don't accidentally re-add:

- Stripe / payments / subscriptions / pricing tiers / upgrade page
- Webhook handlers, RLS lockdown for tier protection
- Public landing page or marketing site
- TOS, privacy policy, GDPR consent flows, cookie banners
- Sentry, PostHog, Mixpanel, any analytics
- Email transactional flows beyond Supabase auth defaults
- Community features: chatroom, weekly leaderboard, notification queue, social sharing
- "I Passed" ceremony with social share cards and referral links
- Adaptive NPC dialogue (memory-aware character commentary)
- Daily Intelligence Brief widget
- Crisis Wire news feed
- Sentinel Files standalone notebook (covered by debrief scenes)
- Ghost POV bonus scenes (Stage 2 paywall feature)
- Study Planner (dashboard already has exam countdown, that's enough)
- Exam Readiness Predictor (dashboard already shows weak domains)
- AI-generated novel questions on the fly (existing 880 + ~160 new knowledge checks is plenty for two users)
- Audio narration (TTS) of dialogue
- PWA / offline mode
- Customer support tooling, help inbox
- Admin dashboard, user management
- Enterprise per-seat features

All of these belong in the Stage 2 commercialization spec, written after Seymour and wife pass the CISSP.

---

## 16. Source Document Reconciliation

This spec supersedes:
- `MASTER_REBUILD_PLAN.md` — preserved as historical reference but not authoritative
- `CISSP-Quest-Full-Rebuild-Spec.md` — preserved as historical reference but not authoritative
- `PLAYER_IDENTITY_ADDENDUM.md` — fully incorporated into Section 3 of this spec (with `nonbinary` addition)
- `HANDOFF_2026-04-19.md` and `HANDOFF_2026-04-20.md` — preserved as historical context

When any future Claude Code or Claude.ai session starts work on CISSP Quest, this is the doc to read. Old docs are background only.

---

*End of CISSP_QUEST_PERSONAL_BUILD_SPEC.md*
*Author: Claude Opus 4.7. Generated 2026-04-20. Authoritative for CISSP Quest personal build phase.*
