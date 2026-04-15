import { ChapterData, StoryScene, KnowledgeCheckQuestion } from '@/lib/types';

// ─── NPC Character Definitions ───────────────────────────────────────────────

const JANET_PARK = { name: 'Janet Park', emoji: '\u{1F469}\u200D\u{1F4BB}', color: '#1e3a5f' };
const DIRECTOR_REEVES = { name: 'Director Reeves', emoji: '\u{1F468}\u200D\u{1F4BC}', color: '#2d1a3a' };
const KAI_TANAKA = { name: 'Kai Tanaka', emoji: '\u{1F9D1}\u200D\u{1F52C}', color: '#1a3a1a' };
const AGENT_MORALES = { name: 'Agent Morales', emoji: '\u{1F575}\uFE0F', color: '#3a1a1a' };

// ─── Chapter 1: Security and Risk Management ────────────────────────────────

const chapter1Scenes: StoryScene[] = [
  // --- Arrival Scenes ---
  {
    id: 'ch1-arrival-1',
    type: 'dialogue',
    background: 'Nexus HQ',
    locationName: 'Nexus HQ, New York',
    leftCharacter: DIRECTOR_REEVES,
    rightCharacter: undefined,
    speaker: 'Director Reeves',
    speakerSide: 'left',
    dialogue:
      'Thank you for coming on such short notice, {player}. At 0347 hours this morning our SIEM triggered a cascade of critical alerts. We have a breach -- and I need someone who understands risk to lead the assessment.',
  },
  {
    id: 'ch1-arrival-2',
    type: 'dialogue',
    background: 'Nexus HQ',
    locationName: 'Nexus HQ, New York',
    leftCharacter: undefined,
    rightCharacter: JANET_PARK,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'I reviewed the preliminary report on the way over. Has the incident response team been activated?',
  },
  {
    id: 'ch1-arrival-3',
    type: 'dialogue',
    background: 'Nexus HQ',
    locationName: 'Nexus HQ, New York',
    leftCharacter: JANET_PARK,
    rightCharacter: undefined,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'SOC is fully staffed. I\'m Janet Park, SOC Lead. Before we dive into containment, Director Reeves wants us to do something unusual -- conduct a proper risk assessment mid-incident. He believes this breach is just the tip of the iceberg.',
  },
  // --- Investigation Scenes ---
  {
    id: 'ch1-investigate-1',
    type: 'choice',
    background: 'Nexus HQ',
    locationName: 'Nexus HQ, New York',
    leftCharacter: JANET_PARK,
    rightCharacter: undefined,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'We need to quantify the potential impact. Which risk analysis approach should we start with for this breach?',
    choices: [
      {
        text: 'Quantitative -- calculate ALE using ARO and SLE to put a dollar figure on the breach.',
        xpBonus: 25,
        response:
          'Exactly right. ALE = ARO x SLE. If this asset is worth $2M and we estimate one breach per year, that\'s a $2M annual loss expectancy. Leadership responds to numbers.',
      },
      {
        text: 'Qualitative -- rank the risk as High, Medium, or Low based on expert judgment.',
        xpBonus: 15,
        response:
          'Qualitative works well for speed, but Director Reeves needs dollar figures for the board. Remember: ALE = ARO x SLE gives us a concrete number.',
      },
      {
        text: 'Skip the analysis -- just contain the breach first.',
        xpBonus: 5,
        response:
          'Containment is important, but without understanding the risk, we might fix a symptom and miss the disease. A quick quantitative assessment -- ALE = ARO x SLE -- will guide our priorities.',
      },
    ],
  },
  {
    id: 'ch1-investigate-2',
    type: 'dialogue',
    background: 'Nexus HQ',
    locationName: 'Nexus HQ, New York',
    leftCharacter: DIRECTOR_REEVES,
    rightCharacter: JANET_PARK,
    speaker: 'Director Reeves',
    speakerSide: 'left',
    dialogue:
      'Good work on the initial assessment. The board will need to see that we followed our NIST-based risk management framework. {player}, I\'m assigning you as the lead on Operation Shadow Protocol. The breach goes deeper than one office -- pack your bags.',
  },
];

const chapter1Briefing = `## Security and Risk Management

The foundation of information security rests on three pillars known as the **CIA Triad**: **Confidentiality**, **Integrity**, and **Availability**. Every security decision you make should protect at least one of these properties.

**Memory Hack -- "CIA":** Think of the CIA as a three-legged stool. Remove one leg and the whole thing falls over. *Confidentiality* keeps secrets secret, *Integrity* keeps data trustworthy, and *Availability* keeps systems running when you need them.

### Risk Management Frameworks

Organizations don't wing it -- they follow structured frameworks. The two heavyweights are **NIST SP 800-37** (Risk Management Framework) and **ISO/IEC 27001** (Information Security Management System). NIST gives you six steps: Categorize, Select, Implement, Assess, Authorize, Monitor. ISO 27001 uses a Plan-Do-Check-Act cycle.

**Memory Hack -- "CSIAAM":** For NIST RMF steps, remember *"Can Security Introverts Actually Authorize Monitors?"* -- Categorize, Select, Implement, Assess, Authorize, Monitor.

### Quantitative vs. Qualitative Risk Analysis

Quantitative analysis uses numbers and formulas. The key equation is:

> **ALE = ARO x SLE**

- **SLE (Single Loss Expectancy)** = Asset Value x Exposure Factor
- **ARO (Annualized Rate of Occurrence)** = How often per year
- **ALE (Annualized Loss Expectancy)** = Expected yearly loss

Qualitative analysis uses categories (High/Medium/Low) and expert judgment. Both approaches are valid; quantitative is more precise but requires more data.

**Memory Hack -- "SALE":** *SLE first, then multiply by ARO to get ALE.* Think of it as a "SALE" -- you calculate the Single price, multiply by Annual frequency, and get the Loss total.

### Security Governance and Compliance

Security governance ensures security aligns with business objectives. Key elements include policies, standards, baselines, guidelines, and procedures. Compliance means adhering to laws, regulations, and contractual obligations -- think GDPR, HIPAA, SOX, and PCI-DSS.

### Business Continuity and Disaster Recovery

**BCP** (Business Continuity Planning) keeps the business running during disruptions. **DRP** (Disaster Recovery Planning) restores IT systems after a disaster. The BCP process follows four phases: Project Scope, Business Impact Analysis (BIA), Continuity Planning, and Approval and Implementation.

**Memory Hack -- "Think Like a Manager":** When the exam asks about risk, always choose the answer that **balances security with business needs**. A manager doesn't just lock everything down -- they make informed decisions about acceptable risk levels.`;

const chapter1Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'An asset valued at $500,000 has an exposure factor of 40% and the threat is expected to occur twice per year. What is the Annualized Loss Expectancy (ALE)?',
    options: ['$200,000', '$400,000', '$500,000', '$1,000,000'],
    correct_index: 1,
    explanation:
      'SLE = Asset Value x EF = $500,000 x 0.40 = $200,000. ALE = SLE x ARO = $200,000 x 2 = $400,000.',
  },
  {
    question:
      'Which risk management framework uses the six-step process of Categorize, Select, Implement, Assess, Authorize, and Monitor?',
    options: ['ISO 27001', 'COBIT', 'NIST SP 800-37 RMF', 'ITIL'],
    correct_index: 2,
    explanation:
      'NIST SP 800-37 Risk Management Framework (RMF) defines these six steps. ISO 27001 uses Plan-Do-Check-Act.',
  },
  {
    question:
      'A CEO asks: "Why should we spend $100,000 on a firewall?" Which answer BEST demonstrates the Think Like a Manager mindset?',
    options: [
      'Because firewalls are an industry best practice.',
      'Because our quantitative risk analysis shows $400,000 in potential annual losses that this control would reduce by 80%, saving $220,000 net.',
      'Because we are required to have one by law.',
      'Because our competitor was recently breached.',
    ],
    correct_index: 1,
    explanation:
      'A manager justifies spending with quantified risk reduction. The cost-benefit analysis shows the control saves more than it costs ($400K x 0.80 = $320K saved, minus $100K cost = $220K net benefit).',
  },
];

