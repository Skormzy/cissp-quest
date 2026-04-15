// ═══════════════════════════════════════════════════════════
// IRT Calibration System — Simplified JMLE
// Recalibrates item parameters based on accumulated
// response data using Joint Maximum Likelihood Estimation
// ═══════════════════════════════════════════════════════════

import { IRTParameters, irtProbability } from './irt-engine';

// ─── Types ───────────────────────────────────────────────

export interface ResponseRecord {
  theta: number;      // Examinee ability at time of response
  response: 0 | 1;    // 0 = incorrect, 1 = correct
}

export interface CalibrationInput {
  currentParams: IRTParameters;
  responses: ResponseRecord[];
  minSampleSize: number;    // Minimum responses before calibrating
}

export interface CalibrationResult {
  newParams: IRTParameters;
  sampleSize: number;
  converged: boolean;
  iterations: number;
  parameterChanges: {
    deltaA: number;
    deltaB: number;
    deltaC: number;
  };
}

// ─── Calibration Constants ───────────────────────────────

const D = 1.702;
const MAX_ITERATIONS = 100;
const CONVERGENCE_THRESHOLD = 0.005;
const MIN_SAMPLE_SIZE = 30;

// Parameter bounds
const A_MIN = 0.5;
const A_MAX = 2.5;
const B_MIN = -3.0;
const B_MAX = 3.0;
const C_MIN = 0.15;
const C_MAX = 0.30;

// Learning rate (damping factor to prevent overshooting)
const LEARNING_RATE = 0.5;

// ─── Main Calibration Function ───────────────────────────
//
// Uses simplified JMLE: holds θ fixed (from MLE at test time)
// and re-estimates item parameters a, b, c.
//
// In a full JMLE, both θ and item params are estimated jointly.
// This simplified version is appropriate when:
//   1. θ estimates are reasonably accurate (from CAT with many items)
//   2. We're recalibrating one item at a time
//   3. We don't need the precision of full MCMC/marginal MLE
//

export function recalibrateItem(input: CalibrationInput): CalibrationResult {
  const { currentParams, responses, minSampleSize } = input;
  const sampleSize = responses.length;

  // Don't calibrate with insufficient data
  if (sampleSize < Math.max(minSampleSize, MIN_SAMPLE_SIZE)) {
    return {
      newParams: { ...currentParams },
      sampleSize,
      converged: false,
      iterations: 0,
      parameterChanges: { deltaA: 0, deltaB: 0, deltaC: 0 },
    };
  }

  let a = currentParams.a;
  let b = currentParams.b;
  let c = currentParams.c;

  let converged = false;
  let iterations = 0;

  for (let iter = 0; iter < MAX_ITERATIONS; iter++) {
    iterations = iter + 1;

    // ── Step 1: Compute gradients ──────────────────────
    let gradA = 0;
    let gradB = 0;
    let gradC = 0;

    for (const { theta, response } of responses) {
      const params: IRTParameters = { a, b, c };
      const P = irtProbability(theta, params);
      const pClamped = Math.max(1e-10, Math.min(1 - 1e-10, P));
      const residual = response - pClamped;

      // Logistic function value (without guessing)
      const exponent = D * a * (theta - b);
      const expVal = Math.exp(Math.max(-40, Math.min(40, exponent)));
      const psi = expVal / (1 + expVal);

      // P* = (P - c) / (1 - c)
      const pStar = Math.max(0, (pClamped - c) / (1 - c));

      // ∂P/∂a = (1-c) · D · (θ-b) · ψ · (1-ψ)
      const dPda = (1 - c) * D * (theta - b) * psi * (1 - psi);

      // ∂P/∂b = -(1-c) · D · a · ψ · (1-ψ)
      const dPdb = -(1 - c) * D * a * psi * (1 - psi);

      // ∂P/∂c = 1 - ψ (the guessing component)
      const dPdc = 1 - psi;

      // Gradient contributions (from log-likelihood)
      const weight = residual / (pClamped * (1 - pClamped));
      gradA += weight * dPda;
      gradB += weight * dPdb;
      gradC += weight * dPdc;
    }

    // Average gradients
    gradA /= sampleSize;
    gradB /= sampleSize;
    gradC /= sampleSize;

    // ── Step 2: Update parameters ──────────────────────
    const newA = Math.max(A_MIN, Math.min(A_MAX, a + LEARNING_RATE * gradA));
    const newB = Math.max(B_MIN, Math.min(B_MAX, b + LEARNING_RATE * gradB));
    const newC = Math.max(C_MIN, Math.min(C_MAX, c + LEARNING_RATE * gradC));

    // ── Step 3: Check convergence ──────────────────────
    const deltaA = Math.abs(newA - a);
    const deltaB = Math.abs(newB - b);
    const deltaC = Math.abs(newC - c);

    a = newA;
    b = newB;
    c = newC;

    if (deltaA < CONVERGENCE_THRESHOLD &&
        deltaB < CONVERGENCE_THRESHOLD &&
        deltaC < CONVERGENCE_THRESHOLD) {
      converged = true;
      break;
    }
  }

  // Round to 2 decimal places
  const newParams: IRTParameters = {
    a: Math.round(a * 100) / 100,
    b: Math.round(b * 100) / 100,
    c: Math.round(c * 100) / 100,
  };

  return {
    newParams,
    sampleSize,
    converged,
    iterations,
    parameterChanges: {
      deltaA: Math.round((newParams.a - currentParams.a) * 100) / 100,
      deltaB: Math.round((newParams.b - currentParams.b) * 100) / 100,
      deltaC: Math.round((newParams.c - currentParams.c) * 100) / 100,
    },
  };
}

