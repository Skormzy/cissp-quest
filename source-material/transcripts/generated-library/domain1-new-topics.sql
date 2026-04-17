-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 1 (Security and Risk Management)
-- Topics: 1.7.1 through 1.12.1
-- Source basis: ISC2 CBK, NIST SP 800-53, NIST SP 800-16, NIST SP 800-50,
--               NIST SP 800-161, EAR (15 CFR 730-774), ITAR (22 CFR 120-130),
--               Wassenaar Arrangement, and public-domain cybersecurity knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1.7.1 Security Controls Classification
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.7.1',
  'Security Controls Classification',
  'Security controls are classified by their implementation category (administrative/technical/physical) and their functional type (preventive/detective/corrective/deterrent/directive/compensating/recovery).',
  '## Security Controls Classification

Security controls are the safeguards and countermeasures that organizations implement to reduce risk to an acceptable level. Understanding how to classify controls is a foundational CISSP skill because the exam will hand you a scenario and ask whether a control is administrative, technical, or physical — and whether it prevents, detects, or corrects. You need to be able to answer both questions simultaneously.

### The Three Implementation Categories

**Administrative controls** (also called managerial or procedural controls) are policy-driven and enforced through human behavior, organizational policy, and documented procedures. They establish the rules and expectations that technical and physical controls then enforce. Examples include security policies, background check procedures, security awareness training programs, employee separation of duties requirements, and job rotation policies. Per NIST SP 800-53, administrative controls create the governance framework that all other controls operate within. When administrative controls fail — because a policy is ignored, unknown, or never tested — technical controls are often circumvented from the inside.

**Technical controls** (also called logical controls) are implemented through technology: software, hardware, and firmware. They automate the enforcement of security policy and can scale across millions of users and transactions without proportional human effort. Examples include firewalls, intrusion detection systems, encryption algorithms, access control lists, multi-factor authentication systems, and audit logging platforms. Technical controls are highly consistent but can be defeated by privileged insiders, misconfiguration, or zero-day vulnerabilities. They also fail silently when poorly maintained.

**Physical controls** protect the physical environment where information systems, personnel, and data reside. They are the oldest form of security control and remain essential because every server, workstation, and cable can be physically accessed, removed, or destroyed if the environment is unprotected. Examples include security guards, door locks, badge access systems, cable locks, fire suppression systems, environmental monitoring sensors, security lighting, and closed-circuit cameras. No amount of encryption protects a server that an attacker can physically carry out the door.

### The Seven Functional Types

Beyond how a control is implemented, every control performs a specific function in the security lifecycle:

**Preventive controls** block a threat or attack before it can materialize into harm. They are proactive by definition. A firewall that drops malicious traffic prevents an intrusion. An encryption key on a laptop prevents data disclosure if the device is stolen. Security awareness training prevents employees from clicking phishing links. The goal is to reduce the probability of a harmful event occurring at all.

**Detective controls** identify that an attack or policy violation has occurred or is occurring. They do not stop the event — they raise the alarm. Intrusion detection systems, audit log review, CCTV camera footage, and security information and event management (SIEM) systems are all detective controls. Detective controls are essential because no preventive control is perfect; you must know when your defenses have been breached.

**Corrective controls** restore the system or environment to a secure state after an incident has occurred. Antivirus software that quarantines and removes malware is corrective. Applying a security patch after exploitation is corrective. Restoring from a clean backup after ransomware is corrective. These controls reduce the impact and duration of an incident.

**Deterrent controls** discourage threat actors from attempting an attack by raising the perceived cost or risk of the attempt. Warning banners on login screens, visible security cameras, security guard presence, and perimeter fencing are deterrents. Critically, deterrents rely on the attacker seeing them and making a rational risk calculation. A determined or irrational attacker may not be deterred.

**Directive controls** mandate behavior through authority — policies, laws, regulations, and contractual obligations. They tell people what they must do rather than technically enforcing it. Acceptable use policies, regulatory requirements (HIPAA, GDPR), and mandatory security training requirements are directive controls. Directive controls are often the foundation layer: they create the obligation that other control types then enforce or monitor.

**Compensating controls** provide alternative coverage when the primary control cannot be implemented due to operational, financial, or technical constraints. If an organization cannot deploy multi-factor authentication on a legacy system, enhanced logging and manual review of privileged sessions serves as a compensating control. PCI DSS and other frameworks formally recognize compensating controls as legitimate but require documentation of why the primary control is infeasible and evidence that the compensating control provides equivalent protection.

**Recovery controls** restore normal operations following a disruption — not just from a security incident but from any event that interrupts availability. Business continuity plans, disaster recovery procedures, warm/hot site agreements, and backup power systems are recovery controls. Where corrective controls address the immediate security breach, recovery controls address the broader restoration of operational capability.

### The Two-Axis Matrix

The CISSP exam tests your ability to classify a control on both axes simultaneously. A security guard is Physical (category) and both Preventive and Detective (type). A login banner is Technical (category) and Deterrent (type). A disciplinary procedure for policy violations is Administrative (category) and Corrective (type). An audit log is Technical (category) and Detective (type).

