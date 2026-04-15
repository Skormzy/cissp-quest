'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAINS } from '@/lib/constants';
import { DOMAIN_CHAPTERS, DOMAIN_COLORS, getDomainStatus } from '@/lib/story-constants';
import { StoryModeProgress } from '@/lib/story-types';

export default function StoryHubPage() {
  const { user } = useUserStore();
  const [progress, setProgress] = useState<Record<number, StoryModeProgress>>({});
  const [loading, setLoading] = useState(true);
  const supabase = createClient();

  useEffect(() => {
    if (!user) return;
    const load = async () => {
      const { data } = await supabase
        .from('story_progress')
        .select('*')
        .eq('user_id', user.id);

      if (data) {
        const map: Record<number, StoryModeProgress> = {};
        data.forEach((p: StoryModeProgress) => { map[p.domain_number] = p; });
        setProgress(map);
      }
      setLoading(false);
    };
    load();
  }, [user, supabase]);

  const conqueredCount = Object.values(progress).filter((p) => p.domain_conquered).length;
  const allConquered = conqueredCount === 8;

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading story...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      {/* Title */}
      <div className="text-center py-4">
        <h1 className="text-2xl font-bold mb-1" style={{ color: '#e2e8f0' }}>Operation Shadow Protocol</h1>
        <p className="text-sm" style={{ color: '#94a3b8' }}>Investigate 8 coordinated breaches across the globe</p>
      </div>

      {/* Global progress */}
      <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between mb-2">
          <span className="text-xs font-bold" style={{ color: '#00e8ff' }}>Mission Progress</span>
          <span className="text-xs" style={{ color: '#64748b' }}>{conqueredCount}/8 Domains Conquered</span>
        </div>
        <div className="h-2 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
          <div
            className="h-full rounded-full transition-all duration-500"
            style={{ width: `${(conqueredCount / 8) * 100}%`, background: 'linear-gradient(90deg, #00e8ff, #22c55e)' }}
          />
        </div>
      </div>

      {/* Domain cards — 2x4 grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        {DOMAIN_CHAPTERS.map((ch, i) => {
          const domain = DOMAINS[i];
          const p = progress[ch.domainId] || null;
          const status = getDomainStatus(p);
          const color = DOMAIN_COLORS[ch.domainId];
          const isConquered = p?.domain_conquered;

          return (
            <Link
              key={ch.domainId}
              href={`/app/story/${ch.domainId}`}
              className="rounded-xl p-5 transition-all hover:scale-[1.02] group"
              style={{
                background: isConquered
                  ? `linear-gradient(135deg, ${color}08, ${color}15)`
                  : '#111a2e',
                border: `1px solid ${isConquered ? color : '#1e2d4a'}`,
              }}
            >
              <div className="flex items-start justify-between mb-3">
                <div className="flex items-center gap-2">
                  <span className="text-xl">{domain.icon}</span>
                  <span className="text-xs font-bold px-2 py-0.5 rounded-full" style={{ background: `${color}22`, color }}>
                    D{ch.domainId}
                  </span>
                </div>
                {isConquered && (
                  <span className="text-xs font-bold px-2 py-0.5 rounded-full" style={{ background: `${color}22`, color }}>
                    CONQUERED
                  </span>
                )}
              </div>
              <h3 className="font-bold text-sm mb-1" style={{ color: '#e2e8f0' }}>
                {ch.title}
              </h3>
              <p className="text-xs mb-2" style={{ color: '#64748b' }}>{ch.location}</p>
              <p className="text-xs" style={{ color: '#94a3b8' }}>{domain.name}</p>
              <div className="mt-3 pt-2" style={{ borderTop: '1px solid #1e2d4a' }}>
                <span className="text-xs" style={{ color: isConquered ? color : '#64748b' }}>
                  {status}
                </span>
              </div>
            </Link>
          );
        })}
      </div>

      {/* Final Chapter Card */}
      <div
        className="rounded-xl p-6 text-center"
        style={{
          background: allConquered ? 'linear-gradient(135deg, #1a1a00, #2a2a10)' : '#0d1220',
          border: `1px solid ${allConquered ? '#ffd700' : '#1e2d4a'}`,
          opacity: allConquered ? 1 : 0.6,
        }}
      >
        <div className="text-3xl mb-2">{allConquered ? '🏆' : '🔒'}</div>
        <h3 className="font-bold text-lg mb-1" style={{ color: allConquered ? '#ffd700' : '#64748b' }}>
          Final Chapter
        </h3>
        {allConquered ? (
          <>
            <p className="text-sm mb-4" style={{ color: '#e2e8f0' }}>
              All 8 domains conquered. Face the TLATM Gauntlet and Final Boss to earn the title of CISSP Legend.
            </p>
            <Link
              href="/app/story/final"
              className="inline-block px-8 py-3 rounded-xl font-bold text-sm transition-all hover:opacity-90"
              style={{ background: '#ffd700', color: '#080c14' }}
            >
              Enter Final Chapter
            </Link>
          </>
        ) : (
          <p className="text-sm" style={{ color: '#64748b' }}>
            {conqueredCount}/8 Domains Conquered — Complete all 8 to unlock
          </p>
        )}
      </div>
    </div>
  );
}
