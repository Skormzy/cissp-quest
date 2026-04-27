# CISSP Coverage Checklist

> **What this is:** Master tracking document mapping every CISSP topic from the consolidated knowledge base to the corresponding **story scene** and **library topic**.
>
> **How to read it:**
> - ✅ Covered = explicit teaching in scene (knowledge check, memory hack, or TLATM) AND/OR library topic exists.
> - 🟡 Partial = mentioned in passing but not taught with reinforcement.
> - ❌ Gap = no scene and no library row.
>
> **Sources:**
> - Knowledge base: `source-material/knowledge-base/domain{1-8}-knowledge.md` and `complete-content-map.md` (275 topic bullets across 8 domains).
> - Story scenes: `src/lib/story-content.ts` (83 scenes, 17 wired diagrams as of 2026-04-27).
> - Library seed: `supabase-MASTER-seed.sql` (40 topics: 5 per domain).
>
> **Library coverage caveat:** This file marks a library topic as "Library Row Present" if the seed has it. Whether each row's `content_markdown`, `key_formulas`, `comparison_table`, `exam_tips`, `think_like_manager`, `memory_hack`, and quiz questions are populated *thoroughly* is a separate audit. Items flagged 🟡 mean "row exists, depth unverified."

---

## Domain 1 — Security and Risk Management (15%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 1.01 | CIA Triad | d1-s05 (memory_hack) | 1.1 CIA Triad | ✅ Covered |
| 1.02 | DAD Triad (Disclosure / Alteration / Destruction) | — | 🟡 part of 1.1 | ❌ Gap |
| 1.03 | Security Governance | d1-s06, d1-s11 | 1.3 Security Governance and Policies | ✅ Covered |
| 1.04 | Risk Concepts (threat, vulnerability, exposure) | d1-s06 | 1.2 Risk Management Frameworks | 🟡 Partial |
| 1.05 | Risk Treatment (Avoid / Mitigate / Transfer / Accept) | d1-s08 (choice) | 1.2 | ✅ Covered + diagram |
| 1.06 | Quantitative Risk (SLE, ALE, ARO, EF) | d1-s09 | 1.2 | ✅ Covered + diagram |
| 1.07 | Qualitative Risk Analysis | — | 1.2 | ❌ Gap |
| 1.08 | Risk Register | d1-s07 (evidence) | 1.2 | ✅ Covered |
| 1.09 | NIST RMF / ISO 31000 / FAIR | mention only | 1.2 | 🟡 Partial |
| 1.10 | GRC (Governance / Risk / Compliance) | d1-s06 | 1.3 | ✅ Covered + diagram |
| 1.11 | Policy Hierarchy (Policy/Standard/Procedure/Guideline) | d1-s11 | 1.3 | ✅ Covered + diagram |
| 1.12 | Due Care vs. Due Diligence | d1-s07 | 1.3 | ✅ Covered |
| 1.13 | Control Categories (Admin/Technical/Physical) | — | 🟡 — | ❌ Gap |
| 1.14 | Control Functions (Preventive/Detective/Corrective/Deterrent/Recovery/Compensating/Directive) | — | 🟡 — | ❌ Gap |
| 1.15 | BCP — Business Continuity Planning | d1-s12 | 1.4 BCP | ✅ Covered |
| 1.16 | DRP — Disaster Recovery Planning | d1-s12 | 1.4 | ✅ Covered |
| 1.17 | RTO / RPO / MTD / WRT | d1-s12 | 1.4 | ✅ Covered |
| 1.18 | BCP Testing types | d7-s09 | 1.4 | ✅ Covered + diagram |
| 1.19 | BIA — Business Impact Analysis | — | 1.4 | ❌ Gap |
| 1.20 | Types of Law (Criminal/Civil/Admin/Regulatory) | d1-s13 (memory_hack) | 1.5 Legal and Compliance | ✅ Covered |
| 1.21 | Major Regulations (GDPR/HIPAA/SOX/GLBA/PCI-DSS/CCPA) | mention only | 1.5 | 🟡 Partial |
| 1.22 | IP Protection (Copyright / Trademark / Patent / Trade Secret) | d1-s14 | 1.5 | ✅ Covered |
| 1.23 | **ISC2 Code of Ethics** (Preamble + 4 Canons) | — | — | ❌ **Critical gap** |
| 1.24 | Threat Modeling (STRIDE / PASTA / DREAD) | — | — | ❌ **Critical gap** |
| 1.25 | Personnel Security (separation of duties, job rotation, mandatory vacation, background check, NDA) | mention only | — | 🟡 Partial |
| 1.26 | Supply Chain Risk (SBOM, vendor assessment, SLA/SLR) | d8-s05 (touch) | — | 🟡 Partial |
| 1.27 | Security Awareness Training program | — | — | ❌ Gap |
| 1.28 | Roles (CEO/CISO/Asset Owner/Custodian/User/Auditor) | d2-s03 (data owner) | 1.3 | 🟡 Partial |
| 1.29 | Cost-benefit analysis / safeguard value | — | — | ❌ Gap |
| 1.30 | TLATM — governance decisions | d1-s15 (TLATM) | — | ✅ Covered |

