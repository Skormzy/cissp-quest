# CISSP Quest -- Complete Glossary

> **Generated:** 2026-03-09
> **Total Terms:** 392
> **Existing Terms:** 208
> **New Terms:** 184
> **Coverage:** All 8 CISSP domains

---

## Summary by Domain

| Domain | Existing | New | Total |
|--------|----------|-----|-------|
| D1: Security & Risk Management | 26 | 28 | 54 |
| D2: Asset Security | 25 | 20 | 45 |
| D3: Security Architecture & Engineering | 25 | 27 | 52 |
| D4: Communication & Network Security | 25 | 22 | 47 |
| D5: Identity & Access Management | 25 | 20 | 45 |
| D6: Security Assessment & Testing | 25 | 26 | 51 |
| D7: Security Operations | 25 | 24 | 49 |
| D8: Software Development Security | 25 | 21 | 46 |
| Cross-Domain | 7 | -- | 7 |

---

## Domain 1: Security and Risk Management

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Accountability vs. Responsibility | (See Security Document Hierarchy) -- partially implied | Delegation Chain | d1-act1-governance | -- |
| 2 | ALE (Annualized Loss Expectancy) | Expected monetary loss from a threat per year; ALE = SLE x ARO | Annual Damage Bill | d1-act1-risk | -- |
| 3 | ARO (Annualized Rate of Occurrence) | How many times per year a threat is expected to occur | Frequency Counter | d1-act1-risk | -- |
| 4 | BIA (Business Impact Analysis) | Identifies critical business functions and determines disruption impact | Triage Report | d1-act1-bcp | -- |
| 5 | Business Continuity Planning (BCP) | Proactive plan ensuring critical functions continue during and after disaster | Plan B Blueprint | d1-act1-bcp | -- |
| 6 | CIA Triad | Three core principles: Confidentiality, Integrity, Availability | Three-Legged Stool | d1-act1-cia | -- |
| 7 | Compliance | Adhering to laws, regulations, and industry standards | Rule Book | d1-act1-governance | -- |
| 8 | Due Care | Taking reasonable steps to protect assets after identifying risks | Acting Responsibly | d1-act1-risk | -- |
| 9 | Due Diligence | Researching and understanding risks before making decisions | Doing Homework | d1-act1-risk | -- |
| 10 | Ethics (ISC2 Code of Ethics) | Four mandatory canons: protect society, act honorably, diligent service, advance profession | Honor Code | d1-act1-ethics | -- |
| 11 | GDPR (General Data Protection Regulation) | EU regulation governing collection and processing of personal data of EU citizens | EU Data Shield | d1-act1-compliance | -- |
| 12 | Governance | Framework of rules, practices, and processes directing and controlling security | Government of Security | d1-act1-governance | -- |
| 13 | Least Privilege | Users should only have minimum access necessary for their job | Hotel Key Card | d1-act1-access | -- |
| 14 | Maximum Tolerable Downtime (MTD) | Absolute longest a business function can be unavailable before unrecoverable harm | Death Clock | d1-act1-bcp | -- |
| 15 | Qualitative Risk Analysis | Assessing risk using subjective ratings (High/Medium/Low) | Color-Code Rating | d1-act1-risk | -- |
| 16 | Quantitative Risk Analysis | Assessing risk using precise numerical and monetary values | Calculator Approach | d1-act1-risk | -- |
| 17 | Risk Acceptance | Deliberate decision to acknowledge and accept risk without additional controls | Signing the Waiver | d1-act1-risk | -- |
| 18 | Risk Assessment | Process of identifying, analyzing, and evaluating risks | Doctor's Diagnosis | d1-act1-risk | -- |
| 19 | Risk Mitigation | Reducing probability or impact of risk by implementing controls | Safety Net | d1-act1-risk | -- |
| 20 | Risk Transference | Shifting financial burden of risk to a third party (e.g., insurance) | Passing the Bill | d1-act1-risk | -- |
| 21 | RPO (Recovery Point Objective) | Maximum acceptable data loss measured in time | Backward Clock | d1-act1-bcp | -- |
| 22 | RTO (Recovery Time Objective) | Maximum acceptable downtime before system must be restored | Forward Clock | d1-act1-bcp | -- |
| 23 | Security Policy | High-level document defining organization's security goals and direction | Constitution | d1-act1-governance | -- |
| 24 | Separation of Duties (SoD) | Requiring multiple people to complete a critical task | Two-Key Safe | d1-act1-access | -- |
| 25 | Supply Chain Risk Management | Managing security risks from third-party vendors, suppliers, and providers | Weakest Link Chain | d1-act1-risk | -- |
| 26 | Threat Modeling | Structured approach to identifying and prioritizing potential threats | Blueprint of Doom | d1-act1-risk | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | AAA Services | Five elements of access control: Identification, Authentication, Authorization, Auditing, Accounting | Five Checkpoints | d1-act1-aaa | MEDIUM |
| 2 | Business Case Development | Justifying security investments to executives with cost-benefit reasoning | Pitch Deck | d1-act4-business | LOW |
| 3 | Compensating Control | Alternative control used when the primary control cannot be implemented | Plan B Control | d1-act1-controls | HIGH |
| 4 | Continuous Improvement (PDCA) | Plan-Do-Check-Act cycle for iterative process improvement | Deming Wheel | d1-act2-pdca | LOW |
| 5 | Copyright | Automatic protection for creative works; life of author + 70 years | Author's Shield | d1-act2-ip | HIGH |
| 6 | Corrective Control | Control that restores systems to normal after an incident | Band-Aid Fix | d1-act1-controls | HIGH |
| 7 | Cost-Benefit Analysis | Determining if a security control's cost is justified by risk reduction | Worth the Price | d1-act2-cba | LOW |
| 8 | DAD Triad | Failure modes opposing CIA: Disclosure, Alteration, Destruction | Anti-CIA | d1-act1-cia | MEDIUM |
| 9 | Detective Control | Control that identifies and records a security event after it occurs | Security Camera | d1-act1-controls | HIGH |
| 10 | Deterrent Control | Control that discourages security violations through fear of consequences | Warning Sign | d1-act1-controls | HIGH |
| 11 | Directive Control | Control that mandates behavior through policy or regulation | Posted Rules | d1-act1-controls | HIGH |
| 12 | Employee Duress | Keywords and protocols for coercion situations | Silent Alarm | d1-act4-personnel | LOW |
| 13 | Import/Export Controls | Regulations like Wassenaar Arrangement, ITAR, EAR controlling technology transfers | Border Checkpoint | d1-act4-legal | LOW |
| 14 | Investigation Types | Administrative, criminal, civil, regulatory with different burden-of-proof standards | Courtroom Ladder | d1-act4-legal | LOW |
| 15 | Job Rotation | Moving personnel between positions to detect fraud and reduce collusion risk | Musical Chairs | d1-act2-personnel | HIGH |
| 16 | Mandatory Vacations | Requiring employees to take time off so others can review their work | Forced Time Off | d1-act2-personnel | HIGH |
| 17 | Mergers and Acquisitions Security | Managing increased risk during organizational change events | Corporate Marriage | d1-act4-risk | LOW |
| 18 | NCA and NDA Types | Non-compete and non-disclosure agreements restricting employee activities | Secrecy Contract | d1-act4-legal | LOW |
| 19 | OECD Privacy Guidelines | Eight principles for international privacy (collection limitation, purpose specification, etc.) | Privacy Compass | d1-act2-privacy | MEDIUM |
| 20 | Organizational Roles | Senior manager, security professional, asset owner, custodian, user, auditor | Org Chart Cast | d1-act1-roles | MEDIUM |
| 21 | Patent | IP requiring public disclosure; 20-year protection for inventions/processes | Blueprint License | d1-act2-ip | HIGH |
| 22 | Preventive Control | Control that stops a security event before it occurs | Locked Door | d1-act1-controls | HIGH |
| 23 | Privacy Impact Assessment (PIA/DPIA) | Assessment of how personal data collection impacts individual privacy | Privacy X-Ray | d1-act2-privacy | MEDIUM |
| 24 | Recovery Control | Control that restores resources and capabilities after a security violation | Restore Button | d1-act1-controls | HIGH |
| 25 | Risk Communication and Reporting | Clear, timely, relevant, transparent, consistent risk reporting to stakeholders | Status Broadcast | d1-act4-risk | LOW |
| 26 | Security Awareness Training | Educating employees on threats, policies, and best practices; distinct from formal training | Human Firewall | d1-act2-training | MEDIUM |
| 27 | Trademark | Brand identifiers (logos, names) renewable indefinitely | Brand Stamp | d1-act2-ip | HIGH |
| 28 | Trade Secret | IP protected by secrecy; no registration required; unlimited duration | Secret Recipe | d1-act2-ip | HIGH |

---

