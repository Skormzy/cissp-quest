import { ActDefinition } from '@/lib/story-types';

export const domain3Act2: ActDefinition = {
  actNumber: 2,
  title: 'The Investigation',
  description:
    'Investigate the Zurich server farm breach: trace forged certificates through the PKI chain, expose cloud misconfigurations, and uncover physical security failures — from fire suppression to access control.',
  xpReward: 250,
  conceptsCovered: [
    'PKI and Digital Certificates',
    'Digital Signatures',
    'Key Management Lifecycle',
    'Hybrid Cryptography',
    'Cloud Computing Security',
    'Virtualization and Hypervisor Security',
    'Fire Prevention Detection and Suppression',
    'Physical Access Controls',
    'Power and Environmental Controls',
    'TPM and HSM',
    'CPTED',
    'Zero Trust Architecture',
  ],
  estimatedMinutes: 24,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Transition: Day 2, Forensics Lab
    // ================================================================

    // 1-1. Transition
    {
      type: 'transition',
      id: 'd3a2s1-transition-1',
      location: 'zurich',
      description: 'AlpineVault Server Farm — Forensics Lab, Sub-Level 2',
      animation: 'fade',
      timeSkipText: 'Day 2 — 0715 Hours',
    },

    // 1-2. Reeves opens Day 2
    {
      type: 'dialogue',
      id: 'd3a2s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Morning, {player}. The overnight forensics team found three separate attack vectors. The attacker forged TLS certificates to intercept encrypted traffic, exploited misconfigured cloud infrastructure, and bypassed physical access controls to plant hardware implants. Today we dissect each one.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 1-3. Janet sets the technical stage
    {
      type: 'dialogue',
      id: 'd3a2s1-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The certificate forgery is our starting point. If we understand how the trust chain was broken, we can trace every communication the attacker intercepted. Let me walk you through how PKI is supposed to work — so you can see exactly where it failed.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 2 — PKI and Digital Certificates
    //           (Janet, "Digital Passport Office")
    //           Interactive Image: process_flow + Knowledge Check
    // ================================================================

    // 2-1. Janet introduces the analogy
    {
      type: 'dialogue',
      id: 'd3a2s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Think of PKI as a "Digital Passport Office." Just like a government issues passports to prove your identity, a Certificate Authority — CA — issues digital certificates to prove a server or person is who they claim to be. The entire system runs on a hierarchy of trust.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2-2. Janet explains the hierarchy
    {
      type: 'dialogue',
      id: 'd3a2s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'At the top is the Root CA — the federal government in our analogy. It\'s kept offline, locked in a vault, and only signs certificates for Intermediate CAs. Those intermediates are like regional passport offices — they handle day-to-day issuance of End Entity certificates to servers and users. The certificate format is X.509, and it contains the public key, the issuer, validity dates, and a digital signature from the issuing CA.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 2-3. Janet explains revocation
    {
      type: 'dialogue',
      id: 'd3a2s2-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'When a certificate is compromised — like a stolen passport — it needs to be revoked. Two methods: the CRL, Certificate Revocation List, is a periodic batch download of all revoked certificates. Think of it as a published "most wanted" list that gets updated every few hours. OCSP — Online Certificate Status Protocol — is real-time. You ask "is this certificate valid right now?" and get an immediate yes or no. OCSP is faster but requires the responder to be online.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2-4. Interactive Image — Certificate Chain of Trust
    {
      type: 'interactiveImage',
      id: 'd3a2s2-interactive-1',
      title: 'Digital Passport Office — Certificate Chain of Trust',
      imageType: 'process_flow',
      backgroundGradient:
        'linear-gradient(135deg, #0a1628 0%, #102040 40%, #0a1628 100%)',
      conceptName: 'PKI and Digital Certificates',
      speaker: 'janet',
      dialogue:
        'Click each element to trace how trust flows from the Root CA down to the end entity certificate — and how the attacker broke the chain.',
      completionDialogue:
        'The attacker compromised an intermediate CA\'s private key and used it to forge valid-looking end entity certificates. Every browser trusted them because the chain appeared intact. This is why protecting CA private keys is paramount — one compromised intermediate CA undermines the entire trust hierarchy below it.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'root-ca-hotspot',
          label: 'Root CA',
          x: 40,
          y: 5,
          width: 20,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The Root CA is the ultimate trust anchor — the federal government of the digital world. Its private key is kept offline in a hardened facility, often an HSM in a vault. The Root CA signs intermediate CA certificates and NOTHING else. If the Root CA is compromised, the ENTIRE PKI collapses. That is why it stays offline.',
          detail:
            'Root CA: self-signed certificate, offline storage, signs only intermediate CA certs. Compromise = total PKI failure.',
        },
        {
          id: 'intermediate-ca-hotspot',
          label: 'Intermediate CA',
          x: 35,
          y: 30,
          width: 30,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Intermediate CAs are the regional passport offices. They hold a certificate signed by the Root CA and use their own private key to sign end entity certificates. This layering protects the Root — if an intermediate is compromised, only that branch of the tree is affected. You revoke the intermediate and re-issue certificates from a different one.',
          detail:
            'Intermediate CA: signed by Root, issues end entity certs. Provides isolation — compromise is contained to its branch.',
        },
        {
          id: 'end-entity-hotspot',
          label: 'End Entity Certificate',
          x: 30,
          y: 58,
          width: 40,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'End entity certificates are the passports themselves — issued to servers, users, or devices. They contain: the subject\'s public key, the issuer (intermediate CA), validity period, serial number, and the CA\'s digital signature. The X.509 standard defines the format. When your browser connects to a site, it walks the chain: end entity signed by intermediate, intermediate signed by root, root is in the browser\'s trusted store.',
          detail:
            'X.509 end entity certificate: public key + issuer + validity + serial number + CA signature. Browser validates the full chain.',
        },
        {
          id: 'crl-hotspot',
          label: 'CRL / OCSP',
          x: 72,
          y: 30,
          width: 22,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Revocation checking: CRL is a periodic "most wanted" list — downloaded on schedule, may be stale between updates. OCSP provides real-time status queries. OCSP Stapling lets the server itself fetch and attach (staple) the OCSP response, reducing the load on OCSP responders. The attacker exploited a gap: AlpineVault relied solely on CRL with 24-hour refresh intervals. The forged certs were used and discarded within hours, before the next CRL update.',
          detail:
            'CRL = batch list (periodic). OCSP = real-time query. OCSP Stapling = server provides proof. Gap in CRL freshness enabled the attack.',
        },
        {
          id: 'trust-store-hotspot',
          label: 'Trust Store',
          x: 5,
          y: 30,
          width: 22,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The trust store is the list of Root CA certificates your browser or OS implicitly trusts — like the list of countries whose passports you accept at the border. If a Root CA is in the trust store, any valid chain back to it is trusted. Certificate pinning is an extra safeguard — it tells the client "only accept THIS specific certificate or CA for this domain," preventing even a valid-looking forged certificate from being accepted.',
          detail:
            'Trust store: pre-loaded Root CA certs. Certificate pinning adds domain-specific trust restrictions beyond the chain.',
        },
      ],
    },

    // 2-5. Knowledge Check — PKI
    {
      type: 'knowledgeCheck',
      id: 'd3a2s2-kc-1',
      question:
        'During a forensic investigation, analysts discover that an attacker used a compromised intermediate CA to issue fraudulent server certificates. The Root CA was not compromised. What is the MOST appropriate immediate response?',
      options: [
        'Revoke the Root CA certificate and rebuild the entire PKI',
        'Revoke the compromised intermediate CA certificate and re-issue end entity certificates from a different intermediate CA',
        'Update the CRL refresh interval to every 5 minutes',
        'Switch all systems from CRL to OCSP stapling',
      ],
      correctIndex: 1,
      explanation:
        'When an intermediate CA is compromised but the Root CA is intact, you revoke the compromised intermediate and re-issue certificates from a healthy intermediate. This is exactly WHY the PKI hierarchy exists — to contain compromise. Revoking the Root CA would destroy the entire PKI unnecessarily. Changing CRL timing or switching to OCSP are improvements but do not address the active compromise.',
      memoryHack:
        'Digital Passport Office: Compromised regional office? Shut it down and transfer operations to another office. You don\'t burn down the federal government (Root CA) because one branch was infiltrated.',
      conceptName: 'PKI and Digital Certificates',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — Digital Signatures
    //           (Janet, "Wax Seal and Signet Ring")
    //           Interactive Image: process_flow + Knowledge Check
    //           EXAM TRAP: signatures do NOT provide confidentiality
    // ================================================================

    // 3-1. Janet introduces digital signatures
    {
      type: 'dialogue',
      id: 'd3a2s3-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The forged certificates were digitally signed — which is how they looked legitimate. Let me explain how digital signatures actually work. Think of it as a "Wax Seal and Signet Ring." In medieval times, a noble pressed their unique signet ring into hot wax to seal a letter. Only that ring could make that impression. A digital signature works the same way — only the sender\'s private key can create it.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 3-2. Janet explains the process
    {
      type: 'dialogue',
      id: 'd3a2s3-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Here is the critical exam concept: to create a digital signature, you first HASH the message to create a fixed-length digest, then ENCRYPT that hash with the sender\'s PRIVATE key. The recipient decrypts the signature with the sender\'s PUBLIC key and compares the hash. If they match, three things are proven: integrity — the message was not altered; authentication — only the private key holder could have created the signature; and nonrepudiation — the sender cannot deny signing it.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 3-3. Janet flags the exam trap
    {
      type: 'dialogue',
      id: 'd3a2s3-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'And here is the EXAM TRAP that catches people every time: digital signatures do NOT provide confidentiality. The message itself is sent in plaintext — anyone can read it. The signature only proves WHO sent it and that it was not CHANGED. If you need confidentiality, you must ALSO encrypt the message. Do not confuse signing with encrypting.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 3-4. Interactive Image — Signature creation and verification
    {
      type: 'interactiveImage',
      id: 'd3a2s3-interactive-1',
      title: 'Wax Seal and Signet Ring — Digital Signature Process',
      imageType: 'process_flow',
      backgroundGradient:
        'linear-gradient(135deg, #0d1520 0%, #1a1535 40%, #0d1520 100%)',
      conceptName: 'Digital Signatures',
      speaker: 'janet',
      dialogue:
        'Click each step to follow the signature from creation to verification. Pay attention to WHICH key is used WHERE — that is the most tested detail.',
      completionDialogue:
        'Remember the key rule: sign with PRIVATE, verify with PUBLIC. This is the OPPOSITE of encryption, where you encrypt with the recipient\'s PUBLIC key and decrypt with PRIVATE. The exam loves to swap these to trick you.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'hash-message-hotspot',
          label: 'Step 1: Hash the Message',
          x: 5,
          y: 25,
          width: 22,
          height: 50,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The sender runs the original message through a hash algorithm (SHA-256 is common) to produce a fixed-length message digest. This digest is a unique fingerprint of the message — change even one character and the hash is completely different. The hash itself does NOT encrypt the message.',
          detail:
            'Step 1: Message -> Hash Algorithm (SHA-256) -> Message Digest (fixed-length fingerprint).',
        },
        {
          id: 'encrypt-hash-hotspot',
          label: 'Step 2: Encrypt Hash with Private Key',
          x: 28,
          y: 25,
          width: 22,
          height: 50,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The sender encrypts the message digest using their OWN PRIVATE KEY. This encrypted hash IS the digital signature. Only the sender\'s private key could produce this exact output — that is what provides authentication and nonrepudiation. The PRIVATE key is the signet ring.',
          detail:
            'Step 2: Message Digest + Sender\'s PRIVATE Key -> Digital Signature. The private key = the signet ring.',
        },
        {
          id: 'send-bundle-hotspot',
          label: 'Step 3: Send Message + Signature',
          x: 52,
          y: 25,
          width: 22,
          height: 50,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The sender transmits BOTH the original plaintext message AND the digital signature. Notice: the message is NOT encrypted — it is readable by anyone. The signature rides alongside the message, just like a wax seal on the outside of a letter. The letter is still readable; the seal just proves who sent it.',
          detail:
            'Step 3: Original message (plaintext!) + Digital Signature sent together. Message is NOT confidential.',
        },
        {
          id: 'verify-signature-hotspot',
          label: 'Step 4: Verify with Public Key',
          x: 76,
          y: 25,
          width: 22,
          height: 50,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The recipient decrypts the signature using the sender\'s PUBLIC KEY to recover the original hash. They independently hash the received message. If the two hashes match: the message was not altered (integrity), only the private key holder could have created it (authentication), and the sender cannot deny it (nonrepudiation). If they do NOT match, the message was tampered with OR the signature is forged.',
          detail:
            'Step 4: Decrypt signature with sender\'s PUBLIC key -> hash. Hash received message independently. Compare. Match = valid.',
        },
      ],
    },

    // 3-5. Knowledge Check — Digital Signatures
    {
      type: 'knowledgeCheck',
      id: 'd3a2s3-kc-1',
      question:
        'A manager asks which security services a digital signature provides. Which combination is MOST accurate?',
      options: [
        'Confidentiality, integrity, and authentication',
        'Integrity, authentication, and nonrepudiation',
        'Confidentiality, nonrepudiation, and availability',
        'Authentication, confidentiality, and nonrepudiation',
      ],
      correctIndex: 1,
      explanation:
        'Digital signatures provide integrity (the hash proves the message was not altered), authentication (only the private key holder could create the signature), and nonrepudiation (the sender cannot deny signing). They do NOT provide confidentiality — the message is sent in plaintext alongside the signature. Any option that includes confidentiality is wrong.',
      memoryHack:
        'Wax Seal: A wax seal on a letter proves WHO sent it (authentication), proves it was not OPENED and resealed (integrity), and the noble cannot deny their ring made the impression (nonrepudiation). But anyone can READ the envelope — there is no confidentiality. Mnemonic: "IAN" — Integrity, Authentication, Nonrepudiation.',
      conceptName: 'Digital Signatures',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Key Management Lifecycle
    //           (Janet, "Key Ring Maintenance")
    //           Knowledge Check
    // ================================================================

    // 4-1. Janet introduces key management
    {
      type: 'dialogue',
      id: 'd3a2s4-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The forged certificates worked because AlpineVault failed at key management. Their intermediate CA private key was stored on an unencrypted file share — no HSM, no rotation, no access controls. Think of key management as "Key Ring Maintenance." Every key on your ring has a lifecycle, and if you skip any step, you end up with a compromised key on a ring that opens every door.',
      leftCharacter: 'janet',
      leftExpression: 'worried',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 4-2. Visual Aid — Key Lifecycle stages
    {
      type: 'visualAid',
      id: 'd3a2s4-visual-1',
      title: 'Key Ring Maintenance — Cryptographic Key Lifecycle',
      aidType: 'list',
      items: [
        {
          label: '1. Generation (Cut the Key)',
          description:
            'Create keys using approved algorithms with sufficient entropy. Weak random number generators produce predictable keys. Use FIPS 140-2 validated modules.',
        },
        {
          label: '2. Distribution (Hand Out Copies)',
          description:
            'Securely transport keys to authorized parties. Never send keys over unencrypted channels. Use key wrapping, Diffie-Hellman exchange, or out-of-band delivery.',
        },
        {
          label: '3. Storage (Lock Up the Key Ring)',
          description:
            'Protect keys at rest using HSMs, key vaults, or encrypted key stores. Never store keys in plaintext on file shares — exactly what AlpineVault did wrong.',
        },
        {
          label: '4. Use (Open Doors Carefully)',
          description:
            'Keys should only be used for their intended purpose. A signing key should not be used for encryption. Separate keys for separate functions — key separation.',
        },
        {
          label: '5. Rotation (Change the Locks)',
          description:
            'Periodically replace keys to limit the damage window if a key is compromised. Cryptoperiod defines how long a key should be used. Shorter periods = lower risk.',
        },
        {
          label: '6. Revocation (Deactivate the Key)',
          description:
            'When a key is compromised or no longer needed, revoke it immediately. Publish to CRL or OCSP. The gap between compromise and revocation is your vulnerability window.',
        },
        {
          label: '7. Archival (Store in the Safe)',
          description:
            'Retain old keys for decrypting archived data or verifying old signatures. Archived keys must still be protected — they can unlock historical data.',
        },
        {
          label: '8. Destruction (Shred the Key)',
          description:
            'When a key is no longer needed for any purpose, securely destroy it. Use cryptographic erasure — overwrite key material. Ensure no copies remain in backups or memory.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'Eight stages, eight opportunities to fail. AlpineVault skipped stages 3, 5, and 6 — they stored keys in plaintext, never rotated them, and had no revocation process. The attacker just copied the file and started forging certificates.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
    },

    // 4-3. Knowledge Check — Key Management
    {
      type: 'knowledgeCheck',
      id: 'd3a2s4-kc-1',
      question:
        'An organization\'s encryption key was potentially exposed during a network breach. The key is used to encrypt archived financial records that must be retained for regulatory compliance. What is the BEST course of action?',
      options: [
        'Immediately destroy the compromised key and all encrypted archives',
        'Revoke the compromised key, generate a new key, re-encrypt the archives, then securely archive the old key for verification purposes',
        'Continue using the same key since the archives are already encrypted',
        'Rotate the key on the next scheduled rotation date',
      ],
      correctIndex: 1,
      explanation:
        'The key must be revoked immediately (not at the next rotation), a new key generated, and archives re-encrypted. The old key is archived (not destroyed) because it may be needed to verify historical signatures or decrypt data during transition. Continuing to use a compromised key or waiting for rotation leaves the data exposed.',
      memoryHack:
        'Key Ring Maintenance: Compromised key = burglar has a copy. Change the lock NOW (revoke + generate new), move your valuables to the new safe (re-encrypt), but keep the old key in evidence lockup (archive) — you might need it in court.',
      conceptName: 'Key Management Lifecycle',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — Hybrid Cryptography
    //           (Janet, "Envelope Inside a Lockbox")
    //           Knowledge Check
    // ================================================================

    // 5-1. Janet introduces hybrid crypto
    {
      type: 'dialogue',
      id: 'd3a2s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Now let me connect PKI to real-world encryption. Pure asymmetric encryption is mathematically slow — you would not encrypt a 10 GB database with RSA. Pure symmetric encryption is fast but has the key distribution problem — how do you share the secret key securely? The answer is hybrid cryptography. I call it "Envelope Inside a Lockbox."',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5-2. Janet explains the TLS handshake
    {
      type: 'dialogue',
      id: 'd3a2s5-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Here is how it works in TLS — the protocol that secures every HTTPS connection. First, the client and server use asymmetric cryptography to securely exchange a temporary symmetric session key. That is the lockbox — slow but secure for small payloads like a key. Then all actual data flows through fast symmetric encryption using that session key. That is the envelope — fast for bulk data. The session key is temporary and discarded when the connection closes.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 5-3. Janet ties it back to the investigation
    {
      type: 'dialogue',
      id: 'd3a2s5-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The attacker\'s forged certificates let them intercept the TLS handshake. They positioned themselves as a man-in-the-middle, presenting the forged cert to the client while establishing their own session with the real server. The client thought it had a secure session with AlpineVault — but the session key was actually shared with the attacker. Every "encrypted" communication was readable.',
      leftCharacter: 'janet',
      leftExpression: 'worried',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 5-4. Knowledge Check — Hybrid Cryptography
    {
      type: 'knowledgeCheck',
      id: 'd3a2s5-kc-1',
      question:
        'During a TLS handshake, asymmetric cryptography is used to securely exchange a symmetric session key. Why does TLS use this hybrid approach instead of encrypting all data with asymmetric cryptography?',
      options: [
        'Asymmetric algorithms cannot encrypt data larger than the key size',
        'Symmetric encryption provides stronger security than asymmetric encryption',
        'Asymmetric encryption is computationally expensive and too slow for bulk data transfer',
        'Symmetric keys cannot be generated without asymmetric cryptography',
      ],
      correctIndex: 2,
      explanation:
        'Asymmetric encryption (RSA, ECC) is computationally expensive — roughly 1000x slower than symmetric encryption (AES). TLS uses asymmetric crypto only for the initial key exchange (small data), then switches to fast symmetric encryption for the actual data stream. This gives you the best of both worlds: secure key distribution plus fast bulk encryption.',
      memoryHack:
        'Envelope Inside a Lockbox: The lockbox (asymmetric) is heavy and slow to open — you would not ship all your mail in lockboxes. Use one lockbox to send the envelope key (symmetric session key), then send all the actual mail in fast, lightweight envelopes.',
      conceptName: 'Hybrid Cryptography',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Cloud Computing Security
    //           (Kai, "Shared Apartment Building")
    //           Interactive Image: comparison + Knowledge Check
    //           + Think Like a Manager
    // ================================================================

    // 6-1. Transition to cloud investigation
    {
      type: 'dialogue',
      id: 'd3a2s6-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Next attack vector: AlpineVault was running workloads in a public cloud, but the security configurations were... inadequate. Kai, break it down.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // 6-2. Kai introduces cloud security
    {
      type: 'dialogue',
      id: 'd3a2s6-dialogue-2',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Cloud computing is like a "Shared Apartment Building." You share the building with other tenants, and depending on your lease type, the landlord manages different things. In IaaS — Infrastructure as a Service — you rent a bare apartment. The landlord provides the building structure, but you furnish, decorate, and secure everything inside. In PaaS — Platform as a Service — it comes furnished. You just bring your personal items. In SaaS — Software as a Service — it is a fully serviced hotel room. You just show up and use it.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 6-3. Kai covers NIST characteristics
    {
      type: 'dialogue',
      id: 'd3a2s6-dialogue-3',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'NIST defines five essential characteristics of cloud computing. On-demand self-service — you provision resources without calling IT. Broad network access — accessible from any device over the network. Resource pooling — multiple tenants share the same physical hardware. Rapid elasticity — scale up or down automatically as demand changes. Measured service — you pay only for what you use, like a utility bill. All five must be present for it to truly be "cloud."',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'thinking',
    },

    // 6-4. Interactive Image — Shared Responsibility Model
    {
      type: 'interactiveImage',
      id: 'd3a2s6-interactive-1',
      title: 'Shared Apartment Building — Cloud Responsibility Model',
      imageType: 'comparison',
      backgroundGradient:
        'linear-gradient(135deg, #0a1628 0%, #0f2840 40%, #0a1628 100%)',
      conceptName: 'Cloud Computing Security',
      speaker: 'kai',
      dialogue:
        'Click each service model to see exactly what the customer controls versus what the provider controls. AlpineVault misunderstood this split — and that misunderstanding created the vulnerability.',
      completionDialogue:
        'AlpineVault used IaaS but treated it like SaaS — they assumed the cloud provider was handling security configurations. In IaaS, the customer owns OS patching, firewalls, access controls, and data encryption. The provider only manages the physical infrastructure and hypervisor. That shared responsibility gap is the number one cause of cloud breaches.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
      hotspots: [
        {
          id: 'iaas-hotspot',
          label: 'IaaS (Bare Apartment)',
          x: 5,
          y: 15,
          width: 28,
          height: 70,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'IaaS — Infrastructure as a Service. Provider manages: physical data center, networking hardware, hypervisor, and storage. Customer manages: operating systems, middleware, runtime, applications, data, identity, access controls, firewall rules, patching, and encryption. Customer has the MOST responsibility. Examples: AWS EC2, Azure VMs, Google Compute Engine. Think: bare apartment — the building is maintained, but everything inside is yours to manage.',
          detail:
            'IaaS: Customer responsible for OS, apps, data, IAM, patching, encryption. Provider responsible for physical infrastructure and hypervisor.',
        },
        {
          id: 'paas-hotspot',
          label: 'PaaS (Furnished Apartment)',
          x: 36,
          y: 15,
          width: 28,
          height: 70,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'PaaS — Platform as a Service. Provider manages everything in IaaS PLUS the operating system, middleware, and runtime. Customer manages: applications, data, and some identity/access controls. Think: furnished apartment — the furniture and appliances are provided and maintained, but your personal belongings and who you let in are your responsibility. Examples: AWS Elastic Beanstalk, Azure App Service, Heroku.',
          detail:
            'PaaS: Customer responsible for applications, data, and IAM. Provider adds OS, middleware, and runtime management.',
        },
        {
          id: 'saas-hotspot',
          label: 'SaaS (Hotel Room)',
          x: 67,
          y: 15,
          width: 28,
          height: 70,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'SaaS — Software as a Service. Provider manages EVERYTHING: infrastructure, platform, and the application itself. Customer manages: their own data and user access controls. That is it. Customer has the LEAST responsibility — but the MOST trust placed in the provider. Examples: Microsoft 365, Salesforce, Google Workspace. Think: hotel room — housekeeping handles everything, you just show up. But if you leave your laptop unlocked on the bed, that is on you.',
          detail:
            'SaaS: Customer responsible only for data and user access. Provider manages everything else. Least customer control.',
        },
      ],
    },

    // 6-5. Knowledge Check — Cloud Security
    {
      type: 'knowledgeCheck',
      id: 'd3a2s6-kc-1',
      question:
        'An organization migrates its web application to an IaaS cloud environment. Six months later, the application is compromised through an unpatched operating system vulnerability. Who is MOST responsible for this security failure?',
      options: [
        'The cloud service provider, because they manage the infrastructure',
        'The organization (customer), because OS patching is the customer\'s responsibility in IaaS',
        'Both parties equally, because the shared responsibility model splits all duties',
        'The application vendor, because they should have built in self-patching capabilities',
      ],
      correctIndex: 1,
      explanation:
        'In IaaS, the customer is responsible for everything above the hypervisor, including the operating system, applications, patching, and data security. The cloud provider manages only the physical infrastructure. An unpatched OS is squarely the customer\'s responsibility. This is the most commonly tested cloud security concept.',
      memoryHack:
        'Shared Apartment Building: IaaS = bare apartment. If the kitchen faucet leaks because YOU forgot to fix it, you cannot blame the landlord. The landlord only maintains the building structure (physical infra). Everything inside YOUR unit is YOUR problem.',
      conceptName: 'Cloud Computing Security',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // 6-6. Think Like a Manager — Cloud Accountability
    {
      type: 'thinkLikeManager',
      id: 'd3a2s6-tlatm-1',
      scenario:
        'AlpineVault\'s CISO argues that the cloud provider should be held liable for the breach because "we pay them to handle security." However, the breach occurred through a misconfigured security group in their IaaS environment that left database ports exposed to the internet.',
      question: 'As a security manager reviewing this incident, what is your assessment?',
      options: [
        'The CISO is correct — the cloud provider should have detected and corrected the misconfiguration',
        'The organization bears primary responsibility because security group configuration is the customer\'s duty in IaaS',
        'Liability should be split 50/50 since both parties share the responsibility model',
        'The cloud provider is responsible because they own the firewall infrastructure',
      ],
      correctIndex: 1,
      explanation:
        'In IaaS, security groups and network access controls are configured and managed by the customer. The cloud provider supplies the tools, but the customer must use them correctly. A misconfigured security group exposing database ports is a customer failure, not a provider failure. The shared responsibility model is not "shared blame" — each party owns specific layers.',
      managerInsight:
        'A manager never blames a tool vendor for their own misconfiguration. The shared responsibility model is a CONTRACT — it explicitly defines who owns what. Before any cloud migration, a manager ensures the team understands which security controls they are now responsible for. If your team lacks cloud security skills, that is a staffing gap to address before migration, not an excuse after a breach.',
      conceptName: 'Cloud Computing Security',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'serious',
    },

    // ================================================================
    // SCENE 7 — Virtualization and Hypervisor Security
    //           (Janet, "Apartment vs House")
    //           Knowledge Check
    // ================================================================

    // 7-1. Janet introduces virtualization
    {
      type: 'dialogue',
      id: 'd3a2s7-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The cloud infrastructure at AlpineVault runs on virtualization — so let me explain how that layer works. Think of it as "Apartment vs House." A virtual machine is like an apartment — you have your own private space, but you share the building\'s foundation, plumbing, and electrical systems with other tenants. A physical server is a standalone house — everything is yours alone.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7-2. Janet explains hypervisor types
    {
      type: 'dialogue',
      id: 'd3a2s7-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The building manager is the hypervisor — it allocates resources and isolates tenants. Type 1 hypervisors — also called bare-metal — run directly on hardware. Think of them as the building\'s own management company living on-site. VMware ESXi, Microsoft Hyper-V, and Xen are Type 1. Type 2 hypervisors run on top of a host operating system — like a property manager who works from a separate office and commutes. VirtualBox and VMware Workstation are Type 2. Type 1 is more secure and performant because there is no host OS to attack.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7-3. Janet warns about VM escape and containers
    {
      type: 'dialogue',
      id: 'd3a2s7-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The nightmare scenario is VM escape — a tenant breaking through their apartment walls into the building\'s management office. If an attacker compromises the hypervisor, they can access every VM on the host. And then there are containers — Docker, Kubernetes. Containers are like shared-wall studios: faster and lighter, but they share the HOST KERNEL instead of having their own OS. That shared kernel is a single point of failure. If the kernel is compromised, every container on that host is exposed.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 7-4. Knowledge Check — Virtualization
    {
      type: 'knowledgeCheck',
      id: 'd3a2s7-kc-1',
      question:
        'A security architect is comparing containers and virtual machines for a multi-tenant environment processing sensitive data. What is the PRIMARY security concern with containers compared to VMs?',
      options: [
        'Containers cannot be patched as frequently as VMs',
        'Containers share the host operating system kernel, creating a larger blast radius if the kernel is compromised',
        'Containers do not support encryption at rest',
        'Containers require Type 2 hypervisors, which are less secure',
      ],
      correctIndex: 1,
      explanation:
        'Containers share the host OS kernel — unlike VMs, which each have their own isolated OS. If the shared kernel is compromised, every container on that host is affected. VMs provide stronger isolation because each VM has its own kernel. This shared kernel risk is the primary security trade-off for the performance and efficiency benefits containers provide.',
      memoryHack:
        'Apartment vs House: VMs = separate apartments with their own plumbing (kernel). Containers = shared-wall studios sharing the same pipes. Burst a shared pipe and every studio floods. VMs = stronger walls. Containers = faster to build, thinner walls.',
      conceptName: 'Virtualization and Hypervisor Security',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Fire Prevention, Detection, and Suppression
    //           (Morales, "Kitchen Fire Safety")
    //           Interactive Image: decision_map + Knowledge Check
    //           EXAM TRAP: Halon banned, pre-action best for data centers
    // ================================================================

    // 8-1. Transition to physical security investigation
    {
      type: 'transition',
      id: 'd3a2s8-transition-1',
      location: 'zurich',
      description: 'AlpineVault Server Farm — Data Hall Alpha',
      animation: 'slide',
      timeSkipText: 'Later That Morning',
    },

    // 8-2. Morales introduces fire safety
    {
      type: 'dialogue',
      id: 'd3a2s8-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Time to walk the physical plant, {player}. While investigating the physical breach, I found that the fire suppression in Data Hall Alpha is outdated — they are still using a wet pipe sprinkler system over their server racks. That is like putting a "Kitchen Fire Safety" system designed for a restaurant into a library full of irreplaceable books.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8-3. Morales explains fire classes and detection
    {
      type: 'dialogue',
      id: 'd3a2s8-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'First, fire classes. Class A is ordinary combustibles — paper, wood. Class B is flammable liquids — fuel, solvents. Class C is electrical fires — the most relevant for data centers. Class D is combustible metals. Class K is cooking oils. For detection, the gold standard is VESDA — Very Early Smoke Detection Apparatus. It uses laser-based air sampling to detect smoke particles before a fire even starts. Think of it as smelling smoke before you see flames.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8-4. Interactive Image — Fire Suppression Systems
    {
      type: 'interactiveImage',
      id: 'd3a2s8-interactive-1',
      title: 'Kitchen Fire Safety — Suppression System Decision Map',
      imageType: 'decision_map',
      backgroundGradient:
        'linear-gradient(135deg, #1a0c0c 0%, #2a1520 40%, #1a0c0c 100%)',
      conceptName: 'Fire Prevention Detection and Suppression',
      speaker: 'morales',
      dialogue:
        'Click each suppression system to learn where it is used and why. Pay close attention to which system is BEST for data centers — and which one is BANNED. Both are exam favorites.',
      completionDialogue:
        'For the exam: pre-action is the BEST suppression for data centers — it requires two triggers before water flows, protecting against accidental discharge. Halon is BANNED under the Montreal Protocol for ozone depletion. FM-200 and Novec 1230 are approved Halon replacements. And always remember: human safety comes first. Never design a system that traps people to protect equipment.',
      leftCharacter: 'morales',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'wet-pipe-hotspot',
          label: 'Wet Pipe',
          x: 3,
          y: 20,
          width: 18,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'morales',
          dialogue:
            'Wet pipe sprinklers: pipes are always filled with water. When a sprinkler head detects heat, it opens immediately and water flows. Fastest response time, simplest design, lowest cost. BUT — any pipe leak or accidental trigger floods equipment. This is what AlpineVault has over their servers, and it is a terrible choice for a data center. Water + servers = catastrophe.',
          detail:
            'Wet pipe: always charged with water. Fastest activation. Risk of water damage from leaks or false triggers. NOT ideal for data centers or areas with sensitive electronics.',
        },
        {
          id: 'dry-pipe-hotspot',
          label: 'Dry Pipe',
          x: 22,
          y: 20,
          width: 18,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'morales',
          dialogue:
            'Dry pipe sprinklers: pipes are filled with pressurized air or nitrogen. When a head activates, the air escapes, a valve opens, and water flows. Slower response than wet pipe (30-60 second delay) but no risk of frozen or leaking water pipes. Good for cold environments like unheated warehouses, parking garages. Still uses water — so still not ideal for electronics.',
          detail:
            'Dry pipe: air-filled until activation. 30-60 second delay. No freeze risk. Still uses water. Better for cold environments, not great for data centers.',
        },
        {
          id: 'preaction-hotspot',
          label: 'Pre-Action',
          x: 41,
          y: 20,
          width: 18,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'morales',
          dialogue:
            'Pre-action sprinklers: require TWO triggers before water flows. First, a fire detection system (smoke/heat sensor) must activate to fill the pipes with water. Then, individual sprinkler heads must activate from heat to release water. This double-trigger prevents accidental discharge — a broken pipe or single false alarm will NOT flood the room. BEST choice for data centers, museums, and any location where water damage is unacceptable.',
          detail:
            'Pre-action: double-interlock — detection system fills pipes, THEN sprinkler heads must also trigger. Best for data centers. Prevents accidental water discharge.',
        },
        {
          id: 'deluge-hotspot',
          label: 'Deluge',
          x: 60,
          y: 20,
          width: 18,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'morales',
          dialogue:
            'Deluge systems: all sprinkler heads are open (no individual heat triggers). When the fire detection system activates, water floods through ALL heads simultaneously. Maximum water coverage. Used in high-hazard areas like chemical plants, aircraft hangars, and fuel storage. Absolutely NOT for data centers — it would be like opening every fire hydrant in the building at once.',
          detail:
            'Deluge: all heads open, massive simultaneous water flow. For high-hazard environments only. Maximum coverage but maximum water damage.',
        },
        {
          id: 'clean-agent-hotspot',
          label: 'Clean Agent (FM-200 / Novec)',
          x: 79,
          y: 20,
          width: 18,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'morales',
          dialogue:
            'Clean agent systems use gas (FM-200, Novec 1230) instead of water. They suppress fire by removing heat or interrupting the chemical reaction — without damaging electronics. Safe for occupied spaces at proper concentrations. These REPLACE Halon, which is BANNED under the Montreal Protocol because it depletes the ozone layer. If you see Halon on the exam, the answer is almost always "replace it." FM-200 and Novec 1230 are the approved alternatives.',
          detail:
            'Clean agents: FM-200, Novec 1230. No water damage, safe for electronics. Halon is BANNED (Montreal Protocol, ozone depletion). Replace Halon = exam answer.',
        },
      ],
    },

    // 8-5. Knowledge Check — Fire Suppression
    {
      type: 'knowledgeCheck',
      id: 'd3a2s8-kc-1',
      question:
        'A new data center is being designed to house critical server infrastructure. The design team proposes installing wet pipe sprinklers for fire suppression due to their low cost and fast response time. As the security consultant, what is your BEST recommendation?',
      options: [
        'Accept the wet pipe recommendation since fast response is the priority',
        'Replace with a Halon gas suppression system for maximum equipment protection',
        'Install a pre-action sprinkler system that requires dual activation to prevent accidental water discharge',
        'Install a deluge system for maximum fire coverage across the data hall',
      ],
      correctIndex: 2,
      explanation:
        'Pre-action sprinklers are the BEST choice for data centers because they require two independent triggers (detection system + individual sprinkler head activation) before water flows. This prevents accidental water damage from broken pipes or false alarms while still providing fire suppression. Wet pipe risks accidental discharge. Halon is BANNED under the Montreal Protocol. Deluge would cause catastrophic water damage.',
      memoryHack:
        'Kitchen Fire Safety: Would you put an industrial sprinkler over your home office computer? No — you would want a system that CONFIRMS there is a real fire before spraying water everywhere. Pre-action = double-check before dousing. And Halon is BANNED — if you see it as a correct answer, think again.',
      conceptName: 'Fire Prevention Detection and Suppression',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Physical Access Controls
    //           (Morales, "Bank Vault Entry Protocol")
    //           Knowledge Check
    //           EXAM TRAP: fail-safe vs fail-secure
    // ================================================================

    // 9-1. Morales introduces physical access controls
    {
      type: 'dialogue',
      id: 'd3a2s9-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Next finding: the attacker physically entered the data hall to plant hardware implants. Let me show you where the physical access controls failed. Think of proper physical security as a "Bank Vault Entry Protocol" — multiple layers, each one requiring a different credential, and every step logged.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Morales walks through the layers
    {
      type: 'dialogue',
      id: 'd3a2s9-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The layers, from outside in: Perimeter fencing — at least 8 feet high with 3-strand barbed wire or razor wire for critical facilities. Vehicle barriers at entry points. Then exterior lighting and CCTV. At the building entrance: badge access with multi-factor authentication — something you have (badge) and something you know (PIN) or something you are (biometric). Between zones: mantraps — small rooms with two interlocking doors. Only one opens at a time. If someone tailgates, they are trapped between the doors.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-3. Morales explains the exam trap
    {
      type: 'dialogue',
      id: 'd3a2s9-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'And here is the EXAM TRAP that confuses everyone: fail-safe versus fail-secure. Fail-SAFE doors UNLOCK when power is lost — prioritizing human SAFETY. People can escape during a fire. Fail-SECURE doors LOCK when power is lost — prioritizing SECURITY. The data stays protected. The rule: where human life is at stake, always fail-SAFE. Data center exterior doors should fail-safe for fire code compliance. Inner vault doors protecting critical assets may fail-secure. AlpineVault had their mantrap doors configured fail-safe for ALL doors — so when the attacker triggered a power disruption, every door unlocked.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 9-4. Evidence — Physical breach report
    {
      type: 'evidence',
      id: 'd3a2s9-evidence-1',
      title: 'Physical Breach Analysis — AlpineVault',
      classification: 'CLASSIFIED',
      content:
        'The attacker exploited a combination of tailgating and a deliberate power disruption to bypass all physical access controls.',
      evidenceItems: [
        { label: 'Entry Method', value: 'Tailgating behind authorized employee', highlight: true },
        { label: 'Mantrap Status', value: 'Bypassed via power disruption — all doors fail-safe', highlight: true },
        { label: 'Badge System', value: 'Single-factor (badge only, no PIN or biometric)' },
        { label: 'CCTV', value: 'Recorded but not monitored in real-time' },
        { label: 'Fence Height', value: '6 feet, no razor wire — below recommended 8 feet' },
        { label: 'Hardware Implant', value: 'Rogue device placed on network switch in Data Hall Alpha', highlight: true },
      ],
      speaker: 'morales',
      speakerSide: 'left',
      dialogue:
        'Every single layer was either missing or misconfigured. Single-factor badges, no mantrap integrity during power loss, unmonitored cameras, and a fence a teenager could climb. The attacker walked right in.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
    },

    // 9-5. Knowledge Check — Physical Access Controls
    {
      type: 'knowledgeCheck',
      id: 'd3a2s9-kc-1',
      question:
        'During a fire alarm in a data center, the exterior doors automatically unlock to allow evacuation. This behavior is an example of:',
      options: [
        'Fail-secure — the doors lock to protect the data center',
        'Fail-safe — the doors unlock to prioritize human safety',
        'Fail-open — the doors default to their last known state',
        'Fail-closed — the doors seal to contain the fire',
      ],
      correctIndex: 1,
      explanation:
        'Fail-safe means the system defaults to a state that prioritizes human safety when a failure occurs. Doors unlock so people can escape. Fail-secure means the system defaults to a locked/protected state to maintain security. The exam mnemonic: fail-SAFE = SAFETY (unlocked for people), fail-SECURE = SECURITY (locked for protection). Human life ALWAYS takes priority over asset protection.',
      memoryHack:
        'Bank Vault Entry Protocol: Fail-SAFE = Safety first = doors UNLOCK (let people out). Fail-SECURE = Security first = doors LOCK (keep intruders out). When in doubt on the exam: human life ALWAYS wins. Fire = fail-safe = unlock.',
      conceptName: 'Physical Access Controls',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Power and Environmental Controls
    //            (Janet, "Life Support Systems")
    //            Knowledge Check
    // ================================================================

    // 10-1. Janet introduces environmental controls
    {
      type: 'dialogue',
      id: 'd3a2s10-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The power disruption the attacker used to open the mantraps also revealed another weakness. AlpineVault\'s environmental controls are barely adequate. Think of these as "Life Support Systems" for your data center — without them, the equipment dies just as surely as a person without air.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10-2. Janet covers power systems
    {
      type: 'dialogue',
      id: 'd3a2s10-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Power comes in layers. UPS — Uninterruptible Power Supply — provides immediate battery backup during outages. It covers the gap between the power failure and the generator starting. Generators provide long-term backup power but take 10 to 30 seconds to spin up. Without a UPS, you have a 10-to-30-second blackout where everything goes down — including security systems. That is exactly the window the attacker exploited. AlpineVault had generators but no UPS. The brief blackout was enough to reset the mantrap door controllers.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 10-3. Janet covers environmental controls
    {
      type: 'dialogue',
      id: 'd3a2s10-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Environmental controls have specific thresholds. Temperature: 64 to 75 degrees Fahrenheit — servers overheat above this range. Humidity: 40 to 60 percent — too low causes static discharge, too high causes condensation. Hot aisle/cold aisle containment separates the cool intake air from the hot exhaust, improving cooling efficiency. And positive pressurization means the room has slightly higher air pressure than the outside, so contaminants are pushed OUT when a door opens, not sucked in.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 10-4. Knowledge Check — Power and Environmental
    {
      type: 'knowledgeCheck',
      id: 'd3a2s10-kc-1',
      question:
        'A data center experiences frequent static discharge events that damage sensitive electronic components. Which environmental factor is MOST likely the cause?',
      options: [
        'Temperature above 75 degrees Fahrenheit',
        'Humidity below 40 percent',
        'Negative pressurization in the server room',
        'Hot aisle/cold aisle misconfiguration',
      ],
      correctIndex: 1,
      explanation:
        'Low humidity (below 40%) causes electrostatic discharge (ESD), which can damage sensitive electronics. High humidity (above 60%) causes condensation. The ideal range is 40-60% relative humidity. Temperature issues cause overheating, not static. Pressurization affects contaminants. Hot/cold aisle affects cooling efficiency, not static.',
      memoryHack:
        'Life Support Systems: Think of static electricity shocks in winter when the air is DRY. Low humidity = dry air = static zaps. The 40-60% humidity sweet spot keeps static away without creating moisture. Too dry = sparks. Too wet = puddles.',
      conceptName: 'Power and Environmental Controls',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 11 — TPM and HSM
    //            (Janet, "Safe Deposit Box")
    //            Knowledge Check
    // ================================================================

    // 11-1. Janet introduces TPM and HSM
    {
      type: 'dialogue',
      id: 'd3a2s11-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Remember how AlpineVault stored their CA private key on an unencrypted file share? The correct solution is hardware-based key protection. Think of TPM and HSM as a "Safe Deposit Box" at the bank — your most valuable items go in specialized secure hardware, not in your desk drawer.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-2. Janet explains TPM
    {
      type: 'dialogue',
      id: 'd3a2s11-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'A TPM — Trusted Platform Module — is a chip soldered to the motherboard. It serves as a hardware root of trust for the system. It stores cryptographic keys, certificates, and passwords in tamper-resistant hardware. It uses Platform Configuration Registers — PCRs — to measure the boot process: BIOS, bootloader, OS kernel. If anything changes — like malware modifying the boot sequence — the PCR values change and the system can refuse to decrypt the hard drive. BitLocker on Windows uses TPM exactly this way.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11-3. Janet explains HSM
    {
      type: 'dialogue',
      id: 'd3a2s11-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'An HSM — Hardware Security Module — is the heavy-duty version. It is a dedicated cryptographic processing device, either a PCI card or a network-attached appliance. HSMs generate keys, perform encryption and signing operations, and NEVER expose the private key outside the hardware boundary. They are validated under FIPS 140-2 at four levels. Level 1 is basic algorithms. Level 2 adds tamper-evident seals. Level 3 adds tamper-resistant hardware that zeroizes keys if the casing is breached. Level 4 provides environmental failure protection. Root CA keys should ALWAYS be stored in a Level 3 or Level 4 HSM.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-4. Knowledge Check — TPM and HSM
    {
      type: 'knowledgeCheck',
      id: 'd3a2s11-kc-1',
      question:
        'An organization needs to protect its Certificate Authority\'s root private key with the highest assurance that the key cannot be extracted, even if the device is physically stolen and disassembled. Which solution is MOST appropriate?',
      options: [
        'Store the key in the server\'s TPM chip',
        'Store the key in a FIPS 140-2 Level 3 HSM that zeroizes keys upon tamper detection',
        'Encrypt the key with AES-256 and store it on an encrypted file share',
        'Store the key in a FIPS 140-2 Level 1 validated software module',
      ],
      correctIndex: 1,
      explanation:
        'A FIPS 140-2 Level 3 HSM provides tamper-resistant hardware that automatically zeroizes (destroys) all stored keys if the physical casing is breached. This means even physical disassembly cannot extract the key. A TPM is soldered to one motherboard and is designed for platform integrity, not CA key management. Encrypted file shares can be copied. Level 1 provides only basic algorithmic validation without physical tamper protection.',
      memoryHack:
        'Safe Deposit Box: TPM = a safe bolted to your desk — good for personal items but limited. HSM = the bank\'s vault — built for high-value assets with armed guards (tamper detection) and a self-destruct mechanism (zeroization). Root CA keys belong in the bank vault, not the desk safe. FIPS 140-2 Level 3 = vault with self-destruct.',
      conceptName: 'TPM and HSM',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 12 — CPTED + Zero Trust Introduction
    //            (Morales "Neighborhood Watch Design"
    //             + Kai "Never Trust, Always Verify")
    //            Knowledge Check
    // ================================================================

    // 12-1. Morales introduces CPTED
    {
      type: 'dialogue',
      id: 'd3a2s12-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Before we leave the physical security assessment, {player}, there is a design philosophy that could have prevented the physical breach entirely. I call it "Neighborhood Watch Design" — the official term is CPTED, Crime Prevention Through Environmental Design. The idea is that the physical environment itself discourages crime before it happens.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 12-2. Morales explains CPTED principles
    {
      type: 'dialogue',
      id: 'd3a2s12-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Three core principles. Natural surveillance — design spaces so people can see and be seen. Open sightlines, good lighting, windows facing walkways. An attacker does not want to be observed. Natural access control — use landscaping, pathways, and building layout to guide people to legitimate entry points and away from restricted areas. Funneling foot traffic through controlled checkpoints. Territorial reinforcement — make it clear where public space ends and private space begins. Signs, fences, different pavement textures, maintained landscaping. The message is "this space is owned and monitored."',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 12-3. Kai transitions to Zero Trust
    {
      type: 'dialogue',
      id: 'd3a2s12-dialogue-3',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'And that design philosophy has a digital counterpart, {player}. It is called Zero Trust, and I summarize it as "Never Trust, Always Verify." Traditional network security is like a castle with a moat — once you cross the drawbridge, you are trusted. Zero Trust says there is no drawbridge. Every single access request is verified, regardless of where it comes from. Inside the network, outside the network — it does not matter. Prove who you are, every time.',
      rightCharacter: 'kai',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 12-4. Kai explains Zero Trust principles
    {
      type: 'dialogue',
      id: 'd3a2s12-dialogue-4',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Three pillars of Zero Trust. First: never trust, always verify — authenticate and authorize every request. Second: micro-segmentation — divide the network into small zones so even if an attacker gets into one zone, they cannot move laterally. Every zone boundary requires re-authentication. Third: continuous verification — do not just check at login. Monitor behavior throughout the session. If something changes — location, device posture, unusual activity — re-verify or revoke access. We will go much deeper into Zero Trust in Domain 5 when we cover IAM. For now, understand the philosophy.',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 12-5. Knowledge Check — CPTED and Zero Trust
    {
      type: 'knowledgeCheck',
      id: 'd3a2s12-kc-1',
      question:
        'A security architect is redesigning a corporate campus. The plan includes removing tall hedges that block sightlines to building entrances, installing waist-high fences to define boundaries between public sidewalks and private areas, and adding well-lit pathways that funnel visitors to a single reception entrance. These changes BEST exemplify which security approach?',
      options: [
        'Defense in depth',
        'Zero Trust Architecture',
        'Crime Prevention Through Environmental Design (CPTED)',
        'Physical penetration testing recommendations',
      ],
      correctIndex: 2,
      explanation:
        'The described changes directly implement all three CPTED principles: natural surveillance (removing hedges for clear sightlines), territorial reinforcement (waist-high fences defining boundaries), and natural access control (lit pathways funneling to one entrance). Defense in depth involves layered security controls. Zero Trust is a network access philosophy. Penetration testing identifies vulnerabilities but does not define the design approach.',
      memoryHack:
        'Neighborhood Watch Design: CPTED makes crime feel UNCOMFORTABLE. Open sightlines = "I can see you." Clear boundaries = "You do not belong here." Guided paths = "This way to the checkpoint." The building itself says "We are watching." Remember the three Naturals: Natural Surveillance, Natural Access Control, Territorial Reinforcement.',
      conceptName: 'CPTED',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 13 — Act 2 Wrap-up
    //            Morales reveals persistent backdoors, teases Act 4
    // ================================================================

    // 13-1. Transition
    {
      type: 'transition',
      id: 'd3a2s13-transition-1',
      location: 'zurich',
      description: 'AlpineVault Server Farm — Secure Briefing Room',
      animation: 'fade',
      timeSkipText: 'End of Day 2 — 1830 Hours',
    },

    // 13-2. Morales drops the bomb
    {
      type: 'dialogue',
      id: 'd3a2s13-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Team, I have bad news. The hardware implant we found in Data Hall Alpha was not the only one. My sweep found three more — in the cooling control system, the power distribution unit, and the backup generator controller. This was not a smash-and-grab. The attacker built a persistent, redundant backdoor network designed to survive our cleanup.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 13-3. Reeves assesses the situation
    {
      type: 'dialogue',
      id: 'd3a2s13-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'This changes the scope of the operation. The attacker has embedded themselves into AlpineVault\'s physical infrastructure — not just the digital systems. They can manipulate power, cooling, and physical access remotely. We are dealing with someone who understands the full architecture stack, from certificates down to HVAC systems.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 13-4. Janet teases Act 4
    {
      type: 'dialogue',
      id: 'd3a2s13-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: '{player}, we need to go deeper into the security architecture itself — secure design principles, cryptographic attacks, side-channel vulnerabilities, and industrial control systems. The attacker is exploiting design flaws, not just misconfigurations. After the field assessment, we will tear apart the entire architecture. Be ready.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 13-5. Kai final remark
    {
      type: 'dialogue',
      id: 'd3a2s13-dialogue-4',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'You handled today well, {player}. We covered a lot — PKI trust chains, digital signatures, key management, cloud responsibility models, hypervisor risks, fire suppression, physical access layers, environmental controls, hardware security modules, and the foundations of CPTED and Zero Trust. That is serious ground. Take a breath — you have earned it.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },
  ],
};
