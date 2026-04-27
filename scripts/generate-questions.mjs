// CISSP question generator. Uses the local Claude Code CLI (Max
// subscription) — NO Anthropic API key required, NO per-token spend.
//
// Usage:
//   node scripts/generate-questions.mjs --topic 1.6 --count 20 [--out batch.sql]
//
// Reads .env.local for SUPABASE_ACCESS_TOKEN to look up the topic's
// content from the live DB (so questions are grounded in what the app
// actually teaches). Then shells out to `claude -p "..."` and parses
// the JSON response. Writes SQL inserts ready to apply via
// scripts/apply-migrations.mjs (or the orchestrator applies inline).

import { readFileSync, existsSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';
import { spawn } from 'node:child_process';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..');

function loadEnv() {
  const path = resolve(ROOT, '.env.local');
  if (!existsSync(path)) return {};
  const out = {};
  for (const line of readFileSync(path, 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (m) out[m[1]] = m[2].replace(/^['"]|['"]$/g, '').trim();
  }
  return out;
}

function parseArgs() {
  const args = process.argv.slice(2);
  const out = { count: 20 };
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--topic') out.topic = args[++i];
    else if (args[i] === '--count') out.count = parseInt(args[++i], 10);
    else if (args[i] === '--out') out.outFile = args[++i];
    else if (args[i] === '--difficulty') out.difficulty = args[++i];
  }
  return out;
}

const env = { ...loadEnv(), ...process.env };
const SUPABASE_TOKEN = env.SUPABASE_ACCESS_TOKEN;
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;

if (!SUPABASE_TOKEN || !SUPABASE_URL) {
  console.error('Missing SUPABASE_ACCESS_TOKEN or NEXT_PUBLIC_SUPABASE_URL in .env.local');
  process.exit(1);
}

const args = parseArgs();
if (!args.topic) {
  console.error('Usage: node scripts/generate-questions.mjs --topic <number> [--count 20] [--difficulty mixed|easy|medium|hard] [--out file.sql]');
  process.exit(1);
}

const ref = SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\./i)[1];

async function dbQuery(sql) {
  const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${SUPABASE_TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query: sql }),
  });
  return JSON.parse(await res.text());
}

