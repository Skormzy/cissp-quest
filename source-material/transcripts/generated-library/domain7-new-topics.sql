-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 7 (Security Operations)
-- Topics: 7.5.1 through 7.9.1
-- Source basis: ISC2 CBK, NIST SP 800-61r2 (incident response),
--               NIST SP 800-86 (forensics), ITIL 4 change management,
--               NIST SP 800-34 (BCP/DRP), and public-domain knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 7.5.1 Incident Response Process
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  7,
  '7.5.1',
  'Incident Response Process',
  'Incident response follows the PICERL lifecycle (Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned) per NIST SP 800-61r2 — with a cross-functional IR team, documented evidence handling procedures, and post-incident review driving program improvement.',
  '## Incident Response Process

An **incident** is an event that actually or potentially jeopardizes the confidentiality, integrity, or availability of an information system or the information it processes. Incident response is the organized approach to addressing and managing the aftermath of a security incident. Per NIST SP 800-61r2 (Computer Security Incident Handling Guide), effective incident response minimizes damage, reduces recovery time, and prevents similar incidents from recurring.

### The PICERL Lifecycle

The CISSP exam uses the **PICERL** acronym for the six phases of incident response:

**Preparation**: Building the capability to respond before incidents occur. Preparation includes: establishing and training the Computer Security Incident Response Team (CSIRT), documenting the Incident Response Plan (IRP), establishing communication procedures (including out-of-band communication channels for when primary systems are compromised), deploying detection and monitoring tools (SIEM, EDR, IDS/IPS), establishing relationships with external resources (law enforcement liaison, forensic firms, legal counsel, PR/communications), and practicing through tabletop exercises and simulations. Preparation is the most important phase — it determines the quality of every subsequent phase.

**Identification**: Detecting that an incident has occurred and determining its nature and scope. Detection may come from automated alerting (SIEM correlation rule, EDR detection), user reports, third-party notification (threat intelligence, law enforcement), or chance discovery. Identification requires triaging alerts to distinguish actual incidents from false positives, establishing the initial scope (which systems, what data, what time period), and formally declaring an incident when appropriate. The triage decision determines whether an alert escalates to an active incident or is closed as a false positive.

**Containment**: Limiting the spread and impact of the incident. Containment strategy depends on operational requirements: short-term containment (immediate isolation of affected systems) must be balanced against business continuity needs (you may not be able to take a critical production system offline immediately). Containment options range from network isolation (firewall rule to block a compromised host) to disabling compromised accounts to removing malicious network access entirely. Forensic evidence must be preserved during containment — do not wipe systems before imaging them.

**Eradication**: Removing the threat from the environment. This includes identifying and eliminating malware, closing the vulnerability that was exploited, removing attacker-created accounts or persistence mechanisms, and addressing all compromised systems — not just the initially identified ones (lateral movement must be fully mapped before eradication). Eradication without thorough investigation risks leaving attacker persistence in place.

**Recovery**: Restoring affected systems to normal operation. Recovery includes: reinstalling from clean media, restoring from clean backups, applying patches, resetting compromised credentials, gradually restoring network access, and monitoring closely for signs of re-infection or attacker return. Recovery must be validated — do not declare recovery complete until enhanced monitoring confirms the threat has been fully eliminated.

**Lessons Learned**: Post-incident review conducted within days of incident resolution while details are fresh. The lessons learned meeting should address: what happened, when, and what was the impact? What was the timeline of detection and response? What did we do well? What could we do better? What process, tool, or policy changes are needed to prevent recurrence or improve future response? The output of lessons learned drives direct program improvement — it closes the feedback loop.

### IR Team Roles

A CSIRT includes:
- **Incident Commander**: Coordinates overall response and decision-making
- **Technical Lead/Analyst**: Leads technical investigation
- **Legal Counsel**: Advises on evidence handling, regulatory notification obligations, and liability
- **Communications/PR**: Manages internal and external communications
- **Business/Operations Representatives**: Prioritize business impact and make containment tradeoff decisions
- **HR**: Involved when the incident involves an employee (insider threat scenarios)
- **Executive Sponsor (CISO/CIO)**: Authority for resource decisions and escalation

### Evidence Handling

