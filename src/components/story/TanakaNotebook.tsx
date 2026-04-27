'use client';

import { useState } from 'react';
import { motion, AnimatePresence, useReducedMotion } from 'framer-motion';
import { Lock } from 'lucide-react';
import { useUserStore } from '@/stores/useUserStore';
import { substituteTokens, type PlayerProfileTokens } from '@/lib/player-tokens';

// ─── Types ─────────────────────────────────────────────────

interface MemoryHack {
  label: string;
  trick: string;
}

interface ExamObjective {
  objective: string;
  tanakaTip: string;
}

interface NotebookEntry {
  domain: number;
  title: string;
  location: string;
  date: string;
  tanakaVoice: string;
  memoryHacks: MemoryHack[];
  examObjectives: ExamObjective[];
  trapWarning: string;
  keyFormulas?: string[];
}

export interface TanakaNotebookProps {
  unlockedDomains?: number[];
}

// ─── Content ───────────────────────────────────────────────

export const NOTEBOOK_ENTRIES: NotebookEntry[] = [
  {
    domain: 1,
    title: 'Act 1 — Security & Risk Management',
    location: 'Toronto, Sentinel Dynamics HQ',
    date: 'Day 1 of the Meridian Investigation',
    tanakaVoice: `{playerName}, the first thing you must understand about Meridian's failure is that it was not a technology failure — it was a governance failure. Nobody owned the risk. Nobody had signed off on an acceptable level of exposure. When there is no risk register, there is no accountability, and when there is no accountability, attackers can move undetected for months. I have seen this pattern at three Fortune 500 companies before Meridian.

The CISSP exam will test whether you understand this fundamental truth: security is a business function, not an IT function. The CISO reports to the board. Risk appetite is set by executives, not engineers. When Meridian's board approved the Taipei acquisition without a due diligence security assessment, they were making a risk decision — they just did not know they were making it.

Think of risk management like insurance. You do not buy flood insurance after the flood. You assess your exposure, calculate probability and impact, and decide: accept it, mitigate it, transfer it, or avoid it entirely. Meridian chose none of the above — they simply never looked. That is what the exam calls 'ignoring risk,' and it is never the right answer.`,
    memoryHacks: [
      {
        label: 'RMAT — The Four Risk Responses',
        trick: 'Remember: Reduce, Mitigate, Accept, Transfer. "Really Mature Adults Think" about risk before acting. Reduce = lower probability. Mitigate = lower impact. Accept = document it. Transfer = insurance/outsourcing.',
      },
      {
        label: 'CIA Triad — The Security Trinity',
        trick: 'Confidentiality (no peeping), Integrity (no tampering), Availability (no downtime). Think of a bank vault: locked door = Confidentiality, tamper-proof seal = Integrity, open 9-5 = Availability.',
      },
      {
        label: 'ALE Formula — The Business Language',
        trick: 'ALE = ARO × SLE. Annual Loss Expectancy = How often it happens × How much it costs each time. If your server floods once every 10 years (ARO=0.1) and costs $500,000 to recover (SLE), your ALE = $50,000/year.',
      },
    ],
    examObjectives: [
      {
        objective: 'Understand and apply concepts of confidentiality, integrity, and availability',
        tanakaTip: 'When the exam asks "which control protects confidentiality," think access controls and encryption. Integrity = checksums and digital signatures. Availability = redundancy and backups. Never confuse them.',
      },
      {
        objective: 'Apply risk management concepts (SLE, ARO, ALE, safeguard selection)',
        tanakaTip: 'The exam loves ALE math. Memorise: ALE = ARO × SLE. A safeguard is worth implementing if its annual cost (ACS) is less than the ALE it reduces. Straightforward economics.',
      },
      {
        objective: 'Understand legal and regulatory issues in information security (GDPR, HIPAA, PCI-DSS)',
        tanakaTip: 'ISC² tests concepts, not memorised law. Know that GDPR = EU data subjects, HIPAA = US healthcare PHI, PCI-DSS = cardholder data. Breach notification timelines matter: GDPR = 72 hours.',
      },
    ],
    trapWarning: `ISC² loves to test the DIFFERENCE between threats, vulnerabilities, and risks. A threat is what could harm you (e.g., a hurricane). A vulnerability is your exposure (e.g., no flood insurance). Risk = Threat × Vulnerability × Asset Value. Many candidates confuse "risk avoidance" (stop the activity entirely) with "risk mitigation" (reduce the impact). If the question says a company "stopped offering online banking due to fraud risk," that is AVOIDANCE, not mitigation.`,
    keyFormulas: [
      'ALE = ARO × SLE (Annual Loss Expectancy)',
      'ALE before – ALE after – Annual Cost of Safeguard = Value of Safeguard',
      'Risk = Threat × Vulnerability × Asset Value',
      'Level = floor(1 + sqrt(XP / 100))',
    ],
  },
  {
    domain: 2,
    title: 'Act 2 — Asset Security',
    location: 'London, Meridian European Operations Centre',
    date: 'Day 4 — The Data Classification Brief',
    tanakaVoice: `Marcus Webb pulled up the London data inventory and we found the core problem immediately. Meridian had seventeen petabytes of data and no one could tell me which of it was sensitive. Not classified, not labeled — just sitting on shared drives, accessible to anyone with a London office badge. When you cannot tell your crown jewels from your coffee receipts, you cannot protect anything.

Asset security is deceptively simple in concept: know what you have, know who owns it, and classify it by sensitivity. In practice, it is one of the hardest disciplines to sustain. Data proliferates. People share files. Classification labels get stripped when documents are converted or printed. The discipline breaks down unless it is enforced by both policy and technology.

The exam tests whether you understand the data owner versus data custodian distinction. The owner (usually a business executive) decides the classification and acceptable use. The custodian (usually IT) implements the controls the owner requires. If a data breach happens and you are a custodian, you cannot say "I was just following orders." But the accountability sits with the owner. Think of it like a safe deposit box: the bank (custodian) holds the key but the box contents belong to you (owner).`,
    memoryHacks: [
      {
        label: 'DOCK — Data Ownership Chain',
        trick: 'Data Owner → Data Custodian → Data Keeper (end user). Owner = decides classification. Custodian = IT, implements controls. Keeper = uses data within policy. "Decisions Own Custody" — the Owner decides, Custody implements.',
      },
      {
        label: 'Government vs Commercial Classification',
        trick: 'Government: Top Secret → Secret → Confidential → Unclassified. Commercial: Confidential → Private → Sensitive → Public. Remember: Government goes DOWN (Top to Unclassified). Commercial goes DOWN (Confidential to Public).',
      },
      {
        label: 'Data Remanence — Sanitisation Methods',
        trick: 'Clear, Purge, Destroy — escalating certainty. Clear = overwrite (for reuse). Purge = degauss or secure erase (higher assurance). Destroy = shred or incinerate (no reuse). "Criminals Pay Dearly" for mishandling classified data.',
      },
    ],
    examObjectives: [
      {
        objective: 'Identify and classify information and assets',
        tanakaTip: 'Classification must be based on VALUE and SENSITIVITY to the organisation, not just to the individual. The exam tests whether you know that classification is a BUSINESS decision, not an IT decision.',
      },
      {
        objective: 'Determine and maintain information and asset ownership',
        tanakaTip: 'Data Owner = accountable (executive). Data Custodian = responsible (IT). This is a classic exam trap. If asked "who is responsible for implementing backup controls," the answer is the CUSTODIAN. If asked "who decides what data needs backup," it is the OWNER.',
      },
      {
        objective: 'Understand data security controls and compliance requirements',
        tanakaTip: 'Know the difference between data at rest (encryption), data in transit (TLS/VPN), and data in use (access controls, screen locks). The exam often frames questions as incident scenarios — trace back to which state the data was in.',
      },
    ],
    trapWarning: `ISC² loves scenarios where someone "properly disposed" of media but used the WRONG method for the classification level. Clearing (overwriting) is acceptable for lower-sensitivity drives being re-used within the same organisation. Purging is required before reuse outside the organisation. Destruction is required for top-secret or highly sensitive data that must never be recovered. Candidates often choose "Clear" when "Destroy" is the only correct answer for classified government media.`,
  },
  {
    domain: 3,
    title: 'Act 3 — Security Architecture & Engineering',
    location: 'Munich, Meridian Engineering Hub',
    date: 'Day 9 — The Architecture Review',
    tanakaVoice: `Elena Vasquez had a theory that the Munich systems were vulnerable because of how they were designed, not because of how they were operated. She was right. The engineering team had built a beautiful system — fast, scalable, elegant — and had made fifteen security assumptions that turned out to be completely wrong. They assumed the network perimeter would hold. They assumed all internal users could be trusted. They assumed the application layer would validate all input.

Security architecture is about designing systems so that when those assumptions fail — and they will fail — the system still degrades gracefully rather than catastrophically. Defence in depth is not just a buzzword. It is an engineering discipline. If your firewall fails, your IDS should catch the intrusion. If the IDS misses it, your SIEM should alert. If the SIEM is overwhelmed, your endpoint protection should quarantine. Layers are what give you time to respond.

The exam will test your knowledge of security models — Bell-LaPadula, Biba, Clark-Wilson, Brewer-Nash. Do not try to memorise them as abstract rules. Understand what problem each one was designed to solve. Bell-LaPadula solved military data confidentiality. Biba solved data integrity. Clark-Wilson solved commercial transaction integrity. When you know the problem, the model's rules become obvious.`,
    memoryHacks: [
      {
        label: 'Bell-LaPadula vs Biba — The Security Model Pair',
        trick: 'Bell-LaPadula = Confidentiality = "No Read Up, No Write Down" (think: you cannot READ higher classified docs, cannot WRITE to lower classified to prevent leakage). Biba = Integrity = OPPOSITE: "No Read Down, No Write Up" (cannot read low-integrity data, cannot write to high-integrity subjects).',
      },
      {
        label: 'Trust But Verify — Security Design Principles',
        trick: 'FLAMES: Fail-Safe defaults, Least privilege, Accountability, Minimise attack surface, Economy of mechanism (keep it simple), Separation of duties. A "FLAMES" approach protects against the fire of a breach.',
      },
      {
        label: 'Trusted Computing Base — The Gold Standard',
        trick: 'TCB = the totality of hardware, firmware, and software that enforces security policy. The smaller the TCB, the easier to verify and trust. Think of it as the "inner vault" — everything outside can be compromised; this must hold.',
      },
    ],
    examObjectives: [
      {
        objective: 'Apply security design principles (least privilege, fail-safe defaults, separation of duties)',
        tanakaTip: 'The exam tests these principles in scenario form. "A contractor needs temporary access to complete a project" — least privilege means giving EXACTLY what they need, for EXACTLY as long as they need it, no more.',
      },
      {
        objective: 'Understand cryptography concepts (symmetric, asymmetric, hashing, PKI)',
        tanakaTip: 'Symmetric = fast, shared key (AES, 3DES). Asymmetric = slow, key pairs (RSA, ECC) — used for key exchange and digital signatures. Hash = one-way fingerprint (SHA-256, MD5 is broken). PKI binds public keys to identities via certificates.',
      },
      {
        objective: 'Evaluate and apply security models (Bell-LaPadula, Biba, Clark-Wilson)',
        tanakaTip: 'If the question involves confidentiality and military/government data = Bell-LaPadula. If it involves integrity and commercial transactions = Clark-Wilson or Biba. Brewer-Nash (Chinese Wall) = conflict of interest prevention in consulting firms.',
      },
    ],
    trapWarning: `ISC² frequently tests the difference between security models in scenarios. The most common trap: a question describes a CONFIDENTIALITY requirement and lists Biba as an answer choice. Biba is an INTEGRITY model. Bell-LaPadula is the CONFIDENTIALITY model. Read the scenario carefully — "prevent unauthorised disclosure" = BLP. "Prevent unauthorised modification" = Biba. Also: Clark-Wilson uses SUBJECTS, PROGRAMS, and OBJECTS in a way that may seem more complex than BLP/Biba — know that it enforces integrity through well-formed transactions and separation of duties.`,
    keyFormulas: [
      'Bell-LaPadula: No Read Up (Simple Security), No Write Down (*-property)',
      'Biba: No Read Down, No Write Up (Opposite of BLP)',
      'Kerckhoffs Principle: System security must not depend on algorithm secrecy',
      'Key space = 2^key_length (AES-128 = 2^128 possible keys)',
    ],
  },
  {
    domain: 4,
    title: 'Act 4 — Communication & Network Security',
    location: 'Singapore, Meridian Asia-Pacific Hub',
    date: 'Day 14 — The Network Forensics Debrief',
    tanakaVoice: `Priya Sharma and I spent three days in the Singapore operations centre reviewing packet captures. The attacker had been living in Meridian's network for ninety-four days before anyone noticed. They were patient, methodical, and they knew exactly where Meridian's monitoring gaps were. They moved laterally through the network using legitimate credentials and legitimate protocols — mostly SMB and WMI — and the traffic looked completely normal because there were no network segmentation controls to trigger anomaly detection.

Networks are the arteries of modern organisations. Every byte of data your organisation generates will travel across some network segment at some point. If you do not understand how networks work — how routing decisions are made, how protocols can be abused, how firewalls can be bypassed — you cannot defend them. The exam does not require you to be a network engineer, but you must understand the principles deeply enough to make security decisions.

The OSI model is not just an academic exercise. When an attacker sends a malformed packet that crashes a router, that is a Layer 3 attack. When ransomware encrypts files over a network share, that is a Layer 7 attack. Understanding the layer helps you understand the countermeasure. Layer 7 attacks need Layer 7 inspection (application-aware firewalls, WAFs). Layer 3 attacks need Layer 3 controls (ACLs, routing policies).`,
    memoryHacks: [
      {
        label: 'OSI Model — All People Seem To Need Data Processing',
        trick: 'Layer 7=Application, 6=Presentation, 5=Session, 4=Transport, 3=Network, 2=Data Link, 1=Physical. Mnemonic from top: "All People Seem To Need Data Processing." From bottom: "Please Do Not Throw Sausage Pizza Away."',
      },
      {
        label: 'Firewall Types — The Progressive Defence',
        trick: 'Packet Filtering (Layer 3-4, stateless, fast but dumb) → Stateful Inspection (tracks connections) → Application Layer (Layer 7, understands protocols) → Next-Gen (combines all + IPS + threat intel). Evolution from simple to sophisticated.',
      },
      {
        label: 'VPN Protocols — Tunnels Through the Wild',
        trick: 'IPSec = network layer (transparent to apps, full tunnel). SSL/TLS VPN = application layer (works through NAT, browser-friendly). L2TP/IPSec = combines tunnelling with encryption. "Is Security Layered?" — ISL for ordering.',
      },
    ],
    examObjectives: [
      {
        objective: 'Implement secure communication channels according to design',
        tanakaTip: 'The exam tests which protocol to use for which scenario. Remote access = SSL VPN or IPSec. Site-to-site = IPSec tunnel mode. Secure email = S/MIME or PGP. Secure web = TLS 1.2+. Know that SSL 3.0 and TLS 1.0/1.1 are DEPRECATED.',
      },
      {
        objective: 'Implement secure network architecture (segmentation, DMZ, air gaps)',
        tanakaTip: 'DMZ = network segment between two firewalls containing public-facing servers. Screened subnet = same thing. Air gap = physical network isolation (no network connection at all). The exam may use "bastion host" = a hardened server in the DMZ.',
      },
      {
        objective: 'Understand network attacks and countermeasures (DoS, MITM, session hijacking)',
        tanakaTip: 'DoS vs DDoS: single source vs multiple. SYN flood = DoS at TCP handshake level. MITM countermeasure = certificate pinning, HTTPS, mutual authentication. Session hijacking countermeasure = HTTPOnly/Secure cookie flags, session timeouts.',
      },
    ],
    trapWarning: `ISC² loves to test the DIFFERENCE between network address translation (NAT) and security. Many candidates assume NAT provides security because it hides internal IP addresses. ISC² will tell you NAT is NOT a security control — it is an addressing solution. The exam also frequently tests VLAN hopping attacks (switch spoofing, double tagging) as a reason why VLANs alone are not sufficient network segmentation for sensitive systems.`,
  },
  {
    domain: 5,
    title: 'Act 5 — Identity & Access Management',
    location: 'New York, Meridian Americas Division',
    date: 'Day 19 — The Insider Threat Discovery',
    tanakaVoice: `This is where Ghost Holloway entered our investigation, {playerName}. When Marcus Webb pulled the access logs for the New York division, we found something deeply troubling: a contractor account that had been terminated six months earlier was still actively authenticating to Meridian's production systems. Not because of a sophisticated bypass — because nobody had deprovisioned the account. Identity and access management failure at its most basic.

IAM is the guardian of every resource in your organisation. When it fails, it does not fail loudly. There is no explosion, no alarm, no obvious breach indicator. An orphaned account, a misconfigured role, an overprivileged service account — these are silent vulnerabilities that can persist for years. Ghost exploited exactly this silence.

The principle of least privilege is the single most powerful concept in access control. Not "minimum necessary access right now" but "minimum necessary access for the minimum necessary duration." Access should be provisioned like medication: exact dose, specific duration, with a clear process for renewal or revocation. The moment access outlives its purpose, it becomes a liability.`,
    memoryHacks: [
      {
        label: 'AAA Framework — The Access Trifecta',
        trick: 'Authentication (who are you?), Authorisation (what can you do?), Accounting (what did you do?). "AAA batteries power your security." Always in that order — you must authenticate before you can be authorised, and accounting logs both.',
      },
      {
        label: 'Access Control Models — DMRB',
        trick: 'Discretionary (owner controls, Windows ACLs), Mandatory (system-enforced labels, military), Role-Based (job function = access, most common enterprise), Attribute-Based (context-aware, most flexible). "Definitely More Role-Based" is the enterprise trend.',
      },
      {
        label: 'MFA Factors — SIH',
        trick: 'Something you Know (password, PIN), Something you Have (token, smart card, phone), Something you Are (fingerprint, retina, voice). SIH = "Security Is Hard" without all three. Two-factor = any two. MFA = two or more.',
      },
    ],
    examObjectives: [
      {
        objective: 'Control physical and logical access to assets',
        tanakaTip: 'Physical access controls are ALSO IAM. Mantrap, turnstile, security guard — these are access controls. Logical access = passwords, tokens, certificates. The exam often asks about the "something you are" factor failing (biometric) — know that False Acceptance Rate (FAR) and False Rejection Rate (FRR) have an inverse relationship.',
      },
      {
        objective: 'Manage identification and authentication of people, devices, and services',
        tanakaTip: 'Federated identity (SAML, OAuth, OpenID Connect) means one identity spans multiple systems. SSO = authenticate once, access many. Know that SAML is XML-based and used for enterprise SSO, while OAuth is for API authorisation and OpenID Connect adds authentication on top of OAuth.',
      },
      {
        objective: 'Implement and manage authorisation mechanisms',
        tanakaTip: 'The exam loves to test provisioning and deprovisioning. "Joiner-Mover-Leaver" process: new employee (Joiner) gets appropriate access, changes role (Mover) requires access review and modification, leaves company (Leaver) requires immediate deprovisioning. Ghost Holloway is a Leaver failure scenario.',
      },
    ],
    trapWarning: `ISC² frequently tests the concept of "need to know" versus "least privilege." These are related but NOT the same. Least privilege = minimum permissions to perform the job. Need to know = access only to information required for a specific task, even if you technically have the clearance level. A Top Secret-cleared officer does NOT have access to all Top Secret information — only what they have a specific need to know. Mixing these up is a classic exam fail.`,
  },
  {
    domain: 6,
    title: 'Act 6 — Security Assessment & Testing',
    location: 'Remote Operations Lab — Sentinel Dynamics',
    date: 'Day 24 — The Vulnerability Assessment',
    tanakaVoice: `When Sentinel Dynamics conducted the post-breach forensic review, one finding kept appearing in every domain, every system, every location: the vulnerabilities that enabled the Meridian breach had been documented. Not once, not twice — some of them had been flagged in assessments three years running. The assessments were done. The reports were filed. And then they were put in a drawer and forgotten.

Assessment and testing is worthless without remediation follow-through. I have reviewed hundreds of penetration test reports, and the most common finding is not a technical vulnerability — it is that last year's critical findings are still unpatched. The cycle must close: discover, prioritise, remediate, retest, verify. If any step is missing, the exercise is theatre.

The exam distinguishes between vulnerability assessments (finding weaknesses) and penetration tests (actively exploiting them to prove impact). Both have value. A vulnerability scan tells you where your windows are open. A penetration test shows you what a thief can actually steal. For compliance, many frameworks require both — and importantly, they require evidence that you acted on the findings.`,
    memoryHacks: [
      {
        label: 'Pentest Phases — PEAR',
        trick: 'Planning (define scope and rules), Enumeration/Reconnaissance (gather intel), Attack (exploit with permission), Reporting (document findings and recommendations). "PEAR" — a penetration test is only as good as its reporting fruit.',
      },
      {
        label: 'Black/White/Grey Box Testing',
        trick: 'Black Box = no knowledge (simulates external attacker). White Box = full knowledge (internal review). Grey Box = partial knowledge (simulates insider threat or partially informed attacker). Most real-world pentests are Grey Box for efficiency.',
      },
      {
        label: 'CVSS Score — The Risk Thermometer',
        trick: 'CVSS 0-10: Critical (9.0-10), High (7.0-8.9), Medium (4.0-6.9), Low (0.1-3.9). Base score uses: Attack Vector, Attack Complexity, Privileges Required, User Interaction, Scope, Confidentiality/Integrity/Availability Impact. "CHAPSIA" for the base metrics.',
      },
    ],
    examObjectives: [
      {
        objective: 'Design and validate assessment, test, and audit strategies',
        tanakaTip: 'Know the difference between automated scanning and manual testing. Automated tools (Nessus, Qualys) find known vulnerabilities fast. Manual testing finds logic flaws and business process vulnerabilities that scanners miss. Best practice: both together.',
      },
      {
        objective: 'Conduct security control testing (vulnerability assessment, penetration testing, log reviews)',
        tanakaTip: 'The exam tests the ORDER of operations. Vulnerability assessment ALWAYS comes before penetration testing. You need to know the landscape before you start exploiting. Also: code review (SAST/DAST) is a form of security assessment for software.',
      },
      {
        objective: 'Collect security process data (KPIs, KRIs, metrics)',
        tanakaTip: 'KPI (Key Performance Indicator) = how well controls are performing (e.g., patch compliance %). KRI (Key Risk Indicator) = early warning of increasing risk (e.g., % of critical vulns unpatched >30 days). The exam tests whether you can identify which type a given metric is.',
      },
    ],
    trapWarning: `ISC² loves to test the AUTHORISATION requirement for penetration testing. A pentest without written authorisation is illegal — even if you are testing your own employer's systems as an employee. The authorisation must come from the appropriate level (usually senior management or legal counsel). It must specify SCOPE (what systems), METHODS (allowed techniques), and TIME WINDOW. Testing outside scope even during an authorised engagement can create legal liability. "Get out of jail free card" = written authorisation.`,
  },
  {
    domain: 7,
    title: 'Act 7 — Security Operations',
    location: 'Tokyo, Meridian Asia Intelligence Centre',
    date: 'Day 31 — The Incident Command Post',
    tanakaVoice: `The Tokyo incident room was where the Meridian investigation became real for me. Seeing the SOC analysts cycling through twelve-hour shifts, correlating alerts from forty-seven different systems, trying to build a coherent picture of what happened while simultaneously containing active compromise — I understood why security operations is where theory meets brutal reality.

Security operations is the daily practice of keeping the lights on while threat actors actively try to turn them off. It is detection, response, recovery, and learning — repeated endlessly. The tools matter: SIEM for correlation, SOAR for automation, EDR for endpoint visibility. But the tools are only as good as the procedures and the people who run them. Meridian had a SIEM. It was generating thousands of alerts per day. Nobody had tuned it. Nobody had validated the alert thresholds. The signal was drowning in noise.

The CISSP exam will test your knowledge of incident response phases in particular. Know them cold: Preparation, Detection/Identification, Containment, Eradication, Recovery, Lessons Learned. This is the NIST framework. Some exams use the SANS framework (Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned — nearly identical). The key insight: CONTAINMENT comes before ERADICATION. You cannot fully clean a system that is still actively compromised.`,
    memoryHacks: [
      {
        label: 'PICERL — Incident Response Phases',
        trick: 'Preparation, Identification, Containment, Eradication, Recovery, Lessons Learned. "Pilots Identify Crises, Execute Recovery, Learn." Never skip Containment to jump to Eradication — you will fight the same fire twice.',
      },
      {
        label: 'BCP vs DRP — The Continuity Pair',
        trick: 'BCP (Business Continuity Plan) = keeping the BUSINESS running during a disruption (people, processes, workarounds). DRP (Disaster Recovery Plan) = recovering the TECHNOLOGY after a disaster. BCP is broader. DRP is a subset. "Business Continues, Disaster Recovers."',
      },
      {
        label: 'RTO vs RPO vs MTD — The Three Recovery Targets',
        trick: 'RTO (Recovery Time Objective) = how long you can be DOWN. RPO (Recovery Point Objective) = how much DATA you can lose. MTD (Maximum Tolerable Downtime) = how long before the business dies. MTD ≥ RTO always. "RPO is about DATA, RTO is about TIME, MTD is about SURVIVAL."',
      },
    ],
    examObjectives: [
      {
        objective: 'Understand and support investigations (forensic procedures, chain of custody)',
        tanakaTip: 'Digital forensics order of volatility: CPU registers/cache → RAM → network connections → running processes → disk. Always collect most volatile first. Chain of custody = documented, unbroken record of who handled evidence and when. A broken chain can invalidate evidence in court.',
      },
      {
        objective: 'Conduct incident management (detection, response, recovery)',
        tanakaTip: 'The exam often presents a scenario and asks what to do FIRST. If malware is detected on a live system: CONTAIN (isolate from network) before ERADICATION (clean the system). Do not shut down immediately — you will lose volatile memory evidence. Do not clean before containing — the infection may spread.',
      },
      {
        objective: 'Implement and support patch and vulnerability management',
        tanakaTip: 'Patch management sequence: Inventory → Assess (identify applicable patches) → Test (in non-production) → Deploy → Verify. Emergency patches for critical zero-days may skip non-production testing — the exam may ask when this exception is appropriate.',
      },
    ],
    trapWarning: `ISC² loves to test BCP/DRP order of operations. "What is the FIRST step in developing a BCP?" The answer is almost always Business Impact Analysis (BIA), not writing the plan itself. BIA identifies critical business functions, maximum tolerable downtime, and recovery priorities. Without BIA, you cannot set meaningful RTOs and RPOs. Many candidates jump to "develop the recovery procedures" as the first step — wrong. Analyse first, plan second.`,
    keyFormulas: [
      'MTD ≥ RTO (Maximum Tolerable Downtime must exceed Recovery Time Objective)',
      'RPO = maximum acceptable data loss measured in time',
      'RTO = target time to restore service after disruption',
      'Availability = Uptime / (Uptime + Downtime) × 100%',
    ],
  },
  {
    domain: 8,
    title: 'Act 8 — Software Development Security',
    location: 'San Francisco, Meridian Product Engineering',
    date: 'Day 38 — The Code Review That Changed Everything',
    tanakaVoice: `The final piece of the Meridian puzzle was in the codebase. Not malware inserted by Ghost — something far more ordinary and far more dangerous: a SQL injection vulnerability that had been there since version 1.0, eight years ago. The code had been reviewed. It had passed QA. It had been deployed to production and updated dozens of times, and at no point had any security review caught it. Because nobody had been looking for security issues. They had been looking for functional bugs.

Software development security is the discipline of building security in from the start rather than bolting it on at the end. The SDLC — Software Development Life Cycle — has multiple phases, and security testing belongs in ALL of them. Requirements phase: define security requirements. Design phase: threat model. Build phase: secure coding standards and SAST tools. Test phase: DAST, penetration testing. Deploy phase: configuration review. Maintain phase: patch management and continuous monitoring.

The exam tests the OWASP Top 10 frequently. SQL injection, XSS, broken authentication, insecure direct object references — these are not exotic vulnerabilities. They are the bread and butter of application security, and they are all preventable with basic secure coding practices. A developer who understands input validation and parameterised queries will never write a SQL injection vulnerability. Security knowledge is not an add-on for developers — it is a core professional competency.`,
    memoryHacks: [
      {
        label: 'SDLC Security Integration — RDBTDM',
        trick: 'Requirements → Design → Build → Test → Deploy → Maintain. "Robots Drink Beer Then Drive Motorcycles." At each phase: R=security reqs, D=threat model, B=secure code+SAST, T=DAST+pentest, D=config review, M=patch management.',
      },
      {
        label: 'OWASP Top 10 — The Most Common Web Vulnerabilities',
        trick: 'The top 3 that appear most on exams: Injection (SQL, LDAP, OS command), Broken Authentication (weak passwords, session issues), and Sensitive Data Exposure (unencrypted storage/transit). Prevention for ALL injection types: parameterised queries and input validation.',
      },
      {
        label: 'SAST vs DAST — The Testing Pair',
        trick: 'SAST (Static Application Security Testing) = analyse source code WITHOUT running it (white box). DAST (Dynamic Application Security Testing) = test running application from outside (black box). SAST finds flaws earlier and cheaper. DAST finds runtime issues SAST misses. "Static = Source, Dynamic = Deployed."',
      },
    ],
    examObjectives: [
      {
        objective: 'Understand and apply security in the Software Development Life Cycle (SDLC)',
        tanakaTip: 'The exam tests WHERE in the SDLC different activities belong. Threat modelling = Design phase. Code review = Build phase. Penetration testing = Test phase. The key principle: the earlier a security defect is found, the cheaper it is to fix. This is "shift left" security.',
      },
      {
        objective: 'Identify and apply security controls in development environments',
        tanakaTip: 'Separation of development, test, and production environments is a fundamental control. Developers should NOT have access to production. Production data should NOT be used in testing (use synthetic or anonymised data). The exam tests whether you can identify when these principles are violated.',
      },
      {
        objective: 'Assess the effectiveness of software security (code review, testing, OWASP)',
        tanakaTip: 'Change management for software is as important as the code itself. Every change to production should follow a formal process: request, review, approval, testing, implementation, verification. Emergency change procedures exist but should require post-implementation review.',
      },
    ],
    trapWarning: `ISC² loves to test the DIFFERENCE between different types of malicious code. A virus requires a host program and user action to propagate. A worm self-replicates through network connections without user action. A Trojan disguises itself as legitimate software. Ransomware encrypts data for extortion. Rootkits hide their presence at OS or firmware level. The exam may describe behaviour and ask you to name the malware type — know the definitions precisely. Also: a logic bomb is malware triggered by a specific condition (date, event, action) — often the work of a disgruntled insider.`,
  },
];

