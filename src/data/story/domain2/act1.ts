import { ActDefinition } from '@/lib/story-types';

export const domain2Act1: ActDefinition = {
  actNumber: 1,
  title: 'The Briefing',
  description:
    'A classified data storage facility has been breached. Learn Data Classification, Ownership Roles, Data States, Data Lifecycle, Privacy, Retention, and Destruction methods.',
  xpReward: 250,
  conceptsCovered: [
    'Data Classification',
    'Classification vs Categorization',
    'Labeling and Marking',
    'Data Ownership Roles',
    'Data States',
    'Data Protection Controls per State',
    'Data Lifecycle',
    'Privacy Principles',
    'Data Collection Limitation',
    'Compliance Officer Role',
    'Retention Policies',
    'Destruction Methods',
  ],
  estimatedMinutes: 22,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Setup: Arrival at The Data Vault
    // ================================================================

    // 1-1. Transition — arrive at Data Vault facility
    {
      type: 'transition',
      id: 'd2a1s1-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Secure Storage Facility, New Jersey',
      animation: 'fade',
    },

    // 1-2. Reeves introduces the new mission
    {
      type: 'dialogue',
      id: 'd2a1s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Welcome to The Data Vault, {player}. This facility stores classified assets for twelve federal agencies and four Fortune 100 companies. Forty-eight hours ago, someone walked out the front door with terabytes of their most sensitive data.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-3. Player responds
    {
      type: 'dialogue',
      id: 'd2a1s1-dialogue-2',
      speaker: 'player',
      speakerSide: 'right',
      text: 'Walked out the front door? How is that possible at a facility like this?',
      rightCharacter: 'player',
      rightExpression: 'surprised',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-4. Reeves explains the failure
    {
      type: 'dialogue',
      id: 'd2a1s1-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Because the data wasn\'t properly classified. An insider copied files from multiple vaults onto an unencrypted drive, and the system treated it all as low-sensitivity material. No alerts, no blocks, no flags. This is an asset security failure from top to bottom.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 1-5. Evidence — Breach Summary
    {
      type: 'evidence',
      id: 'd2a1s1-evidence-1',
      title: 'DATA VAULT — Breach Incident Report',
      classification: 'TOP SECRET',
      content:
        'An authorized employee exploited classification gaps to exfiltrate sensitive data. The facility\'s classification system failed to properly tag migrated assets, leaving Top Secret material accessible through standard clearance channels.',
      evidenceItems: [
        { label: 'Incident Code', value: 'VAULT-BREACH-002', highlight: true },
        { label: 'Detection Delay', value: '48 hours post-exfiltration' },
        { label: 'Attack Vector', value: 'Insider with standard clearance', highlight: true },
        { label: 'Data Exfiltrated', value: '2.4 TB across 47,000 files' },
        { label: 'Classification Failure', value: 'Migrated assets lost classification labels', highlight: true },
        { label: 'Agencies Affected', value: '12 federal, 4 commercial', highlight: true },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'Read this carefully. Every failure you see here traces back to one root cause: they didn\'t understand asset security. That\'s what Domain 2 is about — classifying, protecting, and managing data throughout its entire life.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 2 — Data Classification + Classification vs Categorization
    //           (Reeves "Filing Cabinet Color Codes" + Kai "Ranking vs Sorting")
    // ================================================================

    // 2-1. Reeves introduces classification
    {
      type: 'dialogue',
      id: 'd2a1s2-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The first question in asset security is always: how sensitive is this data? Classification is the answer. I think of it like a "Filing Cabinet Color Code" system. Every piece of data gets a color — and that color determines everything: who can touch it, where it\'s stored, and how it\'s destroyed.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2-2. Interactive Image — Government vs Business Classification
    {
      type: 'interactiveImage',
      id: 'd2a1s2-interactive-1',
      title: 'Filing Cabinet Color Codes — Classification Levels',
      imageType: 'comparison',
      backgroundGradient:
        'linear-gradient(135deg, #0c0a09 0%, #1a1520 40%, #0c0a09 100%)',
      conceptName: 'Data Classification',
      speaker: 'reeves',
      dialogue:
        'Click each level to compare government and commercial classification systems. Notice how they mirror each other.',
      completionDialogue:
        'Now you see the parallel. Government and commercial systems use different names but the same logic: protect data proportional to the damage its exposure would cause. At The Data Vault, the migration stripped those color codes — and everything defaulted to the lowest level.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      hotspots: [
        {
          id: 'class-top',
          label: 'TOP SECRET / Confidential-Proprietary',
          x: 10,
          y: 15,
          width: 80,
          height: 15,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue:
            'Government: TOP SECRET — disclosure causes "exceptionally grave damage" to national security. Commercial: Confidential/Proprietary — trade secrets, merger plans, source code. The highest classification. At the Vault, nuclear facility blueprints were in this tier.',
          detail:
            'Top Secret requires the strictest controls: dedicated storage, need-to-know access, and destruction by physical means only. Commercial equivalent protects competitive advantage.',
        },
        {
          id: 'class-secret',
          label: 'SECRET / Private',
          x: 10,
          y: 33,
          width: 80,
          height: 15,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue:
            'Government: SECRET — "serious damage" to national security. Commercial: Private — employee records, salary data, internal financial reports. The insider copied files from this tier because the labels were missing after migration.',
          detail:
            'Secret/Private data requires strong controls but less restrictive handling than Top Secret. Most organizational breaches involve data at this level.',
        },
        {
          id: 'class-conf',
          label: 'CONFIDENTIAL / Sensitive',
          x: 10,
          y: 51,
          width: 80,
          height: 15,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue:
            'Government: CONFIDENTIAL — "damage" to national security. Commercial: Sensitive — internal memos, project plans, non-public operational data. Important but not catastrophic if exposed.',
          detail:
            'Confidential/Sensitive is the baseline for data that needs protection beyond public access but doesn\'t warrant maximum security investment.',
        },
        {
          id: 'class-unclass',
          label: 'UNCLASSIFIED / Public',
          x: 10,
          y: 69,
          width: 80,
          height: 15,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue:
            'Government: UNCLASSIFIED — no damage to national security. But watch out — Unclassified has subcategories: FOUO, SBU, and CUI. These aren\'t public! Commercial: Public — press releases, published reports, marketing materials.',
          detail:
            'FOUO = For Official Use Only, SBU = Sensitive But Unclassified, CUI = Controlled Unclassified Information. The exam loves testing that "Unclassified" doesn\'t always mean "public."',
        },
      ],
    },

    // 2-3. Kai introduces Classification vs Categorization
    {
      type: 'dialogue',
      id: 'd2a1s2-dialogue-2',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Quick distinction that trips people up, {player}. Classification and categorization sound similar, but they\'re different. I think of it as "Ranking vs Sorting." Classification is ranking — putting data on a sensitivity ladder from top to bottom. Categorization is sorting — putting data into buckets like "financial," "health," or "personnel." You can sort without ranking, but you can\'t protect without ranking.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // 2-4. Knowledge Check — Classification
    {
      type: 'knowledgeCheck',
      id: 'd2a1s2-kc-1',
      question:
        'During a system migration, all data labels are accidentally stripped. A junior analyst finds a document marked "FOUO" in a backup. How should this document be treated?',
      options: [
        'As public information since it is Unclassified',
        'As sensitive information requiring restricted access',
        'As Top Secret until the original classification is verified',
        'As Confidential by default until relabeled',
      ],
      correctIndex: 1,
      explanation:
        'FOUO (For Official Use Only) is a subcategory of Unclassified that still requires restricted access. It is NOT public information. The exam tests that "Unclassified" has protected subcategories including FOUO, SBU, and CUI. Option A is the classic trap — treating all Unclassified data as public.',
      memoryHack:
        'Filing Cabinet Color Codes: Unclassified ≠ Public! FOUO, SBU, and CUI are like manila folders in the "unclassified" cabinet — still locked away, just not in the vault.',
      conceptName: 'Data Classification',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 2-5. Knowledge Check — Classification vs Categorization
    {
      type: 'knowledgeCheck',
      id: 'd2a1s2-kc-2',
      question:
        'An organization groups its data into "Financial," "HR," and "Engineering" buckets. A separate process assigns each record a sensitivity level of Public, Internal, or Restricted. Which statement is MOST accurate?',
      options: [
        'Both processes are classification',
        'Grouping into buckets is classification; assigning sensitivity is categorization',
        'Grouping into buckets is categorization; assigning sensitivity is classification',
        'Both processes are categorization',
      ],
      correctIndex: 2,
      explanation:
        'Categorization sorts data into predefined groups (Financial, HR, Engineering). Classification assigns hierarchical sensitivity levels (Public, Internal, Restricted). The exam tests this distinction precisely — categorization is horizontal sorting, classification is vertical ranking.',
      memoryHack:
        'Ranking vs Sorting: Categorization = sorting socks by color (horizontal buckets). Classification = ranking students by grade (vertical levels). You need BOTH to know what protection to apply.',
      conceptName: 'Classification vs Categorization',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — Labeling and Marking (Morales, "Barcode vs Sticker")
    // ================================================================

    // 3-1. Morales introduces the concept
    {
      type: 'dialogue',
      id: 'd2a1s3-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Morales here. Classification only works if people and systems can SEE it, {player}. That\'s where labeling and marking come in. Think of it as "Barcode vs Sticker." Labeling is the barcode — machine-readable metadata that systems use to enforce policies. Marking is the sticker — human-readable labels like "TOP SECRET" stamped on the cover page.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 3-2. Morales explains the Vault failure
    {
      type: 'dialogue',
      id: 'd2a1s3-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'At this facility, the migration tool stripped the barcodes — the electronic labels and metadata. The physical stickers on the server racks still said "Top Secret," but the DLP system couldn\'t see them. Without machine-readable labels, automated controls are blind. And here\'s a best practice the exam loves: you should label even UNCLASSIFIED media. If only classified media is labeled, then an unlabeled drive could be assumed unclassified when it actually contains sensitive data that was accidentally left unmarked.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 3-3. Visual Aid — Labeling vs Marking
    {
      type: 'visualAid',
      id: 'd2a1s3-visual-1',
      title: 'Barcode vs Sticker — Labeling and Marking',
      aidType: 'comparison',
      headers: ['Labeling (Barcode)', 'Marking (Sticker)'],
      rows: [
        ['System-readable', 'Human-readable'],
        ['Metadata tags, electronic labels, digital signatures', 'Watermarks, headers/footers, physical labels, cover pages'],
        ['DLP systems, access controls, automated workflows', 'Humans, visual inspection, physical security'],
        ['Desktop backgrounds indicating classification level', 'Color-coded folder covers or border markings'],
      ],
      speaker: 'morales',
      dialogue:
        'Both are required for a complete classification system. Labels feed the machines, markings inform the humans. Lose either one and you have a gap — like what happened here.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 3-4. Knowledge Check — Labeling and Marking
    {
      type: 'knowledgeCheck',
      id: 'd2a1s3-kc-1',
      question:
        'A Data Loss Prevention system fails to block the transfer of classified files to an external USB drive. Investigation reveals the files contain sensitive data but have no metadata tags. What is the MOST likely root cause?',
      options: [
        'The DLP system is malfunctioning',
        'The files were not properly labeled with machine-readable classification metadata',
        'The USB drive was encrypted and bypassed the DLP',
        'The files were properly marked but not classified',
      ],
      correctIndex: 1,
      explanation:
        'DLP systems rely on machine-readable labels (metadata) to identify and enforce classification policies. Without proper labeling, the DLP system has nothing to scan against. The files may have had physical markings (stickers, headers) but those are human-readable — the DLP cannot see them. This is exactly what happened at The Data Vault.',
      memoryHack:
        'Barcode vs Sticker: DLP reads barcodes (labels), not stickers (markings). No barcode = invisible to automated systems. Always check BOTH channels of classification visibility.',
      conceptName: 'Labeling and Marking',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Data Ownership Roles (Reeves, "Library Card System")
    // ================================================================

    // 4-1. Reeves introduces data roles
    {
      type: 'dialogue',
      id: 'd2a1s4-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Now we need to figure out who dropped the ball. In asset security, every piece of data has people responsible for it — and the CISSP exam tests these roles relentlessly. I call it the "Library Card System." Every library has a director, librarians, and patrons — and each has a very different job.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4-2. Visual Aid — Data Roles
    {
      type: 'visualAid',
      id: 'd2a1s4-visual-1',
      title: 'Library Card System — Data Ownership Roles',
      aidType: 'list',
      items: [
        {
          label: 'Data Owner = Library Director',
          description:
            'Senior executive who classifies data, approves access, and is ultimately ACCOUNTABLE. The owner does NOT do backups — that\'s delegated. Remember from Domain 1: accountability can\'t be delegated. The library director decides which books go in the restricted section.',
        },
        {
          label: 'Data Controller = Collection Policy Maker (GDPR)',
          description:
            'Determines WHAT personal data is collected and WHY. Decides the purpose and means of processing. The library director who decides which patron information to collect on the library card application.',
        },
        {
          label: 'Data Processor = Card Printing Service (GDPR)',
          description:
            'Processes data ONLY as directed by the controller. Cannot use data for other purposes. Like the company that prints library cards — they see patron names but can\'t use that data for marketing.',
        },
        {
          label: 'Data Custodian = Head Librarian',
          description:
            'Day-to-day technical management: backups, restores, access control implementation, storage management. Follows the owner\'s instructions. Does NOT decide classification — implements it.',
        },
        {
          label: 'Data Steward = Catalog Manager',
          description:
            'Ensures data accuracy, reliability, and quality. Business-focused. Makes sure the card catalog is correct and books are in the right sections. Different from custodian — steward cares about data CONTENT, custodian cares about data INFRASTRUCTURE.',
        },
        {
          label: 'Data Subject = Library Patron (GDPR)',
          description:
            'The individual whose personal data is being collected and processed. Has rights under GDPR including access, correction, and erasure. The person who filled out the library card application.',
        },
      ],
      speaker: 'reeves',
      dialogue:
        'At The Data Vault, the data OWNER authorized the migration but the CUSTODIAN executed it without verifying that classification labels transferred correctly. The owner is still accountable — remember the Captain and Crew principle from HQ? Accountability doesn\'t transfer just because you delegate the task.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 4-3. Knowledge Check — Data Roles (Owner vs Custodian trap)
    {
      type: 'knowledgeCheck',
      id: 'd2a1s4-kc-1',
      question:
        'A database administrator performs nightly backups, manages storage capacity, and implements access control lists as directed by the department head. Which data role does the administrator BEST represent?',
      options: [
        'Data Owner',
        'Data Custodian',
        'Data Controller',
        'Data Steward',
      ],
      correctIndex: 1,
      explanation:
        'The Data Custodian handles day-to-day technical management — backups, storage, and access control implementation. The key phrase is "as directed by the department head" (the owner). The custodian does NOT decide what to classify or who gets access — they implement those decisions. This is the #1 exam trap in Domain 2: confusing the owner with the custodian.',
      memoryHack:
        'Library Card System: Owner = Director (decides policy, accountable), Custodian = Librarian (implements policy, day-to-day). If the question says "backups" or "implements" — that\'s the custodian. If it says "classifies" or "approves" — that\'s the owner.',
      conceptName: 'Data Ownership Roles',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 4-4. Knowledge Check — Controller vs Processor
    {
      type: 'knowledgeCheck',
      id: 'd2a1s4-kc-2',
      question:
        'A healthcare company outsources payroll processing to a third-party service. Under GDPR, which role does the payroll service fulfill?',
      options: [
        'Data Owner',
        'Data Controller',
        'Data Processor',
        'Data Steward',
      ],
      correctIndex: 2,
      explanation:
        'The payroll service is a Data Processor — it processes employee data on behalf of the healthcare company (the controller). The processor acts ONLY on the controller\'s instructions and cannot use the data for its own purposes. The healthcare company decides WHAT data to collect and WHY — making them the controller.',
      memoryHack:
        'Library Card System: Controller = decides what to collect (the company). Processor = handles the data as instructed (the outsourced service). Ask: "Who decides WHAT and WHY?" That\'s the controller.',
      conceptName: 'Data Ownership Roles',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — Data States (Kai, "Water in Three Forms")
    // ================================================================

    // 5-1. Kai introduces data states
    {
      type: 'dialogue',
      id: 'd2a1s5-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'OK {player}, we know the data wasn\'t classified properly. But HOW was it vulnerable? That depends on what STATE the data was in when the attacker grabbed it. I think of data states like "Water in Three Forms" — ice, liquid, and steam. Same substance, but each form has completely different vulnerabilities and needs different protection.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // 5-2. Visual Aid — Three Data States
    {
      type: 'visualAid',
      id: 'd2a1s5-visual-1',
      title: 'Water in Three Forms — Data States',
      aidType: 'list',
      items: [
        {
          label: 'Data at Rest = Ice (stored, solid, stationary)',
          description:
            'Data sitting on a hard drive, SSD, tape, database, or spreadsheet. Like ice in a freezer — it\'s not going anywhere. Threats: theft, unauthorized access, copying. IMPORTANT exam trap: a backup tape being physically transported is STILL data at rest — not data in transit. Data in transit means data traversing a NETWORK.',
        },
        {
          label: 'Data in Transit = Liquid (flowing through pipes)',
          description:
            'Data moving across a network — email, file transfers, API calls, streaming. Like water flowing through pipes. Threats: interception, eavesdropping, man-in-the-middle attacks. The data flowing through the network is what the pipes (encryption protocols) need to protect.',
        },
        {
          label: 'Data in Use = Steam (active, volatile, hard to contain)',
          description:
            'Data loaded into memory and being processed by a CPU. Like steam — hot, volatile, and hard to contain. Threats: screen capture, shoulder surfing, memory scraping, clipboard attacks. The hardest state to protect because the data must be accessible to the processor.',
        },
      ],
      speaker: 'kai',
      dialogue:
        'At The Data Vault, the attacker targeted data at rest — files on storage arrays. But here\'s what most people miss: the data was also vulnerable in transit during the migration (flowing between systems with stripped labels) and in use (loaded into the migration tool\'s memory without access controls).',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // 5-3. Knowledge Check — Data States (backup tape trap)
    {
      type: 'knowledgeCheck',
      id: 'd2a1s5-kc-1',
      question:
        'A courier is physically transporting backup tapes from the primary data center to an offsite storage facility. What state is the data on those tapes in?',
      options: [
        'Data in Transit',
        'Data at Rest',
        'Data in Use',
        'Data in Motion',
      ],
      correctIndex: 1,
      explanation:
        'The data is at REST. This is a classic CISSP exam trap. "Data in Transit" (also called "Data in Motion") refers specifically to data traversing a NETWORK. A backup tape being physically carried is still stored on media — it\'s data at rest, just like ice being moved from one freezer to another. The ice doesn\'t become liquid just because the truck is moving.',
      memoryHack:
        'Water in Three Forms: At Rest = Ice. Moving ice in a truck doesn\'t melt it — it\'s still ice. Data on a tape in a van is still at rest. "In Transit" = flowing through NETWORK pipes only.',
      conceptName: 'Data States',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Data Protection Controls per State
    //           (Janet, "Armor for Every Occasion")
    // ================================================================

    // 6-1. Janet introduces state-specific protections
    {
      type: 'dialogue',
      id: 'd2a1s6-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Janet here. Kai just showed you the three states — now I\'ll show you the protection for each one. I call it "Armor for Every Occasion." You wouldn\'t wear a snowsuit to the beach, and you wouldn\'t wear swim trunks to the Arctic. Each data state needs the right armor.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // 6-2. Visual Aid — Protection per state
    {
      type: 'visualAid',
      id: 'd2a1s6-visual-1',
      title: 'Armor for Every Occasion — Protection Controls per Data State',
      aidType: 'table',
      headers: ['Data State', 'Primary Threats', 'Key Protections'],
      rows: [
        [
          'At Rest (Ice)',
          'Theft, unauthorized access, copying',
          'Symmetric encryption (AES-256), full disk encryption (BitLocker), access controls, backups, column-level database encryption',
        ],
        [
          'In Transit (Liquid)',
          'Interception, eavesdropping, MITM',
          'TLS/SSL, VPN, end-to-end encryption, link encryption, IPsec',
        ],
        [
          'In Use (Steam)',
          'Screen capture, shoulder surfing, memory scraping',
          'Homomorphic encryption, RBAC, DLP, clean desk policies, privacy screens, memory buffer flushing',
        ],
      ],
      speaker: 'janet',
      dialogue:
        'The Data Vault used AES-256 for data at rest — solid choice. But during the migration, the encryption was temporarily stripped for processing, and the access controls weren\'t reapplied. The attacker hit during that window. Lesson: data must be protected in ALL three states, not just one.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
    },

    // 6-3. Knowledge Check — Protection controls
    {
      type: 'knowledgeCheck',
      id: 'd2a1s6-kc-1',
      question:
        'An organization needs to process encrypted medical records for statistical analysis WITHOUT decrypting them first. Which technology BEST addresses this requirement?',
      options: [
        'Full disk encryption',
        'TLS/SSL',
        'Homomorphic encryption',
        'Data Loss Prevention',
      ],
      correctIndex: 2,
      explanation:
        'Homomorphic encryption allows computations on encrypted data without decrypting it first — protecting data in use. Full disk encryption protects data at rest. TLS protects data in transit. DLP detects and prevents data exfiltration but doesn\'t enable computation on encrypted data.',
      memoryHack:
        'Armor for Every Occasion: Homomorphic = the steam armor. It lets you work with hot data without getting burned. Only technology that protects data IN USE during processing.',
      conceptName: 'Data Protection Controls per State',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Data Lifecycle (Reeves, "Document Birth-to-Shredder")
    // ================================================================

    // 7-1. Reeves introduces the lifecycle
    {
      type: 'dialogue',
      id: 'd2a1s7-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Now let\'s zoom out and look at the big picture, {player}. Every piece of data has a life — from the moment it\'s born to the moment it\'s shredded. I call it "Document Birth-to-Shredder." Six stages, and classification can change at ANY point along the way.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7-2. Visual Aid — Data Lifecycle
    {
      type: 'visualAid',
      id: 'd2a1s7-visual-1',
      title: 'Document Birth-to-Shredder — Data Lifecycle',
      aidType: 'list',
      items: [
        {
          label: '1. Create / Collect',
          description:
            'Data is born or acquired. Apply initial classification IMMEDIATELY. Don\'t wait — an unclassified document in the wild is a ticking time bomb. At The Data Vault, newly ingested data sat unclassified for up to 72 hours.',
        },
        {
          label: '2. Store',
          description:
            'Place data on media with controls matching its classification. Encrypt at rest. Apply access controls. The storage medium inherits the classification of the HIGHEST data it holds — a drive with one Top Secret file is a Top Secret drive.',
        },
        {
          label: '3. Use',
          description:
            'Data is actively processed. Apply RBAC, DLP, clean desk policies, privacy screens. Flush memory buffers after use. This is the most vulnerable stage — the data must be accessible to be useful.',
        },
        {
          label: '4. Share',
          description:
            'Transmit internally or externally. Encrypt in transit. Enforce need-to-know. Apply DLP to outbound data flows. Verify the recipient has appropriate clearance for the classification level.',
        },
        {
          label: '5. Archive',
          description:
            'Move inactive data to long-term storage. Maintain classification level. Consider media longevity — will the format be readable in 50 years? 150 years? Archive does NOT mean the data is safe to forget about.',
        },
        {
          label: '6. Destroy',
          description:
            'Sanitize or destroy media when data reaches end of retention. Method depends on sensitivity. Verify destruction. Document the process. This is where we\'ll talk about shredder grades later.',
        },
      ],
      speaker: 'reeves',
      dialogue:
        'The critical insight: classification can change at ANY point. A public quarterly report becomes Confidential before it\'s published. A Secret document may be declassified after 25 years. The lifecycle never stops demanding attention.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 7-3. Knowledge Check — Data Lifecycle
    {
      type: 'knowledgeCheck',
      id: 'd2a1s7-kc-1',
      question:
        'A server stores both Sensitive and Top Secret files. What classification level should be assigned to the server itself?',
      options: [
        'Sensitive, since most files are at that level',
        'Top Secret, matching the highest data it processes',
        'A custom level between Sensitive and Top Secret',
        'Unclassified, since the server itself is not data',
      ],
      correctIndex: 1,
      explanation:
        'Hardware and media inherit the classification of the HIGHEST level of data they contain or process. Even if only one file on the server is Top Secret, the entire server must be treated as Top Secret. This prevents accidental exposure through less rigorous handling of the hardware itself.',
      memoryHack:
        'Birth-to-Shredder: A container is only as safe as its most sensitive contents. One drop of poison in a water tank contaminates the whole tank. One Top Secret file on a server makes it a Top Secret server.',
      conceptName: 'Data Lifecycle',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Privacy Principles + Data Collection Limitation
    //           (Reeves, "Privacy Fence Rules" + "Grocery List Discipline")
    // ================================================================

    // 8-1. Reeves introduces privacy principles
    {
      type: 'dialogue',
      id: 'd2a1s8-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The Data Vault stored personal data for thousands of individuals — government employees, contractors, citizens. That makes privacy a central concern. I think of privacy principles like "Privacy Fence Rules" — every homeowner has certain rights about what happens on their property, and their neighbors have obligations to respect those boundaries.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8-2. Evidence — Privacy principles from the breach context
    {
      type: 'evidence',
      id: 'd2a1s8-evidence-1',
      title: 'Privacy Principles Overview — "Privacy Fence Rules"',
      classification: 'UNCLASSIFIED',
      content:
        'Privacy principles govern how organizations collect, use, store, and share personal data. These principles form the foundation of every major privacy regulation worldwide — GDPR, HIPAA, CCPA, and more.',
      evidenceItems: [
        {
          label: 'Purpose Limitation',
          value: 'Collect data only for the stated purpose. Don\'t repurpose without consent.',
          highlight: true,
        },
        {
          label: 'Data Minimization',
          value: 'Collect ONLY what you need — nothing more. Reduces breach exposure.',
        },
        {
          label: 'Consent',
          value: 'Individuals must agree to data collection. Informed, specific, freely given.',
        },
        {
          label: 'Accuracy',
          value: 'Keep personal data accurate and up to date. Provide correction mechanisms.',
        },
        {
          label: 'Storage Limitation',
          value: 'Don\'t keep data longer than necessary. Dispose when purpose is fulfilled.',
          highlight: true,
        },
        {
          label: 'Individual Rights',
          value: 'Access, correction, deletion (right to be forgotten), portability under GDPR.',
        },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'The Data Vault was collecting biometric data from visitors "just in case" — no stated purpose, no consent forms. That\'s a privacy fence violation. Under GDPR alone, that could mean fines up to 4% of global annual revenue or 20 million euros, whichever is higher.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 8-3. Reeves on Data Collection Limitation
    {
      type: 'dialogue',
      id: 'd2a1s8-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'This connects to what I call "Grocery List Discipline." When you go to the store, you buy what\'s on the list — not everything that looks interesting. Data collection works the same way. Define what you need BEFORE you collect, and don\'t grab extra "just in case." Every extra piece of data you collect is another thing that can be stolen, another thing you must protect, and another thing a regulator can fine you for mishandling.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8-4. Knowledge Check — Privacy Principles
    {
      type: 'knowledgeCheck',
      id: 'd2a1s8-kc-1',
      question:
        'A mobile app collects users\' location data, email addresses, and browsing history, but only uses the email for account authentication. Which privacy principle is MOST directly violated?',
      options: [
        'Consent',
        'Accuracy',
        'Data Minimization',
        'Storage Limitation',
      ],
      correctIndex: 2,
      explanation:
        'Data Minimization requires collecting ONLY the data necessary for the stated purpose. If the app only uses email for authentication, collecting location and browsing history violates minimization. While consent may also be an issue, the MOST direct violation is collecting more data than needed — the "Grocery List Discipline" failure.',
      memoryHack:
        'Grocery List Discipline: If you only need eggs (email), don\'t buy the whole dairy aisle (location + browsing + everything else). Minimization = stick to the list.',
      conceptName: 'Privacy Principles',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Compliance Officer Role (Reeves, "School Principal")
    // ================================================================

    // 9-1. Reeves introduces the compliance role
    {
      type: 'dialogue',
      id: 'd2a1s9-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'All these privacy rules need someone to enforce them, {player}. That\'s the Compliance Officer — think of them as the "School Principal." The principal doesn\'t teach every class, but they make sure every teacher follows the curriculum, every student follows the rules, and the school passes its inspections.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Reeves explains the role in context
    {
      type: 'dialogue',
      id: 'd2a1s9-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The Compliance Officer identifies which laws and regulations apply to the organization, ensures policies align with those requirements, monitors compliance status, and reports to senior leadership. At The Data Vault, the compliance officer flagged the missing classification labels three months ago — but the recommendation was deprioritized. Another governance failure.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 9-3. Knowledge Check — Compliance Officer
    {
      type: 'knowledgeCheck',
      id: 'd2a1s9-kc-1',
      question:
        'The compliance officer identifies that the organization\'s data handling procedures do not meet GDPR requirements and recommends changes. Senior management acknowledges the report but takes no action. Three months later, a breach occurs. Who is ULTIMATELY accountable?',
      options: [
        'The compliance officer for not escalating further',
        'The IT department for failing to implement changes',
        'Senior management for not acting on the compliance report',
        'The data custodian for the breach itself',
      ],
      correctIndex: 2,
      explanation:
        'Senior management is ultimately accountable for data protection decisions. The compliance officer fulfilled their role by identifying and reporting the gap. Management\'s decision to deprioritize the recommendation makes them accountable for the resulting breach. Remember: accountability flows upward and cannot be delegated.',
      memoryHack:
        'School Principal: The principal can\'t blame the hall monitor (compliance officer) for a fire that happened because the principal ignored the fire inspector\'s report. Accountability stays at the top.',
      conceptName: 'Compliance Officer Role',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Retention Policies (Reeves, "Expiration Date Labels")
    // ================================================================

    // 10-1. Reeves introduces retention
    {
      type: 'dialogue',
      id: 'd2a1s10-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Here\'s something most people overlook, {player}: keeping data too LONG is almost as dangerous as not protecting it at all. Retention policies are like "Expiration Date Labels" on food. Keep milk past the date and it\'s a health hazard. Keep data past its retention period and it\'s a legal hazard.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10-2. Reeves explains with the Boeing example
    {
      type: 'dialogue',
      id: 'd2a1s10-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Boeing learned this the hard way. During litigation, they had to restore and review 14,000 email backup tapes — data they should have destroyed years earlier. It cost them a $92.5 million settlement. The lesson: retention policies must specify how long to keep data AND enforce destruction when the time expires. But there\'s one critical exception — if litigation is reasonably anticipated, you MUST stop all destruction immediately. That\'s called a litigation hold.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 10-3. Think Like a Manager — Retention decision
    {
      type: 'thinkLikeManager',
      id: 'd2a1s10-tlatm-1',
      scenario:
        'Your organization has a 90-day email retention policy. The legal department informs you that a former employee is threatening a wrongful termination lawsuit. The automated deletion system is scheduled to purge emails from the relevant period tonight.',
      question: 'What should you do FIRST?',
      options: [
        'Let the automated system run since the policy is already established',
        'Immediately issue a litigation hold to suspend all automated deletion',
        'Back up only the former employee\'s emails before the purge',
        'Extend the retention policy to 180 days for all emails',
      ],
      correctIndex: 1,
      explanation:
        'When litigation is reasonably anticipated, a litigation hold must be issued IMMEDIATELY, suspending all automated deletion processes. Destroying data after becoming aware of potential litigation constitutes spoliation of evidence and carries severe legal penalties. Backing up only one person\'s emails is insufficient — the hold must cover all potentially relevant data.',
      managerInsight:
        'A manager thinks about legal risk, not just technical efficiency. The cost of preserving data temporarily is trivial compared to the cost of a spoliation finding in court. When in doubt, preserve everything and let legal sort it out later.',
      conceptName: 'Retention Policies',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 11 — Destruction Methods (Morales, "Paper Shredder Grades")
    // ================================================================

    // 11-1. Morales introduces destruction
    {
      type: 'dialogue',
      id: 'd2a1s11-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'When data reaches the end of its life, you don\'t just hit "delete" and call it a day, {player}. Deleting a file only removes the directory pointer — the data is still sitting there like a ghost. I think of destruction methods as "Paper Shredder Grades" — from a basic strip-cut shredder all the way up to industrial incineration.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-2. Visual Aid — Sanitization hierarchy
    {
      type: 'visualAid',
      id: 'd2a1s11-visual-1',
      title: 'Paper Shredder Grades — Sanitization Hierarchy (NIST SP 800-88)',
      aidType: 'list',
      items: [
        {
          label: '1. Physical Destruction (Industrial Shredder)',
          description:
            'Incinerate, disintegrate, shred, pulverize, melt. The media ceases to exist. MOST effective. Works on everything. Not reusable. This is the gold standard for Top Secret data.',
        },
        {
          label: '2. Degaussing (Electromagnetic Shredder)',
          description:
            'Strong magnetic field erases magnetic media. Often renders the drive unusable. CRITICAL TRAP: Does NOT work on SSDs, flash drives, or optical media. Only magnetic media like HDDs and tapes.',
        },
        {
          label: '3. Crypto Shredding (Shred the Key, Not the Paper)',
          description:
            'Encrypt data with a strong algorithm, then destroy ALL copies of the encryption key. Data becomes unreadable. Primary option for CLOUD environments where physical destruction isn\'t possible. Effectiveness depends on encryption strength.',
        },
        {
          label: '4. Purging (Cross-Cut Shredder)',
          description:
            'Intensive overwriting repeated multiple times. Data not recoverable by any known method. BUT — government does NOT trust purging for Top Secret data.',
        },
        {
          label: '5. Clearing / Overwriting (Strip-Cut Shredder)',
          description:
            'Writing patterns over the media. Data may be recoverable with advanced forensic techniques. Acceptable for lower classifications only.',
        },
        {
          label: '6. Erasing / Formatting (Throwing Paper in the Trash)',
          description:
            'Simple delete or format. Data is EASILY recoverable. This is NOT sanitization — it\'s just removing the table of contents. The data is still there.',
        },
      ],
      speaker: 'morales',
      dialogue:
        'Remember the hierarchy: Destruction > Degaussing > Crypto Shredding > Purging > Clearing > Erasing. The exam LOVES testing this. And always match the method to the media — degaussing an SSD is like trying to erase a whiteboard with a magnet. It does absolutely nothing.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 11-3. Knowledge Check — Destruction (SSD trap)
    {
      type: 'knowledgeCheck',
      id: 'd2a1s11-kc-1',
      question:
        'An organization is decommissioning SSDs that previously stored Top Secret data. Which sanitization method is MOST appropriate?',
      options: [
        'Degaussing with a Type II degausser',
        'Three-pass overwriting using DoD 5220.22-M',
        'Physical destruction (disintegration)',
        'Factory reset followed by reformatting',
      ],
      correctIndex: 2,
      explanation:
        'Physical destruction is the MOST appropriate method for SSDs containing Top Secret data. Degaussing does NOT work on SSDs (they are not magnetic media). Overwriting is unreliable on SSDs due to wear-leveling, which can leave data in cells that are no longer actively addressed. Factory reset and reformatting are the least effective methods and completely inadequate for Top Secret.',
      memoryHack:
        'Paper Shredder Grades: SSD + Top Secret = Physical Destruction ONLY. Degaussing SSDs is the #2 exam trap in Domain 2. Magnets don\'t work on flash memory. Period.',
      conceptName: 'Destruction Methods',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 11-4. Knowledge Check — Crypto shredding
    {
      type: 'knowledgeCheck',
      id: 'd2a1s11-kc-2',
      question:
        'An organization stores sensitive data in a cloud environment and needs to ensure the data cannot be recovered when the contract ends. Physical access to the cloud provider\'s hardware is not possible. What is the BEST approach?',
      options: [
        'Request the cloud provider degauss their storage arrays',
        'Overwrite the data three times before contract termination',
        'Use crypto shredding — encrypt the data and destroy all encryption keys',
        'Trust the cloud provider\'s standard deletion process',
      ],
      correctIndex: 2,
      explanation:
        'Crypto shredding is the primary option for cloud environments. You cannot physically access or degauss cloud hardware. Overwriting in a shared environment is unreliable. Standard deletion is never sufficient for sensitive data. By encrypting the data and destroying all keys, the data becomes permanently unreadable even though the ciphertext may persist.',
      memoryHack:
        'Paper Shredder Grades: Cloud = Crypto Shredding. You can\'t shred a cloud — so shred the key instead. No key = no data. Remember: crypto shredding isn\'t physical shredding. It destroys the KEY, not the data itself.',
      conceptName: 'Destruction Methods',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 12 — Act 1 Wrap-up / Debrief
    // ================================================================

    // 12-1. Transition
    {
      type: 'transition',
      id: 'd2a1s12-transition-1',
      location: 'new-jersey',
      description: 'The Data Vault — Briefing Room',
      animation: 'fade',
      timeSkipText: 'End of Day 1 Briefing',
    },

    // 12-2. Janet summarizes
    {
      type: 'dialogue',
      id: 'd2a1s12-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Good work today, {player}. You now understand the foundation: how data is classified, who\'s responsible for it, the three states it can exist in, how to protect each state, and the full lifecycle from creation to destruction. Tomorrow we dig deeper — there are some sophisticated techniques the attacker used that we haven\'t uncovered yet.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 12-3. Reeves teases Act 2
    {
      type: 'dialogue',
      id: 'd2a1s12-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'One more thing. The forensics team found evidence that the attacker didn\'t just steal the data — they may have been masking their tracks using de-identification techniques. Get some rest. Tomorrow we investigate how data can be hidden, disguised, and obfuscated.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },
  ],
};
