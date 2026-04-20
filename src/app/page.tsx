'use client';

import { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence, useInView } from 'framer-motion';
import {
  BookOpen, Zap, Trophy, Users, Shield, Brain, Layers,
  CheckCircle, ArrowRight, Play, Star, ChevronRight,
} from 'lucide-react';
import { DOMAINS, CHAPTERS } from '@/lib/constants';
import { Badge } from '@/components/ui/badge';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';

// ── Animated headline rotator ──────────────────────────────────────────────
const HERO_PHRASES = ['Study Smarter', 'Pass Faster', 'Learn Through Story', 'Think Like a Manager'];

function RotatingText() {
  const [idx, setIdx] = useState(0);
  useEffect(() => {
    const t = setInterval(() => setIdx((i) => (i + 1) % HERO_PHRASES.length), 2800);
    return () => clearInterval(t);
  }, []);
  return (
    <AnimatePresence mode="wait">
      <motion.span
        key={idx}
        initial={{ y: 24, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        exit={{ y: -24, opacity: 0 }}
        transition={{ duration: 0.4 }}
        className="inline-block"
        style={{ color: '#00e8ff' }}
      >
        {HERO_PHRASES[idx]}
      </motion.span>
    </AnimatePresence>
  );
}

// ── Scroll-reveal wrapper ──────────────────────────────────────────────────
function Reveal({
  children,
  delay = 0,
  className,
}: {
  children: React.ReactNode;
  delay?: number;
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);
  const inView = useInView(ref, { once: true, margin: '-60px' });
  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 32 }}
      animate={inView ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.55, delay, ease: 'easeOut' }}
      className={className}
    >
      {children}
    </motion.div>
  );
}

// ── Pricing tiers ─────────────────────────────────────────────────────────
const TIERS = [
  {
    name: 'Free',
    price: '$0',
    period: 'forever',
    badge: null,
    features: [
      'Domains 1 & 2 unlocked',
      'Reference Library access',
      'Character creator',
      '50 practice questions',
      'Basic progress tracking',
    ],
    cta: 'Start Free',
    href: '/auth/signup',
    accent: '#1e2d4a',
    highlighted: false,
  },
  {
    name: 'Pro',
    price: '$19.99',
    period: 'one-time',
    badge: 'Best Value',
    features: [
      'All 8 domains unlocked — forever',
      'Full story mode',
      '500+ practice questions',
      'Medal system',
      'Domain mastery tracking',
      'Leaderboard access',
    ],
    cta: 'Get Pro',
    href: '/auth/signup',
    accent: '#00e8ff',
    highlighted: true,
  },
  {
    name: 'Premium',
    price: '$9.99',
    period: '/month',
    badge: null,
    features: [
      'Everything in Pro',
      'Spaced repetition engine',
      'Community lounges',
      'Weekly XP leaderboard',
      'Priority support',
    ],
    cta: 'Go Premium',
    href: '/auth/signup',
    accent: '#8b5cf6',
    highlighted: false,
  },
  {
    name: 'Expert',
    price: '$24.99',
    period: '/month',
    badge: 'Power User',
    features: [
      'Everything in Premium',
      'AI-powered practice questions',
      'Personalized study plans',
      'Adaptive CAT engine',
      'Exclusive character outfits',
      'Lifetime access guarantee',
    ],
    cta: 'Go Expert',
    href: '/auth/signup',
    accent: '#ffd700',
    highlighted: false,
  },
];

// ── Features ──────────────────────────────────────────────────────────────
const FEATURES = [
  {
    icon: BookOpen,
    title: 'Story-Driven Learning',
    desc: 'Follow Agent Mercer through 8 global missions. CISSP concepts embedded in real narrative, not a textbook.',
    color: '#00e8ff',
  },
  {
    icon: Zap,
    title: '880+ Questions',
    desc: 'Scenario-based, CISSP-style questions with BEST/MOST/FIRST framing. Every wrong answer teaches you why.',
    color: '#ffd700',
  },
  {
    icon: Brain,
    title: 'Adaptive CAT Engine',
    desc: 'Item Response Theory calibrates difficulty in real-time so every session is exactly right for your level.',
    color: '#8b5cf6',
  },
  {
    icon: Users,
    title: 'Community Hub',
    desc: 'Domain lounges for discussion, weekly XP leaderboards, and the knowledge that you\'re not going it alone.',
    color: '#22c55e',
  },
  {
    icon: Trophy,
    title: 'Medal System',
    desc: 'Earn Bronze → Silver → Gold → Platinum medals per domain. Visual proof of mastery that you can actually see.',
    color: '#f97316',
  },
  {
    icon: Shield,
    title: 'Think Like a Manager',
    desc: 'Every explanation teaches the governance and risk mindset the CISSP exam rewards, not just technical facts.',
    color: '#ec4899',
  },
];

