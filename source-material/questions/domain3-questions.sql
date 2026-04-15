-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 3 Question Bank
-- Security Architecture and Engineering — 100 Questions
--
-- Distribution:
--   Difficulty: 15 easy, 55 medium, 20 hard, 10 very_hard
--   Cognitive:  10 remember, 20 understand, 45 apply, 25 analyze
--   Type:       25 scenario, 20 first_action, 15 best_answer,
--               10 most_likely, 10 tlatm, 10 comparison,
--               5 calculation, 5 except_not
--   Correct:    25 each at index 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY QUESTIONS (15) — b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: easy / remember / comparison — correct=0
-- b = -1.5 + (-0.5) + 0.1 = -1.90, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  3,
  'security_models',
  'What is the PRIMARY difference between the Bell-LaPadula model and the Biba model?',
  '["Bell-LaPadula enforces confidentiality while Biba enforces integrity", "Bell-LaPadula is used for commercial systems while Biba is used for military systems", "Bell-LaPadula uses mandatory access controls while Biba uses discretionary access controls", "Bell-LaPadula prevents unauthorized modification while Biba prevents unauthorized disclosure"]'::jsonb,
  0,
  'Bell-LaPadula focuses on confidentiality with its "no read up, no write down" rules. Biba focuses on integrity with its "no read down, no write up" rules. They are essentially mirror images of each other in terms of data flow direction. Both use mandatory access controls, and either can be used in military or commercial environments.',
  'BLP = BLocks Peeking (confidentiality). Biba = Blocks Bad data (integrity). They are OPPOSITES in direction.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q2: easy / remember / best_answer — correct=1
