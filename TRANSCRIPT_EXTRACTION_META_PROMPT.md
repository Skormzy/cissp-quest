# Meta-Prompt: Generate an Overnight CLI Knowledge Extraction Prompt

**Purpose:** Paste this entire prompt into Claude VS Code (in the cissp-quest project). It will study the project, then produce an optimized Claude Code CLI prompt that autonomously processes all 252 lesson transcripts overnight and extracts pure CISSP domain knowledge to generate original content for CISSP Quest.

---

## CONTENT SOURCING FIREWALL — READ THIS FIRST

The transcripts are from a paid third-party CISSP training course. They are reference material ONLY. The transcripts exist to tell us WHAT CISSP topics and concepts need to be covered and to WHAT DEPTH. They must NEVER be the source of our content.

**This is the non-negotiable rule that governs every phase of extraction:**

The ONLY thing we extract from transcripts is a **topic inventory**: what CISSP concepts, frameworks, standards, formulas, acronyms, and domain mappings are discussed. We then use that inventory as a checklist to generate 100% original content from first principles, referencing only:
- The official ISC2 CISSP exam outline (CBK)
- NIST publications, RFCs, ISO standards, and other public-domain authoritative sources
- General cybersecurity domain knowledge

**Specifically, the CLI prompt must NEVER:**
- Copy, paraphrase, or closely adapt the instructor's explanations, phrasing, or sentence structure
- Reproduce the instructor's examples, scenarios, or real-world stories
- Reproduce the instructor's analogies or teaching metaphors
- Use the instructor's unique mnemonics, memory tricks, or study tips
- Reference the course, the instructor, the platform, or any lesson structure
- Generate content where a reader familiar with the course would recognize the source

**Specifically, the CLI prompt MUST:**
- Treat transcripts as a "table of contents" — extract WHAT topics are covered, not HOW they are taught
- Generate all explanations, examples, analogies, memory hacks, and exam tips from scratch using authoritative public-domain sources
- When generating analogies and memory hacks, invent entirely new ones that fit CISSP Quest's visual novel / Operation Shadow Protocol theme
- When a transcript mentions a formula (like ALE = SLE x ARO), verify it against public ISC2/NIST sources before including it — formulas are public domain facts, not course IP
- When a transcript mentions a standard or framework (like TOGAF, SABSA), research it independently rather than relying on the instructor's description

**The litmus test for every piece of generated content:** If the course creator read our output, would they recognize ANY of their original teaching? The answer must be NO. They should only recognize the same public-domain CISSP body of knowledge that every CISSP resource covers.

---

## Your Task

You are working inside the cissp-quest project. Your job is to produce a single, self-contained prompt that I will paste into Claude Code CLI in the terminal. That CLI prompt must run autonomously for hours without human interaction, processing all transcript source material and producing structured output files.

Before writing the prompt, you MUST read and understand these files so the prompt targets the exact formats, schemas, and conventions this project uses:

### Files to Read First

**Schemas and types (read these to understand exact output formats):**
- `CLAUDE.md` — project rules, theme, XP system, architecture
- `BUILD_PROMPT.md` — full spec including story structure, quiz engine, library format
- `src/lib/types.ts` — TypeScript interfaces for all entities
- `src/lib/story-types.ts` — story node types (DialogueNode, EvidenceNode, KnowledgeCheckNode, TimedDecisionNode, ThinkLikeManagerNode, VisualAidNode, etc.)
- `src/lib/constants.ts` — domains, chapters, locations, XP values, achievements
- `supabase-migration.sql` — core tables (library_topics, questions, chapter_lessons, etc.) with exact column definitions
- `supabase-cat-engine-migration.sql` — cat_questions table with IRT parameters
- `supabase-story-mode-migration.sql` — scene_definitions, concept_analogies, concept_mastery tables

**Existing content (read these to understand quality bar and avoid duplication):**
- `src/data/story-content.ts` — Chapter 1 complete (the gold standard for story format)
- `src/data/domain1-sample-questions.ts` — question format with createManualQuestion()
- `src/data/glossary.ts` — 200+ terms with definition, exam_tip, memory_hack format
- `source-material/knowledge-base/domain1-knowledge.md` — example of knowledge depth
- `source-material/knowledge-base/complete-content-map.md` — what topics exist
- `source-material/knowledge-base/gap-analysis.md` — known content gaps
- `source-material/questions/domain1-questions.sql` — SQL question format with IRT params

