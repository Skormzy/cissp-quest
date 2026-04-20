'use client';

import { useEffect, useState, useRef } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Share2, ArrowRight, Trophy, Flame, Zap } from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

export interface IPassedCeremonyProps {
  score: number;
  domainsCompleted: number;
  totalXP: number;
  streakDays: number;
  onContinue: () => void;
  onShare: () => void;
}

// ─── Confetti particle ────────────────────────────────────────────────────

interface Particle {
  id: number;
  x: number;
  color: string;
  size: number;
  duration: number;
  delay: number;
  shape: 'circle' | 'rect';
  rotationEnd: number;
}

const CONFETTI_COLORS = [
  '#00e8ff', '#ffd700', '#22c55e', '#f97316', '#8b5cf6',
  '#ec4899', '#06b6d4', '#eab308', '#ef4444', '#a3e635',
];

function generateParticles(count: number): Particle[] {
  return Array.from({ length: count }, (_, i) => ({
    id: i,
    x: Math.random() * 100,
    color: CONFETTI_COLORS[Math.floor(Math.random() * CONFETTI_COLORS.length)],
    size: Math.random() * 8 + 5,
    duration: Math.random() * 2 + 2.5,
    delay: Math.random() * 1.2,
    shape: Math.random() > 0.5 ? 'circle' : 'rect',
    rotationEnd: (Math.random() - 0.5) * 720,
  }));
}

function Confetti() {
  const [particles] = useState(() => generateParticles(50));

  return (
    <div className="fixed inset-0 pointer-events-none overflow-hidden z-40">
      {particles.map((p) => (
        <motion.div
          key={p.id}
          className="absolute top-0"
          style={{
            left: `${p.x}%`,
            width: p.size,
            height: p.shape === 'rect' ? p.size * 0.5 : p.size,
            borderRadius: p.shape === 'circle' ? '50%' : 2,
            background: p.color,
          }}
          initial={{ y: -20, opacity: 1, rotate: 0, scale: 1 }}
          animate={{
            y: ['0vh', '110vh'],
            opacity: [1, 1, 0.8, 0],
            rotate: p.rotationEnd,
            x: [(Math.random() - 0.5) * 80, (Math.random() - 0.5) * 160],
          }}
          transition={{
            duration: p.duration,
            delay: p.delay,
            ease: 'easeIn',
            repeat: 1,
            repeatDelay: 0.5,
          }}
        />
      ))}
    </div>
  );
}

// ─── Stamp ────────────────────────────────────────────────────────────────

function CISSPStamp() {
  return (
    <motion.div
      className="relative flex items-center justify-center"
      initial={{ rotateY: 0, scale: 0.3, opacity: 0 }}
      animate={{ rotateY: [0, 360, 720], scale: [0.3, 1.15, 1], opacity: [0, 1, 1] }}
      transition={{ duration: 1.2, ease: [0.25, 0.46, 0.45, 0.94], times: [0, 0.7, 1] }}
    >
      {/* Outer glow ring */}
      <motion.div
        className="absolute rounded-full"
        style={{
          width: 200,
          height: 200,
          background: 'radial-gradient(circle, rgba(0,232,255,0.2) 0%, transparent 70%)',
        }}
        animate={{ scale: [1, 1.15, 1] }}
        transition={{ repeat: Infinity, duration: 2.5, ease: 'easeInOut' }}
      />

      {/* Stamp circle */}
      <motion.div
        className="relative flex flex-col items-center justify-center rounded-full"
        style={{
          width: 180,
          height: 180,
          border: '4px solid #00e8ff',
          background: 'rgba(0,232,255,0.06)',
          boxShadow: '0 0 40px rgba(0,232,255,0.4), inset 0 0 20px rgba(0,232,255,0.08)',
        }}
        animate={{
          boxShadow: [
            '0 0 40px rgba(0,232,255,0.4), inset 0 0 20px rgba(0,232,255,0.08)',
            '0 0 80px rgba(0,232,255,0.6), inset 0 0 30px rgba(0,232,255,0.15)',
            '0 0 40px rgba(0,232,255,0.4), inset 0 0 20px rgba(0,232,255,0.08)',
          ],
        }}
        transition={{ repeat: Infinity, duration: 2.2, ease: 'easeInOut' }}
      >
        <div
          className="text-xs font-black uppercase tracking-[0.25em] mb-1"
          style={{ color: '#00e8ff' }}
        >
          Practice
        </div>
        <div
          className="text-3xl font-black uppercase tracking-[0.15em]"
          style={{ color: '#00e8ff', textShadow: '0 0 16px rgba(0,232,255,0.8)' }}
        >
          CISSP
        </div>
        <div
          className="text-sm font-black uppercase tracking-[0.25em] mt-1"
          style={{ color: '#00e8ff' }}
        >
          Certified
        </div>
        <div
          className="absolute bottom-5 text-[10px] uppercase tracking-[0.15em]"
          style={{ color: 'rgba(0,232,255,0.5)' }}
        >
          (ISC)²
        </div>
      </motion.div>
    </motion.div>
  );
}