**Domain 1 score: 18/30 covered, 8 partial, 4 gaps. Top gaps: ISC2 Ethics, Threat Modeling, Control Functions taxonomy.**

---

## Domain 2 — Asset Security (10%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 2.01 | Data Classification | d2-s03 | 2.1 Data Classification | ✅ Covered |
| 2.02 | Classification vs. Categorization distinction | — | 2.1 | ❌ Gap |
| 2.03 | Data Owner / Custodian / User roles | d2-s03 | 2.1 | ✅ Covered |
| 2.04 | Labeling vs. Marking | — | 2.1 | ❌ Gap |
| 2.05 | Data States (At Rest / In Transit / In Use) | d2-s04 | 2.2 Data Lifecycle and States | ✅ Covered |
| 2.06 | Data Lifecycle (Create/Use/Archive/Destroy) | d2-s07 (memory_hack) | 2.2 | ✅ Covered + diagram |
| 2.07 | Encryption At Rest (AES-256) | d2-s04 | 2.3 Data Protection Controls | ✅ Covered |
| 2.08 | Encryption In Transit (TLS) | d4-s05 | 2.3 / 4.4 | ✅ Covered + diagram |
| 2.09 | Encryption In Use (homomorphic / enclaves) | — | 2.3 | ❌ Gap |
| 2.10 | DLP — Data Loss Prevention | mention only | 2.3 | 🟡 Partial |
| 2.11 | CASB / DRM / IRM | — | 2.3 | ❌ Gap |
| 2.12 | Pseudonymization / Tokenization / Anonymization | — | 2.4 Privacy and Data Handling | ❌ Gap |
| 2.13 | Sanitization Levels (Clearing / Purging / Destruction) | d2-s09 | 2.5 Asset Management | ✅ Covered + diagram |
| 2.14 | Degaussing limits (magnetic only, not SSD) | — | 2.5 | ❌ Gap |
| 2.15 | Crypto-shredding | — | 2.5 | ❌ Gap |
| 2.16 | Data Remanence / slack space | — | 2.5 | ❌ Gap |
| 2.17 | Retention Policies / Legal Hold | d2-s06 | 2.5 | 🟡 Partial |
| 2.18 | EOL / EOS hardware lifecycle | — | 2.5 | ❌ Gap |
| 2.19 | Asset Inventory | d2-s10 | 2.5 | ✅ Covered |
| 2.20 | NIST 800-53 baselines (Low/Mod/High/Privacy) | — | — | ❌ Gap |
| 2.21 | Scoping / Tailoring controls | — | — | ❌ Gap |
| 2.22 | DPO — Data Protection Officer | — | 2.4 | ❌ Gap |
| 2.23 | E-discovery / Spoliation | — | — | ❌ Gap |
| 2.24 | Object reuse / declassification | — | — | ❌ Gap |
| 2.25 | TLATM — data ownership | — | — | ❌ Gap |

**Domain 2 score: 8/25 covered, 3 partial, 14 gaps. Top gaps: Sanitization edge cases, NIST baselines, Pseudonymization vs. Tokenization.**

---

