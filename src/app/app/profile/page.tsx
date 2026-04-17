'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar from '@/components/character/CharacterAvatar';
import { xpToNextLevel, getTitleForLevel } from '@/lib/xp';
import { DOMAINS } from '@/lib/constants';

// Career progression outfits tied to level thresholds
const CAREER_OUTFITS = [
  { level: 1, title: 'Junior Analyst' },
  { level: 5, title: 'Senior Analyst' },
  { level: 10, title: 'Manager' },
  { level: 15, title: 'Director' },
  { level: 20, title: 'CISO' },
];

function getCareerTitle(level: number): string {
  for (let i = CAREER_OUTFITS.length - 1; i >= 0; i--) {
    if (level >= CAREER_OUTFITS[i].level) return CAREER_OUTFITS[i].title;
  }
  return CAREER_OUTFITS[0].title;
}

function getNextCareerUnlock(level: number): { level: number; title: string } | null {
  for (const outfit of CAREER_OUTFITS) {
    if (level < outfit.level) return outfit;
  }
  return null; // Already at max
}

export default function ProfilePage() {
  const { user, setUser } = useUserStore();
  const [domainStats, setDomainStats] = useState<Record<number, { total: number; correct: number }>>({});
  const router = useRouter();
  const supabase = createClient();

  useEffect(() => {
    if (!user) return;

    const loadStats = async () => {
      // Load user answers joined with questions for domain info
      // Get last 100 per domain using a rolling window approach
      const { data: answers } = await supabase
        .from('user_answers')
        .select('is_correct, created_at, questions!inner(domain_id)')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false });

      if (answers) {
        // Group by domain, take last 100 per domain
        const domainAnswers: Record<number, { is_correct: boolean }[]> = {};
        answers.forEach((a: any) => {
          const did = a.questions?.domain_id;
          if (did) {
            if (!domainAnswers[did]) domainAnswers[did] = [];
            domainAnswers[did].push({ is_correct: a.is_correct });
          }
        });

        const stats: Record<number, { total: number; correct: number }> = {};
        Object.entries(domainAnswers).forEach(([domainId, domainAns]) => {
          // Rolling window: take only the last 100 answers for this domain
          const recent = domainAns.slice(0, 100);
          stats[parseInt(domainId)] = {
            total: recent.length,
            correct: recent.filter((a) => a.is_correct).length,
          };
        });
        setDomainStats(stats);
      }
    };

    loadStats();
  }, [user]);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    setUser(null);
    router.push('/');
  };

  if (!user) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
      </div>
    );
  }

  const levelProgress = xpToNextLevel(user.xp);
  const title = getTitleForLevel(user.level);
  const careerTitle = getCareerTitle(user.level);
  const nextCareer = getNextCareerUnlock(user.level);

  const tierColors: Record<string, { bg: string; color: string; label: string }> = {
    free: { bg: '#64748b22', color: '#64748b', label: 'Free' },
    premium: { bg: '#00e8ff22', color: '#00e8ff', label: 'Premium' },
    elite: { bg: '#ffd70022', color: '#ffd700', label: 'Elite' },
  };
  const tier = tierColors[user.subscription_tier] || tierColors.free;

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      {/* Character Card */}
      <div className="rounded-xl p-8 text-center" style={{ background: 'linear-gradient(135deg, #111a2e, #1a2540)', border: '1px solid #1e2d4a' }}>
        <CharacterAvatar
          config={{
            gender: user.character_gender === 'Woman' || user.character_gender === 'Female' ? 'Woman'
              : user.character_gender === 'Non-binary' ? 'Non-binary' : 'Man',
            skinTone:  user.character_skin      || 4,
            eyeShape:  user.character_eye_shape || 1,
            hairStyle: user.character_hair      || 1,
            hairColor: user.character_hair_color || '#2d1b00',
            outfit:    user.character_outfit    || 5,
          }}
          size={150}
          className="mx-auto"
        />
        <h1 className="text-2xl font-bold mt-4" style={{ color: '#e2e8f0' }}>{user.character_name}</h1>
        <p className="text-sm" style={{ color: '#00e8ff' }}>{title}</p>
        <div className="inline-flex items-center gap-1 mt-2 px-3 py-1 rounded-full text-xs font-medium" style={{ background: tier.bg, color: tier.color }}>
          {tier.label} Tier
        </div>
        <div className="mt-4">
          <Link
            href="/app/create-character"
            className="inline-flex items-center gap-2 px-4 py-2 rounded-lg text-xs font-medium transition-all hover:opacity-80"
            style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff', border: '1px solid rgba(0, 232, 255, 0.2)' }}
          >
            ✏️ Edit Character
          </Link>
        </div>
      </div>

      {/* Level Progress */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between mb-2">
          <span className="text-sm font-bold" style={{ color: '#ffd700' }}>Level {user.level}</span>
          <span className="text-sm font-bold" style={{ color: '#ffd700' }}>Level {user.level + 1}</span>
        </div>
        <div className="h-4 rounded-full overflow-hidden mb-2" style={{ background: '#0d1220' }}>
          <div
            className="h-full rounded-full transition-all"
            style={{ width: `${levelProgress.progress}%`, background: 'linear-gradient(90deg, #00e8ff, #00b8cc)' }}
          />
        </div>
        <p className="text-xs text-center" style={{ color: '#64748b' }}>
          {levelProgress.current} / {levelProgress.needed} XP to next level
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
        {[
          { label: 'Total XP', value: user.xp.toLocaleString(), icon: '⚡', color: '#ffd700' },
          { label: 'Level', value: user.level.toString(), icon: '📊', color: '#00e8ff' },
          { label: 'Streak', value: `${user.streak_count}d`, icon: '🔥', color: '#f97316' },
          { label: 'Title', value: title, icon: '🎖️', color: '#8b5cf6' },
        ].map((stat, i) => (
          <div key={i} className="rounded-xl p-4 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-xl mb-1">{stat.icon}</div>
            <div className="text-sm font-bold" style={{ color: stat.color }}>{stat.value}</div>
            <div className="text-xs" style={{ color: '#64748b' }}>{stat.label}</div>
          </div>
        ))}
      </div>

      {/* Domain Mastery */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-bold" style={{ color: '#e2e8f0' }}>Domain Mastery</h2>
          <span className="text-[10px]" style={{ color: '#64748b' }}>Based on last 100 answers per domain</span>
        </div>
        <div className="space-y-3">
          {DOMAINS.map((domain) => {
            const stats = domainStats[domain.id];
            const pct = stats ? Math.round((stats.correct / stats.total) * 100) : 0;
            return (
              <div key={domain.id}>
                <div className="flex items-center justify-between text-xs mb-1 gap-2">
                  <span className="min-w-0" style={{ color: '#94a3b8' }}>
                    {domain.icon} D{domain.id}: {domain.name}
                  </span>
                  <span className="shrink-0 flex items-center gap-2">
                    {stats && (
                      <span style={{ color: '#64748b' }}>{stats.correct}/{stats.total}</span>
                    )}
                    <span className="font-medium" style={{ color: domain.color }}>{pct}%</span>
                  </span>
                </div>
                <div className="h-2 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
                  <div className="h-full rounded-full transition-all" style={{ width: `${pct}%`, background: domain.color }} />
                </div>
              </div>
            );
          })}
        </div>
      </div>

      {/* Career Progression / Next Outfit */}
      <div className="rounded-xl p-6 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="font-bold mb-3" style={{ color: '#e2e8f0' }}>Career Progression</h2>
        <p className="text-sm mb-3" style={{ color: '#94a3b8' }}>
          Current Rank: <span className="font-bold" style={{ color: '#00e8ff' }}>{careerTitle}</span>
        </p>

        {/* Career ladder */}
        <div className="flex justify-center gap-1 mb-4">
          {CAREER_OUTFITS.map((co) => {
            const unlocked = user.level >= co.level;
            return (
              <div
                key={co.level}
                className="text-center px-2 py-1.5 rounded-lg"
                style={{
                  background: unlocked ? 'rgba(0, 232, 255, 0.1)' : '#0d1220',
                  border: `1px solid ${unlocked ? '#00e8ff' : '#1e2d4a'}`,
                  opacity: unlocked ? 1 : 0.5,
                }}
              >
                <div className="text-[10px] font-bold" style={{ color: unlocked ? '#00e8ff' : '#64748b' }}>
                  Lv.{co.level}
                </div>
                <div className="text-[10px]" style={{ color: unlocked ? '#e2e8f0' : '#64748b' }}>
                  {co.title}
                </div>
              </div>
            );
          })}
        </div>

        {nextCareer ? (
          <>
            <div className="inline-block">
              <CharacterAvatar
                config={{
                  gender: user.character_gender === 'Woman' || user.character_gender === 'Female' ? 'Woman'
                    : user.character_gender === 'Non-binary' ? 'Non-binary' : 'Man',
                  skinTone:  user.character_skin      || 4,
                  eyeShape:  user.character_eye_shape || 1,
                  hairStyle: user.character_hair      || 1,
                  hairColor: user.character_hair_color || '#2d1b00',
                  outfit: Math.min((user.character_outfit || 5) + 1, 6),
                }}
                size={80}
                className="opacity-50"
              />
            </div>
            <p className="text-xs mt-2" style={{ color: '#64748b' }}>
              Next: <span className="font-bold" style={{ color: '#00e8ff' }}>{nextCareer.title}</span> — Reach Level {nextCareer.level} to unlock
            </p>
          </>
        ) : (
          <p className="text-xs mt-2" style={{ color: '#ffd700' }}>
            🏆 Maximum career rank achieved!
          </p>
        )}
      </div>

      {/* Upgrade Button */}
      {user.subscription_tier === 'free' && (
        <div className="rounded-xl p-6 text-center" style={{ background: 'linear-gradient(135deg, #0d1a30, #1a2d50)', border: '1px solid #00e8ff' }}>
          <h2 className="font-bold mb-2" style={{ color: '#e2e8f0' }}>Go Premium</h2>
          <p className="text-sm mb-4" style={{ color: '#64748b' }}>
            Upgrade to Premium to access advanced features, full story mode, and 500+ questions.
          </p>
          <button className="px-8 py-3 rounded-xl font-bold text-sm transition-all hover:opacity-90" style={{ background: '#00e8ff', color: '#080c14' }}>
            Upgrade to Premium - $19.99/mo
          </button>
        </div>
      )}

      {/* Sign Out */}
      <button
        onClick={handleSignOut}
        className="w-full py-3 rounded-xl text-sm font-medium transition-all hover:opacity-80"
        style={{ border: '1px solid #ef4444', color: '#ef4444' }}
      >
        Sign Out
      </button>
    </div>
  );
}
