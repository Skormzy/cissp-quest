'use client';

import { useState } from 'react';

interface MasteryRingProps {
  accuracyPercentage: number;
  masteryLevel?: 'unseen' | 'struggling' | 'learning' | 'improving' | 'mastered';
  size?: number;
}

const MASTERY_COLORS: Record<string, string> = {
  unseen: '#4a5568',
  struggling: '#ef4444',
  learning: '#f59e0b',
  improving: '#eab308',
  mastered: '#22c55e',
};

const MASTERY_LABELS: Record<string, string> = {
  unseen: 'Unseen',
  struggling: 'Struggling',
  learning: 'Learning',
  improving: 'Improving',
  mastered: 'Mastered',
};

function getMasteryLevel(accuracy: number): string {
  if (accuracy <= 0) return 'unseen';
  if (accuracy < 50) return 'struggling';
  if (accuracy < 70) return 'learning';
  if (accuracy < 85) return 'improving';
  return 'mastered';
}

export default function MasteryRing({
  accuracyPercentage,
  masteryLevel,
  size = 28,
}: MasteryRingProps) {
  const [showTooltip, setShowTooltip] = useState(false);

  const level = masteryLevel || getMasteryLevel(accuracyPercentage);
  const color = MASTERY_COLORS[level];
  const label = MASTERY_LABELS[level];

  const strokeWidth = 3;
  const radius = (size - strokeWidth) / 2;
  const circumference = 2 * Math.PI * radius;
  const fillPercentage = Math.min(Math.max(accuracyPercentage, 0), 100);
  const strokeDashoffset = circumference - (fillPercentage / 100) * circumference;

  return (
    <div
      className="relative inline-flex items-center justify-center"
      onMouseEnter={() => setShowTooltip(true)}
      onMouseLeave={() => setShowTooltip(false)}
    >
      <svg width={size} height={size} className="transform -rotate-90">
        {/* Background circle */}
        <circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          fill="none"
          stroke="#1e2d4a"
          strokeWidth={strokeWidth}
        />
        {/* Progress circle */}
        <circle
          cx={size / 2}
          cy={size / 2}
          r={radius}
          fill="none"
          stroke={color}
          strokeWidth={strokeWidth}
          strokeLinecap="round"
          strokeDasharray={circumference}
          strokeDashoffset={strokeDashoffset}
          className="transition-all duration-700 ease-out"
        />
      </svg>

      {/* Center dot */}
      <div
        className="absolute rounded-full"
        style={{
          width: size * 0.3,
          height: size * 0.3,
          background: color,
          opacity: level === 'unseen' ? 0.3 : 0.8,
        }}
      />

      {/* Tooltip */}
      {showTooltip && (
        <div
          className="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 px-2 py-1 rounded text-center whitespace-nowrap z-50"
          style={{
            background: '#0d1220',
            border: `1px solid ${color}44`,
            boxShadow: `0 0 10px ${color}22`,
          }}
        >
          <div className="text-[10px] font-bold" style={{ color }}>
            {label}
          </div>
          <div className="text-[10px]" style={{ color: '#94a3b8' }}>
            {Math.round(accuracyPercentage)}%
          </div>
        </div>
      )}
    </div>
  );
}
