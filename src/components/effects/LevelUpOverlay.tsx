'use client';

/**
 * Full-screen level-up celebration. Triggered when awardXp() returns
 * leveledUp:true. Renders a darkened backdrop with rays + medal +
 * "LEVEL N" + new rank title.
 *
 * Behavior:
 *   - Events queue: rapid back-to-back level grants display in sequence,
 *     never silently drop.
 *   - Auto-dismiss after 3.2s, click anywhere on backdrop to skip.
 *   - First 600ms after entry suppresses click-dismiss so the user
 *     can register what just happened.
 *   - Escape key dismisses.
 *   - Honors prefers-reduced-motion: skips ray rotation and dramatic
 *     entrance, keeps fade.
 *   - Marked role=dialog, aria-modal, focused on mount.
 *
 * Usage:
 *   import { emitLevelUp } from '@/components/effects/LevelUpOverlay';
 *   emitLevelUp({ newLevel: 8, newRank: 'Senior Analyst', rankedUp: true });
 */

import { useEffect, useRef, useState } from 'react';
import { AnimatePresence, motion, useReducedMotion } from 'framer-motion';

export interface LevelUpEvent {
  newLevel: number;
  newRank: string;
  rankedUp: boolean;
}

const listeners = new Set<(e: LevelUpEvent) => void>();

export function emitLevelUp(e: LevelUpEvent) {
  listeners.forEach((l) => l(e));
}

export default function LevelUpHost() {
  const [queue, setQueue] = useState<LevelUpEvent[]>([]);
  const [canDismiss, setCanDismiss] = useState(false);
  const mountedRef = useRef(true);
  const dialogRef = useRef<HTMLDivElement>(null);
  const reduce = useReducedMotion() ?? false;
  const event = queue[0] ?? null;

  useEffect(() => {
    mountedRef.current = true;
    const onEvent = (e: LevelUpEvent) => {
      if (!mountedRef.current) return;
      setQueue((q) => [...q, e]);
    };
    listeners.add(onEvent);
    return () => {
      mountedRef.current = false;
      listeners.delete(onEvent);
    };
  }, []);

  useEffect(() => {
    if (!event) return;
    setCanDismiss(false);
    const guard = window.setTimeout(() => {
      if (mountedRef.current) setCanDismiss(true);
    }, reduce ? 200 : 600);
    const auto = window.setTimeout(() => {
      if (mountedRef.current) setQueue((q) => q.slice(1));
    }, reduce ? 1800 : 3200);

    dialogRef.current?.focus();

    return () => {
      window.clearTimeout(guard);
      window.clearTimeout(auto);
    };
  }, [event, reduce]);

  const dismiss = () => {
    if (!canDismiss) return;
    setQueue((q) => q.slice(1));
  };

  useEffect(() => {
    if (!event) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') dismiss();
    };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [event, canDismiss]);

  return (
    <AnimatePresence>
      {event && (
        <motion.div
          ref={dialogRef}
          role="dialog"
          aria-modal="true"
          aria-labelledby="levelup-headline"
          aria-describedby="levelup-sub"
          tabIndex={-1}
          className="fixed inset-0 z-[70] flex flex-col items-center justify-center outline-none"
          style={{
            background: 'radial-gradient(ellipse at center, rgba(0,232,255,0.18) 0%, rgba(4,8,16,0.85) 60%)',
            cursor: canDismiss ? 'pointer' : 'default',
          }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.35 }}
          onClick={dismiss}
        >
          {/* Animated rays */}
          <motion.div
            className="absolute inset-0 pointer-events-none"
            style={{
              background:
                'conic-gradient(from 0deg, rgba(0,232,255,0.0) 0deg, rgba(0,232,255,0.18) 8deg, rgba(0,232,255,0.0) 16deg, rgba(0,232,255,0.0) 30deg, rgba(255,215,0,0.16) 38deg, rgba(0,232,255,0.0) 46deg)',
            }}
            initial={{ rotate: 0, opacity: 0 }}
            animate={{ rotate: reduce ? 0 : 360, opacity: 1 }}
            transition={{
              rotate: reduce ? { duration: 0 } : { duration: 12, repeat: Infinity, ease: 'linear' },
              opacity: { duration: 0.5 },
            }}
          />

          {/* Medal */}
          <motion.div
            className="relative w-32 h-32 rounded-full flex items-center justify-center font-mono font-bold text-5xl"
            style={{
              background: 'radial-gradient(ellipse at 35% 30%, #ffd700 0%, #b8860b 70%, #5c3d00 100%)',
              boxShadow: '0 0 60px rgba(255,215,0,0.6), 0 0 0 4px rgba(0,0,0,0.4), inset 0 -8px 16px rgba(0,0,0,0.3)',
              color: '#1a1100',
            }}
            initial={reduce ? { scale: 0.92, opacity: 0 } : { scale: 0, rotate: -45 }}
            animate={reduce ? { scale: 1, opacity: 1 } : { scale: [0, 1.25, 1], rotate: [-45, 10, 0] }}
            transition={
              reduce
                ? { duration: 0.25 }
                : { duration: 0.7, times: [0, 0.6, 1], ease: 'easeOut' }
            }
          >
            {event.newLevel}
          </motion.div>

          {/* "LEVEL UP" headline */}
          <motion.h2
            id="levelup-headline"
            className="mt-8 text-3xl md:text-5xl font-bold font-display tracking-tight"
            style={{ color: '#ffd700', textShadow: '0 0 24px rgba(255,215,0,0.55)' }}
            initial={{ opacity: 0, y: reduce ? 0 : 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: reduce ? 0 : 0.3, duration: reduce ? 0.2 : 0.4 }}
          >
            {event.rankedUp ? 'RANK UP' : 'LEVEL UP'}
          </motion.h2>

          <motion.p
            id="levelup-sub"
            className="mt-2 text-base md:text-lg font-mono uppercase tracking-[0.3em]"
            style={{ color: '#00e8ff' }}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: reduce ? 0 : 0.5, duration: 0.4 }}
          >
            Level {event.newLevel} · {event.newRank}
          </motion.p>

          <motion.p
            className="mt-6 text-xs font-mono"
            style={{ color: '#94a3b8' }}
            initial={{ opacity: 0 }}
            animate={{ opacity: canDismiss ? 1 : 0.4 }}
            transition={{ delay: reduce ? 0 : 1.2, duration: 0.5 }}
          >
            {canDismiss ? 'Tap or press Esc to dismiss' : '...'}
          </motion.p>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
