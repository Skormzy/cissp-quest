# CISSP Quest — Personal Build Spec (Part 2)
> Companion to CISSP_QUEST_PERSONAL_BUILD_SPEC.md
> Contains: detailed scene outlines for Acts 4 through 8, complete memory hack registry, exam objective coverage matrix, content authoring templates.

---

## 6.4 ACT 4 — Communication and Network Security (Domain 4, 13%)

**Title:** "The Wire"
**Location:** Singapore. Undersea Cable Station + Meridian Data Center.
**Estimated playtime:** 3 to 4 hours
**Domain weight:** 13%

**Core teaching themes:**
1. OSI and TCP/IP models (layers, protocols, attacks at each)
2. Secure network components (firewalls, IDS/IPS, proxies, load balancers, jump hosts)
3. Network attacks (DDoS, MitM, ARP poisoning, DNS poisoning, session hijacking, sniffing)
4. Secure protocols (TLS, IPsec, SSH, SFTP, S/MIME, SRTP)
5. Wireless security (WPA3 vs WPA2, 802.1X, EAP variants, evil twin, deauth attacks)
6. Network segmentation (VLAN, subnetting, microsegmentation, zero trust networks)
7. Remote access (VPN types: site-to-site vs remote access, SSL VPN vs IPsec VPN, ZTNA)
8. Voice and multimedia (VoIP attacks, SIP/RTP, secure conferencing)
9. Software-defined networking (SDN), network function virtualization (NFV)
10. Content delivery and edge networks

**Scene-by-scene outline:**

**S1 transition.** Munich-to-Singapore flight. Dawn over the Pacific.

**S2 cold_open dialogue.** Singapore undersea cable landing station. Webb explains: "This is where Meridian's traffic actually lives. Three cables, two providers, one massive blind spot." Salt air, server hum, Pacific waves outside.

**S3 dialogue.** Local Meridian network team is defensive. Their CTO insists they "have a firewall." Webb's eyebrow raises.

**S4 investigation.** Network topology diagram. Hotspots reveal: flat L2 network, no segmentation between guest WiFi and production, no jump hosts, vendor VPN with permanent tunnel, IDS in monitor mode only (not blocking), DNS resolver is open recursion.
MEMORY HACK: "Flat networks are like open-plan offices. Sounds collaborative until someone screams during your call." Network segmentation = walls.

**S5 visualization.** Network Topology Tracer (Section 7.6 of main spec). {playerName} clicks each OSI layer, sees what attack types live at each, sees which controls Meridian had at each.
MEMORY HACK: "Please Do Not Throw Sausage Pizza Away" (Physical, Data Link, Network, Transport, Session, Presentation, Application).

**S6 knowledge_check.** OSI layer attack identification. ARP poisoning lives at L2. DNS attacks at L7 (application) but use L3 underneath. TCP session hijacking at L4. SSL stripping at L7.
MEMORY HACK: "ARP and ARP-eggio. Layer 2's where ARP plays."

**S7 dialogue.** Webb walks {playerName} through TCP three-way handshake. Connects it to SYN flood DDoS. Then connects to why TCP intercept and SYN cookies exist as defenses.
MEMORY HACK: "SYN, SYN-ACK, ACK. Three handshakes. Skip any one and you don't have a connection."

**S8 visualization.** TLS handshake step-through. Client Hello, Server Hello, certificate exchange, key exchange, finished. Compare TLS 1.2 vs 1.3 (1.3 is one round trip vs two).
VIZ component: TLSHandshakeAnimator
MEMORY HACK: "TLS 1.3 dropped the bloat: no MD5, no SHA-1, no RC4, no static RSA, no compression. Forward secrecy mandatory. One round trip."

**S9 knowledge_check.** TLS attack scenario: Heartbleed, BEAST, POODLE, CRIME identification. Trap: tempting to pick "Use TLS" as defense but the question wants version-specific detail.

**S10 investigation.** Discover lateral movement evidence in Meridian's logs. Attacker pivoted from compromised guest WiFi → flat L2 → admin workstation → domain controller. Each pivot mapped to a missing control.
MEMORY HACK: "Castle-and-moat dies the moment the attacker is inside. Microsegmentation is putting a moat around every room."

**S11 visualization.** VPN comparison: site-to-site vs remote access, IPsec vs SSL VPN vs ZTNA. Player picks scenarios, gets recommendation with reasoning.
VIZ component: VPNSelector
MEMORY HACK: "Site-to-site is permanent gateway-to-gateway. Remote access is temporary user-to-gateway. ZTNA is per-app, never tunnels everything."

**S12 dialogue.** Meridian's WiFi was WPA2-PSK with the password printed in every conference room. Tanaka: "How long until that ends up on a cleaner's phone?"
MEMORY HACK: "WPA3 is to WPA2 what TLS 1.3 is to 1.2: forward secrecy mandatory, dictionary attacks killed, basically why you upgrade."

**S13 knowledge_check.** WPA2 vs WPA3 vs Enterprise (802.1X) selection scenario.

**S14 evidence_board.** Connect Act 4 findings (flat network, no segmentation, weak WiFi, open DNS) back to Act 3 (architecture review failures) and Act 1 (no governance over network design decisions).

**S15 decision.** Meridian wants to "just buy a better firewall." {playerName} must explain why architecture and segmentation matter more than spending. TLATM meter rewards architecture-first thinking.