## Domain 3 — Security Architecture and Engineering (13%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 3.01 | Bell-LaPadula model (Confidentiality, no read up / no write down) | d3-s03 | 3.1 Security Models | ✅ Covered + diagram |
| 3.02 | Biba model (Integrity, no read down / no write up) | d3-s06 | 3.1 | ✅ Covered + diagram |
| 3.03 | Clark-Wilson model | mention only | 3.1 | 🟡 Partial |
| 3.04 | Brewer-Nash (Chinese Wall) | — | 3.1 | ❌ Gap |
| 3.05 | Reference Monitor / Security Kernel | — | 3.1 | ❌ Gap |
| 3.06 | TCSEC / Orange Book | — | — | ❌ Gap |
| 3.07 | Common Criteria / EAL | — | — | ❌ Gap |
| 3.08 | Defense in Depth | d3-s09 | 3.3 Secure Design | ✅ Covered + diagram |
| 3.09 | Symmetric Cryptography (AES, DES, 3DES) | mention only | 3.2 Cryptography | 🟡 Partial |
| 3.10 | Asymmetric Cryptography (RSA, ECC, DH) | d3-s04 (RSA-1024) | 3.2 | 🟡 Partial |
| 3.11 | Hashing (SHA-2, SHA-3, MD5) | — | 3.2 | ❌ Gap |
| 3.12 | Digital Signatures | — | 3.4 PKI | ❌ Gap |
| 3.13 | PKI + Certificate Lifecycle | — | 3.4 | ❌ Gap |
| 3.14 | Diffie-Hellman key exchange | d4-s05 (mention) | 3.2 | 🟡 Partial |
| 3.15 | Key Management Lifecycle | d3-s04 (touch) | 3.2 | 🟡 Partial |
| 3.16 | Covert Channels (storage / timing) | d3-s02, d3-s03 | 3.3 | ✅ Covered |
| 3.17 | Hypervisor / VM isolation | d3-s08 | 3.3 | ✅ Covered |
| 3.18 | Cloud Shared Responsibility | — | 3.3 | ❌ Gap |
| 3.19 | RAID levels and redundancy | — | 3.5 Physical Security | ❌ Gap |
| 3.20 | Database security (multilevel, polyinstantiation, inference) | — | — | ❌ Gap |
| 3.21 | Memory protection / buffer overflow at architecture | — | — | ❌ Gap |
| 3.22 | Physical Security (locks, mantraps, CCTV, fences) | — | 3.5 | ❌ Gap |
| 3.23 | Environmental controls (HVAC, fire suppression) | — | 3.5 | ❌ Gap |
| 3.24 | Tempest / electromagnetic emanations | — | — | ❌ Gap |
| 3.25 | TLATM — architecture decisions | — | — | ❌ Gap |

**Domain 3 score: 5/25 covered, 6 partial, 14 gaps. Top gaps: PKI/digital signatures, hashing, Clark-Wilson + Brewer-Nash, physical security.**

---

## Domain 4 — Communication and Network Security (13%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 4.01 | OSI 7-layer model | d4-s03 | 4.1 OSI and TCP/IP | ✅ Covered + diagram |
| 4.02 | TCP/IP model | — | 4.1 | ❌ Gap |
| 4.03 | IP addressing / subnetting | — | 4.1 | ❌ Gap |
| 4.04 | Common ports (80, 443, 22, 53, 3389, 445) | — | 4.1 | ❌ Gap |
| 4.05 | ARP and ARP poisoning (Layer 2) | d4-s02, d4-s03 | 4.2 Network Attacks | ✅ Covered |
| 4.06 | DNS / DNSSEC / DoH | d4-s10 | 4.2 | ✅ Covered |
| 4.07 | DHCP and rogue DHCP | — | 4.2 | ❌ Gap |
| 4.08 | TLS 1.3 handshake + Forward Secrecy | d4-s05 | 4.4 VPNs and Secure Comm | ✅ Covered + diagram |
| 4.09 | IPSec (AH / ESP / Tunnel vs Transport) | d4-s07 | 4.4 | 🟡 Partial |
| 4.10 | SSL/TLS VPN | d4-s07 | 4.4 | ✅ Covered |
| 4.11 | Firewalls (stateless / stateful / NGFW) | — | 4.3 Firewalls | ❌ Gap |
| 4.12 | IDS / IPS | — | 4.3 | ❌ Gap |
| 4.13 | Proxy / Reverse proxy / WAF | — | 4.3 | ❌ Gap |
| 4.14 | Network Segmentation / DMZ / VLAN | d4-s06 (memory_hack) | 4.3 | ✅ Covered |
| 4.15 | NAC — Network Access Control | — | 4.3 | ❌ Gap |
| 4.16 | VLAN hopping / double-tagging | — | 4.2 | ❌ Gap |
| 4.17 | WPA2 / WPA3 / SAE | d4-s09 | 4.5 Wireless Security | ✅ Covered + diagram |
| 4.18 | 802.1X + EAP (EAP-TLS, PEAP, EAP-TTLS) | d4-s09 | 4.5 | 🟡 Partial (EAP-TLS only) |
| 4.19 | DDoS attacks and mitigation | — | 4.2 | ❌ Gap |
| 4.20 | Routing protocol security (BGP/OSPF) | — | 4.2 | ❌ Gap |
| 4.21 | VoIP / Unified Comms security | — | — | ❌ Gap |
| 4.22 | IoT / OT network security | — | — | ❌ Gap |
| 4.23 | SD-WAN security | — | — | ❌ Gap |
| 4.24 | TLATM — network containment | d4-s08 | — | ✅ Covered |
| 4.25 | Man-in-the-Middle (MITM) | d4-s03, d4-s05 | 4.2 | ✅ Covered |

