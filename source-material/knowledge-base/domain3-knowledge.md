# Domain 3: Security Architecture and Engineering — Comprehensive Knowledge Summary

---

## 1. COMPLETE TOPIC LIST

### 3.1 Research, Implement, and Manage Engineering Processes Using Secure Design Principles
- Security involvement throughout the engineering lifecycle (from inception to decommission)
- Threat modeling (STRIDE, PASTA, DREAD, VAST, attack trees)
- Least privilege
- Defense in depth (layered security)
- Secure defaults (deny by default)
- Fail securely (fail-safe vs. fail-open vs. fail-secure)
- Separation of duties (SoD)
- Keep it simple (KISS) — reduced attack surface through simplicity
- Zero trust architecture
  - Never trust, always verify
  - NIST SP 800-207 principles
  - Micro-segmentation
  - Continuous verification of users, devices, services
- Trust but verify
- Privacy by design (7 foundational principles)
- Shared responsibility model (cloud)
- Cyber kill chain / attack chain (Lockheed Martin model)

### 3.2 Understand Fundamental Concepts of Security Models
- State machine model (secure state transitions)
- Bell-LaPadula Model (confidentiality)
  - Simple Security Property (no read up)
  - Star (*) Property (no write down)
  - Strong Star Property (read/write only at own level)
  - Tranquility principle (labels do not change during operation)
- Biba Integrity Model
  - Simple Integrity Axiom (no read down)
  - Star Integrity Axiom (no write up)
  - Invocation Property (no invoke up)
- Clark-Wilson Model (integrity via well-formed transactions)
  - Constrained Data Items (CDIs)
  - Unconstrained Data Items (UDIs)
  - Transformation Procedures (TPs)
  - Integrity Verification Procedures (IVPs)
  - Access control triples (subject, TP, CDI)
- Brewer-Nash Model (Chinese Wall) — dynamic conflict of interest separation
- Graham-Denning Model (8 primitive protection rules for object creation/deletion/rights)
- Harrison-Ruzzo-Ullman (HRU) Model (extension of access matrix, decidability of safety)
- Lipner Model (combines Bell-LaPadula + Biba for both confidentiality and integrity)
- Sutherland Model (integrity via preventing interference)
- Goguen-Meseguer Model (noninterference — actions of one group cannot affect another)
- Take-Grant Model (rights transfer via directed graph — take, grant, create, remove)
- Lattice-based access controls
- Information flow models
- Noninterference models

### 3.3 Select Controls Based Upon Systems Security Requirements
- Trusted Computing Base (TCB) — totality of protection mechanisms
  - Security perimeter
  - Reference monitor concept
  - Security kernel
- Trusted Platform Module (TPM)
  - Hardware-based root of trust
  - Endorsement key, storage root key, attestation identity keys
  - Platform Configuration Registers (PCRs)
- Hardware Security Module (HSM) — dedicated crypto processing device
- Secure boot / measured boot / attestation
- Common Criteria (ISO/IEC 15408)
  - Target of Evaluation (TOE)
  - Security Target (ST)
  - Protection Profile (PP)
  - Evaluation Assurance Levels (EAL 1-7)
- TCSEC (Orange Book) — historical, replaced by Common Criteria
  - Division D (minimal protection) through Division A (verified design)
- ITSEC — European predecessor to Common Criteria
- Security modes of operation
  - Dedicated mode
  - System high mode
  - Compartmented mode
  - Multilevel mode

### 3.4 Understand Security Capabilities of Information Systems
- Memory protection
  - Process isolation
  - Hardware segmentation
  - Virtual memory / paging / swapping
  - Memory address space layout randomization (ASLR)
  - Data Execution Prevention (DEP) / No-Execute (NX) bit
  - Executable space protection
- Processor states (ring model: Ring 0 kernel to Ring 3 user)
  - Supervisor mode vs. user/problem mode
  - Privileged vs. non-privileged instructions
- Virtualization
  - Type 1 hypervisor (bare metal) — more secure
  - Type 2 hypervisor (hosted on OS) — less secure
  - VM escape attacks
  - VM sprawl
  - Hypervisor security / hypervisor hardening
- Containerization
  - Container engine
  - Container images
  - Containers vs. VMs
  - Orchestration (Kubernetes)
- Trusted computing
- Encryption/decryption hardware capabilities
- System resilience and fault tolerance
  - Redundancy (RAID, clustering, failover)
  - MTTF, MTBF, MTTR
- Emanation security (TEMPEST)

### 3.5 Assess and Mitigate Vulnerabilities of Security Architectures, Designs, and Solution Elements
- Client-based vulnerabilities
  - Browser exploits, plug-ins, extensions, ActiveX, JavaScript
  - Local caches and temporary files
  - Mobile device vulnerabilities (jailbreaking, rooting, sideloading)
  - Third-party app stores
- Server-based vulnerabilities
  - Data flow control
  - Server-side input validation
  - Privilege escalation
- Database security
  - Aggregation
  - Inference
  - Polyinstantiation
  - SQL injection
  - Data warehousing and data mining
- Distributed systems and endpoint security
  - Cloud-based vulnerabilities (multi-tenancy risks, API security, data remanence)
  - Grid computing
  - Peer-to-peer
- Industrial Control Systems (ICS) / SCADA / DCS
  - Programmable Logic Controllers (PLCs)
  - Air-gapping and network segmentation
  - Patch management challenges
  - Safety Instrumented Systems (SIS)
- IoT (Internet of Things) vulnerabilities
  - Default credentials
  - Lack of encryption
  - Firmware update challenges
  - Embedded systems security
- Edge computing and fog computing
- Microservices architecture
  - API gateway security
  - Service mesh
  - Loose coupling
- Serverless computing (FaaS)
- High Performance Computing (HPC) / supercomputers
- Covert channels
  - Covert timing channels (information via timing of events)
  - Covert storage channels (information via shared storage)
  - Detection and mitigation
- Side-channel attacks (power analysis, electromagnetic analysis, timing analysis, acoustic)
- TOCTOU / race conditions
  - Time-of-Check vs. Time-of-Use vulnerabilities
  - Mitigation through increased check frequency, software locks
- Bypass controls (maintenance hooks, backdoors)
- Web application vulnerabilities
  - Cross-site scripting (XSS) — stored, reflected, DOM-based
  - Cross-site request forgery (CSRF/XSRF)
  - SQL injection
  - Input validation failures (root cause of most web vulnerabilities)
  - Server-side request forgery (SSRF)
- Secure Access Service Edge (SASE)
- Content Distribution Networks (CDNs)

### 3.6 Select and Determine Cryptographic Solutions
- Cryptographic foundations
  - Confidentiality, integrity, authentication, nonrepudiation, access control
  - Kerckhoffs' Principle (security depends on key secrecy, not algorithm secrecy)
  - Cryptographic lifecycle (algorithm selection, key generation, distribution, storage, use, destruction)
- Symmetric cryptography
  - Shared/secret key
  - Stream ciphers (encrypt bit by bit — faster, software-based)
    - RC4 (deprecated, used in WEP/early TLS)
  - Block ciphers (encrypt fixed-size blocks)
    - Modes of operation:
      - ECB (Electronic Codebook) — simplest, least secure, no IV, reveals patterns
      - CBC (Cipher Block Chaining) — uses IV, chains blocks, good for bulk data/email
      - CFB (Cipher Feedback) — uses IV, stream-like behavior from block cipher
      - OFB (Output Feedback) — uses IV, good for satellite/noisy channels
      - CTR (Counter) — fastest and most secure block mode, parallelizable
      - GCM (Galois/Counter Mode) — authenticated encryption, used in TLS 1.3
  - DES (Data Encryption Standard) — 56-bit key, 64-bit block, 16 rounds, broken
  - 3DES (Triple DES) — three DES passes, effective 112-bit security (meet-in-the-middle), deprecated
  - AES (Rijndael) — 128/192/256-bit keys, 128-bit block, 10/12/14 rounds, current standard
  - IDEA (International Data Encryption Algorithm) — 128-bit key, 64-bit block
  - Blowfish — variable key (32-448 bits), 64-bit block
  - Twofish — 128/192/256-bit key, 128-bit block, AES finalist
  - RC5 — variable key/block/rounds
  - RC6 — AES finalist, based on RC5
  - Skipjack — 80-bit key, used in Clipper Chip (key escrow)
  - Advantages: fast, efficient, strong encryption
  - Disadvantages: key distribution problem, scalability (n(n-1)/2 keys), no inherent authentication/nonrepudiation
- Asymmetric cryptography
  - Public/private key pairs
  - RSA — based on factoring large primes, key sizes 1024-4096 bits
  - Diffie-Hellman — key exchange only (not encryption), based on discrete logarithms, vulnerable to MITM
  - ElGamal — based on discrete logarithms, extension of Diffie-Hellman
  - Elliptic Curve Cryptography (ECC) — shorter keys for equivalent security, based on ECDLP
    - ECDH (key exchange), ECDSA (signatures)
  - DSA (Digital Signature Algorithm) — signatures only, based on discrete logarithms
  - Knapsack algorithm — broken, historical interest only
  - Advantages: solves key distribution problem, enables digital signatures, better scalability
  - Disadvantages: much slower than symmetric, computationally expensive
- Hybrid cryptography (combine symmetric speed with asymmetric key exchange)
  - Use asymmetric to exchange symmetric session keys
  - TLS handshake as primary example
- Hashing algorithms
  - One-way functions producing fixed-length message digest
  - Properties: deterministic, one-way, collision resistant, avalanche effect, uniformly distributed
  - MD5 — 128-bit digest, widely broken
  - SHA-1 — 160-bit digest, deprecated
  - SHA-2 family — SHA-224, SHA-256, SHA-384, SHA-512
  - SHA-3 — sponge construction (Keccak), 224/256/384/512-bit digests
  - RIPEMD — 128/160/256/320-bit variants
  - HAVAL — variable-length output
  - Collisions (two inputs producing same hash)
  - Birthday attack/paradox — probability-based collision finding
