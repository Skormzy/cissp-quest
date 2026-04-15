# Domain 7: Security Operations - Comprehensive Knowledge Summary

---

## 1. COMPLETE TOPIC LIST

### 7.1 Understand and Comply with Investigations
- Securing the scene
  - Preventing contamination of physical and digital evidence
  - Photographing and documenting the crime scene
  - Blocking access to affected areas
- Evidence collection and handling
  - Forensic investigation process (identify, secure, collect, examine, analyze, report)
  - Tag, bag, and carry methodology
  - Sources of information/evidence (oral/written, documents, computer systems, visual/audio)
  - Types of evidence (real, direct, circumstantial, corroborative, hearsay, best evidence, secondary)
  - Five rules of evidence (authentic, accurate, complete, convincing/reliable, admissible)
- Locard's Exchange Principle
  - Every contact leaves a trace; something taken, something left behind
- Motive, Opportunity, Means (MOM)
- Digital/Computer forensics
  - Scientific examination and analysis of data from storage media
  - Live evidence (volatile data: RAM, CPU cache, buffers)
  - Forensic copies (bit-for-bit imaging, hash verification)
  - Investigative techniques (media analysis, software analysis, network analysis)
  - Mobile device forensic challenges
  - Forensic artifacts (IP addresses, hashes, registry keys, URLs, log data)
- Reporting and documentation
  - Preparing evidence for stakeholders (prosecution/defense, judge/jury, regulators, investors, insurers)
- Digital forensics tools, tactics, and procedures
  - Malware analysis tools
  - Log analysis tools
  - Social media account analysis
  - Mobile device analysis
  - Write blockers
- Chain of custody
  - Documenting the complete journey of evidence throughout the case lifecycle
  - Who handled what, when, where
  - Does not guarantee admissibility but supports it
- Types of investigations
  - Criminal (law enforcement driven, beyond reasonable doubt, harshest penalties)
  - Civil (disputes between parties, preponderance of evidence, monetary penalties)
  - Regulatory (violations of regulated activity, driven by regulatory body)
  - Administrative (internal organizational investigations, policy violations)
  - Industry standards (ISO 27043-based investigations)
  - eDiscovery (discovery of electronically stored information in legal proceedings)

### 7.2 Conduct Logging and Monitoring Activities
- Intrusion detection and prevention systems (IDPS)
  - IDS vs. IPS functionality
  - Network-based (NIDS/NIPS) vs. host-based (HIDS/HIPS)
  - Signature-based vs. anomaly-based vs. heuristic detection
  - False positives and false negatives
- Security Information and Event Management (SIEM)
  - Log aggregation from multiple sources
  - Normalization (standardizing formats, timestamps, deduplication)
  - Correlation (linking events across systems)
  - Secure storage (read-only log retention)
  - Analysis and reporting
  - Alert generation and escalation procedures
  - Tuning to balance false positives and false negatives
  - Technology + process + people requirement
- Continuous monitoring
  - Ongoing updates to SIEM rules and configurations
  - Adapting to changing threat environments
  - Balancing false-positive and false-negative rates
  - Full lifecycle: define strategy, establish program, implement, analyze/report, respond, review/update
- Egress monitoring
  - Monitoring outbound data flows
  - Detecting data exfiltration attempts
  - Identifying malware communicating with external C2 servers
- Log management
  - Collection, storage, analysis, and disposal of log data
  - Secure storage with access controls
  - Retention policies and compliance
- Threat intelligence
  - Threat feeds (real-time/near-real-time information)
  - Threat hunting (proactively searching for APTs)
  - Vendor trend reports, US-CERT, ISACs
  - Indicators of Compromise (IoCs)
- User and Entity Behavior Analytics (UEBA)
  - Machine learning-based behavioral baselines
  - Detection of insider threats and compromised accounts
  - Anomaly detection from normal behavioral patterns
- Security Orchestration, Automation, and Response (SOAR)
  - Integration of disparate security tools
  - Automated incident response workflows
  - Three focus areas: threat/vulnerability management, incident response, security operations automation
  - Machine learning-assisted SOC activities

### 7.3 Perform Configuration Management (CM)
- Asset inventory
  - Hardware assets (bar codes, RFID tags, automated inventory)
  - Software assets (licensing, activation keys, compliance)
  - Intangible assets (patents, trademarks, copyrights, reputation)
  - Asset management lifecycle (plan, procure, provision, operate, maintain, dispose)
- Provisioning
  - Secure deployment of systems
  - System hardening (disable unused services, close unused ports, remove unnecessary applications, change defaults)
- Baselining
  - Establishing known-good configuration starting points
  - Operating system baselines
  - Using images for consistent deployment
  - Protecting baseline images from tampering
- Automation
  - Group Policy for Windows domains
  - Scripting and automated configuration tools
  - Registry modifications for security hardening
  - Automated provisioning ensuring consistency
- Configuration documentation
  - Recording current configurations
  - Tracking changes from baseline
  - Maintaining system purpose and ownership records

### 7.4 Apply Foundational Security Operations Concepts
- Need-to-know access
  - Restricting knowledge/data access to job requirements
  - Associated with security clearances
  - Focused on confidentiality of information
- Least privilege principle
  - Restricting user actions/permissions to job requirements
  - Applies to data access AND system access
  - Extends to applications and service accounts
  - Prevents privilege escalation and limits malware impact
- Segregation of Duties (SoD) / Separation of Duties
  - Dividing critical functions among multiple people
  - Prevents fraud through checks and balances
  - Requires collusion for unauthorized activity
  - Two-person control (two-man rule)
  - Split knowledge (dividing information or privilege among multiple users)
- Job rotation
  - Rotating employees through different positions
  - Provides peer review and cross-training
  - Acts as both deterrent and detection mechanism
  - Reduces single points of failure for personnel
- Mandatory vacations
  - Requiring one or two-week vacations
  - Fraud detection mechanism
  - Common in financial organizations
- Privileged Account Management (PAM)
  - Restricting and monitoring elevated access
  - Just-in-Time administration (time-limited privileges)
  - Monitoring administrator actions (account creation, route changes, firewall config, log access)
  - Detecting APT activities through privilege monitoring
  - Separating regular and privileged accounts
  - Increased authentication and logging requirements
- Service-Level Agreements (SLAs)
  - Contracts specifying performance expectations
  - Includes monetary penalties for non-compliance
  - Uptime/downtime guarantees
  - Difference from MOU (less formal, no penalties)
- Due care and due diligence in operations

### 7.5 Apply Resource Protection
- Media management
  - Types: paper, microforms, magnetic, flash memory, optical
  - Confidentiality, access speeds, portability, durability considerations
  - Media format and data format considerations
  - MTBF/MTTF of media
- Media protection techniques
  - Physical access controls for storage
  - Temperature and humidity controls
  - Encryption of sensitive media
  - USB drive controls and restrictions
  - Secure disposal and sanitization (degaussing, destruction, cryptographic erasure)
  - Marking, handling, storage, and transport procedures
- Tape media management
  - On-site and off-site copies
  - Protection from magnetic fields, temperature extremes, dust
  - Transportation security
  - Classification-based destruction methods
- Mobile device management
  - Encryption, remote wipe capabilities
  - MDM software for patch deployment
  - BYOD considerations
- Data at rest / data in transit protection
- Hardware and software asset management
  - Asset management lifecycle
  - Inventories and tracking
  - Patching and software licensing
  - Secure configuration management

### 7.6 Conduct Incident Management
- Defining incidents vs. events
  - Event: any observable occurrence
  - Incident: an adverse event impacting CIA
  - Not all events are incidents
- Goals of incident response
  - Effective and efficient response to reduce organizational impact
  - Maintain or restore business continuity
  - Defend against future attacks
- Detection methods
  - IDS/IPS, DLP, anti-malware, SIEM
  - Administrative review
  - Physical security (motion sensors, cameras, guards)
  - End user reports
- Incident response process (7 steps per CISSP objectives)
  - Preparation (develop IR process, assign team, create plans)
  - Detection (identify adverse events, triage, distinguish from normal events)
  - Response (activate IR team, impact assessment, evidence preservation)
  - Mitigation/Containment (limit effect/scope, isolate affected systems)
  - Reporting (internal and external stakeholders, regulatory compliance, designated spokesperson)
  - Recovery (return to normal operations, rebuild systems, verify configuration)
  - Remediation (root cause analysis, implement preventive measures)
  - Lessons learned (review response effectiveness, update procedures, improve detection)
