INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'vulnerability_assessment',
  'Which of the following BEST describes the purpose of a vulnerability assessment?',
  '["To identify known weaknesses in systems without attempting exploitation", "To exploit discovered vulnerabilities and prove they can be leveraged", "To review source code for insecure coding patterns", "To monitor real-time network traffic for anomalies"]'::jsonb,
  0,
  'A vulnerability assessment is an automated or semi-automated process that identifies known vulnerabilities in systems, networks, and applications. It stops at identification and does not attempt exploitation. Penetration testing goes further by actively exploiting vulnerabilities.',
  'Vuln Assessment = FIND it. Pen Test = PROVE it. Assessment identifies, pen test exploits.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),
(
  6,
  'sast_dast_iast',
  'What is the PRIMARY difference between SAST and DAST?',
  '["SAST tests running applications while DAST analyzes source code", "SAST analyzes source code without execution while DAST tests running applications", "SAST is a black box technique while DAST is a white box technique", "SAST requires network access while DAST requires physical access"]'::jsonb,
  1,
  'Static Application Security Testing (SAST) analyzes source code or compiled binaries without executing the application, making it a white box approach. Dynamic Application Security Testing (DAST) tests a running application without access to source code, making it a black box approach. The key differentiator is whether the code is executed during testing.',
  'SAST = Static = Still code (not running) = White box. DAST = Dynamic = Doing stuff (running) = Black box.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),
(
  6,
  'false_positives',
  'Why are false negatives generally considered MORE dangerous than false positives in vulnerability scanning?',
  '["False negatives generate excessive alerts that overwhelm security teams", "False negatives require more expensive tools to address than false positives", "False negatives mean real vulnerabilities go undetected, leaving the organization exposed", "False negatives violate regulatory compliance requirements more frequently"]'::jsonb,
  2,
  'False negatives occur when a scanner fails to detect a real vulnerability, leaving the organization unaware of an actual risk. While false positives create noise and administrative overhead, false negatives are more dangerous because the organization cannot remediate threats it does not know about. Undetected vulnerabilities can be exploited by attackers.',
  'False Negative = Nobody Noticed = dangerous. False Positive = Paranoid alert = annoying but safe.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),
(
  6,
  'soc_reports',
  'What distinguishes a SOC 2 report from a SOC 3 report?',
  '["SOC 2 focuses on financial reporting controls while SOC 3 covers trust services criteria", "SOC 2 is a point-in-time assessment while SOC 3 covers a period of time", "SOC 2 is designed for internal use only while SOC 3 is used by external auditors", "SOC 2 contains detailed confidential information while SOC 3 is a sanitized summary for public distribution"]'::jsonb,
  3,
  'A SOC 2 report provides detailed information about a service organization''s controls based on the five trust services criteria and contains confidential organizational information with restricted distribution. A SOC 3 report is a sanitized, summarized version of SOC 2 designed for public distribution and marketing purposes. SOC 1, not SOC 3, focuses on financial reporting.',
  'SOC 2 = Secret details (restricted). SOC 3 = Share with everyone (public). 3 is the marketing version.',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),
(
  6,
  'testing_approaches',
  'In penetration testing terminology, which approach BEST describes a test where the tester has no prior knowledge of the target environment?',
  '["Black box testing", "White box testing", "Gray box testing", "Regression testing"]'::jsonb,
  0,
  'Black box (zero knowledge) testing means the penetration tester has no information about the target environment, simulating an external attacker. White box provides full knowledge, gray box provides partial knowledge, and regression testing verifies that changes have not broken existing functionality.',
  'Black box = Blind (zero knowledge). White box = Wide open (full knowledge). Gray = in between.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;