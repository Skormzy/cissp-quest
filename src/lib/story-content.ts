// CISSP Quest — Meridian Global Breach story content
// Domain 1 fully authored (15 scenes) + Domains 2-8 skeletons

import {
  DomainChapter,
  StoryScene,
  LOCATION_GRADIENTS_V2,
} from './story-types-v2';

// ─── Domain 1: Security and Risk Management — Toronto ────────────────────────

const TORONTO_BG = LOCATION_GRADIENTS_V2['toronto'];

const domain1Scenes: StoryScene[] = [
  // ── Scene 1: {playerName} arrives at Meridian Global Toronto HQ ─────────────────
  {
    id: 'd1-s01',
    type: 'narration',
    location: 'Toronto',
    background: TORONTO_BG,
    speaker: 'narrator',
    dialogue:
      'Meridian Global HQ — Bay Street Tower, Toronto. 06:42 local time. {playerName}, senior consultant at Sentinel Dynamics, has just landed on a red-eye from Vancouver. The call came at midnight: Meridian — a Fortune 500 financial services firm — has been breached.',
  },

  // ── Scene 2: Meet Dr. Tanaka ─────────────────────────────────────────────
  {
    id: 'd1-s02',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      '{playerName}. Thank you for coming so quickly. I\'m Dr. Keiko Tanaka — I lead risk management here. I wish our first meeting were under better circumstances. Meridian was breached thirty-six hours ago. Someone got in, accessed sensitive client data, and nearly erased the evidence trail. We\'re still piecing it together.',
  },

  // ── Scene 3: Breach overview — risk management framing ───────────────────
  {
    id: 'd1-s03',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    speakerExpression: 'serious',
    dialogue:
      'The CEO\'s first instinct was to call the press team. His second was to blame IT. Both were wrong. A breach is a risk materialization event — and the first priority is never optics. It\'s understanding what happened, stopping it from spreading, and rebuilding trust from the foundation up. That\'s risk management.',
  },

  // ── Scene 4: Knowledge check — CEO's first priority ──────────────────────
  {
    id: 'd1-s04',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Before we go further — I want to see how you think. Put yourself in the CEO\'s chair. The breach just hit. What is the single most important first step?',
    knowledgeCheck: {
      question:
        'Meridian\'s CEO has just been notified of a major data breach. What should be the FIRST priority?',
      options: [
        'Issue a public statement to control the news cycle and protect the share price',
        'Activate the incident response plan and contain the breach to prevent further damage',
        'Immediately fire the CISO to demonstrate accountability to the board',
        'Conduct a full forensic investigation to determine exactly how the breach occurred',
      ],
      correctIndex: 1,
      explanation:
        'Containment comes first — every minute the breach is active, more data is at risk. PR, accountability decisions, and forensic investigations all follow containment. The IR plan exists precisely so leadership does not have to improvise in a crisis.',
      memoryHack:
        'Think Like a Manager: Stop the bleeding FIRST. A surgeon doesn\'t hold a press conference while the patient is still on the table.',
    },
  },

  // ── Scene 5: CIA Triad — bank vault analogy ──────────────────────────────
  {
    id: 'd1-s05',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    speakerExpression: 'teaching',
    dialogue:
      'Everything in security — and I mean everything — comes back to three properties. Think of your data as sitting inside a bank vault. The vault has three locks. The first lock keeps out prying eyes: Confidentiality. The second lock ensures nothing inside gets tampered with: Integrity. The third lock ensures the door opens when YOU need it — not just when attackers want it closed: Availability. Remove any lock, and the vault fails.',
    memoryHack: {
      title: 'CIA Triad — Three Vault Locks',
      body: 'CIA = Confidentiality Is A triple lock.\n\nC = Confidentiality — locks the door. Only authorized eyes see what\'s inside.\n\nI = Integrity — ensures the contents aren\'t tampered with. What went in is what comes out.\n\nA = Availability — the door opens when YOU need it. Authorized users always get access.\n\nIf the attacker READ data → Confidentiality broken.\nIf the attacker CHANGED data → Integrity broken.\nIf the attacker DISABLED a system → Availability broken.\nMeridian had all three locks picked.',
    },
  },

  // ── Scene 6: Risk Management Framework — GRC analogy ─────────────────────
  {
    id: 'd1-s06',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    speakerExpression: 'teaching',
    dialogue:
      'Let me show you Meridian\'s risk register — our master list of known threats and how we manage them. But first, a frame. GRC: Governance, Risk, Compliance. Think of it as the company\'s immune system. Governance is the brain — it sets the rules and makes the decisions. Risk is the immune cell army — constantly scanning for threats. Compliance is the antibodies — verifying that the rules are actually being followed. A healthy immune system needs all three. Meridian\'s was compromised.',
  },

  // ── Scene 7: Risk register evidence ──────────────────────────────────────
  {
    id: 'd1-s07',
    type: 'evidence',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'This is the Meridian risk register. RISK-004 was flagged eight months ago. MFA was approved. Budgeted. And never deployed. Due diligence done; due care skipped entirely. That gap is how we got here.',
  },

  // ── Scene 8: Risk treatment choice ───────────────────────────────────────
  {
    id: 'd1-s08',
    type: 'choice',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Meridian\'s CISO is asking: what risk treatment should we apply to the legacy payroll system? It runs on a platform that can\'t be patched — it\'s fifteen years old and the vendor is gone. It processes $2.4 billion in payroll annually. We can\'t take it offline.',
    choices: [
      {
        text: 'Accept the risk — document it and move on since we cannot patch it.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Acceptance is sometimes valid — but only after evaluating all other options. For a $2.4B system with a known vulnerability, blind acceptance without compensating controls is negligent. The CISO would face serious liability if this became the breach vector.',
      },
      {
        text: 'Transfer the risk — obtain cyber insurance to cover potential losses.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Transfer (insurance) shifts financial exposure but does not reduce the actual risk. A breach still happens — you just recover some money afterward. For an unpatched critical system, transfer alone is insufficient.',
      },
      {
        text: 'Mitigate the risk — add compensating controls: network isolation, privileged access monitoring, and enhanced logging.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the manager\'s answer. When you cannot patch or decommission, you build a moat around the system. Network segmentation limits blast radius. Privileged access monitoring catches abuse. Enhanced logging ensures you detect and respond quickly. Mitigate first, then document the residual risk.',
      },
      {
        text: 'Avoid the risk — shut down the legacy system immediately.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Avoidance eliminates risk by eliminating the activity — but shutting down a $2.4B payroll system "immediately" would be catastrophic to the business. Avoidance is only viable when the cost of the control exceeds the value of the asset, or a replacement is ready. Here, neither applies.',
      },
    ],
  },

  // ── Scene 9: ALE calculation + Ghost Holloway first mention ──────────────
  {
    id: 'd1-s09',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'The board wants a number. They always want a number. So let\'s give them one. If the payroll system is compromised — asset value $8 million, exposure factor 50%, estimated occurrence once every two years — the ALE is two million dollars per year. That\'s your budget ceiling for controls. Spend less than $2M annually to protect it, and you\'re making a rational business decision. Spend more, and you\'re overcontrolling.',
    knowledgeCheck: {
      question:
        'An asset is valued at $8,000,000. The Exposure Factor for a specific threat is 50%. The Annual Rate of Occurrence is 0.5 (once every two years). What is the Annualized Loss Expectancy (ALE)?',
      options: [
        '$4,000,000',
        '$2,000,000',
        '$8,000,000',
        '$1,000,000',
      ],
      correctIndex: 1,
      explanation:
        'Step 1 — SLE = Asset Value × Exposure Factor = $8,000,000 × 0.50 = $4,000,000. Step 2 — ALE = SLE × ARO = $4,000,000 × 0.5 = $2,000,000. The ALE is the expected annual cost if this risk materializes.',
      memoryHack:
        'ALE = ARO × SLE. Work inside out: Single Loss first (SLE = AV × EF), then annualize (ALE = SLE × ARO). Think "Single, then Annual."',
    },
  },

  // ── Scene 10: Threat modeling — Ghost Holloway in access logs ────────────
  {
    id: 'd1-s10',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Something else caught my eye in the access logs. An account — username "gh_dev" — queried the client data vault at 2:47 AM on the night of the breach. No ticket. No change request. No business justification. The account belongs to a developer named Ghost Holloway. He\'s been with Meridian for three years. Excellent performance reviews. I flagged it to the CISO but nothing came of it. Now I\'m flagging it to you.',
  },

  // ── Scene 11: Security policies and frameworks ────────────────────────────
  {
    id: 'd1-s11',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Let me show you how Meridian\'s security documentation is structured. Think of it like a city. At the top: the Constitution — that\'s our Security Policy. It says WHAT must be protected. Below that: Building Codes — our Standards. They say HOW it gets done: AES-256 for data at rest, MFA for privileged accounts. Below that: Construction Manuals — our Procedures. Step-by-step: how to provision an account, how to respond to an incident. And at the bottom: Suggestions — Guidelines. Recommended but not mandatory. The policy was sound. The procedure for MFA rollout existed. Nobody followed it.',
  },

  // ── Scene 12: BCP/DRP basics ─────────────────────────────────────────────
  {
    id: 'd1-s12',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'One more thing before we get to the hard stuff. The board will ask about continuity. Can Meridian keep operating if this gets worse? That\'s Business Continuity Planning — BCP. And if we lose systems entirely, how do we recover? That\'s Disaster Recovery Planning — DRP. BCP is the question "can we keep the lights on?" DRP is the question "can we rebuild?" The answer to both depends on two metrics: RTO — how long can we be down? — and RPO — how much data can we afford to lose? Meridian\'s RTO for the payroll system is four hours. Their RPO is fifteen minutes. That drives every backup and failover decision they make.',
  },

  // ── Scene 13: Types of Law — memory hack overlay ─────────────────────────
  {
    id: 'd1-s13',
    type: 'memory_hack',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'The breach will have legal implications across multiple frameworks. You need to know the four types of law and what each one means for Meridian.',
    memoryHack: {
      title: 'Types of Law — "CCAREful"',
      body: 'Four categories of law matter in information security:\n\n🔴 Criminal Law — the state prosecutes offenders. Penalties include jail time. Applies when someone commits computer fraud, unauthorized access, or theft. "The government vs. the hacker."\n\n🔵 Civil Law — private parties sue each other. Damages are financial. Applies when clients sue Meridian for negligence. "Meridian vs. affected customers."\n\n🟡 Administrative/Regulatory Law — government agencies set rules and impose fines. GDPR, HIPAA, SOX. "The regulator vs. the company."\n\nMemory Hack — CCAREful:\n\nCriminal Courts Are Really Exhausting\n\nC = Criminal, C = Civil, A = Administrative, R = Regulatory, E = Enforcement.\n\nFor the CISSP exam: Criminal requires proof beyond reasonable doubt (highest bar). Civil requires preponderance of evidence (more likely than not).',
    },
  },

  // ── Scene 14: Ethics and intellectual property ────────────────────────────
  {
    id: 'd1-s14',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Meridian holds significant intellectual property: proprietary trading algorithms, client analysis models, internal process documentation. IP protection is part of Domain 1. Copyright protects expressions — our documentation, code. Trade secrets protect methods we keep confidential — our algorithms. Patents protect inventions. And trademarks protect brand identifiers. The attacker didn\'t just steal data — they potentially stole IP. That changes the legal exposure significantly.',
  },

  // ── Scene 15: TLATM challenge — governance decision ──────────────────────
  {
    id: 'd1-s15',
    type: 'tlatm',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Final test before we move on. Think Like a Manager. This is the kind of decision that lands on a CISO\'s desk after a breach.',
    choices: [
      {
        text: 'Mandate immediate MFA across all systems, regardless of cost or disruption, to prevent any future credential-based attacks.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Well-intentioned but unmanageable. "Regardless of cost or disruption" is not a governance stance — it\'s a panic response. Good governance balances security improvement with operational continuity. You mandate MFA with a phased rollout, prioritizing privileged accounts first.',
      },
      {
        text: 'Conduct a risk-prioritized security improvement program: MFA on privileged accounts within 30 days, all accounts within 90, with a funded remediation roadmap approved by the board.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the governance answer. It\'s risk-prioritized (highest risk accounts first), time-bound, funded, and board-approved. This is how a mature security program operates — not in crisis mode, but in structured improvement mode. Dr. Tanaka nods. "Now you\'re thinking like a CISO."',
      },
      {
        text: 'Wait for the forensic investigation to complete before making any security changes to avoid disturbing potential evidence.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Preservation of evidence matters, but it doesn\'t override the need to stop ongoing risk. Forensics can be conducted in parallel with remediation. Waiting to improve security while the attacker may still have access is not a defensible position.',
      },
      {
        text: 'Delegate the security improvement decisions to the IT department and focus executive attention on client communications.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'Delegation of security improvement decisions — especially post-breach — is a governance failure. The board and executive team must own security direction. IT implements, but strategy is an executive responsibility.',
      },
    ],
  },

  // ── Scene 16: Domain debrief + XP reward + teaser ───────────────────────
  {
    id: 'd1-s16',
    type: 'dialogue',
    location: 'Toronto',
    background: TORONTO_BG,
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'You\'ve done well, {playerName}. Today you learned the CIA Triad — the three vault locks of security. Risk management: ALE calculations, risk treatment options, GRC as the corporate immune system. Security governance: policy hierarchy from constitution to suggestions. BCP and DRP fundamentals. Legal frameworks and IP protection. And the Think Like a Manager lens that the CISSP exam demands. Tomorrow you fly to London. Priya Sharma — Meridian\'s CISO — needs you to assess the data classification failure that made this breach possible. And keep Ghost Holloway in mind. That access log anomaly bothers me.',
    xpReward: 500,
  },
];

