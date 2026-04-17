# CISSP Quest — Overnight Knowledge Extraction CLI Prompt

> **Generated:** 2026-04-16
> **Purpose:** Copy-paste this entire code block into Claude Code CLI in the terminal. It will autonomously process all transcript source material and generate original CISSP content across 8 phases.
> **Estimated runtime:** 4–8 hours depending on context window management.

---

## How to Use

1. Open a terminal in the `cissp-quest` project directory
2. Run `claude` to start Claude Code CLI
3. Paste the entire contents of the code block below
4. Walk away — it runs autonomously

---

````text
You are running an overnight autonomous content extraction and generation pipeline for the CISSP Quest project. You will execute 8 phases sequentially, writing all output to files. Do not ask questions. Do not pause for confirmation. If you encounter an error reading a file, skip it and note it in the progress log. Process everything and write results to disk.

## ═══════════════════════════════════════════════════════════════
## CONTENT SOURCING FIREWALL — THIS IS NON-NEGOTIABLE
## ═══════════════════════════════════════════════════════════════

The transcripts in source-material/transcripts/ are from a paid third-party CISSP training course. They are reference material ONLY. The transcripts tell us WHAT CISSP topics and concepts need to be covered and to WHAT DEPTH. They must NEVER be the source of our content.

**The ONLY thing you extract from transcripts is a topic inventory**: what CISSP concepts, frameworks, standards, formulas, acronyms, and domain mappings are discussed. You then use that inventory as a checklist to generate 100% original content from first principles, referencing only:
- The official ISC2 CISSP exam outline (CBK)
- NIST publications, RFCs, ISO standards, and other public-domain authoritative sources
- General cybersecurity domain knowledge

**You must NEVER:**
- Copy, paraphrase, or closely adapt the instructor's explanations, phrasing, or sentence structure
- Reproduce the instructor's examples, scenarios, or real-world stories
- Reproduce the instructor's analogies or teaching metaphors
- Use the instructor's unique mnemonics, memory tricks, or study tips
- Reference the course, the instructor, the platform, or any lesson structure
- Generate content where a reader familiar with the course would recognize the source

**You MUST:**
- Treat transcripts as a "table of contents" — extract WHAT topics are covered, not HOW they are taught
- Generate all explanations, examples, analogies, memory hacks, and exam tips from scratch using authoritative public-domain sources
- When generating analogies and memory hacks, invent entirely new ones that fit CISSP Quest's visual novel / Operation Shadow Protocol spy thriller theme
- When a transcript mentions a formula (like ALE = SLE x ARO), verify it against public ISC2/NIST sources before including — formulas are public domain facts, not course IP
- When a transcript mentions a standard or framework (like TOGAF, SABSA), generate content from independent knowledge of that standard, not from the instructor's description

**The litmus test:** If the course creator read our output, would they recognize ANY of their original teaching? The answer must be NO. They should only recognize the same public-domain CISSP body of knowledge that every CISSP resource covers.

## ═══════════════════════════════════════════════════════════════
## STEP 0 — READ PROJECT SCHEMAS (do this FIRST)
## ═══════════════════════════════════════════════════════════════

Before processing any transcripts, read these files to load the exact formats into context:

1. Read `CLAUDE.md` — project rules, design theme, domain definitions, XP system
2. Read `src/lib/types.ts` — TypeScript interfaces (Question, LibraryTopic, GlossaryTerm, ChapterData, etc.)
3. Read `src/lib/story-types.ts` — all 8 story node types (DialogueNode, EvidenceNode, KnowledgeCheckNode, TimedDecisionNode, ThinkLikeManagerNode, VisualAidNode, TransitionNode, InteractiveImageNode), ActDefinition, DomainChapterDefinition
4. Read `src/lib/constants.ts` — DOMAINS array (8 domains with names, weights, locations, emojis), CHAPTERS array, XP_VALUES, ACHIEVEMENTS
5. Read `supabase-cat-engine-migration.sql` — cat_questions table schema (columns: domain_id, topic_cluster, question_text, options JSONB, correct_index, explanation, mnemonic_hint, library_topic_id, irt_a, irt_b, irt_c, cognitive_level, question_type, difficulty_rating, source, etc.)
6. Read `supabase-story-mode-migration.sql` — scene_definitions, concept_analogies, concept_mastery tables
7. Read `src/data/story-content.ts` (first 250 lines) — Chapter 1 as the gold standard for story format
8. Read `src/data/domain1-sample-questions.ts` (first 100 lines) — question format with createManualQuestion()
9. Read `src/data/glossary.ts` (first 100 lines) — GlossaryTerm interface and example entries
10. Read `source-material/questions/domain1-questions.sql` (first 80 lines) — SQL INSERT format for cat_questions
11. Read `source-material/knowledge-base/complete-content-map.md` — existing topic coverage and gap assignments
12. Read `source-material/knowledge-base/gap-analysis.md` — known content gaps by domain and priority