**S16 visualization.** Zero Trust Network Architecture interactive. Player toggles between perimeter model and zero trust, sees how each handles a compromised endpoint.
VIZ component: ZeroTrustExplorer
MEMORY HACK: "Never trust, always verify. Perimeter says 'inside good, outside bad.' Zero trust says 'every request proves itself, every time.'"

**S17 tlatm_meter.** Mid-act check.

**S18 aha_moment.** "{playerName}, every Domain 4 question on the exam will test these primitives. You can't memorize ports without understanding why segmentation matters."

**S19 debrief.** Tanaka's notebook page 4. Network security memory hacks consolidated.

**Assessment.** 25 questions, 70% to proceed.

**Memory hacks added (running list, Acts 1-4 cumulative):**
- Acts 1-3 hacks (see main spec Section 6)
- OSI mnemonic: Please Do Not Throw Sausage Pizza Away
- TCP handshake: SYN, SYN-ACK, ACK
- TLS 1.3 dropped the bloat
- Castle-and-moat dies inside (microsegmentation)
- ZTNA per-app, never tunnels everything
- WPA3 forward secrecy mandatory
- Zero trust: never trust, always verify
- ARP-eggio at Layer 2

---

## 6.5 ACT 5 — Identity and Access Management (Domain 5, 13%)

**Title:** "The Insider"
**Location:** New York. Meridian Financial Division.
**Estimated playtime:** 3 to 4 hours
**Domain weight:** 13%

**Core teaching themes:**
1. Identification, Authentication, Authorization, Accountability (IAAA)
2. Authentication factors (something you know, have, are, do, somewhere)
3. Multi-factor authentication (MFA, contrast with 2-step verification)
4. Single sign-on (SSO) and federation (SAML, OAuth 2.0, OIDC, Kerberos)
5. Access control models (DAC, MAC, RBAC, ABAC, RuBAC)
6. Privileged access management (PAM, PIM, just-in-time access)
7. Identity lifecycle (provisioning, deprovisioning, joiner-mover-leaver)
8. Account types (user, service, shared, admin, guest)
9. Session management
10. Insider threat (recognition, prevention, detection)

**Scene-by-scene outline:**

**S1 transition.** Singapore-to-New York. Manhattan skyline at sunrise.

**S2 cold_open dialogue.** Meridian Financial Division offices. Trading floor energy. {playerName} meets the CISO of the financial division, who mentions "Ghost" in passing. {playerName}'s ears perk up. This is Act 5's mystery.

**S3 dialogue.** Webb pulls up access logs. Patterns suggest insider activity. James "Ghost" Holloway's name surfaces. Former senior analyst, left 6 months ago under unclear circumstances. His credentials still active in 3 systems.
MEMORY HACK: "The Joiner-Mover-Leaver problem. Joiners get too few permissions slow. Movers accumulate forever. Leavers retain access until something forces a cleanup."

**S4 investigation.** Identity hygiene audit. Hotspots: 47 active accounts for departed employees, 12 service accounts with passwords last rotated in 2021, shared admin account "admin1" with 8 people knowing the password, no PAM solution, MFA enabled for email but not for the Linux jump hosts.

**S5 visualization.** IAAA model interactive. Player walks through each phase for a sample login: identification (claim), authentication (prove), authorization (allowed?), accountability (logged?).
VIZ component: IAAAFlowExplorer
MEMORY HACK: "Identification is your name tag. Authentication is the bouncer checking ID. Authorization is which rooms you can enter. Accountability is the security camera."

**S6 knowledge_check.** MFA factor identification. Question lists 5 things, asks which are valid factors. Trap: "Username and password" is NOT MFA (both are 'something you know').
MEMORY HACK: "Know, Have, Are, Do, Where. Five factor categories. MFA needs two from different categories, not two from the same."

**S7 dialogue.** Vasquez explains insider threat psychology. Disgruntled employees, financial pressure, ideology, ego. Ghost's profile fits the disgruntled-plus-financial pattern.
MEMORY HACK: "MICE motivations. Money, Ideology, Coercion, Ego. (Some add Excitement → MICE-X.)"

**S8 visualization.** Access Control Lab (Section 7.7 of main spec). Player creates DAC, MAC, RBAC, ABAC scenarios. Tests access requests. Sees which model handles which scenario.
MEMORY HACK: "DAC owner-driven. MAC label-driven. RBAC role-driven. ABAC attribute-driven. OLRA = Owner Label Role Attribute = order of evolution."

**S9 knowledge_check.** Access control model selection scenario. Government classified system → MAC. Healthcare with RBAC + emergency override → ABAC needed for break-glass. Standard corporate → RBAC.

**S10 investigation.** Discover Ghost's actual exploit path. He used a service account he knew had been forgotten, escalated via a sudo misconfiguration, accessed financial systems for 6 weeks before triggering an alert.
MEMORY HACK: "Service accounts are the forgotten dragons. Nobody owns them, everybody uses them, they live forever."

**S11 dialogue.** Tanaka explains PAM/PIM principles. Just-in-time elevation. Session recording. Approval workflows. Vault for credentials.
MEMORY HACK: "PAM is the keyring. PIM is the schedule of when keys can be borrowed. Together: nobody walks around with master keys."

**S12 visualization.** Federation walkthrough. SAML vs OAuth 2.0 vs OIDC. When to use each.
VIZ component: FederationProtocolPicker
MEMORY HACK: "SAML for enterprise SSO with assertions. OAuth for delegation (give app access to your stuff). OIDC for OAuth + identity layer (login with Google)."

