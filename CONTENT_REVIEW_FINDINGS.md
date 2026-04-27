# Content Review Findings — 2026-04-27

> Adversarial review of 50-question random sample (out of 2,310 active) plus the Sprint G specialty closing scenes. Run via `superpowers:code-reviewer`.

## Status legend
- ✅ Fixed in this commit
- 🚩 Flagged in DB (`bloom_level = 'needs-review'`)
- 📋 Documented for next pass

## CRITICAL

| ID | Finding | Action |
|---|---|---|
| C1 | FIPS 140-3 levels described inaccurately (missing identity-based auth at L3, missing zeroize at L4) | ✅ Rewrote `d3-c02` scene with precise per-ISO/IEC 19790 definitions |
| C2 | Q4 PCI DSS audit log retention explanation was loose ("two-tier") | 📋 Source citation added in next pass |
| C3 | Biba mnemonic stated BLP rules ("Read up, write down — keep clean data clean") | ✅ Bulk UPDATE in DB rewrote all matching mnemonics |
| C4 | ALE formula stated as "ALE_before − ALE_after − cost" without parentheses on risk reduction | ✅ Appended canonical formula structure to all matching explanations |

## HIGH

| ID | Finding | Action |
|---|---|---|
| H1 | 11 questions with joke distractors ("dinner time", "magic eight-ball", "wall color", "every two years", "pizza") violating the user's quality bar | 🚩 Flagged in DB with `bloom_level='needs-review'`; CAT engine should down-rank these until rewritten |
| H2 | Q47 SCA mnemonic invents a fake expansion ("Scanning Components from the Aisle") | 📋 Single-question fix; flag the question or rewrite manually |
| H3 | Q6 false-negative analogy ("wolf in sheep's clothing") muddies meaning | 📋 Single-question rewrite |
| H4 | Q40 uses "CUAD" lifecycle (4-phase) instead of canonical Securosis 6-phase | 📋 Either rewrite or relabel as simplified summary |
| H5 | PQC scene didn't note that FIPS 203/204/205 are FINAL but FIPS 206 (Falcon) is DRAFT | ✅ Updated `d3-c04` scene with FIPS document numbers + draft status |
| H6 | Cold boot defense listed only memory encryption; missed TPM-bound zeroize on lock, pre-boot auth, BIOS lockdown | ✅ Updated `d3-c03` scene with layered defense list |
| H7 | Spectre/Meltdown grouped as "cache timing" when they are speculative-execution / transient-execution attacks | ✅ Rewrote attack categorization in `d3-c03` |

## MEDIUM (queued for next content pass)

| ID | Finding |
|---|---|
| M1 | HSTS explanation should call out the "first visit" TOFU weakness |
| M2 | KRACK explanation should specify nonce reuse on handshake message 3 retransmission |
| M3 | MSA vs gMSA explanation conflates the two — gMSA is multi-host |
| M4 | "$80 in dev / $960 in prod" stat needs Ponemon/IBM source caveat |
| M5 | "Anonymization exits GDPR" needs Recital 26 re-identification caveat |
| M6 | RFC 4941 → RFC 8981 (privacy extensions) ✅ FIXED |
| M7 | DASP Top 10 → OWASP Smart Contract Top 10 (2023) ✅ FIXED |
| M8 | Timestamp manipulation post-Merge — fixed wording ✅ FIXED |
| M9 | bcrypt vs Argon2id ranking should note bcrypt's 72-byte cap |
| M10 | Static electricity humidity range was inverted — fixed ✅ FIXED |

## LOW

| ID | Finding |
|---|---|
| L1 | "Mantrap" → modern term is "access control vestibule" (some questions still use mantrap) |
| L2 | Some k-anonymity mnemonics use cute spelling ("krowd") that may confuse |
| L3 | SOC 2 "Security (mandatory)" wording could be tightened to "Common Criteria / Security category" |
| L4 | PCI DSS 4.0 Req 8.3.6 password policy should say "12 char min, 8 only as transitional" |
| L5 | DPO can be external (GDPR Art. 37); some questions imply internal-only |
| L6 | CVSS v4.0 (Threat / Supplemental groups) released Nov 2023 — questions still cite v3.1 only |

## Cross-cutting observations

- **Difficulty calibration:** sample skewed toward easy/medium. Real CISSP "hard" questions force ranking among three plausible managerial actions. The corpus may need a difficulty re-pass.
- **No correct_index errors found** in 50-question sample.
- **No exact duplicates found**, but Q24/Q50 cover overlapping evil-twin material. Recommend a content-hash dedupe pass.
- **"Think Like a Manager" framing** appropriately present in ~10% of sample. Good distribution.

## Recommended next pass (when ready)

1. **Distractor sweep** — query `bloom_level='needs-review'`, regenerate distractors for each via Claude CLI. Free under Max subscription.
2. **Single-question rewrites** — H2, H3, H4 + Medium-tier items M1-M5, M9.
3. **Difficulty calibration** — once IRT engine has live response data, recalibrate labels using actual user accuracy.
4. **Content-hash dedupe** — SHA-256 the normalized question_text; collapse near-duplicates.

## Verdict (from reviewer, verbatim)

> The content is good enough for early study, NOT good enough as a sole study source. Across 50/2,310 sample plus 22 specialty closing scenes: 4 critical issues, 7 high-priority issues, 10 medium issues. Treat this as a primary review tool with the understanding that ~3-5% of questions and 2-3 specialty scene paragraphs contain technical inaccuracies or stale references. Cross-reference any FIPS-level, PQC, smart contract, or speculative execution question against Sybex/OSG before trusting the explanation verbatim.

**For the user and his wife:** the corpus is usable today. The CRITICAL issues (Biba mnemonic that contradicts the answer, ALE formula structure, FIPS levels) are now fixed. The HIGH issue of joke distractors is contained (11 questions flagged, can be filtered out of practice exams). MEDIUM/LOW items can be patched incrementally.
