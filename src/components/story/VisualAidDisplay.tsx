'use client';

import CharacterPortrait from './portraits/CharacterPortrait';
import { VisualAidNode } from '@/lib/story-types';
import { NPC_REGISTRY } from '@/lib/story-characters';

interface VisualAidDisplayProps {
  node: VisualAidNode;
  playerName: string;
  onAdvance: () => void;
}

export default function VisualAidDisplay({ node, playerName, onAdvance }: VisualAidDisplayProps) {
  const speakerNpc = node.speaker ? NPC_REGISTRY[node.speaker] : null;

  return (
    <div>
      {/* Optional NPC commentary */}
      {node.dialogue && node.speaker && (
        <div className="flex items-end gap-3 mb-4">
          {node.leftCharacter && (
            <CharacterPortrait characterId={node.leftCharacter} expression={(node.leftExpression as any) || 'neutral'} size={56} />
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
        </div>
      )}

      {/* Visual aid card */}
      <div
        className="rounded-xl overflow-hidden"
        style={{
          background: '#0d1220',
          border: '1px solid #00e8ff22',
          boxShadow: '0 0 20px rgba(0, 232, 255, 0.05)',
        }}
      >
        {/* Title */}
        <div className="px-5 py-3" style={{ background: 'rgba(0, 232, 255, 0.04)', borderBottom: '1px solid #1e2d4a' }}>
          <h3 className="text-sm font-bold" style={{ color: '#00e8ff' }}>{node.title}</h3>
        </div>

        <div className="p-5">
          {/* Table */}
          {node.aidType === 'table' && node.headers && node.rows && (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr>
                    {node.headers.map((h, i) => (
                      <th
                        key={i}
                        className="text-left px-3 py-2 text-xs font-bold"
                        style={{ color: '#00e8ff', borderBottom: '1px solid #1e2d4a' }}
                      >
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {node.rows.map((row, ri) => (
                    <tr key={ri}>
                      {row.map((cell, ci) => (
                        <td
                          key={ci}
                          className="px-3 py-2"
                          style={{ color: '#e2e8f0', borderBottom: '1px solid #1e2d4a22' }}
                        >
                          {cell}
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {/* Comparison */}
          {node.aidType === 'comparison' && node.headers && node.rows && (
            <div className="grid grid-cols-2 gap-3">
              {node.headers.map((h, i) => (
                <div key={i} className="rounded-lg p-3" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
                  <h4 className="text-xs font-bold mb-2" style={{ color: '#00e8ff' }}>{h}</h4>
                  <ul className="space-y-1">
                    {node.rows?.map((row, ri) => (
                      <li key={ri} className="text-xs" style={{ color: '#94a3b8' }}>
                        {row[i] || '—'}
                      </li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          )}

          {/* List / Diagram */}
          {(node.aidType === 'list' || node.aidType === 'diagram') && node.items && (
            <div className="space-y-2">
              {node.items.map((item, i) => (
                <div key={i} className="flex gap-3 p-3 rounded-lg" style={{ background: '#111a2e' }}>
                  <span className="text-xs font-bold shrink-0 mt-0.5" style={{ color: '#00e8ff' }}>{item.label}</span>
                  <span className="text-sm" style={{ color: '#e2e8f0' }}>{item.description}</span>
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
        Continue
      </button>
    </div>
  );
}
