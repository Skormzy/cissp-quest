/**
 * Catalog every FLUX-generated image already on disk and emit `art-manifest.json`.
 *
 * Walks:
 *   - public/images/story/         (the served copy)
 *   - generated-images/            (the raw output dir from Replicate)
 *
 * Cross-references with scripts/image-prompts-manifest.json (the source-of-truth
 * prompt manifest) and generated-images/generation-log.json (the run log).
 *
 * Output: art-manifest.json at project root.
 */

import * as fs from 'fs';
import * as path from 'path';

interface PromptManifestImage {
  key: string;
  type: string;
  character?: string;
  expression?: string;
  aspectRatio?: string;
  promptSuffix?: string;
  notes?: string;
  location?: string;
  act?: number;
  domain?: number;
}

interface PromptManifest {
  stylePrefix: string;
  negativePrompt: string;
  characters: Record<string, { cardPrompt: string }>;
  images: PromptManifestImage[];
}

interface GenLogEntry {
  status: string;
  url: string;
  localPath: string;
  timestamp: string;
  cost: number;
}

interface ManifestEntry {
  key: string;
  type: 'character' | 'background' | 'evidence' | 'diagram' | 'ui' | 'loading' | 'epilogue' | 'unknown';
  character?: string;
  expression?: string;
  act?: number;
  domain?: number;
  location?: string;
  publicUrl: string;        // url under /images/story/...
  servedPath: string;       // absolute path served by Next
  rawPath: string;          // absolute path in generated-images/
  bytes: number;
  remoteUrl?: string;       // replicate url from gen log
  generatedAt?: string;
  notes?: string;
}

interface ArtManifest {
  generatedAt: string;
  totals: {
    all: number;
    byType: Record<string, number>;
    byCharacter: Record<string, number>;
    byAct: Record<string, number>;
  };
  servedDir: string;
  rawDir: string;
  entries: ManifestEntry[];
}

const PROJECT_ROOT = path.resolve(__dirname, '..');
const SERVED_DIR = path.join(PROJECT_ROOT, 'public', 'images', 'story');
const RAW_DIR = path.join(PROJECT_ROOT, 'generated-images');
const PROMPT_MANIFEST_PATH = path.join(PROJECT_ROOT, 'scripts', 'image-prompts-manifest.json');
const GEN_LOG_PATH = path.join(RAW_DIR, 'generation-log.json');
const OUTPUT_PATH = path.join(PROJECT_ROOT, 'art-manifest.json');
const CLIENT_OUTPUT_PATH = path.join(PROJECT_ROOT, 'art-manifest.client.json');

function inferTypeFromKey(key: string): ManifestEntry['type'] {
  if (key.startsWith('npc_')) return 'character';
  if (key.startsWith('bg_')) return 'background';
  if (key.startsWith('evidence_')) return 'evidence';
  if (key.startsWith('diagram_')) return 'diagram';
  if (key.startsWith('ui_')) return 'ui';
  if (key.startsWith('loading_')) return 'loading';
  if (key.startsWith('epilogue_')) return 'epilogue';
  if (key.startsWith('landing_') || key.startsWith('tanaka_notebook')) return 'ui';
  return 'unknown';
}

function inferActFromBgKey(key: string): number | undefined {
  const m = key.match(/^bg_act(\d+)_/);
  return m ? parseInt(m[1], 10) : undefined;
}

function inferCharacterFromKey(key: string): { character?: string; expression?: string } {
  const m = key.match(/^npc_([a-z]+)_(.+)$/);
  if (!m) return {};
  return { character: m[1], expression: m[2] };
}

function fileBytes(p: string): number {
  try {
    return fs.statSync(p).size;
  } catch {
    return 0;
  }
}

