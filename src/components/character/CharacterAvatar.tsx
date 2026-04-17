'use client';

export interface CharacterConfig {
  gender: 'Man' | 'Woman' | 'Non-binary';
  skinTone: number;    // 1–8
  eyeShape: number;    // 1–4
  hairStyle: number;   // 1–12
  hairColor: string;   // hex
  outfit: number;      // 1–6
}

// ── Skin Tones ─────────────────────────────────────────────────────────
// 8 tones covering the full human spectrum, explicitly diverse
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

// ── Hair Colors ────────────────────────────────────────────────────────
export const HAIR_COLORS = [
  { hex: '#1a1008', label: 'Jet Black'    },
  { hex: '#2d1b00', label: 'Dark Brown'   },
  { hex: '#6B3A2A', label: 'Chestnut'     },
  { hex: '#8b4513', label: 'Auburn'       },
  { hex: '#b5651d', label: 'Copper'       },
  { hex: '#daa520', label: 'Golden'       },
  { hex: '#e8d5b0', label: 'Platinum'     },
  { hex: '#c0c0c0', label: 'Silver'       },
  { hex: '#ff4500', label: 'Flame'        },
  { hex: '#ff69b4', label: 'Rose'         },
  { hex: '#4169e1', label: 'Sapphire'     },
  { hex: '#00e8ff', label: 'Cyan'         },
] as const;

// ── Eye Shape Paths (relative to eye center) ───────────────────────────
// Returns [leftEyePath, rightEyePath, leftIrisCx, leftIrisCy, rightIrisCx, rightIrisCy]
type EyeShapeData = {
  leftOuter: string;
  rightOuter: string;
  highlight: { lx: number; ly: number; rx: number; ry: number };
};

function getEyeShape(shape: number): EyeShapeData {
  switch (shape) {
    case 2: // Almond — wide, tapered at corners (common in many Asian ethnicities)
      return {
        leftOuter:  'M24,27 Q28,24 32,27 Q28,30 24,27 Z',
        rightOuter: 'M38,27 Q42,24 46,27 Q42,30 38,27 Z',
        highlight:  { lx: 28.5, ly: 26.5, rx: 42.5, ry: 26.5 },
      };
    case 3: // Upturned — outer corners lift (common in many East Asian, South Asian)
      return {
        leftOuter:  'M23,28 Q27,23 32,26 Q28,30 23,28 Z',
        rightOuter: 'M38,26 Q43,23 47,28 Q42,30 38,26 Z',
        highlight:  { lx: 28, ly: 25, rx: 43, ry: 25 },
      };
    case 4: // Hooded / Monolid — flatter lid, no visible crease
      return {
        leftOuter:  'M24,28 Q28,25.5 32,28 Q30,30.5 26,30.5 Q24,29.5 24,28 Z',
        rightOuter: 'M38,28 Q42,25.5 46,28 Q44,30.5 40,30.5 Q38,29.5 38,28 Z',
        highlight:  { lx: 28.5, ly: 27, rx: 42.5, ry: 27 },
      };
    default: // 1 — Round (universally neutral)
      return {
        leftOuter:  'M23,28 Q28,23 33,28 Q28,33 23,28 Z',
        rightOuter: 'M37,28 Q42,23 47,28 Q42,33 37,28 Z',
        highlight:  { lx: 29, ly: 26.5, rx: 43, ry: 26.5 },
      };
  }
}

