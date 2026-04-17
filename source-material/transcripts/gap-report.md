# CISSP Quest -- Content Gap Report

> **Generated:** 2026-04-16
> **Source documents:** gap-analysis.md, complete-content-map.md, topic-inventory.json
> **Purpose:** Phase 2 deliverable -- structured gap analysis driving Phase 3 question generation and Phase 4 story scene development

---

## Section 1: Topics in Transcripts NOT in Our Knowledge Base

The topic inventory identified 72 topics across 8 domains extracted from video transcripts. Cross-referencing against existing story mode content reveals 60 gaps -- topics the transcripts cover that the knowledge base and story engine do not yet teach.

The table below lists every gap with domain, subdomain, and priority rating. Priority is assigned by exam frequency and exam weight contribution, not by instructional complexity.

### Domain 1: Security and Risk Management (Exam Weight: 15%)

| # | Topic | Subdomain | Priority | Rationale |
|---|-------|-----------|----------|-----------|
| 1 | Security Controls Classification | Risk Management | HIGH | Control type discrimination (preventive/detective/corrective x admin/technical/physical) is a top-10 tested D1 concept. Appears in at least 1 of every 15 CISSP questions across all domains. |
| 2 | Third-Party Governance | Supply Chain | HIGH | Vendor risk management, document review, on-site assessment, and ATO process are heavily weighted in modern exam versions reflecting real-world supply chain incidents. |
| 3 | Social Engineering | Personnel Security | HIGH | Phishing, spear phishing, whaling, smishing, vishing, pretexting, baiting, and tailgating/piggybacking are tested as both attack identification and control selection scenarios. |
| 4 | Security Awareness Training | Personnel Security | HIGH | Awareness vs. training vs. education distinction, program effectiveness evaluation, and social engineering awareness integration are tested in scenario format. |
| 5 | Supply Chain Risk Management | Supply Chain | HIGH | Product tampering, counterfeits, hardware implants, silicon root of trust, PUF, SBOM, and SLR/SLA reporting are modern exam fixtures given supply chain compromise headlines. |
| 6 | ITAR/Export Controls | Legal/Regulatory | HIGH | Wassenaar Arrangement, ITAR, and EAR (Export Administration Regulations) distinctions and which technologies trigger each regime are tested as identification questions. |
| 7 | Threat Modeling (STRIDE/PASTA/DREAD) | Risk Management | HIGH | STRIDE category identification from attack scenario descriptions is a top practice pattern. Exam regularly presents a scenario and asks which STRIDE category it represents. |
| 8 | Security Document Hierarchy | Governance | HIGH | Policy vs. standard vs. procedure vs. baseline vs. guideline -- mandatory vs. advisory distinction. Mandatory/non-mandatory confusion is a top distractor. |
| 9 | Transborder Data Flow | Legal/Regulatory | MEDIUM | Data residency, data localization laws, and EU-US data transfer mechanisms (SCCs, adequacy decisions) are tested in regulatory compliance scenarios. |
| 10 | Intellectual Property Laws | Legal/Regulatory | MEDIUM | Trade secrets vs. patents vs. copyrights vs. trademarks -- duration, disclosure requirements, and registration are tested as scenario classification questions. |

### Domain 2: Asset Security (Exam Weight: 10%)

| # | Topic | Subdomain | Priority | Rationale |
|---|-------|-----------|----------|-----------|
| 1 | Pseudonymization vs. Tokenization vs. Anonymization | Data De-identification | HIGH | Three distinct techniques with different reversibility and GDPR implications. Key distinction: only anonymized data is fully exempt from GDPR; pseudonymized data is not. |
| 2 | DLP Types and Mechanics | Data Protection | HIGH | Network DLP, Endpoint DLP, Cloud DLP -- pattern matching, keyword scanning, content discovery. Critical limitation: DLP cannot scan encrypted traffic. Technology selection questions are common. |
| 3 | CASB (Cloud Access Security Broker) | Cloud Data Protection | HIGH | Cloud policy enforcement, shadow IT detection, and bridging on-premises security policies to cloud services. "Cloud policy enforcement tool" = CASB on the exam. |
| 4 | DRM/IRM | Rights Management | HIGH | Digital Rights Management techniques (persistent authentication, licensing, expiration, audit trails), IRM as a subset, DMCA as legal foundation. |
| 5 | Scoping and Tailoring | Baseline Management | HIGH | Scoping selects applicable controls from a baseline; tailoring modifies selected controls for organizational context. These definitions are frequently swapped in distractors. |
| 6 | Data Remanence | Sanitization | MEDIUM | Slack space, residual magnetic flux, SSD wear-leveling, and why standard deletion is insufficient. SSD-specific destruction challenges (overwriting does not reliably work on SSDs). |
| 7 | Data States -- In-Use Controls | Data Protection | MEDIUM | Data in use (RAM, CPU registers) has different protection requirements. Homomorphic encryption as an emerging solution for in-use data is tested conceptually. |
| 8 | E-discovery and Litigation Holds | Legal/Regulatory | MEDIUM | Legal obligation to preserve data when litigation is reasonably anticipated. Conflict with normal retention/destruction schedules is the exam focus. |

