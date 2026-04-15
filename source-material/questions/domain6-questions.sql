-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 6: Security Assessment and Testing
-- 100 questions for CAT engine
-- Distribution: 15 easy, 55 medium, 20 hard, 10 very hard
-- Cognitive: 10 remember, 20 understand, 45 apply, 25 analyze
-- Types: 25 scenario, 20 first_action, 15 best_answer,
--        10 most_likely, 10 tlatm, 10 comparison,
--        5 calculation, 5 except_not
-- Correct positions: 25 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY (15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: easy / remember / best_answer / correct=0
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
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

-- Q2: easy / remember / comparison / correct=1
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
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

-- Q3: easy / understand / best_answer / correct=2
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
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

-- Q4: easy / understand / comparison / correct=3
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
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

-- Q5: easy / remember / best_answer / correct=0
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
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
),

-- Q6: easy / understand / scenario / correct=1
-- IRT: b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  6,
  'log_review_siem',
  'A junior analyst notices that the SIEM is correlating events from multiple servers, but the timestamps are hours apart even though the events are clearly related. The security team suspects the events happened simultaneously. What is the MOST likely cause of this discrepancy?',
  '["The SIEM software has a known bug in timestamp rendering", "The servers lack proper NTP synchronization, causing clock drift", "The log retention policy is deleting entries out of order", "The firewall is delaying log transmission between network segments"]'::jsonb,
  1,
  'Network Time Protocol (NTP) synchronization is critical for accurate log correlation and forensic analysis. When servers have unsynchronized clocks, related events appear to occur at different times, making incident investigation extremely difficult. NTP ensures all systems share a consistent time reference.',
  'NTP = No Time Problems. Without NTP, your logs tell different stories about when things happened.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q7: easy / apply / scenario / correct=2
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'credentialed_scanning',
  'Your organization wants to perform a vulnerability scan that provides the deepest level of inspection with the fewest false positives. The security team has administrative access to all target systems. Which scanning approach should they use?',
  '["Unauthenticated external scan from outside the firewall", "Passive network monitoring with packet capture analysis", "Credentialed scan using administrative credentials on target systems", "Port scanning followed by manual banner grabbing"]'::jsonb,
  2,
  'Credentialed (authenticated) scans provide the deepest level of inspection because the scanner can log into the target system and examine configurations, installed software, and patch levels directly. This approach produces fewer false positives compared to uncredentialed scans because the scanner has verified access to accurate system information rather than guessing from external responses.',
  'Credentialed = deeper + fewer false positives. Like checking someone''s medicine cabinet vs. asking what pills they take.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q8: easy / understand / most_likely / correct=3
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  6,
  'code_review',
  'An organization requires the MOST formal and rigorous code review process for a safety-critical medical device application. Which review method are they MOST LIKELY to use?',
  '["Informal peer review between two developers", "Automated static analysis tool scan", "Code walkthrough led by a senior developer", "Fagan inspection with defined entry and exit criteria"]'::jsonb,
  3,
  'A Fagan inspection is the most formal code review methodology, consisting of six phases: planning, overview, preparation, inspection, rework, and follow-up. It has defined entry and exit criteria between stages and is specifically designed for high-criticality environments such as medical devices and safety-critical systems.',
  'FAGAN = Formal And Governed And Noted. Six phases: P-O-P-I-R-F (Pop In, Review, Follow-up).',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q9: easy / apply / first_action / correct=0
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'pentest_methodology',
  'A penetration testing team has just been authorized to begin testing a client''s external network. What should be their FIRST step?',
  '["Perform reconnaissance to gather information about the target", "Attempt to exploit known vulnerabilities on the web server", "Install backdoors to maintain persistent access", "Write the final report documenting their methodology"]'::jsonb,
  0,
  'The penetration testing methodology follows a structured sequence: reconnaissance, enumeration, vulnerability analysis, execution/exploitation, and documentation. Reconnaissance is always the first step, where testers gather publicly available information about the target including DNS records, IP ranges, and organizational structure before any active testing begins.',
  'Pen test phases: REVED = Recon, Enumerate, Vulnerability analysis, Exploit, Document.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q10: easy / apply / best_answer / correct=1
-- IRT: b = -1.5 + 0.3 + 0.0 = -1.2, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'fuzz_testing',
  'A development team wants to test their file parser for unexpected crashes by modifying known valid input files with random bit changes. Which type of fuzz testing BEST describes this approach?',
  '["Generational fuzzing that creates inputs based on protocol specifications", "Mutation fuzzing that randomly modifies existing valid inputs", "Boundary value analysis testing at the edges of input ranges", "Equivalence partitioning that divides inputs into behavioral groups"]'::jsonb,
  1,
  'Mutation fuzzing (also called dumb fuzzing) takes known valid inputs and randomly modifies them through techniques like bit flipping or appending data. It does not require understanding of the input format. Generational fuzzing, by contrast, creates inputs from scratch based on understanding of the expected data format or protocol specification.',
  'Mutation = Mangle existing input (dumb). Generational = Generate from scratch (intelligent).',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q11: easy / remember / comparison / correct=2
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
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

-- Q12: easy / understand / best_answer / correct=3
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
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

-- Q13: easy / apply / scenario / correct=0
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q14: easy / understand / except_not / correct=1
-- IRT: b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + (-0.1) = 0.9, c = 0.25
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

-- Q15: easy / apply / first_action / correct=2
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
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
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM (55) — IRT b base = 0.0 — Questions 16-70
-- ═══════════════════════════════════════════════════════════

-- Q16: medium / apply / scenario / correct=3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q17: medium / apply / first_action / correct=0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q18: medium / understand / best_answer / correct=1
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
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

-- Q19: medium / apply / scenario / correct=2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q20: medium / apply / first_action / correct=3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
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
),

