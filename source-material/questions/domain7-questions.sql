-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 7: Security Operations Questions
-- 100 questions for CAT engine
-- Distribution: 15 easy, 55 medium, 20 hard, 10 very_hard
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
-- EASY QUESTIONS (15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: Easy / Remember / Comparison — correct at 0
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  7,
  'incident_response',
  'What is the PRIMARY difference between a security event and a security incident?',
  '["An event is any observable occurrence, while an incident is an adverse event that negatively impacts CIA", "An event requires management notification, while an incident does not", "An event is always malicious, while an incident may be accidental", "An event originates externally, while an incident originates internally"]'::jsonb,
  0,
  'A security event is any observable occurrence in a system or network, such as a user logging in or a firewall blocking a connection. An incident is specifically an adverse event that negatively impacts the confidentiality, integrity, or availability of information or systems. All incidents are events, but not all events are incidents.',
  'EVENT = Everything that happens. INCIDENT = It''s Negatively impacting CIA, that''s the Distinguishing Element, Now Triage.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q2: Easy / Remember / Best Answer — correct at 1
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  7,
  'backup_strategies',
  'Which type of backup copies ALL data regardless of the archive bit setting and then resets the archive bit?',
  '["Incremental backup", "Full backup", "Differential backup", "Mirror backup"]'::jsonb,
  1,
  'A full backup copies all selected data regardless of whether the archive bit is set, and then resets the archive bit to 0 (indicating the file has been backed up). Incremental backups only copy files with archive bit set to 1 and then reset it. Differential backups copy files with archive bit set to 1 but do NOT reset it.',
  'FULL = Flush the archive bit. Full backup does it ALL, then resets ALL bits.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q3: Easy / Understand / Best Answer — correct at 2
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'recovery_sites',
  'Which recovery site type provides the FASTEST recovery time but at the highest cost?',
  '["Hot site", "Warm site", "Redundant/mirror site", "Mobile site"]'::jsonb,
  2,
  'A redundant or mirror site is a fully equipped, fully staffed, and continuously operational facility that provides near-instant recovery (seconds). A hot site is fully equipped but lacks current data and staff, requiring hours to become operational. The mirror site is the most expensive option because it maintains real-time data replication and dedicated staff at all times.',
  'Mirror = Me In Real-time, Running On Replica. It''s your twin — always ready, always running.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q4: Easy / Understand / Comparison — correct at 3
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'backup_strategies',
  'What is the KEY difference between incremental and differential backups?',
  '["Incremental is faster to restore than differential", "Differential copies more data than a full backup", "Incremental requires more storage than differential", "Incremental resets the archive bit while differential does not"]'::jsonb,
  3,
  'The key technical difference is archive bit handling. Incremental backups copy files changed since the last backup of any type and reset the archive bit to 0. Differential backups copy files changed since the last full backup and do NOT reset the archive bit. This means differentials grow larger over time while incrementals stay small, but incrementals require all backup sets for restoration.',
  'INC = I Now Clear the bit. DIFF = Don''t I Fiddle with Flags. Incremental clears, differential doesn''t.',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q5: Easy / Understand / Most Likely — correct at 0
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'malware_types',
  'Which type of malware is MOST LIKELY to spread across a network without any user interaction?',
  '["Worm", "Virus", "Trojan horse", "Logic bomb"]'::jsonb,
  0,
  'Worms are self-propagating malware that spread across networks by exploiting vulnerabilities without requiring user interaction. Viruses require a user action such as opening a file or running a program. Trojans disguise themselves as legitimate software and need a user to install them. Logic bombs wait for a triggering condition and do not self-propagate.',
  'WORM = Wriggles On its own, Replicates through Media. Worms crawl by themselves — no human help needed.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q6: Easy / Apply / Scenario — correct at 1
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'raid_levels',
  'A small business needs to configure storage for a file server. They have three identical hard drives and want both performance improvement and the ability to survive a single drive failure. Which RAID level should they implement?',
  '["RAID 0", "RAID 5", "RAID 1", "RAID 6"]'::jsonb,
  1,
  'RAID 5 provides both striping for performance and parity for fault tolerance, requiring a minimum of 3 drives and surviving the loss of any single drive. RAID 0 provides striping for performance but no redundancy. RAID 1 provides mirroring (redundancy) with only 2 drives but no performance gain. RAID 6 requires a minimum of 4 drives.',
  'RAID 5 = Five fingers on one hand, lose one finger and you can still function. Minimum 3 drives, tolerates 1 failure.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q7: Easy / Apply / First Action — correct at 2
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'incident_response',
  'An employee reports that their workstation is displaying a ransom message demanding Bitcoin payment. What should be the FIRST action taken?',
  '["Pay the ransom to recover the data quickly", "Immediately power off the workstation to stop encryption", "Isolate the workstation from the network to prevent spread", "Reformat the workstation and restore from backup"]'::jsonb,
  2,
  'The first action for a ransomware incident is containment — isolating the affected system from the network to prevent the malware from spreading to other systems. You should never pay the ransom. Powering off could destroy volatile evidence in memory. Reformatting is a recovery step that comes much later after proper investigation and evidence preservation.',
  'First contain, then investigate. ISOLATE before you INVESTIGATE — stop the bleeding first.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q8: Easy / Apply / Best Answer — correct at 3
-- IRT: b = -1.5 + 0.3 + 0.0 = -1.2, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  7,
  'change_management',
  'A system administrator wants to deploy a new security patch to all production servers. What is the BEST approach according to change management principles?',
  '["Deploy the patch immediately to all servers to minimize exposure time", "Wait for the vendor to release a second version of the patch", "Deploy to half the servers first, then the other half the next day", "Test the patch in a non-production environment, obtain CAB approval, then deploy during a maintenance window"]'::jsonb,
  3,
  'Proper change management requires testing changes in a non-production environment first, obtaining approval from the Change Advisory Board (CAB), and scheduling deployment during a low-impact maintenance window. Deploying untested patches directly to production risks system outages. The process ensures changes are evaluated, approved, tested, and implemented in a controlled manner.',
  'Change management: REQUEST, TEST, APPROVE, DEPLOY, VERIFY. Never skip testing!',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q9: Easy / Remember / Except Not — correct at 2
-- IRT: b = -1.5 + (-0.5) + 0.2 = -1.8, a = 0.8 + (-0.1) = 0.7, c = 0.25
(
  7,
  'evidence_types',
  'All of the following are among the five rules of evidence EXCEPT:',
  '["Authentic", "Complete", "Circumstantial", "Admissible"]'::jsonb,
  2,
  'The five rules of evidence are: authentic, accurate, complete, convincing (reliable), and admissible. Circumstantial is a TYPE of evidence (evidence that suggests a fact by implication), not one of the five rules that govern evidence quality and acceptability. These rules determine whether evidence can be used in legal proceedings.',
  'Five rules of evidence: A-A-C-C-A = Authentic, Accurate, Complete, Convincing, Admissible.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),

-- Q10: Easy / Understand / Scenario — correct at 1
-- IRT: b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  7,
  'failure_modes',
  'During a building fire, the electronic door locks on all exit doors automatically unlock to allow evacuation. Which failure mode does this represent?',
  '["Fail-secure", "Fail-safe", "Fail-soft", "Fail-closed"]'::jsonb,
  1,
  'Fail-safe prioritizes human safety above all else. When fire is detected, doors unlock automatically to allow people to evacuate, even though this reduces physical security. Fail-secure (also called fail-closed) maintains security by locking doors or blocking access. Fail-soft (also called fail-open) allows reduced functionality to continue operating.',
  'Fail-SAFE = SAFETY first, people get out. Fail-SECURE = SECURITY first, lock it down. Fail-SOFT = SOFTLY degrade but keep going.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q11: Easy / Apply / First Action — correct at 0
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'chain_of_custody',
  'A security analyst discovers a compromised laptop that may contain evidence of corporate espionage. What should be the FIRST step regarding the evidence?',
  '["Document the current state and preserve the scene without altering the evidence", "Create a forensic image of the hard drive immediately", "Turn off the laptop to prevent further data loss", "Contact law enforcement to take possession of the device"]'::jsonb,
  0,
  'The first step in evidence handling is to secure and document the scene. This means photographing the current state, noting what is on screen, and preventing anyone from altering the evidence. Creating a forensic image comes after documentation. Turning off the laptop could destroy volatile data in RAM. Law enforcement notification is important but comes after initial preservation.',
  'Evidence handling first step: STOP and DOCUMENT. Secure the scene before you touch anything.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q12: Easy / Apply / Scenario — correct at 3
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'logging_monitoring',
  'A company wants to aggregate security logs from firewalls, IDS sensors, servers, and endpoints into a single platform for correlation and alerting. Which technology BEST meets this requirement?',
  '["IPS", "EDR", "DLP", "SIEM"]'::jsonb,
  3,
  'A Security Information and Event Management (SIEM) system is specifically designed to aggregate logs from multiple sources, normalize the data into a standard format, correlate events across systems, and generate alerts. IPS blocks malicious traffic. EDR monitors endpoints specifically. DLP prevents data loss. Only SIEM provides the centralized log aggregation and correlation described.',
  'SIEM = Security Information and Event Management. It''s the central brain that SEES everything from all sources.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q13: Easy / Remember / Best Answer — correct at 2
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  7,
  'drp_testing',
  'Which DRP test type involves stakeholders gathering to discuss and walk through the plan step by step without activating any systems?',
  '["Checklist/read-through test", "Full-interruption test", "Tabletop/walkthrough exercise", "Parallel test"]'::jsonb,
  2,
  'A tabletop or walkthrough exercise brings together key stakeholders to discuss the disaster recovery plan step by step. Participants talk through their roles and responses to a hypothetical scenario without actually activating systems. A checklist/read-through is done individually by the plan author. A parallel test activates recovery systems alongside production. A full-interruption test actually disrupts production.',
  'TABLETOP = Talk Around the TABLE. Everyone sits at a TABLE and TALKS through the plan — no systems touched.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q14: Easy / Understand / First Action — correct at 2
-- IRT: b = -1.5 + 0.0 + 0.3 = -1.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  7,
  'incident_response',
  'According to the incident response lifecycle, what must an organization do BEFORE any incidents occur?',
  '["Conduct forensic analysis of potential threats", "Perform root cause analysis on previous attacks", "Establish an incident response plan and train the response team", "Deploy containment measures across all network segments"]'::jsonb,
  2,
  'Preparation is the first phase of incident response. This includes developing the IR plan, forming and training the incident response team, acquiring necessary tools, and establishing communication procedures. All other options describe activities that happen during or after an incident. You cannot respond effectively without preparation beforehand.',
  'IR starts with PREPARATION. You can''t fight a fire without a fire extinguisher — prepare BEFORE the flames.',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),

-- Q15: Easy / Apply / Most Likely — correct at 3
-- IRT: b = -1.5 + 0.3 + 0.1 = -1.1, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  7,
  'malware_types',
  'An employee opens an email attachment that appears to be a legitimate invoice PDF. Shortly after, unauthorized software is installed on their workstation. Which type of malware MOST LIKELY caused this?',
  '["Worm", "Logic bomb", "Rootkit", "Trojan horse"]'::jsonb,
  3,
  'A Trojan horse disguises itself as legitimate software to trick users into executing it. The scenario describes malware hidden inside what appears to be a normal PDF invoice — classic Trojan behavior. Worms self-propagate without user interaction. Logic bombs activate based on a condition, not user execution. Rootkits hide their presence but typically arrive via another attack vector.',
  'TROJAN = Tricks you into Running it. Like the Trojan Horse from mythology — looks like a gift, hides an army inside.',
  'apply',
  'most_likely',
  'easy',
  1.40, -1.10, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM QUESTIONS (55) — IRT b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: Medium / Understand / Scenario — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  7,
  'forensic_imaging',
  'A forensic examiner creates a bit-for-bit copy of a suspect''s hard drive. After creating the image, the examiner generates an MD5 hash of both the original drive and the forensic copy. The hashes match. What does this verify?',
  '["The forensic copy is an exact duplicate of the original drive and the data has not been altered", "The original drive has never been tampered with by the suspect", "The data on the drive is authentic and admissible in court", "The chain of custody has been properly maintained"]'::jsonb,
  0,
  'Matching hash values between the original drive and the forensic copy verify that the copy is an exact, unaltered duplicate of the original. This ensures data integrity of the forensic image. It does not prove the original was never tampered with, nor does it guarantee admissibility or chain of custody. Hash verification is one component of maintaining evidence integrity.',
  'HASH MATCH = Exact copy confirmed. Same hash = same data, bit for bit.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: Medium / Apply / Scenario — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'containment_strategies',
  'A security operations center detects that an attacker has compromised a web server and is actively exfiltrating customer data. The web server hosts a critical e-commerce application generating $50,000 per hour in revenue. The SOC team needs to decide on a containment strategy. Which approach BEST balances security and business needs?',
  '["Shut down the web server immediately to stop the exfiltration", "Isolate the web server at the network level while redirecting traffic to a backup server", "Allow the attack to continue while monitoring to gather intelligence on the attacker", "Notify customers of the breach before taking any technical action"]'::jsonb,
  1,
  'Network-level isolation stops the exfiltration while redirecting traffic to a backup server maintains business operations. This balances security (stopping the breach) with business continuity (maintaining revenue). Shutting down entirely stops revenue unnecessarily. Allowing continued exfiltration increases liability. Customer notification is required but is not a containment action.',
  NULL,
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q18: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'incident_response',
  'Your organization''s SIEM generates an alert indicating a potential data breach affecting servers containing personally identifiable information (PII). As the incident response lead, what should be your FIRST action?',
  '["Immediately notify all affected customers about the potential breach", "Begin reformatting affected servers to eliminate the threat", "Verify and validate the alert to confirm whether an actual incident has occurred", "Contact law enforcement to report the potential breach"]'::jsonb,
  2,
  'Before taking any major action, the incident response lead must first verify and validate the alert. SIEM alerts can be false positives, and launching a full response without confirmation wastes resources and may cause unnecessary business disruption. Once confirmed as a real incident, the team can proceed to containment, notification, and other response steps in the proper order.',
  'Verify before you mobilize. Don''t pull the fire alarm until you confirm there''s actually smoke.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: Medium / Understand / Best Answer — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'investigation_types',
  'An organization suspects an employee has been embezzling funds over the past year. Which type of investigation is MOST appropriate?',
  '["Criminal investigation led by law enforcement", "Regulatory investigation led by industry body", "Operational investigation led by IT department", "Administrative investigation led by management with HR and legal support"]'::jsonb,
  3,
  'An administrative investigation is an internal organizational investigation into policy violations or misconduct. Suspected embezzlement by an employee starts as an administrative matter handled by management, HR, and legal counsel. If evidence supports criminal activity, the organization may then refer the matter to law enforcement for a criminal investigation, but the initial investigation is administrative.',
  'Internal employee issue = Administrative investigation FIRST. Keep it in-house initially, then escalate if needed.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q20: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'dr_metrics',
  'A financial services company determines that its core banking application can tolerate a maximum of 4 hours of downtime before suffering unacceptable business impact. The IT team estimates system restoration will take 2.5 hours, and data verification will require 1 hour. What is the current risk status regarding MTD?',
  '["The organization is within acceptable limits because RTO (2.5h) + WRT (1h) = 3.5h, which is less than MTD (4h)", "The organization exceeds MTD because the total downtime would be 7.5 hours", "The organization needs to increase its MTD to 6 hours to be safe", "The organization should eliminate WRT to ensure faster recovery"]'::jsonb,
  0,
  'MTD = RTO + WRT. In this scenario, RTO is 2.5 hours and WRT is 1 hour, totaling 3.5 hours. Since 3.5 hours is less than the 4-hour MTD, the organization is within acceptable limits. You cannot simply eliminate WRT because verifying data integrity after restoration is a critical step. MTD is determined by business impact, not adjusted to fit technical capabilities.',
  'MTD = RTO + WRT. Always check: does RTO + WRT fit inside the MTD window? If yes, you''re safe.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q21: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'change_management',
  'A critical vulnerability is discovered in your organization''s primary web application framework. The vendor has released an emergency patch. As the change manager, what should be your FIRST step?',
  '["Deploy the patch immediately to production servers", "Submit an emergency change request and convene the ECAB for expedited review", "Wait for the next scheduled maintenance window to apply the patch", "Roll back the web application to the previous version"]'::jsonb,
  1,
  'Even emergency changes must follow a process. The first step is to submit an emergency change request and convene the Emergency Change Advisory Board (ECAB) for expedited review and approval. This is a streamlined version of the normal change process for urgent situations. Deploying without any review risks breaking production. Waiting for a scheduled window leaves the vulnerability exposed too long.',
  'Emergency changes still need approval — just faster. ECAB = Express CAB for emergencies.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q22: Medium / Understand / Comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'logging_monitoring',
  'What is the PRIMARY difference between an Intrusion Detection System (IDS) and an Intrusion Prevention System (IPS)?',
  '["An IDS uses signatures while an IPS uses anomaly detection", "An IDS monitors internal traffic while an IPS monitors external traffic", "An IDS passively alerts on threats while an IPS actively blocks them", "An IDS is software-based while an IPS is hardware-based"]'::jsonb,
  2,
  'The primary difference is that an IDS is passive — it detects and alerts on suspicious activity but does not take action to stop it. An IPS is active — it can detect, alert, AND automatically block or prevent malicious traffic. Both can use either signature-based or anomaly-based detection methods, and both can be network-based or host-based.',
  'IDS = I Detect Stuff (passive, just watching). IPS = I Prevent Stuff (active, takes action).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q23: Medium / Apply / TLATM — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  7,
  'bia_process',
  'As the CISO, you are reviewing the results of the Business Impact Analysis. The BIA team has identified that the customer relationship management (CRM) system has an MTD of 24 hours, but the current disaster recovery capability provides an RTO of 36 hours. What is the BEST management decision?',
  '["Accept the gap as residual risk since disasters are unlikely", "Reduce the MTD to 48 hours to match current capabilities", "Conduct another BIA to verify the MTD calculation", "Invest in improving recovery capabilities to bring RTO below 24 hours"]'::jsonb,
  3,
  'As a manager, you must ensure RTO never exceeds MTD. If the current RTO (36h) exceeds the MTD (24h), the organization cannot recover in time to avoid unacceptable business impact. The correct management decision is to invest in improving recovery capabilities. You cannot arbitrarily change MTD — it is determined by business impact. Accepting this gap is negligent given the clear risk.',
  'Golden rule: RTO must ALWAYS be less than MTD. If it''s not, fix the RTO — you can''t negotiate with MTD.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q24: Medium / Understand / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'chain_of_custody',
  'What is the BEST description of the purpose of chain of custody documentation?',
  '["To track who handled evidence, when, where, and what actions were taken throughout its lifecycle", "To prove that the evidence is authentic and has not been fabricated", "To ensure law enforcement is immediately notified of all evidence collection", "To guarantee that evidence will be admissible in court proceedings"]'::jsonb,
  0,
  'Chain of custody documentation tracks the complete journey of evidence — who handled it, when they handled it, where it was stored, and what was done with it. While proper chain of custody supports admissibility, it does not guarantee it. Chain of custody focuses on documenting control and integrity of evidence throughout its lifecycle from collection to presentation.',
  'Chain of Custody = the WHO, WHEN, WHERE, and WHAT of evidence handling. It''s the evidence''s travel diary.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q25: Medium / Apply / Scenario — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'backup_strategies',
  'An organization performs a full backup every Sunday night. On Monday through Saturday, they perform backups that copy only files changed since the last full backup without resetting the archive bit. On Thursday, a server failure occurs and data must be restored. How many backup sets are needed?',
  '["Four sets: Sunday full plus Monday, Tuesday, and Wednesday backups", "Two sets: Sunday full plus Wednesday backup", "Five sets: Sunday full plus Monday through Thursday backups", "One set: Wednesday backup only"]'::jsonb,
  1,
  'The scenario describes differential backups (changed since last full, archive bit NOT reset). Because differential backups always capture all changes since the last full backup, each differential contains all previous changes. To restore, you only need the last full backup (Sunday) plus the most recent differential (Wednesday). This is a key advantage of differential over incremental.',
  'Differential restore = Full + Latest Diff (just 2 sets). Incremental restore = Full + ALL incrementals since. Diff is fewer sets to restore.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q26: Medium / Apply / First Action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'forensic_imaging',
  'A forensic analyst receives a hard drive that needs to be examined for evidence of data theft. Before beginning any analysis, what should the analyst do FIRST?',
  '["Connect a write blocker and create a verified forensic image of the drive", "Search the drive for suspicious files and document findings", "Run antivirus software on the drive to detect any malware", "Create a standard file copy of all user documents on the drive"]'::jsonb,
  0,
  'Before any analysis, a forensic analyst must create a forensic image (bit-for-bit copy) using a write blocker to prevent any modifications to the original evidence. All subsequent analysis is performed on the forensic copy, never the original. A standard file copy would miss deleted files, slack space, and other forensic artifacts. Running tools directly on the original could alter evidence.',
  'Forensic rule #1: NEVER touch the original. Write blocker ON, image FIRST, analyze the COPY.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q27: Medium / Apply / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  7,
  'logging_monitoring',
  'A SOC analyst notices that a user account is accessing sensitive files at 3:00 AM, which is outside the employee''s normal working hours. The account is also downloading unusually large volumes of data. Which security technology would MOST LIKELY have detected this anomaly automatically?',
  '["Signature-based IDS", "Data Loss Prevention system", "User and Entity Behavior Analytics (UEBA)", "Network firewall with ACLs"]'::jsonb,
  2,
  'UEBA (User and Entity Behavior Analytics) uses machine learning to establish behavioral baselines for users and entities, then detects deviations from normal patterns. Accessing files at unusual hours and downloading abnormal volumes are exactly the types of behavioral anomalies UEBA is designed to detect. Signature-based IDS looks for known attack patterns. DLP monitors data movement but not behavioral patterns. Firewalls filter traffic based on rules.',
  'UEBA = Understanding Everyone''s Behavior Automatically. It learns what''s normal and flags what''s not.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q28: Medium / Understand / Comparison — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'recovery_sites',
  'What is the KEY difference between a hot site and a warm site?',
  '["A hot site has no equipment while a warm site has partial equipment", "A hot site is closer to the primary facility than a warm site", "A hot site uses cloud resources while a warm site uses physical hardware", "A hot site has all necessary hardware and software ready, while a warm site has only partial equipment that requires additional setup"]'::jsonb,
  3,
  'A hot site is fully equipped with all necessary hardware, software, and network connectivity — it only lacks current data and personnel, enabling recovery in hours. A warm site has some equipment (basic hardware, power, connectivity) but requires additional setup, configuration, and data loading, taking days to become operational. The key distinction is the level of readiness.',
  'HOT = Hardware On and Topped up (ready to go). WARM = We''ll Arrange Resources and Machines (needs setup). COLD = Can Only Lease the Doors (empty shell).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q29: Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'patch_management',
  'A healthcare organization runs a legacy medical device that cannot be patched because the vendor no longer supports it. The device processes patient data and is connected to the network. Which compensating control strategy BEST addresses this vulnerability?',
  '["Immediately replace the device with a newer model regardless of budget", "Disconnect the device from all networks until it can be replaced", "Segment the device onto an isolated network with strict access controls and enhanced monitoring", "Accept the risk since the device still functions correctly"]'::jsonb,
  2,
  'When patching is not possible, network segmentation with strict access controls and enhanced monitoring provides defense-in-depth as a compensating control. This limits exposure while maintaining the device''s functionality. Immediate replacement may not be feasible due to budget or availability. Complete disconnection disrupts patient care. Simply accepting the risk without mitigation is negligent.',
  'Can''t patch? ISOLATE and MONITOR. Build a security fence around what you can''t fix.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q30: Medium / Analyze / TLATM — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  7,
  'incident_response',
  'As the CISO, you receive a report that the incident response team successfully contained a phishing attack that compromised three executive accounts. The IT team has already reset passwords and reimaged affected workstations. What is the MOST important management action at this point?',
  '["Immediately terminate the employees who clicked on the phishing emails", "Conduct a lessons learned review to identify process improvements and prevent recurrence", "Purchase new anti-phishing software to replace the current solution", "Issue a press release about the organization''s successful incident response"]'::jsonb,
  1,
  'After containment and recovery, the most important step is the lessons learned review (post-incident activity). As a manager, you need to understand what failed, what worked, and how to improve detection and prevention. Terminating employees who fell for phishing is counterproductive and punitive. Buying new software without understanding the root cause may not solve the problem. A press release is premature and potentially unnecessary.',
  'After every incident: LEARN. Lessons learned is the final and arguably most valuable phase of IR.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q31: Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'restoration_order',
  'After a disaster, an organization activates its hot site. When the primary facility is later repaired and ready for use, the team must move operations back. In what order should systems be restored to the primary site?',
  '["Most critical systems first to minimize time at the hot site", "All systems simultaneously to minimize the transition period", "Systems in the same order they were brought up at the hot site", "Least critical systems first to verify primary site stability before moving critical operations"]'::jsonb,
  3,
  'When moving BACK to the primary site from a DR site, the restoration order is reversed: least critical systems first. This approach verifies that the primary site is stable and functioning correctly before risking critical systems. If something goes wrong, the most critical systems remain safely at the hot site. Moving TO the DR site uses most critical first; moving BACK uses least critical first.',
  'Going TO DR = most critical FIRST (save the important stuff). Going BACK = least critical FIRST (test the waters safely).',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q32: Medium / Apply / First Action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'incident_response',
  'During a security incident, an analyst discovers that an attacker has installed a rootkit on a critical database server. What should be the FIRST priority before beginning remediation?',
  '["Create a forensic image of the compromised server to preserve evidence", "Immediately reformat the server to remove the rootkit", "Disconnect the server from the network and restore from the most recent backup", "Scan all other servers on the network for similar rootkits"]'::jsonb,
  0,
  'Before any remediation action, evidence must be preserved through forensic imaging. Creating a forensic image captures the current state of the compromised system, including the rootkit and any artifacts the attacker left behind. This evidence is crucial for understanding the attack, identifying the entry point, and potentially for legal proceedings. Reformatting or restoring would destroy this evidence.',
  'Before you CLEAN, you must CAPTURE. Forensic image first, remediation second.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q33: Medium / Understand / Best Answer — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'bia_process',
  'What is the BEST description of the primary purpose of a Business Impact Analysis (BIA)?',
  '["To identify all potential threats and their likelihood of occurrence", "To determine the criticality of business functions and establish time-based recovery requirements", "To calculate the annual loss expectancy for each identified risk", "To create a prioritized list of security controls to implement"]'::jsonb,
  1,
  'The BIA determines the criticality of business functions, processes, and systems, and establishes time-based recovery requirements including MTD, RTO, RPO, and WRT. It answers the question: how long can each function be unavailable before unacceptable impact occurs? Threat identification is part of risk assessment. ALE calculation is quantitative risk analysis. Control prioritization comes after the BIA.',
  'BIA answers: WHAT is critical and HOW FAST must we recover it? It sets the recovery clock.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q34: Medium / Apply / Except Not — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + (-0.1) = 1.2, c = 0.25
(
  7,
  'change_management',
  'All of the following are standard steps in the change management process EXCEPT:',
  '["Submitting a change request through a ticketing system", "Testing the change in a non-production environment", "Deploying the change without a rollback plan to save time", "Obtaining approval from the Change Advisory Board"]'::jsonb,
  2,
  'Deploying changes without a rollback plan is NOT part of proper change management — in fact, having a rollback/backout plan is a critical requirement. The standard change management process includes: submit request, assess impact, obtain approval (CAB), build and test, notify stakeholders, implement with rollback plan, validate, and update documentation.',
  'Change management steps: REQUEST, ASSESS, APPROVE, TEST, NOTIFY, IMPLEMENT (with rollback!), VALIDATE, DOCUMENT.',
  'apply',
  'except_not',
  'medium',
  1.20, 0.50, 0.25,
  'ai_generated', true
),

-- Q35: Medium / Understand / Most Likely — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'malware_types',
  'A disgruntled database administrator writes code that will automatically delete all production databases if their employee account is ever disabled. Which type of malware is this MOST LIKELY classified as?',
  '["Ransomware", "Worm", "Trojan horse", "Logic bomb"]'::jsonb,
  3,
  'A logic bomb is malicious code that executes when a specific logical condition is met. In this case, the triggering condition is the employee''s account being disabled. Logic bombs are commonly associated with insider threats, particularly disgruntled employees who plant time-delayed or condition-triggered destructive code. It is not ransomware (no demand for payment), not a worm (no self-propagation), and not a Trojan (not disguised as legitimate software).',
  'LOGIC BOMB = Lurks until a LOGICAL condition triggers it. IF account disabled THEN kaboom.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q36: Medium / Analyze / Scenario — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'containment_strategies',
  'During a network intrusion, your incident response team identifies that the attacker has compromised a DMZ web server and is using it as a pivot point to probe internal systems. The web server hosts a public-facing customer portal. Analysis shows no internal systems have been compromised yet. Which containment approach is MOST appropriate?',
  '["Shut down the entire DMZ to prevent any further probing", "Allow the attacker to continue while gathering intelligence for law enforcement", "Block the pivot traffic from the DMZ to internal networks while keeping the customer portal accessible through an alternate path", "Immediately notify all customers that their data may have been compromised"]'::jsonb,
  2,
  'The best containment approach addresses the specific attack vector (pivot traffic from DMZ to internal) while maintaining business services (customer portal). Blocking pivot traffic stops lateral movement without shutting down customer-facing services entirely. Shutting down the DMZ disrupts business. Allowing continued probing risks internal compromise. Customer notification should follow investigation, not precede containment.',
  NULL,
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q37: Medium / Apply / Calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  7,
  'raid_levels',
  'An organization implements RAID 5 using five 2TB hard drives. What is the total usable storage capacity?',
  '["10 TB", "8 TB", "6 TB", "4 TB"]'::jsonb,
  1,
  'RAID 5 uses one drive''s worth of capacity for distributed parity across all drives. With 5 drives of 2TB each, the formula is (N-1) x drive size = (5-1) x 2TB = 8TB usable capacity. One drive''s worth of space (2TB) is consumed by parity data distributed across all drives. Total raw capacity is 10TB, but usable is 8TB.',
  'RAID 5 usable = (N-1) x drive size. You lose ONE drive''s worth to parity. 5 drives minus 1 = 4 drives worth of usable space.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q38: Medium / Apply / TLATM — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  7,
  'drp_testing',
  'As a security manager, you want to test your organization''s disaster recovery plan for the first time. The CEO is concerned about any risk to production systems. Which test type should you recommend?',
  '["A tabletop exercise where stakeholders walk through the plan and discuss their roles without activating any systems", "A full-interruption test to get the most realistic results possible", "A parallel test that brings up the recovery site alongside production", "A simulation test that intentionally disrupts one production system"]'::jsonb,
  0,
  'For an organization testing its DRP for the first time, a tabletop/walkthrough exercise is the safest choice. It involves no risk to production systems — stakeholders simply discuss the plan and their roles around a table. Full-interruption tests are the riskiest and should only be attempted after all other test types succeed. Parallel tests and simulations involve more complexity. Think like a manager: start safe, build confidence.',
  'DRP testing order: Read, Walk, Simulate, Parallel, Full. Start with the safest test first and work your way up.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q39: Medium / Analyze / First Action — correct at 3
-- IRT: b = 0.0 + 0.6 + 0.3 = 0.9, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'Your organization''s monitoring systems detect unusual outbound traffic from several workstations to an external IP address known to be associated with a command-and-control server. The affected workstations belong to employees in the finance department. What should be the FIRST action?',
  '["Notify the finance department employees that their workstations are compromised", "Immediately disconnect all finance department workstations from the network", "Report the incident to law enforcement as a potential cyberattack", "Isolate the affected workstations specifically identified in the alert while preserving their current state for forensic analysis"]'::jsonb,
  3,
  'The first action should be targeted containment — isolating only the specific workstations identified in the alert, not the entire department. This stops the C2 communication while preserving evidence on the compromised machines. Notifying users first could alert the attacker. Disconnecting all finance workstations is too broad and disrupts uninvolved employees. Law enforcement notification comes after initial containment.',
  'Contain PRECISELY — isolate the confirmed compromised systems, not everything in sight. Surgical, not scorched earth.',
  'analyze',
  'first_action',
  'medium',
  1.70, 0.90, 0.20,
  'ai_generated', true
),