### Domain 3: Security Architecture and Engineering (Exam Weight: 13%)

| # | Topic | Subdomain | Priority | Rationale |
|---|-------|-----------|----------|-----------|
| 1 | Symmetric Cryptography (DES/3DES/AES/RC4) | Cryptography | HIGH | Algorithm selection -- key lengths, block sizes, strengths, and when each is appropriate. AES replacing 3DES is a frequently tested transition. |
| 2 | Asymmetric Cryptography (RSA/ECC/DSA) | Cryptography | HIGH | Key length vs. security strength, RSA for encryption AND signatures, ECC efficiency advantage. |
| 3 | PKI and Digital Certificates | Cryptography | HIGH | X.509 standard, CA hierarchy (root/intermediate/end-entity), certificate lifecycle, CRL vs. OCSP, chain of trust, certificate pinning, cross-certification. Major exam topic with no prior story coverage. |
| 4 | Digital Signatures | Cryptography | HIGH | Mechanism: hash then encrypt with private key. What they provide: integrity + authentication + nonrepudiation (NOT confidentiality). DSA, RSA-sign, ECDSA. |
| 5 | Cryptanalytic Attacks | Cryptography | HIGH | Brute force, birthday attack, meet-in-the-middle, known-plaintext, chosen-plaintext, side-channel, rainbow tables, frequency analysis. Understanding how crypto is broken is tested. |
| 6 | Stream vs. Block Ciphers | Cryptography | HIGH | Stream ciphers (RC4, ChaCha20): one bit/byte at a time, fast, keystream-based. Block ciphers (AES, DES): fixed-size blocks. Block cipher modes of operation (ECB insecure, CBC, GCM). |
| 7 | Key Management Lifecycle | Cryptography | HIGH | Generation, distribution, storage, rotation, revocation, destruction, escrow, M-of-N control. Key management is where crypto fails in practice -- heavily tested. |
| 8 | Hybrid Cryptography | Cryptography | HIGH | How TLS and PGP combine asymmetric (for key exchange) and symmetric (for bulk data). Efficiency rationale: asymmetric is computationally expensive for large data. |
| 9 | Diffie-Hellman Key Exchange | Cryptography | HIGH | Enables two parties to establish a shared secret over an insecure channel without transmitting the key. Basis for forward secrecy (DHE/ECDHE). |
| 10 | Bell-LaPadula Model | Security Models | HIGH | Confidentiality model: no read up (Simple Security), no write down (Star Property). MAC environment. Government classification context. |
| 11 | Biba Model | Security Models | HIGH | Integrity model: no read down, no write up. Inverse of Bell-LaPadula. Military vs. commercial applications. |
| 12 | Clark-Wilson Model | Security Models | HIGH | Commercial integrity model. CDIs, UDIs, TPs, IVPs. Separation of duties baked into model. |
| 13 | Information Flow / Covert Channels | Security Models | MEDIUM | Storage covert channels (shared object state), timing covert channels (timing signals through shared resource). Detection and prevention strategies. |
| 14 | Trusted Computing Base / Security Kernel | Architecture | MEDIUM | TCB: totality of protection mechanisms. Security kernel: hardware/software/firmware that enforces reference monitor concept. Reference monitor: mediates all access to objects by subjects. |
| 15 | Ring Protection Model | Architecture | MEDIUM | Rings 0-3 (kernel/OS/drivers/user). Privilege levels, system calls, context switching. Lower ring = more trusted. |
| 16 | Cloud Security | Cloud Architecture | HIGH | IaaS/PaaS/SaaS service models, public/private/hybrid/community deployment models, shared responsibility matrix, multi-tenancy isolation, accountability vs. responsibility. |
| 17 | Virtualization and Hypervisors | Architecture | HIGH | Type 1 (bare metal, VMware ESXi, Hyper-V) vs. Type 2 (hosted, VirtualBox). VM escape, VM sprawl, hypervisor hardening. Container security (Docker, Kubernetes namespace isolation). |
| 18 | ICS/SCADA/IoT Security | OT Security | MEDIUM | PLCs, RTUs, HMIs. Air-gapping, unique OT challenges (uptime over security), Stuxnet case study. IoT security: firmware security, default credentials, patch difficulty. |
| 19 | Mobile Device Security | Mobile | MEDIUM | MDM, MAM, BYOD vs. COPE vs. CYOD, remote wipe, containerization, jailbreaking/rooting risks. |
| 20 | Physical Security -- Fire | Physical | HIGH | Fire classes (A/B/C/D/K), detection types (VESDA/ionization/photoelectric), suppression systems (wet pipe/dry pipe/pre-action/deluge for water; FM-200/INERGEN/CO2 for gas, Halon ban). |
| 21 | Physical Security -- Power | Physical | MEDIUM | UPS (uninterruptible power supply), generators, dual power feeds, HVAC (temperature 70F/humidity 40-60%), TEMPEST emanation security. |
| 22 | SQL Injection | Application Vulnerabilities | MEDIUM | How parameterized queries (prepared statements) prevent SQLi. Blind SQLi, error-based SQLi, UNION-based SQLi variants. |
| 23 | XSS and CSRF | Application Vulnerabilities | MEDIUM | XSS: injecting scripts into pages viewed by others (reflected/stored/DOM). CSRF: forcing authenticated users to execute unintended requests. XSS exploits user trust in site; CSRF exploits site trust in user. |
| 24 | Malware Types | Malware | MEDIUM | Virus (requires host file), worm (self-propagates), Trojan (deceptive payload), ransomware, rootkit (hides presence), logic bomb (trigger-based), polymorphic (changes signature), botnet. |
| 25 | Enterprise Architecture Frameworks | Architecture | LOW | Zachman (descriptive, two-dimensional framework), TOGAF (prescriptive, ADM phases), SABSA (security-focused EA). Conceptual-level testing only. |
| 26 | Vulnerabilities in Systems | Architecture | MEDIUM | Memory vulnerabilities (buffer overflow, heap spray), race conditions (TOCTOU), initialization flaws, input validation failures as architectural root causes. |