Evidence collected during incident response must follow disciplined handling procedures to maintain forensic integrity and chain of custody. Log files, disk images, memory captures, and network captures must be hashed (SHA-256) at collection time, stored in tamper-evident formats, and documented in a chain of custody form tracking every person who accessed the evidence and when.',
  NULL,
  '{"headers": ["Phase", "Objective", "Key Activities", "Common Mistakes"], "rows": [["Preparation", "Build response capability before incidents occur", "IRP documentation, CSIRT training, tool deployment, tabletop exercises", "Treating IR as ad-hoc response rather than a program requiring preparation"], ["Identification", "Detect and characterize the incident", "Alert triage, initial scope assessment, incident declaration", "Delayed escalation due to uncertainty; too-narrow initial scope assessment"], ["Containment", "Stop the bleeding — limit spread and impact", "Network isolation, account disabling, firewall rules; evidence preservation", "Wiping systems before forensic imaging; over-aggressive containment that destroys evidence"], ["Eradication", "Remove the threat completely", "Malware removal, vulnerability patching, persistence mechanism elimination", "Declaring eradication complete without mapping full lateral movement extent"], ["Recovery", "Restore normal operations safely", "Clean reinstall, backup restoration, patching, monitoring, gradual restoration", "Rushing recovery without validating threat elimination; insufficient post-recovery monitoring"], ["Lessons Learned", "Learn and improve", "Post-incident review meeting, documentation, program improvement actions", "Skipping the meeting because the team is tired; blame culture that prevents honest discussion"]]}'::jsonb,
  'Incident response exam areas: (1) Know PICERL phases in order. (2) Preparation is the most important phase for effectiveness. (3) Lessons Learned closes the feedback loop — occurs AFTER recovery. (4) Containment must balance isolation with evidence preservation — never wipe a system before forensic imaging. (5) The exam distinguishes between events (observable occurrence) and incidents (events that jeopardize CIA). (6) Chain of custody must be maintained from the moment of evidence collection. NIST SP 800-61r2 is the governing framework.',
  'As a manager, the quality of your incident response is determined in the months before an incident, not during it. Preparation and practice — specifically tabletop exercises — are the highest-leverage investments in incident response capability. When a real incident occurs, your team should be executing a practiced playbook, not improvising. The lessons learned phase is where many programs fail: after a stressful incident, the tendency is to declare victory and move on. Forcing a structured post-mortem within 72 hours of resolution, with no blame and full psychological safety, produces the most valuable program improvements.',
  'PICERL — Police Investigations Complete Every Righteous Lesson: Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned. Or think of a fire: Prepare (smoke detectors), Identify (fire alarm), Contain (close doors), Eradicate (extinguish), Recover (rebuild), Lessons Learned (update fire code). Never skip Lessons Learned — that''s where the next fire is prevented.',
  'In the SOC War Room in New York, a major ransomware incident is in progress. The Incident Commander boards are clear: Phase 1 (Preparation) items are pre-checked — IRP available, CSIRT on call, forensic firm on retainer. Now in Phase 2 (Identification): the SIEM alert confirmed ransomware encryption starting at 2:14 AM on the file server. Phase 3 (Containment): network team isolates the file server VLAN — but only after forensic imaging (evidence before isolation order is never reversed). Phase 4 (Eradication): malware family identified, initial access vector found (phishing email from 72 hours ago). Phase 5 (Recovery): clean restore from last night''s verified backup starts at 6 AM. Phase 6 (Lessons Learned): scheduled for 72 hours post-resolution — same room, full team, no blame, action items with owners.'
);

-- ---------------------------------------------------------------------------
-- 7.6.1 Digital Forensics
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  7,
  '7.6.1',
  'Digital Forensics',
  'Digital forensics follows the order of volatility to collect evidence from most to least ephemeral; forensic imaging creates bit-exact copies verified by hash; write blockers prevent evidence contamination; and chain of custody documentation ensures evidence is admissible in legal proceedings.',
  '## Digital Forensics

Digital forensics is the application of scientific methods to the collection, preservation, examination, and analysis of digital evidence in a manner that maintains its integrity and admissibility in legal proceedings. The CISSP exam tests foundational forensics principles — especially the order of volatility, forensic imaging, write blockers, and chain of custody — that govern how evidence is handled from the moment of discovery through potential court presentation.

### Order of Volatility

Digital evidence varies in how quickly it disappears. The **order of volatility** (RFC 3227 — Guidelines for Evidence Collection and Archiving) defines the sequence in which evidence should be collected: most volatile first, least volatile last. Collecting volatile evidence before it is lost to system operation or power loss is critical.

