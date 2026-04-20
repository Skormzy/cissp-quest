'use client';

import { useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Slider } from '@/components/ui/slider';
import { Brain, ChevronDown } from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

interface SliderValue {
  value?: number[];
  onValueChange?: (value: number[]) => void;
}

// ─── Preset Scenarios ─────────────────────────────────────────────────────

const SCENARIOS = [
  {
    label: 'Data Breach (PII)',
    av: 5_000_000,
    aro: 0.25,
    ef: 0.40,
    description: 'Unauthorized access to customer database exposing 50K records',
  },
  {
    label: 'Ransomware Attack',
    av: 2_000_000,
    aro: 0.35,
    ef: 0.65,
    description: 'Full system encryption; 3 days downtime + recovery costs',
  },
  {
    label: 'Physical Theft',
    av: 150_000,
    aro: 0.10,
    ef: 0.30,
    description: 'Laptop with unencrypted sensitive data stolen from office',
  },
  {
    label: 'Insider Threat',
    av: 8_000_000,
    aro: 0.05,
    ef: 0.20,
    description: 'Disgruntled employee exfiltrates IP or sabotages systems',
  },
  {
    label: 'DDoS Attack',
    av: 500_000,
    aro: 0.60,
    ef: 0.15,
    description: 'E-commerce site taken offline; revenue and reputation impact',
  },
] as const;

// ─── Risk Level Config ────────────────────────────────────────────────────

function getRiskLevel(ale: number) {
  if (ale > 1_000_000) return { label: 'Critical', color: '#ef4444', bg: 'rgba(239,68,68,0.12)' };
  if (ale > 100_000)  return { label: 'High',     color: '#f97316', bg: 'rgba(249,115,22,0.12)' };
  if (ale > 10_000)   return { label: 'Medium',   color: '#eab308', bg: 'rgba(234,179,8,0.12)' };
  return                     { label: 'Low',      color: '#22c55e', bg: 'rgba(34,197,94,0.12)' };
}

// ─── Currency formatter ───────────────────────────────────────────────────

const fmt = (n: number) =>
  n >= 1_000_000
    ? `$${(n / 1_000_000).toFixed(2)}M`
    : n >= 1_000
    ? `$${(n / 1_000).toFixed(1)}K`
    : `$${n.toFixed(0)}`;

const fmtFull = (n: number) =>
  new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', maximumFractionDigits: 0 }).format(n);

// ─── Gauge Component ──────────────────────────────────────────────────────

