# CISSP Quest — Master Rebuild Plan
> The most thorough, most interactive, most mind-blowing CISSP study experience ever built.
> Generated: 2026-04-16 | Effort: Max | Scope: Boil the ocean

---

## PART 0: CURRENT STATE & GAP ANALYSIS

### What's Already Built (Keep)
- ✅ Visual Novel Engine (8 node types: Dialogue, Evidence, KnowledgeCheck, TimedDecision, ThinkLikeManager, VisualAid, Transition, InteractiveImage)
- ✅ IRT 3PL CAT Quiz Engine (Fisher Information, MLE theta estimation, convergence detection)
- ✅ 3 domains of story content (Domains 1–3, Acts 1/2/4)
- ✅ Supabase schema (20+ tables, RLS, UUID keys)
- ✅ Auth flow (Supabase email/password)
- ✅ Zustand stores (user, story, quiz)
- ✅ SVG character system (6 skin tones, 8 hair styles, 5 outfits)

### What Must Be Replaced
- ❌ Narrative arc: "Operation Shadow Protocol" → "Alex Mercer / Meridian Global Breach"
- ❌ NPC cast: Reeves/Janet/Kai/Morales → Dr. Tanaka/Webb/Sharma/Ghost/Vasquez
- ❌ All story scene content (3 domains need full replacement, 5 need creation)
- ❌ Story locations: New York/NJ/Zurich/Singapore/London/Tel Aviv/SOC/Austin → Toronto/London/Munich/Singapore/New York/Remote-Lab/Tokyo/San Francisco

### What's Missing (Build)
- ❌ Framer Motion animations (package installed, not used)
- ❌ Image assets (all SVG — needs Replicate API pipeline)
- ❌ Landing page (conversion-optimized)
- ❌ Practice exam simulator (CAT, 250Q, 6hr)
- ❌ shadcn/ui components (not installed — critical gap)
- ❌ All 8 acts of content (only 3 partial)
- ❌ Library content (mostly empty)
- ❌ Gamification completion (XP/levels work, achievements/streaks incomplete)
- ❌ New interactive features (Risk Matrix, Network Tracer, Access Control Lab, etc.)

---

## PART 1: NARRATIVE ENHANCEMENTS BEYOND THE SPEC

These go beyond the CISSP-Quest-Full-Rebuild-Spec.md and represent the "mindblowing" layer.

### 1.1 The Forensic Timeline (New Feature)
An interactive visualization living in the dashboard. A horizontal timeline showing the Meridian breach from Day 0 to discovery. Each domain's failures are pinned as events. As players complete Acts, new events reveal themselves with "how this happened" callouts. By Act 8, players can see the full causal chain: governance failure → asset misclassification → architecture flaw → network weakness → credential compromise → assessment gap → ops failure → vulnerable code. This IS the CISSP in a single diagram.

**Implementation**: React component using CSS/SVG timeline, Framer Motion for reveals, data-driven from Supabase. Pinned events styled as case file stamps.

### 1.2 Ghost's POV — "The Adversary Perspective" (Premium Feature)
After completing Act 5 (IAM), unlock 3 short "classified" bonus scenes where you play as James "Ghost" Holloway. You see the breach from the inside — how he exploited each gap. NOT a "hacking simulator" — more like a legal thriller where you understand his motivations, methods, and the system failures that made it possible. This teaches offensive thinking without glorifying it.

