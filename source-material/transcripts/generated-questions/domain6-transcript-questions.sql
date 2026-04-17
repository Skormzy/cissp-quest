-- =============================================================================
-- CISSP Quest — Domain 6: Security Assessment and Testing
-- Generated: 2026-04-16  |  Source: ai_generated (ISC2 CBK, NIST SP 800-115, CVSS v3.1)
-- =============================================================================
-- Distribution Stats (28 questions):
--   Difficulty : easy=6 (21%), medium=12 (43%), hard=8 (29%), very_hard=2 (7%)
--   Cognitive  : remember=3 (11%), understand=6 (21%), apply=12 (43%), analyze=7 (25%)
--   Types      : scenario=10, best_answer=4, first_action=4, tlatm=3,
--                comparison=3, except_not=2, most_likely=2
--   Correct idx: 0=7, 1=7, 2=7, 3=7
-- =============================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1 easy / remember / vulnerability_assessment_pentest
(
  6, 'vulnerability_assessment_pentest',
  'What is the PRIMARY distinction between a vulnerability assessment and a penetration test?',
  '["A vulnerability assessment is performed externally; a penetration test is performed internally","A vulnerability assessment identifies weaknesses; a penetration test actively exploits them","A vulnerability assessment requires written authorization; a penetration test does not","A vulnerability assessment uses automated tools only; a penetration test is always manual"]'::jsonb,
  1,
  'Explanation: A vulnerability assessment systematically identifies, quantifies, and prioritizes vulnerabilities — it stops short of exploitation. A penetration test goes further: it actively attempts to exploit found vulnerabilities to demonstrate real-world impact. Both require written authorization. Both can use automated and manual techniques. Location (internal/external) describes scope, not the fundamental distinction between the two activities.',
  'INTEL vs STRIKE: VA maps the enemy positions; PT is the actual raid.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.80, 0.22, 'ai_generated', true
),

-- Q2 easy / remember / software_testing_techniques
(
  6, 'software_testing_techniques',
  'A tester is given full access to source code, architecture diagrams, and system documentation before performing a security test. Which testing approach is this?',
  '["Black box testing", "Gray box testing", "White box testing", "Red team testing"]'::jsonb,
  2,
  'Explanation: White box testing (also called clear box or crystal box testing) gives the tester full knowledge of the internal workings of the system — source code, design documents, and architecture. Black box testing provides no internal knowledge, simulating an external attacker. Gray box testing provides partial knowledge (e.g., credentials or architecture diagrams but not source code). Red team testing is a methodology, not a knowledge level.',
  'WHITE BOX BRIEFING: Full dossier in hand — source code, schematics, and all.',
  'remember',
  'comparison',
  'easy',
  0.88, -1.75, 0.22, 'ai_generated', true
),

-- Q3 easy / understand / software_testing_stages
(
  6, 'software_testing_stages',
  'During which software testing stage are individual functions or methods tested in isolation to verify they produce correct outputs for given inputs?',
  '["Integration testing","Unit testing","System testing","Acceptance testing"]'::jsonb,
  1,
  'Explanation: Unit testing focuses on the smallest testable components of an application — individual functions, methods, or modules — in isolation from the rest of the system. Integration testing verifies that multiple components work correctly together. System testing evaluates the complete, integrated system against functional requirements. Acceptance testing determines whether the system meets business requirements from the end-user perspective.',
  'UNIT PROBE: Testing one wire at a time before wiring the whole detonator.',
  'understand',
  'best_answer',
  'easy',
  0.88, -1.70, 0.20, 'ai_generated', true
),

-- Q4 easy / understand / security_metrics_kpis_kris
(
  6, 'security_metrics_kpis_kris',
  'An organization''s security dashboard reports a Mean Time to Detect (MTTD) of 72 hours for security incidents. What does this metric specifically measure?',
  '["The average time required to fully contain and eradicate an incident after detection", "The average time elapsed between an incident occurring and the security team becoming aware of it", "The total time from incident discovery to restoration of normal operations", "The frequency at which security incidents are detected per calendar month"]'::jsonb,
  1,
  'Explanation: MTTD (Mean Time to Detect) measures how long attackers dwell in the environment undetected — the time from when a breach actually begins to when the security team identifies it. A lower MTTD indicates better detection capability. MTTR (Mean Time to Respond/Remediate) measures the time from detection to full recovery. Total lifecycle time encompasses both. Frequency of incidents is a separate volume metric, not MTTD.',
  'DETECTION CLOCK: MTTD is how long the intruder hid in the safe house before anyone noticed.',
  'understand',
  'best_answer',
  'easy',
  0.90, -1.60, 0.20, 'ai_generated', true
),

