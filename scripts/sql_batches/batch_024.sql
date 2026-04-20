INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'penetration_testing',
  'A financial services firm has hired a penetration testing team. The testers were given network diagrams, IP address ranges, application architecture documents, and administrator credentials. The internal security team was informed that testing would occur during a specific two-week window. Which type of penetration test is being conducted?',
  '["Double-blind black box test", "Blind gray box test", "External zero-knowledge test", "Full-knowledge white box test"]'::jsonb,
  3,
  'In a full-knowledge (white box) penetration test, the testing team receives comprehensive information about the target environment including network diagrams, credentials, and IP ranges. Because the internal security team is also aware of the testing, this is not a blind or double-blind test. This approach maximizes coverage and efficiency by eliminating the reconnaissance guessing phase.',
  'White box = Wide open information. Black box = Blind. The more the tester knows, the whiter the box.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'After a vulnerability scan completes, the report shows 347 findings across the organization''s infrastructure. The security team needs to begin remediation. What should be their FIRST action?',
  '["Prioritize findings by severity and business impact using CVSS scores", "Immediately patch every finding starting with the oldest systems", "Dismiss all low-severity findings to reduce the workload", "Forward the entire report to the help desk for ticket creation"]'::jsonb,
  0,
  'When faced with a large number of vulnerability findings, the first action should be to prioritize based on severity (using CVSS scores) and business impact. This ensures the most critical risks are addressed first. Simply patching everything without prioritization wastes resources, dismissing findings ignores real risks, and forwarding without analysis provides no actionable guidance.',
  'After a scan: Prioritize, then Patch. CVSS scores guide your priority — higher score = fix first.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  6,
  'sast_dast_iast',
  'Which testing approach BEST combines the advantages of both static and dynamic application security testing by analyzing application behavior at runtime while also having access to the source code?',
  '["Runtime Application Self-Protection (RASP)", "Interactive Application Security Testing (IAST)", "Breach Attack Simulation (BAS)", "Security Content Automation Protocol (SCAP)"]'::jsonb,
  1,
  'Interactive Application Security Testing (IAST) combines elements of both SAST and DAST. It performs real-time analysis during application runtime while also having access to the source code. IAST monitors HTTP traffic, frameworks, and backend connections. RASP provides runtime protection but does not perform testing analysis. BAS and SCAP serve different purposes entirely.',
  'IAST = I do it All — Static + Dynamic Together. It''s the hybrid approach that sees code AND runtime.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  6,
  'team_exercises',
  'During a corporate security exercise, one team is actively attempting to breach network defenses using social engineering and exploit tools, while another team monitors their SIEM, responds to alerts, and attempts to contain any detected intrusions. A third team observes and documents lessons learned. Which team roles are being described in order?',
  '["Blue team, white team, red team", "White team, red team, blue team", "Red team, blue team, white team", "Purple team, red team, blue team"]'::jsonb,
  2,
  'Red teams play offense by simulating real-world attacks including penetration testing and social engineering. Blue teams play defense through monitoring, incident response, and security operations. White teams serve as observers, judges, and referees who document lessons learned and ensure exercises do not impact production. Purple teams combine red and blue for collaborative knowledge sharing.',
  'Red = offense (attack). Blue = defense (protect). White = watchers (referee). Purple = Red + Blue collaboration.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  6,
  'pentest_methodology',
  'A penetration tester has completed the reconnaissance phase and identified the target organization''s public-facing web servers, mail servers, and DNS servers. What should be the tester''s FIRST action in the next phase?',
  '["Attempt SQL injection attacks against the web application", "Write a preliminary report of reconnaissance findings", "Launch a denial-of-service attack to test availability controls", "Enumerate services, open ports, and software versions on the identified targets"]'::jsonb,
  3,
  'After reconnaissance, the next phase in penetration testing is enumeration. This involves actively probing identified targets to determine open ports, running services, and software versions. Enumeration builds on reconnaissance data to create a detailed picture of the attack surface before vulnerability analysis and exploitation phases. Attacks should not begin until enumeration is complete.',
  'Pen test order: REVED — Recon first, then Enumerate. You must map the terrain before you can attack it.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;