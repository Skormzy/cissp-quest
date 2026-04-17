# CISSP Quest — Full Rebuild Specification

## Document Purpose

This is the master spec for rebuilding CISSP Quest from scratch with a new narrative framework, modernized UI/UX, AI-generated imagery, and world-class engagement systems. It serves as both the architectural reference and the source for Claude Code execution prompts.

**Project:** CISSP Quest  
**Repo:** `C:\Users\Seymour\OneDrive\Desktop\cissp-quest` / `https://github.com/Skormzy/cissp-quest`  
**Supabase:** Project ID `yebfaucgvblhctchlbvr`  
**Stack:** Next.js 14+ App Router, Supabase, Tailwind CSS, Zustand, shadcn/ui, Vercel  
**Image Gen:** Replicate API (FLUX model)

---

## Part 1: The New Narrative Framework

### 1.1 Core Premise

The player is **Alex Mercer**, a newly hired entry-level cybersecurity analyst at **Sentinel Dynamics**, a boutique cybersecurity consultancy. Alex has their CISSP exam scheduled in 90 days and is staring at a stack of textbooks feeling overwhelmed — balancing study with a demanding new job.

On Day 1 at work, Sentinel Dynamics gets an emergency call: a massive, coordinated breach has hit **Meridian Global**, a multinational conglomerate. It's the biggest incident the firm has ever handled. Every analyst is deployed. Alex — despite being the most junior person on the team — gets pulled in because the firm is all-hands.

This breach becomes the backbone of the entire learning journey. As Alex investigates different facets of the breach (governance failures, asset misclassification, architecture flaws, network intrusions, identity compromises, assessment gaps, operations breakdowns, and exploited software vulnerabilities), they organically learn every CISSP domain.

### 1.2 Narrative Arc Structure

The story is structured as **8 Acts**, one per CISSP domain, each representing a phase of the incident response engagement. Within each Act, the player travels to different locations, interviews personnel, analyzes evidence, and makes decisions — all of which teach domain concepts through consequence and discovery.

**Act 1 — Security & Risk Management (15%)**  
*"The Call" — Sentinel Dynamics HQ, Toronto*  
Alex's first week. The Meridian breach lands. The team discovers Meridian had no incident response plan, no risk register, and their security governance was a mess. Alex learns governance, risk frameworks, compliance, ethics, and BCP/DRP through the chaos of an organization that did none of it. The "Think Like a Manager" lens is introduced here — Alex's mentor (senior consultant **Dr. Keiko Tanaka**) teaches them that CISSPs don't just fix problems, they govern solutions.

**Act 2 — Asset Security (10%)**  
*"The Inventory" — Meridian Global HQ, London*  
The team flies to London to assess what was actually compromised. Problem: Meridian can't tell them what data they have, where it lives, or how it's classified. Alex learns data classification, ownership, retention, privacy, and handling through the frustration of trying to scope a breach when nobody tracked their assets.

**Act 3 — Security Architecture & Engineering (13%)**  
*"The Blueprint" — Meridian R&D Lab, Munich*  
Investigation reveals the breach exploited architectural weaknesses in Meridian's R&D environment. Alex learns security models (Bell-LaPadula, Biba, Clark-Wilson), cryptography, secure design principles, and physical security by analyzing how the attackers got in and what should have stopped them.

**Act 4 — Communication & Network Security (13%)**  
*"The Wire" — Undersea Cable Station & Meridian Data Center, Singapore*  
The attackers maintained persistence through network-level backdoors. Alex learns OSI/TCP-IP, network attacks, secure protocols, firewalls, VPNs, and wireless security by tracing the attacker's lateral movement across Meridian's global network.

**Act 5 — Identity & Access Management (13%)**  
*"The Insider" — Meridian Financial Division, New York*  
Evidence points to compromised credentials and possibly an insider threat. Alex learns authentication, authorization, identity federation, access control models, and privilege management by investigating who had access to what and how trust was broken.

**Act 6 — Security Assessment & Testing (12%)**  
*"The Audit" — Meridian Cloud Infrastructure (Remote) & Sentinel Dynamics Lab*  
The team conducts formal security assessments to understand the full blast radius. Alex learns vulnerability assessments, penetration testing, log analysis, SIEM, SOC operations, and audit methodology by running the assessments themselves.

