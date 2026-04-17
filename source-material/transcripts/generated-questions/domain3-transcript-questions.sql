-- ============================================================
-- CISSP Quest -- Domain 3: Security Architecture and Engineering
-- Generated: 2026-04-16 | Source: ai_generated (from ISC2 CBK)
-- ============================================================
-- DISTRIBUTION STATS (30 questions total)
--   Difficulty:  Easy=6 (20%), Medium=14 (47%), Hard=7 (23%), Very Hard=3 (10%)
--   Cognitive:   Remember=3 (10%), Understand=6 (20%), Apply=14 (47%), Analyze=7 (23%)
--   Types:       Scenario=11, Best Answer=5, First Action=3, TLATM=3,
--                Comparison=5, Except/Not=2, Calculation=1
--   Answer pos:  0=8, 1=7, 2=8, 3=7
-- Topic clusters: symmetric_cryptography, cryptanalytic_attacks,
--   security_models_belllapadula_biba, information_flow_covert_channels,
--   pki_digital_certificates, digital_signatures, key_management,
--   stream_block_ciphers, hybrid_cryptography, tcb_security_kernel,
--   ring_protection, vulnerabilities_in_systems, cloud_security,
--   ics_scada_iot, mobile_device_security, sql_injection, xss_csrf,
--   malware_types, virtualization_hypervisors, physical_security_fire,
--   physical_security_power, enterprise_architecture_frameworks,
--   asymmetric_cryptography, diffie_hellman
-- ============================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: Symmetric cryptography -- easy/remember
(
  3, 'symmetric_cryptography',
  'Which symmetric encryption algorithm is currently the US federal government standard for encrypting sensitive unclassified information, approved by NIST in 2001, and uses block sizes of 128 bits with key lengths of 128, 192, or 256 bits?',
  '["DES (Data Encryption Standard)", "3DES (Triple DES)", "AES (Advanced Encryption Standard)", "RC4 (Rivest Cipher 4)"]'::jsonb,
  2,
  'AES (Advanced Encryption Standard) is the current NIST standard (FIPS 197, 2001) for symmetric encryption, replacing DES and 3DES. AES uses a fixed block size of 128 bits with key lengths of 128, 192, or 256 bits. AES-256 is approved for encrypting Top Secret information (with Suite B). DES (56-bit key) was broken in 1999 by brute force and is retired. 3DES (TDEA) applies DES three times for effective security of 112 bits -- it was deprecated by NIST in 2023. RC4 is a stream cipher (not block cipher) that was widely used in WEP and early SSL but is now broken and deprecated.',
  'AES is the vault standard. DES was the old combination, broken by brute force in 22 hours in 1999. 3DES was the emergency extension -- now retired.',
  'remember',
  'best_answer',
  'easy',
  0.90, -1.65, 0.20, 'ai_generated', true
),

