'use client';

import { useState, useEffect, useCallback } from 'react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Home, BookOpen, Zap, Library, Users, Trophy, User as UserIcon,
  Bell, Settings, Volume2, VolumeX, ChevronRight, LogOut, X,
  NotebookPen, Network, Eye, GitCommitHorizontal, Wrench, Crown, BarChart2,
} from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { xpToNextLevel, getTitleForLevel } from '@/lib/xp';
import CharacterAvatar, { type CharacterConfig } from '@/components/character/CharacterAvatar';
import type { User } from '@/lib/types';
import { Progress } from '@/components/ui/progress';
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from '@/components/ui/sheet';
import { Badge } from '@/components/ui/badge';
import { Switch } from '@/components/ui/switch';
import { Separator } from '@/components/ui/separator';

interface NavItem {
  href: string;
  label: string;
  icon: React.ComponentType<{ className?: string }>;
  badge?: { text: string; color: string; bg: string };
}

const NAV_ITEMS: NavItem[] = [
  { href: '/app/dashboard',  label: 'Dashboard',    icon: Home    },
  { href: '/app/story',      label: 'Story Mode',   icon: BookOpen },
  { href: '/app/quiz',       label: 'Quiz Arena',   icon: Zap     },
  { href: '/app/library',    label: 'Library',      icon: Library },
  { href: '/app/community',  label: 'Community',    icon: Users   },
  { href: '/app/ranks',      label: 'Leaderboard',  icon: Trophy  },
  { href: '/app/profile',    label: 'Profile',      icon: UserIcon },
  { href: '/app/tools',      label: 'Tools',        icon: Wrench  },
  { href: '/app/story/tanaka-notebook', label: 'Sentinel Files',    icon: NotebookPen },
  { href: '/app/tools/constellation',   label: 'Constellation',     icon: Network     },
  {
    href: '/app/story/ghost-pov',
    label: 'Ghost Files',
    icon: Eye,
    badge: { text: 'PREMIUM', color: '#fff', bg: '#ef4444' },
  },
  { href: '/app/tools/forensic-timeline', label: 'Forensic Timeline', icon: GitCommitHorizontal },
  { href: '/app/readiness', label: 'Exam Readiness', icon: BarChart2 },
  {
    href: '/app/upgrade',
    label: 'Upgrade',
    icon: Crown,
    badge: { text: 'PRO', color: '#080c14', bg: '#ffd700' },
  },
];

// Mobile bottom nav — 5 items max
const MOBILE_NAV: NavItem[] = [
  { href: '/app/dashboard', label: 'Dashboard', icon: Home    },
  { href: '/app/story',     label: 'Story',     icon: BookOpen },
  { href: '/app/quiz',      label: 'Quiz',      icon: Zap     },
  { href: '/app/community', label: 'Community', icon: Users   },
  { href: '/app/profile',   label: 'Profile',   icon: UserIcon },
];

function buildAvatarConfig(user: User): CharacterConfig {
  return {
    gender: (user.character_gender as CharacterConfig['gender']) ?? 'Man',
    skinTone: user.character_skin || 1,
    hairStyle: user.character_hair || 1,
    hairColor: user.character_hair_color || '#2d1b00',
    eyeShape: user.character_eye_shape || 1,
    outfit: user.character_outfit || 1,
  };
}