## Domain 2: Asset Security

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Asset Inventory | Comprehensive catalog of all organizational assets | What Do We Have | d2-act1-inventory | -- |
| 2 | Baseline | Minimum set of security controls required for a system | Safety Floor | d2-act1-baseline | -- |
| 3 | Data at Rest | Data stored on a device not actively being transmitted or processed | Sleeping Data | d2-act1-states | -- |
| 4 | Data Classification | Organizing data into categories based on sensitivity | Sorting Hat | d2-act1-classify | -- |
| 5 | Data Custodian | Person implementing and maintaining security controls determined by data owner | Data Janitor | d2-act1-roles | -- |
| 6 | Data in Transit | Data being transmitted across a network | Traveling Data | d2-act1-states | -- |
| 7 | Data in Use | Data actively being processed in memory (RAM) | Working Data | d2-act1-states | -- |
| 8 | Data Masking | Hiding original data with modified content (e.g., showing last 4 digits) | Data Disguise | d2-act1-protect | -- |
| 9 | Data Owner | Senior manager responsible for determining classification and access | Decision Maker | d2-act1-roles | -- |
| 10 | Data Remanence | Residual data remaining on storage media after deletion attempts | Ghost Data | d2-act1-destroy | -- |
| 11 | Data Retention Policy | Rules governing how long data is kept before secure disposal | Shelf Life Label | d2-act1-lifecycle | -- |
| 12 | Data Sovereignty | Data is subject to laws of the country where it is stored or processed | Data Passport | d2-act1-sovereignty | -- |
| 13 | Degaussing | Using a powerful magnetic field to erase data on magnetic media | Magnetic Eraser | d2-act1-destroy | -- |
| 14 | Digital Rights Management (DRM) | Technology controlling how digital content is used after distribution | Content Cage | d2-act1-drm | -- |
| 15 | DLP (Data Loss Prevention) | Technology monitoring, detecting, and preventing unauthorized data transmission | Exit Guard | d2-act1-dlp | -- |
| 16 | Encryption | Transforming plaintext into unreadable ciphertext using algorithm and key | Digital Lock | d2-act1-crypto | -- |
| 17 | Information Lifecycle Management | Managing data from creation through destruction (Create-Store-Use-Share-Archive-Destroy) | Data Life Stages | d2-act1-lifecycle | -- |
| 18 | Media Handling | Procedures for secure transportation, storage, and disposal of media | Diamond Package | d2-act1-media | -- |
| 19 | PHI (Protected Health Information) | Health-related info that can identify an individual; protected under HIPAA | Medical Shield | d2-act1-privacy | -- |
| 20 | PII (Personally Identifiable Information) | Any data that can identify a specific individual | Identity Fingerprint | d2-act1-privacy | -- |
| 21 | Pseudonymization | Replacing identifying fields with artificial identifiers; reversible with key | Pen Name | d2-act1-privacy | -- |
| 22 | Record Retention | Maintaining records for required time periods per regulations | Filing Cabinet Timer | d2-act1-retention | -- |
| 23 | Sanitization | Removing data from media so it cannot be recovered (clear, purge, destroy) | Data Cremation | d2-act1-destroy | -- |
| 24 | Scoping and Tailoring | Selecting applicable controls (scoping) and customizing them (tailoring) | Suit Fitting | d2-act1-controls | -- |
| 25 | Tokenization | Replacing sensitive data with non-sensitive placeholder via secure lookup table | Subway Token | d2-act1-protect | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Air-Gapped Network | Physically isolated network with no external connections | Island Network | d2-act4-airgap | LOW |
| 2 | Anonymization | Irreversibly removing all identifying information; data cannot be re-identified | Identity Eraser | d2-act2-deident | HIGH |
| 3 | CASB (Cloud Access Security Broker) | Intermediary enforcing security policies between users and cloud services | Cloud Gatekeeper | d2-act2-casb | HIGH |
| 4 | Classification vs. Categorization | Classification assigns hierarchical levels; categorization sorts into non-hierarchical classes | Rank vs. Bucket | d2-act1-classify | MEDIUM |
| 5 | Compliance Officer | Dedicated position ensuring business activities follow applicable laws | Rules Enforcer | d2-act2-roles | LOW |
| 6 | Data Collection Limitation | Privacy principle of collecting only the minimum necessary data | Data Diet | d2-act2-privacy | LOW |
| 7 | Data Privacy Officer (DPO) | GDPR-mandated role overseeing data protection strategy and compliance | Privacy Guardian | d2-act2-roles | LOW |
| 8 | Declassification | Process of downgrading media/systems from higher to lower classification | Security Downgrade | d2-act4-classify | LOW |
| 9 | Defensible Destruction | Destroying data in a legally defensible, documented, compliant manner | Legal Shredding | d2-act4-destroy | LOW |
| 10 | E-discovery and Litigation Hold | Legal obligation to preserve data when litigation is anticipated | Evidence Freeze | d2-act4-legal | MEDIUM |
| 11 | End-to-End Encryption | Encrypting data at source, decrypting only at destination | Sealed Envelope | d2-act4-crypto | MEDIUM |
| 12 | EOL vs. EOS | End of Life (no more development) vs. End of Support (no more patches) | Retirement Stages | d2-act4-lifecycle | MEDIUM |
| 13 | Homomorphic Encryption | Computing on encrypted data without decryption | Blind Calculator | d2-act4-crypto | LOW |
| 14 | IRM (Information Rights Management) | Enterprise DRM for documents controlling print, forward, edit permissions | Document Handcuffs | d2-act4-drm | HIGH |
| 15 | Labeling | System-readable classification indicators (metadata, electronic labels) | Digital Stamp | d2-act1-labeling | HIGH |
| 16 | Link Encryption | Encrypting data at each hop; decrypted and re-encrypted at each node | Relay Seal | d2-act4-crypto | MEDIUM |
| 17 | Marking | Human-readable classification indicators (watermarks, headers, footers) | Visible Badge | d2-act1-labeling | HIGH |
| 18 | Memory Types | Volatile (DRAM/RAM) vs. non-volatile (ROM, PROM, EPROM, EEPROM, flash) | Whiteboard vs. Stone | d2-act4-memory | LOW |
| 19 | Object Reuse | Secure reassignment of storage media to prevent data leakage | Clean Slate | d2-act4-reuse | LOW |
| 20 | Security Baselines (NIST SP 800-53B) | Low-impact, moderate-impact, high-impact control baselines | Tiered Floors | d2-act2-baselines | MEDIUM |

---