- NIST SP 800-61 four-phase model
  - Preparation
  - Detection and Analysis
  - Containment, Eradication, and Recovery
  - Post-Incident Activity
- Incident response team composition (CIRT/CSIRT)
  - Information security, management, legal, HR, PR, IT
- No counterattack principle
- Evidence preservation during incidents
  - Do not power off computers (preserving volatile data)
  - Forensic imaging before remediation
- Examples of incidents
  - Malware infections, hacker attacks, insider attacks
  - Employee error, system error, data corruption
  - Workplace injury, DoS attacks

### 7.7 Operate and Maintain Detective and Preventive Measures
- Malware types
  - Virus (user-triggered)
  - Worm (self-propagating via vulnerabilities)
  - Trojan horse (appears harmless, contains malicious code)
  - Ransomware (encrypts systems, demands payment)
  - Rootkit (masks presence, provides privileged access, hardest to detect/remove)
  - Logic bomb (triggered by logical condition)
  - Botnet (network of compromised systems under C2 control)
  - Boot sector infector (infects master boot record)
  - Polymorphic (changes form to evade detection)
  - Multipartite (spreads via multiple methods)
  - Stealth (actively evades detection)
  - Macro (embedded in applications like Excel)
  - Companion (attaches to legitimate programs)
  - Hoaxes/Pranks (social engineering, not actual code)
  - Data diddler/Salami attack (small changes over time)
  - Zero-day (never seen before, no signatures exist)
- Anti-malware approaches
  - Signature-based scanners (definition files, requires constant updates)
  - Heuristic scanners (code behavior analysis, static and dynamic)
  - Activity monitors (monitoring running processes)
  - Change detection / file integrity monitoring (hash comparison)
  - Sandboxing (isolated execution environment)
  - False positive challenges with heuristic systems
- ML/AI-based security tools
  - Threat detection and classification
  - Network risk scoring
  - Automation of routine security tasks
  - Response to unauthorized access, evasive malware, spear phishing
- Firewalls (network-based, host-based, next-generation, WAF)
- Allowlisting/Blocklisting
- Third-party security services (SECaaS, MSSP, MSP)
- Honeypots and honeynets
  - Decoy systems to attract attackers
  - Pseudo-flaws (intentional vulnerabilities to lure attackers)
  - Darknets (monitored networks with no legitimate hosts)
- Network attacks and defenses
  - Botnets and C2 infrastructure
  - DoS/DDoS attacks
  - SYN flood attacks (SYN cookies as defense)
  - Smurf attacks (ICMP-based, amplifying networks)
  - Fraggle attacks (UDP-based variant of Smurf)
  - Ping flood attacks
  - TCP reset attacks
  - Man-in-the-middle/on-path attacks
  - Zero-day exploits
  - Sabotage and insider threats
- Endpoint Detection and Response (EDR)
  - Analyzing endpoint memory, filesystem, network activity
  - Automatic isolation of suspicious activity
  - Integration with threat intelligence

### 7.8 Implement and Support Patch and Vulnerability Management
- Patch management
  - Evaluate, test, approve, deploy, verify
  - Applies to workstations, servers, network devices, IoT, mobile devices
  - Automated vs. manual deployment
  - Patch Tuesday and Exploit Wednesday concepts
  - Emergency/out-of-band patching
  - Change management integration
- Determining patch levels
  - Agent-based (software installed on hosts)
  - Agentless (remote connection and scanning)
  - Passive detection (network fingerprinting)
- Vulnerability management
  - Routine vulnerability scans
  - Periodic vulnerability assessments
  - CVE (Common Vulnerabilities and Exposures) database (maintained by MITRE)
  - Residual risk acceptance by management
  - Segregation between patching and verification roles

### 7.9 Understand and Participate in Change Management Processes
- Change management process steps
  1. Change request (submit via ticketing system)
  2. Assess impact (evaluate scope and consequences)
  3. Approval (Change Advisory Board / CAB, Emergency CAB / ECAB)
  4. Build and test (non-production environment, regression testing)
  5. Notification (inform stakeholders before implementation)
  6. Implement (schedule during low-impact windows)
  7. Validation (verify changes work as expected)
  8. Version and baseline (update documentation, create new baseline)
- Rollback/backout plans
- Emergency change management
- Configuration management relationship
- Patch management as part of change management
- ITIL framework origins
- Versioning and version control
- Configuration documentation maintenance

### 7.10 Implement Recovery Strategies
- Failure modes
  - Fail-soft / Fail-open (less secure state, allows some traffic)
  - Fail-secure / Fail-closed (more secure state, blocks all traffic)
  - Fail-safe (prioritizes human safety, e.g., doors unlock during fire)
- Backup storage strategies
  - Archive bit mechanics (0 = no backup needed, 1 = backup required)
  - Full backup (all data, resets archive bit)
  - Incremental backup (changes since last backup, resets archive bit, fast backup, slow restore)
  - Differential backup (changes since last full, does NOT reset archive bit, moderate backup, fast restore)
  - Mirror backup (exact copy, no compression, fastest backup/restore, most storage)
  - 3-2-1 Rule (3 copies, 2 different media, 1 offsite)
  - Tape rotation schemes (Grandfather-Father-Son, Tower of Hanoi, FIFO, Six Cartridge Weekly)
  - Onsite, offsite, and cloud storage options
  - Electronic vaulting (automated tape management)
  - Backup encryption
  - CRC (Cyclic Redundancy Check) for data integrity verification
- Spare parts strategies
  - Cold spare (on shelf, longest recovery time, cheapest)
  - Warm spare (installed but not powered, seconds to minutes recovery)
  - Hot spare (installed, powered, instant failover, most expensive)
- RAID levels
  - RAID 0 (striping, performance only, no redundancy, min 2 drives)
  - RAID 1 (mirroring, full redundancy, no performance gain, min 2 drives)
  - RAID 5 (striping with parity/XOR, good balance, can lose 1 drive, min 3 drives)
  - RAID 6 (double parity, can lose any 2 drives, min 4 drives)
  - RAID 10/1+0 (mirroring + striping, performance + redundancy, min 4 drives)
- Clustering vs. redundancy
  - Clustering: multiple systems sharing workload (losing one reduces capacity)
  - Redundancy: primary + secondary standby (losing primary causes failover, no capacity loss)
  - Both provide high availability (HA)
- Recovery site strategies
  - Cold site (shell + HVAC only, weeks to recover, cheapest)
  - Warm site (shell + basic equipment, days to recover)
  - Hot site (fully equipped except data/people, hours to recover)
  - Mobile site (portable hot site on wheels, hours/days)
  - Redundant/Mirror site (fully staffed and operational, instant/seconds, most expensive)
  - Multiple processing sites (geographically dispersed simultaneous processing)
- Geographic disparity (recovery site far enough from primary to avoid same disaster)
- Internal vs. external recovery sites
- Reciprocal agreements (mutual hosting agreements, rare in practice)
- Resource capacity agreements (pre-arranged vendor resource commitments)
- Data replication strategies
  - Electronic vaulting (batch transfer to remote location)
  - Remote journaling (transaction log shipping)
  - Remote mirroring (real-time replication)
- System resilience, high availability, QoS, and fault tolerance

### 7.11 Implement Disaster Recovery (DR) Processes
- Defining a disaster (interruption of normal business processes)
- BCM, BCP, and DRP relationships
  - BCM: overarching management structure for BCP and DRP
  - BCP: survival of business, strategic focus on processes
  - DRP: recovery of technology infrastructure, tactical focus on systems
- BCP/DRP steps
  1. Develop contingency planning policy
  2. Conduct Business Impact Analysis (BIA)
  3. Identify preventive controls
  4. Create contingency strategies
  5. Develop contingency plan
  6. Ensure testing, training, and exercises
  7. Plan maintenance (living document)
- Business Impact Analysis (BIA)
  - Most important step in BCP
  - Determines criticality of functions, systems, processes
  - Identifies resource requirements
  - Sets recovery priorities
  - Methods: financial records, workshops, questionnaires, interviews, observation
  - Output: RPO, RTO, WRT, MTD for each critical function
  - Three primary goals: determine criticality, estimate maximum downtime, evaluate resource requirements
