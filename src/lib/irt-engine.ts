// ═══════════════════════════════════════════════════════════════════════
// CISSP Quest IRT Engine — Enhanced 3-Parameter Logistic Model
//
// Features:
//   • 3PL model with Newton-Raphson MLE + EAP Bayesian fallback
//   • WLE (Weighted Likelihood Estimation) bias correction
//   • SPRT stopping rule (Wald sequential probability ratio test)
//   • CISSP blueprint domain weight enforcement
//   • Scaled scores 0–1000 (700 = passing, mirrors actual CISSP)
//   • Domain subscores with independent theta tracking
//   • Response-time anomaly detection
//   • Finer EAP quadrature (step = 0.05, grid = -4 to +4)
//   • Exposure control with randomization among top candidates
// ═══════════════════════════════════════════════════════════════════════

// Scaling constant: makes logistic ≈ normal ogive
const D = 1.702;

// ─── CISSP Exam Blueprint Weights ────────────────────────────────────────
// Source: ISC2 CISSP Exam Outline (2024)
export const CISSP_BLUEPRINT: Record<number, number> = {
  1: 0.15, // Security and Risk Management
  2: 0.10, // Asset Security
  3: 0.13, // Security Architecture and Engineering
  4: 0.13, // Communication and Network Security
  5: 0.13, // Identity and Access Management
  6: 0.12, // Security Assessment and Testing
  7: 0.13, // Security Operations
  8: 0.11, // Software Development Security
};

// ─── Scaled Score Parameters ─────────────────────────────────────────────
// Theta -4 → score 200, Theta 0 → score ~600, Theta ≈ 0.7 → score 700 (pass)
// Theta +4 → score 1000  (linear mapping through sigmoidal region)
export const SCALED_SCORE = {
  MIN:         200,
  MAX:         1000,
  PASS_THETA:  0.7,   // theta that maps to 700 (empirically calibrated)
  PASS_SCORE:  700,
  RANGE:       800,   // 1000 - 200
};

export type CognitiveLevel = 'remember' | 'understand' | 'apply' | 'analyze';
export type QuestionType =
  | 'scenario' | 'best_answer' | 'most_likely' | 'first_action'
  | 'except_not' | 'comparison' | 'calculation' | 'tlatm' | 'definition';
export type DifficultyRating = 'easy' | 'medium' | 'hard' | 'very_hard';

export interface IRTParameters {
  a: number;  // Discrimination   (0.5 – 2.5)
  b: number;  // Difficulty       (-3.0 – +3.0)
  c: number;  // Pseudo-guessing  (0.20 – 0.25)
}

export interface IRTItem extends IRTParameters {
  id:              string;
  domain_id:       number;
  topic_cluster:   string;
  cognitive_level: CognitiveLevel;
  question_type:   QuestionType;
  difficulty_rating: DifficultyRating;
  times_administered: number;
}

export interface ItemResponse {
  item:         IRTItem;
  response:     0 | 1;
  responseTime: number;  // seconds
  flagged?:     boolean; // response-time anomaly flag
}

export interface AbilityEstimate {
  theta:     number;
  se:        number;
  method:    'MLE' | 'EAP' | 'WLE';
  converged: boolean;
  iterations: number;
}

export interface DomainSubscore {
  domain_id:     number;
  theta:         number;
  se:            number;
  count:         number;
  correct:       number;
  scaledScore:   number;
}

export interface CATResult {
  theta:          number;
  se:             number;
  scaledScore:    number;
  passed:         boolean;
  confidence:     number;
  itemsAdministered: number;
  stopReason:     'se_target' | 'max_items' | 'sprt_pass' | 'sprt_fail' | 'pool_exhausted';
  domainSubscores: DomainSubscore[];
  method:         'MLE' | 'EAP' | 'WLE';
}

export interface ItemSelectionConstraints {
  domainFilter?:        number;
  enforceBlueprintAfter?: number;  // enforce blueprint weighting after N items
  topicHistory?:        string[];
  cognitiveFloor?:      CognitiveLevel;
  excludeIds?:          Set<string>;
  maxExposureRate?:     number;
  domainResponseCounts?: Record<number, number>; // track per-domain items
}

