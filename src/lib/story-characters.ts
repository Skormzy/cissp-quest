import { NPCDefinition, NPCExpression } from './story-types';

// ─── NPC Registry ─────────────────────────────────────────

const ALL_EXPRESSIONS: NPCExpression[] = ['neutral', 'serious', 'smile', 'worried', 'angry', 'surprised', 'thinking'];

export const NPC_REGISTRY: Record<string, NPCDefinition> = {
  reeves: {
    id: 'reeves',
    name: 'Director Reeves',
    role: 'Executive Director — Nexus Cybersecurity',
    accentColor: '#6b21a8',     // purple-800
    silhouetteColor: '#4c1d95',
    expressions: ALL_EXPRESSIONS,
  },
  janet: {
    id: 'janet',
    name: 'Janet Park',
    role: 'SOC Lead — Incident Response',
    accentColor: '#2563eb',     // blue-600
    silhouetteColor: '#1e40af',
    expressions: ALL_EXPRESSIONS,
  },
  kai: {
    id: 'kai',
    name: 'Kai Tanaka',
    role: 'Security Analyst — Threat Intelligence',
    accentColor: '#16a34a',     // green-600
    silhouetteColor: '#15803d',
    expressions: ALL_EXPRESSIONS,
  },
  morales: {
    id: 'morales',
    name: 'Agent Morales',
    role: 'Field Agent — Digital Forensics',
    accentColor: '#dc2626',     // red-600
    silhouetteColor: '#b91c1c',
    expressions: ALL_EXPRESSIONS,
  },
  player: {
    id: 'player',
    name: 'You',
    role: 'New Recruit',
    accentColor: '#00e8ff',     // cyan accent
    silhouetteColor: '#0891b2',
    expressions: ALL_EXPRESSIONS,
  },
};

// ─── Location Background Gradients ────────────────────────

export const LOCATION_GRADIENTS: Record<string, string> = {
  'new-york':   'linear-gradient(135deg, #0f172a 0%, #1e1b4b 50%, #0f172a 100%)',
  'new-jersey': 'linear-gradient(135deg, #0c0a09 0%, #292524 50%, #0c0a09 100%)',
  'zurich':     'linear-gradient(135deg, #0f172a 0%, #164e63 50%, #0f172a 100%)',
  'singapore':  'linear-gradient(135deg, #052e16 0%, #14532d 50%, #052e16 100%)',
  'london':     'linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%)',
  'tel-aviv':   'linear-gradient(135deg, #1a0533 0%, #3b0764 50%, #1a0533 100%)',
  'soc-ny':     'linear-gradient(135deg, #0f172a 0%, #831843 50%, #0f172a 100%)',
  'austin':     'linear-gradient(135deg, #0f172a 0%, #134e4a 50%, #0f172a 100%)',
};

// ─── Domain-to-Location Map ───────────────────────────────

export const DOMAIN_LOCATIONS: Record<number, string> = {
  1: 'new-york',
  2: 'new-jersey',
  3: 'zurich',
  4: 'singapore',
  5: 'london',
  6: 'tel-aviv',
  7: 'soc-ny',
  8: 'austin',
};