// ─── NPC card ─────────────────────────────────────────────────────────────

interface NPCData {
  initials: string;
  name: string;
  role: string;
  color: string;
  message: string;
}

const NPC_CAST: NPCData[] = [
  {
    initials: 'KT',
    name: 'Dr. Kai Tanaka',
    role: 'Threat Intelligence',
    color: '#22c55e',
    message: 'I always knew you had the mindset of a true security professional.',
  },
  {
    initials: 'MW',
    name: 'Marcus Webb',
    role: 'Field Operations',
    color: '#f97316',
    message: 'Damn. Solid work. That threat modeling section was no joke.',
  },
  {
    initials: 'PS',
    name: 'Priya Sharma',
    role: 'Risk & Compliance',
    color: '#8b5cf6',
    message: 'Welcome to the field. We need more people who think this way.',
  },
  {
    initials: 'EV',
    name: 'Elena Vasquez',
    role: 'Legal & Governance',
    color: '#06b6d4',
    message: 'For the record, I\'ll need that in writing. Congratulations.',
  },
];

function NPCCard({ npc, index }: { npc: NPCData; index: number }) {
  return (
    <motion.div
      className="flex items-start gap-3 rounded-xl p-3"
      style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
      initial={{ opacity: 0, x: -32 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ delay: 1.6 + index * 0.18, duration: 0.45, ease: 'easeOut' }}
    >
      <div
        className="shrink-0 w-9 h-9 rounded-full flex items-center justify-center text-xs font-black"
        style={{ background: npc.color, color: '#fff' }}
      >
        {npc.initials}
      </div>
      <div className="min-w-0">
        <div className="flex items-baseline gap-1.5 flex-wrap">
          <span className="text-xs font-bold" style={{ color: '#e2e8f0' }}>{npc.name}</span>
          <span className="text-xs" style={{ color: '#475569' }}>· {npc.role}</span>
        </div>
        <p className="text-xs leading-relaxed mt-0.5" style={{ color: '#94a3b8' }}>
          "{npc.message}"
        </p>
      </div>
    </motion.div>
  );
}

// ─── Stats card ───────────────────────────────────────────────────────────

function StatsCard({
  domainsCompleted,
  totalXP,
  streakDays,
}: {
  domainsCompleted: number;
  totalXP: number;
  streakDays: number;
}) {
  const stats = [
    { icon: Trophy, label: 'Domains Mastered', value: `${domainsCompleted}/8`, color: '#ffd700' },
    { icon: Zap, label: 'Total XP', value: totalXP.toLocaleString(), color: '#00e8ff' },
    { icon: Flame, label: 'Study Streak', value: `${streakDays} days`, color: '#f97316' },
  ];

  return (
    <motion.div
      className="grid grid-cols-3 gap-3"
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 2.4, duration: 0.4 }}
    >
      {stats.map(({ icon: Icon, label, value, color }) => (
        <div
          key={label}
          className="flex flex-col items-center gap-1 rounded-xl p-3 text-center"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
        >
          <Icon size={18} style={{ color }} />
          <span className="text-lg font-black" style={{ color: '#e2e8f0' }}>{value}</span>
          <span className="text-[10px] uppercase tracking-wide leading-tight" style={{ color: '#64748b' }}>
            {label}
          </span>
        </div>
      ))}
    </motion.div>
  );
}