**Act 7 — Security Operations (13%)**  
*"The Response" — Meridian Global SOC, Tokyo*  
Full incident response mode. Alex learns IR procedures, digital forensics, evidence handling, disaster recovery, change management, and physical security operations by leading portions of the response under Dr. Tanaka's supervision.

**Act 8 — Software Development Security (11%)**  
*"The Root Cause" — Meridian Engineering, Austin*  
The root cause is traced to a vulnerability in Meridian's proprietary software. Alex learns SDLC security, secure coding, code review, DevSecOps, and software supply chain security by working with Meridian's dev team to understand and fix the original vulnerability.

**Epilogue — "The Debrief"**  
Alex sits the CISSP exam. The player takes a full practice exam (250 questions, 6 hours, CAT simulation). The narrative wraps with Alex reflecting on how the breach taught them everything the textbooks couldn't.

### 1.3 Key Characters (NPCs)

| Character | Role | Function |
|-----------|------|----------|
| **Alex Mercer** | Player character | Entry-level analyst, CISSP candidate |
| **Dr. Keiko Tanaka** | Sentinel Dynamics — Senior Consultant & Mentor | "Think Like a Manager" guide. Pushes Alex toward governance thinking. Appears in every Act. |
| **Marcus Webb** | Sentinel Dynamics — SOC Lead | Technical expertise. Provides the "hands-on" perspective when Alex needs to understand tools, logs, protocols. |
| **Priya Sharma** | Meridian Global — CISO | Represents executive leadership. Her failures (and growth) throughout the story illustrate governance gaps. |
| **James "Ghost" Holloway** | Former Meridian employee (suspect) | The insider threat angle. Morally ambiguous — was he compromised or complicit? |
| **Elena Vasquez** | Sentinel Dynamics — Legal Counsel | Compliance, regulatory, ethics, evidence handling perspective. |

### 1.4 Narrative-to-Domain Mapping Principles

Every scene in the story must map to one or more ISC² exam objectives. The mapping is explicit in the content database but invisible to the player — they experience a story, not a curriculum outline. However, at key moments, Alex (or Dr. Tanaka) will break the fourth wall lightly: *"You know, everything we just did with Meridian's data classification? That's literally Domain 2 of the CISSP. You just lived it."*

These "Aha Moments" serve as study reinforcement — the player realizes the story IS the exam prep.

### 1.5 Content Depth Per Act

Each Act must be **extensive** — comparable to Destination Certification's full domain coverage. Target: 2-4 hours of content per Act, comprising:

- 8-15 story scenes with dialogue, decisions, and consequences
- 3-5 interactive "Investigation Segments" (hands-on exercises embedded in narrative)
- 15-20 knowledge check questions woven into the story (not separate quizzes)
- 3-5 "Evidence Board" moments (connecting clues across domains)
- 1 end-of-Act assessment (20-30 questions, must pass 70% to proceed)
- 1 "Dr. Tanaka's Debrief" summary connecting everything back to exam objectives

Total across all 8 Acts: 16-32 hours of story content, 120-160 embedded knowledge checks, 160-240 assessment questions, plus the 880+ existing question bank for standalone practice.

---

## Part 2: App Architecture & Rebuild Plan

### 2.1 What Gets Kept vs. Rebuilt

**KEEP (migrate to new architecture):**
- Supabase database infrastructure (project `yebfaucgvblhctchlbvr`)
- Question bank (880+ questions) — these become standalone practice quiz content
- Authentication flow
- Basic Next.js project structure
- Zustand state management pattern

**REBUILD FROM SCRATCH:**
- All story mode content and components (new narrative)
- All UI components (full shadcn/ui audit per global CLAUDE.md)
- Navigation and routing structure
- Quiz engine (integrate narrative-embedded checks + standalone practice)
- Progression and gamification systems
- Image pipeline and visual layer
- Landing page and marketing surfaces

### 2.2 New Route Structure

```
/                          → Landing page (marketing, conversion)
/login                     → Auth
/signup                    → Auth
/dashboard                 → Home hub (progress, daily challenge, continue story)
/story                     → Story mode hub (Act selector, world map)
/story/act/[id]            → Act player (visual novel engine)
/story/act/[id]/scene/[n]  → Individual scene (deep link for resume)
/practice                  → Practice hub
/practice/quiz             → Custom quiz builder
/practice/quiz/[id]        → Active quiz session
/practice/quiz/[id]/results → Quiz results
/practice/domains          → Domain breakdown with per-domain practice
/practice/exam             → Practice exam simulator (CAT-style)
/library                   → Reference library
/library/[topic]           → Individual topic deep-dive
/glossary                  → Searchable glossary with bookmarks
/toolkit                   → Calculators and reference tools
/profile                   → User profile, stats, achievements
/leaderboard               → Global/weekly/friends leaderboards
/settings                  → Preferences, subscription, account
```