// ─── Chapter 2: Asset Security ──────────────────────────────────────────────

const chapter2Scenes: StoryScene[] = [
  {
    id: 'ch2-arrival-1',
    type: 'dialogue',
    background: 'Data Vault',
    locationName: 'Data Vault, New Jersey',
    leftCharacter: JANET_PARK,
    rightCharacter: undefined,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'Welcome to the Nexus Data Vault. This facility houses petabytes of customer records, financial data, and proprietary research. Our initial analysis suggests the breach originated from a data classification failure right here.',
  },
  {
    id: 'ch2-arrival-2',
    type: 'dialogue',
    background: 'Data Vault',
    locationName: 'Data Vault, New Jersey',
    leftCharacter: undefined,
    rightCharacter: KAI_TANAKA,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'A classification failure? You mean someone labeled sensitive data at the wrong level?',
  },
  {
    id: 'ch2-arrival-3',
    type: 'dialogue',
    background: 'Data Vault',
    locationName: 'Data Vault, New Jersey',
    leftCharacter: KAI_TANAKA,
    rightCharacter: undefined,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'Kai Tanaka, Forensics. Worse than that -- entire datasets marked "Public" were actually "Confidential." The data owner signed off on it months ago without reviewing the actual contents. Classic failure of the ownership model.',
  },
  {
    id: 'ch2-investigate-1',
    type: 'choice',
    background: 'Data Vault',
    locationName: 'Data Vault, New Jersey',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'We found three roles involved in this mess. Who bears ultimate responsibility for the data classification decision?',
    choices: [
      {
        text: 'The Data Owner -- they are accountable for classification and protection decisions.',
        xpBonus: 25,
        response:
          'Correct. The Data Owner is ultimately responsible for determining classification levels. The custodian implements controls, and users follow the rules -- but the buck stops with the owner.',
      },
      {
        text: 'The Data Custodian -- they manage the storage systems.',
        xpBonus: 10,
        response:
          'Close, but the custodian implements technical controls based on what the owner decides. The Data Owner holds ultimate responsibility for classification.',
      },
      {
        text: 'The IT Department -- they run the infrastructure.',
        xpBonus: 5,
        response:
          'IT plays a custodial role, but classification responsibility falls on the Data Owner -- typically a senior business manager who understands the data\'s value.',
      },
    ],
  },
  {
    id: 'ch2-investigate-2',
    type: 'dialogue',
    background: 'Data Vault',
    locationName: 'Data Vault, New Jersey',
    leftCharacter: JANET_PARK,
    rightCharacter: KAI_TANAKA,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'The misclassified data was sitting on a server with minimal access controls because the system treated it as public. Whoever breached us knew exactly where to look. {player}, we need to trace this data flow -- the attacker\'s trail leads overseas.',
  },
];

const chapter2Briefing = `## Asset Security

Protecting assets starts with knowing what you have, what it's worth, and who is responsible for it. Asset security is about the **entire data lifecycle** -- from creation to destruction.

### Data Classification

Organizations classify data to apply appropriate protection levels. Government uses: **Top Secret > Secret > Confidential > Unclassified**. Private sector commonly uses: **Restricted > Confidential > Internal > Public**.

**Memory Hack -- "TSCU for Gov, RCIP for Biz":** Government classification reads like a spy movie rating system (Top Secret is the blockbuster). Business classification reads like a building's access zones -- Restricted areas need keycards, Public areas are the lobby.

### Data Ownership Roles

Three key roles govern data:

- **Data Owner:** Senior management; decides classification and access policies. *Accountable* for the data.
- **Data Custodian:** IT staff; implements controls, backups, and storage. *Responsible* for day-to-day protection.
- **Data User:** End users; must follow policies and handle data according to its classification.

**Memory Hack -- "OCU" (Owner, Custodian, User):** Think of a library. The *Owner* is the library board that decides what books to acquire. The *Custodian* is the librarian who shelves and protects them. The *User* is the patron who borrows and reads them.

### Data States

Data exists in three states:

1. **At Rest** -- stored on disk, database, or backup media (encrypt with AES-256)
2. **In Transit** -- moving across a network (protect with TLS/IPsec)
3. **In Use** -- actively being processed in memory (hardest to protect)

**Memory Hack -- "ReTU":** Rest, Transit, Use. Picture data as a package: it sits in a warehouse (rest), rides a truck (transit), and gets opened on the workbench (use). Each stage needs different locks.

### Data Lifecycle and Retention

Data follows a lifecycle: **Create > Store > Use > Share > Archive > Destroy**. Retention policies define how long data is kept. Destroying data securely is critical -- degaussing, crypto-shredding, or physical destruction ensure data cannot be recovered.

### Privacy Principles

Privacy frameworks like GDPR establish principles including purpose limitation, data minimization, and the right to be forgotten. As a security professional, you must ensure that privacy requirements are baked into your data protection strategy.

**Memory Hack -- "Think Like a Manager":** When choosing between security answers on the exam, remember that the Data Owner makes business decisions about data. The custodian only implements those decisions. Never confuse who *decides* with who *does*.`;

const chapter2Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'Who is ultimately accountable for determining the classification level of organizational data?',
    options: ['Data Custodian', 'Data User', 'Data Owner', 'Chief Information Security Officer'],
    correct_index: 2,
    explanation:
      'The Data Owner (typically senior/executive management) is accountable for classification decisions. The CISO advises, but the business owner makes the call.',
  },
  {
    question:
      'Which data state is MOST difficult to protect and represents data actively being processed?',
    options: ['Data at Rest', 'Data in Transit', 'Data in Use', 'Data in Archive'],
    correct_index: 2,
    explanation:
      'Data in Use (being processed in memory) is the most difficult to protect because it must be unencrypted for processing. Technologies like Intel SGX and homomorphic encryption are emerging solutions.',
  },
  {
    question:
      'An organization needs to permanently destroy data on decommissioned hard drives. Which method is MOST appropriate for magnetic media?',
    options: [
      'Formatting the drive',
      'Deleting all files and emptying the recycle bin',
      'Degaussing the drive',
      'Encrypting the drive',
    ],
    correct_index: 2,
    explanation:
      'Degaussing applies a powerful magnetic field that destroys data on magnetic media. Simple deletion or formatting does not remove data -- it only removes file system pointers. Encryption alone does not destroy the data.',
  },
];

// ─── Chapter 3: Security Architecture and Engineering ───────────────────────

