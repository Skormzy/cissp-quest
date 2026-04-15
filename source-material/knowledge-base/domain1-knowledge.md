# Domain 1: Security and Risk Management -- Comprehensive Knowledge Summary

> **Purpose**: Single source of truth for all Domain 1 content creation in CISSP Quest.
> **Weight on Exam**: ~15% of scored questions.
> **Sources Synthesized**: Exam Companion (Bouke), Student Workbook (Destination Cert), Chapple Study Guide (Sybex), Destination CISSP (Rob Witcher), Chapple Practice Tests.

---

## 1. COMPLETE TOPIC LIST

### 1.1 Professional Ethics
- ISC2 Code of Ethics Preamble
- ISC2 Code of Ethics Canons (in priority order)
  - Canon 1: Protect society, public trust, infrastructure
  - Canon 2: Act honorably, honestly, justly, responsibly, legally
  - Canon 3: Provide diligent and competent service to principals
  - Canon 4: Advance and protect the profession
- Organizational Code of Ethics
  - Ethics codified in corporate policies
  - Top-down ethical culture
  - Conflicts of interest management
  - Ethical decision-making scenarios

### 1.2 Security Concepts
- CIA Triad
  - Confidentiality (sensitivity, discretion, criticality, concealment, secrecy, privacy, seclusion, isolation)
  - Integrity (accuracy, truthfulness, validity, accountability, responsibility, completeness, comprehensiveness)
  - Availability (usability, accessibility, timeliness)
- DAD Triad (Disclosure, Alteration, Destruction)
- Overprotection risks
- Five Pillars of Information Security (CIA + Authenticity + Nonrepudiation)
- AAA Services (Identification, Authentication, Authorization, Auditing, Accounting)
- Protection Mechanisms
  - Defense in depth (layering, serial vs. parallel, breadth/diversity of defense)
  - Abstraction
  - Data hiding vs. security through obscurity
  - Encryption
- Security boundaries and perimeters
- Least privilege
- Need to know

### 1.3 Security Governance
- Definition and purpose of security governance
- Alignment of security function to business strategy, goals, mission, objectives
- Top-down vs. bottom-up approach
- Security management planning
  - Strategic plan (~5 years, long-term vision)
  - Tactical plan (~1 year, project-level)
  - Operational plan (short-term, step-by-step)
- Business case development
- Organizational processes
  - Acquisitions and mergers (increased risk)
  - Divestitures (data sanitization, exit interviews)
  - Governance committees
- Organizational roles and responsibilities
  - Senior Manager / CEO / Board of Directors
  - Security Professional / CISO
  - Asset Owner / Data Controller
  - Custodian
  - User / Operator
  - Auditor
  - Data Processor
  - Data Steward
  - Data Subject
- Accountability vs. responsibility (critical distinction)
  - Accountability cannot be delegated
  - Responsibility can be delegated
  - Only one entity can be accountable; multiple can be responsible
- Security control frameworks
  - ISO 27001/27002 (international ISMS)
  - NIST SP 800-53 (security controls for federal systems)
  - NIST SP 800-37 RMF (7-step risk management framework)
  - NIST CSF (Cybersecurity Framework)
  - COBIT (6 principles, IT governance/audit)
  - SABSA (risk-driven, business-focused security architecture)
  - PCI DSS (payment card security standard)
  - FedRAMP (cloud authorization for federal agencies)
  - ITIL (IT service management best practices)
  - COSO ERM (enterprise risk management)
  - ISO 31000 (risk management standard)
  - ISACA Risk IT Framework
  - FAIR (Factor Analysis of Information Risk -- quantitative)
- Third-party governance
  - External oversight and auditing
  - On-site assessments
  - Document exchange and review
  - Authorization to Operate (ATO)
- Due care and due diligence
- Scoping and tailoring of controls

### 1.4 Legal, Regulatory, and Compliance
- Cybercrimes and data breaches
- Licensing and intellectual property
  - Trade secrets (infinite protection, no disclosure required, misappropriation)
  - Patents (functional innovations, 20-year term, disclosure required)
  - Copyrights (expression of ideas in fixed medium, set term, DMCA)
  - Trademarks (symbols/colors/sounds distinguishing products, potentially infinite)
  - Industrial designs
- Import/export controls
  - Wassenaar Arrangement (voluntary, 42+ members, dual-use goods)
  - ITAR (defense-related items, US Department of State)
  - EAR (commercial/dual-use items, US Department of Commerce)
- Transborder data flow
  - Data residency / data localization laws
  - Cross-border personal data transfers
  - GDPR restrictions on EU citizen data
- Privacy
  - Definition of privacy
  - Personal data / PII / SPI / PHI definitions
  - Direct vs. indirect vs. online identifiers
  - Privacy roles: data owner/controller, data processor, data custodian, data subject
  - GDPR (7 principles, 72-hour breach notification, supervisory authorities, right to erasure)
  - OECD Privacy Guidelines (8 principles)
  - Privacy Impact Assessment (PIA) / Data Protection Impact Assessment (DPIA)
  - Privacy laws by jurisdiction
    - US: HIPAA, GLBA, SOX, COPPA, CCPA/CPRA, FERPA, FISMA, CFAA, ECPA, CALEA
    - Canada: PIPEDA
    - EU: GDPR
    - China: PIPL
    - South Africa: POPIA
    - Australia: Privacy Act / APPs
    - South Korea: PIPA
    - Argentina: PDPL
- Contractual, legal, industry standards, regulatory requirements
- Compliance programs and monitoring

### 1.5 Investigation Types
- Administrative investigations (preponderance of evidence standard)
- Criminal investigations (beyond a reasonable doubt standard)
- Civil investigations
- Regulatory investigations
- Industry standards investigations

### 1.6 Security Policy, Standards, Procedures, Guidelines
- Security policy hierarchy
  - Overarching (organizational) security policy
  - Functional / issue-specific policies
  - System-specific policies
- Standards (mandatory, specific hardware/software)
- Baselines (minimum security configurations)
- Procedures / SOPs (step-by-step mandatory actions)
- Guidelines (recommendations, not mandatory)
- Policy development, review cycles, and enforcement
- Security document hierarchy model

### 1.7 Business Continuity (BC) Requirements
- Business Continuity Management (BCM)
- Business Impact Analysis (BIA)
  - Identify critical business functions
  - Maximum Tolerable Downtime (MTD) / Maximum Acceptable Outage (MAO)
  - Recovery Time Objective (RTO)
  - Recovery Point Objective (RPO)
  - Work Recovery Time (WRT)
