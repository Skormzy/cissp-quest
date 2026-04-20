#!/usr/bin/env tsx
/**
 * Seed all CISSP Quest questions into cat_questions via Supabase JS client.
 * Strips SQL comments, finds all INSERT tuples, inserts in batches.
 */

import { createClient } from '@supabase/supabase-js';
import { readFileSync } from 'fs';
import { join } from 'path';

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const SERVICE_KEY  = process.env.SUPABASE_SERVICE_ROLE_KEY!;

if (!SUPABASE_URL || !SERVICE_KEY) {
  console.error('Missing env vars'); process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SERVICE_KEY, {
  auth: { persistSession: false },
});

const SQL_DIR = join(process.cwd(), 'source-material', 'questions');

const FILES = [
  'domain1-questions.sql',
  'domain2-questions.sql',
  'domain3-questions.sql',
  'domain4-questions.sql',
  'domain5-questions.sql',
  'domain6-questions.sql',
  'domain7-questions.sql',
  'domain8-questions.sql',
  'final-boss-questions.sql',
  'tlatm-gauntlet-questions.sql',
];

const COLS = [
  'domain_id', 'topic_cluster', 'question_text', 'options', 'correct_index',
  'explanation', 'mnemonic_hint', 'cognitive_level', 'question_type',
  'difficulty_rating', 'irt_a', 'irt_b', 'irt_c', 'source', 'is_active',
] as const;

// Remove single-line SQL comments and normalize whitespace
function stripComments(sql: string): string {
  return sql
    .split('\n')
    .filter(line => !line.trim().startsWith('--'))
    .join('\n');
}

// Extract balanced parentheses groups from the VALUES block
function extractTuples(sql: string): string[] {
  const clean = stripComments(sql);

  // Find the VALUES keyword and take everything after it
  const valuesIdx = clean.search(/\bVALUES\b/i);
  if (valuesIdx === -1) return [];
  const afterValues = clean.slice(valuesIdx + 6); // skip 'VALUES'

  const tuples: string[] = [];
  let depth = 0;
  let start = -1;

  for (let i = 0; i < afterValues.length; i++) {
    const ch = afterValues[i];

    // Track string literals to avoid counting parens inside them
    if (ch === "'" && (i === 0 || afterValues[i - 1] !== '\\')) {
      // skip string: find matching close quote
      i++;
      while (i < afterValues.length) {
        if (afterValues[i] === "'" && afterValues[i - 1] !== '\\') {
          // check for '' escape
          if (afterValues[i + 1] === "'") { i += 2; continue; }
          break;
        }
        i++;
      }
      continue;
    }

    if (ch === '(' && depth === 0) {
      depth = 1;
      start = i;
    } else if (ch === '(' && depth > 0) {
      depth++;
    } else if (ch === ')') {
      depth--;
      if (depth === 0 && start !== -1) {
        tuples.push(afterValues.slice(start + 1, i));
        start = -1;
      }
    }
  }

  return tuples;
}

// Parse a single tuple string into column values
function parseTuple(tuple: string): Record<string, unknown> | null {
  // Split tuple into fields by commas, respecting strings and nested structures
  const fields: string[] = [];
  let current = '';
  let inStr    = false;
  let depth    = 0;

  for (let i = 0; i < tuple.length; i++) {
    const ch = tuple[i];

    if (!inStr && ch === "'") {
      inStr = true;
      current += ch;
      continue;
    }
    if (inStr && ch === "'") {
      // doubled-quote escape
      if (tuple[i + 1] === "'") { current += "''"; i++; continue; }
      inStr = false;
      current += ch;
      continue;
    }
    if (inStr) { current += ch; continue; }

    if (ch === '(') { depth++; current += ch; continue; }
    if (ch === ')') { depth--; current += ch; continue; }

    if (ch === ',' && depth === 0) {
      fields.push(current.trim());
      current = '';
      continue;
    }

    current += ch;
  }
  if (current.trim()) fields.push(current.trim());

  if (fields.length < COLS.length) return null;

  const row: Record<string, unknown> = {};

  COLS.forEach((col, idx) => {
    let val = fields[idx]?.trim() ?? '';

    // Remove ::jsonb, ::text casts
    val = val.replace(/::[\w]+/g, '').trim();

    // Strip surrounding single quotes
    const unquote = (s: string) => s.replace(/^'([\s\S]*)'$/, '$1').replace(/''/g, "'");

    if (col === 'options') {
      try { row[col] = JSON.parse(unquote(val)); } catch { row[col] = []; }
    } else if (col === 'domain_id' || col === 'correct_index') {
      row[col] = parseInt(val, 10);
    } else if (col === 'irt_a' || col === 'irt_b' || col === 'irt_c') {
      row[col] = parseFloat(val);
    } else if (col === 'is_active') {
      row[col] = val === 'true';
    } else {
      row[col] = unquote(val);
    }
  });

  return row.question_text ? row : null;
}

async function seed() {
  console.log('Starting question seed...\n');

  // Clear existing seeded questions
  await supabase.from('cat_questions').delete().eq('source', 'ai_generated');
  console.log('Cleared existing ai_generated questions.\n');

  let totalInserted = 0;
  let totalFailed   = 0;

  for (const file of FILES) {
    const path = join(SQL_DIR, file);
    let sql: string;
    try { sql = readFileSync(path, 'utf-8'); }
    catch { console.log(`  ${file}: NOT FOUND, skipping`); continue; }

    const tuples = extractTuples(sql);
    const rows   = tuples.map(parseTuple).filter((r): r is Record<string, unknown> => r !== null);

    console.log(`${file}: ${tuples.length} tuples → ${rows.length} valid rows`);

    if (rows.length === 0) continue;

    // Insert in batches of 20
    const BATCH = 20;
    let fileFailed = 0;
    for (let i = 0; i < rows.length; i += BATCH) {
      const batch = rows.slice(i, i + BATCH);
      const { error } = await supabase.from('cat_questions').insert(batch);
      if (error) {
        process.stdout.write(`  ✗ Batch ${Math.floor(i / BATCH) + 1}: ${error.message.slice(0, 80)}\n`);
        fileFailed += batch.length;
      } else {
        totalInserted += batch.length;
      }
    }

    if (fileFailed > 0) {
      totalFailed += fileFailed;
      console.log(`  ✗ ${fileFailed} rows failed`);
    }
    console.log(`  ✓ Inserted: ${rows.length - fileFailed}`);
  }

  console.log(`\n${'─'.repeat(50)}`);
  console.log(`Inserted: ${totalInserted} | Failed: ${totalFailed}`);

  const { count } = await supabase
    .from('cat_questions')
    .select('*', { count: 'exact', head: true });
  console.log(`Total in DB: ${count}`);

  // Print distribution
  const { data: domainCounts } = await supabase
    .from('cat_questions')
    .select('domain_id')
    .order('domain_id');

  if (domainCounts) {
    const counts: Record<number, number> = {};
    domainCounts.forEach(r => { counts[r.domain_id] = (counts[r.domain_id] || 0) + 1; });
    console.log('\nPer domain:');
    Object.entries(counts).forEach(([d, c]) => console.log(`  D${d}: ${c}`));
  }
}

seed().catch(console.error);