From most to least volatile:
1. **CPU registers, caches, and in-flight network data**: Milliseconds to seconds of lifetime; lost immediately on power-off
2. **RAM (system memory)**: Contains running processes, encryption keys, network connections, decrypted file contents, user credentials — lost on power-off. Live memory forensics (capturing RAM image while system is running) is now standard practice
3. **Temporary files and swap/page files**: Partially volatile — swap files persist to disk but are overwritten during operation
4. **Disk (storage)**: Persistent — survives power-off. The primary forensic evidence source but requires careful handling
5. **Remote logging (SIEM/syslog)**: May still exist in centralized log stores even if local logs are deleted
6. **Physical media (backups, optical)**: Typically off-system; most persistent

The practical implication: before powering off a compromised system, attempt to capture RAM if live forensics is planned. If the system must be powered off (e.g., ransomware actively encrypting), document the decision and its rationale in the incident log.

### Forensic Imaging

A **forensic image** is a bit-for-bit, exact copy of a storage device — including unallocated space, deleted files (whose data remains until overwritten), and file system metadata. Forensic imaging tools (FTK Imager, dc3dd, dd with verification) create the image and simultaneously calculate a cryptographic hash (typically MD5 and SHA-1 or SHA-256) of both the source device and the resulting image. If the hashes match, the image is a verified exact copy — any subsequent modification to either the original or the image will produce a different hash.

**Forensic images are worked on exclusively — investigators analyze copies, never the original evidence.** The original device is sealed, hashed, and stored in an evidence locker. Multiple copies of the forensic image are made: one working copy for analysis, one archive copy retained in sealed storage.

### Write Blockers

A **write blocker** (also called a forensic bridge) is a hardware or software device that allows data to be read from a storage device while preventing any data from being written back to it. Connecting a suspect drive directly to a forensics workstation without a write blocker risks contaminating the evidence — the OS might write timestamps, cache files, or other metadata to the drive, altering its forensic state. Hardware write blockers are preferred over software write blockers for high-assurance forensic work because they are interposed between the drive and the system at the hardware level.

### Chain of Custody

**Chain of custody** is the continuous, documented record of who has had possession of or access to evidence from the moment of collection through analysis, storage, and potential court presentation. The chain of custody record documents:
- Who collected the evidence, when, and where
- How the evidence was packaged, labeled, and sealed
- Every person who has accessed the evidence and when
- Every location where the evidence has been stored
- Every analysis performed and by whom

A break in the chain of custody — evidence left unattended, undocumented, or accessed without documentation — can render the evidence inadmissible in legal proceedings. The opposing party can argue that the evidence may have been tampered with during the undocumented period.

### Live vs Post-Mortem Forensics

**Live forensics**: Analysis performed on a running system. Captures volatile data (RAM, network connections, running processes) that would be lost on shutdown. Requires careful documentation because the act of analysis (running forensic tools, network traffic) modifies the system.

