# Domain 2: Asset Security -- Comprehensive Knowledge Summary

---

## 1. COMPLETE TOPIC LIST

### 2.1 Identify and Classify Information and Assets
- **Data Classification**
  - Purpose of classification (protect based on value)
  - Government classification levels: Top Secret, Secret, Confidential, Unclassified
    - Subclassifications of Unclassified: For Official Use Only (FOUO), Sensitive But Unclassified (SBU), Controlled Unclassified Information (CUI)
  - Commercial/private sector classification levels: Confidential/Proprietary, Private, Sensitive, Public
  - Classification authority (who can classify data)
  - Classification boards (key stakeholders overseeing classification system)
  - Classification vs. Categorization distinction
  - Benefits of information classification
  - Classification process steps
  - Factors determining classification: value, sensitivity, regulatory requirements, impact of disclosure
- **Asset Classification**
  - Asset classifications mirror data classifications
  - Hardware inherits the classification of the data it processes
  - Media inherits the classification of the highest data it holds
  - Asset inventory requirements
  - Asset ownership identification
- **Defining Sensitive Data Types**
  - Personally Identifiable Information (PII) -- NIST SP 800-122 definition
  - Protected Health Information (PHI) -- HIPAA definition
  - Proprietary Data and trade secrets
  - Intellectual property
- **Labeling and Marking**
  - Labeling (system-readable): metadata, electronic labels, digital signatures
  - Marking (human-readable): watermarks, headers/footers, physical labels
  - Labeling requirements for both classified and unclassified media
  - Desktop backgrounds indicating classification
  - DLP integration with labels

### 2.2 Establish Information and Asset Handling Requirements
- **Data Handling**
  - Handling sensitive information and assets based on classification
  - Secure transportation of media
  - Cloud data handling (AWS S3 bucket security, etc.)
  - Policies and procedures for handling
  - Trust but verify principle
- **Media Handling**
  - Access limited to designated/authorized personnel
  - Handling based on data classification, not the medium itself
  - Written procedures for handling
- **Media Storage**
  - Storage requirements based on classification
  - Physical security (locked safes, vaults, secure rooms)
  - Environmental controls (HVAC, temperature, humidity)
  - High-quality media for long-term storage
  - Encrypted USB drives with biometric authentication
- **Media Retention and Destruction**
  - Based on data classification and archiving policies
  - Procedures for downgrading media classification
  - Many organizations prohibit downgrading, requiring destruction instead
- **Data Maintenance**
  - Ongoing organization and care of data
  - Air-gapped networks for classified data
  - Unidirectional network bridges
  - Technical guard solutions
  - Routine review of data policies
- **Data Collection Limitation**
  - Principle: do not collect data without a clear purpose
  - Minimize data collection to reduce breach exposure
  - Privacy regulation alignment
- **Data Location**
  - Location of data backups and copies
  - Geographic separation for disaster recovery
  - Cloud storage location verification
  - Data sovereignty considerations

### 2.3 Provision Information and Assets Securely
- **Data Ownership**
  - Owner always remains accountable
  - Owner responsibilities: define classification, approve access, retention and destruction decisions
- **Types of Owners**
  - Data Owners
  - Process Owners
  - System Owners
- **Data Classification Policy Components**
  - Policy, standards, procedures, baselines, guidelines hierarchy
  - Considerations: laws/regulations, privacy requirements, cost of creation, operational impact, value, liability, reputation

### 2.4 Manage Data Lifecycle
- **Data Roles**
  - Data Owner / Controller: accountable for protection, legal rights, policies, classification, access approval
  - Data Processor: processes data on behalf of controller (typically cloud provider)
  - Data Custodian: technical/day-to-day responsibility (backups, restores, security implementation)
  - Data Steward: ensures data accuracy, reliability, quality (business responsibility)
  - Data Subject: individual to whom personal data relates
  - Users: access data to accomplish work tasks
  - Business/Mission Owners: strategic goals of business unit
  - System Owner: responsible for overall operation and security of an information system
- **Data Lifecycle Phases**
  - Create/Collect
  - Store
  - Use
  - Share
  - Archive
  - Destroy
  - Classification can change at any point in lifecycle
- **Data Collection**
  - Collection through connections (clients, customers)
  - Data derived from application use
  - Collection limitation principle
- **Data Location / Data Sovereignty**
  - Where data is physically/virtually stored
  - Laws governing data based on geographic location
  - Cross-border data transfer restrictions
- **Data Maintenance**
  - Improving integrity of data
  - Improving architecture
- **Data Retention**
  - How long data must be kept
  - Driven by laws, regulations, business needs
  - Retention policy reduces legal liabilities
  - Litigation hold / preservation obligations
- **Data Remanence**
  - Residual data remaining after deletion
  - Residual magnetic flux on hard drives
  - Slack space (unused space within disk clusters)
  - Wear-leveling on SSDs creating persistent remanence
  - Memory remanence concerns
- **Data Destruction / Sanitization (NIST SP 800-88)**
  - Categories of sanitization (ordered best to worst):
    1. **Destruction** (physical): incinerate, disintegrate, shred, drill, pulverize, melt
    2. **Degaussing**: strong magnetic field to erase magnetic media; renders drive unusable; does NOT work on SSDs, optical, or flash
    3. **Crypto Shredding / Crypto Erasure**: encrypt data then destroy all keys; best option for cloud; effectiveness depends on encryption strength
    4. **Purging**: intensive clearing repeated multiple times; data not recoverable by known methods; government does not trust purging for Top Secret
    5. **Clearing / Overwriting**: writing patterns over media; data may be recoverable with advanced forensics; considered least effective sanitization
    6. **Erasing / Formatting**: simple delete or format; data easily recoverable; least secure
  - Object reuse: reassignment of media without data remanence; defined in Orange Book (TCSEC)
  - Declassification: process of purging media for reuse in unclassified environment
  - Defensible destruction: controlled, legally defensible, compliant manner of destruction
  - Verification after sanitization is essential

### 2.5 Ensure Appropriate Asset Retention
- **Data Archiving**
  - Part of asset lifecycle
  - Media type considerations
  - Security and availability requirements for archived data
  - Retention period determination
  - Associated costs
  - Long-term format readability challenges (150-year archives)
- **Retention Policies**
  - Based on laws, regulations, industry standards, business needs
  - Classify records accordingly
  - Train employees on retention requirements
  - Questions: who needs access, do access requirements change, how long to keep, disposal requirements
  - Aggressive email retention policies to reduce legal liability
  - Never delete data when litigation is reasonably anticipated (litigation hold)
- **Record Retention vs. Media Retention**
  - Record retention: maintaining information as long as needed
  - Media retention: physical media lifecycle management
- **End of Life (EOL)**
  - Vendor stops producing/selling the product
  - Still supported by vendor for a period