### Domain 4: Communication and Network Security (Exam Weight: 13%)

| # | Topic | Subdomain | Priority | Rationale |
|---|-------|-----------|----------|-----------|
| 1 | OSI Model Layers | Network Fundamentals | HIGH | Layer identification for protocols, attacks, and devices is the single most tested D4 concept. Practiced as "at which OSI layer does X operate?" |
| 2 | Layer 1 -- Physical | Network Fundamentals | MEDIUM | Transmission media (UTP/STP/coax/fiber), attenuation, hubs (repeaters), 5-4-3 rule. Physical attacks (wiretapping, emanation). |
| 3 | Layer 2 -- Data Link | Network Fundamentals | MEDIUM | MAC addressing, switches (CAM tables), VLANs, STP (Spanning Tree Protocol), PPP, L2 attacks (MAC flooding, ARP poisoning). |
| 4 | Layer 3 -- Network | Network Fundamentals | HIGH | IP addressing (IPv4 classful/CIDR, IPv6), routers, routing protocols, NAT/PAT, ICMP. L3 attacks (IP spoofing, ICMP flooding). |
| 5 | Layer 4 -- TCP/UDP | Transport Protocols | HIGH | TCP (connection-oriented, three-way handshake SYN/SYN-ACK/ACK, FIN teardown, RST), UDP (connectionless, fast, unreliable). Port numbers. L4 attacks (SYN flood, session hijacking). |
| 6 | Layers 5-7 (Session/Presentation/Application) | Network Fundamentals | MEDIUM | Session layer (SQL, RPC, NetBIOS), Presentation (encryption, compression, format conversion), Application (HTTP/S, FTP, DNS, SMTP, SNMP). |
| 7 | Firewall Technologies | Network Security Controls | HIGH | Packet filtering (stateless, L3/L4 headers only), stateful inspection (tracks connection state), application-layer (DPI, proxy-based), NGFW (combines stateful + application + IPS + threat intelligence). |
| 8 | IDS/IPS Detection Methods | Network Security Controls | HIGH | Signature-based (known patterns, low false positives, misses zero-days), anomaly-based (behavior baseline, catches zero-days, higher false positives), heuristic/stateful protocol analysis. NIDS vs. HIDS vs. NIPS. |
| 9 | Wireless Security | Wireless | HIGH | WEP (broken), WPA/WPA2 (TKIP/CCMP-AES), WPA3 (SAE, forward secrecy). 802.11 standards. Wireless attacks: evil twin, deauth, WPS brute force. |
| 10 | SSL/TLS Protocols | Secure Protocols | HIGH | TLS handshake (cipher suite negotiation, certificate exchange, key establishment), TLS 1.2 vs. 1.3 differences, deprecated SSL/TLS 1.0/1.1. Certificate pinning. |
| 11 | IPSec | VPN Protocols | HIGH | AH (authentication, integrity, no encryption), ESP (authentication + encryption), transport mode (host-to-host, protects payload), tunnel mode (gateway-to-gateway, protects entire IP packet). IKE Phase 1 (ISAKMP SA) and Phase 2 (IPsec SA). |
| 12 | Network Attacks | Attack Identification | HIGH | DoS/DDoS, SYN flood (half-open connections), smurf (ICMP broadcast amplification), Fraggle (UDP version of Smurf), MITM, ARP poisoning, VLAN hopping (switch spoofing/double tagging), DNS poisoning, SSL stripping. |
| 13 | VLAN and SDN | Network Architecture | MEDIUM | VLANs for segmentation (Layer 2), inter-VLAN routing, SDN three planes (application/control/data), separation of control and data planes, OpenFlow. |
| 14 | VPN and Tunneling | Remote Access | HIGH | Site-to-site vs. remote access VPN. Split tunneling vs. full tunneling (split = less secure, more efficient). SSL VPN vs. IPsec VPN. GRE, L2TP. |
| 15 | WAN Technologies | WAN | MEDIUM | MPLS, Frame Relay (legacy), leased lines, SD-WAN (intelligent path selection). Circuit switching vs. packet switching. PVC vs. SVC. |
| 16 | VoIP / Convergence | Converged Networks | MEDIUM | VoIP security: SRTP (encrypted RTP), SIP vulnerabilities (SIPS for security), dedicated voice VLANs, QoS requirements, vishing attacks. iSCSI and FCoE as converged protocols. |