After reading all schema files, proceed to Phase 1.

## ═══════════════════════════════════════════════════════════════
## PROGRESS TRACKING
## ═══════════════════════════════════════════════════════════════

After completing each phase, update source-material/transcripts/progress.json:

```json
{
  "pipeline_version": "1.0",
  "started_at": "<ISO timestamp>",
  "phases": {
    "phase_1_topic_inventory": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_2_gap_analysis": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_3_questions": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_4_story": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_5_glossary": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_6_library": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_7_verification": { "status": "pending", "completed_at": null, "notes": "" },
    "phase_8_report": { "status": "pending", "completed_at": null, "notes": "" }
  },
  "last_updated": "<ISO timestamp>"
}
```

Write this file immediately at startup with all phases "pending", then update each phase to "complete" with timestamp and notes as you finish it.

## ═══════════════════════════════════════════════════════════════
## PHASE 1 — TOPIC INVENTORY
## ═══════════════════════════════════════════════════════════════

**Goal:** Read all transcripts and extract ONLY a structured inventory of WHAT topics are covered.

**Step 1a:** Read all whisper JSON files in source-material/transcripts/whisper-*.json (these have the best metadata with domain, subdomain, title fields). For each file, extract:
- The lesson ID (from the "id" field)
- The title
- The domain and subdomain from the metadata
- A list of concept names, framework names, standard names, formula references, and acronyms mentioned in the transcript text
- Do NOT extract explanations, examples, analogies, or teaching approaches

**Step 1b:** Read all lesson JSON files in source-material/transcripts/lesson-*.json. For each file, extract the same inventory data. These have less structured metadata, so infer the domain from the pageText field or transcript content.

**Step 1c:** Cross-reference extracted topics against source-material/knowledge-base/complete-content-map.md to flag which topics already exist in our knowledge base vs. which are new gaps.

**Step 1d:** Write the structured topic inventory to source-material/transcripts/topic-inventory.json using this exact format:

```json
{
  "generated_at": "<ISO timestamp>",
  "total_lessons_processed": 0,
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
          "acronyms": ["TOGAF", "SABSA"],
          "standards_referenced": ["TOGAF 9.2"]
        }
      ]
    },
    "2": { "name": "Asset Security", "topics": [] },
    "3": { "name": "Security Architecture and Engineering", "topics": [] },
    "4": { "name": "Communication and Network Security", "topics": [] },
    "5": { "name": "Identity and Access Management", "topics": [] },
    "6": { "name": "Security Assessment and Testing", "topics": [] },
    "7": { "name": "Security Operations", "topics": [] },
    "8": { "name": "Software Development Security", "topics": [] }
  },
  "summary": {
    "total_topics": 0,
    "total_already_covered": 0,
    "gaps_found": 0,
    "by_domain": {
      "1": { "total": 0, "existing": 0, "gaps": 0 },
      "2": { "total": 0, "existing": 0, "gaps": 0 },
      "3": { "total": 0, "existing": 0, "gaps": 0 },
      "4": { "total": 0, "existing": 0, "gaps": 0 },
      "5": { "total": 0, "existing": 0, "gaps": 0 },
      "6": { "total": 0, "existing": 0, "gaps": 0 },
      "7": { "total": 0, "existing": 0, "gaps": 0 },
      "8": { "total": 0, "existing": 0, "gaps": 0 }
    }
  }
}
```

