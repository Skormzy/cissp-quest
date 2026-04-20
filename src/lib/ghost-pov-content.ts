// Ghost POV — Adversary Perspective
// Classified scenes from Ghost Holloway's point of view.
// These scenes are designed to teach offensive thinking and the human element
// of insider threats — NOT to glorify hacking.
// Unlocked after Act 5 (IAM) completion.

import { DomainChapter, LOCATION_GRADIENTS_V2 } from '@/lib/story-types-v2';

// ─── Shared background for Ghost scenes ───────────────────

const GHOST_BACKGROUND =
  'linear-gradient(135deg, #0d0505 0%, #1a0808 50%, #0d0a0a 100%)';

// ─── Scene A: "The Day I Found the Staging Server" ────────

export const GHOST_SCENE_A: DomainChapter = {
  domainId: 0,
  domainName: 'Ghost POV — Adversary Perspective',
  location: 'Ghost\'s Apartment, New York — 11:47 PM',
  locationEmoji: '🕵️',
  background: GHOST_BACKGROUND,
  primaryNPC: 'ghost',
  scenes: [
    {
      id: 'ghost-a-01',
      type: 'narration',
      location: 'Ghost\'s Home Office — New York — 90 Days Before the Breach',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Ghost Holloway had been a senior developer at Meridian for three years. A good developer. A careful one. What you are about to see is not the story of a criminal — it is the story of what happens when an organisation ignores the humans who try to protect it.',
      xpReward: 0,
    },
    {
      id: 'ghost-a-02',
      type: 'dialogue',
      location: 'Ghost\'s Home Office — New York',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'I was doing routine dependency checks on the staging environment when I noticed it. The staging server — the one containing copies of production customer records for "testing purposes" — was accessible from the public internet. No VPN. No firewall rule. Port 443 open to the world, and the admin panel was responding to a default credential pair that shipped with the software in 2019.',
      xpReward: 25,
    },
    {
      id: 'ghost-a-03',
      type: 'evidence',
      location: 'Meridian Staging Server — OSINT Discovery',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'narrator',
      dialogue:
        '[EXHIBIT A-1] Staging server metadata captured by Ghost during discovery:\n\nHost: staging-api.meridian-internal.net\nPublic IP: 52.14.xxx.xxx\nPort 443: OPEN (TLS 1.0 — DEPRECATED)\nAdmin Panel: /admin/console\nDefault Credentials: admin / meridian2019\nData present: 847,000 customer records (PII confirmed)\nNetwork segment: PUBLIC (not behind VPN or firewall)\n\nCISSP LESSON: This is a textbook Principle of Least Privilege and network segmentation failure. A staging environment containing production PII should be (1) isolated from public internet, (2) accessible only via VPN, (3) populated with synthetic data — never real customer records.',
      xpReward: 50,
    },
    {
      id: 'ghost-a-04',
      type: 'dialogue',
      location: 'Meridian Internal Ticketing System',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'I filed a ticket immediately. Priority: Critical. Title: "Staging server publicly accessible with default creds — 847k customer records at risk." I attached screenshots, the server IP, the admin panel URL, and a suggested remediation: take it offline, put it behind the VPN, change the credentials, replace the PII with synthetic data. I hit submit and went to sleep thinking the problem was solved.',
      xpReward: 25,
    },
    {
      id: 'ghost-a-05',
      type: 'dialogue',
      location: 'Meridian Internal Ticketing System — 30 Days Later',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'Thirty days later, the ticket was still open. Status: "Awaiting triage." I pinged the security team lead directly. He said he had seen it, it was on the backlog, they were short-staffed. I checked the server. Still public. Still default credentials. I escalated to my manager. She said to document it and move on. I documented it. I waited.',
      xpReward: 25,
    },
    {
      id: 'ghost-a-06',
      type: 'memory_hack',
      location: 'Ghost\'s Home Office — New York',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Ghost\'s discovery represents three simultaneous control failures that the CISSP exam tests independently.',
      memoryHack: {
        title: 'Three Failures in One Staging Server',
        body: '1. LEAST PRIVILEGE FAILURE: Staging contained real PII. It should contain only synthetic data.\n\n2. NETWORK SEGMENTATION FAILURE: Staging was on the public internet. It should be isolated in a private network segment, VPN-accessible only.\n\n3. CONFIGURATION MANAGEMENT FAILURE: Default credentials were never changed. Every deployed system must have default credentials rotated immediately — this is CIS Control #5.\n\nMemory Hook: "Least Privilege, Right Network, No Defaults" — LRN. Learn from what Ghost found.',
      },
      xpReward: 50,
    },
  ],
};