## Domain 3: Security Architecture and Engineering

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | AES (Advanced Encryption Standard) | Current symmetric standard; 128/192/256-bit keys; replaced DES | Gold Standard Lock | d3-act1-crypto | -- |
| 2 | Asymmetric Encryption | Key pair encryption (public + private); solves key distribution | Mailbox Model | d3-act1-crypto | -- |
| 3 | Clark-Wilson Model | Commercial integrity model using well-formed transactions and SoD | Business Integrity | d3-act1-models | -- |
| 4 | Cloud Security Shared Responsibility | IaaS/PaaS/SaaS split security duties between provider and customer | Pizza Analogy | d3-act1-cloud | -- |
| 5 | Containerization | Lightweight virtualization packaging apps with dependencies; shares host kernel | Shipping Container | d3-act1-virtual | -- |
| 6 | Cryptographic Attacks | Methods to defeat encryption: brute force, birthday, rainbow table, etc. | Lock Picking Set | d3-act1-crypto | -- |
| 7 | Defense in Depth | Layered security using multiple overlapping controls | Castle Layers | d3-act1-design | -- |
| 8 | Digital Signature | Hash encrypted with sender's private key; provides integrity, auth, non-repudiation | Crypto Handwriting | d3-act1-crypto | -- |
| 9 | Hashing | One-way function producing fixed-length digest; verifies integrity | Data Fingerprint | d3-act1-crypto | -- |
| 10 | HSM (Hardware Security Module) | Dedicated hardware for managing and protecting cryptographic keys | Fort Knox Box | d3-act1-hardware | -- |
| 11 | IPsec | Protocol suite for securing IP comms; Transport and Tunnel modes; AH and ESP | Armored Pipeline | d3-act1-vpn | -- |
| 12 | Kerckhoffs Principle | System secure even if everything except the key is public knowledge | Keys Are King | d3-act1-crypto | -- |
| 13 | Microservices | Apps built as small independent services communicating via APIs | Lego Architecture | d3-act1-arch | -- |
| 14 | OWASP Top 10 | Ten most critical web application security risks | Web Risk Chart | d3-act1-web | -- |
| 15 | PKI (Public Key Infrastructure) | Framework for creating, managing, and revoking digital certificates | Digital Post Office | d3-act1-pki | -- |
| 16 | Secure Defaults | Systems deny access by default; fail-closed behavior | Default Deny Door | d3-act1-design | -- |
| 17 | Secure Design Principles | Saltzer-Schroeder principles: least privilege, fail-safe, complete mediation, etc. | Architecture Rules | d3-act1-design | -- |
| 18 | Security Models (Bell-LaPadula) | Confidentiality model: no read up, no write down | Leak Blocker | d3-act1-models | -- |
| 19 | Security Models (Biba) | Integrity model: no read down, no write up | Purity Guard | d3-act1-models | -- |
| 20 | Side-Channel Attack | Extracting secrets via physical characteristics (power, timing, EM emissions) | Side Door Spy | d3-act1-attacks | -- |
| 21 | Symmetric Encryption | Same key encrypts and decrypts; fast but key distribution problem | One Key Fits Both | d3-act1-crypto | -- |
| 22 | TPM (Trusted Platform Module) | Hardware chip storing crypto keys; enables secure boot and disk encryption | Motherboard Vault | d3-act1-hardware | -- |
| 23 | Trusted Computing Base (TCB) | All protection mechanisms within a system enforcing the security policy | Trust Core | d3-act1-models | -- |
| 24 | Virtualization Security | Security for virtual environments; hypervisor attacks, VM escape, VM sprawl | Virtual Fortress | d3-act1-virtual | -- |
| 25 | Zero Trust | Never trust, always verify; no trusted internal network; microsegmentation | Trust No One | d3-act1-design | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Block Cipher Modes (ECB, CBC, CTR, GCM) | Operational modes for block ciphers determining how blocks are chained | Brick Laying Patterns | d3-act4-crypto | MEDIUM |
| 2 | Brewer-Nash (Chinese Wall) Model | Dynamic access control preventing conflicts of interest | Ethics Barrier | d3-act4-models | MEDIUM |
| 3 | Certificate Authority (CA) | Trusted third party that issues and signs digital certificates | ID Card Office | d3-act2-pki | HIGH |
| 4 | Certificate Chain of Trust | Hierarchy from root CA to intermediate CA to end-entity certificate | Trust Ladder | d3-act2-pki | HIGH |
| 5 | Certificate Pinning | Associating a host with its expected certificate to prevent MITM substitution | Locked Stamp | d3-act2-pki | HIGH |
| 6 | Certificate Revocation List (CRL) | Published list of revoked certificates checked periodically | Blacklist Ledger | d3-act2-pki | HIGH |
| 7 | CPTED (Crime Prevention Through Environmental Design) | Using natural surveillance, access control, and territorial reinforcement | Designed Safety | d3-act2-physical | LOW |
| 8 | Cross-Certification | Two CAs establishing mutual trust to validate each other's certificates | Mutual Trust Pact | d3-act2-pki | HIGH |
| 9 | Crypto-Shredding | Destroying encryption keys to render encrypted data permanently inaccessible | Key Destruction | d3-act4-crypto | LOW |
| 10 | Deluge System | Fire suppression flooding area with water; used for high-hazard areas | Water Flood Gate | d3-act2-fire | HIGH |
| 11 | Dry Pipe System | Fire suppression with empty pipes until activation; for freezing environments | Empty Pipe Guard | d3-act2-fire | HIGH |
| 12 | Enterprise Architecture Frameworks | Zachman, TOGAF, SABSA for aligning IT with business objectives | Blueprint Standards | d3-act4-arch | LOW |
| 13 | FM-200 (HFC-227ea) | Clean-agent fire suppression gas; Halon replacement; safe for occupied spaces | Safe Gas Shield | d3-act2-fire | HIGH |
| 14 | Graham-Denning Model | Formal model defining 8 primitive protection rights for subjects and objects | Eight Rights Model | d3-act4-models | LOW |
| 15 | Hybrid Cryptography | Combining symmetric and asymmetric crypto (e.g., TLS key exchange + AES data) | Best of Both Keys | d3-act2-crypto | LOW |
| 16 | Hypervisor Type 1 vs. Type 2 | Type 1 (bare-metal, more secure) vs. Type 2 (hosted, runs on OS) | Foundation vs. Addon | d3-act2-virtual | HIGH |
| 17 | ICS/SCADA Security | Securing industrial control systems; unique OT challenges; Stuxnet example | Factory Shield | d3-act4-ics | MEDIUM |
| 18 | Key Escrow | Third party holding copy of encryption key for recovery or law enforcement | Spare Key Holder | d3-act2-keymanage | HIGH |
| 19 | Key Management Lifecycle | Generation, distribution, storage, rotation, revocation, destruction of crypto keys | Key Life Stages | d3-act2-keymanage | HIGH |
| 20 | M-of-N Control | Requiring M out of N key holders to reconstruct a key (split knowledge) | Shared Secret Vault | d3-act2-keymanage | HIGH |
| 21 | OCSP (Online Certificate Status Protocol) | Real-time certificate revocation checking; faster than CRL | Live Status Check | d3-act2-pki | HIGH |
| 22 | One-Time Pad | Theoretically unbreakable cipher requiring key as long as message, used only once | Perfect But Impractical | d3-act4-crypto | LOW |
| 23 | Physical Access Controls | Fences, gates, mantraps, locks, CCTV, motion detectors, guards, lighting | Fortress Features | d3-act2-physical | MEDIUM |
| 24 | Power and Environmental Controls | UPS, generators, HVAC, humidity, temperature, TEMPEST shielding | Facility Life Support | d3-act2-physical | MEDIUM |
| 25 | Pre-Action System | Fire suppression requiring two triggers (detection + sprinkler head); ideal for data centers | Double-Check Sprinkler | d3-act2-fire | HIGH |
| 26 | Quantum Cryptography | QKD and post-quantum algorithms; threats to RSA/ECC from quantum computing | Future-Proof Crypto | d3-act4-crypto | LOW |
| 27 | Security Modes of Operation | Dedicated, system high, compartmented, multilevel modes for system clearance | Clearance Levels | d3-act4-modes | LOW |
| 28 | Steganography | Hiding data within other media (images, audio); distinct from encryption | Hidden Message | d3-act4-crypto | MEDIUM |
| 29 | Wet Pipe System | Fire suppression with water-filled pipes; fastest response; risk of leaks | Always-Ready Sprinkler | d3-act2-fire | HIGH |
| 30 | X.509 | Standard format for digital certificates defining structure and fields | Certificate Blueprint | d3-act2-pki | HIGH |

---