### Domain 5: Identity and Access Management (Exam Weight: 13%)

All 9 existing topics remain covered. No new transcript gaps specific to D5 beyond what was already captured in the gap analysis. The following were in transcripts and confirm existing coverage:
- Authentication factors (knowledge/ownership/characteristic/location)
- SSO and Kerberos (ticket-granting mechanism)
- SAML and federated identity management
- RBAC and ABAC
- IDaaS (Identity as a Service) -- slight expansion needed
- Session management and identity proofing
- Access control services overview

### Domain 6: Security Assessment and Testing (Exam Weight: 12%)

Transcript content largely aligns with existing coverage (VA/PT, log analysis, metrics). Gaps identified:
- Vulnerability testing techniques (banner grabbing, fingerprinting) -- LOW priority
- Software testing stages (unit/integration/system/acceptance) -- MEDIUM priority
- Operational regression testing -- MEDIUM priority

### Domain 7: Security Operations (Exam Weight: 13%)

Transcript content covers: change management, configuration management (asset inventory). Gaps:
- Asset inventory as a foundational operations concept -- MEDIUM priority
- Configuration management specifics (baselining, golden image, drift detection) -- MEDIUM priority

### Domain 8: Software Development Security (Exam Weight: 11%)

Transcript content covers: software testing techniques, acquiring software, input validation, cross-site scripting, SQL injection, cross-site request forgery, avoiding patterns (secure coding). Gaps:
- Software testing stages (unit/integration/system/acceptance) mapped to D6 but relevant here too -- MEDIUM
- Avoiding coding patterns (defensive programming) -- needs reinforcement