// ─── Scene B: "The Report Nobody Read" ────────────────────

export const GHOST_SCENE_B: DomainChapter = {
  domainId: 0,
  domainName: 'Ghost POV — Adversary Perspective',
  location: 'Meridian Security Operations — New York',
  locationEmoji: '📋',
  background: GHOST_BACKGROUND,
  primaryNPC: 'ghost',
  scenes: [
    {
      id: 'ghost-b-01',
      type: 'narration',
      location: 'Meridian HQ — 60 Days Before the Breach',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Sixty days after filing the original ticket, Ghost escalated again. This time he submitted a formal Vulnerability Assessment Report through the official security disclosure programme. It was thorough, detailed, and followed every procedure in Meridian\'s security policy manual. It was also completely ignored.',
      xpReward: 0,
    },
    {
      id: 'ghost-b-02',
      type: 'evidence',
      location: 'Meridian Vulnerability Assessment Report — Filed Day 60',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        '[EXHIBIT B-1] Formal Vulnerability Assessment Report:\n\nSubmitted by: D. Holloway (Contractor, Senior Developer)\nDate: [60 days before breach]\nSeverity: CRITICAL (CVSS 9.8)\nAffected System: staging-api.meridian-internal.net\nVulnerabilities:\n  CVE-1: Public network exposure of private staging environment\n  CVE-2: Default credentials on administrative console (CWE-798)\n  CVE-3: Unencrypted PII in non-production environment (GDPR violation)\nEstimated Data at Risk: 847,000 customer records\nRecommended Remediation Timeline: 72 hours for credential rotation; 7 days for network isolation\nEscalation Path Attempted: Ticket system → Team Lead → Direct Manager\nStatus at time of report: UNACKNOWLEDGED (30+ days)\n\nSigned: D. Holloway\nCC: Chief Security Officer [email bounced — mailbox full]',
      xpReward: 50,
    },
    {
      id: 'ghost-b-03',
      type: 'tlatm',
      location: 'Think Like A Manager — The CISO\'s Obligation',
      background: GHOST_BACKGROUND,
      leftNPC: 'sharma',
      speaker: 'sharma',
      dialogue:
        'What should the CISO have done when a contractor submitted a formal CRITICAL vulnerability report — with CVSS 9.8, 847,000 records at risk, and a bounced email address on the security disclosure inbox?\n\nA) Acknowledge within 24 hours, escalate to incident response, assign owner, set remediation SLA\nB) Add to the security backlog for next sprint review\nC) Request clarification on the CVSS scoring methodology before acting\nD) Forward to the compliance team as this may be a regulatory matter',
      choices: [
        {
          text: 'A — Acknowledge within 24 hours, escalate, assign owner, set SLA',
          xpBonus: 100,
          isCorrect: true,
          response:
            'Correct. A CRITICAL finding (CVSS 9.0+) requires immediate escalation regardless of staffing constraints. The CISO is accountable for the vulnerability management programme. A 24-hour acknowledgement SLA and assigned owner are baseline requirements. The bounced email is itself a critical finding — security disclosure inboxes must be monitored.',
        },
        {
          text: 'B — Add to security backlog for next sprint',
          xpBonus: 5,
          isCorrect: false,
          response:
            'Incorrect. Sprint backlogs are for feature work and low-medium findings. A CVSS 9.8 finding with 847,000 records at risk cannot wait for a sprint cycle. This is the kind of decision that leads to regulatory fines and board-level accountability.',
        },
        {
          text: 'C — Request clarification on CVSS scoring before acting',
          xpBonus: 5,
          isCorrect: false,
          response:
            'Incorrect. Requesting scoring clarification is delay-by-bureaucracy. Even if the CVSS were scored at 8.0 rather than 9.8, the finding — publicly accessible staging server, real PII, default credentials — is unambiguously critical. Act first, debate scoring later.',
        },
        {
          text: 'D — Forward to compliance as a regulatory matter',
          xpBonus: 5,
          isCorrect: false,
          response:
            'Partially correct but insufficient. Yes, 847,000 records of PII in an exposed environment is a GDPR and potential breach notification issue. But forwarding to compliance without simultaneously beginning technical remediation is not acceptable. Both tracks must run in parallel.',
        },
      ],
      xpReward: 25,
    },
    {
      id: 'ghost-b-04',
      type: 'dialogue',
      location: 'Ghost\'s Home Office — Day 75',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'I had followed every procedure. I had used the official channel. I had attached CVSS scores, remediation steps, affected record counts, regulatory implications. And I had heard nothing. Not a single acknowledgement. I checked the server on day 75. Default credentials. Still. I logged in — just to confirm I could, to document it properly — and I sat there looking at 847,000 people\'s names, addresses, and financial data, completely unprotected. I sat there for a long time.',
      xpReward: 25,
    },
    {
      id: 'ghost-b-05',
      type: 'memory_hack',
      location: 'Security Assessment Best Practices',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Ghost\'s vulnerability report followed best practices. The organisation\'s response violated multiple security governance principles the CISSP exam tests.',
      memoryHack: {
        title: 'Vulnerability Management: What Should Have Happened',
        body: 'CISSP Vulnerability Management Cycle:\n1. DISCOVER: Ghost did this correctly with formal documentation\n2. PRIORITISE: CVSS 9.8 = Critical = immediate action required\n3. ASSIGN: Every finding needs a named owner with accountability\n4. REMEDIATE: Technical fix within the SLA for the severity level\n5. VERIFY: Retest after remediation to confirm closure\n6. REPORT: Track metrics — mean time to remediate, open critical count\n\nMeridian skipped steps 2 through 6. The organisational failure, not just the technical vulnerability, enabled the breach.\n\nMemory Hook: "DPARVR" — Discover, Prioritise, Assign, Remediate, Verify, Report.',
      },
      xpReward: 50,
    },
    {
      id: 'ghost-b-06',
      type: 'dialogue',
      location: 'Meridian HR Portal — Day 80',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'I researched my options. ISC² Code of Ethics says I have a duty to society, not just to my employer. I found three paths: report to the regulator (GDPR supervisory authority), go to the press, or act unilaterally to force the issue. Each path had consequences I was not sure I was ready to face. My contract was up in 30 days. Maybe it would not be my problem anymore. Maybe I could just... let it go. I still had 10 days to decide.',
      xpReward: 25,
    },
  ],
};