const chapter3Scenes: StoryScene[] = [
  {
    id: 'ch3-arrival-1',
    type: 'dialogue',
    background: 'Server Farm',
    locationName: 'Server Farm, Zurich',
    leftCharacter: AGENT_MORALES,
    rightCharacter: undefined,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'Agent Morales, FBI Cyber Division. We\'ve been tracking this threat actor for months. The trail from New Jersey leads here -- Zurich. This server farm runs Nexus\'s European infrastructure, and we believe the attacker exploited a flaw in the security architecture itself.',
  },
  {
    id: 'ch3-arrival-2',
    type: 'dialogue',
    background: 'Server Farm',
    locationName: 'Server Farm, Zurich',
    leftCharacter: undefined,
    rightCharacter: KAI_TANAKA,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'An architectural flaw? Are we talking about a failure in the security model -- like improper enforcement of access rules at the system level?',
  },
  {
    id: 'ch3-arrival-3',
    type: 'dialogue',
    background: 'Server Farm',
    locationName: 'Server Farm, Zurich',
    leftCharacter: KAI_TANAKA,
    rightCharacter: AGENT_MORALES,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I\'ve been analyzing the server configurations. The system was designed to enforce confidentiality using a model similar to Bell-LaPadula, but someone introduced a covert channel that bypassed the "no read up, no write down" rule. The architecture was sound in theory -- but the implementation had a blind spot.',
  },
  {
    id: 'ch3-investigate-1',
    type: 'choice',
    background: 'Server Farm',
    locationName: 'Server Farm, Zurich',
    leftCharacter: KAI_TANAKA,
    rightCharacter: AGENT_MORALES,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I found that a lower-clearance process was reading data from a higher classification level. Which security model\'s rules were violated here?',
    choices: [
      {
        text: 'Bell-LaPadula -- the "no read up" (Simple Security) property was violated.',
        xpBonus: 25,
        response:
          'Exactly! Bell-LaPadula\'s Simple Security Property says "no read up" -- a subject cannot read data at a higher classification. This violation means confidentiality was compromised.',
      },
      {
        text: 'Biba -- the integrity model was broken.',
        xpBonus: 10,
        response:
          'Biba focuses on integrity, not confidentiality. The "no read up" issue here is a Bell-LaPadula violation. Remember: Bell-LaPadula = Confidentiality, Biba = Integrity.',
      },
      {
        text: 'Clark-Wilson -- the transaction integrity was compromised.',
        xpBonus: 5,
        response:
          'Clark-Wilson deals with well-formed transactions and separation of duties for integrity. This "no read up" issue is a Bell-LaPadula confidentiality violation.',
      },
    ],
  },
  {
    id: 'ch3-investigate-2',
    type: 'dialogue',
    background: 'Server Farm',
    locationName: 'Server Farm, Zurich',
    leftCharacter: AGENT_MORALES,
    rightCharacter: KAI_TANAKA,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'The covert channel used timing variations to exfiltrate data -- a covert timing channel. Our network forensics team in Singapore just flagged suspicious traffic patterns on the transpacific link. {player}, we need you there next.',
  },
];

const chapter3Briefing = `## Security Architecture and Engineering

Security architecture is about designing systems that enforce security policies even when attackers try to subvert them. This domain covers the theoretical models, cryptographic foundations, and design principles that underpin secure systems.

### Security Models

Three foundational models govern how systems enforce policy:

- **Bell-LaPadula (BLP):** Focuses on **confidentiality**. Two key rules: *Simple Security Property* ("no read up") and *Star Property* ("no write down"). A Secret-level user cannot read Top Secret data, and cannot write data down to an Unclassified system.

- **Biba:** Focuses on **integrity**. Inverts Bell-LaPadula: *Simple Integrity* ("no read down") and *Star Integrity* ("no write up"). Prevents contamination of high-integrity data by lower-integrity sources.

- **Clark-Wilson:** Also focuses on **integrity** but uses a commercial approach: *well-formed transactions* and *separation of duties*. Users access data only through controlled programs (access triples: User-Program-Data).

**Memory Hack -- "BLP = Lips sealed (Confidentiality), Biba = Bible (Integrity of the word)":** Bell-LaPadula keeps secrets (*lips sealed*). Biba keeps data pure (*like scripture*). If you remember "no read up, no write down" for BLP, just flip it for Biba.

### Cryptographic Concepts

Cryptography provides confidentiality, integrity, authentication, and non-repudiation:

- **Symmetric encryption** (AES, 3DES): One shared key, fast, used for bulk data.
- **Asymmetric encryption** (RSA, ECC): Key pair (public/private), slower, used for key exchange and digital signatures.
- **Hashing** (SHA-256): One-way function producing a fixed-length digest for integrity verification.

**Memory Hack -- "SAS":** *Symmetric = Same key, Asymmetric = A pair of keys, Signing = hash + private key.*

### Secure Design Principles

Key principles include: defense in depth (layered security), least privilege, fail-secure defaults, separation of duties, and economy of mechanism (keep it simple). These principles appear repeatedly on the exam.

### Security Evaluation Criteria

The **Common Criteria (ISO 15408)** replaced older standards like TCSEC (Orange Book) and ITSEC. It uses Evaluation Assurance Levels (EAL1 through EAL7) to rate how rigorously a product was tested.

### Covert Channels

A covert channel is an unintended communication path that violates policy. **Covert storage channels** manipulate shared resources. **Covert timing channels** modulate system timing. Both are hard to detect and are a favorite exam topic.

**Memory Hack -- "Think Like a Manager":** Architecture flaws are the most expensive to fix after deployment. The exam favors answers that address design-phase security -- building security in, rather than bolting it on.`;

const chapter3Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'Which security model enforces confidentiality using the "no read up, no write down" rules?',
    options: ['Biba', 'Clark-Wilson', 'Bell-LaPadula', 'Brewer-Nash'],
    correct_index: 2,
    explanation:
      'Bell-LaPadula enforces confidentiality. "No read up" (Simple Security Property) prevents subjects from reading above their clearance. "No write down" (Star Property) prevents writing classified data to a lower level.',
  },
  {
    question:
      'An attacker exfiltrates data by manipulating the timing of system responses. What type of attack is this?',
    options: [
      'Covert storage channel',
      'Covert timing channel',
      'Side-channel attack',
      'Buffer overflow',
    ],
    correct_index: 1,
    explanation:
      'A covert timing channel uses variations in system timing (response times, CPU usage patterns) to transmit information. A covert storage channel manipulates shared storage resources instead.',
  },
];

// ─── Chapter 4: Communication and Network Security ──────────────────────────

const chapter4Scenes: StoryScene[] = [
  {
    id: 'ch4-arrival-1',
    type: 'dialogue',
    background: 'Cable Station',
    locationName: 'Cable Station, Singapore',
    leftCharacter: JANET_PARK,
    rightCharacter: undefined,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'Welcome to Singapore, {player}. This undersea cable station routes 40% of Asia-Pacific internet traffic. Our network monitoring picked up anomalous packets being injected into the data stream between Zurich and this facility.',
  },
  {
    id: 'ch4-arrival-2',
    type: 'dialogue',
    background: 'Cable Station',
    locationName: 'Cable Station, Singapore',
    leftCharacter: undefined,
    rightCharacter: KAI_TANAKA,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'Packet injection on a backbone link? That suggests the attacker has access at a network layer below the application. Are we looking at a man-in-the-middle scenario?',
  },
  {
    id: 'ch4-arrival-3',
    type: 'dialogue',
    background: 'Cable Station',
    locationName: 'Cable Station, Singapore',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'The packet captures show ARP spoofing at Layer 2, which redirected traffic through a rogue switch. From there the attacker performed SSL stripping to downgrade encrypted connections. Classic multi-layer attack -- they understood the OSI model better than our defense team did.',
  },
  {
    id: 'ch4-investigate-1',
    type: 'choice',
    background: 'Cable Station',
    locationName: 'Cable Station, Singapore',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'Kai recovered the packet capture. The attacker used ARP spoofing to redirect traffic. At which layer of the OSI model does ARP operate?',
    choices: [
      {
        text: 'Layer 2 -- Data Link layer, where MAC addresses and ARP live.',
        xpBonus: 25,
        response:
          'Correct! ARP maps IP addresses to MAC addresses and operates at Layer 2 (Data Link). ARP spoofing sends fake ARP replies to poison the victim\'s ARP cache, redirecting traffic to the attacker.',
      },
      {
        text: 'Layer 3 -- Network layer, since ARP involves IP addresses.',
        xpBonus: 10,
        response:
          'ARP does involve IP addresses, but it resolves them to MAC addresses and operates at Layer 2 (Data Link). Layer 3 handles routing with protocols like IP and ICMP.',
      },
      {
        text: 'Layer 4 -- Transport layer.',
        xpBonus: 5,
        response:
          'Layer 4 handles TCP and UDP. ARP operates at Layer 2 (Data Link), mapping IP addresses to MAC addresses. Remember: "Please Do Not Throw Sausage Pizza Away" for the seven layers.',
      },
    ],
  },
  {
    id: 'ch4-investigate-2',
    type: 'dialogue',
    background: 'Cable Station',
    locationName: 'Cable Station, Singapore',
    leftCharacter: AGENT_MORALES,
    rightCharacter: JANET_PARK,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'We\'ve traced the rogue device\'s MAC address to hardware purchased with stolen credentials from a Nexus employee in London. This is no ordinary hacker -- this is an insider threat. {player}, London is your next stop.',
  },
];

