'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { type MedalTier, MEDAL_COLORS, MEDAL_REQUIREMENTS, DOMAIN_INITIALS } from './medal-utils';

interface Props {
  tier: MedalTier;
  domainId: number;
  domainName: string;
  size?: 'sm' | 'md' | 'lg';
  earned?: boolean;
  stars?: number; // 1–4, progression within tier
  onClick?: () => void;
}

const SIZE_MAP = {
  sm: 36,
  md: 56,
  lg: 80,
};

const FONT_MAP = {
  sm: 10,
  md: 15,
  lg: 22,
};

export default function MedalBadge({
  tier,
  domainId,
  domainName,
  size = 'md',
  earned = true,
  stars = 0,
  onClick,
}: Props) {
  const [tooltipOpen, setTooltipOpen] = useState(false);
  const px = SIZE_MAP[size];
  const fontSize = FONT_MAP[size];
  const colors = MEDAL_COLORS[tier];
  const req = MEDAL_REQUIREMENTS[tier];
  const initial = DOMAIN_INITIALS[domainId] ?? '?';
  const isPlatinum = tier === 'platinum';

  return (
    <div className="relative inline-block" style={{ width: px, height: px + (size === 'lg' ? 20 : size === 'md' ? 14 : 10) }}>
      {/* SVG Medal */}
      <motion.button
        type="button"
        aria-label={`${domainName} ${tier} medal${earned ? ' (earned)' : ' (locked)'}`}
        onClick={() => {
          setTooltipOpen((v) => !v);
          onClick?.();
        }}
        onBlur={() => setTooltipOpen(false)}
        whileHover={{ scale: earned ? 1.1 : 1.04 }}
        whileTap={{ scale: 0.95 }}
        className="focus:outline-none"
      >
        <svg
          width={px}
          height={px}
          viewBox="0 0 100 100"
          style={{
            filter: earned
              ? `drop-shadow(0 0 ${size === 'lg' ? 10 : 6}px ${colors.glow})`
              : 'none',
          }}
        >
          {/* Platinum rainbow shimmer definition */}
          {isPlatinum && (
            <defs>
              <linearGradient id={`plat-grad-${domainId}`} x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%"   stopColor="#e5e4e2" />
                <stop offset="25%"  stopColor="#a8d8ea" />
                <stop offset="50%"  stopColor="#e5e4e2" />
                <stop offset="75%"  stopColor="#d4a7f5" />
                <stop offset="100%" stopColor="#e5e4e2" />
                <animateTransform
                  attributeName="gradientTransform"
                  type="rotate"
                  values="0 50 50;360 50 50"
                  dur="3s"
                  repeatCount="indefinite"
                />
              </linearGradient>
            </defs>
          )}

          {/* Ribbon top */}
          <rect x="38" y="0" width="10" height="16" rx="2"
            fill={earned ? colors.stroke : '#2a3040'}
            opacity={earned ? 1 : 0.4}
          />
          <rect x="52" y="0" width="10" height="16" rx="2"
            fill={earned ? colors.stroke : '#2a3040'}
            opacity={earned ? 1 : 0.4}
          />

          {/* Outer ring */}
          <circle cx="50" cy="62" r="36"
            fill={earned
              ? (isPlatinum ? `url(#plat-grad-${domainId})` : colors.fill)
              : '#1e2d4a'}
            stroke={earned ? colors.stroke : '#2a3040'}
            strokeWidth="4"
            opacity={earned ? 1 : 0.35}
          />

          {/* Inner highlight ring */}
          <circle cx="50" cy="62" r="28"
            fill="none"
            stroke={earned ? `${colors.fill}88` : '#1e2d4a'}
            strokeWidth="2"
            opacity={earned ? 0.6 : 0.2}
          />

          {/* Shine on earned medals */}
          {earned && (
            <ellipse cx="38" cy="50" rx="8" ry="5"
              fill="white" opacity="0.18"
              transform="rotate(-30 38 50)"
            />
          )}

          {/* Domain initial */}
          <text
            x="50" y="62"
            textAnchor="middle"
            dominantBaseline="central"
            fontSize={fontSize}
            fontWeight="700"
            fontFamily="system-ui, sans-serif"
            fill={earned ? (tier === 'silver' ? '#333' : '#fff') : '#4a5568'}
            opacity={earned ? 1 : 0.4}
          >
            {initial}
          </text>

          {/* Lock icon if not earned */}
          {!earned && (
            <text x="50" y="82" textAnchor="middle" fontSize="12" fill="#4a5568">
              🔒
            </text>
          )}
        </svg>

        {/* Star progression dots */}
        {earned && stars > 0 && (
          <div
            className="flex justify-center gap-0.5 mt-0.5"
            aria-label={`${stars} stars`}
          >
            {Array.from({ length: 4 }).map((_, i) => (
              <div
                key={i}
                style={{
                  width: size === 'sm' ? 4 : 5,
                  height: size === 'sm' ? 4 : 5,
                  borderRadius: '50%',
                  background: i < stars ? colors.fill : '#1e2d4a',
                }}
              />
            ))}
          </div>
        )}
      </motion.button>

      {/* Tooltip */}
      <AnimatePresence>
        {tooltipOpen && (
          <motion.div
            initial={{ opacity: 0, y: 6, scale: 0.95 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 6, scale: 0.95 }}
            transition={{ duration: 0.15 }}
            className="absolute z-50 bottom-full left-1/2 -translate-x-1/2 mb-2 w-48 rounded-lg p-3 text-center shadow-xl pointer-events-none"
            style={{
              background: '#111a2e',
              border: `1px solid ${colors.stroke}`,
              boxShadow: `0 4px 20px ${colors.glow}`,
            }}
          >
            <div className="text-xs font-bold mb-1" style={{ color: colors.fill }}>
              {tier.charAt(0).toUpperCase() + tier.slice(1)} Medal
            </div>
            <div className="text-xs font-semibold mb-1" style={{ color: '#e2e8f0' }}>
              {domainName}
            </div>
            <div className="text-xs" style={{ color: '#94a3b8' }}>
              {req.description}
            </div>
            {!earned && (
              <div className="mt-1.5 text-xs font-medium" style={{ color: '#ef4444' }}>
                Not yet earned
              </div>
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