- **End of Support (EOS)**
  - Vendor ceases all support, including security patches
  - Creates security risk (no more updates)
  - Must plan for replacement or upgrade
  - Hardware refresh cycles based on EOL/EOS

### 2.6 Determine Data Security Controls and Compliance Requirements
- **Data States**
  - **Data at Rest**: stored on media (drives, tapes, databases, spreadsheets)
    - Protection: encryption (symmetric, e.g., AES-256), access controls, backup/restore, redundancy
    - Full disk encryption (e.g., BitLocker)
    - Column-level database encryption
  - **Data in Transit / Data in Motion**: moving across networks
    - Protection: network encryption, access controls
    - End-to-end encryption: payload encrypted source to destination; headers visible for routing; VPN is key example
    - Link encryption: entire packet (header + data) encrypted between nodes; decrypted at each node; hides routing info between hops; plaintext at every node
    - Onion network (TOR): multiple encryption layers; each node peels one layer; provides anonymity; hides source/destination; performance tradeoff
  - **Data in Use**: data in memory or being processed
    - Protection: homomorphic encryption (process encrypted data without decryption), RBAC, DLP, DRP
    - Flushing memory buffers after use
    - Clean desk policies, view angle screens, workstation locking
- **Scoping and Tailoring**
  - Scoping: selecting only applicable controls from a baseline; eliminating irrelevant controls
  - Tailoring: modifying the baseline to align with organizational mission, goals, and risk
  - Tailoring activities include: identifying common controls, applying scoping, selecting compensating controls, assigning parameter values, supplementing baselines
  - Documented justification required when removing controls
- **Standards Selection**
  - Compliance with external standards (PCI DSS, GDPR, etc.)
  - Identify which standards apply to the organization
  - Voluntary adoption of well-designed community standards (NIST SP 800 series)
- **Security Baselines**
  - Minimum security standard / starting point
  - NIST SP 800-53 / 800-53B baseline categories:
    - Low-Impact System baseline
    - Moderate-Impact System baseline
    - High-Impact System baseline
    - Privacy Control baseline
  - System imaging for consistent deployment
- **Data Protection Methods**
  - **Digital Rights Management (DRM)**
    - Protects copyrighted works and intellectual property
    - Techniques: licensing agreements, encryption, digital tags, persistent online authentication, continuous audit trail, automatic expiration
    - Legal basis: Digital Millennium Copyright Act (DMCA)
    - Limitations: opposed by fair use advocates; not effective against determined bypasses
  - **Information Rights Management (IRM)**
    - Subset of DRM focused on organizational document protection (e.g., secure PDFs)
  - **Data Loss Prevention (DLP)**
    - Detects and prevents data exfiltration
    - Types: Network DLP (edge of network), Endpoint DLP (files on systems, printers, USB), Cloud DLP (cloud-native)
    - Capabilities: keyword scanning, pattern matching (e.g., SSN format), deep content inspection
    - Discovery capabilities: finding valuable data locations within network
    - Cannot decrypt or examine encrypted data
  - **Cloud Access Security Broker (CASB)**
    - Sits logically between users and cloud services
    - Enforces organization security policies in cloud
    - Authentication/authorization, logging, monitoring, alerts
    - Detects shadow IT (unauthorized cloud service usage)
    - Can be on-premises or cloud-based
- **Information Obfuscation Methods**
  - Concealing data: completely removes access and visibility to sensitive data
  - Information/Data Pruning: removes sensitive data from attributes; field appears but is blank
  - Fabricating data: creating fake data for testing or to replace sensitive data
  - Trimming data: shows partial attribute values (e.g., last 4 digits of SSN or credit card)
  - Encrypting data: can be at attribute, table, or database level
  - Pseudonymization: replacing data with artificial identifiers (aliases); reversible; less stringent GDPR requirements
  - Tokenization: replacing data with random tokens; used heavily in credit card processing; token has no value outside the system
  - Anonymization: removing all identifying data; irreversible; if done well, GDPR no longer applies; risk of reidentification through data inference
  - Randomized masking: shuffling data in columns; maintains aggregate values; effective with many columns and records
- **Compliance Requirements**
  - Determining applicable laws per jurisdiction
  - Compliance officer role
  - Legal hold / e-discovery obligations

---

## 2. KEY DEFINITIONS AND CONCEPTS

**Asset**: Anything of value to an organization, including data, hardware, software, facilities, personnel, and reputation.

**Sensitive Data**: Any information that is not public or unclassified; includes confidential, proprietary, protected, or regulated data.

**PII (Personally Identifiable Information)**: Any data that can identify, contact, or locate an individual, alone or combined with other data. Includes name, SSN, date of birth, biometrics, and information linkable to an individual (medical, financial, employment). Defined in NIST SP 800-122.

**PHI (Protected Health Information)**: Health-related information transmitted or maintained in any form that can be linked to a specific person. Governed by HIPAA. Excludes education records, employment records, and records of individuals deceased more than 50 years.

**Proprietary Data**: Data conferring competitive advantage -- software code, technical plans, internal processes, intellectual property, trade secrets.

**Data Classification**: The process of assigning a sensitivity level to data based on its value, impact of disclosure, and regulatory requirements. Drives all subsequent protection decisions.

**Data Categorization**: The act of sorting assets into predefined classes (distinct from classification, which assigns hierarchical sensitivity levels).

**Classification Authority**: The entity authorized to apply the original classification. In the U.S., the president, vice president, and agency heads (or their delegates) can classify data.

**Labeling**: Associating security attributes with objects in system-readable form (metadata, electronic labels, digital signatures).

**Marking**: Associating security attributes with objects in human-readable form (watermarks, physical labels, headers/footers).

**Data Owner**: Senior executive (CEO, president, or department head) with ultimate organizational responsibility for data -- classification, access decisions, protection requirements. Liable for negligence if due diligence is not performed.

**Data Controller**: Entity that determines the purposes and means by which personal data is processed (GDPR terminology). Decides the "how" and "why" of data collection/use.

**Data Processor**: Entity that processes personal data on behalf of the controller. Must not use data for purposes other than those directed by the controller. Often the cloud provider.

**Data Custodian**: Performs day-to-day management -- backups, storage, access control implementation. Typically IT staff or system administrators.

**Data Steward**: Ensures data accuracy, reliability, and quality. Business-focused responsibility for data content.

**Data Subject**: The individual whose personal data is being collected, processed, or stored.

**System Owner**: Responsible for overall operation and security of a specific information system. Updates system security plans. Distinct from data owner.

**Business/Mission Owner**: Responsible for strategic goals of a business unit. May select governance frameworks like COBIT.

