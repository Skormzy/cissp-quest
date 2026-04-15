# CISSP Quest — Question Generation Targets

> **Generated:** 2026-03-09
> **Purpose:** Define question counts, distributions, and specifications for all quiz components

---

## 1. Field Test (Per Domain)

**Purpose:** Mid-domain checkpoint after Acts 1-2. Tests foundational and intermediate understanding.
**Minimum questions per domain:** 40
**Question pool (for randomization):** 60+ per domain

### Question Distribution Per Domain

| Domain | Easy (40%) | Medium (40%) | Hard (20%) | Total Pool |
|--------|-----------|-------------|-----------|------------|
| D1: Security and Risk Management | 24 | 24 | 12 | 60 |
| D2: Asset Security | 24 | 24 | 12 | 60 |
| D3: Security Architecture and Engineering | 24 | 24 | 12 | 60 |
| D4: Communication and Network Security | 24 | 24 | 12 | 60 |
| D5: Identity and Access Management | 24 | 24 | 12 | 60 |
| D6: Security Assessment and Testing | 24 | 24 | 12 | 60 |
| D7: Security Operations | 24 | 24 | 12 | 60 |
| D8: Software Development Security | 24 | 24 | 12 | 60 |
| **TOTALS** | **192** | **192** | **96** | **480** |

### Cognitive Level Distribution

| Level | Percentage | Description |
|-------|-----------|-------------|
| Knowledge/Recall | 20% | Define, identify, list |
| Comprehension | 30% | Explain, compare, distinguish |
| Application | 35% | Apply, calculate, determine |
| Analysis | 15% | Analyze scenarios, evaluate options |

### Question Type Distribution

| Type | Percentage | Description |
|------|-----------|-------------|
| Scenario-based | 40% | "An organization is..." |
| Definition discrimination | 25% | "Which BEST describes..." |
| Process ordering | 15% | "What is the FIRST/NEXT step?" |
| Calculation | 10% | SLE, ALE, RAID capacity |
| Best practice selection | 10% | "Which control BEST addresses..." |

### Topic Coverage Rules

- Every Act 1 topic must have at least 2 questions
- Every Act 2 topic must have at least 1 question
- HIGH priority gap topics must have at least 3 questions
- No more than 5 questions per single topic
- Each question must have exactly 4 answer options
- Distractors must be plausible (from same domain/concept family)

### Per-Domain Topic Targets

#### D1: Security and Risk Management

**Currently covered topics:** CIA Triad, Risk Assessment, NIST RMF, Quantitative Risk Analysis (SLE/ARO/ALE), Qualitative Risk Analysis, Security Governance hierarchy, Risk Treatment options, BCP vs DRP, ISC2 Code of Ethics, Compliance vs Security, Due Diligence/Due Care.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| CIA Triad & DAD Triad | 4 | 2E, 1M, 1H | Covered + Gap #14 |
| Risk Analysis (Quantitative: SLE/ARO/ALE) | 5 | 1E, 2M, 2H | Covered |
| Risk Analysis (Qualitative Methods) | 3 | 1E, 1M, 1H | Covered |
| Risk Treatment Options (Accept/Mitigate/Transfer/Avoid) | 3 | 1E, 1M, 1H | Covered |
| Security Governance & Document Hierarchy | 4 | 2E, 1M, 1H | Covered + Gap #2 (HIGH) |
| NIST RMF Steps | 3 | 1E, 1M, 1H | Covered |
| BCP vs DRP Fundamentals | 3 | 1E, 1M, 1H | Covered |
| ISC2 Code of Ethics & Compliance | 3 | 1E, 1M, 1H | Covered |
| Due Diligence vs Due Care | 2 | 1E, 1M | Covered |
| Accountability vs Responsibility | 3 | 1E, 1M, 1H | Gap #3 (HIGH) |
| Intellectual Property Laws (Patent/Copyright/TM/Trade Secret) | 4 | 1E, 2M, 1H | Gap #1 (HIGH) |
| Control Types & Classification (7 types x 3 categories) | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Threat Modeling (STRIDE, PASTA, DREAD) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| Personnel Security Controls (Job Rotation, Mandatory Vacations, SoD) | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Privacy Laws and Regulations (GDPR, HIPAA, CCPA) | 3 | 1E, 1M, 1H | Gap #7 (MEDIUM) |
| Security Awareness Training | 2 | 1E, 1M | Gap #12 (MEDIUM) |
| Organizational Roles (Senior Mgr, Custodian, Owner, Auditor) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Social Engineering Attacks | 2 | 1E, 1M | Gap #27 (LOW) |
| **TOTAL** | **58** | | |

#### D2: Asset Security

**Currently covered topics:** Data Classification levels (government + business), Data Ownership Roles, Data States, Data Lifecycle, Retention Policies, Destruction Methods, Privacy Principles, Data Protection Controls per state.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Data Classification (Government & Business Levels) | 3 | 1E, 1M, 1H | Covered |
| Data Ownership Roles (Owner, Custodian, Steward, User) | 3 | 1E, 1M, 1H | Covered |
| Data States (At Rest, In Transit, In Use) | 3 | 1E, 1M, 1H | Covered |
| Data Lifecycle (Create through Destroy) | 3 | 1E, 1M, 1H | Covered |
| Retention Policies & Destruction Methods | 3 | 1E, 1M, 1H | Covered |
| Privacy Principles | 2 | 1E, 1M | Covered |
| Pseudonymization, Tokenization, & Anonymization | 4 | 1E, 2M, 1H | Gap #1 (HIGH) |
| DLP Types & Mechanics (Network/Endpoint/Cloud) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| Scoping and Tailoring | 3 | 1E, 1M, 1H | Gap #3 (HIGH) |
| CASB (Cloud Access Security Broker) | 3 | 1E, 1M, 1H | Gap #4 (HIGH) |
| DRM and IRM | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Labeling vs Marking Distinction | 3 | 1E, 1M, 1H | Gap #6 (HIGH) |
| Classification vs Categorization | 2 | 1E, 1M | Gap #7 (MEDIUM) |
| Security Baselines (NIST SP 800-53B) | 2 | 1E, 1M | Gap #8 (MEDIUM) |
| Information Obfuscation Methods (Masking, Pruning, Fabricating) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| Data Remanence (Slack Space, SSD Wear-Leveling) | 3 | 1E, 1M, 1H | Gap #12 (MEDIUM) |
| Data Collection Limitation | 2 | 1E, 1M | Gap #16 (LOW) |
| Data Protection Controls per State | 2 | 1E, 1M | Covered |
| **TOTAL** | **48** | | |

> **Note:** D2 pool slightly under 60. Add 12 additional questions spread across HIGH priority clusters (Pseudonymization +2, DLP +2, Scoping/Tailoring +1, CASB +1, DRM +1, Labeling +1, Obfuscation +1, Remanence +1, Classification Levels +1, Ownership Roles +1) to reach 60.

#### D3: Security Architecture and Engineering

**Currently covered topics:** Bell-LaPadula, Biba, Clark-Wilson, Symmetric/Asymmetric crypto, Hashing, Secure Design Principles, Common Criteria/EAL, Covert Channels.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Security Models (Bell-LaPadula, Biba, Clark-Wilson) | 4 | 1E, 2M, 1H | Covered |
| Symmetric Cryptography (AES, DES, 3DES, Blowfish) | 3 | 1E, 1M, 1H | Covered |
| Asymmetric Cryptography (RSA, ECC, DH) | 3 | 1E, 1M, 1H | Covered |
| Hashing Algorithms (SHA, MD5, HMAC) | 3 | 1E, 1M, 1H | Covered |
| Secure Design Principles (Defense in Depth, Least Privilege, etc.) | 3 | 1E, 1M, 1H | Covered |
| Common Criteria & EAL Levels | 2 | 1E, 1M | Covered |
| PKI and Digital Certificates (X.509, CA, CRL/OCSP) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| Digital Signatures (Integrity, Auth, Nonrepudiation) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| Key Management Lifecycle (Generation through Destruction) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| Cloud Computing Security (IaaS/PaaS/SaaS, Shared Responsibility) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| Cryptanalytic Attacks (Birthday, MITM, Known Plaintext) | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Fire Prevention, Detection, and Suppression | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Virtualization & Hypervisor Security (Type 1/2, VM Escape) | 4 | 1E, 2M, 1H | Gap #7 (HIGH) |
| Physical Access Controls (Fences, Mantraps, CCTV) | 3 | 1E, 1M, 1H | Gap #11 (MEDIUM) |
| TPM and HSM (Hardware Roots of Trust) | 2 | 1E, 1M | Gap #14 (MEDIUM) |
| Power & Environmental Controls (UPS, HVAC, TEMPEST) | 2 | 1E, 1M | Gap #12 (MEDIUM) |
| Hybrid Cryptography (TLS, PGP) | 2 | 1E, 1M | Gap #26 (LOW) |
| Covert Channels (Storage vs Timing) | 2 | 1E, 1M | Covered |
| **TOTAL** | **57** | | |

> **Note:** Add 3 additional questions to PKI (+1), Cloud Security (+1), and Fire Suppression (+1) to reach 60.

#### D4: Communication and Network Security

**Currently covered topics:** OSI Model (7 layers), Network Attacks (MITM, DoS, VLAN Hopping, ARP Spoofing, SSL Stripping), Firewall Types, VPN/IPsec (Transport vs Tunnel, AH vs ESP), Wireless Security (WPA3).

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| OSI Model (7 Layers, Protocols, Devices per Layer) | 4 | 2E, 1M, 1H | Covered |
| Network Attacks (MITM, DoS, VLAN Hopping, ARP Spoofing) | 3 | 1E, 1M, 1H | Covered |
| Firewall Types (Packet Filter, Stateful, Proxy, NGFW, WAF) | 3 | 1E, 1M, 1H | Covered |
| VPN & IPsec (Transport/Tunnel, AH/ESP) | 3 | 1E, 1M, 1H | Covered |
| Wireless Security (WPA2/WPA3, WEP weaknesses) | 2 | 1E, 1M | Covered |
| TCP/IP Model (4 Layers, Mapping to OSI) | 3 | 1E, 1M, 1H | Gap #1 (HIGH) |
| TCP Three-Way Handshake & Flags (SYN/ACK/FIN/RST) | 3 | 1E, 1M, 1H | Gap #2 (HIGH) |
| IP Addressing (IPv4/IPv6, CIDR, Subnetting, NAT/PAT) | 5 | 1E, 2M, 2H | Gap #3 (HIGH) |
| Secure Protocols (SSH, TLS, HTTPS, SFTP, DNSSEC) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| Email Security (S/MIME, PGP, SPF, DKIM, DMARC) | 4 | 1E, 2M, 1H | Gap #5 (HIGH) |
| NAC and 802.1X (Port-based Auth, RADIUS Integration) | 3 | 1E, 1M, 1H | Gap #6 (HIGH) |
| Network Segmentation (VRF, VDOMs, VPC, Air-Gap) | 4 | 1E, 2M, 1H | Gap #7 (HIGH) |
| Network Monitoring & QoS (SNMP, NetFlow, Syslog) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Switching Technologies (CAM Table, STP, Cut-Through) | 2 | 1E, 1M | Gap #14 (MEDIUM) |
| Traffic Flows (North-South vs East-West) | 2 | 1E, 1M | Gap #15 (MEDIUM) |
| DNS Resolution (Recursive vs Iterative, Cache Poisoning) | 2 | 1E, 1M | Gap #21 (LOW) |
| RADIUS vs TACACS+ | 3 | 1E, 1M, 1H | Gap #28 (LOW, cross-ref D5) |
| Cabling & Physical Media (Cat5e/6/6a, Fiber) | 2 | 1E, 1M | Gap #18 (LOW) |
| **TOTAL** | **55** | | |