---

## Section 2: ISC2 Exam Outline Blind Spots

These are topics from the official ISC2 CISSP Candidate Information Bulletin and CBK that are not covered in any existing story mode content AND were not captured in the transcript topic inventory. They represent pure blind spots that must be authored from the CBK directly.

### Domain 3 -- Architecture Blind Spots

| Topic | ISC2 CBK Reference | Exam Frequency | Explanation |
|-------|--------------------|----------------|-------------|
| Secure CPU architecture -- processor security modes | D3.2 -- Security Architecture | LOW-MEDIUM | Protected mode vs. real mode, privilege levels at the hardware level, execution modes (user vs. supervisor). Tested conceptually: "which mode allows direct hardware access?" |
| Confinement principles | D3.1 -- Design Requirements | LOW | The concept of sandbox confinement, isolation as a security principle. Tested in context of virtualiz ation and application sandboxing. |
| Security modes of operation | D3.4 -- System Security | LOW | Dedicated (all users have clearance + need-to-know for all data), System High (all users have clearance but not necessarily NTK), Compartmented, Multilevel. Tested as "which mode is most restrictive/permissive?" |
| Reference monitor concept | D3.1 -- Design Requirements | MEDIUM | Mediates all access between subjects and objects, must be tamper-proof, always invoked, and small enough to verify. Foundation of security kernel concept. |

### Domain 4 -- Network Blind Spots

| Topic | ISC2 CBK Reference | Exam Frequency | Explanation |
|-------|--------------------|----------------|-------------|
| Content Distribution Networks (CDNs) | D4.4 -- Network Components | LOW | Edge caching, push vs. pull models, DDoS absorption at edge, CDN security implications (shared infrastructure, SSL termination at CDN). |
| VoIP advanced security (SRTP, SIPS) | D4.3 -- Secure Communication | MEDIUM | SRTP for media encryption, SIPS for signaling encryption, toll fraud, vishing, PBX security, caller ID spoofing. Tested in secure protocol selection scenarios. |
| Multilayer protocol security implications | D4.1 -- Network Protocols | LOW | Tunneling as a covert channel, protocol encapsulation enabling filter evasion, SCADA over TCP/IP risks. |

### Domain 7 -- Operations Blind Spots

| Topic | ISC2 CBK Reference | Exam Frequency | Explanation |
|-------|--------------------|----------------|-------------|
| Incident response steps -- PICERL model | D7.4 -- Incident Response | HIGH | Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned. NIST SP 800-61 Rev 2 framework. Sequencing questions ("what comes FIRST/NEXT in IR?") are a top D7 pattern. |
| Forensics chain of custody | D7.5 -- Digital Forensics | HIGH | Documentation of who handled evidence, when, and what was done. Breaks in chain make evidence inadmissible. Order of volatility (CPU registers > cache > RAM > swap > disk > remote). |
| E-discovery requirements | D7.5 -- Digital Forensics | MEDIUM | Legal hold obligations, ESI (electronically stored information) preservation, litigation response procedures. |

### Domain 8 -- Software Dev Blind Spots

| Topic | ISC2 CBK Reference | Exam Frequency | Explanation |
|-------|--------------------|----------------|-------------|
| Software testing stages (unit / integration / system / acceptance) | D8.5 -- Software Testing | MEDIUM | The hierarchical progression from unit tests (smallest isolated component) through integration (component interaction), system (full system against requirements), acceptance (user validation). Each stage has a defined scope and who performs it. |
| Waterfall SDLC stages (all 7) | D8.1 -- Development Methodologies | HIGH | Conceptual/requirements, functional requirements/analysis, system design, development, integration/testing, implementation/deployment, maintenance. Linear, documentation-heavy, suited for well-defined requirements. |

---

## Section 3: Depth Gaps

These are topics with some existing coverage that need materially deeper treatment based on exam question patterns. The current coverage is accurate but thin -- one scene when three or more question patterns exist.

### D1: Security Document Hierarchy

**Current depth:** Brief mention within the governance scene. Options at policy level described.
**Gap:** No discrimination training for policy vs. standard vs. procedure vs. baseline vs. guideline. The exam presents detailed scenarios and asks which document type the scenario describes. The mandatory vs. non-mandatory distinction (guidelines and procedures are advisory; policies and standards are mandatory at most organizations) is a top distractor.
**Needed:** Dedicated scene with comparison table, examples for each level, and at least 3 practice questions covering the mandatory/advisory distinction.