// ─── Clipboard toast ──────────────────────────────────────────────────────

function CopiedToast({ visible }: { visible: boolean }) {
  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          className="fixed bottom-8 left-1/2 -translate-x-1/2 px-5 py-2.5 rounded-xl text-sm font-semibold z-[60]"
          style={{ background: '#22c55e', color: '#fff' }}
          initial={{ opacity: 0, y: 16, scale: 0.9 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          exit={{ opacity: 0, y: 8, scale: 0.9 }}
          transition={{ type: 'spring', stiffness: 220 }}
        >
          Copied to clipboard!
        </motion.div>
      )}
    </AnimatePresence>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function IPassedCeremony({
  score,
  domainsCompleted,
  totalXP,
  streakDays,
  onContinue,
  onShare,
}: IPassedCeremonyProps) {
  const [copied, setCopied] = useState(false);
  const hasFiredRef = useRef(false);

  // Fire onShare callback on mount (once)
  useEffect(() => {
    if (!hasFiredRef.current) {
      hasFiredRef.current = true;
    }
  }, []);

  const handleShare = async () => {
    const text =
      `I just passed my CISSP practice exam on CISSP Quest! 🎯 After ${streakDays} days of study, ${totalXP.toLocaleString()} XP earned, and learning from the Meridian Global breach investigation. If you're studying for CISSP, check out https://cissquest.com. #CISSP #Cybersecurity #ISC2`;

    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2500);
    } catch {
      // Fallback: fire onShare prop
    }
    onShare();
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-4 overflow-y-auto"
      style={{ background: 'rgba(8,12,20,0.97)' }}
    >
      {/* Confetti */}
      <Confetti />

      {/* Center card */}
      <motion.div
        className="relative w-full max-w-lg mx-auto flex flex-col items-center gap-6 py-10"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.3 }}
      >
        {/* Stamp */}
        <CISSPStamp />

        {/* Score */}
        <motion.div
          className="text-center"
          initial={{ opacity: 0, scale: 0.7 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 1.0, duration: 0.5, type: 'spring', stiffness: 180 }}
        >
          <div
            className="text-7xl font-black tabular-nums"
            style={{
              color: '#ffd700',
              textShadow: '0 0 40px rgba(255,215,0,0.5)',
            }}
          >
            {score}%
          </div>
          <div
            className="text-sm font-bold uppercase tracking-widest mt-1"
            style={{ color: '#94a3b8' }}
          >
            Practice Exam Score
          </div>
        </motion.div>

        {/* NPC messages */}
        <motion.div
          className="w-full space-y-2"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 1.4 }}
        >
          <p className="text-xs uppercase tracking-widest font-bold mb-3 text-center" style={{ color: '#475569' }}>
            Your team weighs in
          </p>
          {NPC_CAST.map((npc, i) => (
            <NPCCard key={npc.initials} npc={npc} index={i} />
          ))}
        </motion.div>

        {/* Stats */}
        <div className="w-full">
          <StatsCard
            domainsCompleted={domainsCompleted}
            totalXP={totalXP}
            streakDays={streakDays}
          />
        </div>

        {/* Action buttons */}
        <motion.div
          className="flex flex-col sm:flex-row gap-3 w-full"
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 2.8, duration: 0.4 }}
        >
          <button
            onClick={handleShare}
            className="flex-1 flex items-center justify-center gap-2 rounded-xl py-3 text-sm font-bold transition-all hover:opacity-90"
            style={{
              background: 'transparent',
              border: '1px solid #1e4a8a',
              color: '#60a5fa',
            }}
          >
            <Share2 size={16} />
            Share on LinkedIn
          </button>
          <button
            onClick={onContinue}
            className="flex-1 flex items-center justify-center gap-2 rounded-xl py-3 text-sm font-bold transition-all hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            Continue Studying
            <ArrowRight size={16} />
          </button>
        </motion.div>
      </motion.div>

      {/* Copied toast */}
      <CopiedToast visible={copied} />
    </div>
  );
}