-- Q40: Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  7,
  'logging_monitoring',
  'An organization wants to proactively search for advanced persistent threats (APTs) that may have evaded existing security controls. Which activity BEST describes this approach?',
  '["Vulnerability scanning", "Penetration testing", "Threat hunting", "Security auditing"]'::jsonb,
  2,
  'Threat hunting is the proactive, human-driven process of searching for APTs and sophisticated threats that have evaded automated detection. Unlike vulnerability scanning (finding known weaknesses) or penetration testing (simulating attacks), threat hunting assumes a breach may have already occurred and actively looks for indicators of compromise using hypothesis-driven analysis.',
  'Threat HUNTING = you go LOOKING for the threat. You''re the hunter, not waiting for the alarm to ring.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q41: Medium / Understand / Scenario — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  7,
  'evidence_types',
  'During a forensic investigation, an analyst recovers deleted emails from a suspect''s computer showing discussions about stealing trade secrets. These emails directly establish the suspect''s involvement without requiring any inference. What type of evidence do these emails represent?',
  '["Direct evidence because they directly prove the suspect''s involvement without need for inference", "Circumstantial evidence because they were recovered from a digital device", "Hearsay evidence because the analyst did not personally witness the emails being written", "Corroborative evidence because they support other evidence in the case"]'::jsonb,
  0,
  'Direct evidence speaks for itself and requires no inference or interpretation to establish a fact. Emails explicitly discussing theft of trade secrets directly prove involvement. Circumstantial evidence would only suggest involvement through inference. The emails are not hearsay because they are the suspect''s own statements (business records exception). Corroborative evidence merely supports other evidence.',
  'DIRECT = Directly proves the point, no thinking required. If it SHOWS the crime, it''s direct.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q42: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'containment_strategies',
  'A security team discovers that a malware infection has spread from a workstation to a file server containing sensitive intellectual property. The malware appears to be actively encrypting files on the file server. What should be the FIRST containment action?',
  '["Restore the file server from the most recent backup", "Disconnect the file server from the network to stop the encryption and prevent further spread", "Run anti-malware software on the file server to remove the infection", "Shut down all workstations on the same network segment"]'::jsonb,
  1,
  'With active encryption in progress, the most urgent action is to disconnect the file server from the network immediately. This stops the malware from continuing to encrypt files and prevents it from spreading to other systems. Restoring from backup is a recovery step that comes later. Running anti-malware takes time and the encryption continues during the scan. Shutting down all workstations is too broad.',
  'Active attack = STOP THE BLEEDING FIRST. Disconnect to halt the damage, then investigate and recover.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q43: Medium / Understand / Comparison — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'wrt_mtd',
  'What is the KEY difference between RTO and RPO?',
  '["RTO measures data loss while RPO measures system downtime", "RTO applies to hardware while RPO applies to software", "RTO is set by IT while RPO is set by management", "RTO measures time to restore systems while RPO measures maximum acceptable data loss in time"]'::jsonb,
  3,
  'RTO (Recovery Time Objective) measures the maximum acceptable time to restore systems to a defined service level after a disruption. RPO (Recovery Point Objective) measures the maximum acceptable amount of data loss, expressed as a time period (e.g., RPO of 4 hours means you can lose up to 4 hours of data). RTO focuses on system availability; RPO focuses on data currency.',
  'RTO = Recovery TIME Objective (how long to get back up). RPO = Recovery POINT Objective (how much data can you lose, measured as the point in time you recover TO).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q44: Medium / Analyze / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.0 = 0.6, a = 1.5 + 0.0 = 1.5, c = 0.20
