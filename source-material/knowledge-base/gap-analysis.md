# CISSP Quest -- Master Gap Analysis

> **Generated:** 2026-03-08
> **Purpose:** Cross-reference textbook coverage (8 domain knowledge summaries) against current CISSP Quest story mode content. Identify missing topics, prioritize by exam frequency, and estimate scene counts needed to close gaps.
> **Sources:** domain1-knowledge.md through domain8-knowledge.md (Sections 14 + 15), src/data/story-content.ts (legacy), src/data/story/domain1/act1.ts (new format)

---

## Summary Statistics

| Metric | Count |
|--------|-------|
| **Total gap topics identified** | **198** |
| **HIGH priority gaps (exam-critical)** | **55** |
| **MEDIUM priority gaps** | **72** |
| **LOW priority gaps** | **71** |
| **Domains with largest gap counts** | D3 (28), D7 (28), D4 (28), D5 (20) |
| **Domains with smallest gap counts** | D1 (30), D2 (25), D6 (34), D8 (18) |
| **Total estimated new scenes needed** | **290 -- 410** |

### Gaps Per Domain

| Domain | Exam Weight | Gap Topics | HIGH | MED | LOW | Gap Severity |
|--------|------------|------------|------|-----|-----|-------------|
| D1: Security & Risk Mgmt | 15% | 30 | 6 | 8 | 16 | MODERATE |
| D2: Asset Security | 10% | 25 | 6 | 8 | 11 | HIGH |
| D3: Security Arch & Eng | 13% | 28 | 7 | 8 | 13 | CRITICAL |
| D4: Comm & Network Sec | 13% | 28 | 8 | 9 | 11 | CRITICAL |
| D5: Identity & Access Mgmt | 13% | 20 | 5 | 8 | 7 | HIGH |
| D6: Security Assessment | 12% | 34 | 10 | 10 | 14 | CRITICAL |
| D7: Security Operations | 13% | 28 | 9 | 8 | 11 | CRITICAL |
| D8: Software Dev Security | 11% | 18 | 4 | 7 | 7 | MODERATE |

---

## Domain 1: Security and Risk Management -- Gaps

**Currently covered in story mode:** CIA Triad, Risk Assessment, NIST RMF, Quantitative Risk Analysis (SLE/ARO/ALE), Qualitative Risk Analysis, Security Governance hierarchy, Risk Treatment options, BCP vs DRP, ISC2 Code of Ethics, Compliance vs Security, Due Diligence/Due Care.

### HIGH PRIORITY (Heavily tested, foundational)

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **Intellectual Property Laws** | Trade secrets, patents, copyrights, trademarks -- distinguishing characteristics (disclosure required, duration, protection scope). Practice questions frequently ask students to identify which IP type protects a given scenario. | HIGH | Act 2 | 2 |
| 2 | **Security Document Hierarchy** | Policies vs. standards vs. procedures vs. baselines vs. guidelines with clear examples and mandatory/non-mandatory distinction. Already partially covered in Act 1 governance scene but needs dedicated deep-dive with discrimination scenarios. | HIGH | Act 2 | 2 |
| 3 | **Accountability vs. Responsibility** | Critical distinction tested frequently: accountability cannot be delegated; responsibility can. Senior management is always ultimately accountable. | HIGH | Act 1 | 1 |
| 4 | **Threat Modeling (STRIDE, PASTA, DREAD)** | Each methodology's purpose, when to use each, and how it maps to security principles. STRIDE category identification from attack scenarios is a top practice question pattern. | HIGH | Act 2 | 2 |
| 5 | **Personnel Security Controls** | Job rotation, mandatory vacations, separation of duties, onboarding/offboarding procedures. These are heavily tested as detective/deterrent controls. | HIGH | Act 2 | 2 |
| 6 | **Types of Controls** | Directive, deterrent, preventive, detective, corrective, recovery, compensating; administrative vs. logical/technical vs. physical. Control classification is a top-10 tested concept. | HIGH | Act 1 | 2 |

### MEDIUM PRIORITY (Tested regularly)

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 7 | **Privacy Laws and Regulations** | GDPR (7 principles, 72-hour breach notification), HIPAA, GLBA, FERPA, COPPA, CCPA with jurisdiction mapping. Legal/regulatory matching is a top practice question pattern. | MEDIUM | Act 2 | 2 |
| 8 | **OECD Privacy Guidelines** | The 8 principles with practical application. | MEDIUM | Act 2 | 1 |
| 9 | **Privacy Impact Assessment (PIA/DPIA)** | Purpose, steps, when required. | MEDIUM | Act 2 | 1 |
| 10 | **Supply Chain Risk Management** | Product tampering, counterfeits, implants, silicon root of trust, PUF, SBOM, SLR/SLA/service-level reports. | MEDIUM | Act 4 | 2 |
| 11 | **AAA Services** | The five elements (identification through accounting) with practical scenarios. | MEDIUM | Act 1 | 1 |
| 12 | **Security Awareness Training** | Awareness vs. training vs. education; methods; effectiveness evaluation; social engineering awareness. | MEDIUM | Act 2 | 1 |
| 13 | **Organizational Roles** | Senior manager, security professional, asset owner, custodian, user, auditor with their specific responsibilities. | MEDIUM | Act 1 | 1 |
| 14 | **DAD Triad** | The opposite of CIA as failure modes (Disclosure, Alteration, Destruction). | MEDIUM | Act 1 | 1 |

### LOW PRIORITY (Supporting knowledge)

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 15 | **Investigation Types** | Administrative, criminal, civil, regulatory and their burden-of-proof standards. | LOW | Act 4 | 1 |
| 16 | **Import/Export Controls** | Wassenaar Arrangement, ITAR, EAR. | LOW | Act 4 | 1 |
| 17 | **Transborder Data Flow** | Data residency/localization laws. | LOW | Act 4 | 1 |
| 18 | **Security Control Frameworks Deep Dive** | ISO 27001/27002, COBIT, SABSA, ITIL, FedRAMP, COSO ERM beyond NIST RMF. | LOW | Act 4 | 2 |
| 19 | **Third-Party Governance** | Document review, on-site assessment, ATO process. | LOW | Act 4 | 1 |
| 20 | **Risk Registers, Risk Matrices, Heat Maps** | Visual tools for risk management. | LOW | Act 2 | 1 |
| 21 | **Continuous Improvement / PDCA** | Plan, Do, Check, Act cycle (Deming). | LOW | Act 2 | 1 |
| 22 | **Business Case Development** | Justifying security investments to executives. | LOW | Act 4 | 1 |
| 23 | **Scoping and Tailoring** | Aligning controls with organizational goals. | LOW | Act 2 | 1 |
| 24 | **Cost-Benefit Analysis / Safeguard Value** | When is a control worth implementing? | LOW | Act 2 | 1 |
| 25 | **Mergers and Acquisitions Security** | Increased risk during organizational change. | LOW | Act 4 | 1 |
| 26 | **Vendor Management Systems (VMS)** | Managing third-party relationships. | LOW | Act 4 | 1 |
| 27 | **Social Engineering Attacks** | Phishing, spear phishing, whaling, smishing, vishing, pretexting, baiting, tailgating/piggybacking. | LOW | Act 2 | 2 |
| 28 | **Employee Duress** | Keywords and protocols for duress situations. | LOW | Act 4 | 1 |
| 29 | **NCA and NDA Types** | Non-compete and nondisclosure agreement types. | LOW | Act 4 | 1 |
| 30 | **Risk Communication and Reporting** | Clarity, timeliness, relevance, transparency, consistency. | LOW | Act 4 | 1 |

