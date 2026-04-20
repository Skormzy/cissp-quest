'use client';

import { useState, useEffect, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Calendar, Lock, Clock } from 'lucide-react';
import { cn } from '@/lib/utils';

// ─── Types ────────────────────────────────────────────────────────────────

interface ExamCountdownProps {
  examDate?: string | null;
  onSetDate?: (date: string) => void;
}

interface TimeLeft {
  days: number;
  hours: number;
  minutes: number;
  seconds: number;
  totalDays: number;
}

// ─── Study pace helper ────────────────────────────────────────────────────

function getStudyPace(days: number): { text: string; color: string; urgency: number } {
  if (days >= 60) return {
    text: 'Balanced pace — you\'re on track. Cover all 8 domains systematically.',
    color: '#22c55e',
    urgency: 0,
  };
  if (days >= 30) return {
    text: 'Accelerate — focus your 3 weakest domains now.',
    color: '#eab308',
    urgency: 1,
  };
  if (days >= 14) return {
    text: 'Heavy practice exam mode — aim for 200+ questions daily.',
    color: '#f97316',
    urgency: 2,
  };
  if (days >= 7) return {
    text: 'Review & reinforce only — no new concepts.',
    color: '#ef4444',
    urgency: 3,
  };
  return {
    text: 'Final stretch — light review, rest, and trust your preparation.',
    color: '#ec4899',
    urgency: 4,
  };
}

// ─── Circular progress arc ────────────────────────────────────────────────

function CircularArc({ pct }: { pct: number }) {
  const r = 54;
  const cx = 64;
  const cy = 64;
  const circumference = 2 * Math.PI * r;
  const dashOffset = circumference * (1 - pct / 100);

  return (
    <svg width="128" height="128" viewBox="0 0 128 128" className="rotate-[-90deg]">
      {/* Track */}
      <circle cx={cx} cy={cy} r={r} fill="none" stroke="#1e2d4a" strokeWidth="8" />
      {/* Progress */}
      <motion.circle
        cx={cx}
        cy={cy}
        r={r}
        fill="none"
        stroke="#00e8ff"
        strokeWidth="8"
        strokeLinecap="round"
        strokeDasharray={circumference}
        initial={{ strokeDashoffset: circumference }}
        animate={{ strokeDashoffset: dashOffset }}
        transition={{ duration: 1.2, ease: 'easeOut' }}
        style={{ filter: 'drop-shadow(0 0 6px rgba(0,232,255,0.6))' }}
      />
    </svg>
  );
}

// ─── Flip digit ───────────────────────────────────────────────────────────

function FlipDigit({ value, label }: { value: number; label: string }) {
  const padded = String(value).padStart(2, '0');

  return (
    <div className="flex flex-col items-center gap-1">
      <div
        className="relative rounded-xl overflow-hidden flex items-center justify-center"
        style={{
          width: 72,
          height: 80,
          background: '#111a2e',
          border: '1px solid #1e2d4a',
          perspective: 400,
        }}
      >
        {/* Divider line */}
        <div
          className="absolute left-0 right-0 top-1/2 h-px z-10"
          style={{ background: '#0d1626' }}
        />
        <AnimatePresence mode="popLayout">
          <motion.span
            key={padded}
            className="text-4xl font-black tabular-nums"
            style={{ color: '#00e8ff', textShadow: '0 0 20px rgba(0,232,255,0.5)' }}
            initial={{ rotateX: -90, opacity: 0 }}
            animate={{ rotateX: 0, opacity: 1 }}
            exit={{ rotateX: 90, opacity: 0 }}
            transition={{ duration: 0.35, ease: 'easeOut' }}
          >
            {padded}
          </motion.span>
        </AnimatePresence>
      </div>
      <span className="text-xs font-semibold uppercase tracking-widest" style={{ color: '#475569' }}>
        {label}
      </span>
    </div>
  );
}

// ─── Set date panel ───────────────────────────────────────────────────────

