# CISSP Quest — Comprehensive Coverage Matrix

> **Snapshot:** 2026-04-27 post-Sprint G (100% closeout)
>
> **Counts:**
> - Story scenes: **177** (15 closeout scenes added in Sprint G)
> - Library topics in DB: **76**
> - Questions in DB: **240** (30/domain)
> - **Question gap to "many many per topic"**: ~3,000-5,000 questions needed (see Question Bank Expansion Plan below)

For each CISSP topic this matrix reports:
- ✅ / 🟡 / ❌ status
- **Story scene IDs** that teach it
- **Library row** (topic_number) that documents it
- **Question count** currently testing it (live DB query)

Topics flagged 🟡 = "covered but light"; ❌ = "no scene yet" (none should remain after Sprint G).

---

## DOMAIN 1 — Security and Risk Management (15% exam weight)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 1.1 | CIA Triad | ✅ | d1-s05 (memory_hack) | 1.1 | 2 |
| 1.2 | DAD Triad | ✅ | d1-s15f (memory_hack) | 1.1 | (in 1.1) |
| 1.3 | Security Governance | ✅ | d1-s06, d1-s11 | 1.3 | 8 |
| 1.4 | Risk Concepts (threat/vuln/exposure) | ✅ | d1-s06 | 1.2 | 6 |
| 1.5 | Risk Treatment (AMTA) | ✅ | d1-s08 (choice) | 1.2 | (in 1.2) |
| 1.6 | Quantitative Risk (SLE/ALE/ARO) | ✅ | d1-s09 | 1.2 | (in 1.2) |
| 1.7 | Qualitative Risk Analysis | ✅ | d1-s15g | 1.9 | 0 |
| 1.8 | Risk Register | ✅ | d1-s07 (evidence) | 1.2 | (in 1.2) |
| 1.9 | NIST RMF / ISO 31000 / FAIR | ✅ | d1-s06, d1-c01 | 1.2 | (in 1.2) |
| 1.10 | GRC | ✅ | d1-s06 | 1.3 | (in 1.3) |
| 1.11 | Policy Hierarchy | ✅ | d1-s11 | 1.3 | (in 1.3) |
| 1.12 | Due Care vs. Due Diligence | ✅ | d1-s07 | 1.3 | (in 1.3) |
| 1.13 | Control Categories (Admin/Tech/Phys) | ✅ | d1-s15d | 1.7.1 | 0 |
| 1.14 | Control Functions (7 types) | ✅ | d1-s15d | 1.7.1 | (in 1.7.1) |
| 1.15 | BCP | ✅ | d1-s12 | 1.4 | 6 |
| 1.16 | DRP | ✅ | d1-s12 | 1.4 | (in 1.4) |
| 1.17 | RTO/RPO/MTD/WRT | ✅ | d1-s12, d1-s15h | 1.4 | (in 1.4) |
| 1.18 | BCP Testing types | ✅ | d7-s09, d1-s12 | 1.4 | (in 1.4) |
| 1.19 | BIA | ✅ | d1-s15h | 1.4 | (in 1.4) |
| 1.20 | Types of Law | ✅ | d1-s13 | 1.5 | 8 |
| 1.21 | Major Regulations (HIPAA/SOX/GDPR/etc.) | ✅ | d1-s15i, d1-c03 | 1.5 | (in 1.5) |
| 1.22 | IP Protection | ✅ | d1-s14 | 1.5 | (in 1.5) |
| 1.23 | ISC2 Code of Ethics | ✅ | d1-s15b | 1.5 | (in 1.5) |
| 1.24 | Threat Modeling (STRIDE/PASTA/DREAD) | ✅ | d1-s15c, d8-c03 | 1.6 | 0 |
| 1.25 | Personnel Security (SoD/Rotation/Vacation) | ✅ | d1-s15e | 1.8 | 0 |
| 1.26 | Supply Chain Risk | ✅ | d8-s05, d8-s15 | (cross D1/D8) | (in 8.7) |
| 1.27 | Security Awareness Training | ✅ | d1-s15j | 1.10 | 0 |
| 1.28 | Roles (CEO/CISO/Owner/Custodian) | ✅ | d2-s03, d1-s15d | 1.3 | (in 1.3) |
| 1.29 | Cost-benefit / Safeguard Value | ✅ | d1-s15k | 1.2 | (in 1.2) |
| 1.30 | TLATM governance | ✅ | d1-s15 (TLATM) | — | — |
| 1.31 | COBIT / ITIL / CMM | ✅ | d1-c01 | 1.3 | (in 1.3) |
| 1.32 | Vendor risk lifecycle | ✅ | d1-c02 | 1.3 | (in 1.3) |
| 1.33 | Specialty regs (ITAR/CMMC/PIPL/FedRAMP) | ✅ | d1-c03 | 1.5 | (in 1.5) |

