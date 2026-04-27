'use client';

import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { KnowledgeCheckData } from '@/lib/story-types-v2';
import ConceptDiagram, { ConceptKey } from '@/components/diagrams/ConceptDiagram';
import {
  Dialog,
  DialogContent,
  DialogTitle,
  DialogDescription,
} from '@/components/ui/dialog';

interface KnowledgeCheckProps {
  data: KnowledgeCheckData;
  onComplete: (isCorrect: boolean) => void;
  xpReward?: number;
}

const ALL_CONCEPTS: ConceptKey[] = [
  'cia-triad', 'risk-treatment', 'ale-formula', 'grc-immune', 'policy-pyramid',
  'bell-lapadula', 'biba', 'defense-in-depth', 'osi-stack', 'tls-handshake',
  'kerberos-flow', 'least-privilege', 'zero-trust', 'biometric-curve',
  'evidence-volatility', 'pentest-phases', 'sast-dast-iast', 'nist-ir-cycle',
  'siem-soar', 'dr-test-ladder', 'devsecops-pipeline', 'owasp-top-10',
  'data-lifecycle', 'aaa-services', 'sanitization-levels', 'cer-curve',
  'oauth-flow', 'wireless-auth', 'cap-theorem', 'sd-lc-shift-left',
];

function isConceptKey(s: string | undefined): s is ConceptKey {
  return !!s && (ALL_CONCEPTS as string[]).includes(s);
}

function XPFloat({ amount }: { amount: number }) {
  return (
    <motion.div
      className="absolute left-1/2 -translate-x-1/2 top-4 pointer-events-none z-50 select-none"
      initial={{ opacity: 1, y: 0, scale: 1 }}
      animate={{ opacity: 0, y: -60, scale: 1.3 }}
      transition={{ duration: 1.4, ease: 'easeOut' }}
      aria-hidden
    >
      <span
        className="text-2xl font-extrabold"
        style={{ color: '#ffd700', textShadow: '0 0 20px #ffd70088' }}
      >
        +{amount} XP
      </span>
    </motion.div>
  );
}

