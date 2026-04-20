'use client';

import { motion } from 'framer-motion';

// ─── Types ─────────────────────────────────────────────────────────────────────

export interface TLATMMeterProps {
  managerScore: number;     // 0-100
  technicianScore: number;  // 0-100
  totalDecisions: number;
  compact?: boolean;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

function getTanakaComment(managerPct: number): string {
  if (managerPct > 70) return 'You think like a CISO. Excellent.';
  if (managerPct >= 50) return 'Good balance. Remember — governance first.';
  if (managerPct >= 30) return 'Leaning technical. Think about business impact.';
  return 'Pure technician mindset. The exam wants a manager.';
}

function getTanakaEmoji(managerPct: number): string {
  if (managerPct > 70) return '★';
  if (managerPct >= 50) return '◆';
  if (managerPct >= 30) return '▲';
  return '!';
}

// ─── Icons (inline SVG, no extra dependency) ──────────────────────────────────

function BriefcaseIcon({ size = 14, color = '#3b82f6' }: { size?: number; color?: string }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
      <rect x="2" y="7" width="20" height="14" rx="2" ry="2" />
      <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16" />
    </svg>
  );
}

function WrenchIcon({ size = 14, color = '#f97316' }: { size?: number; color?: string }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
      <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
    </svg>
  );
}

// ─── Compact version ──────────────────────────────────────────────────────────

function CompactMeter({ managerPct, techPct }: { managerPct: number; techPct: number }) {
  const isManagerDominant = managerPct >= techPct;

  return (
    <div className="flex items-center gap-2">
      <span className="font-mono text-[10px]" style={{ color: '#3b82f6' }}>
        M {managerPct}%
      </span>
      <div
        className="relative flex-1 h-2 rounded-full overflow-hidden"
        style={{
          background: '#1e2d4a',
          border: `1px solid ${isManagerDominant ? '#3b82f644' : '#f9731644'}`,
        }}
      >
        <motion.div
          className="absolute top-0 left-0 h-full"
          style={{
            background: 'linear-gradient(90deg, #3b82f6, #06b6d4)',
            borderRadius: '9999px',
          }}
          initial={{ width: 0 }}
          animate={{ width: `${managerPct}%` }}
          transition={{ duration: 0.6, ease: 'easeOut' }}
        />
      </div>
      <span className="font-mono text-[10px]" style={{ color: '#f97316' }}>
        T {techPct}%
      </span>
    </div>
  );
}

// ─── Full version ─────────────────────────────────────────────────────────────