**D1 status: 33/33 topics covered. Story scenes: 22. Library rows: 9. Questions: 30.**

---

## DOMAIN 2 — Asset Security (10%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 2.1 | Data Classification | ✅ | d2-s03 | 2.1 | 6 |
| 2.2 | Classification vs Categorization | ✅ | d2-s13 | 2.1 | (in 2.1) |
| 2.3 | Data Owner/Custodian/User roles | ✅ | d2-s03 | 2.1 | (in 2.1) |
| 2.4 | Labeling vs Marking | ✅ | d2-s14 | 2.1 | (in 2.1) |
| 2.5 | Data States (At Rest/Transit/Use) | ✅ | d2-s04 | 2.2 | 4 |
| 2.6 | Data Lifecycle (CUAD) | ✅ | d2-s07 (memory_hack) | 2.2 | (in 2.2) |
| 2.7 | Encryption At Rest | ✅ | d2-s04 | 2.3 | 6 |
| 2.8 | Encryption In Transit | ✅ | d4-s05 | 2.3 / 4.4 | (in 2.3) |
| 2.9 | Encryption In Use (FHE/TEE/MPC) | ✅ | d2-s15 | 2.3 | (in 2.3) |
| 2.10 | DLP | ✅ | d2-s16 | 2.3 / 2.8.1 | 0 |
| 2.11 | CASB / DRM / IRM | ✅ | d2-s16 | 2.3 | (in 2.3) |
| 2.12 | Pseudonymization/Tokenization/Anonymization | ✅ | d2-s17 | 2.4 / 2.7.1 | 0 |
| 2.13 | Sanitization Levels (Clear/Purge/Destroy) | ✅ | d2-s09 | 2.5 / 2.6.1 | 8 |
| 2.14 | Degaussing limits (SSD trap) | ✅ | d2-s11 | 2.5 | (in 2.5) |
| 2.15 | Crypto-shredding | ✅ | d2-s11 | 2.5 | (in 2.5) |
| 2.16 | Data Remanence | ✅ | d2-s18 | 2.5 | (in 2.5) |
| 2.17 | Retention / Legal Hold | ✅ | d2-s06, d2-s21 | 2.5 / 2.5.1 | 0 |
| 2.18 | EOL / EOS lifecycle | ✅ | d2-s19 | 2.5 | (in 2.5) |
| 2.19 | Asset Inventory | ✅ | d2-s10 | 2.5 | (in 2.5) |
| 2.20 | NIST 800-53 baselines | ✅ | d2-s12 | 2.1 | (in 2.1) |
| 2.21 | Scoping / Tailoring | ✅ | d2-s12 | 2.1 | (in 2.1) |
| 2.22 | DPO + Privacy Roles | ✅ | d2-s20 | 2.4 | 6 |
| 2.23 | E-discovery / Spoliation | ✅ | d2-s21 | 2.5 | (in 2.5) |
| 2.24 | Object reuse / Declassification | ✅ | d2-s21 | 2.5 | (in 2.5) |
| 2.25 | Data discovery / Auto-classification | ✅ | d2-c01 | 2.1 | (in 2.1) |
| 2.26 | GDPR cross-border (Adequacy/SCCs/BCRs) | ✅ | d2-c02 | 2.4 | (in 2.4) |

**D2 status: 26/26 covered. Scenes: 21. Library rows: 9. Questions: 30.**

---