- External dependencies mapping
- Recovery strategies
  - Alternative work locations (hot/warm/cold sites)
  - Backup systems and communication plans
- BCP vs. DRP distinction
- BCP testing and maintenance
- BCP team composition and senior management role

### 1.8 Personnel Security
- Candidate screening and hiring
  - Job descriptions and classifications
  - Background checks, reference checks, education verification
  - Security clearance validation
- Employment agreements
  - Acceptable Use Policy (AUP)
  - Nondisclosure Agreement (NDA) -- unilateral, bilateral, multilateral
  - Non-compete Agreement (NCA)
  - Code of conduct
- Onboarding processes
  - Identity proofing
  - Policy sign-off
  - Access provisioning (least privilege)
- Personnel security controls
  - Job rotation (detect fraud, cross-training)
  - Mandatory vacations (detect fraud via peer review)
  - Separation of duties (prevent fraud)
  - Need-to-know and least privilege
- Employee oversight and privilege creep
- User Behavior Analytics (UBA/UEBA)
- Offboarding / termination processes
  - Voluntary vs. involuntary termination
  - Account deactivation/deletion timing
  - Exit interviews
  - Property recovery
  - NDA reminders
- Employee duress scenarios and keywords
- Vendor, consultant, contractor agreements and controls
- Collusion prevention
- Multiparty risk

### 1.9 Risk Management Concepts
- Risk terminology
  - Asset, threat, threat agent/actor, threat event, threat vector
  - Vulnerability, exposure, risk, safeguard/countermeasure
  - Attack, breach, hazard
  - Residual risk, inherent risk, control risk
- Risk formula: risk = threat x vulnerability; risk = probability x impact
- Risk management process (3 steps: Value, Risk Analysis, Treatment)
- Asset valuation
  - Quantitative valuation (monetary)
  - Qualitative valuation (relative ranking: low/medium/high)
  - Tangible and intangible asset considerations
  - Purchase cost, replacement cost, depreciated cost, development cost
- Risk analysis and assessment
  - Qualitative risk analysis (subjective, ranking, no monetary values)
  - Quantitative risk analysis (objective, numerical, monetary values)
  - Combined/hybrid approach
  - Five-step process: identify assets, identify threats, identify vulnerabilities, assess impact/likelihood, prioritize risks
- Quantitative risk formulas
  - SLE = AV x EF
  - ALE = SLE x ARO
  - ROI = (Benefit - Cost) / Cost
  - TCO = Purchase Price + Operating Costs
  - Safeguard value = (ALE before) - (ALE after) - (annual cost of safeguard)
- Risk response/treatment options
  - Risk avoidance (stop the activity, opportunity cost)
  - Risk transfer/sharing (insurance, outsourcing; accountability remains)
  - Risk mitigation/reduction (implement controls, reduce to acceptable level)
  - Risk acceptance (owner accepts; documented decision)
  - Risk ignorance (NOT a valid option)
- Types of controls
  - By function: Directive, Deterrent, Preventive, Detective, Corrective, Recovery, Compensating
  - By category: Administrative, Logical/Technical, Physical
  - Safeguards (proactive, before the fact) vs. Countermeasures (reactive, after the fact)
  - Complete control = preventive + detective + corrective
  - Functional aspect vs. Assurance aspect
- Control selection criteria
  - Alignment to organizational goals
  - Cost-effectiveness
  - Complete control coverage
  - Functional and assurance effectiveness
- Control assessments (security and privacy)
- Continuous monitoring and measurement
  - Metrics that matter, audience-appropriate reporting
  - Internal vs. external reporting
- Continuous improvement
  - Deming Cycle / PDCA (Plan, Do, Check, Act)
  - Risk maturity modeling
- Risk management frameworks (NIST 800-37, ISO 31000, COSO, ISACA Risk IT)
- Risk registers, risk matrices, heat maps
- Risk communication and reporting
- Risk monitoring and review
- Integration of risk management with business processes
- Vendor and third-party risk management
- Cybersecurity insurance
- Risk-aware culture development

### 1.10 Threat Modeling
- Purpose: systematic identification, enumeration, prioritization of threats
- Proactive (defensive) vs. reactive (adversarial/threat hunting) approaches
- Threat identification approaches
  - Asset-focused
  - Attacker-focused
  - Software-focused
- STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege)
  - Maps to: Authentication, Integrity, Nonrepudiation, Confidentiality, Availability, Authorization
- PASTA (Process for Attack Simulation and Threat Analysis) -- 7 stages, risk-centric
  - Define Objectives, Define Technical Scope, Application Decomposition, Threat Analysis, Vulnerability & Weakness Analysis, Attack Modeling, Risk & Impact Analysis
- DREAD (Damage, Reproducibility, Exploitability, Affected Users, Discoverability) -- scoring 1-10 per category
- VAST (Visual, Agile, Simple Threat) -- Agile integration
- Reduction analysis / decomposition
  - Trust boundaries, dataflow paths, input points, privileged operations, security stance
- Diagramming potential attacks
- Prioritization and response

### 1.11 Supply Chain Risk Management (SCRM)
- Supply chain concept and threat vectors
- Risks from acquisitions of hardware, software, services
  - Product tampering
  - Counterfeits
  - Implants (hardware/software)
- Risk mitigations
  - Third-party assessment and monitoring
  - Minimum security requirements
  - Service-level requirements (SLR)
  - Service-level agreements (SLA)
  - Service-level reports
  - Silicon root of trust (hardware root of trust, secure boot)
  - Physically unclonable function (PUF)
  - Software bill of materials (SBOM)
- SOC reports and third-party assurance
- Vendor Management Systems (VMS)

### 1.12 Security Awareness, Education, and Training
- Everyone is responsible for security
- Awareness vs. training vs. education
  - Awareness: cultural sensitivity, organization-wide
  - Training: specific skills, technical focus
  - Education: fundamental concepts, decision-making
- Methods and techniques
  - Live in-person, live online, pre-recorded
  - Gamification
  - Security champions
  - Phishing simulations
  - Regular campaigns/communications
- Social engineering awareness
  - Phishing, spear phishing, whaling, smishing, vishing
  - Pretexting, baiting, tailgating, piggybacking
- Periodic content reviews (emerging tech: AI, blockchain, cryptocurrency)
- Program effectiveness evaluation (KPIs, metrics, completion rates)

---

## 2. KEY DEFINITIONS AND CONCEPTS

### Core Security Concepts

**Confidentiality**: Measures that protect information from unauthorized disclosure. Not limited to intentional attacks; human error and misconfiguration also cause violations. Related sub-concepts include sensitivity (potential for harm if disclosed), discretion (operator-controlled disclosure), and privacy (protection of personal information).