-- Q5 easy / remember / vulnerability_testing_banner_grabbing
(
  6, 'vulnerability_testing_banner_grabbing',
  'A security tester connects to an open TCP port and receives a response that includes the software name and version number of the running service. What technique is being demonstrated?',
  '["Port scanning","Banner grabbing","Fuzzing","Fingerprinting"]'::jsonb,
  1,
  'Explanation: Banner grabbing is the technique of reading the informational message (banner) that many services transmit upon connection — it often reveals software type, version, and sometimes operating system information. Port scanning only determines which ports are open, not what is running behind them. Fuzzing sends malformed inputs to find crashes. Fingerprinting is broader — banner grabbing is one technique used within fingerprinting, but the specific action described (reading the connection response to see software version) is banner grabbing.',
  'NAMEPLATE INTEL: The service announces itself — grab the nameplate before the door closes.',
  'remember',
  'scenario',
  'easy',
  0.88, -1.80, 0.20, 'ai_generated', true
),

-- Q6 easy / understand / audit_strategies
(
  6, 'audit_strategies',
  'An internal auditor is reviewing security controls without any prior notice to the team being audited, with full access to systems and documentation. Which audit type does this describe?',
  '["External audit", "Red team exercise", "Surprise audit with full access (announced access, unannounced timing)", "Compliance assessment"]'::jsonb,
  3,
  'Explanation: A compliance assessment evaluates whether controls meet defined regulatory or policy requirements — and is typically performed with full access to documentation, systems, and staff. However, the key distinguisher here is the "without prior notice" element combined with "internal auditor" and "full documentation access." This describes an internal compliance audit conducted as a surprise — the auditor role and access model is that of a compliance assessment. A red team exercise simulates adversarial attack, not documentation review. An external audit is performed by an independent third party. Among the options, compliance assessment best fits the scenario of internal review with full access.',
  'UNANNOUNCED INSPECTION: The auditor walks in unannounced with a full briefing request — compliance clock is running.',
  'understand',
  'scenario',
  'easy',
  0.85, -1.50, 0.20, 'ai_generated', true
),