## DOMAIN 3 — Security Architecture and Engineering (13%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 3.1 | Bell-LaPadula | ✅ | d3-s03 | 3.1 | 4 |
| 3.2 | Biba | ✅ | d3-s06 | 3.1 | (in 3.1) |
| 3.3 | Clark-Wilson | ✅ | d3-s12 | 3.1 | (in 3.1) |
| 3.4 | Brewer-Nash (Chinese Wall) | ✅ | d3-s12 | 3.1 | (in 3.1) |
| 3.5 | Reference Monitor / Security Kernel | ✅ | d3-s13 | 3.3 | 8 |
| 3.6 | TCSEC / ITSEC / Common Criteria | ✅ | d3-s14 | 3.1 | (in 3.1) |
| 3.7 | Defense in Depth | ✅ | d3-s09 | 3.3 / 3.9 | 0 |
| 3.8 | Symmetric Crypto | ✅ | d3-s11 | 3.2 | 8 |
| 3.9 | Asymmetric Crypto | ✅ | d3-s04, d3-s11 | 3.2 | (in 3.2) |
| 3.10 | Hashing | ✅ | d3-s11 | 3.2 | (in 3.2) |
| 3.11 | Digital Signatures | ✅ | d3-s10 | 3.4 | 4 |
| 3.12 | PKI + Cert Lifecycle | ✅ | d3-s10 | 3.4 | (in 3.4) |
| 3.13 | Diffie-Hellman | ✅ | d4-s05, d3-s11, d3-c05 | 3.2 | (in 3.2) |
| 3.14 | Key Management | ✅ | d3-s04 | 3.2 | (in 3.2) |
| 3.15 | Covert Channels | ✅ | d3-s02, d3-s03 | 3.3 | (in 3.3) |
| 3.16 | Hypervisor / VM isolation | ✅ | d3-s08 | 3.6 | 0 |
| 3.17 | Cloud Shared Responsibility | ✅ | d3-s17 | 3.6 | (in 3.6) |
| 3.18 | RAID + Redundancy | ✅ | d3-s16 | 3.5 | 6 |
| 3.19 | Database Security (inference/aggregation) | ✅ | d3-s15 | 8.5 | 2 |
| 3.20 | Memory Protection / Buffer Overflow | ✅ | d8-s11, d8-c03 | 8.3 | 10 |
| 3.21 | Physical Security | ✅ | d3-s18 | 3.5 | (in 3.5) |
| 3.22 | Environmental Controls (HVAC/Fire) | ✅ | d3-s18, d7-c02 | 3.5 | (in 3.5) |
| 3.23 | TEMPEST / EM emanations | ✅ | d3-c03 | 3.7 | 0 |
| 3.24 | TLATM architecture | ✅ | d3-s10 (memory_hack) | — | — |
| 3.25 | SABSA / TOGAF / Zachman / NIST 800-160 | ✅ | d3-c01 | 3.3 | (in 3.3) |
| 3.26 | TPM / HSM / Secure Boot / TEE / FIPS 140 | ✅ | d3-c02 | 3.8 | 0 |
| 3.27 | Side-channel attacks (timing/power/EM/fault/cold-boot/Spectre) | ✅ | d3-c03 | 3.7 | (in 3.7) |
| 3.28 | Quantum / PQC (Shor/Grover/Kyber/Dilithium) | ✅ | d3-c04 | 3.2 | (in 3.2) |
| 3.29 | Advanced primitives (HMAC/AEAD/KDF/ZKP/Shamir/FPE) | ✅ | d3-c05 | 3.2 | (in 3.2) |

**D3 status: 29/29 covered. Scenes: 18. Library rows: 9. Questions: 30.**

---