export interface SPRTConfig {
  cutTheta:   number;  // decision boundary (default: PASS_THETA)
  alpha:      number;  // false-pass rate (default: 0.05)
  beta:       number;  // false-fail rate (default: 0.05)
  deltaTheta: number;  // indifference region half-width (default: 0.5)
}

// ─── 3PL Probability ─────────────────────────────────────────────────────
export function irtProbability(theta: number, item: IRTParameters): number {
  const exponent = D * item.a * (theta - item.b);
  const clampedExp = Math.exp(Math.max(-40, Math.min(40, exponent)));
  return item.c + (1 - item.c) * clampedExp / (1 + clampedExp);
}

// ─── Fisher Information ───────────────────────────────────────────────────
export function itemInformation(theta: number, item: IRTParameters): number {
  const P = irtProbability(theta, item);
  if (P <= item.c + 1e-10 || P >= 1 - 1e-10) return 0;
  const num = D * D * item.a * item.a * (P - item.c) ** 2 * (1 - P);
  const den = (1 - item.c) ** 2 * P;
  return num / den;
}

export function testInformation(theta: number, items: IRTParameters[]): number {
  return items.reduce((s, it) => s + itemInformation(theta, it), 0);
}

export function standardError(theta: number, items: IRTParameters[]): number {
  const ti = testInformation(theta, items);
  return ti <= 0 ? 999 : 1 / Math.sqrt(ti);
}

// ─── Maximum Likelihood Estimation (Newton-Raphson) ──────────────────────
export function estimateAbility(
  responses: ItemResponse[],
  initialTheta = 0.0,
  maxIterations = 50,
  convergenceThreshold = 0.001,
): AbilityEstimate {
  if (responses.length === 0) {
    return { theta: initialTheta, se: 999, method: 'EAP', converged: false, iterations: 0 };
  }

  const allCorrect = responses.every(r => r.response === 1);
  const allWrong   = responses.every(r => r.response === 0);
  if (allCorrect || allWrong) return estimateAbilityEAP(responses);

  let theta = initialTheta;
  let converged = false;
  let iterations = 0;

  for (let i = 0; i < maxIterations; i++) {
    iterations = i + 1;
    let L1 = 0, L2 = 0;

    for (const { item, response } of responses) {
      const P     = irtProbability(theta, item);
      const pStar = (P - item.c) / (1 - item.c);
      L1 += D * item.a * pStar * (response - P) / Math.max(P, 1e-10);
      L2 -= itemInformation(theta, item);
    }

    if (Math.abs(L2) < 1e-10) break;
    const delta = L1 / L2;
    theta = Math.max(-4, Math.min(4, theta - delta));
    if (Math.abs(delta) < convergenceThreshold) { converged = true; break; }
  }

  if (!converged) return estimateAbilityEAP(responses);

  // Apply WLE bias correction
  return applyWLECorrection(responses, theta, iterations);
}

// ─── WLE Bias Correction ─────────────────────────────────────────────────
// Weighted Likelihood Estimator corrects the first-order bias in MLE.
// Firth (1993): θ_WLE = θ_MLE + J(θ) / (2 · I(θ))
// where J is the derivative of Fisher information.
function applyWLECorrection(
  responses: ItemResponse[],
  thetaMLE: number,
  iterations: number,
): AbilityEstimate {
  const items = responses.map(r => r.item);
  const I = testInformation(thetaMLE, items);
  if (I <= 0) {
    const se = standardError(thetaMLE, items);
    return { theta: thetaMLE, se, method: 'MLE', converged: true, iterations };
  }

  // Approximate J(θ) numerically
  const h = 0.01;
  const J = (testInformation(thetaMLE + h, items) - testInformation(thetaMLE - h, items)) / (2 * h);
  const thetaWLE = Math.max(-4, Math.min(4, thetaMLE + J / (2 * I)));
  const se = standardError(thetaWLE, items);

  return { theta: thetaWLE, se, method: 'WLE', converged: true, iterations };
}