Update progress.json, then proceed to Phase 2.

## ═══════════════════════════════════════════════════════════════
## PHASE 2 — GAP ANALYSIS REPORT
## ═══════════════════════════════════════════════════════════════

**Goal:** Cross-reference the topic inventory against existing content and ISC2 exam outline to identify what's missing.

**Step 2a:** Read the topic inventory from Phase 1 (source-material/transcripts/topic-inventory.json).

**Step 2b:** Cross-reference against:
- source-material/knowledge-base/gap-analysis.md (existing gap analysis)
- source-material/knowledge-base/complete-content-map.md (existing content map)
- The ISC2 CISSP exam outline domains (use your knowledge of the current CBK)

**Step 2c:** Write source-material/transcripts/gap-report.md with these sections:

### Section 1: Topics in Transcripts NOT in Our Knowledge Base
List each gap topic with domain, subdomain, priority (HIGH/MEDIUM/LOW based on exam frequency), and which transcript lesson(s) cover it.

### Section 2: ISC2 Exam Outline Blind Spots
Topics in the ISC2 CBK that appear in NEITHER the transcripts NOR our existing knowledge base. These are coverage holes.

### Section 3: Depth Gaps
Topics where transcripts indicate deeper coverage is needed than what we currently have (e.g., we cover symmetric crypto basics but not DES/3DES/AES specifics).

### Section 4: Priority Matrix
A table ranking all gap topics by: exam weight x gap severity x domain coverage percentage. This drives generation priorities in Phases 3–6.

Update progress.json, then proceed to Phase 3.

## ═══════════════════════════════════════════════════════════════
## PHASE 3 — GENERATE NEW QUESTIONS
## ═══════════════════════════════════════════════════════════════

**Goal:** Generate 20–30 new questions per domain (160–240 total) covering gap topics, in SQL format matching the cat_questions schema exactly.

**Content Sourcing Firewall reminder:** Every question stem, every option, every explanation, every mnemonic must be written from scratch using ISC2 CBK knowledge and public-domain sources. Do NOT paraphrase anything from the transcripts.

**Format:** SQL INSERT statements matching this exact structure (from supabase-cat-engine-migration.sql):

```sql
INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  <domain_id 1-8>,
  '<topic_cluster snake_case>',
  '<question_text — scenario-based, BEST/MOST/FIRST stems>',
  '["Option A text", "Option B text", "Option C text", "Option D text"]'::jsonb,
  <correct_index 0-3>,
  '<explanation — WHY correct is right AND why best distractor is wrong>',
  '<mnemonic_hint — original memory aid fitting spy/cybersecurity theme>',
  '<cognitive_level: remember|understand|apply|analyze>',
  '<question_type: scenario|best_answer|most_likely|first_action|except_not|comparison|calculation|tlatm|definition>',
  '<difficulty_rating: easy|medium|hard|very_hard>',
  <irt_a 0.5-2.5>, <irt_b -3.0 to 3.0>, <irt_c 0.20-0.25>,
  'ai_generated', true
);
```

**IRT parameter guidelines (from existing questions):**
- easy: irt_b base ≈ -1.5, irt_a ≈ 0.8-1.0
- medium: irt_b base ≈ 0.0, irt_a ≈ 1.0-1.5
- hard: irt_b base ≈ 1.5, irt_a ≈ 1.5-2.0
- very_hard: irt_b base ≈ 2.5, irt_a ≈ 2.0-2.5
- irt_c: 0.20 for standard, 0.22 for comparison, 0.25 for except_not
- Adjust irt_b by cognitive_level: remember -0.5, understand +0.0, apply +0.3, analyze +0.5

**Distribution targets per domain (20–30 questions):**
- Difficulty: ~20% easy, ~45% medium, ~25% hard, ~10% very_hard
- Cognitive: ~10% remember, ~20% understand, ~45% apply, ~25% analyze
- Question type: ~35% scenario, ~15% best_answer, ~15% first_action, ~10% tlatm, ~10% comparison, ~5% calculation, ~5% except_not, ~5% most_likely
- Correct answer position: balanced across 0, 1, 2, 3

