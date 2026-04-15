-- Domain 1: Security and Risk Management — Concept Analogies
-- Insert into concept_analogies table for every Domain 1 analogy

INSERT INTO concept_analogies (concept_name, analogy_name, analogy_description, npc_owner, domain_number, scene_id_introduced, image_reference) VALUES

-- Act 1 Analogies
('CIA Triad', 'Three Vault Locks', 'Every system is a vault with three locks: Confidentiality (who can see it?), Integrity (has it been changed?), Availability (can I use it?). If any lock fails, the vault is compromised.', 'morales', 1, 'd1a1s2', 'three-vault-locks'),

('DAD Triad', 'CIA''s Evil Twin', 'For every CIA lock, there is a lockpick: Disclosure breaks Confidentiality, Alteration breaks Integrity, Destruction breaks Availability.', 'janet', 1, 'd1a1s3', NULL),

('Security Governance', 'City Blueprint', 'Security governance is like a city blueprint: Policies = Constitution, Standards = Building Codes, Procedures = Construction Manuals, Guidelines = Best Practices, Baselines = Minimum Foundation.', 'reeves', 1, 'd1a1s4', NULL),

('Org Roles', 'Hospital Staff Hierarchy', 'Organizational roles mapped to hospital: CEO = Hospital Director, CISO = Chief of Medicine, Asset Owner = Department Head, Custodian = Nurse, User = Patient, Auditor = Health Inspector.', 'reeves', 1, 'd1a1s5', NULL),

('Accountability vs Responsibility', 'Captain and Crew', 'The captain goes down with the ship (accountability cannot be delegated). The crew handles tasks (responsibility can be delegated). Only one captain, many crew.', 'reeves', 1, 'd1a1s5', NULL),

('Risk Concepts', 'Weather Forecast', 'Risk is like weather: Threat = Storm, Vulnerability = Leaky Roof, Risk = Storm + Leaky Roof, Control = Umbrella/Repair, Impact = How Wet You Get.', 'janet', 1, 'd1a1s6', NULL),

('Types of Controls', 'Building Security Layers', 'Controls are building security layers: Administrative (policies), Technical (firewalls), Physical (locks). Functions: Preventive (stops), Detective (discovers), Corrective (fixes).', 'kai', 1, 'd1a1s7', 'building-security-layers'),

('AAA Services', 'Airport Security Checkpoints', 'AAA is like airport security: Identification = Show Ticket (claim), Authentication = Show Passport (prove), Authorization = Board Flight (access), Auditing = Cameras (monitor), Accounting = Manifest (log).', 'morales', 1, 'd1a1s8', NULL),

('ISC2 Ethics', 'Agent''s Oath', 'Four canons in priority order like an agent''s oath: 1) Protect Society, 2) Act Honorably, 3) Serve Principals, 4) Advance the Profession. Society always comes first.', 'reeves', 1, 'd1a1s9', NULL),

('Compliance vs Security', 'Speed Limit vs Safe Driving', 'Compliance is like the speed limit (minimum legal requirement). Security is safe driving (adjusting for conditions). You can follow the speed limit and still crash in a storm.', 'kai', 1, 'd1a1s10', NULL),

('NIST RMF', 'GPS Navigation', 'NIST RMF 7 steps are like GPS navigation: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. Mnemonic: Please Can Someone Install An Awesome Monitor.', 'janet', 1, 'd1a1s10', NULL),

('Risk Registers', 'Doctor''s Dashboard', 'A risk register is like a doctor''s dashboard tracking all known conditions: risk ID, description, likelihood, impact, treatment plan, owner.', 'reeves', 1, 'd1a1s11', NULL),

('Due Diligence vs Due Care', 'Home Inspection vs Maintenance', 'Due Diligence = home inspection before buying (research, document, plan — "detect"). Due Care = ongoing maintenance after purchase (act responsibly, fix things — "correct"). Missing either = negligence.', 'reeves', 1, 'd1a1s11', NULL),

-- Act 2 Analogies
('Quantitative Risk Analysis', 'Insurance Math', 'Insurance companies do risk math: AV = asset worth, EF = damage %, SLE = AV × EF (one incident cost), ARO = frequency/year, ALE = SLE × ARO (annual cost).', 'janet', 1, 'd1a2s2', 'insurance-math'),