When the exam gives you a control and asks you to classify it, first ask: "Is this implemented by people/policy, technology, or physical environment?" Then ask: "Does it stop threats before they happen, catch them happening, or deal with the aftermath?" Apply both answers.',
  NULL,
  '{"headers": ["", "Preventive", "Detective", "Corrective", "Deterrent", "Directive", "Compensating", "Recovery"], "rows": [["Administrative", "Security awareness training, background checks, separation of duties", "Audit log reviews, supervisory review", "Disciplinary action, incident response procedures", "Acceptable use policy with stated consequences", "Security policy, regulatory requirements", "Enhanced supervision when MFA unavailable", "BCP/DRP plans, succession planning"], ["Technical", "Firewall, encryption, MFA, access control lists", "IDS/SIEM, audit logs, integrity monitoring", "Antivirus quarantine, patch remediation, system restore", "Login warning banners, honeypots", "Automated policy enforcement tools", "Enhanced logging when full isolation is infeasible", "RAID failover, system restore, hot standby"], ["Physical", "Locks, badge readers, security guards, bollards", "CCTV cameras, motion sensors, security guards on patrol", "Fire suppression, spill containment", "Fencing, warning signs, CCTV signage", "Building codes, physical security standards", "Security escort when biometrics unavailable", "Backup power (UPS/generator), hot site facility"]]}'::jsonb,
  'The exam frequently asks you to classify a single control. Remember: a control has both a category (admin/technical/physical) AND a type (preventive/detective/etc.). A security guard is Physical AND both Preventive and Detective — do not pick just one type if the question allows multiple. Watch for "compensating" controls in PCI DSS scenario questions: they always require documentation of why the primary control is infeasible.',
  'As a manager, your job is to build a control portfolio that spans all three categories. Over-investing in technical controls creates a brittle system: if a firewall is misconfigured or a zero-day lands, nothing else catches the attacker. Your cheapest and highest-leverage control is often administrative: a well-designed policy and a trained employee catch social engineering that no technology detects. Balance your control mix deliberately, and use compensating controls transparently when gaps are unavoidable.',
  'ACT on your controls: Administrative (policy/people), Controls, Technical (technology), controls, Physical (environment). Then use PDDDC-CR to remember the types: Preventive, Detective, Deterrent, Directive, Corrective, Compensating, Recovery.',
  'Imagine Nexus HQ lobby in New York: the security guard at the front desk (Physical/Preventive+Detective), the badge reader on the glass door (Technical/Preventive), the CCTV dome above the entrance (Physical/Detective), the visitor pre-authorization policy on the wall (Administrative/Directive), and the emergency generator humming in the basement (Physical/Recovery). Every control in the lobby belongs somewhere on the matrix.'
);

-- ---------------------------------------------------------------------------
-- 1.8.1 Security Document Hierarchy
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.8.1',
  'Security Document Hierarchy',
  'Policies set the "why," standards define the "what," procedures describe the "how," guidelines offer optional guidance, and baselines establish the minimum acceptable configuration state.',
  '## Security Document Hierarchy

Organizations do not govern security through a single document. They use a layered hierarchy of documents, each serving a distinct purpose and carrying a different level of authority. The CISSP exam tests your ability to correctly identify where a given document type sits in that hierarchy and what distinguishes one type from another. Confusing a policy with a standard, or a procedure with a guideline, is a classic exam trap.

### Policy: The "Why"

A **security policy** is a high-level statement of management intent. It expresses the organization's values, risk appetite, and commitment to security. Policies are mandatory — they carry the authority of senior leadership or the board. They are intentionally broad and technology-neutral, because they must remain stable across system generations and business changes. A policy does not tell employees how to encrypt a laptop; it states that sensitive data must be protected from unauthorized disclosure. Policies are typically owned by the CISO or equivalent executive and require formal approval from leadership.

Examples of policies include an Information Security Policy, an Acceptable Use Policy (AUP), a Data Classification Policy, and a Remote Work Security Policy. Each establishes an obligation without specifying implementation mechanics.

### Standard: The "What"

A **standard** translates a policy mandate into specific, measurable, mandatory requirements. Where a policy says "encryption must be used for sensitive data in transit," a standard specifies "AES-256 for data at rest, TLS 1.3 for data in transit." Standards are also mandatory but are more technical and operational than policies. They are technology-aware and will be updated when technology changes, even when the underlying policy remains stable.

Standards may reference external frameworks and regulations. An organization's password standard might mandate NIST SP 800-63B requirements (minimum eight characters for memorized secrets, no mandatory rotation without evidence of compromise, no complexity requirements that force predictable patterns). A network security standard might mandate NIST SP 800-53 control baselines for specific system impact categories.

### Procedure: The "How"

A **procedure** provides step-by-step instructions for executing a specific task in compliance with a standard and policy. Procedures are operational documents used by practitioners. They are the most detailed documents in the hierarchy and are mandatory for the specific tasks they govern. A data backup procedure describes exactly how to initiate, verify, and store a backup. An incident response procedure describes who calls whom in the first fifteen minutes of a detected breach.