-- Q21: medium / analyze / tlatm / correct=0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'security_metrics',
  'As the newly appointed CISO, you are reviewing the security program''s metrics dashboard. Several metrics are reported quarterly, but few appear tied to business objectives. From a management perspective, what is the MOST important action to improve the metrics program?',
  '["Align metrics to the SMART framework ensuring each is relevant to business strategy", "Increase the number of metrics reported to provide more comprehensive coverage", "Replace all technical metrics with financial metrics for executive understanding", "Outsource metrics collection to a third-party managed security provider"]'::jsonb,
  0,
  'SMART metrics (Specific, Measurable, Achievable/Actionable, Relevant, Timely) provide a framework for ensuring security metrics drive business value. The R in SMART stands for Relevant, meaning metrics must align to business strategy. A CISO should focus on connecting security measurements to organizational objectives rather than simply increasing volume or eliminating technical detail.',
  'SMART metrics: Specific, Measurable, Achievable, Relevant, Timely. The R is key — metrics must matter to the business.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q22: medium / apply / scenario / correct=1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'log_management',
  'A security operations center discovers that critical security log files on a high-traffic web server are being overwritten every 4 hours because the log partition has reached its maximum size and the server is configured to use circular overwrite. During an incident investigation, analysts need logs from 12 hours ago. What is the PRIMARY concern with the current configuration?',
  '["The log format is incompatible with the SIEM normalization engine", "Critical evidence for incident investigation may have been permanently lost due to circular overwrite", "The web server performance is degraded because of excessive logging", "The log partition size exceeds the recommended industry benchmark"]'::jsonb,
  1,
  'Circular overwrite replaces the oldest log entries when maximum storage is reached. In this scenario, with logs overwriting every 4 hours, any evidence older than 4 hours has been permanently lost. This is a significant concern for incident investigation and forensic analysis. Organizations must balance log retention requirements with storage capacity to ensure critical evidence is preserved.',
  'Circular overwrite = oldest logs eaten by newest. Great for space, terrible for forensics.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q23: medium / understand / most_likely / correct=2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  6,
  'cve_cvss',
  'A vulnerability scanner reports a finding with a CVSS base score of 9.2. How would this vulnerability MOST LIKELY be classified?',
  '["Low severity requiring routine patching", "Medium severity requiring evaluation within 30 days", "Critical severity requiring immediate remediation", "Informational finding requiring no action"]'::jsonb,
  2,
  'CVSS scores range from 0.0 to 10.0, with severity ratings as follows: None (0.0), Low (0.1-3.9), Medium (4.0-6.9), High (7.0-8.9), and Critical (9.0-10.0). A score of 9.2 falls in the Critical range, meaning the vulnerability represents a severe risk that should be prioritized for immediate remediation.',
  'CVSS severity: Low <4, Medium 4-6.9, High 7-8.9, Critical 9-10. Higher = Hotter = Handle now.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q24: medium / apply / first_action / correct=3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'testing_approaches',
  'Management has decided to conduct a double-blind penetration test of the organization''s network. In addition to limiting the tester''s knowledge, what FIRST distinguishes this from a standard blind test?',
  '["The penetration testers must sign additional non-disclosure agreements", "The test must be conducted from an external network only", "The testers are required to use only open-source tools", "The internal security team is not informed that a test is taking place"]'::jsonb,
  3,
  'The key distinction of a double-blind test is that neither the penetration testers nor the internal security team know the test is happening — only senior management is aware. In a standard blind test, the testers have minimal information but the internal security team knows testing will occur. Double-blind tests provide the most realistic assessment of both detection and response capabilities.',
  'Blind = tester is blind. Double-blind = BOTH tester AND defenders are blind. Only senior management knows.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q25: medium / analyze / scenario / correct=0
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'soc_reports',
  'A cloud-based SaaS provider presents your organization with a SOC 1 Type II report as evidence of their security posture. Your organization is primarily concerned about the confidentiality and availability of data stored in the provider''s environment. Why is this report INSUFFICIENT for your needs?',
  '["SOC 1 reports focus on financial reporting controls, not on security trust services criteria like confidentiality and availability", "SOC 1 Type II reports are only valid for 30 days after issuance", "SOC 1 reports are not recognized by any regulatory framework", "SOC 1 Type II only covers control design, not operational effectiveness"]'::jsonb,
  0,
  'SOC 1 reports are designed to evaluate controls relevant to financial reporting, not the broader trust services criteria. For concerns about confidentiality and availability, your organization should request a SOC 2 report, which covers the five trust services criteria: security, availability, confidentiality, processing integrity, and privacy. Type II is correct for assessing operational effectiveness over time, but the SOC type (1 vs. 2) matters more here.',
  'SOC 1 = Financial focus. SOC 2 = Security focus (five trust services). Wrong SOC type = wrong assurance.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q26: medium / apply / first_action / correct=1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'vulnerability_assessment',
  'During a credentialed vulnerability scan of a Linux server, the scanner identifies a critical OpenSSL vulnerability with a CVSS score of 9.8. The server hosts a public-facing customer portal. What should be the FIRST remediation step?',
  '["Immediately take the server offline to prevent exploitation", "Verify the finding is not a false positive by confirming the OpenSSL version installed", "Replace OpenSSL with a proprietary encryption library", "Reformat and rebuild the server from a known-good image"]'::jsonb,
  1,
  'Before taking any remediation action, the first step is to verify that the finding is not a false positive. Even credentialed scans can produce false positives. Confirming the installed OpenSSL version against the CVE details ensures resources are not wasted on non-existent vulnerabilities. Once confirmed, appropriate remediation such as patching can proceed based on change management procedures.',
  'Before you fix, verify. Even credentialed scans can be wrong. Confirm first, then remediate.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q27: medium / understand / comparison / correct=2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  6,
  'penetration_testing',
  'How does a vulnerability assessment fundamentally differ from a penetration test in terms of methodology?',
  '["Vulnerability assessments are manual while penetration tests are automated", "Vulnerability assessments require written authorization while penetration tests do not", "Vulnerability assessments identify weaknesses without exploitation while penetration tests actively exploit them", "Vulnerability assessments take longer to complete than penetration tests"]'::jsonb,
  2,
  'The fundamental difference is that vulnerability assessments stop at identifying and reporting vulnerabilities without attempting exploitation, while penetration tests go further by actively exploiting discovered vulnerabilities to prove they can be leveraged. Both require authorization, but penetration tests are more manual, take longer (days to weeks vs. minutes to hours), and carry greater risk of impacting systems.',
  'Vuln assessment = find the unlocked doors. Pen test = walk through them and prove what is at risk.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q28: medium / apply / scenario / correct=3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'fuzz_testing',
  'A development team is building a custom network protocol parser. The lead security engineer recommends fuzz testing and wants to generate test inputs that follow the protocol''s message format structure, including valid headers but malformed payload fields. Which fuzzing approach is MOST appropriate?',
  '["Mutation fuzzing using the zzuf tool on captured network packets", "Static analysis of the parser source code for buffer overflow patterns", "Manual code review with focus on input validation routines", "Generational fuzzing that creates inputs based on the protocol specification"]'::jsonb,
  3,
  'Generational (intelligent) fuzzing creates test inputs from scratch based on understanding of the expected data format or protocol specification. This allows the fuzzer to generate structurally valid messages with targeted malformation in specific fields. Mutation fuzzing randomly modifies existing inputs without understanding the format, making it less effective for protocol-specific testing.',
  'Generational = Generate from spec (smart). Mutation = Mangle randomly (dumb). Know the format? Go generational.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q29: medium / analyze / tlatm / correct=0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'audit_standards',
  'The board of directors asks the CISO whether the organization''s cloud service provider has adequate security controls. The provider offers a SOC 2 Type I report from six months ago. As a security manager, what is your BEST recommendation to the board?',
  '["Request a SOC 2 Type II report to verify both control design and operational effectiveness over time", "Accept the Type I report since it confirms controls are properly designed", "Commission an independent SOC 3 report for more detailed information", "Require the provider to undergo a SOC 1 audit for comprehensive coverage"]'::jsonb,
  0,
  'A SOC 2 Type I report only assesses control design at a point in time, not whether controls are actually operating effectively. A Type II report covers both design and operational effectiveness over a period of time (typically 6-12 months), providing much stronger assurance. SOC 3 is less detailed than SOC 2, and SOC 1 focuses on financial controls, not security trust services.',
  'Type I = designed right (snapshot). Type II = designed AND operating right (movie). Type II always provides more assurance.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q30: medium / apply / best_answer / correct=1
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'sast_dast_iast',
  'A mature development organization wants to integrate security testing directly into their CI/CD pipeline so that code is analyzed for vulnerabilities each time a developer commits changes. Which approach BEST fits this requirement?',
  '["Dynamic Application Security Testing run against the production environment", "Static Application Security Testing integrated into the development environment", "Quarterly penetration testing conducted by an external firm", "Annual code review performed by the compliance team"]'::jsonb,
  1,
  'SAST is the best fit for CI/CD pipeline integration because it analyzes source code or compiled binaries without requiring the application to run. It can be integrated directly into development environments and triggered automatically on each commit. DAST requires a running application, and both penetration testing and annual reviews are too infrequent for continuous integration workflows.',
  'SAST = shift-left security. It checks code before it runs, perfect for CI/CD pipelines.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q31: medium / understand / most_likely / correct=2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  6,
  'banner_grabbing',
  'A security analyst connects to port 80 on a target server using Telnet and receives a response showing "Apache/2.4.51 (Ubuntu)". What technique has the analyst MOST LIKELY performed?',
  '["OS fingerprinting to determine the server operating system", "Vulnerability exploitation to gain unauthorized access", "Banner grabbing to identify the web server software and version", "Port scanning to enumerate all open services"]'::jsonb,
  2,
  'Banner grabbing is a technique used to identify software, services, and versions running on a target system by examining responses, error messages, or service banners. Connecting to port 80 via Telnet and receiving the server identification string is a classic banner grabbing technique. While the response reveals the OS (Ubuntu), the primary technique used is banner grabbing, not OS fingerprinting.',
  'Banner grabbing = reading the welcome sign on the door. It tells you what software and version is running.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q32: medium / apply / scenario / correct=3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'log_review_siem',
  'A healthcare organization''s SIEM generates thousands of alerts daily. The security team is overwhelmed and unable to investigate all alerts, resulting in genuine incidents being missed among the noise. The team discovers that many alerts are triggered by routine administrative activities. What is the BEST approach to address this situation?',
  '["Disable all low-priority alerts to reduce volume immediately", "Hire additional analysts to manually review every alert", "Replace the SIEM with a simpler log aggregation tool", "Tune the SIEM correlation rules and implement clipping levels to filter routine activity"]'::jsonb,
  3,
  'SIEM tuning involves adjusting correlation rules to reduce false positives and implementing clipping levels (thresholds) that filter routine activities while preserving significant events. Disabling alerts risks missing real threats, hiring alone does not solve the root cause, and replacing the SIEM loses correlation capabilities. Proper tuning balances alert volume with detection effectiveness.',
  'SIEM tuning = teaching the system what matters. Clipping levels = only alert after threshold exceeded.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q33: medium / analyze / tlatm / correct=0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'security_metrics',
  'As a security director, you are presenting quarterly security metrics to the executive committee. The mean time to detect (MTTD) security incidents has decreased from 72 hours to 24 hours, but the mean time to respond (MTTR) has increased from 4 hours to 8 hours. What is the MOST appropriate management interpretation of these metrics?',
  '["Detection capabilities have improved significantly, but response processes need attention and additional resources", "The security program is failing because response times should decrease proportionally with detection times", "The SIEM should be replaced because faster detection should automatically lead to faster response", "These metrics are unreliable and should be replaced with purely financial indicators"]'::jsonb,
  0,
  'From a management perspective, decreased MTTD shows improved detection capabilities, which is positive. However, increased MTTR suggests response processes may be strained, possibly because faster detection is surfacing more incidents than the response team can handle efficiently. A balanced view recognizes the detection improvement while identifying response as an area needing process improvement or additional resources.',
  'MTTD = how fast you spot it. MTTR = how fast you fix it. Both matter — improvement in one may strain the other.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q34: medium / apply / first_action / correct=1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'code_review',
  'A software development team has just completed a major update to their web application''s authentication module. Several developers made changes across multiple code files. Before deploying to production, what should be the FIRST security-focused review activity?',
  '["Deploy to production with enhanced monitoring for the first week", "Conduct a peer code review focused on the authentication changes", "Run a full penetration test against the development environment", "Schedule a Fagan inspection for next quarter''s review cycle"]'::jsonb,
  1,
  'Peer code review is the most practical and effective first step for reviewing specific code changes before deployment. It allows developers to examine each other''s work for security flaws, logic errors, and coding standard violations. Penetration testing is more appropriate after deployment to a staging environment, Fagan inspections are too formal for routine changes, and deploying without review introduces unnecessary risk.',
  'Code review = first line of defense before deployment. Peer eyes catch what the coder''s eyes miss.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q35: medium / understand / except_not / correct=2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  6,
  'penetration_testing',
  'All of the following are phases of a standard penetration testing methodology EXCEPT:',
  '["Reconnaissance and information gathering", "Enumeration of services and ports", "Continuous real-time monitoring of production systems", "Vulnerability analysis and exploitation"]'::jsonb,
  2,
  'The standard penetration testing phases are reconnaissance, enumeration, vulnerability analysis, exploitation, and documentation. Continuous real-time monitoring is a security operations function, not a penetration testing phase. Penetration tests are time-bound engagements with defined start and end dates, not continuous monitoring activities.',
  'Pen test phases: REVED = Recon, Enumerate, Vuln analysis, Exploit, Document. Monitoring is SOC work, not pen testing.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q36: medium / apply / scenario / correct=0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'credentialed_scanning',
  'An organization runs both credentialed and uncredentialed vulnerability scans against the same set of servers. The uncredentialed scan reports 45 high-severity findings, while the credentialed scan reports only 12 high-severity findings on the same systems. What is the MOST likely explanation for this discrepancy?',
  '["The uncredentialed scan produced many false positives because it could not verify actual system configurations", "The credentialed scan missed vulnerabilities because it had too much access", "The uncredentialed scan is more thorough because it tests from an attacker perspective", "The credentialed scan was configured with an outdated vulnerability database"]'::jsonb,
  0,
  'Uncredentialed scans cannot authenticate to target systems, so they make assumptions about software versions and configurations based on external responses. These assumptions frequently lead to false positives. Credentialed scans can verify actual installed versions, patch levels, and configurations, resulting in more accurate and fewer false-positive findings.',
  'No credentials = more guessing = more false positives. Credentials = verified info = accurate results.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q37: medium / understand / best_answer / correct=1
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  6,
  'testing_approaches',
  'Which testing technique BEST describes sending intentionally malformed, unexpected, or random data as inputs to an application to discover crashes and vulnerabilities?',
  '["Regression testing", "Fuzz testing", "Acceptance testing", "Synthetic transaction monitoring"]'::jsonb,
  1,
  'Fuzz testing is a specialized dynamic testing technique that sends malformed, unexpected, or random data as inputs to discover crashes, buffer overflows, and other vulnerabilities. It can be either mutation-based (modifying valid inputs) or generational (creating inputs from scratch). Regression testing checks for broken functionality, acceptance testing validates requirements, and synthetic monitoring simulates user transactions.',
  'Fuzz = Flood with Funny data. Random junk in, crashes out.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q38: medium / apply / first_action / correct=2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'audit_standards',
  'Your organization is preparing for its first external security audit. The audit firm has been selected and the engagement letter is signed. What should be the FIRST step in the audit planning process?',
  '["Begin collecting evidence and documentation for all security controls", "Schedule interviews with all department heads simultaneously", "Define the audit objective and scope to establish clear boundaries", "Start remediating all known vulnerabilities before the auditors arrive"]'::jsonb,
  2,
  'The first step in audit planning is defining the audit objective and scope. Without clear boundaries, the audit team cannot determine what to examine, what evidence to collect, or what controls to evaluate. The audit plan components begin with defining the objective, then the scope, then goals, before moving to team selection, planning, execution, and documentation.',
  'Audit planning starts with OSD: Objective, Scope, then Details. You must know what you are auditing before you audit it.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q39: medium / apply / scenario / correct=3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'sast_dast_iast',
  'A security team needs to test a production web application for SQL injection and cross-site scripting vulnerabilities without access to the application''s source code. The application is running and accessible via a web browser. Which testing approach should they use?',
  '["Static Application Security Testing to analyze the compiled binaries", "Interactive Application Security Testing requiring code instrumentation", "Manual source code review by senior developers", "Dynamic Application Security Testing using a web vulnerability scanner"]'::jsonb,
  3,
  'DAST is the appropriate approach because it tests running applications without requiring access to source code. It operates as a black box test, scanning the application externally for vulnerabilities like SQL injection and XSS. SAST requires code access, IAST requires code instrumentation, and manual source code review requires the source code which is not available in this scenario.',
  'No code access + running app = DAST. DAST = Dynamic = tests from the outside while the app runs.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q40: medium / remember / most_likely / correct=0
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  6,
  'vulnerability_assessment',
  'An organization uses Nessus for automated vulnerability scanning and Nmap for network discovery. What role do these tools MOST LIKELY serve in the security assessment process?',
  '["Identifying known vulnerabilities and mapping the network attack surface without exploitation", "Exploiting vulnerabilities and maintaining persistent access to compromised systems", "Performing source code analysis and identifying insecure coding patterns", "Conducting full penetration tests including social engineering attacks"]'::jsonb,
  0,
  'Nessus is a vulnerability scanner that identifies known vulnerabilities, while Nmap is a network discovery and port scanning tool. Together, they help map the attack surface and identify weaknesses without attempting exploitation. These are assessment tools, not exploitation frameworks. Penetration testing tools like Metasploit are used for exploitation, and SAST tools handle code analysis.',
  'Nessus = finds vulnerabilities. Nmap = maps the network. Both FIND problems but do not EXPLOIT them.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q41: medium / apply / best_answer / correct=1
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'validation_verification',
  'A development team has completed building a new inventory management system. The system functions correctly according to the technical specifications, but during user acceptance testing, warehouse staff report that it does not support their barcode scanning workflow. Which quality process MOST LIKELY failed?',
  '["Verification failed because the code contains technical defects", "Validation failed because business requirements were not properly captured", "Integration testing failed because modules do not communicate", "Regression testing failed because a previous feature was broken"]'::jsonb,
  1,
  'Validation asks "Are we building the right product?" — it ensures business requirements are correctly captured before development begins. If the system works technically but does not meet user needs, validation failed. Verification confirms the product is built correctly (which it was, per the technical specs). The issue is that the wrong requirements were built, not that they were built incorrectly.',
  'Validation = right product (did we capture what users need?). Verification = product right (did we build it correctly?).',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q42: medium / analyze / tlatm / correct=2
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'false_positives',
  'As a security manager, your vulnerability scanning team reports 200 high-severity findings to IT operations. The operations team pushes back, stating the scanner detected vulnerabilities in packages already patched through backporting by the Linux distribution. From a management perspective, what is the BEST course of action to resolve this conflict?',
  '["Side with the operations team and dismiss all findings without further investigation", "Side with the security team and mandate immediate patching of all 200 findings", "Direct the teams to collaborate on verifying findings against actual patch status, and implement credentialed scanning to reduce future false positives", "Replace the vulnerability scanning tool with one that never produces false positives"]'::jsonb,
  2,
  'A security manager should facilitate collaboration between teams rather than siding with either. Linux distributions often backport security patches without changing version numbers, causing version-based scanners to produce false positives. The management solution is to verify findings against actual patch status and improve the scanning process by implementing credentialed scans that check real configurations rather than just version numbers.',
  'Backporting = patching without upgrading version. Manager solution: verify, then improve the process with credentialed scanning.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q43: medium / apply / first_action / correct=3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'log_management',
  'A newly hired security analyst is tasked with establishing a centralized log management program. Multiple systems across the network generate logs in different formats. What should be the FIRST step in building the log management infrastructure?',
  '["Install a SIEM and begin collecting all available logs immediately", "Create custom dashboards for executive reporting", "Develop advanced correlation rules for threat detection", "Identify which systems and events are relevant based on risk assessment"]'::jsonb,
  3,
  'The first step in establishing a log management program is to identify what should be logged, guided by risk management. Not all logs are equally valuable, and collecting everything without prioritization leads to excessive storage costs and noise. A risk-based approach determines which systems and events are most critical, ensuring the log management program aligns with organizational security objectives.',
  'Log management starts with: What matters? Let risk guide what you log. Log what is relevant, not everything.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q44: medium / remember / comparison / correct=0
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  6,
  'testing_approaches',
  'What is the PRIMARY distinction between positive testing and negative testing?',
  '["Positive testing verifies expected behavior with valid inputs while negative testing verifies graceful handling of invalid inputs", "Positive testing is performed by the development team while negative testing is performed by the security team", "Positive testing uses automated tools while negative testing requires manual execution", "Positive testing occurs during development while negative testing occurs only in production"]'::jsonb,
  0,
  'Positive testing validates that an application works correctly under normal usage scenarios with expected, valid inputs. Negative testing verifies that the application handles error conditions, improper inputs, and unexpected situations gracefully without crashing or exposing sensitive information. Both are essential for comprehensive security testing.',
  'Positive = does it work right? Negative = does it fail gracefully? Both test the app, different perspectives.',
  'remember',
  'comparison',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q45: medium / apply / scenario / correct=1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'team_exercises',
  'After a red team exercise reveals several critical vulnerabilities, the CISO decides that the offensive and defensive teams should work together to improve detection and response. The teams will share attack techniques, discuss defensive gaps, and collaboratively develop mitigations. What type of team exercise is the CISO establishing?',
  '["A white team observation exercise", "A purple team collaboration exercise", "A tabletop exercise for senior management", "A capture-the-flag competition"]'::jsonb,
  1,
  'A purple team exercise combines red team (offensive) and blue team (defensive) capabilities in a collaborative effort. Rather than operating independently, the teams share knowledge about attack techniques and defensive gaps to improve overall organizational security. This collaborative approach ensures that lessons learned from red team findings are effectively translated into defensive improvements.',
  'Purple = Red + Blue working together. Not adversarial — collaborative. Sharing knowledge to improve defense.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q46: medium / understand / best_answer / correct=2
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
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

