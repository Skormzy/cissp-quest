-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 8: Software Development Security
-- 100 questions for CAT engine
-- Distribution: 15 easy, 55 medium, 20 hard, 10 very_hard
-- Cognitive: 10 remember, 20 understand, 45 apply, 25 analyze
-- Types: 25 scenario, 20 first_action, 15 best_answer, 10 most_likely,
--        10 tlatm, 10 comparison, 5 calculation, 5 except_not
-- Correct positions: 25 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY (15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: easy / remember / comparison — correct=0
-- IRT: b=-1.5+(-0.5)+0.1=-1.9, a=0.8+0.1=0.9, c=0.22
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

-- Q2: easy / remember / best_answer — correct=1
-- IRT: b=-1.5+(-0.5)+0.0=-2.0, a=0.8+0.0=0.8, c=0.20
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

-- Q3: easy / understand / best_answer — correct=2
-- IRT: b=-1.5+0.0+0.0=-1.5, a=1.0+0.0=1.0, c=0.20
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

-- Q4: easy / understand / comparison — correct=3
-- IRT: b=-1.5+0.0+0.1=-1.4, a=1.0+0.1=1.1, c=0.22
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

-- Q5: easy / remember / best_answer — correct=0
-- IRT: b=-1.5+(-0.5)+0.0=-2.0, a=0.8+0.0=0.8, c=0.20
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
),

-- Q6: easy / understand / most_likely — correct=1
-- IRT: b=-1.5+0.0+0.1=-1.4, a=1.0+0.1=1.1, c=0.22
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

-- Q7: easy / apply / scenario — correct=2
-- IRT: b=-1.5+0.3+0.2=-1.0, a=1.3+0.2=1.5, c=0.20
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

-- Q8: easy / understand / best_answer — correct=3
-- IRT: b=-1.5+0.0+0.0=-1.5, a=1.0+0.0=1.0, c=0.20
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

-- Q9: easy / apply / first_action — correct=0
-- IRT: b=-1.5+0.3+0.3=-0.9, a=1.3+0.2=1.5, c=0.20
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

-- Q10: easy / remember / comparison — correct=1
-- IRT: b=-1.5+(-0.5)+0.1=-1.9, a=0.8+0.1=0.9, c=0.22
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
),