## DOMAIN 4 — Communication and Network Security (13%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 4.1 | OSI 7-layer | ✅ | d4-s03 | 4.1 | 6 |
| 4.2 | TCP/IP model | ✅ | d4-s12 | 4.1 | (in 4.1) |
| 4.3 | IP addressing / subnetting | ✅ | d4-s13 | 4.1 | (in 4.1) |
| 4.4 | Common ports | ✅ | d4-s12 | 4.1 | (in 4.1) |
| 4.5 | ARP + ARP poisoning | ✅ | d4-s02, d4-s03 | 4.2 | 6 |
| 4.6 | DNS / DNSSEC / DoH | ✅ | d4-s10, d4-s14 | 4.2 / 4.6 | 0 |
| 4.7 | DHCP / Rogue DHCP | ✅ | d4-s14 | 4.2 | (in 4.2) |
| 4.8 | TLS 1.3 + Forward Secrecy | ✅ | d4-s05 | 4.4 | 4 |
| 4.9 | IPSec (AH/ESP/Tunnel/Transport) | ✅ | d4-s07 | 4.4 | (in 4.4) |
| 4.10 | SSL/TLS VPN | ✅ | d4-s07 | 4.4 | (in 4.4) |
| 4.11 | Firewalls (5 generations) | ✅ | d4-s11 | 4.3 | 8 |
| 4.12 | IDS / IPS | ✅ | d4-s11 | 4.3 | (in 4.3) |
| 4.13 | Proxy / Reverse / WAF | ✅ | d4-s11 | 4.3 | (in 4.3) |
| 4.14 | Network Segmentation / DMZ | ✅ | d4-s06 | 4.3 | (in 4.3) |
| 4.15 | NAC + Port Security | ✅ | d4-s18 | 4.8 | 0 |
| 4.16 | VLAN hopping | ✅ | d4-s15 | 4.2 | (in 4.2) |
| 4.17 | WPA2/WPA3/SAE | ✅ | d4-s09 | 4.5 | 6 |
| 4.18 | 802.1X + EAP methods | ✅ | d4-s09 | 4.5 | (in 4.5) |
| 4.19 | DDoS attacks + defenses | ✅ | d4-s16 | 4.2 | (in 4.2) |
| 4.20 | Routing security (BGP/OSPF/RPKI) | ✅ | d4-s17 | 4.9 | 0 |
| 4.21 | VoIP / UC security | ✅ | d4-s19 | 4.7 | 0 |
| 4.22 | IoT / OT (Purdue / Modbus) | ✅ | d4-s20 | 4.9 | (in 4.9) |
| 4.23 | SD-WAN / SASE | ✅ | d4-s21 | 4.9 | (in 4.9) |
| 4.24 | TLATM network containment | ✅ | d4-s08 | — | — |
| 4.25 | MITM | ✅ | d4-s03, d4-s05 | 4.2 | (in 4.2) |
| 4.26 | TCP internals + Port scan techniques | ✅ | d4-c01 | 4.2 | (in 4.2) |
| 4.27 | IPv6 essentials | ✅ | d4-c02 | 4.1 | (in 4.1) |
| 4.28 | Storage networking + SDN/NFV | ✅ | d4-c03 | 4.9 | (in 4.9) |
| 4.29 | Network forensics + NAT/PAT + MPLS | ✅ | d4-c04 | 4.2 | (in 4.2) |

**D4 status: 29/29 covered. Scenes: 21. Library rows: 9. Questions: 30.**

---