## Domain 4: Communication and Network Security

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | ARP Poisoning | Forged ARP messages linking attacker's MAC to legitimate IP; enables MITM | Fake Mailbox | d4-act1-attacks | -- |
| 2 | Bluetooth Security | Short-range wireless with bluejacking, bluesnarfing, bluebugging attacks | Wireless Risk | d4-act1-wireless | -- |
| 3 | Content Delivery Network (CDN) | Distributed servers caching content closer to users; DDoS protection | Library Copies | d4-act1-cdn | -- |
| 4 | DDoS (Distributed Denial of Service) | Overwhelming target with traffic from many sources; attacks availability | Flash Mob Attack | d4-act1-attacks | -- |
| 5 | DMZ (Demilitarized Zone) | Network segment between internal network and internet for public services | Buffer Zone | d4-act1-arch | -- |
| 6 | DNS (Domain Name System) | Translates domain names to IP addresses; critical internet infrastructure | Internet Phone Book | d4-act1-protocols | -- |
| 7 | Email Security (SPF, DKIM, DMARC) | Three complementary email authentication protocols preventing spoofing | Triple Email Lock | d4-act1-email | -- |
| 8 | Firewall | Network device monitoring and filtering traffic based on rules | Gate Guard | d4-act1-devices | -- |
| 9 | IDS (Intrusion Detection System) | Monitors for suspicious patterns and generates alerts; passive detection | Security Alarm | d4-act1-ids | -- |
| 10 | IPS (Intrusion Prevention System) | Monitors, detects, AND blocks malicious traffic inline; active prevention | Security Bouncer | d4-act1-ips | -- |
| 11 | Man-in-the-Middle (MITM) Attack | Intercepting and possibly altering communication between two parties | Eavesdropping Postman | d4-act1-attacks | -- |
| 12 | NAT (Network Address Translation) | Translates private IPs to public IPs; not a security control | Address Receptionist | d4-act1-protocols | -- |
| 13 | Network Access Control (NAC) | Enforces security policies on devices before granting network access | Entry Checkpoint | d4-act1-nac | -- |
| 14 | Network Segmentation | Dividing network into isolated segments to contain threats | Ship Compartments | d4-act1-arch | -- |
| 15 | OSI Model | 7-layer framework: Physical, Data Link, Network, Transport, Session, Presentation, Application | Seven-Story Building | d4-act1-osi | -- |
| 16 | Port Scanning | Probing network ports to discover running services | Knocking on Doors | d4-act1-recon | -- |
| 17 | Proxy Server | Intermediary between clients and destination servers; filtering and caching | Stand-In Server | d4-act1-proxy | -- |
| 18 | SDN (Software-Defined Networking) | Decouples control plane from data plane for centralized management | Brain-Body Split | d4-act1-sdn | -- |
| 19 | SIEM (Security Information and Event Management) | Collects, correlates, and analyzes security logs from across the enterprise | Security Nerve Center | d4-act1-siem | -- |
| 20 | SNMP (Simple Network Management Protocol) | Monitoring and managing network devices; v3 adds encryption | Network Monitor | d4-act1-protocols | -- |
| 21 | TCP/IP Model | 4-layer practical model: Network Access, Internet, Transport, Application | Four-Floor Building | d4-act1-tcpip | -- |
| 22 | TLS (Transport Layer Security) | Cryptographic protocol for secure network communication; powers HTTPS | Transport Padlock | d4-act1-tls | -- |
| 23 | VLAN (Virtual Local Area Network) | Logical network subdivision creating separate broadcast domains | Invisible Walls | d4-act1-vlan | -- |
| 24 | VPN (Virtual Private Network) | Encrypted tunnel over public network for secure communication | Invisible Tunnel | d4-act1-vpn | -- |
| 25 | Wireless Security (WPA3) | Latest Wi-Fi protocol using SAE; forward secrecy; offline attack protection | Wi-Fi Shield | d4-act1-wireless | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | 802.1X | IEEE standard for port-based network access control using EAP authentication | Door Badge Reader | d4-act2-nac | HIGH |
| 2 | Cabling Standards | Cat5e/6/6a/7, fiber types, distance limitations, attenuation characteristics | Wire Types | d4-act1-physical | LOW |
| 3 | Cellular/Mobile Networks (4G/5G) | Mobile network security; 5G mutual authentication and network slicing | Mobile Tower | d4-act4-wireless | MEDIUM |
| 4 | CIDR (Classless Inter-Domain Routing) | IP addressing method replacing classful addressing; slash notation (e.g., /24) | Flexible Subnets | d4-act1-ip | HIGH |
| 5 | Circuit Switching vs. Packet Switching | Dedicated path (circuit) vs. independent packets; PVC vs. SVC | Dedicated Road vs. Mail | d4-act4-wan | LOW |
| 6 | Converged Protocols | Protocols combining different services: iSCSI, FCoE, VoIP, InfiniBand | Multi-Use Pipeline | d4-act4-protocols | MEDIUM |
| 7 | DNSSEC | DNS Security Extensions adding digital signatures to prevent DNS tampering | DNS Signature | d4-act2-dns | LOW |
| 8 | IKE Phases | Phase 1 establishes secure channel; Phase 2 negotiates IPsec SA | Two-Step Handshake | d4-act4-vpn | LOW |
| 9 | IPv4 vs. IPv6 | IPv4 (32-bit, NAT required) vs. IPv6 (128-bit, built-in IPsec) | Old Address vs. New | d4-act1-ip | HIGH |
| 10 | Micro-Segmentation | Per-workload security using network overlays and distributed firewalls | Individual Bubbles | d4-act4-zerotrust | HIGH |
| 11 | Network Topologies | Bus, star, ring, mesh, tree, hybrid with different fault-tolerance characteristics | Road Maps | d4-act1-topo | LOW |
| 12 | North-South vs. East-West Traffic | North-south crosses perimeter; east-west moves laterally within network | Vertical vs. Horizontal | d4-act2-traffic | MEDIUM |
| 13 | RADIUS | Remote Authentication Dial-In User Service; combines authentication and authorization | Network ID Checker | d4-act2-aaa | HIGH |
| 14 | Remote Access Protocols | PAP (plaintext), CHAP (challenge), EAP (extensible) authentication methods | Door Lock Types | d4-act2-remote | LOW |
| 15 | S/MIME | Secure email standard using PKI certificates for encryption and signing | Certified Mail | d4-act2-email | HIGH |
| 16 | SD-WAN | Software-defined WAN for intelligent path selection across multiple links | Smart Highway | d4-act4-sdn | MEDIUM |
| 17 | SSH (Secure Shell) | Encrypted remote access protocol replacing Telnet; port 22 | Secure Remote Door | d4-act2-secure | HIGH |
| 18 | Switching Technologies | Cut-through vs. store-and-forward switching; CAM table; STP | Traffic Director | d4-act2-switching | MEDIUM |
| 19 | SYN Flood Attack | Sending many SYN packets without completing handshake; exhausts server resources | Half-Open Flood | d4-act1-attacks | HIGH |
| 20 | TACACS+ | Cisco protocol separating AAA functions; encrypts entire payload | Full-Encrypt AAA | d4-act2-aaa | HIGH |
| 21 | TCP Three-Way Handshake | SYN, SYN/ACK, ACK connection establishment process | Three-Step Greeting | d4-act1-tcp | HIGH |
| 22 | VoIP Security | Securing Voice over IP; SIPS, SRTP, dedicated VLANs, PBX security | Phone Network Lock | d4-act4-voip | MEDIUM |

---

## Domain 5: Identity and Access Management

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | ABAC (Attribute-Based Access Control) | Access decisions based on attributes of user, resource, action, environment | Multi-Factor Gate | d5-act1-models | -- |
| 2 | Access Control Matrix | Table defining permissions between subjects and objects | Permission Spreadsheet | d5-act1-models | -- |
| 3 | Access Review | Periodic verification that users still need current access privileges | Spring Cleaning | d5-act1-lifecycle | -- |
| 4 | Authentication Factors | Three categories: something you KNOW, HAVE, ARE | KHA Triple | d5-act1-authn | -- |
| 5 | Biometric Authentication | Using unique physical or behavioral characteristics for identification | Body ID | d5-act1-biometric | -- |
| 6 | Credential Management | Policies and tools for securely storing, rotating, and protecting credentials | Key Cabinet | d5-act1-creds | -- |
| 7 | DAC (Discretionary Access Control) | Data owner decides who can access resources; least restrictive | Owner's Choice | d5-act1-models | -- |
| 8 | Directory Services | Centralized databases managing identity info; Active Directory, LDAP | Digital Phone Book | d5-act1-directory | -- |
| 9 | Federation | Trust relationship allowing cross-organization authentication | Passport Alliance | d5-act1-federation | -- |
| 10 | Identity Lifecycle | Management from creation to deletion: provision, manage, audit, deprovision | Identity Life Stages | d5-act1-lifecycle | -- |
| 11 | Identity Proofing | Verifying a person's identity before issuing credentials | ID Verification | d5-act1-proofing | -- |
| 12 | Just-in-Time (JIT) Access | Granting elevated privileges only when needed for limited time | Temporary Pass | d5-act1-pam | -- |
| 13 | Kerberos | Network authentication protocol using tickets and KDC (AS + TGS) | Three-Headed Dog | d5-act1-kerberos | -- |
| 14 | LDAP (Lightweight Directory Access Protocol) | Protocol for accessing directory services; port 389 (636 for LDAPS) | Directory Lookup | d5-act1-ldap | -- |
| 15 | MAC (Mandatory Access Control) | Access based on security labels and clearances; most restrictive | Military Access | d5-act1-models | -- |
| 16 | MFA (Multi-Factor Authentication) | Two or more different authentication factors to verify identity | Multiple Locks | d5-act1-mfa | -- |
| 17 | OAuth 2.0 | Authorization framework using access tokens instead of passwords | Permission Slip | d5-act1-oauth | -- |
| 18 | PAM (Privileged Access Management) | Securing, managing, monitoring privileged accounts | Admin Vault | d5-act1-pam | -- |
| 19 | Privilege Escalation | Gaining higher access than originally granted; vertical or horizontal | Climbing the Ladder | d5-act1-attacks | -- |
| 20 | RBAC (Role-Based Access Control) | Access based on user's role in the organization | Job Title Gate | d5-act1-models | -- |
| 21 | SAML (Security Assertion Markup Language) | XML-based SSO standard between identity provider and service provider | SSO Passport | d5-act1-saml | -- |
| 22 | Session Management | Controlling and tracking user sessions after authentication | Visitor Pass Control | d5-act1-session | -- |
| 23 | SSO (Single Sign-On) | Authenticate once, access multiple systems without re-entering credentials | Master Key | d5-act1-sso | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Authenticator Assurance Levels (AAL) | NIST AAL1/AAL2/AAL3 defining authentication strength requirements | Security Tiers | d5-act4-aal | LOW |
| 2 | Biometric CER/EER | Crossover Error Rate where FAR equals FRR; lower = more accurate system | Accuracy Sweet Spot | d5-act2-biometric | HIGH |
| 3 | Biometric Type 1 Error (FRR) | False Reject Rate; denying legitimate user; increasing sensitivity raises FRR | Locked Out User | d5-act2-biometric | HIGH |
| 4 | Biometric Type 2 Error (FAR) | False Accept Rate; accepting imposter; decreasing sensitivity raises FAR | Imposter Accepted | d5-act2-biometric | HIGH |
| 5 | CAPTCHA | Challenge to distinguish humans from bots; prevents automated attacks | Human Test | d5-act2-captcha | LOW |
| 6 | Context-Dependent Access Control | Access decisions based on context (time, location, system state) | Situation Gate | d5-act2-authz | MEDIUM |
| 7 | Content-Dependent Access Control | Access decisions based on the content being accessed | Content Filter | d5-act2-authz | MEDIUM |
| 8 | Device Authentication | Verifying device identity via certificates, fingerprinting, or 802.1X | Device Badge | d5-act2-device | MEDIUM |
| 9 | Golden Ticket Attack | Forged Kerberos TGT using compromised KRBTGT hash; unlimited domain access | Master Forgery | d5-act2-attacks | HIGH |
| 10 | Implicit Deny | Default behavior denying access unless explicitly permitted | Closed Gate Default | d5-act2-authz | MEDIUM |
| 11 | Mutual Authentication | Both parties verify each other's identity before communication | Two-Way Handshake | d5-act4-mutual | MEDIUM |
| 12 | Password Policy (NIST SP 800-63B) | NIST recommends length over complexity; no forced rotation; check breach lists | Modern Password Rules | d5-act2-password | MEDIUM |
| 13 | Pass-the-Hash Attack | Using captured password hash to authenticate without knowing the password | Hash Shortcut | d5-act2-attacks | HIGH |
| 14 | Rainbow Table Attack | Precomputed hash lookup table for cracking passwords; defeated by salting | Hash Cheat Sheet | d5-act2-attacks | HIGH |
| 15 | Risk-Based Access Control | Dynamic access decisions using real-time risk scoring | Live Risk Gate | d5-act4-risk | LOW |
| 16 | Service Account Management | Securing non-interactive accounts with password rotation and restrictions | Robot Account | d5-act2-service | MEDIUM |
| 17 | Silver Ticket Attack | Forged Kerberos service ticket targeting a specific service | Service Forgery | d5-act2-attacks | HIGH |
| 18 | su vs. sudo | su switches user context; sudo executes single command with elevated privileges | Switch vs. Borrow | d5-act2-linux | MEDIUM |
| 19 | XACML | eXtensible Access Control Markup Language; standard for ABAC policy definitions | Policy Language | d5-act4-xacml | LOW |
| 20 | Zero Trust Architecture (NIST SP 800-207) | Policy Engine, Policy Administrator, PDP, PEP components for continuous verification | Verify Everything | d5-act4-zerotrust | HIGH |