-- Q11: easy / understand / most_likely — correct=2
-- IRT: b=-1.5+0.0+0.1=-1.4, a=1.0+0.1=1.1, c=0.22
(
  8,
  'oop_security',
  'An object-oriented developer wants to hide internal implementation details and expose only necessary interfaces. Which OOP principle is MOST LIKELY being applied?',
  '["Polymorphism, which allows objects to take multiple forms", "Inheritance, which enables code reuse through parent-child relationships", "Encapsulation, which restricts direct access to an object''s internal data", "Delegation, which forwards requests to helper objects"]'::jsonb,
  2,
  'Encapsulation (also called data hiding or the black-box approach) restricts direct access to an object''s internal state and exposes only defined interfaces. This is fundamental to OOP security because it prevents unauthorized manipulation of internal data. Polymorphism handles multiple forms, inheritance handles code reuse, and delegation handles request forwarding.',
  'ENCAPSULATION = data in a CAPSULE. You can only interact through the approved opening.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q12: easy / apply / first_action — correct=3
-- IRT: b=-1.5+0.3+0.3=-0.9, a=1.3+0.2=1.5, c=0.20
(
  8,
  'devsecops',
  'A company is transitioning from traditional DevOps to DevSecOps. What should they do FIRST to embed security into the pipeline?',
  '["Replace all manual testing with automated penetration testing tools", "Hire a dedicated security operations center to monitor the pipeline", "Purchase an enterprise-grade web application firewall for production", "Integrate automated security testing tools into the existing CI/CD pipeline"]'::jsonb,
  3,
  'The first step in transitioning to DevSecOps is integrating security testing tools (such as SAST, dependency scanning, and secret detection) directly into the existing CI/CD pipeline. This embodies the shift-left principle by catching security issues early and automatically. Buying a WAF or hiring a SOC addresses production, not the development pipeline.',
  'DevSecOps = Dev + SEC + Ops. SEC goes IN THE MIDDLE of the pipeline, not bolted on at the end.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q13: easy / understand / best_answer — correct=0
-- IRT: b=-1.5+0.0+0.0=-1.5, a=1.0+0.0=1.0, c=0.20
(
  8,
  'maturity_models',
  'At which SW-CMM level does an organization first establish documented, standardized processes across the entire organization?',
  '["Level 3 — Defined", "Level 2 — Repeatable", "Level 4 — Managed", "Level 5 — Optimizing"]'::jsonb,
  0,
  'SW-CMM Level 3 (Defined) is where an organization establishes standardized, documented processes across the entire organization. Level 2 (Repeatable) has processes that succeed on a project-by-project basis but are not yet standardized organization-wide. Level 4 (Managed) adds quantitative measurement, and Level 5 (Optimizing) focuses on continuous improvement.',
  'SW-CMM: 1-Initial (chaos), 2-Repeatable (project success), 3-Defined (org-wide standards), 4-Managed (measured), 5-Optimizing (improving).',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q14: easy / apply / scenario — correct=1
-- IRT: b=-1.5+0.3+0.2=-1.0, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_coding',
  'A web application displays a generic error message saying "An error occurred. Please contact support." when a database query fails, instead of showing the SQL error details. Which secure coding principle does this demonstrate?',
  '["Input validation by filtering dangerous characters from user submissions", "Proper error handling that avoids revealing internal system details to users", "Session management by terminating the user session after an error", "Defense in depth by applying multiple layers of security controls"]'::jsonb,
  1,
  'Displaying generic error messages instead of detailed technical errors is a key secure coding practice for error handling. Verbose error messages can reveal database structure, query syntax, file paths, and other internal details that attackers can use to craft targeted attacks. Proper error handling logs details internally while showing users only generic messages.',
  'Errors to users = GENERIC. Errors to logs = SPECIFIC. Never show your cards to the attacker.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q15: easy / remember / best_answer — correct=2
-- IRT: b=-1.5+(-0.5)+0.0=-2.0, a=0.8+0.0=0.8, c=0.20
(
  8,
  'database_security',
  'Which database property ensures that a transaction either completes entirely or not at all?',
  '["Consistency", "Isolation", "Atomicity", "Durability"]'::jsonb,
  2,
  'Atomicity is the ACID property that guarantees a transaction is treated as a single, indivisible unit — it either completes fully or is completely rolled back. If any part of the transaction fails, all changes are reversed. Consistency ensures rules are maintained, Isolation keeps transactions invisible until complete, and Durability ensures committed data persists.',
  'ATOMICITY = like an ATOM, it cannot be split. All or nothing.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM (55) — IRT b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: medium / understand / scenario — correct=3
-- IRT: b=0.0+0.0+0.2=0.2, a=1.0+0.2=1.2, c=0.20
(
  8,
  'secure_sdlc',
  'A software company completes the requirements phase and moves into architecture and design. The security architect recommends performing threat modeling at this stage. A junior developer asks why threat modeling cannot wait until the testing phase. What is the BEST response?',
  '["Threat modeling is only effective when performed by architects, not testers", "Regulatory frameworks require threat modeling before any code is written", "Threat modeling during testing allows more accurate results because the code exists", "Identifying threats during design allows security to be built into the architecture rather than patched in later"]'::jsonb,
  3,
  'Threat modeling during the design phase allows security controls to be incorporated into the system architecture from the beginning. This aligns with the shift-left principle — finding and addressing threats early is far less expensive and more effective than discovering them during testing or after deployment.',
  'Threat model at DESIGN time = build the fortress walls BEFORE the castle, not after the enemy arrives.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: medium / apply / scenario — correct=0
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'sast_dast_iast',
  'A security team wants to find SQL injection and buffer overflow vulnerabilities in a Java application before deployment. They have full access to the source code and want to analyze it without running the application. Which testing approach should they use?',
  '["SAST, because it analyzes source code without executing the application", "DAST, because it simulates real-world attacks against the application", "IAST, because it combines both static and dynamic analysis simultaneously", "Fuzz testing, because it sends malformed inputs to discover crashes"]'::jsonb,
  0,
  'SAST (Static Application Security Testing) is the correct choice because it analyzes source code, bytecode, or binary code without executing the application. It can identify code-level vulnerabilities like SQL injection and buffer overflows during development. DAST requires a running application, IAST requires execution with code visibility, and fuzz testing requires a running target.',
  'SAST = Static = Scans Source = no execution needed. If you have the code and it is not running, use SAST.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q18: medium / apply / first_action — correct=1
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'change_management',
  'A critical production system is experiencing a known bug that causes intermittent data corruption. Multiple teams have proposed different fixes. According to formal change management, what should happen FIRST?',
  '["The development team should immediately deploy the most promising fix to stop data loss", "A change request should be submitted through the request control process", "The Change Advisory Board should convene an emergency meeting to select a fix", "The operations team should roll back to the previous version of the software"]'::jsonb,
  1,
  'Even in urgent situations, formal change management requires that changes begin with a request through the request control process. Request control is the first of three change management components (request control, change control, release control). The CAB reviews requests during change control, and deployment occurs during release control.',
  'Change management order: REQUEST it, CHANGE-control it, RELEASE it. Always start with the REQUEST.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'database_views',
  'A database administrator needs to ensure that users in the marketing department can only see customer records from their own region. The underlying customer table contains records for all regions. Which database security mechanism is MOST appropriate?',
  '["Encrypting the entire customer table with AES-256 encryption", "Implementing database normalization to separate regional data into tables", "Creating a database view that filters records based on the user''s assigned region", "Adding a trigger that logs all access attempts to the customer table"]'::jsonb,
  2,
  'Database views are virtual tables that present a subset of data from underlying tables. By creating a view filtered by region and granting marketing users access only to their regional view (not the base table), the DBA restricts access without duplicating data. This is a classic use of views for access control.',
  'VIEWS = Virtual windows. Each user sees only what their window shows, not the whole house.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q20: medium / understand / comparison — correct=3
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'development_methodologies',
  'How does the Spiral model fundamentally differ from the Waterfall model in its approach to software development?',
  '["The Spiral model eliminates the need for requirements gathering entirely", "The Spiral model only works for small projects while Waterfall handles large ones", "The Spiral model skips testing to accelerate delivery timelines", "The Spiral model is risk-driven and iterates through planning, risk analysis, engineering, and evaluation cycles"]'::jsonb,
  3,
  'The Spiral model is fundamentally risk-driven, cycling through four phases (planning, risk analysis, engineering, evaluation) in each iteration. It is considered a metamodel that can wrap around other methodologies like waterfall. Unlike the linear Waterfall approach, Spiral uses iterative prototyping and makes risk analysis central to every cycle.',
  'SPIRAL = SPIN through risk analysis every cycle. Waterfall = FALL straight down once.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q21: medium / apply / first_action — correct=0
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'software_acquisition',
  'Your organization is evaluating a commercial off-the-shelf (COTS) application for handling sensitive financial data. The vendor refuses to provide source code access. What should you do FIRST to mitigate this risk?',
  '["Negotiate a source code escrow agreement with a trusted third party", "Reject the COTS product and build a custom solution in-house", "Accept the risk since COTS products are generally well-tested by vendors", "Require the vendor to open-source their product before purchase"]'::jsonb,
  0,
  'When a COTS vendor will not provide source code access, a source code escrow agreement is the primary mitigation. A neutral third party holds the source code and releases it to the buyer if the vendor goes out of business or fails to maintain the product. This protects the buyer without requiring the vendor to expose proprietary code.',
  'ESCROW = Emergency Source Code Reserve for Operational Workarounds.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q22: medium / apply / scenario — correct=1
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'toctou_race_conditions',
  'A security analyst discovers that a banking application checks a user''s account balance before processing a withdrawal, but there is a brief gap between the balance check and the actual deduction. An attacker could potentially submit multiple withdrawal requests during this gap. What type of vulnerability is this?',
  '["Buffer overflow exploiting memory allocation weaknesses", "TOCTOU race condition exploiting the gap between the check and the use", "SQL injection manipulating the database query logic", "Cross-site request forgery tricking the user''s browser"]'::jsonb,
  1,
  'This is a classic TOCTOU (Time-of-Check to Time-of-Use) race condition. The vulnerability exists in the time gap between when the system checks a condition (account balance is sufficient) and when it uses that checked value (deducting funds). An attacker can change the state during this window. Mitigations include locking mechanisms, atomic operations, and mutex controls.',
  'TOCTOU = Time Of Check vs. Time Of Use. The gap between looking and acting is where attackers strike.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q23: medium / understand / best_answer — correct=2
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'shift_left',
  'What does the concept of "shifting left" mean in the context of software security?',
  '["Moving security responsibilities from the development team to the operations team", "Reducing the number of security testing tools in the pipeline", "Moving security activities earlier in the development lifecycle to catch issues sooner", "Shifting from automated testing to manual code review processes"]'::jsonb,
  2,
  'Shifting left means moving security activities to the earliest possible stages of the software development lifecycle. The term comes from a timeline where early phases are on the left. By addressing security during requirements and design rather than testing or production, organizations catch issues when they are cheaper and easier to fix.',
  'Think of a timeline arrow: LEFT = early, RIGHT = late. SHIFT LEFT = do security EARLY.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q24: medium / apply / first_action — correct=3
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_coding',
  'A penetration tester discovers that a web application is vulnerable to SQL injection through its login form. The development team is asked to remediate the issue. What should they implement FIRST?',
  '["A web application firewall to filter malicious SQL patterns at the network perimeter", "Client-side input validation using JavaScript to check for SQL special characters", "Database encryption to protect data even if SQL injection succeeds", "Parameterized queries on the server side to separate SQL code from user-supplied data"]'::jsonb,
  3,
  'The most effective first remediation for SQL injection is implementing parameterized queries (prepared statements) on the server side. This fundamentally separates SQL code structure from user data, making injection impossible regardless of input. WAFs are defense-in-depth but can be bypassed. Client-side validation is easily circumvented. Database encryption does not prevent the injection itself.',
  'SQL injection fix priority: PARAMETERIZE first, then add WAF as defense in depth. Fix the root cause, not the symptom.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q25: medium / apply / scenario — correct=0
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'advanced_testing',
  'A QA team is testing a file upload feature by submitting files with random binary content, extremely long filenames, null bytes in filenames, and files with mismatched extensions and content types. The goal is to discover unexpected crashes or error-handling failures. What type of testing is this?',
  '["Fuzz testing, which sends random or malformed inputs to discover unexpected behaviors", "Regression testing, which verifies that previously working features still function", "User acceptance testing, which validates the system meets business requirements", "Unit testing, which tests individual modules in isolation"]'::jsonb,
  0,
  'Fuzz testing (fuzzing) involves providing random, unexpected, or deliberately malformed inputs to an application to discover crashes, memory leaks, assertion failures, and other vulnerabilities. It is particularly effective at finding input-handling bugs that manual testing would miss. The randomized nature makes it good at exploring edge cases.',
  'FUZZ = Feed Unexpected Zany Stuff. Random garbage in, bugs out.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q26: medium / understand / comparison — correct=1
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'database_security',
  'What is the KEY difference between an aggregation attack and an inference attack on a database?',
  '["Aggregation exploits SQL injection while inference exploits buffer overflows", "Aggregation combines multiple low-sensitivity items to derive sensitive information while inference uses logical deduction on accessible data", "Aggregation targets NoSQL databases while inference targets relational databases", "Aggregation requires administrative access while inference can be performed by any user"]'::jsonb,
  1,
  'Aggregation attacks combine multiple pieces of individually non-sensitive data to derive information at a higher classification level, often using SQL aggregate functions. Inference attacks use logical deduction and reasoning on accessible data to determine restricted information. Both are database attacks but use different mechanisms — aggregation is mathematical, inference is logical.',
  'AGGREGATION = Adding up small pieces. INFERENCE = INFERring from clues. One is math, the other is detective work.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q27: medium / apply / tlatm — correct=2
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'secure_sdlc',
  'As the CISO of a financial services company, you learn that the development team has been deploying code directly to production without any formal review process. Development velocity has been high, but two security incidents occurred last quarter from unreviewed code changes. What is your BEST course of action?',
  '["Immediately halt all deployments until a full security audit of all production code is completed", "Terminate the development team lead for failing to follow security procedures", "Implement a formal change management process with mandatory security review gates in the CI/CD pipeline", "Purchase a comprehensive application firewall to compensate for the lack of code review"]'::jsonb,
  2,
  'As a CISSP, think like a manager. The best approach is implementing process controls (formal change management with security review gates) rather than reactive measures. Halting all deployments is too disruptive, termination does not fix the process gap, and a WAF does not address the root cause of unreviewed code reaching production.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q28: medium / apply / scenario — correct=3
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'containerization',
  'A development team is deploying microservices using Docker containers. Each container runs a single service with its own dependencies. A security review reveals that several containers are running as the root user and using base images that have not been updated in six months. Which security concern should be addressed FIRST?',
  '["The microservices architecture creates too many network connections to monitor effectively", "Docker containers provide sufficient isolation and do not need additional hardening", "Using separate containers for each service unnecessarily increases the attack surface", "Containers running as root violate the principle of least privilege and should use non-root users"]'::jsonb,
  3,
  'Running containers as root is a critical security violation because if an attacker compromises the container, they have root-level access that could potentially escape the container isolation. Applying least privilege by running containers as non-root users is the most urgent fix. Outdated base images are also important but the root privilege issue is more immediately dangerous.',
  'Containers + Root = Risky. Least privilege applies INSIDE containers too. Run as non-root, always.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q29: medium / understand / best_answer — correct=0
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'api_security',
  'Which security control BEST protects REST APIs from abuse through excessive request volumes?',
  '["API rate limiting and throttling to restrict the number of requests per time period", "Encrypting all API responses with AES-256 to prevent data exposure", "Requiring SOAP protocol instead of REST for all external communications", "Using HTTP Basic Authentication for all API endpoints"]'::jsonb,
  0,
  'API rate limiting and throttling are the primary defenses against API abuse through excessive requests. Rate limiting caps the number of requests a client can make within a time window, preventing denial-of-service attacks and brute-force attempts. Encryption protects data in transit but does not address volume. SOAP is a different protocol, not a volume control.',
  'Rate Limiting = speed limit for API traffic. Too many requests = slow down or get blocked.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q30: medium / apply / first_action — correct=1
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'buffer_overflow',
  'A security scan has identified multiple buffer overflow vulnerabilities in a legacy C application that processes financial transactions. The application cannot be immediately replaced. What should the team implement FIRST as a mitigation while a long-term fix is developed?',
  '["Rewrite the entire application in a memory-safe language like Rust or Java", "Enable Address Space Layout Randomization (ASLR) to make exploitation more difficult", "Deploy a network intrusion detection system to monitor for buffer overflow exploits", "Add additional logging to detect when buffer overflows are attempted"]'::jsonb,
  1,
  'ASLR (Address Space Layout Randomization) randomizes the memory addresses where executables and libraries are loaded, making it much harder for attackers to predict where to redirect execution flow. It is a quick mitigation that does not require code changes. Rewriting in another language is a long-term solution, not a first step. NIDS and logging detect but do not prevent.',
  'ASLR = Address Scramble = makes the attacker''s target a moving one. Quick defense while you fix the code.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q31: medium / apply / tlatm — correct=2
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'software_acquisition',
  'Your organization is considering migrating a critical application to a SaaS provider. As the security manager, the CTO asks you to evaluate the proposal. Several departments are enthusiastic about reduced infrastructure costs. What is the MOST important factor you should evaluate?',
  '["The SaaS provider''s stock price and market capitalization as indicators of stability", "Whether the provider uses Agile or Waterfall development methodology internally", "The shared responsibility model and whether the provider''s security controls meet your compliance requirements", "How many other customers use the same SaaS platform for similar workloads"]'::jsonb,
  2,
  'When evaluating a SaaS provider, the most critical security factor is understanding the shared responsibility model — what the provider secures versus what the organization must secure — and verifying their controls meet your compliance requirements. SOC reports, security assessments, and contractual SLAs are key evaluation tools. Cost savings are secondary to security adequacy.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q32: medium / understand / except_not — correct=3
-- IRT: b=0.0+0.0+0.2=0.2, a=1.0+(-0.1)=0.9, c=0.25
(
  8,
  'secure_coding',
  'All of the following are secure coding best practices EXCEPT:',
  '["Validating all user input on the server side before processing", "Using parameterized queries to prevent SQL injection attacks", "Implementing proper error handling that logs details internally", "Displaying detailed stack traces and SQL error messages to end users for transparency"]'::jsonb,
  3,
  'Displaying detailed error messages (stack traces, SQL errors, file paths) to end users is a security anti-pattern, not a best practice. Attackers use this information to understand internal system structure and craft targeted attacks. Secure applications show generic error messages to users while logging technical details to internal monitoring systems.',
  'Error messages to users should be BORING and GENERIC. Save the details for your internal logs.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q33: medium / apply / scenario — correct=0
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'devsecops',
  'A DevSecOps team discovers that their CI/CD pipeline occasionally deploys code that contains hardcoded API keys and database passwords. These secrets are committed directly into the source code repository. The team wants to prevent this from happening automatically. Which control is MOST effective?',
  '["Integrating a secret scanning tool into the CI/CD pipeline that blocks builds containing hardcoded credentials", "Sending a monthly reminder email to developers about not committing secrets", "Adding a note in the developer handbook about credential management best practices", "Conducting quarterly security awareness training sessions on secure coding"]'::jsonb,
  0,
  'Automated secret scanning integrated into the CI/CD pipeline is the most effective control because it provides real-time, automated prevention. It scans commits for patterns matching API keys, passwords, and tokens, blocking the pipeline before secrets reach production. Training and documentation are important but insufficient as sole controls — automation catches what humans miss.',
  'Automate the boring stuff. Secret scanners in the pipeline catch what tired developers miss at 2 AM.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q34: medium / understand / most_likely — correct=1
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'maturity_models',
  'An organization has repeatable processes on individual projects, but different project teams use different approaches. Processes succeed based on individual competence rather than organizational standards. At which SW-CMM level is this organization MOST LIKELY operating?',
  '["Level 1 — Initial, where processes are chaotic and ad hoc", "Level 2 — Repeatable, where project-level processes exist but are not standardized organization-wide", "Level 3 — Defined, where processes are documented and consistent across the organization", "Level 4 — Managed, where processes are quantitatively measured and controlled"]'::jsonb,
  1,
  'SW-CMM Level 2 (Repeatable) is characterized by processes that succeed on a project-by-project basis, often depending on individual talent rather than organizational standards. Projects can repeat past successes but the organization has not yet standardized processes across all teams. Level 3 is where organization-wide standardization occurs.',
  'Level 2 = Repeatable = "We can repeat success on one project, but each team does it differently."',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q35: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'database_security',
  'A medical records database uses the ACID properties to ensure transaction integrity. During a system crash, a transaction that was transferring patient records between departments was only partially completed. Which ACID property ensures this partial transaction is automatically reversed?',
  '["Durability, because committed transactions must survive system failures", "Consistency, because the database must maintain all integrity rules", "Atomicity, because the transaction must either complete fully or be entirely rolled back", "Isolation, because transactions must be invisible to others until complete"]'::jsonb,
  2,
  'Atomicity ensures that a transaction is an indivisible unit — either all operations within the transaction complete successfully, or none of them take effect. When a crash interrupts a transaction, atomicity guarantees the partial changes are rolled back, returning the database to its pre-transaction state. This prevents partial updates that could corrupt data.',
  'ATOMICITY = ALL or NOTHING. If the transaction crashes halfway, everything rolls back. No partial commits.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q36: medium / apply / first_action — correct=3
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'api_security',
  'A security assessment reveals that a company''s public REST API has no authentication mechanism — anyone who knows the endpoint URL can access customer data. The API serves a mobile application used by thousands of customers. What should be implemented FIRST?',
  '["IP whitelisting to allow only known mobile carrier IP ranges", "Rate limiting to prevent excessive data extraction from the API", "Input validation to ensure all API parameters are properly sanitized", "API authentication using OAuth 2.0 or API keys to verify the identity of callers"]'::jsonb,
  3,
  'The most critical first step for an unauthenticated API exposing customer data is implementing authentication. Without authentication, anyone can access the data regardless of other controls. OAuth 2.0 or API keys verify the caller''s identity before granting access. Rate limiting and input validation are important but secondary to knowing who is making requests.',
  'No auth on an API = open door. FIRST lock the door (authentication), THEN install cameras (monitoring) and speed bumps (rate limiting).',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q37: medium / apply / tlatm — correct=0
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'development_methodologies',
  'As the IT director overseeing a large enterprise software project, your development teams are struggling to coordinate Agile practices across 15 teams working on interconnected components. Individual teams are productive, but cross-team dependencies cause frequent delays and integration failures. What approach should you recommend?',
  '["Adopt the Scaled Agile Framework (SAFe) to coordinate Agile practices across multiple teams", "Abandon Agile entirely and switch all 15 teams to the Waterfall methodology", "Let each team continue independently and address integration issues as they arise in production", "Reduce the number of teams to three large teams to simplify coordination"]'::jsonb,
  0,
  'SAFe (Scaled Agile Framework) is specifically designed to coordinate Agile practices across large organizations with multiple teams. It provides structures like Agile Release Trains, Program Increments, and System Demos that help synchronize work across teams while preserving Agile benefits. Abandoning Agile would lose the benefits each team already achieves.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q38: medium / understand / best_answer — correct=1
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'oop_security',
  'In object-oriented programming, which concept BEST describes the ability of different objects to respond to the same method call in different ways?',
  '["Encapsulation, which hides internal implementation details behind interfaces", "Polymorphism, which allows the same message to produce different behaviors in different objects", "Inheritance, which passes attributes and methods from parent to child classes", "Abstraction, which simplifies complex systems by hiding unnecessary details"]'::jsonb,
  1,
  'Polymorphism literally means "many forms." It allows different objects to respond to the same method call (message) with different behaviors. For example, a draw() method might render a circle for a Circle object and a rectangle for a Rectangle object. This enables flexible, extensible code design where the calling code does not need to know the specific object type.',
  'POLY = many, MORPH = forms. Same message, many different responses depending on the object.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q39: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_sdlc',
  'A development team has completed coding a new e-commerce application and is preparing for release. The project manager wants to verify that all previously passing test cases still produce correct results after the latest round of bug fixes. Which type of testing should be performed?',
  '["User acceptance testing to verify the application meets business requirements", "Fuzz testing to discover unexpected input-handling vulnerabilities", "Regression testing to confirm that bug fixes did not break existing functionality", "Smoke testing to quickly verify the application''s core functions work"]'::jsonb,
  2,
  'Regression testing re-runs previously passing test cases after code changes to verify that existing functionality remains intact. When bug fixes are applied, they can inadvertently break other features. Regression testing catches these unintended side effects. Smoke testing is a quick sanity check, UAT validates business requirements, and fuzz testing discovers input-handling bugs.',
  'REGRESSION = RE-running tests to catch RE-gressions. Did the fix break something else?',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q40: medium / understand / most_likely — correct=3
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'database_security',
  'A database table stores classified military information. When a user without the appropriate clearance queries a record that exists at a higher classification level, the system returns a different version of the record at the user''s clearance level. This technique is MOST LIKELY which of the following?',
  '["Database normalization to reduce redundancy across classification levels", "Cell suppression to hide individual sensitive values in query results", "Noise and perturbation to add random data to mask actual values", "Polyinstantiation, which maintains multiple versions of data at different classification levels"]'::jsonb,
  3,
  'Polyinstantiation maintains multiple versions (instances) of the same data at different classification levels. This prevents inference attacks — if a query returned "no record found" for a classified record, a lower-cleared user could infer that a classified version exists. By providing a version at each classification level, the system reveals nothing about higher-classified data.',
  'POLY = many, INSTANTIATION = instances. Multiple versions of the same record at different security levels.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q41: medium / apply / first_action — correct=0
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'shift_left',
  'A new application development project is kicking off. The security team wants to adopt a shift-left approach. What should they prioritize FIRST?',
  '["Including security requirements in the initial requirements gathering phase alongside functional requirements", "Purchasing and deploying a runtime application self-protection tool for production", "Scheduling a penetration test for the week before the planned go-live date", "Hiring an external firm to conduct a security audit after the first release"]'::jsonb,
  0,
  'Shifting left means moving security to the earliest possible phase. The very first opportunity to integrate security is during requirements gathering, where security requirements are defined alongside functional and business requirements. RASP, penetration testing, and external audits all occur much later in the lifecycle — they represent a traditional right-side approach.',
  'Shift LEFT = Requirements are the LEFT-most phase. Start there. If you wait until pen testing, you have already shifted right.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q42: medium / apply / scenario — correct=1
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_coding',
  'A security team discovers that a web application accepts user-supplied HTML in comment fields and renders it directly in other users'' browsers without sanitization. An attacker has injected a script that steals session cookies from visitors. Which vulnerability category does this represent?',
  '["SQL injection, because the attacker is injecting malicious code into the application", "Stored Cross-Site Scripting (XSS), because malicious scripts persist in the database and execute in victims'' browsers", "Cross-Site Request Forgery (CSRF), because the attack exploits the user''s authenticated session", "Server-Side Request Forgery (SSRF), because the server is making unauthorized requests"]'::jsonb,
  1,
  'This is a Stored (Persistent) XSS attack. The malicious script is stored in the database (via the comment field) and served to every user who views the page, executing in their browser. Unlike reflected XSS (which requires a crafted URL), stored XSS persists and affects all visitors. The defense is output encoding and input validation.',
  'Stored XSS = the malicious script is STORED in the database and SERVED to every visitor like a poison meal.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q43: medium / understand / comparison — correct=2
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'api_security',
  'What is the KEY difference between REST and SOAP APIs from a security perspective?',
  '["REST APIs cannot use encryption while SOAP APIs require mandatory TLS encryption", "REST APIs are inherently more secure because they are newer and more modern", "REST is lightweight and supports multiple data formats while SOAP is XML-only with built-in error handling and WS-Security standards", "SOAP APIs are faster and more efficient while REST APIs have better security features"]'::jsonb,
  2,
  'REST APIs are lightweight, use HTTP methods, and support multiple output formats (JSON, XML, CSV). SOAP APIs are XML-only, more rigid, but include built-in standards like WS-Security for message-level security and stronger error handling. Neither is inherently more secure — they have different security characteristics. REST relies on transport-level security (TLS) while SOAP can provide message-level security.',
  'REST = Relaxed and flexible (multiple formats). SOAP = Strict and structured (XML only, built-in security standards).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q44: medium / apply / tlatm — correct=3
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'change_management',
  'As the IT security manager, you learn that a developer bypassed the change management process to push an "urgent" patch directly to production over the weekend. The patch resolved a customer-reported issue but was not reviewed or tested. No incident resulted from the patch. How should you respond?',
  '["Commend the developer for their initiative in resolving the customer issue quickly", "Ignore the situation since no security incident occurred and the customer is satisfied", "Immediately roll back the patch and restore the previous version of the software", "Document the violation, review the patch through the standard process, and reinforce change management procedures"]'::jsonb,
  3,
  'As a manager, the correct response balances accountability with pragmatism. The unauthorized change should be documented, the patch should be retroactively reviewed through the proper process, and the team should be reminded of change management requirements. Simply rolling back could cause a new issue. Ignoring it sets a dangerous precedent. The focus should be on process improvement.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q45: medium / apply / scenario — correct=0
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'advanced_testing',
  'A development team is using a structured code review process where specific roles are assigned: a moderator guides the review, the author presents the code, reviewers examine it methodically, and a recorder documents all findings. Formal entry and exit criteria are defined. What is this process called?',
  '["Fagan inspection, which is a formal structured code review with defined roles and criteria", "Pair programming, where two developers write code together at one workstation", "Smoke testing, which quickly verifies core application functionality", "Black-box testing, which tests the application from an external perspective"]'::jsonb,
  0,
  'A Fagan inspection is a formal, highly structured code review process with defined roles (moderator, author, reviewers, recorder), formal entry and exit criteria, and a systematic approach to finding defects. It is one of the most rigorous forms of code review and is distinguished from informal peer reviews by its strict process and role definitions.',
  'FAGAN inspection = Formal And Governed ANalysis. Structured roles, formal criteria, documented findings.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q46: medium / understand / best_answer — correct=1
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'database_security',
  'Which database integrity rule BEST ensures that every foreign key value in a child table corresponds to an existing primary key value in the parent table?',
  '["Entity integrity, which requires primary keys to be unique and non-null", "Referential integrity, which requires foreign keys to match valid primary keys in referenced tables", "Semantic integrity, which ensures data values are meaningful and logically correct", "Domain integrity, which restricts values to defined data types and ranges"]'::jsonb,
  1,
  'Referential integrity ensures that foreign key values in a child table always reference valid primary key values in the parent table. This prevents orphaned records and maintains relationships between tables. Entity integrity governs primary keys (unique, non-null). The exam frequently tests the distinction between entity and referential integrity.',
  'REFERENTIAL integrity = REFERENCES must be valid. Foreign keys must REFER to real primary keys.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q47: medium / apply / first_action — correct=2
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'containerization',
  'Your organization is adopting container-based deployment for the first time. The infrastructure team has created Docker images for several services. Before deploying to production, what should the security team do FIRST?',
  '["Monitor container network traffic using a traditional network-based intrusion detection system", "Conduct a penetration test against the container orchestration management interface", "Scan all container base images for known vulnerabilities and verify they follow security hardening guidelines", "Deploy containers to a staging environment and perform user acceptance testing"]'::jsonb,
  2,
  'Before deploying containers to production, the first security step is scanning base images for known vulnerabilities and verifying they follow hardening guidelines (non-root users, minimal packages, no secrets in images). Vulnerable or misconfigured base images are the foundation of every container — if the base is insecure, everything built on it is insecure.',
  'Container security starts at the BASE. Scan and harden the BASE IMAGE first — it is the foundation for everything.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q48: medium / understand / most_likely — correct=3
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'secure_coding',
  'A web application''s firewall fails during a maintenance window. The application is designed to continue accepting all user requests without any security filtering until the firewall is restored. This behavior is MOST LIKELY an example of which design flaw?',
  '["Defense in depth, because the application has multiple layers of protection", "Fail-secure, because the application locks down access during the failure", "Input validation bypass, because the application skips checking user input", "Fail-open, because the application defaults to a permissive state when a control fails"]'::jsonb,
  3,
  'Fail-open means a system defaults to allowing access when a security control fails. This is generally considered a security flaw because it removes protection precisely when something has gone wrong. The preferred approach is fail-secure (fail-closed), where the system denies access when a control fails. Fail-open is rarely appropriate except in specific safety scenarios.',
  'Fail-OPEN = the door OPENS when the lock breaks. Fail-SECURE = the door LOCKS when the lock breaks. Almost always choose fail-secure.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q49: medium / apply / scenario — correct=0
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'owasp_top_10',
  'A security analyst reviewing a healthcare web application discovers that the application constructs database queries by concatenating user-supplied search terms directly into SQL strings. For example, the search field value is placed directly into: "SELECT * FROM patients WHERE name = ''" + userInput + "''". What is the PRIMARY risk of this coding practice?',
  '["SQL injection, because user input is treated as executable SQL code rather than data", "Cross-site scripting, because the user input is rendered in the browser without encoding", "Buffer overflow, because the concatenated string may exceed memory allocation", "Denial of service, because large search terms could consume excessive database resources"]'::jsonb,
  0,
  'Direct string concatenation of user input into SQL queries is the classic SQL injection vulnerability. An attacker can input values like '' OR 1=1 -- to manipulate the query logic, potentially accessing, modifying, or deleting data. The fix is parameterized queries, which separate the SQL structure from user data.',
  'String concatenation + SQL = SQL injection recipe. NEVER concatenate user input into SQL. Use PARAMETERIZED queries.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q50: medium / understand / except_not — correct=1
-- IRT: b=0.0+0.0+0.2=0.2, a=1.0+(-0.1)=0.9, c=0.25
(
  8,
  'development_methodologies',
  'All of the following are characteristics of Agile development EXCEPT:',
  '["Welcoming changing requirements, even late in development", "Requiring comprehensive documentation before any coding begins", "Delivering working software frequently in short iterations", "Valuing individuals and interactions over rigid processes and tools"]'::jsonb,
  1,
  'The Agile Manifesto explicitly values working software over comprehensive documentation. Agile methodologies intentionally minimize upfront documentation in favor of delivering working software in short iterations. Requiring comprehensive documentation before coding is a characteristic of Waterfall, not Agile. Agile welcomes change, delivers frequently, and values people over process.',
  'Agile values: Individuals over process, Working software over documentation, Collaboration over contracts, Responding over following a plan.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q51: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'database_security',
  'A financial application processes thousands of concurrent transactions. Two transactions simultaneously read the same account balance, each calculates a new balance after a withdrawal, and both write their results. The first transaction''s update is overwritten by the second. What concurrency problem has occurred?',
  '["Dirty read, where a transaction reads uncommitted data from another transaction", "Incorrect summary, where an aggregate function reads partially updated data", "Lost update, where two transactions read and update the same data and one overwrites the other", "Phantom read, where new rows appear during a transaction due to another insert"]'::jsonb,
  2,
  'A lost update occurs when two transactions read the same data, each independently calculates a new value, and the second write overwrites the first. The first transaction''s changes are lost. This is a classic concurrency problem prevented by proper locking mechanisms such as exclusive locks or optimistic concurrency control.',
  'LOST UPDATE = two people editing the same document and one saves over the other''s work. Use LOCKING to prevent.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q52: medium / apply / first_action — correct=3
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_sdlc',
  'An organization has just experienced a data breach caused by a vulnerability in their custom web application. Post-incident analysis reveals that security was only considered during the final testing phase. What should the organization do FIRST to prevent similar incidents in future projects?',
  '["Purchase more advanced penetration testing tools for the QA team", "Hire additional security testers to increase testing coverage", "Implement runtime application self-protection on all production applications", "Integrate security requirements and threat modeling into the earliest phases of the SDLC"]'::jsonb,
  3,
  'The root cause was that security was only considered late in the development process. The most effective first step is integrating security requirements and threat modeling into the earliest SDLC phases (requirements and design). This shift-left approach addresses the systemic issue rather than just adding more testing at the end.',
  'The lesson: security bolted on at the end FAILS. SHIFT LEFT — weave security in from the very first phase.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q53: medium / understand / best_answer — correct=0
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'sast_dast_iast',
  'Which testing approach BEST describes a tool that instruments the application during execution, combining real-time code analysis with runtime behavior observation to identify vulnerabilities?',
  '["IAST, which combines code visibility with runtime testing during application execution", "SAST, which analyzes source code without executing the application", "DAST, which tests the running application from an external perspective without code access", "Regression testing, which verifies unchanged behavior after code modifications"]'::jsonb,
  0,
  'IAST (Interactive Application Security Testing) combines elements of both SAST and DAST. It instruments the application during execution so it can observe code-level behavior while the application runs. This gives it the advantages of both approaches — it can see the source code context AND observe runtime behavior, making it effective at finding both code-level and runtime vulnerabilities.',
  'IAST = Inside + Active = instrumented inside the app while it actively runs. Best of SAST and DAST combined.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q54: medium / apply / tlatm — correct=1
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'maturity_models',
  'As the VP of Engineering, you have been asked by the board to demonstrate that your software development processes are quantitatively measured, statistically controlled, and predictable. Which maturity level should your organization target to meet this requirement?',
  '["SW-CMM Level 3 — Defined, where processes are standardized and documented", "SW-CMM Level 4 — Managed, where processes are quantitatively measured and controlled", "SW-CMM Level 2 — Repeatable, where individual projects have repeatable processes", "SW-CMM Level 5 — Optimizing, where continuous process improvement is practiced"]'::jsonb,
  1,
  'SW-CMM Level 4 (Managed) is characterized by quantitative process management. At this level, the organization collects detailed metrics on process performance, uses statistical methods to control processes, and can predict outcomes with measurable confidence. Level 3 standardizes processes, and Level 5 adds continuous improvement, but Level 4 is specifically about measurement and control.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q55: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_coding',
  'A development team is building a web application that processes credit card payments. During a code review, the reviewer notices that the application stores the full credit card number, expiration date, and CVV in a plaintext log file for debugging purposes. What is the MOST significant security concern?',
  '["The log file may consume excessive disk space as transactions increase", "The debugging information may slow down the application''s response time", "Storing sensitive payment data in plaintext logs violates PCI DSS requirements and exposes card data to unauthorized access", "The log rotation policy may delete useful debugging information prematurely"]'::jsonb,
  2,
  'Storing full credit card numbers and CVVs in plaintext logs is a severe violation of PCI DSS requirements and creates a major data exposure risk. PCI DSS specifically prohibits storing CVVs after authorization. Secure coding practices require that sensitive data never be written to log files, and when debugging is needed, data should be masked or tokenized.',
  'NEVER log sensitive data in plaintext. CVV must NEVER be stored after authorization. PCI DSS is strict on this.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q56: medium / understand / comparison — correct=3
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'secure_coding',
  'What is the KEY difference between compiled and interpreted programming languages from a security perspective?',
  '["Compiled languages are always more secure because they produce optimized machine code", "Interpreted languages cannot be used for web applications due to security limitations", "Compiled languages require an interpreter at runtime which adds attack surface", "Compiled languages distribute binary executables making code harder to inspect, while interpreted languages distribute readable source code"]'::jsonb,
  3,
  'From a security perspective, compiled languages produce binary executables that are harder for users to inspect or reverse-engineer, which can hide malicious code (backdoors). Interpreted languages distribute the source code itself, allowing inspection but also making modification (tampering) easier. Neither approach is inherently more secure — they have different risk profiles.',
  'Compiled = binary blob (hard to inspect, easy to hide backdoors). Interpreted = readable source (easy to inspect, easy to tamper).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q57: medium / apply / first_action — correct=0
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'devsecops',
  'A DevSecOps team has just set up their first CI/CD pipeline. They want to catch security vulnerabilities as early as possible. Where in the pipeline should they place their FIRST automated security check?',
  '["At the commit stage, scanning code changes as developers push to the repository", "At the deployment stage, running security tests just before production release", "At the monitoring stage, analyzing application behavior after deployment", "At the user acceptance testing stage, when business users validate functionality"]'::jsonb,
  0,
  'The shift-left principle dictates placing security checks as early as possible. The commit stage is the earliest point in the CI/CD pipeline — scanning code at commit time catches vulnerabilities before they propagate further. Pre-commit hooks for secret scanning and SAST integration at the build stage provide the earliest automated feedback to developers.',
  'Shift LEFT in the pipeline = commit is the LEFTMOST stage. Catch issues at the SOURCE before they travel downstream.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q58: medium / apply / scenario — correct=1
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'database_security',
  'A university research database contains individual student grades that are classified as confidential. However, an analyst with access only to aggregate grade reports discovers they can determine a specific student''s grade by requesting the average for a class of two students and knowing one grade already. What type of attack is this?',
  '["Aggregation attack, combining multiple data items to derive higher-sensitivity information", "Inference attack, using logical deduction on accessible data to derive restricted information", "SQL injection attack, manipulating database queries to access unauthorized data", "Polyinstantiation violation, accessing data at a classification level above the user''s clearance"]'::jsonb,
  1,
  'This is an inference attack. The analyst uses logical deduction — knowing the average of two values and one of the values allows calculating the other. Inference attacks use accessible data plus reasoning to determine restricted information. An aggregation attack would involve combining many low-sensitivity items, not deducing from a known relationship.',
  'INFERENCE = using logic and known facts to INFER hidden information. Like a detective solving a puzzle with clues.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q59: medium / understand / most_likely — correct=2
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
(
  8,
  'development_methodologies',
  'A development team holds daily 15-minute meetings where each member answers three questions: What did I do yesterday? What will I do today? What obstacles are in my way? This practice is MOST LIKELY part of which methodology?',
  '["Waterfall, which uses milestone reviews at the end of each sequential phase", "Cleanroom, which focuses on formal verification and statistical quality control", "Scrum, which uses daily stand-ups (scrums) to synchronize team progress", "Spiral, which uses iterative risk analysis and prototyping cycles"]'::jsonb,
  2,
  'The daily stand-up meeting (daily scrum) with its three standard questions is a hallmark of the Scrum methodology. These brief, time-boxed meetings keep the team synchronized, identify impediments quickly, and maintain sprint momentum. The Scrum Master facilitates these meetings and helps remove obstacles identified by team members.',
  'SCRUM = daily Stand-up, three questions, 15 minutes max. Quick sync, not a status report meeting.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q60: medium / apply / scenario — correct=3
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'buffer_overflow',
  'A security researcher is analyzing a C program and discovers that the function uses strcpy() to copy user-supplied input into a fixed-size character array of 256 bytes without bounds checking. The researcher crafts an input of 300 bytes containing a NOP sled and shellcode. What attack is being prepared?',
  '["SQL injection to manipulate the backend database through the application", "Cross-site scripting to execute malicious code in other users'' browsers", "Integer overflow to cause arithmetic errors in memory allocation calculations", "Stack-based buffer overflow to overwrite the return address and redirect execution to the shellcode"]'::jsonb,
  3,
  'This is a classic stack-based buffer overflow attack. The strcpy() function does not check bounds, so 300 bytes written into a 256-byte buffer overflows onto the stack, overwriting the return address. The NOP sled provides a landing zone, and the shellcode executes when the function returns to the attacker-controlled address. Using strncpy() or similar bounded functions prevents this.',
  'strcpy = UNSAFE (no bounds check). strncpy = SAFE (bounds checked). Always check the SIZE of your buffers.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q61: medium / apply / tlatm — correct=0
-- IRT: b=0.0+0.3+0.5=0.8, a=1.3+0.4=1.7, c=0.20
(
  8,
  'secure_sdlc',
  'As the CISO, you must choose between two application security strategies for the organization. Strategy A focuses on robust pre-deployment testing with dedicated security testing teams. Strategy B integrates security throughout the entire SDLC with automated tools and developer security training. Budget constraints allow only one approach. Which should you choose?',
  '["Strategy B, because integrating security throughout the SDLC catches issues earlier and reduces remediation costs", "Strategy A, because dedicated security testing teams provide more thorough analysis than developers", "Strategy A, because it is less disruptive to existing development workflows and faster to implement", "Strategy B, but only if the organization has more than 100 developers to justify the investment"]'::jsonb,
  0,
  'Strategy B aligns with industry best practices (shift-left, DevSecOps). Integrating security throughout the SDLC catches vulnerabilities earlier when they are cheaper to fix, empowers developers to write secure code, and provides continuous security assurance. While Strategy A provides value, it only catches issues late in the process when fixes are expensive.',
  NULL,
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q62: medium / apply / calculation — correct=1
-- IRT: b=0.0+0.3+0.4=0.7, a=1.3+0.3=1.6, c=0.20
(
  8,
  'advanced_testing',
  'A software module has 5,000 lines of code. During testing, the team executed 4,250 of the total statements. What is the statement coverage percentage?',
  '["80%", "85%", "90%", "75%"]'::jsonb,
  1,
  'Statement coverage is calculated as: (Number of executed statements / Total statements) x 100. In this case: (4,250 / 5,000) x 100 = 85%. Statement coverage measures what percentage of code statements were exercised during testing. While 85% coverage is good, it does not guarantee all paths or branches were tested.',
  'Statement Coverage = Executed / Total x 100. Think: what PERCENTAGE of the code did my tests actually touch?',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q63: medium / apply / scenario — correct=2
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
(
  8,
  'api_security',
  'A mobile banking application communicates with backend servers through a REST API. During a security review, the team discovers that API keys are embedded directly in the mobile application''s source code. Users who decompile the app can extract these keys. What is the BEST remediation?',
  '["Obfuscate the mobile application code to make decompilation more difficult", "Rotate the API keys on a weekly basis to limit the window of exposure", "Implement OAuth 2.0 token-based authentication so that API keys are not stored in the client application", "Add IP address restrictions to only allow requests from known mobile carrier networks"]'::jsonb,
  2,
  'Embedding API keys in client-side code is inherently insecure because the keys can always be extracted regardless of obfuscation. The proper solution is implementing OAuth 2.0 token-based authentication, where temporary tokens are issued after user authentication. Tokens expire and are specific to authenticated sessions, eliminating the need to embed static credentials in the app.',
  'API keys in client code = keys under the doormat. Use OAuth tokens instead — temporary, user-specific, revocable.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q64: medium / understand / best_answer — correct=3
-- IRT: b=0.0+0.0+0.0=0.0, a=1.0+0.0=1.0, c=0.20
(
  8,
  'change_management',
  'Which change management component is BEST described as the process where formal acceptance testing occurs before code is deployed to production?',
  '["Request control, where change requests are submitted and logged", "Change control, where the CAB reviews and approves proposed changes", "Configuration management, where system baselines are tracked and documented", "Release control, where acceptance testing validates changes before deployment"]'::jsonb,
  3,
  'Release control is the change management component where formal acceptance testing occurs. After a change has been requested (request control) and approved (change control), it undergoes acceptance testing during release control before being deployed to production. This is a frequently tested distinction — acceptance testing happens at release control, not change control.',
  'Three-step change management: REQUEST (ask), CHANGE (approve), RELEASE (test and deploy). Testing happens at RELEASE.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q65: medium / apply / first_action — correct=0
-- IRT: b=0.0+0.3+0.3=0.6, a=1.3+0.2=1.5, c=0.20
(
  8,
  'software_acquisition',
  'Your organization relies on several open-source libraries in its production applications. A major vulnerability is discovered in one of these libraries, similar to the Heartbleed vulnerability in OpenSSL. What should the organization do FIRST?',
  '["Identify all applications using the affected library by consulting the Software Bill of Materials (SBOM)", "Immediately shut down all applications that might use the vulnerable library", "Begin developing an in-house replacement for the open-source library", "Contact the open-source project maintainers and wait for an official patch"]'::jsonb,
  0,
  'The first step is identifying the scope of impact by consulting the SBOM (Software Bill of Materials), which inventories all components and dependencies used in applications. Without knowing which applications use the vulnerable library, you cannot prioritize remediation. Shutting down all applications is too disruptive, building replacements is too slow, and waiting for patches is too passive.',
  'SBOM = your ingredient list. When a recall happens, check the SBOM FIRST to know what is affected.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q66: medium / apply / scenario — correct=1
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
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

-- Q67: medium / understand / most_likely — correct=2
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
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

-- Q68: medium / apply / calculation — correct=3
-- IRT: b=0.0+0.3+0.4=0.7, a=1.3+0.3=1.6, c=0.20
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

-- Q69: medium / understand / comparison — correct=0
-- IRT: b=0.0+0.0+0.1=0.1, a=1.0+0.1=1.1, c=0.22
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

-- Q70: medium / apply / scenario — correct=1
-- IRT: b=0.0+0.3+0.2=0.5, a=1.3+0.2=1.5, c=0.20
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
),

-- ═══════════════════════════════════════════════════════════
-- HARD (20) — IRT b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: hard / analyze / scenario — correct=2
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+0.2=1.7, c=0.20
(
  8,
  'secure_sdlc',
  'A large defense contractor is developing a mission-critical weapons guidance system. Requirements are well-defined and unlikely to change, but the project involves significant technical risk due to novel algorithms. The system must pass formal certification before deployment. The project manager wants to use Agile for speed, but the security team has concerns. Which development methodology is MOST appropriate?',
  '["Pure Agile with two-week sprints, because speed of delivery is the primary business driver", "Waterfall, because the sequential approach guarantees all phases are completed before deployment", "Spiral, because it combines iterative prototyping with risk analysis at every cycle for high-risk projects", "Extreme Programming, because pair programming will catch algorithmic errors more quickly"]'::jsonb,
  2,
  'The Spiral model is ideal for large, complex, high-risk projects with stable requirements but significant technical risk. It iterates through planning, risk analysis, engineering, and evaluation in each cycle, making risk management central. Waterfall lacks iterative risk analysis. Agile and XP are better for evolving requirements, not rigid certification-required environments.',
  'SPIRAL = best for high-RISK, high-COMPLEXITY projects. Risk analysis is baked into every cycle.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q72: hard / analyze / first_action — correct=3
-- IRT: b=1.5+0.6+0.3=2.4, a=1.5+0.2=1.7, c=0.20
(
  8,
  'devsecops',
  'A financial services company with 200 developers is experiencing a high rate of security vulnerabilities reaching production despite having SAST tools in their pipeline. Analysis shows developers often ignore SAST findings because of a 40% false positive rate, and no one reviews the results systematically. The pipeline does not block builds on security findings. What should the security team do FIRST?',
  '["Replace the current SAST tool with a more expensive enterprise solution from a different vendor", "Add DAST testing to the pipeline to catch what SAST misses in the running application", "Remove the SAST tool entirely since developers are ignoring it and it adds no value", "Tune the SAST tool rules to reduce false positives and configure the pipeline to block builds on high-severity findings"]'::jsonb,
  3,
  'The root cause is that high false positive rates have eroded developer trust, and the lack of enforcement means findings can be ignored. The first step is tuning the tool to reduce false positives (improving signal quality) and adding pipeline gates that block builds on high-severity findings (adding enforcement). This addresses both the trust problem and the enforcement gap.',
  'Security tools must be TUNED and ENFORCED. A tool that cries wolf too often gets ignored. Reduce noise, then enforce.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q73: hard / analyze / tlatm — correct=0
-- IRT: b=1.5+0.6+0.5=2.6, a=1.5+0.4=1.9, c=0.20
(
  8,
  'software_acquisition',
  'As the CISO, your organization is evaluating whether to use a COTS product or build a custom solution for a sensitive intelligence analysis platform. The COTS product is mature and well-reviewed but the vendor will not provide source code. A custom solution would take two years and cost three times as much. How should you advise the executive team?',
  '["Recommend the COTS product with a source code escrow agreement, independent security assessment, and strong contractual SLA protections as risk mitigations", "Recommend the custom solution because security-sensitive systems should never use COTS products", "Recommend the COTS product without additional mitigations since vendor reputation is sufficient assurance", "Defer the decision until the vendor agrees to open-source their product for your organization"]'::jsonb,
  0,
  'A manager balances cost, risk, and timeline. The COTS product with proper mitigations (escrow, security assessment, SLAs) provides acceptable risk at lower cost and faster delivery. Building custom is not always more secure and costs significantly more. The key is implementing appropriate risk mitigations rather than avoiding COTS entirely or accepting it without controls.',
  NULL,
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q74: hard / apply / first_action — correct=1
-- IRT: b=1.5+0.3+0.3=2.1, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_coding',
  'During a security audit, a critical covert timing channel is discovered in a multi-tenant SaaS application. An attacker on one tenant can measure the response time of shared database queries to infer whether another tenant''s records exist for specific search criteria. What should the development team address FIRST?',
  '["Implement database encryption to prevent direct access to other tenants'' data", "Normalize response times across all queries to eliminate timing-based information leakage", "Add additional logging to detect when timing analysis is being performed", "Deploy a web application firewall with timing-attack detection signatures"]'::jsonb,
  1,
  'Covert timing channels exploit variations in processing time to leak information. The most direct first fix is normalizing response times so that queries take the same duration regardless of whether matching data exists. This eliminates the timing signal the attacker relies on. Encryption does not prevent timing analysis, logging is detective not preventive, and WAFs cannot reliably detect timing attacks.',
  'Covert TIMING channels = time differences leak secrets. Fix = make ALL responses take the SAME time.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q75: hard / analyze / scenario — correct=2
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+0.2=1.7, c=0.20
(
  8,
  'database_security',
  'A government intelligence agency uses a multilevel security database. An analyst with SECRET clearance queries a personnel table for an employee record. The system returns a record showing the employee''s cover assignment. However, at the TOP SECRET level, the same employee ID shows a different classified assignment. An administrator reviews audit logs and sees that the lower-cleared analyst has been systematically querying records and correlating results with publicly available information. What database security techniques are being used and attacked?',
  '["Database normalization is protecting data while SQL injection is being used to attack it", "Cell suppression is hiding values while a buffer overflow is being used to bypass controls", "Polyinstantiation is protecting data at different levels while an inference attack is being used to derive classified information", "Database views are restricting access while an aggregation attack is combining permitted queries"]'::jsonb,
  2,
  'Polyinstantiation is the protection mechanism — providing different versions of the same record at different classification levels. The attack is inference — the analyst uses logical deduction, correlating query results with external information to derive classified data. This is sophisticated because the analyst never directly accesses classified data but reasons their way to it.',
  'Polyinstantiation PROTECTS by showing different versions. Inference ATTACKS by deducing what the hidden version contains.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q76: hard / analyze / except_not — correct=3
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+(-0.1)=1.4, c=0.25
(
  8,
  'change_management',
  'All of the following are components of formal change management EXCEPT:',
  '["Request control, where change requests are formally submitted and documented", "Change control, where the Change Advisory Board reviews and approves changes", "Release control, where acceptance testing validates changes before production deployment", "Configuration audit, which verifies that system components match documented baselines"]'::jsonb,
  3,
  'Configuration audit is a component of configuration management, not change management. The three components of formal change management are: request control (submitting changes), change control (reviewing and approving changes via the CAB), and release control (acceptance testing before deployment). Configuration management and change management are related but distinct processes.',
  'Change management = REQUEST, CHANGE, RELEASE. Configuration audit belongs to CONFIGURATION management, not change management.',
  'analyze',
  'except_not',
  'hard',
  1.40, 2.30, 0.25,
  'ai_generated', true
),

-- Q77: hard / apply / scenario — correct=0
-- IRT: b=1.5+0.3+0.2=2.0, a=1.3+0.2=1.5, c=0.20
(
  8,
  'containerization',
  'A security architect is reviewing a Kubernetes deployment for a healthcare application handling PHI. The review reveals that containers share a host kernel, container images include unnecessary system utilities, secrets are stored as environment variables in plaintext, and inter-container communication is unencrypted on the internal network. Which finding poses the GREATEST risk?',
  '["Secrets stored as plaintext environment variables, because any process in the container or host can read them and they appear in logs and configuration dumps", "Containers sharing a host kernel, because this is the standard Kubernetes architecture and cannot be changed", "Container images including unnecessary utilities, because this slightly increases the attack surface", "Unencrypted inter-container communication, because internal network traffic is typically trusted"]'::jsonb,
  0,
  'Storing secrets as plaintext environment variables is the greatest risk because they are easily exposed through process listings, container inspection, logging, crash dumps, and orchestration API queries. Any compromise of the container or host immediately reveals all credentials. Kubernetes provides Secrets objects and integration with external vaults specifically to address this risk.',
  'NEVER store secrets in plaintext env vars. Use Kubernetes Secrets or external vaults. Env vars are NOT secret — they leak everywhere.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q78: hard / analyze / most_likely — correct=1
-- IRT: b=1.5+0.6+0.1=2.2, a=1.5+0.1=1.6, c=0.22
(
  8,
  'oop_security',
  'A security analyst reviewing an object-oriented application discovers that a subclass has overridden a security validation method from its parent class. The overridden method accepts all input without validation, effectively bypassing the security controls inherited from the parent. This vulnerability is MOST LIKELY a consequence of which OOP concept being misused?',
  '["Encapsulation, because internal data is not properly hidden from external access", "Inheritance combined with polymorphism, because the subclass overrides inherited security behavior with weaker controls", "Abstraction, because the security complexity is hidden from the developer", "Cohesion, because the class is performing too many unrelated functions"]'::jsonb,
  1,
  'This is a misuse of inheritance and polymorphism together. Inheritance allows the subclass to receive the parent''s security method, but polymorphism allows the subclass to override it with different behavior. When the override weakens security controls, it creates a vulnerability. This is why security-critical methods should be marked as final/sealed to prevent override.',
  'Inheritance gives you the security method. Polymorphism lets you OVERRIDE it. Mark security methods as FINAL to prevent weakening.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q79: hard / apply / first_action — correct=2
-- IRT: b=1.5+0.3+0.3=2.1, a=1.3+0.2=1.5, c=0.20
(
  8,
  'owasp_top_10',
  'A penetration test against a web application reveals that the server returns different error messages for valid usernames with wrong passwords versus completely invalid usernames. An attacker could use this to enumerate valid user accounts before attempting credential attacks. What should the development team fix FIRST?',
  '["Implement account lockout after five failed login attempts to prevent brute force attacks", "Add CAPTCHA to the login page to slow down automated enumeration attempts", "Return identical generic error messages for all failed login attempts regardless of whether the username exists", "Enable multi-factor authentication for all user accounts to add a second verification layer"]'::jsonb,
  2,
  'The most direct fix for username enumeration is ensuring the application returns identical error messages for all failed login attempts, whether the username is valid or not. This eliminates the information leakage that enables enumeration. Account lockout, CAPTCHA, and MFA are all valuable defense-in-depth controls but do not address the root cause of the enumeration vulnerability.',
  'Username enumeration fix: make ALL login failures look IDENTICAL. "Invalid credentials" — never reveal which part was wrong.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q80: hard / analyze / scenario — correct=3
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+0.2=1.7, c=0.20
(
  8,
  'advanced_testing',
  'A software development organization wants to adopt a formal code review process. They require specific roles including a moderator, reader, author, and inspector. The process has defined entry criteria (code compiles, meets coding standards), individual preparation, a group review meeting, and formal exit criteria. Defect metrics are tracked and analyzed. Which process does this BEST describe?',
  '["Pair programming, where two developers write and review code simultaneously at one workstation", "Ad hoc peer review, where developers informally review each other''s code as time permits", "Walkthrough, where the code author presents their code and explains the logic to the team", "Fagan inspection, which is a formal structured review process with defined roles, entry and exit criteria, and defect tracking"]'::jsonb,
  3,
  'A Fagan inspection is the most formal type of code review, characterized by defined roles (moderator, reader, author, inspector), formal entry and exit criteria, mandatory individual preparation, structured group review meetings, and systematic defect tracking. It is distinguished from walkthroughs (author-led, less formal) and ad hoc reviews (informal, no structure).',
  'FAGAN = the FORMAL version of code review. Defined roles + entry/exit criteria + metrics = Fagan inspection.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q81: hard / apply / calculation — correct=0
-- IRT: b=1.5+0.3+0.4=2.2, a=1.3+0.3=1.6, c=0.20
(
  8,
  'advanced_testing',
  'A software module contains 12,000 lines of code. After extensive testing, 18 confirmed defects have been identified. What is the defect density, and how does it compare to an industry benchmark of 2 defects per KLOC?',
  '["1.5 defects per KLOC, which is below the benchmark and indicates higher quality", "2.0 defects per KLOC, which exactly meets the industry benchmark", "3.0 defects per KLOC, which exceeds the benchmark and indicates lower quality", "0.5 defects per KLOC, which is significantly below the benchmark"]'::jsonb,
  0,
  'Defect density = Number of defects / Size in KLOC. Here: 18 defects / 12 KLOC = 1.5 defects per KLOC. Since the industry benchmark is 2 defects per KLOC, this module is below the benchmark, indicating relatively higher code quality. Lower defect density is desirable.',
  'Defect Density = Defects / KLOC. LOWER is BETTER. Think: fewer bugs per thousand lines = cleaner code.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q82: hard / analyze / tlatm — correct=1
-- IRT: b=1.5+0.6+0.5=2.6, a=1.5+0.4=1.9, c=0.20
(
  8,
  'devsecops',
  'As the security director, you are reviewing the organization''s software assurance program. The development teams have strong SAST and DAST tools, but vulnerabilities in third-party libraries account for 60% of production security incidents. The development teams argue that they cannot control third-party code quality. What is the MOST effective management action?',
  '["Ban all third-party libraries and require developers to write all code from scratch", "Implement mandatory Software Composition Analysis (SCA) in the CI/CD pipeline with automated blocking of builds containing known vulnerable dependencies", "Accept the risk since third-party libraries are necessary for modern development", "Assign a single developer to manually review all third-party library source code before use"]'::jsonb,
  1,
  'As a manager, the most effective action is implementing Software Composition Analysis (SCA) tools that automatically scan for known vulnerabilities in third-party dependencies and block builds that include vulnerable versions. This is automated, scalable, and addresses the specific risk. Banning all libraries is impractical, accepting the risk is negligent, and manual review does not scale.',
  NULL,
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q83: hard / analyze / scenario — correct=2
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+0.2=1.7, c=0.20
(
  8,
  'api_security',
  'A financial technology company exposes a REST API for third-party payment integrations. During a security review, the team discovers that the API accepts XML input and processes it using a parser that resolves external entities. An attacker could craft an XML payload with an external entity reference to read local files from the server. What vulnerability category is this, and what is the PRIMARY fix?',
  '["SQL injection; implement parameterized queries to separate code from data", "Cross-site scripting; implement output encoding on all API responses", "XML External Entity (XXE) injection; disable external entity resolution in the XML parser configuration", "Server-side request forgery; implement URL allowlisting for all outbound connections"]'::jsonb,
  2,
  'This is an XML External Entity (XXE) injection vulnerability. When an XML parser resolves external entities, attackers can reference local files, internal network resources, or trigger denial-of-service conditions. The primary fix is disabling external entity resolution (and DTD processing) in the XML parser configuration. This is a common vulnerability in APIs that accept XML input.',
  'XXE = XML External Entity. Fix: disable external entity resolution in the XML parser. If you do not need external entities, turn them OFF.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q84: hard / apply / scenario — correct=3
-- IRT: b=1.5+0.3+0.2=2.0, a=1.3+0.2=1.5, c=0.20
(
  8,
  'secure_sdlc',
  'An organization is evaluating its software assurance practices using OWASP SAMM. The assessment reveals that the Governance business function is at maturity level 1, while Implementation is at level 3. The security manager observes that developers have excellent secure coding skills but there are no organizational policies governing how security is integrated into projects. What does this imbalance indicate?',
  '["The organization is performing well because implementation skills matter more than governance", "The assessment methodology is flawed because governance and implementation cannot be measured separately", "The organization should reduce its implementation maturity to match governance", "The organization has strong tactical security skills but lacks strategic direction, creating inconsistent security outcomes across projects"]'::jsonb,
  3,
  'SAMM assesses five business functions (Governance, Design, Implementation, Verification, Operations) independently. A high implementation score with low governance indicates strong individual skills but no organizational framework to ensure consistency. Without governance (policies, standards, metrics), security outcomes depend on individual developer competence rather than organizational processes.',
  'SAMM balance matters: strong coding skills + weak governance = inconsistent security. You need the policies AND the skills.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q85: hard / analyze / first_action — correct=0
-- IRT: b=1.5+0.6+0.3=2.4, a=1.5+0.2=1.7, c=0.20
(
  8,
  'secure_coding',
  'A security review of a high-traffic e-commerce application reveals multiple vulnerabilities: stored XSS in product reviews, SQL injection in the search function, CSRF on the account settings page, and insecure direct object references in order history. Limited developer resources mean fixes must be prioritized. Which vulnerability should be remediated FIRST?',
  '["SQL injection in the search function, because it provides direct access to the database and can lead to complete data breach", "Stored XSS in product reviews, because it affects all users who view the reviews", "CSRF on account settings, because it allows unauthorized account modifications", "Insecure direct object references, because they allow users to access other users'' order data"]'::jsonb,
  0,
  'SQL injection should be fixed first because it provides the most severe potential impact — direct database access that can lead to data extraction, modification, deletion, or even command execution on the database server. While all four vulnerabilities are serious, SQL injection has the highest potential for catastrophic data breach and system compromise.',
  'Prioritize by IMPACT: SQLi = database access = highest impact. Fix the vulnerability that can cause the most damage first.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q86: hard / apply / scenario — correct=1
-- IRT: b=1.5+0.3+0.2=2.0, a=1.3+0.2=1.5, c=0.20
(
  8,
  'database_security',
  'A hospital database system experiences a failure during a batch update that was modifying insurance information for 500 patient records. When the system recovers, the database administrator finds that 247 records were updated and 253 were not. The DBA expected either all 500 or zero records to be updated. Which ACID property has been violated?',
  '["Durability, because the committed changes did not persist through the failure", "Atomicity, because the transaction was partially completed instead of being all-or-nothing", "Isolation, because other transactions could see the partial update during the failure", "Consistency, because the database rules were violated by having mixed update states"]'::jsonb,
  1,
  'Atomicity requires that a transaction is an indivisible unit — either all operations complete or none do. Having 247 of 500 records updated represents a partial transaction, which violates atomicity. A properly implemented atomic transaction would have rolled back all changes when the failure occurred, leaving zero records updated. The database recovery mechanism should enforce this.',
  'ATOMICITY violation = partial completion. ALL 500 or NONE. 247 out of 500 = atomicity failure.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q87: hard / analyze / comparison — correct=2
-- IRT: b=1.5+0.6+0.1=2.2, a=1.5+0.1=1.6, c=0.22
(
  8,
  'sast_dast_iast',
  'A security manager is building a comprehensive application security testing program and needs to understand the tradeoffs between SAST, DAST, IAST, and RASP. Which statement MOST accurately compares their roles in a defense-in-depth strategy?',
  '["SAST and DAST are redundant — organizations should choose one based on whether they have source code access", "RASP replaces the need for SAST and DAST because it provides real-time protection in production", "SAST finds code-level flaws during development, DAST finds runtime issues in staging, IAST combines both during QA, and RASP provides runtime defense in production — they are complementary across the lifecycle", "IAST is always superior to SAST and DAST individually and should be the only testing tool used"]'::jsonb,
  2,
  'Each testing approach has a specific role in the application lifecycle and they are complementary, not redundant. SAST catches code issues early in development (shift-left). DAST finds runtime and configuration issues in staging. IAST provides comprehensive coverage during QA testing. RASP provides real-time production defense. A mature program uses all four at appropriate lifecycle stages.',
  'SAST/DAST/IAST/RASP = different tools for different lifecycle stages. Like security guards at different doors of the building.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q88: hard / analyze / except_not — correct=3
-- IRT: b=1.5+0.6+0.2=2.3, a=1.5+(-0.1)=1.4, c=0.25
(
  8,
  'buffer_overflow',
  'All of the following are effective mitigations against buffer overflow attacks EXCEPT:',
  '["Address Space Layout Randomization (ASLR) to randomize memory addresses of executables", "Input validation and bounds checking to prevent writing beyond allocated memory", "Using memory-safe programming languages like Java or Rust instead of C/C++", "Implementing output encoding to prevent malicious scripts from executing in browsers"]'::jsonb,
  3,
  'Output encoding is a defense against Cross-Site Scripting (XSS), not buffer overflows. Buffer overflow mitigations include ASLR (randomizing memory addresses), input validation and bounds checking (preventing oversized input), memory-safe languages (which manage memory automatically), stack canaries, and Data Execution Prevention (DEP). Output encoding addresses a completely different vulnerability class.',
  'Output encoding = XSS defense. Buffer overflow defenses = ASLR, bounds checking, safe languages, DEP, stack canaries.',
  'analyze',
  'except_not',
  'hard',
  1.40, 2.30, 0.25,
  'ai_generated', true
),

-- Q89: hard / apply / scenario — correct=0
-- IRT: b=1.5+0.3+0.2=2.0, a=1.3+0.2=1.5, c=0.20
(
  8,
  'development_methodologies',
  'A software organization has been using ad hoc development processes. After a costly project failure, management decides to improve. They hire a process improvement consultant who recommends a five-phase approach: first understand the current situation, then diagnose problems, establish improvement plans, carry out the improvements, and finally capture lessons learned. Which improvement model does this align with?',
  '["The IDEAL model with its five phases: Initiating, Diagnosing, Establishing, Acting, and Learning", "The PDCA cycle with its four phases: Plan, Do, Check, Act", "The CMMI staged representation with its five maturity levels", "The Agile retrospective process conducted at the end of each sprint"]'::jsonb,
  0,
  'The IDEAL model consists of five phases: Initiating (understanding the current situation and building sponsorship), Diagnosing (assessing current practices and identifying improvements), Establishing (planning the improvement actions), Acting (implementing the improvements), and Learning (capturing lessons and refining the approach). It is specifically designed for process improvement initiatives.',
  'IDEAL = Initiating, Diagnosing, Establishing, Acting, Learning. Five phases of process improvement.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q90: hard / analyze / most_likely — correct=1
-- IRT: b=1.5+0.6+0.1=2.2, a=1.5+0.1=1.6, c=0.22
(
  8,
  'secure_coding',
  'A development team uses code obfuscation to protect intellectual property in a distributed desktop application. They applied lexical obfuscation (renaming variables), data obfuscation (restructuring data types), and control flow obfuscation (reordering execution logic). An attacker successfully deobfuscates the application after moderate effort. Which obfuscation technique MOST LIKELY failed first, enabling further analysis?',
  '["Control flow obfuscation, because reordered logic is easiest to reverse-engineer", "Lexical obfuscation, because cosmetic changes like variable renaming are the weakest and easiest to undo", "Data obfuscation, because restructured data types are trivial to reconstruct", "All three failed simultaneously because obfuscation provides no meaningful protection"]'::jsonb,
  1,
  'Lexical obfuscation is the weakest form because it only makes cosmetic changes (renaming variables, removing comments). These changes do not alter program logic and can be partially reversed through automated analysis. Once variables are given meaningful names again, the code becomes readable. Data obfuscation is stronger, and control flow obfuscation is the strongest of the three.',
  'Obfuscation strength: Lexical (weakest, cosmetic) < Data (moderate, structural) < Control Flow (strongest, logic reordering).',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD (10) — IRT b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: very_hard / analyze / scenario — correct=2
-- IRT: b=2.5+0.6+0.2=3.0 (clamped), a=1.5+0.2=1.7, c=0.20
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

-- Q92: very_hard / analyze / tlatm — correct=3
-- IRT: b=2.5+0.6+0.5=3.0 (clamped), a=1.5+0.4=1.9, c=0.20
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

-- Q93: very_hard / analyze / scenario — correct=0
-- IRT: b=2.5+0.6+0.2=3.0 (clamped), a=1.5+0.2=1.7, c=0.20
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

-- Q94: very_hard / analyze / first_action — correct=1
-- IRT: b=2.5+0.6+0.3=3.0 (clamped), a=1.5+0.2=1.7, c=0.20
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

-- Q95: very_hard / apply / calculation — correct=2
-- IRT: b=2.5+0.3+0.4=3.0 (clamped), a=1.3+0.3=1.6, c=0.20
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
),

-- Q96: very_hard / analyze / scenario — correct=3
-- IRT: b=2.5+0.6+0.2=3.0 (clamped), a=1.5+0.2=1.7, c=0.20
(
  8,
  'api_security',
  'A large e-commerce platform exposes a GraphQL API for its mobile applications. A security assessment reveals that the API allows deeply nested queries that can cause exponential database joins, authenticated users can query any other user''s data by modifying the user ID parameter, and the API returns detailed error messages including stack traces. The security team has resources to address only ONE issue immediately. Which vulnerability should be fixed FIRST?',
  '["Deep query nesting causing exponential database joins, because it enables denial-of-service attacks", "Detailed error messages with stack traces, because they help attackers understand internal architecture", "All three should be fixed simultaneously since they are equally severe", "Broken object-level authorization allowing access to any user''s data, because it directly enables mass data breach of customer information"]'::jsonb,
  3,
  'Broken object-level authorization (IDOR/BOLA) is the most critical because it allows any authenticated user to access any other user''s data by simply changing the user ID. This can lead to mass data breach affecting all customers. DoS through nested queries causes availability issues, and error messages aid attackers, but neither directly exposes customer data at the scale that broken authorization does.',
  'Prioritize by IMPACT: direct data exposure > denial of service > information leakage. Fix the one that causes mass data breach first.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q97: very_hard / analyze / tlatm — correct=0
-- IRT: b=2.5+0.6+0.5=3.0 (clamped), a=1.5+0.4=1.9, c=0.20
(
  8,
  'change_management',
  'As the IT governance director, you discover that the organization''s change management process has become so bureaucratic that developers routinely wait 6-8 weeks for CAB approval on minor changes. This has led to three consequences: developers are bypassing the process for urgent fixes, security reviews are being skipped to save time, and the business is losing competitive advantage due to slow feature delivery. How should you restructure the process?',
  '["Implement a tiered change classification system with expedited approval paths for low-risk changes while maintaining rigorous review for high-risk changes", "Eliminate the CAB entirely and trust developers to make good security decisions independently", "Maintain the current process unchanged because security must always take priority over speed", "Outsource change management to a third-party governance firm to remove internal political conflicts"]'::jsonb,
  0,
  'The correct management approach is implementing tiered change classification. Low-risk changes (minor UI updates, documentation) can have expedited approval, while high-risk changes (security controls, database schema, authentication) maintain rigorous CAB review. This balances security governance with business agility, addressing the root cause of process bypass while preserving security for critical changes.',
  NULL,
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q98: very_hard / analyze / scenario — correct=1
-- IRT: b=2.5+0.6+0.2=3.0 (clamped), a=1.5+0.2=1.7, c=0.20
(
  8,
  'containerization',
  'A cloud-native application uses a microservices architecture with 50 containerized services orchestrated by Kubernetes. During a security assessment, the team discovers that a compromised container was able to access the Kubernetes API server, enumerate all running pods, read secrets from other namespaces, and ultimately pivot to a database container holding customer PII. Analysis reveals the compromised container was running with a default service account that had cluster-wide read permissions. Which combination of controls would MOST effectively prevent this attack chain?',
  '["Encrypting all container images and implementing mandatory code signing for all deployments", "Implementing least-privilege RBAC on service accounts, enabling namespace isolation with network policies, and mounting service account tokens only when explicitly needed", "Deploying a container-aware firewall at the cluster perimeter to filter all inbound traffic", "Implementing mandatory vulnerability scanning of all container images before deployment"]'::jsonb,
  1,
  'The attack succeeded because of overly permissive service accounts and lack of namespace isolation. The fix requires: RBAC with least privilege (restricting what each service account can access), network policies (preventing cross-namespace communication), and disabling automatic service account token mounting (reducing API server exposure). These controls address each step of the attack chain.',
  'Container security triad: RBAC (who), Network Policies (where), Service Account controls (how). Lock down all three.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: very_hard / analyze / most_likely — correct=2
-- IRT: b=2.5+0.6+0.1=3.0 (clamped), a=1.5+0.1=1.6, c=0.22
(
  8,
  'secure_sdlc',
  'An organization uses a hybrid development approach combining Agile sprints for feature development with waterfall-style gates for security certification. During Sprint 12, a developer introduces a new authentication module that passes all unit tests and integration tests. However, during the waterfall security gate review, the module is found to have a fundamental design flaw — it stores session tokens in client-side localStorage, making them vulnerable to XSS-based token theft. Redesigning the module will delay the release by two sprints. What does this scenario MOST LIKELY indicate about the organization''s SDLC?',
  '["The Agile methodology is fundamentally incompatible with security requirements", "The security gate review process is too strict and should accept known risks to maintain velocity", "Security requirements and threat modeling were not adequately integrated into the sprint planning and design phases, causing a late discovery of an architectural flaw", "The waterfall security gate should be removed and replaced with automated DAST scanning"]'::jsonb,
  2,
  'This scenario illustrates the failure to shift security left. If security requirements (such as secure session token storage) and threat modeling had been part of sprint planning, the design flaw would have been caught during Sprint 12''s design phase rather than at a downstream gate. The two-sprint delay is the cost of finding architectural issues late — exactly what shift-left aims to prevent.',
  'Late security discovery = shift-left failure. Security requirements and threat modeling must be part of SPRINT PLANNING, not just final gates.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),

-- Q100: very_hard / analyze / except_not — correct=3
-- IRT: b=2.5+0.6+0.2=3.0 (clamped), a=1.5+(-0.1)=1.4, c=0.25
(
  8,
  'database_security',
  'All of the following are valid countermeasures against database inference attacks EXCEPT:',
  '["Polyinstantiation to provide different data versions at different classification levels", "Cell suppression to hide specific values that could enable deductive reasoning", "Noise and perturbation to add random variations that mask true data patterns", "Database normalization to reduce data redundancy through first, second, and third normal forms"]'::jsonb,
  3,
  'Database normalization (1NF, 2NF, 3NF) is a data design technique to reduce redundancy and improve integrity — it has nothing to do with preventing inference attacks. Polyinstantiation prevents inference by hiding data absence, cell suppression hides specific values that could enable deduction, and noise/perturbation masks patterns that analysts could exploit. Normalization is good database design but not a security countermeasure against inference.',
  'Inference defenses: Polyinstantiation, Cell Suppression, Noise/Perturbation, Context-dependent access control. Normalization = data design, NOT inference defense.',
  'analyze',
  'except_not',
  'very_hard',
  1.40, 3.00, 0.25,
  'ai_generated', true
);