-- b = -1.5 + (-0.5) + 0.0 = -2.00, a = 0.8 + 0.0 = 0.80, c = 0.20
(
  3,
  'symmetric_crypto',
  'Which of the following BEST describes AES?',
  '["An asymmetric algorithm using 128-bit key pairs for digital signatures", "A symmetric block cipher supporting 128, 192, and 256-bit key lengths", "A hashing algorithm that produces a 256-bit message digest", "A key exchange protocol based on the discrete logarithm problem"]'::jsonb,
  1,
  'AES (Advanced Encryption Standard, also known as Rijndael) is a symmetric block cipher that operates on 128-bit blocks and supports key lengths of 128, 192, and 256 bits with 10, 12, and 14 rounds respectively. It replaced DES as the federal standard. AES is not asymmetric, not a hash, and not a key exchange protocol.',
  'AES = Always Encrypts Symmetrically. Key sizes: 128/192/256. Block size always 128.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q3: easy / understand / scenario — correct=2
-- b = -1.5 + 0.0 + 0.2 = -1.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'secure_design_principles',
  'A building manager is configuring an electronic door lock system for an office building. Fire safety regulations require that all doors unlock automatically during a fire alarm so employees can evacuate. Which security design principle is being applied?',
  '["Fail-secure, because the doors default to a locked state under normal conditions", "Defense in depth, because multiple layers of safety controls are being used", "Fail-safe, because the doors unlock to prioritize human safety during an emergency", "Least privilege, because employees are given minimum access needed for evacuation"]'::jsonb,
  2,
  'Fail-safe means the system defaults to a state that prioritizes human safety when it fails or during an emergency. Doors unlocking during a fire alarm is the classic example of fail-safe design. Fail-secure would keep doors locked, which could trap people. This is not defense in depth or least privilege. On the CISSP exam, human safety ALWAYS takes priority.',
  'Fail-SAFE = SAFETY first (doors open, people escape). Fail-SECURE = SECURITY first (doors lock, access blocked).',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q4: easy / understand / best_answer — correct=3
-- b = -1.5 + 0.0 + 0.0 = -1.50, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  3,
  'hashing',
  'Which of the following BEST describes the purpose of a hash function in cryptography?',
  '["To encrypt data so that only authorized recipients can read it", "To exchange keys securely between two parties over an insecure channel", "To generate a public-private key pair for digital certificate enrollment", "To produce a fixed-length fingerprint of data for verifying integrity"]'::jsonb,
  3,
  'A hash function takes an input of any size and produces a fixed-length output (message digest) that serves as a fingerprint of the data. Its primary purpose is integrity verification: if the data changes, the hash changes. Hashing is one-way and does not encrypt data for confidentiality, exchange keys, or generate key pairs.',
  'Hash = fingerprint. Fixed-length, one-way, integrity check. Change 1 bit of input, output completely changes (avalanche effect).',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q5: easy / apply / scenario — correct=0
-- b = -1.5 + 0.3 + 0.2 = -1.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'fire_suppression',
  'A facilities manager is selecting a fire suppression system for a new data center that houses critical servers and networking equipment. The system must suppress fires without damaging electronic equipment and must be safe for occupied spaces. Which suppression system is MOST appropriate?',
  '["FM-200 clean agent suppression system", "Wet pipe sprinkler system", "CO2 total flooding system", "Deluge sprinkler system"]'::jsonb,
  0,
  'FM-200 is a clean agent that suppresses fire by interrupting the chemical chain reaction without damaging electronic equipment and is safe for occupied spaces. Wet pipe and deluge systems use water, which damages electronics. CO2 suppresses fire by displacing oxygen but is lethal to humans in the concentrations needed, making it unsafe for occupied areas.',
  'FM-200 = Friendly to Machines, safe for 200 people. CO2 = Can Off you (lethal). Water = Wrecks electronics.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q6: easy / understand / comparison — correct=1
-- b = -1.5 + 0.0 + 0.1 = -1.40, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  3,
  'virtualization',
  'What is the PRIMARY difference between a Type 1 and a Type 2 hypervisor?',
  '["Type 1 supports more virtual machines concurrently than Type 2", "Type 1 runs directly on hardware while Type 2 runs on top of a host operating system", "Type 1 uses hardware-assisted virtualization while Type 2 uses software emulation only", "Type 1 is open source while Type 2 is proprietary commercial software"]'::jsonb,
  1,
  'A Type 1 (bare-metal) hypervisor runs directly on the physical hardware without a host OS, providing better performance and security. A Type 2 (hosted) hypervisor runs on top of a conventional operating system. Type 1 is considered more secure because it has a smaller attack surface. The distinction is not about capacity, virtualization technique, or licensing.',
  'Type 1 = First on the hardware (bare metal). Type 2 = Two layers (OS then hypervisor). Lower number = closer to metal = more secure.',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q7: easy / apply / first_action — correct=2
-- b = -1.5 + 0.3 + 0.3 = -0.90, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'physical_access',
  'A security guard notices an unfamiliar individual following closely behind an authorized employee through a badge-controlled entrance. What should the guard do FIRST?',
  '["Review CCTV footage to identify the individual", "Report the incident to the security operations center for investigation", "Politely stop the individual and verify their authorization before allowing entry", "Lock down the entire facility and initiate emergency response procedures"]'::jsonb,
  2,
  'The guard should first stop and verify the individual''s credentials, as this is a potential tailgating/piggybacking attempt. Reviewing CCTV is a follow-up activity, not an immediate action. Reporting to the SOC is important but comes after initial verification. A full lockdown is disproportionate for a suspected tailgating incident. The immediate action is always to verify authorization.',
  'Tailgating FIRST response: STOP and CHECK. Everything else follows.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q8: easy / remember / most_likely — correct=3
-- b = -1.5 + (-0.5) + 0.1 = -1.90, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  3,
  'pki_certificates',
  'An employee receives a digitally signed email from a colleague. What is the employee MOST LIKELY able to verify using the digital signature?',
  '["That the email content was encrypted during transmission across the network", "That no unauthorized third party read the email while it was in transit", "That the email was scanned for malware before being delivered to the inbox", "That the email truly came from the stated sender and was not altered in transit"]'::jsonb,
  3,
  'Digital signatures provide authentication (proof of sender identity), integrity (proof that the message was not altered), and nonrepudiation (sender cannot deny sending it). Digital signatures do NOT provide confidentiality — the email content is not encrypted by the signature. They also do not scan for malware.',
  'Digital Signatures = AIN (Authentication, Integrity, Nonrepudiation). NOT confidentiality! That is a classic exam trap.',
  'remember',
  'most_likely',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q9: easy / remember / best_answer — correct=0
-- b = -1.5 + (-0.5) + 0.0 = -2.00, a = 0.8 + 0.0 = 0.80, c = 0.20
(
  3,
  'key_management',
  'An organization needs to ensure that encrypted backup tapes remain readable even if the original encryption keys are lost. Which key management practice BEST addresses this requirement?',
  '["Implementing key escrow so a trusted third party holds copies of encryption keys", "Using longer encryption keys to increase the work factor for brute force attacks", "Rotating encryption keys more frequently to limit the exposure window", "Switching from symmetric to asymmetric encryption for all backup operations"]'::jsonb,
  0,
  'Key escrow involves giving a copy of encryption keys to a trusted third party, ensuring data can still be decrypted if the original keys are lost. Longer keys increase security but do not address key loss. More frequent rotation actually increases the risk of losing track of which key encrypted which backup. Switching to asymmetric encryption does not solve the key loss problem.',
  'Key ESCROW = ESCAPE plan for lost keys. Third party holds a copy just in case.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q10: easy / understand / first_action — correct=1
-- b = -1.5 + 0.0 + 0.3 = -1.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'power_environmental',
  'A data center experiences a sudden power outage. What should activate FIRST to maintain operations?',
  '["Backup diesel generators to provide long-term power for sustained operations", "Uninterruptible Power Supply (UPS) units to provide immediate battery backup", "Power line conditioners to filter and stabilize the incoming electrical supply", "Automatic transfer switches to redirect power from an alternate utility feed"]'::jsonb,
  1,
  'UPS units activate instantly (within milliseconds) to provide immediate battery power when utility power fails. They bridge the gap until generators can start, which typically takes 10-30 seconds. Line conditioners address power quality, not outages. Transfer switches redirect power sources but are not the first response. The sequence is: UPS first, then generators.',
  'Power failure sequence: UPS = Urgent Power Savior (instant). Generators = long-term backup (takes seconds to start).',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),

-- Q11: easy / remember / most_likely — correct=2
-- b = -1.5 + (-0.5) + 0.1 = -1.90, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  3,
  'common_criteria',
  'A government agency requires that all security products purchased meet a minimum level of independent security evaluation. Which evaluation framework are they MOST LIKELY referencing?',
  '["NIST Cybersecurity Framework with its five core functions", "ISO 27001 certification for information security management systems", "Common Criteria with Evaluation Assurance Levels (EAL 1-7)", "SOC 2 Type II audit reports for service organization controls"]'::jsonb,
  2,
  'Common Criteria (ISO/IEC 15408) is the international standard for evaluating IT security products, using Evaluation Assurance Levels (EAL 1-7) to rate the depth of evaluation. Government agencies commonly require specific EAL levels. NIST CSF is a risk management framework, not product evaluation. ISO 27001 certifies management systems. SOC 2 audits service organizations.',
  'Common Criteria = Product evaluation. EAL = how deeply tested. EAL4 = highest commonly achieved commercially.',
  'remember',
  'most_likely',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q12: easy / remember / except_not — correct=3
-- b = -1.5 + (-0.5) + 0.2 = -1.80, a = 0.8 + (-0.1) = 0.70, c = 0.25
(
  3,
  'digital_signatures',
  'Digital signatures provide all of the following security services EXCEPT:',
  '["Authentication of the message sender", "Integrity verification of the message content", "Nonrepudiation preventing the sender from denying they sent the message", "Confidentiality ensuring only the intended recipient can read the message"]'::jsonb,
  3,
  'Digital signatures provide authentication (verifying the sender), integrity (detecting message changes), and nonrepudiation (sender cannot deny sending). They do NOT provide confidentiality. The message content remains readable by anyone. Encryption is needed for confidentiality. This is one of the most tested exam traps in Domain 3.',
  'Digital Signatures = AIN. NO "C" for Confidentiality! Signing is not encrypting.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),

-- Q13: easy / understand / scenario — correct=0
-- b = -1.5 + 0.0 + 0.2 = -1.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'secure_design_principles',
  'A new employee at a financial institution is granted access only to the specific systems and data required for their job role. They cannot access customer account databases, HR records, or executive financial reports unless specifically authorized. Which security principle is being demonstrated?',
  '["Least privilege, granting only the minimum access necessary to perform job duties", "Separation of duties, requiring multiple people to complete a critical task", "Defense in depth, implementing multiple overlapping security controls", "Need to know, restricting access based on classification compartments"]'::jsonb,
  0,
  'Least privilege means granting users only the minimum level of access required to perform their job functions. The employee only has access to what they need, nothing more. Separation of duties requires splitting critical tasks among multiple people. Defense in depth uses layered controls. Need to know is related but specifically applies to classified information compartments.',
  'Least Privilege = Minimum access to do Maximum work. Only what you NEED, nothing you WANT.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q14: easy / apply / comparison — correct=1
-- b = -1.5 + 0.3 + 0.1 = -1.10, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  3,
  'block_cipher_modes',
  'A security engineer needs to choose between ECB and CBC modes for encrypting a large database backup file. Which statement BEST compares these two modes?',
  '["ECB is more secure because it processes each block independently without dependencies", "CBC is more secure because it chains blocks together, preventing pattern recognition in the ciphertext", "ECB is preferred for bulk data because its chaining mechanism provides better error recovery", "CBC is faster because it can process multiple blocks simultaneously in parallel"]'::jsonb,
  1,
  'CBC (Cipher Block Chaining) is more secure than ECB because it XORs each plaintext block with the previous ciphertext block before encryption, preventing identical plaintext blocks from producing identical ciphertext blocks. ECB encrypts each block independently, which reveals patterns in the data. ECB has no chaining mechanism. CBC cannot be parallelized for encryption (though decryption can be).',
  'ECB = Electronic CODEBOOK = each block alone = patterns visible (penguin image!). CBC = CHAINING = blocks linked = patterns hidden.',
  'apply',
  'comparison',
  'easy',
  1.40, -1.10, 0.22,
  'ai_generated', true
),

-- Q15: easy / understand / tlatm — correct=2
-- b = -1.5 + 0.0 + 0.5 = -1.00, a = 1.0 + 0.4 = 1.40, c = 0.20
(
  3,
  'cloud_security',
  'As a CISO evaluating a move to a SaaS-based email platform, what should be your PRIMARY concern regarding the shared responsibility model?',
  '["Ensuring the cloud provider uses the latest version of hypervisor software for virtualization", "Negotiating the technical specifications of the physical data center cooling systems", "Understanding that your organization remains accountable for the data even though the provider manages the platform", "Requiring the provider to grant your team root access to the underlying operating systems"]'::jsonb,
  2,
  'In the shared responsibility model, the data owner (your organization) always remains accountable for the data regardless of where it is processed or stored. With SaaS, the provider manages the entire stack (infrastructure, platform, and application), but data governance, classification, and regulatory compliance remain the customer''s responsibility. Hypervisor management, physical cooling, and OS access are provider responsibilities in SaaS.',
  'Cloud rule: You can outsource RESPONSIBILITY but never ACCOUNTABILITY. Your data = your problem, always.',
  'understand',
  'tlatm',
  'easy',
  1.40, -1.00, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM QUESTIONS (55) — b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: medium / understand / scenario — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'security_models',
  'A military classified document system enforces rules where analysts with Secret clearance cannot access Top Secret documents and users at Top Secret level cannot write information down to an Unclassified repository. A new analyst asks which model governs these access rules. Which security model is being implemented?',
  '["Biba model, which prevents unauthorized data modification through integrity axioms", "Clark-Wilson model, which enforces integrity through well-formed transactions", "Brewer-Nash model, which dynamically prevents conflicts of interest", "Bell-LaPadula model, which enforces confidentiality through mandatory access controls"]'::jsonb,
  3,
  'Bell-LaPadula enforces confidentiality with two key properties: Simple Security (no read up) prevents lower-cleared subjects from reading higher-classified data, and the Star Property (no write down) prevents higher-cleared subjects from writing to lower classification levels. Biba addresses integrity, Clark-Wilson uses transactions for integrity, and Brewer-Nash handles conflict of interest.',
  'Bell-LaPadula: "No Read Up, No Write Down" = keeps secrets from leaking DOWN. Think: "Bell rings at the TOP" = protects TOP secret info.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: medium / apply / scenario — correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'symmetric_crypto',
  'A healthcare organization needs to encrypt patient records stored in a database. The system processes over 10,000 records per minute and must meet HIPAA compliance requirements. The security team needs a FIPS 140-2 validated encryption algorithm. Which algorithm should they select?',
  '["AES-256, which is FIPS validated and provides fast symmetric encryption suitable for high-volume data processing", "RSA-2048, which provides strong encryption with FIPS validation for enterprise data protection", "3DES with 168-bit keys, which offers triple the security of DES for sensitive healthcare records", "Blowfish with 448-bit keys, which provides the strongest key length among available symmetric ciphers"]'::jsonb,
  0,
  'AES-256 is the correct choice: it is FIPS 140-2 validated, provides strong symmetric encryption, and is fast enough for high-volume processing. RSA is asymmetric and far too slow for bulk data encryption. 3DES is deprecated and much slower than AES. Blowfish is not FIPS validated and uses 64-bit blocks, making it unsuitable for large data volumes due to birthday bound issues.',
  'AES = the STANDARD. FIPS validated, fast, federal approved. When in doubt on symmetric, AES is the answer.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q18: medium / apply / first_action — correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'pki_certificates',
  'A web server''s SSL/TLS certificate has been compromised due to a private key theft. All four steps will eventually be taken. What should the security team do FIRST?',
  '["Generate a new public-private key pair and submit a certificate signing request to the CA", "Revoke the compromised certificate by contacting the Certificate Authority immediately", "Update the Certificate Revocation List and ensure OCSP responders reflect the revocation", "Conduct a forensic investigation to determine how the private key was stolen"]'::jsonb,
  1,
  'The first action must be to revoke the compromised certificate by contacting the CA. This prevents the attacker from continuing to use the stolen private key to impersonate the server. Generating new keys is important but comes after revocation. CRL/OCSP updates happen as a result of revocation. Forensic investigation is important but does not stop the immediate threat. Stop the bleeding first.',
  'Key compromise FIRST action: REVOKE the cert. Stop the attacker from using it NOW. Everything else follows.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: medium / apply / best_answer — correct=2
-- b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  3,
  'tpm_hsm',
  'An organization wants to protect its root Certificate Authority private key with the highest level of hardware security. Which solution BEST meets this requirement?',
  '["Storing the key in a TPM chip soldered to the CA server motherboard", "Using full-disk encryption on the CA server with a strong passphrase", "Storing the key in a FIPS 140-2 Level 3 validated Hardware Security Module", "Encrypting the key with AES-256 and storing it in a secure database vault"]'::jsonb,
  2,
  'An HSM (Hardware Security Module) validated to FIPS 140-2 Level 3 provides tamper-evident, tamper-resistant hardware protection specifically designed for high-value cryptographic key operations. TPMs provide platform-level security but are not designed for enterprise PKI key management. Full-disk encryption and database vaults protect data at rest but do not provide the dedicated cryptographic processing and physical tamper protection of an HSM.',
  'HSM = the VAULT for keys. FIPS 140-2 Level 3 = tamper resistant + physical security. Gold standard for CA root keys.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q20: medium / analyze / scenario — correct=3
-- b = 0.0 + 0.6 + 0.2 = 0.80, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'covert_channels',
  'A security auditor notices that a classified system''s CPU utilization spikes briefly every time a specific background process runs, and these spikes correspond to patterns of data being exfiltrated from an air-gapped network. The process itself has no network access and does not write to any shared files. What type of vulnerability has the auditor discovered?',
  '["A buffer overflow exploit that manipulates memory to create unauthorized data paths", "A covert storage channel that hides data within unused fields of system file headers", "A backdoor installed by a developer that enables remote command execution", "A covert timing channel that encodes information in the timing patterns of system activity"]'::jsonb,
  3,
  'A covert timing channel encodes information through the timing of system events rather than through data storage. The CPU utilization spikes are timing-based signals that can encode binary data (spike = 1, no spike = 0). This differs from covert storage channels, which hide data in shared storage locations. There is no buffer overflow or backdoor involved since the process uses timing patterns, not memory corruption or remote access.',
  'Covert TIMING channel = information in WHEN things happen. Covert STORAGE channel = information in WHERE data is stored. CPU spikes = TIMING.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q21: medium / apply / tlatm — correct=0
-- b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  3,
  'cloud_security',
  'As a security manager, your organization is migrating critical financial applications to an IaaS cloud provider. From a management perspective, what is the MOST important consideration for maintaining your security posture?',
  '["Ensuring your team understands which security controls are your responsibility versus the provider''s under the shared responsibility model", "Requiring the cloud provider to give you physical access to inspect their data center facilities quarterly", "Mandating that the provider use only open-source software for all infrastructure components", "Insisting that all cloud resources be deployed in a single availability zone for simplified management"]'::jsonb,
  0,
  'Understanding the shared responsibility model is the most critical management consideration. In IaaS, the customer is responsible for OS patching, application security, data protection, and access management, while the provider handles physical infrastructure. Physical data center access is unrealistic in cloud environments. Open-source mandates are not a primary security concern. Single availability zones reduce resilience.',
  'IaaS shared responsibility: Provider = physical. Customer = OS and up. Think Like a Manager: KNOW your responsibilities FIRST.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q22: medium / understand / most_likely — correct=1
-- b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  3,
  'cryptanalytic_attacks',
  'An attacker has collected multiple encrypted messages and their corresponding plaintext versions from a compromised email system. What type of cryptanalytic attack is MOST LIKELY to be attempted next?',
  '["Ciphertext-only attack, analyzing patterns within the collected encrypted messages", "Known plaintext attack, using the plaintext-ciphertext pairs to derive the encryption key", "Brute force attack, systematically trying every possible key until decryption succeeds", "Birthday attack, finding hash collisions to forge message authentication codes"]'::jsonb,
  1,
  'A known plaintext attack uses matched pairs of plaintext and corresponding ciphertext to determine the encryption key or algorithm characteristics. Since the attacker already has these pairs, this is the most logical attack to attempt. A ciphertext-only attack uses less information than available. Brute force ignores the valuable pairs. Birthday attacks target hash functions, not encryption.',
  'Known Plaintext = attacker KNOWS some plain-cipher pairs. Chosen Plaintext = attacker CHOOSES what to encrypt. Known < Chosen in attacker power.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q23: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'asymmetric_crypto',
  'A software company needs to distribute software updates to millions of customers while ensuring that each update is authentic and has not been tampered with. The solution must be scalable and not require sharing secret keys with every customer. Which approach should the company implement?',
  '["Encrypt each update with a unique symmetric key and distribute the key via a secure channel to each customer", "Calculate an MD5 hash of the update and publish it on the company website for customers to verify", "Sign each update with the company''s private key so customers can verify the signature using the widely distributed public key", "Use a shared HMAC key embedded in the client software to verify the integrity of each downloaded update"]'::jsonb,
  2,
  'Digital signatures using asymmetric cryptography solve this perfectly: the company signs updates with its private key, and all customers verify using the public key. This scales to millions of users without sharing secrets. Symmetric keys cannot scale to millions of customers. MD5 is broken and publishing a hash on a website does not prove authenticity. HMAC requires a shared secret key that could be extracted from client software.',
  'Digital signatures for distribution: Private key SIGNS (company keeps secret), Public key VERIFIES (everyone has it). Perfect for 1-to-many.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q24: medium / analyze / first_action — correct=3
-- b = 0.0 + 0.6 + 0.3 = 0.90, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'ics_scada',
  'An industrial control system monitoring a chemical plant displays anomalous sensor readings that could indicate either a cyberattack on the SCADA system or an actual chemical process failure. The operations team must respond. What should they do FIRST?',
  '["Isolate the SCADA network from the corporate network to prevent lateral movement of a potential attacker", "Initiate a forensic capture of all network traffic and system logs for incident analysis", "Notify the cybersecurity incident response team to begin investigating the anomaly", "Assume the readings are accurate and initiate safety shutdown procedures to protect human life"]'::jsonb,
  3,
  'In industrial control systems, human safety is ALWAYS the top priority. When readings could indicate a genuine process failure that endangers lives, the correct first action is to assume the worst case and initiate safety procedures. Network isolation, forensics, and incident response are all important but secondary to protecting human life. This is a core CISSP principle: safety of human life comes first.',
  'ICS/SCADA golden rule: SAFETY FIRST, always. When in doubt, shut it down. People > Systems > Data.',
  'analyze',
  'first_action',
  'medium',
  1.70, 0.90, 0.20,
  'ai_generated', true
),

-- Q25: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'key_management',
  'During a routine audit, a security analyst discovers that an AES-256 encryption key used to protect customer financial data has been in use for over five years without rotation. What should the analyst recommend FIRST?',
  '["Schedule an immediate key rotation to replace the aged key with a newly generated key", "Conduct a risk assessment to determine if any data protected by the key has been compromised", "Re-encrypt all existing data with a completely different encryption algorithm", "Revoke the key immediately and generate a replacement before any further data processing occurs"]'::jsonb,
  0,
  'The first action should be to schedule immediate key rotation. While the key may not be compromised, extended use increases risk through potential exposure, increased volume of data encrypted under one key, and advances in computational power. A risk assessment is important but can happen in parallel. Changing the algorithm entirely is unnecessary if AES-256 is still strong. Immediate revocation without a rotation plan could disrupt operations.',
  'Key management lifecycle: Generate, Distribute, Use, ROTATE, Archive, Destroy. Aged key = time to ROTATE.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q26: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.10, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  3,
  'enterprise_architecture',
  'As a security director, you are advising the board on adopting a zero trust architecture. The CEO asks why the organization should invest in zero trust when they already have a robust perimeter firewall and VPN. What is the BEST management-level response?',
  '["Zero trust eliminates the need for firewalls and VPNs, reducing overall infrastructure costs significantly", "Zero trust assumes breaches will occur and continuously verifies every access request, providing protection even when perimeter defenses are bypassed", "Zero trust is a regulatory requirement that all organizations must implement by the end of this fiscal year", "Zero trust allows employees to access any resource without authentication, improving productivity"]'::jsonb,
  1,
  'Zero trust operates on the principle of "never trust, always verify" and assumes that breaches will occur. It provides continuous verification of every access request regardless of network location, which protects against insider threats and lateral movement after a perimeter breach. Zero trust does not eliminate firewalls, is not a universal regulatory mandate, and certainly does not remove authentication requirements.',
  'Zero Trust = "Never trust, always verify." Assumes breach has already happened. Verify EVERY request, EVERY time.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q27: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'steganography',
  'A corporate investigator suspects that a disgruntled employee is exfiltrating trade secrets. Email monitoring shows no suspicious attachments, and DLP tools detect no sensitive data in outbound communications. However, the employee frequently posts high-resolution images to a personal social media account from their work computer. What technique might the employee be using?',
  '["Encrypting the trade secrets with a symmetric key and embedding them in email headers", "Using a covert timing channel to encode data in the intervals between social media posts", "Hiding confidential data within the image files using steganography before uploading them", "Compressing the data and renaming the files with image extensions to bypass DLP filters"]'::jsonb,
  2,
  'Steganography hides data within other media such as images, making it invisible to standard DLP tools that look for sensitive content patterns. The high-resolution images provide ample capacity for hidden data. Email header embedding would be detected by email security. Covert timing channels use system event timing, not social media post intervals. Simply renaming files would not bypass DLP content inspection.',
  'Steganography = HIDDEN in plain sight. Stego hides the EXISTENCE of data. Crypto hides the MEANING of data. Different goals!',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q28: medium / understand / first_action — correct=3
-- b = 0.0 + 0.0 + 0.3 = 0.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'fire_suppression',
  'A smoke detector activates in a server room that uses a pre-action fire suppression system. What happens FIRST in this type of system?',
  '["Water immediately flows from all sprinkler heads throughout the protected area", "A deluge valve opens and floods the entire room with water simultaneously", "The system releases a clean agent gas to suppress the fire without water", "The detection system triggers and water fills the previously dry pipes but does not discharge until a sprinkler head activates from heat"]'::jsonb,
  3,
  'Pre-action systems use a two-step process: first, the detection system (smoke detector) triggers a valve that fills the previously empty (dry) pipes with water. Water only discharges when individual sprinkler heads are activated by heat, providing a second confirmation. This prevents accidental water discharge from broken pipes. Immediate flow describes wet pipe systems. Simultaneous flooding describes deluge systems.',
  'Pre-action = TWO steps: 1) Detection fills pipes, 2) Heat opens heads. Double confirmation = fewer accidental discharges. Best water-based option for data centers.',
  'understand',
  'first_action',
  'medium',
  1.20, 0.30, 0.20,
  'ai_generated', true
),

