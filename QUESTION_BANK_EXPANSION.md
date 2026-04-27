# Question Bank Expansion — Plan + Tools

## Current state (live DB)

- **Total questions:** 240 (30 per domain)
- **Library topics:** 80 rows
- **Topics with 0 linked questions:** 37 (~46% of topics)
- **Average questions/topic with any:** ~5
- **Target:** 30+ questions per topic = ~2,400 questions minimum, ~5,000 stretch

## Tools committed in this sprint

### 1. `scripts/generate-questions.mjs`

Calls the Anthropic API (`claude-sonnet-4-5-20250929`) to generate CISSP-style questions for a single library topic. Reads the topic's full content from the database and uses it as grounding context so questions are answerable from the library.

```bash
node scripts/generate-questions.mjs --topic 1.6 --count 20 --out batch.sql
```

Options:
- `--topic <number>` — library topic_number (e.g., `1.6`, `5.4.1`).
- `--count <n>` — how many questions (default 20).
- `--difficulty mixed|easy|medium|hard` — default mixed (30%/50%/20%).
- `--out <file.sql>` — write to file; otherwise stdout.

Output is ready-to-apply SQL (BEGIN ... COMMIT block of INSERTs).

### 2. `scripts/seed-questions-batch.mjs`

Orchestrator. Walks the `library_topics` table, calls the generator for every topic that needs more questions, and applies the resulting SQL via the Management API.

```bash
# Bring every topic up to at least 30 questions
node scripts/seed-questions-batch.mjs --target 30

# Only fill the zero-question topics (first batch)
node scripts/seed-questions-batch.mjs --zero-only

# Dry run — see what would happen without calling the API
node scripts/seed-questions-batch.mjs --target 30 --dry

# Single topic
node scripts/seed-questions-batch.mjs --topic 5.4.1
```

Generated SQL for each topic is also kept on disk in `generated-questions/<topic_number>.sql` for review / re-apply.

## Prerequisite

The `ANTHROPIC_API_KEY` in `.env.local` is currently invalid (returns 401 from the Anthropic API). To unblock the generator:

1. Get a fresh API key from https://console.anthropic.com/settings/keys
2. Replace the existing line in `.env.local`:
   ```
   ANTHROPIC_API_KEY=sk-ant-...
   ```
3. Re-run the orchestrator:
   ```bash
   node scripts/seed-questions-batch.mjs --zero-only
   ```

Estimated cost on Claude Sonnet 4.5:
- ~$0.005-0.015 per question generated (incl. ~3-5K tokens of grounding context per call).
- 18 questions × 37 zero-topics = ~700 questions ≈ **$5-10** total for first batch.
- Filling all topics to 30 = ~2,000 new questions ≈ **$20-30**.
- Stretch to 60 each = ~4,500 new questions ≈ **$50-70**.

## Recommended sequence

```bash
# Phase 1 — fill zero-question topics first (~10 min, ~$10)
node scripts/seed-questions-batch.mjs --zero-only

# Phase 2 — bring everything to 30 questions/topic (~30 min, ~$25)
node scripts/seed-questions-batch.mjs --target 30

# Phase 3 — stretch to 60 for high-frequency topics (~30 min, ~$30)
node scripts/seed-questions-batch.mjs --target 60
```

After each phase, confirm via:

```bash
node scripts/verify-migrations.mjs
# (uses same .env credentials; can reuse to query question counts)
```

Or directly:

```sql
-- Run via Supabase dashboard or Management API
SELECT lt.topic_number, lt.title, COUNT(q.id) AS questions
FROM library_topics lt
LEFT JOIN questions q ON q.library_topic_id = lt.id AND q.is_active = true
GROUP BY lt.id, lt.topic_number, lt.title, lt.domain_id
ORDER BY lt.domain_id, lt.topic_number;
```

## Quality gates (built into the generator prompt)

Each generated question must:
- Be answerable from the library topic content
- Have exactly 4 options with exactly 1 correct
- Mix difficulty (easy/medium/hard)
- Include a memory hack tied to the answer
- Test "Think Like a Manager" framing where applicable

If quality issues surface in production, tune the prompt in `generate-questions.mjs` and re-run.

## Future enhancements (post first 5,000 questions)

- **Variant generation** — for high-traffic topics, ask Claude for "5 paraphrased variants of this question" so the practice exam never repeats verbatim.
- **Difficulty calibration** — feed the IRT engine's actual difficulty estimates back into the prompt so easy/medium/hard labels track real user performance.
- **Distractor critique** — second LLM pass that critiques weak distractors and asks for replacements.
- **Sample-question detection** — semantic similarity check against existing bank to avoid duplicates.
- **Multi-language** — translation pass for non-English exam sittings.
