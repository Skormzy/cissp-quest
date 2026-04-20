'use client';

import { useEffect, useState, useCallback } from 'react';
import { motion } from 'framer-motion';
import { Trophy, Clock, Zap, Target } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar, { type CharacterConfig } from '@/components/character/CharacterAvatar';
import { Badge } from '@/components/ui/badge';
import { Card } from '@/components/ui/card';

interface LeaderboardEntry {
  user_id: string;
  character_name: string | null;
  display_name: string | null;
  weekly_xp: number;
  accuracy: number;            // 0–100
  character_gender: string | null;
  character_skin: number;
  character_hair: number;
  character_hair_color: string;
  character_eye_shape: number;
  character_outfit: number;
}

const XP_WEIGHTS = [
  { label: 'Easy', multiplier: '1×' },
  { label: 'Medium', multiplier: '2×' },
  { label: 'Hard', multiplier: '3.5×' },
  { label: 'Very Hard', multiplier: '5×' },
];

function msUntilMondayUTC(): number {
  const now = new Date();
  const day = now.getUTCDay(); // 0 = Sun, 1 = Mon …
  const daysUntilMonday = day === 0 ? 1 : 8 - day;
  const nextMonday = new Date(now);
  nextMonday.setUTCDate(now.getUTCDate() + daysUntilMonday);
  nextMonday.setUTCHours(0, 0, 0, 0);
  return nextMonday.getTime() - now.getTime();
}