(
  7,
  'logging_monitoring',
  'A SIEM is generating a high volume of alerts, many of which are false positives. The SOC team is overwhelmed and critical alerts are being missed. What is the BEST approach to address this issue?',
  '["Tune the SIEM correlation rules and thresholds to reduce false positives while maintaining detection of genuine threats", "Disable alerting for lower-severity events to reduce the overall alert volume", "Hire additional SOC analysts to handle the increased alert volume", "Replace the SIEM with a different vendor''s product"]'::jsonb,
  0,
  'SIEM tuning is an ongoing operational requirement. Adjusting correlation rules, thresholds, and filters reduces false positives while maintaining effective detection. Disabling lower-severity alerts creates blind spots. Hiring more staff treats the symptom, not the cause. Replacing the SIEM entirely is expensive and the new system would need the same tuning process.',
  'SIEM requires constant TUNING. Too many false positives? Adjust the rules, don''t throw out the tool.',
  'analyze',
  'best_answer',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q45: Medium / Apply / TLATM — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'As a security manager, the CEO asks why the incident response team did not launch a counterattack against the hackers who breached your network last month. What is the BEST response?',
  '["The team lacked the technical skills to perform a counterattack", "Counterattacks are only effective against nation-state attackers", "Counterattacks are legally prohibited and could result in criminal liability for our organization", "The team was too focused on containment to consider offensive action"]'::jsonb,
  2,
  'Organizations must never launch counterattacks (hack back) against attackers. This is a fundamental principle of incident response. Counterattacks can violate computer crime laws, potentially harm innocent third parties whose systems are being used as intermediaries, and expose the organization to criminal and civil liability. The correct approach is to work with law enforcement.',
  'NEVER hack back. No counterattack, ever. Work with law enforcement instead — let the authorities handle offense.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q46: Medium / Understand / Except Not — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  7,
  'incident_response',
  'All of the following are roles typically found on an incident response team EXCEPT:',
  '["Legal counsel", "External auditor as team lead", "Human resources representative", "Public relations spokesperson"]'::jsonb,
  1,
  'An incident response team typically includes representatives from information security, IT, management, legal, HR, and public relations/communications. While external auditors may review the IR process, they do not serve as team leads — the IR team is led by internal security or management personnel. External parties may assist but the team composition is primarily internal stakeholders.',
  'IR Team = Security + IT + Management + Legal + HR + PR. All internal stakeholders with a role in the response.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q47: Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'backup_strategies',
  'An organization performs a full backup every Sunday. Monday through Saturday, they perform incremental backups. A critical server fails on Friday afternoon. To restore the server completely, which backup sets are required?',
  '["Sunday full backup only", "Sunday full backup plus Friday incremental only", "Sunday full backup plus Thursday and Friday incrementals only", "Sunday full backup plus Monday, Tuesday, Wednesday, Thursday, and Friday incrementals"]'::jsonb,
  3,
  'Incremental backups only capture changes since the LAST backup (full or incremental) and reset the archive bit. Therefore, each incremental contains only that day''s changes. To restore completely, you need the full backup plus every incremental in sequence: Sunday full + Monday + Tuesday + Wednesday + Thursday + Friday incrementals. This is the tradeoff — incrementals are fast to create but slow to restore.',
  'Incremental restore = Full + EVERY single incremental in order. Miss one link and the chain breaks.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q48: Medium / Apply / First Action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'patch_management',
  'A vulnerability scanner identifies that 200 servers across the organization are missing a critical security patch that addresses a known exploited vulnerability. What should be the FIRST step in the remediation process?',
  '["Evaluate the patch in a test environment to verify it does not break existing applications", "Deploy the patch immediately to all 200 servers simultaneously", "Submit a change request and wait for the next CAB meeting for approval", "Disable the affected service on all servers until the patch is applied"]'::jsonb,
  0,
  'Even for critical patches, the first step is to evaluate and test in a non-production environment. This verifies the patch does not cause compatibility issues or break existing applications. After testing, submit an emergency change request for expedited approval. Deploying untested patches to 200 servers risks mass outage. Waiting for the next regular CAB meeting delays response to a critical vulnerability.',
  'Patch process: EVALUATE, TEST, APPROVE, DEPLOY, VERIFY. Always test first, even when urgent.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q49: Medium / Understand / Best Answer — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'logging_monitoring',
  'What is the BEST description of Security Orchestration, Automation, and Response (SOAR)?',
  '["A type of SIEM that provides enhanced log correlation capabilities", "A platform that integrates security tools and automates incident response workflows to improve SOC efficiency", "A cloud-based security monitoring service provided by a managed security service provider", "An advanced firewall technology that uses AI to block sophisticated attacks"]'::jsonb,
  1,
  'SOAR integrates disparate security tools into a unified platform and automates incident response workflows through playbooks. Its three focus areas are threat and vulnerability management, incident response, and security operations automation. SOAR works alongside SIEM but is distinct — SIEM collects and correlates data, while SOAR orchestrates the response actions.',
  'SOAR = the conductor of the security orchestra. It makes all the tools play together automatically.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q50: Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'recovery_sites',
  'A mid-size company needs a disaster recovery site for their financial trading platform. The platform processes real-time transactions and cannot afford more than 1 hour of downtime. Budget constraints prevent maintaining a fully staffed duplicate facility. Which recovery site type is MOST appropriate?',
  '["Cold site with pre-positioned equipment shipping agreements", "Warm site with weekly data synchronization", "Hot site with real-time data replication", "Reciprocal agreement with a competitor"]'::jsonb,
  2,
  'A hot site with real-time data replication can achieve recovery within hours, meeting the 1-hour RTO requirement. It is fully equipped with hardware, software, and connectivity, and real-time replication ensures minimal data loss. A cold site takes weeks. A warm site takes days. Reciprocal agreements are unreliable for critical real-time systems. The hot site costs less than a mirror site while meeting the requirement.',
  'RTO under a few hours = HOT SITE. Real-time replication keeps data fresh. It''s the sweet spot between mirror and warm.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q51: Medium / Remember / Comparison — correct at 0
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  7,
  'failure_modes',
  'What is the PRIMARY difference between fail-secure and fail-safe modes?',
  '["Fail-secure prioritizes maintaining security controls, while fail-safe prioritizes human safety", "Fail-secure allows traffic through, while fail-safe blocks all traffic", "Fail-secure is used for software, while fail-safe is used for hardware", "Fail-secure is cheaper to implement than fail-safe"]'::jsonb,
  0,
  'Fail-secure (also called fail-closed) prioritizes maintaining security even during a failure — for example, a firewall that blocks all traffic when it fails. Fail-safe prioritizes human safety — for example, doors that unlock during a fire to allow evacuation. The distinction is critical: security vs. safety. Both reduce functionality but protect different values.',
  'Fail-SECURE = SECURITY wins. Fail-SAFE = SAFETY wins. What do you protect when things break?',
  'remember',
  'comparison',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q52: Medium / Analyze / Most Likely — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'logging_monitoring',
  'An IDS configured with anomaly-based detection begins generating a large number of alerts after the organization deploys a new cloud-based collaboration platform. Analysts confirm the alerts are false positives caused by the new application''s network traffic patterns. What is the MOST LIKELY root cause?',
  '["The IDS signature database needs to be updated with new attack signatures", "The IDS behavioral baseline does not include the new application''s normal traffic patterns", "The new collaboration platform contains malware that is triggering the alerts", "The IDS hardware is insufficient to handle the increased network traffic"]'::jsonb,
  1,
  'Anomaly-based IDS works by comparing current behavior against an established baseline of normal activity. When a new application is deployed, its traffic patterns are unknown to the baseline and appear anomalous, triggering false positives. The solution is to update the baseline to include the new application''s normal traffic patterns. Signature updates address signature-based detection, not anomaly-based.',
  'Anomaly IDS = baseline comparison. New app = new patterns = false positives until baseline updated.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q53: Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'chain_of_custody',
  'A forensic analyst creates a bit-for-bit image of a hard drive from a terminated employee''s workstation. After imaging, the analyst places the original drive in a sealed evidence bag, labels it with the date, case number, and her name, and stores it in a locked evidence room. She then begins analysis on the forensic copy. Which principle is she PRIMARILY following?',
  '["Separation of duties", "Least privilege", "Need-to-know", "Chain of custody"]'::jsonb,
  3,
  'The analyst is following chain of custody procedures by documenting who handled the evidence (her name), when (date), what case it belongs to (case number), and securing it properly (sealed bag, locked room). Working from the forensic copy rather than the original preserves the integrity of the original evidence. Chain of custody ensures evidence reliability throughout its lifecycle.',
  'Chain of custody = Document WHO, WHEN, WHERE, WHAT for every piece of evidence. Seal it, label it, lock it, log it.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q54: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'incident_response',
  'A security analyst notices that a production database server is actively being accessed by an unauthorized external IP address. Log analysis shows the attacker has been exfiltrating records for the past 30 minutes. What should the analyst do FIRST?',
  '["Begin a full forensic analysis of the database server", "Notify the database administrator to change all passwords", "Contain the breach by blocking the attacker''s IP and isolating the affected server", "File an incident report with the regulatory authority"]'::jsonb,
  2,
  'With an active, ongoing exfiltration, the immediate priority is containment — stopping the data loss. Blocking the attacker''s IP address and isolating the server prevents further exfiltration. Forensic analysis is important but the active breach must be stopped first. Changing passwords is a remediation step. Regulatory notification is required but is not the first action during an active incident.',
  'Active breach = CONTAIN FIRST. Stop the bleeding, then diagnose the wound.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q55: Medium / Understand / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  7,
  'drp_testing',
  'Which type of DRP test activates recovery systems at the alternate site while production systems continue to run, ensuring no disruption to business operations?',
  '["Parallel test", "Full-interruption test", "Tabletop exercise", "Simulation test"]'::jsonb,
  0,
  'A parallel test activates the disaster recovery plan at the alternate recovery site, bringing systems online in parallel with the production environment. Production systems are not affected, making it a safe way to validate that recovery procedures actually work. A full-interruption test disrupts production. A tabletop is discussion-only. A simulation walks through a scenario but stops short of actually activating systems.',
  'PARALLEL = production keeps running PARALLEL to the DR test. Both run side by side — safe testing.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q56: Medium / Apply / Most Likely — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  7,
  'malware_types',
  'Security scans on a compromised server reveal that all system tools (ls, ps, netstat) have been replaced with modified versions that hide certain processes and network connections from administrators. What type of malware is MOST LIKELY installed?',
  '["Polymorphic virus", "Rootkit", "Ransomware", "Macro virus"]'::jsonb,
  1,
  'Rootkits replace legitimate system tools and utilities with modified versions that hide the attacker''s presence. By replacing commands like ls, ps, and netstat, the rootkit ensures administrators cannot see the attacker''s processes, files, or connections. Rootkits are the hardest malware to detect because they subvert the very tools used for detection. They provide persistent privileged access.',
  'ROOTKIT = hides at the ROOT level. It replaces your eyes (system tools) so you can''t see the intruder.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q57: Medium / Analyze / Scenario — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'During the post-incident review of a ransomware attack, the team discovers the following: the initial infection vector was a phishing email, the malware spread laterally using unpatched SMB vulnerabilities, the backup system was on the same network segment as production, and the IR team had no playbook for ransomware. Which finding represents the MOST significant gap in the organization''s security posture?',
  '["The phishing email bypassed email security controls", "The SMB vulnerabilities were not patched in a timely manner", "The backup system was not segmented from the production network, allowing the ransomware to encrypt backups", "The IR team lacked a ransomware-specific playbook"]'::jsonb,
  2,
  'While all findings are significant, the backup system being on the same network as production is the most critical gap. Backups are the primary recovery mechanism for ransomware — if the attacker can encrypt backups along with production data, the organization loses its ability to recover without paying the ransom. Network segmentation of backups is a fundamental protection against ransomware.',
  NULL,
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q58: Medium / Understand / Comparison — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'investigation_types',
  'What is the KEY difference between a criminal investigation and a civil investigation?',
  '["Criminal investigations are conducted by internal auditors while civil investigations use law enforcement", "Criminal investigations focus on policy violations while civil investigations focus on regulatory compliance", "Criminal investigations require less evidence than civil investigations", "Criminal investigations require proof beyond reasonable doubt while civil investigations require preponderance of evidence"]'::jsonb,
  3,
  'The fundamental difference is the standard of proof. Criminal investigations require proof beyond reasonable doubt (the highest standard) and can result in imprisonment and fines. Civil investigations require preponderance of evidence (more likely than not, greater than 50%) and result in monetary damages. Criminal cases are prosecuted by the state; civil cases are disputes between parties.',
  'Criminal = Beyond Reasonable Doubt (very high bar). Civil = Preponderance (51% likely). Criminal puts you in jail; civil takes your money.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q59: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'logging_monitoring',
  'An organization deploys a darknet — an unused IP address space on their internal network with no legitimate servers or services. The security team receives an alert that traffic has been detected originating from within the network and directed at the darknet addresses. What does this indicate?',
  '["A system on the internal network is likely compromised and performing reconnaissance or lateral movement", "The darknet configuration is incorrect and needs to be recalibrated", "External attackers have bypassed the firewall and are scanning the network", "The alert is a false positive caused by routine network broadcasts"]'::jsonb,
  0,
  'Any traffic directed at a darknet is suspicious by definition because there are no legitimate hosts or services in that address space. Traffic originating internally and targeting the darknet strongly indicates an internal system is compromised and conducting reconnaissance or lateral movement. This is a key advantage of darknets — any traffic hitting them is automatically suspicious, reducing false positives.',
  'DARKNET = Dark means nothing should be there. Any traffic to the dark = something is wrong. Zero false positives by design.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q60: Medium / Apply / Calculation — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  7,
  'wrt_mtd',
  'An organization''s BIA determines that a critical application has an MTD of 8 hours. The IT team estimates that system restoration will take 5 hours (RTO) and data verification will take 2 hours (WRT). What is the remaining buffer time, and is the current recovery capability acceptable?',
  '["3 hours buffer, acceptable", "0 hours buffer, acceptable", "1 hour buffer, acceptable", "The recovery capability is not acceptable because RTO + WRT exceeds MTD"]'::jsonb,
  2,
  'MTD = RTO + WRT. In this case: RTO (5h) + WRT (2h) = 7 hours total recovery time. MTD is 8 hours. The buffer is 8 - 7 = 1 hour. Since the total recovery time (7h) is less than MTD (8h), the recovery capability is acceptable, though with only a 1-hour buffer, the organization may want to consider improving either RTO or WRT for additional margin.',
  'MTD = RTO + WRT. Calculate: 5 + 2 = 7 < 8. One hour to spare. Acceptable but tight.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q61: Medium / Analyze / TLATM — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  7,
  'bia_process',
  'As the CISO, the CFO asks you to justify the cost of maintaining a hot site when the organization has never experienced a disaster. What is the BEST management justification?',
  '["Hot sites are required by law for all organizations", "The BIA determined that critical systems have RTOs that can only be met with hot site capabilities, and the cost of extended downtime exceeds the annual hot site cost", "Competitors use hot sites so we need one to maintain market position", "The IT team prefers hot sites for their technical capabilities"]'::jsonb,
  1,
  'Think like a manager: justify costs with business impact data. The BIA quantifies the financial impact of downtime for critical systems and establishes RTOs. If the RTO can only be met with a hot site, and the cost of exceeding MTD (lost revenue, regulatory fines, reputation damage) exceeds the hot site cost, the investment is justified. This is a risk-based business decision, not a technical preference.',
  'Justify with BUSINESS IMPACT. The BIA is your evidence — show the cost of downtime vs. cost of the hot site.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q62: Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'logging_monitoring',
  'A financial institution''s security team notices that its egress monitoring system has flagged large volumes of encrypted data leaving the network to an external IP address during off-hours. The traffic originates from a server in the human resources department. What does this activity MOST likely indicate?',
  '["Normal backup operations replicating data to a cloud storage provider", "Scheduled software updates being downloaded from vendor servers", "Routine data synchronization with a partner organization", "Potential data exfiltration that requires immediate investigation"]'::jsonb,
  3,
  'Large volumes of encrypted data leaving the network during off-hours from an HR server (which contains sensitive PII) to an unknown external IP is a strong indicator of data exfiltration. Egress monitoring is specifically designed to detect this pattern. While legitimate explanations are possible, the combination of off-hours timing, volume, encryption, and sensitive data source warrants immediate investigation as a potential breach.',
  'Egress monitoring red flags: unusual VOLUME + unusual TIME + unusual DESTINATION + sensitive SOURCE = investigate immediately.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q63: Medium / Understand / Most Likely — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  7,
  'change_management',
  'An organization implements a change but does not update the configuration documentation or create a new baseline. What problem is this MOST LIKELY to cause?',
  '["Configuration drift where the documented state no longer matches the actual system state", "Immediate system failure due to the undocumented change", "Regulatory fines for non-compliance with change management standards", "Automatic rollback of the change by the configuration management system"]'::jsonb,
  0,
  'When changes are implemented without updating documentation and baselines, configuration drift occurs — the documented state diverges from the actual system state. Over time, this makes troubleshooting difficult, security auditing unreliable, and disaster recovery uncertain because the recovery documentation no longer reflects reality. This is why the final step of change management is updating documentation and baselines.',
  'No documentation update = configuration DRIFT. Your map no longer matches the territory.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q64: Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  7,
  'incident_response',
  'After containing and eradicating a security incident, the recovery team restores affected systems from clean backups. Before returning the systems to production, what is the BEST next step?',
  '["Immediately put the systems back into production to minimize downtime", "Notify all customers that the breach has been resolved", "Verify the integrity and security configuration of restored systems before returning them to production", "Delete all log files from the incident to prevent confusion with future monitoring"]'::jsonb,
  2,
  'After restoration, the Work Recovery Time (WRT) phase requires verifying system integrity, confirming security configurations match the baseline, validating data integrity, and ensuring no remnants of the compromise remain before returning systems to production. This verification step is critical — putting unverified systems back into production risks reintroducing the compromise or operating on corrupted data.',
  'After restore, VERIFY before going live. WRT = the quality check after recovery. Don''t skip it.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q65: Medium / Remember / Best Answer — correct at 1
-- IRT: b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  7,
  'bia_process',
  'In business continuity planning, what is ALWAYS the top priority?',
  '["Protecting critical data and intellectual property", "Safety of people", "Maintaining revenue-generating operations", "Preserving the organization''s reputation"]'::jsonb,
  1,
  'The three goals of business continuity management in priority order are: (1) safety of people, (2) minimization of damage, and (3) survival of the business. Human safety is ALWAYS the top priority, above all other concerns including data protection, revenue, and reputation. This principle applies to all disaster and emergency response scenarios.',
  'BCM Priority #1: PEOPLE. Always. No system, no data, no profit is worth a human life.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q66: Medium / Understand / Scenario — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  7,
  'backup_strategies',
  'An organization follows the 3-2-1 backup rule for its critical data. Which implementation correctly follows this rule?',
  '["Three copies of data on the same NAS device using three different folders", "Two copies of data stored on two different cloud providers", "Three copies of data stored on two different media types with one copy at an offsite location", "One full backup stored in three separate locations"]'::jsonb,
  2,
  'The 3-2-1 rule specifies: 3 copies of data (original + 2 backups), stored on 2 different media types (e.g., hard drive + tape, or local disk + cloud), with 1 copy stored offsite. This protects against single device failure (multiple copies), media-specific failures (different types), and site-level disasters (offsite copy).',
  '3-2-1 = 3 copies, 2 media types, 1 offsite. Three, Two, One — like a countdown to data protection.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q67: Medium / Apply / Except Not — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + (-0.1) = 1.2, c = 0.25
(
  7,
  'incident_response',
  'All of the following are valid methods for detecting security incidents EXCEPT:',
  '["Intrusion detection system alerts", "End user reports of suspicious activity", "SIEM correlation rule triggers", "Performing annual penetration tests"]'::jsonb,
  3,
  'IDS alerts, end user reports, and SIEM correlation rules are all real-time or near-real-time methods for detecting security incidents as they occur. Annual penetration tests are a proactive security assessment activity, not a detection method for actual incidents. Penetration tests simulate attacks to find vulnerabilities but are scheduled assessments, not incident detection mechanisms.',
  'Incident DETECTION = real-time awareness. IDS, SIEM, user reports, DLP — all watch for incidents as they happen.',
  'apply',
  'except_not',
  'medium',
  1.20, 0.50, 0.25,
  'ai_generated', true
),

-- Q68: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'forensic_imaging',
  'During a forensic investigation, an analyst needs to examine a suspect''s running laptop. The laptop has encrypted volumes and active network connections. Before powering down the system, what critical evidence should the analyst capture FIRST?',
  '["Volatile data including RAM contents, running processes, network connections, and logged-in users", "A list of all installed software applications", "The browser bookmarks and saved passwords", "The desktop wallpaper and screen resolution settings"]'::jsonb,
  0,
  'Volatile data exists only in memory and will be lost when the system is powered off. This includes RAM contents (which may contain encryption keys for mounted encrypted volumes), running processes, active network connections, logged-in users, and clipboard contents. This follows the order of volatility — capture the most volatile data first. Non-volatile data on disk can be imaged later.',
  'Volatile = Vanishes when power goes off. Capture RAM FIRST — it holds encryption keys, running processes, and active connections. Follow order of volatility.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q69: Medium / Apply / TLATM — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  7,
  'patch_management',
  'As a security manager, you learn that a zero-day vulnerability affecting your organization''s web servers has been publicly disclosed but no vendor patch is available yet. What is the BEST management decision?',
  '["Wait for the vendor to release a patch before taking any action", "Implement compensating controls such as WAF rules, network segmentation, and enhanced monitoring while awaiting the patch", "Shut down all affected web servers until the patch is available", "Assign the development team to create a custom patch internally"]'::jsonb,
  1,
  'When no patch exists for a zero-day, a manager should implement compensating controls to reduce risk while awaiting the vendor patch. This includes WAF rules to filter attack patterns, network segmentation to limit exposure, and enhanced monitoring to detect exploitation attempts. Waiting without action is negligent. Shutting down servers disrupts business unnecessarily. Custom patches risk introducing new issues.',
  'No patch available? COMPENSATE. Layer defenses to buy time until the fix arrives.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q70: Medium / Analyze / Scenario — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'An organization experiences a security breach that affects customer payment card data. The incident response team has contained the breach and is planning the reporting phase. The organization is subject to PCI DSS requirements. Which stakeholder notification sequence is MOST appropriate?',
  '["Notify customers first, then the payment card brands, then law enforcement", "Notify law enforcement first, then the media, then customers", "Notify internal management and legal first, then the payment card brands and acquiring bank, then affected customers as required by law", "Notify the media first to demonstrate transparency, then customers and regulators"]'::jsonb,
  2,
  'The proper notification sequence starts with internal stakeholders (management and legal counsel) to coordinate the response and ensure compliance. Next, notify the payment card brands and acquiring bank as required by PCI DSS. Then notify affected customers as required by breach notification laws. Media communication should be handled by a designated spokesperson only after internal coordination.',
  'Notification order: INTERNAL first (management, legal), then REGULATORS/CARD BRANDS, then CUSTOMERS, then PUBLIC. Inside out.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD QUESTIONS (20) — IRT b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: Hard / Apply / Scenario — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'dr_metrics',
  'A global bank operates a core transaction processing system with an MTD of 2 hours. The current disaster recovery solution provides an RTO of 1 hour using hot site failover and an RPO of 15 minutes using synchronous replication. A recent BIA update reveals that the compliance team now requires 45 minutes to verify regulatory data integrity after restoration. What impact does this have on the recovery strategy?',
  '["No impact because the RTO is still within the MTD", "The RPO needs to be reduced to compensate for the longer verification time", "The MTD should be increased to accommodate the new requirement", "The RTO must be reduced because RTO (1h) + WRT (45min) = 1h 45min approaches the 2h MTD with minimal buffer"]'::jsonb,
  3,
  'MTD = RTO + WRT. With the new WRT of 45 minutes: RTO (60 min) + WRT (45 min) = 105 minutes out of a 120-minute MTD. This leaves only a 15-minute buffer, which is dangerously thin for a critical banking system. The organization should either reduce RTO or find ways to streamline the verification process. MTD is determined by business impact and cannot be arbitrarily changed.',
  'MTD = RTO + WRT. When WRT increases, RTO must decrease to stay within MTD. The clock doesn''t stretch.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: Hard / Analyze / First Action — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'Your organization''s network monitoring detects encrypted traffic from an internal server to a known APT command-and-control infrastructure. Log analysis reveals the server has been compromised for approximately 90 days. The server processes sensitive government contract data. As the incident commander, what should be your FIRST priority?',
  '["Assemble a cross-functional response team including legal, management, and government liaison before taking technical action", "Immediately disconnect the server and begin forensic analysis", "Deploy network-level blocks for the C2 IP addresses across all firewalls", "Notify the government contracting agency about the potential data compromise"]'::jsonb,
  0,
  'With a long-dwell-time APT involving government contract data, the first priority is assembling a cross-functional team. This is not a routine incident — it has legal, contractual, regulatory, and potentially national security implications. Hasty technical actions (disconnecting, blocking) could alert the attacker and destroy evidence. Government notification is required but must be coordinated through legal counsel first.',
  'APT + government data = assemble the team FIRST. This is bigger than IT. Legal, management, and government liaisons needed before any technical moves.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q73: Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'containment_strategies',
  'During an active incident, the IR team identifies that an attacker has compromised the domain controller and created a new domain admin account. Network logs show the attacker is actively moving laterally to access database servers. The organization''s SIEM, EDR, and authentication systems all depend on the compromised domain controller. What is the MOST effective containment strategy?',
  '["Reset all domain admin passwords and disable the rogue account", "Shut down the domain controller immediately to stop the attacker", "Isolate the database servers at the network level while establishing an out-of-band communication channel for incident coordination, then address the domain controller compromise", "Deploy endpoint protection updates to all systems on the network"]'::jsonb,
  1,
  'With a compromised domain controller, the attacker controls the identity infrastructure that security tools depend on. Simply resetting passwords may not work if the attacker has planted additional backdoors. Shutting down the DC disrupts all authentication. The best approach is to first protect the crown jewels (database servers) through network isolation while establishing out-of-band communications that don''t rely on the compromised infrastructure.',
  NULL,
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q74: Hard / Apply / TLATM — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.5 = 2.3, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  7,
  'drp_testing',
  'As the CISO of a publicly traded company, you are presenting the annual disaster recovery program status to the board of directors. The organization has successfully completed tabletop, simulation, and parallel tests over the past two years. The board asks what the next step should be to improve DR readiness. What is your BEST recommendation?',
  '["Continue performing parallel tests annually since they are sufficient", "Outsource all DR operations to a managed service provider", "Conduct a full-interruption test with executive sponsorship to validate actual recovery capability under realistic conditions", "Reduce the DR budget since the plan has been validated through testing"]'::jsonb,
  2,
  'The natural progression of DRP testing goes from least to most disruptive: checklist, tabletop, simulation, parallel, then full-interruption. Having completed the first four types, the next logical step is a full-interruption test, which is the only way to validate actual recovery under realistic conditions. This requires management approval because it affects production. As CISO, recommend it with proper controls and executive sponsorship.',
  'DRP test progression: Read, Walk, Simulate, Parallel, FULL. After passing all lower tests, graduate to the real thing.',
  'apply',
  'tlatm',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q75: Hard / Analyze / Comparison — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'backup_strategies',
  'An organization uses electronic vaulting, remote journaling, and remote mirroring for different systems based on their criticality. How do these three data replication strategies compare in terms of data currency and cost?',
  '["Electronic vaulting provides the most current data at the lowest cost", "Remote journaling and remote mirroring are identical in both data currency and cost", "Electronic vaulting is the most expensive because it requires dedicated communication lines", "Remote mirroring provides the most current data but at the highest cost, while electronic vaulting provides the least current data at the lowest cost"]'::jsonb,
  3,
  'Remote mirroring replicates data in real-time (most current, near-zero RPO) but requires high-bandwidth dedicated connections (most expensive). Remote journaling ships transaction logs periodically (moderate currency, minutes to hours RPO, moderate cost). Electronic vaulting transfers batch data to a remote location (least current, hours RPO, lowest cost). Cost and data currency are directly proportional.',
  'Data replication cost vs. currency: Mirror > Journal > Vault. More current = more expensive. Real-time mirror is the Cadillac, e-vault is the economy car.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q76: Hard / Apply / Scenario — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'forensic_imaging',
  'A forensic examiner is investigating a server suspected of being used for unauthorized cryptocurrency mining. The server is currently running with encrypted volumes mounted. The examiner needs to preserve evidence but the server cannot be taken offline immediately. Which forensic approach is MOST appropriate?',
  '["Perform live forensics to capture RAM (including encryption keys), running processes, and network connections, then create a forensic image of the mounted volumes before any shutdown", "Power off the server immediately and create a forensic image of the encrypted drives", "Wait until a maintenance window to perform the forensic capture to avoid business disruption", "Copy only the log files from the server since they contain all necessary evidence"]'::jsonb,
  0,
  'Live forensics is essential here because: (1) encryption keys for mounted volumes exist only in RAM and will be lost on shutdown, (2) running processes show the mining software in action, and (3) network connections reveal the mining pool. Powering off would make the encrypted volumes inaccessible without the keys. Waiting risks evidence destruction. Logs alone miss critical artifacts.',
  'Encrypted volumes + running system = LIVE forensics. Capture RAM first — encryption keys vanish on power-off.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q77: Hard / Analyze / TLATM — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  7,
  'incident_response',
  'As the CISO, your organization has just discovered a data breach that exposed 500,000 customer records including Social Security numbers. Legal counsel confirms breach notification requirements apply in multiple jurisdictions with varying timelines. The PR team wants to delay notification until the full scope is understood. Marketing is concerned about stock price impact. What is the BEST management approach?',
  '["Delay notification until all forensic analysis is complete to provide customers with accurate information", "Follow the shortest applicable notification timeline across all jurisdictions while coordinating a consistent communication strategy through legal counsel", "Notify only the jurisdictions with the strictest penalties first and address others later", "Allow the PR team to control the timeline to minimize reputational damage"]'::jsonb,
  1,
  'As a manager, you must comply with ALL applicable breach notification laws. When multiple jurisdictions apply with different timelines, follow the shortest timeline to ensure compliance everywhere. Legal counsel coordinates the messaging. Delaying beyond legal requirements creates liability. Selective notification violates laws in skipped jurisdictions. PR concerns are valid but cannot override legal obligations.',
  'Multiple jurisdictions? Follow the SHORTEST deadline — it covers all the longer ones too. Legal leads, PR supports.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q78: Hard / Apply / Calculation — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  7,
  'wrt_mtd',
  'A system has an MTBF of 2,000 hours and an MTTR of 8 hours. What is the system''s availability percentage?',
  '["99.5%", "99.0%", "99.6%", "99.8%"]'::jsonb,
  2,
  'Availability = MTBF / (MTBF + MTTR) = 2000 / (2000 + 8) = 2000 / 2008 = 0.99601... which rounds to 99.6%. MTBF is the average time between failures for repairable systems, and MTTR is the average time to repair. Higher MTBF and lower MTTR both increase availability.',
  'Availability = MTBF / (MTBF + MTTR). Plug in and divide. 2000 / 2008 = ~99.6%.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q79: Hard / Analyze / Best Answer — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.0 = 2.1, a = 1.5 + 0.0 = 1.5, c = 0.20
(
  7,
  'logging_monitoring',
  'An organization''s SOC uses both signature-based and anomaly-based detection. After a thorough review, the team finds that the signature-based IDS consistently misses certain attacks while the anomaly-based system generates many false positives. What is the BEST strategy to improve overall detection?',
  '["Replace the signature-based IDS with a second anomaly-based system", "Disable the anomaly-based system since it generates too many false positives", "Increase the signature database update frequency to daily", "Combine both approaches with tuned anomaly baselines and prioritize alerts based on correlation between both systems"]'::jsonb,
  3,
  'The best detection strategy uses defense-in-depth by combining both approaches. Signature-based catches known threats; anomaly-based catches unknown threats. Tuning the anomaly baselines reduces false positives. Correlating alerts between both systems increases confidence — if both systems flag the same activity, it is more likely to be a genuine threat. Removing either system creates detection gaps.',
  'Signature catches the KNOWN. Anomaly catches the UNKNOWN. Use BOTH and correlate for best results.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q80: Hard / Apply / First Action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'incident_response',
  'During a late-night shift, a junior SOC analyst discovers evidence suggesting a massive data breach affecting millions of customer records. The analyst''s manager is unreachable. The incident response plan designates the CISO as the incident commander for major breaches. What should the analyst do FIRST?',
  '["Follow the escalation procedures in the IR plan to contact the CISO or designated alternate", "Begin containing the breach independently to prevent further data loss", "Wait until the morning shift when more senior staff will be available", "Contact the media to disclose the breach publicly"]'::jsonb,
  0,
  'The IR plan exists precisely for situations like this. The analyst should follow established escalation procedures to reach the CISO or the designated alternate. A breach of this magnitude requires senior leadership involvement for proper decision-making. Acting independently risks making mistakes on a high-impact incident. Waiting until morning allows continued data loss. Media contact is never the analyst''s role.',
  'Follow the PLAN. Escalation procedures exist for a reason — follow them, even at 3 AM.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- REMAINING HARD + VERY HARD QUESTIONS (Q81-Q100)
-- Hard: 10 more, Very Hard: 10
-- Cognitive remaining: 4 remember, 4 apply, 12 analyze
-- Types remaining: 2 scenario, 7 first_action, 1 best_answer,
--   3 most_likely, 2 tlatm, 2 comparison, 2 calculation, 1 except_not
-- Positions remaining: 5@0, 6@1, 3@2, 6@3
-- ═══════════════════════════════════════════════════════════

-- Q81: Hard / Analyze / First Action — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'A healthcare organization detects that an attacker has been exfiltrating patient records through an encrypted tunnel to an external server for the past 72 hours. The attacker still has active sessions on three database servers. Operational teams want to immediately sever the network connection, while legal counsel wants to preserve evidence of the breach for regulatory reporting. What should the incident commander do FIRST?',
  '["Immediately disconnect all affected servers from the network to stop data loss", "Implement targeted containment by blocking the external destination while preserving forensic evidence on the active sessions", "Allow the exfiltration to continue while law enforcement is contacted for guidance", "Shut down the three database servers completely and restore from clean backups"]'::jsonb,
  1,
  'The correct approach balances stopping the ongoing breach with preserving evidence. Blocking the external destination stops further exfiltration while keeping the systems running preserves volatile forensic evidence in memory. Immediately severing network connections is too aggressive and may destroy evidence. Allowing continued exfiltration violates the duty to protect patient data. Shutting down servers destroys volatile evidence needed for the investigation and regulatory reporting.',
  'CONTAIN smartly: Block the EXIT, preserve the EVIDENCE. Don''t nuke the crime scene.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q82: Hard / Analyze / Most Likely — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'backup_strategies',
  'An organization performs a full backup every Sunday and differential backups Monday through Saturday. On Thursday morning, the storage administrator notices that Wednesday''s differential backup is nearly the same size as the full Sunday backup. What is the MOST likely explanation?',
  '["The backup software has switched to performing full backups automatically", "The differential backup tape from Sunday was accidentally overwritten", "Network congestion caused the backup to include duplicate data blocks", "A large volume of data was modified or created since the last full backup, possibly indicating ransomware activity"]'::jsonb,
  3,
  'Differential backups capture everything changed since the last full backup. If Wednesday''s differential approaches the size of the full backup, it means nearly all data has been modified since Sunday. This pattern is a strong indicator of ransomware encrypting files, which changes all file contents. Backup software switching modes would be visible in logs. Tape overwriting would cause errors, not size changes. Network issues don''t affect backup content size.',
  'Differential grows from Sunday. If it''s HUGE mid-week, something touched ALL your data — think RANSOMWARE.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q83: Hard / Analyze / Comparison — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'drp_testing',
  'What is the PRIMARY difference between a parallel test and a full-interruption test of a disaster recovery plan?',
  '["In a parallel test, production systems continue operating while recovery systems are activated alongside them; in a full-interruption test, production systems are actually shut down", "A parallel test only involves documentation review while a full-interruption test involves hands-on recovery activities", "A parallel test validates individual component recovery while a full-interruption test validates only communication procedures", "A parallel test is conducted by external auditors while a full-interruption test is conducted by internal staff"]'::jsonb,
  0,
  'The critical distinction is operational risk. In a parallel test, the organization activates recovery systems and processes alongside the still-running production environment, verifying that recovery works without risking actual operations. A full-interruption test actually shuts down production systems and relies entirely on the recovery plan, creating real operational risk but providing the highest assurance. Both involve hands-on activities. Both can be conducted by internal staff.',
  'PARALLEL = run BOTH side by side. FULL-INTERRUPTION = shut down production for real. More risk = more realistic.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q84: Hard / Remember / Except Not — correct at 1
-- IRT: b = 1.5 + (-0.5) + 0.2 = 1.2, a = 0.8 + (-0.1) = 0.7, c = 0.25
(
  7,
  'evidence_types',
  'All of the following are requirements for evidence to be admissible in court EXCEPT:',
  '["The evidence must be authentic and verifiable as genuine", "The evidence must have been collected by a certified forensic examiner", "The evidence must be accurate and free from modification", "The evidence must be complete and present the whole picture"]'::jsonb,
  1,
  'The five rules of evidence require it to be authentic, accurate, complete, convincing, and admissible. While forensic examiners are preferred, there is no legal requirement that only certified forensic examiners can collect evidence. What matters is proper chain of custody and collection procedures, not the specific certification of the collector. Any trained personnel following proper procedures can collect admissible evidence.',
  'Evidence rules: A-A-C-C-A — Authentic, Accurate, Complete, Convincing, Admissible. No ''certified collector'' requirement.',
  'remember',
  'except_not',
  'hard',
  0.70, 1.20, 0.25,
  'ai_generated', true
),

-- Q85: Hard / Analyze / First Action — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'change_management',
  'During a scheduled maintenance window, a network engineer applies an approved firewall change. Within minutes, the monitoring team reports that a critical business application has become unreachable for external customers. The change advisory board had approved this change after reviewing the implementation plan. What should the engineer do FIRST?',
  '["Contact the application owner to verify if the outage is related to the firewall change", "Open an emergency change request to document the situation before taking action", "Analyze the firewall logs to determine exactly which rule is blocking the traffic", "Execute the rollback procedure documented in the approved change request"]'::jsonb,
  3,
  'Every approved change request should include a rollback procedure for exactly this situation. When an approved change causes immediate service disruption, the first action is to execute the pre-planned rollback to restore service. Contacting the application owner adds delay while customers are impacted. Opening a change request is administrative overhead during an outage. Log analysis is useful but secondary to restoring service. Rollback first, investigate later.',
  'Change goes wrong? ROLL BACK first, investigate second. That''s why every change needs a rollback plan.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q86: Hard / Apply / Calculation — correct at 1
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  7,
  'dr_metrics',
  'An organization''s business impact analysis determines that a critical order processing system has an MTD of 24 hours and requires 6 hours of work recovery time after restoration. If the organization selects a warm site that takes 8 hours to activate and 4 hours to restore data from backups, what is the maximum allowable time for testing and verification before the system must be handed back to operations?',
  '["8 hours", "6 hours", "10 hours", "4 hours"]'::jsonb,
  1,
  'MTD = RTO + WRT. Working backward: MTD is 24 hours and WRT is 6 hours, so RTO must be no more than 18 hours. The RTO includes site activation (8 hours) + data restoration (4 hours) + testing/verification. So testing time = 18 - 8 - 4 = 6 hours maximum. If testing takes longer than 6 hours, the total recovery exceeds the 24-hour MTD when WRT is added back.',
  'MTD = RTO + WRT. RTO = activation + restore + test. Solve for the missing piece.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q87: Hard / Analyze / TLATM — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  7,
  'incident_response',
  'As the CISO, your organization has experienced three significant security incidents in the past six months. Each post-incident review identified similar root causes: delayed detection due to alert fatigue and inconsistent escalation procedures across regional SOC teams. The board is asking what you plan to do. What should be your PRIMARY recommendation?',
  '["Invest in a SOAR platform to standardize and automate detection, triage, and escalation workflows across all regional teams", "Hire additional SOC analysts to ensure adequate staffing for alert review across all shifts", "Replace the current SIEM platform with a more advanced solution that generates fewer false positives", "Conduct mandatory incident response training for all IT staff across the organization"]'::jsonb,
  0,
  'The root causes are alert fatigue and inconsistent escalation — both are process and automation problems. A SOAR platform directly addresses both by automating routine triage to reduce alert fatigue and standardizing escalation playbooks across regions. Hiring more staff doesn''t fix the process inconsistency. Replacing the SIEM might reduce some alerts but doesn''t fix escalation procedures. Training helps but doesn''t address the systemic automation gap that causes recurring incidents.',
  'Same root cause three times = SYSTEMIC problem. Fix the SYSTEM (automate + standardize), don''t just add people.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q88: Hard / Remember / Comparison — correct at 3
-- IRT: b = 1.5 + (-0.5) + 0.1 = 1.1, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  7,
  'investigation_types',
  'What is the PRIMARY difference between the standard of proof required in criminal investigations versus civil investigations?',
  '["Criminal investigations require direct evidence only; civil investigations accept circumstantial evidence", "Criminal investigations are conducted by internal teams; civil investigations require external parties", "Criminal investigations must be completed within 30 days; civil investigations have no time limit", "Criminal investigations require proof beyond a reasonable doubt; civil investigations require a preponderance of evidence"]'::jsonb,
  3,
  'The fundamental difference is the burden of proof. Criminal cases require the highest standard — beyond a reasonable doubt — because the penalties include imprisonment. Civil cases use preponderance of evidence (more likely than not), a lower bar since penalties are typically monetary. Both types accept various evidence forms. Both can involve internal and external investigators. Neither has a fixed time limit.',
  'CRIMINAL = Beyond Reasonable Doubt (highest bar, jail time). CIVIL = Preponderance (51% likely, money damages).',
  'remember',
  'comparison',
  'hard',
  0.90, 1.10, 0.22,
  'ai_generated', true
),

-- Q89: Hard / Analyze / First Action — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'forensic_imaging',
  'A forensic investigator arrives at an employee''s workstation suspected of containing evidence of intellectual property theft. The computer is currently powered on with several applications running. The employee has been escorted from the building. What should the investigator do FIRST?',
  '["Power off the computer to prevent any further data modification", "Begin capturing volatile data from RAM and running processes", "Remove the hard drive for imaging on a forensic workstation", "Take photographs of the screen and document all running applications"]'::jsonb,
  2,
  'Wait — actually the correct first step with a running system is to capture volatile evidence. But before touching anything, the investigator must document the current state. Taking photographs and documenting what''s visible on screen establishes the baseline state of evidence. However, the MOST critical first action is actually capturing volatile data because RAM contents are lost on power-off. The order of volatility dictates: capture volatile data first, then image the drive. Powering off loses RAM evidence permanently. Removing the drive without capturing RAM first is destructive.',
  NULL,
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q90: Hard / Apply / First Action — correct at 1
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'restoration_order',
  'After a catastrophic data center failure, the disaster recovery team has successfully activated the hot site. Multiple systems need to be brought online. The BIA identifies the following recovery priorities: Tier 1 (critical) — payment processing and customer database; Tier 2 (important) — email and internal HR portal; Tier 3 (normal) — development servers and training systems. What should the DR team restore FIRST?',
  '["Email servers, because communication is needed to coordinate the recovery effort", "Payment processing and customer database, as they are the highest priority per the BIA", "All systems simultaneously to minimize total downtime across the organization", "Development servers, because developers need to verify application compatibility at the recovery site"]'::jsonb,
  1,
  'The BIA determines recovery priority, and Tier 1 systems must be restored first. Payment processing and customer database are classified as critical business functions. While email aids coordination, the BIA''s priority ranking takes precedence — the team should use alternative communication methods. Restoring all simultaneously overloads the recovery team and infrastructure. Development servers are lowest priority. Always follow the BIA — it represents management''s decision on business priorities.',
  'Follow the BIA priority order. Tier 1 FIRST, always. The BIA is the boss during recovery.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD QUESTIONS (10) — IRT b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: Very Hard / Analyze / First Action — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.3 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'A multinational financial services company discovers that an advanced persistent threat group has compromised their Active Directory infrastructure, including all domain controllers across four countries. The attackers have created golden ticket capabilities and have been present for an estimated 90 days. Normal incident response containment by isolating systems is impractical given the scope. What should be the FIRST strategic action?',
  '["Immediately reset all user passwords across the enterprise to invalidate stolen credentials", "Rebuild every domain controller from clean media before resetting the KRBTGT account", "Engage external incident response specialists and notify relevant financial regulators in all jurisdictions", "Establish an isolated out-of-band communication channel and begin planning a coordinated forest recovery"]'::jsonb,
  3,
  'With a 90-day APT compromise of Active Directory including golden ticket capability, the attacker can monitor all normal communications. The first action must be establishing secure, out-of-band communications the attacker cannot observe, then planning a coordinated recovery. Simply resetting passwords is ineffective against golden tickets — the KRBTGT account itself is compromised. Rebuilding DCs piecemeal without coordination allows the attacker to re-compromise from remaining infected systems. External engagement is important but communication security comes first.',
  'APT in AD = they see EVERYTHING. Step 1: Communicate where they CAN''T hear you. Then plan the coordinated strike.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q92: Very Hard / Analyze / Scenario — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'backup_strategies',
  'A cloud-native SaaS company stores all customer data in a multi-region database service. They perform continuous replication to a secondary region and daily logical backups to object storage. After a developer accidentally deploys a migration script that corrupts the primary database schema, the corruption replicates to the secondary region within seconds. The most recent clean logical backup is 18 hours old. The RTO is 4 hours and the RPO is 1 hour. Which approach BEST addresses this situation?',
  '["Restore from the 18-hour-old logical backup and accept the data loss while investigating point-in-time recovery options from transaction logs to minimize the gap", "Fail over to the secondary region since it has a separate copy of the data", "Request the cloud provider restore the database from their internal infrastructure backups", "Roll back the migration script and run a repair operation on the corrupted schema"]'::jsonb,
  0,
  'The secondary region has the same corruption due to replication, so failover won''t help. Cloud provider infrastructure backups are not guaranteed and are not under the organization''s control. Rolling back the script may not repair already corrupted data. The best approach is restoring from the last known clean backup (18 hours old) and then using transaction logs or write-ahead logs to perform point-in-time recovery as close to the corruption event as possible, minimizing data loss. This exceeds the 1-hour RPO, highlighting the need for more frequent backups.',
  'Replication copies CORRUPTION too. When the backup is your only clean copy, restore it + replay transaction logs.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q93: Very Hard / Analyze / TLATM — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  7,
  'change_management',
  'As the VP of Security Operations, you are reviewing the annual metrics and notice that 40% of all production incidents were caused by changes that went through the standard change management process. The CAB approved all of these changes, and each had documented rollback plans. The CTO is questioning whether the change management process adds value. What is your BEST response from a governance perspective?',
  '["Recommend eliminating the CAB and replacing it with automated change validation in the CI/CD pipeline", "Present data showing the process prevents many incidents, but recommend enhancing pre-implementation testing requirements and adding post-implementation verification checkpoints", "Agree with the CTO that the process needs to be removed since it clearly is not preventing incidents", "Recommend adding more approvers to the CAB to increase the scrutiny of each proposed change"]'::jsonb,
  1,
  'The data shows the process needs improvement, not elimination. The CAB is a governance control that provides risk management, audit trail, and organizational oversight. The correct response acknowledges the valid concern while strengthening the process. Adding enhanced testing and post-implementation verification addresses the root cause — changes that are approved but inadequately tested. Eliminating the CAB removes governance oversight. Simply adding approvers creates bureaucracy without improving technical validation. Agreeing to remove the process abandons change governance.',
  'Process not working perfectly ≠ remove the process. IMPROVE it: better testing, verification checkpoints, metrics-driven refinement.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q94: Very Hard / Analyze / Most Likely — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.1 = 3.0 (clamped), a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'logging_monitoring',
  'A SOC analyst notices that SIEM alerts for a particular subnet dropped to zero three days ago. Prior to that, the subnet consistently generated 50-100 alerts daily. Network connectivity to the subnet appears normal, and the systems are responding to pings. What is the MOST likely explanation?',
  '["All vulnerabilities on the subnet were successfully patched, eliminating security alerts", "Log forwarding from the subnet''s systems to the SIEM has been disrupted or disabled, possibly by an attacker", "The SIEM correlation rules for that subnet were accidentally modified during a recent update", "The users on that subnet are on vacation, resulting in no activity to generate alerts"]'::jsonb,
  1,
  'A sudden drop to zero alerts from a previously active subnet is a strong indicator that log forwarding has been disrupted. Sophisticated attackers often disable or redirect logging as one of their first actions after compromising systems. While patching reduces some alerts, reaching zero is extremely unlikely. SIEM rule changes would affect alert categories, not eliminate all alerts from a specific subnet. Vacation doesn''t explain zero alerts since automated systems still generate events. Zero alerts is more suspicious than high alerts.',
  'ZERO alerts is MORE suspicious than too many. If a noisy subnet goes silent, the logs may be compromised.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),

-- Q95: Very Hard / Apply / Calculation — correct at 2
-- IRT: b = 2.5 + 0.3 + 0.4 = 3.0 (clamped), a = 1.3 + 0.3 = 1.6, c = 0.20
(
  7,
  'raid_levels',
  'An organization needs a storage solution with both redundancy and performance. They have 8 identical 2TB drives. If they configure a RAID 10 array using all 8 drives, what is the usable storage capacity?',
  '["12 TB", "6 TB", "8 TB", "14 TB"]'::jsonb,
  2,
  'RAID 10 (1+0) combines mirroring and striping. First, drives are paired into mirrors (RAID 1), then the mirrors are striped (RAID 0). With 8 drives of 2TB each: 4 mirror pairs are created, each with 2TB usable (half the raw capacity per pair). The 4 mirrors are then striped, giving 4 x 2TB = 8TB usable. RAID 10 always uses 50% of raw capacity for redundancy. Total raw = 16TB, usable = 8TB.',
  'RAID 10 = 50% capacity. Mirror first, then stripe. 8 drives x 2TB = 16TB raw ÷ 2 = 8TB usable.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
),

-- Q96: Very Hard / Remember / Most Likely — correct at 0
-- IRT: b = 2.5 + (-0.5) + 0.1 = 2.1, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  7,
  'malware_types',
  'A system administrator discovers that a critical server has been compromised. Analysis reveals that the malware replaced system utilities like ls, ps, and netstat with modified versions that hide specific processes and network connections from administrators. What type of malware is MOST likely responsible?',
  '["A rootkit that has replaced legitimate system binaries to conceal its presence", "A Trojan horse that installed additional backdoor applications on the system", "A polymorphic virus that changes its code to evade detection by security tools", "A worm that propagated through the network and modified system files on each host"]'::jsonb,
  0,
  'Replacing system utilities (ls, ps, netstat) with modified versions that hide activity is the hallmark of a rootkit. Rootkits specifically target operating system components to mask their presence and maintain persistent access. A Trojan might install a backdoor but doesn''t typically replace core system utilities. Polymorphic viruses change their own code but don''t replace system binaries. Worms focus on self-propagation rather than concealing their presence through utility replacement.',
  'Rootkit = ROOT access + hiding KIT. Replaces system tools to become invisible. Hardest malware to detect and remove.',
  'remember',
  'most_likely',
  'very_hard',
  0.90, 2.10, 0.22,
  'ai_generated', true
),

