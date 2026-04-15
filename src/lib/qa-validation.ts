import { StoryModeProgress } from './story-types';

/**
 * Validates story progress for impossible or inconsistent states.
 * Returns an array of warning strings — empty means the state is valid.
 *
 * Call this in dev mode on the domain chapter page to catch data bugs early.
 */
export function validateGameState(progress: StoryModeProgress): string[] {
  const warnings: string[] = [];
  const d = `D${progress.domain_number}`;

  // ── Chain violations: each step requires the previous one ──

  if (progress.act2_completed && !progress.act1_completed) {
    warnings.push(`${d}: act2_completed=true but act1_completed=false — act 2 should not complete before act 1`);
  }

  if (progress.field_test_passed && !progress.act2_completed) {
    warnings.push(`${d}: field_test_passed=true but act2_completed=false — field test should not pass before act 2`);
  }

  if (progress.act4_completed && !progress.field_test_passed) {
    warnings.push(`${d}: act4_completed=true but field_test_passed=false — act 4 should not complete before the field test`);
  }

  if (progress.boss_battle_passed && !progress.act4_completed) {
    warnings.push(`${d}: boss_battle_passed=true but act4_completed=false — boss battle should not pass before act 4`);
  }

  if (progress.domain_conquered && !progress.boss_battle_passed) {
    warnings.push(`${d}: domain_conquered=true but boss_battle_passed=false — domain should not be conquered before boss battle`);
  }

  // ── current_act consistency ──

  if (progress.act1_completed && progress.current_act <= 1) {
    warnings.push(`${d}: act1_completed=true but current_act=${progress.current_act} — expected current_act >= 2`);
  }

  if (progress.act2_completed && progress.current_act <= 2) {
    warnings.push(`${d}: act2_completed=true but current_act=${progress.current_act} — expected current_act >= 3`);
  }

  if (progress.act4_completed && progress.current_act <= 4) {
    warnings.push(`${d}: act4_completed=true but current_act=${progress.current_act} — expected current_act >= 5`);
  }

  // ── Score sanity ──

  if (progress.field_test_passed && progress.field_test_score === null) {
    warnings.push(`${d}: field_test_passed=true but field_test_score is null — passed quiz should have a score`);
  }

  if (progress.boss_battle_passed && progress.boss_battle_score === null) {
    warnings.push(`${d}: boss_battle_passed=true but boss_battle_score is null — passed quiz should have a score`);
  }

  if (progress.field_test_score !== null && progress.field_test_attempts === 0) {
    warnings.push(`${d}: field_test_score=${progress.field_test_score} but field_test_attempts=0 — score without attempts`);
  }

  if (progress.boss_battle_score !== null && progress.boss_battle_attempts === 0) {
    warnings.push(`${d}: boss_battle_score=${progress.boss_battle_score} but boss_battle_attempts=0 — score without attempts`);
  }

  // ── Best score vs current score ──

  if (
    progress.field_test_score !== null &&
    progress.field_test_best_score !== null &&
    progress.field_test_score > progress.field_test_best_score
  ) {
    warnings.push(`${d}: field_test_score (${progress.field_test_score}) > field_test_best_score (${progress.field_test_best_score}) — best should always be >= current`);
  }

  if (
    progress.boss_battle_score !== null &&
    progress.boss_battle_best_score !== null &&
    progress.boss_battle_score > progress.boss_battle_best_score
  ) {
    warnings.push(`${d}: boss_battle_score (${progress.boss_battle_score}) > boss_battle_best_score (${progress.boss_battle_best_score}) — best should always be >= current`);
  }

  // ── conquered_at consistency ──

  if (progress.domain_conquered && !progress.conquered_at) {
    warnings.push(`${d}: domain_conquered=true but conquered_at is null — should have a timestamp`);
  }

  if (!progress.domain_conquered && progress.conquered_at) {
    warnings.push(`${d}: domain_conquered=false but conquered_at has a value — orphaned timestamp`);
  }

  return warnings;
}
