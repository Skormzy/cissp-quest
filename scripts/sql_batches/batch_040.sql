INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'audit_standards',
  'An organization undergoes its first SOC 2 Type I audit and receives a clean opinion on control design. The following year, the SOC 2 Type II audit reveals several control failures where controls were designed correctly but not operating effectively throughout the audit period. Management is surprised because "nothing changed since the Type I." As the CISO advising the board, what does this situation BEST illustrate?',
  '["A clean Type I opinion provides no assurance about operational effectiveness over time, demonstrating that control design adequacy and consistent operational execution are fundamentally different dimensions of assurance", "The Type II auditors were more thorough than the Type I auditors", "The organization''s controls degraded between the two audit periods", "Type I audits are unreliable and should never be conducted"]'::jsonb,
  0,
  'This perfectly illustrates the fundamental distinction between Type I and Type II audits. Type I assesses control DESIGN at a point in time — confirming controls are properly constructed. Type II assesses both design AND OPERATIONAL EFFECTIVENESS over a period of time — confirming controls actually work consistently. Controls can be beautifully designed but poorly executed, inconsistently applied, or bypassed in practice. This is why Type II provides stronger assurance.',
  'Designed right is not working right. Type I = blueprint approved. Type II = building inspection over months. Design and execution are different.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'false_positives',
  'An organization runs weekly vulnerability scans across 2,000 servers. The security team notices a pattern: the same 50 servers consistently generate high-severity findings for a specific CVE related to an Apache module, but the operations team insists the module was removed from those servers months ago. Credentialed scans confirm the module is not installed. The findings persist across multiple scan cycles even after updating the scanner''s vulnerability database. What is MOST LIKELY causing this persistent pattern?',
  '["The Apache module was not fully removed and remnant files trigger the detection", "The scanner''s detection logic uses a signature that matches another component or configuration artifact on these servers, creating a systematic false positive", "The operations team did not actually remove the module from all 50 servers", "The vulnerability database vendor has incorrectly mapped the CVE to the wrong detection criteria"]'::jsonb,
  1,
  'When credentialed scans (which can verify actual installed components) confirm the module is absent yet the finding persists, a systematic false positive is occurring. The scanner''s detection signature likely matches some other component, configuration file, or artifact present on these specific servers. This type of signature-based false positive requires investigation of the scanner''s detection logic and may require creating a scanner exception with documented justification.',
  'Persistent false positive despite verification = scanner signature matches something else. Investigate the detection logic, not the servers.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),
(
  6,
  'pentest_methodology',
  'A sophisticated red team engagement against a large enterprise spans four weeks. During week two, the red team successfully deploys a custom implant on an internal application server using a zero-day exploit they developed. The blue team''s EDR solution does not detect the implant because it uses novel techniques. In week three, the purple team facilitates a controlled knowledge exchange where the red team reveals the implant''s communication patterns to the blue team, who then develops custom detection signatures. In week four, the blue team successfully detects and contains a simulated second deployment. What does this exercise structure BEST demonstrate?',
  '["The blue team''s EDR solution is fundamentally inadequate and should be replaced", "The red team should not have shared their techniques as it undermines future testing", "The value of purple team collaboration in transforming offensive findings into improved defensive capabilities through structured knowledge transfer", "The exercise was a failure because the blue team did not detect the initial implant"]'::jsonb,
  2,
  'This exercise demonstrates the core value of purple teaming: converting offensive discoveries into defensive improvements through structured collaboration. The red team''s success in week two identified a detection gap. Rather than simply documenting this in a report, the purple team facilitated real-time knowledge transfer that enabled the blue team to build and validate new detection capabilities. By week four, the defense was improved and verified.',
  'Purple team = knowledge multiplication. Red team finds gaps, blue team fills them, purple team makes it happen. Offense informs defense.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'vulnerability_assessment',
  'The CISO of a multinational corporation receives two competing proposals for the annual security testing program. Proposal A recommends quarterly vulnerability assessments, semi-annual penetration tests, and continuous BAS — estimated at $500,000 per year. Proposal B recommends monthly vulnerability assessments and annual penetration tests without BAS — estimated at $200,000 per year. The organization experienced a breach last year that cost $4.2 million. As a senior manager, what factors should MOST heavily influence the decision?',
  '["Choose the less expensive option to maximize the security budget for other initiatives", "Choose the more expensive option because higher cost always means better security", "Select based on which vendor has better brand recognition in the industry", "Evaluate the risk reduction each proposal provides relative to the organization''s threat landscape, asset criticality, and the cost of potential breaches rather than comparing proposals on price alone"]'::jsonb,
  3,
  'A senior manager must evaluate security testing proposals based on risk reduction effectiveness rather than cost alone. Given a $4.2M breach cost, the $300K difference between proposals is small compared to the potential risk reduction from continuous BAS testing. The decision should consider the organization''s specific threat landscape, the criticality of assets being tested, regulatory requirements, and how each proposal reduces the likelihood and impact of future breaches.',
  'Think like a manager: cost vs. risk reduction. A $500K program that prevents a $4.2M breach is a bargain. Evaluate ROI, not just price.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'log_review_siem',
  'A security operations center has implemented a comprehensive SIEM with log sources from firewalls, IDS/IPS, endpoint protection, Active Directory, application servers, and database audit logs. The SIEM correlation engine uses clipping levels to filter noise. After a breach investigation, analysts discover that the attacker stayed below all clipping thresholds by spreading login attempts across 200 compromised accounts over 30 days, never exceeding 3 failed attempts per account per day. The SIEM''s clipping level was set to alert after 5 failed attempts per account within 24 hours. How should the SOC improve detection of this type of low-and-slow attack?',
  '["Implement aggregate correlation rules that detect anomalous patterns across multiple accounts and extended time windows, supplementing per-account thresholds with population-level behavioral analysis", "Lower the clipping level to 1 failed attempt to catch all failures", "Disable clipping levels entirely to ensure no events are filtered", "Replace the SIEM with a simpler log aggregation tool that stores all events"]'::jsonb,
  0,
  'Low-and-slow attacks are designed to evade per-entity threshold-based detection. The solution is to implement aggregate correlation rules that analyze patterns across the entire population of accounts over extended time windows. While 3 failures per account per day is normal, 200 accounts each experiencing exactly 3 failures across 30 days creates an anomalous aggregate pattern. Lowering thresholds to 1 would generate overwhelming false positives, and disabling clipping removes useful noise filtering.',
  'Low-and-slow evades per-account thresholds. Solution: aggregate correlation across accounts and time. See the forest, not just the trees.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;