> **Note:** Add 5 additional questions to IP Addressing (+1), Email Security (+1), Network Segmentation (+1), Secure Protocols (+1), and OSI Model (+1) to reach 60.

#### D5: Identity and Access Management

**Currently covered topics:** Authentication Factors, MFA, SSO/Federated Identity (Kerberos, SAML, OAuth/OIDC), Access Control Models (DAC/MAC/RBAC/ABAC), Least Privilege, Separation of Duties, Privilege Escalation, Identity Lifecycle, Credential Stuffing.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Authentication Factors (Something You Know/Have/Are) | 3 | 1E, 1M, 1H | Covered |
| MFA (Multi-Factor Authentication) | 2 | 1E, 1M | Covered |
| SSO & Federated Identity (Kerberos, SAML, OAuth/OIDC) | 4 | 1E, 2M, 1H | Covered |
| Access Control Models (DAC, MAC, RBAC, ABAC) | 4 | 1E, 2M, 1H | Covered |
| Least Privilege & Separation of Duties | 3 | 1E, 1M, 1H | Covered |
| Identity Lifecycle (Provisioning through Deprovisioning) | 3 | 1E, 1M, 1H | Covered |
| Privilege Escalation (Horizontal/Vertical) | 2 | 1E, 1M | Covered |
| Biometric Deep Dive (CER/EER, Type 1/Type 2 Errors, Retina vs Iris) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| RADIUS vs TACACS+ (Protocol, Encryption, AAA Separation) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| Zero Trust Architecture (NIST SP 800-207, PDP/PEP) | 3 | 1E, 1M, 1H | Gap #3 (HIGH) |
| Access Control Attacks (Golden Ticket, Pass-the-Hash, Kerberoasting) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| Session Management (Hijacking, Session ID Security, Timeouts) | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Password Policy (NIST SP 800-63B, Passphrases, Complexity) | 3 | 1E, 1M, 1H | Gap #6 (MEDIUM) |
| Service Account Management | 2 | 1E, 1M | Gap #7 (MEDIUM) |
| Device Authentication (802.1X, NAC, MDM) | 2 | 1E, 1M | Gap #8 (MEDIUM) |
| Authorization Mechanisms (ACL, Capability Lists, Implicit Deny) | 3 | 1E, 1M, 1H | Gap #9 (MEDIUM) |
| Credential Stuffing & Brute Force Attacks | 2 | 1E, 1M | Covered |
| su vs sudo on Linux | 2 | 1E, 1M | Gap #13 (MEDIUM) |
| **TOTAL** | **55** | | |

> **Note:** Add 5 additional questions to Biometrics (+1), Access Control Attacks (+1), RADIUS/TACACS+ (+1), Access Control Models (+1), and SSO/Federated Identity (+1) to reach 60.

#### D6: Security Assessment and Testing

**Currently covered topics:** Vulnerability Assessment vs Penetration Testing, Penetration testing methodology, Testing approaches (Black/White/Gray Box), Log Reviews/SIEM, SOC 2 Type I vs Type II, Security Metrics/KPIs (MTTD, MTTR), Vulnerability scan validation.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Vulnerability Assessment vs Penetration Testing | 3 | 1E, 1M, 1H | Covered |
| Testing Approaches (Black/White/Gray Box) | 3 | 1E, 1M, 1H | Covered |
| Log Reviews & SIEM | 2 | 1E, 1M | Covered |
| Security Metrics & KPIs (MTTD, MTTR) | 2 | 1E, 1M | Covered |
| SAST vs DAST vs IAST | 4 | 1E, 2M, 1H | Gap #1 (HIGH) |
| Fuzz Testing (Mutation vs Generational) | 3 | 1E, 1M, 1H | Gap #2 (HIGH) |
| Code Review Processes (Fagan, Peer Review, Walkthrough) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| SOC 1 vs SOC 2 vs SOC 3 (Full Comparison) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| SSAE 18 / ISAE 3402 Audit Standards | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Validation vs Verification | 3 | 1E, 1M, 1H | Gap #6 (HIGH) |
| Red Team vs Blue Team vs Purple Team vs White Team | 3 | 1E, 1M, 1H | Gap #7 (HIGH) |
| Credentialed vs Uncredentialed Vulnerability Scanning | 3 | 1E, 1M, 1H | Gap #8 (HIGH) |
| CVE and CVSS (Vulnerability Scoring) | 3 | 1E, 1M, 1H | Gap #9 (HIGH) |
| False Positives vs False Negatives | 3 | 1E, 1M, 1H | Gap #10 (HIGH) |
| Interface Testing Types (API, UI, Network) | 2 | 1E, 1M | Gap #13 (MEDIUM) |
| KRI vs KPI (Forward-Looking vs Backward-Looking) | 2 | 1E, 1M | Gap #17 (MEDIUM) |
| Circular Overwrite vs Clipping Levels | 2 | 1E, 1M | Gap #19 (MEDIUM) |
| NTP and Log Time Synchronization | 2 | 1E, 1M | Gap #20 (MEDIUM) |
| Penetration Testing Methodology (Phases) | 2 | 1E, 1M | Covered |
| Banner Grabbing & OS Fingerprinting | 2 | 1E, 1M | Gap #26 (LOW) |
| **TOTAL** | **55** | | |

> **Note:** Add 5 additional questions to SOC Reports (+1), SAST/DAST/IAST (+1), Code Review (+1), CVE/CVSS (+1), and Fuzz Testing (+1) to reach 60.

#### D7: Security Operations

**Currently covered topics:** NIST IR Lifecycle (4 phases), Containment Strategies, DR Metrics (RTO/RPO/MTBF/MTTR), Change Management, Logging/Monitoring/SIEM, Chain of Custody, Forensic Imaging.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| NIST IR Lifecycle (Preparation, Detection, Containment, Post-Incident) | 3 | 1E, 1M, 1H | Covered |
| Containment Strategies | 2 | 1E, 1M | Covered |
| DR Metrics (RTO, RPO, MTBF, MTTR) | 3 | 1E, 1M, 1H | Covered |
| Change Management (RFC, CAB, Approval) | 3 | 1E, 1M, 1H | Covered |
| Logging, Monitoring, & SIEM | 2 | 1E, 1M | Covered |
| Chain of Custody & Forensic Imaging | 3 | 1E, 1M, 1H | Covered |
| Backup Strategies (Incremental vs Differential, 3-2-1 Rule, GFS) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| Recovery Site Types (Cold/Warm/Hot/Mobile/Redundant) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| RAID Levels (0, 1, 5, 6, 10) | 5 | 1E, 2M, 2H | Gap #3 (HIGH) |
| BIA Process (Purpose, Steps, RPO/RTO/WRT/MTD) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| DRP Testing Types (Read-through to Full-Interruption) | 4 | 1E, 2M, 1H | Gap #5 (HIGH) |
| Evidence Types & Rules (Real, Direct, Circumstantial, Hearsay) | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Investigation Types (Criminal, Civil, Regulatory, Administrative) | 3 | 1E, 1M, 1H | Gap #7 (HIGH) |
| WRT Concept & MTD Formula (MTD = RTO + WRT) | 3 | 1E, 1M, 1H | Gap #8 (HIGH) |
| Restoration Order (Critical to DR First, Least Critical Back First) | 3 | 1E, 1M, 1H | Gap #9 (HIGH) |
| Malware Types (Virus, Worm, Trojan, Ransomware, Rootkit, Logic Bomb) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| Failure Modes (Fail-Safe, Fail-Secure, Fail-Open) | 2 | 1E, 1M | Gap #13 (MEDIUM) |
| Patch Management Lifecycle | 2 | 1E, 1M | Gap #14 (MEDIUM) |
| **TOTAL** | **58** | | |

> **Note:** Add 2 additional questions to Backup Strategies (+1) and RAID Levels (+1) to reach 60.

#### D8: Software Development Security

**Currently covered topics:** Secure SDLC phases, OWASP Top 10 (all 10), Secure Coding Practices (parameterized queries, input validation, output encoding, error handling, session management), SAST/DAST/IAST, DevSecOps/CI/CD, Shift Left principle.

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Secure SDLC Phases | 3 | 1E, 1M, 1H | Covered |
| OWASP Top 10 (Injection, XSS, Broken Auth, etc.) | 4 | 1E, 2M, 1H | Covered |
| Secure Coding Practices (Input Validation, Parameterized Queries) | 3 | 1E, 1M, 1H | Covered |
| SAST/DAST/IAST (Testing in DevSecOps) | 3 | 1E, 1M, 1H | Covered |
| DevSecOps & CI/CD Pipeline Security | 3 | 1E, 1M, 1H | Covered |
| Shift Left Principle | 2 | 1E, 1M | Covered |
| Database Security (ACID, Keys, Normalization, Aggregation/Inference) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| Development Methodologies (Waterfall, Spiral, Agile, SAFe, RAD) | 5 | 1E, 2M, 2H | Gap #2 (HIGH) |
| Maturity Models (SW-CMM, CMMI, SAMM, IDEAL, BSIMM) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| Change Management (Request/Change/Release Control, CAB) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| Buffer Overflow (Stack vs Heap, ASLR, DEP) | 3 | 1E, 1M, 1H | Gap #6 (MEDIUM) |
| Software Acquisition Security (COTS, Open Source, Escrow) | 3 | 1E, 1M, 1H | Gap #8 (MEDIUM) |
| OOP Security (Encapsulation, Inheritance, Polymorphism) | 2 | 1E, 1M | Gap #5 (MEDIUM) |
| Advanced Testing (Fagan, Use/Misuse Cases, Regression, Smoke) | 3 | 1E, 1M, 1H | Gap #9 (MEDIUM) |
| TOCTOU / Race Conditions | 2 | 1E, 1M | Gap #11 (MEDIUM) |
| Database Views for Access Control & Polyinstantiation | 3 | 1E, 1M, 1H | Gap #1 sub-topic |
| **TOTAL** | **52** | | |