---

## Domain 2: Asset Security -- Gaps

**Currently covered in story mode:** Data Classification levels (government + business), Data Ownership Roles, Data States, Data Lifecycle, Retention Policies, Destruction Methods, Privacy Principles, Data Protection Controls per state.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **Pseudonymization, Tokenization, and Anonymization** | Three distinct data de-identification techniques with different reversibility, use cases, and GDPR implications. Heavily tested, not in current story. | HIGH | Act 2 | 2 |
| 2 | **DLP Types and Mechanics** | Network DLP, Endpoint DLP, Cloud DLP, pattern matching, keyword scanning, content discovery. DLP cannot scan encrypted data. Technology selection questions are common. | HIGH | Act 2 | 2 |
| 3 | **Scoping and Tailoring** | Selecting applicable controls from baselines (scoping) and modifying for organizational fit (tailoring). Critical D2 exam concept -- frequently confused in practice questions. | HIGH | Act 2 | 1 |
| 4 | **CASB (Cloud Access Security Broker)** | Cloud policy enforcement, shadow IT detection, bridging internal security to cloud. Technology selection questions: cloud policy = CASB. | HIGH | Act 2 | 1 |
| 5 | **DRM and IRM** | Digital Rights Management techniques (licensing, persistent authentication, audit trails, expiration), IRM as subset, DMCA legal foundation. | HIGH | Act 4 | 2 |
| 6 | **Labeling and Marking Distinction** | System-readable labeling (metadata, electronic labels) vs. human-readable marking (watermarks, physical labels, headers/footers). Testable distinction. | HIGH | Act 1 | 1 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 7 | **Classification vs. Categorization** | Classification assigns hierarchical sensitivity levels; categorization sorts into non-hierarchical classes. | MEDIUM | Act 1 | 1 |
| 8 | **Security Baselines (NIST SP 800-53B)** | Low-impact, moderate-impact, high-impact, and privacy baselines. How they stack and how to apply. | MEDIUM | Act 2 | 1 |
| 9 | **Standards Selection** | Identifying which external standards apply (PCI DSS, GDPR, etc.) and ensuring controls comply. | MEDIUM | Act 2 | 1 |
| 10 | **Information Obfuscation Methods** | Concealing, pruning, fabricating, trimming, encrypting data. Data masking for non-production environments. | MEDIUM | Act 2 | 1 |
| 11 | **End-to-End vs. Link vs. Onion Encryption** | Three methods of protecting data in transit with different tradeoffs. | MEDIUM | Act 4 | 1 |
| 12 | **Data Remanence Deep Dive** | Slack space, residual magnetic flux, SSD wear-leveling, why standard deletion is insufficient. SSD-specific destruction challenges. | MEDIUM | Act 2 | 1 |
| 13 | **E-discovery and Litigation Holds** | Legal obligations to preserve data when litigation is anticipated. Impact on retention/destruction processes. | MEDIUM | Act 4 | 1 |
| 14 | **EOL vs. EOS** | Vendor lifecycle milestones and their security implications. Hardware refresh planning. | MEDIUM | Act 4 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 15 | **Object Reuse** | TCSEC/Orange Book concept of secure reassignment of media. Overwriting as primary implementation. | LOW | Act 4 | 1 |
| 16 | **Data Collection Limitation** | Privacy principle of collecting only necessary data. Reducing breach exposure. | LOW | Act 2 | 1 |
| 17 | **Data Location and Sovereignty** | Geographic data storage concerns, cross-border data flow, cloud data center verification. | LOW | Act 4 | 1 |
| 18 | **Compliance Officer Role** | Dedicated position ensuring business activities follow applicable laws. | LOW | Act 2 | 1 |
| 19 | **Data Privacy Officer (DPO)** | GDPR-mandated role for overseeing data protection. | LOW | Act 2 | 1 |
| 20 | **Homomorphic Encryption** | Computation on encrypted data; emerging technology for protecting data in use. | LOW | Act 4 | 1 |
| 21 | **Declassification Process** | Steps and risks of downgrading media/systems from higher to lower classification. | LOW | Act 4 | 1 |
| 22 | **Air-Gapped Networks and Unidirectional Bridges** | Physical data maintenance techniques for classified environments. | LOW | Act 4 | 1 |
| 23 | **Defensible Destruction** | Destroying data in a legally defensible, documented, compliant manner. | LOW | Act 4 | 1 |
| 24 | **Memory Types and Security** | Volatile (DRAM/RAM) vs. non-volatile (ROM, PROM, EPROM, EEPROM, flash). EPROM erasure via UV light. | LOW | Act 4 | 1 |
| 25 | **Randomized Masking / Data Shuffling** | Anonymization technique maintaining aggregate statistical properties while scrambling individual records. | LOW | Act 4 | 1 |

---

## Domain 3: Security Architecture and Engineering -- Gaps