### 2.3 Database Schema Changes

New tables needed for the narrative system:

```sql
-- Story content tables
CREATE TABLE story_acts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_number INT NOT NULL UNIQUE,
  domain_id INT NOT NULL,
  title TEXT NOT NULL,
  subtitle TEXT NOT NULL,
  location TEXT NOT NULL,
  description TEXT,
  estimated_minutes INT,
  is_locked BOOLEAN DEFAULT true
);

CREATE TABLE story_scenes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_id UUID REFERENCES story_acts(id),
  scene_number INT NOT NULL,
  scene_type TEXT NOT NULL CHECK (scene_type IN ('dialogue', 'investigation', 'decision', 'knowledge_check', 'evidence_board', 'debrief')),
  title TEXT,
  location_description TEXT,
  background_image_url TEXT,
  content JSONB NOT NULL,  -- flexible schema for different scene types
  exam_objectives TEXT[],  -- ISC² objectives covered
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(act_id, scene_number)
);

CREATE TABLE story_decisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scene_id UUID REFERENCES story_scenes(id),
  decision_text TEXT NOT NULL,
  options JSONB NOT NULL,  -- [{text, consequence_type, next_scene_override, xp_modifier}]
  correct_option_index INT,
  explanation TEXT,
  tlatm_explanation TEXT  -- Think Like a Manager reasoning
);

-- Player progression
CREATE TABLE player_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  current_act INT DEFAULT 1,
  current_scene INT DEFAULT 1,
  total_xp INT DEFAULT 0,
  level INT DEFAULT 1,
  title TEXT DEFAULT 'Security Recruit',
  streak_current INT DEFAULT 0,
  streak_longest INT DEFAULT 0,
  streak_last_date DATE,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id)
);

CREATE TABLE player_act_progress (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  act_id UUID REFERENCES story_acts(id),
  status TEXT DEFAULT 'locked' CHECK (status IN ('locked', 'in_progress', 'completed')),
  score_percent FLOAT,
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, act_id)
);

CREATE TABLE player_achievements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  achievement_key TEXT NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id, achievement_key)
);

-- Spaced repetition (narrative-integrated)
CREATE TABLE failed_concepts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  question_id UUID,
  exam_objective TEXT,
  domain_id INT,
  failed_at TIMESTAMPTZ DEFAULT now(),
  resurfaced_in_act INT,  -- which Act this concept re-appeared as a complication
  resolved BOOLEAN DEFAULT false
);

-- Image assets
CREATE TABLE scene_images (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  image_key TEXT NOT NULL UNIQUE,  -- e.g. 'act1_scene3_bg', 'npc_tanaka_serious'
  image_url TEXT NOT NULL,
  image_type TEXT CHECK (image_type IN ('background', 'character', 'diagram', 'evidence')),
  prompt_used TEXT,
  generated_at TIMESTAMPTZ DEFAULT now()
);
```

### 2.4 Component Architecture

Core component tree (all built on shadcn/ui foundation):

```
src/
├── app/                        # Next.js App Router pages
├── components/
│   ├── ui/                     # shadcn/ui primitives (Button, Card, Dialog, etc.)
│   ├── story/                  # Visual novel engine
│   │   ├── StoryPlayer.tsx     # Main story renderer
│   │   ├── DialogueBox.tsx     # Typewriter text display (12ms/char)
│   │   ├── CharacterSprite.tsx # NPC display with expressions
│   │   ├── SceneBackground.tsx # Background image with transitions
│   │   ├── DecisionPanel.tsx   # Choice selection UI
│   │   ├── InvestigationMode.tsx # Interactive investigation segments
│   │   ├── EvidenceBoard.tsx   # Cross-domain clue connections
│   │   ├── KnowledgeCheck.tsx  # Inline quiz during story
│   │   └── AhaMoment.tsx      # Domain recognition callouts
│   ├── quiz/                   # Quiz engine
│   │   ├── QuizBuilder.tsx
│   │   ├── QuizSession.tsx
│   │   ├── QuizResults.tsx
│   │   └── PracticeExam.tsx    # CAT simulator
│   ├── dashboard/              # Dashboard widgets
│   │   ├── ProgressRing.tsx
│   │   ├── StreakTracker.tsx
│   │   ├── DailyChallenge.tsx
│   │   ├── ContinueStory.tsx
│   │   └── WeakDomains.tsx
│   ├── library/                # Reference content
│   ├── gamification/           # XP, levels, achievements, leaderboard
│   ├── landing/                # Marketing/conversion page
│   └── layout/                 # Nav, sidebar, footer
├── stores/                     # Zustand stores
│   ├── story-store.ts
│   ├── quiz-store.ts
│   ├── progress-store.ts
│   └── ui-store.ts
├── lib/                        # Utilities
│   ├── supabase/
│   ├── replicate/              # Image generation client
│   └── utils.ts
└── types/                      # TypeScript interfaces
```

