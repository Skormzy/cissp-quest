'use client';

import { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

// ─── Types ─────────────────────────────────────────────────────────────────────

interface Headline {
  id: number;
  text: string;
  source: string;
  time: string;
  isBreaking: boolean;
  actUnlock: number;
}

// ─── Data ─────────────────────────────────────────────────────────────────────

const CRISIS_HEADLINES: Headline[] = [
  // Act 1 — Initial breach surface
  {
    id: 1,
    text: 'Meridian Global Confirms Security Incident, Shares Fall 12%',
    source: '[REUTERS]',
    time: '08:14 EST',
    isBreaking: true,
    actUnlock: 1,
  },
  {
    id: 2,
    text: 'BREAKING: Major Financial Firm Reports Unauthorized Data Access',
    source: '[AP]',
    time: '08:47 EST',
    isBreaking: true,
    actUnlock: 1,
  },
  // Act 2 — Data classification & governance
  {
    id: 3,
    text: 'Regulators Question Meridian Data Classification Practices',
    source: '[BLOOMBERG]',
    time: '09:22 EST',
    isBreaking: false,
    actUnlock: 2,
  },
  {
    id: 4,
    text: 'EU Watchdog Opens GDPR Investigation Into Meridian Global',
    source: '[REUTERS]',
    time: '10:05 EST',
    isBreaking: false,
    actUnlock: 2,
  },
  // Act 3 — Architecture revelations
  {
    id: 5,
    text: "Security Experts: Meridian Network Design 'A Decade Behind'",
    source: '[WIRED]',
    time: '11:30 EST',
    isBreaking: false,
    actUnlock: 3,
  },
  {
    id: 6,
    text: 'Flat Network Architecture Named in Meridian Breach Report',
    source: '[ZDNET]',
    time: '12:18 EST',
    isBreaking: false,
    actUnlock: 3,
  },
  // Act 4 — Supply chain / comms & network
  {
    id: 7,
    text: 'Telecom Partners Scrutinized in Meridian Supply Chain Review',
    source: '[FT]',
    time: '13:02 EST',
    isBreaking: false,
    actUnlock: 4,
  },
  {
    id: 8,
    text: 'VPN Credentials Linked to Meridian Breach, Sources Say',
    source: '[BLOOMBERG]',
    time: '13:44 EST',
    isBreaking: true,
    actUnlock: 4,
  },
  // Act 5 — Insider threat / identity
  {
    id: 9,
    text: 'Insider Threat Suspected in Meridian Data Exfiltration',
    source: '[WSJ]',
    time: '14:11 EST',
    isBreaking: false,
    actUnlock: 5,
  },
  {
    id: 10,
    text: "Former Contractor 'Ghost' Holloway Sought for Questioning",
    source: '[AP]',
    time: '14:32 EST',
    isBreaking: true,
    actUnlock: 5,
  },
  // Act 6 — Assessment gaps
  {
    id: 11,
    text: "Meridian's Last Pentest: 8 Months Before the Breach",
    source: '[KREBS]',
    time: '15:00 EST',
    isBreaking: false,
    actUnlock: 6,
  },
  {
    id: 12,
    text: 'Assessment Firm Defends Report Quality Amid Scrutiny',
    source: '[REUTERS]',
    time: '15:22 EST',
    isBreaking: false,
    actUnlock: 6,
  },
  // Act 7 — Operations / SOC failure
  {
    id: 13,
    text: 'SOC Logs Show 6-Day Exfiltration Window Went Undetected',
    source: '[DARKREAD]',
    time: '16:08 EST',
    isBreaking: true,
    actUnlock: 7,
  },
  {
    id: 14,
    text: 'Meridian CISO Resigns Amid Breach Investigation',
    source: '[BLOOMBERG]',
    time: '16:45 EST',
    isBreaking: true,
    actUnlock: 7,
  },
  // Act 8 — Software root cause
  {
    id: 15,
    text: 'SQL Injection Cited as Root Cause in Meridian Breach Report',
    source: '[ARS]',
    time: '17:14 EST',
    isBreaking: false,
    actUnlock: 8,
  },
  {
    id: 16,
    text: "Legacy Payment Portal: The $2.3B Mistake",
    source: '[FT]',
    time: '17:50 EST',
    isBreaking: false,
    actUnlock: 8,
  },
  // General — always visible
  {
    id: 17,
    text: 'CISSP Exam Registration Up 40% Following High-Profile Breaches',
    source: '[ISC2]',
    time: '18:05 EST',
    isBreaking: false,
    actUnlock: 1,
  },
  {
    id: 18,
    text: 'ISC² Report: Security Manager Shortage Reaches Critical Level',
    source: '[ISC2]',
    time: '18:30 EST',
    isBreaking: false,
    actUnlock: 1,
  },
  // Extras — padding to keep ticker alive at low act counts
  {
    id: 19,
    text: 'Meridian Global CEO Issues Statement: "We Take This Very Seriously"',
    source: '[AP]',
    time: '09:58 EST',
    isBreaking: false,
    actUnlock: 1,
  },
  {
    id: 20,
    text: 'Law Enforcement Agencies Coordinate Response to Meridian Incident',
    source: '[REUTERS]',
    time: '10:40 EST',
    isBreaking: false,
    actUnlock: 1,
  },
];

// ─── Sub-component: single ticker row ─────────────────────────────────────────

function HeadlineRow({ headline }: { headline: Headline }) {
  return (
    <div className="flex items-baseline gap-2 py-1.5 px-3 border-b border-white/5">
      <span
        className="font-mono text-[9px] flex-shrink-0 tabular-nums"
        style={{ color: '#4a5568' }}
      >
        {headline.time}
      </span>
      <span
        className="font-mono text-[9px] font-semibold flex-shrink-0"
        style={{ color: headline.isBreaking ? '#ef4444' : '#00e8ff80' }}
      >
        {headline.source}
      </span>
      <span
        className="font-mono text-[11px] leading-snug"
        style={{
          color: headline.isBreaking ? '#fca5a5' : '#94a3b8',
          ...(headline.isBreaking && {
            textShadow: '0 0 8px rgba(239,68,68,0.3)',
          }),
        }}
      >
        {headline.text}
      </span>
    </div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────────

export interface CrisisWireProps {
  currentAct?: number;
}

export default function CrisisWire({ currentAct = 1 }: CrisisWireProps) {
  const visibleHeadlines = CRISIS_HEADLINES.filter((h) => h.actUnlock <= currentAct);

  const [activeIndex, setActiveIndex] = useState(0);
  const [blink, setBlink] = useState(true);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);

  // Cycle active headline every 4 seconds
  useEffect(() => {
    if (visibleHeadlines.length === 0) return;

    intervalRef.current = setInterval(() => {
      setActiveIndex((prev) => (prev + 1) % visibleHeadlines.length);
    }, 4000);

    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
  }, [visibleHeadlines.length]);

  // Blinking red dot
  useEffect(() => {
    const t = setInterval(() => setBlink((b) => !b), 700);
    return () => clearInterval(t);
  }, []);

  // Show a sliding window of 3 headlines centered on activeIndex
  const windowSize = 3;
  const displayIndices: number[] = [];
  for (let i = 0; i < windowSize; i++) {
    displayIndices.push((activeIndex + i) % Math.max(visibleHeadlines.length, 1));
  }

  if (visibleHeadlines.length === 0) {
    return (
      <div
        className="rounded border"
        style={{
          background: 'rgba(0,0,0,0.8)',
          borderColor: 'rgba(0,232,255,0.2)',
          height: '200px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <span className="font-mono text-xs" style={{ color: '#4a5568' }}>
          No transmissions intercepted.
        </span>
      </div>
    );
  }

  return (
    <div
      className="rounded flex flex-col"
      style={{
        background: 'rgba(0,0,0,0.85)',
        border: '1px solid rgba(0,232,255,0.25)',
        height: '200px',
        overflow: 'hidden',
      }}
    >
      {/* Header bar */}
      <div
        className="flex items-center gap-2 px-3 py-2 flex-shrink-0"
        style={{
          background: 'rgba(0,0,0,0.6)',
          borderBottom: '1px solid rgba(0,232,255,0.15)',
        }}
      >
        {/* Blinking dot */}
        <div
          className="w-2 h-2 rounded-full flex-shrink-0 transition-opacity duration-150"
          style={{
            background: '#ef4444',
            opacity: blink ? 1 : 0.2,
            boxShadow: blink ? '0 0 6px #ef4444' : undefined,
          }}
        />
        <span
          className="font-mono text-[10px] font-extrabold tracking-[0.2em] uppercase"
          style={{ color: '#00e8ff' }}
        >
          Crisis Wire
        </span>
        <div className="flex-1" />
        <span className="font-mono text-[9px]" style={{ color: '#374151' }}>
          ACT {currentAct} / 8
        </span>
        <div
          className="font-mono text-[9px] px-1.5 py-0.5 rounded"
          style={{
            background: '#7f1d1d',
            color: '#fca5a5',
            border: '1px solid #991b1b',
          }}
        >
          LIVE
        </div>
      </div>

      {/* Ticker — fixed height, overflow hidden */}
      <div className="flex-1 overflow-hidden relative">
        <AnimatePresence mode="popLayout">
          {displayIndices.map((idx, slot) => {
            const headline = visibleHeadlines[idx];
            return (
              <motion.div
                key={`${headline.id}-${slot}-${activeIndex}`}
                initial={{ opacity: 0, y: 32 }}
                animate={{ opacity: slot === 0 ? 1 : 0.55 - slot * 0.15, y: 0 }}
                exit={{ opacity: 0, y: -32 }}
                transition={{ duration: 0.35, ease: 'easeOut' }}
                style={{ position: 'absolute', top: `${slot * 56}px`, left: 0, right: 0 }}
              >
                <HeadlineRow headline={headline} />
              </motion.div>
            );
          })}
        </AnimatePresence>
      </div>

      {/* Footer: progress dots */}
      <div
        className="flex items-center justify-center gap-1 py-1.5 flex-shrink-0"
        style={{ borderTop: '1px solid rgba(0,232,255,0.08)' }}
      >
        {visibleHeadlines.map((_, i) => (
          <button
            key={i}
            onClick={() => setActiveIndex(i)}
            className="transition-all duration-200"
            style={{
              width: i === activeIndex ? '12px' : '4px',
              height: '4px',
              borderRadius: '9999px',
              background: i === activeIndex ? '#00e8ff' : '#1e2d4a',
              border: 'none',
              padding: 0,
              cursor: 'pointer',
            }}
            aria-label={`Go to headline ${i + 1}`}
          />
        ))}
      </div>
    </div>
  );
}