**Post-mortem forensics**: Analysis performed on forensic images after the system is powered off. Standard for disk analysis. The forensic image is verified by hash, then analyzed offline without risk of further contamination.',
  NULL,
  '{"headers": ["Evidence Type", "Volatility", "Survives Power-Off?", "Collection Method", "Primary Forensic Value"], "rows": [["CPU registers/cache", "Extremely high (milliseconds)", "No", "Specialized hardware (rare)", "Encryption keys in use, current instruction pointer"], ["RAM (system memory)", "Very high (seconds to minutes)", "No", "Live memory imaging (FTK Imager, WinPmem, LiME)", "Encryption keys, credentials, running processes, network connections, decrypted file content"], ["Swap/Page file", "Medium", "Yes (disk-based)", "Forensic disk image", "Fragments of previously decrypted/running content"], ["Hard disk / SSD", "Low (persistent)", "Yes", "Forensic image via write blocker", "File system, deleted files, logs, application data, artifacts"], ["SIEM/Remote logs", "Very low", "Yes (centralized)", "SIEM export with chain of custody", "Audit trail, authentication events, network events"], ["Backup media", "Very low", "Yes", "Evidence seizure with chain of custody", "Historical data; comparison to current state"]]}'::jsonb,
  'Digital forensics exam areas: (1) Order of volatility: RAM before disk, most volatile first. (2) Forensic imaging = bit-exact copy with hash verification. Work on copies, never the original. (3) Write blockers = prevent writing to evidence drive during imaging. (4) Chain of custody = continuous documented record of evidence possession. (5) Live forensics = running system (captures volatile). Post-mortem = powered-off system, forensic image analysis. (6) RFC 3227 is the order of volatility reference. NIST SP 800-86 provides forensics guidance.',
  'As a manager, your forensic capability directly determines your ability to investigate incidents and, when necessary, support legal action. Most organizations do not maintain in-house forensic expertise — they maintain a retainer with an external forensic firm that can be engaged within hours of incident declaration. The key is ensuring your internal IR team knows the first-responder forensics fundamentals: collect volatile evidence before shutdown, use write blockers, hash everything, document everything. The expensive forensic firm cannot undo contaminated evidence.',
  'ORDER: Registers, RAM, Swap, Disk, Remote logs, Archives (RRSDR-A). Most volatile = most urgent. Write blocker = the "no writing" sign on the evidence door. Forensic image = exact photocopy with fingerprint (hash). Chain of custody = the evidence''s travel diary — every hand it touched, documented. Never work on originals — always copies.',
  'In the SOC War Room in New York, the forensic response to last night''s breach begins at 7 AM. The forensic analyst arrives at the compromised server with a hardware write blocker and a forensic drive. First action: live memory capture while the server is still running (RAM first — order of volatility). System memory image: 64GB captured in 6 minutes, hashed immediately (SHA-256 verified). Server powered off. Write blocker attached between the server''s SSD and the forensic workstation. Forensic image captured: hash verified (source = image = confirmed exact copy). Evidence log signed. Original drive sealed with tamper-evident tape, chain of custody form attached, stored in the evidence locker. The analyst works on the forensic image copy from here. The chain of custody is unbroken.'
);

-- ---------------------------------------------------------------------------
-- 7.7.1 Change Management
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  7,
  '7.7.1',
  'Change Management',
  'Change management prevents unauthorized or poorly controlled changes from introducing vulnerabilities or outages — the RFC/CAB process ensures changes are reviewed, authorized, tested, and documented, while emergency change procedures balance speed with necessary controls for urgent security patches.',
  '## Change Management

Unauthorized or poorly controlled changes to information systems are one of the leading causes of security incidents and availability outages. A patching script applied without testing can crash production systems. A firewall rule change made without peer review can open a gap that attackers exploit. Change management provides the governance framework that ensures all changes to production systems are authorized, tested, documented, and reversible.

### The ITIL Change Management Framework

ITIL (IT Infrastructure Library) defines change management as the process for controlling the lifecycle of all changes to IT services, with the goal of enabling beneficial changes to be made with minimum disruption to IT services. ITIL 4 uses the term "Change Enablement" to emphasize that change management should facilitate beneficial change, not simply block it.

### Request for Change (RFC)

A **Request for Change (RFC)** is the formal document that initiates the change management process. It captures:
- Description of the proposed change and its business justification
- Systems and services affected
- Risk assessment (probability of failure, impact if change fails)
- Implementation plan (step-by-step)
- Test plan (how to verify the change was successful)
- Backout/rollback plan (how to reverse the change if it fails)
- Change window (when the change will be implemented)
- Resource requirements

The RFC is submitted before any change is implemented. Work performed before RFC approval is unauthorized change.

### Change Advisory Board (CAB)

The **CAB** is the body responsible for reviewing, evaluating, and authorizing changes. CAB membership typically includes: change manager, technical subject matter experts (infrastructure, network, application teams), business stakeholders, security representation, and operations leadership. The CAB meets regularly (weekly or bi-weekly for standard changes) to review RFCs and make authorization decisions.

For **significant changes** (major system upgrades, infrastructure replacements, organization-wide policy changes), an Emergency CAB (ECAB) or full CAB meeting may be required with broader stakeholder participation.

### Change Types

**Standard change**: Pre-approved, low-risk changes with documented procedures that have been previously reviewed and approved. Standard changes do not require individual RFC review each time — they follow a pre-approved standard operating procedure. Examples: deploying a standard software package, adding a user to an existing access group.

**Normal change**: Changes that follow the full RFC/CAB process. Scheduled, reviewed, and authorized through the standard process before implementation.