// ── Hair Paths by Gender ────────────────────────────────────────────────
// 12 styles per gender, including natural textures
const HAIR_PATHS: Record<string, string[]> = {
  Man: [
    // 1: Short crop — clean and simple
    'M20,18 Q25,8 35,10 Q45,8 50,18 L48,22 Q40,16 30,16 Q22,16 20,22 Z',
    // 2: Slicked back — formal
    'M18,20 Q20,6 35,5 Q50,6 52,20 L50,24 Q42,14 28,14 Q20,14 18,24 Z',
    // 3: Long top / textured
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z',
    // 4: Tight coils / afro-textured short
    'M15,22 Q14,4 35,2 Q56,4 55,22 Q52,8 45,7 Q38,4 35,4 Q32,4 25,7 Q18,8 15,22 Z M18,18 Q20,12 25,10 M52,18 Q50,12 45,10',
    // 5: Neat side part
    'M20,20 Q22,8 35,7 Q48,8 50,20 L48,18 Q42,12 35,12 Q28,12 22,18 Z',
    // 6: Long / flowing
    'M14,28 Q14,4 35,2 Q56,4 56,28 Q54,8 35,6 Q16,8 14,28 Z',
    // 7: Buzz cut
    'M20,20 Q24,10 35,9 Q46,10 50,20 Q44,14 35,14 Q26,14 20,20 Z',
    // 8: Pompadour
    'M18,22 Q20,6 35,4 Q50,6 52,22 Q48,10 35,8 Q22,10 18,22 Z',
    // 9: Waves / medium length
    'M14,25 Q13,3 35,1 Q57,3 56,25 Q54,10 48,8 Q42,6 35,6 Q28,6 22,8 Q16,10 14,25 Z',
    // 10: Locs / dreadlocks (shoulder-length representation)
    'M16,22 Q15,3 35,1 Q55,3 54,22 Q52,8 46,6 Q38,4 35,4 Q32,4 24,6 Q18,8 16,22 Z M20,22 L18,38 M25,20 L23,40 M30,18 L29,42 M35,17 L35,43 M40,18 L41,42 M45,20 L47,40 M50,22 L52,38',
    // 11: Undercut
    'M20,22 Q22,12 30,10 Q35,8 40,10 Q48,12 50,22 L50,18 Q46,10 40,8 Q35,6 30,8 Q24,10 20,18 Z',
    // 12: Curly / natural medium
    'M14,24 Q12,2 35,0 Q58,2 56,24 Q55,6 48,5 Q40,2 35,2 Q30,2 22,5 Q15,6 14,24 Z M16,20 Q18,14 20,12 M22,18 Q22,12 24,10 M54,20 Q52,14 50,12 M48,18 Q48,12 46,10',
  ],
  Woman: [
    // 1: Long straight
    'M14,22 Q16,4 35,3 Q54,4 56,22 L56,50 Q54,30 50,28 L50,24 Q42,12 28,12 Q20,12 20,24 L20,28 Q16,30 14,50 Z',
    // 2: Long wavy
    'M12,25 Q12,2 35,0 Q58,2 58,25 Q56,35 54,48 Q52,28 48,24 Q42,10 28,10 Q18,10 22,24 Q18,28 16,48 Q14,35 12,25 Z',
    // 3: Bob
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,30 Q44,12 26,12 Q18,12 16,30 Z',
    // 4: Afro / natural coily (voluminous)
    'M10,25 Q6,2 35,0 Q64,2 60,25 Q58,6 50,4 Q42,0 35,0 Q28,0 20,4 Q12,6 10,25 Z M12,20 Q14,12 18,10 M58,20 Q56,12 52,10',
    // 5: Shoulder length
    'M14,22 Q16,4 35,2 Q54,4 56,22 Q56,35 52,32 L50,24 Q42,10 28,10 Q18,10 20,24 L18,32 Q14,35 14,22 Z',
    // 6: Pixie
    'M15,24 Q18,3 35,1 Q52,3 55,24 L54,20 Q48,8 35,6 Q22,8 16,20 Z',
    // 7: Very long / floor length
    'M14,24 Q14,2 35,0 Q56,2 56,24 Q56,45 54,55 Q52,32 50,26 Q42,10 28,10 Q18,10 20,26 Q18,32 16,55 Q14,45 14,24 Z',
    // 8: Braids (two braids down)
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z M20,26 Q18,35 19,45 Q20,50 22,52 Q24,50 25,45 Q26,35 24,26 M46,26 Q48,35 47,45 Q46,50 44,52 Q42,50 41,45 Q40,35 42,26',
    // 9: Curly / natural coily long
    'M12,24 Q10,2 35,0 Q60,2 58,24 Q57,8 50,5 Q42,2 35,2 Q28,2 20,5 Q13,8 12,24 Z M13,20 L12,40 M15,22 L14,42 M55,20 L56,40 M57,22 L58,42',
    // 10: High bun
    'M18,24 Q20,10 35,8 Q50,10 52,24 L50,18 Q44,8 35,6 Q26,8 20,18 Z M28,8 Q35,2 42,8 Q42,14 35,12 Q28,14 28,8 Z',
    // 11: Locs (long)
    'M16,22 Q15,3 35,1 Q55,3 54,22 Q52,8 46,6 Q38,4 35,4 Q32,4 24,6 Q18,8 16,22 Z M14,24 L12,50 M18,22 L16,52 M22,20 L20,54 M26,19 L25,54 M35,18 L35,55 M44,19 L45,54 M48,20 L50,54 M52,22 L54,52 M56,24 L58,50',
    // 12: Ponytail
    'M18,22 Q20,6 35,5 Q50,6 52,22 L50,18 Q42,10 28,10 Q20,10 18,18 Z M32,10 Q35,6 38,10 L40,30 Q35,32 30,30 Z',
  ],
  'Non-binary': [
    // 1: Mid-length
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,30 Q44,12 26,12 Q18,12 18,30 Z',
    // 2: Swept
    'M18,20 Q20,6 35,5 Q50,6 52,20 L50,24 Q42,14 28,14 Q20,14 18,24 Z',
    // 3: Asymmetric (longer on one side)
    'M14,22 Q16,4 35,3 Q54,4 56,22 L54,38 Q50,22 48,20 Q42,10 28,10 Q18,10 22,20 Q20,22 16,28 Z',
    // 4: Undercut with wave
    'M15,24 Q15,4 35,2 Q55,4 55,24 Q50,12 42,10 Q38,8 35,8 Q32,8 28,10 Q20,12 15,24 Z',
    // 5: Textured short crop
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z',
    // 6: Voluminous curly
    'M12,26 Q10,2 35,0 Q60,2 58,26 Q56,6 46,4 Q38,2 35,2 Q32,2 24,4 Q14,6 12,26 Z',
    // 7: Fade with top
    'M20,20 Q22,8 35,7 Q48,8 50,20 L48,18 Q42,12 35,12 Q28,12 22,18 Z',
    // 8: Long flowing
    'M14,22 Q16,4 35,2 Q54,4 56,22 Q56,38 52,30 L50,24 Q42,10 28,10 Q18,10 20,24 L18,30 Q14,38 14,22 Z',
    // 9: Natural coils / afro-textured medium
    'M14,24 Q12,2 35,0 Q58,2 56,24 Q55,6 48,4 Q40,2 35,2 Q30,2 22,4 Q15,6 14,24 Z',
    // 10: Braided up
    'M18,22 Q20,6 35,5 Q50,6 52,22 L50,18 Q42,10 28,10 Q20,10 18,18 Z M28,8 Q30,2 35,0 Q40,2 42,8 Q40,14 35,12 Q30,14 28,8 Z',
    // 11: Mohawk / styled center
    'M22,22 Q24,14 35,12 Q46,14 48,22 Q44,16 35,14 Q26,16 22,22 Z M30,14 Q32,4 35,2 Q38,4 40,14 Q38,8 35,6 Q32,8 30,14 Z',
    // 12: Half-up half-down
    'M16,22 Q18,4 35,3 Q52,4 54,22 L54,35 Q50,24 48,22 Q42,10 28,10 Q18,10 22,22 Q20,24 16,35 Z M28,10 Q30,4 35,2 Q40,4 42,10 Q40,8 35,6 Q30,8 28,10 Z',
  ],
};