## DOMAIN 5 — Identity and Access Management (13%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 5.1 | Auth Factors (Type 1/2/3) | ✅ | d5-s02b | 5.1 / 5.3.1 | 8 |
| 5.2 | MFA + same-factor traps | ✅ | d5-s02b | 5.1 | (in 5.1) |
| 5.3 | Password policies (NIST 800-63B) | ✅ | d5-s07 (mention), d5-c03 | 5.1 | (in 5.1) |
| 5.4 | Biometric types | ✅ | d5-s09 | 5.1 | (in 5.1) |
| 5.5 | Biometric FAR/FRR/CER | ✅ | d5-s09 | 5.1 | (in 5.1) |
| 5.6 | Tokens (TOTP/HOTP/Smart cards/U2F) | ✅ | d5-s06, d5-s17 | 5.1 | (in 5.1) |
| 5.7 | Access Control Models (DAC/MAC/RBAC/ABAC/Rule) | ✅ | d5-s02c | 5.2 / 5.6.1 | 8 |
| 5.8 | Least Privilege | ✅ | d5-s03 | 5.4 | 4 |
| 5.9 | Need to Know | ✅ | d5-s03 | 5.4 | (in 5.4) |
| 5.10 | Separation of Duties | ✅ | d1-s15e | 5.4 | (in 5.4) |
| 5.11 | PAM | ✅ | d5-s09 | 5.4 / 5.7.1 | 0 |
| 5.12 | Kerberos (AS/TGS/TGT/Service Ticket) | ✅ | d5-s07 | 5.3 / 5.4.1 | 6 |
| 5.13 | Kerberos attacks (Roast/AS-REP/DCSync/Golden) | ✅ | d5-s14 | 5.3 | (in 5.3) |
| 5.14 | OAuth 2.0 flows | ✅ | d5-s06 | 5.3 | (in 5.3) |
| 5.15 | OpenID Connect (OIDC) | ✅ | d5-s12 | 5.3 | (in 5.3) |
| 5.16 | SAML | ✅ | d5-s11 | 5.3 / 5.5.1 | 0 |
| 5.17 | RADIUS / TACACS+ / Diameter | ✅ | d5-s13 | 5.3 | (in 5.3) |
| 5.18 | LDAP / Active Directory | ✅ | d5-s14 | 5.3 | (in 5.3) |
| 5.19 | Zero Trust (NIST 800-207) | ✅ | d5-s08, d8-s14 | (cross) | — |
| 5.20 | Identity Lifecycle (JML) | ✅ | d5-s16 | 5.5 | 4 |
| 5.21 | Access Recertification | ✅ | d5-s10 (TLATM) | 5.5 | (in 5.5) |
| 5.22 | Privilege Escalation | ✅ | d5-s14 (mention) | 5.4 | (in 5.4) |
| 5.23 | Pass-the-Hash / Mimikatz | ✅ | d5-s15 | 5.4 | (in 5.4) |
| 5.24 | Federated Identity / SCIM | ✅ | d5-s18 | 5.3 | (in 5.3) |
| 5.25 | FIDO2 / WebAuthn / Passkeys | ✅ | d5-s17 | 5.1 | (in 5.1) |
| 5.26 | TLATM access governance | ✅ | d5-s10 | — | — |
| 5.27 | JIT / JEA / Tiered Admin / LAPS | ✅ | d5-c01 | 5.4 | (in 5.4) |
| 5.28 | MFA bypass attacks (Push/SIM/AiTM/OAuth/Session) | ✅ | d5-c02 | 5.1 | (in 5.1) |
| 5.29 | Lockout + session policy | ✅ | d5-c03 | 5.1 | (in 5.1) |
| 5.30 | JWT structure + signing | ✅ | d5-s12 | 5.3 | (in 5.3) |

**D5 status: 30/30 covered. Scenes: 18. Library rows: 11. Questions: 30.**

---

## DOMAIN 6 — Security Assessment and Testing (12%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 6.1 | Vuln Assessment vs Pentest | ✅ | d6-s10 | 6.1 / 6.2.1 | 6 |
| 6.2 | PTES Phases | ✅ | d6-s06 | 6.2 / 6.3.1 | 8 |
| 6.3 | Black/Gray/White Box | ✅ | d6-s04 | 6.2 | (in 6.2) |
| 6.4 | Red/Blue/Purple Team | ✅ | d6-s08 | 6.2 | (in 6.2) |
| 6.5 | Bug Bounty | ✅ | d6-c02 | 6.2 | (in 6.2) |
| 6.6 | CVSS v3.1 | ✅ | d6-s05 | 6.1 | (in 6.1) |
| 6.7 | Vuln scanners | ✅ | d6-s10 (mention) | 6.1 | (in 6.1) |
| 6.8 | SAST | ✅ | d6-s07, d8-s02 | 8.4 / 6.4.1 | 4 |
| 6.9 | DAST | ✅ | d6-s07 | 8.4 | (in 8.4) |
| 6.10 | IAST | ✅ | d6-s07 | 8.4 | (in 8.4) |
| 6.11 | RASP | ✅ | d6-s07 | 8.4 | (in 8.4) |
| 6.12 | Fuzzing | ✅ | d6-s11 | 8.4 | (in 8.4) |
| 6.13 | Code Review / Fagan | ✅ | d6-s11 | 6.3 | 6 |
| 6.14 | Forensic image / write-blocker | ✅ | d6-s02 | 7.4 | 6 |
| 6.15 | Chain of Custody | ✅ | d6-s02 | 7.4 | (in 7.4) |
| 6.16 | Evidence Volatility | ✅ | d7-s06 | 7.4 / 7.6.1 | 0 |
| 6.17 | Threat Modeling integration | ✅ | d1-s15c, d6-s08 | 1.6 | 0 |
| 6.18 | Compliance audits (SOC 2 / ISO 27001) | ✅ | d6-s09 | 6.3 | (in 6.3) |
| 6.19 | Log Review / Analysis | ✅ | d7-s05, d6-c01 | 6.4 / 6.6.1 | 4 |
| 6.20 | Security Metrics / KPIs / KRIs | ✅ | d6-s12 | 6.5 / 6.5.1 | 6 |
| 6.21 | Configuration audits / hardening | ✅ | d7-s12 | 7.3 | 6 |
| 6.22 | Pentest Rules of Engagement | ✅ | d6-s06 | 6.2 | (in 6.2) |
| 6.23 | Findings reporting | ✅ | d6-s06 | 6.2 | (in 6.2) |
| 6.24 | Remediation tracking | ✅ | d6-c01 | 6.5 | (in 6.5) |
| 6.25 | TLATM assessment governance | ✅ | d6-s09 | — | — |
| 6.26 | Third-party attestations (SOC/ISO/FedRAMP/StateRAMP/BSI) | ✅ | d6-c01 | 6.3 | (in 6.3) |
| 6.27 | Vulnerability disclosure / VDP | ✅ | d6-c02 | 6.1 | (in 6.1) |

