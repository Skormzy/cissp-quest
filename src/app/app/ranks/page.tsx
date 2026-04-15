'use client';

import { useState } from 'react';
import { useUserStore } from '@/stores/useUserStore';
import { getTitleForLevel } from '@/lib/xp';

interface LeaderboardEntry {
  rank: number;
  name: string;
  level: number;
  xp: number;
  title: string;
  isPlayer?: boolean;
}

// Seed 10 fake entries
const FAKE_LEADERBOARD: LeaderboardEntry[] = [
  { rank: 1, name: 'CyberSamurai', level: 42, xp: 168100, title: 'Security Architect' },
  { rank: 2, name: 'ZeroDay_Queen', level: 38, xp: 136900, title: 'Security Architect' },
  { rank: 3, name: 'PacketStorm', level: 35, xp: 115600, title: 'Senior Analyst' },
  { rank: 4, name: 'FirewallPhoenix', level: 31, xp: 90000, title: 'Senior Analyst' },
  { rank: 5, name: 'CryptoKnight', level: 28, xp: 72900, title: 'Cyber Specialist' },
  { rank: 6, name: 'NmapNinja', level: 25, xp: 57600, title: 'Cyber Specialist' },
  { rank: 7, name: 'SQLSorcerer', level: 22, xp: 44100, title: 'Cyber Specialist' },
  { rank: 8, name: 'MalwareMaverick', level: 19, xp: 32400, title: 'Security Analyst' },
  { rank: 9, name: 'RootShell', level: 16, xp: 22500, title: 'Security Analyst' },
  { rank: 10, name: 'ByteGuardian', level: 12, xp: 12100, title: 'Field Agent' },
];