### D1: Quantitative Risk Analysis

**Current depth:** SLE/ARO/ALE formulas with one calculation example.
**Gap:** Safeguard value formula (ALE before - ALE after - annual safeguard cost = value of safeguard). Cost-benefit framing for presenting to executives. Also missing: AV (Asset Value) as input to SLE = AV x EF.
**Needed:** Additional calculation example covering safeguard value, and explanation of when quantitative analysis is preferred vs. qualitative.

### D3: Symmetric Cryptography Algorithms

**Current depth:** Concept of symmetric (shared key) with AES mentioned.
**Gap:** No algorithm comparison: DES (56-bit, broken), 3DES (168-bit effective 112-bit, deprecated), AES (128/192/256-bit, current standard), RC4 (stream cipher, WEP, broken in TLS context). Exam asks: "Which algorithm provides the STRONGEST encryption for data at rest?"
**Needed:** Algorithm comparison table, key length to security mapping, deprecation status.

### D3: Hash Functions

**Current depth:** Hashing as fingerprint (integrity verification).
**Gap:** No specific algorithm coverage: MD5 (128-bit, broken), SHA-1 (160-bit, broken), SHA-256/SHA-3 (current), HMAC (keyed-hash for authentication). Exam asks: "Which hashing algorithm should you use for a new implementation?"
**Needed:** Algorithm comparison, current vs. deprecated status, HMAC as authenticated hashing.

### D4: Firewall Architectures

**Current depth:** Firewall types briefly covered.
**Gap:** Firewall deployment architectures: screened host, screened subnet (DMZ with two firewalls), dual-homed host. "Which architecture provides the most security for a web server?" is a top practice pattern.
**Needed:** Architecture diagram descriptions, pros/cons, selection guidance.

### D4: IDS/IPS -- False Positives vs. False Negatives

**Current depth:** Mentioned in the context of detection.
**Gap:** No discrimination training: false positive (alert on benign traffic), false negative (miss real attack). Which is more dangerous? False negatives (real attacks missed) -- more dangerous than false positives (false alarms creating noise). Signature-based IDS has more false negatives for zero-days; anomaly-based has more false positives.
**Needed:** Dedicated comparison with "which is MORE dangerous?" framing.

### D5: Kerberos Authentication Flow

**Current depth:** Kerberos mentioned as SSO mechanism.
**Gap:** No ticket-granting detail: AS exchange (TGT), TGS exchange (service ticket), SS exchange (service session). Attacks: Kerberoasting (requesting service tickets for offline cracking), Golden Ticket (KRBTGT hash), Silver Ticket (service account hash), Pass-the-Hash, Pass-the-Ticket.
**Needed:** Step-by-step Kerberos flow and attack classification scene.

### D7: Backup Strategies

**Current depth:** Not covered at all -- listed as HIGH priority gap with zero existing scenes.
**Gap:** This is one of the most tested D7 topics with zero story coverage. Archive bit behavior (incremental clears it, differential does not), restore speed comparison (full+differential faster than full+incremental chain), 3-2-1 rule (3 copies, 2 media types, 1 offsite), tape rotation schemes (Grandfather-Father-Son, Tower of Hanoi).
**Needed:** Full teaching scene with comparison table, plus minimum 3 practice questions.

---

## Section 4: Priority Matrix

Top 20 gap topics ranked by combined score of exam weight (domain %) x gap severity (1=minimal existing coverage, 5=zero existing coverage).