Procedures are specific to a technology, platform, or process and will change frequently. They are owned by the teams responsible for executing them, not by security leadership. A procedure for patching Windows Server systems is distinct from a procedure for patching Linux systems, even though both comply with the same patching standard.

### Guideline: Optional Best Practice

A **guideline** is advisory, not mandatory. Guidelines offer recommended best practices, suggestions, and helpful approaches, but practitioners may deviate from them when circumstances require. NIST publications (most of them) are guidelines. NIST SP 800-53 says "recommended security controls" — it is a guideline unless an organization formally adopts it as mandatory, at which point the organization's own standard references NIST.

Guidelines are useful for situations where mandating a specific approach would be counterproductive — where professional judgment should prevail. A secure coding guideline might recommend error handling patterns, but a skilled developer may have legitimate reasons to implement differently.

### Baseline: Minimum Configuration State

A **baseline** defines the minimum acceptable security configuration for a specific category of system. Where a standard says "all servers must be hardened," a baseline specifies exactly which settings, patches, and configurations constitute a hardened state for a Windows Server 2022 system. Baselines are typically derived from government or industry benchmarks: CIS Benchmarks, DISA STIGs (Security Technical Implementation Guides), or vendor hardening guides.

Baselines are mandatory and measurable. Compliance with a baseline can be verified through automated configuration scanning tools. Deviations from baseline require documented risk acceptance or a compensating control. The concept of configuration drift — systems gradually moving away from their secure baseline — is a major operational risk that baselines help detect and correct.

### Document Authority and Change Control

The hierarchy also implies an authority structure. A procedure may not contradict a standard. A standard may not contradict a policy. Exceptions must be approved at the level above the document being excepted from. A team that wants to deviate from a standard requires management approval and risk acceptance; a team that wants to deviate from a policy requires executive or board-level sign-off. All documents in the hierarchy should be version-controlled, reviewed on a defined cycle (typically annually), and formally retired when no longer applicable.',
  NULL,
  '{"headers": ["Document Type", "Authority", "Mandatory?", "Specificity", "Audience", "Change Frequency"], "rows": [["Policy", "Executive/Board", "Yes", "Low — intent only", "All staff", "Rarely (years)"], ["Standard", "CISO/Security Team", "Yes", "Medium — specific requirements", "IT and security teams", "Periodically (tech changes)"], ["Procedure", "Operations team", "Yes (for that task)", "High — step-by-step", "Practitioners", "Frequently"], ["Guideline", "Any author", "No — advisory only", "Varies", "Anyone", "As needed"], ["Baseline", "Security/Operations", "Yes (for that system type)", "Very high — specific config values", "Sysadmins, engineers", "With technology changes"]]}'::jsonb,
  'The most common exam trap: "guideline" sounds authoritative but is optional. "Standard" sounds generic but is mandatory. Memorize this pair specifically. Also watch for questions about exception handling: exceptions to a policy require a higher level of approval than exceptions to a procedure. When a question asks which document type an employee should consult for step-by-step task instructions, the answer is always procedure.',
  'As a manager, your job is to ensure documents in this hierarchy are actually connected. A policy that has no supporting standard is unenforceable. A standard with no procedure cannot be reliably executed. And a baseline that nobody checks means you have configuration drift you cannot see. Treat the hierarchy as a system: gaps at any level create exploitable ambiguity.',
  'PSPGB — Please Stop Playing Guitar Badly: Policy, Standard, Procedure, Guideline, Baseline. Authority flows downward. Mandatory status: P, S, P, NO, B. Guidelines are the exception — they are always advisory.',
  'Picture the Nexus HQ executive floor in New York. The CEO''s mission statement framed on the wall is the Policy. The IT security team''s locked binder of requirements downstairs is the Standard. The operations room clipboard with step-by-step backup scripts is the Procedure. The suggestion box full of best practice notes is the Guideline. The building fire inspection checklist on the wall listing minimum code compliance items is the Baseline.'
);

-- ---------------------------------------------------------------------------
-- 1.9.1 Supply Chain Risk Management
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.9.1',
  'Supply Chain Risk Management',
  'Supply chain risk management addresses threats introduced through third-party hardware, software, and services — from firmware tampering to compromised open-source dependencies — using SBOMs, contractual controls, and silicon root of trust.',
  '## Supply Chain Risk Management

The supply chain is one of the most dangerous attack surfaces in modern organizations because it operates largely outside your direct control. When you buy a server, install a software library, or subscribe to a managed service, you inherit the security posture of every entity that touched that product before it arrived in your environment. The CISSP exam tests supply chain risk at both the conceptual and practical level, emphasizing the frameworks and controls organizations use to manage third-party risk.

### Why Supply Chain Risk Is Different

Traditional security assumes you control your environment. Supply chain risk assumes you do not control the origins of the components you depend on. A threat actor who compromises a component upstream of your organization bypasses your perimeter entirely — the malicious code or hardware arrives pre-installed inside your trusted procurement channel. The 2020 SolarWinds incident illustrated this at scale: a single compromised software build system injected malicious code into updates delivered to approximately 18,000 organizations worldwide. The organizations targeted had strong perimeter defenses; none of those defenses were relevant to an attack that arrived through a trusted software update mechanism.

