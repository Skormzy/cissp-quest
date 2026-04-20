INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;