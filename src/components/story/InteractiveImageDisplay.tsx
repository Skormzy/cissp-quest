'use client';

import { useState } from 'react';
import CharacterPortrait from './portraits/CharacterPortrait';
import { InteractiveImageNode, InteractiveImageHotspot } from '@/lib/story-types';
import { NPC_REGISTRY } from '@/lib/story-characters';

interface InteractiveImageDisplayProps {
  node: InteractiveImageNode;
  playerName: string;
  onAdvance: () => void;
}

export default function InteractiveImageDisplay({
  node,
  playerName,
  onAdvance,
}: InteractiveImageDisplayProps) {
  const [discoveredIds, setDiscoveredIds] = useState<Set<string>>(new Set());
  const [activeHotspot, setActiveHotspot] = useState<InteractiveImageHotspot | null>(null);
  const [npcDialogue, setNpcDialogue] = useState<string>(
    node.dialogue?.replace(/{player}/g, playerName) || 'Click the glowing areas to investigate.'
  );
  const [npcSpeaker, setNpcSpeaker] = useState<string>(node.speaker || '');

  const allDiscovered = discoveredIds.size >= node.hotspots.length;
  const speakerNpc = npcSpeaker ? NPC_REGISTRY[npcSpeaker] : null;
  const hotspotNpc = activeHotspot ? NPC_REGISTRY[activeHotspot.npcSpeaker] : null;

  // Open a hotspot — does NOT mark as discovered yet
  const handleHotspotClick = (hotspot: InteractiveImageHotspot) => {
    if (activeHotspot) return; // Locked while viewing another
    setActiveHotspot(hotspot);
  };

  // Acknowledge reading — NOW marks as discovered, closes the panel
  const handleAcknowledge = () => {
    if (!activeHotspot) return;

    const newDiscovered = new Set(discoveredIds);
    newDiscovered.add(activeHotspot.id);
    setDiscoveredIds(newDiscovered);
    setActiveHotspot(null);

    if (newDiscovered.size >= node.hotspots.length && node.completionDialogue) {
      setNpcDialogue(node.completionDialogue.replace(/{player}/g, playerName));
      setNpcSpeaker(node.speaker || '');
    } else {
      // Reset to intro dialogue so user knows to keep exploring
      setNpcDialogue(
        node.dialogue?.replace(/{player}/g, playerName) || 'Click the glowing areas to investigate.'
      );
      setNpcSpeaker(node.speaker || '');
    }
  };

  const getTypeLabel = () => {
    switch (node.imageType) {
      case 'exploration': return 'EXPLORATION';
      case 'process_flow': return 'PROCESS FLOW';
      case 'comparison': return 'COMPARISON';
      case 'calculation': return 'CALCULATION';
      case 'decision_map': return 'DECISION MAP';
      case 'timeline': return 'TIMELINE';
      default: return 'INTERACTIVE';
    }
  };

  return (
    <div>
      {/* Interactive image area */}
      <div
        className="rounded-xl overflow-hidden relative"
        style={{
          border: '1px solid #00e8ff33',
          boxShadow: '0 0 30px rgba(0, 232, 255, 0.06)',
        }}
      >
        {/* Header */}
        <div
          className="px-4 py-2 flex items-center justify-between"
          style={{ background: 'rgba(0, 232, 255, 0.06)', borderBottom: '1px solid #1e2d4a' }}
        >
          <div className="flex items-center gap-2">
            <span className="text-xs font-bold tracking-wider" style={{ color: '#00e8ff' }}>
              {getTypeLabel()}
            </span>
            <span className="text-[10px]" style={{ color: '#64748b' }}>{node.title}</span>
          </div>
          <span className="text-[10px]" style={{ color: '#64748b' }}>
            {discoveredIds.size}/{node.hotspots.length} discovered
          </span>
        </div>

        {/* Image area with hotspots */}
        <div
          className="relative"
          style={{
            background: node.backgroundGradient,
            minHeight: '280px',
            aspectRatio: '16/9',
          }}
        >
          {node.hotspots.map((hotspot) => {
            const isDiscovered = discoveredIds.has(hotspot.id);
            const isActive = activeHotspot?.id === hotspot.id;
            // Locked = another hotspot is being viewed and this isn't the active one
            const isLocked = activeHotspot !== null && !isActive;

            return (
              <button
                key={hotspot.id}
                onClick={() => handleHotspotClick(hotspot)}
                disabled={isLocked}
                className="absolute transition-all"
                style={{
                  left: `${hotspot.x}%`,
                  top: `${hotspot.y}%`,
                  width: `${hotspot.width}%`,
                  height: `${hotspot.height}%`,
                  transform: 'translate(-50%, -50%)',
                  borderRadius: hotspot.shape === 'circle' ? '50%' : '8px',
                  cursor: isLocked ? 'not-allowed' : 'pointer',
                  opacity: isLocked ? 0.25 : 1,
                  background: isActive
                    ? 'rgba(0, 232, 255, 0.25)'
                    : isDiscovered
                      ? 'rgba(34, 197, 94, 0.15)'
                      : 'rgba(0, 232, 255, 0.1)',
                  border: `2px solid ${
                    isActive ? '#00e8ff' : isDiscovered ? '#22c55e66' : isLocked ? '#1e2d4a' : '#00e8ff44'
                  }`,
                  boxShadow: isActive
                    ? '0 0 20px rgba(0, 232, 255, 0.4)'
                    : isDiscovered || isLocked
                      ? 'none'
                      : '0 0 15px rgba(0, 232, 255, 0.2)',
                  animation: !isDiscovered && !isActive && !isLocked ? 'pulse 2s ease-in-out infinite' : undefined,
                }}
              >
                <span
                  className="text-[10px] font-bold"
                  style={{ color: isDiscovered ? '#22c55e' : isLocked ? '#475569' : '#00e8ff' }}
                >
                  {isDiscovered ? '✓' : hotspot.label}
                </span>
              </button>
            );
          })}
        </div>
      </div>

      {/* Hotspot content panel — shown while viewing a hotspot */}
      {activeHotspot && (
        <div
          className="mt-3 rounded-xl p-4"
          style={{
            background: '#111a2e',
            border: `1px solid ${(hotspotNpc?.accentColor || '#00e8ff')}33`,
          }}
        >
          {/* Hotspot label */}
          <h4 className="text-sm font-bold mb-2" style={{ color: '#00e8ff' }}>
            {activeHotspot.label}
          </h4>

          {/* Detail text */}
          {activeHotspot.detail && (
            <p className="text-xs leading-relaxed mb-3" style={{ color: '#94a3b8' }}>
              {activeHotspot.detail}
            </p>
          )}

          {/* NPC dialogue for this hotspot */}
          <div
            className="rounded-lg p-3 mb-3"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          >
            {hotspotNpc && (
              <span
                className="text-[10px] font-bold block mb-1"
                style={{ color: hotspotNpc.accentColor }}
              >
                {hotspotNpc.name}
              </span>
            )}
            <p className="text-sm" style={{ color: '#e2e8f0' }}>
              {activeHotspot.dialogue.replace(/{player}/g, playerName)}
            </p>
          </div>

          {/* Acknowledge button */}
          <button
            onClick={handleAcknowledge}
            className="w-full py-2.5 rounded-lg text-sm font-bold transition-all hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            Got it
          </button>
        </div>
      )}

      {/* NPC dialogue below image — shown when no hotspot is open */}
      {npcDialogue && !activeHotspot && (
        <div className="mt-3 flex items-end gap-3">
          {node.leftCharacter && (
            <CharacterPortrait
              characterId={node.leftCharacter}
              expression={(node.leftExpression as any) || 'neutral'}
              size={56}
            />
          )}
          <div
            className="flex-1 rounded-lg p-3"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
          >
            {speakerNpc && (
              <span className="text-xs font-bold block mb-1" style={{ color: speakerNpc.accentColor }}>
                {speakerNpc.name}
              </span>
            )}
            <p className="text-sm" style={{ color: '#e2e8f0' }}>{npcDialogue}</p>
          </div>
        </div>
      )}

      {/* Continue button — only when ALL hotspots are discovered */}
      {allDiscovered && !activeHotspot && (
        <button
          onClick={onAdvance}
          className="mt-4 w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          Continue
        </button>
      )}

      {/* Progress hint if not all discovered */}
      {!allDiscovered && !activeHotspot && (
        <div className="mt-3 text-center">
          <span className="text-xs" style={{ color: '#64748b' }}>
            Discover all {node.hotspots.length} areas to continue
          </span>
        </div>
      )}
    </div>
  );
}