Scenes:
- Ghost Scene A: "The Day I Found the Staging Server" (exploiting the access control failure from Act 5)
- Ghost Scene B: "The Report Nobody Read" (the vulnerability assessment that was filed and forgotten)
- Ghost Scene C: "The Decision" (Ghost's final choice — morally ambiguous, teaches ethics)

**CISSP connection**: Teaches insider threat psychology, the human element of social engineering, and why CISSP cares about personnel security, code of ethics, and investigative procedures.

### 1.3 The Sentinel Files (Dr. Tanaka's Encrypted Notebook)
After each Act, Dr. Tanaka's notebook entry unlocks. These are beautifully formatted "handwritten digital notes" that function as the study guide companion. Each entry:
- Summarizes the Act's domain in Dr. Tanaka's voice
- Contains her personally annotated memory hacks
- Includes diagrams with her handwritten labels
- References specific exam objectives with her commentary: "ISC² loves testing this in scenario form. Here's the trap they set."

**Design**: Sepia-tinted notebook aesthetic, Framer Motion page-turn animations, handwriting-style font for annotations, regular font for typed content.

### 1.4 The Daily Intelligence Brief (Engagement Loop)
Each morning, a 2-minute "briefing" from Tanaka or Webb: 5 targeted questions based on the player's weak spots + one "case file" update from the Meridian investigation. Sets the context for the day's study session. Appears on dashboard as a glowing dossier card that pulses until opened.

### 1.5 The Evidence Constellation (Knowledge Graph)
A force-directed graph showing how all CISSP concepts connect to each other. Nodes = concepts. Edges = relationships. Players unlock nodes as they learn them — greyed-out until encountered in story. Clicking any node → Library topic. This becomes a visual map of the entire CISSP body of knowledge.

**Implementation**: D3.js force simulation OR React Flow (simpler). Color-coded by domain. Node size = concept weight in exam (more frequently tested = larger node). This is a study tool that rewards exploration.

### 1.6 The Crisis Wire (Simulated News Feed)
A simulated "cybersecurity news feed" in the corner of the story player. Fake industry headlines about the Meridian breach, written as if real journalists are covering it. References actual real-world breach patterns without naming real companies. Updates as acts progress.

Example headlines:
- "Meridian Global Confirms Breach, Stock Down 14%" (Act 1)
- "Regulators Open Investigation Into Data Classification Practices" (Act 2)
- "Sources: Meridian Had No Incident Response Plan" (Act 3)
- "Insider Threat Suspected in Meridian Breach, Official Statement Pending" (Act 5)

**Purpose**: Creates urgency, makes learning feel real, reinforces that these domain failures have real-world consequences.

### 1.7 The "Think Like a Manager" Meter
A persistent UI element during story play. Every decision Alex makes is tracked against the "TLATM" principle. A small gauge fills toward "Manager" or tilts toward "Technician" based on choices. Governance-first answers move the meter right. Technical-only answers move it left. At the end of each Act, Tanaka comments on Alex's meter position. This teaches the critical CISSP philosophy: you're a manager who understands technology, not a technician.

### 1.8 Adaptive NPC Dialogue (Memory-Aware Characters)
NPCs remember your mistakes. If a player repeatedly fails cryptography questions, Marcus will say: *"You're still mixing up asymmetric and symmetric. Let me give you an analogy that sticks."* This is powered by querying `failed_concepts` table and injecting dynamic dialogue nodes.

### 1.9 The Exam Countdown Integration
Users input their actual CISSP exam date during onboarding. The dashboard shows a prominent countdown clock. As the date approaches, content prioritization shifts:
- 60+ days out: Balanced pace across all domains
- 30-60 days: Focus on weakest 3 domains
- 14-30 days: Heavy practice exam mode
- 7-14 days: Daily targeted quizzes on known gaps
- Last 7 days: Review mode only — reinforcement not new content

### 1.10 The "I Passed" Ceremony
When a player passes the final practice exam (≥75% threshold):
1. Full-screen celebration with Framer Motion confetti
2. All NPCs congratulate Alex with unique dialogue (Tanaka proud, Marcus impressed, Vasquez professional, Sharma grateful)
3. Animated "CISSP Certified" stamp appears
4. Shareable card generates with: Level reached, domains mastered, study streaks, total hours
5. One-click share to LinkedIn with pre-written post copy
6. Referral link embedded for organic growth

---

## PART 2: PER-ACT CONTENT ARCHITECTURE (ALL 8 ACTS)

### Formatting key
Each act entry contains:
- Narrative overview
- NPCs active
- Location + visual mood
- 15 scene breakdown (type + concept covered)
- Knowledge checks (10 per act minimum)
- Memory hacks (3-5 per act, specific mnemonics)
- Analogies (2-3 per act, grounded in everyday experience)
- Exam traps specific to this domain
- Dr. Tanaka's Debrief outline

---

### ACT 1 — "THE CALL"
**Domain**: Security & Risk Management (15% of exam)
**Location**: Toronto — Sentinel Dynamics HQ
**Mood**: Professional urgency. Glass walls, open floor plan, whiteboard walls covered in incident timelines. First week of a new job, except the biggest breach of the decade just landed.
**Primary NPC**: Dr. Keiko Tanaka (mentor, governance champion)
**Secondary NPC**: Marcus Webb (grounding technical perspective)
**Introduced but not prominent**: Elena Vasquez (brief appearance)

**The Core Story Problem**: Meridian had NO incident response plan, NO risk register, NO governance structure. The team can't even begin to scope the breach because the organization never documented what it had or why it mattered.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | First Morning | Introduction: what CISSP is, "Think Like a Manager" framing |
| 2 | Dialogue + Evidence | The Emergency Call | Incident response trigger, escalation procedures |
| 3 | Evidence | The Blank IR Plan | IR plan components: Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned |
| 4 | Knowledge Check | "What's Missing?" | IR plan mandatory elements quiz |
| 5 | Dialogue | Risk Register Hunt | Risk identification: threats, vulnerabilities, assets, likelihood, impact |
| 6 | InteractiveImage | The Risk Matrix | ALE = SLE × ARO, risk prioritization, quantitative vs qualitative |
| 7 | ThinkLikeManager | Governance Decision | Due care vs due diligence; organizational risk appetite |
| 8 | Evidence | The Compliance Audit Trail | PCI-DSS, SOX, HIPAA — compliance as a floor, not a ceiling |
| 9 | KnowledgeCheck | Policy Hierarchy | Policy → Standard → Procedure → Guideline (which overrides which) |
| 10 | Dialogue | CIA Triad Lecture | Confidentiality, Integrity, Availability — applied to Meridian |
| 11 | TimedDecision | First Prioritization | Given 5 critical gaps, prioritize based on business impact |
| 12 | VisualAid | Risk Framework Comparison | NIST CSF, ISO 27001, COBIT, COSO — when to use which |
| 13 | Evidence | The BIA Problem | BIA: RTO, RPO, MTD, WRT — Meridian doesn't know any of these |
| 14 | InteractiveImage | BIA Calculator | Interactive tool: set RTO/RPO/MTD and see recovery strategy implications |
| 15 | Dialogue | Tanaka's Debrief | Domain 1 summary + exam objective mapping |

#### 10 Core Knowledge Checks (Act 1)
1. What is the PRIMARY purpose of a risk register? (Document and track risks, NOT prevent them)
2. In the policy hierarchy, which document defines HOW to implement a standard? (Procedure)
3. ALE calculation: SLE=$100K, ARO=0.5. What is ALE? ($50K — correct for why)
4. What is the FIRST step in the NIST incident response lifecycle? (Preparation)
5. Due care vs due diligence: Meridian had a policy but never reviewed it. Which principle did they violate? (Due care)
6. An employee reads the code of ethics but doesn't understand it. Is this compliance? (No — understanding is required)
7. What distinguishes a threat from a vulnerability? (Threat exploits a vulnerability)
8. The ISC² Code of Ethics: If organizational policy conflicts with the Canon, which takes precedence? (Canon I — protect society first)
9. RTO = 4 hours. MTD = 6 hours. The system has been down 5 hours. What do you do? (Restore immediately — within MTD but approaching limit)
10. A risk assessment shows HIGH likelihood, LOW impact. What response makes sense? (Mitigate or Accept, depending on cost)

#### Memory Hacks (Act 1)
1. **IR Phases**: "Please Identify Cute Elephants Running Laughing" = Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned
2. **Policy Hierarchy**: "Please Sit, Properly Guided" = Policy, Standard, Procedure, Guideline
3. **ISC² Ethics Canons**: "People Clients Employers Profession" = Canon I (Protect Society), Canon II (Act Honorably), Canon III (Provide Service), Canon IV (Advance Profession) — and ALWAYS in this order
4. **Risk response options**: "TAME a risk" = Transfer, Accept, Mitigate, Eliminate (avoid)
5. **BIA timing terms**: "RTO races RPO to the MTD finish line with WRT to spare" — RTO must be less than MTD, RPO tells you max data loss, WRT is what's left after recovery

#### Analogies (Act 1)
1. **Risk Register → Insurance Policy Inventory**: You wouldn't file an insurance claim without knowing what you insured. A risk register is the inventory of everything you need to protect and why.
2. **Policy Hierarchy → Government Law System**: Federal law (Policy) → State regulations (Standards) → Local ordinances (Procedures) → Community guidelines (Guidelines). Federal always wins.
3. **Due Care → Car Maintenance**: Due diligence = choosing a reputable mechanic. Due care = actually taking your car in for service, not just knowing you should.

#### Exam Traps (Act 1)
- **Trap 1**: "Which is MOST important in a BCP?" — ISC² answer is ALWAYS scope and planning, not technology. They want governance first.
- **Trap 2**: "Who owns the risk?" — The Business Owner, NOT the security team. Security advises; business decides.
- **Trap 3**: "What's the FIRST step?" — On process questions, CISSP almost always wants the PREPARATION or PLANNING step, not the technical action.
- **Trap 4**: Qualitative vs. Quantitative risk — CISSP tests that quantitative uses numbers (ALE/SLE/ARO), qualitative uses High/Medium/Low. Know which is MORE useful (qualitative for initial prioritization, quantitative for justifying spend).

---

### ACT 2 — "THE INVENTORY"
**Domain**: Asset Security (10% of exam)
**Location**: London — Meridian Global HQ (financial district office)
**Mood**: Corporate labyrinth. A company that THINKS it's organized but has never actually audited itself. 47,000 data records with no labels.
**Primary NPCs**: Dr. Tanaka, Marcus Webb, Priya Sharma (CISO, first major appearance)
**Introduced**: Elena Vasquez (remote call, GDPR angle)

**The Core Story Problem**: The team flies to London to assess what was compromised. Meridian can't tell them. Nobody knows what data they have, who owns it, how it's classified, or how long it should be kept. The breach scope is literally unmeasurable.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | Flight to London | Bridge from Act 1; introduce Priya Sharma's role and failures |
| 2 | Dialogue | Meeting Priya | Data ownership: who is responsible? Owner vs. Custodian vs. Processor |
| 3 | Evidence | The "Classification Policy" | Classification levels (Top Secret/Secret/Confidential/Public vs. Restricted/Private/Public/Unclassified) |
| 4 | KnowledgeCheck | Classify These Records | Apply classification: 10 sample data types |
| 5 | InteractiveImage | Data Role Assignment | Assign Owner/Custodian/Processor/User to 8 data scenarios |
| 6 | Dialogue | The GDPR Call | Elena Vasquez: EU data subjects, right to erasure, lawful basis |
| 7 | Evidence | The Retention Schedule | Data retention: legal requirements vs. operational needs vs. privacy |
| 8 | ThinkLikeManager | The Retention Dilemma | Meridian kept logs too long (GDPR risk) but also deleted audit logs too early (IR failure) |
| 9 | KnowledgeCheck | Data States | In use / in transit / at rest — what controls apply to each |
| 10 | VisualAid | DLP Technology Map | DLP, CASB, DRM — what problem each solves |
| 11 | Dialogue | The Remanence Problem | Data remanence: why deleting files isn't enough |
| 12 | InteractiveImage | Sanitization Methods | Clearing vs. Purging vs. Destroying — when to use which |
| 13 | TimedDecision | Crisis Classification | Classify 20 files in 5 minutes to scope the breach |
| 14 | Evidence | The Asset Inventory Gap | No CMDB, no data map, no lineage — how to build one under fire |
| 15 | Dialogue | Tanaka's Debrief | Domain 2 summary; first "Aha Moment" (you just did Domain 2) |

#### 10 Core Knowledge Checks (Act 2)
1. Who is responsible for CLASSIFYING data? (Data Owner, not Custodian)
2. Who is responsible for PROTECTING data? (Data Custodian — they implement controls)
3. Data in transit, at rest, in use — which is MOST vulnerable to interception? (In transit)
4. A government contractor has data labeled SECRET. What is the MINIMUM baseline for handling? (Need-to-know + clearance at that level)
5. GDPR requires data erasure upon request. What must you verify first? (Lawful basis for original collection no longer exists; no overriding legitimate interest)
6. Which sanitization method is appropriate for a disk leaving the organization permanently? (Destroying — incineration, shredding, or degaussing)
7. Data remanence on SSDs: why is wiping less effective? (Flash cells retain charge patterns; must use ATA Secure Erase or physical destruction)
8. DRM vs. DLP: which controls data AFTER it leaves your systems? (DRM)
9. A CASB sits between users and cloud services. What is its primary function? (Visibility and control of cloud usage — shadow IT detection)
10. The data owner for payroll data is most likely... (CFO/Finance Director — the business function responsible for the data's purpose)

#### Memory Hacks (Act 2)
1. **Data Roles**: "OCPU" = Owner Classifies, Controls; Processor Processes under contract; User Uses — the Owner is always the boss, the Custodian does the work
2. **Sanitization levels**: "Clear, Pure, Destroy" = Clearing (overwrite, still usable media), Purging (degauss, renders unreadable), Destroying (physical destruction) — escalating permanence
3. **Data states**: "RAT at risk" = Rest / At rest, Active / in use, Transit / in motion — each state needs different controls

#### Analogies (Act 2)
1. **Data Classification → Hotel Room Categories**: Standard, Deluxe, Suite, Presidential. Not everyone gets the Presidential suite key. Classification determines WHO gets access based on NEED plus CLEARANCE.
2. **Data Owner vs. Custodian → Property Owner vs. Property Manager**: The owner (CFO) decides what to do with payroll data. The property manager (IT) maintains the systems that store it. The tenant (employees) uses the data but doesn't own it.
3. **Data Remanence → Writing on a Whiteboard**: Deleting a file is like erasing a whiteboard marker with your sleeve — you can still see the ghost of what was there. You need to paint over it (overwrite) to truly erase it.

---

### ACT 3 — "THE BLUEPRINT"
**Domain**: Security Architecture & Engineering (13% of exam)
**Location**: Munich — Meridian R&D Lab (cutting-edge facility inside a converted Baroque building)
**Mood**: Contrast of old and new. Historic architecture housing bleeding-edge research. The breach exploited gaps between legacy systems and modern cloud environments.
**Primary NPCs**: Dr. Tanaka, Marcus Webb
**New NPC**: Dr. Franz Müller (Meridian's Munich CISO — represents "security through obscurity" thinking)

**The Core Story Problem**: The attacker exploited architectural weaknesses in Meridian's R&D environment. The design violated fundamental security models, used expired certificates, had no defense-in-depth, and trusted perimeter security alone.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | Arrival in Munich | Architectural security overview: buildings as metaphors for layered security |
| 2 | InteractiveImage | The Physical Audit | Physical security walk-through: piggybacking, tailgating, mantrap, prop detection |
| 3 | Evidence | The Architecture Diagram | Defense in depth: perimeter-only vs. layered security |
| 4 | KnowledgeCheck | Security Model Identification | Bell-LaPadula vs. Biba vs. Clark-Wilson — which applies when |
| 5 | VisualAid | Security Models Deep Dive | Animated comparison: B-LP (confidentiality), Biba (integrity), Clark-Wilson (commercial integrity) |
| 6 | Evidence | The PKI Failure | Expired self-signed certificate that created a pivot point |
| 7 | InteractiveImage | The Cryptography Workbench | Symmetric vs. asymmetric key exchange simulation |
| 8 | KnowledgeCheck | Crypto Algorithm Selection | AES-256, RSA-2048, SHA-256, ECC — when to use which and WHY |
| 9 | Dialogue | Zero Trust Proposal | Zero trust principles: never trust, always verify |
| 10 | TimedDecision | Architecture Triage | 4 design choices, choose the most secure — 90 seconds |
| 11 | Evidence | The Cryptanalysis Trail | How attackers identified the weak key — side-channel attack |
| 12 | VisualAid | Attack Categories | Passive vs. active attacks; cryptanalytic attack types |
| 13 | ThinkLikeManager | The Vendor Lock-in Debate | Proprietary vs. open standards in security architecture |
| 14 | Evidence | The IoT Blind Spot | Embedded devices in the R&D lab with no patch management |
| 15 | Dialogue | Tanaka's Debrief | Domain 3 summary; "You just lived the architecture exam" |

#### 10 Core Knowledge Checks (Act 3)
1. Bell-LaPadula: An analyst at SECRET clearance tries to write to a PUBLIC file. Is this allowed? (NO — No Write Down; this could leak classified info)
2. Biba: A user at LOW integrity tries to read HIGH integrity data. Is this allowed? (NO — No Read Up in Biba; corrupted data could contaminate the high integrity source)
3. Clark-Wilson focuses on: (Commercial data integrity — separation of duties, constrained data items, transformation procedures)
4. What is the difference between symmetric and asymmetric encryption? (Symmetric: same key encrypt/decrypt; Asymmetric: public/private key pair — faster vs. more secure key exchange)
5. A certificate chain shows: Root CA → Intermediate CA → End Entity. The intermediate CA cert expired. What happens? (Chain of trust broken — connection fails/untrusted)
6. Zero Trust assumes: (No implicit trust based on network location — even internal traffic must authenticate)
7. Side-channel attacks target: (Physical implementation, not the algorithm itself — timing, power consumption, electromagnetic emissions)
8. TPM (Trusted Platform Module) primarily provides: (Hardware-based cryptographic key storage and platform integrity measurement)
9. "Fail secure" means: (On failure, the system defaults to DENYING access — the opposite of fail open/safe)
10. Kerckhoffs's principle states: (Security must rely on key secrecy, not algorithm secrecy — security through obscurity is NOT security)

#### Memory Hacks (Act 3)
1. **Bell-LaPadula**: "No Read Up, No Write Down" = "NRU, NWD" or remember "Bell-LaPadula reads DOWN, writes UP" — classified info goes UP the ladder, never DOWN
2. **Biba (opposite of B-LP)**: "Biba's No Read Up = Biba won't touch dirty data from below" — integrity model is OPPOSITE of confidentiality. Clean (high) won't touch dirty (low).
3. **Crypto types**: "Asymmetric gives out business cards (public key), Symmetric shares a house key (one key, everyone who needs it has a copy)"
4. **Security models mnemonic**: "Bell = Classified (Confidentiality), Biba = Business (Integrity), Clark-Wilson = Commercial (also Integrity, with audit trails)"

#### Analogies (Act 3)
1. **Defense in Depth → Onion / Castle**: A moat doesn't stop someone who breaches the walls. Layer after layer: perimeter → network → host → application → data. Each layer assumes the others will fail.
2. **Public Key Cryptography → Mailbox**: Everyone knows your mailbox address (public key) and can drop messages in. Only you have the key to open it (private key). RSA is a one-way mailbox.
3. **Zero Trust → Secure Office Building**: Even employees badge-in at every door. Your badge says you work here, but the server room needs a separate credential. Trust is per-action, not per-person.

---

### ACT 4 — "THE WIRE"
**Domain**: Communication & Network Security (13% of exam)
**Location**: Singapore — Meridian Data Center (undersea cable station context, neon-drenched tech hub)
**Mood**: Cyber-noir. Server rooms with blinking LEDs, packet traces scrolling across screens, the digital heartbeat of a compromised global network.
**Primary NPCs**: Dr. Tanaka, Marcus Webb (most prominent here — this is his domain)
**New NPC**: Lena Kim (Meridian network engineer — she built the network and is now watching it be autopsied)

**The Core Story Problem**: The attackers maintained persistent network-level access through backdoors, lateral movement, and a covert exfiltration channel hidden in DNS traffic. Meridian's network was flat, overly permissive, and monitored only at the perimeter.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | The Data Center Tour | OSI model as the "anatomy" of network communication |
| 2 | InteractiveImage | OSI Layer Explorer | Click each layer to see protocols, devices, attacks at that layer |
| 3 | Evidence | The Packet Capture | TCP/IP 3-way handshake; how Marcus reads network evidence |
| 4 | KnowledgeCheck | OSI Attack Mapping | Which attack lives at which OSI layer |
| 5 | Evidence | The FTP Disaster | Unencrypted file transfers; replace-with-SFTP reasoning |
| 6 | Dialogue | Lena's Confession | The flat network: no VLANs, no segmentation, everything trusted everything |
| 7 | InteractiveImage | Network Topology Tracer | Interactive: trace the attacker's path through the network layer by layer |
| 8 | Evidence | The Rogue AP | Wireless security: WEP (broken), WPA2 (enterprise vs. personal), rogue AP detection |
| 9 | KnowledgeCheck | Firewall Types | Packet filtering vs. stateful vs. application-layer vs. NGFW |
| 10 | TimedDecision | Segmentation Emergency | Isolate compromised segments without killing critical operations — 60 seconds |
| 11 | Evidence | The DNS Exfiltration | How the attacker tunneled data through DNS queries |
| 12 | VisualAid | VPN Technologies | IPSec (tunnel vs. transport), SSL/TLS VPN, SSTP — comparison table |
| 13 | ThinkLikeManager | The NAC Debate | Network Access Control: investment vs. operational friction |
| 14 | Evidence | The IDS Alerts Nobody Acted On | IDS vs. IPS: detection vs. prevention, false positive management |
| 15 | Dialogue | Marcus's Debrief | "The network is the battlefield" + Domain 4 exam objectives |

#### 10 Core Knowledge Checks (Act 4)
1. At which OSI layer does a router operate? (Layer 3 — Network)
2. ARP spoofing occurs at which layer? (Layer 2 — Data Link)
3. A firewall that examines packet headers only (no connection state) is: (Packet filtering — stateless)
4. WPA2-Enterprise vs. WPA2-Personal: what's the key difference? (Enterprise uses 802.1X/RADIUS for per-user authentication; Personal uses a shared pre-shared key)
5. IPSec in TUNNEL mode vs. TRANSPORT mode: what's the difference? (Tunnel: encrypts the entire original packet including header — used for VPNs. Transport: encrypts only the payload — used for end-to-end)
6. DNS exfiltration works because: (DNS queries are usually allowed through firewalls and rarely monitored; data is encoded in subdomain names)
7. A NIDS (Network IDS) vs. HIDS (Host IDS): which one sees encrypted traffic better? (HIDS — it can see traffic before it's encrypted at the source)
8. A false positive in IDS means: (An alert triggered for legitimate traffic — increases noise, causes alert fatigue)
9. The PRIMARY purpose of network segmentation: (Limit lateral movement — breach one segment, can't automatically reach others)
10. VLAN hopping attack: what does it exploit? (Misconfigured trunk ports or double-tagging — allows attacker to jump between VLANs)

#### Memory Hacks (Act 4)
1. **OSI Layers (top to bottom)**: "All People Seem To Need Data Processing" = Application, Presentation, Session, Transport, Network, Data Link, Physical
2. **OSI Layer Devices**: "Physical = Hub (dumb), Data = Switch (smart), Network = Router (wise), Application = Firewall/Proxy (judgmental)"
3. **Firewall evolution**: "Packet → State → Application → Next-Gen" — like going from a bouncer who checks ID → one who remembers you → one who reads your texts → one who profiles you

#### Analogies (Act 4)
1. **OSI Model → Postal System**: Physical = the roads. Data Link = the local post office sorting. Network = the routing of packages between cities. Transport = delivery confirmation. Application = the actual letter content.
2. **Firewall Types → Security Guards**: Packet filter = guard who checks your badge but not why you're there. Stateful = guard who tracks you entered in, so you must exit too. Application-layer = guard who reads your briefcase. NGFW = guard + profiler + threat intelligence.
3. **Network Segmentation → Hospital Wards**: You can't walk from the ER to the surgical suite without authorization. Each ward is isolated by purpose and clearance. If someone brings in an infection, it doesn't spread to every floor.

---

### ACT 5 — "THE INSIDER"
**Domain**: Identity & Access Management (13% of exam)
**Location**: New York — Meridian Financial Division
**Mood**: Noir financial thriller. Late nights, suspicion, suits, and spreadsheets hiding corruption. The most human act of the story.
**Primary NPCs**: Elena Vasquez (most prominent here — legal/evidence), Dr. Tanaka, Ghost Holloway (first direct appearance)
**Dramatic reveal**: Ghost is interviewed — the moral ambiguity is introduced

**The Core Story Problem**: Compromised credentials + excessive access + no review process + disabled MFA = an insider threat (or compromised insider) that had the keys to everything. The investigation now focuses on WHO had access and whether they used it.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | New York Arrival | Access control philosophy: least privilege and need-to-know as the foundation |
| 2 | Evidence | The Impossible Logins | Credential compromise: same account logged in from London and Singapore simultaneously |
| 3 | InteractiveImage | Access Control Lab | Simulate granting/revoking rights using RBAC, MAC, DAC, ABAC — see consequences |
| 4 | KnowledgeCheck | Access Control Models | RBAC, MAC, DAC, ABAC, Rule-based — when to use which |
| 5 | Evidence | Ghost's Access Profile | Excessive privilege: 847 systems, 23 departments, never reviewed in 3 years |
| 6 | Dialogue | The MFA Bypass | MFA types (something you know/have/are), and the danger of exemptions |
| 7 | Evidence | The Federated Identity Failure | SSO + SAML: one compromised IdP credential = access to everything federated |
| 8 | KnowledgeCheck | Authentication Protocols | Kerberos, RADIUS, TACACS+, SAML, OAuth, OIDC — function and difference |
| 9 | ThinkLikeManager | The Access Review Policy | Periodic access reviews: quarterly minimum, certification campaigns |
| 10 | TimedDecision | The Ghost Interview | 5 questions for Ghost — your answers shape his guilt vs. innocence narrative |
| 11 | Evidence | The Privilege Escalation Trail | How Ghost (or his compromised account) escalated from standard to admin |
| 12 | Dialogue | Elena's Evidence Rules | Chain of custody for digital evidence: how to handle to preserve admissibility |
| 13 | VisualAid | Identity Lifecycle | Provisioning → Review → Deprovisioning: the full IAM lifecycle with failure points |
| 14 | KnowledgeCheck | Just-In-Time Access | JIT vs. standing privileges: what it solves and when it applies |
| 15 | Dialogue | Tanaka's Debrief | "Identity is the new perimeter" + Ghost's POV unlocked (premium) |

#### 10 Core Knowledge Checks (Act 5)
1. MAC (Mandatory Access Control) is primarily used in: (Government/military — labels are assigned by system/policy, not user)
2. DAC (Discretionary Access Control): who controls access? (The DATA OWNER — they decide who gets access to their files/resources)
3. RBAC assigns permissions based on: (Job role/function, not individual identity)
4. Kerberos uses what to prove identity? (Tickets issued by a KDC — TGT for authentication, Service Ticket for resource access)
5. SAML is primarily used for: (Federated identity / SSO between organizations — web-based SSO)
6. OAuth 2.0 is primarily used for: (Authorization delegation — "allow this app to access my data" — NOT authentication alone)
7. OIDC (OpenID Connect) adds what to OAuth? (Authentication — OIDC is the identity layer on top of OAuth)
8. What is the PRIMARY risk of standing admin privileges? (Always-on access creates a large attack surface; compromise = instant full access)
9. Account deprovisioning should happen: (Immediately on termination — ideally before the person leaves the building)
10. A user has a NEED to access a file but does NOT have clearance. Should they get access? (No — both need-to-know AND clearance are required under MAC)

#### Memory Hacks (Act 5)
1. **Authentication factors**: "Know, Have, Are, Somewhere, Do" = Something you Know (password), Have (token), Are (biometric), Somewhere (location), Do (behavior) — multi-factor means different TYPES, not just multiple of the same
2. **MAC vs. DAC**: "MAC = Mother Assigned Control" — someone else decides your label. "DAC = Dad lets you decide" — owner controls access.
3. **SAML vs. OAuth vs. OIDC**: "SAML = Security Assertion Markup Language (enterprise SSO), OAuth = 'On Behalf Of' authorization, OIDC = OAuth + ID card"

#### Analogies (Act 5)
1. **IAM Lifecycle → Employee Badge**: When you start, HR badges you (provisioning). When you transfer, your access gets updated (review). When you leave, your badge is deactivated immediately (deprovisioning). Ghost's badge was active 18 months after he transferred departments.
2. **Kerberos → Movie Theater**: You buy a ticket (TGT) at the box office (KDC). The ticket-taker at each theater (service) checks your ticket for THAT movie (Service Ticket). You don't re-authenticate at every door — but you can't get in without the right ticket.
3. **Least Privilege → Hotel Room Key Card**: Your room key opens your room and the gym. It doesn't open the kitchen, the other guests' rooms, or the office. Access is proportional to NEED, not seniority.

---

### ACT 6 — "THE AUDIT"
**Domain**: Security Assessment & Testing (12% of exam)
**Location**: Remote (Sentinel Lab) + Meridian Cloud Infrastructure
**Mood**: The calm before the resolution. Systematic, methodical. Security professionals in their element — finally TESTING instead of guessing.
**Primary NPCs**: Dr. Tanaka, Marcus Webb
**New NPC**: Dilek Yildiz (contracted penetration tester — brilliant, ethical, irreverent)

**The Core Story Problem**: To understand the full blast radius of the breach, the team must conduct a formal security assessment. But first: they need written authorization. This becomes a lesson in why proper scoping, authorization, and methodology matter.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | Assessment Setup | Scoping: what's in/out of assessment scope; why authorization is non-negotiable |
| 2 | Evidence | The Authorization Document | Rules of engagement: testing scope, exclusions, emergency stop conditions |
| 3 | KnowledgeCheck | Assessment Types | Vulnerability assessment vs. pen test vs. red team vs. audit — key differences |
| 4 | InteractiveImage | Log Review Lab | Find the breach start in 3,000 log entries using correlation clues |
| 5 | Dialogue | Dilek's Introduction | Pen test methodology: Reconnaissance → Scanning → Exploitation → Post-exploitation → Reporting |
| 6 | Evidence | The Vulnerability Report | 847 Critical, 2,300 High — how to read, prioritize, and present a vuln report |
| 7 | ThinkLikeManager | The Remediation Prioritization | Given budget and timeline constraints, prioritize 847 critical vulns |
| 8 | KnowledgeCheck | SIEM Correlation | What SIEM correlation rules SHOULD have fired and why they didn't |
| 9 | Evidence | The Shared Responsibility Gap | Cloud provider's assessment showed they did THEIR job. Meridian's side was the problem. |
| 10 | InteractiveImage | Black/Gray/White Box | For each scenario, determine which box test is appropriate |
| 11 | Dialogue | Ethical Disclosure | What to do when you find something the client didn't ask you to find |
| 12 | Evidence | The Code Review Finding | Source code vulnerability discovered during assessment — not a pentest finding |
| 13 | KnowledgeCheck | Audit vs. Assessment | Internal vs. external vs. third-party audit; independence requirements |
| 14 | TimedDecision | The Scope Creep Decision | Dilek finds something out of scope — do you pursue it? |
| 15 | Dialogue | Tanaka's Debrief | Domain 6 + "the assessment IS the evidence for remediation" |

#### 10 Core Knowledge Checks (Act 6)
1. A vulnerability assessment vs. a penetration test: what's the KEY difference? (VA identifies vulnerabilities; pen test attempts to EXPLOIT them — both need authorization)
2. Black box vs. white box testing: a pen tester given full source code is conducting: (White box — full knowledge)
3. You find a critical vulnerability while pen testing that's out of scope. You: (Stop, notify the client in writing, get authorization to investigate further — do NOT exploit without authorization)
4. SIEM correlation rules trigger on: (Multiple related events that individually seem benign but together indicate an attack pattern)
5. The PRIMARY output of a penetration test is: (A report — findings, evidence, impact, recommendations — not the exploit itself)
6. A "false positive" in vulnerability scanning means: (The scanner reported a vulnerability that doesn't actually exist — wastes remediation resources)
7. Who should NOT be involved in auditing a process? (The person responsible for running that process — independence is mandatory)
8. The purpose of log management in security monitoring: (Detect incidents, support forensic investigation, demonstrate compliance — NOT prevent attacks)
9. Synthetic transactions in testing: (Simulated transactions that test system behavior without using real data)
10. Misuse case testing focuses on: (How a system could be abused by a malicious actor — the opposite of use-case testing)

#### Memory Hacks (Act 6)
1. **Pen test phases**: "RESER + Report" = Reconnaissance, Scanning, Exploitation, Post-exploitation, Reporting (and always start with Rules of Engagement)
2. **Box types**: "Black = Blind, Gray = Half-sighted, White = Open Book" — scope of knowledge the tester has about the target
3. **Audit independence rule**: "Never audit your own work" — the reviewer must be separate from the creator; third-party = highest independence

#### Analogies (Act 6)
1. **Vulnerability Assessment vs. Pen Test → Checking vs. Picking a Lock**: VA = a locksmith examining your door and telling you "this lock could be picked." Pen test = a locksmith actually picking it to prove they can. Both need your permission. Neither breaks into your house without it.
2. **SIEM → Security Camera + Motion Detection**: Individual cameras (logs) record everything. SIEM = the software that watches all cameras simultaneously and alerts when 3 cameras in sequence show suspicious movement (correlation).
3. **Audit Independence → Olympic Judging**: A judge can't score their own country's athlete. The closer you are to the work, the less credible your assessment of it.

---

### ACT 7 — "THE RESPONSE"
**Domain**: Security Operations (13% of exam)
**Location**: Tokyo — Meridian Global SOC
**Mood**: Full crisis mode. Multiple simultaneous incidents. Sleep-deprived analysts. This is what all the domain knowledge leads up to — the actual RESPONSE.
**Primary NPCs**: Dr. Tanaka, Agent Morales (most prominent), Alex steps into leadership
**Dramatic moment**: Alex is handed the IR team lead role — theory becomes practice

**The Core Story Problem**: This is the full incident response. Containment, eradication, recovery, forensics, evidence handling, DRP testing (which reveals the DR plan was never tested). Alex must lead while also learning.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | Tokyo SOC Arrival | SOC functions: monitoring, detection, response, threat intelligence |
| 2 | InteractiveImage | The IR Commander | 15 sequential IR decisions in real-time — right/wrong has consequences |
| 3 | Evidence | Order of Volatility | Forensic image priorities: RAM → swap → running processes → disk |
| 4 | KnowledgeCheck | Evidence Handling | Chain of custody requirements; what destroys admissibility |
| 5 | Dialogue | Morales's Forensics Briefing | Digital forensics: imaging, hashing, write-blocking, analysis |
| 6 | Evidence | The Backup Failure | Last clean backup: 6 months ago. RPO = violated. Now what? |
| 7 | TimedDecision | Ransom vs. Restore | Pay the ransom or restore from potentially-compromised backup? (No right answer — teaches risk decision framework) |
| 8 | KnowledgeCheck | DR Testing Types | Tabletop, Walkthrough, Simulation, Parallel, Full Interruption — order from least to most disruptive |
| 9 | Evidence | The Untested DR Plan | Meridian's DR plan was never tested. Full interruption test would have revealed the backup failure. |
| 10 | InteractiveImage | Recovery Strategy Builder | Match recovery objectives (RTO/RPO) to recovery site types (hot/warm/cold/mobile) |
| 11 | Dialogue | The Change Management Failure | How unauthorized changes during crisis made things worse |
| 12 | Evidence | The Physical Security Breach | SOC physical access was also compromised — badge logs tampered |
| 13 | ThinkLikeManager | The Media Query | Meridian's CEO wants to make a public statement. What's legally/ethically required? |
| 14 | KnowledgeCheck | Monitoring Tools | IDS/IPS/SIEM/UEBA/honeypot — what each detects and why it matters |
| 15 | Dialogue | Tanaka's Debrief | "You just ran an incident response. That IS Domain 7." |

#### 10 Core Knowledge Checks (Act 7)
1. Order of volatility (most to least volatile): (CPU registers → RAM → swap/pagefile → network connections → running processes → disk → optical media → backups)
2. Write blocker in forensics: why is it mandatory? (Prevents any data from being written to the evidence media — preserving hash integrity)
3. "Chain of custody" refers to: (Documentation of every person who accessed evidence, when, and why — maintains admissibility)
4. Hot site vs. warm site vs. cold site: (Hot = operational immediately, data current; Warm = hours to operational, needs data restore; Cold = empty facility, days to operational)
5. DR test that causes a REAL failover: (Full interruption test — highest fidelity, highest risk, rarest)
6. What is a honeypot? (A decoy system designed to attract attackers — detects intrusion, gathers intelligence, without risking real systems)
7. UEBA (User and Entity Behavior Analytics): what does it detect? (Anomalous behavior patterns — baseline deviation alerts, detects insider threats and compromised accounts)
8. The PRIMARY goal of incident containment is: (Limit damage and prevent spread — NOT to eradicate immediately, which comes after)
9. "Lessons learned" session occurs: (AFTER recovery is complete — not during the incident)
10. Mean Time Between Failures (MTBF) vs. Mean Time To Repair (MTTR): (MTBF = reliability measure; MTTR = recovery speed measure — both factor into availability calculations)

#### Memory Hacks (Act 7)
1. **IR phases**: "PICERL" = Preparation → Identification → Containment → Eradication → Recovery → Lessons Learned (different from the 4-phase version — ISC² uses 6)
2. **DR site tiers**: "Hot = Stove on, Warm = Ready to cook, Cold = Empty kitchen" — readiness time inversely related to cost
3. **Evidence handling**: "Document, Preserve, Analyze, Present" — in that order, always. Never analyze before preserving.

#### Analogies (Act 7)
1. **Order of Volatility → Melting Ice**: RAM = ice cube (melts immediately when power off). Running processes = ice in a cup (melts in minutes). Disk = ice in a freezer (persists). You scoop the most volatile evidence first.
2. **DR Site Types → Hotel Booking**: Hot site = hotel room you're already paying for and staying in. Warm site = room reserved for you, bed made, just needs your suitcase. Cold site = empty room, no reservation — you figure it out when you arrive.
3. **Chain of Custody → Evidence Bag**: Every hand-off of physical evidence gets signed. Digital forensics is the same — every action logged, every copy hashed, every analyst documented. The chain must never break.

---

### ACT 8 — "THE ROOT CAUSE"
**Domain**: Software Development Security (11% of exam)
**Location**: San Francisco — Meridian Engineering, SoMa District (startup-culture tech office meets enterprise horror)
**Mood**: The irony capital. The breach's root cause lives in the birthplace of the software industry. Cold brew, standing desks, a 3-year-old commit that nobody reviewed properly.
**Primary NPCs**: Dr. Tanaka, new NPC Jamie Okonkwo (Meridian's lead dev — not malicious, just never thought about security)
**Dramatic reveal**: The root vulnerability was a SQL injection in a 2019 commit that passed code review because nobody knew what to look for

**The Core Story Problem**: Trace the breach to its origin — a software vulnerability that was introduced, never caught, never patched, and ultimately exploited to gain initial access.

#### 15 Scene Breakdown

| # | Type | Scene Title | CISSP Concept |
|---|------|-------------|---------------|
| 1 | Dialogue | San Francisco Arrival | SDLC overview: development lifecycle without security vs. with security |
| 2 | Evidence | The Vulnerable Commit | SQL injection in a legacy API endpoint — finding it in git history |
| 3 | InteractiveImage | Code Review Simulator | Find 5 vulnerabilities in 50 lines of pseudocode |
| 4 | KnowledgeCheck | OWASP Top 10 | Match vulnerability to category: SQLi, XSS, IDOR, broken auth, etc. |
| 5 | Dialogue | Jamie's Confession | "We didn't have security requirements in the sprint. Security wasn't our job." |
| 6 | VisualAid | SDLC Security Gates | Where security should be integrated: requirements, design, code, test, deploy |
| 7 | Evidence | The Third-Party Library | A dependency with a known CVE from 3 years ago — never patched |
| 8 | ThinkLikeManager | The DevSecOps Pitch | How to integrate security into CI/CD without killing developer velocity |
| 9 | KnowledgeCheck | Software Maturity Models | SAMM vs. CMMI — what level describes Meridian's development practices |
| 10 | InteractiveImage | Supply Chain Risk Map | Map Meridian's software dependencies and identify single points of failure |
| 11 | TimedDecision | Responsible Disclosure | Found a zero-day in a shared library — do you disclose publicly, privately, or hold? |
| 12 | Evidence | The Complete Breach Timeline | All 8 domains, all 8 failures, one causal chain |
| 13 | Dialogue | The Full Picture | The Evidence Constellation completes — all nodes connected |
| 14 | KnowledgeCheck | Secure Coding Standards | OWASP ASVS, CERT Secure Coding Standards, CWE — which addresses what |
| 15 | Dialogue | Tanaka's Final Debrief | "You've earned this. You just built your CISSP." + Exam unlocked |

#### 10 Core Knowledge Checks (Act 8)
1. SQL injection is prevented PRIMARILY by: (Parameterized queries/prepared statements — NOT input sanitization alone, which can be bypassed)
2. OWASP Top 10: "Broken Access Control" refers to: (When users can act outside their intended permissions — vertical or horizontal privilege escalation)
3. The SDLC phase where security is CHEAPEST to address: (Requirements — fixing requirements-stage issues costs 1x; fixing in production costs 100x)
4. SAMM (Software Assurance Maturity Model) Level 2 means: (Defined, consistent practices — not just ad hoc, not fully optimized)
5. A third-party library with a known CVE: what is the FIRST action? (Assess whether the vulnerability is exploitable in your context — then prioritize patching accordingly)
6. DevSecOps principle: "shift left" means: (Move security activities earlier in the development process — not at the end, not after deployment)
7. Static application security testing (SAST) analyzes: (Source code, without executing it — finds code-level vulnerabilities)
8. Dynamic application security testing (DAST) analyzes: (Running applications — simulates real attacks against a live system)
9. Responsible disclosure best practice: (Notify the vendor privately first, give them time to patch, then disclose publicly — coordinated disclosure)
10. Supply chain risk in software: the PRIMARY concern is: (Unverified third-party components that could contain malicious code or known vulnerabilities)

#### Memory Hacks (Act 8)
1. **SDLC security cost rule**: "1x → 10x → 100x" — requirements (1x), development (10x), production (100x) — catch it early
2. **SAST vs. DAST**: "SAST = Static = Source code (before it runs). DAST = Dynamic = During execution (while it runs)."
3. **OWASP Top 10 by category**: "BXXI BIM SSF" is hard — instead, know the categories conceptually: Broken Access Control, Crypto Failures, Injection, Insecure Design, Security Misconfiguration, Vulnerable Components, Auth Failures, Integrity Failures, Monitoring Failures, SSRF

#### Analogies (Act 8)
1. **SQL Injection → Trick Waiter**: Parameterized queries = the waiter writes your order on a ticket (separating command from data). SQL injection = you hand the waiter a note that LOOKS like an order but contains an instruction to charge everyone's dinner to someone else.
2. **SDLC Security Gates → Building Inspection**: Inspecting the blueprint costs hours. Inspecting the foundation costs days. Tearing down the finished building costs millions. Check security at EVERY phase.
3. **Supply Chain Risk → Restaurant Kitchen**: You trust your restaurant's kitchen. But if your flour supplier was compromised, the bread you made with their flour is also compromised. Your SDLC is only as secure as your weakest dependency.

---

### EPILOGUE — "THE DEBRIEF"
Alex sits the CISSP exam in-app. Full CAT practice exam (250Q, 6hr simulation). The story wraps:
- Pre-exam: All NPCs wish Alex luck in unique dialogue
- During exam: Optional "case notes" from the investigation visible as reference (tests memory, not open book)
- Post-exam (pass): Celebration ceremony, all NPCs, shareable card
- Post-exam (fail): "Every failure is a learning event" — Dr. Tanaka debriefs the weak areas, assigns targeted practice

---

## PART 3: ANIMATION SYSTEM SPECIFICATION

### 3.1 Framer Motion Implementation Map

All animations use Framer Motion (already installed). No CSS transitions should remain after this pass.

#### Page Transitions (AnimatePresence)
```tsx
// Layout wrapper — every page transition
<AnimatePresence mode="wait">
  <motion.div
    key={pathname}
    initial={{ opacity: 0, y: 20 }}
    animate={{ opacity: 1, y: 0 }}
    exit={{ opacity: 0, y: -20 }}
    transition={{ duration: 0.2, ease: "easeInOut" }}
  >
    {children}
  </motion.div>
</AnimatePresence>
```

#### Scene Transitions (Story Mode)
Three types depending on dramatic context:
```tsx
// Fade (neutral transitions)
initial: { opacity: 0 }, animate: { opacity: 1 }, duration: 0.6

// Slide (location changes)
initial: { x: '100%' }, animate: { x: 0 }, duration: 0.4, ease: 'easeOut'

// Glitch (dramatic reveals, crisis moments)
// Custom keyframes: hue-rotate + blur + transform + opacity
// keyframes: [{opacity:1, filter:'blur(0) hue-rotate(0deg)'},
//             {opacity:0.8, filter:'blur(3px) hue-rotate(90deg)'},
//             {opacity:1, filter:'blur(0) hue-rotate(0deg)'}]
// duration: 0.3
```

#### Dialogue Box (Typewriter)
Current implementation uses setInterval. Replace with:
```tsx
// Wrap each character in a motion.span with stagger
// Stagger delay: 0.012s per character (12ms — matches current spec)
// Skip: on click/space/arrow, animate all remaining chars simultaneously (duration: 0)
```

#### Character Portrait Entry
```tsx
initial: { opacity: 0, scale: 0.95, y: 10 }
animate: { opacity: 1, scale: 1, y: 0 }
transition: { duration: 0.25, ease: 'backOut' }
// Expression changes: cross-fade between expressions over 0.15s
```

#### Decision Panel (Slide Up)
```tsx
initial: { y: '100%', opacity: 0 }
animate: { y: 0, opacity: 1 }
transition: { duration: 0.3, ease: 'easeOut' }
// Options stagger: each option delays 0.05s × index
```

#### XP Gain Animation
```tsx
// Counter animates from old value to new value
// useTransform + useSpring for smooth counting
// "+250 XP" badge: scale 0 → 1.1 → 1.0 (bounce), then floats up and fades
// Duration: 1.5s total
// Color: text-[#00e8ff] glow effect during count
```

#### Level Up Ceremony
```tsx
// Full-screen overlay (motion.div, z-50)
// Background: radial gradient pulse (dark → mid-blue → dark) looping
// Level badge: spring animation, scale 0.5 → 1.2 → 1.0
// Particle system: 50 particles scatter from center using custom physics
// NPC portrait appears with "Congratulations" dialogue
// Duration: 4 seconds total, skippable
```

#### Achievement Unlock
```tsx
// Toast-style banner slides in from top-right
// Icon: rotates 360° and settles with bounce
// Title + description fade in after icon animation
// Auto-dismiss after 4 seconds
// Special achievements (5-star): full-page takeover version
```

#### Knowledge Check Popup
```tsx
// Modal with spring entrance: scale 0.9 → 1.0, opacity 0 → 1
// Options: stagger in from left (0.04s each)
// Correct: option turns green, checkmark animates in (scale + rotate)
// Wrong: option shakes (x: -10→10→-10→10→0 over 0.3s), turns red
// Explanation: slides up from below after answer locked
```

#### Evidence Board Card Reveals
```tsx
// Cards flip 90° on X axis, then flip back to face
// Each card has its own delay in sequence
// Connection lines draw progressively using SVG pathLength
// Hover: slight levitate (y: -4) with shadow grow
```

#### Dashboard Widgets
```tsx
// ProgressRing: SVG strokeDashoffset animates over 1.5s on mount
// StreakCount: numbers flip like an odometer (digit-by-digit animation)
// DomainMastery radar: paths draw progressively over 1s
// All widgets: stagger in on first load (0.1s between each)
```

#### Investigation Mode Hotspots
```tsx
// Circular pulse rings radiating outward on interactive hotspots
// Scale: 1 → 1.5 → 2, opacity: 0.8 → 0, infinite loop
// On hover: hotspot ring turns cyan, label fades in
// On click: hotspot fills, expands, reveals evidence with spring
```

#### Story Scene Background
```tsx
// Parallax effect: background moves at 0.3x scroll speed
// Subtle zoom in over 30s (scale: 1 → 1.03) — Ken Burns effect
// On scene change: cross-fade with new background (0.8s)
```

### 3.2 Audio System (Tone.js / Web Audio API)
Optional, toggleable in settings. Volume slider in UI.

| Location | Ambient Track Style |
|----------|---------------------|
| Toronto (Act 1) | Corporate lobby ambient, distant phone calls, keyboard clicks |
| London (Act 2) | Rainy window, muffled traffic, subtle tension strings |
| Munich (Act 3) | Clean electronic hum, server fan white noise, mechanical precision |
| Singapore (Act 4) | Cyber-noir synth, low frequency pulse, neon buzz |
| New York (Act 5) | Financial floor ambient, subtle jazz undertones, tension |
| Remote/Lab (Act 6) | Clean beeps, keyboard sequences, methodical scanning sounds |
| Tokyo (Act 7) | Urgent synth, crisis undertones, Japanese city noise underneath |
| San Francisco (Act 8) | Developer energy, San Francisco street ambience, hopeful resolution |

**Interaction sounds**: Typewriter clicks (15ms interval), decision select (soft click), correct answer (satisfying chime), wrong answer (low thud), XP gain (ascending tone), level up (fanfare), achievement (notification bell).

---

## PART 4: IMAGE GENERATION STRATEGY

### 4.1 Replicate Setup
```bash
npm install replicate tsx
# Add to .env.local:
REPLICATE_API_TOKEN=r8_your_token_here
```

### 4.2 Character Consistency Approach

**Critical**: FLUX generates novel images each time. For character consistency across 5 expressions × 6 NPCs, we use:
1. A fixed, very detailed character card embedded in every portrait prompt
2. Identical style prefix across all images
3. Same seed for the base pose of each character (vary seed ±1-5 for expressions)
4. First-pass: generate all "neutral" portraits → these become the style reference
5. Second-pass: use img2img with the neutral as reference for expression variants

### 4.3 Character Card Definitions

**STYLE PREFIX (all images):**
> `anime-inspired cyberpunk visual novel portrait illustration, high detail, dramatic studio lighting, dark gradient background with subtle cyan/teal ambient glow, professional digital art, cinematic composition, sharp linework, rich colors, 2:3 portrait aspect ratio`

**DR. KEIKO TANAKA:**
> `Japanese woman early 50s, silver-streaked black hair in a precise architectural updo with zero loose strands, thin rectangular silver-framed glasses, sharp observant dark eyes, charcoal gray blazer over crisp white button-down shirt, small holographic Sentinel Dynamics badge on lapel, composed authoritative posture suggesting decades of experience, cyberpunk-subtle aesthetic`

**MARCUS WEBB:**
> `Black man late 30s, close-cropped hair with a neat short beard, broad-shouldered build suggesting former military intelligence background, dark tactical hoodie with subtle tech-company branding, tablet held in one hand or coffee mug in other, warm direct intelligent eyes, genuine confidence without arrogance`

**PRIYA SHARMA:**
> `Indian woman mid 40s, shoulder-length dark hair with deep auburn highlights, sharp dark eyes carrying crisis weight behind executive composure, navy blue power suit with subtle Meridian Global pin, precise professional bearing, tension visible in set jaw despite controlled expression`

**JAMES GHOST HOLLOWAY:**
> `Mixed-race man early 30s, medium build deliberately unremarkable physique, light brown hair cut short without distinguishing style, neutral forgettable features, simple dark gray clothing with no logos or identifying marks, the specific look of someone who has practiced not being noticed, slightly hollow eyes with intelligence underneath`

**ELENA VASQUEZ:**
> `Latina woman late 30s, natural dark curly shoulder-length hair, reading glasses pushed up on her forehead, burgundy tailored pantsuit suggesting precision and professionalism, always carrying a stack of case files or a legal pad, methodical precise bearing, slight forward lean as if always analyzing`

### 4.4 Background Scene Prompts

**STYLE PREFIX (backgrounds):**
> `anime-inspired cyberpunk visual novel background illustration, wide cinematic 16:9 ratio, dramatic architectural space, no people, atmospheric lighting with cyan/teal accents, rich dark tones, professional high-quality digital art`

| Scene Key | Location | Prompt Addition |
|-----------|----------|-----------------|
| act1_hq_day | Toronto Office Day | `modern open-plan cybersecurity firm office, glass walls, multiple monitor workstations, city skyline visible through floor-to-ceiling windows, warm professional lighting` |
| act1_hq_night | Toronto Office Night | `same office at night, city lights through windows, dramatic desk lamp lighting, urgency of late-night crisis work` |
| act1_briefing_room | War Room | `large conference room with digital evidence wall, multiple screens showing breach data, whiteboard with attack timeline, dim overhead lighting` |
| act2_london_hq | London Corporate HQ | `imposing corporate headquarters lobby in London financial district, marble floors, security gates, corporate art, grey British sky through revolving doors` |
| act2_data_center | London Data Center | `climate-controlled data center, rows of black server racks, blue LED indicator lights, raised floor, cold clinical atmosphere` |
| act3_munich_lab | Munich R&D Lab | `cutting-edge research laboratory inside a converted Baroque building, contrast of stone arches and carbon fiber surfaces, glowing screens, precision instruments` |
| act3_physical | Server Room Physical | `server room showing physical security failures: prop against door, visible wiring, unlocked rack cabinets, fluorescent lighting` |
| act4_singapore_dc | Singapore Data Center | `massive tropical data center exterior and interior, cyan LED strips, humid air suggestion, cutting-edge scale, cyberpunk city visible outside` |
| act4_noc | Network Operations Center | `network operations center with curved wall of monitors showing global network maps, topology visualizations, alert dashboards, dramatic red/cyan lighting` |
| act5_ny_financial | New York Financial Division | `Wall Street-adjacent financial operations floor, trading terminal aesthetic, glass-walled offices, Hudson River view, high stakes atmosphere` |
| act5_interrogation | Interview Room | `bare corporate meeting room repurposed as interrogation, single table, two chairs, one-way glass suggestion, tension-lit` |
| act6_lab | Sentinel Dynamics Lab | `technical cybersecurity research lab, workstations with Kali Linux terminals, network topology maps on screens, organized technical chaos` |
| act6_cloud | Abstract Cloud Infrastructure | `visual metaphor for cloud infrastructure: glowing server node constellation on dark background, connection lines, abstract but professional` |
| act7_tokyo_soc | Tokyo SOC | `massive security operations center in Tokyo, floor-to-ceiling monitor walls, multiple analyst stations, Japanese kanji emergency notices, urgent red lighting mixed with professional blue` |
| act7_tokyo_exterior | Tokyo Night Exterior | `cyberpunk Tokyo street at night, rain reflections, neon signs, suited professionals, sense of crisis and urgency` |
| act8_sf_office | San Francisco Engineering | `modern SoMa San Francisco tech company open office, exposed concrete, plants, standing desks, whiteboards covered in architecture diagrams, Bay Bridge or city skyline visible through windows, casual creative energy` |
| act8_code | Code Review Room | `small technical room with code displayed on large monitor, developer and security professional studying it together, focused tense atmosphere` |

### 4.5 Evidence & Diagram Images

| Image Key | Type | Description |
|-----------|------|-------------|
| evidence_ir_plan_blank | Document | Blank incident response plan document with "DRAFT - 2021" stamp, realistic corporate document look |
| evidence_risk_register | Spreadsheet | Partial risk register showing 3 entries with severity heatmap, corporate document aesthetic |
| evidence_ghost_access | Access Log | Screen showing Ghost's access profile: 847 systems listed, last reviewed: never |
| evidence_packet_capture | Technical | Wireshark-style packet capture showing suspicious DNS exfiltration pattern |
| evidence_vuln_report | Report Cover | Professional vulnerability assessment report cover: "CRITICAL" stamp, 847 findings noted |
| evidence_expired_cert | Certificate | Expired SSL certificate dialog with red warning indicators |
| evidence_architecture | Diagram | Simple network architecture showing flat network with single perimeter firewall — attack path clearly visible |
| diagram_osi_model | Reference | Clean OSI model diagram with layer names, protocols at each layer, cyberpunk aesthetic |
| diagram_cia_triad | Reference | CIA triad triangle diagram with cyberpunk glow effects |
| diagram_kill_chain | Reference | Cyber kill chain diagram showing breach progression |
| diagram_access_models | Reference | Side-by-side comparison table of DAC/MAC/RBAC/ABAC access control models |
| diagram_ir_lifecycle | Reference | PICERL incident response lifecycle as circular flow diagram |
| diagram_sdlc_security | Reference | SDLC with security gates integrated at each phase |
| diagram_crypto_types | Reference | Symmetric vs. Asymmetric encryption flow comparison |

### 4.6 UI Assets

| Asset Key | Description |
|-----------|-------------|
| world_map_background | Dark world map with 8 location pins (Toronto, London, Munich, Singapore, New York, Remote, Tokyo, San Francisco), cyberpunk aesthetic |
| title_screen | CISSP Quest title screen with Alex Mercer silhouette, dramatic composition |
| act_card_locked | Locked act card template with padlock icon, greyed-out |
| act_card_completed | Completed act card with certification stamp, gold accent |
| daily_challenge_bg | Daily challenge card background — urgent dossier aesthetic |
| achievement_bg | Achievement unlock background — gold/cyan burst |
| loading_screen_[1-4] | 4 loading screens cycling through cyberpunk locations |

---

## PART 5: MEMORY TECHNIQUE INTEGRATION FRAMEWORK

### 5.1 The Method of Loci (Per-Domain Memory Palace)
Each domain = a location from the story. Concepts = objects placed in that location.

**Domain 1 Memory Palace — Sentinel Dynamics Toronto Office**
- The whiteboard wall = Policy Hierarchy (policies written top to bottom, like a hierarchy)
- The risk register whiteboard = Threat × Vulnerability × Impact = Risk
- The CEO's glass office = Risk Appetite (visible to all, set at the top)
- The incident war room = IR Plan phases on the walls
- The exit door = Last resort: risk avoidance

**Domain 2 Memory Palace — Meridian London HQ**
- Reception desk = Data Classification (the receptionist classifies who can go where)
- File room = Data lifecycle (files are born, stored, archived, destroyed)
- The shredder = Data destruction methods
- The cloud screen = Data states (at rest in the server, in transit in the network, in use on screen)

**Domain 3 Memory Palace — Munich R&D Lab**
- The vault door = Fail Secure
- The Baroque archway = Bell-LaPadula (classical, old, confidentiality-focused)
- The modern server = Biba (new, integrity-focused, opposes old document access)
- The workbench = Cryptography Workbench (symmetric = one key, asymmetric = padlock + key)

Continue this framework for all 8 domains. Build into StoryPlayer as an optional "Memory Palace Mode" — player walks through a stylized version of the location and clicks on objects to review concepts.

### 5.2 Master Analogy Bank

Key CISSP concepts → grounded real-world analogies:

| Concept | Analogy |
|---------|---------|
| Confidentiality | Sealed envelope — contents only for addressee |
| Integrity | Wax seal — proves nobody tampered with the letter |
| Availability | Open 24/7 store — security can't sacrifice access |
| Authentication | ID check at the door |
| Authorization | List of what you're allowed to do once inside |
| Non-repudiation | Signed receipt — you can't say you didn't receive it |
| Least Privilege | Hotel key opens YOUR room, not the whole hotel |
| Separation of Duties | Nuclear launch requires two keys simultaneously |
| Defense in Depth | Castle: moat + walls + inner walls + keep + vault |
| Risk | Driving in rain = threat (rain) × vulnerability (worn tires) × likelihood (winter) × impact (accident) |
| ALE calculation | Car insurance premium = your car's value × probability of total loss |
| Bell-LaPadula | FBI agent reads UP in clearance but can't write DOWN to unclassified |
| Biba | Scientist won't use unverified data sources (no read up) and won't write to verified docs without review (no write down) |
| PKI | Passport system: government (CA) issues document (cert) that others trust |
| Zero Trust | Assume every corridor in the hospital is public — show badge everywhere |
| Kerberos | Movie theater ticket: box office (KDC) issues ticket for specific movie (service) |
| SAML | Your company's HR system (IdP) vouches for you to the benefits portal |
| OAuth | "Allow Google to access your calendar on this app's behalf" — delegated access |
| SQL Injection | Ordering "a pizza AND give me all your customer data" — the kitchen doesn't separate the food order from the command |
| Defense in Depth | Onion: even if outer layer breaks, you still have layers |
| Chain of Custody | Relay race baton: every hand-off documented, baton never touched by non-runner |
| Tabletop vs. Full DR Test | Reading the fire escape plan vs. actually evacuating the building |
| RTO vs. RPO | RTO: "how fast can we reopen?" RPO: "how much work can we afford to redo?" |
| Vulnerability vs. Threat | Unlocked car door (vulnerability). Car thief (threat). Break-in (incident). |
| Risk appetite | CEO says "we can afford to lose $1M before we escalate" = risk tolerance threshold |
| MTBF | How long between car oil changes before it breaks down (on average) |

### 5.3 Exam Trap Database

Each domain has 3-5 common trap questions. These appear in the story as "Case File Traps" — evidence documents from the investigation that were intentionally misleading to show how Meridian got fooled.

| Domain | Trap | The CISSP Answer |
|--------|------|-----------------|
| 1 | "The security team approved the risk" | WRONG — Business owner approves risk, security advises |
| 1 | "First step: identify vulnerabilities" | WRONG — First step is always Preparation/Planning |
| 2 | "Delete the data to protect privacy" | WRONG — Verify legal retention requirements FIRST |
| 3 | "Use a proprietary algorithm for better security" | WRONG — Open, peer-reviewed standards are more secure |
| 3 | "Encrypt everything with AES-256" | WRONG — Key management is as important as algorithm strength |
| 4 | "Block all inbound traffic at the firewall" | WRONG — Also need to monitor/filter outbound (exfiltration) |
| 5 | "MFA is too inconvenient for executives" | WRONG — Executives are high-value targets; MFA is more critical, not less |
| 6 | "The pen tester found a critical vulnerability, so we tested it in production" | WRONG — Get WRITTEN authorization before testing in production |
| 7 | "Restart the server to clear the malware" | WRONG — Preserves no evidence. Image first, then analyze. |
| 8 | "Security is the developer's problem to fix" | WRONG — DevSecOps = shared responsibility. Managers own the outcome. |

---

## PART 6: NEW INTERACTIVE FEATURES (BEYOND THE SPEC)

### 6.1 The Risk Calculator (Act 1)
Interactive ALE/SLE/ARO calculator embedded in the investigation. Players input:
- Asset value
- Exposure factor (% damaged in incident)
- Annual Rate of Occurrence

See: SLE = Asset Value × EF, ALE = SLE × ARO

Dynamic: as you change values, the risk matrix updates in real-time. Shows where on the matrix the risk falls and what response options are appropriate.

### 6.2 Network Topology Tracer (Act 4)
SVG-based interactive network diagram. Players drag connection paths between nodes to trace the attacker's lateral movement. Correct path lights up. Wrong paths show why the attacker couldn't go that route (firewall rule, VLAN segment, etc.). Each completed step teaches one network security concept.

### 6.3 Access Control Laboratory (Act 5)
Simulated file system with 20 users, 8 departments, 50 files. Players:
- Assign users to roles (RBAC mode)
- Set mandatory labels (MAC mode)
- Grant discretionary access (DAC mode)
- Set attribute-based rules (ABAC mode)

Scenario: Ghost tries to access payroll data. Under each model, the system shows whether access is granted and why.

### 6.4 The Cryptography Workbench (Act 3)
Simplified but accurate crypto simulation:
- Players choose encryption type (symmetric/asymmetric) for a scenario
- Key exchange visualization shows how keys are distributed
- PKI chain builds visually as certificates are added
- Expiry simulation shows what happens when certs expire (the Meridian scenario)

### 6.5 Incident Response Commander (Act 7)
15-decision sequence, each decision appears for 45 seconds (togglable timer):
- Situation described
- 4 options presented
- Choice is locked
- Consequence plays out (immediate + downstream)
- Score tracked (CISSP-correct responses = maximum IR score)

Scenarios include: First responder notification, evidence preservation, containment scope, external communication, recovery sequencing.

### 6.6 The Code Review Simulator (Act 8)
50 lines of realistic pseudocode with 5 hidden vulnerabilities. Players:
- Click to select a suspect line
- Categorize the vulnerability (from a dropdown)
- Explain the impact

Vulnerabilities include: SQL injection (obvious), hardcoded credential (subtle), missing input validation, insecure randomness, insufficient logging. Score tracks sensitivity and precision.

### 6.7 The Evidence Constellation (Global Feature)
D3.js force-directed graph accessible from the dashboard. 200+ concept nodes. Connections show relationships. Nodes unlock as the player encounters them in story. Color-coded by domain. Node size = exam weight. Zoom and pan supported. Click any node → Library topic.

This is the most powerful study tool in the app after the full game is completed — it's a visual map of the entire CISSP body of knowledge that the player built themselves.

### 6.8 The CISSP Study Planner (Dashboard Widget)
User inputs exam date during onboarding. Planner generates:
- Daily study target (hours/day to cover all content before exam)
- Weekly domain focus
- Checkpoint practice exams at 30, 14, and 7 days out
- Dynamic reprioritization based on weak area tracking

Shows as a calendar view on the dashboard with daily goals marked.

### 6.9 The Exam Readiness Meter (Dashboard)
Live calculation based on:
- Domain mastery percentages (weighted by exam weight)
- Practice exam scores (trend, not just latest)
- Time-per-question trends (getting faster or slower)
- Concept mastery (from spaced repetition data)
- Story completion percentage

Outputs: "Estimated Pass Probability: 74%" with the 3 domains most likely to cost points.

### 6.10 The "Sentinel Toolkit" Tab
Accessible from main navigation. Interactive reference tools:

| Tool | Description |
|------|-------------|
| ALE/SLE/ARO Calculator | Input fields, live calculation, risk matrix output |
| BIA Calculator | Input RTO/RPO/MTD/WRT, shows recovery strategy recommendation |
| Crypto Comparison Table | Algorithm, key size, use case, strengths, weaknesses — filterable |
| OSI Reference | Interactive layer stack: click each layer for protocols, attacks, devices |
| Access Control Comparison | DAC vs. MAC vs. RBAC vs. ABAC side-by-side |
| DR Site Comparison | Hot vs. Warm vs. Cold — cost, RTO, description |
| Common Ports Reference | Searchable: port number → protocol → security notes |
| Acronym Lookup | 300+ CISSP acronyms, searchable, with one-liner definitions |
| Risk Response Matrix | Input likelihood/impact, get recommended risk response |

---

## PART 7: TECHNICAL IMPLEMENTATION NOTES

### 7.1 shadcn/ui Installation (Critical First Step)
```bash
npx shadcn@latest init
# Select: Dark theme, CSS variables, src/components/ui
# Then install all components:
npx shadcn@latest add button card dialog sheet sidebar navigation-menu
npx shadcn@latest add input select checkbox radio-group slider switch form
npx shadcn@latest add alert toast badge progress tabs accordion scroll-area
npx shadcn@latest add table dropdown-menu popover tooltip toggle command
npx shadcn@latest add separator avatar aspect-ratio skeleton collapsible
```

### 7.2 Additional Packages Needed
```json
{
  "replicate": "^1.0.0",
  "tsx": "^4.19.3",
  "d3": "^7.9.0",
  "@types/d3": "^7.4.0",
  "tone": "^15.0.4",
  "react-flow-renderer": "^10.3.17"
}
```

### 7.3 New Database Tables (Beyond Current Schema)
```sql
-- New tables for enhanced features
CREATE TABLE breach_timeline_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  act_number INT NOT NULL,
  day_number INT NOT NULL,
  domain_id INT NOT NULL,
  event_title TEXT NOT NULL,
  event_description TEXT NOT NULL,
  severity TEXT CHECK (severity IN ('low', 'medium', 'high', 'critical')),
  is_visible BOOLEAN DEFAULT false -- revealed as player completes acts
);

CREATE TABLE evidence_constellation_nodes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  node_key TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  domain_id INT NOT NULL,
  exam_weight FLOAT,
  library_topic_id UUID REFERENCES library_topics(id),
  x_position FLOAT, y_position FLOAT -- starting position hint
);

CREATE TABLE evidence_constellation_edges (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_key TEXT NOT NULL,
  target_key TEXT NOT NULL,
  relationship_label TEXT,
  edge_type TEXT CHECK (edge_type IN ('requires', 'extends', 'contrasts', 'enables'))
);

CREATE TABLE player_constellation_unlocks (
  user_id UUID REFERENCES auth.users(id),
  node_key TEXT NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT now(),
  PRIMARY KEY (user_id, node_key)
);

CREATE TABLE exam_countdown (
  user_id UUID REFERENCES auth.users(id) PRIMARY KEY,
  exam_date DATE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE study_plan_milestones (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  milestone_date DATE,
  milestone_type TEXT CHECK (milestone_type IN ('practice_exam', 'domain_review', 'checkpoint')),
  domain_focus INT, -- null = all domains
  target_score INT,
  completed BOOLEAN DEFAULT false,
  actual_score INT
);
```

### 7.4 Execution Session Plan

**Priority order for maximum impact:**

| Session | Focus | Deliverable |
|---------|-------|-------------|
| 1 | shadcn/ui + Fonts + Design Tokens | Full design system |
| 2 | Database migrations (new tables) | Schema complete |
| 3 | Navigation + App shell | Full layout |
| 4 | Framer Motion integration | All animations |
| 5 | Act 1 content replacement + new narrative | Act 1 live |
| 6 | Act 2 content | Act 2 live |
| 7 | Story Engine enhancements (Memory Palace, Evidence Constellation) | Enhanced engine |
| 8 | Image generation pipeline + run | ~200 images generated |
| 9 | Acts 3-4 content | Acts 3-4 live |
| 10 | Acts 5-6 content | Acts 5-6 live |
| 11 | Acts 7-8 content + Epilogue | All 8 acts live |
| 12 | Interactive features (Risk Calc, Network Tracer, Access Lab) | Toolkit live |
| 13 | Practice exam simulator (250Q CAT) | Full exam simulator |
| 14 | Gamification completion (achievements, leaderboard, social) | Full gamification |
| 15 | Dashboard + Study Planner + Exam Readiness Meter | Dashboard complete |
| 16 | Library + Glossary rebuild (full content) | Reference library |
| 17 | Landing page + Stripe integration | Monetization ready |
| 18 | Ghost's POV scenes + Sentinel Files | Premium content |
| 19 | Audio system (Tone.js) | Ambient audio |
| 20 | QA, accessibility, performance, mobile polish | Ship-ready |

### 7.5 Content Generation Approach for Acts

For each act, the scene content follows this TypeScript structure:
```typescript
export const act1Scenes: StoryScene[] = [
  {
    id: 'act1_scene1',
    sceneNumber: 1,
    type: 'dialogue',
    title: 'First Morning',
    locationDescription: 'Sentinel Dynamics HQ — Toronto, Canada',
    backgroundImageKey: 'act1_hq_day',
    content: {
      speaker: 'narration',
      dialogue: [
        {
          characterId: 'narration',
          text: "Your first week at Sentinel Dynamics was supposed to be orientation and paperwork. Instead, you're staring at a whiteboard covered in red ink.",
        },
        {
          characterId: 'tanaka',
          expression: 'serious',
          text: "Alex. Good timing. We've got a situation.",
        },
        // ... more dialogue nodes
      ]
    },
    examObjectives: ['1.1', '1.2'],
    memoryHack: null,
  },
  // ...
]
```

---

## PART 8: WHAT I NEED FROM YOU

### Immediate (To Run Image Generation):
1. Sign up at replicate.com (GitHub login works, 2 minutes)
2. Add $25 in credits (covers all ~200 images)
3. Copy your API token (starts with `r8_`)
4. Run in this chat: `! echo "REPLICATE_API_TOKEN=r8_yourtokenhere" >> .env.local`

### For Content Accuracy:
5. Confirm whether to use the existing NPC names (Reeves/Janet/Kai/Morales) or full switch to the spec's names (Tanaka/Webb/Sharma/Ghost/Vasquez)
6. Confirm exam date if you have one (for study planner feature)

### Optional Decisions:
7. Audio: Yes/No? (Adds Tone.js, ~2 days work, but optional)
8. Ghost's POV: Include in the initial build or save for v2?
9. "I Passed" social sharing: In scope for v1?

---

## PART 9: COMMUNITY, RETENTION & BUSINESS SYSTEMS

> Updated 2026-04-16 based on product vision: this is a commercial SaaS release, not a personal study tool.

### 9.1 The Community Hub

CISSP Quest is not a solo game. The community layer is a core retention driver and a competitive moat — competitors don't have it.

#### Domain Lounges (Real-Time Chat)
8 domain-specific chatrooms powered by Supabase Realtime. Each lounge:
- Tied to the domain (Domain 1 lounge = Risk Management discussion)
- Shows member count online (social proof)
- Pinned resources: the domain's Library topics, Memory Hacks, active weekly challenge
- Message history: last 500 messages persisted, searchable
- Emoji reactions on messages
- @mention support

**Additional rooms**: `#general`, `#exam-day-stories`, `#i-just-passed`, `#study-squads`

Access: Pro+ (Free tier can read, cannot post — creates upgrade incentive)

#### The War Room (Reddit-Style Forum)
A full asynchronous forum. Not a chatroom — threaded discussions, searchable, indexed by Google (SEO flywheel).

Features:
- Posts with title, body (markdown), optional domain tag
- Nested comments (2 levels deep)
- Upvotes (no downvotes — keep the community positive)
- Post flair: Question, Tip, Memory Hack, I Passed, Story Discussion, Bug Report
- User flair: Level + Title (e.g., "Level 23 — Security Architect") shown next to every post
- Pinned posts: admin-pinned weekly discussion, domain spotlight
- Weekly "Best Explanation" award: community votes on the clearest explanation of a CISSP concept, winner gets bonus XP + featured profile
- Moderator tools: hide, lock, pin, warn, ban (admin panel)
- AI moderation layer: flag off-topic or inappropriate content before human review

Access: Read = everyone including non-users (SEO). Post = Free tier in #general only, Pro+ everywhere.

#### Study Squads
Small accountability groups of 3–6 players.

- Create a squad → get an invite code
- Squad leaderboard: combined weekly XP vs. other squads
- Squad chat (private channel within the community)
- "Sync session" feature: all squad members can join a synchronized timed quiz simultaneously — same questions, racing each other
- Squad achievements: "Squad First Blood" (first member passes practice exam), "Full Sweep" (all members complete an act in one week)
- Squad profile page: public, shows members, combined stats, domain strengths

Access: Create squad = Premium. Join squad = Pro+.

---

### 9.2 Medal System

Medals appear on profiles, in the forum next to usernames, and on the leaderboard. They create status and give long-term players something to chase.

#### Domain Medals (8 domains × 4 tiers = up to 32 medals per user)

| Tier | Requirement | Visual |
|------|-------------|--------|
| Bronze | 50 correct answers in domain | Bronze shield with domain icon |
| Silver | 200 correct + ≥70% accuracy | Silver shield |
| Gold | 500 correct + ≥80% accuracy | Gold shield with glow effect |
| Platinum | 1,000 correct + ≥90% accuracy | Animated platinum shield with particle shimmer |

Domain medal icons:
- D1 (Risk): Shield icon
- D2 (Asset): Safe/vault icon
- D3 (Architecture): Blueprint/gear icon
- D4 (Network): Globe/network icon
- D5 (IAM): Key/badge icon
- D6 (Assessment): Magnifier icon
- D7 (Operations): Eye/radar icon
- D8 (Software): Code bracket icon

#### Overall Achievement Medals (narrative + milestone)

| Medal | Trigger | Tier |
|-------|---------|------|
| CISSP Candidate | Complete Act 1 | Special |
| Field Analyst | Complete Acts 1–4 | Special |
| Security Professional | Complete all 8 acts | Special (animated) |
| CISSP Champion | Pass the 250Q practice exam ≥75% | Gold (animated) |
| CISSP Legend | Self-report passing real exam + share cert screenshot | Legendary (full-profile effect) |
| Eternal Scholar | 1,000+ questions answered after passing | Platinum |
| Streak Master: 30 | 30-day streak | Silver |
| Streak Master: 100 | 100-day streak | Gold |
| Streak Master: 365 | 365-day streak | Legendary |
| Domain Dominator | Gold medal in all 8 domains | Gold (animated) |
| The Perfectionist | 100% on any act assessment | Gold |
| Speed Demon | Complete an act assessment in under 10 minutes with ≥90% | Silver |
| Weekly Champion | Finish #1 on any weekly leaderboard | Special (expires weekly, permanent record) |
| Top 10 Scholar | Monthly: finish top 10 on weighted monthly board | Gold |
| Ghost Slayer | Complete Ghost's POV mode | Special (unlocked content) |
| The Mentor | Have 10 community posts with ≥50 upvotes | Silver |
| Memory Master | Complete a Memory Palace tour for all 8 domains | Silver |
| Evidence Hunter | Unlock every node in the Evidence Constellation | Gold |

Medals display on:
- User profile (full showcase page)
- Forum posts (top 3 rarest medals shown as icons)
- Leaderboard rows (most recent + rarest)
- Share cards (most impressive 6)

---

### 9.3 Weekly Competition System

Resets every **Sunday at midnight UTC**. Creates a weekly rhythm that brings users back.

#### Scoring Formula
```
Weekly Score = Σ ( questions_answered × difficulty_multiplier × session_accuracy_bonus )

difficulty_multiplier:
  Easy = 1.0
  Medium = 2.0
  Hard = 3.5
  Very Hard = 5.0

session_accuracy_bonus:
  ≥90% correct = 1.5×
  70–89% correct = 1.2×
  50–69% correct = 1.0×
  <50% correct = 0.7× (penalty for guessing)
```

This means a player who answers 100 hard questions at 90% accuracy earns far more than one who spams 500 easy questions. Quality beats quantity — aligned with CISSP learning goals.

#### Weekly Leaderboard Tiers
- **Global**: Top 100 all users, paginated
- **Domain**: Top 50 in each of the 8 domains (based on domain-specific questions answered)
- **Squad**: Top 20 squads by combined member score
- **Friends**: Coming post-launch (follow system)

#### Weekly Rewards
| Rank | Reward |
|------|--------|
| #1 | "Weekly Top Scholar" animated profile badge (lasts 7 days), +500 XP bonus, permanent record in Hall of Fame |
| #2–3 | +300 XP bonus, Silver weekly badge |
| #4–10 | +150 XP bonus, Bronze weekly badge |
| Top 10% | +50 XP bonus |

#### Monthly Championship
- Top 3 weekly winners from each month compete for "Monthly Champion" status
- Hall of Fame page on the site (publicly visible, SEO value)
- LinkedIn-shareable "Monthly CISSP Scholar" certificate image

---

### 9.4 Eternal Learner Mode (Post-Pass Engagement)

The player completes the story and passes the practice exam. Without this system, they leave. With it, they stay — and refer others.

#### What Keeps Them Playing

**1. Prestige System**
After completing all 8 acts and passing the practice exam, players can "prestige." Their story progress resets but:
- They keep all medals, XP level, and community status
- They unlock a Prestige badge (star icon next to level number)
- Prestige 1, 2, 3, etc. (up to 5 prestige levels)
- Each prestige unlocks: harder question pool, alternate story dialogue paths, exclusive cosmetics
- The "story" replays but with harder knowledge checks and different NPC dialogue acknowledging they've been through this before

**2. Expert Challenge Mode**
Infinite AI-generated questions. Harder than the main game. Time-pressured. For players who want to maintain and sharpen knowledge after passing:
- 10-question daily challenge: domain-weighted, expert difficulty
- Leaderboard specifically for Eternal Learner mode (separate from pre-pass leaderboard)
- "Expert Streak" counter: consecutive days completing the expert challenge

**3. Teaching Mode**
High-level players (Level 30+) can answer flagged community questions and be voted on for accuracy. Correct, highly-upvoted answers:
- Grant "Domain Expert" flair for that domain
- Count toward "The Mentor" medal
- Contribute to a "community knowledge base" that gets integrated into the Library

**4. Domain Mastery Perfection Chase**
Even after passing, players may have bronze medals in some domains. The medal system gives them a clear, visible goal: get every domain to Platinum. 1,000 correct answers at ≥90% per domain = years of sustained engagement for completionists.

**5. New Content Drops**
- Weekly: AI-generated batch of 20 new questions per domain (Claude API)
- Monthly: New investigation side-story (shorter than a full act — 5-7 scenes)
- Quarterly: Major content update (new story branch, new character, new location)
- When ISC² updates the exam outline: content refresh cycle (detected via community reports + admin trigger)

**6. Community Investment**
By the time someone passes, they've built:
- A community reputation (posts, upvotes, medals displayed)
- A squad they're accountable to
- A streak they don't want to break
- A profile they're proud of

Leaving means losing all of that. The community IS the retention system.

---

### 9.5 AI Content Pipeline (Continuous Generation)

Using the Anthropic API already configured in the project.

#### Weekly Question Generation (Automated)
```typescript
// Cron job (Inngest or Vercel Cron): every Sunday night
// 1. Pull current question bank stats per domain
// 2. Identify topics with <20 questions (thin coverage)
// 3. Generate 20 new questions per domain using Claude
// 4. Validate against Zod schema, check for duplicates (embedding similarity)
// 5. Insert as unvalidated, pending admin review
// 6. Admin dashboard: one-click approve/reject per question
// 7. Approved questions enter the live question bank
```

#### Community Question Pipeline
Users can propose questions through the forum. Proposed questions:
1. Get community votes (thumbs up/down)
2. 10+ net upvotes → AI validates accuracy against knowledge base
3. Passes validation → enters admin review queue
4. Approved → question credits the user (badge, XP bonus, name in credits)

This is a massive content scaling mechanism — your user base generates your content.

#### Story DLC (Monthly)
Short AI-generated investigation side-stories (5-7 scenes). Themes:
- "The Copycat" — another company suffers a breach mirroring Meridian's
- "The Audit Return" — Sentinel Dynamics is hired to verify Meridian's remediation
- "The Whistleblower" — an insider at a new client company, teaching new domain concepts
- New domains as ISC² expands the certification scope

---

### 9.6 Revised Monetization (Four Tiers + Viral Mechanics)

| Tier | Price | Access |
|------|-------|--------|
| **Free** | $0 | Acts 1–2, 10 questions/day, read-only community, view leaderboard only, no weekly ranking, no medals |
| **Pro** | $19.99 one-time | All 8 acts, unlimited questions, full community (posting everywhere), weekly ranking, all domain medals, basic study planner, 1 streak shield/week |
| **Premium** | $9.99/mo or $89/yr | Everything in Pro + weekly competition ranking + rewards, CAT practice exam, AI question generation (personalized), squad creation, Ghost's POV, Sentinel Files, advanced analytics, unlimited streak shields, Expert Challenge mode |
| **Expert** | $24.99/mo or $199/yr | Everything in Premium + Teaching Mode + community question creation + early access to monthly DLC + custom profile themes + priority support + "Expert" flair |
| **Enterprise** | Custom | Team management, custom scenario creation, bulk licensing, admin progress dashboard, SCORM export |

#### Viral Growth Mechanics Built Into the Product
1. **Community posts are public, non-gated, indexed by Google** — SEO flywheel, free users discovered via search
2. **Weekly leaderboard screenshots** — highly shareable, drives social FOMO
3. **"I Passed" ceremony** — generates a shareable card with referral link baked in
4. **Squad invites** — every squad member is a referral touchpoint
5. **Forum flair** — medal showcase visible to non-users, makes the community look elite
6. **Hall of Fame** — monthly champions are publicly listed, incentivizes top players to share their ranking
7. **Free tier exists** — anyone can start, the ceiling is visible, the upgrade is natural

---

### 9.7 Updated Database Schema (Community + Medals + Competition)

```sql
-- Community: Forum
CREATE TABLE community_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  domain_id INT,
  flair TEXT CHECK (flair IN ('question','tip','memory_hack','i_passed','story','bug')),
  upvotes INT DEFAULT 0,
  comment_count INT DEFAULT 0,
  is_pinned BOOLEAN DEFAULT false,
  is_removed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE community_comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id UUID REFERENCES community_posts(id) ON DELETE CASCADE,
  parent_id UUID REFERENCES community_comments(id),
  user_id UUID REFERENCES auth.users(id),
  body TEXT NOT NULL,
  upvotes INT DEFAULT 0,
  is_removed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE community_votes (
  user_id UUID REFERENCES auth.users(id),
  target_id UUID NOT NULL,
  target_type TEXT CHECK (target_type IN ('post', 'comment')),
  PRIMARY KEY (user_id, target_id, target_type)
);

-- Community: Real-time Chat
CREATE TABLE chatroom_messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  room_id TEXT NOT NULL,  -- 'domain-1' through 'domain-8', 'general', 'i-just-passed', 'study-squads', 'exam-day-stories'
  user_id UUID REFERENCES auth.users(id),
  message TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_chatroom_messages_room ON chatroom_messages(room_id, created_at DESC);

-- Study Squads
CREATE TABLE study_squads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  invite_code TEXT UNIQUE DEFAULT substr(md5(random()::text), 1, 8),
  owner_id UUID REFERENCES auth.users(id),
  max_members INT DEFAULT 6,
  is_public BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE squad_members (
  squad_id UUID REFERENCES study_squads(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id),
  role TEXT DEFAULT 'member' CHECK (role IN ('owner','member')),
  joined_at TIMESTAMPTZ DEFAULT now(),
  PRIMARY KEY (squad_id, user_id)
);

-- Medals
CREATE TABLE user_medals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  medal_key TEXT NOT NULL,
  medal_tier TEXT CHECK (medal_tier IN ('bronze','silver','gold','platinum','special','legendary')),
  domain_id INT,
  earned_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(user_id, medal_key)
);

-- Weekly Competition
CREATE TABLE weekly_scores (
  user_id UUID REFERENCES auth.users(id),
  week_start DATE NOT NULL,
  weighted_score FLOAT DEFAULT 0,
  questions_answered INT DEFAULT 0,
  domain_breakdown JSONB DEFAULT '{}',
  final_rank INT,
  reward_claimed BOOLEAN DEFAULT false,
  PRIMARY KEY (user_id, week_start)
);

-- Eternal Learner / Prestige
CREATE TABLE prestige_records (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  prestige_level INT NOT NULL,
  prestiged_at TIMESTAMPTZ DEFAULT now(),
  xp_at_prestige INT,
  acts_completed INT
);

-- AI Question Pipeline
CREATE TABLE pending_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  domain_id INT NOT NULL,
  source TEXT CHECK (source IN ('ai_generated','community_proposed')),
  proposed_by UUID REFERENCES auth.users(id),
  question_text TEXT NOT NULL,
  options JSONB NOT NULL,
  correct_index INT NOT NULL,
  explanation TEXT NOT NULL,
  community_upvotes INT DEFAULT 0,
  ai_validation_score FLOAT,
  admin_status TEXT DEFAULT 'pending' CHECK (admin_status IN ('pending','approved','rejected')),
  reviewed_by UUID REFERENCES auth.users(id),
  reviewed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Hall of Fame
CREATE TABLE hall_of_fame (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  period_type TEXT CHECK (period_type IN ('weekly','monthly')),
  period_start DATE,
  rank INT NOT NULL,
  score FLOAT NOT NULL,
  recorded_at TIMESTAMPTZ DEFAULT now()
);
```

---

### 9.8 Updated Execution Session Plan (Full Product)

| Session | Focus | Deliverable |
|---------|-------|-------------|
| 1 | shadcn/ui + Design system + Fonts | Full design tokens |
| 2 | Database migrations (all tables) | Complete schema |
| 3 | App shell + Navigation + Auth | Layout complete |
| 4 | Framer Motion — all animations | Fully animated |
| 5 | Acts 1–2 narrative replacement | New story live |
| 6 | Acts 3–4 content | Half the story done |
| 7 | Acts 5–6 + Ghost's POV scenes | IAM + assessment done |
| 8 | Acts 7–8 + Epilogue + Sentinel Files | Full story complete |
| 9 | Image generation pipeline + run | All images generated |
| 10 | Story engine enhancements (Memory Palace, Evidence Constellation) | Premium story features |
| 11 | Quiz engine rebuild + Practice exam CAT | Full quiz system |
| 12 | Library + Glossary (full content) | Reference complete |
| 13 | Gamification: XP, levels, streaks, medals | Full progression |
| 14 | Community Hub: Domain Lounges (Supabase Realtime) | Live chatrooms |
| 15 | Community Hub: The War Room (forum) | Forum live |
| 16 | Study Squads + Squad leaderboard | Social features |
| 17 | Weekly Competition system | Competition live |
| 18 | Eternal Learner: Expert Challenge + Prestige | Post-pass loop |
| 19 | AI question pipeline (Claude API, cron, admin queue) | Auto-generation |
| 20 | Dashboard complete (all widgets, study planner, readiness meter) | Command center |
| 21 | Interactive Toolkit (Risk Calc, Network Tracer, Access Lab, etc.) | Toolkit tab |
| 22 | Audio system (Tone.js, per-location ambient, settings toggle) | Ambient audio |
| 23 | Landing page + Stripe integration (4 tiers) | Monetization live |
| 24 | Admin dashboard (moderation, content approval, analytics) | Ops ready |
| 25 | QA + Performance + Accessibility + Mobile polish | Ship-ready |

---

## APPENDIX: COMPLETE ISC² EXAM OBJECTIVE COVERAGE MAP

Every exam objective (2024 CISSP Exam Outline) is mapped to at least one:
- Story scene (narrative encounter)
- Knowledge check question
- Library topic
- Practice question in the bank

[This mapping is maintained in the database `exam_objectives` table and cross-referenced in scene metadata]

Total objectives covered: 137 sub-objectives across 8 domains.
Target coverage: 100% of sub-objectives, with high-frequency exam topics covered 3-5× across story + practice.