-- Q47: medium / understand / most_likely / correct=3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
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

-- Q48: medium / remember / most_likely / correct=0
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
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

-- Q49: medium / apply / first_action / correct=1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q50: medium / understand / best_answer / correct=2
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
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
),

-- Q51: medium / apply / calculation / correct=3
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
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

-- Q52: medium / remember / comparison / correct=0
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
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

-- Q53: medium / understand / best_answer / correct=1
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
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

-- Q54: medium / apply / scenario / correct=2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q55: medium / analyze / tlatm / correct=3
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
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
),

-- Q56: medium / apply / first_action / correct=0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
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

-- Q57: medium / understand / comparison / correct=1
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
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

-- Q58: medium / apply / comparison / correct=2
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
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

-- Q59: medium / understand / most_likely / correct=3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
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

-- Q60: medium / apply / first_action / correct=0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
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
),

-- Q61: medium / apply / first_action / correct=1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'security_metrics',
  'A security team is establishing account management metrics. They need to verify that only authorized users have access to a financial application used by 5,000 employees. Reviewing every account is not feasible within the audit timeline. What should be the FIRST approach to conducting the access review?',
  '["Skip the review and accept the risk until the next audit cycle", "Select a random sample of accounts for review to represent the population", "Review only the accounts that have been inactive for over 90 days", "Review only executive-level accounts since they have the most privilege"]'::jsonb,
  1,
  'When reviewing the entire population is not feasible, random sampling is the accepted audit approach. The sample must be truly random to be representative of the population. Sampling allows the team to make reasonable inferences about the overall access control posture. Reviewing only inactive or executive accounts introduces bias and does not represent the full population.',
  'Sampling must be RANDOM to be valid. Not convenience, not targeted — random. Random sample = representative population.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q62: medium / apply / scenario / correct=2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'sast_dast_iast',
  'A software company wants to deploy a security testing solution that monitors HTTP traffic, examines backend database connections, and analyzes application framework behavior — all while the application is running and with access to its source code. Which technology BEST meets these requirements?',
  '["Static Application Security Testing (SAST)", "Web Application Firewall (WAF)", "Interactive Application Security Testing (IAST)", "Network Intrusion Detection System (NIDS)"]'::jsonb,
  2,
  'IAST combines real-time runtime analysis (like DAST) with source code visibility (like SAST). It specifically analyzes HTTP/HTTPS traffic, application frameworks, and backend connections while the application runs. This hybrid approach provides comprehensive coverage that neither SAST (static, no runtime) nor DAST (runtime, no code access) can achieve alone.',
  'IAST = Inside + Active. It sees the code AND watches it run. Best of both SAST and DAST worlds.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q63: medium / remember / except_not / correct=3
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.3, a = 0.8 + (-0.1) = 0.7, c = 0.25
(
  6,
  'log_management',
  'All of the following are components of the log lifecycle EXCEPT:',
  '["Generation and transmission of log events", "Collection and normalization of log data", "Analysis and correlation of log entries", "Encryption and digital signing of each individual log entry at the source"]'::jsonb,
  3,
  'The log lifecycle consists of generation, transmission, collection, normalization, analysis, retention, and disposal. While log integrity is important, the standard log lifecycle does not include encrypting and digitally signing each individual log entry at the source as a lifecycle phase. Some organizations may implement log signing for integrity, but it is not a standard lifecycle phase.',
  'Log lifecycle: Generate, Transmit, Collect, Normalize, Analyze, Retain, Dispose. GTCNARD.',
  'remember',
  'except_not',
  'medium',
  0.70, -0.30, 0.25,
  'ai_generated', true
),

