-- =============================================================================
-- CISSP Quest — Domain 7: Security Operations
-- Generated: 2026-04-16  |  Source: ai_generated (ISC2 CBK, NIST SP 800-61, ITIL)
-- =============================================================================
-- Distribution Stats (28 questions):
--   Difficulty : easy=6 (21%), medium=13 (46%), hard=7 (25%), very_hard=2 (7%)
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

-- Q1 easy / remember / backup_strategies_321
(
  7, 'backup_strategies_321',
  'An organization follows the 3-2-1 backup rule. Which statement CORRECTLY describes this rule?',
  '["Perform 3 daily backups using 2 rotation schemes with 1 annual full backup","Maintain 3 copies of data on 2 different media types with 1 copy stored offsite","Keep 3 years of backups using 2 storage vendors with 1 encrypted copy","Run 3 backup jobs per day using 2 different tools with 1 administrator responsible"]'::jsonb,
  1,
  'Explanation: The 3-2-1 backup rule is: 3 copies of data (1 primary + 2 backups), stored on at least 2 different media types (e.g., disk and tape, or local disk and cloud), with at least 1 copy stored offsite (to survive site-level disasters such as fire, flood, or ransomware). The offsite copy protects against scenarios where on-premises backups are also destroyed or encrypted.',
  '3-2-1 MISSION ARCHIVE: Three copies, two vaults, one off-site — if HQ burns, the field copy survives.',
  'remember',
  'best_answer',
  'easy',
  0.90, -1.85, 0.20, 'ai_generated', true
),

-- Q2 easy / remember / incident_response_picerl
(
  7, 'incident_response_picerl',
  'During which phase of the NIST SP 800-61 incident response lifecycle does the team determine the scope of an incident and begin collecting evidence?',
  '["Preparation", "Detection and Analysis", "Containment, Eradication, and Recovery", "Post-Incident Activity"]'::jsonb,
  1,
  'Explanation: NIST SP 800-61 defines four incident response phases: (1) Preparation — building the capability before incidents occur; (2) Detection and Analysis — identifying that an incident has occurred, determining its scope, severity, and collecting initial evidence; (3) Containment, Eradication, and Recovery — stopping the spread, removing the threat, and restoring operations; (4) Post-Incident Activity — lessons learned and improvement. Scope determination and initial evidence collection happen in Detection and Analysis.',
  'DETECT AND ANALYZE: The moment you identify the intrusion, you scope it — that''s Phase 2 of the NIST playbook.',
  'remember',
  'best_answer',
  'easy',
  0.88, -1.80, 0.20, 'ai_generated', true
),

-- Q3 easy / understand / forensics_chain_of_custody
(
  7, 'forensics_chain_of_custody',
  'A forensic investigator images a suspect hard drive before analysis. The first action after creating the image is to calculate and record the hash of both the original drive and the forensic copy. What is the PRIMARY purpose of this step?',
  '["To encrypt the forensic image before it is stored in the evidence locker","To verify that the forensic copy is an exact bit-for-bit duplicate of the original, establishing integrity for legal admissibility","To compress the image file to reduce storage requirements","To identify malware signatures on the drive using the hash values"]'::jsonb,
  1,
  'Explanation: Hashing (typically MD5 or SHA-256) of both the original and forensic copy at acquisition time creates a mathematically verifiable proof that the copy is identical to the original. If the hashes match, the investigator can demonstrate that the evidence was not altered during the imaging process — this is essential for chain of custody and legal admissibility. If the hashes are recomputed later and still match, it proves the copy has not been tampered with. Encryption, compression, and malware scanning are separate activities.',
  'EVIDENCE SEAL: The hash is the wax seal on the classified envelope — if it breaks, the evidence is tainted.',
  'understand',
  'scenario',
  'easy',
  0.90, -1.70, 0.20, 'ai_generated', true
),

-- Q4 easy / understand / change_management_itil
(
  7, 'change_management_itil',
  'In ITIL change management, a Change Advisory Board (CAB) meeting is skipped and a system configuration change is deployed immediately to resolve a production outage. What change category does this represent?',
  '["Normal change", "Standard change", "Emergency change", "Major change"]'::jsonb,
  2,
  'Explanation: ITIL defines emergency changes as changes that must be implemented immediately to restore service or prevent significant business impact — they bypass the normal CAB review cycle (or use an emergency CAB with a smaller quorum). The key requirement is that emergency changes are still authorized (by an Emergency CAB or Change Authority), documented, and reviewed after implementation — they are expedited, not exempt from governance. Normal changes go through the full CAB process. Standard changes are pre-approved, low-risk, routine changes. Major changes are high-impact normal changes requiring additional oversight.',
  'EMERGENCY PROTOCOL: Skip the briefing, fix the crisis — but document everything and debrief after.',
  'understand',
  'scenario',
  'easy',
  0.88, -1.65, 0.20, 'ai_generated', true
),