// ─── Spiral Binding ────────────────────────────────────────

function SpiralBinding() {
  return (
    <div className="absolute left-0 inset-y-0 w-8 flex flex-col justify-around items-center py-4 z-10">
      {Array.from({ length: 18 }).map((_, i) => (
        <div
          key={i}
          className="w-5 h-5 rounded-full border-2"
          style={{
            borderColor: 'rgba(180,130,60,0.6)',
            background: 'rgba(120,80,30,0.3)',
            boxShadow: 'inset 0 1px 2px rgba(0,0,0,0.4)',
          }}
        />
      ))}
    </div>
  );
}

// ─── Domain Tab ────────────────────────────────────────────

function DomainTab({
  entry,
  isActive,
  isUnlocked,
  onClick,
}: {
  entry: NotebookEntry;
  isActive: boolean;
  isUnlocked: boolean;
  onClick: () => void;
}) {
  return (
    <button
      onClick={onClick}
      className="w-full text-left px-3 py-2.5 rounded-r-lg mb-1 transition-all relative group"
      style={{
        background: isActive
          ? 'rgba(180,130,60,0.25)'
          : 'rgba(180,130,60,0.05)',
        borderLeft: isActive
          ? '3px solid rgba(180,130,60,0.8)'
          : '3px solid transparent',
        borderTop: '1px solid rgba(180,130,60,0.1)',
        borderBottom: '1px solid rgba(180,130,60,0.1)',
        borderRight: '1px solid rgba(180,130,60,0.1)',
        opacity: isUnlocked ? 1 : 0.5,
        cursor: isUnlocked ? 'pointer' : 'not-allowed',
      }}
    >
      <div className="flex items-center gap-2">
        <span
          className="text-xs font-bold"
          style={{ color: isActive ? 'rgba(220,180,80,0.9)' : 'rgba(180,130,60,0.7)' }}
        >
          D{entry.domain}
        </span>
        {!isUnlocked && (
          <Lock
            className="w-3 h-3"
            style={{ color: 'rgba(180,130,60,0.4)' }}
          />
        )}
      </div>
      <p
        className="text-[10px] leading-tight mt-0.5 hidden md:block"
        style={{ color: isActive ? 'rgba(200,160,70,0.8)' : 'rgba(140,100,40,0.7)' }}
      >
        {isUnlocked ? `Act ${entry.domain}` : 'Locked'}
      </p>
    </button>
  );
}

