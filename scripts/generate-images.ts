/**
 * CISSP Quest Image Generation Pipeline
 * Uses Replicate API (FLUX model) to generate all scene images
 *
 * Usage:
 *   npx tsx scripts/generate-images.ts              # Generate all
 *   npx tsx scripts/generate-images.ts --type character  # Filter by type
 *   npx tsx scripts/generate-images.ts --key npc_tanaka_neutral  # Single image
 *   npx tsx scripts/generate-images.ts --dry-run    # Preview without generating
 */

import Replicate from 'replicate'
import * as fs from 'fs'
import * as path from 'path'
import * as https from 'https'
import * as http from 'http'

interface ImageSpec {
  key: string
  type: 'character' | 'background' | 'evidence' | 'diagram' | 'ui'
  character?: string
  expression?: string
  aspectRatio: string
  promptSuffix: string
  notes: string
}

interface Manifest {
  stylePrefix: string
  negativePrompt: string
  characters: Record<string, { cardPrompt: string }>
  images: ImageSpec[]
}

const manifest: Manifest = JSON.parse(
  fs.readFileSync(path.join(__dirname, 'image-prompts-manifest.json'), 'utf-8')
)

const OUTPUT_DIR = path.join(__dirname, '..', 'generated-images')
const LOG_FILE = path.join(OUTPUT_DIR, 'generation-log.json')

const FLUX_MODEL = 'black-forest-labs/flux-1.1-pro'

const ASPECT_RATIO_MAP: Record<string, { width: number; height: number }> = {
  '16:9': { width: 1344, height: 768 },
  '2:3': { width: 832, height: 1216 },
  '3:4': { width: 896, height: 1152 },
  '1:1': { width: 1024, height: 1024 },
  '3:2': { width: 1216, height: 832 },
}

function buildPrompt(spec: ImageSpec): string {
  const parts: string[] = [manifest.stylePrefix]

  if (spec.type === 'character' && spec.character) {
    const charCard = manifest.characters[spec.character]?.cardPrompt
    if (charCard) parts.push(charCard)
  }

  parts.push(spec.promptSuffix)

  return parts.join(', ')
}

async function downloadImage(url: string, dest: string): Promise<void> {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(dest)
    const protocol = url.startsWith('https') ? https : http

    protocol.get(url, (response) => {
      if (response.statusCode === 301 || response.statusCode === 302) {
        downloadImage(response.headers.location!, dest).then(resolve).catch(reject)
        return
      }
      response.pipe(file)
      file.on('finish', () => { file.close(); resolve() })
    }).on('error', (err) => {
      fs.unlink(dest, () => {})
      reject(err)
    })
  })
}

function sleep(ms: number) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

function extractUrl(val: unknown): string {
  if (typeof val === 'string') return val
  if (val && typeof (val as Record<string, unknown>).url === 'function') {
    const u = (val as Record<string, unknown>).url as () => unknown
    const result = u()
    if (typeof result === 'string') return result
    if (result && typeof (result as { href: string }).href === 'string') {
      return (result as { href: string }).href
    }
  }
  if (val && typeof (val as { href: string }).href === 'string') {
    return (val as { href: string }).href
  }
  const str = String(val)
  if (str.startsWith('http')) return str
  throw new Error(`Cannot extract URL from: ${str.substring(0, 100)}`)
}

async function generateImage(
  replicate: Replicate,
  spec: ImageSpec,
  dryRun: boolean
): Promise<{ key: string; url?: string; localPath?: string; error?: string; cost?: number }> {
  const prompt = buildPrompt(spec)
  const dimensions = ASPECT_RATIO_MAP[spec.aspectRatio] ?? { width: 1024, height: 1024 }

  console.log(`\n[${spec.key}] Generating...`)
  console.log(`  Type: ${spec.type} | Aspect: ${spec.aspectRatio}`)
  console.log(`  Prompt (preview): ${prompt.substring(0, 100)}...`)

  if (dryRun) {
    console.log('  [DRY RUN] Skipping API call')
    return { key: spec.key }
  }

  const MAX_RETRIES = 5
  for (let attempt = 1; attempt <= MAX_RETRIES; attempt++) {
    try {
      const output = await replicate.run(FLUX_MODEL as `${string}/${string}`, {
        input: {
          prompt,
          negative_prompt: manifest.negativePrompt,
          width: dimensions.width,
          height: dimensions.height,
          num_inference_steps: 28,
          guidance_scale: 3.5,
          output_format: 'webp',
          output_quality: 90,
          disable_safety_checker: false,
        },
      }) as unknown

      const raw = Array.isArray(output) ? output[0] : output
      const imageUrl = extractUrl(raw)

      const localPath = path.join(OUTPUT_DIR, `${spec.key}.webp`)
      await downloadImage(imageUrl, localPath)

      console.log(`  ✓ Saved to ${localPath}`)
      return { key: spec.key, url: imageUrl, localPath, cost: 0.04 }
    } catch (error) {
      const errMsg = error instanceof Error ? error.message : String(error)
      const is429 = errMsg.includes('429') || errMsg.includes('throttled')
      // Extract retry_after from error message if present
      const retryMatch = errMsg.match(/resets in ~(\d+)s/)
      const retryAfter = retryMatch ? parseInt(retryMatch[1]) + 2 : 15

      if (is429 && attempt < MAX_RETRIES) {
        const waitSec = Math.max(retryAfter, attempt * 15)
        console.log(`  ⏳ Rate limited (attempt ${attempt}/${MAX_RETRIES}), waiting ${waitSec}s...`)
        await sleep(waitSec * 1000)
        continue
      }

      console.error(`  ✗ Error: ${errMsg}`)
      return { key: spec.key, error: errMsg }
    }
  }

  return { key: spec.key, error: 'Max retries exceeded' }
}

