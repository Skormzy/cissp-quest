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
