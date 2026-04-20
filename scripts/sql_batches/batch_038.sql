INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'soc_reports',
  'An organization is evaluating two cloud providers. Provider A offers a SOC 2 Type II report covering security, availability, and confidentiality. Provider B offers a SOC 2 Type I report covering all five trust services criteria. Which provider offers STRONGER security assurance and why?',
  '["Provider B because it covers more trust services criteria", "Both providers offer equivalent assurance since both have SOC 2 reports", "Provider A because a Type II report demonstrates operational effectiveness over time, which is more meaningful than a broader Type I point-in-time snapshot", "Neither provider offers adequate assurance without a SOC 1 report"]'::jsonb,
  2,
  'Type II reports are inherently stronger than Type I because they assess both control design AND operational effectiveness over a period of time (typically 6-12 months), while Type I only assesses control design at a single point in time. Provider A''s Type II, despite covering fewer criteria, demonstrates that controls actually work consistently. Provider B''s Type I only shows controls are designed properly, not that they operate effectively.',
  'Type II always beats Type I for assurance. Working controls over time > designed controls at one moment. Depth over breadth.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'An organization identifies 400 vulnerabilities across its infrastructure. Over a 90-day remediation window, the team remediates 340 vulnerabilities. During the same period, 60 new vulnerabilities are discovered. What is the vulnerability remediation rate based on the ORIGINAL identified vulnerabilities?',
  '["60%", "74%", "90%", "85%"]'::jsonb,
  3,
  'Vulnerability Remediation Rate = (Vulnerabilities Remediated / Total Vulnerabilities Identified) x 100. Using the original identified count: (340 / 400) x 100 = 85%. The 60 new vulnerabilities discovered during the period represent new findings that would be tracked in the next remediation cycle. The rate measures how effectively the team addressed the known vulnerability population.',
  'Remediation Rate = Fixed / Found x 100. 340 fixed out of 400 found = 85%. New vulns go into the next cycle.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),
(
  6,
  'cve_cvss',
  'All of the following are components of the SCAP (Security Content Automation Protocol) suite EXCEPT:',
  '["CVSS (Common Vulnerability Scoring System)", "OVAL (Open Vulnerability and Assessment Language)", "XCCDF (Extensible Configuration Checklist Description Format)", "CPE (Common Platform Enumeration)"]'::jsonb,
  0,
  'SCAP components include ARF, CCE, CPE, OVAL, OCIL, TMSAD, XCCDF, and SWID. While CVSS is used alongside SCAP for scoring vulnerabilities, it is not itself a component of the SCAP suite. CVSS is a separate framework maintained independently for vulnerability scoring. OVAL, XCCDF, and CPE are all official SCAP components used for testing, checklists, and platform identification respectively.',
  'SCAP components: ARF, CCE, CPE, OVAL, OCIL, TMSAD, XCCDF, SWID. CVSS scores vulns but is NOT part of SCAP itself.',
  'apply',
  'except_not',
  'hard',
  1.20, 2.00, 0.25,
  'ai_generated', true
),
(
  6,
  'interface_testing',
  'A financial trading platform integrates with five different external market data APIs, three internal microservices, and two physical interfaces to trading floor displays. During interface testing, the QA team discovers that under high load, the API responses from one market data provider arrive out of order, causing the pricing engine to display stale prices. Standard functional testing did not catch this issue. What type of additional testing would have been MOST effective?',
  '["Unit testing of the pricing engine module in isolation", "State-based analysis testing the pricing engine''s behavior during different processing states under varying load conditions", "Static code analysis of the API integration code", "User acceptance testing with sample market data"]'::jsonb,
  1,
  'State-based analysis defines abstract states and tests transitions between them, which is especially useful for systems that must handle out-of-order data, timing-dependent processing, and varying operational conditions. The pricing engine has multiple states (receiving data, processing, displaying) and the issue manifests during state transitions under load. This technique, used for communication protocols and GUIs, directly addresses sequence-dependent behavior.',
  'State-based testing = testing transitions between states. When order matters and timing varies, test the state machine.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'A security team detected 50 security incidents over a quarter. The total time from occurrence to detection across all incidents was 2,500 hours. The total time from detection to resolution across all incidents was 1,000 hours. What are the Mean Time to Detect (MTTD) and Mean Time to Respond (MTTR)?',
  '["MTTD = 25 hours, MTTR = 50 hours", "MTTD = 100 hours, MTTR = 40 hours", "MTTD = 50 hours, MTTR = 20 hours", "MTTD = 20 hours, MTTR = 50 hours"]'::jsonb,
  2,
  'MTTD = Total detection time / Number of incidents = 2,500 / 50 = 50 hours. MTTR = Total response time / Number of incidents = 1,000 / 50 = 20 hours. These metrics are critical KPIs for evaluating security operations effectiveness. Lower MTTD means faster detection, and lower MTTR means faster resolution. Together they measure the full incident lifecycle performance.',
  'MTTD = total detect time / incidents. MTTR = total respond time / incidents. Simple division — match numerator to the right metric.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;