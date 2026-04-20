'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { CheckCircle, XCircle, X, Zap } from 'lucide-react';
import { cn } from '@/lib/utils';

// ─── Types ────────────────────────────────────────────────────────────────

interface DailyBriefProps {
  userId?: string;
  completedToday?: boolean;
  onComplete?: () => void;
}

interface BriefQuestion {
  id: string;
  domain: number;
  domainName: string;
  domainColor: string;
  difficulty: 'easy' | 'medium' | 'hard';
  question: string;
  options: string[];
  correctIndex: number;
  explanation: string;
}

// ─── Static data ──────────────────────────────────────────────────────────

const TANAKA_MESSAGES = [
  "Good morning, Agent. Today's briefing focuses on your weak areas. Review carefully before your next mission.",
  "Morning. The Meridian investigation has new leads. Brush up on these concepts before we debrief.",
  "Today's intel is tight. Five questions, each one critical. Don't rush — think like a manager.",
  "New signal traffic from the Meridian case. These five questions mirror what our adversary exploited.",
  "We've profiled the attacker's approach. These questions target the exact gaps they're using against us.",
];

const MERIDIAN_HEADLINES = [
  "Meridian Global CFO denies knowledge of shadow IT infrastructure used in initial breach vector.",
  "Forensics team traces lateral movement to unpatched HVAC system with network access.",
  "Whistleblower claims security team's escalation report was buried for 6 weeks before disclosure.",
  "New evidence: attacker maintained persistence via rogue certificate authority for 14 months.",
  "Meridian's third-party auditor missed 23 critical controls — board demands independent review.",
  "Timeline reconstructed: 4.2 TB exfiltrated over 18 days via encrypted DNS tunneling.",
  "Insider threat assessment reveals 3 employees had access far exceeding job requirements.",
  "Meridian's IR vendor discovers second intrusion team operating independently of first attacker.",
  "Backup systems compromised in parallel — recovery timeline extended by 3 weeks.",
  "Board approves $40M emergency security budget; CISO resigns citing lack of executive support.",
  "Zero-day exploit used in initial access linked to nation-state APT group codenamed IRON VEIL.",
  "Employee phishing simulation success rate drops from 34% to 8% after new training rollout.",
  "Regulatory probe: Meridian failed to notify affected parties within mandated 72-hour window.",
  "Cloud misconfiguration exposed 1.2M customer records — S3 bucket set to public for 6 days.",
  "Attacker pivot: after detecting IR team, adversary activated dormant implant in dev environment.",
  "Meridian's security architecture review reveals flat network — no east-west segmentation.",
  "Third-party supply chain vendor identified as original infection vector via trojanized update.",
  "New log analysis: 847 failed login attempts missed by SIEM due to misconfigured alert threshold.",
  "Meridian CTO confirms MFA was optional — 62% of privileged accounts relied on passwords only.",
  "Post-breach: Meridian adopts zero-trust architecture mandate; full implementation target: 18 months.",
];