- HMAC (Hash-based Message Authentication Code)
  - Combines hashing with a secret key
  - Provides integrity AND authentication (unlike plain hash)
- Digital signatures
  - Hash the message, encrypt digest with sender's private key
  - Provides integrity, authentication, and nonrepudiation
  - Does NOT provide confidentiality
  - DSA, RSA signatures, ECDSA
  - Code signing and validation
- Digital certificates (X.509 standard)
  - Certificate Authority (CA), Registration Authority (RA)
  - Root CA, intermediate CAs, issuing CAs
  - Chain of trust / certificate chaining
  - Certificate Revocation Lists (CRLs)
  - Online Certificate Status Protocol (OCSP)
  - OCSP stapling
  - Certificate pinning
  - Certificate lifecycle: issuance, renewal, revocation, expiration
- Public Key Infrastructure (PKI)
  - Certificate authorities hierarchy
  - Cross-certification
  - Key escrow and key recovery
  - M of N control (split knowledge for key recovery)
- Key management
  - Key generation (true randomness, hardware RNGs)
  - Key distribution (out-of-band preferred, Diffie-Hellman, key wrapping)
  - Key storage (HSM, TPM, secure key stores)
  - Key rotation / replacement
  - Key revocation
  - Key destruction (crypto-shredding, zeroization)
  - Key escrow (third-party holds copy of key)
  - Key archival
- Steganography
  - Hiding data within other media (images, audio, video, text)
  - Null ciphers
  - Digital watermarking
  - Not encryption — security through obscurity
- Cryptographic definitions and concepts
  - Plaintext / cleartext
  - Ciphertext
  - Cryptovariable (key)
  - Initialization vector (IV) — random starting point to prevent pattern repetition
  - Nonce
  - Salt (added to passwords before hashing)
  - Key space (2^n possible keys for n-bit key)
  - Work factor (effort to break encryption)
  - Confusion (relationship between key and ciphertext — substitution)
  - Diffusion (spreading plaintext influence across ciphertext — transposition/permutation)
  - Avalanche effect (small plaintext change causes large ciphertext change)
  - Key clustering (different keys producing same ciphertext — weakness)
  - Substitution ciphers (monoalphabetic, polyalphabetic, one-time pads)
  - Transposition ciphers (rail fence, columnar)
  - One-time pad requirements: truly random key, key >= message length, single use, physical security of pad
  - Synchronous vs. asynchronous encryption
  - Frequency analysis (attacking monoalphabetic ciphers)
- Specialized crypto applications
  - Homomorphic encryption (compute on encrypted data)
  - Quantum cryptography / Quantum Key Distribution (QKD)
  - Post-quantum cryptography
  - Lightweight cryptography (IoT, smartcards, low-power devices)
  - Low-latency cryptography (network links, VPN hardware)
  - High-resiliency cryptography
  - Blockchain and distributed ledger technology
  - Crypto-shredding (destroying keys to render data unrecoverable)

### 3.7 Understand Methods of Cryptanalytic Attacks
- Brute force (exhaustive key search)
- Frequency analysis
- Known plaintext attack (attacker has plaintext-ciphertext pairs)
- Chosen plaintext attack (attacker can encrypt chosen plaintexts)
- Chosen ciphertext attack (attacker can decrypt chosen ciphertexts)
- Ciphertext-only attack (attacker has only ciphertext)
- Meet-in-the-middle attack (why double DES is no more secure than single DES)
- Man-in-the-middle attack (intercepting key exchange, especially Diffie-Hellman)
- Birthday attack (finding hash collisions using birthday paradox probability)
- Replay attack (re-sending captured authentication data)
- Side-channel attacks (timing, power analysis, electromagnetic emanations, acoustic)
- Rubber hose attack (coercion/torture for keys)
- Social engineering for keys
- Implementation attacks (exploiting flawed implementations, not algorithms)
- Fault injection attacks
- Differential cryptanalysis
- Linear cryptanalysis
- Related-key attacks
- Algebraic attacks
- Rainbow table attacks (precomputed hash tables)
  - Mitigation: salting
- Dictionary attacks on passwords
- Pass-the-hash attacks

### 3.8 Apply Security Principles to Site and Facility Design
- Crime Prevention Through Environmental Design (CPTED)
  - Natural surveillance
  - Natural access control
  - Territorial reinforcement
- Site selection considerations
  - Visibility, proximity to emergency services, natural disaster risk
  - Neighboring businesses, crime statistics
  - Utility availability and redundancy
- Facility location within building
  - Data centers at building core (not ground floor, top floor, or basement)
  - Avoid exterior walls with windows
  - Lights-out facilities
- Wiring closet security (locked, monitored, tidy, restricted access)
- Server room / data center design
  - Hot/cold aisle containment
  - Raised floors (12-36 inches for airflow and cabling)
  - Humidity control (40-60% relative humidity)
  - Temperature control (64-75°F / 18-24°C)
  - HVAC (positive pressurization to keep contaminants out)
  - Electromagnetic interference (EMI) shielding
- Restricted and work area security
- Utility considerations
  - Power (clean, consistent power)
  - Water (for cooling)
  - Gas (for fire suppression)
  - Sewage
- Security zones and layered defense

### 3.9 Design Site and Facility Security Controls
- Physical access controls
  - Fences (3-4 ft deters casual, 6-7 ft difficult to climb, 8+ ft with barbed wire for high security)
  - Gates (classes I-IV based on speed)
  - Bollards
  - Locks (preset/tumbler, combination, cipher/programmable, smart/electronic)
    - Lock picking, lock bumping, bypass attacks
  - Key management for physical locks
  - Doors (fail-safe vs. fail-secure)
  - Person traps / mantraps / airlock doors
  - Turnstiles
  - Security guards (advantages and limitations)
  - Guard dogs
  - Badge/card access systems (proximity cards, smart cards, magnetic stripe)
  - Tailgating/piggybacking prevention
- Surveillance systems
  - CCTV and video surveillance
  - Motion detectors
    - Infrared (heat-based)
    - Ultrasonic (sound wave)
    - Microwave (electromagnetic field)
    - Photoelectric (light beam interruption)
    - Capacitance (electrical field change — for guarding specific objects)
    - Passive vs. active motion detection
  - Intrusion detection systems (physical)
- Lighting (8 feet high, 2 foot-candles, critical areas/parking)
- Environmental controls
  - HVAC systems (dedicated for data centers)
  - Positive pressure (clean air pushed in)
  - Humidity monitoring (too low = ESD, too high = condensation/corrosion)
  - Temperature monitoring
  - Water detection (under raised floors)
  - Electromagnetic shielding (Faraday cage, TEMPEST)
- Fire prevention, detection, and suppression
  - Fire triangle/tetrahedron (fuel, oxygen, heat, chemical chain reaction)
  - Fire classes: A (combustibles), B (liquids), C (electrical), D (metals), K (kitchen)
  - Fire stages: incipient, smoke, flame, heat
  - Detection systems
    - Ionization detectors (fast/flaming fires)
    - Photoelectric/optical detectors (smoldering fires)
    - Dual detectors (both ionization and optical)
    - VESDA (Very Early Smoke Detection Apparatus) — best for data centers, detects at incipient stage
    - Heat/rate-of-rise detectors
    - Flame detectors (infrared, UV)
  - Water-based suppression
    - Wet pipe (always pressurized, risk of leaks/freezing)
    - Dry pipe (gas-filled until activation)
    - Pre-action (requires detection trigger before water fills pipes — best for data centers with water)
    - Deluge (all heads open, massive flow — explosives factories)
  - Gas-based suppression (removes oxygen or interrupts chemical reaction)
    - Halon (banned — ozone depletion; Montreal Protocol)
    - FM-200 (clean agent, safe for people and equipment)
    - INERGEN (reduces O2 but maintains breathable atmosphere)
    - Argonite (argon + nitrogen mix)
    - Aero-K (potassium-based aerosol)
    - CO2 (effective but can be lethal to humans)
  - Fire extinguisher classes (A=water/foam, B=gas/CO2/foam, C=gas/CO2, D=dry powder, K=wet chemical)
- Power management
  - UPS (Uninterruptible Power Supply) — battery backup for short-term
  - Generators — long-term backup power
  - Dual power feeds from separate substations
  - Power conditioning / line conditioners
  - Surge protectors
  - Power distribution units (PDUs)
  - Power issues: blackout, brownout, sag, surge, spike, noise, transient, inrush
- Cable plant management
- Media storage and handling
- Evidence storage
- Personnel safety (always the top priority)

### 3.10 Manage the Information System Lifecycle
- System Development Life Cycle (SDLC) phases
  - Initiation/conceptual definition
  - Functional requirements definition
  - System design specifications
  - Development and implementation
  - Testing (verification and validation)
  - Transition to production (accreditation/authorization)
  - Operations and maintenance
  - Disposal/decommission
- Security integrated at every phase
- Certification and Accreditation (C&A) / Authorization to Operate (ATO)
- System security plan
- Configuration management and change control
- Disposal and sanitization of systems

### Cloud Computing (cross-cutting topic)
- Five essential characteristics (NIST SP 800-145)
  - On-demand self-service
  - Broad network access
  - Resource pooling
  - Rapid elasticity
  - Measured service
- Multi-tenancy
- Service models
  - IaaS (Infrastructure) — customer controls OS and up
  - PaaS (Platform) — customer controls applications and data
  - SaaS (Software) — provider controls everything; customer is end user
- Deployment models
  - Public cloud (least trusted, most accessible)
  - Private cloud (single organization, more trusted)
  - Community cloud (shared by community with common interests, e.g., GovCloud)
  - Hybrid cloud (combination of any above)
