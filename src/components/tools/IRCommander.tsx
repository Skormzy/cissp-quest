'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Brain, AlertTriangle, CheckCircle, XCircle, Timer, RefreshCw, Trophy } from 'lucide-react';
import { Button } from '@/components/ui/button';

// ─── Types ────────────────────────────────────────────────────────────────

interface Scenario {
  title: string;
  description: string;
  severity: 'Critical' | 'High' | 'Medium';
  icon: string;
}

// ─── PICERL Steps ─────────────────────────────────────────────────────────

const PICERL_STEPS = [
  { key: 'P', label: 'Preparation',    color: '#8b5cf6', description: 'Policies, playbooks, and training in place before incident occurs.' },
  { key: 'I', label: 'Identification', color: '#06b6d4', description: 'Detect and confirm the incident — determine scope and impact.' },
  { key: 'C', label: 'Containment',    color: '#eab308', description: 'Limit the blast radius. Isolate affected systems. Short-term then long-term.' },
  { key: 'E', label: 'Eradication',    color: '#f97316', description: 'Remove the root cause — malware, attacker access, vulnerability.' },
  { key: 'R', label: 'Recovery',       color: '#22c55e', description: 'Restore systems to normal operations with confidence. Monitor for recurrence.' },
  { key: 'L', label: 'Lessons Learned', color: '#00e8ff', description: 'Document the incident. Update playbooks. Brief leadership. Improve defenses.' },
] as const;

type StepKey = typeof PICERL_STEPS[number]['key'];

const SCENARIOS: Scenario[] = [
  {
    title: 'Ransomware Outbreak',
    description: 'Ransomware detected on 3 workstations in the Finance department. Files are being encrypted. Network shares showing anomalous activity.',
    severity: 'Critical',
    icon: '🔒',
  },
  {
    title: 'Suspected Data Exfiltration',
    description: 'IDS alerts show a developer account uploading 2GB of data to an external cloud service. The employee called in sick today.',
    severity: 'High',
    icon: '📤',
  },
  {
    title: 'Phishing Campaign Underway',
    description: '15 employees clicked a malicious link in a phishing email. Some have entered their credentials. No malware confirmed yet.',
    severity: 'High',
    icon: '🎣',
  },
];

const SEVERITY_COLORS: Record<string, string> = {
  Critical: '#ef4444',
  High:     '#f97316',
  Medium:   '#eab308',
};

const TIMER_SECONDS = 90;

// ─── Step Button ──────────────────────────────────────────────────────────

interface StepButtonProps {
  step: typeof PICERL_STEPS[number];
  state: 'idle' | 'correct' | 'wrong' | 'completed';
  onClick: () => void;
  disabled: boolean;
}

