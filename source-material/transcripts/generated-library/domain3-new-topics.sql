-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 3 (Security Architecture and Engineering)
-- Topics: 3.5.1 through 3.14.2
-- Source basis: ISC2 CBK, NIST SP 800-57, NIST SP 800-38A/D, FIPS 197 (AES),
--               FIPS 140-3, RFC 5246 (TLS), RFC 3280 (X.509), ISO/IEC 27001,
--               CSA Security Guidance, and public-domain cybersecurity knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 3.5.1 Enterprise Security Architecture Frameworks
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.5.1',
  'Enterprise Security Architecture Frameworks',
  'Zachman provides a classification scheme for enterprise artifacts; TOGAF is an architecture development method for enterprise IT; SABSA is a risk-driven framework specifically designed for security architecture — each serves a different purpose and audience.',
  '## Enterprise Security Architecture Frameworks

Security architecture does not happen in a vacuum. Organizations need structured frameworks to align security design decisions with business objectives, regulatory requirements, and operational constraints. Three frameworks appear prominently in CISSP study material: Zachman, TOGAF, and SABSA. Understanding what each framework does — and critically, what it does not do — is more important than memorizing their internal details.

### Zachman Framework

The Zachman Framework (developed by John Zachman at IBM in 1987) is not an architecture methodology — it is a **classification scheme** for enterprise architecture artifacts. Zachman organizes architectural descriptions using a two-dimensional grid: six perspectives (Planner, Owner, Designer, Builder, Subcontractor, User) on one axis and six interrogatives (What, How, Where, Who, When, Why) on the other. The result is a 36-cell matrix where each cell represents a specific type of architectural artifact.

Zachman does not prescribe a process for creating architecture. It simply provides a taxonomy for organizing and classifying artifacts. Its value is in ensuring completeness — if you can populate every cell in the Zachman matrix for your enterprise, you have a comprehensive description of the enterprise from multiple perspectives and for multiple concerns. For security, Zachman helps identify where security artifacts should exist at each level of abstraction and from each stakeholder perspective.

### TOGAF

The Open Group Architecture Framework (TOGAF) is a comprehensive enterprise architecture framework and methodology maintained by The Open Group. Its centerpiece is the **Architecture Development Method (ADM)** — a cyclic, phase-based process for developing and maintaining enterprise architecture. ADM phases run from Preliminary (setting up the architecture capability) through Architecture Vision, Business Architecture, Information Systems Architecture, Technology Architecture, Opportunities and Solutions, Migration Planning, Implementation Governance, and Architecture Change Management, returning to the beginning.

TOGAF also defines the Architecture Content Framework (a metamodel for architectural artifacts), the Enterprise Continuum (a classification for reusable architecture assets), and the Architecture Repository for storing artifacts. TOGAF is widely used in large enterprises and government agencies for enterprise IT architecture. It addresses security as a concern within the architecture but is not security-specific.

### SABSA

The Sherwood Applied Business Security Architecture (SABSA) is a framework and methodology specifically designed for enterprise security architecture. It is structured similarly to Zachman (a layered matrix) but every layer and every question is mapped explicitly to security considerations. SABSA''s five layers are: Contextual (business context and risk appetite), Conceptual (security concepts and principles), Logical (security services and information flows), Physical (security mechanisms and products), and Component (specific security tools and technology settings).

The defining feature of SABSA is that it starts with **business risk** at the contextual layer and traces requirements through every layer down to specific technical implementations. This traceability ensures that every security control can be justified by reference to a business objective or risk. SABSA is used by large organizations and government bodies as a framework for designing security architectures that are genuinely tied to business needs rather than being collections of best practices bolted onto existing infrastructure.

SABSA is vendor-neutral, complementary to TOGAF (SABSA provides the security specialization that TOGAF lacks), and aligns with ISO/IEC 27001 and NIST frameworks.',
  NULL,
  '{"headers": ["Framework", "Type", "Security-Specific?", "Primary Value", "Exam Relevance"], "rows": [["Zachman", "Classification taxonomy (matrix)", "No — general enterprise architecture", "Ensures completeness of architectural artifacts; organizes by perspective and interrogative", "Know it as a taxonomy, not a methodology; 36-cell grid"], ["TOGAF", "Architecture development methodology (ADM)", "No — general enterprise IT architecture", "Provides a repeatable process (ADM) for developing and maintaining enterprise architecture", "Know ADM phases exist; used in large enterprise IT governance"], ["SABSA", "Risk-driven security architecture methodology", "Yes — security-specific", "Traces security requirements from business risk to technical implementation; five layers from contextual to component", "Know it as the security-specific framework; starts with business risk and traces down to technology"]]}'::jsonb,
  'The exam distinguishes these three frameworks by purpose. Zachman = taxonomy/classification (not a process). TOGAF = general enterprise IT architecture process (ADM). SABSA = security-specific, risk-driven, five-layer architecture framework. If a question asks which framework starts from business risk and traces to technical security controls, the answer is SABSA. If a question asks which is a methodology for developing enterprise architecture, TOGAF. If a question asks which is a classification matrix for organizing architecture artifacts, Zachman.',
  'As a manager, you choose a framework based on what problem you are solving. TOGAF is appropriate when your challenge is overall enterprise IT architecture governance. SABSA is appropriate when your challenge is building a security architecture that is traceable to business objectives and auditable against risk appetite. Zachman is most useful as a completeness check — it tells you what artifacts you should have, not how to create them. Many mature organizations use all three in complementary roles.',
  'ZTS — Zachman Taxonomizes, TOGAF Transforms, SABSA Secures. Zachman classifies what you have. TOGAF builds the architecture. SABSA ensures security is baked in from business risk downward. Remember: only SABSA is security-first.',
  'In the Server Farm in Zurich, the architecture team has three whiteboards. The Zachman whiteboard is a 6x6 grid covered in colored sticky notes — every cell represents an artifact they need to produce (taxonomy). The TOGAF whiteboard shows the ADM cycle, tracking which phase the enterprise architecture project is currently in (methodology). The SABSA whiteboard starts with a business risk statement at the top and traces control requirements through five layers down to specific firewall rules at the bottom (risk-driven security architecture).'
);

-- ---------------------------------------------------------------------------
-- 3.6.1 Symmetric Cryptography
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.6.1',
  'Symmetric Cryptography',
  'Symmetric encryption uses the same key for both encryption and decryption — providing fast, efficient bulk data protection — with AES-128/256 as the current standard, while DES and 3DES are deprecated due to insufficient key length and known vulnerabilities.',
  '## Symmetric Cryptography

Symmetric cryptography uses a single shared key for both encryption and decryption. The sender encrypts plaintext with the key, and the receiver decrypts the ciphertext using the identical key. This simplicity makes symmetric algorithms fast and computationally efficient, which is why they are used for bulk data encryption — protecting data at rest, encrypting communications after key exchange, and encrypting storage volumes. The fundamental challenge of symmetric cryptography is the **key distribution problem**: how do you securely share the key with the recipient before any secure channel exists?

### DES: Data Encryption Standard

DES was standardized by NIST (then NBS) in 1977. It operates on 64-bit blocks using a 56-bit key. DES was considered strong when first standardized, but by 1998 the EFF demonstrated that a dedicated hardware machine could brute-force a DES key in fewer than 23 hours. Today, commodity hardware can break DES in seconds. DES is completely obsolete and must not be used for any current security purpose.

### 3DES: Triple DES

3DES (Triple DES, also called TDEA — Triple Data Encryption Algorithm) was a stopgap measure that applied DES three times to each block. The most common variant (3-key 3DES) uses three independent 56-bit keys, providing an effective key length of 112 bits after accounting for meet-in-the-middle attacks. 3DES is far slower than AES (approximately three times slower) because it applies a slower base algorithm three times. NIST deprecated 3DES for new applications in 2019 and disallowed it entirely after 2023. It should not be used in any new system.

### AES: Advanced Encryption Standard

AES (FIPS 197, standardized 2001) is the current U.S. government standard for symmetric encryption and is universally used across all industries and platforms. AES is a **substitution-permutation network** cipher operating on 128-bit blocks (fixed) with key sizes of 128, 192, or 256 bits (selectable). The number of rounds varies by key size: 10 rounds for AES-128, 12 for AES-192, 14 for AES-256.

AES-128 provides 128 bits of security, which is considered computationally infeasible to brute-force even with quantum computers using Grover''s algorithm (which reduces the effective security to 64 bits — still infeasible). AES-256 is recommended for "top secret" level protection per NSA Suite B guidance. AES is implemented in hardware acceleration in modern CPUs (AES-NI instructions), making it extremely fast — typically faster than 3DES by an order of magnitude.

### IDEA and Blowfish

**IDEA** (International Data Encryption Algorithm) operates on 64-bit blocks with a 128-bit key. It was designed to avoid export restrictions on DES and was used in early versions of PGP. IDEA is largely obsolete, replaced by AES.

**Blowfish** and its successor **Twofish** are block ciphers with variable key lengths (up to 448 bits for Blowfish) designed by Bruce Schneier. Twofish was a finalist in the AES competition. Blowfish is still used in some legacy systems and is the basis of the bcrypt password hashing algorithm, but it is not recommended for new encryption applications.

### The Key Distribution Problem

The fundamental weakness of symmetric cryptography is that both parties must already share the secret key before they can communicate securely. Distributing the key through an insecure channel defeats the purpose of encryption. Two solutions exist: (1) use an asymmetric (public key) system to encrypt and exchange the symmetric key, which is the basis of TLS and most modern key exchange protocols; or (2) use an out-of-band channel (physical exchange, trusted courier) to establish the key. In practice, essentially all modern symmetric key usage relies on asymmetric key exchange to solve the distribution problem.',
  '[{"formula":"Effective keys = 2^n","description":"Number of possible symmetric keys for an n-bit key space — brute force must try up to this many keys"},{"formula":"3DES effective security = 112 bits","description":"Due to meet-in-the-middle attack reducing 3 x 56-bit keys from 168 bits to ~112 bits of effective security"}]'::jsonb,
  '{"headers": ["Algorithm", "Block Size", "Key Size", "Status", "Speed vs AES", "Notes"], "rows": [["DES", "64 bits", "56 bits", "Broken — obsolete", "3-10x faster (but irrelevant)", "Brute-forced in <23 hours since 1998"], ["3DES (3-key)", "64 bits", "112 bits effective", "Deprecated 2019, disallowed 2023", "~3x slower than AES", "Stopgap between DES and AES; still in some legacy payment systems"], ["AES-128", "128 bits", "128 bits", "Current standard — approved", "Baseline (fastest with AES-NI)", "FIPS 197; used everywhere; sufficient for most classified data"], ["AES-192", "128 bits", "192 bits", "Current standard — approved", "Slightly slower than AES-128", "Intermediate option; rarely chosen over 128 or 256"], ["AES-256", "128 bits", "256 bits", "Current standard — approved, post-quantum resistant", "Slightly slower than AES-128", "NSA Suite B for Top Secret; recommended for long-term data protection"], ["IDEA", "64 bits", "128 bits", "Legacy — largely obsolete", "Slower than AES", "Used in early PGP; largely replaced"]]}'::jsonb,
  'Key exam facts for symmetric crypto: (1) DES = broken (56-bit key, brute-forceable). (2) 3DES = deprecated but may appear in legacy PCI scenarios. (3) AES = current standard, 128-bit block, key sizes 128/192/256. (4) Symmetric is fast but requires a shared secret — the key distribution problem is solved by asymmetric crypto. (5) The difference between symmetric and asymmetric: same key vs. key pair. If the question describes encrypting large volumes of data quickly, symmetric is the answer.',
  'As a manager, your symmetric cryptography decisions are almost always made through product selection rather than algorithm selection — most well-implemented products use AES. Your risk is not choosing the wrong cipher; it is misconfiguring the right one (using ECB mode, using a short key, or reusing IVs). Ensure your cryptographic standards document specifies algorithm, key size, mode of operation, and IV management. Never let developers choose defaults without guidance.',
  'SAD — Symmetric Algorithm Descendants: DES (dead), AES (dominant), IDEA (dormant). DES died at 56 bits. AES dominates at 128/256. IDEA is collecting dust. Symmetric = Same key both ways = Speed demon but needs a secret handshake first.',
  'In the Zurich Server Farm, a massive data pipeline encrypts petabytes of backup data nightly. The AES-256 engine runs in hardware (AES-NI) at wire speed — symmetric crypto at scale. In the basement archive, a dusty tape library is labeled "LEGACY — 3DES encrypted — do not use for new data." A red X is painted over a DES manual on the bookshelf. The key exchange that set up tonight''s AES session happened via RSA earlier in the day — asymmetric solving symmetric''s key distribution problem.'
);

