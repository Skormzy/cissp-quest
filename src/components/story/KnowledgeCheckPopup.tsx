'use client';

import { useState } from 'react';
import { KnowledgeCheckNode } from '@/lib/story-types';

interface KnowledgeCheckPopupProps {
  node: KnowledgeCheckNode;
  onAnswer: (isCorrect: boolean) => void;
  onAdvance: () => void;
}

export default function KnowledgeCheckPopup({ node, onAnswer, onAdvance }: KnowledgeCheckPopupProps) {
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);

  const handleSelect = (index: number) => {
    if (revealed) return;
    setSelectedIndex(index);
    setRevealed(true);
    onAnswer(index === node.correctIndex);
  };

  const isCorrect = selectedIndex === node.correctIndex;

  return (
    <div
      className="rounded-xl overflow-hidden"
      style={{
        background: 'linear-gradient(135deg, #0d1220, #111a2e)',
        border: '1px solid #00e8ff33',
        boxShadow: '0 0 40px rgba(0, 232, 255, 0.08)',
      }}
    >
      {/* Header */}
      <div className="px-5 py-3 flex items-center gap-2" style={{ background: 'rgba(0, 232, 255, 0.06)', borderBottom: '1px solid #1e2d4a' }}>
        <div className="w-6 h-6 rounded-full flex items-center justify-center text-xs" style={{ background: '#00e8ff22', color: '#00e8ff' }}>?</div>
        <span className="text-sm font-bold" style={{ color: '#00e8ff' }}>Knowledge Check</span>
        <span className="text-[10px] ml-auto" style={{ color: '#64748b' }}>No penalty</span>
      </div>

      {/* Question */}
      <div className="p-5">
        <p className="text-sm mb-4 leading-relaxed" style={{ color: '#e2e8f0' }}>{node.question}</p>

        {/* Options */}
        <div className="space-y-2">
          {node.options.map((opt, i) => {
            let bg = '#0d1220';
            let border = '#1e2d4a';
            let textColor = '#e2e8f0';

            if (revealed) {
              if (i === node.correctIndex) {
                bg = 'rgba(34, 197, 94, 0.1)';
                border = '#22c55e';
                textColor = '#22c55e';
              } else if (i === selectedIndex) {
                bg = 'rgba(249, 115, 22, 0.1)';
                border = '#f97316';
                textColor = '#f97316';
              }
            }

            return (
              <button
                key={i}
                onClick={() => handleSelect(i)}
                disabled={revealed}
                className="w-full text-left px-4 py-3 rounded-lg text-sm transition-all"
                style={{ background: bg, border: `1px solid ${border}`, color: textColor }}
              >
                <span className="font-bold mr-2">{String.fromCharCode(65 + i)}.</span>
                {opt}
              </button>
            );
          })}
        </div>

        {/* Feedback */}
        {revealed && (
          <div className="mt-4 space-y-3">
            <div
              className="p-3 rounded-lg text-sm"
              style={{
                background: isCorrect ? 'rgba(34, 197, 94, 0.08)' : 'rgba(249, 115, 22, 0.08)',
                border: `1px solid ${isCorrect ? '#22c55e' : '#f97316'}33`,
                color: '#94a3b8',
              }}
            >
              <span className="font-bold block mb-1" style={{ color: isCorrect ? '#22c55e' : '#f97316' }}>
                {isCorrect ? 'Correct!' : 'Not quite — here\'s the key:'}
              </span>
              {node.explanation}
            </div>

            {node.memoryHack && (
              <div
                className="p-3 rounded-lg text-sm"
                style={{ background: 'rgba(255, 215, 0, 0.06)', border: '1px solid #ffd70022', color: '#ffd700' }}
              >
                <span className="font-bold text-xs block mb-1">Memory Hack</span>
                <span style={{ color: '#e2e8f0' }}>{node.memoryHack}</span>
              </div>
            )}

            <button
              onClick={onAdvance}
              className="w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
              style={{ background: '#00e8ff', color: '#080c14' }}
            >
              Continue
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
