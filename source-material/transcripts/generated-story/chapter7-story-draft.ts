import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter7: DomainChapterDefinition = {
  domainId: 7,
  title: 'The War Room',
  location: 'SOC War Room, New York',
  locationGradient: 'linear-gradient(135deg, #0f1923 0%, #1a2d1a 50%, #0f1923 100%)',
  acts: [
    // ================================================================
    // ACT 1 — "Six Phases of the Bomb"
    // Concepts: PICERL Incident Response, Change Management,
    // Configuration Management (CMDB/baselines/drift), Patch Management
    // ================================================================
    {
      actNumber: 1,
      title: 'Six Phases of the Bomb',
      description:
        'Janet Park runs the SOC War Room as the Shadow Protocol breach escalates to a live incident. The team must execute incident response in real time — while managing unauthorized changes and a configuration drift problem that made the breach possible.',
      xpReward: 150,
      conceptsCovered: [
        'Incident Response Process (PICERL)',
        'Change Management (RFC/CAB/Emergency Change)',
        'Configuration Management (CMDB/Baselines/Drift)',
        'Patch Management',
      ],
      estimatedMinutes: 20,
      nodes: [
        // ─── Transition ──────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd7a1-transition-1',
          location: 'New York',
          description: 'Nexus SOC War Room — 47th Floor, Manhattan',
          animation: 'fade',
          timeSkipText: 'Concurrent with forensics analysis in Tel Aviv — the New York SOC is managing live incident response',
        },

        // ─── Dialogue 1 — Janet opens the situation ───────────────────
        {
          type: 'dialogue',
          id: 'd7a1-dialogue-1',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Welcome back to New York, {player}. We have a live incident in progress. I need you to understand exactly what we\'re doing and why. Incident response isn\'t chaos — it\'s a six-phase sequence. I call it "Six Phases of the Bomb." Miss a step and the device goes off. Do them in order and everyone walks away.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Dialogue 2 — Janet lays out PICERL ──────────────────────
        {
          type: 'dialogue',
          id: 'd7a1-dialogue-2',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Prepare the EOD kit. Identify the device type. Contain the blast radius. Eradicate the trigger. Recover the normal route. Document the Lessons Learned for next time. PICERL. Each phase has a job. We\'re currently in Containment — we identified the compromised systems and we\'re cutting them off from the network.',
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Evidence 1 — Live Incident Status Board ─────────────────
        {
          type: 'evidence',
          id: 'd7a1-evidence-1',
          title: 'NEXUS SOC — Live Incident Status — SHADOW-PROTOCOL-001',
          classification: 'TOP SECRET',
          content:
            'Real-time incident response tracking for Operation Shadow Protocol. Six-phase PICERL model. Current phase: Containment.',
          evidenceItems: [
            { label: 'Phase 1 — Prepare', value: 'COMPLETE — IR playbooks active, team mobilized, communication tree open', highlight: false },
            { label: 'Phase 2 — Identify', value: 'COMPLETE — 3 systems confirmed compromised, attacker TTPs documented', highlight: false },
            { label: 'Phase 3 — Contain', value: 'IN PROGRESS — network segment isolated, compromised accounts disabled', highlight: true },
            { label: 'Phase 4 — Eradicate', value: 'PENDING — malware and backdoor removal, root cause patch', highlight: false },
            { label: 'Phase 5 — Recover', value: 'PENDING — restore from clean backups, validate system integrity', highlight: false },
            { label: 'Phase 6 — Lessons Learned', value: 'PENDING — post-incident review within 72 hours of resolution', highlight: false },
          ],
          speaker: 'janet',
          speakerSide: 'left',
          dialogue:
            'We cannot skip to Recovery before Eradication is complete. If we restore systems before removing the root cause, we just restore the vulnerability. The bomb defuser doesn\'t declare success until the trigger is actually removed.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 1 — PICERL ordering ─────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a1-kc-1',
          question:
            'During incident response, the SOC has confirmed the attacker\'s presence and isolated affected systems. Which phase should occur NEXT, in order?',
          options: [
            'Recovery — restore systems from backup immediately to minimize downtime',
            'Lessons Learned — document what happened while details are fresh',
            'Eradication — remove the attacker\'s presence and root cause from all systems',
            'Identification — continue searching for additional compromised systems',
          ],
          correctIndex: 2,
          explanation:
            'After Containment (isolating affected systems), the next phase is Eradication — removing the attacker\'s tools, malware, backdoors, and the root cause vulnerability from all affected systems. Recovery must come AFTER Eradication to ensure you are not restoring a compromised state. Lessons Learned is the final phase. Identification was the phase before Containment, not after it.',
          memoryHack:
            'P-I-C-E-R-L: "Please Immediately Contain Every Reactive Loss." After Contain comes Eradicate. You can\'t restore a system that still has a bomb in it. Contain first, then pull the trigger mechanism out entirely, THEN restore.',
          conceptName: 'Incident Response Process',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Dialogue 3 — Janet introduces change management ─────────
        {
          type: 'dialogue',
          id: 'd7a1-dialogue-3',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Here\'s something that directly contributed to this breach, {player}. Three weeks ago, a developer made an unauthorized change to the authentication service configuration — no Request for Change, no Change Advisory Board review. It bypassed a security control that would have prevented this exact exploit. Change management isn\'t bureaucracy. It\'s how we stop well-meaning people from accidentally opening doors for attackers.',
          leftCharacter: 'janet_park',
          leftExpression: 'angry',
          rightCharacter: 'player',
          rightExpression: 'surprised',
        },

        // ─── Visual Aid — Change Management process ───────────────────
        {
          type: 'visualAid',
          id: 'd7a1-visual-1',
          title: 'Change Management Process — RFC → CAB → Implementation',
          aidType: 'list',
          items: [
            {
              label: 'RFC (Request for Change)',
              description:
                'A formal documented request to make a change. Includes what is changing, why, what systems are affected, rollback plan, and risk assessment. No change happens without an RFC on file.',
            },
            {
              label: 'CAB (Change Advisory Board)',
              description:
                'A standing committee (IT, security, operations, business) that reviews RFCs for impact, risk, and scheduling. Standard changes require CAB approval. Emergency changes require expedited CAB or a designated authority.',
            },
            {
              label: 'Emergency Change',
              description:
                'For critical incidents requiring immediate action. Bypasses normal CAB schedule but MUST still be documented, approved by an authorized emergency authority, and reviewed after implementation. Emergency does not mean undocumented.',
            },
            {
              label: 'Post-Implementation Review',
              description:
                'Every change — standard or emergency — is reviewed after implementation to confirm it achieved its goal without introducing new problems.',
            },
          ],
          speaker: 'janet',
          dialogue:
            'The unauthorized change that opened the door wasn\'t malicious — the developer thought they were optimizing performance. But without RFC and CAB review, nobody caught that the change removed a critical validation step in the authentication flow.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 2 — Change management ────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a1-kc-2',
          question:
            'A critical production system has a live outage affecting 10,000 customers. A patch exists but has not been approved by the Change Advisory Board. What is the BEST course of action?',
          options: [
            'Apply the patch immediately — outage severity justifies bypassing change management',
            'Wait for the next scheduled CAB meeting, even if it is two weeks away',
            'Initiate an emergency change process: get expedited authorization, document the change, and apply the patch',
            'Roll back the system to a previous version without filing any documentation',
          ],
          correctIndex: 2,
          explanation:
            'Emergency change processes exist for exactly this scenario. Emergency changes bypass the normal CAB schedule, but they still require authorization (from a designated emergency approver), documentation, and post-implementation review. "Emergency" is not a synonym for "undocumented." Skipping all process entirely (option A or D) means no accountability and no way to reproduce or reverse the change safely.',
          memoryHack:
            'Emergency change = fast lane, not no lane. You still need a ticket. Faster authorization, faster approval — but ALWAYS document. The change must be retroactively reviewed by CAB within 24-72 hours.',
          conceptName: 'Change Management',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 4 — Janet introduces config management ─────────
        {
          type: 'dialogue',
          id: 'd7a1-dialogue-4',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'One more root cause we need to talk about: configuration drift. Our CMDB — Configuration Management Database — had the auth service listed with a specific security baseline. When I compared the live system to that baseline, there were 23 differences. Twenty-three settings that had changed from the approved secure configuration. Nobody noticed for months.',
          leftCharacter: 'janet_park',
          leftExpression: 'worried',
          rightCharacter: 'player',
          rightExpression: 'surprised',
        },

        // ─── Timed Decision — Configuration drift response ────────────
        {
          type: 'timedDecision',
          id: 'd7a1-td-1',
          scenario:
            'Your automated configuration scanner just flagged 47 production servers as having drifted from their approved security baselines. 12 of the deviations involve disabled audit logging. The systems are live and serving customers.',
          timeLimit: 30,
          conceptName: 'Configuration Management',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          options: [
            {
              text: 'Prioritize the 12 systems with disabled audit logging — re-enable logging first, then schedule remediation of remaining drift in a maintenance window.',
              isOptimal: true,
              feedback:
                'Correct prioritization. Disabled audit logging is the most dangerous drift because it means you have blind spots — you cannot detect or investigate incidents on those systems. Re-enabling logging first restores visibility. Remaining drift can follow normal change management through a maintenance window.',
              xpBonus: 25,
            },
            {
              text: 'Immediately force all 47 systems back to baseline configuration without a maintenance window.',
              isOptimal: false,
              feedback:
                'Forcing baseline rollback without a maintenance window could cause outages. Some drift may be intentional and approved but not yet reflected in the CMDB. Immediate uncontrolled remediation of 47 production servers is high risk. Prioritize and schedule.',
            },
            {
              text: 'Log the findings in the risk register and schedule review for next quarter\'s audit.',
              isOptimal: false,
              feedback:
                'Quarterly deferral of 12 systems with disabled audit logging is unacceptable. You cannot manage security incidents on systems you cannot see. Audit logging restoration should happen within hours, not months.',
            },
          ],
        },

        // ─── Knowledge Check 3 — CMDB and baselines ──────────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a1-kc-3',
          question:
            'What is the PRIMARY purpose of a Configuration Management Database (CMDB)?',
          options: [
            'To serve as a backup repository for production data',
            'To track authorized configurations of IT assets and their relationships',
            'To log all user authentication events across the network',
            'To store patch binaries for rapid deployment during incidents',
          ],
          correctIndex: 1,
          explanation:
            'A CMDB is a centralized record of IT assets (configuration items), their approved configurations, and the relationships between them. It is the authoritative source of truth for what the environment SHOULD look like — enabling configuration drift detection when live systems are compared against the CMDB baseline. It is not a backup system, an authentication log, or a patch repository.',
          memoryHack:
            'CMDB = the official blueprint of your entire IT estate. When a wall moves, the blueprint catches it. Configuration drift detection compares the live building to the blueprint. Drift = any room that doesn\'t match the plan.',
          conceptName: 'Configuration Management',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ─── Think Like Manager — Patch management prioritization ──────
        {
          type: 'thinkLikeManager',
          id: 'd7a1-tlatm-1',
          scenario:
            'The CISO presents three patch scenarios to Director Reeves: (A) 200 workstations with a CVSS 4.2 patch — must reboot; (B) 8 internet-facing servers with a CVSS 9.1 critical patch — no reboot required; (C) 1 internal HR server with a CVSS 6.5 patch — limited exposure. Patching resources can only address one scenario today.',
          question:
            'Which scenario should be patched FIRST?',
          options: [
            'Scenario A — most systems affected, highest business disruption if compromised',
            'Scenario B — highest severity, internet-facing systems represent highest actual risk',
            'Scenario C — HR server holds sensitive data requiring priority protection',
            'Address all three simultaneously — splitting the team is most efficient',
          ],
          correctIndex: 1,
          explanation:
            'Patch prioritization combines CVSS severity AND exposure. Scenario B: CVSS 9.1 (critical) on internet-facing servers means active, remotely exploitable vulnerabilities with no reboot required — lowest friction, highest risk. Scenario A has moderate severity despite the number of systems. Scenario C has moderate severity and limited exposure. Number of systems alone does not determine priority — severity and exposure position do.',
          managerInsight:
            'Patch management is a resource allocation problem, not a sequential queue. Think like a triage nurse: the most critical patient with the most accessible treatment goes first. CVSS score × exposure = effective risk priority. "Internet-facing + critical" beats "many systems + moderate" every time.',
          conceptName: 'Patch Management',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'director_reeves',
          rightExpression: 'neutral',
        },
      ],
    },

    // ================================================================
    // ACT 2 — "The Evidence Vault"
    // Concepts: Digital Forensics (chain of custody, order of volatility,
    // write blockers, forensic hashing), Backup Strategies (3-2-1, RTO/RPO),
    // Personnel Security Operations, Malware Defense (EDR/XDR/sandboxing)
    // ================================================================
    {
      actNumber: 2,
      title: 'The Evidence Vault',
      description:
        'With the incident contained, the team pivots to forensic evidence collection — and discovers the attacker left a more sophisticated malware payload than expected. Janet and Kai coordinate digital forensics, backup recovery, and personnel security revelations.',
      xpReward: 200,
      conceptsCovered: [
        'Digital Forensics (Chain of Custody, Order of Volatility, Write Blockers, Forensic Hashing)',
        'Backup Strategies (Full/Incremental/Differential, 3-2-1 Rule, RTO vs RPO)',
        'Personnel Security Operations (Separation of Duties, Job Rotation, Mandatory Vacation)',
        'Malware Defense (EDR/XDR, Sandboxing)',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ─── Transition ──────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd7a2-transition-1',
          location: 'New York',
          description: 'Nexus SOC War Room — 6 hours into active incident response',
          animation: 'fade',
        },

        // ─── Dialogue 1 — Kai joins the war room via video feed ───────
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-1',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Janet, {player} — Kai here from Tel Aviv. Before you touch those compromised systems for evidence collection, I need to walk you through forensic procedure. If we grab the wrong data in the wrong order, or contaminate the evidence chain, nothing we find will stand up in a legal proceeding.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
          rightCharacter: 'janet_park',
          rightExpression: 'neutral',
        },

        // ─── Dialogue 2 — Kai introduces order of volatility ─────────
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-2',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Think of forensic collection like crime scene triage. You photograph the chalk outline before touching anything. CPU registers die the moment the power flickers — collect those first. RAM disappears when the system shuts down — collect that second. Disk survives power loss. Logs sit on disk or a remote server. Always collect in order of volatility: most perishable evidence first.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Evidence 1 — Order of Volatility reference ───────────────
        {
          type: 'evidence',
          id: 'd7a2-evidence-1',
          title: 'Digital Forensics — Order of Volatility',
          classification: 'CLASSIFIED',
          content:
            'RFC 3227 establishes the order of evidence collection based on volatility — how quickly evidence disappears. Always collect the most volatile evidence first. Think of it as photographing a crime scene before the rain comes.',
          evidenceItems: [
            { label: '1. CPU Registers & Cache', value: 'Nanoseconds — lost on any interruption. Contains currently executing instructions.', highlight: true },
            { label: '2. RAM / Physical Memory', value: 'Lost on power loss or restart. Contains running processes, open files, decrypted keys, active network connections.', highlight: true },
            { label: '3. Swap / Virtual Memory (Pagefile)', value: 'Partially volatile. Pages out to disk but can be overwritten rapidly.' },
            { label: '4. Network Connections', value: 'Active connections disappear when sessions close. Capture netstat output immediately.' },
            { label: '5. Running Processes', value: 'Visible only while running. Process list and open handles should be captured early.' },
            { label: '6. Disk (Non-volatile)', value: 'Survives power loss. Image the disk using a forensic write-blocker AFTER volatile evidence is secured.', highlight: false },
            { label: '7. Remote Logs', value: 'Most durable. Logs forwarded to a SIEM or remote server are hardest to tamper with.' },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'We almost lost the most valuable evidence — the attacker\'s decryption keys were in RAM. Kai\'s team imaged memory before restarting the systems.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 1 — Order of volatility ─────────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a2-kc-1',
          question:
            'During a live forensic investigation of a running server, in which order should the following evidence types be collected? (1) Disk image, (2) RAM contents, (3) Running process list, (4) CPU registers',
          options: [
            '1 → 2 → 3 → 4',
            '4 → 3 → 2 → 1',
            '2 → 4 → 3 → 1',
            '4 → 2 → 3 → 1',
          ],
          correctIndex: 3,
          explanation:
            'Correct order of volatility (most to least volatile): CPU registers (4) → RAM contents (2) → Running processes (3) → Disk image (1). CPU registers are lost on any interrupt. RAM is lost on power off. Running process lists persist as long as processes run but are destroyed on shutdown. Disk images are non-volatile and can be collected last.',
          memoryHack:
            'Crime scene triage: photograph the footprints before the rain (CPU registers) → bag the witnesses before they leave (RAM) → note who\'s still at the scene (processes) → then secure the building blueprints (disk). Most perishable first.',
          conceptName: 'Digital Forensics',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 3 — Janet explains chain of custody ────────────
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-3',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Kai — once we image those disks, talk to {player} about chain of custody. I need them to understand why every handoff matters. This could end up in a courtroom.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'kai_tanaka',
          rightExpression: 'neutral',
        },

        // ─── Dialogue 4 — Kai on chain of custody and write blockers ──
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-4',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Think of chain of custody like an evidence tag on a seized weapon. Break the seal improperly and it\'s inadmissible in court. For digital evidence, we use two tools to preserve integrity: write blockers — hardware devices that let us read a drive without writing a single bit to it — and forensic hashing — we generate a SHA-256 hash of the disk image before and after every step. If the hash changes, the image is contaminated.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Knowledge Check 2 — Forensic hashing purpose ────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a2-kc-2',
          question:
            'What is the PRIMARY purpose of generating a cryptographic hash of a forensic disk image immediately after acquisition?',
          options: [
            'To encrypt the image and prevent unauthorized access',
            'To compress the image for storage efficiency',
            'To verify that the image has not been altered from the original',
            'To identify which files on the disk are malicious',
          ],
          correctIndex: 2,
          explanation:
            'Forensic hashing establishes integrity — it creates a mathematical fingerprint of the evidence at the moment of collection. If the hash of the working copy matches the original acquisition hash, the evidence is provably unmodified. This is the foundation of digital chain of custody. It does not encrypt the image (that would hide the evidence), compress it, or identify malware.',
          memoryHack:
            'Forensic hash = tamper-evident seal. If the seal is unbroken (hash matches), the evidence is authentic. If the hash changes, someone touched the evidence after sealing. SHA-256 is the seal that cannot be forged.',
          conceptName: 'Digital Forensics',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 5 — Janet pivots to backup recovery ────────────
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-5',
          speaker: 'janet',
          speakerSide: 'left',
          text: '{player}, while Kai\'s team handles forensics, we need to talk about recovery. The three affected systems need to be restored from clean backups. But first I need to know: what backups do we have, and can we meet our recovery targets?',
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'neutral',
        },

        // ─── Evidence 2 — Backup Strategy Status ─────────────────────
        {
          type: 'evidence',
          id: 'd7a2-evidence-2',
          title: 'Nexus Backup Infrastructure — Recovery Assessment',
          classification: 'CONFIDENTIAL',
          content:
            'Assessment of backup coverage and recovery targets for the three systems affected by Shadow Protocol. The 3-2-1 backup rule requires 3 copies of data, on 2 different media types, with 1 copy stored offsite (geographically separate from primary location). Think of it as spy tradecraft: 3 copies of the asset, 2 different media formats, 1 in a geographically separate safehouse.',
          evidenceItems: [
            { label: 'Authentication Service', value: 'Last clean backup: 72 hours ago | RTO: 4 hours | RPO: 24 hours | 3-2-1 compliant: YES', highlight: false },
            { label: 'Financial Database', value: 'Last clean backup: 24 hours ago | RTO: 2 hours | RPO: 4 hours | 3-2-1 compliant: YES', highlight: false },
            { label: 'Customer Portal', value: 'Last clean backup: 8 days ago | RTO: 6 hours | RPO: 24 hours | 3-2-1 compliant: NO — no offsite copy', highlight: true },
            { label: 'Backup Type Used', value: 'Full weekly + incremental daily. Last full: Sunday. Incrementals Mon-Thu applied in chain.' },
            { label: 'Recovery Gap Risk', value: 'Customer Portal restoration requires incremental chain from 8-day-old full — high complexity, elevated risk of corruption', highlight: true },
          ],
          speaker: 'janet',
          speakerSide: 'left',
          dialogue:
            'The Customer Portal is our problem. No offsite copy, and a stale full backup means we\'re reconstructing from a long incremental chain. One corrupt link in that chain and we lose data.',
          leftCharacter: 'janet_park',
          leftExpression: 'worried',
        },

        // ─── Visual Aid — Backup types comparison ─────────────────────
        {
          type: 'visualAid',
          id: 'd7a2-visual-1',
          title: 'Backup Types — Full, Incremental, Differential',
          aidType: 'comparison',
          headers: ['Type', 'What It Captures', 'Backup Speed', 'Restore Complexity', 'Storage Use'],
          rows: [
            ['Full', 'Everything — complete copy of all data', 'Slowest', 'Simplest — one set', 'Highest'],
            ['Incremental', 'Only data changed SINCE last backup (full or incremental)', 'Fastest', 'Complex — full + all incrementals in sequence', 'Lowest'],
            ['Differential', 'All data changed SINCE last full backup', 'Medium', 'Medium — full + latest differential only', 'Medium'],
          ],
          speaker: 'janet',
          dialogue:
            'Incremental is efficient for daily backups but creates a dependency chain. If incremental #3 of 7 is corrupt, everything after it is unrecoverable. Differential is a compromise — slightly more storage, but you only need the full + the latest diff to restore.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 3 — RTO vs RPO ──────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd7a2-kc-3',
          question:
            'The Financial Database has an RPO of 4 hours. The last clean backup was taken 18 hours ago. What is the business implication of this situation?',
          options: [
            'Recovery will take 4 hours — this is within the recovery time objective',
            'Up to 18 hours of transaction data may be unrecoverable, exceeding the 4-hour RPO',
            'The system cannot be restored because the backup age exceeds the RTO',
            'The 4-hour RPO means 4 hours of downtime is acceptable after restoration',
          ],
          correctIndex: 1,
          explanation:
            'RPO (Recovery Point Objective) defines the maximum acceptable data loss measured in time — in this case, 4 hours. If the last backup was 18 hours ago, restoring from that backup means losing up to 18 hours of changes — which far exceeds the 4-hour RPO. RTO is about recovery TIME (how long to get back online). RPO is about data loss (how much data can you afford to lose). They are different metrics.',
          memoryHack:
            'RTO = "how long until we\'re back?" (time to recover). RPO = "how far back do we rewind the clock?" (data loss tolerance). RPO = the age of your backup matters. 18-hour-old backup + 4-hour RPO = 14 hours of unacceptable data loss.',
          conceptName: 'Backup Strategies',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ─── Think Like Manager — Personnel security revelation ────────
        {
          type: 'thinkLikeManager',
          id: 'd7a2-tlatm-1',
          scenario:
            'Post-incident investigation reveals that the developer who made the unauthorized configuration change also managed the backup rotation and the access provisioning for their team — with no review. The developer had been in the same role for four years with no mandatory vacation enforced. When a colleague covered for two days of sick leave, they noticed the configuration anomalies and raised the alert.',
          question:
            'Which personnel security control, if properly implemented, would MOST likely have detected or prevented this situation earlier?',
          options: [
            'Background checks — the developer may have had a criminal history',
            'Mandatory vacation policy — gaps in coverage reveal fraud and misconfiguration faster',
            'Security clearance upgrades for all developers with production access',
            'Non-disclosure agreements — the developer may have been colluding with the attacker',
          ],
          correctIndex: 1,
          explanation:
            'Mandatory vacation (forced leave) is specifically designed to uncover fraud, unauthorized activity, and accumulated privileges. When a replacement covers someone\'s job, they often discover anomalies the original employee had hidden or simply overlooked. Job rotation serves a similar function. Separation of duties would also apply here — one person should not control backups, access provisioning, AND configurations simultaneously. Background checks are preventive before hiring, not detective after years of employment.',
          managerInsight:
            'Mandatory vacation is a detective control disguised as a policy. On the CISSP exam, when you see "a replacement discovered the problem," the concept being tested is almost always mandatory vacation or job rotation. These controls work because they force a second set of eyes onto sensitive duties without warning the incumbent. Think of it as random auditing built into HR policy.',
          conceptName: 'Personnel Security Operations',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'director_reeves',
          rightExpression: 'angry',
        },

        // ─── Dialogue 6 — Janet on malware defense findings ───────────
        {
          type: 'dialogue',
          id: 'd7a2-dialogue-6',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'One last piece of this puzzle, {player}. Our EDR caught something we\'d have missed with a legacy antivirus. The attacker left a backdoor that communicates in encrypted traffic on port 443 — completely normal-looking on the wire. The EDR flagged it based on behavioral patterns, not signatures. Sandboxing confirmed the payload. That\'s the difference between pattern-matching security and behavioral security.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Knowledge Check 4 — EDR vs antivirus, sandboxing ────────
        {
          type: 'knowledgeCheck',
          id: 'd7a2-kc-4',
          question:
            'Traditional antivirus missed a piece of malware because it used polymorphic code with no matching signature. Which technology would MOST likely have detected it?',
          options: [
            'A firewall with updated signature rules',
            'Endpoint Detection and Response (EDR) using behavioral analysis',
            'A next-generation antivirus with larger signature databases',
            'A web application firewall with SSL inspection',
          ],
          correctIndex: 1,
          explanation:
            'EDR (Endpoint Detection and Response) uses behavioral analysis — monitoring what a process DOES, not just what it looks like. Polymorphic malware changes its signature with each iteration but its behavior (process injection, registry modification, C2 beaconing) remains consistent. Behavioral detection catches what signature-based tools miss. A larger signature database still fails against novel malware. Firewalls and WAFs operate at the network/application layer, not the endpoint behavior layer.',
          memoryHack:
            'AV = wanted poster (catch the face you know). EDR = behavior profiler (catch anyone acting like a criminal, regardless of face). Polymorphic malware changes its face. Behavioral detection catches the walk, not the face.',
          conceptName: 'Malware Defense',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },
      ],
    },

    null,
    null,
    null,
  ],
};
