import Replicate from 'replicate'

if (!process.env.REPLICATE_API_TOKEN) {
  throw new Error('REPLICATE_API_TOKEN is not set')
}

export const replicate = new Replicate({
  auth: process.env.REPLICATE_API_TOKEN,
})

export const FLUX_MODEL = 'black-forest-labs/flux-1.1-pro' as const

export const STYLE_PREFIX =
  'anime-inspired cyberpunk visual novel illustration, high detail, dramatic studio lighting, professional digital art, rich dark tones, clean linework, subtle glow effects, no watermarks, no text'

export const NEGATIVE_PROMPT =
  'blurry, low quality, distorted, watermark, text, signature, anime chibi, cartoonish, nsfw, western comic style, realistic photography'

export type ImageType = 'character' | 'background' | 'evidence' | 'diagram' | 'ui'

interface GenerateOptions {
  prompt: string
  width?: number
  height?: number
  steps?: number
  guidance?: number
}

export async function generateImage(options: GenerateOptions): Promise<string> {
  const output = await replicate.run(FLUX_MODEL, {
    input: {
      prompt: `${STYLE_PREFIX}, ${options.prompt}`,
      negative_prompt: NEGATIVE_PROMPT,
      width: options.width ?? 1344,
      height: options.height ?? 768,
      num_inference_steps: options.steps ?? 28,
      guidance_scale: options.guidance ?? 3.5,
      output_format: 'webp',
      output_quality: 90,
    },
  }) as unknown

  const url = Array.isArray(output) ? (output[0] as string) : (output as string)
  if (!url) throw new Error('No image URL returned from Replicate')
  return url
}