**Data Remanence**: Residual traces of data that persist on storage media after deletion or formatting. Includes residual magnetic flux, slack space content, and wear-leveled SSD cells.

**Slack Space**: Unused portion of a disk cluster after a file is stored. May contain data remnants pulled from memory.

**Sanitization**: The broad term for removing data from media to prevent recovery. Encompasses clearing, purging, and destroying.

**Clearing**: Overwriting media with patterns; prevents recovery by standard tools but not by laboratory techniques.

**Purging**: More intensive clearing; renders data unrecoverable by any known method. Not trusted for Top Secret data.

**Degaussing**: Applying a strong magnetic field to erase data on magnetic media. May render drives unusable. Ineffective on SSDs, optical discs, and flash storage.

**Crypto Shredding / Cryptographic Erasure**: Encrypting data with a strong algorithm (e.g., AES-256) and then securely destroying all copies of the encryption key. The primary option for cloud environments.

**Object Reuse**: Reassignment of storage media where residual data from prior use cannot be accessed by the new subject. Originates from the Orange Book (TCSEC).

**Declassification**: Purging media or systems for reuse in a lower-security environment. Often more expensive than buying new media.

**Defensible Destruction**: Destruction of assets in a controlled, legally defensible, and compliant manner.

**Security Baseline**: A minimum set of security controls for an information system based on impact level. Provides a starting point for protection.

**Scoping**: Reviewing baseline controls and removing those that do not apply to the system being protected.

**Tailoring**: Modifying a baseline to align with organizational mission, risk tolerance, and specific requirements.

**DRM (Digital Rights Management)**: Technologies that restrict use, modification, copying, and distribution of copyrighted or proprietary digital content.

**IRM (Information Rights Management)**: A subset of DRM focused on protecting sensitive organizational documents.

**DLP (Data Loss Prevention)**: Suite of technologies that detect and prevent unauthorized data exfiltration by scanning for keywords, patterns, and content.

**CASB (Cloud Access Security Broker)**: Security software positioned between users and cloud resources to enforce policies, monitor activity, and detect shadow IT.

**Shadow IT**: Use of IT resources (especially cloud services) without organizational approval or knowledge.

**Pseudonymization**: Replacing personally identifiable data elements with artificial identifiers (pseudonyms). Reversible process. GDPR recognizes it as a data protection technique with reduced compliance burden.

**Tokenization**: Replacing sensitive data (e.g., credit card numbers) with random tokens. The mapping between token and original data is stored securely in a vault. Used extensively in payment processing.

**Anonymization**: Irreversibly removing all identifying data from a dataset. If done correctly, GDPR no longer applies. Risk of reidentification through inference attacks.

**Homomorphic Encryption**: Allows computations on encrypted data without decrypting it first. Protects data in use.

**End of Life (EOL)**: The date a vendor stops producing and selling a product but may still provide support.

**End of Support (EOS)**: The date a vendor ceases all support, including security patches and updates.

**Curie Temperature**: The critical temperature at which a material's inherent magnetic alignment changes direction; relevant to understanding degaussing effectiveness.

**E-discovery**: The legal process of identifying, collecting, and producing electronically stored information in response to litigation or investigation.

**Litigation Hold**: Obligation to preserve data when litigation is reasonably anticipated, suspending any automated deletion processes.

---

## 3. CALCULATIONS AND FORMULAS

Domain 2 is not heavily quantitative, but the following calculations and quantitative concepts are relevant:

### Asset Valuation
- **Tangible asset value**: Original cost - depreciation + replacement cost considerations
- **Intangible asset value**: Revenue generated, competitive advantage, cost of recreation, market value of intellectual property
- **Data value**: Determined by potential impact of unauthorized disclosure, cost of creation, operational impact, liability exposure, and reputational damage

### Classification Cost-Benefit
- **Cost of protection should never exceed the value of the asset being protected**
- Compare: cost of security controls vs. potential loss from breach vs. regulatory penalties

### Retention Cost Analysis
- Storage costs = (Volume of data) x (Cost per unit of storage) x (Retention period)
- Factor in: media replacement cycles, environmental controls, personnel to manage, facility costs
- Liability cost of over-retention: potential legal discovery costs if data is kept beyond required period

### GDPR Penalty Calculations
- Up to 4% of global annual revenue OR 20 million Euros, whichever is higher
- Determines the financial risk of non-compliance with data protection

### NIST SP 800-53 Impact Assessment
- Low Impact: loss of CIA causes limited adverse effect
- Moderate Impact: loss of CIA causes serious adverse effect
- High Impact: loss of CIA causes severe or catastrophic adverse effect
- Impact level determines baseline control set selection

### Data Breach Cost Factors
- Number of records exposed
- Type of data (PII, PHI, financial)
- Notification costs per affected individual
- Regulatory fines per violation
- Reputational damage (hard to quantify but significant)

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Trap 1: Confusing Data Owner with Data Custodian
The data **owner** classifies data and makes policy decisions. The **custodian** implements those decisions day-to-day (backups, access controls). The exam loves to test whether you know the owner is accountable even when they delegate tasks. The owner does NOT perform backups -- that is the custodian's job.

### Trap 2: Degaussing SSDs
Degaussing only works on **magnetic media** (HDDs, tapes). It has **zero effect** on SSDs, flash drives, or optical media. The exam will offer degaussing as a tempting answer for SSD sanitization -- it is always wrong for non-magnetic media.

### Trap 3: Erasing vs. Clearing vs. Purging vs. Destroying
- Simply deleting a file (erasing) does NOT remove the data -- it only removes the directory pointer
- Clearing (overwriting) makes recovery difficult but not impossible
- Purging makes recovery impossible by known methods but is not trusted for highest classifications
- Only physical destruction guarantees data elimination for the most sensitive data
- The exam tests the hierarchy: destruction > degaussing > purging > clearing > erasing

### Trap 4: Classification of Media and Hardware
Media and hardware inherit the classification of the **highest** level of data they contain or process. A computer processing both Confidential and Top Secret data is classified as Top Secret.

### Trap 5: Data Controller vs. Data Processor (GDPR)
The controller decides **what** data to collect and **why**. The processor acts on the controller's instructions. The exam may describe a scenario where a company outsources payroll -- the company is the controller, the payroll service is the processor.

### Trap 6: Pseudonymization vs. Anonymization
Pseudonymization is **reversible** (you can link back to the original data). Anonymization is **irreversible**. GDPR still applies to pseudonymized data but not to truly anonymized data. The exam tests this distinction frequently.

### Trap 7: Tokenization vs. Pseudonymization
Both replace real data with substitutes, but tokenization uses random tokens stored in a secure vault, while pseudonymization uses aliases with a separate dataset linking back. Tokenization allows a third party (payment processor) to know both the token and original data. Pseudonymization is used when releasing datasets to parties who should NOT see the original data.