const chapter4Briefing = `## Communication and Network Security

Networks are the highways of information, and understanding how data travels -- and how attackers intercept it -- is essential for the CISSP exam. This domain covers models, protocols, attacks, and defenses.

### The OSI Model

The OSI model has seven layers. From bottom to top:

| Layer | Name | Key Protocols | Security Relevance |
|-------|------|---------------|-------------------|
| 7 | Application | HTTP, SMTP, DNS | WAFs, input validation |
| 6 | Presentation | SSL/TLS, JPEG | Encryption, formatting |
| 5 | Session | NetBIOS, RPC | Session hijacking |
| 4 | Transport | TCP, UDP | Port scanning, SYN floods |
| 3 | Network | IP, ICMP, IPsec | Routing attacks, VPNs |
| 2 | Data Link | ARP, Ethernet | ARP spoofing, VLAN hopping |
| 1 | Physical | Cables, hubs | Wiretapping, jamming |

**Memory Hack -- "Please Do Not Throw Sausage Pizza Away":** Layers 1-7: Physical, Data Link, Network, Transport, Session, Presentation, Application. This mnemonic has saved countless exam-takers.

### Common Network Attacks

- **Man-in-the-Middle (MITM):** Attacker intercepts communication between two parties. ARP spoofing and DNS poisoning are common techniques.
- **Denial of Service (DoS/DDoS):** Overwhelm resources. SYN flood exploits the TCP three-way handshake by sending SYN packets without completing the connection.
- **VLAN Hopping:** Attacker jumps between VLANs using switch spoofing or double tagging.

**Memory Hack -- "SYN-ACK Attack":** A SYN flood is like someone knocking on every door in a building and running away -- the building manager (server) runs out of doormen (connections) waiting for visitors who never arrive.

### Firewalls and Network Defenses

- **Packet filtering:** Inspects headers at Layers 3-4 (stateless).
- **Stateful inspection:** Tracks connection state for smarter filtering.
- **Application proxy:** Operates at Layer 7, inspecting content.
- **Next-gen firewalls (NGFW):** Combine stateful inspection with application awareness and IPS.

### VPNs and Encryption Protocols

VPNs create encrypted tunnels over public networks:

- **IPsec:** Works at Layer 3. Two modes: *Transport* (encrypts payload) and *Tunnel* (encrypts entire packet). Uses AH for integrity and ESP for confidentiality.
- **TLS/SSL:** Works at Layer 5-6. Secures web traffic (HTTPS), email, and VPN connections.

**Memory Hack -- "IPsec AH vs ESP":** AH = *Authentication Header* (integrity only, no encryption). ESP = *Encapsulating Security Payload* (encryption + integrity). If you need confidentiality, you need ESP.

### Wireless Security

WPA3 is the current standard. WEP is broken, WPA/WPA2-TKIP are deprecated. WPA2-AES (CCMP) is acceptable; WPA3-SAE is preferred. Always use enterprise mode (802.1X authentication) over personal mode (PSK) in corporate environments.

**Memory Hack -- "Think Like a Manager":** Network security questions often ask about the BEST control. Defense in depth means layering controls -- don't rely on a single firewall. The best answer usually combines multiple controls at different OSI layers.`;

const chapter4Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'Which IPsec protocol provides BOTH confidentiality and integrity for network traffic?',
    options: [
      'AH (Authentication Header)',
      'ESP (Encapsulating Security Payload)',
      'IKE (Internet Key Exchange)',
      'ISAKMP',
    ],
    correct_index: 1,
    explanation:
      'ESP (Encapsulating Security Payload) provides confidentiality through encryption AND integrity. AH provides only authentication and integrity -- no encryption. IKE and ISAKMP are used for key negotiation, not direct data protection.',
  },
  {
    question:
      'An attacker sends forged ARP replies to associate their MAC address with the default gateway\'s IP. What type of attack is this?',
    options: ['DNS poisoning', 'VLAN hopping', 'ARP spoofing / ARP cache poisoning', 'SYN flood'],
    correct_index: 2,
    explanation:
      'ARP spoofing (ARP cache poisoning) sends fake ARP replies to redirect traffic through the attacker\'s machine, enabling man-in-the-middle attacks at Layer 2.',
  },
  {
    question:
      'A company needs to secure communications between two office locations over the public internet. Which technology creates an encrypted tunnel at the network layer?',
    options: [
      'TLS VPN',
      'IPsec VPN in tunnel mode',
      'SSH tunnel',
      'HTTPS proxy',
    ],
    correct_index: 1,
    explanation:
      'IPsec VPN in tunnel mode encrypts the entire original IP packet and wraps it in a new IP header, operating at Layer 3 (Network). TLS operates at higher layers. SSH tunnels are application-specific.',
  },
];

// ─── Chapter 5: Identity and Access Management ──────────────────────────────

const chapter5Scenes: StoryScene[] = [
  {
    id: 'ch5-arrival-1',
    type: 'dialogue',
    background: 'Office',
    locationName: 'Office, London',
    leftCharacter: AGENT_MORALES,
    rightCharacter: undefined,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'London office, {player}. The stolen credentials used to buy that rogue hardware in Singapore trace back to a senior network engineer here -- Marcus Webb. But here\'s the twist: Webb claims he never made those purchases. His account may have been compromised.',
  },
  {
    id: 'ch5-arrival-2',
    type: 'dialogue',
    background: 'Office',
    locationName: 'Office, London',
    leftCharacter: undefined,
    rightCharacter: JANET_PARK,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'If Webb\'s credentials were stolen, we need to examine the authentication system. What kind of authentication was he using? Single factor? Was there MFA in place?',
  },
  {
    id: 'ch5-arrival-3',
    type: 'dialogue',
    background: 'Office',
    locationName: 'Office, London',
    leftCharacter: JANET_PARK,
    rightCharacter: AGENT_MORALES,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'That\'s the problem. Webb had admin-level access to network infrastructure, but the London office was still using single-factor authentication -- just a password. No MFA, no smart card, nothing. And his password hadn\'t been rotated in 14 months. The attacker likely obtained it through credential stuffing from a third-party breach.',
  },
  {
    id: 'ch5-investigate-1',
    type: 'choice',
    background: 'Office',
    locationName: 'Office, London',
    leftCharacter: JANET_PARK,
    rightCharacter: AGENT_MORALES,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'Webb had domain admin privileges across the European infrastructure. What access control principle was violated by giving a network engineer domain-wide admin rights?',
    choices: [
      {
        text: 'Least Privilege -- he should only have had access necessary for his specific job duties.',
        xpBonus: 25,
        response:
          'Correct. Least privilege dictates that users receive only the minimum permissions needed to perform their job. A network engineer doesn\'t need domain admin across all European systems.',
      },
      {
        text: 'Separation of Duties -- one person shouldn\'t control everything.',
        xpBonus: 15,
        response:
          'Separation of duties is important, but the primary violation here is least privilege. Webb had far more access than his job role required. SoD would apply if one person could both approve and execute changes.',
      },
      {
        text: 'Need to Know -- he didn\'t need to know everything.',
        xpBonus: 10,
        response:
          'Need to know is related, but least privilege is the broader and more accurate principle here. Least privilege encompasses both data access (need to know) and system permissions.',
      },
    ],
  },
  {
    id: 'ch5-investigate-2',
    type: 'dialogue',
    background: 'Office',
    locationName: 'Office, London',
    leftCharacter: KAI_TANAKA,
    rightCharacter: AGENT_MORALES,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I\'ve correlated the login timestamps. Webb\'s account was accessed from two different countries simultaneously -- London and an IP geolocated to Eastern Europe. The attacker piggybacked on Webb\'s SSO session to pivot into multiple systems. We need to examine all the forensic evidence in detail. Tel Aviv has the best lab for this.',
  },
];

