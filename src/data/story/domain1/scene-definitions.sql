-- Domain 1: Security and Risk Management — Scene Definitions
-- Insert into scene_definitions table for all 36 scenes across Acts 1, 2, and 4

-- ============================================================
-- ACT 1: The Briefing (12 scenes)
-- ============================================================

INSERT INTO scene_definitions (scene_id, domain_number, act_number, scene_order, title, description, concepts_covered, glossary_terms, library_topics, estimated_minutes, has_timed_decision, has_tlatm, scene_type, analogy_name, analogy_npc, interactive_image_type) VALUES

-- Scene 1: Narrative Setup
('d1a1s1', 1, 1, 1, 'The Shadow Protocol', 'Director Reeves briefs the team on the Nexus breach and introduces Operation Shadow Protocol.', ARRAY['Incident Response'], ARRAY['breach', 'incident', 'PII'], ARRAY['security-incidents'], 2, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: CIA Triad
('d1a1s2', 1, 1, 2, 'Three Vault Locks', 'Agent Morales teaches the CIA Triad using the Three Vault Locks analogy.', ARRAY['CIA Triad'], ARRAY['confidentiality', 'integrity', 'availability'], ARRAY['cia-triad'], 2, false, false, 'teaching', 'Three Vault Locks', 'morales', 'exploration'),

-- Scene 3: DAD Triad
('d1a1s3', 1, 1, 3, 'CIA''s Evil Twin', 'Janet Park introduces the DAD Triad as the adversarial counterpart to CIA.', ARRAY['DAD Triad'], ARRAY['disclosure', 'alteration', 'destruction'], ARRAY['dad-triad'], 1, false, false, 'teaching', 'CIA''s Evil Twin', 'janet', NULL),

-- Scene 4: Security Governance
('d1a1s4', 1, 1, 4, 'The City Blueprint', 'Director Reeves explains security governance through the City Blueprint analogy.', ARRAY['Security Governance'], ARRAY['policy', 'standard', 'procedure', 'guideline', 'baseline'], ARRAY['security-governance'], 2, false, false, 'teaching', 'City Blueprint', 'reeves', NULL),

-- Scene 5: Org Roles + Accountability vs Responsibility
('d1a1s5', 1, 1, 5, 'Hospital Staff & Captain and Crew', 'Reeves covers organizational security roles and the distinction between accountability and responsibility.', ARRAY['Org Roles', 'Accountability vs Responsibility'], ARRAY['CEO', 'CISO', 'asset owner', 'custodian', 'auditor', 'accountability', 'responsibility'], ARRAY['org-roles', 'accountability-responsibility'], 2, false, false, 'teaching', 'Hospital Staff Hierarchy', 'reeves', NULL),

-- Scene 6: Risk Concepts
('d1a1s6', 1, 1, 6, 'The Weather Forecast', 'Janet Park teaches core risk concepts using the Weather Forecast analogy.', ARRAY['Risk Concepts'], ARRAY['threat', 'vulnerability', 'risk', 'control', 'impact', 'exposure'], ARRAY['risk-concepts'], 2, false, false, 'teaching', 'Weather Forecast', 'janet', NULL),

-- Scene 7: Types of Controls
('d1a1s7', 1, 1, 7, 'Building Security Layers', 'Kai Tanaka covers control categories and functional types.', ARRAY['Types of Controls'], ARRAY['administrative control', 'technical control', 'physical control', 'preventive', 'detective', 'corrective', 'deterrent', 'compensating'], ARRAY['types-of-controls'], 2, false, false, 'teaching', 'Building Security Layers', 'kai', 'comparison'),

-- Scene 8: AAA Services
('d1a1s8', 1, 1, 8, 'Airport Security Checkpoints', 'Morales explains AAA services through the Airport Security analogy.', ARRAY['AAA Services'], ARRAY['identification', 'authentication', 'authorization', 'auditing', 'accounting'], ARRAY['aaa-services'], 2, false, false, 'teaching', 'Airport Security Checkpoints', 'morales', NULL),

-- Scene 9: ISC2 Code of Ethics
('d1a1s9', 1, 1, 9, 'The Agent''s Oath', 'Reeves presents the ISC2 Code of Ethics canons.', ARRAY['ISC2 Ethics'], ARRAY['code of ethics', 'canons', 'due care', 'public trust'], ARRAY['isc2-ethics'], 2, false, true, 'teaching', 'Agent''s Oath', 'reeves', NULL),

-- Scene 10: Compliance vs Security + NIST RMF
('d1a1s10', 1, 1, 10, 'Speed Limits & GPS Navigation', 'Kai on compliance vs security, Janet on the NIST RMF seven steps.', ARRAY['Compliance vs Security', 'NIST RMF'], ARRAY['compliance', 'security', 'NIST RMF', 'authorize to operate'], ARRAY['compliance-vs-security', 'nist-rmf'], 2, true, false, 'teaching', 'Speed Limit vs Safe Driving', 'kai', NULL),

-- Scene 11: Risk Registers + Due Diligence/Due Care
('d1a1s11', 1, 1, 11, 'Doctor''s Dashboard & Home Inspection', 'Reeves covers risk registers, due diligence, and due care.', ARRAY['Risk Registers', 'Due Diligence', 'Due Care'], ARRAY['risk register', 'risk matrix', 'due diligence', 'due care', 'negligence'], ARRAY['risk-registers', 'due-diligence-due-care'], 2, false, false, 'evidence', 'Doctor''s Dashboard', 'reeves', NULL),

-- Scene 12: Wrap-up
('d1a1s12', 1, 1, 12, 'End of Day One', 'Janet summarizes Act 1 lessons and teases the investigation ahead.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 2: The Investigation (12 scenes)
-- ============================================================

-- Scene 1: Narrative Transition
('d1a2s1', 1, 2, 1, 'Day Two Begins', 'Reeves and Janet set the stage for quantitative analysis and legal review.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: Quantitative Risk Analysis
('d1a2s2', 1, 2, 2, 'Insurance Math', 'Janet teaches SLE, ARO, ALE through the Insurance Math analogy.', ARRAY['Quantitative Risk Analysis'], ARRAY['SLE', 'ARO', 'ALE', 'AV', 'EF', 'exposure factor'], ARRAY['quantitative-risk-analysis'], 3, false, false, 'teaching', 'Insurance Math', 'janet', 'calculation'),

-- Scene 3: Qualitative Risk Analysis
('d1a2s3', 1, 2, 3, 'Restaurant Star Ratings', 'Kai explains qualitative vs quantitative approaches.', ARRAY['Qualitative Risk Analysis'], ARRAY['qualitative', 'quantitative', 'risk matrix', 'likelihood', 'impact'], ARRAY['qualitative-risk-analysis'], 2, false, false, 'teaching', 'Restaurant Star Ratings', 'kai', 'comparison'),

-- Scene 4: Risk Treatment Options
('d1a2s4', 1, 2, 4, 'Flood Insurance Choices', 'Reeves presents the four risk treatment options.', ARRAY['Risk Treatment'], ARRAY['risk avoidance', 'risk transfer', 'risk mitigation', 'risk acceptance', 'residual risk'], ARRAY['risk-treatment'], 2, false, true, 'teaching', 'Flood Insurance Choices', 'reeves', 'decision_map'),

-- Scene 5: Cost-Benefit Analysis
('d1a2s5', 1, 2, 5, 'Home Alarm ROI', 'Janet demonstrates cost-benefit analysis for security controls.', ARRAY['Cost-Benefit Analysis'], ARRAY['safeguard value', 'ROI', 'TCO', 'cost-benefit'], ARRAY['cost-benefit-analysis'], 2, false, false, 'teaching', 'Home Alarm ROI', 'janet', NULL),

-- Scene 6: Intellectual Property Laws
('d1a2s6', 1, 2, 6, 'Creative Protection Toolkit', 'Reeves explains trade secrets, patents, copyrights, and trademarks.', ARRAY['Intellectual Property'], ARRAY['trade secret', 'patent', 'copyright', 'trademark', 'intellectual property'], ARRAY['intellectual-property'], 2, false, false, 'teaching', 'Creative Protection Toolkit', 'reeves', 'comparison'),

-- Scene 7: Privacy Laws + OECD
('d1a2s7', 1, 2, 7, 'Global Privacy Passport', 'Reeves covers GDPR, HIPAA, CCPA and the OECD privacy principles.', ARRAY['Privacy Laws', 'OECD Privacy Guidelines'], ARRAY['GDPR', 'HIPAA', 'CCPA', 'GLBA', 'OECD', 'privacy', 'breach notification'], ARRAY['privacy-laws', 'oecd-guidelines'], 2, true, false, 'teaching', 'Global Privacy Passport', 'reeves', NULL),

-- Scene 8: Due Diligence vs Due Care
('d1a2s8', 1, 2, 8, 'Home Inspection vs Maintenance', 'Reeves clarifies due diligence and due care with the home analogy.', ARRAY['Due Diligence vs Due Care'], ARRAY['due diligence', 'due care', 'negligence'], ARRAY['due-diligence-due-care'], 1, false, false, 'teaching', 'Home Inspection vs Maintenance', 'reeves', NULL),

-- Scene 9: Security Doc Hierarchy + Scoping/Tailoring
('d1a2s9', 1, 2, 9, 'Government Hierarchy & Tailored Suit', 'Reeves covers policy hierarchy levels and scoping/tailoring concepts.', ARRAY['Security Doc Hierarchy', 'Scoping and Tailoring'], ARRAY['overarching policy', 'functional policy', 'system-specific policy', 'scoping', 'tailoring'], ARRAY['security-doc-hierarchy', 'scoping-tailoring'], 2, false, false, 'teaching', 'Government Hierarchy', 'reeves', NULL),

-- Scene 10: Social Engineering
('d1a2s10', 1, 2, 10, 'Con Artist Playbook', 'Kai traces the social engineering attack chain used in the breach.', ARRAY['Social Engineering'], ARRAY['phishing', 'spear phishing', 'whaling', 'vishing', 'smishing', 'pretexting', 'social engineering'], ARRAY['social-engineering'], 2, false, false, 'teaching', 'Con Artist Playbook', 'kai', NULL),

-- Scene 11: PIA/DPIA + PDCA
('d1a2s11', 1, 2, 11, 'Impact Study & Training Loop', 'Reeves on privacy impact assessments, Kai on the PDCA improvement cycle.', ARRAY['PIA/DPIA', 'PDCA Cycle'], ARRAY['PIA', 'DPIA', 'PDCA', 'Plan-Do-Check-Act', 'continuous improvement'], ARRAY['pia-dpia', 'pdca-cycle'], 2, false, false, 'teaching', 'Environmental Impact Study', 'reeves', NULL),

-- Scene 12: Wrap-up
('d1a2s12', 1, 2, 12, 'The Insider Reveal', 'Janet and Reeves reveal evidence of an insider threat, setting up Act 4.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 4: The Escalation (12 scenes)
-- ============================================================

-- Scene 1: BCP Activation
('d1a4s1', 1, 4, 1, 'Alert Status', 'Reeves and Janet activate BCP after a secondary attack payload triggers.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: BCP/BIA + Recovery Metrics
('d1a4s2', 1, 4, 2, 'Restaurant Kitchen Fire', 'Janet teaches BCP, BIA, and recovery metrics through the kitchen fire analogy.', ARRAY['BCP/BIA', 'Recovery Metrics'], ARRAY['BCP', 'DRP', 'BIA', 'RTO', 'RPO', 'MTD', 'WRT', 'business continuity'], ARRAY['bcp-bia', 'recovery-metrics'], 3, false, true, 'teaching', 'Restaurant Kitchen Fire', 'janet', 'process_flow'),

-- Scene 3: Personnel Security
('d1a4s3', 1, 4, 3, 'Bank Teller Safeguards', 'Morales covers personnel security controls in context of the insider threat.', ARRAY['Personnel Security'], ARRAY['background check', 'mandatory vacation', 'job rotation', 'separation of duties', 'offboarding'], ARRAY['personnel-security'], 2, false, false, 'teaching', 'Bank Teller Safeguards', 'morales', NULL),

-- Scene 4: Security Awareness Training
('d1a4s4', 1, 4, 4, 'Fire Drill Culture', 'Kai distinguishes awareness, training, and education.', ARRAY['Security Awareness Training'], ARRAY['security awareness', 'security training', 'security education'], ARRAY['security-awareness'], 2, false, false, 'teaching', 'Fire Drill Culture', 'kai', NULL),

-- Scene 5: Threat Modeling
('d1a4s5', 1, 4, 5, 'Crime Scene Profiling', 'Janet profiles the attacker using STRIDE, PASTA, and DREAD frameworks.', ARRAY['Threat Modeling'], ARRAY['STRIDE', 'PASTA', 'DREAD', 'threat modeling', 'spoofing', 'tampering', 'repudiation', 'elevation of privilege'], ARRAY['threat-modeling'], 2, false, false, 'teaching', 'Crime Scene Profiling', 'janet', 'exploration'),

-- Scene 6: Supply Chain Risk + Third-Party Governance
('d1a4s6', 1, 4, 6, 'Farm-to-Table Audit', 'Reeves covers supply chain risk and third-party governance.', ARRAY['Supply Chain Risk', 'Third-Party Governance'], ARRAY['supply chain', 'third-party risk', 'SLA', 'right-to-audit', 'fourth-party risk'], ARRAY['supply-chain-risk', 'third-party-governance'], 2, true, false, 'teaching', 'Farm-to-Table Audit', 'reeves', NULL),

-- Scene 7: Separation of Duties + Least Privilege
('d1a4s7', 1, 4, 7, 'Bank Vault Protocols', 'Morales deep-dives into SoD and least privilege using the bank analogy.', ARRAY['Separation of Duties', 'Least Privilege'], ARRAY['separation of duties', 'least privilege', 'need to know', 'dual control'], ARRAY['separation-of-duties', 'least-privilege'], 2, false, false, 'teaching', 'Bank Teller Safeguards', 'morales', NULL),

-- Scene 8: Investigation Types + Import/Export Controls
('d1a4s8', 1, 4, 8, 'Court System & Customs', 'Morales on investigation types, Reeves on import/export controls.', ARRAY['Investigation Types', 'Import/Export Controls'], ARRAY['administrative investigation', 'civil investigation', 'criminal investigation', 'regulatory investigation', 'EAR', 'ITAR', 'Wassenaar'], ARRAY['investigation-types', 'import-export-controls'], 2, false, false, 'teaching', 'Court System Tiers', 'morales', NULL),

-- Scene 9: Frameworks Deep Dive
('d1a4s9', 1, 4, 9, 'Tool Belt Selection', 'Janet provides an in-depth comparison of ISO, COBIT, and SABSA.', ARRAY['Security Frameworks'], ARRAY['ISO 27001', 'ISO 27002', 'COBIT', 'SABSA', 'ISMS'], ARRAY['security-frameworks'], 2, false, false, 'teaching', 'Tool Belt Selection', 'janet', 'comparison'),

-- Scene 10: Transborder Data + M&A Security
('d1a4s10', 1, 4, 10, 'Shipping Lanes & House Merger', 'Reeves covers transborder data flow and M&A security considerations.', ARRAY['Transborder Data', 'M&A Security'], ARRAY['data localization', 'EU-US Data Privacy Framework', 'SCCs', 'BCRs', 'merger', 'acquisition', 'due diligence'], ARRAY['transborder-data', 'ma-security'], 2, false, true, 'evidence', 'International Shipping Lanes', 'reeves', NULL),

-- Scene 11: Employee Duress + NCA/NDA + Risk Communication
('d1a4s11', 1, 4, 11, 'Silent Alarm & Pinky Promise', 'Morales on duress procedures, Reeves on legal agreements and risk communication.', ARRAY['Employee Duress', 'NCA/NDA', 'Risk Communication'], ARRAY['duress code', 'NDA', 'NCA', 'risk communication', 'stakeholder reporting'], ARRAY['employee-duress', 'nca-nda', 'risk-communication'], 2, false, false, 'teaching', 'Silent Alarm', 'morales', NULL),

-- Scene 12: Boss Battle Prep
('d1a4s12', 1, 4, 12, 'Ready for the Boss Battle', 'All four NPCs prepare the player for the Domain 1 comprehensive assessment.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL)
ON CONFLICT (scene_id) DO NOTHING;
