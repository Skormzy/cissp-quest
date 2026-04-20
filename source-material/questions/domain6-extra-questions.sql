-- =====================================================================
-- CISSP Quest -- Domain 6: Security Assessment and Testing
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: CVSS v3.1 scoring, penetration test phases,
--   fuzzing techniques, threat intelligence feeds,
--   red team vs blue team
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain6-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  6, 'cvss_scoring',
  'A vulnerability in a web application allows an unauthenticated attacker to execute arbitrary code on the server via a network-accessible API. The attacker needs no user interaction. Successful exploitation grants root access on the vulnerable server but does not directly affect other systems. What is the CVSS v3.1 base score classification?',
  '["Critical (CVSS 9.8): Attack Vector=Network, Attack Complexity=Low, Privileges Required=None, User Interaction=None, Scope=Unchanged, Confidentiality=High, Integrity=High, Availability=High -- yielding a base score of 9.8", "High (CVSS 8.8): the score is reduced because the attacker requires local network access", "Medium (CVSS 6.5): remote code execution is partially mitigated by requiring knowledge of the API endpoint", "Critical (CVSS 10.0): any unauthenticated RCE is automatically scored 10.0 under CVSS v3.1"]'::jsonb,
  0,
  'CVSS v3.1 base score calculation for this vulnerability: AV=N (Network -- exploitable remotely), AC=L (Low -- no special conditions), PR=N (None -- unauthenticated), UI=N (None -- no user interaction required), S=U (Unchanged -- only the vulnerable system is impacted), C=H (High -- full confidentiality impact), I=H (High -- full integrity impact), A=H (High -- full availability impact). Using the CVSS v3.1 formula, AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H = 9.8 (Critical). Scope=Changed (when exploitation affects other components) produces a higher score. 10.0 requires Scope=Changed with all high impacts.',
  'CVSS 9.8 = AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H. Change Scope to Changed = 10.0. Scope=Unchanged = 9.8 max for full impact.',
  'apply', 'scenario', 'hard',
  1.80, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  6, 'pen_test_phases',
  'A penetration tester is engaged by an organization for a black-box external network penetration test. The tester discovers a critical vulnerability during the exploitation phase. What is the MOST important distinction between exploitation and post-exploitation in professional penetration testing?',
  '["Post-exploitation is optional and only required for red team engagements; standard penetration tests end at initial exploitation", "Exploitation confirms that a vulnerability can be leveraged to gain unauthorized access; post-exploitation simulates what a threat actor would do after access is gained (lateral movement, privilege escalation, data access, persistence mechanisms) to demonstrate the full business impact and attack chain -- both phases are documented in the report with business risk context, but post-exploitation scope must be explicitly authorized in the rules of engagement (ROE)", "Post-exploitation is not part of penetration testing -- it crosses into red team territory and requires a separate engagement", "Exploitation and post-exploitation are the same phase; the distinction is purely academic"]'::jsonb,
  1,
  'Professional penetration testing frameworks (PTES, NIST SP 800-115, OSSTMM) distinguish exploitation (demonstrating initial access) from post-exploitation (demonstrating impact from a foothold). Post-exploitation activities include: privilege escalation, lateral movement, pivoting to additional systems, credential harvesting, accessing sensitive data, and establishing persistence. This phase demonstrates the TRUE business risk -- not just that a vulnerability exists, but what a real attacker could do with it. CRITICAL: post-exploitation scope must be explicitly defined in the Rules of Engagement (ROE). Unauthorized lateral movement to systems not in scope is a serious violation. Both phases are included in most modern penetration test methodologies.',
  'Exploitation = I got in. Post-exploitation = what I can do from here (lateral, escalate, persist). Both need ROE authorization. Impact is what the board cares about.',
  'analyze', 'comparison', 'hard',
  1.70, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  6, 'vulnerability_assessment',
  'A security team runs an authenticated vulnerability scan against a Linux server using a privileged credential. The scan returns "High" severity findings including: 45 CVEs with CVSS scores between 7.0-8.9. The system owner argues that most findings are false positives because "those packages aren''t actually installed -- they just appear in the OS package manager." What is the CORRECT response?',
  '["Accept the system owner''s argument because they know their system better than the scanner", "Escalate all 45 findings as critical because CVSS scores above 7.0 require immediate remediation regardless of context", "Validate the findings by verifying whether the packages are actually installed AND whether the vulnerable versions are in use -- a package listed in the package manager but not installed, or a CVE for a feature not compiled into the binary, may be a scanner false positive; update the vulnerability report with validated status and document the validation methodology", "Request a rescan without authentication because authenticated scans produce more false positives than unauthenticated scans"]'::jsonb,
  2,
  'Authenticated vulnerability scans query the OS package manager (RPM, dpkg, etc.) for installed software versions and cross-reference against CVE databases. False positives occur when: (1) A package appears in package manager metadata but is not actually installed (e.g., cached but not deployed packages), (2) A CVE applies to an optional feature not compiled into the installed binary, (3) The vulnerable code path is not reachable in the deployed configuration. Validation requires checking actual installation status AND version and configuration. Authenticated scans actually produce FEWER false positives than unauthenticated scans (which rely on banner grabbing). Validate before dismissing, but also before treating all findings as confirmed.',
  'Validate scanner findings before accepting or dismissing. Package in DB ≠ installed. Check actual install + version + reachability. Update report with validation.',
  'apply', 'scenario', 'hard',
  1.60, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  6, 'red_blue_team',
  'An organization conducts a purple team exercise. The red team successfully exfiltrates 10GB of sensitive data over 14 days using DNS tunneling without being detected by the blue team''s SIEM. The blue team lead argues the detection gap exists because "DNS monitoring was out of scope for the blue team''s use case." Which response is MOST appropriate from the purple team facilitator?',
  '["The red team''s activities were outside scope because 14-day persistence was not authorized in the rules of engagement", "The blue team''s argument is valid -- DNS monitoring is a specialized capability that cannot be expected in all SOC environments", "The detection gap is the red team''s fault for using an unconventional attack technique not representative of real threats", "The absence of DNS tunneling detection capability is a HIGH-PRIORITY finding regardless of the blue team''s intended use case scope; the purple team''s role is to identify detection gaps by replaying real attacker TTPs against actual defenses, and DNS tunneling is a well-documented C2 and exfiltration technique; the gap requires remediation (DNS monitoring + behavioral analytics) and the SOC''s detection scope must cover current threat actor techniques"]'::jsonb,
  3,
  'Purple team exercises are specifically designed to identify gaps between attacker capability (red team) and defender detection (blue team). The exercise''s value is precisely in discovering that DNS tunneling is undetected -- this is a finding, not a scoping problem. DNS tunneling is a Tier 1 threat actor technique (MITRE ATT&CK T1071.004, T1048.003) used by multiple APT groups. The blue team''s scope must evolve to match the threat landscape; declaring techniques "out of scope" for detection is not a valid security posture. The purple team facilitator must document this as a capability gap and drive remediation. Exonerating the blue team by blaming scope limits defeats the purpose of purple team exercises.',
  'Purple team finding = detection gap. DNS tunneling undetected = HIGH priority gap, not a scope excuse. Threat actors don''t honor scope. Fix the detection.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / tlatm / correct=0