export default function RanksPage() {
  const [tab, setTab] = useState<'global' | 'weekly' | 'friends'>('global');
  const { user } = useUserStore();

  const isFree = user?.subscription_tier === 'free';

  // Insert player into leaderboard if premium
  let leaderboard = [...FAKE_LEADERBOARD];
  if (user && !isFree) {
    const playerEntry: LeaderboardEntry = {
      rank: 0,
      name: user.character_name || 'You',
      level: user.level,
      xp: user.xp,
      title: getTitleForLevel(user.level),
      isPlayer: true,
    };

    leaderboard.push(playerEntry);
    leaderboard.sort((a, b) => b.xp - a.xp);
    leaderboard = leaderboard.map((entry, i) => ({ ...entry, rank: i + 1 }));
  }

  const tabs = [
    { id: 'global' as const, label: 'Global' },
    { id: 'weekly' as const, label: 'Weekly' },
    { id: 'friends' as const, label: 'Friends' },
  ];

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Leaderboard</h1>
        <p className="text-sm" style={{ color: '#64748b' }}>Compete with fellow security professionals</p>
      </div>

      {/* Tabs */}
      <div className="flex gap-2">
        {tabs.map((t) => (
          <button
            key={t.id}
            onClick={() => setTab(t.id)}
            className="px-4 py-1.5 rounded-lg text-sm font-medium transition-all"
            style={{
              background: tab === t.id ? 'rgba(0, 232, 255, 0.15)' : '#0d1220',
              color: tab === t.id ? '#00e8ff' : '#94a3b8',
              border: `1px solid ${tab === t.id ? '#00e8ff' : '#1e2d4a'}`,
            }}
          >
            {t.label}
          </button>
        ))}
      </div>

      {/* Free user notice */}
      {isFree && (
        <div className="rounded-xl p-4 text-center" style={{ background: 'rgba(0, 232, 255, 0.05)', border: '1px solid rgba(0, 232, 255, 0.2)' }}>
          <p className="text-sm" style={{ color: '#94a3b8' }}>
            Upgrade to Premium to appear on the leaderboard and track your ranking.
          </p>
        </div>
      )}

      {/* Top 3 Podium */}
      <div className="flex items-end justify-center gap-4 pt-4">
        {/* 2nd place */}
        <div className="text-center">
          <div className="w-14 h-14 rounded-full mx-auto mb-2 flex items-center justify-center text-xl font-bold" style={{ background: '#c0c0c022', border: '2px solid #c0c0c0', color: '#c0c0c0' }}>
            {leaderboard[1]?.name[0]}
          </div>
          <div className="text-xs font-bold" style={{ color: '#c0c0c0' }}>{leaderboard[1]?.name}</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>{leaderboard[1]?.xp.toLocaleString()} XP</div>
          <div className="w-16 h-16 rounded-t-lg mx-auto mt-2 flex items-center justify-center" style={{ background: '#c0c0c022' }}>
            <span className="text-xl font-bold" style={{ color: '#c0c0c0' }}>2</span>
          </div>
        </div>

        {/* 1st place */}
        <div className="text-center">
          <div className="w-16 h-16 rounded-full mx-auto mb-2 flex items-center justify-center text-2xl font-bold" style={{ background: '#ffd70022', border: '2px solid #ffd700', color: '#ffd700' }}>
            {leaderboard[0]?.name[0]}
          </div>
          <div className="text-xs font-bold" style={{ color: '#ffd700' }}>{leaderboard[0]?.name}</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>{leaderboard[0]?.xp.toLocaleString()} XP</div>
          <div className="w-16 h-24 rounded-t-lg mx-auto mt-2 flex items-center justify-center" style={{ background: '#ffd70022' }}>
            <span className="text-2xl font-bold" style={{ color: '#ffd700' }}>1</span>
          </div>
        </div>

        {/* 3rd place */}
        <div className="text-center">
          <div className="w-14 h-14 rounded-full mx-auto mb-2 flex items-center justify-center text-xl font-bold" style={{ background: '#cd7f3222', border: '2px solid #cd7f32', color: '#cd7f32' }}>
            {leaderboard[2]?.name[0]}
          </div>
          <div className="text-xs font-bold" style={{ color: '#cd7f32' }}>{leaderboard[2]?.name}</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>{leaderboard[2]?.xp.toLocaleString()} XP</div>
          <div className="w-16 h-12 rounded-t-lg mx-auto mt-2 flex items-center justify-center" style={{ background: '#cd7f3222' }}>
            <span className="text-xl font-bold" style={{ color: '#cd7f32' }}>3</span>
          </div>
        </div>
      </div>

      {/* Full List */}
      <div className="rounded-xl overflow-hidden" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        {leaderboard.map((entry) => (
          <div
            key={entry.rank}
            className="flex items-center gap-4 px-4 py-3 transition-all"
            style={{
              background: entry.isPlayer ? 'rgba(0, 232, 255, 0.08)' : 'transparent',
              borderBottom: '1px solid #1e2d4a',
            }}
          >
            <span className="w-8 text-center text-sm font-bold" style={{
              color: entry.rank === 1 ? '#ffd700' : entry.rank === 2 ? '#c0c0c0' : entry.rank === 3 ? '#cd7f32' : '#64748b',
            }}>
              {entry.rank <= 3 ? ['🥇', '🥈', '🥉'][entry.rank - 1] : `#${entry.rank}`}
            </span>

            <div className="w-8 h-8 rounded-full flex items-center justify-center text-xs font-bold" style={{
              background: entry.isPlayer ? '#00e8ff22' : '#1e2d4a',
              color: entry.isPlayer ? '#00e8ff' : '#94a3b8',
            }}>
              {entry.name[0]}
            </div>

            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2">
                <span className="text-sm font-bold" style={{ color: entry.isPlayer ? '#00e8ff' : '#e2e8f0' }}>
                  {entry.name}
                </span>
                {entry.isPlayer && <span className="text-[10px] px-1.5 py-0.5 rounded" style={{ background: '#00e8ff', color: '#080c14' }}>YOU</span>}
              </div>
              <span className="text-xs" style={{ color: '#64748b' }}>{entry.title}</span>
            </div>

            <div className="text-right">
              <div className="text-sm font-bold" style={{ color: '#ffd700' }}>{entry.xp.toLocaleString()}</div>
              <div className="text-xs" style={{ color: '#64748b' }}>Lv.{entry.level}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