-- Q64: medium / remember / best_answer / correct=0
-- IRT: b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  6,
  'testing_approaches',
  'After deploying a major update to a customer-facing web application, the operations team needs to quickly verify that core functionality like login, search, and checkout are still working. They need the fastest possible validation. Which testing approach BEST meets this need?',
  '["Smoke tests targeting the most critical user workflows", "Full regression test suite covering all application features", "Comprehensive penetration test of the updated components", "Complete Fagan inspection of all changed code modules"]'::jsonb,
  0,
  'Smoke tests are quick tests of critical functionality designed to verify that the most essential features are working after a deployment. They provide rapid validation without the time investment of a full regression suite. Full regression testing, penetration testing, and Fagan inspections are all more thorough but take significantly longer and are not suitable for quick post-deployment verification.',
  'Smoke test = quick sniff test. Does it catch fire? Check the critical stuff fast. Like a smoke detector — quick alert.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q65: medium / apply / first_action / correct=1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'vulnerability_assessment',
  'A security analyst is designing a testing strategy for a new hybrid cloud environment that includes on-premise servers, AWS cloud resources, and connectivity between them. The analyst must ensure security controls are validated across all components. Which area should the analyst prioritize FIRST beyond standard on-premise or cloud testing?',
  '["Individual server patch levels in the on-premise data center", "The integration points, data flows, and access management between on-premise and cloud environments", "The physical security of the cloud provider''s data center", "The source code of the cloud provider''s management console"]'::jsonb,
  1,
  'Hybrid environments require special attention to the integration points between on-premise and cloud resources. This includes access management integration, data flow security controls, API connections, and identity federation. While individual component testing is important, the unique risk in hybrid environments lies at the boundaries where the two environments connect and exchange data.',
  'Hybrid = where two worlds meet. The integration points are where risk hides. Test the seams, not just the fabric.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q66: medium / understand / scenario / correct=2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  6,
  'false_positives',
  'A penetration testing firm delivers a report containing 15 critical findings to a client. Upon review, the client''s internal security team determines that 8 of the findings cannot actually be exploited due to compensating controls the pen testers were unaware of. From the client''s perspective, how should these 8 findings be classified?',
  '["True positives that should be remediated immediately", "False negatives that the pen testers missed", "Findings that are technically accurate but mitigated by compensating controls, requiring documentation rather than remediation", "Scanner errors that indicate the pen testing tools are outdated"]'::jsonb,
  2,
  'These findings are technically accurate — the vulnerabilities exist — but compensating controls prevent exploitation. They are not false positives (the vulnerabilities are real) nor false negatives (they were found). The appropriate response is to document the compensating controls as mitigating factors and maintain them. The risk is accepted through the compensating controls rather than direct remediation.',
  'Real vuln + compensating control = mitigated risk. Document the compensating control; do not ignore the finding.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q67: medium / apply / calculation / correct=3
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  6,
  'security_metrics',
  'During software testing, the QA team discovered 45 defects. After the software was released to production, users reported 15 additional defects that were missed during testing. What is the defect detection effectiveness?',
  '["25%", "33%", "45%", "75%"]'::jsonb,
  3,
  'Defect Detection Effectiveness = (Defects found during testing / Total defects found) x 100. Total defects = 45 (found during testing) + 15 (found in production) = 60. Effectiveness = (45 / 60) x 100 = 75%. This means the testing process caught 75% of all defects before release, while 25% escaped to production.',
  'DDE = Testing defects / All defects x 100. Found 45 of 60 total = 75%. Higher is better — you caught more bugs before release.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q68: medium / understand / except_not / correct=0
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  6,
  'code_review',
  'All of the following are recognized code review methods EXCEPT:',
  '["Boundary value analysis of application input fields", "Fagan inspection with formal entry and exit criteria", "Peer review where developers examine each other''s code", "Automated static analysis tool scanning for insecure patterns"]'::jsonb,
  0,
  'Boundary value analysis is a software testing technique for input validation, not a code review method. Recognized code review methods include Fagan inspections (the most formal, with six phases), peer reviews (developers reviewing each other''s work), code walkthroughs, senior developer sign-off, and automated review tools. Code review examines the source code itself, while boundary value analysis tests application behavior at input boundaries.',
  'Code review methods: Fagan (formal), peer review, walkthrough, automated tools. BVA is input testing, not code review.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q69: medium / apply / most_likely / correct=1
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  6,
  'credentialed_scanning',
  'A vulnerability scan report shows that a Windows server has a critical SMB vulnerability. The scan was performed without credentials from outside the network. When the security team logs into the server, they discover the SMB service is disabled and the relevant ports are blocked at the firewall. What has MOST LIKELY occurred?',
  '["The server was compromised and the attacker disabled SMB after exploitation", "The uncredentialed scan produced a false positive because it could not verify the actual service state", "The firewall is misconfigured and allowing SMB traffic intermittently", "The vulnerability database used by the scanner is outdated and reporting retired CVEs"]'::jsonb,
  1,
  'Uncredentialed scans cannot authenticate to verify the actual state of services and configurations on target systems. The scanner likely detected the SMB port or inferred its presence from the Windows OS fingerprint and assumed the vulnerability existed. Since SMB is actually disabled and blocked, this is a false positive — a common outcome of uncredentialed scanning where the scanner cannot verify its assumptions.',
  'Uncredentialed scan says it is there, but it is not = false positive. No credentials means more guessing, more false positives.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q70: medium / analyze / tlatm / correct=2
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'audit_standards',
  'Your organization relies on a payroll processing service provider. The external auditors request evidence that the provider''s controls over financial transaction processing are effective. As the security manager, which SOC report should you request from the provider?',
  '["SOC 2 Type I covering security and availability trust services", "SOC 3 report for public distribution to stakeholders", "SOC 1 Type II covering controls relevant to financial reporting over a period of time", "SOC 2 Type II covering all five trust services criteria"]'::jsonb,
  2,
  'SOC 1 reports focus specifically on controls relevant to financial reporting — which is exactly what payroll processing financial transactions require. Type II provides assurance that controls are not just designed properly but are operating effectively over a period of time. SOC 2 covers broader trust services criteria and while useful, does not specifically address financial reporting control requirements that auditors need for payroll processing assurance.',
  'Payroll = financial transactions = SOC 1. SOC 1 = Financial focus. SOC 2 = Security/trust focus. Match the report to the need.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD (20) — IRT b base = 1.5 — Questions 71-90