// Look up the topic.
const escaped = args.topic.replace(/'/g, "''");
const topicRows = await dbQuery(
  `SELECT id, domain_id, topic_number, title, one_liner, content_markdown, exam_tips, memory_hack
   FROM library_topics WHERE topic_number = '${escaped}' LIMIT 1`,
);

if (!Array.isArray(topicRows) || topicRows.length === 0) {
  console.error(`Topic ${args.topic} not found in library_topics.`);
  process.exit(1);
}

const topic = topicRows[0];
console.error(`Generating ${args.count} questions for ${topic.topic_number} ${topic.title}...`);

const prompt = `You are creating CISSP exam questions for the topic "${topic.title}" (Domain ${topic.domain_id}).

Topic context (use this as your knowledge base — questions must be answerable from it):
TITLE: ${topic.title}
ONE-LINER: ${topic.one_liner ?? ''}
CONTENT:
${topic.content_markdown ?? ''}
EXAM TIPS: ${topic.exam_tips ?? ''}
MEMORY HACK: ${topic.memory_hack ?? ''}

Generate exactly ${args.count} CISSP-style multiple-choice questions. Each question must:
- Test a distinct fact, distinction, or scenario from the topic
- Have exactly 4 options
- Mark exactly 1 as correct
- Include 2 plausible distractors and 1 obviously-wrong option (for accessibility)
- Test "Think Like a Manager" framing where applicable (governance > technology)
- Vary in difficulty: roughly 30% easy / 50% medium / 20% hard${args.difficulty && args.difficulty !== 'mixed' ? ` (this batch: ${args.difficulty} only)` : ''}
- Avoid trick questions about wording; test understanding

Return ONLY valid JSON (no prose, no markdown fences) in this exact shape:
{
  "questions": [
    {
      "question_text": "...",
      "options": ["A...", "B...", "C...", "D..."],
      "correct_index": 0,
      "explanation": "...",
      "memory_hack": "...",
      "difficulty": "easy"
    }
  ]
}

The "explanation" field should explain WHY the correct answer is right and WHY each common distractor is wrong.
The "memory_hack" field should be 1-2 sentences with a memorable analogy or mnemonic.
Difficulty must be exactly one of: easy, medium, hard.`;

console.error('Calling local Claude CLI...');

// Spawn `claude -p <prompt>`. The CLI authenticates via the Max
// subscription session — no API key in env.
function callClaude(prompt) {
  return new Promise((resolve, reject) => {
    const child = spawn('claude', ['-p', prompt, '--output-format', 'text'], {
      stdio: ['ignore', 'pipe', 'pipe'],
      shell: false,
    });
    let stdout = '';
    let stderr = '';
    child.stdout.on('data', (d) => { stdout += d.toString(); });
    child.stderr.on('data', (d) => { stderr += d.toString(); });
    child.on('error', reject);
    child.on('close', (code) => {
      if (code !== 0) reject(new Error(`claude CLI exit ${code}: ${stderr}`));
      else resolve(stdout);
    });
  });
}

const text = await callClaude(prompt);

let parsed;
try {
  // Strip optional markdown fences and any preamble before the first '{'.
  let cleaned = text.trim();
  const fence = cleaned.match(/```(?:json)?\s*([\s\S]+?)```/);
  if (fence) cleaned = fence[1].trim();
  // If the CLI added any preamble, find the first '{' and last '}'.
  const firstBrace = cleaned.indexOf('{');
  const lastBrace = cleaned.lastIndexOf('}');
  if (firstBrace >= 0 && lastBrace > firstBrace) {
    cleaned = cleaned.slice(firstBrace, lastBrace + 1);
  }
  parsed = JSON.parse(cleaned);
} catch (err) {
  console.error('Failed to parse JSON from Claude CLI:', err.message);
  console.error('Raw response (first 800 chars):', text.slice(0, 800));
  process.exit(1);
}

if (!parsed.questions || !Array.isArray(parsed.questions)) {
  console.error('Response missing "questions" array');
  process.exit(1);
}

console.error(`Got ${parsed.questions.length} questions. Generating SQL...`);

function escSql(s) {
  return String(s).replace(/'/g, "''");
}

const inserts = parsed.questions.map((q) => {
  if (!q.question_text || !Array.isArray(q.options) || q.options.length !== 4) return null;
  const opts = JSON.stringify(q.options).replace(/'/g, "''");
  const ex = escSql(q.explanation ?? '');
  const mh = escSql(q.memory_hack ?? '');
  const qt = escSql(q.question_text);
  const ci = Math.max(0, Math.min(3, parseInt(q.correct_index, 10) || 0));
  const diff = ['easy', 'medium', 'hard'].includes(q.difficulty) ? q.difficulty : 'medium';
  return `INSERT INTO public.questions (
    domain_id, library_topic_id, question_text, options, correct_index,
    explanation, mnemonic_hint, difficulty, is_active
  ) VALUES (
    ${topic.domain_id},
    '${topic.id}'::uuid,
    '${qt}',
    '${opts}'::jsonb,
    ${ci},
    '${ex}',
    '${mh}',
    '${diff}',
    true
  );`;
}).filter(Boolean);

const sql = `-- Generated for topic ${topic.topic_number} ${topic.title}
-- ${inserts.length} questions (Claude CLI / Max subscription)
BEGIN;
${inserts.join('\n')}
COMMIT;
`;

if (args.outFile) {
  writeFileSync(resolve(ROOT, args.outFile), sql, 'utf8');
  console.error(`Wrote ${inserts.length} INSERTs to ${args.outFile}`);
} else {
  process.stdout.write(sql);
}
