'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { DOMAINS } from '@/lib/constants';
import { emitXp } from '@/components/effects/XpToast';
import {
  CheckCircle,
  XCircle,
  SkipForward,
  Flame,
  Brain,
  ChevronRight,
} from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

export interface QuizCardQuestion {
  id: string;
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
  mnemonic_hint?: string | null;
  domain_id: number;
  difficulty_rating: 'easy' | 'medium' | 'hard' | 'very_hard';
}

export interface QuizCardProps {
  question: QuizCardQuestion;
  questionNumber: number;
  totalQuestions: number;
  streak: number;
  timeLimitSeconds?: number;
  onAnswer: (selectedIndex: number, timeSpent: number) => void;
  onSkip: () => void;
  theta?: number;
}

// ─── Config ───────────────────────────────────────────────────────────────

const DIFFICULTY_CONFIG = {
  easy:      { label: 'Easy',      color: '#22c55e', bg: 'rgba(34,197,94,0.12)',  xp: 25  },
  medium:    { label: 'Medium',    color: '#eab308', bg: 'rgba(234,179,8,0.12)',  xp: 50  },
  hard:      { label: 'Hard',      color: '#f97316', bg: 'rgba(249,115,22,0.12)', xp: 100 },
  very_hard: { label: 'Very Hard', color: '#ef4444', bg: 'rgba(239,68,68,0.12)',  xp: 150 },
} as const;

// ─── Timer Bar ────────────────────────────────────────────────────────────

function TimerBar({ totalSeconds, onExpire }: { totalSeconds: number; onExpire: () => void }) {
  const [remaining, setRemaining] = useState(totalSeconds);
  const expiredRef = useRef(false);

  useEffect(() => {
    if (remaining <= 0) {
      if (!expiredRef.current) {
        expiredRef.current = true;
        onExpire();
      }
      return;
    }
    const id = setTimeout(() => setRemaining((r) => r - 1), 1000);
    return () => clearTimeout(id);
  }, [remaining, onExpire]);

  const pct = (remaining / totalSeconds) * 100;
  const color = pct > 50 ? '#00e8ff' : pct > 25 ? '#eab308' : '#ef4444';

  return (
    <div className="relative h-1 w-full rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
      <motion.div
        className="absolute inset-y-0 left-0 rounded-full"
        style={{ background: color }}
        animate={{ width: `${pct}%` }}
        transition={{ duration: 0.9, ease: 'linear' }}
      />
    </div>
  );
}

// ─── Option Button ────────────────────────────────────────────────────────

interface OptionButtonProps {
  label: string;
  index: number;
  selected: boolean;
  correct: number | null; // null = not revealed yet; number = correct answer index
  onClick: (e: React.MouseEvent<HTMLButtonElement>) => void;
  disabled: boolean;
}