// ─── Domains 2-8: Narrative Foundation Skeletons ─────────────────────────────

const domain2Scenes: StoryScene[] = [
  {
    id: 'd2-s01',
    type: 'narration',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global EMEA HQ — Canary Wharf, London. Priya Sharma, CISO, meets {playerName} in the data governance war room. Half of Meridian\'s client data was misclassified as "Internal" when it should have been "Restricted." That misclassification is why the attacker could exfiltrate it without triggering a single DLP alert.',
  },
  {
    id: 'd2-s02',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      '{playerName}. I\'m Priya Sharma. The breach in Toronto was possible because nobody here enforced proper data classification. We\'ve had a classification policy for three years. What we didn\'t have was a data owner who actually reviewed classification assignments. The data owners signed off without reading the documents. That\'s where Asset Security breaks down.',
  },
  {
    id: 'd2-s03',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'Data classification isn\'t just labeling — it\'s the foundation of every protection decision. Restricted data gets encrypted at rest and in transit. Confidential data requires need-to-know access controls. Internal data stays off public networks. Public data can live anywhere. When an attacker sees "Internal" on a file containing 50,000 client records, the DLP system waves it through. Classification failure creates invisible doors.',
    knowledgeCheck: {
      question:
        'Who is ultimately accountable for determining the correct classification level of organizational data?',
      options: [
        'The data custodian who manages storage systems',
        'The IT security team who implements DLP controls',
        'The data owner — typically a senior business manager',
        'The compliance officer who conducts audits',
      ],
      correctIndex: 2,
      explanation:
        'The data owner is the senior business manager accountable for the data\'s value, classification, and protection requirements. The custodian implements the owner\'s decisions; the security team enforces controls. Accountability stays with the business owner.',
      memoryHack:
        'OCU hierarchy: Owner decides, Custodian does, User uses. The buck for classification stops with the Owner — the executive who understands the data\'s business value.',
    },
  },
  {
    id: 'd2-s04',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'The attacker didn\'t just steal data — they stole data in all three states. Data at rest on the archive servers: encrypted at AES-256, but they had the keys because they had privileged credentials. Data in transit across the API layer: intercepted because TLS certificates hadn\'t been renewed and the connection silently downgraded to an insecure version. And data in use — actively being processed in the fraud detection pipeline — grabbed from memory using a kernel exploit. Three states, three failures.',
  },
  {
    id: 'd2-s06',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'Data lifecycle is the other gap. We retain client financial records for seven years per regulation — fine. But we also still have backup tapes from eleven years ago that nobody authorized for destruction. Those tapes weren\'t in scope for the DLP system. The attacker found them in a secondary storage archive and exfiltrated historical client records that should have been destroyed years ago. Retention without disposal discipline is a liability, not a safety net.',
  },
  {
    id: 'd2-s07',
    type: 'memory_hack',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    speaker: 'narrator',
    dialogue: 'Memory Hack: Data Lifecycle',
    memoryHack: {
      title: 'CREATE — USE — ARCHIVE — DESTROY',
      body: 'Every piece of data moves through four phases: Created, Used (shared and processed), Archived (retained per policy), then Destroyed (securely wiped). Security controls differ by phase. The breach hit all four — stolen at creation, intercepted in use, grabbed from archive, and old destruction records proved disposal never happened. Map your controls to the lifecycle, not just the current state.',
    },
    xpReward: 50,
  },
  {
    id: 'd2-s08',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'What about secure disposal? If those tapes had been destroyed properly, this wouldn\'t have been possible.',
  },
  {
    id: 'd2-s09',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'Exactly right. Media sanitization has three levels: clearing — overwriting with non-sensitive data, readable by the same media type; purging — degaussing or cryptographic erasure, media can potentially be reused; and destruction — physical shredding or incineration, no recovery possible. For those old tapes? Purging was the minimum. We needed destruction. The data classification said Restricted. That means destruction. Someone cut corners.',
    knowledgeCheck: {
      question:
        'Meridian needs to decommission old backup tapes containing Restricted client data. The tapes cannot be reused. Which sanitization method is appropriate?',
      options: [
        'Clearing — overwrite with random data patterns',
        'Purging — degauss to remove magnetic charge',
        'Destruction — physically shred or incinerate the media',
        'Formatting — perform a full disk format',
      ],
      correctIndex: 2,
      explanation:
        'Restricted data on media that will not be reused requires destruction — physical shredding, incineration, or disintegration. Clearing only removes logical data (recoverable). Purging removes magnetic data but leaves the physical media potentially reusable. Formatting is not a security sanitization method.',
      memoryHack:
        'The three sanitization levels form a security ladder: Clearing (lowest — same reader can recover), Purging (middle — degauss or crypto-erase), Destruction (top — nothing survives). Match the level to the data classification: higher classification = higher level required.',
    },
  },
  {
    id: 'd2-s10',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'One more thing before Munich. Asset inventory. We found a server in the Singapore data center that wasn\'t in the asset register. Not unauthorized — someone forgot to register it during a rushed deployment. It was running an unpatched OS for eighteen months because it had no owner, no patch schedule, no monitoring. Ghost exploited it as a pivot point. You cannot protect what you don\'t know you own. Every asset needs an owner. Every owner has accountability.',
  },
  {
    id: 'd2-s05',
    type: 'dialogue',
    location: 'London',
    background: LOCATION_GRADIENTS_V2['london'],
    leftNPC: 'sharma',
    rightNPC: 'alex',
    speaker: 'sharma',
    dialogue:
      'The investigation is pointing east. The data destruction pattern — the way they overwrote logs — matches a technique documented in a Munich incident two years ago. The architecture team at our Munich office may have seen something similar. I\'m sending you there next. Watch your back, {playerName}. Ghost Holloway has contacts in Munich.',
    xpReward: 300,
  },
];

