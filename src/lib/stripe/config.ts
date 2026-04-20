// ── Stripe Pricing Configuration ──────────────────────────────────────────
// 4-tier model: Free / Pro (one-time) / Premium (subscription) / Expert (subscription)

export const STRIPE_TIERS = {
  pro: {
    name:        'Pro',
    description: 'One-time full unlock — all 8 domains forever',
    price:       1999,  // cents
    mode:        'payment' as const,
    priceId:     process.env.STRIPE_PRO_PRICE_ID ?? '',
    features: [
      'All 8 domains unlocked',
      'Full story mode (40 acts)',
      '880+ practice questions',
      'Adaptive CAT engine',
      'Medal system (32 medals)',
      'Character creator',
      'Lifetime access',
    ],
  },
  premium: {
    name:        'Premium',
    description: 'Monthly subscription with community + AI questions',
    price:       999,   // cents/month
    annualPrice: 8900,  // cents/year
    mode:        'subscription' as const,
    priceId:       process.env.STRIPE_PREMIUM_PRICE_ID ?? '',
    annualPriceId: process.env.STRIPE_PREMIUM_ANNUAL_PRICE_ID ?? '',
    features: [
      'Everything in Pro',
      'Weekly AI-generated questions',
      'Domain Lounges (community chat)',
      'War Room forum',
      'Study Squads',
      'Weekly XP leaderboard',
      'Priority support',
    ],
  },
  expert: {
    name:        'Expert',
    description: 'Full platform access with advanced analytics',
    price:       2499,   // cents/month
    annualPrice: 19900,  // cents/year
    mode:        'subscription' as const,
    priceId:       process.env.STRIPE_EXPERT_PRICE_ID ?? '',
    annualPriceId: process.env.STRIPE_EXPERT_ANNUAL_PRICE_ID ?? '',
    features: [
      'Everything in Premium',
      "Ghost's POV scenes (attacker perspective)",
      'Evidence Constellation (D3 knowledge graph)',
      'Exam Readiness Meter',
      'Practice Exam Simulator (250Q, 6hr)',
      'Personalized study planner',
      'Admin analytics dashboard',
    ],
  },
} as const;

export type StripeTier = keyof typeof STRIPE_TIERS;

export const TIER_HIERARCHY = {
  free:    0,
  pro:     1,
  premium: 2,
  expert:  3,
} as const;

export type SubscriptionTier = keyof typeof TIER_HIERARCHY;

export function hasAccess(userTier: SubscriptionTier, requiredTier: SubscriptionTier): boolean {
  return TIER_HIERARCHY[userTier] >= TIER_HIERARCHY[requiredTier];
}

// Feature gates
export const FEATURE_GATES = {
  storyMode:           'pro',
  communityChat:       'premium',
  warRoom:             'premium',
  studySquads:         'premium',
  weeklyLeaderboard:   'premium',
  ghostPOV:            'expert',
  evidenceConstellation: 'expert',
  practiceExam:        'expert',
  studyPlanner:        'expert',
  aiQuestions:         'premium',
} as const satisfies Record<string, SubscriptionTier>;