**D6 status: 27/27 covered. Scenes: 12. Library rows: 11. Questions: 30.**

---

## DOMAIN 7 — Security Operations (13%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 7.1 | NIST IR Lifecycle (4 phases) | ✅ | d7-s02 | 7.1 / 7.5.1 | 8 |
| 7.2 | Incident classification / severity | ✅ | d7-s10 | 7.1 | (in 7.1) |
| 7.3 | Tabletop exercises | ✅ | d7-s09 | 7.1 | (in 7.1) |
| 7.4 | SIEM | ✅ | d7-s05 | 7.5 | 2 |
| 7.5 | SOAR | ✅ | d7-s05 | 7.5 | (in 7.5) |
| 7.6 | EDR / XDR / UEBA / NDR / MDR | ✅ | d7-s11 | 7.5 | (in 7.5) |
| 7.7 | Patch management lifecycle | ✅ | d7-s12 | 7.3 | 6 |
| 7.8 | Configuration management / baseline | ✅ | d7-s12 | 7.3 / 7.7.1 | 0 |
| 7.9 | Change management process (RFC/CAB) | ✅ | d7-s12 | 7.3 | (in 7.3) |
| 7.10 | Backup strategies (Full/Incr/Diff/Synthetic) | ✅ | d7-s13 | 7.2 / 7.8.1 | 0 |
| 7.11 | RTO/RPO achievement | ✅ | d7-s04 | 7.2 | 8 |
| 7.12 | DR Site types (Cold/Warm/Hot/Mirrored) | ✅ | d7-s14 | 7.2 | (in 7.2) |
| 7.13 | DR Test types | ✅ | d7-s09 | 7.2 | (in 7.2) |
| 7.14 | Ransomware response | ✅ | d7-s08 (TLATM) | 7.1 | (in 7.1) |
| 7.15 | Forensic acquisition order | ✅ | d7-s06 | 7.4 | 6 |
| 7.16 | Malware analysis / sandboxing | ✅ | d7-s16 | 7.5 | (in 7.5) |
| 7.17 | Threat intel + MITRE ATT&CK | ✅ | d7-s15 | 7.5 | (in 7.5) |
| 7.18 | Physical security ops | ✅ | d7-c02 | 3.5 / 7.9.1 | 0 |
| 7.19 | Personnel safety / duress | ✅ | d7-c02 | 7.9.1 | (in 7.9.1) |
| 7.20 | Vendor management / 3rd-party monitoring | ✅ | d1-c02 | 1.3 | (in 1.3) |
| 7.21 | Honeypots / deception | ✅ | d7-c03 | 7.5 | (in 7.5) |
| 7.22 | Egress filtering | ✅ | d4-s10, d4-s11 | 4.3 | (in 4.3) |
| 7.23 | Cloud security operations | ✅ | d3-s17, d4-c03 | 3.6 / 4.9 | 0 |
| 7.24 | Capacity / performance monitoring | ✅ | d7-c01 | 7.5 | (in 7.5) |
| 7.25 | TLATM IR governance | ✅ | d7-s07, d7-s08 | — | — |
| 7.26 | Resource provisioning + SLA/OLA/SLO/SLI | ✅ | d7-c01 | 7.5 | (in 7.5) |
| 7.27 | CSIRT structure + ISACs | ✅ | d7-c01 | 7.1 | (in 7.1) |

**D7 status: 27/27 covered. Scenes: 16. Library rows: 11. Questions: 30.**