**Currently covered in story mode:** Bell-LaPadula, Biba, Clark-Wilson, Symmetric/Asymmetric crypto, Hashing, Secure Design Principles, Common Criteria/EAL, Covert Channels.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **PKI and Digital Certificates** | X.509 standard, CA hierarchy, certificate lifecycle, CRL/OCSP, chain of trust, certificate pinning, cross-certification. Major exam topic with NO current story coverage. Cryptographic algorithm selection is a top practice question pattern. | HIGH | Act 2 | 3 |
| 2 | **Digital Signatures** | How they work (hash + encrypt with private key), what they provide (integrity, authentication, nonrepudiation but NOT confidentiality), DSA, RSA signatures, ECDSA, code signing. Critical for understanding nonrepudiation. | HIGH | Act 2 | 2 |
| 3 | **Key Management Lifecycle** | Generation, distribution, storage, rotation, revocation, destruction, escrow, M-of-N control. Where crypto fails in practice. Key management questions are a top practice pattern. | HIGH | Act 2 | 2 |
| 4 | **Cloud Computing Security** | Service models (IaaS/PaaS/SaaS), deployment models, shared responsibility, multi-tenancy, accountability vs. responsibility. Major modern exam topic. Cloud computing questions are a top practice pattern. | HIGH | Act 2 | 2 |
| 5 | **Cryptanalytic Attacks** | Brute force, birthday attack, meet-in-the-middle, known/chosen plaintext, side-channel, rainbow tables, frequency analysis. Students need to understand how crypto is broken. | HIGH | Act 4 | 2 |
| 6 | **Fire Prevention, Detection, and Suppression** | Fire classes, detection types (VESDA, ionization, photoelectric), water-based systems (wet/dry/pre-action/deluge), gas-based systems (FM-200, INERGEN, Halon ban). Physical security is a significant portion of D3. Heavily tested in scenario questions. | HIGH | Act 2 | 2 |
| 7 | **Virtualization and Hypervisor Security** | Type 1 vs. Type 2, VM escape, VM sprawl, container security, hypervisor hardening. Critical for modern infrastructure. | HIGH | Act 2 | 2 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 8 | **Block Cipher Modes of Operation** | ECB, CBC, CFB, OFB, CTR, GCM. Why ECB is insecure and when to use each mode. | MEDIUM | Act 4 | 1 |
| 9 | **Brewer-Nash (Chinese Wall) Model** | Dynamic conflict-of-interest model, important for consulting/financial scenarios. | MEDIUM | Act 4 | 1 |
| 10 | **TOCTOU / Race Conditions** | Time-of-check/time-of-use vulnerabilities, mitigation strategies. | MEDIUM | Act 4 | 1 |
| 11 | **Physical Access Controls** | Fences, gates, mantraps, locks, CCTV, motion detectors (types), guards, lighting requirements. | MEDIUM | Act 2 | 2 |
| 12 | **Power and Environmental Controls** | UPS, generators, HVAC, humidity, temperature, TEMPEST/emanation security. | MEDIUM | Act 2 | 1 |
| 13 | **ICS/SCADA Security** | PLCs, air-gapping, unique challenges of OT, real-world incidents (Stuxnet). | MEDIUM | Act 4 | 1 |
| 14 | **TPM and HSM** | Hardware roots of trust, secure boot, measured boot, attestation. | MEDIUM | Act 2 | 1 |
| 15 | **Steganography** | Hiding data within other media, digital watermarking, null ciphers. Distinct from encryption. | MEDIUM | Act 4 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 16 | **Homomorphic Encryption** | Computing on encrypted data without decryption, cloud computing applications. | LOW | Act 4 | 1 |
| 17 | **Quantum Cryptography and Post-Quantum** | QKD, threats to RSA/ECC, lattice-based crypto, NIST PQC standards. | LOW | Act 4 | 1 |
| 18 | **Lightweight Cryptography** | IoT and embedded systems crypto constraints. | LOW | Act 4 | 1 |
| 19 | **Graham-Denning, HRU, Take-Grant, Goguen-Meseguer, Sutherland Models** | Less commonly tested formal models. | LOW | Act 4 | 1 |
| 20 | **Enterprise Architecture Frameworks** | Zachman, TOGAF, SABSA. Tested at conceptual level. | LOW | Act 4 | 1 |
| 21 | **CPTED** | Natural surveillance, access control, territorial reinforcement (Crime Prevention Through Environmental Design). | LOW | Act 2 | 1 |
| 22 | **Edge Computing, Fog Computing, CDN Security** | Emerging architectural patterns. | LOW | Act 4 | 1 |
| 23 | **Microservices and Serverless Security** | API security, container orchestration, FaaS patterns. | LOW | Act 4 | 1 |
| 24 | **Security Modes of Operation** | Dedicated, system high, compartmented, multilevel modes for system clearance. | LOW | Act 4 | 1 |
| 25 | **Web Application Vulnerabilities (XSS, CSRF, SQLi)** | Dedicated D3 content on input validation as root cause of web exploits (reinforces D3+D8 connection). | LOW | Act 4 | 1 |
| 26 | **Hybrid Cryptography** | How real-world protocols (TLS, PGP) combine symmetric and asymmetric crypto. | LOW | Act 2 | 1 |
| 27 | **One-Time Pad** | Theoretically perfect encryption and its strict requirements. Classic exam topic. | LOW | Act 4 | 1 |
| 28 | **Crypto-shredding and Data Remanence in Cloud** | Destroying keys as data destruction in cloud. | LOW | Act 4 | 1 |

---

## Domain 4: Communication and Network Security -- Gaps

