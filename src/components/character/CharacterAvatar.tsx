'use client';

// Cyberpunk anime portrait. Cel-shaded, cyan rim-light, larger eyes,
// rim/face highlight, neon outline. Designed to read as the same art
// direction as the FLUX-rendered NPC portraits used in scenes.
//
// Procedural: 13,824 unique combinations across skin/hair/eye/outfit.
// All variation lives in this single SVG. No external image atlas.

export interface CharacterConfig {
  gender: 'Man' | 'Woman' | 'Non-binary';
  skinTone: number;    // 1–8
  eyeShape: number;    // 1–4
  hairStyle: number;   // 1–12
  hairColor: string;   // hex
  outfit: number;      // 1–6
  eyeColor?: string;   // optional hex
}

export const EYE_COLORS = [
  { hex: '#1a1a2e', label: 'Onyx'      },
  { hex: '#3d2008', label: 'Hazel'     },
  { hex: '#4a2f1a', label: 'Brown'     },
  { hex: '#2e5d3a', label: 'Forest'    },
  { hex: '#1e4a6e', label: 'Ocean'     },
  { hex: '#6e4a8e', label: 'Violet'    },
  { hex: '#00e8ff', label: 'Cyber'     },
  { hex: '#ff6ec7', label: 'Neon Rose' },
] as const;

export const SKIN_TONES = [
  { id: 1, hex: '#FDDBB4', label: 'Fair'        },
  { id: 2, hex: '#F0C289', label: 'Light'       },
  { id: 3, hex: '#D4A47C', label: 'Warm'        },
  { id: 4, hex: '#C07A3E', label: 'Medium'      },
  { id: 5, hex: '#A0673A', label: 'Tan'         },
  { id: 6, hex: '#7A4928', label: 'Brown'       },
  { id: 7, hex: '#5C3120', label: 'Deep Brown'  },
  { id: 8, hex: '#3A1A0E', label: 'Ebony'       },
] as const;

export const HAIR_COLORS = [
  { hex: '#1a1008', label: 'Jet Black'  },
  { hex: '#2d1b00', label: 'Dark Brown' },
  { hex: '#6B3A2A', label: 'Chestnut'   },
  { hex: '#8b4513', label: 'Auburn'     },
  { hex: '#b5651d', label: 'Copper'     },
  { hex: '#daa520', label: 'Golden'     },
  { hex: '#e8d5b0', label: 'Platinum'   },
  { hex: '#c0c0c0', label: 'Silver'     },
  { hex: '#ff4500', label: 'Flame'      },
  { hex: '#ff69b4', label: 'Rose'       },
  { hex: '#4169e1', label: 'Sapphire'   },
  { hex: '#00e8ff', label: 'Cyan'       },
] as const;

export const OUTFITS = [
  { id: 1, primary: '#1e3a5f', secondary: '#2563eb', label: 'Navy'    },
  { id: 2, primary: '#1e3a1e', secondary: '#22c55e', label: 'Emerald' },
  { id: 3, primary: '#2a1e3a', secondary: '#8b5cf6', label: 'Violet'  },
  { id: 4, primary: '#3a1e1e', secondary: '#ef4444', label: 'Crimson' },
  { id: 5, primary: '#1e2d4a', secondary: '#00e8ff', label: 'Cyber'   },
  { id: 6, primary: '#2a2a1e', secondary: '#f59e0b', label: 'Gold'    },
] as const;

// ── Eye Shape Paths ───────────────────────────────────────────────────────
type EyeShapeData = {
  leftOuter: string;
  rightOuter: string;
  highlight: { lx: number; ly: number; rx: number; ry: number };
  irisRx: number;
  irisRy: number;
};

function getEyeShape(shape: number): EyeShapeData {
  // Anime-proportioned: noticeably larger than realistic eyes, with
  // iris filling most of the eye opening.
  switch (shape) {
    case 2: // Almond
      return {
        leftOuter:  'M22,27 Q28,22 33,27 Q28,32 22,27 Z',
        rightOuter: 'M37,27 Q42,22 48,27 Q42,32 37,27 Z',
        highlight:  { lx: 28, ly: 27, rx: 43, ry: 27 },
        irisRx: 2.6, irisRy: 3.0,
      };
    case 3: // Upturned
      return {
        leftOuter:  'M22,29 Q27,22 33,26 Q29,32 22,29 Z',
        rightOuter: 'M37,26 Q43,22 48,29 Q41,32 37,26 Z',
        highlight:  { lx: 28, ly: 26, rx: 43, ry: 26 },
        irisRx: 2.5, irisRy: 3.0,
      };
    case 4: // Monolid
      return {
        leftOuter:  'M22,28 Q28,24.5 33,28 Q31,32 25,32 Q22,30.5 22,28 Z',
        rightOuter: 'M37,28 Q42,24.5 48,28 Q45,32 39,32 Q37,30.5 37,28 Z',
        highlight:  { lx: 28, ly: 27.5, rx: 43, ry: 27.5 },
        irisRx: 2.4, irisRy: 2.7,
      };
    default: // 1 — Round (anime classic)
      return {
        leftOuter:  'M21,28 Q28,21 34,28 Q28,34 21,28 Z',
        rightOuter: 'M36,28 Q42,21 49,28 Q42,34 36,28 Z',
        highlight:  { lx: 28, ly: 27, rx: 42, ry: 27 },
        irisRx: 2.8, irisRy: 3.4,
      };
  }
}