### NIST SP 800-161: The Foundational Framework

NIST SP 800-161 (Supply Chain Risk Management Practices for Federal Information Systems and Organizations) is the primary framework for ICT supply chain risk management (C-SCRM). It establishes a multi-tiered approach where supply chain risk management integrates with the organization''s broader risk management hierarchy — enterprise risk at Tier 1, mission/business process risk at Tier 2, and system-level risk at Tier 3. Key practices include supplier vetting and qualification, contractual security requirements, provenance tracking, and ongoing supplier monitoring.

### Software Bill of Materials (SBOM)

An SBOM is a formal, machine-readable inventory of every software component in an application — including open-source libraries, commercial components, and dependencies of dependencies. It functions like a food label for software: you cannot manage risk from a component you do not know exists. The U.S. Executive Order on Improving the Nation''s Cybersecurity (EO 14028, 2021) mandated SBOM requirements for software sold to the federal government, accelerating industry adoption.

SBOMs use standardized formats including SPDX (Software Package Data Exchange, an ISO/IEC 5962 standard) and CycloneDX (an OWASP standard). When a new vulnerability like Log4Shell is discovered, an organization with current SBOMs can immediately identify every system in their environment that includes the vulnerable component. Without an SBOM, the same discovery requires manual inventory work that can take weeks.

### Third-Party Risk Management

Third-party risk management (TPRM) is the systematic process of identifying, assessing, and monitoring the risk introduced by vendors, suppliers, contractors, and service providers. Key activities include:

**Vendor due diligence** before engagement: reviewing security questionnaires, SOC 2 Type II reports, ISO 27001 certifications, penetration test results, and financial stability assessments. A vendor that goes out of business or gets acquired can disrupt your operations or expose your data.

**Contractual controls**: Security requirements codified in contracts, including right-to-audit clauses, breach notification obligations (typically 24-72 hours per regulatory requirements), data handling requirements, minimum security standards, and liability provisions. A contract that does not address security is a contract that allows a vendor to ignore it.

**Ongoing monitoring**: Initial due diligence is insufficient because vendor security postures change. Continuous monitoring includes periodic reassessment questionnaires, monitoring vendor security advisories, tracking third-party breach disclosures, and reviewing changes to vendor subcontractors (fourth-party risk).

### Hardware Supply Chain: Tampering and Counterfeits

Hardware threats include counterfeit components, firmware manipulation, and hardware implants introduced at manufacturing or during transit. A threat actor with access to a hardware supply chain can implant backdoors in chips, network equipment, or storage devices that persist regardless of software-level security controls. Mitigations include purchasing hardware from authorized distributors, verifying firmware hashes upon delivery, using tamper-evident packaging, and conducting hardware security reviews for high-risk deployments.

### Silicon Root of Trust

A silicon root of trust (SRoT) is a hardware-based security anchor built into a chip at manufacturing time that provides a cryptographically verifiable foundation for a device''s security. The root of trust serves as the immutable starting point for a chain of trust — each component in the boot sequence is verified against the previous one, anchored ultimately in hardware that cannot be tampered with through software. The Trusted Platform Module (TPM) is the most common implementation; it stores cryptographic keys in hardware, performs attestation (proving to a remote party that a system''s boot state is unaltered), and enables measured boot (recording each boot step''s hash in TPM registers). NIST SP 800-193 (Platform Firmware Resiliency Guidelines) addresses silicon root of trust requirements for firmware protection.',
  NULL,
  '{"headers": ["Risk Category", "Threat Example", "Primary Control", "Relevant Standard/Framework"], "rows": [["Software supply chain", "Malicious code in open-source library or build pipeline (e.g., SolarWinds)", "SBOM, SCA scanning, dependency pinning", "NIST SP 800-161, SPDX/CycloneDX"], ["Hardware supply chain", "Counterfeit component or firmware implant at manufacturing", "Authorized distributor procurement, firmware hash verification, hardware attestation", "NIST SP 800-193, silicon root of trust"], ["Third-party service provider", "Vendor breach exposes customer data", "Vendor due diligence, contractual security requirements, right-to-audit", "ISO 27036, SOC 2 reports"], ["Subcontractor / fourth-party risk", "Vendor''s vendor is compromised and impacts your environment", "Flow-down contract requirements, subcontractor visibility requirements", "NIST SP 800-161 Tier 3"]]}'::jsonb,
  'Supply chain questions on the exam often ask about SBOMs, third-party risk controls, or the concept of silicon root of trust. Key distinctions: an SBOM is an inventory of software components (not a security control by itself — it enables other controls). A right-to-audit clause is a contractual control, not a technical one. Silicon root of trust is a hardware control. NIST SP 800-161 is the primary supply chain risk framework for government-adjacent organizations.',
  'As a manager, supply chain risk is where your security program meets your procurement and legal functions. You cannot secure what you do not know exists. SBOMs make your software inventory visible. Contractual controls make security requirements enforceable. The hardest part of supply chain risk management is sustaining it: vendor risk must be reassessed continuously, not just at contract signing, because a vendor that was secure in January may be breached by June.',
  'SBOM = Software''s Birth Certificate, listing every ingredient. SCRM = Supplier Credentials and Risk Management. Silicon Root of Trust = the hardware''s DNA that cannot be faked. Every component needs a pedigree.',
  'Imagine a Nexus HQ server delivery arriving at the New York loading dock. The shipping box has a tamper-evident seal (hardware supply chain control). Inside, the server has a TPM chip soldered to the motherboard (silicon root of trust). The IT team cross-checks the firmware hash against the manufacturer''s published signature (provenance verification). Upstairs, the security team reviews the SBOM for the software stack before it is installed, catching a flagged library before it touches the network.'
);