**Emergency change**: Changes that must be implemented urgently to prevent or resolve a critical incident — for example, a zero-day vulnerability requiring an emergency patch, or a critical security control that must be implemented immediately. Emergency changes bypass the standard scheduling and review process but must be documented as rapidly as possible. A post-implementation review and retrospective RFC documentation is required after the emergency change is implemented. Emergency changes carry higher risk because reduced review time means less opportunity to catch implementation problems.

### Configuration Drift

**Configuration drift** occurs when production systems gradually diverge from their approved baseline configuration due to ad-hoc, undocumented changes. Configuration drift can introduce vulnerabilities (settings that were intentionally configured for security are changed), create compliance gaps (systems no longer meet audit baselines), and cause operational instability (changes interact in unexpected ways). Configuration management tools (Ansible, Puppet, Chef, SCCM) detect and remediate drift by continuously comparing production configurations to approved baselines. Change management is the process control that prevents drift; configuration management tools are the technical enforcement.',
  NULL,
  '{"headers": ["Change Type", "Risk Level", "Requires RFC?", "Requires CAB Approval?", "Pre-Approved?", "Example"], "rows": [["Standard change", "Low (pre-evaluated)", "Yes (template-based)", "No — pre-approved category", "Yes", "Adding a user to a standard security group, scheduled OS patch from approved list"], ["Normal change", "Variable", "Yes (full RFC)", "Yes", "No", "Network segmentation change, application upgrade, new server deployment"], ["Emergency change", "High (urgency over process)", "Yes (retrospective/expedited)", "ECAB or senior approval only", "No", "Zero-day vulnerability emergency patch, critical security control implementation to stop active attack"]]}'::jsonb,
  'Change management exam areas: (1) RFC = formal change request document (authorization vehicle). (2) CAB = review and authorization body. (3) Standard changes are pre-approved; normal changes require individual CAB review; emergency changes require expedited approval with retrospective documentation. (4) Change management prevents unauthorized changes that could introduce vulnerabilities. (5) Configuration drift = unauthorized deviation from approved baseline — detected by configuration management tools. (6) A rollback plan is a required component of every RFC.',
  'As a manager, change management is security control that functions as an operational control. Unauthorized changes — whether made with good intentions or malicious ones — represent uncontrolled risk. The classic scenario is a network administrator making an "obvious" firewall rule change at 11 PM without going through the RFC process, opening a port that attackers exploit within hours. Change management exists to catch the non-obvious consequences of "obvious" changes. Enforce it consistently, including for your own team''s changes. The only legitimate exception is a genuine emergency, and even then document it immediately after.',
  'RFC-CAB = Request For Change, reviewed by Change Advisory Board. Standard (pre-approved, no debate needed), Normal (full review), Emergency (fast-track, document after). Rollback plan = the emergency exit from the change. Configuration Drift = the slow creep away from the approved map. Change management prevents it; configuration tools detect it.',
  'In the SOC War Room in New York, the change management board shows this week''s RFC queue. 14 normal changes approved by CAB last Tuesday — the network team is implementing VLAN segmentation this Saturday. 3 standard changes processed this week without CAB (standard OS patches within the pre-approved patch framework). And one Emergency Change from Wednesday: a zero-day in Apache Struts required an emergency patch to 47 production web servers at 2 AM; the ECAB approved verbally, implementation completed by 4 AM, retrospective RFC submitted and closed by end of business Thursday. The configuration drift dashboard shows 2 servers whose baseline configs were manually adjusted during the zero-day response — a standard RFC to update the baseline is in the queue.'
);

-- ---------------------------------------------------------------------------
-- 7.8.1 Backup and Recovery Strategies
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  7,
  '7.8.1',
  'Backup and Recovery Strategies',
  'Backup strategies balance storage cost and recovery time — full backups are complete but expensive, incremental saves only changes since the last backup, differential saves changes since the last full backup; the 3-2-1 rule and regular recovery testing ensure backups are actually usable when disasters strike.',
  '## Backup and Recovery Strategies

A backup strategy defines how, how often, and where copies of data are stored to enable recovery after data loss, corruption, ransomware, or disaster. Backup strategies must be designed around two key business requirements: **RTO (Recovery Time Objective)** — how quickly the business must be restored — and **RPO (Recovery Point Objective)** — how much data loss the business can tolerate. These requirements drive every backup architecture decision.

### RTO and RPO

