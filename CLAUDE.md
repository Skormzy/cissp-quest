# CISSP Quest - Claude Code Project Instructions

> This file governs Claude Code behavior specifically within this project.
> Global rules from `~/.claude/CLAUDE.md` apply first; this file adds project-specific context on top.
> If there is a conflict between this file and the global, the global wins unless explicitly overridden here with reasoning.

## Project purpose

**What this project is:** Gamified CISSP certification LEARNING platform. NOT just a quiz app. Three layers stacked: Reference Library + Story Lessons + Quiz Engine. Anime visual-novel style with NPC cast, custom character creator, and memory techniques (Method of Loci, mnemonics, spaced repetition, chunking, elaborative interrogation, dual coding, narrative encoding) embedded throughout.

**Core principle:** TEACH FIRST, THEN TEST. Wrong answers always link back to a Library topic with a Memory Hack reminder.

**Who it serves:** CISSP candidates (Seymour and eventually paid users) who want a Duolingo-style alternative to dry textbook study.

**Success criteria ("done" looks like):** All 8 CISSP domains covered with original content, Stripe payments live, free tier (Domain 1) unlocked publicly, story-mode and quiz-engine stable on mobile and desktop, and content quality strong enough that Seymour himself uses it for exam prep.

**Current status:** Active build. Stripe integration scaffolded but blocked by issues documented in `REVIEW_FINDINGS_2026-04-19.md`.