-- ═══════════════════════════════════════════════════════════

-- Q71: hard / apply / scenario / correct=3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'soc_reports',
  'A multinational bank is evaluating a cloud service provider for storing customer financial data. The provider presents a SOC 2 Type II report that includes security and availability trust services criteria but excludes confidentiality and processing integrity. The bank''s compliance team also needs assurance about the provider''s financial transaction processing controls. What combination of reports should the bank request?',
  '["The existing SOC 2 Type II report is sufficient since it covers security", "A SOC 3 report for public distribution plus a SOC 1 Type I for financial controls", "A new SOC 2 Type I report that includes all five trust services criteria", "A SOC 2 Type II report including confidentiality and processing integrity, plus a SOC 1 Type II for financial reporting controls"]'::jsonb,
  3,
  'The bank needs comprehensive assurance. The current SOC 2 Type II excludes confidentiality and processing integrity, which are critical for financial data. A complete SOC 2 Type II including these criteria addresses the trust services gap. Additionally, a SOC 1 Type II specifically covers financial reporting controls over time, addressing the compliance team''s concern about financial transaction processing that SOC 2 does not cover.',
  'Financial data needs: SOC 2 with confidentiality + processing integrity for security, SOC 1 for financial controls. Both Type II for operational effectiveness.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: hard / analyze / first_action / correct=0
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'penetration_testing',
  'During an authorized penetration test, the testing team discovers evidence of an actual ongoing breach by an external threat actor — including active command-and-control communications and data exfiltration from a database server. The pen test scope does not address incident response. What should be the FIRST action?',
  '["Immediately stop the penetration test and notify the organization''s incident response team of the active breach", "Continue the penetration test and document the breach findings in the final report", "Attempt to block the threat actor''s command-and-control channel to help the client", "Contact law enforcement directly without informing the client first"]'::jsonb,
  0,
  'Discovering an active breach during a pen test is a critical situation that takes priority over the engagement scope. The first action is to stop testing and immediately notify the client''s incident response team. Continuing to test could interfere with the breach or the subsequent investigation. The pen testers should not attempt remediation themselves or contact law enforcement without client authorization.',
  'Active breach trumps pen test scope. Stop testing, notify the client immediately. Do not play hero — let IR handle it.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q73: hard / apply / scenario / correct=1
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'sast_dast_iast',
  'A healthcare software company is developing a HIPAA-compliant patient portal. The security team has implemented SAST in the CI/CD pipeline and DAST scanning against the staging environment. Despite these measures, a security incident reveals that a vulnerability was exploitable only when specific framework middleware processed patient data in a particular sequence. Which additional testing approach would have been MOST effective at catching this type of vulnerability?',
  '["More frequent DAST scans of the production environment", "IAST that monitors framework behavior and data flow during runtime with code visibility", "Manual penetration testing by an external firm", "Additional unit tests for the patient data processing module"]'::jsonb,
  1,
  'IAST is uniquely suited to detect vulnerabilities that manifest through framework middleware behavior during runtime. By combining code visibility (like SAST) with runtime monitoring (like DAST), IAST can trace data flow through frameworks and middleware, identifying vulnerabilities that emerge from specific processing sequences. SAST alone cannot see runtime behavior, and DAST alone cannot see internal code and framework interactions.',
  'IAST fills the gap between SAST and DAST. When the vulnerability lives in the framework layer during runtime, IAST sees it from both sides.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q74: hard / analyze / tlatm / correct=2
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.5, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'security_metrics',
  'The board of directors reviews the annual security report and notes that the organization achieved a 99.5% vulnerability remediation rate. However, the CISO knows that 70% of remediated vulnerabilities were low-severity informational findings, while several critical vulnerabilities remained unpatched for over 120 days. From a management perspective, what does this situation BEST illustrate?',
  '["The security program is highly effective based on the remediation percentage", "The vulnerability management program needs more automated scanning tools", "The reported metric is misleading because it does not account for severity weighting, and KRIs should supplement KPIs to show risk exposure", "The remaining 0.5% of unpatched vulnerabilities is an acceptable level of residual risk"]'::jsonb,
  2,
  'This scenario illustrates a common metrics trap where a high-level KPI (99.5% remediation rate) masks underlying risk. Without severity weighting, remediating many low-severity findings inflates the metric while critical vulnerabilities persist. A manager should recognize that KPIs alone are insufficient and should be supplemented with KRIs that show the actual risk exposure, such as the age and severity of unpatched vulnerabilities.',
  'Metrics can lie. A high remediation rate means nothing if critical vulns linger. Weight by severity. Combine KPIs with KRIs.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.50, 0.20,
  'ai_generated', true
),