**Currently covered in story mode:** OSI Model (7 layers), Network Attacks (MITM, DoS, VLAN Hopping, ARP Spoofing, SSL Stripping), Firewall Types, VPN/IPsec (Transport vs Tunnel, AH vs ESP), Wireless Security (WPA3).

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **TCP/IP Model** | Four-layer model, mapping to OSI, practical differences. OSI layer identification is the #1 practice question pattern in D4. | HIGH | Act 1 | 1 |
| 2 | **TCP Three-Way Handshake and Connection Teardown** | SYN, SYN/ACK, ACK, FIN, RST flags. Foundation for understanding SYN floods and connection-based attacks. | HIGH | Act 1 | 1 |
| 3 | **IP Addressing (IPv4 and IPv6)** | Classful addressing, CIDR, subnetting basics, RFC 1918 private ranges, NAT/PAT. | HIGH | Act 1 | 2 |
| 4 | **Secure Protocols Suite** | SSH, TLS/SSL, HTTPS, SFTP, DNSSEC, and when to use each. Secure protocol selection is a top practice pattern (Telnet->SSH, FTP->SFTP, HTTP->HTTPS). | HIGH | Act 2 | 2 |
| 5 | **Email Security** | S/MIME, PGP, SPF, DKIM, DMARC, email security goals. | HIGH | Act 2 | 2 |
| 6 | **NAC (Network Access Control) and 802.1X** | Port-based authentication, pre-admit vs. post-admit, RADIUS integration. | HIGH | Act 2 | 1 |
| 7 | **Network Segmentation (beyond VLANs)** | VRF, VDOMs, VPC, air-gapped networks, in-band vs. out-of-band management. Network segmentation is a top practice pattern. | HIGH | Act 2 | 2 |
| 8 | **Micro-segmentation and Zero Trust** | Per-workload security, network overlays, VXLAN, distributed firewalls. | HIGH | Act 4 | 2 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 9 | **SDN and SD-WAN** | Three planes (application/control/data), API-driven management, intelligent path selection. Traffic flow and SDN questions are a notable practice pattern. | MEDIUM | Act 4 | 1 |
| 10 | **Converged Protocols** | iSCSI, FCoE, CXL, InfiniBand over Ethernet, VoIP as converged protocol. Converged protocol identification is a practice question pattern. | MEDIUM | Act 4 | 1 |
| 11 | **CDN (Content Distribution Networks)** | Edge caching, DDoS resilience, push vs. pull models. | MEDIUM | Act 4 | 1 |
| 12 | **Cellular/Mobile Networks (4G/5G)** | Security differences, mutual authentication in 5G, network slicing. | MEDIUM | Act 4 | 1 |
| 13 | **Network Monitoring and QoS** | SNMP, NetFlow, syslog, bandwidth vs. throughput vs. latency vs. jitter. | MEDIUM | Act 2 | 1 |
| 14 | **Switching Technologies** | Cut-through vs. store-and-forward, CAM table function, STP. | MEDIUM | Act 2 | 1 |
| 15 | **Traffic Flows** | North-south vs. east-west, implications for monitoring and segmentation. | MEDIUM | Act 2 | 1 |
| 16 | **Edge Networks** | Ingress/egress filtering, peering, internet exchange points. | MEDIUM | Act 4 | 1 |
| 17 | **VoIP Security** | SIPS, SRTP, dedicated VLANs, PBX security, caller ID spoofing. | MEDIUM | Act 4 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 18 | **Cabling and Physical Media** | Cat5e/6/6a/7, fiber types, distance limitations, 5-4-3 rule, attenuation. | LOW | Act 1 | 1 |
| 19 | **Bluetooth, Zigbee, NFC, Satellite, Li-Fi** | Characteristics, security features, common attacks. | LOW | Act 4 | 1 |
| 20 | **Multilayer Protocol Implications** | Covert channels, filter evasion, SCADA/ICS over TCP/IP risks. | LOW | Act 4 | 1 |
| 21 | **DNS Resolution Process** | Recursive vs. iterative queries, DNS cache poisoning, split DNS. | LOW | Act 2 | 1 |
| 22 | **Remote Access Protocols** | PAP, CHAP, EAP, RDP vs. SSH vs. Telnet comparison. | LOW | Act 2 | 1 |
| 23 | **Circuit Switching vs. Packet Switching** | PVC vs. SVC, historical WAN technologies. | LOW | Act 4 | 1 |
| 24 | **Network Topologies** | Bus, star, ring, mesh, tree, hybrid -- characteristics and tradeoffs. | LOW | Act 1 | 1 |
| 25 | **Multimedia Collaboration Security** | Zoom bombing prevention, secure video conferencing, TLS for platforms. | LOW | Act 4 | 1 |
| 26 | **Network Hardware Lifecycle** | EOL/EOS planning, redundant power, UPS, vendor support. | LOW | Act 4 | 1 |
| 27 | **IKE Phases** | Phase 1 (secure channel) and Phase 2 (IPsec SA negotiation) details. | LOW | Act 4 | 1 |
| 28 | **RADIUS vs. TACACS+** | Differences in protocol, encryption, and AAA separation. (Cross-ref D5 gap #2) | LOW | Act 2 | 1 |

---

## Domain 5: Identity and Access Management -- Gaps

**Currently covered in story mode:** Authentication Factors, MFA, SSO/Federated Identity (Kerberos, SAML, OAuth/OIDC), Access Control Models (DAC/MAC/RBAC/ABAC), Least Privilege, Separation of Duties, Privilege Escalation, Identity Lifecycle, Credential Stuffing.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **Biometric Deep Dive** | Specific biometric types (retina vs. iris vs. palm vs. face), CER/EER concept and device comparison, Type 1 vs. Type 2 errors with sensitivity tuning, biometric template storage and 1:N vs. 1:1 matching. Biometric accuracy questions are a top practice pattern. | HIGH | Act 2 | 2 |
| 2 | **RADIUS and TACACS+** | How each protocol works, key differences (encryption, transport, AAA separation), use cases for network device AAA. Protocol differentiation is a top practice pattern. (Cross-ref D4 gap #28) | HIGH | Act 2 | 2 |
| 3 | **Zero Trust Architecture** | NIST SP 800-207 components, Policy Engine, Policy Administrator, PDP, PEP, continuous authentication, trust algorithm and its inputs. | HIGH | Act 4 | 2 |
| 4 | **Access Control Attacks (Beyond Credential Stuffing)** | Dictionary, brute-force, spraying, rainbow tables + salting/peppering, pass-the-hash, Kerberos exploitation (golden ticket, silver ticket, Kerberoasting, ASREPRoast), birthday attacks, sniffing, spoofing. Attack identification is a top practice pattern. | HIGH | Act 2 | 3 |
| 5 | **Session Management** | Session hijacking and prevention, session ID security (entropy, length, predictability), timeout configurations, OWASP session management recommendations. | HIGH | Act 2 | 1 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 6 | **Password Policy Details** | NIST SP 800-63B recommendations vs. PCI DSS requirements, password history, minimum/maximum age, complexity debates, passphrases. Password policy questions are a practice pattern. | MEDIUM | Act 2 | 1 |
| 7 | **Service Account Management** | Non-interactive login configuration, password management, risks of LocalSystem/root, certificate-based service authentication. Manager decision questions test this. | MEDIUM | Act 2 | 1 |
| 8 | **Device Authentication** | 802.1X port-based authentication, device fingerprinting, NAC integration with MDM, context-aware authentication. | MEDIUM | Act 2 | 1 |
| 9 | **Authorization Mechanisms (Detail)** | Access control matrix, capability lists, constrained interfaces, content-dependent vs. context-dependent controls, implicit deny, permissions vs. rights vs. privileges. | MEDIUM | Act 2 | 1 |
| 10 | **Account Access Review Process** | Review frequency based on account type and risk, automated vs. manual reviews, privilege monitoring for admin accounts, detecting inactive/orphaned accounts. | MEDIUM | Act 4 | 1 |
| 11 | **Identity Governance Concepts** | Kim Cameron's Seven Laws of Identity, role engineering and mining, entitlement management, identity analytics and risk scoring. | MEDIUM | Act 4 | 1 |
| 12 | **Mutual Authentication** | Certificate-based mutual auth, VPN and TLS mutual auth scenarios, prevention of rogue server attacks. | MEDIUM | Act 4 | 1 |
| 13 | **su vs. sudo on Linux** | How each works, audit trail differences, sudoers file, dual-account best practice for administrators. | MEDIUM | Act 2 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 14 | **Authenticator Assurance Levels (AAL)** | NIST AAL1/AAL2/AAL3 definitions, mapping authentication methods to assurance levels. | LOW | Act 4 | 1 |
| 15 | **CAPTCHA** | Purpose, mechanism, use against automated attacks. | LOW | Act 2 | 1 |
| 16 | **Credential Management Systems** | W3C Credential Management API, password vault security, browser-based credential storage. | LOW | Act 4 | 1 |
| 17 | **Vendor Access Provisioning** | Third-party identity management, vendor security reviews, contract-based access requirements. | LOW | Act 4 | 1 |
| 18 | **SESAME Protocol** | Comparison with Kerberos, symmetric + asymmetric support, why not widely adopted. | LOW | Act 4 | 1 |
| 19 | **XACML** | Standard for attribute-based access control, policy language and processing model. | LOW | Act 4 | 1 |
| 20 | **Risk-Based Access Control** | Dynamic risk evaluation, ML in access decisions, NAC posture assessment. | LOW | Act 4 | 1 |

---

## Domain 6: Security Assessment and Testing -- Gaps

**Currently covered in story mode:** Vulnerability Assessment vs. Penetration Testing, Penetration testing methodology, Testing approaches (Black/White/Gray Box), Log Reviews/SIEM, SOC 2 Type I vs. Type II, Security Metrics/KPIs (MTTD, MTTR), Vulnerability scan validation.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **SAST vs. DAST vs. IAST** | Static, dynamic, and interactive application security testing distinctions. "What type of testing is described?" is the #1 D6 practice question pattern. | HIGH | Act 2 | 2 |
| 2 | **Fuzz Testing (Mutation vs. Generational)** | Two types of fuzzing, when each is appropriate, tools. | HIGH | Act 2 | 1 |
| 3 | **Code Review Processes** | Fagan inspections (most formal, six defined phases with strict entry/exit criteria), peer review, walkthroughs, automated tools. Code review formality is a practice pattern. | HIGH | Act 2 | 2 |
| 4 | **SOC 1 vs. SOC 2 vs. SOC 3** | Full comparison of all three SOC report types. "Which SOC report should be requested?" is the #2 D6 practice pattern. Currently only SOC 2 Type I/II is covered. | HIGH | Act 2 | 1 |
| 5 | **SSAE 18 / ISAE 3402 Audit Standards** | Evolution from SAS 70 and international equivalents. | HIGH | Act 2 | 1 |
| 6 | **Validation vs. Verification** | "Are we building the right product?" vs. "Are we building the product right?" Fundamental distinction. | HIGH | Act 1 | 1 |
| 7 | **Red Team vs. Blue Team vs. Purple Team vs. White Team** | Team roles in security exercises. "What type of team performs offensive security exercises?" is a practice pattern. | HIGH | Act 2 | 1 |
| 8 | **Credentialed vs. Uncredentialed Vulnerability Scanning** | Differences and implications. "Which scan provides deeper results?" is a practice pattern. | HIGH | Act 2 | 1 |
| 9 | **CVE and CVSS** | How vulnerabilities are identified and scored. | HIGH | Act 2 | 1 |
| 10 | **False Positives vs. False Negatives** | Understanding alert types and which is more dangerous (false negatives). "Which is MORE dangerous?" is a practice pattern. | HIGH | Act 1 | 1 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 11 | **Equivalence Partitioning and Boundary Value Analysis** | Testing efficiency techniques. | MEDIUM | Act 4 | 1 |
| 12 | **Test Coverage Analysis** | Formula and coverage criteria (branch, condition, function, loop, statement). | MEDIUM | Act 4 | 1 |
| 13 | **Interface Testing Types** | API, UI, network, physical interfaces. | MEDIUM | Act 2 | 1 |
| 14 | **Misuse Case / Abuse Case Testing** | Testing from attacker perspective. | MEDIUM | Act 2 | 1 |
| 15 | **Breach Attack Simulation (BAS)** | Continuous automated pen testing. | MEDIUM | Act 4 | 1 |
| 16 | **SCAP (Security Content Automation Protocol)** | Suite of automation standards. | MEDIUM | Act 4 | 1 |
| 17 | **KRI (Key Risk Indicators)** | Forward-looking metrics vs. KPIs (backward-looking). | MEDIUM | Act 2 | 1 |
| 18 | **SMART Metrics Framework** | Specific, Measurable, Achievable, Relevant, Timely. | MEDIUM | Act 2 | 1 |
| 19 | **Circular Overwrite vs. Clipping Levels** | Log management techniques. "What log management method preserves evidence?" is a practice pattern. | MEDIUM | Act 2 | 1 |
| 20 | **NTP and Log Time Synchronization** | Critical for forensics and correlation. "What protocol is critical for log correlation?" practice pattern. | MEDIUM | Act 2 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 21 | **Synthetic Performance Monitoring vs. RUM** | Active vs. passive monitoring techniques. | LOW | Act 4 | 1 |
| 22 | **Regression Testing** | Verifying changes have not broken existing functionality. | LOW | Act 4 | 1 |
| 23 | **Decision Table Analysis and State-Based Analysis** | Advanced testing techniques. | LOW | Act 4 | 1 |
| 24 | **Blind vs. Double-Blind Testing Approaches** | Testing approach nuances. | LOW | Act 4 | 1 |
| 25 | **Audit Roles and Responsibilities** | Executive management, audit committee, compliance manager, etc. | LOW | Act 4 | 1 |
| 26 | **Banner Grabbing and OS Fingerprinting** | Reconnaissance and enumeration techniques. | LOW | Act 2 | 1 |
| 27 | **Ethical Disclosure Obligations** | Responsible vulnerability disclosure process. | LOW | Act 4 | 1 |
| 28 | **Compliance Checks and Gap Assessments** | Pre-audit preparation. | LOW | Act 4 | 1 |
| 29 | **Software Testing Levels** | Unit -> Interface -> Integration -> System -> Acceptance hierarchy. | LOW | Act 2 | 1 |
| 30 | **War Driving and War Dialing** | Legacy assessment techniques still tested. | LOW | Act 4 | 1 |
| 31 | **Smoke Testing** | Quick verification of critical functionality. | LOW | Act 4 | 1 |
| 32 | **Positive, Negative, and Misuse Testing** | Three approaches to system testing. | LOW | Act 4 | 1 |
| 33 | **Account Management Reviews and Sampling** | Verification of authorized access. | LOW | Act 4 | 1 |
| 34 | **Fagan Inspection Six Phases** | Most formal code review process details. | LOW | Act 4 | 1 |

---

## Domain 7: Security Operations -- Gaps

**Currently covered in story mode:** NIST IR Lifecycle (4 phases), Containment Strategies, DR Metrics (RTO/RPO/MTBF/MTTR), Change Management, Logging/Monitoring/SIEM, Chain of Custody, Forensic Imaging.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **Backup Strategies in Depth** | Incremental vs. differential, archive bit behavior, 3-2-1 rule, tape rotation schemes (GFS, Tower of Hanoi). Backup type and restore speed questions are top practice patterns. | HIGH | Act 2 | 2 |
| 2 | **Recovery Site Types and Comparisons** | Cold/warm/hot/mobile/redundant sites with recovery times and costs. Selection based on MTD requirements is a top scenario question. | HIGH | Act 2 | 2 |
| 3 | **RAID Levels** | RAID 0, 1, 5, 6, 10 -- minimum drives, redundancy, and performance characteristics. Frequently tested in definition discrimination questions. | HIGH | Act 2 | 2 |
| 4 | **BIA Process** | Purpose, steps, relationship to RPO/RTO/WRT/MTD. "When to declare a disaster" (MTD will be exceeded) is a commonly tested concept. | HIGH | Act 1 | 2 |
| 5 | **DRP Testing Types** | Read-through, walkthrough, simulation, parallel, full-interruption -- order and requirements. "In what order should DRP tests be performed?" is a sequencing practice pattern. | HIGH | Act 2 | 2 |
| 6 | **Evidence Types and Rules** | Real, direct, circumstantial, hearsay, corroborative, best evidence, secondary. Five rules of evidence (authentic, accurate, complete, convincing, admissible). | HIGH | Act 2 | 2 |
| 7 | **Investigation Types** | Criminal, civil, regulatory, administrative -- who drives, burden of proof for each. Scenario-based application is a practice pattern. | HIGH | Act 2 | 1 |
| 8 | **WRT Concept and MTD Formula** | Work Recovery Time, and MTD = RTO + WRT. | HIGH | Act 2 | 1 |
| 9 | **Restoration Order** | Most critical to DR site first; least critical back to primary first. This reversal concept is heavily tested. | HIGH | Act 2 | 1 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 10 | **Malware Types** | Virus, worm, Trojan, ransomware, rootkit, logic bomb, polymorphic, botnet, boot sector, data diddler, zero-day. | MEDIUM | Act 2 | 2 |
| 11 | **Anti-Malware Approaches** | Signature-based vs. heuristic vs. activity monitor vs. change detection. | MEDIUM | Act 2 | 1 |
| 12 | **Foundational Security Operations Concepts** | Need-to-know vs. least privilege, SoD, two-person control, split knowledge, mandatory vacations, PAM, SLAs. | MEDIUM | Act 1 | 2 |
| 13 | **Failure Modes** | Fail-safe, fail-secure, fail-soft/fail-open. | MEDIUM | Act 2 | 1 |
| 14 | **Patch Management Lifecycle** | Evaluate, test, approve, deploy, verify. | MEDIUM | Act 2 | 1 |
| 15 | **Vulnerability Management** | Scans, CVE database, relationship to patching. | MEDIUM | Act 2 | 1 |
| 16 | **Network Attacks and Defenses** | DoS/DDoS, SYN flood, Smurf, Fraggle, botnets. (Cross-ref D4, some overlap) | MEDIUM | Act 2 | 1 |
| 17 | **Configuration Management** | Provisioning, baselining, imaging, automation, hardening. | MEDIUM | Act 2 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 18 | **Clustering vs. Redundancy** | High availability concepts. | LOW | Act 4 | 1 |
| 19 | **Electronic Vaulting, Remote Journaling, Remote Mirroring** | Offsite data replication techniques. | LOW | Act 4 | 1 |
| 20 | **Locard's Exchange Principle** | Every contact leaves a trace. | LOW | Act 4 | 1 |
| 21 | **MOM (Motive, Opportunity, Means)** | Investigation framework. | LOW | Act 4 | 1 |
| 22 | **Reciprocal Agreements** | Resource capacity agreements between organizations. | LOW | Act 4 | 1 |
| 23 | **SOAR Capabilities** | Security Orchestration, Automation, and Response. | LOW | Act 4 | 1 |
| 24 | **UEBA** | User and Entity Behavior Analytics. | LOW | Act 4 | 1 |
| 25 | **EDR** | Endpoint Detection and Response. | LOW | Act 4 | 1 |
| 26 | **Threat Hunting vs. Threat Intelligence** | Proactive vs. informational approaches. | LOW | Act 4 | 1 |
| 27 | **Media Management** | Tape handling, USB controls, mobile devices. | LOW | Act 4 | 1 |
| 28 | **Personnel Safety** | Travel, duress, emergency management. | LOW | Act 4 | 1 |

---

## Domain 8: Software Development Security -- Gaps

**Currently covered in story mode:** Secure SDLC phases, OWASP Top 10 (all 10), Secure Coding Practices (parameterized queries, input validation, output encoding, error handling, session management), SAST/DAST/IAST, DevSecOps/CI/CD, Shift Left principle.

### HIGH PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 1 | **Database Security Concepts** | Relational structure (tables, tuples, attributes, keys), primary/foreign keys, entity/referential integrity, ACID properties, concurrency controls, aggregation and inference attacks, polyinstantiation, normalization, NoSQL types, database views for access control. Database concept application is a top practice pattern. | HIGH | Act 2 | 3 |
| 2 | **Development Methodologies (Deep Dive)** | Waterfall specifics (seven stages), Spiral model (risk-driven), SAFe, Cleanroom, Structured Programming, XP, RAD, when to combine. Methodology identification is the #1 D8 practice pattern. | HIGH | Act 2 | 2 |
| 3 | **Maturity Models** | SW-CMM five levels, CMMI six levels (and how they differ), SAMM five business functions, IDEAL model phases, BSIMM. Maturity level identification is the #2 D8 practice pattern. | HIGH | Act 2 | 2 |
| 4 | **Change Management (Detailed)** | Three components (Request Control, Change Control, Release Control), Configuration Management four components, CAB role, file integrity monitoring integration. Change management component identification is a practice pattern. | HIGH | Act 2 | 2 |

### MEDIUM PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 5 | **Object-Oriented Programming Security** | Inheritance, encapsulation, polymorphism (security implications), cohesion (high=good) and coupling (low=good), abstraction, delegation. | MEDIUM | Act 4 | 1 |
| 6 | **Buffer Overflow (Deeper)** | How buffer overflows enable privilege escalation, ASLR mechanism and limitations, DEP, stack vs. heap overflows, bounds checking. Best security control questions frequently involve buffer overflow. | MEDIUM | Act 2 | 2 |
| 7 | **Knowledge-Based Systems / AI** | Expert systems (knowledge base + inference engine), ML (supervised vs. unsupervised), neural networks, AI in cybersecurity. | MEDIUM | Act 4 | 1 |
| 8 | **Software Acquisition Security** | COTS evaluation (pros/cons), open source evaluation (Heartbleed case study), source code escrow agreements, managed service provider assessment. Acquired software assessment is a practice pattern. | MEDIUM | Act 2 | 1 |
| 9 | **Advanced Testing Concepts** | Fagan inspection, use cases vs. misuse cases, reasonableness checks, SoD in testing, regression/smoke/canary testing, Unit->Integration->System->UAT progression. Testing type selection is a practice pattern. | MEDIUM | Act 2 | 2 |
| 10 | **Code Obfuscation** | Three types (lexical, data, control flow), purpose (prevent reverse engineering), disaster recovery impact. | MEDIUM | Act 4 | 1 |
| 11 | **TOCTOU / Race Conditions** | How the timing gap between check and use creates vulnerability, real-world examples, prevention. (Cross-ref D3 gap #10) | MEDIUM | Act 4 | 1 |

### LOW PRIORITY

| # | Topic | Description | Priority | Recommended Act | Est. Scenes |
|---|-------|-------------|----------|----------------|-------------|
| 12 | **Covert Channels** | Storage vs. timing covert channels, detection and prevention. (Cross-ref D3 -- partially covered already) | LOW | Act 4 | 1 |
| 13 | **Project Management Tools** | Gantt charts, PERT charts (task dependencies, critical path, estimation formula). | LOW | Act 4 | 1 |
| 14 | **Service-Level Agreements (SLAs)** | Key metrics, financial remedies, security requirements. | LOW | Act 4 | 1 |
| 15 | **Software-Defined Security** | Security controls through code, cloud/virtualization contexts, policy-driven security, CI/CD integration. | LOW | Act 4 | 1 |
| 16 | **Metadata** | Object-level, collection-level, methodological metadata, security implications of metadata exposure. | LOW | Act 4 | 1 |
| 17 | **Citizen Developers** | Risks of non-technical users with powerful dev tools, governance and training, shadow IT implications. | LOW | Act 4 | 1 |
| 18 | **ODBC / Database Connectivity** | ODBC as proxy between applications and databases, security considerations. | LOW | Act 4 | 1 |

---

## Cross-Domain Gaps

These topics span multiple domains and need integrated coverage across story scenes:

| # | Topic | Domains Involved | Description | Priority | Est. Scenes |
|---|-------|-----------------|-------------|----------|-------------|
| 1 | **Cloud Security (Comprehensive)** | D1, D2, D3, D7 | Shared responsibility model, cloud service models (IaaS/PaaS/SaaS), cloud deployment models, CASB, cloud forensics, cloud data sovereignty, scalability vs. elasticity. Currently fragmented across domain gaps. | HIGH | 3 |
| 2 | **Zero Trust Architecture** | D3, D4, D5 | NIST SP 800-207, micro-segmentation, continuous authentication, policy engine/administrator/PDP/PEP. Appears as gaps in D3, D4, and D5. | HIGH | 2 |
| 3 | **RADIUS vs. TACACS+** | D4, D5 | Protocol comparison, encryption differences, AAA separation. Listed as gaps in both D4 and D5. | MEDIUM | 1 |
| 4 | **TOCTOU / Race Conditions** | D3, D8 | Timing vulnerabilities, prevention. Listed as gaps in both D3 and D8. | MEDIUM | 1 |
| 5 | **Input Validation as Root Cause** | D3, D8 | XSS, CSRF, SQLi from D3 perspective reinforcing D8 secure coding. | MEDIUM | 1 |
| 6 | **Physical Security** | D3, D7 | Fire suppression, environmental controls, physical access controls (D3) intersect with facility security operations (D7). | MEDIUM | 2 |
| 7 | **Supply Chain Security** | D1, D8 | Supply chain risk management (D1) intersects with software acquisition security (D8). | MEDIUM | 1 |
| 8 | **Forensics and Evidence** | D1, D6, D7 | Investigation types (D1), testing/assessment context (D6), chain of custody and forensic procedures (D7). | MEDIUM | 2 |
| 9 | **Privacy Regulations** | D1, D2 | GDPR, CCPA, HIPAA -- regulatory framework (D1) and data de-identification techniques (D2). | MEDIUM | 2 |
| 10 | **DLP and Data Protection** | D2, D3, D4 | DLP mechanisms (D2), crypto for data in transit (D3), network-based DLP inspection points (D4). | MEDIUM | 1 |

---

## Highest Priority Gaps (Exam-Critical)

Consolidated list of ALL HIGH priority gaps across all domains, sorted by estimated exam frequency (most tested first). These are topics heavily tested in CISSP practice exams but completely missing from story mode.

| Rank | Topic | Domain(s) | Exam Frequency | Why Critical |
|------|-------|-----------|---------------|-------------|
| 1 | **PKI and Digital Certificates** | D3 | Very High | X.509, CA hierarchy, CRL/OCSP, chain of trust -- major exam topic with zero story coverage. Cryptographic algorithm selection is the #2 D3 practice pattern. |
| 2 | **Backup Strategies (Incremental vs. Differential)** | D7 | Very High | Archive bit behavior, 3-2-1 rule, tape rotation schemes. The distinction between incremental and differential is one of the most commonly tested D7 concepts. |
| 3 | **Recovery Site Types** | D7 | Very High | Cold/warm/hot/mobile/redundant with recovery times and costs. Site selection based on MTD is a top scenario question. |
| 4 | **RAID Levels (0, 1, 5, 6, 10)** | D7 | Very High | Minimum drives, redundancy, performance. One of the most frequently tested D7 definition discrimination questions. |
| 5 | **Database Security (ACID, Keys, Aggregation/Inference)** | D8 | Very High | Database concept application is the #3 most common D8 practice pattern. ACID properties, key types, aggregation vs. inference are heavily tested. |
| 6 | **Control Type Classification** | D1 | Very High | Categorizing controls as preventive/detective/corrective/compensating/directive/deterrent/recovery AND as administrative/technical/physical. Top-10 tested D1 concept. |
| 7 | **Digital Signatures** | D3 | Very High | What they provide (integrity + authentication + nonrepudiation, NOT confidentiality). Common distractor: "digital signatures provide confidentiality." |
| 8 | **SAST vs. DAST vs. IAST** | D6 | Very High | "What type of testing is described?" is the #1 D6 practice question pattern. While briefing content mentions these, they lack dedicated story teaching. |
| 9 | **Key Management Lifecycle** | D3 | Very High | Where crypto fails in practice. Key management questions are a top D3 practice pattern. |
| 10 | **Cloud Computing Security** | D3 | Very High | Shared responsibility, service models, accountability. Cloud computing questions are a top D3 practice pattern. Major modern exam topic. |
| 11 | **DRP Testing Types** | D7 | High | Read-through through full-interruption ordering. Sequencing questions are the #1 D7 practice pattern. |
| 12 | **Development Methodologies (Deep Dive)** | D8 | High | Identifying methodology from scenario description is the #1 D8 practice pattern. Waterfall vs. Spiral vs. Agile/Scrum vs. DevOps distinctions. |
| 13 | **Maturity Models (SW-CMM, CMMI)** | D8 | High | Maturity level identification is the #2 D8 practice pattern. SW-CMM "Managed" (L4) vs. CMMI "Managed" (L2) confusion. |
| 14 | **Evidence Types and Rules** | D7 | High | Real vs. direct vs. circumstantial vs. hearsay. Five rules of evidence. NOT/LEAST questions test non-requirements. |
| 15 | **BIA Process** | D7 | High | Purpose, steps, RPO/RTO/WRT/MTD relationships. "When to declare a disaster" = when MTD will be exceeded. |
| 16 | **Intellectual Property Laws** | D1 | High | Trade secrets vs. patents vs. copyrights vs. trademarks. IP classification is a top-5 tested D1 concept. |
| 17 | **SOC 1 vs. SOC 2 vs. SOC 3** | D6 | High | "Which SOC report?" is the #2 D6 practice pattern. Currently only SOC 2 Type I/II is covered. |
| 18 | **Threat Modeling (STRIDE, PASTA, DREAD)** | D1 | High | STRIDE category identification from attack scenarios is a top D1 practice pattern. |
| 19 | **Biometric Deep Dive (CER/EER, Type 1/Type 2 Errors)** | D5 | High | Biometric accuracy pattern: high-security = accept higher FRR for lower FAR. CER/EER for device comparison. |
| 20 | **Access Control Attacks (Golden Ticket, Pass-the-Hash)** | D5 | High | Attack identification is a top D5 practice pattern. "KRBTGT hash = Golden Ticket" is a testable fact. |
| 21 | **Fire Prevention, Detection, and Suppression** | D3 | High | Pre-action for data centers, VESDA for early detection, Halon ban. Physical security scenario questions are a major D3 pattern. |
| 22 | **Pseudonymization, Tokenization, Anonymization** | D2 | High | Three distinct de-identification techniques. "Only anonymized data is exempt from GDPR" (pseudonymized is NOT). |
| 23 | **TCP/IP Model and Three-Way Handshake** | D4 | High | TCP/IP model mapping to OSI. SYN/SYN-ACK/ACK handshake. Foundation for understanding network attacks. |
| 24 | **Secure Protocols Suite** | D4 | High | Telnet->SSH, FTP->SFTP, HTTP->HTTPS replacement knowledge. Secure protocol selection is a top D4 pattern. |
| 25 | **Email Security (S/MIME, DMARC, SPF, DKIM)** | D4 | High | Email security protocols and their goals. |
| 26 | **NAC and 802.1X** | D4 | High | Port-based authentication, pre/post-admit, RADIUS integration. |
| 27 | **Network Segmentation (Advanced)** | D4 | High | VRF, VDOMs, VPC, micro-segmentation, zero trust networking. |
| 28 | **DLP Types and Mechanics** | D2 | High | Network/Endpoint/Cloud DLP, pattern matching, "DLP cannot scan encrypted data." Technology selection questions. |
| 29 | **Personnel Security Controls** | D1 | High | Job rotation + mandatory vacations as detective/deterrent controls. Heavily tested in D1 and D7 control classification. |
| 30 | **Credentialed vs. Uncredentialed Scanning** | D6 | High | Credentialed = deeper, more accurate, fewer false positives. |
| 31 | **Red/Blue/Purple/White Teams** | D6 | High | Team roles in security exercises. |
| 32 | **Code Review Processes (Fagan Inspection)** | D6 | High | Fagan = most formal, six defined phases. |
| 33 | **False Positives vs. False Negatives** | D6 | High | False negatives are more dangerous (real threats undetected). |
| 34 | **CVE and CVSS** | D6 | High | Vulnerability identification and scoring system. |
| 35 | **Validation vs. Verification** | D6 | High | "Right product" vs. "Built right." Fundamental D6 distinction. |
| 36 | **Change Management (Request/Change/Release Control)** | D8 | High | Three-component model. Release Control includes removing debug code. |
| 37 | **RADIUS vs. TACACS+** | D4, D5 | High | Protocol, encryption, AAA separation differences. |
| 38 | **Zero Trust Architecture** | D3, D4, D5 | High | NIST SP 800-207, continuous verification, micro-segmentation. |
| 39 | **Virtualization and Hypervisor Security** | D3 | High | Type 1 vs. Type 2, VM escape, container security. |
| 40 | **WRT and MTD = RTO + WRT** | D7 | High | Work Recovery Time concept and the MTD formula. |
| 41 | **Restoration Order** | D7 | High | Most critical to DR first; least critical back to primary first. The reversal is a frequently tested trick. |
| 42 | **Investigation Types** | D7 | High | Criminal vs. civil vs. regulatory vs. administrative -- burden of proof differences. |
| 43 | **Security Document Hierarchy** | D1 | High | Policy vs. standard vs. procedure vs. baseline vs. guideline deep dive. |
| 44 | **Accountability vs. Responsibility** | D1 | High | Accountability cannot be delegated. Senior management always accountable. |
| 45 | **Scoping and Tailoring** | D2 | High | Definitions frequently reversed in practice question distractors. |
| 46 | **CASB** | D2 | High | Cloud policy enforcement = CASB. Shadow IT detection. |
| 47 | **Labeling vs. Marking** | D2 | High | System-readable vs. human-readable. Testable distinction. |
| 48 | **Cryptanalytic Attacks** | D3 | High | Birthday attack, meet-in-the-middle, known/chosen plaintext, side-channel. |
| 49 | **Micro-segmentation and Zero Trust Networking** | D4 | High | Per-workload security, VXLAN, distributed firewalls. |
| 50 | **Session Management** | D5 | High | Hijacking prevention, session ID security, OWASP recommendations. |
| 51 | **Password Policy (NIST SP 800-63B)** | D5 | High-Medium | NIST recommends against forced expiration. Practice pattern. |
| 52 | **IP Addressing (IPv4/IPv6)** | D4 | High | Classful addressing, CIDR, subnetting, NAT/PAT. |
| 53 | **DRM and IRM** | D2 | High | Digital rights management, DMCA foundation. |
| 54 | **Fuzz Testing** | D6 | High | Mutation vs. generational fuzzing. |
| 55 | **SSAE 18 / ISAE 3402** | D6 | High | Audit standard evolution from SAS 70. |

---

## Scene Count Estimates

Total additional scenes needed per domain, broken down by act placement:

| Domain | Act 1 (Foundational) | Act 2 (Intermediate) | Act 4 (Advanced) | Total Scenes |
|--------|---------------------|---------------------|------------------|-------------|
| D1: Security & Risk Mgmt | 6 | 12 | 16 | **34** |
| D2: Asset Security | 3 | 11 | 14 | **28** |
| D3: Security Arch & Eng | 0 | 19 | 18 | **37** |
| D4: Comm & Network Sec | 6 | 14 | 14 | **34** |
| D5: Identity & Access Mgmt | 0 | 16 | 10 | **26** |
| D6: Security Assessment | 3 | 16 | 17 | **36** |
| D7: Security Operations | 4 | 21 | 11 | **36** |
| D8: Software Dev Security | 0 | 16 | 11 | **27** |
| **Cross-Domain** | 0 | 10 | 6 | **16** |
| **TOTALS** | **22** | **135** | **117** | **274** |

> **Note:** These are minimum estimates. Complex topics (PKI, database security, backup strategies) may require additional scenes for adequate depth. The realistic range is **290--410 scenes** depending on teaching depth.

---

## Recommendations

### 1. Gap-to-Exam-Weight Ratio (Most Undertaught for Exam Importance)

| Domain | Exam Weight | Gap Severity | Gap-to-Weight Assessment |
|--------|------------|-------------|-------------------------|
| **D7: Security Operations** | 13% | CRITICAL | Most undertaught. 9 HIGH-priority gaps covering the most commonly tested D7 topics (backups, RAID, recovery sites, BIA, evidence). Current story covers only IR lifecycle and basic DR metrics. |
| **D3: Security Arch & Eng** | 13% | CRITICAL | Second most undertaught. PKI, digital signatures, key management, cloud security, fire suppression, and virtualization are ALL missing despite being top practice question topics. |
| **D6: Security Assessment** | 12% | CRITICAL | 10 HIGH-priority gaps. SAST/DAST distinction, SOC report types, team exercises, and code reviews are fundamental D6 topics with heavy exam presence but no story coverage. |
| **D4: Comm & Network Sec** | 13% | CRITICAL | 8 HIGH-priority gaps. TCP/IP model, IP addressing, secure protocols, email security, and network segmentation are foundational topics missing from story mode. |
| **D2: Asset Security** | 10% | HIGH | Pseudonymization/tokenization/anonymization, DLP, and CASB are heavily tested but missing. Despite lower exam weight, these are modern topics appearing on newer exam versions. |
| **D8: Software Dev Security** | 11% | MODERATE | Database security, development methodologies, and maturity models are missing, but OWASP Top 10, SAST/DAST, and DevSecOps are already well covered. |
| **D5: Identity & Access Mgmt** | 13% | HIGH | Biometrics deep dive, RADIUS/TACACS+, and Kerberos attacks are missing. However, fundamental IAM concepts are reasonably well covered. |
| **D1: Security & Risk Mgmt** | 15% | MODERATE | Despite being the highest-weighted domain, core concepts (CIA, risk analysis, governance, ethics) are well covered. Gaps are mostly supporting topics (IP law, privacy regulations, control types). |

### 2. Suggested Implementation Order

**Phase 1 -- Critical Foundation (55 scenes, covers 30 HIGH-priority gaps)**
1. D7 Act 2: Backup strategies, recovery sites, RAID, BIA, DRP testing, evidence types, investigation types, WRT/MTD, restoration order
2. D3 Act 2: PKI/certificates, digital signatures, key management, cloud security, fire suppression, virtualization
3. D6 Act 2: SAST/DAST/IAST, SOC report comparison, code reviews, red/blue/purple teams, credentialed scanning, CVE/CVSS, false positives/negatives

**Phase 2 -- High-Value Additions (50 scenes, covers 25 HIGH-priority gaps)**
4. D4 Act 1+2: TCP/IP model, three-way handshake, IP addressing, secure protocols, email security, NAC/802.1X, network segmentation
5. D8 Act 2: Database security, development methodologies, maturity models, change management
6. D1 Act 1+2: Control types, IP laws, security document hierarchy, threat modeling, personnel controls

**Phase 3 -- Important Breadth (40 scenes, covers MEDIUM-priority gaps)**
7. D5 Act 2: Biometrics, RADIUS/TACACS+, access control attacks, session management, password policies
8. D2 Act 2: Pseudonymization/tokenization/anonymization, DLP, CASB, scoping/tailoring
9. Cross-Domain: Cloud security integrated, zero trust, privacy regulations

**Phase 4 -- Completeness (remaining scenes, LOW-priority gaps)**
10. All domains Act 4: Advanced and supplementary topics

### 3. Expand Existing vs. New Scenes

**Expand existing scenes (modify current story content):**
- D1 Act 1 governance scene -- could be expanded to include security document hierarchy deep dive and control types
- D1 Act 1 risk scene -- could be expanded to include accountability vs. responsibility
- D3 current crypto scenes -- could be expanded to include digital signatures and key management
- D6 vulnerability assessment scenes -- could be expanded to include credentialed vs. uncredentialed scanning and false positive/negative distinction
- D7 IR lifecycle scenes -- could be expanded to include evidence types and investigation types
- D8 SDLC/OWASP scenes -- could be expanded to include development methodology comparison

**Requires entirely new scenes:**
- PKI and digital certificates (D3) -- entirely new concept with no existing scene to anchor to
- Backup strategies, RAID, and recovery sites (D7) -- no existing content
- Database security (D8) -- no existing content
- Fire suppression and physical security (D3) -- no existing content
- Biometric deep dive (D5) -- no existing content
- Cloud computing security (D3) -- no existing content
- DRP testing types (D7) -- no existing content
- Email security protocols (D4) -- no existing content
- TCP/IP model and IP addressing (D4) -- no existing content, though OSI model exists
- Maturity models (D8) -- no existing content
- SOC report comparison (D6) -- SOC 2 Type I/II exists but SOC 1 and SOC 3 are missing
- Pseudonymization/tokenization/anonymization (D2) -- no existing content
- DLP mechanics (D2) -- no existing content

---

*This gap analysis was generated by cross-referencing the GAPS TO ADD (Section 15) and PRACTICE QUESTION PATTERNS (Section 14) from all 8 domain knowledge summaries against the current story mode content in src/data/story-content.ts (legacy, all 8 domains) and src/data/story/domain1/act1.ts (new format, Domain 1 Act 1 only). Topics were prioritized by their frequency of appearance in practice question patterns and their alignment with CISSP exam weighting.*