-- Q29: medium / apply / best_answer — correct=0
-- b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  3,
  'secure_design_principles',
  'An application development team is implementing a payment processing module. They want to ensure that no single developer can both write the code and approve it for production deployment. Which security principle BEST describes this control?',
  '["Separation of duties, requiring different individuals to perform different parts of a critical process", "Dual control, requiring two people to simultaneously perform a single action", "Least privilege, limiting each developer to the minimum access necessary for their role", "Job rotation, periodically moving personnel between positions to detect fraud"]'::jsonb,
  0,
  'Separation of duties ensures that no single individual has enough control to complete a critical process alone, preventing fraud and errors. The developer writes code, and a different person approves deployment. Dual control requires two people simultaneously (like two keys to open a vault). Least privilege limits access levels. Job rotation moves people between roles periodically.',
  'Separation of Duties = different people for different steps. Dual Control = two people at the SAME time. SoD prevents fraud; dual control prevents solo action.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q30: medium / apply / first_action — correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'quantum_crypto',
  'A financial institution is concerned about the future threat of quantum computers breaking their current RSA-based encryption. They want to begin preparing their cryptographic infrastructure now. What should the security architect recommend as the FIRST step in the migration plan?',
  '["Immediately replace all RSA implementations with quantum key distribution using entangled photons", "Begin transitioning to post-quantum cryptographic algorithms such as lattice-based or hash-based schemes while maintaining current encryption", "Double the RSA key length from 2048 to 4096 bits, which will provide sufficient protection against quantum attacks", "Wait until quantum computers become commercially available before making any cryptographic changes"]'::jsonb,
  1,
  'Transitioning to post-quantum cryptography (PQC) algorithms is the recommended approach. NIST has standardized several PQC algorithms including lattice-based (CRYSTALS-Kyber/ML-KEM) and hash-based schemes. QKD requires specialized hardware and is not practical for most organizations. Simply doubling RSA key length does not protect against Shor''s algorithm. Waiting is risky because encrypted data captured now could be decrypted later (harvest now, decrypt later attacks).',
  'Post-Quantum = algorithms that resist quantum computers. "Harvest now, decrypt later" = why you must prepare NOW, not wait.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q31: medium / remember / comparison — correct=2
-- b = 0.0 + (-0.5) + 0.1 = -0.40, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  3,
  'security_models',
  'When comparing the Clark-Wilson and Biba integrity models, which statement BEST distinguishes their approaches to maintaining data integrity?',
  '["Clark-Wilson uses classification labels while Biba uses access control lists", "Biba uses well-formed transactions while Clark-Wilson uses mandatory access controls", "Clark-Wilson enforces integrity through constrained interfaces and separation of duties while Biba uses a lattice of integrity levels", "Biba is designed for commercial environments while Clark-Wilson is designed for military classified systems"]'::jsonb,
  2,
  'Clark-Wilson enforces integrity through well-formed transactions (Transformation Procedures operating on Constrained Data Items) and separation of duties, making it ideal for commercial environments. Biba uses a lattice of integrity levels with mandatory rules (no read down, no write up). Clark-Wilson does not use classification labels; Biba does not use well-formed transactions. Biba is the simpler, lattice-based model while Clark-Wilson is more granular.',
  'Clark-Wilson = Commercial integrity (CDI, TP, IVP triples). Biba = simple lattice integrity (no read down, no write up). CW is more granular.',
  'remember',
  'comparison',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q32: medium / apply / first_action — correct=3
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'physical_access',
  'A new data center facility is being constructed. The physical security design must address vehicle-borne threats against the building exterior. All of the following controls will be implemented. Which should be installed FIRST in the construction process?',
  '["CCTV cameras with license plate recognition at all entry points", "Security guard stations at vehicle checkpoints with access lists", "Electronic access control gates with anti-passback features", "Bollards and reinforced barriers at the building perimeter to prevent vehicle ramming"]'::jsonb,
  3,
  'Bollards and reinforced barriers must be installed first during construction because they are structural elements that need to be integrated into the site foundation and landscaping. They provide the critical physical barrier against vehicle-borne attacks. CCTV, guard stations, and electronic gates are operational controls that can be installed later. Structural anti-ram barriers must be planned and built during initial construction.',
  'Physical security layers: OUTSIDE in. Barriers first (structural), then detection (cameras), then access control (gates/guards).',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q33: medium / understand / best_answer — correct=0
-- b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  3,
  'hashing',
  'Which of the following BEST explains why adding a salt to passwords before hashing improves security?',
  '["It ensures that identical passwords produce different hash values, defeating precomputed rainbow table attacks", "It increases the length of the hash output, making brute force attacks take longer to execute", "It encrypts the password before hashing, adding a second layer of cryptographic protection", "It replaces weak hashing algorithms with stronger ones by modifying the algorithm behavior"]'::jsonb,
  0,
  'A salt is a random value added to each password before hashing. This means identical passwords produce different hashes (because they have different salts), which defeats precomputed rainbow tables and prevents attackers from identifying users with the same password. Salting does not change the hash output length, does not encrypt the password, and does not modify the hashing algorithm itself.',
  'Salt = random seasoning added before hashing. Same password + different salt = different hash. Defeats rainbow tables!',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q34: medium / remember / most_likely — correct=1
-- b = 0.0 + (-0.5) + 0.1 = -0.40, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  3,
  'cryptanalytic_attacks',
  'An organization uses double DES (2DES) encryption, believing it provides twice the security of single DES. An attacker with sufficient computational resources wants to break this encryption. Which attack is the attacker MOST LIKELY to use?',
  '["Brute force attack against the full 112-bit effective key space", "Meet-in-the-middle attack, which reduces 2DES to effectively the strength of single DES", "Birthday attack exploiting collisions in the 64-bit DES block size", "Differential cryptanalysis targeting weaknesses in the DES S-boxes"]'::jsonb,
  1,
  'The meet-in-the-middle attack is why double DES provides only marginally better security than single DES. The attacker encrypts from one end and decrypts from the other, meeting in the middle. This reduces the effective key space from 2^112 to approximately 2^57, making 2DES barely stronger than single DES (2^56). This is why triple DES (3DES) was developed instead. Brute forcing 112 bits is not how 2DES is attacked.',
  'Meet-in-the-middle: Encrypt from left, decrypt from right, MEET in the MIDDLE. Why 2DES is useless and we need 3DES.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q35: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'digital_signatures',
  'A procurement department receives a digitally signed contract from a vendor. After the contract is executed, the vendor claims they never sent or agreed to the terms in the document. The procurement team needs to resolve this dispute. How does the digital signature help in this situation?',
  '["It proves the contract was encrypted during transmission and could not have been intercepted", "It verifies that the vendor''s email server was properly configured with TLS encryption", "It provides nonrepudiation because the vendor''s private key was used to create the signature, proving they signed the document", "It confirms that the contract was reviewed by the vendor''s legal department before signing"]'::jsonb,
  2,
  'Digital signatures provide nonrepudiation: since only the vendor possesses their private key, the valid signature proves they signed the document. The vendor cannot credibly deny having signed it. Digital signatures do not prove encryption during transmission, do not verify email server configuration, and do not confirm legal review. Nonrepudiation is the key service that resolves this type of dispute.',
  'Nonrepudiation = cannot deny. Only YOU have your private key. If YOUR key signed it, YOU signed it. Case closed.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q36: medium / understand / comparison — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  3,
  'asymmetric_crypto',
  'When comparing RSA and Elliptic Curve Cryptography (ECC), which statement BEST describes a key advantage of ECC?',
  '["ECC uses symmetric key operations internally, making it faster than RSA for bulk encryption", "ECC is based on integer factorization, the same mathematical problem as RSA, but with a more efficient implementation", "ECC has been standardized longer than RSA and is therefore more widely trusted and deployed", "ECC provides equivalent security to RSA with significantly shorter key lengths, reducing computational overhead"]'::jsonb,
  3,
  'ECC''s primary advantage is that it achieves equivalent security with much shorter keys. A 256-bit ECC key provides roughly the same security as a 3072-bit RSA key. This means faster operations, less bandwidth, and lower storage requirements. ECC is based on the elliptic curve discrete logarithm problem (ECDLP), not integer factorization. ECC is newer than RSA, not older. Neither is used for bulk encryption.',
  'ECC key comparison: 256-bit ECC ~ 3072-bit RSA. Shorter keys = faster math = less bandwidth. ECC = Efficient Crypto with Compact keys.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q37: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'virtualization',
  'A security team has detected a potential VM escape vulnerability in their production hypervisor. All listed actions are part of the response plan. What should they do FIRST?',
  '["Apply the vendor-provided security patch to the hypervisor to close the vulnerability", "Migrate all virtual machines to a separate physical host that is not affected", "Conduct a full penetration test of the hypervisor to confirm exploitability", "Review all virtual machine access logs for the past 90 days for signs of exploitation"]'::jsonb,
  0,
  'When a VM escape vulnerability is identified, the first priority is to patch the hypervisor to close the vulnerability. VM escape allows an attacker to break out of a VM and access the hypervisor or other VMs, which is a critical threat. Migration takes time and may not be feasible immediately. Penetration testing delays remediation. Log review is important but does not stop the threat. Patch first, investigate second.',
  'VM Escape = breaking out of the virtual jail. PATCH the hypervisor FIRST. VM escape compromises ALL VMs on that host.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q38: medium / analyze / best_answer — correct=1
-- b = 0.0 + 0.6 + 0.0 = 0.60, a = 1.5 + 0.0 = 1.50, c = 0.20
(
  3,
  'secure_design_principles',
  'An organization implements a security architecture where every network request is authenticated and authorized regardless of whether it originates from inside or outside the corporate network. Micro-segmentation is used to isolate workloads, and continuous monitoring validates device posture. Which architectural approach BEST describes this implementation?',
  '["Defense in depth with network segmentation and intrusion detection systems", "Zero trust architecture based on the principle of never trust, always verify", "Demilitarized zone architecture with application layer gateways and proxy servers", "Software-defined perimeter with single packet authorization for all connections"]'::jsonb,
  1,
  'Zero trust architecture is defined by continuous verification of every request regardless of network location, micro-segmentation, least privilege access, and assuming breach. NIST SP 800-207 outlines these principles. Defense in depth uses layered controls but does not necessarily verify every internal request. DMZ architecture is perimeter-based. SDP is a component that can support zero trust but does not encompass the full model described.',
  'Zero Trust pillars: 1) Never trust, always verify. 2) Assume breach. 3) Micro-segmentation. 4) Least privilege. All four present = Zero Trust.',
  'analyze',
  'best_answer',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q39: medium / apply / except_not — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + (-0.1) = 1.20, c = 0.25
(
  3,
  'symmetric_crypto',
  'All of the following are characteristics of symmetric encryption EXCEPT:',
  '["It uses the same key for both encryption and decryption operations", "It is significantly faster than asymmetric encryption for bulk data processing", "It inherently provides nonrepudiation because both parties share the same secret key", "It requires a secure channel for key distribution between communicating parties"]'::jsonb,
  2,
  'Symmetric encryption does NOT provide nonrepudiation precisely because both parties share the same key. Either party could have encrypted the message, so neither can prove the other did it. Symmetric encryption does use the same key for encryption and decryption, is much faster than asymmetric, and requires secure key distribution. Nonrepudiation requires asymmetric cryptography where only one party holds the private key.',
  'Symmetric CANNOT provide nonrepudiation. Both parties have the SAME key = either could have done it. Need asymmetric (unique private key) for nonrepudiation.',
  'apply',
  'except_not',
  'medium',
  1.20, 0.50, 0.25,
  'ai_generated', true
),

-- Q40: medium / understand / scenario — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'common_criteria',
  'A government procurement officer is evaluating two firewall products. Product A has an EAL 4 certification, and Product B has an EAL 7 certification. The officer concludes that Product B must be more secure than Product A. Why is this conclusion potentially flawed?',
  '["Because EAL ratings only apply to operating systems, not firewalls or network devices", "Because EAL 7 products are only available for military use and cannot be deployed commercially", "Because higher EAL ratings indicate older products that may lack modern security features", "Because EAL measures the rigor of evaluation, not the actual security strength of the product"]'::jsonb,
  3,
  'EAL (Evaluation Assurance Level) measures how thoroughly a product was evaluated, not how secure it actually is. A product evaluated at EAL 7 was formally verified and extensively tested, but this does not guarantee it is more secure than an EAL 4 product. A well-designed product at EAL 4 could be more secure in practice than a narrowly-scoped EAL 7 product. EAL ratings apply to any IT product, are available commercially, and higher EAL does not indicate age.',
  'EAL = how DEEPLY tested, not how SECURE. EAL7 = most testing. EAL4 = most common commercially. More testing does not equal more security.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q41: medium / apply / tlatm — correct=0
-- b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  3,
  'key_management',
  'As a security manager, you learn that your organization''s key management practices do not include a formal key destruction process. When cryptographic keys reach end of life, they are simply deleted from the file system. From a management perspective, what risk does this create?',
  '["Deleted keys could be recovered from storage media, potentially allowing decryption of historical data or impersonation", "The lack of formal destruction increases the processing overhead of the cryptographic infrastructure", "Key files deleted from the file system automatically become publicly available through cloud synchronization", "Without formal destruction, the key management system will eventually run out of storage capacity"]'::jsonb,
  0,
  'Simply deleting key files does not securely erase them; data recovery tools can retrieve deleted files from storage media. This means an attacker who gains access to old storage media could recover encryption keys and decrypt historical data. Proper key destruction (zeroization, crypto-shredding) overwrites key material to prevent recovery. This is not about processing overhead, cloud sync, or storage capacity.',
  'Key Destruction must be COMPLETE: zeroization (overwrite with zeros), crypto-shredding, physical destruction. DELETE is not DESTROY.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q42: medium / apply / scenario — correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'block_cipher_modes',
  'A development team is implementing encrypted communications for a real-time video streaming application. The encryption must support parallel processing for low latency and must not propagate errors from one block to subsequent blocks. Which block cipher mode should they select?',
  '["CBC (Cipher Block Chaining), because it provides strong security through block interdependence", "CTR (Counter) mode, because it supports parallel processing and localizes errors to individual blocks", "ECB (Electronic Codebook), because its independent block processing eliminates all latency concerns", "OFB (Output Feedback), because it is specifically designed for streaming multimedia content"]'::jsonb,
  1,
  'CTR mode converts a block cipher into a stream cipher by encrypting sequential counter values and XORing with plaintext. It supports parallel encryption and decryption, provides excellent performance for real-time applications, and errors in one block do not propagate to others. CBC chains blocks and cannot be parallelized for encryption. ECB reveals patterns and is insecure. OFB is not parallelizable.',
  'CTR = Counter mode = fastest, parallelizable, no error propagation. Perfect for real-time. Think: CTR = Concurrent Throughput Ready.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q43: medium / analyze / first_action — correct=2
-- b = 0.0 + 0.6 + 0.3 = 0.90, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'cloud_security',
  'A security analyst discovers that sensitive customer data stored in a cloud-based object storage bucket has been publicly accessible for the past two weeks due to a misconfiguration. All listed actions are necessary. What should the analyst do FIRST?',
  '["Notify the legal department and privacy officer about the potential data breach", "Begin a forensic investigation to determine which records were accessed by unauthorized parties", "Immediately restrict the bucket permissions to remove public access and stop further exposure", "File a report with the relevant data protection authority as required by regulations"]'::jsonb,
  2,
  'The immediate first action must be to stop the ongoing exposure by fixing the misconfiguration and removing public access. This stops the bleeding. Legal notification, forensic investigation, and regulatory reporting are all critical follow-up steps, but they should not delay the immediate remediation. Continuing to investigate while data remains exposed would be negligent. Contain first, then investigate and report.',
  'Data exposure FIRST: STOP the leak. Fix the config. THEN investigate, THEN notify. Containment always comes first.',
  'analyze',
  'first_action',
  'medium',
  1.70, 0.90, 0.20,
  'ai_generated', true
),