**Quality rules:**
- "Think Like a Manager" framing: governance/process answers over unilateral technical action
- All 4 options must be plausible to a partially-informed candidate
- Explanations must reference public standards (NIST, ISO, RFC) where applicable
- Mnemonic hints should fit the Operation Shadow Protocol spy theme
- Each question must be mapped to a specific topic_cluster from the Phase 1 inventory

**Output files:** Write one SQL file per domain:
- source-material/transcripts/generated-questions/domain1-transcript-questions.sql
- source-material/transcripts/generated-questions/domain2-transcript-questions.sql
- ... through domain8-transcript-questions.sql

Create the generated-questions directory if it doesn't exist.

Each file should start with a header comment showing distribution stats (same format as existing domain1-questions.sql).

Update progress.json, then proceed to Phase 4.

## ═══════════════════════════════════════════════════════════════
## PHASE 4 — GENERATE STORY CONTENT
## ═══════════════════════════════════════════════════════════════

**Goal:** Generate story scene content for chapters 2–8 using the exact node types from story-types.ts, set within Operation Shadow Protocol's narrative.

**Content Sourcing Firewall reminder:** ALL scenarios, dialogue, analogies, and teaching moments must be original. Invent new analogies that fit the spy/cybersecurity thriller theme. Do NOT adapt anything from the course instructor.

**Story structure (from story-types.ts):**
Each chapter is a DomainChapterDefinition with up to 5 acts. Each act is an ActDefinition containing an array of StorySceneNode objects. The 8 node types are:

1. **DialogueNode** — NPC conversations with optional player choices
2. **EvidenceNode** — Classified documents/briefings with evidence items
3. **KnowledgeCheckNode** — Quiz questions embedded in the story (question, 4 options, correctIndex, explanation, memoryHack)
4. **TimedDecisionNode** — Time-pressure scenarios (30s default) with optimal/suboptimal options
5. **ThinkLikeManagerNode** — Governance-focused decision scenarios with managerInsight
6. **VisualAidNode** — Tables, diagrams, lists, comparisons
7. **TransitionNode** — Location/scene transitions
8. **InteractiveImageNode** — Hotspot-based exploration scenes

**NPCs (from story-content.ts):**
- Director Reeves — CEO, governance/risk/compliance (accentColor: '#2d1a3a')
- Janet Park — SOC Lead, technical/crypto/architecture (accentColor: '#1e3a5f')
- Kai Tanaka — Forensics, real-world analogies/analysis (accentColor: '#1a3a1a')
- Agent Morales — FBI, IAM/operations/physical security (accentColor: '#3a1a1a')

**Chapter locations (from constants.ts):**
- Ch2/D2: Data Vault, New Jersey
- Ch3/D3: Server Farm, Zurich
- Ch4/D4: Cable Station, Singapore
- Ch5/D5: Office, London
- Ch6/D6: Forensics Lab, Tel Aviv
- Ch7/D7: SOC War Room, New York
- Ch8/D8: Dev Lab, Austin

**For each chapter, generate Acts 1 and 2 (teaching acts) with:**
- 3–5 DialogueNodes for arrival/scene-setting
- 2–3 EvidenceNodes with classified briefings on domain concepts
- 3–4 KnowledgeCheckNodes testing key concepts
- 1–2 TimedDecisionNodes for engagement
- 1–2 ThinkLikeManagerNodes for governance perspective
- 1–2 VisualAidNodes for comparison tables or process flows
- TransitionNodes between sections
- conceptsCovered array listing concepts taught in each act

**TypeScript format (matching story-content.ts pattern):**