- Key time metrics
  - MTD/MAD/AIW: Maximum Tolerable Downtime (maximum total disruption time before business fails)
  - RTO: Recovery Time Objective (time to restore to defined service level)
  - RPO: Recovery Point Objective (maximum tolerable data loss measured in time)
  - WRT: Work Recovery Time (time to verify integrity of restored systems)
  - Relationship: MTD = RTO + WRT; RTO must never exceed MTD
  - Cost relationship: Lower RPO/RTO = more expensive; Higher RPO/RTO = less expensive
- External dependencies
  - Suppliers, vendors, utility providers
  - Planning for dependency failures
- Declaring a disaster
  - Triggered when MTD will be exceeded
  - Authorized by CEO or Business Continuity Board
  - Follows incident response assessment
- Disaster response process
  - Declaration criteria and communication
  - Emergency response team activation
  - Personnel (executive, legal, HR, IT, PR, security)
  - Internal and external communications
- Restoration order
  - Moving TO DR site: most critical systems first
  - Moving BACK to primary: least critical systems first (to verify site stability)
  - Dependency charts and mapping
- Disaster recovery completes when operations restored at PRIMARY facility

### 7.12 Test Disaster Recovery Plans (DRP)
- Test types (in order of complexity and risk)
  1. Read-through/Checklist (author reviews plan completeness, no systems affected)
  2. Walkthrough/Tabletop (stakeholders review and discuss plan, paper-based)
  3. Simulation (respond to simulated disaster scenario, paper-based, stop short of affecting systems)
  4. Parallel (test DR plan at recovery site on parallel systems, production unaffected)
  5. Full-interruption/Full-scale (actual disaster scenario, production systems affected)
- Full-interruption test requirements
  - All other tests must be successfully completed first
  - Management approval required
  - Production systems will be impacted
- Functional drills (BCP testing designed to test specific functions)
- Regular testing cadence (at least annually)

### 7.13 Participate in Business Continuity (BC) Planning and Exercises
- Three goals of BCM (in priority order)
  1. Safety of people (ALWAYS the top priority)
  2. Minimization of damage
  3. Survival of business
- Focus on critical and essential business functions
- BCP and DRP plan creation and testing
- Personnel training and exercises
- Post-exercise evaluation and improvement

### 7.14 Implement and Manage Physical Security
- Perimeter security controls
- Internal security controls
- (Primarily covered in Domain 3)

### 7.15 Address Personnel Safety and Security Concerns
- Travel security
  - Protecting devices from malware and physical tampering
  - Avoiding free/public Wi-Fi (on-path attack risks)
  - Using VPNs for all connections
  - Temporary/disposable devices for travel
  - Physical control of devices at all times
  - Identity verification (hotel room service, visitors)
- Emergency management
  - Natural disaster response (hurricanes, earthquakes, tornadoes)
  - Man-made disaster response (fires, terrorist attacks, cyberattacks)
  - Personnel safety as primary consideration
- Security training and awareness
  - Insider threat awareness
  - Social media risks and oversharing
  - 2FA fatigue and authentication hygiene
  - Cybersecurity best practices
- Duress systems
  - Silent alarm mechanisms
  - Code words and code phrases for verification
  - Dual-code electronic locks (normal vs. duress codes)
  - Monitoring entity response procedures

---

## 2. KEY DEFINITIONS AND CONCEPTS

| Term | Definition |
|------|-----------|
| **Event** | Any observable occurrence in a system or network |
| **Incident** | An adverse event that negatively impacts confidentiality, integrity, or availability |
| **Disaster** | A sudden, unplanned event that interrupts normal business processes and exceeds MTD |
| **Chain of Custody** | The documented process tracking evidence from collection through presentation in court; focused on control and integrity |
| **Locard's Exchange Principle** | Every contact between two objects results in a transfer; something is always left behind and something is always taken |
| **MOM** | Motive, Opportunity, Means - investigative framework for determining suspect involvement |
| **Real Evidence** | Tangible physical objects (not the data on them); can be physically held and inspected |
| **Direct Evidence** | Evidence that speaks for itself, requires no inference (eyewitness testimony, confessions) |
| **Best Evidence Rule** | Original evidence should be presented rather than copies when available |
| **Secondary Evidence** | Reproduction or substitute for original evidence (e.g., printouts of log files) |
| **Circumstantial Evidence** | Suggests a fact by implication or inference; proves intermediate facts |
| **Hearsay Evidence** | Second-hand testimony without firsthand knowledge; generally inadmissible with exceptions |
| **Corroborative Evidence** | Supports other facts or testimony; strengthens the case but is not standalone proof |
| **SIEM** | Security Information and Event Management - aggregates, normalizes, correlates, and analyzes log data from multiple sources |
| **SOAR** | Security Orchestration, Automation, and Response - automated security workflows integrating multiple tools |
| **UEBA** | User and Entity Behavior Analytics - ML-based detection of behavioral anomalies |
| **IDS** | Intrusion Detection System - monitors and alerts on suspicious activity (passive) |
| **IPS** | Intrusion Prevention System - monitors, alerts, and blocks suspicious activity (active) |
| **HIDS/NIDS** | Host-based / Network-based Intrusion Detection Systems |
| **EDR** | Endpoint Detection and Response - analyzes endpoint activity for signs of compromise |
| **PAM** | Privileged Account Management - restricts and monitors elevated access |
| **SLA** | Service-Level Agreement - contract specifying performance expectations with penalties |
| **MOU** | Memorandum of Understanding - less formal agreement without monetary penalties |
| **SoD** | Segregation/Separation of Duties - no single person controls entire critical process |
| **Collusion** | Agreement between two or more people to commit unauthorized activity |
| **Split Knowledge** | Critical information divided among multiple parties so no single person has all of it |
| **Configuration Management** | Ensuring systems are deployed and maintained in a consistent, secure, documented state |
| **Baseline** | A known-good starting configuration for a system |
| **Change Advisory Board (CAB)** | Group of stakeholders who review and approve/reject change requests |
| **Zero-Day** | A vulnerability or exploit unknown to the vendor and security community; no patch exists |
| **Botnet** | Network of compromised systems controlled by an attacker via C2 servers |
| **Ransomware** | Malware that encrypts systems/data and demands payment for decryption key |
| **Rootkit** | Collection of malware tools that masks its presence and provides privileged access |
| **Polymorphic Malware** | Malware that changes its characteristics (filename, size, code) with each replication |
| **Logic Bomb** | Code that executes based on a triggering condition or logic |
| **Data Diddler/Salami Attack** | Malware making tiny financial changes over time to avoid detection |
| **Sandbox** | Isolated environment for safely executing and analyzing suspicious code |
| **Honeypot** | Decoy system designed to attract attackers and study their methods |
| **Honeynet** | Network of honeypots providing greater interaction surface |
| **Pseudo-flaw** | Intentionally planted vulnerability to lure attackers |
| **Darknet** | Monitored network segment with no legitimate hosts; any traffic indicates suspicious activity |
| **CVE** | Common Vulnerabilities and Exposures - standardized naming for known vulnerabilities |
| **BCP** | Business Continuity Planning - ensures critical business functions survive a disaster |
| **DRP** | Disaster Recovery Planning - tactical recovery of technology infrastructure |
| **BCM** | Business Continuity Management - overarching framework encompassing BCP and DRP |
| **BIA** | Business Impact Analysis - identifies critical functions and determines time-based recovery requirements |
| **MTD/MAD** | Maximum Tolerable Downtime / Maximum Allowable Downtime - maximum time before business failure |
| **RTO** | Recovery Time Objective - target time to restore operations to a defined service level |
| **RPO** | Recovery Point Objective - maximum acceptable data loss measured in time |
| **WRT** | Work Recovery Time - time to verify system and data integrity after restoration |
| **Fail-safe** | Failure mode prioritizing human safety (doors unlock during fire) |
| **Fail-secure** | Failure mode maintaining or increasing security (firewall blocks all traffic) |
| **Fail-soft/Fail-open** | Failure mode reducing security for availability (firewall allows traffic through) |
| **RAID** | Redundant Array of Independent Disks - multiple drives for performance and/or redundancy |
| **Archive Bit** | Metadata flag indicating whether a file needs to be backed up (0=no, 1=yes) |
| **CRC** | Cyclic Redundancy Check - mathematical method for detecting accidental data changes |
| **Electronic Vaulting** | Automated transfer of data to remote location for backup |
| **Remote Journaling** | Shipping transaction logs to a remote site |
| **Remote Mirroring** | Real-time data replication to a secondary location |
| **Reciprocal Agreement** | Mutual agreement between organizations to host each other's systems during disaster |
| **Resource Capacity Agreement** | Pre-arranged agreement with vendor to ensure resource availability during disaster |
| **eDiscovery** | Discovery of electronically stored information for legal proceedings |
| **Artifacts** | Digital remnants of a breach or attempted breach (breadcrumbs left by attacker) |
| **Write Blocker** | Device that prevents modification of data on storage media during forensic analysis |
| **Degaussing** | Using magnetic fields to erase data from magnetic media |
| **Cryptographic Erasure** | Permanently destroying encryption keys to render encrypted data unrecoverable |