**Integrity**: Protecting the reliability and correctness of data. Three perspectives: (1) preventing unauthorized modification, (2) preventing authorized subjects from making unauthorized changes (mistakes), (3) maintaining internal/external consistency so data reflects reality.

**Availability**: Ensuring authorized subjects have timely, uninterrupted access. Depends on both integrity and confidentiality -- without them, availability cannot be truly maintained.

**Authenticity**: Verification that data is genuine and originates from its claimed source. Related to integrity but focuses on verifying origin. "Proof of origin."

**Nonrepudiation**: Assurance that a subject cannot deny having performed an action. Enabled through digital signatures, transaction logs, session identifiers. Essential for accountability.

### AAA Services (Five Elements)
- **Identification**: Claiming an identity (username, badge swipe, biometric presentation)
- **Authentication**: Proving the claimed identity is valid (password, token, biometric match)
- **Authorization**: Granting or denying access based on authenticated identity's permissions
- **Auditing**: Recording subject activities for accountability and incident detection
- **Accounting**: Reviewing logs for compliance, holding subjects accountable

### Governance Terms

**Security Governance**: Collection of practices that support, define, evaluate, and direct an organization's security efforts. Must be top-down, board-level involvement.

**Accountability**: Where the buck stops. Ultimate ownership and liability. Cannot be delegated. Only one entity can be accountable.

**Responsibility**: The doer. Can be delegated. Multiple people can be responsible for tasks.

**Due Care**: The responsible, ongoing protection of assets aligned with organizational goals. The "do correct" action -- doing the right thing at the right time.

**Due Diligence**: The ability to prove due care through planning, documentation, and oversight. The "do detect" mechanism -- establishing plans, verifying they work, creating records of proper actions. Adjusting prior plans when conditions change.

**Negligence**: Failure to exercise due care and due diligence. Creates legal liability.

### Risk Terms

**Risk**: The possibility that a threat will exploit a vulnerability to cause harm to an asset. Conceptually: risk = threat x vulnerability, or risk = probability of harm x severity of harm.

**Threat**: Any potential occurrence that may cause an undesirable outcome. Can be intentional or accidental, internal or external, natural or human-made.

**Threat Agent/Actor**: Entity (person, program, system) that intentionally exploits vulnerabilities.

**Vulnerability**: A weakness, flaw, or absence of a safeguard that could be exploited.

**Exposure**: Being susceptible to asset loss because a vulnerability exists that a threat could exploit. Does not mean a loss has occurred -- just that potential for harm exists.

**Exposure Factor (EF)**: Percentage of asset value lost if a specific threat materializes. Always between 0% and 100%.

**Residual Risk**: Risk remaining after controls are implemented. Must be formally accepted by asset owner or senior management.

**Inherent Risk**: The level of risk present before any controls are applied.

**Control Risk**: Risk introduced by the control itself or risk that the control fails to address the identified risk.

**Safeguard/Countermeasure**: Anything that removes or reduces a vulnerability or protects against threats. Can be a new product, reconfiguration, or removal of an element.

---

## 3. CALCULATIONS AND FORMULAS

### Core Quantitative Risk Analysis Formulas

| Formula | Description |
|---------|-------------|
| **SLE = AV x EF** | Single Loss Expectancy = Asset Value x Exposure Factor |
| **ALE = SLE x ARO** | Annualized Loss Expectancy = SLE x Annualized Rate of Occurrence |
| **Safeguard Value = ALE(before) - ALE(after) - Annual Cost of Safeguard** | Determines if a control is cost-justified |
| **ROI = (Benefit - Cost) / Cost** | Return on investment for a security control |
| **TCO = Purchase Price + Operating Costs** | Total Cost of Ownership over asset lifecycle |

### Worked Example 1: Server Risk

A web server is valued at **$50,000 (AV)**. A fire could destroy **40% of its value (EF = 0.40)**. Fire is expected to occur **once every 10 years**.

- **SLE** = $50,000 x 0.40 = **$20,000**
- **ARO** = 1/10 = **0.1**
- **ALE** = $20,000 x 0.1 = **$2,000 per year**

If a fire suppression system costs **$500/year** and would reduce the EF to **5%**:
- New SLE = $50,000 x 0.05 = $2,500
- New ALE = $2,500 x 0.1 = $250
- **Safeguard Value** = $2,000 - $250 - $500 = **$1,250** (positive = cost-justified)

### Worked Example 2: CCTV System (from Destination CISSP)

A CCTV system costs **$2,000 (AV)**. Voltage spikes damage 3 cameras worth **$200 (10% loss, EF = 0.10)**. Spikes occur **3 times per year (ARO = 3)**.

- **SLE** = $2,000 x 0.10 = **$200**
- **ALE** = $200 x 3 = **$600 per year**

### Worked Example 3: Tornado Scenario (from Practice Tests)

Data center replacement cost = **$10 million (AV)**. Tornado causes **$5 million damage (EF = 50%)**. Tornado expected **once every 200 years (ARO = 1/200 = 0.005)**.

- **SLE** = $10,000,000 x 0.50 = **$5,000,000**
- **ARO** = 1/200 = **0.005**
- **ALE** = $5,000,000 x 0.005 = **$25,000 per year**

### ARO Calculation Nuance

ARO is a probability metric expressed as frequency per year:
- Once per year = ARO of **1**
- Once every 10 years = ARO of **0.1**
- Twice every 30 years = ARO of **2/30 = 0.0667**
- Five times per year = ARO of **5**
- 100-year flood plain = ARO of **0.01**

### Cost-Benefit Decision Rule

A control is cost-justified when: **ALE(before) - ALE(after) > Annual Cost of Safeguard**

If the cost of a control exceeds the ALE of the risk, the best business decision is usually to accept the risk.

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Ethics Traps
- The ISC2 Code of Ethics Canons are in **priority order**. When two canons conflict, the higher-numbered one gives way. Protecting society (Canon 1) always trumps protecting the profession (Canon 4).
- Anyone may bring ethics charges against a CISSP holder -- not just employers or affected parties.
- Sharing exam content violates Canon 4 (advance and protect the profession).

### Governance Traps
- **Bottom-up security never works** on the exam. Always choose top-down approaches driven by senior management.
- Accountability **can never be delegated**. Even if a cloud provider stores your data, the data owner remains accountable.
- The CISSP exam expects you to think like a **risk advisor or manager**, not a technician. Never choose a purely technical answer when a management/governance answer is available.
- Senior management is ultimately responsible for security, not the IT department. Security is a **business operations issue**.