// ── Hair Paths ─────────────────────────────────────────────────────────
// Anime-stylized with sharper silhouettes, a forelock fringe, and visible
// secondary tufts for cel-shaded layered look.
const HAIR_PATHS: Record<string, string[]> = {
  Man: [
    'M19,16 Q26,4 35,6 Q44,4 51,16 L49,21 Q40,12 30,12 Q22,12 19,21 Z',
    'M17,19 Q19,3 35,2 Q51,3 53,19 L51,23 Q43,11 28,11 Q19,11 17,23 Z',
    'M15,21 Q17,1 35,0 Q53,1 55,21 L53,25 Q45,9 26,9 Q17,9 15,25 Z',
    'M14,21 Q12,2 35,0 Q58,2 56,21 Q53,5 45,4 Q38,1 35,1 Q32,1 25,4 Q17,5 14,21 Z M18,16 Q20,9 25,7 M52,16 Q50,9 45,7',
    'M19,18 Q21,5 35,4 Q49,5 51,18 L49,15 Q43,9 35,9 Q27,9 21,15 Z',
    'M13,28 Q13,1 35,0 Q57,1 57,28 Q55,5 35,3 Q15,5 13,28 Z',
    'M19,18 Q23,8 35,7 Q47,8 51,18 Q44,12 35,12 Q26,12 19,18 Z',
    'M17,21 Q19,3 35,1 Q51,3 53,21 Q49,7 35,5 Q21,7 17,21 Z',
    'M13,25 Q12,0 35,0 Q58,0 57,25 Q55,7 49,5 Q43,3 35,3 Q27,3 21,5 Q15,7 13,25 Z',
    'M15,21 Q14,0 35,0 Q56,0 55,21 Q53,5 47,3 Q39,1 35,1 Q31,1 23,3 Q17,5 15,21 Z M20,21 L18,40 M25,19 L23,42 M30,17 L29,44 M35,16 L35,45 M40,17 L41,44 M45,19 L47,42 M50,21 L52,40',
    'M19,21 Q21,11 30,9 Q35,7 40,9 Q49,11 51,21 L51,17 Q47,9 40,7 Q35,5 30,7 Q23,9 19,17 Z',
    'M13,23 Q11,0 35,0 Q59,0 57,23 Q56,5 49,4 Q41,1 35,1 Q29,1 21,4 Q14,5 13,23 Z M15,19 Q17,13 19,11 M21,17 Q21,11 23,9 M55,19 Q53,13 51,11 M49,17 Q49,11 47,9',
  ],
  Woman: [
    'M13,21 Q15,2 35,1 Q55,2 57,21 L57,52 Q55,30 51,28 L51,23 Q43,11 28,11 Q19,11 19,23 L19,28 Q15,30 13,52 Z',
    'M11,24 Q11,0 35,0 Q59,0 59,24 Q57,36 55,50 Q53,28 49,24 Q43,9 28,9 Q17,9 21,24 Q17,28 15,50 Q13,36 11,24 Z',
    'M15,21 Q17,2 35,1 Q53,2 55,21 L53,30 Q45,11 26,11 Q17,11 15,30 Z',
    'M9,25 Q5,0 35,0 Q65,0 61,25 Q59,5 51,3 Q43,0 35,0 Q27,0 19,3 Q11,5 9,25 Z M11,19 Q13,11 17,9 M59,19 Q57,11 53,9',
    'M13,21 Q15,2 35,0 Q55,2 57,21 Q57,36 53,32 L51,23 Q43,9 28,9 Q17,9 19,23 L17,32 Q13,36 13,21 Z',
    'M14,23 Q17,1 35,0 Q53,1 56,23 L55,19 Q49,7 35,5 Q21,7 15,19 Z',
    'M13,23 Q13,0 35,0 Q57,0 57,23 Q57,46 55,57 Q53,32 51,25 Q43,9 28,9 Q17,9 19,25 Q17,32 15,57 Q13,46 13,23 Z',
    'M15,21 Q17,2 35,1 Q53,2 55,21 L53,25 Q45,11 26,11 Q17,11 15,25 Z M19,25 Q17,36 18,46 Q19,52 21,54 Q23,52 24,46 Q25,36 23,25 M47,25 Q49,36 48,46 Q47,52 45,54 Q43,52 42,46 Q41,36 43,25',
    'M11,23 Q9,0 35,0 Q61,0 59,23 Q58,7 51,4 Q43,1 35,1 Q27,1 19,4 Q12,7 11,23 Z M12,19 L11,40 M14,21 L13,42 M56,19 L57,40 M58,21 L59,42',
    'M17,23 Q19,9 35,7 Q51,9 53,23 L51,17 Q45,7 35,5 Q25,7 19,17 Z M28,7 Q35,1 42,7 Q42,13 35,11 Q28,13 28,7 Z',
    'M15,21 Q14,0 35,0 Q56,0 55,21 Q53,5 47,3 Q39,1 35,1 Q31,1 23,3 Q17,5 15,21 Z M13,23 L11,52 M17,21 L15,54 M21,19 L19,56 M25,18 L24,56 M35,17 L35,57 M44,18 L45,56 M48,19 L50,56 M52,21 L54,54 M56,23 L58,52',
    'M17,21 Q19,5 35,4 Q51,5 53,21 L51,17 Q43,9 28,9 Q19,9 17,17 Z M32,9 Q35,5 38,9 L40,30 Q35,32 30,30 Z',
  ],
  'Non-binary': [
    'M15,21 Q17,2 35,1 Q53,2 55,21 L53,30 Q45,11 26,11 Q17,11 17,30 Z',
    'M17,19 Q19,5 35,4 Q51,5 53,19 L51,23 Q43,13 28,13 Q19,13 17,23 Z',
    'M13,21 Q15,2 35,1 Q55,2 57,21 L55,40 Q51,21 49,19 Q43,9 28,9 Q17,9 21,19 Q19,21 15,28 Z',
    'M14,23 Q14,3 35,1 Q56,3 56,23 Q51,11 43,9 Q39,7 35,7 Q31,7 27,9 Q19,11 14,23 Z',
    'M15,21 Q17,2 35,1 Q53,2 55,21 L53,25 Q45,11 26,11 Q17,11 15,25 Z',
    'M11,25 Q9,0 35,0 Q61,0 59,25 Q57,5 47,3 Q39,1 35,1 Q31,1 23,3 Q13,5 11,25 Z',
    'M19,18 Q21,5 35,4 Q49,5 51,18 L49,15 Q43,9 35,9 Q27,9 21,15 Z',
    'M13,21 Q15,2 35,0 Q55,2 57,21 Q57,40 53,32 L51,23 Q43,9 28,9 Q17,9 19,23 L17,32 Q13,40 13,21 Z',
    'M13,23 Q11,0 35,0 Q59,0 57,23 Q56,5 49,3 Q41,1 35,1 Q29,1 21,3 Q14,5 13,23 Z',
    'M17,21 Q19,5 35,4 Q51,5 53,21 L51,17 Q43,9 28,9 Q19,9 17,17 Z M28,7 Q30,1 35,0 Q40,1 42,7 Q40,13 35,11 Q30,13 28,7 Z',
    'M21,21 Q23,13 35,11 Q47,13 49,21 Q45,15 35,13 Q25,15 21,21 Z M30,13 Q32,3 35,1 Q38,3 40,13 Q38,7 35,5 Q32,7 30,13 Z',
    'M15,21 Q17,2 35,1 Q53,2 55,21 L55,36 Q51,23 49,21 Q43,9 28,9 Q17,9 21,21 Q19,23 15,36 Z M28,9 Q30,3 35,1 Q40,3 42,9 Q40,7 35,5 Q30,7 28,9 Z',
  ],
};