function SetDatePanel({ onSetDate }: { onSetDate?: (date: string) => void }) {
  const [input, setInput] = useState('');

  // Default min: tomorrow
  const tomorrow = new Date();
  tomorrow.setDate(tomorrow.getDate() + 1);
  const minDate = tomorrow.toISOString().split('T')[0];

  const handleSubmit = () => {
    if (input && onSetDate) onSetDate(input);
  };

  return (
    <motion.div
      className="flex flex-col items-center gap-6 py-8"
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4 }}
    >
      <div className="flex flex-col items-center gap-2">
        <div
          className="w-14 h-14 rounded-2xl flex items-center justify-center"
          style={{ background: 'rgba(0,232,255,0.1)', border: '1px solid rgba(0,232,255,0.25)' }}
        >
          <Calendar size={26} style={{ color: '#00e8ff' }} />
        </div>
        <p className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Set Your Exam Date</p>
        <p className="text-sm text-center max-w-xs" style={{ color: '#64748b' }}>
          Lock in your target date and we'll build a countdown and study pace recommendation.
        </p>
      </div>

      <div className="flex flex-col sm:flex-row gap-3 w-full max-w-sm">
        <input
          type="date"
          min={minDate}
          value={input}
          onChange={(e) => setInput(e.target.value)}
          className="flex-1 rounded-xl px-4 py-2.5 text-sm font-medium outline-none transition-colors"
          style={{
            background: '#0d1626',
            border: '1px solid #1e2d4a',
            color: '#e2e8f0',
            colorScheme: 'dark',
          }}
        />
        <button
          onClick={handleSubmit}
          disabled={!input}
          className={cn(
            'flex items-center gap-2 rounded-xl px-5 py-2.5 text-sm font-bold transition-all',
            input
              ? 'opacity-100 hover:opacity-90 cursor-pointer'
              : 'opacity-40 cursor-not-allowed'
          )}
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          <Lock size={14} />
          Lock it in
        </button>
      </div>
    </motion.div>
  );
}

// ─── Countdown panel ──────────────────────────────────────────────────────