### Risk Analysis Traps
- This is **not a math exam**. Formulas test conceptual understanding, not complex calculations. A calculator is provided on-screen.
- **Qualitative** analysis uses words/rankings (low/medium/high), not dollar figures. **Quantitative** assigns monetary values.
- Purely quantitative analysis is extremely difficult to achieve in practice and very time-consuming. Most organizations use a **hybrid approach**.
- **Risk can never be fully eliminated**. Even after mitigation, residual risk always remains.
- **Risk ignorance is NOT a valid treatment option**. Ignoring a known risk violates due care/due diligence.
- The person who should **accept risk** is always the **asset owner or senior management** -- never the security team alone.

### Legal/Regulatory Traps
- PCI DSS is **not a law** -- it is an **industry standard**. But violations can result in fines and loss of card processing privileges.
- GDPR requires breach notification to the supervisory authority within **72 hours** (not 24, not 48).
- COPPA protects children under age **13** specifically.
- FISMA applies to **federal government** agencies and contractors, not private businesses generally.
- Trade secrets have **potentially infinite** protection but require **no disclosure** -- once disclosed, protection is lost.
- Patents require **disclosure** and provide protection for a **set period** (~20 years).

### Control Type Traps
- A fence is **both** preventive (stops people) **and** deterrent (discourages attempts). Questions may ask you to select multiple categories.
- Detective, recovery, and corrective controls operate **after** an incident. Deterrent, directive, preventive, and compensating operate **before**.
- A **complete control** combines preventive, detective, and corrective at minimum.
- Logical and technical are often used synonymously, but technically: logical = software component, technical = hardware component.

### BCP Traps
- BCP focuses on **maintaining business operations** during a disruption. DRP focuses on **recovering IT systems** after a disaster.
- The BIA identifies **critical business functions** and their dependencies -- it does not implement recovery solutions.
- Senior management's primary BCP role is **arbitrating disputes about criticality** and providing resource allocation authority.
- A **cold site** has HVAC, power, and connectivity but **no hardware**. A hot site is fully equipped and can take over quickly.

