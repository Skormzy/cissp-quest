INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'owasp_top_10',
  'A web application security assessment reveals that the application constructs SQL queries by directly concatenating user input from form fields. The development team argues that their web application firewall blocks all known SQL injection patterns. A senior developer also notes they validate input length on the client side. The security team insists the code must be changed. Who is correct, and why?',
  '["The development team is correct — the WAF combined with input validation provides adequate protection", "The security team is correct — parameterized queries must be used because WAFs can be bypassed, client-side validation can be circumvented, and defense in depth requires fixing the root cause in code", "Both are partially correct — the WAF is sufficient for now but parameterized queries should be added in the next development cycle", "The security team is overreacting — SQL injection is a well-understood attack and modern WAFs can prevent it completely"]'::jsonb,
  1,
  'The security team is correct. String concatenation for SQL queries is the root vulnerability. WAFs are a compensating control that can be bypassed through encoding, obfuscation, and novel attack patterns. Client-side validation is trivially bypassed by modifying requests directly. Parameterized queries prevent SQL injection at the code level by separating data from commands — the input physically cannot be interpreted as SQL code. This is defense in depth: fix the code AND keep the WAF. No WAF provides complete protection against all injection variants.',
  'Parameterized queries = the CURE for SQL injection. WAFs and validation = BANDAIDS. Fix the root cause in code, always.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  8,
  'development_methodologies',
  'An organization needs to develop a critical healthcare application with strict regulatory requirements. Requirements are well-documented and unlikely to change. The application must pass FDA validation before deployment. Which development methodology BEST fits this project?',
  '["Waterfall, because its sequential phases with formal documentation and gate reviews align with regulatory validation requirements", "Agile Scrum, because its iterative sprints allow for rapid adaptation to changing requirements", "DevOps, because continuous integration and deployment accelerates time to market", "Spiral, because its risk-driven approach is best for projects with uncertain requirements"]'::jsonb,
  0,
  'Waterfall is ideal for projects with stable requirements and regulatory validation needs. Its sequential phases (Requirements, Design, Implementation, Testing, Deployment) with formal documentation at each gate align with FDA validation processes that require traceable requirements, design documents, and test evidence. Agile''s strength — adapting to changing requirements — isn''t needed here. DevOps accelerates delivery but doesn''t address regulatory documentation. Spiral is for uncertain requirements, which contradicts the stated scenario.',
  'Stable requirements + regulatory validation = WATERFALL. Changing requirements + speed = AGILE. Match methodology to project characteristics.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  8,
  'devsecops',
  'As the VP of Engineering, your organization''s CI/CD pipeline currently has no security gates. The security team wants to add SAST, DAST, SCA, container scanning, and secrets detection to every pipeline run. The development team pushes back, saying adding five security scans will increase build times from 10 minutes to 45 minutes, destroying developer productivity. How should you resolve this conflict?',
  '["Side with the development team and skip security scanning to maintain productivity", "Side with the security team and mandate all five scans in every pipeline run regardless of build time impact", "Implement a tiered approach: fast scans (secrets detection, SCA) run on every commit, SAST runs on pull requests, and DAST plus container scanning run nightly or on release candidates", "Hire more security engineers to manually review code instead of automated scanning"]'::jsonb,
  2,
  'The tiered approach balances security and productivity by matching scan frequency to speed and impact. Secrets detection and SCA are fast (seconds) and critical for every commit. SAST takes longer but catches code-level issues — running on PRs catches problems before merge without blocking every commit. DAST and container scanning are slowest and most appropriate for nightly builds or release candidates. This delivers comprehensive coverage without destroying the developer feedback loop. Skipping security is negligent. Mandating everything on every commit is impractical. Manual review doesn''t scale.',
  'Security scanning = TIERED by speed. Fast scans on every commit, medium on PRs, slow on nightly/release. Don''t block developers unnecessarily.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'database_security',
  'A database developer is designing a medical records system. Different user groups need access to different subsets of patient data: doctors see all fields, nurses see vitals and medications but not billing, and billing staff see insurance and payment information but not clinical notes. The developer wants a solution that enforces these restrictions at the database level. Which approach is MOST appropriate?',
  '["Create separate database tables for each user group with only the fields they need", "Implement application-level access checks that filter query results before displaying to users", "Encrypt the restricted fields and only provide decryption keys to authorized user groups", "Create database views for each role that expose only the permitted columns and grant access to the views instead of the base tables"]'::jsonb,
  3,
  'Database views provide virtual tables that expose only specific columns (and optionally rows) from base tables. By creating role-specific views and granting access to views rather than base tables, access control is enforced at the database level. This is more secure than application-level checks because it protects against direct database access and SQL tools. Separate tables create data duplication and consistency issues. Application-level checks don''t protect against direct database queries. Field-level encryption is complex and doesn''t restrict what users can query.',
  'Views = virtual tables for ACCESS CONTROL. Show different columns to different roles. Database-level enforcement beats application-level.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  8,
  'secure_sdlc',
  'A security audit of a major e-commerce platform reveals that the development team has been deploying code directly to production without security testing for the past 18 months. The codebase has grown to 2 million lines of code across 15 microservices. Management wants all security issues found and fixed before the next release in 30 days. What should the security team recommend FIRST?',
  '["Conduct a comprehensive manual code review of all 2 million lines before the next release", "Perform risk-based triage by running automated SAST/SCA scans across all services, prioritize critical findings in customer-facing payment services first, and establish security gates for all future deployments", "Halt all development and releases until a complete security assessment is finished", "Hire an external penetration testing firm to test all 15 microservices simultaneously"]'::jsonb,
  1,
  'With 18 months of security debt across 2M lines and only 30 days, a risk-based approach is essential. Automated SAST/SCA provides broad coverage quickly, identifying the most critical issues. Prioritizing payment-facing services focuses limited time on the highest-risk areas. Establishing security gates prevents further debt accumulation. Manual review of 2M lines is impossible in 30 days. Halting development is disproportionate business disruption. External pen testing finds symptoms but doesn''t address the code-level root causes or establish ongoing processes.',
  '18 months of debt can''t be fixed in 30 days. TRIAGE: automate scanning, prioritize by risk, fix critical first, gate future releases.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;