---

## 3. CALCULATIONS AND FORMULAS

### Recovery Time Relationships
```
MTD = RTO + WRT
RTO < MTD  (RTO must NEVER exceed MTD)
```

### Cost Relationships
```
Lower RPO + Lower RTO = MORE expensive solution
Higher RPO + Higher RTO = LESS expensive solution
```

### Availability Calculations
| Availability % | Downtime per Year |
|----------------|-------------------|
| 99% ("two nines") | 3.65 days |
| 99.9% ("three nines") | 8.76 hours |
| 99.99% ("four nines") | 52.56 minutes |
| 99.999% ("five nines") | 5.26 minutes |

### MTBF and MTTF
```
MTBF = Mean Time Between Failures (for repairable items)
MTTF = Mean Time To Failure (for non-repairable items, e.g., tapes)
MTTR = Mean Time To Repair (average time to fix a failed component)
Availability = MTBF / (MTBF + MTTR)
```

### RAID Storage Calculations
| RAID Level | Usable Capacity | Min Drives |
|------------|----------------|------------|
| RAID 0 | N drives (100%) | 2 |
| RAID 1 | N/2 (50%) | 2 |
| RAID 5 | N-1 drives | 3 |
| RAID 6 | N-2 drives | 4 |
| RAID 10 | N/2 (50%) | 4 |

### Backup Strategy Trade-offs
| Strategy | Backup Speed | Restore Speed | Storage Required |
|----------|-------------|---------------|-----------------|
| Mirror | Fastest | Fastest | Highest |
| Full | Slowest | Fast | High |
| Differential | Moderate | Moderate (2 tapes max) | Moderate |
| Incremental | Fast | Slowest (many tapes) | Lowest |

### BIA Flood Example (ARO)
```
ARO for 200-year flood plain = 1/200 = 0.005
ARO for 100-year flood plain = 1/100 = 0.01
```

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Investigation Traps
- **Chain of custody does NOT guarantee admissibility** -- it supports admissibility but does not ensure it. Evidence can still be excluded for other legal reasons.
- **Once evidence is contaminated, it CANNOT be decontaminated** -- there is no "undo" for evidence tampering.
- **Computer logs are generally considered hearsay evidence**, but may be admitted under the business records exception.
- **Real evidence refers to physical objects (hard drive casing), NOT the data stored on them** -- the data is documentary evidence.

### Incident Response Traps
- **Detection is the first STEP, but preparation comes first in the process** -- preparation happens before any incident occurs; detection is the first step when an incident actually happens.
- **Never power off a compromised computer** -- volatile data in RAM and cache will be lost permanently.
- **Never counterattack** -- retaliatory attacks are illegal and counterproductive.
- **Mitigation means CONTAINMENT, not resolution** -- the goal is to stop spreading, not fix the root cause.
- **Remediation vs. Recovery confusion** -- recovery returns to normal operations; remediation prevents recurrence.
- **Lessons learned is NOT just a meeting** -- it produces documented recommendations that feed back into improving the entire IR process.

### Backup Traps
- **Incremental resets the archive bit; differential does NOT** -- this is the fundamental technical difference.
- **Incremental is fastest to back up but SLOWEST to restore** (need full + all incrementals).
- **Differential is moderate to back up but requires only 2 tapes to restore** (full + latest differential).
- **RAID is NOT a backup** -- RAID provides availability/fault tolerance but does not protect against data corruption, accidental deletion, or site-wide disasters.

### Recovery Site Traps
- **Hot site recovery = hours, not minutes** -- many candidates confuse hot site with redundant site.
- **Redundant/mirror site = instant/seconds** -- this is the fastest recovery option.
- **Cold site = weeks, not days** -- needs everything installed from scratch.
- **Moving TO DR site: most critical systems FIRST** -- but moving BACK to primary: least critical first.
- **Disaster recovery is NOT complete until primary site is restored** -- operations at DR site are temporary.

### BCP/DRP Traps
- **Safety of people is ALWAYS the number one priority** -- above all assets, data, and systems.
- **BCP is strategic (business processes); DRP is tactical (technology/systems)** -- do not confuse the scope.
- **BIA is the most critical step in BCP** -- it drives all subsequent decisions.
- **MTD is the trigger for declaring a disaster** -- if MTD will be exceeded, declare a disaster.
- **Full-interruption test requires ALL other tests to have passed first AND management approval**.

### Access Control Traps
- **Need-to-know restricts KNOWLEDGE (data access); least privilege restricts ACTIONS (permissions)** -- they are related but distinct concepts.
- **Default access for new accounts should be NO ACCESS** -- not read-only, not any other level.
- **Separation of duties prevents fraud; mandatory vacations DETECT fraud** -- both are deterrent controls but serve different primary purposes.
- **Job rotation is both a deterrent AND a detection control**.

### Change Management Traps
- **Patch management is part of change management** -- patches should go through the change process.
- **Emergency changes still require documentation** -- they can bypass the approval process temporarily but must be documented and reviewed after implementation.

---

## 5. COMPARISONS AND DISTINCTIONS

### Recovery Sites
| Feature | Cold Site | Warm Site | Hot Site | Mobile Site | Redundant Site |
|---------|----------|-----------|---------|-------------|---------------|
| Infrastructure/HVAC | Yes | Yes | Yes | Yes | Yes |
| Basic Equipment | No | Yes | Yes | Yes | Yes |
| Computer Hardware | No | No | Yes | Yes | Yes |
| Data | No | No | No | No | Yes |
| People | No | No | No | No | Yes (24/7) |
| Recovery Time | Weeks | Days | Hours | Hours/Days | Instant/Seconds |
| Relative Cost | $ | $$ | $$$ | $$$ | $$$$$ |

### BCP vs. DRP
| Aspect | BCP | DRP |
|--------|-----|-----|
| Focus | Business processes and functions | Technology infrastructure and systems |
| Perspective | Strategic | Tactical |
| Scope | Ensuring business survival | Recovering IT capabilities |
| Example | Ensuring employees get paid during outage | Bringing the payroll system back online |

### IDS vs. IPS
| Feature | IDS | IPS |
|---------|-----|-----|
| Detection | Yes | Yes |
| Prevention/Blocking | No (passive) | Yes (active) |
| Position | Monitors traffic copy | Inline with traffic |
| Response | Sends alerts | Blocks/modifies traffic |
| Risk | May miss attacks | May block legitimate traffic |

### HIDS vs. NIDS
| Feature | HIDS | NIDS |
|---------|------|------|
| Scope | Individual host | Network segment |
| Visibility | System calls, file changes, logs | Network packets |
| Encryption | Can see decrypted data | Cannot see encrypted payloads |
| Deployment | On each protected host | At network chokepoints |
| Best for | Detecting host-level attacks | Detecting network-level attacks |

### Incremental vs. Differential Backups
| Feature | Incremental | Differential |
|---------|-------------|-------------|
| Data Backed Up | Changes since last ANY backup | Changes since last FULL backup |
| Archive Bit | Resets to 0 after backup | Does NOT reset |
| Backup Speed | Fast (less data) | Moderate (growing data) |
| Restore Speed | Slow (need full + all incrementals) | Fast (need full + latest differential) |
| Storage | Least | Moderate |
| Max Tapes for Restore | Many (full + each daily) | 2 (full + latest differential) |