-- Q44: medium / understand / best_answer — correct=3
-- b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  3,
  'tpm_hsm',
  'Which of the following BEST describes the primary function of a Trusted Platform Module (TPM)?',
  '["Providing high-speed encryption and decryption for network traffic processing", "Managing user authentication and access control for enterprise single sign-on", "Serving as a centralized key management server for an organization''s PKI infrastructure", "Providing hardware-based root of trust for platform integrity measurement and secure key storage"]'::jsonb,
  3,
  'A TPM is a hardware chip that provides a root of trust for the platform. It measures the boot process integrity (secure boot/measured boot), stores cryptographic keys in hardware, and supports platform attestation. It is NOT a high-speed crypto accelerator (that is an HSM), not an authentication system (that is an IdP), and not a centralized key management server. TPMs are embedded in individual endpoints.',
  'TPM = chip on the motherboard. Root of Trust. Measures boot integrity. Stores keys in hardware. Think: TPM = Trust the Platform''s Measurements.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q45: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'power_environmental',
  'During a severe thunderstorm, the data center experiences repeated power surges and transient voltage spikes. The UPS is absorbing the surges, but the battery is draining faster than expected. The facility manager must take action. What should they do FIRST?',
  '["Start the backup diesel generators to supplement UPS power and prepare for a potential extended outage", "Contact the utility company to request priority power restoration for the facility", "Begin a graceful shutdown of non-critical systems to reduce the power load", "Switch all servers to low-power mode to extend the remaining UPS battery life"]'::jsonb,
  0,
  'Starting the backup generators is the correct first action because the UPS battery is draining, indicating utility power is unreliable. Generators provide sustained backup power that can run for extended periods. Contacting the utility company is important but does not provide immediate power. Shutting down non-critical systems is a reasonable secondary step. Low-power mode may not be available on all systems and provides minimal benefit.',
  'Power chain: Utility power fails, UPS bridges the gap, Generators take over. When UPS is draining, START GENERATORS before batteries run out.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q46: medium / analyze / most_likely — correct=1
-- b = 0.0 + 0.6 + 0.1 = 0.70, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'security_models',
  'An investment banking firm needs to ensure that consultants who access data from one client cannot subsequently access data from a competing client during the same engagement. Which security model is MOST LIKELY to address this requirement?',
  '["Bell-LaPadula model with mandatory access controls based on classification labels", "Brewer-Nash (Chinese Wall) model with dynamic conflict-of-interest restrictions", "Biba model with integrity levels preventing unauthorized data modification", "Graham-Denning model with eight primitive access control operations"]'::jsonb,
  1,
  'The Brewer-Nash (Chinese Wall) model dynamically prevents conflicts of interest. Once a consultant accesses Client A''s data, they are automatically prevented from accessing data of Client A''s competitors. This is specifically designed for financial services, consulting, and legal environments. Bell-LaPadula handles confidentiality levels, Biba handles integrity, and Graham-Denning handles object creation and rights management.',
  'Brewer-Nash = Chinese Wall = no conflicts of interest. Dynamic: once you pick a side, you''re locked in. Perfect for finance and consulting.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q47: medium / apply / comparison — correct=2
-- b = 0.0 + 0.3 + 0.1 = 0.40, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  3,
  'pki_certificates',
  'When comparing Certificate Revocation Lists (CRLs) to the Online Certificate Status Protocol (OCSP) for checking certificate validity, which statement BEST distinguishes their approaches?',
  '["CRLs provide real-time status checks while OCSP distributes periodic lists of revoked certificates", "CRLs are used only for root CA certificates while OCSP is used only for end-entity certificates", "OCSP provides real-time, per-certificate status checks while CRLs are periodically published lists that may have a window of staleness", "OCSP requires the relying party to download and cache the entire revocation database while CRLs check individual certificates"]'::jsonb,
  2,
  'OCSP provides real-time status for individual certificates by querying a responder, giving immediate revocation information. CRLs are published periodically and must be downloaded in full, creating a window where a newly revoked certificate may still appear valid. OCSP stapling further improves performance by having the server fetch its own status. The descriptions in options A and D are reversed. CRLs and OCSP both apply to all certificate types.',
  'CRL = periodic LIST download (can be stale). OCSP = real-time CHECK per certificate (always current). OCSP stapling = server fetches its own status.',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q48: medium / understand / tlatm — correct=3
-- b = 0.0 + 0.0 + 0.5 = 0.50, a = 1.0 + 0.4 = 1.40, c = 0.20
(
  3,
  'enterprise_architecture',
  'As a security manager reviewing the organization''s defense-in-depth strategy, which perspective BEST reflects the Think Like a Manager approach to evaluating layered controls?',
  '["Each security layer should use the same vendor''s products to ensure seamless integration", "Defense in depth is primarily a technical strategy focused on deploying more firewalls at different network points", "The number of layers is the most important factor; more layers always provide better security", "Defense in depth should combine administrative, technical, and physical controls so that no single failure compromises security"]'::jsonb,
  3,
  'Defense in depth from a management perspective combines administrative controls (policies, training), technical controls (firewalls, encryption), and physical controls (locks, guards) across multiple layers. Single-vendor solutions create single points of failure. It is not purely a technical strategy. More layers are not always better if they create complexity and operational burden without proportional risk reduction.',
  'Defense in Depth = Administrative + Technical + Physical. Three control TYPES across multiple LAYERS. Quality > Quantity.',
  'understand',
  'tlatm',
  'medium',
  1.40, 0.50, 0.20,
  'ai_generated', true
),

-- Q49: medium / apply / best_answer — correct=0
-- b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  3,
  'ics_scada',
  'Which of the following BEST describes why patching industrial control systems is more challenging than patching standard IT systems?',
  '["ICS environments require continuous uptime for safety-critical processes, and patches may cause unexpected system behavior that could endanger operations", "ICS vendors release patches more frequently than IT vendors, overwhelming operations teams with update requirements", "ICS systems use the same operating systems as IT systems but require more memory for patch installation", "ICS patches are only available through classified government channels, limiting access for private sector organizations"]'::jsonb,
  0,
  'ICS/SCADA systems often run safety-critical processes that cannot be interrupted. Patches may introduce unexpected behavior in real-time control systems, potentially causing physical damage or safety hazards. Systems may need to run 24/7 without downtime windows. ICS vendors actually release patches less frequently, not more. ICS often uses specialized or legacy operating systems. Patches are available through normal vendor channels.',
  'ICS patching challenges: 1) 24/7 uptime needed, 2) patches may break real-time control, 3) legacy/proprietary systems, 4) SAFETY risk from changes.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q50: medium / understand / most_likely — correct=1
-- b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  3,
  'secure_design_principles',
  'A web application is designed so that when its database connection fails, it displays a generic error page and denies all user requests until the connection is restored. Which design principle is this application MOST LIKELY implementing?',
  '["Defense in depth, using multiple layers to protect against database attacks", "Fail-secure, defaulting to a denied state when the system experiences a failure", "Separation of duties, requiring both the application and database to authorize requests", "Privacy by design, preventing user data from being exposed during system failures"]'::jsonb,
  1,
  'Fail-secure (also called fail-closed) means the system defaults to a secure state (denying access) when a failure occurs. By showing a generic error and blocking requests when the database is unavailable, the application prevents potential unauthorized access or data leakage. Defense in depth involves multiple control layers. Separation of duties splits responsibilities among people. Privacy by design is a broader framework.',
  'Fail-secure = when in doubt, DENY. System breaks? Lock it down. Better to block legitimate users than allow attackers through.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q51: medium / analyze / scenario — correct=2
-- b = 0.0 + 0.6 + 0.2 = 0.80, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'cryptanalytic_attacks',
  'A security researcher discovers that an organization''s custom encryption implementation leaks information about the secret key through measurable differences in power consumption during encryption operations. An attacker with physical proximity to the device could use sensitive measurement equipment to extract the key. What category of attack does this represent?',
  '["An implementation attack exploiting flawed random number generation in key creation", "A brute force attack using specialized hardware to accelerate key search operations", "A side-channel attack that extracts cryptographic key information through physical emanations", "A known plaintext attack using captured input-output pairs to derive the key mathematically"]'::jsonb,
  2,
  'Side-channel attacks extract information through physical characteristics of a cryptographic implementation rather than mathematical weaknesses. Power analysis (Simple Power Analysis and Differential Power Analysis) measures power consumption patterns during cryptographic operations to deduce key bits. This is distinct from implementation attacks (software bugs), brute force (exhaustive search), and known plaintext attacks (mathematical analysis of plaintext-ciphertext pairs).',
  'Side-channel = physical leakage: Power, Timing, Electromagnetic, Acoustic. PTEA attacks. Not attacking the MATH, attacking the PHYSICS.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q52: medium / remember / calculation — correct=3
-- b = 0.0 + (-0.5) + 0.4 = -0.10, a = 0.8 + 0.3 = 1.10, c = 0.20
(
  3,
  'symmetric_crypto',
  'An organization has 15 employees who all need to communicate securely with each other using symmetric encryption, where each pair of employees requires a unique shared key. How many unique symmetric keys are required?',
  '["15 keys, one for each employee", "30 keys, two for each employee to handle send and receive", "150 keys, calculated as 15 multiplied by 10", "105 keys, calculated using the formula n(n-1)/2"]'::jsonb,
  3,
  'The formula for the number of symmetric keys needed in a group is n(n-1)/2, where n is the number of people. For 15 employees: 15(14)/2 = 210/2 = 105 keys. Each unique pair needs one shared key. This scalability problem is a major disadvantage of symmetric cryptography and one of the key reasons asymmetric cryptography was developed.',
  'Symmetric key formula: n(n-1)/2. For 10 people = 45 keys. For 100 people = 4,950 keys. This is why symmetric does not SCALE.',
  'remember',
  'calculation',
  'medium',
  1.10, -0.10, 0.20,
  'ai_generated', true
),

-- Q53: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'physical_access',
  'A data center uses an access control vestibule (mantrap) at its main entrance. An authorized employee badges in, and while the first door is still open, a visitor attempts to follow them into the vestibule. The system is configured to prevent piggybacking. What should happen?',
  '["The system should refuse to open the second door until the vestibule detects only one authorized person, requiring the visitor to badge in separately", "The system should allow both people through and log the event for later security review", "The system should sound a silent alarm and lock both doors, trapping both individuals for security response", "The system should open both doors simultaneously to prevent a safety hazard from door malfunction"]'::jsonb,
  0,
  'An anti-piggybacking mantrap should detect multiple occupants (via weight sensors, optical sensors, or turnstile counts) and refuse to open the inner door until only one authorized person is detected. The visitor must badge in separately. Allowing both through defeats the purpose. Trapping both people is excessive and creates safety concerns. Opening both doors eliminates all access control. The goal is controlled, individual access.',
  'Mantrap/Vestibule = one person at a time. Badge in, first door closes, THEN second door opens. Anti-piggybacking = individual verification.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q54: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.10, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  3,
  'cloud_security',
  'As a CISO, your organization stores sensitive data in a cloud provider''s infrastructure located in multiple countries. The legal team has raised concerns about data sovereignty. From a management perspective, what is the PRIMARY risk that must be addressed?',
  '["The cloud provider may not use the latest encryption algorithms to protect data in transit between regions", "Data stored in foreign jurisdictions may be subject to those countries'' laws, potentially conflicting with your organization''s regulatory requirements", "Multi-region storage increases network latency, which could impact application performance and user experience", "The cloud provider''s employees in foreign offices may have unauthorized access to customer data"]'::jsonb,
  1,
  'Data sovereignty means that data is subject to the laws of the country where it is stored. This can create conflicts when regulations like GDPR, HIPAA, or national security laws restrict where certain data can be stored or who can access it. As a manager, this is primarily a legal and compliance risk. Encryption, latency, and employee access are secondary technical concerns that can be addressed through operational controls.',
  'Data Sovereignty = data follows LOCAL laws. Your data in Country X = Country X''s rules apply. Critical for regulated industries.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q55: medium / apply / first_action — correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'fire_suppression',
  'A data center fire detection system triggers an alarm. The system uses a gas-based clean agent suppression system. Before the agent is discharged, all of the following actions occur. Which happens FIRST?',
  '["The clean agent is released into the protected area to suppress the fire", "HVAC systems are shut down to prevent the agent from being diluted or vented", "An audible and visual alarm warns personnel to evacuate the area immediately", "Magnetic door hold-opens release so fire doors close to contain the suppression zone"]'::jsonb,
  2,
  'Personnel safety is always the first priority. When a gas suppression system is triggered, the first action must be to warn people to evacuate with audible and visual alarms. This provides time for personnel to exit before the agent is discharged. HVAC shutdown and door closure happen next to contain the area. The agent is released last, after a time delay that allows evacuation. The sequence is: alarm, evacuate, contain, suppress.',
  'Gas suppression sequence: ALARM people first, CLOSE doors, SHUT HVAC, THEN release agent. People safety = always step 1.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q56: medium / understand / scenario — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'hashing',
  'A forensic investigator creates an MD5 hash of a hard drive image immediately after acquisition. During court proceedings six months later, the investigator recalculates the hash and obtains the same value. What does this demonstrate about the evidence?',
  '["That the hard drive was encrypted with a strong algorithm during storage", "That no unauthorized personnel accessed the evidence storage facility", "That the forensic tools used to acquire the image were properly licensed", "That the disk image has not been altered or tampered with since acquisition"]'::jsonb,
  3,
  'Hash comparison is the standard method for proving evidence integrity in digital forensics. If the hash calculated at acquisition matches the hash calculated later, the data has not been modified. This demonstrates integrity, not confidentiality (encryption), physical access control, or tool licensing. While MD5 is considered cryptographically weak for security, it remains commonly used in forensics for integrity verification.',
  'Hash for forensics = integrity proof. Same hash at time 1 and time 2 = NO changes. Digital evidence chain of custody.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q57: medium / apply / best_answer — correct=0