---

## Part 3: UI/UX Overhaul

### 3.1 Design System

Following the global CLAUDE.md mandates:

- **Foundation:** shadcn/ui for ALL structural components (forms, dialogs, navigation, tables, cards, buttons, tabs, sheets, dropdowns, tooltips, etc.)
- **Visual layer:** Custom cyberpunk/visual novel aesthetic layered ON TOP of shadcn — never replacing it
- **Typography:** Distinctive, intentional font choices. No Inter, no Arial. Candidates: JetBrains Mono for code/terminal elements, a sharp sans-serif for headings (e.g., Outfit, Geist), a readable serif for story dialogue (e.g., Crimson Pro)
- **Color system:** CSS variables through Tailwind. Dark mode default with optional light mode. Cyber-themed palette: deep navy backgrounds, cyan/teal accents, amber for warnings/gold, emerald for success
- **Spacing:** Tailwind's scale (4, 8, 12, 16, 24, 32, 48, 64) — generous whitespace
- **Motion:** Framer Motion for page transitions, story scene transitions, achievement unlocks, and XP animations. 150-300ms for micro-interactions. Typewriter effect at 12ms/char
- **Responsive:** Mobile-first. Story mode must work beautifully on phones (this is where people study on the bus)
- **Accessibility:** Full keyboard navigation (arrow keys for answer selection, Enter to confirm, Tab for hotspots). ARIA labels. Focus indicators.

### 3.2 Key UI Experiences

**Dashboard** — Command center feel. Shows: current story progress (world map thumbnail), streak counter, daily challenge card, weak domain callout, recent activity feed, XP bar with level. No clutter. Every element is actionable.

**Story Mode** — Full visual novel experience. Background image fills the viewport. Character sprites appear with expressions. Dialogue box at bottom with typewriter text. Decision panels slide up when choices appear. Investigation segments use interactive overlays. Smooth transitions between scenes (fade, slide, dissolve).

**Practice Mode** — Clean, focused quiz interface. No distractions. Timer visible but not stressful. Clear answer selection with keyboard shortcuts. Immediate feedback with detailed explanations. "Think Like a Manager" callouts on governance-related questions.

**Library** — Searchable, cross-linked reference content. Each topic has: overview, detailed explanation, comparison tables, worked examples, memory hacks, common exam traps, related topics. React-rendered diagrams (flowcharts, process flows) rather than static images where possible.

**Landing Page** — Conversion-optimized. Hero section with the narrative hook ("Your CISSP exam is in 90 days. You just got assigned to the biggest breach of your career."). Social proof, feature highlights, pricing tiers, CTA to start free.

### 3.3 shadcn/ui Component Audit

Every page must use shadcn components for:

| Element | shadcn Component |
|---------|-----------------|
| Navigation | NavigationMenu, Sidebar |
| Page sections | Card, Separator |
| Forms | Input, Select, Checkbox, RadioGroup, Slider, Switch, Form |
| Feedback | Alert, Toast, Badge, Progress |
| Overlays | Dialog, Sheet, Popover, Tooltip, DropdownMenu |
| Data display | Table, Tabs, Accordion, ScrollArea |
| Actions | Button, Toggle, ToggleGroup |
| Typography | Use shadcn's prose classes + custom font stack |

Custom components (StoryPlayer, EvidenceBoard, etc.) are COMPOSITES built from shadcn primitives, not replacements.

---

## Part 4: Image Generation Pipeline

### 4.1 Approach: Replicate API with FLUX

As previously agreed, automated image generation via Replicate (FLUX model). No manual intervention.

