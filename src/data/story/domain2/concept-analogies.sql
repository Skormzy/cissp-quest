-- Domain 2: Asset Security — Concept Analogies
-- Insert into concept_analogies table for every Domain 2 analogy

INSERT INTO concept_analogies (concept_name, analogy_name, analogy_description, npc_owner, domain_number, scene_id_introduced, image_reference) VALUES

-- Act 1 Analogies
('Data Classification', 'Filing Cabinet Color Codes', 'Every piece of data gets a color code determining who can touch it, where it''s stored, and how it''s destroyed. Government: Top Secret > Secret > Confidential > Unclassified. Commercial: Confidential/Proprietary > Private > Sensitive > Public.', 'reeves', 2, 'd2a1s2', 'filing-cabinet-color-codes'),

('Classification vs Categorization', 'Ranking vs Sorting', 'Classification = ranking (vertical sensitivity ladder from top to bottom). Categorization = sorting (horizontal buckets like financial, HR, engineering). You can sort without ranking, but you can''t protect without ranking.', 'kai', 2, 'd2a1s2', NULL),

('Labeling and Marking', 'Barcode vs Sticker', 'Labeling = barcode (machine-readable metadata for automated systems like DLP). Marking = sticker (human-readable labels like TOP SECRET stamps). Both required — labels feed machines, markings inform humans.', 'morales', 2, 'd2a1s3', NULL),

('Data Ownership Roles', 'Library Card System', 'Data roles mapped to a library: Owner = Director (classifies, accountable), Controller = Collection Policy Maker (decides what/why), Processor = Card Printer (follows instructions), Custodian = Librarian (day-to-day care), Steward = Catalog Manager (data quality), Subject = Patron (the person).', 'reeves', 2, 'd2a1s4', NULL),

('Data States', 'Water in Three Forms', 'Three data states like water: At Rest = Ice (stored, stationary — even on a tape being transported). In Transit = Liquid (flowing through network pipes). In Use = Steam (volatile, in memory, hardest to contain).', 'kai', 2, 'd2a1s5', NULL),

('Data Protection Controls per State', 'Armor for Every Occasion', 'Each data state needs different armor: At Rest = AES-256 / full disk encryption. In Transit = TLS/VPN/IPsec. In Use = homomorphic encryption / RBAC / DLP / clean desk. Wrong armor for the wrong state leaves you exposed.', 'janet', 2, 'd2a1s6', NULL),

('Data Lifecycle', 'Document Birth-to-Shredder', 'Six lifecycle phases: Create/Collect → Store → Use → Share → Archive → Destroy. Classification can change at any point. Media inherits the classification of the HIGHEST data it holds.', 'reeves', 2, 'd2a1s7', NULL),

('Privacy Principles', 'Privacy Fence Rules', 'Privacy principles are like fence rules between neighbors: Purpose Limitation (why you collect), Data Minimization (collect only what you need), Consent (ask permission), Accuracy (keep current), Storage Limitation (don''t keep forever), Individual Rights (access/correct/delete).', 'reeves', 2, 'd2a1s8', NULL),

('Data Collection Limitation', 'Grocery List Discipline', 'Data collection = grocery shopping. Buy what''s on the list, not everything that looks interesting. Every extra piece of data collected is another thing to protect, another thing to be stolen, another thing regulators can fine you for.', 'reeves', 2, 'd2a1s8', NULL),

('Compliance Officer Role', 'School Principal', 'The compliance officer is the school principal: doesn''t teach every class, but ensures every teacher follows the curriculum, every student follows the rules, and the school passes its inspections. Identifies applicable laws, monitors compliance, reports to leadership.', 'reeves', 2, 'd2a1s9', NULL),

('Retention Policies', 'Expiration Date Labels', 'Retention policies are food expiration dates: keep data past the date and it becomes a legal hazard. Boeing: 14,000 backup tapes → $92.5M settlement. Exception: litigation hold suspends all expiration dates when lawsuits are anticipated.', 'reeves', 2, 'd2a1s10', NULL),