function formatCountdown(ms: number): string {
  if (ms <= 0) return '00:00:00';
  const totalSec = Math.floor(ms / 1000);
  const days = Math.floor(totalSec / 86400);
  const hours = Math.floor((totalSec % 86400) / 3600);
  const mins = Math.floor((totalSec % 3600) / 60);
  const secs = totalSec % 60;
  if (days > 0) return `${days}d ${String(hours).padStart(2, '0')}h`;
  return `${String(hours).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
}

function buildAvatarConfig(row: LeaderboardEntry): CharacterConfig {
  return {
    gender: (row.character_gender as CharacterConfig['gender']) ?? 'Man',
    skinTone: row.character_skin || 1,
    hairStyle: row.character_hair || 1,
    hairColor: row.character_hair_color || '#2d1b00',
    eyeShape: row.character_eye_shape || 1,
    outfit: row.character_outfit || 1,
  };
}

const RANK_CROWN: Record<number, string> = { 1: '🥇', 2: '🥈', 3: '🥉' };

export default function WeeklyLeaderboard() {
  const { user } = useUserStore();
  const [entries, setEntries] = useState<LeaderboardEntry[]>([]);
  const [loading, setLoading] = useState(true);
  const [countdown, setCountdown] = useState(() => formatCountdown(msUntilMondayUTC()));

  const supabase = createClient();

  const fetchLeaderboard = useCallback(async () => {
    // Fetch from weekly_scores joined with users
    const { data, error } = await supabase
      .from('weekly_scores')
      .select(`
        user_id,
        weekly_xp,
        accuracy,
        users!inner(
          character_name,
          display_name,
          character_gender,
          character_skin,
          character_hair,
          character_hair_color,
          character_eye_shape,
          character_outfit
        )
      `)
      .order('weekly_xp', { ascending: false })
      .limit(10);

    if (!error && data) {
      const mapped: LeaderboardEntry[] = data.map((row) => {
        const u = Array.isArray(row.users) ? row.users[0] : row.users;
        return {
          user_id: row.user_id,
          weekly_xp: row.weekly_xp ?? 0,
          accuracy: row.accuracy ?? 0,
          character_name: u?.character_name ?? null,
          display_name: u?.display_name ?? null,
          character_gender: u?.character_gender ?? null,
          character_skin: u?.character_skin ?? 1,
          character_hair: u?.character_hair ?? 1,
          character_hair_color: u?.character_hair_color ?? '#2d1b00',
          character_eye_shape: u?.character_eye_shape ?? 1,
          character_outfit: u?.character_outfit ?? 1,
        };
      });
      setEntries(mapped);
    }
    setLoading(false);
  }, [supabase]);

  useEffect(() => {
    fetchLeaderboard();

    // Realtime subscription
    const channel = supabase
      .channel('weekly-scores')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'weekly_scores' }, () => {
        fetchLeaderboard();
      })
      .subscribe();

    // Countdown ticker
    const ticker = setInterval(() => {
      setCountdown(formatCountdown(msUntilMondayUTC()));
    }, 1000);

    return () => {
      supabase.removeChannel(channel);
      clearInterval(ticker);
    };
  }, [fetchLeaderboard, supabase]);

  return (
    <Card
      className="overflow-hidden"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-5 py-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Trophy className="w-5 h-5" style={{ color: '#ffd700' }} />
            <h2 className="text-base font-bold" style={{ color: '#e2e8f0' }}>
              Weekly Leaderboard
            </h2>
          </div>
          <div className="flex items-center gap-1.5 text-xs" style={{ color: '#94a3b8' }}>
            <Clock className="w-3.5 h-3.5" />
            <span>Resets in</span>
            <span className="font-mono font-semibold" style={{ color: '#00e8ff' }}>
              {countdown}
            </span>
          </div>
        </div>

        {/* XP weight legend */}
        <div className="flex items-center gap-3 mt-3 flex-wrap">
          <span className="text-xs" style={{ color: '#4a5568' }}>XP weights:</span>
          {XP_WEIGHTS.map((w) => (
            <div key={w.label} className="flex items-center gap-1">
              <Zap className="w-3 h-3" style={{ color: '#ffd700' }} />
              <span className="text-xs" style={{ color: '#94a3b8' }}>
                {w.label} <span style={{ color: '#ffd700' }}>{w.multiplier}</span>
              </span>
            </div>
          ))}
        </div>
      </div>

      {/* List */}
      <div className="divide-y" style={{ borderColor: '#1e2d4a' }}>
        {loading ? (
          Array.from({ length: 5 }).map((_, i) => (
            <div key={i} className="flex items-center gap-3 px-5 py-3 animate-pulse">
              <div className="w-6 h-4 rounded" style={{ background: '#1e2d4a' }} />
              <div className="w-8 h-8 rounded-full" style={{ background: '#1e2d4a' }} />
              <div className="flex-1 h-3 rounded" style={{ background: '#1e2d4a' }} />
              <div className="w-16 h-3 rounded" style={{ background: '#1e2d4a' }} />
            </div>
          ))
        ) : entries.length === 0 ? (
          <div className="px-5 py-10 text-center text-sm" style={{ color: '#4a5568' }}>
            No scores yet this week. Be the first!
          </div>
        ) : (
          entries.map((entry, idx) => {
            const rank = idx + 1;
            const isCurrentUser = entry.user_id === user?.id;
            const avatarConfig = buildAvatarConfig(entry);
            const agentName = entry.character_name ?? entry.display_name ?? 'Agent';

            return (
              <motion.div
                key={entry.user_id}
                initial={{ opacity: 0, x: -16 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: idx * 0.05, duration: 0.3 }}
                className="flex items-center gap-3 px-5 py-3 transition-colors"
                style={{
                  background: isCurrentUser
                    ? 'rgba(0, 232, 255, 0.06)'
                    : 'transparent',
                  borderLeft: isCurrentUser
                    ? '2px solid #00e8ff'
                    : '2px solid transparent',
                }}
              >
                {/* Rank */}
                <div className="w-7 text-center flex-shrink-0">
                  {rank <= 3 ? (
                    <span className="text-lg leading-none">{RANK_CROWN[rank]}</span>
                  ) : (
                    <span className="text-sm font-bold" style={{ color: '#4a5568' }}>
                      {rank}
                    </span>
                  )}
                </div>

                {/* Avatar */}
                <div className="flex-shrink-0 w-8 h-8 overflow-hidden rounded-full"
                  style={{ border: `1px solid ${isCurrentUser ? '#00e8ff' : '#1e2d4a'}` }}>
                  <CharacterAvatar config={avatarConfig} size={32} />
                </div>

                {/* Name */}
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <span
                      className="text-sm font-semibold truncate"
                      style={{ color: isCurrentUser ? '#00e8ff' : '#e2e8f0' }}
                    >
                      {agentName}
                    </span>
                    {isCurrentUser && (
                      <Badge
                        className="text-[9px] py-0 px-1.5 flex-shrink-0"
                        style={{ background: 'rgba(0,232,255,0.15)', color: '#00e8ff', border: '1px solid rgba(0,232,255,0.3)' }}
                      >
                        YOU
                      </Badge>
                    )}
                  </div>
                </div>

                {/* Accuracy */}
                <div className="flex items-center gap-1 flex-shrink-0">
                  <Target className="w-3.5 h-3.5" style={{ color: '#22c55e' }} />
                  <span className="text-xs" style={{ color: '#94a3b8' }}>
                    {entry.accuracy.toFixed(0)}%
                  </span>
                </div>

                {/* XP */}
                <div className="flex items-center gap-1 flex-shrink-0 w-20 justify-end">
                  <Zap className="w-3.5 h-3.5" style={{ color: '#ffd700' }} />
                  <span className="text-sm font-bold tabular-nums" style={{ color: '#ffd700' }}>
                    {entry.weekly_xp.toLocaleString()}
                  </span>
                </div>
              </motion.div>
            );
          })
        )}
      </div>
    </Card>
  );
}
