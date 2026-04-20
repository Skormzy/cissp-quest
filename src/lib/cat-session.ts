// ═══════════════════════════════════════════════════════════
// CAT Session Engine — Manages Adaptive Test Sessions
// Orchestrates item selection, ability estimation, and
// stopping rules for a complete CAT assessment
// ═══════════════════════════════════════════════════════════

import {
  IRTItem,
  ItemResponse,
  AbilityEstimate,
  ItemSelectionConstraints,
  CognitiveLevel,
  irtProbability,
  estimateAbility,
  standardError,
  selectNextItem,
  determinePassFail,
  thetaToPercentile,
} from './irt-engine';

// ─── CAT Configuration ───────────────────────────────────

export interface CATConfig {
  // Session identity
  sessionType: 'field_test' | 'boss_battle' | 'final_boss' | 'gauntlet' | 'custom' | 'practice_exam';
  title: string;
  subtitle: string;
  theme: 'cyan' | 'gold' | 'red';

  // Stopping rules
  minQuestions: number;       // Minimum items before stopping
  maxQuestions: number;       // Maximum items (hard cap)
  seThreshold: number;        // Stop when SE drops below this
  timeLimitMinutes: number;   // 0 = no time limit

  // Scoring
  initialTheta: number;       // Starting ability estimate
  cutScore: number;           // θ required to pass

  // Content constraints
  domainFilter?: number;      // Single domain filter
  domainWeights?: Record<number, number>;  // Multi-domain weights
  cognitiveFloor?: CognitiveLevel;  // Minimum cognitive level
}

// ─── Session State ───────────────────────────────────────

export interface CATState {
  // Current position
  currentQuestion: IRTItem | null;
  questionNumber: number;
  totalQuestions: number;     // How many answered so far

  // Ability tracking
  theta: number;
  se: number;
  method: 'MLE' | 'EAP' | 'WLE';

  // Progress
  correct: number;
  incorrect: number;
  streak: number;

  // Timing
  timeRemainingSeconds: number | null;  // null = untimed
  startedAt: number;                    // timestamp

  // Status
  status: 'loading' | 'active' | 'finished';
  canStop: boolean;           // SE met and min questions reached
}

// ─── Response Record ─────────────────────────────────────

export interface CATResponseRecord {
  questionId: string;
  response: 0 | 1;
  responseTime: number;
  thetaAfter: number;
  seAfter: number;
  questionNumber: number;
}

// ─── Theta History Point ─────────────────────────────────

export interface ThetaHistoryPoint {
  questionNumber: number;
  theta: number;
  se: number;
}

// ─── Domain Breakdown ────────────────────────────────────

export interface DomainBreakdown {
  [domainId: number]: {
    correct: number;
    total: number;
    topics: string[];
  };
}

// ─── Session Results ─────────────────────────────────────

export interface CATResults {
  // Final scores
  finalTheta: number;
  finalSE: number;
  percentile: number;
  passed: boolean;
  passConfidence: number;     // % confidence in pass/fail decision
  cutScore: number;

  // Statistics
  totalQuestions: number;
  correctAnswers: number;
  accuracy: number;           // percentage
  averageResponseTime: number;
  totalTimeSeconds: number;

  // Progression data (for charts)
  thetaHistory: ThetaHistoryPoint[];
  domainBreakdown: DomainBreakdown;

  // Individual responses (for review)
  responses: CATResponseRecord[];

  // XP
  xpEarned: number;

  // Session metadata
  sessionType: string;
  estimationMethod: 'MLE' | 'EAP' | 'WLE';
}

// ─── CAT Session Class ──────────────────────────────────

export class CATSession {
  private config: CATConfig;
  private itemPool: IRTItem[];
  private responses: ItemResponse[];
  private responseRecords: CATResponseRecord[];
  private thetaHistory: ThetaHistoryPoint[];
  private domainBreakdown: DomainBreakdown;
  private administeredIds: Set<string>;
  private topicHistory: string[];
  private currentItem: IRTItem | null;
  private theta: number;
  private se: number;
  private method: 'MLE' | 'EAP' | 'WLE';
  private streak: number;
  private xpEarned: number;
  private startedAt: number;
  private status: 'loading' | 'active' | 'finished';

  constructor(config: CATConfig) {
    this.config = config;
    this.itemPool = [];
    this.responses = [];
    this.responseRecords = [];
    this.thetaHistory = [];
    this.domainBreakdown = {};
    this.administeredIds = new Set();
    this.topicHistory = [];
    this.currentItem = null;
    this.theta = config.initialTheta;
    this.se = 999;
    this.method = 'EAP';
    this.streak = 0;
    this.xpEarned = 0;
    this.startedAt = Date.now();
    this.status = 'loading';
  }

  /**
   * Initialize the session with an item pool.
   * Call this after loading questions from the database.
   */
  start(items: IRTItem[]): IRTItem | null {
    this.itemPool = items;
    this.startedAt = Date.now();
    this.status = 'active';

    // Record initial theta
    this.thetaHistory.push({
      questionNumber: 0,
      theta: this.theta,
      se: this.se,
    });

    // Select first item and mark as administered
    this.currentItem = this.selectNext();
    if (this.currentItem) {
      this.administeredIds.add(this.currentItem.id);
      this.topicHistory.push(this.currentItem.topic_cluster);
    }
    return this.currentItem;
  }