// ─── Scene C: "The Decision" ───────────────────────────────

export const GHOST_SCENE_C: DomainChapter = {
  domainId: 0,
  domainName: 'Ghost POV — Adversary Perspective',
  location: 'New York — Day 89 — One Day Before the Breach',
  locationEmoji: '⚖️',
  background: GHOST_BACKGROUND,
  primaryNPC: 'ghost',
  scenes: [
    {
      id: 'ghost-c-01',
      type: 'narration',
      location: 'New York — Day 89 of Ghost\'s Knowledge',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Nine days before his contract ended. Ninety days since he found the vulnerability. Ghost Holloway had reached the point that every security professional dreads: knowing about a critical risk that the organisation refuses to address. What he chose next would define the rest of his career — and end it.',
      xpReward: 0,
    },
    {
      id: 'ghost-c-02',
      type: 'dialogue',
      location: 'Ghost\'s Apartment — New York — 2:00 AM',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'I had three paths. Path one: file a complaint with the Data Protection Authority. Legal. Slow. Three to six months before anyone acts. By then, my contract is over, I have no insider access to verify if it was fixed, and I have probably burned every reference in the industry. Path two: go to a journalist. Illegal under my NDA. Potentially criminal under computer fraud laws depending on how they characterise my original access. Path three: download the data myself and hand it to the DPA as evidence. That is unambiguously illegal. But the data would be protected.',
      xpReward: 25,
    },
    {
      id: 'ghost-c-03',
      type: 'choice',
      location: 'Ghost\'s Apartment — The Decision Point',
      background: GHOST_BACKGROUND,
      leftNPC: 'ghost',
      speaker: 'ghost',
      dialogue:
        'You are Ghost. You have nine days left on your contract. The vulnerability is still open. 847,000 people\'s data is exposed right now. You have documented everything. You have followed every procedure. What do you do?',
      choices: [
        {
          text: 'Report to the Data Protection Authority with your documented evidence',
          xpBonus: 100,
          isCorrect: true,
          response:
            'This is the ethically and legally correct path. GDPR Article 33 creates obligations for controllers, but security researchers can report known violations to the supervisory authority (ICO in UK, CNIL in France, etc.) with documented evidence. This is whistleblower-protected activity in most jurisdictions. It is slow — but it is the right path.',
        },
        {
          text: 'Download the data as evidence and hand it to the DPA',
          xpBonus: 10,
          isCorrect: false,
          response:
            'This is what Ghost chose — and it ended his career. Unauthorised access to data, even to "protect" it, is a violation of the Computer Fraud and Abuse Act (CFAA) and equivalent laws. Intent does not create a defence. Ghost became a criminal in the act of trying to prevent a crime.',
        },
        {
          text: 'Send an anonymous tip to a cybersecurity journalist',
          xpBonus: 10,
          isCorrect: false,
          response:
            'Whistleblower protection for NDA violations is jurisdiction-dependent and often insufficient. Anonymous tips may trigger investigation without Ghost\'s control over the narrative. More importantly, it does not directly lead to remediation — journalists publish, they do not patch servers.',
        },
        {
          text: 'Document everything, let your contract expire, and submit a formal complaint the day after',
          xpBonus: 75,
          isCorrect: false,
          response:
            'Legally safer, but ethically questionable — 847,000 people remain at risk during the delay. The exam tests that you understand the tension between legal compliance, ethical obligation, and personal liability. There is no perfect answer, but the DPA report while still employed is the most defensible path.',
        },
      ],
      xpReward: 25,
    },
    {
      id: 'ghost-c-04',
      type: 'narration',
      location: 'New York — Day 90 — The Breach Begins',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'Regardless of which path Ghost chose, the breach happened. An external threat actor — entirely independent of Ghost — discovered the same staging server using an automated scanner eighteen hours later. They used the same default credentials. They exfiltrated all 847,000 records. Meridian did not detect the breach for eleven days. The path Ghost chose only determined whether he was a witness, a whistleblower, or a co-defendant.',
      xpReward: 25,
    },
    {
      id: 'ghost-c-05',
      type: 'memory_hack',
      location: 'ISC² Code of Ethics — Core Obligations',
      background: GHOST_BACKGROUND,
      speaker: 'narrator',
      dialogue:
        'The CISSP exam tests the ISC² Code of Ethics directly. Ghost\'s scenario illustrates all four canons in tension.',
      memoryHack: {
        title: 'ISC² Code of Ethics — The Four Canons',
        body: 'Canon 1: Protect SOCIETY, the common good, public trust and confidence.\nCanon 2: Act HONOURABLY, honestly, justly, responsibly, and legally.\nCanon 3: Provide DILIGENT and competent service to principals.\nCanon 4: Advance and protect the PROFESSION.\n\nMemory Hook: "SHDP" — Society, Honourably, Diligently, Profession.\n\nThey are in PRIORITY ORDER. Canon 1 (Society) outranks Canon 3 (your employer). When employer interests conflict with public safety, Society wins. Ghost had a duty to society that outranked his NDA. But that duty required LEGAL action — not unilateral data access.\n\nKey exam point: "Which canon takes precedence?" → Always Canon 1: Society.',
      },
      xpReward: 50,
    },
    {
      id: 'ghost-c-06',
      type: 'dialogue',
      location: 'Toronto, Sentinel Dynamics HQ — Present Day',
      background: 'linear-gradient(135deg, #0a1628 0%, #1a2d4a 50%, #0d2040 100%)',
      leftNPC: 'tanaka',
      speaker: 'tanaka',
      dialogue:
        'Alex, this is why ethics is Domain 1, not an afterthought. Ghost knew the right thing to do. He had the knowledge, the evidence, and the legal pathway. But ninety days of silence from his organisation eroded his trust in the system until he made a choice that destroyed his career while trying to protect strangers he had never met. Security is not just about firewalls and protocols. It is about the humans inside the systems — and the organisations that either support them or fail them.',
      xpReward: 50,
    },
  ],
};

// ─── Exported chapters array ───────────────────────────────

export const GHOST_POV_CHAPTERS: DomainChapter[] = [
  GHOST_SCENE_A,
  GHOST_SCENE_B,
  GHOST_SCENE_C,
];

export const GHOST_SCENE_TITLES = [
  'Scene A: The Day I Found the Staging Server',
  'Scene B: The Report Nobody Read',
  'Scene C: The Decision',
];