const domain3Scenes: StoryScene[] = [
  {
    id: 'd3-s01',
    type: 'narration',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global Technology Center — Munich. The architecture team runs Meridian\'s security model implementation. Elena Vasquez, legal counsel, is already on-site. Priya Sharma was right: the Munich team saw this attack pattern before — against a competitor. Two years ago. They filed a report. It was archived and never acted on.',
  },
  {
    id: 'd3-s02',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'I\'m Elena Vasquez — legal. I\'m here because what the Munich team is about to show you has litigation implications. The attacker exploited a covert channel in the security model implementation. Something that should be impossible according to Bell-LaPadula. Either the model was implemented incorrectly, or someone intentionally introduced the flaw. Both are bad. One is a crime.',
  },
  {
    id: 'd3-s03',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The Bell-LaPadula model enforces confidentiality with two rules: no read up — a subject cannot read data above their clearance — and no write down — a subject cannot write classified data to a lower-classified location. The attacker found a covert timing channel that let them read above their level without the access control system noticing. The channel used CPU timing variations to encode and transmit data. Elegant. And whoever built it knew the architecture intimately.',
    knowledgeCheck: {
      question:
        'Which security model\'s "no read up, no write down" rules were violated by a lower-clearance process reading data from a higher classification level?',
      options: [
        'Biba — which enforces integrity',
        'Bell-LaPadula — which enforces confidentiality',
        'Clark-Wilson — which enforces commercial integrity',
        'Brewer-Nash — which enforces conflict of interest controls',
      ],
      correctIndex: 1,
      explanation:
        'Bell-LaPadula enforces confidentiality. Its Simple Security Property ("no read up") prevents subjects from reading above their clearance. A lower-clearance process reading higher-classified data violates this rule directly.',
      memoryHack:
        'BLP = Lips sealed = Confidentiality. "No read up, no write down." Biba = Bible = Integrity. Flip the arrows: "No read down, no write up." If confidentiality is broken, it\'s always BLP.',
    },
  },
  {
    id: 'd3-s05',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'If BLP enforces confidentiality with "no read up, no write down" — what model enforces integrity? If Ghost was injecting false data into audit logs, a different model should have caught that.',
  },
  {
    id: 'd3-s06',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'Biba. Where Bell-LaPadula protects confidentiality, Biba protects integrity. Its rules are the mirror image: no read down — a subject can\'t read data below their integrity level, because corrupted low-integrity data pollutes the process — and no write up — a subject can\'t write to a higher-integrity object. Ghost\'s compromised process had low integrity. Under Biba, it should have been blocked from writing to audit logs. We didn\'t implement Biba. Logging was an afterthought.',
    knowledgeCheck: {
      question:
        'A compromised process at low integrity level attempts to write malicious entries into a high-integrity audit log. Which security model\'s rule directly prohibits this action?',
      options: [
        'Bell-LaPadula\'s "no read up" rule',
        'Biba\'s "no write up" rule',
        'Clark-Wilson\'s separation of duties principle',
        'Bell-LaPadula\'s "no write down" rule',
      ],
      correctIndex: 1,
      explanation:
        'Biba\'s "no write up" rule (Star Integrity Property) prevents low-integrity subjects from writing to high-integrity objects. A compromised low-integrity process writing to a high-integrity audit log is exactly what this rule blocks. BLP governs confidentiality, not integrity.',
      memoryHack:
        'BLP vs Biba — flip the arrows. BLP: no Read Up, no Write Down (keep secrets IN). Biba: no Read Down, no Write Up (keep corruption OUT). Remember: Biba = Bible = Integrity. BLP = Lips sealed = Confidentiality.',
    },
  },
  {
    id: 'd3-s07',
    type: 'memory_hack',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    speaker: 'narrator',
    dialogue: 'Memory Hack: Security Models',
    memoryHack: {
      title: 'The Model Matrix',
      body: 'THREE models, THREE goals: BLP (Bell-LaPadula) = Confidentiality — military classification. Biba = Integrity — financial systems. Clark-Wilson = Commercial Integrity — separates users from data via programs (subjects → programs → objects). The exam loves mixing these up. Anchor: BLP protects secrets going OUT. Biba protects truth coming IN. Clark-Wilson protects process integrity through constrained data items and transformation procedures.',
    },
    xpReward: 50,
  },
  {
    id: 'd3-s08',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The Munich team also relies on virtualization. Four hypervisors, each running dozens of VMs across production and development. The attacker escaped a compromised dev VM and pivoted to production — a hypervisor escape. In a properly isolated virtualized environment this is impossible. But their VM-to-host network segmentation was flat. Cloud and virtualization don\'t inherit security by default. You have to architect it deliberately.',
  },
  {
    id: 'd3-s09',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'Defense in depth is the architectural principle that should have contained any single failure. The attacker needed seventeen separate successes to reach the final target — weak password, unpatched VM, flat network, no MFA on privileged accounts, no audit alerts, no session timeout, unencrypted backups, expired TLS cert, wrong classification labels, no DLP on the API layer, unregistered asset, unsigned code, no code review, RSA-1024, and a corrupt insider. Any one of those controls, working properly, breaks the chain.',
    knowledgeCheck: {
      question:
        'The Munich team\'s hypervisor escape succeeded because dev and production VM networks were not isolated. Which security architecture principle does this directly violate?',
      options: [
        'Least privilege — users should have minimum necessary access',
        'Fail secure — systems should fail to a secure state',
        'Defense in depth — layered controls so no single point of failure',
        'Separation of duties — critical tasks require multiple people',
      ],
      correctIndex: 2,
      explanation:
        'Defense in depth requires multiple independent layers of control. A flat VM network means the hypervisor escape bypassed a single boundary and immediately accessed production — no additional layer blocked the lateral movement. Each environment (dev, staging, prod) should be isolated behind its own control layer.',
      memoryHack:
        'Defense in depth = castle model. Moat → wall → drawbridge → inner keep → vault. The attacker jumping from one VM to production means there was only ONE wall between dev and prod. Any single-point bypass = depth failure.',
    },
  },
  {
    id: 'd3-s04',
    type: 'dialogue',
    location: 'Munich',
    background: LOCATION_GRADIENTS_V2['munich'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The cryptographic implementation also has issues. The system uses RSA-1024 for key exchange — deprecated since 2015. And the session keys are derived from a weak seed. Someone on the inside would have known where the weakness was. The Singapore operations center handles the key management infrastructure. That\'s your next stop.',
    xpReward: 300,
  },
];

const domain4Scenes: StoryScene[] = [
  {
    id: 'd4-s01',
    type: 'narration',
    location: 'Singapore',
    background: LOCATION_GRADIENTS_V2['singapore'],
    speaker: 'narrator',
    dialogue:
      'Meridian Asia-Pacific Operations — Singapore. The network security team manages all of Meridian\'s global network infrastructure from this hub. Ghost Holloway was here six months ago for a "security architecture review." He had admin-level access to every switch and firewall in the building.',
  },
  {
    id: 'd4-s02',
    type: 'dialogue',
    location: 'Singapore',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The network logs from the breach night show something disturbing. At 2:43 AM Toronto time — four minutes before Ghost Holloway\'s suspicious access log entry — there was an ARP poisoning event on the management VLAN of the Singapore hub. Someone redirected traffic from the Toronto operations team\'s network segment through a rogue endpoint registered in Singapore.',
  },
  {
    id: 'd4-s03',
    type: 'dialogue',
    location: 'Singapore',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'ARP operates at Layer 2 — the Data Link layer. By poisoning the ARP cache, the attacker convinced the management VLAN that all traffic for the Toronto gateway should flow through the rogue endpoint. Classic man-in-the-middle at the network layer. The attacker then stripped TLS — consistent with what Priya saw in London. This was a coordinated, multi-vector attack. Not a lone hacker. A team.',
    knowledgeCheck: {
      question:
        'An attacker sends forged ARP replies to redirect traffic through a rogue device on the management VLAN. At which OSI layer does this attack operate?',
      options: [
        'Layer 3 — Network (because ARP involves IP addresses)',
        'Layer 2 — Data Link (because ARP maps IPs to MAC addresses)',
        'Layer 4 — Transport (because it affects TCP sessions)',
        'Layer 7 — Application (because it affects application traffic)',
      ],
      correctIndex: 1,
      explanation:
        'ARP (Address Resolution Protocol) resolves IP addresses to MAC addresses and operates at Layer 2 — the Data Link layer. Even though ARP deals with IP addresses, it functions below the Network layer and is used to build Layer 2 forwarding tables.',
      memoryHack:
        '"Please Do Not Throw Sausage Pizza Away" — Physical, Data Link, Network, Transport, Session, Presentation, Application. ARP is at Layer 2 (Data Link) because it works with MAC addresses, which is the addressing scheme of Layer 2.',
    },
  },
  {
    id: 'd4-s04',
    type: 'dialogue',
    location: 'Singapore',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The rogue endpoint registered to an account that was supposed to have been deprovisioned eighteen months ago — when an employee named Jordan Kim left the company. Someone reactivated it from inside the network. Someone with domain admin rights. The trail is getting warmer. New York. Marcus Webb. The SOC Lead. He was the one who processed Kim\'s offboarding.',
  },

  // ── Scene 5: TLS 1.3 handshake — how the attacker stripped it ────────────
  {
    id: 'd4-s05',
    type: 'dialogue',
    location: 'Singapore Hub — Network Lab',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The MITM attack only worked because TLS was stripped. Here\'s what that means. TLS 1.3 performs a one-round-trip handshake: the client says "hello" with supported cipher suites, the server picks one and sends its certificate, both sides compute a shared secret using ephemeral Diffie-Hellman key exchange, and encrypted data flows. The attacker\'s rogue endpoint posed as the legitimate server — but their certificate failed validation. Except Meridian had disabled strict certificate pinning eighteen months ago to "reduce help-desk tickets." That single configuration change made the stripping attack possible.',
    knowledgeCheck: {
      question:
        'What is the PRIMARY security improvement in TLS 1.3 over TLS 1.2?',
      options: [
        'TLS 1.3 uses a longer RSA key size for improved encryption strength',
        'TLS 1.3 removes support for weak cipher suites and requires forward secrecy via ephemeral key exchange',
        'TLS 1.3 adds mutual certificate authentication as a mandatory requirement',
        'TLS 1.3 encrypts the certificate exchange to prevent fingerprinting',
      ],
      correctIndex: 1,
      explanation:
        'TLS 1.3 removes legacy weak cipher suites (RSA key exchange, RC4, DES, 3DES) entirely and mandates ephemeral Diffie-Hellman for all sessions, providing Perfect Forward Secrecy. This means even if a long-term private key is later compromised, past session recordings cannot be decrypted.',
      memoryHack:
        'TLS 1.3 = "Trim the Legacy, Secure with Ephemeral." Forward Secrecy means each session generates a throwaway key — compromise the server key tomorrow, and yesterday\'s traffic stays private.',
    },
    xpReward: 50,
  },

  // ── Scene 6: Network segmentation and DMZ architecture ───────────────────
  {
    id: 'd4-s06',
    type: 'memory_hack',
    location: 'Singapore Hub — Network Lab',
    background: LOCATION_GRADIENTS_V2['singapore'],
    speaker: 'narrator',
    dialogue:
      'The Singapore hub had flat network architecture — any device on the management VLAN could reach the production VLAN. Understanding segmentation is foundational to this exam.',
    memoryHack: {
      title: 'Network Segmentation Models — The Concentric Rings',
      body: 'Think of network segmentation like concentric rings around a castle:\n\nOUTER RING — Internet-facing DMZ: Public web servers, email gateways, DNS. Should NEVER directly touch the internal network. The firewall between DMZ and internal is the drawbridge.\n\nMIDDLE RING — Internal Network: User workstations, business applications. Cannot initiate connections to the DMZ without going through a proxy or firewall.\n\nINNER RING — Restricted/Management Network: Domain controllers, database servers, PAM systems. Zero external exposure. Only jump servers can bridge into this ring.\n\nDMZ Rule: Traffic flows inward only via specific approved paths. The Singapore hub\'s mistake was allowing the management VLAN (inner ring) to receive traffic from a device that originated in the DMZ (outer ring).\n\nMemory Hook: "You can always exit the castle, but you cannot walk past the guards coming in."',
    },
    xpReward: 50,
  },

  // ── Scene 7: IPSec vs SSL VPN and VPN protocol comparison ────────────────
  {
    id: 'd4-s07',
    type: 'dialogue',
    location: 'Singapore Hub — Network Lab',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Meridian\'s remote access VPN was SSL-based — convenient for users, but it only tunnels traffic at the application layer. The attacker exploited a split-tunneling misconfiguration where Ghost Holloway\'s laptop was simultaneously connected to the Meridian VPN and routing traffic through an uncontrolled home network segment. IPSec VPN would have operated at Layer 3 and enforced tunnel-only routing. The choice of VPN protocol has security architecture implications that go far beyond user experience.',
    knowledgeCheck: {
      question:
        'Which statement BEST describes the difference between IPSec VPN and SSL/TLS VPN?',
      options: [
        'IPSec VPN is more secure because it uses stronger encryption algorithms',
        'SSL/TLS VPN operates at the application layer and can be browser-based; IPSec VPN operates at Layer 3 and tunnels all IP traffic',
        'IPSec VPN requires dedicated hardware; SSL/TLS VPN works on any device',
        'SSL/TLS VPN is only used for site-to-site connections; IPSec VPN is only for remote access',
      ],
      correctIndex: 1,
      explanation:
        'IPSec operates at Layer 3 (Network) and encapsulates all IP traffic in the tunnel. SSL/TLS VPN operates at Layer 7 (Application) and typically proxies specific application traffic — often just web traffic. This means SSL/TLS VPN can leave non-web traffic on the local network (split tunneling risk). Both can be equally secure when properly configured.',
      memoryHack:
        'IPSec = "Internet Protocol Secured" — wraps the whole IP packet. SSL VPN = wraps just the application session. IPSec is a full-coverage suit of armour; SSL VPN is a helmet.',
    },
    xpReward: 50,
  },

  // ── Scene 8: TLATM — network segmentation decision ───────────────────────
  {
    id: 'd4-s08',
    type: 'tlatm',
    location: 'Singapore Hub — Network Lab',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'A junior analyst wants to stop the breach by taking drastic network action. Think Like a Manager.',
    choices: [
      {
        text: 'Agree — blocking all outbound traffic immediately stops the exfiltration.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'This would take down business operations entirely. Every API call, cloud sync, email, and customer-facing system would go dark. The cure is worse than the disease. Targeted blocking based on identified IOCs is the right approach.',
      },
      {
        text: 'Block only the specific external IP ranges confirmed in the C2 traffic analysis while preserving business connectivity.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'Correct. Targeted containment based on confirmed indicators of compromise (IOCs) stops the active exfiltration channel without disrupting legitimate operations. This is the manager\'s response: proportionate, evidence-based, and operationally aware.',
      },
      {
        text: 'Take no network action — wait for complete forensic evidence before touching any traffic flows.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Active exfiltration requires immediate containment. Waiting for complete forensic evidence while data is actively leaving the organization is not a defensible position. Containment and forensics run in parallel.',
      },
      {
        text: 'Escalate to the CEO for approval before taking any blocking action.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'The CISO and security operations team have delegated authority to take immediate containment actions. Executive escalation happens in parallel through the incident response notification chain — it does not gate technical containment decisions.',
      },
    ],
    xpReward: 100,
  },

  // ── Scene 9: Wireless security — WPA3 and 802.1X ─────────────────────────
  {
    id: 'd4-s09',
    type: 'dialogue',
    location: 'Singapore Hub — Wireless Operations',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Ghost Holloway\'s initial pivot into the Singapore hub came through a wireless access point in the guest conference area that was bridged to the corporate network — a configuration that should never exist. The AP was running WPA2 with a shared passphrase, not WPA3 with 802.1X authentication. WPA3 requires Simultaneous Authentication of Equals — SAE — which eliminates offline dictionary attacks against the handshake. 802.1X with EAP-TLS ties each wireless session to an individual certificate, not a shared secret. One insecure AP. That was the entry point.',
    knowledgeCheck: {
      question:
        'Which wireless authentication method provides the STRONGEST protection against credential-based attacks on enterprise Wi-Fi?',
      options: [
        'WPA2-Personal with a complex 20-character passphrase',
        'WPA3-Personal with SAE replacing the 4-way handshake',
        '802.1X with EAP-TLS using per-user certificates',
        'MAC address filtering combined with WPA2-Enterprise',
      ],
      correctIndex: 2,
      explanation:
        '802.1X with EAP-TLS provides mutual authentication using per-user/per-device certificates. There is no shared secret to steal or crack. WPA3-SAE improves on WPA2-Personal but still relies on a shared passphrase. MAC filtering alone is trivially bypassed by spoofing.',
      memoryHack:
        'EAP-TLS = "Each Authenticated Person — Two-sided certificates." Both the client and the server prove identity with certificates. No passphrase, no shared secret, no dictionary attack. The gold standard for enterprise wireless.',
    },
    xpReward: 50,
  },

  // ── Scene 10: DNSSEC and BGP security — domain epilogue ──────────────────
  {
    id: 'd4-s10',
    type: 'dialogue',
    location: 'Singapore Hub — Network Operations',
    background: LOCATION_GRADIENTS_V2['singapore'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'One last finding from Singapore before New York. The C2 server used DNS-over-HTTPS to hide exfiltration traffic in encrypted DNS lookups — bypassing the corporate DNS resolver entirely. Meridian had deployed DNSSEC to validate DNS responses, but had not blocked DoH to unauthorized resolvers. DNSSEC protects the integrity of DNS records using cryptographic signatures — it prevents DNS spoofing and cache poisoning. But it doesn\'t help if the attacker bypasses your resolver completely. Security controls are only effective if they\'re part of a closed system. Ghost Holloway knew every gap in the architecture. That takes insider knowledge.',
    xpReward: 300,
  },
];

const domain5Scenes: StoryScene[] = [
  {
    id: 'd5-s01',
    type: 'narration',
    location: 'New York',
    background: LOCATION_GRADIENTS_V2['new-york'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global Americas SOC — Midtown Manhattan. Marcus Webb has been running Meridian\'s Security Operations Center for four years. He\'s been cooperating fully with the investigation. Too fully, some would say. He volunteered access to every system before {playerName} could ask. That\'s either innocent transparency — or someone who already cleaned up their tracks.',
  },
  {
    id: 'd5-s02',
    type: 'dialogue',
    location: 'New York',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      '{playerName}. I\'ve been expecting you. Whatever you need — logs, access records, system configs — you have it. I want to find out what happened as much as you do. The identity and access management on this platform is my responsibility. If someone exploited a gap, I need to know.',
  },
  {
    id: 'd5-s03',
    type: 'dialogue',
    location: 'New York',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      'The deprovisioned account — Jordan Kim\'s — should have been disabled and audited. It wasn\'t. My team processes two hundred account actions a month. We had a backlog. Accounts that were supposed to be closed in a 30-day window were averaging 47 days. Kim\'s account sat in that backlog. Someone exploited the window.',
    knowledgeCheck: {
      question:
        'Ghost Holloway has a developer account with access to production systems, the HR portal, financial reporting, and network infrastructure. Which security principle is MOST clearly violated?',
      options: [
        'Defense in depth — multiple controls should be layered',
        'Least privilege — access should be limited to what\'s needed for the role',
        'Separation of duties — no single person should control an entire process',
        'Need to know — information should be compartmentalized',
      ],
      correctIndex: 1,
      explanation:
        'Least privilege dictates that users receive only the minimum permissions required for their specific job function. A developer has no legitimate need for HR or financial data access. Least privilege violations are the most common contributor to insider threat incidents.',
      memoryHack:
        'Least privilege = minimum access for the job. Think of it as a keycard that only opens the doors you need today — not a master key to the building. If the access isn\'t justified by the job description, it shouldn\'t exist.',
    },
  },
  {
    id: 'd5-s04',
    type: 'dialogue',
    location: 'New York',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Webb pulls up the access log. Alongside Jordan Kim\'s reactivated account, there\'s something else: a secondary authentication token was issued to "gh_dev" — Ghost Holloway — from a New York IP at 2:39 AM. Eight minutes before the Toronto access log entry. Holloway was supposed to be in Vancouver that night. He said so in his statement. The authentication system disagrees.',
  },

  // ── Scene 5: Marcus Webb's role revealed — he reactivated the account ─────
  {
    id: 'd5-s05',
    type: 'dialogue',
    location: 'New York — SOC Interview Room',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      '{playerName} confronts Webb with the reactivation log. Webb goes quiet for a long moment. "I reactivated Jordan Kim\'s account. Holloway came to me eight months ago — said he needed it temporarily to run a data migration script. He was a senior developer. The request looked legitimate. I approved a 72-hour window. I should have set an automated expiry. I didn\'t. The account never got disabled. That\'s on me." His voice is steady. Confessional, almost rehearsed. {playerName} notes the timestamp: the reactivation happened six days before the data migration project was even created in the project management system.',
  },

  // ── Scene 6: OAuth 2.0 flows — memory hack ────────────────────────────────
  {
    id: 'd5-s06',
    type: 'memory_hack',
    location: 'New York — SOC',
    background: LOCATION_GRADIENTS_V2['new-york'],
    speaker: 'narrator',
    dialogue:
      'The authentication token issued to Holloway used OAuth 2.0 — the industry standard for delegated authorization. Understanding how it works explains how it was abused.',
    memoryHack: {
      title: 'OAuth 2.0 Flows — The Four Grant Types',
      body: 'OAuth 2.0 is a delegation framework: it lets a user grant a third-party app limited access to their account WITHOUT sharing their password.\n\nFour Grant Types:\n\n1. Authorization Code (+ PKCE for public clients) — The gold standard for web apps. User authenticates with the Identity Provider, receives a short-lived code, exchanges it for a token server-side. PKCE prevents code interception.\n\n2. Client Credentials — Machine-to-machine. No user involved. The app authenticates with its own credentials. Used for backend services.\n\n3. Implicit — DEPRECATED. Token returned directly to the browser. Vulnerable to token leakage.\n\n4. Resource Owner Password Credentials (ROPC) — DEPRECATED. App receives the user\'s actual password. Defeats the purpose of delegation.\n\nOAuth vs SAML vs OIDC:\n- OAuth = Authorization ("what can this app DO")\n- OIDC (OpenID Connect) = Authentication on top of OAuth ("WHO is this user")\n- SAML = Both auth + authz in one XML-heavy protocol; common in enterprise SSO\n\nMemory Hook: "OAuth opens the door, OIDC checks the ID card." SAML is the legacy enterprise bouncer who still uses a fax machine.',
    },
    xpReward: 50,
  },

  // ── Scene 7: Kerberos ticket granting ────────────────────────────────────
  {
    id: 'd5-s07',
    type: 'dialogue',
    location: 'New York — SOC',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The internal authentication system uses Kerberos — the protocol at the heart of Active Directory. Here\'s how Holloway abused it: he obtained a Ticket Granting Ticket from the Key Distribution Center using Kim\'s reactivated credentials. The TGT is like a master VIP pass — present it to any service, and that service issues you a specific Service Ticket without asking for your password again. Holloway\'s TGT was valid for ten hours. Standard Meridian configuration. In those ten hours, he touched eleven separate systems.',
    knowledgeCheck: {
      question:
        'In Kerberos authentication, what is the role of the Ticket Granting Service (TGS)?',
      options: [
        'The TGS verifies user passwords and issues the initial Ticket Granting Ticket',
        'The TGS validates service tickets presented at each resource and logs access',
        'The TGS issues service-specific tickets after the user presents a valid TGT — without requiring password re-entry',
        'The TGS encrypts network traffic between the client and the service it is accessing',
      ],
      correctIndex: 2,
      explanation:
        'The Kerberos flow is: (1) Client authenticates to the Authentication Server (AS) and receives a TGT encrypted with the KDC\'s secret key. (2) Client presents the TGT to the Ticket Granting Service (TGS) along with the service it needs. (3) TGS issues a service ticket specific to that resource. (4) Client presents the service ticket to the target service. The user\'s password is only used in step 1.',
      memoryHack:
        'Kerberos = "Three-headed dog guards the gate." AS gives you the master pass (TGT). TGS gives you the specific room key (Service Ticket). The room lets you in. Password used once — everywhere else you\'re using tickets.',
    },
    xpReward: 50,
  },

  // ── Scene 8: Zero Trust Architecture ─────────────────────────────────────
  {
    id: 'd5-s08',
    type: 'dialogue',
    location: 'New York — SOC',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      'Webb is still cooperating — and now he\'s clearly trying to distance himself from the damage. "What Meridian didn\'t have is what every modern IAM architecture needs: Zero Trust. The old model assumed that anything inside the network perimeter was trustworthy. Holloway was inside the perimeter. His credentials checked out. The system waved him through eleven times. Zero Trust says: every access request, every session, every transaction must be verified regardless of where it originates. Never trust, always verify. Continuous authentication. Device posture checks. Micro-segmentation. We had none of it."',
    xpReward: 50,
  },

  // ── Scene 9: Biometrics — FAR vs FRR ─────────────────────────────────────
  {
    id: 'd5-s09',
    type: 'dialogue',
    location: 'New York — SOC',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Meridian\'s PAM — Privileged Access Management — system for admin accounts required biometric confirmation for tier-0 access. Ghost Holloway enrolled his fingerprint when he joined. But the PAM system\'s biometric threshold was tuned to minimize False Rejection Rate — annoying admins less. By lowering the FRR, Meridian inadvertently raised the FAR. The system was accepting partial fingerprint matches. The attacker used a lifted print from an office surface to bypass the biometric gate.',
    knowledgeCheck: {
      question:
        'A biometric system\'s sensitivity is being tuned. Making it LESS strict reduces inconvenience for legitimate users. What is the security trade-off?',
      options: [
        'Reducing the False Rejection Rate (FRR) also reduces the False Acceptance Rate (FAR), improving overall security',
        'Reducing the FRR increases the FAR — the system accepts more unauthorized users to avoid rejecting authorized ones',
        'Reducing the FRR has no effect on FAR because they are independent variables',
        'The Crossover Error Rate (CER) automatically adjusts to maintain equal FAR and FRR regardless of tuning',
      ],
      correctIndex: 1,
      explanation:
        'FAR and FRR trade off against each other. Lowering sensitivity (to reduce FRR — fewer false rejections of legitimate users) means the system accepts fuzzier matches — which increases FAR (more false acceptances of unauthorized users). The Crossover Error Rate (CER/EER) is where FAR = FRR and represents the optimal balance point.',
      memoryHack:
        'FAR = "False Acceptance Rate" = letting the bad guy in. FRR = "False Rejection Rate" = locking out the good guy. Lower the bar for one, you raise it for the other. CER is the crossover where they meet — lower CER = better biometric system.',
    },
    xpReward: 50,
  },

  // ── Scene 10: TLATM — IAM governance decision ─────────────────────────────
  {
    id: 'd5-s10',
    type: 'tlatm',
    location: 'New York — SOC',
    background: LOCATION_GRADIENTS_V2['new-york'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The IAM findings are in. As security manager, what is the correct remediation posture?',
    choices: [
      {
        text: 'Immediately terminate all accounts with exceptions to the least-privilege policy to eliminate the risk.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Mass account termination would disrupt operations and likely cause critical systems to go offline. Risk remediation must be prioritized and phased based on access level and business criticality. Terminate the highest-risk accounts first; schedule the rest.',
      },
      {
        text: 'Implement a 90-day access recertification campaign where every data owner reviews and reaffirms each user\'s access rights, prioritizing privileged accounts within 30 days.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the governance answer. Access recertification (also called access review or user access review) is a mature IAM control. Prioritizing privileged accounts catches the highest-risk gaps first while ensuring business owners — not IT — make the access decisions. This is how Zero Trust is implemented in practice.',
      },
      {
        text: 'Add MFA to all accounts and consider the IAM problem solved.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'MFA is a valuable control but it addresses authentication strength, not authorization scope. Holloway had legitimate MFA-verified credentials — the problem was what his credentials were allowed to access. MFA without access control remediation leaves the overprivilege problem untouched.',
      },
      {
        text: 'Hire an external IAM vendor to replace the entire identity platform before making any other changes.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'Platform replacement is a multi-year project. The immediate risk must be addressed with the existing tools. An access recertification campaign can begin within days on the current platform. New platforms can be evaluated in parallel as a medium-term initiative.',
      },
    ],
    xpReward: 300,
  },
];

const domain6Scenes: StoryScene[] = [
  {
    id: 'd6-s01',
    type: 'narration',
    location: 'Remote Lab',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global Digital Forensics — Secure Remote Lab. Elena Vasquez has assembled a forensic team with legal hold orders. Every system touched during the breach is now under evidence preservation. The chain of custody must be unbroken. Any procedural error here kills the legal case.',
  },
  {
    id: 'd6-s02',
    type: 'dialogue',
    location: 'Remote Lab',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'Forensics is about proving what happened — not just knowing it. For this evidence to hold up in court, every step of the examination must be documented. The original drives are imaged bit-for-bit using write-blockers before anyone touches them. We work on the copies. The originals go into sealed evidence lockers. That\'s chain of custody.',
    knowledgeCheck: {
      question:
        'The forensic team needs to examine a hard drive from a compromised server. What is the correct FIRST step?',
      options: [
        'Boot the server and review the live system logs for recent activity',
        'Run a vulnerability scan on the drive to identify exploited weaknesses',
        'Create a forensic bit-for-bit image using a write-blocker before examining anything',
        'Immediately run antivirus software to remove any malware present',
      ],
      correctIndex: 2,
      explanation:
        'The first step in forensic examination is always to create a verified bit-for-bit image using a write-blocker. This preserves the original evidence in its exact state and maintains chain of custody. All analysis is performed on the copy, never the original.',
      memoryHack:
        'Forensics order: Image first, analyze the copy, lock the original. A write-blocker is like a one-way valve — data can be read but never written back. Never boot the original drive.',
    },
  },
  {
    id: 'd6-s03',
    type: 'dialogue',
    location: 'Remote Lab',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The forensic image of Holloway\'s workstation tells a story. Deleted files recovered from unallocated clusters show communications with an external party — encrypted, but the metadata is intact. Timestamps. Recipient identifiers. The forensic hash of the recovered files matches samples from a known industrial espionage group. This is no longer just a breach. This is state-sponsored theft.',
  },
  {
    id: 'd6-s04',
    type: 'dialogue',
    location: 'Remote Lab',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The penetration testing firm we hired to run the initial vulnerability assessment flagged Holloway\'s access permissions eight months ago. Black-box test, gray-box test, then white-box — they found the overprivileged account in the gray-box phase. The report went to Webb. Webb escalated it. Holloway\'s manager closed it as "false positive." That manager has just taken a leave of absence.',
  },

  // ── Scene 5: The buried pentest report — Vasquez uncovers it ─────────────
  {
    id: 'd6-s05',
    type: 'dialogue',
    location: 'Remote Lab — Evidence Review',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'I found the original penetration test report. Not the sanitized summary sent to the board — the full technical report with the working exploit proof-of-concept. Finding ID PT-2024-047: "Developer account gh_dev holds domain admin equivalent privileges with no separation of duties controls and no time-bound access review. This account can access production databases, authentication infrastructure, and network management systems simultaneously. CVSS v3.1 Base Score: 9.1 — CRITICAL." It was marked "Accepted Risk" by one reviewer. No name. Just a digital signature. We\'re running that signature through the employee certificate store now.',
    knowledgeCheck: {
      question:
        'A CVSS v3.1 score of 9.1 is classified as which severity level?',
      options: [
        'High (7.0–8.9)',
        'Critical (9.0–10.0)',
        'Medium (4.0–6.9)',
        'The CVSS score alone does not determine severity without environmental context',
      ],
      correctIndex: 1,
      explanation:
        'CVSS v3.1 severity ratings: None (0.0), Low (0.1–3.9), Medium (4.0–6.9), High (7.0–8.9), Critical (9.0–10.0). A score of 9.1 is Critical. CVSS v3.1 has three metric groups: Base (intrinsic characteristics), Temporal (exploitability over time), and Environmental (organization-specific impact). The Base score alone is used for standard classification.',
      memoryHack:
        'CVSS Critical = 9.0–10.0. Remember: "Nine and above? Drop everything." Base score uses three vectors: AV (Attack Vector), PR (Privileges Required), UI (User Interaction) — and three impact scores: C, I, A (Confidentiality, Integrity, Availability impact).',
    },
    xpReward: 50,
  },

  // ── Scene 6: Pen test phases — PTES methodology ───────────────────────────
  {
    id: 'd6-s06',
    type: 'memory_hack',
    location: 'Remote Lab — Evidence Review',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    speaker: 'narrator',
    dialogue:
      'Understanding what the pentest firm did — and what they were authorized to do — requires knowing how professional penetration tests are structured.',
    memoryHack: {
      title: 'Penetration Test Phases — PTES and the Three Box Colors',
      body: 'Professional penetration testing follows a structured methodology:\n\n7 PTES Phases:\n1. Pre-engagement — Scope, rules of engagement, authorization (get it IN WRITING)\n2. Intelligence Gathering — OSINT, reconnaissance, mapping attack surface\n3. Threat Modeling — What are the highest-value targets?\n4. Vulnerability Analysis — Scanning, manual testing, identifying weaknesses\n5. Exploitation — Active attacks to confirm vulnerabilities are exploitable\n6. Post-Exploitation — Persistence, lateral movement, privilege escalation\n7. Reporting — Technical findings + executive summary + remediation guidance\n\nThree Box Test Types:\n- BLACK BOX: Tester has no prior knowledge — simulates external attacker\n- GRAY BOX: Tester has partial knowledge (network diagram, low-priv account) — simulates insider threat\n- WHITE BOX: Full knowledge (source code, architecture) — most thorough, least realistic\n\nVulnerability Scan vs Pen Test:\n- Vulnerability scan = automated tool that finds potential weaknesses (does NOT exploit)\n- Pen test = manual + automated testing that CONFIRMS exploitation is possible\n\nMemory Hook: "Black = blind. Gray = partial map. White = full blueprint."',
    },
    xpReward: 50,
  },

  // ── Scene 7: SAST, DAST, IAST, RASP — the testing alphabet ──────────────
  {
    id: 'd6-s07',
    type: 'dialogue',
    location: 'Remote Lab — Code Analysis Station',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The pentest report also called out Meridian\'s missing application security testing. Four tools exist for this, and they\'re used at different stages of the SDLC. SAST — Static Application Security Testing — analyzes source code without running it. Think: code review by a robot. DAST — Dynamic Application Security Testing — attacks the running application from outside, like a hacker would. IAST — Interactive Application Security Testing — instruments the application internally while tests run, catching what DAST misses. RASP — Runtime Application Self-Protection — lives inside the running application and blocks attacks in real time. The report recommended SAST and DAST at minimum. Neither was implemented.',
    knowledgeCheck: {
      question:
        'A security team wants to find SQL injection vulnerabilities in a web application that is already deployed and running in staging. Which testing approach is MOST appropriate?',
      options: [
        'SAST — analyze the source code repository for SQL injection patterns',
        'DAST — send malicious SQL payloads to the running application and observe responses',
        'RASP — deploy a runtime agent to block SQL injection attempts in production',
        'Code review — manually inspect database query code with the development team',
      ],
      correctIndex: 1,
      explanation:
        'DAST tests the running application from the outside, which is appropriate for a deployed staging environment. SAST requires source code access and runs before deployment. RASP is a production control, not a testing method. Manual code review is valuable but not the most efficient for a deployed application.',
      memoryHack:
        'SAST = "Source Code" (Static). DAST = "Deployed App" (Dynamic). IAST = "Instrumented" (inside + outside). RASP = "Runtime" (live protection). Think of SAST as pre-flight checks and DAST as stress-testing the plane in the air.',
    },
    xpReward: 50,
  },

  // ── Scene 8: Red/Blue/Purple Team and threat modeling (STRIDE) ───────────
  {
    id: 'd6-s08',
    type: 'dialogue',
    location: 'Remote Lab — Threat Intelligence',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'The pentest firm used a red team approach — they mimicked a real adversary without telling the blue team (Meridian\'s SOC under Webb). The blue team\'s detection rate was 34%. That means Webb\'s team missed two-thirds of the simulated attacks. A purple team engagement — where red and blue work together openly to transfer techniques — would have trained the defenders in real time. Meridian did neither. A proper threat modeling exercise using STRIDE — Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege — would have predicted every attack vector Ghost Holloway used. The threat model existed. Nobody updated it after he joined the architecture team.',
    xpReward: 50,
  },

  // ── Scene 9: SOC 2 and ISO 27001 — assessment frameworks ─────────────────
  {
    id: 'd6-s09',
    type: 'tlatm',
    location: 'Remote Lab — Compliance Review',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'Meridian is SOC 2 Type II certified. The board is asking why the breach was possible given the certification. Think Like a Manager.',
    choices: [
      {
        text: 'SOC 2 certification is meaningless — it clearly failed to prevent the breach.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'SOC 2 tests whether controls are designed and operating effectively over a defined period. It does not guarantee zero breaches. A sophisticated insider threat with complicit access can operate within certified controls. SOC 2 reduces risk — it does not eliminate it.',
      },
      {
        text: 'Explain that SOC 2 Type II validates that controls were operating effectively during the audit period, but the breach exploited exception approvals that were individually compliant — the systemic risk was the pattern of exceptions, not any single control failure.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the accurate and defensible position. SOC 2 auditors review a sample of transactions and exceptions. A sustained insider threat that operates through legitimate access exceptions can remain invisible to an audit. The lesson is that audit certification must be supplemented with continuous monitoring and access recertification — which SOC 2 does not mandate.',
      },
      {
        text: 'Immediately surrender the SOC 2 certification and start the re-certification process.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Surrendering certification harms Meridian\'s customer relationships and creates unnecessary legal exposure without solving the underlying problem. The correct path is to notify the SOC 2 auditor, cooperate with the assessment of which controls failed, and implement remediation — not to preemptively abandon the certification.',
      },
      {
        text: 'Pursue ISO 27001 certification instead, as it is a more comprehensive standard.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'ISO 27001 is a management system standard and is valuable. But switching frameworks mid-breach does not address the immediate control gaps. The right sequence is: contain and remediate the breach, then assess which framework best fits Meridian\'s needs going forward.',
      },
    ],
    xpReward: 300,
  },
];

const domain7Scenes: StoryScene[] = [
  {
    id: 'd7-s01',
    type: 'narration',
    location: 'Tokyo',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global Asia Crisis Command — Tokyo. The incident response team has been running a parallel track: contain, eradicate, recover. The Tokyo operations center coordinates global incident response. Marcus Webb has flown in. He looks like he hasn\'t slept in three days. The investigation is closing in, and he knows it.',
  },
  {
    id: 'd7-s02',
    type: 'dialogue',
    location: 'Tokyo',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      'The NIST incident response lifecycle. Four phases: Preparation, Detection and Analysis, Containment-Eradication-Recovery, and Post-Incident Activity. We\'re in phase three. Containment happened in the first 48 hours — we isolated the affected segments, blocked the external communication channels, revoked the compromised credentials. Eradication is ongoing: removing the malware, closing the covert channel, patching the architecture flaw. Recovery is next.',
    knowledgeCheck: {
      question:
        'During active incident response, what is the correct ORDER of actions after detecting an active breach?',
      options: [
        'Eradicate the threat → Contain the spread → Recover systems → Document findings',
        'Contain the spread → Eradicate the threat → Recover systems → Post-incident review',
        'Recover systems → Contain the spread → Eradicate the threat → Notify stakeholders',
        'Notify all stakeholders → Contain the spread → Eradicate the threat → Recover systems',
      ],
      correctIndex: 1,
      explanation:
        'NIST IR lifecycle phase 3 order: Containment first — stop the bleeding. Eradication second — remove the cause. Recovery third — restore systems. This order is critical because eradicating without containing first may drive the attacker to open new vectors or destroy evidence.',
      memoryHack:
        'CER: Contain, Eradicate, Recover. Think of it like fighting a kitchen fire: close the doors (Contain), turn off the gas and smother the flame (Eradicate), then clean up and reopen (Recover). Never clean up while the fire is still spreading.',
    },
  },
  {
    id: 'd7-s03',
    type: 'dialogue',
    location: 'Tokyo',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      '{playerName} — I need to tell you something. About Holloway. About what I know. Three years ago, Holloway asked me to approve an access request that didn\'t follow the least-privilege policy. He said it was temporary. For a project. I approved it as a one-time exception. I never followed up to revoke it. That account permission — the one I approved — is in the forensic trail. I\'m the gap in the control.',
  },
  {
    id: 'd7-s04',
    type: 'dialogue',
    location: 'Tokyo',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      'The disaster recovery plan kicks in tomorrow. Business continuity maintained throughout — the clients never lost access. RTO was met. RPO was met. But the lesson here isn\'t in the metrics. It\'s in the access review that never happened. Every exception to least privilege should have an expiry date and an automatic alert if not reviewed. That\'s the lesson. And that\'s what Holloway exploited.',
  },

  // ── Scene 5: SIEM correlation and SOAR playbooks ──────────────────────────
  {
    id: 'd7-s05',
    type: 'dialogue',
    location: 'Tokyo — Crisis Command Center',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      'The Tokyo SOC runs a SIEM — Security Information and Event Management — that ingests 4.2 million events per day from 340 log sources. The correlation rule that should have caught Holloway\'s lateral movement was disabled three weeks before the breach. The rule flagged accounts accessing more than five distinct system types within a sixty-minute window. It generated too many false positives during a software rollout. So someone turned it off. And never turned it back on. A SOAR playbook — Security Orchestration, Automation, and Response — would have automatically re-enabled that rule after the rollout window. But the playbook only ran on P1 alerts. The rollout was logged as P3.',
    knowledgeCheck: {
      question:
        'What is the PRIMARY difference between a SIEM and a SOAR platform?',
      options: [
        'SIEM detects threats by correlating log data; SOAR automates the response actions triggered by those detections',
        'SIEM is used for compliance reporting only; SOAR is used for active threat hunting',
        'SIEM requires human analysts; SOAR can operate completely without human involvement',
        'SIEM covers network traffic; SOAR covers endpoint activity',
      ],
      correctIndex: 0,
      explanation:
        'SIEM = collect, normalize, correlate, and alert on log data from across the environment. SOAR = automate the response workflow when an alert fires (create ticket, isolate endpoint, notify analyst, block IP). SIEM tells you what happened; SOAR acts on it. Most modern platforms combine both.',
      memoryHack:
        '"SIEM sees it, SOAR sorts it." Detection vs Response. SIEM is the smoke detector; SOAR is the sprinkler system that activates when the alarm triggers.',
    },
    xpReward: 50,
  },

  // ── Scene 6: Evidence acquisition order — volatile first ─────────────────
  {
    id: 'd7-s06',
    type: 'memory_hack',
    location: 'Tokyo — Forensics Station',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    speaker: 'narrator',
    dialogue:
      'As the incident response team began collecting evidence from the compromised systems, the order of acquisition was critical. Evidence that exists only in volatile memory disappears the moment power is cut.',
    memoryHack: {
      title: 'Evidence Acquisition Order — Most Volatile First (RFC 3227)',
      body: 'RFC 3227 defines the order for collecting digital evidence: capture the most volatile sources first, before they are lost.\n\nOrder from MOST to LEAST volatile:\n\n1. CPU registers and cache — lost when the processor moves to the next instruction\n2. RAM / Main Memory — lost when power is cut\n3. Running processes and network connections — lost when processes terminate\n4. Temporary files and swap space\n5. Disk storage (HDD/SSD) — persists without power\n6. Remote logging / SIEM logs — off-system, most durable\n7. Physical media (backups, optical) — most permanent\n\nCritical rule: NEVER power off a running compromised system before capturing RAM. The malware, decryption keys, and active network connections live in RAM. Powering down destroys the most valuable evidence.\n\nMemory Hook: "Catch the butterfly before it flies — freeze the live system, image the memory, THEN pull the power."',
    },
    xpReward: 50,
  },

  // ── Scene 7: Webb confronted at the Tokyo SOC — confession and context ────
  {
    id: 'd7-s07',
    type: 'dialogue',
    location: 'Tokyo — Crisis Command Center',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'webb',
    rightNPC: 'alex',
    speaker: 'webb',
    dialogue:
      '{playerName} lays out the timeline. The access approvals. The disabled correlation rule. The reactivated Kim account. All pointing to Webb. Webb doesn\'t deny any of it. "I didn\'t know what Holloway was doing. I made bad decisions — rushed approvals, disabled rules to stop alert fatigue, forgot to follow up on exceptions. I\'m not a conspirator. I\'m a manager who cut too many corners. And because of that, I was the gap that made everything else possible." He slides his access badge across the table. "Investigating myself was always going to end here."',
    xpReward: 50,
  },

  // ── Scene 8: Ransomware response decision matrix ──────────────────────────
  {
    id: 'd7-s08',
    type: 'tlatm',
    location: 'Tokyo — Crisis Command Center',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'A separate incident is developing: a ransomware group has encrypted three of Meridian\'s regional file servers and is demanding payment. The IR team is asking for a decision.',
    choices: [
      {
        text: 'Pay the ransom immediately — the business data is critical and we need it back fast.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'Paying the ransom does not guarantee data recovery, funds criminal operations, and may violate sanctions regulations depending on the threat actor\'s jurisdiction. It also signals that Meridian is a paying target, increasing the likelihood of repeat attacks. Payment is a last resort, not a first response.',
      },
      {
        text: 'Isolate the affected systems, restore from clean backups after verifying backup integrity, conduct root cause analysis to close the initial access vector, and notify law enforcement.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the complete IR response. Isolation (Containment) → restore from backups (Recovery) → RCA (Post-Incident) → law enforcement (Legal obligation). Verify backup integrity BEFORE restoring — ransomware sometimes encrypts backup targets. The correct sequence and the complete set of actions distinguish this from the partial answers.',
      },
      {
        text: 'Engage in negotiation with the threat actor while continuing the investigation.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Negotiation may be a last resort if backups are unavailable, but it should never be the first response. It requires specialized expertise, may create legal liability, and should only proceed with legal counsel and law enforcement coordination. Starting negotiation immediately signals desperation.',
      },
      {
        text: 'Restore from backups without isolating the encrypted systems to minimize downtime.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Restoring without isolating first means the ransomware may re-encrypt the restored systems. Isolation (Containment) must always precede Recovery. This is the CER order: Contain, Eradicate, Recover.',
      },
    ],
    xpReward: 50,
  },

  // ── Scene 9: DR testing types ─────────────────────────────────────────────
  {
    id: 'd7-s09',
    type: 'dialogue',
    location: 'Tokyo — Crisis Command Center',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Meridian\'s DR plan was tested last year — but only via a tabletop exercise. Nobody actually failed over the production database. A parallel test would have kept production running while activating DR systems simultaneously. A full interruption test — the real thing — would have found that the DR database in the Tokyo site was 6 hours behind the primary, well outside the 15-minute RPO. They found this out during the actual incident instead. The difference between discovering a DR gap in a test and discovering it during a breach is the difference between a lesson and a catastrophe.',
    knowledgeCheck: {
      question:
        'Which DR test type provides the MOST realistic assessment of recovery capability but carries the HIGHEST operational risk?',
      options: [
        'Tabletop exercise — team walks through the plan verbally without touching systems',
        'Parallel test — DR systems are activated alongside production without cutting over',
        'Full interruption test — production systems are deliberately taken offline to force actual failover',
        'Simulation exercise — team responds to a mock crisis scenario in a dedicated test environment',
      ],
      correctIndex: 2,
      explanation:
        'Full interruption testing (also called a full cutover test) is the most realistic: production is actually shut down and recovery systems must carry the full load. It finds gaps that parallel and tabletop tests miss, but it creates real downtime risk. Organizations should have a mature plan and high confidence in DR readiness before attempting a full interruption test.',
      memoryHack:
        'DR test ladder — climb from least to most disruptive: Tabletop (talk about it) → Walkthrough (trace the steps) → Simulation (pretend it\'s real) → Parallel (run both) → Full Interruption (cut the cord). Higher rung = more realistic, more risk.',
    },
    xpReward: 300,
  },
];

const domain8Scenes: StoryScene[] = [
  {
    id: 'd8-s01',
    type: 'narration',
    location: 'San Francisco',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    speaker: 'narrator',
    dialogue:
      'Meridian Global Technology — San Francisco. The root cause of the breach traces back here: the application development pipeline that built the trading platform Ghost Holloway exploited. The SDLC had no mandatory security gates. Holloway didn\'t just find a vulnerability — the evidence now suggests he introduced one.',
  },
  {
    id: 'd8-s02',
    type: 'dialogue',
    location: 'San Francisco',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The code commit log is damning. Three months before the breach, Holloway submitted a code change — a "performance optimization" for the database query layer. The PR was reviewed by a colleague. Approved in six minutes. No SAST scan was run. The change introduced a SQL injection vulnerability in the authentication bypass pathway. Textbook OWASP A03. The reviewer never tested it.',
    knowledgeCheck: {
      question:
        'Ghost Holloway introduced a SQL injection vulnerability through a code review that was approved without security testing. Which secure SDLC practice would MOST directly have prevented this?',
      options: [
        'Conducting penetration testing on the live production system after deployment',
        'Running Static Application Security Testing (SAST) on code submissions before merge',
        'Requiring all developers to complete annual security awareness training',
        'Implementing a Web Application Firewall to block SQL injection attempts',
      ],
      correctIndex: 1,
      explanation:
        'SAST analyzes source code before it executes, catching injection vulnerabilities at the point of introduction — before they reach production. Penetration testing finds it later (more expensive to fix). Security awareness training is preventive but not a technical control. WAFs are compensating controls, not source-level prevention.',
      memoryHack:
        '"Shift left" means catching bugs earlier. SAST = Source code analysis (Static). DAST = Deployed application testing (Dynamic). SAST finds it in the code before anyone runs it. The earlier you catch a vulnerability, the cheaper it is to fix.',
    },
  },
  {
    id: 'd8-s03',
    type: 'dialogue',
    location: 'San Francisco',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'Ghost Holloway is in custody. The full picture: he introduced the SQL injection vulnerability, exploited it with credentials obtained through ARP poisoning of the Singapore management network, used a covert timing channel to exfiltrate data past the security model, and covered his tracks by reactivating a deprovisioned account through the IAM backlog gap Marcus Webb left open. Every domain in the CISSP curriculum — in one breach.',
  },
  {
    id: 'd8-s04',
    type: 'dialogue',
    location: 'San Francisco',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'vasquez',
    rightNPC: 'alex',
    speaker: 'vasquez',
    dialogue:
      'Elena Vasquez calls in from the forensic lab. The CI/CD pipeline review is producing more findings than the SQL injection alone. The build pipeline ran without artifact signing, without provenance tracking, and pulled dependencies straight from public registries with no allow-list. {playerName} — Holloway\'s manual code change is only the tip. Something earlier was sitting in the pipeline. We need to talk about software supply chain.',
  },

  // ── Scene 5: The dependency confusion attack — root cause revealed ─────────
  {
    id: 'd8-s05',
    type: 'dialogue',
    location: 'San Francisco — DevOps Lab',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The forensic deep-dive into the CI/CD pipeline has surfaced the true root cause. It wasn\'t just the SQL injection Holloway introduced manually. Three months before that, a dependency confusion attack had already compromised the build pipeline. An internal package called "meridian-auth-utils" was published to the public npm registry by an external actor — with a higher version number than the internal package. Meridian\'s build server, configured to prefer the highest version, silently pulled the malicious public package instead of the legitimate internal one. The malicious package installed a backdoor that gave Holloway remote access before he ever typed a line of SQL.',
    knowledgeCheck: {
      question:
        'A dependency confusion attack succeeds when a build system pulls a malicious public package instead of the legitimate internal package with the same name. What configuration change MOST directly prevents this?',
      options: [
        'Require all developers to manually review package changelogs before each build',
        'Configure the package manager to use a private registry that explicitly scopes internal packages and blocks public resolution for those names',
        'Run DAST against the production application to detect any malicious packages post-deployment',
        'Implement code signing on all internal packages to verify authenticity',
      ],
      correctIndex: 1,
      explanation:
        'Dependency confusion is prevented by configuring the package manager to use a private registry (Artifactory, Azure Artifacts, npm Enterprise) as the exclusive source for internal package namespaces. When the build server only resolves internal package names from the private registry, there is no path to the malicious public package. Code signing is a secondary control; the private registry is the primary prevention.',
      memoryHack:
        'Dependency confusion = attacker publishes "your-internal-package" to a public registry with version 99.0.0. Your build system sees "higher version available" and pulls the attacker\'s version. Fix: namespace isolation in your private registry. "If it\'s ours, it only comes from ours."',
    },
    xpReward: 50,
  },

  // ── Scene 6: SDLC security gates in DevSecOps ────────────────────────────
  {
    id: 'd8-s06',
    type: 'memory_hack',
    location: 'San Francisco — DevOps Lab',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    speaker: 'narrator',
    dialogue:
      'Meridian\'s CI/CD pipeline had no security gates. Understanding where security fits in a modern software delivery lifecycle is a core CISSP competency.',
    memoryHack: {
      title: 'DevSecOps Pipeline Security Gates — "Shift Left"',
      body: 'Security gates in a DevSecOps pipeline stop vulnerabilities at the cheapest point of remediation:\n\nCODE (Developer Workstation)\n→ Pre-commit hooks: secret scanning (detect hardcoded credentials before commit)\n→ IDE SAST plugins: real-time vulnerability hints\n\nCOMMIT / PULL REQUEST\n→ SAST: automated source code analysis (OWASP Top 10 patterns, injection, XSS)\n→ Dependency scanning: SCA (Software Composition Analysis) checks for vulnerable libraries\n→ License compliance: flags GPL or other restricted licenses\n\nBUILD\n→ Container image scanning: checks base images for known CVEs\n→ Secrets detection: final check before artifact is created\n\nTEST (Staging)\n→ DAST: dynamic attacks against the running application\n→ IAST: instrumented testing during functional test runs\n\nDEPLOY\n→ Infrastructure-as-Code scanning: Terraform/CloudFormation security misconfiguration checks\n→ Policy gates: compliance checks before production promotion\n\nPRODUCTION\n→ RASP: runtime self-protection\n→ WAF: web application firewall\n→ SIEM/SOAR: continuous monitoring\n\n"Shift Left" = move security earlier in the pipeline. A vulnerability caught in code review costs 1x. The same vulnerability found in production costs 100x.',
    },
    xpReward: 50,
  },

  // ── Scene 7: OWASP Top 10 2021 — Holloway's techniques mapped ────────────
  {
    id: 'd8-s07',
    type: 'dialogue',
    location: 'San Francisco — DevOps Lab',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The forensic code analysis maps Holloway\'s attack directly to the OWASP Top 10 2021. The SQL injection was A03 — Injection. The broken access control that let his developer account reach production databases was A01 — the single most common vulnerability class across the web. The dependency confusion attack exploited A06 — Vulnerable and Outdated Components. The insecure CI/CD pipeline configuration fell under A05 — Security Misconfiguration. In a single breach, Holloway exploited four of the top six most critical web application vulnerability categories. Not because they were zero-days. Because they were well-known, well-documented, and Meridian chose not to address them.',
    knowledgeCheck: {
      question:
        'According to the OWASP Top 10 2021, which vulnerability class is ranked #1 and represents the MOST prevalent web application security risk?',
      options: [
        'A02 — Cryptographic Failures (formerly Sensitive Data Exposure)',
        'A03 — Injection (SQL, command, LDAP injection attacks)',
        'A01 — Broken Access Control (authorization bypass, privilege escalation)',
        'A07 — Identification and Authentication Failures',
      ],
      correctIndex: 2,
      explanation:
        'OWASP Top 10 2021 ranks Broken Access Control (#1) as the most widespread vulnerability — found in 94% of tested applications. It moved up from #5 in the 2017 list. Broken Access Control includes IDOR (Insecure Direct Object Reference), missing authorization checks, and privilege escalation. Injection dropped to #3 from the top spot it held for over a decade.',
      memoryHack:
        'OWASP 2021 Top 3: "Access, Crypto, Inject." A01 Broken Access Control → A02 Cryptographic Failures → A03 Injection. The old king (Injection) got dethroned by Access Control failures because they\'re everywhere and easy to exploit without technical sophistication.',
    },
    xpReward: 50,
  },

  // ── Scene 8: Secure API design ────────────────────────────────────────────
  {
    id: 'd8-s08',
    type: 'dialogue',
    location: 'San Francisco — DevOps Lab',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The API layer Holloway exploited had two critical design failures. First, the API returned entire database objects — including fields the calling application didn\'t need. A client record query returned social insurance numbers, credit scores, and internal risk flags alongside the name and address the front-end actually displayed. Mass assignment vulnerability: the attacker queried the API and walked away with far more than the application was designed to show. Second, the API had no rate limiting. Holloway\'s exfiltration script made 4,400 API calls in three minutes. The SIEM correlation rule that should have caught that was the same one Webb had disabled.',
    xpReward: 50,
  },

  // ── Scene 9: TLATM — DevSecOps mandate ───────────────────────────────────
  {
    id: 'd8-s09',
    type: 'tlatm',
    location: 'San Francisco — DevOps Lab',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'alex',
    speaker: 'alex',
    dialogue:
      'The development team is resistant to mandatory security gates in the CI/CD pipeline. They say it will slow delivery. As the security manager, what is your response?',
    choices: [
      {
        text: 'Make security gates optional for sprint deadlines — developers can bypass them if they write a justification.',
        xpBonus: 5,
        isCorrect: false,
        response:
          'Optional security controls are not controls. Under deadline pressure, every sprint becomes a bypass justification. This creates a paper trail that looks like process while providing no actual protection. Meridian already proved what happens when controls are exceptions-based.',
      },
      {
        text: 'Implement security gates as hard pipeline gates — builds that fail SAST or dependency scanning do not proceed to deployment. Invest in tuning rules to minimize false positives so developers do not experience them as friction.',
        xpBonus: 50,
        isCorrect: true,
        response:
          'This is the DevSecOps answer. Security gates must be automated and mandatory — not advisory. The key to developer adoption is tuning: a gate that fires accurate, actionable alerts is accepted. A gate with a 40% false positive rate gets bypassed. Invest in tuning the rules, not in making them optional.',
      },
      {
        text: 'Hire a dedicated AppSec team to review every pull request manually instead of using automated gates.',
        xpBonus: 15,
        isCorrect: false,
        response:
          'Manual review cannot scale at the pace of modern development. A six-person AppSec team reviewing 200 daily pull requests will become a bottleneck within weeks, or review nothing meaningfully. Automated gates handle volume; AppSec humans handle complexity. Both are needed — automated first.',
      },
      {
        text: 'Accept the risk of missing security gates and rely on penetration testing to find vulnerabilities post-deployment.',
        xpBonus: 10,
        isCorrect: false,
        response:
          'Post-deployment pen testing finds vulnerabilities after they\'ve been shipped to customers. The cost to fix is 10x higher than catching them at the code level, and customers are exposed in the interim. Risk acceptance requires documented business justification and compensating controls — not just a preference to ship fast.',
      },
    ],
    xpReward: 50,
  },

  // ── Scene 10: Meridian resolution — Dr. Tanaka's closing ─────────────────
  {
    id: 'd8-s10',
    type: 'dialogue',
    location: 'San Francisco',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    leftNPC: 'tanaka',
    rightNPC: 'alex',
    speaker: 'tanaka',
    dialogue:
      'Dr. Tanaka has flown in from Toronto. She looks exhausted but satisfied. "You traced the whole thing, {playerName}. From the risk register entry that nobody acted on, to the governance failure that let an exception become a permanent privilege, to the architecture flaw, to the network attack, to the code that should never have passed review. And now: the dependency confusion attack hiding in the build pipeline that nobody was watching. Ghost Holloway didn\'t find gaps. He exploited gaps that already existed — in our process, our culture, and our assumptions. This is what CISSP mastery looks like in the real world. Not a certification. A way of thinking." She hands {playerName} a document: Meridian\'s security transformation roadmap. "Now help us fix it."',
    xpReward: 500,
  },
];

// ─── Domain Chapter Registry ──────────────────────────────

export const MERIDIAN_CHAPTERS: Record<number, DomainChapter> = {
  1: {
    domainId: 1,
    domainName: 'Security and Risk Management',
    location: 'Toronto, Canada',
    locationEmoji: '🍁',
    background: LOCATION_GRADIENTS_V2['toronto'],
    primaryNPC: 'tanaka',
    scenes: domain1Scenes,
  },
  2: {
    domainId: 2,
    domainName: 'Asset Security',
    location: 'London, UK',
    locationEmoji: '🏛️',
    background: LOCATION_GRADIENTS_V2['london'],
    primaryNPC: 'sharma',
    scenes: domain2Scenes,
  },
  3: {
    domainId: 3,
    domainName: 'Security Architecture and Engineering',
    location: 'Munich, Germany',
    locationEmoji: '🏰',
    background: LOCATION_GRADIENTS_V2['munich'],
    primaryNPC: 'vasquez',
    scenes: domain3Scenes,
  },
  4: {
    domainId: 4,
    domainName: 'Communication and Network Security',
    location: 'Singapore',
    locationEmoji: '🌐',
    background: LOCATION_GRADIENTS_V2['singapore'],
    primaryNPC: 'alex',
    scenes: domain4Scenes,
  },
  5: {
    domainId: 5,
    domainName: 'Identity and Access Management',
    location: 'New York, USA',
    locationEmoji: '🗽',
    background: LOCATION_GRADIENTS_V2['new-york'],
    primaryNPC: 'webb',
    scenes: domain5Scenes,
  },
  6: {
    domainId: 6,
    domainName: 'Security Assessment and Testing',
    location: 'Remote Forensics Lab',
    locationEmoji: '🔬',
    background: LOCATION_GRADIENTS_V2['remote-lab'],
    primaryNPC: 'vasquez',
    scenes: domain6Scenes,
  },
  7: {
    domainId: 7,
    domainName: 'Security Operations',
    location: 'Tokyo, Japan',
    locationEmoji: '🗼',
    background: LOCATION_GRADIENTS_V2['tokyo'],
    primaryNPC: 'webb',
    scenes: domain7Scenes,
  },
  8: {
    domainId: 8,
    domainName: 'Software Development Security',
    location: 'San Francisco, USA',
    locationEmoji: '🌉',
    background: LOCATION_GRADIENTS_V2['san-francisco'],
    primaryNPC: 'alex',
    scenes: domain8Scenes,
  },
};

// ─── Public API ────────────────────────────────────────────

export function getMeridianChapter(domainId: number): DomainChapter | null {
  return MERIDIAN_CHAPTERS[domainId] ?? null;
}

export function getMeridianScene(
  domainId: number,
  sceneId: string,
): { scene: StoryScene; index: number } | null {
  const chapter = MERIDIAN_CHAPTERS[domainId];
  if (!chapter) return null;
  const index = chapter.scenes.findIndex((s) => s.id === sceneId);
  if (index === -1) return null;
  return { scene: chapter.scenes[index], index };
}