### Trap 8: Crypto Shredding is NOT Actual Shredding
Crypto shredding does not destroy the data -- it destroys the encryption keys, making the data unreadable. If keys are backed up or the algorithm is compromised, the data could be recovered. It is the primary option for cloud environments where physical destruction is not feasible.

### Trap 9: End of Life vs. End of Support
EOL means the vendor stops SELLING the product but still supports it. EOS means ALL SUPPORT stops, including security updates. EOS is the greater security concern. Budget priority should be systems approaching EOS, not EOL.

### Trap 10: Scoping vs. Tailoring
Scoping REMOVES controls that do not apply. Tailoring MODIFIES controls to fit the organization. Scoping is a subset/part of the tailoring process. The exam uses these terms precisely.

### Trap 11: Data in Motion on Backup Tapes
A backup tape being physically transported is data AT REST, not data in motion. Data in motion refers specifically to data traversing a network. This is a common trick question.

### Trap 12: DLP Cannot Scan Encrypted Data
DLP solutions examine unencrypted content. If data is encrypted before passing through the DLP, the DLP cannot inspect it. This is an important limitation tested on the exam.

### Trap 13: Labeling Unclassified Media
Best practice is to label even unclassified media. If only classified media is labeled, unlabeled media could be mistakenly assumed to be unclassified when it actually contains sensitive data that was accidentally left unmarked.

### Trap 14: Data Retention Can Create Liability
Keeping data longer than necessary creates legal exposure. The Boeing case: 14,000 email backup tapes led to a $92.5 million settlement. Organizations should not retain data beyond what is required unless a litigation hold is in effect.

### Trap 15: Link Encryption Exposes Data at Nodes
With link encryption, data is decrypted and re-encrypted at every node. Plaintext is available at each intermediate point. End-to-end encryption keeps data encrypted through all intermediary nodes but does not hide routing headers.

---

## 5. COMPARISONS AND DISTINCTIONS

### Data Owner vs. Data Custodian vs. Data Steward

| Aspect | Data Owner | Data Custodian | Data Steward |
|--------|-----------|---------------|--------------|
| Level | Senior management / executive | IT staff / sysadmins | Business-level personnel |
| Responsibility | Accountability for data protection | Day-to-day technical management | Data quality and accuracy |
| Key Tasks | Classify data, approve access, define policies | Backups, restores, access control implementation | Ensure data is accurate, reliable, consistent |
| Perspective | Strategic / policy | Technical / operational | Business / quality |
| Delegates to | Custodian | N/A (receives delegation) | N/A |

### Data Controller vs. Data Processor

| Aspect | Data Controller | Data Processor |
|--------|----------------|----------------|
| Decides | What data to collect, why, and how | N/A -- follows controller directions |
| Accountability | Primary accountability for data protection | Responsible for processing only as directed |
| Example | Employer collecting employee data | Third-party payroll service |
| GDPR role | Determines purpose and means | Processes on behalf of controller |
| Typical location | Internal to organization | Often external / third party |

### Government vs. Commercial Classification Levels

| Government | Commercial Equivalent | Impact of Unauthorized Disclosure |
|-----------|----------------------|----------------------------------|
| Top Secret | Confidential/Proprietary | Exceptionally grave damage |
| Secret | Private | Serious damage |
| Confidential | Sensitive | Damage |
| Unclassified | Public | No damage to national security |

### Three Data States Comparison

| State | Description | Primary Threats | Key Protections |
|-------|------------|----------------|-----------------|
| At Rest | Stored on media (HDD, SSD, tapes, databases) | Theft, unauthorized access, copying | Symmetric encryption (AES-256), access controls, backups |
| In Transit | Moving across networks | Interception, eavesdropping, MITM | TLS/SSL, VPN, end-to-end encryption, link encryption |
| In Use | In memory, being processed | Screen capture, shoulder surfing, memory scraping | Homomorphic encryption, RBAC, DLP, clean desk, privacy screens |

### End-to-End vs. Link vs. Onion Encryption

| Feature | End-to-End | Link | Onion |
|---------|-----------|------|-------|
| What is encrypted | Data payload only | Entire packet (header + data) | Multiple layers around data |
| Routing info visible | Yes (headers in plaintext) | No (hidden between hops) | No (hidden from all nodes) |
| Plaintext exposure | Only at source and destination | At every intermediate node | Only at final destination |
| Anonymity | No | Partial (between hops only) | Yes |
| Performance | Good | Good | Slower |
| Example | VPN | Service provider link | TOR |

### Sanitization Methods Hierarchy (Most to Least Effective)

| Method | Effectiveness | Reusable? | Works on SSDs? | Works on Magnetic? |
|--------|--------------|-----------|----------------|-------------------|
| Physical Destruction | Highest | No | Yes | Yes |
| Degaussing | High | Usually No | No | Yes |
| Crypto Shredding | High (if encryption strong) | Yes | Yes | Yes |
| Purging | High | Yes | Variable | Yes |
| Clearing/Overwriting | Moderate | Yes | Limited | Yes |
| Erasing/Formatting | Low | Yes | Yes | Yes |

### Pseudonymization vs. Tokenization vs. Anonymization

| Feature | Pseudonymization | Tokenization | Anonymization |
|---------|-----------------|-------------|---------------|
| Reversible? | Yes | Yes (via vault) | No |
| Original data accessible? | Yes, through separate dataset | Yes, through tokenization vault | No |
| GDPR still applies? | Yes (reduced requirements) | Yes | No |
| Primary use case | Research data sharing | Payment card processing | Statistical analysis |
| Who knows both values? | Data holder with lookup table | Token vault operator | No one |

### DRM vs. IRM vs. DLP

| Feature | DRM | IRM | DLP |
|---------|-----|-----|-----|
| Focus | Copyrighted content (music, video, software) | Organizational documents | All sensitive data |
| Scope | External distribution | Internal enterprise | Internal and external |
| Techniques | Licensing, encryption, digital tags | Access restrictions on documents | Content scanning, pattern matching |
| Legal backing | DMCA | Organizational policy | Organizational policy |

---

## 6. LEGAL AND REGULATORY

### GDPR (General Data Protection Regulation)
- Replaced the European Data Protection Directive (Directive 95/46/EC)
- Enforceable since May 25, 2018
- Applies to all EU member states and any organization processing data of EU residents
- Restricts data transfers to countries outside the EU without appropriate safeguards
- Penalties: up to 4% of global annual revenue or 20 million Euros (whichever higher)
- Mandates Data Protection Officer (DPO) role for covered organizations
- Defines data controllers, processors, and data subjects
- Recognizes pseudonymization as a data protection technique (reduced requirements)
- Anonymized data falls outside GDPR scope
- Right to be forgotten (data erasure)
- Data portability rights
- Binding corporate rules required for cross-border transfers