export default function AppShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const router = useRouter();
  const { user } = useUserStore();
  const supabase = createClient();

  const [notifCount, setNotifCount] = useState(0);
  const [audioEnabled, setAudioEnabled] = useState(true);
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  const isActive = (href: string) => pathname.startsWith(href);

  // Current page title from nav items
  const currentPage = NAV_ITEMS.find((n) => pathname.startsWith(n.href))?.label ?? 'CISSP Quest';

  const fetchNotifCount = useCallback(async () => {
    if (!user) return;
    const { count } = await supabase
      .from('notification_queue')
      .select('id', { count: 'exact', head: true })
      .eq('user_id', user.id)
      .eq('is_read', false);
    setNotifCount(count ?? 0);
  }, [user, supabase]);

  useEffect(() => {
    fetchNotifCount();
  }, [fetchNotifCount]);

  const handleSignOut = async () => {
    await supabase.auth.signOut();
    router.push('/');
  };

  const xpProgress = user ? xpToNextLevel(user.xp) : { current: 0, needed: 100, progress: 0 };
  const title = user ? getTitleForLevel(user.level) : '';
  const avatarConfig = user ? buildAvatarConfig(user) : null;

  return (
    <div className="flex h-screen overflow-hidden" style={{ background: '#080c14' }}>
      {/* ─── Sidebar (desktop) ─────────────────────────────────────────── */}
      <motion.aside
        animate={{ width: sidebarCollapsed ? 64 : 240 }}
        transition={{ duration: 0.2, ease: 'easeInOut' }}
        className="hidden md:flex flex-col flex-shrink-0 border-r overflow-hidden"
        style={{ background: '#0a0f1a', borderColor: '#1e2d4a' }}
      >
        {/* Logo */}
        <div className="flex items-center justify-between px-4 py-4 border-b" style={{ borderColor: '#1e2d4a' }}>
          {!sidebarCollapsed && (
            <Link href="/app/dashboard" className="flex items-center gap-2">
              <span className="text-lg font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
              <span className="text-lg font-bold" style={{ color: '#e2e8f0' }}>QUEST</span>
            </Link>
          )}
          <button
            onClick={() => setSidebarCollapsed((v) => !v)}
            className="p-1 rounded-lg transition-colors hover:bg-[#1e2d4a] ml-auto"
            style={{ color: '#94a3b8' }}
            aria-label={sidebarCollapsed ? 'Expand sidebar' : 'Collapse sidebar'}
          >
            <ChevronRight
              className="w-4 h-4 transition-transform"
              style={{ transform: sidebarCollapsed ? 'rotate(0deg)' : 'rotate(180deg)' }}
            />
          </button>
        </div>

        {/* User XP block */}
        {user && (
          <div className="px-3 py-4 border-b" style={{ borderColor: '#1e2d4a' }}>
            <div className={`flex ${sidebarCollapsed ? 'justify-center' : 'items-center gap-3'}`}>
              {avatarConfig && (
                <div className="flex-shrink-0 w-10 h-10 rounded-full overflow-hidden"
                  style={{ border: '1px solid #1e2d4a' }}>
                  <CharacterAvatar config={avatarConfig} size={40} />
                </div>
              )}
              {!sidebarCollapsed && (
                <div className="flex-1 min-w-0">
                  <div className="text-sm font-bold truncate" style={{ color: '#e2e8f0' }}>
                    {user.character_name ?? user.display_name ?? 'Agent'}
                  </div>
                  <div className="text-xs" style={{ color: '#00e8ff' }}>{title}</div>
                </div>
              )}
            </div>

            {!sidebarCollapsed && (
              <div className="mt-3 space-y-1">
                <div className="flex justify-between text-xs">
                  <span style={{ color: '#ffd700' }}>⚡ Lv.{user.level}</span>
                  <span style={{ color: '#64748b' }}>
                    {xpProgress.current}/{xpProgress.needed} XP
                  </span>
                </div>
                <div className="relative h-2 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
                  <motion.div
                    className="absolute inset-y-0 left-0 rounded-full"
                    style={{ background: 'linear-gradient(90deg, #00e8ff, #00b8cc)' }}
                    initial={{ width: 0 }}
                    animate={{ width: `${xpProgress.progress}%` }}
                    transition={{ duration: 0.8, ease: 'easeOut' }}
                  />
                </div>
              </div>
            )}
          </div>
        )}

        {/* Nav links */}
        <nav className="flex-1 py-3 space-y-0.5 px-2 overflow-y-auto">
          {NAV_ITEMS.map((item) => {
            const active = isActive(item.href);
            const Icon = item.icon;
            return (
              <Link
                key={item.href}
                href={item.href}
                title={sidebarCollapsed ? item.label : undefined}
                className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-all relative group"
                style={{
                  color: active ? '#00e8ff' : '#94a3b8',
                  background: active ? 'rgba(0, 232, 255, 0.08)' : 'transparent',
                  borderLeft: active ? '2px solid #00e8ff' : '2px solid transparent',
                  boxShadow: active ? '4px 0 12px rgba(0,232,255,0.08)' : 'none',
                }}
              >
                <Icon className="w-4 h-4 flex-shrink-0" />
                {!sidebarCollapsed && (
                  <span className="flex items-center gap-2 flex-1">
                    {item.label}
                    {item.badge && (
                      <span
                        className="px-1.5 py-0.5 rounded text-[9px] font-bold leading-none"
                        style={{ background: item.badge.bg, color: item.badge.color }}
                      >
                        {item.badge.text}
                      </span>
                    )}
                  </span>
                )}

                {/* Hover tooltip when collapsed */}
                {sidebarCollapsed && (
                  <div className="absolute left-full ml-2 px-2 py-1 rounded-md text-xs font-medium pointer-events-none
                    opacity-0 group-hover:opacity-100 transition-opacity z-50 whitespace-nowrap"
                    style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#e2e8f0' }}>
                    {item.label}
                    {item.badge && (
                      <span
                        className="ml-1.5 px-1.5 py-0.5 rounded text-[9px] font-bold"
                        style={{ background: item.badge.bg, color: item.badge.color }}
                      >
                        {item.badge.text}
                      </span>
                    )}
                  </div>
                )}
              </Link>
            );
          })}
        </nav>

        {/* Streak at bottom */}
        {user && !sidebarCollapsed && (
          <div className="px-4 py-3 border-t" style={{ borderColor: '#1e2d4a' }}>
            <div className="flex items-center justify-between text-xs">
              <span style={{ color: '#94a3b8' }}>Streak</span>
              <span style={{ color: '#f97316' }}>🔥 {user.streak_count} days</span>
            </div>
          </div>
        )}
      </motion.aside>

      {/* ─── Main area ─────────────────────────────────────────────────── */}
      <div className="flex flex-col flex-1 min-w-0 overflow-hidden">
        {/* Top header bar */}
        <header
          className="flex items-center justify-between px-4 md:px-6 h-14 flex-shrink-0 border-b backdrop-blur-md"
          style={{ background: 'rgba(8,12,20,0.9)', borderColor: '#1e2d4a' }}
        >
          {/* Mobile logo */}
          <div className="md:hidden">
            <Link href="/app/dashboard" className="flex items-center gap-1.5">
              <span className="text-base font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
              <span className="text-base font-bold" style={{ color: '#e2e8f0' }}>QUEST</span>
            </Link>
          </div>

          {/* Current page title (desktop) */}
          <div className="hidden md:block text-base font-semibold" style={{ color: '#e2e8f0' }}>
            {currentPage}
          </div>

          {/* Right controls */}
          <div className="flex items-center gap-3">
            {/* Notification bell */}
            <button
              className="relative p-2 rounded-lg transition-colors hover:bg-[#111a2e]"
              style={{ color: '#94a3b8' }}
              aria-label="Notifications"
            >
              <Bell className="w-4 h-4" />
              {notifCount > 0 && (
                <span
                  className="absolute -top-0.5 -right-0.5 w-4 h-4 rounded-full text-[9px] font-bold flex items-center justify-center"
                  style={{ background: '#ef4444', color: '#fff' }}
                >
                  {notifCount > 9 ? '9+' : notifCount}
                </span>
              )}
            </button>

            {/* Settings gear */}
            <Sheet open={settingsOpen} onOpenChange={setSettingsOpen}>
              <SheetTrigger
                render={
                  <button
                    className="p-2 rounded-lg transition-colors hover:bg-[#111a2e]"
                    style={{ color: '#94a3b8' }}
                    aria-label="Settings"
                  />
                }
              >
                <Settings className="w-4 h-4" />
              </SheetTrigger>
              <SheetContent
                className="border-l w-80"
                style={{ background: '#0d1220', borderColor: '#1e2d4a', color: '#e2e8f0' }}
              >
                <SheetHeader>
                  <SheetTitle style={{ color: '#e2e8f0' }}>Settings</SheetTitle>
                </SheetHeader>

                <div className="mt-6 space-y-6">
                  {/* Audio */}
                  <div>
                    <p className="text-xs font-semibold uppercase tracking-widest mb-3" style={{ color: '#4a5568' }}>
                      Audio
                    </p>
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-2">
                        {audioEnabled
                          ? <Volume2 className="w-4 h-4" style={{ color: '#00e8ff' }} />
                          : <VolumeX className="w-4 h-4" style={{ color: '#4a5568' }} />}
                        <span className="text-sm">Sound effects</span>
                      </div>
                      <Switch
                        checked={audioEnabled}
                        onCheckedChange={setAudioEnabled}
                      />
                    </div>
                  </div>

                  <Separator style={{ background: '#1e2d4a' }} />

                  {/* Account */}
                  <div>
                    <p className="text-xs font-semibold uppercase tracking-widest mb-3" style={{ color: '#4a5568' }}>
                      Account
                    </p>
                    {user && (
                      <div className="space-y-2">
                        <div className="text-sm" style={{ color: '#94a3b8' }}>
                          {user.display_name ?? 'Agent'}
                        </div>
                        <div className="text-xs" style={{ color: '#4a5568' }}>
                          {user.subscription_tier} tier
                        </div>
                      </div>
                    )}
                  </div>

                  <Separator style={{ background: '#1e2d4a' }} />

                  <button
                    onClick={handleSignOut}
                    className="flex items-center gap-2 text-sm transition-colors hover:opacity-80"
                    style={{ color: '#ef4444' }}
                  >
                    <LogOut className="w-4 h-4" />
                    Sign out
                  </button>
                </div>
              </SheetContent>
            </Sheet>
          </div>
        </header>

        {/* Page content */}
        <main className="flex-1 overflow-y-auto pb-16 md:pb-0">
          <div className="max-w-7xl mx-auto px-4 md:px-6 py-6">
            {children}
          </div>
        </main>

        {/* ─── Mobile bottom nav ─────────────────────────────────────── */}
        <nav
          className="md:hidden fixed bottom-0 inset-x-0 flex items-center justify-around border-t z-40"
          style={{ height: 60, background: '#0a0f1a', borderColor: '#1e2d4a' }}
        >
          {MOBILE_NAV.map((item) => {
            const active = isActive(item.href);
            const Icon = item.icon;
            return (
              <Link
                key={item.href}
                href={item.href}
                className="flex flex-col items-center justify-center gap-0.5 flex-1 h-full transition-all"
                style={{ color: active ? '#00e8ff' : '#4a5568' }}
              >
                <Icon className="w-5 h-5" />
                <span className="text-[10px] font-medium">{item.label}</span>
                {active && (
                  <motion.div
                    layoutId="mobile-tab-indicator"
                    className="absolute bottom-0 h-0.5 w-8 rounded-full"
                    style={{ background: '#00e8ff' }}
                  />
                )}
              </Link>
            );
          })}
        </nav>
      </div>
    </div>
  );
}
