INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'toctou_race_conditions',
  'A banking application uses a two-step process for high-value wire transfers: Step 1 validates the sender''s account balance and compliance checks against sanctions lists, Step 2 executes the transfer. A sophisticated attacker discovers that by submitting two nearly simultaneous transfer requests from the same account, both pass validation in Step 1 (since neither has yet executed), and both execute in Step 2. The total transferred exceeds the available balance. The development team proposes three fixes: (A) adding a delay between Steps 1 and 2, (B) implementing pessimistic database locking on the account record during the entire transaction, and (C) adding a post-transfer balance check. Which fix MOST effectively addresses the root cause?',
  '["Fix A, because adding a delay makes it harder for simultaneous requests to overlap", "Fix C, because a post-transfer check catches the problem after it occurs", "Fix B, because pessimistic locking prevents concurrent access to the same account record during the transaction", "A combination of all three fixes is required because no single fix can address race conditions"]'::jsonb,
  2,
  'Fix B (pessimistic locking) addresses the root cause by preventing concurrent access to the account record. When the first transaction locks the record, the second must wait until the first completes, preventing the TOCTOU race condition. Fix A (delay) does not prevent the race, only makes timing harder. Fix C (post-check) is detective, not preventive. Locking eliminates the fundamental concurrency issue.',
  'TOCTOU fix = eliminate the GAP. Pessimistic LOCKING holds the resource exclusively throughout the transaction. No gap, no race.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'secure_sdlc',
  'As the newly appointed CISO of a global technology company with 500 developers across 12 countries, you discover that each regional development center uses different security practices, tools, and standards. Some centers have mature DevSecOps pipelines while others have no security testing at all. The CEO wants a unified approach within 12 months. How should you proceed?',
  '["Immediately mandate that all centers adopt the practices of the most mature center and set a 90-day compliance deadline", "Outsource all application security testing to a single global vendor to standardize practices", "Postpone standardization and let each center continue with their current approach since they understand their local requirements", "Assess each center''s current maturity using a framework like OWASP SAMM, define a minimum baseline standard, and create phased improvement plans tailored to each center''s starting point"]'::jsonb,
  3,
  'A mature manager recognizes that forcing immediate standardization on diverse teams will fail. The correct approach is: assess current state (using SAMM or similar), define a realistic minimum baseline, and create phased roadmaps that account for each center''s maturity level. This balances standardization with pragmatism and gives teams achievable intermediate goals.',
  NULL,
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'database_security',
  'A classified government database implements content-dependent access control, polyinstantiation, and database views. An analyst with SECRET clearance notices that querying employee records for a specific department consistently returns exactly 50 results. However, when querying a closely related department, the count fluctuates between 48 and 52 depending on the day. The analyst hypothesizes that the fluctuation indicates personnel temporarily assigned to a classified compartment within that department. What type of attack is the analyst performing, and which ADDITIONAL control would be MOST effective?',
  '["An inference attack based on pattern analysis of query result counts; cell suppression or noise/perturbation would mask the fluctuations", "An aggregation attack combining query results; encryption of the database would prevent access to raw data", "A SQL injection attack manipulating query parameters; input validation would prevent malicious queries", "A covert channel attack using timing variations; normalizing query response times would eliminate the channel"]'::jsonb,
  0,
  'The analyst is performing an inference attack by analyzing patterns in legitimate query results to deduce information about classified operations. The fluctuation in count reveals personnel movement patterns. Cell suppression (hiding specific values) or noise/perturbation (adding random variation to results) would mask these patterns. Polyinstantiation alone was insufficient because the count variation leaked information.',
  'Inference through PATTERNS in permitted data. Fix: add NOISE or SUPPRESS cells to break the pattern the analyst is exploiting.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'shift_left',
  'A pharmaceutical company''s software controls drug manufacturing equipment. A regulatory audit reveals that the software has never undergone formal security certification, threat modeling was not performed, and the development team used a combination of Agile sprints and ad-hoc testing without security gates. The software is already in production and cannot be taken offline. The auditor requires a remediation plan. What should the security team prioritize FIRST?',
  '["Begin rewriting the software from scratch using a formal waterfall methodology with security at each phase", "Conduct a comprehensive threat model of the existing system to identify and prioritize the most critical security risks", "Implement a web application firewall to protect the running software while conducting a full security review", "Perform automated DAST scanning against the production system to generate a list of known vulnerabilities"]'::jsonb,
  1,
  'For a system already in production that cannot go offline, the first priority is understanding the risk landscape through threat modeling. This identifies the most critical threats and allows intelligent prioritization of limited remediation resources. DAST scanning finds technical vulnerabilities but not architectural flaws. Rewriting is impractical. A WAF is defense-in-depth but does not address the root issues.',
  'Production system, cannot go offline = first UNDERSTAND the risks (threat model), then PRIORITIZE fixes. You cannot fix what you do not understand.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'advanced_testing',
  'A software testing team has a program with 20 decision branches. They have executed test cases that cover 14 of these branches. Additionally, the program has 120 total executable paths, of which 36 have been tested. What are the branch coverage and path coverage percentages?',
  '["Branch: 80%, Path: 25%", "Branch: 60%, Path: 40%", "Branch: 70%, Path: 30%", "Branch: 75%, Path: 35%"]'::jsonb,
  2,
  'Branch coverage = (Executed branches / Total branches) x 100 = (14 / 20) x 100 = 70%. Path coverage = (Executed paths / Total paths) x 100 = (36 / 120) x 100 = 30%. Branch coverage measures decision point coverage while path coverage measures the percentage of all possible execution paths tested. Path coverage is always harder to achieve than branch coverage.',
  'Branch Coverage = executed branches / total branches. Path Coverage = executed paths / total paths. Path coverage is always lower and harder to achieve.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;