### HIPAA (Health Insurance Portability and Accountability Act)
- Protects PHI in the United States
- Applies to healthcare providers, health insurers, clearinghouses, and their business associates
- Privacy Rule: standards for use and disclosure of PHI; patient rights to access/amend PHI
- Security Rule: technical, physical, and administrative safeguards for ePHI
- Broader than just doctors/hospitals -- applies to any entity handling PHI including employers providing health insurance

### CCPA (California Consumer Privacy Act)
- Consumer rights: know what PII is collected, delete it, opt out of data sale
- Applies to businesses meeting certain thresholds operating in California

### PIPEDA (Personal Information Protection and Electronic Documents Act)
- Canadian federal privacy law for private sector
- Governs collection, use, and disclosure of personal information in commercial activities
- Applies to organizations in Canada and those handling Canadian residents' data across borders

### GLBA (Gramm-Leach-Bliley Act)
- Financial privacy law requiring financial institutions to protect consumer financial data
- Relevant to classification of financial data

### PCI DSS (Payment Card Industry Data Security Standard)
- Industry standard (not a law) for organizations processing credit card transactions
- Mandates specific controls for storing, processing, and transmitting cardholder data
- Key standard for tokenization questions

### DMCA (Digital Millennium Copyright Act)
- U.S. law providing legal recourse for DRM violations
- Criminalizes circumvention of technological measures protecting copyrighted works

### FOIA (Freedom of Information Act)
- U.S. law enabling public access to unclassified government data
- Requests must follow prescribed procedures

### OECD Privacy Principles
- Collection Limitation Principle
- Data Quality Principle
- Purpose Specification Principle
- Use Limitation Principle
- Security Safeguards Principle
- Openness Principle
- Individual Participation Principle
- Accountability Principle
- Note: "Right to be Forgotten" is NOT an OECD principle (it comes from GDPR)

### Cross-Border Data Flow
- Data sovereignty: data is subject to laws of the country where it is stored
- GDPR restricts transfers outside EU unless adequate protections exist
- Standard contractual clauses, binding corporate rules, or adequacy decisions may enable transfers
- Cloud storage location verification is critical for compliance

---

## 7. FRAMEWORKS AND METHODOLOGIES

### NIST SP 800-88 (Guidelines for Media Sanitization)
- Defines three categories: Clear, Purge, Destroy
- Provides decision flowchart for selecting appropriate sanitization method
- Based on confidentiality level and intended disposition of media
- Considered the authoritative reference for media sanitization

### NIST SP 800-53 / 800-53B (Security and Privacy Controls)
- Defines security control baselines: Low-Impact, Moderate-Impact, High-Impact, Privacy
- Controls are selected and then tailored through scoping and tailoring
- Provides the framework for standards selection in Domain 2

### NIST SP 800-18 (Guide for Developing Security Plans)
- Outlines responsibilities for information owner/data owner
- Defines "rules of behavior" (equivalent to acceptable use policy)
- Details system owner responsibilities: develop security plans, implement controls, ensure training

### NIST SP 800-122 (Guide to Protecting PII)
- Formal definition of PII
- Guidelines for determining PII confidentiality impact levels
- Recommendations for protecting PII

### NIST SP 800-60 (Information System Categorization)
- Process for categorizing information systems based on types of information processed
- Links to control selection from NIST SP 800-53

### NIST SP 500-241 (DRM Definition)
- Formal definition of Digital Rights Management from NIST perspective

### COBIT (Control Objectives for Information and Related Technology)
- IT management and governance framework
- Typically selected/applied by business owners to balance security and business needs
- Aligns IT goals with business objectives

### ISO/IEC 27001
- International standard for information security management systems
- Provides comprehensive control framework for asset security

### NIST Cybersecurity Framework
- Risk-based approach to managing cybersecurity
- Five functions: Identify, Protect, Detect, Respond, Recover
- Asset management is a key subcategory under "Identify"

### Data Classification Framework (General Process)
1. Establish classification board with key stakeholders
2. Define classification levels based on organizational goals
3. Define criteria for each level
4. Create classification policy with supporting standards, procedures, baselines, and guidelines
5. Inventory and identify all assets
6. Assign ownership
7. Owners classify assets based on criteria
8. Apply labels and markings
9. Implement controls per classification level
10. Periodically review and reclassify as needed

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Data Lifecycle
```
Create/Collect --> Store --> Use --> Share --> Archive --> Destroy
       ^                                                    |
       |------------- Classification can change ------------|
                      at any point in lifecycle
```

**Create/Collect**: Data is generated or acquired. Apply initial classification immediately. Limit collection to necessary data only.

**Store**: Place data on appropriate media with controls matching classification. Encrypt sensitive data at rest. Apply access controls.

**Use**: Data is actively processed. Protect with RBAC, DLP, clean desk policies, privacy screens. Flush memory buffers after use.

**Share**: Transmit data internally or externally. Encrypt in transit. Enforce need-to-know. Apply DLP to outbound data flows.

**Archive**: Move inactive data to long-term storage. Maintain classification level. Ensure media longevity and format readability.

**Destroy**: Sanitize or destroy media when data reaches end of retention period. Method based on sensitivity level. Verify destruction. Document process.

### Classification Process Flow
```
1. Identify asset/data
2. Determine value, sensitivity, regulatory requirements
3. Data owner assigns classification level
4. Apply appropriate label/marking
5. Implement controls based on classification
6. Monitor and audit compliance
7. Review and reclassify periodically (or upon trigger event)
```

### Retention and Destruction Process
```
1. Determine applicable retention requirements (legal, regulatory, business)
2. Define retention periods in policy
3. Classify records and apply retention schedules
4. Store according to classification requirements
5. Monitor retention periods
6. Check for litigation holds before destruction
7. Select appropriate destruction method based on classification
8. Execute destruction
9. Verify destruction (inspect/test media)
10. Document destruction (certificate of destruction)
```

### Media Sanitization Decision Process (NIST SP 800-88)
```
1. What is the classification/sensitivity of the data?
2. Will the media be reused?
   - If reused within same classification level --> Clear
   - If reused at lower classification level --> Purge (or Destroy if purging not trusted)
3. Will the media be disposed of?
   - If disposed --> Destroy
4. Is the media magnetic?
   - Yes --> Degaussing is an option (in addition to others)
   - No (SSD/flash) --> Physical destruction or crypto shredding
5. Is the environment cloud-based?
   - Yes --> Crypto shredding (typically only option)
6. Verify sanitization was successful
7. Document the process
```