-- Q75: hard / apply / first_action / correct=3
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'vulnerability_assessment',
  'A security researcher discovers a zero-day vulnerability in a widely used open-source encryption library that could allow remote code execution. The researcher has verified the vulnerability is exploitable. Following ethical disclosure principles, what should be the FIRST action?',
  '["Publish the vulnerability details on a public security mailing list to warn all users", "Develop and release a proof-of-concept exploit to demonstrate the severity", "Present the findings at the next security conference for maximum visibility", "Privately notify the library maintainers and provide them reasonable time to develop a patch"]'::jsonb,
  3,
  'Ethical disclosure (also called responsible disclosure) requires that the researcher first privately notify the vendor or maintainers, providing them reasonable time to develop and release a patch before any public disclosure. Public disclosure before a patch is available would expose all users to exploitation. Only if the vendor fails to act within a reasonable timeframe should the researcher consider public disclosure.',
  'Ethical disclosure = private first, public later. Give the vendor time to fix it before telling the world.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q76: hard / analyze / scenario / correct=0
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'testing_approaches',
  'An application accepts a numeric input field for quantity with a valid range of 1 to 999. The QA team decides to test with values -1, 0, 1, 2, 500, 998, 999, 1000, and 1001. The team also tests the input with letter characters and special symbols. Which combination of testing techniques is the team employing?',
  '["Boundary value analysis combined with equivalence partitioning and negative testing", "Fuzz testing combined with stress testing and performance benchmarking", "Regression testing combined with acceptance testing and load testing", "Decision table analysis combined with state-based testing and unit testing"]'::jsonb,
  0,
  'The team is using boundary value analysis (testing at edges: -1, 0, 1, 999, 1000, 1001), equivalence partitioning (testing representatives from valid and invalid ranges: 2, 500, 998), and negative testing (testing with letters and special symbols to verify graceful error handling). These three techniques together provide comprehensive input validation coverage.',
  'Boundaries = edges (0, 1, 999, 1000). Equivalence = middle representatives. Negative = bad inputs. Three complementary techniques.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q77: hard / apply / best_answer / correct=1
