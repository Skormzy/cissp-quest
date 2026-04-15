-- Domain 2: Asset Security — Scene Definitions
-- Insert into scene_definitions table for all 35 scenes across Acts 1, 2, and 4

-- ============================================================
-- ACT 1: The Briefing (12 scenes)
-- ============================================================

INSERT INTO scene_definitions (scene_id, domain_number, act_number, scene_order, title, description, concepts_covered, glossary_terms, library_topics, estimated_minutes, has_timed_decision, has_tlatm, scene_type, analogy_name, analogy_npc, interactive_image_type) VALUES

-- Scene 1: Narrative Setup
('d2a1s1', 2, 1, 1, 'The Data Vault Breach', 'Director Reeves briefs the team on the classified data storage facility breach.', ARRAY['Incident Response'], ARRAY['breach', 'classification', 'exfiltration', 'insider threat'], ARRAY['asset-security-overview'], 2, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: Data Classification + Classification vs Categorization
('d2a1s2', 2, 1, 2, 'Filing Cabinet Color Codes', 'Reeves teaches data classification levels using the Filing Cabinet analogy. Kai distinguishes classification from categorization.', ARRAY['Data Classification', 'Classification vs Categorization'], ARRAY['Top Secret', 'Secret', 'Confidential', 'Unclassified', 'FOUO', 'SBU', 'CUI', 'categorization'], ARRAY['data-classification', 'classification-vs-categorization'], 3, false, false, 'teaching', 'Filing Cabinet Color Codes', 'reeves', 'comparison'),

-- Scene 3: Labeling and Marking
('d2a1s3', 2, 1, 3, 'Barcode vs Sticker', 'Morales distinguishes machine-readable labeling from human-readable marking.', ARRAY['Labeling and Marking'], ARRAY['labeling', 'marking', 'metadata', 'watermark', 'DLP integration'], ARRAY['labeling-and-marking'], 2, false, false, 'teaching', 'Barcode vs Sticker', 'morales', NULL),

-- Scene 4: Data Ownership Roles
('d2a1s4', 2, 1, 4, 'Library Card System', 'Reeves covers all data roles: Owner, Controller, Processor, Custodian, Steward, Subject.', ARRAY['Data Ownership Roles'], ARRAY['data owner', 'data controller', 'data processor', 'data custodian', 'data steward', 'data subject'], ARRAY['data-ownership-roles'], 3, false, false, 'teaching', 'Library Card System', 'reeves', NULL),

-- Scene 5: Data States
('d2a1s5', 2, 1, 5, 'Water in Three Forms', 'Kai teaches data at rest, in transit, and in use through the water states analogy.', ARRAY['Data States'], ARRAY['data at rest', 'data in transit', 'data in use', 'encryption'], ARRAY['data-states'], 2, false, false, 'teaching', 'Water in Three Forms', 'kai', NULL),

-- Scene 6: Data Protection Controls per State
('d2a1s6', 2, 1, 6, 'Armor for Every Occasion', 'Janet teaches protection controls matched to each data state.', ARRAY['Data Protection Controls per State'], ARRAY['AES-256', 'TLS', 'VPN', 'homomorphic encryption', 'RBAC', 'DLP', 'full disk encryption'], ARRAY['data-protection-controls'], 2, false, false, 'teaching', 'Armor for Every Occasion', 'janet', NULL),

-- Scene 7: Data Lifecycle
('d2a1s7', 2, 1, 7, 'Document Birth-to-Shredder', 'Reeves walks through the six-phase data lifecycle.', ARRAY['Data Lifecycle'], ARRAY['create', 'store', 'use', 'share', 'archive', 'destroy', 'classification change'], ARRAY['data-lifecycle'], 2, false, false, 'teaching', 'Document Birth-to-Shredder', 'reeves', NULL),

-- Scene 8: Privacy Principles + Data Collection Limitation
('d2a1s8', 2, 1, 8, 'Privacy Fence Rules & Grocery List', 'Reeves covers privacy principles and the data collection limitation principle.', ARRAY['Privacy Principles', 'Data Collection Limitation'], ARRAY['purpose limitation', 'data minimization', 'consent', 'accuracy', 'storage limitation', 'GDPR', 'right to be forgotten'], ARRAY['privacy-principles', 'data-collection-limitation'], 2, false, false, 'teaching', 'Privacy Fence Rules', 'reeves', NULL),

-- Scene 9: Compliance Officer Role
('d2a1s9', 2, 1, 9, 'School Principal', 'Reeves explains the compliance officer role and its organizational position.', ARRAY['Compliance Officer Role'], ARRAY['compliance officer', 'regulatory compliance', 'policy enforcement'], ARRAY['compliance-officer-role'], 2, false, false, 'teaching', 'School Principal', 'reeves', NULL),

-- Scene 10: Retention Policies
('d2a1s10', 2, 1, 10, 'Expiration Date Labels', 'Reeves teaches retention policies with the Boeing case study and litigation hold.', ARRAY['Retention Policies'], ARRAY['retention policy', 'litigation hold', 'data retention', 'Boeing case', 'spoliation'], ARRAY['retention-policies'], 2, false, true, 'teaching', 'Expiration Date Labels', 'reeves', NULL),

-- Scene 11: Destruction Methods
('d2a1s11', 2, 1, 11, 'Paper Shredder Grades', 'Morales covers the full sanitization hierarchy from NIST SP 800-88.', ARRAY['Destruction Methods'], ARRAY['destruction', 'degaussing', 'crypto shredding', 'purging', 'clearing', 'erasing', 'NIST SP 800-88', 'SSD sanitization'], ARRAY['destruction-methods'], 3, false, false, 'teaching', 'Paper Shredder Grades', 'morales', NULL),

-- Scene 12: Wrap-up
('d2a1s12', 2, 1, 12, 'End of Day One', 'Janet and Reeves summarize Act 1 and tease the investigation ahead.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 2: The Investigation (10 scenes)
-- ============================================================

-- Scene 1: Narrative Transition
('d2a2s1', 2, 2, 1, 'Day Two Begins', 'Reeves and Kai reveal the attacker used de-identification techniques to cover tracks.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: Pseudonymization, Tokenization, and Anonymization
('d2a2s2', 2, 2, 2, 'Witness Protection Levels', 'Kai teaches three de-identification techniques through the witness protection analogy.', ARRAY['Pseudonymization Tokenization Anonymization'], ARRAY['pseudonymization', 'tokenization', 'anonymization', 'de-identification', 'GDPR', 're-identification', 'PCI DSS'], ARRAY['de-identification-techniques'], 3, false, false, 'teaching', 'Witness Protection Levels', 'kai', 'comparison'),

-- Scene 3: Information Obfuscation Methods
('d2a2s3', 2, 2, 3, 'Magician''s Misdirection', 'Kai covers concealing, pruning, fabricating, trimming, encrypting, and masking.', ARRAY['Information Obfuscation Methods'], ARRAY['concealing', 'pruning', 'fabricating', 'trimming', 'masking', 'data shuffling'], ARRAY['information-obfuscation'], 2, false, false, 'teaching', 'Magician''s Misdirection', 'kai', NULL),

-- Scene 4: DLP Types and Mechanics
('d2a2s4', 2, 2, 4, 'Airport Luggage Scanner', 'Janet teaches DLP types (network, endpoint, cloud) and the encryption limitation.', ARRAY['DLP Types and Mechanics'], ARRAY['DLP', 'network DLP', 'endpoint DLP', 'cloud DLP', 'data exfiltration', 'pattern matching'], ARRAY['dlp-types'], 3, false, false, 'teaching', 'Airport Luggage Scanner', 'janet', NULL),

-- Scene 5: CASB
('d2a2s5', 2, 2, 5, 'Cloud Bouncer', 'Janet introduces CASBs and their role in detecting shadow IT.', ARRAY['CASB'], ARRAY['CASB', 'shadow IT', 'cloud security', 'cloud access'], ARRAY['casb'], 2, false, false, 'teaching', 'Cloud Bouncer', 'janet', NULL),

-- Scene 6: Data Remanence Deep Dive
('d2a2s6', 2, 2, 6, 'Whiteboard Ghost Writing', 'Janet explains residual magnetic flux, slack space, and SSD wear-leveling.', ARRAY['Data Remanence'], ARRAY['data remanence', 'residual magnetic flux', 'slack space', 'wear-leveling', 'SSD'], ARRAY['data-remanence'], 2, false, false, 'teaching', 'Whiteboard Ghost Writing', 'janet', NULL),

-- Scene 7: Scoping and Tailoring
('d2a2s7', 2, 2, 7, 'Tailored Suit vs Off-the-Rack', 'Reeves revisits scoping and tailoring in the asset security context with D1 cross-reference.', ARRAY['Scoping and Tailoring'], ARRAY['scoping', 'tailoring', 'baseline controls', 'NIST SP 800-53'], ARRAY['scoping-and-tailoring'], 2, false, false, 'teaching', 'Tailored Suit vs Off-the-Rack', 'reeves', NULL),

-- Scene 8: Security Baselines + Standards Selection
('d2a2s8', 2, 2, 8, 'Building Code Tiers & Recipe Book', 'Reeves covers NIST SP 800-53B baselines and standards selection.', ARRAY['Security Baselines', 'Standards Selection'], ARRAY['security baseline', 'NIST SP 800-53B', 'low-impact', 'moderate-impact', 'high-impact', 'PCI DSS', 'ISO 27001'], ARRAY['security-baselines', 'standards-selection'], 2, false, true, 'teaching', 'Building Code Tiers', 'reeves', NULL),

-- Scene 9: Data Privacy Officer
('d2a2s9', 2, 2, 9, 'Privacy Ombudsman', 'Reeves explains the GDPR-mandated DPO role and its independence.', ARRAY['Data Privacy Officer'], ARRAY['DPO', 'Data Protection Officer', 'GDPR', 'DPIA', 'independence'], ARRAY['data-privacy-officer'], 2, false, false, 'teaching', 'Privacy Ombudsman', 'reeves', NULL),

-- Scene 10: Wrap-up
('d2a2s10', 2, 2, 10, 'The Threat Escalates', 'Morales reveals the attacker posted stolen data samples. Janet teases Act 4.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 4: The Escalation (13 scenes)
-- ============================================================

-- Scene 1: Crisis Escalation
('d2a4s1', 2, 4, 1, 'Crisis Status', 'Reeves and Janet activate crisis response after the attacker threatens data release.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: DRM and IRM
('d2a4s2', 2, 4, 2, 'Digital Lock and Key', 'Janet teaches DRM and IRM with the DRM Enforcement Lifecycle.', ARRAY['DRM and IRM'], ARRAY['DRM', 'IRM', 'DMCA', 'licensing', 'digital rights', 'document protection', 'audit trail'], ARRAY['drm-irm'], 3, false, false, 'teaching', 'Digital Lock and Key', 'janet', 'process_flow'),

-- Scene 3: End-to-End vs Link vs Onion Encryption
('d2a4s3', 2, 4, 3, 'Armored Car Routes', 'Janet compares three encryption architectures for data in transit.', ARRAY['End-to-End vs Link vs Onion Encryption'], ARRAY['end-to-end encryption', 'link encryption', 'onion encryption', 'TOR', 'VPN', 'plaintext exposure'], ARRAY['encryption-types-transit'], 2, false, false, 'teaching', 'Armored Car Routes', 'janet', NULL),

-- Scene 4: E-discovery and Litigation Holds
('d2a4s4', 2, 4, 4, 'Crime Scene Freeze', 'Morales covers e-discovery process and litigation hold obligations.', ARRAY['E-discovery and Litigation Holds'], ARRAY['e-discovery', 'litigation hold', 'spoliation', 'electronically stored information', 'ESI', 'preservation'], ARRAY['e-discovery-litigation-holds'], 2, true, false, 'teaching', 'Crime Scene Freeze', 'morales', NULL),

-- Scene 5: EOL vs EOS
('d2a4s5', 2, 4, 5, 'Car Warranty Expiration', 'Kai distinguishes End of Life from End of Support and their security implications.', ARRAY['EOL vs EOS'], ARRAY['EOL', 'EOS', 'end of life', 'end of support', 'patch management', 'CVE'], ARRAY['eol-vs-eos'], 2, false, false, 'teaching', 'Car Warranty Expiration', 'kai', NULL),

-- Scene 6: Object Reuse
('d2a4s6', 2, 4, 6, 'Hotel Room Turnover', 'Morales explains object reuse requirements from the Orange Book (TCSEC).', ARRAY['Object Reuse'], ARRAY['object reuse', 'TCSEC', 'Orange Book', 'media reuse', 'sanitization'], ARRAY['object-reuse'], 2, false, false, 'teaching', 'Hotel Room Turnover', 'morales', NULL),

-- Scene 7: Data Location and Sovereignty
('d2a4s7', 2, 4, 7, 'Embassy Territory Rules', 'Reeves covers data sovereignty, GDPR cross-border transfers, and cloud location verification.', ARRAY['Data Location and Sovereignty'], ARRAY['data sovereignty', 'data localization', 'GDPR', 'SCCs', 'BCRs', 'adequacy decision', 'cross-border'], ARRAY['data-sovereignty'], 2, false, true, 'teaching', 'Embassy Territory Rules', 'reeves', NULL),

-- Scene 8: Homomorphic Encryption
('d2a4s8', 2, 4, 8, 'Sealed Ballot Counting', 'Janet introduces homomorphic encryption for protecting data in use.', ARRAY['Homomorphic Encryption'], ARRAY['homomorphic encryption', 'data in use', 'computation on encrypted data', 'FHE'], ARRAY['homomorphic-encryption'], 2, false, false, 'teaching', 'Sealed Ballot Counting', 'janet', NULL),

-- Scene 9: Declassification Process
('d2a4s9', 2, 4, 9, 'Document Downgrade Ladder', 'Morales explains the formal declassification process and its cost implications.', ARRAY['Declassification Process'], ARRAY['declassification', 'downgrading', 'media reuse', 'purging', 'verification'], ARRAY['declassification-process'], 2, false, false, 'teaching', 'Document Downgrade Ladder', 'morales', NULL),

-- Scene 10: Air-Gapped Networks and Unidirectional Bridges
('d2a4s10', 2, 4, 10, 'One-Way Mirror', 'Janet covers air-gapped networks, data diodes, and unidirectional bridges.', ARRAY['Air-Gapped Networks'], ARRAY['air gap', 'unidirectional bridge', 'data diode', 'technical guard', 'classified network'], ARRAY['air-gapped-networks'], 2, false, false, 'teaching', 'One-Way Mirror', 'janet', NULL),

-- Scene 11: Defensible Destruction
('d2a4s11', 2, 4, 11, 'Witnessed Shredding Ceremony', 'Morales explains legally defensible destruction requirements.', ARRAY['Defensible Destruction'], ARRAY['defensible destruction', 'certificate of destruction', 'witnessed destruction', 'audit trail'], ARRAY['defensible-destruction'], 2, false, false, 'teaching', 'Witnessed Shredding Ceremony', 'morales', NULL),

-- Scene 12: Memory Types + Randomized Masking
('d2a4s12', 2, 4, 12, 'Whiteboard vs Carved Stone & Deck Shuffle', 'Janet covers volatile vs non-volatile memory security and randomized data masking.', ARRAY['Memory Types and Security', 'Randomized Masking'], ARRAY['volatile memory', 'non-volatile memory', 'RAM', 'ROM', 'cold boot attack', 'memory flushing', 'data shuffling', 'randomized masking'], ARRAY['memory-types', 'randomized-masking'], 2, false, false, 'teaching', 'Whiteboard vs Carved Stone', 'janet', NULL),

-- Scene 13: Boss Battle Prep
('d2a4s13', 2, 4, 13, 'Ready for the Boss Battle', 'All NPCs prepare the player for the Domain 2 comprehensive assessment.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL)
ON CONFLICT (scene_id) DO NOTHING;