**Setup Requirements:**
1. Replicate account (sign up with GitHub at replicate.com)
2. Add $10-25 in API credits
3. Copy API token → store as `REPLICATE_API_TOKEN` in `.env.local`

### 4.2 Image Asset Library

Total estimated images: ~200-300

| Category | Count | Description |
|----------|-------|-------------|
| Scene backgrounds | ~60 | 8 Acts × ~8 backgrounds each (offices, server rooms, airports, cities, labs) |
| Character portraits | ~30 | 6 NPCs × 5 expressions each (neutral, serious, happy, concerned, angry) |
| Evidence/diagrams | ~40 | Concept visualizations, network diagrams, architecture schematics |
| UI assets | ~20 | World map, act cards, achievement icons, title screens |
| Misc | ~20 | Loading screens, chapter cards, transition art |

### 4.3 Image Generation Script

Create a Node.js script (`scripts/generate-images.ts`) that:

1. Reads a JSON manifest of all required images with prompts
2. Calls Replicate API (FLUX model) for each image
3. Saves outputs to a local `/generated-images` directory
4. Uploads to Supabase Storage bucket `scene-images`
5. Updates the `scene_images` database table with URLs
6. Logs progress and costs

**Style guide prompt prefix** (prepended to all prompts):
> "Anime-style cyberpunk visual novel illustration, high quality, cinematic lighting, widescreen aspect ratio 16:9, digital art, professional illustration quality —"

### 4.4 Alternative / Supplement: Algorithmic Art

For concept diagrams, flowcharts, and technical visualizations, consider using the **algorithmic-art** skill (p5.js generative art) or **canvas-design** skill to create procedurally generated diagrams directly in the browser. These would be rendered as React components, not static images — making them interactive, theme-aware, and resolution-independent.

Best for: OSI model visualization, network topology diagrams, access control model comparisons, cryptography process flows, risk matrices.

---

## Part 5: Gamification & Engagement Systems

### 5.1 Identity & Progression

| Level | XP Required | Title | Unlock |
|-------|-------------|-------|--------|
| 1 | 0 | Security Recruit | — |
| 5 | 2,500 | Junior Analyst | Custom avatar frame |
| 10 | 10,000 | Security Analyst | Leaderboard access |
| 15 | 22,500 | Senior Analyst | Achievement showcase |
| 20 | 40,000 | Security Specialist | Profile badge |
| 25 | 62,500 | Lead Consultant | Custom title card |
| 30 | 90,000 | Security Architect | Animated avatar frame |
| 40 | 160,000 | CISSP Expert | Gold nameplate |
| 50 | 250,000 | CISSP Legend | Legendary effects |

**XP Sources:** Story scenes (+10-50 per scene), knowledge checks (+25 correct, +5 attempted), quizzes (+XP per correct answer × difficulty multiplier), daily challenge (+100), streak bonus (+10 per day of active streak), achievements (variable).

### 5.2 Spaced Repetition Through Narrative

When a player gets a knowledge check wrong:
1. The failed concept is logged to `failed_concepts`
2. In a later Act, that exact concept resurfaces as a story complication
3. Example: Player misses a data classification question in Act 2 → In Act 5, a scene reveals that misclassified data led to an access control failure
4. The player must correctly answer a related question to "resolve" the complication
5. Resolved concepts are marked and contribute bonus XP

This replaces flashcard-style spaced repetition with **consequence-driven reinforcement**.

### 5.3 Adaptive Difficulty

Track per-domain accuracy in `player_act_progress` and `user_question_history`. When generating quiz sessions or story knowledge checks:
- If domain accuracy > 85%: serve harder questions, introduce edge cases
- If domain accuracy 60-85%: standard difficulty mix
- If domain accuracy < 60%: more foundational questions, additional teaching moments in story scenes
- Story branching: weaker domains get additional investigation segments with more teaching content

### 5.4 Streaks & Daily Engagement

- Daily streak counter (prominent on dashboard and profile)
- Streak shields: Pro users get 1/week (miss a day without breaking streak)
- Streak milestones at 3, 7, 14, 30, 60, 100 days with celebrations and XP bonuses
- Daily challenge: 5 mixed-domain questions, rotates daily, bonus XP for perfect score
- Evening notification system (future): "Your 14-day streak is at risk!"

### 5.5 Social & Competitive

