import { DomainInfo } from './types';

export const DOMAINS: DomainInfo[] = [
  { id: 1, name: 'Security and Risk Management', weight: '15%', icon: '🛡️', color: '#ef4444', location: 'New York', locationEmoji: '🗽' },
  { id: 2, name: 'Asset Security', weight: '10%', icon: '📦', color: '#f97316', location: 'New Jersey', locationEmoji: '🏭' },
  { id: 3, name: 'Security Architecture and Engineering', weight: '13%', icon: '🏗️', color: '#eab308', location: 'Zurich', locationEmoji: '🏔️' },
  { id: 4, name: 'Communication and Network Security', weight: '13%', icon: '🌐', color: '#22c55e', location: 'Singapore', locationEmoji: '🌏' },
  { id: 5, name: 'Identity and Access Management', weight: '13%', icon: '🔑', color: '#06b6d4', location: 'London', locationEmoji: '🇬🇧' },
  { id: 6, name: 'Security Assessment and Testing', weight: '12%', icon: '🔍', color: '#8b5cf6', location: 'Tel Aviv', locationEmoji: '🔬' },
  { id: 7, name: 'Security Operations', weight: '13%', icon: '⚙️', color: '#ec4899', location: 'New York', locationEmoji: '🖥️' },
  { id: 8, name: 'Software Development Security', weight: '11%', icon: '💻', color: '#14b8a6', location: 'Austin', locationEmoji: '🤠' },
];

export const CHAPTERS = [
  { id: 1, domainId: 1, title: 'The Breach', location: 'Nexus HQ, New York', emoji: '🗽', description: 'A breach is discovered. Begin your risk assessment training.' },
  { id: 2, domainId: 2, title: 'The Data Vault', location: 'Data Vault, New Jersey', emoji: '🏭', description: 'Classify and protect critical data assets.' },
  { id: 3, domainId: 3, title: 'The Architecture Flaw', location: 'Server Farm, Zurich', emoji: '🏔️', description: 'Discover a critical flaw in the security architecture.' },
  { id: 4, domainId: 4, title: 'The Network Trail', location: 'Cable Station, Singapore', emoji: '🌏', description: 'Follow the network trail to uncover the attack vector.' },
  { id: 5, domainId: 5, title: 'The Identity Crisis', location: 'Office, London', emoji: '🇬🇧', description: 'An insider threat compromises identity systems.' },
  { id: 6, domainId: 6, title: 'The Evidence', location: 'Forensics Lab, Tel Aviv', emoji: '🔬', description: 'Gather and analyze digital forensic evidence.' },
  { id: 7, domainId: 7, title: 'The War Room', location: 'SOC War Room, New York', emoji: '🖥️', description: 'Coordinate incident response from the command center.' },
  { id: 8, domainId: 8, title: 'The Root Cause', location: 'Dev Lab, Austin', emoji: '🤠', description: 'Trace the vulnerability to its source in the code.' },
];

export const XP_VALUES = {
  easy: 25,
  medium: 50,
  hard: 100,
  wrong: 0,
  streakBonus: 5,
  speedBonus: 15,
  speedThreshold: 10,
  streakStart: 3,
  criticalHitChance: 0.1,
  criticalHitMultiplier: 2,
} as const;

export const PRICING = [
  {
    name: 'Free',
    price: '$0',
    period: 'forever',
    features: [
      'Domains 1 & 2 unlocked',
      'Reference Library access',
      'Character creator',
      '50 practice questions',
      'Basic progress tracking',
    ],
    cta: 'Start Free',
    highlighted: false,
  },
  {
    name: 'Premium',
    price: '$19.99',
    period: '/month',
    features: [
      'All 8 domains unlocked',
      'Full story mode',
      '500+ practice questions',
      'Spaced repetition engine',
      'Domain mastery tracking',
      'Leaderboard access',
    ],
    cta: 'Go Premium',
    highlighted: true,
  },
  {
    name: 'Elite',
    price: '$39.99',
    period: '/month',
    features: [
      'Everything in Premium',
      'AI-generated questions',
      'Personalized study plans',
      'Priority support',
      'Exclusive character outfits',
      'Lifetime access guarantee',
    ],
    cta: 'Go Elite',
    highlighted: false,
  },
];

export const ACHIEVEMENTS = [
  { id: 'first_quest', name: 'First Quest', description: 'Complete your first quiz', icon: '⚔️' },
  { id: 'perfect_score', name: 'Perfect Score', description: 'Score 100% on a quiz', icon: '💎' },
  { id: 'speed_demon', name: 'Speed Demon', description: 'Answer 5 questions under 10 seconds each', icon: '⚡' },
  { id: 'bookworm', name: 'Bookworm', description: 'Read 10 library topics', icon: '📚' },
  { id: 'streak_5', name: 'On Fire', description: 'Get a 5-question streak', icon: '🔥' },
  { id: 'streak_10', name: 'Unstoppable', description: 'Get a 10-question streak', icon: '💥' },
  { id: 'domain_master', name: 'Domain Master', description: 'Score 90%+ on a domain quiz', icon: '👑' },
  { id: 'chapter_complete', name: 'Chapter Complete', description: 'Complete a story chapter', icon: '📖' },
  { id: 'all_domains', name: 'CISSP Ready', description: 'Complete all 8 domains', icon: '🎓' },
  { id: 'critical_hit', name: 'Critical Hit!', description: 'Land a critical hit XP bonus', icon: '🎯' },
  { id: 'hundred_questions', name: 'Centurion', description: 'Answer 100 questions', icon: '🏛️' },
  { id: 'night_owl', name: 'Night Owl', description: 'Study after midnight', icon: '🦉' },
];

export const SKIN_TONES = ['#f8d7b4', '#e8b98a', '#d4a574', '#b8865e', '#8d5c3e', '#5c3a1e'];
export const HAIR_COLORS = ['#2d1b00', '#1a1a2e', '#8b4513', '#daa520', '#ff4500', '#c0c0c0', '#ff69b4', '#4169e1'];

export const GRADES: { grade: string; min: number; color: string }[] = [
  { grade: 'S', min: 95, color: '#ffd700' },
  { grade: 'A', min: 85, color: '#22c55e' },
  { grade: 'B', min: 70, color: '#06b6d4' },
  { grade: 'C', min: 50, color: '#f97316' },
  { grade: 'D', min: 0, color: '#ef4444' },
];