> **Note:** Add 8 additional questions to Database Security (+2), Development Methodologies (+2), Maturity Models (+1), Change Management (+1), OWASP Top 10 (+1), Buffer Overflow (+1) to reach 60.

---

## 2. Boss Battle (Per Domain)

**Purpose:** Comprehensive end-of-domain assessment. Covers all acts including Act 4 advanced topics.
**Minimum questions per domain:** 80
**Question pool:** 100+ per domain

### Question Distribution Per Domain

| Domain | Easy (25%) | Medium (40%) | Hard (35%) | Total Pool |
|--------|-----------|-------------|-----------|------------|
| D1: Security and Risk Management | 25 | 40 | 35 | 100 |
| D2: Asset Security | 25 | 40 | 35 | 100 |
| D3: Security Architecture and Engineering | 25 | 40 | 35 | 100 |
| D4: Communication and Network Security | 25 | 40 | 35 | 100 |
| D5: Identity and Access Management | 25 | 40 | 35 | 100 |
| D6: Security Assessment and Testing | 25 | 40 | 35 | 100 |
| D7: Security Operations | 25 | 40 | 35 | 100 |
| D8: Software Development Security | 25 | 40 | 35 | 100 |
| **TOTALS** | **200** | **320** | **280** | **800** |

### Cognitive Level Distribution

| Level | Percentage |
|-------|-----------|
| Knowledge/Recall | 10% |
| Comprehension | 20% |
| Application | 40% |
| Analysis | 30% |

### Question Type Distribution

| Type | Percentage |
|------|-----------|
| Scenario-based | 50% |
| Definition discrimination | 15% |
| Process ordering | 15% |
| Calculation | 10% |
| Best practice / BEST answer | 10% |

### Topic Coverage Rules

- ALL topics (Act 1 + Act 2 + Act 4) must be represented
- HIGH priority topics: minimum 4 questions each
- Act 4 advanced topics: minimum 2 questions each
- Include "Think Like a Manager" perspective questions (15% of pool)
- Must include LEAST/MOST/FIRST/BEST question stems
- Cross-domain questions OK (up to 10%)

### Per-Domain Topic Targets

#### D1: Security and Risk Management

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| CIA Triad & DAD Triad | 5 | 1E, 2M, 2H | Covered + Gap #14 |
| Risk Analysis — Quantitative (SLE, ARO, ALE Calculations) | 6 | 1E, 2M, 3H | Covered |
| Risk Analysis — Qualitative Methods | 4 | 1E, 2M, 1H | Covered |
| Risk Treatment Options (Accept/Mitigate/Transfer/Avoid) | 4 | 1E, 2M, 1H | Covered |
| Security Governance & Document Hierarchy (Policy/Standard/Procedure/Baseline/Guideline) | 5 | 1E, 2M, 2H | Covered + Gap #2 (HIGH) |
| NIST RMF Steps (Categorize through Monitor) | 4 | 1E, 2M, 1H | Covered |
| BCP vs DRP Fundamentals | 4 | 1E, 2M, 1H | Covered |
| ISC2 Code of Ethics & Compliance vs Security | 4 | 1E, 2M, 1H | Covered |
| Due Diligence vs Due Care | 3 | 1E, 1M, 1H | Covered |
| Accountability vs Responsibility (Cannot Delegate Accountability) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| Intellectual Property Laws (Patent/Copyright/TM/Trade Secret) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| Control Types & Classification (Directive/Deterrent/Preventive/Detective/Corrective/Recovery/Compensating; Admin/Technical/Physical) | 5 | 1E, 2M, 2H | Gap #6 (HIGH) |
| Threat Modeling (STRIDE, PASTA, DREAD) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| Personnel Security Controls (Job Rotation, Mandatory Vacations, SoD, Onboarding/Offboarding) | 4 | 1E, 2M, 1H | Gap #5 (HIGH) |
| Privacy Laws & Regulations (GDPR 7 Principles, HIPAA, GLBA, CCPA, FERPA, COPPA) | 4 | 1E, 2M, 1H | Gap #7 (MEDIUM) |
| OECD Privacy Guidelines (8 Principles) | 2 | 1E, 1H | Gap #8 (MEDIUM) |
| Privacy Impact Assessment (PIA/DPIA) | 2 | 1E, 1H | Gap #9 (MEDIUM) |
| Supply Chain Risk Management (SBOM, SLA/SLR, Silicon Root of Trust) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| AAA Services (5 Elements) | 2 | 1E, 1M | Gap #11 (MEDIUM) |
| Security Awareness Training (Awareness vs Training vs Education) | 2 | 1E, 1M | Gap #12 (MEDIUM) |
| Organizational Roles & Responsibilities | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Social Engineering Attacks (Phishing, Spear Phishing, Whaling, Vishing, Smishing) | 3 | 1E, 1M, 1H | Gap #27 (LOW) |
| Investigation Types (Administrative, Criminal, Civil, Regulatory) | 2 | 1E, 1H | Gap #15 (LOW) |
| Import/Export Controls (Wassenaar, ITAR, EAR) | 2 | 1E, 1H | Gap #16 (LOW) |
| Transborder Data Flow & Data Residency | 2 | 1E, 1H | Gap #17 (LOW) |
| Security Control Frameworks (ISO 27001/27002, COBIT, SABSA, ITIL, FedRAMP) | 3 | 1E, 1M, 1H | Gap #18 (LOW) |
| Third-Party Governance & ATO | 2 | 1E, 1H | Gap #19 (LOW) |
| Risk Registers, Risk Matrices, & Heat Maps | 2 | 1E, 1M | Gap #20 (LOW) |
| Continuous Improvement / PDCA (Deming Cycle) | 2 | 1E, 1M | Gap #21 (LOW) |
| Cost-Benefit Analysis / Safeguard Value | 2 | 1E, 1H | Gap #24 (LOW) |
| Scoping and Tailoring (Control Alignment) | 2 | 1E, 1M | Gap #23 (LOW) |
| Mergers & Acquisitions Security | 2 | 1E, 1H | Gap #25 (LOW) |
| NCA and NDA Types | 2 | 1E, 1M | Gap #29 (LOW) |
| Risk Communication and Reporting | 2 | 1E, 1M | Gap #30 (LOW) |
| **TOTAL** | **106** | | |

#### D2: Asset Security

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Data Classification (Government: TS/S/C/U; Business: Confidential/Private/Sensitive/Public) | 4 | 1E, 2M, 1H | Covered |
| Data Ownership Roles (Owner, Custodian, Steward, Controller, Processor) | 4 | 1E, 2M, 1H | Covered |
| Data States (At Rest, In Transit, In Use) & Protection Controls | 4 | 1E, 2M, 1H | Covered |
| Data Lifecycle (Create, Store, Use, Share, Archive, Destroy) | 3 | 1E, 1M, 1H | Covered |
| Retention Policies & Legal Holds | 3 | 1E, 1M, 1H | Covered |
| Data Destruction Methods (Clearing, Purging, Degaussing, Crypto-Shredding) | 4 | 1E, 2M, 1H | Covered |
| Privacy Principles | 3 | 1E, 1M, 1H | Covered |
| Pseudonymization, Tokenization, & Anonymization (Reversibility, GDPR Implications) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| DLP Types & Mechanics (Network/Endpoint/Cloud, Pattern Matching, Cannot Scan Encrypted) | 5 | 1E, 2M, 2H | Gap #2 (HIGH) |
| Scoping and Tailoring (Selecting vs Modifying Controls) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| CASB (Cloud Policy Enforcement, Shadow IT Detection) | 4 | 1E, 2M, 1H | Gap #4 (HIGH) |
| DRM and IRM (Licensing, Persistent Auth, DMCA) | 4 | 1E, 2M, 1H | Gap #5 (HIGH) |
| Labeling vs Marking (System-Readable vs Human-Readable) | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Classification vs Categorization (Hierarchical vs Non-Hierarchical) | 3 | 1E, 1M, 1H | Gap #7 (MEDIUM) |
| Security Baselines (NIST SP 800-53B, Low/Moderate/High Impact) | 3 | 1E, 1M, 1H | Gap #8 (MEDIUM) |
| Standards Selection (PCI DSS, GDPR Applicability) | 2 | 1E, 1H | Gap #9 (MEDIUM) |
| Information Obfuscation (Masking, Pruning, Fabricating, Trimming) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| End-to-End vs Link vs Onion Encryption | 3 | 1E, 1M, 1H | Gap #11 (MEDIUM) |
| Data Remanence (Slack Space, SSD Wear-Leveling, Residual Magnetic Flux) | 3 | 1E, 1M, 1H | Gap #12 (MEDIUM) |
| E-discovery and Litigation Holds | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| EOL vs EOS (Vendor Lifecycle & Security Implications) | 2 | 1E, 1H | Gap #14 (MEDIUM) |
| Object Reuse (TCSEC, Secure Reassignment) | 2 | 1E, 1H | Gap #15 (LOW) |
| Data Collection Limitation (Privacy Principle) | 2 | 1E, 1M | Gap #16 (LOW) |
| Data Location & Sovereignty (Cloud Data Center Verification) | 2 | 1E, 1H | Gap #17 (LOW) |
| Data Privacy Officer (DPO) & Compliance Officer Roles | 2 | 1E, 1M | Gap #18-19 (LOW) |
| Homomorphic Encryption (Computation on Encrypted Data) | 2 | 1E, 1H | Gap #20 (LOW) |
| Declassification Process | 2 | 1E, 1H | Gap #21 (LOW) |
| Memory Types & Security (Volatile vs Non-Volatile, EPROM) | 2 | 1E, 1M | Gap #24 (LOW) |
| Defensible Destruction | 2 | 1E, 1H | Gap #23 (LOW) |
| **TOTAL** | **93** | | |

> **Note:** Add 7 additional questions across HIGH priority clusters (Pseudonymization +1, DLP +1, CASB +1, DRM +1, Scoping/Tailoring +1, Data Destruction +1, Classification +1) to reach 100.

