import { ActDefinition } from '@/lib/story-types';

export const domain2Act4: ActDefinition = {
  actNumber: 4,
  title: 'The Escalation',
  description:
    'The stolen data is threatened for public release. Master DRM, encryption types, e-discovery, sovereignty, data destruction, and advanced asset protection under crisis pressure.',
  xpReward: 300,
  conceptsCovered: [
    'DRM and IRM',
    'End-to-End vs Link vs Onion Encryption',
    'E-discovery and Litigation Holds',
    'EOL vs EOS',
    'Object Reuse',
    'Data Location and Sovereignty',
    'Homomorphic Encryption',
    'Declassification Process',
    'Air-Gapped Networks',
    'Defensible Destruction',
    'Memory Types and Security',
    'Randomized Masking',
  ],
  estimatedMinutes: 24,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Transition: Crisis Escalation
    // ================================================================

    // 1-1. Transition
    {
      type: 'transition',
      id: 'd2a4s1-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Crisis Command Center',
      animation: 'glitch',
      timeSkipText: 'Day 4 — 0200 Hours — CRITICAL STATUS',
    },

    // 1-2. Reeves opens with urgency
    {
      type: 'dialogue',
      id: 'd2a4s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Everyone listen up. The attacker\'s deadline is in 48 hours. Legal counsel is on the line, federal agencies are demanding a full accounting, and the board wants answers. We need to understand every angle — from how the data is protected in transit, to our legal obligations, to how we prevent this from ever happening again.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
    },

    // 1-3. Janet sets the learning context
    {
      type: 'dialogue',
      id: 'd2a4s1-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The attacker is distributing samples through encrypted channels. To understand how they\'re hiding the data in transit — and how we can trace it — you need to understand encryption architectures. Stay close, {player}.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // ================================================================
    // SCENE 2 — DRM and IRM (Janet, "Digital Lock and Key")
    //           Interactive Image: process_flow — DRM Enforcement Lifecycle
    // ================================================================

    // 2-1. Janet introduces DRM
    {
      type: 'dialogue',
      id: 'd2a4s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Before we talk about how data moves, let\'s talk about how it STAYS protected even after it leaves our systems. Digital Rights Management — DRM — is like a "Digital Lock and Key." Even after you hand someone a file, the lock travels with it. They can only do what the key allows — view it, print it, copy it, or nothing at all.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 2-2. Janet explains DRM vs IRM
    {
      type: 'dialogue',
      id: 'd2a4s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'DRM protects copyrighted content — music, movies, software. It\'s backed by the DMCA (Digital Millennium Copyright Act), which criminalizes bypassing technological protection measures. IRM — Information Rights Management — is a subset focused on organizational documents. Think of IRM as DRM for your internal PDFs and spreadsheets. An IRM-protected document can be set to expire, prevent printing, block forwarding, and maintain a continuous audit trail.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 2-3. Interactive Image — DRM Enforcement Lifecycle
    {
      type: 'interactiveImage',
      id: 'd2a4s2-interactive-1',
      title: 'Digital Lock and Key — DRM Enforcement Lifecycle',
      imageType: 'process_flow',
      backgroundGradient:
        'linear-gradient(135deg, #0c0a09 0%, #1a1028 40%, #0c0a09 100%)',
      conceptName: 'DRM and IRM',
      speaker: 'janet',
      dialogue:
        'Click each stage to see how DRM protects content throughout its lifecycle — from creation to consumption.',
      completionDialogue:
        'DRM isn\'t foolproof — determined attackers can bypass protections, and fair-use advocates push back against overly restrictive DRM. But for the CISSP exam, know the mechanisms, the legal backing (DMCA), and the difference between DRM (copyrighted content) and IRM (organizational documents).',
      rightCharacter: 'janet',
      rightExpression: 'smile',
      hotspots: [
        {
          id: 'drm-create',
          label: 'Create & Protect',
          x: 5,
          y: 30,
          width: 18,
          height: 35,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Content is created and encrypted with a content key. A licensing agreement defines what actions are permitted — view, copy, print, time limits. The lock is forged and attached to the content.',
          detail:
            'Techniques include: encryption, digital tags/watermarks, licensing agreements, and persistent online authentication requirements.',
        },
        {
          id: 'drm-distribute',
          label: 'Distribute',
          x: 26,
          y: 30,
          width: 18,
          height: 35,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Protected content is distributed. The encryption and license travel with the file. Without the proper license, the file is just encrypted noise. Think of it like sending a locked briefcase — useless without the combination.',
          detail:
            'Distribution can be digital (download, streaming) or physical (encrypted media). The DRM wrapper stays intact through all distribution channels.',
        },
        {
          id: 'drm-consume',
          label: 'Consume & Enforce',
          x: 47,
          y: 30,
          width: 18,
          height: 35,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'The consumer\'s device checks the license with an authentication server. If valid, the content unlocks for approved actions only. Cannot print? The print function is grayed out. Expired license? The file locks itself. Continuous enforcement.',
          detail:
            'Persistent online authentication verifies the license is still valid. Some DRM requires an active internet connection. Automatic expiration can revoke access after a set date.',
        },
        {
          id: 'drm-audit',
          label: 'Audit Trail',
          x: 68,
          y: 30,
          width: 18,
          height: 35,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Every access attempt is logged. Who opened it, when, from where, what actions they performed. If the Data Vault had used IRM on their classified documents, we\'d have a complete access trail right now — instead of guessing what the attacker touched.',
          detail:
            'The continuous audit trail is one of DRM/IRM\'s most valuable features for security teams. It provides forensic evidence of access patterns and potential unauthorized use.',
        },
      ],
    },

    // 2-4. Knowledge Check — DRM vs IRM
    {
      type: 'knowledgeCheck',
      id: 'd2a4s2-kc-1',
      question:
        'An organization needs to protect internal strategy documents so that recipients cannot print, forward, or access them after a merger announcement date. Which technology is MOST appropriate?',
      options: [
        'DRM with DMCA protections',
        'Information Rights Management (IRM)',
        'Full disk encryption',
        'Data Loss Prevention (DLP)',
      ],
      correctIndex: 1,
      explanation:
        'IRM (Information Rights Management) is designed specifically for organizational document protection. It can restrict printing, forwarding, and set automatic expiration dates — exactly what\'s needed here. DRM is for copyrighted content (music, movies). Full disk encryption protects data at rest but doesn\'t control what recipients do with files. DLP prevents exfiltration but doesn\'t restrict actions after legitimate access.',
      memoryHack:
        'Digital Lock and Key: DRM = music and movies (consumer content + DMCA). IRM = internal documents (organizational control). If the question says "organizational documents" or "internal memos" — think IRM, not DRM.',
      conceptName: 'DRM and IRM',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — End-to-End vs Link vs Onion Encryption
    //           (Janet, "Armored Car Routes")
    // ================================================================

    // 3-1. Janet introduces encryption types
    {
      type: 'dialogue',
      id: 'd2a4s3-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now, how is the attacker distributing the stolen data? Our signals team tracked three different encryption approaches. I call them "Armored Car Routes" — each route protects the cargo differently.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 3-2. Visual Aid — Three encryption types comparison
    {
      type: 'visualAid',
      id: 'd2a4s3-visual-1',
      title: 'Armored Car Routes — Encryption in Transit',
      aidType: 'table',
      headers: ['Feature', 'End-to-End', 'Link', 'Onion (TOR)'],
      rows: [
        ['What\'s Encrypted', 'Data payload only', 'Entire packet (header + data)', 'Multiple layers around data'],
        ['Routing Info Visible?', 'Yes — headers in plaintext', 'No — hidden between hops', 'No — hidden from all nodes'],
        ['Plaintext Exposed At', 'Source and destination only', 'EVERY intermediate node', 'Final destination only'],
        ['Anonymity', 'No', 'Partial (between hops)', 'Yes'],
        ['Performance', 'Good', 'Good', 'Slower'],
        ['Example', 'VPN', 'ISP link encryption', 'TOR network'],
      ],
      speaker: 'janet',
      dialogue:
        'The critical exam trap: with LINK encryption, data is decrypted and re-encrypted at EVERY node. That means plaintext is available at each intermediate point. End-to-end keeps the payload encrypted through all intermediaries, but the routing headers are visible. TOR hides everything — but at a performance cost.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 3-3. Knowledge Check — Encryption types (link trap)
    {
      type: 'knowledgeCheck',
      id: 'd2a4s3-kc-1',
      question:
        'An organization uses link encryption to protect data between its branch offices. At which points is the data in PLAINTEXT?',
      options: [
        'Only at the sending and receiving offices',
        'At every intermediate network node between the offices',
        'Only at the final destination',
        'The data is never in plaintext during transmission',
      ],
      correctIndex: 1,
      explanation:
        'With link encryption, the entire packet (header + data) is encrypted between nodes, but data is decrypted and re-encrypted at EVERY intermediate node. This means plaintext is available at each hop. End-to-end encryption would keep data encrypted at intermediate nodes, but link encryption does not. This is a heavily tested exam concept.',
      memoryHack:
        'Armored Car Routes: Link = the armored car opens at every checkpoint to verify cargo. End-to-End = sealed cargo from warehouse to warehouse, checkpoints can only see the shipping label. TOR = sealed cargo in nested boxes, no one sees the final label.',
      conceptName: 'End-to-End vs Link vs Onion Encryption',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — E-discovery and Litigation Holds
    //           (Morales, "Crime Scene Freeze")
    // ================================================================

    // 4-1. Morales introduces e-discovery
    {
      type: 'dialogue',
      id: 'd2a4s4-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The legal situation just escalated. Three affected agencies are filing lawsuits, and the federal prosecutor wants to see everything. That triggers e-discovery — the legal process of identifying, collecting, and producing electronically stored information. I think of it as a "Crime Scene Freeze" — once litigation starts, you lock down everything and don\'t touch it until the lawyers say so.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 4-2. Morales explains litigation hold
    {
      type: 'dialogue',
      id: 'd2a4s4-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The litigation hold is the first step — it suspends ALL automated data deletion. Every backup tape, every email archive, every log file that could be relevant must be preserved. Destroying data after you know about potential litigation is called spoliation of evidence, and the penalties are severe. Remember the Expiration Date Labels from Day 1? The expiration dates are suspended the moment legal tells you litigation is coming.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4-3. Timed Decision — E-discovery scenario
    {
      type: 'timedDecision',
      id: 'd2a4s4-timed-1',
      scenario:
        'URGENT: Legal counsel informs you that three federal agencies will file suit within 24 hours. Your automated systems delete email older than 90 days at midnight tonight. Server logs from the breach period are scheduled for rotation in 6 hours. The backup tape destruction schedule runs every Friday — today is Thursday.',
      timeLimit: 30,
      conceptName: 'E-discovery and Litigation Holds',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      options: [
        {
          text: 'Issue an immediate litigation hold on all email, logs, and backup tapes — suspend every automated deletion process',
          isOptimal: true,
          feedback:
            'Correct. A litigation hold must be issued IMMEDIATELY upon learning of anticipated litigation. All automated destruction processes must be suspended. Missing even one data source can result in spoliation sanctions.',
          xpBonus: 100,
        },
        {
          text: 'Preserve only the data specifically related to the breach incident',
          isOptimal: false,
          feedback:
            'Too narrow. A litigation hold must be broad enough to cover all POTENTIALLY relevant data. You cannot predict what the opposing counsel will request. Preserving only breach-related data risks spoliation if other relevant data is destroyed.',
          xpBonus: 25,
        },
        {
          text: 'Let the scheduled deletions run and start preservation tomorrow morning',
          isOptimal: false,
          feedback:
            'Dangerous. Once you are aware of anticipated litigation, any data destruction — even automated — can be considered spoliation. Every hour of delay is another hour of potentially destroyed evidence.',
          xpBonus: 5,
        },
        {
          text: 'Ask legal to negotiate a delay in the lawsuits to give you time to prepare',
          isOptimal: false,
          feedback:
            'You cannot control the timing of litigation. The preservation obligation begins when litigation is REASONABLY ANTICIPATED, not when it\'s filed. Legal negotiation doesn\'t change your preservation obligations.',
          xpBonus: 5,
        },
      ],
    },

    // ================================================================
    // SCENE 5 — EOL vs EOS (Kai, "Car Warranty Expiration")
    // ================================================================

    // 5-1. Kai introduces EOL/EOS
    {
      type: 'dialogue',
      id: 'd2a4s5-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'While we\'re investigating, {player}, I found something in the Vault\'s asset inventory that should concern everyone. Several of their storage controllers hit End of Support eighteen months ago. Think of it like a "Car Warranty Expiration." EOL means the manufacturer stopped SELLING the car — but they still fix it if it breaks. EOS means the warranty is completely over — no more oil changes, no more recalls, no more security patches.',
      rightCharacter: 'kai',
      rightExpression: 'worried',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
    },

    // 5-2. Kai explains the security risk
    {
      type: 'dialogue',
      id: 'd2a4s5-dialogue-2',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'EOS is the bigger security concern. No more security patches means every new vulnerability discovered in that product will NEVER be fixed. You\'re driving a car with a known brake defect and no recall. The Vault\'s storage controllers had three unpatched CVEs — and one of them was how the attacker gained initial access to the storage network.',
      rightCharacter: 'kai',
      rightExpression: 'serious',
      leftCharacter: 'janet',
      leftExpression: 'worried',
    },

    // 5-3. Knowledge Check — EOL vs EOS
    {
      type: 'knowledgeCheck',
      id: 'd2a4s5-kc-1',
      question:
        'A critical security patch is released for a vulnerability affecting a server operating system. The vendor confirms the OS has reached End of Life but not yet End of Support. What is the MOST accurate statement?',
      options: [
        'The organization cannot obtain the patch because the OS is End of Life',
        'The patch will be available because the vendor still provides support despite no longer selling the product',
        'End of Life means the server must be immediately decommissioned',
        'The organization should ignore the patch since the OS is being retired',
      ],
      correctIndex: 1,
      explanation:
        'EOL means the vendor stopped SELLING the product, but support (including security patches) continues until EOS. The patch is still available. EOL does not require immediate decommissioning — that urgency comes at EOS when NO more patches are provided. Budget priority should focus on systems approaching EOS.',
      memoryHack:
        'Car Warranty Expiration: EOL = car is discontinued (can\'t buy a new one), but the warranty still covers repairs. EOS = warranty expired — you\'re on your own for EVERYTHING. EOS = the real danger.',
      conceptName: 'EOL vs EOS',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Object Reuse (Morales, "Hotel Room Turnover")
    // ================================================================

    // 6-1. Morales introduces object reuse
    {
      type: 'dialogue',
      id: 'd2a4s6-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The EOS hardware at the Vault was supposed to be decommissioned and reissued to a lower-classification network. That\'s object reuse — and it was done wrong. Think of it as "Hotel Room Turnover." When a guest checks out, the hotel must clean the room thoroughly before the next guest checks in. If the previous guest left documents under the mattress, the new guest finds them.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 6-2. Morales explains the concept
    {
      type: 'dialogue',
      id: 'd2a4s6-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Object reuse in security means reassigning storage media where residual data from prior use cannot be accessed by the new subject. The concept originates from the Orange Book — the Trusted Computer System Evaluation Criteria (TCSEC). The rule is simple: before any storage medium is reused, ALL previous data must be properly sanitized. The Vault reissued drives with a simple format — which we already know is the weakest form of sanitization. The data was still there.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6-3. Knowledge Check — Object Reuse
    {
      type: 'knowledgeCheck',
      id: 'd2a4s6-kc-1',
      question:
        'Hard drives from a Top Secret system are reformatted and reassigned to an Unclassified training network. Six months later, a trainee recovers fragments of classified documents from the drives using free data recovery software. What security concept was violated?',
      options: [
        'Data classification',
        'Object reuse',
        'Need-to-know',
        'Separation of duties',
      ],
      correctIndex: 1,
      explanation:
        'Object reuse requires that ALL residual data be properly removed before reassigning media to a new subject or classification level. Reformatting is insufficient — it only removes the directory structure, not the data itself. For Top Secret to Unclassified transition, purging or physical destruction would be required. Simple reformatting violates object reuse principles.',
      memoryHack:
        'Hotel Room Turnover: Reformatting is like changing the sheets but not checking under the mattress. Object reuse requires a DEEP clean — every trace of the previous guest (data) must be gone before the next guest (user) moves in.',
      conceptName: 'Object Reuse',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Data Location and Sovereignty
    //           (Reeves, "Embassy Territory Rules")
    // ================================================================

    // 7-1. Reeves introduces sovereignty
    {
      type: 'dialogue',
      id: 'd2a4s7-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Here\'s another complication, {player}. Some of the stolen data was replicated to cloud servers in three different countries as part of a disaster recovery arrangement. That means three different nations\' laws now apply. I think of data sovereignty as "Embassy Territory Rules" — an embassy is physically in one country but legally belongs to another. Data sovereignty works the same way: data is subject to the laws of the country where it is STORED, regardless of where the organization is headquartered.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 7-2. Reeves explains implications
    {
      type: 'dialogue',
      id: 'd2a4s7-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'GDPR restricts transfers outside the EU unless adequate protections exist — standard contractual clauses, binding corporate rules, or adequacy decisions. Cloud storage location verification is critical. The Vault\'s cloud provider had nodes in the EU, the US, and Singapore. Each jurisdiction has different rules about government access, breach notification timelines, and data subject rights. You must know WHERE your data physically resides.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7-3. Think Like a Manager — Sovereignty decision
    {
      type: 'thinkLikeManager',
      id: 'd2a4s7-tlatm-1',
      scenario:
        'Your organization processes EU citizen data and stores backups with a cloud provider. You discover the cloud provider recently added data center capacity in a country that does not have a GDPR adequacy decision. The provider has migrated some of your backups to this new data center for load balancing.',
      question: 'What is the MOST important immediate action?',
      options: [
        'Accept the migration since the cloud provider is responsible for compliance',
        'Require the provider to migrate data back to an approved location and implement contractual controls to prevent recurrence',
        'Encrypt the data and consider the sovereignty issue resolved',
        'Notify affected data subjects about the data location change',
      ],
      correctIndex: 1,
      explanation:
        'The data controller (your organization) remains accountable for data protection, not the processor (cloud provider). The immediate priority is to restore compliance by moving data to an approved location and implementing contractual safeguards (like standard contractual clauses) to prevent unauthorized transfers. Encryption alone doesn\'t resolve sovereignty — the data still physically resides under another nation\'s jurisdiction.',
      managerInsight:
        'Remember from Domain 1: accountability doesn\'t transfer when you outsource. Moving to the cloud doesn\'t transfer responsibility. You are the controller. The cloud provider is the processor. If they violate GDPR with your data, YOU face the fines — up to 4% of global revenue.',
      conceptName: 'Data Location and Sovereignty',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 8 — Homomorphic Encryption (Janet, "Sealed Ballot Counting")
    // ================================================================

    // 8-1. Janet introduces homomorphic encryption
    {
      type: 'dialogue',
      id: 'd2a4s8-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'One technology could have protected the data even while it was being processed during the migration — homomorphic encryption. I think of it as "Sealed Ballot Counting." Imagine election workers who can count votes inside sealed ballot boxes without ever opening them. They announce the result, but nobody ever sees the individual ballots. That\'s what homomorphic encryption does for data.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 8-2. Janet explains limitations
    {
      type: 'dialogue',
      id: 'd2a4s8-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Homomorphic encryption allows computations on encrypted data without decrypting it — protecting data in use, the hardest state to protect. Remember Kai\'s Water in Three Forms? This is the armor for steam. The catch: it\'s computationally expensive and still maturing. Full homomorphic encryption that supports ANY computation is extremely slow. Partial and somewhat homomorphic variants handle limited operations but are more practical.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 8-3. Knowledge Check — Homomorphic encryption
    {
      type: 'knowledgeCheck',
      id: 'd2a4s8-kc-1',
      question:
        'A cloud provider needs to perform aggregate statistical analysis on encrypted patient records without accessing the underlying data. Which technology enables this?',
      options: [
        'Tokenization',
        'Pseudonymization',
        'Homomorphic encryption',
        'Symmetric key encryption',
      ],
      correctIndex: 2,
      explanation:
        'Homomorphic encryption allows computations (including statistical analysis) on encrypted data without decrypting it. The results are returned encrypted and only the data owner can decrypt them. Tokenization and pseudonymization replace data but don\'t enable computation on encrypted values. Symmetric encryption protects data at rest but requires decryption for processing.',
      memoryHack:
        'Sealed Ballot Counting: Count the votes without opening the boxes. Process the data without seeing the data. Homomorphic = the only encryption that protects data IN USE during computation.',
      conceptName: 'Homomorphic Encryption',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Declassification Process
    //           (Morales, "Document Downgrade Ladder")
    // ================================================================

    // 9-1. Morales introduces declassification
    {
      type: 'dialogue',
      id: 'd2a4s9-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'As part of recovery, some agencies want to declassify certain documents that are no longer sensitive. That\'s a formal process — you can\'t just peel off the "Top Secret" sticker and call it done. I think of it as a "Document Downgrade Ladder." You step down one rung at a time, with verification at each step.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Morales explains the process and cost
    {
      type: 'dialogue',
      id: 'd2a4s9-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Declassification means purging media or systems for reuse in a lower-security environment. It requires formal authorization from the data owner, verification that all data has been properly sanitized, relabeling of media, and documentation of the entire process. Here\'s the kicker: declassification is often MORE expensive than buying new media. Many organizations skip declassification entirely and just destroy the old media. It\'s cheaper and safer.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-3. Knowledge Check — Declassification
    {
      type: 'knowledgeCheck',
      id: 'd2a4s9-kc-1',
      question:
        'An organization wants to reuse hard drives from a Secret-classified system on an Unclassified network. What is the MOST appropriate approach?',
      options: [
        'Reformat the drives and reassign them',
        'Degauss the drives and verify sanitization before reuse',
        'Physically destroy the drives and purchase new ones for the Unclassified network',
        'Overwrite the drives once using a standard wiping tool',
      ],
      correctIndex: 2,
      explanation:
        'For many organizations, physical destruction and purchasing new media is the MOST appropriate approach for declassification. Declassification (purging media for lower-classification reuse) is often more expensive than replacement due to the extensive verification, documentation, and risk involved. Reformatting and single-pass overwriting are insufficient for Secret data. Degaussing is an option for magnetic media but destruction eliminates all risk.',
      memoryHack:
        'Document Downgrade Ladder: Climbing down is harder than starting fresh. It\'s usually cheaper and safer to destroy the old drives and buy new ones than to certify that every trace of Secret data is gone.',
      conceptName: 'Declassification Process',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Air-Gapped Networks and Unidirectional Bridges
    //            (Janet, "One-Way Mirror")
    // ================================================================

    // 10-1. Janet introduces air gaps
    {
      type: 'dialogue',
      id: 'd2a4s10-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The classified vault at this facility was supposed to be air-gapped — completely disconnected from all other networks. I call air-gapped networks and unidirectional bridges a "One-Way Mirror." An air gap is like a brick wall — nothing gets through in either direction. A unidirectional bridge is a one-way mirror — data can flow OUT for monitoring but nothing can flow IN.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 10-2. Janet explains the breach
    {
      type: 'dialogue',
      id: 'd2a4s10-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'The Vault\'s air gap was compromised when a maintenance technician connected a diagnostic laptop that had been on the corporate network. That bridge — even temporary — was enough for the attacker\'s malware to jump the gap. True air-gapped security means NO physical connections, NO wireless, NO shared media between networks. Technical guards and data diodes enforce one-way data flow when monitoring of the classified network is required.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'worried',
    },

    // 10-3. Knowledge Check — Air gaps
    {
      type: 'knowledgeCheck',
      id: 'd2a4s10-kc-1',
      question:
        'A military facility needs to monitor real-time sensor data from a classified network on an unclassified analysis system. Direct network connectivity between the two systems is not permitted. Which technology BEST addresses this requirement?',
      options: [
        'A VPN tunnel between the two networks',
        'A unidirectional network bridge (data diode)',
        'A firewall with strict access control lists',
        'An encrypted wireless link between the systems',
      ],
      correctIndex: 1,
      explanation:
        'A unidirectional network bridge (data diode) physically enforces one-way data flow — data exits the classified network for monitoring, but nothing can flow back in. This maintains the air gap while allowing read-only monitoring. VPNs, firewalls, and wireless links all create bidirectional connections that violate the air gap principle.',
      memoryHack:
        'One-Way Mirror: A data diode is hardware-enforced one-way glass. Data flows OUT for viewing but NOTHING can flow back IN. Physically impossible to reverse — not just a software rule, but a hardware constraint.',
      conceptName: 'Air-Gapped Networks',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 11 — Defensible Destruction
    //            (Morales, "Witnessed Shredding Ceremony")
    // ================================================================

    // 11-1. Morales introduces defensible destruction
    {
      type: 'dialogue',
      id: 'd2a4s11-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'As we close out the compromised systems, we need to destroy certain media in a way that will hold up in court. That\'s defensible destruction — I think of it as a "Witnessed Shredding Ceremony." You don\'t just shred the documents in a dark room. You bring witnesses, you follow the protocol, you document everything, and you get a certificate.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-2. Morales explains requirements
    {
      type: 'dialogue',
      id: 'd2a4s11-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Defensible destruction means destruction in a controlled, legally defensible, and compliant manner. That requires: a documented destruction policy, an approved method matching the data classification, witnessed execution, verification that destruction was complete, a certificate of destruction, and an audit trail. If regulators or courts ask "did you properly dispose of this data?" you need to produce the paper trail proving you did.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11-3. Knowledge Check — Defensible destruction
    {
      type: 'knowledgeCheck',
      id: 'd2a4s11-kc-1',
      question:
        'An organization physically destroys hard drives containing classified data by shredding them. However, no witnesses were present, no documentation was created, and no certificate of destruction was issued. Is this considered defensible destruction?',
      options: [
        'Yes — physical shredding is the highest form of sanitization',
        'No — defensible destruction requires documented process, witnesses, and a certificate of destruction',
        'Yes — as long as the drives are unrecoverable, the process is defensible',
        'No — only degaussing qualifies as defensible destruction',
      ],
      correctIndex: 1,
      explanation:
        'Physical destruction alone is not "defensible" without the supporting process. Defensible destruction requires a documented policy, approved method, witnesses, verification, and a certificate of destruction. Without these elements, the organization cannot prove in court or to regulators that the data was properly destroyed. The destruction method was fine — the process around it was not.',
      memoryHack:
        'Witnessed Shredding Ceremony: The ceremony matters as much as the shredding. No witnesses + no documentation = no proof. And no proof = legally indefensible, even if the data is truly gone.',
      conceptName: 'Defensible Destruction',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 12 — Memory Types + Randomized Masking
    //            (Janet, "Whiteboard vs Carved Stone" + "Deck of Cards Shuffle")
    // ================================================================

    // 12-1. Janet introduces memory types
    {
      type: 'dialogue',
      id: 'd2a4s12-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Two more concepts before we prep for the assessment, {player}. First: memory types and their security implications. I think of them as "Whiteboard vs Carved Stone." Volatile memory (RAM) is a whiteboard — wipe it clean when you\'re done and the data vanishes. Non-volatile memory (ROM, flash, SSD) is carved stone — the data persists even when power is off. Each has different security concerns.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 12-2. Janet explains security implications
    {
      type: 'dialogue',
      id: 'd2a4s12-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Volatile memory seems safer because data disappears when powered off. But cold boot attacks can freeze RAM and extract data before it fades. Non-volatile memory has remanence concerns — we covered that with SSDs and wear-leveling. The Vault\'s migration tool loaded classified data into RAM without flushing the buffers afterward. An attacker with physical access could have performed a cold boot attack to extract the data from memory.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 12-3. Janet introduces randomized masking
    {
      type: 'dialogue',
      id: 'd2a4s12-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Last concept: randomized masking — the "Deck of Cards Shuffle." Imagine a spreadsheet where you shuffle all the values within each column across rows. The aggregate statistics stay the same — same average salary, same distribution — but individual records are scrambled. It works best with many columns and many records. The attacker tried this technique to disguise the stolen data for resale, but with only a few hundred records, the statistical patterns were easy to reverse-engineer.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 12-4. Knowledge Check — Memory types
    {
      type: 'knowledgeCheck',
      id: 'd2a4s12-kc-1',
      question:
        'After processing classified data, an application terminates but does NOT flush memory buffers. Which attack could exploit the residual data left in RAM?',
      options: [
        'SQL injection',
        'Cold boot attack',
        'Cross-site scripting',
        'Buffer overflow',
      ],
      correctIndex: 1,
      explanation:
        'A cold boot attack can extract data from RAM by quickly cooling the memory modules to slow data decay and then reading the residual contents. If memory buffers are not flushed after processing sensitive data, the data may persist in RAM long enough to be extracted. This is why flushing memory buffers after use is a key control for data in use.',
      memoryHack:
        'Whiteboard vs Carved Stone: RAM is a whiteboard, but even whiteboards retain ghost writing if you don\'t clean them immediately. A cold boot attack freezes the whiteboard before the writing fades. Always flush (erase) the board when you\'re done.',
      conceptName: 'Memory Types and Security',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 13 — Act 4 Wrap-up / Boss Battle Prep
    // ================================================================

    // 13-1. Transition
    {
      type: 'transition',
      id: 'd2a4s13-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Crisis Command Center',
      animation: 'fade',
      timeSkipText: 'Day 5 — The Reckoning',
    },

    // 13-2. Reeves delivers the final message
    {
      type: 'dialogue',
      id: 'd2a4s13-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The ransom deadline passed. The agencies are taking legal action, and the Data Vault is cooperating fully with the investigation. Because of your work, {player}, we\'ve mapped every failure point — from missing classification labels to unpatched EOS hardware to violated air gaps. Now it\'s time to prove you\'ve mastered Asset Security.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 13-3. All NPCs prepare player
    {
      type: 'dialogue',
      id: 'd2a4s13-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'You\'ve learned classification systems, data roles, protection per state, the complete lifecycle, privacy principles, DLP, CASB, encryption architectures, legal obligations, destruction methods, and everything in between. The Domain 2 assessment will test all of it. You\'re ready.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },
  ],
};
