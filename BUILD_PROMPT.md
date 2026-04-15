Read CLAUDE.md first for full project context.

Build CISSP Quest completely. I am a beginner and cannot fix code myself. Everything must work out of the box.

=== DATABASE (single SQL file for Supabase SQL Editor) ===
Create ALL tables with Row Level Security:

users: id UUID FK auth.users, display_name, character_name TEXT, character_gender TEXT, character_skin INT, character_hair INT, character_hair_color TEXT, character_outfit INT default 1, xp INT default 0, level INT default 1, streak_count INT default 0, streak_last_date DATE, subscription_tier TEXT default 'free', created_at TIMESTAMPTZ

questions: id UUID PK, domain_id INT 1-8, difficulty TEXT, question_text, options JSONB, correct_index INT, explanation, story_context, source TEXT, bloom_level, mnemonic_hint TEXT, library_topic_id UUID FK nullable, is_active BOOLEAN default true, times_shown INT default 0, times_correct INT default 0, created_at TIMESTAMPTZ

user_answers: id UUID, user_id FK, question_id FK, selected_index, is_correct BOOLEAN, time_spent_seconds, xp_earned, session_id UUID, created_at TIMESTAMPTZ

story_progress: user_id FK, chapter_id INT, scene_index INT, domain_id INT, is_complete BOOLEAN, completed_at TIMESTAMPTZ

achievements: user_id FK, badge_id TEXT, earned_at TIMESTAMPTZ

library_topics: id UUID PK, domain_id INT, topic_number TEXT, title, one_liner, content_markdown TEXT, key_formulas JSONB, comparison_table JSONB, exam_tips TEXT, think_like_manager TEXT, memory_hack TEXT, memory_anchor TEXT, related_topic_ids JSONB, created_at TIMESTAMPTZ

chapter_lessons: id UUID, chapter_id INT, domain_id INT, title, content_markdown, knowledge_check_questions JSONB, library_topic_ids JSONB, display_order INT

user_bookmarks: user_id FK, topic_id FK, PRIMARY KEY(user_id, topic_id)

user_question_schedule: user_id FK, question_id FK, times_seen INT, times_correct INT, interval_days INT default 1, next_review DATE, PRIMARY KEY(user_id, question_id)

RLS: users own-row only. questions/library_topics public SELECT. All user_* tables own-row only.

=== AUTHENTICATION ===
Supabase Auth email/password. Signup, confirm, login, reset pages. Middleware protecting /app routes. First login -> character creator.

=== CHARACTER CREATOR (/app/create-character) ===
ANIME STYLE character creation screen:
- Name input field
- Gender selection (Male/Female/Non-binary)
- Skin tone picker (6 options, visual circles)
- Hair style grid (8-10 styles per gender, visual previews)
- Hair color picker (8 colors)
- Live preview: show assembled character as you customize
- Character shown in anime/chibi style using CSS/SVG (not external images)
- Save creates user profile and redirects to dashboard

=== VISUAL NOVEL SCENE SYSTEM ===
Build a reusable VisualNovelScene component:
- Full-width background area with gradient/colored bg and location name overlay
- Two character portrait slots (left speaker, right speaker) using emoji or SVG avatars
- Speaker name badge above dialogue
- Dialogue box: dark semi-transparent bottom overlay with text
- Text appears with typewriter animation (letter by letter)
- Tap/click to continue indicator with pulse animation
- Support for choice moments (2-3 options that give bonus XP)

=== LANDING PAGE (/) ===
Dark theme bg #080c14, accent #00e8ff, cards #111a2e
Hero: CISSP QUEST title, 'Learn. Quest. Conquer the Exam.' subtitle
'The world's first story-driven CISSP learning platform'
How It Works: 4 cards with icons
World map showing 8 investigation locations
8 CISSP Domains with weights
Pricing: Free/Premium $19.99/Elite $39.99
Social proof stats, CTA

=== DASHBOARD (/app/dashboard) ===
Character avatar with name and title
Level progress bar, stats row (XP, Streak, Accuracy, Answered)
World map progress (which locations complete vs locked)
Continue Story card, Quick actions grid: Quick Quiz, Study Domain, Review Weak Areas (with due count badge), Reference Library
Daily Challenges (3), Achievement badges