-- ---------------------------------------------------------------------------
-- 1.10.1 Import/Export Controls
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.10.1',
  'Import/Export Controls',
  'Import/export controls (ITAR, EAR, Wassenaar) restrict the transfer of defense-related technologies and dual-use goods — including strong encryption — across national borders, imposing legal obligations on organizations operating internationally.',
  '## Import/Export Controls

When organizations transfer technology, software, or data across national borders, they enter a legal regime of import and export controls that impose significant compliance obligations. These controls exist because certain technologies — particularly those with military applications or the potential to enable weapons development — are considered matters of national security. Cryptography is the most directly relevant category for information security professionals, because strong encryption qualifies as a controlled item under multiple regimes.

### Why This Matters for Security Professionals

A CISSP is expected to understand that deploying or transferring certain security technologies internationally is not purely a technical decision. Using a strong encryption algorithm in a product exported to another country, moving encrypted data across borders, or providing security consulting services in certain jurisdictions may require export licenses, trigger legal restrictions, or necessitate specific compliance reviews. Organizations that violate export control laws face severe criminal and civil penalties.

### ITAR: International Traffic in Arms Regulations

ITAR (22 CFR Parts 120-130) is administered by the U.S. Department of State, Directorate of Defense Trade Controls (DDTC). It controls the export and import of defense articles, defense services, and related technical data as defined in the U.S. Munitions List (USML). ITAR applies to any item "specifically designed, developed, configured, adapted, or modified" for military application.

From an information security perspective, ITAR is relevant to organizations that develop security systems, communications equipment, or cryptographic devices for military or defense customers. If a company develops intrusion detection or electronic warfare software for the Department of Defense, that software is likely ITAR-controlled. Transfers of ITAR-controlled items — including transferring technical data to a foreign national even on U.S. soil — require licenses from the State Department. The "deemed export" doctrine means sharing controlled technical information with a foreign national in the U.S. is treated as an export.

### EAR: Export Administration Regulations

EAR (15 CFR Parts 730-774) is administered by the U.S. Department of Commerce, Bureau of Industry and Security (BIS). It controls dual-use items — goods and technologies that have both commercial and military applications. The Commerce Control List (CCL) categorizes controlled items; many cybersecurity tools, network equipment, and cryptographic products fall under EAR jurisdiction.

Encryption specifically is addressed in EAR Category 5 Part 2 (Information Security). Items using strong encryption (generally 56-bit symmetric or longer, or equivalent asymmetric keys) are EAR-controlled. However, EAR provides significant license exceptions for mass-market encryption products, open-source cryptography, and certain government end-users. Organizations must determine their Export Control Classification Number (ECCN) and evaluate whether a license exception applies before export.

### Wassenaar Arrangement

The Wassenaar Arrangement on Export Controls for Conventional Arms and Dual-Use Goods and Technologies is a multilateral export control regime with 42 participating states. It provides a framework for coordinating national export controls on conventional weapons and dual-use technologies, including surveillance and intrusion software. A controversial 2015 update proposed controls on "intrusion software" (exploits, rootkits, command-and-control tools) that sparked significant debate in the security research community, as the definitions were broad enough to potentially restrict legitimate security research and vulnerability disclosure.

### Transborder Data Flow

