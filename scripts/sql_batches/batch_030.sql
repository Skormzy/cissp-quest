INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'interface_testing',
  'A security team is evaluating a new web application that communicates with a third-party payment API. They need to verify that data exchanged between the application and the API is properly validated, authenticated, and encrypted. Which type of testing BEST addresses these concerns?',
  '["Unit testing of individual payment functions", "Fuzz testing of the payment input fields", "API interface testing to verify secure data exchange between systems", "Performance load testing of the payment gateway"]'::jsonb,
  2,
  'API interface testing focuses on verifying that standardized module interactions work correctly, including data validation, authentication, encryption, and error handling between systems. This is critical for third-party integrations where data crosses trust boundaries. Unit testing checks individual components, fuzz testing checks for crashes, and load testing checks performance — none specifically address the secure interchange requirements.',
  'Interface testing = testing the handshake between systems. APIs, UIs, network connections — verify they talk securely.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  6,
  'cve_cvss',
  'A security analyst discovers a vulnerability listed as CVE-2024-31337 in the National Vulnerability Database. The entry includes a CVSS score, affected product versions, and remediation guidance. Which organization MOST LIKELY maintains the NVD?',
  '["ISACA", "The SANS Institute", "OWASP Foundation", "NIST (National Institute of Standards and Technology)"]'::jsonb,
  3,
  'The National Vulnerability Database (NVD) is maintained by NIST (National Institute of Standards and Technology). It builds upon CVE entries from MITRE by adding analysis, severity scoring using CVSS, impact information, and remediation guidance. ISACA focuses on IT governance, SANS on training, and OWASP on web application security.',
  'NVD = NIST Vulnerability Database. CVE IDs come from MITRE, but NIST adds the scoring and analysis.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'A security team tracks the number of phishing simulation failures per department. Over the past quarter, the marketing department''s click rate decreased from 35% to 8%, while the engineering department''s rate remained steady at 5%. Which type of security process data does this MOST LIKELY represent?',
  '["Training and awareness metrics showing the effectiveness of the security awareness program", "Key Risk Indicators predicting future security incidents", "Vulnerability assessment findings requiring immediate remediation", "Compliance audit results requiring regulatory reporting"]'::jsonb,
  0,
  'Phishing simulation results are training and awareness metrics that measure the effectiveness of the security awareness program. The decrease in the marketing department''s click rate indicates that awareness training is working. These metrics help organizations identify departments that need additional training and track improvement over time.',
  'Phishing sim results = training effectiveness metric. Click rate going down = training is working.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'An organization has completed a comprehensive vulnerability assessment and received a report with 500 findings categorized by CVSS score. Management asks the security team to begin remediation. After verifying findings are not false positives, what should be the FIRST prioritization criterion?',
  '["Remediate alphabetically by CVE identifier for tracking purposes", "Remediate based on CVSS severity score combined with business impact of affected assets", "Remediate the newest vulnerabilities first since they are most likely to be exploited", "Remediate all findings simultaneously to eliminate risk as quickly as possible"]'::jsonb,
  1,
  'Vulnerability remediation should be prioritized by combining CVSS severity with business impact. A critical-severity vulnerability on an isolated test system may be lower priority than a high-severity vulnerability on a customer-facing production database. The risk analysis considers both the technical severity and the organizational context to allocate remediation resources effectively.',
  'Prioritize by severity AND business impact. A critical vuln on a test box is less urgent than a high vuln on your payment server.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  6,
  'kri_kpi',
  'A security manager notices that the number of unpatched critical vulnerabilities has been steadily increasing over the past three months, even though patch management resources have remained constant. Which metric category BEST classifies this trend, and why is it significant?',
  '["This is a KPI indicating the team is exceeding performance targets", "This is a compliance metric that only matters during audit season", "This is a KRI signaling increasing risk exposure that may lead to a security incident", "This is an operational metric with no security implications"]'::jsonb,
  2,
  'A growing number of unpatched critical vulnerabilities is a Key Risk Indicator (KRI) because it is forward-looking and signals increasing exposure to operational risk. KRIs monitor potential future shifts in risk conditions and drive risk-related decision-making. This trend suggests that either the volume of new vulnerabilities is outpacing remediation capacity or that the patch management process needs improvement before an incident occurs.',
  'Growing unpatched vulns = KRI (looking ahead at rising risk). KPIs look back; KRIs look forward.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;