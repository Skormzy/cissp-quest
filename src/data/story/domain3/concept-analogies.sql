-- Domain 3: Security Architecture and Engineering — Concept Analogies
-- Insert into concept_analogies table for every Domain 3 analogy

INSERT INTO concept_analogies (concept_name, analogy_name, analogy_description, npc_owner, domain_number, scene_id_introduced, image_reference) VALUES

-- Act 1 Analogies
('Bell-LaPadula Model', 'Top-Secret Library', 'A library with floor-based security: No Read Up (Simple Security — can''t read books on floors above your clearance) and No Write Down (Star Property — can''t leave notes on floors below). Protects CONFIDENTIALITY only, ignores integrity.', 'janet', 3, 'd3a1s2', 'top-secret-library'),

('Biba Model', 'Recipe Integrity Kitchen', 'A professional kitchen with ingredient rules: No Read Down (Simple Integrity — don''t use lower-quality ingredients) and No Write Up (Star Integrity — don''t contaminate the fine dining menu). Plus No Invoke Up (can''t ask the head chef to use your cheap ingredients). Protects INTEGRITY, mirror image of Bell-LaPadula.', 'janet', 3, 'd3a1s3', NULL),

('Clark-Wilson Model', 'Bank Transaction Clerk', 'A bank where tellers never touch money directly — every transaction goes through an approved program (Transformation Procedure). Access is controlled by triples: (Subject, TP, CDI). Enforces well-formed transactions and separation of duties. NOT label-based like BLP/Biba.', 'janet', 3, 'd3a1s4', NULL),

('Secure Design Principles', 'Architect''s Golden Rules', 'Eight golden rules every security architect follows: Least Privilege (minimum access), Fail-Safe Defaults (deny by default), Economy of Mechanism (KISS), Complete Mediation (check every access), Open Design (Kerckhoffs''), Separation of Privilege (multiple conditions), Least Common Mechanism (minimize sharing), Psychological Acceptability (usability matters).', 'janet', 3, 'd3a1s5', NULL),

('Defense in Depth', 'Medieval Castle Layers', 'A medieval castle with concentric defenses: moat (perimeter network), outer wall (firewall), inner wall (host security), castle keep (data encryption). If one layer fails, the next catches the attacker. Layer physical + technical + administrative controls.', 'kai', 3, 'd3a1s6', 'medieval-castle-layers'),

('Symmetric Cryptography', 'Shared House Key', 'One key that opens the front door — everyone who lives in the house has a copy. Fast to use, but the key distribution problem is real: 10 people need 45 keys [n(n-1)/2]. AES is the current standard. Good for bulk data, bad for scalability.', 'janet', 3, 'd3a1s7', NULL),

('Asymmetric Cryptography', 'Mailbox and Master Key', 'A mailbox anyone can drop letters into (public key) but only you can open with your master key (private key). Solves the key distribution problem, enables digital signatures and nonrepudiation. RSA, ECC, DH. Slower than symmetric but more scalable (2n keys).', 'janet', 3, 'd3a1s8', NULL),

('Hashing', 'Fingerprint Scanner', 'A fingerprint scanner for data — creates a unique fixed-length digest from any input. One-way (can''t reconstruct the data), deterministic (same input = same fingerprint), collision-resistant. MD5 (broken), SHA-1 (deprecated), SHA-2/SHA-3 (current). Birthday attack needs only 2^(n/2) attempts.', 'janet', 3, 'd3a1s9', NULL),

('Common Criteria', 'Consumer Reports Rating', 'Like Consumer Reports testing products, Common Criteria (ISO 15408) evaluates IT security products. EAL 1-7 ratings (1=functionally tested, 4=highest for commercial, 7=formally verified). Uses TOE (product), ST (vendor claims), PP (requirements). Replaced the Orange Book.', 'reeves', 3, 'd3a1s10', NULL),