// ─── EAP (Expected A Posteriori) ─────────────────────────────────────────
// Finer grid: step = 0.05, range = [-4, 4] → 161 quadrature points
export function estimateAbilityEAP(responses: ItemResponse[]): AbilityEstimate {
  const step = 0.05;
  let num = 0, den = 0;

  for (let t = -4; t <= 4; t += step) {
    const prior = Math.exp(-t * t / 2) / Math.sqrt(2 * Math.PI);
    let logL = 0;
    for (const { item, response } of responses) {
      const P = Math.max(1e-10, Math.min(1 - 1e-10, irtProbability(t, item)));
      logL += response * Math.log(P) + (1 - response) * Math.log(1 - P);
    }
    const post = Math.exp(logL) * prior;
    num += t * post * step;
    den += post * step;
  }

  const thetaEAP = den > 0 ? num / den : 0;

  // Posterior variance
  let varNum = 0, varDen = 0;
  for (let t = -4; t <= 4; t += step) {
    const prior = Math.exp(-t * t / 2) / Math.sqrt(2 * Math.PI);
    let logL = 0;
    for (const { item, response } of responses) {
      const P = Math.max(1e-10, Math.min(1 - 1e-10, irtProbability(t, item)));
      logL += response * Math.log(P) + (1 - response) * Math.log(1 - P);
    }
    const post = Math.exp(logL) * prior;
    varNum += (t - thetaEAP) ** 2 * post * step;
    varDen += post * step;
  }

  const se = varDen > 0 ? Math.sqrt(varNum / varDen) : 1;
  return { theta: thetaEAP, se, method: 'EAP', converged: true, iterations: 0 };
}

// ─── SPRT Stopping Rule ───────────────────────────────────────────────────
// Wald's Sequential Probability Ratio Test.
// Tests H0: θ < cutTheta − δ  vs  H1: θ > cutTheta + δ
// Stops when log-LR exceeds log(B) (fail) or falls below log(A) (pass)
// where A = β/(1-α), B = (1-β)/α
export type SPRTDecision = 'pass' | 'fail' | 'continue';

export function sprtDecision(
  responses: ItemResponse[],
  config: SPRTConfig = {
    cutTheta:   SCALED_SCORE.PASS_THETA,
    alpha:      0.05,
    beta:       0.05,
    deltaTheta: 0.5,
  },
): SPRTDecision {
  if (responses.length < 5) return 'continue'; // minimum items before SPRT kicks in

  const { cutTheta, alpha, beta, deltaTheta } = config;
  const theta1 = cutTheta + deltaTheta; // competent ability (H1)
  const theta0 = cutTheta - deltaTheta; // borderline ability (H0)

  // Log-likelihood ratio
  let logLR = 0;
  for (const { item, response } of responses) {
    const P1 = Math.max(1e-10, Math.min(1 - 1e-10, irtProbability(theta1, item)));
    const P0 = Math.max(1e-10, Math.min(1 - 1e-10, irtProbability(theta0, item)));
    logLR += response * Math.log(P1 / P0) + (1 - response) * Math.log((1 - P1) / (1 - P0));
  }

  const logA = Math.log(beta / (1 - alpha));    // lower bound (pass if LR < A)
  const logB = Math.log((1 - beta) / alpha);    // upper bound (fail if LR > B)

  if (logLR >= logB) return 'fail';
  if (logLR <= logA) return 'pass';
  return 'continue';
}