### Preventive vs. Detective vs. Corrective Controls
| Control Type | Purpose | Examples |
|-------------|---------|---------|
| Preventive | Stop unwanted activity before it occurs | Firewalls, encryption, access controls, separation of duties, IPS |
| Detective | Discover unwanted activity after it occurs | IDS, audit logs, CCTV, job rotation, mandatory vacations, SIEM |
| Corrective | Remediate or restore after an incident | Backups, disaster recovery, incident response, patching |
| Deterrent | Discourage attempted violations | Warning banners, security cameras, job rotation |

### Evidence Types Hierarchy
| Evidence Type | Strength | Description |
|--------------|----------|-------------|
| Direct | Strongest | Proves fact directly, no inference needed |
| Real/Physical | Strong | Tangible objects from the scene |
| Documentary | Moderate | Written or recorded information |
| Corroborative | Supporting | Backs up other evidence |
| Circumstantial | Indirect | Requires inference |
| Hearsay | Weakest | Second-hand, generally inadmissible |

### Investigation Types
| Type | Standard of Proof | Who Drives | Penalties |
|------|-------------------|-----------|-----------|
| Criminal | Beyond reasonable doubt | Law enforcement | Imprisonment, criminal record |
| Civil | Preponderance of evidence | Organizations/individuals | Monetary damages, fines |
| Regulatory | Regulatory standards | Regulatory body | Fines, license revocation |
| Administrative | Organizational policy | Organization itself | Termination, reprimand |

### Clustering vs. Redundancy
| Feature | Clustering | Redundancy |
|---------|-----------|-----------|
| Configuration | Multiple systems sharing workload | Primary + standby secondary |
| Failure Impact | Proportional capacity loss | No capacity loss (failover) |
| Example | Web servers behind load balancer | Primary/secondary database |
| HA Benefit | Graceful degradation | Zero-downtime failover |

### Fail Modes
| Mode | Priority | Example |
|------|---------|---------|
| Fail-safe | Human safety | Doors unlock during fire alarm |
| Fail-secure (closed) | Security | Firewall blocks all traffic on failure |
| Fail-soft (open) | Availability | Firewall allows traffic through on failure |

### RAID Comparison
| RAID | Type | Min Drives | Redundancy | Performance | Tolerable Failures |
|------|------|-----------|-----------|-------------|-------------------|
| 0 | Striping | 2 | None | Highest | 0 |
| 1 | Mirroring | 2 | Full | Moderate | 1 |
| 5 | Parity | 3 | XOR parity | High | 1 |
| 6 | Double parity | 4 | Double XOR | Moderate | 2 |
| 10 | Mirror + Stripe | 4 | Mirrored pairs | Highest | 1 per mirror pair |

---

## 6. LEGAL AND REGULATORY

### Evidence Handling Laws
- **Best Evidence Rule**: Courts prefer original documents/evidence over copies. If the original is available, it must be presented.
- **Hearsay Rule**: Second-hand evidence is generally inadmissible unless a recognized exception applies (e.g., business records exception, dying declaration).
- **Computer records are generally classified as hearsay** but are often admitted under the business records exception if they were created in the normal course of business.
- **Exclusionary Rule**: Evidence obtained through unconstitutional means (illegal search) is inadmissible regardless of relevance.

### Five Rules of Evidence
1. **Authentic**: Proven to come from the crime scene; not fabricated or planted
2. **Accurate**: Has integrity; has not been changed or modified
3. **Complete**: All evidence must be shared, whether it supports or hurts the case
4. **Convincing/Reliable**: Demonstrates high degree of truth; understandable by non-technical people (judges, juries)
5. **Admissible**: Accepted by the court for proceedings

### Evidence Admissibility Requirements
- Evidence must be **relevant** (relates to the facts of the case)
- Evidence must be **material** (important to the case outcome)
- Evidence must be **competently acquired** (legally obtained)
- Note: Evidence does NOT need to be tangible to be admissible

### Chain of Custody Requirements
- Document WHO collected and handled evidence
- Document WHEN evidence was collected and transferred
- Document WHERE evidence was stored and moved
- Maintain continuous control from collection to court presentation
- Use evidence bags, lockers, and controlled access storage
- Maintain chain even if case takes years to reach court
- Chain of custody supports but does NOT guarantee admissibility

### Investigation Types and Legal Frameworks

**Criminal Investigations**
- Driven primarily by law enforcement
- Standard of proof: beyond a reasonable doubt (highest standard)
- Penalties include imprisonment and criminal records
- Organization provides support to law enforcement
- Evidence rules are strictest

**Civil Investigations**
- Driven by organizations, individuals, and attorneys
- Standard of proof: preponderance of evidence (lower standard)
- Penalties are monetary (fines, damages, court costs)
- eDiscovery process for electronically stored information

**Regulatory Investigations**
- Driven by the associated regulatory body
- May involve specialized compliance requirements
- Examples: HIPAA, SOX, PCI DSS, GDPR compliance violations

**Administrative Investigations**
- Internal organizational investigations
- Driven by the organization itself
- May escalate to criminal, civil, or regulatory depending on findings
- Based on organizational policies and procedures

### Reporting Obligations
- **PII breach notification**: Most jurisdictions require notification to affected individuals
- **PCI DSS**: Requires reporting certain security incidents to law enforcement
- **Regulatory compliance**: Various laws mandate breach reporting timelines
- **Organizations may choose not to involve law enforcement** to avoid negative publicity, but this is NOT an option when personal information is exposed or when regulations mandate it

### eDiscovery
- Legal obligation to preserve electronic evidence begins when litigation is **reasonably anticipated** (not just when formally notified)
- Includes email, documents, databases, voicemail, social media, instant messages
- Failure to preserve evidence after anticipation of litigation can result in sanctions

---

## 7. FRAMEWORKS AND METHODOLOGIES

### NIST SP 800-61: Computer Security Incident Handling Guide
Four-phase incident response lifecycle:
1. **Preparation**: Establish policies, procedures, communications, and incident response team
2. **Detection and Analysis**: Identify incidents, determine scope and impact, prioritize response
3. **Containment, Eradication, and Recovery**: Contain the incident, remove cause, restore operations
4. **Post-Incident Activity**: Lessons learned, evidence retention, reporting

### CISSP 7-Step Incident Management Model
1. Detection
2. Response
3. Mitigation (containment)
4. Reporting
5. Recovery
6. Remediation
7. Lessons Learned

(Note: Preparation is assumed as a pre-incident activity)

### ITIL (Information Technology Infrastructure Library)
- Framework for IT service management
- Originated from UK government publications
- Covers change management, configuration management, service-level management
- Not mandatory to adopt, but many organizations use its concepts
- Provides structured approach to IT operations

### Forensic Investigation Methodology
1. **Identify and secure the scene** -- prevent contamination, initiate chain of custody
2. **Collect evidence** -- follow proper procedures, create forensic copies, document everything
3. **Examine evidence** -- automated and manual analysis of collected data
4. **Analyze findings** -- determine what happened, identify culprits, establish timeline
5. **Report results** -- compile findings for relevant stakeholders, prepare for potential court proceedings

### Change Management Framework
1. Change Request (document the proposed change)
2. Impact Assessment (evaluate scope, risk, dependencies)
3. Approval (CAB/ECAB review and decision)
4. Build and Test (develop in non-production, regression test, create backout plan)
5. Notification (inform all affected stakeholders)
6. Implementation (deploy during scheduled maintenance window)
7. Validation (verify change works correctly, regression test production)
8. Version and Baseline Update (update documentation, establish new baseline)

### BCP/DRP Methodology (7 Steps)
1. Develop contingency planning policy
2. Conduct Business Impact Analysis (BIA)
3. Identify preventive controls
4. Create contingency/recovery strategies
5. Develop contingency plan(s)
6. Ensure testing, training, and exercises
7. Plan maintenance

### BIA Process Steps
1. Determine mission/business processes and recovery criticality
2. Identify resource requirements
3. Identify recovery priorities for system resources

