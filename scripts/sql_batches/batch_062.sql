INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'development_methodologies',
  'An organization needs to build a system with well-defined, stable requirements that are unlikely to change. Which development methodology is MOST LIKELY appropriate?',
  '["Agile with two-week sprints", "Waterfall with its sequential phase-based approach", "Extreme Programming with pair programming", "Scrum with daily stand-up meetings"]'::jsonb,
  1,
  'The Waterfall model works best when requirements are well-defined, stable, and unlikely to change because it follows a linear, sequential process. Agile, XP, and Scrum are better suited for projects with evolving requirements where flexibility and iterative feedback are needed.',
  'Waterfall FALLS straight down — one direction, no turning back. Great when the path is clear.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),
(
  8,
  'change_management',
  'A developer has completed a bug fix and wants to deploy it to production. The organization follows a formal change management process. The fix has been approved by the Change Advisory Board and documented. What is the NEXT step before the code reaches production?',
  '["Submit a new change request for the next sprint", "Notify the end users about the upcoming change", "Perform acceptance testing during the release control phase", "Archive the previous version of the code"]'::jsonb,
  2,
  'In formal change management, after a change is approved through change control, it moves to release control. Release control is the phase where acceptance testing occurs to verify the change works correctly before deployment to production. This is a common exam point — acceptance testing happens at release control, not change control.',
  'Release Control = Release only after you TEST. Think: Release the code only after it passes its final exam.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),
(
  8,
  'owasp_top_10',
  'Which secure coding practice BEST prevents Cross-Site Scripting (XSS) attacks?',
  '["Encrypting all data at rest in the database", "Using parameterized queries for database calls", "Implementing multi-factor authentication for all users", "Applying output encoding to ensure scripts render as text rather than executable code"]'::jsonb,
  3,
  'Output encoding is the primary defense against XSS attacks. It converts special characters (like < > and quotes) into their HTML entity equivalents so they render visually as text rather than executing as scripts in the user''s browser. Parameterized queries prevent SQL injection, not XSS.',
  'XSS = eXit Strategy for Scripts. Encode the OUTPUT so scripts cannot escape as executable code.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),
(
  8,
  'secure_sdlc',
  'A security team is asked to integrate security into an existing software development process. What should they do FIRST?',
  '["Identify and document security requirements during the initiation and requirements phase", "Install a static analysis tool to scan existing code for vulnerabilities", "Conduct penetration testing on the current production application", "Implement a web application firewall to protect deployed applications"]'::jsonb,
  0,
  'Security integration into the SDLC begins at the earliest phase — initiation and requirements gathering. Security requirements must be defined before design and coding begin. While scanning, testing, and WAFs are valuable, they come later in the lifecycle. The principle of shifting left means starting security as early as possible.',
  'FIRST in SDLC = First phase = Requirements. Shift LEFT = start at the LEFT side of the timeline.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),
(
  8,
  'database_security',
  'What is the difference between cardinality and degree in a relational database?',
  '["Cardinality is the number of columns; degree is the number of rows", "Cardinality is the number of rows; degree is the number of columns", "Cardinality refers to primary keys; degree refers to foreign keys", "Cardinality measures data types; degree measures table relationships"]'::jsonb,
  1,
  'Cardinality refers to the number of rows (tuples) in a database table and changes frequently during normal operations. Degree refers to the number of columns (attributes) and changes infrequently, typically requiring administrator action. This is a commonly tested and commonly confused distinction.',
  'CARDinality = CARDs in the deck = individual ROWS. DEGREE = like a college degree has multiple COLUMNS of courses.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;