**Domain 4 score: 9/25 covered, 2 partial, 14 gaps. Top gaps: Firewall types, IDS/IPS, DDoS, routing security.**

---

## Domain 5 — Identity and Access Management (13%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 5.01 | Authentication factors (Type 1 know / 2 have / 3 are) | — | 5.1 Authentication Factors | ❌ **Critical gap** |
| 5.02 | MFA and same-factor traps | — | 5.1 | ❌ Gap |
| 5.03 | Password policies (NIST 800-63B) | mention only | 5.1 | 🟡 Partial |
| 5.04 | Biometric types (fingerprint/iris/retina/face/voice/keystroke) | mention only | 5.1 | 🟡 Partial |
| 5.05 | Biometric FAR / FRR / CER | d5-s09 | 5.1 | ✅ Covered + diagram |
| 5.06 | Tokens (TOTP / HOTP / smart cards) | — | 5.1 | ❌ Gap |
| 5.07 | Access Control Models (DAC / MAC / RBAC / ABAC / Rule-based) | — | 5.2 Access Control Models | ❌ **Critical gap** |
| 5.08 | Least Privilege | d5-s03 | 5.4 Privilege Management | ✅ Covered + diagram |
| 5.09 | Need to Know | mention only | 5.4 | 🟡 Partial |
| 5.10 | Separation of Duties | mention only | 5.4 | 🟡 Partial |
| 5.11 | Privileged Access Management (PAM) | d5-s09 | 5.4 | ✅ Covered |
| 5.12 | Kerberos (AS / TGS / TGT / Service Ticket) | d5-s07 | 5.3 SSO and Federation | ✅ Covered + diagram |
| 5.13 | Kerberos attacks (Golden Ticket / Kerberoast / ASREPRoast) | — | 5.3 | ❌ Gap |
| 5.14 | OAuth 2.0 flows | d5-s06 (memory_hack) | 5.3 | ✅ Covered |
| 5.15 | OpenID Connect (OIDC) | mention only | 5.3 | 🟡 Partial |
| 5.16 | SAML | mention only | 5.3 | 🟡 Partial |
| 5.17 | RADIUS / TACACS+ / Diameter | — | 5.3 | ❌ Gap |
| 5.18 | LDAP / Active Directory | — | 5.3 | ❌ Gap |
| 5.19 | Zero Trust (NIST 800-207) | d5-s08 | — | ✅ Covered |
| 5.20 | Identity Lifecycle (Provision / Manage / Recertify / Deprovision) | d5-s03, d5-s05 | 5.5 Identity Lifecycle | ✅ Covered |
| 5.21 | Access Recertification | d5-s10 (TLATM) | 5.5 | ✅ Covered |
| 5.22 | Privilege Escalation (vertical / horizontal) | mention only | 5.4 | 🟡 Partial |
| 5.23 | Pass-the-hash / Mimikatz | — | — | ❌ Gap |
| 5.24 | Federated Identity (SAML / OIDC / SCIM) | — | 5.3 | ❌ Gap |
| 5.25 | Passwordless / FIDO2 / WebAuthn | — | — | ❌ Gap |
| 5.26 | TLATM — access governance | d5-s10 | — | ✅ Covered |

**Domain 5 score: 9/26 covered, 7 partial, 10 gaps. Top gaps: Auth factor taxonomy (Type 1/2/3), Access Control Models comparison.**

---