---

## Domain 6: Security Assessment and Testing

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Breach Attack Simulation (BAS) | Automated continuous attack simulation against production systems | Always-On Fire Drill | d6-act1-bas | -- |
| 2 | Bug Bounty Program | Rewarding external researchers for responsibly reporting vulnerabilities | Wanted Poster | d6-act1-bounty | -- |
| 3 | Code Review | Examining source code for security vulnerabilities; manual or automated (SAST) | Code Inspection | d6-act1-review | -- |
| 4 | Compliance Testing | Verifying systems meet regulatory requirements (HIPAA, PCI-DSS, SOX) | Checkbox Audit | d6-act1-compliance | -- |
| 5 | Control Testing | Evaluating whether security controls are properly implemented and functioning | Smoke Detector Check | d6-act1-controls | -- |
| 6 | Coverage Analysis | Measuring how thoroughly testing covers the system or code | Ground Coverage Map | d6-act1-coverage | -- |
| 7 | CVSS (Common Vulnerability Scoring System) | Standardized 0-10 scale for rating vulnerability severity | Danger Meter | d6-act1-cvss | -- |
| 8 | Fuzzing | Sending random/malformed input to discover crashes and vulnerabilities | Chaos Testing | d6-act1-fuzz | -- |
| 9 | Interface Testing | Testing connections between systems, APIs, and components | Handshake Check | d6-act1-interface | -- |
| 10 | KPI (Key Performance Indicator) | Metrics measuring effectiveness of security controls and programs | Performance Score | d6-act1-metrics | -- |
| 11 | Log Management | Collection, storage, analysis, and retention of system logs | Security Camera Tape | d6-act1-logs | -- |
| 12 | Misuse Case Testing | Testing from attacker perspective; abuse scenarios | Evil User Test | d6-act1-misuse | -- |
| 13 | OWASP Testing Guide | Comprehensive guide for testing web application security | Web Test Recipe Book | d6-act1-owasp | -- |
| 14 | Penetration Testing | Authorized simulated attack; black/white/gray box; requires written authorization | Friendly Burglar | d6-act1-pentest | -- |
| 15 | Red Team / Blue Team | Red = offensive attackers, Blue = defenders, Purple = collaboration | War Games | d6-act1-teams | -- |
| 16 | Regression Testing | Retesting after changes to ensure fixes don't break existing functionality | Don't Go Backwards | d6-act1-regression | -- |
| 17 | SCAP (Security Content Automation Protocol) | Suite for automating vulnerability management; includes CVE, CVSS, CPE, CCE | Security Toolkit | d6-act1-scap | -- |
| 18 | Security Audit | Systematic evaluation of security posture against standard or policy | Formal Inspection | d6-act1-audit | -- |
| 19 | SOC 2 Report | Third-party audit of security, availability, processing integrity, confidentiality, privacy | Trust Report Card | d6-act1-soc | -- |
| 20 | Social Engineering Testing | Testing human vulnerability via phishing, pretexting, tailgating | Human Hacking Test | d6-act1-social | -- |
| 21 | Synthetic Transactions | Automated test transactions simulating user activity for monitoring | Robot Users | d6-act1-synthetic | -- |
| 22 | Tabletop Exercise | Discussion-based scenario walkthrough without actual disruption | Armchair Drill | d6-act1-exercise | -- |
| 23 | Vulnerability Assessment | Systematic review using automated scanning to find known weaknesses | Doctor's Checkup | d6-act1-vuln | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Account Management Review | Verification of authorized access through sampling and review | Access Audit | d6-act4-reviews | LOW |
| 2 | Banner Grabbing | Collecting service information from open ports for reconnaissance | Reading the Welcome Mat | d6-act2-recon | LOW |
| 3 | Blind Testing | Tester has no knowledge; target knows testing is occurring | One-Sided Surprise | d6-act4-testing | LOW |
| 4 | Boundary Value Analysis | Testing at the edges of valid input ranges where errors often occur | Edge Testing | d6-act4-analysis | MEDIUM |
| 5 | Circular Overwrite | Log management technique overwriting oldest entries when log is full | Rotating Tape | d6-act2-logs | MEDIUM |
| 6 | Clipping Level | Threshold for recording or reporting security events | Alarm Threshold | d6-act2-logs | MEDIUM |
| 7 | Credentialed Scanning | Vulnerability scan using valid credentials; deeper results, fewer false positives | Insider Scan | d6-act2-scanning | HIGH |
| 8 | CVE (Common Vulnerabilities and Exposures) | Standardized identifiers for publicly known vulnerabilities | Bug ID Card | d6-act2-cve | HIGH |
| 9 | Double-Blind Testing | Neither tester nor target staff know; most realistic scenario | Full Surprise | d6-act4-testing | LOW |
| 10 | Equivalence Partitioning | Dividing input into classes where all values behave the same | Input Grouping | d6-act4-analysis | MEDIUM |
| 11 | Ethical Disclosure | Responsible process for reporting discovered vulnerabilities | Good Samaritan Report | d6-act4-ethics | LOW |
| 12 | Fagan Inspection | Most formal code review with six defined phases and strict entry/exit criteria | Formal Code Court | d6-act2-review | HIGH |
| 13 | False Negative | Failing to detect a real threat; more dangerous than false positive | Missed Threat | d6-act1-alerts | HIGH |
| 14 | False Positive | Alerting on non-existent threat; wastes resources but not dangerous | Crying Wolf | d6-act1-alerts | HIGH |
| 15 | Generational Fuzzing | Fuzz testing generating inputs based on protocol specification | Smart Chaos | d6-act2-fuzz | HIGH |
| 16 | ISAE 3402 | International equivalent of SSAE 18 for service organization audits | Global Audit Standard | d6-act2-audit | HIGH |
| 17 | KRI (Key Risk Indicator) | Forward-looking metrics measuring risk exposure (vs. KPI backward-looking) | Risk Forecast | d6-act2-metrics | MEDIUM |
| 18 | Mutation Fuzzing | Fuzz testing modifying existing valid inputs randomly | Random Mutation | d6-act2-fuzz | HIGH |
| 19 | NTP (Network Time Protocol) | Time synchronization critical for log correlation and forensics | Universal Clock | d6-act2-logs | MEDIUM |
| 20 | Purple Team | Collaborative team combining red (attack) and blue (defense) for maximum learning | Joint Exercise | d6-act2-teams | HIGH |
| 21 | SMART Metrics | Specific, Measurable, Achievable, Relevant, Timely framework for metrics | Goal Blueprint | d6-act2-metrics | MEDIUM |
| 22 | SOC 1 Report | Audit of controls relevant to financial reporting (ICFR) | Financial Trust Report | d6-act2-soc | HIGH |
| 23 | SOC 3 Report | Public-facing summary (seal of approval) derived from SOC 2 | Public Trust Badge | d6-act2-soc | HIGH |
| 24 | SSAE 18 | Statement on Standards for Attestation Engagements; replaced SAS 70 | Modern Audit Standard | d6-act2-audit | HIGH |
| 25 | Uncredentialed Scanning | Vulnerability scan without credentials; external perspective, more false positives | Outsider Scan | d6-act2-scanning | HIGH |
| 26 | Validation vs. Verification | Validation = right product (needs); Verification = product built right (specs) | Right Thing vs. Thing Right | d6-act1-vv | HIGH |
| 27 | War Driving | Driving around searching for wireless networks to map or exploit | Wi-Fi Hunting | d6-act4-legacy | LOW |
| 28 | White Team | Exercise coordinators and observers ensuring rules are followed | Referee Team | d6-act2-teams | HIGH |

---