| Rank | Topic | Domain | Exam Weight | Gap Severity | Combined Score | Action Priority |
|------|-------|--------|------------|-------------|----------------|----------------|
| 1 | PKI and Digital Certificates | D3 | 13% | 5 (zero coverage) | 65 | IMMEDIATE |
| 2 | Backup Strategies (Incremental vs. Differential) | D7 | 13% | 5 (zero coverage) | 65 | IMMEDIATE |
| 3 | RAID Levels (0/1/5/6/10) | D7 | 13% | 5 (zero coverage) | 65 | IMMEDIATE |
| 4 | Recovery Site Types (Cold/Warm/Hot) | D7 | 13% | 5 (zero coverage) | 65 | IMMEDIATE |
| 5 | Security Controls Classification | D1 | 15% | 4 (partial only) | 60 | IMMEDIATE |
| 6 | Digital Signatures | D3 | 13% | 4 (partial) | 52 | HIGH |
| 7 | Key Management Lifecycle | D3 | 13% | 4 (partial) | 52 | HIGH |
| 8 | Cloud Computing Security | D3 | 13% | 4 (partial) | 52 | HIGH |
| 9 | DRP Testing Types | D7 | 13% | 4 (partial) | 52 | HIGH |
| 10 | Evidence Types and Rules | D7 | 13% | 4 (partial) | 52 | HIGH |
| 11 | Fire Detection and Suppression | D3 | 13% | 4 (partial) | 52 | HIGH |
| 12 | Virtualization and Hypervisors | D3 | 13% | 4 (partial) | 52 | HIGH |
| 13 | Cryptanalytic Attacks | D3 | 13% | 4 (partial) | 52 | HIGH |
| 14 | Network Attacks (Full Taxonomy) | D4 | 13% | 3 (limited) | 39 | HIGH |
| 15 | IDS/IPS Detection Methods | D4 | 13% | 3 (limited) | 39 | HIGH |
| 16 | IPSec (AH vs. ESP, Transport vs. Tunnel) | D4 | 13% | 3 (limited) | 39 | HIGH |
| 17 | Supply Chain Risk Management | D1 | 15% | 3 (limited) | 45 | HIGH |
| 18 | Social Engineering Attacks | D1 | 15% | 3 (limited) | 45 | HIGH |
| 19 | Security Document Hierarchy | D1 | 15% | 3 (limited) | 45 | HIGH |
| 20 | Pseudonymization / Tokenization / Anonymization | D2 | 10% | 5 (zero coverage) | 50 | HIGH |

**Scoring method:** Exam Weight x Gap Severity. Gap Severity scale: 1 = well covered with multiple scenes, 2 = single scene, 3 = mentioned but not taught, 4 = concept referenced without dedicated coverage, 5 = zero story coverage.

---

## Cross-Reference: Transcript Coverage vs. Story Mode

The following topics appear in transcripts AND have existing story coverage but would benefit from alignment review to ensure the question bank reinforces the same teaching framing:

| Topic | Transcript File(s) | Story Mode Status | Alignment Risk |
|-------|--------------------|-------------------|----------------|
| Symmetric Cryptography | whisper-195 | Existing Act 1 scene | Transcript may use different algorithm framing |
| OSI Model | whisper-247 | Existing Act 1 scene | Strong alignment expected |
| IDS/IPS | whisper-197, whisper-219, whisper-233, whisper-293 | Not in story yet | Four transcripts = high priority for content synthesis |
| Firewall Technologies | whisper-207, whisper-285 | Existing Act 1 scene | Two transcripts -- may have architecture depth gap |
| Authentication Factors | whisper-203, whisper-225, whisper-262 | Existing D5 scene | Three transcripts -- ensure Kerberos attack coverage |
| Cryptanalytic Attacks | whisper-208 | Not in story yet | Needs dedicated scene |
| Digital Signatures | whisper-305 | Not in story yet | Critical gap -- HIGH priority |
| Digital Certificates | whisper-306 | Not in story yet | Critical gap -- HIGH priority |
| SSL/TLS | whisper-248 | Partial network coverage | Needs handshake detail |
| IPSec | whisper-286 | Existing VPN scene | Verify AH vs. ESP detail |
| SQL Injection | whisper-288 | Mentioned in OWASP | Needs own scene for D3 context |
| XSS | whisper-250 | OWASP coverage | Ensure XSS vs. CSRF discrimination |
| CSRF | whisper-271 | OWASP coverage | Verify XSS vs. CSRF comparison |
| Cloud Computing | whisper-322 | Not in story yet | HIGH priority gap |
| ICS/SCADA/IoT | whisper-296 | Not in story yet | MEDIUM priority gap |

---

*This gap report was authored from first principles using the ISC2 CBK, NIST publications, and the gap-analysis.md and complete-content-map.md source documents. No transcript content was paraphrased. All priority ratings reflect ISC2 exam weighting data and published practice question frequency analyses.*