## Domain 6 — Security Assessment and Testing (12%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 6.01 | Vulnerability Assessment vs. Pentest distinction | — | 6.1 Vulnerability Assessments | ❌ Gap |
| 6.02 | PTES Phases (7 phases) | d6-s06 (memory_hack) | 6.2 Penetration Testing | ✅ Covered + diagram |
| 6.03 | Black-box / Gray-box / White-box | d6-s04 (mention) | 6.2 | 🟡 Partial |
| 6.04 | Red Team / Blue Team / Purple Team | d6-s08 | 6.2 | ✅ Covered |
| 6.05 | Bug Bounty programs | — | 6.2 | ❌ Gap |
| 6.06 | CVSS v3.1 scoring (Base/Temporal/Environmental) | d6-s05 | 6.1 | ✅ Covered |
| 6.07 | Vulnerability scanners (Nessus / OpenVAS / Qualys) | — | 6.1 | ❌ Gap |
| 6.08 | SAST | d6-s07, d8-s02 | 6.4 Application Testing | ✅ Covered + diagram |
| 6.09 | DAST | d6-s07 | 6.4 | ✅ Covered + diagram |
| 6.10 | IAST | d6-s07 | 6.4 | ✅ Covered |
| 6.11 | RASP | d6-s07 | 6.4 | ✅ Covered |
| 6.12 | Fuzzing | — | 6.4 | ❌ Gap |
| 6.13 | Code Review / Fagan inspection | — | 6.4 | ❌ Gap |
| 6.14 | Forensic image / write-blocker | d6-s02 | 7.4 Digital Forensics | ✅ Covered + diagram |
| 6.15 | Chain of Custody | d6-s02 | 7.4 | ✅ Covered |
| 6.16 | Evidence Volatility order (RFC 3227) | d7-s06 (memory_hack) | 7.4 | ✅ Covered + diagram |
| 6.17 | Threat Modeling (STRIDE) integration | d6-s08 (mention) | — | 🟡 Partial |
| 6.18 | Compliance audits (SOC 2 / ISO 27001) | d6-s09 (TLATM) | 6.3 Security Auditing | ✅ Covered |
| 6.19 | Log Review and Analysis | — | 6.4 Log Management | ❌ Gap |
| 6.20 | Security Metrics / KPIs | — | 6.5 Metrics | ❌ Gap |
| 6.21 | Configuration audits / hardening baselines | — | — | ❌ Gap |
| 6.22 | Pentest Rules of Engagement | mention only | 6.2 | 🟡 Partial |
| 6.23 | Findings reporting / Executive summary | mention only | 6.2 | 🟡 Partial |
| 6.24 | Remediation tracking | — | — | ❌ Gap |
| 6.25 | TLATM — assessment governance | d6-s09 | — | ✅ Covered |

**Domain 6 score: 11/25 covered, 4 partial, 10 gaps. Top gaps: Fuzzing, code review process, security metrics, vulnerability scanners.**

---

## Domain 7 — Security Operations (13%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 7.01 | NIST IR Lifecycle (Prep / Detect & Analyze / Contain · Eradicate · Recover / Post-Incident) | d7-s02 | 7.1 Incident Response | ✅ Covered + diagram |
| 7.02 | Incident classification / severity levels | — | 7.1 | ❌ Gap |
| 7.03 | Tabletop exercises | mention only | 7.1 | 🟡 Partial |
| 7.04 | SIEM | d7-s05 | 7.5 SOC | ✅ Covered + diagram |
| 7.05 | SOAR | d7-s05 | 7.5 | ✅ Covered + diagram |
| 7.06 | EDR / XDR / UEBA | — | 7.5 | ❌ Gap |
| 7.07 | Patch management lifecycle | — | 7.3 Change Management | ❌ Gap |
| 7.08 | Configuration management / baseline | mention only | 7.3 | 🟡 Partial |
| 7.09 | Change management process (RFC / CAB / approval) | — | 7.3 | ❌ Gap |
| 7.10 | Backup strategies (full / incremental / differential) | — | 7.2 Disaster Recovery | ❌ Gap |
| 7.11 | RTO / RPO achievement | d7-s04 | 7.2 | ✅ Covered |
| 7.12 | DR Site types (hot / warm / cold / mobile) | — | 7.2 | ❌ Gap |
| 7.13 | DR Test types (tabletop → full interruption) | d7-s09 | 7.2 | ✅ Covered + diagram |
| 7.14 | Ransomware response | d7-s08 (TLATM) | — | ✅ Covered |
| 7.15 | Forensic acquisition order | d7-s06 | 7.4 | ✅ Covered + diagram |
| 7.16 | Malware analysis / sandboxing | — | — | ❌ Gap |
| 7.17 | Threat intelligence (IoC / TTP / MITRE ATT&CK) | mention only | — | 🟡 Partial |
| 7.18 | Physical security ops (badges / mantraps / visitor logs) | — | — | ❌ Gap |
| 7.19 | Personnel safety / duress / evacuation | — | — | ❌ Gap |
| 7.20 | Vendor management / 3rd-party monitoring | — | — | ❌ Gap |
| 7.21 | Honey pots / honey nets / deception | — | — | ❌ Gap |
| 7.22 | Egress filtering / data exfiltration controls | mention only | — | 🟡 Partial |
| 7.23 | Cloud security operations | — | — | ❌ Gap |
| 7.24 | Capacity / performance monitoring | — | — | ❌ Gap |
| 7.25 | TLATM — IR governance | d7-s07, d7-s08 | — | ✅ Covered |

