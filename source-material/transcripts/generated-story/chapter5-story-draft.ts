import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter5: DomainChapterDefinition = {
  domainId: 5,
  title: 'The Identity Crisis',
  location: 'Nexus Office, London',
  locationGradient: 'linear-gradient(135deg, #1a1020 0%, #2a0a1a 50%, #1a1a30 100%)',
  acts: [
    // ─── ACT 1: The Credential Trail ──────────────────────────────────────────
    {
      actNumber: 1,
      title: 'The Credential Trail',
      description: 'Investigate how a stolen credential combined with a legacy SSO system enabled cross-domain access across the Nexus empire.',
      xpReward: 150,
      conceptsCovered: [
        'Authentication Factors',
        'Multi-Factor Authentication',
        'Biometric Error Rates (FAR/FRR/CER)',
        'Kerberos',
        'Single Sign-On',
      ],
      estimatedMinutes: 22,
      nodes: [
        // ── Transition: Arrival ─────────────────────────────────────────────
        {
          type: 'transition',
          id: 'ch5-act1-transition-arrival',
          location: 'Nexus UK Headquarters — Canary Wharf, London',
          description: 'Forty-two floors above the Thames. The operational headquarters for the Nexus European division. The building houses the identity infrastructure that authenticates 23,000 employees across 8 countries. One compromised account got the attacker into all of them.',
          animation: 'glitch',
          timeSkipText: '96 hours after the Singapore incident',
        },

        // ── Dialogue 1: Morales briefs the player ────────────────────────────
        {
          type: 'dialogue',
          id: 'ch5-act1-d1',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "{player}. The credential we're tracking belonged to a Senior Network Architect. High-privilege account, access to infrastructure across seven Nexus facilities. The attacker obtained it through a phishing email — but that's not the interesting part. The interesting part is what they did with it. One credential. One login. Eight countries of access. I need you to understand exactly how that's possible and where it should have failed.",
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Dialogue 2: Authentication factors intro ──────────────────────────
        {
          type: 'dialogue',
          id: 'ch5-act1-d2',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "Let's start with the authentication model. MI6 doesn't let an agent walk into headquarters with just a code word. They need the code word — and the badge — and the biometric scan — and they need to physically be in London. Authentication factors work the same way. The Nexus architect's account used exactly one factor: a password. That's where this starts.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Visual Aid: Authentication factors ───────────────────────────────
        {
          type: 'visualAid',
          id: 'ch5-act1-va1',
          title: 'Authentication Factors — The Five Types',
          aidType: 'list',
          items: [
            {
              label: 'Type 1: Knowledge (Something You Know)',
              description: 'Passwords, PINs, passphrases, security questions. Lowest assurance — can be shared, guessed, stolen, or phished. The code word at the door. Weak alone because knowledge can be transferred.',
            },
            {
              label: 'Type 2: Possession (Something You Have)',
              description: 'Hardware tokens, smart cards, mobile authenticator apps (TOTP), physical keys, PIV cards. Stronger because it requires physical access to the object — but tokens can be stolen and SIM-swapping can defeat SMS-based possession factors.',
            },
            {
              label: 'Type 3: Inherence (Something You Are)',
              description: 'Biometrics: fingerprint, retina scan, iris scan, face recognition, voice pattern. Difficult to transfer or replicate at scale — but biometric templates cannot be changed if compromised, and biometric systems have measurable error rates.',
            },
            {
              label: 'Type 4: Location (Somewhere You Are)',
              description: 'Geographic location constraints: the user must be physically in a specific location (country, network, IP range). GPS coordinates, IP geolocation, network topology. Used as an additional factor or adaptive authentication trigger — "this login is from Russia but the account is London-based."',
            },
            {
              label: 'Type 5: Behavior (Something You Do)',
              description: 'Behavioral patterns: typing cadence, mouse movement patterns, gait analysis, behavioral biometrics. Passive and continuous — can authenticate throughout a session, not just at login. Emerging as an additional layer in risk-based authentication systems.',
            },
          ],
          speaker: 'Agent Morales',
          dialogue: "MFA means combining factors from different TYPE categories. Combining two passwords is NOT MFA — both are Type 1. You need factors from at least two different categories to qualify as multi-factor.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Knowledge Check 1: MFA ────────────────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act1-kc1',
          question: "A system authenticates users with a password and a 4-digit PIN. An executive argues this is multi-factor authentication because two separate credentials are required. Is the executive correct?",
          options: [
            'Yes — two separate credentials from two separate systems constitutes MFA',
            'No — both a password and a PIN are Type 1 (knowledge) factors; MFA requires factors from at least two different categories',
            'Yes — the number of authentication steps determines whether MFA is satisfied',
            'No — MFA requires at least three factors, not two',
          ],
          correctIndex: 1,
          explanation: "Multi-Factor Authentication requires factors from at least two DIFFERENT categories of the five factor types. Both a password and a PIN are Type 1 (knowledge) factors — they're both things you know. Combining two knowledge factors is multi-step authentication or two-step verification, but it is NOT MFA. An attacker who obtains your password through phishing can also obtain your PIN through the same phishing page. Using a password (Type 1) plus a hardware token (Type 2) IS MFA, because stealing one factor doesn't compromise the other.",
          memoryHack: "MFA = different TYPE categories, not just more steps. Password + PIN = two locks on the same door. Password + hardware token = locks on different doors. The attacker needs different attack vectors to defeat each.",
          conceptName: 'Multi-Factor Authentication',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Evidence 1: Biometric system failure ─────────────────────────────
        {
          type: 'evidence',
          id: 'ch5-act1-e1',
          title: 'Biometric System Analysis — London Server Room Badge',
          classification: 'CONFIDENTIAL',
          content: `## Biometric Access Control — Error Rate Analysis\n\nNexus London's server room uses fingerprint biometrics as a second factor for physical access. Audit of the biometric system settings revealed the following configuration:\n\n| Metric | Current Setting | Industry Recommendation |\n|---|---|---|\n| False Acceptance Rate (FAR) | 0.8% | < 0.1% for high-security environments |\n| False Rejection Rate (FRR) | 0.2% | Balanced to operational tolerance |\n| Crossover Error Rate (CER/EER) | 0.5% | The threshold where FAR = FRR |\n\n### Implication\nAt the current FAR of 0.8%, an attacker making 125 attempts would statistically receive one false acceptance — meaning the system would grant access to an unauthorized fingerprint. For a server room accessed 500+ times per day, the probability of a false acceptance in any given day is statistically significant.\n\n### Finding\nThe biometric sensitivity had been reduced (FAR increased, FRR decreased) after staff complained about being locked out repeatedly. Operational convenience was prioritized over security accuracy.`,
          evidenceItems: [
            { label: 'FAR (False Acceptance)', value: '0.8% — too permissive for secure zone', highlight: true },
            { label: 'FRR (False Rejection)', value: '0.2% — operationally convenient', highlight: false },
            { label: 'CER/EER', value: '0.5% — crossover point of the system', highlight: false },
            { label: 'Setting Changed By', value: 'Facilities team — no security review', highlight: true },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "Every biometric system has two tunable error rates. The FAR is how often it lets the wrong person in. The FRR is how often it locks the right person out. Lower the FAR and you increase security — but more legitimate users get frustrated. Nexus chose convenience over security.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Knowledge Check 2: Biometric error rates ─────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act1-kc2',
          question: "A biometric access system is configured for maximum security. As the FAR is decreased (fewer false acceptances), what happens to the FRR?",
          options: [
            'The FRR also decreases — both error rates improve together',
            'The FRR increases — tighter acceptance thresholds reject more legitimate users',
            'The FRR remains constant — FAR and FRR are independent parameters',
            'The CER increases — making the system less accurate overall',
          ],
          correctIndex: 1,
          explanation: "FAR and FRR have an inverse relationship — they cannot both be minimized simultaneously. If you tighten the acceptance threshold to reduce false acceptances (lower FAR), you inevitably reject more legitimate users (higher FRR). If you loosen the threshold to reduce false rejections (lower FRR), you accept more impostors (higher FAR). The Crossover Error Rate (CER) or Equal Error Rate (EER) is the point where FAR = FRR — it's a single number used to compare biometric system accuracy across vendors. A lower CER indicates a more accurate system overall.",
          memoryHack: "FAR and FRR are opposite ends of a seesaw. Push FAR down (tighten security) and FRR goes up (more friction for real users). Push FRR down (easier for users) and FAR goes up (more risk). The CER is where they balance.",
          conceptName: 'Biometric Error Rates',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Dialogue 3: Kerberos ─────────────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch5-act1-d3',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "Now — here's where the single credential becomes eight countries of access. Nexus uses Kerberos for their Windows domain authentication. I want to show you what Kerberos does, what it was designed to prevent, and which specific vulnerability the attacker exploited in their implementation.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Visual Aid: Kerberos flow ─────────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch5-act1-va2',
          title: 'Kerberos Authentication Flow',
          aidType: 'list',
          items: [
            {
              label: 'Step 1: AS-REQ → Authentication Server (AS)',
              description: 'The client sends an Authentication Service Request to the KDC (Key Distribution Center). Includes: username + timestamp encrypted with the user\'s password-derived key. The AS is like the box office at a stadium — you show your ID here first.',
            },
            {
              label: 'Step 2: AS-REP → Ticket-Granting Ticket (TGT)',
              description: 'The AS verifies the user\'s identity and issues a Ticket-Granting Ticket (TGT) encrypted with the KDC\'s secret key. The TGT is your ticket book — it proves you\'ve authenticated, but doesn\'t grant access to anything specific yet. The client also receives a session key encrypted with their own key.',
            },
            {
              label: 'Step 3: TGS-REQ → Ticket-Granting Server (TGS)',
              description: 'When the client wants to access a specific service, they present the TGT to the Ticket-Granting Server (TGS). The TGS is also part of the KDC. This is like presenting your ticket book at the individual gate — "I have the ticket book, now I need a ticket for Section C."',
            },
            {
              label: 'Step 4: TGS-REP → Service Ticket',
              description: 'The TGS issues a Service Ticket encrypted with the target service\'s secret key. The client never sees the service\'s key — the service ticket can only be decrypted by the legitimate service. This is the individual gate ticket.',
            },
            {
              label: 'Step 5: AP-REQ → Application Server',
              description: 'The client presents the Service Ticket directly to the application server. The application server decrypts it using its own key and grants access. The gatekeeper never asked for your ID — only the ticket. The KDC (box office) is never contacted again for this service.',
            },
          ],
          speaker: 'Agent Morales',
          dialogue: "Key insight: the application server never directly contacts the KDC to verify your identity. It just checks whether the ticket decrypts correctly with its own key. This is what makes Kerberos scalable — but it also means a stolen TGT works until it expires, regardless of whether your password was changed.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Evidence 2: Pass-the-ticket attack ───────────────────────────────
        {
          type: 'evidence',
          id: 'ch5-act1-e2',
          title: 'Kerberos Exploitation — Pass-the-Ticket Attack',
          classification: 'TOP SECRET',
          content: `## Attack Technique: Pass-the-Ticket\n\n### What Happened\nAfter compromising the architect's workstation via phishing, the attacker extracted the Ticket-Granting Ticket (TGT) from the Windows memory (LSASS process) using a credential extraction tool.\n\nThe TGT had a 10-hour validity window — Nexus had extended the default Kerberos ticket lifetime from 8 hours to 10 hours for operational convenience.\n\nWith the stolen TGT, the attacker could request Service Tickets for any Kerberos-authenticated service that the architect had access to — without knowing the architect's password. The TGT is sufficient.\n\n### Access Obtained via Stolen TGT\n- New Jersey vault administrative interface (Domain A)\n- Zurich server farm monitoring console (Domain B — trusted cross-domain)\n- Singapore cable station network management (Domain C — trusted cross-domain)\n\n### Why the SSO System Made It Worse\nNexus had configured a legacy SSO system that extended Kerberos trust across all eight national domains. A valid TGT from Domain A was accepted by every domain in the trust chain — without re-authentication at each boundary.`,
          evidenceItems: [
            { label: 'Attack Type', value: 'Pass-the-Ticket (Kerberos TGT extraction from LSASS)', highlight: true },
            { label: 'TGT Lifetime', value: '10 hours (extended from 8-hour default)', highlight: true },
            { label: 'SSO Scope', value: '8 national domains — full cross-domain trust', highlight: true },
            { label: 'Password Knowledge Required', value: 'None — TGT sufficient for service access' },
            { label: 'Detection', value: 'None — legitimate TGT appeared as normal authentication' },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "The architect's password was protected behind MFA. The attacker never needed it. They took the ticket directly from memory — and the ticket was valid for 10 hours across eight countries. One theft, eight countries, ten hours of access.",
          rightCharacter: 'agent_morales',
          rightExpression: 'angry',
        },

        // ── Knowledge Check 3: Kerberos ──────────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act1-kc3',
          question: "In Kerberos authentication, which component issues Service Tickets to clients who want to access a specific application server?",
          options: [
            'The Authentication Server (AS) — it handles all ticket issuance',
            'The Application Server — it generates its own access tickets',
            'The Ticket-Granting Server (TGS) — it receives the TGT and issues Service Tickets for specific services',
            'The client — it generates the Service Ticket from the TGT using a shared key',
          ],
          correctIndex: 2,
          explanation: "In Kerberos, the KDC (Key Distribution Center) consists of two components: the Authentication Server (AS) and the Ticket-Granting Server (TGS). The AS handles the initial authentication and issues the Ticket-Granting Ticket (TGT). When a client wants access to a specific service, they take their TGT to the TGS, which issues a Service Ticket for that specific service. The Application Server only receives and validates Service Tickets — it doesn't issue anything. The client never generates tickets on its own.",
          memoryHack: "KDC = AS + TGS. Two clerks. AS = front desk (gives you the ticket book/TGT). TGS = concierge (exchanges your ticket book for a specific gate ticket/Service Ticket). Application = the gate (just checks your gate ticket, never talks to the front desk).",
          conceptName: 'Kerberos',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Think Like a Manager: SSO risk decision ───────────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch5-act1-tlm1',
          scenario: "The Nexus incident has demonstrated that an extended Kerberos trust across all 8 national domains means a single credential compromise gives access to all domains. The operations team argues that removing the cross-domain SSO will force 23,000 employees to maintain separate credentials for each national system — a significant productivity and helpdesk burden.",
          question: "As CISO, which approach BEST balances the security risk with operational reality?",
          options: [
            'Remove all cross-domain SSO — security must take absolute priority over productivity',
            'Maintain the current SSO configuration but shorten the TGT lifetime to 2 hours — reduces the attack window significantly',
            'Implement privileged access workstations (PAWs) for high-privilege accounts and require step-up authentication at each domain boundary for privileged operations',
            'Maintain the SSO but enforce MFA at each cross-domain service access point — every ticket request requires a fresh MFA push',
          ],
          correctIndex: 2,
          explanation: "The attack exploited a high-privilege account with broad cross-domain SSO access. The correct response is not to remove SSO for all 23,000 employees (disproportionate impact on low-risk users) but to apply enhanced controls to high-privilege accounts specifically. Privileged Access Workstations (PAWs) harden the machines used for administrative tasks, making credential theft from LSASS significantly harder. Step-up authentication at domain boundaries ensures that cross-domain access by privileged accounts requires re-verification. TGT lifetime reduction (option 2) alone doesn't prevent the attack — it just shortens the window. Option 4's MFA on every ticket request breaks the SSO model and creates user experience failure.",
          managerInsight: "The principle of proportional control: apply the strongest controls to your highest-risk assets. High-privilege accounts accessing multiple domains are your most sensitive identity assets — they deserve PAWs, privileged identity management, and step-up authentication. Standard employee SSO convenience doesn't need to change. Risk-proportionate controls beat blanket restrictions every time.",
          conceptName: 'Single Sign-On Security',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Timed Decision 1: Active session response ─────────────────────────
        {
          type: 'timedDecision',
          id: 'ch5-act1-td1',
          scenario: "Security operations has identified an active session using the architect's stolen TGT. The TGT has 3 hours of remaining validity. The attacker is currently querying the Singapore network management console. You have 30 seconds to decide.",
          timeLimit: 30,
          options: [
            {
              text: 'Force immediate password reset for the architect\'s account and reset the Kerberos keys (krbtgt account)',
              isOptimal: true,
              feedback: "Correct. The TGT is derived from the krbtgt account's key. Resetting the krbtgt account's password invalidates all outstanding TGTs immediately — including the stolen one. Password reset alone is insufficient because the TGT doesn't depend on the current password. Both steps are required to terminate the attacker's session.",
              xpBonus: 50,
            },
            {
              text: 'Disable the architect\'s account — this terminates all active sessions for that account',
              isOptimal: false,
              feedback: "Disabling the account stops new TGT requests but does NOT invalidate existing TGTs that have already been issued. Kerberos Service Tickets are checked against the TGT — if the TGT is still cryptographically valid (verified against krbtgt key), the attacker continues to get new Service Tickets for the remaining 3-hour window even with a disabled account.",
            },
            {
              text: 'Change the architect\'s password — this invalidates the TGT since it was derived from the password',
              isOptimal: false,
              feedback: "Partially correct reasoning, but incorrect in practice. TGTs are NOT directly derived from the user's current password — they are encrypted by the KDC's secret key (krbtgt). Once a TGT is issued, it remains valid until expiry regardless of password changes. The krbtgt key is what needs to change.",
            },
            {
              text: 'Block the Singapore console\'s IP at the network level — removes the current target',
              isOptimal: false,
              feedback: "Blocking one target doesn't invalidate the TGT. The attacker still has a valid TGT for 3 more hours and can pivot to other services the architect had access to. Whack-a-mole is not incident response.",
            },
          ],
          conceptName: 'Kerberos',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'worried',
        },
      ],
    },

    // ─── ACT 2: The Access Model ──────────────────────────────────────────────
    {
      actNumber: 2,
      title: 'The Access Model',
      description: 'Investigate the federated identity failures and access control weaknesses that allowed the insider to operate undetected.',
      xpReward: 200,
      conceptsCovered: [
        'Access Control Models (MAC, DAC, RBAC, ABAC)',
        'Federated Identity (SAML, OAuth 2.0, OpenID Connect)',
        'Provisioning Lifecycle (Joiner-Mover-Leaver)',
        'Privileged Access Management',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ── Transition: Identity systems room ────────────────────────────────
        {
          type: 'transition',
          id: 'ch5-act2-transition-idm',
          location: 'Nexus UK — Identity and Access Management Operations Center',
          description: 'The IAM operations center manages digital identities for 23,000 active employees and — as the audit will reveal — 847 additional accounts for employees who left the company between 6 months and 4 years ago.',
          animation: 'slide',
          timeSkipText: '5 hours into the London investigation',
        },

        // ── Dialogue 1: Morales on access control models ─────────────────────
        {
          type: 'dialogue',
          id: 'ch5-act2-d1',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "While we were chasing the external attacker, we almost missed the insider. A former IT contractor whose account was never deprovisioned. They had access to the London systems for 11 months after their contract ended. The access control model here has fundamental design flaws — and those flaws let both threats operate. Let me explain access control from the ground up.",
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Visual Aid: Access control models ────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch5-act2-va1',
          title: 'Access Control Models Comparison',
          aidType: 'table',
          headers: ['Model', 'Who Controls Access', 'How Access is Decided', 'Flexibility', 'Use Case'],
          rows: [
            [
              'MAC (Mandatory Access Control)',
              'System enforces — not the data owner',
              'Security labels (classification levels) on subjects and objects. The system compares labels and enforces policy. No user discretion.',
              'Very rigid — policy-driven, not user-driven',
              'Government/military classified systems; Bell-LaPadula environments',
            ],
            [
              'DAC (Discretionary Access Control)',
              'Data owner decides',
              'Access Control Lists (ACLs) set by the owner. I own a file, I decide who can read it.',
              'Very flexible — but inconsistent; depends on owner judgment',
              'Most consumer operating systems (Windows NTFS, Linux file permissions)',
            ],
            [
              'RBAC (Role-Based Access Control)',
              'Administrator assigns roles; roles define permissions',
              'Users are assigned roles (e.g., "Analyst," "Manager"). Roles carry permission sets. User permissions = union of their role permissions.',
              'Moderate — role assignment is flexible; permissions within roles are standardized',
              'Enterprise environments; military rank systems; most corporate IT',
            ],
            [
              'ABAC (Attribute-Based Access Control)',
              'Policy engine evaluates attributes',
              'Access decisions based on multiple attributes: user attributes (clearance, department, location), resource attributes (sensitivity, owner), environment attributes (time, network, device). Policy rules combine attributes.',
              'Highly flexible — can model complex, contextual rules',
              'Cloud environments; zero-trust architectures; fine-grained access scenarios',
            ],
          ],
          speaker: 'Agent Morales',
          dialogue: "RBAC is like military rank: a Captain automatically inherits all permissions granted to the Captain rank — you don't list each one individually. ABAC is like a context-sensitive entry system: you need the rank, AND be physically in the right building, AND be within duty hours, AND the room needs to be flagged as accessible to your clearance level.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Knowledge Check 1: Access control models ─────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act2-kc1',
          question: "A classified government system enforces access based on security labels. A user with Secret clearance attempts to access a Top Secret document. The system denies access regardless of what the document owner says. Which access control model is in use?",
          options: [
            'DAC — the document owner could grant access if they chose',
            'RBAC — the user\'s role does not include Top Secret document access',
            'MAC — the system enforces classification label comparison; the owner has no discretion to override',
            'ABAC — multiple attributes including clearance level are evaluated',
          ],
          correctIndex: 2,
          explanation: "MAC (Mandatory Access Control) is distinguished by the fact that access decisions are made by the SYSTEM based on security labels — the resource owner cannot override the system's decision. In DAC, the owner can grant access. In RBAC, an administrator could assign a different role. In ABAC, additional attributes could change the decision. In MAC, the label comparison is absolute: Secret clearance cannot access Top Secret objects, period — regardless of owner discretion.",
          memoryHack: "MAC = Mandatory means mandatory. No exceptions, no overrides, no owner discretion. The SYSTEM decides based on labels. Think of it as a nuclear launch code: your boss can't just say 'it's OK' — the lock requires the right key.",
          conceptName: 'Access Control Models',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Evidence 1: Federated identity failure ───────────────────────────
        {
          type: 'evidence',
          id: 'ch5-act2-e1',
          title: 'Federated Identity Audit — Cross-Domain Trust Analysis',
          classification: 'TOP SECRET',
          content: `## Federated Identity Configuration Review\n\nNexus uses SAML 2.0 for federation between its national domain Identity Providers (IdPs) and multiple cloud service providers (SPs). The audit reveals the following:\n\n### SAML Trust Configuration\n- The London IdP issues SAML assertions for all Domain A users\n- Assertions include attributes: username, department, clearance_level, roles[]\n- Cloud SPs accept assertions from the London IdP without additional verification\n\n### SAML Assertion Forging Attempt Detected\nForensic analysis found one failed attempt to forge a SAML assertion. The attacker attempted to modify the assertion's role attribute (escalating from 'analyst' to 'admin') without invalidating the digital signature. The SP rejected the assertion because the signature check failed.\n\n**The digital signature check worked.** This demonstrates one security control that functioned correctly.\n\n### What Didn't Work: Stale Account Federation\nThe former contractor's London IdP account was still active. Their SAML assertions were still being accepted by all cloud SPs — because the SP never received a deprovisioning notification. Account termination in the HR system did not cascade to the IdP.`,
          evidenceItems: [
            { label: 'Federation Protocol', value: 'SAML 2.0' },
            { label: 'Assertion Forging Attempt', value: 'Failed — signature verification worked', highlight: false },
            { label: 'Stale Accounts in IdP', value: '847 — including contractor (active 11 months post-contract)', highlight: true },
            { label: 'HR-to-IdP Sync', value: 'Not implemented — no automated deprovisioning', highlight: true },
            { label: 'SP Deprovisioning Notification', value: 'Never received — SP trusts the IdP to manage lifecycle' },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "A SAML assertion is like an embassy letter of introduction. The IdP (embassy) writes and signs a letter: 'This person is authenticated and has these roles.' The SP (foreign government building) trusts the issuing embassy and lets the person in without asking their own questions. If the embassy never tells the building that the person's authorization was revoked, the building keeps letting them in.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Knowledge Check 2: SAML and Federation ───────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act2-kc2',
          question: "An Identity Provider issues a SAML assertion stating the user has the 'admin' role. The assertion is digitally signed with the IdP's private key. An attacker intercepts the assertion and modifies the role attribute to escalate privileges. Why does this attack fail?",
          options: [
            'Because the SP re-authenticates the user directly to verify the role',
            'Because SAML assertions expire too quickly to be intercepted and modified',
            'Because modifying any part of the assertion invalidates the digital signature — the SP\'s signature verification rejects the tampered assertion',
            'Because the attacker cannot modify the assertion content without the IdP\'s public key',
          ],
          correctIndex: 2,
          explanation: "A SAML assertion is digitally signed by the IdP using its private key. The Service Provider verifies this signature using the IdP's public key before trusting the assertion's contents. Any modification to the assertion content — including changing the role attribute — invalidates the signature because the signature was computed over the original content. The SP detects the mismatch between the signature and the current content and rejects the assertion. The attacker cannot regenerate a valid signature without the IdP's private key.",
          memoryHack: "Digital signature on a SAML assertion = wax seal on the embassy letter. If you break the seal and rewax it with your own wax, the receiving official sees the wrong seal color and rejects the letter. The signature is the seal — changing the letter breaks it.",
          conceptName: 'Federated Identity (SAML)',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Knowledge Check 3: OAuth vs OpenID Connect ───────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch5-act2-kc3',
          question: "A mobile application uses OAuth 2.0 to request access to a user's calendar data from a cloud service. The user consents. Later, the same application uses OpenID Connect (OIDC) to establish the user's identity within the app. What is the primary distinction between these two protocols in this scenario?",
          options: [
            'OAuth 2.0 and OpenID Connect are identical — OIDC is just a newer name for OAuth',
            'OAuth 2.0 handles authorization (granting the app permission to access resources); OpenID Connect handles authentication (verifying who the user is)',
            'OpenID Connect replaces OAuth 2.0 — using both in the same application creates a security conflict',
            'OAuth 2.0 is for machine-to-machine authentication; OpenID Connect is for user authentication',
          ],
          correctIndex: 1,
          explanation: "OAuth 2.0 is an AUTHORIZATION framework — it allows an application to obtain delegated permission to access specific resources on behalf of a user (like 'this app can read your calendar') without exposing credentials. It does not verify the user's identity by itself. OpenID Connect (OIDC) is an AUTHENTICATION layer built on top of OAuth 2.0 — it adds an ID Token (a signed JWT) that tells the application who the authenticated user is. Using both together is the correct pattern: OAuth for resource access delegation, OIDC for identity verification.",
          memoryHack: "OAuth = the permission slip. ('I allow this app to read my calendar.') OIDC = the ID card. ('And here's proof of who I am.') You need both for a complete identity and authorization picture.",
          conceptName: 'OAuth 2.0 and OpenID Connect',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Evidence 2: Provisioning lifecycle failure ────────────────────────
        {
          type: 'evidence',
          id: 'ch5-act2-e2',
          title: 'Identity Lifecycle Audit — Joiner-Mover-Leaver Process Review',
          classification: 'CLASSIFIED',
          content: `## Identity Provisioning Lifecycle Gap Analysis\n\n### Current State\n- **Joiner Process:** New employees receive accounts within 2 business days of HR system entry. MFA is provisioned at onboarding. ✓\n- **Mover Process:** Role changes trigger a ticket to IT — but permissions from the old role are not automatically removed. Users accumulate permissions over time (privilege creep). ✗\n- **Leaver Process:** HR marks employees as terminated. IT receives weekly batch notification (not real-time). External contractors use a manual email notification process — no automated trigger. ✗\n\n### Findings\n- 847 accounts active in the IdP belonging to terminated employees and contractors\n- 23 active accounts for contractors whose engagements ended more than 1 year ago\n- 312 employee accounts with permissions from previous roles still attached (privilege creep)\n- The former contractor account had accumulated permissions from 3 different role assignments — all still active`,
          evidenceItems: [
            { label: 'Leaver Process Automation', value: 'None for contractors; weekly batch for employees', highlight: true },
            { label: 'Stale Accounts', value: '847 total — 23 contracts ended > 1 year ago', highlight: true },
            { label: 'Privilege Creep Accounts', value: '312 — permissions accumulate across role changes', highlight: true },
            { label: 'Contractor Leaver Trigger', value: 'Manual email to IT — no automated offboarding', highlight: true },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "847 ghost accounts. People who left, accounts that stayed. In the identity world, a ghost account is a door that should have been locked the day someone left the building. Instead, the key still works.",
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Visual Aid: Joiner-Mover-Leaver lifecycle ─────────────────────────
        {
          type: 'visualAid',
          id: 'ch5-act2-va2',
          title: 'Identity Provisioning Lifecycle — Joiner / Mover / Leaver',
          aidType: 'list',
          items: [
            {
              label: 'Joiner',
              description: 'Triggered by: hiring event in HR system. Actions: create account, assign role-based permissions per job function, provision MFA credentials, enroll in PAM if privileged role, send welcome credentials via secure channel. SLA: access ready before first day. Security risk: over-provisioning at onboarding (giving too many permissions "just in case").',
            },
            {
              label: 'Mover',
              description: 'Triggered by: role change, promotion, department transfer, or location change in HR system. Actions: add new role permissions, REMOVE old role permissions (critical — this prevents privilege creep), update group memberships, re-certify access if moving to privileged role. Security risk: old permissions retained (accumulation). Solution: role-swap, not role-add.',
            },
            {
              label: 'Leaver',
              description: 'Triggered by: termination event in HR system (voluntary or involuntary). Actions (must be automated and near-real-time): disable account immediately, revoke all active sessions and tokens, revoke certificates, remove from all group memberships, archive account for X days then delete, notify downstream systems (SPs, cloud services). Security risk: stale accounts, especially for privileged or contractor users. Solution: automated, real-time HR-to-IdP sync.',
            },
          ],
          speaker: 'Agent Morales',
          dialogue: "The Mover case is the sneaky one. Every role change is an opportunity to accumulate permissions. Five promotions over ten years and a user might have permissions from every job they've ever held. Quarterly access certification reviews exist to catch exactly this.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Timed Decision 2: Privileged access emergency ─────────────────────
        {
          type: 'timedDecision',
          id: 'ch5-act2-td1',
          scenario: "The former contractor's active account is currently being used to access the Nexus London Active Directory infrastructure — domain administrator level. Terminating the account immediately will lock 14 active administrative sessions that belong to legitimate current staff. You have 30 seconds.",
          timeLimit: 30,
          options: [
            {
              text: 'Disable the contractor account immediately regardless of collateral impact — active admin access by a terminated insider is an active threat',
              isOptimal: true,
              feedback: "Correct. Active privileged access by a terminated user is an ongoing security incident. The 14 legitimate admin sessions are temporarily disrupted — an inconvenience. An active insider threat with domain admin access is a catastrophic risk. Contain immediately, then restore legitimate sessions with re-authentication.",
              xpBonus: 50,
            },
            {
              text: 'Isolate the contractor account\'s session specifically without disabling the account',
              isOptimal: false,
              feedback: "Session isolation might be technically possible but is operationally complex in Active Directory environments and takes longer than immediate account disablement. Every additional minute of active domain admin access for a terminated user is unacceptable risk.",
            },
            {
              text: 'Notify the 14 admin staff to end their sessions voluntarily, then disable the contractor account when all legitimate sessions are clear',
              isOptimal: false,
              feedback: "The contractor's session doesn't wait for the 14 legitimate users to cooperate. During the notification and session clearing window — which could take 10-20 minutes — the contractor account continues operating with domain admin rights.",
            },
            {
              text: 'Add an additional authentication requirement to the contractor account — block further actions without alerting the insider',
              isOptimal: false,
              feedback: "Adding authentication requirements to a disabled-for-termination account is not standard Active Directory capability, and attempting a stealth restriction while the insider maintains an active session creates a window where they may notice and accelerate malicious activity.",
            },
          ],
          conceptName: 'Privileged Access Management',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'worried',
        },

        // ── Think Like a Manager: PAM program ────────────────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch5-act2-tlm1',
          scenario: "Post-incident review reveals the core identity failures: (1) no real-time HR-to-IdP synchronization for contractor offboarding, (2) privilege creep across 312 accounts with no access certification process, (3) privileged accounts (like the architect) running without a PAM solution — passwords and Kerberos keys stored in standard workstation memory accessible to credential extraction tools.",
          question: "You have budget for ONE remediation initiative. Which provides the greatest risk reduction?",
          options: [
            'Implement real-time HR-to-IdP synchronization — eliminates the 847 stale account risk immediately',
            'Deploy a quarterly access certification process — addresses the 312 privilege creep accounts',
            'Implement a Privileged Access Management (PAM) solution with credential vaulting and just-in-time access — addresses the highest-value attack vector',
            'Deploy anomaly detection on privileged account activity — detects unusual behavior from stale or compromised accounts',
          ],
          correctIndex: 2,
          explanation: "Privileged accounts are the highest-value target in any environment — they're what makes a breach catastrophic rather than containable. A PAM solution with credential vaulting means privileged credentials are never stored on workstations in plaintext (eliminating the Pass-the-Ticket attack vector), and just-in-time access means privileged accounts only exist for the duration of a specific task (reducing the stale account window to near-zero for privileged users). The HR sync (option 1) is critical but addresses a lower-privilege problem. Access certification (option 2) is important but reactive. Anomaly detection (option 4) detects after the fact. PAM prevents the compromise of the most damaging account type from the start.",
          managerInsight: "Risk prioritization: focus controls on the assets with the highest blast radius if compromised. Privileged accounts can access everything. Stale standard accounts have limited scope. Anomaly detection tells you after you've already been breached. PAM controls the most dangerous keys in the building — start there.",
          conceptName: 'Privileged Access Management',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Dialogue: Act and chapter wrap-up ────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch5-act2-d2',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "Two separate threats. One external attacker using a stolen Kerberos ticket to move across eight countries. One insider — a ghost — operating through an account that should have been closed eleven months ago. Both of them were invisible to the systems that should have caught them. Identity is the new perimeter, {player}. If you get the identity architecture wrong, every other control becomes irrelevant. We're not done with this investigation — but you now understand how it was possible.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },
      ],
    },
    null,
    null,
    null,
  ],
};
