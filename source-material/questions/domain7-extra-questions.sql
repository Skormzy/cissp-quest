-- =====================================================================
-- CISSP Quest -- Domain 7: Security Operations
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: SIEM correlation rules, SOAR playbooks, chain of custody
--   edge cases, ransomware decision matrix, DR testing types
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain7-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  7, 'siem_correlation',
  'A SIEM correlation rule fires when: (1) failed login attempts exceed 10 within 5 minutes for the same account (brute force indicator), AND (2) a successful login occurs within 30 minutes after the failed attempts, AND (3) the successful login originates from a different geolocation than previous successful logins. What attack scenario is this rule designed to detect, and what is a likely false positive scenario?',
  '["The rule detects credential stuffing/brute force followed by successful compromise; a common false positive is a legitimate user who forgets their password, resets it, then logs in for the first time from a new location (e.g., travel or VPN)", "The rule detects SQL injection attacks that bypass authentication; false positives occur when the database is offline", "The rule detects insider threats using stolen credentials; false positives are impossible because the geo-location check eliminates all benign scenarios", "The rule detects DDoS attacks against the authentication system; false positives occur during peak usage hours"]'::jsonb,
  0,
  'This correlation rule detects brute force/credential stuffing followed by successful compromise from an unusual location -- a common attack pattern for account takeover. The rule uses three conditions: failed attempts (attack indicator) + eventual success (compromise indicator) + geolocation anomaly (evasion indicator). False positive scenario: a user who genuinely forgets their password, triggers account lockout or multiple failures during reset, then logs in successfully for the first time from a new location (hotel, airport, VPN) will trigger all three conditions. Tuning requires: checking if a password reset occurred between the failed and successful attempts (legitimate reset = reduce confidence), and whether the geolocation has been seen before for this user.',
  'Brute force + success + new geo = account takeover pattern. False positive = forgot password + reset + travel. Tune with: reset event check + geo history.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  7, 'soar_playbooks',
  'A SOC is evaluating SOAR (Security Orchestration, Automation, and Response) for their phishing response workflow. The current manual process takes 45 minutes per alert. The proposed automated playbook would: (1) Extract IOCs from the email, (2) Check IOCs against threat intel feeds, (3) Block malicious URLs at the proxy, (4) Quarantine emails from the same sender across all mailboxes, (5) Generate a ticket with all findings. Which comparison of automation risk vs. benefit is MOST accurate?',
  '["Full automation of all 5 steps without human review is ideal because speed is critical for phishing response", "Steps 1-4 can be automated with high confidence, but step 4 (quarantine emails across all mailboxes) carries the highest false-positive risk -- a single miscategorized phishing determination triggers enterprise-wide email quarantine; this step should require analyst approval (human-in-the-loop) before bulk quarantine, while steps 1-3 and 5 can be fully automated", "SOAR should not automate any security response actions because false positives in automated responses are unacceptable", "All 5 steps should require manual execution because the 45-minute SLA is acceptable for phishing response"]'::jsonb,
  1,
  'SOAR playbook design requires risk-stratified automation. Steps 1-3 (IOC extraction, threat intel lookup, URL blocking): low blast radius, fast to reverse, high automation confidence. Step 5 (ticket generation): fully automatable with no risk. Step 4 (enterprise-wide email quarantine) has high blast radius: if a legitimate marketing email from a partner is incorrectly flagged as phishing, quarantining all instances affects business communications across the organization. This action requires analyst approval (human-in-the-loop gate) before execution. SOAR best practice: automate low-risk, high-confidence steps fully; add human gates for high-impact, irreversible, or high-blast-radius actions.',
  'SOAR automation risk = blast radius × reversibility. Bulk quarantine = high blast radius = human approval gate. URL block = low blast radius = full auto.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  7, 'chain_of_custody',
  'A forensic investigator acquires a forensic image of a server and stores it on a USB drive. Two weeks later, the USB drive''s file system timestamp shows the forensic image file was accessed 3 days ago. The investigator does not recall accessing the file. What is the chain of custody implication, and what is the MOST appropriate action?',
  '["The timestamp discrepancy is irrelevant because the MD5/SHA-256 hash of the forensic image can verify integrity", "The USB drive''s file system is unreliable; replace the USB drive and re-acquire the evidence", "Immediately notify the case attorney of the potential chain of custody issue; verify the evidence integrity by comparing the current forensic image hash against the original documented hash taken at acquisition time; document the timestamp anomaly, all possible explanations (OS auto-mounting, backup software, antivirus scan), and the hash verification result in the chain of custody documentation -- integrity can potentially be preserved if the hash matches and the access can be explained", "Discard this evidence as inadmissible and re-acquire from the original server"]'::jsonb,
  2,
  'Chain of custody requires documenting every access to evidence and who had access. An unexplained file access timestamp creates a chain of custody concern: did someone access or modify the evidence? The CORRECT response is NOT to discard the evidence preemptively, but to: (1) Check the file hash (if the hash matches the original, the file content was not modified -- even if accessed). (2) Investigate the access: OS features (auto-mounting, indexing, antivirus scans) can create "access" timestamps without opening the file. (3) Document the anomaly and investigation in the chain of custody log. If the hash matches and the access is explained, the evidence may remain admissible. Discarding and re-acquiring evidence from the original server (potentially modified or powered on) would create additional chain of custody problems.',
  'Chain of custody gap: check hash first. If hash = original, content intact. Investigate and DOCUMENT the anomaly. Discard = last resort, not first action.',
  'apply', 'scenario', 'hard',
  1.60, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  7, 'ransomware_response',
  'At 2:00 AM, a CISO receives a call that ransomware has encrypted 60% of production servers. The attacker''s ransom note demands $2M in cryptocurrency within 48 hours. The backup system''s last successful backup is confirmed 24 hours old. Recovery time from backup is estimated at 96 hours. The business loses approximately $500,000 per hour during downtime. What is the FIRST decision the CISO must make?',
  '["Immediately pay the ransom because 96-hour recovery × $500K/hour = $48M in losses vs. $2M ransom -- the financial calculation favors paying", "Immediately begin recovery from backup without any investigation to minimize downtime", "Announce the breach publicly within 72 hours per regulatory requirement before taking any technical action", "Isolate remaining unencrypted systems to stop ransomware spread, activate the incident response plan and crisis management team, engage legal counsel (for regulatory and ransom payment analysis), engage cyber insurance carrier, retain an incident response firm -- the decision to pay or recover is a subsequent step requiring legal, financial, and technical analysis; the FIRST priority is containment to prevent further encryption"]'::jsonb,
  3,
  'In active ransomware incidents, FIRST priority is always containment -- stop the spread before making recovery decisions. The 40% of unencrypted servers must be protected immediately. Premature recovery without containment will re-encrypt restored systems. Paying the ransom immediately without analysis is poor practice: (1) No guarantee the decryption key works, (2) May violate OFAC regulations if attacker is a sanctioned entity, (3) Ransomware groups often double-extort (data was also exfiltrated). Immediate public announcement before understanding the scope creates legal exposure. The CISO must: isolate → activate IR plan → engage legal, insurance, and IR firm → THEN evaluate pay vs. recover decision with complete information.',
  'Ransomware FIRST action = CONTAIN (isolate clean systems). NOT pay yet. NOT recover yet. Activate IR plan, legal, insurance. Contain first, decide later.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / tlatm / correct=0