export default function KnowledgeCheck({
  data,
  onComplete,
  xpReward = 50,
}: KnowledgeCheckProps) {
  const [open, setOpen] = useState(true);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [revealed, setRevealed] = useState(false);
  const [showXP, setShowXP] = useState(false);
  const isCorrect = selectedIndex === data.correctIndex;
  const concept = isConceptKey(data.diagram) ? data.diagram : null;

  useEffect(() => {
    if (!showXP) return;
    const t = window.setTimeout(() => setShowXP(false), 1500);
    return () => window.clearTimeout(t);
  }, [showXP]);

  const handleSelect = (index: number) => {
    if (revealed) return;
    setSelectedIndex(index);
    setRevealed(true);
    if (index === data.correctIndex) setShowXP(true);
  };

  const handleClose = () => {
    if (!revealed) return; // gate dismissal until answered
    setOpen(false);
    // Defer onComplete so the close animation can play.
    window.setTimeout(() => onComplete(isCorrect), 120);
  };

  const optionStyle = (i: number) => {
    if (!revealed) return { background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' };
    if (i === data.correctIndex) return { background: 'rgba(34,197,94,0.10)', border: '1px solid #22c55e', color: '#22c55e' };
    if (i === selectedIndex) return { background: 'rgba(239,68,68,0.10)', border: '1px solid #ef4444', color: '#ef4444' };
    return { background: '#0d1220', border: '1px solid #1e2d4a', color: '#64748b' };
  };

  return (
    <Dialog
      open={open}
      onOpenChange={(next) => {
        // Only allow Radix-driven close (Escape, backdrop) AFTER the user
        // has answered. Otherwise force the dialog to stay open.
        if (next || revealed) setOpen(next);
        if (!next && revealed) {
          window.setTimeout(() => onComplete(isCorrect), 120);
        }
      }}
    >
      <DialogContent
        className="max-w-5xl! w-[calc(100%-2rem)]! p-0! bg-transparent! ring-0! overflow-hidden"
        showCloseButton={false}
      >
        <div
          className="rounded-2xl overflow-hidden"
          style={{
            background: 'linear-gradient(135deg, #0d1220 0%, #111a2e 100%)',
            border: '1px solid rgba(0,232,255,0.25)',
            boxShadow: '0 0 60px rgba(0,232,255,0.10), 0 24px 48px rgba(0,0,0,0.6)',
          }}
        >
          <AnimatePresence>{showXP && <XPFloat amount={xpReward} />}</AnimatePresence>

          {/* Header */}
          <div
            className="px-6 py-4 flex items-center gap-3"
            style={{ background: 'rgba(0,232,255,0.06)', borderBottom: '1px solid rgba(30,45,74,0.8)' }}
          >
            <div
              className="w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold"
              style={{ background: 'rgba(0,232,255,0.15)', color: '#00e8ff' }}
              aria-hidden
            >
              ?
            </div>
            <div>
              <DialogTitle
                className="text-xs font-bold m-0 p-0"
                style={{ color: '#00e8ff' }}
              >
                Knowledge Check
              </DialogTitle>
              <DialogDescription
                className="text-[10px] m-0 p-0"
                style={{ color: '#64748b' }}
              >
                No penalty for wrong answers
              </DialogDescription>
            </div>
            <div
              className="ml-auto text-xs font-bold px-2 py-1 rounded-full"
              style={{ background: 'rgba(255,215,0,0.1)', color: '#ffd700' }}
            >
              +{xpReward} XP
            </div>
          </div>

          {/* Body */}
          <div className={concept ? 'grid grid-cols-1 lg:grid-cols-[1fr_minmax(0,1.05fr)] gap-6 p-6' : 'p-6 space-y-4'}>
            {concept && (
              <div className="flex flex-col items-center justify-start gap-3 min-w-0">
                <div className="w-full max-w-105">
                  <ConceptDiagram concept={concept} width={420} height={320} />
                </div>
                <p className="text-[10px] font-mono uppercase tracking-widest text-center" style={{ color: '#64748b' }}>
                  Use the diagram to anchor your answer
                </p>
              </div>
            )}

            <div className="space-y-4 min-w-0">
              <p className="text-sm leading-relaxed font-medium" style={{ color: '#e2e8f0' }}>
                {data.question}
              </p>

              <div className="space-y-2">
                {data.options.map((opt, i) => (
                  <motion.button
                    key={i}
                    onClick={() => handleSelect(i)}
                    disabled={revealed}
                    className="w-full text-left px-4 py-3 rounded-xl text-sm transition-colors"
                    style={optionStyle(i)}
                    whileHover={!revealed ? { scale: 1.01 } : {}}
                    whileTap={!revealed ? { scale: 0.99 } : {}}
                    aria-pressed={selectedIndex === i}
                  >
                    <span className="font-bold mr-2" style={{ opacity: 0.6 }}>
                      {String.fromCharCode(65 + i)}.
                    </span>
                    {opt}
                    {revealed && i === data.correctIndex && <span className="ml-2 text-lg" aria-hidden>✓</span>}
                    {revealed && i === selectedIndex && i !== data.correctIndex && (
                      <span className="ml-2 text-lg" aria-hidden>✗</span>
                    )}
                  </motion.button>
                ))}
              </div>

              <AnimatePresence>
                {revealed && (
                  <motion.div
                    className="space-y-3"
                    initial={{ opacity: 0, y: 12 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.3, delay: 0.1 }}
                  >
                    <div
                      className="px-4 py-3 rounded-xl text-sm leading-relaxed"
                      style={{
                        background: isCorrect ? 'rgba(34,197,94,0.08)' : 'rgba(239,68,68,0.08)',
                        border: `1px solid ${isCorrect ? '#22c55e33' : '#ef444433'}`,
                      }}
                      role="status"
                      aria-live="polite"
                    >
                      <p className="text-xs font-bold mb-1" style={{ color: isCorrect ? '#22c55e' : '#ef4444' }}>
                        {isCorrect ? 'Correct!' : "Not quite — here's the key:"}
                      </p>
                      <p style={{ color: '#94a3b8' }}>{data.explanation}</p>
                    </div>

                    {data.memoryHack && (
                      <motion.div
                        className="px-4 py-3 rounded-xl text-sm"
                        style={{
                          background: 'rgba(255,215,0,0.05)',
                          border: '1px solid rgba(255,215,0,0.2)',
                          boxShadow: '0 0 20px rgba(255,215,0,0.04)',
                        }}
                        initial={{ opacity: 0, y: 8 }}
                        animate={{ opacity: 1, y: 0 }}
                        transition={{ duration: 0.25, delay: 0.2 }}
                      >
                        <p className="text-[10px] font-bold uppercase tracking-widest mb-1" style={{ color: '#ffd700' }}>
                          🧠 Memory Hack
                        </p>
                        <p style={{ color: '#e2e8f0' }}>{data.memoryHack}</p>
                      </motion.div>
                    )}

                    <motion.button
                      onClick={handleClose}
                      className="w-full py-3 rounded-xl text-sm font-bold transition-all"
                      style={{ background: '#00e8ff', color: '#080c14' }}
                      whileHover={{ scale: 1.02, boxShadow: '0 0 20px rgba(0,232,255,0.4)' }}
                      whileTap={{ scale: 0.98 }}
                      initial={{ opacity: 0, y: 8 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ duration: 0.2, delay: 0.35 }}
                      autoFocus
                    >
                      Continue Story →
                    </motion.button>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  );
}