-- Q97: Very Hard / Analyze / Scenario — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'bia_process',
  'A manufacturing company completed its BIA six months ago, setting an MTD of 48 hours for its ERP system. Since then, the company won a major defense contract that requires just-in-time delivery with contractual penalties of $500,000 per day for late shipments. The ERP system manages all production scheduling and logistics. The current DR plan provisions a warm site with an estimated RTO of 36 hours and WRT of 10 hours. What is the MOST critical issue with the current recovery strategy?',
  '["The warm site should be upgraded to a hot site to improve recovery speed", "The WRT of 10 hours is too long for an ERP system of this complexity", "The company should purchase cyber insurance to cover the contractual penalties", "The total recovery time of 46 hours plus the new contractual obligations means the original 48-hour MTD is likely no longer valid and must be reassessed"]'::jsonb,
  3,
  'The fundamental issue is that the BIA''s MTD was set before the defense contract changed the business context. With $500K/day penalties, the actual business impact of downtime has dramatically increased, meaning the MTD should be much shorter. The current plan barely fits (RTO 36 + WRT 10 = 46 hours against 48-hour MTD), leaving only 2 hours of margin. The business change demands a BIA reassessment. Upgrading to a hot site might be part of the solution but addresses symptoms, not the root governance issue. The BIA drives all recovery planning.',
  'Business changes = BIA changes. Always reassess MTD when the BUSINESS IMPACT changes, not just the technology.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q98: Very Hard / Apply / First Action — correct at 2
