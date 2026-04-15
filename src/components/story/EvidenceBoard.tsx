'use client';

import { useState } from 'react';
import { EvidenceBoardItem } from '@/lib/story-types';
import { NPC_REGISTRY } from '@/lib/story-characters';
import MasteryRing from '@/components/ui/MasteryRing';

interface EvidenceBoardProps {
  items: EvidenceBoardItem[];
  isOpen: boolean;
  onClose: () => void;
  onReplay?: (sceneId: string) => void;
  domainFilter?: number;
}

export default function EvidenceBoard({
  items,
  isOpen,
  onClose,
  onReplay,
  domainFilter,
}: EvidenceBoardProps) {
  const [selectedConcept, setSelectedConcept] = useState<EvidenceBoardItem | null>(null);

  const filteredItems = domainFilter
    ? items.filter((item) => item.domainNumber === domainFilter)
    : items;

  return (
    <>
      {/* Backdrop */}
      {isOpen && (
        <div
          className="fixed inset-0 z-40"
          style={{ background: 'rgba(0, 0, 0, 0.5)' }}
          onClick={onClose}
        />
      )}

      {/* Sidebar panel */}
      <div
        className="fixed top-0 right-0 h-full z-50 transition-transform duration-300 overflow-y-auto"
        style={{
          width: '380px',
          maxWidth: '90vw',
          transform: isOpen ? 'translateX(0)' : 'translateX(100%)',
          background: '#0a0e18',
          borderLeft: '1px solid #1e2d4a',
        }}
      >
        {/* Header */}
        <div
          className="sticky top-0 z-10 px-5 py-4 flex items-center justify-between"
          style={{ background: '#0a0e18', borderBottom: '1px solid #1e2d4a' }}
        >
          <div className="flex items-center gap-2">
            <span className="text-lg">🔍</span>
            <div>
              <h3 className="text-sm font-bold" style={{ color: '#00e8ff' }}>Evidence Board</h3>
              <span className="text-[10px]" style={{ color: '#64748b' }}>
                {filteredItems.length} concept{filteredItems.length !== 1 ? 's' : ''} discovered
              </span>
            </div>
          </div>
          <button
            onClick={onClose}
            className="w-8 h-8 rounded-lg flex items-center justify-center text-sm"
            style={{ background: '#111a2e', color: '#64748b' }}
          >
            ✕
          </button>
        </div>

        {/* Grid background pattern */}
        <div
          className="p-4 min-h-full"
          style={{
            backgroundImage:
              'radial-gradient(circle, #1e2d4a22 1px, transparent 1px)',
            backgroundSize: '20px 20px',
          }}
        >
          {filteredItems.length === 0 ? (
            <div className="text-center py-12">
              <div className="text-3xl mb-3 opacity-30">🔍</div>
              <p className="text-sm" style={{ color: '#64748b' }}>
                No concepts discovered yet.
              </p>
              <p className="text-xs mt-1" style={{ color: '#4a5568' }}>
                Play through story scenes to uncover evidence.
              </p>
            </div>
          ) : (
            <div className="space-y-3">
              {filteredItems.map((item, index) => {
                const npc = NPC_REGISTRY[item.npcId];
                const isSelected = selectedConcept?.conceptName === item.conceptName;

                return (
                  <div key={item.conceptName}>
                    {/* Concept node */}
                    <button
                      onClick={() => setSelectedConcept(isSelected ? null : item)}
                      className="w-full text-left rounded-lg p-3 transition-all"
                      style={{
                        background: isSelected ? '#162035' : '#111a2e',
                        border: `1px solid ${isSelected ? '#00e8ff44' : '#1e2d4a'}`,
                        boxShadow: isSelected ? '0 0 15px rgba(0, 232, 255, 0.08)' : 'none',
                      }}
                    >
                      <div className="flex items-center gap-3">
                        <MasteryRing
                          accuracyPercentage={item.accuracyPercentage || 0}
                          masteryLevel={item.masteryLevel}
                        />
                        <div className="flex-1 min-w-0">
                          <div className="text-sm font-bold truncate" style={{ color: '#e2e8f0' }}>
                            {item.conceptName}
                          </div>
                          <div className="text-[10px] truncate" style={{ color: npc?.accentColor || '#64748b' }}>
                            {item.analogyName}
                          </div>
                        </div>
                        {npc && (
                          <div
                            className="w-6 h-6 rounded-full flex items-center justify-center text-[10px] font-bold shrink-0"
                            style={{ background: `${npc.accentColor}22`, color: npc.accentColor }}
                          >
                            {npc.name[0]}
                          </div>
                        )}
                      </div>
                    </button>

                    {/* Expanded detail */}
                    {isSelected && (
                      <div
                        className="mt-1 rounded-lg p-4 space-y-3"
                        style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
                      >
                        <div>
                          <span className="text-[10px] font-bold block mb-1" style={{ color: '#00e8ff' }}>
                            Analogy
                          </span>
                          <span className="text-xs" style={{ color: '#94a3b8' }}>
                            {item.analogyName}
                          </span>
                        </div>

                        <div>
                          <span className="text-[10px] font-bold block mb-1" style={{ color: '#64748b' }}>
                            Mastery
                          </span>
                          <div className="flex items-center gap-2">
                            <MasteryRing
                              accuracyPercentage={item.accuracyPercentage || 0}
                              masteryLevel={item.masteryLevel}
                              size={20}
                            />
                            <span className="text-xs capitalize" style={{ color: '#94a3b8' }}>
                              {item.masteryLevel || 'unseen'} — {Math.round(item.accuracyPercentage || 0)}%
                            </span>
                          </div>
                        </div>

                        {onReplay && (
                          <button
                            onClick={(e) => {
                              e.stopPropagation();
                              onReplay(item.sceneId);
                            }}
                            className="w-full py-2 rounded-lg text-xs font-bold transition-all hover:opacity-90"
                            style={{ background: '#00e8ff22', color: '#00e8ff', border: '1px solid #00e8ff33' }}
                          >
                            Replay Scene
                          </button>
                        )}
                      </div>
                    )}

                    {/* Connection line to next item */}
                    {index < filteredItems.length - 1 && item.connections?.includes(filteredItems[index + 1]?.conceptName) && (
                      <div className="flex justify-center py-1">
                        <div className="w-0.5 h-6" style={{ background: '#ef444466' }} />
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          )}
        </div>
      </div>
    </>
  );
}