const BRIEF_QUESTIONS: BriefQuestion[] = [
  {
    id: 'bq1',
    domain: 1,
    domainName: 'Security & Risk Management',
    domainColor: '#ef4444',
    difficulty: 'medium',
    question: 'A CISO is presenting the annual security budget to the board. The BEST framework for communicating risk in financial terms is:',
    options: [
      'CVSS scoring to rank technical vulnerabilities by severity',
      'Factor Analysis of Information Risk (FAIR) to quantify risk in monetary impact',
      'ISO 27001 control mapping to show compliance coverage',
      'MITRE ATT&CK to demonstrate threat actor techniques',
    ],
    correctIndex: 1,
    explanation: 'FAIR translates risk into dollar amounts — exactly what boards need to make resource allocation decisions. CVSS is technical, ISO is compliance-focused, and ATT&CK is threat-focused. The CISSP exam rewards the governance and business-impact mindset.',
  },
  {
    id: 'bq2',
    domain: 1,
    domainName: 'Security & Risk Management',
    domainColor: '#ef4444',
    difficulty: 'hard',
    question: 'An organization discovers its BCP does not account for a key third-party SaaS provider going offline. The FIRST action the security team should take is:',
    options: [
      'Immediately procure a backup SaaS provider',
      'Notify senior management and suspend operations until resolved',
      'Conduct a Business Impact Analysis (BIA) to assess the dependency and recovery needs',
      'Update the risk register and schedule a review for next quarter',
    ],
    correctIndex: 2,
    explanation: 'Before taking action, you need to understand the impact. A BIA quantifies the operational and financial consequences of the outage and informs the recovery strategy. Acting before understanding (options A/B) or delaying analysis (option D) are both wrong moves.',
  },
  {
    id: 'bq3',
    domain: 2,
    domainName: 'Asset Security',
    domainColor: '#f97316',
    difficulty: 'easy',
    question: 'During data classification, which role is PRIMARILY responsible for determining the sensitivity level of a data asset?',
    options: [
      'Data custodian',
      'System administrator',
      'Data owner',
      'Chief Information Officer',
    ],
    correctIndex: 2,
    explanation: 'The data owner — typically a business unit manager — is responsible for classifying data based on its value and sensitivity to the organization. The data custodian implements controls. The sysadmin manages systems. The CIO sets policy at the executive level.',
  },
  {
    id: 'bq4',
    domain: 2,
    domainName: 'Asset Security',
    domainColor: '#f97316',
    difficulty: 'medium',
    question: 'An organization is decommissioning hard drives containing PII. The drives are physically damaged but not destroyed. Which data remanence control is MOST appropriate?',
    options: [
      'Overwriting the drives three times using DoD 5220.22-M standard',
      'Encrypting the drives with AES-256 before physical disposal',
      'Physical destruction (shredding or incineration)',
      'Degaussing the drives in a certified facility',
    ],
    correctIndex: 2,
    explanation: 'For physically damaged drives, physical destruction is the most reliable method. Overwriting requires the drive to be functional. Encryption before disposal is "crypto-shredding" — valid but relies on key destruction. Degaussing works for magnetic media but not SSDs.',
  },
  {
    id: 'bq5',
    domain: 3,
    domainName: 'Security Architecture',
    domainColor: '#eab308',
    difficulty: 'hard',
    question: 'A security architect is designing a system that must prevent a process from reading data above its clearance level. Which security model BEST enforces this requirement?',
    options: [
      'Clark-Wilson model enforcing well-formed transactions',
      'Biba model enforcing integrity through no read-up, no write-down rules',
      'Bell-LaPadula model enforcing confidentiality via no read-up (simple security property)',
      'Brewer-Nash (Chinese Wall) model preventing conflict-of-interest access',
    ],
    correctIndex: 2,
    explanation: 'Bell-LaPadula\'s "no read up" (simple security property) directly prevents a subject from reading objects at a higher classification. Biba protects integrity (no read-down). Clark-Wilson addresses transaction integrity. Brewer-Nash is for conflict-of-interest. Confidentiality + clearance = Bell-LaPadula.',
  },
];

// ─── Domain badge ─────────────────────────────────────────────────────────

function DomainBadge({ name, color }: { name: string; color: string }) {
  return (
    <span
      className="inline-block px-2 py-0.5 rounded-md text-xs font-bold tracking-wide"
      style={{ background: `${color}18`, color, border: `1px solid ${color}35` }}
    >
      {name}
    </span>
  );
}

// ─── Brief question card ──────────────────────────────────────────────────