// ── Helpers ────────────────────────────────────────────────────────────
function darken(hex: string, percent: number): string {
  const m = hex.replace('#', '').match(/.{2}/g);
  if (!m) return hex;
  const [r, g, b] = m.map((s) => parseInt(s, 16));
  const f = 1 - percent;
  const out = [r, g, b].map((c) => Math.max(0, Math.min(255, Math.round(c * f))));
  return `#${out.map((c) => c.toString(16).padStart(2, '0')).join('')}`;
}

interface Props {
  config: CharacterConfig;
  size?: number;
  className?: string;
  animated?: boolean;
}

export default function CharacterAvatar({ config, size = 120, className = '', animated = false }: Props) {
  const skin = SKIN_TONES.find((s) => s.id === config.skinTone) ?? SKIN_TONES[0];
  const skinColor = skin.hex;

  const genderKey = config.gender in HAIR_PATHS ? config.gender : 'Man';
  const hairStyles = HAIR_PATHS[genderKey];
  const hairPath = hairStyles[(config.hairStyle - 1) % hairStyles.length] ?? hairStyles[0];

  const outfit = OUTFITS.find((o) => o.id === config.outfit) ?? OUTFITS[0];
  const eyes = getEyeShape(config.eyeShape);

  // Cel-shaded derived colors
  const skinShadow = darken(skinColor, 0.18);
  const skinHighlight = darken(skinColor, -0.08); // brighten
  const hairShadow = darken(config.hairColor, 0.25);
  const hairHighlight = darken(config.hairColor, -0.18);
  const lipColor = config.skinTone >= 6 ? '#c4847a' : '#d4756b';
  const irisColor = config.eyeColor ?? (config.skinTone >= 7 ? '#3d2008' : '#1a1a2e');
  const irisHighlight = darken(irisColor, -0.35);

  // Stable per-config gradient ids so we can have multiple avatars on screen.
  const seed = `${config.gender}-${config.skinTone}-${config.eyeShape}-${config.hairStyle}-${config.outfit}`;
  const idSkin = `cs-skin-${seed}`;
  const idHair = `cs-hair-${seed}`;
  const idIris = `cs-iris-${seed}`;
  const idRim = `cs-rim-${seed}`;

  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 70 84"
      className={className}
      style={animated ? { filter: 'drop-shadow(0 0 14px rgba(0,232,255,0.45))' } : undefined}
    >
      <defs>
        {/* Cel-shaded skin gradient */}
        <linearGradient id={idSkin} x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor={skinHighlight} />
          <stop offset="55%" stopColor={skinColor} />
          <stop offset="100%" stopColor={skinShadow} />
        </linearGradient>
        {/* Cel-shaded hair gradient */}
        <linearGradient id={idHair} x1="0" y1="0" x2="0.4" y2="1">
          <stop offset="0%" stopColor={hairHighlight} />
          <stop offset="65%" stopColor={config.hairColor} />
          <stop offset="100%" stopColor={hairShadow} />
        </linearGradient>
        {/* Iris radial */}
        <radialGradient id={idIris} cx="0.4" cy="0.35" r="0.7">
          <stop offset="0%" stopColor={irisHighlight} />
          <stop offset="55%" stopColor={irisColor} />
          <stop offset="100%" stopColor={darken(irisColor, 0.3)} />
        </radialGradient>
        {/* Cyan rim light */}
        <linearGradient id={idRim} x1="1" y1="0" x2="0" y2="0">
          <stop offset="0%" stopColor="#00e8ff" stopOpacity="0.45" />
          <stop offset="60%" stopColor="#00e8ff" stopOpacity="0" />
        </linearGradient>
      </defs>

      {/* ── Body / Outfit ── */}
      <path
        d="M16,55 Q19,47 26,45 L35,43 L44,45 Q51,47 54,55 L56,78 Q56,82 52,82 L18,82 Q14,82 14,78 Z"
        fill={outfit.primary}
      />
      {/* Outfit lapel highlight */}
      <path d="M27,46 L35,52 L43,46" fill="none" stroke={outfit.secondary} strokeWidth="1.4" strokeLinejoin="round" />
      {/* Cyan tech accent stripe */}
      <path d="M35,52 L35,80" stroke={outfit.secondary} strokeWidth="0.6" opacity="0.7" />
      <circle cx="35" cy="58" r="1.2" fill={outfit.secondary} opacity="0.85" />
      {/* Outfit shoulder shadow */}
      <path d="M16,55 Q19,47 26,45 L26,52 Q20,54 18,60 Z" fill={darken(outfit.primary, 0.25)} opacity="0.7" />

      {/* ── Neck ── */}
      <rect x="31" y="40" width="8" height="7" rx="2" fill={`url(#${idSkin})`} />
      <path d="M31,44 Q35,46 39,44" fill="none" stroke={skinShadow} strokeWidth="0.9" />

      {/* ── Head (anime-proportioned, slightly larger than realistic) ── */}
      <ellipse cx="35" cy="27" rx="17" ry="19" fill={`url(#${idSkin})`} />
      {/* Cheek shading */}
      <ellipse cx="26" cy="33" rx="3.5" ry="2.5" fill={skinShadow} opacity="0.35" />
      <ellipse cx="44" cy="33" rx="3.5" ry="2.5" fill={skinShadow} opacity="0.35" />
      {/* Forehead highlight (cel-shading) */}
      <ellipse cx="38" cy="20" rx="6" ry="4" fill={skinHighlight} opacity="0.55" />

      {/* ── Hair (over head) ── */}
      <path d={hairPath} fill={`url(#${idHair})`} />
      {/* Hair specular streak */}
      <path d="M22,12 Q28,8 34,8" fill="none" stroke={hairHighlight} strokeWidth="1.2" opacity="0.65" strokeLinecap="round" />

      {/* ── Ears ── */}
      <ellipse cx="18" cy="29" rx="2.8" ry="3.8" fill={`url(#${idSkin})`} />
      <ellipse cx="52" cy="29" rx="2.8" ry="3.8" fill={`url(#${idSkin})`} />
      <path d="M18,28 Q19,30 18,32" fill="none" stroke={skinShadow} strokeWidth="0.6" />
      <path d="M52,28 Q51,30 52,32" fill="none" stroke={skinShadow} strokeWidth="0.6" />

      {/* ── Eyes (anime-proportioned, large) ── */}
      <path d={eyes.leftOuter}  fill="white" stroke={skinShadow} strokeWidth="0.5" />
      <path d={eyes.rightOuter} fill="white" stroke={skinShadow} strokeWidth="0.5" />
      {/* Iris with radial gradient */}
      <ellipse cx={eyes.highlight.lx} cy={eyes.highlight.ly} rx={eyes.irisRx} ry={eyes.irisRy} fill={`url(#${idIris})`} />
      <ellipse cx={eyes.highlight.rx} cy={eyes.highlight.ry} rx={eyes.irisRx} ry={eyes.irisRy} fill={`url(#${idIris})`} />
      {/* Pupils */}
      <ellipse cx={eyes.highlight.lx} cy={eyes.highlight.ly + 0.4} rx="1.0" ry="1.5" fill="#0a0a14" />
      <ellipse cx={eyes.highlight.rx} cy={eyes.highlight.ry + 0.4} rx="1.0" ry="1.5" fill="#0a0a14" />
      {/* Eye highlights — anime sparkle */}
      <circle cx={eyes.highlight.lx + 1.1} cy={eyes.highlight.ly - 1.1} r="0.95" fill="white" />
      <circle cx={eyes.highlight.rx + 1.1} cy={eyes.highlight.ry - 1.1} r="0.95" fill="white" />
      <circle cx={eyes.highlight.lx - 1.0} cy={eyes.highlight.ly + 1.4} r="0.45" fill="white" opacity="0.7" />
      <circle cx={eyes.highlight.rx - 1.0} cy={eyes.highlight.ry + 1.4} r="0.45" fill="white" opacity="0.7" />

      {/* ── Eyebrows ── */}
      <path
        d={`M${eyes.highlight.lx - 5},${eyes.highlight.ly - 5} Q${eyes.highlight.lx - 1},${eyes.highlight.ly - 6.5} ${eyes.highlight.lx + 3},${eyes.highlight.ly - 5}`}
        fill="none" stroke={config.hairColor} strokeWidth="1.6" strokeLinecap="round"
      />
      <path
        d={`M${eyes.highlight.rx - 3},${eyes.highlight.ly - 5} Q${eyes.highlight.rx + 1},${eyes.highlight.ly - 6.5} ${eyes.highlight.rx + 5},${eyes.highlight.ly - 5}`}
        fill="none" stroke={config.hairColor} strokeWidth="1.6" strokeLinecap="round"
      />

      {/* ── Nose (anime-minimal) ── */}
      <path d="M34,32.5 Q35,34.5 36,32.5" fill="none" stroke={skinShadow} strokeWidth="0.9" strokeLinecap="round" />

      {/* ── Mouth (small, slight smile) ── */}
      <path d="M31,38 Q35,40.5 39,38" fill="none" stroke={lipColor} strokeWidth="1.2" strokeLinecap="round" />

      {/* ── Cyan rim light overlay (right side) ── */}
      <ellipse cx="50" cy="27" rx="6" ry="14" fill={`url(#${idRim})`} opacity="0.85" />

      {/* ── Subtle blush on warm tones ── */}
      {config.skinTone <= 5 && (
        <>
          <ellipse cx="24" cy="33" rx="3.5" ry="1.8" fill="#ff8a8a" opacity="0.18" />
          <ellipse cx="46" cy="33" rx="3.5" ry="1.8" fill="#ff8a8a" opacity="0.18" />
        </>
      )}
    </svg>
  );
}