**Source material to process (the transcripts):**
- A sample of Whisper JSON files: `source-material/transcripts/whisper-195-symmetric-cryptography.json` and 2-3 others — these have structured metadata including `domain`, `subdomain`, `title`, `transcript`, and `duration` fields
- A sample of lesson JSON files: `source-material/transcripts/lesson-001-lesson-193.json` through a few others — to understand the lesson JSON metadata structure
- `source-material/transcripts/all-transcripts.txt` — all 252 lessons as clean text (use for bulk processing after understanding the format from the JSON samples above)

### What the CLI Prompt Must Do

The prompt you generate must instruct Claude Code CLI to autonomously:

1. **Phase 1 — Topic Inventory (read all transcripts, extract WHAT is covered)**
   - Read every Whisper JSON file in `source-material/transcripts/whisper-*.json` first (these have the best metadata: domain, subdomain, title)
   - Read every lesson JSON file in `source-material/transcripts/lesson-*.json`
   - For each lesson, extract ONLY: topic names, concept names, framework/standard names, formula references, acronyms, and the ISC2 domain + subdomain mapping
   - Do NOT extract explanations, examples, analogies, or teaching approaches
   - Cross-reference extracted topics against `source-material/knowledge-base/complete-content-map.md` to identify:
     - Topics already covered in our knowledge base (just note them)
     - Topics NOT yet covered (these are the gaps to fill)
   - Write a structured topic inventory to `source-material/transcripts/topic-inventory.json` with format:
     ```json
     {
       "domains": {
         "1": {
           "name": "Security and Risk Management",
           "topics": [
             {
               "concept": "Enterprise Security Architecture Frameworks",
               "subtopics": ["Zachman", "SABSA", "TOGAF"],
               "isc2_subdomain": "1.1",
               "already_in_knowledge_base": false,
               "lesson_ids": [193],
               "formulas": [],
               "acronyms": ["TOGAF"],
               "standards_referenced": ["TOGAF 9.2"]
             }
           ]
         }
       },
       "summary": { "total_topics": 0, "gaps_found": 0, "by_domain": {} }
     }
     ```

2. **Phase 2 — Gap Analysis Report**
   - Cross-reference the topic inventory against `source-material/knowledge-base/gap-analysis.md` and the ISC2 CISSP exam outline domains
   - Produce `source-material/transcripts/gap-report.md` listing:
     - Topics in transcripts that are NOT in our knowledge base (priority targets)
     - Topics in the ISC2 exam outline that are in NEITHER the transcripts nor our knowledge base (blind spots)
     - Topics where transcripts indicate deeper coverage is needed than what we currently have
   - This report drives all subsequent generation phases

3. **Phase 3 — Generate New Questions (original, from first principles)**
   - Using the topic inventory as a checklist of WHAT to write questions about, generate new questions in SQL format matching the `cat_questions` schema exactly
   - Target: 20-30 NEW questions per domain (160-240 total) covering topics identified as gaps
   - ALL question text, options, explanations, and mnemonics must be written from scratch using ISC2 CBK knowledge and public-domain security concepts
   - Each question must include: domain_id, topic_cluster, question_text, 4 plausible options (JSONB), correct_index (balanced 0-3), explanation, mnemonic_hint, cognitive_level, question_type, difficulty_rating, IRT parameters (irt_a, irt_b, irt_c)
   - Follow the "Think Like a Manager" framing: governance over technical action
   - Explanations should reference public standards (NIST, ISO, RFC) where applicable
   - Write to `source-material/transcripts/generated-questions/domain{N}-transcript-questions.sql`

4. **Phase 4 — Generate Story Content (original scenarios, our characters)**
   - Using the topic inventory to know WHICH concepts each chapter must teach, produce story scene content for chapters 2-8
   - ALL scenarios, dialogue, analogies, and teaching moments must be original, set within Operation Shadow Protocol's narrative
   - Use the exact node types from `src/lib/story-types.ts`
   - Each chapter needs: arrival scenes, briefing content with original memory hacks, knowledge check questions, investigation scenes, mission quiz questions
   - Invent new analogies that fit the spy/cybersecurity thriller theme (NOT adapted from the course instructor)
   - Use the NPCs: Janet Park (SOC Lead), Director Reeves (CEO), Kai Tanaka (Forensics), Agent Morales (FBI)
   - Use the chapter locations from constants.ts
   - Write to `source-material/transcripts/generated-story/chapter{N}-story-draft.ts` in TypeScript format matching story-content.ts