-- ---------------------------------------------------------------------------
-- 3.7.1 Asymmetric Cryptography
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.7.1',
  'Asymmetric Cryptography',
  'Asymmetric cryptography uses mathematically linked key pairs — a public key anyone can know and a private key only the owner holds — enabling confidential communication, digital signatures, and key exchange without a pre-shared secret.',
  '## Asymmetric Cryptography

Asymmetric cryptography (also called public key cryptography) uses a mathematically linked pair of keys: a **public key** that can be freely distributed and a **private key** that must be kept secret by its owner. Data encrypted with the public key can only be decrypted by the corresponding private key, and vice versa. This fundamental property solves the key distribution problem that symmetric cryptography cannot address: you can publish your public key to the world, and anyone who wants to send you a confidential message can do so without ever needing to share a secret with you in advance.

### RSA

RSA (Rivest-Shamir-Adleman, 1977) is the most widely deployed asymmetric algorithm. Its security is based on the computational difficulty of factoring the product of two large prime numbers. RSA can be used for both encryption and digital signatures. Key sizes for RSA are typically 2048, 3072, or 4096 bits — much larger than symmetric key sizes because the underlying mathematical problem is easier to attack than brute-force key search. NIST SP 800-57 recommends a minimum of 2048-bit RSA keys through 2030, with 3072 bits for longer-term security. RSA is significantly slower than symmetric algorithms for bulk data encryption, which is why RSA is typically used only to encrypt a symmetric session key, not bulk data.

### DSA

The Digital Signature Algorithm (DSA) is a FIPS 186 standard specifically designed for digital signatures, not encryption. DSA is based on the discrete logarithm problem over a finite field. It uses a key pair (private signing key, public verification key) and produces a signature that can be verified by anyone with the public key. DSA is used in TLS, SSH, and code signing. NIST updated FIPS 186-5 in 2023 and deprecated original DSA, recommending migration to ECDSA or EdDSA.

### ECC: Elliptic Curve Cryptography

Elliptic Curve Cryptography (ECC) uses the mathematical properties of elliptic curves over finite fields to provide equivalent security to RSA/DSA with much smaller key sizes. A 256-bit ECC key provides approximately the same security as a 3072-bit RSA key. This makes ECC particularly valuable for constrained environments: mobile devices, IoT sensors, smart cards, and TLS where certificate size and handshake performance matter.

ECDH (Elliptic Curve Diffie-Hellman) is used for key exchange. ECDSA (Elliptic Curve Digital Signature Algorithm) is used for digital signatures. The NIST P-256 curve (secp256r1) and P-384 curve are the most commonly used. X25519 (using Curve25519) is increasingly preferred for key exchange due to its resistance to implementation errors and side-channel attacks.

### Key Exchange: Diffie-Hellman

Diffie-Hellman (DH) key exchange is not an encryption algorithm — it is a protocol that allows two parties to establish a shared symmetric secret over an insecure channel without prior shared knowledge. Each party generates a key pair, exchanges public values, and independently derives the same shared secret. This shared secret then becomes the symmetric key for the session. Ephemeral Diffie-Hellman (DHE or ECDHE — Elliptic Curve DHE) generates fresh key pairs for each session, providing **perfect forward secrecy (PFS)**: if the long-term private key is later compromised, past session keys cannot be derived, protecting past communications.

### Digital Signatures

Digital signatures use asymmetric cryptography to provide authentication, integrity, and non-repudiation. The process: the signer hashes the document, encrypts the hash with their private key (this is the signature), and sends the document plus the signature. The verifier decrypts the signature with the signer''s public key to recover the hash, independently hashes the document, and compares. If the hashes match, the document is authentic, unmodified, and the signer cannot repudiate it.

Critical: for digital signatures, the private key encrypts (signs) and the public key decrypts (verifies). For confidentiality, the opposite: the recipient''s public key encrypts, and the recipient''s private key decrypts.',
  '[{"formula":"Security equivalence: 256-bit ECC ≈ 3072-bit RSA ≈ 128-bit symmetric","description":"Approximate key size equivalence across algorithm families for equivalent security strength (NIST SP 800-57)"}]'::jsonb,
  '{"headers": ["Algorithm", "Based On", "Use Cases", "Key Sizes (recommended)", "Speed vs Symmetric", "Status"], "rows": [["RSA", "Integer factorization problem", "Encryption, key encapsulation, digital signatures", "2048+ bits (3072 for post-2030)", "10-1000x slower for same data volume", "Widely used; migrate from 1024-bit immediately"], ["DSA", "Discrete logarithm problem", "Digital signatures only (not encryption)", "2048+ bits", "Comparable to RSA", "Deprecated in FIPS 186-5; use ECDSA instead"], ["ECDSA / ECDH", "Elliptic curve discrete logarithm", "Signatures (ECDSA), key exchange (ECDH)", "256 bits (P-256) for 128-bit security", "Faster than RSA; better on constrained devices", "Current recommended standard"], ["DH / ECDHE", "Discrete logarithm / elliptic curve DL", "Key exchange only — not encryption or signatures", "2048+ bits DH; 256+ bits ECDHE", "N/A — key exchange protocol", "ECDHE preferred for perfect forward secrecy"]]}'::jsonb,
  'Critical exam distinctions for asymmetric crypto: (1) Public key encrypts for confidentiality; private key decrypts. For signatures, REVERSE: private key signs; public key verifies. (2) RSA can do both encryption and signatures; DSA only does signatures. (3) ECC provides equivalent security with smaller keys. (4) Diffie-Hellman is key EXCHANGE only — not encryption. (5) ECDHE provides perfect forward secrecy. Watch for questions about "which key is used for what" — the sign/verify reversal is the most common trap.',
  'As a manager, your asymmetric cryptography decisions primarily come up in PKI management, certificate lifetimes, key sizes, and algorithm selection for new systems. The key operational risk is key management: private keys that are not adequately protected undermine every cryptographic guarantee. Mandate HSMs (Hardware Security Modules) for all high-value private key storage. Plan for migration from RSA to post-quantum algorithms (CRYSTALS-Kyber for encryption, CRYSTALS-Dilithium for signatures, per NIST PQC standardization) before quantum computers make RSA factoring feasible.',
  'CRYPE — Confidentiality uses Recipient''s Public key to Encrypt. Signatures use Signer''s Private key to sign. The direction is critical: Public key = open the mailbox for anyone to drop in. Private key = only you retrieve from the mailbox. For signing: private key = your unique stamp; public key = the stamp verifier anyone can use.',
  'In the Zurich Server Farm, two engineers are setting up a secure channel. Engineer A generates a key pair, posts the public key on the whiteboard (asymmetric — public is public). Engineer B generates their own pair, also posts theirs. They run ECDHE: exchange public values, each independently compute the shared secret, never write it on the whiteboard. That shared secret becomes today''s AES-256 session key (symmetric from here on). The asymmetric exchange solved the symmetric distribution problem without ever sharing a secret openly.'
);

-- ---------------------------------------------------------------------------
-- 3.8.1 Cryptographic Hash Functions and HMAC
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.8.1',
  'Cryptographic Hash Functions and HMAC',
  'Cryptographic hash functions produce a fixed-length fingerprint of arbitrary data with one-way and collision-resistant properties; HMAC adds a shared secret key to provide both integrity and authentication without asymmetric cryptography.',
  '## Cryptographic Hash Functions and HMAC

A cryptographic hash function takes an input of arbitrary length and produces a fixed-length output (the hash, digest, or fingerprint) with three essential properties: **one-way** (it is computationally infeasible to reverse the hash to recover the input), **deterministic** (the same input always produces the same output), and **collision-resistant** (it is computationally infeasible to find two different inputs that produce the same hash). Hash functions are fundamental to digital signatures, data integrity verification, password storage, and HMAC.

### MD5

MD5 (Message Digest 5, RFC 1321) produces a 128-bit digest. MD5 is **cryptographically broken**: researchers demonstrated practical collision attacks in 2004, and MD5 is now feasible to attack on commodity hardware. MD5 must not be used for any security purpose requiring collision resistance. It remains common for non-security checksum purposes (verifying file downloads against known-good values), but even this use should migrate to SHA-2. MD5 is never acceptable for digital signatures, certificate hashing, or password storage.

### SHA-1

SHA-1 (Secure Hash Algorithm 1, FIPS 180) produces a 160-bit digest. SHA-1 was declared broken by NIST in 2002 (theoretical attacks) and in 2017 Google''s SHAttered project demonstrated the first practical collision. NIST deprecated SHA-1 for most applications in 2011 and fully disallowed it for digital signature generation after 2013. Browsers removed SHA-1 certificate trust. SHA-1 is obsolete for security use.

### SHA-2

SHA-2 (FIPS 180-4) is a family of hash functions including SHA-224, SHA-256, SHA-384, and SHA-512, producing digests of 224, 256, 384, and 512 bits respectively. SHA-256 and SHA-512 are the most widely used. SHA-2 is the current standard for most security applications including TLS certificates, code signing, blockchain, and HMAC. No practical attacks against SHA-2 have been demonstrated.

### SHA-3

SHA-3 (FIPS 202, standardized 2015) is a completely different algorithm from SHA-2 — based on the Keccak sponge construction rather than the Merkle-Damgård structure used by MD5, SHA-1, and SHA-2. SHA-3 was standardized as an alternative standard, not a replacement for SHA-2, providing cryptographic diversity: if a weakness were found in the Merkle-Damgård structure, SHA-3 would remain unaffected. SHA-3 is available in 224, 256, 384, and 512-bit variants and as SHAKE128/SHAKE256 (variable-length outputs).

### HMAC: Hash-Based Message Authentication Code

An HMAC (Hash-based Message Authentication Code, RFC 2104) combines a hash function with a shared secret key to provide both **integrity** (the message has not been altered) and **authentication** (only someone with the shared key could have created the HMAC). The HMAC construction is: HMAC(K, m) = H((K XOR opad) || H((K XOR ipad) || m)), where K is the key, m is the message, H is the hash function, opad and ipad are fixed padding constants, and || is concatenation.

HMAC is not encryption — it does not provide confidentiality. It provides assurance that the message came from a party that holds the shared key and that the message was not modified. HMAC is used extensively in TLS (for record integrity), IPSec, API authentication (HMAC-SHA256 in AWS Signature Version 4), and JWT (JSON Web Token) validation.

### Hash Functions in Digital Signatures