('Qualitative Risk Analysis', 'Restaurant Star Ratings', 'Qualitative analysis is like star ratings: subjective, fast, uses expert judgment. No exact dollars, just Low/Medium/High/Critical rankings. Best when lacking hard data.', 'kai', 1, 'd1a2s3', 'restaurant-star-ratings'),

('Risk Treatment', 'Flood Insurance Choices', 'Four risk treatments are like flood zone choices: Avoid = move to higher ground, Transfer = buy insurance, Mitigate = build a levee, Accept = stay and accept it.', 'reeves', 1, 'd1a2s4', 'flood-insurance-choices'),

('Cost-Benefit Analysis', 'Home Alarm ROI', 'CBA is like deciding on a home alarm: Value = ALE(before) - ALE(after) - Annual Cost. Positive = worth the investment. Negative = too expensive for the risk reduction.', 'janet', 1, 'd1a2s5', NULL),

('Intellectual Property', 'Creative Protection Toolkit', 'Four IP protection tools: Trade Secret = secret recipe (infinite, no disclosure), Patent = registered invention (20 years, must disclose), Copyright = creative work (life+70), Trademark = brand mark (infinite with renewal).', 'reeves', 1, 'd1a2s6', 'creative-protection-toolkit'),

('Privacy Laws', 'Global Privacy Passport', 'Privacy regulations are like a global passport — different countries, different rules. GDPR = 72-hour notification, HIPAA = healthcare, CCPA = California consumers, GLBA = financial.', 'reeves', 1, 'd1a2s7', NULL),

('OECD Privacy Guidelines', 'Privacy Bill of Rights', 'OECD 8 principles are the foundation for most privacy laws: Collection Limitation, Data Quality, Purpose Specification, Use Limitation, Security Safeguards, Openness, Individual Participation, Accountability.', 'reeves', 1, 'd1a2s7', NULL),

('Security Doc Hierarchy', 'Government Hierarchy', 'Three policy levels like government: Overarching = Constitution (strategic), Functional = State Laws (area-specific), System-Specific = Local Ordinances (particular systems).', 'reeves', 1, 'd1a2s9', NULL),

('Scoping and Tailoring', 'Tailored Suit', 'Scoping = picking which suits to try on (which controls apply). Tailoring = getting them altered to fit (customizing to your environment). Scope first, then tailor.', 'reeves', 1, 'd1a2s9', NULL),

('Social Engineering', 'Con Artist Playbook', 'Social engineering attacks by scale: Phishing = wide net, Spear Phishing = targeted individual, Whaling = big fish (executives). Also: Vishing (voice), Smishing (SMS), Pretexting (false scenario).', 'kai', 1, 'd1a2s10', NULL),

('PIA/DPIA', 'Environmental Impact Study', 'Privacy impact assessments are like environmental impact studies — assess the impact BEFORE you build. DPIA required under GDPR when processing poses high risk to individuals.', 'reeves', 1, 'd1a2s11', NULL),

('PDCA Cycle', 'Training Montage Loop', 'PDCA is like a training montage: Plan (design the regimen), Do (train), Check (test performance), Act (refine approach). Continuous improvement loop.', 'kai', 1, 'd1a2s11', NULL),

-- Act 4 Analogies
('BCP/BIA', 'Restaurant Kitchen Fire', 'BCP is like a restaurant fire: BCP = keep the restaurant open (outdoor seating), DRP = rebuild the kitchen (restore IT), BIA = identify which dishes make the money (critical functions).', 'janet', 1, 'd1a4s2', 'restaurant-kitchen-fire'),

('Recovery Metrics', 'Restaurant Kitchen Fire', 'Recovery timelines during a kitchen fire: MTD = max time restaurant survives without kitchen, RTO = how fast to fix equipment, RPO = how much food prep data you can lose, WRT = restocking and testing time. RTO + WRT ≤ MTD.', 'janet', 1, 'd1a4s2', NULL),

