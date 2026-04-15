'use client';

import { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { useUserStore } from '@/stores/useUserStore';
import { getTitleForLevel, xpToNextLevel } from '@/lib/xp';

export default function Navbar() {
  const [mobileOpen, setMobileOpen] = useState(false);
  const pathname = usePathname();
  const { user } = useUserStore();

  const navLinks = [
    { href: '/app/dashboard', label: 'Dashboard', icon: '🏠' },
    { href: '/app/story', label: 'Story', icon: '🎬' },
    { href: '/app/library', label: 'Library', icon: '📖' },
    { href: '/app/history', label: 'History', icon: '📋' },
    { href: '/app/domains', label: 'Domains', icon: '🗺️' },
    { href: '/app/ranks', label: 'Ranks', icon: '🏆' },
  ];

  const isActive = (href: string) => pathname.startsWith(href);

  return (
    <>
      <nav
        className="sticky top-0 z-50 border-b backdrop-blur-md"
        style={{ background: 'rgba(8, 12, 20, 0.9)', borderColor: '#1e2d4a' }}
      >
        <div className="max-w-7xl mx-auto px-4 flex items-center justify-between h-14">
          {/* Logo */}
          <Link href="/app/dashboard" className="flex items-center gap-2">
            <span className="text-lg font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
            <span className="text-lg font-bold" style={{ color: '#e2e8f0' }}>QUEST</span>
          </Link>

          {/* Desktop Nav */}
          <div className="hidden md:flex items-center gap-1">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm transition-all"
                style={{
                  color: isActive(link.href) ? '#00e8ff' : '#94a3b8',
                  background: isActive(link.href) ? 'rgba(0, 232, 255, 0.1)' : 'transparent',
                }}
              >
                <span>{link.icon}</span>
                <span>{link.label}</span>
              </Link>
            ))}
          </div>

          {/* Stats & Avatar */}
          <div className="hidden md:flex items-center gap-4">
            {user && (
              <>
                <div className="flex items-center gap-3 text-xs">
                  <span style={{ color: '#ffd700' }}>⚡ {user.xp} XP</span>
                  <span style={{ color: '#f97316' }}>🔥 {user.streak_count}</span>
                  <span style={{ color: '#00e8ff' }}>Lv.{user.level}</span>
                </div>
                <Link
                  href="/app/profile"
                  className="w-8 h-8 rounded-full flex items-center justify-center text-sm font-bold"
                  style={{ background: '#1e2d4a', color: '#00e8ff' }}
                >
                  {user.character_name?.[0]?.toUpperCase() || '?'}
                </Link>
              </>
            )}
          </div>

          {/* Mobile Hamburger */}
          <button
            className="md:hidden p-2"
            onClick={() => setMobileOpen(!mobileOpen)}
            style={{ color: '#e2e8f0' }}
          >
            {mobileOpen ? '✕' : '☰'}
          </button>
        </div>

        {/* Mobile Menu */}
        {mobileOpen && (
          <div className="md:hidden border-t" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
            <div className="px-4 py-3 space-y-1">
              {navLinks.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  onClick={() => setMobileOpen(false)}
                  className="flex items-center gap-2 px-3 py-2.5 rounded-lg text-sm transition-all"
                  style={{
                    color: isActive(link.href) ? '#00e8ff' : '#94a3b8',
                    background: isActive(link.href) ? 'rgba(0, 232, 255, 0.1)' : 'transparent',
                  }}
                >
                  <span>{link.icon}</span>
                  <span>{link.label}</span>
                </Link>
              ))}
              {user && (
                <>
                  <div className="border-t my-2" style={{ borderColor: '#1e2d4a' }} />
                  <div className="flex items-center gap-3 px-3 py-2 text-xs">
                    <span style={{ color: '#ffd700' }}>⚡ {user.xp} XP</span>
                    <span style={{ color: '#f97316' }}>🔥 {user.streak_count}</span>
                    <span style={{ color: '#00e8ff' }}>Lv.{user.level}</span>
                  </div>
                  <Link
                    href="/app/profile"
                    onClick={() => setMobileOpen(false)}
                    className="flex items-center gap-2 px-3 py-2.5 rounded-lg text-sm"
                    style={{ color: '#94a3b8' }}
                  >
                    <span>👤</span>
                    <span>{user.character_name || 'Profile'}</span>
                  </Link>
                </>
              )}
            </div>
          </div>
        )}
      </nav>
    </>
  );
}
