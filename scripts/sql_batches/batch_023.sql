INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'kri_kpi',
  'What is the KEY difference between a Key Performance Indicator (KPI) and a Key Risk Indicator (KRI)?',
  '["KPIs are qualitative while KRIs are quantitative metrics", "KPIs are used by auditors while KRIs are used by management", "KPIs are backward-looking measures of past performance while KRIs are forward-looking measures of risk exposure", "KPIs apply to technical controls while KRIs apply to administrative controls"]'::jsonb,
  2,
  'Key Performance Indicators (KPIs) are backward-looking metrics that measure whether performance targets have been achieved, providing insights about events that have already occurred. Key Risk Indicators (KRIs) are forward-looking metrics that monitor the level of exposure to operational risk and help anticipate future risk conditions. Both are essential for comprehensive security management.',
  'KPI = Past performance (rearview mirror). KRI = Risk indicator (windshield, looking ahead).',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),
(
  6,
  'validation_verification',
  'Which statement BEST captures the difference between validation and verification in software security?',
  '["Validation checks code quality while verification checks code security", "Validation is performed by developers while verification is performed by testers", "Validation uses automated tools while verification uses manual review", "Validation asks if we are building the right product while verification asks if we are building the product right"]'::jsonb,
  3,
  'Validation confirms that the right product is being built by ensuring business requirements are correctly captured. Verification confirms that the product is being built correctly by developing confidence that the implementation meets all defined requirements. Verification includes the three Cs: completeness, correctness, and consistency.',
  'VaLidation = the Right product (L for Legit requirements). VeRification = built Right (R for Right implementation).',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),
(
  6,
  'interface_testing',
  'A QA team is testing a new e-commerce application and needs to verify that the payment processing module correctly communicates with the inventory management module. Both modules have been individually unit tested. What type of testing should they perform next?',
  '["Interface testing to verify proper communication between the modules", "Acceptance testing to validate against business requirements", "Regression testing to verify existing functionality still works", "Fuzz testing to identify crash conditions in the payment module"]'::jsonb,
  0,
  'Interface testing verifies that components connect and communicate properly with each other. Since both modules have been unit tested individually, the next logical step is to test how they interact. This includes verifying API calls, data exchange formats, error handling between modules, and ensuring expected outputs from one module serve as valid inputs to the other.',
  'Unit = one piece alone. Interface = pieces talking to each other. Integration = pieces working together as a group.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),
(
  6,
  'audit_standards',
  'All of the following are trust services criteria evaluated in a SOC 2 report EXCEPT:',
  '["Availability", "Profitability", "Confidentiality", "Privacy"]'::jsonb,
  1,
  'The five trust services criteria for SOC 2 reports are Security (always included), Availability, Confidentiality, Processing Integrity, and Privacy. Security is mandatory while the others are optional based on the engagement scope. Profitability is not a trust services criterion and relates to financial performance, not security controls.',
  'SOC 2 Trust Services = SACPP: Security (Always), Availability, Confidentiality, Processing integrity, Privacy.',
  'understand',
  'except_not',
  'easy',
  0.90, -1.30, 0.25,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'A security analyst has been asked to run a vulnerability scan on a production database server during business hours. What should be the FIRST step before executing the scan?',
  '["Configure the scanner to use maximum intensity for thorough results", "Begin the scan immediately to meet the project deadline", "Obtain proper authorization and schedule the scan with stakeholders", "Disable the host-based intrusion detection system to avoid false alerts"]'::jsonb,
  2,
  'Before conducting any vulnerability scan on production systems, the first step is always to obtain proper authorization and coordinate with stakeholders. Scanning production systems can impact performance and availability, so scheduling and approval are essential. Running scans without authorization can disrupt operations and may violate organizational policies.',
  'Before scanning: Get the Green light. Authorization Always comes first — A before S (Approval before Scanning).',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;