'use client';

import { useEffect, useState, useCallback } from 'react';
import Link from 'next/link';
import { differenceInDays, format, parseISO } from 'date-fns';
import {
  BookOpen, Zap, NotebookPen, CalendarIcon, X, Target, Library as LibraryIcon, Award, Map,
} from 'lucide-react';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { xpProgressToNext, levelsToNextRank } from '@/lib/leveling';
import CharacterAvatar, { type CharacterConfig } from '@/components/character/CharacterAvatar';
import type { PlayerProfile } from '@/lib/types';
import { Card } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover';
import { Calendar } from '@/components/ui/calendar';
import { Button } from '@/components/ui/button';
import { DOMAINS } from '@/lib/constants';

const GENDER_TO_AVATAR: Record<PlayerProfile['gender'], CharacterConfig['gender']> = {
  male: 'Man',
  female: 'Woman',
  nonbinary: 'Non-binary',
};

function buildAvatarConfig(profile: PlayerProfile): CharacterConfig {
  return {
    gender: GENDER_TO_AVATAR[profile.gender] ?? 'Man',
    skinTone: profile.skin_tone || 1,
    hairStyle: profile.hair_style || 1,
    hairColor: profile.hair_color || '#2d1b00',
    eyeShape: profile.eye_shape || 1,
    eyeColor: profile.eye_color,
    outfit: profile.outfit || 1,
  };
}

interface RecentAnswer {
  id: string;
  question_id: string;
  domain_id: number;
  difficulty: 'easy' | 'medium' | 'hard';
  is_correct: boolean;
  created_at: string;
}

interface DashStats {
  questionsAnswered: number;
  accuracy: number;
  scenesCompleted: number;
  domainsUnlocked: number;
  recent: RecentAnswer[];
}

const EMPTY_STATS: DashStats = {
  questionsAnswered: 0,
  accuracy: 0,
  scenesCompleted: 0,
  domainsUnlocked: 0,
  recent: [],
};

function urgencyForDays(days: number): { color: string; label: string } {
  if (days < 15) return { color: '#ef4444', label: 'Crunch time' };
  if (days <= 60) return { color: '#f59e0b', label: 'Sprint' };
  return { color: '#10b981', label: 'On track' };
}