**Domain 7 score: 9/25 covered, 4 partial, 12 gaps. Top gaps: Backup strategies, DR site types, threat intel, physical ops.**

---

## Domain 8 — Software Development Security (11%)

| # | Topic | Story Scene | Library Topic | Status |
|---|-------|-------------|---------------|--------|
| 8.01 | SDLC phases (Req / Design / Develop / Test / Deploy / Maintain / Dispose) | mention only | 8.1 SDLC Security | 🟡 Partial |
| 8.02 | SDLC methodologies (Waterfall / Agile / Spiral / DevOps) | — | 8.1 | ❌ **Critical gap** |
| 8.03 | Maturity models (CMMI / SAMM / BSIMM / IDEAL) | — | 8.1 | ❌ Gap |
| 8.04 | Threat modeling in design phase | — | 8.1 | ❌ Gap |
| 8.05 | OWASP Top 10 (full list) | d8-s07 (top 5) | 8.2 OWASP Top 10 | 🟡 Partial |
| 8.06 | A01 Broken Access Control | d8-s07 | 8.2 | ✅ Covered + diagram |
| 8.07 | A03 Injection / SQL Injection | d8-s02 | 8.3 Secure Coding | ✅ Covered + diagram |
| 8.08 | A06 Vulnerable Components / Dep Confusion | d8-s05 | 8.2 | ✅ Covered + diagram |
| 8.09 | XSS (stored / reflected / DOM) | — | 8.3 | ❌ Gap |
| 8.10 | CSRF | — | 8.3 | ❌ Gap |
| 8.11 | Buffer overflow / memory safety | — | 8.3 | ❌ Gap |
| 8.12 | Race conditions / TOCTOU | — | 8.3 | ❌ Gap |
| 8.13 | Input validation / parameterized queries | mention only | 8.3 | 🟡 Partial |
| 8.14 | Secure error handling / logging | — | 8.3 | ❌ Gap |
| 8.15 | Session management (cookies / tokens) | — | 8.3 | ❌ Gap |
| 8.16 | API security (REST / GraphQL / rate limiting / mass assignment) | d8-s08 | — | ✅ Covered |
| 8.17 | DevSecOps pipeline gates (Code / Commit / Build / Test / Deploy / Runtime) | d8-s06 (memory_hack) | 8.1 | ✅ Covered + diagram |
| 8.18 | CI/CD security | d8-s05, d8-s06 | 8.1 | ✅ Covered |
| 8.19 | Container / image scanning | mention only | — | 🟡 Partial |
| 8.20 | IaC scanning (Terraform / CloudFormation) | mention only | — | 🟡 Partial |
| 8.21 | Code obfuscation / signing | — | — | ❌ Gap |
| 8.22 | Database security (SQL / ACID / inference / aggregation) | — | 8.5 Database Security | ❌ Gap |
| 8.23 | OOP concepts (encapsulation / cohesion / coupling) | — | — | ❌ Gap |
| 8.24 | COTS vs. open-source vs. custom | mention only | — | 🟡 Partial |
| 8.25 | Software acquisition / licensing | — | — | ❌ Gap |
| 8.26 | TLATM — DevSecOps mandate | d8-s09 | — | ✅ Covered |