const chapter5Briefing = `## Identity and Access Management (IAM)

IAM is about ensuring the right people have the right access to the right resources at the right time. It covers identification, authentication, authorization, and accountability -- the four pillars of access control.

### Authentication Factors

Authentication verifies identity using one or more factors:

1. **Something You Know** -- passwords, PINs, passphrases
2. **Something You Have** -- smart cards, tokens, phones (for push/OTP)
3. **Something You Are** -- biometrics (fingerprints, iris, facial recognition)

**Multi-Factor Authentication (MFA)** requires two or more *different* factors. Two passwords is NOT MFA -- that's just two of the same factor.

**Memory Hack -- "Know-Have-Are":** Picture a nightclub bouncer. *Know* = the secret password to get in. *Have* = your VIP card. *Are* = the bouncer recognizes your face. MFA means showing at least two different types.

### Single Sign-On (SSO) and Federated Identity

**SSO** lets users authenticate once and access multiple systems. Technologies include Kerberos (uses tickets), SAML (XML-based, web SSO), OAuth (authorization delegation), and OpenID Connect (authentication layer on OAuth).

**Federated identity** extends SSO across organizational boundaries. Think of logging into a travel site with your Google account.

**Memory Hack -- "Kerberos = Guard Dog":** Kerberos (the three-headed dog from Greek mythology) guards access using *tickets*. The KDC issues a TGT (Ticket-Granting Ticket), which you exchange for service tickets. Three heads = three parties: client, KDC, service.

### Access Control Models

- **DAC (Discretionary):** Owner decides who gets access. Flexible but risky -- users can share permissions. Used in most operating systems (file permissions).
- **MAC (Mandatory):** System enforces access based on labels/clearances. Rigid but secure. Used in military/government. The system, not the user, decides.
- **RBAC (Role-Based):** Access based on job roles. Most common in enterprises. Simplifies administration.
- **ABAC (Attribute-Based):** Access based on attributes (user role + time + location + device). Most flexible and granular.

**Memory Hack -- "D-M-R-A from Loose to Tight":** DAC is the loosest (owner decides), MAC is the tightest (system decides), RBAC is the practical middle ground, and ABAC is the smartest (considers context).

### Privilege Escalation and Identity Lifecycle

**Privilege escalation** occurs when a user gains higher access than intended -- either *vertical* (gaining admin from user) or *horizontal* (accessing another user's account). Prevent it with least privilege, regular access reviews, and strong authentication.

The **identity lifecycle** covers: provisioning (creating accounts), managing (updates, role changes), and deprovisioning (disabling/deleting accounts when employees leave). Failure to deprovision is a top audit finding.

**Memory Hack -- "Think Like a Manager":** IAM questions love least privilege and separation of duties. When an exam question describes someone with too much access, the answer is almost always "least privilege was violated." When one person can do an entire process alone, it's "separation of duties."`;

const chapter5Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'A user logs in with a password and then provides a fingerprint scan. What type of authentication is this?',
    options: [
      'Single-factor authentication',
      'Multi-factor authentication',
      'Two-step verification',
      'Biometric authentication',
    ],
    correct_index: 1,
    explanation:
      'This is multi-factor authentication (MFA) because it uses two different factor types: something you know (password) and something you are (fingerprint). Using two of the same type would not be MFA.',
  },
  {
    question:
      'Which access control model assigns permissions based on job function and is the MOST commonly used in enterprise environments?',
    options: [
      'Discretionary Access Control (DAC)',
      'Mandatory Access Control (MAC)',
      'Role-Based Access Control (RBAC)',
      'Rule-Based Access Control',
    ],
    correct_index: 2,
    explanation:
      'RBAC assigns permissions based on roles (job functions). It is the most widely used model in enterprises because it simplifies administration -- you assign users to roles rather than managing individual permissions.',
  },
  {
    question:
      'An attacker uses credentials stolen from one website to access a user\'s account on another site where they reused the same password. What is this attack called?',
    options: [
      'Brute force attack',
      'Credential stuffing',
      'Password spraying',
      'Rainbow table attack',
    ],
    correct_index: 1,
    explanation:
      'Credential stuffing uses stolen username/password pairs from one breach to attempt login on other sites, exploiting password reuse. Brute force tries many combinations; password spraying tries common passwords across many accounts.',
  },
];

// ─── Chapter 6: Security Assessment and Testing ─────────────────────────────

const chapter6Scenes: StoryScene[] = [
  {
    id: 'ch6-arrival-1',
    type: 'dialogue',
    background: 'Forensics Lab',
    locationName: 'Forensics Lab, Tel Aviv',
    leftCharacter: KAI_TANAKA,
    rightCharacter: undefined,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'This is our partner lab in Tel Aviv -- one of the best digital forensics facilities in the world. I\'ve shipped all the evidence we collected from New Jersey, Zurich, Singapore, and London here for comprehensive analysis. Time to test every assumption we\'ve made.',
  },
  {
    id: 'ch6-arrival-2',
    type: 'dialogue',
    background: 'Forensics Lab',
    locationName: 'Forensics Lab, Tel Aviv',
    leftCharacter: undefined,
    rightCharacter: AGENT_MORALES,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'Good. We need a structured assessment approach. We should run vulnerability scans on the affected systems, review the penetration testing results, and audit our security controls against our compliance requirements.',
  },
  {
    id: 'ch6-arrival-3',
    type: 'dialogue',
    background: 'Forensics Lab',
    locationName: 'Forensics Lab, Tel Aviv',
    leftCharacter: AGENT_MORALES,
    rightCharacter: KAI_TANAKA,
    speaker: 'Agent Morales',
    speakerSide: 'left',
    dialogue:
      'Agreed. I\'ve also requested the last SOC 2 Type II report for Nexus. If the auditors gave a clean opinion but this breach was already underway, we have a serious gap between what was tested and what was actually happening.',
  },
  {
    id: 'ch6-investigate-1',
    type: 'choice',
    background: 'Forensics Lab',
    locationName: 'Forensics Lab, Tel Aviv',
    leftCharacter: KAI_TANAKA,
    rightCharacter: AGENT_MORALES,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I ran a vulnerability scan on the compromised Zurich servers and got hundreds of findings. What is the FIRST step we should take with these results?',
    choices: [
      {
        text: 'Validate the findings to eliminate false positives before prioritizing remediation.',
        xpBonus: 25,
        response:
          'Perfect. Vulnerability scanners are noisy -- you must validate findings to separate real vulnerabilities from false positives. Then prioritize by risk severity, not just CVSS score.',
      },
      {
        text: 'Immediately patch everything the scanner found.',
        xpBonus: 10,
        response:
          'Patching without validation wastes resources on false positives and may break systems. Always validate scan results first, then prioritize based on actual risk to the business.',
      },
      {
        text: 'Forward the report to management and let them decide.',
        xpBonus: 5,
        response:
          'Management needs actionable intelligence, not raw scan output. Validate findings first, eliminate false positives, prioritize by risk, then present a clear remediation plan.',
      },
    ],
  },
  {
    id: 'ch6-investigate-2',
    type: 'dialogue',
    background: 'Forensics Lab',
    locationName: 'Forensics Lab, Tel Aviv',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'The assessment confirms it. The attacker exploited a chain of vulnerabilities: misclassified data, an architectural covert channel, network MITM, and stolen credentials. But the root entry point -- the initial compromise -- traces back to a software vulnerability that was introduced during development. {player}, we need to head back to New York to coordinate the response, then trace this to its origin in Austin.',
  },
];

