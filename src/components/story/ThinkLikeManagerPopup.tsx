'use client';

import { useState } from 'react';
import { ThinkLikeManagerNode } from '@/lib/story-types';

interface ThinkLikeManagerPopupProps {
  node: ThinkLikeManagerNode;
  onAnswer: (isCorrect: boolean) => void;
  onAdvance: () => void;
}

export default function ThinkLikeManagerPopup({ node, onAnswer, onAdvance }: ThinkLikeManagerPopupProps) {
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
        border: '1px solid #ffd70044',
        boxShadow: '0 0 30px rgba(255, 215, 0, 0.08)',
      }}
    >
      {/* Header */}
      <div
        className="px-5 py-3 flex items-center gap-3"
        style={{ background: 'rgba(255, 215, 0, 0.06)', borderBottom: '1px solid #ffd70022' }}
      >
        <span className="text-lg">💼</span>
        <div>
          <span className="text-sm font-bold" style={{ color: '#ffd700' }}>Think Like a Manager</span>
          <span className="text-[10px] block" style={{ color: '#64748b' }}>CISSP management perspective</span>
        </div>
      </div>

      {/* Body */}
      <div className="p-5" style={{ background: '#0d1220' }}>
        {/* Scenario */}
        <div className="mb-4 p-3 rounded-lg text-sm" style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}>
          {node.scenario}
        </div>

        {/* Question */}
        <p className="text-sm mb-4 font-medium" style={{ color: '#e2e8f0' }}>{node.question}</p>

        {/* Options */}
        <div className="space-y-2">
          {node.options.map((opt, i) => {
            let bg = '#111a2e';
            let border = '#1e2d4a';
            let textColor = '#e2e8f0';

            if (revealed) {
              if (i === node.correctIndex) {
                bg = 'rgba(255, 215, 0, 0.08)';
                border = '#ffd700';
                textColor = '#ffd700';
              } else if (i === selectedIndex) {
                bg = 'rgba(249, 115, 22, 0.08)';
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
                background: isCorrect ? 'rgba(255, 215, 0, 0.06)' : 'rgba(249, 115, 22, 0.06)',
                border: `1px solid ${isCorrect ? '#ffd700' : '#f97316'}33`,
                color: '#94a3b8',
              }}
            >
              <span className="font-bold block mb-1" style={{ color: isCorrect ? '#ffd700' : '#f97316' }}>
                {isCorrect ? 'Excellent management thinking!' : 'Consider the manager\'s perspective:'}
              </span>
              {node.explanation}
            </div>

            {/* Manager insight */}
            <div
              className="p-3 rounded-lg text-sm"
              style={{ background: 'rgba(255, 215, 0, 0.04)', border: '1px solid #ffd70022' }}
            >
              <span className="font-bold text-xs block mb-1" style={{ color: '#ffd700' }}>Manager Insight</span>
              <span style={{ color: '#e2e8f0' }}>{node.managerInsight}</span>
            </div>

            <button
              onClick={onAdvance}
              className="w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
              style={{ background: '#ffd700', color: '#080c14' }}
            >
              Continue
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