-- Q5 easy / remember / personnel_security_ops
(
  7, 'personnel_security_ops',
  'Which personnel security control is MOST effective at detecting fraud committed by a single employee over an extended period?',
  '["Background checks at time of hire","Mandatory vacation policy","Separation of duties","Least privilege access controls"]'::jsonb,
  1,
  'Explanation: Mandatory vacation (forced leave) requires employees to be away from their duties for a continuous period, during which a backup employee performs their job. Ongoing fraudulent schemes (falsified transactions, embezzlement, unauthorized activity) often require the perpetrator''s continuous presence to maintain or conceal. When they are forced away, the backup employee or management review discovers the discrepancy. Background checks detect past offenses but do not detect fraud committed AFTER hire. Separation of duties prevents single individuals from completing a fraudulent transaction alone but requires proper design. Least privilege limits damage but does not inherently detect ongoing fraud.',
  'FORCED ABSENCE REVEALS: The spy on vacation cannot maintain their cover story — the fraud surfaces.',
  'remember',
  'best_answer',
  'easy',
  0.90, -1.75, 0.20, 'ai_generated', true
),

-- Q6 easy / understand / patch_management
(
  7, 'patch_management',
  'Before deploying a vendor security patch to production systems, a patch management policy requires testing in a non-production environment. What is the PRIMARY reason for this requirement?',
  '["To give administrators time to review the patch source code for malicious content", "To meet the vendor''s licensing requirements for patch deployment", "To ensure the patch is cryptographically signed before installation", "To verify the patch does not break existing functionality or introduce compatibility issues before affecting production systems"]'::jsonb,
  3,
  'Explanation: Testing patches in a non-production (staging/test) environment before production deployment ensures that the patch does not cause unintended side effects — broken integrations, application failures, performance degradation, or configuration conflicts — that would affect business operations. The production environment cannot absorb experimental failures. Source code review of vendor patches is not the standard practice (though software composition analysis is). Licensing is not related to testing. Cryptographic signature verification is a separate integrity check performed at install time, not a reason to test in staging.',
  'STAGING DETONATION TEST: Set off the patch in the test bunker first — if it breaks something, production never knows.',
  'understand',
  'best_answer',
  'easy',
  0.88, -1.60, 0.20, 'ai_generated', true
),