In a digital signature scheme, the signer hashes the document (producing the message digest) and then encrypts the digest with their private key. The signature is the encrypted digest, not the encrypted document. This is efficient (hashing is fast; asymmetric encryption of a small digest is much faster than encrypting a large document) and preserves the semantic integrity of the signature (the hash uniquely represents the document''s content). If even a single bit of the document changes, the hash — and therefore the signature verification — will fail.',
  '[{"formula":"HMAC(K,m) = H((K XOR opad) || H((K XOR ipad) || m))","description":"HMAC construction: combines key (K) and message (m) using nested hash operations with inner padding (ipad) and outer padding (opad)"}]'::jsonb,
  '{"headers": ["Algorithm", "Output Size", "Security Status", "Collision Resistance", "Primary Current Use"], "rows": [["MD5", "128 bits", "Broken — do not use for security", "Practical collision attacks exist", "Non-security checksums only (avoid entirely)"], ["SHA-1", "160 bits", "Broken — deprecated by NIST 2011", "Practical collision demonstrated (SHAttered 2017)", "Legacy systems only; migrating away"], ["SHA-256 (SHA-2)", "256 bits", "Current standard — secure", "No practical attacks known", "TLS certificates, code signing, HMAC, blockchain"], ["SHA-512 (SHA-2)", "512 bits", "Current standard — secure", "No practical attacks known", "High-security applications, HMAC-SHA-512"], ["SHA-3 (Keccak)", "224/256/384/512 bits", "Current standard — secure", "No practical attacks known", "Cryptographic diversity; post-SHA-2 alternative"]]}'::jsonb,
  'Key CISSP exam distinctions for hashes: (1) Hash functions provide integrity, NOT confidentiality. (2) MD5 and SHA-1 are broken — questions about "secure hash" should rule them out. (3) HMAC adds authentication to integrity — it proves WHO sent the message (holder of shared key), not just that it was not altered. (4) HMAC is not encryption. (5) Digital signatures hash first, then encrypt the hash with private key. (6) SHA-2 is the current standard; SHA-3 is an alternative, not a replacement.',
  'As a manager, the most dangerous hash-related mistake in practice is still password storage. MD5 and SHA-1 password hashes are trivially cracked by rainbow tables and GPU brute-force. Mandate bcrypt, scrypt, Argon2, or PBKDF2 for all password storage — these are purpose-built for password hashing with built-in salting and adjustable cost factors. Reject any system that stores passwords as MD5 or SHA-1 hashes, regardless of the vendor''s assurances.',
  'HMAC = Hash + MAC = Integrity + Authentication. The hash proves the content. The key proves the identity. SHA health check: MD5 = sick, SHA-1 = dead, SHA-2 = alive and well, SHA-3 = the backup plan. Remember: hashes never encrypt — they fingerprint.',
  'In the Zurich Server Farm, a file integrity monitoring system runs SHA-256 hashes on every critical system binary every hour (integrity verification). The TLS certificate on the server uses SHA-384 to sign the certificate (digital signature). The API authentication system validates every request using HMAC-SHA256 with a per-client secret key (authentication + integrity). On the decommissioned legacy system in the corner, an old config file still references MD5 — it has a red "BROKEN" sticker on it waiting for migration.'
);

-- ---------------------------------------------------------------------------
-- 3.9.1 Stream Ciphers vs Block Ciphers and Modes
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.9.1',
  'Stream Ciphers vs Block Ciphers and Modes of Operation',
  'Block ciphers encrypt fixed-size chunks; stream ciphers encrypt bit-by-bit — the critical difference for security is the mode of operation: ECB is dangerously insecure, while GCM provides both confidentiality and authentication for modern applications.',
  '## Stream Ciphers vs Block Ciphers and Modes of Operation

Symmetric encryption algorithms can be divided into two fundamental types: stream ciphers and block ciphers. Understanding the distinction — and understanding why the mode of operation matters as much as the algorithm — is essential for both the CISSP exam and real-world cryptographic design decisions.

### Stream Ciphers

A stream cipher encrypts data one bit (or one byte) at a time using a keystream — a pseudorandom sequence generated from the key and an initialization vector. Each bit of plaintext is XORed with the corresponding bit of the keystream to produce ciphertext. Stream ciphers are fast and hardware-efficient, making them suitable for real-time communications and environments with constrained resources.

**RC4** (Rivest Cipher 4) is the most well-known stream cipher and is now **broken**. RC4 has statistical biases in its keystream that have been exploited in attacks against WEP (Wireless Encryption Protocol) and early TLS implementations. RC4 was prohibited in TLS by RFC 7465 in 2015. No new system should use RC4.

Modern stream ciphers include **ChaCha20** (used in TLS 1.3 and WireGuard) and **Salsa20**, which avoid the weaknesses of RC4.

### Block Ciphers

A block cipher encrypts a fixed-size block of plaintext (e.g., 128 bits for AES) at a time, producing a fixed-size block of ciphertext. For data larger than one block, a **mode of operation** specifies how multiple blocks are chained together. The choice of mode fundamentally affects the security properties of the overall encryption scheme.

### ECB: Electronic Codebook Mode

ECB encrypts each block independently. The same plaintext block always produces the same ciphertext block. This is a critical vulnerability: ECB does not hide data patterns. The famous "ECB Penguin" demonstrates this visually — encrypting a bitmap image in ECB mode produces an image where the general outline of the original is still clearly visible because uniform color blocks produce uniform ciphertext blocks. ECB mode must never be used for data with patterns or for any real-world encryption application.

### CBC: Cipher Block Chaining

CBC XORs each plaintext block with the previous ciphertext block before encrypting, requiring an initialization vector (IV) for the first block. CBC hides patterns because identical plaintext blocks produce different ciphertext if they are in different positions. The IV must be random (unpredictable) and unique for each encryption operation; reusing an IV with the same key leaks information. CBC is vulnerable to the BEAST attack (in TLS 1.0) and CBC padding oracle attacks (POODLE). CBC does not provide authentication — a separate MAC must be added.

### CTR: Counter Mode

CTR mode converts a block cipher into a stream cipher by encrypting successive values of a counter and XORing the result with plaintext. CTR allows random access to any block (the counter for that block can be computed independently), enables parallel encryption (blocks can be encrypted independently), and avoids padding (the keystream is XORed with arbitrary-length plaintext). CTR does not provide authentication. The counter and IV combination must never be reused with the same key.

### GCM: Galois/Counter Mode

GCM (Galois/Counter Mode) combines CTR encryption with a Galois field authentication tag, providing both **confidentiality** (via CTR) and **authentication** (the GHASH tag). This makes GCM an **Authenticated Encryption with Associated Data (AEAD)** mode — it simultaneously encrypts and authenticates, eliminating the need to combine separate encryption and MAC operations. AES-GCM is the dominant mode in TLS 1.3, IPSec, SSH, and modern storage encryption. The authentication tag detects both tampering and transmission errors. GCM performance benefits from hardware acceleration (PCLMULQDQ instruction on modern CPUs). The nonce (IV equivalent) must be unique for every encryption; nonce reuse in GCM is catastrophic — it allows key recovery.',
  NULL,
  '{"headers": ["Mode", "Type", "Provides Authentication?", "IV/Nonce Required?", "Parallel Processing?", "Critical Weakness/Note"], "rows": [["ECB", "Block (no chaining)", "No", "No", "Yes", "NEVER USE: identical plaintext blocks → identical ciphertext blocks; reveals patterns"], ["CBC", "Block (chained)", "No (add MAC separately)", "Yes — must be random and unpredictable", "Encryption: No (Decryption: Yes)", "BEAST/POODLE attacks; padding oracle attacks; IV reuse leaks info"], ["CTR", "Block → stream (counter)", "No (add MAC separately)", "Yes — counter must be unique", "Yes", "Never reuse counter+key combination; no built-in integrity"], ["GCM", "Block → stream + authentication (AEAD)", "Yes (GHASH tag)", "Yes — nonce must be unique", "Yes", "Nonce reuse = catastrophic (enables key recovery); current TLS 1.3 standard"]]}'::jsonb,
  'The most critical CISSP exam fact about modes: ECB is insecure and should never be used. GCM is the modern standard providing both confidentiality and authentication. RC4 is broken for stream ciphers. Know that CBC requires a random, unpredictable IV and does NOT provide authentication. CTR converts a block cipher to a stream cipher with parallelism. GCM = CTR + authentication = AEAD. Questions about TLS 1.3 encryption: AES-GCM or ChaCha20-Poly1305 (another AEAD stream cipher).',
  'As a manager, mode of operation is a developer and architect decision that has catastrophic consequences if wrong. ECB appearing in your codebase is a red flag during code review. IV reuse in CBC or nonce reuse in GCM are implementation errors that destroy the security of an otherwise correct algorithm. Your cryptographic standards document must specify not just the algorithm (AES) but the mode (GCM) and the IV/nonce management requirements. Automated testing for IV uniqueness should be part of your CI/CD pipeline.',
  'Modes march in order of security: ECB (Embarrassingly Careless Block cipher), CBC (Chained Blocks Correctly), CTR (Counter To Rescue), GCM (Gold Certificate Mode — authenticated!). ECB = Exposed. GCM = Gold. Remember: ECB never, GCM always for modern use.',
  'In the Zurich Server Farm, the cryptography test room has four storage containers. The ECB container has a window — you can see the shape of what''s inside (no pattern hiding). The CBC container is opaque but has a separate padlock for the authentication tag bolted on by hand (separate MAC). The CTR container is opaque, you can access any compartment directly (random access), and no padlock. The GCM container is opaque, sealed, and has an integrated authentication sensor that lights red if tampered — the one every engineer actually uses for production.'
);

-- ---------------------------------------------------------------------------
-- 3.10.1 PKI and Digital Certificates
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.10.1',
  'PKI and Digital Certificates',
  'PKI provides the infrastructure of trust for public key cryptography — using a hierarchy of Certificate Authorities to issue, manage, and revoke X.509 digital certificates that bind a public key to a verified identity.',
  '## PKI and Digital Certificates

Public Key Infrastructure (PKI) is the system of policies, processes, hardware, software, and personnel that enables the creation, distribution, management, storage, and revocation of digital certificates. Without PKI, asymmetric cryptography provides confidentiality and integrity but no identity assurance — you cannot know whether a public key actually belongs to who claims to own it. PKI solves the identity binding problem.

### X.509 Certificates

An X.509 digital certificate (defined in ITU-T X.509, implemented broadly per RFC 5280) binds a public key to a distinguished name (DN) and other identity information, and is digitally signed by a Certificate Authority (CA). The certificate vouches that the CA has verified the identity of the key owner. Key fields in an X.509 certificate include: Subject (who the certificate belongs to), Issuer (who signed it), Serial Number, Validity Period (Not Before, Not After), Subject Public Key Info (the actual public key), Subject Alternative Names (additional domains/IPs), Key Usage extensions (what the key may be used for), and the CA''s digital signature.

### Certificate Authority Hierarchy

**Root CA**: The ultimate trust anchor. Root CA certificates are self-signed — they certify themselves. Browsers and operating systems ship with a pre-installed set of trusted root CA public keys. Root CAs typically operate offline (air-gapped) to protect their private keys.

**Intermediate CA** (Subordinate CA): Certified by the root CA. Intermediate CAs are the operational CAs that actually issue certificates to end entities. If an intermediate CA is compromised, only certificates it issued need to be revoked — the root CA remains trusted. Certificate chains from end-entity certificates trace through one or more intermediate CAs to a trusted root.

**End-Entity Certificate**: The certificate issued to a specific entity (a web server, an email client, a code signing key). End-entity certificates cannot issue certificates to others (the Basic Constraints extension marks them as not a CA).

**Registration Authority (RA)**: An entity that performs identity verification on behalf of a CA. The RA verifies applicant identity and passes approved certificate requests to the CA. Separating registration (identity verification) from issuance (certificate signing) is a security design choice.

### Certificate Revocation

Certificate revocation is the mechanism for invalidating a certificate before its scheduled expiration — due to key compromise, change in subject information, or CA compromise. Two mechanisms exist:

**Certificate Revocation List (CRL)**: A signed, time-stamped list of revoked certificate serial numbers, published periodically by the CA. CRLs can become large and stale between publication cycles (typically hours to days). Clients that check CRLs must download and cache them, introducing latency and bandwidth cost.