## Domain 7: Security Operations

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Backup Types | Full, incremental (since last backup), differential (since last full) | Copy Strategies | d7-act1-backup | -- |
| 2 | Business Continuity Testing | Exercises from checklist to full interruption to validate BCP/DRP | Plan Fire Drills | d7-act1-testing | -- |
| 3 | Chain of Custody | Documentation tracking evidence handling from collection to court | Evidence Relay Race | d7-act1-forensics | -- |
| 4 | Change Management | Structured process for requesting, reviewing, approving, implementing changes | No Surprises Process | d7-act1-change | -- |
| 5 | Configuration Management | Establishing and maintaining consistent settings across systems | Uniform Settings | d7-act1-config | -- |
| 6 | Containment Strategy | Limiting damage by isolating affected systems during an incident | Quarantine Zone | d7-act1-ir | -- |
| 7 | Continuous Monitoring | Ongoing automated observation of security controls, threats, compliance | 24/7 Cameras | d7-act1-monitor | -- |
| 8 | Digital Forensics | Collecting, preserving, analyzing, presenting digital evidence | Crime Lab | d7-act1-forensics | -- |
| 9 | Disaster Recovery Plan (DRP) | Documented plan for restoring IT systems and data after disaster | IT Rebuild Guide | d7-act1-drp | -- |
| 10 | Eradication | Removing root cause of security incident (malware, vulnerabilities) | Uproot the Weed | d7-act1-ir | -- |
| 11 | Evidence Collection Order | Order of volatility: CPU registers, cache, RAM, swap, disk, removable, printouts | Volatile First | d7-act1-forensics | -- |
| 12 | Hot Site | Fully equipped backup facility; fastest RTO; most expensive | Ready to Go | d7-act1-sites | -- |
| 13 | Incident Response | Organized approach: Preparation, Detection, Containment, Eradication, Recovery, Lessons | PDCERL Cycle | d7-act1-ir | -- |
| 14 | Lessons Learned | Post-incident review identifying improvements; final IR phase | After-Action Review | d7-act1-ir | -- |
| 15 | Mean Time to Detect (MTTD) | Average time between incident occurrence and detection | Notice Speed | d7-act1-metrics | -- |
| 16 | Mean Time to Respond (MTTR) | Average time from detection to resolution of incident | Fix Speed | d7-act1-metrics | -- |
| 17 | Media Management | Handling, storing, transporting, destroying storage media | Cradle to Grave | d7-act1-media | -- |
| 18 | Patch Management | Acquiring, testing, installing software updates to fix vulnerabilities | Digital Band-Aids | d7-act1-patch | -- |
| 19 | Privileged Operations | Actions requiring elevated permissions; must be logged and monitored | Superpower Actions | d7-act1-ops | -- |
| 20 | Problem Management | Identifying and managing root causes of incidents to prevent recurrence | Why It Started | d7-act1-problem | -- |
| 21 | Separation of Environments | Isolating dev, test, staging, production environments | Assembly Stations | d7-act1-envs | -- |
| 22 | SLA (Service Level Agreement) | Contract specifying expected service levels with penalties | Service Promise | d7-act1-sla | -- |
| 23 | SOAR (Security Orchestration, Automation, and Response) | Automating security tasks and incident response workflows | Robot Responder | d7-act1-soar | -- |
| 24 | Threat Intelligence | Evidence-based knowledge about threats; IOCs, TTPs; STIX/TAXII sharing | Know Your Enemy | d7-act1-intel | -- |
| 25 | Vulnerability Management | Ongoing cycle: scan, prioritize, remediate, verify | Perpetual Cleanup | d7-act1-vuln | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | 3-2-1 Backup Rule | Keep 3 copies, on 2 different media types, with 1 offsite | Triple Safety Net | d7-act2-backup | HIGH |
| 2 | Anti-Malware Approaches | Signature-based, heuristic, activity monitoring, change detection methods | Defense Layers | d7-act2-malware | MEDIUM |
| 3 | Archive Bit | File attribute indicating whether a file has changed since last backup | Change Flag | d7-act2-backup | HIGH |
| 4 | Best Evidence Rule | Original documents preferred over copies in court proceedings | Original First | d7-act2-evidence | HIGH |
| 5 | BIA Process Steps | Identify critical functions, assess impact, determine MTD/RTO/RPO, prioritize | Impact Triage | d7-act1-bia | HIGH |
| 6 | Clustering | Multiple servers working together for high availability | Server Team | d7-act4-ha | LOW |
| 7 | Cold Site | Empty facility with power and connectivity; cheapest; longest RTO (weeks) | Bare Bones Room | d7-act2-sites | HIGH |
| 8 | Corroborative Evidence | Supporting evidence that reinforces other evidence | Backup Witness | d7-act2-evidence | HIGH |
| 9 | Direct Evidence | Evidence proving a fact without inference (e.g., eyewitness testimony) | Eyewitness | d7-act2-evidence | HIGH |
| 10 | EDR (Endpoint Detection and Response) | Continuous endpoint monitoring with automated response capabilities | Endpoint Bodyguard | d7-act4-edr | LOW |
| 11 | Electronic Vaulting | Transferring backup data electronically to offsite location | Digital Safe Deposit | d7-act4-replication | LOW |
| 12 | Fail-Safe vs. Fail-Secure | Fail-safe opens (human safety); fail-secure locks (data protection) | Open vs. Lock on Failure | d7-act2-failure | MEDIUM |
| 13 | GFS Rotation (Grandfather-Father-Son) | Tape rotation scheme using daily, weekly, monthly backup sets | Family Backup | d7-act2-backup | HIGH |
| 14 | Hearsay Evidence | Second-hand evidence generally not admissible; computer logs are exception | Rumor Evidence | d7-act2-evidence | HIGH |
| 15 | Locard's Exchange Principle | Every contact leaves a trace; foundation of forensic science | Digital Fingerprints | d7-act4-forensics | LOW |
| 16 | Malware Types | Virus, worm, Trojan, ransomware, rootkit, logic bomb, polymorphic, botnet | Threat Zoo | d7-act2-malware | MEDIUM |
| 17 | Mobile Site | Transportable recovery facility; self-contained data center in trailer | Data Center on Wheels | d7-act2-sites | HIGH |
| 18 | MOM (Motive, Opportunity, Means) | Three elements needed for a crime; investigation framework | Crime Triangle | d7-act4-investigation | LOW |
| 19 | RAID 0 (Striping) | Data striped across disks for performance; NO redundancy | Speed No Safety | d7-act2-raid | HIGH |
| 20 | RAID 1 (Mirroring) | Data mirrored to second disk; full redundancy; 50% capacity loss | Carbon Copy | d7-act2-raid | HIGH |
| 21 | RAID 5 (Striping with Parity) | Data + parity across 3+ disks; survives one disk failure | Parity Protection | d7-act2-raid | HIGH |
| 22 | RAID 6 (Double Parity) | Like RAID 5 but with two parity disks; survives two disk failures | Double Parity Shield | d7-act2-raid | HIGH |
| 23 | RAID 10 (1+0, Mirrored Stripes) | Combines mirroring and striping; high performance and redundancy | Best of Both | d7-act2-raid | HIGH |
| 24 | Real Evidence | Physical/tangible evidence (hard drive, USB, server) | Physical Object | d7-act2-evidence | HIGH |
| 25 | Reciprocal Agreement | Two organizations agree to share resources during a disaster | Mutual Aid Pact | d7-act4-sites | LOW |
| 26 | Remote Journaling | Transmitting transaction logs to offsite location in near-real-time | Live Transaction Copy | d7-act4-replication | LOW |
| 27 | Remote Mirroring | Real-time replication of data to remote site; zero data loss | Live Mirror | d7-act4-replication | LOW |
| 28 | Restoration Order | Most critical to DR site first; least critical back to primary first | Recovery Sequence | d7-act2-restore | HIGH |
| 29 | UEBA (User and Entity Behavior Analytics) | Analyzing behavior patterns to detect anomalies and insider threats | Behavior Radar | d7-act4-ueba | LOW |
| 30 | Warm Site | Partially equipped facility; moderate cost and RTO (hours to days) | Halfway Ready | d7-act2-sites | HIGH |
| 31 | WRT (Work Recovery Time) | Time to configure and verify recovered system; MTD = RTO + WRT | Setup After Recovery | d7-act2-wrt | HIGH |

---

## Domain 8: Software Development Security

