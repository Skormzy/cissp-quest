INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'secure_sdlc',
  'What is the PRIMARY difference between the SDLC and the System Life Cycle (SLC)?',
  '["The SDLC covers development phases while the SLC encompasses the full operational lifespan including maintenance and disposal", "The SDLC is used only for Agile projects while the SLC applies to Waterfall projects", "The SLC focuses on coding standards while the SDLC focuses on testing requirements", "The SDLC includes disposal but the SLC does not address end-of-life concerns"]'::jsonb,
  0,
  'The SDLC (Software Development Life Cycle) governs the phases of creating software from requirements through deployment. The SLC (System Life Cycle) is broader, encompassing not just development but also production operations, maintenance, and eventual retirement or disposal of the system.',
  'SDLC = Development only. SLC = the whole Life of the system, Cradle to grave.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),
(
  8,
  'database_security',
  'Which term BEST describes a single row in a relational database table?',
  '["Attribute", "Tuple", "Degree", "Schema"]'::jsonb,
  1,
  'In relational database terminology, a row is called a tuple (also called a record). An attribute is a column/field. Degree is the number of columns, and a schema defines the overall database structure. Understanding these terms is critical for database security discussions.',
  'Think of a Tuple as a T-row-ple — each row is one tuple.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),
(
  8,
  'secure_coding',
  'Which practice BEST prevents SQL injection attacks in web applications?',
  '["Implementing client-side JavaScript validation on all form fields", "Using stored procedures without any additional controls", "Using parameterized queries that treat user input as data rather than executable code", "Encrypting database connection strings in the application configuration"]'::jsonb,
  2,
  'Parameterized queries (also called prepared statements) are the most effective defense against SQL injection. They pre-compile the SQL statement structure so user input is always treated as data, never as executable SQL code. Client-side validation can be bypassed, and stored procedures alone may still be vulnerable.',
  'PARAMETERIZED = Parameters stay in their lane. Data stays data, code stays code.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),
(
  8,
  'sast_dast_iast',
  'What is a KEY difference between SAST and DAST?',
  '["SAST tests the application in production while DAST tests during development", "SAST requires running the application while DAST examines source code", "SAST is a form of black-box testing while DAST is white-box testing", "SAST analyzes source code without execution while DAST tests the running application"]'::jsonb,
  3,
  'SAST (Static Application Security Testing) is a white-box technique that analyzes source code, bytecode, or binary code without executing the application. DAST (Dynamic Application Security Testing) is a black-box technique that tests the running application from the outside. A common exam trap reverses these definitions.',
  'SAST = Static = Source code = Sees the code. DAST = Dynamic = Deployed app = Does not see the code.',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),
(
  8,
  'buffer_overflow',
  'What type of vulnerability occurs when input data exceeds the allocated memory buffer and overwrites adjacent memory?',
  '["Buffer overflow", "SQL injection", "Race condition", "Cross-site scripting"]'::jsonb,
  0,
  'A buffer overflow occurs when a program writes data beyond the boundaries of allocated memory. This can overwrite adjacent memory locations with attacker-controlled data, potentially allowing arbitrary code execution. It is one of the oldest and most dangerous software vulnerabilities.',
  'Buffer OVERFLOW = data OVERFLOWS the container and spills into neighboring memory.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;