('Covert Channels', 'Smuggler''s Hidden Compartment', 'Unintended communication paths — like a smuggler''s hidden compartment in a truck. Storage channels hide data in shared resources (file size, disk usage). Timing channels encode information in event timing (CPU load patterns). The attacker used covert timing channels to exfiltrate data from the server farm.', 'morales', 3, 'd3a1s11', NULL),

-- Act 2 Analogies
('PKI and Digital Certificates', 'Digital Passport Office', 'PKI is a digital passport office: Root CA = the government (ultimate trust anchor), Intermediate CA = regional passport office, End Entity = your passport. Chain of trust flows from root to leaf. CRL = wanted list, OCSP = real-time status check. Certificate pinning locks a specific passport to a specific person.', 'janet', 3, 'd3a2s2', 'digital-passport-office'),

('Digital Signatures', 'Wax Seal and Signet Ring', 'Digital signatures work like a wax seal: hash the message (create an imprint), seal with your PRIVATE key (press your unique signet ring). Receiver verifies with your PUBLIC key. Provides integrity, authentication, and nonrepudiation — but NOT confidentiality. The message is signed, not encrypted.', 'janet', 3, 'd3a2s3', 'wax-seal-signet-ring'),

('Key Management Lifecycle', 'Key Ring Maintenance', 'Managing crypto keys is like maintaining a key ring: Generate (cut new keys), Distribute (hand them out securely), Store (lock them in a safe), Use (only for intended purpose), Rotate (replace before they wear out), Revoke (disable stolen keys), Archive (keep old keys for historical access), Destroy (shred when done).', 'janet', 3, 'd3a2s4', NULL),

('Hybrid Cryptography', 'Envelope Inside a Lockbox', 'The best of both worlds: put the message in a fast-locking envelope (symmetric encryption), then put the envelope key in a secure lockbox (asymmetric encryption). TLS does exactly this — asymmetric handshake exchanges a symmetric session key, then symmetric does the heavy lifting.', 'janet', 3, 'd3a2s5', NULL),

('Cloud Computing Security', 'Shared Apartment Building', 'Cloud is a shared apartment building: IaaS = you rent an empty unit (control everything inside), PaaS = furnished apartment (control your stuff, landlord handles furniture), SaaS = hotel room (just use it). The building owner (provider) handles the structure; you handle your belongings. Accountability NEVER transfers to the landlord.', 'kai', 3, 'd3a2s6', 'shared-apartment-building'),

('Virtualization and Hypervisor Security', 'Apartment vs House', 'Type 1 hypervisor (bare metal) = a house with its own foundation — more secure, direct hardware access. Type 2 (hosted) = an apartment above a shop — less secure, depends on the shop (host OS). Containers = roommates sharing one apartment (shared kernel) — efficient but one bad roommate can affect everyone.', 'janet', 3, 'd3a2s7', NULL),

('Fire Prevention Detection Suppression', 'Kitchen Fire Safety', 'Fire safety in a kitchen: VESDA = smoke alarm that catches grease before it smokes (incipient detection, best for data centers). Pre-action = sprinkler that needs BOTH a smoke alarm AND heat to activate (double interlock, best water option for data centers). FM-200 = clean fire blanket (safe for equipment and people). Halon = BANNED (Montreal Protocol, ozone depletion).', 'morales', 3, 'd3a2s8', 'kitchen-fire-safety'),

('Physical Access Controls', 'Bank Vault Entry Protocol', 'Entering a bank vault: fences (3-4ft casual, 6-7ft serious, 8ft+ barbed wire), mantrap (airlock — one door closes before the next opens), badge readers, security guards. Fail-safe = vault door UNLOCKS when power fails (safety first, people can exit). Fail-secure = vault door LOCKS when power fails (security first, contents protected).', 'morales', 3, 'd3a2s9', NULL),

('Power and Environmental Controls', 'Life Support Systems', 'Data center life support: UPS = emergency oxygen tank (short-term power backup). Generator = backup air supply system (long-term). Humidity 40-60% (too low = ESD sparks, too high = condensation/corrosion). Temperature 64-75F. Positive pressure = keeps contaminants out like a clean room. Hot/cold aisle = airflow optimization.', 'janet', 3, 'd3a2s10', NULL),

