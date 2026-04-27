'use client';

// Interactive flashcard widget for library topics. Click the card to
// flip it. Use the navigation buttons to move through cards. Tracks
// "known / unsure / unknown" so the user gets a sense of progress
// without DB persistence (intentional - low-stakes practice).

import { useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';

interface FlashcardData {
  front: string;
  back: string;
  hint?: string;
}

interface Props {
  cards: FlashcardData[];
  title?: string;
}

type Mark = 'unknown' | 'unsure' | 'known';

export default function LibraryFlashcard({ cards, title }: Props) {
  const [index, setIndex] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [marks, setMarks] = useState<Record<number, Mark>>({});

  const safeCards = useMemo(() => cards.filter((c) => c?.front && c?.back), [cards]);
  if (safeCards.length === 0) return null;

  const card = safeCards[index];
  const counts = useMemo(() => {
    let known = 0, unsure = 0, unknown = 0;
    for (const m of Object.values(marks)) {
      if (m === 'known') known++;
      else if (m === 'unsure') unsure++;
      else unknown++;
    }
    return { known, unsure, unknown, remaining: safeCards.length - Object.keys(marks).length };
  }, [marks, safeCards.length]);

  const next = () => {
    setFlipped(false);
    setIndex((i) => (i + 1) % safeCards.length);
  };
  const prev = () => {
    setFlipped(false);
    setIndex((i) => (i - 1 + safeCards.length) % safeCards.length);
  };
  const mark = (m: Mark) => {
    setMarks((prev) => ({ ...prev, [index]: m }));
    setTimeout(next, 220);
  };

  return (
    <div
      className="rounded-2xl p-5 space-y-4"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      <div className="flex items-center justify-between">
        <div>
          <h3 className="font-bold text-sm flex items-center gap-2" style={{ color: '#e2e8f0' }}>
            🃏 {title ?? 'Flashcards'}
          </h3>
          <p className="text-[10px] font-mono uppercase tracking-widest" style={{ color: '#64748b' }}>
            Click card to flip · {index + 1} of {safeCards.length}
          </p>
        </div>
        <div className="flex items-center gap-2 text-[10px] font-mono">
          <span className="px-2 py-0.5 rounded-full" style={{ background: 'rgba(34,197,94,0.15)', color: '#22c55e' }}>
            ✓ {counts.known}
          </span>
          <span className="px-2 py-0.5 rounded-full" style={{ background: 'rgba(245,158,11,0.15)', color: '#f59e0b' }}>
            ~ {counts.unsure}
          </span>
          <span className="px-2 py-0.5 rounded-full" style={{ background: 'rgba(239,68,68,0.15)', color: '#ef4444' }}>
            ✗ {counts.unknown}
          </span>
        </div>
      </div>

      <div className="relative" style={{ perspective: 1200, height: 240 }}>
        <AnimatePresence mode="wait">
          <motion.button
            key={`${index}-${flipped}`}
            onClick={() => setFlipped((f) => !f)}
            className="absolute inset-0 w-full h-full rounded-2xl text-left p-6 flex items-center justify-center text-center transition-colors"
            style={{
              background: flipped
                ? 'linear-gradient(135deg, rgba(0,232,255,0.06) 0%, rgba(139,92,246,0.06) 100%)'
                : '#111a2e',
              border: `1px solid ${flipped ? 'rgba(0,232,255,0.4)' : '#1e2d4a'}`,
              boxShadow: flipped ? '0 0 32px rgba(0,232,255,0.12)' : 'none',
            }}
            initial={{ rotateY: flipped ? -90 : 90, opacity: 0 }}
            animate={{ rotateY: 0, opacity: 1 }}
            exit={{ rotateY: flipped ? 90 : -90, opacity: 0 }}
            transition={{ duration: 0.32, ease: 'easeInOut' }}
            aria-label={flipped ? 'Flip back to front' : 'Flip to reveal answer'}
          >
            <div className="space-y-2 max-w-md">
              <p className="text-[10px] font-mono uppercase tracking-widest" style={{ color: flipped ? '#00e8ff' : '#64748b' }}>
                {flipped ? 'Answer' : 'Question'}
              </p>
              <p className="text-base font-medium" style={{ color: '#e2e8f0' }}>
                {flipped ? card.back : card.front}
              </p>
              {!flipped && card.hint && (
                <p className="text-xs italic pt-2" style={{ color: '#64748b' }}>
                  Hint: {card.hint}
                </p>
              )}
            </div>
          </motion.button>
        </AnimatePresence>
      </div>

      <div className="flex items-center justify-between gap-2">
        <button
          onClick={prev}
          className="px-3 py-2 rounded-lg text-sm transition-colors"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}
        >
          ← Prev
        </button>
        <div className="flex items-center gap-2">
          <button
            onClick={() => mark('unknown')}
            className="px-3 py-2 rounded-lg text-xs font-bold transition-colors"
            style={{ background: 'rgba(239,68,68,0.10)', border: '1px solid #ef4444', color: '#ef4444' }}
          >
            ✗ Don&apos;t know
          </button>
          <button
            onClick={() => mark('unsure')}
            className="px-3 py-2 rounded-lg text-xs font-bold transition-colors"
            style={{ background: 'rgba(245,158,11,0.10)', border: '1px solid #f59e0b', color: '#f59e0b' }}
          >
            ~ Unsure
          </button>
          <button
            onClick={() => mark('known')}
            className="px-3 py-2 rounded-lg text-xs font-bold transition-colors"
            style={{ background: 'rgba(34,197,94,0.10)', border: '1px solid #22c55e', color: '#22c55e' }}
          >
            ✓ Got it
          </button>
        </div>
        <button
          onClick={next}
          className="px-3 py-2 rounded-lg text-sm transition-colors"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}
        >
          Next →
        </button>
      </div>
    </div>
  );
}
