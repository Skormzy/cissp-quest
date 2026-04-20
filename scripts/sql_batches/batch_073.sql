INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;