function FullMeter({
  managerPct,
  techPct,
  totalDecisions,
  managerScore,
  technicianScore,
}: {
  managerPct: number;
  techPct: number;
  totalDecisions: number;
  managerScore: number;
  technicianScore: number;
}) {
  const isManagerDominant = managerPct >= techPct;
  const borderColor = isManagerDominant ? '#3b82f6' : '#f97316';
  const comment = getTanakaComment(managerPct);
  const badge = getTanakaEmoji(managerPct);

  return (
    <div
      className="rounded-xl overflow-hidden"
      style={{
        border: `1px solid ${borderColor}44`,
        background: '#0d1220',
        boxShadow: `0 0 20px ${borderColor}14`,
      }}
    >
      {/* Header */}
      <div
        className="px-4 py-2.5 flex items-center justify-between"
        style={{
          background: `${borderColor}0d`,
          borderBottom: `1px solid ${borderColor}22`,
        }}
      >
        <div className="flex items-center gap-2">
          <span className="font-mono text-[10px] font-bold tracking-widest uppercase" style={{ color: borderColor }}>
            TLATM Meter
          </span>
          <span className="font-mono text-[9px] uppercase tracking-wider" style={{ color: '#4a5568' }}>
            Think Like a Manager
          </span>
        </div>
        <span className="font-mono text-[9px]" style={{ color: '#4a5568' }}>
          {totalDecisions} decision{totalDecisions !== 1 ? 's' : ''}
        </span>
      </div>

      <div className="p-4 space-y-3">
        {/* Labels row */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-1.5">
            <BriefcaseIcon size={13} color="#3b82f6" />
            <span className="font-mono text-[10px] font-semibold tracking-wider uppercase" style={{ color: '#3b82f6' }}>
              Manager
            </span>
          </div>
          <div className="flex items-center gap-1.5">
            <span className="font-mono text-[10px] font-semibold tracking-wider uppercase" style={{ color: '#f97316' }}>
              Technician
            </span>
            <WrenchIcon size={13} color="#f97316" />
          </div>
        </div>

        {/* Bar */}
        <div
          className="relative h-4 rounded-full overflow-hidden"
          style={{ background: '#1e2d4a' }}
        >
          {/* Manager segment */}
          <motion.div
            className="absolute top-0 left-0 h-full"
            style={{
              background: 'linear-gradient(90deg, #1d4ed8, #3b82f6)',
            }}
            initial={{ width: 0 }}
            animate={{ width: `${managerPct}%` }}
            transition={{ duration: 0.7, ease: 'easeOut' }}
          />

          {/* Technician segment */}
          <motion.div
            className="absolute top-0 right-0 h-full"
            style={{
              background: 'linear-gradient(90deg, #f97316, #ea580c)',
            }}
            initial={{ width: 0 }}
            animate={{ width: `${techPct}%` }}
            transition={{ duration: 0.7, ease: 'easeOut' }}
          />

          {/* Divider */}
          <motion.div
            className="absolute top-0 h-full w-0.5 -translate-x-px"
            style={{ background: '#e2e8f0', opacity: 0.4 }}
            animate={{ left: `${managerPct}%` }}
            transition={{ duration: 0.7, ease: 'easeOut' }}
          />
        </div>

        {/* Percentage row */}
        <div className="flex items-center justify-between font-mono">
          <div className="text-center">
            <span className="text-base font-bold" style={{ color: '#3b82f6' }}>
              {managerPct}%
            </span>
            <span className="block text-[9px]" style={{ color: '#4a5568' }}>
              {managerScore} pts
            </span>
          </div>
          <div className="text-center">
            <span className="text-base font-bold" style={{ color: '#f97316' }}>
              {techPct}%
            </span>
            <span className="block text-[9px]" style={{ color: '#4a5568' }}>
              {technicianScore} pts
            </span>
          </div>
        </div>

        {/* Tanaka comment */}
        <motion.div
          key={comment}
          initial={{ opacity: 0, y: 6 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
          className="flex items-start gap-2 pt-1 pb-0.5 px-3 rounded"
          style={{
            background: `${borderColor}0d`,
            border: `1px solid ${borderColor}22`,
          }}
        >
          <span
            className="font-mono text-xs font-bold flex-shrink-0 mt-0.5"
            style={{ color: borderColor }}
          >
            {badge}
          </span>
          <div>
            <span className="font-mono text-[9px] uppercase tracking-widest" style={{ color: '#4a5568' }}>
              Tanaka says
            </span>
            <p className="text-xs mt-0.5" style={{ color: '#94a3b8' }}>
              {comment}
            </p>
          </div>
        </motion.div>
      </div>
    </div>
  );
}

// ─── Main export ──────────────────────────────────────────────────────────────

export default function TLATMMeter({
  managerScore,
  technicianScore,
  totalDecisions,
  compact = false,
}: TLATMMeterProps) {
  const total = managerScore + technicianScore;
  const managerPct = total === 0 ? 50 : Math.round((managerScore / total) * 100);
  const techPct = 100 - managerPct;

  if (compact) {
    return <CompactMeter managerPct={managerPct} techPct={techPct} />;
  }

  return (
    <FullMeter
      managerPct={managerPct}
      techPct={techPct}
      totalDecisions={totalDecisions}
      managerScore={managerScore}
      technicianScore={technicianScore}
    />
  );
}
