'use client';

/**
 * Floating XP gain indicator. Renders a +N XP burst that pops, drifts
 * upward, and fades. Used immediately after quiz answers, scene completes,
 * and gauntlet rounds. Self-unmounts via setTimeout, no parent state needed.
 *
 * Pattern: render <XpToastHost /> once near the root; call `emitXp(n)` from
 * anywhere to trigger a toast at the cursor / origin coords.
 */

import { useEffect, useRef, useState } from 'react';
import { AnimatePresence, motion, useReducedMotion } from 'framer-motion';

interface Burst {
  id: string;
  amount: number;
  x: number;
  y: number;
  variant: 'normal' | 'critical' | 'rank';
}

const listeners = new Set<(b: Burst) => void>();

function makeId(): string {
  if (typeof crypto !== 'undefined' && 'randomUUID' in crypto) return crypto.randomUUID();
  return `${Date.now()}-${Math.random().toString(36).slice(2)}`;
}

export function emitXp(amount: number, opts?: { x?: number; y?: number; variant?: Burst['variant'] }) {
  if (typeof window === 'undefined') return;
  const b: Burst = {
    id: makeId(),
    amount,
    x: opts?.x ?? window.innerWidth / 2,
    y: opts?.y ?? window.innerHeight / 2,
    variant: opts?.variant ?? 'normal',
  };
  listeners.forEach((l) => l(b));
}

export default function XpToastHost() {
  const [bursts, setBursts] = useState<Burst[]>([]);
  const mountedRef = useRef(true);
  const timeoutsRef = useRef<Set<number>>(new Set());
  const reduce = useReducedMotion() ?? false;

  useEffect(() => {
    mountedRef.current = true;
    const onBurst = (b: Burst) => {
      if (!mountedRef.current) return;
      setBursts((prev) => [...prev, b]);
      const t = window.setTimeout(() => {
        timeoutsRef.current.delete(t);
        if (!mountedRef.current) return;
        setBursts((prev) => prev.filter((x) => x.id !== b.id));
      }, 1500);
      timeoutsRef.current.add(t);
    };
    listeners.add(onBurst);
    const timeouts = timeoutsRef.current;
    return () => {
      mountedRef.current = false;
      listeners.delete(onBurst);
      timeouts.forEach((t) => window.clearTimeout(t));
      timeouts.clear();
    };
  }, []);

  return (
    <div className="pointer-events-none fixed inset-0 z-[60] overflow-hidden">
      <AnimatePresence>
        {bursts.map((b) => {
          const color =
            b.variant === 'critical' ? '#ffd700' : b.variant === 'rank' ? '#a855f7' : '#00e8ff';
          const label = b.variant === 'rank' ? `RANK +${b.amount}` : `+${b.amount} XP`;
          return (
            <motion.div
              key={b.id}
              className="absolute font-mono text-2xl font-bold tabular-nums will-change-transform"
              style={{
                left: b.x,
                top: b.y,
                color,
                textShadow: `0 0 12px ${color}, 0 0 32px ${color}66`,
                transform: 'translate(-50%, -50%)',
              }}
              initial={reduce ? { opacity: 0 } : { opacity: 0, scale: 0.4, y: 0 }}
              animate={
                reduce
                  ? { opacity: [0, 1, 1, 0] }
                  : {
                      opacity: [0, 1, 1, 0],
                      scale: b.variant === 'critical' ? [0.4, 1.6, 1.2, 1] : [0.4, 1.2, 1, 0.95],
                      y: [-0, -20, -40, -80],
                    }
              }
              exit={{ opacity: 0 }}
              transition={{ duration: reduce ? 0.6 : 1.5, ease: 'easeOut', times: [0, 0.2, 0.7, 1] }}
            >
              {label}
            </motion.div>
          );
        })}
      </AnimatePresence>
    </div>
  );
}