async function main() {
  const args = process.argv.slice(2)
  const dryRun = args.includes('--dry-run')
  const typeFilter = args.find(a => a.startsWith('--type='))?.split('=')[1]
  const keyFilter = args.find(a => a.startsWith('--key='))?.split('=')[1]
  const skipExisting = !args.includes('--overwrite')

  if (!process.env.REPLICATE_API_TOKEN && !dryRun) {
    console.error('ERROR: REPLICATE_API_TOKEN not set in environment')
    console.error('Add it to .env.local: REPLICATE_API_TOKEN=r8_your_token_here')
    console.error('Then run: npx dotenv -e .env.local -- npx tsx scripts/generate-images.ts')
    process.exit(1)
  }

  const replicate = new Replicate({ auth: process.env.REPLICATE_API_TOKEN! })

  fs.mkdirSync(OUTPUT_DIR, { recursive: true })

  let images = manifest.images
  if (typeFilter) images = images.filter(i => i.type === typeFilter)
  if (keyFilter) images = images.filter(i => i.key === keyFilter)

  if (skipExisting) {
    images = images.filter(i => {
      const p = path.join(OUTPUT_DIR, `${i.key}.webp`)
      return !fs.existsSync(p) || fs.statSync(p).size < 1000  // skip only real files
    })
    console.log(`Skipping ${manifest.images.length - images.length} already-generated images`)
  }

  console.log(`\n=== CISSP Quest Image Generation ===`)
  console.log(`Mode: ${dryRun ? 'DRY RUN' : 'LIVE'}`)
  console.log(`Images to generate: ${images.length}`)
  console.log(`Estimated cost: $${(images.length * 0.04).toFixed(2)}`)
  console.log('=====================================\n')

  const log: Record<string, unknown> = fs.existsSync(LOG_FILE)
    ? JSON.parse(fs.readFileSync(LOG_FILE, 'utf-8'))
    : {}

  let totalCost = 0
  let successCount = 0
  let errorCount = 0

  for (const spec of images) {
    const result = await generateImage(replicate, spec, dryRun)

    if (result.error) {
      errorCount++
      log[spec.key] = { status: 'error', error: result.error, timestamp: new Date().toISOString() }
    } else {
      successCount++
      totalCost += result.cost ?? 0
      log[spec.key] = {
        status: 'success',
        url: result.url,
        localPath: result.localPath,
        timestamp: new Date().toISOString(),
        cost: result.cost,
      }
    }

    fs.writeFileSync(LOG_FILE, JSON.stringify(log, null, 2))

    // Rate limiting: throttled to 6/min on accounts with <$5 credit; 12s = ~5/min
    if (!dryRun) await sleep(12000)
  }

  console.log('\n=== GENERATION COMPLETE ===')
  console.log(`✓ Success: ${successCount}`)
  console.log(`✗ Errors: ${errorCount}`)
  console.log(`💰 Total cost: $${totalCost.toFixed(2)}`)
  console.log(`📁 Output: ${OUTPUT_DIR}`)
  console.log(`📋 Log: ${LOG_FILE}`)

  if (errorCount > 0) {
    console.log('\nFailed images:')
    Object.entries(log)
      .filter(([, v]) => (v as {status: string}).status === 'error')
      .forEach(([k, v]) => console.log(`  ${k}: ${(v as {error: string}).error}`))
  }
}

main().catch(console.error)