function StepButton({ step, state, onClick, disabled }: StepButtonProps) {
  const stateStyles = {
    idle:      { bg: '#111827',       border: '#1e2d4a', color: '#94a3b8' },
    correct:   { bg: `${step.color}22`, border: step.color, color: step.color },
    wrong:     { bg: 'rgba(239,68,68,0.15)', border: '#ef4444', color: '#ef4444' },
    completed: { bg: `${step.color}15`, border: `${step.color}66`, color: `${step.color}` },
  };
  const s = stateStyles[state];

  return (
    <motion.button
      className="flex flex-col items-center gap-1.5 rounded-2xl p-4 text-center w-full transition-all"
      style={{
        background: s.bg,
        border: `2px solid ${s.border}`,
        color: s.color,
        cursor: disabled ? 'not-allowed' : 'pointer',
        opacity: state === 'idle' && disabled ? 0.5 : 1,
      }}
      onClick={disabled ? undefined : onClick}
      whileTap={disabled ? {} : { scale: 0.93 }}
      animate={
        state === 'wrong'
          ? { x: [0, -6, 6, -5, 5, 0] }
          : state === 'correct'
          ? { scale: [1, 1.06, 1] }
          : {}
      }
      transition={{ duration: 0.3 }}
    >
      <span className="text-xl font-black">{step.key}</span>
      <span className="text-xs font-semibold leading-tight">{step.label}</span>
      {state === 'correct' && <CheckCircle size={14} style={{ color: step.color }} />}
      {state === 'wrong'   && <XCircle size={14} style={{ color: '#ef4444' }} />}
    </motion.button>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function IRCommander() {
  const [scenarioIdx, setScenarioIdx] = useState(0);
  const [currentStep, setCurrentStep] = useState(0); // which PICERL step we're expecting
  const [stepStates, setStepStates] = useState<Record<StepKey, 'idle' | 'correct' | 'wrong' | 'completed'>>(
    Object.fromEntries(PICERL_STEPS.map((s) => [s.key, 'idle'])) as Record<StepKey, 'idle' | 'correct' | 'wrong' | 'completed'>,
  );
  const [timeLeft, setTimeLeft] = useState(TIMER_SECONDS);
  const [phase, setPhase] = useState<'intro' | 'active' | 'success' | 'failed'>('intro');
  const [wrongMsg, setWrongMsg] = useState<string | null>(null);
  const [score, setScore] = useState(0);
  const [streak, setStreak] = useState(0);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const scenario = SCENARIOS[scenarioIdx];

  const resetGame = useCallback((nextScenario?: number) => {
    if (timerRef.current) clearInterval(timerRef.current);
    setCurrentStep(0);
    setStepStates(Object.fromEntries(PICERL_STEPS.map((s) => [s.key, 'idle'])) as Record<StepKey, 'idle' | 'correct' | 'wrong' | 'completed'>);
    setTimeLeft(TIMER_SECONDS);
    setWrongMsg(null);
    if (nextScenario !== undefined) setScenarioIdx(nextScenario);
    setPhase('intro');
  }, []);

  const startGame = useCallback(() => {
    setPhase('active');
    timerRef.current = setInterval(() => {
      setTimeLeft((t) => {
        if (t <= 1) {
          clearInterval(timerRef.current!);
          setPhase('failed');
          return 0;
        }
        return t - 1;
      });
    }, 1000);
  }, []);

  const handleStepClick = useCallback((clickedKey: StepKey) => {
    if (phase !== 'active') return;
    const expected = PICERL_STEPS[currentStep];
    if (clickedKey === expected.key) {
      // Correct!
      setStepStates((prev) => ({ ...prev, [clickedKey]: 'correct' }));
      setTimeout(() => {
        setStepStates((prev) => ({ ...prev, [clickedKey]: 'completed' }));
        const next = currentStep + 1;
        if (next >= PICERL_STEPS.length) {
          // All done
          if (timerRef.current) clearInterval(timerRef.current);
          const timeBonus = Math.round(timeLeft * 0.5);
          setScore((s) => s + 100 + timeBonus);
          setStreak((s) => s + 1);
          setPhase('success');
        } else {
          setCurrentStep(next);
        }
      }, 500);
    } else {
      // Wrong order
      setStepStates((prev) => ({ ...prev, [clickedKey]: 'wrong' }));
      setWrongMsg(
        `Incorrect! After "${PICERL_STEPS[Math.max(0, currentStep - 1)].label}", you need "${expected.label}" next.`,
      );
      setTimeout(() => {
        setStepStates((prev) => ({ ...prev, [clickedKey]: 'idle' }));
        setWrongMsg(null);
      }, 2000);
      setScore((s) => Math.max(0, s - 10));
      setStreak(0);
    }
  }, [phase, currentStep, timeLeft]);

  useEffect(() => () => { if (timerRef.current) clearInterval(timerRef.current); }, []);

  const timerPct = (timeLeft / TIMER_SECONDS) * 100;
  const timerColor = timerPct > 50 ? '#22c55e' : timerPct > 25 ? '#eab308' : '#ef4444';

  return (
    <div
      className="rounded-2xl overflow-hidden w-full max-w-2xl mx-auto"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-6 pt-6 pb-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>IR Commander</h2>
            <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>
              Click PICERL steps in the correct order to resolve the incident
            </p>
          </div>
          <span
            className="px-2.5 py-1 rounded-lg text-xs font-bold whitespace-nowrap"
            style={{ background: 'rgba(236,72,153,0.12)', color: '#ec4899', border: '1px solid #ec489944' }}
          >
            Domain 7 — SecOps
          </span>
        </div>
      </div>

      <div className="px-6 pt-5 space-y-4">
        {/* Scoreboard */}
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2 px-3 py-2 rounded-xl" style={{ background: '#111827', border: '1px solid #1e2d4a' }}>
            <Trophy size={14} style={{ color: '#ffd700' }} />
            <span className="text-sm font-bold" style={{ color: '#e2e8f0' }}>{score} pts</span>
          </div>
          {streak > 1 && (
            <div className="flex items-center gap-2 px-3 py-2 rounded-xl" style={{ background: 'rgba(249,115,22,0.12)', border: '1px solid #f9731633' }}>
              <span className="text-sm font-bold" style={{ color: '#f97316' }}>🔥 {streak}x Streak</span>
            </div>
          )}
        </div>

        {/* Incident card */}
        <motion.div
          className="rounded-2xl p-4"
          style={{
            background: '#111827',
            border: `1px solid ${SEVERITY_COLORS[scenario.severity]}44`,
          }}
          layout
        >
          <div className="flex items-start gap-3">
            <span className="text-2xl">{scenario.icon}</span>
            <div>
              <div className="flex items-center gap-2 mb-1">
                <AlertTriangle size={13} style={{ color: SEVERITY_COLORS[scenario.severity] }} />
                <span className="text-xs font-bold uppercase" style={{ color: SEVERITY_COLORS[scenario.severity] }}>
                  {scenario.severity} Severity
                </span>
              </div>
              <h3 className="text-sm font-bold mb-1" style={{ color: '#e2e8f0' }}>{scenario.title}</h3>
              <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>{scenario.description}</p>
            </div>
          </div>
        </motion.div>

        {/* Timer bar (only active) */}
        {phase === 'active' && (
          <div className="space-y-1">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-1.5 text-xs" style={{ color: '#64748b' }}>
                <Timer size={12} />
                Time remaining
              </div>
              <span className="text-xs font-mono font-bold" style={{ color: timerColor }}>
                {timeLeft}s
              </span>
            </div>
            <div className="h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
              <motion.div
                className="h-full rounded-full"
                style={{ background: timerColor }}
                animate={{ width: `${timerPct}%` }}
                transition={{ duration: 0.9, ease: 'linear' }}
              />
            </div>
          </div>
        )}

        {/* Wrong message */}
        <AnimatePresence>
          {wrongMsg && (
            <motion.div
              className="flex items-start gap-2 rounded-xl p-3"
              style={{ background: 'rgba(239,68,68,0.1)', border: '1px solid #ef444433' }}
              initial={{ opacity: 0, y: -4 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -4 }}
            >
              <XCircle size={14} className="shrink-0 mt-0.5" style={{ color: '#ef4444' }} />
              <p className="text-xs" style={{ color: '#ef4444' }}>{wrongMsg}</p>
            </motion.div>
          )}
        </AnimatePresence>

        {/* PICERL buttons */}
        <div className="grid grid-cols-3 md:grid-cols-6 gap-2">
          {PICERL_STEPS.map((step) => (
            <StepButton
              key={step.key}
              step={step}
              state={stepStates[step.key]}
              onClick={() => handleStepClick(step.key)}
              disabled={phase !== 'active' || stepStates[step.key] === 'completed'}
            />
          ))}
        </div>

        {/* Progress indicator */}
        {phase === 'active' && (
          <div className="flex items-center gap-2">
            {PICERL_STEPS.map((step, i) => (
              <motion.div
                key={step.key}
                className="flex-1 h-1 rounded-full"
                style={{
                  background: i < currentStep
                    ? step.color
                    : i === currentStep
                    ? '#ffffff33'
                    : '#1e2d4a',
                }}
                animate={{ background: i < currentStep ? step.color : i === currentStep ? '#ffffff33' : '#1e2d4a' }}
              />
            ))}
          </div>
        )}

        {/* Step description */}
        {phase === 'active' && (
          <motion.div
            key={currentStep}
            className="rounded-xl p-3"
            style={{ background: '#111827', border: `1px solid ${PICERL_STEPS[currentStep].color}44` }}
            initial={{ opacity: 0, x: 10 }}
            animate={{ opacity: 1, x: 0 }}
          >
            <p className="text-xs font-bold mb-0.5" style={{ color: PICERL_STEPS[currentStep].color }}>
              Next: {PICERL_STEPS[currentStep].label}
            </p>
            <p className="text-xs" style={{ color: '#64748b' }}>{PICERL_STEPS[currentStep].description}</p>
          </motion.div>
        )}

        {/* Intro state */}
        {phase === 'intro' && (
          <motion.div
            className="text-center py-4"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
          >
            <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>
              Click the PICERL steps <strong style={{ color: '#00e8ff' }}>in order</strong> to resolve the incident.
              You have {TIMER_SECONDS} seconds.
            </p>
            <Button
              onClick={startGame}
              style={{ background: '#00e8ff', color: '#080c14' }}
              className="font-bold"
            >
              Respond to Incident
            </Button>
          </motion.div>
        )}

        {/* Success state */}
        <AnimatePresence>
          {phase === 'success' && (
            <motion.div
              className="rounded-2xl p-5 text-center"
              style={{ background: 'rgba(34,197,94,0.08)', border: '1px solid #22c55e44' }}
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
            >
              <div className="text-3xl mb-2">🎉</div>
              <p className="font-bold mb-1" style={{ color: '#22c55e' }}>Incident Resolved!</p>
              <p className="text-xs mb-4" style={{ color: '#94a3b8' }}>
                {timeLeft}s remaining — {Math.round(timeLeft * 0.5)} bonus points awarded.
              </p>
              <div className="flex gap-2 justify-center">
                <Button variant="outline" size="sm" onClick={() => resetGame(scenarioIdx)} style={{ borderColor: '#1e2d4a' }}>
                  <RefreshCw size={13} className="mr-1.5" /> Retry
                </Button>
                <Button
                  size="sm"
                  style={{ background: '#00e8ff', color: '#080c14' }}
                  onClick={() => resetGame((scenarioIdx + 1) % SCENARIOS.length)}
                >
                  Next Scenario
                </Button>
              </div>
            </motion.div>
          )}
        </AnimatePresence>

        {/* Failed state */}
        <AnimatePresence>
          {phase === 'failed' && (
            <motion.div
              className="rounded-2xl p-5 text-center"
              style={{ background: 'rgba(239,68,68,0.08)', border: '1px solid #ef444433' }}
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
            >
              <div className="text-3xl mb-2">⏰</div>
              <p className="font-bold mb-1" style={{ color: '#ef4444' }}>Time Expired!</p>
              <p className="text-xs mb-4" style={{ color: '#94a3b8' }}>
                The incident escalated. Remember: P-I-C-E-R-L in order.
              </p>
              <Button
                style={{ background: '#ef4444', color: '#fff' }}
                onClick={() => resetGame(scenarioIdx)}
              >
                <RefreshCw size={13} className="mr-1.5" /> Try Again
              </Button>
            </motion.div>
          )}
        </AnimatePresence>
      </div>

      {/* Memory hack */}
      <div className="px-6 pb-6 pt-4">
        <div
          className="flex gap-3 rounded-xl p-4"
          style={{ background: 'rgba(0,232,255,0.05)', borderLeft: '3px solid #00e8ff' }}
        >
          <Brain size={16} className="shrink-0 mt-0.5" style={{ color: '#00e8ff' }} />
          <div>
            <p className="text-xs font-bold uppercase tracking-wider mb-1" style={{ color: '#00e8ff' }}>
              Memory Hack — PICERL
            </p>
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              <strong style={{ color: '#e2e8f0' }}>P-I-C-E-R-L:</strong> "Please Identify Containers Early, Recover Later."
              Preparation is BEFORE the incident — you can't prepare mid-breach. Lessons Learned is LAST —
              you document after recovery, not during chaos.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