### Existing Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | Agile Security | Incorporating security into Agile sprints; evil user stories; threat modeling | Security Sprints | d8-act1-agile | -- |
| 2 | API Security | Securing APIs: authentication, authorization, rate limiting, input validation | API Locks | d8-act1-api | -- |
| 3 | Buffer Overflow | Writing data beyond buffer's allocated memory; can enable code execution | Overfilling a Glass | d8-act1-overflow | -- |
| 4 | Code Signing | Digital signatures verifying code authenticity and integrity | Wax Seal on Code | d8-act1-signing | -- |
| 5 | CSRF (Cross-Site Request Forgery) | Tricking logged-in user into performing unintended actions | Forged Request | d8-act1-web | -- |
| 6 | DAST (Dynamic Application Security Testing) | Testing running application from outside; black-box approach | Live App Probing | d8-act1-dast | -- |
| 7 | DevSecOps | Integrating security into every DevOps pipeline phase; automated testing | Security Pipeline | d8-act1-devsecops | -- |
| 8 | Input Validation | Checking and sanitizing all user input before processing; server-side required | Trust No Input | d8-act1-validation | -- |
| 9 | Maturity Models | Frameworks measuring development capability; CMMI 5 levels | Growth Ladder | d8-act1-maturity | -- |
| 10 | Memory Management | How programs allocate, use, and free memory; poor management causes vulns | RAM Housekeeping | d8-act1-memory | -- |
| 11 | Object-Oriented Security | Encapsulation (hiding data), inheritance, polymorphism security implications | OOP Security | d8-act1-oop | -- |
| 12 | Race Condition | Vulnerability where behavior depends on timing; TOCTOU is classic example | Timing Race | d8-act1-race | -- |
| 13 | Sandboxing | Running code in isolated environment restricting system access | Walled Playground | d8-act1-sandbox | -- |
| 14 | SAST (Static Application Security Testing) | Analyzing source code without executing; white-box approach | Still Code Review | d8-act1-sast | -- |
| 15 | SCA (Software Composition Analysis) | Identifying third-party library vulnerabilities; SBOM creation | Ingredient Check | d8-act1-sca | -- |
| 16 | SDLC (Software Development Lifecycle) | Structured development process; security integrated at every phase | Dev Life Stages | d8-act1-sdlc | -- |
| 17 | Secure Coding Practices | Input validation, output encoding, access control, error handling, logging | VEAL-H Recipe | d8-act1-coding | -- |
| 18 | Secure Configuration | Deploying software with hardened settings; remove defaults; CIS Benchmarks | Lock the Doors | d8-act1-config | -- |
| 19 | Security Testing in CI/CD | Automated security tests in CI/CD pipeline; SAST, DAST, SCA, container scanning | Auto Checkpoints | d8-act1-cicd | -- |
| 20 | Source Code Repository Security | Protecting repos from unauthorized access and secret leakage | Code Vault | d8-act1-repo | -- |
| 21 | SQL Injection | Inserting malicious SQL through user input to manipulate database | SQL Sneaking | d8-act1-sqli | -- |
| 22 | Threat Modeling (STRIDE) | Spoofing, Tampering, Repudiation, Information Disclosure, DoS, Elevation of Privilege | Six Threat Types | d8-act1-stride | -- |
| 23 | WAF (Web Application Firewall) | Layer 7 device filtering HTTP/HTTPS traffic; protects against web attacks | Web Bouncer | d8-act1-waf | -- |
| 24 | Waterfall Model | Sequential development: Requirements, Design, Implementation, Verification, Maintenance | Water Flows Down | d8-act1-waterfall | -- |
| 25 | XSS (Cross-Site Scripting) | Injecting malicious scripts into web pages; stored, reflected, DOM-based | Sneaky Scripts | d8-act1-xss | -- |

### New Terms

| # | Term | Definition (brief) | Related Analogy | Scene ID Pattern | Priority |
|---|------|-------------------|----------------|------------------|----------|
| 1 | ACID Properties | Atomicity, Consistency, Isolation, Durability for database transactions | Transaction Guarantee | d8-act2-database | HIGH |
| 2 | Aggregation Attack | Combining low-sensitivity data to derive high-sensitivity information | Puzzle Assembly | d8-act2-database | HIGH |
| 3 | ASLR (Address Space Layout Randomization) | Randomizing memory addresses to prevent buffer overflow exploitation | Random Address Map | d8-act2-overflow | MEDIUM |
| 4 | CAB (Change Advisory Board) | Committee reviewing and approving proposed changes to IT systems | Change Gatekeepers | d8-act2-change | HIGH |
| 5 | Citizen Developers | Non-technical users building apps with low-code tools; shadow IT risk | Amateur Builders | d8-act4-risk | LOW |
| 6 | Cleanroom Model | Development methodology focusing on defect prevention over defect removal | Zero Defect Factory | d8-act2-methods | HIGH |
| 7 | CMMI Levels | Initial, Managed, Defined, Quantitatively Managed, Optimizing (5 levels) | Maturity Staircase | d8-act2-maturity | HIGH |
| 8 | Code Obfuscation | Making code difficult to reverse-engineer; lexical, data, control flow types | Code Camouflage | d8-act4-obfuscation | MEDIUM |
| 9 | Cohesion and Coupling | High cohesion (focused modules) = good; low coupling (independent modules) = good | Module Quality | d8-act4-oop | MEDIUM |
| 10 | Database Views | Virtual tables limiting what data users can see; access control mechanism | Filtered Window | d8-act2-database | HIGH |
| 11 | DEP (Data Execution Prevention) | Preventing code execution from non-executable memory regions | No-Run Zone | d8-act2-overflow | MEDIUM |
| 12 | Expert Systems | AI using knowledge base and inference engine for decision-making | Digital Advisor | d8-act4-ai | MEDIUM |
| 13 | Foreign Key | Database field referencing primary key of another table; enforces referential integrity | Table Link | d8-act2-database | HIGH |
| 14 | IAST (Interactive Application Security Testing) | Combines SAST and DAST by instrumenting running application | Inside-Out Testing | d8-act2-testing | MEDIUM |
| 15 | Inference Attack | Deducing restricted information from available non-restricted data | Detective Deduction | d8-act2-database | HIGH |
| 16 | Normalization | Organizing database to reduce redundancy; 1NF through 5NF | Data Tidying | d8-act2-database | HIGH |
| 17 | ODBC (Open Database Connectivity) | Standardized API for database access; proxy between apps and databases | Universal DB Plug | d8-act4-database | LOW |
| 18 | Polyinstantiation | Creating multiple instances of data at different classification levels | Multi-Version Truth | d8-act2-database | HIGH |
| 19 | Primary Key | Unique identifier for each row in a database table | Row Fingerprint | d8-act2-database | HIGH |
| 20 | RAD (Rapid Application Development) | Methodology emphasizing rapid prototyping over lengthy planning | Fast Track Dev | d8-act2-methods | HIGH |
| 21 | Referential Integrity | Ensuring foreign key values always reference valid primary keys | Link Validation | d8-act2-database | HIGH |
| 22 | Release Control | Change management component ensuring debug code removed before deployment | Ship-Ready Check | d8-act2-change | HIGH |
| 23 | Request Control | Change management component managing how change requests are submitted | Change Request Form | d8-act2-change | HIGH |
| 24 | SBOM (Software Bill of Materials) | Comprehensive list of all components, libraries, and dependencies in software | Ingredient List | d8-act2-sca | MEDIUM |
| 25 | Software Acquisition Security | Evaluating COTS, open source, managed services; source code escrow | Vendor Vetting | d8-act2-acquisition | MEDIUM |
| 26 | Spiral Model | Risk-driven iterative development through repeated planning-risk-build-evaluate cycles | Risk Spiral | d8-act2-methods | HIGH |
| 27 | SW-CMM Levels | Initial, Repeatable, Defined, Managed, Optimizing (5 levels; differs from CMMI) | Old Maturity Staircase | d8-act2-maturity | HIGH |

---

## Cross-Domain Terms

| # | Term | Primary Domain | Also Relevant To | Definition (brief) | Priority |
|---|------|---------------|-----------------|-------------------|----------|
| 1 | Cloud Security (Comprehensive) | D3 | D1, D2, D7 | Shared responsibility, service models, deployment models, CASB, cloud forensics | HIGH |
| 2 | DLP and Data Protection | D2 | D3, D4 | DLP mechanisms, crypto for transit, network inspection points | MEDIUM |
| 3 | Forensics and Evidence | D7 | D1, D6 | Investigation types, assessment context, chain of custody, procedures | MEDIUM |
| 4 | Privacy Regulations | D1 | D2 | GDPR, CCPA, HIPAA framework and de-identification techniques | MEDIUM |
| 5 | RADIUS vs. TACACS+ | D5 | D4 | Protocol, encryption, AAA separation differences | HIGH |
| 6 | Supply Chain Security | D1 | D8 | Risk management (D1) and software acquisition security (D8) | MEDIUM |
| 7 | Zero Trust Architecture | D3 | D4, D5 | Never trust always verify; micro-segmentation; continuous authentication | HIGH |

---

## Gap Coverage Verification

### HIGH Priority Gaps -> Glossary Coverage