-- IRT: b = 1.5 + 0.3 + 0.0 = 1.8, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'log_review_siem',
  'A financial institution needs to ensure that its security logs can be used as evidence in legal proceedings. The logs must demonstrate integrity, authenticity, and an unbroken chain of custody. Which approach BEST supports the admissibility of log evidence?',
  '["Store logs on the same server that generates them with standard file permissions", "Implement centralized log collection with write-once storage, cryptographic hashing, and access controls documenting the chain of custody", "Email log summaries daily to the legal department for filing", "Print critical log entries and store them in a physical safe"]'::jsonb,
  1,
  'For logs to be admissible as legal evidence, they must demonstrate integrity (not tampered with), authenticity (from the claimed source), and chain of custody (documented handling from creation to presentation). Centralized collection with write-once storage prevents tampering, cryptographic hashing proves integrity, and documented access controls maintain the chain of custody.',
  'Legal evidence needs: Integrity (hashing), Authenticity (source verified), Chain of custody (documented handling). Write-once = tamper-proof.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- Q78: hard / analyze / comparison / correct=2
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  6,
  'cve_cvss',
  'Two vulnerabilities are identified in the same web application. Vulnerability A has a CVSS base score of 7.5 but affects a development test server with no customer data. Vulnerability B has a CVSS base score of 5.5 but affects the production payment processing server handling millions of transactions daily. When prioritizing remediation, how should these be compared?',
  '["Vulnerability A should be fixed first because it has a higher CVSS base score", "Both should be remediated simultaneously since they are in the same application", "Vulnerability B should be prioritized because CVSS environmental scoring and business context make it a higher actual risk", "Neither requires immediate action since neither score reaches the critical threshold"]'::jsonb,
  2,
  'While CVSS base scores provide a standardized severity measure, remediation prioritization must also consider the environmental context and business impact. Vulnerability B on the production payment server represents a much higher actual risk despite its lower base score because of the asset criticality, data sensitivity, and transaction volume. CVSS environmental metrics exist specifically to adjust base scores for organizational context.',
  'CVSS base score is not the whole story. Business context matters. A medium vuln on your crown jewel outranks a high vuln on a test box.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q79: hard / apply / first_action / correct=3
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'pentest_methodology',
  'A penetration testing team is conducting an engagement against a large enterprise. During the exploitation phase, the team gains access to an internal server and discovers it connects to a database containing personally identifiable information (PII) of customers. The original scope authorization only covered network infrastructure testing, not database or PII access. What should the team do FIRST?',
  '["Proceed to extract a sample of PII records to demonstrate the severity of the finding", "Modify the database permissions to prevent further unauthorized access", "Continue testing other network targets and mention the database in the report", "Stop testing the database immediately, document the finding, and contact the client to discuss expanding the scope"]'::jsonb,
  3,
  'Penetration testers must operate strictly within the authorized scope. Accessing PII beyond the scope could violate privacy regulations and the engagement agreement. The correct action is to stop, document what was found, and immediately contact the client. The client can then decide whether to expand the scope with proper authorization. Extracting PII or modifying systems would exceed the authorized boundaries.',
  'Stay in scope. When you find something outside your lane, stop and call the client. Never exceed authorized boundaries.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q80: hard / analyze / first_action / correct=0
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'audit_standards',
  'During an internal audit, the audit team discovers that several critical security controls documented in the organization''s security policy are not actually implemented. The system owners acknowledge the gap but argue that compensating controls adequately address the risk. What should the internal auditor do FIRST?',
  '["Document the findings objectively, noting both the control gaps and the claimed compensating controls, for management review", "Accept the system owners'' explanation and close the audit finding", "Immediately implement the missing controls without management approval", "Report the system owners to external regulators for non-compliance"]'::jsonb,
  0,
  'The auditor''s role is to document findings objectively and present them to management, not to make remediation decisions. The auditor should note the policy-to-implementation gap, document the compensating controls claimed by the system owners, and present both to management for a decision. Remediation accountability rests with system owners and management, not with the auditor.',
  'Auditor = document and report. Management = decide and fix. The auditor does not remediate — they inform decision-makers.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q81: hard / apply / best_answer / correct=1