5. **Phase 5 — Expand Glossary (original definitions)**
   - Compare the topic inventory's acronyms and concept names against the existing 200+ glossary terms in `src/data/glossary.ts`
   - For terms found in transcripts but missing from the glossary, generate new GlossaryTerm entries
   - ALL definitions, exam tips, and memory hacks must be written from scratch — do not paraphrase the instructor's definitions
   - Each new term must include: term, domain_id, definition (with an original analogy), exam_tip, memory_hack, related_topic_id
   - Write to `source-material/transcripts/generated-glossary/new-terms.ts` matching glossary.ts format

6. **Phase 6 — Generate Library Topics (original deep-dive content)**
   - For topics identified in Phase 2 as gaps, generate full library_topics entries
   - ALL content must be written from first principles using ISC2 CBK, NIST, ISO, and public-domain sources
   - Each must include: domain_id, topic_number, title, one_liner, content_markdown (3-5 paragraphs with real depth), key_formulas (JSONB if applicable), comparison_table (JSONB if applicable), exam_tips, think_like_manager, memory_hack, memory_anchor (tied to the story location for that domain)
   - When writing content_markdown, cite public standards where relevant (e.g., "NIST SP 800-30 defines..." or "Per ISO 27001...")
   - Write to `source-material/transcripts/generated-library/domain{N}-new-topics.sql` in SQL INSERT format

