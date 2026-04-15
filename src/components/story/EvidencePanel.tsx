'use client';

import { useState, useEffect } from 'react';
import CharacterPortrait from './portraits/CharacterPortrait';
import { EvidenceNode } from '@/lib/story-types';
import { NPC_REGISTRY } from '@/lib/story-characters';

interface EvidencePanelProps {
  node: EvidenceNode;
  playerName: string;
  onAdvance: () => void;
}

const CLASSIFICATION_COLORS: Record<string, string> = {
  CLASSIFIED: '#ef4444',
  'TOP SECRET': '#dc2626',
  CONFIDENTIAL: '#f97316',
  UNCLASSIFIED: '#22c55e',
};

export default function EvidencePanel({ node, playerName, onAdvance }: EvidencePanelProps) {
  const [revealed, setRevealed] = useState(false);
  const classColor = CLASSIFICATION_COLORS[node.classification] || '#ef4444';

  useEffect(() => {
    const t = setTimeout(() => setRevealed(true), 500);
    return () => clearTimeout(t);
  }, []);

  const speakerNpc = node.speaker ? NPC_REGISTRY[node.speaker] : null;

  return (
    <div>
      {/* Optional NPC commentary */}
      {node.dialogue && node.speaker && (
        <div className="flex items-end gap-3 mb-4">
          {node.leftCharacter && (
            <CharacterPortrait
              characterId={node.leftCharacter}
              expression={(node.leftExpression as any) || 'serious'}
              size={64}
            />
          )}
          <div
            className="flex-1 rounded-lg p-3 text-sm"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
          >
            <span className="text-xs font-bold block mb-1" style={{ color: speakerNpc?.accentColor || '#00e8ff' }}>
              {speakerNpc?.name || node.speaker}
            </span>
            {node.dialogue.replace(/{player}/g, playerName)}
          </div>
          {node.rightCharacter && (
            <CharacterPortrait
              characterId={node.rightCharacter}
              expression={(node.rightExpression as any) || 'neutral'}
              size={64}
              flipped
            />
          )}
        </div>
      )}

      {/* Evidence display */}
      <div
        className="rounded-xl overflow-hidden transition-all duration-500"
        style={{
          border: `1px solid ${classColor}44`,
          boxShadow: revealed ? `0 0 30px ${classColor}22, inset 0 0 30px ${classColor}08` : 'none',
          opacity: revealed ? 1 : 0,
          transform: revealed ? 'scale(1)' : 'scale(0.95)',
        }}
      >
        {/* Classification header */}
        <div
          className="px-4 py-2 flex items-center justify-between"
          style={{ background: `${classColor}15` }}
        >
          <div className="flex items-center gap-2">
            <div className="w-2 h-2 rounded-full animate-pulse" style={{ background: classColor }} />
            <span className="text-xs font-bold tracking-widest" style={{ color: classColor }}>
              {node.classification}
            </span>
          </div>
          <span className="text-[10px] font-mono" style={{ color: '#64748b' }}>
            NEXUS-{node.id.slice(0, 8).toUpperCase()}
          </span>
        </div>

        {/* Evidence body */}
        <div className="p-5" style={{ background: '#0d1220' }}>
          <h3 className="font-bold text-lg mb-3" style={{ color: '#e2e8f0' }}>{node.title}</h3>

          {/* Content */}
          <p className="text-sm mb-4 leading-relaxed" style={{ color: '#94a3b8' }}>{node.content}</p>

          {/* Evidence items */}
          {node.evidenceItems && node.evidenceItems.length > 0 && (
            <div className="space-y-2">
              {node.evidenceItems.map((item, i) => (
                <div
                  key={i}
                  className="flex items-start gap-3 p-3 rounded-lg"
                  style={{
                    background: item.highlight ? `${classColor}08` : '#111a2e',
                    border: `1px solid ${item.highlight ? classColor + '33' : '#1e2d4a'}`,
                  }}
                >
                  <span className="text-xs font-bold shrink-0 mt-0.5" style={{ color: '#64748b' }}>{item.label}:</span>
                  <span className="text-sm" style={{ color: item.highlight ? classColor : '#e2e8f0' }}>{item.value}</span>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Continue */}
      <button
        onClick={onAdvance}
        className="mt-4 w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
        style={{ background: '#00e8ff', color: '#080c14' }}
      >
        Continue Investigation
      </button>
    </div>
  );
}