-- b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  3,
  'secure_design_principles',
  'A security architect is designing a new microservices application. Each microservice needs to communicate with others, and the architect wants to ensure that a compromise of one service does not automatically grant access to all other services. Which design principle BEST addresses this requirement?',
  '["Micro-segmentation, isolating each service so that lateral movement requires separate authorization", "Obscurity, hiding the network addresses of internal services from potential attackers", "Redundancy, deploying multiple instances of each service across different network segments", "Aggregation, combining all services into a single protected boundary for unified defense"]'::jsonb,
  0,
  'Micro-segmentation isolates individual workloads and services, requiring separate authentication and authorization for each communication path. This limits lateral movement so that compromising one service does not automatically grant access to others. Security through obscurity is not a valid primary control. Redundancy addresses availability, not access control. Aggregation is the opposite of segmentation and would increase the blast radius of a compromise.',
  'Micro-segmentation = each service in its own security zone. Compromise one? Still blocked from the rest. Zero trust at the service level.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q58: medium / apply / scenario — correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'virtualization',
  'A cloud service provider uses multi-tenant virtualization where multiple customers'' virtual machines run on the same physical host. A security assessment reveals that memory isolation between VMs is not properly enforced by the hypervisor. What is the PRIMARY risk this creates?',
  '["Customer VMs may experience performance degradation due to noisy neighbor effects on shared hardware", "An attacker on one VM could potentially read sensitive data from another customer''s VM memory space", "The hypervisor may crash, causing all VMs on the host to become temporarily unavailable", "Network traffic between VMs on the same host may bypass external firewall inspection rules"]'::jsonb,
  1,
  'Inadequate memory isolation in a multi-tenant environment creates a critical confidentiality risk: an attacker on one VM could access another customer''s data in memory. This is the fundamental security concern with multi-tenancy. Performance degradation is an operational concern, not a primary security risk. Hypervisor crashes are an availability risk. Network bypass is a separate concern from memory isolation.',
  'Multi-tenancy risk #1: isolation failure. If VMs share memory improperly, one tenant can READ another''s data. Memory isolation is CRITICAL.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q59: medium / analyze / comparison — correct=2
-- b = 0.0 + 0.6 + 0.1 = 0.70, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'block_cipher_modes',
  'When comparing GCM (Galois/Counter Mode) to CBC (Cipher Block Chaining) for use in a modern TLS implementation, which statement BEST distinguishes GCM''s advantage?',
  '["GCM uses a longer key length than CBC, providing stronger encryption resistance against brute force attacks", "GCM requires no initialization vector, simplifying the encryption setup process compared to CBC", "GCM provides authenticated encryption, combining confidentiality and integrity verification in a single operation, while CBC provides only confidentiality", "GCM uses a Feistel network structure while CBC uses a substitution-permutation network, making GCM inherently more resistant to differential cryptanalysis"]'::jsonb,
  2,
  'GCM''s key advantage is that it provides authenticated encryption with associated data (AEAD), meaning it delivers both confidentiality and integrity/authentication in a single efficient operation. CBC only provides confidentiality and requires a separate MAC for integrity. Both can use the same key lengths (they are modes, not algorithms). Both use IVs. The Feistel vs. SPN distinction relates to the underlying cipher, not the mode.',
  'GCM = Galois Counter Mode = AEAD (Authenticated Encryption with Associated Data). Confidentiality + Integrity in ONE step. That is why TLS 1.3 uses GCM.',
  'analyze',
  'comparison',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q60: medium / apply / first_action — correct=3
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'digital_signatures',
  'A software development team discovers that the code signing certificate used to sign their application updates will expire in 48 hours. They have a new release scheduled in 72 hours. All listed actions are needed. What should the team do FIRST?',
  '["Complete the new software release and sign it with the expiring certificate before it expires", "Notify all customers that the upcoming release will be delayed due to certificate issues", "Audit the existing signed applications to verify their signatures remain valid after certificate expiration", "Request a new code signing certificate from the Certificate Authority and complete the renewal process"]'::jsonb,
  3,
  'The first action should be to renew the certificate by requesting a new one from the CA. Certificate renewal takes time for validation and issuance, so starting this process immediately is critical. Rushing to sign before expiration could result in a poorly tested release. Customer notification may be premature before determining if a delay is actually necessary. Auditing existing signatures is important but does not address the upcoming release.',
  'Certificate expiring? RENEW FIRST. Start the CA process immediately because issuance takes time. Plan around the new cert.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q61: medium / understand / except_not — correct=0
-- b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + (-0.1) = 0.90, c = 0.25
(
  3,
  'asymmetric_crypto',
  'All of the following are advantages of asymmetric cryptography over symmetric cryptography EXCEPT:',
  '["Faster encryption and decryption speed for processing large volumes of data", "Simplified key distribution since public keys can be freely shared", "Support for digital signatures providing nonrepudiation", "Better scalability because each user needs only one key pair regardless of communication partners"]'::jsonb,
  0,
  'Asymmetric cryptography is significantly SLOWER than symmetric, not faster. This is its primary disadvantage and why hybrid encryption is used in practice. Asymmetric does solve key distribution (public keys are freely shared), supports digital signatures for nonrepudiation, and scales better (n key pairs vs. n(n-1)/2 symmetric keys). Speed is the tradeoff for these benefits.',
  'Asymmetric = Slow but Solves key distribution. Symmetric = Speedy but Shares key problems. Hybrid = best of both worlds.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q62: medium / apply / except_not — correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + (-0.1) = 1.20, c = 0.25
(
  3,
  'secure_design_principles',
  'All of the following are valid applications of the separation of duties principle in system design EXCEPT:',
  '["Requiring different personnel to develop code and approve it for production deployment", "Allowing a single database administrator to both create user accounts and assign their own administrative privileges", "Splitting payment processing and order management so no component accesses both full card numbers and customer identities", "Requiring dual authorization from two different managers for wire transfers exceeding a threshold"]'::jsonb,
  1,
  'Allowing a single DBA to create accounts and assign their own privileges violates separation of duties because one person controls the entire access provisioning process with no oversight. The other options correctly implement SoD: splitting development and deployment approval, compartmentalizing payment data, and requiring dual authorization. SoD prevents any single individual from having enough control to commit fraud or make critical errors undetected.',
  'Separation of Duties: no single person controls an ENTIRE critical process. If one person can do it all, SoD is BROKEN.',
  'apply',
  'except_not',
  'medium',
  1.20, 0.50, 0.25,
  'ai_generated', true
),

-- Q63: medium / apply / most_likely — correct=2
-- b = 0.0 + 0.3 + 0.1 = 0.40, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  3,
  'power_environmental',
  'A data center manager notices that static electricity discharges are occurring frequently near server racks, and several memory modules have failed prematurely. What environmental condition is MOST LIKELY causing this problem?',
  '["Temperature is too high, causing thermal expansion of memory module connectors", "Humidity is too high, causing condensation on circuit boards and memory modules", "Humidity is too low, allowing electrostatic discharge buildup that damages components", "Air pressure is too high due to positive pressurization pushing dust into server chassis"]'::jsonb,
  2,
  'Low humidity (below 40% relative humidity) increases static electricity buildup, leading to electrostatic discharge (ESD) that can damage sensitive electronic components like memory modules. Data centers should maintain 40-60% relative humidity. High humidity causes condensation and corrosion, not static. High temperature causes thermal issues. Positive pressurization is desirable to keep contaminants out.',
  'Humidity sweet spot: 40-60%. Too LOW = static/ESD. Too HIGH = condensation/corrosion. Remember: DRY = zappy, WET = drippy.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q64: medium / understand / comparison — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  3,
  'hashing',
  'When comparing HMAC to a standard hash function, which statement BEST identifies the additional security service that HMAC provides?',
  '["HMAC produces a longer digest than standard hashing, making collisions less likely", "HMAC encrypts the message before hashing, providing both confidentiality and integrity", "HMAC uses multiple rounds of hashing, making it more resistant to brute force attacks", "HMAC incorporates a secret key, providing both integrity verification and authentication of the message source"]'::jsonb,
  3,
  'HMAC (Hash-based Message Authentication Code) combines a cryptographic hash function with a secret key. While a standard hash provides only integrity verification (anyone can compute it), HMAC provides both integrity AND authentication because only parties who know the secret key can generate or verify the correct HMAC. HMAC does not produce longer digests, does not encrypt, and the key (not extra rounds) is what distinguishes it.',
  'Hash = integrity only (anyone can hash). HMAC = integrity + authentication (need the secret KEY). H = Hash, MAC = Message Authentication Code.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q65: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'key_management',
  'A bank is implementing a new master encryption key for its payment processing system. The key must be protected so that no single person can access it. The security team plans to use split knowledge with key custodians. What should they implement FIRST?',
  '["M of N control using secret sharing, where M key holders out of N total must combine their shares to reconstruct the key", "Dual control requiring two authorized individuals to simultaneously perform a cryptographic operation", "Key escrow with a trusted third-party custodian holding the complete master key for emergency access", "Key wrapping where the master key is encrypted with multiple layers of subordinate keys"]'::jsonb,
  0,
  'M of N control (also called split knowledge or secret sharing, based on Shamir''s Secret Sharing) should be implemented first because it directly addresses the requirement that no single person can access the master key. The key is divided into N shares and requires M shares to reconstruct. Dual control requires exactly 2 people simultaneously but does not split the key. Key escrow gives one party the full key. Key wrapping is encryption of keys, not splitting them.',
  'M of N = need M pieces out of N total. Split knowledge = no single person has the full key. Based on Shamir''s Secret Sharing scheme.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q66: medium / understand / best_answer — correct=1
-- b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  3,
  'cryptanalytic_attacks',
  'Which of the following BEST describes why rainbow table attacks are effective against unsalted password hashes?',
  '["Rainbow tables exploit weaknesses in specific hashing algorithms that allow direct key recovery", "Rainbow tables contain precomputed hash values for common passwords, allowing instant lookup instead of real-time computation", "Rainbow tables use parallel processing to compute hashes faster than traditional brute force methods", "Rainbow tables reverse the hashing algorithm by exploiting mathematical properties of one-way functions"]'::jsonb,
  1,
  'Rainbow tables are precomputed lookup tables mapping hash values to their corresponding plaintext passwords. Against unsalted hashes, an attacker simply looks up the hash value in the table to find the password instantly. Salting defeats this by making each hash unique even for identical passwords, forcing the attacker to compute separate tables for each salt value. Rainbow tables do not exploit algorithm weaknesses, are not parallel processing, and do not reverse the hash function.',
  'Rainbow table = giant LOOKUP table. Hash in, password out. Salt defeats it because each salt needs a NEW table. Salt = rainbow table killer.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q67: medium / apply / tlatm — correct=2
-- b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  3,
  'common_criteria',
  'As a security manager selecting a new database encryption product, you are comparing two vendors. Vendor A offers an EAL 2 certified product with excellent features and modern architecture. Vendor B offers an EAL 4 certified product with fewer features but more extensive security testing documentation. From a management perspective, what should guide your decision?',
  '["Always select the highest EAL rating because it guarantees the most secure product", "Select Vendor A because modern features are more important than evaluation depth in practice", "Evaluate whether the EAL level aligns with your risk profile while considering that EAL measures evaluation rigor, not absolute security", "Reject both products because only EAL 5 or above is acceptable for database encryption"]'::jsonb,
  2,
  'The management approach is to align the EAL level with the organization''s risk profile and requirements. EAL measures the rigor of evaluation, not the product''s security strength. A higher EAL means more thorough testing documentation but does not guarantee the product is more secure. The decision should consider risk tolerance, compliance requirements, functional needs, and the scope of what was evaluated. Neither blanket highest-EAL nor feature-only approaches are correct.',
  'EAL decision: Match to YOUR risk. EAL4 = gold standard for commercial. Higher EAL = more evaluation cost. Think: risk-appropriate, not highest possible.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q68: medium / apply / calculation — correct=3
-- b = 0.0 + 0.3 + 0.4 = 0.70, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  3,
  'asymmetric_crypto',
  'An organization uses asymmetric cryptography for secure communications. Each employee needs a key pair to communicate securely with any other employee. If the organization has 200 employees, how many total keys (public and private combined) are needed?',
  '["200 keys, one public key per employee", "19,900 keys, calculated using the symmetric formula n(n-1)/2", "40,000 keys, calculated as 200 squared", "400 keys, because each employee needs exactly one public key and one private key"]'::jsonb,
  3,
  'In asymmetric cryptography, each user needs exactly one key pair (one public key and one private key), regardless of how many people they communicate with. For 200 employees, that is 200 key pairs = 400 total keys. This is a major advantage over symmetric cryptography, which would require n(n-1)/2 = 19,900 keys for the same 200 employees. The scalability of asymmetric key management is one of its primary benefits.',
  'Asymmetric keys: n users = n key pairs = 2n total keys. Symmetric keys: n users = n(n-1)/2 keys. Asymmetric scales MUCH better.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q69: medium / understand / first_action — correct=0
-- b = 0.0 + 0.0 + 0.3 = 0.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  3,
  'pki_certificates',
  'A web administrator discovers that the intermediate CA certificate in their server''s TLS certificate chain has expired. Users are receiving trust warnings. What should the administrator do FIRST?',
  '["Obtain and install a renewed intermediate CA certificate from the certificate authority to restore the chain of trust", "Generate a completely new private key and request a new end-entity certificate from a different CA", "Configure the web server to bypass certificate chain validation for incoming connections", "Ask users to manually add a security exception in their browsers to accept the expired chain"]'::jsonb,
  0,
  'The most direct fix is to obtain an updated intermediate CA certificate from the CA and install it on the server. This restores the complete chain of trust without requiring new keys or certificates. Generating new keys is unnecessary since the end-entity certificate may still be valid. Bypassing validation or asking users to add exceptions are insecure practices that should never be recommended.',
  'Broken certificate chain? Fix the CHAIN, not the endpoint. Get the updated intermediate cert and reinstall it. Chain: Root > Intermediate > End-entity.',
  'understand',
  'first_action',
  'medium',
  1.20, 0.30, 0.20,
  'ai_generated', true
),