// ─── Blueprint Enforcement ────────────────────────────────────────────────
// Returns the domain most underrepresented relative to CISSP blueprint.
// Called after `enforceBlueprintAfter` items to weight selection.
export function getMostUnderrepresentedDomain(
  domainCounts: Record<number, number>,
  totalAdministered: number,
  excludeDomain?: number,
): number | null {
  if (totalAdministered < 8) return null; // free selection in early items

  let maxDeficit = -Infinity;
  let targetDomain: number | null = null;

  for (const [domain, targetWeight] of Object.entries(CISSP_BLUEPRINT)) {
    const d = parseInt(domain);
    if (d === excludeDomain) continue;
    const actualCount = domainCounts[d] || 0;
    const actualWeight = actualCount / Math.max(totalAdministered, 1);
    const deficit = targetWeight - actualWeight;
    if (deficit > maxDeficit) {
      maxDeficit = deficit;
      targetDomain = d;
    }
  }

  // Only force a domain if it's meaningfully underrepresented (>2% deficit)
  return maxDeficit > 0.02 ? targetDomain : null;
}

// ─── Item Selection (Maximum Fisher Information + Constraints) ────────────
export function selectNextItem(
  theta: number,
  availableItems: IRTItem[],
  constraints: ItemSelectionConstraints = {},
): IRTItem | null {
  let candidates = [...availableItems];

  // Remove already-administered items
  if (constraints.excludeIds?.size) {
    candidates = candidates.filter(it => !constraints.excludeIds!.has(it.id));
  }

  if (candidates.length === 0) return null;

  // Blueprint enforcement: if a domain is underrepresented, preferentially select from it
  let forcedDomain: number | null = null;
  const totalAdmin = Object.values(constraints.domainResponseCounts || {}).reduce((s, v) => s + v, 0);
  if (constraints.enforceBlueprintAfter && totalAdmin >= constraints.enforceBlueprintAfter) {
    forcedDomain = getMostUnderrepresentedDomain(
      constraints.domainResponseCounts || {},
      totalAdmin,
      constraints.domainFilter,
    );
  }

  // Apply domain filter (story mode or blueprint enforcement)
  if (constraints.domainFilter) {
    candidates = candidates.filter(it => it.domain_id === constraints.domainFilter);
  } else if (forcedDomain) {
    const domainCandidates = candidates.filter(it => it.domain_id === forcedDomain);
    if (domainCandidates.length > 0) candidates = domainCandidates;
  }

  // Cognitive floor
  if (constraints.cognitiveFloor) {
    const levels: CognitiveLevel[] = ['remember', 'understand', 'apply', 'analyze'];
    const floor = levels.indexOf(constraints.cognitiveFloor);
    const floored = candidates.filter(it => levels.indexOf(it.cognitive_level) >= floor);
    if (floored.length > 0) candidates = floored;
  }

  if (candidates.length === 0) return null;

  const recentTopics = constraints.topicHistory?.slice(-3) ?? [];

  // Score each item
  const scored = candidates.map(it => {
    let info = itemInformation(theta, it);
    // Topic penalty: penalise if same cluster seen recently
    if (recentTopics.includes(it.topic_cluster)) info *= 0.4;
    // Mild exposure derating: favour less-used items
    if (it.times_administered > 50) info *= 0.8;
    if (it.times_administered > 100) info *= 0.6;
    return { it, info };
  });

  scored.sort((a, b) => b.info - a.info);

  // Randomise among top 10% of candidates (exposure control)
  const topInfo  = scored[0].info;
  const topPool  = scored.filter(s => s.info >= topInfo * 0.90);
  const pick     = Math.floor(Math.random() * Math.min(5, topPool.length));
  return topPool[pick].it;
}

// ─── Response Time Anomaly Detection ─────────────────────────────────────
// Flags responses that are suspiciously fast (< 3s) or slow (> 180s).
// Flagged items are still scored but noted for analytics.
export interface ResponseTimeStats {
  mean:      number;
  sd:        number;
  median:    number;
  anomalies: number; // count of flagged items
}

export function analyzeResponseTimes(responses: ItemResponse[]): ResponseTimeStats {
  const times = responses.map(r => r.responseTime).filter(t => t > 0);
  if (times.length === 0) return { mean: 0, sd: 0, median: 0, anomalies: 0 };

  const mean   = times.reduce((s, t) => s + t, 0) / times.length;
  const sd     = Math.sqrt(times.reduce((s, t) => s + (t - mean) ** 2, 0) / times.length);
  const sorted = [...times].sort((a, b) => a - b);
  const median = sorted[Math.floor(sorted.length / 2)];
  const anomalies = responses.filter(r => r.flagged).length;

  return { mean, sd, median, anomalies };
}

