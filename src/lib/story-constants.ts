import { StoryQuizConfig } from './story-types';

// ─── Domain Chapter Metadata ──────────────────────────────

export const DOMAIN_CHAPTERS = [
  { domainId: 1, title: 'The Breach',            location: 'Nexus HQ, New York',      locationKey: 'new-york' },
  { domainId: 2, title: 'The Data Vault',        location: 'Data Vault, New Jersey',   locationKey: 'new-jersey' },
  { domainId: 3, title: 'The Architecture Flaw',  location: 'Server Farm, Zurich',      locationKey: 'zurich' },
  { domainId: 4, title: 'The Network Trail',      location: 'Cable Station, Singapore', locationKey: 'singapore' },
  { domainId: 5, title: 'The Identity Crisis',    location: 'Corporate Office, London', locationKey: 'london' },
  { domainId: 6, title: 'The Evidence',           location: 'Forensics Lab, Tel Aviv',  locationKey: 'tel-aviv' },
  { domainId: 7, title: 'The War Room',           location: 'SOC War Room, New York',   locationKey: 'soc-ny' },
  { domainId: 8, title: 'The Root Cause',         location: 'Dev Lab, Austin',          locationKey: 'austin' },
];

// ─── Act Structure (5 Acts per domain) ──────────────────

export const ACT_LABELS = [
  'Act 1: The Briefing',
  'Act 2: The Investigation',
  'Act 3: Field Test',
  'Act 4: The Escalation',
  'Act 5: Boss Battle',
] as const;

export const ACT_TIMELINE = [
  { key: 'act1',        label: 'Act 1: The Briefing',       actNumber: 1, isQuiz: false },
  { key: 'act2',        label: 'Act 2: The Investigation',  actNumber: 2, isQuiz: false },
  { key: 'field-test',  label: 'Act 3: Field Test',         actNumber: 0, isQuiz: true  },
  { key: 'act4',        label: 'Act 4: The Escalation',     actNumber: 4, isQuiz: false },
  { key: 'boss-battle', label: 'Act 5: Boss Battle',        actNumber: 0, isQuiz: true  },
] as const;

// ─── XP Rewards per Act ───────────────────────────────────

export const ACT_XP_REWARDS: Record<number, number> = {
  1: 100,
  2: 150,
  4: 250,
};

// ─── Quiz Configurations ──────────────────────────────────

export const FIELD_TEST_CONFIG: Omit<StoryQuizConfig, 'domainId'> = {
  questionCount: 15,
  timeLimitMinutes: 22,
  passingPercentage: 70,
  difficulties: ['easy', 'medium'],
  title: 'Field Test',
  subtitle: 'Prove your field readiness with 15 questions. 22 minutes. 70% to pass.',
  theme: 'cyan',
};

export const BOSS_BATTLE_CONFIG: Omit<StoryQuizConfig, 'domainId'> = {
  questionCount: 30,
  timeLimitMinutes: 45,
  passingPercentage: 70,
  difficulties: ['easy', 'medium', 'hard'],
  title: 'Boss Battle',
  subtitle: 'Defeat the domain boss with 30 questions across all difficulties. 45 minutes. 70% to pass.',
  theme: 'red',
};

export const TLATM_GAUNTLET_CONFIG: StoryQuizConfig = {
  questionCount: 10,
  timeLimitMinutes: 0, // untimed
  passingPercentage: 70,
  difficulties: ['medium', 'hard'],
  title: 'Think Like a Manager Gauntlet',
  subtitle: '10 management-perspective questions. No time limit. 70% to pass.',
  theme: 'gold',
};

export const FINAL_BOSS_CONFIG: StoryQuizConfig = {
  questionCount: 50,
  timeLimitMinutes: 75,
  passingPercentage: 70,
  difficulties: ['medium', 'hard'],
  domainWeights: { 1: 8, 2: 5, 3: 7, 4: 7, 5: 7, 6: 6, 7: 7, 8: 3 },
  title: 'Final Boss',
  subtitle: '50 questions spanning all 8 domains. 75 minutes. 70% to pass.',
  theme: 'gold',
};

// ─── Domain Colors (matching DOMAINS from constants.ts) ───

export const DOMAIN_COLORS: Record<number, string> = {
  1: '#ef4444',
  2: '#f97316',
  3: '#eab308',
  4: '#22c55e',
  5: '#06b6d4',
  6: '#8b5cf6',
  7: '#ec4899',
  8: '#14b8a6',
};

// ─── Gating Logic Helpers ─────────────────────────────────
// 5-act flow: Act 1 → Act 2 → Field Test → Act 4 → Boss Battle

export function isActUnlocked(
  actKey: string,
  progress: {
    act1_completed: boolean;
    act2_completed: boolean;
    act4_completed: boolean;
    field_test_passed: boolean;
    boss_battle_passed: boolean;
  } | null,
): boolean {
  if (!progress) return actKey === 'act1';
  switch (actKey) {
    case 'act1':        return true;
    case 'act2':        return progress.act1_completed;
    case 'field-test':  return progress.act2_completed;
    case 'act4':        return progress.field_test_passed;
    case 'boss-battle': return progress.act4_completed;
    default:            return false;
  }
}

export function isActCompleted(
  actKey: string,
  progress: {
    act1_completed: boolean;
    act2_completed: boolean;
    act4_completed: boolean;
    field_test_passed: boolean;
    boss_battle_passed: boolean;
  } | null,
): boolean {
  if (!progress) return false;
  switch (actKey) {
    case 'act1':        return progress.act1_completed;
    case 'act2':        return progress.act2_completed;
    case 'field-test':  return progress.field_test_passed;
    case 'act4':        return progress.act4_completed;
    case 'boss-battle': return progress.boss_battle_passed;
    default:            return false;
  }
}

export function getDomainStatus(
  progress: {
    act1_completed: boolean;
    act2_completed: boolean;
    act4_completed: boolean;
    field_test_passed: boolean;
    boss_battle_passed: boolean;
    domain_conquered: boolean;
    current_act: number;
  } | null,
): string {
  if (!progress) return 'Not Started';
  if (progress.domain_conquered) return 'CONQUERED';
  if (progress.boss_battle_passed) return 'CONQUERED';
  if (progress.act4_completed) return 'Act 5 of 5';
  if (progress.field_test_passed) return 'Act 4 of 5';
  if (progress.act2_completed) return 'Act 3 of 5';
  if (progress.act1_completed) return 'Act 2 of 5';
  return 'Act 1 of 5';
}