('Destruction Methods', 'Paper Shredder Grades', 'Sanitization hierarchy from strongest to weakest: Physical Destruction (industrial shredder) > Degaussing (magnetic — HDDs only, NOT SSDs) > Crypto Shredding (destroy the key — cloud option) > Purging (intensive overwrite) > Clearing (basic overwrite) > Erasing (just deleting — NOT secure).', 'morales', 2, 'd2a1s11', NULL),

-- Act 2 Analogies
('Pseudonymization Tokenization Anonymization', 'Witness Protection Levels', 'Three de-identification levels: Pseudonymization = new name (reversible, GDPR applies). Tokenization = random code number with secure vault mapping (reversible, GDPR applies). Anonymization = identity erased (irreversible, GDPR doesn''t apply if done correctly).', 'kai', 2, 'd2a2s2', 'witness-protection-levels'),

('Information Obfuscation Methods', 'Magician''s Misdirection', 'Six misdirection techniques: Concealing (vanishing act), Pruning (empty frame), Fabricating (decoy cards), Trimming (half the card — last 4 digits), Encrypting (locked box), Masking/Shuffling (deck shuffle — scramble within columns).', 'kai', 2, 'd2a2s3', NULL),

('DLP Types and Mechanics', 'Airport Luggage Scanner', 'DLP is an airport luggage scanner: Network DLP = departure gate scanner (edge of network). Endpoint DLP = personal bag check (on device). Cloud DLP = private aviation scanner (cloud-native). Critical limitation: DLP CANNOT scan encrypted data — lead-lined suitcase bypasses the X-ray.', 'janet', 2, 'd2a2s4', NULL),

('CASB', 'Cloud Bouncer', 'CASB sits between users and cloud services like a bouncer at a club: enforces security policies, checks IDs (authentication), logs activity, monitors threats, and catches shadow IT (people sneaking in the back door with unauthorized cloud services).', 'janet', 2, 'd2a2s5', NULL),

('Data Remanence', 'Whiteboard Ghost Writing', 'Data remanence is ghost writing on a whiteboard: residual magnetic flux on HDDs, slack space remnants, SSD wear-leveling preserving old data in unreachable cells. Even after erasing, faint traces remain. SSDs are the worst — wear-leveling copies data to hidden corners.', 'janet', 2, 'd2a2s6', NULL),

('Scoping and Tailoring', 'Tailored Suit vs Off-the-Rack', 'Scoping = picking which suits to try on (which baseline controls apply). Tailoring = getting them altered to fit (modifying controls for your organization). Scoping is part of tailoring. Scope first, then tailor. Cross-reference: same concept from Domain 1.', 'reeves', 2, 'd2a2s7', NULL),

('Security Baselines', 'Building Code Tiers', 'Baselines are building code tiers: One-story house = Low-Impact baseline. Office tower = Moderate-Impact. Hospital = High-Impact. NIST SP 800-53B defines the tiers. System must use the baseline matching the HIGHEST impact data it processes.', 'reeves', 2, 'd2a2s8', NULL),

('Standards Selection', 'Recipe Book Matching', 'Standards selection = picking the right recipe book: Credit cards → PCI DSS. EU personal data → GDPR. Government systems → NIST SP 800-53. Some organizations voluntarily adopt well-designed standards (NIST 800 series) even when not required.', 'reeves', 2, 'd2a2s8', NULL),

('Data Privacy Officer', 'Privacy Ombudsman', 'The DPO is like an ombudsman: independent, protected from retaliation, reports directly to the highest level of management. GDPR-mandated role. Advises on compliance, monitors data protection, contacts supervisory authorities, conducts DPIAs.', 'reeves', 2, 'd2a2s9', NULL),

-- Act 4 Analogies
('DRM and IRM', 'Digital Lock and Key', 'DRM = digital lock on copyrighted content (music, movies) backed by DMCA. IRM = digital lock on organizational documents (internal PDFs, emails). Both: encryption + licensing + audit trail + expiration. The lock travels with the file.', 'janet', 2, 'd2a4s2', 'digital-lock-and-key'),