- Virtual Private Cloud (VPC) — logically isolated section of public cloud
- Cloud computing roles
  - Cloud service customer/consumer (accountable)
  - Cloud service provider (responsible for platform)
  - Cloud service partner/broker (support role)
- Accountability vs. responsibility in cloud (data owner always remains accountable)
- Shared responsibility model by service type
- Cloud security concerns
  - Data sovereignty / data residency
  - Vendor lock-in
  - Insecure APIs
  - Insufficient due diligence
  - Data remanence
  - Compliance and audit challenges
  - Multi-tenancy isolation failures

---

## 2. KEY DEFINITIONS AND CONCEPTS

**Trusted Computing Base (TCB):** The totality of hardware, firmware, and software protection mechanisms within a system that enforce the security policy. If any component of the TCB is compromised, the entire system's security guarantee is invalidated.

**Reference Monitor:** An abstract concept describing the mechanism that mediates all access between subjects and objects. It must be tamper-proof, always invoked, and small enough to be verified. The security kernel is the actual implementation.

**Security Kernel:** The hardware, firmware, and software elements of a TCB that implement the reference monitor concept. Must be isolated, complete (always invoked), and verifiable.

**Bell-LaPadula Model:** Formal model enforcing confidentiality through mandatory access controls. "No read up, no write down." A subject at Secret cannot read Top Secret data (Simple Security), and cannot write data to an Unclassified level (Star Property). Designed to prevent information leakage to lower classification levels.

**Biba Model:** Formal model enforcing integrity. "No read down, no write up." A subject at a high integrity level cannot read lower-integrity data (Simple Integrity), cannot write to a higher integrity level (Star Integrity), and cannot invoke subjects at a higher integrity level (Invocation Property). Exact opposite of Bell-LaPadula's direction.

**Clark-Wilson Model:** Integrity model using well-formed transactions and separation of duties. Access is mediated through programs (Transformation Procedures), not direct object access. The triple of (Subject, TP, CDI) defines all authorized access. Enforces both internal and external consistency.

**Brewer-Nash (Chinese Wall):** Dynamically enforced model that prevents conflicts of interest. Once a subject accesses data from one organization, they are barred from accessing data of competing organizations. Important for consulting and financial services.

**Covert Channel:** An unintended communication path that violates the security policy. Covert storage channels manipulate shared storage resources; covert timing channels encode information in the timing of system events. Distinct from bypass controls, which are intentional.

**TOCTOU (Time-of-Check Time-of-Use):** A race condition where a brief window between authorization verification and resource access allows unauthorized manipulation. Mitigated by increasing check frequency, using mutex locks, and atomic operations.

**TPM (Trusted Platform Module):** A tamper-resistant hardware chip that provides cryptographic functions including secure key generation and storage, platform integrity measurement, and hardware-based attestation. Stores platform measurements in Platform Configuration Registers (PCRs).

**HSM (Hardware Security Module):** A dedicated physical computing device that safeguards and manages cryptographic keys and provides accelerated crypto processing. Used for high-value key operations in enterprise environments. Typically FIPS 140-2/140-3 validated.

**Common Criteria (CC):** International standard (ISO/IEC 15408) for evaluating IT security products. Uses Protection Profiles (what security is needed), Security Targets (what the product claims to do), and Evaluation Assurance Levels (EAL 1-7, from functionally tested to formally verified design and tested). Replaced TCSEC and ITSEC.

**EAL Levels:** EAL1 (functionally tested), EAL2 (structurally tested), EAL3 (methodically tested and checked), EAL4 (methodically designed, tested, and reviewed — highest level commonly achieved commercially), EAL5 (semi-formally designed and tested), EAL6 (semi-formally verified design and tested), EAL7 (formally verified design and tested). Higher EAL does not guarantee zero vulnerabilities.

**Kerckhoffs' Principle:** A cryptographic system should be secure even if everything about the system, except the key, is public knowledge. Security must rely on key secrecy, not algorithm secrecy. This is why open/published algorithms (AES, RSA) are preferred over proprietary ones.

**Work Factor:** A measurement of the computational effort (time and resources) required to break a cryptographic system through brute force. A system with a sufficiently high work factor is considered computationally secure even if not theoretically unbreakable.

**Key Space:** The total number of possible keys for a given cryptographic algorithm, calculated as 2^n where n is the key length in bits. A 128-bit key has a key space of 2^128 (approximately 3.4 x 10^38 possible keys).

**Confusion:** A cryptographic property where the relationship between the key and the ciphertext is made as complex as possible. Achieved primarily through substitution operations. Makes it difficult to determine the key from the ciphertext.

**Diffusion:** A cryptographic property where the statistical structure of the plaintext is dissipated into long-range statistics of the ciphertext. Achieved through transposition/permutation. A single plaintext bit change should affect approximately half the ciphertext bits (avalanche effect).

**Initialization Vector (IV):** A random or pseudo-random value used as an additional input to a cryptographic algorithm to ensure that the same plaintext encrypted multiple times produces different ciphertext. Must be unpredictable but does not need to be secret. Used in CBC, CFB, OFB, and CTR modes.

**Homomorphic Encryption:** A form of encryption that allows computation on ciphertext, generating an encrypted result which, when decrypted, matches the result of operations performed on the plaintext. Enables secure cloud computing on sensitive data without exposing it.

**Crypto-shredding:** The practice of deliberately destroying encryption keys to render the encrypted data permanently unreadable. Useful for cloud environments where physical media destruction is impractical.

**Steganography:** The practice of concealing a message, file, or image within another message, file, or image. Unlike cryptography (which makes data unreadable), steganography hides the existence of the data itself. Digital watermarking is a related technique for copyright protection.

**TEMPEST:** A U.S. government codename for specifications and standards for limiting electronic emanations from computing equipment. Addresses the risk that electromagnetic emissions from devices can be intercepted and used to reconstruct processed data (Van Eck phreaking).

**Defense in Depth:** A security strategy employing multiple layers of security controls so that if one layer fails, another is in place to provide protection. Includes physical, technical, and administrative controls at multiple levels.

**Zero Trust:** A security model based on the principle "never trust, always verify." Assumes breach and verifies every request as though it originates from an untrusted network. Key principles include micro-segmentation, least privilege, and continuous verification.

**Fail-Secure vs. Fail-Safe vs. Fail-Open:** Fail-secure (or fail-closed) locks doors and blocks access when a system fails — prioritizes security. Fail-safe unlocks doors when power fails — prioritizes human safety (required by fire codes for personnel egress). Fail-open allows traffic to pass — prioritizes availability. The exam emphasizes that human safety always takes precedence.

**VESDA (Very Early Smoke Detection Apparatus):** The most sensitive fire detection system, capable of detecting fire at the incipient (pre-combustion) stage. Recommended for data centers, clean rooms, and environments with high-value assets. Most expensive but provides the earliest warning.

**Pre-action Sprinkler System:** A dry-pipe system that requires a detection trigger before water fills the pipes AND individual sprinkler heads must also be heat-activated. Provides double-interlock protection against accidental discharge. Best water-based option for data centers because it minimizes accidental water damage.

---

## 3. CALCULATIONS AND FORMULAS

### Key Space Calculation
- **Key space = 2^n** where n = key length in bits
- Example: DES with 56-bit key = 2^56 = approximately 7.2 x 10^16 possible keys
- Example: AES-256 = 2^256 = approximately 1.16 x 10^77 possible keys

### Symmetric Key Distribution (Number of Keys Needed)
- **Number of keys = n(n-1) / 2** where n = number of participants
- Example: 10 people need 10(9)/2 = 45 unique keys
- Example: 1,000 people need 1,000(999)/2 = 499,500 unique keys
- This formula demonstrates why symmetric key management does not scale well

### 3DES Effective Key Strength
- 3DES uses three DES operations (encrypt-decrypt-encrypt)
- Theoretical key length: 3 x 56 = 168 bits
- Effective strength: 112 bits (due to meet-in-the-middle attack)
- Double DES provides NO additional security over single DES because of meet-in-the-middle

### Birthday Attack Probability
- The probability of finding a collision in a hash function with an n-bit digest:
- Approximately 2^(n/2) attempts needed (not 2^n)
- Example: A 128-bit hash (MD5) can be attacked in approximately 2^64 operations
- This is why digest length matters — longer digests resist birthday attacks better

### Work Factor Estimation
- Work factor is typically expressed as the number of operations needed for brute-force attack
- For symmetric encryption: approximately 2^(key length) operations
- For RSA: depends on ability to factor the modulus (not simply 2^key_length)
- Rule of thumb: 128-bit symmetric ≈ 3072-bit RSA ≈ 256-bit ECC (equivalent security)

### ECC vs. RSA Key Length Equivalence
| Symmetric Equivalent | RSA Key Size | ECC Key Size |
|---|---|---|
| 80 bits | 1024 bits | 160 bits |
| 112 bits | 2048 bits | 224 bits |
| 128 bits | 3072 bits | 256 bits |
| 192 bits | 7680 bits | 384 bits |
| 256 bits | 15360 bits | 521 bits |

### XP Level Formula (Game-specific)
- Level = floor(1 + sqrt(xp / 100))
- XP awards: Easy=25, Medium=50, Hard=100, Wrong=5

### AES Round Count by Key Size
| Key Size | Block Size | Number of Rounds |
|---|---|---|
| 128 bits | 128 bits | 10 rounds |
| 192 bits | 128 bits | 12 rounds |
| 256 bits | 128 bits | 14 rounds |