### Privacy Impact Assessment Process
```
1. Identify the system/project collecting personal data
2. Determine what personal data is collected and why
3. Assess data flows (collection, storage, use, sharing)
4. Identify privacy risks and potential impacts
5. Evaluate existing controls against requirements
6. Determine additional controls needed
7. Document findings and recommendations
8. Obtain management approval
9. Implement controls
10. Monitor and review periodically
```

---

## 9. THINK LIKE A MANAGER

### Data Ownership Accountability
A manager understands that **ownership equals accountability**. Data owners cannot delegate accountability, only tasks. If a breach occurs because proper classification was not established, the owner is responsible -- not the custodian who implemented what they were told to. The exam wants you to think from the perspective of someone who is ultimately answerable for data protection decisions.

### Classification Decisions
Managers do not classify data based on gut feeling. They consider: (1) the value of the data to the organization, (2) the impact if it were disclosed, modified, or unavailable, (3) legal and regulatory obligations, and (4) the cost of protecting it. The protection cost should never exceed the value of the data. Over-classifying wastes resources; under-classifying exposes the organization.

### Balancing Access with Protection
The manager's dilemma: users need data to do their jobs, but every access point is a potential breach vector. The answer is always proportional controls. Apply the principle of least privilege combined with classification-based access. Do not lock data away so tightly that business operations suffer, but do not leave data exposed for convenience.

### Data Handling Policies
A good manager creates clear, enforceable policies. The mark of poor management is expecting people to "just know" how to handle data. Written policies for labeling, handling, storing, transporting, and destroying data -- aligned to classification levels -- are non-negotiable. Training reinforces these policies.

### Privacy Program Management
Managers build privacy programs, not point solutions. This means: identifying all personal data the organization collects, mapping data flows, ensuring legal compliance across all jurisdictions, appointing privacy officers (DPO under GDPR), conducting privacy impact assessments, and establishing incident response procedures for data breaches.

### Retention Decisions
A manager knows that keeping data too long is almost as risky as not keeping it long enough. The Boeing case (14,000 backup tapes, $92.5 million settlement) illustrates how excess retention creates legal liability. Set retention periods based on legal requirements and business need, implement automated enforcement, and verify compliance.

### Vendor Management and Data Processing
When outsourcing data processing, the organization remains the controller and retains accountability. A manager ensures contracts specify exactly how the processor may use the data, requires security controls, mandates breach notification, and verifies compliance through audits.

### Cloud Data Governance
Moving to the cloud does not transfer responsibility for data protection. The manager ensures: data is encrypted before migration, a CASB is deployed for policy enforcement, data location complies with sovereignty requirements, and crypto shredding is available for data destruction.

### Incident Preparedness
Managers plan for failure. Adequate logging, monitoring, and auditing of data access enable investigation when breaches occur. Audit trail data must be retained long enough to support incident reconstruction.

### Think Risk, Not Technology
The exam expects you to prioritize based on risk. When a question asks what to do FIRST, BEST, or MOST importantly, think about: What reduces the most risk? What does the organization's policy require? What is legally mandated? Technology is a tool; the manager selects the right tool based on risk analysis, not vendor marketing.

---

## 10. EXAM STRATEGY

### How Domain 2 is Tested
- Domain 2 accounts for approximately **10%** of the exam (roughly 12-15 questions out of 125-175)
- Questions tend to be **scenario-based** -- you will be given a situation and asked for the BEST action, MOST appropriate role, or FIRST step
- Heavy emphasis on **data roles** (owner, custodian, controller, processor, steward, subject)
- **Data destruction methods** are a favorite topic -- know the hierarchy and which methods work on which media
- **Data states** (at rest, in transit, in use) and appropriate protections for each are frequently tested
- **Privacy concepts** (pseudonymization, tokenization, anonymization) and GDPR are increasingly important

### Question Patterns

**"Who is responsible for..." questions**: These always want you to identify the correct data role. Remember: owner = accountability and classification; custodian = implementation; controller = decides what/why; processor = does what controller says.

**"What is the BEST method to destroy..." questions**: Match the destruction method to the media type and sensitivity. For SSDs: physical destruction. For cloud: crypto shredding. For magnetic media: degaussing or destruction.

**"What should be done FIRST..." questions**: In asset security, the first step is usually to classify/identify the data before you can determine how to protect it. You cannot protect what you have not classified.

**"Which of the following is NOT..." questions**: These test edge cases. Know what OECD principles include (Right to be Forgotten is NOT one). Know what is NOT PII (ZIP code alone). Know what is NOT a factor in retention (size of data).

### Wrong-Answer Traps to Watch For
- Answers that confuse owner with custodian responsibilities
- Answers that apply degaussing to SSDs
- Answers suggesting erasing or formatting is sufficient for sensitive data
- Answers that treat pseudonymized data as fully anonymized
- Answers that suggest the processor determines what data to collect (that is the controller)
- Answers confusing EOL with EOS (EOL = stop selling, EOS = stop supporting)
- Answers treating a backup tape in transit as "data in motion" (it is data at rest)

### Time Management
Domain 2 questions tend to be shorter than Domain 1 risk management questions. Read the scenario carefully, identify the data role or data state being described, and select the answer that aligns with the hierarchy of responsibility or protection.

---

## 11. CROSS-DOMAIN CONNECTIONS

### Domain 1: Security and Risk Management
- **Risk assessment** drives classification decisions -- data value assessment in D2 uses risk concepts from D1
- **Security policies** (D1) define classification levels and handling requirements (D2)
- **Due care and due diligence** (D1) underpin data owner liability (D2)
- **Legal and regulatory compliance** (D1) drives data protection requirements (D2) -- GDPR, HIPAA, CCPA
- **Privacy principles** (D1 OECD guidelines) inform data collection and use limitations (D2)
- **Intellectual property protection** (D1) connects to DRM methods (D2)

### Domain 3: Security Architecture and Engineering
- **Encryption algorithms** (D3) are the primary mechanism for protecting data states (D2)
- **Symmetric encryption** (AES-256 from D3) protects data at rest (D2)
- **Asymmetric encryption and TLS/SSL** (D3) protect data in transit (D2)
- **Homomorphic encryption** (D3) protects data in use (D2)
- **Security models** (Bell-LaPadula from D3) enforce classification-based access that originates in D2
- **Memory protection** (D3) relates to data in use protections (D2)
- **TCSEC / Orange Book** (D3) defines object reuse requirements (D2)

### Domain 4: Communication and Network Security
- **Network encryption protocols** (D4) implement data-in-transit protections (D2)
- **VPN** (D4) is the primary example of end-to-end encryption (D2)
- **TOR/onion routing** (D4) illustrates onion network encryption concept (D2)
- **Link encryption vs. end-to-end encryption** concepts span both domains
- **Network DLP** (D2) is deployed at network boundaries (D4)

