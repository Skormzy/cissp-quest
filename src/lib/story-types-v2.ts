// Story Mode v2 — Meridian Global Breach narrative types
// Used by the new VisualNovelEngine v2 and story-content.ts

export type NPCId = 'tanaka' | 'webb' | 'sharma' | 'ghost' | 'vasquez' | 'alex';

export type SceneType =
  | 'dialogue'
  | 'choice'
  | 'narration'
  | 'memory_hack'
  | 'evidence'
  | 'tlatm';

// ─── NPC Registry ─────────────────────────────────────────

export interface NPC {
  id: NPCId;
  name: string;
  role: string;
  color: string;   // accent color for name badge
  emoji: string;   // fallback portrait
}

export const NPC_REGISTRY_V2: Record<NPCId, NPC> = {
  tanaka: {
    id: 'tanaka',
    name: 'Dr. Keiko Tanaka',
    role: 'Risk Management Lead — Meridian Global (Toronto)',
    color: '#06b6d4',
    emoji: '👩‍💼',
  },
  webb: {
    id: 'webb',
    name: 'Marcus Webb',
    role: 'SOC Lead — Meridian Global (New York)',
    color: '#ef4444',
    emoji: '👨‍💻',
  },
  sharma: {
    id: 'sharma',
    name: 'Priya Sharma',
    role: 'CISO — Meridian Global (London)',
    color: '#8b5cf6',
    emoji: '👩‍🔬',
  },
  ghost: {
    id: 'ghost',
    name: 'Ghost Holloway',
    role: 'Senior Developer — Meridian Global [SUSPECT]',
    color: '#64748b',
    emoji: '🕵️',
  },
  vasquez: {
    id: 'vasquez',
    name: 'Elena Vasquez',
    role: 'Legal Counsel — Meridian Global (Munich)',
    color: '#f59e0b',
    emoji: '⚖️',
  },
  alex: {
    id: 'alex',
    name: 'Alex Mercer',
    role: 'Security Consultant — Sentinel Dynamics',
    color: '#00e8ff',
    emoji: '🧑‍🔍',
  },
};

// ─── Scene Building Blocks ────────────────────────────────

export interface SceneChoice {
  text: string;
  xpBonus: number;
  isCorrect?: boolean;
  response: string;
}

export interface KnowledgeCheckData {
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
  memoryHack?: string;
}

// ─── Core Scene Type ──────────────────────────────────────

export interface StoryScene {
  id: string;
  type: SceneType;
  location: string;
  background: string;        // CSS gradient string
  leftNPC?: NPCId;
  rightNPC?: NPCId;
  speaker?: NPCId | 'narrator';
  speakerExpression?: string; // e.g. 'teaching', 'concerned' → /images/story/npc_{id}_{expression}.webp
  dialogue: string;
  choices?: SceneChoice[];
  memoryHack?: {
    title: string;
    body: string;
  };
  xpReward?: number;
  knowledgeCheck?: KnowledgeCheckData;
}

// ─── Domain Chapter ───────────────────────────────────────

export interface DomainChapter {
  domainId: number;
  domainName: string;
  location: string;
  locationEmoji: string;
  background: string;        // CSS gradient string for this domain
  primaryNPC: NPCId;
  scenes: StoryScene[];
}

// ─── Location Gradient Map ────────────────────────────────

// CSS gradient fallbacks — used until real images are available in public/images/story/
const LOCATION_GRADIENTS_CSS: Record<string, string> = {
  toronto:         'linear-gradient(135deg, #0a1628 0%, #1a2d4a 50%, #0d2040 100%)',
  london:          'linear-gradient(135deg, #1a1428 0%, #2d1a40 50%, #1a2840 100%)',
  munich:          'linear-gradient(135deg, #0a1a1a 0%, #1a2d2a 50%, #0d2020 100%)',
  singapore:       'linear-gradient(135deg, #1a0a28 0%, #2d1a40 50%, #280d2a 100%)',
  'new-york':      'linear-gradient(135deg, #0a0a28 0%, #1a1a4a 50%, #0a0d3a 100%)',
  'remote-lab':    'linear-gradient(135deg, #040a14 0%, #0a1a28 50%, #040d1a 100%)',
  tokyo:           'linear-gradient(135deg, #28091a 0%, #3a1a2d 50%, #200a1a 100%)',
  'san-francisco': 'linear-gradient(135deg, #0d1a2d 0%, #1a2d40 50%, #0a1a28 100%)',
};

// Primary background image per location — populated by scripts/copy-images-to-public.ts
const LOCATION_BG_IMAGES: Record<string, string> = {
  toronto:         '/images/story/bg_act1_hq_day.webp',
  london:          '/images/story/bg_act2_london_hq_lobby.webp',
  munich:          '/images/story/bg_act3_munich_exterior.webp',
  singapore:       '/images/story/bg_act4_singapore_dc_interior.webp',
  'new-york':      '/images/story/bg_act5_ny_financial.webp',
  'remote-lab':    '/images/story/bg_act6_sentinel_lab.webp',
  tokyo:           '/images/story/bg_act7_tokyo_exterior.webp',
  'san-francisco': '/images/story/bg_act8_sf_office.webp',
};

// Returns CSS string: real image with gradient overlay (for text legibility), or pure gradient fallback
export const LOCATION_GRADIENTS_V2: Record<string, string> = Object.fromEntries(
  Object.keys(LOCATION_GRADIENTS_CSS).map((key) => {
    const imgPath = LOCATION_BG_IMAGES[key];
    const gradient = LOCATION_GRADIENTS_CSS[key];
    // The CSS background-image stacks: darkening overlay on top of the photo
    const withImage = `linear-gradient(rgba(4,8,16,0.6),rgba(4,8,16,0.5)), url(${imgPath})`;
    // We always emit the image version; browser falls back to gradient if image 404s
    return [key, withImage + ', ' + gradient];
  })
);

// ─── Domain-to-location map ───────────────────────────────

export const DOMAIN_LOCATIONS_V2: Record<number, string> = {
  1: 'toronto',
  2: 'london',
  3: 'munich',
  4: 'singapore',
  5: 'new-york',
  6: 'remote-lab',
  7: 'tokyo',
  8: 'san-francisco',
};
