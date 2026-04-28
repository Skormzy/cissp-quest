# Learning Log - CISSP Quest

> Append-only journal of decisions, mistakes, patterns, and insights discovered while building this project. Never edit prior entries; if something was wrong, add a new entry correcting it. Survives `/compact` because it is a file, not chat history.

---

## 2026-04-19 - Project bootstrapped to current infrastructure standard

### What happened
Ran `/bootstrap-project` against the existing CISSP Quest repo. The project already had a `CLAUDE.md` from commit `c5f7d65` (47 lines), a populated `.claude/settings.json` with Supabase MCP allowances, and a fresh adversarial review report (`REVIEW_FINDINGS_2026-04-19.md`) capturing 12 Stripe/RLS/data-model issues from commit `2f2e3ed`. Working tree was clean before bootstrap began.

### What we learned
- The existing `CLAUDE.md` was concise and accurate but lacked the structured sections the current standard expects (project purpose, success criteria, architectural decisions, environment variables, out of scope).
- `.claude/` had settings files but no `commands/`, `skills/`, or `agents/` subdirectories. Created them with `.gitkeep` placeholders so they are tracked.
- README.md is still the default `create-next-app` boilerplate. Not bootstrap-critical, but worth replacing in a future session.
- `.gitignore` was minimal (5 lines). Expanded to cover `dist/`, `build/`, `.env.*.local`, `.claude/cache/`, `.claude/sessions/`, and `.vercel/`.
- No test framework is installed. Vitest + Playwright should be added before Stripe ships.
- The 12 review findings in REVIEW_FINDINGS_2026-04-19.md are application-logic issues, not bootstrap-related. Bootstrap deliberately did not touch them.

### What changed as a result
- Updated `CLAUDE.md` with merged content (preserved all original sections, added structured project-purpose, decisions, known-issues, environment, and out-of-scope sections).
- Created `LEARNING_LOG.md` (this file).
- Created `.claude/commands/`, `.claude/skills/`, `.claude/agents/` with `.gitkeep` placeholders.
- Expanded `.gitignore`.
- Generated `BOOTSTRAP_REPORT.md` with full audit trail.

---

## Entry format for future entries

```markdown
## YYYY-MM-DD - [Short topic headline]

### What happened
[Description of the work, decision, mistake, or observation. Be specific. Include file paths, commit hashes, error messages when relevant.]

### What we learned
[The insight. What do we now know that we did not know before? The "why" behind the what.]

### What changed as a result
[Concrete action: updated CLAUDE.md rule, added test, changed process, flagged for future work, etc. If nothing changed, write "No action taken - logged for future reference."]
```

### Rules for entries

1. One entry per logical work session (equivalent to one git commit worth of decisions). Do not create micro-entries for every small task.
2. Decisions made section captures the why, not just the what. The why is the part that vanishes after `/compact`.
3. Gotchas and mistakes are the highest-value entries. They save the most time on future sessions.
4. Open questions tagged with `?` can be scanned later to resolve deferred items.
5. Every entry dated in `YYYY-MM-DD` format for sortability.

---

## 2026-04-28 - Restore canonical progress, quiz history, and XP paths

### What happened
Applied the non-payment review fixes from the April review batch. The app now writes quiz attempts to `player_question_history`, story/domain progress is restored through a dedicated migration, XP awards go through the idempotent `award_xp_idempotent` RPC, and readiness now reports blueprint-adjusted coverage instead of only attempted-domain performance. The Supabase project `yebfaucgvblhctchlbvr` was repaired through the Management API because the local CLI could list/link the project but could not access migration history without the direct database password.

### What we learned
- `story_progress` had disappeared from the remote database even though active story routes still depend on it; future consolidation migrations must preserve live app tables unless the code has already moved.
- XP level logic must stay centralized. The app's TypeScript curve and SQL RPC had drifted, so database helpers now mirror `src/lib/leveling.ts`.
- Payment hardening remains intentionally deferred while Seymour and his wife playtest the learning experience, but the non-payment gates around story, quizzes, history, readiness, and profile stats need to be stable before that playtest.