// ── Outfit Definitions ─────────────────────────────────────────────────
export const OUTFITS = [
  { id: 1, primary: '#1e3a5f', secondary: '#2563eb', label: 'Navy'    },
  { id: 2, primary: '#1e3a1e', secondary: '#22c55e', label: 'Emerald' },
  { id: 3, primary: '#2a1e3a', secondary: '#8b5cf6', label: 'Violet'  },
  { id: 4, primary: '#3a1e1e', secondary: '#ef4444', label: 'Crimson' },
  { id: 5, primary: '#1e2d4a', secondary: '#00e8ff', label: 'Cyber'   },
  { id: 6, primary: '#2a2a1e', secondary: '#f59e0b', label: 'Gold'    },
] as const;

// ── Component ──────────────────────────────────────────────────────────
interface Props {
  config: CharacterConfig;
  size?: number;
  className?: string;
  animated?: boolean;
}

export default function CharacterAvatar({ config, size = 120, className = '', animated = false }: Props) {
  const skin = SKIN_TONES.find(s => s.id === config.skinTone) ?? SKIN_TONES[0];
  const skinColor = skin.hex;

  const genderKey = config.gender in HAIR_PATHS ? config.gender : 'Man';
  const hairStyles = HAIR_PATHS[genderKey];
  const hairPath = hairStyles[(config.hairStyle - 1) % hairStyles.length] ?? hairStyles[0];

  const outfit = OUTFITS.find(o => o.id === config.outfit) ?? OUTFITS[0];
  const eyes = getEyeShape(config.eyeShape);

  // Derived colors
  const shadowColor = `${skinColor}88`;
  const lipColor = config.skinTone >= 6 ? '#c4847a' : '#d4756b';
  const irisColor = config.skinTone >= 7 ? '#3d2008' : '#1a1a2e';

  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 70 84"
      className={className}
      style={animated ? { filter: 'drop-shadow(0 0 8px rgba(0,232,255,0.3))' } : undefined}
    >
      {/* ── Body / Outfit ── */}
      <path
        d="M18,54 Q20,48 26,46 L35,44 L44,46 Q50,48 52,54 L54,76 Q54,80 50,80 L20,80 Q16,80 16,76 Z"
        fill={outfit.primary}
        stroke={outfit.secondary}
        strokeWidth="0.5"
      />
      {/* Collar */}
      <path d="M27,46 L35,52 L43,46" fill="none" stroke={outfit.secondary} strokeWidth="1.2" />
      {/* Shirt detail */}
      <line x1="35" y1="52" x2="35" y2="78" stroke={outfit.secondary} strokeWidth="0.4" opacity="0.4" />

      {/* ── Neck ── */}
      <rect x="31" y="40" width="8" height="7" rx="2" fill={skinColor} />
      {/* Neck shadow */}
      <path d="M31,44 Q35,46 39,44" fill="none" stroke={shadowColor} strokeWidth="0.8" />

      {/* ── Head ── */}
      <ellipse cx="35" cy="28" rx="16.5" ry="18.5" fill={skinColor} />
      {/* Subtle head shading */}
      <ellipse cx="29" cy="24" rx="5" ry="7" fill={shadowColor} opacity="0.12" />

      {/* ── Hair (behind ears) ── */}
      <path d={hairPath} fill={config.hairColor} opacity="0.97" />

      {/* ── Ears ── */}
      <ellipse cx="18" cy="28" rx="3" ry="4" fill={skinColor} />
      <ellipse cx="52" cy="28" rx="3" ry="4" fill={skinColor} />
      {/* Ear canal detail */}
      <path d="M18.5,27 Q19,29 18.5,30" fill="none" stroke={shadowColor} strokeWidth="0.6" />
      <path d="M51.5,27 Q51,29 51.5,30" fill="none" stroke={shadowColor} strokeWidth="0.6" />

      {/* ── Eyes ── */}
      {/* Left eye white */}
      <path d={eyes.leftOuter} fill="white" stroke="#e0d8d0" strokeWidth="0.3" />
      {/* Right eye white */}
      <path d={eyes.rightOuter} fill="white" stroke="#e0d8d0" strokeWidth="0.3" />
      {/* Left iris */}
      <ellipse cx={eyes.highlight.lx - 0.5} cy={eyes.highlight.ly + 0.5} rx="1.8" ry="2.1" fill={irisColor} />
      {/* Right iris */}
      <ellipse cx={eyes.highlight.rx - 0.5} cy={eyes.highlight.ry + 0.5} rx="1.8" ry="2.1" fill={irisColor} />
      {/* Pupils */}
      <ellipse cx={eyes.highlight.lx - 0.5} cy={eyes.highlight.ly + 0.8} rx="1.0" ry="1.2" fill="#050505" />
      <ellipse cx={eyes.highlight.rx - 0.5} cy={eyes.highlight.ry + 0.8} rx="1.0" ry="1.2" fill="#050505" />
      {/* Highlights */}
      <circle cx={eyes.highlight.lx} cy={eyes.highlight.ly} r="0.75" fill="white" />
      <circle cx={eyes.highlight.rx} cy={eyes.highlight.ry} r="0.75" fill="white" />

      {/* ── Eyebrows ── */}
      <path
        d={`M${eyes.highlight.lx - 4.5},${eyes.highlight.ly - 4} Q${eyes.highlight.lx - 1},${eyes.highlight.ly - 5.5} ${eyes.highlight.lx + 2.5},${eyes.highlight.ly - 4}`}
        fill="none" stroke={config.hairColor} strokeWidth="1.3" strokeLinecap="round"
      />
      <path
        d={`M${eyes.highlight.rx - 2.5},${eyes.highlight.ry - 4} Q${eyes.highlight.rx + 1},${eyes.highlight.ry - 5.5} ${eyes.highlight.rx + 4.5},${eyes.highlight.ry - 4}`}
        fill="none" stroke={config.hairColor} strokeWidth="1.3" strokeLinecap="round"
      />

      {/* ── Nose ── */}
      <path d="M33.5,31.5 Q35,34 36.5,31.5" fill="none" stroke={shadowColor} strokeWidth="0.9" strokeLinecap="round" />
      <circle cx="33.2" cy="32.5" r="0.7" fill={shadowColor} opacity="0.4" />
      <circle cx="36.8" cy="32.5" r="0.7" fill={shadowColor} opacity="0.4" />

      {/* ── Mouth ── */}
      <path d="M29.5,36.5 Q35,40 40.5,36.5" fill="none" stroke={lipColor} strokeWidth="1.1" strokeLinecap="round" />
      <path d="M30,36.5 Q35,37.5 40,36.5" fill={lipColor} opacity="0.3" strokeWidth="0" />

      {/* ── Subtle blush (warm skin tones 1-4) ── */}
      {config.skinTone <= 4 && (
        <>
          <ellipse cx="22" cy="32" rx="3.5" ry="2" fill="#ffb3b3" opacity="0.18" />
          <ellipse cx="48" cy="32" rx="3.5" ry="2" fill="#ffb3b3" opacity="0.18" />
        </>
      )}
    </svg>
  );
}