const chapter6Briefing = `## Security Assessment and Testing

Security assessment and testing is about systematically evaluating your security posture. You cannot protect what you haven't tested, and you cannot improve what you haven't measured.

### Vulnerability Assessments vs. Penetration Testing

These are complementary but different activities:

- **Vulnerability Assessment:** Identifies and catalogs weaknesses. Uses automated scanners (Nessus, Qualys, OpenVAS). Produces a broad list of potential issues. *Does not exploit* vulnerabilities.
- **Penetration Testing:** Actively exploits vulnerabilities to demonstrate real-world impact. Follows a methodology: planning, reconnaissance, scanning, exploitation, post-exploitation, reporting. *Proves* what an attacker could actually do.

**Memory Hack -- "Vuln Scan = Doctor's Checkup, Pen Test = Surgery":** A vulnerability scan is like a check-up that identifies symptoms. A penetration test is like exploratory surgery that shows exactly what's wrong and how bad it is.

### Penetration Testing Approaches

- **Black Box:** Tester has zero knowledge of the environment (simulates external attacker).
- **White Box:** Tester has full knowledge including source code and architecture (most thorough).
- **Gray Box:** Tester has partial knowledge (simulates insider or partner with limited access).

### Log Reviews and Monitoring

Security assessments should include review of:
- **SIEM logs** for correlation of security events
- **Audit logs** for user activity and access patterns
- **System logs** for configuration changes and errors
- **Network flow data** for anomalous traffic patterns

Continuous monitoring is more valuable than periodic assessments. Real-time alerting catches incidents faster.

### SOC 2 and Audit Types

**SOC 2** reports evaluate controls relevant to security, availability, processing integrity, confidentiality, and privacy (the Trust Services Criteria):

- **Type I:** Evaluates control design at a *point in time*.
- **Type II:** Evaluates control design AND operating effectiveness over a *period of time* (typically 6-12 months). More valuable than Type I.

**Memory Hack -- "Type I = Snapshot, Type II = Movie":** Type I captures one moment. Type II watches the whole film to see if controls actually work over time.

### Security Metrics and KPIs

Effective security programs measure:
- Mean Time to Detect (MTTD) and Mean Time to Respond (MTTR)
- Percentage of systems patched within SLA
- Number of critical/high vulnerabilities over time
- Phishing click rates and security awareness scores

**Memory Hack -- "Think Like a Manager":** Assessment questions often present a scenario and ask for the BEST approach. Remember: vulnerability assessments find problems, penetration tests prove impact, and audits verify compliance. Choose the one that matches what the question is really asking for.`;

const chapter6Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'What is the PRIMARY difference between a vulnerability assessment and a penetration test?',
    options: [
      'Vulnerability assessments are automated; penetration tests are manual.',
      'Vulnerability assessments identify weaknesses; penetration tests actively exploit them.',
      'Vulnerability assessments are internal; penetration tests are external.',
      'Vulnerability assessments use scanners; penetration tests use social engineering.',
    ],
    correct_index: 1,
    explanation:
      'The primary difference is exploitation. Vulnerability assessments identify and catalog weaknesses without exploiting them. Penetration tests actively exploit vulnerabilities to demonstrate real-world impact and prove what an attacker could achieve.',
  },
  {
    question:
      'A SOC 2 Type II report evaluates security controls over what time frame?',
    options: [
      'A single point in time',
      'A period of time, typically 6-12 months',
      'The entire lifetime of the organization',
      'The last 30 days only',
    ],
    correct_index: 1,
    explanation:
      'SOC 2 Type II evaluates control design AND operating effectiveness over a period of time (typically 6-12 months). Type I evaluates design only at a single point in time. Type II is more valuable because it shows whether controls actually work consistently.',
  },
];

// ─── Chapter 7: Security Operations ─────────────────────────────────────────

const chapter7Scenes: StoryScene[] = [
  {
    id: 'ch7-arrival-1',
    type: 'dialogue',
    background: 'SOC War Room',
    locationName: 'SOC War Room, New York',
    leftCharacter: DIRECTOR_REEVES,
    rightCharacter: undefined,
    speaker: 'Director Reeves',
    speakerSide: 'left',
    dialogue:
      'Welcome back to New York, {player}. The board has declared this a full-scale security incident. I\'m activating the Crisis Management Team. You\'ve been in the field, you\'ve seen the evidence -- now I need you to lead the incident response from this war room.',
  },
  {
    id: 'ch7-arrival-2',
    type: 'dialogue',
    background: 'SOC War Room',
    locationName: 'SOC War Room, New York',
    leftCharacter: undefined,
    rightCharacter: JANET_PARK,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'Understood. We need to follow the incident response lifecycle. We\'ve already completed detection and some analysis in the field. Now we need to formally contain, eradicate, and recover -- in that order. Has the containment strategy been approved?',
  },
  {
    id: 'ch7-arrival-3',
    type: 'dialogue',
    background: 'SOC War Room',
    locationName: 'SOC War Room, New York',
    leftCharacter: JANET_PARK,
    rightCharacter: DIRECTOR_REEVES,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'Not yet. That\'s why you\'re here. We\'ve identified three options: isolate the compromised European network segment, do a full shutdown of all international links, or implement surgical blocks on the specific attack vectors. Each has different business impact. The clock is ticking -- the attacker is still active.',
  },
  {
    id: 'ch7-investigate-1',
    type: 'choice',
    background: 'SOC War Room',
    locationName: 'SOC War Room, New York',
    leftCharacter: JANET_PARK,
    rightCharacter: DIRECTOR_REEVES,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      'We need to decide on containment NOW. The attacker is actively exfiltrating data through the network path we identified. What should our FIRST priority be?',
    choices: [
      {
        text: 'Contain the breach by isolating compromised network segments while preserving forensic evidence.',
        xpBonus: 25,
        response:
          'Exactly right. Containment is the first priority during active exfiltration. Isolate affected segments to stop the bleeding, but do it carefully to preserve evidence for forensics and potential legal proceedings.',
      },
      {
        text: 'Eradicate the threat by wiping and reimaging all affected systems immediately.',
        xpBonus: 10,
        response:
          'Eradication comes AFTER containment. If you wipe systems before containing the breach, the attacker may still have access through other paths, and you lose forensic evidence. Contain first, then eradicate.',
      },
      {
        text: 'Notify law enforcement and wait for their guidance before taking action.',
        xpBonus: 5,
        response:
          'While law enforcement notification is important, waiting during active exfiltration is dangerous. Contain the breach first to stop data loss, then notify. You can preserve evidence while containing.',
      },
    ],
  },
  {
    id: 'ch7-investigate-2',
    type: 'dialogue',
    background: 'SOC War Room',
    locationName: 'SOC War Room, New York',
    leftCharacter: DIRECTOR_REEVES,
    rightCharacter: AGENT_MORALES,
    speaker: 'Director Reeves',
    speakerSide: 'left',
    dialogue:
      'Good call on the containment strategy. The European segment is isolated, and the bleeding has stopped. Kai\'s forensic analysis points to the initial entry: a custom exploit targeting a vulnerability in our proprietary application -- built by our Austin development team. {player}, we need you in Austin to find the root cause.',
  },
];

