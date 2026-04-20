'use client';

import { motion } from 'framer-motion';
import { DOMAINS } from '@/lib/constants';
import MedalBadge from './MedalBadge';
import { MEDAL_TIERS, MEDAL_COLORS, getEarnedMedals, getNextMedalRequirement, type MedalTier } from './medal-utils';

interface DomainMedalData {
  domainId: number;
  bestScore: number;       // 0–100
  completedPrestige?: boolean;
}

interface Props {
  domainData?: DomainMedalData[];
}

// Default empty state — all zeros
const DEFAULT_DATA: DomainMedalData[] = DOMAINS.map((d) => ({
  domainId: d.id,
  bestScore: 0,
  completedPrestige: false,
}));

const TIER_LABELS: Record<MedalTier, string> = {
  bronze: 'Bronze',
  silver: 'Silver',
  gold: 'Gold',
  platinum: 'Platinum',
};

export default function MedalGrid({ domainData = DEFAULT_DATA }: Props) {
  const dataByDomain = Object.fromEntries(domainData.map((d) => [d.domainId, d]));

  return (
    <div className="w-full space-y-2">
      {/* Header row */}
      <div className="grid items-center gap-3 mb-1 px-1"
        style={{ gridTemplateColumns: '180px repeat(4, 1fr) 160px' }}>
        <div className="text-xs font-semibold uppercase tracking-widest" style={{ color: '#4a5568' }}>
          Domain
        </div>
        {MEDAL_TIERS.map((tier) => (
          <div key={tier} className="text-center text-xs font-semibold uppercase tracking-widest"
            style={{ color: MEDAL_COLORS[tier].fill }}>
            {TIER_LABELS[tier]}
          </div>
        ))}
        <div className="text-xs font-semibold uppercase tracking-widest text-right" style={{ color: '#4a5568' }}>
          Progress
        </div>
      </div>

      {/* Domain rows */}
      {DOMAINS.map((domain, rowIdx) => {
        const data = dataByDomain[domain.id] ?? { domainId: domain.id, bestScore: 0 };
        const earned = getEarnedMedals(data.bestScore, data.completedPrestige);
        const next = getNextMedalRequirement(data.bestScore, data.completedPrestige);

        // Progress toward next medal: percentage of the way from prev threshold to next
        const progressPct = next
          ? Math.min(100, Math.max(0, (data.bestScore / next.requirement.minScore) * 100))
          : 100;

        return (
          <motion.div
            key={domain.id}
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: rowIdx * 0.06, duration: 0.35, ease: 'easeOut' }}
            className="grid items-center gap-3 rounded-xl px-4 py-3 transition-colors hover:bg-[#0d1220]"
            style={{
              gridTemplateColumns: '180px repeat(4, 1fr) 160px',
              border: '1px solid #1e2d4a',
              background: '#080c14',
            }}
          >
            {/* Domain name */}
            <div className="min-w-0">
              <div className="flex items-center gap-2">
                <span className="text-base flex-shrink-0">{domain.icon}</span>
                <div className="min-w-0">
                  <div className="text-xs font-bold truncate" style={{ color: '#e2e8f0' }}>
                    D{domain.id}
                  </div>
                  <div className="text-xs truncate" style={{ color: '#64748b' }}>
                    {domain.name.split(' ').slice(0, 3).join(' ')}
                  </div>
                </div>
              </div>
            </div>

            {/* 4 medal badges */}
            {MEDAL_TIERS.map((tier) => (
              <div key={tier} className="flex justify-center">
                <MedalBadge
                  tier={tier}
                  domainId={domain.id}
                  domainName={domain.name}
                  size="md"
                  earned={earned[tier]}
                />
              </div>
            ))}

            {/* Progress bar */}
            <div className="space-y-1">
              <div className="flex justify-between text-xs" style={{ color: '#64748b' }}>
                <span>{data.bestScore}%</span>
                {next ? (
                  <span style={{ color: MEDAL_COLORS[next.tier].fill }}>
                    {next.requirement.minScore}% for {TIER_LABELS[next.tier]}
                  </span>
                ) : (
                  <span style={{ color: '#ffd700' }}>Max!</span>
                )}
              </div>
              <div className="relative h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
                <div
                  className="absolute inset-y-0 left-0 rounded-full transition-all duration-500"
                  style={{
                    width: `${progressPct}%`,
                    background: next ? MEDAL_COLORS[next.tier].fill : '#ffd700',
                  }}
                />
              </div>
            </div>
          </motion.div>
        );
      })}
    </div>
  );
}