('Personnel Security', 'Bank Teller Safeguards', 'Banks have centuries of insider threat experience: background checks, mandatory vacations (detective), job rotation (cross-train + detect fraud), separation of duties (preventive), immediate revocation on termination.', 'morales', 1, 'd1a4s3', NULL),

('Security Awareness Training', 'Fire Drill Culture', 'Three tiers like fire safety: Awareness = fire safety posters (everyone), Training = how to use extinguisher (specific roles), Education = fire science degree (security professionals).', 'kai', 1, 'd1a4s4', NULL),

('Threat Modeling', 'Crime Scene Profiling', 'Three profiling methods: STRIDE = categorize threat types (6 categories), PASTA = full 7-stage process (most thorough), DREAD = score severity 1-10 (prioritize threats).', 'janet', 1, 'd1a4s5', 'crime-scene-profiling'),

('Supply Chain Risk', 'Farm-to-Table Audit', 'Supply chain is farm-to-table: every link is a contamination point. Third-party assessment = farm inspection, SLA = supply contract, right-to-audit = surprise inspection, fourth-party = the farm''s farm.', 'reeves', 1, 'd1a4s6', NULL),

('Third-Party Governance', 'Restaurant Health Inspection', 'Third-party governance is like health inspections: regular audits, compliance verification, right-to-audit clauses. Accountability stays with the restaurant (you), never the supplier.', 'reeves', 1, 'd1a4s6', NULL),

('Separation of Duties', 'Bank Teller Safeguards', 'SoD at a bank: one teller processes deposits, another verifies, manager approves large amounts. No single person controls the entire transaction. Preventive control.', 'morales', 1, 'd1a4s7', NULL),

('Least Privilege', 'Bank Teller Safeguards', 'Least privilege at a bank: teller accesses their drawer only, not the vault, not other drawers. Only the minimum access needed to perform the job function.', 'morales', 1, 'd1a4s7', NULL),

('Investigation Types', 'Court System Tiers', 'Four investigation types like court levels: Administrative = internal HR (>50%), Civil = lawsuits (>50%), Criminal = prosecution (beyond reasonable doubt ~99%), Regulatory = agency compliance checks.', 'morales', 1, 'd1a4s8', NULL),

('Import/Export Controls', 'Customs Checkpoint', 'Export controls are customs checkpoints: EAR = general commerce controls, ITAR = arms/defense controls, Wassenaar = multilateral dual-use controls. Encryption can be classified as munition.', 'reeves', 1, 'd1a4s8', NULL),

('Security Frameworks', 'Tool Belt Selection', 'Frameworks are like tools on a belt: ISO 27001/27002 = Swiss Army knife (standard compliance), COBIT = governance wrench (business-IT alignment), SABSA = architectural blueprint tool (enterprise architecture).', 'janet', 1, 'd1a4s9', 'tool-belt-selection'),

('Transborder Data', 'International Shipping Lanes', 'Transborder data flow is like international shipping: data localization = port restrictions, SCCs = shipping contracts, BCRs = company-wide shipping rules, EU-US Framework = trade agreement.', 'reeves', 1, 'd1a4s10', NULL),

('M&A Security', 'House Merger Inspection', 'M&A security is like inspecting a house before merging households: assess security posture, data classification, compliance status, vulnerabilities, personnel risks. Findings affect the deal terms.', 'reeves', 1, 'd1a4s10', NULL),

('Employee Duress', 'Silent Alarm', 'Duress protection is like a bank teller''s silent alarm: a covert signal that alerts security while appearing to comply with the attacker. Protect the employee, catch the threat.', 'morales', 1, 'd1a4s11', NULL),

('NCA/NDA', 'Pinky Promise Levels', 'Legal agreements are tiered promises: NDA = can''t share secrets (confidentiality), NCA = can''t work for competitors (competition restriction). Both protect the organization but have legal limits on enforceability.', 'reeves', 1, 'd1a4s11', NULL),

('Risk Communication', 'Weather Alert System', 'Risk communication is like weather alerts — different audiences need different detail: Board = high-level forecast, IT Management = technical radar data, End Users = simple advisory, Regulators = official weather report.', 'reeves', 1, 'd1a4s11', NULL)
ON CONFLICT (concept_name) DO NOTHING;