Beyond technology export controls, transborder data flow regulations restrict the movement of personal data across national borders based on privacy law. The EU General Data Protection Regulation (GDPR) prohibits transferring personal data of EU residents to countries without "adequate" data protection unless specific safeguards are in place (Standard Contractual Clauses, Binding Corporate Rules, or an adequacy decision from the European Commission). The EU-U.S. Data Privacy Framework (successor to Privacy Shield) is the current mechanism for transatlantic data transfers. Similar regimes exist in many jurisdictions, including China''s Data Security Law and Personal Information Protection Law (PIPL), and Russia''s data localization requirements.',
  NULL,
  '{"headers": ["Regime", "Administering Body", "Scope", "Key List", "Encryption Relevance"], "rows": [["ITAR", "U.S. Dept. of State (DDTC)", "Defense articles and services", "U.S. Munitions List (USML)", "Cryptographic devices designed for military use"], ["EAR", "U.S. Dept. of Commerce (BIS)", "Dual-use goods and technology", "Commerce Control List (CCL) — ECCN 5E002", "Most commercial encryption products; license exceptions available"], ["Wassenaar", "Multilateral (42 states)", "Conventional arms and dual-use tech", "Wassenaar Dual-Use List", "Surveillance tools, intrusion software; ongoing debate about security research tools"], ["GDPR / Data Privacy Law", "EU (national DPAs)", "Personal data of EU residents", "N/A — country adequacy list", "Applies to data transfers, not encryption technology itself"]]}'::jsonb,
  'The exam rarely tests deep regulatory detail but does test conceptual distinctions. Know: ITAR = military/defense (State Dept), EAR = dual-use commercial (Commerce Dept), Wassenaar = multilateral coordination. The "deemed export" concept — sharing controlled technical data with a foreign national on U.S. soil counts as an export — is a classic exam scenario. Transborder data flow questions typically reference GDPR and Standard Contractual Clauses.',
  'As a manager operating internationally, import/export controls are a legal compliance matter, not just a security one. Your legal and compliance teams must be involved in any product release, consulting engagement, or data transfer that crosses national borders and involves cryptographic technology or defense-adjacent systems. Violations can result in criminal prosecution, not just fines. Treat export compliance as a gate, not an afterthought.',
  'IEW — Import Export Watch: ITAR is military (State), EAR is Everything-else-Regulation (Commerce), Wassenaar is the World-club. The acronyms spell "IEW" like "I owe you" — you owe the government a license if you misclassify.',
  'Picture a Nexus HQ courier bag in New York about to leave for a foreign partner. One folder is labeled ITAR — it needs a State Department license before it leaves the building. A second folder is labeled EAR — the legal team is checking whether a license exception applies. A third folder is labeled GDPR Data Transfer — the DPO has stapled Standard Contractual Clauses to the front. Nothing leaves until compliance signs off.'
);

-- ---------------------------------------------------------------------------
-- 1.11.1 Social Engineering Attacks
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.11.1',
  'Social Engineering Attacks',
  'Social engineering exploits human psychology rather than technical vulnerabilities — using deception, authority, urgency, and trust to manipulate people into disclosing information or performing actions that compromise security.',
  '## Social Engineering Attacks

Every technical control in an organization''s security stack can be rendered irrelevant by a single employee who is deceived into handing over credentials or clicking a malicious link. Social engineering attacks exploit human psychology — our natural tendencies toward trust, compliance with authority, and urgency — rather than technical vulnerabilities. The CISSP exam tests both recognition of specific social engineering techniques and understanding of the psychological principles that make them effective.

### The Psychology Behind Social Engineering

Social engineering attacks leverage predictable cognitive biases and social norms. **Authority** — we comply with requests from people who appear to be in positions of power or expertise. **Urgency and scarcity** — artificial time pressure impairs critical thinking and pushes people to act before verifying. **Social proof** — we take cues from what others are doing or what seems normal in a given context. **Reciprocity** — we feel obligated to return favors. **Liking and familiarity** — we are more likely to comply with requests from people we like or recognize. **Fear** — threat of negative consequences (account suspension, legal action, job termination) bypasses rational evaluation.

### Phishing

Phishing is the mass-distribution variant of social engineering, typically delivered by email, that impersonates a trusted entity and directs victims to a fraudulent site or into opening a malicious attachment. A classic phishing email appears to come from a bank, a major service provider (Microsoft 365, PayPal, Amazon), or an internal IT team, and requests that the recipient verify credentials, update payment information, or open an attached document. Phishing relies on volume: even a 0.1% success rate across a million emails yields a thousand compromised credentials.

**Spear phishing** is targeted phishing where the attacker has researched the specific victim or organization and crafts a message that references real names, projects, or organizational details. The personalization dramatically increases credibility and success rates. A spear phish might reference the victim''s manager by name, mention a current project, or appear to come from a known colleague.

**Whaling** is spear phishing specifically targeting senior executives (the "big fish"). Whaling attacks often impersonate legal firms, regulators, or board members and may request wire transfers, sensitive documents, or executive credentials. Business Email Compromise (BEC) is a related form where attackers either compromise or spoof executive email accounts to authorize fraudulent financial transactions.

### Vishing and Smishing

**Vishing** (voice phishing) uses phone calls to deceive victims. An attacker impersonates IT support, a bank fraud department, or a government agency, and manipulates the victim into providing credentials, installing remote access software, or approving a fraudulent transaction. Caller ID spoofing makes it trivial to display any number, including the legitimate number of an organization being impersonated.

**Smishing** (SMS phishing) delivers social engineering attacks via text message. SMS has a very high open rate, and mobile users are less likely to scrutinize URLs in text messages than in emails. Smishing messages typically create urgency ("Your package delivery failed — click here to reschedule") and link to credential-harvesting sites optimized for mobile browsers.

### Pretexting

Pretexting involves creating a fabricated scenario (the "pretext") to establish credibility and manipulate the victim. An attacker might call an employee posing as an IT auditor conducting a routine review, establishing enough context to request access credentials "to verify the account." Pretexting goes beyond a simple lie — it involves research and role-playing to build a convincing false identity. The 2011 Hewlett-Packard boardroom spying case involved pretexting on a large scale, and it is now explicitly prohibited by U.S. federal law (the CPNI rules under the Telephone Records and Privacy Protection Act of 2006).

