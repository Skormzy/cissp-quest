// One-shot patcher for the adversarial-review CRITICAL/HIGH findings
// that live in the questions table.
//
// Targets:
//   C3 - Biba mnemonic that contradicts the answer
//   C4 - ALE formula stated wrong
//   H1 - Joke distractors that violate the user's quality bar (sample-flagged
//        examples + heuristic search across the full corpus)

import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..');

function loadEnv() {
  const out = {};
  for (const line of readFileSync(resolve(ROOT, '.env.local'), 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
    if (m) out[m[1]] = m[2].replace(/^['"]|['"]$/g, '').trim();
  }
  return out;
}

const env = { ...loadEnv(), ...process.env };
const ref = env.NEXT_PUBLIC_SUPABASE_URL.match(/https:\/\/([a-z0-9]+)\./)[1];
const TOKEN = env.SUPABASE_ACCESS_TOKEN;

async function exec(sql) {
  const res = await fetch(`https://api.supabase.com/v1/projects/${ref}/database/query`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query: sql }),
  });
  return { ok: res.ok, status: res.status, body: await res.text() };
}

console.log('=== C3: Repair Biba mnemonics that wrongly state BLP rules ===');
const c3 = await exec(`
  UPDATE public.questions
  SET mnemonic_hint = 'BLP: no read up, no write down (confidentiality). Biba flips it: no read down, no write up (integrity). "Don''t drink from a dirty cup, don''t pour clean water into a dirty one."'
  WHERE mnemonic_hint ILIKE '%Biba flips BLP. Read up, write down%'
     OR (mnemonic_hint ILIKE '%Read up, write down%' AND question_text ILIKE '%Biba%');
`);
console.log('  ' + (c3.ok ? 'OK' : 'FAIL: ' + c3.body));

console.log('\n=== C4: Repair ALE formula explanations that show cost subtracted without parens on risk reduction ===');
const c4 = await exec(`
  UPDATE public.questions
  SET explanation = explanation ||
    E'\\n\\nFormula: Risk reduction = ALE_before − ALE_after. Net benefit = Risk reduction − Annual cost of safeguard. Use this exact structure on the exam.'
  WHERE explanation ILIKE '%ALE_before − ALE_after − cost%'
     OR explanation ILIKE '%ALE before - ALE after - cost%';
`);
console.log('  ' + (c4.ok ? 'OK' : 'FAIL: ' + c4.body));

console.log('\n=== H1: Identify and replace joke distractors ===');
const jokePatterns = [
  '%dinner time%',
  '%magic eight-ball%',
  '%magic 8-ball%',
  '%color of the%walls%',
  '%wall color%',
  '%every two years%',
  '%pizza%',
];

// Find offending questions
let conds = jokePatterns.map((p) => `options::text ILIKE '${p.replace(/'/g, "''")}'`).join(' OR ');
const findRes = await exec(`SELECT id, question_text, options FROM public.questions WHERE ${conds};`);
let suspects = [];
try { suspects = JSON.parse(findRes.body); } catch { suspects = []; }
console.log(`  Found ${suspects.length} questions with joke-distractor patterns`);

if (Array.isArray(suspects) && suspects.length > 0) {
  // Bulk-flag them as needing review by setting bloom_level to 'needs-review'.
  // We do NOT auto-rewrite — distractor replacement requires care to keep
  // 4 plausible options. Flagging is the safe move.
  const ids = suspects.map((s) => `'${s.id}'`).join(',');
  const flag = await exec(`
    UPDATE public.questions
    SET bloom_level = 'needs-review'
    WHERE id IN (${ids});
  `);
  console.log('  Flagged ' + suspects.length + ' questions with bloom_level=needs-review: ' + (flag.ok ? 'OK' : 'FAIL: ' + flag.body));
}

console.log('\n=== Done ===');
