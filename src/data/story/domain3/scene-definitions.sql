-- Domain 3: Security Architecture and Engineering — Scene Definitions
-- Insert into scene_definitions table for all 40 scenes across Acts 1, 2, and 4

-- ============================================================
-- ACT 1: The Briefing (12 scenes)
-- ============================================================

INSERT INTO scene_definitions (scene_id, domain_number, act_number, scene_order, title, description, concepts_covered, glossary_terms, library_topics, estimated_minutes, has_timed_decision, has_tlatm, scene_type, analogy_name, analogy_npc, interactive_image_type) VALUES

-- Scene 1: Narrative Setup
('d3a1s1', 3, 1, 1, 'The Architecture Flaw', 'Director Reeves briefs the team on the server farm breach caused by a fundamental design weakness.', ARRAY['Incident Response'], ARRAY['breach', 'architecture', 'design flaw', 'server farm'], ARRAY['security-architecture-overview'], 2, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: Bell-LaPadula Model
('d3a1s2', 3, 1, 2, 'Top-Secret Library', 'Janet teaches the Bell-LaPadula confidentiality model using the library analogy.', ARRAY['Bell-LaPadula Model'], ARRAY['Bell-LaPadula', 'simple security property', 'star property', 'no read up', 'no write down', 'confidentiality'], ARRAY['bell-lapadula'], 3, false, false, 'teaching', 'Top-Secret Library', 'janet', 'exploration'),

-- Scene 3: Biba Model
('d3a1s3', 3, 1, 3, 'Recipe Integrity Kitchen', 'Janet teaches the Biba integrity model as the mirror image of Bell-LaPadula.', ARRAY['Biba Model'], ARRAY['Biba', 'simple integrity axiom', 'star integrity axiom', 'invocation property', 'no read down', 'no write up'], ARRAY['biba-model'], 2, false, false, 'teaching', 'Recipe Integrity Kitchen', 'janet', NULL),

-- Scene 4: Clark-Wilson Model
('d3a1s4', 3, 1, 4, 'Bank Transaction Clerk', 'Janet covers Clark-Wilson integrity via well-formed transactions and access triples.', ARRAY['Clark-Wilson Model'], ARRAY['Clark-Wilson', 'CDI', 'UDI', 'transformation procedure', 'IVP', 'access triple', 'well-formed transaction'], ARRAY['clark-wilson'], 2, false, false, 'teaching', 'Bank Transaction Clerk', 'janet', NULL),

-- Scene 5: Secure Design Principles
('d3a1s5', 3, 1, 5, 'Architect''s Golden Rules', 'Janet presents the Saltzer and Schroeder secure design principles.', ARRAY['Secure Design Principles'], ARRAY['least privilege', 'fail securely', 'defense in depth', 'KISS', 'secure defaults', 'complete mediation', 'open design', 'separation of privilege'], ARRAY['secure-design-principles'], 2, false, false, 'teaching', 'Architect''s Golden Rules', 'janet', NULL),

-- Scene 6: Defense in Depth
('d3a1s6', 3, 1, 6, 'Medieval Castle Layers', 'Kai teaches layered security controls through the medieval castle analogy.', ARRAY['Defense in Depth'], ARRAY['defense in depth', 'layered security', 'physical controls', 'technical controls', 'administrative controls'], ARRAY['defense-in-depth'], 2, false, false, 'teaching', 'Medieval Castle Layers', 'kai', 'exploration'),

-- Scene 7: Symmetric Cryptography
('d3a1s7', 3, 1, 7, 'Shared House Key', 'Janet covers symmetric encryption: AES, DES, 3DES, key distribution problem.', ARRAY['Symmetric Cryptography'], ARRAY['symmetric', 'AES', 'DES', '3DES', 'shared key', 'block cipher', 'stream cipher', 'key distribution'], ARRAY['symmetric-cryptography'], 2, false, false, 'teaching', 'Shared House Key', 'janet', NULL),

-- Scene 8: Asymmetric Cryptography
('d3a1s8', 3, 1, 8, 'Mailbox and Master Key', 'Janet covers asymmetric encryption: RSA, ECC, DH, public/private key pairs.', ARRAY['Asymmetric Cryptography'], ARRAY['asymmetric', 'RSA', 'ECC', 'Diffie-Hellman', 'public key', 'private key', 'digital signature'], ARRAY['asymmetric-cryptography'], 2, false, false, 'teaching', 'Mailbox and Master Key', 'janet', NULL),

-- Scene 9: Hashing
('d3a1s9', 3, 1, 9, 'Fingerprint Scanner', 'Janet teaches hashing: one-way functions, MD5, SHA family, collisions, birthday attack.', ARRAY['Hashing'], ARRAY['hash', 'MD5', 'SHA-1', 'SHA-2', 'SHA-3', 'collision', 'birthday attack', 'message digest', 'HMAC'], ARRAY['hashing'], 2, false, false, 'teaching', 'Fingerprint Scanner', 'janet', NULL),

-- Scene 10: Common Criteria / EAL
('d3a1s10', 3, 1, 10, 'Consumer Reports Rating', 'Reeves covers Common Criteria: EAL 1-7, TOE, ST, PP, replacing TCSEC/ITSEC.', ARRAY['Common Criteria'], ARRAY['Common Criteria', 'EAL', 'TOE', 'Security Target', 'Protection Profile', 'TCSEC', 'Orange Book', 'ISO 15408'], ARRAY['common-criteria'], 2, false, true, 'teaching', 'Consumer Reports Rating', 'reeves', NULL),

-- Scene 11: Covert Channels
('d3a1s11', 3, 1, 11, 'Smuggler''s Hidden Compartment', 'Morales explains covert storage and timing channels used by the attacker.', ARRAY['Covert Channels'], ARRAY['covert channel', 'covert storage channel', 'covert timing channel', 'side channel'], ARRAY['covert-channels'], 2, false, false, 'teaching', 'Smuggler''s Hidden Compartment', 'morales', NULL),

-- Scene 12: Wrap-up
('d3a1s12', 3, 1, 12, 'End of Day One', 'Reeves and Janet summarize Day 1 findings and tease the deeper investigation ahead.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 2: The Investigation (13 scenes)
-- ============================================================

-- Scene 1: Narrative Transition
('d3a2s1', 3, 2, 1, 'Day Two Begins', 'Day 2 at the forensics lab — the team traces the attack through forged certificates.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: PKI and Digital Certificates
('d3a2s2', 3, 2, 2, 'Digital Passport Office', 'Janet teaches PKI, CA hierarchy, X.509 certificates, CRL vs OCSP.', ARRAY['PKI and Digital Certificates'], ARRAY['PKI', 'CA', 'Root CA', 'intermediate CA', 'X.509', 'CRL', 'OCSP', 'certificate chain', 'certificate pinning'], ARRAY['pki-certificates'], 3, false, false, 'teaching', 'Digital Passport Office', 'janet', 'process_flow'),

-- Scene 3: Digital Signatures
('d3a2s3', 3, 2, 3, 'Wax Seal and Signet Ring', 'Janet covers digital signature creation, verification, and the no-confidentiality exam trap.', ARRAY['Digital Signatures'], ARRAY['digital signature', 'nonrepudiation', 'integrity', 'authentication', 'DSA', 'ECDSA', 'code signing'], ARRAY['digital-signatures'], 3, false, false, 'teaching', 'Wax Seal and Signet Ring', 'janet', 'process_flow'),

-- Scene 4: Key Management Lifecycle
('d3a2s4', 3, 2, 4, 'Key Ring Maintenance', 'Janet walks through the 8-stage key management lifecycle.', ARRAY['Key Management Lifecycle'], ARRAY['key generation', 'key distribution', 'key storage', 'key rotation', 'key revocation', 'key archival', 'key destruction', 'zeroization', 'cryptoperiod'], ARRAY['key-management'], 2, false, false, 'teaching', 'Key Ring Maintenance', 'janet', NULL),

-- Scene 5: Hybrid Cryptography
('d3a2s5', 3, 2, 5, 'Envelope Inside a Lockbox', 'Janet explains combining symmetric speed with asymmetric key exchange; TLS handshake.', ARRAY['Hybrid Cryptography'], ARRAY['hybrid cryptography', 'session key', 'TLS handshake', 'key exchange', 'symmetric speed', 'asymmetric key exchange'], ARRAY['hybrid-cryptography'], 2, false, false, 'teaching', 'Envelope Inside a Lockbox', 'janet', NULL),

-- Scene 6: Cloud Computing Security
('d3a2s6', 3, 2, 6, 'Shared Apartment Building', 'Kai teaches cloud service models, shared responsibility, and NIST characteristics.', ARRAY['Cloud Computing Security'], ARRAY['IaaS', 'PaaS', 'SaaS', 'shared responsibility', 'multi-tenancy', 'cloud', 'NIST SP 800-145'], ARRAY['cloud-security'], 3, false, true, 'teaching', 'Shared Apartment Building', 'kai', 'comparison'),

-- Scene 7: Virtualization and Hypervisor Security
('d3a2s7', 3, 2, 7, 'Apartment vs House', 'Janet covers Type 1/2 hypervisors, VM escape, containers vs VMs.', ARRAY['Virtualization and Hypervisor Security'], ARRAY['hypervisor', 'Type 1', 'Type 2', 'bare metal', 'VM escape', 'container', 'Docker', 'Kubernetes'], ARRAY['virtualization-security'], 2, false, false, 'teaching', 'Apartment vs House', 'janet', NULL),

-- Scene 8: Fire Prevention, Detection, and Suppression
('d3a2s8', 3, 2, 8, 'Kitchen Fire Safety', 'Morales covers fire classes, VESDA, suppression systems, Halon ban.', ARRAY['Fire Prevention Detection Suppression'], ARRAY['fire class', 'VESDA', 'pre-action', 'wet pipe', 'dry pipe', 'deluge', 'FM-200', 'Halon', 'Montreal Protocol', 'fire triangle'], ARRAY['fire-suppression'], 3, false, false, 'teaching', 'Kitchen Fire Safety', 'morales', 'decision_map'),

-- Scene 9: Physical Access Controls
('d3a2s9', 3, 2, 9, 'Bank Vault Entry Protocol', 'Morales covers fences, mantraps, badge access, fail-safe vs fail-secure.', ARRAY['Physical Access Controls'], ARRAY['fence', 'mantrap', 'badge access', 'tailgating', 'fail-safe', 'fail-secure', 'bollard', 'turnstile'], ARRAY['physical-access-controls'], 2, false, false, 'teaching', 'Bank Vault Entry Protocol', 'morales', NULL),

-- Scene 10: Power and Environmental Controls
('d3a2s10', 3, 2, 10, 'Life Support Systems', 'Janet covers UPS, generators, HVAC, humidity, temperature, hot/cold aisle.', ARRAY['Power and Environmental Controls'], ARRAY['UPS', 'generator', 'HVAC', 'humidity', 'temperature', 'hot aisle', 'cold aisle', 'positive pressure', 'ESD'], ARRAY['power-environmental'], 2, false, false, 'teaching', 'Life Support Systems', 'janet', NULL),

-- Scene 11: TPM and HSM
('d3a2s11', 3, 2, 11, 'Safe Deposit Box', 'Janet covers TPM hardware root of trust, PCRs, HSM for crypto processing, FIPS 140.', ARRAY['TPM and HSM'], ARRAY['TPM', 'HSM', 'PCR', 'FIPS 140-2', 'hardware root of trust', 'secure boot', 'attestation'], ARRAY['tpm-hsm'], 2, false, false, 'teaching', 'Safe Deposit Box', 'janet', NULL),

-- Scene 12: CPTED + Zero Trust
('d3a2s12', 3, 2, 12, 'Neighborhood Watch & Never Trust', 'Morales on CPTED design principles, Kai introduces Zero Trust architecture.', ARRAY['CPTED', 'Zero Trust'], ARRAY['CPTED', 'natural surveillance', 'natural access control', 'territorial reinforcement', 'zero trust', 'micro-segmentation', 'NIST SP 800-207'], ARRAY['cpted', 'zero-trust-intro'], 2, false, false, 'teaching', 'Neighborhood Watch Design', 'morales', NULL),

-- Scene 13: Wrap-up
('d3a2s13', 3, 2, 13, 'The Backdoor Discovery', 'Morales reveals persistent backdoors. Janet teases Act 4 advanced topics.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL),

-- ============================================================
-- ACT 4: The Escalation (15 scenes)
-- ============================================================

-- Scene 1: Crisis Escalation
('d3a4s1', 3, 4, 1, 'Crisis Status', 'Day 4 emergency — attacker has implanted persistent backdoors using advanced techniques.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'narrative', NULL, NULL, NULL),

-- Scene 2: Cryptanalytic Attacks
('d3a4s2', 3, 4, 2, 'Codebreaker''s Toolkit', 'Janet covers brute force, known/chosen plaintext, meet-in-the-middle, birthday, rainbow tables, side-channel.', ARRAY['Cryptanalytic Attacks'], ARRAY['brute force', 'known plaintext', 'chosen plaintext', 'meet-in-the-middle', 'birthday attack', 'rainbow table', 'salting', 'side-channel'], ARRAY['cryptanalytic-attacks'], 2, false, false, 'teaching', 'Codebreaker''s Toolkit', 'janet', NULL),

-- Scene 3: Block Cipher Modes
('d3a4s3', 3, 4, 3, 'Assembly Line Styles', 'Janet covers ECB, CBC, CTR, GCM modes with the assembly line analogy.', ARRAY['Block Cipher Modes'], ARRAY['ECB', 'CBC', 'CTR', 'GCM', 'IV', 'initialization vector', 'authenticated encryption'], ARRAY['block-cipher-modes'], 2, false, false, 'teaching', 'Assembly Line Styles', 'janet', NULL),

-- Scene 4: Brewer-Nash (Chinese Wall)
('d3a4s4', 3, 4, 4, 'Law Firm Firewall', 'Reeves teaches the dynamic conflict-of-interest model.', ARRAY['Brewer-Nash Model'], ARRAY['Brewer-Nash', 'Chinese Wall', 'conflict of interest', 'dynamic access control'], ARRAY['brewer-nash'], 2, false, false, 'teaching', 'Law Firm Firewall', 'reeves', NULL),

-- Scene 5: TOCTOU / Race Conditions
('d3a4s5', 3, 4, 5, 'Ticket Scalper Timing', 'Janet explains time-of-check vs time-of-use vulnerabilities and mitigations.', ARRAY['TOCTOU Race Conditions'], ARRAY['TOCTOU', 'race condition', 'time-of-check', 'time-of-use', 'mutex', 'atomic operation'], ARRAY['toctou'], 2, false, false, 'teaching', 'Ticket Scalper Timing', 'janet', NULL),

-- Scene 6: ICS/SCADA Security
('d3a4s6', 3, 4, 6, 'Factory Floor Fortress', 'Morales covers SCADA/ICS risks, PLCs, air-gapping, patching challenges.', ARRAY['ICS SCADA Security'], ARRAY['SCADA', 'ICS', 'PLC', 'air gap', 'DCS', 'safety instrumented system'], ARRAY['ics-scada-security'], 3, true, false, 'teaching', 'Factory Floor Fortress', 'morales', NULL),

-- Scene 7: Steganography
('d3a4s7', 3, 4, 7, 'Invisible Ink Letter', 'Janet explains hiding data within media — not encryption, security through obscurity.', ARRAY['Steganography'], ARRAY['steganography', 'digital watermark', 'null cipher', 'LSB insertion'], ARRAY['steganography'], 2, false, false, 'teaching', 'Invisible Ink Letter', 'janet', NULL),

-- Scene 8: Homomorphic Encryption + Quantum Crypto
('d3a4s8', 3, 4, 8, 'Sealed Ballot Counting & Quantum Lock Picking', 'Janet covers computation on encrypted data and quantum/post-quantum cryptography.', ARRAY['Homomorphic Encryption', 'Quantum Cryptography'], ARRAY['homomorphic encryption', 'FHE', 'quantum computing', 'QKD', 'post-quantum', 'crypto agility', 'Shor algorithm'], ARRAY['homomorphic-encryption', 'quantum-crypto'], 2, false, false, 'teaching', 'Sealed Ballot Counting', 'janet', NULL),

-- Scene 9: Lightweight Crypto + One-Time Pad
('d3a4s9', 3, 4, 9, 'Travel-Size Security & Self-Destructing Cipher', 'Janet covers IoT crypto constraints and the theoretically unbreakable one-time pad.', ARRAY['Lightweight Cryptography', 'One-Time Pad'], ARRAY['lightweight cryptography', 'IoT', 'embedded', 'one-time pad', 'OTP', 'Vernam cipher'], ARRAY['lightweight-crypto', 'one-time-pad'], 2, false, false, 'teaching', 'Travel-Size Security', 'janet', NULL),

-- Scene 10: Museum of Formal Models
('d3a4s10', 3, 4, 10, 'Museum of Formal Models', 'Janet covers Graham-Denning, HRU, Take-Grant, Goguen-Meseguer, Sutherland models.', ARRAY['Formal Security Models'], ARRAY['Graham-Denning', 'HRU', 'Take-Grant', 'Goguen-Meseguer', 'Sutherland', 'noninterference'], ARRAY['formal-models'], 2, false, false, 'teaching', 'Museum of Formal Models', 'janet', NULL),

-- Scene 11: Enterprise Architecture Frameworks
('d3a4s11', 3, 4, 11, 'City Planning Methodologies', 'Reeves covers Zachman, TOGAF, and SABSA frameworks.', ARRAY['Enterprise Architecture Frameworks'], ARRAY['Zachman', 'TOGAF', 'SABSA', 'ADM', 'enterprise architecture'], ARRAY['architecture-frameworks'], 2, false, false, 'teaching', 'City Planning Methodologies', 'reeves', NULL),

-- Scene 12: Edge/Fog/CDN + Microservices/Serverless
('d3a4s12', 3, 4, 12, 'Branch Office Network & Food Truck Fleet', 'Janet covers edge/fog computing, CDN security, microservices, and serverless architectures.', ARRAY['Edge Computing', 'Microservices and Serverless'], ARRAY['edge computing', 'fog computing', 'CDN', 'microservices', 'serverless', 'FaaS', 'API gateway', 'service mesh'], ARRAY['edge-computing', 'microservices-serverless'], 2, false, false, 'teaching', 'Branch Office Network', 'janet', NULL),

-- Scene 13: Security Modes of Operation
('d3a4s13', 3, 4, 13, 'Building Clearance Levels', 'Morales covers dedicated, system high, compartmented, and multilevel security modes.', ARRAY['Security Modes of Operation'], ARRAY['dedicated mode', 'system high', 'compartmented', 'multilevel', 'clearance', 'need-to-know'], ARRAY['security-modes'], 2, false, false, 'teaching', 'Building Clearance Levels', 'morales', NULL),

-- Scene 14: Web App Vulnerabilities + Crypto-shredding
('d3a4s14', 3, 4, 14, 'Open Window Exploits & Burning the Key Ring', 'Janet covers XSS, CSRF, SQLi, input validation, and crypto-shredding for cloud data.', ARRAY['Web Application Vulnerabilities', 'Crypto-shredding'], ARRAY['XSS', 'CSRF', 'SQL injection', 'input validation', 'SSRF', 'crypto-shredding', 'data remanence'], ARRAY['web-vulnerabilities', 'crypto-shredding'], 2, false, true, 'teaching', 'Open Window Exploits', 'janet', NULL),

-- Scene 15: Boss Battle Prep
('d3a4s15', 3, 4, 15, 'Ready for the Boss Battle', 'All NPCs prepare the player for the Domain 3 comprehensive assessment.', ARRAY[]::text[], ARRAY[]::text[], ARRAY[]::text[], 1, false, false, 'debrief', NULL, NULL, NULL)
ON CONFLICT (scene_id) DO NOTHING;