```typescript
import { DomainChapterDefinition } from '@/lib/story-types';

export const chapter2: DomainChapterDefinition = {
  domainId: 2,
  title: 'The Data Vault',
  location: 'Data Vault, New Jersey',
  locationGradient: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 100%)',
  acts: [
    {
      actNumber: 1,
      title: 'The Briefing',
      description: 'Discover the data classification failure that enabled the breach.',
      xpReward: 150,
      conceptsCovered: ['Data Classification', 'Data Ownership Roles', 'Data States'],
      estimatedMinutes: 20,
      nodes: [
        // DialogueNode, EvidenceNode, KnowledgeCheckNode, etc.
      ]
    },
    {
      actNumber: 2,
      title: 'The Investigation',
      description: 'Deep dive into data protection mechanisms.',
      xpReward: 200,
      conceptsCovered: ['DLP', 'Pseudonymization', 'Tokenization'],
      estimatedMinutes: 25,
      nodes: []
    },
    null, // Act 3 = Field Test (quiz, generated elsewhere)
    null, // Act 4 = future advanced content
    null, // Act 5 = Boss Battle (quiz, generated elsewhere)
  ]
};
```

**Output files:**
- source-material/transcripts/generated-story/chapter2-story-draft.ts
- source-material/transcripts/generated-story/chapter3-story-draft.ts
- ... through chapter8-story-draft.ts

Create the generated-story directory if it doesn't exist.

**Quality bar:** Read src/data/story-content.ts chapter 1 as the gold standard. Match that quality of dialogue, pacing, and educational integration. Every teaching moment should feel like it emerges naturally from the investigation narrative, not like a textbook lecture.

Update progress.json, then proceed to Phase 5.

## ═══════════════════════════════════════════════════════════════
## PHASE 5 — EXPAND GLOSSARY
## ═══════════════════════════════════════════════════════════════

**Goal:** Generate new GlossaryTerm entries for concepts found in transcripts but missing from the existing glossary.

**Content Sourcing Firewall reminder:** ALL definitions, exam tips, and memory hacks must be written from scratch. Do NOT paraphrase the instructor's definitions.

**Step 5a:** Read src/data/glossary.ts to get the full list of existing terms.

**Step 5b:** Compare against the Phase 1 topic inventory's acronyms and concept names.

**Step 5c:** For every concept in the inventory that does NOT have a glossary entry, generate a new one.

**Format (matching glossary.ts exactly):**

```typescript
export const NEW_GLOSSARY_TERMS: GlossaryTerm[] = [
  {
    term: 'TOGAF',
    domain_id: 3,
    definition: 'The Open Group Architecture Framework — a methodology for designing, planning, implementing, and governing enterprise IT architecture. Think of it as the master blueprint system that ensures every part of a large organization\'s technology works together toward business goals.',
    exam_tip: 'TOGAF is one of three enterprise security architecture frameworks tested (alongside Zachman and SABSA). TOGAF focuses on the full architecture development cycle; Zachman focuses on categorization; SABSA focuses on risk-driven security.',
    memory_hack: 'TOGAF = "The Overall Game plan for Architecture Frameworks" — it\'s the big-picture playbook.',
    related_topic_id: null,
  },
  // ... more terms
];
```

**Quality rules:**
- Definitions must include a grounding analogy (like "Think of it as...")
- Exam tips must identify what the exam is likely to test about this term
- Memory hacks must be original and memorable — mnemonics, acronym expansions, or visual anchors
- Each term maps to the correct domain_id (1–8)

**Output file:** source-material/transcripts/generated-glossary/new-terms.ts

Create the generated-glossary directory if it doesn't exist.

Update progress.json, then proceed to Phase 6.

## ═══════════════════════════════════════════════════════════════
## PHASE 6 — GENERATE LIBRARY TOPICS
## ═══════════════════════════════════════════════════════════════

**Goal:** Generate full library_topics entries for gap topics identified in Phase 2.

**Content Sourcing Firewall reminder:** ALL content must be written from first principles using ISC2 CBK, NIST, ISO, and public-domain sources. Cite standards where relevant.

**Format:** SQL INSERT statements matching the library_topics table from supabase-migration.sql:

```sql
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  <domain_id 1-8>,
  '<topic_number e.g. "3.6.1">',
  '<title>',
  '<one_liner — one sentence summary>',
  '<content_markdown — 3-5 paragraphs with real depth, citing NIST/ISO/RFC where applicable>',
  '<key_formulas JSONB — [{"formula":"ALE = SLE × ARO","description":"Annualized Loss Expectancy"}] or NULL>',
  '<comparison_table JSONB — {"headers":["Feature","Type A","Type B"],"rows":[["Speed","Fast","Slow"]]} or NULL>',
  '<exam_tips — what the exam tests about this topic>',
  '<think_like_manager — governance perspective on this topic>',
  '<memory_hack — original mnemonic or memory technique>',
  '<memory_anchor — tied to the story location for that domain e.g. "The encryption vault in the Zurich server farm">'
);
```

**Content quality for content_markdown:**
- 3–5 paragraphs minimum per topic
- Start with a clear definition and why this matters
- Include how it works at a practical level
- Cover common exam scenarios and traps
- Reference public standards: "Per NIST SP 800-xxx..." or "ISO 27001 defines..."
- Include comparison tables where concepts have confusable alternatives
- End with the "Think Like a Manager" perspective

**Memory anchors:** Each domain has a story location. Memory anchors tie the concept to that location using Method of Loci:
- D1: Nexus HQ, New York
- D2: Data Vault, New Jersey
- D3: Server Farm, Zurich
- D4: Cable Station, Singapore
- D5: Office, London
- D6: Forensics Lab, Tel Aviv
- D7: SOC War Room, New York
- D8: Dev Lab, Austin

**Output files:** One SQL file per domain:
- source-material/transcripts/generated-library/domain1-new-topics.sql
- source-material/transcripts/generated-library/domain2-new-topics.sql
- ... through domain8-new-topics.sql

Create the generated-library directory if it doesn't exist.

Update progress.json, then proceed to Phase 7.

## ═══════════════════════════════════════════════════════════════
## PHASE 7 — COVERAGE VERIFICATION AUDIT
## ═══════════════════════════════════════════════════════════════

This is the critical accountability phase. Every concept from the Phase 1 inventory must appear in at least one content output. Nothing falls through the cracks.

**Step 7a — Build the traceability matrix:**

Re-read source-material/transcripts/topic-inventory.json (Phase 1 output).

For EVERY topic/concept in the inventory, check whether it appears in at least one of:
- An existing knowledge-base file (source-material/knowledge-base/domain*-knowledge.md)
- An existing glossary term (src/data/glossary.ts)
- An existing question (source-material/questions/domain*-questions.sql)
- A newly generated question (Phase 3 output files)
- A newly generated story chapter (Phase 4 output files)
- A newly generated glossary term (Phase 5 output file)
- A newly generated library topic (Phase 6 output files)

Write source-material/transcripts/coverage-matrix.json:

```json
{
  "generated_at": "<ISO timestamp>",
  "total_concepts_inventoried": 0,
  "total_covered": 0,
  "total_uncovered": 0,
  "coverage_percentage": 0.0,
  "by_domain": {
    "1": { "name": "Security and Risk Management", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "2": { "name": "Asset Security", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "3": { "name": "Security Architecture and Engineering", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "4": { "name": "Communication and Network Security", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "5": { "name": "Identity and Access Management", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "6": { "name": "Security Assessment and Testing", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "7": { "name": "Security Operations", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 },
    "8": { "name": "Software Development Security", "total": 0, "covered": 0, "uncovered": 0, "coverage_pct": 0.0 }
  },
  "concepts": [
    {
      "concept": "<concept name>",
      "domain": 1,
      "isc2_subdomain": "1.1",
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
    }
  ]
}
```

**Step 7b — Fill remaining gaps:**

For any concept where `covered` is `false`, generate the missing content NOW:
- At minimum: one glossary term + one quiz question + one library topic
- Write additional questions to source-material/transcripts/generated-questions/gap-fill-questions.sql
- Write additional glossary terms to source-material/transcripts/generated-glossary/gap-fill-terms.ts
- Write additional library topics to source-material/transcripts/generated-library/gap-fill-topics.sql

Then re-check and update coverage-matrix.json to reflect the gap fills.

**Target: 100% coverage.** Every inventoried concept appears in at least one content type.

**Step 7c — Cross-reference verification:**