---

## DOMAIN 8 — Software Development Security (11%)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| 8.1 | SDLC phases | ✅ | d8-s06 | 8.1 | 8 |
| 8.2 | SDLC methodologies (Waterfall/Spiral/Agile/DevOps) | ✅ | d8-s04b | 8.1 | (in 8.1) |
| 8.3 | Maturity models (CMMI/SAMM/BSIMM/IDEAL/SSDF) | ✅ | d8-c01 | 8.1 | (in 8.1) |
| 8.4 | Threat modeling in design | ✅ | d1-s15c, d8-c03 | 1.6 | 0 |
| 8.5 | OWASP Top 10 full list | ✅ | d8-s11 | 8.2 | 6 |
| 8.6 | A01 Broken Access Control | ✅ | d8-s07 | 8.2 | (in 8.2) |
| 8.7 | A03 Injection / SQLi | ✅ | d8-s02 | 8.3 | 10 |
| 8.8 | A06 Vulnerable Components | ✅ | d8-s05 | 8.6.1 | 0 |
| 8.9 | XSS (stored/reflected/DOM) | ✅ | d8-s07b | 8.3 | (in 8.3) |
| 8.10 | CSRF | ✅ | d8-s07b | 8.3 | (in 8.3) |
| 8.11 | SSRF | ✅ | d8-s07b | 8.3 | (in 8.3) |
| 8.12 | Buffer overflow / memory safety | ✅ | d8-c03, d3-c03 | 8.3 | (in 8.3) |
| 8.13 | Race conditions / TOCTOU | ✅ | d8-c03 | 8.3 | (in 8.3) |
| 8.14 | Input validation / param queries | ✅ | d8-s02, d8-c03 | 8.3 | (in 8.3) |
| 8.15 | Secure error handling / logging | ✅ | d8-c03 | 8.3 | (in 8.3) |
| 8.16 | Session management | ✅ | d5-c03, d8-c03 | 8.3 | (in 8.3) |
| 8.17 | API security | ✅ | d8-s08 | 8.4 | 4 |
| 8.18 | DevSecOps pipeline gates | ✅ | d8-s06 | 8.6 | 0 |
| 8.19 | CI/CD security | ✅ | d8-s05, d8-s06 | 8.6 | (in 8.6) |
| 8.20 | Container / image scanning | ✅ | d8-s06, d8-c02 | 8.6 | (in 8.6) |
| 8.21 | IaC scanning | ✅ | d8-s06 | 8.6 | (in 8.6) |
| 8.22 | Code obfuscation / signing | ✅ | d8-c03 | 8.6 | (in 8.6) |
| 8.23 | Database security (ACID/RLS/SQL) | ✅ | d8-s12 | 8.5 / 8.5.1 | 2 |
| 8.24 | OOP concepts | ✅ | d8-c03 (CERT/MISRA) | 8.3 | (in 8.3) |
| 8.25 | COTS vs Open Source vs Custom | ✅ | d8-s13 | 8.7 | 0 |
| 8.26 | Software acquisition / licensing / escrow | ✅ | d8-s13 | 8.7 | (in 8.7) |
| 8.27 | TLATM DevSecOps | ✅ | d8-s09 | — | — |
| 8.28 | Mobile + Container + Serverless | ✅ | d8-c02 | 8.8 | 0 |
| 8.29 | Secure coding standards (CERT/MISRA/ASVS) | ✅ | d8-c03 | 8.3 | (in 8.3) |
| 8.30 | Blockchain / Smart Contracts (DASP/SWC) | ✅ | d8-c04 | 8.6 | (in 8.6) |

**D8 status: 30/30 covered. Scenes: 20. Library rows: 11. Questions: 30.**

---

## CROSS-DOMAIN INTEGRATION (Sprint F + Sprint G)

| # | Topic | Status | Story Scene(s) | Library | Questions |
|---|-------|--------|----------------|---------|-----------|
| C.1 | Zero Trust Architecture (NIST 800-207) | ✅ | d8-s14 | (D5+D7) | (in 5.x) |
| C.2 | Supply Chain + SBOM + SLSA | ✅ | d8-s15 | 8.7 | 0 |
| C.3 | Privacy by Design (Cavoukian 7) | ✅ | d8-s16 | 2.4 | (in 2.4) |
| C.4 | AI/ML Security + OWASP LLM Top 10 | ✅ | d8-s17 | 8.3 | (in 8.3) |
| C.5 | Compliance Frameworks Map | ✅ | d8-s18 | (multi) | — |
| C.6 | Final cross-domain TLATM | ✅ | d8-s19 | — | — |
| C.7 | Closing chapter narrative | ✅ | d8-s20 | — | — |