**RTO (Recovery Time Objective)**: The maximum acceptable time from a disruption to the restoration of normal service. An RTO of 4 hours means the business must be operational within 4 hours of a disaster. RTO is driven by business impact: for an e-commerce platform processing $1M/hour, a 4-hour RTO represents $4M in lost revenue — the organization may be willing to invest heavily in high-availability systems. For a weekly batch reporting system, a 48-hour RTO may be perfectly acceptable.

**RPO (Recovery Point Objective)**: The maximum acceptable amount of data loss measured in time. An RPO of 24 hours means the organization can tolerate losing up to 24 hours of data. RPO determines backup frequency — if you backup daily, your RPO is approximately 24 hours. An RPO of 1 hour requires more frequent backups (continuous backup or transaction log shipping).

**MTD (Maximum Tolerable Downtime)**: The absolute maximum time the business can survive without the system before the organization itself fails (customers leave permanently, regulatory violations, existential damage). RTO must be less than MTD. MTD is the boundary; RTO is the target.

### Backup Types

**Full backup**: A complete copy of all selected data. Requires the most storage and the longest time to create, but provides the simplest recovery — restore the most recent full backup. Full backups are typically created weekly or monthly.

**Incremental backup**: Backs up only data that has changed since the most recent backup of any type (full or incremental). Incremental backups are small and fast to create. Recovery requires the last full backup plus every incremental backup since then — potentially many tapes/files, longer recovery time.

**Differential backup**: Backs up all data that has changed since the most recent full backup — regardless of whether incrementals have run since. Differential backups grow larger over the weekly cycle as more changes accumulate. Recovery requires only the last full backup plus the most recent differential — simpler than incremental recovery. Differential is the sweet spot for many organizations: small compared to full, simpler recovery than incremental.

### The 3-2-1 Rule

The **3-2-1 backup rule** is the foundational principle for backup resilience: keep **3** copies of data (primary + 2 backups), on **2** different media types or locations, with **1** copy offsite (geographically separate from primary). The 3-2-1 rule ensures that no single failure mode (hardware failure, theft, natural disaster, ransomware encrypting locally connected storage) destroys all copies of data. A modern extension is 3-2-1-1-0: an additional offline or immutable copy (1), with zero errors verified through regular recovery testing (0).

### Backup Testing: The Critical Gap

The most dangerous assumption in backup strategy is that backups work. Many organizations discover during an actual disaster that their backups are corrupt, incomplete, or too slow to meet RTO. Best practices include:

- **Regular recovery testing**: At least annually for full disaster recovery exercises; quarterly for individual system recovery tests
- **Automated verification**: Backup software that verifies backup integrity after each job (hash verification, test restores)
- **RTO validation**: Timed recovery exercises that measure actual recovery speed against stated RTO targets
- **Ransomware-resistant backups**: Immutable backups (cloud object storage with Object Lock, tape with air-gap) that cannot be encrypted or deleted by ransomware that compromises backup agents or credentials

### Site Recovery Options

**Cold site**: A facility with basic infrastructure (power, network connectivity, physical space) but no pre-installed equipment. Lowest cost, longest recovery time (days to weeks to procure and configure equipment).

**Warm site**: A facility with infrastructure and some equipment pre-configured, but not continuously updated with current data and configuration. Moderate cost, moderate recovery time (hours to days).