7. **Phase 7 — Coverage Verification Audit**

   This is the critical accountability phase. Go back to the topic inventory from Phase 1 and verify that every single concept made it into at least one output. Nothing should fall through the cracks.

   **Step 7a — Build the traceability matrix:**
   - Re-read `source-material/transcripts/topic-inventory.json` (Phase 1 output)
   - For EVERY topic/concept in the inventory, check whether it appears in at least one of:
     - An existing knowledge-base file (`source-material/knowledge-base/domain*-knowledge.md`)
     - An existing glossary term (`src/data/glossary.ts`)
     - An existing question (`source-material/questions/domain*-questions.sql`)
     - A newly generated question (Phase 3 output)
     - A newly generated story chapter (Phase 4 output)
     - A newly generated glossary term (Phase 5 output)
     - A newly generated library topic (Phase 6 output)
   - Write `source-material/transcripts/coverage-matrix.json` with this structure:
     ```json
     {
       "generated_at": "ISO timestamp",
       "total_concepts_inventoried": 0,
       "total_covered": 0,
       "total_uncovered": 0,
       "coverage_percentage": 0.0,
       "by_domain": {
         "1": {
           "name": "Security and Risk Management",
           "total": 0,
           "covered": 0,
           "uncovered": 0,
           "coverage_pct": 0.0
         }
       },
       "concepts": [
         {
           "concept": "Symmetric Cryptography",
           "domain": 3,
           "isc2_subdomain": "3.6",
           "covered": true,
           "found_in": {
             "existing_knowledge_base": true,
             "existing_glossary": true,
             "existing_questions": true,
             "new_questions": true,
             "new_story": true,
             "new_glossary": false,
             "new_library_topic": false
           },
           "content_types_count": 5,
           "notes": "Well covered across existing and new content"
         },
         {
           "concept": "TOGAF Framework",
           "domain": 1,
           "isc2_subdomain": "1.1",
           "covered": false,
           "found_in": {
             "existing_knowledge_base": false,
             "existing_glossary": false,
             "existing_questions": false,
             "new_questions": false,
             "new_story": false,
             "new_glossary": false,
             "new_library_topic": false
           },
           "content_types_count": 0,
           "notes": "GAP — not covered anywhere"
         }
       ]
     }
     ```

   **Step 7b — Fill remaining gaps:**
   - For any concept where `covered` is `false`, generate the missing content NOW:
     - At minimum: one glossary term + one quiz question + one library topic mention
     - Write additional questions to `source-material/transcripts/generated-questions/gap-fill-questions.sql`
     - Write additional glossary terms to `source-material/transcripts/generated-glossary/gap-fill-terms.ts`
     - Write additional library topics to `source-material/transcripts/generated-library/gap-fill-topics.sql`
   - Re-run the coverage check and update `coverage-matrix.json` to reflect the gap fills
   - Target: 100% coverage. Every inventoried concept appears in at least one content type.

   **Step 7c — Cross-reference verification:**
   - For each domain, verify that:
     - Every new question's `topic_cluster` maps to a real concept in the inventory
     - Every new glossary term maps to a concept in the inventory
     - Every new library topic covers a concept flagged as a gap in Phase 2
     - Every story chapter's `conceptsCovered` array references real concepts from the inventory
   - Flag any orphaned content (generated content that doesn't trace back to an inventoried concept)
   - Write discrepancies to `source-material/transcripts/verification-issues.json`

8. **Phase 8 — Final Report**
   - Write `source-material/transcripts/EXTRACTION_REPORT.md` with:

   **Section 1: Execution Summary**
     - Total lessons processed, total unique topics inventoried
     - Per-domain breakdown: topics found, gaps identified, questions generated, story scenes written, glossary terms added, library topics created
     - Total execution phases completed, any phases that were interrupted

   **Section 2: Coverage Dashboard**
     - Overall coverage percentage (target: 100%)
     - Per-domain coverage percentage table
     - List of any concepts that remain uncovered after gap-filling (with explanation of why)
     - Heat map style breakdown: which content types have the best coverage vs. thinnest

   **Section 3: Content Inventory**
     - Total new questions generated (by domain, by difficulty, by question type)
     - Total new glossary terms generated (by domain)
     - Total new library topics generated (by domain)
     - Total story scenes generated (by chapter)
     - Comparison: existing content count vs. new content count, by category

   **Section 4: Quality Flags**
     - Any concepts where coverage is thin (only 1 content type touches it)
     - Any domains with disproportionately low question counts
     - Any story chapters missing key concepts for their domain
     - Orphaned content that doesn't map to the inventory

   **Section 5: IP Compliance Checklist**
     - Confirm that no generated content is derived from course-specific teaching
     - Confirm all analogies and memory hacks are original to CISSP Quest
     - Confirm all explanations reference public-domain sources only

   **Section 6: Recommended Next Steps**
     - Priority actions for content team review
     - Concepts that need human review for accuracy
     - Story chapters that need narrative polish
     - Suggested areas for additional question generation beyond transcript coverage

### Critical Requirements for the CLI Prompt

- **IP firewall is absolute:** The Content Sourcing Firewall section above must be embedded verbatim in the CLI prompt. It is not a suggestion. Every phase must comply.
- **Autonomous execution:** No questions, no confirmations, no pauses. Just process and write files.
- **Idempotent:** If interrupted and restarted, it should be able to pick up or overwrite cleanly.
- **File-first:** Write every output to a file. Do not dump content into the terminal.
- **Quality over speed:** It is better to produce 150 excellent questions than 300 mediocre ones.
- **Domain accuracy:** Every piece of content must be mapped to the correct CISSP domain. Cross-reference against the domain definitions in constants.ts and the ISC2 exam outline.
- **Format compliance:** Every output must match the exact schema/type/format of the target system. A question missing IRT parameters is useless. A story node with wrong types won't compile.
- **Progress tracking:** Write a `source-material/transcripts/progress.json` file and update it after each phase completes (8 phases total), so if interrupted we know where it stopped.
- **Source attribution:** Generated content should reference public-domain authoritative sources (ISC2, NIST, ISO, RFCs) where applicable, never the course or instructor.
- **Verification is mandatory:** Phase 7 (Coverage Verification Audit) is not optional. The entire point of this pipeline is that every concept from the transcripts ends up in our product. If the verification phase finds gaps, it must fill them before moving to the final report. Do not skip Step 7b.

### Output Format

Produce the CLI prompt as a single markdown code block that I can copy-paste directly into Claude Code CLI. The prompt should be comprehensive enough that Claude Code can execute it without any additional context beyond what exists in the cissp-quest project directory.

Start the prompt with explicit instructions for Claude Code to first read the key schema/type files before processing, so it has the exact formats loaded in context. Embed the full Content Sourcing Firewall section in the prompt itself so it persists in the CLI context.