function CountdownPanel({ examDate, onSetDate }: { examDate: string; onSetDate?: (date: string) => void }) {
  const [timeLeft, setTimeLeft] = useState<TimeLeft>({
    days: 0, hours: 0, minutes: 0, seconds: 0, totalDays: 0,
  });

  const computeTimeLeft = useCallback((): TimeLeft => {
    const now = Date.now();
    const target = new Date(examDate + 'T00:00:00').getTime();
    const diff = target - now;

    if (diff <= 0) {
      return { days: 0, hours: 0, minutes: 0, seconds: 0, totalDays: 0 };
    }

    const totalDays = Math.ceil(diff / (1000 * 60 * 60 * 24));
    const days = Math.floor(diff / (1000 * 60 * 60 * 24));
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((diff % (1000 * 60)) / 1000);

    return { days, hours, minutes, seconds, totalDays };
  }, [examDate]);

  useEffect(() => {
    setTimeLeft(computeTimeLeft());
    const id = setInterval(() => setTimeLeft(computeTimeLeft()), 1000);
    return () => clearInterval(id);
  }, [computeTimeLeft]);

  const target = new Date(examDate + 'T00:00:00');
  const isExamDay = timeLeft.totalDays === 0;
  const isPast = target.getTime() < Date.now() && !isExamDay;

  // Study journey progress: assume 90-day study window ending at exam
  const STUDY_WINDOW = 90;
  const journeyPct = isExamDay
    ? 100
    : Math.max(0, Math.min(100, Math.round(((STUDY_WINDOW - timeLeft.totalDays) / STUDY_WINDOW) * 100)));

  const pace = getStudyPace(timeLeft.totalDays);

  const formattedDate = target.toLocaleDateString('en-US', {
    weekday: 'long', year: 'numeric', month: 'long', day: 'numeric',
  });

  // Exam day / post-exam state
  if (isPast) {
    return (
      <motion.div
        className="flex flex-col items-center gap-4 py-10 text-center"
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
      >
        <div className="text-5xl">🎯</div>
        <div>
          <p className="text-xl font-black" style={{ color: '#00e8ff' }}>Post-exam — How did it go?</p>
          <p className="text-sm mt-1" style={{ color: '#64748b' }}>Share your result with the community.</p>
        </div>
        <button
          onClick={() => onSetDate && onSetDate('')}
          className="text-xs underline transition-opacity hover:opacity-70"
          style={{ color: '#475569' }}
        >
          Set a new exam date
        </button>
      </motion.div>
    );
  }

  if (isExamDay) {
    return (
      <motion.div
        className="flex flex-col items-center gap-4 py-10 text-center"
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ type: 'spring', stiffness: 180 }}
      >
        <motion.div
          className="text-6xl"
          animate={{ scale: [1, 1.2, 1] }}
          transition={{ repeat: Infinity, duration: 1.6 }}
        >
          🎯
        </motion.div>
        <p className="text-2xl font-black" style={{ color: '#00e8ff' }}>
          Exam Day! You've got this!
        </p>
        <p className="text-sm" style={{ color: '#94a3b8' }}>
          Light review, stay calm, trust your preparation.
        </p>
      </motion.div>
    );
  }

  return (
    <motion.div
      className="flex flex-col gap-6"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.5 }}
    >
      {/* Exam date label */}
      <div className="flex items-center justify-between">
        <div>
          <p className="text-xs uppercase tracking-widest font-semibold" style={{ color: '#475569' }}>
            Exam Target
          </p>
          <p className="text-sm font-semibold mt-0.5" style={{ color: '#94a3b8' }}>
            {formattedDate}
          </p>
        </div>
        <button
          onClick={() => onSetDate && onSetDate('')}
          className="text-xs px-3 py-1 rounded-lg transition-colors hover:opacity-70"
          style={{ background: '#1e2d4a', color: '#64748b' }}
        >
          Change
        </button>
      </div>

      {/* Flip countdown */}
      <div className="flex items-center justify-center gap-3 flex-wrap">
        <FlipDigit value={timeLeft.days} label="Days" />
        <span className="text-3xl font-black pb-5" style={{ color: '#1e2d4a' }}>:</span>
        <FlipDigit value={timeLeft.hours} label="Hours" />
        <span className="text-3xl font-black pb-5" style={{ color: '#1e2d4a' }}>:</span>
        <FlipDigit value={timeLeft.minutes} label="Min" />
        <span className="text-3xl font-black pb-5" style={{ color: '#1e2d4a' }}>:</span>
        <FlipDigit value={timeLeft.seconds} label="Sec" />
      </div>

      {/* Study journey arc + stats */}
      <div className="flex items-center gap-5 rounded-2xl p-4" style={{ background: '#0d1626', border: '1px solid #1e2d4a' }}>
        <div className="relative shrink-0">
          <CircularArc pct={journeyPct} />
          <div className="absolute inset-0 flex flex-col items-center justify-center">
            <span className="text-lg font-black" style={{ color: '#00e8ff' }}>{journeyPct}%</span>
            <span className="text-[10px] uppercase tracking-wider" style={{ color: '#475569' }}>done</span>
          </div>
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-1.5 mb-2">
            <Clock size={13} style={{ color: pace.color }} />
            <span className="text-xs font-bold uppercase tracking-wide" style={{ color: pace.color }}>
              Study Pace
            </span>
          </div>
          <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
            {pace.text}
          </p>
          <p className="text-xs mt-2" style={{ color: '#475569' }}>
            {timeLeft.totalDays} day{timeLeft.totalDays !== 1 ? 's' : ''} remaining
          </p>
        </div>
      </div>
    </motion.div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function ExamCountdown({ examDate, onSetDate }: ExamCountdownProps) {
  return (
    <div
      className="rounded-2xl p-5 w-full"
      style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
    >
      {/* Card header */}
      <div className="flex items-center gap-2 mb-4">
        <div
          className="w-8 h-8 rounded-lg flex items-center justify-center shrink-0"
          style={{ background: 'rgba(0,232,255,0.1)', border: '1px solid rgba(0,232,255,0.2)' }}
        >
          <Calendar size={16} style={{ color: '#00e8ff' }} />
        </div>
        <div>
          <h2 className="text-sm font-bold uppercase tracking-wider" style={{ color: '#e2e8f0' }}>
            Exam Countdown
          </h2>
          <p className="text-xs" style={{ color: '#475569' }}>CISSP Certification Target</p>
        </div>
      </div>

      <AnimatePresence mode="wait">
        {!examDate ? (
          <SetDatePanel key="set" onSetDate={onSetDate} />
        ) : (
          <CountdownPanel key="count" examDate={examDate} onSetDate={onSetDate} />
        )}
      </AnimatePresence>
    </div>
  );
}
