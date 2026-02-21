# CISSP Quest

## What This Is
Gamified CISSP certification LEARNING platform. NOT just a quiz app.
Three layers: Reference Library + Story Lessons + Quiz Engine

## Core Principle: TEACH FIRST, THEN TEST

## Architecture
- ONE shared storyline (Operation Shadow Protocol) across 8 global locations
- Custom character creator (name, gender, skin, hair, outfit upgrades by level)
- Anime visual novel style with speech bubbles and NPC cast
- Memory techniques embedded: Method of Loci, mnemonics, spaced repetition, chunking, elaborative interrogation, dual coding, narrative encoding
- Reference Library always accessible from nav bar
- Wrong answers link to Library topics with Memory Hack reminders

## Tech Stack
- Framework: Next.js 14+ (App Router, TypeScript)
- Database & Auth: Supabase (Row Level Security enabled)
- Styling: Tailwind CSS
- State: Zustand
- Markdown: react-markdown + remark-gfm
- Payments: Stripe (future sprint)
- AI Questions: Anthropic Claude API (future sprint)
- Deploy: Vercel

## CISSP Domains (all 8 must be covered)
1. Security and Risk Management (15%)
2. Asset Security (10%)
3. Security Architecture and Engineering (13%)
4. Communication and Network Security (13%)
5. Identity and Access Management (13%)
6. Security Assessment and Testing (12%)
7. Security Operations (13%)
8. Software Development Security (11%)

## Design
- Dark theme: bg #080c14, accent #00e8ff, cards #111a2e
- Mobile-first responsive (375px+)
- XP: Easy=25, Medium=50, Hard=100, Wrong=5
- Level = floor(1 + sqrt(xp / 100))

## Content Quality
- Library: clear explanations with analogies, not textbook copy-paste
- Questions: scenario stems, BEST/MOST/FIRST, 4 plausible options
- Lessons: simple to complex, Think Like a Manager perspective
- Every concept gets a Memory Hack (mnemonic/acronym/location anchor)