  /**
   * Process an answer and return the next item (or null if done).
   */
  answer(response: 0 | 1, responseTime: number): IRTItem | null {
    if (!this.currentItem || this.status !== 'active') return null;

    // Record the response
    const itemResponse: ItemResponse = {
      item: this.currentItem,
      response,
      responseTime,
    };
    this.responses.push(itemResponse);
    this.administeredIds.add(this.currentItem.id);
    this.topicHistory.push(this.currentItem.topic_cluster);

    // Update streak
    if (response === 1) {
      this.streak++;
    } else {
      this.streak = 0;
    }

    // Calculate XP for this question
    const difficultyMap: Record<string, 'easy' | 'medium' | 'hard'> = {
      '-1.5': 'easy', '-1': 'easy', '-0.5': 'easy',
      '0': 'medium', '0.5': 'medium',
      '1': 'hard', '1.5': 'hard', '2': 'hard', '2.5': 'hard',
    };
    const bRounded = (Math.round(this.currentItem.b * 2) / 2).toString();
    const difficulty = difficultyMap[bRounded] || (this.currentItem.b < 0 ? 'easy' : this.currentItem.b < 1 ? 'medium' : 'hard');
    const baseXp = difficulty === 'easy' ? 25 : difficulty === 'medium' ? 50 : 100;
    this.xpEarned += response === 1 ? baseXp : 0;

    // Re-estimate ability
    const estimate = estimateAbility(this.responses, this.theta);
    this.theta = estimate.theta;
    this.se = estimate.se;
    this.method = estimate.method;

    // Record theta history
    const questionNumber = this.responses.length;
    this.thetaHistory.push({
      questionNumber,
      theta: this.theta,
      se: this.se,
    });

    // Record response
    this.responseRecords.push({
      questionId: this.currentItem.id,
      response,
      responseTime,
      thetaAfter: this.theta,
      seAfter: this.se,
      questionNumber,
    });

    // Update domain breakdown
    const domainId = this.currentItem.domain_id;
    if (!this.domainBreakdown[domainId]) {
      this.domainBreakdown[domainId] = { correct: 0, total: 0, topics: [] };
    }
    this.domainBreakdown[domainId].total++;
    if (response === 1) {
      this.domainBreakdown[domainId].correct++;
    }
    if (!this.domainBreakdown[domainId].topics.includes(this.currentItem.topic_cluster)) {
      this.domainBreakdown[domainId].topics.push(this.currentItem.topic_cluster);
    }

    // Check stopping rules
    if (this.shouldStop()) {
      this.status = 'finished';
      this.currentItem = null;
      return null;
    }

    // Select next item
    this.currentItem = this.selectNext();
    if (!this.currentItem) {
      // Pool exhausted
      this.status = 'finished';
    }
    return this.currentItem;
  }

  /**
   * Force-stop the session (time's up, user abandons, etc.)
   */
  stop(): void {
    this.status = 'finished';
    this.currentItem = null;
  }

  /**
   * Get current session state (for rendering the UI).
   */
  getState(): CATState {
    const totalAnswered = this.responses.length;
    const correct = this.responses.filter(r => r.response === 1).length;
    const timeElapsed = (Date.now() - this.startedAt) / 1000;
    const timeRemaining = this.config.timeLimitMinutes > 0
      ? Math.max(0, this.config.timeLimitMinutes * 60 - timeElapsed)
      : null;

    const canStop = totalAnswered >= this.config.minQuestions && this.se <= this.config.seThreshold;

    return {
      currentQuestion: this.currentItem,
      questionNumber: totalAnswered + 1,
      totalQuestions: totalAnswered,
      theta: this.theta,
      se: this.se,
      method: this.method,
      correct,
      incorrect: totalAnswered - correct,
      streak: this.streak,
      timeRemainingSeconds: timeRemaining,
      startedAt: this.startedAt,
      status: this.status,
      canStop,
    };
  }

  /**
   * Get final results after the session is complete.
   */
  getResults(): CATResults {
    const totalQuestions = this.responses.length;
    const correctAnswers = this.responses.filter(r => r.response === 1).length;
    const accuracy = totalQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0;

    const totalTime = this.responseRecords.reduce((sum, r) => sum + r.responseTime, 0);
    const avgTime = totalQuestions > 0 ? totalTime / totalQuestions : 0;

    const passFail = determinePassFail(this.theta, this.se, this.config.cutScore);

    return {
      finalTheta: this.theta,
      finalSE: this.se,
      percentile: thetaToPercentile(this.theta),
      passed: passFail.passed,
      passConfidence: passFail.confidence,
      cutScore: this.config.cutScore,
      totalQuestions,
      correctAnswers,
      accuracy: Math.round(accuracy * 10) / 10,
      averageResponseTime: Math.round(avgTime * 10) / 10,
      totalTimeSeconds: Math.round(totalTime),
      thetaHistory: this.thetaHistory,
      domainBreakdown: this.domainBreakdown,
      responses: this.responseRecords,
      xpEarned: this.xpEarned,
      sessionType: this.config.sessionType,
      estimationMethod: this.method,
    };
  }