For each domain, verify:
- Every new question's topic_cluster maps to a real concept in the inventory
- Every new glossary term maps to a concept in the inventory
- Every new library topic covers a concept flagged as a gap in Phase 2
- Every story chapter's conceptsCovered array references real concepts from the inventory

Flag any orphaned content (generated content that doesn't trace back to an inventoried concept).

Write discrepancies to source-material/transcripts/verification-issues.json:

```json
{
  "generated_at": "<ISO timestamp>",
  "orphaned_questions": [],
  "orphaned_glossary_terms": [],
  "orphaned_library_topics": [],
  "story_concept_mismatches": [],
  "total_issues": 0
}
```

Update progress.json, then proceed to Phase 8.

## ═══════════════════════════════════════════════════════════════
## PHASE 8 — FINAL REPORT
## ═══════════════════════════════════════════════════════════════

Write source-material/transcripts/EXTRACTION_REPORT.md with these sections:

### Section 1: Execution Summary
- Total lessons processed, total unique topics inventoried
- Per-domain breakdown: topics found, gaps identified, questions generated, story scenes written, glossary terms added, library topics created
- Total execution phases completed, any phases that were interrupted

### Section 2: Coverage Dashboard
- Overall coverage percentage (target: 100%)
- Per-domain coverage percentage table
- List of any concepts that remain uncovered after gap-filling (with explanation of why)
- Breakdown: which content types have the best coverage vs. thinnest

### Section 3: Content Inventory
| Category | Domain 1 | Domain 2 | Domain 3 | Domain 4 | Domain 5 | Domain 6 | Domain 7 | Domain 8 | Total |
|----------|----------|----------|----------|----------|----------|----------|----------|----------|-------|
| New questions | | | | | | | | | |
| New glossary terms | | | | | | | | | |
| New library topics | | | | | | | | | |
| New story scenes | | | | | | | | | |

Include breakdown by difficulty, cognitive level, and question type for questions.

### Section 4: Quality Flags
- Concepts with thin coverage (only 1 content type touches it)
- Domains with disproportionately low question counts
- Story chapters missing key concepts for their domain
- Orphaned content that doesn't map to the inventory

### Section 5: IP Compliance Checklist
- [ ] No generated content is derived from course-specific teaching approaches
- [ ] All analogies and memory hacks are original to CISSP Quest
- [ ] All explanations reference public-domain sources only
- [ ] No instructor examples, scenarios, or stories were reproduced
- [ ] No course structure or platform references appear in output

### Section 6: Recommended Next Steps
- Priority actions for content review
- Concepts that need human review for accuracy
- Story chapters that need narrative polish
- Suggested areas for additional question generation beyond transcript coverage

Update progress.json to mark Phase 8 complete.

## ═══════════════════════════════════════════════════════════════
## EXECUTION RULES
## ═══════════════════════════════════════════════════════════════

1. **Autonomous execution:** No questions, no confirmations, no pauses. Process and write files.
2. **File-first:** Write every output to a file. Do not dump large content into the terminal.
3. **Idempotent:** If interrupted and restarted, check progress.json to see where you stopped. Resume from the last incomplete phase.
4. **Quality over speed:** 150 excellent questions > 300 mediocre ones. Every question must have plausible distractors and substantive explanations.
5. **Domain accuracy:** Every piece of content must map to the correct CISSP domain. Cross-reference against DOMAINS in constants.ts.
6. **Format compliance:** Every output must match the exact schema/type/format. A question missing IRT parameters is useless. A story node with wrong types won't compile.
7. **Source attribution:** Reference public-domain authoritative sources (ISC2, NIST SP 800-series, ISO 27xxx, RFCs) where applicable. NEVER reference the course or instructor.
8. **The IP firewall is absolute.** If in doubt about whether something is too close to the source material, write it fresh from public-domain knowledge.

Now begin. Read the schema files (Step 0), write progress.json, then execute Phase 1.
````

---

*This prompt was generated by studying the full CISSP Quest project schemas, existing content, transcript formats, and gap analysis. All output formats match the exact TypeScript interfaces, SQL schemas, and JSON structures used in the project.*
