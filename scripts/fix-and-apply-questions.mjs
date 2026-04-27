// Rewrites already-generated question SQL files to match the real
// `questions` schema (memory_hack -> mnemonic_hint), then applies them
// via the Management API. Used once to recover the first batch.

import { readFileSync, writeFileSync, readdirSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..');
const DIR = resolve(ROOT, 'generated-questions');

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

const env = { ...loadEnv(), ...process.env };
const ref = env.NEXT_PUBLIC_SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\./)[1];
const TOKEN = env.SUPABASE_ACCESS_TOKEN;

async function applySql(sql, attempt = 0) {
  try {
    const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${TOKEN}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ query: sql }),
    });
    return { ok: res.ok, status: res.status, body: await res.text() };
  } catch (err) {
    if (attempt < 3) {
      const wait = 2000 * Math.pow(2, attempt);
      console.error(`  [retry ${attempt + 1}/3 in ${wait}ms] ${err.message}`);
      await new Promise((r) => setTimeout(r, wait));
      return applySql(sql, attempt + 1);
    }
    return { ok: false, status: 0, body: `network error: ${err.message}` };
  }
}

const SKIP_FILE = process.env.SKIP_FILE || '';
const skipBefore = SKIP_FILE
  ? readdirSync(DIR).filter((f) => f.endsWith('.sql')).sort().indexOf(SKIP_FILE) + 1
  : 0;
const files = readdirSync(DIR).filter((f) => f.endsWith('.sql')).sort().slice(skipBefore);
console.log(`Found ${files.length} SQL files. Rewriting + applying...`);

let totalApplied = 0;
let totalFailed = 0;

for (const f of files) {
  const path = resolve(DIR, f);
  const original = readFileSync(path, 'utf8');
  // Replace the only column name that mismatches.
  const fixed = original.replace(
    /explanation,\s*memory_hack,\s*difficulty/g,
    'explanation, mnemonic_hint, difficulty',
  );
  if (fixed !== original) writeFileSync(path, fixed, 'utf8');

  const inserts = (fixed.match(/INSERT INTO/g) || []).length;
  const r = await applySql(fixed);
  if (!r.ok) {
    console.error(`  [FAIL] ${f}: ${r.body.slice(0, 200)}`);
    totalFailed++;
    continue;
  }
  console.log(`  [OK]   ${f} — ${inserts} questions`);
  totalApplied += inserts;
  // Throttle so the connection pool stays happy.
  await new Promise((r) => setTimeout(r, 750));
}

console.log(`\nApplied ${totalApplied} questions across ${files.length - totalFailed} topics. Failures: ${totalFailed}.`);