function RiskGauge({ ale }: { ale: number }) {
  const max = 2_000_000;
  const pct = Math.min((ale / max) * 100, 100);
  const risk = getRiskLevel(ale);

  return (
    <div className="space-y-2">
      <div className="flex justify-between text-xs" style={{ color: '#64748b' }}>
        <span>$0</span>
        <span>$2M+</span>
      </div>
      <div className="relative h-3 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
        <motion.div
          className="absolute inset-y-0 left-0 rounded-full"
          style={{
            background: `linear-gradient(90deg, #22c55e, #eab308, #f97316, #ef4444)`,
            width: `100%`,
            clipPath: `inset(0 ${100 - pct}% 0 0 round 999px)`,
          }}
          animate={{ clipPath: `inset(0 ${100 - pct}% 0 0 round 999px)` }}
          transition={{ duration: 0.5, ease: 'easeOut' }}
        />
      </div>
      <div className="flex justify-center">
        <motion.span
          className="px-3 py-1 rounded-full text-sm font-bold"
          style={{ background: risk.bg, color: risk.color }}
          layout
        >
          {risk.label} Risk — {fmt(ale)} / year
        </motion.span>
      </div>
    </div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function RiskCalculator() {
  const [av, setAv] = useState(1_000_000);
  const [aro, setAro] = useState(0.25);
  const [ef, setEf] = useState(0.30);
  const [selectedScenario, setSelectedScenario] = useState<number | null>(null);
  const [showScenarios, setShowScenarios] = useState(false);

  const sle = av * ef;
  const ale = sle * aro;
  const risk = getRiskLevel(ale);

  const applyScenario = (idx: number) => {
    const s = SCENARIOS[idx];
    setAv(s.av);
    setAro(s.aro);
    setEf(s.ef);
    setSelectedScenario(idx);
    setShowScenarios(false);
  };

  return (
    <div
      className="rounded-2xl overflow-hidden w-full max-w-2xl mx-auto"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-6 pt-6 pb-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Risk Calculator</h2>
            <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>ALE = Asset Value × ARO × Exposure Factor</p>
          </div>
          <span
            className="px-2.5 py-1 rounded-lg text-xs font-bold"
            style={{ background: 'rgba(6,182,212,0.12)', color: '#06b6d4', border: '1px solid #06b6d444' }}
          >
            Domain 1 — Risk Management
          </span>
        </div>
      </div>

      {/* Scenario picker */}
      <div className="px-6 pt-4">
        <button
          className="w-full flex items-center justify-between px-4 py-2.5 rounded-xl text-sm transition-colors"
          style={{ background: '#111827', border: '1px solid #1e2d4a', color: '#94a3b8' }}
          onClick={() => setShowScenarios((v) => !v)}
        >
          <span>
            {selectedScenario !== null ? SCENARIOS[selectedScenario].label : 'Load a preset scenario…'}
          </span>
          <ChevronDown
            size={15}
            style={{ transform: showScenarios ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.2s' }}
          />
        </button>
        <AnimatePresence>
          {showScenarios && (
            <motion.div
              className="mt-1 rounded-xl overflow-hidden"
              style={{ border: '1px solid #1e2d4a' }}
              initial={{ opacity: 0, height: 0 }}
              animate={{ opacity: 1, height: 'auto' }}
              exit={{ opacity: 0, height: 0 }}
              transition={{ duration: 0.2 }}
            >
              {SCENARIOS.map((s, i) => (
                <button
                  key={i}
                  className="w-full flex flex-col items-start px-4 py-3 text-left transition-colors hover:bg-white/5"
                  style={{ borderBottom: i < SCENARIOS.length - 1 ? '1px solid #1e2d4a' : 'none', background: '#0d1220' }}
                  onClick={() => applyScenario(i)}
                >
                  <span className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>{s.label}</span>
                  <span className="text-xs mt-0.5" style={{ color: '#64748b' }}>{s.description}</span>
                </button>
              ))}
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Sliders */}
      <div className="px-6 pt-5 space-y-6">
        {/* Asset Value */}
        <div className="space-y-2">
          <div className="flex justify-between items-center">
            <label className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>Asset Value (AV)</label>
            <motion.span className="text-sm font-mono font-bold" style={{ color: '#00e8ff' }} layout>
              {fmtFull(av)}
            </motion.span>
          </div>
          <Slider
            min={10000}
            max={10000000}
            value={[av]}
            onValueChange={(v) => { setAv((v as number[])[0]); setSelectedScenario(null); }}
          />
          <p className="text-xs" style={{ color: '#475569' }}>What is the total value of this asset?</p>
        </div>

        {/* ARO */}
        <div className="space-y-2">
          <div className="flex justify-between items-center">
            <label className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>
              Annual Rate of Occurrence (ARO)
            </label>
            <motion.span className="text-sm font-mono font-bold" style={{ color: '#eab308' }} layout>
              {(aro * 100).toFixed(0)}% / year
            </motion.span>
          </div>
          <Slider
            min={0}
            max={200}
            value={[Math.round(aro * 100)]}
            onValueChange={(v) => { setAro((v as number[])[0] / 100); setSelectedScenario(null); }}
          />
          <p className="text-xs" style={{ color: '#475569' }}>How often does this threat occur per year? (&gt;100% = multiple times)</p>
        </div>

        {/* EF */}
        <div className="space-y-2">
          <div className="flex justify-between items-center">
            <label className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>
              Exposure Factor (EF)
            </label>
            <motion.span className="text-sm font-mono font-bold" style={{ color: '#f97316' }} layout>
              {(ef * 100).toFixed(0)}%
            </motion.span>
          </div>
          <Slider
            min={0}
            max={100}
            value={[Math.round(ef * 100)]}
            onValueChange={(v) => { setEf((v as number[])[0] / 100); setSelectedScenario(null); }}
          />
          <p className="text-xs" style={{ color: '#475569' }}>What % of asset value is lost in a single incident?</p>
        </div>
      </div>

      {/* Results */}
      <div className="px-6 pt-6 pb-2 space-y-3">
        <div className="grid grid-cols-2 gap-3">
          <div className="rounded-xl p-4" style={{ background: '#111827', border: '1px solid #1e2d4a' }}>
            <p className="text-xs mb-1" style={{ color: '#64748b' }}>SLE (Single Loss Expectancy)</p>
            <p className="text-xs mb-1" style={{ color: '#475569' }}>AV × EF</p>
            <motion.p className="text-xl font-bold" style={{ color: '#e2e8f0' }} layout>
              {fmtFull(sle)}
            </motion.p>
          </div>
          <div
            className="rounded-xl p-4"
            style={{ background: risk.bg, border: `1px solid ${risk.color}44` }}
          >
            <p className="text-xs mb-1" style={{ color: '#64748b' }}>ALE (Annual Loss Expectancy)</p>
            <p className="text-xs mb-1" style={{ color: '#475569' }}>SLE × ARO</p>
            <motion.p className="text-xl font-bold" style={{ color: risk.color }} layout>
              {fmtFull(ale)}
            </motion.p>
          </div>
        </div>

        {/* Gauge */}
        <RiskGauge ale={ale} />

        {/* Countermeasure note */}
        <div className="rounded-xl p-4" style={{ background: '#111827', border: '1px solid #1e2d4a' }}>
          <p className="text-xs font-semibold mb-1" style={{ color: '#94a3b8' }}>Countermeasure Breakeven</p>
          <p className="text-sm" style={{ color: '#e2e8f0' }}>
            A control is justified if its annual cost is less than{' '}
            <span className="font-bold" style={{ color: risk.color }}>{fmtFull(ale)}</span>.
            Spend up to <span className="font-bold" style={{ color: '#00e8ff' }}>{fmtFull(ale * 0.9)}</span>{' '}
            for a 10% safety margin.
          </p>
        </div>
      </div>

      {/* Memory hack */}
      <div className="px-6 pb-6 pt-2">
        <div
          className="flex gap-3 rounded-xl p-4"
          style={{ background: 'rgba(0,232,255,0.05)', borderLeft: '3px solid #00e8ff' }}
        >
          <Brain size={16} className="shrink-0 mt-0.5" style={{ color: '#00e8ff' }} />
          <div>
            <p className="text-xs font-bold uppercase tracking-wider mb-1" style={{ color: '#00e8ff' }}>
              Memory Hack
            </p>
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              <strong style={{ color: '#e2e8f0' }}>ALE = AV × ARO × EF</strong>. Ask yourself three questions:
              "How much is the asset worth? (AV) How often does bad stuff happen? (ARO) How badly does each
              incident hurt? (EF)." Multiply all three and you have your annual expected loss.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