('End-to-End vs Link vs Onion Encryption', 'Armored Car Routes', 'Three armored car routes: End-to-End = sealed cargo warehouse-to-warehouse (headers visible, payload encrypted). Link = cargo opened at every checkpoint (plaintext at EVERY node). Onion/TOR = nested sealed boxes (nobody sees the final label, provides anonymity).', 'janet', 2, 'd2a4s3', NULL),

('E-discovery and Litigation Holds', 'Crime Scene Freeze', 'E-discovery is a crime scene freeze: once litigation is anticipated, lock down everything. Litigation hold suspends ALL automated deletion. Destroying data after learning of potential litigation = spoliation of evidence = severe penalties.', 'morales', 2, 'd2a4s4', NULL),

('EOL vs EOS', 'Car Warranty Expiration', 'EOL = car discontinued (can''t buy new) but warranty still active (support continues). EOS = warranty expired — no more oil changes, no more recalls, no more security patches. EOS is the real danger. Budget priority: systems approaching EOS.', 'kai', 2, 'd2a4s5', NULL),

('Object Reuse', 'Hotel Room Turnover', 'Object reuse = hotel room turnover. Must clean room thoroughly before next guest. Previous guest''s documents under the mattress = data remanence. Reformatting = changing sheets without checking under the mattress. From the Orange Book (TCSEC).', 'morales', 2, 'd2a4s6', NULL),

('Data Location and Sovereignty', 'Embassy Territory Rules', 'Data sovereignty = embassy territory rules. An embassy is physically in one country but legally belongs to another. Data is subject to the laws of the country where it is STORED, regardless of company headquarters. GDPR restricts EU data transfers without safeguards.', 'reeves', 2, 'd2a4s7', NULL),

('Homomorphic Encryption', 'Sealed Ballot Counting', 'Homomorphic encryption = counting sealed ballots. Election workers count votes inside sealed boxes without opening them. The result is announced, but no one sees individual ballots. Enables computation on encrypted data — protects data IN USE.', 'janet', 2, 'd2a4s8', NULL),

('Declassification Process', 'Document Downgrade Ladder', 'Declassification = stepping down a ladder one rung at a time. Requires: formal authorization, verified sanitization, relabeling, and documentation. Often MORE expensive than buying new media. Many organizations skip declassification and just destroy.', 'morales', 2, 'd2a4s9', NULL),

('Air-Gapped Networks', 'One-Way Mirror', 'Air gap = brick wall (nothing through in either direction). Unidirectional bridge (data diode) = one-way mirror (data flows OUT for monitoring, nothing flows IN). Hardware-enforced — physically impossible to reverse, not just a software rule.', 'janet', 2, 'd2a4s10', NULL),

('Defensible Destruction', 'Witnessed Shredding Ceremony', 'Defensible destruction = witnessed ceremony. Requires: documented policy, approved method, witnessed execution, verification, certificate of destruction, and audit trail. The ceremony matters as much as the shredding — no proof = legally indefensible.', 'morales', 2, 'd2a4s11', NULL),

('Memory Types and Security', 'Whiteboard vs Carved Stone', 'Volatile memory (RAM) = whiteboard — data vanishes when power is off (but cold boot attacks can freeze it). Non-volatile memory (ROM, flash, SSD) = carved stone — data persists. Both have remanence risks. Always flush memory buffers after processing sensitive data.', 'janet', 2, 'd2a4s12', NULL),

('Randomized Masking', 'Deck of Cards Shuffle', 'Randomized masking = shuffling a deck of cards. Values within each column are shuffled across rows. Aggregate statistics remain the same, but individual records are scrambled. Works best with many columns and many records — small datasets are easy to reverse.', 'janet', 2, 'd2a4s12', NULL)
ON CONFLICT (concept_name) DO NOTHING;