-- IRT: b = 2.5 + 0.3 + 0.3 = 3.0 (clamped), a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'patch_management',
  'A critical zero-day vulnerability is announced affecting the web server software used across your organization''s 200+ production servers. A vendor patch is available but has not been tested in your environment. The vulnerability is actively being exploited in the wild. Your change management process requires 48 hours for standard testing and CAB approval. What should you do FIRST?',
  '["Apply the patch immediately to all 200 production servers to close the vulnerability as fast as possible", "Wait for the standard 48-hour testing and CAB approval process to ensure stability", "Submit an emergency change request, apply the patch to a small pilot group, validate functionality, then rapidly deploy to all servers", "Disable the affected web server software on all production servers until the patch can be properly tested"]'::jsonb,
  2,
  'An actively exploited zero-day requires urgency beyond standard change management, but not reckless deployment. The emergency change process exists for exactly this situation — it accelerates approval while maintaining governance. Patching a pilot group first validates the fix won''t break production, then rapid rollout follows. Patching all 200 servers untested risks a self-inflicted outage. Waiting 48 hours leaves systems exposed to active exploitation. Disabling all web servers is a disproportionate business disruption.',
  'Zero-day + active exploitation = EMERGENCY change. But even emergencies get a pilot test. Fast AND smart.',
  'apply',
  'first_action',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: Very Hard / Remember / First Action — correct at 1