('TPM and HSM', 'Safe Deposit Box', 'TPM = a tamper-resistant safe built into the bank wall (hardware chip on motherboard). Stores keys in Platform Configuration Registers. HSM = a standalone high-security vault for processing crypto operations. Both provide hardware-based root of trust. FIPS 140-2: Level 1 (basic) to Level 4 (tamper-active, environmental protection).', 'janet', 3, 'd3a2s11', NULL),

('CPTED', 'Neighborhood Watch Design', 'Crime Prevention Through Environmental Design — design the neighborhood to deter crime: Natural Surveillance (windows facing the street, clear sightlines), Natural Access Control (single entrance, hedges guiding foot traffic), Territorial Reinforcement (landscaping, signage marking private space).', 'morales', 3, 'd3a2s12', NULL),

('Zero Trust', 'Never Trust Always Verify', 'Zero trust = never trust anyone inside or outside the network. Every request verified as if it came from the open internet. Three pillars: micro-segmentation (individual locks on every room), least privilege (minimum access keys), continuous verification (re-check identity constantly). NIST SP 800-207 is the reference standard. Deep dive in Domain 5.', 'kai', 3, 'd3a2s12', NULL),

-- Act 4 Analogies
('Cryptanalytic Attacks', 'Codebreaker''s Toolkit', 'A codebreaker''s toolkit: Brute Force = try every combination. Known Plaintext = compare a postcard to its envelope. Chosen Plaintext = send a known message and study the encryption. Meet-in-the-Middle = why 2DES is useless (reduces 3DES to 112-bit). Birthday Attack = find collisions in 2^(n/2) tries. Rainbow Tables = precomputed hash dictionaries (defeated by salting). Side-Channel = watch the lock for clues (power, timing, sound).', 'janet', 3, 'd3a4s2', NULL),

('Block Cipher Modes', 'Assembly Line Styles', 'Block cipher modes are assembly line styles: ECB = each worker processes independently (reveals patterns — NEVER use for repeating data). CBC = each worker''s output feeds into the next (good for bulk data). CTR = workers process in parallel with a counter (fastest, most secure block mode). GCM = CTR with authentication stamp (used in TLS 1.3).', 'janet', 3, 'd3a4s3', NULL),

('Brewer-Nash Model', 'Law Firm Firewall', 'A law firm where once you work on Company A''s case, you''re permanently blocked from Company B''s case (if they''re competitors). The ONLY security model where permissions change based on past behavior. Dynamic conflict-of-interest separation — used in consulting, finance, and legal.', 'reeves', 3, 'd3a4s4', NULL),

('TOCTOU Race Conditions', 'Ticket Scalper Timing', 'A ticket scalper who checks your reservation (time-of-check) but swaps your seat before you sit down (time-of-use). The gap between verification and access is the vulnerability. Mitigation: mutex locks (hold the seat), atomic operations (check-and-sit in one step), increased check frequency. Cross-reference: also appears in Domain 8.', 'janet', 3, 'd3a4s5', NULL),

('ICS SCADA Security', 'Factory Floor Fortress', 'SCADA/ICS systems are like a factory floor fortress: PLCs control physical processes (valves, motors), air-gapping isolates from IT networks, but you CAN''T easily patch because downtime = safety risk. Primary mitigations: network segmentation, strict access controls, protocol whitelisting. Stuxnet showed what happens when the fortress is breached.', 'morales', 3, 'd3a4s6', NULL),

('Steganography', 'Invisible Ink Letter', 'Steganography = writing with invisible ink. The message is hidden WITHIN another file (image, audio, video). Unlike encryption (which makes data unreadable), steganography hides the very EXISTENCE of the data. Digital watermarking is a related technique for copyright protection. NOT encryption — it''s security through obscurity.', 'janet', 3, 'd3a4s7', NULL),