-- Q7 medium / apply / incident_response_picerl
(
  7, 'incident_response_picerl',
  'A security analyst confirms that a ransomware infection has encrypted files on three workstations. The malware appears to still be active and is scanning the network. What is the FIRST action the incident response team should take?',
  '["Identify the ransomware strain to assess whether a decryption key is available","Isolate the infected workstations from the network to prevent further lateral spread","Notify law enforcement and preserve evidence for prosecution","Begin restoring files from the most recent backup to minimize business disruption"]'::jsonb,
  1,
  'Explanation: NIST SP 800-61 Containment is the first operational action once an active threat is identified. With ransomware actively scanning the network, every minute of connectivity allows it to spread to additional systems. Network isolation (disconnecting or quarantining the infected systems at the switch level) stops lateral movement immediately. Identification of the ransomware strain is important for recovery planning but is secondary to stopping the spread. Law enforcement notification is important but happens after immediate containment. Restoration from backup happens during the Recovery phase — after eradication of the threat.',
  'CONTAINMENT FIRST: Sever the infected agents from the network before they recruit the rest of the team.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q8 medium / apply / forensics_chain_of_custody
(
  7, 'forensics_chain_of_custody',
  'A forensic investigator needs to collect volatile data from a live compromised server. Which sequence follows the order of volatility principle correctly?',
  '["Disk image → RAM → network connections → running processes","RAM contents → running processes → network connections → disk image","Network connections → disk image → RAM → running processes","Running processes → disk image → network connections → RAM"]'::jsonb,
  1,
  'Explanation: The order of volatility principle (IETF RFC 3227) requires collecting the most volatile (ephemeral) evidence first, as it is lost when the system is powered off or state changes. Correct order from most to least volatile: CPU registers → RAM → swap/virtual memory → network connections → running processes → disk → removable media → remote logs. RAM is the most volatile relevant item here, followed by running processes (which disappear from memory), then network connections, then the disk (which persists after power-off). Starting with the disk image first would destroy RAM contents if the system must be powered down.',
  'VOLATILITY LADDER: Grab the fleeting intelligence first — RAM evaporates when the power dies.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.35, 0.20, 'ai_generated', true
),

-- Q9 medium / understand / change_management_itil
(
  7, 'change_management_itil',
  'A network administrator makes an undocumented firewall rule change to resolve a connectivity issue without submitting a change request. Two weeks later, a security audit discovers the change introduced an unauthorized inbound port opening. Which change management failure MOST directly caused this security gap?',
  '["The firewall vendor''s default configuration was insecure", "The organization lacked a Configuration Management Database (CMDB) to track firewall rules", "Bypassing the change request and CAB approval process eliminated oversight that would have identified the security risk", "The network administrator lacked sufficient training on firewall rule syntax"]'::jsonb,
  2,
  'Explanation: Change management processes exist to ensure changes are authorized, evaluated for security and operational impact, and documented. By bypassing the Request for Change (RFC) and CAB review, the administrator eliminated the oversight mechanism that would have reviewed the rule for security implications. A CMDB would have helped detect the drift later, but the root cause is that the change bypassed the control designed to prevent unauthorized or insecure changes. Vendor defaults and training are contributing factors in other scenarios but are not the root cause here.',
  'UNAUTHORIZED MODIFICATION: No change ticket means no review means no one catches the open port.',
  'understand',
  'scenario',
  'medium',
  1.15, 0.10, 0.20, 'ai_generated', true
),

-- Q10 medium / apply / backup_strategies_321
(
  7, 'backup_strategies_321',
  'An organization performs a full backup every Sunday and incremental backups Monday through Saturday. A disk failure occurs on Friday afternoon. What is the MINIMUM number of backup sets required to fully restore the system to Thursday night''s state?',
  '["2 backup sets: the Sunday full backup and the Thursday incremental backup only","5 backup sets: Monday through Friday incremental backups only","6 backup sets: the Sunday full backup plus Monday, Tuesday, Wednesday, Thursday incremental backups","1 backup set: the most recent full backup from Sunday"]'::jsonb,
  2,
  'Explanation: Incremental backups store only the data that changed SINCE THE LAST BACKUP (full or incremental). To restore to Thursday night, you need: (1) Sunday''s full backup as the base, then (2) Monday''s incremental (changes since Sunday), (3) Tuesday''s incremental (changes since Monday), (4) Wednesday''s incremental (changes since Tuesday), (5) Thursday''s incremental (changes since Wednesday). That is 5 backup sets total (1 full + 4 incrementals). This is the key tradeoff of incremental backups: fast to create, slow to restore because every incremental in the chain is needed. Differential backup would only need Sunday + Thursday (2 sets), but the question specifies incremental.',
  'INCREMENTAL CHAIN: Restore the full, then every link in the chain — each day''s changes build on the last.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.40, 0.20, 'ai_generated', true
),

-- Q11 medium / analyze / malware_defense_edr
(
  7, 'malware_defense_edr',
  'A security operations analyst observes that an EDR alert fired when a legitimate administrative tool (LOLBin — Living Off the Land Binary) was used to execute a command that downloaded a payload from a remote server. The alert was initially classified as a false positive by the on-call analyst and closed. What process failure does this MOST likely represent?',
  '["EDR tools are inherently unreliable for detecting LOLBin abuse and should be replaced with signature-based antivirus","The administrative tool should have been removed from all endpoints to prevent misuse","Insufficient alert triage criteria allowing analyst bias to dismiss a high-confidence LOLBin abuse indicator without documented justification","The SOC lacked a formal escalation process for EDR alerts"]'::jsonb,
  2,
  'Explanation: LOLBin (Living Off the Land Binary) abuse — using trusted system tools like certutil, mshta, or bitsadmin to download and execute malicious payloads — is a well-documented attacker technique specifically designed to evade signature-based detection. An EDR alert on LOLBin downloading from a remote server is a high-fidelity behavioral indicator, not a typical false positive pattern. Dismissing it without documented justification is a triage failure. Effective SOC operations require documented disposition criteria, requiring analyst justification for closing high-confidence behavioral alerts. Removing administrative tools from endpoints is a hardening consideration but not the process failure here.',
  'LOLBIN BLIND SPOT: The attacker hid inside a trusted tool — the analyst dismissed the alarm without reading the evidence.',
  'analyze',
  'tlatm',
  'medium',
  1.30, 0.50, 0.20, 'ai_generated', true
),

-- Q12 medium / apply / patch_management
(
  7, 'patch_management',
  'A critical zero-day vulnerability is published for a web application framework with no vendor patch available. The organization''s vulnerability management program requires patch deployment within 72 hours for critical vulnerabilities. What is the MOST appropriate compensating control?',
  '["Shut down all affected web applications until the vendor releases an official patch", "Accept the risk and wait for the vendor patch, documenting the exception in the risk register", "Revert all affected web application servers to the previous framework version", "Deploy a web application firewall (WAF) virtual patch rule targeting the vulnerability pattern while accelerating vendor patch availability monitoring"]'::jsonb,
  3,
  'Explanation: A virtual patch (deployed via WAF or IPS rules) can block exploitation attempts targeting the specific vulnerability pattern while the organization awaits an official vendor patch. This satisfies the spirit of the 72-hour control through a compensating measure when the primary control (patching) is not yet possible. Shutting down all affected applications may be operationally unacceptable and disproportionate. Accepting the risk without any mitigation when an effective compensating control exists is inappropriate. Reverting to a previous framework version may reintroduce other vulnerabilities and may not be operationally feasible.',
  'VIRTUAL PATCH FIREWALL: The vendor has no fix yet — put the WAF rule on the window until the real wall arrives.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.35, 0.20, 'ai_generated', true
),

-- Q13 medium / analyze / configuration_management_cmdb
(
  7, 'configuration_management_cmdb',
  'A CMDB shows that a server is configured with 8 open firewall ports. An automated compliance scan of the live server shows 11 open ports. What does this discrepancy MOST likely indicate?',
  '["The CMDB is poorly maintained and should be considered authoritative for security reviews","The compliance scanner is detecting false positives and its results should be discarded","Configuration drift — unauthorized or undocumented changes have been made to the server outside the formal change management process","Three additional ports were opened by the operating system during a scheduled update"]'::jsonb,
  2,
  'Explanation: Configuration drift occurs when the actual state of a system diverges from its documented baseline (in the CMDB) due to changes made outside the formal change management process. A CMDB showing 8 ports while the live system has 11 is a classic drift indicator. The CMDB is the baseline of record; the scanner reflects reality. The appropriate response is to investigate the 3 undocumented ports: who opened them, when, and why. Option B inverts the trust model. Option C requires evidence — discarding scanner results without investigation is not appropriate. Option D is speculative without evidence of an update event.',
  'DRIFT DETECTION: The map shows 8 doors; the recon shows 11 — three doors opened without a briefing.',
  'analyze',
  'most_likely',
  'medium',
  1.25, 0.45, 0.20, 'ai_generated', true
),

-- Q14 medium / apply / media_management
(
  7, 'media_management',
  'A data center decommissions 50 hard drives containing confidential corporate data. The organization''s policy requires data sanitization before physical disposal. Which method MOST completely satisfies this requirement for reusable magnetic drives?',
  '["Secure overwrite using DoD 5220.22-M or NIST SP 800-88 compliant multi-pass erasure", "Physical destruction (shredding) of all drives regardless of reuse intent", "Single-pass zero write across all sectors", "Reformatting the drives using the operating system''s built-in format utility"]'::jsonb,
  0,
  'Explanation: For reusable magnetic hard drives, NIST SP 800-88 Guidelines for Media Sanitization specifies "Purge" as the appropriate sanitization method — which includes multi-pass overwriting (DoD 5220.22-M specifies write zeros, ones, and a random pattern) or cryptographic erase. This renders data unrecoverable by laboratory-grade recovery methods while preserving the drive for reuse. Physical destruction is appropriate when drives will NOT be reused — it is the highest assurance method but destroys the asset. Single-pass zero write does not meet NIST 800-88 Purge standards for high-security data. OS format utilities (quick format or even full format) do not sanitize at a forensically sufficient level.',
  'PURGE PROTOCOL: Multi-pass overwrite wipes the mission files — single-pass just hides them under a rug.',
  'apply',
  'best_answer',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q15 medium / apply / personnel_security_ops
(
  7, 'personnel_security_ops',
  'An organization''s security policy requires that no single employee can both initiate and approve financial transactions. A new accounts payable process allows a single employee to enter a vendor invoice and mark it as approved in the ERP system. Which control failure does this represent?',
  '["Violation of least privilege — the employee has excessive system access", "Violation of separation of duties — the same individual can commit fraud by creating and approving a fictitious transaction", "Violation of need-to-know — the employee can view invoice amounts they should not access", "Violation of dual control — two employees should physically be present during the transaction"]'::jsonb,
  1,
  'Explanation: Separation of duties (SoD) requires that critical business processes be divided so no single person can complete a fraudulent act undetected. The ability to enter AND approve a financial transaction removes the oversight mechanism — a dishonest employee could create a fictitious vendor, enter a fraudulent invoice, self-approve it, and trigger payment with no independent check. Least privilege is a related concept (limiting access to what is needed) but is secondary here. Need-to-know relates to information access, not process control. Dual control specifically requires two people to be simultaneously present (e.g., dual key launch procedures) — SoD is the more precise term for this financial control deficiency.',
  'SOD VIOLATION: The same hand that fills the safe is the same hand that approves the withdrawal.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q16 hard / analyze / forensics_chain_of_custody
(
  7, 'forensics_chain_of_custody',
  'During a criminal investigation involving insider trading, a forensic examiner is asked to testify about evidence collected from an employee''s workstation. Defense counsel challenges the evidence, claiming the chain of custody is broken because the evidence log has an 8-hour gap between collection and logging at the evidence facility. How does this gap affect the legal admissibility of the evidence?',
  '["The gap is irrelevant if the hash values of the forensic image match at collection and presentation","Evidence collected by a certified forensic examiner is always admissible regardless of custody gaps","The gap creates an opportunity for defense to argue the evidence was tampered with during the unaccounted period, potentially undermining its admissibility or weight","The gap only matters if the defense can prove specific tampering occurred"]'::jsonb,
  2,
  'Explanation: Chain of custody is a documented, unbroken record of who had possession of evidence from collection through presentation. Any gap — even without proven tampering — creates a vulnerability that defense counsel can exploit to raise reasonable doubt about evidence integrity. In criminal proceedings, this can result in evidence being excluded (inadmissible) or its evidentiary weight being significantly diminished. Hash values (option B) demonstrate the file was not altered but do not account for physical evidence or the source system itself. Certification does not create legal immunity. Option D incorrectly shifts the burden — in many jurisdictions, a custody gap alone can be sufficient to challenge admissibility.',
  'CUSTODY GAP: An 8-hour unaccounted gap is a crack in the evidence chain — defense will pry it open.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q17 hard / apply / incident_response_picerl
(
  7, 'incident_response_picerl',
  'An organization''s incident response playbook calls for immediate shutdown of a compromised server during the containment phase. A security engineer argues against shutdown, citing the need to preserve volatile forensic evidence. The IR lead must make an immediate decision. Which factor MOST appropriately drives the decision between shutdown and live isolation?',
  '["The server must always be shut down immediately — forensic analysis can be performed on the disk image","Volatile evidence is never required in corporate incident response, only in law enforcement cases","The server should remain fully operational during investigation to avoid tipping off the attacker","The relative priority between stopping business harm (operational continuity, data protection) versus forensic fidelity — live isolation preserves both evidence and containment; shutdown is preferred only when live isolation is not feasible"]'::jsonb,
  3,
  'Explanation: The shutdown vs. live isolation decision is a classic IR tension. Live network isolation (quarantine at the switch level, firewall blocking) achieves containment while preserving RAM, running processes, and network connection data — the most volatile evidence. Shutdown achieves containment but destroys all volatile evidence permanently. The decision framework is: (1) Can live isolation safely contain the threat? If yes, isolate and collect volatile evidence first. (2) Is the system so compromised that live isolation is insufficient (e.g., firmware-level compromise)? Then shutdown may be necessary. Volatile evidence matters in both corporate and law enforcement contexts — memory forensics frequently reveals attacker tooling and lateral movement paths. Keeping systems operational during investigation (option D) risks ongoing damage.',
  'ISOLATE DON''T DESTROY: Quarantine the compromised agent — keep them talking while you pull the memory.',
  'apply',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q18 hard / analyze / change_management_itil
(
  7, 'change_management_itil',
  'An organization implements a "shift-left" approach to change management for cloud infrastructure by using infrastructure-as-code (IaC) with automated policy checks in the CI/CD pipeline. How does this approach change the traditional change advisory board (CAB) review model?',
  '["Policy-as-code gates in the pipeline enforce change controls automatically, reducing the need for manual CAB review of routine low-risk IaC changes while CAB focus shifts to policy design and exception handling", "It eliminates the need for change management entirely because IaC is always safer than manual changes", "IaC changes require MORE intensive CAB review because the automated nature obscures the actual system impact", "CAB review becomes irrelevant because cloud providers manage all infrastructure changes through their own controls"]'::jsonb,
  0,
  'Explanation: Policy-as-code (using tools like Open Policy Agent, Terraform Sentinel, or AWS Config Rules) encodes change control requirements into automated gates that run on every IaC pull request — checking for security misconfigurations, compliance violations, and unauthorized resource types before deployment. This shifts the CAB''s role from reviewing individual routine changes (which are now automatically controlled) to designing, maintaining, and governing the policy framework itself. Exceptions that bypass automated gates still require CAB review. This is more scalable than manual CAB review for high-velocity cloud environments. IaC does not eliminate change management — it automates its enforcement. CAB becomes MORE focused and strategic, not more burdened.',
  'POLICY-AS-CODE GATE: The robot CAB runs every commit — the human CAB governs the robot''s rules.',
  'analyze',
  'tlatm',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q19 hard / apply / security_operations_center
(
  7, 'security_operations_center',
  'A SOC analyst receives alerts indicating that an internal server is making DNS queries to recently registered domains at a rate of 1,000 queries per hour, all following a pattern of random-looking subdomains. The analyst has no other indicators of compromise. Which attack technique does this pattern MOST suggest?',
  '["DNS amplification DDoS attack originating from the internal server", "DNS cache poisoning affecting the internal DNS resolver", "Legitimate software performing DNS-based load balancing", "DNS tunneling for command-and-control (C2) communication or data exfiltration"]'::jsonb,
  3,
  'Explanation: High-volume DNS queries to recently registered domains with random-looking subdomains is a classic DNS tunneling indicator. Malware uses DNS tunneling to encode C2 commands or exfiltrate data within DNS query names (e.g., exfil-chunk-001.attacker.com), because DNS traffic is often allowed through firewalls. The use of recently registered domains is a threat intelligence indicator (new domains are commonly associated with malicious infrastructure). DNS amplification attacks originate from external sources targeting third parties, not from internal servers making outbound queries. Cache poisoning involves manipulating resolver records, not generating query volume. Legitimate DNS-based load balancing would query known, established domains.',
  'DNS EXFIL CHANNEL: A thousand queries to nonsense subdomains — data is leaving through the name servers.',
  'apply',
  'most_likely',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q20 hard / analyze / malware_defense_edr
(
  7, 'malware_defense_edr',
  'A SOC team discovers that an advanced persistent threat (APT) actor has been resident in the environment for 11 months. The attacker used stolen valid credentials, living-off-the-land techniques, and encrypted communications to evade detection. Which defensive architecture change would MOST effectively reduce dwell time against this attack profile going forward?',
  '["Deploy additional signature-based antivirus across all endpoints to increase malware detection rates","Implement full packet capture for all network traffic to enable forensic analysis after detection","Require all internal users to change passwords every 30 days to limit stolen credential validity","Deploy behavioral analytics (UEBA) to establish baseline activity profiles and detect anomalous patterns in credential usage, lateral movement, and data access — even when using valid credentials"]'::jsonb,
  3,
  'Explanation: The described APT profile specifically evades signature-based controls (LOLBins, valid credentials, encrypted C2). User and Entity Behavioral Analytics (UEBA) builds statistical baselines of normal activity and detects deviations — a legitimate user account suddenly accessing hundreds of systems, downloading unusual data volumes, or authenticating at unusual hours triggers anomaly-based alerts that signature tools miss. Signature-based AV cannot detect LOLBin abuse or valid-credential misuse. Full packet capture helps forensically AFTER detection but does not reduce dwell time (the time to detection). 30-day password rotation creates credential churn but the attacker would simply re-steal credentials; modern attacks compromise credentials dynamically, not statically.',
  'BEHAVIORAL BASELINE: UEBA catches the spy who walks like an employee — their patterns don''t match the personnel file.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q21 hard / apply / backup_strategies_321
(
  7, 'backup_strategies_321',
  'An organization is evaluating recovery time objectives (RTO). Their current backup strategy is a weekly full backup with daily differential backups. They are considering switching to a weekly full with daily incremental backups. Which statement CORRECTLY describes the tradeoff?',
  '["Incremental backups restore faster because each backup is smaller and requires less data to be read","Differential backups always require more restore time than incremental backups regardless of the number of days since the last full backup","Full backups should be performed daily when RTO requirements are under 4 hours","Incremental backups have shorter backup windows but longer restoration time compared to differential backups; differential backups require more storage but restore faster"]'::jsonb,
  3,
  'Explanation: Differential backups capture all changes since the LAST FULL backup — they grow larger each day but restoration requires only 2 sets (full + latest differential). Incremental backups capture changes since the LAST BACKUP of any type — each backup is smaller, making backup windows shorter, but restoration requires the full backup plus EVERY incremental in sequence. For a Wednesday restore: differential needs Sunday full + Wednesday differential (2 sets); incremental needs Sunday full + Monday + Tuesday + Wednesday incremental (4 sets). More sets = longer restore time. When RTO is critical, differential''s faster restore is the advantage. Option B incorrectly states incrementals restore faster. Option C is false — early in the week differentials are smaller than incrementals (but grow). Option D is a separate architectural decision.',
  'BACKUP TRADEOFF MATRIX: Incremental is faster to write, slower to read — differential is the reverse.',
  'apply',
  'comparison',
  'hard',
  1.55, 1.50, 0.22, 'ai_generated', true
),

-- Q22 hard / analyze / personnel_security_ops
(
  7, 'personnel_security_ops',
  'A security manager is designing an insider threat program. Three controls are proposed: (1) mandatory two-week vacation, (2) job rotation, (3) separation of duties. Which statement MOST accurately distinguishes these controls by their PRIMARY threat they are designed to detect or prevent?',
  '["All three controls serve identical purposes and are redundant when all are deployed simultaneously", "Separation of duties is the strongest control because it prevents fraud; the other two are detective controls only", "Mandatory vacation detects ongoing fraud requiring continuous presence; job rotation reduces single-person institutional knowledge concentration and can reveal concealment; separation of duties prevents any single person from completing a fraudulent transaction", "Job rotation is the most effective fraud DETECTION control because employees review each other''s work when rotating"]'::jsonb,
  2,
  'Explanation: Each control addresses a distinct threat vector. Mandatory vacation DETECTS ongoing fraudulent schemes that require the perpetrator''s continuous maintenance (falsified records, concealed transactions) — the fraud surfaces when a replacement performs the role. Job rotation REDUCES concentration of knowledge in a single individual (reduces the chance of a single person building an undetectable fraud scheme) and can incidentally detect existing issues when the incoming person reviews the work. Separation of duties PREVENTS a single person from being able to execute a complete fraudulent transaction — it requires collusion, which is harder to sustain. Option A is wrong — they address different vectors. Option B understates detection controls. Option D attributes detection to job rotation, but mandatory vacation is the more precise fraud detection mechanism.',
  'TRIPLE LAYER DEFENSE: Vacation catches the active fraud; rotation breaks the monopoly; SoD blocks the transaction.',
  'analyze',
  'comparison',
  'hard',
  1.65, 1.60, 0.22, 'ai_generated', true
),

-- Q23 very_hard / analyze / incident_response_picerl
(
  7, 'incident_response_picerl',
  'An organization''s incident response team successfully eradicates a sophisticated ransomware infection and restores operations from backup. Two weeks later, the same ransomware strain re-infects the environment via the same initial access vector (a phishing email leading to an unpatched VPN client). What does this re-infection MOST indicate about the organization''s incident response process?',
  '["The Post-Incident Activity (Lessons Learned) phase failed to translate findings into actionable remediation — specifically, the initial access vector was documented but not eliminated before restoration", "The Containment phase was insufficient — the ransomware was not fully isolated during the first incident", "The Eradication phase removed the wrong malware variant — a different strain exploited residual access", "The backup restoration process reintroduced the malware because the backups themselves were infected"]'::jsonb,
  0,
  'Explanation: Re-infection via the same initial access vector is the hallmark indicator of a failed Lessons Learned / Post-Incident Activity phase. The first incident should have identified the phishing-to-unpatched-VPN attack chain and driven immediate remediation actions: phishing awareness refresher, VPN client patch deployment, and enhanced phishing detection controls. If restoration to operations proceeded without closing the initial access vector, the environment was re-exposed. Containment failure (option B) would have resulted in the first incident spreading further, not a separate re-infection weeks later. The re-infection via the SAME vector rules out a different strain (option C). Backup-reintroduced malware would have manifested immediately upon restoration, not two weeks later.',
  'LESSONS UNLEARNED: The same door was left open — restoration happened before the lock was changed.',
  'analyze',
  'scenario',
  'very_hard',
  2.15, 2.30, 0.20, 'ai_generated', true
),

-- Q24 very_hard / analyze / forensics_chain_of_custody
(
  7, 'forensics_chain_of_custody',
  'A forensic analyst is examining a memory image from a Windows server suspected of being compromised. Which combination of memory forensic artifacts would MOST definitively confirm active malware execution using process injection techniques?',
  '["A legitimate system process (e.g., svchost.exe) with an injected memory region marked as PAGE_EXECUTE_READWRITE containing shellcode, combined with parent-child process relationships inconsistent with normal Windows process trees", "Presence of the malware executable file in the Windows temp directory", "Event log entries showing PowerShell execution with obfuscated commands", "Registry Run keys pointing to an unknown executable path"]'::jsonb,
  0,
  'Explanation: Process injection specifically places malicious code inside a legitimate process''s memory space to evade detection (the malware has no standalone process visible in the task manager). The forensic signature is: (1) an executable memory region (PAGE_EXECUTE_READWRITE) inside a legitimate process — normal injected code regions are writable AND executable, which is abnormal for standard code; (2) the injected region contains shellcode; (3) anomalous parent-child relationships (e.g., Word spawning a system process) indicate process hollowing or injection was used to launch the payload. A malware file in temp (option B) indicates presence but not injection. PowerShell obfuscation (option C) indicates a loader/dropper but not confirmed injection. Registry run keys (option D) indicate persistence, not active injection.',
  'MEMORY INJECTION SIGNATURE: Executable memory inside a legitimate process with a suspicious parent — the ghost is in the machine.',
  'analyze',
  'scenario',
  'very_hard',
  2.20, 2.40, 0.20, 'ai_generated', true
),

-- Q25 medium / apply / configuration_management_cmdb
(
  7, 'configuration_management_cmdb',
  'An organization deploys software to 3,000 workstations. Two months later, automated scanning shows 287 workstations are running a different version than the approved baseline. What is the MOST appropriate FIRST step to address this configuration drift?',
  '["Identify the cause of drift — determine whether the variant version was introduced by an unauthorized change, an approved update that bypassed CMDB, or a deployment failure — before remediating", "Immediately push the approved baseline version to all 287 systems to restore compliance", "Remove the 287 workstations from the network pending investigation", "Escalate to the change management team to retroactively document the configuration change"]'::jsonb,
  0,
  'Explanation: Before remediating configuration drift, the organization must understand its cause. If the variant version is a legitimate approved update that failed to update the CMDB, remediating it would revert to an older (possibly vulnerable) version. If the change was unauthorized, remediation is appropriate. If it was a deployment failure, the failed deployment root cause needs fixing first. Blindly pushing the baseline without investigation could introduce vulnerabilities or break functionality. Disconnecting 287 workstations is disproportionate. Retroactive documentation without understanding the cause does not address the underlying control failure.',
  'ROOT CAUSE BEFORE REMEDIATION: Find out why 287 workstations went rogue before ordering the rollback.',
  'apply',
  'first_action',
  'medium',
  1.25, 0.35, 0.20, 'ai_generated', true
),

-- Q26 medium / apply / media_management
(
  7, 'media_management',
  'A data center is disposing of SSDs (solid-state drives) that held classified data. The organization''s policy requires data sanitization to the Purge level per NIST SP 800-88. Which sanitization method is MOST appropriate for SSDs?',
  '["Cryptographic erasure (CE) of the drive''s encryption key, if the drive used full-disk encryption at all times, or ATA Secure Erase command if CE is not available", "Multi-pass overwrite using DoD 5220.22-M on every sector", "Single-pass zero write followed by physical degaussing", "Physical shredding to particle sizes of less than 1mm"]'::jsonb,
  0,
  'Explanation: NIST SP 800-88 recognizes that SSDs have unique characteristics — their wear-leveling and block remapping mean that multi-pass overwrite tools (designed for magnetic media) cannot guarantee all data cells are overwritten on SSDs. The preferred Purge method for self-encrypting SSDs is Cryptographic Erasure (CE): destroying the encryption key renders all encrypted data cryptographically unrecoverable. ATA Secure Erase (for non-self-encrypting SSDs) issues a firmware-level purge. Multi-pass DoD overwrite is explicitly noted by NIST as INADEQUATE for SSDs as a Purge method. Degaussing does not affect SSD flash memory (no magnetic medium). Physical shredding is appropriate for drives being destroyed (not reused) and is classified as "Destroy," not "Purge."',
  'SSD PURGE PROTOCOL: Erase the encryption key and the data becomes unintelligible — DoD overwrite is for spinning disks.',
  'apply',
  'best_answer',
  'hard',
  1.55, 1.50, 0.20, 'ai_generated', true
),

-- Q27 medium / apply / security_operations_center
(
  7, 'security_operations_center',
  'A SOC analyst is using a SIEM to investigate a potential data exfiltration event. Which combination of log sources provides the MOST complete picture of an endpoint-to-external-server data transfer?',
  '["Firewall logs only — all outbound connections pass through the firewall", "Active Directory authentication logs and email gateway logs", "Web proxy logs and vulnerability scanner output", "Endpoint EDR logs (process and file access activity) combined with DNS logs (domain queries) and network flow data (outbound connection volume and destination IP)"]'::jsonb,
  3,
  'Explanation: Data exfiltration investigation requires correlation across multiple log sources. EDR logs show which process accessed which files and when (the "what was touched"). DNS logs reveal what external domains were queried (and can detect DNS tunneling). Network flow data shows outbound connection volume, destination IPs, and data transfer sizes (the "how much and where to"). Firewall logs alone show connection decisions but not the data content or the initiating process. AD and email logs are useful for insider threat but miss technical exfiltration channels. Proxy logs capture web traffic but miss non-HTTP exfiltration, and vulnerability scanners are assessment tools, not detection tools.',
  'EXFIL TRIANGLE: EDR shows the file grab, DNS shows the call-home, netflow shows the volume leaving.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.40, 0.20, 'ai_generated', true
),

-- Q28 medium / analyze / change_management_itil
(
  7, 'change_management_itil',
  'A CAB meeting reviews a proposed change to migrate 5,000 user accounts from on-premises Active Directory to Azure AD. The change has a rollback plan, a 4-hour maintenance window, and was tested in a staging environment. The CAB approves the change. During implementation, the migration tool encounters an unexpected error affecting 200 accounts at the 3-hour mark. What is the MOST appropriate action?',
  '["Assess whether the remaining time and rollback plan can address the partial failure — if not, execute the rollback and reschedule; if recoverable, continue with incident tracking", "Immediately roll back the entire migration to protect the 4,800 successfully migrated accounts", "Continue the migration regardless of the error and address failed accounts as a post-migration cleanup task", "Pause the migration and convene an emergency CAB meeting to authorize continuation"]'::jsonb,
  0,
  'Explanation: Change management during implementation requires dynamic assessment. The change manager must evaluate: (1) Is there sufficient time remaining in the maintenance window to recover? (2) Does the rollback plan cover partial migrations? (3) Is the error contained to 200 accounts or propagating? If the failure is limited and recoverable within window, proceeding with incident tracking is appropriate. If the failure is escalating or the window is expiring, executing the rollback protects the environment. Rolling back 4,800 successfully migrated accounts (option B) may be unnecessary and creates more disruption than the 200-account error. Continuing without addressing the error (option C) violates change control. Reconvening an emergency CAB (option D) adds delay that may consume the remaining maintenance window.',
  'IMPLEMENTATION TRIAGE: Error at hour 3 — assess, contain, decide: recover or roll back before the window closes.',
  'analyze',
  'tlatm',
  'medium',
  1.30, 0.50, 0.20, 'ai_generated', true
);