### Patch Management Lifecycle
1. Monitor for vulnerability releases (threat intelligence)
2. Acquire patches
3. Evaluate applicability
4. Prioritize based on risk
5. Test in non-production environment
6. Approve through change management
7. Deploy (manual for high-value systems, automated for standard systems)
8. Verify deployment (audit and scan)

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Incident Response Lifecycle
```
Preparation --> Detection --> Response --> Mitigation/Containment
    ^                                          |
    |                                          v
Lessons Learned <-- Remediation <-- Recovery <-- Reporting
    |
    v
(Feed improvements back into Preparation and Detection)
```

### Disaster Recovery Process Flow
```
Normal Operations
    |
    v
Event/Incident Occurs
    |
    v
Incident Response Process Initiated
    |
    v
Impact Assessment: Will MTD be exceeded?
    |           |
   NO          YES
    |           |
    v           v
Continue IR    Declare Disaster (authorized by CEO/BC Board)
                |
                v
            Activate DRP & Emergency Response Team
                |
                v
            Establish Communications (internal + external)
                |
                v
            Move MOST CRITICAL systems to DR site FIRST
                |
                v
            Operate from DR site
                |
                v
            Rebuild/Repair Primary Site
                |
                v
            Move LEAST CRITICAL systems back FIRST
                |
                v
            Move remaining systems back
                |
                v
            Validate primary site operations
                |
                v
            DR Complete: Full operations at primary site
                |
                v
            Lessons Learned Review
```

### Change Management Process
```
Change Request --> Assess Impact --> Approval (CAB/ECAB)
                                        |
                                   Approved?
                                   /       \
                                 NO        YES
                                  |         |
                                  v         v
                              Document   Build & Test
                              Rejection      |
                                             v
                                        Notification
                                             |
                                             v
                                        Implementation
                                             |
                                             v
                                        Validation
                                             |
                                             v
                                    Version & Baseline Update
                                             |
                                             v
                                        Documentation
```

### Evidence Collection Process (Chain of Custody)
```
1. Secure the scene (prevent contamination)
2. Document the scene (photographs, diagrams, notes)
3. Identify evidence (physical and digital)
4. TAG evidence (who, what, when, where)
5. BAG evidence (carefully store, seal containers)
6. CARRY evidence (transport to secure evidence locker)
7. Create forensic copies (bit-for-bit, hash both copies)
8. Verify integrity (compare hash values)
9. Work only with the SECOND copy
10. Store original and first copy securely
11. Maintain continuous documentation through entire lifecycle
```

### Backup Strategy Decision Flow
```
Full Backup (Sunday/Weekly)
    |
    |-- Incremental Strategy:
    |   Mon: Changes since Mon's start (resets archive bit)
    |   Tue: Changes since Tue's start (resets archive bit)
    |   Wed: Changes since Wed's start (resets archive bit)
    |   ...
    |   Restore: Full + Mon + Tue + Wed + Thu + Fri + Sat
    |
    |-- Differential Strategy:
        Mon: Changes since Full (archive bit NOT reset)
        Tue: Changes since Full (archive bit NOT reset, grows)
        Wed: Changes since Full (archive bit NOT reset, grows more)
        ...
        Restore: Full + Latest Differential ONLY (2 tapes max)
```

### Forensic Hard Drive Analysis Flow
```
Discover system --> Is it running?
                        |
                    YES     NO
                     |       |
                     v       v
              Capture live  Remove hard drive
              evidence      |
              (RAM, cache)  v
                     |     Create 2 bit-for-bit copies
                     v      |
              Create 2      v
              bit-for-bit  Hash original + both copies
              copies        |
                     |      v
                     v     Hashes match?
              Hash all      |
              copies       YES --> Original in evidence bag (sealed)
                     |             Copy 1 in evidence bag (sealed)
                     v             Copy 2 = working copy for analysis
              Seal originals
              Work with copy 2
```

### Volatile Evidence Collection Order (Most to Least Volatile)
```
1. CPU cache and registers
2. RAM (Random Access Memory)
3. Routing tables, ARP cache, process table
4. Temporary files and swap space
5. Hard drive data
6. Remote logging and monitoring data
7. Physical configuration and network topology
8. Archival media (tapes, backups)
```

---

## 9. THINK LIKE A MANAGER

### Incident Escalation Decisions
- **When to escalate**: When the incident exceeds the capability of first responders, when it involves sensitive data, when legal implications exist, when it could affect business operations
- **Who to notify**: Designate a single spokesperson to avoid conflicting messages; include senior management for serious breaches; legal for potential prosecution; PR for public-facing incidents
- **When to involve law enforcement**: Required when personal data is exposed; required by standards like PCI DSS; consider when criminal activity is suspected; weigh against risk of negative publicity and intrusive investigation
- **When NOT to involve law enforcement**: Not an option when PII is exposed or when regulatory obligations mandate it

### Business Continuity Prioritization
- **People first, always**: No data, system, or process is more important than human safety
- **Focus on critical and essential functions only**: Not all business processes need to be recovered immediately; BIA determines what is truly critical
- **Cost-benefit analysis**: Lower RPO and RTO requirements mean exponentially higher costs; managers must balance acceptable risk against budget constraints
- **External dependencies**: Consider vendors, suppliers, utilities, and how their failures cascade into your operations

### Disaster Recovery Site Selection
- **Manager's perspective**: Choose based on MTD requirements, not just cost; a bank with a 4-hour MTD cannot rely on a cold site
- **Geographic disparity is essential**: Recovery site must be far enough that the same disaster cannot affect both sites
- **Internal vs. external**: Government organizations tend toward internal sites; private enterprise often uses external providers for cost efficiency
- **Reciprocal agreements are unreliable**: They look good on paper but rarely work in practice because both organizations may be affected by the same regional disaster

### Operations Security Principles
- **Least privilege is not optional**: Every account starts with zero access; privileges added based on job requirements only
- **Separation of duties prevents fraud better than any technical control**: A policy that requires two people for critical transactions dramatically reduces risk
- **Mandatory vacations and job rotation serve as detective controls**: They expose fraud that separation of duties alone may not prevent
- **Privileged account monitoring is critical**: APTs frequently exploit administrative accounts; monitoring these accounts detects advanced threats early

### Staff Safety Priority
- **Fail-safe always wins for human safety**: When choosing between security and safety in a fire, safety wins (doors unlock)
- **Travel security is an organizational responsibility**: Provide VPNs, temporary devices, and training; the organization cannot absolve itself of employee safety during business travel
- **Emergency management planning**: Have plans for natural and man-made disasters specific to each facility's geographic risks
- **Duress systems**: Personnel working alone need silent alarm capabilities; code words verify true status

### Key Manager Decisions
- **Do NOT hack back**: Counterattacks are illegal and escalate the situation; refer to law enforcement
- **Declare disaster based on MTD**: If MTD will be exceeded, activate DRP immediately; do not wait to confirm
- **Full-interruption testing requires management sign-off**: Because production systems are affected, this is a management decision
- **Documentation is not optional**: Emergency changes still require documentation; a change without documentation is a ticking time bomb
- **Root cause analysis drives lasting improvement**: Patching the symptom without understanding the cause guarantees recurrence

---

## 10. EXAM STRATEGY

### How Domain 7 is Tested (13% of exam)
- Domain 7 is one of the largest domains by weight and covers the broadest range of operational topics
- Questions tend to be scenario-based, asking you to identify the BEST action in a given situation
- Expect questions that blur the line between incident response and disaster recovery -- know when IR ends and DR begins (answer: when MTD will be exceeded)
- Many questions test whether you understand the ORDER of steps (IR lifecycle, change management, DRP testing)

### Question Patterns
- **"What is the FIRST thing you should do?"** -- Usually detection/securing the scene for investigations, or safety of people for disasters
- **"What is the BEST approach?"** -- Think like a manager; prioritize people, then business continuity, then assets
- **"Which control BEST prevents...?"** -- Distinguish between preventive (stops it) and detective (finds it after the fact)
- **"What type of evidence is this?"** -- Know the difference between real (physical object), direct (eyewitness), circumstantial (inference), and hearsay (second-hand)
- **"What type of backup requires the least/most storage?"** -- Incremental = least; Mirror/Full = most
- **"What RAID level provides...?"** -- RAID 0 = speed only; RAID 1 = redundancy; RAID 5 = balance; RAID 10 = best of both