(
  7, 'dr_testing',
  'An organization has never tested its disaster recovery plan. The CISO proposes starting with a Tabletop Exercise. The CTO argues this is "not a real test" and insists on a full Parallel Test immediately. As the DR coordinator, what is the MOST appropriate recommendation?',
  '["Tabletop exercises are the appropriate starting point for organizations with no DR testing history -- they validate the plan''s logic, identify gaps in procedures and contact trees, train the team on roles, and reveal conflicting assumptions without risking production systems; progressing to simulation, then parallel, then full cutover tests as maturity increases follows industry best practice (NIST SP 800-34, ISO 22301)", "The CTO is correct -- tabletop exercises provide no value; only real system failover tests validate DR plans", "Conduct a parallel test but limit it to non-critical systems to balance the CTO''s requirement with risk management", "Skip all testing phases and go directly to a full cutover test because that is the only test with a high confidence result"]'::jsonb,
  0,
  'DR test maturity should progress through phases (NIST SP 800-34): (1) Tabletop Exercise: paper-based, team walks through the plan, identifies logical gaps -- low cost, no system risk, excellent for first-time teams. (2) Walk-through Drill / Simulation: team performs actions up to but not including actual system failover. (3) Parallel Test: recovery systems are brought online alongside production without switching over -- validates recovery capability without service impact. (4) Full Cutover/Interruption Test: production is failed over to DR site. An organization with no testing history that starts with a parallel or full cutover test risks: undiscovered procedure gaps causing extended downtime, team unfamiliarity with roles causing confusion, and potentially triggering an unplanned outage.',
  'DR testing maturity: Tabletop → Simulation → Parallel → Full Cutover. Start with tabletop. Never jump to full cutover with untested teams.',
  'apply', 'tlatm', 'hard',
  1.70, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / comparison / correct=1
(
  7, 'siem_correlation',
  'A SOC deploys two types of detection: signature-based detection (known attack patterns matched against IoCs) and behavior-based/anomaly detection (UEBA). Which comparison is MOST accurate regarding their respective strengths and limitations?',
  '["Signature-based detection is always superior because it has zero false positives when properly tuned", "Signature-based detection catches known threats accurately but misses novel attacks (zero-days, new variants, Living off the Land techniques) and requires constant signature updates; behavior/anomaly-based detection can identify novel attacks by detecting statistical deviations from baseline but produces higher false positive rates requiring analyst tuning and produces LESS actionable alerts for less experienced analysts -- a layered approach combining both provides comprehensive coverage", "Behavior-based detection has replaced signature-based detection in all modern SIEM deployments", "Signature-based detection is only effective for network-based attacks; behavior-based detection is only effective for endpoint attacks"]'::jsonb,
  1,
  'Signature-based detection (IoC matching, YARA rules, hash matching): high precision when signatures are current, low false positives for known patterns, but completely blind to novel attacks and Living off the Land (LotL) techniques using legitimate system tools. Behavior/anomaly-based (UEBA): baseline normal behavior, detect statistical deviations. Can identify novel attacks, credential theft, insider threats, and slow-and-low exfiltration. However: requires baseline establishment period, produces more false positives, and generates less specific alerts ("user behavior is anomalous" vs. "this is Mimikatz"). Modern SOCs deploy both: signatures for known threats (fast, specific) and behavioral analytics for unknown threats (novel, contextual).',
  'Signatures = known threats, precise, fast, blind to novel. Behavior = novel threats, noisy, needs tuning. Layer both for comprehensive detection.',
  'analyze', 'comparison', 'hard',
  1.80, 1.60, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  7, 'ransomware_response',
  'An organization is negotiating with a ransomware group to purchase a decryption key for encrypted data. Before any payment is made, legal counsel mandates an OFAC (Office of Foreign Assets Control) compliance check. Why is this legally required, and what is the consequence of skipping it?',
  '["OFAC compliance is a best practice but not legally required for ransomware payments; it only applies to government contractors", "Ransomware groups are always sanctioned entities, so all ransom payments are automatically illegal under OFAC regulations", "OFAC compliance is required because some ransomware groups are operated by entities designated on OFAC''s Specially Designated Nationals (SDN) list (e.g., North Korean Lazarus Group, Russian Evil Corp); paying a ransom to a sanctioned entity violates OFAC regulations and can result in civil penalties of up to $1M per violation regardless of whether the payer knew the entity was sanctioned -- the penalties apply on a strict liability basis", "OFAC only applies to transactions over $10M; a $2M ransom payment is below the reporting threshold"]'::jsonb,
  2,
  'OFAC (Office of Foreign Assets Control) administers economic sanctions against countries, entities, and individuals. Several ransomware operators have been designated as Specially Designated Nationals (SDNs): Evil Corp (Russian), Lazarus Group (North Korean), Conti-affiliated actors. Paying ransoms to SDN-designated entities violates US economic sanctions law under the International Emergency Economic Powers Act (IEEPA) and Trading with the Enemy Act (TWEA). Critically, OFAC sanctions liability is STRICT LIABILITY -- you can be penalized even if you did not know the ransomware group was sanctioned. OFAC has issued specific ransomware guidance (2020, 2021) explicitly stating this risk. Due diligence (attribution research, cyber insurance carrier guidance, FBI consultation) is required before payment.',
  'OFAC = strict liability. Paying Evil Corp/Lazarus = sanctions violation even if you didn''t know they were sanctioned. OFAC check is MANDATORY before ransom payment.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / best_answer / correct=3
(
  7, 'incident_response',
  'During a security incident investigation, a first responder powers off a compromised server to "preserve evidence." A senior forensics investigator criticizes this action. Which explanation is MOST accurate?',
  '["Powering off is always the correct first action to prevent further damage and preserve the hard drive''s state", "Powering off is incorrect only if the server contains SSDs, because SSDs lose data differently than HDDs when powered off", "The first responder should have used the OS shutdown command instead of hard power-off to ensure a clean shutdown", "Powering off a compromised server destroys volatile evidence: active network connections, running processes, loaded kernel modules (including rootkits), memory-resident malware, decryption keys in RAM, and clipboard contents -- this evidence exists only in volatile memory and is lost on power loss; proper live forensics requires first capturing a memory dump (RAM acquisition), then capturing disk image while powered on, before considering shutdown"]'::jsonb,
  3,
  'Volatile evidence (RAM contents, active connections, process list, open files, network state, logged-in sessions) exists only while the system is powered on. Modern malware (fileless malware, memory-resident payloads, encrypted ransomware keys) leaves no disk artifacts -- only volatile memory evidence. Incident response best practice: (1) Capture volatile data first (memory image using tools like WinPMEM, LiME, Magnet RAM Capture), (2) Capture network state (netstat, active connections), (3) Then proceed with disk imaging. Powering off before volatile capture is forensically incorrect and may destroy the only evidence of how the attack occurred. ACPO/NIST forensic guidelines mandate volatile data priority.',
  'Power off = destroy RAM evidence (malware, keys, processes, connections). Live forensics: capture RAM first, then disk. Volatile = power-off = gone forever.',
  'apply', 'best_answer', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / scenario / correct=0
(
  7, 'chain_of_custody',
  'A digital forensics investigator is called to examine an employee''s workstation suspected of data theft. The workstation is powered on when the investigator arrives. The HR manager is present and wants to immediately log in to "see what the employee was working on." What is the MOST critical action the investigator must take?',
  '["Prevent the HR manager from touching the workstation; document the system''s current state (screen, time, date, running processes visible on screen), then perform a live RAM acquisition using a forensically sound write-protected tool before any other actions", "Allow the HR manager to log in because they have administrative authority over employee workstations", "Power off the workstation immediately to preserve the disk image in its current state", "Unplug the network cable to prevent data exfiltration while the HR manager reviews the contents"]'::jsonb,
  0,
  'Multiple forensic errors would occur if the HR manager logs in: (1) Login action modifies file system timestamps (last login, last access times for recently used files). (2) Login may trigger automated scripts that modify or delete evidence. (3) HR manager viewing contents does not constitute forensically sound collection and may contaminate evidence. The investigator must: (1) Assert forensic control of the scene. (2) Photograph the screen. (3) Document the system state (running processes, open windows, network connections visible on screen). (4) Perform live RAM acquisition using a write-protected forensic tool (not the system''s own RAM, which would modify page files). HR authority over HR matters does not override forensic evidence preservation requirements.',
  'HR wants to log in = STOP them. Document screen state first. Then live RAM acquisition. Login contaminates timestamps and triggers scripts.',
  'apply', 'scenario', 'hard',
  1.80, 1.50, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / scenario / correct=1
(
  7, 'siem_correlation',
  'A SIEM analyst notices a detection rule generating 2,400 alerts per day, of which manual investigation reveals 98% are false positives. The SOC manager wants to tune the rule to reduce false positives. Which tuning approach is MOST methodologically sound?',
  '["Increase the rule''s threshold parameters (e.g., event count, time window) until false positive rate drops below 5%", "Analyze the 2% true positives and 98% false positives to identify distinguishing characteristics of each population; then add suppression conditions based on attributes that are consistently present in false positives but absent in true positives (e.g., specific source IPs, user accounts, business hours, application names) -- preserving detection of true positives while suppressing known benign patterns", "Disable the rule entirely and replace it with a manual monitoring task to eliminate false positive risk", "Accept the 98% false positive rate because security teams must investigate all alerts regardless of quality"]'::jsonb,
  1,
  'SIEM rule tuning requires understanding WHY false positives occur, not just reducing event counts blindly. Process: (1) Analyze a sample of both true and false positive alerts. (2) Identify features that distinguish them (source account type, time of day, department, application, subnet, preceding events). (3) Add targeted suppression conditions that exclude the benign patterns while preserving detection of the malicious pattern. For example: if 95% of false positives come from service accounts during business hours and true positives are from user accounts after hours, add: (source_account_type != "service_account" OR time_of_day NOT IN "09:00-17:00"). Threshold-only tuning blindly reduces sensitivity and may eliminate true positive detection. Disabling rules creates coverage gaps.',
  'SIEM tuning: analyze FP vs TP characteristics → suppress FP patterns without eliminating TP detection. Evidence-based tuning, not blind threshold adjustment.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q11: hard / apply / scenario / correct=2
(
  7, 'dr_testing',
  'An organization completes a DR parallel test. During the test, the DR site successfully processes transactions but at 40% of production capacity. The organization''s documented RTO is 4 hours and recovery capacity goal is 100%. The parallel test takes 6 hours to achieve 40% capacity. What does this test result indicate, and what is the MOST appropriate response?',
  '["The test is a success because the DR site came online and processed some transactions", "The test reveals the DR site is adequately sized for catastrophic disasters because 40% capacity is acceptable for a degraded mode", "The test reveals two gaps: (1) RTO gap -- 6 hours exceeds the 4-hour RTO objective; (2) Capacity gap -- 40% capacity cannot sustain business operations at required levels; both gaps require root cause analysis (hardware under-provisioning, slow data synchronization, missing automation in the failover runbook) and remediation before the DR plan can be relied upon", "The parallel test cannot accurately measure RTO because production systems remain operational during a parallel test"]'::jsonb,
  2,
  'A DR test must measure performance against documented objectives (RTO, RPO, recovery capacity). This test reveals two objective failures: (1) RTO failure: 6h actual > 4h objective. Root causes may include: manual failover steps that could be automated, network reconfiguration time, slow data sync, or missing runbook steps. (2) Capacity failure: 40% capacity < 100% goal. Root causes may include: DR infrastructure under-provisioned (compute/memory/storage), missing scale-out configuration, database replication lag leaving DR DB behind. Both gaps must be remediated and the test repeated before the organization can rely on its DR plan. Parallel test capacity IS measurable -- DR systems are running alongside production and can be load-tested independently.',
  'DR test results must be measured against RTO and capacity objectives. Failures = root cause analysis + fix + retest. "DR came online" ≠ "DR is adequate."',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q12: very_hard / analyze / tlatm / correct=3
(
  7, 'soar_playbooks',
  'You are a SOC architect designing a SOAR playbook for endpoint isolation in response to a malware detection event. The endpoint detection tool triggers an isolation action that cuts all network connectivity except to the SOAR platform''s management channel. After isolation, the playbook automatically runs a memory acquisition and sends it to the forensics team. A security analyst argues that the auto-isolation should include endpoints used by C-suite executives. What is the MOST balanced approach?',
  '["Exclude all C-suite endpoints from automated isolation because executive availability is always prioritized over security response", "Apply identical automated isolation to all endpoints including C-suite because security policies must be uniformly enforced", "Implement tiered response: C-suite endpoints trigger automatic containment (network isolation from internet while maintaining internal corporate access) but escalate to the CISO and executive assistant for awareness before full isolation", "Implement a risk-based tiered response: for endpoints classified as executive/critical personnel, the SOAR playbook should: (1) contain the endpoint (block external internet, maintain access to email/collaboration tools via controlled gateway), (2) page the on-call senior analyst and CISO simultaneously, (3) require senior analyst confirmation within 15 minutes before escalating to full isolation -- balancing security response speed with executive continuity and leadership awareness"]'::jsonb,
  3,
  'Automatic full network isolation of C-suite endpoints creates significant business and reputational risks: CEOs and CFOs may be in investor calls, regulatory discussions, or crisis communications when isolation is triggered. However, delayed response enables malware spread. The balanced SOAR approach: tiered containment (partial isolation: block internet egress, maintain controlled internal access) + immediate escalation to CISO + time-boxed human decision gate (15-min confirmation window). This approach: contains spread immediately (partial isolation), informs leadership (CISO and executive), allows brief human judgment, and escalates to full isolation if confirmation is not received. Uniform automated full isolation for ALL endpoints regardless of role ignores operational reality.',
  'SOAR tiered response: C-suite = partial contain + CISO notification + 15-min human gate → full isolate. Balance: immediate containment vs. executive awareness.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 2.20, 0.22, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  7, 'incident_response',
  'An organization''s incident response plan designates the CISO as the Incident Commander. During a major ransomware incident at 3:00 AM, the CISO is unreachable. The on-call security analyst makes several containment decisions independently and stops the ransomware spread. In the post-incident review, the IR plan''s single CISO designation is identified as a gap. What is the BEST remediation?',
  '["Implement a formal succession chain in the IR plan: designate backup Incident Commanders (e.g., Deputy CISO, Director of Security Operations, Senior IR Manager) with pre-authorized decision-making authority at defined escalation thresholds, and ensure all designated backup ICs have completed tabletop exercises in the IC role", "Require the CISO to be available 24/7/365 with no vacation or unavailability permitted", "Create a committee-based IC model where all decisions require majority vote among 5 senior security staff members", "Hire a 24/7 Managed Security Services Provider (MSSP) as the permanent Incident Commander for all incidents"]'::jsonb,
  0,
  'A single point of failure in the Incident Commander role is a critical IR plan gap. Best practice: succession chain with pre-authorized authority. Requirements: (1) Named backup ICs at multiple tiers (Deputy CISO, Director SecOps, Senior IR Manager), (2) Pre-authorized decision-making authority (backup ICs should not need to reach the CISO to make containment decisions within their authority level), (3) Tabletop training for all backup ICs so the role switch is practiced, (4) Clear escalation thresholds (e.g., backup IC at Level 1 incidents, CISO at Level 3+). A committee model creates decision paralysis during crises. Requiring 24/7 CISO availability is not sustainable. MSSP as permanent IC cedes organizational control.',
  'CISO unavailable = IR single point of failure. Fix: succession chain + pre-authorized authority + tabletop training for all backup ICs.',
  'apply', 'best_answer', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / first_action / correct=1
(
  7, 'ransomware_response',
  'An organization discovers that their file server has ransomware encryption in progress. The server contains 50TB of data, of which 15TB has already been encrypted. Recovery from backup will take 72 hours. What is the FIRST technical action that should be taken?',
  '["Begin restoring from backup immediately because the 35TB of unencrypted data will continue to be encrypted while you investigate", "Isolate the affected server from the network immediately to stop the ransomware from encrypting the remaining 35TB and spreading to other network shares -- then identify and quarantine other potentially infected endpoints while the ransomware''s lateral spread mechanism is investigated", "Run antivirus on all remaining servers to detect the ransomware variant before taking any other action", "Pay the ransom immediately because 50TB of encrypted data recovery will take longer than 72 hours"]'::jsonb,
  1,
  'With active in-progress ransomware encryption, every second of network connectivity allows: (1) Additional local files to be encrypted, (2) Ransomware to spread to network shares mounted on the server, (3) Ransomware to propagate to additional servers via lateral movement (SMB, shared credentials, RDP). The FIRST technical action must be network isolation (disconnect the server from the network -- pull the network cable, disable the switch port, or use NAC quarantine). This stops the encryption spread immediately. Backup restoration cannot begin while ransomware is still active (restored data will be re-encrypted). AV scanning across all servers is a secondary activity. Ransom payment analysis is premature before containment.',
  'Active ransomware = ISOLATE IMMEDIATELY. Pull the network cable. Every second = more encrypted. Isolation is FIRST, everything else is second.',
  'apply', 'first_action', 'hard',
  1.80, 1.50, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / scenario / correct=2
(
  7, 'chain_of_custody',
  'A digital forensics analyst is ordered by a court to produce a forensic copy of a suspect''s encrypted laptop. The analyst successfully creates a bit-for-bit image but cannot decrypt it because the encryption key is held by the suspect who refuses to provide it. Law enforcement asks the analyst to attempt to bypass the encryption. What is the MOST important consideration?',
  '["The analyst should attempt to bypass encryption using any available tools because court orders supersede privacy protections", "The analyst cannot comply with any part of the order until the encryption is resolved, because an encrypted image is legally useless", "The analyst should produce the verified forensic image to the court as requested, documenting the encryption barrier in the chain of custody and case notes; any decision to compel the suspect to provide the encryption key or to attempt technical bypass involves legal privilege and Fifth Amendment considerations that must be decided by the court and attorneys, not by the forensic analyst -- the analyst''s role is acquisition and documentation, not legal strategy", "The analyst should request a new court order specifically authorizing decryption attempts before producing any evidence"]'::jsonb,
  2,
  'The forensic analyst''s role is evidence acquisition and documentation, not legal strategy. The analyst has completed the authorized task (forensic image with verified hash). The encryption barrier is a legal matter: (1) Fifth Amendment implications: compelling a suspect to provide a decryption password may violate the right against self-incrimination (Fisher v. US; In Re Grand Jury Subpoena -- complex case law). (2) All-Writs Act (compelled decryption) vs. Constitutional protections is decided by courts, not analysts. The analyst documents the encrypted state in chain of custody records and reports this factually to the requesting attorneys. Technical bypass attempts without specific authorization may exceed the scope of the court order.',
  'Forensic analyst role = acquire + document. Encryption = legal problem, not analyst problem. Document it, report to attorneys. Court decides on compelled decryption.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.30, 0.20, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  7, 'siem_correlation',
  'A SOC analyst receives a SIEM alert: "Privileged account used outside normal hours (11:00 PM) from a workstation that has never previously been used by this account." The account belongs to a database administrator. What is the MOST appropriate initial response action?',
  '["Immediately disable the privileged account because after-hours access by a privileged account is always malicious", "Ignore the alert because database administrators routinely work after hours for maintenance", "Escalate to the account owner''s manager for confirmation before taking any action", "Apply the OODA loop: Observe (collect context -- what commands did the account execute? What database was accessed? Is this a known maintenance window?), Orient (compare to baseline -- is scheduled maintenance documented? Has this workstation been used by others?), Decide (based on context, either contact the DBA to verify legitimacy or escalate to senior analyst), Act (if unauthorized activity is confirmed or DBA cannot be reached, quarantine the workstation and lock the account pending investigation)"]'::jsonb,
  3,
  'The OODA loop (Observe, Orient, Decide, Act) is an appropriate framework for triage. Context gathering before action: (1) What was the account doing? (DB queries, schema modifications, data export?) (2) Is there a scheduled maintenance window? (Change management system check) (3) Has this workstation been used for DBA work before? (Different device is a high-risk signal) (4) What was the data accessed? (Sensitive tables?) Immediate account disablement without context disrupts legitimate maintenance. Complete dismissal ignores a potentially real compromise. Manager escalation skips technical triage. Contacting the DBA directly to verify provides rapid verification with minimal disruption.',
  'SIEM alert triage: OODA loop. Gather context first (what was done, maintenance window, workstation history). Verify with DBA. Then decide: act or escalate.',
  'apply', 'scenario', 'hard',
  1.70, 1.70, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / comparison / correct=0
(
  7, 'dr_testing',
  'An organization is selecting a DR test type for its primary banking application. Management requires a test that validates full recovery capability with actual production data, without risking production system availability. Which DR test type BEST meets these requirements?',
  '["Parallel test (simultaneous operation): DR systems are brought online and process transactions using a recent copy of production data while production remains running; if DR performance is validated, the organization gains confidence in recovery capability without risking production availability", "Full interruption/cutover test: production is failed over to DR, providing the most realistic test -- this meets both requirements", "Tabletop exercise using simulated data: provides full recovery capability validation without any production data risk", "Simulation test (structured walk-through): team members walk through recovery procedures without activating any systems"]'::jsonb,
  0,
  'Requirements analysis: (1) Validates full recovery capability -- rules out tabletop/simulation (they do not activate systems). (2) Uses actual production data -- rules out synthetic data tests. (3) Does NOT risk production availability -- rules out full interruption/cutover test (which takes production offline). Parallel test: DR systems are spun up and run with a recent copy of production data (data replicated from production) while production continues to run normally. This validates actual recovery steps, actual data restoration, and application performance under load, without impacting production. If the DR test fails, production never went offline. Full cutover (interruption) test is the most realistic but does risk production availability (the requirement explicitly excludes this).',
  'Parallel test = DR runs WITH production (no production risk) + real data = meets both requirements. Cutover = risks production = fails requirement 3.',
  'analyze', 'comparison', 'hard',
  1.60, 1.40, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / best_answer / correct=1
(
  7, 'soar_playbooks',
  'A SOAR playbook automatically queries threat intelligence for an indicator, blocks it at the perimeter firewall, and then sends an email notification to the impacted user and their manager. A privacy attorney flags a concern. What is the MOST likely privacy issue?',
  '["The firewall blocking action may violate acceptable use policies if it blocks legitimate websites", "Automatically notifying an employee''s manager that the employee triggered a threat intelligence alert discloses information about the employee''s browsing behavior or potential security incident to the manager without a formal HR process or need-to-know determination -- this may violate employee privacy rights, GDPR/CCPA, or company HR policies regarding monitoring disclosure", "Querying third-party threat intelligence feeds shares internal network data with external parties, creating a data disclosure risk", "The automated blocking action may block legitimate security research, creating a whistleblower retaliation concern"]'::jsonb,
  1,
  'SOAR playbooks that automatically notify managers of employee security events create privacy concerns. The manager notification discloses: (1) What the employee was accessing when the incident triggered, (2) That the employee''s device was involved in a potential security incident, (3) Potentially embarrassing or HR-sensitive information. In GDPR jurisdictions, this constitutes processing of employee personal data for monitoring purposes, which may require: Works council approval, employee notification of monitoring scope, or a specific legitimate interest/legal basis. Even in non-GDPR contexts, HR policies may require formal processes before notifying management of employee security issues. The SOAR playbook should route to the SOC/IR team rather than directly to managers without governance review.',
  'SOAR auto-notify manager = employee privacy risk. Discloses browsing/security behavior to manager without HR process. GDPR: monitoring requires legal basis + employee notification.',
  'analyze', 'best_answer', 'very_hard',
  1.90, 2.10, 0.22, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  7, 'incident_response',
  'An organization is in the middle of a ransomware incident response. The attacker sends a message claiming they also exfiltrated 200GB of customer data and will publish it unless the ransom is paid (double extortion). The organization has NO data loss prevention monitoring and cannot confirm or deny the exfiltration claim. What is the MOST appropriate response to this threat?',
  '["Dismiss the threat because ransomware groups routinely bluff about exfiltration to increase ransom pressure", "Immediately pay the ransom to prevent data publication because customer data exposure creates larger liability than the ransom amount", "Treat the exfiltration claim as credible until forensically disproven: review available network logs (NetFlow, proxy, DNS) for large data transfers in the days/weeks before the ransomware detonation, engage forensic investigators to search for staging directories and exfiltration artifacts, notify legal counsel and potentially regulators under applicable breach notification laws if the exfiltration cannot be ruled out, and prepare for public disclosure", "Wait for the attacker to publish sample data before taking any action regarding the exfiltration claim"]'::jsonb,
  2,
  'Double extortion is now the default ransomware group business model (Maze pioneered it in 2019-2020; now >70% of ransomware incidents involve data exfiltration claims). Treating the claim as a bluff has severe legal consequences: if exfiltration is real and the organization does not notify regulators/data subjects under GDPR (72h) or US state laws (30-90 days), the delay is a regulatory violation. Without DLP monitoring, absence of evidence is not evidence of absence. The forensic investigation may find staging directories, large outbound transfers in NetFlow, or C2 communications. Even if forensics cannot confirm exfiltration, legal counsel may advise breach notification based on the claim alone (regulatory risk management).',
  'Double extortion = treat as credible. No DLP ≠ no exfil. Search logs for transfer artifacts. Notify legal/regulators. Do not wait for sample data.',
  'apply', 'scenario', 'hard',
  1.80, 1.80, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  7, 'dr_testing',
  'An organization''s DR plan requires a Recovery Point Objective (RPO) of 1 hour for its transaction database. The backup strategy uses asynchronous database replication to the DR site with a documented replication lag of 45 minutes. During a parallel test, the production database suffers a simulated failure and the DR site has data that is 78 minutes old at the time of failover. How should this result be interpreted?',
  '["The RPO is met because 78 minutes is close to 1 hour and within acceptable measurement variance", "The RPO is met because the 45-minute replication lag is within the 1-hour RPO target during normal operations", "The RPO cannot be assessed from this test because parallel tests use simulated, not real, failure scenarios", "The RPO of 1 hour was breached (78 minutes > 60 minutes). The 45-minute documented replication lag represents steady-state replication, but under load or failure conditions, replication lag increases -- in this case to 78 minutes at the point of failure; the DR strategy must be redesigned to ensure replication lag stays below 60 minutes under all conditions including peak load and pre-failure states, possibly requiring synchronous replication, more frequent backup snapshots, or a lower RPO that realistically matches the replication technology''s actual lag"]'::jsonb,
  3,
  'RPO = maximum acceptable data loss measured in time. If RPO = 60 minutes, the DR site must have data that is no more than 60 minutes old at the time of failover. The test result (78 minutes data age) means the organization would lose 78 minutes of transactions in a real failure -- 18 minutes beyond the RPO. Asynchronous replication lag is not constant: under peak transaction load, network congestion, or as a failure approaches (the system may slow down, increasing replication lag), the lag grows beyond the steady-state 45 minutes. The DR strategy must be validated under peak load conditions, not just steady-state. Synchronous replication (RPO=0) or more frequent snapshots are potential solutions.',
  'DR test: RPO = data age at failover must be ≤ RPO target. 78min > 60min = RPO BREACHED. Async replication lag increases under load. Fix: sync replication or more snapshots.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / scenario / correct=0
(
  7, 'chain_of_custody',
  'An investigator seizes 15 hard drives from a company''s server room as part of an insider threat investigation. The investigator photographs each drive and creates a spreadsheet listing serial numbers. Two weeks later, during review, the defense attorney argues that three of the drives cannot be traced to the server room because the photographs show serial numbers that are partially obscured. What chain of custody error occurred?',
  '["The investigator failed to collect sufficient identifying information at the time of seizure -- each piece of evidence must be uniquely and unambiguously identified (serial number, model, asset tag, physical description, location seized from) and this identification must be legible and complete in the documentation; the partial photo is insufficient for unambiguous identification", "The investigator should have used video instead of photographs to document the seizure", "The chain of custody was maintained because the spreadsheet exists; the photograph quality is a presentation issue, not a chain of custody failure", "The defense attorney''s argument is invalid because the burden of proof rests on the defense to disprove chain of custody"]'::jsonb,
  0,
  'Chain of custody documentation must provide unambiguous identification of each piece of evidence. For storage media: serial numbers must be fully readable, model numbers recorded, and physical location documented. Partially obscured serial numbers create an identification gap that the defense can exploit: "You cannot prove this drive came from the server room." Proper evidence collection: photograph each drive from multiple angles ensuring the serial number/model label is fully legible, record all identifying information in the chain of custody form at the time of seizure (not from photos), use evidence labels/tags with sequential evidence numbers on each item. This is a documentation quality failure that could affect admissibility.',
  'Chain of custody = unambiguous identification. Partially obscured serial number = identification gap. Document everything legibly at time of seizure. No ambiguity allowed.',
  'apply', 'scenario', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / first_action / correct=1
(
  7, 'incident_response',
  'A security analyst identifies that an attacker has obtained persistent access to the organization''s Azure Active Directory via a compromised global administrator account. The attacker has created three backdoor admin accounts. What is the FIRST priority action in the containment phase?',
  '["Immediately notify all employees about the breach to enable them to change their passwords", "Revoke all active sessions and tokens for the compromised global admin account and the three backdoor accounts, then disable (not delete) the backdoor accounts -- this requires using an UNCOMPROMISED admin account or Microsoft''s emergency access procedure; deleting backdoor accounts before investigation destroys forensic evidence of when they were created and what they accessed", "Delete the three backdoor accounts and change the compromised admin account''s password to regain control", "Disable Azure Active Directory entirely to prevent further attacker access while the investigation proceeds"]'::jsonb,
  1,
  'With AAD compromise: revoking active sessions (invalidating all existing tokens/sessions) is the critical first containment action -- the attacker may have active sessions that continue even after a password change. Process: (1) Use an UNCOMPROMISED admin account (or Microsoft''s emergency access account). (2) Revoke all sessions for compromised accounts (revoke refresh tokens). (3) Disable (not delete) backdoor accounts -- deletion destroys forensic evidence (creation timestamp, activity logs, permissions assigned). (4) Review and revoke any additional permissions or service principals the attacker created. Employee notification is premature before scope assessment. Disabling all AAD is disproportionate. Password change alone does not revoke existing sessions in Azure AD.',
  'AAD compromise: revoke sessions FIRST (existing tokens still work after password change). Disable (not delete) backdoor accounts. Use uncompromised admin or emergency access.',
  'analyze', 'first_action', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / comparison / correct=2
(
  7, 'siem_correlation',
  'A SIEM team is designing detection content for MITRE ATT&CK technique T1059 (Command and Scripting Interpreter). The team debates between two approaches: (A) Signature-based: alert on specific known malicious command strings (e.g., "powershell -EncodedCommand"). (B) Behavioral: alert on PowerShell processes spawned from unusual parent processes (e.g., Word.exe → PowerShell.exe). Which approach is MORE resilient to attacker evasion, and why?',
  '["Approach A is more resilient because command strings are hard to change without breaking functionality", "Both approaches are equally resilient when properly tuned because the combination of both eliminates evasion options", "Approach B (behavioral/parent-process detection) is more resilient because attackers can trivially obfuscate command strings (Base64 encoding, concatenation, character substitution, AMSI bypass) while the parent-process relationship (Word spawning PowerShell) is a fundamental artifact of the attack technique that is harder to change without redesigning the attack vector", "Approach A is more effective at runtime because it produces fewer false positives"]'::jsonb,
  2,
  'MITRE ATT&CK T1059.001 (PowerShell): signature-based detection of command strings is highly evasion-prone. Attackers use: Base64 encoding (-EncodedCommand), string concatenation, character substitution, environment variable expansion, AMSI bypass techniques to obfuscate the command. These techniques specifically defeat string-matching signatures. Behavioral parent-process detection (Word.exe → PowerShell.exe, mshta.exe → cmd.exe, etc.) detects the fundamental attack behavior: a document-processing application spawning a command shell is extremely unusual in legitimate workflows. Changing this parent-process relationship requires the attacker to redesign how they deliver and execute their payload -- much more costly than re-encoding a command string. This is why behavioral detection maps higher on the Pyramid of Pain.',
  'String obfuscation = trivial. Parent-process chain = hard to change. Word→PowerShell is the TTP, not the specific command. Behavioral = more resilient.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.30, 0.22, 'handcrafted', true
),

-- Q24: hard / apply / scenario / correct=3
(
  7, 'soar_playbooks',
  'A SOAR playbook is triggered by an EDR alert for a known ransomware hash on an employee laptop. The playbook automatically isolates the laptop, kills the malicious process, and begins a forensic memory collection. The employee was in the middle of submitting a critical regulatory filing with a 4:00 PM deadline. The laptop isolation happens at 3:45 PM. What should the SOAR playbook''s design have included to handle this scenario?',
  '["The SOAR playbook was designed correctly -- regulatory filings are not security exceptions and isolation must proceed without delay", "The SOAR playbook should have a 2-hour delay before isolation to allow employees to complete critical work", "The SOAR playbook should check whether the laptop is connected to a regulatory filing system before isolating and delay if a filing is in progress", "The SOAR playbook should integrate with the business context system: flag high-criticality business events (regulatory filing deadlines, financial close periods, board meetings) as scheduled maintenance windows during which automatic isolation is downgraded to a critical alert with human decision authority, while maintaining the kill-process action to stop the malware -- providing a 15-minute human decision window for senior analyst/CISO approval of alternative containment that balances security and business continuity"]'::jsonb,
  3,
  'Well-designed SOAR playbooks must account for business context. Regulatory filing deadlines, financial close periods, and other critical business events are foreseeable scenarios that require human judgment. Best practice: integrate SOAR with change management/business calendar systems to identify high-criticality windows. During these windows: (1) Do NOT delay the malicious process kill (security action with no business downside). (2) Downgrade automatic full isolation to a critical human-decision alert with a short window (15 min). (3) Simultaneously notify CISO and SOC manager. (4) Allow senior personnel to authorize alternative containment (e.g., network-only isolation preserving access to the filing system portal via a jump host). Fully delaying all actions creates unacceptable security risk.',
  'SOAR context: integrate with business calendar. Critical business events = human gate for isolation. BUT still kill the malicious process immediately. Balance security + business.',
  'apply', 'scenario', 'hard',
  1.70, 1.90, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  7, 'ransomware_response',
  'After a ransomware incident, the organization pays the ransom and receives a decryption key. The decryption process restores 95% of files. IT management declares the incident "resolved" and closes the ticket. A senior security analyst objects. What is the analyst''s MOST likely concern?',
  '["Paying the ransom and receiving a decryption key does not address how the ransomware got in -- the initial access vector and persistence mechanisms likely remain in the environment; closing the ticket without completing root cause analysis, eradicating persistence, rebuilding compromised systems, implementing controls to prevent recurrence, conducting a lessons-learned review, and notifying applicable regulators/data subjects is premature and dangerous", "The remaining 5% of unrestored files are the primary concern and must be restored before closing the ticket", "The ransom payment may have violated internal financial approval procedures, which is the primary governance concern", "Declaring the incident resolved is correct because the business impact (encrypted files) has been remediated"]'::jsonb,
  0,
  'Decrypting files is restoration, not remediation. The incident response lifecycle (NIST SP 800-61) requires: Preparation → Detection → Containment → Eradication → Recovery → Post-Incident Activity. Decrypting files is part of Recovery, but Eradication (removing malware, closing initial access vector, eliminating persistence) must be completed. Common ransomware persistence mechanisms that survive decryption: scheduled tasks, registry run keys, beacon implants, compromised credentials in Active Directory, shadow admin accounts. The initial access vector (phishing, VPN credential compromise, vulnerable internet-facing service) may still exist. Post-incident: lessons learned, regulatory notification (if required), insurance claim finalization. 5% file loss is secondary to the security posture risk.',
  'Decryption ≠ incident resolved. Eradication (remove persistence + initial access vector) must happen. Close ticket only after: eradicate + patch + lessons learned + notify.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=12, comparison=4, tlatm=3, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