**OCSP (Online Certificate Status Protocol, RFC 2560)**: A real-time protocol where a client queries an OCSP responder (operated by the CA) for the current status of a specific certificate. OCSP is faster than downloading a full CRL but creates privacy concerns (the CA''s OCSP responder learns which certificates a client is using). **OCSP Stapling** addresses this: the web server periodically retrieves and caches a signed OCSP response, then "staples" it to the TLS handshake, eliminating the client''s need to contact the OCSP responder separately.

### Certificate Validation Levels

**DV (Domain Validation)**: The CA verifies only that the applicant controls the domain. Fast and automated. Provides no identity information about the organization.

**OV (Organization Validation)**: The CA additionally verifies the applicant''s organizational identity. The organization name appears in the certificate.

**EV (Extended Validation)**: The CA performs extensive identity verification per strict CA/Browser Forum requirements. EV certificates historically displayed a green bar in browsers, though this visual indicator has been removed by most browsers.

### Web of Trust

The Web of Trust is an alternative PKI model used by PGP/OpenPGP that does not use central CAs. Instead, individuals sign each other''s public keys, creating a distributed, peer-validated trust graph. Trust is transitive and decentralized. The web of trust model is appropriate for small communities with direct relationships but does not scale to internet-wide trust.',
  NULL,
  '{"headers": ["Component", "Role", "Trust Relationship", "Key Security Consideration"], "rows": [["Root CA", "Ultimate trust anchor; issues intermediate CA certs", "Self-signed; trusted by browser/OS preloaded cert store", "Must be offline (air-gapped); compromise = catastrophic"], ["Intermediate CA", "Issues end-entity certificates on behalf of root", "Certified by root or another intermediate", "Compromise requires revoking all issued certs; use OCSP/CRL"], ["Registration Authority (RA)", "Verifies identity of certificate applicants", "Delegates to CA for signing", "Must enforce rigorous identity verification procedures"], ["End-Entity Certificate", "Binds public key to verified identity (server, user, code)", "Certified by intermediate CA", "Must be revoked immediately on key compromise"], ["CRL", "List of revoked certificates, periodically published", "Signed by issuing CA", "Can be stale between publications; large size degrades performance"], ["OCSP / OCSP Stapling", "Real-time revocation status check", "OCSP responder operated by CA", "Stapling eliminates client privacy risk; requires server support"]]}'::jsonb,
  'PKI exam areas: (1) Know that the root CA is self-signed and typically offline. (2) Certificate chains: end-entity → intermediate → root. (3) CRL = periodic list (can be stale); OCSP = real-time query; OCSP Stapling = server fetches and provides status to client. (4) Revocation is the most tested operational topic — know the difference between CRL and OCSP and the purpose of each. (5) Web of Trust = PGP model, no central CA, peer-to-peer signing.',
  'As a manager, PKI is infrastructure that is invisible when working and catastrophic when broken. Your certificate inventory and lifecycle management are operational risks: expired certificates cause outages (numerous high-profile service disruptions have been caused by expired certificates), and revoked certificates that are not checked allow compromised credentials to remain trusted. Invest in certificate management automation, expiration alerting, and regular CRL/OCSP configuration audits.',
  'PKI CARES: CA (trust anchor), Accepts (RA verifies identities), Revokes (CRL/OCSP), Expires (validity period), Signs (X.509 cert binds public key to identity). The chain: Root → Intermediate → End-entity. CRL = periodic list; OCSP = real-time; Stapling = server pre-fetches for you.',
  'In the Zurich Server Farm, the PKI room is the most secure. The Root CA is in an offline HSM in a Faraday-caged safe — it only comes out annually for ceremony. The intermediate CA issues certificates daily to servers across the building. On the monitoring screen, OCSP Stapling status shows green for every production server — the OCSP responses are stapled to the TLS handshake so clients don''t need to phone home. A yellow alert blinks: three certificates expire in 14 days — the certificate lifecycle system fires off renewal requests automatically.'
);

-- ---------------------------------------------------------------------------
-- 3.11.1 Key Management Lifecycle
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.11.1',
  'Key Management Lifecycle',
  'NIST SP 800-57 defines the cryptographic key lifecycle from pre-operational generation through active use, distribution, storage, archival, revocation, and destruction — with compromise at any stage undermining every cryptographic guarantee.',
  '## Key Management Lifecycle

A cryptographic algorithm is only as strong as the management of its keys. The strongest encryption algorithm in the world provides no protection if the keys are stored in plaintext on a web server, never rotated, or recoverable by an attacker who has compromised the system. NIST SP 800-57 (Recommendation for Key Management) is the definitive U.S. guidance on cryptographic key management and is directly referenced in CISSP study material.

### Key Generation

Keys must be generated using a cryptographically secure random number generator (CSPRNG). Weak random number generation has been the source of catastrophic vulnerabilities: a 2012 study found that 0.2% of RSA public keys on the internet shared a prime factor with another key, allowing their private keys to be computed — all traced to broken entropy sources in embedded devices during initial key generation. Key generation parameters (algorithm, key size, allowed uses) must comply with the organization''s cryptographic standards.

For high-assurance applications, keys should be generated in a Hardware Security Module (HSM) — a dedicated hardware device that generates keys using a hardware entropy source, performs cryptographic operations without the key ever leaving the hardware boundary, and is tamper-evident or tamper-resistant to protect against physical extraction.

### Key Distribution and Exchange

Keys must be distributed through secure channels. Symmetric keys are typically distributed via asymmetric key encapsulation (the symmetric key is encrypted with the recipient''s public key) or through a key distribution center. Asymmetric public keys are distributed via digital certificates (PKI). The key distribution mechanism must be authenticated — an attacker who can substitute their own public key for the intended recipient''s (a man-in-the-middle attack) can intercept all subsequent communications.

### Active Use and Cryptoperiod

Each key has a defined cryptoperiod — the period during which it is authorized for use. NIST SP 800-57 defines recommended cryptoperiods based on key type and algorithm. Longer cryptoperiods increase the risk that a compromised key exposes more data; shorter cryptoperiods increase operational overhead. Symmetric keys for data encryption might have cryptoperiods of days to years; TLS session keys (ephemeral) have cryptoperiods measured in minutes to hours.

### Key Storage

Active keys must be protected in storage. Options include: hardware security modules (preferred for high-value keys), encrypted key stores (key encryption keys must also be protected), operating system key stores (OS keychain, DPAPI on Windows), and cloud key management services (AWS KMS, Azure Key Vault, Google Cloud KMS). Key encryption key (KEK) hierarchy — keys that protect other keys — must be carefully managed to avoid circular dependency or single points of failure.

### Key Escrow and Recovery

Key escrow is the practice of giving a copy of a key to a trusted third party (escrow agent) so that the key can be recovered if the primary key holder loses access. Key escrow is mandatory in some regulated environments (corporate email encryption where the organization must be able to decrypt employee communications for legal or compliance reasons). Key recovery without escrow (breaking the encryption without the key) is infeasible if strong encryption is used correctly. Key escrow creates additional attack surface — the escrow agent becomes a high-value target.

### Key Revocation and Destruction

Keys must be revoked immediately upon evidence or suspicion of compromise, at the end of their cryptoperiod, or when an employee with key access departs. For asymmetric keys, revocation is handled through PKI mechanisms (CRL, OCSP). For symmetric keys, revocation requires out-of-band notification to all parties holding the key and re-keying of affected systems.

Destroyed keys must be irretrievably eliminated — not just deleted from a key store (the same principles as data destruction apply to key destruction). NIST SP 800-57 requires that key material be overwritten or physically destroyed such that recovery is infeasible. For HSM-stored keys, this typically involves a secure delete operation within the HSM.',
  NULL,
  '{"headers": ["Lifecycle Phase", "Description", "Key Security Requirement", "NIST 800-57 Reference"], "rows": [["Generation", "Key created using CSPRNG, with correct algorithm/size", "Use HSM for high-value keys; strong entropy source required", "Part 1 § 6.1"], ["Distribution/Exchange", "Key delivered securely to authorized parties", "Authenticated channel; protect against MITM; asymmetric encapsulation for symmetric keys", "Part 1 § 6.2"], ["Active Use", "Key used within its defined cryptoperiod", "Enforce cryptoperiod limits; use domain-specific keys (never one key for everything)", "Part 1 § 5.3"], ["Storage", "Key protected when not in active use", "HSM preferred; key encryption key hierarchy; access controls", "Part 1 § 6.3"], ["Key Escrow", "Copy held by trusted third party for recovery", "Escrow agent must be highly trusted; creates additional attack surface", "Part 1 § 8.2.1"], ["Revocation", "Key retired due to compromise or end of need", "Immediate notification to all key holders; CRL/OCSP for PKI keys", "Part 1 § 6.3.6"], ["Destruction", "Key material irretrievably eliminated", "Overwrite or physical destruction; same standard as data destruction", "Part 1 § 8.3"]]}'::jsonb,
  'Key management exam areas: (1) Know all lifecycle phases — generation, distribution, storage, use, archival, revocation, destruction. (2) HSMs are the preferred storage for high-value keys. (3) Cryptoperiod = authorized period of use. (4) Key escrow = third-party copy for recovery (not the same as key recovery attacks). (5) Key compromise at any phase undermines all data encrypted with that key. NIST SP 800-57 is the governing framework — know it by name.',
  'As a manager, key management is where cryptographic theory meets operational reality. The most common real-world failure is not algorithm weakness — it is poor key lifecycle management: keys that never rotate, keys stored in source code repositories, encryption keys sitting in plaintext environment variables, or backup keys stored on the same system as the primary. Mandate HSMs for all PKI private keys and high-value data encryption keys. Automated key rotation reduces the blast radius of any individual key compromise.',
  'GDS-SERD — Keys Go through: Generation, Distribution, Storage, active-use, archival, Revocation, Destruction. Or: "Good Dogs Stay, Sometimes Eat, Run, Die" — Generation, Distribution, Storage, (active) Service, Escrow, Revocation, Destruction. The whole lifecycle in order.',
  'In the Zurich Server Farm key management room, a glass-encased HSM rack holds the organization''s most valuable keys — the private key for the root CA and the master key encryption keys. Each key has a laminated card showing its cryptoperiod, authorized uses, and revocation contact. The rotation schedule is on the wall: data encryption keys rotate quarterly, TLS certificates renew at 90 days. The key destruction log from last quarter shows three retired keys — the technician''s signature confirms the HSM''s secure erase command was executed and verified.'
);

-- ---------------------------------------------------------------------------
-- 3.12.1 Security Models
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.12.1',
  'Security Models',
  'Formal security models (Bell-LaPadula for confidentiality, Biba for integrity, Clark-Wilson for commercial integrity, Brewer-Nash for conflict of interest) provide mathematical frameworks for expressing security policies and proving system compliance with those policies.',
  '## Security Models

Formal security models provide mathematically rigorous frameworks for expressing what a security policy means and proving that a system''s behavior is consistent with that policy. The CISSP exam tests your understanding of the foundational models, what property each protects (confidentiality vs. integrity), and the specific rules each model enforces.

### Bell-LaPadula Model (BLP)

The Bell-LaPadula model (developed for the U.S. Department of Defense in the 1970s) focuses exclusively on **confidentiality**. It was designed to enforce multilevel security (MLS) — ensuring classified information does not flow to lower-classification subjects. BLP uses two mandatory rules:

**Simple Security Property ("no read up")**: A subject at a given classification level cannot read objects at a higher classification level. A Secret-cleared user cannot read Top Secret documents.

**Star Property (*-Property, "no write down")**: A subject at a given classification level cannot write to objects at a lower classification level. A Top Secret-cleared user cannot write to a Secret document (to prevent leaking classified information downward).

**Strong Star Property**: A subject can only read and write objects at their exact classification level (a more restrictive variant).

BLP ignores integrity — it was designed for an environment where confidentiality was the primary concern (classified military data), not a commercial environment where data accuracy matters.

### Biba Model