function BriefQuestionCard({
  q,
  index,
  onAnswered,
}: {
  q: BriefQuestion;
  index: number;
  onAnswered: (correct: boolean) => void;
}) {
  const [selected, setSelected] = useState<number | null>(null);
  const revealed = selected !== null;

  const letters = ['A', 'B', 'C', 'D'];

  const diffColors: Record<string, string> = {
    easy: '#22c55e',
    medium: '#eab308',
    hard: '#f97316',
  };

  const handleSelect = (idx: number) => {
    if (revealed) return;
    setSelected(idx);
    onAnswered(idx === q.correctIndex);
  };

  return (
    <motion.div
      className="rounded-xl overflow-hidden"
      style={{ background: '#0d1626', border: '1px solid #1e2d4a' }}
      initial={{ opacity: 0, x: -24 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ delay: index * 0.1, duration: 0.4, ease: 'easeOut' }}
    >
      {/* Header */}
      <div className="px-4 pt-4 pb-3 flex items-center gap-2 flex-wrap">
        <span className="text-xs font-mono" style={{ color: '#475569' }}>Q{index + 1}</span>
        <DomainBadge name={q.domainName} color={q.domainColor} />
        <span
          className="text-xs font-semibold capitalize"
          style={{ color: diffColors[q.difficulty] ?? '#94a3b8' }}
        >
          {q.difficulty}
        </span>
      </div>

      {/* Question */}
      <div className="px-4 pb-3">
        <p className="text-sm font-semibold leading-relaxed" style={{ color: '#e2e8f0' }}>
          {q.question}
        </p>
      </div>

      {/* Options */}
      <div className="px-4 pb-4 flex flex-col gap-2">
        {q.options.map((opt, idx) => {
          const isCorrect = idx === q.correctIndex;
          const isSelected = idx === selected;

          let borderColor = '#1e2d4a';
          let bg = 'transparent';
          let textColor = '#94a3b8';
          let letterBg = '#1e2d4a';
          let letterColor = '#64748b';

          if (revealed) {
            if (isCorrect) {
              borderColor = '#22c55e';
              bg = 'rgba(34,197,94,0.07)';
              textColor = '#e2e8f0';
              letterBg = '#22c55e';
              letterColor = '#fff';
            } else if (isSelected) {
              borderColor = '#ef4444';
              bg = 'rgba(239,68,68,0.07)';
              textColor = '#e2e8f0';
              letterBg = '#ef4444';
              letterColor = '#fff';
            } else {
              textColor = '#475569';
              letterColor = '#334155';
            }
          }

          return (
            <button
              key={idx}
              onClick={() => handleSelect(idx)}
              disabled={revealed}
              className="flex items-start gap-3 rounded-lg p-3 text-left transition-all w-full"
              style={{
                border: `1px solid ${borderColor}`,
                background: bg,
                cursor: revealed ? 'default' : 'pointer',
                opacity: revealed && !isCorrect && !isSelected ? 0.45 : 1,
              }}
            >
              <span
                className="shrink-0 w-5 h-5 rounded flex items-center justify-center text-xs font-bold mt-0.5"
                style={{ background: letterBg, color: letterColor }}
              >
                {letters[idx]}
              </span>
              <span className="text-xs leading-relaxed" style={{ color: textColor }}>{opt}</span>
              {revealed && isCorrect && (
                <CheckCircle size={14} className="shrink-0 ml-auto mt-0.5" style={{ color: '#22c55e' }} />
              )}
              {revealed && isSelected && !isCorrect && (
                <XCircle size={14} className="shrink-0 ml-auto mt-0.5" style={{ color: '#ef4444' }} />
              )}
            </button>
          );
        })}
      </div>

      {/* Explanation */}
      <AnimatePresence>
        {revealed && (
          <motion.div
            className="border-t px-4 py-3"
            style={{ borderColor: '#1e2d4a' }}
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            transition={{ duration: 0.35 }}
          >
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              {q.explanation}
            </p>
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  );
}

// ─── Closed dossier ───────────────────────────────────────────────────────

function DossierClosed({
  completedToday,
  onOpen,
  date,
}: {
  completedToday: boolean;
  onOpen: () => void;
  date: string;
}) {
  return (
    <motion.div
      className="relative rounded-2xl overflow-hidden cursor-pointer select-none"
      style={{
        background: 'linear-gradient(135deg, #1a1408 0%, #2a1f0a 100%)',
        border: '1px solid #4a3a1a',
      }}
      animate={{
        boxShadow: completedToday
          ? '0 0 0 rgba(0,232,255,0)'
          : [
              '0 0 12px rgba(0,232,255,0.15)',
              '0 0 28px rgba(0,232,255,0.35)',
              '0 0 12px rgba(0,232,255,0.15)',
            ],
      }}
      transition={{ duration: 2.4, repeat: completedToday ? 0 : Infinity, ease: 'easeInOut' }}
      onClick={completedToday ? undefined : onOpen}
      whileHover={completedToday ? {} : { scale: 1.01 }}
    >
      {/* Top stripe */}
      <div className="h-1.5 w-full" style={{ background: 'linear-gradient(90deg, #c8a028, #e8c040, #c8a028)' }} />

      <div className="p-5">
        {/* Header row */}
        <div className="flex items-start justify-between gap-4 mb-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <div className="w-1 h-4 rounded-full" style={{ background: '#c8a028' }} />
              <span
                className="text-xs font-black uppercase tracking-[0.2em]"
                style={{ color: '#c8a028' }}
              >
                Daily Intelligence Brief
              </span>
            </div>
            <p className="text-xs ml-3" style={{ color: '#8a7040' }}>{date}</p>
          </div>

          {/* TOP SECRET stamp */}
          <div
            className="shrink-0 px-3 py-1.5 rounded border-2 rotate-[-8deg]"
            style={{
              borderColor: '#c8200a',
              color: '#c8200a',
              fontFamily: 'monospace',
              fontSize: 11,
              fontWeight: 900,
              letterSpacing: '0.15em',
              opacity: 0.85,
            }}
          >
            TOP SECRET
          </div>
        </div>

        {/* File lines */}
        <div className="space-y-2 mb-5">
          {['5 targeted questions', 'Domain focus: Risk, Assets, Architecture', 'Meridian case update included'].map((line, i) => (
            <div key={i} className="flex items-center gap-2">
              <div className="w-1 h-1 rounded-full" style={{ background: '#6a5020' }} />
              <span className="text-xs" style={{ color: '#8a7040' }}>{line}</span>
            </div>
          ))}
        </div>

        {/* CTA */}
        {completedToday ? (
          <div className="flex items-center gap-2 text-sm font-semibold" style={{ color: '#4a8040' }}>
            <CheckCircle size={16} />
            Briefing complete — come back tomorrow
          </div>
        ) : (
          <motion.button
            className="w-full rounded-xl py-2.5 text-sm font-bold uppercase tracking-widest transition-opacity"
            style={{ background: '#c8a028', color: '#0a0800' }}
            whileHover={{ opacity: 0.9 }}
            whileTap={{ scale: 0.98 }}
            onClick={onOpen}
          >
            Open Briefing
          </motion.button>
        )}
      </div>
    </motion.div>
  );
}

// ─── Briefing modal ───────────────────────────────────────────────────────

function BriefingModal({
  date,
  onClose,
  onComplete,
}: {
  date: string;
  onClose: () => void;
  onComplete: () => void;
}) {
  const [answeredCount, setAnsweredCount] = useState(0);
  const [correctCount, setCorrectCount] = useState(0);
  const [showXP, setShowXP] = useState(false);
  const [done, setDone] = useState(false);

  const tanakaMsg = TANAKA_MESSAGES[new Date().getDay() % TANAKA_MESSAGES.length];
  const caseHeadline = MERIDIAN_HEADLINES[new Date().getDate() % MERIDIAN_HEADLINES.length];

  const handleAnswered = (correct: boolean) => {
    setAnsweredCount((c) => {
      const next = c + 1;
      if (correct) setCorrectCount((cc) => cc + 1);
      if (next === BRIEF_QUESTIONS.length) {
        setTimeout(() => {
          setShowXP(true);
          setTimeout(() => {
            setShowXP(false);
            setDone(true);
          }, 2000);
        }, 600);
      }
      return next;
    });
  };

  const handleFinish = () => {
    onComplete();
    onClose();
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-4"
      style={{ background: 'rgba(8,12,20,0.92)', backdropFilter: 'blur(6px)' }}
    >
      <motion.div
        className="relative w-full max-w-2xl rounded-2xl overflow-hidden flex flex-col"
        style={{
          background: '#080c14',
          border: '1px solid #1e2d4a',
          maxHeight: '90vh',
        }}
        initial={{ scaleY: 0, originY: 1 }}
        animate={{ scaleY: 1 }}
        exit={{ scaleY: 0, originY: 1 }}
        transition={{ duration: 0.4, ease: [0.25, 0.46, 0.45, 0.94] }}
      >
        {/* Header */}
        <div
          className="flex items-center justify-between px-5 py-4 border-b shrink-0"
          style={{ borderColor: '#1e2d4a', background: '#0d1220' }}
        >
          <div className="flex items-center gap-3">
            {/* Tanaka avatar */}
            <div
              className="w-10 h-10 rounded-full flex items-center justify-center font-bold text-sm shrink-0"
              style={{ background: '#16a34a', color: '#fff', border: '2px solid #22c55e40' }}
            >
              KT
            </div>
            <div>
              <p className="text-sm font-bold" style={{ color: '#e2e8f0' }}>
                Morning Briefing — {date}
              </p>
              <p className="text-xs" style={{ color: '#64748b' }}>Dr. Kai Tanaka · Threat Intelligence</p>
            </div>
          </div>
          <button
            onClick={onClose}
            className="w-8 h-8 rounded-lg flex items-center justify-center transition-colors hover:opacity-70"
            style={{ background: '#1e2d4a', color: '#64748b' }}
          >
            <X size={15} />
          </button>
        </div>

        {/* Scroll area */}
        <div className="overflow-y-auto flex-1 p-5 space-y-5">
          {/* Tanaka intro */}
          <div
            className="rounded-xl p-4"
            style={{ background: '#111a2e', border: '1px solid #1e3a2e' }}
          >
            <p className="text-sm leading-relaxed" style={{ color: '#94a3b8' }}>
              <span className="font-semibold" style={{ color: '#22c55e' }}>Tanaka: </span>
              {tanakaMsg}
            </p>
          </div>

          {/* XP toast */}
          <AnimatePresence>
            {showXP && (
              <motion.div
                className="flex items-center justify-center gap-2 rounded-xl py-3 font-bold"
                style={{ background: 'rgba(0,232,255,0.12)', border: '1px solid rgba(0,232,255,0.3)', color: '#00e8ff' }}
                initial={{ opacity: 0, scale: 0.8 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.8 }}
                transition={{ type: 'spring', stiffness: 200 }}
              >
                <Zap size={18} />
                +50 XP — Briefing Complete!
              </motion.div>
            )}
          </AnimatePresence>

          {/* Questions */}
          {BRIEF_QUESTIONS.map((q, i) => (
            <BriefQuestionCard
              key={q.id}
              q={q}
              index={i}
              onAnswered={handleAnswered}
            />
          ))}

          {/* Case update */}
          <motion.div
            className="rounded-xl p-4"
            style={{ background: '#100808', border: '1px solid #3a1010' }}
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.6 }}
          >
            <div className="flex items-center gap-2 mb-2">
              <div className="w-2 h-2 rounded-full animate-pulse" style={{ background: '#ef4444' }} />
              <span className="text-xs font-black uppercase tracking-widest" style={{ color: '#ef4444' }}>
                Case Update — Meridian Global
              </span>
            </div>
            <p className="text-sm leading-relaxed" style={{ color: '#b0a080' }}>
              {caseHeadline}
            </p>
          </motion.div>

          {/* Finish button */}
          {done && (
            <motion.div
              className="pb-2"
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
            >
              <div className="text-center mb-3">
                <p className="text-sm font-semibold" style={{ color: '#94a3b8' }}>
                  Score: {correctCount}/{BRIEF_QUESTIONS.length} correct
                </p>
              </div>
              <button
                onClick={handleFinish}
                className="w-full rounded-xl py-3 font-bold text-sm transition-opacity hover:opacity-90"
                style={{ background: '#00e8ff', color: '#080c14' }}
              >
                Close Briefing
              </button>
            </motion.div>
          )}
        </div>

        {/* Progress bar */}
        <div
          className="h-1 shrink-0"
          style={{ background: '#1e2d4a' }}
        >
          <motion.div
            className="h-full rounded-full"
            style={{ background: '#00e8ff' }}
            initial={{ width: 0 }}
            animate={{ width: `${(answeredCount / BRIEF_QUESTIONS.length) * 100}%` }}
            transition={{ duration: 0.5 }}
          />
        </div>
      </motion.div>
    </div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function DailyBrief({ completedToday = false, onComplete }: DailyBriefProps) {
  const [open, setOpen] = useState(false);

  const today = new Date().toLocaleDateString('en-US', {
    weekday: 'long', year: 'numeric', month: 'long', day: 'numeric',
  });

  const handleComplete = () => {
    if (onComplete) onComplete();
  };

  return (
    <>
      <DossierClosed
        completedToday={completedToday}
        onOpen={() => setOpen(true)}
        date={today}
      />

      <AnimatePresence>
        {open && (
          <BriefingModal
            date={today}
            onClose={() => setOpen(false)}
            onComplete={handleComplete}
          />
        )}
      </AnimatePresence>
    </>
  );
}