### Personnel Security Traps
- **Mandatory vacations** detect fraud (another employee reviews the absent worker's tasks). They are detective/corrective controls.
- **Separation of duties** prevents fraud by requiring multiple people for critical tasks. It is a preventive control.
- **Job rotation** serves dual purposes: fraud detection and cross-training/personnel redundancy.
- Involuntary termination carries much higher security risk than voluntary termination. Requires immediate access revocation.

---

## 5. COMPARISONS AND DISTINCTIONS

### Due Care vs. Due Diligence

| Due Care | Due Diligence |
|----------|---------------|
| Doing the right thing at the right time | Planning, verifying, and documenting that the right things are done |
| "Do correct" | "Do detect" |
| Practicing security activities | Establishing and proving security plans exist |
| Continued application of security structure | Oversight and confirmation of proper actions |
| Example: Performing a penetration test and remediating findings | Example: Documenting that vulnerabilities were addressed and reporting to stakeholders |

### Qualitative vs. Quantitative Risk Analysis

| Qualitative | Quantitative |
|-------------|-------------- |
| Does not assign monetary values | Assigns objective monetary values |
| Uses relative rankings (low/medium/high, 1-5) | Uses formulas (SLE, ALE, ARO, EF) |
| Based on professional judgment and expert opinion | Based on numerical data and calculations |
| Simpler and faster to conduct | Extremely difficult to achieve purely; time-consuming |
| Good starting point; easier to communicate | Preferred when data is available; more precise |
| Most organizations use this or a hybrid | Fully quantitative is rare in practice |

### Policy vs. Standard vs. Procedure vs. Guideline vs. Baseline

| Document | Nature | Mandatory? | Level of Detail | Example |
|----------|--------|-----------|-----------------|---------|
| **Policy** | High-level goals and objectives (corporate laws) | Yes | Low -- broad direction | "All company data must be encrypted" |
| **Standard** | Specific hardware/software/technology requirements | Yes | Medium -- specific solutions | "Use AES-256 encryption; deploy Cisco ASA firewalls" |
| **Baseline** | Minimum security configuration level | Yes | Medium -- configuration-specific | "All servers must have CIS Level 1 hardened configuration" |
| **Procedure** | Step-by-step instructions for tasks | Yes | High -- detailed how-to | "Steps to configure firewall rule for new service" |
| **Guideline** | Recommendations and suggestions | No | Varies -- advisory | "Consider using heuristic scanning in anti-malware" |

### Accountability vs. Responsibility

| Accountability | Responsibility |
|---------------|----------------|
| Where the buck stops | The doer |
| Ultimate ownership and liability | In charge of a task or process |
| Only ONE entity can be accountable | Multiple people can be responsible |
| Sets rules and policies | Develops plans and implements controls |
| Can NEVER be delegated | CAN be delegated |
| Always remains with asset owner/senior management | Flows down through the organization |

### Risk Treatment Options Compared

| Option | Action | When to Use | Key Consideration |
|--------|--------|-------------|-------------------|
| **Avoid** | Stop the activity causing risk | When risk outweighs benefits | Results in opportunity cost |
| **Transfer** | Share risk with third party (insurance) | When financial sharing makes sense | Accountability NEVER transfers |
| **Mitigate** | Implement controls to reduce risk | Most common approach | Goal: reduce to acceptable level |
| **Accept** | Acknowledge and tolerate the risk | When control cost exceeds risk value | Must be documented; owner decides |

### BCP vs. DRP

| BCP | DRP |
|-----|-----|
| Maintains critical business processes during disruption | Recovers IT systems after disaster |
| Broader scope -- entire business | Narrower scope -- technology focus |
| Proactive planning for continuity | Reactive recovery procedures |
| Includes communication plans, alternate work sites | Includes system restoration, data recovery |
| Led by business leadership | Led by IT/operations |

### Safeguards vs. Countermeasures

| Safeguards | Countermeasures |
|------------|-----------------|
| Proactive controls | Reactive controls |
| Deployed before a risk occurs | Deployed after a risk occurs |
| Prevent or deter threats | Detect and respond to threats |
| Directive, deterrent, preventive, compensating | Detective, corrective, recovery |

### STRIDE vs. PASTA vs. DREAD

| Model | Purpose | Approach | Depth |
|-------|---------|----------|-------|
| **STRIDE** | Categorize/identify threats | Threat-focused | Less strategic; good for applications |
| **PASTA** | Full threat modeling (7 stages) | Risk-centric, attacker-focused | Very thorough; strategic; takes longer |
| **DREAD** | Score/rank threat severity | Rating system (1-10 per factor) | Used to prioritize threats found by STRIDE |

---

## 6. LEGAL AND REGULATORY

### Major US Laws

| Law | Focus | Key Points |
|-----|-------|------------|
| **HIPAA** | Healthcare data privacy/security | Applies to covered entities (providers, plans, clearinghouses) and business associates; criminal penalties possible |
| **GLBA** (Gramm-Leach-Bliley) | Financial institution customer data | Requires annual privacy notices; financial institutions must explain data sharing practices |
| **SOX** (Sarbanes-Oxley) | Corporate financial transparency | IT governance implications; internal controls for financial reporting; criminal penalties possible |
| **FERPA** | Student education records | Protects privacy of student records at federally funded institutions |
| **COPPA** | Online privacy of children under 13 | Parental consent required before collecting personal info from children under 13 |
| **CCPA/CPRA** | California consumer privacy rights | Similar to GDPR; right to know, delete, opt-out of sale; applies to businesses handling CA resident data |
| **FISMA** | Federal government information security | Applies to federal agencies and contractors; mandates risk-based security programs |
| **CFAA** (Computer Fraud and Abuse Act) | Computer crime | Prohibits unauthorized access to protected computers; federal criminal law |
| **ECPA** (Electronic Communications Privacy Act) | Electronic communications privacy | Governs wiretapping and electronic surveillance |
| **CALEA** | Law enforcement cooperation | Requires telecom providers to cooperate with lawful wiretap requests |
| **DMCA** (Digital Millennium Copyright Act) | Copyright protection | Criminalizes circumvention of technological copyright protections |
| **Economic Espionage Act** | Trade secret theft | Federal criminal law for theft of trade secrets |

### International Laws

| Law/Framework | Jurisdiction | Key Points |
|---------------|-------------|------------|
| **GDPR** | European Union | Single set of rules for all EU states; 7 principles for lawful processing; 72-hour breach notification; right to erasure; supervisory authorities; data minimization; purpose limitation |
| **PIPEDA** | Canada | Governs private sector collection/use/disclosure of personal information |
| **POPIA** | South Africa | Protection of Personal Information Act |
| **PIPL** | China | Personal Information Protection Law |
| **PIPA** | South Korea | Personal Information Protection Act |
| **Privacy Act / APPs** | Australia | Australian Privacy Principles |
| **PDPL** | Argentina | Personal Data Protection Law |

### Industry Standards

| Standard | Focus | Key Points |
|----------|-------|------------|
| **PCI DSS** | Payment card security | Not a law but contractually enforced; applies to all entities handling branded credit cards; QSA audits; fines for non-compliance |

### GDPR Core Principles (7)
1. Lawfulness, fairness, and transparency
2. Purpose limitation
3. Data minimization
4. Accuracy
5. Storage limitation
6. Integrity and confidentiality (security)
7. Accountability

### OECD Privacy Guidelines (8 Principles)
1. **Collection Limitation**: Limit collection to what is needed; obtain lawfully with consent
2. **Data Quality**: Keep data relevant, accurate, complete, up-to-date
3. **Purpose Specification**: Specify purposes at time of collection
4. **Use Limitation**: Use only for specified purposes or with consent/legal authority
5. **Security Safeguards**: Protect with reasonable safeguards against loss, unauthorized access
6. **Openness**: Be transparent about practices and policies regarding personal data
7. **Individual Participation**: Data subjects have right to access and request removal of their data
8. **Accountability**: Data controller is accountable for complying with all other principles

### Intellectual Property Summary

| Type | Protects | Disclosure Required? | Duration | Protects Against |
|------|----------|---------------------|----------|------------------|
| **Trade Secret** | Business information | No | Potentially infinite | Misappropriation |
| **Patent** | Functional innovations | Yes | Set period (~20 years) | Making, using, selling |
| **Copyright** | Expression in fixed medium | Yes | Set period (life + 70 years typical) | Copying/substantially similar work |
| **Trademark** | Symbols, colors, sounds | Yes | Potentially infinite (with renewal) | Creating confusion |

---

## 7. FRAMEWORKS AND METHODOLOGIES

### NIST SP 800-37 Risk Management Framework (RMF) -- 7 Steps

1. **Prepare**: Prepare the organization to manage security and privacy risks
2. **Categorize**: Determine adverse impact to operations/assets from loss of CIA
3. **Select**: Choose, tailor, and document security controls commensurate with risk
4. **Implement**: Deploy selected controls and document baseline configuration details
5. **Assess**: Verify controls are implemented correctly, operating as intended, producing desired outcomes
6. **Authorize**: Senior management determines if security/privacy risk is acceptable (grants ATO)
7. **Monitor**: Maintain ongoing situational awareness; continuous monitoring and improvement

### ISO Standards Family

- **ISO 27001**: Requirements for establishing an Information Security Management System (ISMS)
- **ISO 27002**: Guidelines for implementing security controls (code of practice)
- **ISO 27005**: Information security risk management guidelines
- **ISO 31000**: Family of standards for general risk management
- **ISO/IEC 29134**: Privacy impact assessment guidelines

### COBIT (6 Key Principles)
1. Provide Stakeholder Value
2. Holistic Approach
3. Dynamic Governance System
4. Governance Distinct from Management
5. Tailored to Enterprise Needs
6. End-to-End Governance System

### SABSA
- Risk-driven enterprise security architecture
- Business-focused approach
- Layered architectural model (business context, information, systems, technology, physical)
- Structured framework + methodology

### FAIR (Factor Analysis of Information Risk)
- Quantitative approach to risk management
- Measures and prioritizes risks using financial terms
- Enables apples-to-apples comparison of different risks

### COSO ERM
- Enterprise risk management framework
- Includes risk governance and culture, strategy and objective setting, performance, review and revision, information/communication/reporting

### ITIL
- IT service management best practices
- Focuses on aligning IT with business objectives
- British origin; widely adopted globally

### Threat Modeling Methodologies

**STRIDE** (Microsoft):
- **S**poofing --> violates Authentication
- **T**ampering --> violates Integrity
- **R**epudiation --> violates Nonrepudiation
- **I**nformation Disclosure --> violates Confidentiality
- **D**enial of Service --> violates Availability
- **E**levation of Privilege --> violates Authorization

**PASTA** (7 Stages):
1. Define Objectives
2. Define Technical Scope
3. Application Decomposition
4. Threat Analysis
5. Vulnerability & Weakness Analysis
6. Attack Modeling & Simulation
7. Risk & Impact Analysis

**DREAD** (Scoring 1-10 each, total divided by 5):
- **D**amage: How severe?
- **R**eproducibility: How easily replicated?
- **E**xploitability: How hard to perform?
- **A**ffected Users: How many impacted?
- **D**iscoverability: How easy to find?

Score ranges: 5-7 = Medium Risk, 8-10 = High Risk, 12-15 = Critical Risk

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Risk Management Lifecycle

```
1. Asset Identification & Valuation
   --> Rank assets from most to least valuable
   --> Use quantitative and/or qualitative methods

2. Risk Analysis
   --> Identify threats for each asset
   --> Identify vulnerabilities for each asset
   --> Determine impact and probability
   --> Calculate SLE/ALE (quantitative) or assign ratings (qualitative)
   --> Rank risks by severity

3. Risk Treatment
   --> Select treatment: Avoid, Transfer, Mitigate, Accept
   --> Implement selected controls
   --> Document decisions

4. Risk Monitoring & Review
   --> Track treatment effectiveness
   --> Review assessments periodically
   --> Analyze incident reports
   --> Evaluate overall risk management program

5. Continuous Improvement (repeat)
```

### BCP/BCM Lifecycle

```
1. Project Scope and Planning
   --> Create BCP team
   --> Structured analysis of organization
   --> Review legal/regulatory landscape
   --> Obtain senior management approval

2. Business Impact Analysis (BIA)
   --> Identify critical business functions
   --> Assess potential impacts of disruptions
   --> Determine recovery priorities (MTD, RTO, RPO, WRT)
   --> Map external dependencies

3. Recovery Strategy Development
   --> Alternative work locations
   --> Backup systems and data
   --> Communication plans

4. Plan Development and Documentation
   --> Statement of importance
   --> Statement of priorities
   --> Statement of organizational responsibility

5. Testing and Exercises
   --> Tabletop exercises
   --> Walk-through tests
   --> Functional tests
   --> Full-interruption tests

6. Maintenance and Review
   --> Regular plan reviews and updates
   --> Integration with change management
```

### Security Awareness Training Lifecycle

```
1. Identify training needs (aligned with risk register)
2. Design content (awareness, training, education)
3. Select delivery methods (live, online, gamification, champions)
4. Deploy training across organization
5. Evaluate effectiveness (KPIs, phishing tests, quiz scores)
6. Review and update content (periodic reviews for emerging threats)
7. Repeat
```

### Deming Cycle / PDCA (Continuous Improvement)

```
Plan --> Do --> Check --> Act --> (repeat)

Plan: Determine which controls to implement based on identified risks
Do: Implement the controls
Check: Monitor and verify controls are effective (assurance)
Act: Take corrective actions based on findings; feed back into planning
```

### NIST RMF Process Flow

```
Prepare --> Categorize --> Select --> Implement --> Assess --> Authorize --> Monitor
                                                                              |
                                                                              v
                                                                        (back to Prepare
                                                                         for continuous
                                                                         improvement)
```

---

## 9. THINK LIKE A MANAGER

### Core CISSP Mindset Principles

1. **Always conduct a risk assessment first**. When faced with an unknown situation, the default answer is usually to assess the risk before taking action.

2. **Think business impact, not technical details**. The CISSP exam tests manager-level thinking. Ask: "What is the impact on the business?" not "What technical tool do I deploy?"

3. **Security supports the business**. Security exists to enable organizations to achieve their goals and objectives. It should add value, not be an obstacle.

4. **Senior management is ultimately accountable**. Every security decision traces back to executive accountability. If a question asks who is responsible, pick the highest appropriate authority.

5. **Cost-benefit analysis drives decisions**. Never implement a $100,000 control for a $1,000 risk. Controls must be cost-justified.

6. **Risk can never be eliminated -- only reduced to an acceptable level**. The goal is not zero risk; the goal is acceptable residual risk that has been formally accepted by the asset owner.

7. **Compliance is not optional**. Laws and regulations create mandatory requirements. When asked about a compliance question, the answer involves meeting those requirements.

8. **When in doubt, report to law enforcement** (for criminal matters) or **escalate to senior management** (for policy decisions).

9. **The CISSP is not a technical exam**. Do not select answers that focus on specific tools or configurations when a governance/management answer is available.

10. **Protect people first**. In questions involving safety of life, always prioritize human safety above all other concerns (aligns with ISC2 Canon 1).

### Communicating to Executives

- Use business language, not technical jargon
- Present risk in financial terms (ALE, business impact)
- Focus on what the organization stands to lose, not on threat details
- Provide clear recommendations with cost-benefit rationale
- Frame security as an investment that protects organizational value

### Balancing Security with Business

- Security controls should enable, not hinder, business operations
- Overprotecting confidentiality can restrict availability
- Overprotecting integrity can restrict availability
- Overproviding availability can compromise confidentiality and integrity
- The right balance depends on the nature of the organization (financial firm prioritizes confidentiality/integrity; e-commerce prioritizes availability)

### Prioritization Framework

When multiple risks exist:
1. Assess the impact and likelihood of each risk
2. Prioritize by highest combined risk value
3. Address the most critical risks first
4. Ensure complete controls (preventive + detective + corrective)
5. Document all decisions and rationale

---

## 10. EXAM STRATEGY

### How Domain 1 Is Tested

- D1 is the **largest domain at 15%** of the exam. Expect significant coverage.
- Questions are scenario-based, testing application of concepts rather than memorization.
- Emphasis on **governance, risk management, ethics, and legal/regulatory** knowledge.
- Calculations may appear but will be simple; understand the concepts behind the formulas.

### Question Patterns

1. **"What should you do FIRST?"** -- Usually: conduct a risk assessment, consult management, or review policies.
2. **"Who is ULTIMATELY accountable?"** -- Senior management, CEO, or Board. Not the IT team.
3. **"BEST" or "MOST important"** -- Look for the governance/management answer over technical solutions.
4. **"Which is NOT..."** -- Read all options carefully. The odd one out is usually a concept from a different domain or a fabricated term.
5. **Ethical dilemma scenarios** -- Apply ISC2 Canons in order. Canon 1 (protect society) always wins.
6. **Legal jurisdiction questions** -- Match the law to its correct scope (healthcare = HIPAA, financial = GLBA, education = FERPA, children = COPPA, government = FISMA, EU privacy = GDPR).

### Wrong-Answer Traps

- **Technical-first answers**: "Install a firewall" or "Run a vulnerability scan" are rarely the BEST answer in D1 when governance options exist.
- **"Eliminate all risk"**: This is never correct. Risk cannot be fully eliminated.
- **"The IT department is responsible"**: Security is a business function, not an IT function.
- **Paying ransoms**: The CISSP perspective is that paying ransoms encourages criminal activity. Report to law enforcement instead.
- **Ignoring risk**: Ignoring a known risk is never a valid treatment option.
- **Bottom-up approaches**: These are always wrong in CISSP context. Security must be top-down.

### What "BEST" and "MOST" Mean

- "BEST" = the answer most aligned with CISSP principles and security governance best practices
- "MOST important" = the answer that addresses the highest priority (usually people safety, then business continuity, then compliance)
- "MOST effective" = the answer that provides the greatest risk reduction relative to cost
- "FIRST" = the foundational step that everything else depends on (risk assessment, management approval, understanding the environment)

---

## 11. CROSS-DOMAIN CONNECTIONS

### D1 --> D2 (Asset Security)
- Asset classification and data roles (owner, custodian, processor) originate in D1 governance but are applied in D2
- Privacy requirements from D1 legal section directly drive D2 data protection controls

### D1 --> D3 (Security Architecture and Engineering)
- Security models (Bell-LaPadula, Biba) implement D1's CIA principles
- Threat modeling (STRIDE/PASTA) from D1 is applied during D3's secure design process
- Defense in depth principle from D1 guides D3 architecture decisions

### D1 --> D4 (Communication and Network Security)
- D1's transborder data flow requirements affect D4 network design decisions
- Import/export controls on cryptography from D1 influence D4 encryption implementations

### D1 --> D5 (Identity and Access Management)
- D1's least privilege and need-to-know principles are implemented through D5 access controls
- AAA services from D1 are architecturally realized in D5

### D1 --> D6 (Security Assessment and Testing)
- D1's risk assessment drives D6's vulnerability assessment and penetration testing scope
- D1's continuous monitoring requirements are fulfilled by D6's assessment processes
- SOC reports and third-party assurance from D1 are conducted via D6 audit mechanisms

### D1 --> D7 (Security Operations)
- D1's BCP requirements are implemented in D7's disaster recovery operations
- Investigation types from D1 (administrative, criminal, civil) are conducted in D7
- D1's incident response planning is operationalized in D7
- Personnel security controls (job rotation, mandatory vacations) from D1 are enforced in D7

### D1 --> D8 (Software Development Security)
- D1's threat modeling methodologies apply to secure software development
- D1's change management principles guide D8's SDLC processes
- Supply chain risk management from D1 applies to software dependencies (SBOM)

---

## 12. REAL-WORLD APPLICATION

### Breach Scenario: Financial Data Exfiltration

An employee with excessive privileges (violation of least privilege) copies customer financial data to a USB drive and sells it to competitors. This scenario illustrates:
- **Separation of duties failure**: One person had access to both customer data and physical media
- **Mandatory vacation gap**: Fraud could have been detected if a peer reviewed the employee's activities
- **Accountability**: Senior management is accountable for failing to implement proper controls
- **Legal consequences**: Potential GLBA violations, civil liability, criminal charges under trade secret laws

### Breach Scenario: Third-Party Vendor Compromise

A cloud service provider suffers a data breach exposing client personal data. Even though the CSP was responsible for security, the data owner (the hiring organization) remains **accountable** and faces GDPR fines of up to 4% of global revenue. This illustrates:
- Accountability cannot be outsourced
- SLA and SLR must define security requirements explicitly
- Third-party risk assessment should be ongoing
- SOC 2 Type 2 reports provide assurance but do not eliminate risk

### Breach Scenario: Ransomware Attack

An organization's critical systems are encrypted by ransomware. CISSP thinking says:
- Do NOT pay the ransom (encourages criminal activity)
- Report to law enforcement (Canon 1: protect society)
- Activate incident response plan
- Recover from backups (if BCP/DRP properly implemented)
- Conduct post-incident review and update risk assessments

### Practical Application: Security Governance Committee

A large enterprise establishes a governance committee with representatives from Legal, HR, IT, Finance, and Security. The committee:
- Sets the organizational security policy
- Aligns security objectives with business goals
- Reviews risk assessments quarterly
- Ensures compliance with applicable laws and regulations
- Reports to the Board of Directors

This is the model CISSP expects: top-down, cross-functional, business-aligned security governance.

---

## 13. MEMORY AIDS AND MNEMONICS

### ISC2 Code of Ethics Canons (in order)
**"Please Act Professionally Always"**
1. **P**rotect society, the common good, trust, and infrastructure
2. **A**ct honorably, honestly, justly, responsibly, legally
3. **P**rovide diligent and competent service to principals
4. **A**dvance and protect the profession

### CIA Triad
**"CIA keeps secrets correct and ready"**
- **C**onfidentiality = secrets (prevent disclosure)
- **I**ntegrity = correct (prevent unauthorized changes)
- **A**vailability = ready (ensure access when needed)

### DAD Triad (opposite of CIA)
**"DAD breaks security"**
- **D**isclosure (violates Confidentiality)
- **A**lteration (violates Integrity)
- **D**estruction (violates Availability)

### Risk Treatment Options
**"ATMA" -- like an ATM, managing your risk currency**
- **A**void
- **T**ransfer
- **M**itigate
- **A**ccept

### Quantitative Risk Formulas
**"Sally Ate Apples" (SLE, ALE, ARO)**
- **S**LE = **A**V x EF (Sally times her value by exposure)
- **A**LE = SLE x **A**RO (Annual loss = single loss times annual frequency)

### STRIDE Threat Model
**"Some Threats Really Involve Denying Everyone"**
- **S**poofing
- **T**ampering
- **R**epudiation
- **I**nformation Disclosure
- **D**enial of Service
- **E**levation of Privilege

### STRIDE to CIA+Auth Mapping
- **S** --> Authentication
- **T** --> Integrity
- **R** --> Nonrepudiation
- **I** --> Confidentiality
- **D** --> Availability
- **E** --> Authorization

### DREAD Scoring
**"Damage? Reproducible? Easy? Affected? Discoverable?"** -- Score each 1-10, total / 5 = severity

### PASTA Stages
**"Define, Define, Decompose, Threat, Vulnerability, Attack, Risk"** -- 7 stages going from business to technical

### Security Document Hierarchy
**"People Should Prefer Better Guidelines"**
- **P**olicies (top -- corporate laws)
- **S**tandards (specific solutions, mandatory)
- **P**rocedures (step-by-step, mandatory)
- **B**aselines (minimum configurations, mandatory)
- **G**uidelines (recommendations, NOT mandatory)

### NIST RMF 7 Steps
**"People Can Select, Implement, Assess, Authorize, Monitor"**
1. **P**repare
2. **C**ategorize
3. **S**elect
4. **I**mplement
5. **A**ssess
6. **A**uthorize
7. **M**onitor

### Accountability vs. Responsibility
**"Accountability is Always Above; Responsibility Runs Downhill"**
- Accountability stays at the top and cannot be delegated
- Responsibility can be delegated and flows downward

### Due Care vs. Due Diligence
**"Care = Correct (doing); Diligence = Detect (proving)"**
- Due care = doing the right thing
- Due diligence = proving you did the right thing

---

## 14. PRACTICE QUESTION PATTERNS

### Most Frequently Tested Concepts

1. **CIA Triad identification**: Scenarios describing a security event, asking which principle was violated (availability attacks = DoS; confidentiality attacks = data disclosure/keyloggers; integrity attacks = unauthorized modification)

2. **Risk treatment identification**: Scenarios describing organizational responses to risk, asking which treatment option is being used (purchasing insurance = transfer; stopping an activity = avoidance; deploying a control = mitigation; documenting acceptance = acceptance)

3. **Quantitative calculations**: Given AV, EF, and ARO, calculate SLE and ALE. Given a 100-year flood plain, determine ARO (0.01). Determining whether a safeguard is cost-justified.

4. **Legal/regulatory matching**: Matching laws to jurisdictions and industries (HIPAA = healthcare; GLBA = financial; FERPA = education; COPPA = children under 13; FISMA = federal government; GDPR = EU personal data)

5. **Intellectual property classification**: Identifying whether a scenario describes a patent, copyright, trademark, or trade secret based on what is being protected and how

6. **Security roles and accountability**: Who is ultimately accountable? (Senior management/CEO/Board). Who is responsible for implementing controls? (Security professionals/custodians). Can accountability be delegated? (Never).

7. **Ethics canon application**: When two ethical obligations conflict, which canon takes priority? (Always in order: Canon 1 > 2 > 3 > 4)

8. **Security documentation classification**: Given a description, identify whether it is a policy, standard, procedure, baseline, or guideline

9. **Threat modeling identification**: Identifying STRIDE categories from attack scenarios (elevation of privilege = user gains admin access; information disclosure = sensitive data exposed; repudiation = user denies action)

10. **Control type classification**: Categorizing controls as preventive, detective, corrective, compensating, directive, deterrent, or recovery; and as administrative, technical/logical, or physical

### Common Distractor Patterns

- **Fabricated terms**: "Risk expansion," "emotional controls," "risk in product design" -- these are invented to test whether you know the real terminology
- **Swapped definitions**: Switching the definitions of due care and due diligence, or accountability and responsibility
- **Incomplete options**: An answer that is partially correct but missing the key element (e.g., "implement controls" without "assess risk first")
- **Technically correct but not BEST**: An answer that would work in practice but does not align with CISSP management-level thinking
- **Overly specific technical solutions**: Naming a specific product or technology when the question calls for a conceptual/governance answer

---

## 15. GAPS TO ADD

The current story mode covers: CIA Triad, Risk Assessment, NIST RMF, Quantitative Risk Analysis (SLE/ARO/ALE), Qualitative Risk Analysis, Security Governance hierarchy, Risk Treatment options, BCP vs DRP, ISC2 Code of Ethics, Compliance vs Security, Due Diligence/Due Care.

### Topics NOT Currently in Story Mode (Priority Additions)

**HIGH PRIORITY (Heavily tested, foundational)**
1. **Intellectual Property Laws** -- Trade secrets, patents, copyrights, trademarks with their distinguishing characteristics (disclosure required, duration, protection scope)
2. **Security Document Hierarchy** -- Policies vs. standards vs. procedures vs. baselines vs. guidelines with clear examples and mandatory/non-mandatory distinction
3. **Accountability vs. Responsibility** -- This critical distinction is tested frequently and needs its own lesson
4. **Threat Modeling (STRIDE, PASTA, DREAD)** -- Each methodology's purpose, when to use it, and how it maps to security principles
5. **Personnel Security Controls** -- Job rotation, mandatory vacations, separation of duties, onboarding/offboarding procedures
6. **Types of Controls** -- Directive, deterrent, preventive, detective, corrective, recovery, compensating; administrative vs. logical/technical vs. physical; complete control concept

**MEDIUM PRIORITY (Tested regularly)**
7. **Privacy Laws and Regulations** -- GDPR (7 principles, 72-hour breach notification), HIPAA, GLBA, FERPA, COPPA, CCPA with jurisdiction mapping
8. **OECD Privacy Guidelines** -- The 8 principles with practical application
9. **Privacy Impact Assessment (PIA/DPIA)** -- Purpose, steps, when required
10. **Supply Chain Risk Management** -- Product tampering, counterfeits, implants, silicon root of trust, PUF, SBOM, SLR/SLA/service-level reports
11. **AAA Services** -- The five elements (identification through accounting) with practical scenarios
12. **Security Awareness Training** -- Awareness vs. training vs. education; methods; effectiveness evaluation; social engineering awareness
13. **Organizational Roles** -- Senior manager, security professional, asset owner, custodian, user, auditor with their specific responsibilities
14. **DAD Triad** -- The opposite of CIA as failure modes

**LOWER PRIORITY (Supporting knowledge)**
15. **Investigation Types** -- Administrative, criminal, civil, regulatory and their burden-of-proof standards
16. **Import/Export Controls** -- Wassenaar Arrangement, ITAR, EAR
17. **Transborder Data Flow** -- Data residency/localization laws
18. **Security Control Frameworks Deep Dive** -- ISO 27001/27002, COBIT, SABSA, ITIL, FedRAMP, COSO ERM beyond what NIST RMF already covers
19. **Third-Party Governance** -- Document review, on-site assessment, ATO process
20. **Risk Registers, Risk Matrices, Heat Maps** -- Visual tools for risk management
21. **Continuous Improvement / Deming Cycle (PDCA)** -- Plan, Do, Check, Act cycle
22. **Business Case Development** -- Justifying security investments to executives
23. **Scoping and Tailoring** -- Aligning controls with organizational goals
24. **Cost-Benefit Analysis / Safeguard Value Calculation** -- When is a control worth implementing?
25. **Mergers and Acquisitions Security** -- Increased risk during organizational change
26. **Vendor Management Systems (VMS)** -- Managing third-party relationships
27. **Social Engineering Attacks** -- Phishing, spear phishing, whaling, smishing, vishing, pretexting, baiting, tailgating/piggybacking
28. **Employee Duress** -- Keywords and protocols for duress situations
29. **Non-compete Agreements (NCA)** and **Nondisclosure Agreements (NDA)** types
30. **Risk Communication and Reporting** -- Clarity, timeliness, relevance, transparency, consistency
