import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter4: DomainChapterDefinition = {
  domainId: 4,
  title: 'The Cable Station',
  location: 'Cable Station, Singapore',
  locationGradient: 'linear-gradient(135deg, #0a1628 0%, #0d2240 50%, #1a0a28 100%)',
  acts: [
    // ─── ACT 1: The Network Stack ─────────────────────────────────────────────
    {
      actNumber: 1,
      title: 'The Network Stack',
      description: 'Understand the network architecture the attacker exploited to pivot through the Singapore cable station.',
      xpReward: 150,
      conceptsCovered: [
        'OSI Model',
        'TCP/IP Suite',
        'TCP Three-Way Handshake',
        'Firewall Types',
        'DMZ Architecture',
      ],
      estimatedMinutes: 22,
      nodes: [
        // ── Transition: Arrival ─────────────────────────────────────────────
        {
          type: 'transition',
          id: 'ch4-act1-transition-arrival',
          location: 'Nexus Cable Station Bravo — Changi Coast, Singapore',
          description: 'The station manages three undersea fiber optic cables connecting Asia to Europe and North America. Forty terabits per second of traffic flow through this building. The attacker didn\'t need to tap the cables — they found a door that was already open.',
          animation: 'glitch',
          timeSkipText: '72 hours after the Zurich incident',
        },

        // ── Dialogue 1: Janet and Morales greet the player ──────────────────
        {
          type: 'dialogue',
          id: 'ch4-act1-d1',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "{player}. I've been on the ground for six hours. The short version: the attacker didn't come through the front door. They came through a compromised wireless access point on the administrative network, then moved laterally using network tricks I want to walk you through. Janet's handling the technical analysis. I'm going to focus on how they moved and what we should have stopped them with.",
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        {
          type: 'dialogue',
          id: 'ch4-act1-d2',
          speaker: 'Janet Park',
          speakerSide: 'left',
          text: "Before we get to the attack path, I want to make sure you understand the network stack they exploited. The attack touched multiple OSI layers — and the controls that failed were at specific layers for specific reasons. Understanding the layers tells us exactly which controls should have caught this.",
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ── Visual Aid: OSI Model ─────────────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch4-act1-va1',
          title: 'OSI Model — All 7 Layers',
          aidType: 'table',
          headers: ['Layer', 'Name', 'Function', 'PDU', 'Key Protocols/Examples'],
          rows: [
            ['7', 'Application', 'User-facing network services; where application data is created and consumed', 'Data', 'HTTP, HTTPS, FTP, SMTP, DNS, SNMP'],
            ['6', 'Presentation', 'Data translation, encryption, compression; ensures format compatibility between systems', 'Data', 'SSL/TLS encryption, JPEG, ASCII, MPEG'],
            ['5', 'Session', 'Establishes, manages, and terminates communication sessions between applications', 'Data', 'NetBIOS, RPC, SQL sessions'],
            ['4', 'Transport', 'End-to-end delivery, reliability, flow control, port addressing', 'Segment (TCP) / Datagram (UDP)', 'TCP, UDP — port numbers live here'],
            ['3', 'Network', 'Logical addressing and routing between networks', 'Packet', 'IP, ICMP, OSPF, BGP — IP addresses live here'],
            ['2', 'Data Link', 'Physical addressing, error detection, access to the physical medium', 'Frame', 'Ethernet, Wi-Fi (802.11), MAC addresses'],
            ['1', 'Physical', 'Raw bit transmission over the physical medium', 'Bit', 'Cable, fiber optic, radio waves, hubs'],
          ],
          speaker: 'Janet Park',
          dialogue: "Think of this as a diplomatic dispatch system. Your message passes through 7 clerks on the way out — each one adds their own envelope (encapsulation). On the receiving end, 7 clerks strip each envelope in reverse order (decapsulation). The data is the message. The layers are the envelope system that gets it there.",
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
        },

        // ── Knowledge Check 1: OSI Model ─────────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch4-act1-kc1',
          question: "An intrusion detection system inspects the source and destination IP addresses of each packet to determine whether traffic originates from a trusted network segment. At which OSI layer is it primarily operating?",
          options: [
            'Layer 2 (Data Link) — IP addresses are resolved using MAC addresses at this layer',
            'Layer 3 (Network) — IP addressing and routing information exists at this layer',
            'Layer 4 (Transport) — port numbers combined with IP addresses form a complete socket',
            'Layer 7 (Application) — the IDS must understand the application to inspect IP traffic',
          ],
          correctIndex: 1,
          explanation: "IP addresses are Layer 3 (Network layer) constructs. The Network layer handles logical addressing (IP) and routing. When a device inspects source/destination IP addresses, it's operating at Layer 3. Layer 2 uses MAC (physical) addresses. Layer 4 adds port numbers to IP addresses to form complete socket pairs. Layer 7 would involve inspecting the payload content — the actual application data.",
          memoryHack: "Layer 3 = IP addresses and routing. 'Network' layer handles 'Network' addresses. Remember by the mnemonic: Please Do Not Throw Sausage Pizza Away (Physical, Data Link, Network, Transport, Session, Presentation, Application).",
          conceptName: 'OSI Model',
          speaker: 'Janet Park',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ── Dialogue 3: TCP handshake ──────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch4-act1-d3',
          speaker: 'Janet Park',
          speakerSide: 'left',
          text: "The attacker's pivot relied on TCP connections that the firewall's state table tracked incorrectly. To understand why, you need to know how TCP establishes a connection — and what a stateful firewall watches for.",
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ── Evidence 1: TCP handshake and attack setup ───────────────────────
        {
          type: 'evidence',
          id: 'ch4-act1-e1',
          title: 'Network Forensics — Attack Entry Point Analysis',
          classification: 'CLASSIFIED',
          content: `## TCP Three-Way Handshake (Normal)\n\n\`\`\`\nClient → Server: SYN (I want to connect; here is my sequence number X)\nServer → Client: SYN-ACK (OK; my sequence number is Y; I acknowledge X+1)\nClient → Server: ACK (I acknowledge Y+1; connection established)\n\`\`\`\n\nThis handshake establishes a reliable, stateful connection. Both sides exchange sequence numbers to track packet ordering and detect lost packets.\n\n## Attack Vector: SYN Flood Prelude\n\nThe attacker first conducted a low-rate SYN flood against the administrative network's load balancer — not to overwhelm it, but to fill its connection state table with half-open connections. This caused the stateful firewall to exhaust connection tracking capacity and temporarily fall back to packet-filter mode (stateless), accepting packets based on IP/port rules only.\n\n**During the fallback window (47 seconds):** The attacker injected spoofed packets that appeared to originate from a trusted internal IP address, establishing a session with the internal admin console — which was accessible from trusted addresses without secondary authentication.`,
          evidenceItems: [
            { label: 'Attack Technique', value: 'SYN flood → state table exhaustion → stateless fallback', highlight: true },
            { label: 'Fallback Duration', value: '47 seconds', highlight: false },
            { label: 'Firewall Mode During Attack', value: 'Packet filter (stateless) — not stateful', highlight: true },
            { label: 'Spoofed Source IP', value: 'Internal admin subnet (10.10.1.0/24)' },
            { label: 'Target', value: 'Admin console — trusted-IP-only access', highlight: true },
          ],
          speaker: 'Janet Park',
          speakerSide: 'left',
          dialogue: "The attacker didn't break the firewall. They tricked it into temporarily forgetting how to check travel history. During that 47 seconds, all it checked was the passport cover.",
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ── Visual Aid: Firewall Types ─────────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch4-act1-va2',
          title: 'Firewall Types — Capabilities Comparison',
          aidType: 'table',
          headers: ['Type', 'What It Inspects', 'OSI Layer', 'Analogy', 'Limitation'],
          rows: [
            [
              'Packet Filter',
              'Source/destination IP and port only — no state, no context',
              'Layer 3-4',
              'Embassy checkpoint that only checks the cover of your passport — no stamps, no history',
              'Cannot detect attacks that use legitimate IP/port combinations; stateless means no session context',
            ],
            [
              'Stateful Inspection',
              'Packet contents + connection state (tracks SYN/ACK sequences, established sessions)',
              'Layer 3-4',
              'Checkpoint that checks your passport AND your full travel history — knows which sessions are legitimately established',
              'Cannot inspect payload content; blind to application-layer attacks in allowed sessions',
            ],
            [
              'Application Proxy (Proxy Firewall)',
              'Full application-layer content — acts as intermediary, terminates and re-establishes connections',
              'Layer 3-7',
              'Checkpoint that checks your passport, travel history, AND searches your bags before sending you through in a new car',
              'High latency; must have a proxy for each application protocol',
            ],
            [
              'Next-Generation Firewall (NGFW)',
              'All of the above + application identity, user identity, IPS signatures, SSL inspection',
              'Layer 3-7+',
              'Checkpoint with passport, travel history, bag search, AND access to your phone contacts, financial records, and flight booking history',
              'Expensive; can become a bottleneck; SSL inspection creates privacy considerations',
            ],
          ],
          speaker: 'Agent Morales',
          dialogue: "The Nexus firewall was stateful but fell back to packet-filter mode under load. That's the gap. A NGFW with hardware-accelerated state tables would have maintained full inspection even under SYN flood load.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Knowledge Check 2: Firewall types ────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch4-act1-kc2',
          question: "A stateful firewall allows an established TCP session between a trusted internal host and a public web server. Within that allowed session, the attacker delivers a SQL injection payload in the HTTP request body. Which firewall type would MOST likely detect and block this attack?",
          options: [
            'Packet filter — it inspects the source IP which is trusted',
            'Stateful inspection firewall — it can inspect the session context',
            'Application proxy firewall — it terminates the session and can inspect the HTTP payload for injection patterns',
            'No firewall can detect SQL injection — only the web application itself can catch this',
          ],
          correctIndex: 2,
          explanation: "SQL injection occurs at Layer 7 (Application) — it's content within a legitimate, authorized HTTP session. A packet filter (Layer 3-4) and stateful firewall (Layer 3-4) both allow the session because the IP/port/state is valid. Neither inspects the payload. An application proxy operates at Layer 7, terminates the session, and can inspect the HTTP body content for injection patterns before forwarding. Option D is incorrect — WAFs (Web Application Firewalls) and application proxies are specifically designed to detect this.",
          memoryHack: "If the attack is inside an allowed session, you need a firewall that opens the bags. Packet filter = passport cover only. Stateful = passport history. Proxy = bag search.",
          conceptName: 'Firewall Types',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Evidence 2: DMZ architecture failure ─────────────────────────────
        {
          type: 'evidence',
          id: 'ch4-act1-e2',
          title: 'Network Architecture Diagram — DMZ Misconfiguration',
          classification: 'CLASSIFIED',
          content: `## DMZ Architecture — Intended vs. Actual\n\n### Intended Design\n\`\`\`\nInternet → [Outer Firewall] → DMZ (web/email servers) → [Inner Firewall] → Internal Network\n\`\`\`\nThe DMZ hosts public-facing services. The inner firewall enforces strict rules allowing only necessary traffic from the DMZ to the internal network.\n\n### Actual Configuration Found\n\`\`\`\nInternet → [Outer Firewall] → DMZ → [Inner Firewall with ANY-ANY rule for DMZ subnet] → Internal Network\n\`\`\`\n\nThe inner firewall had been configured with an 'ANY-ANY' rule permitting all traffic from the DMZ subnet to the internal network — applied by a network engineer during a debugging session six months ago and never removed.\n\n**Result:** Any compromised DMZ server had unrestricted access to internal network resources — no segmentation, no application-layer inspection, no additional authentication.`,
          evidenceItems: [
            { label: 'Inner Firewall Rule', value: 'ANY-ANY for DMZ subnet — applied 6 months ago', highlight: true },
            { label: 'Rule Removed', value: 'No', highlight: true },
            { label: 'Change Management Process', value: 'No review or approval documented for ANY-ANY rule' },
            { label: 'Impact', value: 'Compromised DMZ host = full internal network access' },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "An ANY-ANY rule on an inner firewall is the security equivalent of putting a security checkpoint at the front door and then removing all the doors inside the building. The whole point of a DMZ is to limit what a compromised public server can reach.",
          rightCharacter: 'agent_morales',
          rightExpression: 'angry',
        },

        // ── Think Like a Manager: DMZ governance ─────────────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch4-act1-tlm1',
          scenario: "A network engineer applied an ANY-ANY firewall rule to resolve a production outage during an emergency. The outage was resolved. The rule was never removed. Six months later, the rule is discovered during a pen test — after a breach has already occurred.",
          question: "Which process failure MOST directly caused this situation to persist for six months?",
          options: [
            'The network engineer made an unauthorized change — this is an individual disciplinary issue',
            'The absence of a formal change management process that requires review, time-bounding, and removal verification for all emergency changes',
            'The firewall vendor failed to alert on permissive ANY-ANY rules',
            'The penetration test should have been conducted more frequently',
          ],
          correctIndex: 1,
          explanation: "Emergency changes are necessary in production environments — outages can't always wait for full change management. The failure is that no process existed to review, time-bound, or verify removal of emergency changes. A mature change management process requires: documentation of emergency changes within 24 hours, a review board sign-off post-facto, and a mandatory rollback or formalization within a defined window. The engineer's behavior was predictable and understandable — the process failure is the systemic issue that an audit or governance review should catch.",
          managerInsight: "Never blame the individual for a systemic process failure. If emergency changes routinely persist because no process exists to track them, that's a CISO governance gap, not a personnel issue. The question to ask is: 'What process should have caught this?' Then build that process.",
          conceptName: 'DMZ Architecture',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Timed Decision 1: Active attack response ─────────────────────────
        {
          type: 'timedDecision',
          id: 'ch4-act1-td1',
          scenario: "The SYN flood attack is active and the firewall is reporting state table exhaustion at 94%. In approximately 30 seconds it will fall back to packet-filter mode. The internal admin console is exposed. You have 30 seconds.",
          timeLimit: 30,
          options: [
            {
              text: 'Block all inbound SYN packets from external sources at the upstream router — harden the perimeter before the fallback occurs',
              isOptimal: true,
              feedback: "Correct. Blocking SYN traffic upstream at the router preserves the firewall's state table by stopping new half-open connection creation. This prevents the fallback while the team addresses the underlying capacity issue. Blocking at the upstream device protects the firewall from being the bottleneck.",
              xpBonus: 50,
            },
            {
              text: 'Reboot the firewall to clear the state table — this will restore full capacity immediately',
              isOptimal: false,
              feedback: "Rebooting the firewall during an active SYN flood creates a total traffic blackhole while the firewall restarts — and the attack resumes the moment it comes back online. You've also confirmed to the attacker that you can be taken offline by SYN floods, giving them a reliable DoS capability.",
            },
            {
              text: 'Disable the admin console externally — remove the target before the fallback occurs',
              isOptimal: false,
              feedback: "Good supplementary action but insufficient as the primary response. Disabling the admin console removes one target — but the firewall falling back to packet-filter mode exposes the entire internal network, not just the admin console.",
            },
            {
              text: 'Activate rate limiting on the firewall for SYN packets — reduce the flood impact',
              isOptimal: false,
              feedback: "SYN rate limiting on the firewall itself is too late if the state table is already at 94%. The firewall is the point of failure — adding work to an already overwhelmed device may accelerate the failure rather than prevent it. The mitigation needs to happen upstream.",
            },
          ],
          conceptName: 'Firewall Types and TCP',
          speaker: 'Janet Park',
          leftCharacter: 'janet_park',
          leftExpression: 'worried',
        },
      ],
    },

    // ─── ACT 2: The Intrusion ─────────────────────────────────────────────────
    {
      actNumber: 2,
      title: 'The Intrusion',
      description: 'Investigate the wireless entry point and trace the network attack chain used to pivot through the station.',
      xpReward: 200,
      conceptsCovered: [
        'IDS/IPS Types',
        'Signature vs Anomaly Detection',
        'Wireless Security Standards',
        'Evil Twin Attacks',
        'ARP Poisoning',
        'DoS and DDoS',
        'DNS Poisoning',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ── Transition: Wireless investigation ───────────────────────────────
        {
          type: 'transition',
          id: 'ch4-act2-transition-wireless',
          location: 'Nexus Cable Station — Administrative Wing, Wireless Infrastructure Room',
          description: 'The attacker\'s trail leads to a maintenance closet on the administrative floor. Inside: a legitimate Nexus wireless access point — and next to it, mounted behind a ceiling tile, a nearly identical device with a different MAC address.',
          animation: 'slide',
          timeSkipText: '4 hours into the network investigation',
        },

        // ── Dialogue 1: Morales on wireless ─────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch4-act2-d1',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "There it is. An evil twin access point. Looks identical to the real one — same SSID, same apparent signal characteristics. Employees' devices connected to it automatically because their saved network profile matched. Everything they sent, we believe the attacker received first. The question is: why did nobody notice?",
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Evidence 1: Wireless attack analysis ──────────────────────────────
        {
          type: 'evidence',
          id: 'ch4-act2-e1',
          title: 'Wireless Forensics Report — Rogue Access Point',
          classification: 'TOP SECRET',
          content: `## Evil Twin Access Point — Technical Analysis\n\n### Rogue Device Specifications\n- **SSID:** NEXUS-ADMIN (identical to legitimate AP)\n- **Signal Strength:** Stronger than legitimate AP in the target area (attacker used a high-gain antenna)\n- **Security Protocol:** WPA2-Personal (same as legitimate AP — not WPA2-Enterprise)\n- **MAC Address:** Different from legitimate AP — but clients don't validate AP MAC addresses by default\n\n### Attack Sequence\n1. Attacker installs rogue AP with stronger signal in the administrative wing\n2. Sends deauthentication frames to force client disconnection from the legitimate AP\n3. Clients automatically reconnect to the strongest matching SSID — which is now the rogue AP\n4. Attacker performs man-in-the-middle: all wireless traffic passes through the rogue device\n5. WPA2-Personal encryption is shared-key — attacker knows the PSK, so they can decrypt all traffic\n\n### Why WPA2-Enterprise Would Have Prevented This\nWPA2-Enterprise uses 802.1X with individual user credentials authenticated by a RADIUS server. Each user has a unique key — knowing the network passphrase doesn't grant decryption capability for other users' sessions. The rogue AP cannot impersonate the authentication server without a valid certificate.`,
          evidenceItems: [
            { label: 'Protocol Used', value: 'WPA2-Personal (PSK)', highlight: true },
            { label: 'Attack Type', value: 'Evil Twin + deauth frames + MitM', highlight: true },
            { label: 'Decryption Possible', value: 'Yes — attacker knew PSK', highlight: true },
            { label: 'WPA2-Enterprise Deployment', value: 'Not implemented — would have prevented decryption' },
            { label: 'Rogue AP Runtime', value: 'Estimated 11 days before discovery' },
          ],
          speaker: 'Agent Morales',
          speakerSide: 'right',
          dialogue: "WPA2-Personal is the version where everyone on the network shares the same passphrase. Know the passphrase, decrypt everyone's traffic. WPA2-Enterprise gives every user their own cryptographic session. Even if I'm on the same network as you, I can't read your packets.",
          rightCharacter: 'agent_morales',
          rightExpression: 'thinking',
        },

        // ── Visual Aid: Wireless security standards ─────────────────────────
        {
          type: 'visualAid',
          id: 'ch4-act2-va1',
          title: 'Wireless Security Standards Evolution',
          aidType: 'table',
          headers: ['Standard', 'Key Exchange', 'Encryption', 'Vulnerabilities', 'Status'],
          rows: [
            ['WEP (1997)', 'Static shared key', 'RC4 with 40-bit key', 'Weak IV, key reuse — crackable in minutes with passive capture', 'Deprecated — never use'],
            ['WPA (2003)', 'TKIP (temporal key per packet)', 'RC4 with TKIP', 'TKIP has vulnerabilities; interim fix only', 'Deprecated — avoid'],
            ['WPA2-Personal (2004)', 'Pre-Shared Key (PSK)', 'AES-CCMP (strong)', 'PMKID attack, KRACK attack, PSK cracking if weak passphrase', 'Acceptable for home; inadequate for enterprise'],
            ['WPA2-Enterprise (2004)', '802.1X + RADIUS + EAP', 'AES-CCMP (strong)', 'Requires RADIUS infrastructure; certificate management overhead', 'Required for enterprise deployments'],
            ['WPA3-Personal (2018)', 'SAE (Simultaneous Authentication of Equals)', 'AES-GCMP-256', 'Forward secrecy; immune to offline dictionary attacks', 'Current standard — deploy where supported'],
            ['WPA3-Enterprise (2018)', '192-bit security mode + 802.1X', 'AES-GCMP-256', 'Highest security — government/financial grade', 'Recommended for sensitive environments'],
          ],
          speaker: 'Janet Park',
          dialogue: "WEP is like securing the building with a screen door. WPA2-Personal is a decent deadbolt — but everyone in the building has a copy of the same key. WPA2-Enterprise is a key card system: your key only opens your doors, and losing your card doesn't compromise everyone else's.",
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
        },

        // ── Knowledge Check 1: Wireless security ────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch4-act2-kc1',
          question: "An attacker performs a passive packet capture of WPA2-Personal wireless traffic on a corporate network for 48 hours. They captured the four-way handshake when a user re-authenticated. They now run an offline dictionary attack against the captured handshake. What does a successful attack allow the attacker to do?",
          options: [
            'Decrypt only the specific user\'s traffic — other sessions use different session keys',
            'Decrypt all past and future wireless traffic on the network — WPA2-Personal uses a single PSK from which all session keys are derived',
            'Access the RADIUS server to obtain user credentials',
            'Only exploit the specific access point — other APs on the same network use different encryption',
          ],
          correctIndex: 1,
          explanation: "In WPA2-Personal, all session keys are derived from the Pre-Shared Key (PSK). If an attacker obtains the PSK (by cracking the handshake), they can derive the session keys for any session — past or future — given the public handshake parameters that are transmitted in the clear. This is why WPA2-Personal lacks forward secrecy. WPA3-Personal's SAE protocol prevents this by deriving session keys without exposing the PSK, and each session has forward secrecy.",
          memoryHack: "WPA2-Personal = one master key, infinite copies. Anyone who cracks the master key can open every lock it ever made. WPA3-SAE = each lock gets its own unique key, even from the same master — cracking one doesn't help with others.",
          conceptName: 'Wireless Security',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Dialogue 2: ARP poisoning ─────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch4-act2-d2',
          speaker: 'Janet Park',
          speakerSide: 'left',
          text: "Once the attacker was on the internal network via the evil twin AP, they needed to intercept wired traffic. The wireless pivot gave them Layer 2 access to the administrative subnet. They used that access to poison the ARP table. After that, they were reading mail that wasn't addressed to them.",
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ── Evidence 2: ARP poisoning analysis ───────────────────────────────
        {
          type: 'evidence',
          id: 'ch4-act2-e2',
          title: 'ARP Poisoning Attack — Forensic Reconstruction',
          classification: 'CLASSIFIED',
          content: `## ARP Poisoning Attack Path\n\n### Background: How ARP Works\nARP (Address Resolution Protocol) maps IP addresses to MAC addresses on a local network segment. When Host A wants to send data to IP 10.10.1.5, it broadcasts 'Who has 10.10.1.5? Tell 10.10.1.1.' The host at that IP responds with its MAC address. Host A then sends frames directly to that MAC.\n\n### The Attack\nARP has no authentication — any device can respond to any ARP query (or send unsolicited ARP replies). The attacker's machine sent gratuitous ARP replies to all hosts on the administrative subnet:\n\n- **Broadcast:** 'IP 10.10.1.1 (the gateway) is at MAC AA:BB:CC:DD:EE:FF (attacker's MAC)'\n- **Result:** All hosts updated their ARP cache to route gateway-bound traffic to the attacker first\n- **Attacker then forwarded traffic to the real gateway** — maintaining connectivity while reading all intercepted traffic\n\n**The attacker's machine was a transparent man-in-the-middle at Layer 2.** TLS-encrypted traffic was still intercepted — though the attacker could only read unencrypted sessions.`,
          evidenceItems: [
            { label: 'Attack Type', value: 'Gratuitous ARP (ARP Spoofing / ARP Poisoning)', highlight: true },
            { label: 'Layer', value: 'Layer 2 (Data Link) — MAC address manipulation', highlight: false },
            { label: 'Traffic Intercepted', value: 'All gateway-bound traffic from admin subnet' },
            { label: 'Unencrypted Sessions Exposed', value: 'Legacy internal monitoring dashboard (HTTP)', highlight: true },
            { label: 'Countermeasure Available', value: 'Dynamic ARP Inspection (DAI) — not deployed' },
          ],
          speaker: 'Janet Park',
          speakerSide: 'left',
          dialogue: "ARP poisoning is a spy swapping address labels in the mailroom. Every letter meant for the postmaster general gets rerouted to the spy's desk first. The spy reads it, reseals the envelope, and sends it along. Nobody on either end notices.",
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ── Knowledge Check 2: ARP poisoning ────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch4-act2-kc2',
          question: "An attacker conducts ARP poisoning on a switched Ethernet network. After the attack, Host A sends a frame to 'the gateway' but the frame actually goes to the attacker's machine. The attacker reads the frame and forwards it to the real gateway. Which attack category BEST describes this?",
          options: [
            'Denial of Service — the attacker is disrupting connectivity for the hosts',
            'Replay attack — the attacker captures and resends legitimate frames',
            'Man-in-the-Middle attack — the attacker intercepts and potentially modifies traffic between two communicating parties',
            'IP spoofing — the attacker is forging IP addresses to impersonate the gateway',
          ],
          correctIndex: 2,
          explanation: "ARP poisoning is a Layer 2 man-in-the-middle (MitM) attack. The attacker positions themselves transparently between two communicating parties — intercepting traffic from Host A to the gateway and vice versa. Neither party is aware of the interception because the attacker forwards traffic normally after reading it. IP spoofing (forging source IPs) is a separate technique. ARP poisoning targets MAC address resolution, not IP address forging.",
          memoryHack: "Man-in-the-Middle = the spy in the mailroom who reads your mail and reseals it. Both sender and recipient think communication is direct and secure. The middle man is invisible.",
          conceptName: 'ARP Poisoning',
          speaker: 'Janet Park',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ── Knowledge Check 3: IDS/IPS types ────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch4-act2-kc3',
          question: "The Nexus cable station deployed a signature-based Network IDS (NIDS). The NIDS generated zero alerts during the 11 days the evil twin AP was active. Which characteristic of signature-based detection MOST explains this failure?",
          options: [
            'NIDS can only monitor wired traffic — wireless activity is invisible to it by design',
            'Signature-based detection requires a known pattern match — if the attack technique or traffic pattern has no existing signature, the IDS generates no alert',
            'The NIDS was overwhelmed by the volume of legitimate network traffic and missed the attack',
            'NIDS cannot detect man-in-the-middle attacks because both sides of the communication appear legitimate',
          ],
          correctIndex: 1,
          explanation: "Signature-based IDS compares traffic patterns against a database of known attack signatures. If the attack does not match a signature (either because it's novel, because the attacker customized their tools, or because the attack uses legitimate protocols and techniques), no alert is generated. This is the fundamental limitation of signature detection: it can only catch what it already knows. Anomaly-based detection, which establishes a behavioral baseline and flags deviations, would have a better chance of detecting the unusual traffic patterns associated with the evil twin and ARP poisoning.",
          memoryHack: "Signature IDS = wanted poster recognition. If there's no poster for the criminal, they walk past the guard undetected. Anomaly IDS = behavioral profiling. If someone starts acting strangely compared to the norm, they get flagged regardless of whether their face matches a poster.",
          conceptName: 'IDS/IPS Detection Methods',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Visual Aid: IDS/IPS comparison ───────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch4-act2-va2',
          title: 'IDS vs IPS — Detection Methods Comparison',
          aidType: 'table',
          headers: ['Attribute', 'IDS (Intrusion Detection)', 'IPS (Intrusion Prevention)'],
          rows: [
            ['Primary Action', 'Detect and alert — passive monitoring', 'Detect and block — active inline response'],
            ['Network Placement', 'Out-of-band (mirror/span port) — traffic copy only', 'Inline — all traffic passes through the IPS'],
            ['Signature-Based', 'Matches traffic against known attack patterns — high accuracy for known threats, blind to unknown', 'Same matching — blocks matched patterns in real time'],
            ['Anomaly-Based', 'Establishes behavioral baselines; flags statistical deviations — catches unknown attacks; higher false positive rate', 'Same detection with active blocking — false positives can disrupt legitimate traffic'],
            ['False Positive Impact', 'Alert fatigue — low operational impact on traffic', 'Legitimate traffic blocked — potential business disruption'],
            ['NIDS vs HIDS', 'NIDS: monitors network traffic. HIDS: monitors host system logs, file integrity, process activity', 'NIPS: network inline. HIPS: host-based agent with blocking capability'],
          ],
          speaker: 'Agent Morales',
          dialogue: "IDS watches and reports. IPS watches and acts. IDS false positives waste analyst time. IPS false positives take down business services. The tradeoff is why many organizations run IDS first, tune it, then convert to IPS after confidence is high.",
          rightCharacter: 'agent_morales',
          rightExpression: 'neutral',
        },

        // ── Timed Decision 2: DNS poisoning response ──────────────────────────
        {
          type: 'timedDecision',
          id: 'ch4-act2-td1',
          scenario: "Janet alerts you: the internal DNS server is now responding to queries for your VPN authentication portal with the attacker's IP address. Users who attempt to authenticate to the VPN will land on a phishing page. Active employees are currently trying to connect. You have 30 seconds.",
          timeLimit: 30,
          options: [
            {
              text: 'Flush the DNS cache on the internal resolver, correct the poisoned record, and push emergency alerts to employees not to use the VPN until confirmed clear',
              isOptimal: true,
              feedback: "Correct three-part response: flush the bad cache, restore the correct record, and immediately warn users before any additional credentials are harvested. Each step is critical — flushing without restoring just causes DNS failure, and restoring without warning means employees hit the phishing site before the fix propagates.",
              xpBonus: 50,
            },
            {
              text: 'Block all outbound DNS traffic immediately — prevents further poisoning',
              isOptimal: false,
              feedback: "Blocking all outbound DNS breaks name resolution for the entire network — all web-based services, email, and authentication stop working. This is a denial-of-service you impose on yourself. Targeted intervention (fix the specific record) is better than scorched earth.",
            },
            {
              text: 'Redirect the attacker\'s IP to a honeypot to identify credentials they capture',
              isOptimal: false,
              feedback: "Intelligence gathering at the expense of employees who are actively being phished. Every second the phishing page receives traffic is another credential stolen. Contain first, then collect intelligence.",
            },
            {
              text: 'Disable the internal DNS server and force all clients to use external DNS',
              isOptimal: false,
              feedback: "External DNS has no awareness of internal resources. VPN authentication, internal services, and domain-joined systems all rely on internal DNS resolution. Disabling the internal DNS server breaks internal network functionality entirely.",
            },
          ],
          conceptName: 'DNS Poisoning',
          speaker: 'Janet Park',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ── Think Like a Manager: Network security governance ─────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch4-act2-tlm1',
          scenario: "Post-incident review reveals three control failures: (1) WPA2-Personal instead of WPA2-Enterprise on the administrative wireless network, (2) No Dynamic ARP Inspection (DAI) on the administrative subnet switches, (3) Signature-only NIDS with no anomaly detection baseline. The IT budget allows for only one remediation initiative this quarter.",
          question: "Which remediation provides the MOST risk reduction across the attack chain that was exploited?",
          options: [
            'Deploy WPA2-Enterprise — this stops the evil twin attack from allowing credential theft even if a rogue AP exists',
            'Enable Dynamic ARP Inspection (DAI) — this blocks ARP poisoning attacks on the wired network',
            'Deploy anomaly-based detection on the NIDS — this would have detected unusual traffic patterns earlier',
            'Implement 802.11 wireless intrusion prevention (WIPS) — this actively detects and deauthenticates rogue access points',
          ],
          correctIndex: 0,
          explanation: "WPA2-Enterprise is the highest-priority remediation because it breaks the attack at the entry point. Without the evil twin pivot, the attacker never gains Layer 2 access to the administrative subnet, making ARP poisoning irrelevant and removing the traffic the NIDS was monitoring for. Fixing the root entry vector eliminates the entire attack chain. The other controls are valuable but address downstream steps of an attack that begins with wireless compromise. Stopping the first step is always higher-value than improving detection mid-chain.",
          managerInsight: "When budget limits your choices, prioritize controls that break the attack chain at its earliest point. Stopping the attacker at the door is more efficient than deploying a dozen controls inside the building. Map your attack chains and cut them at the beginning.",
          conceptName: 'Network Security Architecture',
          speaker: 'Agent Morales',
          rightCharacter: 'agent_morales',
          rightExpression: 'serious',
        },

        // ── Dialogue 3: Act wrap-up ──────────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch4-act2-d3',
          speaker: 'Agent Morales',
          speakerSide: 'right',
          text: "The attacker's network playbook was textbook: wireless entry, ARP pivot, traffic interception. What wasn't textbook was the patience — eleven days, no signature match, no alert. That tells us whoever designed this operation understood exactly which detection gaps we had. The next stop is London. {player}, the identity systems compromised there are how this entire operation was coordinated. I'll see you at Nexus UK.",
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