**Hot site**: A fully operational mirror of the primary site, continuously synchronized (or near-continuously). Highest cost, shortest recovery time (minutes to hours). Appropriate for systems with very low RTOs.',
  '[{"formula":"RPO determines backup frequency: if RPO = 4 hours, backups must occur at least every 4 hours","description":"Recovery Point Objective directly drives backup schedule — more frequent backups = smaller potential data loss window"}]'::jsonb,
  '{"headers": ["Backup Type", "What Is Backed Up", "Backup Time", "Storage Required", "Recovery Complexity", "Recovery Time"], "rows": [["Full", "All selected data", "Long", "Largest", "Simple (restore one set)", "Moderate"], ["Incremental", "Changes since last backup (any type)", "Short", "Smallest per job", "Complex (full + all incrementals since full)", "Longer (multiple sets)"], ["Differential", "Changes since last full backup", "Medium (grows over cycle)", "Medium (grows over cycle)", "Simple (full + one differential)", "Moderate"]]}'::jsonb,
  'Backup exam areas: (1) RTO = time to restore operations. RPO = acceptable data loss (in time). MTD = absolute maximum tolerable downtime (RTO must be less than MTD). (2) Full = all data; incremental = changes since last backup of any type; differential = changes since last full. (3) Recovery complexity: full = simplest; differential = full + one differential; incremental = full + every incremental. (4) 3-2-1 rule: 3 copies, 2 media types, 1 offsite. (5) Hot site = mirror (fast, expensive). Warm = partial (moderate). Cold = bare facility (cheap, slow). (6) An untested backup is not a backup.',
  'As a manager, the backup conversation you most need to have is not about backup strategy — it is about recovery testing. Organizations that have never tested recovery from backup are not managing risk; they are deferring it. Mandate regular recovery testing, track RTO achievement in tests, and tie backup investment decisions to demonstrated recovery capability rather than backup job completion rates. Ransomware has made air-gapped or immutable backup copies non-negotiable for any organization with crown jewel data.',
  'RTO = Return To Operations (time budget). RPO = Recovery Point (data loss budget). MTD = Maximum Time Down (the cliff edge — RTO must stay below it). 3-2-1 backup rule: 3 copies, 2 media types, 1 offsite. Recovery complexity: Full (one set), Differential (full + latest diff), Incremental (full + ALL incrementals). Hot site = always on. Warm = mostly on. Cold = shell only.',
  'In the SOC War Room in New York, the BCP/DRP test exercise board shows this quarter''s results. Tested full recovery of the primary ERP system from differential backup: target RTO 4 hours, actual recovery 3.5 hours — PASS. Tested site failover to warm site: target RTO 8 hours, actual recovery 11 hours — FAIL (warm site database sync was 3 weeks behind). Emergency budget request submitted for more frequent warm site synchronization. The ransomware scenario test revealed that the backup agent credentials were known to the attacker persona — the immutable cloud backup was the only copy that survived the simulated encryption attack. 3-2-1-1 rule implementation approved.'
);

-- ---------------------------------------------------------------------------
-- 7.9.1 Personnel Security Operations
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  7,
  '7.9.1',
  'Personnel Security Operations',
  'Personnel security controls — separation of duties, job rotation, mandatory vacation, and dual control — reduce insider threat risk by ensuring no single individual has unchecked ability to commit fraud or error, by enabling detection through role changes, and by requiring two-person authorization for high-impact actions.',
  '## Personnel Security Operations

Technical controls protect information systems against external threats and automated attacks. Personnel security controls address the risk that comes from inside the organization — from authorized users who misuse their access, whether through negligence, coercion, or deliberate fraud. The CISSP exam tests four primary personnel security controls: separation of duties, job rotation, mandatory vacation, and dual control (two-person integrity). These controls are complementary and most organizations implement multiple in combination.

### Separation of Duties

**Separation of duties (SoD)** requires that no single individual has complete control over a high-risk or high-impact process from start to finish. By dividing a critical task among two or more people, SoD ensures that fraud or error requires collusion between multiple individuals — significantly raising the cost and difficulty of unauthorized action.

Classic financial services example: the person who initiates a wire transfer should not be the same person who authorizes and approves it. If one person could both create and approve transfers, fraud requires only one compromised employee. With SoD, fraud requires two compromised employees and their collusion.

IT security example: a systems administrator who also has access to audit logs can cover their tracks by deleting log entries that show unauthorized activity. SoD would assign audit log access to a separate, independent team — the administrator cannot delete their own audit trail.

SoD is most effectively implemented when roles are designed around it, not bolted on afterward. The Clark-Wilson security model provides the formal basis for SoD in commercial information systems.

### Job Rotation

**Job rotation** systematically moves employees through different roles and responsibilities on a scheduled basis. Job rotation provides two security benefits:

First, it makes long-running, concealed fraud harder: an employee who has been in the same role for years can develop deeply embedded schemes that rely on accumulated insider knowledge and comfortable relationships with colleagues. Rotation disrupts established patterns and forces visibility into work that was previously performed by one person exclusively.

Second, rotation provides **cross-training** — multiple employees understand each role, reducing single points of knowledge failure and creating a team that is resilient to the loss of any individual.

The security benefit of job rotation is greatest when the rotation is genuinely comprehensive — the incoming employee reviews the outgoing employee''s work and has full access to all prior records. Rotation that simply moves a person without enabling genuine knowledge transfer provides limited security benefit.

### Mandatory Vacation