### Baiting

Baiting uses the promise of something enticing — or simple curiosity — to lure victims into a compromising action. The classic example is leaving USB drives in a parking lot or lobby with labels like "Q4 Salary Data" or "Confidential HR Files." Curious employees who plug in the drives execute malware. Studies by security researchers have demonstrated that dropped USB drives are inserted into company computers at high rates even when employees have received security training.

### Tailgating and Piggybacking

**Tailgating** (also called **piggybacking**) is a physical social engineering technique where an attacker follows an authorized individual through a secure door or access point without presenting credentials. The attacker exploits social norms — it feels rude to close a door on someone carrying boxes or wearing a badge — to bypass physical access controls. Mantrap/airlock entry systems, security guards, and clear security culture (employees challenging unfamiliar individuals) are the primary mitigations.',
  NULL,
  '{"headers": ["Attack Type", "Medium", "Target", "Key Psychological Lever", "Primary Mitigation"], "rows": [["Phishing", "Email", "Mass (undifferentiated)", "Urgency, fear, imitation of trusted brand", "Email filtering, phishing simulation training"], ["Spear Phishing", "Email", "Specific individual or team", "Familiarity, authority, personalized detail", "Security awareness training, sender verification"], ["Whaling", "Email/phone", "C-suite executives", "Authority, legitimacy, fear of legal/regulatory action", "Executive-level security training, wire transfer verification procedures"], ["Vishing", "Phone/VoIP", "Any employee", "Authority, urgency, caller ID trust", "Callback verification procedures, security awareness"], ["Smishing", "SMS", "Any employee", "Urgency, mobile trust habits", "Security awareness, mobile phishing training"], ["Pretexting", "Any (phone, email, in-person)", "Any employee", "Fabricated authority and credibility", "Verification procedures, need-to-know policy"], ["Baiting", "Physical media or download promise", "Curious employees", "Curiosity, greed", "Disable autorun, physical security controls, security training"], ["Tailgating/Piggybacking", "Physical", "Anyone near secure entrance", "Social norm against confrontation", "Mantrap, security culture, guard presence"]]}'::jsonb,
  'Social engineering questions on the exam often require you to identify the specific technique being used. The key distinctions: phishing = email + mass distribution; spear phishing = email + targeted; whaling = targeted + executive; vishing = voice; smishing = SMS; pretexting = fabricated scenario; baiting = lure with something enticing; tailgating = physical access through authorized person. Also know that the best countermeasure to social engineering is security awareness training, not technical controls.',
  'As a manager, social engineering attacks are your biggest residual risk because they target the human layer that your technical controls cannot fully protect. Your best investment is a robust security awareness training program with realistic simulations, not just annual compliance training. When an employee nearly falls for a phishing attack, treat it as valuable intelligence — not a disciplinary matter — to understand what made the attack credible. A culture where employees feel safe reporting near-misses is your most powerful early warning system.',
  'PSVWSB-PT — Pretty Smart Villains Work Stealthily, Bypassing Protection Through: Phishing, Spear-phishing, Vishing, Whaling, Smishing, Baiting, Pretexting, Tailgating. Or simply: social engineers PAVE a Path With Social Behavior (Phishing, vishing, smishing, Whaling, Baiting, Pretexting).',
  'In the Nexus HQ New York lobby, a stranger approaches carrying boxes and asks an employee to hold the door — tailgating. Upstairs, an employee gets a text message claiming their MFA device needs reactivation — smishing. In the CEO''s office, an email arrives from "external counsel" demanding an urgent wire transfer — whaling. On the street outside, a USB drive labeled "Nexus Employee Bonuses Q4" sits on the sidewalk — baiting. Every attack targets the human, not the firewall.'
);

-- ---------------------------------------------------------------------------
-- 1.12.1 Security Awareness Training
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  1,
  '1.12.1',
  'Security Awareness Training',
  'Security awareness, training, and education (AT&E) form a three-tier pyramid: awareness changes behavior broadly, training builds specific skills, and education develops deep professional expertise — each requiring different methods and metrics.',
  '## Security Awareness Training

Organizations invest heavily in technical controls and often under-invest in the human element. Security awareness training (AT&E: Awareness, Training, and Education) addresses the reality that most security incidents involve human action or inaction at some point in the attack chain — whether that is clicking a phishing link, misconfiguring a system, or ignoring a policy. NIST SP 800-16 and NIST SP 800-50 provide the foundational frameworks for federal agencies and are widely adopted in the private sector.

### The Three Tiers: Awareness, Training, and Education

**Security awareness** is the broadest tier, aimed at changing the general security behavior of all organizational personnel. Awareness programs do not teach skills — they change attitudes and perceptions. An employee who completes an awareness program should recognize that security is relevant to their daily work, identify warning signs of phishing, understand why the clean desk policy exists, and know how to report a suspected incident. Awareness is delivered through posters, newsletters, phishing simulations, mandatory brief videos, login banners, and reminders embedded in routine communications.