(
  6, 'pen_test_phases',
  'As a penetration tester conducting a social engineering test, you successfully call the help desk posing as an executive and obtain the executive''s password reset. The help desk agent follows the written procedure correctly. You are now writing the report. How should this finding be classified and reported?',
  '["As a process and controls finding rather than a human error finding -- the help desk procedure itself is inadequate because it does not require identity verification adequate for a password reset; the recommendation is to redesign the procedure to include multi-factor verification (e.g., manager callback, out-of-band verification), not to blame the help desk agent who followed the procedure correctly", "As a critical human error finding requiring disciplinary action for the help desk agent who disclosed credentials", "As an informational finding because the agent followed procedure, meaning no security violation occurred", "The finding should not be included in the report because testing help desk procedures is outside the scope of a technical penetration test"]'::jsonb,
  0,
  'A social engineering test that succeeds because an employee followed the written procedure reveals a process design flaw, not a human failure. The help desk agent followed the procedure exactly as written -- if the procedure does not require adequate identity verification before credential resets, that is a process risk. Reporting it as human error and recommending disciplinary action is incorrect and harmful (it destroys trust with the help desk team and doesn''t fix the underlying problem). The correct finding is process inadequacy, and the recommendation is procedure redesign with multi-factor identity verification. This is a standard penetration testing report finding.',
  'Social engineering succeeds via procedure = process finding, not human error. Fix the PROCESS. Do NOT blame the employee who followed the rules.',
  'apply', 'tlatm', 'hard',
  1.70, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / comparison / correct=1
(
  6, 'fuzzing',
  'A security team is evaluating fuzzing strategies for testing a file parsing library that accepts PDF, DOCX, and ZIP archives. They consider coverage-guided fuzzing (e.g., AFL++) versus generation-based fuzzing (e.g., Peach Fuzzer). Which comparison is MOST accurate for this use case?',
  '["Coverage-guided fuzzing is always superior because it maximizes code coverage through feedback instrumentation", "Coverage-guided fuzzing discovers deep code paths efficiently by using execution feedback (branch coverage) to guide mutation toward unexplored areas, making it effective for well-structured parsers; generation-based fuzzing uses a grammar/model of the file format to generate valid-but-mutated inputs, making it more effective when the target validates input format early (rejecting completely random inputs) and requires structurally valid test cases to reach deep parsing logic", "Generation-based fuzzing is obsolete because modern coverage-guided fuzzers handle all file format types equally well", "Both approaches produce identical results for file parsers because file parsing vulnerabilities are always found at the input validation layer"]'::jsonb,
  1,
  'Coverage-guided fuzzing (AFL++, libFuzzer) uses code coverage instrumentation to guide input mutation toward unexplored code branches. It is highly effective for simple binary protocols and when randomly mutated inputs can reach deep code paths. Generation-based fuzzing (Peach, Boofuzz, grammar fuzzers) uses a specification of valid input structure to generate malformed-but-structurally-valid inputs. For complex file formats (PDF, DOCX, ZIP) with multi-layer structure validation, completely random mutations are typically rejected early (invalid magic bytes, wrong field types) and never reach the deep parsing logic. Generation-based fuzzing reaches deeper code paths in such parsers. Best practice combines both approaches.',
  'File parsers: generation-based fuzzing reaches deep paths (structurally valid inputs). Coverage-guided good for simple protocols. Complex formats = combine both.',
  'analyze', 'comparison', 'hard',
  1.80, 1.60, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  6, 'threat_intelligence',
  'A SOC analyst receives a threat intelligence feed indicating that an APT group uses a specific C2 infrastructure IP (198.51.100.123) and a custom C2 protocol on port 4444. The analyst immediately blocks the IP at the perimeter firewall. Three days later, the APT resumes C2 activity from a new IP. What concept does this illustrate, and what is the MORE effective intelligence-driven response?',
  '["This illustrates the difficulty of attributing threats; the response is to report the new IP to law enforcement for investigation", "This illustrates threat intelligence being too slow -- real-time feeds would have caught the new IP; upgrade to a faster threat intel subscription", "This illustrates the Pyramid of Pain (David Bianco): blocking IP addresses is at the lowest level of the pyramid (easiest for attackers to change) -- the more effective approach is to detect and block based on higher pyramid indicators: TTPs (behavioral patterns, C2 protocol characteristics, network behavior anomalies) that are costly for the attacker to change", "This illustrates that network-based controls are insufficient; deploy endpoint controls instead"]'::jsonb,
  2,
  'David Bianco''s Pyramid of Pain (2013) ranks threat intelligence indicators by how much pain it causes the attacker to change them: Hash values (trivial) → IP addresses (easy) → Domain names (simple) → Network artifacts (annoying) → Host artifacts (painful) → Tools (challenging) → TTPs (tactics, techniques, procedures -- very painful). Blocking a single IP address is trivially evaded by the attacker using a new IP. Detecting the CUSTOM C2 PROTOCOL behavior (network artifacts/tools/TTPs) is much more durable because the attacker must re-engineer their C2 infrastructure. Effective threat intelligence focuses on behavioral indicators (TTPs) rather than atomic indicators (IPs).',
  'Pyramid of Pain: IPs = trivial to change. TTPs = very hard to change. Block protocols/behaviors, not just IPs. Higher pyramid = more pain for attacker.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / scenario / correct=3
(
  6, 'cvss_scoring',
  'A CVSS v3.1 vulnerability has a base score of 7.5 (High). After considering the deployment environment, the organization determines: (1) The vulnerable system is on an internal network not accessible from the internet (adjusted Attack Vector = Adjacent). (2) A WAF provides partial mitigation. (3) The impact to the specific deployment is limited to read-only data (Confidentiality = Low, Integrity = None, Availability = None). How should this information be used?',
  '["The CVSS base score cannot be modified; the organization must remediate all CVSS 7.5 findings within 30 days regardless of environment", "The organization should calculate a new base score using the adjusted parameters to represent the true risk", "The CVSS Temporal Score should be used to account for the WAF mitigation", "The organization should calculate a CVSS Environmental Score by customizing the Modified Base Metrics to reflect the actual deployment context (Modified AV=Adjacent, Modified C=Low, Modified I=None, Modified A=None), which produces a lower Environmental Score that better represents the actual risk in their specific environment -- this is the INTENDED use of CVSS Environmental Scoring"]'::jsonb,
  3,
  'CVSS v3.1 defines three metric groups: Base (inherent vulnerability characteristics, vendor-defined), Temporal (time-dependent factors like exploit availability, patch status, report confidence), and Environmental (organization-specific deployment context). The Environmental Score is calculated by overriding Base Metrics with Modified versions (MAV, MAC, MPR, MUI, MS, MC, MI, MA) to reflect how the vulnerability manifests in the specific deployment. Modified AV=Adjacent reduces the score significantly because network-accessible exploitation is the worst case. The Environmental Score is the appropriate metric for organizational risk prioritization. The base score is the vendor''s assessment of the vulnerability in isolation.',
  'CVSS Environmental = modified base metrics for YOUR deployment. AV:Adjacent + limited impact = lower env score. Use Env Score for internal risk prioritization.',
  'apply', 'scenario', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / first_action / correct=0
(
  6, 'pen_test_phases',
  'A penetration tester discovers that a production database server is running an unpatched version of MySQL with a known RCE vulnerability. Exploiting this vulnerability would provide full database access including plaintext customer PII. The tester''s rules of engagement (ROE) authorize "demonstrate ability to access, but do not exfiltrate data." What should the tester do?',
  '["Exploit the vulnerability to confirm the finding, document the successful authentication to the database and screenshots of accessible tables/record counts (proving impact without exfiltrating data), then immediately report the finding to the client''s emergency contact as a critical out-of-band finding given its severity", "Exfiltrate a sample record to prove the data is accessible to justify the critical rating", "Skip exploitation because the ROE scope limitation makes it impossible to fully demonstrate impact", "Notify the client verbally that the finding exists but do not exploit it because production database exploitation is always outside ROE regardless of what the ROE states"]'::jsonb,
  0,
  'The ROE authorizes "demonstrate ability to access, but do not exfiltrate data." The correct approach: (1) Exploit the vulnerability to gain access (authorized), (2) Demonstrate access by documenting successful connection, database schema, table names, and record counts (proves the risk without exfiltrating PII), (3) Do NOT extract actual PII records (respecting ROE). (4) Given the severity (plaintext PII on production DB), treat this as a critical finding requiring immediate out-of-band notification to the client''s designated emergency contact -- not waiting for the end-of-engagement report. This balances demonstrating full impact with respecting the ROE and protecting client data.',
  'ROE = access but no exfil. Do: exploit + prove access (schema, count). Don''t: extract PII. ALSO: critical finding = immediate out-of-band client notification.',
  'apply', 'first_action', 'hard',
  1.80, 1.50, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  6, 'red_blue_team',
  'Which comparison MOST accurately describes the operational differences between a red team engagement and a traditional penetration test from a CISSP examination perspective?',
  '["Red team and penetration test are synonymous terms used interchangeably in the security industry", "A penetration test has a defined scope (specific systems/networks), uses known starting conditions, and aims to find and enumerate vulnerabilities within the authorized scope; a red team engagement uses advanced adversary simulation with a broad or undefined scope, focuses on a specific objective (e.g., reach the crown jewel), uses full APT TTPs over an extended timeframe (weeks to months), and tests the effectiveness of the ENTIRE security program including detection and response -- not just finding vulnerabilities", "Red team engagements are more cost-effective than penetration tests because they are automated", "Penetration tests are only for external networks; red team engagements are only for internal networks"]'::jsonb,
  1,
  'Key distinctions: Penetration Test -- limited scope, enumeration-focused, aims to find all vulnerabilities in scope, typically 1-2 weeks, report lists findings with CVSS severity. Red Team Engagement -- objective-based (can we reach target X?), simulates a specific threat actor''s TTPs, extended duration (weeks to months), may involve physical, social, and technical vectors, tests detection/response capabilities holistically. Red teams are stopped when the objective is met or the timeframe ends; the goal is not to enumerate every vulnerability. Purple team = red + blue working together for knowledge transfer. The CISSP candidate must understand these distinctions for assessment methodology questions.',
  'Pentest = scope + enumerate vulnerabilities. Red team = objective + APT TTPs + test full security program + weeks/months. Different goals, different methodology.',
  'analyze', 'comparison', 'very_hard',
  1.90, 1.90, 0.22, 'handcrafted', true
),

-- Q11: hard / apply / scenario / correct=2
(
  6, 'vulnerability_assessment',
  'A security manager receives a vulnerability scan report showing 2,340 findings across 150 servers. She must present a remediation plan to the board. Which prioritization framework is MOST aligned with risk-based vulnerability management?',
  '["Remediate all Critical (CVSS 9.0+) findings first, then High, then Medium, regardless of the affected system''s business criticality", "Remediate in order of CVE publication date -- oldest vulnerabilities are most likely to have working exploits", "Prioritize using an Exploit Prediction Scoring System (EPSS) or threat-intelligence-enriched scoring: vulnerabilities with known active exploitation in the wild on systems classified as high-business-impact should be remediated first; unpatchable systems should have compensating controls applied; findings on low-business-impact systems can be scheduled in normal maintenance windows", "Remediate all findings simultaneously to minimize the total risk exposure window"]'::jsonb,
  2,
  'Risk-based vulnerability management combines vulnerability severity (CVSS base/environmental) with exploit likelihood (EPSS, threat intelligence on active exploitation) and asset criticality (business impact classification). A CVSS 7.5 vulnerability actively exploited in the wild on a crown-jewel server is higher priority than a CVSS 9.8 theoretical vulnerability on a test server. EPSS (Exploit Prediction Scoring System) predicts the probability of exploitation in the next 30 days based on threat intelligence signals. CVSS alone does not indicate whether a vulnerability is actually being exploited. Age-based prioritization has no risk logic. Simultaneous remediation of 2,340 findings is operationally impossible.',
  'Risk-based vuln mgmt = CVSS × EPSS (exploitation likelihood) × asset criticality. Active exploitation + critical asset = patch NOW. CVSS alone is insufficient.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  6, 'threat_intelligence',
  'A financial institution subscribes to three threat intelligence feeds: (1) ISAC sector-specific feed (FS-ISAC), (2) Commercial threat intelligence platform (Recorded Future), (3) Open-source intelligence (OSINT) aggregator (AlienVault OTX). The SOC experiences alert fatigue from duplicate indicators across all three feeds. What is the MOST effective architecture for consuming these feeds?',
  '["Prioritize only the commercial feed because paid threat intelligence is always more accurate than sector or open-source feeds", "Subscribe to only one feed to eliminate duplication and reduce alert fatigue", "Configure each feed independently in the SIEM with separate detection rules to maintain traceability of indicator sources", "Implement a Threat Intelligence Platform (TIP) that normalizes, deduplicates, and enriches indicators across all three feeds using STIX/TAXII standards, assigns confidence scores based on source reputation and corroboration across feeds, and exports a deduplicated, prioritized indicator set to the SIEM -- reducing alert volume while improving indicator quality through multi-source corroboration"]'::jsonb,
  3,
  'A Threat Intelligence Platform (TIP) (e.g., MISP, ThreatConnect, Anomali) addresses multi-feed management challenges. Key functions: (1) Normalization: converts feeds to a common format (STIX 2.x). (2) Deduplication: eliminates duplicate indicators across feeds. (3) Enrichment: adds context by cross-correlating an indicator''s presence across multiple sources. (4) Confidence scoring: indicators seen in multiple high-quality feeds receive higher confidence scores. (5) Prioritization: high-confidence, recently-observed indicators are pushed to SIEM first. This reduces SIEM alert volume by 40-60% in practice while improving indicator quality. Eliminating feeds reduces coverage diversity.',
  'Multi-feed TI: use a TIP (MISP/Anomali). Normalize (STIX) + deduplicate + enrich + score confidence. Fewer SIEM alerts, better quality.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  6, 'cvss_scoring',
  'A vendor releases a patch for a CVSS 9.1 Critical vulnerability. The CVSS Temporal Score factors include: Exploit Code Maturity = Proof-of-Concept, Remediation Level = Official Fix, Report Confidence = Confirmed. What effect do these temporal factors have on the score, and how should this inform prioritization?',
  '["The temporal score is LOWER than the base score of 9.1 because an official fix exists (RL:OF reduces score) and exploit maturity is only PoC (E:P, not functional/high); however, the finding remains High severity and should be remediated within the normal patch window; if exploit maturity escalates to Functional/High before patching, immediate remediation becomes critical", "Temporal factors always increase the CVSS score above the base score when exploits exist", "Exploit code maturity at PoC level means no real exploitation risk exists and the vulnerability can be deprioritized", "Temporal Score cannot be calculated until all three temporal factors are populated with non-default values"]'::jsonb,
  0,
  'CVSS v3.1 Temporal Metrics modify the Base Score downward (they can never increase above the base). Exploit Code Maturity (E): Proof-of-Concept (E:P) = 0.94 modifier (slight reduction from functional exploits). Remediation Level (RL): Official Fix Available (RL:O) = 0.95 modifier (reduction because a fix exists). Report Confidence (RC): Confirmed (RC:C) = 1.00 (no reduction -- full confidence). Combined, these temporal factors slightly reduce the score from 9.1 to approximately 8.5-8.7 (still High). Prioritization insight: an official fix EXISTS and should be applied. If exploit maturity escalates from PoC to Functional/High, urgency increases significantly.',
  'Temporal score ≤ base score. Official fix + PoC exploit = slight reduction. Still High/Critical. Patch it. Monitor for exploit maturity escalation.',
  'apply', 'best_answer', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / tlatm / correct=1
(
  6, 'fuzzing',
  'A development team has implemented input validation in a REST API that accepts JSON payloads. The security team wants to fuzz the API. You recommend mutation-based fuzzing rather than generation-based fuzzing. Under what condition is mutation-based fuzzing MORE effective for this API?',
  '["Mutation-based fuzzing is more effective when the team has a formal EBNF grammar specification for the API''s JSON schema", "Mutation-based fuzzing is more effective when a corpus of valid API requests is available -- the fuzzer takes real valid requests and applies mutations (bit flips, byte substitutions, format string injections, boundary values) to them; this allows the fuzzer to start from inputs that already pass initial validation and reach deeper processing logic", "Mutation-based fuzzing is more effective for APIs than generation-based fuzzing in all cases because APIs are stateless", "Mutation-based fuzzing requires no configuration and produces better results than generation-based fuzzing for all target types"]'::jsonb,
  1,
  'Mutation-based fuzzing starts with a corpus of valid (or semi-valid) inputs and applies mutations (AFL, libFuzzer style). Effectiveness depends critically on the quality of the initial corpus. For an API: starting from real valid requests means the fuzzer begins with inputs that pass the API''s validation layer and reaches deeper business logic. This is more efficient than random generation, which wastes time on inputs rejected at the first validation check. Generation-based fuzzing is better when no valid request corpus exists (new API with no traffic), when the format is complex and random mutations rarely produce structurally valid inputs, or when specific protocol grammar coverage is needed. EBNF grammar is used in generation-based fuzzing, not mutation-based.',
  'Mutation fuzzing: start from valid corpus (real requests) → mutate → bypass early validation → reach deep logic. Corpus quality = mutation fuzzer effectiveness.',
  'analyze', 'tlatm', 'hard',
  1.70, 1.70, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / scenario / correct=2
(
  6, 'red_blue_team',
  'A red team achieves persistence on a domain controller through a Golden Ticket attack (forging Kerberos TGTs using the KRBTGT hash). The blue team detects the red team''s initial compromise but does not detect the Golden Ticket activity. What does this finding indicate about the SOC''s detection maturity?',
  '["This indicates the red team used an unauthorized technique that exceeded the rules of engagement", "This indicates the SOC''s network monitoring tools are insufficient; the recommendation is to upgrade the SIEM platform", "The SOC has detection capability for initial compromise (lateral movement detection, likely endpoint) but lacks detection capability for Kerberos Golden Ticket activity; recommended improvements include monitoring for Kerberos TGTs with unusually long lifetimes (>10 hours), PAC (Privilege Attribute Certificate) anomalies, tickets with invalid RID 500 for unexpected accounts, and enabling Windows Security Event ID 4769 (Kerberos Service Ticket Request) analysis with unusual service account patterns", "This is expected behavior because Golden Ticket attacks are undetectable by any SOC"]'::jsonb,
  2,
  'A Golden Ticket attack (using the KRBTGT hash to forge Kerberos tickets) is detectable with specific monitoring. Detection indicators: (1) Kerberos TGT lifetime > 10 hours (default max is 10 hours -- forged tickets often have 10-year lifetimes). (2) Event ID 4769 (TGS request) without corresponding Event ID 4768 (TGT request) from the same host -- the forged TGT was never legitimately requested. (3) Tickets with PAC anomalies (forged PAC with elevated group memberships). (4) KRBTGT hash change event (4964) followed by continued authentication using old hash. This finding shows a detection gap at the Kerberos trust layer -- a common finding in organizations that monitor endpoint and network but not Active Directory Kerberos telemetry.',
  'Golden Ticket detection: TGT lifetime >10h + no Event 4768 preceding 4769 + PAC anomalies. AD Kerberos telemetry gap = common SOC blind spot.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.22, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  6, 'vulnerability_assessment',
  'A security team conducts an internal penetration test and discovers that developers have stored production AWS IAM access keys in a public GitHub repository. The keys were committed 45 days ago. What is the FIRST action the security team should take?',
  '["Document the finding and include it in the monthly vulnerability report scheduled for next week", "Contact GitHub to have the repository set to private and then rotate the keys at next month''s maintenance window", "Rotate the access keys immediately and then investigate whether the repository exposure is a one-time error", "Immediately revoke/rotate the exposed AWS IAM access keys (not just rotate -- revoke first to stop any ongoing unauthorized use), review AWS CloudTrail for all API calls made using these keys over the 45-day exposure window to assess impact, investigate and remove all committed secrets from the repository history (using git filter-repo or BFG Repo Cleaner), and implement pre-commit hooks and SAST scanning to prevent future secret commits"]'::jsonb,
  3,
  'This is an active security incident, not a routine vulnerability finding. 45 days of public exposure means the keys have almost certainly been discovered by automated scanners (GitHub has automated secret scanning; many threat actors run constant GitHub monitors for exposed credentials). Immediate actions: (1) REVOKE the exposed keys immediately (rotation alone may not stop concurrent unauthorized use). (2) Review CloudTrail for unauthorized API activity over 45 days -- scope the incident. (3) Clean the repository history (git history still contains the keys even after deletion from current codebase). (4) Implement detective and preventive controls (GitHub secret scanning, pre-commit hooks, AWS Config rules for overprivileged keys).',
  'Exposed AWS keys = security INCIDENT. Revoke first (not just rotate). Audit CloudTrail for 45 days. Clean git history. Prevent future with pre-commit hooks.',
  'apply', 'scenario', 'hard',
  1.80, 1.60, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / comparison / correct=0
(
  6, 'security_audits',
  'An organization must choose between SOC 2 Type I and SOC 2 Type II for a cloud service provider assessment. Which comparison is MOST accurate for evaluating vendor security posture?',
  '["SOC 2 Type I attests that controls are suitably designed at a point in time; SOC 2 Type II attests that controls were both suitably designed AND operated effectively over a minimum 6-month observation period -- Type II provides significantly stronger assurance of actual control effectiveness and is generally required by enterprise customers for security-relevant vendors", "SOC 2 Type I and Type II provide equivalent assurance because both are performed by independent auditors", "SOC 2 Type II is only required for vendors that process financial data; Type I is sufficient for all other vendor types", "SOC 2 Type I provides a higher level of assurance because it is a more rigorous point-in-time assessment"]'::jsonb,
  0,
  'SOC 2 (Service Organization Control 2) reports cover one or more Trust Services Criteria (Security, Availability, Confidentiality, Processing Integrity, Privacy). Type I: auditor opines on whether controls are SUITABLY DESIGNED to meet criteria -- a snapshot assessment at a point in time. Type II: auditor tests whether controls operated EFFECTIVELY over a period (minimum 6 months, typically 12 months). Type II is significantly more valuable for vendor risk management because it demonstrates sustained operational effectiveness, not just design intent. A vendor could have excellent policy documents (Type I) but poor actual practice (which would be revealed by Type II). Enterprise procurement and SOC 2 requirements typically specify Type II.',
  'SOC 2 Type I = designed (point in time). Type II = actually worked for 6+ months. Enterprise customers require Type II. Design ≠ effective operation.',
  'analyze', 'comparison', 'hard',
  1.60, 1.30, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / tlatm / correct=1
(
  6, 'threat_intelligence',
  'You are a security analyst and receive a STIX 2.1 report from a threat intelligence sharing platform indicating that an APT group is actively targeting your industry. The report includes Indicators of Compromise (IoCs): 12 IP addresses, 8 domain names, 15 file hashes, and a description of a novel spear-phishing TTP using QR codes in email attachments. Which IoC type should you prioritize for immediate detection rule creation, and why?',
  '["The file hashes should be prioritized because hash-based detection is the most precise and has zero false-positive risk", "The QR code spear-phishing TTP description should be prioritized for behavioral detection rule creation because TTPs are at the top of the Pyramid of Pain (most costly for the attacker to change) and a behavioral rule (detect emails with QR code attachments + unusual sender + no prior relationship) remains effective even after the specific IPs/domains/hashes rotate", "The IP addresses should be prioritized because IP blocking is the fastest control to deploy", "All 36 IoCs should be deployed simultaneously with equal priority to maximize detection coverage"]'::jsonb,
  1,
  'Applying the Pyramid of Pain: IPs and domains are low-friction for attackers to change (new infrastructure). File hashes change with any binary modification. TTPs (tactics, techniques, procedures) require significant effort to change -- the attacker must redesign their attack approach. A behavioral detection rule for QR-code-in-email spear-phishing will detect the campaign even after IPs rotate, domains change, and payloads are recompiled. This rule remains valid until the attacker abandons QR codes as a delivery mechanism. Combine TTP-based behavioral rules (highest durability) with atomic IoC blocking (immediate protection) -- but prioritize TTP rules for sustained detection.',
  'Pyramid of Pain: TTPs = top (hardest to change). QR code TTP = behavioral rule = durable detection. IPs = rotate easily = low-priority long-term.',
  'analyze', 'tlatm', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  6, 'pen_test_phases',
  'During the reconnaissance phase of a penetration test, a tester uses OSINT to discover that an employee has posted their company VPN credentials on a developer forum asking for help with a configuration issue. The credentials are still visible. What is the MOST appropriate immediate action?',
  '["Continue the penetration test -- this is a valid finding that demonstrates password disclosure risk and should be included in the report", "Use the credentials to test the VPN access to validate that they are still active and what level of access they provide", "Immediately notify the client''s emergency contact about the exposed credentials as an out-of-band urgent finding -- this is an active security risk that cannot wait for the end-of-engagement report, regardless of whether testing these specific credentials is authorized in scope", "Document the forum URL in your notes and report it as a low-severity informational finding at the end of the engagement"]'::jsonb,
  2,
  'Discovering ACTIVE credentials exposed in a public forum during an engagement constitutes an immediately actionable security risk. Even if using the credentials is outside the pen test scope (the tester should NOT use unauthorized credentials unless explicitly authorized), the PROFESSIONAL obligation is to immediately notify the client. This is an out-of-band emergency notification -- not a report finding to wait for. Using the credentials without explicit authorization violates the ROE and potentially the Computer Fraud and Abuse Act. Reporting it as low-severity ignores the active risk. The notification allows the client to immediately revoke the credentials and investigate whether unauthorized access occurred.',
  'Active exposed creds = IMMEDIATE out-of-band client notification. Do NOT use them (unless explicitly authorized). This cannot wait for the final report.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  6, 'fuzzing',
  'A security team is testing an automotive ECU (Electronic Control Unit) firmware for vulnerabilities using hardware fuzzing over a CAN bus interface. The fuzzer generates random CAN frames at 500 kbps. After 72 hours, no crashes are detected. The security team concludes the firmware is secure. What is the MOST significant flaw in this assessment methodology?',
  '["72 hours is more than sufficient for a complete fuzzing campaign -- lack of crashes confirms security", "Random fuzzing at CAN bus speed is not possible; the test setup is invalid", "The conclusion is correct but should be validated by a second fuzzer with a different seed", "Coverage-blind random fuzzing without firmware instrumentation provides no feedback on code coverage achieved -- the absence of crashes indicates either the firmware is robust OR the fuzzer never reached vulnerable code paths; without coverage metrics (or firmware emulation with instrumentation), the team cannot distinguish between these two cases; a proper assessment requires either gray-box fuzzing with code coverage feedback, firmware emulation with symbolic execution, or a combined JTAG-based debugging and fuzzing approach"]'::jsonb,
  3,
  'The fundamental flaw is concluding security from the absence of crashes during uninstrumented random fuzzing. Without code coverage metrics, the team has no visibility into which code paths were exercised. For an ECU firmware: (1) The CAN bus fuzzer may only be reaching input parsing code and never triggering the vulnerable diagnostic mode handler. (2) CAN protocol framing may cause most random frames to be rejected before reaching business logic. Coverage-guided fuzzing with AFL++ and hardware emulation (QEMU, Renode), or JTAG-based debugging during fuzzing, provides code coverage data. Symbolic execution (KLEE, angr) can also find code paths not reached by random fuzzing. "No crashes in 72 hours" means "nothing crashed in what we tested," not "no vulnerabilities exist."',
  'No crash ≠ secure if no coverage data. Uninstrumented fuzzing = unknown coverage. Need: coverage feedback + instrumentation + emulation OR JTAG-guided fuzzing.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / best_answer / correct=0
(
  6, 'security_audits',
  'An organization''s annual security audit reveals that 15% of system access reviews were not completed by access owners within the 30-day deadline. Which corrective action is MOST effective at addressing the root cause?',
  '["Automate the access review workflow to send escalating reminders, provide access owners with pre-populated review lists, integrate with the identity governance platform to auto-certify accounts that match normal peer group access patterns, and escalate to managers when reviews are overdue -- reducing manual effort is the most effective way to improve completion rates", "Implement disciplinary action for access owners who miss deadlines to create behavioral compliance incentives", "Reduce the review frequency from annual to biennial to give access owners more time between review cycles", "Outsource access reviews to a third-party auditing firm that can complete them faster than internal teams"]'::jsonb,
  0,
  'Access review non-completion root causes are typically: high volume of manual work, unclear ownership, inaccessible or poorly designed review interfaces, and competing priorities. Automation addresses all of these: (1) Pre-populated review lists reduce the effort per review from minutes to seconds. (2) Peer group access analytics auto-certify "normal" access, focusing human attention on anomalies. (3) Escalating automated reminders prevent deadline slippage. (4) Manager escalation adds organizational pressure. This approach has been shown to increase completion rates from <70% to >95% in IGA platform deployments. Disciplinary action and frequency reduction do not address the root cause (too much manual work). Outsourcing creates data sharing and context knowledge issues.',
  'Access review failure = too much manual work. Fix: IGA automation + peer analytics + auto-certify normal access + escalation reminders. Root cause = effort.',
  'apply', 'best_answer', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / first_action / correct=1
(
  6, 'red_blue_team',
  'A red team engagement reveals that the blue team detected the red team''s initial access within 2 hours (good detection time) but took 18 days to fully remediate and evict the red team from the environment. What does this MOST significantly indicate about the security program?',
  '["The security program is mature because the initial detection time of 2 hours is excellent", "The 18-day dwell time after detection indicates a significant gap in the organization''s response and remediation capability -- detection without effective and timely containment/eradication is insufficient; the security program needs investment in incident response playbooks, automation (SOAR), and clear escalation paths to reduce mean time to remediate (MTTR) from days to hours", "The 18-day remediation is acceptable because fully removing an advanced attacker requires careful, systematic investigation", "The blue team should be replaced because 18-day remediation represents fundamental incompetence"]'::jsonb,
  1,
  'The key security metric here is MTTR (Mean Time to Remediate/Recover) after detection. Industry benchmarks: detection within 1 day = good; dwell time after detection exceeding 7 days = significant gap. 18 days of continued attacker access AFTER detection means: (1) Insufficient IR playbooks for the detected TTPs, (2) Poor automation -- manual investigation and remediation at each step, (3) Incomplete containment (the red team evaded some containment actions), (4) Insufficient escalation leading to slow decisions. Detection without rapid containment and eradication allows attackers to establish redundant persistence, exfiltrate additional data, and achieve their objectives. Good detection time (2h) AND poor MTTR (18d) is a common pattern in organizations with mature monitoring but immature response.',
  'Detect = good. 18-day remediation = IR gap. Good detection + slow response = attacker still wins. Invest in SOAR playbooks + automation to reduce MTTR.',
  'analyze', 'first_action', 'hard',
  1.80, 1.80, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / scenario / correct=2
(
  6, 'cvss_scoring',
  'A CVSS v3.1 vulnerability description states: "An attacker on an adjacent network can exploit this vulnerability without authentication to cause a partial denial of service." Using CVSS v3.1 base metric definitions, which metric values are MOST consistent with this description?',
  '["AV:N (Network), AC:L (Low), PR:N (None), UI:N (None), S:U, C:N, I:N, A:H", "AV:L (Local), AC:L (Low), PR:N (None), UI:N (None), S:U, C:N, I:N, A:L", "AV:A (Adjacent), AC:L (Low), PR:N (None), UI:N (None), S:U, C:N, I:N, A:L", "AV:A (Adjacent), AC:H (High), PR:N (None), UI:N (None), S:U, C:N, I:N, A:H"]'::jsonb,
  2,
  'Parsing the description: "adjacent network" = AV:A (Adjacent -- requires access to the same network segment, Bluetooth, or logical network, not exploitable from the open internet). "without authentication" = PR:N (None) + UI:N (None -- implied, no user interaction mentioned). "partial denial of service" = A:L (Low -- partial availability impact, service degraded but not completely unavailable) + C:N + I:N (no confidentiality or integrity impact). Attack Complexity: no special conditions mentioned = AC:L (Low). Scope: no indication of impact beyond the vulnerable component = S:U (Unchanged). Result: AV:A/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L. This produces a CVSS base score of approximately 4.3 (Medium).',
  'CVSS parsing: adjacent network=AV:A, no auth=PR:N, no user=UI:N, partial DoS=A:L C:N I:N, no special conditions=AC:L, no scope change=S:U.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.10, 0.20, 'handcrafted', true
),

-- Q24: hard / apply / scenario / correct=3
(
  6, 'pen_test_phases',
  'A penetration tester successfully compromises an internal server and discovers it has access to an out-of-scope network segment containing industrial control systems (ICS/SCADA). The server appears to have routing capabilities to the ICS network. What should the tester do?',
  '["Explore the ICS network to demonstrate full impact -- understanding the complete blast radius makes for a more compelling report", "Document the routing capability and note that the ICS segment could theoretically be reached, then continue the test as planned", "Immediately stop all testing activities and leave the network until the client clarifies scope", "Stop any further actions toward the ICS network, document the discovered routing path and access capability to the ICS segment, immediately notify the client''s emergency contact with this out-of-band critical finding -- ICS/SCADA systems control physical processes and unauthorized access could cause safety hazards, equipment damage, or loss of life; await explicit written authorization before proceeding further"]'::jsonb,
  3,
  'ICS/SCADA systems are a special category requiring extreme care during security testing. Actions that might be safe on a corporate IT network can trigger physical processes (opening valves, shutting down production lines, causing safety system failures) on OT/ICS networks. Unauthorized testing of ICS systems can cause irreversible physical damage and safety hazards. The tester must: (1) STOP immediately -- do not probe or test the ICS network. (2) Document what was found (routing path, access capability) without exploiting it. (3) IMMEDIATELY notify the client''s emergency contact as a critical out-of-band finding. (4) Await explicit written authorization with appropriate OT safety procedures before any further testing. This is not a "continue and document" situation.',
  'ICS/SCADA out of scope = STOP immediately. Document path, notify client EMERGENCY contact. No unauthorized ICS testing. Physical safety risk = zero tolerance.',
  'apply', 'scenario', 'hard',
  1.80, 1.70, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / comparison / correct=0
(
  6, 'security_audits',
  'An organization must select between an internal security audit and an external third-party security audit for its annual SOX IT General Controls (ITGC) assessment. Which analysis is MOST accurate for a publicly-traded company?',
  '["External audits provide independent assurance required by SOX -- internal auditors cannot provide the independence required by Section 404; however, internal audit should continuously monitor controls between external assessments to enable a continuous assurance model rather than relying solely on point-in-time external audits", "Internal audits are equally valid for SOX ITGC compliance as external audits because internal auditors have deeper knowledge of the organization''s systems", "External audits are unnecessary if the organization has a mature internal audit function with CISA-certified staff", "SOX Section 404 requires the external auditor to audit only financial controls, not IT General Controls -- IT security is out of scope for SOX compliance"]'::jsonb,
  0,
  'SOX Section 404 requires management to assess and report on internal controls over financial reporting, and the external auditor (registered public accounting firm) to attest to management''s assessment. IT General Controls (ITGCs) -- access controls, change management, computer operations, and program development -- are in scope because they support the reliability of financial reporting systems. External auditors must independently validate ITGCs; internal auditors lack the independence required for the external attestation. However, internal audit teams play a critical complementary role: continuous monitoring between external assessments, pre-audit readiness testing, and issue remediation. The combined model (internal continuous + external point-in-time) provides the strongest overall assurance.',
  'SOX 404: external audit = required for attestation (independence). Internal audit = continuous monitoring between assessments. Both are needed. ITGCs ARE in scope.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=11, comparison=5, tlatm=3, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
