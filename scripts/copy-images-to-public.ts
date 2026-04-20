/**
 * Copy generated images from generated-images/ to public/images/story/
 * Run after generate-images.ts completes:
 *   npx tsx scripts/copy-images-to-public.ts
 */

import * as fs from 'fs';
import * as path from 'path';

const SRC_DIR = path.join(__dirname, '..', 'generated-images');
const DEST_DIR = path.join(__dirname, '..', 'public', 'images', 'story');

if (!fs.existsSync(SRC_DIR)) {
  console.error('generated-images/ not found. Run generate-images.ts first.');
  process.exit(1);
}

fs.mkdirSync(DEST_DIR, { recursive: true });

const files = fs.readdirSync(SRC_DIR).filter((f) => f.endsWith('.webp'));

let copied = 0;
let skipped = 0;

for (const file of files) {
  const src = path.join(SRC_DIR, file);
  const dest = path.join(DEST_DIR, file);
  fs.copyFileSync(src, dest);
  console.log(`  ✓ ${file}`);
  copied++;
}

console.log(`\nDone: ${copied} copied, ${skipped} skipped → public/images/story/`);
