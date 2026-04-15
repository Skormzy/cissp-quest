import { ActDefinition } from '@/lib/story-types';

export const domain1Act1: ActDefinition = {
  actNumber: 1,
  title: 'The Briefing',
  description:
    'A breach at Nexus HQ. Learn the CIA Triad, DAD Triad, Security Governance, Risk Concepts, Types of Controls, AAA Services, ISC2 Ethics, Compliance, and more.',
  xpReward: 250,
  conceptsCovered: [
    'CIA Triad',
    'DAD Triad',
    'Security Governance',
    'Org Roles',
    'Accountability vs Responsibility',
    'Risk Concepts',
    'Types of Controls',
    'AAA Services',
    'ISC2 Ethics',
    'Compliance vs Security',
    'NIST RMF',
    'Risk Registers',
    'Due Diligence',
    'Due Care',
  ],
  estimatedMinutes: 20,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Setup: Director Reeves briefs the new recruit
    // ================================================================

    // 1-1. Transition — arrive at Nexus HQ
    {
      type: 'transition',
      id: 'd1a1s1-transition-1',
      location: 'new-york',
      description: 'Nexus Cybersecurity HQ — 47th Floor, Manhattan',
      animation: 'fade',
    },

    // 1-2. Reeves introduces the Shadow Protocol breach
    {
      type: 'dialogue',
      id: 'd1a1s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Welcome to Nexus, {player}. I wish we were meeting under better circumstances. Thirty-six hours ago we detected unauthorized access across multiple production systems. We\'re calling it "Operation Shadow Protocol."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-3. Player responds
    {
      type: 'dialogue',
      id: 'd1a1s1-dialogue-2',
      speaker: 'player',
      speakerSide: 'right',
      text: 'I read the preliminary report on the way in. What do we know so far, Director?',
      rightCharacter: 'player',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-4. Reeves sets the mission and introduces the team
    {
      type: 'dialogue',
      id: 'd1a1s1-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Someone slipped through our defenses, accessed sensitive data, and left almost no trace. Your job is to investigate, learn our security frameworks inside and out, and help us make sure this never happens again. Let me introduce the team you\'ll be working with.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 1-5. Evidence — Breach Incident Summary
    {
      type: 'evidence',
      id: 'd1a1s1-evidence-1',
      title: 'NEXUS Breach — Incident Summary',
      classification: 'CLASSIFIED',
      content:
        'An unknown actor exploited a compromised developer account to access production databases. The breach affected financial records, employee data, and customer PII across three critical systems.',
      evidenceItems: [
        { label: 'Incident Code', value: 'SHADOW-PROTOCOL-001', highlight: true },
        { label: 'Detection Time', value: '36 hours ago' },
        { label: 'Attack Vector', value: 'Compromised credentials (jchen_dev)', highlight: true },
        { label: 'Systems Affected', value: 'Financial DB, HR Systems, Customer Portal' },
        { label: 'Data at Risk', value: 'PII, Financial Records, Employee Data', highlight: true },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'This is everything we know. Read through it carefully — every detail matters in an investigation like this.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 2 — CIA Triad (Morales, "Three Vault Locks")
    // ================================================================

    // 2-1. Morales introduces herself and the concept
    {
      type: 'dialogue',
      id: 'd1a1s2-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Agent Morales, digital forensics. Before we dig into the breach specifics, {player}, you need to understand how we classify every security incident. I call it the "Three Vault Locks." Every system is a vault — and it\'s only secure when all three locks are holding.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2-2. Interactive Image — Three Vault Locks (CIA Triad)
    {
      type: 'interactiveImage',
      id: 'd1a1s2-interactive-1',
      title: 'The Three Vault Locks — CIA Triad',
      imageType: 'exploration',
      backgroundGradient:
        'linear-gradient(135deg, #0a1628 0%, #1a1040 40%, #0d1f3c 100%)',
      conceptName: 'CIA Triad',
      speaker: 'morales',
      dialogue:
        'Think of every system as a vault with three locks. Each lock protects something different. Click each lock to learn what it guards.',
      completionDialogue:
        'You\'ve got it. Confidentiality, Integrity, Availability — the three locks. If any one fails, the vault is compromised. In our breach, the attacker broke all three.',
      leftCharacter: 'morales',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'lock-c',
          label: 'C — Confidentiality',
          x: 15,
          y: 40,
          width: 22,
          height: 28,
          shape: 'circle',
          npcSpeaker: 'morales',
          dialogue:
            'Confidentiality — "Who can see it?" Only authorized people should access sensitive data. The attacker\'s SELECT queries broke this lock by reading data they had no right to see.',
          detail:
            'Confidentiality ensures information is accessible only to those authorized. Controls include encryption, access controls, and data classification.',
        },
        {
          id: 'lock-i',
          label: 'I — Integrity',
          x: 40,
          y: 40,
          width: 22,
          height: 28,
          shape: 'circle',
          npcSpeaker: 'morales',
          dialogue:
            'Integrity — "Has it been changed?" Data must remain accurate and unaltered by unauthorized parties. Like a tamper-evident seal. Those 23 UPDATE queries the attacker ran? That\'s an integrity violation.',
          detail:
            'Integrity safeguards the accuracy and completeness of information. Controls include hashing, digital signatures, and version control.',
        },
        {
          id: 'lock-a',
          label: 'A — Availability',
          x: 65,
          y: 40,
          width: 22,
          height: 28,
          shape: 'circle',
          npcSpeaker: 'morales',
          dialogue:
            'Availability — "Can I use it when I need it?" Systems must be accessible to authorized users when needed. If the attacker had deleted data or taken the servers offline, that\'s availability gone.',
          detail:
            'Availability ensures timely and reliable access to information and systems. Controls include redundancy, backups, failover clusters, and load balancing.',
        },
      ],
    },

    // 2-3. Knowledge Check 1 — Integrity focus
    {
      type: 'knowledgeCheck',
      id: 'd1a1s2-kc-1',
      question:
        'An attacker modifies financial records in a database without authorization. Which element of the CIA Triad is PRIMARILY compromised?',
      options: [
        'Confidentiality',
        'Integrity',
        'Availability',
        'Authentication',
      ],
      correctIndex: 1,
      explanation:
        'Integrity is compromised when data is modified without authorization. The records were changed — not merely viewed (that would be a confidentiality issue) or made inaccessible (that would be availability). Authentication is not part of the CIA Triad.',
      memoryHack:
        'Three Vault Locks — I = "Is it Intact?" Modifying data = broken Integrity lock. If it was read, that\'s Confidentiality. If it was taken offline, that\'s Availability.',
      conceptName: 'CIA Triad',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 2-4. Knowledge Check 2 — Availability focus (DDoS)
    {
      type: 'knowledgeCheck',
      id: 'd1a1s2-kc-2',
      question:
        'A DDoS attack takes down the customer portal for 6 hours. Which element of the CIA Triad is PRIMARILY affected?',
      options: [
        'Confidentiality',
        'Integrity',
        'Availability',
        'Authentication',
      ],
      correctIndex: 2,
      explanation:
        'Availability is compromised when authorized users cannot access a system. A DDoS attack floods the portal with traffic, making it inaccessible. No data was read (confidentiality) or altered (integrity) — the system simply could not be reached.',
      memoryHack:
        'Three Vault Locks — A = "Is it Accessible?" A DDoS makes a system inaccessible. The data is still there and unchanged, but nobody can get to it.',
      conceptName: 'CIA Triad',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — DAD Triad (Janet, "CIA's Evil Twin")
    // ================================================================

    // 3-1. Janet introduces herself and the DAD Triad
    {
      type: 'dialogue',
      id: 'd1a1s3-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Janet Chen, SOC Lead. Nice to meet you, {player}. Morales taught you the three locks — now let me show you the three lockpicks. For every protective element in the CIA Triad, there\'s an opposing threat. I call it "CIA\'s Evil Twin" — the DAD Triad.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 3-2. Janet explains the relationship
    {
      type: 'dialogue',
      id: 'd1a1s3-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'DAD stands for Disclosure, Alteration, and Destruction. For every lock, there\'s a lockpick. Confidentiality protects against Disclosure. Integrity protects against Alteration. Availability protects against Destruction. Know the locks, know the picks.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 3-3. Visual Aid — CIA vs DAD comparison
    {
      type: 'visualAid',
      id: 'd1a1s3-visual-1',
      title: 'CIA vs DAD — "CIA\'s Evil Twin"',
      aidType: 'comparison',
      headers: ['CIA Triad', 'Protects Against (DAD)'],
      rows: [
        ['Confidentiality', 'Disclosure — unauthorized exposure of information'],
        ['Integrity', 'Alteration — unauthorized modification of data'],
        ['Availability', 'Destruction — rendering systems or data unusable'],
      ],
      speaker: 'janet',
      dialogue:
        'In the Shadow Protocol breach, we saw all three evil twins at work. Data was disclosed to unauthorized eyes, financial records were altered, and the attacker could have destroyed backups if we hadn\'t caught it in time.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
    },

    // 3-4. Knowledge Check — DAD Triad
    {
      type: 'knowledgeCheck',
      id: 'd1a1s3-kc-1',
      question:
        'Which element of the DAD Triad represents the opposite of Integrity?',
      options: ['Disclosure', 'Alteration', 'Destruction', 'Denial'],
      correctIndex: 1,
      explanation:
        'Alteration is the opposite of Integrity. Integrity ensures data remains unchanged by unauthorized parties; Alteration is the threat of unauthorized modification. Disclosure opposes Confidentiality, and Destruction opposes Availability. Denial is not part of the DAD Triad.',
      memoryHack:
        'CIA\'s Evil Twin: C↔Disclosure, I↔Alteration, A↔Destruction. Integrity\'s evil twin is Alteration — changing what should stay the same.',
      conceptName: 'DAD Triad',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Security Governance (Reeves, "City Blueprint")
    // ================================================================

    // 4-1. Reeves introduces governance
    {
      type: 'dialogue',
      id: 'd1a1s4-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Good work learning the triads, {player}. Now let me show you something bigger. This breach didn\'t happen because of a single technical failure. It happened because of a governance failure. Think of security governance like a city blueprint.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4-2. Reeves explains the layers
    {
      type: 'dialogue',
      id: 'd1a1s4-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Every well-run city has a constitution, building codes, construction manuals, and best-practice guides. Security governance works the same way — it\'s a hierarchy of documents that tell everyone what to do, how to do it, and why it matters.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4-3. Evidence — Security Governance Hierarchy
    {
      type: 'evidence',
      id: 'd1a1s4-evidence-1',
      title: 'Security Governance Hierarchy — "The City Blueprint"',
      classification: 'UNCLASSIFIED',
      content:
        'Security governance is the framework that guides all security decisions. Like a city has zoning laws, building codes, and traffic rules, an organization needs policies, standards, procedures, guidelines, and baselines.',
      evidenceItems: [
        {
          label: '1. Policies (Constitution)',
          value:
            'High-level mandates set by leadership. Define WHAT must be done. Example: "All data must be classified and protected."',
          highlight: true,
        },
        {
          label: '2. Standards (Building Codes)',
          value:
            'Specific, mandatory requirements. Define HOW policies are met. Example: "Use AES-256 encryption for data at rest."',
        },
        {
          label: '3. Procedures (Construction Manuals)',
          value:
            'Step-by-step instructions for specific tasks. Example: "How to provision a new user account in 12 steps."',
        },
        {
          label: '4. Guidelines (Best Practice Suggestions)',
          value:
            'Recommended but not mandatory. Example: "Consider using a password manager for complex credentials."',
        },
        {
          label: '5. Baselines (Foundation Standards)',
          value:
            'Minimum configuration standards every system must meet. Example: "All servers must have endpoint protection and current patches."',
        },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'At Nexus, our governance failed because the developer account had excessive permissions — a clear policy violation. The "city blueprint" was written, but it wasn\'t enforced.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 4-4. Knowledge Check — Governance hierarchy
    {
      type: 'knowledgeCheck',
      id: 'd1a1s4-kc-1',
      question:
        'Which is the HIGHEST level document in a security governance hierarchy?',
      options: ['Procedure', 'Standard', 'Policy', 'Guideline'],
      correctIndex: 2,
      explanation:
        'Policies are the highest-level governance documents, set by senior management. They define WHAT must be done but not HOW. Standards specify mandatory requirements. Procedures detail step-by-step actions. Guidelines are recommendations, not requirements.',
      memoryHack:
        'City Blueprint: Policies = Constitution (top), Standards = Building Codes, Procedures = Construction Manuals, Guidelines = Best Practice Suggestions. The constitution always sits at the top of the hierarchy.',
      conceptName: 'Security Governance',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — Org Roles + Accountability vs Responsibility
    //           (Reeves, "Hospital Staff Hierarchy" + "Captain and Crew")
    // ================================================================

    // 5-1. Reeves introduces organizational roles
    {
      type: 'dialogue',
      id: 'd1a1s5-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Governance documents are only as good as the people who enforce them, {player}. Let me walk you through organizational security roles. Think of it like a hospital staff hierarchy — everyone has a specific job, and the chain of authority matters.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5-2. Visual Aid — Org Roles as Hospital Analogy
    {
      type: 'visualAid',
      id: 'd1a1s5-visual-1',
      title: 'Organizational Security Roles — "Hospital Staff Hierarchy"',
      aidType: 'list',
      items: [
        {
          label: 'CEO / Senior Management = Hospital Director',
          description:
            'Sets the vision, allocates budget, ultimately accountable for security. Signs off on policies. The buck stops here.',
        },
        {
          label: 'CISO = Chief of Medicine',
          description:
            'Oversees the entire security program. Translates business goals into security strategy. Reports to executive leadership.',
        },
        {
          label: 'Data/Asset Owner = Department Head',
          description:
            'Business executive responsible for a specific data set or asset. Decides who gets access and what classification level applies.',
        },
        {
          label: 'Data Custodian = Nurse',
          description:
            'Handles the day-to-day care of data. Implements backups, applies patches, manages storage. Does NOT decide policy — follows the owner\'s direction.',
        },
        {
          label: 'User = Patient',
          description:
            'Uses systems and data according to policies. Must follow the rules, report incidents, and not introduce risk.',
        },
        {
          label: 'Auditor = Health Inspector',
          description:
            'Independent evaluator who checks that policies are followed. Reports findings to management. Must remain objective.',
        },
      ],
      speaker: 'reeves',
      dialogue:
        'In the breach, the developer account was owned by engineering but had permissions that only a data owner should approve. The custodian gave access without the owner\'s sign-off — a role violation.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 5-3. Reeves explains Accountability vs Responsibility
    {
      type: 'dialogue',
      id: 'd1a1s5-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Now here\'s a concept the CISSP exam loves to test: Accountability versus Responsibility. I call it the "Captain and Crew" principle. The captain is accountable for the ship — if it sinks, that\'s on the captain. You can\'t delegate that. But the crew handles the daily tasks — steering, navigation, maintenance. Those responsibilities CAN be delegated.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 5-4. Dialogue — Player processes the concept
    {
      type: 'dialogue',
      id: 'd1a1s5-dialogue-3',
      speaker: 'player',
      speakerSide: 'right',
      text: 'So the CEO is accountable for the breach even though IT staff had the day-to-day responsibility?',
      rightCharacter: 'player',
      rightExpression: 'thinking',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 5-5. Reeves confirms
    {
      type: 'dialogue',
      id: 'd1a1s5-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Exactly. The CEO can delegate the responsibility of managing firewalls and access controls, but the accountability for what happens to the organization\'s data never leaves the top. That\'s why senior management must be engaged in security — not just signing off on budgets.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5-6. Knowledge Check — Accountability vs Responsibility
    {
      type: 'knowledgeCheck',
      id: 'd1a1s5-kc-1',
      question:
        'What is the KEY distinction between accountability and responsibility in security governance?',
      options: [
        'Accountability cannot be delegated; responsibility can be',
        'Responsibility is more important than accountability',
        'Only executives have accountability; all staff have responsibility',
        'Accountability and responsibility are interchangeable terms',
      ],
      correctIndex: 0,
      explanation:
        'Accountability is ultimate ownership — it stays with the person in charge and cannot be delegated. Responsibility is the obligation to perform tasks and can be delegated to others. A CEO is accountable for security; a sysadmin is responsible for patching servers. Both matter, but accountability rests at the top.',
      memoryHack:
        'Captain and Crew: The captain goes down with the ship (accountability = can\'t delegate). The crew handles tasks (responsibility = can delegate). If the ship sinks, you blame the captain, not the deckhand.',
      conceptName: 'Accountability vs Responsibility',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Risk Concepts (Janet, "Weather Forecast")
    // ================================================================

    // 6-1. Janet introduces risk
    {
      type: 'dialogue',
      id: 'd1a1s6-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Reeves asked me to walk you through risk analysis, {player}. Here\'s how I think about it — risk is like a weather forecast. You can\'t control the weather, but you can prepare for it.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 6-2. Visual Aid — Risk Concepts with weather metaphor
    {
      type: 'visualAid',
      id: 'd1a1s6-visual-1',
      title: 'Risk Concepts — "The Weather Forecast"',
      aidType: 'list',
      items: [
        {
          label: 'Threat = The Storm',
          description:
            'Any potential danger — hackers, malware, natural disasters, insider threats. You can\'t prevent storms from existing. They\'re out there whether you like it or not.',
        },
        {
          label: 'Vulnerability = Your Leaky Roof',
          description:
            'A weakness that a threat can exploit. The developer\'s excessive permissions were our leaky roof. No leak means no indoor flooding, even in a hurricane.',
        },
        {
          label: 'Risk = Storm + Leaky Roof',
          description:
            'The probability that a threat exploits a vulnerability and causes damage. Risk only exists when a threat can reach a vulnerability.',
        },
        {
          label: 'Control / Countermeasure = Umbrella or Roof Repair',
          description:
            'Actions taken to reduce risk. Patching, access controls, encryption, training — these are all ways to fix the roof or carry an umbrella.',
        },
        {
          label: 'Impact = How Wet You Get',
          description:
            'The actual damage if the risk materializes. Financial loss, reputation damage, regulatory fines, operational disruption.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'Risk = Threat x Vulnerability x Impact. You can reduce vulnerability (fix the roof), add controls (carry an umbrella), or accept the risk (get wet). But you can\'t eliminate threats — storms will always exist.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
    },

    // 6-3. Janet reinforces the formula
    {
      type: 'dialogue',
      id: 'd1a1s6-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Here\'s the critical insight: if you eliminate the vulnerability, the risk drops to zero even if the threat remains. No leaky roof means no water damage, regardless of how many storms roll through. That\'s why we focus on what we CAN control.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6-4. Knowledge Check — Risk relationships
    {
      type: 'knowledgeCheck',
      id: 'd1a1s6-kc-1',
      question:
        'In risk management, what is the relationship between threats, vulnerabilities, and risk?',
      options: [
        'Risk = Threat + Vulnerability + Control',
        'Risk exists when a threat can exploit a vulnerability to cause impact',
        'Vulnerabilities are a type of threat that creates risk automatically',
        'Controls eliminate risk by removing all threats',
      ],
      correctIndex: 1,
      explanation:
        'Risk exists at the intersection of threats and vulnerabilities. A threat must be able to exploit a vulnerability to create risk. Without a vulnerability, a threat cannot cause impact. Controls reduce risk but cannot eliminate all threats — they work by reducing vulnerabilities or limiting impact.',
      memoryHack:
        'Weather Forecast: Threat = Storm, Vulnerability = Leaky Roof, Risk = Storm + Leaky Roof = Wet Inside. No leak? No indoor risk, even with storms.',
      conceptName: 'Risk Concepts',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Types of Controls (Kai, "Building Security Layers")
    // ================================================================

    // 7-1. Kai introduces himself and the concept
    {
      type: 'dialogue',
      id: 'd1a1s7-dialogue-1',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Hey {player}, I\'m Kai — threat intel analyst. Janet just taught you about controls as umbrellas and roof repairs, but there\'s a whole taxonomy to how we classify them. I call it "Building Security Layers." Think of a building — it has physical walls, electronic alarms, AND written policies. Three categories, multiple functions.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7-2. Kai explains categories and functions
    {
      type: 'dialogue',
      id: 'd1a1s7-dialogue-2',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Controls have two dimensions. First, the CATEGORY — is it Administrative, Technical, or Physical? Second, the FUNCTION — does it Prevent, Detect, Correct, Deter, Recover, Compensate, or Direct? Every control fits into one category and at least one function.',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7-3. Interactive Image — Control types
    {
      type: 'interactiveImage',
      id: 'd1a1s7-interactive-1',
      title: 'Building Security Layers — Control Types',
      imageType: 'comparison',
      backgroundGradient:
        'linear-gradient(135deg, #0d1f2d 0%, #1a3a2a 40%, #0d1f2d 100%)',
      conceptName: 'Types of Controls',
      speaker: 'kai',
      dialogue:
        'Click each layer to see examples. A strong security program uses controls from every category and function — defense in depth.',
      completionDialogue:
        'Now you see the full picture. Administrative, Technical, Physical — each category serves different functions. Layer them together and you get defense in depth. One control fails? The next one catches it.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'ctrl-admin',
          label: 'Administrative',
          x: 10,
          y: 15,
          width: 25,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Administrative controls are management-driven: policies, training programs, background checks, risk assessments, and security awareness campaigns. They tell people what to do and why.',
          detail:
            'Also called "managerial" controls. Examples: acceptable use policies, security training, separation of duties, job rotation, mandatory vacations.',
        },
        {
          id: 'ctrl-technical',
          label: 'Technical / Logical',
          x: 38,
          y: 15,
          width: 25,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Technical controls use technology to enforce security: firewalls, encryption, intrusion detection systems, access control lists, multi-factor authentication. These are the electronic locks and alarms.',
          detail:
            'Also called "logical" controls. Examples: firewalls, IDS/IPS, encryption, ACLs, MFA, antivirus, audit logs.',
        },
        {
          id: 'ctrl-physical',
          label: 'Physical',
          x: 66,
          y: 15,
          width: 25,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Physical controls protect the tangible environment: fences, security guards, locked doors, CCTV cameras, mantraps, environmental controls. If you can touch it, it\'s physical.',
          detail:
            'Examples: perimeter fencing, badge readers, biometric locks, security guards, cable locks, fire suppression systems.',
        },
        {
          id: 'ctrl-preventive',
          label: 'Preventive',
          x: 10,
          y: 55,
          width: 18,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Preventive controls stop incidents before they happen. A firewall blocking unauthorized traffic, a locked door, a security policy — they all prevent the bad thing from occurring in the first place.',
          detail:
            'Goal: stop the incident before it starts. Examples: access controls, encryption, security training, fences.',
        },
        {
          id: 'ctrl-detective',
          label: 'Detective',
          x: 30,
          y: 55,
          width: 18,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Detective controls discover incidents during or after they occur. Audit logs, IDS alerts, security cameras, motion sensors — they don\'t stop the attack, but they tell you it happened.',
          detail:
            'Goal: identify and record incidents. Examples: IDS, audit logs, CCTV, honeypots, security reviews.',
        },
        {
          id: 'ctrl-corrective',
          label: 'Corrective',
          x: 50,
          y: 55,
          width: 18,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Corrective controls fix the problem after an incident. Restoring from backups, patching a vulnerability, terminating a compromised session — they repair the damage.',
          detail:
            'Goal: repair and restore after an incident. Examples: backup restoration, patch management, incident response procedures.',
        },
      ],
    },

    // 7-4. Knowledge Check — Control classification
    {
      type: 'knowledgeCheck',
      id: 'd1a1s7-kc-1',
      question:
        'A security guard stationed at a building entrance is an example of which type of control?',
      options: [
        'Administrative and Detective',
        'Technical and Preventive',
        'Physical and Preventive',
        'Physical and Corrective',
      ],
      correctIndex: 2,
      explanation:
        'A security guard is a Physical control (a person you can see and interact with in the physical environment) and Preventive (their presence stops unauthorized people from entering). Guards are not Technical (no technology involved in the guard\'s presence) or Administrative (not a policy or procedure). They prevent entry, not correct an incident after the fact.',
      memoryHack:
        'Building Security Layers: Physical = things you can touch or see in person (guards, fences, locks). A guard PREVENTS unauthorized entry by standing in the way. Physical + Preventive.',
      conceptName: 'Types of Controls',
      speaker: 'kai',
      leftCharacter: 'kai',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — AAA Services (Morales, "Airport Security Checkpoints")
    // ================================================================

    // 8-1. Morales introduces AAA
    {
      type: 'dialogue',
      id: 'd1a1s8-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Back to me, {player}. Let\'s talk about how we verify who people are and what they\'re allowed to do. Think of it like going through airport security — there\'s a specific sequence of checkpoints everyone passes through.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8-2. Morales walks through each step
    {
      type: 'dialogue',
      id: 'd1a1s8-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'At the airport, you show your ticket to claim who you are, show your passport to prove it, board the right flight based on your ticket class, get recorded on security cameras, and the airline logs your seat assignment. That\'s Identification, Authentication, Authorization, Auditing, and Accounting — the five AAA services.',
      leftCharacter: 'morales',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8-3. Visual Aid — AAA with airport analogy
    {
      type: 'visualAid',
      id: 'd1a1s8-visual-1',
      title: 'AAA Services — "Airport Security Checkpoints"',
      aidType: 'list',
      items: [
        {
          label: 'Identification = Show Your Ticket',
          description:
            'Claiming who you are. A username, an employee badge, an email address. You\'re saying "I am this person" — but you haven\'t proved it yet.',
        },
        {
          label: 'Authentication = Show Your Passport',
          description:
            'Proving you are who you claim. A password, a fingerprint, a smart card. This is the PROOF step. The attacker in our breach had stolen credentials — they passed authentication with someone else\'s identity.',
        },
        {
          label: 'Authorization = Board the Right Flight',
          description:
            'Access granted based on your verified identity and permissions. Economy passengers can\'t sit in first class. A junior dev shouldn\'t access the financial database.',
        },
        {
          label: 'Auditing = Security Cameras Recording',
          description:
            'Monitoring and recording what you do. Log files, SIEM alerts, access trails. This is how we detected the breach — the audit logs showed unusual query patterns.',
        },
        {
          label: 'Accounting = Flight Manifest Logged',
          description:
            'Recording resource usage for billing, capacity planning, and accountability. Who accessed what, when, and how much bandwidth or storage they consumed.',
        },
      ],
      speaker: 'morales',
      dialogue:
        'The breach exploited a weakness in Identification and Authentication — the attacker used stolen credentials. They identified as jchen_dev and authenticated with the stolen password. Our Authorization controls then gave them far too much access because the account had excessive privileges.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 8-4. Knowledge Check — AAA
    {
      type: 'knowledgeCheck',
      id: 'd1a1s8-kc-1',
      question:
        'A user provides a username to log into a system. This is an example of:',
      options: [
        'Identification',
        'Authentication',
        'Authorization',
        'Accounting',
      ],
      correctIndex: 0,
      explanation:
        'Providing a username is Identification — claiming who you are. Authentication would require proving that claim with a password, biometric, or token. Authorization determines what you can access after identity is verified. Accounting tracks resource usage. Remember: username = claim (Identification), password = proof (Authentication).',
      memoryHack:
        'Airport Security: Identification = showing your ticket (claiming who you are). Authentication = showing your passport (PROVING it). Username = claim, password = proof. The ticket gets you in line; the passport gets you through.',
      conceptName: 'AAA Services',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — ISC2 Code of Ethics (Reeves, "Agent's Oath")
    // ================================================================

    // 9-1. Reeves introduces ethics
    {
      type: 'dialogue',
      id: 'd1a1s9-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Before you go any further, {player}, I need you to understand something fundamental. Every agent takes an oath. At ISC2, we call it the Code of Ethics — four canons that guide every decision a security professional makes. I call it the "Agent\'s Oath."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Visual Aid — ISC2 Ethics Canons
    {
      type: 'visualAid',
      id: 'd1a1s9-visual-1',
      title: 'ISC2 Code of Ethics — "The Agent\'s Oath"',
      aidType: 'list',
      items: [
        {
          label: 'Canon I — Protect Society',
          description:
            'Protect society, the common good, necessary public trust and confidence, and the infrastructure. Society comes FIRST — always. If there\'s ever a conflict, public safety wins.',
        },
        {
          label: 'Canon II — Act Honorably',
          description:
            'Act honorably, honestly, justly, responsibly, and legally. Your personal integrity matters. Don\'t lie, don\'t cheat, don\'t break the law — even if your boss tells you to.',
        },
        {
          label: 'Canon III — Serve Principals',
          description:
            'Provide diligent and competent service to principals — your employer or client. Do good work, stay current, give honest advice. But never at the expense of Canons I or II.',
        },
        {
          label: 'Canon IV — Advance the Profession',
          description:
            'Advance and protect the profession. Share knowledge, mentor others, maintain the reputation of cybersecurity as a discipline. Don\'t bring shame to the field.',
        },
      ],
      speaker: 'reeves',
      dialogue:
        'The ORDER matters. Society first, then Honor, then your Employer, then the Profession. If your boss asks you to cover up a breach that endangers the public, Canon I says you protect society — even if it costs you your job.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 9-3. Reeves emphasizes the priority order
    {
      type: 'dialogue',
      id: 'd1a1s9-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'On the CISSP exam, you WILL see ethics questions. Remember this: Society > Honor > Employer > Profession. When two canons conflict, the higher one always wins. Always.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-4. Think Like a Manager — Ethics dilemma
    {
      type: 'thinkLikeManager',
      id: 'd1a1s9-tlatm-1',
      scenario:
        'After the Shadow Protocol breach is contained, the CFO says: "We can handle this internally. There\'s no need to notify affected customers — it would hurt our stock price." Your CISO is unsure what to do.',
      question:
        'As a security professional following the ISC2 Code of Ethics, what is the BEST course of action?',
      options: [
        'Follow the CFO\'s direction — they outrank the CISO in the corporate hierarchy',
        'Notify affected individuals and regulators as required by law, even against the CFO\'s wishes',
        'Compromise — notify regulators but not customers to minimize public damage',
        'Wait and see if the breach is discovered publicly before deciding on notification',
      ],
      correctIndex: 1,
      explanation:
        'Canon I requires protecting society and public trust ABOVE employer interests (Canon III). Most breach notification laws legally require notifying affected individuals within a specified timeframe. Concealing a breach violates both ethics and law. The CFO\'s rank is irrelevant — ethical obligations supersede corporate hierarchy.',
      managerInsight:
        'Ethics questions on the CISSP almost always prioritize: Society > Law > Employer > Self. When there\'s a conflict between protecting the public and following your boss, society and legal requirements win every time. This is the "Think Like a Manager" mindset — managers make the hard call, not the easy one.',
      conceptName: 'ISC2 Ethics',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 10 — Compliance vs Security + NIST RMF
    //            (Kai + Janet, "Speed Limit vs Safe Driving" + "GPS Navigation")
    // ================================================================

    // 10-1. Kai introduces compliance vs security
    {
      type: 'dialogue',
      id: 'd1a1s10-dialogue-1',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Quick question before we keep going, {player}: do you know the difference between being compliant and being secure? They\'re NOT the same thing. Think of it like speed limits versus safe driving.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10-2. Kai explains the analogy
    {
      type: 'dialogue',
      id: 'd1a1s10-dialogue-2',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Compliance is following the speed limit — it\'s the minimum legal requirement. But safe driving means adjusting for rain, traffic, and road conditions. You can be doing exactly the speed limit and still crash in a storm. Security is safe driving — it goes beyond the minimum.',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 10-3. Janet takes over for NIST RMF
    {
      type: 'dialogue',
      id: 'd1a1s10-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Speaking of frameworks, {player}, let me introduce you to the NIST Risk Management Framework — think of it as your GPS Navigation system for managing risk. Seven steps, in order, and they cycle continuously. Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10-4. Player asks a question
    {
      type: 'dialogue',
      id: 'd1a1s10-dialogue-4',
      speaker: 'player',
      speakerSide: 'right',
      text: 'Seven steps? How do I remember the order?',
      rightCharacter: 'player',
      rightExpression: 'worried',
      leftCharacter: 'janet',
      leftExpression: 'smile',
    },

    // 10-5. Janet provides mnemonic
    {
      type: 'dialogue',
      id: 'd1a1s10-dialogue-5',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Easy. P-C-S-I-A-A-M. "Please Can Someone Install An Awesome Monitor." Prepare the context, Categorize the system, Select controls, Implement them, Assess their effectiveness, Authorize the system to operate, and Monitor continuously. It\'s a cycle — you never stop.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'smile',
    },

    // 10-6. Timed Decision — Compliance paradox
    {
      type: 'timedDecision',
      id: 'd1a1s10-td-1',
      scenario:
        'Nexus passed its annual compliance audit with flying colors. Two weeks later, the Shadow Protocol breach happens. The board demands an answer: "How were we compliant but still got breached?"',
      timeLimit: 30,
      conceptName: 'Compliance vs Security',
      options: [
        {
          text: 'Compliance is a minimum baseline — it checks boxes but doesn\'t guarantee security. The audit tested controls at a point in time, not continuously.',
          isOptimal: true,
          feedback:
            'Exactly right. Compliance is a snapshot — it verifies minimum standards at a specific moment. Real security requires continuous monitoring, threat awareness, and adaptive controls beyond what audits check. Being compliant is necessary, but never sufficient.',
          xpBonus: 25,
        },
        {
          text: 'The auditors made a mistake and should be blamed for the failure.',
          isOptimal: false,
          feedback:
            'Auditors test against specific frameworks and standards. They can\'t catch everything, especially sophisticated attacks that develop between audit periods. The real issue is that compliance alone doesn\'t equal security.',
        },
        {
          text: 'We need a better compliance framework to prevent breaches.',
          isOptimal: false,
          feedback:
            'While frameworks matter, no compliance framework can prevent all breaches. Compliance is necessary but not sufficient — security requires going beyond checkboxes into active risk management and continuous monitoring.',
        },
      ],
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'kai',
      rightExpression: 'worried',
    },

    // 10-7. Knowledge Check — NIST RMF order
    {
      type: 'knowledgeCheck',
      id: 'd1a1s10-kc-1',
      question:
        'What is the CORRECT order of the first three steps in the NIST Risk Management Framework?',
      options: [
        'Prepare, Categorize, Select',
        'Categorize, Select, Implement',
        'Identify, Assess, Respond',
        'Plan, Do, Check',
      ],
      correctIndex: 0,
      explanation:
        'The NIST RMF follows this order: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. "Categorize, Select, Implement" skips the Prepare step. "Identify, Assess, Respond" describes the NIST CSF, not the RMF. "Plan, Do, Check" is from the Deming cycle (PDCA), a different framework entirely.',
      memoryHack:
        'GPS Navigation: P-C-S-I-A-A-M. "Please Can Someone Install An Awesome Monitor." First three stops on the GPS route: Prepare, Categorize, Select.',
      conceptName: 'NIST RMF',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 11 — Risk Registers/Matrices + Due Diligence/Due Care
    //            (Reeves, "Doctor's Dashboard" + "Home Inspection vs Maintenance")
    // ================================================================

    // 11-1. Reeves introduces risk registers
    {
      type: 'dialogue',
      id: 'd1a1s11-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'We\'re almost done for today, {player}, but there are two more concepts you need before tomorrow. First: risk registers. Think of them as a "Doctor\'s Dashboard" — a living document that tracks every known condition, its severity, and the treatment plan.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11-2. Evidence — Sample Risk Register
    {
      type: 'evidence',
      id: 'd1a1s11-evidence-1',
      title: 'Sample Risk Register — "Doctor\'s Dashboard"',
      classification: 'CONFIDENTIAL',
      content:
        'A risk register is a centralized document listing identified risks, their analysis, and response plans. Every risk is tracked from identification through treatment, just like a patient chart tracks symptoms through recovery.',
      evidenceItems: [
        {
          label: 'RISK-001: Credential Theft',
          value: 'Likelihood: High | Impact: Critical | Treatment: Implement MFA | Owner: CISO',
          highlight: true,
        },
        {
          label: 'RISK-002: Unpatched Servers',
          value: 'Likelihood: Medium | Impact: High | Treatment: 30-day patch cycle | Owner: IT Ops',
        },
        {
          label: 'RISK-003: Insider Threat',
          value: 'Likelihood: Low | Impact: Critical | Treatment: DLP + monitoring | Owner: Security',
          highlight: true,
        },
        {
          label: 'RISK-004: Physical Intrusion',
          value: 'Likelihood: Low | Impact: Medium | Treatment: Badge access + CCTV | Owner: Facilities',
        },
        {
          label: 'RISK-005: Third-Party Breach',
          value: 'Likelihood: Medium | Impact: High | Treatment: Vendor risk assessment | Owner: Procurement',
        },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'RISK-001 — credential theft — was on our register but the treatment hadn\'t been fully implemented. MFA was approved six months ago but only deployed to 60% of accounts. The attacker exploited the 40% gap.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 11-3. Reeves transitions to Due Diligence vs Due Care
    {
      type: 'dialogue',
      id: 'd1a1s11-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And that brings us to a critical distinction: Due Diligence versus Due Care. Think of it as "Home Inspection versus Maintenance." Due Diligence is the home inspection — researching, investigating, documenting risks before you buy. Due Care is the ongoing maintenance — actually fixing the leaky faucet, mowing the lawn, keeping the house in order.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11-4. Reeves connects it to the breach
    {
      type: 'dialogue',
      id: 'd1a1s11-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Nexus performed due diligence — we identified the credential theft risk and documented it in the register. But we failed on due care — we didn\'t follow through on implementing the MFA fix. Knowing the problem exists is not enough. You have to actually do something about it.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 11-5. Knowledge Check — Due Diligence vs Due Care
    {
      type: 'knowledgeCheck',
      id: 'd1a1s11-kc-1',
      question:
        'What is the PRIMARY difference between due diligence and due care?',
      options: [
        'Due diligence is optional; due care is mandatory',
        'Due diligence is researching and planning; due care is acting responsibly',
        'Due care applies only to IT; due diligence applies to management',
        'They are interchangeable terms with the same meaning',
      ],
      correctIndex: 1,
      explanation:
        'Due diligence is the research, investigation, and planning phase — understanding what risks exist and what should be done. Due care is the implementation phase — actually taking reasonable steps to protect against those risks. Both are required, not optional. Both apply across the organization, not just IT or management. They are distinct concepts, not interchangeable.',
      memoryHack:
        'Home Inspection vs Maintenance: Due Diligence = home inspection before buying (research, document, plan). Due Care = fixing the leaky faucet (actually doing the right thing). Diligence = Detect, Care = Correct.',
      conceptName: 'Due Diligence vs Due Care',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 12 — Wrap-up + Cliffhanger
    // ================================================================

    // 12-1. Janet summarizes what was learned
    {
      type: 'dialogue',
      id: 'd1a1s12-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Impressive first day, {player}. Let me recap what you\'ve absorbed: the CIA Triad and its evil twin DAD, security governance hierarchies, organizational roles, accountability versus responsibility, risk concepts, control types and categories, AAA services, the ISC2 Code of Ethics, compliance versus security, the NIST RMF, risk registers, and due diligence versus due care. That\'s a lot of ground.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'smile',
    },

    // 12-2. Reeves hints at deeper investigation
    {
      type: 'dialogue',
      id: 'd1a1s12-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Don\'t get too comfortable. Tomorrow we go deeper. Quantitative risk analysis — actual numbers, dollar figures, annualized loss calculations. Legal frameworks, intellectual property, privacy regulations. The Shadow Protocol breach has layers we haven\'t even touched yet.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 12-3. Player responds with choices
    {
      type: 'dialogue',
      id: 'd1a1s12-dialogue-3',
      speaker: 'player',
      speakerSide: 'right',
      text: 'What should I focus on tonight to prepare?',
      rightCharacter: 'player',
      rightExpression: 'neutral',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      choices: [
        {
          text: '"I\'ll review the Reference Library — risk frameworks and legal concepts."',
          response:
            'Reeves nods approvingly. "Smart move. Familiarize yourself with ALE calculations and data privacy laws. You\'ll need them tomorrow when we quantify the damage from Shadow Protocol."',
          xpBonus: 15,
        },
        {
          text: '"I\'m ready for whatever comes next. Let\'s keep going."',
          response:
            'Reeves allows himself a rare half-smile. "That\'s the attitude I like to see, {player}. Get some rest — tomorrow we put numbers to the breach, and the math doesn\'t lie."',
          xpBonus: 10,
        },
      ],
    },
  ],
};