// ─── Batch Calibration ───────────────────────────────────
// Recalibrate all items that have enough response data

export interface BatchCalibrationItem {
  id: string;
  currentParams: IRTParameters;
  responses: ResponseRecord[];
}

export function batchRecalibrate(
  items: BatchCalibrationItem[],
  minSampleSize: number = MIN_SAMPLE_SIZE
): Map<string, CalibrationResult> {
  const results = new Map<string, CalibrationResult>();

  for (const item of items) {
    const result = recalibrateItem({
      currentParams: item.currentParams,
      responses: item.responses,
      minSampleSize,
    });
    results.set(item.id, result);
  }

  return results;
}

// ─── Item Fit Statistics ─────────────────────────────────
// Check if an item's parameters fit the observed data

export interface ItemFitResult {
  itemId: string;
  chiSquare: number;
  degreesOfFreedom: number;
  pValue: number;
  fits: boolean;           // true if item fits the model
  recommendation: 'keep' | 'recalibrate' | 'review' | 'retire';
}

export function assessItemFit(
  itemId: string,
  params: IRTParameters,
  responses: ResponseRecord[],
  abilityGroups: number = 10
): ItemFitResult {
  if (responses.length < abilityGroups * 3) {
    return {
      itemId,
      chiSquare: 0,
      degreesOfFreedom: 0,
      pValue: 1,
      fits: true,
      recommendation: 'keep',
    };
  }

  // Sort responses by theta and group
  const sorted = [...responses].sort((a, b) => a.theta - b.theta);
  const groupSize = Math.floor(sorted.length / abilityGroups);

  let chiSquare = 0;
  let df = 0;

  for (let g = 0; g < abilityGroups; g++) {
    const start = g * groupSize;
    const end = g === abilityGroups - 1 ? sorted.length : (g + 1) * groupSize;
    const group = sorted.slice(start, end);

    if (group.length === 0) continue;

    // Mean theta for this group
    const meanTheta = group.reduce((sum, r) => sum + r.theta, 0) / group.length;

    // Expected proportion correct
    const expectedP = irtProbability(meanTheta, params);

    // Observed proportion correct
    const observedCorrect = group.filter(r => r.response === 1).length;
    const observedP = observedCorrect / group.length;

    // Chi-square contribution
    const n = group.length;
    const expected = expectedP * n;
    const expectedWrong = (1 - expectedP) * n;

    if (expected > 0 && expectedWrong > 0) {
      chiSquare += Math.pow(observedCorrect - expected, 2) / expected;
      chiSquare += Math.pow((n - observedCorrect) - expectedWrong, 2) / expectedWrong;
      df++;
    }
  }

  // Approximate p-value using chi-square distribution
  // (simplified — in production, use a proper chi-square CDF)
  df = Math.max(1, df - 3); // subtract estimated parameters
  const pValue = chiSquarePValue(chiSquare, df);
  const fits = pValue > 0.01; // α = 0.01

  let recommendation: 'keep' | 'recalibrate' | 'review' | 'retire';
  if (pValue > 0.05) {
    recommendation = 'keep';
  } else if (pValue > 0.01) {
    recommendation = 'recalibrate';
  } else if (pValue > 0.001) {
    recommendation = 'review';
  } else {
    recommendation = 'retire';
  }

  return { itemId, chiSquare, degreesOfFreedom: df, pValue, fits, recommendation };
}

// ─── Simplified Chi-Square P-Value ───────────────────────
// Using Wilson-Hilferty approximation

function chiSquarePValue(x: number, df: number): number {
  if (df <= 0 || x <= 0) return 1;

  // Wilson-Hilferty normal approximation
  const z = Math.pow(x / df, 1 / 3) - (1 - 2 / (9 * df));
  const denom = Math.sqrt(2 / (9 * df));
  const zScore = z / denom;

  // Standard normal CDF (upper tail)
  const t = 1 / (1 + 0.2316419 * Math.abs(zScore));
  const d = 0.3989422804014327;
  const p = d * Math.exp(-zScore * zScore / 2) *
    (t * (0.3193815 + t * (-0.3565638 + t * (1.781478 + t * (-1.8212560 + t * 1.3302744)))));

  return zScore >= 0 ? p : 1 - p;
}
