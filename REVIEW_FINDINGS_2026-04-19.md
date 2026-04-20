# Codex Adversarial Review Findings - 2026-04-19

> Automated review fired by the pre-commit hook on commit 2f2e3ed (checkpoint before claude-brain bootstrap).
> These findings must be addressed before CISSP Quest ships payments to production.

## Critical (blocking ship)

### 1. Stripe integration: missing DB columns
Checkout route selects stripe_customer_id and webhook updates stripe_subscription_id, subscription_expires_at. Neither column exists in supabase-MASTER-migration.sql. Users who pay will not receive access.
Files:
- src/app/api/stripe/checkout/route.ts:20
- src/app/api/stripe/webhook/route.ts:21
- supabase-MASTER-migration.sql:13, 26

### 2. Subscription tier client-writable
RLS policy allows users to update their own users row with no column restrictions. Any authenticated user can self-upgrade to expert via browser console.
Files:
- supabase-MASTER-migration.sql:141

### 3. Webhook signature verification optional
Falls back to JSON.parse(body) if STRIPE_WEBHOOK_SECRET is missing. Anyone with the webhook URL can forge a checkout.session.completed event and upgrade themselves.
Files:
- src/app/api/stripe/webhook/route.ts:34

## High (urgent)

### 4. Webhook DB failures silently return 200
upgradeTier ignores Supabase errors. Handler always returns {received: true}. Failed updates are lost forever, Stripe does not retry.
Files:
- src/app/api/stripe/webhook/route.ts:20, 93

### 5. Paid-feature gates client-only
Ghost POV, Evidence Constellation, Practice Exam pages render directly without checking tier server-side. Direct URL navigation bypasses the AppShell menu labels.
Files:
- src/app/app/story/ghost-pov/page.tsx:115
- src/app/app/tools/constellation/page.tsx:7
- src/app/app/quiz/practice-exam/page.tsx:29
- src/components/layout/AppShell.tsx:42
- src/lib/stripe/config.ts:81

### 6. Community/notification tables not in migration
chatroom_messages, weekly_scores, notification_queue referenced in code but not in migration SQL. These pages will error on deploy.
Files:
- src/components/community/DomainLounge.tsx:73, 178
- src/components/community/WeeklyLeaderboard.tsx:78
- src/components/layout/AppShell.tsx:96
- src/app/api/stripe/webhook/route.ts:82

### 7. Annual billing UI does not reach the server
Upgrade page sends priceId/mode/tier. API reads tier/annual. Annual toggle does nothing.
Files:
- src/app/app/upgrade/page.tsx:33, 37
- src/app/api/stripe/checkout/route.ts:14, 37

## Medium

### 8. success_url trusts request Origin header
Attacker-forged requests can redirect Stripe checkout to attacker-controlled domain after payment. Use canonical app URL from env.
Files:
- src/app/api/stripe/checkout/route.ts:47

### 9. Subscription lifecycle does not check status
Upgrades on every customer.subscription.updated regardless of status/cancellation/trial/payment state. Past-due/unpaid subscriptions retain premium access until delete event.
Files:
- src/app/api/stripe/webhook/route.ts:58, 76

### 10. Practice exam domain weights configured but not enforced
CISSP domain weights set but selectNext() does not use them. Domain distribution is skewed by Fisher information and pool order.
Files:
- src/lib/cat-session.ts:494, 391

### 11. SPRT helper pass/fail inverted
Returns 'fail' when log likelihood favors pass. Not called by CATSession yet, but if CATController path is used, strong candidates fail.
Files:
- src/lib/irt-engine.ts:267, 281

### 12. seed-questions.ts is destructive and incomplete
Deletes all source='ai_generated' rows before validating sources. Ignores delete errors. Silently replaces malformed options with []. Omits the 8 newly staged domain-extra-questions.sql files from its FILES list.
Files:
- scripts/seed-questions.ts:24, 151, 170

## Review disposition

None of these findings are bootstrap-related. They are application logic and data-model issues that must be fixed in code before the Stripe integration ships.

Priority order for fixing:
1. Add missing DB columns and migration (fixes #1 and #6)
2. Lock down RLS to prevent tier self-assignment (fixes #2)
3. Require webhook signature verification in all environments (fixes #3)
4. Check tier server-side on paid routes (fixes #5)
5. Fix webhook error handling (fixes #4)
6. Fix annual billing end-to-end (fixes #7)
7. Fix success_url origin validation (fixes #8)
8. Add subscription status check (fixes #9)
9. Fix SPRT inversion if using CATController path (fixes #11)
10. Fix seed script and domain weights (fixes #10, #12)
