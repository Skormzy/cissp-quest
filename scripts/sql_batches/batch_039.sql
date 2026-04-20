INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'soc_reports',
  'A global insurance company is migrating its claims processing system to a third-party SaaS provider. The provider presents a SOC 2 Type II report covering security and availability. During the due diligence review, the security team notices that processing integrity and privacy were explicitly excluded from the report scope. The claims system handles PII, PHI, and financial calculations that determine claim payouts. What is the MOST significant risk of relying solely on this report?',
  '["The report does not cover availability, which is critical for claims processing", "The Type II period was too short to provide meaningful assurance", "The SOC 2 report should have been a SOC 3 report for this type of engagement", "The excluded processing integrity and privacy criteria are essential for a system handling PII, PHI, and financial calculations, leaving critical control areas unassured"]'::jsonb,
  3,
  'Processing integrity ensures that system processing is complete, valid, accurate, and timely — directly relevant to financial calculations determining claim payouts. Privacy controls are essential for PII and PHI handling. By excluding these criteria, the SOC 2 report leaves the most operationally critical control areas unassured. The insurance company should request a report that includes all five trust services criteria.',
  'SOC 2 criteria are optional except security. But optional does not mean unimportant. Match criteria to what the system actually does.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'As the CISO presenting to the board, you show that the organization''s vulnerability management KPIs have met all targets for three consecutive quarters. However, a KRI dashboard shows that the ratio of externally discovered vulnerabilities to internally discovered vulnerabilities has shifted from 10:90 to 40:60 over the same period. The total number of vulnerabilities found has also increased by 30%. From a strategic management perspective, what does this combination of metrics MOST likely indicate?',
  '["The internal scanning program is becoming less effective at finding vulnerabilities before external parties do, despite meeting remediation targets, suggesting a need to improve detection capabilities", "The organization''s security posture is excellent because all KPI targets are being met", "External researchers are becoming more skilled at finding vulnerabilities in all organizations", "The KRI data is unreliable and should be removed from the board report"]'::jsonb,
  0,
  'Meeting KPI targets while KRI trends deteriorate is a classic management trap. The shift in discovery ratio indicates that the internal scanning program is missing more vulnerabilities that external parties subsequently find. This suggests scanning coverage, frequency, or tool effectiveness has not kept pace with the growing attack surface. A strategic manager recognizes that satisfying backward-looking KPIs does not guarantee forward-looking risk posture.',
  'KPIs met but KRIs declining = false sense of security. KPIs look back, KRIs look forward. Both must be healthy.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'testing_approaches',
  'A defense contractor is developing software for a classified military system. The testing strategy requires branch coverage, condition coverage, function coverage, loop coverage, and statement coverage all reaching 100%. The security team has also mandated decision table analysis for all security-critical logic and state-based analysis for all communication protocol handlers. Despite achieving 100% code coverage metrics, a security flaw is discovered in production through misuse case testing that was not part of the original test plan. What does this situation BEST demonstrate?',
  '["The code coverage tools are inaccurate and should be replaced", "100% code coverage verifies that all code paths are executed but does not guarantee all attack vectors are tested, demonstrating the need for misuse case testing alongside coverage metrics", "The testing team was negligent in their coverage calculations", "Code coverage is a meaningless metric that should be abandoned"]'::jsonb,
  1,
  'Achieving 100% code coverage means every line, branch, condition, function, and loop was executed during testing. However, code coverage measures structural completeness, not security completeness. Misuse case testing examines the application from an attacker''s perspective, testing abuse scenarios that may involve valid code paths used in unintended ways. Coverage metrics and misuse case testing address fundamentally different risk dimensions.',
  '100% coverage does not equal 100% secure. Coverage = every path ran. Misuse case = every attack tried. Different dimensions of testing.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'penetration_testing',
  'During a red team engagement, the team discovers that a web application vulnerability allows them to pivot from the DMZ into the internal network, accessing a database containing encrypted customer payment card data. They also find the encryption keys stored on the same server. The engagement rules of engagement specify that PCI-scoped systems are out of bounds. The team has already inadvertently accessed data that proves the PCI environment is inadequately segmented. What should the red team do FIRST?',
  '["Extract the encryption keys to demonstrate the full severity of the segmentation failure", "Decrypt a sample of payment card records to prove the data is at risk", "Immediately cease testing in the PCI environment, document the segmentation failure and inadvertent access, and notify the client''s designated point of contact", "Continue testing other aspects of the internal network and include the PCI findings in the final report"]'::jsonb,
  2,
  'When a pen test team inadvertently crosses into an out-of-scope environment, the immediate action is to stop all activity in that environment, document what occurred (including how they got there), and notify the client immediately. Extracting keys or decrypting data would compound the scope violation and potentially violate PCI-DSS requirements. The segmentation failure finding is itself extremely valuable and demonstrates critical risk without further exploitation.',
  'Out of scope = stop immediately. The finding IS the proof. Document the path in, stop, and notify. Never escalate a scope violation.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'A security operations center processed 12,000 alerts in a month. Of these, 9,600 were determined to be false positives. Of the remaining 2,400 true alerts, 1,800 were detected within the 4-hour SLA while 600 exceeded it. Additionally, the team discovered 200 security events that generated no alerts at all. What is the false positive rate, and what is the MTTD SLA compliance rate?',
  '["False positive rate: 75%, SLA compliance: 80%", "False positive rate: 80%, SLA compliance: 90%", "False positive rate: 85%, SLA compliance: 70%", "False positive rate: 80%, SLA compliance: 75%"]'::jsonb,
  3,
  'False positive rate = False positives / Total alerts = 9,600 / 12,000 = 80%. MTTD SLA compliance = Alerts detected within SLA / Total true alerts = 1,800 / 2,400 = 75%. Note that the 200 undetected events (false negatives) are not counted in SLA compliance because they were never alerted on, but they represent a separate and equally critical metric to track.',
  'False positive rate = FP / Total alerts. SLA compliance = Within SLA / True alerts. Watch for false negatives hiding outside both calculations.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;