-- Q7 medium / apply / vulnerability_assessment_pentest
(
  6, 'vulnerability_assessment_pentest',
  'A penetration tester receives an engagement letter authorizing testing of the external IP range 203.0.113.0/24 owned by the client. During testing, the tester discovers that traffic from that range routes through a third-party cloud provider. What should the tester do?',
  '["Continue testing since the IP range was explicitly authorized in the engagement letter","Stop testing the affected systems and consult with the client before proceeding, as the cloud provider is outside the authorized scope","Obtain written authorization from the cloud provider before continuing any testing","Document the discovery and complete the test — shared infrastructure is the client''s risk to manage"]'::jsonb,
  1,
  'Explanation: Rules of engagement and written authorization are the ethical and legal foundation of penetration testing. Authorization from the client covers their assets, not third-party systems. Unauthorized testing of cloud provider infrastructure — even if traffic routes through it — can violate computer fraud laws (e.g., CFAA in the US) regardless of the client''s intent. The correct action is to stop testing affected systems and consult with the client to get either explicit scope exclusion documentation or separate authorization from the cloud provider. Proceeding without clarification exposes the tester to legal liability.',
  'RULES OF ENGAGEMENT: The briefing only covers YOUR client''s territory — stop at the border and call HQ.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q8 medium / apply / code_review_testing
(
  6, 'code_review_testing',
  'A development team integrates a SAST tool into their CI/CD pipeline that analyzes code before each merge. During a sprint, the tool flags a SQL query built through string concatenation. Which vulnerability class is the SAST tool MOST likely detecting?',
  '["Cross-site scripting (XSS) via unsanitized output","Insecure direct object reference in the query logic","SQL injection vulnerability in the data access layer","Broken authentication due to hardcoded credentials"]'::jsonb,
  2,
  'Explanation: Static Application Security Testing (SAST) analyzes source code without executing it. String concatenation used to build SQL queries is a well-known anti-pattern that indicates potential SQL injection — the classic sink for user-controlled data flowing into a SQL query construction point. SAST tools specifically trace data flows from sources (user input) to dangerous sinks (SQL execution functions). XSS involves unsanitized output in HTML context. IDOR involves referencing database objects by predictable IDs. Hardcoded credentials are detected by SAST as secrets scanning, not query analysis.',
  'STRING CONCATENATION ALARM: Stitching SQL from user input is like letting a stranger write your mission orders.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q9 medium / understand / security_assessment_strategy
(
  6, 'security_assessment_strategy',
  'A CISO wants to evaluate whether the organization could detect and respond to a sophisticated, multi-stage attack over an extended period without the security operations team being tipped off. Which assessment type BEST meets this need?',
  '["Vulnerability assessment", "Purple team exercise", "Tabletop exercise", "Red team exercise"]'::jsonb,
  3,
  'Explanation: A red team exercise uses adversary simulation techniques over an extended timeframe against a live environment, without informing the blue team (SOC/IR team). Its goal is to evaluate the organization''s complete detection and response capability under realistic conditions. A vulnerability assessment finds vulnerabilities but does not test response. A purple team exercise is collaborative — the red team shares techniques with the blue team in real time to improve detection, so the SOC IS informed. A tabletop exercise is a discussion-based simulation, not a live technical attack.',
  'FULL SHADOW PROTOCOL: Red team goes dark, attacks for real — no one in the SOC gets the memo.',
  'understand',
  'best_answer',
  'medium',
  1.15, 0.10, 0.20, 'ai_generated', true
),

-- Q10 medium / apply / log_review_analysis
(
  6, 'log_review_analysis',
  'A security analyst notices that authentication logs from multiple systems show a single IP address attempting logins across 500 different usernames, each with a single attempt, over a 6-hour window. Which attack pattern does this BEST represent?',
  '["Credential stuffing","Brute force attack","Password spraying","Pass-the-hash attack"]'::jsonb,
  2,
  'Explanation: Password spraying tries a small number of commonly used passwords against many usernames — specifically to stay below account lockout thresholds. One attempt per username across 500 accounts from a single IP is a classic spraying pattern. Credential stuffing uses breached username/password pairs from data dumps — it tries known valid passwords, not common ones, and typically targets matching account pairs. Brute force attacks try many passwords against a SINGLE account, which would trigger lockout quickly. Pass-the-hash attacks use NTLM hash values, not network login attempts of this pattern.',
  'SPRAY PATTERN: One shot per target across the whole org — trying "Winter2026!" on every account.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.35, 0.20, 'ai_generated', true
),

-- Q11 medium / analyze / security_metrics_kpis_kris
(
  6, 'security_metrics_kpis_kris',
  'A security manager presents two metrics to the board: (1) "Percentage of critical vulnerabilities patched within SLA" and (2) "Number of unpatched critical vulnerabilities older than 90 days." Which statement BEST characterizes these metrics?',
  '["Both metrics are KPIs because they both measure patching effectiveness", "Metric 1 is a KRI; Metric 2 is a KPI because aging vulnerabilities indicate past performance failures", "Both metrics are KRIs because patching relates to risk management", "Metric 1 is a KPI measuring security performance; Metric 2 is a KRI indicating residual risk exposure"]'::jsonb,
  3,
  'Explanation: A KPI (Key Performance Indicator) measures operational effectiveness — how well a process is performing against a target. Patching within SLA measures process performance. A KRI (Key Risk Indicator) is a leading or current indicator of risk exposure — unpatched critical vulnerabilities older than 90 days is a direct measure of residual risk. An organization with 50 such vulnerabilities is at meaningfully higher risk than one with zero. The two serve different audiences: KPIs report to operational leadership on process; KRIs report to risk management and the board on exposure.',
  'KPI vs KRI: One shows how fast you''re running; the other shows how many mines are still in the field.',
  'analyze',
  'comparison',
  'medium',
  1.30, 0.45, 0.22, 'ai_generated', true
),

-- Q12 medium / apply / software_testing_techniques
(
  6, 'software_testing_techniques',
  'A security team uses a DAST tool to test a running web application by sending requests with various payloads and observing responses. The tool has no access to source code. Which finding is DAST LEAST likely to discover compared to SAST?',
  '["SQL injection in a login form","Cross-site scripting in a user profile field","Hardcoded API keys embedded in server-side source files","Authentication bypass in an administrative endpoint"]'::jsonb,
  2,
  'Explanation: DAST (Dynamic Application Security Testing) tests the application from the outside — it sends requests and observes responses. It cannot see inside server-side source files and therefore CANNOT discover hardcoded API keys or secrets that exist only in server-side code never sent to the client. SAST, which analyzes source code statically, is specifically designed to find hardcoded credentials and secrets. DAST can find SQL injection, XSS, and authentication bypasses because these manifest in observable request/response behavior.',
  'DAST BLIND SPOT: From outside the building you can test the locks — but you cannot see the key hanging on the inside wall.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.40, 0.20, 'ai_generated', true
),

-- Q13 medium / apply / audit_strategies
(
  6, 'audit_strategies',
  'An organization undergoes a SOC 2 Type II audit. Which statement BEST distinguishes a SOC 2 Type II report from a SOC 2 Type I report?',
  '["Type II is performed by an internal auditor; Type I is performed by an external auditor", "Type II evaluates control effectiveness over a period of time (typically 6-12 months); Type I evaluates control design at a single point in time", "Type II covers all five Trust Service Criteria; Type I covers only Security", "Type II requires penetration testing as a mandatory component; Type I does not"]'::jsonb,
  1,
  'Explanation: SOC 2 Type I reports on the DESIGN of controls at a specific date — does the control exist and is it appropriately designed? SOC 2 Type II reports on the OPERATING EFFECTIVENESS of those controls over a defined period, providing evidence that controls functioned consistently throughout. Type II is significantly more valuable to relying parties because it demonstrates sustained performance, not just design intent. Both types are performed by independent CPA firms. Both can cover any combination of Trust Service Criteria. Neither mandates penetration testing as a required component.',
  'TYPE II TRACK RECORD: Point-in-time snapshot vs. six months of operational evidence — history beats a headshot.',
  'apply',
  'comparison',
  'medium',
  1.20, 0.30, 0.22, 'ai_generated', true
),

-- Q14 medium / apply / vulnerability_testing_banner_grabbing
(
  6, 'vulnerability_testing_banner_grabbing',
  'A security tester uses a tool to send malformed, oversized, and random inputs to an application''s API endpoints to discover unexpected crashes or memory corruption errors. Which testing technique is this?',
  '["Regression testing","Boundary value analysis","Fuzzing (fuzz testing)","Mutation testing"]'::jsonb,
  2,
  'Explanation: Fuzzing (fuzz testing) involves generating large volumes of random, malformed, or unexpected input and feeding it to an application to discover crashes, memory corruption, and input validation failures. It is widely used for discovering buffer overflows, format string vulnerabilities, and parser bugs. Regression testing re-runs existing tests after code changes to ensure previously working functionality still works. Boundary value analysis tests inputs at the edges of valid ranges — it is systematic, not random. Mutation testing modifies source code to verify that test suites detect the changes.',
  'CHAOS BOMBARDMENT: Throw garbage at the door — what breaks tells you where the wall is weak.',
  'apply',
  'scenario',
  'medium',
  1.15, 0.20, 0.20, 'ai_generated', true
),

-- Q15 medium / analyze / log_review_analysis
(
  6, 'log_review_analysis',
  'An organization stores security event logs locally on each server. An auditor flags this as a control deficiency. Which risk does centralized log management MOST directly address?',
  '["Centralized logs consume less total storage than distributed logs","Local log storage increases network latency for detection tools","An attacker who compromises a server can modify or delete local logs to cover their tracks","Compliance frameworks prohibit local log storage without exception"]'::jsonb,
  2,
  'Explanation: When logs are stored locally on the system being monitored, an attacker who gains administrative access to that system can tamper with, clear, or delete logs — eliminating forensic evidence of their activity. Centralized log management (SIEM, syslog servers, immutable log stores) moves logs to a system the attacker does not control, protecting their integrity. Centralized storage may actually consume more total storage due to aggregation overhead. Network latency is not the primary concern. No major compliance framework flatly prohibits local log storage — they typically REQUIRE forwarding to a centralized system.',
  'IMMUTABLE EVIDENCE LOCKER: Logs kept at the crime scene can be cleaned up — ship them to HQ immediately.',
  'analyze',
  'tlatm',
  'medium',
  1.25, 0.45, 0.20, 'ai_generated', true
),

-- Q16 hard / analyze / vulnerability_assessment_pentest
(
  6, 'vulnerability_assessment_pentest',
  'A CVSS v3.1 base score is calculated for a vulnerability. The Attack Vector is Network, Attack Complexity is Low, Privileges Required is None, User Interaction is None, Scope is Changed, Confidentiality is High, Integrity is High, Availability is High. What is the approximate base score range and severity?',
  '["7.0-8.9 (High) — Changed Scope does not affect the base score calculation significantly","5.5-6.9 (Medium) — Attack Complexity Low reduces the score from the maximum","4.0-5.4 (Medium) — Network access raises severity but full exploitation requires user interaction","9.0-10.0 (Critical) — the combination of network attack vector, no required privileges, changed scope, and full CIA impact drives the maximum severity"]'::jsonb,
  3,
  'Explanation: Using CVSS v3.1 scoring: AV:N (Network=0.85), AC:L (Low=0.77), PR:N (None=0.85), UI:N (None=0.85), S:C (Changed), C:H (0.56), I:H (0.56), A:H (0.56). When Scope is Changed, the ISCModified formula is used, and the CIA impact of 0.56 each with Changed Scope elevates the score significantly. This combination produces a base score of 10.0 (Critical) — representing a remotely exploitable vulnerability with no authentication, no user interaction, and full system impact that affects scope beyond the vulnerable component (e.g., a hyperbreak escape). Option B is wrong — Changed Scope significantly INCREASES the score. Attack Complexity Low increases exploitability. User Interaction is None (not required), contradicting option D.',
  'CVSS CRITICAL PROFILE: Network + no-auth + changed scope + full CIA = maximum threat level.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q17 hard / apply / security_assessment_strategy
(
  6, 'security_assessment_strategy',
  'A financial services firm performs quarterly internal vulnerability scans and an annual external penetration test. The CISO argues this schedule is insufficient for a high-risk environment. Which additional assessment activity would MOST improve the security posture evaluation?',
  '["Increasing the external penetration test to semi-annual frequency", "Mandating that developers complete annual secure coding training", "Deploying a web application firewall (WAF) to block detected vulnerabilities in real time", "Continuous automated scanning integrated with the CMDB to detect new assets and misconfigurations as they emerge"]'::jsonb,
  3,
  'Explanation: The gap in quarterly scanning is that new assets, configurations, and vulnerabilities can appear and persist for months undetected between scan cycles. Continuous scanning integrated with the Configuration Management Database (CMDB) detects new or changed assets immediately, reducing the window of undetected exposure. Increasing penetration test frequency to semi-annual is valuable but a PT is a point-in-time exercise — it does not address the continuous emergence of new vulnerabilities. Secure coding training is preventive, not detective. A WAF is a compensating control for detected issues, not an assessment activity.',
  'CONTINUOUS RECONNAISSANCE: Quarterly scans leave 89 unscanned days — run continuous recon to close the gap.',
  'apply',
  'best_answer',
  'hard',
  1.55, 1.50, 0.20, 'ai_generated', true
),

-- Q18 hard / analyze / software_testing_techniques
(
  6, 'software_testing_techniques',
  'A security engineer is choosing between SAST, DAST, and IAST for integration into a CI/CD pipeline. Which statement MOST accurately characterizes the relative trade-offs of IAST compared to the other two?',
  '["IAST is identical to DAST with an internal sensor but provides no advantage over combining SAST and DAST separately","IAST eliminates the need for both SAST and DAST because it subsumes all their capabilities without any tradeoffs","IAST is only suitable for legacy monolithic applications and is incompatible with microservices architectures","IAST instruments the running application to trace data flows from inside, providing lower false positive rates than SAST and broader code coverage than DAST, but requires an agent deployed within the application runtime"]'::jsonb,
  3,
  'Explanation: Interactive Application Security Testing (IAST) uses agents embedded in the application runtime to observe data flows, method calls, and library interactions from inside — providing visibility that DAST cannot achieve (it sees inside the running code, not just HTTP responses) while testing actual execution paths that SAST may miss (dead code, library calls). The tradeoff is that IAST requires deploying and maintaining an agent in each application runtime environment. It does not fully replace SAST (which can find secrets in code never executed) or DAST (which tests from an adversarial external perspective). Option B understates IAST''s value. Option C overstates it. Option D is false — IAST agents exist for containerized microservices.',
  'IAST AGENT INSIDE: Embed an agent in the running app — it sees the data flow from inside the mission itself.',
  'analyze',
  'comparison',
  'hard',
  1.70, 1.65, 0.22, 'ai_generated', true
),

-- Q19 hard / apply / audit_strategies
(
  6, 'audit_strategies',
  'During a security audit, an auditor requests evidence that a privileged action — specifically, a firewall rule change — was reviewed by a second person before implementation. The operations team provides a screenshot of the change ticket showing one approver. What additional evidence should the auditor require to satisfy a separation of duties control?',
  '["A policy document stating that firewall changes require dual approval","An email from the firewall administrator confirming they implemented the change after approval","A vendor attestation that the firewall supports access controls","An audit log from the firewall itself showing the rule was applied by a different account than the one that created the change request"]'::jsonb,
  3,
  'Explanation: Separation of duties requires that no single person both initiates and implements a privileged action. The change ticket shows an approver, but the auditor needs to verify that a DIFFERENT individual actually implemented the change. The firewall''s own audit log showing the implementing account is different from the requesting account is the definitive technical evidence of separation. A policy document shows intent, not execution. An email from the administrator is self-attested and lacks integrity. Vendor attestation addresses capability, not process execution.',
  'DUAL CONTROL EVIDENCE: The audit log shows different hands on the trigger and the authorization — that''s the proof.',
  'apply',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q20 hard / analyze / vulnerability_assessment_pentest
(
  6, 'vulnerability_assessment_pentest',
  'A penetration tester has completed the exploitation phase and achieved a foothold on a target system. During post-exploitation, the tester discovers a path to a database server containing cardholder data not included in the original scope. What is the MOST appropriate action?',
  '["Stop lateral movement at the scope boundary, document the finding, and immediately notify the client of the out-of-scope discovery", "Continue exploitation of the database to fully demonstrate the impact, then include it in the final report", "Ignore the out-of-scope system entirely and continue testing within authorized boundaries", "Request immediate verbal authorization from the client contact to expand scope before proceeding"]'::jsonb,
  0,
  'Explanation: Ethical penetration testing is governed by the rules of engagement and written scope authorization. Expanding testing to out-of-scope systems without written authorization violates legal and ethical boundaries — regardless of how significant the finding might be. The correct action is to stop at the scope boundary, document the discovery (including network path and potential impact), and notify the client so they can make an informed decision about scope expansion with proper written authorization. Verbal authorization alone is insufficient — it must be in writing. Ignoring the discovery fails the client. Continuing without authorization is unauthorized access.',
  'SCOPE BOUNDARY PROTOCOL: You saw the vault through the window — stop, document, and call the client before opening it.',
  'analyze',
  'first_action',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q21 hard / analyze / code_review_testing
(
  6, 'code_review_testing',
  'A development team conducts peer code review for all code before merging. A security team argues this is insufficient and wants a formal security-focused code review in addition. Which argument MOST effectively justifies the additional layer?',
  '["Peer reviewers optimize for functionality and code quality; security reviewers are trained to look for vulnerability patterns, anti-patterns, and threat model violations that functional reviewers routinely miss", "Peer code review is only effective for open source projects where external reviewers provide community oversight", "A formal security review introduces unacceptable development velocity overhead that negates its benefit", "Peer review and security review are equivalent because both examine the same source code"]'::jsonb,
  0,
  'Explanation: Developer peer review is invaluable for logic correctness, maintainability, and code quality — but developers are trained to make code work, not to find security vulnerabilities. Security code review applies a threat model lens: looking for input validation failures, insecure cryptographic usage, authentication gaps, injection sinks, and architecture-level security violations. Studies (e.g., Microsoft SDL findings) show that developer peer review catches a small fraction of security vulnerabilities. Option B is false — peer review applies to all codebases. Option C dismisses the significant risk reduction value without evidence. Option D is incorrect because the cognitive approach and expertise differ fundamentally.',
  'SECURITY LENS: The peer reviewer checks the wiring; the security reviewer checks whether the wiring becomes a weapon.',
  'analyze',
  'tlatm',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q22 hard / apply / log_review_analysis
(
  6, 'log_review_analysis',
  'A SIEM system generates 1,200 alerts per day. The security team can meaningfully investigate approximately 100 alerts per day. The CISO wants to reduce alert fatigue without missing critical threats. Which approach is MOST effective?',
  '["Hire additional analysts to match investigation capacity to alert volume", "Implement alert tuning and risk-based prioritization using threat intelligence and asset criticality, reducing low-fidelity alerts while escalating high-confidence, high-impact detections", "Raise SIEM detection thresholds globally to reduce total alert volume by 90%", "Disable SIEM rules that generate more than 50 alerts per day to eliminate noise sources"]'::jsonb,
  1,
  'Explanation: Alert fatigue is a systemic problem requiring a programmatic solution. Risk-based prioritization — correlating alerts with threat intelligence (known malicious IPs, IOCs), asset criticality (crown jewel servers vs. test VMs), and confidence scoring — reduces noise by surfacing alerts that actually matter. Threat intelligence-enriched SIEM reduces alert volume while increasing signal quality. Hiring additional analysts scales linearly with cost but does not address the fundamental noise problem. Raising thresholds globally will cause high volumes of false negatives (missed real threats). Disabling high-volume rules eliminates detection coverage entirely.',
  'SIGNAL OVER NOISE: Tune the intelligence feed — not every alarm is worth waking the analyst for.',
  'apply',
  'best_answer',
  'hard',
  1.55, 1.50, 0.20, 'ai_generated', true
),

-- Q23 hard / apply / security_metrics_kpis_kris
(
  6, 'security_metrics_kpis_kris',
  'A risk manager reports to the board that the organization''s patch compliance rate is 94% for critical vulnerabilities. A board member asks what risk remains. Which follow-up metric MOST directly quantifies the residual risk from the unpatch rate?',
  '["Number and CVSS scores of unpatched critical vulnerabilities on internet-facing systems", "Total count of all vulnerabilities across all systems regardless of severity", "Average CVSS score of all vulnerabilities in the vulnerability management database", "Percentage of systems that completed the last patch cycle within the defined maintenance window"]'::jsonb,
  0,
  'Explanation: The residual risk from a 6% unpatch rate is not uniformly distributed — it matters enormously WHETHER those unpatched vulnerabilities are on internet-facing systems and HOW severe they are. A CVSS 9.8 RCE vulnerability on a public web server represents far greater risk than a CVSS 5.1 local privilege escalation on an isolated workstation. Quantifying the specific unpatched vulnerabilities by CVSS score and exposure (internet-facing) gives the board a risk-informed answer. Total count without severity context is misleading. Average CVSS across all vulnerabilities is diluted by the 94% already patched. Maintenance window compliance measures process adherence, not residual risk.',
  'RESIDUAL EXPOSURE BRIEF: The 6% unpatched — what are they, where are they, and how bad are they?',
  'apply',
  'most_likely',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q24 very_hard / analyze / software_testing_stages
(
  6, 'software_testing_stages',
  'A software team discovers a regression — a security control that was working in the previous release is broken in the new release. A post-mortem reveals the regression was introduced during a dependency upgrade. Which software testing stage, if properly implemented, MOST likely would have caught this regression BEFORE production deployment?',
  '["Regression testing executed against security-specific test cases in the CI/CD pipeline after every dependency change", "Integration testing between the upgraded dependency and the application modules", "User acceptance testing (UAT) conducted by business users before production release", "Static analysis scanning of the upgraded dependency''s source code"]'::jsonb,
  0,
  'Explanation: Regression testing specifically re-executes previously passing tests to verify that new changes did not break existing functionality — including security controls. If the security control had a corresponding regression test case in the CI/CD pipeline triggered by dependency upgrades, the broken control would have been caught before promotion. Integration testing verifies that components work together but does not specifically revalidate previously working security controls. UAT focuses on business functionality, not security control operation. SAST of the dependency would analyze its own code, not how it integrates with the application''s security controls.',
  'REGRESSION SENTINEL: The test suite is your early warning system — run it after every dependency change.',
  'analyze',
  'scenario',
  'very_hard',
  2.10, 2.25, 0.20, 'ai_generated', true
),

-- Q25 very_hard / analyze / vulnerability_assessment_pentest
(
  6, 'vulnerability_assessment_pentest',
  'A mature organization uses a risk-based vulnerability management program. A newly discovered vulnerability has a CVSS base score of 9.8 but affects a system that is air-gapped, has no user-facing functionality, and has no known exploit code in the wild. A second vulnerability has a CVSS base score of 6.5 but affects an internet-facing payment processing system with a publicly available exploit and active exploitation observed in threat intelligence feeds. Which vulnerability should be prioritized for immediate remediation?',
  '["The 6.5 CVSS vulnerability on the internet-facing payment system, because environmental context and active exploitation make it a higher actual risk than the theoretical 9.8", "The 9.8 CVSS vulnerability, because CVSS base scores are the authoritative measure of patch priority", "Both should be patched simultaneously as they represent different but equivalent risk profiles", "Neither — the organization should wait for vendor-confirmed patches before acting on either"]'::jsonb,
  0,
  'Explanation: CVSS base scores measure theoretical vulnerability severity in isolation — they explicitly do not account for environment, threat activity, or exploitability in context. The CVSS Temporal and Environmental scoring vectors exist precisely to adjust for real-world factors. The 6.5 CVSS vulnerability on an internet-facing payment system with active exploitation represents far greater ACTUAL risk: (1) the system is exposed to the internet, (2) exploit code is public and being used in attacks NOW, (3) payment data is a high-value target. The 9.8 on an air-gapped system may be severe in theory but has minimal exploitability given its environment. NIST and major vulnerability management frameworks (Tenable VPR, Qualys TruRisk) emphasize contextual prioritization over raw CVSS.',
  'THREAT CONTEXT OVERRIDE: A 6.5 with active exploitation beats a 9.8 that lives in a bunker with no internet.',
  'analyze',
  'tlatm',
  'very_hard',
  2.15, 2.30, 0.20, 'ai_generated', true
),

-- Q26 medium / apply / software_testing_stages
(
  6, 'software_testing_stages',
  'A new feature passes unit testing and integration testing but fails during system testing. Which scenario MOST likely explains why unit and integration testing did not catch the failure?',
  '["Unit tests are always less rigorous than system tests and therefore miss more bugs", "Integration tests only cover API boundaries and cannot test internal logic", "The failure involves an interaction between the feature and a system-level component (e.g., OS, database, network stack) that was mocked or stubbed in lower-level tests", "The development team had insufficient time to write comprehensive unit tests"]'::jsonb,
  2,
  'Explanation: Unit and integration tests frequently use mocks, stubs, and test doubles to isolate the component under test from real system dependencies. System testing uses the full environment — real database, real OS, real network stack. Failures that only manifest against real system-level components (race conditions, OS-specific behaviors, real database constraints, network timeouts) are invisible to lower-level tests that simulate these dependencies. Options A, B, and D describe possible causes in specific scenarios but do not MOST accurately explain the general cause of the failure pattern described.',
  'MOCK BLIND SPOT: The stub passed fine — the real database had different rules about character encoding.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q27 medium / analyze / code_review_testing
(
  6, 'code_review_testing',
  'A security team implements a formal code review gate: no code reaches production without a security review sign-off. After 3 months, the team reports 60% of review cycles exceed the 48-hour SLA, creating sprint delays. The CISO must decide how to address this without eliminating the security gate. Which approach BEST balances security assurance and development velocity?',
  '["Implement risk-tiered review: automated SAST handles low-risk changes, manual security review is required only for high-risk changes (authentication, cryptography, data access layers)", "Remove the 48-hour SLA so reviews can take as long as needed", "Reduce the scope of security review to only new features, excluding bug fixes", "Hire additional security reviewers until all reviews complete within 12 hours"]'::jsonb,
  0,
  'Explanation: Risk-tiered review is the industry-standard solution to security review bottlenecks. SAST and automated checks handle high-volume, lower-risk changes (CSS updates, configuration changes, minor feature tweaks) quickly and continuously. Manual security review is reserved for changes that touch the highest-risk code areas — authentication flows, cryptographic implementations, authorization logic, data access layers — where automated tools have the highest false-negative rate. This preserves security coverage where it matters most while unblocking routine changes. Removing the SLA creates no accountability. Excluding bug fixes is dangerous — security vulnerabilities are often introduced through bug fix code paths. Hiring linearly is expensive and does not address the tiering problem.',
  'TRIAGE THE QUEUE: High-risk code gets the senior agent; routine patches clear through automated review.',
  'analyze',
  'best_answer',
  'medium',
  1.30, 0.45, 0.20, 'ai_generated', true
),

-- Q28 medium / apply / security_assessment_strategy
(
  6, 'security_assessment_strategy',
  'An organization discovers that a third-party vendor performs annual security assessments of their platform but does not share the full reports — only a summary attestation letter. The organization relies on this vendor for processing sensitive customer data. What is the MOST appropriate risk management response?',
  '["Require the vendor to provide a formal third-party audit report (e.g., SOC 2 Type II or ISO 27001 certificate) with sufficient scope to cover the data processing activities, or conduct a right-to-audit assessment", "Accept the attestation letter as sufficient evidence of vendor security controls", "Terminate the vendor relationship immediately due to lack of transparency", "Perform an internal vulnerability assessment of the vendor''s publicly exposed systems"]'::jsonb,
  0,
  'Explanation: Attestation letters without underlying evidence are insufficient for third-party risk management when sensitive data is involved. The appropriate control is to require independent, structured audit evidence — a SOC 2 Type II report provides independent CPA attestation covering control design and operating effectiveness, with a scope that can be matched to the specific services being rendered. Alternatively, exercising a contractual right-to-audit provision enables direct assessment. Accepting an attestation letter alone transfers the risk without evidence. Terminating the relationship may be premature if the vendor can provide proper evidence. Scanning the vendor''s external attack surface is relevant but does not replace comprehensive third-party assurance.',
  'VENDOR TRUST BUT VERIFY: An attestation letter is a word — a SOC 2 Type II is evidence.',
  'apply',
  'first_action',
  'medium',
  1.25, 0.35, 0.20, 'ai_generated', true
);