### Fence Height Security Levels
| Height | Deterrent Level |
|---|---|
| 3-4 feet | Deters casual trespassers |
| 6-7 feet | Difficult to climb, deters most intruders |
| 8+ feet (with barbed wire) | Deters determined intruders |

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Security Model Traps
- **Bell-LaPadula vs. Biba confusion:** Bell-LaPadula = confidentiality (no read up, no write down). Biba = integrity (no read down, no write up). They are mirror images. The exam loves to swap the properties between models.
- **Clark-Wilson does NOT use labels or lattices.** It uses access triples (subject, transformation procedure, constrained data item). Do not confuse it with mandatory access control models.
- **Brewer-Nash is dynamic, not static.** Access restrictions change based on what a subject has already accessed. It is the only model where permissions change based on past behavior.
- **Bell-LaPadula does NOT address integrity.** If a question asks about maintaining data integrity, Bell-LaPadula is the wrong answer.

### Cryptography Traps
- **3DES effective strength is 112 bits, not 168 bits.** The meet-in-the-middle attack reduces the effective key space. Double DES provides essentially no improvement over single DES for the same reason.
- **Digital signatures do NOT provide confidentiality.** They provide integrity, authentication, and nonrepudiation only. If the question asks about keeping data secret, digital signatures alone are insufficient.
- **Hashing is NOT encryption.** Hashing is a one-way function that produces a fixed-length digest. There is no decryption. It provides integrity only (unless combined with a key as in HMAC, which adds authentication).
- **AES block size is always 128 bits** regardless of key size (128/192/256). The key size varies, but the block does not.
- **DES key is technically 64 bits but only 56 bits are used for encryption** — 8 bits are parity. The effective key length that matters for security is 56 bits.
- **RSA key size and symmetric key size are NOT equivalent.** A 2048-bit RSA key provides approximately 112 bits of symmetric-equivalent security, not 2048 bits.
- **Diffie-Hellman does not encrypt data.** It is a key agreement/exchange protocol only. It enables two parties to agree on a shared secret over an insecure channel but provides no encryption, authentication, or digital signature capability.
- **One-time pad is theoretically unbreakable** but only if ALL four conditions are met: truly random key, key at least as long as message, key used only once, key physically secured. If any condition is violated, it is breakable.
- **ECB mode should never be used for anything that repeats.** Identical plaintext blocks produce identical ciphertext blocks, revealing patterns. Only acceptable for very small, non-repeating data like single encryption keys.
- **Stream ciphers are generally faster than block ciphers** but process one bit at a time. Block ciphers process fixed blocks. CTR mode makes a block cipher behave like a stream cipher.

### Physical Security Traps
- **Human safety is ALWAYS the top priority,** above all other security concerns. If a question presents a conflict between security and safety, always choose safety.
- **Fail-safe means UNLOCKED** (for doors) during power failure — allows people to exit for safety. Fail-secure means LOCKED during failure — maintains security. The exam may try to confuse these terms.
- **Pre-action is the best water-based system for data centers,** not dry pipe. Pre-action requires both a detection trigger AND heat activation of individual heads, providing double protection against accidental discharge.
- **Halon is banned** (Montreal Protocol, ozone depletion). Any answer suggesting Halon installation is incorrect. Acceptable replacements: FM-200, INERGEN, Argonite, Aero-K.
- **VESDA detects fire at the incipient stage** (before visible smoke). It is the most effective early detection system, though the most expensive. Data centers should use VESDA.
- **Data centers should NOT be on the top floor, ground floor, or basement.** Ideal location is the core/center of the building for maximum protection from external threats, flooding, and roof leaks.

### Cloud Traps
- **The data owner (cloud customer) remains accountable** regardless of cloud service model. You can outsource responsibility to a provider but NEVER accountability.
- **IaaS gives the customer the MOST control** (and responsibility) over security. SaaS gives the LEAST. This relationship is frequently tested.
- **Multi-tenancy is a fundamental characteristic** of cloud computing, not just a deployment model. Resource pooling enables multi-tenancy.
- **A Virtual Private Cloud (VPC) is still part of a PUBLIC cloud** — it is a logically isolated section, not a private cloud deployment.

### Architecture Traps
- **Type 1 hypervisors (bare metal) are more secure than Type 2** because they run directly on hardware without depending on an underlying OS. Type 2 relies on the host OS, adding an additional attack surface.
- **Containers share the host OS kernel,** making a kernel vulnerability potentially catastrophic for all containers. VMs have stronger isolation because each has its own OS.
- **SCADA/ICS systems often cannot be easily patched** due to uptime requirements and legacy protocols. Network segmentation and air-gapping are primary mitigations.

---

## 5. COMPARISONS AND DISTINCTIONS

### Symmetric vs. Asymmetric Cryptography
| Feature | Symmetric | Asymmetric |
|---|---|---|
| Keys | Single shared secret key | Public/private key pair |
| Speed | Fast (100-1000x faster) | Slow (computationally intensive) |
| Key Distribution | Requires secure out-of-band channel | Public key can be freely distributed |
| Scalability | Poor: n(n-1)/2 keys needed | Good: 2n keys needed |
| Key Length (equivalent security) | 128 bits | 3072 bits (RSA) / 256 bits (ECC) |
| Confidentiality | Yes | Yes |
| Authentication | No (inherently) | Yes (digital signatures) |
| Nonrepudiation | No | Yes (digital signatures) |
| Examples | AES, DES, 3DES, Blowfish, RC4 | RSA, ECC, DH, DSA, ElGamal |
| Primary Use | Bulk data encryption | Key exchange, signatures, small data |

### Stream Ciphers vs. Block Ciphers
| Feature | Stream Cipher | Block Cipher |
|---|---|---|
| Processing | One bit/byte at a time | Fixed-size blocks (64 or 128 bits) |
| Speed | Generally faster | Generally slower |
| Implementation | Typically software-based | Typically hardware-based |
| Error Propagation | Single bit errors affect single bit | Errors can affect entire block |
| Uses | Real-time communication, wireless | File encryption, email, bulk data |
| Key Reuse | Dangerous — same keystream = breakable | Modes handle repetition (IV/nonce) |
| Examples | RC4, ChaCha20 | AES, DES, 3DES, Blowfish, Twofish |

### Bell-LaPadula vs. Biba vs. Clark-Wilson
| Feature | Bell-LaPadula | Biba | Clark-Wilson |
|---|---|---|---|
| Protects | Confidentiality | Integrity | Integrity |
| Type | State machine, lattice | State machine, lattice | Transaction-based |
| Read Rule | No read up (Simple Security) | No read down (Simple Integrity) | Via Transformation Procedures |
| Write Rule | No write down (Star Property) | No write up (Star Integrity) | Via Transformation Procedures |
| Additional | Strong star: read/write only at own level | Invocation: no invoke up | Separation of duties enforced |
| Access Control | MAC (mandatory) | MAC (mandatory) | Role-based via access triples |
| Use Context | Military/government classification | Commercial data integrity | Commercial transactions (banking) |
| Weakness | Ignores integrity | Ignores confidentiality | Complex to implement |

### AES vs. DES vs. 3DES
| Feature | DES | 3DES | AES |
|---|---|---|---|
| Key Length | 56 bits | 112 bits (effective) | 128, 192, or 256 bits |
| Block Size | 64 bits | 64 bits | 128 bits |
| Rounds | 16 | 48 (16 x 3) | 10, 12, or 14 |
| Status | Broken/obsolete | Deprecated (NIST 2023) | Current standard |
| Speed | Fast | Slow (3x DES overhead) | Fast (hardware support) |
| Structure | Feistel network | Feistel network | Substitution-permutation |

### IaaS vs. PaaS vs. SaaS
| Feature | IaaS | PaaS | SaaS |
|---|---|---|---|
| Customer Controls | OS, middleware, apps, data | Apps and data only | Data and limited config only |
| Provider Controls | Hardware, networking, storage | Plus OS, middleware, runtime | Everything except user data/config |
| Customer Responsibility | Most | Medium | Least |
| Examples | AWS EC2, Azure VMs | Heroku, Google App Engine | Office 365, Salesforce, Gmail |
| Flexibility | Highest | Medium | Lowest |
| Management Overhead | Highest | Medium | Lowest |

### Cloud Deployment Models
| Feature | Public | Private | Community | Hybrid |
|---|---|---|---|---|
| Access | Open to all | Single organization | Shared community | Mixed |
| Trust Level | Lowest | Highest | Medium | Varies |
| Cost | Lowest (shared) | Highest (dedicated) | Shared among members | Varies |
| Control | Least | Most | Moderate | Varies |
| Example | AWS, Azure, GCP | On-premises cloud | GovCloud | AWS + on-prem |

### Type 1 vs. Type 2 Hypervisors
| Feature | Type 1 (Bare Metal) | Type 2 (Hosted) |
|---|---|---|
| Runs On | Directly on hardware | On top of host OS |
| Security | More secure (smaller attack surface) | Less secure (depends on host OS) |
| Performance | Better (less overhead) | Worse (OS layer overhead) |
| Examples | VMware ESXi, Hyper-V, Xen | VirtualBox, VMware Workstation |
| Use Case | Enterprise data centers | Development, testing, personal use |

### Containers vs. Virtual Machines
| Feature | Containers | Virtual Machines |
|---|---|---|
| Isolation | Share host OS kernel | Full OS per VM |
| Size | Lightweight (MBs) | Heavy (GBs) |
| Startup | Seconds | Minutes |
| Security Isolation | Weaker (shared kernel) | Stronger (separate OS) |
| Portability | Highly portable | Less portable |
| Examples | Docker, Kubernetes | VMware, VirtualBox, Hyper-V |

### Monolithic vs. Microservices vs. Serverless
| Feature | Monolithic | Microservices | Serverless (FaaS) |
|---|---|---|---|
| Structure | Single unified codebase | Loosely coupled services | Individual functions |
| Scaling | Entire app scales together | Individual services scale | Functions scale per invocation |
| Complexity | Simple to deploy initially | Complex orchestration | Simplest to deploy |
| Communication | Internal function calls | APIs (REST, gRPC) | Event-driven |
| Cost Model | Fixed infrastructure | Container/VM costs | Pay per execution |