**Domain 8 score: 8/26 covered, 7 partial, 11 gaps. Top gaps: SDLC methodologies, XSS/CSRF/buffer overflow specifics, database dev security, maturity models.**

---

## Cross-Domain Critical Gaps (Top 10 Priority)

| Priority | Topic | Domain | Why it matters |
|----------|-------|--------|----------------|
| 1 | **ISC2 Code of Ethics** (Preamble + 4 Canons) | D1 | Appears on nearly every CISSP exam. Foundational to certification. |
| 2 | **Threat Modeling (STRIDE / PASTA / DREAD)** | D1 / D3 / D8 | 15% D1 + design questions. Multi-domain. |
| 3 | **Access Control Models (DAC / MAC / RBAC / ABAC / Rule-based)** | D5 | 13% weight. Comparison questions are standard. |
| 4 | **Authentication Factor Taxonomy (Type 1/2/3 + same-factor MFA traps)** | D5 | Frequent "is this MFA?" trap questions. |
| 5 | **Control Functions matrix (Preventive/Detective/Corrective/Deterrent/Recovery/Compensating/Directive)** | D1 | Control category questions appear in every domain. |
| 6 | **SDLC Methodologies (Waterfall / Spiral / Agile / DevOps)** | D8 | "Identify the methodology" scenarios. |
| 7 | **PKI + Digital Signatures + Certificate Lifecycle** | D3 | Domain 3 cryptography is 13% weight. |
| 8 | **Firewalls + IDS/IPS + WAF/Proxy** | D4 | Network defense fundamentals. |
| 9 | **OWASP Top 10 full coverage (XSS, CSRF, SSRF, etc.)** | D8 | Story covers only 4 of 10. |
| 10 | **Data Sanitization edge cases (SSD, degaussing limits, crypto-shredding)** | D2 | Frequent trap questions. |

---

## Coverage Summary by Domain

| Domain | Topics | ✅ Covered | 🟡 Partial | ❌ Gap | Coverage % |
|--------|--------|-----------|-----------|--------|------------|
| D1 Security & Risk | 30 | 18 | 8 | 4 | 60% |
| D2 Asset Security | 25 | 8 | 3 | 14 | 32% |
| D3 Architecture & Engineering | 25 | 5 | 6 | 14 | 20% |
| D4 Network Security | 25 | 9 | 2 | 14 | 36% |
| D5 IAM | 26 | 9 | 7 | 10 | 35% |
| D6 Assessment & Testing | 25 | 11 | 4 | 10 | 44% |
| D7 Security Operations | 25 | 9 | 4 | 12 | 36% |
| D8 Software Development | 26 | 8 | 7 | 11 | 31% |
| **TOTAL** | **207** | **77** | **41** | **89** | **37%** |

---

## What this means

**The story mode covers the highest-impact narrative concepts well** — risk quantification, model comparison, incident response containment, modern auth flows. **The library has rows for every major topic area** (40 topics seeded).

**What's missing:**
1. **Story-side:** ~89 topics have no scene at all and another 41 are mentioned without reinforcement. The biggest gaps are the foundational frameworks an exam-taker needs as anchors (ethics, threat modeling, access control models, control functions) plus the long tail of network and crypto specifics (PKI, firewalls, IDS, hashing, XSS/CSRF).
2. **Library-side:** All 40 seeded topics have a row, but `content_markdown` depth is unverified for most. The screenshot of "5.4 Privilege Management" showed thin content — that's likely typical, not the exception. A thorough audit means populating every topic with: 1-liner, memory anchor, 5+ paragraphs of original prose, diagram (now possible via the concept-diagram registry), 1+ key formula or comparison, exam tips, "Think Like a Manager" framing, memory hack, AND linked quiz questions.

**Recommended next sprint** (post-redesign):
- **Story content sprint:** Author scenes for the 10 critical-gap topics. These should be inserted into existing domain chapters rather than appended (e.g., put ISC2 Ethics in Domain 1 between Tanaka's intro and the risk register reveal).
- **Library content sprint:** Pick the lightest 10 library topics, expand each one with the full content schema (1-liner → markdown → diagram → flashcards → quiz). The diagram + flashcard pieces are now wired automatically — you only need to write prose.
- **Library expansion:** The seed has only 5 topics per domain. To match the KB depth, expand to ~25 topics per domain (200 total), one per major bullet from the consolidated knowledge base.

This file is the working document. Update it as topics get authored.
