import { ActDefinition } from '@/lib/story-types';

export const domain3Act4: ActDefinition = {
  actNumber: 4,
  title: 'The Escalation',
  description:
    'Persistent backdoors discovered. Master cryptanalytic attacks, formal models, SCADA security, and web vulnerabilities to close every gap before the attacker strikes again.',
  xpReward: 300,
  conceptsCovered: [
    'Cryptanalytic Attacks',
    'Block Cipher Modes',
    'Brewer-Nash Model',
    'TOCTOU / Race Conditions',
    'ICS/SCADA Security',
    'Steganography',
    'Homomorphic Encryption',
    'Quantum Cryptography',
    'Lightweight Cryptography',
    'One-Time Pad',
    'Graham-Denning Model',
    'HRU Model',
    'Take-Grant Model',
    'Goguen-Meseguer Model',
    'Sutherland Model',
    'Enterprise Architecture Frameworks',
    'Edge/Fog/CDN Computing',
    'Microservices and Serverless',
    'Security Modes of Operation',
    'Web Application Vulnerabilities',
    'Crypto-shredding',
  ],
  estimatedMinutes: 26,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Transition: Day 4, Crisis Command Center
    // ================================================================

    // 1-1. Transition — Server Farm crisis center
    {
      type: 'transition',
      id: 'd3a4s1-transition-1',
      location: 'zurich',
      description: 'Zurich Server Farm — Crisis Command Center, Sub-Level 3',
      animation: 'glitch',
      timeSkipText: 'Day 4 — 0400 Hours — CRITICAL ESCALATION',
    },

    // 1-2. Reeves opens with urgency
    {
      type: 'dialogue',
      id: 'd3a4s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Bad news. The attacker didn\'t just steal data — they implanted persistent backdoors across six server clusters. We\'re finding rootkits, modified firmware, and covert exfiltration channels. Everything we thought was clean has to be re-examined.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
    },

    // 1-3. Janet sets the learning frame
    {
      type: 'dialogue',
      id: 'd3a4s1-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The attacker is using advanced techniques — steganography, side-channel exploits, race conditions. To close these backdoors, you need to understand the attacks AND the defenses. Stay sharp, {player}. This is the hardest day yet.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 1-4. Morales adds tactical context
    {
      type: 'dialogue',
      id: 'd3a4s1-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'We also have a SCADA alert from the building management system. The attacker may be trying to disrupt power to the server farm itself. We\'re fighting on multiple fronts now.',
      leftCharacter: 'morales',
      leftExpression: 'worried',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // ================================================================
    // SCENE 2 — Cryptanalytic Attacks (Janet, "Codebreaker's Toolkit")
    // ================================================================

    // 2-1. Janet introduces cryptanalytic attacks
    {
      type: 'dialogue',
      id: 'd3a4s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Let\'s start with how the attacker broke our encryption. I call this the "Codebreaker\'s Toolkit" — every attack method an adversary can use against cryptographic systems. Understanding these attacks is how you choose the RIGHT defenses.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 2-2. Janet explains fundamentals
    {
      type: 'dialogue',
      id: 'd3a4s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Kerckhoffs\' Principle says a cryptosystem should be secure even if everything about it is public — except the key. That means if your security depends on keeping the ALGORITHM secret, you\'ve already lost. The attacker doesn\'t need to break the math. They just need to find a shortcut around it.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 2-3. Visual Aid — Cryptanalytic attack types
    {
      type: 'visualAid',
      id: 'd3a4s2-visual-1',
      title: 'Codebreaker\'s Toolkit — Cryptanalytic Attack Types',
      aidType: 'list',
      items: [
        {
          label: 'Brute Force',
          description:
            'Try every possible key until one works. Time depends on key length — 128-bit = 2^128 attempts. Guaranteed to work eventually but computationally infeasible for strong keys.',
        },
        {
          label: 'Known-Plaintext Attack (KPA)',
          description:
            'Attacker has both plaintext AND its ciphertext. Uses the pair to deduce the key. Example: predictable file headers (e.g., PDF files always start with "%PDF").',
        },
        {
          label: 'Chosen-Plaintext Attack (CPA)',
          description:
            'Attacker can CHOOSE specific plaintext and obtain its ciphertext. Stronger than KPA because the attacker controls the input. Targets encryption oracles.',
        },
        {
          label: 'Ciphertext-Only Attack (COA)',
          description:
            'Attacker has ONLY ciphertext — the hardest starting point. Relies on frequency analysis, statistical patterns, or exploiting weak algorithms. The weakest position for an attacker.',
        },
        {
          label: 'Meet-in-the-Middle',
          description:
            'Attacks multiple rounds of encryption from both ends simultaneously. This is WHY 2DES is useless — reduces effective key strength from 112 bits to just 57 bits. 3DES uses 3 keys to counter this.',
        },
        {
          label: 'Birthday Attack',
          description:
            'Exploits the birthday paradox — in a group of 23 people, there\'s a 50% chance two share a birthday. Applied to hash collisions: you need far fewer attempts than expected to find two inputs with the same hash.',
        },
        {
          label: 'Rainbow Table Attack',
          description:
            'Precomputed table of hash-to-password mappings. Trades storage for speed — instant password lookups. MITIGATION: salting adds random data before hashing, making precomputation useless.',
        },
        {
          label: 'Side-Channel Attack',
          description:
            'Doesn\'t attack the algorithm — attacks the IMPLEMENTATION. Measures power consumption, electromagnetic emissions, timing variations, or even sound to deduce keys. No amount of key length helps.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'The exam loves to test meet-in-the-middle (why 2DES fails), birthday attacks (hash collision math), and the difference between known-plaintext and chosen-plaintext. Side-channel attacks are increasingly tested because they bypass mathematical strength entirely.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 2-4. Knowledge Check — Meet-in-the-middle
    {
      type: 'knowledgeCheck',
      id: 'd3a4s2-kc-1',
      question:
        'A security architect proposes using Double DES (2DES) with two independent 56-bit keys to achieve 112-bit effective security. Why is this proposal fundamentally flawed?',
      options: [
        'DES cannot be applied twice to the same data block',
        'The meet-in-the-middle attack reduces the effective key strength to approximately 57 bits, barely better than single DES',
        '2DES requires three keys, not two, to be secure',
        'Double encryption always produces the same output as single encryption with a different key',
      ],
      correctIndex: 1,
      explanation:
        'The meet-in-the-middle attack encrypts from the plaintext side and decrypts from the ciphertext side, looking for matches in the middle. This reduces 2DES from a theoretical 2^112 operations to about 2^57 — barely more secure than single DES at 2^56. This is why 3DES was created with three rounds and why 2DES was never adopted as a standard.',
      memoryHack:
        'Codebreaker\'s Toolkit — Meet in the Middle: Imagine two people digging a tunnel from opposite ends. Instead of digging the FULL length, they each dig HALF and meet in the middle. 2DES = two locks on a door, but the attacker picks each one separately instead of both at once. That\'s why 2DES doubles the key but barely increases security.',
      conceptName: 'Cryptanalytic Attacks',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — Block Cipher Modes (Janet, "Assembly Line Styles")
    // ================================================================

    // 3-1. Janet introduces block cipher modes
    {
      type: 'dialogue',
      id: 'd3a4s3-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The backdoor we found uses AES encryption — but the mode matters just as much as the algorithm. Think of block cipher modes as "Assembly Line Styles." The factory (AES) is the same, but HOW you run the assembly line changes everything about quality and safety.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 3-2. Visual Aid — Block cipher modes table
    {
      type: 'visualAid',
      id: 'd3a4s3-visual-1',
      title: 'Assembly Line Styles — Block Cipher Modes',
      aidType: 'table',
      headers: ['Mode', 'How It Works', 'Parallelizable?', 'Use Case', 'Weakness'],
      rows: [
        [
          'ECB (Electronic Codebook)',
          'Each block encrypted independently with same key',
          'Yes',
          'NEVER use for real data',
          'Identical plaintext blocks produce identical ciphertext — reveals patterns',
        ],
        [
          'CBC (Cipher Block Chaining)',
          'Each block XORed with previous ciphertext before encryption',
          'Decrypt only',
          'Bulk data, disk encryption',
          'Sequential encryption (slower), padding oracle attacks',
        ],
        [
          'CTR (Counter)',
          'Encrypts incrementing counter values, XORs result with plaintext',
          'Yes (fastest)',
          'High-speed networking, streaming',
          'Counter must NEVER repeat with same key',
        ],
        [
          'GCM (Galois/Counter Mode)',
          'CTR mode + built-in authentication tag',
          'Yes',
          'TLS 1.3, IPsec, cloud storage',
          'Nonce reuse catastrophically breaks authentication',
        ],
      ],
      speaker: 'janet',
      dialogue:
        'EXAM TRAP: ECB should NEVER be used for data with repeating patterns. The classic example is encrypting a bitmap image with ECB — the penguin image still looks like a penguin because identical pixel blocks produce identical ciphertext. GCM is the gold standard today because it provides both confidentiality AND integrity in one operation — that\'s authenticated encryption.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 3-3. Knowledge Check — Block cipher modes
    {
      type: 'knowledgeCheck',
      id: 'd3a4s3-kc-1',
      question:
        'A development team encrypts a database of medical images using AES in ECB mode. A security auditor discovers that identical scan regions across different patient images produce identical ciphertext blocks. What is the PRIMARY security concern?',
      options: [
        'AES is not strong enough for medical data and should be replaced with 3DES',
        'ECB mode reveals patterns in data because identical plaintext blocks produce identical ciphertext blocks',
        'The encryption key is too short and needs to be extended to 512 bits',
        'Medical images require asymmetric encryption rather than symmetric',
      ],
      correctIndex: 1,
      explanation:
        'ECB mode encrypts each block independently — identical input blocks always produce identical output blocks. This reveals patterns in data, especially images and structured data. The fix is to use CBC, CTR, or GCM mode, which introduce randomness so identical plaintext blocks produce different ciphertext. AES itself is fine; the MODE is the problem.',
      memoryHack:
        'Assembly Line Styles — ECB = "Every Copy Boring." Each block is processed identically with no variation, so patterns survive encryption. Think of the penguin: encrypt a penguin image with ECB, and you can still see it\'s a penguin. CBC chains blocks together, CTR is the speed champion, GCM = CTR + authentication (TLS 1.3\'s choice).',
      conceptName: 'Block Cipher Modes',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Brewer-Nash / Chinese Wall
    //           (Reeves, "Law Firm Firewall")
    // ================================================================

    // 4-1. Reeves introduces Brewer-Nash
    {
      type: 'dialogue',
      id: 'd3a4s4-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'While Janet traces the crypto, I need to address an access control failure that helped the attacker move laterally. The server farm hosts data for competing financial institutions — and the access barriers between them broke down. This is where the Brewer-Nash model applies. I call it the "Law Firm Firewall."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4-2. Reeves explains the model
    {
      type: 'dialogue',
      id: 'd3a4s4-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Imagine a law firm that represents both Coca-Cola and Pepsi. Once a lawyer accesses Coca-Cola\'s trade secrets, they are PERMANENTLY blocked from accessing Pepsi\'s — that\'s a conflict of interest wall. The Brewer-Nash model works exactly the same way: your past access decisions dynamically restrict your future access. It\'s the ONLY formal security model where permissions CHANGE based on what you\'ve already done.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4-3. Reeves explains why it matters here
    {
      type: 'dialogue',
      id: 'd3a4s4-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The attacker\'s compromised admin account accessed data from three competing clients hosted in this server farm. Under Brewer-Nash, accessing the first client\'s data should have blocked access to the competitors. But the access controls weren\'t enforcing dynamic conflict-of-interest separation. That oversight gave the attacker access to competitors\' data in the same session.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
      rightCharacter: 'janet',
      rightExpression: 'worried',
    },

    // 4-4. Knowledge Check — Brewer-Nash
    {
      type: 'knowledgeCheck',
      id: 'd3a4s4-kc-1',
      question:
        'A consultant at a managed hosting provider accesses the financial records of Bank A. Under the Brewer-Nash (Chinese Wall) model, which statement is MOST accurate about the consultant\'s subsequent access?',
      options: [
        'The consultant can access Bank B\'s records if they have the same clearance level',
        'The consultant is dynamically blocked from accessing financial records of any competing bank',
        'The consultant can access Bank B\'s records after a 24-hour cooling-off period',
        'The consultant must obtain written approval from both banks before accessing either',
      ],
      correctIndex: 1,
      explanation:
        'Brewer-Nash dynamically restricts access based on PAST behavior. Once the consultant accesses Bank A\'s financial data, they are automatically blocked from accessing data belonging to competing banks within the same conflict-of-interest class. This restriction is permanent for that session/engagement — not time-based, not clearance-based, and not subject to management override. It prevents conflicts of interest through technical enforcement.',
      memoryHack:
        'Law Firm Firewall: Once you pick a side, the wall goes up. Coca-Cola lawyer? Pepsi\'s door is locked FOREVER. Brewer-Nash is the only model that changes your permissions based on what you already accessed — dynamic, behavior-driven access control.',
      conceptName: 'Brewer-Nash Model',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — TOCTOU / Race Conditions
    //           (Janet, "Ticket Scalper Timing")
    // ================================================================

    // 5-1. Janet introduces TOCTOU
    {
      type: 'dialogue',
      id: 'd3a4s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The attacker exploited a race condition in the server farm\'s authentication system. I call this the "Ticket Scalper Timing" attack. Imagine buying concert tickets online: you check that tickets are available, add one to your cart, and click purchase. But in the milliseconds between checking availability and completing the purchase, a scalper\'s bot bought the last ticket. You got confirmation for a ticket that no longer exists.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 5-2. Janet explains the vulnerability
    {
      type: 'dialogue',
      id: 'd3a4s5-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'TOCTOU — Time-of-Check to Time-of-Use — is the window between when a system VERIFIES a condition and when it ACTS on that verification. The attacker exploited a gap between the authentication check and the session creation. In that tiny window, they swapped the session token to hijack an administrator\'s identity. The system checked one user but granted access to another.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'worried',
    },

    // 5-3. Janet explains mitigations
    {
      type: 'dialogue',
      id: 'd3a4s5-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The defenses against TOCTOU are: mutex locks that prevent concurrent modification, atomic operations that combine the check and use into a single indivisible step, and increased check frequency to narrow the window. This vulnerability is a major cross-reference to Domain 8 — Software Development Security — because race conditions are fundamentally a coding problem. Developers must make authorization and action atomic.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 5-4. Knowledge Check — TOCTOU
    {
      type: 'knowledgeCheck',
      id: 'd3a4s5-kc-1',
      question:
        'A banking application checks that a customer has sufficient funds, then processes the withdrawal in a separate step. An attacker initiates two simultaneous withdrawals of $500 from an account containing $500. Both checks pass before either withdrawal completes. What vulnerability was exploited?',
      options: [
        'Buffer overflow',
        'SQL injection',
        'Time-of-Check to Time-of-Use (TOCTOU) race condition',
        'Cross-site request forgery (CSRF)',
      ],
      correctIndex: 2,
      explanation:
        'This is a classic TOCTOU race condition. Both withdrawal requests checked the balance (Time-of-Check) before either one deducted the funds (Time-of-Use). The gap between checking and acting allowed the attacker to double-spend. The fix: use atomic transactions that lock the record during the check-and-deduct sequence, preventing concurrent access.',
      memoryHack:
        'Ticket Scalper Timing: TOCTOU = the gap between looking at the shelf and grabbing the item. Two shoppers both see the last item, both reach for it — race condition. Atomic operations = putting your hand on the item the instant you look at it. No gap, no race.',
      conceptName: 'TOCTOU / Race Conditions',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — ICS/SCADA Security
    //           (Morales, "Factory Floor Fortress")
    // ================================================================

    // 6-1. Morales introduces SCADA
    {
      type: 'dialogue',
      id: 'd3a4s6-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'That SCADA alert I mentioned? It\'s confirmed. The attacker is probing the building management system — HVAC, power distribution, fire suppression. Welcome to the world of Industrial Control Systems. I call it the "Factory Floor Fortress," and protecting it requires a completely different mindset from IT security.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 6-2. Morales explains ICS/SCADA
    {
      type: 'dialogue',
      id: 'd3a4s6-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'SCADA — Supervisory Control and Data Acquisition — monitors and controls physical processes. PLCs (Programmable Logic Controllers) are the field devices that directly operate valves, motors, and switches. The critical difference from IT: you can\'t just "patch and reboot." These systems run 24/7, and downtime can mean physical danger — explosions, toxic releases, power grid failures. Safety Instrumented Systems (SIS) are independent emergency shutdown mechanisms that must NEVER be connected to the control network.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6-3. Morales explains defense strategy
    {
      type: 'dialogue',
      id: 'd3a4s6-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The primary defense is isolation — air-gapping the operational technology (OT) network from the IT network. Patching is done during planned maintenance windows because an unplanned reboot could halt production or endanger lives. Legacy protocols like Modbus and DNP3 were designed decades ago with ZERO authentication — they trust any command they receive. That\'s why network segmentation and monitoring are critical.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 6-4. Timed Decision — SCADA vulnerability response
    {
      type: 'timedDecision',
      id: 'd3a4s6-timed-1',
      scenario:
        'ALERT: A critical vulnerability (CVE score 9.8) has been published for the PLC firmware controlling the server farm\'s cooling system. The exploit is actively being used in the wild. However, the cooling system is the ONLY thing keeping 2,000 servers operational in the Zurich summer heat. Patching requires a 30-minute firmware update during which the PLCs will be offline — meaning no cooling for half an hour. Server thermal limits are reached in 15 minutes without cooling.',
      timeLimit: 30,
      conceptName: 'ICS/SCADA Security',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'worried',
      options: [
        {
          text: 'Implement compensating controls (network segmentation, IDS monitoring, firewall rules blocking exploit traffic) while scheduling the patch for the next planned maintenance window when backup cooling can be arranged',
          isOptimal: true,
          feedback:
            'Correct. In ICS/SCADA environments, you NEVER patch in a way that risks physical harm or operational disaster. Compensating controls buy time while you plan a safe maintenance window with backup cooling. This is the "safety first" mindset that separates OT from IT security.',
          xpBonus: 100,
        },
        {
          text: 'Apply the patch immediately — the vulnerability is too critical to wait',
          isOptimal: false,
          feedback:
            'In IT, this might be right. In OT, this could destroy $10 million in servers. SCADA security prioritizes SAFETY and AVAILABILITY over immediate patching. You need compensating controls while planning a safe update window.',
          xpBonus: 15,
        },
        {
          text: 'Disconnect the PLCs from the network entirely and operate cooling manually',
          isOptimal: false,
          feedback:
            'Manual operation removes automation benefits and introduces human error risk. Better to implement network-level compensating controls (segment, monitor, filter) while keeping automated cooling operational.',
          xpBonus: 30,
        },
        {
          text: 'Accept the risk and do nothing until the manufacturer provides a tested update',
          isOptimal: false,
          feedback:
            'Accepting the risk with no compensating controls is negligent when an active exploit exists. You must implement compensating controls immediately, even if you delay the actual patch.',
          xpBonus: 5,
        },
      ],
    },

    // 6-5. Knowledge Check — SCADA
    {
      type: 'knowledgeCheck',
      id: 'd3a4s6-kc-1',
      question:
        'An organization discovers that the Safety Instrumented System (SIS) at its chemical processing plant has been connected to the corporate IT network to enable remote monitoring. What is the MOST critical security concern?',
      options: [
        'The SIS may not receive timely software updates from the vendor',
        'Remote monitoring increases bandwidth costs on the corporate network',
        'An attacker who compromises the IT network could disable emergency shutdown capabilities, creating physical safety risks',
        'The SIS data may be subject to regulatory compliance requirements for data retention',
      ],
      correctIndex: 2,
      explanation:
        'The SIS is the LAST line of defense against catastrophic physical events — explosions, toxic releases, equipment destruction. Connecting it to the corporate IT network means a network-based attacker could potentially disable emergency shutdowns. SIS must be completely isolated from both the control network AND the corporate network. In ICS security, safety always trumps convenience.',
      memoryHack:
        'Factory Floor Fortress: The SIS is the emergency fire exit — it must NEVER be connected to the building\'s main hallways (networks). If the attacker controls the hallways, they can lock the fire exits. Keep SIS isolated = keep the fire exits always accessible.',
      conceptName: 'ICS/SCADA Security',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Steganography (Janet, "Invisible Ink Letter")
    // ================================================================

    // 7-1. Janet introduces steganography
    {
      type: 'dialogue',
      id: 'd3a4s7-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'We found how the attacker has been exfiltrating data without triggering our DLP sensors. They\'re using steganography — hiding stolen data inside ordinary-looking image files uploaded to a public photo-sharing site. I call it the "Invisible Ink Letter." The letter looks completely normal to anyone who reads it — but hidden between the lines is a secret message visible only to those who know where to look.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'surprised',
    },

    // 7-2. Janet explains steganography vs encryption
    {
      type: 'dialogue',
      id: 'd3a4s7-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Steganography is NOT encryption. Encryption scrambles data so it\'s unreadable — everyone can see something secret exists. Steganography HIDES data so nobody even knows it\'s there — security through obscurity. The attacker embedded compressed database exports in the least-significant bits of JPEG images. To a human eye, the images are identical. To DLP, they\'re just vacation photos. Digital watermarking uses the same principle for legitimate purposes — embedding invisible ownership marks in media files.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 7-3. Knowledge Check — Steganography
    {
      type: 'knowledgeCheck',
      id: 'd3a4s7-kc-1',
      question:
        'During a forensic investigation, an analyst discovers that an employee has been uploading large image files to a personal cloud account. The images appear to be ordinary vacation photos, but statistical analysis reveals anomalous bit patterns in the least-significant bits. What technique is MOST likely being used?',
      options: [
        'Symmetric encryption of the image files',
        'Data compression to reduce file sizes',
        'Steganography to hide data within the image files',
        'Digital Rights Management applied to the photos',
      ],
      correctIndex: 2,
      explanation:
        'Steganography hides data within carrier files (images, audio, video) by modifying the least-significant bits — changes invisible to the human eye but detectable through statistical analysis (steganalysis). Encryption would make the files obviously unreadable. Compression reduces size, not increases it. DRM restricts access, not hides data. The key indicator is anomalous bit patterns in otherwise normal-looking files.',
      memoryHack:
        'Invisible Ink Letter: Encryption = sending a locked box (everyone knows it\'s secret). Steganography = sending a postcard with invisible ink (nobody knows there\'s a secret). The attacker chose invisibility over locks. Detection requires steganalysis — the ultraviolet light that reveals invisible ink.',
      conceptName: 'Steganography',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Homomorphic Encryption + Quantum Crypto
    //           (Janet, "Sealed Ballot Counting" + "Quantum Lock Picking")
    // ================================================================

    // 8-1. Janet introduces homomorphic encryption
    {
      type: 'dialogue',
      id: 'd3a4s8-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'While we rebuild, let\'s discuss two cutting-edge technologies that could have prevented some of this damage. First: homomorphic encryption — the "Sealed Ballot Counting" method. We covered this in Domain 2, but in the architecture context it matters even more. Imagine election workers who count votes inside sealed ballot boxes without EVER opening them. The result comes out, but the individual votes stay hidden.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 8-2. Janet connects to architecture
    {
      type: 'dialogue',
      id: 'd3a4s8-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'If the server farm had processed data using homomorphic encryption, the attacker\'s stolen data would have been useless — encrypted values that can be computed on but never seen in plaintext. The trade-off is massive computational overhead. Full homomorphic encryption — supporting ANY operation — is still too slow for most real-world workloads. Partial and somewhat homomorphic variants handle limited operations like addition or multiplication more practically.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 8-3. Janet transitions to quantum
    {
      type: 'dialogue',
      id: 'd3a4s8-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now the bigger threat on the horizon: "Quantum Lock Picking." Quantum computers could break RSA and ECC by solving the mathematical problems they rely on. Quantum Key Distribution — QKD — uses quantum physics to detect eavesdropping, since measuring a quantum state changes it. But the real exam focus is crypto agility — designing systems that can SWAP cryptographic algorithms when quantum computers arrive, without rebuilding the entire infrastructure.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 8-4. Knowledge Check — Quantum crypto
    {
      type: 'knowledgeCheck',
      id: 'd3a4s8-kc-1',
      question:
        'An organization\'s security architect recommends implementing "crypto agility" across all systems. What does this strategy PRIMARILY address?',
      options: [
        'The ability to encrypt data faster by switching between algorithms based on data size',
        'The ability to rapidly replace cryptographic algorithms when current ones are compromised or broken, including by quantum computing advances',
        'Using multiple encryption algorithms simultaneously on the same data for defense in depth',
        'Dynamically adjusting key lengths based on the sensitivity of the data being protected',
      ],
      correctIndex: 1,
      explanation:
        'Crypto agility is the design practice of building systems that can rapidly swap out cryptographic algorithms without major architectural changes. This is critical for post-quantum readiness — when quantum computers can break RSA/ECC, organizations need to switch to quantum-resistant algorithms quickly. It\'s about future-proofing, not performance optimization or defense in depth.',
      memoryHack:
        'Quantum Lock Picking + Crypto Agility: Quantum computers will eventually pick today\'s locks. Crypto agility = building doors where you can swap the lock mechanism without replacing the entire door. QKD = a lock that breaks if someone even looks at it wrong (detecting eavesdroppers through quantum physics).',
      conceptName: 'Quantum Cryptography',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Lightweight Crypto + One-Time Pad
    //           (Janet, "Travel-Size Security" + "Self-Destructing Cipher")
    // ================================================================

    // 9-1. Janet introduces lightweight crypto
    {
      type: 'dialogue',
      id: 'd3a4s9-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The server farm uses thousands of IoT sensors — temperature, humidity, vibration. These tiny devices can\'t run AES-256 — they don\'t have the processing power or memory. That\'s where "Travel-Size Security" comes in: lightweight cryptographic algorithms designed for constrained environments. Smart cards, RFID tags, medical implants, industrial sensors — devices where every byte of memory and every milliwatt of power counts.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
    },

    // 9-2. Janet transitions to One-Time Pad
    {
      type: 'dialogue',
      id: 'd3a4s9-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now the opposite extreme — the "Self-Destructing Cipher." The One-Time Pad is the ONLY encryption system that is mathematically proven to be unbreakable. Not "hard to break" — IMPOSSIBLE to break. But it requires four strict conditions: the key must be truly random (not pseudo-random), the key must be at least as long as the message, the key must be used only ONCE, and the key must be physically secured. Violate ANY one of these, and the security guarantee vanishes completely.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'kai',
      leftExpression: 'surprised',
    },

    // 9-3. Kai adds context
    {
      type: 'dialogue',
      id: 'd3a4s9-dialogue-3',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'So the One-Time Pad is perfect in theory but terrible in practice? You\'d need a key as long as every message, truly random, and you can never reuse it? That sounds like the security equivalent of a disposable phone — works great once, then you throw it away.',
      leftCharacter: 'kai',
      leftExpression: 'thinking',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },

    // 9-4. Janet confirms
    {
      type: 'dialogue',
      id: 'd3a4s9-dialogue-4',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Exactly, Kai. That\'s why it\'s called the "Self-Destructing Cipher" — the key self-destructs after one use. In practice, it\'s only used for the most sensitive diplomatic and military communications where the logistics of key distribution can be managed. For everything else, we use algorithms like AES that are computationally secure — not mathematically perfect, but good enough when key management is practical.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
    },

    // 9-5. Knowledge Check — One-Time Pad
    {
      type: 'knowledgeCheck',
      id: 'd3a4s9-kc-1',
      question:
        'A military unit uses a One-Time Pad for field communications. Due to a supply chain disruption, a key page is used to encrypt two different messages on the same day. What is the security impact?',
      options: [
        'No impact — the One-Time Pad remains unbreakable regardless of key reuse',
        'The encryption strength is reduced by exactly half',
        'The theoretical unbreakability guarantee is completely destroyed, and both messages may be recoverable through crib-dragging',
        'Only the second message is compromised; the first message remains secure',
      ],
      correctIndex: 2,
      explanation:
        'Reusing a One-Time Pad key completely destroys its security guarantee. An attacker can XOR the two ciphertexts together, which cancels out the key and produces the XOR of the two plaintexts. Using frequency analysis and crib-dragging (guessing words in one message to reveal the other), both messages can be recovered. ALL four conditions must be met — violating even one breaks the entire system.',
      memoryHack:
        'Self-Destructing Cipher: The 4 conditions spell ROLF — Random key, One-time use, Length >= message, Physically secured (Fail-safe). If the cipher doesn\'t self-destruct after one use, it\'s just a regular cipher pretending to be invincible. Reuse = the self-destruct mechanism failed.',
      conceptName: 'One-Time Pad',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Museum of Formal Models
    //            (Janet, "Museum of Formal Models")
    // ================================================================

    // 10-1. Janet introduces the museum
    {
      type: 'dialogue',
      id: 'd3a4s10-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'While the tactical team patches the backdoors, let\'s visit the "Museum of Formal Models." We covered Bell-LaPadula, Biba, and Clark-Wilson earlier. Now we need the rest of the collection — the models that deal with access rights management, information flow, and interference.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 10-2. Visual Aid — Formal models list
    {
      type: 'visualAid',
      id: 'd3a4s10-visual-1',
      title: 'Museum of Formal Models — Advanced Collection',
      aidType: 'list',
      items: [
        {
          label: 'Graham-Denning (8 Protection Rules)',
          description:
            'Defines 8 primitive rules for securely managing objects and subjects: create/delete an object, create/delete a subject, read/grant/delete access rights, and transfer access rights. Think of it as the building code for access control — the fundamental operations any secure system must handle correctly.',
        },
        {
          label: 'HRU (Harrison-Ruzzo-Ullman)',
          description:
            'Uses an access matrix to analyze whether a system is "safe" — meaning no unauthorized access right can ever be granted. Proved that the general safety question is UNDECIDABLE for arbitrary systems. If the exam asks about "access matrix safety," think HRU.',
        },
        {
          label: 'Take-Grant',
          description:
            'Models access rights as a directed graph. Subjects can "take" rights from other subjects or "grant" rights to them. Analyzes whether rights can flow from one subject to another through a chain of take/grant operations. Simpler than HRU — safety IS decidable in Take-Grant systems.',
        },
        {
          label: 'Goguen-Meseguer (Noninterference)',
          description:
            'Ensures that actions by high-security subjects have NO observable effect on low-security subjects. If a Top Secret user\'s actions are invisible to an Unclassified user, noninterference holds. Prevents covert channels by mathematical proof.',
        },
        {
          label: 'Sutherland (Integrity via Noninterference)',
          description:
            'Focuses on INTEGRITY rather than confidentiality. Uses noninterference to prevent low-integrity processes from affecting high-integrity processes. If untrusted code cannot influence trusted operations, integrity is maintained. Think of it as the integrity twin of Goguen-Meseguer.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'For the exam, the key distinctions are: Graham-Denning = 8 rules for rights management. HRU = access matrix, safety is undecidable. Take-Grant = directed graph, safety IS decidable. Goguen-Meseguer = noninterference for confidentiality. Sutherland = noninterference for integrity. Don\'t confuse them — each has a unique focus.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 10-3. Knowledge Check — Formal models
    {
      type: 'knowledgeCheck',
      id: 'd3a4s10-kc-1',
      question:
        'A security architect needs to formally verify that no sequence of operations in a new access control system can result in an unauthorized subject gaining read access to a protected object. Which formal model\'s analysis framework is MOST directly applicable?',
      options: [
        'Bell-LaPadula, because it addresses read access through the Simple Security Property',
        'Harrison-Ruzzo-Ullman (HRU), because it analyzes whether an access matrix can reach an unsafe state',
        'Goguen-Meseguer, because it proves noninterference between security levels',
        'Graham-Denning, because it defines the 8 rules for managing access rights',
      ],
      correctIndex: 1,
      explanation:
        'HRU specifically addresses the "safety problem" — whether an access control system can ever reach a state where an unauthorized right is granted. It uses the access matrix model to analyze sequences of operations. While HRU proved that the general safety question is undecidable, it remains the correct framework for analyzing specific, constrained systems. Bell-LaPadula defines access rules but doesn\'t analyze whether violations are reachable. Graham-Denning defines operations but doesn\'t analyze safety.',
      memoryHack:
        'Museum of Formal Models: HRU = the Safety Inspector. "Can this building (access matrix) ever collapse (reach an unsafe state)?" Graham-Denning = the Building Code (8 rules). Take-Grant = the Subway Map (directed graph of rights). Goguen-Meseguer = the Soundproof Wall (noninterference). Sutherland = the Clean Room Wall (integrity noninterference).',
      conceptName: 'HRU Model',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 11 — Enterprise Architecture Frameworks
    //            (Reeves, "City Planning Methodologies")
    // ================================================================

    // 11-1. Reeves introduces architecture frameworks
    {
      type: 'dialogue',
      id: 'd3a4s11-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The server farm\'s architecture was a patchwork — no unified framework guiding how systems were designed, deployed, or connected. That\'s like building a city without a master plan. I call enterprise architecture frameworks "City Planning Methodologies." Each one takes a different approach to designing the city, but they all aim for the same goal: organized, sustainable, secure growth.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-2. Reeves explains the three frameworks
    {
      type: 'dialogue',
      id: 'd3a4s11-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Three you must know: Zachman is a 6x6 classification matrix — six questions (What, How, Where, Who, When, Why) across six perspectives (Executive, Business Management, Architect, Engineer, Technician, Enterprise). It\'s a TAXONOMY, not a process. TOGAF uses the Architecture Development Method (ADM) — a step-by-step cycle for designing enterprise architecture. SABSA is the only one specifically built for SECURITY architecture, using a layered approach from business requirements down to security components.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 11-3. Knowledge Check — Architecture frameworks
    {
      type: 'knowledgeCheck',
      id: 'd3a4s11-kc-1',
      question:
        'An organization needs to align its security architecture with business objectives using a framework that addresses security at every architectural layer — from business context through component design. Which framework is MOST appropriate?',
      options: [
        'Zachman Framework, because it covers all six architectural perspectives',
        'TOGAF with the Architecture Development Method',
        'SABSA (Sherwood Applied Business Security Architecture)',
        'ITIL for service management alignment',
      ],
      correctIndex: 2,
      explanation:
        'SABSA is the only enterprise architecture framework specifically designed for security. It maps security requirements from business context (why?) through conceptual, logical, physical, and component layers. Zachman is a classification taxonomy (not security-specific). TOGAF is a general architecture development method. ITIL is for IT service management, not architecture.',
      memoryHack:
        'City Planning Methodologies: Zachman = the zoning map (classifies everything in a 6x6 grid, but doesn\'t tell you how to build). TOGAF = the construction process (ADM = step-by-step building method). SABSA = the security blueprint (the ONLY one designed specifically for security architecture).',
      conceptName: 'Enterprise Architecture Frameworks',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 12 — Edge/Fog/CDN + Microservices/Serverless
    //            (Janet, "Branch Office Network" + "Food Truck Fleet")
    // ================================================================

    // 12-1. Janet introduces edge computing
    {
      type: 'dialogue',
      id: 'd3a4s12-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The server farm processes data from regional offices worldwide. Rather than sending everything to Zurich for processing, some data is handled locally. Think of edge and fog computing as a "Branch Office Network." Instead of mailing every document to headquarters for a decision, the branch office handles routine work locally. Edge computing processes data at or near the source — IoT devices, local gateways. Fog computing is the middle layer between edge and cloud. CDNs distribute content to servers closer to users for faster delivery.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'player',
      leftExpression: 'neutral',
    },

    // 12-2. Janet transitions to microservices
    {
      type: 'dialogue',
      id: 'd3a4s12-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now think about how the server farm\'s applications are built. Modern architecture uses microservices — I call this the "Food Truck Fleet." Instead of one giant restaurant (monolithic application), you have a fleet of independent food trucks, each serving one dish perfectly. They communicate through well-defined APIs. If the taco truck breaks down, the burger truck keeps serving. Serverless takes this further — your food truck only exists when a customer orders. No customers? No truck. No cost. That\'s event-driven, pay-per-execution computing.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
    },

    // 12-3. Knowledge Check — Modern architectures
    {
      type: 'knowledgeCheck',
      id: 'd3a4s12-kc-1',
      question:
        'An organization migrates from a monolithic application to a microservices architecture. Each microservice communicates via REST APIs. What is the PRIMARY security challenge introduced by this architectural change?',
      options: [
        'Microservices cannot use encryption because of performance overhead',
        'The dramatically increased number of API endpoints and inter-service communication channels that must each be authenticated, authorized, and monitored',
        'Microservices are incompatible with traditional firewall-based security',
        'Each microservice must use a different programming language for security isolation',
      ],
      correctIndex: 1,
      explanation:
        'Microservices architecture replaces one monolithic attack surface with potentially hundreds of API endpoints. Each service-to-service communication must be authenticated (mutual TLS), authorized (API gateway, service mesh), and monitored (distributed tracing). The attack surface expands dramatically. A compromised microservice could be used to laterally move through the API network. This is why API gateways and service meshes are critical in microservices security.',
      memoryHack:
        'Food Truck Fleet: One restaurant has one front door to secure. A fleet of 50 food trucks has 50 service windows — each one needs its own lock, its own cash register, and its own security camera. More trucks = more attack surface. API gateways = the food court security guard checking every truck.',
      conceptName: 'Microservices and Serverless',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 13 — Security Modes of Operation
    //            (Morales, "Building Clearance Levels")
    // ================================================================

    // 13-1. Morales introduces security modes
    {
      type: 'dialogue',
      id: 'd3a4s13-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The server farm processes data at multiple classification levels — some clusters handle Unclassified, others handle Secret. How a system is configured to handle different classification levels is called its security mode of operation. Think of it as "Building Clearance Levels" — who can enter, what they can access, and what the building is certified to contain.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 13-2. Morales explains the four modes
    {
      type: 'dialogue',
      id: 'd3a4s13-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Four modes, from most restrictive to least: DEDICATED mode — everyone has the same clearance, same NTK, for the same data. The entire system processes one classification level only. SYSTEM HIGH — everyone has clearance for the highest level, but not everyone has need-to-know for everything. COMPARTMENTED — everyone has clearance, but access is restricted by formal compartments (like SCI programs). MULTILEVEL — the holy grail — users with DIFFERENT clearance levels on the SAME system. This requires the most trusted hardware and software — MAC enforcement, trusted labels, the works.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 13-3. Knowledge Check — Security modes
    {
      type: 'knowledgeCheck',
      id: 'd3a4s13-kc-1',
      question:
        'A military command center processes both Secret and Top Secret data on the same system. Users have different clearance levels — some hold Secret clearance and others hold Top Secret. The system enforces mandatory access controls to prevent unauthorized cross-level access. What security mode of operation is this system running in?',
      options: [
        'Dedicated mode',
        'System High mode',
        'Compartmented mode',
        'Multilevel mode',
      ],
      correctIndex: 3,
      explanation:
        'Multilevel mode is the ONLY mode where users with DIFFERENT clearance levels share the same system. It requires mandatory access controls (MAC) to enforce separation between classification levels. Dedicated mode requires identical clearance AND need-to-know. System High requires all users to have clearance at the highest level. Compartmented mode requires clearance at the highest level plus formal access approval for specific compartments. Only Multilevel supports mixed clearance levels.',
      memoryHack:
        'Building Clearance Levels: Dedicated = everyone in the building has the same badge and the same keys. System High = everyone has the master key but different room assignments. Compartmented = everyone has the master key but needs special approval for certain vaults. Multilevel = people with different badge levels share the building, and the doors enforce who enters where.',
      conceptName: 'Security Modes of Operation',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 14 — Web App Vulnerabilities + Crypto-shredding
    //            (Janet, "Open Window Exploits" + "Burning the Key Ring")
    // ================================================================

    // 14-1. Janet introduces web vulnerabilities
    {
      type: 'dialogue',
      id: 'd3a4s14-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The attacker\'s initial foothold came through the server farm\'s web management portal. Classic web application vulnerabilities — "Open Window Exploits." Every web app is a building with windows. If you leave them open without screens, anyone can climb in. The root cause of almost every web vulnerability is the same: insufficient input validation.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 14-2. Janet explains the major vulnerability types
    {
      type: 'dialogue',
      id: 'd3a4s14-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Three critical types: XSS — Cross-Site Scripting — injects malicious scripts into web pages viewed by other users. Stored XSS persists on the server, reflected XSS bounces off a URL parameter, and DOM-based XSS manipulates the page\'s JavaScript directly. CSRF — Cross-Site Request Forgery — tricks an authenticated user\'s browser into making requests they didn\'t intend. SQLi — SQL Injection — inserts database commands through input fields to read, modify, or delete data. The attacker used stored XSS to plant a keylogger in the admin portal, then used the captured credentials for SQL injection to extract the database.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'worried',
    },

    // 14-3. Janet introduces crypto-shredding
    {
      type: 'dialogue',
      id: 'd3a4s14-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now for the cleanup. Some of the compromised data is in cloud storage that we can\'t physically destroy. That\'s where "Burning the Key Ring" comes in — crypto-shredding. Instead of trying to delete every copy of the data across distributed cloud storage, you destroy the encryption keys. Without the keys, the encrypted data is permanently unrecoverable. It\'s like burning the only key to a vault — the contents still exist, but nobody can ever access them again. This is a critical technique for cloud environments where you can\'t guarantee physical media destruction. Cross-reference Domain 2.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 14-4. Think Like a Manager — Web security decision
    {
      type: 'thinkLikeManager',
      id: 'd3a4s14-tlatm-1',
      scenario:
        'After the breach, the development team proposes rebuilding the web management portal with a Web Application Firewall (WAF) as the primary defense against XSS, CSRF, and SQL injection. They argue the WAF will catch all malicious input, so the application code doesn\'t need extensive input validation. The rebuild timeline with the WAF-only approach is 2 weeks; adding thorough input validation to the code adds 6 weeks.',
      question:
        'As the security manager, what is the MOST appropriate response?',
      options: [
        'Approve the WAF-only approach to get the portal back online faster',
        'Require both the WAF AND thorough input validation in the application code, accepting the longer timeline',
        'Skip the WAF and focus entirely on input validation in the code',
        'Deploy the WAF now and schedule input validation as a future enhancement',
      ],
      correctIndex: 1,
      explanation:
        'A WAF is a compensating control, not a primary control. WAFs can be bypassed through encoding tricks, zero-day payloads, or misconfigured rules. Input validation at the APPLICATION layer is the root fix — it prevents vulnerabilities from existing in the first place. Defense in depth requires BOTH: the WAF as a perimeter filter AND input validation as the primary code-level defense. Accepting the longer timeline is the correct management decision because the 6-week delay prevents recurring breaches.',
      managerInsight:
        'Think like a manager: the 6-week delay costs time, but another breach costs the organization\'s reputation, customer trust, and potentially millions in damages. A WAF without input validation is like putting a security guard at the door of a building with no locks — if the guard steps away, everything is exposed. Input validation IS the lock. The WAF is the guard. You need both.',
      conceptName: 'Web Application Vulnerabilities',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 14-5. Knowledge Check — Web vulnerabilities + crypto-shredding
    {
      type: 'knowledgeCheck',
      id: 'd3a4s14-kc-1',
      question:
        'An organization needs to ensure that sensitive data stored by a third-party cloud provider is permanently unrecoverable after contract termination. The cloud provider cannot guarantee physical destruction of all storage media containing the data. What is the MOST effective approach?',
      options: [
        'Request the cloud provider to overwrite the data three times using DoD 5220.22-M standards',
        'Rely on the cloud provider\'s data deletion API and obtain a certificate of destruction',
        'Implement crypto-shredding by destroying all encryption keys, rendering the encrypted data permanently unrecoverable',
        'Pursue legal action to compel the cloud provider to physically destroy the storage media',
      ],
      correctIndex: 2,
      explanation:
        'Crypto-shredding — destroying the encryption keys — is the most effective approach when physical media destruction is not possible. Without the keys, the encrypted data is cryptographically unrecoverable regardless of how many copies exist across the cloud infrastructure. Overwrite requests assume you know where all copies are (you don\'t in cloud). Provider deletion APIs don\'t guarantee all replicas are removed. Legal action doesn\'t solve the technical problem.',
      memoryHack:
        'Burning the Key Ring: In the cloud, you can\'t find every copy of your data. But if every copy is encrypted and you burn the ONLY key ring, it doesn\'t matter how many copies exist — they\'re all permanently locked boxes with no key. Crypto-shredding = burn the keys, not the data.',
      conceptName: 'Crypto-shredding',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 15 — Act 4 Wrap-up / Boss Battle Prep
    // ================================================================

    // 15-1. Transition
    {
      type: 'transition',
      id: 'd3a4s15-transition-1',
      location: 'zurich',
      description: 'Zurich Server Farm — Crisis Command Center',
      animation: 'fade',
      timeSkipText: 'Day 5 — The Final Assessment',
    },

    // 15-2. Reeves delivers the assessment
    {
      type: 'dialogue',
      id: 'd3a4s15-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The backdoors are sealed. The SCADA systems are isolated. The web portal is offline pending rebuild. {player}, you\'ve navigated the most technical crisis we\'ve faced yet — from cryptanalytic attacks to formal security models to industrial control systems. The attacker threw everything at us, and you held the line.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 15-3. Janet preps for the assessment
    {
      type: 'dialogue',
      id: 'd3a4s15-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'You\'ve covered cryptanalysis, block cipher modes, formal models from Graham-Denning to Sutherland, TOCTOU race conditions, steganography, quantum cryptography, lightweight crypto, one-time pads, architecture frameworks, modern computing paradigms, security modes of operation, web vulnerabilities, and crypto-shredding. The Domain 3 assessment will test ALL of it. Remember your memory hacks — they\'ll save you when the questions get tricky.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 15-4. Morales adds tactical encouragement
    {
      type: 'dialogue',
      id: 'd3a4s15-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The SCADA concepts and security modes are my territory, and you handled them like a veteran. Remember: in ICS/SCADA, safety and availability come before patching. In security modes, Multilevel is the only one where users have different clearance levels. You\'ve got this.',
      leftCharacter: 'morales',
      leftExpression: 'smile',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 15-5. Kai wraps up with encouragement
    {
      type: 'dialogue',
      id: 'd3a4s15-dialogue-4',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'From the Codebreaker\'s Toolkit to the Museum of Formal Models, from the Factory Floor Fortress to Burning the Key Ring — you\'ve built a serious mental arsenal, {player}. The boss battle is going to test every room in that museum and every tool in that toolkit. Go prove you\'ve mastered Security Architecture and Engineering.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },
  ],
};