### Wrong-Answer Traps
- Answers that suggest counterattacking or hacking back
- Answers suggesting you can decontaminate evidence
- Answers that prioritize assets over people safety
- Answers that confuse BCP (business processes) with DRP (technology recovery)
- Answers that suggest RAID replaces backups
- Answers giving full-interruption test without prerequisite testing
- Answers suggesting chain of custody "guarantees" admissibility
- Answers confusing need-to-know (data access) with least privilege (action permissions)
- Answers suggesting powering off a compromised system before capturing volatile evidence

### Time-Based Metrics Exam Focus
- Know that MTD = RTO + WRT
- Know that if RTO is close to or exceeds MTD, the organization is at extreme risk
- Know that declaring disaster is triggered by anticipation that MTD WILL be exceeded
- Know the cost relationship: shorter RPO/RTO = more expensive solutions

### DRP Testing Order (Least to Most Disruptive)
1. Read-through/Checklist (paper review)
2. Walkthrough/Tabletop (group discussion)
3. Simulation (scenario response, paper-based)
4. Parallel (test at recovery site, production unaffected)
5. Full-interruption (production affected, most realistic, requires management approval)

---

## 11. CROSS-DOMAIN CONNECTIONS

### Domain 7 <-> Domain 1 (Security and Risk Management)
- **BCP/DRP planning** is covered in both domains; D1 focuses on the policy and management framework; D7 focuses on the operational implementation and testing
- **Risk management** fundamentals from D1 drive D7 decisions about recovery site selection, backup strategies, and acceptable downtime
- **Due care and due diligence** from D1 are demonstrated through D7 operational practices (monitoring, patching, change management)
- **Security governance** from D1 establishes the authority for D7's change management boards and incident response teams

### Domain 7 <-> Domain 6 (Security Assessment and Testing)
- **Logging and monitoring** overlap significantly; D6 covers audit and accountability requirements; D7 covers SIEM implementation and continuous monitoring operations
- **Vulnerability assessment and scanning** tools used in D7 patch management feed into D6 testing programs
- **Log management and review** practices from D7 support D6 audit and compliance activities
- **Continuous monitoring** in D7 validates the effectiveness of controls tested in D6

### Domain 7 <-> Domain 4 (Communication and Network Security)
- **Network monitoring** (IDS/IPS, NIDS, firewalls) from D4 generates the alerts that D7's SIEM correlates
- **Egress monitoring** prevents data exfiltration, bridging D4 network controls and D7 operational monitoring
- **Network attacks** (DoS, DDoS, SYN flood, Smurf, Fraggle) are covered in D7 from a response perspective and D4 from a prevention perspective
- **VPN and secure communications** from D4 are operational security measures managed under D7

### Domain 7 <-> Domain 5 (Identity and Access Management)
- **Privileged account management** and **least privilege** are D5 access control concepts operationalized in D7
- **Access logging and monitoring** from D7 validates D5 access control effectiveness
- **Authentication monitoring** in D7 detects credential-based attacks addressed in D5
- **Account provisioning and deprovisioning** lifecycle from D5 ties into D7's operational security concepts

### Domain 7 <-> Domain 2 (Asset Security)
- **Asset management and inventories** bridge D2 classification/ownership with D7 operational tracking
- **Media management and protection** in D7 implements the classification scheme established in D2
- **Data destruction and sanitization** is covered in both domains from different perspectives

### Domain 7 <-> Domain 3 (Security Architecture and Engineering)
- **Physical security** (7.14) is primarily covered in D3 but referenced in D7
- **Failure modes** (fail-safe, fail-secure, fail-open) are architectural concepts operationalized in D7
- **RAID and system resilience** are engineering concepts managed operationally in D7
- **Least privilege and SoD** are design principles from D3 implemented operationally in D7

### Domain 7 <-> Domain 8 (Software Development Security)
- **Change management** in D7 includes software version control and code deployment procedures
- **Malware types and defenses** in D7 relate to secure coding practices in D8
- **Sandboxing** is both a development testing concept (D8) and an operational security measure (D7)

---

## 12. REAL-WORLD APPLICATION

### Incident Response Scenario: Ransomware Attack
**Situation**: Organization discovers encrypted files across multiple servers on a Monday morning.
- **Detection**: SIEM alerts on unusual file encryption activity across network shares; users report inability to access files
- **Response**: CSIRT activated; impact assessment reveals 40% of production servers affected; ransom note demands Bitcoin payment
- **Mitigation**: Affected systems isolated from network by disabling network adapters (NOT powering off); unaffected segments segmented behind additional firewall rules
- **Reporting**: CISO notified; legal counsel engaged; regulatory notification prepared for affected customer data; single spokesperson designated for media inquiries
- **Recovery**: Systems rebuilt from clean images; data restored from last verified backup (RPO determines data loss); all systems verified before reconnection
- **Remediation**: Root cause identified as phishing email; implemented email filtering, user training, network segmentation, and endpoint detection
- **Lessons Learned**: Identified gaps in email filtering, backup verification frequency, and user security awareness training

### Disaster Recovery Scenario: Data Center Fire
**Situation**: Fire suppression system activates in primary data center after an electrical fault.
- **Safety First**: All personnel evacuated; no one re-enters until building safety confirmed
- **Assessment**: Physical damage assessment reveals 3-week minimum rebuild time; MTD for critical systems is 8 hours
- **Declaration**: CEO declares disaster because 3 weeks far exceeds 8-hour MTD
- **DR Activation**: Hot site activated (pre-configured with recent data replication); most critical systems brought online within 4 hours
- **Communications**: Employees notified of temporary operations; customers informed of potential minor disruptions; regulators notified
- **Restoration**: Over the following weeks, primary site rebuilt; least critical systems moved back first to validate infrastructure; most critical systems moved last once site proven stable

### Forensic Investigation Example: Insider Data Theft
**Situation**: DLP system flags large data transfers to an external cloud storage service by an employee.
- **Scene Security**: Employee's workstation identified but not disturbed; monitoring increased on the account
- **Live Evidence**: Forensic team captures RAM contents, running processes, and network connections before any changes
- **Forensic Copies**: Two bit-for-bit copies of the hard drive created; hashes of original and copies match, confirming integrity
- **Chain of Custody**: Evidence tagged (date, time, handler), bagged (anti-static evidence bags), and stored in evidence locker
- **Analysis**: Working copy reveals deleted files in unallocated disk space showing exfiltrated documents; browser history confirms cloud storage uploads; timeline analysis establishes pattern over 3 months
- **Investigation Type**: Starts as administrative; escalated to criminal when intellectual property theft confirmed

### Change Management Failure Example
**Situation**: Network administrator closes an "unrecognized" port on a firewall without following change management.
- **Impact**: Web application loses connectivity to backend database; help desk flooded with user complaints
- **Troubleshooting**: Hours spent investigating web server, then database, before discovering the firewall change
- **Resolution**: Port reopened; web application restored
- **Lesson**: If change management had been followed, the port's purpose would have been identified during impact assessment, the change would have been tested, and a rollback plan would have been in place

---

## 13. MEMORY AIDS AND MNEMONICS

### Incident Response Steps: "DR. MIRROR LL"
- **D**etection
- **R**esponse
- **MI**tigation (containment)
- **R**eporting
- **R**ecovery
- **O**verhaul (remediation)
- **L**essons **L**earned

### NIST IR Phases: "PDCR" - "Police Detectives Catch Robbers"
- **P**reparation
- **D**etection and Analysis
- **C**ontainment, Eradication, and Recovery
- **R**eview (Post-Incident Activity)

### Five Rules of Evidence: "A² C² A" (or "AACCA")
- **A**uthentic (came from the scene)
- **A**ccurate (has integrity, not modified)
- **C**omplete (all evidence shared)
- **C**onvincing/Reliable (understandable, demonstrates truth)
- **A**dmissible (accepted by the court)

### Recovery Site Speed: "Can Warm Hotdogs Heat Rapidly? Mirrors Show!"
- **C**old = Weeks
- **W**arm = Days
- **H**ot = Hours
- **R**edundant/Mirror = Seconds

### Backup Types Memory: "I reset, D doesn't"
- **I**ncremental resets the archive bit
- **D**ifferential does NOT reset the archive bit