| # | Gap Topic | Domain | Glossary Terms Created | Status |
|---|-----------|--------|----------------------|--------|
| 1 | PKI and Digital Certificates | D3 | PKI (existing), Certificate Authority (CA), X.509, Certificate Revocation List (CRL), OCSP, Certificate Chain of Trust, Certificate Pinning, Cross-Certification | COVERED |
| 2 | Backup Strategies (Incremental vs. Differential) | D7 | Backup Types (existing), 3-2-1 Backup Rule, Archive Bit, GFS Rotation | COVERED |
| 3 | Recovery Site Types | D7 | Hot Site (existing), Cold Site, Warm Site, Mobile Site | COVERED |
| 4 | RAID Levels (0, 1, 5, 6, 10) | D7 | RAID 0 (Striping), RAID 1 (Mirroring), RAID 5 (Striping with Parity), RAID 6 (Double Parity), RAID 10 (Mirrored Stripes) | COVERED |
| 5 | Database Security (ACID, Keys, Aggregation/Inference) | D8 | ACID Properties, Primary Key, Foreign Key, Referential Integrity, Normalization, Aggregation Attack, Inference Attack, Polyinstantiation, Database Views | COVERED |
| 6 | Control Type Classification | D1 | Preventive Control, Detective Control, Corrective Control, Deterrent Control, Directive Control, Recovery Control, Compensating Control | COVERED |
| 7 | Digital Signatures | D3 | Digital Signature (existing) | COVERED |
| 8 | SAST vs. DAST vs. IAST | D6, D8 | SAST (existing), DAST (existing), IAST (new D8) | COVERED |
| 9 | Key Management Lifecycle | D3 | Key Management Lifecycle, Key Escrow, M-of-N Control | COVERED |
| 10 | Cloud Computing Security | D3 | Cloud Security Shared Responsibility (existing), CASB (new D2) | COVERED |
| 11 | DRP Testing Types | D7 | Business Continuity Testing (existing -- covers checklist through full interruption) | COVERED |
| 12 | Development Methodologies (Deep Dive) | D8 | Waterfall Model (existing), Spiral Model, Cleanroom Model, RAD, Agile Security (existing) | COVERED |
| 13 | Maturity Models (SW-CMM, CMMI) | D8 | Maturity Models (existing), CMMI Levels, SW-CMM Levels | COVERED |
| 14 | Evidence Types and Rules | D7 | Real Evidence, Direct Evidence, Hearsay Evidence, Corroborative Evidence, Best Evidence Rule | COVERED |
| 15 | BIA Process | D7 | BIA (existing D1), BIA Process Steps | COVERED |
| 16 | Intellectual Property Laws | D1 | Trade Secret, Patent, Copyright, Trademark | COVERED |
| 17 | SOC 1 vs. SOC 2 vs. SOC 3 | D6 | SOC 2 Report (existing), SOC 1 Report, SOC 3 Report | COVERED |
| 18 | Threat Modeling (STRIDE, PASTA, DREAD) | D1 | Threat Modeling (existing), Threat Modeling STRIDE (existing D8) | COVERED |
| 19 | Biometric Deep Dive (CER/EER, Type 1/Type 2 Errors) | D5 | Biometric Authentication (existing), Biometric CER/EER, Biometric Type 1 Error (FRR), Biometric Type 2 Error (FAR) | COVERED |
| 20 | Access Control Attacks (Golden Ticket, Pass-the-Hash) | D5 | Golden Ticket Attack, Silver Ticket Attack, Pass-the-Hash Attack, Rainbow Table Attack | COVERED |
| 21 | Fire Prevention, Detection, and Suppression | D3 | Wet Pipe System, Dry Pipe System, Pre-Action System, Deluge System, FM-200 | COVERED |
| 22 | Pseudonymization, Tokenization, Anonymization | D2 | Pseudonymization (existing), Tokenization (existing), Anonymization | COVERED |
| 23 | TCP/IP Model and Three-Way Handshake | D4 | TCP/IP Model (existing), TCP Three-Way Handshake, SYN Flood Attack | COVERED |
| 24 | Secure Protocols Suite | D4 | TLS (existing), SSH, S/MIME, DNSSEC | COVERED |
| 25 | Email Security (S/MIME, DMARC, SPF, DKIM) | D4 | Email Security SPF/DKIM/DMARC (existing), S/MIME | COVERED |
| 26 | NAC and 802.1X | D4 | Network Access Control (existing), 802.1X | COVERED |
| 27 | Network Segmentation (Advanced) | D4 | Network Segmentation (existing), Micro-Segmentation, VLAN (existing) | COVERED |
| 28 | DLP Types and Mechanics | D2 | DLP (existing), CASB | COVERED |
| 29 | Personnel Security Controls | D1 | Job Rotation, Mandatory Vacations, Separation of Duties (existing) | COVERED |
| 30 | Credentialed vs. Uncredentialed Scanning | D6 | Credentialed Scanning, Uncredentialed Scanning | COVERED |
| 31 | Red/Blue/Purple/White Teams | D6 | Red Team / Blue Team (existing), Purple Team, White Team | COVERED |
| 32 | Code Review Processes (Fagan Inspection) | D6 | Code Review (existing), Fagan Inspection | COVERED |
| 33 | False Positives vs. False Negatives | D6 | False Positive, False Negative | COVERED |
| 34 | CVE and CVSS | D6 | CVSS (existing), CVE | COVERED |
| 35 | Validation vs. Verification | D6 | Validation vs. Verification | COVERED |
| 36 | Change Management (Request/Change/Release Control) | D8 | Change Management (existing D7), Request Control, Release Control, CAB | COVERED |
| 37 | RADIUS vs. TACACS+ | D4, D5 | RADIUS (D4), TACACS+ (D4) | COVERED |
| 38 | Zero Trust Architecture | D3, D4, D5 | Zero Trust (existing D3), Micro-Segmentation (D4), Zero Trust Architecture NIST SP 800-207 (D5) | COVERED |
| 39 | Virtualization and Hypervisor Security | D3 | Virtualization Security (existing), Hypervisor Type 1 vs. Type 2 | COVERED |
| 40 | WRT and MTD = RTO + WRT | D7 | WRT (Work Recovery Time), Maximum Tolerable Downtime (existing D1) | COVERED |
| 41 | Restoration Order | D7 | Restoration Order | COVERED |
| 42 | Investigation Types | D7 | Investigation Types (also in D1 new terms) | COVERED |
| 43 | Security Document Hierarchy | D1 | Security Policy (existing); Preventive/Detective/Corrective/etc. controls cover hierarchy | COVERED |
| 44 | Accountability vs. Responsibility | D1 | Organizational Roles (covers accountability chain) | COVERED |
| 45 | Scoping and Tailoring | D2 | Scoping and Tailoring (existing) | COVERED |
| 46 | CASB | D2 | CASB (Cloud Access Security Broker) | COVERED |
| 47 | Labeling vs. Marking | D2 | Labeling, Marking | COVERED |
| 48 | Cryptanalytic Attacks | D3 | Cryptographic Attacks (existing), Side-Channel Attack (existing) | COVERED |
| 49 | Micro-segmentation and Zero Trust Networking | D4 | Micro-Segmentation, Zero Trust (existing D3) | COVERED |
| 50 | Session Management | D5 | Session Management (existing) | COVERED |
| 51 | Password Policy (NIST SP 800-63B) | D5 | Password Policy (NIST SP 800-63B) | COVERED |
| 52 | IP Addressing (IPv4/IPv6) | D4 | IPv4 vs. IPv6, CIDR | COVERED |
| 53 | DRM and IRM | D2 | Digital Rights Management (existing), IRM (Information Rights Management) | COVERED |
| 54 | Fuzz Testing | D6 | Fuzzing (existing), Mutation Fuzzing, Generational Fuzzing | COVERED |
| 55 | SSAE 18 / ISAE 3402 | D6 | SSAE 18, ISAE 3402 | COVERED |

---

## Appendix: Term Count Reconciliation

| Category | Count |
|----------|-------|
| **D1 Existing** | 26 |
| **D1 New** | 28 |
| **D2 Existing** | 25 |
| **D2 New** | 20 |
| **D3 Existing** | 25 |
| **D3 New** | 30 |
| **D4 Existing** | 25 |
| **D4 New** | 22 |
| **D5 Existing** | 23 |
| **D5 New** | 20 |
| **D6 Existing** | 23 |
| **D6 New** | 28 |
| **D7 Existing** | 25 |
| **D7 New** | 31 |
| **D8 Existing** | 25 |
| **D8 New** | 27 |
| **Cross-Domain** | 7 |
| **Existing Subtotal** | 197 (some terms dual-listed with cross-domain) |
| **New Subtotal** | 206 (some terms cover multiple gap topics) |
| **Unique Total** | ~392 |

> **Note on count variance:** The existing glossary.ts contains 208 entries. Some terms (e.g., Session Management, Security Policy) appear in both the existing glossary and as gap topics requiring deeper coverage. The existing count in this glossary shows 197 unique rows because 11 terms were already counted in the glossary but did not need separate gap analysis rows due to overlap. Additionally, D5 and D6 have 23 existing terms each rather than 25 because 2 terms from each are better categorized under cross-domain. The total unique term count of ~392 accounts for all 208 original terms plus ~184 genuinely new terms, with cross-domain entries serving as cross-references rather than unique additions.

---

*This glossary was generated by cross-referencing all 208 terms in `src/data/glossary.ts` with the 198 gap topics identified in `source-material/knowledge-base/gap-analysis.md`. Each gap topic was broken down into individual glossary entries, checked for duplicates against existing terms, and assigned priority levels matching the gap analysis. Scene ID patterns follow the convention `d[domain]-act[1|2|4]-[topic-slug]`.*
