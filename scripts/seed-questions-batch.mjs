// Orchestrator. Walks the library_topics table, identifies topics
// needing more questions, calls generate-questions.mjs for each, and
// applies the resulting SQL via the Management API.
//
// Usage:
//   node scripts/seed-questions-batch.mjs --target 30      # bring every topic to >= 30 questions
//   node scripts/seed-questions-batch.mjs --zero-only      # only topics with 0 questions
//   node scripts/seed-questions-batch.mjs --topic 1.6      # one specific topic
//
// Reads .env.local for ANTHROPIC_API_KEY + SUPABASE_ACCESS_TOKEN.

import { readFileSync, existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';
import { spawnSync } from 'node:child_process';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..');
const OUT_DIR = resolve(ROOT, 'generated-questions');

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
  const out = { target: 30 };
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--target') out.target = parseInt(args[++i], 10);
    else if (args[i] === '--zero-only') out.zeroOnly = true;
    else if (args[i] === '--topic') out.topic = args[++i];
    else if (args[i] === '--dry') out.dry = true;
  }
  return out;
}

const env = { ...loadEnv(), ...process.env };
const SUPABASE_TOKEN = env.SUPABASE_ACCESS_TOKEN;
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;

if (!SUPABASE_TOKEN || !SUPABASE_URL) {
  console.error('Missing SUPABASE_ACCESS_TOKEN or NEXT_PUBLIC_SUPABASE_URL');
  process.exit(1);
}

const ref = SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\./i)[1];
const args = parseArgs();

async function dbQuery(sql) {
  const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${SUPABASE_TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query: sql }),
  });
  return JSON.parse(await res.text());
}

async function applySql(sql) {
  const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${SUPABASE_TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query: sql }),
  });
  return { ok: res.ok, status: res.status, body: await res.text() };
}

if (!existsSync(OUT_DIR)) mkdirSync(OUT_DIR, { recursive: true });

// Identify topics needing questions.
const topics = await dbQuery(`
  SELECT lt.topic_number, lt.title, lt.domain_id,
         COUNT(q.id) FILTER (WHERE q.is_active) AS current_count
  FROM library_topics lt
  LEFT JOIN questions q ON q.library_topic_id = lt.id
  ${args.topic ? `WHERE lt.topic_number = '${args.topic.replace(/'/g, "''")}'` : ''}
  GROUP BY lt.id, lt.topic_number, lt.title, lt.domain_id
  ORDER BY lt.domain_id, lt.topic_number
`);

if (!Array.isArray(topics)) {
  console.error('Failed to query topics:', topics);
  process.exit(1);
}

const needWork = topics.filter((t) => {
  if (args.zeroOnly) return Number(t.current_count) === 0;
  return Number(t.current_count) < args.target;
});

console.log(`${topics.length} topics queried; ${needWork.length} need work.`);
if (needWork.length === 0) {
  console.log('Nothing to do.');
  process.exit(0);
}

if (args.dry) {
  console.log('--dry: would generate for:');
  for (const t of needWork) {
    const need = args.zeroOnly ? 18 : args.target - Number(t.current_count);
    console.log(`  ${t.topic_number} ${t.title} (current ${t.current_count}, generate ${need})`);
  }
  process.exit(0);
}

let total = 0;
let failed = 0;
for (const t of needWork) {
  const need = args.zeroOnly ? 18 : args.target - Number(t.current_count);
  if (need <= 0) continue;
  const outFile = resolve(OUT_DIR, `${t.topic_number}.sql`);
  console.log(`\n--- ${t.topic_number} ${t.title} (need ${need}) ---`);

  // Run generator as a child process.
  const result = spawnSync(
    process.execPath,
    [
      resolve(__dirname, 'generate-questions.mjs'),
      '--topic', t.topic_number,
      '--count', String(need),
      '--out', outFile,
    ],
    { stdio: 'inherit' },
  );

  if (result.status !== 0) {
    console.error(`  generator failed for ${t.topic_number}`);
    failed++;
    continue;
  }

  // Apply.
  const sql = readFileSync(outFile, 'utf8');
  const apply = await applySql(sql);
  if (!apply.ok) {
    console.error(`  apply failed: ${apply.body.slice(0, 300)}`);
    failed++;
    continue;
  }
  // Count INSERT statements as a proxy for inserted rows.
  const inserts = (sql.match(/INSERT INTO/g) || []).length;
  total += inserts;
  console.log(`  applied ${inserts} questions`);
}

console.log(`\nTotal applied: ${total} questions across ${needWork.length - failed} topics. Failures: ${failed}.`);
