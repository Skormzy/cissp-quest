-- =====================================================================
-- CISSP Quest — Master Question Seed File
-- =====================================================================
-- Total: 880 questions
--   Domain 1-8: 100 each = 800
--   Final Boss (cross-domain): 50
--   TLATM Gauntlet: 30
--
-- Run AFTER supabase-cat-engine-migration.sql
--
-- USAGE:
--   With psql (supports \i includes):
--     psql -U postgres -d your_db -f seed-all-questions.sql
--
--   With Supabase SQL Editor (no \i support):
--     Run each domain file individually in order, or concatenate:
--     cat domain{1..8}-questions.sql final-boss-questions.sql tlatm-gauntlet-questions.sql > combined.sql
-- =====================================================================

-- Clean out any previously seeded questions
DELETE FROM cat_questions WHERE source = 'ai_generated';
DELETE FROM cat_questions WHERE source = 'seed';

-- =====================================================================
-- Domain 1: Security and Risk Management (100 questions)
-- =====================================================================
\i domain1-questions.sql

-- =====================================================================
-- Domain 2: Asset Security (100 questions)
-- =====================================================================
\i domain2-questions.sql

-- =====================================================================
-- Domain 3: Security Architecture and Engineering (100 questions)
-- =====================================================================
\i domain3-questions.sql

-- =====================================================================
-- Domain 4: Communication and Network Security (100 questions)
-- =====================================================================
\i domain4-questions.sql

-- =====================================================================
-- Domain 5: Identity and Access Management (100 questions)
-- =====================================================================
\i domain5-questions.sql

-- =====================================================================
-- Domain 6: Security Assessment and Testing (100 questions)
-- =====================================================================
\i domain6-questions.sql

-- =====================================================================
-- Domain 7: Security Operations (100 questions)
-- =====================================================================
\i domain7-questions.sql

-- =====================================================================
-- Domain 8: Software Development Security (100 questions)
-- =====================================================================
\i domain8-questions.sql

-- =====================================================================
-- Final Boss: Cross-Domain Questions (50 questions)
-- =====================================================================
\i final-boss-questions.sql

-- =====================================================================
-- Think Like a Manager Gauntlet (30 questions)
-- =====================================================================
\i tlatm-gauntlet-questions.sql

-- =====================================================================
-- Verification Queries
-- =====================================================================

-- Count per domain
SELECT 'Questions per Domain' AS report;
SELECT domain_id, COUNT(*) AS count
FROM cat_questions
GROUP BY domain_id
ORDER BY domain_id;

-- Count per difficulty
SELECT 'Questions per Difficulty' AS report;
SELECT difficulty_rating, COUNT(*) AS count
FROM cat_questions
GROUP BY difficulty_rating
ORDER BY
  CASE difficulty_rating
    WHEN 'easy' THEN 1
    WHEN 'medium' THEN 2
    WHEN 'hard' THEN 3
    WHEN 'very_hard' THEN 4
  END;

-- Count per cognitive level
SELECT 'Questions per Cognitive Level' AS report;
SELECT cognitive_level, COUNT(*) AS count
FROM cat_questions
GROUP BY cognitive_level
ORDER BY
  CASE cognitive_level
    WHEN 'remember' THEN 1
    WHEN 'understand' THEN 2
    WHEN 'apply' THEN 3
    WHEN 'analyze' THEN 4
  END;

-- Count per question type
SELECT 'Questions per Type' AS report;
SELECT question_type, COUNT(*) AS count
FROM cat_questions
GROUP BY question_type
ORDER BY count DESC;

-- Total count
SELECT 'Total Questions' AS report, COUNT(*) AS count FROM cat_questions;