The Biba model (developed as a complement to BLP) focuses exclusively on **integrity**. It is the "mirror image" of BLP, with the access directions reversed:

**Simple Integrity Property ("no read down")**: A subject cannot read objects at a lower integrity level (to prevent contamination of high-integrity processes with low-quality data).

**Star Integrity Property ("no write up")**: A subject cannot write to objects at a higher integrity level (to prevent low-integrity subjects from corrupting high-integrity data).

Biba is relevant to operational environments where data accuracy matters most — banking, medical records, process control systems.

### Clark-Wilson Model

The Clark-Wilson model addresses **integrity in commercial environments** through a different mechanism than Biba. Instead of lattice-based access controls, Clark-Wilson defines:

**Well-Formed Transactions (WFT)**: All modifications to data must go through controlled procedures (programs). Raw data cannot be modified directly by users.

**Separation of Duty**: Different functions in a transaction are separated so no single user can perform all steps of a fraudulent transaction.

**Constrained Data Items (CDI)**: Data that must be protected (e.g., financial records) accessed only through transformation procedures (TPs).

**Unconstrained Data Items (UDI)**: Raw input data not yet validated.

Clark-Wilson maps well to real commercial systems: accounting software with enforced workflows, ERP systems with separation of duties, and audit logging of all data modifications.

### Brewer-Nash (Chinese Wall) Model

The Brewer-Nash model addresses **conflicts of interest** — it prevents an entity from accessing information that could create a conflict of interest given what they have already accessed. Originally designed for consulting firms (consultants who access data from one client should not be able to access data from competing clients), it is also applied in financial services (analysts who trade for one client should not see confidential information from a competing client).

Brewer-Nash creates access barriers dynamically: once a subject accesses information from one company in a conflict-of-interest class, they are automatically prevented from accessing information from competing companies in the same class. The barriers are not static — they are determined by the subject''s access history.

### Lattice Model

The lattice model is a mathematical framework underlying both BLP and Biba. A lattice defines security levels in a partial order, with a greatest lower bound and least upper bound for any two elements. Subjects and objects are assigned positions on the lattice, and access rules are expressed in terms of lattice relationships. The concept of "dominance" — one security level dominating another — is central to lattice-based access decisions.',
  NULL,
  '{"headers": ["Model", "Protects", "Key Rules", "Origin/Context", "Real-World Analogy"], "rows": [["Bell-LaPadula", "Confidentiality", "No read up (*), no write down (*-property)", "U.S. DoD, classified information", "Intelligence analyst cannot read higher-classification files; cannot copy classified content to lower-classification document"], ["Biba", "Integrity", "No read down, no write up", "Complement to BLP; commercial/operational", "Production system cannot read unvalidated input; unvalidated user cannot write to verified financial database"], ["Clark-Wilson", "Integrity (commercial)", "Well-formed transactions, separation of duty, CDI/UDI/TP", "Commercial accounting and transaction systems", "ERP: a clerk enters a purchase order, a supervisor approves, accounting closes — no single person does all three"], ["Brewer-Nash (Chinese Wall)", "Conflict of interest prevention", "Once you access data from Company A, access to competing Company B''s data is blocked", "Consulting, investment banking", "An M&A advisor who sees Client A''s confidential financials is automatically blocked from accessing Client B (a competitor) data"]]}'::jsonb,
  'CISSP exam pattern for security models: (1) Identify whether the question is about confidentiality (Bell-LaPadula) or integrity (Biba, Clark-Wilson). (2) BLP rules: no read up, no write down. Biba is the REVERSE: no read down, no write up. (3) Clark-Wilson uses well-formed transactions and separation of duty — the commercial integrity model. (4) Brewer-Nash = conflict of interest / Chinese Wall. (5) The exam will give you a scenario (e.g., "a financial advisor cannot access competing client data after viewing the first client''s files") and ask which model applies — that is Brewer-Nash.',
  'As a manager, these models translate directly into policy decisions. BLP informs your data classification access controls. Biba informs data quality controls in operational systems (why production databases should not accept direct user edits, only validated application writes). Clark-Wilson informs your ERP workflow design and separation of duties requirements. Brewer-Nash informs your conflict of interest policies in financial services or consulting. Most real systems implement combinations of these models without naming them.',
  'BBC-B for the models: Bell-LaPadula (Blocks reading up — confidentiality), Biba (Blocks integrity damage — integrity, reverse of BLP), Clark-Wilson (Commercial integrity with Controlled workflows), Brewer-Nash (Blocks competing client access — conflict of interest). BLP = Confidentiality; Biba = Integrity; Clark-Wilson = Commercial; Brewer-Nash = Conflict blocker.',
  'In the Zurich Server Farm briefing room, four diagrams are on the wall. The BLP diagram shows a classified document pyramid — arrows going down for reads, never up, and writes never flowing down. The Biba diagram shows the same pyramid flipped — the concern is corrupted data flowing upward into high-integrity systems. The Clark-Wilson diagram shows an ERP flowchart with three distinct roles and no shortcuts. The Brewer-Nash diagram shows two competing pharma companies — the consultant''s access card changes color the moment they touch one company''s folder, locking out the other permanently.'
);

-- ---------------------------------------------------------------------------
-- 3.13.1 Trusted Computing Base and Security Kernel
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.13.1',
  'Trusted Computing Base and Security Kernel',
  'The Trusted Computing Base (TCB) is the totality of hardware, firmware, and software that enforces a security policy; the security kernel is the core mechanism within the TCB that mediates all access through the reference monitor concept.',
  '## Trusted Computing Base and Security Kernel

The **Trusted Computing Base (TCB)** is the entirety of hardware, firmware, and software components in a system that must be trusted to correctly enforce the system''s security policy. A component is part of the TCB if its failure or compromise could allow the security policy to be violated. Every other component in the system is "untrusted" — not because it is malicious, but because the security of the overall system does not depend on its correct operation.

The intuition: if a web application has a bug, it might expose application data. That is bad, but it is not necessarily a violation of the underlying security policy enforced by the OS and hardware. If the OS kernel has a bug that allows privilege escalation, the TCB has been compromised and no application-level control can compensate.

### TCB Components

The TCB typically includes: the hardware security mechanisms (memory protection, execution rings/privilege levels, I/O protection), operating system kernel, security-critical firmware (UEFI, BIOS, microcode), and security-enforcing components (access control modules, cryptographic subsystems). The goal in secure system design is to minimize the TCB — the smaller the TCB, the smaller the attack surface that must be perfectly correct, and the more feasible it becomes to formally verify the TCB''s correctness.

### The Reference Monitor

The **reference monitor** is a conceptual model — not a specific piece of software — describing the properties that the security kernel must satisfy. The reference monitor concept requires that every access by any subject to any object must pass through the reference monitor, which decides whether to allow or deny the access based on the security policy. A reference monitor must satisfy three properties:

1. **Complete mediation**: Every access to every object must be validated — no bypass paths exist.
2. **Tamperproof**: The reference monitor cannot be modified by untrusted processes; its integrity is protected.
3. **Verifiable (small enough to be analyzed)**: The reference monitor must be simple enough to be thoroughly analyzed, tested, and formally verified for correctness.

### The Security Kernel

The **security kernel** is the hardware, firmware, and software components that implement the reference monitor concept. It is the concrete implementation of the abstract reference monitor. The security kernel enforces all access controls, is protected from modification, and mediates all access to system resources. In modern operating systems, the security kernel roughly corresponds to the privileged kernel mode components responsible for access control: the OS kernel''s security policy enforcement mechanisms, mandatory access control (MAC) subsystems (like SELinux or AppArmor on Linux), and hardware memory protection mechanisms.

### Trusted Path

A **trusted path** is a mechanism that ensures a user communicating with the TCB is actually communicating with the TCB — not with a malicious application that is intercepting or mimicking the TCB interface. On Windows, the Secure Attention Sequence (CTRL+ALT+DEL) activates a trusted path to the login interface, ensuring that no user-mode malware can intercept login credentials. Without a trusted path, a malicious application could present a fake login screen and steal credentials before they reach the real authentication system.

### Evaluation and Assurance: Common Criteria

The **Common Criteria (ISO/IEC 15408)** is the international standard for evaluating the security properties of IT products. Common Criteria evaluations result in Evaluation Assurance Levels (EAL1 through EAL7) that represent increasing rigor of the evaluation process. Higher EAL levels require more formal specification, testing, and verification of the TCB. EAL7 requires formal mathematical proof of correctness — achievable only for very small, well-defined systems. Most commercial products achieve EAL2 through EAL4+.',
  NULL,
  '{"headers": ["Concept", "Definition", "Design Goal", "Example"], "rows": [["Trusted Computing Base (TCB)", "All hardware, firmware, and software that must be correct to enforce the security policy", "Minimize size to reduce attack surface", "OS kernel + hardware memory protection + security firmware"], ["Reference Monitor", "Conceptual model requiring complete mediation, tamperproofness, and verifiability", "Ensure every access is controlled; no bypass exists", "Abstract requirement that the security kernel must satisfy"], ["Security Kernel", "Concrete implementation of the reference monitor in hardware/software", "Be small, verifiable, and impossible to bypass", "SELinux MAC policy enforcement in Linux kernel; Windows security reference monitor"], ["Trusted Path", "Mechanism ensuring user communicates with TCB directly, not with an impersonator", "Prevent malicious software from intercepting sensitive interactions", "Windows CTRL+ALT+DEL secure attention sequence for login"]]}'::jsonb,
  'TCB exam areas: (1) TCB = everything that must be trusted; not a list of trusted applications but a boundary of trust. (2) Reference monitor = concept (3 properties: complete mediation, tamperproof, verifiable/small). (3) Security kernel = implementation of reference monitor. (4) Trusted path = direct, uninterruptible communication channel between user and TCB. (5) Common Criteria EAL levels measure evaluation rigor, not absolute security. Minimize TCB size is a design principle — smaller TCB = easier to verify.',
  'As a manager, the TCB concept applies directly to your system architecture decisions. Every component you add to the trusted base increases your attack surface and makes verification harder. Privileged access must be minimal — this is the principle of least privilege applied at the architecture level. When evaluating security products, Common Criteria certification is a useful indicator of evaluation rigor but does not guarantee fitness for purpose in your specific environment.',
  'TCB-RMP: Trusted Computing Base (everything trusted), Reference Monitor (the Policy enforcer), trusted Path (the direct channel). Remember: the Reference Monitor must be CTV — Complete mediation, Tamperproof, Verifiable (small enough). CTV = the three properties of a reference monitor.',
  'In the Zurich Server Farm, the most secure room is labeled "TCB — Authorized Personnel Only." Inside, the hardware memory protection chips, OS kernel modules, and cryptographic firmware all coexist — the entire trusted base of the system. The security kernel runs in the innermost ring (Ring 0), checking every access request before allowing it through (reference monitor implemented). The operator terminal has a dedicated keyboard that uses the trusted path — pressing the special key sequence opens a protected communication channel directly to the kernel, bypassing any user-space process.'
);

-- ---------------------------------------------------------------------------
-- 3.14.1 Cloud Computing Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.14.1',
  'Cloud Computing Security',
  'Cloud security depends on understanding the shared responsibility model — where the cloud provider''s security obligations end and the customer''s begin — across IaaS, PaaS, and SaaS service models and across public, private, hybrid, and community deployment models.',
  '## Cloud Computing Security

Cloud computing fundamentally changes the security responsibility landscape. When you move workloads to the cloud, you are not outsourcing security — you are dividing it between the cloud service provider (CSP) and your organization according to a shared responsibility model that varies by service type. The CISSP exam tests your understanding of what each cloud service model means for security responsibility and what attack vectors are specific to cloud environments.

### NIST Cloud Service Models (NIST SP 800-145)

