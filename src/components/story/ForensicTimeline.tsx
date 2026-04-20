'use client';

import { useRef } from 'react';
import { motion, useInView } from 'framer-motion';

// ─── Types ────────────────────────────────────────────────────────────────────

interface TimelineEvent {
  day: number;
  title: string;
  description: string;
  domain: number;
  domainColor: string;
  domainName: string;
  isUnlocked: boolean;
  caseFileStamp: string;
}

// ─── Data ─────────────────────────────────────────────────────────────────────

const BREACH_TIMELINE: TimelineEvent[] = [
  {
    day: 0,
    title: 'The Staging Server',
    description:
      'Ghost discovers an unprotected staging server exposed to the public internet, missing firewall rules and authentication.',
    domain: 4,
    domainColor: '#06b6d4',
    domainName: 'Network Security',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
  {
    day: 14,
    title: 'First Access',
    description:
      'Initial credentials harvested via a targeted phishing campaign against Meridian finance staff. MFA was not enforced.',
    domain: 5,
    domainColor: '#8b5cf6',
    domainName: 'IAM',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
  {
    day: 45,
    title: 'Governance Gap',
    description:
      'Investigation reveals no risk register maintained, no incident response plan on file, and no documented security policies.',
    domain: 1,
    domainColor: '#ef4444',
    domainName: 'Risk Management',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
  {
    day: 67,
    title: 'Data Sprawl',
    description:
      '47,000 unclassified customer records found in publicly readable S3 buckets. No data classification policy existed.',
    domain: 2,
    domainColor: '#f59e0b',
    domainName: 'Asset Security',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
  {
    day: 89,
    title: 'Architecture Flaw',
    description:
      'Attacker achieves lateral movement across the entire internal network via a flat topology with no segmentation or micro-perimeters.',
    domain: 3,
    domainColor: '#22c55e',
    domainName: 'Security Architecture',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
  {
    day: 112,
    title: 'The Blind Spot',
    description:
      "Forensics confirms the last vulnerability scan was performed 8 months prior. No continuous assessment program was in place.",
    domain: 6,
    domainColor: '#ec4899',
    domainName: 'Assessment & Testing',
    isUnlocked: true,
    caseFileStamp: 'CLASSIFIED',
  },
  {
    day: 134,
    title: 'Exfiltration Begins',
    description:
      '2.3 TB of sensitive data moved over 6 days via encrypted channels. Zero SIEM alerts fired. Log retention was only 30 days.',
    domain: 7,
    domainColor: '#f97316',
    domainName: 'Security Operations',
    isUnlocked: true,
    caseFileStamp: 'CLASSIFIED',
  },
  {
    day: 140,
    title: 'The Code Bomb',
    description:
      'SQL injection vulnerability in legacy payment portal exploited to extract financial records. No input validation, no WAF.',
    domain: 8,
    domainColor: '#a855f7',
    domainName: 'Software Development Security',
    isUnlocked: true,
    caseFileStamp: 'CLASSIFIED',
  },
  {
    day: 156,
    title: 'Discovery',
    description:
      'Third-party auditor conducting a routine compliance review detects anomalous outbound traffic patterns. Incident response initiated.',
    domain: 6,
    domainColor: '#ec4899',
    domainName: 'Assessment & Testing',
    isUnlocked: true,
    caseFileStamp: 'DECLASSIFIED',
  },
];

// ─── Sub-components ───────────────────────────────────────────────────────────

interface EventCardProps {
  event: TimelineEvent;
  index: number;
  isAbove: boolean;
  isVisible: boolean;
}

function EventCard({ event, index, isAbove, isVisible }: EventCardProps) {
  const isLocked = !event.isUnlocked;
  const isClassified = event.caseFileStamp === 'CLASSIFIED';

  return (
    <motion.div
      initial={{ opacity: 0, y: isAbove ? -24 : 24 }}
      animate={isVisible ? { opacity: 1, y: 0 } : { opacity: 0, y: isAbove ? -24 : 24 }}
      transition={{ duration: 0.5, delay: index * 0.08, ease: 'easeOut' }}
      className={`relative w-52 flex-shrink-0 ${isAbove ? 'mb-2' : 'mt-2'}`}
    >
      {/* Connector line to timeline */}
      <div
        className="absolute left-1/2 -translate-x-px w-px bg-amber-600/40"
        style={{
          height: '24px',
          bottom: isAbove ? '-24px' : undefined,
          top: isAbove ? undefined : '-24px',
        }}
      />

      {/* Card */}
      <div
        className={`
          relative rounded font-mono text-xs
          bg-amber-50/5 border border-amber-600/30
          ${isLocked ? 'opacity-40 grayscale' : ''}
        `}
        style={{ boxShadow: '0 2px 12px rgba(180,120,20,0.08)' }}
      >
        {/* Day badge */}
        <div className="absolute -top-2.5 left-3">
          <span
            className="px-2 py-0.5 rounded text-[10px] font-bold font-mono"
            style={{ background: '#7f1d1d', color: '#fca5a5', border: '1px solid #991b1b' }}
          >
            DAY {event.day}
          </span>
        </div>

        {/* Stamp */}
        <div
          className={`
            absolute -top-1 right-2 text-[9px] font-extrabold font-mono tracking-widest
            rotate-[-8deg] px-1 border-2 rounded-sm
            ${isClassified
              ? 'text-red-500/80 border-red-500/50'
              : 'text-green-500/70 border-green-500/40'}
          `}
        >
          {event.caseFileStamp}
        </div>

        <div className="p-3 pt-4">
          {/* Title */}
          <h3
            className="text-[11px] font-bold uppercase tracking-wide mb-1 leading-tight"
            style={{ color: '#d4b896' }}
          >
            {isLocked ? '[ REDACTED ]' : event.title}
          </h3>

          {/* Description */}
          {!isLocked && (
            <p className="text-[10px] leading-relaxed mb-2" style={{ color: '#a08060' }}>
              {event.description}
            </p>
          )}

          {/* Domain badge */}
          <div className="flex items-center gap-1.5 mt-1">
            <div
              className="w-2 h-2 rounded-full flex-shrink-0"
              style={{ background: event.domainColor }}
            />
            <span
              className="text-[9px] uppercase tracking-wider font-mono font-semibold"
              style={{ color: event.domainColor }}
            >
              D{event.domain} · {event.domainName}
            </span>
          </div>
        </div>
      </div>
    </motion.div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────────

interface ForensicTimelineProps {
  unlockedDomains?: number[];
}

export default function ForensicTimeline({ unlockedDomains }: ForensicTimelineProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const isInView = useInView(containerRef, { once: true, margin: '-80px' });

  const events = unlockedDomains
    ? BREACH_TIMELINE.map((e) => ({
        ...e,
        isUnlocked: unlockedDomains.includes(e.domain),
      }))
    : BREACH_TIMELINE;

  const aboveEvents = events.filter((_, i) => i % 2 === 0);
  const belowEvents = events.filter((_, i) => i % 2 !== 0);

  return (
    <div
      ref={containerRef}
      className="w-full overflow-x-auto pb-4"
      style={{ background: '#080c14' }}
    >
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: -16 }}
        animate={isInView ? { opacity: 1, y: 0 } : {}}
        transition={{ duration: 0.6 }}
        className="px-6 pt-6 pb-2 flex items-center gap-3"
      >
        <div className="flex items-center gap-2">
          {/* Red stencil-style title */}
          <span
            className="font-mono font-extrabold text-sm tracking-[0.25em] uppercase"
            style={{
              color: '#ef4444',
              textShadow: '0 0 12px rgba(239,68,68,0.4)',
              letterSpacing: '0.2em',
            }}
          >
            MERIDIAN GLOBAL BREACH
          </span>
          <span className="font-mono text-xs tracking-widest" style={{ color: '#7f1d1d' }}>
            — CASE FILE #MG-2026-001
          </span>
        </div>
        <div className="flex-1 h-px" style={{ background: '#7f1d1d' }} />
        <span
          className="font-mono text-[10px] tracking-widest px-2 py-0.5 border rounded"
          style={{ color: '#fca5a5', borderColor: '#991b1b', background: '#450a0a' }}
        >
          CONFIDENTIAL
        </span>
      </motion.div>

      {/* Scrollable timeline area */}
      <div className="min-w-max px-8 py-2">
        {/* Above-line cards (even indices) */}
        <div className="flex items-end gap-4 mb-0" style={{ minHeight: '160px' }}>
          {events.map((event, i) =>
            i % 2 === 0 ? (
              <EventCard
                key={event.day}
                event={event}
                index={i}
                isAbove={true}
                isVisible={isInView}
              />
            ) : (
              /* Spacer for odd slots */
              <div key={event.day} className="w-52 flex-shrink-0" />
            )
          )}
        </div>

        {/* Evidence tape / timeline line */}
        <div className="relative flex items-center" style={{ height: '28px' }}>
          {/* Main red tape */}
          <div
            className="absolute inset-x-0 top-1/2 -translate-y-1/2"
            style={{
              height: '6px',
              background:
                'repeating-linear-gradient(90deg, #7f1d1d 0px, #991b1b 8px, #7f1d1d 16px)',
              opacity: 0.9,
              boxShadow: '0 0 8px rgba(127,29,29,0.6)',
            }}
          />
          {/* Node dots */}
          {events.map((event, i) => (
            <div
              key={event.day}
              className="absolute flex items-center justify-center"
              style={{
                left: `calc(${(i / (events.length - 1)) * 100}% )`,
                transform: 'translateX(-50%)',
                zIndex: 2,
              }}
            >
              <div
                className="w-3 h-3 rounded-full border-2"
                style={{
                  background: event.isUnlocked ? event.domainColor : '#374151',
                  borderColor: event.isUnlocked ? event.domainColor : '#4b5563',
                  boxShadow: event.isUnlocked
                    ? `0 0 8px ${event.domainColor}88`
                    : undefined,
                }}
              />
            </div>
          ))}
        </div>

        {/* Below-line cards (odd indices) */}
        <div className="flex items-start gap-4 mt-0" style={{ minHeight: '160px' }}>
          {events.map((event, i) =>
            i % 2 !== 0 ? (
              <EventCard
                key={event.day}
                event={event}
                index={i}
                isAbove={false}
                isVisible={isInView}
              />
            ) : (
              /* Spacer for even slots */
              <div key={event.day} className="w-52 flex-shrink-0" />
            )
          )}
        </div>
      </div>

      {/* Footer legend */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={isInView ? { opacity: 1 } : {}}
        transition={{ duration: 0.6, delay: 0.8 }}
        className="px-6 pb-4 flex flex-wrap gap-3"
      >
        {Array.from(new Map(events.map((e) => [e.domain, e])).values()).map((e) => (
          <div key={e.domain} className="flex items-center gap-1.5">
            <div className="w-2 h-2 rounded-full" style={{ background: e.domainColor }} />
            <span className="font-mono text-[9px] uppercase tracking-wide" style={{ color: '#6b7280' }}>
              D{e.domain}
            </span>
          </div>
        ))}
      </motion.div>
    </div>
  );
}
