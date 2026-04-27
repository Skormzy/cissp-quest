/**
 * CISSP Quest design tokens. TS-side mirror of the CSS custom properties
 * declared in src/app/globals.css `:root`. The CSS file is the source of
 * truth — keep these in lockstep when editing.
 *
 * Visual identity: cyberpunk command-terminal meets premium intelligence
 * agency dossier. Deep navy bases, electric cyan signal, amber alerts,
 * violet for arcane/crypto domains.
 */

// Keys here mirror CSS variable names (kebab-case → camelCase) so a grep
// across the codebase aligns: `text-muted` ↔ `textMuted`, `bg-deep` ↔ `bgDeep`.
export const palette = {
  bgDeep: '#080c14',          // --bg-deep
  bgCard: '#0d1220',          // --bg-card
  bgCardHover: '#111a2e',     // --bg-card-hover
  bgElevated: '#1a2540',      // --bg-elevated
  borderSubtle: '#1e2d4a',    // --border-subtle
  borderStrong: '#2a3d5a',    // --border-strong
  textPrimary: '#e2e8f0',     // --text-primary
  textSecondary: '#94a3b8',   // --text-secondary
  textMuted: '#64748b',       // --text-muted
  textDim: '#475569',         // --text-dim
  accent: '#00e8ff',          // --accent
  accentDim: '#00b8cc',       // --accent-dim
  accentGlow: 'rgba(0, 232, 255, 0.15)', // --accent-glow
  gold: '#ffd700',            // --gold
  warning: '#f59e0b',         // --warning  (amber)
  success: '#22c55e',         // --success  (emerald)
  pink: '#ec4899',            // --pink
  purple: '#8b5cf6',          // --purple   (violet — kept under CSS name)
  purpleDeep: '#a855f7',      // --purple-deep
  danger: '#ef4444',          // --danger
} as const;

// Domain accent map. Eight visually distinct hues; D8 is teal (not cyan)
// so the dashboard mosaic reads as 8 colors, not 7. Mirrors --domain-N
// CSS vars in globals.css and ACT/domain logic in imagery.ts.
export const domainAccent: Record<number, string> = {
  1: '#00e8ff', // cyan      — Security & Risk Management
  2: '#8b5cf6', // violet    — Asset Security
  3: '#22c55e', // emerald   — Security Architecture & Engineering
  4: '#ec4899', // pink      — Communication & Network Security
  5: '#f59e0b', // amber     — Identity & Access Management
  6: '#a855f7', // purple    — Security Assessment & Testing
  7: '#ef4444', // red       — Security Operations
  8: '#14b8a6', // teal      — Software Development Security
};

export const domainAccentRgb: Record<number, string> = {
  1: '0, 232, 255',
  2: '139, 92, 246',
  3: '34, 197, 94',
  4: '236, 72, 153',
  5: '245, 158, 11',
  6: '168, 85, 247',
  7: '239, 68, 68',
  8: '20, 184, 166',
};

// Cinematic motion timing (ms). Kept consistent across the app so screen
// transitions feel composed rather than ad-hoc.
export const motionDuration = {
  micro: 150,
  fast: 200,
  base: 300,
  smooth: 450,
  cinematic: 800,
  kenBurns: 14000,
} as const;

export const easing = {
  standard: [0.4, 0, 0.2, 1] as const,
  decelerate: [0, 0, 0.2, 1] as const,
  accelerate: [0.4, 0, 1, 1] as const,
  emphasized: [0.2, 0, 0, 1] as const,
} as const;

// Z-index scale. Reserve gaps so we can slot new layers without renumbering.
export const z = {
  base: 0,
  raised: 10,
  dropdown: 20,
  sticky: 30,
  overlay: 40,
  modal: 50,
  toast: 60,
  tooltip: 70,
} as const;

// Typography scale. Use semantic names, not pixel values, so we can
// retune without ripping through the codebase.
export const fontFamily = {
  display: 'var(--font-display), system-ui, sans-serif',
  body: 'var(--font-sans), system-ui, sans-serif',
  mono: 'var(--font-mono), ui-monospace, monospace',
} as const;

// Glow ring presets. Apply via inline style or Framer Motion variants.
export function glow(color: string, intensity: 'soft' | 'medium' | 'strong' = 'medium'): string {
  const blur = intensity === 'soft' ? 12 : intensity === 'strong' ? 32 : 20;
  const alpha = intensity === 'soft' ? 0.25 : intensity === 'strong' ? 0.6 : 0.4;
  return `0 0 ${blur}px rgba(${hexToRgb(color)}, ${alpha})`;
}

function hexToRgb(hex: string): string {
  const m = hex.replace('#', '');
  const r = parseInt(m.slice(0, 2), 16);
  const g = parseInt(m.slice(2, 4), 16);
  const b = parseInt(m.slice(4, 6), 16);
  return `${r}, ${g}, ${b}`;
}
