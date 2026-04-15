'use client';

import { useState, useEffect, useRef } from 'react';
import CharacterPortrait from './portraits/CharacterPortrait';
import { TimedDecisionNode } from '@/lib/story-types';

interface TimedDecisionOverlayProps {
  node: TimedDecisionNode;
  onDecision: (optionIndex: number, timedOut: boolean) => void;
  onAdvance: () => void;
}

export default function TimedDecisionOverlay({ node, onDecision, onAdvance }: TimedDecisionOverlayProps) {
  const [timeLeft, setTimeLeft] = useState(node.timeLimit);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const revealedRef = useRef(false);

  const timePercentage = (timeLeft / node.timeLimit) * 100;
  const timerColor = timePercentage > 50 ? '#00e8ff' : timePercentage > 25 ? '#f97316' : '#ef4444';

  useEffect(() => {
    revealedRef.current = revealed;
  }, [revealed]);

  useEffect(() => {
    intervalRef.current = setInterval(() => {
      setTimeLeft((prev) => {
        if (prev <= 1) {
          if (intervalRef.current) clearInterval(intervalRef.current);
          if (!revealedRef.current) {
            setRevealed(true);
            revealedRef.current = true;
            onDecision(-1, true);
          }
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleSelect = (index: number) => {
    if (revealedRef.current) return;
    if (intervalRef.current) clearInterval(intervalRef.current);
    setSelectedIndex(index);
    setRevealed(true);
    revealedRef.current = true;
    onDecision(index, false);
  };

  const selectedOption = selectedIndex !== null ? node.options[selectedIndex] : null;

  return (
    <div
      className="rounded-xl overflow-hidden"
      style={{
        border: `2px solid ${timerColor}`,
        boxShadow: !revealed ? `0 0 30px ${timerColor}33` : 'none',
        animation: !revealed && timePercentage < 25 ? 'pulse 1s ease-in-out infinite' : undefined,
      }}
    >
      {/* Header with timer */}
      <div className="px-5 py-3 flex items-center justify-between" style={{ background: `${timerColor}11` }}>
        <div className="flex items-center gap-2">
          <span className="text-sm font-bold tracking-wider" style={{ color: timerColor }}>
            DECISION REQUIRED
          </span>
        </div>
        <div className="flex items-center gap-2">
          <span className="text-lg font-mono font-bold" style={{ color: timerColor }}>
            {revealed ? '--' : `${timeLeft}s`}
          </span>
        </div>
      </div>

      {/* Timer bar */}
      <div className="h-1 w-full" style={{ background: '#1e2d4a' }}>
        <div
          className="h-full transition-all duration-1000 ease-linear"
          style={{ width: `${timePercentage}%`, background: timerColor }}
        />
      </div>

      {/* Content */}
      <div className="p-5" style={{ background: '#0d1220' }}>
        {/* Portraits */}
        <div className="flex items-center gap-3 mb-4">
          {node.leftCharacter && (
            <CharacterPortrait characterId={node.leftCharacter} expression={(node.leftExpression as any) || 'serious'} size={56} />
          )}
          {node.rightCharacter && (
            <CharacterPortrait characterId={node.rightCharacter} expression={(node.rightExpression as any) || 'worried'} size={56} flipped />
          )}
        </div>

        {/* Scenario */}
        <p className="text-sm mb-4 leading-relaxed" style={{ color: '#e2e8f0' }}>{node.scenario}</p>

        {/* Options */}
        <div className="space-y-2">
          {node.options.map((opt, i) => {
            let bg = '#111a2e';
            let border = '#1e2d4a';
            let textColor = '#e2e8f0';

            if (revealed) {
              if (opt.isOptimal) {
                bg = 'rgba(34, 197, 94, 0.1)';
                border = '#22c55e';
                textColor = '#22c55e';
              } else if (i === selectedIndex) {
                bg = 'rgba(249, 115, 22, 0.1)';
                border = '#f97316';
                textColor = '#f97316';
              } else {
                bg = '#0d1220';
                textColor = '#64748b';
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
                {opt.text}
                {revealed && opt.isOptimal && (
                  <span className="ml-2 text-xs" style={{ color: '#ffd700' }}>
                    {opt.xpBonus ? `+${opt.xpBonus} XP` : 'Optimal'}
                  </span>
                )}
              </button>
            );
          })}
        </div>

        {/* Feedback */}
        {revealed && (
          <div className="mt-4 space-y-3">
            {selectedIndex === -1 || selectedIndex === null ? (
              <div className="p-3 rounded-lg text-sm" style={{ background: 'rgba(239, 68, 68, 0.08)', border: '1px solid #ef444433', color: '#ef4444' }}>
                Time&apos;s up! The optimal response was needed within {node.timeLimit} seconds.
              </div>
            ) : (
              <div
                className="p-3 rounded-lg text-sm"
                style={{
                  background: selectedOption?.isOptimal ? 'rgba(34, 197, 94, 0.08)' : 'rgba(249, 115, 22, 0.08)',
                  border: `1px solid ${selectedOption?.isOptimal ? '#22c55e' : '#f97316'}33`,
                  color: '#94a3b8',
                }}
              >
                {selectedOption?.feedback}
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