  /**
   * Get the item pool for a question (for rendering options).
   * This returns the IRTItem by ID from the pool.
   */
  getItemById(id: string): IRTItem | undefined {
    return this.itemPool.find(item => item.id === id);
  }

  // ── Private Methods ────────────────────────────────────

  private shouldStop(): boolean {
    const totalAnswered = this.responses.length;

    // Hard maximum
    if (totalAnswered >= this.config.maxQuestions) return true;

    // Pool exhausted
    if (this.administeredIds.size >= this.itemPool.length) return true;

    // SE threshold met AND minimum questions reached
    if (totalAnswered >= this.config.minQuestions && this.se <= this.config.seThreshold) {
      return true;
    }

    // Time limit exceeded
    if (this.config.timeLimitMinutes > 0) {
      const elapsed = (Date.now() - this.startedAt) / 1000;
      if (elapsed >= this.config.timeLimitMinutes * 60) return true;
    }

    return false;
  }

  private selectNext(): IRTItem | null {
    const constraints: ItemSelectionConstraints = {
      excludeIds: this.administeredIds,
      topicHistory: this.topicHistory,
      domainFilter: this.config.domainFilter,
      cognitiveFloor: this.config.cognitiveFloor,
    };

    return selectNextItem(this.theta, this.itemPool, constraints);
  }
}

// ─── CAT Config Presets ──────────────────────────────────

export const CAT_CONFIGS = {
  field_test: (domainId: number): CATConfig => ({
    sessionType: 'field_test',
    title: 'Field Test',
    subtitle: 'Prove your knowledge to advance to Act 4',
    theme: 'cyan',
    minQuestions: 15,
    maxQuestions: 20,
    seThreshold: 0.40,
    timeLimitMinutes: 22,
    initialTheta: 0.0,
    cutScore: -0.5,
    domainFilter: domainId,
  }),

  boss_battle: (domainId: number): CATConfig => ({
    sessionType: 'boss_battle',
    title: 'Boss Battle',
    subtitle: 'Defeat the domain boss to conquer this domain',
    theme: 'red',
    minQuestions: 30,
    maxQuestions: 40,
    seThreshold: 0.35,
    timeLimitMinutes: 45,
    initialTheta: 0.0,
    cutScore: 0.0,
    domainFilter: domainId,
  }),

  final_boss: (): CATConfig => ({
    sessionType: 'final_boss',
    title: 'Final Boss',
    subtitle: 'The ultimate test across all 8 domains',
    theme: 'red',
    minQuestions: 50,
    maxQuestions: 75,
    seThreshold: 0.30,
    timeLimitMinutes: 75,
    initialTheta: 0.0,
    cutScore: 0.5,
    domainWeights: { 1: 0.15, 2: 0.10, 3: 0.13, 4: 0.13, 5: 0.13, 6: 0.12, 7: 0.13, 8: 0.11 },
  }),

  gauntlet: (): CATConfig => ({
    sessionType: 'gauntlet',
    title: 'Think Like a Manager Gauntlet',
    subtitle: 'Pure management perspective — analyze and decide',
    theme: 'gold',
    minQuestions: 10,
    maxQuestions: 15,
    seThreshold: 0.45,
    timeLimitMinutes: 0,
    initialTheta: 0.0,
    cutScore: 0.0,
    cognitiveFloor: 'apply',
  }),

  custom: (options: {
    domainFilter?: number;
    minQuestions?: number;
    maxQuestions?: number;
    timeLimitMinutes?: number;
    cognitiveFloor?: CognitiveLevel;
  }): CATConfig => ({
    sessionType: 'custom',
    title: 'Custom Adaptive Quiz',
    subtitle: 'Personalized adaptive assessment',
    theme: 'cyan',
    minQuestions: options.minQuestions || 15,
    maxQuestions: options.maxQuestions || 30,
    seThreshold: 0.35,
    timeLimitMinutes: options.timeLimitMinutes || 0,
    initialTheta: 0.0,
    cutScore: 0.0,
    domainFilter: options.domainFilter,
    cognitiveFloor: options.cognitiveFloor,
  }),

  practice_exam: (): CATConfig => ({
    sessionType: 'practice_exam',
    title: 'CISSP Practice Exam',
    subtitle: 'Full 250-question simulation — 6 hours — all 8 domains',
    theme: 'gold',
    minQuestions: 200,
    maxQuestions: 250,
    seThreshold: 0.25,
    timeLimitMinutes: 360,
    initialTheta: 0.0,
    cutScore: 0.7,
    domainWeights: { 1: 0.15, 2: 0.10, 3: 0.13, 4: 0.13, 5: 0.13, 6: 0.12, 7: 0.13, 8: 0.11 },
    cognitiveFloor: 'understand',
  }),
};
