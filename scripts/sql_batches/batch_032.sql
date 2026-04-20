INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'code_review',
  'A development team has applied an emergency security patch to a production web application to address a critical vulnerability. After patching, users report that the search function no longer returns correct results. What type of testing should be performed FIRST?',
  '["Regression testing to verify the patch did not break existing functionality", "Fuzz testing to check the search input handler for new vulnerabilities", "Acceptance testing to re-validate all business requirements", "Load testing to ensure performance was not impacted by the patch"]'::jsonb,
  0,
  'Regression testing is performed after software changes (patches, enhancements, configuration changes) to verify that existing functionality has not been broken. Since users are reporting broken search functionality after a patch was applied, regression testing is the immediate priority to identify exactly what the patch broke and to what extent existing features are impacted.',
  'After patching: regression test. Did the fix break something else? Regression = did we regress?',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  6,
  'testing_approaches',
  'How does synthetic performance monitoring differ from Real User Monitoring (RUM)?',
  '["Synthetic monitoring is passive while RUM is active", "Synthetic monitoring uses scripted transactions proactively while RUM passively captures actual user interactions", "Synthetic monitoring only works on mobile applications while RUM works on web applications", "Synthetic monitoring requires source code access while RUM operates externally"]'::jsonb,
  1,
  'Synthetic performance monitoring uses scripted, artificial transactions to proactively test system functionality, availability, and response times under controlled conditions. Real User Monitoring (RUM) passively captures actual user interactions in real-time. Synthetic monitoring can detect issues before users encounter them, while RUM only detects issues after they affect real users.',
  'Synthetic = Simulated (proactive, scripted). RUM = Real Users (passive, actual). Synthetic catches issues early; RUM catches real-world problems.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'Compared to credentialed internal scanning, which scanning approach BEST simulates what an external attacker without insider knowledge could discover about a network?',
  '["Credentialed internal vulnerability scan from inside the network", "Full-knowledge white box assessment with source code review", "Uncredentialed external vulnerability scan from outside the network perimeter", "Gray box assessment with partial network documentation"]'::jsonb,
  2,
  'An uncredentialed (unauthenticated) external scan best simulates an external attacker perspective. The scanner operates without credentials or insider knowledge, discovering only what is visible from outside the network perimeter. While this approach produces more false positives than credentialed scanning, it accurately represents the attack surface visible to an unauthenticated external attacker.',
  'Uncredentialed external scan = seeing what the bad guys see. No credentials, outside the firewall, attacker perspective.',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),
(
  6,
  'audit_standards',
  'An organization previously had its service controls audited under SAS 70. When the audit firm indicates this standard is no longer valid, what standard has MOST LIKELY replaced it?',
  '["ISO 27001", "COBIT 2019", "PCI-DSS v4.0", "SSAE 18"]'::jsonb,
  3,
  'SAS 70 was the legacy audit standard that has been superseded. The evolution went from SAS 70 to SSAE 16, and then to SSAE 18 (the current US standard). SSAE 18 is governed by AICPA and provides the framework for SOC reports. ISO 27001 is an information security management standard, COBIT is an IT governance framework, and PCI-DSS is a payment card standard — none replaced SAS 70.',
  'SAS 70 -> SSAE 16 -> SSAE 18. The audit standard evolved. SSAE 18 is current. Remember: S-S-S progression.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  6,
  'pentest_methodology',
  'During a penetration test of a corporate network, the testing team has completed reconnaissance and enumeration. They have identified several potential vulnerabilities including an unpatched Apache server, a default credential on a network switch, and an open file share. Before attempting exploitation, what analysis should the team perform FIRST?',
  '["Vulnerability analysis to evaluate which findings are exploitable and assess the risk of exploitation attempts", "Social engineering attacks against help desk staff to gather additional credentials", "Denial-of-service testing to determine system resilience under load", "Physical security testing to attempt unauthorized facility access"]'::jsonb,
  0,
  'After reconnaissance and enumeration, the next phase is vulnerability analysis. This step evaluates the discovered potential vulnerabilities to determine which are actually exploitable and assesses the risk associated with exploitation attempts. Rushing to exploit without analysis could damage systems or waste time on false leads. The methodical approach ensures exploitation efforts are targeted and controlled.',
  'REVED order: after Recon and Enumerate comes Vulnerability analysis. Analyze before you attack.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;