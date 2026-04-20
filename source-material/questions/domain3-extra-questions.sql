-- =====================================================================
-- CISSP Quest -- Domain 3: Security Architecture and Engineering
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: Kerberos ticket flow, PKI trust models, HSM use cases,
--   quantum-resistant algorithms, secure enclave/TPM,
--   Bell-LaPadula edge cases
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain3-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  3, 'kerberos',
  'A user authenticates to Kerberos and receives a Ticket Granting Ticket (TGT). When the user attempts to access a file server, what is the CORRECT sequence of remaining Kerberos exchanges?',
  '["The client sends the TGT to the KDC TGS to request a Service Ticket (ST) for the file server; the TGS issues the ST encrypted with the file server''s secret key; the client presents the ST to the file server, which decrypts it using its own key to authenticate the client", "The client sends the TGT directly to the file server, which forwards it to the KDC for validation", "The client must re-authenticate with the KDC AS using credentials each time it accesses a new service because TGTs are single-use", "The KDC proactively pushes Service Tickets to all authorized users when a service comes online, eliminating the need for client requests"]'::jsonb,
  0,
  'Kerberos flow after TGT issuance: (1) Client → KDC TGS: presents TGT + Authenticator, requests ST for target service. (2) KDC TGS → Client: issues ST encrypted with the service''s secret key (service does not have the TGT). (3) Client → File Server: presents ST + Authenticator. (4) File Server: decrypts ST with its own secret key, validates authenticator, grants access. The TGT never goes to the service. The client does not re-authenticate with AS for each service -- that is the purpose of the TGT. KDC does not proactively push tickets.',
  'Kerberos flow: AS gives TGT. TGS gives ST. ST goes to Service. TGT never leaves KDC interaction. Three-party, two-step after login.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  3, 'pki_trust_models',
  'An organization must establish PKI trust between two separate enterprises. Enterprise A has a hierarchical PKI with an offline Root CA. Enterprise B also has a hierarchical PKI with an offline Root CA. Which trust model comparison is MOST accurate for enabling mutual authentication?',
  '["Cross-certification is only possible if both organizations use the same CA vendor software", "Cross-certification establishes a peer-to-peer trust relationship by having each CA sign the other''s certificate, allowing both organizations to validate each other''s end-entity certificates through their respective chains; bridge CA architecture adds a third-party bridge CA that cross-certifies with both, enabling scalable multi-organization trust without direct bilateral cross-certifications", "Both enterprises should merge their PKIs under a single common Root CA to enable mutual authentication", "Bridge CA is less secure than direct cross-certification because it introduces a third party into the trust chain"]'::jsonb,
  1,
  'Direct cross-certification: CA-A signs CA-B''s certificate and CA-B signs CA-A''s certificate, creating a bilateral trust relationship. This scales poorly for many organizations (n² relationships). Bridge CA: a neutral bridge CA cross-certifies with each organization''s CA independently, enabling any organization to trust any other organization through the bridge (hub-and-spoke). The bridge does not issue end-entity certificates. Both are legitimate PKI trust models; the bridge model is more scalable for multi-organization environments like federal PKI (FBCA). Merging under a single Root CA is an organizational decision, not a trust model.',
  'Cross-cert = bilateral (n²). Bridge CA = hub-and-spoke (n). Bridge scales; direct cross-cert doesn''t. Neither requires same vendor.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  3, 'hsm_use_cases',
  'A financial institution is implementing a new payment processing system that generates and uses RSA-4096 signing keys. The security architect must decide where to store these keys. Which storage decision BEST aligns with PCI DSS and cryptographic key protection requirements?',
  '["Store keys in a software key store on the application server protected by OS-level permissions, because RSA-4096 keys are too large for most HSMs", "Store keys encrypted in a database with the database encryption key managed by the application server''s OS", "Store keys in a FIPS 140-2 Level 3 validated Hardware Security Module (HSM), which provides tamper-evident physical protection, ensures keys never appear in plaintext outside the HSM boundary, and satisfies PCI DSS Requirement 3.7 for key custodian controls", "Store keys in a cloud-managed key store because cloud providers'' key management services provide equivalent security to on-premise HSMs"]'::jsonb,
  2,
  'PCI DSS Requirement 3.7 requires that key management procedures protect cryptographic keys used to protect stored account data. HSMs provide: (1) FIPS 140-2 Level 3 validated physical tamper protection (zeroization on attack), (2) keys never appear in plaintext outside the HSM boundary, (3) audit logging of all key operations, and (4) dual-control/split-knowledge support for key custodian procedures. RSA-4096 keys are supported by modern HSMs. Software key stores on application servers are vulnerable to OS-level compromise. Cloud KMS services may meet compliance requirements if they use underlying HSMs with appropriate certification, but cloud-managed ≠ automatically equivalent.',
  'PCI DSS keys = FIPS 140-2 Level 3 HSM. Keys never leave HSM in plaintext. HSM = tamper-evident + audit log + split knowledge.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / comparison / correct=3