// ── Stats ─────────────────────────────────────────────────────────────────
const STATS = [
  { value: '10,000+', label: 'Agents Enrolled' },
  { value: '880+',    label: 'Practice Questions' },
  { value: '92%',     label: 'Pass Rate' },
  { value: '4.9/5',   label: 'Student Rating' },
];

// ── Floating character SVG (simplified cyber-agent silhouette) ───────────
function FloatingAgent() {
  return (
    <motion.div
      animate={{ y: [0, -14, 0] }}
      transition={{ duration: 4, repeat: Infinity, ease: 'easeInOut' }}
      className="relative"
    >
      <svg width="120" height="140" viewBox="0 0 120 140" fill="none"
        style={{ filter: 'drop-shadow(0 0 24px rgba(0,232,255,0.5))' }}>
        {/* Body */}
        <rect x="32" y="80" width="56" height="50" rx="8"
          fill="#0d1220" stroke="#00e8ff" strokeWidth="1.5" />
        {/* Collar glow */}
        <path d="M50 80 L60 92 L70 80" fill="none" stroke="#00e8ff" strokeWidth="2" />
        {/* Head */}
        <ellipse cx="60" cy="58" rx="26" ry="28" fill="#0d1220" stroke="#00e8ff" strokeWidth="1.5" />
        {/* Visor */}
        <path d="M38 54 Q60 44 82 54 Q82 66 60 70 Q38 66 38 54 Z"
          fill="rgba(0,232,255,0.15)" stroke="#00e8ff" strokeWidth="1" />
        {/* Eyes */}
        <ellipse cx="50" cy="57" rx="5" ry="4" fill="#00e8ff" opacity="0.8" />
        <ellipse cx="70" cy="57" rx="5" ry="4" fill="#00e8ff" opacity="0.8" />
        {/* Badge on chest */}
        <rect x="50" y="94" width="20" height="14" rx="3"
          fill="rgba(0,232,255,0.15)" stroke="#00e8ff" strokeWidth="1" />
        <text x="60" y="104" textAnchor="middle" fill="#00e8ff" fontSize="7" fontWeight="bold">
          CISSP
        </text>
        {/* Scan lines */}
        <line x1="38" y1="60" x2="82" y2="60" stroke="#00e8ff" strokeWidth="0.5" opacity="0.3" />
        <line x1="38" y1="65" x2="82" y2="65" stroke="#00e8ff" strokeWidth="0.5" opacity="0.2" />
      </svg>
      {/* Glow ring underneath */}
      <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-20 h-4 rounded-full"
        style={{ background: 'radial-gradient(ellipse, rgba(0,232,255,0.3) 0%, transparent 70%)' }} />
    </motion.div>
  );
}