=== REFERENCE LIBRARY (/app/library) === THIS IS CRITICAL
Nav bar icon (book) ALWAYS visible, even mid-quiz.
Top level: 8 domain cards with topic count and progress.
Domain view: all topics with one_liner preview.
Topic view:
- Title with domain badge
- One-liner in highlighted box
- Memory Anchor tag: location emoji + story reference (e.g. 'Zurich - The Architecture Flaw')
- Full content rendered via react-markdown
- Key Formulas box (styled differently)
- Comparison table if applicable
- Exam Tips callout (amber box)
- Think Like a Manager callout (blue box)
- MEMORY HACK callout (purple box with brain icon): mnemonic device, acronym, or memory technique
- Video placeholder ('Video lesson coming soon')
- Related Topics links
- Quiz Yourself: 3 inline questions with instant feedback
- Bookmark toggle
Search bar filtering all topics. My Bookmarks tab.

=== STORY MODE (/app/story/[chapterId]) ===
8 chapters, one per domain. Each chapter:
1. ARRIVAL: 2-3 visual novel scenes at the new location. Show backgrounds, NPC portraits, dialogue with typewriter effect. NPCs: Janet Park (SOC Lead), Director Reeves (CEO), Kai Tanaka (Forensics), Agent Morales (FBI). Player character uses their custom name in dialogue.
2. BRIEFING: UI shifts to briefing mode - different visual style. Structured lesson with Memory Hacks inline. Links to Library topics.
3. KNOWLEDGE CHECK: 2-3 unscored questions. Wrong = expanded explain.
4. INVESTIGATION: 2 more visual novel scenes where player applies concepts.
5. MISSION QUIZ: scored questions (5-10), earns XP.
6. DEBRIEF: summary card, key takeaways, Library links, next preview.

Create complete story content for all 8 chapters:
Ch1 (Dom1): Nexus HQ New York - breach discovered, risk assessment
Ch2 (Dom2): Data vault New Jersey - asset classification
Ch3 (Dom3): Server farm Zurich - architecture flaw
Ch4 (Dom4): Cable station Singapore - network investigation
Ch5 (Dom5): Office London - identity compromise
Ch6 (Dom6): Forensics lab Tel Aviv - security assessment
Ch7 (Dom7): SOC war room New York - incident response
Ch8 (Dom8): Dev lab Austin - software vulnerability root cause

=== QUIZ ENGINE (/app/quiz) ===
Parameters: domain filter, count, mode (story/quick/domain/review)
One question at a time.
Header: domain tag, difficulty badge, timer, progress bar, streak indicator
Story context in italic if available.
4 options (A/B/C/D) clickable.
After answer: green correct/red wrong, explanation, XP animation.
WRONG ANSWERS MUST INCLUDE:
- 'Study this concept' link to relevant Library topic
- Memory Hack reminder from the mnemonic_hint field
- Location anchor reminder
XP: Easy=25, Medium=50, Hard=100, Wrong=5
Streak bonus: +5 per consecutive correct (starts at 3rd)
Speed bonus: +15 if correct under 10 seconds
10% chance of Critical Hit doubling XP on correct answer

=== RESULTS, DOMAINS, LEADERBOARD, PROFILE ===
Results: grade (S/A/B/C/D), accuracy, XP earned, level.
Domains: 8 cards with progress, click for domain quiz. Free tier: domains 1-2 open, rest locked with upgrade prompt.
Leaderboard: Global/Weekly/Friends tabs. Seed 10 fake entries. Free users can view but don't appear.
Profile: custom character display, name, title, tier badge, stats grid, domain mastery bars, outfit preview for next level, upgrade button, sign out.

=== NAVIGATION ===
Sticky top nav (authenticated only): CISSP QUEST logo, Dashboard, Library (book icon - ALWAYS), Domains, Ranks, XP/Streak/Level counters, character avatar. Mobile: hamburger menu.

=== SEED DATA (VERY IMPORTANT) ===
A) 120+ questions across ALL 8 domains (15+ each), mix easy/medium/hard. CISSP exam patterns: scenario stems, BEST/MOST/FIRST, 4 plausible options, explanations cover correct AND wrong, bloom levels. EACH question includes mnemonic_hint and library_topic_id.

B) Library: ALL 8 domains, 5+ topics each (40+ total). Each needs: title, one_liner, content_markdown (3-5 paragraphs), exam_tips, think_like_manager, memory_hack (mnemonic/acronym), memory_anchor (location reference), key_formulas if applicable.

C) Chapter lessons for all 8 chapters with teaching content, knowledge check questions, and Memory Hacks.

D) Story scenes for all 8 chapters with NPC dialogue, location descriptions, and player character integration.

=== TECHNICAL ===
Next.js App Router, TypeScript, Tailwind CSS. Supabase client in src/lib/supabase/. Zustand in src/stores/. react-markdown for Library. Mobile responsive 375px+. Loading skeletons, error handling, empty states. Output ALL SQL as one migration file I can paste into Supabase SQL Editor including seed data. EVERYTHING must work with seed data. I cannot write code.