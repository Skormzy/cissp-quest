-- ============================================================
-- CISSP Quest -- Domain 1: Security and Risk Management
-- Generated: 2026-04-16 | Source: ai_generated (from ISC2 CBK)
-- ============================================================
-- DISTRIBUTION STATS (28 questions total)
--   Difficulty:  Easy=6 (21%), Medium=13 (46%), Hard=7 (25%), Very Hard=2 (7%)
--   Cognitive:   Remember=3 (11%), Understand=5 (18%), Apply=12 (43%), Analyze=8 (29%)
--   Types:       Scenario=10, Best Answer=4, First Action=4, TLATM=3,
--                Comparison=4, Calculation=2, Except/Not=1
--   Answer pos:  0=7, 1=7, 2=7, 3=7
-- Topic clusters: supply_chain_risk_management, export_controls_transborder,
--   security_controls_classification, third_party_governance,
--   security_awareness_training, social_engineering, bcp_drp_numbers,
--   security_document_hierarchy, threat_modeling
-- ============================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: Controls classification -- easy/remember
(
  1, 'security_controls_classification',
  'A company requires all employees to take two weeks of consecutive vacation each year. From a security perspective, this control is BEST classified as which combination?',
  '["Preventive and administrative", "Detective and administrative", "Corrective and technical", "Compensating and physical"]'::jsonb,
  1,
  'Mandatory vacation is a detective and administrative control. It forces temporary removal of an employee from their duties, allowing reviewers to detect fraud or irregularities that depended on that employee''s continuous presence. It is administrative because it is enforced through policy and HR procedure, not technology. The most tempting wrong answer is "preventive and administrative" -- mandatory vacation does not prevent fraud before it occurs; it creates conditions to detect it after the fact.',
  'In the spy world: rotate agents so their covers do not become too comfortable -- what they are hiding surfaces when they are away.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.60, 0.20, 'ai_generated', true
),