export default function LandingPage() {
  const [demoOpen, setDemoOpen] = useState(false);

  return (
    <div
      className="min-h-screen overflow-x-hidden"
      style={{ background: '#080c14', color: '#e2e8f0' }}
    >
      {/* ── Top Nav ───────────────────────────────────────────────────── */}
      <nav className="sticky top-0 z-50 border-b backdrop-blur-md"
        style={{ background: 'rgba(8,12,20,0.85)', borderColor: '#1e2d4a' }}>
        <div className="flex items-center justify-between px-6 py-3.5 max-w-7xl mx-auto">
          <div className="flex items-center gap-2">
            <Layers className="w-5 h-5" style={{ color: '#00e8ff' }} />
            <span className="text-lg font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
            <span className="text-lg font-bold">QUEST</span>
          </div>
          <div className="hidden md:flex items-center gap-6 text-sm" style={{ color: '#94a3b8' }}>
            <a href="#features" className="hover:text-white transition-colors">Features</a>
            <a href="#domains" className="hover:text-white transition-colors">Domains</a>
            <a href="#pricing" className="hover:text-white transition-colors">Pricing</a>
          </div>
          <div className="flex items-center gap-3">
            <Link
              href="/auth/login"
              className="text-sm font-medium transition-colors hover:text-white"
              style={{ color: '#00e8ff' }}
            >
              Sign In
            </Link>
            <Link href="/auth/signup"
              className="inline-flex items-center justify-center rounded-lg px-3 h-7 text-[0.8rem] font-medium transition-opacity hover:opacity-90"
              style={{ background: '#00e8ff', color: '#080c14' }}>
              Start Free
            </Link>
          </div>
        </div>
      </nav>

      {/* ── Hero ──────────────────────────────────────────────────────── */}
      <section className="relative flex flex-col items-center text-center pt-24 pb-28 px-6 max-w-5xl mx-auto overflow-hidden">
        {/* Background grid */}
        <div className="absolute inset-0 pointer-events-none"
          style={{
            backgroundImage: `
              linear-gradient(rgba(0,232,255,0.03) 1px, transparent 1px),
              linear-gradient(90deg, rgba(0,232,255,0.03) 1px, transparent 1px)
            `,
            backgroundSize: '48px 48px',
          }} />

        <motion.div
          initial={{ opacity: 0, y: -16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="mb-4"
        >
          <Badge
            className="px-4 py-1.5 text-xs font-medium rounded-full"
            style={{ background: 'rgba(0,232,255,0.1)', color: '#00e8ff', border: '1px solid rgba(0,232,255,0.25)' }}
          >
            Operation Shadow Protocol — Now Live
          </Badge>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 24 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="text-5xl md:text-7xl font-extrabold mb-6 leading-tight tracking-tight"
        >
          <span>The CISSP Prep That Feels Like </span>
          <br />
          <RotatingText />
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.25 }}
          className="text-lg md:text-xl max-w-2xl mb-10"
          style={{ color: '#94a3b8' }}
        >
          Follow an elite security agent through 8 global missions.
          Learn real CISSP concepts through narrative, memory hacks, and
          scenario-based practice. Not another flashcard app.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.35 }}
          className="flex flex-col sm:flex-row gap-4 justify-center mb-16"
        >
          <Link href="/auth/signup"
            className="inline-flex items-center justify-center rounded-lg text-base font-bold px-8 h-12 transition-opacity hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}>
            Begin Your Quest
            <ArrowRight className="w-4 h-4 ml-2" />
          </Link>
          <button
            type="button"
            className="inline-flex items-center justify-center rounded-lg text-base h-12 px-8 transition-opacity hover:opacity-80"
            style={{ border: '1px solid #1e2d4a', color: '#e2e8f0', background: 'transparent' }}
            onClick={() => setDemoOpen(true)}
          >
            <Play className="w-4 h-4 mr-2" />
            Watch Demo
          </button>
        </motion.div>

        {/* Floating agent */}
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.7, delay: 0.5 }}
        >
          <FloatingAgent />
        </motion.div>
      </section>

      {/* ── Stats bar ─────────────────────────────────────────────────── */}
      <section className="border-y py-8 px-6" style={{ borderColor: '#1e2d4a', background: '#0d1220' }}>
        <div className="max-w-4xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-6">
          {STATS.map((s, i) => (
            <Reveal key={s.label} delay={i * 0.08} className="text-center">
              <div className="text-2xl md:text-3xl font-extrabold" style={{ color: '#00e8ff' }}>
                {s.value}
              </div>
              <div className="text-xs mt-1" style={{ color: '#64748b' }}>{s.label}</div>
            </Reveal>
          ))}
        </div>
      </section>

      {/* ── How it works ──────────────────────────────────────────────── */}
      <section className="py-24 px-6 max-w-6xl mx-auto">
        <Reveal>
          <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">How It Works</h2>
          <p className="text-center mb-16 max-w-xl mx-auto" style={{ color: '#94a3b8' }}>
            Three layers of learning that compound on each other
          </p>
        </Reveal>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {[
            {
              num: '01',
              icon: BookOpen,
              title: 'Story Mode',
              desc: 'Dive into Operation Shadow Protocol. Each of the 8 domains is a mission in a real location. CISSP concepts taught through drama, not definitions.',
              color: '#00e8ff',
            },
            {
              num: '02',
              icon: Zap,
              title: 'Quiz Arena',
              desc: 'Adaptive CAT engine calibrates in real-time. CISSP-style scenario questions. Wrong answers unlock Library explanations with memory hacks.',
              color: '#ffd700',
            },
            {
              num: '03',
              icon: Trophy,
              title: 'Certification Ready',
              desc: 'Domain medals prove mastery. Leaderboards keep you accountable. When you can beat the Boss Battle at 95%, you\'re ready for the real exam.',
              color: '#22c55e',
            },
          ].map((card, i) => (
            <Reveal key={card.num} delay={i * 0.12}>
              <div
                className="rounded-2xl p-7 transition-all duration-300 hover:-translate-y-1 group"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              >
                <div className="flex items-center gap-3 mb-5">
                  <span className="text-4xl font-black" style={{ color: '#1e2d4a' }}>{card.num}</span>
                  <div className="w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0"
                    style={{ background: `${card.color}15`, border: `1px solid ${card.color}40` }}>
                    <card.icon className="w-5 h-5" style={{ color: card.color }} />
                  </div>
                </div>
                <h3 className="text-lg font-bold mb-2" style={{ color: '#e2e8f0' }}>{card.title}</h3>
                <p className="text-sm leading-relaxed" style={{ color: '#94a3b8' }}>{card.desc}</p>
                <div className="mt-5 flex items-center gap-1 text-xs font-semibold"
                  style={{ color: card.color }}>
                  Learn more <ChevronRight className="w-3.5 h-3.5" />
                </div>
              </div>
            </Reveal>
          ))}
        </div>
      </section>

      {/* ── Feature showcase ──────────────────────────────────────────── */}
      <section id="features" className="py-24 px-6 max-w-6xl mx-auto">
        <Reveal>
          <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">
            Everything You Need to Pass
          </h2>
          <p className="text-center mb-16 max-w-xl mx-auto" style={{ color: '#94a3b8' }}>
            Built by a CPA and security professional who knows what exam-ready actually means
          </p>
        </Reveal>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {FEATURES.map((f, i) => (
            <Reveal key={f.title} delay={i * 0.07}>
              <div
                className="rounded-2xl p-6 transition-all duration-300 hover:-translate-y-1"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              >
                <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-4"
                  style={{ background: `${f.color}15`, border: `1px solid ${f.color}30` }}>
                  <f.icon className="w-5 h-5" style={{ color: f.color }} />
                </div>
                <h3 className="text-base font-bold mb-2" style={{ color: '#e2e8f0' }}>{f.title}</h3>
                <p className="text-sm leading-relaxed" style={{ color: '#94a3b8' }}>{f.desc}</p>
              </div>
            </Reveal>
          ))}
        </div>
      </section>

      {/* ── Domain preview ────────────────────────────────────────────── */}
      <section id="domains" className="py-24 px-6" style={{ background: '#0d1220' }}>
        <div className="max-w-6xl mx-auto">
          <Reveal>
            <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">
              8 Domains. 8 Global Missions.
            </h2>
            <p className="text-center mb-16 max-w-xl mx-auto" style={{ color: '#94a3b8' }}>
              Complete coverage of the CISSP exam outline, delivered through story
            </p>
          </Reveal>
          <div className="flex gap-5 overflow-x-auto pb-4 snap-x snap-mandatory">
            {DOMAINS.map((domain, i) => {
              const ch = CHAPTERS.find((c) => c.domainId === domain.id);
              return (
                <Reveal key={domain.id} delay={i * 0.06}>
                  <div
                    className="flex-shrink-0 snap-start rounded-2xl p-6 transition-all duration-300 hover:-translate-y-1.5 cursor-default"
                    style={{
                      width: 220,
                      background: '#080c14',
                      border: `1px solid ${domain.color}30`,
                      boxShadow: `0 0 20px ${domain.color}10`,
                    }}
                  >
                    <div className="text-3xl mb-3">{domain.icon}</div>
                    <div className="text-xs font-bold mb-1 uppercase tracking-widest"
                      style={{ color: domain.color }}>
                      Domain {domain.id} · {domain.weight}
                    </div>
                    <h3 className="text-sm font-bold mb-1.5 leading-snug" style={{ color: '#e2e8f0' }}>
                      {domain.name}
                    </h3>
                    <div className="text-xs mb-3" style={{ color: '#64748b' }}>
                      {domain.locationEmoji} {domain.location}
                    </div>
                    {ch && (
                      <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                        {ch.description}
                      </p>
                    )}
                    <div className="mt-4 h-1 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
                      <div className="h-full rounded-full w-0" style={{ background: domain.color }} />
                    </div>
                    <div className="text-xs mt-1" style={{ color: '#4a5568' }}>Locked</div>
                  </div>
                </Reveal>
              );
            })}
          </div>
        </div>
      </section>

      {/* ── Social proof ──────────────────────────────────────────────── */}
      <section className="py-24 px-6 max-w-5xl mx-auto">
        <Reveal>
          <h2 className="text-3xl md:text-4xl font-bold text-center mb-16">
            Join 10,000+ CISSP Candidates
          </h2>
        </Reveal>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {[
            { name: 'Sarah K.', role: 'Passed CISSP 2024', quote: 'Story mode made risk management click in a way textbooks never did. Passed first attempt.' },
            { name: 'Marcus T.', role: 'Security Architect', quote: 'The "Think Like a Manager" framing is exactly how the CISSP exam thinks. Game changer.' },
            { name: 'Priya M.', role: 'CISO at mid-size firm', quote: 'I\'d tried two other platforms. CISSP Quest was the first one that made me actually want to study.' },
          ].map((t, i) => (
            <Reveal key={t.name} delay={i * 0.1}>
              <div
                className="rounded-2xl p-6"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              >
                <div className="flex gap-1 mb-4">
                  {Array.from({ length: 5 }).map((_, j) => (
                    <Star key={j} className="w-3.5 h-3.5 fill-current" style={{ color: '#ffd700' }} />
                  ))}
                </div>
                <p className="text-sm leading-relaxed mb-5" style={{ color: '#94a3b8' }}>
                  &quot;{t.quote}&quot;
                </p>
                <div>
                  <div className="text-sm font-bold" style={{ color: '#e2e8f0' }}>{t.name}</div>
                  <div className="text-xs" style={{ color: '#64748b' }}>{t.role}</div>
                </div>
              </div>
            </Reveal>
          ))}
        </div>
      </section>

      {/* ── Pricing ───────────────────────────────────────────────────── */}
      <section id="pricing" className="py-24 px-6" style={{ background: '#0d1220' }}>
        <div className="max-w-6xl mx-auto">
          <Reveal>
            <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">Choose Your Path</h2>
            <p className="text-center mb-16 max-w-xl mx-auto" style={{ color: '#94a3b8' }}>
              Start free. Upgrade when you&apos;re ready to go all-in.
            </p>
          </Reveal>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
            {TIERS.map((plan, i) => (
              <Reveal key={plan.name} delay={i * 0.08}>
                <div
                  className="relative rounded-2xl p-6 flex flex-col h-full transition-all duration-300 hover:-translate-y-1"
                  style={{
                    background: plan.highlighted ? '#111a2e' : '#080c14',
                    border: `1px solid ${plan.highlighted ? plan.accent : '#1e2d4a'}`,
                    boxShadow: plan.highlighted ? `0 0 40px ${plan.accent}15` : 'none',
                  }}
                >
                  {plan.badge && (
                    <div
                      className="absolute -top-3 left-1/2 -translate-x-1/2 px-3 py-1 rounded-full text-xs font-bold"
                      style={{ background: plan.accent, color: '#080c14' }}
                    >
                      {plan.badge}
                    </div>
                  )}
                  <div className="mb-4">
                    <div className="text-base font-bold mb-1" style={{ color: '#e2e8f0' }}>{plan.name}</div>
                    <div className="flex items-baseline gap-1">
                      <span className="text-3xl font-extrabold" style={{ color: plan.accent }}>
                        {plan.price}
                      </span>
                      <span className="text-xs" style={{ color: '#64748b' }}>{plan.period}</span>
                    </div>
                  </div>
                  <ul className="space-y-2.5 mb-6 flex-1">
                    {plan.features.map((f) => (
                      <li key={f} className="flex items-start gap-2 text-xs" style={{ color: '#94a3b8' }}>
                        <CheckCircle className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" style={{ color: '#22c55e' }} />
                        {f}
                      </li>
                    ))}
                  </ul>
                  <Link href={plan.href}
                    className="inline-flex w-full items-center justify-center rounded-lg text-sm font-semibold h-8 transition-opacity hover:opacity-90"
                    style={{
                      background: plan.highlighted ? plan.accent : 'transparent',
                      color: plan.highlighted ? '#080c14' : plan.accent,
                      border: plan.highlighted ? 'none' : `1px solid ${plan.accent}40`,
                    }}
                  >
                    {plan.cta}
                  </Link>
                </div>
              </Reveal>
            ))}
          </div>
        </div>
      </section>

      {/* ── CTA footer banner ─────────────────────────────────────────── */}
      <Reveal>
        <section className="py-24 px-6">
          <div
            className="max-w-4xl mx-auto rounded-3xl p-12 text-center relative overflow-hidden"
            style={{
              background: 'linear-gradient(135deg, #0d1220 0%, #111a2e 100%)',
              border: '1px solid #1e2d4a',
            }}
          >
            {/* Glow background */}
            <div className="absolute inset-0 pointer-events-none"
              style={{
                background: 'radial-gradient(ellipse at 50% 100%, rgba(0,232,255,0.08) 0%, transparent 60%)',
              }} />
            <div className="relative">
              <h2 className="text-3xl md:text-5xl font-extrabold mb-5">
                Start Your Mission Today
              </h2>
              <p className="text-lg mb-8 max-w-xl mx-auto" style={{ color: '#94a3b8' }}>
                Free to start. No credit card required. Your CISSP journey begins with one decision.
              </p>
              <Link href="/auth/signup"
                className="inline-flex items-center justify-center rounded-lg text-lg font-bold px-10 h-14 transition-opacity hover:opacity-90"
                style={{ background: '#00e8ff', color: '#080c14' }}>
                Create Free Account
                <ArrowRight className="w-5 h-5 ml-2" />
              </Link>
            </div>
          </div>
        </section>
      </Reveal>

      {/* ── Footer ────────────────────────────────────────────────────── */}
      <footer className="border-t py-10 px-6" style={{ borderColor: '#1e2d4a', background: '#0a0f1a' }}>
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <Layers className="w-4 h-4" style={{ color: '#00e8ff' }} />
            <span className="font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
            <span className="font-bold">QUEST</span>
          </div>
          <div className="flex items-center gap-6 text-sm" style={{ color: '#4a5568' }}>
            <a href="#features" className="hover:text-white transition-colors">Features</a>
            <a href="#domains" className="hover:text-white transition-colors">Domains</a>
            <a href="#pricing" className="hover:text-white transition-colors">Pricing</a>
            <Link href="/auth/login" className="hover:text-white transition-colors">Sign In</Link>
          </div>
          <p className="text-xs text-center" style={{ color: '#2a3040' }}>
            &copy; 2025 CISSP Quest. Not affiliated with (ISC)&sup2;. CISSP is a registered mark of (ISC)&sup2;.
          </p>
        </div>
      </footer>

      {/* ── Demo modal ────────────────────────────────────────────────── */}
      <Dialog open={demoOpen} onOpenChange={setDemoOpen}>
        <DialogContent
          className="max-w-2xl"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
        >
          <DialogHeader>
            <DialogTitle style={{ color: '#e2e8f0' }}>CISSP Quest Demo</DialogTitle>
          </DialogHeader>
          <div
            className="rounded-xl aspect-video flex flex-col items-center justify-center gap-4"
            style={{ background: '#080c14', border: '1px solid #1e2d4a' }}
          >
            <div className="text-5xl">🎬</div>
            <p className="text-sm" style={{ color: '#94a3b8' }}>
              Demo video coming soon. Create a free account to explore the platform.
            </p>
            <Link href="/auth/signup"
              className="inline-flex items-center justify-center rounded-lg px-3 h-7 text-[0.8rem] font-medium transition-opacity hover:opacity-90"
              style={{ background: '#00e8ff', color: '#080c14' }}>
              Create Free Account
            </Link>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
}