---

# Coverage Summary — 100%

| Domain | Topics | Scenes | Library Rows | Questions | Coverage |
|--------|--------|--------|--------------|-----------|----------|
| D1 | 33 | 22 | 9 | 30 | 100% |
| D2 | 26 | 21 | 9 | 30 | 100% |
| D3 | 29 | 18 | 9 | 30 | 100% |
| D4 | 29 | 21 | 9 | 30 | 100% |
| D5 | 30 | 18 | 11 | 30 | 100% |
| D6 | 27 | 12 | 11 | 30 | 100% |
| D7 | 27 | 16 | 11 | 30 | 100% |
| D8 | 30 | 20 | 11 | 30 | 100% |
| Cross | 7 | 7 | shared | shared | 100% |
| **Total** | **238 topics** | **177 scenes** | **80 rows** | **240 questions** | **100% topic coverage** |

Every topic in the consolidated CISSP knowledge base is now taught in story mode AND documented in the library. Complete.

---

# Question Bank — The Real Gap

Topic coverage is 100%. **Question density is not.**

- 240 questions / 238 topics = **~1 question per topic average** (and many topics share questions while others have zero).
- A serious CISSP prep app needs **~20-50 questions per topic** to cover every difficulty level, every angle, every distractor pattern.
- Target: **~5,000 questions** (62 questions × 80 topics) for "many many per topic."

## Topics with ZERO linked questions (28 topics need first-batch generation)

D1: 1.6 Threat Modeling, 1.7.1 Security Controls Classification, 1.8 Personnel Security, 1.9 Risk Analysis Quant/Qual, 1.10 Security Awareness

D2: 2.5.1 Data Retention/Legal, 2.6.1 Data Destruction Methods, 2.7.1 Pseudo/Token/Anon, 2.8.1 DLP

D3: 3.6 Virtualization/Cloud, 3.7 Cryptographic Attacks, 3.8 Hardware Security/Trusted Computing, 3.9 Defense in Depth

D4: 4.6 DNS Security, 4.7 Email Security, 4.8 NAC + 802.1X, 4.9 Cloud Network Security

D5: 5.3.1 Auth Factors/MFA, 5.4.1 Kerberos Protocol, 5.5.1 Federated Identity, 5.6.1 Access Control Models, 5.7.1 PAM

D6: 6.2.1 Vuln Assessment vs Pentest, 6.3.1 Pentest Phases, 6.4.1 Software Testing Types, 6.5.1 Security Metrics, 6.6.1 Log Management/Analysis

D7: 7.5.1 IR Process, 7.6.1 Digital Forensics, 7.7.1 Change Management, 7.8.1 Backup/Recovery, 7.9.1 Personnel Security Ops

D8: 8.5.1 Database Security, 8.6 DevSecOps/CI-CD, 8.6.1 Software Supply Chain, 8.7 Supply Chain Security, 8.8 Mobile App Security

## Question Bank Expansion Plan (committed in this sprint)

1. **`scripts/generate-questions.mjs`** — Anthropic-API-driven generator. Takes a library topic, generates N CISSP-style questions with options, correct index, explanation, memory hack. Outputs SQL inserts ready to apply via the existing migration pipeline.

2. **`scripts/seed-questions-batch.mjs`** — Orchestrator. Reads list of topics needing more questions, calls the generator, applies the resulting SQL via the Management API.

3. **First batch target — 500 questions across the 28 zero-question topics** (~18 questions each). Cost on Claude Sonnet 4.5: ~$5-10 total.

4. **Second batch target — 2,500 more questions** spreading 30 questions/topic across all 80 library topics.

5. **Third batch target — 2,000 more** for high-frequency topics (CIA Triad, Risk Treatment, ALE/SLE, Bell-LaPadula, etc. each get 60+).

The generator and orchestrator land in this sprint commit. Running them is a separate ~30-min job (rate-limited by Anthropic API).