**Mandatory vacation** (also called forced leave) requires employees to take a minimum amount of uninterrupted leave during which their duties are performed by other personnel, and they are not permitted to access systems remotely. The security rationale: many fraud schemes require the perpetrator''s continuous involvement to maintain the cover story, process concealment transactions, or prevent the scheme from becoming visible through normal operations. When an employee is away for two continuous weeks with no system access, concealed fraud is more likely to be discovered by the employee covering their duties.

Mandatory vacation is a detective control that creates an unavoidable gap in the perpetrator''s operational control. It does not prevent the initial fraud but dramatically increases the probability of detection.

### Dual Control (Two-Person Integrity)

**Dual control** (also called **two-person integrity**) requires that two or more authorized individuals must independently take specific actions for a critical operation to proceed. Neither individual can complete the operation alone — both must be present and provide their separate authorizations. Dual control is the most restrictive personnel security control and is reserved for the highest-risk operations.

Examples: nuclear weapons launch protocol requires two officers to simultaneously turn separate keys (neither can launch alone). Safe opening in a bank requires two authorized officers to be present. Cryptographic key ceremony for a root CA private key requires multiple personnel each holding separate key cards. Production code deployment to critical financial systems may require a developer to submit and a separate senior engineer to approve.

Dual control is distinct from SoD: SoD separates the authorization roles for different steps in a process; dual control requires simultaneous action by multiple people for a single step.',
  NULL,
  '{"headers": ["Control", "Mechanism", "Prevents / Detects", "Best Applied To", "Limitation"], "rows": [["Separation of Duties", "Divides critical process among two or more roles", "Prevents unilateral fraud; requires collusion for abuse", "Financial transactions, access provisioning, audit log management", "Collusion between two separated parties can still enable fraud"], ["Job Rotation", "Rotates employees through different roles on schedule", "Detects embedded fraud schemes; enables cross-training", "Finance, IT operations, security operations", "Rotating employees may carry bad practices to new roles"], ["Mandatory Vacation", "Requires uninterrupted leave with no system access", "Detects fraud requiring continuous perpetrator involvement", "Finance, accounting, any role with sustained asset custody", "Does not prevent initial fraud; only increases detection probability"], ["Dual Control", "Requires simultaneous action by two authorized persons", "Prevents any single person from completing high-risk action alone", "Root CA ceremonies, nuclear protocols, wire transfer approval, production deployment", "Requires both people to be available; collusion still possible"]]}'::jsonb,
  'Personnel security exam areas: (1) Separation of duties = split critical functions across people (no single person starts AND approves). (2) Job rotation = periodic role changes (detect embedded fraud, cross-train). (3) Mandatory vacation = forced leave with no access (expose fraud that requires continuous involvement). (4) Dual control = two people must act simultaneously (no single person can complete the action alone). (5) These are all compensating controls for insider threat. (6) The exam distinguishes between SoD (two people for different steps) and dual control (two people for the same step simultaneously).',
  'As a manager, personnel security controls are your most important insider threat mitigations — and they are the ones most often weakened by operational convenience. Finance teams that consolidate roles because of headcount pressure eliminate SoD. IT teams that skip mandatory vacation for "key" employees eliminate a critical fraud detection mechanism. Enforce these controls consistently, especially for roles with privileged access to financial systems, customer data, or security infrastructure. When you conduct segregation of duties reviews, look for roles where the same employee has initiation AND approval rights — those are your highest-risk gaps.',
  'SRMD — Separation (split duties), Rotation (move people around), Mandatory vacation (force absence), Dual control (two keys, one lock). All four target insider threat. SoD = no single person rules. Rotation = no one hides. Mandatory vacation = fraud exposed when you leave. Dual control = two signatures on the check. Collusion is the common enemy of all four — but requiring collusion is still much better than allowing unilateral fraud.',
  'In the SOC War Room in New York, the personnel security controls are visually mapped. The wire transfer approval process shows two signatures required on every authorization above $50,000 (SoD: initiator and approver are different people with different roles). The quarterly schedule shows the SOC team rotating roles between alert triage, threat hunting, and incident response (job rotation: no one owns a quiet corner unchecked). The finance team''s mandatory vacation calendar shows every team member has at least 10 consecutive business days off per year with a coverage plan (mandatory vacation: no one is indispensable to an ongoing scheme). The production deployment process shows dual authorization: developer submits via pull request, senior engineer and security approver both must click approve before CI/CD pipeline runs (dual control: no single developer can push to production alone).'
);