export default function DashboardPage() {
  const { profile, setProfile } = useUserStore();
  const supabase = createClient();
  const [stats, setStats] = useState<DashStats>(EMPTY_STATS);
  const [savingDate, setSavingDate] = useState(false);
  const [calendarOpen, setCalendarOpen] = useState(false);

  const loadStats = useCallback(async () => {
    if (!profile) return;
    const userId = profile.user_id;

    const [historyRes, scenesRes, storyRes, recentRes] = await Promise.all([
      supabase
        .from('player_question_history')
        .select('is_correct', { count: 'exact' })
        .eq('user_id', userId),
      supabase
        .from('scene_unlocks')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', userId),
      supabase
        .from('story_progress')
        .select('domain_number, domain_conquered, act4_completed')
        .eq('user_id', userId),
      supabase
        .from('player_question_history')
        .select('id, question_id, domain_id, difficulty, is_correct, created_at')
        .eq('user_id', userId)
        .order('created_at', { ascending: false })
        .limit(5),
    ]);

    const allAnswers = historyRes.data ?? [];
    const correct = allAnswers.filter((a) => a.is_correct).length;
    const total = historyRes.count ?? allAnswers.length;
    const accuracy = total === 0 ? 0 : Math.round((correct / total) * 100);

    const scenesCompleted = scenesRes.count ?? 0;
    const domainsUnlocked = (storyRes.data ?? []).filter(
      (r) => r.domain_conquered || r.act4_completed,
    ).length;

    setStats({
      questionsAnswered: total,
      accuracy,
      scenesCompleted,
      domainsUnlocked,
      recent: (recentRes.data ?? []) as RecentAnswer[],
    });
  }, [profile, supabase]);

  useEffect(() => {
    loadStats();
  }, [loadStats]);

  const handleExamDateChange = async (next: Date | undefined) => {
    if (!profile) return;
    setSavingDate(true);
    const iso = next ? format(next, 'yyyy-MM-dd') : null;
    const { error } = await supabase
      .from('player_profile')
      .update({ exam_date: iso })
      .eq('user_id', profile.user_id);
    if (!error) {
      setProfile({ ...profile, exam_date: iso });
    }
    setSavingDate(false);
    setCalendarOpen(false);
  };

  if (!profile) {
    return (
      <div className="space-y-6 animate-pulse" aria-busy="true" aria-label="Loading agent dossier">
        <Card className="p-6 border-0" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
          <div className="flex flex-col md:flex-row md:items-center gap-6">
            <div className="w-24 h-24 rounded-2xl mx-auto md:mx-0" style={{ background: '#111a2e' }} />
            <div className="flex-1 space-y-3">
              <div className="h-3 w-32 rounded" style={{ background: '#111a2e' }} />
              <div className="h-6 w-56 rounded" style={{ background: '#111a2e' }} />
              <div className="h-2 w-full rounded" style={{ background: '#111a2e' }} />
            </div>
          </div>
        </Card>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[0, 1, 2, 3].map((i) => (
            <Card key={i} className="p-4 border-0 h-24" style={{ background: '#0d1220', borderColor: '#1e2d4a' }} />
          ))}
        </div>
      </div>
    );
  }

  const xpProgress = xpProgressToNext(profile.xp);
  const nextRank = levelsToNextRank(profile.current_level);
  const avatarConfig = buildAvatarConfig(profile);

  const examDate = profile.exam_date ? parseISO(profile.exam_date) : null;
  const daysToExam = examDate ? differenceInDays(examDate, new Date()) : null;
  const urgency = daysToExam !== null ? urgencyForDays(daysToExam) : null;

  return (
    <div className="space-y-6">
      {/* ── Hero ───────────────────────────────────────────────────────── */}
      <Card className="p-6 border-0" style={{ background: 'linear-gradient(135deg, #0d1220 0%, #111a2e 100%)', borderColor: '#1e2d4a' }}>
        <div className="flex flex-col md:flex-row md:items-center gap-6">
          <div
            className="flex-shrink-0 w-24 h-24 rounded-2xl overflow-hidden mx-auto md:mx-0"
            style={{ border: '2px solid #00e8ff44', boxShadow: '0 0 32px rgba(0,232,255,0.15)' }}
          >
            <CharacterAvatar config={avatarConfig} size={96} />
          </div>
          <div className="flex-1 text-center md:text-left">
            <div className="text-xs font-semibold uppercase tracking-widest" style={{ color: '#00e8ff' }}>
              {profile.rank_title}
            </div>
            <h1 className="text-2xl md:text-3xl font-bold mt-1" style={{ color: '#e2e8f0' }}>
              {profile.display_name}
            </h1>
            <div className="text-sm mt-1" style={{ color: '#94a3b8' }}>
              Lv.{profile.current_level} · {profile.xp.toLocaleString()} XP
              {nextRank && (
                <span style={{ color: '#64748b' }}>
                  {' · '}{nextRank.levelsRemaining} to {nextRank.nextRank}
                </span>
              )}
            </div>
          </div>
        </div>
      </Card>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
        {/* ── Exam Countdown ─────────────────────────────────────────── */}
        <Card className="p-5 lg:col-span-1" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-widest" style={{ color: '#94a3b8' }}>
              <CalendarIcon className="w-3.5 h-3.5" />
              Exam Countdown
            </div>
            {examDate && (
              <button
                onClick={() => handleExamDateChange(undefined)}
                disabled={savingDate}
                className="p-1 rounded hover:bg-[#1e2d4a] transition-colors disabled:opacity-50"
                aria-label="Clear exam date"
              >
                <X className="w-3.5 h-3.5" style={{ color: '#64748b' }} />
              </button>
            )}
          </div>

          {daysToExam !== null && urgency ? (
            <div>
              <div className="text-4xl font-bold" style={{ color: urgency.color }}>
                {daysToExam < 0 ? `${Math.abs(daysToExam)}d ago` : `${daysToExam}d`}
              </div>
              <div className="text-xs mt-1" style={{ color: urgency.color }}>{urgency.label}</div>
              <Popover open={calendarOpen} onOpenChange={setCalendarOpen}>
                <PopoverTrigger
                  render={
                    <Button
                      variant="ghost"
                      size="sm"
                      className="mt-3 text-xs h-7 px-2"
                      style={{ color: '#64748b' }}
                    />
                  }
                >
                  {examDate ? format(examDate, 'PPP') : 'Set exam date'}
                </PopoverTrigger>
                <PopoverContent className="w-auto p-0">
                  <Calendar
                    mode="single"
                    selected={examDate ?? undefined}
                    onSelect={handleExamDateChange}
                    disabled={(date) => date < new Date()}
                  />
                </PopoverContent>
              </Popover>
            </div>
          ) : (
            <Popover open={calendarOpen} onOpenChange={setCalendarOpen}>
              <PopoverTrigger
                render={
                  <Button
                    variant="outline"
                    className="w-full justify-start"
                    style={{ background: 'transparent', borderColor: '#1e2d4a', color: '#94a3b8' }}
                  />
                }
              >
                <CalendarIcon className="w-4 h-4 mr-2" />
                Set exam date
              </PopoverTrigger>
              <PopoverContent className="w-auto p-0">
                <Calendar
                  mode="single"
                  onSelect={handleExamDateChange}
                  disabled={(date) => date < new Date()}
                />
              </PopoverContent>
            </Popover>
          )}
        </Card>

        {/* ── XP Card ─────────────────────────────────────────────────── */}
        <Card className="p-5 lg:col-span-2" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-widest" style={{ color: '#94a3b8' }}>
              <Zap className="w-3.5 h-3.5" />
              Experience
            </div>
            <span className="text-xs" style={{ color: '#ffd700' }}>Lv.{profile.current_level}</span>
          </div>
          <div className="flex items-baseline gap-2 mb-2">
            <span className="text-3xl font-bold" style={{ color: '#e2e8f0' }}>
              {xpProgress.current.toLocaleString()}
            </span>
            <span className="text-sm" style={{ color: '#64748b' }}>
              / {xpProgress.needed.toLocaleString()} XP to Lv.{profile.current_level + 1}
            </span>
          </div>
          <Progress value={xpProgress.percentage} className="h-2 bg-[#1e2d4a]" />
          <div className="text-xs mt-2" style={{ color: '#64748b' }}>
            {xpProgress.percentage}% to next level
            {nextRank && ` · ${nextRank.levelsRemaining} levels to ${nextRank.nextRank}`}
          </div>
        </Card>
      </div>

      {/* ── Progress Overview ─────────────────────────────────────────── */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        <StatCard
          icon={<Target className="w-4 h-4" />}
          label="Questions"
          value={stats.questionsAnswered}
          sub={`${stats.accuracy}% correct`}
          color="#00e8ff"
        />
        <StatCard
          icon={<BookOpen className="w-4 h-4" />}
          label="Scenes"
          value={stats.scenesCompleted}
          sub="completed"
          color="#a78bfa"
        />
        <StatCard
          icon={<Map className="w-4 h-4" />}
          label="Domains"
          value={`${stats.domainsUnlocked}/8`}
          sub="unlocked"
          color="#ffd700"
        />
        <StatCard
          icon={<LibraryIcon className="w-4 h-4" />}
          label="Library"
          value="0/77"
          sub="topics read"
          color="#10b981"
        />
      </div>

      {/* ── Activity + Quick Actions ──────────────────────────────────── */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
        <Card className="p-5 lg:col-span-2" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
          <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-widest mb-4" style={{ color: '#94a3b8' }}>
            <Award className="w-3.5 h-3.5" />
            Recent Activity
          </div>
          {stats.recent.length === 0 ? (
            <div className="text-sm py-8 text-center" style={{ color: '#64748b' }}>
              No questions answered yet. Jump into the Quiz Arena to start logging activity.
            </div>
          ) : (
            <ul className="space-y-2">
              {stats.recent.map((a) => {
                const domain = DOMAINS.find((d) => d.id === a.domain_id);
                return (
                  <li
                    key={a.id}
                    className="flex items-center justify-between text-sm py-2 px-3 rounded-lg"
                    style={{ background: '#111a2e' }}
                  >
                    <div className="flex items-center gap-3 min-w-0">
                      <span
                        className="w-2 h-2 rounded-full flex-shrink-0"
                        style={{ background: a.is_correct ? '#10b981' : '#ef4444' }}
                      />
                      <span className="truncate" style={{ color: '#e2e8f0' }}>
                        {domain?.name ?? `Domain ${a.domain_id}`}
                      </span>
                      <span
                        className="text-[10px] uppercase font-semibold px-1.5 py-0.5 rounded"
                        style={{ background: '#1e2d4a', color: '#94a3b8' }}
                      >
                        {a.difficulty}
                      </span>
                    </div>
                    <span className="text-xs flex-shrink-0" style={{ color: '#64748b' }}>
                      {format(parseISO(a.created_at), 'MMM d, HH:mm')}
                    </span>
                  </li>
                );
              })}
            </ul>
          )}
        </Card>

        <Card className="p-5" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
          <div className="text-xs font-semibold uppercase tracking-widest mb-4" style={{ color: '#94a3b8' }}>
            Jump back in
          </div>
          <div className="space-y-2">
            <QuickAction href="/app/story" icon={<BookOpen className="w-4 h-4" />} label="Continue Story" />
            <QuickAction href="/app/quiz" icon={<Zap className="w-4 h-4" />} label="Quiz Arena" />
            <QuickAction
              href="/app/story/tanaka-notebook"
              icon={<NotebookPen className="w-4 h-4" />}
              label="Tanaka's Notebook"
            />
          </div>
        </Card>
      </div>
    </div>
  );
}

function StatCard({
  icon, label, value, sub, color,
}: {
  icon: React.ReactNode;
  label: string;
  value: string | number;
  sub: string;
  color: string;
}) {
  return (
    <Card className="p-4 lift-hover" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
      <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-widest mb-2" style={{ color }}>
        {icon}
        {label}
      </div>
      <div className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>{value}</div>
      <div className="text-xs mt-0.5" style={{ color: '#64748b' }}>{sub}</div>
    </Card>
  );
}

function QuickAction({ href, icon, label }: { href: string; icon: React.ReactNode; label: string }) {
  return (
    <Link
      href={href}
      className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors hover:bg-[#1e2d4a] lift-hover"
      style={{ color: '#e2e8f0', background: '#111a2e' }}
    >
      <span style={{ color: '#00e8ff' }}>{icon}</span>
      <span className="flex-1">{label}</span>
      <span className="text-xs" style={{ color: '#64748b' }}>→</span>
    </Link>
  );
}