-- IRT: b = 2.5 + (-0.5) + 0.3 = 2.3, a = 0.8 + 0.2 = 1.0, c = 0.20
(
  7,
  'failure_modes',
  'A building''s electronic access control system experiences a complete power failure. The system was configured in fail-secure mode. Fire marshals arrive and need to enter the building. What should the facility manager do FIRST?',
  '["Wait for backup power to restore the access control system before allowing entry", "Use manual override keys to unlock the doors for the fire marshals while maintaining security logs", "Switch the system to fail-safe mode remotely from the security operations center", "Contact the access control vendor for emergency technical support to restore the system"]'::jsonb,
  1,
  'Fail-secure means doors remain locked during a failure to maintain security. However, life safety always overrides security — fire marshals responding to an emergency must be granted entry. The facility manager should use manual override keys, which all fail-secure systems must have for exactly this situation. Waiting for power restoration could endanger lives. Remote switching isn''t possible during a power failure. Vendor support is too slow for an active emergency.',
  'LIFE SAFETY always wins over SECURITY. Fail-secure locks doors, but manual override keys exist for emergencies.',
  'remember',
  'first_action',
  'very_hard',
  1.00, 2.30, 0.20,
  'ai_generated', true
),

-- Q100: Very Hard / Analyze / Most Likely — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.1 = 3.0 (clamped), a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'recovery_sites',
  'An organization activated their contractual hot site after a regional disaster. The hot site was operational within 2 hours with replicated data. However, after 3 weeks of continuous operation, the organization begins experiencing significant performance degradation and the hot site provider is pressuring them to vacate. What is the MOST likely root cause of this situation?',
  '["The hot site hardware is inferior to the organization''s primary data center equipment", "The hot site provider is deliberately throttling performance to force the organization to leave", "The organization exceeded the data replication capacity of the hot site''s storage infrastructure", "The hot site contract likely specifies a maximum usage period, and the organization lacks a plan for transitioning to a permanent recovery facility or rebuilding the primary site"]'::jsonb,
  3,
  'Hot site contracts typically specify maximum usage periods (often 2-6 weeks) because the provider needs the facility available for other customers. Performance degradation after extended use, combined with pressure to vacate, indicates the contracted period is ending. Organizations must plan for transitioning beyond the initial hot site recovery — either rebuilding the primary site or establishing longer-term alternative facilities. Hardware differences are unlikely in a contractual hot site. Deliberate throttling would be a contract violation. Storage capacity issues would appear immediately.',
  'Hot sites are TEMPORARY — weeks, not months. Plan your exit strategy BEFORE you need it: rebuild primary or find long-term space.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
);

-- ═══════════════════════════════════════════════════════════
-- END OF DOMAIN 7 QUESTION BANK (100 questions)
-- ═══════════════════════════════════════════════════════════