### Domain 5: Identity and Access Management
- **Access controls** (D5) enforce classification-based access from D2
- **Need-to-know and least privilege** (D5) implement data handling requirements (D2)
- **RBAC** (D5) protects data in use (D2)
- **Data owner approves access** (D2), IAM systems enforce it (D5)
- **Federation** (D5) enables cross-organization data sharing per D2 policies

### Domain 6: Security Assessment and Testing
- **Auditing and monitoring** (D6) verify that classification and handling requirements (D2) are followed
- **Data discovery** via DLP (D2) relates to vulnerability assessment (D6)
- **Compliance checking** (D6) validates adherence to data retention policies (D2)

### Domain 7: Security Operations
- **Media handling and destruction** procedures (D7) directly implement D2 policies
- **Asset management** (D7) maintains the inventory that D2 classification depends on
- **Incident response** (D7) addresses data breaches resulting from D2 control failures
- **Backup and recovery** (D7) implements data custodian responsibilities from D2
- **Change management** (D7) may trigger reclassification of data (D2)
- **Physical security** (D7) protects media storage locations defined in D2

### Domain 8: Software Development Security
- **Secure coding practices** (D8) protect data in use within applications (D2)
- **Database security** (D8) implements data at rest protections (D2)
- **Data inference and aggregation attacks** (D8) threaten anonymized data (D2)
- **Input validation** (D8) protects data integrity referenced in D2

---

## 12. REAL-WORLD APPLICATION

### Breach Examples Involving Data Mishandling

**Marriott Data Breach (2020)**: Approximately 5.2 million guests' personal data stolen (names, addresses, email, employer info, phone numbers). Illustrates consequences of inadequate data-at-rest protections and the scope of PII exposure.

**Sony Pictures Hack**: Over 100 TB of data stolen, including unreleased movies. Demonstrated the catastrophic impact of failing to protect proprietary data classified at the highest organizational level. Pirated downloads directly impacted revenue.

**AWS S3 Bucket Exposures (Various)**: THSuite exposed 30,000+ individuals' PII; another incident exposed 900,000 cosmetic surgery images. These show the danger of misconfigured cloud storage -- the data classification policy must extend to cloud environments. A CASB would have detected and prevented these misconfigurations.

**Boeing Email Lawsuit**: During litigation, Boeing was forced to restore and review 14,000 email backup tapes, ultimately settling for $92.5 million. This case drives the principle that over-retention creates legal liability and demonstrates why aggressive data retention policies matter.

### Practical Scenarios

**Cloud Migration**: Before migrating data to a cloud provider, encrypt locally first (crypto shredding readiness), verify the cloud provider's geographic data center locations (sovereignty), deploy a CASB, and ensure contracts specify the provider's role as data processor.

**Employee Device Refresh**: When replacing mobile devices every two years while devices are still functional and receiving updates, this represents EOL by organizational policy (planned obsolescence), not EOS. Proper sanitization (factory reset is NOT sufficient for sensitive data) must occur before disposal or reuse.

**Medical Records Handling**: A hospital using pseudonymization to share patient records with researchers. The hospital (controller) replaces patient names with identifiers (Patient 23456). Researchers can analyze data without accessing PII. The hospital retains the lookup table. GDPR still applies because the data is pseudonymized, not anonymized.

**Payment Card Processing**: An e-commerce site uses tokenization so that actual credit card numbers never touch the merchant's servers. The payment network creates tokens, stores encrypted card data in a vault, and processes charges using tokens. If the merchant is breached, only tokens are exposed -- useless without the vault.

**SSD Disposal**: An organization replacing server SSDs. Degaussing will NOT work. Overwriting is unreliable due to wear-leveling. The correct approach: use manufacturer sanitization tools if available, then physically destroy (disintegrate to 2mm or smaller per NSA requirements). For the most sensitive data, skip software methods entirely and go straight to physical destruction.

**Litigation Hold**: An organization with a 6-month email retention policy learns that it may face litigation. All automated email deletion must be suspended immediately. Destroying data after becoming aware of potential litigation constitutes spoliation of evidence and carries severe legal penalties.

---

## 13. MEMORY AIDS AND MNEMONICS

### Data Roles: "OCCU-PS" (Oh See, CU PS!)
- **O**wner: Classifies, approves access, ultimately accountable
- **C**ontroller: Controls the what/why of data processing (GDPR)
- **C**ustodian: Cares for data day-to-day (backups, storage, access implementation)
- **U**ser: Uses data to do their job
- **P**rocessor: Processes data on behalf of controller
- **S**ubject: The person the data is about

### Government Classification: "TS-S-C-U" (Top to Bottom)
- **T**op **S**ecret: "**E**xceptionally **G**rave **D**amage" (EGD)
- **S**ecret: "**S**erious **D**amage" (SD)
- **C**onfidential: "**D**amage" (D)
- **U**nclassified: No damage

Memory trick: The severity words match the classification order -- **Exceptionally** grave > **Serious** > plain **Damage** > None

### Commercial Classification: "C-P-S-P" (Caps Private Sensitive Public)
- **C**onfidential/Proprietary (highest)
- **P**rivate
- **S**ensitive
- **P**ublic (lowest)

### Data Lifecycle: "Create, Store, Use, Share, Archive, Destroy" -- "CSUSD" (like "Accused")
Or think: **C**hef **S**lowly **U**ses **S**picy **A**romatic **D**ishes

### Sanitization Hierarchy: "Don't Delete Carelessly, People Can Find Everything"
- **D**estruction (best)
- **D**egaussing
- **C**rypto shredding
- **P**urging
- **C**learing
- **F**ormatting
- **E**rasing (worst)

### Data States: "RUT" (Rest, Use, Transit)
- **R**est = stored (think "resting on a shelf")
- **U**se = in memory (think "using it right now")
- **T**ransit = moving across network (think "traveling")

### Three Encryption Types for Data in Transit: "ELO" (like the band)
- **E**nd-to-end: Encrypts data, headers visible, VPN
- **L**ink: Encrypts everything between nodes, decrypts at each node
- **O**nion: Multiple layers, anonymity, TOR

### DLP Types: "NEC" (Network, Endpoint, Cloud)
- **N**etwork DLP: Edge of network, scans outbound traffic
- **E**ndpoint DLP: On devices, blocks USB/print of sensitive data
- **C**loud DLP: Cloud-native scanning

### NIST Baselines: "LMH-P" (Low, Moderate, High, Privacy)
Each level includes all controls from the lower level plus additional controls. Think of it as stacking: Low + more = Moderate, Moderate + more = High.

### Scoping vs. Tailoring: "S = Subtract, T = Tweak"
- **S**coping = **S**ubtract controls that do not apply
- **T**ailoring = **T**weak/modify controls to fit

