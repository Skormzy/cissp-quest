'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { motion } from 'framer-motion';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import TanakaNotebook from '@/components/story/TanakaNotebook';

// ─── Unlock calculation ────────────────────────────────────

function getUnlockedDomains(completedDomains: number[]): number[] {
  const unlocked = new Set<number>([1]);
  for (let i = 1; i <= 8; i++) {
    if (completedDomains.includes(i) && i < 8) {
      unlocked.add(i + 1);
    }
  }
  return Array.from(unlocked).sort((a, b) => a - b);
}

// ─── Page ──────────────────────────────────────────────────

export default function TanakaNotebookPage() {
  const { user } = useUserStore();
  const [completedDomains, setCompletedDomains] = useState<number[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user) {
      setLoading(false);
      return;
    }

    const load = async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from('story_progress')
        .select('domain_number, act1_completed')
        .eq('user_id', user.id)
        .eq('act1_completed', true);

      if (data) {
        setCompletedDomains(
          data.map((r: { domain_number: number }) => r.domain_number),
        );
      }
      setLoading(false);
    };

    load();
  }, [user]);

  const unlockedDomains = getUnlockedDomains(completedDomains);

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <div
            className="w-10 h-10 rounded-full border-2 animate-spin mx-auto mb-4"
            style={{
              borderColor: 'rgba(180,130,60,0.6)',
              borderTopColor: 'transparent',
            }}
          />
          <p style={{ color: 'rgba(180,130,60,0.6)' }}>
            Loading the Sentinel Files...
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-5xl mx-auto space-y-6">
      {/* Back nav */}
      <div className="flex items-center justify-between">
        <Link
          href="/app/story"
          className="text-xs inline-flex items-center gap-1 transition-opacity hover:opacity-80"
          style={{ color: 'rgba(180,130,60,0.7)' }}
        >
          ← Story Hub
        </Link>
        <span
          className="text-xs font-bold px-3 py-1 rounded-full"
          style={{
            background: 'rgba(180,130,60,0.1)',
            border: '1px solid rgba(180,130,60,0.3)',
            color: 'rgba(180,130,60,0.8)',
          }}
        >
          {unlockedDomains.length}/8 Acts Unlocked
        </span>
      </div>

      {/* Page header */}
      <motion.div
        className="text-center py-4"
        initial={{ opacity: 0, y: -16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="flex items-center justify-center gap-3 mb-2">
          <span className="text-2xl">📓</span>
          <h1
            className="text-2xl font-serif italic"
            style={{ color: 'rgba(230,200,120,0.95)' }}
          >
            Dr. Tanaka&apos;s Field Notes
          </h1>
        </div>
        <p
          className="text-sm font-serif italic"
          style={{ color: 'rgba(180,140,70,0.7)' }}
        >
          The Sentinel Files — Operation Shadow Protocol
        </p>
        <p
          className="text-xs mt-2 max-w-xl mx-auto"
          style={{ color: 'rgba(150,110,50,0.7)' }}
        >
          Dr. Keiko Tanaka&apos;s classified investigation notes, synthesising
          CISSP domain knowledge with the Meridian Global Breach case study.
          Unlock new acts as you progress through the story.
        </p>
      </motion.div>

      {/* The notebook */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5, delay: 0.1 }}
      >
        <TanakaNotebook unlockedDomains={unlockedDomains} />
      </motion.div>

      {/* Footer note */}
      <div className="text-center pb-4">
        <p
          className="text-xs font-serif italic"
          style={{ color: 'rgba(130,90,30,0.5)' }}
        >
          Complete story acts to unlock additional field notes from Dr.
          Tanaka&apos;s investigation.
        </p>
      </div>
    </div>
  );
}