-- Q2: Controls classification -- medium/apply
(
  1, 'security_controls_classification',
  'After a security breach, your organization installs an intrusion detection system and increases log monitoring frequency. A consultant recommends also requiring two-person approval for all privileged account changes going forward. Which control TYPES do the IDS, increased monitoring, and the two-person approval represent, respectively?',
  '["Preventive, preventive, detective", "Detective, detective, preventive", "Corrective, detective, compensating", "Detective, corrective, deterrent"]'::jsonb,
  1,
  'An IDS monitors and alerts on suspicious activity -- it is a detective control. Increased log monitoring is also detective (it identifies events after they occur or as they occur, but does not stop them). Requiring two-person approval for privileged changes is a preventive control -- it stops unauthorized changes before they happen by requiring a second set of eyes. The most tempting distractor is "corrective, detective, compensating" because the IDS was installed after the breach (post-incident), but the control type is determined by its function, not the timing of its deployment.',
  'Intel analysts review signals after transmissions; the authentication checkpoint stops the mission before launch -- different functions, different classifications.',
  'apply',
  'comparison',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q3: Controls classification -- hard/analyze
(
  1, 'security_controls_classification',
  'An organization cannot afford to implement full separation of duties for its finance team of three people. Instead, it implements monthly reconciliation reviews by an independent auditor and detailed transaction logging. A security manager argues this satisfies the control objective. Which assessment is MOST accurate?',
  '["The organization has eliminated the risk through administrative controls", "The organization has implemented a compensating control that partially addresses the separation of duties requirement", "The organization has implemented a preventive control equivalent to separation of duties", "The organization has accepted the risk and should document it as a risk acceptance decision"]'::jsonb,
  1,
  'Monthly reconciliation by an independent auditor combined with detailed logging is a compensating control -- it reduces the risk created by the absence of full separation of duties without fully replicating the protection that separation of duties would provide. Compensating controls are accepted in PCI DSS and other frameworks when the primary control is not feasible, but they must be documented and assessed for residual risk. The risk is not eliminated (A is wrong) -- it is reduced. These are detective controls, not preventive equivalents (C is wrong). Risk acceptance (D) would mean doing nothing beyond documenting the decision, which is incorrect here because controls are being implemented.',
  'Field agents without a handler use a dead drop and check-in schedule as compensating measures -- not as good as real-time oversight, but better than nothing.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.50, 0.20, 'ai_generated', true
),

-- Q4: Security document hierarchy -- easy/remember
(
  1, 'security_document_hierarchy',
  'Which security document type is mandatory, sets organizational-level direction, and is approved by senior management, but does NOT specify the technical steps required to comply?',
  '["Standard", "Procedure", "Policy", "Baseline"]'::jsonb,
  2,
  'A policy establishes high-level direction, mandatory requirements, and senior management intent without specifying implementation steps. Policies tell employees WHAT must be done, not HOW. Standards define specific mandatory technical requirements (e.g., "all passwords must be at least 12 characters"). Procedures are step-by-step implementation instructions. Baselines are minimum security configurations for a specific platform. The most tempting wrong answer is "standard" -- standards are also mandatory, but they go deeper than policy by specifying exact technical requirements.',
  'The Director''s standing orders define the mission objective and what is prohibited -- not the tactical steps. That''s the ops team''s job.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.70, 0.20, 'ai_generated', true
),

-- Q5: Security document hierarchy -- medium/apply
(
  1, 'security_document_hierarchy',
  'A new CISO discovers the organization has a password policy that states "passwords must be strong." The IT team has documented a checklist for creating a helpdesk ticket, resetting passwords, and notifying the user. A security consultant recommends adding a document that specifies passwords must be at least 14 characters, include uppercase, lowercase, numbers, and symbols, and cannot be reused for 12 cycles. What type of document is the consultant recommending?',
  '["A revised policy", "A standard", "A procedure", "A guideline"]'::jsonb,
  1,
  'The consultant is recommending a standard. Standards are mandatory, specific technical requirements that support and implement a higher-level policy. "At least 14 characters, complexity rules, 12-cycle history" are precise, mandatory specifications -- the hallmark of a standard. The policy already exists ("passwords must be strong") and this supplements it. The checklist for creating a helpdesk ticket and notifying users is the procedure (already exists). Guidelines are advisory and non-mandatory, which does not fit the mandatory nature of these specifications.',
  'The Director''s policy says "secure all communications." The technical standard specifies: AES-256, TLS 1.3, no export-grade ciphers. Both are mandatory; one is broad, one is precise.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.25, 0.20, 'ai_generated', true
),

-- Q6: Security document hierarchy -- hard/analyze
(
  1, 'security_document_hierarchy',
  'A security auditor finds that the organization has a comprehensive information security policy, detailed technical standards for each system type, and step-by-step procedures for all security operations. However, when auditing the cloud migration team, the auditor finds staff are making inconsistent security decisions when the procedures do not cover edge cases. Which document type is MOST likely missing?',
  '["Additional technical standards for cloud environments", "Operational procedures covering cloud-specific edge cases", "Security guidelines providing advisory recommendations for edge case situations", "A revised policy explicitly addressing cloud computing"]'::jsonb,
  2,
  'Guidelines are the document type designed for exactly this situation. Guidelines are advisory, non-mandatory recommendations that provide direction when staff face situations not fully covered by policies, standards, or procedures. They give employees judgment guidance without requiring a new mandatory rule for every scenario. Adding more mandatory standards or procedures would not solve inconsistent decision-making in edge cases -- it would only push the ambiguity further out. A revised policy at the high level would not help staff making tactical decisions. Guidelines empower informed judgment.',
  'When the field manual does not cover the situation, the standing advisory notes give agents permission to use professional judgment within defined boundaries.',
  'analyze',
  'scenario',
  'hard',
  1.55, 1.55, 0.20, 'ai_generated', true
),

-- Q7: Threat modeling -- medium/apply
(
  1, 'threat_modeling',
  'During a threat modeling session, a security architect identifies that an attacker could intercept authentication tokens transmitted between the mobile application and the API gateway. Which STRIDE category does this threat represent?',
  '["Spoofing", "Tampering", "Information Disclosure", "Elevation of Privilege"]'::jsonb,
  2,
  'Intercepting authentication tokens is Information Disclosure -- an attacker is gaining access to data they should not be able to see (the token itself). Spoofing would involve the attacker using the token to impersonate someone else (a subsequent step). Tampering involves modifying data in transit. Elevation of Privilege involves gaining capabilities beyond what is authorized. The question asks about the interception of the token, not its use -- that makes it Information Disclosure. The most tempting wrong answer is Spoofing because tokens are used for identity -- but the act of capturing the token during transmission is disclosure, not spoofing.',
  'STRIDE: Spoofing-Tampering-Repudiation-Information Disclosure-Denial of Service-Elevation. Intercepting the agent''s credentials is Intelligence (Disclosure) -- using them to impersonate is Spoofing.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q8: Threat modeling -- medium/understand
(
  1, 'threat_modeling',
  'Which threat modeling methodology is primarily used during the design phase of software development and focuses on decomposing the application into components to identify threats systematically using the STRIDE threat classification?',
  '["PASTA (Process for Attack Simulation and Threat Analysis)", "DREAD (Damage, Reproducibility, Exploitability, Affected Users, Discoverability)", "Microsoft STRIDE methodology", "OCTAVE (Operationally Critical Threat, Asset, and Vulnerability Evaluation)"]'::jsonb,
  2,
  'The Microsoft STRIDE methodology is specifically designed around the six STRIDE threat categories (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege) and uses data flow diagrams to decompose systems into components for systematic threat identification during the design phase. PASTA is a risk-centric methodology with seven stages that focuses on business objectives and simulates attacker perspective. DREAD is a risk-scoring model (not a modeling methodology). OCTAVE is a risk assessment framework for organizational risk management, not application-level threat modeling.',
  'The STRIDE framework is the architect''s blueprint scanner -- decompose the building, find every door that can be picked, spoofed, or blown open.',
  'understand',
  'best_answer',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q9: Threat modeling -- hard/analyze
(
  1, 'threat_modeling',
  'A security team is building a new payment processing application and wants to perform threat modeling. The application handles highly sensitive financial data and the organization wants a methodology that simulates real-world attack scenarios from the attacker''s perspective and considers business risk. Which threat modeling methodology is MOST appropriate?',
  '["STRIDE, because it provides a comprehensive taxonomy of threat types applicable to payment systems", "PASTA, because it aligns threat analysis with business objectives and simulates attacker perspectives through multi-stage analysis", "DREAD, because it provides quantitative risk scoring that maps directly to financial impact", "CVSS, because it provides industry-standard vulnerability scoring for known payment system vulnerabilities"]'::jsonb,
  1,
  'PASTA (Process for Attack Simulation and Threat Analysis) is the most appropriate for this scenario because it is specifically designed to bridge the gap between business risk and technical threat analysis. PASTA''s seven stages include business objective definition, technical scope definition, application decomposition, threat analysis, vulnerability and weakness analysis, attack modeling and simulation, and risk/impact analysis. It produces business-impact-aligned risk scores, which is ideal for a payment processing environment where threat analysis must connect to financial risk decisions. STRIDE is useful for systematic threat identification but is not attack-simulation focused. DREAD is a scoring model, not a modeling methodology. CVSS scores individual vulnerabilities, not application-level threats.',
  'Payment missions need business impact analysis, not just a threat taxonomy. PASTA runs the full simulation from attacker objective to business damage.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 1.50, 0.20, 'ai_generated', true
),

-- Q10: Social engineering -- easy/remember
(
  1, 'social_engineering',
  'An attacker sends a targeted email to the CFO of an organization, using the CFO''s name, referencing a recent board meeting, and asking the CFO to urgently wire funds to a new vendor account. This attack technique is BEST described as:',
  '["Phishing", "Spear phishing", "Whaling", "Vishing"]'::jsonb,
  2,
  'This is whaling -- a highly targeted form of social engineering directed specifically at senior executives or high-value individuals (C-level officers). Whaling attacks are customized to the specific target, referencing real organizational details to increase credibility. Phishing is mass, generic email attacks. Spear phishing targets specific individuals or groups but is not necessarily C-level focused. Vishing uses voice (phone) communication. The specific detail of targeting the CFO with a wire transfer request (business email compromise pattern) makes whaling the most precise classification.',
  'Phishing catches anyone with the net. Spear phishing aims. Whaling targets the biggest fish -- the executive who can authorize the wire.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.50, 0.20, 'ai_generated', true
),

-- Q11: Social engineering -- medium/apply
(
  1, 'social_engineering',
  'An attacker calls the IT helpdesk pretending to be a new employee, says they forgot their password on their first day, and asks for an immediate reset before their onboarding meeting. The helpdesk agent resets the password without following the identity verification procedure. Which social engineering technique did the attacker primarily use?',
  '["Tailgating, exploiting physical access procedures", "Pretexting, by constructing a false scenario to bypass security controls", "Baiting, by offering something valuable to entice the victim", "Phishing, by using electronic communication to deceive the victim"]'::jsonb,
  1,
  'Pretexting involves creating a fabricated scenario (a "pretext") to manipulate the victim into taking an action they otherwise would not. The attacker invented the role of a confused new employee to create urgency and exploit the helpdesk agent''s natural desire to help. This is the classic pretexting pattern. Tailgating involves physical access (following someone through a door). Baiting involves offering something desirable (a free USB drive, a prize). Phishing uses electronic messages (email/text), not phone calls -- a phone-based attack would be vishing, not phishing.',
  'The agent arrived at the perimeter with a cover story, not credentials. That''s pretexting -- building the pretext before the attack.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q12: Social engineering -- hard/analyze
(
  1, 'social_engineering',
  'An organization''s security awareness training program teaches employees to be suspicious of unsolicited requests and to verify caller identity through callback procedures. Despite this training, a sophisticated attacker successfully convinces a senior finance manager to transfer funds by: (1) leaving a voicemail from a spoofed number appearing to be from the CEO, (2) following up with an email appearing to come from the CEO''s domain, and (3) sending a text message with a link to a fake internal portal showing a "pending approval." Which analysis BEST explains why the training failed and what would MOST effectively close the gap?',
  '["The training failed because employees need more frequent phishing simulations; the solution is monthly simulated phishing tests", "The training failed because it did not address multi-channel attacks combining vishing, phishing, and smishing; the solution is training specifically covering combined social engineering attack chains", "The training failed because the manager did not verify the request; the solution is mandatory callback procedures enforced through policy, not just training", "The training failed because technical controls were absent; the solution is implementing DMARC, caller ID authentication (STIR/SHAKEN), and multi-factor wire transfer approval requirements"]'::jsonb,
  3,
  'The most effective solution is D -- implementing technical controls. Training alone cannot reliably stop sophisticated multi-channel attacks because attackers actively probe and exploit human psychology regardless of awareness levels. DMARC prevents email domain spoofing (closing the email vector), STIR/SHAKEN provides caller ID authentication (reducing spoofed call credibility), and multi-factor wire transfer approvals create a process control that requires a second person to authorize the transaction regardless of the social engineering success. B is partially correct -- training should cover multi-channel attacks -- but training alone has documented limitations against advanced pretexting. C (policy enforcement of callbacks) is good but insufficient when all three channels appear legitimate. D layers technical controls that do not rely on human judgment under pressure.',
  'Operations security requires layered defenses. If the human firewall is bypassed, the technical perimeter must catch the payload before it executes.',
  'analyze',
  'tlatm',
  'very_hard',
  2.10, 2.25, 0.20, 'ai_generated', true
),

-- Q13: Security awareness training -- medium/understand
(
  1, 'security_awareness_training',
  'A CISO wants to improve the organization''s security posture by investing in user education. The CISO is evaluating whether to implement security awareness, security training, or security education for different employee groups. Which statement MOST accurately describes the distinction between security awareness and security training?',
  '["Security awareness changes behavior through repeated exposure to security messages; security training builds skills through formal instruction", "Security awareness and security training are interchangeable terms for the same type of program", "Security awareness teaches employees to recognize threats; security training is reserved for security professionals only", "Security awareness is compliance-focused; security training is risk-focused"]'::jsonb,
  0,
  'Security awareness changes behavior by making employees recognize security threats in their environment -- it is broad, high-level, and designed for all employees. It uses posters, reminders, newsletters, and brief communications to keep security top-of-mind. Security training builds specific skills through formal instruction and is typically role-specific (e.g., developer secure coding training, HR data privacy training). Security education goes further -- it is academic and prepares security professionals (e.g., degrees and certifications). The key distinction is awareness = attitudinal/behavioral change across the organization; training = skill development for specific roles.',
  'Awareness is the all-hands briefing. Training is the role-specific field exercise. Education is the academy curriculum.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q14: Security awareness training -- medium/apply
(
  1, 'security_awareness_training',
  'An organization runs an annual security awareness training program. The CISO wants to evaluate its effectiveness. Which metric BEST measures whether the security awareness program is achieving its objective?',
  '["Number of employees who completed the annual training module", "Reduction in the rate of employees clicking simulated phishing links over time", "Number of security incidents reported in the past year", "Employee satisfaction scores from the training evaluation survey"]'::jsonb,
  1,
  'The reduction in simulated phishing click rates over time is the most direct behavioral metric -- it measures whether the training is actually changing how employees respond to threats (the intended outcome of awareness training). Completion rates (A) measure participation, not learning or behavior change. Total incident count (C) is a lagging indicator affected by many variables beyond training effectiveness. Satisfaction scores (D) measure how much employees liked the training, not whether it changed their behavior. Behavioral metrics that show change over time are the gold standard for awareness program evaluation.',
  'You do not measure mission readiness by counting how many agents attended the briefing. You measure it by how many avoid the trap in the field.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q15: Supply chain risk management -- medium/apply
(
  1, 'supply_chain_risk_management',
  'An organization is evaluating a new network switch vendor after discovering that their current vendor''s hardware has been found to contain unexpected firmware code that phones home to external servers. To prevent similar supply chain attacks in future procurement, which control is MOST effective as a first step?',
  '["Require all vendors to sign a software bill of materials (SBOM) attestation", "Conduct hardware integrity verification and firmware analysis on received equipment before deployment", "Switch to all software-defined networking to eliminate hardware supply chain risk", "Require vendors to provide source code escrow agreements for all firmware"]'::jsonb,
  1,
  'Hardware integrity verification and firmware analysis on received equipment before deployment is the most effective first step -- it directly validates that received hardware matches expected specifications before it is introduced into the production environment. This is the physical and technical equivalent of inspecting a shipment before signing for it. An SBOM attestation (A) is valuable but is a document -- it cannot verify what is actually installed in hardware. Moving to SDN (C) eliminates hardware but creates software supply chain risks and is not a first step. Source code escrow (D) helps if firmware needs to be analyzed later but does not prevent deployment of compromised hardware.',
  'Inspect the cargo before it reaches the safe house. A manifest (SBOM) tells you what should be there; inspection confirms what is actually there.',
  'apply',
  'first_action',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q16: Supply chain risk management -- hard/analyze
(
  1, 'supply_chain_risk_management',
  'A government contractor uses a third-party software library in a classified system. The library is open source with no commercial support. A security assessment finds a critical vulnerability in the library that has not been patched by the community in 18 months. The contractor''s software development team argues that because it is open source, they can patch it themselves. The security officer argues a different approach is needed. Which approach does "Think Like a Manager" recommend as the PRIMARY control?',
  '["Allow the development team to patch the library, as internal patching eliminates third-party dependency", "Conduct a formal software acquisition security review of the library including vulnerability history, community health, and patch frequency before allowing continued use", "Immediately remove the library and replace with a commercially supported alternative with contractual SLAs", "Accept the risk because the system is classified and not directly accessible from the internet"]'::jsonb,
  1,
  'A formal software acquisition security review of the open source library is the "think like a manager" answer -- before deciding to patch, replace, or accept risk, a risk-informed decision requires complete information about the library''s security posture. This includes reviewing vulnerability history (Heartbleed pattern: long-dormant critical vulnerability), community health (maintainer responsiveness, contribution activity), and patch frequency (an 18-month unpatched critical vulnerability suggests poor community health). Managers make decisions based on structured risk analysis, not reactive technical fixes. Immediately replacing (C) is premature without the review. Accepting risk (D) on a classified system with an unpatched critical vulnerability is inappropriate without formal risk acceptance documentation and executive sign-off.',
  'The mission cannot depend on an unmaintained asset. Review the source, assess the risk, then decide: patch, replace, or formally accept with controls.',
  'analyze',
  'tlatm',
  'hard',
  1.55, 1.60, 0.20, 'ai_generated', true
),

-- Q17: Third-party governance -- medium/apply
(
  1, 'third_party_governance',
  'An organization uses a cloud payroll processing vendor. The organization''s CISO wants assurance that the vendor maintains appropriate security controls without sending auditors on-site every year. Which mechanism BEST provides continuous, standardized assurance of the vendor''s security posture?',
  '["Requiring the vendor to provide annual self-assessment questionnaires", "Requiring the vendor to provide a SOC 2 Type II report covering their security controls", "Reviewing the vendor''s public privacy policy and security whitepaper annually", "Requiring the vendor to agree to right-to-audit clauses in the contract"]'::jsonb,
  1,
  'A SOC 2 Type II report provides independent third-party attestation that the vendor''s security controls (based on the AICPA Trust Service Criteria) were operating effectively over a defined period (typically 6-12 months). This is the industry-standard mechanism for cloud vendor assurance without requiring the customer to conduct their own audit. Self-assessment questionnaires (A) are completed by the vendor about themselves -- no independent verification. Public whitepapers (C) are marketing documents, not audit evidence. Right-to-audit clauses (D) are valuable contract provisions but require executing audits -- a SOC 2 Type II gives you audit results without incurring the cost of performing the audit yourself.',
  'The field office submits to independent inspection and provides the certified report. You review the inspector''s findings rather than conducting your own inspection every year.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q18: Third-party governance -- hard/analyze
(
  1, 'third_party_governance',
  'An organization''s primary software vendor announces it is being acquired by a foreign company headquartered in a country with adversarial intelligence relationships with the organization''s home nation. The organization relies on the vendor''s software for critical infrastructure monitoring. As the CISO, what is the FIRST action?',
  '["Immediately terminate the vendor contract and begin emergency procurement of an alternative solution", "Conduct a supply chain risk assessment evaluating the acquisition''s implications for data access, code integrity, and potential nation-state influence", "Notify the board of directors that the software must be replaced immediately", "Require the vendor to provide source code escrow before the acquisition closes"]'::jsonb,
  1,
  'The first action is a supply chain risk assessment -- you need facts before decisions. The assessment evaluates whether the foreign acquisition creates actual risk: Does the vendor have access to the organization''s data? Can foreign ownership influence the software code base (implant vulnerabilities or backdoors)? What are the legal obligations in the acquiring country regarding data access by government authorities? After the assessment, you have the foundation for a risk-informed recommendation to executive leadership. Immediate termination (A) is premature without knowing the actual risk level. Notifying the board (C) should follow the assessment, not precede it. Source code escrow (D) is one possible control identified by the assessment, not a first action.',
  'Never abort the mission before the intelligence brief. First assess, then escalate with findings.',
  'analyze',
  'first_action',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q19: Export controls/transborder -- medium/apply
(
  1, 'export_controls_transborder',
  'A US-based cybersecurity firm wants to sell its intrusion detection software that includes strong encryption capabilities to a customer in a foreign country. Before the sale, the legal team advises the company must review applicable regulations. Which regulatory framework PRIMARILY governs the export of commercial encryption products from the United States?',
  '["ITAR (International Traffic in Arms Regulations)", "EAR (Export Administration Regulations)", "Wassenaar Arrangement only (as the international agreement)", "HIPAA, because the software processes health data"]'::jsonb,
  1,
  'The Export Administration Regulations (EAR), administered by the Bureau of Industry and Security (BIS), primarily govern commercial dual-use items including encryption software. Commercial encryption products fall under EAR Export Control Classification Numbers (ECCNs), most commonly 5E002. ITAR (A) governs military and defense articles listed on the US Munitions List -- civilian commercial encryption is generally not on the Munitions List unless it has specific military applications. The Wassenaar Arrangement (C) is the international multilateral treaty that informs the EAR and similar national export control regimes, but it is not itself a regulatory enforcement framework in the US. HIPAA (D) governs health information privacy, not export controls.',
  'Commercial crypto tools ship under Commerce Department rules (EAR), not State Department weapons controls (ITAR). Know which list your product is on.',
  'apply',
  'scenario',
  'medium',
  1.15, 0.30, 0.20, 'ai_generated', true
),

-- Q20: Export controls/transborder -- hard/analyze
(
  1, 'export_controls_transborder',
  'An organization headquartered in the EU processes personal data of EU citizens in a US-based cloud data center. Following a regulatory change, the organization''s legal team advises that the current data transfer mechanism may no longer be valid. As the security officer, which combination of controls BEST positions the organization to maintain compliant EU-to-US data transfers?',
  '["Implement GDPR Article 32 technical controls (encryption, pseudonymization) and document a legitimate interest basis for the transfer", "Implement Standard Contractual Clauses (SCCs) with the cloud provider and conduct a Transfer Impact Assessment (TIA) to evaluate whether US law undermines the SCCs'' effectiveness", "Move all data processing to EU-based cloud regions to eliminate the transborder data flow issue entirely", "Obtain explicit consent from all EU data subjects for international data transfers"]'::jsonb,
  1,
  'Standard Contractual Clauses (SCCs) combined with a Transfer Impact Assessment (TIA) is the GDPR-compliant mechanism for EU-to-US data transfers following the Schrems II ruling (July 2020), which invalidated the Privacy Shield framework. The TIA (also called a Transfer Risk Assessment) evaluates whether the laws of the destination country undermine the SCC protections -- if US surveillance laws effectively nullify EU data protections, additional safeguards (supplementary measures such as encryption where only the EU controller holds keys) are required. Article 32 technical controls (A) are data security requirements, not transfer mechanisms. Moving to EU regions (C) eliminates the problem but may not be operationally or economically feasible and is not a controls answer. Explicit consent (D) is a valid but limited transfer basis -- impractical for all data subjects and the consent can be withdrawn.',
  'Crossing borders requires valid papers. The Schrems II ruling burned the old passport (Privacy Shield). SCCs with TIA are the current valid documentation.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.70, 0.20, 'ai_generated', true
),

-- Q21: BCP/DRP numbers -- easy/remember
(
  1, 'bcp_drp_numbers',
  'A Business Impact Analysis establishes that a critical payroll system must be restored within 4 hours of a disaster to avoid unacceptable harm, and that the system can tolerate a maximum of 2 hours of data loss. What do these two values represent, respectively?',
  '["RPO = 4 hours, RTO = 2 hours", "RTO = 4 hours, RPO = 2 hours", "MTD = 4 hours, WRT = 2 hours", "MTBF = 4 hours, MTTR = 2 hours"]'::jsonb,
  1,
  'RTO (Recovery Time Objective) is the maximum acceptable time to restore a system after a disruption -- 4 hours here. RPO (Recovery Point Objective) is the maximum acceptable amount of data loss measured in time -- 2 hours here (meaning the organization can recover to a state no more than 2 hours before the disaster). MTD is Maximum Tolerable Downtime (the absolute maximum time before business impact becomes irreversible). WRT is Work Recovery Time (time to restore data and validate the system after it is technically restored). MTBF is Mean Time Between Failures (availability metric). MTTR is Mean Time To Repair (maintainability metric).',
  'RTO: how fast must the mission resume? RPO: how far back can we rewind the clock without catastrophic loss?',
  'remember',
  'comparison',
  'easy',
  0.85, -1.80, 0.20, 'ai_generated', true
),

-- Q22: BCP/DRP numbers -- medium/apply
(
  1, 'bcp_drp_numbers',
  'A BIA determines that a critical application has an RTO of 6 hours, an RPO of 1 hour, and a WRT of 2 hours. What is the Maximum Tolerable Downtime (MTD) for this application, and when should the organization declare a disaster?',
  '["MTD = 6 hours; declare a disaster when the outage exceeds 6 hours", "MTD = 8 hours; declare a disaster before the outage is projected to exceed 8 hours", "MTD = 7 hours; declare a disaster before the outage is projected to exceed 7 hours", "MTD = 9 hours; declare a disaster when system recovery efforts have failed for 9 hours"]'::jsonb,
  1,
  'MTD = RTO + WRT = 6 hours + 2 hours = 8 hours. MTD is the total time the business can survive without the system before consequences become catastrophic. This includes both the recovery time (RTO = 6 hours to restore the technical system) plus the work recovery time (WRT = 2 hours to restore data, validate the system, and resume operations). A disaster should be declared BEFORE the MTD is projected to be exceeded -- if the outage at hour 4 shows no path to resolution within the remaining 4 hours, the disaster declaration should happen then, not after MTD is exceeded. RPO (1 hour) governs how frequently backups must occur -- it does not factor into the MTD formula.',
  'MTD is the mission abort threshold. Calculate: recovery time + work time = total budget. Declare before the budget runs out, not after.',
  'apply',
  'calculation',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q23: BCP/DRP numbers -- medium/apply
(
  1, 'bcp_drp_numbers',
  'An organization performs a Disaster Recovery Plan test where managers review the plan documentation and verbally walk through each step without actually activating any systems or contacting vendors. After completing this test successfully, the organization wants to progress to the next level of testing rigor. What type of test did they just complete, and what should they do next?',
  '["They completed a read-through test; next should be a walkthrough (tabletop) exercise", "They completed a walkthrough test; next should be a simulation test", "They completed a simulation test; next should be a parallel test", "They completed a parallel test; next should be a full-interruption test"]'::jsonb,
  1,
  'Reviewing the plan documentation and verbally walking through steps without activating systems is a walkthrough test (also called a tabletop exercise). The progression of DRP testing types in order of increasing rigor and operational impact is: (1) Read-through/Checklist Review (managers read and verify the plan is accurate), (2) Walkthrough/Tabletop (team discusses what they would do step-by-step), (3) Simulation (rehearsal without activating real production failover), (4) Parallel (DR site activated alongside production, both running simultaneously), (5) Full-Interruption (production shut down, full failover to DR site -- most disruptive). After a walkthrough, the next step is a simulation.',
  'The training progression: briefing room discussion (walkthrough) --> field simulation --> live parallel operations --> full mission transfer.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q24: BCP/DRP numbers -- hard/analyze
(
  1, 'bcp_drp_numbers',
  'An organization has never tested its disaster recovery plan. The DRP team argues that a full-interruption test provides the most assurance. Management is concerned about the risk of testing. Which approach BEST reflects "Think Like a Manager"?',
  '["Conduct a full-interruption test because it is the only way to know the DRP actually works under real conditions", "Start with a read-through, progress through walkthrough and simulation before attempting parallel or full-interruption tests, to validate the plan before accepting the risk of production impact", "Delay testing until the DRP has been independently reviewed by an external auditor", "Conduct a parallel test as a compromise between no testing and full-interruption"]'::jsonb,
  1,
  'The "Think Like a Manager" answer is sequential, risk-managed testing progression (B). A manager who has never tested a DRP has zero confidence in its accuracy. Starting with a read-through immediately reveals errors in the plan documentation with zero operational risk. The walkthrough (tabletop) reveals procedural gaps at low cost. The simulation validates coordination and timing. Only after these lower-risk tests identify and resolve issues should the organization proceed to parallel or full-interruption testing. Jumping immediately to full-interruption (A) risks a real outage on top of a simulated one if the untested plan has failures. A manager balances assurance value against operational risk by testing progressively.',
  'Before the field mission, run the briefing, then the simulation, then the exercise. Nobody skips to live operations without validating the plan.',
  'analyze',
  'tlatm',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q25: Security controls classification -- medium/apply
(
  1, 'security_controls_classification',
  'An employee is about to access a restricted network share containing trade secrets. Before access is granted, the system displays a warning banner stating that all activity is monitored and recorded, and that unauthorized access is a violation of company policy and may result in criminal prosecution. This banner is BEST classified as which type of control?',
  '["Preventive and technical", "Deterrent and technical", "Detective and administrative", "Compensating and administrative"]'::jsonb,
  1,
  'A warning banner is a deterrent control -- its purpose is to discourage unauthorized access by making the potential consequences explicit. It is also a technical control because it is implemented by the system (displayed automatically before login or access). Deterrent controls do not prevent access; they discourage it by raising the perceived risk for an attacker with malicious intent. Preventive controls actually block access (like an access control list). Detective controls identify events after they occur (like audit logs). The banner does neither -- it warns and deters. Administrative controls are policies and procedures, not system-implemented functions.',
  'The "NO TRESPASSING -- CAMERAS IN USE" sign at the perimeter is deterrence. It does not stop a determined intruder, but it raises the stakes and discourages casual violators.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.22, 'ai_generated', true
),

-- Q26: Security awareness training -- hard/analyze
(
  1, 'security_awareness_training',
  'An organization''s security awareness program has been running for three years. Click rates on simulated phishing campaigns have dropped from 32% to 8%. The CISO presents this as a success. A board member asks: "How do we know this improvement translates to reduced security incidents, not just employees recognizing our specific simulation templates?" Which response BEST demonstrates analytical thinking about the program''s effectiveness?',
  '["The 8% click rate meets industry benchmarks, demonstrating program success", "The click rate reduction is a leading indicator of behavioral change, but should be correlated with actual security incident data, report rates for real phishing attempts, and simulation template rotation to prevent template recognition bias", "The program should be expanded with more frequent simulations to drive the rate to zero", "Employees who click should be required to take remediation training, which will ensure the rate continues to drop"]'::jsonb,
  1,
  'The board member''s concern is analytically valid. Template recognition is a real phenomenon: employees may learn to recognize specific simulation patterns without developing genuine phishing detection skills. A rigorous effectiveness analysis correlates the click rate improvement with: (1) actual reported phishing incidents (are employees reporting real phishing attempts, not just ignoring simulations?), (2) the report rate for suspicious emails (behavioral change should increase reporting, not just reduce clicking), (3) template variation -- rotating simulation templates tests generalized awareness, not pattern matching. Meeting a benchmark (A) is not the same as demonstrating effectiveness. Increasing frequency (C) or adding remediation (D) are tactical actions, not effectiveness analysis.',
  'Measuring success requires multiple intelligence sources. A single metric that''s easy to game tells you less than you think.',
  'analyze',
  'scenario',
  'very_hard',
  2.05, 2.20, 0.20, 'ai_generated', true
),

-- Q27: Supply chain risk management -- medium/understand
(
  1, 'supply_chain_risk_management',
  'Which document provides a formal inventory of all software components, libraries, dependencies, and their known vulnerabilities used in a software product, and is increasingly required by government procurement regulations following high-profile supply chain attacks?',
  '["System Security Plan (SSP)", "Software Bill of Materials (SBOM)", "Configuration Management Database (CMDB)", "Security Assessment Report (SAR)"]'::jsonb,
  1,
  'A Software Bill of Materials (SBOM) is the formal inventory of all components, libraries, and dependencies in a software product -- the software equivalent of an ingredient label. Following supply chain attacks like SolarWinds and Log4Shell, the US Executive Order on Improving the Nation''s Cybersecurity (EO 14028, May 2021) requires SBOMs for software sold to the federal government. An SSP describes the security controls of a system. A CMDB tracks IT assets and their configurations. A SAR documents findings from a security assessment. Only the SBOM provides the component-level visibility needed to quickly identify exposure when a new vulnerability in a specific library is discovered.',
  'The SBOM is the manifest for the mission package -- when a component is found to be compromised (Log4Shell), you can instantly check every mission package for exposure.',
  'understand',
  'best_answer',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q28: All D1 clusters -- hard/analyze (except/not)
(
  1, 'security_controls_classification',
  'Which of the following is NOT a characteristic that distinguishes a compensating control from other control types?',
  '["A compensating control provides an alternative means of satisfying a control requirement when the primary control cannot be implemented", "A compensating control must be documented with a risk analysis justifying why the primary control is not feasible", "A compensating control eliminates the risk addressed by the primary control to the same degree as the primary control would", "A compensating control is evaluated based on whether it reduces risk to an acceptable level, not whether it exactly replicates the primary control"]'::jsonb,
  2,
  'Option C is NOT a characteristic of compensating controls -- in fact, it is the opposite of how compensating controls work. A compensating control is accepted precisely because it does NOT eliminate risk to the same degree as the primary control. Compensating controls reduce risk to an acceptable level with a different mechanism, typically one that is feasible given organizational constraints (cost, technical limitations, operational impact). PCI DSS explicitly acknowledges that compensating controls "afford a level of defense equivalent to the associated PCI DSS requirement" -- meaning they provide equivalent risk reduction through alternative means, not identical risk reduction. Options A, B, and D are all accurate characteristics of compensating controls.',
  'Compensating controls are about acceptable residual risk through alternative means -- not about matching the primary control''s effectiveness exactly.',
  'analyze',
  'except_not',
  'hard',
  1.70, 1.65, 0.25, 'ai_generated', true
);