**IaaS (Infrastructure as a Service)**: The CSP provides virtualized compute, storage, and networking. The customer controls everything from the operating system layer upward: OS, middleware, runtime, applications, and data. Examples: AWS EC2, Azure VMs, Google Compute Engine. The customer is responsible for OS patching, application security, identity management, and data protection. The CSP is responsible for the hypervisor, physical infrastructure, and network infrastructure.

**PaaS (Platform as a Service)**: The CSP provides the runtime, middleware, and OS in addition to infrastructure. The customer controls only applications and data. Examples: AWS Elastic Beanstalk, Google App Engine, Azure App Service. The customer loses control over OS-level security but also loses the OS security burden. Security focus shifts to application code, API security, and data protection.

**SaaS (Software as a Service)**: The CSP provides the entire application stack. The customer controls only data content and access configuration. Examples: Microsoft 365, Salesforce, Google Workspace. The customer''s security responsibilities are primarily: identity and access management, data classification, and configuration of security settings within the SaaS platform. The CSP handles virtually everything else.

### Shared Responsibility Model

The shared responsibility model divides security ownership:

- **Physical security**: Always the CSP''s responsibility in all service models.
- **Infrastructure and hypervisor**: CSP in all service models.
- **Operating system**: Customer in IaaS; CSP in PaaS and SaaS.
- **Applications**: Customer in IaaS and PaaS; CSP in SaaS.
- **Data**: Always the customer''s responsibility in all service models — even in SaaS, the customer is responsible for data classification and deciding what data goes into the platform.
- **Identity and access management**: Shared, but the customer is responsible for configuring it correctly.

A common misunderstanding: moving to the cloud does not transfer data protection responsibility to the CSP. You remain responsible for your data regardless of service model.

### Cloud Deployment Models

**Public cloud**: Shared infrastructure, multi-tenant, managed by the CSP, available to the general public. Lowest cost, highest shared risk.

**Private cloud**: Dedicated infrastructure for one organization, either on-premises or hosted by a CSP. Higher cost, lower shared risk, regulatory preference for sensitive workloads.

**Hybrid cloud**: Combination of public and private cloud, connected through secure links. Enables data and workload portability.

**Community cloud**: Shared infrastructure for organizations with common concerns (e.g., government agencies with FedRAMP requirements, healthcare organizations under HIPAA).

### Cloud-Specific Attack Vectors

**Misconfiguration**: The leading cause of cloud data breaches. Publicly accessible S3 buckets, overly permissive IAM roles, and unencrypted cloud databases are common misconfigurations. Cloud Security Posture Management (CSPM) tools continuously scan for misconfigurations.

**Insecure APIs**: Cloud management is API-driven. Insecure API endpoints, API key exposure, and lack of API authentication are major attack vectors.

**Shared tenancy risks**: VM escape and hypervisor attacks (though rare) could theoretically allow cross-tenant access. Side-channel attacks exploiting shared hardware resources (e.g., Spectre/Meltdown in public cloud) are a concern for sensitive workloads.

**Insufficient access controls**: Over-privileged service accounts, unused permissions, and lack of MFA for cloud console access are common entry points.

### CSA STAR and Cloud Security Assurance

The Cloud Security Alliance (CSA) Cloud Controls Matrix (CCM) is a cybersecurity control framework for cloud computing aligned with ISO 27001, NIST, and PCI DSS. The CSA STAR (Security, Trust, Assurance, and Risk) registry provides a public repository of CSP security assessments at two levels: STAR Level 1 (self-assessment using CSA CAIQ) and STAR Level 2 (third-party audit, equivalent to ISO 27001 plus CSA CCM).',
  NULL,
  '{"headers": ["Responsibility Area", "IaaS Customer", "PaaS Customer", "SaaS Customer", "Always CSP"], "rows": [["Physical infrastructure", "Not responsible", "Not responsible", "Not responsible", "Physical security, data center, hardware"], ["Hypervisor / virtualization", "Not responsible", "Not responsible", "Not responsible", "Hypervisor management and isolation"], ["Operating system", "CUSTOMER", "Not responsible (CSP manages)", "Not responsible (CSP manages)", "Physical host OS"], ["Middleware / runtime", "CUSTOMER", "Not responsible", "Not responsible", "-"], ["Application code", "CUSTOMER", "CUSTOMER", "Not responsible (CSP manages)", "-"], ["Data", "CUSTOMER", "CUSTOMER", "CUSTOMER", "-"], ["IAM configuration", "CUSTOMER", "CUSTOMER", "CUSTOMER (within SaaS platform)", "-"]]}'::jsonb,
  'Cloud security exam areas: (1) Shared responsibility model — data is always the customer''s responsibility. (2) IaaS: customer owns OS and above. PaaS: customer owns apps and data. SaaS: customer owns data and IAM config. (3) Misconfiguration is the #1 cloud security risk. (4) Public/private/hybrid/community cloud definitions. (5) CSA STAR is the cloud-specific assurance framework. Watch for questions that try to transfer data responsibility to the CSP — that is always a wrong answer.',
  'As a manager, the most dangerous assumption you can make about cloud security is that the CSP handles it. They handle the infrastructure. You handle your data, your users, your applications, and your configurations — and misconfiguration of those elements is the cause of virtually every major cloud breach. Your cloud security program must include: IAM governance (principle of least privilege, mandatory MFA), continuous misconfiguration scanning (CSPM), encryption of data at rest and in transit with customer-managed keys, and a clear data classification policy for what can and cannot go into cloud services.',
  'IPPI-DA — IaaS gives you Infrastructure (you manage the Platform, Process, Identity, Application, Data — everything above the physical). PaaS gives you a Platform (you manage Identity, Application, Data). SaaS gives you Software (you manage Identity and Data). The Data is ALWAYS yours. Shared responsibility = shared ownership, shared accountability.',
  'In the Zurich Server Farm briefing room, a whiteboard shows the shared responsibility stack as a building. The foundation (physical hardware, data center) is labeled "CSP ALWAYS." The basement level (hypervisor) is labeled "CSP ALWAYS." In IaaS, the building from the ground floor up is yours to furnish and secure. In PaaS, the building is pre-furnished to the second floor — you just configure the rooms. In SaaS, the building is fully furnished — you just decide what to put in the safe (your data). The safe is always yours.'
);

-- ---------------------------------------------------------------------------
-- 3.14.2 Virtualization and Hypervisor Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.14.2',
  'Virtualization and Hypervisor Security',
  'Hypervisors create isolated virtual machines by abstracting hardware — Type 1 (bare-metal) runs directly on hardware with a smaller attack surface, while Type 2 (hosted) runs on an OS; VM escape attacks and container breakout represent the primary isolation failure risks.',
  '## Virtualization and Hypervisor Security

Virtualization allows multiple virtual machines (VMs) to run on a single physical host, with each VM isolated from the others by a software layer called the **hypervisor** (also called a Virtual Machine Monitor or VMM). Virtualization is foundational to cloud computing, data center efficiency, and security isolation architectures. For the CISSP exam, the focus is on the types of hypervisors, the security boundaries they create, and the attack vectors specific to virtualized environments.

### Type 1 Hypervisor (Bare-Metal)

A Type 1 hypervisor runs directly on the physical hardware, without a host operating system. The hypervisor itself is the operating system at the hardware level. Examples include VMware ESXi, Microsoft Hyper-V, Citrix XenServer, and KVM (when configured as a bare-metal host). Type 1 hypervisors have a smaller attack surface because there is no host OS layer that could be compromised to reach the hypervisor. They are used in enterprise data centers and cloud providers (AWS, Azure, and Google Cloud all use custom Type 1 hypervisors).

### Type 2 Hypervisor (Hosted)

A Type 2 hypervisor runs as an application on top of a conventional host operating system. Examples include VMware Workstation, Oracle VirtualBox, and Parallels. The host OS runs first, and the hypervisor runs within it. Type 2 hypervisors have a larger attack surface: a compromised host OS can potentially compromise all VMs running within the hypervisor. Type 2 hypervisors are appropriate for development, testing, and individual workstations but are not appropriate for production multi-tenant environments.

### VM Escape

**VM escape** is the most severe security failure in a virtualized environment — it occurs when an attacker running in a guest VM is able to break out of the VM''s isolation boundary and execute code in the context of the hypervisor or another VM. A successful VM escape gives the attacker access to all other VMs on the same host and potentially the underlying hardware. VM escape vulnerabilities have been discovered in real hypervisors (e.g., VMware VMSA advisories, XSA advisories for Xen) and are treated as critical severity. Mitigations include: keeping hypervisors fully patched, minimizing the guest-to-hypervisor interface (reducing attack surface), and using hardware-assisted virtualization (Intel VT-x, AMD-V) which enforces isolation at the CPU level.

### Container Security

Containers (Docker, containerd, Kubernetes pods) are not virtual machines — they share the host OS kernel and do not have hardware-level isolation. Container isolation is enforced through Linux kernel features: **namespaces** (process ID, network, filesystem isolation), **cgroups** (resource limits), **seccomp** (system call filtering), and **AppArmor/SELinux** (MAC policy). Because containers share the kernel, a kernel vulnerability exploited from within a container can potentially affect all containers on the host and the host itself.

**Container breakout** (the container equivalent of VM escape) involves exploiting a kernel vulnerability, misconfigured volume mounts, or a privileged container to gain access to the host or other containers. Common container security misconfigurations include: running containers as root, using --privileged mode unnecessarily, mounting sensitive host paths (like /var/run/docker.sock), and using unverified base images with known vulnerabilities.

Container security best practices: run containers as non-root, use read-only root filesystems, limit capabilities with --cap-drop, use image scanning to identify vulnerable layers, and enforce admission control policies (OPA/Gatekeeper in Kubernetes).',
  NULL,
  '{"headers": ["", "Type 1 Hypervisor", "Type 2 Hypervisor", "Containers"], "rows": [["Runs on", "Directly on hardware", "Host OS", "Host OS + shared kernel"], ["Attack surface", "Smaller (no host OS)", "Larger (host OS + hypervisor)", "Large (shared kernel — no hardware isolation)"], ["Isolation level", "Hardware-enforced", "Software (host OS mediated)", "OS-level (kernel namespaces + cgroups)"], ["Examples", "VMware ESXi, Hyper-V, KVM, Xen", "VMware Workstation, VirtualBox, Parallels", "Docker, containerd, Kubernetes"], ["Primary use case", "Data center, cloud production", "Dev/test workstations", "Microservices, application packaging"], ["Escape risk", "VM escape (severe, rare, patched rapidly)", "VM escape + host OS compromise", "Container breakout (more common than VM escape)"]]}'::jsonb,
  'Virtualization exam areas: (1) Type 1 = bare-metal (smaller attack surface, enterprise/cloud use). Type 2 = hosted (larger attack surface, desktop/dev use). (2) VM escape = breaking out of a VM into the hypervisor — the most severe virtualization attack. (3) Containers are NOT VMs — they share the host kernel, so isolation is weaker. (4) Container breakout is possible through kernel vulnerabilities or misconfigurations (privileged containers, sensitive volume mounts). (5) The exam may ask to distinguish between the types based on a description — focus on where the hypervisor runs (on hardware vs. on an OS).',
  'As a manager, your virtualization security obligations depend on your infrastructure model. In a public cloud IaaS environment, the CSP''s hypervisor security is their responsibility; your responsibility is securing the OS and applications inside your VMs. On-premises virtualization puts hypervisor security squarely on your team — keep ESXi or Hyper-V fully patched; it is the foundation that every VM depends on. For containers in Kubernetes, privileged containers and exposed Docker socket mounts are the most common issues found in security audits — mandate image scanning and admission policies before containers reach production.',
  'Type 1 = directly ON the metal (think Type 1 as "First Class" — directly on the hardware, no intermediary). Type 2 = ON TOP of an OS (think "Second Class" — goes through the OS). Containers = sharing the kernel (no ticket at all — riding on everyone else''s train). VM Escape = the worst outcome: breaking out of your assigned compartment.',
  'In the Zurich Server Farm, the production rack runs VMware ESXi Type 1 — the hypervisor boots directly from the hardware with no OS underneath. The developer workstations run VirtualBox (Type 2) on Windows for testing. The container platform (Kubernetes) runs in the VMs, adding a third layer of application isolation. The security team''s monitoring dashboard has a VM escape detection alert at the top of the threat priority list — it has never fired in production, but it would be the most critical incident of the year if it did.'
);