### What changed as a result
- Added `supabase/migrations/20260428090000_restore_story_progress_and_history_alignment.sql`.
- Updated the master/consolidation SQL and XP RPC migration so fresh and repaired databases share the same progress/history/level behavior.
- Updated app routes/components to use canonical `player_question_history`, profile XP state, idempotent XP awards, and blueprint-adjusted readiness scoring.
- Recorded the applied migration history markers in Supabase and documented them in `PENDING_MIGRATIONS.md`.

---

## 2026-04-28 — Why Claude Code missed plumbing bugs Codex caught

### What happened
Codex ran a full adversarial review and found five categories of bug Claude Code shipped during Sprints A through G plus the Phase 1-9 redesign:
1. `story_progress` table dropped from production while live app routes still queried it. Type-check + build passed. Runtime would 500.
2. `player_question_history` was the canonical quiz-history table; quiz/history/profile pages were reading from the wrong source. Stats stayed at zero.
3. `level_for_xp` SQL helper used `floor(xp/100)+1`. The real TypeScript curve in `src/lib/leveling.ts` is `round(100 * N^1.5)` per level. SQL and TS disagreed on every user's level.
4. `rank_for_level` SQL had invented rank names ("CISSP Legend / Senior Architect / ... / Recruit") and thresholds (50/35/25/15/8/3). Real ladder in the codebase: "Architect / Sentinel / Specialist / Operative / Analyst / Recruit" at 26/21/16/11/6.
5. Readiness scored attempted-domain performance instead of blueprint-weighted. Misled the user about exam preparedness.

Caught only because INSERT errored at apply time: questions table column `mnemonic_hint`, not `memory_hack`. Had the schema been permissive the wrong column would have shipped.

### What we learned
The class of bug Claude Code missed has a name: **schema/code parity violations and data-flow integrity gaps**. Type-check and build passed for every one of them because TypeScript and Next.js cannot see SQL semantics, table existence at runtime, or whether two implementations of the same business logic agree.

Specific failure modes:
- Authored SQL helpers (`level_for_xp`, `rank_for_level`) without opening the TypeScript source-of-truth they were supposed to mirror.
- Treated migrations as canonical when the calling application code is the real source of truth. Did not grep `from('<table>')` against the dropped tables before committing the consolidation.
- Used `tsc --noEmit` + `next build` as semantic verification. They are syntax + type checks, not behavioral checks.
- Adversarial reviews scoped to "the files I just changed" instead of invariants ("every awardXp callsite uses the RPC", "every `from()` resolves", "every level boundary in TS matches DB").
- Never end-to-end smoke-tested the actual flows in a browser despite the global CLAUDE.md rule mandating it.
- Volume hid breadth: 177 scenes + 2,310 questions + diagrams + library content felt like progress. Foundation parity is what decides whether the app works.

### What changed as a result
1. Lessons logged here and propagated to the cognitive substrate: appended a "Schema/Code Parity Verification (Global)" section to `~/.claude/CLAUDE.md` and pinned an "Invariants over surface checks" rule to `~/.claude/brain/GLOBAL.md` so the failure mode does NOT repeat on MineCharts, Receivables AI, PlanForge, HaulOS, or any future project.
2. Added invariants pre-flight to the standard build workflow:
   - Before authoring SQL that mirrors TS logic: open the TS file, copy-comment the algorithm into the SQL header, translate exactly. The TS file is the spec.
   - Before any cleanup/consolidation migration that drops or renames a table: `grep -r "from('<table>')\\|table.\\\\.\\(.*<table>.*\\)" src/`. If anything matches, the migration is wrong.
   - Before claiming a UI feature is done: run `npm run dev`, log in, walk the flow, paste real evidence per the global Verification Evidence Requirement.
   - Add a small Vitest "invariants" test file per project that pins TS-vs-SQL parity at sampled inputs (level boundaries, rank thresholds, formula outputs). It runs in CI and breaks the build the moment the two implementations drift.
3. Adversarial review prompts now explicitly include invariants scope, not just file scope. Standard prompt template: "audit invariants X, Y, Z across the entire codebase, not just my recent changes."