Per NIST SP 800-50, the goal of awareness is "to focus attention on security" — it is not training. Awareness activities must be ongoing and recurring because the human tendency toward normalization erodes attention over time. A single annual awareness video is nearly worthless; a program with monthly touchpoints at varied formats is significantly more effective.

**Security training** targets specific roles with specific skills required to perform security-relevant tasks. A systems administrator needs training on secure configuration management. A software developer needs training on secure coding practices. A help desk employee needs training on identity verification before resetting passwords. Training is hands-on, skill-building, and role-specific. It is typically delivered through workshops, lab exercises, computer-based training modules with practical components, and tabletop exercises.

NIST SP 800-16 provides a role-based framework for security training, categorizing functional roles (executive, program manager, IT professional, general user) and mapping training content to each. Training requirements vary by role because an executive''s security responsibilities differ fundamentally from those of a network engineer.

**Security education** is the deepest tier and applies to security professionals who need comprehensive theoretical and applied knowledge to perform specialized security functions. Education encompasses formal academic programs, professional certifications (including CISSP), industry conferences, advanced research, and deep technical study. Education programs develop practitioners who can design security architectures, perform threat modeling, lead incident response, and advise organizational leadership. Education cannot be delivered through a one-hour course; it requires sustained learning over months or years.

### Program Components of an Effective Awareness Program

An effective security awareness program includes: a formal program charter and management sponsorship; a content calendar aligned with the threat landscape (e.g., phishing campaigns during tax season, travel security content before holidays); role-specific modules beyond the general population; a recurring phishing simulation program with targeted remedial training for click-prone employees; a clear incident reporting mechanism communicated to all staff; coverage of physical security (clean desk, tailgating, visitor escort), digital security (password management, MFA, device security), and social engineering recognition.

### Effectiveness Metrics

Awareness programs must be measured to demonstrate value and identify gaps. Key metrics include:

**Phishing simulation click rates**: Percentage of employees who click simulated phishing links, open attachments, or enter credentials. Tracked over time to demonstrate improvement. A well-run program typically shows declining click rates across multiple simulation campaigns.

**Reporting rates**: Percentage of simulated phishing emails that are reported to the security team by employees. An increase in reporting rates indicates the program is changing behavior in the desired direction, not just reducing clicks.

**Training completion rates**: Percentage of required training completed on time by role. Low completion rates are a program management failure, not a security win.

**Incident statistics**: Trends in user-attributable security incidents (phishing compromises, policy violations, malware from user action). Reductions over time indicate program effectiveness.

**Knowledge assessment scores**: Pre- and post-training quiz scores measuring knowledge retention.

Metrics should be reported to leadership on a regular cadence and tied to risk reduction outcomes, not just compliance checkbox completion.',
  NULL,
  '{"headers": ["Tier", "Target Audience", "Goal", "Delivery Methods", "Example Content", "Measurement"], "rows": [["Awareness", "All personnel", "Change attitudes and general behavior", "Posters, newsletters, phishing sims, short videos, login banners", "Phishing recognition, clean desk policy, incident reporting procedures", "Phishing click rates, reporting rates, incident trends"], ["Training", "Role-specific groups (admin, developers, help desk)", "Build specific skills for security-relevant tasks", "Workshops, labs, CBT with practical exercises, tabletop exercises", "Secure coding, identity verification procedures, secure configuration", "Skill assessment scores, task performance metrics"], ["Education", "Security professionals", "Develop deep expertise and professional judgment", "Formal programs, certifications (CISSP), conferences, research", "Threat modeling, security architecture design, advanced incident response", "Certification attainment, research output, professional growth"]]}'::jsonb,
  'The exam distinguishes sharply between awareness, training, and education. Awareness = attitude change for all employees; training = skill development for specific roles; education = deep professional expertise. When a question asks about the best approach for all employees, the answer is awareness. For a developer learning secure coding, it is training. For a security engineer pursuing a certification, it is education. Also know NIST SP 800-50 (awareness and training) and NIST SP 800-16 (role-based training framework) as the key source documents.',
  'As a manager, security awareness training is not a compliance checkbox — it is a risk reduction investment. The measure of success is not training completion rates; it is a decline in user-attributable incidents and an increase in employee reporting of suspected threats. An employee who reports a suspicious email that turns out to be benign is demonstrating exactly the behavior you want. Reward that behavior. Your awareness program also needs executive sponsorship that is visible and genuine: if leadership ignores security culture, employees will too.',
  'ATE rises in altitude: Awareness is the wide base (everyone, attitude), Training is the middle level (role-specific, skills), Education is the peak (professionals, expertise). Higher up = fewer people, deeper knowledge. Or remember: A security professional Gets Trained, then Gets Educated — you cannot skip rungs.',
  'At Nexus HQ in New York, every new employee gets a badge with a security awareness QR code — wide base, everyone. The IT team goes to a two-day secure configuration workshop every year — middle tier, skills. The CISO is completing a graduate certificate in cybersecurity strategy — the peak, education. The security culture pyramid is visible in the building''s daily life: from the lobby sign to the executive suite.'
);