function OptionButton({ label, index, selected, correct, onClick, disabled }: OptionButtonProps) {
  const letters = ['A', 'B', 'C', 'D'];

  const getState = () => {
    if (correct === null) return 'neutral';
    if (index === correct) return 'correct-answer';
    if (selected) return 'wrong-answer';
    return 'dimmed';
  };

  const state = getState();

  const stateStyles = {
    neutral:        { border: '#1e2d4a', bg: '#0d1220', letterBg: '#1e2d4a', letterColor: '#94a3b8' },
    'correct-answer': { border: '#22c55e', bg: 'rgba(34,197,94,0.08)', letterBg: '#22c55e', letterColor: '#fff' },
    'wrong-answer': { border: '#ef4444', bg: 'rgba(239,68,68,0.08)', letterBg: '#ef4444', letterColor: '#fff' },
    dimmed:         { border: '#1e2d4a', bg: 'transparent', letterBg: '#1e2d4a', letterColor: '#475569' },
  };

  const s = stateStyles[state];

  return (
    <motion.button
      className="w-full flex items-start gap-3 rounded-xl p-4 text-left transition-colors"
      style={{
        border: `1px solid ${s.border}`,
        background: s.bg,
        cursor: disabled ? 'default' : 'pointer',
        opacity: state === 'dimmed' ? 0.45 : 1,
      }}
      onClick={disabled ? undefined : onClick}
      whileHover={disabled ? {} : { scale: 1.005, borderColor: '#00e8ff55' }}
      whileTap={disabled ? {} : { scale: 0.997 }}
      animate={
        state === 'correct-answer'
          ? { borderColor: '#22c55e', scale: [1, 1.015, 1] }
          : state === 'wrong-answer'
          ? { borderColor: '#ef4444', x: [0, -6, 6, -4, 4, 0] }
          : {}
      }
      transition={{ duration: 0.35 }}
    >
      <span
        className="shrink-0 flex items-center justify-center text-xs font-bold rounded-md w-6 h-6 mt-0.5"
        style={{ background: s.letterBg, color: s.letterColor }}
      >
        {letters[index]}
      </span>
      <span
        className="text-sm leading-relaxed"
        style={{ color: state === 'dimmed' ? '#475569' : '#e2e8f0' }}
      >
        {label}
      </span>
      {state === 'correct-answer' && (
        <CheckCircle size={16} className="shrink-0 ml-auto mt-0.5" style={{ color: '#22c55e' }} />
      )}
      {state === 'wrong-answer' && (
        <XCircle size={16} className="shrink-0 ml-auto mt-0.5" style={{ color: '#ef4444' }} />
      )}
    </motion.button>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function QuizCard({
  question,
  questionNumber,
  totalQuestions,
  streak,
  timeLimitSeconds,
  onAnswer,
  onSkip,
  theta,
}: QuizCardProps) {
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);
  const startTime = useRef(Date.now());
  const timeoutsRef = useRef<Set<number>>(new Set());

  const domain = DOMAINS.find((d) => d.id === question.domain_id);
  const diff = DIFFICULTY_CONFIG[question.difficulty_rating];

  const trackTimeout = useCallback((fn: () => void, ms: number) => {
    const t = window.setTimeout(() => {
      timeoutsRef.current.delete(t);
      fn();
    }, ms);
    timeoutsRef.current.add(t);
    return t;
  }, []);

  // Reset state when question changes; cancel any pending timeouts.
  useEffect(() => {
    const timeouts = timeoutsRef.current;
    timeouts.forEach((t) => window.clearTimeout(t));
    timeouts.clear();
    setSelectedIndex(null);
    setRevealed(false);
    startTime.current = Date.now();
  }, [question.id]);

  // Final cleanup on unmount.
  useEffect(() => {
    const timeouts = timeoutsRef.current;
    return () => {
      timeouts.forEach((t) => window.clearTimeout(t));
      timeouts.clear();
    };
  }, []);

  const handleSelect = useCallback(
    (idx: number, originX?: number, originY?: number) => {
      if (revealed) return;
      const timeSpent = (Date.now() - startTime.current) / 1000;
      setSelectedIndex(idx);
      setRevealed(true);
      const isCorrect = idx === question.correct_index;
      if (isCorrect) {
        emitXp(DIFFICULTY_CONFIG[question.difficulty_rating].xp, {
          x: originX,
          y: originY,
          variant: streak >= 3 ? 'critical' : 'normal',
        });
      }
      // Let parent know after a short reveal delay
      trackTimeout(() => onAnswer(idx, timeSpent), 1600);
    },
    [revealed, question.correct_index, question.difficulty_rating, streak, onAnswer, trackTimeout],
  );

  const handleTimerExpire = useCallback(() => {
    if (revealed) return;
    const timeSpent = (Date.now() - startTime.current) / 1000;
    setSelectedIndex(null);
    setRevealed(true);
    // Sentinel -1 = timeout / no answer. Parent must treat this distinctly
    // from a real selection.
    trackTimeout(() => onAnswer(-1, timeSpent), 1600);
  }, [revealed, onAnswer, trackTimeout]);

  const showStreak = streak >= 3;

  return (
    <motion.div
      key={question.id}
      className="relative w-full max-w-2xl mx-auto"
      initial={{ opacity: 0, y: 28 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4, ease: 'easeOut' }}
    >
      {/* Card */}
      <div
        className="rounded-2xl overflow-hidden"
        style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
      >
        {/* Header */}
        <div className="px-5 pt-5 pb-3 flex items-center justify-between gap-3">
          {/* Domain badge */}
          <div className="flex items-center gap-2">
            <span
              className="px-2.5 py-1 rounded-lg text-xs font-bold tracking-wide"
              style={{ background: `${domain?.color ?? '#00e8ff'}22`, color: domain?.color ?? '#00e8ff', border: `1px solid ${domain?.color ?? '#00e8ff'}44` }}
            >
              {domain?.icon} {domain?.name ?? `Domain ${question.domain_id}`}
            </span>

            {/* Difficulty */}
            <span
              className="px-2 py-0.5 rounded-md text-xs font-semibold"
              style={{ background: diff.bg, color: diff.color }}
            >
              {diff.label}
            </span>

            {/* Streak badge */}
            <AnimatePresence>
              {showStreak && (
                <motion.span
                  className="flex items-center gap-1 px-2 py-0.5 rounded-md text-xs font-bold"
                  style={{ background: 'rgba(249,115,22,0.15)', color: '#f97316' }}
                  initial={{ scale: 0, opacity: 0 }}
                  animate={{ scale: 1, opacity: 1 }}
                  exit={{ scale: 0, opacity: 0 }}
                >
                  <Flame size={12} />
                  {streak}x Streak!
                </motion.span>
              )}
            </AnimatePresence>
          </div>

          {/* Counter + theta */}
          <div className="flex items-center gap-3 shrink-0">
            {theta !== undefined && (
              <span className="text-xs" style={{ color: '#475569' }}>
                θ {theta >= 0 ? '+' : ''}{theta.toFixed(2)}
              </span>
            )}
            <span className="text-xs font-mono font-semibold" style={{ color: '#64748b' }}>
              Q {questionNumber} / {totalQuestions}
            </span>
          </div>
        </div>

        {/* Timer bar */}
        {timeLimitSeconds && !revealed && (
          <div className="px-5 pb-2">
            <TimerBar totalSeconds={timeLimitSeconds} onExpire={handleTimerExpire} />
          </div>
        )}

        {/* Question text */}
        <div className="px-5 pb-5">
          <p className="text-base md:text-lg font-semibold leading-relaxed" style={{ color: '#e2e8f0' }}>
            {question.question_text}
          </p>
        </div>

        {/* Options */}
        <div className="px-5 pb-5 flex flex-col gap-2.5">
          {question.options.map((opt, idx) => (
            <OptionButton
              key={idx}
              label={opt}
              index={idx}
              selected={selectedIndex === idx}
              correct={revealed ? question.correct_index : null}
              onClick={(e) => {
                const r = e.currentTarget.getBoundingClientRect();
                handleSelect(idx, r.left + r.width / 2, r.top + r.height / 2);
              }}
              disabled={revealed}
            />
          ))}
        </div>

        {/* Explanation panel */}
        <AnimatePresence>
          {revealed && (
            <motion.div
              className="border-t"
              style={{ borderColor: '#1e2d4a' }}
              initial={{ opacity: 0, height: 0 }}
              animate={{ opacity: 1, height: 'auto' }}
              transition={{ duration: 0.4, ease: 'easeOut' }}
            >
              <div className="px-5 py-4 space-y-3">
                {/* Result label */}
                <div className="flex items-center gap-2">
                  {selectedIndex === question.correct_index ? (
                    <>
                      <CheckCircle size={16} style={{ color: '#22c55e' }} />
                      <span className="text-sm font-bold" style={{ color: '#22c55e' }}>Correct!</span>
                    </>
                  ) : (
                    <>
                      <XCircle size={16} style={{ color: '#ef4444' }} />
                      <span className="text-sm font-bold" style={{ color: '#ef4444' }}>
                        {selectedIndex === null ? 'Time up!' : 'Incorrect'}
                      </span>
                    </>
                  )}
                </div>

                {/* Explanation */}
                <p className="text-sm leading-relaxed" style={{ color: '#94a3b8' }}>
                  {question.explanation}
                </p>

                {/* Memory hack */}
                {question.mnemonic_hint && (
                  <motion.div
                    className="flex gap-3 rounded-xl p-3"
                    style={{
                      background: 'rgba(0,232,255,0.06)',
                      borderLeft: '3px solid #00e8ff',
                    }}
                    initial={{ opacity: 0, x: -10 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: 0.2 }}
                  >
                    <Brain size={16} className="shrink-0 mt-0.5" style={{ color: '#00e8ff' }} />
                    <div>
                      <p className="text-xs font-bold uppercase tracking-wider mb-1" style={{ color: '#00e8ff' }}>
                        Memory Hack
                      </p>
                      <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                        {question.mnemonic_hint}
                      </p>
                    </div>
                  </motion.div>
                )}
              </div>
            </motion.div>
          )}
        </AnimatePresence>

        {/* Footer actions */}
        {!revealed && (
          <div className="px-5 pb-4 flex items-center gap-3 justify-end border-t" style={{ borderColor: '#1e2d4a' }}>
            <button
              onClick={onSkip}
              className="flex items-center gap-1.5 text-xs transition-colors hover:text-slate-300"
              style={{ color: '#64748b' }}
            >
              <SkipForward size={13} />
              Skip
            </button>
          </div>
        )}

        {/* Continue hint after reveal */}
        {revealed && (
          <div className="px-5 pb-4 flex justify-end">
            <motion.div
              className="flex items-center gap-1 text-xs"
              style={{ color: '#475569' }}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 1 }}
            >
              <ChevronRight size={13} />
              Next question loading…
            </motion.div>
          </div>
        )}
      </div>
    </motion.div>
  );
}
