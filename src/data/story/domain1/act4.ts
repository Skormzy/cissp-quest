import { ActDefinition } from '@/lib/story-types';

export const domain1Act4: ActDefinition = {
  actNumber: 4,
  title: 'The Escalation',
  description:
    'BCP activated, insider threat confirmed. Master advanced security concepts under real-world crisis pressure.',
  xpReward: 300,
  conceptsCovered: [
    'BCP/BIA',
    'Recovery Metrics',
    'Personnel Security',
    'Security Awareness Training',
    'Threat Modeling',
    'Supply Chain Risk',
    'Third-Party Governance',
    'Separation of Duties',
    'Least Privilege',
    'Investigation Types',
    'Import/Export Controls',
    'Security Frameworks',
    'Transborder Data',
    'M&A Security',
    'Employee Duress',
    'NCA/NDA',
    'Risk Communication',
  ],
  estimatedMinutes: 22,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Transition: BCP Activation
    // ================================================================

    // 1-1. Transition — Emergency Operations Center
    {
      type: 'transition',
      id: 'd1a4s1-transition-1',
      location: 'new-york',
      description: 'Nexus Cybersecurity HQ — Emergency Operations Center',
      animation: 'glitch',
      timeSkipText: 'Day 4 — 0300 Hours — ALERT STATUS',
    },

    // 1-2. Reeves opens with urgency
    {
      type: 'dialogue',
      id: 'd1a4s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Listen up, everyone. At 0200 hours, the attacker triggered a secondary payload. Our primary data center is experiencing cascading failures. This is no longer just an investigation — it\'s a live crisis.',
      leftCharacter: 'reeves',
      leftExpression: 'angry',
    },

    // 1-3. Janet sets the learning frame
    {
      type: 'dialogue',
      id: 'd1a4s1-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'BCP is now active. Everything we\'ve learned about risk, governance, and controls gets tested right now. {player}, stay close — you\'re about to learn how organizations survive disasters.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // ================================================================
    // SCENE 2 — BCP/BIA + Recovery Metrics (Janet, "Restaurant Kitchen Fire")
    // ================================================================

    // 2-1. Janet introduces the analogy
    {
      type: 'dialogue',
      id: 'd1a4s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Think of BCP like a restaurant that catches fire in the kitchen. The Business Impact Analysis tells us WHICH dishes are most critical, and recovery metrics tell us HOW FAST we need them back.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 2-2. BCP vs DRP explanation
    {
      type: 'dialogue',
      id: 'd1a4s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'BCP — Business Continuity Planning — is about keeping the restaurant open. Maybe you set up outdoor seating while the kitchen is being repaired. The goal is: the business keeps running.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 2-3. DRP distinction
    {
      type: 'dialogue',
      id: 'd1a4s2-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'DRP — Disaster Recovery Plan — is about rebuilding the kitchen. Restoring the IT systems, the servers, the data. BCP keeps the business alive; DRP fixes the technology.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 2-4. BIA explanation
    {
      type: 'dialogue',
      id: 'd1a4s2-dialogue-4',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'And the BIA — Business Impact Analysis — is where it all starts. It\'s the menu audit that tells you which dishes bring in the most revenue. You do the BIA FIRST, so you know what to protect and in what order.',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },

    // 2-5. Interactive Image — Restaurant Kitchen Fire BCP/BIA
    {
      type: 'interactiveImage',
      id: 'd1a4s2-interactive-1',
      title: 'Restaurant Kitchen Fire — BCP/BIA and Recovery Metrics',
      imageType: 'process_flow',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #2d1810 40%, #0d1f3c 100%)',
      conceptName: 'BCP/BIA',
      speaker: 'janet',
      dialogue: 'Tap each metric to see how recovery timelines work in our kitchen fire scenario.',
      completionDialogue: 'Now you see the full picture. BIA identifies what matters, and the recovery metrics define the timeline for getting it back. These relationships are heavily tested on the CISSP exam.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
      hotspots: [
        {
          id: 'bia-hotspot',
          label: 'BIA',
          x: 10,
          y: 20,
          width: 18,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Business Impact Analysis — what functions are critical? Our customer portal generates $2M/month. Email is important but not revenue-critical.',
          detail: 'The BIA ranks business functions by criticality. It answers: "If this goes down, how badly does it hurt the business?" Always start here.',
        },
        {
          id: 'mtd-hotspot',
          label: 'MTD',
          x: 32,
          y: 20,
          width: 18,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Maximum Tolerable Downtime — the restaurant can survive 4 hours without the kitchen. After that, customers leave permanently. For Nexus: customer portal MTD = 4 hours.',
          detail: 'MTD is the absolute deadline. Beyond this point, the business suffers irreversible damage — lost customers, regulatory penalties, or even bankruptcy.',
        },
        {
          id: 'rto-hotspot',
          label: 'RTO',
          x: 54,
          y: 20,
          width: 18,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Recovery Time Objective — how fast can we get the kitchen running? Target: 2 hours for basic service. RTO must be LESS than MTD.',
          detail: 'RTO is the target for getting the system operational again. It must always be less than MTD to leave room for Work Recovery Time.',
        },
        {
          id: 'rpo-hotspot',
          label: 'RPO',
          x: 10,
          y: 55,
          width: 18,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Recovery Point Objective — how much food prep (data) can we afford to lose? If we back up orders every 15 minutes, RPO = 15 minutes.',
          detail: 'RPO looks backward in time. It defines the maximum acceptable data loss measured in time. A 15-minute RPO means backups every 15 minutes.',
        },
        {
          id: 'wrt-hotspot',
          label: 'WRT',
          x: 32,
          y: 55,
          width: 18,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Work Recovery Time — after the kitchen equipment is restored, how long to verify everything works, restock ingredients, and return to full menu? WRT = MTD - RTO.',
          detail: 'WRT is the buffer between getting systems up (RTO) and having them fully operational. Testing, verification, data validation — it all happens in the WRT window.',
        },
      ],
    },

    // 2-6. Think Like a Manager — RTO vs MTD
    {
      type: 'thinkLikeManager',
      id: 'd1a4s2-tlatm-1',
      scenario: 'The CFO asks you to set the RTO for the customer portal at 8 hours to save on infrastructure costs. The BIA shows the portal\'s MTD is 4 hours.',
      question: 'What should you advise?',
      options: [
        'Accept the 8-hour RTO since the CFO has budget authority',
        'The RTO cannot exceed the MTD — an 8-hour RTO means 4 hours of unacceptable downtime',
        'Set the RTO to exactly 4 hours to match the MTD',
        'Eliminate the portal from the BCP since it\'s too expensive to protect',
      ],
      correctIndex: 1,
      explanation: 'RTO must always be LESS than MTD. If MTD is 4 hours, the system must be recovered in under 4 hours. Setting RTO = MTD leaves zero time for work recovery (WRT). Setting RTO > MTD means the business suffers unacceptable impact.',
      managerInsight: 'The CISSP exam tests whether you understand the relationship: RTO + WRT ≤ MTD. If RTO equals MTD, there\'s no time for WRT. If RTO exceeds MTD, you\'ve failed the business. Always push back when stakeholders want to set RTO > MTD.',
      conceptName: 'Recovery Metrics',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 2-7. Knowledge Check 1 — BIA identification
    {
      type: 'knowledgeCheck',
      id: 'd1a4s2-kc-1',
      question: 'Which component of business continuity planning identifies an organization\'s critical business functions and the impact of their disruption?',
      options: [
        'Business Impact Analysis (BIA)',
        'Disaster Recovery Plan (DRP)',
        'Risk Assessment',
        'Incident Response Plan',
      ],
      correctIndex: 0,
      explanation: 'The BIA identifies critical business functions and quantifies the impact of their disruption. The DRP focuses on IT recovery, the risk assessment evaluates threats and vulnerabilities broadly, and the IRP addresses incident handling — none of these specifically identify critical functions and their business impact the way a BIA does.',
      memoryHack: 'Restaurant Kitchen Fire: BIA = the menu audit that tells you which dishes make the money. You do the BIA FIRST to know what to protect.',
      conceptName: 'BCP/BIA',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 2-8. Knowledge Check 2 — RTO/WRT/MTD relationship
    {
      type: 'knowledgeCheck',
      id: 'd1a4s2-kc-2',
      question: 'What is the correct relationship between RTO, WRT, and MTD?',
      options: [
        'RTO = MTD - RPO',
        'MTD = RTO × WRT',
        'RTO + WRT ≤ MTD',
        'RPO + RTO = MTD',
      ],
      correctIndex: 2,
      explanation: 'RTO (time to restore systems) plus WRT (time to verify and return to full operations) must be less than or equal to MTD (the maximum tolerable downtime). The other formulas are fabricated — RPO measures acceptable data loss and is not part of the RTO/WRT/MTD equation.',
      memoryHack: 'Kitchen Fire Timeline: MTD is your deadline. RTO (fix equipment) + WRT (restock & test) must fit WITHIN the MTD deadline. RTO + WRT ≤ MTD.',
      conceptName: 'Recovery Metrics',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },

    // ================================================================
    // SCENE 3 — Personnel Security (Morales, "Bank Teller Safeguards")
    // ================================================================

    // 3-1. Morales introduces personnel security
    {
      type: 'dialogue',
      id: 'd1a4s3-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'The insider threat angle changes everything. Let me walk you through personnel security — think of it like "Bank Teller Safeguards." Banks have known about insider threats for centuries.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 3-2. Background checks and onboarding
    {
      type: 'dialogue',
      id: 'd1a4s3-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'It starts before day one. Background checks — pre-employment screening — verify that someone is who they say they are. Then NDAs and non-compete agreements set the legal boundaries. Onboarding includes security awareness training and provisioning only the access they need.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 3-3. Job rotation and mandatory vacations
    {
      type: 'dialogue',
      id: 'd1a4s3-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'During employment, two controls stand out. Job rotation prevents collusion and cross-trains staff — if you can only commit fraud from one position, rotating you out disrupts the scheme. Mandatory vacations are even sneakier — while you\'re at the beach, someone else reviews your work.',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 3-4. SoD and offboarding
    {
      type: 'dialogue',
      id: 'd1a4s3-dialogue-4',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Separation of duties ensures no single person controls an entire process. And when someone leaves — especially involuntarily — offboarding must be immediate. Revoke access FIRST, then collect the badge. Former contractors with active VPN credentials? That\'s a disaster waiting to happen.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
    },

    // 3-5. Evidence — Personnel Security Audit Findings
    {
      type: 'evidence',
      id: 'd1a4s3-evidence-1',
      title: 'Personnel Security Controls — Nexus Audit Findings',
      classification: 'CONFIDENTIAL',
      content: 'Internal audit reveals several personnel security gaps that may have enabled the insider threat.',
      speaker: 'morales',
      speakerSide: 'left',
      dialogue: 'Look at these findings, {player}. Every single one of these gaps is a textbook example of what NOT to do. The attacker exploited at least three of them.',
      leftCharacter: 'morales',
      leftExpression: 'worried',
      evidenceItems: [
        {
          label: 'Background checks',
          value: 'Last comprehensive check for jchen_dev: 3 years ago',
          highlight: true,
        },
        {
          label: 'Mandatory vacations',
          value: 'Developer team has NO mandatory vacation policy',
          highlight: true,
        },
        {
          label: 'Job rotation',
          value: 'jchen_dev has been in same role for 5 years — no rotation',
        },
        {
          label: 'Offboarding',
          value: 'Two former contractors still had active VPN credentials',
        },
        {
          label: 'Separation of duties',
          value: 'Single developer could deploy directly to production without review',
        },
      ],
    },

    // 3-6. Knowledge Check — Mandatory vacations as detective control
    {
      type: 'knowledgeCheck',
      id: 'd1a4s3-kc-1',
      question: 'Which personnel security control serves as a DETECTIVE control by allowing another employee to review a worker\'s activities during their absence?',
      options: [
        'Job rotation',
        'Background checks',
        'Mandatory vacations',
        'Separation of duties',
      ],
      correctIndex: 2,
      explanation: 'Mandatory vacations force employees to step away, allowing a replacement to perform their duties and potentially discover irregularities. Job rotation also has a detective element but is primarily about cross-training and disrupting collusion. Background checks are pre-employment (preventive). Separation of duties is a preventive control that divides responsibilities.',
      memoryHack: 'Bank Teller Safeguards: Mandatory vacation = while you\'re at the beach, someone else is watching the register. If there\'s fraud, they\'ll find it. Vacation = detective control.',
      conceptName: 'Personnel Security',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Security Awareness Training (Kai, "Fire Drill Culture")
    // ================================================================

    // 4-1. Kai introduces security awareness
    {
      type: 'dialogue',
      id: 'd1a4s4-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Personnel controls are great, but they\'re useless if people don\'t understand security. Security awareness is like "Fire Drill Culture" — everyone needs to know what to do BEFORE the emergency.',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // 4-2. Awareness vs Training vs Education
    {
      type: 'dialogue',
      id: 'd1a4s4-dialogue-2',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'There are three levels and they\'re all different. Awareness is general understanding — the fire safety posters on the wall. "Fire is hot, don\'t touch." Everyone in the organization gets this.',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // 4-3. Training level
    {
      type: 'dialogue',
      id: 'd1a4s4-dialogue-3',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Training is specific skills for specific roles — "here\'s how to use a fire extinguisher." Developers get secure coding training. Help desk staff learn to spot social engineering. It\'s targeted and practical.',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // 4-4. Education level + lesson from the breach
    {
      type: 'dialogue',
      id: 'd1a4s4-dialogue-4',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'Education is deep understanding for security professionals — a fire science degree. CISSPs, security architects, people who need to understand the "why" behind every control. The jchen_dev phishing success tells us our awareness program failed. We need regular simulated phishing, role-based training, and accountability.',
      rightCharacter: 'kai',
      rightExpression: 'serious',
    },

    // 4-5. Knowledge Check — Awareness vs Training
    {
      type: 'knowledgeCheck',
      id: 'd1a4s4-kc-1',
      question: 'What is the PRIMARY difference between security awareness and security training?',
      options: [
        'Awareness is for managers; training is for technical staff',
        'Awareness builds general understanding; training develops specific skills for job roles',
        'Training is mandatory; awareness is optional',
        'Awareness uses technology; training is classroom-based',
      ],
      correctIndex: 1,
      explanation: 'Security awareness provides a broad understanding of security principles for all employees — like knowing fire is dangerous. Security training develops specific, role-based skills — like knowing how to use a fire extinguisher. Awareness is not limited to managers, and training is not only for technical staff. Both can be mandatory, and both can use various delivery methods.',
      memoryHack: 'Fire Drill Culture: Awareness = "fire is hot, don\'t touch" (everyone). Training = "here\'s how to use this extinguisher" (specific roles). Education = "fire science degree" (security professionals).',
      conceptName: 'Security Awareness Training',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // ================================================================
    // SCENE 5 — Threat Modeling: STRIDE/PASTA/DREAD (Janet, "Crime Scene Profiling")
    // ================================================================

    // 5-1. Janet introduces threat modeling
    {
      type: 'dialogue',
      id: 'd1a4s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'Now let\'s profile our attacker systematically. Threat modeling is like "Crime Scene Profiling" — we use structured methods to think like the attacker.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
    },

    // 5-2. STRIDE explanation
    {
      type: 'dialogue',
      id: 'd1a4s5-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'STRIDE is Microsoft\'s framework. It categorizes threats into six types: Spoofing identity, Tampering with data, Repudiation of actions, Information Disclosure, Denial of Service, and Elevation of Privilege. Each maps to a specific security property being violated.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 5-3. PASTA and DREAD
    {
      type: 'dialogue',
      id: 'd1a4s5-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'PASTA — Process for Attack Simulation and Threat Analysis — is a seven-stage, risk-centric methodology. It\'s the most thorough but also the most time-consuming. DREAD is a scoring system: Damage, Reproducibility, Exploitability, Affected Users, Discoverability — each rated 1-10, then averaged for a threat severity score.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 5-4. Interactive Image — Crime Scene Profiling
    {
      type: 'interactiveImage',
      id: 'd1a4s5-interactive-1',
      title: 'Crime Scene Profiling — Threat Modeling Frameworks',
      imageType: 'exploration',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #1a1040 40%, #1f0a0a 100%)',
      conceptName: 'Threat Modeling',
      speaker: 'janet',
      dialogue: 'Explore each framework to understand how we profiled the Shadow Protocol attacker.',
      completionDialogue: 'Using all three perspectives, we\'ve built a comprehensive attacker profile. STRIDE tells us what they did, PASTA tells us how, and DREAD tells us how severe it is. That\'s the power of structured threat modeling.',
      rightCharacter: 'janet',
      rightExpression: 'serious',
      hotspots: [
        {
          id: 'stride-hotspot',
          label: 'STRIDE',
          x: 5,
          y: 15,
          width: 22,
          height: 30,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'S=Spoofing (fake identity), T=Tampering (modify data), R=Repudiation (deny actions), I=Info Disclosure (leak data), D=Denial of Service (block access), E=Elevation of Privilege (gain unauthorized access). Our attacker hit S, T, I, and E.',
          detail: 'STRIDE maps threats to violated security properties: Spoofing violates Authentication, Tampering violates Integrity, Repudiation violates Non-repudiation, Info Disclosure violates Confidentiality, DoS violates Availability, EoP violates Authorization.',
        },
        {
          id: 'pasta-hotspot',
          label: 'PASTA',
          x: 28,
          y: 15,
          width: 22,
          height: 30,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: '7-stage process: 1-Define objectives, 2-Define technical scope, 3-Decompose app, 4-Analyze threats, 5-Analyze vulnerabilities, 6-Model attacks, 7-Analyze risk & impact. Most thorough but most time-consuming.',
          detail: 'PASTA is attacker-centric and risk-focused. It simulates real attacks against the application to identify the most impactful threats. Best for complex applications with significant risk exposure.',
        },
        {
          id: 'dread-hotspot',
          label: 'DREAD',
          x: 51,
          y: 15,
          width: 22,
          height: 30,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Score each factor 1-10. Damage: 8. Reproducibility: 6. Exploitability: 7. Affected Users: 9. Discoverability: 5. Total: 35/5 = 7.0 (High).',
          detail: 'DREAD provides a quantitative risk score. Each factor is rated 1-10, summed, and divided by 5 for an average severity rating. Simple to use but can be subjective across different evaluators.',
        },
        {
          id: 'profile-hotspot',
          label: 'Attacker Profile',
          x: 74,
          y: 15,
          width: 22,
          height: 30,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Our attacker profile: sophisticated (STRIDE: S,T,I,E), methodical (PASTA stage 4-6 skills), high-impact (DREAD score: 7.0 High).',
          detail: 'Combining frameworks gives a multi-dimensional view. STRIDE categorizes the attack, PASTA maps the methodology, and DREAD quantifies severity. Together they inform both immediate response and long-term architecture improvements.',
        },
      ],
    },

    // 5-5. Knowledge Check — STRIDE categories
    {
      type: 'knowledgeCheck',
      id: 'd1a4s5-kc-1',
      question: 'In the STRIDE threat model, which category would an attacker\'s attempt to gain administrator access using a stolen service account belong to?',
      options: [
        'Spoofing',
        'Tampering',
        'Information Disclosure',
        'Elevation of Privilege',
      ],
      correctIndex: 3,
      explanation: 'Gaining administrator access represents Elevation of Privilege — obtaining capabilities beyond what was authorized. While using a stolen account involves Spoofing (faking identity), the core objective of gaining admin access is privilege escalation. Tampering involves modifying data, and Information Disclosure involves leaking it — neither captures the intent to gain higher-level access.',
      memoryHack: 'Crime Scene Profiling STRIDE: S=fake ID, T=changed evidence, R=denied being there, I=leaked files, D=blocked the exits, E=got the master key. Gaining admin access = getting the master key = Elevation of Privilege.',
      conceptName: 'Threat Modeling',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 6 — Supply Chain Risk + Third-Party Governance
    //   (Reeves, "Farm-to-Table Audit" + "Restaurant Health Inspection")
    // ================================================================

    // 6-1. Reeves introduces supply chain risk
    {
      type: 'dialogue',
      id: 'd1a4s6-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Our investigation revealed the attacker initially compromised a third-party vendor\'s system. Supply chain risk is like "Farm-to-Table" — every link in the chain is a potential point of contamination.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 6-2. Key supply chain concepts
    {
      type: 'dialogue',
      id: 'd1a4s6-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'We conduct third-party risk assessments — evaluating a vendor\'s security posture before trusting them with our data. SLAs must include security requirements, not just uptime. And right-to-audit clauses give us the ability to inspect their security controls firsthand.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 6-3. Fourth-party risk
    {
      type: 'dialogue',
      id: 'd1a4s6-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And here\'s what most people miss — fourth-party risk. Your vendor has vendors. If our cloud provider uses a subcontractor for data storage, and that subcontractor gets breached, we\'re still affected. The supply chain extends further than most organizations realize.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 6-4. Timed Decision — Vendor breach notification
    {
      type: 'timedDecision',
      id: 'd1a4s6-timed-1',
      scenario: 'Nexus\'s cloud provider reports a breach in their infrastructure. Your customer data was potentially exposed through the vendor\'s compromised system. The vendor says they\'ll handle notification.',
      timeLimit: 30,
      conceptName: 'Supply Chain Risk',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      options: [
        {
          text: 'Nexus is still responsible — verify the vendor\'s response and prepare your own notification to affected customers',
          isOptimal: true,
          feedback: 'Correct! Accountability cannot be delegated. Even though the breach occurred at the vendor level, Nexus is still accountable to its customers. You must verify the vendor\'s actions and be prepared to notify directly.',
          xpBonus: 25,
        },
        {
          text: 'Let the vendor handle it — it\'s their breach, their responsibility',
          isOptimal: false,
          feedback: 'Wrong! While the vendor is responsible for their security, YOU are accountable to YOUR customers. Accountability doesn\'t transfer with outsourcing.',
        },
        {
          text: 'Terminate the vendor contract immediately and deny any involvement',
          isOptimal: false,
          feedback: 'Terminating the contract doesn\'t absolve you of accountability for data already shared with the vendor. This response prioritizes self-interest over customer protection.',
        },
      ],
    },

    // 6-5. Knowledge Check — Accountability with outsourcing
    {
      type: 'knowledgeCheck',
      id: 'd1a4s6-kc-1',
      question: 'When an organization outsources data processing to a cloud provider, who retains ACCOUNTABILITY for protecting the data?',
      options: [
        'The organization that owns the data',
        'The cloud provider',
        'Both parties equally',
        'The regulatory authority',
      ],
      correctIndex: 0,
      explanation: 'Accountability always remains with the data owner — the organization that collected and is responsible for the data. While the cloud provider has responsibilities under the contract, the data owner is accountable to customers and regulators. Accountability cannot be transferred through outsourcing, even when responsibility is shared.',
      memoryHack: 'Farm-to-Table: The restaurant (you) is accountable if a customer gets sick — even if the contamination came from the farm (vendor). You chose the farm. Accountability never transfers.',
      conceptName: 'Third-Party Governance',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Separation of Duties + Least Privilege
    //   (Morales, "Bank Teller Safeguards")
    // ================================================================

    // 7-1. Morales reintroduces bank teller analogy
    {
      type: 'dialogue',
      id: 'd1a4s7-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Remember those Bank Teller Safeguards? Two of the most important are Separation of Duties and Least Privilege.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 7-2. SoD explanation
    {
      type: 'dialogue',
      id: 'd1a4s7-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Separation of Duties means no single person should control an entire critical process. At a bank, one teller processes the deposit, another verifies it, and a manager approves large amounts. If you need to collude with someone to commit fraud, it\'s exponentially harder.',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // 7-3. Least Privilege explanation
    {
      type: 'dialogue',
      id: 'd1a4s7-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Least Privilege means giving people ONLY the access they need to do their job — nothing more. A bank teller can access the cash drawer at their station, but not the vault, and not other tellers\' drawers. If they don\'t need it, they don\'t get it.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 7-4. Evidence — SoD Failure Root Cause
    {
      type: 'evidence',
      id: 'd1a4s7-evidence-1',
      title: 'Separation of Duties Failure — Shadow Protocol Root Cause',
      classification: 'CLASSIFIED',
      content: 'The jchen_dev account had permissions that violated both SoD and least privilege principles.',
      speaker: 'morales',
      speakerSide: 'left',
      dialogue: 'This is what made the breach possible. One account, unchecked, with the keys to the kingdom. Every line item here is a control failure.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
      evidenceItems: [
        {
          label: 'Code & Deploy',
          value: 'Could write code AND deploy to production',
          highlight: true,
        },
        {
          label: 'Database Access',
          value: 'Had read access to ALL databases, not just development',
        },
        {
          label: 'Peer Review',
          value: 'No peer review required for code commits',
          highlight: true,
        },
        {
          label: 'Logging Admin',
          value: 'Admin access to logging system (could cover tracks)',
        },
        {
          label: 'Privilege Escalation',
          value: 'Single approval for privilege escalation requests',
        },
      ],
    },

    // 7-5. Knowledge Check — SoD violation
    {
      type: 'knowledgeCheck',
      id: 'd1a4s7-kc-1',
      question: 'A developer at Nexus can write code, test it, and deploy it to production without any oversight. Which security principle is being violated?',
      options: [
        'Least privilege',
        'Separation of duties',
        'Need to know',
        'Defense in depth',
      ],
      correctIndex: 1,
      explanation: 'Separation of duties requires that no single person controls an entire critical process. Writing, testing, and deploying code should involve different people to prevent unauthorized changes. Least privilege is about minimizing access rights — related but distinct. Need to know restricts information access. Defense in depth involves layered controls.',
      memoryHack: 'Bank Teller Safeguards: SoD = no one person controls the whole transaction. Writing + testing + deploying = one person controls the whole process. That\'s an SoD violation.',
      conceptName: 'Separation of Duties',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Investigation Types + Import/Export Controls
    //   (Morales + Reeves, "Court System Tiers" + "Customs Checkpoint")
    // ================================================================

    // 8-1. Morales introduces investigation types
    {
      type: 'dialogue',
      id: 'd1a4s8-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'With the insider angle, we need to understand what kind of investigation this is. Think of it like "Court System Tiers" — different courts, different rules, different standards of proof.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 8-2. Four investigation types
    {
      type: 'dialogue',
      id: 'd1a4s8-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'There are four types. Administrative — internal HR matters with the lowest burden of proof. Civil — lawsuits between parties. Criminal — law enforcement involvement with the highest burden: beyond reasonable doubt. And Regulatory — government compliance checks with their own standards.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 8-3. Reeves transitions to export controls
    {
      type: 'dialogue',
      id: 'd1a4s8-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And since our attacker may be exfiltrating data internationally, we need to understand import/export controls — like a "Customs Checkpoint." You can\'t just ship anything anywhere.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 8-4. Export control details
    {
      type: 'dialogue',
      id: 'd1a4s8-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'EAR — Export Administration Regulations — covers commercial items with potential military use. ITAR — International Traffic in Arms Regulations — covers defense-related articles and services. The Wassenaar Arrangement is a multilateral export control regime for dual-use goods. Fun fact: strong encryption was once classified as a munition.',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 8-5. Visual Aid — Investigation Types Table
    {
      type: 'visualAid',
      id: 'd1a4s8-visual-1',
      title: 'Investigation Types — Burden of Proof',
      aidType: 'table',
      headers: ['Type', 'Burden of Proof', 'Example'],
      rows: [
        ['Administrative', 'Preponderance of evidence (>50%)', 'Employee policy violation'],
        ['Civil', 'Preponderance of evidence (>50%)', 'Breach of contract lawsuit'],
        ['Criminal', 'Beyond reasonable doubt (~99%)', 'Prosecution for computer fraud'],
        ['Regulatory', 'Substantial evidence', 'HIPAA compliance audit'],
      ],
      speaker: 'morales',
      dialogue: 'Notice the criminal bar is the highest — because someone\'s freedom is at stake. For our Shadow Protocol case, we might be dealing with all four types simultaneously.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 8-6. Knowledge Check — Burden of proof for criminal
    {
      type: 'knowledgeCheck',
      id: 'd1a4s8-kc-1',
      question: 'An employee is suspected of stealing company trade secrets for a competitor. If the organization wants to pursue criminal charges, what standard of proof must be met?',
      options: [
        'Preponderance of evidence',
        'Clear and convincing evidence',
        'Beyond a reasonable doubt',
        'Substantial evidence',
      ],
      correctIndex: 2,
      explanation: 'Criminal prosecution requires the highest standard of proof: beyond a reasonable doubt (approximately 99% certainty). Preponderance of evidence (>50%) applies to civil and administrative cases. Clear and convincing evidence is an intermediate standard used in some civil proceedings. Substantial evidence is used in regulatory contexts.',
      memoryHack: 'Court System Tiers: Admin/Civil = more likely than not (>50%). Criminal = beyond reasonable doubt (~99%). Criminal cases = highest bar because freedom is at stake.',
      conceptName: 'Investigation Types',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Frameworks Deep Dive: ISO/COBIT/SABSA
    //   (Janet, "Tool Belt Selection")
    // ================================================================

    // 9-1. Janet introduces frameworks
    {
      type: 'dialogue',
      id: 'd1a4s9-dialogue-1',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'We\'ve mentioned frameworks before, but let me give you a deeper look. Choosing frameworks is like "Tool Belt Selection" — different tools for different jobs.',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },

    // 9-2. ISO 27001/27002
    {
      type: 'dialogue',
      id: 'd1a4s9-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'ISO 27001 and 27002 are the gold standard for Information Security Management Systems. Think of 27001 as the requirements list — WHAT controls do you need? And 27002 as the instruction manual — HERE\'S how to implement them. You can get certified against 27001.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 9-3. COBIT
    {
      type: 'dialogue',
      id: 'd1a4s9-dialogue-3',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'COBIT is ISACA\'s IT governance framework. It bridges the gap between business goals and IT operations. Six principles: Provide Stakeholder Value, Holistic Approach, Dynamic Governance, Governance is distinct from Management, Tailored to the Enterprise, and End-to-End coverage.',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // 9-4. SABSA
    {
      type: 'dialogue',
      id: 'd1a4s9-dialogue-4',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'SABSA — the Sherwood Applied Business Security Architecture — is the architectural blueprint. It\'s business-driven and layered: Business Context at the top, then Information, Systems, Technology, and Physical at the bottom. It maps security controls to business requirements at every layer.',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 9-5. Interactive Image — Framework Comparison
    {
      type: 'interactiveImage',
      id: 'd1a4s9-interactive-1',
      title: 'Tool Belt Selection — Security Frameworks Comparison',
      imageType: 'comparison',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #0a2818 40%, #0d1f3c 100%)',
      conceptName: 'Security Frameworks',
      speaker: 'janet',
      dialogue: 'Explore each framework to see when and why you\'d reach for it.',
      completionDialogue: 'Remember, most mature organizations don\'t pick just one — they combine frameworks. ISO for compliance, COBIT for governance, SABSA for architecture. Knowing which tool to reach for is what separates a CISSP from a generalist.',
      rightCharacter: 'janet',
      rightExpression: 'smile',
      hotspots: [
        {
          id: 'iso-hotspot',
          label: 'ISO 27001/27002',
          x: 5,
          y: 20,
          width: 22,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'ISO 27001/27002 — the Swiss Army knife. 27001 = "what controls do you NEED?" 27002 = "HERE\'S how to implement them." Certification available. Most internationally recognized.',
          detail: 'ISO 27001 specifies requirements for establishing, implementing, maintaining, and continually improving an ISMS. ISO 27002 provides best practice recommendations on information security controls.',
        },
        {
          id: 'cobit-hotspot',
          label: 'COBIT',
          x: 28,
          y: 20,
          width: 22,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'COBIT — the governance wrench. Bridges business goals and IT. 6 principles with stakeholder value at the center. Best for IT governance alignment.',
          detail: 'COBIT is designed to be the integrative framework for IT governance. It helps organizations develop, organize, and implement strategies around information management and governance.',
        },
        {
          id: 'sabsa-hotspot',
          label: 'SABSA',
          x: 51,
          y: 20,
          width: 22,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'SABSA — the architectural blueprint tool. Maps security to business requirements. 5 layers from business context to physical security. Best for enterprise architecture.',
          detail: 'SABSA provides a framework for developing risk-driven enterprise security architectures that are traceable to business requirements. Each layer answers: What? Why? How? Who? Where? When?',
        },
        {
          id: 'comparison-hotspot',
          label: 'When to Use Which',
          x: 74,
          y: 20,
          width: 22,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Which to use? ISO = standard compliance. COBIT = governance alignment. SABSA = architecture design. Most orgs use MULTIPLE frameworks together.',
          detail: 'On the CISSP exam, know that ISO is for compliance and certification, COBIT aligns IT with business, and SABSA drives architecture. The best answer often involves using the right framework for the specific challenge.',
        },
      ],
    },

    // 9-6. Knowledge Check — ISO 27002 for implementation guidance
    {
      type: 'knowledgeCheck',
      id: 'd1a4s9-kc-1',
      question: 'An organization needs a framework that provides specific implementation guidance for information security controls. Which would be MOST appropriate?',
      options: [
        'ISO 27001',
        'ISO 27002',
        'COBIT',
        'SABSA',
      ],
      correctIndex: 1,
      explanation: 'ISO 27002 provides implementation guidance — the "how to" for information security controls. ISO 27001 defines requirements (the "what") but not detailed implementation. COBIT focuses on IT governance alignment, not specific security control implementation. SABSA is an architecture framework, not an implementation guide.',
      memoryHack: 'Tool Belt: ISO 27001 = the requirement list (WHAT you need). ISO 27002 = the instruction manual (HOW to do it). Need implementation guidance? Reach for 27002.',
      conceptName: 'Security Frameworks',
      speaker: 'janet',
      rightCharacter: 'janet',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Transborder Data + M&A Security
    //   (Reeves, "International Shipping Lanes" + "House Merger Inspection")
    // ================================================================

    // 10-1. Reeves introduces transborder data flow
    {
      type: 'dialogue',
      id: 'd1a4s10-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'We\'ve confirmed the attacker exfiltrated data to servers overseas. Transborder data flow is like "International Shipping Lanes" — you can\'t just ship anything anywhere.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 10-2. Key transborder concepts
    {
      type: 'dialogue',
      id: 'd1a4s10-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Some countries require data localization — data about their citizens must stay within their borders. The EU-US Data Privacy Framework replaced Privacy Shield for transatlantic transfers. Standard Contractual Clauses provide a legal mechanism for cross-border transfers, and Binding Corporate Rules let multinationals move data within their own global operations.',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 10-3. M&A introduction
    {
      type: 'dialogue',
      id: 'd1a4s10-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And there\'s another complication. Nexus is in the process of acquiring a smaller security firm. Mergers and acquisitions create unique security challenges — think of it like a "House Merger Inspection." Before you buy the house, you check for structural damage, hidden mold, and code violations.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 10-4. M&A due diligence details
    {
      type: 'dialogue',
      id: 'd1a4s10-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Security due diligence in M&A means evaluating the target company\'s security posture, data classification practices, compliance status, existing vulnerabilities, and personnel risks. Everything you find affects the deal\'s value and terms.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 10-5. Evidence — Transborder Exfiltration Map
    {
      type: 'evidence',
      id: 'd1a4s10-evidence-1',
      title: 'Transborder Data Flow — Shadow Protocol Exfiltration',
      classification: 'TOP SECRET',
      content: 'Data exfiltration mapped to servers in 3 jurisdictions with different privacy requirements.',
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue: 'The legal implications are staggering. We\'re now looking at regulatory notification requirements in at least two jurisdictions, plus whatever\'s behind that proxy.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
      evidenceItems: [
        {
          label: 'Destination 1',
          value: 'Frankfurt, Germany — GDPR applies',
          highlight: true,
        },
        {
          label: 'Destination 2',
          value: 'Singapore — PDPA applies',
        },
        {
          label: 'Destination 3',
          value: 'Undetermined proxy — jurisdiction unknown',
          highlight: true,
        },
        {
          label: 'Data types',
          value: 'Customer PII, financial records, proprietary algorithms',
        },
        {
          label: 'Legal exposure',
          value: 'Multi-jurisdiction regulatory notification required',
        },
      ],
    },

    // 10-6. Think Like a Manager — M&A due diligence
    {
      type: 'thinkLikeManager',
      id: 'd1a4s10-tlatm-1',
      scenario: 'During the acquisition due diligence, you discover the target company has no formal security policies, uses unencrypted databases, and has had two unreported breaches in the past year.',
      question: 'As a security advisor, what is your MOST important recommendation?',
      options: [
        'Cancel the acquisition immediately — the risks are too high',
        'Proceed with the acquisition and fix the issues after closing',
        'Document all findings as risk factors and recommend either remediation requirements or adjusting the acquisition terms',
        'Report the unreported breaches to regulators before proceeding',
      ],
      correctIndex: 2,
      explanation: 'M&A due diligence requires thorough documentation of security risks. The findings should inform the acquisition terms — not necessarily kill the deal (option A) or be ignored (option B). Reporting to regulators (option D) may be premature without full assessment and could create legal complications.',
      managerInsight: 'CISSP expects you to think holistically about M&A. Security issues are business risks that affect valuation. The right answer is usually: document, quantify, and let business leaders make informed decisions with full risk transparency.',
      conceptName: 'M&A Security',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 11 — Employee Duress + NCA/NDA + Risk Communication
    //   (Morales + Reeves, "Silent Alarm" + "Pinky Promise Levels"
    //    + "Weather Alert System")
    // ================================================================

    // 11-1. Morales introduces employee duress
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Before we wrap up, let\'s cover something critical — what happens when an employee is under duress? Think "Silent Alarm."',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 11-2. Duress concepts
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Just like a bank teller can press a silent alarm during a robbery, employees need duress codes or signals. If someone is being coerced into providing access — gun to their head, threats to their family — there has to be a way to signal security WITHOUT tipping off the attacker. Comply on the surface, alert underneath.',
      leftCharacter: 'morales',
      leftExpression: 'worried',
    },

    // 11-3. Procedures for duress
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Organizations need documented procedures for coerced access — a special PIN that logs in but silently triggers an alert, a code phrase on a phone call, or even specific physical behaviors caught on camera. Employee safety always comes first.',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
    },

    // 11-4. Reeves introduces NCA/NDA
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'And let\'s formalize the legal protections. NCAs and NDAs are like "Pinky Promise Levels" — except with legal teeth.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 11-5. NDA and NCA details
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-5',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'An NDA — Non-Disclosure Agreement — says you can\'t share company secrets. An NCA — Non-Compete Agreement — says you can\'t work for competitors for a specified period after leaving. Both protect the organization, but they have legal limits. Courts won\'t enforce overly broad NCAs that prevent someone from earning a living.',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 11-6. Risk communication introduction
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-6',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Finally, effective risk communication. Think of it as a "Weather Alert System" — different stakeholders need different levels of detail. You don\'t give a meteorology lecture to someone who just needs to know whether to carry an umbrella.',
      leftCharacter: 'reeves',
      leftExpression: 'smile',
    },

    // 11-7. Risk communication tiers
    {
      type: 'dialogue',
      id: 'd1a4s11-dialogue-7',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Board and executives need the high-level risk posture and business impact — "a storm is coming, here\'s the financial exposure." IT management needs technical risk details and control recommendations — "wind speeds, pressure systems, evacuation routes." End users need simple, actionable guidance — "carry an umbrella, avoid the coast." And regulators need compliance status and incident reports — "here\'s our official weather record."',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 11-8. Knowledge Check — Employee duress mechanism
    {
      type: 'knowledgeCheck',
      id: 'd1a4s11-kc-1',
      question: 'An employee is being coerced by an attacker to provide access credentials under threat of physical harm. What security mechanism should the organization have in place?',
      options: [
        'Two-factor authentication that blocks all access attempts',
        'A duress alarm or code that silently alerts security while appearing to comply',
        'Automatic account lockout after one failed attempt',
        'A policy requiring employees to refuse all requests under any circumstances',
      ],
      correctIndex: 1,
      explanation: 'A duress alarm or code allows the employee to appear to cooperate while silently alerting security personnel. Two-factor authentication blocking all access could escalate the threat to the employee. Automatic lockout doesn\'t address the coercion. Requiring refusal under all circumstances puts the employee in danger — employee safety must come first.',
      memoryHack: 'Silent Alarm: Just like a bank teller can trigger a silent alarm during a robbery, employees need a way to signal duress WITHOUT alerting the attacker. Comply on the surface, alert security underneath.',
      conceptName: 'Employee Duress',
      speaker: 'morales',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 12 — Boss Battle Prep Wrap-up
    // ================================================================

    // 12-1. Reeves — overall assessment
    {
      type: 'dialogue',
      id: 'd1a4s12-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'This has been the most intense phase of our investigation. {player}, you\'ve demonstrated exceptional understanding of security risk management.',
      leftCharacter: 'reeves',
      leftExpression: 'smile',
    },

    // 12-2. Janet — recap of concepts
    {
      type: 'dialogue',
      id: 'd1a4s12-dialogue-2',
      speaker: 'janet',
      speakerSide: 'right',
      text: 'From BCP activation to threat modeling, from supply chain risk to personnel security — you\'ve seen how all these concepts work together in a real crisis.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'janet',
      rightExpression: 'smile',
    },

    // 12-3. Morales — stakes and motivation
    {
      type: 'dialogue',
      id: 'd1a4s12-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'And we\'re not done. The insider is still out there. But before we can take them down, you need to prove you\'ve mastered everything we\'ve covered.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // 12-4. Kai — boss battle introduction
    {
      type: 'dialogue',
      id: 'd1a4s12-dialogue-4',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'That means it\'s time for the Boss Battle — a comprehensive assessment of everything from Domain 1. All 41 concepts. Are you ready?',
      leftCharacter: 'morales',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'surprised',
    },

    // 12-5. Player choice — confidence or review
    {
      type: 'dialogue',
      id: 'd1a4s12-dialogue-5',
      speaker: 'player',
      speakerSide: 'right',
      text: 'This is it. The culmination of everything I\'ve learned about Security and Risk Management.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
      choices: [
        {
          text: 'I\'ve studied every concept, every analogy, every memory hack. Bring it on.',
          response: 'The team looks at each other with approval. Reeves nods. "That\'s the confidence of someone who\'s done the work. Let\'s see if it holds up under pressure."',
          xpBonus: 15,
        },
        {
          text: 'Can I review the Reference Library one more time before the battle?',
          response: 'Janet smiles. "Smart move. Review your weak topics and come back when you\'re ready. The Boss Battle will test everything — preparation is key."',
          xpBonus: 10,
        },
      ],
    },
  ],
};