-- ---------------------------------------------------------------------------
-- 3.14.3 Industrial Control Systems and IoT Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.14.3',
  'Industrial Control Systems and IoT Security',
  'ICS/SCADA systems control physical processes in critical infrastructure — their availability and integrity requirements, air-gap assumptions, and legacy protocol weaknesses demand a different security approach from IT; the Purdue model provides the architecture framework for OT/IT segmentation.',
  '## Industrial Control Systems and IoT Security

Industrial Control Systems (ICS) and the Internet of Things (IoT) represent a security domain where the consequences of failure extend far beyond data loss — they include physical damage, environmental harm, and loss of human life. Power grids, water treatment facilities, pipelines, manufacturing plants, and transportation systems all depend on ICS. The convergence of operational technology (OT) networks with corporate IT networks has dramatically increased the attack surface for these critical systems.

### ICS Components

**SCADA (Supervisory Control and Data Acquisition)**: Centralized monitoring and control systems that collect data from, and send commands to, remote field devices across large geographic areas. SCADA systems are used in utilities (power grids, water systems), oil and gas pipelines, and transportation networks.

**PLC (Programmable Logic Controller)**: An industrial digital computer hardened for manufacturing environments. PLCs directly interface with physical systems — sensors, actuators, motors, valves, conveyor belts — executing control logic in real time. A PLC controlling a valve in a water treatment plant is a direct safety system.

**DCS (Distributed Control System)**: Similar to SCADA but designed for process control within a single facility (chemical plant, refinery). DCS architectures distribute control functions across many dedicated controllers with centralized monitoring.

**HMI (Human-Machine Interface)**: The operator interface for ICS systems — the screen on which operators monitor sensor readings and issue commands. HMI compromise can mislead operators about the physical state of the system (as in the Stuxnet attack, which displayed false "normal" readings while physically destroying centrifuges).

### The Purdue Model (PERA)

The Purdue Enterprise Reference Architecture (PERA, also called the Purdue Model or ISA-99/IEC 62443 reference architecture) divides ICS environments into hierarchical levels that define the architecture for OT/IT network segmentation:

- **Level 0**: Physical process (sensors, actuators, physical equipment)
- **Level 1**: Process control (PLCs, DCS controllers directly controlling Level 0)
- **Level 2**: Supervisory control (SCADA HMI, engineering workstations for Level 1)
- **Level 3**: Operations/site business (manufacturing operations management, data historians)
- **Level 3.5/DMZ**: Industrial DMZ separating OT from IT (data diode, secure data transfer)
- **Level 4**: Enterprise network (corporate IT — ERP, email, internet access)
- **Level 5**: Internet/external

The DMZ between Level 3 and Level 4 is the critical security boundary — it controls data exchange between OT and IT without allowing direct connectivity that could propagate malware or allow attackers to pivot from IT to OT.

### OT vs IT Security Differences

IT security prioritizes Confidentiality, Integrity, Availability (CIA in that order). OT security inverts this: **Availability** is paramount (a power plant that shuts down due to a security event may cause harm), **Integrity** is critical (incorrect sensor readings or control commands have physical consequences), and **Confidentiality** is important but secondary to maintaining operations. Patching OT systems — standard IT practice — may require a plant shutdown or a maintenance window that occurs annually. Many OT systems run for decades on software that cannot be patched because the vendor no longer exists or because testing the patch requires extensive validation in a physical environment.

### ICS Attack Surface

Historic ICS assumptions of air-gap isolation (no connection to IT or internet) no longer hold for most installations. Remote monitoring, vendor remote access, and IT/OT convergence have created connectivity. Notable ICS attacks include: Stuxnet (2010, first known nation-state ICS weapon — targeted Iranian nuclear centrifuges via PLC logic modification); Ukraine power grid attack (2015/2016, used BlackEnergy and Industroyer malware to cause power outages); Colonial Pipeline (2021, ransomware hit IT network, OT shutdown was precautionary but caused significant fuel supply disruption).

### IoT Security

IoT devices (sensors, cameras, thermostats, medical devices, industrial sensors) are characterized by: limited compute resources (no room for traditional security software), long operational lifetimes (deployed and forgotten), often no patch mechanism, default credentials that are never changed, and direct physical interaction with the environment. The Mirai botnet (2016) compromised hundreds of thousands of IoT devices using default credentials to launch the largest DDoS attacks at the time.

IoT security best practices include: network segmentation (IoT devices on separate VLANs, firewalled from corporate network), mandatory credential change on deployment, firmware update mechanisms with cryptographic verification, device lifecycle management (decommission and replace unpatched devices), and network monitoring for anomalous IoT device behavior.',
  NULL,
  '{"headers": ["ICS Component", "Function", "Attack Target / Consequence", "Primary Security Control"], "rows": [["PLC", "Direct process control of physical equipment (valves, motors, actuators)", "Logic modification causes physical damage or safety incident (Stuxnet)", "Network isolation (Purdue Level 1-2); change control on PLC logic; anomaly detection"], ["SCADA", "Centralized monitoring and control across large area", "Command injection, false readings, denial of service to operators", "Authentication to SCADA server; network segmentation; OPC security"], ["HMI", "Operator interface — monitoring and command entry", "False display of normal conditions during attack (Stuxnet)", "Application whitelisting on HMI workstations; display integrity validation"], ["Data Historian", "Records OT time-series data for analysis and compliance", "Data exfiltration; modification of historical records", "One-way data transfer (data diode) from OT to IT; strict access control"], ["IoT Device", "Sensor, actuator, or edge computing device", "Botnet recruitment, lateral movement, physical process manipulation", "Network segmentation; default credential change; firmware integrity verification"]]}'::jsonb,
  'ICS/IoT exam areas: (1) OT security priority order is Availability, Integrity, Confidentiality (AIC — reverse of IT''s CIA). (2) Purdue Model defines the hierarchical OT/IT architecture: Levels 0-5, with DMZ between Level 3 and Level 4 as the critical security boundary. (3) Air-gap assumption is largely obsolete for modern ICS. (4) Stuxnet is the canonical ICS attack example — PLC logic modification to physically destroy centrifuges while displaying false normal readings. (5) IoT security challenges: resource-constrained, long-lived, no patch mechanism, default credentials.',
  'As a manager, ICS and OT security requires a fundamentally different governance approach from IT. Patching SLAs measured in days are meaningless for systems where a patch requires a plant shutdown. Start with network segmentation: the single highest-impact ICS security control is ensuring that your corporate IT network and your OT network are properly segmented with controlled data exchange points. Eliminate direct OT internet connectivity entirely. Treat vendor remote access for OT systems as the highest-risk access pathway in your environment — use a PAM solution with session recording and time-limited credentials for every vendor connection.',
  'Purdue Model Levels: Process (0), PLCs (1), Supervisory/SCADA (2), Operations (3), DMZ (3.5), Enterprise IT (4), Internet (5). OT CIA = AIC (Availability first — the plant must run). Air gaps: mostly myth for modern ICS. Stuxnet = nation-state PLC attack. Mirai = IoT botnet via default passwords. IoT = resource-constrained, long-lived, patch-resistant.',
  'In the Zurich Server Farm, the architecture diagram shows the Purdue model applied to a manufacturing client. Levels 0-2 (PLCs and SCADA) are on a completely separate OT network — no direct routing to the corporate LAN. Level 3.5 is an industrial DMZ with two firewalls and a data diode (data flows one-way from OT to IT — operational data to the historian — but no commands can flow from IT to OT). The data historian sits in the DMZ, accessible to both the SCADA (Level 3) and the corporate analytics team (Level 4) — but through separate, controlled interfaces. Vendor remote access to OT uses a dedicated jump server in the DMZ with PAM session recording — every command the vendor types is logged.'
);

-- ---------------------------------------------------------------------------
-- 3.15.1 Physical Security: Fire Suppression
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.15.1',
  'Physical Security: Fire Detection and Suppression',
  'Fire classes determine the correct suppression agent — water damages electronics (Class C), Halon is effective but ozone-depleting (banned for new systems), and clean agent suppressants (FM-200, Novec 1230) protect equipment without residue while fixed CO2 systems require evacuation before discharge.',
  '## Physical Security: Fire Detection and Suppression

Fire is one of the most destructive physical threats to information systems. Data centers, server rooms, and communications facilities require fire detection and suppression systems specifically designed for the electronic equipment environment — not just general-purpose building fire systems. The CISSP exam tests fire classifications, detection technology, and suppression agent selection, with particular focus on the Halon transition to clean agent alternatives.

### Fire Classes

Understanding fire classes is essential for selecting appropriate suppression agents:

- **Class A**: Ordinary combustibles — wood, paper, cloth, most plastics. Extinguished with water or dry chemicals.
- **Class B**: Flammable liquids and gases — gasoline, diesel, solvents, propane. Extinguished with CO2, dry chemical, or foam.
- **Class C**: Energized electrical equipment. Cannot be extinguished with water (electrocution risk) or conductive agents. Requires non-conductive suppression agents (CO2, clean agents). Server rooms and data centers typically have Class C fires.
- **Class D**: Combustible metals — magnesium, titanium, sodium. Specialized dry powder extinguishants only.
- **Class K**: Cooking oils and fats. Wet chemical suppression. (Kitchen/cafeteria environments.)

### Fire Detection Systems

**Smoke detectors**: The primary detection technology in data centers. Two types:
- **Ionization**: Uses a radioactive source to ionize air; smoke particles disrupt the ion flow, triggering the alarm. Faster to detect fast-flaming fires; slower on smoldering fires.
- **Photoelectric**: Uses a light beam; smoke particles scatter the light, triggering the alarm. Faster to detect smoldering fires.

**Heat detectors**: Trigger on temperature reaching a fixed threshold (fixed-temperature detector) or on rapid rate of temperature rise (rate-of-rise detector). Less likely to false-alarm than smoke detectors in dusty or steamy environments.

**Very Early Smoke Detection Apparatus (VESDA)**: Aspirating smoke detectors that actively draw air samples through a laser detection chamber. Designed for data centers and high-value facilities — detect smoke at concentrations far below what standard smoke detectors can sense, providing very early warning. VESDA systems can detect a fire before visible smoke develops, enabling evacuation and suppression before significant damage occurs.

**Flame detectors**: Detect the infrared or ultraviolet signatures of an actual flame. Used in high-risk industrial environments.

### Fire Suppression Systems

**Water-based sprinklers**: Effective for Class A fires but highly damaging to electronic equipment. Two types relevant to data center environments:
- **Wet pipe**: Water is always present in the pipes under pressure; sprinklers discharge immediately on activation. Fast response but highest equipment damage risk if a sprinkler activates accidentally.
- **Dry pipe**: Pipes contain pressurized air/nitrogen; water is held back until a sprinkler activates and the air pressure releases. Slower response but eliminates leak risk from wet pipes above sensitive equipment. Pre-action systems add a smoke detection step before water releases, requiring two independent triggers (smoke detection + sprinkler activation) to discharge water — further reducing accidental discharge.

**Halon**: A gaseous suppression agent (Halon 1301 and Halon 1211) that was the dominant data center suppression agent for decades. Extremely effective, leaves no residue, and does not damage electronics. However, Halon is an ozone-depleting substance (ODS) and has been banned for new production under the Montreal Protocol (1987) and phased out of new installations. Existing Halon systems can be maintained and recharged from stockpiles but are increasingly expensive and environmentally problematic.