### Degaussing Limitation: "Degaussing = De-MAGNETic only"
Works only on magnetic media (HDD, tapes). Useless on SSDs, flash, optical.

### GDPR Penalties: "4-20 Rule"
- **4**% of global revenue OR **20** million Euros, whichever is HIGHER

---

## 14. PRACTICE QUESTION PATTERNS

### Pattern 1: Role Identification
These questions describe a scenario and ask you to identify which data role is performing a specific task. The correct answer depends on whether the action involves policy/classification (owner), implementation/maintenance (custodian), or processing on behalf of another party (processor).

Common distractors: Offering "data controller" when "data owner" is correct (or vice versa), or presenting the custodian as the decision-maker when they are the implementer.

### Pattern 2: Destruction Method Selection
You are given a media type and sensitivity level, then asked which sanitization method is best. The key variables are: (1) magnetic vs. non-magnetic media, (2) sensitivity level (higher = more aggressive method), (3) whether media will be reused, and (4) whether the environment is cloud-based.

Common distractors: Degaussing for SSDs (wrong), formatting as adequate sanitization (wrong), or overwriting as sufficient for top-secret data (wrong).

### Pattern 3: Data State Protection
Questions describe a scenario involving data storage, transmission, or processing and ask which protection mechanism is most appropriate. You must identify the data state first, then match the protection.

Common distractors: Offering symmetric encryption for data in transit (partially correct but not the best answer -- TLS uses a combination), or suggesting homomorphic encryption for data at rest (it is for data in use).

### Pattern 4: Classification Application
Questions ask what classification a piece of data or system should receive, or what the most important factor in classification is (always the value/impact, never the format or size).

Common distractors: Classifying based on data format rather than sensitivity, or classifying a system at the average rather than highest level of data it processes.

### Pattern 5: Policy and Compliance
Questions about what drives retention periods (legal requirements first, then business needs), what creates liability (over-retention without justification), or what to do when new regulations apply (review and reclassify data).

Common distractors: Treating all data retention as permanent, or suggesting new encryption as the first response to a new law rather than reviewing classifications.

### Pattern 6: Privacy Regulation Application
Questions testing GDPR concepts: what pseudonymization means, when GDPR applies, what rights data subjects have, and what penalties apply.

Common distractors: Treating pseudonymized data as exempt from GDPR (only anonymized data is exempt), or confusing HIPAA scope (broader than just hospitals).

### Pattern 7: Scoping vs. Tailoring
Questions describing an organization selecting or modifying security controls from a baseline, asking which term applies.

Common distractors: Reversing the definitions of scoping and tailoring, or conflating tailoring with standards selection.

### Pattern 8: Technology Selection
Questions asking which tool (DLP, CASB, DRM, IRM) addresses a specific need. Cloud policy enforcement = CASB. Preventing data exfiltration = DLP. Protecting copyrighted content = DRM. Protecting internal documents = IRM.

Common distractors: Suggesting DLP for copyright protection (that is DRM), or firewall for cloud policy enforcement (that is CASB).

---

## 15. GAPS TO ADD

The current story mode covers:
- Data Classification levels (government + business)
- Data Ownership Roles
- Data States
- Data Lifecycle
- Retention Policies
- Destruction Methods
- Privacy Principles
- Data Protection Controls per state

### Topics NOT Currently in Story Mode (Must Be Added)

1. **Labeling and Marking Distinction**: The difference between system-readable labeling (metadata, electronic labels) and human-readable marking (watermarks, physical labels, headers/footers). Labeling unclassified media as a best practice. Desktop backgrounds indicating classification.

2. **Classification vs. Categorization**: Classification assigns hierarchical sensitivity levels; categorization sorts into non-hierarchical classes. This is a testable distinction not currently covered.

3. **Scoping and Tailoring**: Selecting applicable controls from baselines (scoping) and modifying them for organizational fit (tailoring). Critical D2 concept for the exam.

4. **Security Baselines (NIST SP 800-53B)**: Low-impact, moderate-impact, high-impact, and privacy baselines. How they stack and how to apply them.

5. **Standards Selection**: Identifying which external standards apply to the organization (PCI DSS, GDPR, etc.) and ensuring controls comply.

6. **Pseudonymization, Tokenization, and Anonymization**: Three distinct data de-identification techniques with different reversibility, use cases, and GDPR implications. Heavy exam topics not in current story.

7. **DRM and IRM**: Digital Rights Management techniques (licensing, persistent authentication, audit trails, expiration), IRM as subset, and DMCA legal foundation.

8. **CASB (Cloud Access Security Broker)**: Cloud policy enforcement, shadow IT detection, and bridging internal security to cloud environments.

9. **DLP Types and Mechanics**: Network DLP, Endpoint DLP, Cloud DLP, pattern matching, keyword scanning, content discovery. How DLP cannot scan encrypted data.

10. **Information Obfuscation Methods**: Concealing, pruning, fabricating, trimming, encrypting data. Data masking techniques for non-production environments.

11. **End-to-End vs. Link vs. Onion Encryption**: Three methods of protecting data in transit with different tradeoffs for confidentiality, anonymity, and exposure at nodes.

12. **Object Reuse**: TCSEC/Orange Book concept of secure reassignment of media. Overwriting as the primary implementation.

13. **Data Remanence Deep Dive**: Slack space, residual magnetic flux, SSD wear-leveling, and why standard deletion is insufficient. SSD-specific destruction challenges.

14. **EOL vs. EOS**: Vendor lifecycle milestones and their security implications. Hardware refresh planning.

15. **Data Collection Limitation**: Privacy principle of collecting only necessary data. Reducing breach exposure by not storing unnecessary data.

16. **Data Location and Sovereignty**: Geographic data storage concerns, cross-border data flow restrictions, cloud data center verification.

17. **Compliance Officer Role**: Dedicated position ensuring business activities follow applicable laws and regulations.

18. **Data Privacy Officer (DPO)**: GDPR-mandated role for overseeing data protection within organizations.

19. **Homomorphic Encryption**: Allows computation on encrypted data; emerging technology for protecting data in use.

20. **Declassification Process**: Steps and risks of downgrading media/systems from higher to lower classification levels.

21. **E-discovery and Litigation Holds**: Legal obligations to preserve data when litigation is anticipated, and impact on retention/destruction processes.

22. **Air-Gapped Networks and Unidirectional Bridges**: Physical data maintenance techniques for classified environments.

23. **Defensible Destruction**: The concept of destroying data in a legally defensible, documented, and compliant manner.

24. **Memory Types and Security**: Volatile (DRAM/RAM) vs. non-volatile (ROM, PROM, EPROM, EEPROM, flash). EPROM erasure via UV light. Security implications of each type.

25. **Randomized Masking / Data Shuffling**: Anonymization technique that maintains aggregate statistical properties while scrambling individual records.