function main() {
  const promptManifest: PromptManifest = JSON.parse(fs.readFileSync(PROMPT_MANIFEST_PATH, 'utf8'));
  const promptByKey = new Map(promptManifest.images.map((i) => [i.key, i]));

  let genLog: Record<string, GenLogEntry> = {};
  if (fs.existsSync(GEN_LOG_PATH)) {
    genLog = JSON.parse(fs.readFileSync(GEN_LOG_PATH, 'utf8'));
  }

  const servedFiles = fs.existsSync(SERVED_DIR)
    ? fs.readdirSync(SERVED_DIR).filter((f) => /\.(webp|png|jpg|jpeg)$/i.test(f))
    : [];
  const rawFiles = fs.existsSync(RAW_DIR)
    ? fs.readdirSync(RAW_DIR).filter((f) => /\.(webp|png|jpg|jpeg)$/i.test(f))
    : [];

  // Union of keys (filename without extension)
  const allKeys = new Set<string>();
  for (const f of servedFiles) allKeys.add(f.replace(/\.\w+$/, ''));
  for (const f of rawFiles) allKeys.add(f.replace(/\.\w+$/, ''));

  const entries: ManifestEntry[] = [];
  for (const key of Array.from(allKeys).sort()) {
    const promptEntry = promptByKey.get(key);
    const gen = genLog[key];
    const servedFile = servedFiles.find((f) => f.startsWith(key + '.'));
    const rawFile = rawFiles.find((f) => f.startsWith(key + '.'));
    const servedPath = servedFile ? path.join(SERVED_DIR, servedFile) : '';
    const rawPath = rawFile ? path.join(RAW_DIR, rawFile) : '';
    const ext = (servedFile || rawFile || '').split('.').pop() || 'webp';

    const type =
      (promptEntry?.type as ManifestEntry['type']) || inferTypeFromKey(key);
    const inferred = inferCharacterFromKey(key);
    const act = inferActFromBgKey(key);

    entries.push({
      key,
      type,
      character: promptEntry?.character || inferred.character,
      expression: promptEntry?.expression || inferred.expression,
      act,
      domain: promptEntry?.domain ?? act, // act-N maps loosely to domain-N for D1-D8
      location: promptEntry?.location,
      publicUrl: servedFile ? `/images/story/${servedFile}` : '',
      servedPath,
      rawPath,
      bytes: fileBytes(servedPath || rawPath),
      remoteUrl: gen?.url,
      generatedAt: gen?.timestamp,
      notes: promptEntry?.notes,
    });
  }

  // Tallies
  const byType: Record<string, number> = {};
  const byCharacter: Record<string, number> = {};
  const byAct: Record<string, number> = {};
  for (const e of entries) {
    byType[e.type] = (byType[e.type] ?? 0) + 1;
    if (e.character) byCharacter[e.character] = (byCharacter[e.character] ?? 0) + 1;
    if (e.act !== undefined) byAct[String(e.act)] = (byAct[String(e.act)] ?? 0) + 1;
  }

  const manifest: ArtManifest = {
    generatedAt: new Date().toISOString(),
    totals: { all: entries.length, byType, byCharacter, byAct },
    servedDir: SERVED_DIR,
    rawDir: RAW_DIR,
    entries,
  };

  fs.writeFileSync(OUTPUT_PATH, JSON.stringify(manifest, null, 2));

  // Slim client manifest: only fields needed by the browser bundle. Avoids
  // shipping local Windows paths, byte counts, raw paths, and remote URLs.
  const clientEntries = entries
    .filter((e) => e.publicUrl)
    .map((e) => ({
      key: e.key,
      type: e.type,
      character: e.character,
      expression: e.expression,
      act: e.act,
      domain: e.domain,
      publicUrl: e.publicUrl,
    }));
  const clientManifest = {
    generatedAt: manifest.generatedAt,
    totals: { all: clientEntries.length, byType, byCharacter, byAct },
    entries: clientEntries,
  };
  fs.writeFileSync(CLIENT_OUTPUT_PATH, JSON.stringify(clientManifest));
  console.log(`Wrote ${OUTPUT_PATH}`);
  console.log(`Wrote ${CLIENT_OUTPUT_PATH} (${clientEntries.length} entries, client-safe)`);
  console.log(`Total: ${entries.length} images`);
  console.log(`By type: ${JSON.stringify(byType)}`);
  console.log(`By character: ${JSON.stringify(byCharacter)}`);
  console.log(`By act: ${JSON.stringify(byAct)}`);
  const missingPublic = entries.filter((e) => !e.publicUrl).length;
  const missingRaw = entries.filter((e) => !e.rawPath).length;
  console.log(`Missing in public/: ${missingPublic} | Missing in generated-images/: ${missingRaw}`);
}

main();
