# PHASE 0 KICKOFF — Paste into Claude Code

> Save as `PHASE_0_KICKOFF.md` in the project root for reference.
> Purpose: The exact prompt to paste into Claude Code in `C:\Projects\cissp-quest` to begin the personal build immediately.

---

## What to do

1. Open Claude Code in `C:\Projects\cissp-quest`
2. Make sure CISSP_QUEST_PERSONAL_BUILD_SPEC.md and CISSP_QUEST_PERSONAL_BUILD_SPEC_PART2.md are saved at the project root
3. Paste the prompt block below verbatim
4. Let Claude Code work. Confirm at one-step decision points only.

---

## The prompt to paste

```
You are Claude Code working on CISSP Quest in C:\Projects\cissp-quest.

CONTEXT:
This is the personal build phase. Seymour and his wife are using this app to study for the CISSP exam. We are explicitly NOT building Stripe, RLS lockdown for tier protection, or any commercial features in this phase. Those are deferred to Stage 2 after both spouses pass.

AUTHORITATIVE SPEC:
Read these two files in this order before doing anything else:
1. CISSP_QUEST_PERSONAL_BUILD_SPEC.md (project root)
2. CISSP_QUEST_PERSONAL_BUILD_SPEC_PART2.md (project root)

These supersede MASTER_REBUILD_PLAN.md, CISSP-Quest-Full-Rebuild-Spec.md, and PLAYER_IDENTITY_ADDENDUM.md. The addendum is incorporated into Section 3 of the new spec with one expansion (gender enum now includes 'nonbinary').

PHASE 0 SCOPE (this session):
Per Section 13 Phase 0 of the spec:

1. Verify environment is sane:
   git status
   git log --oneline -5
   node --version (need 20.x)
   npm --version

2. Run shadcn/ui init:
   npx shadcn@latest init
   Choose: base-nova style, neutral baseColor, CSS variables yes, App Router yes, src/ yes, components alias @/components, utils alias @/lib/utils

3. Install all shadcn components needed for the spec:
   npx shadcn@latest add button card input select radio-group checkbox dialog sheet tabs accordion badge alert sonner tooltip popover dropdown-menu navigation-menu sidebar table scroll-area separator progress slider switch form command avatar

4. Verify components landed in src/components/ui/

5. Apply the full schema migration:
   - Create supabase/migrations/20260420_personal_build_schema.sql containing all CREATE TABLE statements from Section 4 of the spec (story_acts, story_scenes, story_decisions, knowledge_checks, player_profile, player_progress, player_act_progress, player_scene_progress, player_question_history, failed_concepts, player_achievements, scene_images, library_topics, toolkit_saved_states)
   - Include the ALTER TABLE statements for the existing questions table (add trap_type, technique, cross_domain, library_topic_slug columns)
   - Include all RLS policies (auth.uid = user_id pattern for player tables, public read for story content tables)
   - Apply via Supabase MCP or by running the SQL in the Supabase dashboard
   - Verify tables exist via Supabase MCP list_tables call

6. Set up Next.js fonts (next/font/google):
   - Outfit (headings)
   - Inter (body) 
   - Crimson Pro (story dialogue)
   - JetBrains Mono (code)
   - Caveat (notebook handwriting)
   - Wire into src/app/layout.tsx

7. Update src/app/globals.css with the design tokens from Section 11.1 of the spec (CSS variables for cyber theme colors, story-specific tokens, notebook tokens)

8. Skip Stripe-related fixes (REVIEW_FINDINGS items #1, #2, #3, #4, #7, #8, #9 are Stage 2)

9. Skip community tables migration (Stage 2)

10. Run npm run build to verify nothing broke

11. Run npm run dev to confirm app boots

12. Commit:
    git add -A
    git commit -m "Phase 0: shadcn install, full personal-build schema, design tokens, fonts"

OPERATING RULES:
- One command at a time. Show me the actual output before moving to the next step. Use fenced code blocks for output.
- Confidence flags on technical claims: VERIFIED, LIKELY, UNVERIFIED
- Pause only at genuine decision points (e.g., shadcn init asks a question I need to answer, or a command fails and you need a decision on retry vs alternative)
- After completion, generate FOR_Seymour.md per the standing project rule
- The codex-plugin-cc adversarial review will fire on git commit. If it surfaces findings on Phase 0 work, address Critical findings before declaring the phase done. High and Medium can be documented in REVIEW_FINDINGS for next session.

EXPECTED DURATION: 2 to 3 hours.

EXPECTED OUTPUT AT END OF SESSION:
- shadcn installed and components in src/components/ui/
- Full schema applied and verified in Supabase
- Design tokens in globals.css
- Fonts loading
- npm run build passes
- npm run dev boots clean
- Clean commit on master
- FOR_Seymour.md written

DO NOT DO IN THIS SESSION:
- Build any UI screens (Phase 2)
- Touch the player identity wizard (Phase 1)
- Touch the visual novel engine (Phase 3)
- Generate any story content (Phase 4)
- Generate any images (Phase 4)
- Touch Stripe (Stage 2)
- Touch community features (Stage 2)

Begin with step 1.
```

---

## What happens after Phase 0

You come back to this chat (Claude.ai) with the FOR_Seymour.md from Phase 0 and we plan Phase 1 (player identity system). At that point:

- I draft the wizard component code in this chat
- You paste it into Claude Code for execution
- Claude Code wires it to Supabase and tests
- You and your wife each create your accounts and profiles
- Phase 1 done

Then we move to Phase 2 (app shell + dashboard), Phase 3 (visual novel engine), Phase 4 (Acts 1+2 content + images + Library entries).

After Phase 4: app is playable. You both start studying.

---

## If Phase 0 hits a snag

Common issues to anticipate:

**shadcn init fails on Tailwind v4 detection.** Likely needs `npx shadcn@canary` instead of `@latest` because Tailwind v4 support is recent. (CONFIDENCE: LIKELY based on shadcn release timing.) If that happens, paste the error here and I'll diagnose.

**Schema migration fails on existing tables.** The current Supabase has 20+ existing tables. New migration must use `CREATE TABLE IF NOT EXISTS` and `ALTER TABLE` patterns to avoid clobbering. The spec's schema is written this way.

**Font loading slows build.** If `next build` time spikes, drop Caveat for now (only used in debrief scenes, not critical for Phase 0).

**RLS conflicts with existing tables.** If existing questions or other tables have RLS that conflicts with new policies, document the conflict and skip RLS changes on existing tables (the personal build doesn't need tight RLS).

---

*End of PHASE_0_KICKOFF.md*
