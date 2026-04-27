// Migration runner. Applies SQL files to the project's Supabase
// Postgres database. Picks the first available auth path:
//
//   1. SUPABASE_ACCESS_TOKEN  -> Management API SQL endpoint
//      (https://api.supabase.com/v1/projects/{ref}/database/query)
//      Generate at https://supabase.com/dashboard/account/tokens
//
//   2. SUPABASE_DB_URL        -> direct Postgres via `pg`
//      Format: postgres://postgres.<ref>:<password>@aws-0-<region>.pooler.supabase.com:6543/postgres
//      Get from the Supabase dashboard -> Settings -> Database -> Connection String -> URI
//
// Usage:
//   node scripts/apply-migrations.mjs file1.sql [file2.sql ...]
//
// Add either credential to .env.local and re-run.

import { readFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..');

function loadDotEnvLocal() {
  const path = resolve(ROOT, '.env.local');
  if (!existsSync(path)) return {};
  const raw = readFileSync(path, 'utf8');
  const out = {};
  for (const line of raw.split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (!m) continue;
    let v = m[2].trim();
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) {
      v = v.slice(1, -1);
    }
    out[m[1]] = v;
  }
  return out;
}

const env = { ...loadDotEnvLocal(), ...process.env };
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;
const ACCESS_TOKEN = env.SUPABASE_ACCESS_TOKEN;
const DB_URL = env.SUPABASE_DB_URL;

if (!SUPABASE_URL) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL in .env.local');
  process.exit(1);
}

const projectRef = (() => {
  const m = SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\.supabase\.co/i);
  return m ? m[1] : null;
})();

if (!ACCESS_TOKEN && !DB_URL) {
  console.error('Need ONE of these in .env.local:');
  console.error('');
  console.error('  SUPABASE_ACCESS_TOKEN=sbp_...');
  console.error('    Generate: https://supabase.com/dashboard/account/tokens');
  console.error('');
  console.error('  SUPABASE_DB_URL=postgres://postgres.<ref>:<pwd>@aws-0-<region>.pooler.supabase.com:6543/postgres');
  console.error('    Get from: dashboard -> Settings -> Database -> Connection String -> URI');
  process.exit(1);
}

const files = process.argv.slice(2);
if (files.length === 0) {
  console.error('Usage: node scripts/apply-migrations.mjs <file1.sql> [...]');
  process.exit(1);
}

async function applyViaManagementAPI(sql) {
  const url = `https://api.supabase.com/v1/projects/${projectRef}/database/query`;
  const res = await fetch(url, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${ACCESS_TOKEN}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ query: sql }),
  });
  return { ok: res.ok, status: res.status, body: await res.text() };
}

async function applyViaPg(sql) {
  // Lazy-import so we don't require `pg` for the management-API path.
  const { Client } = await import('pg');
  const client = new Client({
    connectionString: DB_URL,
    ssl: { rejectUnauthorized: false },
  });
  try {
    await client.connect();
    await client.query(sql);
    return { ok: true, status: 200, body: 'applied' };
  } catch (err) {
    return { ok: false, status: 500, body: String(err.message ?? err) };
  } finally {
    await client.end().catch(() => {});
  }
}

async function applyOne(file) {
  const path = resolve(ROOT, file);
  const sql = readFileSync(path, 'utf8');
  console.log(`\n=== ${file} (${sql.length} bytes) ===`);

  const result = ACCESS_TOKEN
    ? await applyViaManagementAPI(sql)
    : await applyViaPg(sql);

  if (!result.ok) {
    console.error(`  FAILED (HTTP ${result.status})`);
    console.error(`  ${result.body.slice(0, 600)}`);
    return false;
  }
  console.log(`  OK`);
  return true;
}

console.log(`Project: ${projectRef}`);
console.log(`Auth path: ${ACCESS_TOKEN ? 'Management API' : 'Direct Postgres'}`);
console.log(`Files: ${files.length}`);

let failed = 0;
for (const f of files) {
  const ok = await applyOne(f);
  if (!ok) failed++;
}

if (failed > 0) {
  console.error(`\n${failed} migration(s) failed.`);
  process.exit(1);
}
console.log('\nAll migrations applied.');
