'use client';

import { useState, useEffect, useCallback } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { DOMAINS } from '@/lib/constants';
import { DOMAIN_COLORS } from '@/lib/story-constants';
import CATQuizEngine from '@/components/quiz/CATQuizEngine';
import { CAT_CONFIGS, CATResults } from '@/lib/cat-session';

export default function BossBattlePage() {
  const params = useParams();
  const domainId = parseInt(params.domain as string);
  const { user } = useUserStore();
  const supabase = createClient();

  const [gateCheck, setGateCheck] = useState<'loading' | 'locked' | 'open'>('loading');
  const [result, setResult] = useState<'idle' | 'pass' | 'fail'>('idle');
  const [score, setScore] = useState(0);
  const [weakDomains, setWeakDomains] = useState<number[]>([]);

  const domain = DOMAINS.find((d) => d.id === domainId);
  const color = DOMAIN_COLORS[domainId] || '#00e8ff';

  useEffect(() => {
    if (!user) return;
    const check = async () => {
      const { data } = await supabase
        .from('story_progress')
        .select('act4_completed')
        .eq('user_id', user.id)
        .eq('domain_number', domainId)
        .single();

      setGateCheck(data?.act4_completed ? 'open' : 'locked');
    };
    check();
  }, [user, domainId, supabase]);

  const handlePass = useCallback(async (results: CATResults) => {
    setScore(results.accuracy);
    setResult('pass');
    if (!user) return;

    const { data: existing } = await supabase
      .from('story_progress')
      .select('boss_battle_best_score, boss_battle_attempts')
      .eq('user_id', user.id)
      .eq('domain_number', domainId)
      .single();

    const bestScore = Math.max(results.accuracy, existing?.boss_battle_best_score || 0);
    const attempts = (existing?.boss_battle_attempts || 0) + 1;

    await supabase
      .from('story_progress')
      .update({
        boss_battle_passed: true,
        boss_battle_score: results.accuracy,
        boss_battle_best_score: bestScore,
        boss_battle_attempts: attempts,
        domain_conquered: true,
        conquered_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      })
      .eq('user_id', user.id)
      .eq('domain_number', domainId);
  }, [user, domainId, supabase]);

  const handleFail = useCallback(async (results: CATResults) => {
    setScore(results.accuracy);
    const weak = Object.entries(results.domainBreakdown)
      .filter(([, d]) => d.total > 0 && (d.correct / d.total) < 0.5)
      .map(([id]) => parseInt(id));
    setWeakDomains(weak);
    setResult('fail');
    if (!user) return;

    const { data: existing } = await supabase
      .from('story_progress')
      .select('boss_battle_best_score, boss_battle_attempts')
      .eq('user_id', user.id)
      .eq('domain_number', domainId)
      .single();

    const bestScore = Math.max(results.accuracy, existing?.boss_battle_best_score || 0);
    const attempts = (existing?.boss_battle_attempts || 0) + 1;

    await supabase
      .from('story_progress')
      .update({
        boss_battle_score: results.accuracy,
        boss_battle_best_score: bestScore,
        boss_battle_attempts: attempts,
        updated_at: new Date().toISOString(),
      })
      .eq('user_id', user.id)
      .eq('domain_number', domainId);
  }, [user, domainId, supabase]);

  if (!domain || domainId < 1 || domainId > 8) {
    return (
      <div className="text-center py-20">
        <p style={{ color: '#64748b' }}>Domain not found</p>
        <Link href="/app/story" className="text-sm mt-4 inline-block" style={{ color: '#00e8ff' }}>Back to Story Hub</Link>
      </div>
    );
  }

  if (gateCheck === 'loading') {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: color, borderTopColor: 'transparent' }} />
      </div>
    );
  }

  if (gateCheck === 'locked') {
    return (
      <div className="max-w-2xl mx-auto text-center py-20">
        <div className="text-4xl mb-4">🔒</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Boss Battle Locked</h2>
        <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>Complete Act 4: The Escalation before challenging the Boss Battle.</p>
        <Link href={`/app/story/${domainId}`} className="inline-block px-6 py-2 rounded-lg text-sm font-bold" style={{ background: color, color: '#080c14' }}>
          Back to Chapter
        </Link>
      </div>
    );
  }

  if (result === 'pass') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: `1px solid ${color}44` }}>
          <div className="text-5xl mb-3">👹</div>
          <h2 className="text-2xl font-bold mb-2" style={{ color }}>Domain {domainId} Conquered!</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-6" style={{ color: '#94a3b8' }}>
            You&apos;ve defeated the Boss and mastered {domain.name}!
          </p>
          <Link href="/app/story" className="inline-block px-6 py-2 rounded-lg text-sm font-bold" style={{ background: color, color: '#080c14' }}>
            Back to Story Hub
          </Link>
        </div>
      </div>
    );
  }

  if (result === 'fail') {
    return (
      <div className="max-w-2xl mx-auto text-center py-10">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #ef444444' }}>
          <div className="text-5xl mb-3">💪</div>
          <h2 className="text-xl font-bold mb-2" style={{ color: '#f97316' }}>The Boss Stands</h2>
          <p className="text-lg font-bold mb-4" style={{ color: '#e2e8f0' }}>{Math.round(score)}%</p>
          <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>
            You need 70% to conquer this domain. Focus on your weak areas and try again.
          </p>
          {weakDomains.length > 0 && (
            <div className="mb-6 p-3 rounded-lg" style={{ background: '#0d1220' }}>
              <p className="text-xs font-bold mb-2" style={{ color: '#f97316' }}>Weak Areas</p>
              {weakDomains.map((d) => {
                const wd = DOMAINS.find((dom) => dom.id === d);
                return (
                  <p key={d} className="text-xs" style={{ color: '#94a3b8' }}>{wd?.name || `Domain ${d}`}</p>
                );
              })}
            </div>
          )}
          <div className="flex gap-3 justify-center">
            <button onClick={() => setResult('idle')} className="px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#ef4444', color: 'white' }}>
              Retry Boss Battle
            </button>
            <Link href={`/app/story/${domainId}`} className="px-6 py-2 rounded-lg text-sm" style={{ border: '1px solid #1e2d4a', color: '#94a3b8' }}>
              Back to Chapter
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-3xl mx-auto">
      <Link href={`/app/story/${domainId}`} className="text-xs inline-flex items-center gap-1 mb-4" style={{ color: '#64748b' }}>
        ← Back to Chapter
      </Link>

      {/* Mission briefing */}
      <div className="rounded-xl p-5 mb-6" style={{ background: '#111a2e', border: '1px solid #ef444433' }}>
        <div className="flex items-center gap-3 mb-2">
          <span className="text-2xl">👹</span>
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#ef4444' }}>Boss Battle — Domain {domainId}</h2>
            <p className="text-xs" style={{ color: '#64748b' }}>{domain.name}</p>
          </div>
        </div>
        <p className="text-sm" style={{ color: '#94a3b8' }}>Adaptive assessment — 30-40 questions that match your ability</p>
      </div>

      <CATQuizEngine
        config={CAT_CONFIGS.boss_battle(domainId)}
        onPass={handlePass}
        onFail={handleFail}
      />
    </div>
  );
}