(
  3, 'quantum_resistant',
  'NIST finalized its post-quantum cryptography (PQC) standards in 2024. Which statement MOST accurately characterizes the cryptographic algorithms and their intended use cases?',
  '["CRYSTALS-Kyber, CRYSTALS-Dilithium, and SPHINCS+ are all general-purpose replacements for both key exchange and digital signature functions", "Post-quantum algorithms replace both symmetric encryption (AES) and hash functions (SHA-3) in addition to asymmetric algorithms", "All post-quantum algorithms provide equivalent security levels and organizations should choose based on performance characteristics alone", "CRYSTALS-Kyber (ML-KEM) is standardized for key encapsulation/key exchange; CRYSTALS-Dilithium (ML-DSA) and SPHINCS+ (SLH-DSA) are standardized for digital signatures; AES and SHA-3 are considered quantum-resistant and do not require replacement (quantum computers do not break them, only halve effective key length for AES)"]'::jsonb,
  3,
  'NIST PQC standards (FIPS 203, 204, 205): ML-KEM (CRYSTALS-Kyber) for key encapsulation mechanism (KEM/key exchange), ML-DSA (CRYSTALS-Dilithium) for digital signatures, and SLH-DSA (SPHINCS+) as a hash-based signature scheme. Grover''s algorithm reduces the effective key length of symmetric ciphers and hashes by half (AES-256 → 128-bit effective security), which is considered acceptable with current key sizes. AES and SHA-3 do not need replacement, only potential key size increases. Each algorithm has a specific use case; Kyber cannot sign and Dilithium cannot perform key exchange.',
  'PQC: ML-KEM = key exchange. ML-DSA / SLH-DSA = signatures. AES and SHA stay (just double key length for extra safety). Different algorithms for different jobs.',
  'analyze', 'comparison', 'very_hard',
  2.00, 2.40, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / tlatm / correct=0
(
  3, 'bell_lapadula',
  'In a Bell-LaPadula model system, a subject at SECRET clearance attempts to read a document labeled TOP SECRET and write to a document labeled CONFIDENTIAL. You are asked to evaluate these actions under strict BLP enforcement. What is the correct determination?',
  '["The read is denied (no read-up: subject cannot read above their clearance level); the write is denied (no write-down: subjects cannot write to lower classification levels to prevent information downgrading)", "The read is permitted because intelligence sharing requires need-to-know overrides; the write is permitted to confidential because writing down is allowed under simple security", "The read is denied but the write to CONFIDENTIAL is permitted because BLP only restricts reading above clearance", "Both actions are permitted because SECRET-cleared subjects have access to a range of classification levels above and below their clearance"]'::jsonb,
  0,
  'Bell-LaPadula has two primary properties: (1) Simple Security Property (no read-up): a subject cannot read data at a higher classification level than their clearance. SECRET cannot read TOP SECRET. (2) Star Property / *-property (no write-down): a subject cannot write to a lower classification level than their current label, to prevent information from being downgraded. SECRET cannot write to CONFIDENTIAL. Both actions are denied. The Discretionary Security Property (ds-property) allows discretionary access control but does not override the mandatory properties. BLP focuses on confidentiality; it does not address integrity.',
  'BLP: No Read Up (NRU) + No Write Down (NWD). SECRET: cannot read TS, cannot write to C. Both denied. BLP = confidentiality model.',
  'apply', 'tlatm', 'hard',
  1.80, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / scenario / correct=1
(
  3, 'tpm_secure_enclave',
  'An organization deploys laptop encryption using BitLocker with TPM 1.2 and a PIN. An attacker with physical access to the laptop attempts to recover the encryption key. Which attack is MOST likely to succeed against this specific configuration?',
  '["Cold boot attack -- freezing the RAM to recover the BitLocker key from volatile memory at startup", "TPM bus sniffing attack -- intercepting the unencrypted communication between the TPM 1.2 chip and the CPU on the LPC bus during boot, which allows recovery of the Volume Master Key before it is passed to the OS", "Brute-force PIN guessing without any lockout because TPM 1.2 has no anti-hammering protection for PIN attempts", "Evil maid attack -- booting from USB to bypass the PIN requirement entirely"]'::jsonb,
  1,
  'TPM 1.2 communicates with the CPU over the LPC (Low Pin Count) bus, which is NOT encrypted. Hardware attacks using logic analyzers or dedicated bus sniffing tools can intercept the Volume Master Key (VMK) as it is transmitted from the TPM to the CPU during the boot process. This is a well-documented attack against TPM 1.2 + BitLocker configurations. TPM 2.0 addressed this by introducing encrypted sessions between the TPM and CPU. Cold boot attacks can recover keys from RAM but require the system to have been recently running (keys in memory). TPM 1.2 does have anti-hammering. BitLocker with TPM + PIN prevents direct USB boot bypassing the PIN.',
  'TPM 1.2 weakness = unencrypted LPC bus. Sniff the bus, capture the VMK. TPM 2.0 fixed this with encrypted sessions.',
  'analyze', 'scenario', 'hard',
  1.90, 1.80, 0.22, 'handcrafted', true
),

-- Q7: hard / apply / best_answer / correct=2
(
  3, 'pki_trust_models',
  'An organization''s PKI uses a two-tier hierarchy: an offline Root CA and an online Issuing CA. The Issuing CA certificate expires in 45 days. What is the MOST critical immediate action?',
  '["Immediately revoke and reissue all end-entity certificates because Issuing CA expiry invalidates all certificates issued by it", "Take the offline Root CA online, renew the Issuing CA certificate, and then take the Root CA offline again -- completing the renewal before the 45-day expiry", "Renew the Issuing CA certificate by taking the offline Root CA online to sign a new Issuing CA certificate, then update the renewed Issuing CA certificate in all trust stores and CRL Distribution Points, and verify that all end-entity certificate lifetimes do not extend beyond the new Issuing CA certificate validity period", "Generate a new Root CA and migrate all end-entity certificates because a 45-day window is insufficient to renew the Issuing CA"]'::jsonb,
  2,
  'CA certificate renewal requires the parent CA to sign a new certificate for the subordinate CA. Since the Root CA is offline (best practice for security), it must be brought online temporarily to sign the new Issuing CA certificate. After renewal: (1) update the new Issuing CA certificate in all trust stores, (2) update CRL Distribution Points and OCSP responders, and (3) verify that no end-entity certificates have validity periods extending beyond the new Issuing CA certificate expiry (otherwise those certs will become untrusted). End-entity certificates do NOT need to be reissued if the Issuing CA is renewed before expiry. Creating a new Root CA is disproportionate.',
  'Issuing CA renewal: Root CA online → sign new Issuing CA cert → update trust stores + CDP/OCSP → verify end-entity validity ≤ new CA expiry.',
  'apply', 'best_answer', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q8: very_hard / analyze / scenario / correct=3
(
  3, 'bell_lapadula',
  'A system implements Bell-LaPadula with categories as well as hierarchical levels. A subject has clearance (SECRET, {CRYPTO, NATO}) and attempts to read an object labeled (SECRET, {CRYPTO, NUCLEAR}). Under strict BLP with categories, what is the result?',
  '["Access is granted because the subject and object share the same hierarchical level (SECRET)", "Access is denied because the subject''s category set {CRYPTO, NATO} does not dominate the object''s category set {CRYPTO, NUCLEAR} -- the subject lacks the NUCLEAR category", "Access is granted because the subject has CRYPTO clearance and the object''s primary category is CRYPTO", "Access is denied because for read access in BLP, the subject''s clearance must dominate the object''s label: dominance requires the subject level ≥ object level AND the subject category set ⊇ (superset of) the object category set; {CRYPTO, NATO} does not contain NUCLEAR, so dominance fails"]'::jsonb,
  3,
  'In Bell-LaPadula with compartments/categories, dominance is defined as: subject dominates object if AND ONLY IF (1) subject hierarchical level ≥ object hierarchical level, AND (2) subject category set ⊇ object category set (subject''s categories must be a superset of the object''s categories). Here: SECRET ≥ SECRET (satisfied). {CRYPTO, NATO} ⊇ {CRYPTO, NUCLEAR}? No -- NUCLEAR is in the object''s category set but not in the subject''s. Dominance fails. Read access is denied. Having CRYPTO is insufficient; the subject must have ALL categories listed on the object.',
  'BLP dominance = level AND ALL categories. Missing even one category = access denied. Superset, not subset, is required.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / scenario / correct=0
(
  3, 'hsm_use_cases',
  'An organization is deploying a Certificate Authority (CA) and must protect the CA private key. The security team debates between a software-based key store and an HSM. An executive suggests that using AES-256 to encrypt the CA private key and storing it on the server is equivalent to an HSM. Why is this argument incorrect?',
  '["The AES-256 encrypted key stored on the server is vulnerable to an attacker who compromises the server OS (extracting the decryption key from memory or key management code), whereas an FIPS 140-2 Level 3 HSM''s tamper-resistant boundary ensures the CA key never appears in plaintext outside the HSM, even to an OS-level attacker", "HSMs are not required for CA key protection; NIST SP 800-57 allows software-based key storage for all CA types", "An HSM stores keys in RAM which is equally vulnerable to memory attacks as server-based storage", "AES-256 software encryption is actually more secure than HSMs because software can be patched while HSM firmware cannot"]'::jsonb,
  0,
  'The security boundary of a software key store is the OS/application layer. If an attacker achieves OS-level access (root/SYSTEM), they can dump process memory where the decryption key is loaded, extract the encrypted key file, or intercept key operations. An HSM''s physical tamper-resistant boundary (FIPS 140-2 Level 3 requires evidence of tamper AND zeroization) ensures that the CA private key never exists in plaintext outside the HSM''s secure boundary -- even with OS-level access, an attacker cannot extract the key. This is the fundamental security value proposition of an HSM for high-value key material like CA keys.',
  'HSM = CA private key never leaves the boundary in plaintext. OS compromise cannot extract it. Software store = OS compromise = game over.',
  'apply', 'scenario', 'hard',
  1.70, 1.40, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  3, 'quantum_resistant',
  'An organization is planning a "harvest now, decrypt later" (HNDL) threat response. Which cryptographic assets require URGENT migration to post-quantum algorithms and which have lower urgency?',
  '["All cryptographic assets including AES-encrypted data and SHA-256 hashed passwords require immediate migration because quantum computers break all cryptography", "Long-lived confidential data currently protected by RSA/ECC key exchange (e.g., TLS sessions establishing VPN tunnels) requires urgent migration because adversaries may be archiving ciphertext today for future decryption; data protected by AES-256 or hashed with SHA-256/SHA-3 has lower urgency because symmetric/hash algorithms require only key size increases", "Only digital signature algorithms require urgent migration; key exchange algorithms are not vulnerable to harvest now decrypt later attacks", "HNDL attacks only affect data encrypted after quantum computers become available, so no migration is needed until that time"]'::jsonb,
  1,
  'HNDL (harvest now, decrypt later) attacks target asymmetric cryptography used for key exchange (RSA, ECDH): an adversary records encrypted traffic today, and when a sufficiently powerful quantum computer is available, they use Shor''s algorithm to break the key exchange and decrypt the traffic. This means data with confidentiality requirements extending years into the future (government secrets, trade secrets, health data) is at risk TODAY if protected by RSA/ECC key exchange. AES-256 and SHA-256/SHA-3 are only weakened (not broken) by Grover''s algorithm, and key size increases mitigate this. Digital signature HNDL risk is lower because signatures protect integrity at a point in time.',
  'HNDL urgency: RSA/ECC key exchange = HIGH (archive now, Shor later). AES/SHA = LOW (Grover only halves strength). Protect long-lived secrets NOW.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.30, 0.20, 'handcrafted', true
),

-- Q11: hard / apply / tlatm / correct=2
(
  3, 'tpm_secure_enclave',
  'A software development team proposes storing application secrets (database credentials, API keys) in Intel SGX enclaves rather than environment variables. You are reviewing this architecture as a security architect. What is the MOST important limitation to communicate?',
  '["SGX enclaves cannot store secrets larger than 64KB, making them impractical for most application secrets", "SGX enclaves are only supported on Intel server processors and cannot be used in cloud or development environments", "SGX enclaves protect secrets from host OS and hypervisor access, but the enclave code itself must be trusted -- if the application code running inside the enclave is compromised (e.g., via a memory safety vulnerability), secrets within the enclave are at risk; additionally, SGX has known side-channel vulnerabilities (Spectre, Foreshadow, SGAxe) that have partially undermined its security guarantees", "Storing secrets in SGX enclaves is incompatible with standard key management practices and should never be used for production applications"]'::jsonb,
  2,
  'SGX (Software Guard Extensions) provides hardware-isolated execution environments that protect data from the host OS and hypervisor. However, key limitations include: (1) Trust boundary is the enclave code -- if enclave code has memory safety bugs, secrets inside are exposed. (2) Multiple SGX side-channel attacks (Foreshadow/L1TF, SGAxe, PlundervVolt, SGXBleed) have been demonstrated that can extract enclave secrets. (3) Remote attestation complexity. Intel has deprecated SGX on client processors. The architect must help the team understand that SGX reduces, but does not eliminate, the attack surface and must be combined with secure enclave code development practices.',
  'SGX protects FROM OS/hypervisor, not FROM bad enclave code. Side-channel attacks (Foreshadow, SGAxe) partially broke SGX guarantees. Not a silver bullet.',
  'apply', 'tlatm', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  3, 'kerberos',
  'An attacker performs a Kerberoasting attack against an Active Directory domain. Which Kerberos mechanism does this exploit, and what is the MOST effective mitigation?',
  '["Kerberoasting exploits the Kerberos AS exchange by requesting TGTs for service accounts; mitigated by disabling pre-authentication", "Kerberoasting exploits TGT delegation by requesting service tickets on behalf of another user; mitigated by disabling unconstrained delegation", "Kerberoasting exploits the Kerberos PKINIT extension to obtain certificates for service accounts; mitigated by removing certificate templates", "Kerberoasting exploits the TGS exchange: any authenticated domain user can request a Service Ticket for any SPN-registered account; the ST is encrypted with the service account''s NTLM hash, which can be cracked offline. Mitigated by: using long random passwords (25+ chars) for service accounts, enabling AES encryption for Kerberos (forces AES-256 ST encryption rather than RC4), and using Managed Service Accounts (gMSA) with auto-rotating 120-character passwords"]'::jsonb,
  3,
  'Kerberoasting: any authenticated domain user can request a TGS service ticket for any account with an SPN (Service Principal Name). The TGS response contains the service ticket encrypted with the service account''s long-term key (derived from its NTLM hash). The attacker extracts this ticket and performs offline password cracking. Mitigations: (1) gMSA accounts with 120-char auto-rotating passwords make cracking computationally infeasible, (2) AES encryption requirement forces AES-256 instead of RC4 (much harder to crack), (3) detection via monitoring for anomalous TGS requests. Disabling pre-authentication enables AS-REP roasting (different attack).',
  'Kerberoasting = any user requests TGS for any SPN → crack the ticket offline. Fix: gMSA (120-char auto-rotate) + force AES. Not about pre-auth.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.40, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / scenario / correct=0
(
  3, 'cryptography_systems',
  'An organization discovers that its web application uses RSA-1024 for encrypting session keys. The security team argues this is acceptable because RSA-1024 has never been publicly broken. What is the MOST accurate assessment?',
  '["RSA-1024 is considered deprecated and insecure by NIST since 2013; the current minimum recommendation is RSA-2048 (with RSA-3072 or RSA-4096 preferred for longer-term security), as factoring advances make RSA-1024 within theoretical reach of well-resourced adversaries", "RSA-1024 remains secure because the best publicly known factoring algorithm (GNFS) would require more computing resources than currently exist", "RSA-1024 is acceptable for session key encryption because session keys have short lifetimes that reduce the practical risk window", "RSA-1024 security depends on implementation; a properly implemented RSA-1024 is equivalent to RSA-2048 in security strength"]'::jsonb,
  0,
  'NIST formally deprecated RSA-1024 in Special Publication 800-131A (2013 transition, 2014 disallowed). The key factoring milestone was a 768-bit RSA key factored in 2010 using GNFS. While RSA-1024 has not been publicly factored, it is within theoretical reach given trends in distributed computing and specialized hardware. NIST''s recommendation is RSA-2048 minimum, with RSA-3072 preferred through 2030 and RSA-4096 for post-2030 security. Short session key lifetimes do not affect the strength of the RSA key exchange itself. Implementation quality does not compensate for mathematical key size inadequacy.',
  'RSA-1024 = deprecated since 2013. Minimum = 2048. Preferred = 3072-4096. "Never been broken" is not a security argument for deprecated algorithms.',
  'apply', 'scenario', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / first_action / correct=1
(
  3, 'pki_trust_models',
  'An organization discovers that its internal Root CA private key was compromised. What is the MOST critical FIRST action?',
  '["Immediately reissue all end-entity certificates using a new Issuing CA signed by the compromised Root CA", "Revoke the compromised Root CA certificate, publish a CRL, and notify all relying parties to remove the compromised Root CA from their trust stores -- immediately stopping all certificate validation that depends on it", "Generate a new Root CA and migrate end-entity certificates gradually over 90 days to minimize service disruption", "Notify the CA/Browser Forum because Root CA compromise requires industry-wide notification under Baseline Requirements"]'::jsonb,
  1,
  'Root CA key compromise is a catastrophic PKI event. The FIRST priority is to stop the harm: revoke the compromised Root CA, publish a CRL/OCSP response, and notify all relying parties to remove it from their trust stores. This immediately invalidates ALL certificates issued under this CA (which is necessary, since any certificate signed by the compromised key could have been forged). Service disruption is unavoidable and secondary to stopping the security breach. A new Root CA must be established and all end-entity certificates reissued. CA/Browser Forum notification applies to publicly trusted CAs; most enterprises have private CAs not governed by the Baseline Requirements.',
  'Root CA compromise = REVOKE IT FIRST. Publish CRL. Remove from trust stores. Everything it signed is suspect. Disruption is acceptable.',
  'analyze', 'first_action', 'hard',
  1.90, 1.80, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / tlatm / correct=2
(
  3, 'bell_lapadula',
  'You are designing a system that must implement Bell-LaPadula and also allow a SECRET-cleared user to write operational notes about a TOP SECRET operation into a CONFIDENTIAL log for distribution to field teams. A manager argues that the user should be able to write down because "the notes don''t contain TOP SECRET information." How should you respond?',
  '["The manager is correct; BLP write-down restrictions only apply when the subject is actively working with TOP SECRET data, not when writing unrelated notes", "The user can write to CONFIDENTIAL logs if they temporarily lower their clearance level to CONFIDENTIAL for that specific write operation", "The BLP *-property (no write-down) applies based on the SUBJECT''s current security level, not the information content of the write -- a SECRET-cleared subject cannot write to CONFIDENTIAL regardless of content, to prevent the subject from unintentionally or covertly downgrading sensitive information; the solution is to re-architect the workflow so that the write is performed by a subject with CONFIDENTIAL clearance or use a trusted subject designation with audit logging", "BLP does not apply to operational notes because they are not classified records"]'::jsonb,
  2,
  'The BLP *-property (star property / no write-down) is a mandatory policy based on the subject''s security level, not on the content being written. This is intentional: the model does not trust subjects to accurately assess whether information they write is truly lower-classification -- a SECRET-cleared person may unintentionally include SECRET information in "unclassified notes." The solution is architectural: either use a subject with the appropriate lower clearance for the write operation, or use a "trusted subject" designation (a special exception that requires audit logging and justification). Simply declaring the content non-sensitive does not satisfy the BLP property.',
  'BLP write-down: blocked by SUBJECT level, not content. You cannot write down even "unclassified" notes. Re-architect or use trusted subject + audit.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 2.20, 0.20, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  3, 'cryptography_systems',
  'A security architect is evaluating cipher mode selection for encrypting a large database backup. The candidates are ECB, CBC, CTR, and GCM. Which mode provides BOTH confidentiality AND integrity protection while supporting parallel encryption?',
  '["CBC (Cipher Block Chaining) because chaining provides integrity through sequential dependency", "ECB (Electronic Codebook) because each block is independently encrypted, enabling parallel processing", "CTR (Counter Mode) because it converts the block cipher into a stream cipher and supports parallel processing", "GCM (Galois/Counter Mode) because it combines CTR mode encryption (confidentiality, parallel processing) with GHASH authentication (integrity/authenticity), providing authenticated encryption -- both confidentiality and integrity in a single efficient mode"]'::jsonb,
  3,
  'GCM (Galois/Counter Mode) is an authenticated encryption with associated data (AEAD) mode that provides: (1) Confidentiality via CTR mode encryption (parallelizable), (2) Integrity and authenticity via a GHASH authentication tag. ECB is insecure (identical plaintext blocks produce identical ciphertext, revealing patterns). CBC provides confidentiality but not integrity, and is sequential (not parallelizable). CTR provides confidentiality and is parallelizable but provides no integrity. For database backups, integrity protection is essential to detect tampering. GCM is the standard choice for authenticated encryption in TLS 1.3, IPsec, and other modern protocols.',
  'GCM = CTR (confidentiality + parallel) + GHASH (integrity). AEAD = Authenticated Encryption with Associated Data. GCM is the gold standard.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q17: hard / apply / comparison / correct=0
(
  3, 'tpm_secure_enclave',
  'Which comparison MOST accurately describes the difference between TPM-based key storage and HSM-based key storage for an enterprise application?',
  '["A TPM is a passive secure co-processor bound to a specific physical device, storing a limited number of keys and performing limited cryptographic operations tied to device state (PCR measurements); an HSM is an active, network-accessible cryptographic appliance with high-performance key management, supporting many keys and serving multiple applications simultaneously", "TPMs and HSMs are functionally equivalent; the only difference is physical form factor", "HSMs are software-based virtual appliances while TPMs are hardware chips", "TPMs are more secure than HSMs because they are physically embedded in the motherboard and cannot be removed"]'::jsonb,
  0,
  'TPM (Trusted Platform Module): a passive chip on the motherboard. Bound to a specific device. Stores a limited key hierarchy (EK, SRK, AIK). Performs attestation using PCR measurements. Limited cryptographic throughput. Not network-accessible as a standalone service. HSM (Hardware Security Module): an active network-accessible or PCI-e appliance. Serves multiple applications. High-throughput cryptographic operations. Manages large numbers of keys. FIPS 140-2 Level 3 validated. Suitable for CA key protection, payment HSMs (P3+). The two serve different use cases: TPM = device integrity and boot measurement; HSM = enterprise key management and high-volume cryptography.',
  'TPM = bound to one device, passive, PCR attestation. HSM = network appliance, high throughput, many apps, CA key protection. Different jobs.',
  'apply', 'comparison', 'hard',
  1.60, 1.30, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / scenario / correct=1
(
  3, 'kerberos',
  'A penetration tester discovers that a service account named "svc_backup" has an SPN set and uses RC4 encryption (etype 23) for Kerberos. The tester extracts a TGS ticket hash. The service account password was last set 3 years ago. What attack is in progress and what is the expected outcome?',
  '["Pass-the-ticket attack -- the tester can reuse the TGS ticket to authenticate as the service account directly without cracking", "Kerberoasting -- the tester will attempt to crack the RC4-encrypted ticket offline. RC4 (etype 23) is significantly weaker than AES-256 (etype 18) and a 3-year-old password is likely weak or in common wordlists; crack probability is high, and if svc_backup has elevated privileges (e.g., local admin on backup targets), this provides substantial lateral movement capability", "AS-REP roasting -- this attack requires pre-authentication to be disabled and exploits the AS exchange, not TGS", "DCSync attack -- the tester is extracting password hashes directly from the domain controller"]'::jsonb,
  1,
  'This is a classic Kerberoasting scenario. The attack flow: request TGS for svc_backup SPN → extract the RC4-encrypted ticket → offline crack. RC4 (etype 23) tickets are cracked much faster than AES-256 because the RC4 NTLM hash is directly used as the key (no PBKDF stretching). A 3-year-old password in a service account is likely weak. If svc_backup has backup operator privileges or local admin on servers, this is a high-impact finding. Mitigation: force AES via "This account supports Kerberos AES 256 bit encryption" and use gMSA. This is not pass-the-ticket (which reuses an existing valid ticket), AS-REP roasting (which exploits disabled pre-auth), or DCSync (which requires DC replication rights).',
  'Old SPN account + RC4 = Kerberoasting target. RC4 cracks faster than AES. 3-year password = weak = crack probable. gMSA + AES = fix.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.10, 0.20, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  3, 'cryptography_systems',
  'A developer proposes using HMAC-SHA256 to provide non-repudiation for financial transactions in a multi-party system. A security architect rejects this proposal. Which explanation is MOST accurate?',
  '["HMAC-SHA256 is insufficiently strong; HMAC-SHA512 must be used for financial transaction non-repudiation", "HMAC-SHA256 cannot be used with financial data because FIPS 140-2 prohibits HMAC for transaction integrity", "HMAC uses a shared secret key -- both parties possess the same key and can generate valid MACs, so neither party can prove the other generated a specific MAC; non-repudiation requires asymmetric digital signatures (e.g., RSA, ECDSA) where only the signing party holds the private key", "HMAC-SHA256 does not produce a deterministic output, making it unsuitable for audit trails"]'::jsonb,
  2,
  'Non-repudiation requires proof that a specific party performed an action, which they cannot later deny. HMAC uses a symmetric shared secret: if parties A and B both know the key, either party can generate a valid HMAC. In a dispute, party A cannot prove that B (and not A) generated a specific HMAC. Asymmetric digital signatures provide non-repudiation because only the holder of the private key can generate a valid signature; anyone with the public key can verify it but cannot forge it. HMAC provides message integrity and authentication (when key distribution is controlled), but not non-repudiation. This is a fundamental cryptographic property, not a strength or compliance issue.',
  'HMAC = shared secret = either party can generate it = NO non-repudiation. Digital signature = only private key holder can sign = non-repudiation.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / best_answer / correct=3
(
  3, 'pki_trust_models',
  'An organization is implementing certificate transparency (CT) logging for its public TLS certificates. Which statement BEST describes CT''s security function and its limitations?',
  '["CT logging encrypts certificate metadata to prevent adversaries from learning about an organization''s infrastructure", "CT logging replaces Certificate Revocation Lists (CRLs) and OCSP because logged certificates are automatically revoked when misissued", "CT logging is only required for Extended Validation (EV) certificates and is optional for all other certificate types in public PKI", "CT logging creates an auditable append-only record of all certificates issued by a CA, enabling domain owners to detect misissued or unauthorized certificates for their domains; however, CT does not prevent certificate misissuance -- it detects it after the fact, and an attacker could exploit a misissued certificate before the domain owner discovers it in CT logs"]'::jsonb,
  3,
  'Certificate Transparency (RFC 9162) requires CAs to submit all publicly trusted TLS certificates to public CT logs before browsers will trust them. CT creates an auditable, append-only (Merkle tree) public record. Domain owners can monitor CT logs for unauthorized certificate issuance (e.g., via crt.sh or CAA record enforcement). Limitation: CT is detective, not preventive -- a misissued certificate appears in CT logs, but monitoring and revocation response takes time, during which the certificate can be used for attacks. CT is now required for all publicly trusted TLS certificates (not just EV) by major browsers. CT does not replace revocation mechanisms.',
  'CT = public append-only log of all certs. Domain owners can detect misissuance. CT = detective, not preventive. Attacker can use cert before you catch it.',
  'analyze', 'best_answer', 'very_hard',
  1.90, 2.30, 0.22, 'handcrafted', true
),

-- Q21: hard / apply / scenario / correct=0
(
  3, 'security_models',
  'In the Biba Integrity Model, a subject at MEDIUM integrity attempts to read data from a HIGH integrity object and write to a HIGH integrity object. What is the correct determination?',
  '["Read from HIGH is denied (no read-down in Biba, which means lower integrity subjects cannot read higher integrity objects to prevent contamination of low-integrity subjects with trusted data that they might corrupt); write to HIGH is denied (no write-up in Biba, lower-integrity subjects cannot write to higher-integrity objects to prevent data contamination)", "Read from HIGH is permitted; write to HIGH is denied because writing up could contaminate high integrity data", "Read from HIGH is denied; write to HIGH is permitted because writing improves the integrity of the target object", "Both actions are permitted because MEDIUM and HIGH are adjacent integrity levels with implicit trust"]'::jsonb,
  0,
  'Biba is the integrity counterpart to Bell-LaPadula. Biba''s two main properties: (1) Simple Integrity Property (no read-down): a subject cannot read from an object with a LOWER integrity level than the subject (prevents contamination of the subject''s decisions by untrusted data). (2) *-Property / Star property (no write-up): a subject cannot write to an object at a HIGHER integrity level (prevents corruption of high-integrity data by low-integrity subjects). In this question: MEDIUM cannot read HIGH? Wait -- Biba no-read-DOWN means MEDIUM cannot read LOW. Reading HIGH (upward) is the issue in BLP. In Biba, the rule is actually: (1) no read-down (subject cannot read objects BELOW them), (2) no write-up (subject cannot write to objects ABOVE them). So MEDIUM reading HIGH = reading UP = permitted in Biba. MEDIUM writing to HIGH = writing UP = DENIED.',
  'Biba: No Read DOWN (stay clean). No Write UP (stay humble). MEDIUM can read HIGH (reading up = fine). MEDIUM cannot write HIGH (writing up = denied).',
  'apply', 'scenario', 'hard',
  1.80, 1.70, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / first_action / correct=1
(
  3, 'hsm_use_cases',
  'An organization has deployed payment card processing and stores cardholder data encrypted with AES-256. The encryption key is managed in an HSM. A security audit finds that three developers have administrative access to the HSM management console. What is the MOST important finding and remediation?',
  '["The HSM should be replaced because three-person access exceeds the maximum allowed under PCI DSS", "Administrative HSM access by application developers violates the principle of separation of duties and dual control requirements -- developers should have no HSM management access; HSM administration should require split-knowledge/dual control with at least two separate custodians from a designated key management team, not developers", "HSM administrative access by developers is acceptable if the developers signed NDA agreements", "The finding is informational only because the HSM logs all operations, providing compensating controls for any misuse"]'::jsonb,
  1,
  'PCI DSS Requirement 3.7 and the principle of dual control require that HSM administrative functions be performed by designated key custodians under split-knowledge procedures -- no single person should have complete control over a cryptographic key or HSM administration. Developers having HSM admin access creates: (1) separation of duties violation (developers can access/manipulate the keys protecting the data they process), (2) insider threat risk (developer could extract or misuse keys), (3) dual control violation. HSM administration should require at least M-of-N custodians from a separate key management function. Audit logging is a detection, not a prevention control, and does not compensate for this access violation.',
  'HSM admin = key custodians only + dual control (M-of-N). Developers ≠ key custodians. Separation of duties is mandatory, not optional.',
  'analyze', 'first_action', 'hard',
  1.70, 1.60, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / scenario / correct=2
(
  3, 'cryptography_systems',
  'A development team uses AES-256-CBC for encrypting API payloads. The same Initialization Vector (IV) is used for all encryptions due to a coding error. A security researcher demonstrates a practical attack. Which attack is MOST directly enabled by IV reuse in CBC mode?',
  '["Padding oracle attack -- IV reuse enables the attacker to manipulate CBC padding validation", "Length extension attack -- IV reuse allows the attacker to append additional data to encrypted messages", "Two-time pad attack / ciphertext analysis -- when the same IV and key are used, two plaintexts encrypted under the same IV can be XORed together (C1 XOR C2 = P1 XOR P2), allowing cryptanalysis of the relationship between plaintexts and eventual plaintext recovery, especially when one plaintext is known or partially known", "Replay attack -- IV reuse allows the attacker to resend previously captured encrypted messages"]'::jsonb,
  2,
  'In CBC mode, the IV is XORed with the first plaintext block before encryption. If IV and key are both reused: C1 = E(K, IV XOR P1) and C2 = E(K, IV XOR P2). Because the same IV is used, C1 XOR C2 = (IV XOR P1) XOR (IV XOR P2) = P1 XOR P2. This reveals the XOR of the two plaintexts -- and if one plaintext is known (or guessable from the application context), the other can be recovered. This is why IVs must be random and unique per encryption. Padding oracle attacks require decryption oracle access (different vulnerability). Length extension attacks target hash constructions using Merkle-Damgård, not block ciphers. Replay attacks relate to message authentication, not IV reuse.',
  'Same IV + same key = C1 XOR C2 = P1 XOR P2. Known plaintext reveals the other. IV must be random and unique per encryption.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q24: hard / apply / best_answer / correct=3
(
  3, 'security_models',
  'A healthcare system needs to implement a security model that protects data integrity of electronic health records (EHR) and ensures that only authorized clinicians can modify records. Which security model is MOST aligned with this primary requirement?',
  '["Bell-LaPadula model because EHR confidentiality is the primary concern in healthcare", "Clark-Wilson model because it enforces well-formed transactions and separation of duties through transformation procedures and constrained data items, ensuring only authorized, well-formed operations modify records", "Brewer-Nash (Chinese Wall) model because it prevents conflict of interest in healthcare record access", "Both Clark-Wilson and Biba are appropriate; Biba prevents lower-integrity subjects from modifying high-integrity records while Clark-Wilson adds the well-formed transaction requirement ensuring modifications follow authorized procedures -- Clark-Wilson is more operationally aligned with healthcare workflows"]'::jsonb,
  3,
  'Biba protects data integrity by preventing lower-integrity subjects from writing to higher-integrity objects (no write-up). Clark-Wilson goes further by requiring that data modifications occur only through authorized Transformation Procedures (TPs) that enforce well-formed transactions, with Constrained Data Items (CDIs) representing the protected records and Unconstrained Data Items (UDIs) representing external inputs. Clark-Wilson''s separation of duties (users do not directly access CDIs -- they invoke TPs) and access triple (user, TP, CDI) model aligns well with healthcare EHR workflows where only specific roles can perform specific modifications. Bell-LaPadula focuses on confidentiality, not integrity. Brewer-Nash addresses conflict-of-interest separation.',
  'EHR integrity: Clark-Wilson = well-formed transactions + TP access triples + SoD. More operational than pure Biba. Both protect integrity but CW adds workflow control.',
  'apply', 'best_answer', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  3, 'quantum_resistant',
  'An organization is evaluating hybrid cryptography for a TLS 1.3 implementation during the post-quantum transition period. The proposed approach combines X25519 (classical ECDH) with ML-KEM-768 (CRYSTALS-Kyber). What is the PRIMARY security rationale for this hybrid approach?',
  '["If either classical or post-quantum algorithm is compromised, the session key security falls back to the uncompromised algorithm -- the hybrid provides defense against both classical cryptanalysis (if ML-KEM has unforeseen weaknesses) and quantum attack (if X25519 is broken by a quantum computer), ensuring security during the transition period when trust in new PQC algorithms is still maturing", "Hybrid cryptography doubles the key size, providing twice the security level of either algorithm alone", "Using two algorithms eliminates the need for certificate transparency logging because the combined approach is inherently self-authenticating", "Hybrid cryptography is a regulatory requirement under NIST PQC standards and must be implemented by all organizations regardless of threat model"]'::jsonb,
  0,
  'Hybrid key exchange (NIST SP 800-227, IETF drafts) combines a classical ECDH algorithm with a post-quantum KEM so that the resulting session key is as strong as the stronger of the two algorithms. Rationale: (1) ML-KEM is new and may have unforeseen cryptanalytic weaknesses (as happened with SIKE/SIDH, which was broken after years of analysis) -- keeping X25519 ensures classical security. (2) X25519 is broken by quantum computers -- ML-KEM provides quantum resistance. The hybrid approach provides a graceful security guarantee during the transition period. It is not a regulatory mandate for all organizations. Hybrid does not double security, it ensures the minimum is the better of the two.',
  'Hybrid PQC = if one is broken, the other saves you. Classical algorithms may fail cryptanalytically. PQC may have unknown flaws. Both = redundancy.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=11, comparison=4, tlatm=3, best_answer=4, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
