// ═══════════════════════════════════════════════════════════
// IRT Engine — 3-Parameter Logistic Model
// Real CISSP methodology: Maximum Fisher Information item
// selection + Maximum Likelihood Estimation scoring
// ═══════════════════════════════════════════════════════════

// ─── Scaling Constant ────────────────────────────────────
// D = 1.702 makes the logistic model approximate the
// normal ogive model (used in classical IRT literature)
const D = 1.702;

// ─── Types ───────────────────────────────────────────────

export interface IRTParameters {
  a: number;  // Discrimination (0.5 – 2.5)
  b: number;  // Difficulty (-3.0 – +3.0)
  c: number;  // Pseudo-guessing (0.20 – 0.25 for 4-option MCQ)
}

export type CognitiveLevel = 'remember' | 'understand' | 'apply' | 'analyze';
export type QuestionType =
  | 'scenario'
  | 'best_answer'
  | 'most_likely'
  | 'first_action'
  | 'except_not'
  | 'comparison'
  | 'calculation'
  | 'tlatm'
  | 'definition';

export interface IRTItem extends IRTParameters {
  id: string;
  domain_id: number;
  topic_cluster: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
}

export interface ItemResponse {
  item: IRTItem;
  response: 0 | 1;       // 0 = incorrect, 1 = correct
  responseTime: number;   // seconds
}

export interface AbilityEstimate {
  theta: number;
  se: number;
  method: 'MLE' | 'EAP';
  converged: boolean;
  iterations: number;
}

export interface ItemSelectionConstraints {
  domainFilter?: number;
  domainWeights?: Record<number, number>;
  topicClusterHistory?: string[];   // prevent consecutive same-topic
  cognitiveFloor?: CognitiveLevel;
  excludeIds?: Set<string>;
  maxExposureRate?: number;
}

// ─── 3PL Probability ─────────────────────────────────────
//
// P(θ) = c + (1−c) · exp(Da(θ−b)) / (1 + exp(Da(θ−b)))
//
// The three parameters:
//   a = discrimination — steepness of the ICC curve
//   b = difficulty — θ at which P = (1+c)/2
//   c = pseudo-guessing — lower asymptote
//
export function irtProbability(theta: number, item: IRTParameters): number {
  const exponent = D * item.a * (theta - item.b);
  // Clamp exponent to prevent overflow/underflow
  const clampedExp = Math.exp(Math.max(-40, Math.min(40, exponent)));
  return item.c + (1 - item.c) * clampedExp / (1 + clampedExp);
}

// ─── Fisher Information (Single Item) ────────────────────
//
// I(θ) = D²a² · (P−c)² · (1−P) / ((1−c)² · P)
//
// Derived from: I(θ) = [P'(θ)]² / [P(θ)(1−P(θ))]
// where P'(θ) = Da(P−c)(1−P) / (1−c)
//
export function itemInformation(theta: number, item: IRTParameters): number {
  const P = irtProbability(theta, item);
  // Guard against edge cases
  if (P <= item.c + 1e-10 || P >= 1 - 1e-10) return 0;
  const numerator = D * D * item.a * item.a * (P - item.c) * (P - item.c) * (1 - P);
  const denominator = (1 - item.c) * (1 - item.c) * P;
  return numerator / denominator;
}

// ─── Test Information ────────────────────────────────────
//
// TI(θ) = Σ I_i(θ) for all administered items
//
export function testInformation(theta: number, items: IRTParameters[]): number {
  return items.reduce((sum, item) => sum + itemInformation(theta, item), 0);
}

// ─── Standard Error ──────────────────────────────────────
//
// SE(θ) = 1 / √(TI(θ))
//
export function standardError(theta: number, items: IRTParameters[]): number {
  const ti = testInformation(theta, items);
  if (ti <= 0) return 999;
  return 1 / Math.sqrt(ti);
}