### Fire Detection Systems Comparison
| Type | Detects | Speed | Best For | Cost |
|---|---|---|---|---|
| VESDA | Incipient (pre-smoke) | Earliest | Data centers, clean rooms | Highest |
| Ionization | Fast/flaming fires | Fast | General purpose | Low |
| Photoelectric | Smoldering fires | Moderate | General purpose | Low |
| Heat/Rate-of-Rise | Temperature spikes | Slow (fire advanced) | Industrial | Low |
| Flame (IR/UV) | Visible flames | Slow (fire advanced) | Specialized | Medium |

### Water-Based vs. Gas-Based Fire Suppression
| Feature | Water-Based | Gas-Based |
|---|---|---|
| Cost | Less expensive | More expensive |
| Equipment Damage | Can destroy electronics | Minimal to no damage |
| Extinguishing Method | Removes heat | Removes oxygen or interrupts chemical reaction |
| Best For | General office areas | Data centers, server rooms |
| Human Safety Risk | Minimal | Can be lethal (CO2, some agents) |
| Preferred Types for IT | Pre-action (if water required) | FM-200, INERGEN, Argonite |

### CRL vs. OCSP
| Feature | CRL | OCSP |
|---|---|---|
| Method | Download complete revocation list | Query specific certificate status |
| Timeliness | Periodic updates (can be stale) | Real-time (near real-time) |
| Bandwidth | Higher (full list download) | Lower (single query/response) |
| Scalability | Less scalable | More scalable |
| Enhancement | Delta CRLs reduce size | OCSP stapling reduces load |

### TCSEC vs. ITSEC vs. Common Criteria
| Feature | TCSEC (Orange Book) | ITSEC | Common Criteria |
|---|---|---|---|
| Origin | U.S. DoD | European | International (ISO 15408) |
| Status | Replaced | Replaced | Current standard |
| Ratings | D, C1, C2, B1, B2, B3, A1 | E0-E6 | EAL 1-7 |
| Scope | Standalone systems | Networks included | Broad, flexible |
| Approach | Rigid, classification-based | Separate function/assurance | Target-based (PP, ST, TOE) |

---

## 6. LEGAL AND REGULATORY

### Cryptographic Export Controls
- **Wassenaar Arrangement:** International agreement (42 participating countries) controlling export of conventional arms and dual-use goods, including strong encryption technology. Succeeded COCOM.
- **U.S. Export Administration Regulations (EAR):** Administered by Bureau of Industry and Security (BIS). Controls export of encryption products. Historically restricted export of crypto with keys over 40 bits; restrictions have eased significantly but still apply to certain countries (embargoed nations).
- **ITAR (International Traffic in Arms Regulations):** Controls export of defense-related encryption. Administered by State Department.
- **Historical context:** Phil Zimmermann's PGP case (1993) — exporting strong crypto classified as munitions export. Led to policy reform.
- **Current landscape:** Most commercial encryption can be exported with notification to BIS, except to embargoed countries (North Korea, Iran, Cuba, Syria, etc.).

### Common Criteria (ISO/IEC 15408) Requirements
- Internationally recognized mutual recognition arrangement (CCRA) signed by 30+ countries
- Products evaluated against Protection Profiles (functional/assurance requirements)
- Vendors create Security Targets describing product's security claims
- Independent testing laboratories perform evaluations
- EAL ratings are NOT cumulative — EAL4 does not include all tests from EAL1-3
- EAL4 is the highest level typically achieved for commercial off-the-shelf (COTS) products
- Higher EALs (5-7) typically reserved for government/military applications

### FIPS (Federal Information Processing Standards)
- **FIPS 140-2 / 140-3:** Security requirements for cryptographic modules. Four security levels (Level 1-4) with increasing rigor. Required for U.S. government procurement.
  - Level 1: Basic requirements, no physical security
  - Level 2: Tamper-evidence, role-based authentication
  - Level 3: Tamper-resistance, identity-based authentication, physical security
  - Level 4: Complete physical protection envelope, environmental failure protection
- **FIPS 197:** Specifies AES as the standard symmetric encryption algorithm
- **FIPS 186:** Digital Signature Standard (DSS) specifying DSA, RSA signatures, ECDSA

### Montreal Protocol
- International treaty banning production of ozone-depleting substances
- Directly impacts physical security: Halon fire suppression systems banned
- Existing Halon systems may remain operational but cannot be recharged
- Replacements: FM-200, INERGEN, Argonite, Aero-K

### Privacy Regulations Affecting Architecture
- **Privacy by Design (PbD):** Seven foundational principles requiring privacy protection embedded into system design, not bolted on after. Originated in Ontario, Canada. Adopted by GDPR as a requirement.
- **GDPR:** Requires data protection by design and by default (Article 25). Encryption and pseudonymization are recognized safeguards.
- **HIPAA:** Requires encryption of ePHI at rest and in transit. Safe harbor for breach notification if data was encrypted.

### Intellectual Property in Crypto
- Algorithm patents (RSA patent expired 2000, many others expired)
- Open-source vs. proprietary implementations
- Patent considerations in algorithm selection (AES was chosen partly because it is royalty-free)

---

## 7. FRAMEWORKS AND METHODOLOGIES

### Security Models (Formal)
- **State Machine Model:** A system is always in a defined state. Transitions between states must maintain security. If all states are secure and all transitions are secure, the system is secure. Foundation for Bell-LaPadula and Biba.
- **Information Flow Model:** Ensures information flows only in authorized directions. Lattice-based models define upper and lower bounds for information flow between security levels.
- **Noninterference Model:** Ensures that activities at one security level cannot be detected or influence activities at another level. Prevents signaling between classification levels.
- **Lattice-Based Model:** Uses a mathematical lattice structure to define the set of security levels and their relationships. Each subject and object is assigned a position in the lattice. Supports mandatory access control decisions.

### Enterprise Security Architecture Frameworks
- **Zachman Framework:** A 6x6 matrix organizing architecture artifacts by perspective (Planner, Owner, Designer, Builder, Subcontractor, Enterprise) and interrogative (What, How, Where, Who, When, Why). Not security-specific but widely used.
- **TOGAF (The Open Group Architecture Framework):** An enterprise architecture methodology providing an Architecture Development Method (ADM) with iterative phases. Includes security architecture views.
- **SABSA (Sherwood Applied Business Security Architecture):** Specifically designed for enterprise security architecture. Uses a layered model (Contextual, Conceptual, Logical, Physical, Component, Operational) aligned with business requirements. Framework asks what, why, how, who, where, when at each layer.
- **ITIL (IT Infrastructure Library):** Service management framework with security management as a key process. Not an architecture framework per se, but provides service-oriented security guidance.

### Security Evaluation Criteria
- **TCSEC (Orange Book):** Historical U.S. standard. Division D (minimal), C1 (discretionary), C2 (controlled access), B1 (labeled), B2 (structured), B3 (security domains), A1 (verified design). Rainbow Series extended to other areas (Red Book for networks).
- **ITSEC:** European standard that separated functionality from assurance. Functionality classes (F-C1 through F-B3). Assurance levels (E0-E6).
- **Common Criteria:** Current international standard. Three parts: Introduction/general model, Security functional components, Security assurance components. Uses EAL 1-7.

