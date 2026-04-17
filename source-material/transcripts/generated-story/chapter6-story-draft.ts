import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter6: DomainChapterDefinition = {
  domainId: 6,
  title: 'The Evidence',
  location: 'Forensics Lab, Tel Aviv',
  locationGradient: 'linear-gradient(135deg, #1a1a35 0%, #2d1a3a 50%, #1a1a2e 100%)',
  acts: [
    // ================================================================
    // ACT 1 — "The Assessment Mandate"
    // Concepts: Security Assessment Strategy, Vulnerability Assessment vs
    // Penetration Testing, Scanning Tools, CVSS, Banner Grabbing
    // ================================================================
    {
      actNumber: 1,
      title: 'The Assessment Mandate',
      description:
        'Kai Tanaka leads a forensic briefing at the Nexus Tel Aviv lab. The breach artifacts reveal that no vulnerability scans were scheduled — and the attacker exploited every gap we never looked for.',
      xpReward: 150,
      conceptsCovered: [
        'Security Assessment Strategy',
        'Vulnerability Assessment vs Penetration Testing',
        'Vulnerability Scanning Tools',
        'CVSS Scoring',
        'Banner Grabbing and Fingerprinting',
      ],
      estimatedMinutes: 20,
      nodes: [
        // ─── Transition ─────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd6a1-transition-1',
          location: 'Tel Aviv',
          description: 'Nexus Forensics Lab — Kidon Wing, Tel Aviv',
          animation: 'glitch',
          timeSkipText: '14 hours after the breach was escalated to the international team',
        },

        // ─── Dialogue 1 — Kai opens the briefing ─────────────────────
        {
          type: 'dialogue',
          id: 'd6a1-dialogue-1',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Welcome to the lab, {player}. I\'m Kai Tanaka, forensics lead. Before we touch a single piece of evidence, let me tell you what went wrong at the 30,000-foot view. The attacker walked into rooms we never checked. Not because we had no locks — because we never ran a health checkup.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Dialogue 2 — Player asks about assessment ───────────────
        {
          type: 'dialogue',
          id: 'd6a1-dialogue-2',
          speaker: 'player',
          speakerSide: 'right',
          text: 'What kind of health checkup would have caught this?',
          rightCharacter: 'player',
          rightExpression: 'neutral',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 3 — Kai introduces VA vs PT analogy ────────────
        {
          type: 'dialogue',
          id: 'd6a1-dialogue-3',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Think of it this way. A vulnerability assessment is like a full physical at your doctor — they check your blood pressure, run labs, and tell you what could go wrong. A penetration test is like an actual marathon: someone actually tries to run you into the ground to see what breaks. The first tells you what might fail. The second finds out if it actually does.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Evidence 1 — Assessment Strategy Brief ───────────────────
        {
          type: 'evidence',
          id: 'd6a1-evidence-1',
          title: 'Shadow Protocol — Assessment Gap Report',
          classification: 'TOP SECRET',
          content:
            'Post-breach forensic review confirms that Nexus conducted no vulnerability scans on the authentication service in the 180 days prior to the incident. No penetration test had been authorized on the authentication service since initial deployment 22 months ago.',
          evidenceItems: [
            { label: 'Last Vulnerability Scan', value: '180+ days ago (expired window)', highlight: true },
            { label: 'Last Authorized Pentest', value: '22 months ago (pre-current codebase)', highlight: true },
            { label: 'Assessment Scope', value: 'Network perimeter only — auth service was excluded' },
            { label: 'Assessment Authorization', value: 'No signed authorization on file for auth service' },
            { label: 'CVSS Score (CVE exploited)', value: '8.8 HIGH — known since 14 months ago', highlight: true },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'The vulnerability was publicly known for over a year. We just never ran the scan that would have flagged it in our environment.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'worried',
        },

        // ─── Knowledge Check 1 — Assessment strategy fundamentals ─────
        {
          type: 'knowledgeCheck',
          id: 'd6a1-kc-1',
          question:
            'Which element is REQUIRED before conducting a penetration test on an organization\'s systems?',
          options: [
            'A signed scope-and-authorization document from system owners',
            'Hiring an external firm — internal testers cannot perform pentests',
            'Completing a vulnerability assessment first in all cases',
            'Notifying law enforcement before any offensive testing begins',
          ],
          correctIndex: 0,
          explanation:
            'Written authorization (scope and rules of engagement) is non-negotiable before any penetration test. Without it, the testers are legally indistinguishable from attackers. External vs internal testers is a preference, not a requirement. Vulnerability assessment often precedes pentesting but is not always mandatory. Law enforcement notification is not a standard requirement.',
          memoryHack:
            'No pen test without a permission slip. The "scope and authorization" document is the legal line between an ethical tester and a criminal. Sign first, then hack.',
          conceptName: 'Security Assessment Strategy',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Visual Aid — VA vs PT comparison ────────────────────────
        {
          type: 'visualAid',
          id: 'd6a1-visual-1',
          title: 'VA vs Pentest — "Health Checkup vs the Marathon"',
          aidType: 'comparison',
          headers: ['Attribute', 'Vulnerability Assessment', 'Penetration Test'],
          rows: [
            ['Goal', 'Identify and catalog weaknesses', 'Exploit weaknesses to measure real impact'],
            ['Method', 'Automated scanning, manual review', 'Active exploitation, lateral movement'],
            ['Analogy', 'Doctor says "your cholesterol is high"', 'You actually run the marathon and see what breaks'],
            ['Scope', 'Broad — find all issues', 'Narrow — simulate a real attacker path'],
            ['Output', 'List of vulnerabilities with severity', 'Proof of exploitation + attack chain narrative'],
            ['Authorization', 'Required', 'Required (and more detailed — rules of engagement)'],
          ],
          speaker: 'kai',
          dialogue:
            'Both are necessary. The VA tells you what drugs to take. The pentest shows whether the prescription actually works when you\'re under real stress.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ─── Evidence 2 — CVSS Score Breakdown ───────────────────────
        {
          type: 'evidence',
          id: 'd6a1-evidence-2',
          title: 'CVE-XXXX-SHADOW — CVSS Scoring Breakdown',
          classification: 'CONFIDENTIAL',
          content:
            'CVSS (Common Vulnerability Scoring System) is a standardized framework for rating vulnerability severity across three metric groups: Base, Temporal, and Environmental. The vulnerability exploited in the Nexus breach scored 8.8 on the Base score — but the Environmental score in Nexus\'s specific posture would have been even higher.',
          evidenceItems: [
            { label: 'Base Score', value: '8.8 HIGH — raw danger of the vulnerability itself', highlight: true },
            { label: 'Attack Vector', value: 'Network (remotely exploitable — no physical access needed)' },
            { label: 'Attack Complexity', value: 'Low (no special conditions required)' },
            { label: 'Temporal Score', value: '8.1 — adjusted downward because a patch was available', highlight: false },
            { label: 'Environmental Score', value: '9.3 CRITICAL — Nexus\'s lack of compensating controls elevated impact', highlight: true },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'Think of CVSS like a threat priority board at the embassy: the Base score is the raw threat level, Temporal adjusts it when a patch or workaround ships, and Environmental adjusts for your specific defensive posture. We had no compensating controls — so our Environmental score was higher than the published Base.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 2 — CVSS metric groups ──────────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a1-kc-2',
          question:
            'A vulnerability has a CVSS Base Score of 7.5. The vendor releases a patch, reducing exploitability. Which CVSS metric group is adjusted to reflect this change?',
          options: [
            'Base Score',
            'Temporal Score',
            'Environmental Score',
            'Impact Score',
          ],
          correctIndex: 1,
          explanation:
            'The Temporal Score adjusts the Base Score based on factors that change over time — including exploit availability, patch status, and workaround availability. When a vendor releases a patch, the Temporal Score decreases because exploit code may be less effective against patched systems. The Base Score is fixed to the inherent characteristics of the vulnerability and never changes. Environmental reflects your specific organizational context.',
          memoryHack:
            'CVSS = B-T-E. Base = the weapon\'s raw power (fixed). Temporal = the threat level right now (does a patch exist?). Environmental = how exposed YOUR organization specifically is. Temporal drops when a patch ships.',
          conceptName: 'CVSS Scoring',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 4 — Kai explains banner grabbing ────────────────
        {
          type: 'dialogue',
          id: 'd6a1-dialogue-4',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Here\'s the chilling part, {player}. The attacker didn\'t even need a zero-day. They just knocked on the front door — a technique called banner grabbing. Every service on that network was broadcasting its name and version like a nametag at a conference. The attacker read the nametag, looked up the known CVEs for that exact version, and walked straight in.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'angry',
          rightCharacter: 'player',
          rightExpression: 'surprised',
        },

        // ─── Knowledge Check 3 — Banner grabbing ─────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a1-kc-3',
          question:
            'An attacker connects to port 22 on a target server and receives the response: "SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.4". What reconnaissance technique is this?',
          options: [
            'OS Fingerprinting via TCP/IP stack analysis',
            'Banner Grabbing',
            'ARP Poisoning',
            'Network Mapping via ICMP',
          ],
          correctIndex: 1,
          explanation:
            'Banner grabbing is the technique of connecting to an open port and reading the service banner — the information the service voluntarily announces. In this case, the SSH service announces its version and OS platform. Banner grabbing requires no exploitation — it\'s passive enumeration of public service information. OS fingerprinting analyzes TCP/IP packet behavior, not service banners.',
          memoryHack:
            'Banner grabbing = reading the nametag. The service walks up and says "Hi, I\'m Apache 2.4.49 running on Ubuntu." You didn\'t hack it — it told you. That information is all an attacker needs to find the matching CVE.',
          conceptName: 'Banner Grabbing and Fingerprinting',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Timed Decision — Responding to an unscheduled scan alert ─
        {
          type: 'timedDecision',
          id: 'd6a1-td-1',
          scenario:
            'Your SOC alerts you that a port scan is underway from an internal IP address. The scan is probing all hosts in the 10.10.0.0/24 range, grabbing banners. You have no record of an authorized scan scheduled for today.',
          timeLimit: 30,
          conceptName: 'Security Assessment Strategy',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'worried',
          options: [
            {
              text: 'Treat it as a potentially unauthorized scan. Escalate to incident response and isolate the source IP pending investigation.',
              isOptimal: true,
              feedback:
                'Correct call. No authorization record = treat it as hostile until proven otherwise. An authorized scan would have a documented schedule and scope. Investigating first is the right move — it could be a pentest firm that forgot to notify, or it could be a compromised internal host probing for lateral movement targets.',
              xpBonus: 25,
            },
            {
              text: 'Assume it\'s the quarterly vulnerability scan and ignore the alert.',
              isOptimal: false,
              feedback:
                'Dangerous assumption. If the quarterly scan was scheduled, there would be documentation. Assuming benign intent for an undocumented internal scan violates the principle of least assumption. This is how lateral movement goes undetected.',
            },
            {
              text: 'Block all outbound traffic from the source IP immediately and file a report.',
              isOptimal: false,
              feedback:
                'Blocking without isolating doesn\'t contain the threat — the host may still reach other internal systems. And immediate termination without investigation could disrupt a legitimate (if undocumented) scan. Proper incident response: identify, contain, investigate.',
            },
          ],
        },

        // ─── Knowledge Check 4 — Scanning tools and their purpose ─────
        {
          type: 'knowledgeCheck',
          id: 'd6a1-kc-4',
          question:
            'Which tool is MOST appropriate for conducting a network-layer vulnerability scan across an entire IP subnet?',
          options: [
            'Metasploit',
            'Nessus',
            'Wireshark',
            'Burp Suite',
          ],
          correctIndex: 1,
          explanation:
            'Nessus (and similar tools like OpenVAS or Qualys) are purpose-built vulnerability scanners that probe hosts for known vulnerabilities, misconfigurations, and missing patches across network ranges. Metasploit is an exploitation framework used in penetration testing after vulnerabilities are identified. Wireshark is a packet analyzer for traffic capture and analysis. Burp Suite is a web application security testing proxy — excellent for web apps, not general subnet scanning.',
          memoryHack:
            'Nessus = the network doctor\'s scanner (finds problems). Metasploit = the surgeon\'s knife (acts on them). Wireshark = the traffic camera (watches everything). Burp Suite = the web app specialist.',
          conceptName: 'Vulnerability Scanning Tools',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },
      ],
    },

    // ================================================================
    // ACT 2 — "The Attacker's Playbook"
    // Concepts: Penetration Testing Phases, Black/Gray/White Box,
    // SAST vs DAST, Log Review and Analysis, Security Metrics
    // ================================================================
    {
      actNumber: 2,
      title: "The Attacker's Playbook",
      description:
        'Kai reconstructs the attacker\'s methodology step by step — demonstrating penetration testing phases in reverse. The team reviews logs, runs static and dynamic analysis on the compromised auth service, and builds the first set of security metrics.',
      xpReward: 200,
      conceptsCovered: [
        'Penetration Testing Phases',
        'Black/Gray/White Box Testing',
        'SAST vs DAST',
        'Log Review and Analysis',
        'Security Metrics (KPI/KRI, MTTD/MTTR)',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ─── Transition ──────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd6a2-transition-1',
          location: 'Tel Aviv',
          description: 'Nexus Forensics Lab — Kidon Wing, Tel Aviv — 3 hours later',
          animation: 'slide',
        },

        // ─── Dialogue 1 — Kai opens act 2 ────────────────────────────
        {
          type: 'dialogue',
          id: 'd6a2-dialogue-1',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'We\'ve identified the vulnerability. Now I want to show you exactly how a professional penetration tester — or a skilled attacker — would have moved through our environment. Understanding their playbook is how we write better defenses.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
          rightCharacter: 'player',
          rightExpression: 'neutral',
        },

        // ─── Evidence 1 — Pentest Phases Reconstruction ───────────────
        {
          type: 'evidence',
          id: 'd6a2-evidence-1',
          title: 'Attack Reconstruction — Shadow Protocol Pentest Phases',
          classification: 'TOP SECRET',
          content:
            'Forensic analysis of attacker activity reconstructed five distinct phases, perfectly mirroring a professional penetration testing engagement. The attacker operated with a clearly defined methodology — indicating advanced tradecraft.',
          evidenceItems: [
            { label: 'Phase 1 — Reconnaissance', value: 'Passive OSINT on Nexus job postings (revealed tech stack). DNS enumeration. Certificate transparency log review.', highlight: false },
            { label: 'Phase 2 — Scanning & Enumeration', value: 'Banner grabbing on exposed ports. CVSS 8.8 vuln identified in auth service. 14 hosts fingerprinted.', highlight: true },
            { label: 'Phase 3 — Exploitation', value: 'Exploited authentication service CVE. Gained initial foothold as low-privilege service account.', highlight: true },
            { label: 'Phase 4 — Post-Exploitation', value: 'Privilege escalation via unpatched local vulnerability. Lateral movement to financial DB. Data staged for exfiltration.', highlight: true },
            { label: 'Phase 5 — Reporting (Attacker\'s "Cleanup")', value: 'Log entries selectively deleted. Timestamps modified. Persistence backdoor installed.', highlight: false },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'The five phases of a pentest — Recon, Scanning, Exploitation, Post-Exploitation, Reporting — are the same five phases every skilled attacker uses. The difference is authorization and intent.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Dialogue 2 — Kai introduces box testing types ───────────
        {
          type: 'dialogue',
          id: 'd6a2-dialogue-2',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Now here\'s something the exam will absolutely test you on: the three approaches to penetration testing, based on how much knowledge the tester has going in. Black box, gray box, white box. The attacker who hit us operated pure black box — like a CIA field operative who parachutes into unknown territory with only a target briefing and zero insider knowledge.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Visual Aid — Black/Gray/White Box comparison ─────────────
        {
          type: 'visualAid',
          id: 'd6a2-visual-1',
          title: 'Pentest Knowledge Types — "The Field Operative"',
          aidType: 'comparison',
          headers: ['Type', 'Knowledge Given to Tester', 'Simulates', 'Best For'],
          rows: [
            ['Black Box', 'None — target org name only', 'External attacker with no insider access', 'Realistic threat simulation'],
            ['Gray Box', 'Some — maybe user-level credentials or network diagram', 'Insider threat or informed attacker', 'Cost-effective targeted testing'],
            ['White Box', 'Full — source code, architecture, credentials', 'Privileged insider or trusted partner', 'Deep code-level security review'],
          ],
          speaker: 'kai',
          dialogue:
            'Black box = parachute landing in unknown territory. Gray box = parachuting in with a briefing packet. White box = you built the facility and know every room. Each serves a different purpose — no one type is universally best.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ─── Knowledge Check 1 — Box testing types ───────────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a2-kc-1',
          question:
            'A penetration tester is given user-level credentials and a network topology diagram, but not source code or admin access. Which type of penetration testing is this?',
          options: [
            'Black Box',
            'Gray Box',
            'White Box',
            'Crystal Box',
          ],
          correctIndex: 1,
          explanation:
            'Gray box testing provides partial knowledge — typically enough to simulate an informed attacker or a malicious insider. Providing user credentials and a network diagram falls squarely into gray box. Black box means zero knowledge. White box (also called crystal box or clear box) means full knowledge, including source code and admin access.',
          memoryHack:
            'B-G-W = blank slate, guided parachute, written blueprint. Gray is the middle ground — some info, not everything. Partial credentials + partial architecture = gray box.',
          conceptName: 'Black/Gray/White Box Testing',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Evidence 2 — Log Analysis Findings ───────────────────────
        {
          type: 'evidence',
          id: 'd6a2-evidence-2',
          title: 'Auth Service Log Analysis — Key Findings',
          classification: 'CLASSIFIED',
          content:
            'Log review of the authentication service spanning 72 hours before and 24 hours after the initial compromise. Think of log analysis like reading the visitor sign-in book at embassy headquarters — every page tells you who walked through and when. The attacker knew we had logs, so they tried to clean the book. But they missed three pages.',
          evidenceItems: [
            { label: 'Anomaly 1', value: 'Failed logins from single IP: 847 attempts in 3 minutes (brute force pattern)', highlight: true },
            { label: 'Anomaly 2', value: 'Successful auth immediately followed by unusual query pattern — read across 14 schemas in 90 seconds', highlight: true },
            { label: 'Anomaly 3', value: 'Log entries deleted between 02:14 and 02:31 UTC — gaps in sequence numbers reveal the deletion', highlight: true },
            { label: 'Gap Found', value: 'Log forwarding to SIEM had a 22-minute lag — attacker acted during the window' },
            { label: 'MTTD', value: '14.2 hours from initial compromise to detection — well above acceptable threshold', highlight: false },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'The attacker deleted logs but forgot that our logging system stamps sequential entry IDs. The gaps in the ID sequence are as incriminating as the logs themselves.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Knowledge Check 2 — Log analysis concepts ───────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a2-kc-2',
          question:
            'During a log review, an analyst notices that authentication log entries jump from sequence number 100,450 to 100,512. What does this gap MOST likely indicate?',
          options: [
            'The logging system restarted and reset the counter',
            'Log entries were deleted, suggesting evidence tampering',
            'The authentication service experienced a brief outage',
            'High transaction volume caused out-of-order log writes',
          ],
          correctIndex: 1,
          explanation:
            'Sequential log entry gaps are a classic indicator of log tampering. Attackers who delete log entries often overlook that most logging systems use monotonically increasing sequence numbers — the jump from 100,450 to 100,512 means 61 entries were removed. A system restart would typically create a new log file with a fresh timestamp, not a mid-stream sequence gap. Out-of-order writes produce duplicate or disordered entries, not gaps.',
          memoryHack:
            'Log sequence gaps = missing pages in the embassy sign-in book. If entry 100,450 is followed by 100,512, someone tore out 61 pages. Attackers who delete logs rarely think about sequence numbers.',
          conceptName: 'Log Review and Analysis',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Dialogue 3 — Kai introduces SAST vs DAST ────────────────
        {
          type: 'dialogue',
          id: 'd6a2-dialogue-3',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'After log analysis, we needed to understand why the auth service was vulnerable in the first place. That means looking at the code — and we do that two ways: SAST and DAST. Static analysis reads the code like an editor reviewing a manuscript for typos before printing. Dynamic analysis actually runs the manuscript as a play and sees what goes wrong during the performance.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Knowledge Check 3 — SAST vs DAST ────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a2-kc-3',
          question:
            'Which of the following is a characteristic of Dynamic Application Security Testing (DAST)?',
          options: [
            'It analyzes source code without executing the application',
            'It requires access to source code to function',
            'It tests the running application by sending crafted inputs and analyzing responses',
            'It is performed only after the application is deployed to production',
          ],
          correctIndex: 2,
          explanation:
            'DAST tests the running application — it sends inputs (HTTP requests, API calls, malformed data) and analyzes the application\'s responses to identify vulnerabilities at runtime. DAST is "black box" — it does not require source code access. SAST analyzes source code without executing it. DAST can be performed in any environment — it is not limited to production; in fact, pre-production testing is preferred.',
          memoryHack:
            'SAST = reading the script for errors. DAST = watching the live performance and seeing what falls apart. SAST needs the script (source code). DAST needs the stage (running application). S = Static (no running). D = Dynamic (running and responding).',
          conceptName: 'SAST vs DAST',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Think Like Manager — Security Metrics review ─────────────
        {
          type: 'thinkLikeManager',
          id: 'd6a2-tlatm-1',
          scenario:
            'Director Reeves is reviewing the post-breach metrics report. The MTTD (Mean Time to Detect) was 14.2 hours. The MTTR (Mean Time to Respond) was 6.8 hours. The industry benchmark for MTTD is under 4 hours. The security team argues this happened because the SIEM alerting threshold was set too high to avoid alert fatigue.',
          question:
            'As a security manager reviewing this incident, what should be the PRIMARY corrective action?',
          options: [
            'Hire more SOC analysts to manually review all alerts in real time',
            'Lower the SIEM alert threshold to catch more events, and accept the increased alert volume',
            'Tune alert thresholds using behavioral baselines so that high-fidelity alerts are generated without alert fatigue',
            'Replace the SIEM with a different product that has lower out-of-box thresholds',
          ],
          correctIndex: 2,
          explanation:
            'Tuning alert thresholds using behavioral baselines (UEBA — User and Entity Behavior Analytics) is the mature response. Simply lowering thresholds floods analysts with noise and creates MORE fatigue, not less — resulting in real alerts being buried. Adding headcount is expensive and doesn\'t fix the root cause. Replacing the SIEM is drastic and expensive without evidence the tool is the problem rather than the configuration.',
          managerInsight:
            'MTTD and MTTR are KRIs — Key Risk Indicators. High MTTD means the attacker dwell time increases; longer dwell = more damage. On the exam, when alert fatigue is cited as a reason for high MTTD, the answer is ALWAYS "tune the rules" — not "hire more people" or "add more alerts." Managers fix the signal-to-noise ratio, not just the headcount.',
          conceptName: 'Security Metrics',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
          rightCharacter: 'director_reeves',
          rightExpression: 'worried',
        },

        // ─── Visual Aid — Security Metrics reference table ────────────
        {
          type: 'visualAid',
          id: 'd6a2-visual-2',
          title: 'Security Metrics Cheat Sheet',
          aidType: 'table',
          headers: ['Metric', 'What It Measures', 'Type', 'Lower Is Better?'],
          rows: [
            ['MTTD', 'Mean Time to Detect an incident', 'KRI', 'Yes'],
            ['MTTR', 'Mean Time to Respond/Recover', 'KRI', 'Yes'],
            ['Patch Cadence', 'Time from patch release to deployment', 'KPI', 'Yes'],
            ['Vulnerability Density', 'Vulnerabilities per 1,000 lines of code', 'KRI', 'Yes'],
            ['Coverage Rate', '% of systems scanned in last 30 days', 'KPI', 'No — higher is better'],
            ['False Positive Rate', '% of alerts that are not real incidents', 'KPI', 'Yes'],
          ],
          speaker: 'kai',
          dialogue:
            'KPIs measure performance of your program. KRIs measure the level of risk you\'re carrying. Both belong in your security metrics dashboard. The exec team cares most about the KRIs — they translate risk into business language.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ─── Knowledge Check 4 — MTTD vs MTTR distinction ────────────
        {
          type: 'knowledgeCheck',
          id: 'd6a2-kc-4',
          question:
            'An organization\'s security program sets a target of reducing MTTD from 18 hours to under 4 hours. What improvement will this change MOST directly achieve?',
          options: [
            'It will reduce the number of vulnerabilities in production systems',
            'It will shorten the attacker\'s dwell time inside the environment',
            'It will eliminate the need for penetration testing',
            'It will increase the organization\'s patch cadence',
          ],
          correctIndex: 1,
          explanation:
            'MTTD (Mean Time to Detect) directly determines attacker dwell time — the window between initial compromise and detection. Shorter detection time = shorter window for the attacker to cause damage, exfiltrate data, or establish persistence. Reducing MTTD does not reduce the number of vulnerabilities (that requires scanning and patching), eliminate the need for pentesting, or change how fast patches are applied.',
          memoryHack:
            'MTTD = how long the burglar was in your house before you realized. The longer the dwell time, the more they can take. Cut MTTD and you cut the dwell time. Short MTTD = fast alarm, less damage.',
          conceptName: 'Security Metrics',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },
      ],
    },

    // Acts 3, 4, 5 not yet authored
    null,
    null,
    null,
  ],
};
