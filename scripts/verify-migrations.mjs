// Verifies the Phase 9 migrations actually landed.

import { readFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

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

const env = { ...loadEnv(), ...process.env };
const ref = env.NEXT_PUBLIC_SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\./i)[1];
const TOKEN = env.SUPABASE_ACCESS_TOKEN;

async function query(sql) {
  const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query: sql }),
  });
  return { ok: res.ok, body: await res.text() };
}

const checks = [
  ['xp_grant_log table', "SELECT to_regclass('public.xp_grant_log') AS exists;"],
  ['award_xp_idempotent function', "SELECT proname FROM pg_proc WHERE proname = 'award_xp_idempotent';"],
  ['library content rows', `SELECT topic_number, length(content_markdown) AS chars
                            FROM library_topics
                            WHERE topic_number IN ('1.1','1.2','2.5','3.1','3.2','4.3','5.1','5.2','5.4','8.1','8.2')
                            ORDER BY domain_id, topic_number;`],
];

for (const [label, sql] of checks) {
  const r = await query(sql);
  console.log(`\n[${label}]`);
  console.log(r.ok ? r.body : `FAILED: ${r.body}`);
}