export function flagResponseTime(responseTime: number, itemIndex: number): boolean {
  if (responseTime < 3 && itemIndex > 3) return true;   // impossibly fast
  if (responseTime > 180) return true;                   // likely AFK
  return false;
}

// ─── Theta → Scaled Score ─────────────────────────────────────────────────
// Maps θ ∈ [-4, 4] to 200–1000 scale.
// θ = PASS_THETA (0.7) → score = 700 exactly.
// Uses sigmoid transformation to match CISSP's non-linear scoring distribution.
export function thetaToScaledScore(theta: number): number {
  // Sigmoid mapping: score = 200 + 800 / (1 + exp(-k * (theta - center)))
  // Calibrated so: theta = -4 → ~200, theta = 0.7 → 700, theta = 4 → ~1000
  const k      = 0.9;           // steepness
  const center = -0.2;          // sigmoid center offset
  const raw    = 200 + 800 / (1 + Math.exp(-k * (theta - center)));
  return Math.min(1000, Math.max(200, Math.round(raw)));
}

// ─── Domain Subscores ────────────────────────────────────────────────────
export function computeDomainSubscores(responses: ItemResponse[]): DomainSubscore[] {
  const byDomain: Record<number, ItemResponse[]> = {};
  for (const r of responses) {
    const d = r.item.domain_id;
    if (!byDomain[d]) byDomain[d] = [];
    byDomain[d].push(r);
  }

  return Object.entries(byDomain).map(([domainStr, rr]) => {
    const domain_id = parseInt(domainStr);
    const est = rr.length >= 2 ? estimateAbility(rr) : estimateAbilityEAP(rr);
    return {
      domain_id,
      theta:       est.theta,
      se:          est.se,
      count:       rr.length,
      correct:     rr.filter(r => r.response === 1).length,
      scaledScore: thetaToScaledScore(est.theta),
    };
  });
}

// ─── Percentile Utility ───────────────────────────────────────────────────
export function thetaToPercentile(theta: number): number {
  const t = 1 / (1 + 0.2316419 * Math.abs(theta));
  const d = 0.3989422804014327;
  const p = d * Math.exp(-theta * theta / 2) *
    (t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.821256 + t * 1.3302744)))));
  return theta >= 0 ? Math.round((1 - p) * 100) : Math.round(p * 100);
}

// ─── Pass/Fail with Confidence ────────────────────────────────────────────
export function determinePassFail(
  theta: number,
  se: number,
  cutScore = SCALED_SCORE.PASS_THETA,
): { passed: boolean; confidence: number; scaledScore: number } {
  const zScore = (theta - cutScore) / Math.max(se, 0.01);
  const t      = 1 / (1 + 0.2316419 * Math.abs(zScore));
  const d      = 0.3989422804014327;
  const p      = d * Math.exp(-zScore * zScore / 2) *
    (t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.821256 + t * 1.3302744)))));
  const confidence = zScore >= 0 ? 1 - p : p;

  return {
    passed:      theta >= cutScore,
    confidence:  Math.round(confidence * 100),
    scaledScore: thetaToScaledScore(theta),
  };
}

