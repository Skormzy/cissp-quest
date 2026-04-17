import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter3: DomainChapterDefinition = {
  domainId: 3,
  title: 'The Architecture Flaw',
  location: 'Server Farm, Zurich',
  locationGradient: 'linear-gradient(135deg, #0d1a2a 0%, #1a1a2e 50%, #0a1628 100%)',
  acts: [
    // ─── ACT 1: The Blueprint ─────────────────────────────────────────────────
    {
      actNumber: 1,
      title: 'The Blueprint',
      description: 'Investigate the enterprise security architecture failure at the Swiss Alps server farm.',
      xpReward: 150,
      conceptsCovered: [
        'Enterprise Security Architecture Frameworks',
        'Security Design Principles',
        'Trusted Computing Base',
        'Security Kernel',
        'Reference Monitor',
      ],
      estimatedMinutes: 22,
      nodes: [
        // ── Transition: Arrival ─────────────────────────────────────────────
        {
          type: 'transition',
          id: 'ch3-act1-transition-arrival',
          location: 'Nexus Server Farm Alpha — Swiss Alps, Outside Zurich',
          description: 'The facility is carved into the mountain itself. Eighteen thousand servers behind meter-thick reinforced concrete, powered by glacial meltwater hydroelectric. The most physically secure data center in Europe. Compromised not from outside — but from within its own architecture.',
          animation: 'glitch',
          timeSkipText: '48 hours after the New Jersey vault incident',
        },

        // ── Dialogue 1: Janet briefs the player ───────────────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act1-d1',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "{player}. I've been waiting. The vault breach was a labeling problem. This one is an architecture problem — and architecture problems are more dangerous because they're usually invisible until something exploits them. Come see what they built here, and more importantly, what they forgot to design.",
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Dialogue 2: Janet on architecture frameworks ─────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act1-d2',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "Nexus claimed they used TOGAF to design this facility's IT architecture. What they actually did was use TOGAF for the business and data layers, then improvised on the security layer. That's the gap. Security architecture isn't just an add-on to enterprise architecture — it's a parallel discipline. SABSA handles the security-specific view. You can't skip it.",
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Visual Aid: Architecture frameworks ──────────────────────────────
        {
          type: 'visualAid',
          id: 'ch3-act1-va1',
          title: 'Enterprise Security Architecture Frameworks',
          aidType: 'comparison',
          headers: ['Framework', 'Focus Area', 'Key Contribution', 'Used For'],
          rows: [
            ['Zachman', 'Enterprise architecture — all viewpoints', 'A two-dimensional matrix: what, how, where, who, when, why — across five stakeholder perspectives', 'Organizing and categorizing architecture artifacts; not prescriptive about process'],
            ['TOGAF', 'Enterprise IT architecture process', 'ADM (Architecture Development Method) — a phased process for designing business, data, application, and technology architectures', 'Enterprise IT planning; business alignment; not security-specific'],
            ['SABSA', 'Risk-driven security architecture', 'Maps security attributes to business requirements across six abstraction layers (contextual to component)', 'Security-specific architecture; links business risk to security controls'],
          ],
          speaker: 'Janet Park',
          dialogue: "Think of Zachman as the blueprint filing system, TOGAF as the construction project management methodology, and SABSA as the specialized structural engineer who focuses only on whether the building will survive an earthquake. Nexus hired the construction manager but skipped the structural engineer.",
          rightCharacter: 'janet_park',
          rightExpression: 'neutral',
        },

        // ── Evidence 1: Architecture review findings ─────────────────────────
        {
          type: 'evidence',
          id: 'ch3-act1-e1',
          title: 'Architecture Review — Nexus Zurich Facility',
          classification: 'TOP SECRET',
          content: `## Security Architecture Gap Analysis\n\n### Frameworks Claimed vs. Implemented\n- **Business/Data/Application/Technology layers:** TOGAF ADM followed (documented)\n- **Security layer:** No SABSA mapping performed. Security controls were added post-design as point solutions, not integrated from requirements.\n\n### Critical Design Principle Violations Found\n\n| Principle | Requirement | Finding |\n|---|---|---|\n| Least Privilege | Processes run with minimum necessary access | Database service account had Domain Admin rights |\n| Defense in Depth | Multiple independent control layers | Single perimeter firewall; no internal segmentation |\n| Fail Secure | System defaults to secure state on failure | Load balancer failure defaulted to 'allow all' |\n| Separation of Duties | Critical functions split across multiple actors | Single admin account could approve and execute changes |\n| Complete Mediation | Every access request verified | Legacy API endpoints bypassed the auth gateway |`,
          evidenceItems: [
            { label: 'Least Privilege Violation', value: 'DB service account = Domain Admin', highlight: true },
            { label: 'Fail Secure Violation', value: 'Load balancer fail-open configuration', highlight: true },
            { label: 'Separation of Duties', value: 'Single admin: approve + execute', highlight: true },
            { label: 'Complete Mediation', value: 'Legacy API endpoints bypass auth gateway', highlight: true },
            { label: 'SABSA Mapping', value: 'Not performed', highlight: false },
          ],
          speaker: 'Janet Park',
          speakerSide: 'right',
          dialogue: "Every violation I just showed you is a design choice someone made — or failed to make. These aren't bugs. They're architectural decisions that traded security for convenience.",
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Knowledge Check 1: Security design principles ───────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act1-kc1',
          question: "A web application's authentication service crashes due to a memory fault. The system's behavior is to log out all active users and display a generic error page, requiring re-authentication to continue. Which security design principle does this behavior demonstrate?",
          options: [
            'Economy of Mechanism — keep it simple so failures are predictable',
            'Fail Secure — on failure, default to the more secure state (denying access)',
            'Defense in Depth — use multiple layers to catch failures',
            'Complete Mediation — verify every access request',
          ],
          correctIndex: 1,
          explanation: "Fail Secure (also called Fail Safe or Fail Closed) means the system defaults to the secure state when something goes wrong — deny access rather than grant it. Logging out all users on an auth service crash is fail secure behavior. The opposite — fail open — would keep sessions alive or bypass authentication, which is what happened with the Nexus load balancer. The principle is: if you can't verify safety, deny.",
          memoryHack: "Fail Secure = fail closed. Think of a bank vault door: when the power fails, the vault locks, not unlocks. The default is always 'no access.'",
          conceptName: 'Fail Secure',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Knowledge Check 2: Design principles ─────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act1-kc2',
          question: "The Nexus facility's database service account holds Domain Admin privileges to simplify deployment. Which security design principle does this MOST directly violate?",
          options: [
            'Separation of Duties — the account should be split across multiple admins',
            'Least Privilege — processes should run with the minimum access required for their function',
            'Economy of Mechanism — the permission structure is unnecessarily complex',
            'Defense in Depth — there are insufficient layers protecting the database',
          ],
          correctIndex: 1,
          explanation: "Least Privilege requires that every process, user account, or system component operates with the minimum permissions necessary to perform its function. A database service account needs permission to read and write the database — not to administer the entire domain. Over-privileged service accounts are one of the most common and dangerous architecture mistakes because if that process is compromised, the attacker inherits Domain Admin rights.",
          memoryHack: "Least Privilege = need-to-know, need-to-do. A database janitor doesn't need the master key to every room in the building. Give them the supply closet key only.",
          conceptName: 'Least Privilege',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Dialogue 3: Janet on TCB ─────────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act1-d3',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "Now I want to show you something on the firmware level. You know what the Trusted Computing Base is? Imagine a nuclear launch system. Only a small set of verified, trusted components participate in the actual launch decision — the rest of the system is irrelevant and untrusted for that purpose. The TCB is the same concept. It's the set of everything in the system — hardware, software, firmware — that must work correctly to enforce the security policy. Everything outside the TCB is irrelevant to security. Everything inside must be protected absolutely.",
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Visual Aid: TCB / Security Kernel / Reference Monitor ───────────
        {
          type: 'visualAid',
          id: 'ch3-act1-va2',
          title: 'TCB, Security Kernel, and Reference Monitor',
          aidType: 'list',
          items: [
            {
              label: 'Trusted Computing Base (TCB)',
              description: 'The complete set of hardware, software, and firmware components that enforce the system\'s security policy. The TCB is trusted — meaning: if it fails, the security policy fails. Every component in the TCB must be verified and tamper-resistant. Think: every component in the nuclear launch authorization chain.',
            },
            {
              label: 'Security Kernel',
              description: 'The core software component of the TCB. Implements the Reference Monitor concept in software form. Mediates all access to protected resources. Must be: complete (no bypass), isolated (cannot be modified from outside), and verifiable (can be proven correct). Analogous to the central switching node in the launch chain — every signal passes through it.',
            },
            {
              label: 'Reference Monitor',
              description: 'The abstract concept (not a specific product) that all access requests must pass through before reaching a protected resource. Three properties: ALWAYS INVOKED (no bypass), TAMPER-PROOF (cannot be disabled or modified), SMALL ENOUGH TO BE VERIFIED (limited scope to allow correctness proofs). The security kernel implements the Reference Monitor in a real operating system.',
            },
          ],
          speaker: 'Janet Park',
          dialogue: "The Reference Monitor is the idea. The Security Kernel is the implementation. The TCB is everything the security kernel relies on to function correctly. They nest inside each other like matryoshka dolls.",
          rightCharacter: 'janet_park',
          rightExpression: 'neutral',
        },

        // ── Knowledge Check 3: TCB concepts ─────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act1-kc3',
          question: "A security evaluation finds that a privileged software module can modify the operating system's access control lists without passing through the security kernel. Which Reference Monitor property does this MOST directly violate?",
          options: [
            'Tamper-proof — the module is modifying the kernel\'s internal data',
            'Small enough to be verified — the kernel is too large to evaluate fully',
            'Always invoked — the access to modify ACLs bypassed the reference monitor entirely',
            'Complete mediation — not every object is protected by the TCB',
          ],
          correctIndex: 2,
          explanation: "The Reference Monitor must be ALWAYS INVOKED — meaning every access request to every protected resource must pass through it, with no exceptions or bypass paths. A module that modifies ACLs without going through the security kernel represents a bypass — the reference monitor was not invoked for that operation. This is the most fundamental violation: if you can find one path around it, the entire access control architecture is invalid.",
          memoryHack: "Reference Monitor: Always, Tamper-proof, Small. ATS. Like airport security — Always there (no bypass lane), Tamper-proof (can't bribe the scanner), Small enough to be verified (you can check every scanner for function).",
          conceptName: 'Reference Monitor',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Think Like a Manager: Architecture decisions ──────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch3-act1-tlm1',
          scenario: "Your development team proposes a new microservices deployment. For simplicity, all 22 microservices will share a single service account with broad read/write privileges across the entire database. The team argues this reduces deployment complexity and cuts the rollout timeline by two weeks.",
          question: "As CISO, what is your MOST appropriate response?",
          options: [
            'Approve the proposal — a two-week timeline reduction has measurable business value',
            'Require each service to use a dedicated, minimally privileged account scoped to its specific data requirements before deployment',
            'Approve for the development environment only; require redesign before production',
            'Approve with compensating controls: add logging and alerts on the shared account\'s activity',
          ],
          correctIndex: 1,
          explanation: "Least Privilege is a design requirement, not a post-deployment optimization. Deploying 22 services sharing one over-privileged account creates an attack surface where compromising any one service grants broad access to all data. Compensating controls (logging) detect breaches after the fact — they don't prevent lateral movement. Development-only approval leads to production pressure to keep the insecure design. The correct answer requires the right design before deployment — the two-week cost is the price of security architecture.",
          managerInsight: "Security debt costs more to fix after launch than before. A two-week delay now versus a breach remediation that takes months and costs your organization's reputation is not a close call. Your job is to say no to shortcuts that create systemic risk.",
          conceptName: 'Security Design Principles',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Timed Decision 1: Architecture decision under pressure ────────────
        {
          type: 'timedDecision',
          id: 'ch3-act1-td1',
          scenario: "During incident response, you discover that the Nexus load balancer is configured to 'fail open' — if its rule engine crashes, all traffic passes through unchecked. Operations says fixing it will require a 4-hour maintenance window. The CEO is pressuring for no downtime. You have 30 seconds to advise.",
          timeLimit: 30,
          options: [
            {
              text: 'Recommend the 4-hour maintenance window immediately — a fail-open load balancer is an active critical vulnerability',
              isOptimal: true,
              feedback: "Correct. A fail-open load balancer is an architectural time bomb. Every minute it stays in place is a minute the attacker can trigger a crash and walk through unfiltered. The 4-hour window is mandatory. Business continuity pressure doesn't override active architectural vulnerabilities.",
              xpBonus: 50,
            },
            {
              text: 'Add monitoring to detect if the rule engine crashes, then remediate during normal maintenance',
              isOptimal: false,
              feedback: "Monitoring tells you the barn door opened after the horse has already left. The fail-open condition is deterministic — if the rule engine crashes (which the attacker can force), traffic flows unrestricted. Detection is too slow for this failure mode.",
            },
            {
              text: 'Implement a compensating control — block all external traffic at the upstream router during any load balancer failure',
              isOptimal: false,
              feedback: "This is a reasonable interim control but not a replacement for the fix. It also requires that the upstream router correctly detects the load balancer failure and blocks traffic before any unauthorized access occurs — an assumption that may not hold under active attack.",
            },
            {
              text: 'Document the risk, get executive sign-off on accepting it, and schedule remediation for next quarter',
              isOptimal: false,
              feedback: "Risk acceptance is appropriate for theoretical risks with low probability. A known fail-open configuration with an active attacker in the environment is not a theoretical risk — it's an active vulnerability with known exploit potential. Risk acceptance here is organizational negligence.",
            },
          ],
          conceptName: 'Fail Secure',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'worried',
        },
      ],
    },

    // ─── ACT 2: The Silent Channel ────────────────────────────────────────────
    {
      actNumber: 2,
      title: 'The Silent Channel',
      description: 'Trace how the attacker used a covert timing channel to exfiltrate data without triggering a single alert.',
      xpReward: 200,
      conceptsCovered: [
        'Bell-LaPadula Model',
        'Biba Integrity Model',
        'Clark-Wilson Model',
        'Brewer-Nash (Chinese Wall)',
        'Covert Channels',
        'Ring Protection Model',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ── Transition: Server room ───────────────────────────────────────────
        {
          type: 'transition',
          id: 'ch3-act2-transition-serverroom',
          location: 'Nexus Zurich — Core Operations Center, Floor -3',
          description: 'The main server floor. Rows of blade chassis humming at 40 degrees Celsius. Janet leads you to a monitoring terminal that shows something unusual — not in the data, but in the timing.',
          animation: 'slide',
          timeSkipText: '3 hours into the architecture review',
        },

        // ── Dialogue 1: Janet on security models ─────────────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act2-d1',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "Before I show you how the attacker did it, I need you to understand why the system should have prevented it. Security models are the formal rules that define what data can flow where. Not suggestions — formal mathematical rules. The Nexus system was supposed to implement Bell-LaPadula. It didn't do it correctly. And that gap is exactly what the attacker found.",
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Visual Aid: Security Models ───────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch3-act2-va1',
          title: 'Formal Security Models Comparison',
          aidType: 'table',
          headers: ['Model', 'Primary Goal', 'Core Rules', 'What It Protects'],
          rows: [
            [
              'Bell-LaPadula (BLP)',
              'Confidentiality',
              'No Read Up (Simple Security): cannot read data at a higher classification. No Write Down (Star Property): cannot write data to a lower classification.',
              'Prevents classified information from flowing to lower clearance levels. Used in military/government systems.',
            ],
            [
              'Biba',
              'Integrity',
              'No Write Up: cannot write to a higher integrity level. No Read Down: cannot read from a lower integrity level.',
              'Prevents low-integrity data from contaminating high-integrity processes. Inverse of BLP — focuses on data quality, not secrecy.',
            ],
            [
              'Clark-Wilson',
              'Integrity (commercial)',
              'Well-formed transactions: data can only be modified through authorized procedures (TPs). Separation of duties enforced through access triples (subject, TP, object).',
              'Ensures data integrity in commercial environments through constrained interfaces and separation of duties.',
            ],
            [
              'Brewer-Nash (Chinese Wall)',
              'Conflict of Interest',
              'A subject can access data from one company in a conflict-of-interest class. Once accessed, they are barred from accessing competing companies\' data in the same class.',
              'Prevents analysts who have seen one client\'s confidential data from seeing a competitor\'s data. Used in financial consulting, law firms.',
            ],
          ],
          speaker: 'Janet Park',
          dialogue: "Four models. Four different security problems they solve. BLP guards secrets. Biba guards accuracy. Clark-Wilson guards process integrity. Chinese Wall guards conflict of interest. The question is: which model was violated here?",
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Evidence 1: Security model violation ─────────────────────────────
        {
          type: 'evidence',
          id: 'ch3-act2-e1',
          title: 'Bell-LaPadula Violation Analysis — Zurich Server Farm',
          classification: 'TOP SECRET',
          content: `## Identified BLP Violation: Star Property (No Write Down)\n\nThe Nexus system implemented the Simple Security Property (no read up) correctly — standard users could not directly read data above their clearance level.\n\nHowever, the Star Property (no write down) was NOT implemented on the analytics export module. This module ran at the Secret classification level and was permitted to write output files to the Unclassified storage tier for reporting purposes.\n\n### Attack Path\n1. Attacker gained control of the analytics module (running at Secret level)\n2. Used the module's write-down permission to export Secret data into Unclassified storage\n3. Retrieved Unclassified files via the public API (no authorization required)\n4. The write-down was logged but not flagged — no alert existed for BLP Star Property violations\n\n**Root cause:** The system designers believed write-down was acceptable for "sanitized" reporting. No automated sanitization was applied. The write-down was unrestricted.`,
          evidenceItems: [
            { label: 'Property Violated', value: 'Star Property (No Write Down)', highlight: true },
            { label: 'Module Clearance Level', value: 'Secret' },
            { label: 'Write Destination', value: 'Unclassified storage tier', highlight: true },
            { label: 'Data Volume Exfiltrated', value: '840 GB via write-down', highlight: true },
            { label: 'Alert Generated', value: 'None — no BLP enforcement on export module' },
          ],
          speaker: 'Janet Park',
          speakerSide: 'right',
          dialogue: "Here's the spy analogy: Bell-LaPadula says a spy with Top Secret clearance can read any classified file up to their level — but they can NEVER pass that intel down to agents with lower clearances. 'You can know it. You can't spread it down.' The Nexus analytics module was spreading it down. No one blocked the handoff.",
          rightCharacter: 'janet_park',
          rightExpression: 'angry',
        },

        // ── Knowledge Check 1: Bell-LaPadula ────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act2-kc1',
          question: "A Secret-cleared analyst runs a program that reads Secret-level data and writes a summary to an Unclassified network share. Under Bell-LaPadula, which property is violated?",
          options: [
            'Simple Security Property (No Read Up) — the analyst is reading above their clearance',
            'Star Property (No Write Down) — writing Secret-derived content to an Unclassified location',
            'Discretionary Security Property — the analyst modified an access control list',
            'No violation — the analyst has Secret clearance and can write to any level',
          ],
          correctIndex: 1,
          explanation: "BLP's Star Property (written with an asterisk: *-property) states that a subject cannot write information to an object at a lower security level than the subject's current level. Even though the analyst is writing a 'summary,' the data was derived from Secret-level information. Writing it to Unclassified violates the no write-down rule. The intent is to prevent exactly this: information laundering — taking classified data, summarizing or transforming it, and writing it to a lower level to bypass controls.",
          memoryHack: "BLP confidentiality: Read Down (OK), Write Up (OK), Read Up (NO), Write Down (NO). You can read what's below you. You can write to what's above you. Never the reverse.",
          conceptName: 'Bell-LaPadula Model',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Knowledge Check 2: Biba ──────────────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act2-kc2',
          question: "A quality-assurance database accepts input from an unvalidated external API feed. A certified QA analyst's workflow then reads from this database to produce compliance reports. Which Biba rule is being violated by the database accepting unvalidated external input?",
          options: [
            'No Write Up — the external API is writing to a higher integrity object (the QA database)',
            'No Read Down — the QA analyst is reading from a lower integrity source',
            'Simple Integrity Property — the QA database cannot read low-integrity data',
            'Star Integrity Property — the QA analyst cannot write to higher integrity objects',
          ],
          correctIndex: 0,
          explanation: "Biba's No Write Up rule says a subject at a low integrity level cannot write to an object at a higher integrity level — because doing so would contaminate the high-integrity object. An unvalidated external API is a low-integrity source. Writing its data into the QA database (a high-integrity object used for compliance reporting) violates No Write Up. This is Biba's equivalent of a crime scene witness scribbling notes directly into the official investigation file without vetting.",
          memoryHack: "Biba integrity: Read Up (OK), Write Down (OK), Read Down (NO), Write Up (NO). It's the INVERSE of BLP. BLP protects secrets from leaking down. Biba protects quality from being contaminated from below.",
          conceptName: 'Biba Integrity Model',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Dialogue 2: Janet introduces covert channels ─────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act2-d2',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "Now here's the clever part. The write-down was the obvious attack. But there was a second exfiltration method we almost missed — one that didn't move a single byte through the normal data channels. Watch this timing graph.",
          rightCharacter: 'janet_park',
          rightExpression: 'surprised',
        },

        // ── Evidence 2: Covert channel evidence ──────────────────────────────
        {
          type: 'evidence',
          id: 'ch3-act2-e2',
          title: 'Covert Channel Analysis — System Timing Patterns',
          classification: 'TOP SECRET',
          content: `## Covert Timing Channel — Discovery Report\n\nForensic analysis of the system performance logs revealed an anomalous pattern in CPU utilization timing on Server Cluster 7B.\n\n### Pattern Identified\nTwo processes were running simultaneously:\n- Process A: An isolated high-clearance data processing job (Secret level)\n- Process B: A low-clearance logging daemon (Unclassified level)\n\nProcess A modulated its CPU usage deliberately — high utilization represented a binary 1, low utilization represented a binary 0. Process B, which shared the same physical CPU resource, could observe this utilization pattern by measuring its own execution latency.\n\n**Result:** Process A transmitted binary-encoded data to Process B through CPU timing — without ever writing a single byte to shared storage. No data was ever written across classification boundaries. No BLP rule was technically violated.\n\n### Bit Rate Achieved\nApproximately 1.2 Kbps — enough to exfiltrate cryptographic keys and authentication tokens over 72 hours of operation.`,
          evidenceItems: [
            { label: 'Channel Type', value: 'Covert Timing Channel (CPU utilization)', highlight: true },
            { label: 'Bandwidth', value: '~1.2 Kbps', highlight: false },
            { label: 'Duration', value: '72 hours undetected' },
            { label: 'Data Exfiltrated', value: 'Cryptographic keys + auth tokens', highlight: true },
            { label: 'BLP Violations', value: 'None — no data written across boundaries', highlight: true },
          ],
          speaker: 'Janet Park',
          speakerSide: 'right',
          dialogue: "Two agents who aren't supposed to know each other. One buys coffee at 9:02. The other buys at 9:05. Three minutes apart means 'go.' Seventeen minutes means 'abort.' No words exchanged. No messages sent. But they communicated. That's a covert timing channel.",
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Visual Aid: Covert Channel Types ─────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch3-act2-va2',
          title: 'Covert Channel Types',
          aidType: 'comparison',
          headers: ['Type', 'Communication Method', 'Example', 'Detection Difficulty'],
          rows: [
            [
              'Storage Channel',
              'One process writes to a shared resource; another reads it',
              'Process A sets a file attribute (e.g., locked vs. unlocked). Process B reads the attribute state to receive a signal.',
              'Moderate — storage access can be logged and monitored',
            ],
            [
              'Timing Channel',
              'One process modulates the timing of actions; another measures delays',
              'Process A deliberately varies CPU usage, disk I/O, or network response times. Process B measures those timings to decode a signal.',
              'High — timing variations look like normal performance fluctuations; hard to distinguish from noise',
            ],
          ],
          speaker: 'Janet Park',
          dialogue: "Storage channels at least write something somewhere — they leave traces. Timing channels are pure physics. You can't 'log' the absence of a write. Traditional security monitoring is nearly blind to them.",
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Knowledge Check 3: Covert channels ──────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act2-kc3',
          question: "Two processes on a system are not permitted to communicate directly. Process A (high clearance) sends data to Process B (low clearance) by acquiring and releasing a mutex lock rapidly (encoding a '1') versus holding the lock long (encoding a '0'). Process B measures its wait time to acquire the same mutex to decode the signal. Which type of covert channel is this?",
          options: [
            'Storage covert channel — it uses a shared object (the mutex) to communicate',
            'Timing covert channel — Process B extracts information by measuring time differences',
            'Network covert channel — mutex behavior can be observed remotely',
            'Side-channel attack — it exploits an implementation weakness, not a shared resource',
          ],
          correctIndex: 1,
          explanation: "This is a timing covert channel. Although a mutex is a shared object (which might suggest a storage channel), the communication mechanism is the TIMING of lock acquisition and release — not the storage of a value in the object. Process B learns nothing from the mutex state itself (locked/unlocked) — it learns from HOW LONG it had to wait. The signal is encoded in time, not storage. The defining question is: does the receiver read a stored value, or measure time? Here it's time.",
          memoryHack: "Storage channel = reading a sign someone left. Timing channel = measuring how long someone took to turn on a light. One uses written signals; the other uses time as the signal.",
          conceptName: 'Covert Channels',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Visual Aid: Ring Protection Model ────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch3-act2-va3',
          title: 'Ring Protection Model',
          aidType: 'list',
          items: [
            {
              label: 'Ring 0 — Kernel Mode',
              description: 'The innermost ring. Highest privilege. The operating system kernel, hardware drivers, and the security kernel run here. Code in Ring 0 has unrestricted access to all hardware. A compromise at Ring 0 means total system control. This is the TCB\'s home.',
            },
            {
              label: 'Ring 1 — Operating System Services',
              description: 'Device drivers and OS components that need elevated access but not full kernel privilege. Not all architectures implement this ring in practice — many modern OSes collapse Ring 1 and Ring 2 into Ring 0.',
            },
            {
              label: 'Ring 2 — OS Utilities',
              description: 'Privileged OS utilities and libraries. Less commonly implemented separately in modern systems.',
            },
            {
              label: 'Ring 3 — User Mode',
              description: 'The outermost ring. Standard application code runs here. No direct hardware access. Must go through system calls to request kernel services. This is where web browsers, office applications, and user processes live. A compromise at Ring 3 affects only that process\'s context — the kernel remains protected (in theory).',
            },
          ],
          speaker: 'Janet Park',
          dialogue: "The covert timing channel exploited the fact that Ring 3 processes share CPU hardware with Ring 0 processes. The hardware resource — the physical CPU — is outside the ring model's protection. That's the fundamental limitation rings can't solve: shared hardware leaks information through physical properties.",
          rightCharacter: 'janet_park',
          rightExpression: 'neutral',
        },

        // ── Knowledge Check 4: Ring model ───────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch3-act2-kc4',
          question: "A rootkit installs itself into Ring 0 (kernel mode) by exploiting a kernel vulnerability. What is the MOST significant security implication of a Ring 0 compromise?",
          options: [
            'The rootkit can only affect applications in Ring 3 — it cannot reach other kernel components',
            'The rootkit has unrestricted access to all hardware and can subvert all security mechanisms including the security kernel itself',
            'The rootkit is constrained by the reference monitor even at Ring 0',
            'Ring 0 code is sandboxed by the hypervisor and cannot affect other processes',
          ],
          correctIndex: 1,
          explanation: "Ring 0 code has the highest privilege in the ring model — it can access all hardware, modify all memory, and override any software-based control including the security kernel. A rootkit at Ring 0 can disable logging, modify authentication results, intercept system calls, and hide itself from detection tools that run in Ring 3. The reference monitor (which is implemented in the security kernel) is itself a Ring 0 component — so a Ring 0 rootkit can modify the reference monitor directly. This is why hypervisors (VMMs) operate at Ring -1 or equivalent — below Ring 0 — to maintain integrity.",
          memoryHack: "Ring 0 = king of the system. The king can change the laws. A rootkit that becomes king can rewrite the rules that were supposed to stop it. Rings only protect outer rings from inner rings — never the reverse.",
          conceptName: 'Ring Protection Model',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'thinking',
        },

        // ── Timed Decision 2: Covert channel response ─────────────────────────
        {
          type: 'timedDecision',
          id: 'ch3-act2-td1',
          scenario: "Janet's analysis confirms the covert timing channel has been active for 72 hours. Cryptographic keys have been exfiltrated. The attacker's process (Process A) is still running on Server Cluster 7B. You have 30 seconds to decide the response sequence.",
          timeLimit: 30,
          options: [
            {
              text: 'Isolate Cluster 7B from the network, terminate Process A, and immediately rotate all potentially compromised cryptographic keys',
              isOptimal: true,
              feedback: "Correct sequence: contain, terminate, remediate. Isolating the server stops ongoing exfiltration. Terminating the process ends the channel. Rotating keys invalidates anything already exfiltrated. The order matters — key rotation before isolation leaves the channel open during the rotation window.",
              xpBonus: 50,
            },
            {
              text: 'Rotate the cryptographic keys immediately — that\'s the most critical asset',
              isOptimal: false,
              feedback: "Rotating keys while the channel is still open is ineffective — the new keys can be exfiltrated through the same channel before you finish rotating. Contain first, then rotate. Stop the bleeding before applying the bandage.",
            },
            {
              text: 'Monitor Process A to determine the full scope of exfiltration before acting',
              isOptimal: false,
              feedback: "Every minute you monitor is another minute of exfiltration. The scope analysis can happen from forensic logs after you contain the incident. Real-time monitoring of an active exfiltration channel is not the same as active response.",
            },
            {
              text: 'Terminate Process B — it\'s the receiver; stopping the receiver ends the exfiltration',
              isOptimal: false,
              feedback: "Terminating the receiver stops that receiver — but Process A can simply target a different process. The source process (A) is still encoding and transmitting. Kill the transmitter, not just the current receiver.",
            },
          ],
          conceptName: 'Covert Channel Response',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'worried',
        },

        // ── Think Like a Manager: Architecture governance ──────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch3-act2-tlm1',
          scenario: "A security architect proposes implementing formal security model enforcement (specifically BLP for your classified government contract environment) across all new systems. The development team objects that enforcing the No Write Down property will break 14 existing reporting integrations that rely on high-clearance processes writing summaries to lower-clearance output systems.",
          question: "As CISO, what is the MOST appropriate response?",
          options: [
            'Grant exceptions to all 14 integrations — they are existing business processes and compliance cannot be retroactive',
            'Require redesign of the reporting integrations to use a trusted sanitization process that creates genuinely new, low-clearance content without carrying classified information down',
            'Implement BLP for new systems only; exempt all existing integrations permanently',
            'Accept the risk of No Write Down violations — the reporting integrations are authorized by management',
          ],
          correctIndex: 1,
          explanation: "The right answer forces redesign, not exception. The No Write Down property exists specifically because write-down is an attack vector — as demonstrated by the Nexus breach. Granting exceptions recreates exactly the vulnerability that was exploited. The solution is a trusted intermediary: a sanitization process that human or automated reviewers can verify has genuinely stripped classified content, creating new unclassified output — not just a copy of classified data with a different label. Management authorization doesn't change the technical risk.",
          managerInsight: "When architecture principles conflict with existing processes, fix the processes — not the principles. Principles exist because someone analyzed what goes wrong without them. The 14 broken integrations are technical debt that now needs architectural resolution, not a policy exception that institutionalizes the vulnerability.",
          conceptName: 'Bell-LaPadula Model',
          speaker: 'Janet Park',
          rightCharacter: 'janet_park',
          rightExpression: 'serious',
        },

        // ── Dialogue 3: Act wrap-up ──────────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch3-act2-d3',
          speaker: 'Janet Park',
          speakerSide: 'right',
          text: "The architecture here failed in two completely different ways. The write-down was a policy failure — someone chose to break BLP for convenience. The timing channel was a physics problem — no policy can prevent shared hardware from leaking information through timing. Two fundamentally different attack classes. One server farm, one attacker, two methods. Next lead is Singapore. The cable station. Morales is already on the ground.",
          rightCharacter: 'janet_park',
          rightExpression: 'neutral',
        },
      ],
    },
    null,
    null,
    null,
  ],
};
