import { ActDefinition } from '@/lib/story-types';

export const domain3Act1: ActDefinition = {
  actNumber: 1,
  title: 'The Briefing',
  description:
    'A critical server farm in Zurich has been compromised through a fundamental architecture flaw. Learn Security Models (Bell-LaPadula, Biba, Clark-Wilson), Secure Design Principles, Defense in Depth, Symmetric and Asymmetric Cryptography, Hashing, Common Criteria, and Covert Channels.',
  xpReward: 250,
  conceptsCovered: [
    'Bell-LaPadula Model',
    'Biba Model',
    'Clark-Wilson Model',
    'Secure Design Principles',
    'Defense in Depth',
    'Symmetric Cryptography',
    'Asymmetric Cryptography',
    'Hashing',
    'Common Criteria',
    'Covert Channels',
  ],
  estimatedMinutes: 22,
  nodes: [
    // ================================================================
    // SCENE 1 — Narrative Setup: Arrive at Zurich Server Farm
    // ================================================================

    // 1-1. Transition — arrive at Zurich
    {
      type: 'transition',
      id: 'd3a1s1-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Zurich, Switzerland',
      animation: 'fade',
    },

    // 1-2. Reeves introduces the mission
    {
      type: 'dialogue',
      id: 'd3a1s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Welcome to Zurich, {player}. This facility is one of the most hardened server farms in Europe — or at least it was. Seventy-two hours ago, an attacker exfiltrated classified engineering schematics without tripping a single perimeter alarm. They didn\'t break in through the front door. They exploited the architecture itself.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-3. Player responds
    {
      type: 'dialogue',
      id: 'd3a1s1-dialogue-2',
      speaker: 'player',
      speakerSide: 'right',
      text: 'Exploited the architecture? You mean the building design or the security model?',
      rightCharacter: 'player',
      rightExpression: 'thinking',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-4. Reeves explains the situation
    {
      type: 'dialogue',
      id: 'd3a1s1-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The security model. The facility trusted a formal access control model to enforce confidentiality, but the implementation had a fatal flaw. The attacker found a way to move data between classification levels without authorization. Your job is to understand these models inside and out so you can figure out exactly how they pulled it off.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 1-5. Evidence — Breach Incident Summary
    {
      type: 'evidence',
      id: 'd3a1s1-evidence-1',
      title: 'ZURICH CAMPUS — Architecture Breach Report',
      classification: 'TOP SECRET',
      content:
        'An unknown actor exploited a design weakness in the facility\'s formal security model to exfiltrate classified engineering schematics. The attacker leveraged improper information flow controls to read data above their clearance level and write it to a lower-classification output channel.',
      evidenceItems: [
        { label: 'Incident Code', value: 'SHADOW-ARCH-003', highlight: true },
        { label: 'Detection Delay', value: '72 hours post-exfiltration' },
        { label: 'Attack Vector', value: 'Security model implementation flaw', highlight: true },
        { label: 'Data Exfiltrated', value: 'Classified engineering schematics (Top Secret)' },
        { label: 'Root Cause', value: 'Improper information flow enforcement', highlight: true },
        { label: 'Covert Channel', value: 'Storage channel detected in audit logs', highlight: true },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue:
        'Read this carefully, {player}. The attacker didn\'t need stolen credentials or zero-day exploits. They used the system\'s own rules against it. That\'s a Domain 3 failure — security architecture and engineering. Everything we investigate today traces back to how systems are designed, what models they follow, and how cryptography protects the data flowing through them.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 1-6. Reeves introduces Janet for the deep dive
    {
      type: 'dialogue',
      id: 'd3a1s1-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Janet is our architecture specialist. She\'s going to walk you through the formal security models this facility relied on — and where they broke down. Janet, the floor is yours.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'janet',
      rightExpression: 'neutral',
    },

    // ================================================================
    // SCENE 2 — Bell-LaPadula Model (Janet, "Top-Secret Library")
    // ================================================================

    // 2-1. Janet introduces Bell-LaPadula
    {
      type: 'dialogue',
      id: 'd3a1s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Let\'s start with the model this facility was built on, {player}. Bell-LaPadula — or BLP. It\'s the gold standard for enforcing confidentiality. I call it the "Top-Secret Library." Imagine a library where the floors represent classification levels: Unclassified on the ground floor, Confidential on the second, Secret on the third, and Top Secret at the top.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2-2. Janet explains the two core rules
    {
      type: 'dialogue',
      id: 'd3a1s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'BLP has two rules. First: "No Read Up" — also called the Simple Security Property. A person on the second floor cannot go upstairs to read Top Secret books. You can only read at your level or BELOW. Second: "No Write Down" — the Star (*) Property. A person on the Top Secret floor cannot carry a book downstairs. You can only write at your level or ABOVE. This prevents classified data from flowing to lower clearance levels.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 2-3. Interactive Image — Top-Secret Library (BLP)
    {
      type: 'interactiveImage',
      id: 'd3a1s2-interactive-1',
      title: 'The Top-Secret Library — Bell-LaPadula Model',
      imageType: 'exploration',
      backgroundGradient:
        'linear-gradient(135deg, #0a1628 0%, #1a1040 40%, #0d1f3c 100%)',
      conceptName: 'Bell-LaPadula Model',
      speaker: 'janet',
      dialogue:
        'Explore the library floors. Click each level to see how BLP controls information flow. Notice that data can only flow upward — never down.',
      completionDialogue:
        'Now you see the pattern. BLP is all about CONFIDENTIALITY — keeping secrets from leaking downward. "No Read Up, No Write Down." The attacker at this facility violated the Star Property — they found a way to write Top Secret data down to an Unclassified output channel.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'blp-top-secret',
          label: 'Top Secret Floor (Level 4)',
          x: 10,
          y: 10,
          width: 80,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Top Secret floor. A user with Top Secret clearance can READ everything on this floor and all floors below — Unclassified, Confidential, Secret, and Top Secret. But they can only WRITE here or above. Since there\'s nothing above Top Secret, their writes stay at this level. This prevents them from accidentally copying classified data to a lower floor.',
          detail:
            'Simple Security (No Read Up): TS can read TS, S, C, U. Star Property (No Write Down): TS can write to TS only.',
        },
        {
          id: 'blp-secret',
          label: 'Secret Floor (Level 3)',
          x: 10,
          y: 30,
          width: 80,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Secret floor. A Secret-cleared user can read Secret, Confidential, and Unclassified — but NOT Top Secret. They can write to Secret or Top Secret, but NOT down to Confidential or Unclassified. Writing up is allowed because it doesn\'t leak secrets to lower levels.',
          detail:
            'Simple Security (No Read Up): S can read S, C, U. Star Property (No Write Down): S can write to S or TS.',
        },
        {
          id: 'blp-confidential',
          label: 'Confidential Floor (Level 2)',
          x: 10,
          y: 50,
          width: 80,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Confidential floor. A Confidential-cleared user can read Confidential and Unclassified only. They can write to Confidential, Secret, or Top Secret. They\'re locked out of higher reading but can send information upward safely.',
          detail:
            'Simple Security (No Read Up): C can read C, U. Star Property (No Write Down): C can write to C, S, or TS.',
        },
        {
          id: 'blp-unclassified',
          label: 'Unclassified Floor (Level 1)',
          x: 10,
          y: 70,
          width: 80,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue:
            'Ground floor — Unclassified. Everyone can read here. An Unclassified user can write to ANY level above, but can only read Unclassified data. This is the most restricted reading level but the most permissive writing level. Remember: "write up" is fine because it doesn\'t leak secrets.',
          detail:
            'Simple Security (No Read Up): U can read U only. Star Property (No Write Down): U can write to U, C, S, or TS.',
        },
      ],
    },

    // 2-4. Janet ties it to the breach
    {
      type: 'dialogue',
      id: 'd3a1s2-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Here\'s the critical point: BLP protects CONFIDENTIALITY only. It says nothing about integrity. An Unclassified user could theoretically WRITE garbage into the Top Secret floor — BLP wouldn\'t stop it because "write up" is allowed. That\'s a huge limitation, and it\'s exactly why we need a second model.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 2-5. Knowledge Check — Bell-LaPadula
    {
      type: 'knowledgeCheck',
      id: 'd3a1s2-kc-1',
      question:
        'A user with Secret clearance attempts to save a document to a Confidential-level shared folder. Under the Bell-LaPadula model, what is the MOST accurate outcome?',
      options: [
        'The action is allowed because the user has higher clearance than the folder',
        'The action is denied because it violates the Star (*) Property — no writing to lower classification levels',
        'The action is allowed because BLP only restricts reading, not writing',
        'The action is denied because it violates the Simple Security Property',
      ],
      correctIndex: 1,
      explanation:
        'The Star (*) Property of Bell-LaPadula states "No Write Down." A Secret-cleared user cannot write to a Confidential folder because that would move data from a higher classification to a lower one — a confidentiality violation. The Simple Security Property governs reading ("No Read Up"), not writing. Option A is the classic trap — higher clearance does NOT mean you can write anywhere.',
      memoryHack:
        'Top-Secret Library: "No Read Up, No Write Down." BLP = Confidentiality. Star (*) = writing rule = no carrying books DOWNSTAIRS. Simple Security = reading rule = no sneaking UPSTAIRS. Exam trap: BLP does NOT protect integrity — that\'s Biba\'s job.',
      conceptName: 'Bell-LaPadula Model',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 3 — Biba Model (Janet, "Recipe Integrity Kitchen")
    // ================================================================

    // 3-1. Janet introduces Biba
    {
      type: 'dialogue',
      id: 'd3a1s3-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Now here\'s where it gets interesting, {player}. BLP\'s blind spot is integrity — and that\'s exactly what Biba was designed to fix. If BLP is the Top-Secret Library, then Biba is the "Recipe Integrity Kitchen." Imagine a five-star restaurant kitchen where recipes are sacred. The head chef\'s recipes must NEVER be contaminated by unreliable sources.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 3-2. Janet explains Biba's rules
    {
      type: 'dialogue',
      id: 'd3a1s3-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Biba is the mirror image of BLP. Two rules, but FLIPPED. First: "No Read Down" — the Simple Integrity Axiom. The head chef never reads recipes from the street vendor\'s notebook. You can only read at your integrity level or ABOVE to avoid being contaminated by untrustworthy data. Second: "No Write Up" — the Star (*) Integrity Axiom. A line cook cannot modify the head chef\'s recipe. You can only write at your level or BELOW.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 3-3. Visual Aid — BLP vs Biba comparison
    {
      type: 'visualAid',
      id: 'd3a1s3-visual-1',
      title: 'Top-Secret Library vs Recipe Kitchen — BLP and Biba Compared',
      aidType: 'comparison',
      headers: ['Bell-LaPadula (Confidentiality)', 'Biba (Integrity)'],
      rows: [
        ['No Read Up (Simple Security)', 'No Read Down (Simple Integrity)'],
        ['No Write Down (Star Property)', 'No Write Up (Star Integrity)'],
        ['Protects CONFIDENTIALITY', 'Protects INTEGRITY'],
        ['Prevents secrets from leaking DOWN', 'Prevents corruption from flowing UP'],
        ['Data flows UP only', 'Data flows DOWN only'],
        ['Military/government focus', 'Commercial/financial focus'],
      ],
      speaker: 'janet',
      dialogue:
        'See the mirror? BLP and Biba are exact opposites. BLP says data flows UP to protect confidentiality. Biba says data flows DOWN to protect integrity. The exam LOVES confusing these two. Remember: BLP = Library (Confidentiality), Biba = Kitchen (Integrity).',
      leftCharacter: 'janet',
      leftExpression: 'serious',
    },

    // 3-4. Janet connects to the breach
    {
      type: 'dialogue',
      id: 'd3a1s3-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'At this facility, they implemented BLP to protect confidentiality but neglected Biba for integrity. The attacker used that gap — they wrote corrupted configuration files upward into the system, which eventually caused a trusted process to dump classified data into an unprotected log file. BLP alone wasn\'t enough.',
      leftCharacter: 'janet',
      leftExpression: 'worried',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 3-5. Knowledge Check — Biba
    {
      type: 'knowledgeCheck',
      id: 'd3a1s3-kc-1',
      question:
        'A junior analyst at a financial institution attempts to modify the official quarterly earnings report, which is maintained at a high integrity level. Under the Biba model, what BEST describes the outcome?',
      options: [
        'The modification is allowed because Biba only restricts reading',
        'The modification is denied because it violates the Star (*) Integrity Axiom — no writing to higher integrity levels',
        'The modification is allowed because the analyst has valid credentials',
        'The modification is denied because it violates the Simple Integrity Axiom',
      ],
      correctIndex: 1,
      explanation:
        'The Star (*) Integrity Axiom of Biba states "No Write Up." A junior analyst at a lower integrity level cannot modify a high-integrity document because that would allow untrusted data to corrupt a trusted source. The Simple Integrity Axiom governs reading ("No Read Down"), not writing. This is the mirror image of BLP\'s Star Property.',
      memoryHack:
        'Recipe Kitchen: "No Read Down, No Write Up." Biba = Integrity. A line cook (low integrity) can\'t rewrite the head chef\'s (high integrity) recipes. BLP and Biba are mirrors: flip the direction, flip the goal. BLP protects secrets (Confidentiality). Biba protects accuracy (Integrity).',
      conceptName: 'Biba Model',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 4 — Clark-Wilson Model (Janet, "Bank Transaction Clerk")
    // ================================================================

    // 4-1. Janet introduces Clark-Wilson
    {
      type: 'dialogue',
      id: 'd3a1s4-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'BLP and Biba are elegant but rigid — they come from military thinking. The real world, especially commercial environments, needs something more practical. Enter Clark-Wilson. I call it the "Bank Transaction Clerk" model. Imagine a bank where tellers can\'t just reach into the vault. Every transaction must go through a verified, auditable process.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4-2. Janet explains key components
    {
      type: 'dialogue',
      id: 'd3a1s4-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Clark-Wilson has three key components. First: Constrained Data Items, or CDIs — the critical data that must be protected, like bank account balances. Second: Transformation Procedures, or TPs — the only approved programs allowed to touch the CDIs, like the teller\'s transaction software. Third: the Access Triple — every access must be validated as a triple of Subject, TP, and CDI. A user can ONLY touch data through an approved program. No direct access, ever.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4-3. Janet explains well-formed transactions and separation of duties
    {
      type: 'dialogue',
      id: 'd3a1s4-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Two principles make it work. Well-formed transactions — every operation follows a strict, auditable procedure. A teller can\'t just type a new balance; the system calculates it from the deposit or withdrawal amount. And separation of duties — the person who initiates a transaction can\'t also approve it. The teller processes the deposit, but a manager must authorize transfers above a threshold.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4-4. Visual Aid — Clark-Wilson components
    {
      type: 'visualAid',
      id: 'd3a1s4-visual-1',
      title: 'Bank Transaction Clerk — Clark-Wilson Model',
      aidType: 'list',
      items: [
        {
          label: 'CDI (Constrained Data Item) = Bank Account Balance',
          description:
            'The critical data that must maintain integrity. Users can NEVER directly modify CDIs. All changes must go through an approved Transformation Procedure. Think of it as the vault — no one walks in without going through the teller window.',
        },
        {
          label: 'UDI (Unconstrained Data Item) = Deposit Slip',
          description:
            'Input data from the outside world that has NOT been validated yet. Must be converted into a CDI through a proper TP. Like the customer\'s handwritten deposit slip — untrusted until the teller verifies it.',
        },
        {
          label: 'TP (Transformation Procedure) = Teller Software',
          description:
            'The ONLY approved programs that can modify CDIs. Each TP is tested, certified, and audited. The teller\'s system calculates the new balance — the teller doesn\'t type it manually.',
        },
        {
          label: 'Access Triple = (User, TP, CDI)',
          description:
            'Every access is validated as a triple. User X can use TP Y to modify CDI Z — and ONLY that combination. A teller can process deposits but can\'t run the wire transfer program. An auditor can read balances but can\'t run any TPs.',
        },
        {
          label: 'IVP (Integrity Verification Procedure) = End-of-Day Audit',
          description:
            'Confirms that CDIs are in a valid state. Like the bank\'s end-of-day reconciliation — do all the debits and credits add up? If not, something went wrong in a TP.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'Clark-Wilson is the most practical model for commercial environments. Unlike BLP and Biba, which use lattice-based access levels, Clark-Wilson uses access triples and well-formed transactions. It\'s what most modern database and ERP systems are based on. Remember from the City Blueprint back at HQ — separation of duties was a governance principle. Clark-Wilson bakes it directly into the model.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
    },

    // 4-5. Knowledge Check — Clark-Wilson
    {
      type: 'knowledgeCheck',
      id: 'd3a1s4-kc-1',
      question:
        'A database administrator has direct SQL access to modify customer account balances, bypassing the banking application. Which Clark-Wilson principle is MOST directly violated?',
      options: [
        'The Star (*) Property',
        'The requirement that subjects access CDIs only through authorized TPs (access triples)',
        'The Simple Security Property',
        'The principle of least privilege',
      ],
      correctIndex: 1,
      explanation:
        'Clark-Wilson requires that all access to CDIs (account balances) go through authorized TPs (the banking application). Direct SQL access bypasses the transformation procedure entirely, violating the access triple requirement. Options A and C are Bell-LaPadula properties, not Clark-Wilson. Least privilege is a general principle, but the MOST directly violated concept is Clark-Wilson\'s access triple enforcement.',
      memoryHack:
        'Bank Transaction Clerk: NEVER bypass the teller window! Subject must use TP to reach CDI. Direct access = Clark-Wilson violation. If you see "bypassing the application" in a question, think Clark-Wilson access triples immediately.',
      conceptName: 'Clark-Wilson Model',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 5 — Secure Design Principles (Janet, "Architect's Golden Rules")
    // ================================================================

    // 5-1. Janet transitions to design principles
    {
      type: 'dialogue',
      id: 'd3a1s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Those three models — BLP, Biba, and Clark-Wilson — are the formal foundations. But models alone don\'t build secure systems, {player}. You also need design principles. I call these the "Architect\'s Golden Rules." Think of them as the commandments every security architect follows when building any system, whether it\'s a server farm or a mobile app.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5-2. Visual Aid — Secure Design Principles
    {
      type: 'visualAid',
      id: 'd3a1s5-visual-1',
      title: 'Architect\'s Golden Rules — Secure Design Principles',
      aidType: 'list',
      items: [
        {
          label: '1. Least Privilege',
          description:
            'Give users the MINIMUM access needed to do their job — no more, no less. Remember the Hospital Staff Hierarchy from HQ? A nurse doesn\'t get the director\'s master key. At this server farm, the attacker exploited an account with more privileges than its role required.',
        },
        {
          label: '2. Fail Securely (Fail-Safe)',
          description:
            'When a system crashes, it should default to a SECURE state, not an open one. If the firewall fails, it should BLOCK all traffic (fail closed), not allow everything through (fail open). Exam trap: "fail-safe" in security means DENY by default.',
        },
        {
          label: '3. Defense in Depth',
          description:
            'Multiple overlapping layers of security. If one layer fails, the next catches the threat. We\'ll dive deep into this next — Kai has a great analogy for it.',
        },
        {
          label: '4. KISS (Keep It Simple)',
          description:
            'Complex systems have more attack surface. Simpler designs are easier to secure, audit, and maintain. Every unnecessary feature is a potential vulnerability.',
        },
        {
          label: '5. Secure Defaults',
          description:
            'Out of the box, a system should be locked down. Users opt IN to access, not opt OUT of exposure. The Zurich facility shipped servers with default admin credentials enabled — a catastrophic secure-default failure.',
        },
        {
          label: '6. Complete Mediation',
          description:
            'EVERY access request must be checked — not just the first one. No caching of permissions. If a user\'s clearance is revoked at 2 PM, the system must deny their 2:01 PM request, not rely on a cached approval from 1 PM.',
        },
        {
          label: '7. Open Design (Kerckhoffs\'s Principle)',
          description:
            'Security should not depend on secrecy of the design. Algorithms should be public — only the KEY is secret. AES is openly published and reviewed by thousands of cryptographers. That\'s what makes it trustworthy. Security through obscurity is not a design principle — it\'s a prayer.',
        },
      ],
      speaker: 'janet',
      dialogue:
        'These principles aren\'t optional — they\'re foundational. The Zurich breach violated at least three of them: excessive privileges, missing complete mediation, and insecure defaults. Every exam question about system design traces back to one of these golden rules.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
    },

    // 5-3. Player comment
    {
      type: 'dialogue',
      id: 'd3a1s5-dialogue-2',
      speaker: 'player',
      speakerSide: 'right',
      text: 'So the architects had formal models in place but ignored the design principles. The blueprint was drawn, but the building code was never enforced.',
      rightCharacter: 'player',
      rightExpression: 'thinking',
      leftCharacter: 'janet',
      leftExpression: 'smile',
    },

    // 5-4. Janet confirms
    {
      type: 'dialogue',
      id: 'd3a1s5-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Exactly, {player}. Remember the City Blueprint from HQ — policies, standards, procedures? A model without design principles enforced around it is like a city constitution with no building code. The rules exist on paper, but nobody checks the construction. Now let\'s look at defense in depth — because Kai has a way of explaining it that will stick with you.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // ================================================================
    // SCENE 6 — Defense in Depth (Kai, "Medieval Castle Layers")
    // ================================================================

    // 6-1. Transition
    {
      type: 'transition',
      id: 'd3a1s6-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Network Operations Center',
      animation: 'slide',
    },

    // 6-2. Kai introduces Defense in Depth
    {
      type: 'dialogue',
      id: 'd3a1s6-dialogue-1',
      speaker: 'kai',
      speakerSide: 'right',
      text: 'My turn, {player}! Defense in depth is my favorite concept, and I explain it the same way every time: "Medieval Castle Layers." A castle doesn\'t rely on just one wall. It has a moat, an outer wall, an inner wall, a keep, guards, and locked doors. Each layer slows the attacker down. If one falls, the next still stands.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'kai',
      rightExpression: 'smile',
    },

    // 6-3. Interactive Image — Medieval Castle Layers
    {
      type: 'interactiveImage',
      id: 'd3a1s6-interactive-1',
      title: 'Medieval Castle Layers — Defense in Depth',
      imageType: 'exploration',
      backgroundGradient:
        'linear-gradient(180deg, #0d1117 0%, #161b22 40%, #1a1e2e 100%)',
      conceptName: 'Defense in Depth',
      speaker: 'kai',
      dialogue:
        'Click each castle layer to see how it maps to a real security control. Three categories of controls work together: physical, technical, and administrative.',
      completionDialogue:
        'That\'s the full castle. Physical controls stop the body, technical controls stop the bits, and administrative controls stop the behavior. At the Zurich campus, they had strong physical and technical layers — but their administrative layer was weak. Policies weren\'t enforced, and that\'s how the attacker found a gap between the walls.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'castle-moat',
          label: 'The Moat — Physical Controls',
          x: 5,
          y: 65,
          width: 90,
          height: 18,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Physical controls are the moat and outer wall — fences, locks, guards, cameras, mantraps, environmental controls. They stop unauthorized PHYSICAL access. At the Zurich campus, the physical security was excellent: biometric entry, mantrap doors, 24/7 guards. The attacker never needed to breach this layer.',
          detail:
            'Physical controls: fences, guards, locks, CCTV, biometrics, mantraps, Faraday cages, fire suppression, HVAC controls.',
        },
        {
          id: 'castle-walls',
          label: 'The Walls — Technical Controls',
          x: 15,
          y: 35,
          width: 70,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Technical (logical) controls are the castle walls and gates — firewalls, IDS/IPS, encryption, access control lists, antivirus, MFA. They stop unauthorized DIGITAL access. The Zurich facility had firewalls, network segmentation, and encryption. But a misconfigured access control on an internal process left a gap in the wall.',
          detail:
            'Technical controls: firewalls, IDS/IPS, encryption, ACLs, MFA, antivirus/EDR, DLP, SIEM, network segmentation, VPNs.',
        },
        {
          id: 'castle-guards',
          label: 'The Guards — Administrative Controls',
          x: 30,
          y: 10,
          width: 40,
          height: 22,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue:
            'Administrative controls are the castle\'s rules of engagement — policies, procedures, training, background checks, separation of duties, incident response plans. They govern HUMAN behavior. This is where Zurich failed. The internal process that leaked data was never audited against policy. No one verified it followed the security model. Administrative controls are the layer attackers most frequently exploit because humans are the weakest link.',
          detail:
            'Administrative controls: policies, procedures, training, background checks, separation of duties, incident response plans, change management, security awareness programs.',
        },
      ],
    },

    // 6-4. Knowledge Check — Defense in Depth
    {
      type: 'knowledgeCheck',
      id: 'd3a1s6-kc-1',
      question:
        'An organization has firewalls, IDS, and encryption in place, but an insider successfully exfiltrates data by emailing it to a personal account. Which category of controls MOST likely needs strengthening?',
      options: [
        'Physical controls — better locks and cameras are needed',
        'Technical controls — the firewall should have blocked the email',
        'Administrative controls — policies, training, and monitoring of user behavior',
        'Compensating controls — additional encryption should be applied',
      ],
      correctIndex: 2,
      explanation:
        'The insider bypassed strong technical controls by using an authorized channel (email) in an unauthorized way. This is an administrative control failure — policies on data handling, DLP rules for outbound email, user training on acceptable use, and monitoring of behavioral anomalies. Physical controls are irrelevant to email exfiltration. While a DLP tool is technical, the ROOT cause is the lack of administrative policy enforcement.',
      memoryHack:
        'Medieval Castle Layers: Insider threats bypass the moat and walls — they\'re already inside the castle. You need the GUARDS (administrative controls) watching behavior, not more walls. Remember: three categories — Physical (body), Technical (bits), Administrative (behavior).',
      conceptName: 'Defense in Depth',
      speaker: 'kai',
      rightCharacter: 'kai',
      rightExpression: 'thinking',
    },

    // ================================================================
    // SCENE 7 — Symmetric Cryptography (Janet, "Shared House Key")
    // ================================================================

    // 7-1. Transition
    {
      type: 'transition',
      id: 'd3a1s7-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Cryptographic Systems Lab',
      animation: 'slide',
    },

    // 7-2. Janet introduces symmetric cryptography
    {
      type: 'dialogue',
      id: 'd3a1s7-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Now we get into the cryptography that protects — or in this case, failed to protect — the data at rest. Let\'s start with symmetric encryption. I call it the "Shared House Key." You and your roommate have identical copies of the same key. Either of you can lock the door, and either of you can unlock it. Same key for both operations.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7-3. Janet explains the details
    {
      type: 'dialogue',
      id: 'd3a1s7-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The major algorithms are AES — the current gold standard at 128, 192, or 256 bits — and the older DES (56-bit, broken) and 3DES (three rounds of DES, being retired). Symmetric encryption is FAST, which makes it ideal for bulk data encryption. But it has a fatal weakness: key distribution. If you have 100 people who all need to communicate securely in pairs, you need n times n-minus-1 divided by 2 keys. For 100 people, that\'s 4,950 keys to manage.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7-4. Visual Aid — Symmetric Crypto quick reference
    {
      type: 'visualAid',
      id: 'd3a1s7-visual-1',
      title: 'Shared House Key — Symmetric Cryptography',
      aidType: 'table',
      headers: ['Algorithm', 'Key Size', 'Block Size', 'Status'],
      rows: [
        ['DES', '56 bits', '64 bits', 'BROKEN — do not use'],
        ['3DES (Triple DES)', '112 or 168 bits effective', '64 bits', 'Deprecated — being retired'],
        ['AES-128', '128 bits', '128 bits', 'Current standard'],
        ['AES-192', '192 bits', '128 bits', 'Current standard'],
        ['AES-256', '256 bits', '128 bits', 'Current standard — strongest'],
        ['Blowfish', 'Variable (32-448 bits)', '64 bits', 'Replaced by Twofish'],
        ['RC4', 'Variable', 'Stream cipher', 'BROKEN — do not use'],
      ],
      speaker: 'janet',
      dialogue:
        'The exam loves asking about key sizes and status. DES is broken. RC4 is broken. 3DES is being retired. AES is the standard. The formula for the number of symmetric keys needed is n(n-1)/2 — memorize it. And remember: symmetric = one shared key = fast = key distribution problem.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
    },

    // 7-5. Knowledge Check — Symmetric Cryptography
    {
      type: 'knowledgeCheck',
      id: 'd3a1s7-kc-1',
      question:
        'An organization with 50 employees needs each pair of employees to communicate securely using symmetric encryption. How many unique symmetric keys are required?',
      options: [
        '50',
        '100',
        '1,225',
        '2,500',
      ],
      correctIndex: 2,
      explanation:
        'The formula for symmetric key pairs is n(n-1)/2. With 50 employees: 50 x 49 / 2 = 1,225 unique keys. This is why symmetric cryptography has a key distribution problem — the number of keys grows quadratically with users. This is one of the main drivers for asymmetric cryptography.',
      memoryHack:
        'Shared House Key: n(n-1)/2 = total keys needed. 50 people = 50 x 49 / 2 = 1,225. Think of it like handshakes at a party — every pair needs a unique key. The formula is the same as the "handshake problem" in math.',
      conceptName: 'Symmetric Cryptography',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 8 — Asymmetric Cryptography (Janet, "Mailbox and Master Key")
    // ================================================================

    // 8-1. Janet introduces asymmetric cryptography
    {
      type: 'dialogue',
      id: 'd3a1s8-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The key distribution problem is exactly why asymmetric cryptography was invented, {player}. I call it the "Mailbox and Master Key." Think of a locked mailbox on your front porch. ANYONE can drop a letter through the slot — that\'s the public key. But only YOU have the master key to open the mailbox and read the letters — that\'s the private key. Two keys, mathematically linked, but you only share one.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8-2. Janet explains the algorithms and uses
    {
      type: 'dialogue',
      id: 'd3a1s8-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The big three algorithms: RSA — the workhorse, used for encryption AND digital signatures. ECC — Elliptic Curve Cryptography, stronger at smaller key sizes, ideal for mobile and IoT. And Diffie-Hellman — strictly a key exchange protocol, NOT for encryption or signatures. Asymmetric cryptography solves the key distribution problem — with 100 people, you only need 100 key pairs instead of 4,950 keys. But there\'s a tradeoff: it\'s MUCH slower than symmetric. That\'s why in practice, we use asymmetric to exchange a symmetric key, then switch to symmetric for the bulk data. This is called a hybrid approach.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8-3. Janet explains digital signatures
    {
      type: 'dialogue',
      id: 'd3a1s8-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'One more critical concept: digital signatures. When you sign a document, you encrypt a hash of the message with your PRIVATE key. Anyone can verify it using your PUBLIC key. This provides integrity (the message hasn\'t changed), authentication (it came from you), and non-repudiation (you can\'t deny signing it). But here\'s the exam trap: digital signatures do NOT provide confidentiality. The message itself is not encrypted by the signature — only the hash is.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 8-4. Knowledge Check — Asymmetric Cryptography
    {
      type: 'knowledgeCheck',
      id: 'd3a1s8-kc-1',
      question:
        'A project manager needs to send a contract to a vendor and wants to ensure the vendor can verify the document has not been altered and that it truly came from the project manager. Which approach BEST meets these requirements?',
      options: [
        'Encrypt the entire document with the vendor\'s public key',
        'Digitally sign the document using the project manager\'s private key',
        'Encrypt the document with AES-256 and share the key via phone',
        'Send the document via HTTPS to ensure confidentiality',
      ],
      correctIndex: 1,
      explanation:
        'A digital signature (signing with the sender\'s private key) provides integrity (detects tampering) and authentication/non-repudiation (proves origin). Option A provides confidentiality, not integrity verification or authentication. Option C provides confidentiality via symmetric encryption but no authentication. Option D provides transport security but not document-level integrity or authentication.',
      memoryHack:
        'Mailbox and Master Key: Digital signature = sign with YOUR private key, verify with YOUR public key. It proves WHO sent it (authentication) and that it WASN\'T CHANGED (integrity). It does NOT hide the message (no confidentiality). Exam trap: encryption and signing use keys in opposite directions!',
      conceptName: 'Asymmetric Cryptography',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 9 — Hashing (Janet, "Fingerprint Scanner")
    // ================================================================

    // 9-1. Janet introduces hashing
    {
      type: 'dialogue',
      id: 'd3a1s9-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'We keep talking about hashes — in digital signatures, in integrity checks. Let\'s nail this down. I call hashing the "Fingerprint Scanner." Every person has a unique fingerprint. A hash function does the same thing for data — it takes ANY input and produces a fixed-length output called a digest. Change even one bit of the input, and the fingerprint changes completely.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9-2. Janet explains the properties and algorithms
    {
      type: 'dialogue',
      id: 'd3a1s9-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Three critical properties. First: one-way — you can\'t reverse a fingerprint back to the person. You can\'t reverse a hash back to the original data. Second: fixed-length — whether you hash one byte or one terabyte, the output is always the same size. Third: collision-resistant — two different inputs should NEVER produce the same hash. When they do, that\'s a collision, and the algorithm is considered weakened.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-3. Visual Aid — Hashing algorithms table
    {
      type: 'visualAid',
      id: 'd3a1s9-visual-1',
      title: 'Fingerprint Scanner — Hash Algorithm Reference',
      aidType: 'table',
      headers: ['Algorithm', 'Digest Size', 'Status', 'Key Fact'],
      rows: [
        ['MD5', '128 bits', 'BROKEN — collisions found', 'Still used for checksums, NOT for security'],
        ['SHA-1', '160 bits', 'DEPRECATED — collisions demonstrated', 'Google produced a practical collision in 2017'],
        ['SHA-2 (SHA-256, SHA-512)', '256 or 512 bits', 'Current standard', 'Widely used — TLS, code signing, blockchain'],
        ['SHA-3', '224, 256, 384, or 512 bits', 'Current standard', 'Keccak sponge construction — different design than SHA-2'],
        ['RIPEMD-160', '160 bits', 'Legacy', 'Used in some cryptocurrency implementations'],
      ],
      speaker: 'janet',
      dialogue:
        'The exam loves testing the status of each algorithm. MD5 and SHA-1 are BROKEN — never use them for security purposes. SHA-2 and SHA-3 are the current standards. And remember: hashing provides INTEGRITY, not confidentiality. A hash doesn\'t hide data — it fingerprints it. If you need confidentiality, you need encryption.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
    },

    // 9-4. Janet explains the birthday attack
    {
      type: 'dialogue',
      id: 'd3a1s9-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'One more thing: the birthday attack. It\'s named after the birthday paradox — in a room of just 23 people, there\'s a 50% chance two share a birthday. Similarly, a birthday attack exploits the fact that finding ANY two inputs with the same hash is much easier than finding a specific collision. For a hash of n bits, a brute-force collision requires only 2 to the power of n/2 operations, not 2 to the n. That\'s why a 128-bit hash like MD5 only has 64 bits of collision resistance. And that\'s why it\'s broken.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9-5. Knowledge Check — Hashing
    {
      type: 'knowledgeCheck',
      id: 'd3a1s9-kc-1',
      question:
        'A security team discovers that two DIFFERENT files in their evidence repository produce the identical MD5 hash value. What does this BEST indicate?',
      options: [
        'The files are identical and one is a duplicate',
        'A hash collision has occurred — MD5 is not collision-resistant enough for security use',
        'The hash function is working correctly since MD5 always produces unique outputs',
        'The files were both encrypted with the same key',
      ],
      correctIndex: 1,
      explanation:
        'When two different files produce the same hash, it is a collision. MD5 is known to be vulnerable to collision attacks, which is why it is considered BROKEN for security purposes. Option A is incorrect because the files are confirmed to be DIFFERENT. Option C is wrong because no hash function guarantees unique outputs — collisions are mathematically inevitable, but good algorithms make them computationally infeasible. Remember from the Filing Cabinet Color Codes at the Data Vault — integrity of evidence depends on reliable hashing.',
      memoryHack:
        'Fingerprint Scanner: Two different people, same fingerprint = BROKEN scanner. Two different files, same hash = BROKEN algorithm. MD5 is broken. SHA-1 is broken. SHA-2 and SHA-3 are the current standards. Birthday attack: collision resistance = only half the bit length.',
      conceptName: 'Hashing',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ================================================================
    // SCENE 10 — Common Criteria / EAL (Reeves, "Consumer Reports Rating")
    // ================================================================

    // 10-1. Transition
    {
      type: 'transition',
      id: 'd3a1s10-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Compliance and Certification Office',
      animation: 'slide',
    },

    // 10-2. Reeves introduces Common Criteria
    {
      type: 'dialogue',
      id: 'd3a1s10-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Good work on the crypto deep dive, {player}. Now let me show you something that should have prevented this entire breach — evaluation and certification. When you buy a car, you check its safety rating. When you deploy security technology, you should check its evaluation rating too. I call the Common Criteria the "Consumer Reports Rating" for security products.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10-3. Reeves explains the framework
    {
      type: 'dialogue',
      id: 'd3a1s10-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Common Criteria, formally ISO 15408, replaced the old TCSEC Orange Book and the European ITSEC. It has three key components. The Target of Evaluation, or TOE — that\'s the product being tested. The Security Target, or ST — the vendor\'s specific security claims about their product. And the Protection Profile, or PP — a standardized set of requirements for a category of products, like firewalls or smart cards. Think of PP as the "product category checklist" and ST as the "vendor\'s specific promises."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 10-4. Visual Aid — EAL Levels
    {
      type: 'visualAid',
      id: 'd3a1s10-visual-1',
      title: 'Consumer Reports Rating — Evaluation Assurance Levels (EAL)',
      aidType: 'table',
      headers: ['Level', 'Name', 'Analogy', 'What It Means'],
      rows: [
        ['EAL 1', 'Functionally Tested', '1-star review', 'Basic functional testing only — minimal assurance'],
        ['EAL 2', 'Structurally Tested', '2-star — some detail', 'Developer provides design docs, tested with cooperation'],
        ['EAL 3', 'Methodically Tested and Checked', '3-star — solid review', 'Thorough testing with grey-box access to developer processes'],
        ['EAL 4', 'Methodically Designed, Tested and Reviewed', '4-star — recommended', 'HIGHEST level commercially practical. Most real-world products aim here'],
        ['EAL 5', 'Semiformally Designed and Tested', '5-star — exceptional', 'Semiformal design analysis. Rarely achieved outside specialized products'],
        ['EAL 6', 'Semiformally Verified Design and Tested', '6-star — elite', 'Semiformal verification. Reserved for high-risk environments'],
        ['EAL 7', 'Formally Verified Design and Tested', '7-star — lab perfect', 'Full formal mathematical verification. Extremely rare and expensive'],
      ],
      speaker: 'reeves',
      dialogue:
        'The most important number to remember: EAL 4 is the highest level that is economically practical for commercial products. Anything above EAL 4 requires specialized development from the ground up. The Zurich facility\'s access control system was only certified at EAL 2 — structurally tested, not thoroughly reviewed. That was a procurement failure.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // 10-5. Knowledge Check — Common Criteria
    {
      type: 'knowledgeCheck',
      id: 'd3a1s10-kc-1',
      question:
        'An organization is evaluating two firewall products. Product A has an EAL 4 certification. Product B claims "military-grade security" but has no Common Criteria certification. Which statement BEST reflects a security manager\'s evaluation?',
      options: [
        'Product B is likely more secure because military-grade implies the highest standards',
        'Both products are equally trustworthy since Common Criteria is optional',
        'Product A provides independently verified assurance; Product B\'s claims are unverified and should not be trusted without evaluation',
        'EAL 4 is too low for firewall deployment; only EAL 7 products should be considered',
      ],
      correctIndex: 2,
      explanation:
        'Common Criteria provides independent, standardized evaluation. "Military-grade" is a marketing term with no defined meaning. EAL 4 is the highest commercially practical level and appropriate for most deployments. EAL 7 is extremely rare and not practical for commercial firewalls. The manager should trust verified claims over marketing language.',
      memoryHack:
        'Consumer Reports Rating: Would you buy a car based on the dealer saying "it\'s the safest" or on an independent crash-test rating? EAL = the crash-test rating. No EAL = no independent proof. EAL 4 = highest practical. "Military-grade" = marketing, not assurance.',
      conceptName: 'Common Criteria',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // 10-6. Think Like a Manager — Common Criteria procurement
    {
      type: 'thinkLikeManager',
      id: 'd3a1s10-tlatm-1',
      scenario:
        'Your organization is deploying a new identity management system for a government contract. The contract requires NIST-compliant security controls. You have three vendor options: Vendor A offers EAL 4 certification at $500K. Vendor B offers EAL 2 certification at $200K. Vendor C offers no certification but is the cheapest at $100K and promises to "pursue certification later."',
      question: 'As the security manager, which is the MOST appropriate procurement decision?',
      options: [
        'Choose Vendor C to save budget and accept the risk of no certification',
        'Choose Vendor B as a cost-effective compromise',
        'Choose Vendor A — the government contract requires verified assurance, and EAL 4 is the highest commercially practical level',
        'Reject all vendors and build the system in-house for maximum control',
      ],
      correctIndex: 2,
      explanation:
        'Government contracts with NIST compliance requirements demand independently verified security assurance. EAL 4 is the highest commercially practical level and meets the requirement. EAL 2 provides only structural testing, which may be insufficient for a government identity management system. Vendor C\'s promise of future certification carries unacceptable risk. Building in-house is unlikely to achieve certification and would cost far more.',
      managerInsight:
        'A manager evaluates risk against business requirements, not just cost. The government contract creates a non-negotiable compliance floor. Choosing a cheaper, lower-assurance product to save budget introduces contract risk, legal risk, and security risk. The cost difference is an investment in verified trust.',
      conceptName: 'Common Criteria',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
    },

    // ================================================================
    // SCENE 11 — Covert Channels (Morales, "Smuggler's Hidden Compartment")
    // ================================================================

    // 11-1. Transition
    {
      type: 'transition',
      id: 'd3a1s11-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Forensic Analysis Lab',
      animation: 'glitch',
      timeSkipText: 'Later that evening...',
    },

    // 11-2. Morales introduces covert channels
    {
      type: 'dialogue',
      id: 'd3a1s11-dialogue-1',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Morales here. I\'ve been in the forensic lab all day, {player}, and I finally found HOW the attacker got the data out without tripping alarms. They used a covert channel. Think of it as a "Smuggler\'s Hidden Compartment." The cargo truck passes through customs, and the guards inspect the declared goods. But behind a false wall in the truck bed, there\'s a secret compartment carrying the real payload.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 11-3. Morales explains the two types
    {
      type: 'dialogue',
      id: 'd3a1s11-dialogue-2',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'There are two types. A covert STORAGE channel hides data in a shared resource — like a process writing a bit pattern to a shared file, memory location, or even disk space usage that another process reads. It\'s data hidden in plain sight. A covert TIMING channel communicates by modulating the timing of events — like a process deliberately slowing down or speeding up to signal 0s and 1s to an observer watching the system clock. At Zurich, the attacker used a storage channel. They embedded classified schematics in the metadata of routine log files that were automatically exported to an external monitoring system.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11-4. Visual Aid — Covert Channel types
    {
      type: 'visualAid',
      id: 'd3a1s11-visual-1',
      title: 'Smuggler\'s Hidden Compartment — Covert Channel Types',
      aidType: 'comparison',
      headers: ['Covert Storage Channel', 'Covert Timing Channel'],
      rows: [
        ['Hides data IN a shared resource', 'Hides data in the TIMING of events'],
        ['Writes to shared memory, files, disk usage', 'Modulates CPU usage, response times, packet intervals'],
        ['Like hiding a message inside a picture frame', 'Like blinking Morse code with a flashlight'],
        ['Easier to detect through resource auditing', 'Harder to detect — requires statistical timing analysis'],
        ['Example: data in file metadata, unused header fields', 'Example: varying page-fault rates to signal bits'],
      ],
      speaker: 'morales',
      dialogue:
        'Both channels exploit legitimate system mechanisms to transmit data outside authorized paths. The attacker bypassed the Bell-LaPadula "no write down" rule not by breaking it directly, but by using a side channel that the model didn\'t account for. This is why covert channel analysis is critical in high-security environments — the formal model is only as good as its coverage.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
    },

    // 11-5. Morales explains the connection to the models
    {
      type: 'dialogue',
      id: 'd3a1s11-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'Here\'s the full picture: the facility implemented BLP correctly for DIRECT access. No one could read above their level or write below it through the normal access control system. But the monitoring service that exported logs was a trusted process — it had Top Secret read access and Unclassified write access for reporting. The attacker manipulated what data the logs contained, using the trusted process as a smuggler. The "no write down" rule was technically never violated by the USER — but the SYSTEM effectively did it for them.',
      leftCharacter: 'morales',
      leftExpression: 'angry',
      rightCharacter: 'player',
      rightExpression: 'serious',
    },

    // 11-6. Knowledge Check — Covert Channels
    {
      type: 'knowledgeCheck',
      id: 'd3a1s11-kc-1',
      question:
        'An attacker at a high-security facility cannot directly transfer classified files to an unclassified system. Instead, they encode data by varying the sizes of temporary files on a shared disk that another unclassified process periodically reads. What type of attack is this?',
      options: [
        'A covert timing channel — data is hidden in event timing',
        'A covert storage channel — data is hidden in a shared storage resource',
        'A side-channel attack — data is leaked through physical emissions',
        'A man-in-the-middle attack — data is intercepted during transfer',
      ],
      correctIndex: 1,
      explanation:
        'This is a covert storage channel. The attacker is hiding data by manipulating the SIZE of files on a shared disk — a shared storage resource. The key indicator is that information is encoded in a STORED attribute (file size), not in the timing of events. A timing channel would involve modulating WHEN events occur (e.g., CPU usage patterns). A side-channel attack exploits physical characteristics like power consumption or electromagnetic emissions, not logical shared resources.',
      memoryHack:
        'Smuggler\'s Hidden Compartment: Storage channel = hiding data IN something (file sizes, metadata, disk usage). Timing channel = hiding data in WHEN something happens (CPU timing, response delays). If the question mentions shared files or storage attributes, it\'s a storage channel. If it mentions timing patterns or delays, it\'s a timing channel.',
      conceptName: 'Covert Channels',
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
      id: 'd3a1s12-transition-1',
      location: 'zurich',
      description: 'Alpine Secure Data Campus — Briefing Room',
      animation: 'fade',
      timeSkipText: 'End of Day 1 Briefing',
    },

    // 12-2. Reeves summarizes the day
    {
      type: 'dialogue',
      id: 'd3a1s12-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Outstanding work today, {player}. You\'ve covered the formal security models — Bell-LaPadula for confidentiality, Biba for integrity, and Clark-Wilson for commercial transactions. You understand the architect\'s golden rules, defense in depth, and the cryptographic foundations that protect data at rest and in transit. And thanks to Morales, we now know HOW the attacker exfiltrated the data — through a covert storage channel that exploited a gap between the formal model and the real-world implementation.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 12-3. Janet teases Act 2
    {
      type: 'dialogue',
      id: 'd3a1s12-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Tomorrow we go deeper, {player}. We need to investigate the physical security failures that allowed the attacker to plant their monitoring exploit, look at how PKI and certificate infrastructure should have caught the forged process credentials, and examine the security evaluation criteria that the procurement team ignored when they deployed an under-certified access control system.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 12-4. Morales closing
    {
      type: 'dialogue',
      id: 'd3a1s12-dialogue-3',
      speaker: 'morales',
      speakerSide: 'left',
      text: 'And I\'ll have the full covert channel analysis ready by morning. There may be a timing channel we haven\'t found yet. Get some rest — tomorrow we tear this architecture apart piece by piece.',
      leftCharacter: 'morales',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 12-5. Player final line
    {
      type: 'dialogue',
      id: 'd3a1s12-dialogue-4',
      speaker: 'player',
      speakerSide: 'right',
      text: 'The model was sound on paper. But models don\'t stop attackers — implementations do. See you all in the morning.',
      rightCharacter: 'player',
      rightExpression: 'serious',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },
  ],
};