// ─── Maximum Likelihood Estimation (Newton-Raphson) ──────
//
// θ_{n+1} = θ_n − L'(θ) / L''(θ)
//
// First derivative:
//   L'(θ) = Σ Da_i · P*_i · (x_i − P_i) / P_i
//   where P*_i = (P_i − c_i) / (1 − c_i)
//
// Second derivative (observed information approximation):
//   L''(θ) ≈ −Σ I_i(θ)
//
// Falls back to EAP when MLE doesn't converge
// (all-correct, all-wrong, or oscillation)
//
export function estimateAbility(
  responses: ItemResponse[],
  initialTheta: number = 0.0,
  maxIterations: number = 50,
  convergenceThreshold: number = 0.001
): AbilityEstimate {
  if (responses.length === 0) {
    return { theta: initialTheta, se: 999, method: 'EAP', converged: false, iterations: 0 };
  }

  // MLE doesn't converge for all-correct or all-wrong patterns
  const allCorrect = responses.every(r => r.response === 1);
  const allWrong = responses.every(r => r.response === 0);
  if (allCorrect || allWrong) {
    return estimateAbilityEAP(responses);
  }

  // Newton-Raphson iteration
  let theta = initialTheta;
  let converged = false;
  let iterations = 0;

  for (let i = 0; i < maxIterations; i++) {
    iterations = i + 1;
    let firstDeriv = 0;
    let secondDeriv = 0;

    for (const { item, response } of responses) {
      const P = irtProbability(theta, item);
      // P* adjusted for guessing
      const pStar = (P - item.c) / (1 - item.c);

      // L'(θ) = Σ Da_i · P*_i · (x_i − P_i) / P_i
      firstDeriv += D * item.a * pStar * (response - P) / P;

      // L''(θ) ≈ −Σ I_i(θ)
      secondDeriv -= itemInformation(theta, item);
    }

    // Prevent division by near-zero
    if (Math.abs(secondDeriv) < 1e-10) break;

    const delta = firstDeriv / secondDeriv;
    theta -= delta;

    // Clamp to reasonable ability range
    theta = Math.max(-4, Math.min(4, theta));

    if (Math.abs(delta) < convergenceThreshold) {
      converged = true;
      break;
    }
  }

  // If Newton-Raphson didn't converge, fall back to EAP
  if (!converged) {
    return estimateAbilityEAP(responses);
  }

  const administeredItems = responses.map(r => r.item);
  const se = standardError(theta, administeredItems);
  return { theta, se, method: 'MLE', converged: true, iterations };
}

// ─── Expected A Posteriori (EAP) Estimation ──────────────
//
// θ_EAP = ∫ θ · L(θ) · π(θ) dθ / ∫ L(θ) · π(θ) dθ
//
// Prior: π(θ) ~ N(0, 1)
// Integration: θ ∈ [−4, 4], step = 0.1
//
// Used as fallback when MLE fails to converge (e.g.,
// all-correct or all-wrong response patterns)
//
export function estimateAbilityEAP(responses: ItemResponse[]): AbilityEstimate {
  const step = 0.1;
  let numerator = 0;
  let denominator = 0;

  for (let theta = -4; theta <= 4; theta += step) {
    // N(0,1) prior
    const prior = Math.exp(-theta * theta / 2) / Math.sqrt(2 * Math.PI);

    // Log-likelihood: Σ [x_i · ln(P_i) + (1−x_i) · ln(1−P_i)]
    let logLikelihood = 0;
    for (const { item, response } of responses) {
      const P = irtProbability(theta, item);
      const pClamped = Math.max(1e-10, Math.min(1 - 1e-10, P));
      logLikelihood += response * Math.log(pClamped) + (1 - response) * Math.log(1 - pClamped);
    }

    const posterior = Math.exp(logLikelihood) * prior;
    numerator += theta * posterior * step;
    denominator += posterior * step;
  }

  const thetaEAP = denominator > 0 ? numerator / denominator : 0;

  // Posterior variance for SE
  let varianceNum = 0;
  let varianceDen = 0;
  for (let theta = -4; theta <= 4; theta += step) {
    const prior = Math.exp(-theta * theta / 2) / Math.sqrt(2 * Math.PI);
    let logLikelihood = 0;
    for (const { item, response } of responses) {
      const P = irtProbability(theta, item);
      const pClamped = Math.max(1e-10, Math.min(1 - 1e-10, P));
      logLikelihood += response * Math.log(pClamped) + (1 - response) * Math.log(1 - pClamped);
    }
    const posterior = Math.exp(logLikelihood) * prior;
    varianceNum += (theta - thetaEAP) * (theta - thetaEAP) * posterior * step;
    varianceDen += posterior * step;
  }

  const variance = varianceDen > 0 ? varianceNum / varianceDen : 1;
  const se = Math.sqrt(variance);

  return { theta: thetaEAP, se, method: 'EAP', converged: true, iterations: 0 };
}