#### D3: Security Architecture and Engineering

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Security Models — Bell-LaPadula (Simple/Star Property) | 4 | 1E, 2M, 1H | Covered |
| Security Models — Biba (Simple/Star Integrity Axiom) | 3 | 1E, 1M, 1H | Covered |
| Security Models — Clark-Wilson (CDIs, UDIs, TPs, IVPs) | 3 | 1E, 1M, 1H | Covered |
| Symmetric Cryptography (AES, DES, 3DES, Block vs Stream) | 4 | 1E, 2M, 1H | Covered |
| Asymmetric Cryptography (RSA, ECC, Diffie-Hellman, ElGamal) | 4 | 1E, 2M, 1H | Covered |
| Hashing (SHA-256, MD5, HMAC, Birthday Paradox) | 3 | 1E, 1M, 1H | Covered |
| Secure Design Principles (Defense in Depth, Fail Secure, Zero Trust) | 4 | 1E, 2M, 1H | Covered |
| Common Criteria & EAL Levels (PP, ST, TOE) | 3 | 1E, 1M, 1H | Covered |
| Covert Channels (Storage vs Timing) | 2 | 1E, 1H | Covered |
| PKI & Digital Certificates (X.509, CA Hierarchy, CRL/OCSP, Chain of Trust, Certificate Pinning) | 6 | 1E, 2M, 3H | Gap #1 (HIGH) |
| Digital Signatures (Hash + Private Key, Integrity/Auth/Nonrepudiation, NOT Confidentiality) | 5 | 1E, 2M, 2H | Gap #2 (HIGH) |
| Key Management Lifecycle (Generation, Distribution, Storage, Rotation, Revocation, Destruction, Escrow, M-of-N) | 5 | 1E, 2M, 2H | Gap #3 (HIGH) |
| Cloud Computing Security (IaaS/PaaS/SaaS, Shared Responsibility, Multi-Tenancy) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| Cryptanalytic Attacks (Brute Force, Birthday, Meet-in-the-Middle, Known/Chosen Plaintext, Side-Channel, Rainbow Tables) | 4 | 1E, 1M, 2H | Gap #5 (HIGH) |
| Fire Prevention, Detection, & Suppression (VESDA, Wet/Dry/Pre-Action/Deluge, FM-200, Halon Ban) | 5 | 1E, 2M, 2H | Gap #6 (HIGH) |
| Virtualization & Hypervisor Security (Type 1/2, VM Escape, VM Sprawl, Container Security) | 5 | 1E, 2M, 2H | Gap #7 (HIGH) |
| Block Cipher Modes (ECB, CBC, CFB, OFB, CTR, GCM) | 3 | 1E, 1M, 1H | Gap #8 (MEDIUM) |
| Brewer-Nash (Chinese Wall) Model | 2 | 1E, 1H | Gap #9 (MEDIUM) |
| TOCTOU / Race Conditions | 2 | 1E, 1H | Gap #10 (MEDIUM) |
| Physical Access Controls (Fences, Mantraps, Locks, CCTV, Motion Detectors, Guards) | 4 | 1E, 2M, 1H | Gap #11 (MEDIUM) |
| Power & Environmental Controls (UPS, Generators, HVAC, TEMPEST) | 3 | 1E, 1M, 1H | Gap #12 (MEDIUM) |
| ICS/SCADA Security (PLCs, Air-Gapping, Stuxnet) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| TPM & HSM (Secure Boot, Measured Boot, Attestation) | 3 | 1E, 1M, 1H | Gap #14 (MEDIUM) |
| Steganography & Digital Watermarking | 2 | 1E, 1H | Gap #15 (MEDIUM) |
| Quantum Cryptography & Post-Quantum (QKD, Lattice-Based) | 2 | 1E, 1H | Gap #17 (LOW) |
| Graham-Denning, HRU, Take-Grant Models | 2 | 1E, 1H | Gap #19 (LOW) |
| Enterprise Architecture Frameworks (Zachman, TOGAF, SABSA) | 2 | 1E, 1H | Gap #20 (LOW) |
| CPTED (Natural Surveillance, Territorial Reinforcement) | 2 | 1E, 1M | Gap #21 (LOW) |
| Security Modes of Operation (Dedicated, System High, Compartmented, Multilevel) | 2 | 1E, 1H | Gap #24 (LOW) |
| Hybrid Cryptography (How TLS and PGP Combine Symmetric + Asymmetric) | 2 | 1E, 1M | Gap #26 (LOW) |
| One-Time Pad (Perfect Secrecy, Strict Requirements) | 2 | 1E, 1H | Gap #27 (LOW) |
| Crypto-Shredding & Data Remanence in Cloud | 2 | 1E, 1H | Gap #28 (LOW) |
| Microservices & Serverless Security | 2 | 1E, 1M | Gap #23 (LOW) |
| Edge Computing, Fog Computing, CDN Security | 2 | 1E, 1M | Gap #22 (LOW) |
| **TOTAL** | **111** | | |

> **Note:** D3 has 28 gap topics plus 8 covered topics, producing a naturally larger pool. Trim LOW priority clusters to 1 question each if needed to stay near 100, or keep the larger pool for better randomization.

#### D4: Communication and Network Security

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| OSI Model (7 Layers, Protocols per Layer, Devices per Layer) | 5 | 1E, 2M, 2H | Covered |
| Network Attacks (MITM, DoS/DDoS, VLAN Hopping, ARP Spoofing, SSL Stripping) | 4 | 1E, 2M, 1H | Covered |
| Firewall Types (Packet Filter, Stateful, Proxy, NGFW, WAF) | 4 | 1E, 2M, 1H | Covered |
| VPN & IPsec (Transport/Tunnel Mode, AH/ESP, IKE Phases) | 4 | 1E, 2M, 1H | Covered + Gap #27 (LOW) |
| Wireless Security (WEP/WPA/WPA2/WPA3, TKIP, CCMP) | 3 | 1E, 1M, 1H | Covered |
| TCP/IP Model (4 Layers, OSI Mapping) | 4 | 1E, 2M, 1H | Gap #1 (HIGH) |
| TCP Three-Way Handshake & Flags (SYN/ACK/FIN/RST, SYN Flood) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| IP Addressing (IPv4/IPv6, CIDR, Subnetting, RFC 1918, NAT/PAT) | 6 | 1E, 2M, 3H | Gap #3 (HIGH) |
| Secure Protocols (SSH, TLS/SSL, HTTPS, SFTP, DNSSEC — Protocol Replacement Mapping) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| Email Security (S/MIME, PGP, SPF, DKIM, DMARC) | 5 | 1E, 2M, 2H | Gap #5 (HIGH) |
| NAC & 802.1X (Port-Based Auth, Pre/Post-Admit, RADIUS Integration) | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Network Segmentation (VRF, VDOMs, VPC, Air-Gapped, In-Band/Out-of-Band) | 5 | 1E, 2M, 2H | Gap #7 (HIGH) |
| Micro-segmentation & Zero Trust Networking (VXLAN, Distributed Firewalls) | 4 | 1E, 2M, 1H | Gap #8 (HIGH) |
| SDN & SD-WAN (Application/Control/Data Planes) | 3 | 1E, 1M, 1H | Gap #9 (MEDIUM) |
| Converged Protocols (iSCSI, FCoE, VoIP) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| CDN (Edge Caching, DDoS Resilience) | 2 | 1E, 1H | Gap #11 (MEDIUM) |
| Cellular/Mobile Networks (4G/5G, Network Slicing, Mutual Auth) | 2 | 1E, 1H | Gap #12 (MEDIUM) |
| Network Monitoring & QoS (SNMP, NetFlow, Syslog, Bandwidth/Throughput/Latency/Jitter) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Switching Technologies (Cut-Through vs Store-and-Forward, CAM Table, STP) | 3 | 1E, 1M, 1H | Gap #14 (MEDIUM) |
| Traffic Flows (North-South vs East-West) | 2 | 1E, 1M | Gap #15 (MEDIUM) |
| Edge Networks (Ingress/Egress Filtering, Peering) | 2 | 1E, 1H | Gap #16 (MEDIUM) |
| VoIP Security (SIPS, SRTP, PBX Security) | 2 | 1E, 1H | Gap #17 (MEDIUM) |
| Cabling & Physical Media (Cat5e/6/6a/7, Fiber, Attenuation) | 2 | 1E, 1M | Gap #18 (LOW) |
| Bluetooth, Zigbee, NFC, Satellite, Li-Fi | 2 | 1E, 1H | Gap #19 (LOW) |
| DNS Resolution (Recursive/Iterative, Cache Poisoning, Split DNS) | 3 | 1E, 1M, 1H | Gap #21 (LOW) |
| Remote Access Protocols (PAP, CHAP, EAP, RDP vs SSH) | 3 | 1E, 1M, 1H | Gap #22 (LOW) |
| RADIUS vs TACACS+ (Cross-ref D5) | 3 | 1E, 1M, 1H | Gap #28 (LOW) |
| Network Topologies (Bus, Star, Ring, Mesh) | 2 | 1E, 1M | Gap #24 (LOW) |
| Circuit Switching vs Packet Switching (PVC, SVC) | 2 | 1E, 1M | Gap #23 (LOW) |
| Network Hardware Lifecycle (EOL/EOS, Redundant Power) | 2 | 1E, 1M | Gap #26 (LOW) |
| **TOTAL** | **106** | | |

> **Note:** D4 has 28 gap topics plus 5 covered topic areas. Trim LOW priority clusters to 1 question each if needed to target 100.