- **Leaderboards:** Global (all-time XP), Weekly (resets Monday), Domain-specific
- **Free tier:** Can view leaderboards but not appear on them (conversion driver)
- **Share cards:** Generate styled image showing character, level, streak, and domain mastery for social media ("I Passed" flywheel)
- **Future:** Study groups, group streaks, team leaderboards

---

## Part 6: Monetization

### 6.1 Pricing Tiers

| Tier | Price | Access |
|------|-------|--------|
| **Free** | $0 | Acts 1-2 (Domains 1-2), 10 practice questions/day, basic Library, view-only leaderboard, no spaced repetition, no practice exams |
| **Pro** | $19.99 one-time unlock | All 8 Acts, unlimited practice questions, full Library with Memory Hacks, spaced repetition, leaderboard ranking, full analytics, 1 streak shield/week |
| **Premium** | $9.99/mo or $99/yr subscription | Everything in Pro + CAT practice exams (250Q/6hr), AI-generated adaptive questions, priority support, advanced analytics, unlimited streak shields |
| **Enterprise** | Custom pricing | Team management, custom scenarios, bulk licensing, admin dashboard, progress reporting |

### 6.2 Conversion Triggers

- Free users hit a gate after Act 2: "The story continues. Unlock all 8 Acts."
- Daily question limit creates scarcity
- Leaderboard visibility without participation creates FOMO
- Streak shield scarcity (can't protect streak without Pro)
- Practice exam access gated to Premium

---

## Part 7: Execution Plan — Claude Code Sessions

### Phase 1: Foundation Reset (Sessions 1-3)

**Session 1: Project cleanup and architecture**
```
TASKS:
1. Audit current codebase — identify what to keep vs. delete
2. Update package.json with latest dependencies
3. Set up new route structure (all routes from Section 2.2)
4. Install/update shadcn/ui components (full set)
5. Set up font stack (JetBrains Mono, Outfit or equivalent, Crimson Pro)
6. Create design token system (CSS variables for the cyber theme)
7. Set up Zustand stores (story-store, quiz-store, progress-store, ui-store)
8. Run GPT-5.4 pre-commit hook setup check
```

**Session 2: Database migration**
```
TASKS:
1. Create all new tables from Section 2.3 schema
2. Migrate existing question bank (ensure no data loss)
3. Set up RLS policies for all new tables
4. Create database functions for XP calculation, streak tracking
5. Test all migrations on Supabase dashboard
```

**Session 3: Core layout and navigation**
```
TASKS:
1. Build app shell — sidebar, top nav, mobile nav
2. All navigation using shadcn NavigationMenu / Sidebar
3. Dark mode setup with shadcn theme system
4. Loading states, error boundaries, empty states for every route
5. Dashboard page skeleton with widget placeholders
6. Responsive breakpoints verified on mobile/tablet/desktop
```

### Phase 2: Story Engine (Sessions 4-7)

**Session 4: Visual novel engine core**
```
TASKS:
1. Build StoryPlayer.tsx — main story rendering engine
2. Build DialogueBox.tsx with typewriter effect (12ms/char, skipSignal)
3. Build SceneBackground.tsx with image loading and transitions
4. Build CharacterSprite.tsx with expression switching
5. Build DecisionPanel.tsx with keyboard navigation
6. Wire to Zustand story-store for state management
7. Test with placeholder content (Act 1, Scene 1)
```

**Session 5: Story interaction systems**
```
TASKS:
1. Build KnowledgeCheck.tsx (inline quiz during story)
2. Build InvestigationMode.tsx (interactive segments)
3. Build EvidenceBoard.tsx (cross-domain clue connections)
4. Build AhaMoment.tsx (domain recognition callouts)
5. Build end-of-Act assessment gate
6. Build Dr. Tanaka's Debrief component
7. Wire spaced repetition (failed_concepts logging and resurfacing)
```

**Session 6: Act 1 full content generation**
```
TASKS:
1. Generate complete Act 1 content (Security & Risk Management)
2. All dialogue, scenes, decisions, knowledge checks
3. 8-15 scenes covering: governance, risk frameworks, compliance,
   ethics, BCP/DRP, personnel security, threat modeling, supply chain
4. 15-20 embedded knowledge checks
5. End-of-Act assessment (25 questions)
6. Dr. Tanaka's Debrief
7. Seed into Supabase
```

**Session 7: Act 2 full content generation**
```
TASKS:
1. Generate complete Act 2 content (Asset Security)
2. Same depth as Act 1
3. Include first "resurfaced concept" complications from Act 1 failures
4. Seed into Supabase
```

### Phase 3: Practice & Library (Sessions 8-10)

**Session 8: Quiz engine rebuild**
```
TASKS:
1. Rebuild quiz builder with shadcn/ui (domain select, difficulty, count)
2. Rebuild quiz session UI (clean, focused, keyboard shortcuts)
3. Rebuild results page (time stats, difficulty breakdown, streak, improvement)
4. Integrate existing 880+ question bank
5. Add per-question timing
6. Add "Think Like a Manager" callouts on relevant questions
```

**Session 9: Practice exam simulator**
```
TASKS:
1. Build CAT-style practice exam (adaptive difficulty, 250 questions, 6hr timer)
2. Domain-weighted question distribution matching real exam
3. Results dashboard with domain breakdown and pass/fail prediction
4. Save exam history for improvement tracking
```

**Session 10: Library and glossary rebuild**
```
TASKS:
1. Rebuild Library with shadcn/ui components
2. Each topic: overview, detailed content, comparison tables, worked examples,
   memory hacks, exam traps, related topics
3. Rebuild Glossary with sticky headers, bookmarks, search, confidence rating
4. Cross-link Library topics to story scenes and quiz questions
```

### Phase 4: Gamification & Dashboard (Sessions 11-13)

**Session 11: Progression systems**
```
TASKS:
1. Build XP system (calculation, animation, level-up effects)
2. Build streak tracker (daily tracking, shields, milestones)
3. Build achievement system (unlock conditions, notification, showcase)
4. Build title progression (Security Recruit → CISSP Legend)
5. Wire all XP sources (story, quizzes, daily challenge, streaks)
```

**Session 12: Dashboard**
```
TASKS:
1. Build dashboard with all widgets: progress ring, streak, daily challenge,
   continue story, weak domains, recent activity
2. World map component showing Act progress
3. Domain mastery radar chart
4. Responsive layout — works on mobile
```

**Session 13: Leaderboard and social**
```
TASKS:
1. Build leaderboard (global, weekly, domain-specific tabs)
2. Build share card generator (styled image for social media)
3. Build profile page (stats, achievements, history)
4. Implement free-tier view-only leaderboard restriction
```

### Phase 5: Images & Polish (Sessions 14-16)

**Session 14: Image generation pipeline**
```
TASKS:
1. Create image manifest JSON (all ~200-300 images with prompts)
2. Build generation script (scripts/generate-images.ts)
3. Set up Supabase Storage bucket
4. Run generation (may need multiple batches)
5. Wire images into StoryPlayer scenes
```

**Session 15: Landing page and conversion**
```
TASKS:
1. Build conversion-optimized landing page
2. Hero section with narrative hook
3. Feature highlights, social proof, pricing table
4. CTA flow → sign up → onboarding → story start
5. Mobile responsive
```

**Session 16: Animation and audio**
```
TASKS:
1. Add Framer Motion page transitions
2. Story scene transitions (fade, slide, dissolve)
3. Achievement unlock animations
4. XP gain animations
5. Tone.js ambient audio (optional, toggleable)
6. Sound effects for key interactions
```

### Phase 6: Content Expansion (Sessions 17-22)

**Sessions 17-22: Acts 3-8 content generation**
```
One session per Act, same depth as Acts 1-2:
- Session 17: Act 3 (Security Architecture — Munich)
- Session 18: Act 4 (Network Security — Singapore)
- Session 19: Act 5 (IAM — New York)
- Session 20: Act 6 (Security Assessment — Remote/Lab)
- Session 21: Act 7 (Security Operations — Tokyo)
- Session 22: Act 8 (Software Dev Security — Austin)

Each session generates: 8-15 scenes, 15-20 knowledge checks,
25-question end-of-Act assessment, debrief, resurfaced concepts.
```

### Phase 7: QA & Adversarial Review (Sessions 23-25)

**Session 23: Functional QA**
```
TASKS:
1. Full playthrough — Act 1 through Act 8
2. Verify all knowledge checks score correctly
3. Verify spaced repetition resurfacing works
4. Verify XP, streaks, levels calculate correctly
5. Verify quiz engine with all question types
6. Test on mobile (responsive verification)
7. Test keyboard navigation throughout
8. Document all bugs found
```

**Session 24: GPT-5.4 adversarial review**
```
TASKS:
1. Ensure global git pre-commit hook is active
2. Run full codebase commit through GPT-5.4 review
3. Address all critical findings
4. Run security audit on Supabase RLS policies
5. Performance audit (Lighthouse, bundle size)
6. Accessibility audit (ARIA, keyboard nav, screen reader)
```

**Session 25: Content QA**
```
TASKS:
1. Review all 8 Acts for ISC² exam objective coverage completeness
2. Cross-reference against official CISSP exam outline
3. Verify all explanations use "Think Like a Manager" framing
4. Verify ISC² Canon priority (Canon I > Canon III) in ethics questions
5. Check for content accuracy against reference textbooks
6. Verify no duplicate questions across Acts and practice quizzes
7. Proofread all dialogue and explanations
```

---

## Part 8: Additional Improvements to Consider

### 8.1 Exam Readiness Predictor

Build a predictive model using the player's quiz accuracy, domain strengths/weaknesses, time-per-question trends, and story completion to generate a "readiness score" and predicted exam pass probability. Display on dashboard as a confidence meter.

### 8.2 AI-Powered Question Generation

Use the Anthropic API (Claude Sonnet) to generate novel practice questions on the fly, personalized to the player's weak areas. Each generated question includes a detailed explanation and TLATM reasoning. Gate this behind Premium tier.

### 8.3 Toolkit Tab

Build a comprehensive toolkit with interactive calculators and references:
- ALE/SLE/ARO calculator
- Risk matrix builder
- BIA calculator (RTO, RPO, MTD, WRT)
- OSI model interactive reference
- Encryption comparison table
- Access control model comparison
- Common port numbers reference
- Acronym lookup

### 8.4 Study Planner

Based on exam date (user-input), remaining content, and current pace, generate a personalized study plan with daily/weekly milestones. Adjust dynamically as the user progresses.

### 8.5 "I Passed" Social Sharing Flywheel

When a user passes the practice exam or reports passing the real CISSP:
1. Generate a celebration screen with confetti and stats
2. Create a shareable card with their journey stats
3. One-click share to LinkedIn, Twitter/X, Reddit
4. Include referral link for organic growth

### 8.6 Offline Mode (Future)

PWA support for studying without internet. Cache story content and question bank locally. Sync progress when back online.

### 8.7 Audio Narration (Future)

Text-to-speech narration of story dialogue using a high-quality TTS API (ElevenLabs or similar). Different voices for different characters. Toggleable.

---

## Part 9: Go-to-Market Checklist

Pre-launch:
- [ ] All 8 Acts complete with full content
- [ ] Practice exam simulator working
- [ ] Payment integration (Stripe)
- [ ] Landing page live
- [ ] Mobile experience polished
- [ ] Share card generator working
- [ ] 3 beta testers complete full playthrough
- [ ] All bugs from QA resolved

Launch channels:
- [ ] Reddit: r/cissp, r/cybersecurity, r/ITCareerQuestions
- [ ] LinkedIn: cybersecurity study groups, CISSP prep communities
- [ ] Discord: certification study servers
- [ ] Short-form video: TikTok/YouTube Shorts showing the visual novel gameplay
- [ ] Product Hunt launch
- [ ] Direct outreach to CISSP study bloggers and YouTubers

---

## Appendix: Claude Code Prompt Template

For each session, paste this header followed by the session-specific tasks:

```
I'm rebuilding CISSP Quest with a new narrative framework. Here's the context:

PROJECT: CISSP Quest — gamified CISSP exam prep with visual novel story mode
REPO: C:\Users\Seymour\OneDrive\Desktop\cissp-quest  
SUPABASE: Project ID yebfaucgvblhctchlbvr
STACK: Next.js 14+ App Router, Supabase, Tailwind CSS, Zustand, shadcn/ui, Vercel
IMAGE GEN: Replicate API (FLUX model)

GLOBAL RULES:
- shadcn/ui is the foundation for ALL structural UI. Custom visuals layer on top.
- Fix bugs before adding features.
- Typewriter speed: 12ms/character.
- Dark mode by default.
- Full keyboard navigation.
- Mobile-first responsive design.
- TypeScript strict mode.
- Deduplicate data at the query level (SELECT DISTINCT ON).
- One Zustand store per domain.
- Generate FOR_Seymour.md after the session.
- GPT-5.4 pre-commit hook must be active.

THIS SESSION'S TASKS:
[paste session tasks here]
```
