INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'secure_sdlc',
  'A company is deploying a new feature to its production web application. Instead of releasing to all users simultaneously, they route 5% of traffic to the new version while 95% continues using the current version. They monitor error rates and performance metrics before gradually increasing the percentage. What deployment strategy is this?',
  '["Blue-green deployment, where two identical environments swap between active and standby", "Canary deployment, where changes are released to a small subset of users before full rollout", "Rolling deployment, where servers are updated one at a time in sequence", "Big-bang deployment, where all servers are updated simultaneously during a maintenance window"]'::jsonb,
  1,
  'Canary deployment releases changes to a small subset of users (like the canary in the coal mine) to detect problems before full rollout. If the canary group experiences issues, the deployment can be rolled back with minimal user impact. This is a risk-reduction strategy that catches production issues early without exposing the entire user base.',
  'CANARY deployment = like the canary in the coal mine. Send a small group first to check for danger before everyone follows.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  8,
  'database_security',
  'A database design team is restructuring tables to eliminate redundant data. They ensure that each non-key column depends on the entire primary key rather than just part of it. This process is MOST LIKELY which normal form?',
  '["First Normal Form (1NF), which eliminates repeating groups and ensures atomic values", "Third Normal Form (3NF), which eliminates transitive dependencies between non-key columns", "Second Normal Form (2NF), which eliminates partial dependencies on composite primary keys", "Denormalization, which intentionally adds redundancy to improve query performance"]'::jsonb,
  2,
  'Second Normal Form (2NF) requires that all non-key columns depend on the entire primary key, not just part of it. This eliminates partial dependencies that exist when a table has a composite primary key. 1NF eliminates repeating groups. 3NF eliminates transitive dependencies (non-key columns depending on other non-key columns).',
  'Normalization progression: 1NF = no repeating groups, 2NF = no partial dependencies, 3NF = no transitive dependencies.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  8,
  'advanced_testing',
  'A project manager uses PERT estimation for a software development task. The optimistic estimate is 4 weeks, the most likely estimate is 7 weeks, and the pessimistic estimate is 16 weeks. What is the expected completion time?',
  '["7 weeks", "9 weeks", "10 weeks", "8 weeks"]'::jsonb,
  3,
  'The PERT formula for expected time is: (Optimistic + 4 x Most Likely + Pessimistic) / 6. Calculation: (4 + 4(7) + 16) / 6 = (4 + 28 + 16) / 6 = 48 / 6 = 8 weeks. PERT gives extra weight to the most likely estimate (multiplied by 4) to account for the fact that most tasks complete near the most likely duration.',
  'PERT = (O + 4M + P) / 6. The Most Likely gets 4x weight because reality usually lands near the middle estimate.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),
(
  8,
  'maturity_models',
  'How does CMMI differ from SW-CMM in its level structure?',
  '["CMMI has six levels starting at Level 0 (Incomplete) while SW-CMM has five levels starting at Level 1 (Initial)", "CMMI and SW-CMM both have exactly five levels with identical level names", "SW-CMM has more levels than CMMI and covers a broader range of organizational processes", "CMMI eliminates the concept of maturity levels entirely in favor of continuous assessment"]'::jsonb,
  0,
  'CMMI (Capability Maturity Model Integration) has six levels (0-5), starting at Level 0 (Incomplete). SW-CMM has five levels (1-5), starting at Level 1 (Initial). Additionally, some level names differ — SW-CMM Level 4 is "Managed" while CMMI Level 4 is "Quantitatively Managed." This naming difference is a common exam trap.',
  'SW-CMM = 5 levels (1-5). CMMI = 6 levels (0-5). CMMI added Level 0 = Incomplete (nothing happening).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  8,
  'toctou_race_conditions',
  'A file-sharing application checks whether a user has permission to access a file, then opens the file for reading. A security researcher discovers that between the permission check and the file open, an attacker can replace the checked file with a symbolic link to a sensitive system file. What is the PRIMARY vulnerability class?',
  '["Privilege escalation through improper access control list configuration", "TOCTOU race condition, where the resource changes between the security check and its use", "Buffer overflow through manipulation of file path string length", "Directory traversal through specially crafted path characters"]'::jsonb,
  1,
  'This is a TOCTOU (Time-of-Check to Time-of-Use) race condition. The application checks the file at time T1, but by the time it opens the file at T2, the attacker has swapped it with a symlink to a different file. The check was valid at T1 but the resource has changed by T2. Mitigations include atomic operations, file descriptor passing, and eliminating the check-then-use pattern.',
  'TOCTOU = the Target changes between the Time you CHECK and the Time you USE. The gap is the danger zone.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;