#### D5: Identity and Access Management

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Authentication Factors (Knowledge, Possession, Inherence, Location, Behavior) | 4 | 1E, 2M, 1H | Covered |
| MFA (Multi-Factor vs Multi-Step, Out-of-Band) | 3 | 1E, 1M, 1H | Covered |
| SSO & Federated Identity (Kerberos Ticket Flow, SAML, OAuth 2.0, OIDC) | 5 | 1E, 2M, 2H | Covered |
| Access Control Models (DAC, MAC, RBAC, ABAC, Rule-Based) | 5 | 1E, 2M, 2H | Covered |
| Least Privilege & Separation of Duties | 3 | 1E, 1M, 1H | Covered |
| Identity Lifecycle (Provisioning, Review, Deprovisioning, Orphaned Accounts) | 3 | 1E, 1M, 1H | Covered |
| Privilege Escalation (Horizontal vs Vertical) | 2 | 1E, 1H | Covered |
| Credential Stuffing & Brute Force | 2 | 1E, 1M | Covered |
| Biometric Deep Dive (CER/EER, Type 1 FAR / Type 2 FRR, Retina vs Iris vs Palm, 1:1 vs 1:N) | 6 | 1E, 2M, 3H | Gap #1 (HIGH) |
| RADIUS vs TACACS+ (Protocol Differences, Encryption, AAA Separation, Use Cases) | 5 | 1E, 2M, 2H | Gap #2 (HIGH) |
| Zero Trust Architecture (NIST SP 800-207, Policy Engine/Administrator, PDP/PEP, Continuous Auth) | 4 | 1E, 2M, 1H | Gap #3 (HIGH) |
| Access Control Attacks (Dictionary, Spraying, Rainbow Tables, Pass-the-Hash, Golden/Silver Ticket, Kerberoasting, ASREPRoast) | 6 | 1E, 2M, 3H | Gap #4 (HIGH) |
| Session Management (Hijacking, Session ID Entropy, Timeouts, OWASP Guidance) | 4 | 1E, 2M, 1H | Gap #5 (HIGH) |
| Password Policy (NIST SP 800-63B, Complexity vs Length, Passphrases, No Forced Expiration) | 3 | 1E, 1M, 1H | Gap #6 (MEDIUM) |
| Service Account Management (Non-Interactive, Certificate-Based Auth, Risk of LocalSystem) | 3 | 1E, 1M, 1H | Gap #7 (MEDIUM) |
| Device Authentication (802.1X, NAC + MDM, Context-Aware Auth) | 3 | 1E, 1M, 1H | Gap #8 (MEDIUM) |
| Authorization Mechanisms (ACL, Capability Lists, Constrained Interfaces, Implicit Deny) | 3 | 1E, 1M, 1H | Gap #9 (MEDIUM) |
| Account Access Review Process (Frequency, Automated vs Manual, Orphaned Accounts) | 3 | 1E, 1M, 1H | Gap #10 (MEDIUM) |
| Identity Governance (Kim Cameron's Laws, Role Engineering, Entitlement Management) | 2 | 1E, 1H | Gap #11 (MEDIUM) |
| Mutual Authentication (Certificate-Based, VPN/TLS, Rogue Server Prevention) | 2 | 1E, 1H | Gap #12 (MEDIUM) |
| su vs sudo on Linux (Audit Trail, sudoers, Dual-Account Best Practice) | 2 | 1E, 1M | Gap #13 (MEDIUM) |
| Authenticator Assurance Levels (AAL1/AAL2/AAL3) | 2 | 1E, 1H | Gap #14 (LOW) |
| CAPTCHA & Anti-Automation | 2 | 1E, 1M | Gap #15 (LOW) |
| Credential Management Systems (Vaults, W3C API) | 2 | 1E, 1M | Gap #16 (LOW) |
| Vendor Access Provisioning (Third-Party Identity Management) | 2 | 1E, 1H | Gap #17 (LOW) |
| SESAME Protocol (Comparison with Kerberos) | 2 | 1E, 1M | Gap #18 (LOW) |
| XACML (Attribute-Based Access Control Standard) | 2 | 1E, 1M | Gap #19 (LOW) |
| Risk-Based Access Control (Dynamic Risk Evaluation, ML in Access Decisions) | 2 | 1E, 1H | Gap #20 (LOW) |
| **TOTAL** | **95** | | |

> **Note:** Add 5 additional questions to Biometrics (+1), Access Control Attacks (+1), RADIUS/TACACS+ (+1), SSO/Kerberos (+1), and Zero Trust (+1) to reach 100.

#### D6: Security Assessment and Testing

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Vulnerability Assessment vs Penetration Testing (Scope, Rules of Engagement) | 4 | 1E, 2M, 1H | Covered |
| Testing Approaches (Black Box/White Box/Gray Box) | 3 | 1E, 1M, 1H | Covered |
| Log Reviews & SIEM (Correlation, Alerting, Normalization) | 3 | 1E, 1M, 1H | Covered |
| SOC 2 Type I vs Type II | 3 | 1E, 1M, 1H | Covered |
| Security Metrics & KPIs (MTTD, MTTR, Dwell Time) | 3 | 1E, 1M, 1H | Covered |
| Vulnerability Scan Validation & Remediation | 2 | 1E, 1M | Covered |
| Penetration Testing Methodology (Phases: Recon through Reporting) | 3 | 1E, 1M, 1H | Covered |
| SAST vs DAST vs IAST (Static/Dynamic/Interactive, When Each Is Used) | 5 | 1E, 2M, 2H | Gap #1 (HIGH) |
| Fuzz Testing (Mutation vs Generational, Input Discovery) | 4 | 1E, 2M, 1H | Gap #2 (HIGH) |
| Code Review Processes (Fagan Inspection 6 Phases, Peer Review, Walkthroughs) | 5 | 1E, 2M, 2H | Gap #3 (HIGH) |
| SOC 1 vs SOC 2 vs SOC 3 (Full Report Type Comparison) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| SSAE 18 / ISAE 3402 (SAS 70 Evolution) | 3 | 1E, 1M, 1H | Gap #5 (HIGH) |
| Validation vs Verification ("Right Product" vs "Built Right") | 4 | 1E, 2M, 1H | Gap #6 (HIGH) |
| Red Team vs Blue Team vs Purple Team vs White Team | 4 | 1E, 2M, 1H | Gap #7 (HIGH) |
| Credentialed vs Uncredentialed Scanning (Depth, Accuracy, False Positives) | 4 | 1E, 2M, 1H | Gap #8 (HIGH) |
| CVE & CVSS (Vulnerability Identification, Base/Temporal/Environmental Scores) | 4 | 1E, 2M, 1H | Gap #9 (HIGH) |
| False Positives vs False Negatives (Which Is More Dangerous) | 4 | 1E, 2M, 1H | Gap #10 (HIGH) |
| Equivalence Partitioning & Boundary Value Analysis | 2 | 1E, 1H | Gap #11 (MEDIUM) |
| Test Coverage Analysis (Branch, Condition, Function, Loop, Statement) | 2 | 1E, 1H | Gap #12 (MEDIUM) |
| Interface Testing (API, UI, Network, Physical) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Misuse Case / Abuse Case Testing | 2 | 1E, 1H | Gap #14 (MEDIUM) |
| Breach Attack Simulation (BAS) | 2 | 1E, 1H | Gap #15 (MEDIUM) |
| SCAP (Security Content Automation Protocol) | 2 | 1E, 1M | Gap #16 (MEDIUM) |
| KRI vs KPI (Forward-Looking vs Backward-Looking Metrics) | 3 | 1E, 1M, 1H | Gap #17 (MEDIUM) |
| SMART Metrics Framework | 2 | 1E, 1M | Gap #18 (MEDIUM) |
| Circular Overwrite vs Clipping Levels | 2 | 1E, 1M | Gap #19 (MEDIUM) |
| NTP & Log Time Synchronization | 2 | 1E, 1M | Gap #20 (MEDIUM) |
| Regression Testing | 2 | 1E, 1M | Gap #22 (LOW) |
| Blind vs Double-Blind Testing | 2 | 1E, 1H | Gap #24 (LOW) |
| Audit Roles & Responsibilities | 2 | 1E, 1M | Gap #25 (LOW) |
| Banner Grabbing & OS Fingerprinting | 2 | 1E, 1M | Gap #26 (LOW) |
| Software Testing Levels (Unit/Interface/Integration/System/Acceptance) | 2 | 1E, 1H | Gap #29 (LOW) |
| Positive, Negative, & Misuse Testing | 2 | 1E, 1M | Gap #32 (LOW) |
| Ethical Disclosure Obligations | 2 | 1E, 1M | Gap #27 (LOW) |
| Compliance Checks & Gap Assessments | 2 | 1E, 1M | Gap #28 (LOW) |
| **TOTAL** | **107** | | |

> **Note:** D6 has 34 gap topics plus 7 covered areas, producing a large pool. Trim LOW priority clusters to 1 question each to target 100.

#### D7: Security Operations

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| NIST IR Lifecycle (Preparation, Detection/Analysis, Containment/Eradication/Recovery, Post-Incident) | 4 | 1E, 2M, 1H | Covered |
| Containment Strategies (Short-Term, Long-Term, Eradication) | 3 | 1E, 1M, 1H | Covered |
| DR Metrics (RTO, RPO, MTBF, MTTR) | 4 | 1E, 2M, 1H | Covered |
| Change Management (RFC, CAB, Emergency Change) | 3 | 1E, 1M, 1H | Covered |
| Logging, Monitoring, & SIEM (Aggregation, Correlation) | 3 | 1E, 1M, 1H | Covered |
| Chain of Custody & Forensic Imaging (Bit-for-Bit, Write Blockers) | 4 | 1E, 2M, 1H | Covered |
| Backup Strategies (Full/Incremental/Differential, Archive Bit, 3-2-1 Rule, GFS/Tower of Hanoi) | 6 | 1E, 2M, 3H | Gap #1 (HIGH) |
| Recovery Site Types (Cold/Warm/Hot/Mobile/Redundant, Cost vs Recovery Time) | 5 | 1E, 2M, 2H | Gap #2 (HIGH) |
| RAID Levels (0, 1, 5, 6, 10 — Min Drives, Parity, Striping, Mirroring) | 6 | 1E, 2M, 3H | Gap #3 (HIGH) |
| BIA Process (Purpose, Steps, RPO/RTO/WRT/MTD, When to Declare Disaster) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| DRP Testing Types (Read-Through, Walkthrough, Simulation, Parallel, Full-Interruption) | 5 | 1E, 2M, 2H | Gap #5 (HIGH) |
| Evidence Types & Rules (Real, Direct, Circumstantial, Hearsay, Corroborative; 5 Rules of Evidence) | 5 | 1E, 2M, 2H | Gap #6 (HIGH) |
| Investigation Types (Criminal, Civil, Regulatory, Administrative; Burden of Proof) | 4 | 1E, 2M, 1H | Gap #7 (HIGH) |
| WRT Concept & MTD Formula (MTD = RTO + WRT) | 4 | 1E, 2M, 1H | Gap #8 (HIGH) |
| Restoration Order (Most Critical to DR First; Least Critical Back to Primary First) | 4 | 1E, 2M, 1H | Gap #9 (HIGH) |
| Malware Types (Virus, Worm, Trojan, Ransomware, Rootkit, Logic Bomb, Polymorphic, Botnet) | 4 | 1E, 2M, 1H | Gap #10 (MEDIUM) |
| Anti-Malware Approaches (Signature, Heuristic, Activity Monitor, Change Detection) | 3 | 1E, 1M, 1H | Gap #11 (MEDIUM) |
| Foundational SecOps (Need-to-Know, Two-Person Control, Split Knowledge, PAM) | 3 | 1E, 1M, 1H | Gap #12 (MEDIUM) |
| Failure Modes (Fail-Safe, Fail-Secure, Fail-Soft/Open) | 3 | 1E, 1M, 1H | Gap #13 (MEDIUM) |
| Patch Management Lifecycle (Evaluate, Test, Approve, Deploy, Verify) | 3 | 1E, 1M, 1H | Gap #14 (MEDIUM) |
| Vulnerability Management (Scans, CVE, Patching Relationship) | 2 | 1E, 1M | Gap #15 (MEDIUM) |
| Configuration Management (Provisioning, Baselining, Imaging, Hardening) | 3 | 1E, 1M, 1H | Gap #17 (MEDIUM) |
| Clustering vs Redundancy (High Availability) | 2 | 1E, 1H | Gap #18 (LOW) |
| Electronic Vaulting, Remote Journaling, Remote Mirroring | 3 | 1E, 1M, 1H | Gap #19 (LOW) |
| Locard's Exchange Principle | 2 | 1E, 1M | Gap #20 (LOW) |
| MOM (Motive, Opportunity, Means) | 2 | 1E, 1M | Gap #21 (LOW) |
| SOAR Capabilities | 2 | 1E, 1H | Gap #23 (LOW) |
| UEBA (User & Entity Behavior Analytics) | 2 | 1E, 1M | Gap #24 (LOW) |
| EDR (Endpoint Detection & Response) | 2 | 1E, 1M | Gap #25 (LOW) |
| Threat Hunting vs Threat Intelligence | 2 | 1E, 1H | Gap #26 (LOW) |
| Reciprocal Agreements | 2 | 1E, 1M | Gap #22 (LOW) |
| **TOTAL** | **112** | | |

> **Note:** D7 has 28 gap topics (9 HIGH) plus 6 covered areas. Trim LOW priority clusters to 1 question each to target 100.

#### D8: Software Development Security

| Topic Cluster | Min Questions | Difficulty Mix | Source |
|---------------|-------------|----------------|--------|
| Secure SDLC Phases (Requirements through Maintenance) | 4 | 1E, 2M, 1H | Covered |
| OWASP Top 10 (Injection, XSS, Broken Auth, SSRF, etc.) | 5 | 1E, 2M, 2H | Covered |
| Secure Coding Practices (Input Validation, Parameterized Queries, Output Encoding, Error Handling) | 4 | 1E, 2M, 1H | Covered |
| SAST/DAST/IAST in DevSecOps Context | 3 | 1E, 1M, 1H | Covered |
| DevSecOps & CI/CD Pipeline Security (SBOM, Container Scanning) | 4 | 1E, 2M, 1H | Covered |
| Shift Left Principle (Security Early in SDLC) | 2 | 1E, 1M | Covered |
| Database Security — Relational (ACID, Keys, Normalization, Views) | 6 | 1E, 2M, 3H | Gap #1 (HIGH) |
| Database Security — Attacks (Aggregation, Inference, Polyinstantiation) | 4 | 1E, 2M, 1H | Gap #1 (HIGH) |
| Database Security — NoSQL Types & Concerns | 2 | 1E, 1H | Gap #1 (HIGH) |
| Development Methodologies (Waterfall 7 Stages, Spiral Risk-Driven, Agile/Scrum, SAFe, RAD, Cleanroom, XP) | 6 | 1E, 2M, 3H | Gap #2 (HIGH) |
| Maturity Models (SW-CMM 5 Levels, CMMI 6 Levels, SAMM, IDEAL, BSIMM) | 5 | 1E, 2M, 2H | Gap #3 (HIGH) |
| Change Management Detail (Request Control, Change Control, Release Control; Config Mgmt 4 Components) | 5 | 1E, 2M, 2H | Gap #4 (HIGH) |
| OOP Security (Encapsulation, Inheritance, Polymorphism, Cohesion/Coupling) | 3 | 1E, 1M, 1H | Gap #5 (MEDIUM) |
| Buffer Overflow (Stack vs Heap, ASLR, DEP, Bounds Checking, NOP Sled) | 4 | 1E, 2M, 1H | Gap #6 (MEDIUM) |
| Knowledge-Based Systems / AI (Expert Systems, ML Supervised/Unsupervised, Neural Networks) | 3 | 1E, 1M, 1H | Gap #7 (MEDIUM) |
| Software Acquisition Security (COTS, Open Source, Source Code Escrow, Heartbleed) | 3 | 1E, 1M, 1H | Gap #8 (MEDIUM) |
| Advanced Testing (Fagan Inspection, Use/Misuse Cases, Regression, Smoke, Canary, Unit/Integration/System/UAT) | 4 | 1E, 2M, 1H | Gap #9 (MEDIUM) |
| Code Obfuscation (Lexical, Data, Control Flow) | 2 | 1E, 1H | Gap #10 (MEDIUM) |
| TOCTOU / Race Conditions (Timing Vulnerability, Prevention) | 2 | 1E, 1H | Gap #11 (MEDIUM) |
| Covert Channels (Storage vs Timing, Detection, Prevention) | 2 | 1E, 1M | Gap #12 (LOW) |
| Project Management Tools (Gantt, PERT, Critical Path) | 2 | 1E, 1M | Gap #13 (LOW) |
| SLAs (Key Metrics, Security Requirements) | 2 | 1E, 1M | Gap #14 (LOW) |
| Software-Defined Security (Policy-Driven, CI/CD Integration) | 2 | 1E, 1H | Gap #15 (LOW) |
| Metadata (Object-Level, Collection-Level, Security Implications) | 2 | 1E, 1M | Gap #16 (LOW) |
| Citizen Developers (Governance, Shadow IT) | 2 | 1E, 1M | Gap #17 (LOW) |
| ODBC / Database Connectivity | 2 | 1E, 1M | Gap #18 (LOW) |
| **TOTAL** | **93** | | |

> **Note:** Add 7 additional questions to Database Security (+2), Development Methodologies (+2), Maturity Models (+1), Change Management (+1), Buffer Overflow (+1) to reach 100.

---

## 3. Final Boss (Cross-Domain)

**Purpose:** Cumulative assessment across all 8 domains. Simulates CISSP exam format.
**Minimum questions:** 150
**Question pool:** 200+
**Time limit:** Adaptive (like real CISSP CAT)

### Domain Weight Distribution

| Domain | Exam Weight | Questions (of 150) | Pool Target |
|--------|-----------|-------------------|-------------|
| D1: Security and Risk Management | 15% | 22-23 | 30 |
| D2: Asset Security | 10% | 15 | 20 |
| D3: Security Architecture and Engineering | 13% | 19-20 | 26 |
| D4: Communication and Network Security | 13% | 19-20 | 26 |
| D5: Identity and Access Management | 13% | 19-20 | 26 |
| D6: Security Assessment and Testing | 12% | 18 | 24 |
| D7: Security Operations | 13% | 19-20 | 26 |
| D8: Software Development Security | 11% | 16-17 | 22 |
| **TOTAL** | **100%** | **150** | **200** |

### Cognitive Level Distribution

| Level | Percentage |
|-------|-----------|
| Knowledge/Recall | 5% |
| Comprehension | 15% |
| Application | 45% |
| Analysis | 35% |

### Question Requirements

- 60% scenario-based (multi-sentence stems)
- All questions use BEST/MOST/FIRST/LEAST stems
- Cross-domain integration: 20% of questions touch 2+ domains
- No topic appears more than 4 times
- Must cover all HIGH priority gaps from gap analysis
- Minimum 10 calculation questions (ALE, RAID, subnet, etc.)
- Minimum 15 process ordering questions

### Cross-Domain Integration Targets (20% = 40 questions from pool)

| Cross-Domain Pairing | Min Questions | Example Scenario |
|----------------------|-------------|-----------------|
| D1 + D7: Risk Management meets Security Operations | 6 | BIA driving DR site selection; risk treatment via operational controls |
| D3 + D4: Crypto meets Network Security | 5 | TLS/IPsec protocol selection; PKI in VPN; email encryption |
| D2 + D3: Data Protection meets Architecture | 4 | DLP + encryption layering; data-at-rest protection architecture |
| D5 + D4: IAM meets Network Security | 4 | 802.1X/NAC integration; RADIUS/TACACS+ network AAA |
| D1 + D2: Governance meets Asset Security | 4 | Classification policy enforcement; privacy regulation compliance |
| D6 + D8: Assessment meets Software Security | 4 | SAST/DAST in CI/CD; code review in SDLC; testing methodology selection |
| D3 + D5: Architecture meets IAM | 3 | Zero trust architecture; cloud IAM; PKI for authentication |
| D7 + D6: Operations meets Assessment | 3 | Vulnerability management lifecycle; pen test in production; SIEM alerting |
| D1 + D6: Governance meets Assessment | 3 | Audit standards (SSAE 18, SOC); compliance monitoring; KRI/KPI |
| D2 + D7: Data Protection meets Operations | 2 | Backup encryption; media management; data remanence |
| D4 + D7: Network Security meets Operations | 2 | Network forensics; DDoS incident response; firewall change management |

### Per-Domain Final Boss Topic Priorities

#### D1 (30 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Quantitative Risk Analysis (SLE/ARO/ALE calculations) | 4 | Calculation + scenario |
| Risk Treatment & Residual Risk | 3 | Management decision scenarios |
| Control Classification (7 types x 3 categories) | 3 | Identification from scenario |
| Governance & Document Hierarchy | 3 | Discrimination (policy vs standard vs procedure) |
| IP Laws (Patent/Copyright/TM/Trade Secret) | 3 | Scenario identification |
| Threat Modeling (STRIDE/PASTA) | 3 | Apply methodology to scenario |
| BCP/DRP & BIA Concepts | 3 | Process ordering, when to declare disaster |
| Personnel Security Controls | 2 | Control type classification |
| Privacy Laws (GDPR, HIPAA, CCPA) | 2 | Jurisdiction matching |
| Ethics, Compliance, Due Diligence/Care | 2 | BEST action scenarios |
| Accountability vs Responsibility | 2 | Cannot-delegate scenarios |

#### D2 (20 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Pseudonymization vs Tokenization vs Anonymization | 3 | Discrimination + GDPR implications |
| DLP Types & Mechanics | 3 | Technology selection scenarios |
| Data Classification & Labeling/Marking | 3 | Apply classification; distinguish labeling vs marking |
| CASB & Cloud Data Protection | 2 | Cloud policy enforcement scenarios |
| Scoping vs Tailoring | 2 | Definition discrimination |
| Data States & Protection Controls | 2 | Match control to state |
| Data Lifecycle & Retention/Destruction | 2 | Process ordering; destruction method selection |
| DRM/IRM | 2 | Technology selection |
| Data Remanence & Secure Destruction | 1 | SSD-specific challenges |

#### D3 (26 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| PKI & Digital Certificates (X.509, CA, CRL/OCSP) | 4 | Certificate lifecycle, chain of trust |
| Digital Signatures (What they provide/don't provide) | 3 | Nonrepudiation scenarios; NOT confidentiality |
| Key Management Lifecycle | 3 | Where crypto fails; M-of-N control |
| Cloud Security (IaaS/PaaS/SaaS, Shared Responsibility) | 3 | Responsibility mapping scenarios |
| Security Models (BLP, Biba, Clark-Wilson) | 3 | Property identification from scenario |
| Fire Suppression & Physical Security | 2 | Data center scenarios (pre-action, VESDA) |
| Virtualization (Type 1/2, VM Escape, Containers) | 2 | Architecture selection |
| Cryptanalytic Attacks | 2 | Attack identification from description |
| Symmetric vs Asymmetric Selection | 2 | When to use which |
| Secure Design Principles | 2 | Apply principle to scenario |

#### D4 (26 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Secure Protocol Selection (SSH/TLS/SFTP/DNSSEC) | 4 | Replace insecure protocol scenarios |
| IP Addressing & Subnetting | 3 | CIDR calculation; NAT/PAT scenarios |
| Network Segmentation & Micro-segmentation | 3 | Architecture design scenarios |
| OSI/TCP-IP Layer Identification | 3 | Protocol/device to layer mapping |
| Email Security (S/MIME, SPF, DKIM, DMARC) | 3 | Email protection selection |
| Firewall Types & Selection | 2 | Match firewall type to requirement |
| NAC & 802.1X | 2 | Port-based auth scenarios |
| VPN & IPsec (AH/ESP, Transport/Tunnel) | 2 | Mode/protocol selection |
| Network Attacks & Defenses | 2 | Attack identification; countermeasure selection |
| SDN & Zero Trust Networking | 2 | Architecture/plane identification |

#### D5 (26 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Biometrics (CER/EER, Type 1/Type 2 Errors, Sensitivity Tuning) | 4 | Device comparison; security vs convenience tradeoff |
| Access Control Attacks (Golden Ticket, Pass-the-Hash, Kerberoasting) | 4 | Attack identification from scenario |
| RADIUS vs TACACS+ | 3 | Protocol comparison scenarios |
| Access Control Models (DAC/MAC/RBAC/ABAC) | 3 | Model selection from scenario |
| SSO & Kerberos (Ticket Flow, SAML, OAuth/OIDC) | 3 | Protocol selection; Kerberos ticket identification |
| Zero Trust Architecture (NIST SP 800-207) | 2 | Component identification |
| Session Management | 2 | Hijacking prevention; timeout configuration |
| Identity Lifecycle & Provisioning | 2 | Process ordering; orphaned account detection |
| Password Policy (NIST SP 800-63B) | 2 | Modern recommendations vs legacy |
| MFA & Authentication Factors | 1 | Multi-factor vs multi-step |

#### D6 (24 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| SAST vs DAST vs IAST | 3 | Testing type identification from scenario |
| SOC 1 vs SOC 2 vs SOC 3 / SSAE 18 | 3 | Report selection scenarios |
| Code Review (Fagan Inspection, Peer, Walkthrough) | 3 | Formality level selection |
| Red/Blue/Purple/White Teams | 2 | Team role identification |
| Credentialed vs Uncredentialed Scanning | 2 | Scan type selection; accuracy tradeoffs |
| CVE & CVSS Scoring | 2 | Score interpretation; prioritization |
| False Positives vs False Negatives | 2 | Which is more dangerous; tuning decisions |
| Fuzz Testing (Mutation vs Generational) | 2 | Type selection |
| Validation vs Verification | 2 | Definition discrimination |
| Penetration Testing Methodology | 2 | Phase ordering; rules of engagement |
| KRI vs KPI | 1 | Forward vs backward looking |

#### D7 (26 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Backup Strategies (Incremental vs Differential, Archive Bit) | 4 | Restoration speed calculation; type selection |
| Recovery Sites (Cold/Warm/Hot, Cost vs Recovery Time) | 3 | Site selection based on MTD |
| RAID Levels (0, 1, 5, 6, 10) | 3 | Minimum drives; capacity calculation |
| BIA & MTD/RTO/RPO/WRT | 3 | MTD = RTO + WRT; when to declare disaster |
| DRP Testing (Read-Through to Full-Interruption) | 3 | Test type ordering; selection criteria |
| Evidence Types & Rules of Evidence | 3 | Evidence classification; admissibility |
| IR Lifecycle (Preparation through Post-Incident) | 2 | Phase ordering; containment decisions |
| Restoration Order (Critical to DR; Least Critical Back) | 2 | Reversal concept scenarios |
| Investigation Types (Criminal/Civil/Regulatory/Admin) | 2 | Burden of proof matching |
| Malware Types & Anti-Malware | 1 | Malware identification |

#### D8 (22 pool questions)

| Topic | Questions | Focus |
|-------|----------|-------|
| Database Security (ACID, Keys, Aggregation/Inference) | 4 | Property identification; attack type discrimination |
| Development Methodologies (Waterfall, Spiral, Agile, SAFe) | 3 | Methodology identification from scenario |
| Maturity Models (SW-CMM vs CMMI Levels) | 3 | Level identification; SW-CMM L4 vs CMMI L2 confusion |
| Change Management (Request/Change/Release Control) | 3 | Component identification; CAB role |
| OWASP Top 10 | 2 | Vulnerability identification; mitigation selection |
| Secure SDLC | 2 | Phase activity matching |
| Buffer Overflow (ASLR, DEP, Bounds Checking) | 2 | Best control selection |
| Software Acquisition (COTS, Open Source, Escrow) | 1 | Acquisition risk scenarios |
| DevSecOps & Shift Left | 1 | Pipeline security integration |
| OOP Concepts (Encapsulation, Cohesion, Coupling) | 1 | Security implication identification |

---

## 4. Think Like a Manager (TLATM) Gauntlet

**Purpose:** Test management/governance decision-making perspective.
**Questions:** 30
**Question pool:** 45+

### Domain Distribution

| Domain | Questions | Pool Target |
|--------|----------|-------------|
| D1: Security and Risk Management | 6 | 9 |
| D2: Asset Security | 3 | 5 |
| D3: Security Architecture and Engineering | 4 | 6 |
| D4: Communication and Network Security | 3 | 5 |
| D5: Identity and Access Management | 3 | 5 |
| D6: Security Assessment and Testing | 3 | 5 |
| D7: Security Operations | 4 | 6 |
| D8: Software Development Security | 4 | 6 |
| **TOTAL** | **30** | **47** |

### Question Characteristics

- ALL scenario-based (3-5 sentence stems)
- Correct answer is always the MANAGEMENT perspective
- Distractors are technically correct but not the manager's choice
- Focus areas: risk acceptance decisions, budget justification, policy enforcement, compliance vs security, business impact, vendor management
- No technical implementation details (that is the engineer's job)

### TLATM Topic Targets

#### D1: Security and Risk Management (6 questions, 9 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Risk acceptance vs mitigation | CEO asks about residual risk after controls | Accept risk when cost of control exceeds potential loss |
| Budget justification for security program | CFO questions security spending ROI | Quantify ALE reduction vs control cost |
| Policy enforcement vs business pressure | Business unit wants policy exception | Follow exception process; document risk acceptance |
| Compliance vs security investment | Regulatory audit findings | Prioritize compliance gaps by business impact |
| Third-party vendor risk | Vendor fails security assessment | Risk-based vendor management decision |
| Personnel security decision | Employee termination with access concerns | Immediate access revocation before notification |
| BCP/DRP funding priority | Board asks about disaster preparedness | BIA drives budget allocation to highest-impact processes |
| Governance structure design | New CISO reports to whom? | CISO reports to CEO/board, not CIO (independence) |
| Security awareness program ROI | Justify training budget to executives | Measure phishing click-rate reduction; compliance requirement |

#### D2: Asset Security (3 questions, 5 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Data classification authority | Who decides classification level? | Data owner (business unit) decides, not IT |
| Data retention vs destruction | Legal hold conflicts with retention policy | Legal hold overrides scheduled destruction |
| Cloud data sovereignty | International expansion with data concerns | Data residency laws drive storage location decisions |
| Privacy impact assessment trigger | New system collecting personal data | PIA required before system deployment |
| DLP implementation priority | Multiple data loss vectors identified | Prioritize by highest-risk data flow (egress points) |

#### D3: Security Architecture and Engineering (4 questions, 6 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Cloud vs on-prem cost-benefit | Justify cloud migration security posture | Shared responsibility model; document accountability |
| Crypto algorithm selection | Legacy system uses weak encryption | Plan migration timeline; compensating controls interim |
| Physical security investment | Data center environmental controls budget | Cost of downtime justifies environmental monitoring |
| Technology selection (build vs buy) | Custom vs commercial security solution | COTS preferred unless unique requirement; total cost of ownership |
| Virtualization strategy approval | VM sprawl risk in cloud expansion | Governance framework before scaling; lifecycle management |
| Certificate authority decision | Internal vs public CA for PKI | Risk/cost analysis; internal CA for internal resources |

#### D4: Communication and Network Security (3 questions, 5 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Network segmentation ROI | Justify micro-segmentation investment | Reduce blast radius; compliance requirement; insurance reduction |
| Remote access policy | Post-pandemic hybrid work security | Risk-based remote access tiers; zero trust evaluation |
| BYOD policy decision | Employees want personal devices on network | MDM requirement; acceptable use policy; risk acceptance |
| Wireless security standard | Legacy devices cannot support WPA3 | Risk acceptance with compensating controls or device refresh |
| ISP/carrier redundancy | Single point of failure in connectivity | Business impact of downtime drives redundancy investment |

#### D5: Identity and Access Management (3 questions, 5 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| MFA deployment priority | Which users get MFA first? | Privileged users and remote access first (highest risk) |
| Access review cadence | How often to review access rights? | Risk-based: privileged quarterly, standard annually |
| SSO vendor selection | Multiple SSO solutions evaluated | Business requirements drive selection, not just technology |
| Privileged access management | Admin account sharing discovered | Implement PAM; individual accountability required |
| Identity governance budget | Orphaned accounts discovered in audit | Automated provisioning/deprovisioning justified by audit findings |

#### D6: Security Assessment and Testing (3 questions, 5 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Pen test scope approval | What scope should management approve? | Define scope by risk; written authorization; rules of engagement |
| Vulnerability disclosure | Researcher reports critical vulnerability | Responsible disclosure process; patch timeline communication |
| Audit finding prioritization | Multiple audit findings with limited budget | Prioritize by risk rating and regulatory impact |
| Third-party assessment frequency | How often to assess vendor security? | Risk tier determines frequency (critical vendors more often) |
| SOC report selection | Which report to request from cloud provider? | SOC 2 Type II for ongoing assurance; SOC 1 for financial controls |

#### D7: Security Operations (4 questions, 6 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| DRP test frequency | How often to test recovery plans? | Annual minimum; critical systems more frequent; regulatory requirements |
| Incident response authority | Who has authority to isolate systems? | Pre-approved authority in IR plan; notification chain documented |
| Recovery site selection | Hot site vs warm site cost justification | MTD/RTO requirements drive site type; cost-benefit analysis |
| Forensics vs recovery priority | Active breach: preserve evidence or restore service? | Business impact drives priority; parallel tracks when possible |
| Backup strategy approval | Incremental vs differential for production | RTO requirements drive strategy; test restoration regularly |
| Change management exception | Emergency change bypasses CAB review | Post-implementation review required; document all emergency changes |

#### D8: Software Development Security (4 questions, 6 pool)

| Topic | Scenario Type | Management Decision |
|-------|--------------|-------------------|
| Security in SDLC budget | Justify shifting left costs | Early detection 100x cheaper than production fixes |
| Open source component risk | Library with known vulnerability in production | Risk assessment; patch timeline; compensating controls |
| Development methodology selection | Agile vs Waterfall for regulated environment | Compliance requirements may favor documentation-heavy methods |
| Code review requirements | Developer pushback on mandatory code review | Security gate in CI/CD pipeline; non-negotiable for production |
| Database access control design | Who approves database access levels? | Data owner approves; DBA implements; SoD enforced |
| Vendor software assessment | COTS vs open source for critical function | Total cost of ownership; support lifecycle; escrow agreement |

---

## 5. Grand Totals

| Component | Min Questions | Pool Target | Unique Topics |
|-----------|-------------|-------------|---------------|
| Field Test (8 domains) | 320 | 480+ | All Act 1+2 topics |
| Boss Battle (8 domains) | 640 | 800+ | All topics |
| Final Boss | 150 | 200+ | Cross-domain |
| TLATM Gauntlet | 30 | 47+ | Management perspective |
| **GRAND TOTAL** | **1,140** | **1,527+** | **~300 topics** |

### Questions Per Domain (All Components Combined)

| Domain | Field Test | Boss Battle | Final Boss | TLATM | Total Pool |
|--------|----------|------------|-----------|-------|------------|
| D1 | 60 | 100 | 30 | 9 | 199 |
| D2 | 60 | 100 | 20 | 5 | 185 |
| D3 | 60 | 100 | 26 | 6 | 192 |
| D4 | 60 | 100 | 26 | 5 | 191 |
| D5 | 60 | 100 | 26 | 5 | 191 |
| D6 | 60 | 100 | 24 | 5 | 189 |
| D7 | 60 | 100 | 26 | 6 | 192 |
| D8 | 60 | 100 | 22 | 6 | 188 |
| **TOTAL** | **480** | **800** | **200** | **47** | **1,527** |

---

## 6. Question Quality Standards

### Stem Construction

- Use CISSP-style language: "An organization...", "A security professional...", "Which of the following BEST..."
- Minimum 2 sentences for scenario-based questions
- Include relevant context (industry, regulation, situation)
- Avoid negatives in stems unless testing NOT/EXCEPT/LEAST
- For LEAST/EXCEPT questions, capitalize and bold the keyword
- Use "BEST," "MOST," "FIRST," "PRIMARY" to force best-answer thinking
- Avoid "always" and "never" in stems and options (CISSP rarely deals in absolutes)

### Answer Option Standards

- Exactly 4 options per question
- All options must be plausible within the domain
- Correct answer must be unambiguously the BEST choice
- Distractors should represent common misconceptions
- Options should be similar length (avoid longest-answer-is-correct pattern)
- Include "Think Like a Manager" perspective for correct answers where applicable
- Randomize correct answer position (avoid patterns like B being correct 40% of the time)
- Never use "All of the above" or "None of the above"

### Distractor Design Rules

| Distractor Type | Description | Example |
|----------------|-------------|---------|
| Adjacent concept | Correct for a related but different topic | Biba answer on a BLP question |
| Partially correct | True statement but not the BEST answer | Correct action but wrong sequence |
| Common misconception | What untrained candidates often believe | "Digital signatures provide confidentiality" |
| Technical-not-manager | Correct technical action but not management perspective | "Configure the firewall" vs "Approve the firewall policy" |
| Reversed definition | Swaps two commonly confused terms | Scoping answer on a tailoring question |
| Outdated practice | Was correct in older frameworks/standards | Forced password expiration (NIST no longer recommends) |

### Explanation Requirements

- Every question must have a detailed explanation
- Explain WHY the correct answer is best (not just that it is correct)
- Explain WHY each distractor is wrong (specifically, not generically)
- Include memory hack or exam tip where relevant
- Reference the related glossary term or story scene
- For calculation questions, show complete work with formula
- For process ordering, explain the full sequence even if only one step was tested

### Explanation Format

```
CORRECT: [Option letter] — [Brief statement]

WHY: [2-3 sentences explaining the reasoning, including the relevant principle or framework]

WHY NOT [A/B/C/D]: [1-2 sentences per distractor explaining the specific error]

MEMORY HACK: [Mnemonic, acronym, or memory palace anchor]

EXAM TIP: [Test-taking strategy relevant to this question type]

REFERENCE: [Glossary term] | [Story scene] | [Domain X, Topic Y]
```

### XP Awards Per Difficulty

| Difficulty | Correct XP | Wrong XP | Time Bonus |
|-----------|-----------|---------|-----------|
| Easy | 25 | 5 | +5 for < 30 seconds |
| Medium | 50 | 5 | +10 for < 45 seconds |
| Hard | 100 | 5 | +25 for < 60 seconds |

---

## 7. Adaptive Difficulty Rules (Final Boss)

### CAT-Like Behavior

The Final Boss simulates the CISSP CAT (Computerized Adaptive Testing) format:

| Rule | Specification |
|------|--------------|
| Starting difficulty | Medium |
| After correct answer | Next question is same or harder difficulty |
| After wrong answer | Next question is same or easier difficulty |
| Minimum questions | 100 (before pass/fail possible) |
| Maximum questions | 150 |
| Pass threshold | Sustained performance above passing standard for 75+ consecutive questions |
| Domain coverage | All 8 domains must be tested before pass/fail decision |
| No domain skip | Cannot pass without demonstrating competence in every domain |

### Difficulty Ladder

| Level | Internal Score | Question Characteristics |
|-------|---------------|------------------------|
| 1 (Easy) | Below standard | Knowledge/Recall, single-concept, short stem |
| 2 (Medium-Low) | Approaching standard | Comprehension, compare two concepts |
| 3 (Medium) | At standard | Application, apply concept to scenario |
| 4 (Medium-High) | Above standard | Application + Analysis, multi-concept scenario |
| 5 (Hard) | Well above standard | Analysis, cross-domain, management perspective, multi-step reasoning |

---

## 8. Gap Analysis Alignment Checklist

Every HIGH priority gap from the gap analysis must have questions in at least 2 quiz components. This checklist ensures coverage:

| Rank | HIGH Priority Gap | Field Test | Boss Battle | Final Boss | TLATM |
|------|------------------|-----------|------------|-----------|-------|
| 1 | PKI & Digital Certificates (D3) | 5 | 6 | 4 | 1 |
| 2 | Backup Strategies (D7) | 5 | 6 | 4 | 1 |
| 3 | Recovery Site Types (D7) | 4 | 5 | 3 | 1 |
| 4 | RAID Levels (D7) | 5 | 6 | 3 | 0 |
| 5 | Database Security (D8) | 5 | 12 | 4 | 1 |
| 6 | Control Type Classification (D1) | 4 | 5 | 3 | 0 |
| 7 | Digital Signatures (D3) | 4 | 5 | 3 | 0 |
| 8 | SAST vs DAST vs IAST (D6) | 4 | 5 | 3 | 0 |
| 9 | Key Management Lifecycle (D3) | 4 | 5 | 3 | 1 |
| 10 | Cloud Computing Security (D3) | 4 | 5 | 3 | 1 |
| 11 | DRP Testing Types (D7) | 4 | 5 | 3 | 1 |
| 12 | Development Methodologies (D8) | 5 | 6 | 3 | 1 |
| 13 | Maturity Models (D8) | 4 | 5 | 3 | 0 |
| 14 | Evidence Types & Rules (D7) | 4 | 5 | 3 | 0 |
| 15 | BIA Process (D7) | 4 | 5 | 3 | 1 |
| 16 | IP Laws (D1) | 4 | 5 | 3 | 0 |
| 17 | SOC 1/2/3 (D6) | 4 | 5 | 3 | 1 |
| 18 | Threat Modeling (D1) | 4 | 5 | 3 | 0 |
| 19 | Biometrics Deep Dive (D5) | 5 | 6 | 4 | 0 |
| 20 | Access Control Attacks (D5) | 5 | 6 | 4 | 0 |
| 21 | Fire Suppression (D3) | 4 | 5 | 2 | 1 |
| 22 | Pseudonymization/Tokenization/Anonymization (D2) | 4 | 5 | 3 | 0 |
| 23 | TCP/IP Model & Handshake (D4) | 3+3 | 4+4 | 3 | 0 |
| 24 | Secure Protocols (D4) | 4 | 5 | 4 | 0 |
| 25 | Email Security (D4) | 4 | 5 | 3 | 0 |
| 26 | NAC & 802.1X (D4) | 3 | 4 | 2 | 0 |
| 27 | Network Segmentation (D4) | 4 | 5 | 3 | 1 |
| 28 | DLP Types (D2) | 4 | 5 | 3 | 1 |
| 29 | Personnel Security Controls (D1) | 3 | 4 | 2 | 1 |
| 30 | Credentialed vs Uncredentialed Scanning (D6) | 3 | 4 | 2 | 0 |
| 31 | Red/Blue/Purple/White Teams (D6) | 3 | 4 | 2 | 0 |
| 32 | Code Review / Fagan Inspection (D6) | 4 | 5 | 3 | 0 |
| 33 | False Positives vs Negatives (D6) | 3 | 4 | 2 | 0 |
| 34 | CVE & CVSS (D6) | 3 | 4 | 2 | 0 |
| 35 | Validation vs Verification (D6) | 3 | 4 | 2 | 0 |
| 36 | Change Management Detail (D8) | 4 | 5 | 3 | 1 |
| 37 | RADIUS vs TACACS+ (D4/D5) | 3+4 | 3+5 | 3 | 0 |
| 38 | Zero Trust Architecture (D3/D4/D5) | 0+0+3 | 0+4+4 | 2 | 0 |
| 39 | Virtualization & Hypervisor (D3) | 4 | 5 | 2 | 1 |
| 40 | WRT & MTD Formula (D7) | 3 | 4 | 3 | 0 |
| 41 | Restoration Order (D7) | 3 | 4 | 2 | 0 |
| 42 | Investigation Types (D7) | 3 | 4 | 2 | 0 |
| 43 | Security Document Hierarchy (D1) | 4 | 5 | 3 | 1 |
| 44 | Accountability vs Responsibility (D1) | 3 | 4 | 2 | 0 |
| 45 | Scoping & Tailoring (D2) | 3 | 4 | 2 | 0 |
| 46 | CASB (D2) | 3 | 4 | 2 | 0 |
| 47 | Labeling vs Marking (D2) | 3 | 4 | 3 | 0 |
| 48 | Cryptanalytic Attacks (D3) | 3 | 4 | 2 | 0 |
| 49 | Micro-segmentation & Zero Trust (D4) | 0 | 4 | 2 | 1 |
| 50 | Session Management (D5) | 3 | 4 | 2 | 0 |
| 51 | Password Policy / NIST SP 800-63B (D5) | 3 | 3 | 2 | 0 |
| 52 | IP Addressing IPv4/IPv6 (D4) | 5 | 6 | 3 | 0 |
| 53 | DRM & IRM (D2) | 3 | 4 | 2 | 0 |
| 54 | Fuzz Testing (D6) | 3 | 4 | 2 | 0 |
| 55 | SSAE 18 / ISAE 3402 (D6) | 3 | 3 | 3 | 1 |

> **Validation Rule:** Before any quiz component ships, every row in this table must have at least the specified question count in the corresponding column. A zero (0) is acceptable only where that quiz component does not test that gap by design.

---

*This specification was generated from the CISSP Quest Master Gap Analysis (2026-03-08) and aligned with CISSP exam domain weights. All topic clusters reference either currently covered story content or identified gap topics with their priority ratings.*
