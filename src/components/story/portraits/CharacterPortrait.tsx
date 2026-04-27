'use client';

import { useState } from 'react';
import { NPC_REGISTRY } from '@/lib/story-characters';
import { NPCExpression } from '@/lib/story-types';
import { getCharacterPortrait } from '@/lib/imagery';

interface CharacterPortraitProps {
  characterId: string;
  expression?: NPCExpression;
  size?: number;
  flipped?: boolean;
}

// Map V1 expression names → FLUX image expression keys
const V1_EXPR_TO_FLUX: Record<string, string> = {
  neutral: 'neutral',
  serious: 'serious',
  smile: 'approving',
  worried: 'concerned',
  angry: 'firm',
  surprised: 'excited',
  thinking: 'teaching',
};

// Expression-driven facial features
function getEyebrows(expression: NPCExpression): string {
  switch (expression) {
    case 'angry':     return 'M12,18 L20,15 M28,15 L36,18';
    case 'worried':   return 'M12,15 L20,18 M28,18 L36,15';
    case 'surprised': return 'M12,14 L20,14 M28,14 L36,14';
    case 'serious':   return 'M12,16 L20,16 M28,16 L36,16';
    default:          return 'M13,16 L20,15 M28,15 L35,16';
  }
}

function getMouth(expression: NPCExpression): string {
  switch (expression) {
    case 'smile':     return 'M17,32 Q24,37 31,32';
    case 'angry':     return 'M17,34 Q24,31 31,34';
    case 'worried':   return 'M19,34 Q24,32 29,34';
    case 'surprised': return 'M20,32 Q24,35 28,32 Q24,37 20,32';
    case 'thinking':  return 'M19,33 L27,33';
    default:          return 'M18,33 Q24,35 30,33';
  }
}

function getEyes(expression: NPCExpression): React.ReactNode {
  if (expression === 'surprised') {
    return (
      <>
        <circle cx="18" cy="23" r="3.5" fill="white" />
        <circle cx="18" cy="23" r="2" fill="#1e293b" />
        <circle cx="30" cy="23" r="3.5" fill="white" />
        <circle cx="30" cy="23" r="2" fill="#1e293b" />
      </>
    );
  }
  if (expression === 'thinking') {
    return (
      <>
        <ellipse cx="18" cy="23" rx="3" ry="2" fill="white" />
        <circle cx="19" cy="23" r="1.5" fill="#1e293b" />
        <ellipse cx="30" cy="23" rx="3" ry="1.5" fill="white" />
        <circle cx="31" cy="23" r="1.5" fill="#1e293b" />
      </>
    );
  }
  return (
    <>
      <ellipse cx="18" cy="23" rx="3" ry="2.5" fill="white" />
      <circle cx="18" cy="23" r="1.8" fill="#1e293b" />
      <ellipse cx="30" cy="23" rx="3" ry="2.5" fill="white" />
      <circle cx="30" cy="23" r="1.8" fill="#1e293b" />
    </>
  );
}

export default function CharacterPortrait({
  characterId,
  expression = 'neutral',
  size = 80,
  flipped = false,
}: CharacterPortraitProps) {
  const [imgError, setImgError] = useState(false);
  // Try FLUX image first (handles tanaka/webb/sharma/ghost/vasquez)
  const fluxExpr = V1_EXPR_TO_FLUX[expression] ?? 'neutral';
  const fluxUrl = !imgError ? getCharacterPortrait(characterId, fluxExpr) : null;

  if (fluxUrl) {
    const npc = NPC_REGISTRY[characterId];
    const accent = npc?.accentColor ?? '#00e8ff';
    const portraitName = npc?.name ?? characterId;
    return (
      <div
        className="relative flex-shrink-0 overflow-hidden rounded-xl"
        style={{
          width: size,
          height: size * 1.17,
          transform: flipped ? 'scaleX(-1)' : undefined,
          border: `2px solid ${accent}55`,
          boxShadow: `0 0 12px ${accent}33`,
        }}
      >
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={fluxUrl}
          alt={portraitName}
          loading="lazy"
          decoding="async"
          className="w-full h-full object-cover object-top"
          onError={() => setImgError(true)}
        />
      </div>
    );
  }

  const npc = NPC_REGISTRY[characterId];
  if (!npc) return null;
  const color = npc.silhouetteColor;
  const accent = npc.accentColor;

  return (
    <div
      className="relative flex-shrink-0"
      style={{
        width: size,
        height: size,
        transform: flipped ? 'scaleX(-1)' : undefined,
      }}
    >
      <svg
        viewBox="0 0 48 56"
        width={size}
        height={size * 1.17}
        xmlns="http://www.w3.org/2000/svg"
      >
        {/* Head shape */}
        <ellipse cx="24" cy="24" rx="16" ry="18" fill={color} />

        {/* Accent glow behind head */}
        <ellipse cx="24" cy="24" rx="17" ry="19" fill="none" stroke={accent} strokeWidth="0.5" opacity="0.4" />

        {/* Hair (varies by character) */}
        {characterId === 'reeves' && (
          <path d="M8,18 Q10,6 24,5 Q38,6 40,18 L38,14 Q30,8 24,9 Q18,8 10,14 Z" fill="#2d1b00" />
        )}
        {characterId === 'janet' && (
          <path d="M8,20 Q8,4 24,4 Q40,4 40,20 L38,16 Q36,10 24,9 Q12,10 10,16 Z" fill="#1a1a2e" />
        )}
        {characterId === 'kai' && (
          <path d="M10,18 Q12,8 24,7 Q36,8 38,18 L36,14 Q32,10 24,10 Q16,10 12,14 Z" fill="#4a3728" />
        )}
        {characterId === 'morales' && (
          <path d="M9,20 Q10,6 24,5 Q38,6 39,20 L37,15 Q34,8 24,8 Q14,8 11,15 Z" fill="#1a1a2e" />
        )}
        {characterId === 'player' && (
          <path d="M9,19 Q10,6 24,5 Q38,6 39,19 L37,14 Q33,8 24,8 Q15,8 11,14 Z" fill="#3b82f6" />
        )}

        {/* Eyes */}
        {getEyes(expression)}

        {/* Eyebrows */}
        <path d={getEyebrows(expression)} stroke="#1e293b" strokeWidth="1.2" fill="none" strokeLinecap="round" />

        {/* Nose */}
        <path d="M23,26 L24,29 L22,29" stroke="#1e293b" strokeWidth="0.5" fill="none" opacity="0.4" />

        {/* Mouth */}
        <path d={getMouth(expression)} stroke="#1e293b" strokeWidth="1" fill={expression === 'surprised' ? color : 'none'} strokeLinecap="round" />

        {/* Collar / shoulders hint */}
        <path d="M8,42 Q8,38 16,38 L32,38 Q40,38 40,42 L40,56 L8,56 Z" fill={accent} opacity="0.8" />

        {/* Name tag accent line */}
        <line x1="14" y1="44" x2="34" y2="44" stroke="white" strokeWidth="0.5" opacity="0.3" />
      </svg>

      {/* Character accent ring */}
      <div
        className="absolute -bottom-1 left-1/2 -translate-x-1/2 rounded-full"
        style={{
          width: size * 0.4,
          height: 3,
          background: accent,
          boxShadow: `0 0 8px ${accent}`,
        }}
      />
    </div>
  );
}