// ─── Main Component ────────────────────────────────────────

export default function TanakaNotebook({
  unlockedDomains = [1],
}: TanakaNotebookProps) {
  const [activeDomain, setActiveDomain] = useState(unlockedDomains[0] ?? 1);
  const [prevDomain, setPrevDomain] = useState<number | null>(null);
  const [isFlipping, setIsFlipping] = useState(false);
  const reduce = useReducedMotion();

  const entry = NOTEBOOK_ENTRIES.find((e) => e.domain === activeDomain);

  const handleTabClick = (domain: number) => {
    if (!unlockedDomains.includes(domain) || domain === activeDomain) return;
    setPrevDomain(activeDomain);
    setIsFlipping(true);
    setTimeout(() => {
      setActiveDomain(domain);
      setIsFlipping(false);
    }, 300);
  };

  if (!entry) return null;

  return (
    <div
      className="relative rounded-lg overflow-hidden"
      style={{
        background: 'linear-gradient(135deg, #1a100a 0%, #2a1a0f 50%, #1a1205 100%)',
        border: '2px solid rgba(180,130,60,0.4)',
        minHeight: 600,
      }}
    >
      {/* Spiral binding */}
      <SpiralBinding />

      {/* Classified stamp */}
      <div
        className="absolute top-4 right-4 z-20 px-3 py-1 text-xs font-bold tracking-widest border-2 font-serif italic pointer-events-none select-none"
        style={{
          color: 'rgba(220,50,50,0.35)',
          borderColor: 'rgba(220,50,50,0.25)',
          transform: 'rotate(-3deg)',
          textShadow: '0 0 8px rgba(220,50,50,0.2)',
        }}
      >
        SENTINEL DYNAMICS — CLASSIFIED
      </div>

      {/* Layout: tabs on left, content on right */}
      <div className="flex pl-10" style={{ minHeight: 600 }}>
        {/* Domain tab bar */}
        <div
          className="w-16 md:w-20 flex-shrink-0 py-16 px-1 border-r"
          style={{ borderColor: 'rgba(180,130,60,0.2)' }}
        >
          <p
            className="text-[8px] font-bold uppercase tracking-widest text-center mb-3 rotate-0"
            style={{ color: 'rgba(180,130,60,0.5)' }}
          >
            Acts
          </p>
          {NOTEBOOK_ENTRIES.map((e) => (
            <DomainTab
              key={e.domain}
              entry={e}
              isActive={e.domain === activeDomain}
              isUnlocked={unlockedDomains.includes(e.domain)}
              onClick={() => handleTabClick(e.domain)}
            />
          ))}
        </div>

        {/* Notebook content */}
        <div className="flex-1 px-6 py-6 overflow-y-auto" style={{ maxHeight: 700 }}>
          {/* Header */}
          <div className="mb-6">
            <p
              className="text-xs font-bold uppercase tracking-widest mb-1"
              style={{ color: 'rgba(180,130,60,0.6)' }}
            >
              Dr. Tanaka&apos;s Field Notes
            </p>
            <h2
              className="text-xl font-serif italic mb-1"
              style={{ color: 'rgba(230,200,120,0.95)' }}
            >
              {entry.title}
            </h2>
            <div className="flex items-center gap-4 text-xs font-serif italic" style={{ color: 'rgba(180,140,70,0.7)' }}>
              <span>📍 {entry.location}</span>
              <span>📅 {entry.date}</span>
            </div>
            <div
              className="mt-3 border-b"
              style={{ borderColor: 'rgba(180,130,60,0.2)', borderStyle: 'dashed' }}
            />
          </div>

          {/* Page flip animation wrapper */}
          <div style={{ perspective: reduce ? undefined : 1400 }}>
            <AnimatePresence mode="wait">
              {!isFlipping && (
                <motion.div
                  key={activeDomain}
                  initial={
                    reduce
                      ? { opacity: 0 }
                      : { opacity: 0, rotateY: -75, x: -30, boxShadow: '0 18px 30px -10px rgba(0,0,0,0.55)' }
                  }
                  animate={
                    reduce
                      ? { opacity: 1 }
                      : { opacity: 1, rotateY: 0, x: 0, boxShadow: '0 0 0 rgba(0,0,0,0)' }
                  }
                  exit={
                    reduce
                      ? { opacity: 0 }
                      : { opacity: 0, rotateY: 75, x: 30, boxShadow: '0 18px 30px -10px rgba(0,0,0,0.55)' }
                  }
                  transition={{ duration: reduce ? 0.15 : 0.45, ease: [0.2, 0, 0, 1] }}
                  style={{ transformOrigin: 'left center', transformStyle: 'preserve-3d' }}
                >
                  {unlockedDomains.includes(activeDomain) ? (
                    <NotebookPageContentWithTokens entry={entry} />
                  ) : (
                    <LockedPage domain={activeDomain} />
                  )}
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        </div>
      </div>
    </div>
  );
}

// ─── Locked Page ───────────────────────────────────────────

function LockedPage({ domain }: { domain: number }) {
  return (
    <div className="relative">
      {/* Blurred preview */}
      <div className="blur-sm opacity-30 pointer-events-none select-none space-y-4">
        <div className="h-4 rounded" style={{ background: 'rgba(180,130,60,0.3)', width: '60%' }} />
        <div className="h-4 rounded" style={{ background: 'rgba(180,130,60,0.2)', width: '90%' }} />
        <div className="h-4 rounded" style={{ background: 'rgba(180,130,60,0.2)', width: '75%' }} />
        <div className="h-4 rounded" style={{ background: 'rgba(180,130,60,0.2)', width: '85%' }} />
        <div className="h-4 rounded" style={{ background: 'rgba(180,130,60,0.2)', width: '50%' }} />
      </div>
      {/* Lock overlay */}
      <div className="absolute inset-0 flex flex-col items-center justify-center gap-4">
        <div
          className="w-16 h-16 rounded-full flex items-center justify-center"
          style={{ background: 'rgba(180,130,60,0.1)', border: '2px solid rgba(180,130,60,0.3)' }}
        >
          <Lock className="w-8 h-8" style={{ color: 'rgba(180,130,60,0.6)' }} />
        </div>
        <p className="text-sm font-serif italic text-center" style={{ color: 'rgba(180,130,60,0.7)' }}>
          Complete Act {domain - 1} to unlock
        </p>
        <p className="text-xs text-center max-w-xs" style={{ color: 'rgba(180,130,60,0.5)' }}>
          Dr. Tanaka&apos;s notes for Domain {domain} will be available after completing the previous chapter.
        </p>
      </div>
    </div>
  );
}

// ─── Page Content ──────────────────────────────────────────

function NotebookPageContentWithTokens({ entry }: { entry: NotebookEntry }) {
  const profile = useUserStore((s) => s.profile);
  const tokens: PlayerProfileTokens = profile
    ? {
        display_name:       profile.display_name,
        pronoun_subject:    profile.pronoun_subject,
        pronoun_object:     profile.pronoun_object,
        pronoun_possessive: profile.pronoun_possessive,
        pronoun_reflexive:  profile.pronoun_reflexive,
      }
    : {
        display_name:       'Agent',
        pronoun_subject:    'they',
        pronoun_object:     'them',
        pronoun_possessive: 'their',
        pronoun_reflexive:  'themself',
      };
  const substituted: NotebookEntry = {
    ...entry,
    tanakaVoice: substituteTokens(entry.tanakaVoice, tokens),
    trapWarning: substituteTokens(entry.trapWarning, tokens),
    memoryHacks: entry.memoryHacks.map((h) => ({
      ...h,
      trick: substituteTokens(h.trick, tokens),
    })),
    examObjectives: entry.examObjectives.map((o) => ({
      ...o,
      tanakaTip: substituteTokens(o.tanakaTip, tokens),
    })),
  };
  return <NotebookPageContent entry={substituted} />;
}

function NotebookPageContent({ entry }: { entry: NotebookEntry }) {
  return (
    <div className="space-y-6">
      {/* Tanaka's voice */}
      <div>
        <p
          className="text-[10px] font-bold uppercase tracking-widest mb-3"
          style={{ color: 'rgba(180,130,60,0.6)' }}
        >
          Field Notes — Dr. K. Tanaka
        </p>
        <div className="space-y-3">
          {entry.tanakaVoice.split('\n\n').map((para, i) => (
            <p
              key={i}
              className="text-sm leading-relaxed"
              style={{ color: 'rgba(215,185,130,0.9)' }}
            >
              {para}
            </p>
          ))}
        </div>
      </div>

      {/* Memory Hacks */}
      <div
        className="rounded-lg p-4 space-y-3"
        style={{
          background: 'rgba(100,50,150,0.15)',
          border: '1px solid rgba(150,80,220,0.3)',
        }}
      >
        <p
          className="text-[10px] font-bold uppercase tracking-widest"
          style={{ color: 'rgba(180,120,255,0.8)' }}
        >
          🧠 Memory Hacks
        </p>
        {entry.memoryHacks.map((hack, i) => (
          <div key={i} className="space-y-1">
            <p className="text-xs font-bold" style={{ color: 'rgba(200,150,255,0.9)' }}>
              {hack.label}
            </p>
            <p className="text-xs leading-relaxed" style={{ color: 'rgba(180,140,220,0.8)' }}>
              {hack.trick}
            </p>
          </div>
        ))}
      </div>

      {/* Exam Objectives */}
      <div className="space-y-3">
        <p
          className="text-[10px] font-bold uppercase tracking-widest"
          style={{ color: 'rgba(180,130,60,0.6)' }}
        >
          Exam Objectives
        </p>
        {entry.examObjectives.map((obj, i) => (
          <div key={i} className="space-y-1">
            <p className="text-xs font-semibold" style={{ color: 'rgba(215,185,130,0.9)' }}>
              {i + 1}. {obj.objective}
            </p>
            <div
              className="ml-4 pl-3 py-2 rounded text-xs leading-relaxed"
              style={{
                background: 'rgba(0,100,200,0.1)',
                borderLeft: '2px solid rgba(0,150,255,0.4)',
                color: 'rgba(140,180,255,0.85)',
                fontStyle: 'italic',
              }}
            >
              Tanaka: &ldquo;{obj.tanakaTip}&rdquo;
            </div>
          </div>
        ))}
      </div>

      {/* Trap Warning */}
      <div
        className="rounded-lg p-4"
        style={{
          background: 'rgba(200,80,20,0.1)',
          border: '1px solid rgba(220,100,30,0.35)',
        }}
      >
        <p
          className="text-[10px] font-bold uppercase tracking-widest mb-2"
          style={{ color: 'rgba(255,130,60,0.9)' }}
        >
          ⚠️ ISC² Exam Trap:
        </p>
        <p className="text-xs leading-relaxed" style={{ color: 'rgba(255,180,120,0.85)' }}>
          {entry.trapWarning}
        </p>
      </div>

      {/* Key Formulas */}
      {entry.keyFormulas && entry.keyFormulas.length > 0 && (
        <div
          className="rounded-lg p-4"
          style={{
            background: 'rgba(10,80,10,0.15)',
            border: '1px solid rgba(30,180,60,0.25)',
          }}
        >
          <p
            className="text-[10px] font-bold uppercase tracking-widest mb-3"
            style={{ color: 'rgba(80,200,100,0.8)' }}
          >
            Key Formulas
          </p>
          <div className="space-y-2">
            {entry.keyFormulas.map((f, i) => (
              <p
                key={i}
                className="text-xs font-mono"
                style={{ color: 'rgba(120,220,140,0.9)' }}
              >
                {f}
              </p>
            ))}
          </div>
        </div>
      )}

      {/* Notebook footer rule */}
      <div
        className="border-b pt-2"
        style={{ borderColor: 'rgba(180,130,60,0.2)', borderStyle: 'dashed' }}
      />
      <p
        className="text-[9px] font-serif italic text-right pb-2"
        style={{ color: 'rgba(180,130,60,0.4)' }}
      >
        The Sentinel Files — For Internal Use Only
      </p>
    </div>
  );
}