### Backup Restore Speed (Slowest to Fastest): "I'm Definitely Faster, Miraculously"
- **I**ncremental = Slowest restore (many tapes)
- **D**ifferential = Moderate (2 tapes)
- **F**ull = Fast (1 tape but big)
- **M**irror = Fastest (exact copy)

### RAID Levels: "0 Strips, 1 Mirrors, 5 Parties, 10 Does Both"
- RAID **0** = **S**triping (Speed, no safety)
- RAID **1** = **M**irroring (Mirrors data)
- RAID **5** = **P**arity (Protection + performance)
- RAID **10** = **B**oth mirroring + striping

### MTD Formula: "MTD = RTO + WRT" ("Must Total Down = Recovery Time + Work Recovery Time")

### BCM Goals Priority: "People, Property, Profit"
1. **People** (safety of humans)
2. **Property** (minimize damage)
3. **Profit** (business survival)

### Change Management Steps: "RAAB NIV"
- **R**equest
- **A**ssess impact
- **A**pproval
- **B**uild and test
- **N**otification
- **I**mplement
- **V**alidation + Version/Baseline

### Investigation Types: "CCAR" - "Cops, Courts, Agencies, Runs-internally"
- **C**riminal (law enforcement)
- **C**ivil (courts, monetary)
- **A**gency/Regulatory (regulator body)
- **R**uns internally (administrative)

### Evidence Chain: "TAG, BAG, CARRY"
- **TAG** it (label who, what, when, where)
- **BAG** it (secure storage)
- **CARRY** it (transport to evidence locker)

### DR Site Movement: "Most Critical Goes OUT First, Least Critical Comes BACK First"
- Moving TO DR site: Most critical systems first (get critical ops running)
- Moving BACK to primary: Least critical systems first (test the rebuilt site safely)

### MOM for Investigations
- **M**otive (why would they do it?)
- **O**pportunity (could they do it?)
- **M**eans (did they have the capability?)

### Spare Parts Temperature: "Cold on Shelf, Warm in Box, Hot and Ready"
- **Cold** spare = sitting on a shelf
- **Warm** spare = installed but not powered
- **Hot** spare = installed, powered, ready to take over instantly

---

## 14. PRACTICE QUESTION PATTERNS

### Pattern 1: Ordering and Sequencing
Questions ask you to identify what comes first, next, or last in a process.
- "What is the first step after detecting a security incident?" (Response/activate IR team)
- "What is the final phase of incident management?" (Lessons learned)
- "In what order should DRP tests be performed?" (Read-through -> Walkthrough -> Simulation -> Parallel -> Full-interruption)
- "Which systems should be moved to the DR site first?" (Most critical)
- "Which systems should be restored to the primary site first?" (Least critical)

### Pattern 2: Definition Discrimination
Questions test whether you can distinguish between similar concepts.
- Event vs. incident vs. disaster
- Need-to-know vs. least privilege
- BCP vs. DRP vs. BCM
- IDS vs. IPS
- RAID levels and their properties
- Recovery site types and their recovery times
- Evidence types (real vs. direct vs. circumstantial vs. hearsay)

### Pattern 3: Best Practice Selection
Questions present a scenario and ask for the BEST or MOST APPROPRIATE action.
- "A system is compromised. What should you do FIRST?" (Contain/isolate, do NOT power off)
- "An employee is suspected of fraud. What control would BEST detect this?" (Mandatory vacation or job rotation)
- "What is the MOST important consideration during disaster response?" (Safety of people)
- "What backup strategy provides the FASTEST restore?" (Mirror, then full, then differential)
- "What provides the BEST protection for tape backups being shipped offsite?" (Encryption)

### Pattern 4: Scenario-Based Application
Questions present complex scenarios requiring integration of multiple concepts.
- Calculating how many files are included in a backup based on change dates and backup type
- Determining whether a given situation constitutes an event, incident, or disaster
- Identifying the appropriate investigation type for a given scenario
- Selecting the right recovery site based on MTD requirements
- Choosing the correct RAID level based on performance and redundancy needs

### Pattern 5: "NOT" and "LEAST" Questions
Questions asking what does NOT apply or what is LEAST effective.
- "Which of the following is NOT a type of backup rotation?" (Meet-in-the-Middle)
- "Which is LEAST useful for deterring insider fraud?" (Incident response -- it is reactive, not deterrent)
- "Which is NOT a requirement for evidence admissibility?" (Tangibility -- evidence does not need to be physical)
- "Which is NOT a privileged administrative activity requiring logging?" (Logging into a workstation -- this is a normal user action)

### Pattern 6: Control Classification
Questions testing whether you know the type of security control.
- Job rotation = detective AND deterrent
- Mandatory vacation = detective AND deterrent
- Separation of duties = preventive
- IDS = detective
- IPS = preventive
- Firewall = preventive
- Audit trail = detective
- Encryption = preventive

### Commonly Tested Concepts
- Difference between incremental and differential backups (archive bit behavior)
- When to declare a disaster (MTD will be exceeded)
- What completes disaster recovery (restoring operations at PRIMARY site, not DR site)
- Default access level for new accounts (no access)
- SIEM capabilities (aggregation, normalization, correlation, storage, analysis, reporting)
- Forensic copy requirements (bit-for-bit, hash verification, work with second copy only)
- The role of CAB in change management
- QoS concepts (latency, jitter, packet loss)

---

## 15. GAPS TO ADD (Topics Not in Current Story Mode)

### Currently Covered in Story Mode:
- NIST IR Lifecycle (4 phases)
- Containment Strategies
- DR Metrics (RTO/RPO/MTBF/MTTR)
- Change Management
- Logging/Monitoring/SIEM
- Chain of Custody
- Forensic Imaging

### Topics NOT Yet Covered -- Should Be Added:

**High Priority (Heavily Tested)**
- Backup strategies in depth (incremental vs. differential, archive bit, 3-2-1 rule, tape rotation schemes)
- Recovery site types and comparisons (cold/warm/hot/mobile/redundant with recovery times and costs)
- RAID levels (0, 1, 5, 6, 10) with minimum drives, redundancy, and performance characteristics
- BIA process (purpose, steps, relationship to RPO/RTO/WRT/MTD)
- DRP testing types (read-through through full-interruption, order, and requirements)
- Evidence types and rules (real, direct, circumstantial, hearsay, corroborative, best evidence, secondary; five rules of evidence)
- Investigation types (criminal, civil, regulatory, administrative with who drives and burden of proof)
- WRT concept and MTD = RTO + WRT formula
- Restoration order (most critical to DR site first; least critical back to primary first)

**Medium Priority (Regularly Tested)**
- Malware types (virus, worm, Trojan, ransomware, rootkit, logic bomb, polymorphic, botnet, boot sector, data diddler, zero-day)
- Anti-malware approaches (signature-based vs. heuristic vs. activity monitor vs. change detection)
- Foundational security operations concepts (need-to-know vs. least privilege, SoD, two-person control, split knowledge, mandatory vacations, PAM, SLAs)
- Failure modes (fail-safe, fail-secure, fail-soft/fail-open)
- Patch management lifecycle (evaluate, test, approve, deploy, verify)
- Vulnerability management (scans, CVE database, relationship to patching)
- Network attacks and defenses (DoS/DDoS, SYN flood, Smurf, Fraggle, botnets)
- Configuration management (provisioning, baselining, imaging, automation, hardening)

**Lower Priority (Occasionally Tested)**
- Clustering vs. redundancy
- Electronic vaulting, remote journaling, remote mirroring
- Locard's Exchange Principle
- MOM (Motive, Opportunity, Means)
- Reciprocal agreements and resource capacity agreements
- Multiple processing sites
- SOAR capabilities
- UEBA
- EDR
- Threat hunting vs. threat intelligence
- Scalability vs. elasticity in cloud
- Serverless architecture (FaaS)
- Shared responsibility model (SaaS/PaaS/IaaS)
- Media management (tape handling, USB controls, mobile devices)
- Personnel safety (travel, duress, emergency management)
- eDiscovery
- Forensic artifacts
- Mobile device forensic challenges
- CRC (Cyclic Redundancy Check) for backup integrity
- XaaS, SECaaS, MSP, MSSP concepts
