import { ActDefinition } from '@/lib/story-types';

export const domain2Act2: ActDefinition = {
  actNumber: 2,
  title: 'The Investigation',
  description:
    'Uncover the attacker\'s data obfuscation techniques and investigate DLP failures, cloud security gaps, baselines, and privacy governance.',
  xpReward: 250,
  conceptsCovered: [
    'Pseudonymization Tokenization Anonymization',
    'Information Obfuscation Methods',
    'DLP Types and Mechanics',
    'CASB',
    'Data Remanence',
    'Scoping and Tailoring',
    'Security Baselines',
    'Standards Selection',
    'Data Privacy Officer',
  ],
  estimatedMinutes: 22,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Transition: Day 2
    // ================================================================

    // 1-1. Transition
    {
      type: 'transition',
      id: 'd2a2s1-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Forensics Lab, Sub-Level 3',
      animation: 'fade',
      timeSkipText: 'Day 2 — 0730 Hours',
    },

    // 1-2. Reeves opens Day 2
    {
      type: 'dialogue',
      id: 'd2a2s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Morning, {player}. Overnight, the forensics team made a disturbing discovery. The attacker didn\'t just steal data — they replaced sensitive records with modified copies designed to look legitimate. We need to understand exactly how data can be disguised.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 1-3. Kai sets the stage
    {
      type: 'dialogue',
      id: 'd2a2s1-dialogue-2',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'The attacker was clever. They used de-identification techniques — normally legitimate privacy tools — to cover their tracks. Let me walk you through them so you can tell the difference between protective masking and malicious manipulation.',
      rightCharacter: 'kai',
      rightExpression: 'serious',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // ================================================================
    // SCENE 2 — Pseudonymization, Tokenization, and Anonymization
    //           (Kai, "Witness Protection Levels")
    //           Interactive Image: comparison
    // ================================================================

    // 2-1. Kai introduces the analogy
    {
      type: 'dialogue',
      id: 'd2a2s2-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Think of de-identification as "Witness Protection Levels." At the lowest level, you get a new name but your old identity is on file — that\'s pseudonymization. At the medium level, you get a random code number that maps back to your file in a secure vault — that\'s tokenization. At the highest level, your identity is completely erased — no one can ever link back to the original you. That\'s anonymization.',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 2-2. Interactive Image — De-identification comparison
    {
      type: 'interactiveImage',
      id: 'd2a2s2-interactive-1',
      title: 'Witness Protection Levels — De-identification Techniques',
      imageType: 'comparison',
      backgroundGradient:
        'linear-gradient(135deg, #0c0a09 0%, #1a2030 40%, #0c0a09 100%)',
      conceptName: 'Pseudonymization Tokenization Anonymization',
      speaker: 'kai',
      dialogue:
        'Click each protection level to learn how it works, whether it\'s reversible, and how GDPR treats it. These distinctions are exam favorites.',
      completionDialogue:
        'Key takeaway: pseudonymization and tokenization are REVERSIBLE — GDPR still applies to both. Only true anonymization removes data from GDPR scope, and it\'s irreversible. The attacker used pseudonymization to disguise stolen records, but because it\'s reversible, we can still trace them back.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
      hotspots: [
        {
          id: 'pseudo-hotspot',
          label: 'Pseudonymization',
          x: 5,
          y: 20,
          width: 28,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Pseudonymization: Replace identifying data with artificial identifiers (aliases). "John Smith" becomes "Patient-4829." REVERSIBLE — the lookup table links aliases back to originals. GDPR recognizes it as a protection technique with reduced compliance burden, but GDPR still applies because the data can be re-identified.',
          detail:
            'Use cases: research data sharing, internal analytics. The data holder retains the mapping table. Think of it as a new name in witness protection — the marshals still know who you really are.',
        },
        {
          id: 'token-hotspot',
          label: 'Tokenization',
          x: 36,
          y: 20,
          width: 28,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Tokenization: Replace sensitive data with random tokens. Credit card 4111-1111-1111-1111 becomes TKN-839271-XQ. The mapping lives in a secure token vault. REVERSIBLE through the vault. Used heavily in payment card processing — PCI DSS loves tokenization because the merchant never touches the real card number.',
          detail:
            'Key distinction from pseudonymization: the token has NO mathematical relationship to the original data. It\'s purely random. A third party (payment processor) manages the vault. GDPR still applies.',
        },
        {
          id: 'anon-hotspot',
          label: 'Anonymization',
          x: 67,
          y: 20,
          width: 28,
          height: 55,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Anonymization: IRREVERSIBLY remove all identifying data. No lookup table, no vault, no way back. If done correctly, GDPR no longer applies because no individual can be identified. BUT — there is a risk of re-identification through data inference. If you anonymize a dataset but leave enough contextual clues, someone could still figure out who\'s who.',
          detail:
            'The holy grail of privacy — but the hardest to get right. Netflix learned this when researchers re-identified "anonymous" movie ratings by cross-referencing with public IMDB reviews. True anonymization requires removing ALL identifying attributes AND preventing inference attacks.',
        },
      ],
    },

    // 2-3. Knowledge Check — Pseudo vs Anon (GDPR trap)
    {
      type: 'knowledgeCheck',
      id: 'd2a2s2-kc-1',
      question:
        'A research hospital replaces patient names with random codes in a dataset shared with university researchers. The hospital retains a lookup table linking codes to patient identities. Under GDPR, this data is BEST described as:',
      options: [
        'Anonymized — GDPR no longer applies',
        'Pseudonymized — GDPR still applies with reduced requirements',
        'Tokenized — GDPR does not apply to tokens',
        'Encrypted — GDPR applies only if the key is compromised',
      ],
      correctIndex: 1,
      explanation:
        'This is pseudonymization — the data has artificial identifiers (codes) but can be linked back to individuals via the lookup table. GDPR still applies because the data is reversible, but with reduced compliance requirements. Anonymization would require that NO re-identification is possible, which is not the case here since the hospital retains the mapping.',
      memoryHack:
        'Witness Protection Levels: If ANYONE can trace back to the original identity, it\'s NOT anonymization. Pseudonymization = new name (reversible). Anonymization = identity erased (irreversible). GDPR cares about reversibility.',
      conceptName: 'Pseudonymization Tokenization Anonymization',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — Information Obfuscation Methods
    //           (Kai, "Magician's Misdirection")
    // ================================================================

    // 3-1. Kai introduces obfuscation
    {
      type: 'dialogue',
      id: 'd2a2s3-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Beyond those three big techniques, there\'s a whole toolkit for hiding data in plain sight. I call it "Magician\'s Misdirection" — each technique makes you look at something while the real data is hidden somewhere else.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
    },

    // 3-2. Visual Aid — Obfuscation methods
    {
      type: 'visualAid',
      id: 'd2a2s3-visual-1',
      title: 'Magician\'s Misdirection — Information Obfuscation Methods',
      aidType: 'list',
      items: [
        {
          label: 'Concealing (Vanishing Act)',
          description:
            'Completely removes access and visibility to sensitive data. The data is there but invisible to unauthorized viewers.',
        },
        {
          label: 'Pruning (Empty Frame)',
          description:
            'Removes sensitive data from attributes — the field appears but is blank. Like a picture frame with no photo.',
        },
        {
          label: 'Fabricating (Decoy Cards)',
          description:
            'Creates fake data for testing or to replace sensitive data. Realistic-looking but entirely fictional.',
        },
        {
          label: 'Trimming (Half the Card)',
          description:
            'Shows partial attribute values. Example: showing only the last 4 digits of an SSN (***-**-1234) or credit card number.',
        },
        {
          label: 'Encrypting (Locked Box)',
          description:
            'Can be at attribute, table, or database level. The data is there but unreadable without the key.',
        },
        {
          label: 'Masking / Shuffling (Deck Shuffle)',
          description:
            'Shuffles data values within columns across records. Maintains aggregate statistical values while breaking individual record links.',
        },
      ],
      speaker: 'kai',
      dialogue:
        'The attacker used trimming and fabrication — they left the last 4 digits intact to avoid detection but fabricated the full record underneath. Clever, but the checksum patterns gave them away.',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // 3-3. Knowledge Check — Obfuscation
    {
      type: 'knowledgeCheck',
      id: 'd2a2s3-kc-1',
      question:
        'A software development team needs realistic-looking data to test a new billing application but cannot use actual customer records due to privacy regulations. Which obfuscation technique is MOST appropriate?',
      options: [
        'Trimming — show only partial records',
        'Fabrication — generate entirely synthetic test data',
        'Pruning — remove sensitive fields from real records',
        'Concealing — hide the records from the dev environment',
      ],
      correctIndex: 1,
      explanation:
        'Fabrication creates entirely synthetic data that looks realistic but contains no actual customer information. This is ideal for testing because it provides realistic data patterns without any privacy risk. Trimming still exposes partial real data. Pruning leaves gaps that may not test properly. Concealing doesn\'t provide test data at all.',
      memoryHack:
        'Magician\'s Misdirection: Need test data? Fabricate it — create decoy cards that look real but aren\'t. No real data = no privacy risk = no regulatory problems.',
      conceptName: 'Information Obfuscation Methods',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — DLP Types and Mechanics (Janet, "Airport Luggage Scanner")
    // ================================================================

    // 4-1. Janet introduces DLP
    {
      type: 'dialogue',
      id: 'd2a2s4-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Now let\'s talk about how the data LEFT the building in the first place. Data Loss Prevention — DLP — should have caught this. I think of DLP as an "Airport Luggage Scanner." It scans everything leaving the building, looking for items that shouldn\'t be in the baggage.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // 4-2. Janet explains DLP types
    {
      type: 'dialogue',
      id: 'd2a2s4-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'There are three types of DLP scanners. Network DLP sits at the edge — like the luggage scanner at the departure gate. It scans all outbound traffic. Endpoint DLP sits on every device — like a personal bag check before you even get to the gate. It monitors files on systems, USB transfers, and print jobs. Cloud DLP is the newest — like a scanner at the private aviation terminal, purpose-built for cloud services.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4-3. Evidence — DLP failure analysis
    {
      type: 'evidence',
      id: 'd2a2s4-evidence-1',
      title: 'DLP Failure Analysis — The Data Vault',
      classification: 'CLASSIFIED',
      content:
        'The Data Vault had Network DLP deployed but no Endpoint DLP. The attacker encrypted files BEFORE copying them to the USB drive, rendering the Network DLP blind to the content.',
      evidenceItems: [
        { label: 'DLP Type Deployed', value: 'Network DLP only (edge scanner)' },
        { label: 'Endpoint DLP', value: 'NOT deployed', highlight: true },
        { label: 'Bypass Method', value: 'Attacker encrypted files before transfer', highlight: true },
        { label: 'Pattern Matching', value: 'Active for SSN, credit card patterns' },
        { label: 'Deep Content Inspection', value: 'Defeated by encryption', highlight: true },
        { label: 'Recommendation', value: 'Deploy Endpoint DLP + enforce encryption policy at the organization level' },
      ],
      speaker: 'janet',
      speakerSide: 'left',
      dialogue:
        'Here is the critical limitation the exam tests: DLP CANNOT scan encrypted data. If the attacker encrypts files before they hit the DLP scanner, the scanner sees only ciphertext — meaningless noise. That\'s why Endpoint DLP is essential: it can inspect files BEFORE they\'re encrypted.',
      leftCharacter: 'janet',
      leftExpression: 'worried',
    },

    // 4-4. Knowledge Check — DLP limitation
    {
      type: 'knowledgeCheck',
      id: 'd2a2s4-kc-1',
      question:
        'An organization deploys Network DLP to monitor all outbound traffic. An insider encrypts sensitive files using a personal encryption tool before emailing them. Which statement is MOST accurate?',
      options: [
        'The Network DLP will detect the sensitive content through deep packet inspection',
        'The Network DLP will flag the email because encryption is suspicious',
        'The Network DLP cannot inspect the encrypted content and will likely allow the transfer',
        'The Network DLP will quarantine all encrypted attachments by default',
      ],
      correctIndex: 2,
      explanation:
        'DLP systems examine unencrypted content using keyword scanning, pattern matching, and deep content inspection. If data is encrypted BEFORE passing through the DLP, the system cannot inspect it and will likely allow the transfer. This is a fundamental limitation — not a malfunction. Endpoint DLP, which inspects files before encryption, would be needed to catch this.',
      memoryHack:
        'Airport Luggage Scanner: DLP is an X-ray machine — it can\'t see through a lead-lined suitcase (encryption). The scanner doesn\'t flag "I can\'t see inside" — it just lets it through. That\'s why you need a bag check BEFORE packing (Endpoint DLP).',
      conceptName: 'DLP Types and Mechanics',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — CASB (Janet, "Cloud Bouncer")
    // ================================================================

    // 5-1. Janet introduces CASB
    {
      type: 'dialogue',
      id: 'd2a2s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The Vault was also using unauthorized cloud services for some data processing — shadow IT. No one in management even knew. That\'s where a CASB comes in. Think of it as a "Cloud Bouncer" — it sits between your users and cloud services, checking IDs and enforcing the house rules.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5-2. Janet explains CASB capabilities
    {
      type: 'dialogue',
      id: 'd2a2s5-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'A CASB does four things: it enforces authentication and authorization policies in the cloud, logs all activity for auditing, monitors for threats and anomalies, and most importantly — it detects shadow IT. When someone in accounting signs up for an unauthorized file-sharing service, the CASB catches it. It can be deployed on-premises or as a cloud service itself.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 5-3. Knowledge Check — CASB
    {
      type: 'knowledgeCheck',
      id: 'd2a2s5-kc-1',
      question:
        'During a security audit, you discover that multiple departments are using unauthorized cloud storage services to share files externally. Which technology would BEST help detect and manage this shadow IT problem going forward?',
      options: [
        'Network DLP deployed at the perimeter',
        'A Cloud Access Security Broker (CASB)',
        'Full disk encryption on all endpoints',
        'A next-generation firewall with application awareness',
      ],
      correctIndex: 1,
      explanation:
        'A CASB is specifically designed to sit between users and cloud services, enforcing organizational security policies and detecting shadow IT (unauthorized cloud service usage). While a next-gen firewall can identify some cloud traffic, a CASB provides granular visibility and policy enforcement specific to cloud services. DLP and encryption don\'t address the shadow IT discovery problem.',
      memoryHack:
        'Cloud Bouncer: Shadow IT = people sneaking into the club through the back door. The bouncer (CASB) sees ALL entrances — front, back, side. It logs who goes where and blocks unauthorized venues.',
      conceptName: 'CASB',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Data Remanence Deep Dive (Janet, "Whiteboard Ghost Writing")
    // ================================================================

    // 6-1. Janet introduces remanence
    {
      type: 'dialogue',
      id: 'd2a2s6-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Here\'s a finding that concerns me, {player}. Some of the decommissioned storage arrays from the Vault were resold on the secondary market — and forensic analysis shows data remnants were still recoverable. I call this "Whiteboard Ghost Writing." Ever erase a whiteboard and still see the faint outline of what was written? That\'s data remanence.',
      leftCharacter: 'janet',
      leftExpression: 'worried',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 6-2. Janet explains technical details
    {
      type: 'dialogue',
      id: 'd2a2s6-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Three causes of remanence. First: residual magnetic flux on hard drives — the magnetic patterns that represent data leave traces even after overwriting. Second: slack space — the unused portion of a disk cluster after a file is stored, which may contain remnants of old data. Third, and most problematic for SSDs: wear-leveling. SSDs move data around internally to extend drive life, which means some cells retain old data that standard overwrite tools can\'t reach.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6-3. Knowledge Check — Data Remanence
    {
      type: 'knowledgeCheck',
      id: 'd2a2s6-kc-1',
      question:
        'Why is standard overwriting considered LESS reliable for sanitizing SSDs compared to traditional hard drives?',
      options: [
        'SSDs are immune to magnetic fields',
        'SSDs use wear-leveling, which may preserve data in cells not addressable by standard overwrite tools',
        'SSDs have faster write speeds that bypass the overwrite process',
        'SSDs use a different file system that prevents overwriting',
      ],
      correctIndex: 1,
      explanation:
        'SSD wear-leveling algorithms redistribute writes across cells to extend the drive\'s lifespan. This means the controller may redirect writes away from cells containing old data, leaving those cells with recoverable remnants that standard overwrite tools cannot reach. This is why physical destruction is preferred for SSDs containing sensitive data.',
      memoryHack:
        'Whiteboard Ghost Writing: An SSD is like a whiteboard where someone keeps moving your writing to different sections to preserve the surface — you might erase one spot, but the original text got copied to a hidden corner you can\'t reach.',
      conceptName: 'Data Remanence',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Scoping and Tailoring (Reeves, "Tailored Suit vs Off-the-Rack")
    //           Cross-reference to D1
    // ================================================================

    // 7-1. Reeves introduces scoping and tailoring in D2 context
    {
      type: 'dialogue',
      id: 'd2a2s7-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Remember scoping and tailoring from HQ, {player}? The "Tailored Suit vs Off-the-Rack" concept from Domain 1. It applies directly here at the Data Vault — and their failure to tailor their security baselines is part of why we\'re standing in a crime scene.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7-2. Reeves explains in asset security context
    {
      type: 'dialogue',
      id: 'd2a2s7-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Quick refresh: Scoping selects which controls from a baseline apply to your system — like picking which suits to try on. Tailoring modifies those controls to fit your organization — like getting them altered. Scoping is part of the tailoring process. The exam tests this distinction precisely. The Vault applied an off-the-rack baseline meant for moderate-impact systems to their TOP SECRET storage arrays. They never scoped or tailored. The controls were inadequate for the actual risk level.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7-3. Knowledge Check — Scoping vs Tailoring
    {
      type: 'knowledgeCheck',
      id: 'd2a2s7-kc-1',
      question:
        'An organization reviews the NIST SP 800-53 moderate-impact baseline and determines that wireless security controls do not apply because the system has no wireless components. This process of removing inapplicable controls is called:',
      options: [
        'Tailoring',
        'Scoping',
        'Risk acceptance',
        'Control optimization',
      ],
      correctIndex: 1,
      explanation:
        'Scoping is the process of removing controls from a baseline that do not apply to the specific system. Removing wireless controls from a system with no wireless components is scoping — determining applicability. Tailoring, which includes scoping, goes further to MODIFY remaining controls to fit the organization. The exam uses these terms precisely.',
      memoryHack:
        'Tailored Suit: Scoping = picking suits off the rack (which ones even fit?). Tailoring = altering the suit to your measurements (customizing the fit). You scope first, THEN tailor. They removed irrelevant controls (scoping), not modified existing ones (tailoring).',
      conceptName: 'Scoping and Tailoring',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Security Baselines + Standards Selection
    //           (Reeves, "Building Code Tiers" + "Recipe Book Matching")
    // ================================================================

    // 8-1. Reeves introduces baselines
    {
      type: 'dialogue',
      id: 'd2a2s8-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Scoping and tailoring start from a baseline — the minimum security standard. Think of baselines as "Building Code Tiers." A one-story house has basic code requirements. A ten-story office building has stricter codes. A hospital has the strictest of all. NIST SP 800-53B defines three tiers: Low-Impact, Moderate-Impact, and High-Impact baselines, plus a Privacy Control baseline.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8-2. Reeves on standards selection
    {
      type: 'dialogue',
      id: 'd2a2s8-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And choosing the RIGHT baseline is "Recipe Book Matching." You pick the recipe book that matches what you\'re cooking. Processing credit cards? PCI DSS is your recipe book. Handling EU personal data? GDPR. Managing a government system? NIST SP 800-53. Some organizations voluntarily adopt standards like the NIST 800 series even when not required — because well-designed community standards raise the bar for everyone.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8-3. Think Like a Manager — Baseline selection
    {
      type: 'thinkLikeManager',
      id: 'd2a2s8-tlatm-1',
      scenario:
        'The Data Vault processes both moderate-impact commercial data and high-impact government classified data on the same storage arrays. The operations team has applied the NIST SP 800-53B moderate-impact baseline to all systems to reduce cost.',
      question: 'As the security manager, what is your primary concern?',
      options: [
        'The cost savings justify using the moderate baseline',
        'The baseline must match the HIGHEST impact level of data processed — high-impact controls are required',
        'Two separate baselines should be applied to the same storage arrays simultaneously',
        'The NIST framework does not apply to commercial data',
      ],
      correctIndex: 1,
      explanation:
        'Just as hardware inherits the classification of the highest data it processes, the security baseline must match the highest impact level. A system processing both moderate and high-impact data must apply the high-impact baseline. Cost savings do not justify under-protecting classified data.',
      managerInsight:
        'Think risk, not budget. The cost of applying a stronger baseline is a rounding error compared to the cost of a breach involving high-impact government data. A manager protects based on the worst-case scenario, not the average case.',
      conceptName: 'Security Baselines',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 9 — Data Privacy Officer (Reeves, "Privacy Ombudsman")
    // ================================================================

    // 9-1. Reeves introduces the DPO
    {
      type: 'dialogue',
      id: 'd2a2s9-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'One more governance role to cover, {player}. Under GDPR, covered organizations must appoint a Data Privacy Officer — a DPO. Think of them as a "Privacy Ombudsman." They\'re independent, they report directly to the highest level of management, and their job is to be the organization\'s privacy conscience.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Reeves explains DPO responsibilities
    {
      type: 'dialogue',
      id: 'd2a2s9-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The DPO advises on GDPR compliance, monitors data protection activities, serves as a contact point for data subjects and supervisory authorities, and conducts Data Protection Impact Assessments. Unlike the compliance officer we discussed yesterday — who is an internal role — the DPO is specifically mandated by GDPR and has a degree of independence. They cannot be penalized for performing their duties.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-3. Knowledge Check — DPO
    {
      type: 'knowledgeCheck',
      id: 'd2a2s9-kc-1',
      question:
        'Under GDPR, the Data Protection Officer (DPO) must report to:',
      options: [
        'The IT department head',
        'The Chief Information Security Officer',
        'The highest level of management',
        'The national data protection authority',
      ],
      correctIndex: 2,
      explanation:
        'GDPR requires the DPO to report directly to the highest level of management (board of directors or equivalent). This ensures independence and prevents the DPO\'s concerns from being filtered or suppressed by middle management. The DPO also serves as a contact for data protection authorities, but reports INTERNALLY to top management.',
      memoryHack:
        'Privacy Ombudsman: The DPO is like an ombudsman — independent, protected, and reports directly to the top. No middlemen. If the DPO reports to IT, IT can suppress privacy concerns that conflict with operational goals.',
      conceptName: 'Data Privacy Officer',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Act 2 Wrap-up / Debrief
    // ================================================================

    // 10-1. Transition
    {
      type: 'transition',
      id: 'd2a2s10-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Operations Center',
      animation: 'fade',
      timeSkipText: 'End of Day 2',
    },

    // 10-2. Morales delivers a warning
    {
      type: 'dialogue',
      id: 'd2a2s10-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Bad news, team. The attacker just posted a sample of the stolen data on an underground forum. They\'re threatening to release everything in 72 hours unless a ransom is paid. This just became a legal crisis on top of a security crisis.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 10-3. Janet teases Act 4
    {
      type: 'dialogue',
      id: 'd2a2s10-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'We need to understand the full scope of what they have. That means diving into encryption methods, digital rights management, e-discovery procedures, and data sovereignty laws. {player}, this is about to get a lot more complex.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },
  ],
};
