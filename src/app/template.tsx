'use client';

/**
 * Next.js App Router template — runs on every navigation, unmounting and
 * remounting children. Pairs with Framer Motion to give the entire app a
 * subtle fade + slide on every route change. Honors prefers-reduced-motion
 * automatically via useReducedMotion.
 */

import { motion, useReducedMotion } from 'framer-motion';

export default function Template({ children }: { children: React.ReactNode }) {
  const reduce = useReducedMotion();
  return (
    <motion.div
      initial={{ opacity: 0, y: reduce ? 0 : 8 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: reduce ? 0.12 : 0.32, ease: [0.2, 0, 0, 1] }}
    >
      {children}
    </motion.div>
  );
}