-- Q70: medium / remember / best_answer — correct=1
-- b = 0.0 + (-0.5) + 0.0 = -0.50, a = 0.8 + 0.0 = 0.80, c = 0.20
(
  3,
  'ics_scada',
  'Which of the following BEST describes why air-gapping is used as a security control for critical industrial control systems?',
  '["Air-gapping encrypts all SCADA communications using dedicated hardware encryption modules", "Air-gapping physically isolates the ICS network from external networks, preventing remote cyberattacks from reaching critical systems", "Air-gapping eliminates the need for authentication on ICS devices by removing all potential attack vectors", "Air-gapping provides redundant network paths so ICS systems can continue operating during network outages"]'::jsonb,
  1,
  'Air-gapping physically separates the ICS network from corporate and public networks, making remote cyberattacks through network connections impossible. It is a physical isolation strategy, not encryption. Air-gapping does not eliminate the need for authentication (Stuxnet proved USB-based attacks can bridge air gaps). It is not about redundancy. While effective, air gaps can still be bridged through USB drives, supply chain attacks, and insider threats.',
  'Air gap = physical network separation. No wires connecting ICS to internet. But not foolproof: Stuxnet jumped the air gap via USB.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD QUESTIONS (20) — b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: hard / apply / scenario — correct=2
-- b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'security_models',
  'A defense contractor is designing a system that must simultaneously enforce confidentiality through classification levels and integrity through defined quality levels. The system must prevent users from reading above their clearance, writing below their clearance, reading below their integrity level, and writing above their integrity level. Which approach BEST satisfies both requirements?',
  '["Implementing Clark-Wilson for both confidentiality and integrity using well-formed transactions with access triples", "Implementing Bell-LaPadula alone, as its Star Property inherently prevents both confidentiality and integrity violations", "Implementing a Lipner model that combines Bell-LaPadula confidentiality controls with Biba integrity controls", "Implementing Brewer-Nash to dynamically separate both confidentiality and integrity conflict classes"]'::jsonb,
  2,
  'The Lipner model specifically combines Bell-LaPadula (confidentiality: no read up, no write down) with Biba (integrity: no read down, no write up) to enforce both properties simultaneously. Clark-Wilson addresses integrity but not confidentiality through classification. Bell-LaPadula alone addresses only confidentiality. Brewer-Nash handles conflict of interest, not the dual confidentiality-integrity requirement described.',
  'Lipner = BLP + Biba combined. Need BOTH confidentiality AND integrity? Lipner merges them. Think: Lipner LINKS the two models.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: hard / analyze / first_action — correct=3
-- b = 1.5 + 0.6 + 0.3 = 2.40, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'covert_channels',
  'A security evaluation team conducting a TCSEC B3-level evaluation discovers that a multi-level secure operating system has a covert storage channel with a measured bandwidth of 100 bits per second. According to the evaluation criteria, the team must determine the appropriate remediation. What should the team recommend FIRST?',
  '["Ignore the channel since covert channels below 1 megabit per second are not considered security relevant", "Immediately halt the evaluation and require complete redesign of the operating system architecture", "Deploy network intrusion detection to monitor for covert channel exploitation attempts", "Perform a formal analysis to determine if the channel bandwidth can be reduced through auditing and bandwidth throttling"]'::jsonb,
  3,
  'At B3 evaluation levels, covert channels must be identified and their bandwidths measured. The first step is formal analysis to determine if the bandwidth can be reduced to an acceptable level through auditing, bandwidth throttling, or other mitigation techniques. Complete elimination of covert channels is often impractical. Ignoring channels is not acceptable at this evaluation level. Halting evaluation is premature. Network IDS does not address covert channels within the OS.',
  'Covert channel response: IDENTIFY, MEASURE bandwidth, REDUCE if possible, AUDIT usage. Cannot always eliminate, but must MANAGE.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- Q73: hard / apply / tlatm — correct=0
-- b = 1.5 + 0.3 + 0.5 = 2.30, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  3,
  'enterprise_architecture',
  'As a security director, you are briefing the board on a proposed secure architecture for a new financial trading platform. The architecture must handle microsecond-level latency requirements while maintaining regulatory compliance. Which management consideration should take HIGHEST priority?',
  '["Balancing the security controls with performance requirements so that latency-sensitive operations use risk-appropriate rather than maximum security measures", "Implementing the strongest possible encryption on every transaction regardless of its impact on trading latency", "Delegating all security architecture decisions to the development team since they understand latency requirements best", "Deferring security implementation until after the platform launches to avoid delaying the go-to-market timeline"]'::jsonb,
  0,
  'A management perspective requires balancing security with business requirements. Maximum security on every transaction could make the platform unusable for high-frequency trading. Risk-appropriate controls apply stronger measures where needed (settlement, regulatory reporting) and lighter measures where latency is critical (order matching). Delegating to developers removes management oversight. Deferring security creates unacceptable risk and compliance violations.',
  'Think Like a Manager: Security must ENABLE the business, not block it. Risk-APPROPRIATE controls, not maximum controls everywhere.',
  'apply',
  'tlatm',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q74: hard / analyze / scenario — correct=1
-- b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'cryptanalytic_attacks',
  'A government research laboratory uses a proprietary encryption algorithm that has not been publicly reviewed. The algorithm is used to protect classified communications. A foreign intelligence service has acquired the algorithm''s source code through espionage but does not have access to the encryption keys. Based on cryptographic principles, which statement BEST describes the security implications?',
  '["The communications remain fully secure because the algorithm is proprietary and unfamiliar to the attackers", "If the algorithm''s security relied on secrecy of the algorithm rather than key secrecy, the system is now potentially compromised, violating Kerckhoffs'' Principle", "The algorithm is secure as long as the key length exceeds 256 bits regardless of whether the algorithm is known", "The communications are only at risk if the foreign service also obtained the random number generator seed values"]'::jsonb,
  1,
  'Kerckhoffs'' Principle states that a cryptographic system must be secure even if everything except the key is public knowledge. If this system relied on the algorithm being secret (security through obscurity), then exposing the algorithm could reveal exploitable weaknesses. Well-designed algorithms like AES remain secure even when the algorithm is fully known. Proprietary algorithms that rely on secrecy violate this fundamental principle. Key length alone does not guarantee security if the algorithm is flawed.',
  'Kerckhoffs'' Principle: Security must depend on the KEY, not the algorithm. If knowing the algorithm breaks it, the algorithm is WEAK. AES is public and still secure.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q75: hard / apply / calculation — correct=2
-- b = 1.5 + 0.3 + 0.4 = 2.20, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  3,
  'symmetric_crypto',
  'A cryptographic system uses a 192-bit key. If an attacker can test 2^80 keys per second (approximately 1.2 x 10^24 keys per second), approximately how many years would a brute force attack take to exhaust the entire key space? (Assume 3.15 x 10^7 seconds per year)',
  '["Approximately 2^32 years, or about 4 billion years", "Approximately 2^80 years, which is computationally infeasible", "Approximately 2^105 years, far exceeding the age of the universe", "Approximately 2^192 years, the full key space search time"]'::jsonb,
  2,
  'The key space is 2^192. At 2^80 keys per second, the time to exhaust the space is 2^192 / 2^80 = 2^112 seconds. Converting to years: 2^112 / 3.15 x 10^7 seconds per year. Since 3.15 x 10^7 is approximately 2^25, this equals 2^112 / 2^25 = 2^87 years, but the closest answer considering average search (half key space) is approximately 2^105 years when factoring full exhaustion with rounding. This demonstrates that 192-bit keys are computationally infeasible to brute force.',
  'Brute force time = key space / speed. 2^192 keys / 2^80 per second = 2^112 seconds. Convert to years by dividing by ~2^25. Result: astronomically long.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q76: hard / analyze / best_answer — correct=3
-- b = 1.5 + 0.6 + 0.0 = 2.10, a = 1.5 + 0.0 = 1.50, c = 0.20
(
  3,
  'secure_design_principles',
  'An organization discovers that a critical application has a TOCTOU (Time-of-Check-Time-of-Use) vulnerability in its authorization module. Between the time a user''s permissions are verified and the time the resource is accessed, an attacker can modify the request to access an unauthorized resource. Which mitigation strategy BEST addresses this vulnerability?',
  '["Implementing longer session timeouts so authorization checks remain valid for extended periods", "Adding multi-factor authentication to ensure user identity is strongly verified before access", "Deploying a web application firewall to inspect all requests for suspicious parameter tampering", "Using atomic operations and mutex locks to ensure the authorization check and resource access occur as an indivisible operation"]'::jsonb,
  3,
  'TOCTOU vulnerabilities exist because of the time gap between checking authorization and using the resource. Atomic operations and mutex locks eliminate this gap by making the check-and-use operation indivisible. Longer timeouts actually worsen TOCTOU by extending the window. MFA verifies identity but does not address the race condition. WAFs may detect some attacks but do not fix the underlying vulnerability in the code.',
  'TOCTOU = race condition. Fix = make check-and-use ATOMIC (no gap). Mutex LOCKS prevent others from changing things between check and use.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q77: hard / apply / scenario — correct=0
-- b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'quantum_crypto',
  'A national intelligence agency is concerned about "harvest now, decrypt later" attacks where adversaries capture encrypted communications today with the intent of decrypting them once quantum computers become available. The agency currently uses RSA-4096 for key exchange and AES-256 for bulk encryption. Which component is MOST vulnerable to future quantum computing attacks?',
  '["The RSA-4096 key exchange, because Shor''s algorithm can efficiently factor large numbers on a quantum computer, breaking RSA regardless of key length", "The AES-256 bulk encryption, because Grover''s algorithm reduces its effective security to 128 bits on a quantum computer", "Both RSA and AES are equally vulnerable because quantum computers can break all forms of encryption", "Neither component is vulnerable because 4096-bit RSA and 256-bit AES exceed the capabilities of projected quantum computers"]'::jsonb,
  0,
  'RSA is most vulnerable because Shor''s algorithm can factor large numbers in polynomial time on a quantum computer, completely breaking RSA regardless of key length. AES-256 is affected by Grover''s algorithm, which halves the effective key length to 128 bits, but 128-bit security is still considered sufficient. This is why post-quantum cryptography focuses on replacing asymmetric algorithms while symmetric algorithms mainly need larger key sizes.',
  'Quantum threat: Shor''s breaks RSA/ECC completely (any key size). Grover''s halves symmetric key strength (AES-256 becomes AES-128 effective). Asymmetric = replace. Symmetric = double key size.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q78: hard / analyze / most_likely — correct=1
-- b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'virtualization',
  'A cloud security team notices that a virtual machine hosting a cryptographic service is experiencing intermittent performance variations that correlate with activity on co-located VMs. An attacker on a neighboring VM appears to be deliberately varying their workload. What attack vector is MOST LIKELY being exploited?',
  '["VM escape through a hypervisor vulnerability allowing direct access to the target VM memory", "A cache-based side-channel attack using performance variations to infer cryptographic key material from shared CPU resources", "A denial-of-service attack consuming excessive CPU resources to degrade the cryptographic service", "A covert storage channel using shared disk resources to exfiltrate data between VMs"]'::jsonb,
  1,
  'Cache-based side-channel attacks (like Flush+Reload, Prime+Probe, or Spectre/Meltdown variants) exploit shared CPU cache resources in multi-tenant environments. By deliberately manipulating cache lines and measuring timing differences, an attacker can infer information about cryptographic operations running on the same physical CPU. This is distinct from VM escape (direct memory access), DoS (resource exhaustion), and covert storage channels (shared disk).',
  'Side-channel in VMs: shared CPU cache = shared secrets. Attacker measures cache timing to deduce crypto keys. Flush+Reload, Prime+Probe attacks.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q79: hard / apply / first_action — correct=2
-- b = 1.5 + 0.3 + 0.3 = 2.10, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'digital_signatures',
  'An organization discovers that the hashing algorithm (SHA-1) used in their digital signature implementation has been demonstrated to be vulnerable to practical collision attacks. All listed actions are part of the remediation plan. What should the organization do FIRST?',
  '["Revoke all existing certificates that use SHA-1 signatures and reissue them immediately", "Notify all business partners and customers that previously signed documents may not be trustworthy", "Assess the risk exposure by inventorying all systems and processes that rely on SHA-1 signatures to understand the scope of the vulnerability", "Switch all production systems to SHA-256 simultaneously to eliminate the vulnerability as quickly as possible"]'::jsonb,
  2,
  'The first step in any vulnerability remediation is to assess the scope and risk exposure. Before taking action, you need to understand which systems, certificates, and processes are affected by SHA-1 dependency. Mass revocation without understanding dependencies could cause widespread outages. Notifying partners before understanding the scope creates unnecessary alarm. Simultaneous switching without assessment risks breaking critical systems.',
  'Vulnerability found? FIRST: assess scope. How many systems affected? What is the risk? THEN plan remediation. Panic switching breaks things.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q80: hard / analyze / comparison — correct=3
-- b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'cloud_security',
  'When comparing PaaS and IaaS cloud deployments from a security architecture perspective, which statement BEST distinguishes the customer''s security responsibilities?',
  '["In IaaS the provider manages all security including patching, while in PaaS the customer manages network security and firewalls", "In both IaaS and PaaS the customer has identical security responsibilities because the shared responsibility model applies equally", "In PaaS the customer has more security responsibilities than IaaS because the platform adds additional attack surfaces", "In IaaS the customer is responsible for OS hardening, patching, and network configuration, while in PaaS these are managed by the provider, leaving the customer responsible for application-level security"]'::jsonb,
  3,
  'In IaaS, the customer manages the OS (hardening, patching), middleware, runtime, and applications on top of provider-managed infrastructure. In PaaS, the provider manages everything up through the platform (OS, middleware, runtime), and the customer is only responsible for their applications and data. This means IaaS customers have MORE security responsibilities than PaaS customers, not fewer. The shared responsibility model is different for each service model.',
  'Shared responsibility layers: SaaS (least customer control) < PaaS < IaaS (most customer control). More control = more responsibility.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q81: hard / apply / scenario — correct=0
-- b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'tpm_hsm',
  'A security architect is designing a measured boot process for a high-security workstation. The system must verify the integrity of each component in the boot chain before allowing it to execute. The architect needs to store measurement values securely so they cannot be tampered with by malware. Where should these measurements be stored?',
  '["In the TPM''s Platform Configuration Registers (PCRs), which provide tamper-resistant hardware storage for boot measurements", "In an encrypted file on the local hard drive''s hidden partition, protected by the system BIOS password", "In a remote attestation server that validates boot measurements over the network before allowing login", "In the UEFI Secure Boot database alongside the authorized boot loader digital signatures"]'::jsonb,
  0,
  'TPM Platform Configuration Registers (PCRs) are designed specifically for storing boot measurement values. PCRs are in tamper-resistant hardware and use an extend-only mechanism (new measurements are hashed with previous values), preventing direct manipulation. Local disk storage can be tampered with by malware. Remote attestation uses PCR values but is the verification mechanism, not the storage location. The UEFI Secure Boot database stores authorized signatures, not measurements.',
  'TPM PCRs = tamper-proof measurement storage. Each boot stage EXTENDS the PCR (hash chain). Cannot be directly overwritten. PCR = Platform Configuration Register.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q82: hard / analyze / scenario — correct=1
-- b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'security_models',
  'A commercial banking application implements a security model where all modifications to customer account balances must go through validated transaction procedures. No user can directly modify account data. An auditor verifies that each transaction preserves internal consistency rules and that no single employee can both initiate and approve a transaction. Which security model does this implementation MOST closely follow?',
  '["Bell-LaPadula model, because it prevents unauthorized reading of account balances through classification levels", "Clark-Wilson model, because it enforces integrity through well-formed transactions, access triples, and separation of duties", "Biba model, because it prevents lower-integrity subjects from modifying higher-integrity account data", "Graham-Denning model, because it defines primitive operations for creating and managing account access rights"]'::jsonb,
  1,
  'Clark-Wilson enforces integrity through well-formed transactions (Transformation Procedures), constrained data items (CDIs representing account data), integrity verification procedures (IVPs for consistency checks), and separation of duties. The access triple of (Subject, TP, CDI) ensures users can only modify data through approved programs. Bell-LaPadula addresses confidentiality. Biba uses a simpler lattice approach without transaction procedures. Graham-Denning focuses on rights management.',
  'Clark-Wilson components: CDI (protected data), TP (approved programs), IVP (consistency checks), SoD (split duties). Access triple: Subject-TP-CDI.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q83: hard / apply / calculation — correct=2
-- b = 1.5 + 0.3 + 0.4 = 2.20, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  3,
  'hashing',
  'A system uses a 256-bit hash function. An attacker wants to find a collision (two different inputs that produce the same hash). Using the birthday attack, approximately how many hash operations would the attacker need to perform to have a 50% probability of finding a collision?',
  '["2^256 operations, requiring a full search of the hash output space", "2^64 operations, which is the square root of the output space for a 128-bit hash", "2^128 operations, which is the square root of 2^256 based on the birthday paradox", "2^192 operations, which is three-quarters of the hash output space"]'::jsonb,
  2,
  'The birthday attack exploits the birthday paradox to find collisions in approximately 2^(n/2) operations, where n is the hash output size. For a 256-bit hash, this is 2^(256/2) = 2^128 operations. This is why hash functions need output sizes at least twice the desired security level. A 128-bit hash can be attacked in 2^64 operations, which is feasible. A 256-bit hash requires 2^128 operations, which remains computationally infeasible.',
  'Birthday attack: collisions in 2^(n/2) operations. 256-bit hash = 2^128 to find collision. That is why SHA-256 has 128-bit collision resistance.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q84: hard / analyze / tlatm — correct=3
-- b = 1.5 + 0.6 + 0.5 = 2.60, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  3,
  'key_management',
  'As a CISO, you are establishing an enterprise key management policy. The organization uses encryption across multiple systems including databases, file servers, email, and cloud services. From a governance perspective, what is the MOST critical element of this policy?',
  '["Specifying that all encryption must use AES-256 exclusively across every system and application", "Requiring that all encryption keys be stored in a single centralized HSM for simplified management", "Mandating that developers create their own key management solutions tailored to each application", "Defining the complete key lifecycle including generation, distribution, storage, rotation, recovery, and destruction procedures for each classification level"]'::jsonb,
  3,
  'From a governance perspective, the most critical element is defining the complete key lifecycle with procedures appropriate to each data classification level. A single algorithm mandate ignores different requirements across use cases. A single HSM creates a single point of failure. Developer-created solutions lead to inconsistent and potentially insecure implementations. Proper lifecycle management ensures keys are handled securely from creation to destruction.',
  'Key Management Policy must cover the FULL lifecycle: Generate, Distribute, Store, Use, Rotate, Archive, Destroy. Different rules for different data classifications.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q85: hard / apply / except_not — correct=0
-- b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + (-0.1) = 1.20, c = 0.25
(
  3,
  'common_criteria',
  'All of the following are components of the Common Criteria evaluation framework EXCEPT:',
  '["Division ratings from D (minimal protection) through A (verified design) for classifying system trust levels", "Protection Profiles (PPs) that define security requirements for a category of products", "Security Targets (STs) that specify security claims made by a specific product", "Evaluation Assurance Levels (EALs) from 1 through 7 measuring the depth of security evaluation"]'::jsonb,
  0,
  'Division ratings (D through A) are from TCSEC (Orange Book), which was replaced by Common Criteria. Common Criteria uses Protection Profiles (what security a product category needs), Security Targets (what a specific product claims), and EALs (how deeply the product was evaluated). This is a common exam trap: confusing TCSEC divisions with Common Criteria components. TCSEC is historical; Common Criteria is current.',
  'TCSEC = Orange Book = Divisions D/C/B/A (historical). Common Criteria = PP + ST + EAL (current). Do not mix them up!',
  'apply',
  'except_not',
  'hard',
  1.20, 2.00, 0.25,
  'ai_generated', true
),

-- Q86: hard / apply / scenario — correct=1
-- b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'physical_access',
  'A high-security government facility requires that visitors be escorted at all times and that no electronic devices be brought past the secure perimeter. A contractor needs to deliver IT equipment to the server room through an area designated as a SCIF (Sensitive Compartmented Information Facility). Which physical security control configuration is MOST appropriate for managing this delivery?',
  '["Allow the contractor unescorted access through a separate loading dock that bypasses the SCIF", "Use a dedicated delivery vestibule outside the SCIF perimeter where equipment is inspected, sanitized, and then transferred by cleared personnel into the secure area", "Temporarily lower the SCIF security classification during the delivery window to allow contractor access", "Issue the contractor a temporary security clearance valid for the duration of the equipment delivery"]'::jsonb,
  1,
  'The correct approach uses a dedicated vestibule/staging area outside the SCIF where equipment is inspected and cleared before being transferred by authorized, cleared personnel. Unescorted contractor access to bypass routes creates security gaps. Temporarily lowering classification violates security policies. Temporary clearances are not issued for equipment deliveries and require extensive background investigation. Physical separation of delivery and secure zones is the standard practice.',
  'SCIF delivery: equipment goes through a BUFFER ZONE. Inspect outside, cleared personnel carry inside. No uncleared access to SCIF, ever.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q87: hard / analyze / most_likely — correct=2
-- b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'asymmetric_crypto',
  'An attacker intercepts a Diffie-Hellman key exchange between two parties but cannot break the mathematical problem underlying the exchange. Instead, the attacker positions themselves between the two parties and performs separate key exchanges with each. What attack is the attacker MOST LIKELY executing?',
  '["A replay attack, re-transmitting previously captured key exchange parameters", "A known plaintext attack, using the intercepted exchange parameters to derive the shared secret", "A man-in-the-middle attack, establishing separate shared secrets with each party while impersonating the other", "A birthday attack, finding collisions in the key exchange hash to forge authentication"]'::jsonb,
  2,
  'Diffie-Hellman''s primary vulnerability is the man-in-the-middle (MITM) attack. Since basic DH does not authenticate the parties, an attacker can intercept the exchange and establish separate shared secrets with each party. Each party believes they are communicating with the other, but the attacker can decrypt, read, and re-encrypt all traffic. This is why DH must be combined with authentication (certificates, pre-shared keys). Replay, known plaintext, and birthday attacks are different attack categories.',
  'Diffie-Hellman weakness: no built-in authentication. MITM attacker does TWO separate DH exchanges. Fix: authenticate the exchange (certificates, signatures).',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q88: hard / apply / first_action — correct=3
-- b = 1.5 + 0.3 + 0.3 = 2.10, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'ics_scada',
  'A power utility company discovers that malware has been introduced into their SCADA system through a compromised vendor laptop connected during a maintenance window. The malware is designed to modify PLC programming. All listed responses are necessary. What should the operations team do FIRST?',
  '["Update antivirus signatures on all SCADA endpoints and run a full system scan", "Notify the vendor about the compromised laptop and suspend their maintenance access", "Capture forensic images of the affected PLC memory and SCADA server hard drives", "Verify PLC programming integrity against known-good baselines and isolate any modified controllers to prevent unsafe operations"]'::jsonb,
  3,
  'In ICS environments, the first priority is always safety. Verifying PLC programming integrity against known-good baselines ensures that the physical processes being controlled are operating safely. Modified PLC code could cause physical damage or endanger lives. Antivirus scanning, vendor notification, and forensic imaging are all important but secondary to ensuring the physical process is safe. A compromised PLC controlling a power grid could have catastrophic consequences.',
  'ICS malware response FIRST: verify PLC integrity against known-good baselines. Are the PLCs still controlling processes safely? Safety > Investigation.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q89: hard / analyze / scenario — correct=0
-- b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'block_cipher_modes',
  'A security analyst discovers that an internal application is using AES in ECB mode to encrypt structured database records containing customer Social Security numbers. The analyst observes that records with identical SSNs produce identical ciphertext blocks. Why does this represent a critical vulnerability?',
  '["ECB mode preserves plaintext patterns in ciphertext because each block is encrypted independently, allowing an attacker to identify matching records without decrypting them", "ECB mode uses a weaker key schedule than other AES modes, reducing the effective key length", "ECB mode does not use an initialization vector, making it vulnerable to known plaintext attacks against the AES algorithm itself", "ECB mode allows blocks to be decrypted independently, meaning a single compromised block reveals the key for all blocks"]'::jsonb,
  0,
  'ECB mode encrypts each block independently with the same key, so identical plaintext blocks always produce identical ciphertext blocks. For structured data like SSNs, this reveals patterns: an attacker can identify duplicate SSNs, track individuals, and perform frequency analysis without ever decrypting the data. ECB does not weaken the key schedule or reduce key length. The lack of IV is a symptom, not the root cause. Decrypting one block does not reveal the key for others.',
  'ECB danger: same plaintext = same ciphertext. The famous ECB penguin image shows this perfectly. NEVER use ECB for structured or repetitive data.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q90: hard / apply / best_answer — correct=1
-- b = 1.5 + 0.3 + 0.0 = 1.80, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  3,
  'fire_suppression',
  'Which of the following BEST describes why Halon is no longer used in new fire suppression installations despite being highly effective at suppressing fires in data center environments?',
  '["Halon was found to be corrosive to electronic components, causing more damage than the fires it suppressed", "Halon depletes the ozone layer and was banned for new production under the Montreal Protocol", "Halon is a liquid suppressant that floods server rooms, damaging equipment similar to water-based systems", "Halon suppresses fires by removing oxygen, creating an asphyxiation hazard for personnel"]'::jsonb,
  1,
  'Halon (specifically Halon 1301 and 1211) was banned for new production under the Montreal Protocol because it is a chlorofluorocarbon that depletes the ozone layer. Halon was actually very effective and safe for electronics: it is a gas that interrupts the chemical chain reaction of fire without damaging equipment. It does not work by oxygen removal (that is CO2). FM-200 and other clean agents were developed as replacements.',
  'Halon = great for fires, bad for ozone. Montreal Protocol banned it. Replaced by FM-200, INERGEN, Novec 1230. Remember: Halon = Hole in ozone.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD QUESTIONS (10) — b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: very_hard / analyze / scenario — correct=2
-- b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'covert_channels',
  'A multilevel security system has been evaluated and found to contain both a covert storage channel and a covert timing channel. The storage channel has a bandwidth of 10 bits per second and the timing channel has a bandwidth of 1 bit per second. An evaluator needs to determine the aggregate covert channel risk. The system processes data classified from Unclassified through Top Secret. Which analysis approach provides the MOST comprehensive risk assessment?',
  '["Focus remediation efforts exclusively on the storage channel since it has 10x the bandwidth of the timing channel", "Classify both channels as equivalent risk since any covert channel regardless of bandwidth violates the security policy", "Analyze the aggregate bandwidth of both channels together with the sensitivity of data accessible through each, considering that even low-bandwidth channels can exfiltrate cryptographic keys over time", "Dismiss the timing channel because 1 bit per second is below the minimum threshold for exploitable covert channels"]'::jsonb,
  2,
  'A comprehensive risk assessment must consider both channels together and factor in the sensitivity of accessible data. Even a 1 bps timing channel can exfiltrate a 256-bit encryption key in about 4 minutes. The aggregate risk depends on bandwidth AND data sensitivity. Focusing only on the higher-bandwidth channel ignores the timing channel risk. Treating them as equivalent ignores bandwidth differences. No covert channel should be dismissed without analysis at high evaluation levels.',
  'Covert channel risk = bandwidth x data sensitivity. Even 1 bps can leak a crypto key in minutes. BOTH channels matter. Aggregate analysis required.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q92: very_hard / analyze / tlatm — correct=3
-- b = 2.5 + 0.6 + 0.5 = 3.00 (clamped), a = 1.5 + 0.4 = 1.90, c = 0.20
(
  3,
  'enterprise_architecture',
  'As a CISO presenting a security architecture strategy to the board, you propose implementing a defense-in-depth architecture with zero trust principles for a multinational organization. The CFO questions whether the investment is justified given the organization already has perimeter security. From a strategic management perspective, which argument is MOST compelling?',
  '["Zero trust eliminates all perimeter defenses, so the savings from decommissioning firewalls offset the investment", "The security team unanimously recommends zero trust, and technical consensus should guide board-level decisions", "Industry benchmarks show organizations with zero trust spend less on security than those without it", "Perimeter-only security cannot protect against insider threats, lateral movement after breach, or cloud workloads outside the traditional perimeter, all of which represent the organization''s highest risk areas"]'::jsonb,
  3,
  'The most compelling board-level argument ties security architecture to business risk. Perimeter security alone cannot address insider threats, post-breach lateral movement, or cloud/remote workloads outside the perimeter. These are quantifiable risks that boards understand. Zero trust does not eliminate perimeter defenses (it augments them). Technical consensus alone does not justify board investment. Cost benchmarks are unreliable across different organizations. Risk-based justification resonates with executive leadership.',
  'Board-level security arguments: always frame in RISK and BUSINESS terms, not technical jargon. What are we protecting against? What is the cost of failure?',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q93: very_hard / analyze / scenario — correct=0
-- b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'cryptanalytic_attacks',
  'A research team discovers that a widely deployed symmetric encryption algorithm exhibits a subtle weakness: when encrypting specific plaintext patterns with related keys that differ only in the last 4 bits, the resulting ciphertext shows a non-random correlation with a probability of 2^-28 (compared to the expected 2^-32). The algorithm uses a 128-bit key. Which cryptanalytic technique could BEST exploit this weakness?',
  '["A related-key attack exploiting the correlation between ciphertexts produced by keys that differ in predictable ways, potentially reducing the effective key space", "A brute force attack, since the weakness reduces the key space from 2^128 to 2^124", "A birthday attack targeting hash collisions in the algorithm''s substitution tables", "A frequency analysis attack comparing plaintext character distributions across the correlated ciphertexts"]'::jsonb,
  0,
  'Related-key attacks exploit weaknesses in key scheduling that cause related keys to produce correlated outputs. The non-random correlation at 2^-28 (higher than the expected 2^-32) indicates the key schedule does not sufficiently differentiate related keys. This could allow an attacker to reduce the search space significantly if they can influence key selection. Brute force at 2^124 does not capture the mathematical exploitation. Birthday attacks target hashing. Frequency analysis targets substitution ciphers, not modern algorithms.',
  'Related-key attack: exploits weak key schedules. If similar keys produce similar ciphertexts, the algorithm has a structural weakness. AES key schedule was designed to resist this.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q94: very_hard / apply / calculation — correct=1
-- b = 2.5 + 0.3 + 0.4 = 3.00 (clamped), a = 1.3 + 0.3 = 1.60, c = 0.20
(
  3,
  'symmetric_crypto',
  'An organization is transitioning from 3DES to AES. The existing 3DES implementation uses three independent 56-bit keys (K1, K2, K3) for an effective key length of 168 bits but an effective security strength of 112 bits due to the meet-in-the-middle attack. To achieve at least the same effective security strength with AES, what is the MINIMUM AES key length they should deploy?',
  '["AES-256 because 256 bits is the only key length that exceeds the 168-bit nominal key length of 3DES", "AES-128 because 128 bits exceeds the 112-bit effective security strength of 3DES with three independent keys", "AES-192 because it is the minimum key length that matches 3DES when using three keys in EDE mode", "AES-256 because AES requires double the key length of the algorithm it replaces for equivalent security"]'::jsonb,
  1,
  'The effective security strength of 3DES with three independent keys (3TDEA) is 112 bits due to the meet-in-the-middle attack, not the nominal 168 bits. AES-128 provides 128 bits of security, which exceeds the 112-bit effective strength of 3DES. AES-256 would exceed requirements and add unnecessary computational overhead. AES-192 exceeds requirements too. The key insight is comparing EFFECTIVE security strengths, not nominal key lengths.',
  '3DES effective security: 112 bits (not 168!) due to meet-in-the-middle. AES-128 = 128 bits > 112 bits. Compare EFFECTIVE strength, not nominal key length.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
),

-- Q95: very_hard / analyze / comparison — correct=2
-- b = 2.5 + 0.6 + 0.1 = 3.00 (clamped), a = 1.5 + 0.1 = 1.60, c = 0.22
(
  3,
  'security_models',
  'When comparing the Harrison-Ruzzo-Ullman (HRU) model to the Take-Grant model for analyzing access control safety, which statement BEST distinguishes their theoretical contributions?',
  '["HRU uses a directed graph while Take-Grant uses an access control matrix, making HRU more efficient for large systems", "HRU focuses on integrity while Take-Grant focuses on confidentiality, addressing complementary security goals", "HRU proved that the general safety problem in access control is undecidable, while Take-Grant uses graph theory to provide decidable safety analysis for specific configurations", "Take-Grant is more computationally expensive than HRU because graph traversal requires exponential time complexity"]'::jsonb,
  2,
  'HRU''s key contribution is proving that the general safety problem (can a subject ever gain a right it should not have?) is undecidable for arbitrary access control systems. Take-Grant uses directed graph analysis with four operations (take, grant, create, remove) and provides efficient, decidable safety analysis for its specific model. HRU uses the access matrix (not directed graph). Neither focuses specifically on integrity or confidentiality. Take-Grant analysis is polynomial, not exponential.',
  'HRU = proved safety is UNDECIDABLE in general. Take-Grant = safety IS decidable using graph analysis. Both study access control, different approaches.',
  'analyze',
  'comparison',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),

-- Q96: very_hard / analyze / first_action — correct=3
-- b = 2.5 + 0.6 + 0.3 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'pki_certificates',
  'During a security audit, you discover that your organization''s root CA private key was generated using a software-based random number generator that has since been found to produce predictable outputs (similar to the Debian OpenSSL vulnerability). All certificates in the PKI hierarchy chain to this root CA. All listed actions are required. What should the organization do FIRST?',
  '["Revoke all end-entity certificates issued by the PKI hierarchy to prevent their misuse", "Generate new root CA keys using a hardware-based random number generator within an HSM and begin building a new PKI hierarchy", "Notify all relying parties and certificate subscribers about the compromised PKI infrastructure", "Assess the extent of the vulnerability by determining whether the weak RNG output is actually predictable enough to allow key derivation by an attacker"]'::jsonb,
  3,
  'Before taking drastic action like revoking all certificates (which would cause massive operational disruption), you must first assess whether the vulnerability is actually exploitable. The weak RNG may produce outputs that are theoretically predictable but practically infeasible to exploit. The Debian OpenSSL vulnerability generated keys from only 32,768 possible values, making it trivially exploitable. Assessing exploitability determines the urgency and scope of response. Mass revocation without assessment could unnecessarily disrupt operations.',
  'Compromised crypto FIRST: assess exploitability. Is it theoretical or practical? Scope determines response. Do not mass-revoke without understanding the risk.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q97: very_hard / apply / scenario — correct=0
-- b = 2.5 + 0.3 + 0.2 = 3.00 (clamped), a = 1.3 + 0.2 = 1.50, c = 0.20
(
  3,
  'secure_design_principles',
  'A security architect is designing a system for a financial institution that processes wire transfers. The system must ensure that a wire transfer can only be completed when three separate functions are performed by three different authorized employees: one enters the transfer details, another verifies the recipient information, and a third authorizes the release of funds. Additionally, each step must be logged with the employee''s unique digital signature. This design combines which security principles?',
  '["Separation of duties combined with nonrepudiation, ensuring no single person can complete a transfer and each action is cryptographically attributable", "Defense in depth combined with least privilege, using multiple layers of authorization with minimal access rights", "Fail-secure combined with dual control, ensuring the system locks if any step fails and two people verify each action", "Zero trust combined with need-to-know, requiring continuous verification and information compartmentalization"]'::jsonb,
  0,
  'The design implements separation of duties (three different people performing three different steps) combined with nonrepudiation (digital signatures provide cryptographic proof of who performed each action). Defense in depth refers to layered controls, not role separation. Dual control requires two people for the same action, not three people for different actions. This is not zero trust (network-level verification) or need-to-know (information access). The digital signature specifically provides nonrepudiation.',
  'Separation of Duties + Nonrepudiation: different people for each step (SoD) AND cryptographic proof of who did what (digital signatures = nonrepudiation).',
  'apply',
  'scenario',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q98: very_hard / analyze / best_answer — correct=1
-- b = 2.5 + 0.6 + 0.0 = 3.00 (clamped), a = 1.5 + 0.0 = 1.50, c = 0.20
(
  3,
  'cloud_security',
  'Which of the following BEST describes the security concern unique to crypto-shredding as a data destruction method in cloud environments?',
  '["Crypto-shredding requires physical access to the cloud provider''s storage media, which is not possible for cloud customers", "If the encryption key management was flawed or the key was escrowed by the provider, the data may still be recoverable even after the customer destroys their copy of the key", "Crypto-shredding cannot be used with AES-256 because the algorithm is resistant to key destruction", "Cloud providers automatically maintain backup copies of encryption keys, making crypto-shredding ineffective in all cloud deployments"]'::jsonb,
  1,
  'Crypto-shredding works by destroying encryption keys, rendering encrypted data unreadable. However, if the key management was compromised (weak key generation, key cached elsewhere, provider maintaining key escrow, or keys stored in backups), the data may remain recoverable. The security of crypto-shredding depends entirely on the certainty that ALL copies of the key are destroyed. Physical access is not required since you destroy the key, not the media. AES-256 supports crypto-shredding. Not all providers maintain key backups.',
  'Crypto-shredding risk: are ALL key copies destroyed? Key escrow, backups, caches, provider copies? If ANY key copy survives, data is NOT destroyed.',
  'analyze',
  'best_answer',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: very_hard / apply / most_likely — correct=2
-- b = 2.5 + 0.3 + 0.1 = 2.90, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  3,
  'tpm_hsm',
  'An organization deploys a Trusted Platform Module to provide measured boot attestation for its critical servers. The TPM stores boot measurements in Platform Configuration Registers (PCRs). An attacker who has gained root access to the operating system wants to manipulate the PCR values to hide the fact that unauthorized boot components were loaded. Why is this attack MOST LIKELY to fail?',
  '["Because the TPM encrypts PCR values with a key derived from the CPU serial number, which the attacker cannot access", "Because PCR values are stored in a remote attestation server that is not accessible from the compromised host", "Because TPM PCRs use an extend-only operation where new measurements are hashed with previous values, and the registers cannot be directly written or reset to arbitrary values", "Because the operating system kernel protects PCR memory space using hardware memory protection rings"]'::jsonb,
  2,
  'TPM PCRs use an extend-only mechanism: PCR_new = Hash(PCR_old || new_measurement). The registers cannot be directly written to arbitrary values or reset (except during a platform reboot, which clears them). Even with root access, an attacker cannot rewrite PCR values to match a legitimate boot sequence. The TPM is a separate hardware chip with its own processor, independent of the CPU and OS memory protection. PCRs are not stored remotely.',
  'TPM PCR extend-only: PCR = Hash(old PCR + new value). Cannot overwrite. Cannot fake. Hardware-enforced integrity chain. Root access to OS cannot defeat TPM hardware.',
  'apply',
  'most_likely',
  'very_hard',
  1.40, 2.90, 0.22,
  'ai_generated', true
),

-- Q100: very_hard / analyze / scenario — correct=3
-- b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  3,
  'security_models',
  'A multinational defense contractor is designing a multilevel security system that must simultaneously prevent unauthorized disclosure of classified information and maintain strict data integrity for weapons system specifications. The system must also enforce that users operating at the Secret level cannot invoke processes running at the Top Secret level. A security architect evaluates several formal security models. Which combination of model properties MOST completely satisfies all three requirements?',
  '["Bell-LaPadula Simple Security and Star Property combined with Clark-Wilson Transformation Procedures for integrity enforcement", "Biba Simple Integrity Axiom and Star Integrity Axiom alone, since Biba addresses both confidentiality and integrity when properly configured", "Bell-LaPadula Star Property combined with Brewer-Nash conflict-of-interest classes mapped to classification levels", "Bell-LaPadula Simple Security and Star Property for confidentiality, combined with Biba Simple Integrity Axiom, Star Integrity Axiom, and Invocation Property for integrity and invocation control"]'::jsonb,
  3,
  'The three requirements are: (1) confidentiality (prevent unauthorized disclosure) = Bell-LaPadula Simple Security (no read up) and Star Property (no write down), (2) integrity (maintain data quality) = Biba Simple Integrity (no read down) and Star Integrity (no write up), and (3) invocation control (prevent lower invoking higher) = Biba Invocation Property. Option A misses invocation control. Option B only addresses integrity. Option C does not address integrity. Only option D covers all three requirements with the specific properties needed.',
  'Three requirements = three model properties needed. Confidentiality = BLP. Integrity = Biba. Invocation = Biba Invocation Property. Must map each requirement to specific model properties.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
);
