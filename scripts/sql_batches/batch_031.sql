INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'security_metrics',
  'An application has 200 identified use cases. During testing, 160 use cases were executed and verified. What is the test coverage percentage?',
  '["60%", "70%", "90%", "80%"]'::jsonb,
  3,
  'Test coverage is calculated as (Number of Use Cases Tested / Total Number of Use Cases) x 100. In this case: (160 / 200) x 100 = 80%. This metric indicates that 80% of identified use cases have been tested, leaving 20% untested. Note that this metric is subjective because accurately enumerating all possible use cases is difficult.',
  'Test Coverage = (Tested / Total) x 100. Simple division — just watch for the right denominator.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),
(
  6,
  'testing_approaches',
  'A security assessor is testing a web application and has been given partial documentation including the database schema and API endpoint list, but not the full source code. The assessor can interact with the running application. Compared to black box and white box testing, which testing knowledge level BEST describes this engagement?',
  '["Gray box testing with partial knowledge of the target", "Black box testing with zero knowledge of the target", "White box testing with full knowledge of the target", "Double-blind testing with no team awareness"]'::jsonb,
  0,
  'Gray box (partial knowledge) testing provides the assessor with some information about the target, such as documentation, schemas, or limited code access, but not full visibility. This sits between black box (no information) and white box (full information). Having the database schema and API list without full source code is a classic gray box scenario.',
  'Gray box = some info, not all. Black = blind. White = full access. Gray is the middle ground.',
  'remember',
  'comparison',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),
(
  6,
  'log_review_siem',
  'Which technology BEST provides centralized collection, correlation, and analysis of log data from multiple sources to detect security events?',
  '["Network intrusion detection system (NIDS)", "Security Information and Event Management (SIEM)", "Data loss prevention (DLP) platform", "Endpoint detection and response (EDR) solution"]'::jsonb,
  1,
  'A SIEM (Security Information and Event Management) platform collects, normalizes, correlates, and analyzes log data from multiple sources across the enterprise to detect security events and support incident response. While NIDS monitors network traffic, DLP prevents data leakage, and EDR focuses on endpoints, only SIEM provides the centralized log correlation capability described.',
  'SIEM = Security Information and Event Management. It is the central brain that correlates logs from everywhere.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'A retail company has deployed a new point-of-sale system across 500 locations. The security team wants to ensure the systems comply with PCI-DSS requirements and identifies any configuration weaknesses. They need automated policy compliance evaluation across all endpoints. Which framework should they leverage?',
  '["Breach Attack Simulation for continuous penetration testing", "Manual configuration review of each individual endpoint", "Security Content Automation Protocol (SCAP) for automated compliance evaluation", "Annual third-party penetration test of one representative location"]'::jsonb,
  2,
  'SCAP (Security Content Automation Protocol) is a suite of interoperable specifications designed specifically for automating policy compliance evaluation, vulnerability management, and security measurement across large numbers of endpoints. Its components (including XCCDF for checklists, OVAL for testing, and CPE for platform identification) enable scalable, automated compliance checking that is essential for 500 locations.',
  'SCAP = automated compliance at scale. When you have hundreds of systems to check, automate with SCAP.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  6,
  'penetration_testing',
  'The CEO reads a news article about a competitor being breached and demands that the security team conduct an immediate penetration test of all production systems over the weekend. As the CISO, what is your BEST response?',
  '["Comply immediately and begin testing all production systems Friday evening", "Refuse to conduct any testing because it is not in the annual plan", "Suggest replacing the penetration test with a vulnerability assessment only", "Recommend a scoped penetration test with proper authorization, risk assessment, and change management procedures"]'::jsonb,
  3,
  'As a security manager, the best response balances the urgency with proper governance. Penetration tests can impact production systems and require explicit written authorization, scoping, and risk assessment. Rushing without proper planning risks service disruptions. However, simply refusing is not appropriate either. Recommending a properly scoped and authorized test addresses the CEO''s concern while following best practices.',
  'Think like a manager: balance urgency with process. Never skip authorization for pen tests, even under pressure.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;