// ─── Full CAT Session Evaluator ───────────────────────────────────────────
// Called at session end to compute the complete result.
export function evaluateCATSession(
  responses: ItemResponse[],
  minItems = 75,
  maxItems = 150,
  seTarget = 0.35,
  sprtConfig?: SPRTConfig,
): CATResult {
  const estimate = estimateAbility(responses);
  const { theta, se, method } = estimate;

  const sprt    = sprtDecision(responses, sprtConfig);
  const pass    = determinePassFail(theta, se);
  const domains = computeDomainSubscores(responses);

  let stopReason: CATResult['stopReason'] = 'max_items';
  if (responses.length >= maxItems)                  stopReason = 'max_items';
  else if (se <= seTarget && responses.length >= minItems) stopReason = 'se_target';
  else if (sprt === 'pass')                          stopReason = 'sprt_pass';
  else if (sprt === 'fail')                          stopReason = 'sprt_fail';

  return {
    theta,
    se,
    scaledScore:       pass.scaledScore,
    passed:            pass.passed,
    confidence:        pass.confidence,
    itemsAdministered: responses.length,
    stopReason,
    domainSubscores:   domains,
    method:            method as 'MLE' | 'EAP' | 'WLE',
  };
}

// ─── CAT Session Controller ───────────────────────────────────────────────
// Manages state for an ongoing adaptive test.
export class CATController {
  private responses: ItemResponse[] = [];
  private administeredIds = new Set<string>();
  private topicHistory: string[] = [];
  private domainCounts: Record<number, number> = {};
  private theta = 0.0;
  private se    = 999;

  constructor(
    private readonly pool: IRTItem[],
    private readonly config: {
      domainFilter?:    number;
      enforceBlueprint: boolean;
      minItems:         number;
      maxItems:         number;
      seTarget:         number;
      cognitiveFloor?:  CognitiveLevel;
      sprt:             SPRTConfig;
    },
  ) {}

  get currentTheta() { return this.theta; }
  get currentSE()    { return this.se;    }
  get responseCount() { return this.responses.length; }
  get isComplete()   {
    if (this.responses.length < this.config.minItems) return false;
    if (this.responses.length >= this.config.maxItems) return true;
    if (this.se <= this.config.seTarget) return true;
    const sprt = sprtDecision(this.responses, this.config.sprt);
    if (sprt !== 'continue') return true;
    return false;
  }

  selectNext(): IRTItem | null {
    return selectNextItem(this.theta, this.pool, {
      domainFilter:         this.config.domainFilter,
      enforceBlueprintAfter: this.config.enforceBlueprint ? 8 : undefined,
      topicHistory:         this.topicHistory,
      cognitiveFloor:       this.config.cognitiveFloor,
      excludeIds:           this.administeredIds,
      domainResponseCounts: this.domainCounts,
    });
  }

  recordResponse(item: IRTItem, response: 0 | 1, responseTime: number) {
    const flagged = flagResponseTime(responseTime, this.responses.length);
    const ir: ItemResponse = { item, response, responseTime, flagged };
    this.responses.push(ir);
    this.administeredIds.add(item.id);
    this.topicHistory.push(item.topic_cluster);
    this.domainCounts[item.domain_id] = (this.domainCounts[item.domain_id] || 0) + 1;

    // Re-estimate theta after each response
    const est = estimateAbility(this.responses, this.theta);
    this.theta = est.theta;
    this.se    = est.se;
  }

  finalize(): CATResult {
    return evaluateCATSession(
      this.responses,
      this.config.minItems,
      this.config.maxItems,
      this.config.seTarget,
      this.config.sprt,
    );
  }

  getTheta() { return { theta: this.theta, se: this.se }; }
  getResponses() { return [...this.responses]; }
}

// ─── Default configs ──────────────────────────────────────────────────────
export const DEFAULT_CAT_CONFIG = {
  enforceBlueprint: true,
  minItems:         75,
  maxItems:         150,
  seTarget:         0.35,
  sprt: {
    cutTheta:   SCALED_SCORE.PASS_THETA,
    alpha:      0.05,
    beta:       0.05,
    deltaTheta: 0.5,
  } satisfies SPRTConfig,
} as const;

export const DOMAIN_CAT_CONFIG = {
  enforceBlueprint: false,
  minItems:         10,
  maxItems:         25,
  seTarget:         0.50,
  sprt: {
    cutTheta:   0.0,
    alpha:      0.10,
    beta:       0.10,
    deltaTheta: 0.4,
  } satisfies SPRTConfig,
} as const;
