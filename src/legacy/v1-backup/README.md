# V1 Story Engine — Backup

These files preserve the V1 visual-novel engine and its `/app/story/[domain]/[act]` route as a snapshot before the V2 consolidation.

**Snapshot date:** 2026-04-27
**Why kept:** Per project owner request, V1 is preserved as a backup while V2 (the Meridian narrative engine in `src/components/story/VisualNovelEngineV2.tsx`) becomes the single source of truth for story playback.

**Contents:**
- `VisualNovelEngine.tsx.bak` — the V1 engine component
- `v1-act-route.bak/` — the `/app/story/[domain]/[act]` route folder

These files are NOT compiled into the Next.js build (they live outside `src/app` and `src/components`). Restoring V1 is a manual `cp` plus updating the story hub link.

V2 routes used in production:
- `/app/story` — story hub
- `/app/story/[domain]` — domain entry; redirects to V2 chapter
- `/app/story/meridian/[domain]` — V2 chapter (the meridian engine)