// ─── Maximum Fisher Information Item Selection ───────────
//
// Select: i* = argmax_i I_i(θ̂) subject to constraints
//
// Constraints:
//   1. Item not previously administered
//   2. Domain filter (single domain or weighted multi-domain)
//   3. Topic clustering prevention (no same topic 2x in a row)
//   4. Cognitive level floor (e.g., gauntlet requires ≥ 'apply')
//   5. Randomization among top candidates (exposure control)
//
export function selectNextItem(
  theta: number,
  availableItems: IRTItem[],
  constraints: ItemSelectionConstraints = {}
): IRTItem | null {
  let candidates = [...availableItems];

  // 1. Exclude already-administered items
  if (constraints.excludeIds && constraints.excludeIds.size > 0) {
    candidates = candidates.filter(item => !constraints.excludeIds!.has(item.id));
  }

  // 2. Domain filter
  if (constraints.domainFilter) {
    candidates = candidates.filter(item => item.domain_id === constraints.domainFilter);
  }

  // 3. Cognitive floor
  if (constraints.cognitiveFloor) {
    const levels: CognitiveLevel[] = ['remember', 'understand', 'apply', 'analyze'];
    const floorIndex = levels.indexOf(constraints.cognitiveFloor);
    candidates = candidates.filter(item => {
      const itemIndex = levels.indexOf(item.cognitive_level);
      return itemIndex >= floorIndex;
    });
  }

  if (candidates.length === 0) return null;

  // Score each candidate by Fisher Information at current θ̂
  const recentTopics = constraints.topicClusterHistory?.slice(-2) || [];

  const scored = candidates.map(item => {
    let info = itemInformation(theta, item);

    // Topic clustering penalty: halve info for same-topic as recent items
    if (recentTopics.includes(item.topic_cluster)) {
      info *= 0.5;
    }

    return { item, info };
  });

  // Sort by information (descending)
  scored.sort((a, b) => b.info - a.info);

  // Exposure control: randomize among top candidates within 90% of max info
  // This prevents item overexposure while maintaining measurement precision
  const topInfo = scored[0].info;
  const topCandidates = scored.filter(s => s.info >= topInfo * 0.9);
  const pickIndex = Math.floor(Math.random() * Math.min(3, topCandidates.length));
  return topCandidates[pickIndex].item;
}

// ─── Utility: Theta to Percentage ────────────────────────
// Maps θ ∈ [−4, 4] to a human-readable percentage (0–100)
// Using the standard normal CDF approximation
export function thetaToPercentile(theta: number): number {
  // Approximation of Φ(θ) using error function
  const t = 1 / (1 + 0.2316419 * Math.abs(theta));
  const d = 0.3989422804014327; // 1/√(2π)
  const p = d * Math.exp(-theta * theta / 2) *
    (t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.8212560 + t * 1.3302744)))));
  return theta >= 0 ? Math.round((1 - p) * 100) : Math.round(p * 100);
}

// ─── Utility: Pass/Fail Decision ─────────────────────────
// Compares final theta against cut score with SE consideration
export function determinePassFail(
  theta: number,
  se: number,
  cutScore: number
): { passed: boolean; confidence: number } {
  // How many SEs above/below the cut score?
  const zScore = (theta - cutScore) / Math.max(se, 0.01);
  // Confidence = probability that true ability is above cut score
  // Using normal CDF approximation
  const t = 1 / (1 + 0.2316419 * Math.abs(zScore));
  const d = 0.3989422804014327;
  const p = d * Math.exp(-zScore * zScore / 2) *
    (t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.8212560 + t * 1.3302744)))));
  const confidence = zScore >= 0 ? (1 - p) : p;

  return {
    passed: theta >= cutScore,
    confidence: Math.round(confidence * 100),
  };
}