**Clean Agents** (Halon alternatives): Gaseous suppression agents that suppress fire without water or residue and are safe for occupied spaces:
- **FM-200 (HFC-227ea)**: The most widely deployed Halon replacement. Effective and equipment-safe. Has global warming potential concerns but far less ozone depletion than Halon.
- **Novec 1230 (FK-5-1-12)**: 3M''s clean agent with very low global warming potential. Electrically non-conductive, leaves no residue, safe for occupied spaces. Becoming the preferred choice for new data center installations.

**Carbon Dioxide (CO2)**: Extremely effective but displaces oxygen — immediately dangerous to humans. CO2 systems require complete room evacuation before discharge. Appropriate for unoccupied spaces, electrical vaults, and after-hours scenarios with alarm interlocks to ensure evacuation.

**Water Mist Systems**: Fine water mist (very small droplets) suppresses fire while minimizing water damage compared to traditional sprinklers. Can be used around some electronics. Not as effective as gaseous agents for electronics environments but environmentally friendly and lower cost.',
  NULL,
  '{"headers": ["Suppression Agent", "Fire Classes", "Safe for Electronics?", "Safe for Occupied Spaces?", "Leaves Residue?", "Environmental Status"], "rows": [["Water (wet pipe sprinkler)", "A", "No — damages equipment", "Yes (life safety standard)", "Yes — water damage", "Approved; no environmental concern"], ["Dry pipe / Pre-action sprinkler", "A", "Better than wet pipe (less accidental discharge)", "Yes", "Yes — water damage when activated", "Approved; no environmental concern"], ["Halon 1301", "A, B, C", "Yes — excellent for electronics", "Yes (low concentration)", "No — leaves no residue", "Banned for new production (Montreal Protocol)"], ["FM-200 (HFC-227ea)", "A, B, C", "Yes", "Yes", "No", "Approved; GWP concerns"], ["Novec 1230", "A, B, C", "Yes", "Yes", "No", "Approved; very low GWP — preferred"], ["CO2", "B, C", "Yes — no residue", "No — asphyxiation risk", "No", "Approved; requires evacuation interlock"], ["Water Mist", "A, B, C (limited)", "Partial — much less damage than sprinkler", "Yes", "Minimal", "Approved; no environmental concern"]]}'::jsonb,
  'Fire suppression exam areas: (1) Class C = electrical equipment — requires non-conductive suppressant (NO water). (2) Halon is banned for new production (Montreal Protocol) — know it is an ozone-depleting substance. (3) Clean agent alternatives: FM-200 and Novec 1230 — effective, no residue, safe for occupied spaces. (4) CO2 is effective but requires evacuation — asphyxiation risk. (5) Pre-action sprinklers require two triggers (smoke detection + sprinkler activation) before water releases — best water-based option for electronics environments. (6) VESDA = very early smoke detection for data centers.',
  'As a manager, data center fire suppression decisions must balance equipment protection (clean agents), life safety (no CO2 in normally occupied spaces), and regulatory requirements (Halon decommission timelines). If your data center has an aging Halon system, plan for migration to Novec 1230 or FM-200 — Halon recharge costs increase annually as stockpiles deplete. Verify that your suppression system''s detection-to-discharge timing aligns with evacuation time for any spaces where CO2 might be used.',
  'Fire Classes: ABC-DK — Ash (A), Burn liquid (B), Current electrical (C), Dangerous metals (D), Kitchen (K). NO water on C (electronics shock risk). Halon = Halted (banned — ozone-depleting). Clean agents = FM-200 and Novec 1230 (safe, no residue, still legal). CO2 = suffocates fire AND humans — clear the room first. Pre-action = two-trigger sprinkler (safest water system for electronics).',
  'In the Zurich Server Farm, the data center''s fire suppression panel shows three zones. Zone A (server rows): Novec 1230 clean agent — manual discharge panel requires two-person authorization; the VESDA aspirating detection system feeds early warning to this zone''s panel. Zone B (network equipment room): FM-200, same VESDA coverage. Zone C (electrical vault — no personnel during operation): CO2 with mandatory alarm interlock that confirms evacuation before discharge. The old Halon sign from the previous system hangs on the wall as a historical artifact — replaced five years ago during the Montreal Protocol compliance upgrade.'
);

-- ---------------------------------------------------------------------------
-- 3.16.1 Physical Security: Power and Environment
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  3,
  '3.16.1',
  'Physical Security: Power and Environmental Controls',
  'Data centers require clean, redundant power (UPS for short-term, generators for extended outages), environmental controls (HVAC for temperature/humidity, EMI shielding), and grounding to protect equipment from electrical threats — power failure being the most common physical availability threat.',
  '## Physical Security: Power and Environmental Controls

Information systems require a stable, clean, and continuous power supply and a controlled environment to operate reliably. Power disruptions, extreme temperatures, humidity fluctuations, and electromagnetic interference can cause data loss, hardware failure, and availability incidents. Physical security for power and environment is the foundation of data center availability — without it, all other security controls fail when power goes out or HVAC fails.

### Power Threats

**Power failure (blackout)**: Total loss of power from the utility grid. Data centers require backup power sources to maintain operations during outages.

**Brownout**: Temporary reduction in voltage (5-10% below normal) that can cause equipment to malfunction or fail. Servers and network equipment are sensitive to undervoltage.

**Spike/surge**: Brief overvoltage event (power spike can reach thousands of volts). Can instantly destroy unprotected electronic components.

**Sag**: A brief undervoltage event, distinct from a brownout (shorter duration).

**Noise**: Electrical interference superimposed on the power line (EMI, radio frequency interference) that can corrupt data or cause logic errors.

**Transient**: Any brief, non-standard electrical event — spikes, sags, surges, noise. Collectively, transients are the most common power quality problems.

### UPS: Uninterruptible Power Supply

A UPS is a battery-based power backup that provides immediate power continuity when utility power fails, long enough to either ride through a brief outage or to safely shut down systems or transfer load to a generator. UPS topologies:

**Online (double-conversion) UPS**: Continuously converts AC to DC (charges batteries) and back to AC (powers equipment). Provides perfect power quality — equipment always runs from the inverter, never directly from utility power. Completely isolates equipment from all power quality issues. Highest cost and efficiency loss but best protection.

**Standby (offline) UPS**: Equipment normally runs directly from utility power; switches to battery-powered inverter only when utility power fails (small switchover delay of a few milliseconds). Lower cost, less protection from power quality issues.

**Line-interactive UPS**: Intermediate — uses an autotransformer to regulate voltage without switching to battery for minor variations. Transfers to battery for outages.

### Generators

For extended outages beyond UPS battery capacity (typically 5-30 minutes for data center UPS systems), diesel or natural gas generators provide sustained backup power. Generators take 10-30 seconds to start and reach stable output — this gap is bridged by the UPS. Data centers with high availability requirements maintain generators with on-site fuel for 24-72 hours or more, with agreements for priority fuel delivery.

### HVAC and Cooling

Electronic equipment generates significant heat — modern servers at high utilization can dissipate 10-15 kW per rack. Without adequate cooling, equipment overheats and fails. Data center HVAC systems maintain:

- **Temperature**: ASHRAE guidelines recommend 18-27°C (65-80°F) for server inlet air, with 80.6°F (27°C) as the recommended maximum
- **Humidity**: 45-55% relative humidity is optimal — too dry (below 40%) creates static electricity risk; too humid (above 60%) risks condensation on equipment

**Cold/hot aisle containment**: Data center server rows alternate between "cold aisles" (where cool air is delivered to server inlets) and "hot aisles" (where hot exhaust air exits servers). Containment systems prevent hot and cold air from mixing, improving cooling efficiency significantly.

### EMI and Grounding

**Electromagnetic Interference (EMI)**: Radiated or conducted electromagnetic energy that can disrupt electronic operation or induce errors. Sources include power equipment, motors, radio transmitters, and nearby electronic equipment. Shielding (Faraday cage around sensitive equipment), proper grounding, and physical separation from EMI sources mitigate EMI risk.

**Ground**: Every piece of electrical equipment must be properly grounded to a common reference point to prevent voltage differentials that cause noise and potential equipment damage. A data center with poor grounding will experience persistent transient and noise problems.

**ESD (Electrostatic Discharge)**: Static electricity discharged from personnel or equipment can instantly destroy sensitive electronic components. Controls include anti-static flooring, grounding straps for technicians working on equipment, and humidity control (dry environments generate more static).',
  NULL,
  '{"headers": ["Power/Environmental Threat", "Threat Type", "Impact", "Primary Control"], "rows": [["Power failure (blackout)", "Availability", "Complete system shutdown", "UPS + generator; redundant utility feeds"], ["Brownout (undervoltage)", "Availability/integrity", "Equipment malfunction or unexpected shutdown", "Online UPS (double-conversion); voltage regulation"], ["Spike/surge (overvoltage)", "Hardware destruction", "Instant hardware failure", "Surge suppressors; online UPS (double-conversion)"], ["Noise/transient", "Data integrity", "Data corruption, logic errors", "Online UPS; power filters; isolation transformers"], ["Overheating", "Availability/hardware", "Equipment failure; automatic thermal shutdown", "Redundant HVAC; hot/cold aisle containment; temperature monitoring"], ["Humidity extremes", "Hardware/availability", "Low: ESD damage; High: condensation and corrosion", "HVAC with humidity control; monitoring and alerting"], ["EMI", "Data integrity/availability", "Data corruption; equipment interference", "Shielding; grounding; physical separation from sources"], ["ESD", "Hardware destruction", "Instant component destruction from static discharge", "Anti-static flooring; grounding straps; humidity >40%"]]}'::jsonb,
  'Power/environment exam areas: (1) Online (double-conversion) UPS provides the best power protection — equipment never runs directly from utility. (2) UPS = short-term backup; generator = extended outage backup; UPS bridges the generator startup gap. (3) HVAC controls both temperature AND humidity — both extremes cause problems. (4) EMI is radiated/conducted electromagnetic interference. ESD is static discharge. (5) The Faraday cage is the ultimate EMI shielding control. (6) Grounding is essential — voltage differentials between equipment cause noise and damage. (7) ASHRAE defines recommended data center temperature ranges.',
  'As a manager, power and environmental controls are the availability baseline for your data center. An online UPS that has never had its batteries tested is not protection — it is a false sense of security. Mandate quarterly UPS battery tests and annual generator start-and-load tests. Ensure your HVAC has redundancy (N+1 cooling units) and monitoring with automatic alerting — a failed CRAC unit in a densely loaded data center can cause a thermal shutdown within minutes. If you are in a facility without your own physical data center, verify these requirements contractually with your colocation or cloud provider and review their audit certifications (SSAE 18 SOC 2, ISO 27001).',
  'Power threats: BSNST — Blackout (complete failure), Sag (brief low), Noise (interference), Spike (brief high), Transient (any brief event). UPS types: Online (best — always from battery), Standby (switches over when power fails), Line-interactive (regulates voltage, switches for outages). UPS bridges to Generator. HVAC: Temperature (ASHRAE 18-27°C) + Humidity (45-55% — not too dry = ESD, not too wet = condensation). EMI: shield, ground, separate. ESD: anti-static, humidity above 40%, grounding straps.',
  'In the Zurich Server Farm, the facilities control room monitors four critical systems simultaneously. Power panel: two independent utility feeds enter the building; both pass through online double-conversion UPS banks (2N redundancy — every UPS has a backup UPS); diesel generators in the yard test every Sunday at 6 AM with a simulated 15-minute full-load transfer. Temperature panel: 22°C average server inlet, hot/cold aisle containment operational, N+1 CRAC units (one unit can fail without impact). Humidity gauge reads 50% — in the safe zone. EMI monitoring shows clean signal — the Faraday cage lining the server room walls and proper grounding on every rack eliminates the interference that plagued the old building. The facilities manager has not had an unplanned thermal or power event in 18 months.'
);