-- IRT: b = 1.5 + 0.3 + 0.0 = 1.8, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'fuzz_testing',
  'A security team is testing an IoT device''s firmware update mechanism. The update protocol uses a proprietary binary format with specific header structures, checksums, and encrypted payload sections. Which fuzzing strategy BEST maximizes the chance of discovering exploitable vulnerabilities in the update parser?',
  '["Random byte generation with no protocol awareness", "Generational fuzzing that understands the header structure and can generate valid checksums while malforming payload content", "Mutation fuzzing that randomly flips bits in captured valid update packages", "Static analysis of the firmware binary without any dynamic testing"]'::jsonb,
  1,
  'For a proprietary binary protocol with specific structure requirements, generational fuzzing is most effective because it can create inputs that pass initial parsing checks (valid headers, correct checksums) while intentionally malforming deeper payload content. Mutation fuzzing would likely fail initial validation checks because random modifications would corrupt checksums and headers, preventing the fuzzer from reaching deeper code paths.',
  'Complex protocols need intelligent fuzzing. Generational = passes the front door checks, then breaks things inside.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- Q82: hard / analyze / scenario / correct=2
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'credentialed_scanning',
  'An organization performs quarterly vulnerability scans using both credentialed and uncredentialed methods. The latest credentialed scan found 50 high-severity vulnerabilities, while the uncredentialed scan found 120 high-severity vulnerabilities on the same systems. Upon investigation, 85 of the uncredentialed findings are confirmed false positives, while 15 vulnerabilities found by the uncredentialed scan were NOT detected by the credentialed scan. What does this analysis reveal about the scanning program?',
  '["The credentialed scan is unreliable and should be replaced", "The uncredentialed scan is more accurate and should be the primary method", "Both scan types provide complementary value — credentialed scans are more accurate while uncredentialed scans may catch externally visible issues missed by internal inspection", "The vulnerability database needs updating since both scans produce different results"]'::jsonb,
  2,
  'This scenario demonstrates that credentialed and uncredentialed scans serve complementary purposes. Credentialed scans are more accurate (fewer false positives) because they verify actual configurations, but uncredentialed scans test from an external perspective and may identify issues visible only from outside the system. Using both provides the most comprehensive assessment — a defense-in-depth approach to vulnerability management.',
  'Credentialed = fewer false positives, deeper insight. Uncredentialed = attacker view, catches external issues. Use BOTH for best coverage.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q83: hard / apply / first_action / correct=3
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'testing_approaches',
  'The security team discovers that a critical web application has never undergone any security testing. The application handles sensitive customer data, processes financial transactions, and has been in production for two years. Resources are limited and the team can only perform one type of testing immediately. What should they do FIRST?',
  '["Conduct a full Fagan inspection of the entire application source code", "Perform generational fuzz testing against all input fields", "Schedule a red team exercise simulating an advanced persistent threat", "Run a credentialed vulnerability assessment to identify the most critical known weaknesses quickly"]'::jsonb,
  3,
  'With limited resources and no prior security testing on a critical production application, a credentialed vulnerability assessment provides the fastest path to identifying known critical weaknesses. It is automated, relatively fast (hours rather than days or weeks), produces actionable results, and when credentialed, provides accurate findings with fewer false positives. This establishes a baseline from which to prioritize further testing such as penetration testing or code review.',
  'First time testing? Start with vulnerability assessment. Fast, automated, establishes baseline. Then layer on pen testing and code review.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q84: hard / analyze / most_likely / correct=0
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  6,
  'log_management',
  'A forensic investigation reveals that an attacker compromised a web server three weeks ago but the earliest available logs are only seven days old. The server uses circular overwrite with a 10-day retention window, and the SIEM was not configured to collect logs from this particular server. What is MOST LIKELY the root cause of the evidence gap?',
  '["Inadequate log retention policy combined with incomplete SIEM onboarding that left the web server''s logs uncollected centrally", "The attacker deleted all logs as part of the compromise", "The circular overwrite feature malfunctioned and deleted logs prematurely", "The forensic team is looking at the wrong server for evidence"]'::jsonb,
  0,
  'The evidence gap has two contributing factors: the circular overwrite policy only retains 10 days of logs (and the breach occurred 21 days ago), and the SIEM was not collecting logs from this server. Even with circular overwrite, if logs had been forwarded to the SIEM, they would have been retained according to the SIEM''s retention policy. This highlights the importance of both adequate retention policies and comprehensive SIEM coverage.',
  'Two failures: short retention + incomplete SIEM coverage. Either one alone might have preserved evidence. Defense in depth applies to logging too.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q85: hard / apply / scenario / correct=1
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'team_exercises',
  'An organization conducts a security exercise where the red team launches a simulated phishing campaign and attempts network exploitation. The blue team is unaware the exercise is occurring and responds to alerts as real incidents. Senior management observes from a dedicated war room and documents the timeline of events and team decisions. Which exercise configuration is being described?',
  '["Blind penetration test with white team oversight", "Double-blind exercise with red, blue, and white team roles where only senior management and white team are aware", "Purple team collaboration exercise with shared objectives", "Tabletop exercise with theoretical scenario discussion"]'::jsonb,
  1,
  'This is a double-blind exercise because the blue team is unaware testing is occurring (both teams are "blind"). The red team simulates attacks, the blue team responds genuinely, and the white team (senior management observing from the war room) documents lessons learned. Double-blind exercises provide the most realistic assessment of detection and response capabilities.',
  'Double-blind = everyone is in the dark except the watchers. Red attacks, blue defends for real, white watches and records.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q86: hard / analyze / comparison / correct=2
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
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

-- Q87: hard / apply / calculation / correct=3
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
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

-- Q88: hard / apply / except_not / correct=0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + (-0.1) = 1.2, c = 0.25
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

-- Q89: hard / analyze / scenario / correct=1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
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

-- Q90: hard / apply / calculation / correct=2
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
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
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD (10) — IRT b base = 2.5 — Questions 91-100
-- ═══════════════════════════════════════════════════════════

-- Q91: very_hard / analyze / scenario / correct=3
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
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

-- Q92: very_hard / analyze / tlatm / correct=0
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
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

-- Q93: very_hard / analyze / scenario / correct=1
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
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

-- Q94: very_hard / analyze / first_action / correct=2
-- IRT: b = 2.5 + 0.6 + 0.3 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
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

-- Q95: very_hard / apply / calculation / correct=3
-- IRT: b = 2.5 + 0.3 + 0.4 = 3.0 (clamped), a = 1.3 + 0.3 = 1.6, c = 0.20
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
),

-- Q96: very_hard / analyze / tlatm / correct=0
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
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

-- Q97: very_hard / analyze / most_likely / correct=1
-- IRT: b = 2.5 + 0.6 + 0.1 = 3.0 (clamped), a = 1.5 + 0.1 = 1.6, c = 0.22
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

-- Q98: very_hard / analyze / scenario / correct=2
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
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

-- Q99: very_hard / analyze / tlatm / correct=3
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
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

-- Q100: very_hard / analyze / scenario / correct=0
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
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
);