const chapter7Briefing = `## Security Operations

Security operations is where policy meets practice. This domain covers the daily activities of protecting organizational assets, responding to incidents, and maintaining business continuity.

### Incident Response Process

The NIST incident response lifecycle has four phases:

1. **Preparation** -- Develop IR plans, train teams, acquire tools, establish communication channels.
2. **Detection and Analysis** -- Identify incidents through monitoring, alerts, and user reports. Analyze scope and impact.
3. **Containment, Eradication, and Recovery** -- Stop the attack (contain), remove the cause (eradicate), restore systems (recover).
4. **Post-Incident Activity** -- Lessons learned, documentation, process improvement.

**Memory Hack -- "PDCER":** Preparation, Detection, Containment, Eradication, Recovery. Think of fighting a fire: *Prepare* (buy extinguishers), *Detect* (smell smoke), *Contain* (close doors), *Eradicate* (put out flames), *Recover* (rebuild).

### Containment Strategies

Containment must balance stopping the attack with preserving evidence:

- **Short-term containment:** Immediate actions like isolating network segments or disabling accounts.
- **Long-term containment:** Temporary fixes that allow business operations while preparing for eradication (e.g., patching, rerouting traffic).

Never eradicate before containing -- you might push the attacker to destroy evidence or open new attack vectors.

### Disaster Recovery and Business Continuity

**Recovery metrics** define acceptable downtime:
- **RTO (Recovery Time Objective):** Maximum acceptable downtime. *How long* can you be down?
- **RPO (Recovery Point Objective):** Maximum acceptable data loss. *How much data* can you afford to lose?
- **MTBF (Mean Time Between Failures):** Average time a system runs before failing.
- **MTTR (Mean Time to Repair):** Average time to restore a failed system.

**Memory Hack -- "RTO = Time, RPO = Point (in time for data)":** RTO asks "when must we be back up?" RPO asks "how far back can we roll the data?" If RPO is 4 hours, you need backups at least every 4 hours.

### Change Management

All changes to production systems must follow a change management process: request, review, approve, test, implement, document. Emergency changes still require retroactive documentation and approval.

### Logging, Monitoring, and Forensics

Effective operations require:
- **Centralized logging** (SIEM) for correlation and alerting
- **Continuous monitoring** of networks, systems, and applications
- **Forensic readiness** -- maintaining chain of custody, write-blocking evidence drives, creating forensic images before analysis

**Memory Hack -- "Think Like a Manager":** IR questions almost always follow the lifecycle order. If a question asks "what should you do FIRST," the answer is usually the earliest phase you haven't completed yet. Containment before eradication, eradication before recovery.`;

const chapter7Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'During an active security incident, an attacker is exfiltrating data. What is the FIRST phase of incident response that should be executed?',
    options: [
      'Eradication -- remove the attacker from the network.',
      'Recovery -- restore systems from clean backups.',
      'Containment -- isolate affected systems to stop data loss.',
      'Post-incident review -- document what happened.',
    ],
    correct_index: 2,
    explanation:
      'Containment is the first priority during an active incident. You must stop the bleeding before you can clean up (eradicate) or rebuild (recover). Eradication without containment risks the attacker opening new paths.',
  },
  {
    question:
      'An organization requires that no more than 2 hours of data can be lost in a disaster. Which metric defines this requirement?',
    options: [
      'Recovery Time Objective (RTO)',
      'Recovery Point Objective (RPO)',
      'Mean Time Between Failures (MTBF)',
      'Maximum Tolerable Downtime (MTD)',
    ],
    correct_index: 1,
    explanation:
      'RPO (Recovery Point Objective) defines the maximum acceptable data loss measured in time. An RPO of 2 hours means backups must occur at least every 2 hours. RTO defines maximum acceptable downtime, which is different from data loss.',
  },
  {
    question:
      'A forensic investigator needs to examine a hard drive from a compromised server. What should be done FIRST?',
    options: [
      'Boot the server and check the logs.',
      'Create a forensic bit-for-bit image of the drive.',
      'Run antivirus software on the drive.',
      'Format the drive and restore from backup.',
    ],
    correct_index: 1,
    explanation:
      'The first step is to create a forensic image (bit-for-bit copy) of the drive using a write-blocker. This preserves the original evidence and maintains chain of custody. Never boot or modify the original drive.',
  },
];

// ─── Chapter 8: Software Development Security ───────────────────────────────

const chapter8Scenes: StoryScene[] = [
  {
    id: 'ch8-arrival-1',
    type: 'dialogue',
    background: 'Dev Lab',
    locationName: 'Dev Lab, Austin',
    leftCharacter: JANET_PARK,
    rightCharacter: undefined,
    speaker: 'Janet Park',
    speakerSide: 'left',
    dialogue:
      '{player}, this is where it all started. Nexus\'s Austin development lab built the proprietary application that the attacker exploited. Kai\'s forensic analysis confirmed the initial entry point was an injection vulnerability in the customer portal -- code that went to production without a proper security review.',
  },
  {
    id: 'ch8-arrival-2',
    type: 'dialogue',
    background: 'Dev Lab',
    locationName: 'Dev Lab, Austin',
    leftCharacter: undefined,
    rightCharacter: KAI_TANAKA,
    speaker: '{player}',
    speakerSide: 'left',
    dialogue:
      'An injection vulnerability that made it to production? That means the SDLC didn\'t include security testing at the right stages. Was there any static analysis? Dynamic testing? Code review?',
  },
  {
    id: 'ch8-arrival-3',
    type: 'dialogue',
    background: 'Dev Lab',
    locationName: 'Dev Lab, Austin',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I reviewed their development pipeline. No SAST, no DAST, no security-focused code reviews. They ran unit tests and functional tests only. The injection flaw is textbook OWASP A03 -- unsanitized user input passed directly to a SQL query. A parameterized query would have prevented this entire global incident.',
  },
  {
    id: 'ch8-investigate-1',
    type: 'choice',
    background: 'Dev Lab',
    locationName: 'Dev Lab, Austin',
    leftCharacter: KAI_TANAKA,
    rightCharacter: JANET_PARK,
    speaker: 'Kai Tanaka',
    speakerSide: 'left',
    dialogue:
      'I found the vulnerable code. The developer concatenated user input directly into SQL queries. What is the MOST effective defense against SQL injection?',
    choices: [
      {
        text: 'Use parameterized queries (prepared statements) to separate code from data.',
        xpBonus: 25,
        response:
          'Exactly! Parameterized queries treat user input as data, never as executable code. This is the gold standard defense against SQL injection. Input validation is a secondary defense, not a replacement.',
      },
      {
        text: 'Add input validation to filter out dangerous characters.',
        xpBonus: 15,
        response:
          'Input validation helps but can be bypassed with encoding tricks. Parameterized queries (prepared statements) are the primary defense because they fundamentally separate code from data.',
      },
      {
        text: 'Deploy a Web Application Firewall to block malicious requests.',
        xpBonus: 10,
        response:
          'A WAF adds a defense layer but can be bypassed. The root fix is parameterized queries in the code itself. Never rely on external controls to fix application-level vulnerabilities.',
      },
    ],
  },
  {
    id: 'ch8-investigate-2',
    type: 'dialogue',
    background: 'Dev Lab',
    locationName: 'Dev Lab, Austin',
    leftCharacter: DIRECTOR_REEVES,
    rightCharacter: JANET_PARK,
    speaker: 'Director Reeves',
    speakerSide: 'left',
    dialogue:
      '{player}, you\'ve traced Operation Shadow Protocol from a breach alert in New York, through data classification failures, architectural flaws, network attacks, stolen credentials, and forensic evidence -- all the way back to a single line of insecure code. You\'ve demonstrated mastery across all eight CISSP domains. This organization -- and the security community -- owes you a debt. Welcome to the next level.',
  },
];