**Classification:** personal (Seymour's personal SaaS, lives only on personal PC).

## Architecture

- ONE shared storyline (Operation Shadow Protocol) across 8 global locations, one per CISSP domain.
- Custom character creator (name, gender, skin, hair, outfit upgrades by level).
- Anime visual novel style with speech bubbles and NPC cast.
- Memory techniques embedded: Method of Loci, mnemonics, spaced repetition, chunking, elaborative interrogation, dual coding, narrative encoding.
- Reference Library always accessible from nav bar.
- Wrong answers link to Library topics with Memory Hack reminders.
- Quiz engine includes a CAT (Computerized Adaptive Testing) path using IRT scoring (`src/lib/cat-session.ts`, `src/lib/irt-engine.ts`).

## CISSP Domains (all 8 must be covered)

1. Security and Risk Management (15%)
2. Asset Security (10%)
3. Security Architecture and Engineering (13%)
4. Communication and Network Security (13%)
5. Identity and Access Management (13%)
6. Security Assessment and Testing (12%)
7. Security Operations (13%)
8. Software Development Security (11%)

## Tech stack

**Runtime / language:** Node 20, TypeScript 5 (strict mode).
**Primary framework:** Next.js 16.1.6 (App Router), React 19.2.3.
**UI library:** shadcn/ui (base-nova style, neutral baseColor) + Tailwind CSS v4 + tw-animate-css. Icons via lucide-react. Animations via Framer Motion. Charts via Recharts. Command palette via cmdk. Toasts via sonner.
**Database / backend:** Supabase (Postgres + Auth + RLS). Project ID `yebfaucgvblhctchlbvr`.
**State:** Zustand (client/UI state).
**Markdown rendering:** react-markdown + remark-gfm.
**Payments:** Stripe (scaffolded, NOT production-ready - see REVIEW_FINDINGS_2026-04-19.md).
**AI features:** Anthropic SDK (`@anthropic-ai/sdk`) for question generation. Replicate for character/background image generation (`scripts/generate-images.ts`).
**Audio:** tone (Tone.js) for sound effects.
**Build tool:** `next build`.
**Deploy target:** Vercel (frontend), Supabase (backend).

## Coding standards (project-specific)

### File organization

- `src/app/` - Next.js App Router pages and API routes.
  - `src/app/(auth)/` - auth route group.
  - `src/app/app/` - authenticated app routes (dashboard, quiz, story, library, tools, community, upgrade).
  - `src/app/api/stripe/` - Stripe checkout and webhook routes.
- `src/components/` - composite components organized by domain (audio, character, community, dashboard, layout, medals, nav, quiz, story, tools, ui, visual-novel). `src/components/ui/` is shadcn primitives.
- `src/lib/` - business logic (CAT engine, IRT engine, question generator, story content, Stripe config, Supabase client, audio, replicate). One file per concern.
- `src/data/` - static content data (story acts, glossary, etc.).
- `src/stores/` - Zustand stores, one per domain.
- `scripts/` - one-off ingestion and generation scripts (image generation, question seeding, textbook extraction). Excluded from tsconfig.
- `source-material/` - PDFs and extracted source content (gitignored).
- `supabase-*-migration.sql` files at project root - SQL migrations, applied via Supabase MCP or dashboard.

### Naming conventions

Defaults from global apply (kebab-case files, PascalCase components, one component per file).

### Testing

**Applicable tiers:**
- Tier 1 Unit Tests: no
- Tier 2 Integration: no
- Tier 3 End-to-End: no
- Tier 4 Regression: no
- Tier 5 Visual/UX: manual only

**Test framework:** none currently installed. Vitest + Playwright should be added before Stripe goes live.

## Architectural decisions

### Decision 1: Original content, never copy-paste from textbooks
**What:** All Library entries, questions, and lessons are original prose informed by ISC2 outline and reference textbooks, not extracted verbatim.
**Alternatives considered:** Bulk-import from existing CISSP question banks.
**Why:** Avoid copyright issues, maintain consistent voice ("Think Like a Manager"), and embed memory hacks that off-the-shelf banks don't have.
**Date:** 2026-04-15

### Decision 2: One shared narrative across all 8 domains
**What:** Operation Shadow Protocol storyline spans all domains rather than 8 isolated mini-stories.
**Alternatives considered:** Separate self-contained story per domain.
**Why:** Stronger narrative encoding (memory technique), persistent character investment, and easier to introduce recurring NPCs that reinforce concepts across domains.
**Date:** 2026-04-15

### Decision 3: CAT/IRT engine for adaptive practice
**What:** Practice exam uses Computerized Adaptive Testing with Item Response Theory scoring.
**Alternatives considered:** Random selection within domain, fixed-difficulty pools.
**Why:** Mirrors the real CISSP exam scoring model and provides better difficulty calibration over time.
**Date:** 2026-04-17

## Known issues and limitations

See `REVIEW_FINDINGS_2026-04-19.md` for the full Codex adversarial review (12 findings, 3 critical, 4 high, 5 medium). Highlights:

- Stripe integration is NOT production-ready: missing DB columns (`stripe_customer_id`, `stripe_subscription_id`, `subscription_expires_at`), webhook signature verification falls back to plaintext parse, RLS policy lets users self-upgrade tier from the browser console, paid-feature pages lack server-side tier checks.
- Community/notification tables (`chatroom_messages`, `weekly_scores`, `notification_queue`) referenced in code but missing from migration SQL.
- Annual billing UI does not reach the server (param name mismatch).
- SPRT helper in `irt-engine.ts` has inverted pass/fail logic (only matters if `CATController` path becomes active).
- `scripts/seed-questions.ts` is destructive and silently swallows errors.

These are application-logic and data-model issues, not bootstrap issues. Priority order is documented in REVIEW_FINDINGS_2026-04-19.md.

## Build, test, and deploy procedures

### Local development
```bash
npm run dev
```

### Image generation (Replicate)
```bash
npm run generate-images:dry          # preview prompts
npm run generate-images:characters
npm run generate-images:backgrounds
npm run generate-images               # full run
```

### Build
```bash
npm run build
```

### Deploy
Vercel (auto-deploy on push to `master`). Supabase migrations applied manually via Supabase MCP or dashboard.

## Project-specific environment

**Required environment variables** (stored in `.env.local`, never committed):
- `NEXT_PUBLIC_SUPABASE_URL` - Supabase project URL.
- `NEXT_PUBLIC_SUPABASE_ANON_KEY` - Supabase anon key.
- `SUPABASE_SERVICE_ROLE_KEY` - server-side admin key (used in API routes).
- `STRIPE_SECRET_KEY` - Stripe API secret.
- `STRIPE_WEBHOOK_SECRET` - Stripe webhook signing secret (currently optional; must become mandatory before ship).
- `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY` - Stripe public key.
- `ANTHROPIC_API_KEY` - Claude API key for question generation.
- `REPLICATE_API_TOKEN` - Replicate token for image generation.

**Secrets storage:** `.env.local` for local dev. Vercel env vars for production.

## Plugin and tool configuration

Inherits global Proactive Tool Surfacing rules. No project-level overrides.

The `.claude/settings.json` already allows Supabase MCP tools (`execute_sql`, `apply_migration`, `list_tables`, `list_migrations`, `get_project`, `list_projects`) for migration work.

## Self-improvement

Per the global Continuous Improvement Protocol, this project maintains `LEARNING_LOG.md` alongside this file. Append an entry after every substantive work session documenting decisions made, mistakes discovered, and patterns established.

`FOR_Seymour.md` teaching files: ENABLED for this project (per global default). They are useful here because Seymour is actively learning the CAT/IRT, Stripe, and Supabase patterns embedded in this codebase.

## Out of scope

- Native mobile apps (web-only, mobile-responsive).
- Live tutoring or human-in-the-loop coaching.
- Other certifications (CompTIA, CCSP, etc.) - CISSP only for now.
- B2B enterprise features beyond the per-seat pricing concept (no SSO, no audit logs, no tenant admin).

---

*Last updated: 2026-04-19 by bootstrap-project skill. See LEARNING_LOG.md for change history.*