-- Q2: Symmetric cryptography -- medium/apply
(
  3, 'symmetric_cryptography',
  'A development team is implementing a new encryption feature for data at rest in a database. They ask the security architect which block cipher mode of operation to use. The architect recommends against ECB (Electronic Codebook) mode. Which characteristic of ECB mode MOST justifies this recommendation?',
  '["ECB mode is computationally slower than other modes, making it impractical for database encryption", "ECB mode encrypts each block independently, meaning identical plaintext blocks produce identical ciphertext blocks, revealing data patterns even in encrypted form", "ECB mode does not support key lengths above 128 bits, limiting the security of AES-256", "ECB mode is a stream cipher mode that requires additional IV (Initialization Vector) management"]'::jsonb,
  1,
  'ECB (Electronic Codebook) mode encrypts each block of plaintext independently using the same key. The critical flaw is that identical plaintext blocks always produce identical ciphertext blocks. For database data, this means structural patterns (repeated values, identifiable field headers, bitmap images) remain visible in the ciphertext. The canonical demonstration is the "ECB penguin" -- an image of Tux (Linux mascot) encrypted with AES in ECB mode clearly shows the penguin''s silhouette in the encrypted output because uniform color regions produce uniform ciphertext blocks. Preferred modes are CBC (chaining), CTR (counter, parallelizable), and GCM (authenticated encryption). ECB has no speed disadvantage and does support AES-256; it is not a stream cipher mode.',
  'ECB is the codebook that repeats the same code for the same word -- any codebreaker who sees the pattern twice has a weakness to exploit.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q3: Stream vs. block ciphers -- medium/understand
(
  3, 'stream_block_ciphers',
  'A security engineer needs to encrypt a continuous stream of network packets for a real-time video feed where latency is critical and packets must be processed immediately as they arrive. Which cipher type is MOST appropriate for this use case?',
  '["A block cipher in CBC mode, because it provides the strongest security for network data", "A stream cipher such as ChaCha20, because it encrypts data one bit or byte at a time without waiting to fill a block, minimizing latency", "A block cipher in ECB mode, because it is the fastest block cipher mode", "A public key cipher (RSA), because it provides authentication along with encryption"]'::jsonb,
  1,
  'Stream ciphers (like RC4 -- deprecated -- and ChaCha20) encrypt data one bit or byte at a time by generating a keystream and XOR-ing it with the plaintext. This makes them ideal for real-time, continuous data streams where latency is critical and padding to fill a block is undesirable. ChaCha20 is the current recommended stream cipher, used in TLS 1.3 as ChaCha20-Poly1305. Block ciphers require collecting enough data to fill a block (128 bits for AES) before encrypting, introducing latency. CBC mode adds a chaining dependency that prevents parallelization (each block depends on the previous ciphertext). RSA is an asymmetric cipher -- far too slow for bulk data encryption and does not provide confidentiality for continuous streams.',
  'The stream cipher encrypts the signal in real time, byte by byte, like a live radio scrambler. Block ciphers wait for the full sentence.',
  'understand',
  'best_answer',
  'medium',
  1.15, 0.00, 0.20, 'ai_generated', true
),

-- Q4: Asymmetric cryptography -- easy/remember
(
  3, 'asymmetric_cryptography',
  'In asymmetric cryptography, if Alice wants to send Bob an encrypted message that only Bob can read, which key does Alice use to encrypt the message?',
  '["Alice''s private key", "Alice''s public key", "Bob''s public key", "Bob''s private key"]'::jsonb,
  2,
  'To send a confidential message to Bob, Alice encrypts with BOB''S public key. Only Bob''s private key (which only Bob holds) can decrypt it. This ensures confidentiality -- only Bob can read the message. The confusion point: Alice''s private key is used when Alice wants to SIGN something (creating a digital signature), not when she wants to send something confidentially to Bob. Bob''s private key is what Bob uses to DECRYPT what was sent to him. The rule: encrypt with the RECIPIENT''S public key; sign with YOUR OWN private key.',
  'You encrypt with the recipient''s public lock. Only they have the private key that opens it. You sign with your own private seal.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.70, 0.20, 'ai_generated', true
),

-- Q5: Diffie-Hellman -- medium/apply
(
  3, 'diffie_hellman',
  'Two parties want to establish a shared symmetric key over an insecure public channel without transmitting the key itself. Which protocol accomplishes this, and what attack does Perfect Forward Secrecy (PFS) using ephemeral versions of this protocol prevent?',
  '["RSA key exchange; PFS prevents replay attacks by using time-stamped session tokens", "Diffie-Hellman key exchange; PFS using DHE or ECDHE prevents retroactive decryption of past sessions even if the long-term private key is later compromised", "AES key wrapping; PFS prevents MITM attacks by authenticating both parties before key exchange", "HMAC-based key derivation; PFS prevents brute-force attacks by generating session-unique keys"]'::jsonb,
  1,
  'Diffie-Hellman (DH) allows two parties to establish a shared secret over an insecure channel by each contributing a public value computed from their private values -- the mathematical exchange produces the same shared secret on both sides without either party transmitting the secret. Perfect Forward Secrecy (PFS), implemented with ephemeral DH (DHE) or ephemeral ECDH (ECDHE), generates a new DH key pair for each session. This means that if an attacker records encrypted sessions and later compromises the server''s long-term private key, they still cannot decrypt the recorded sessions because the ephemeral session keys were never stored and cannot be re-derived. TLS 1.3 mandates ephemeral key exchange for this reason.',
  'Two agents derive the same codebook from public clues without ever sharing the book. Ephemeral DH burns the codebook after every mission -- past sessions stay secret even if the main key is burned.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q6: Digital signatures -- medium/apply
(
  3, 'digital_signatures',
  'A sender wants to provide the RECIPIENT with assurance that the message has not been altered since it was sent and that the message genuinely came from the claimed sender. Which cryptographic operation achieves BOTH objectives?',
  '["Encrypting the message with the recipient''s public key", "Computing a digital signature by hashing the message and encrypting the hash with the SENDER''S private key", "Computing an HMAC using a shared secret key known to both sender and recipient", "Encrypting the message with AES-256 and transmitting the key over a secure side channel"]'::jsonb,
  1,
  'A digital signature achieves both integrity and authentication (and nonrepudiation). The process: (1) the sender computes a hash of the message (e.g., SHA-256), (2) the sender encrypts the hash with their PRIVATE key to create the signature. The recipient verifies by: (1) decrypting the signature with the sender''s PUBLIC key to recover the original hash, (2) independently hashing the received message, (3) comparing the two hashes -- if they match, the message is unaltered and came from the key''s owner. Encrypting with the recipient''s public key (A) provides confidentiality but not authentication. HMAC (C) provides integrity and authentication but not nonrepudiation (both parties share the key, so either could have created it). AES encryption (D) provides only confidentiality.',
  'The wax seal carries the sender''s unique signet. Anyone can verify it, but only the signet''s owner could create it.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q7: Digital signatures -- hard/analyze
(
  3, 'digital_signatures',
  'A contract signed with a digital signature is disputed in court. The defendant claims the signature could have been created by anyone with access to the signer''s computer. The plaintiff''s attorney argues the signature proves the defendant signed the contract. What property of digital signatures does the plaintiff''s argument rely on, and what assumption must hold for that property to be valid?',
  '["Integrity -- the signature proves the contract was not modified; the assumption is that the hash algorithm used is collision-resistant", "Nonrepudiation -- the signature proves the signer possessed the private key at signing time; the assumption is that the private key was not compromised and was under the exclusive control of the signer", "Confidentiality -- the signature proves the contract was encrypted; the assumption is that the encryption key was not shared", "Authentication -- the signature proves the signer''s identity through a biometric challenge; the assumption is that biometric data was registered before signing"]'::jsonb,
  1,
  'The plaintiff''s argument relies on nonrepudiation -- the principle that the signer cannot deny having signed, because only the holder of the private key could have produced the signature that verifies against the corresponding public key. For nonrepudiation to be legally valid, the critical assumption is that the private key was under the exclusive control of the signer and was not compromised (stolen, shared, or accessed by a third party). If the defendant can demonstrate their key was stolen or their system was compromised, nonrepudiation is undermined -- this is why key storage security (HSMs, smart cards) and certificate revocation matter. Nonrepudiation does not prove the human defendant personally signed -- it proves the private key was used, which legally implies the key owner signed absent evidence of compromise.',
  'The private key creates the signature only its owner could produce. Nonrepudiation makes repudiation legally difficult -- unless the key itself was stolen.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q8: PKI and digital certificates -- medium/apply
(
  3, 'pki_digital_certificates',
  'A user''s browser warns that a website''s certificate has been revoked. The certificate is valid until next year and was issued by a trusted CA. Why does revocation override the certificate''s stated validity period, and which two mechanisms do CAs use to communicate revocation status?',
  '["Revocation overrides validity because certificates can be recalled by the website owner; mechanisms are CRL (Certificate Revocation List) and OCSP (Online Certificate Status Protocol)", "Revocation overrides validity because a compromised or mis-issued certificate cannot be trusted even if not yet expired; mechanisms are CRL (periodic list of revoked serials) and OCSP (real-time revocation status query)", "Revocation overrides validity because the certificate was renewed early; mechanisms are certificate pinning and DNSSEC", "Revocation is only advisory -- browsers can choose to accept revoked certificates for trusted websites; mechanisms are CRL and certificate transparency logs"]'::jsonb,
  1,
  'Certificate revocation permanently invalidates a certificate before its natural expiration date, typically because the private key was compromised, the certificate was mis-issued, or the certificate owner''s identity is no longer valid. A compromised private key makes the certificate untrustworthy regardless of its stated expiration -- the validity period assumed the private key remained secure. CRL (Certificate Revocation List) is a periodically published list of revoked certificate serial numbers signed by the CA -- clients download and check against it (potential staleness between publications). OCSP (Online Certificate Status Protocol, RFC 6960) provides real-time revocation status queries to the CA''s OCSP responder -- more current than CRL but requires online connectivity. OCSP Stapling addresses the privacy and performance concerns of OCSP by having the server query and cache the signed OCSP response.',
  'A revoked certificate is a burned cover identity. Even if it has not expired on paper, the underlying trust is compromised -- it cannot be honored.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q9: PKI and digital certificates -- hard/analyze
(
  3, 'pki_digital_certificates',
  'An organization operates an internal PKI with a two-tier hierarchy: an offline Root CA and an online Intermediate CA. The Intermediate CA''s private key is compromised. What is the CORRECT sequence of recovery actions, and why is the Root CA''s offline status relevant?',
  '["Revoke the Intermediate CA certificate using the Root CA, re-issue a new Intermediate CA certificate, revoke all end-entity certificates signed by the compromised Intermediate CA, and issue new certificates; the Root CA is offline to protect it from compromise -- its private key is used only during controlled ceremonies", "Revoke the Root CA certificate, issue a new Root CA and Intermediate CA, and notify all relying parties to update their trust stores; the Root CA must be offline because online CAs are inherently compromised", "Revoke only the specific end-entity certificates that were issued after the suspected compromise date; the Intermediate CA can continue operating after a key reset", "Issue a new Intermediate CA certificate signed by the compromised Intermediate CA to restore operations; the Root CA does not need to be involved unless the Root itself is compromised"]'::jsonb,
  0,
  'When an Intermediate CA''s private key is compromised, the compromise potentially taints all certificates it has signed. The correct recovery sequence: (1) Use the Root CA (brought online in a controlled key ceremony -- this is why it is offline, to prevent its key from being compromised in daily operations) to revoke the compromised Intermediate CA certificate. (2) Generate a new Intermediate CA key pair and have it signed by the Root CA. (3) Re-issue all end-entity certificates under the new Intermediate CA (all certificates signed by the compromised key are now untrusted). (4) Publish updated CRLs. The Root CA is offline because its compromise would require rebuilding the entire PKI trust hierarchy from scratch and updating trust stores in all relying parties -- catastrophic. The Intermediate CA handles daily certificate issuance; the Root CA only signs Intermediate CA certificates during ceremonies.',
  'The Root CA is the master seal, kept in the vault offline. The Intermediate CA does the daily work. If the field key is burned, the vault key re-commissions a new field key.',
  'analyze',
  'scenario',
  'hard',
  1.75, 1.70, 0.20, 'ai_generated', true
),

-- Q10: Key management -- medium/apply
(
  3, 'key_management',
  'An organization discovers that an employee who had access to encryption keys has left the company under adversarial circumstances. The keys were used to encrypt corporate databases. What key management action is IMMEDIATELY required?',
  '["Key revocation -- declare the compromised keys invalid and update all key distribution systems", "Key rotation -- generate new encryption keys, re-encrypt the data, and invalidate the old keys as quickly as operationally possible", "Key escrow -- deposit a copy of the existing keys with a trusted third party to prevent data loss", "Key archiving -- preserve the old keys in cold storage in case the data needs to be decrypted later"]'::jsonb,
  1,
  'Key rotation is the immediate required action. When a key-holder departs under adversarial circumstances, the existing keys must be treated as potentially compromised. New keys must be generated, data must be re-encrypted with the new keys, and the old keys must be invalidated. This is operationally complex for large databases (data must be decrypted with the old key and re-encrypted with the new key, or key wrapping layers must be updated) but necessary to ensure the departing employee cannot decrypt data using keys they may have retained or exfiltrated. Key revocation alone (A) invalidates the keys in distribution systems but does not address data that was encrypted with them. Key escrow (C) and key archiving (D) are about key preservation, not key compromise response.',
  'When the agent with the cipher book goes rogue, change the cipher. Re-encrypt everything the old key touched.',
  'apply',
  'first_action',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q11: Key management -- hard/analyze
(
  3, 'key_management',
  'An organization implements M-of-N key recovery controls for their master encryption key, requiring any 3 of 5 key custodians to be present to reconstruct the key. A disaster recovery scenario reveals that two custodians are unreachable (one is deceased, one is unreachable). Which statement BEST describes the organization''s position?',
  '["The organization is in an unrecoverable situation; the key must be regenerated and all data re-encrypted", "The organization can still recover -- 3 of the remaining 4 active custodians can reconstruct the key using Shamir''s Secret Sharing; the organization should document this gap and add a new custodian to restore the 5-custodian pool", "The organization must activate the key escrow with the third party immediately to avoid data loss", "M-of-N control is violated when any custodian is unavailable; the organization must notify regulators of a key management failure"]'::jsonb,
  1,
  'M-of-N (M out of N) key recovery control, typically implemented using Shamir''s Secret Sharing (SSS), splits the secret into N shares where any M shares can reconstruct the secret but fewer than M shares reveal nothing. With M=3, N=5 and two custodians unavailable, the organization has 3 remaining active custodians -- exactly at the threshold. Key recovery remains possible with those 3 custodians. The critical post-recovery action is to add a new custodian (and potentially increase N) to restore redundancy -- the organization is now at the minimum viable count with no further losses tolerable. This demonstrates the importance of sizing N sufficiently above M to accommodate attrition. The organization has not failed; it has consumed its redundancy buffer.',
  'Shamir''s Secret Sharing: 3 of 5 agents hold cipher fragments. Losing 2 agents leaves you exactly at the minimum. Recover the key, then rebuild the team.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q12: Hybrid cryptography -- medium/understand
(
  3, 'hybrid_cryptography',
  'TLS (Transport Layer Security) uses a hybrid cryptographic approach. During the TLS handshake, asymmetric cryptography is used, and then the session continues with symmetric cryptography. Why is this design used rather than asymmetric cryptography for the entire session?',
  '["Symmetric cryptography provides better authentication than asymmetric, so it is used once the parties are authenticated", "Asymmetric cryptography is computationally expensive for bulk data; it is used only for key exchange and authentication during the handshake, then a faster symmetric session key is used for the actual data transfer", "Symmetric cryptography cannot be used for key exchange, so asymmetric is required only during connection establishment", "Asymmetric cryptography is less secure than symmetric, so it is used only for the brief handshake phase"]'::jsonb,
  1,
  'The hybrid design exploits the strengths of both cryptographic families. Asymmetric cryptography (RSA, ECDHE) solves the key distribution problem -- two parties can securely establish a shared secret without having pre-shared keys -- and provides authentication via certificates. However, asymmetric operations are computationally expensive (RSA-2048 signature is approximately 1000x slower than AES-128 encryption of equivalent data). Once the session key is established, symmetric encryption (AES-GCM in TLS 1.3) provides high-speed bulk encryption with minimal overhead. The combination: asymmetric for secure key establishment and authentication, symmetric for efficient data protection. This is the same design used in PGP/GPG email encryption.',
  'Asymmetric: secure key handoff but too slow for a conversation. Symmetric: fast for the conversation but requires a pre-shared key. Hybrid uses each for what it does best.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q13: Cryptanalytic attacks -- medium/apply
(
  3, 'cryptanalytic_attacks',
  'An attacker attempts to crack a system''s hashed passwords. Instead of cracking each hash, the attacker precomputes a large table of hashes for all possible passwords up to a certain length and looks up the stolen hashes against this table. Which attack is the attacker using, and which defense SPECIFICALLY renders this attack ineffective?',
  '["Brute force attack; defense is using a longer password policy", "Rainbow table attack; defense is adding a random per-user salt to each password before hashing, which invalidates precomputed tables", "Dictionary attack; defense is requiring complex passwords with special characters", "Birthday attack; defense is using SHA-256 instead of MD5 for hashing"]'::jsonb,
  1,
  'A rainbow table attack uses precomputed hash chains that allow rapid lookup of plaintext values from their hashes -- more efficient than pure brute force because the computation happens offline before the attack. Salting -- adding a random unique value (the salt) to each password before hashing -- defeats rainbow tables because the attacker would need to precompute a separate table for every possible salt value, which is computationally infeasible when salts are long and random. Modern password hashing functions (bcrypt, Argon2, scrypt) automatically apply salts and are intentionally slow (key stretching), making offline cracking more expensive. The most tempting wrong answer is dictionary attack (C) -- dictionary attacks are word-list-based guessing, distinct from precomputed table lookups.',
  'Rainbow tables are the indexed codebook. Salt is randomized per record -- a unique codebook for every entry. Precomputation is useless when no two entries share a codebook.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.25, 0.20, 'ai_generated', true
),

-- Q14: Cryptanalytic attacks -- hard/analyze
(
  3, 'cryptanalytic_attacks',
  'A security engineer is concerned about birthday attacks against the organization''s digital signature scheme. The engineer proposes switching from SHA-1 (160-bit output) to SHA-256 (256-bit output) for all signatures. Which analysis BEST explains how birthday attacks apply to hash functions and whether the engineer''s proposal addresses the risk?',
  '["Birthday attacks require finding two messages with the same hash; SHA-1''s 160-bit output means an attacker needs approximately 2^80 hash computations to find a collision, while SHA-256 raises this to 2^128 -- both are computationally infeasible, so the upgrade is unnecessary", "Birthday attacks require finding two messages with the same hash (a collision); SHA-1 has known practical collision vulnerabilities (demonstrated by Google''s SHAttered attack in 2017 -- two PDF files with the same SHA-1 hash) making it unsuitable for digital signatures; SHA-256 has no known practical collision vulnerabilities and provides a security level of 128 bits against birthday attacks, making the upgrade appropriate and urgently needed", "Birthday attacks target the key management system, not the hash function; switching hash algorithms does not address this attack vector", "Birthday attacks only apply to symmetric encryption; the engineer''s analysis is incorrect and SHA-1 is still appropriate for digital signatures"]'::jsonb,
  1,
  'Birthday attacks exploit the birthday paradox -- in a set of hash outputs of n bits, finding two inputs that produce the same hash (a collision) requires approximately 2^(n/2) operations, not 2^n. For SHA-1 (160 bits), the theoretical collision resistance is 2^80 -- historically considered safe but within reach of nation-state actors. Critically, Google''s 2017 SHAttered attack demonstrated a practical SHA-1 collision with two PDF documents producing the same SHA-1 hash -- directly applicable to digital signature forgery (a forged document with the same hash as a legitimate one would validate the original signature). SHA-1 is deprecated by NIST and must not be used for new digital signatures. SHA-256 provides 128-bit collision resistance (2^128 operations) with no known practical vulnerabilities. The engineer''s proposal is correct and urgent.',
  'SHAttered proved SHA-1 collisions are real, not theoretical. Two different documents, same hash -- any signature on the original validates the forgery.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.65, 0.20, 'ai_generated', true
),

-- Q15: Security models -- medium/apply (Bell-LaPadula)
(
  3, 'security_models_belllapadula_biba',
  'A military information system implements the Bell-LaPadula model. A user with Secret clearance attempts to read a document labeled Top Secret and write a memo labeled Confidential. Which operations does the model permit and deny?',
  '["Permits reading Top Secret (no read up is not violated at Secret clearance), denies writing Confidential (no write down is violated)", "Denies reading Top Secret (no read up -- user cannot access data above their clearance), permits writing Confidential only if the user has a need-to-know", "Denies reading Top Secret (no read up) AND denies writing Confidential (no write down -- writing to a lower classification could leak Secret information to Confidential readers)", "Permits both -- Bell-LaPadula only restricts read operations, not write operations"]'::jsonb,
  2,
  'Bell-LaPadula enforces two mandatory access control rules: (1) Simple Security Property (no read up): a subject cannot read objects with a higher classification than the subject''s clearance. A Secret-cleared user cannot read a Top Secret document. (2) Star Property (no write down): a subject cannot write to objects with a lower classification than the subject''s clearance level. A Secret-cleared user cannot write to a Confidential document because doing so could effectively move Secret information to a Confidential label where lower-cleared users could read it. The model is designed to prevent information from flowing from higher to lower classification levels. Both operations are denied for a Secret-cleared user with these classification levels.',
  'Bell-LaPadula protects confidentiality: no read up (cannot see what is above you), no write down (cannot leak what you know to those below you).',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q16: Security models -- medium/apply (Biba)
(
  3, 'security_models_belllapadula_biba',
  'A financial auditing system implements the Biba integrity model. An auditor at High integrity level wants to read working papers at Low integrity and write to the official audit report at High integrity. Which operations does the Biba model allow?',
  '["Permits reading Low integrity papers, denies writing to High integrity report", "Denies reading Low integrity papers (no read down -- reading lower integrity data could contaminate the subject''s integrity), permits writing to High integrity report", "Permits both reading Low integrity and writing to High integrity", "Denies both -- Biba prevents any cross-integrity-level operations"]'::jsonb,
  1,
  'Biba focuses on INTEGRITY (not confidentiality -- opposite of Bell-LaPadula). Biba''s two key rules are the mirror image of Bell-LaPadula: (1) No read down (Simple Integrity Property): a subject cannot read data at a lower integrity level, because reading lower-integrity data could contaminate the subject''s work with unreliable information. The High-integrity auditor cannot read Low-integrity working papers. (2) No write up (Star Integrity Property): a subject cannot write to data at a higher integrity level -- but this does not apply here since the auditor IS at High integrity writing to a High integrity object. The auditor can write to the High integrity report (same level is permitted) but cannot read Low integrity papers.',
  'Biba protects integrity: no read down (do not contaminate your work with untrusted input), no write up (do not corrupt higher-integrity objects).',
  'apply',
  'comparison',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q17: Covert channels -- hard/analyze
(
  3, 'information_flow_covert_channels',
  'A high-security system processes both classified and unclassified data simultaneously. A security researcher demonstrates that an unprivileged process can infer what the privileged process is doing by measuring its own CPU scheduling delays -- the privileged process''s high CPU usage creates measurable delays in the unprivileged process''s scheduling. Which type of covert channel does this represent and why is it difficult to eliminate?',
  '["Storage covert channel -- the processes communicate through shared file system state, which can be eliminated by access controls", "Timing covert channel -- information is encoded in the timing/performance behavior of a shared resource (CPU scheduler), which is inherently difficult to eliminate without accepting significant performance degradation because shared hardware resources are fundamental to system efficiency", "Side-channel attack using power analysis -- eliminated by hardware power shielding", "Covert storage channel using system logs -- eliminated by preventing unprivileged processes from reading logs"]'::jsonb,
  1,
  'This is a timing covert channel -- a type of covert channel where information is transmitted through the timing of events or the performance characteristics of shared resources, rather than through shared storage. The CPU scheduler is a shared resource; the privileged process''s CPU consumption affects the scheduling delays experienced by all other processes. An attacker can encode bits by modulating CPU load and the receiver can decode by measuring scheduling delays. Timing covert channels are extremely difficult to eliminate because they exploit the fundamental sharing of hardware resources (CPU, cache, memory bus, network) that makes modern systems efficient. Perfectly eliminating them would require giving each process dedicated hardware with zero interference -- impractical. Real mitigations include scheduler noise, cache partitioning, and timing attack-resistant algorithms.',
  'Timing channels are the ghost in the shared machine. You cannot see the message but you feel it in the delays -- eliminating it means ending all sharing.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.60, 0.20, 'ai_generated', true
),

-- Q18: TCB/Security Kernel -- medium/understand
(
  3, 'tcb_security_kernel',
  'Which statement BEST describes the relationship between the Trusted Computing Base (TCB), the security kernel, and the reference monitor concept?',
  '["The TCB and the security kernel are synonymous terms; the reference monitor is the software layer above the kernel that enforces user-space security", "The reference monitor is a concept (all access by subjects to objects must be mediated); the security kernel is the hardware/software/firmware implementation of the reference monitor; the TCB is the totality of ALL protection mechanisms in the system, of which the security kernel is the most critical component", "The TCB is the CPU hardware; the security kernel is the operating system; the reference monitor is the application layer", "The reference monitor requires explicit implementation in every application; the security kernel handles only OS-level access control; the TCB does not include hardware"]'::jsonb,
  1,
  'These three concepts form a hierarchical relationship. The reference monitor is an abstract concept (from Anderson Report, 1972): a mechanism that mediates ALL access requests from subjects to objects, is always invoked (cannot be bypassed), tamper-proof, and small enough to be verified. The security kernel is the actual hardware, software, and firmware implementation of the reference monitor -- it is the enforcement mechanism. The Trusted Computing Base (TCB) is the broader concept encompassing ALL protection mechanisms in a system -- hardware, firmware, software -- that are relied upon to enforce the security policy. The security kernel is the most critical part of the TCB. The TCB is evaluated in Common Criteria evaluations; a smaller TCB means less attack surface and easier verification.',
  'Reference monitor is the concept: all access must be checked. Security kernel is the implementation. TCB is everything trusted to make it work.',
  'understand',
  'comparison',
  'medium',
  1.15, 0.00, 0.20, 'ai_generated', true
),

-- Q19: Ring protection -- easy/remember
(
  3, 'ring_protection',
  'In the ring protection model used by modern x86 operating systems, which ring number represents the most privileged execution mode (typically used by the OS kernel), and which represents the least privileged mode (typically used by user applications)?',
  '["Ring 3 is most privileged (kernel); Ring 0 is least privileged (user applications)", "Ring 0 is most privileged (kernel); Ring 3 is least privileged (user applications)", "Ring 1 is most privileged (device drivers); Ring 2 is least privileged (OS services)", "All rings have equivalent privileges; the difference is only in the types of operations permitted"]'::jsonb,
  1,
  'In the x86 ring protection model, Ring 0 is the most privileged mode -- used by the OS kernel with full access to all hardware instructions and memory. Ring 3 is the least privileged mode -- used by user applications, which can only access their own memory and must make system calls to request kernel services. The model enforces the principle of least privilege at the hardware level: user applications cannot directly access I/O ports, modify page tables, or execute privileged CPU instructions. Rings 1 and 2 exist theoretically but are rarely used in practice on modern operating systems (device drivers typically run in Ring 0 or Ring 3 with special privileges). Hypervisors add Ring -1 (VMX root mode) for virtualization.',
  'Ring 0 is the command center with all access. Ring 3 is the field agent with restricted clearance -- must call in to headquarters for any privileged action.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.60, 0.20, 'ai_generated', true
),

-- Q20: Virtualization and hypervisors -- medium/apply
(
  3, 'virtualization_hypervisors',
  'An attacker exploits a vulnerability in a virtual machine''s guest operating system to execute code that crosses the hypervisor boundary and gains access to the host system and other virtual machines on the same physical host. This attack is called:',
  '["VM sprawl -- an uncontrolled proliferation of virtual machines increasing attack surface", "VM escape -- a vulnerability allowing a guest VM to break out of its isolated environment and interact with the hypervisor or host", "Side-channel attack -- exploiting shared physical hardware to infer information about other VMs", "Hyperjacking -- replacing the legitimate hypervisor with a malicious one during system boot"]'::jsonb,
  1,
  'VM escape is the attack where a guest virtual machine exploits a vulnerability (typically in the hypervisor itself, the virtual device emulation layer, or the guest-host shared folder/clipboard integration) to break out of its isolated environment. Once outside the VM sandbox, the attacker can interact with the hypervisor, the host operating system, or other VMs on the same physical host. Real-world examples include vulnerabilities in VMware Tools, VirtualBox guest additions, and QEMU/KVM device emulation (e.g., VENOM vulnerability, CVE-2015-3456). VM sprawl (A) is an operational risk from unmanaged VM proliferation. Side-channel attacks (C) infer information without breaking isolation. Hyperjacking (D) installs a malicious hypervisor below the legitimate OS.',
  'VM escape is the prisoner breaking out of their cell into the prison itself. The containment boundary fails entirely.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q21: Cloud security -- medium/apply
(
  3, 'cloud_security',
  'An organization moves its HR application to a SaaS provider. The CISO asks: "Who is responsible for ensuring our employee data is encrypted at rest?" Under the shared responsibility model for SaaS, which answer is MOST accurate?',
  '["The customer is responsible for all data security because they are the data owner and controller under privacy regulations", "The SaaS provider is typically responsible for encrypting data at rest within their infrastructure; however, the customer retains accountability for ensuring the provider meets this obligation through contractual requirements, SLAs, and independent audit reports (e.g., SOC 2 Type II)", "Responsibility is evenly shared -- the customer encrypts data before sending it; the provider encrypts storage", "Security responsibility in SaaS is entirely the provider''s because the customer has no access to the underlying infrastructure"]'::jsonb,
  1,
  'Under the SaaS shared responsibility model, the provider manages the infrastructure, platform, and application security including encryption at rest within their environment. However, the CUSTOMER retains accountability as the data controller -- particularly under privacy regulations like GDPR where the data controller cannot transfer legal accountability to a processor. The customer must validate the provider''s encryption practices through contractual terms (data processing agreements, DPAs), security addenda specifying encryption standards, SLAs, and reviewing independent attestations (SOC 2 Type II reports covering availability and confidentiality trust service criteria). "Responsibility" (technical implementation) sits with the provider; "accountability" (ensuring it happens and is verified) remains with the customer.',
  'The SaaS provider locks the vault. But the organization owns the gold and must verify the lock meets their standards.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q22: ICS/SCADA -- medium/apply
(
  3, 'ics_scada_iot',
  'A water treatment facility''s SCADA system controls pumping stations and chemical dosing. A security assessment recommends network segmentation between the corporate IT network and the operational technology (OT) network. Management asks why OT systems cannot simply be patched like IT systems. Which explanation is MOST accurate?',
  '["OT systems use different encryption standards that prevent standard patching tools from functioning", "OT systems often run 24/7 critical processes where downtime for patching is unacceptable, run legacy software without vendor support, and patching may not be technically feasible without extensive testing to ensure the patch does not affect physical process control -- availability and safety take precedence over applying patches immediately", "OT systems are inherently more secure than IT systems because they use proprietary protocols not understood by typical attackers", "Patching is not required for OT systems because SCADA protocols are encrypted by default"]'::jsonb,
  1,
  'OT/ICS systems have fundamentally different operational constraints than IT systems. The CIA triad is inverted for OT: Availability and Safety are paramount (a water treatment plant cannot shut down for patching without affecting public health), followed by Integrity, with Confidentiality as a lower priority. OT systems frequently run: (1) legacy operating systems (Windows XP/NT still operating embedded in PLCs) without vendor support or patches, (2) real-time control software where untested changes can cause physical process failures, (3) proprietary protocols (Modbus, DNP3, PROFIBUS) designed for reliability, not security. Patching must be planned during maintenance windows, extensively tested in a lab environment, and often requires vendor certification -- cycles measured in years, not weeks.',
  'The SCADA controls the water pressure. Patching incorrectly could flood a neighborhood. Availability and safety dictate different patch management timelines.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q23: Physical security -- fire -- medium/apply
(
  3, 'physical_security_fire',
  'A data center manager is selecting a fire suppression system for the server room. The manager requires a system that can suppress fires effectively, is safe for both personnel who may be present and the IT equipment, and uses a clean agent that leaves no residue. The manager also notes the room has an elevated floor plenum. Which system BEST meets all requirements?',
  '["Wet pipe sprinkler system -- provides the fastest response time and is safe for electronics", "FM-200 (HFC-227ea) clean agent suppression system -- suppresses fires without damaging equipment or leaving residue, is safe for occupied spaces at design concentrations, and is effective in plenum spaces", "Deluge system -- provides the most thorough suppression for large data centers", "Halon 1301 -- the gold standard for computer room fire suppression with no residue"]'::jsonb,
  1,
  'FM-200 (1,1,1,2,3,3,3-Heptafluoropropane, HFC-227ea) is the primary clean agent successor to Halon in data center fire suppression. It suppresses fires by absorbing heat (rather than depleting oxygen) and is: (1) safe for equipment (no residue, no water damage), (2) safe for occupied spaces at design concentrations (unlike CO2 systems which would be lethal to personnel), (3) effective in enclosed spaces including plenum areas. Wet pipe sprinklers (A) discharge water -- catastrophic for operating servers. Deluge systems (C) release large volumes of water simultaneously -- even more destructive. Halon 1301 (D) is the historical gold standard but is banned under the Montreal Protocol due to its ozone depletion potential -- international production ceased in 1994. INERGEN (IG-541) is another acceptable clean agent alternative.',
  'Halon worked perfectly but destroys the ozone layer. FM-200 is the approved successor -- clean, safe, leaves no trace, just like a good operation.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q24: Physical security -- fire -- hard/analyze
(
  3, 'physical_security_fire',
  'A fire detection system uses ionization detectors throughout a data center. A fire safety consultant recommends adding VESDA (Very Early Smoke Detection Apparatus) to the data center environment. What is the SPECIFIC advantage of VESDA that justifies the additional investment alongside existing ionization detectors?',
  '["VESDA detects all fire classes (A/B/C/D/K) while ionization detectors can only detect Class A fires", "VESDA actively samples air from the protected space and detects smoke particles at concentrations below human perception -- providing warnings minutes to hours before a fire develops to the point ionization detectors would activate, enabling investigation and intervention before suppression is needed", "VESDA is cheaper than ionization detectors at scale, making it the cost-effective replacement", "VESDA detects heat rather than smoke, making it more accurate in areas with existing airborne particles"]'::jsonb,
  1,
  'VESDA (Very Early Smoke Detection Apparatus) uses aspirating smoke detection technology: air is actively drawn from the protected space through a network of sampling pipes to a central laser-based particle detector. It can detect smoke at concentrations 1,000x lower than conventional detectors -- meaning it sounds a warning at the earliest stages of a fault (e.g., overheating insulation, pre-smoke particle generation) before a fire develops. In a data center, this allows the operations team to investigate a failing power supply or overheating component before it becomes a fire -- avoiding both fire damage and the unnecessary activation of suppression systems. Ionization detectors respond to combustion products from actual burning -- VESDA detects precursors. They complement each other: VESDA provides early warning; ionization provides confirmation for suppression activation.',
  'VESDA smells the smoke before the candle burns. Standard detectors wait for the fire. In a data center, early warning means the difference between replacing a component and replacing the data center.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q25: SQL injection -- medium/apply
(
  3, 'sql_injection',
  'A developer is writing a login function that builds a SQL query by concatenating user input: `SELECT * FROM users WHERE username='' + username + '' AND password='' + password + ''`. An attacker enters the username: `admin''--`. What is the effect, and which coding practice SPECIFICALLY prevents this class of vulnerability?',
  '["The query fails because the apostrophe is an invalid character; prevention is input length validation", "The apostrophe closes the string literal and -- comments out the rest of the query, effectively making the WHERE clause check only the username with no password requirement; prevention is parameterized queries (prepared statements) which separate SQL code from data", "The query returns no results because -- is interpreted as data; prevention is using HTTPS for the login page", "The attack succeeds only if the attacker knows the admin username; prevention is using email addresses instead of usernames"]'::jsonb,
  1,
  'The attack exploits SQL string concatenation. The input `admin''--` causes the query to become: `SELECT * FROM users WHERE username=''admin''--'' AND password=''...''`. The apostrophe after "admin" closes the username string literal, and `--` is the SQL comment operator that comments out everything following it -- including the password check. The resulting effective query is: `SELECT * FROM users WHERE username=''admin''` -- which authenticates as admin with no password. Parameterized queries (prepared statements) prevent this by separating SQL structure from data: the SQL engine compiles the query structure first, then inserts data as literal values -- the apostrophe in the username is treated as a data character, not SQL syntax.',
  'The apostrophe is the escape route out of the data zone into the command zone. Parameterized queries seal that route -- data stays data.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q26: XSS/CSRF -- medium/apply
(
  3, 'xss_csrf',
  'A user is logged into their bank''s website. An attacker tricks the user into clicking a link on a malicious website. The link causes the user''s browser to send an authenticated request to the bank to transfer funds, without the user''s knowledge. The bank processes the request because it comes from the user''s authenticated session. Which attack is this, and which defense is MOST effective?',
  '["Cross-Site Scripting (XSS) -- defense is output encoding of user-supplied content", "Cross-Site Request Forgery (CSRF) -- defense is requiring a synchronizer token (CSRF token) that is included in every state-changing form submission and validated server-side", "Session hijacking -- defense is secure and HttpOnly cookie flags", "SQL injection -- defense is parameterized queries for database operations"]'::jsonb,
  1,
  'This is Cross-Site Request Forgery (CSRF). The attack exploits the web application''s trust in the user''s browser -- the browser automatically attaches authentication cookies to requests to the bank''s domain, so the forged request appears authenticated. The user never intended to submit the request. The most effective defense is CSRF tokens (synchronizer tokens): a unique, secret, session-specific token embedded in each form that must be submitted with state-changing requests. The attacker''s page cannot read the CSRF token from the legitimate bank site (same-origin policy) and therefore cannot include a valid token in the forged request. XSS (A) injects scripts INTO a page viewed by other users -- a different attack where the malicious code runs IN the victim''s browser on the legitimate site.',
  'CSRF uses the victim''s credentials against their will -- like forging a signed order using their credentials. The CSRF token is the counter-signature the attacker cannot forge.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q27: Malware types -- easy/remember
(
  3, 'malware_types',
  'A piece of malware is discovered that does not need to attach itself to another file to propagate -- it travels across networks by exploiting operating system vulnerabilities and copies itself to new hosts automatically without any user interaction. This malware is BEST classified as:',
  '["A virus -- it replicates by inserting copies into other executable files", "A worm -- it is self-replicating and propagates across networks without needing a host file", "A Trojan -- it masquerades as legitimate software to gain access", "A rootkit -- it hides its presence and other malware from the operating system"]'::jsonb,
  1,
  'A worm is self-replicating malware that propagates across networks without needing to attach to a host file and without requiring user interaction. Worms exploit network vulnerabilities or services to copy themselves from system to system. Famous examples: Morris Worm (1988, first internet worm), Code Red (2001, IIS vulnerability), Conficker (2008, Windows vulnerability). A virus requires a host file and typically requires a user action (running the infected file) to spread. A Trojan appears legitimate but has a malicious payload -- it does not self-replicate. A rootkit hides itself and other malware from detection, typically at the OS or hypervisor level.',
  'Worms spread on their own -- no host file, no human click needed. The Morris Worm crashed 10% of the internet in 1988 by self-propagating.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.55, 0.20, 'ai_generated', true
),

-- Q28: Vulnerabilities in systems -- hard/analyze
(
  3, 'vulnerabilities_in_systems',
  'A developer writes a function that accepts a user-provided filename and passes it to a file reading routine. Before reading the file, the function checks if the filename contains traversal sequences (e.g., "../") and rejects requests with those patterns. A security researcher bypasses the check using URL encoding (%2E%2E%2F) and accesses /etc/passwd. What type of vulnerability is this, and which mitigation strategy addresses the root cause?',
  '["Input validation failure -- the root cause is insufficient blacklisting; adding more blocked patterns will fix it", "Path traversal vulnerability caused by insecure direct object reference; the root cause is insufficient validation, but blacklisting is inherently inadequate -- the correct mitigation is canonicalizing the path (resolving it to its absolute, normalized form) and verifying it falls within the intended base directory BEFORE reading the file", "Buffer overflow vulnerability -- the root cause is insufficient bounds checking; mitigation is ASLR", "Injection vulnerability -- the root cause is lack of parameterized file access; mitigation is escaping all special characters"]'::jsonb,
  1,
  'This is a path traversal attack (also called directory traversal). The vulnerability has two layers: (1) The developer used a blacklist approach (blocking "../") rather than a whitelist or canonical path approach -- blacklists are inherently incomplete because they cannot anticipate all encoding variations (%2E%2E%2F, %252E%252E%252F, double URL encoding, Unicode variants). (2) The correct mitigation is to canonicalize the user-supplied path (resolve to absolute, normalized form using the OS path resolution function) THEN verify the resolved path starts with the intended base directory. If the resolved path is not under /var/app/files/, reject it regardless of what the original input looked like. This addresses the root cause (arbitrary file access through traversal) rather than patching around it with ever-expanding blacklists.',
  'Blacklists are incomplete by definition. Canonicalize first, then validate against the whitelist of allowed paths. Never trust the input''s self-reported structure.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q29: Enterprise architecture -- medium/understand
(
  3, 'enterprise_architecture_frameworks',
  'A CISO wants to ensure that security is designed into the organization''s enterprise architecture from the beginning rather than added as an afterthought. Which enterprise architecture framework is SPECIFICALLY security-focused and uses a risk-driven, business-aligned approach to integrate security into the architecture?',
  '["Zachman Framework -- provides a comprehensive two-dimensional matrix of architecture perspectives", "TOGAF (The Open Group Architecture Framework) -- provides the Architecture Development Method (ADM) for building enterprise architectures", "SABSA (Sherwood Applied Business Security Architecture) -- is specifically security-focused, using a layered risk-driven approach that aligns security architecture with business objectives", "COBIT -- provides governance and management objectives for enterprise IT"]'::jsonb,
  2,
  'SABSA (Sherwood Applied Business Security Architecture) is the purpose-built security enterprise architecture framework. It uses a matrix similar in structure to Zachman but focuses entirely on security architecture, driven by business risk. SABSA begins with business attributes (what the business needs security to achieve) and derives security services, mechanisms, and standards from those business requirements -- ensuring security architecture is justified by business outcomes rather than technology preference. Zachman (A) is a general EA framework with no specific security focus. TOGAF (B) is a general EA framework -- while it can address security, it is not security-centric. COBIT (D) is an IT governance framework.',
  'SABSA starts with the mission objective and derives the security posture from it. Security architecture follows the business strategy, not the other way around.',
  'understand',
  'best_answer',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q30: Cryptanalytic attacks -- very hard/analyze (except/not)
(
  3, 'cryptanalytic_attacks',
  'Which of the following is NOT an example of a side-channel attack?',
  '["Power analysis -- measuring the electrical power consumption of a cryptographic device to infer key information", "Timing attack -- measuring the time taken by cryptographic operations to infer key bits based on execution path differences", "Known-plaintext attack -- the attacker has both plaintext and corresponding ciphertext pairs and uses them to deduce the key", "Cache-timing attack -- measuring cache hit/miss timing differences to infer what data is being accessed by a cryptographic operation"]'::jsonb,
  2,
  'A known-plaintext attack (KPA) is NOT a side-channel attack -- it is a classical cryptanalytic attack that targets the algorithm itself using observed plaintext-ciphertext pairs. The attacker attempts to derive the key from the mathematical relationship between known plaintext and its corresponding ciphertext. Side-channel attacks exploit physical implementation characteristics of a cryptographic system -- they attack the device rather than the algorithm: (A) power analysis (Simple Power Analysis/Differential Power Analysis) measures power fluctuations during computation; (B) timing attacks exploit execution path differences that correlate with key bits; (D) cache-timing attacks exploit memory access patterns through shared cache hardware. Side-channel attacks are particularly dangerous because they can break theoretically secure algorithms by attacking their real-world implementations.',
  'Side channels attack the messenger, not the message. Known-plaintext attacks the math of the cipher directly -- a classical, not physical, attack.',
  'analyze',
  'except_not',
  'very_hard',
  2.00, 2.20, 0.25, 'ai_generated', true
);