const chapter8Briefing = `## Software Development Security

Software vulnerabilities are the root cause of most breaches. This domain covers how to build security into the development lifecycle rather than bolting it on afterward.

### Secure SDLC

Security must be integrated into every phase of software development:

- **Requirements:** Define security requirements alongside functional ones. Threat modeling starts here.
- **Design:** Apply secure design principles (least privilege, defense in depth, fail-secure).
- **Implementation:** Follow secure coding standards. Use parameterized queries, encode output, validate input.
- **Testing:** Run SAST (Static Application Security Testing) on source code and DAST (Dynamic Application Security Testing) on running applications.
- **Deployment:** Harden configurations, remove debug code, use secure defaults.
- **Maintenance:** Patch vulnerabilities, monitor for new threats, conduct periodic reviews.

**Memory Hack -- "Security at Every Stage":** Think of the SDLC as building a house. You don't add the security system after moving in -- you design it into the blueprints (requirements), wire it during construction (implementation), test it before occupancy (testing), and maintain it while living there (maintenance).

### OWASP Top 10

The OWASP Top 10 lists the most critical web application security risks:

1. **A01: Broken Access Control** -- Users acting outside their permissions.
2. **A02: Cryptographic Failures** -- Weak or missing encryption of sensitive data.
3. **A03: Injection** -- SQL, NoSQL, OS command, LDAP injection via unsanitized input.
4. **A04: Insecure Design** -- Missing security controls at the architecture level.
5. **A05: Security Misconfiguration** -- Default credentials, unnecessary features enabled.
6. **A06: Vulnerable Components** -- Using libraries with known vulnerabilities.
7. **A07: Authentication Failures** -- Weak authentication, credential stuffing.
8. **A08: Data Integrity Failures** -- Insecure deserialization, unverified updates.
9. **A09: Logging Failures** -- Insufficient logging, monitoring, and alerting.
10. **A10: SSRF** -- Server-Side Request Forgery, making the server request internal resources.

**Memory Hack -- "BCIAS-SVADL":** For the top 5, remember *"Broken Crypto Injects Insecure Stuff"* -- Broken Access Control, Cryptographic Failures, Injection, Insecure Design, Security Misconfiguration.

### Secure Coding Practices

Key practices to prevent common vulnerabilities:
- **Input validation:** Whitelist acceptable input. Validate on the server side.
- **Output encoding:** Encode output to prevent XSS (Cross-Site Scripting).
- **Parameterized queries:** Prevent SQL injection by separating code from data.
- **Error handling:** Fail securely. Never expose stack traces or internal details to users.
- **Session management:** Use secure, random session tokens. Implement timeouts and invalidation.

### Application Security Testing

Two primary approaches:
- **SAST (Static):** Analyzes source code without executing it. Finds vulnerabilities early in development. Think of it as *proofreading* the code.
- **DAST (Dynamic):** Tests the running application by sending crafted requests. Finds runtime vulnerabilities. Think of it as *stress-testing* the building.
- **IAST (Interactive):** Combines SAST and DAST by instrumenting the application during testing.

**Memory Hack -- "SAST = Source, DAST = Deployed":** SAST looks at the *source* code (static). DAST tests the *deployed* application (dynamic). Use both for comprehensive coverage.

### DevSecOps

DevSecOps integrates security into the CI/CD pipeline: automated SAST in code commits, dependency scanning in builds, DAST in staging, and security gates before production deployment. "Shift left" means moving security earlier in the development process.

**Memory Hack -- "Think Like a Manager":** The cheapest time to fix a vulnerability is during design. The most expensive is after deployment. The exam rewards answers that prioritize prevention (secure coding) over detection (WAFs, IDS). Fix the code, don't just add more guards.`;

const chapter8Questions: KnowledgeCheckQuestion[] = [
  {
    question:
      'What is the MOST effective defense against SQL injection attacks?',
    options: [
      'Web Application Firewall (WAF)',
      'Input validation with character blacklisting',
      'Parameterized queries (prepared statements)',
      'Stored procedures without parameterization',
    ],
    correct_index: 2,
    explanation:
      'Parameterized queries (prepared statements) are the most effective defense because they fundamentally separate SQL code from user-supplied data. The database treats input as data, never as executable code. WAFs and input validation are supplementary, not primary defenses.',
  },
  {
    question:
      'A development team wants to find security vulnerabilities in their source code before the application is compiled. Which testing method should they use?',
    options: [
      'Dynamic Application Security Testing (DAST)',
      'Static Application Security Testing (SAST)',
      'Penetration Testing',
      'Fuzzing',
    ],
    correct_index: 1,
    explanation:
      'SAST (Static Application Security Testing) analyzes source code without executing it, making it ideal for finding vulnerabilities before compilation. DAST requires a running application. SAST finds issues earlier in the SDLC when they are cheapest to fix.',
  },
  {
    question:
      'According to the "shift left" approach in DevSecOps, what does shifting security left mean?',
    options: [
      'Moving security controls to the network perimeter.',
      'Integrating security testing earlier in the software development lifecycle.',
      'Shifting security responsibility from developers to the security team.',
      'Adding more security testing after deployment.',
    ],
    correct_index: 1,
    explanation:
      '"Shift left" means integrating security earlier in the SDLC -- during requirements, design, and coding phases rather than waiting until testing or deployment. Earlier detection means cheaper fixes and fewer production vulnerabilities.',
  },
];

// ─── Export: STORY_CHAPTERS ─────────────────────────────────────────────────

export const STORY_CHAPTERS: ChapterData[] = [
  {
    id: 1,
    domainId: 1,
    title: 'The Breach',
    location: 'Nexus HQ, New York',
    locationEmoji: '\u{1F5FD}',
    description:
      'A breach is discovered at Nexus Corp headquarters. Begin your risk assessment training and learn the foundations of security governance.',
    scenes: chapter1Scenes,
    briefingContent: chapter1Briefing,
    knowledgeCheckQuestions: chapter1Questions,
    quizQuestionCount: 8,
  },
  {
    id: 2,
    domainId: 2,
    title: 'The Data Vault',
    location: 'Data Vault, New Jersey',
    locationEmoji: '\u{1F3ED}',
    description:
      'Investigate the data center where misclassified assets led to catastrophic exposure. Master data classification and ownership.',
    scenes: chapter2Scenes,
    briefingContent: chapter2Briefing,
    knowledgeCheckQuestions: chapter2Questions,
    quizQuestionCount: 7,
  },
  {
    id: 3,
    domainId: 3,
    title: 'The Architecture Flaw',
    location: 'Server Farm, Zurich',
    locationEmoji: '\u{1F3D4}\uFE0F',
    description:
      'The international investigation leads to Zurich where a covert channel exploited an architectural weakness. Study security models and cryptography.',
    scenes: chapter3Scenes,
    briefingContent: chapter3Briefing,
    knowledgeCheckQuestions: chapter3Questions,
    quizQuestionCount: 8,
  },
  {
    id: 4,
    domainId: 4,
    title: 'The Network Trail',
    location: 'Cable Station, Singapore',
    locationEmoji: '\u{1F30F}',
    description:
      'Follow the network attack path to an undersea cable station. Learn the OSI model, network attacks, and defense strategies.',
    scenes: chapter4Scenes,
    briefingContent: chapter4Briefing,
    knowledgeCheckQuestions: chapter4Questions,
    quizQuestionCount: 8,
  },
  {
    id: 5,
    domainId: 5,
    title: 'The Identity Crisis',
    location: 'Office, London',
    locationEmoji: '\u{1F1EC}\u{1F1E7}',
    description:
      'An insider threat traced to compromised credentials. Master authentication factors, access control models, and privilege management.',
    scenes: chapter5Scenes,
    briefingContent: chapter5Briefing,
    knowledgeCheckQuestions: chapter5Questions,
    quizQuestionCount: 8,
  },
  {
    id: 6,
    domainId: 6,
    title: 'The Evidence',
    location: 'Forensics Lab, Tel Aviv',
    locationEmoji: '\u{1F52C}',
    description:
      'Analyze all collected evidence with world-class forensic tools. Learn vulnerability assessment, penetration testing, and security auditing.',
    scenes: chapter6Scenes,
    briefingContent: chapter6Briefing,
    knowledgeCheckQuestions: chapter6Questions,
    quizQuestionCount: 7,
  },
  {
    id: 7,
    domainId: 7,
    title: 'The War Room',
    location: 'SOC War Room, New York',
    locationEmoji: '\u{1F5A5}\uFE0F',
    description:
      'Return to headquarters to lead the incident response. Master the IR lifecycle, disaster recovery, and security operations.',
    scenes: chapter7Scenes,
    briefingContent: chapter7Briefing,
    knowledgeCheckQuestions: chapter7Questions,
    quizQuestionCount: 8,
  },
  {
    id: 8,
    domainId: 8,
    title: 'The Root Cause',
    location: 'Dev Lab, Austin',
    locationEmoji: '\u{1F920}',
    description:
      'Trace the breach to its origin -- a software vulnerability that should never have reached production. Master secure development and the OWASP Top 10.',
    scenes: chapter8Scenes,
    briefingContent: chapter8Briefing,
    knowledgeCheckQuestions: chapter8Questions,
    quizQuestionCount: 8,
  },
];