**S13 knowledge_check.** Federation scenario question. Trap: OAuth alone is delegation, not authentication. OIDC is the authentication layer on top.

**S14 evidence_board.** Connect Act 5 (IAM failures) back to Act 1 (no governance), Act 2 (no data classification meant no access boundaries), Act 3 (architecture didn't enforce least privilege), Act 4 (network access amplified IAM mistakes).

**S15 decision.** Discovered: Ghost still had access on Day 1 of breach. {playerName} must advise on immediate response. Options test containment thinking, evidence preservation, legal notification. TLATM meter heavily rewards governance + evidence preservation answers.

**S16 visualization.** Identity lifecycle interactive. Player walks through joiner → mover → leaver for a sample employee. Sees what should happen at each. Sees what Meridian failed to do.
VIZ component: IdentityLifecycleTracker

**S17 tlatm_meter.** Mid-act check.

**S18 aha_moment.** "{playerName}, the exam will give you scenarios where the answer feels technical but is actually about who owns the access. Remember Ghost: the gap that killed Meridian was nobody owning the deprovisioning process."

**S19 debrief.** Tanaka's notebook page 5.

**Assessment.** 25 questions, 70% to proceed.

**Note on Ghost POV bonus scenes:** These are deferred to Stage 2 (commercial build) per spec scope. The Ghost story arc still resolves in Act 5 main scenes via Tanaka's investigation, just without the bonus playable adversary perspective.

---

## 6.6 ACT 6 — Security Assessment and Testing (Domain 6, 12%)

**Title:** "The Audit"
**Location:** Sentinel Dynamics Lab + Meridian Cloud (Remote sessions).
**Estimated playtime:** 2.5 to 3 hours
**Domain weight:** 12%

**Core teaching themes:**
1. Assessment types (vulnerability scan, pen test, red team, purple team, security audit, compliance audit)
2. Pen testing methodology (PTES, NIST SP 800-115, OWASP testing guide)
3. Vulnerability management lifecycle (discover, assess, prioritize, remediate, verify, report)
4. Security control testing (preventive, detective, corrective, deterrent, compensating, recovery, directive)
5. Code review (static SAST, dynamic DAST, IAST, SCA for dependencies)
6. Log management and SIEM (collection, normalization, correlation, alerting)
7. Audit trails and review
8. KPI/KRI metrics
9. Reporting (technical vs executive)
10. Continuous monitoring vs periodic assessment

**Scene-by-scene outline:**

**S1 transition.** Return to Sentinel Dynamics Lab in Toronto for analysis phase.

**S2 cold_open dialogue.** Lab is full of monitors showing scans in progress against Meridian's infrastructure. Mechanical keyboard symphony. Webb is in element.

**S3 dialogue.** Tanaka briefs {playerName}: "We've responded. Now we assess. The exam tests whether you know the difference between a vuln scan, a pen test, and a red team engagement. Most candidates conflate them."
MEMORY HACK: "Vuln scan finds doors. Pen test opens doors. Red team walks through doors and steals the silverware."

**S4 investigation.** Review Meridian's last "pen test" report. Hotspots reveal it was actually just a vuln scan (Nessus output reformatted). No exploitation, no chained findings, no business impact analysis. Sold for $15K. Worthless.

**S5 visualization.** Assessment type comparison matrix. Rows: vuln scan, pen test, red team, purple team, audit. Columns: scope, depth, time, output, cost.
VIZ component: AssessmentComparisonMatrix
MEMORY HACK: "Scan is broad and shallow. Pen test is narrow and deep. Red team is realistic and emotional. Audit is procedural and paper-trail."

**S6 knowledge_check.** Assessment selection scenario. Annual compliance requirement → audit. Pre-launch validation → pen test. Realistic adversary simulation → red team. Continuous → automated scan.

**S7 dialogue.** Webb walks {playerName} through PTES phases.
MEMORY HACK: "PTES seven phases: Pre-engagement, Intelligence Gathering, Threat Modeling, Vulnerability Analysis, Exploitation, Post-Exploitation, Reporting." Mnemonic: "Please Inform Tanaka, Vulnerability Exists, Patch Promptly, Report."

**S8 investigation.** Examine Meridian's vulnerability management process. Hotspots: scans run quarterly (not continuous), prioritization by CVSS only (not contextualized), 78% of criticals untouched after 90 days, no SLA per severity.
MEMORY HACK: "CVSS gives the score. Context gives the priority. A critical CVE on an air-gapped lab system is less urgent than a high CVE on the internet-facing web server."

**S9 visualization.** Vulnerability management lifecycle interactive. Player walks a vuln from discovery through remediation. Sees what KPIs measure each phase.
VIZ component: VulnLifecycleTracker

**S10 knowledge_check.** Control type identification. Question lists 8 controls, asks classification. Trap: many controls span types (a guard is preventive AND detective AND deterrent).
MEMORY HACK: "PDC-CRD types: Preventive, Detective, Corrective, Compensating, Recovery, Deterrent, Directive."

**S11 dialogue.** Webb covers code testing approaches. SAST = read the code. DAST = test the running app. IAST = read AND test simultaneously. SCA = check the libraries you imported.
MEMORY HACK: "SAST reads. DAST runs. IAST does both. SCA checks who you trust."

**S12 visualization.** SIEM walkthrough. Show log ingest from multiple sources, normalization, correlation rules, alert generation. Player tunes a noisy rule.
VIZ component: SIEMTuner
MEMORY HACK: "Logs are evidence. Normalization makes them comparable. Correlation makes them story. Alerting makes them action."

**S13 knowledge_check.** SIEM scenario: too many alerts, analysts ignoring them. Question on tuning approach. Trap: "Disable noisy rules" is wrong; the answer is "tune thresholds and add suppression with periodic review."

**S14 evidence_board.** Connect assessment failures across all prior Acts.

**S15 decision.** Meridian asks Sentinel to write the post-breach report in a way that minimizes regulatory exposure. {playerName} must invoke Code of Ethics Canon I.

**S16 tlatm_meter, S17 aha_moment, S18 debrief.** Standard pattern.

**Assessment.** 25 questions, 70% to proceed.

---

## 6.7 ACT 7 — Security Operations (Domain 7, 13%)

**Title:** "The Response"
**Location:** Tokyo. Meridian Global SOC.
**Estimated playtime:** 3 to 4 hours
**Domain weight:** 13%

**Core teaching themes:**
1. Investigations (digital forensics, evidence handling, chain of custody)
2. Logging and monitoring activities (SIEM, EDR, NDR, XDR)
3. Configuration management
4. Foundational security operations concepts (need-to-know, least privilege, segregation of duties, two-person control)
5. Resource protection (data backup, BCP, DRP execution)
6. Incident management (full lifecycle: preparation through lessons learned)
7. Detective and preventive measures
8. Patch and vulnerability management
9. Change management
10. Disaster recovery (BIA execution, recovery strategies, plan testing types)
11. Personnel safety (privacy, duress, travel, emergency management)

**Scene-by-scene outline:**

**S1 transition.** Singapore (or wherever last) to Tokyo. Neon at night.

**S2 cold_open dialogue.** Meridian Tokyo SOC. NOC-style command center. Wall of screens. Tanaka: "This is where {playerName} runs portions of the response under my supervision. Earn it."

**S3 dialogue.** Tanaka introduces the IR phases formally. Connects to what they've already done across Acts 1-6.
MEMORY HACK: NIST 4-phase: "Preparation, Detection/Analysis, Containment/Eradication/Recovery, Post-Incident." (PDC-PI). Or extended SANS 6-phase: "Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned."

**S4 investigation.** Walk through the timeline of Meridian's actual breach with new evidence from Tokyo SOC logs. Hotspots reveal initial compromise (T-90 days), persistence (T-87), lateral movement (T-30), data exfil (T-14), discovery (T-0).
MEMORY HACK: "Dwell time. The gap between compromise and detection. Industry average measured in months. Good orgs measure in days. Great orgs measure in hours."

**S5 visualization.** IR Commander (Section 7.8 of main spec). Player runs a parallel scenario through all phases. Decisions matter.

**S6 knowledge_check.** Evidence handling scenario. Chain of custody question. Trap: "Powering off a running system to preserve state" is wrong; volatile memory is lost. Image first, then power off if needed.
MEMORY HACK: "Order of volatility: CPU registers, ARP cache, RAM, running processes, network connections, disk, archived media. Capture in that order."

**S7 dialogue.** Webb walks {playerName} through forensic acquisition: write blockers, hash before and after, work on copies never originals, document everything.
MEMORY HACK: "Hash before, hash after. If they match, your evidence is intact. If they don't, your case is dead."

**S8 visualization.** Backup strategy comparison. Full vs incremental vs differential. RTO/RPO implications. Tape vs disk vs cloud.
VIZ component: BackupStrategyComparator
MEMORY HACK: "Full is everything (slow backup, fast restore). Incremental is changes since last backup of any type (fast backup, slow restore, needs full chain). Differential is changes since last full (medium both ways)."

**S9 knowledge_check.** DR site type scenario. Hot vs warm vs cold vs mobile vs reciprocal vs cloud. Trap: "Hot site" is tempting for everything but cost matters.
MEMORY HACK: "Hot site = ready in hours, costs everything. Warm = ready in days, costs significant. Cold = ready in weeks, costs little. Cloud = ready in seconds, costs based on use."

**S10 investigation.** Examine Meridian's DR plan (which exists but was never tested). Hotspots reveal: contact tree includes 3 people who left, recovery procedures reference systems that were decommissioned, no tabletop exercise in 4 years.
MEMORY HACK: "An untested DR plan is fiction. Tabletop, walkthrough, simulation, parallel, full interruption: five test types in increasing realism."

**S11 dialogue.** Tanaka covers change management. ITIL flavor. Standard, normal, emergency change types. CAB (Change Advisory Board) role.

**S12 knowledge_check.** Change management scenario. Trap: "Skip the CAB for an emergency security patch" tempting but wrong; emergency change process exists for this and bypassing it creates audit issues.

**S13 visualization.** Configuration management drift detection. Show baseline vs current state for a sample server fleet. Player identifies drift, recommends remediation.
VIZ component: ConfigDriftViewer
MEMORY HACK: "Baseline is the contract. Drift is the violation. Continuous monitoring catches drift. Periodic audit confirms baseline."

**S14 evidence_board.** Connect all prior Act findings into a single Forensic Timeline (also Section 7.3 of main spec).

**S15 decision.** Meridian's CEO wants to declare incident closed prematurely. {playerName} must advocate for completing post-incident phase before closing.

**S16 visualization.** Patch management lifecycle. Discovery → testing → deployment → verification → reporting. Show what happens when Meridian skipped testing (Act 8 foreshadowing).
VIZ component: PatchLifecycleTracker

**S17 tlatm_meter, S18 aha_moment, S19 debrief.** Standard pattern.

**Assessment.** 25 questions, 70% to proceed.

---

## 6.8 ACT 8 — Software Development Security (Domain 8, 11%)

**Title:** "The Root Cause"
**Location:** Austin. Meridian Engineering.
**Estimated playtime:** 2.5 to 3 hours
**Domain weight:** 11%

**Core teaching themes:**
1. SDLC models (Waterfall, Agile, Scrum, Spiral, RAD, DevOps, DevSecOps)
2. Secure coding guidelines and standards (OWASP Top 10, OWASP ASVS, SEI CERT)
3. Application security (input validation, output encoding, parameterized queries, session management)
4. Software security testing (SAST, DAST, IAST, SCA, fuzzing, pen test of app)
5. Secure coding practices (least privilege in code, fail securely, complete mediation, defense in depth in code)
6. Acquired software security (open source, COTS, third-party libraries, supply chain attacks)
7. Software composition analysis (SCA) and dependency management
8. API security (REST, GraphQL, authentication, rate limiting)
9. Code repositories and version control security
10. CI/CD pipeline security
11. Database security (SQL injection prevention, NoSQL considerations, ORM security)

**Scene-by-scene outline:**

**S1 transition.** Tokyo to Austin. Texas heat haze.

**S2 cold_open dialogue.** Meridian Engineering. Open-plan office. Whiteboards everywhere. Engineers nervous. Tanaka: "The breach root cause traces back to code that ships from this room."

**S3 dialogue.** Lead engineer admits they ship without security review. "We have unit tests." Webb: "Unit tests don't catch SQL injection."

**S4 investigation.** Code review of the actual vulnerable function that allowed initial breach. Hotspots reveal: string concatenation in SQL query (classic SQLi), no input validation, missing authentication check on internal API, hardcoded admin credential in fallback path.
MEMORY HACK: "If user input touches a string concat that becomes a query, you have SQL injection. If it touches a string concat that becomes a path, you have path traversal. If it touches a string concat that becomes a command, you have command injection. The pattern is the same; the consequence varies."

**S5 visualization.** Code Review Simulator (Section 7.9 of main spec). Player reviews 5 code snippets, identifies vulnerabilities, picks remediations.

**S6 knowledge_check.** OWASP Top 10 identification. Question shows attack pattern, asks which OWASP category.
MEMORY HACK: "OWASP Top 10 (2021): Broken Access Control (#1), Cryptographic Failures (#2), Injection (#3), Insecure Design (#4), Security Misconfiguration (#5), Vulnerable Components (#6), Auth Failures (#7), Software/Data Integrity Failures (#8), Logging Failures (#9), SSRF (#10)."

**S7 dialogue.** Webb covers SDLC phases and where security integrates.
MEMORY HACK: "SDLC = Plan, Design, Build, Test, Deploy, Operate. Security at every phase = Secure SDLC. Skip any and you're paying down debt later."

**S8 visualization.** SDLC phase comparison: Waterfall vs Agile vs DevOps. Show where security gates live in each. Show how DevSecOps shifts security left.
VIZ component: SDLCPhaseExplorer
MEMORY HACK: "Shift left means catch bugs cheap. A bug in design costs $1. In code, $10. In test, $100. In production, $10,000. In a breach, your career."

**S9 knowledge_check.** Secure SDLC scenario. Where does threat modeling belong (design phase)? Where does SAST belong (code/build phase)? Where does DAST belong (test phase, against running app)?

**S10 investigation.** Examine Meridian's CI/CD pipeline. Hotspots: secrets in code repo, no SAST in pipeline, deploy keys with full access, branch protection disabled on main, no signed commits.
MEMORY HACK: "Secrets in code is the gateway sin. Once one is in the repo's history, you must rotate the secret AND rewrite history (or treat the repo as burned)."

**S11 visualization.** Software supply chain attack walkthrough. Show how a compromised npm package can flow into production. Reference SolarWinds, log4j patterns generically.
VIZ component: SupplyChainAttackTrace
MEMORY HACK: "Supply chain attacks weaponize trust. You vetted your code. You didn't vet the dependency of your dependency of your dependency."

**S12 dialogue.** Vasquez covers third-party software risk. SBOM (Software Bill of Materials). Vendor security assessments. Contract clauses for security.
MEMORY HACK: "SBOM is the ingredients list. Without it, you can't tell which products contain the recall."

**S13 knowledge_check.** Database security scenario. Parameterized queries vs ORM vs stored procedures. When does each prevent SQLi? Trap: stored procedures CAN have SQLi if they use dynamic SQL inside.

**S14 evidence_board.** Final connection. Trace the breach back from initial code vulnerability (Domain 8) through every domain that should have caught it: Domain 6 should have found it in pen test, Domain 4 should have segmented it, Domain 5 should have limited blast radius via least privilege, Domain 3 should have architected defense in depth, Domain 2 should have classified the data so encryption protected it at rest, Domain 1 should have governed all of the above. Single causal chain visualization.
MEMORY HACK: "Every breach is multi-domain. The exam tests this constantly: 'What is the BEST control?' rarely has a single right answer. The pattern is which control prevents this AND aligns with business AND is cost-effective AND fits the org's maturity."

**S15 decision.** Meridian wants Sentinel to certify their software as "secure" so they can return to market. {playerName} must explain why no software is "secure" in absolute terms, only "secure relative to threat model and acceptable risk."

**S16 visualization.** API security checklist interactive. Player audits a sample REST API against OWASP API Top 10.
VIZ component: APISecurityAuditor

**S17 tlatm_meter, S18 aha_moment, S19 debrief.** Standard pattern.

**Final Assessment.** 25 questions for Act 8. After passing, Epilogue triggers.

---

## 6.9 EPILOGUE — "The Debrief"

**Location:** Sentinel Dynamics Toronto, plus the exam testing center.
**Estimated playtime:** Variable (1 hour for narrative + up to 3 hours for the practice exam)

**Structure:**

**E1 dialogue.** Months have passed. Meridian remediation is complete. Tanaka pulls {playerName} aside in the war room. Reflects on the engagement. Reveals: she scheduled {playerName}'s actual CISSP exam for next week.

**E2 dialogue.** Each NPC delivers a brief send-off. Webb on technical mastery. Vasquez on ethics. Sharma (now reformed) on governance. Even Ghost (via a final letter) on the human element.

**E3 forensic_timeline_reveal.** The full Meridian breach timeline is now complete and visible. {playerName} can scroll through every event, every domain failure, every connection. This is the entire CISSP body of knowledge in one visualization.

**E4 transition.** "Six days later. The exam center."

**E5 the_exam.** CAT practice exam launches. 100-150 questions, 3-hour timer, IRT scoring, real ISC2 domain weights. Same engine as the dedicated practice exam route, but framed narratively.

**E6 results.** Pass or fail screen. If pass: ceremony scene with all NPCs. If fail: Tanaka gives constructive feedback, suggests Library topics for weak domains, offers to retake.

**E7 final_dialogue.** Tanaka's closing monologue. The whole story has been preparing {playerName} for this moment. Memory hooks from every Act referenced.

**E8 unlock.** All Acts replayable. All Library topics fully unlocked. All Toolkit interactives available. Practice exam can be retaken indefinitely.

---

## 17. Complete Memory Hack Registry

Consolidated from all 8 Acts. This is the player's reference card.

### Domain 1 (Security and Risk Management)

1. **CISO Mantra:** Independence above operations
2. **Policy hierarchy PSPG:** Policies → Standards → Procedures → Guidelines
3. **Risk math SLAR:** SLE = AV × EF, then ALE = SLE × ARO
4. **BIA quartet:** RTO (recovery TIME), RPO (recovery POINT), MTD (max tolerable downtime), WRT (work recovery time)
5. **ISC2 Ethics canons SHPP:** Society, Honorably, Principals, Profession (in priority order; Canon I always wins)
6. **STRIDE story:** A Spy Tampered with Records, Read Information, Denied Service, Elevated himself
7. **DREAD scoring:** Damage, Reproducibility, Exploitability, Affected users, Discoverability
8. **RMF order CSIAAM:** Categorize, Select, Implement, Assess, Authorize, Monitor
9. **Quantitative vs qualitative:** Quantitative needs numbers, Qualitative needs nerve
10. **Vendor risk:** Trust the contract, verify with the SOC2

### Domain 2 (Asset Security)

11. **Data ownership:** Owner OWNs the risk, Custodian CARES for the data, Steward STANDS for quality
12. **Data lifecycle CSUSAD:** Create, Store, Use, Share, Archive, Destroy
13. **Data destruction by media:** Three-pass for spinning disks, crypto-erase for SSDs, degaussing for tape, shred for paper
14. **Data states:** At rest (storage), in transit (network), in use (memory)
15. **Data protection trio:** Encryption (reversible with key), tokenization (replace with token), masking (display modification)

### Domain 3 (Security Architecture and Engineering)

16. **BLP vs Biba:** BLP protects SECRETS (no read up, no write down). Biba protects INTEGRITY (no read down, no write up). Mirror opposites.
17. **Crypto basics:** Symmetric is fast and secret. Asymmetric is slow and shared. Hash is one-way and tiny. Sign with private, verify with public.
18. **Key lifecycle GADUSARRD:** Generate, Distribute, Use, Store, Archive, Recover, Rotate, Destroy
19. **PKI roles:** CA is the king (issues), RA is the gatekeeper (verifies identity), CRL is the deadlist (revoked), OCSP is the live check
20. **Defense in depth:** Onion of OPSEC, each layer catches what the previous missed
21. **Security models lattice:** Bell-LaPadula (confidentiality), Biba (integrity), Clark-Wilson (well-formed transactions), Brewer-Nash (Chinese Wall, conflict of interest)

### Domain 4 (Communication and Network Security)

22. **OSI mnemonic:** Please Do Not Throw Sausage Pizza Away (Physical, Data Link, Network, Transport, Session, Presentation, Application)
23. **TCP handshake:** SYN, SYN-ACK, ACK
24. **TLS evolution:** TLS 1.3 dropped the bloat (no MD5, SHA-1, RC4, static RSA, compression; forward secrecy mandatory)
25. **Network segmentation:** Castle-and-moat dies inside; microsegmentation wraps every room
26. **Zero trust:** Never trust, always verify, per request, per app
27. **WiFi security:** WPA3 brings what TLS 1.3 brought; forward secrecy mandatory, dictionary attacks killed
28. **VPN types:** Site-to-site (gateway-to-gateway permanent), remote access (user-to-gateway temporary), ZTNA (per-app no tunnel)

### Domain 5 (Identity and Access Management)

29. **IAAA chain:** Identification (name tag), Authentication (bouncer), Authorization (which rooms), Accountability (camera)
30. **MFA factors:** Know, Have, Are, Do, Where (need two from different categories)
31. **Insider motivations MICE-X:** Money, Ideology, Coercion, Ego, Excitement
32. **Access control models OLRA:** DAC (Owner), MAC (Label), RBAC (Role), ABAC (Attribute) — order of evolution
33. **JML problem:** Joiners get permissions slowly, Movers accumulate forever, Leavers retain access
34. **PAM/PIM:** PAM is the keyring, PIM is the schedule of when keys can be borrowed
35. **Federation protocols:** SAML for enterprise SSO, OAuth for delegation, OIDC for OAuth + identity

### Domain 6 (Security Assessment and Testing)

36. **Assessment types:** Vuln scan finds doors, pen test opens doors, red team walks through and steals silverware
37. **PTES phases:** Please Inform Tanaka, Vulnerability Exists, Patch Promptly, Report (Pre-engagement, Intelligence, Threat Modeling, Vuln Analysis, Exploitation, Post-Exploitation, Reporting)
38. **CVSS context:** Score gives severity, context gives priority
39. **Control types PDC-CRD:** Preventive, Detective, Corrective, Compensating, Recovery, Deterrent, Directive
40. **Code testing:** SAST reads, DAST runs, IAST does both, SCA checks who you trust
41. **SIEM purpose:** Logs are evidence, normalization makes them comparable, correlation makes them story, alerting makes them action

### Domain 7 (Security Operations)

42. **NIST IR phases:** Preparation, Detection/Analysis, Containment/Eradication/Recovery, Post-Incident
43. **Order of volatility:** CPU registers, ARP cache, RAM, processes, network connections, disk, archives (capture in that order)
44. **Forensic integrity:** Hash before, hash after; if they match evidence is intact, if they don't case is dead
45. **Backup types:** Full (slow backup, fast restore), Incremental (fast backup, slow restore), Differential (medium both ways)
46. **DR site types:** Hot (hours), warm (days), cold (weeks), cloud (seconds), reciprocal (depends)
47. **DR test types:** Tabletop, walkthrough, simulation, parallel, full interruption (increasing realism)
48. **Change management:** Standard (pre-approved), normal (CAB review), emergency (post-hoc audit)

### Domain 8 (Software Development Security)

49. **Injection pattern:** User input + string concat = injection (SQL, command, path, all the same pattern)
50. **OWASP Top 10 (2021):** Broken Access Control, Crypto Failures, Injection, Insecure Design, Misconfiguration, Vulnerable Components, Auth Failures, Integrity Failures, Logging Failures, SSRF
51. **SDLC phases:** Plan, Design, Build, Test, Deploy, Operate
52. **Bug cost shift:** Design $1, Code $10, Test $100, Production $10,000, Breach $career
53. **Code testing differentiation:** SAST (read code), DAST (run app), IAST (instrumented), SCA (dependencies)
54. **CI/CD security:** Secrets in code is the gateway sin (rotate AND rewrite history if found)
55. **Supply chain principle:** Supply chain attacks weaponize trust, transitively
56. **SBOM:** Software Bill of Materials = ingredients list (without it, you can't trace recalls)

---

## 18. Exam Objective Coverage Matrix

This is the audit trail proving the app covers the full ISC2 CISSP exam outline. Every objective code maps to at least one Act scene + Library topic + 2 questions.

(Full matrix to be generated in Phase 4 once content is being seeded. Format below.)

| Objective Code | Title | Domain | Story Coverage | Library Topic | Question Count |
|----------------|-------|--------|----------------|---------------|----------------|
| 1.1 | Confidentiality, Integrity, Availability | 1 | Act 1 S2, S8 | /library/cia-triad | 12 |
| 1.2 | Security Governance Principles | 1 | Act 1 S3, S5, S7 | /library/security-governance | 18 |
| 1.3 | Compliance and Legal/Regulatory | 1 | Act 1 S12, Act 2 S7 | /library/compliance-frameworks | 14 |
| ... | ... | ... | ... | ... | ... |

(150+ rows in final version, one per ISC2 sub-objective. Generated automatically by a script that reads the ISC2 outline and cross-references story_scenes.exam_objectives, library_topics.exam_objectives, and questions.exam_objective.)

---

## 19. Content Authoring Templates

For consistency across Acts when drafting content. Used by Claude (this chat) when generating per-Act content for seeding.

### 19.1 Dialogue scene template

```json
{
  "act_number": X,
  "scene_number": Y,
  "scene_type": "dialogue",
  "title": "Brief scene title",
  "location_description": "Where this happens",
  "background_image_key": "actX_locationY_bg",
  "ambient_audio_key": "actX_ambient",
  "exam_objectives": ["X.Y.Z"],
  "estimated_seconds": 90,
  "content": {
    "lines": [
      {"speaker": "tanaka", "expression": "neutral", "text": "Dialogue line one. Use {playerName} for the player and tokens for pronouns."},
      {"speaker": "narrator", "text": "{Pronoun} considers the question."}
    ],
    "characters_on_screen": [
      {"key": "tanaka", "position": "left", "expression": "neutral"}
    ]
  }
}
```

Voice rules:
- Tanaka: measured, paternal/maternal, never raises voice, asks Socratic questions
- Webb: blunt, technical, uses metaphors from sports or war
- Vasquez: precise, lawyer-like, cites canons and frameworks
- Sharma: anxious, guarded, opens up across the arc
- Ghost: present in evidence and dialogue from S2 onward of Act 5; never seen until Act 5

### 19.2 Knowledge check template

```json
{
  "scene_type": "knowledge_check",
  "content": {
    "knowledge_check_id": "kc_actX_NNN",
    "stem": "Scenario-based question stem. {Pronoun} encounters X. What is the BEST action?",
    "options": [
      "Option A (technical-only, distractor)",
      "Option B (governance-correct answer)",
      "Option C (close distractor with one wrong word)",
      "Option D (red herring)"
    ],
    "correct_index": 1,
    "explanation": "Why B is correct. Why others are wrong, specifically.",
    "memory_hack": "The mnemonic or analogy that locks this in.",
    "exam_objective": "X.Y.Z",
    "library_topic_slug": "topic-slug",
    "trap_type": "tlatm_violation",
    "difficulty": 2
  }
}
```

Quality checklist for every knowledge check:
- Scenario-based, not definition-based
- Uses BEST/MOST/FIRST/LEAST/NEXT framing
- 4 plausible options (no obvious throwaways)
- Correct option is governance-aware unless the question is explicitly technical
- Explanation tells WHY each wrong answer is wrong
- Memory hack is concrete, not abstract
- Routes to Library topic for further reading

### 19.3 Decision scene template

```json
{
  "scene_type": "decision",
  "content": {
    "context_text": "Situational setup. NPCs reacting. Stakes clear.",
    "decision_id": "actX_decision_N",
    "options": [
      {"text": "Option A", "tlatm_score": -10, "consequence": "Tanaka's reaction"},
      {"text": "Option B", "tlatm_score": +15, "consequence": "Tanaka's approval"},
      {"text": "Option C", "tlatm_score": -5, "consequence": "Mixed reaction"},
      {"text": "Option D", "tlatm_score": -15, "consequence": "Strong negative"}
    ]
  }
}
```

TLATM scoring guideline: Total score across all decisions in an Act should average 0 if player picks randomly. Manager-thinking should net positive. Technical-only thinking should net negative. Pure technical wrong answers (e.g., illegal action) should be -15. Best governance answers should be +15.

### 19.4 Investigation scene template

```json
{
  "scene_type": "investigation",
  "content": {
    "scene_image_key": "actX_evidence_image",
    "intro_text": "Tanaka sets up: 'Find the problems on this org chart, {playerName}.'",
    "hotspots": [
      {
        "id": "spot_1",
        "coords": [x1, y1, x2, y2],
        "reveal_text": "Teaching content for this finding.",
        "exam_objective": "X.Y.Z"
      }
    ],
    "completion_required": "all_hotspots",
    "completion_text": "Tanaka summarizes the findings and connects them to the domain."
  }
}
```

Investigation scenes are the highest-engagement scene type. Each one should have 4 to 8 hotspots. Each hotspot should teach one discrete concept. After completion, Tanaka or Webb should weave them together.

---

## 20. Build Verification Checklist (per Act)

Before declaring an Act "shipped":

Content:
- [ ] All 14-20 scenes seeded into Supabase
- [ ] Scene exam_objectives arrays populated
- [ ] All knowledge checks have explanations and memory hacks
- [ ] All decisions have tlatm_score and consequences
- [ ] All investigation hotspots have reveal_text and exam_objectives
- [ ] Debrief scene includes complete memory hack list for the Act
- [ ] Assessment has 25 questions covering all themes
- [ ] Library topics for the Act's themes written and seeded
- [ ] Cross-links from knowledge check explanations to Library topics work

Visual:
- [ ] All background images generated and stored
- [ ] All NPC expressions for the Act generated
- [ ] Evidence artifact images generated
- [ ] Image keys in scenes reference actual generated images

Mechanical:
- [ ] All scene types render correctly
- [ ] Template substitution works for all pronoun/name tokens
- [ ] TLATM meter updates correctly on decisions
- [ ] Knowledge checks log to player_question_history
- [ ] Failed concepts log to failed_concepts
- [ ] Resurfaced concepts from prior Acts trigger correctly
- [ ] Achievement unlocks fire correctly
- [ ] XP awards correct
- [ ] Save/resume works mid-Act
- [ ] Mobile responsive at 375px
- [ ] Keyboard navigation works
- [ ] Audio plays (ambient + UI sounds)

Quality:
- [ ] End-to-end playthrough by Seymour
- [ ] End-to-end playthrough by spouse
- [ ] No "Alex" references anywhere
- [ ] All pronouns render correctly for both gender selections tested
- [ ] All hotspots discoverable (no impossibly small click targets)
- [ ] Reading flow feels natural (no awkward NPC voice breaks)
- [ ] Memory hacks feel sticky (test by recall after 24 hours)

---

*End of CISSP_QUEST_PERSONAL_BUILD_SPEC_PART2.md*
*Author: Claude Opus 4.7. Generated 2026-04-20. Companion to main spec.*