('Quantum Cryptography', 'Quantum Lock Picking', 'Quantum computing threatens current crypto: Shor''s algorithm can break RSA/ECC by factoring large numbers efficiently. Post-quantum cryptography develops quantum-resistant algorithms. Crypto agility = the ability to swap algorithms when quantum advances arrive. QKD (Quantum Key Distribution) uses quantum physics to detect eavesdropping.', 'janet', 3, 'd3a4s8', NULL),

('Lightweight Cryptography', 'Travel-Size Security', 'Lightweight crypto = travel-size security for constrained devices. IoT sensors, smartcards, and embedded systems lack the CPU/memory for full AES. NIST has standardized lightweight crypto algorithms optimized for small footprints while maintaining adequate security.', 'janet', 3, 'd3a4s9', NULL),

('One-Time Pad', 'Self-Destructing Cipher', 'The one-time pad is theoretically UNBREAKABLE — but only if ALL four conditions are met: (1) truly random key, (2) key >= message length, (3) key used only ONCE, (4) key physically secured. Violate any condition and it''s breakable. Named because spies tore off and burned each page after use. Impractical at scale.', 'janet', 3, 'd3a4s9', NULL),

('Formal Security Models', 'Museum of Formal Models', 'A museum of formal security models: Graham-Denning = 8 rules for creating/deleting objects and rights. HRU = access matrix safety (is the system provably secure?). Take-Grant = directed graph of rights transfer (take, grant, create, remove). Goguen-Meseguer = noninterference (one group can''t affect another). Sutherland = integrity via preventing interference.', 'janet', 3, 'd3a4s10', NULL),

('Enterprise Architecture Frameworks', 'City Planning Methodologies', 'Architecture frameworks are city planning methods: Zachman = 6x6 grid organizing artifacts (who, what, how, where, when, why × perspectives). TOGAF = step-by-step development method (ADM). SABSA = security-specific layered framework (contextual through operational). Each suits different organizational needs.', 'reeves', 3, 'd3a4s11', NULL),

('Edge Computing', 'Branch Office Network', 'Edge computing = processing data at branch offices near the source, instead of shipping everything to headquarters (cloud). Reduces latency, saves bandwidth. Fog computing = regional processing layer between edge and cloud. CDN = distributing content copies to local libraries worldwide for faster access.', 'janet', 3, 'd3a4s12', NULL),

('Microservices and Serverless', 'Food Truck Fleet', 'Microservices = a fleet of food trucks, each serving one dish (loosely coupled services). Communicate via APIs. Scale individually. Serverless (FaaS) = a catering pop-up that only exists when orders come in (event-driven, pay per execution). No servers to manage. Both need API gateway security and service mesh for communication.', 'janet', 3, 'd3a4s12', NULL),

('Security Modes of Operation', 'Building Clearance Levels', 'Four building clearance levels: Dedicated = everyone has Top Secret clearance AND need-to-know for ALL data. System High = everyone has Top Secret clearance but NOT all need-to-know. Compartmented = clearance for max level + approved for specific compartments. Multilevel = mix of clearance levels + technical enforcement (most complex, most flexible).', 'morales', 3, 'd3a4s13', NULL),

('Web Application Vulnerabilities', 'Open Window Exploits', 'Web app vulnerabilities = open windows in a building: XSS (stored/reflected/DOM) = someone shouts through your window to trick visitors. CSRF = someone forges your signature on a request. SQLi = someone picks your lock by manipulating the keyhole (input field). Root cause of most web vulnerabilities: failure to validate input. Input validation is the deadbolt that fixes most window exploits.', 'janet', 3, 'd3a4s14', NULL),

('Crypto-shredding', 'Burning the Key Ring', 'Crypto-shredding = burning the key ring instead of the documents. Encrypt data, then destroy ALL copies of the encryption keys. The encrypted data remains but is permanently unreadable. Primary option for cloud environments where physical destruction isn''t possible. Cross-reference: first taught in Domain 2.', 'janet', 3, 'd3a4s14', NULL)
ON CONFLICT (concept_name) DO NOTHING;