### Secure Design Principles (Saltzer and Schroeder + Modern)
1. **Least Privilege:** Every subject gets minimum permissions necessary
2. **Fail-Safe Defaults:** Default = deny access
3. **Economy of Mechanism:** Keep it simple (KISS)
4. **Complete Mediation:** Every access checked (reference monitor)
5. **Open Design:** Security not dependent on secrecy of design (Kerckhoffs')
6. **Separation of Privilege:** Require multiple conditions for access
7. **Least Common Mechanism:** Minimize shared mechanisms between users
8. **Psychological Acceptability:** Security should not make system harder to use
9. Additional modern principles: defense in depth, zero trust, privacy by design, shared responsibility

### Threat Modeling Frameworks
- **STRIDE:** Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege (Microsoft)
- **PASTA:** Process for Attack Simulation and Threat Analysis (risk-centric, 7 stages)
- **DREAD:** Damage, Reproducibility, Exploitability, Affected Users, Discoverability (risk rating)
- **VAST:** Visual, Agile, and Simple Threat modeling (scales for agile/DevOps)
- **Attack Trees:** Hierarchical diagram of potential attacks with root goal and sub-goals

### Cyber Kill Chain (Lockheed Martin)
1. Reconnaissance
2. Weaponization
3. Delivery
4. Exploitation
5. Installation
6. Command and Control (C2)
7. Actions on Objectives

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Cryptographic Key Lifecycle
1. **Generation:** Create keys using approved random number generators (hardware RNG preferred). Key length must meet minimum security requirements for the chosen algorithm.
2. **Distribution/Exchange:** Transfer keys securely using out-of-band methods, Diffie-Hellman key exchange, key wrapping, or PKI-based key transport. Never transmit keys in plaintext over the same channel as encrypted data.
3. **Storage:** Protect keys using HSMs, TPMs, or encrypted key stores. Implement access controls on key storage. Separate encryption keys from encrypted data.
4. **Use:** Apply keys only for their intended purpose and within their approved validity period. Track key usage and enforce usage policies.
5. **Rotation/Replacement:** Periodically replace keys based on policy, data sensitivity, and cryptoperiod (the approved lifetime for a specific key). Rotate before cryptoperiod expiration.
6. **Revocation:** Immediately revoke compromised keys. Publish revocation via CRL, OCSP, or direct notification. Cease all use of revoked keys.
7. **Archival:** Archive old keys (especially decryption keys) if needed to access historical encrypted data. Store archived keys with same or greater protection as active keys.
8. **Destruction:** Securely destroy keys when no longer needed. Use zeroization (overwriting key material). For hardware, physical destruction of the storage medium. Crypto-shredding destroys keys to make data permanently inaccessible.

### Digital Certificate Lifecycle
1. **Request/Application:** Entity submits Certificate Signing Request (CSR) to Registration Authority (RA)
2. **Validation:** RA verifies identity of requestor (domain validation, organization validation, or extended validation)
3. **Issuance:** CA signs the certificate with its private key and provides it to the entity
4. **Usage:** Certificate used for authentication, encryption, digital signatures
5. **Monitoring:** Track certificate expiration dates, usage patterns
6. **Renewal:** Replace certificate before expiration to maintain continuity
7. **Revocation:** If private key is compromised, contact CA to revoke. Certificate added to CRL and/or OCSP responder updated
8. **Expiration:** Certificate reaches end of validity period and is no longer trusted

### System Security Engineering Lifecycle
1. **Discover and Understand Requirements:** Identify security needs through risk assessment, regulatory requirements, and business objectives.
2. **Design the Architecture:** Select security controls, models, and mechanisms. Develop security architecture aligned with enterprise architecture.
3. **Implement Security Controls:** Build and configure security mechanisms according to the design specification.
4. **Verify and Validate:** Test that controls meet requirements (verification = built right; validation = built the right thing). Penetration testing, security audit.
5. **Certify and Accredit (Authorize):** Formally evaluate the system against the security requirements. Authorizing official grants Authorization to Operate (ATO).
6. **Operate and Maintain:** Monitor, patch, respond to incidents, manage changes. Continuous monitoring and assessment.
7. **Dispose/Decommission:** Securely remove system from production. Sanitize media, destroy keys, archive records.

### Common Criteria Evaluation Process
1. **Sponsor/Vendor** develops Security Target (ST) document describing product security claims
2. **Evaluation lab** (Common Criteria Testing Laboratory, CCTL) performs evaluation activities per chosen EAL
3. **Evaluators** assess TOE against ST and applicable PP requirements
4. **Certification body** reviews evaluation results
5. **Certificate** issued if product meets requirements
6. **Mutual recognition** allows certificate to be accepted across participating CCRA nations

### Incident Response in Physical Security Context
1. Detect (sensors, alarms, guards)
2. Assess (determine nature and scope)
3. Respond (activate procedures, notify personnel)
4. Recover (restore normal operations)
5. Review (post-incident analysis, lessons learned)

### Fire Emergency Response Sequence
1. Life safety (evacuate personnel)
2. Activate alarm / notify fire department
3. Contain fire (close fire doors, activate suppression)
4. Suppress fire (automated or manual)
5. Restore operations
6. Investigate cause

---

## 9. THINK LIKE A MANAGER

### Architecture Decision-Making
- **Risk-based approach:** Security architecture decisions should always be driven by risk assessment, not by choosing the strongest possible control. The right control balances risk reduction against cost, usability, and business needs.
- **Business alignment:** Security architecture must support business objectives. The CISSP exam expects you to choose answers that protect the organization while enabling operations — never security for security's sake.
- **Cost-effectiveness:** When two controls provide similar protection, the less expensive one is generally the better answer. However, never compromise critical security requirements solely for cost savings.
- **Proportionality:** Controls should be proportional to the value of the asset being protected and the risk being mitigated. Spending $1 million to protect a $10,000 asset is not a managerial decision.

### Cryptographic Selection Criteria
- Choose the algorithm appropriate for the use case: symmetric for bulk data, asymmetric for key exchange and signatures, hashing for integrity verification.
- Prefer widely reviewed, open-standard algorithms (AES, RSA, SHA-256) over proprietary algorithms. This aligns with Kerckhoffs' Principle.
- Consider performance requirements: symmetric crypto for high-throughput needs, ECC over RSA when key size/performance matters (mobile, IoT).
- Plan for crypto agility — the ability to swap algorithms when vulnerabilities are discovered or quantum computing advances.
- Key management is usually more critical than algorithm selection. A strong algorithm with weak key management provides weak security.

### Cloud Migration Security
- **Due diligence before migration:** Understand the shared responsibility model for your chosen service model. Know exactly where your responsibilities begin and the provider's end.
- **Data classification first:** Know what data is moving to the cloud and its sensitivity level. Some data may need to stay on-premises due to regulatory requirements.
- **Contractual protections:** SLAs, data processing agreements, right to audit, data portability provisions, exit strategy. A manager plans for the end of the relationship before it begins.
- **Accountability is non-transferable:** Even though the provider is responsible for platform security (in IaaS/PaaS/SaaS), the customer organization remains accountable for data protection. If a breach occurs due to provider negligence, regulatory penalties still fall on the data owner.

### Defense in Depth Strategy
- No single control is sufficient. Layer physical, technical, and administrative controls.
- Plan for control failure: what happens when the firewall goes down? What if the encryption key is compromised? Each layer should function independently.
- From a manager's perspective, defense in depth also means diversity of controls — using products from different vendors, different types of controls at each layer.

### Physical Security Management
- **Safety first, always.** In any scenario involving a conflict between security and human safety, choose safety. This principle overrides all other security considerations.
- **Balanced approach to access control:** Excessive physical security can impede business operations and emergency egress. Balance detection, deterrence, delay, and denial.
- **Environmental monitoring is proactive management:** Temperature, humidity, water, and fire detection prevent incidents rather than merely responding to them.

### Secure Design Leadership
- Insist on security involvement from the start of any project, not as an afterthought. Retrofitting security is far more expensive and less effective than building it in.
- Champion the principle of "fail securely" — systems should default to a secure state when they malfunction, rather than failing open and exposing assets.
- Promote simplicity: complexity is the enemy of security. Simpler systems have fewer vulnerabilities, are easier to test, and are more predictable in failure modes.

---

## 10. EXAM STRATEGY

### How Domain 3 Concepts Are Tested
- **Security models** are tested through scenario-based questions where you must identify which model addresses a specific organizational need. Know the properties and rules of each model cold.
- **Cryptography** is the most heavily tested area in D3. Expect questions on algorithm selection, key management, digital signatures, and PKI. Calculations on key space or number of symmetric keys are common.
- **Physical security** questions focus on fire suppression (especially which system for data centers), detection methods, fence heights, and prioritizing human safety.
- **Cloud computing** questions test understanding of the shared responsibility model, service model differences, and deployment model characteristics.
- **Common Criteria** questions test knowledge of EAL levels, the relationship between PP/ST/TOE, and the difference between CC and historical evaluation criteria.

### Question Patterns
- **"BEST" questions:** When asked for the BEST answer, all options may be partially correct. Look for the most complete, most effective, or most managerial answer.
- **"FIRST" questions:** These test your understanding of proper sequence. Security actions have a correct order (e.g., safety first, then containment, then investigation).
- **"MOST" important/effective:** Choose the answer that addresses the root cause or provides the broadest protection, not the most technically impressive solution.
- **Negation questions:** "Which is NOT..." — read carefully. These are designed to catch speed-readers who miss the negation.
- **Scenario stems:** Long question stems are common. Identify the key requirement (confidentiality? integrity? availability?) to narrow down the correct answer.

### Wrong-Answer Traps
- **Choosing overly technical solutions** when a simpler approach works. The CISSP is a management exam; managers choose the most efficient solution, not the most complex.
- **Confusing Bell-LaPadula and Biba properties.** If you mix up "no read up" vs. "no read down," you will get model questions wrong. Create a mental image: BLP = "don't Look UP" (confidentiality), Biba = "don't eat garbage" (integrity — don't read down).
- **Selecting Halon** as a fire suppression answer. Halon is banned — it should never be the correct answer for a new installation.
- **Assuming higher EAL = more secure.** Higher EAL means more rigorously tested, not necessarily more secure in practice. EAL7 products are not "more secure" than EAL4 products — they are more thoroughly evaluated.
- **Picking asymmetric crypto for bulk encryption.** Asymmetric is too slow for encrypting large amounts of data. The correct approach is hybrid: asymmetric for key exchange, symmetric for data encryption.
- **Forgetting that digital signatures use the SENDER'S PRIVATE key,** not the public key. The receiver uses the sender's public key to verify.

### Time Management for D3
- Security model and cryptography questions may require careful reading but should be answerable quickly if you know the rules and properties.
- Physical security questions are often straightforward but may have long scenarios — scan for the key requirement first.
- If stuck between two answers, choose the one that is more managerial, more risk-based, or more aligned with human safety.

---

## 11. CROSS-DOMAIN CONNECTIONS

### D3 and D1 (Security and Risk Management)
- **Risk-based design:** D3 architecture decisions are driven by D1 risk assessment and risk management principles. You design controls based on the risk analysis from D1.
- **Security policies and models:** D1 defines the security policy; D3 implements it through formal security models (Bell-LaPadula implements a confidentiality policy, Biba implements an integrity policy).
- **Business continuity:** D3 physical security (fire suppression, power management, environmental controls) directly supports D1 business continuity and disaster recovery objectives.
- **Governance frameworks:** Enterprise architecture frameworks (Zachman, TOGAF, SABSA) from D3 support D1 governance structures.
- **Legal and regulatory:** D1 covers legal requirements; D3 implements crypto export controls, privacy by design, and Common Criteria compliance.

### D3 and D4 (Communication and Network Security)
- **Network cryptography:** D3 defines cryptographic algorithms; D4 applies them to network protocols (TLS/SSL, IPsec, VPN, SSH).
- **Link vs. end-to-end encryption:** D3 covers the crypto concepts; D4 addresses where in the network stack they are applied.
- **Firewall architecture:** D3 covers the design principles; D4 covers specific firewall types and placement.
- **SASE and edge computing:** Bridge between D3 architecture concepts and D4 network security implementation.

### D3 and D5 (Identity and Access Management)
- **Security models define access rules:** Bell-LaPadula, Biba, Clark-Wilson from D3 are implemented through D5 access control mechanisms (MAC, DAC, RBAC).
- **Authentication in PKI:** D3 covers digital certificates and PKI; D5 covers authentication protocols that use them.
- **Trusted computing:** D3 TPM and secure boot support D5 device authentication and attestation.
- **Zero trust:** D3 defines the architecture; D5 implements the continuous verification of identity.

### D3 and D6 (Security Assessment and Testing)
- **Common Criteria evaluation:** D3 defines CC framework; D6 covers the testing and evaluation processes.
- **Vulnerability assessment of architectures:** D3 identifies vulnerabilities in security designs; D6 provides the assessment methodology.
- **Penetration testing of crypto implementations:** D3 covers crypto theory; D6 tests for implementation flaws.

### D3 and D7 (Security Operations)
- **Physical security operations:** D3 designs the physical controls; D7 operates and monitors them (guard patrols, CCTV monitoring, alarm response).
- **Key management operations:** D3 defines the key lifecycle; D7 performs daily key management tasks.
- **Incident response:** D3 designs resilient architecture; D7 responds when controls fail.
- **ICS/SCADA operations:** D3 covers ICS security architecture; D7 manages operational security of industrial systems.
- **Evidence handling:** D3 covers physical evidence storage; D7 covers chain of custody and forensic procedures.

### D3 and D8 (Software Development Security)
- **Secure SDLC:** D3 covers security engineering lifecycle; D8 focuses specifically on software development security practices.
- **Web application vulnerabilities:** D3 covers XSS, CSRF, SQL injection from an architecture perspective; D8 covers secure coding practices to prevent them.
- **Input validation:** D3 identifies it as the root cause of web vulnerabilities; D8 implements it in code.
- **Database security:** D3 covers aggregation, inference, polyinstantiation; D8 covers secure database design and query parameterization.
- **Cloud-native development:** D3 covers microservices and serverless architecture; D8 covers secure development practices for these paradigms.

### D3 and D2 (Asset Security)
- **Data classification and crypto:** D2 defines data classification levels; D3 selects appropriate cryptographic protection for each level.
- **Media sanitization:** D2 covers data handling requirements; D3 covers crypto-shredding as a sanitization method.
- **Cloud data protection:** D2 defines data ownership and handling; D3 implements technical protections in cloud architectures.

---

## 12. REAL-WORLD APPLICATION

### Architectural Failures
- **Heartbleed (2014):** OpenSSL buffer over-read vulnerability. Despite using strong crypto (TLS), an implementation flaw allowed attackers to read server memory, potentially exposing private keys and session data. Lesson: cryptographic strength is meaningless if the implementation has buffer management flaws. Validates the principle that implementation security is as important as algorithm security.
- **WEP (Wired Equivalent Privacy):** Used RC4 stream cipher with short IVs (24-bit) and static keys. IV reuse allowed key recovery within minutes. Lesson: even a sound algorithm (RC4 was once acceptable) can be rendered useless by poor protocol design (short IV, static keys). Replaced by WPA/WPA2/WPA3 with AES.
- **SolarWinds Supply Chain Attack (2020):** Attackers compromised the build process to inject malware into legitimate software updates. Despite strong perimeter security, the trusted supply chain became the attack vector. Lesson: defense in depth must include supply chain security, code signing validation, and zero trust principles.

### Crypto Breaches and Incidents
- **RSA SecurID Breach (2011):** Attackers stole seed records for RSA SecurID tokens. Even though the crypto algorithm was unbroken, the compromise of key material undermined the entire system. Lesson: key management and key protection are the critical weak points, not the algorithms.
- **DigiNotar CA Compromise (2011):** A Certificate Authority was hacked, allowing attackers to issue fraudulent certificates for Google and other domains. Led to man-in-the-middle attacks on Iranian users. Lesson: the entire PKI trust model depends on CA integrity. Certificate transparency and pinning are mitigations.
- **MD5 Collision Exploitation (Flame Malware, 2012):** Nation-state attackers exploited MD5 hash collisions to forge Microsoft Windows Update certificates. Lesson: deprecated hash algorithms have real-world exploitable consequences.

### Cloud Architecture Scenarios
- **Capital One Breach (2019):** A misconfigured WAF in AWS allowed an attacker to access IAM credentials via SSRF, leading to exposure of 100+ million customer records. Lesson: shared responsibility means the customer must properly configure cloud security controls. The cloud provider's infrastructure was not breached — the customer's configuration was flawed.
- **Multi-tenancy isolation failure:** If a hypervisor vulnerability allows VM escape, one tenant can access another tenant's data. This risk is mitigated by proper hypervisor patching, hardware-assisted virtualization, and network micro-segmentation.

### Physical Security Scenarios
- **Data center power failure cascades:** Organizations relying on single UPS systems without generator backup have experienced extended outages. Proper design includes: dual power feeds, UPS for bridge power, automatic generator switchover, regular testing of failover procedures.
- **Water damage from fire suppression:** Accidental activation of wet-pipe sprinkler systems in data centers has caused millions in equipment damage. This is precisely why pre-action systems (or gas-based systems) are recommended for areas with expensive equipment.
- **Social engineering at physical perimeters:** Tailgating remains one of the most common physical security breaches. Mantraps, badge readers, and security awareness training are the primary countermeasures.

### Industrial Control System Incidents
- **Stuxnet (2010):** Malware targeting Siemens PLCs in Iranian nuclear facilities. Demonstrated that air-gapped industrial systems can be compromised via USB drives. Changed global understanding of ICS/SCADA security.
- **Ukraine Power Grid Attack (2015):** Attackers used spear phishing to gain access, then used ICS protocols to open circuit breakers, causing blackout for 230,000 customers. Demonstrated that network segmentation between IT and OT environments is critical.

---

## 13. MEMORY AIDS AND MNEMONICS

### Security Models
- **"BLP = Bell Looks uP"** — Bell-LaPadula prevents looking (reading) UP to higher classifications. It's about confidentiality, keeping secrets from those below.
- **"Biba = don't eat Bad garbage from Below"** — Biba prevents reading DOWN to lower integrity levels. It protects integrity by not accepting untrustworthy data.
- **"BLP writes DOWN the SECRET, Biba writes UP the TRUTH"** — Bell-LaPadula's star property prevents writing down (leaking secrets). Biba's star property prevents writing up (corrupting higher integrity data).
- **"Clark-Wilson = Well-Formed Transactions via Triple Play"** — Remember Clark-Wilson uses access triples (Subject, TP, CDI) and well-formed transactions for integrity.
- **"Chinese Wall = Can't Cross the WALL between Competitors"** — Brewer-Nash dynamically blocks access once you've seen one side of a competitive divide.

### Cryptographic Algorithms — "DABRIT" for Symmetric Key Lengths
- **D**ES = 56 bits
- **A**ES = 128/192/256 bits
- **B**lowfish = up to 448 bits
- **R**C4 = variable (40-2048 bits)
- **I**DEA = 128 bits
- **T**wofish = 256 bits
- Or just remember: **"DES is old (56), AES is gold (128/192/256)"**

### Asymmetric Algorithms — "RED"
- **R**SA = factoring (multiplying primes is easy, factoring them back is hard)
- **E**CC = elliptic curve discrete logarithm problem (shorter keys, same security)
- **D**iffie-Hellman = discrete logarithm (key exchange ONLY, not encryption)

### Hashing Digest Sizes — "MD5 Shakes SHA"
- **MD5** = 128 bits (broken, do not use)
- **SHA-1** = 160 bits (deprecated)
- **SHA-256** = 256 bits (current standard)
- **SHA-512** = 512 bits (strongest common variant)
- Memory trick: **"MD5 has 1-2-8, SHA-1 wants 1-6-0"**

### Block Cipher Modes — "Every Cipher Can Operate Correctly with GCM"
- **E**CB (Electronic Codebook) — weakest, no IV
- **C**BC (Cipher Block Chaining) — uses IV, chains blocks
- **C**FB (Cipher Feedback)
- **O**FB (Output Feedback)
- **C**TR (Counter) — fastest block mode, parallelizable
- **G**CM (Galois Counter Mode) — authenticated encryption
- Memory: **"ECB is Easy but Crappy, CBC Chains Blocks Carefully, CTR Counts and is the king"**

### Five Services of Cryptography — "CIANA"
- **C**onfidentiality
- **I**ntegrity
- **A**uthentication
- **N**onrepudiation
- **A**ccess control

### Common Criteria — "PP ST TOE EAL"
- **P**rotection **P**rofile = what you NEED (requirements document)
- **S**ecurity **T**arget = what you CLAIM (vendor's security statement)
- **T**arget **O**f **E**valuation = what you TEST (the actual product)
- **E**AL = how THOROUGHLY you test (1-7)
- Memory: **"The PP describes what we need, the ST describes what we claim, the TOE is what we test, and the EAL is how deep we test it."**

### EAL Levels — "Fun Students Make Decisions Seriously, Selectively, Formally"
- EAL1 = **F**unctionally tested
- EAL2 = **S**tructurally tested
- EAL3 = **M**ethodically tested and checked
- EAL4 = **M**ethodically **D**esigned, tested, and reviewed
- EAL5 = **S**emi-formally designed and tested
- EAL6 = **S**emi-formally verified
- EAL7 = **F**ormally verified design and tested

### Fire Suppression — "Don't HIRE Halon"
- **H**alon is **I**llegal (banned, ozone-depleting)
- **R**eplace with **E**co-friendly agents (FM-200, INERGEN, Argonite, Aero-K)

### Fire Classes — "Always Be Careful with Dangerous Kitchen fires"
- Class **A** = Ash (common combustibles)
- Class **B** = Barrel/Boil (liquids)
- Class **C** = Current (electrical)
- Class **D** = Dynamite metal (combustible metals)
- Class **K** = Kitchen (cooking oils/grease)

### Physical Security Fence Heights — "3-6-8 Rule"
- **3-4 feet:** Casual deterrent (won't stop anyone determined)
- **6-7 feet:** Hard to climb (stops most)
- **8+ feet:** Serious security (add barbed wire for maximum)

### Cloud Service Models — "SPI Stack"
- **S**aaS = Software (you get the app, provider does everything else)
- **P**aaS = Platform (you build your app, provider handles infrastructure)
- **I**aaS = Infrastructure (you get hardware, you handle everything from OS up)
- Memory: **"Pizza analogy — SaaS is eating at a restaurant (everything done for you), PaaS is meal kits (you cook but ingredients provided), IaaS is buying groceries (you do it all)"**

### Symmetric Key Formula — "Handshake Problem"
- Keys needed = n(n-1)/2
- Think of it as: **"Everyone shakes hands with everyone else, but each handshake only happens once"**

### Hypervisor Types — "Type 1 = numero UNO, runs directly on hardware (bare metal). Type 2 = TWO layers (hardware + OS underneath)"

### Digital Signature Process — "Hash then Encrypt with Private key"
- Sender: **H**ash the message, **E**ncrypt the hash with **P**rivate key = HEP
- Receiver: **D**ecrypt with sender's **P**ublic key, **H**ash received message, **C**ompare = DPHC

### Defense in Depth — "Onion Layers"
- Physical > Network > Host > Application > Data
- Each layer protects even if outer layers are breached, like peeling an onion — attackers must penetrate every layer

### Zero Trust Pillars — "Never Trust, Always Verify"
- Know your architecture, identity, and health
- Authenticate and authorize every access request
- Monitor and log everything

---

## 14. PRACTICE QUESTION PATTERNS

### Security Model Questions
- **Pattern:** A scenario describes an organization's access control needs, and you must identify the correct formal model. Common distractors: swapping Bell-LaPadula and Biba properties, confusing Clark-Wilson with MAC models.
- **What they test:** Do you know which model addresses confidentiality vs. integrity? Can you distinguish mandatory models from transaction-based models?
- **Distractor patterns:** Answers that describe correct properties but attribute them to the wrong model. For example, "no write down" attributed to Biba instead of Bell-LaPadula.

### Cryptographic Algorithm Selection
- **Pattern:** A scenario describes data protection needs (bulk encryption, key exchange, integrity verification, nonrepudiation) and asks which algorithm or technique to use.
- **What they test:** Can you match the right tool to the job? Do you understand that DH is key exchange only, that digital signatures don't encrypt, that hashing isn't encryption?
- **Distractor patterns:** Offering asymmetric encryption for bulk data (wrong — too slow), suggesting DES for new implementations (wrong — broken), presenting digital signatures as providing confidentiality (wrong — integrity/auth/nonrepudiation only).

### Key Management Questions
- **Pattern:** Questions about key lifecycle phases, proper key destruction methods, key escrow implications, or M-of-N control requirements.
- **What they test:** Understanding that key management is often the weakest link, proper procedures for each lifecycle phase.
- **Distractor patterns:** Mixing up key archival with key escrow, suggesting keys can be safely transmitted in-band without additional protection.

### Physical Security Scenario Questions
- **Pattern:** Long scenario describing a facility's needs, asking which control is most appropriate. Often involves fire suppression for data centers, motion detection type selection, or access control for specific areas.
- **What they test:** Do you know pre-action is best for data center water-based suppression? That VESDA is best for early fire detection? That safety trumps security?
- **Distractor patterns:** Offering Halon as a suppression option, choosing wet pipe for a data center, suggesting fail-secure for an emergency exit.

### Cloud Computing Questions
- **Pattern:** Scenario about cloud migration or cloud incident. Who is accountable? Which service model gives more customer control? What is the primary risk?
- **What they test:** Shared responsibility understanding, accountability vs. responsibility distinction, service model differences.
- **Distractor patterns:** Saying the cloud provider is accountable for customer data, confusing VPC with private cloud, suggesting SaaS gives the customer control over infrastructure.

### Common Criteria Questions
- **Pattern:** Questions about the evaluation process, what PP/ST/TOE represent, or what specific EAL levels mean.
- **What they test:** Understanding of the CC framework structure and what evaluation assurance levels actually indicate.
- **Distractor patterns:** Suggesting EAL7 means the product is perfectly secure, confusing Protection Profiles with Security Targets.

### "What Would You Do FIRST" Questions
- **Pattern:** An incident or situation requires multiple actions. You must identify the correct first step.
- **For physical security incidents:** Human safety first, always.
- **For architectural decisions:** Risk assessment first, then design, then implementation.
- **For crypto incidents:** Revoke compromised keys first, then investigate, then reissue.

### Hybrid/Cross-Domain Questions
- **Pattern:** Questions that span D3 and another domain, requiring you to apply D3 concepts in the context of network security (D4), risk management (D1), or software security (D8).
- **What they test:** Can you apply architectural thinking across domains? Do you understand how crypto supports network protocols?
- **Distractor patterns:** Treating domains as isolated silos rather than interconnected knowledge areas.

---

## 15. GAPS TO ADD

The current story mode covers: Bell-LaPadula, Biba, Clark-Wilson, Symmetric/Asymmetric crypto, Hashing, Secure Design Principles, Common Criteria/EAL, Covert Channels.

### High-Priority Gaps (heavily tested, not in story)
1. **PKI and Digital Certificates** — X.509 standard, CA hierarchy, certificate lifecycle, CRL/OCSP, chain of trust, certificate pinning, cross-certification. This is a major exam topic with no current story coverage.
2. **Digital Signatures** — How they work (hash + encrypt with private key), what they provide (integrity, authentication, nonrepudiation but NOT confidentiality), DSA, RSA signatures, ECDSA, code signing. Critical for understanding nonrepudiation.
3. **Key Management Lifecycle** — Generation, distribution, storage, rotation, revocation, destruction, escrow, M-of-N control. This is where crypto fails in practice and is heavily tested.
4. **Cloud Computing Security** — Service models (IaaS/PaaS/SaaS), deployment models, shared responsibility, multi-tenancy, accountability vs. responsibility. Major modern exam topic.
5. **Cryptanalytic Attacks** — Brute force, birthday attack, meet-in-the-middle, known/chosen plaintext, side-channel, rainbow tables, frequency analysis. Students need to understand how crypto is broken, not just how it works.
6. **Fire Prevention, Detection, and Suppression** — Fire classes, detection types (VESDA, ionization, photoelectric), water-based systems (wet/dry/pre-action/deluge), gas-based systems (FM-200, INERGEN, Halon ban). Physical security is a significant portion of D3.
7. **Virtualization and Hypervisor Security** — Type 1 vs. Type 2, VM escape, VM sprawl, container security, hypervisor hardening. Critical for modern infrastructure.

### Medium-Priority Gaps (tested, valuable additions)
8. **Block Cipher Modes of Operation** — ECB, CBC, CFB, OFB, CTR, GCM. Understanding why ECB is insecure and when to use each mode.
9. **Brewer-Nash (Chinese Wall) Model** — Dynamic conflict-of-interest model, important for consulting/financial scenarios.
10. **TOCTOU / Race Conditions** — Time-of-check/time-of-use vulnerabilities, how to mitigate.
11. **Physical Access Controls** — Fences, gates, mantraps, locks, CCTV, motion detectors (types), guards, lighting requirements.
12. **Power and Environmental Controls** — UPS, generators, HVAC, humidity, temperature, TEMPEST/emanation security.
13. **ICS/SCADA Security** — PLCs, air-gapping, unique challenges of operational technology, real-world incidents (Stuxnet).
14. **TPM and HSM** — Hardware roots of trust, secure boot, measured boot, attestation.
15. **Steganography** — Hiding data within other media, digital watermarking, null ciphers. Distinct from encryption.

### Lower-Priority Gaps (less frequently tested, good for completeness)
16. **Homomorphic Encryption** — Computing on encrypted data without decryption, cloud computing applications.
17. **Quantum Cryptography and Post-Quantum** — QKD, threats to RSA/ECC, lattice-based crypto, NIST PQC standards.
18. **Lightweight Cryptography** — IoT and embedded systems crypto constraints.
19. **Graham-Denning, HRU, Take-Grant, Goguen-Meseguer, Sutherland Models** — Less commonly tested formal models but may appear.
20. **Enterprise Architecture Frameworks** — Zachman, TOGAF, SABSA. Tested at a conceptual level.
21. **CPTED (Crime Prevention Through Environmental Design)** — Natural surveillance, access control, territorial reinforcement.
22. **Edge Computing, Fog Computing, CDN Security** — Emerging architectural patterns.
23. **Microservices and Serverless Security** — API security, container orchestration, FaaS patterns.
24. **Security Modes of Operation** — Dedicated, system high, compartmented, multilevel modes for system clearance.
25. **Web Application Vulnerabilities (XSS, CSRF, SQLi)** — While partially covered through general security, dedicated story content on input validation as the root cause of web exploits would reinforce D3 and D8 connections.
26. **Hybrid Cryptography** — How real-world protocols (TLS, PGP) combine symmetric and asymmetric crypto. Essential for understanding practical crypto application.
27. **One-Time Pad** — Theoretically perfect encryption and its strict requirements. Classic exam question topic.
28. **Crypto-shredding and Data Remanence in Cloud** — Destroying keys as a means of data destruction in environments where physical media destruction is not possible.

---

*This knowledge base synthesizes content from five CISSP study resources covering Domain 3: Security Architecture and Engineering. All content has been restated in original language for learning purposes. Use this as a comprehensive study reference and as source material for building quiz questions, story lessons, and reference library content in CISSP Quest.*
