-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 4 (Communication and Network Security)
-- Topics: 4.3.1 through 4.9.1
-- Source basis: ISC2 CBK, OSI model (ISO/IEC 7498-1), RFC 791 (IPv4),
--               RFC 4301 (IPSec), RFC 8446 (TLS 1.3), RFC 3588 (RADIUS),
--               IEEE 802.11i, NIST SP 800-77, NIST SP 800-153,
--               and public-domain cybersecurity knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 4.3.1 OSI Model Deep Dive
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.3.1',
  'OSI Model Deep Dive',
  'The OSI model''s 7 layers (Physical → Data Link → Network → Transport → Session → Presentation → Application) provide a framework for understanding where network attacks occur, where security controls operate, and how network technologies interact.',
  '## OSI Model Deep Dive

The OSI (Open Systems Interconnection) model (ISO/IEC 7498-1) is a conceptual framework that divides network communication into seven layers, each with a specific function and a defined interface with adjacent layers. While real-world protocols often do not map cleanly onto OSI layers (TCP/IP collapses several), the OSI model remains the standard vocabulary for describing where protocols operate, where attacks target, and where security controls apply.

### Layer 1: Physical

The Physical layer handles the raw bit transmission over a physical medium — electrical signals, light pulses (fiber optic), or radio waves (wireless). It defines voltage levels, cable specifications, connector types, and transmission rates. Security relevance: physical wiretapping, interference and jamming, rogue hardware implants, and EMI attacks all operate at Layer 1. Security controls at Layer 1 include physical cable protection, EMI shielding, secure wiring closets, and fiber optic cabling (which is harder to tap than copper). PDU: bits.

### Layer 2: Data Link

The Data Link layer provides node-to-node data transfer within the same network segment, using MAC (Media Access Control) addresses. It handles error detection (but not correction), framing, and access control to the shared medium. Protocols include Ethernet (IEEE 802.3), Wi-Fi (IEEE 802.11), and PPP. Security relevance: ARP poisoning, MAC address spoofing, VLAN hopping, and 802.1X port-based access control all operate at Layer 2. Switches operate at Layer 2. PDU: frames.

### Layer 3: Network

The Network layer handles logical addressing (IP addresses) and routing packets across networks. Protocols include IPv4 (RFC 791), IPv6 (RFC 2460), ICMP, and routing protocols (OSPF, BGP, EIGRP). Security relevance: IP spoofing, ICMP attacks (Smurf, Ping of Death), BGP hijacking, and routing attacks operate at Layer 3. Firewalls and routers operate at Layer 3. IPSec tunnel mode operates at Layer 3. PDU: packets.

### Layer 4: Transport

The Transport layer provides end-to-end communication between processes, including segmentation, reassembly, and — in TCP — reliable delivery through acknowledgment, retransmission, and flow control. Protocols include TCP (connection-oriented, reliable) and UDP (connectionless, unreliable but fast). Security relevance: SYN flood attacks exploit TCP three-way handshake (Layer 4). Port scanning identifies open services at Layer 4. Firewalls using stateful inspection track TCP connection state at Layer 4. TLS operates between Layer 4 and Layer 7. PDU: segments (TCP) / datagrams (UDP).

### Layer 5: Session

The Session layer manages sessions — logical connections between applications. It handles session establishment, maintenance, and termination, and provides synchronization (checkpointing for long transfers). Protocols implementing session management include RPC, NetBIOS, and SQL sessions. Many real implementations combine Layer 5 functionality with Layer 6 or Layer 7. PDU: data.

### Layer 6: Presentation

The Presentation layer is responsible for data formatting, encoding, compression, and encryption/decryption. It translates data between the application format and the network format, ensuring that data sent by one system can be interpreted by another. Functions include character set translation (ASCII to EBCDIC), data compression, and encryption. SSL/TLS is sometimes described as operating at Layer 6 because it handles encryption and formatting, though it is more precisely described as operating between Layer 4 and Layer 7. PDU: data.

### Layer 7: Application

The Application layer provides the interface between user applications and the network. Protocols include HTTP/HTTPS, DNS, SMTP, FTP, SSH, SNMP, Telnet, and LDAP. Security relevance: application-layer attacks (SQL injection, XSS, command injection, buffer overflow in application processing) target Layer 7. Application firewalls (WAFs) and proxy servers operate at Layer 7. DLP solutions that inspect email or web content operate at Layer 7. PDU: data.

### Security Controls by OSI Layer

Understanding which OSI layer a security control operates at helps explain what it can and cannot protect against. A Layer 3 firewall that filters on IP addresses cannot inspect the content of an HTTPS session (Layer 7). A Layer 7 web application firewall can inspect HTTP content but cannot detect a MAC address spoofing attack (Layer 2). Effective security requires controls at multiple layers.',
  NULL,
  '{"headers": ["Layer", "Name", "PDU", "Address Type", "Key Protocols", "Security Threats", "Security Controls"], "rows": [["7", "Application", "Data", "N/A", "HTTP, HTTPS, DNS, SMTP, FTP, SSH", "SQLi, XSS, buffer overflow, command injection", "WAF, proxy, application security controls"], ["6", "Presentation", "Data", "N/A", "SSL/TLS (encryption), MIME, ASCII/Unicode", "Data format exploits", "Encryption/decryption, data validation"], ["5", "Session", "Data", "N/A", "RPC, NetBIOS, SQL session", "Session hijacking", "Session tokens, timeouts"], ["4", "Transport", "Segment/Datagram", "Port numbers", "TCP, UDP", "SYN flood, port scanning", "Stateful firewall, rate limiting, TLS"], ["3", "Network", "Packet", "IP address", "IP, ICMP, OSPF, BGP", "IP spoofing, BGP hijacking, ICMP attacks", "Router ACLs, stateless firewall, IPSec"], ["2", "Data Link", "Frame", "MAC address", "Ethernet (802.3), Wi-Fi (802.11), PPP", "ARP poisoning, MAC spoofing, VLAN hopping", "802.1X, port security, dynamic ARP inspection"], ["1", "Physical", "Bits", "N/A", "Ethernet cables, fiber, radio", "Wiretapping, jamming, hardware implants", "Physical security, EMI shielding, fiber optic"]]}'::jsonb,
  'OSI model exam questions most commonly test: (1) Which layer does a specific protocol or device operate at. (2) Where a specific attack targets (ARP poisoning = Layer 2; IP spoofing = Layer 3; SYN flood = Layer 4; SQL injection = Layer 7). (3) Which OSI layer a specific security control works at. Memorize the layer order in both directions. Key device mappings: Hub = Layer 1, Switch = Layer 2, Router = Layer 3, Gateway = Layer 4-7. TLS = operates between Layer 4 and 7 (exam may say Layer 5/6).',
  'As a manager, the OSI model is the language your network and security teams use to communicate about where problems and controls live. When your security team reports an "ARP poisoning attack," they are describing a Layer 2 problem that cannot be fixed by a Layer 3 firewall. When they propose a WAF, they are adding Layer 7 visibility. Understanding the model helps you ask the right questions about whether your security investments address the right layers.',
  'Please Do Not Throw Sausage Pizza Away — Physical, Data Link, Network, Transport, Session, Presentation, Application (bottom to top). Or from Application down: All People Seem To Need Data Processing. Attacks go to where their layer lives: ARP = Layer 2, IP = Layer 3, TCP = Layer 4, HTTP = Layer 7.',
  'At the Cable Station in Singapore, the network architecture diagram on the wall shows the OSI stack for every major connection. Copper cables entering the building are labeled Layer 1. The switch rack is labeled Layer 2 with VLAN and 802.1X controls noted. The router cluster is Layer 3 with ACLs. The load balancer handles Layer 4 (TCP). The proxy appliance is Layer 7. An attack the team is investigating started at Layer 3 (spoofed IP) and moved up to Layer 7 (application exploit) — the diagram helps them see the full attack path.'
);

-- ---------------------------------------------------------------------------
-- 4.4.1 Firewall Technologies and Architectures
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.4.1',
  'Firewall Technologies and Architectures',
  'Firewalls evolve from simple packet filters to stateful inspection to application proxies to NGFWs — with each generation providing deeper traffic understanding and control, and DMZ architectures using multiple firewalls to create segmented security zones.',
  '## Firewall Technologies and Architectures

A firewall is a network security device that monitors and controls incoming and outgoing network traffic based on predetermined security rules. Firewalls have evolved through several generations, each adding more sophisticated traffic analysis capabilities. The CISSP exam tests knowledge of firewall types, their strengths and limitations, and how they are deployed in architectures including the DMZ.

### Packet Filtering Firewall (Generation 1)

Packet filtering firewalls operate at **OSI Layer 3 (Network)** and inspect individual packets based on header information: source IP, destination IP, source port, destination port, and protocol (TCP/UDP/ICMP). Rules are defined as Access Control Lists (ACLs). Packet filters are fast and have low overhead because they do not maintain state information. However, they cannot distinguish between packets belonging to established connections versus new connection attempts, cannot inspect packet payload, and are vulnerable to IP spoofing and fragmentation attacks. A packet filter that allows inbound TCP traffic on port 80 cannot tell whether a particular packet is part of an established legitimate session or is a crafted attack packet.

### Stateful Inspection Firewall (Generation 2)

Stateful inspection firewalls (also called dynamic packet filtering) maintain a **state table** — a record of established connections — and use this context when evaluating packets. A packet is allowed not just because it matches a rule, but because it is part of a legitimately established session tracked in the state table. Return traffic from an outbound connection is automatically allowed without a matching inbound rule because the firewall knows the session was established from the inside. Stateful inspection operates primarily at **Layer 3-4** and is the foundation of most modern firewalls. SYN flood attacks can exhaust a stateful firewall''s state table — a known DoS vector.

### Application-Layer Proxy Firewall (Generation 2.5)

A proxy firewall (also called an application gateway or application-layer gateway) terminates the network connection and establishes a new connection to the destination on the client''s behalf. It operates at **Layer 7** and can perform deep inspection of application protocol content — an HTTP proxy can inspect the URL, method, headers, and body of every HTTP request. Because the proxy terminates the connection, attackers cannot bypass it by exploiting lower-layer characteristics. A dedicated proxy for each protocol is required (HTTP proxy, FTP proxy, SMTP proxy), and proxies add latency. Circuit-level gateways are a variant that operate at Layer 5 (session), proxying connections without inspecting application content.

### Next-Generation Firewall (NGFW)

An NGFW combines stateful inspection with application-level inspection, intrusion prevention, TLS/SSL inspection, identity awareness (user-based rules rather than just IP-based), and advanced threat protection (sandboxing, reputation-based filtering). NGFWs can identify applications by their behavior regardless of port number (recognizing Netflix traffic on port 443 as video streaming, not generic HTTPS), enforce policies based on user identity from Active Directory or LDAP, and decrypt and inspect TLS traffic. NGFWs operate at all OSI layers simultaneously. Examples: Palo Alto Networks, Fortinet, Check Point.

### DMZ Architecture

A **Demilitarized Zone (DMZ)** is a network segment that sits between the internal trusted network and the untrusted internet, hosting services that must be accessible to the internet (web servers, email servers, DNS) while being separated from the internal network. The DMZ topology creates two security zones: external-to-DMZ traffic is more permissive (web port 80/443 allowed from internet to DMZ web server), while DMZ-to-internal traffic is strictly controlled (the web server in the DMZ should have only minimal, specific access to internal databases).

**Single firewall DMZ**: One firewall with three interfaces — internet, DMZ, and internal network. Simpler but less secure; a compromised firewall exposes all three zones.

**Dual firewall DMZ**: Two firewalls in series — an external firewall (screened router) that allows internet-to-DMZ traffic, and an internal firewall that controls DMZ-to-internal traffic. Preferred architecture for environments with high-value internal assets; a compromise of the external firewall does not immediately give access to the internal network.',
  NULL,
  '{"headers": ["Firewall Type", "OSI Layer", "Maintains State?", "Inspects Payload?", "Identity-Aware?", "Primary Strength", "Primary Weakness"], "rows": [["Packet Filter", "Layer 3", "No", "No", "No", "Fast, low overhead", "No state tracking; vulnerable to spoofing and fragmentation"], ["Stateful Inspection", "Layer 3-4", "Yes (connection state table)", "No", "No", "Tracks connection state; more intelligent than packet filter", "Cannot inspect application content; state table DoS possible"], ["Application Proxy", "Layer 7", "Yes (per application protocol)", "Yes", "Partially", "Deep application content inspection; true man-in-the-middle understanding", "Protocol-specific; slower; requires proxy for each protocol"], ["NGFW", "All layers (L3-L7)", "Yes", "Yes (including TLS decryption)", "Yes (user-based policies)", "Combines all previous capabilities plus threat intelligence, sandbox", "Complex configuration; TLS inspection introduces privacy concerns"]]}'::jsonb,
  'Firewall exam areas: (1) Match the firewall type to its OSI layer (packet filter = L3, stateful = L3-4, proxy = L7, NGFW = all). (2) Stateful firewalls track connection state; packet filters do not. (3) Application proxy = terminates and re-establishes connection. (4) DMZ = zone between internet and internal network for public-facing servers. (5) Dual-firewall DMZ is more secure than single-firewall. (6) A firewall that allows or denies based on IP address and port is a packet filter; one that tracks sessions is stateful.',
  'As a manager, firewall architecture decisions must balance security depth against operational complexity and performance. A single NGFW at the perimeter is not defense-in-depth — it is a single point of failure. Internal segmentation with micro-segmentation or zone-based firewalls between different parts of the internal network is what stops a perimeter breach from becoming a full network compromise. Budget for the right number of security zones, not just the cheapest perimeter solution.',
  'PSANG — Packet filter (Sees Address, Nothing Generated), Stateful (Sees state), Application proxy (All packets proxied through it), NGFW (No traffic Goes unseen). Each generation sees more. DMZ = the no man''s land between internet and your castle — internet can reach the drawbridge (DMZ), not the throne room (internal).',
  'At the Cable Station in Singapore, four firewall models sit on the test bench. The first is an old ACL router — a packet filter that only looks at IP headers. The second is a stateful box with a state table display showing thousands of active connections. The third is an HTTP proxy that terminates and re-establishes every web session. The fourth is the NGFW at the perimeter — it decrypts TLS, identifies applications, applies user-based policies, and feeds the SIEM. The network diagram on the wall shows the dual-firewall DMZ: the web server farm sits between the external and internal firewalls, reachable from the internet but segregated from the database layer.'
);

-- ---------------------------------------------------------------------------
-- 4.5.1 IDS/IPS Technologies
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.5.1',
  'IDS/IPS Technologies',
  'IDS detects attacks and alerts; IPS detects and blocks inline — both use signature-based (known threats) and anomaly-based (statistical deviation) detection, and placement decisions (NIDS vs HIDS, inline vs span port) determine what each can see and do.',
  '## IDS/IPS Technologies

An Intrusion Detection System (IDS) monitors network traffic or host activity and generates alerts when it detects potentially malicious activity. An Intrusion Prevention System (IPS) adds the ability to block or drop malicious traffic in real time, not just alert. The difference is architectural: an IDS is typically passive (out-of-band, receives copies of traffic), while an IPS is inline (all traffic passes through it, enabling blocking at the cost of adding latency and creating a potential chokepoint).

### Network-Based vs Host-Based

**NIDS (Network Intrusion Detection System)**: Deployed on the network, monitors traffic passing through a segment. Typically receives traffic through a span port (SPAN/mirror port on a switch that copies all traffic on one or more interfaces to the monitoring port) or a network tap. NIDS can detect network-level attacks (port scans, DoS attempts, network worm propagation, malformed packets) but cannot see encrypted traffic unless TLS inspection is provided upstream, and cannot see traffic within an individual host.

**HIDS (Host Intrusion Detection System)**: Runs as an agent on individual hosts. Monitors system logs, file system changes (integrity monitoring), process activity, system calls, and registry modifications. HIDS can see exactly what is happening on a single host, including malicious activity that never traverses the network (local privilege escalation, malware execution from a USB drive). HIDS cannot see attacks on other hosts or network-level activity. Examples: OSSEC, Wazuh, Tripwire (file integrity only).

### Signature-Based Detection

Signature-based detection (also called misuse detection or knowledge-based detection) compares network traffic or host activity against a database of known attack patterns (signatures). A signature might match a specific exploit payload, a known malware hash, or a specific sequence of network packets associated with a known attack. Advantages: high accuracy for known attacks, low false positive rate for established signatures, explicit audit trail ("triggered by signature SID-XXXXX"). Limitations: cannot detect unknown (zero-day) attacks, requires continuous signature updates, susceptible to signature evasion (obfuscation, fragmentation, encoding tricks that avoid triggering the signature while still achieving the attack goal).

### Anomaly-Based Detection

Anomaly-based detection (also called behavioral or statistical detection) establishes a baseline of "normal" activity through a learning period, then alerts when activity deviates significantly from that baseline. A user who suddenly accesses 50,000 files on a file server at 2 AM when they normally access 200 files per day is an anomaly. Advantages: can detect unknown attacks and novel behavior, does not require signature updates for new attack patterns. Limitations: high false positive rate (legitimate unusual activity triggers alerts), requires a training period to establish baselines, attackers who understand the baseline can operate "slowly and low" to avoid triggering anomaly thresholds.

### False Positives and False Negatives

**False positive**: The IDS/IPS alerts on or blocks benign activity. Also called a false alarm. High false positive rates cause alert fatigue — analysts stop taking alerts seriously — and blocking false positives disrupts legitimate business. Signature-based systems tend to have lower false positive rates; anomaly-based systems tend to have higher false positive rates.

**False negative**: The IDS/IPS fails to detect actual malicious activity. Also called a missed detection. False negatives allow attacks to succeed undetected. Signature-based systems have high false negative rates for zero-day attacks; anomaly-based systems may miss attacks that stay within normal behavioral bounds.

**CER (Crossover Error Rate)**: In biometric systems (and sometimes referenced in IDS context), the point at which the false acceptance rate and false rejection rate are equal. In IDS terms, optimal tuning minimizes both false positives and false negatives simultaneously, which is impossible to achieve perfectly — any increase in sensitivity to catch more attacks will also increase false positives.

### IPS Placement

An IPS must be deployed **inline** — all traffic flows through it — to enable blocking. Inline placement introduces latency (the IPS must process each packet before forwarding) and creates a potential availability chokepoint (IPS failure could disrupt all traffic unless fail-open/fail-closed behavior is configured). **Fail-open** IPS behavior passes traffic uninspected if the IPS fails (prioritizes availability over security). **Fail-closed** IPS behavior drops all traffic if the IPS fails (prioritizes security over availability). The choice depends on the criticality of the protected services.',
  NULL,
  '{"headers": ["", "NIDS", "HIDS", "NIPS", "HIPS"], "rows": [["Placement", "Span port / tap (out-of-band)", "Agent on individual host", "Inline (all traffic passes through)", "Agent on individual host"], ["Can block traffic?", "No (alert only)", "No (alert only)", "Yes (drop malicious packets)", "Yes (block malicious process/connection)"], ["Sees encrypted traffic?", "Only if TLS inspection upstream", "Yes (host decrypts locally)", "Only if TLS inspection built in", "Yes (host decrypts locally)"], ["Can detect host-local attacks?", "No", "Yes (file changes, process activity)", "No", "Yes"], ["Creates chokepoint?", "No", "No", "Yes", "No"], ["Primary use case", "Network-level attack detection", "Host integrity, malware on specific hosts", "Inline blocking of known network attacks", "Block malicious process execution on endpoints"]]}'::jsonb,
  'IDS/IPS exam areas: (1) IDS detects + alerts; IPS detects + blocks. IPS must be inline. (2) NIDS = network (span port); HIDS = host (agent). (3) Signature-based = known attacks, low FP; anomaly-based = unknown attacks, high FP. (4) False positive = alert on benign (alert fatigue risk). False negative = miss real attack. (5) Fail-open = pass traffic if IPS fails; fail-closed = drop traffic if IPS fails. (6) NIDS cannot see encrypted traffic without TLS inspection.',
  'As a manager, IDS/IPS effectiveness is entirely dependent on the quality of tuning and the processes for responding to alerts. An IDS that generates 1,000 alerts per day with no analyst workflow is a compliance checkbox, not a security control. Invest in tuning alert thresholds, establishing triage procedures, and regularly reviewing detection rates and false positive rates. Combine NIDS and HIDS for defense-in-depth — network coverage catches what the host cannot see, and host coverage catches what encrypted traffic hides from the network.',
  'NIDS/HIDS = Network or Host detection. IPS = Inline Prevention (adds blocking to detection). Signature = sign-board (only recognizes faces it knows). Anomaly = alarm when the routine is broken (catches strangers behaving strangely). FP = False alarm (cried wolf). FN = Failed notice (wolf got in silently). IPS fails: open = traffic flows through (availability); closed = traffic stops (security).',
  'At the Cable Station in Singapore, three monitoring stations run parallel. The NIDS station shows a span port feed from the core switch — it catches a port scan and alerts (no blocking — it is out-of-band). The inline NIPS sits between the internet firewall and the internal router — it just dropped an SQL injection payload in an HTTP request without human intervention. The HIDS console shows a file integrity alert on a web server — a configuration file changed outside the approved change window. All three alerts feed into the SIEM for correlation.'
);

-- ---------------------------------------------------------------------------
-- 4.6.1 Wireless Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.6.1',
  'Wireless Security',
  'WEP is completely broken; WPA2 (802.11i/AES-CCMP) is the baseline security requirement; WPA3 with SAE closes KRACK and offline dictionary attack weaknesses — with 802.1X/EAP-TLS and enterprise authentication providing the strongest WLAN security for corporate environments.',
  '## Wireless Security

Wireless networks introduce unique security challenges because the transmission medium (radio frequency) cannot be physically controlled the way wired cables can. Any device within radio range can receive wireless frames. This fundamental characteristic means that wireless security depends entirely on cryptographic protection — without strong encryption and authentication, wireless communications are effectively broadcast in the clear to anyone listening.

### WEP: Completely Broken

WEP (Wired Equivalent Privacy, IEEE 802.11-1999) was the original wireless security mechanism. It uses RC4 stream cipher with 40-bit or 104-bit keys combined with a 24-bit initialization vector (IV). WEP has multiple critical weaknesses: the 24-bit IV space (16 million possible values) means IVs are reused rapidly on busy networks, and RC4 with repeated IVs leaks keystream; statistical analysis of enough IV reuse allows full key recovery. Tools like Aircrack-ng can break WEP encryption in minutes with sufficient captured traffic. WEP must never be used. It provides essentially no security.

### WPA: Stopgap with TKIP

WPA (Wi-Fi Protected Access) was introduced in 2003 as an emergency stopgap measure to replace WEP without requiring hardware replacement. It uses TKIP (Temporal Key Integrity Protocol), which adds per-packet key mixing, a sequence counter to prevent replay attacks, and a stronger integrity check (Michael MIC). TKIP still uses RC4 as its base cipher. WPA/TKIP has known vulnerabilities and is also deprecated. Do not use it.

### WPA2: The Baseline Standard (802.11i)

WPA2, based on IEEE 802.11i (finalized 2004), replaced RC4/TKIP with AES-based CCMP (Counter Mode with CBC-MAC Protocol). CCMP provides both encryption (AES in CTR mode) and integrity (CBC-MAC authentication). WPA2 operates in two modes:

**WPA2-Personal (WPA2-PSK)**: Uses a pre-shared key known to all clients and the access point. The PSK is vulnerable to offline dictionary attacks: an attacker who captures the WPA2 four-way handshake can attempt to crack the PSK offline. Strong, random passphrases (20+ characters) significantly increase cracking time. The KRACK (Key Reinstallation Attack) vulnerability (2017) allows an attacker within range to force nonce reuse in WPA2-CCMP, potentially decrypting traffic.

**WPA2-Enterprise**: Uses 802.1X authentication with an EAP method. The client authenticates to a RADIUS server using credentials (certificates, username/password) rather than a shared key. Each authenticated session gets unique session keys. This eliminates offline dictionary attacks and prevents KRACK-level exposure to shared key material.

### WPA3: The Current Standard

WPA3 (Wi-Fi Alliance, 2018) addresses WPA2''s key weaknesses:

**WPA3-Personal**: Replaces PSK with SAE (Simultaneous Authentication of Equals) — a password-authenticated key exchange based on Dragonfly (RFC 7664). SAE provides forward secrecy and is resistant to offline dictionary attacks even if the handshake is captured, because the key is established through a zero-knowledge proof rather than transmitted in verifiable form.

**WPA3-Enterprise**: Adds optional 192-bit security mode using Suite B cryptography (AES-256-GCMP, HMAC-SHA-384) for environments requiring government-grade protection.

### EAP Variants in 802.1X

802.1X wireless authentication uses EAP (Extensible Authentication Protocol) with multiple variants:

**EAP-TLS**: Client presents a certificate; server presents a certificate. Mutual authentication. Strongest 802.1X method but requires PKI to issue client certificates to every device.

**PEAP (Protected EAP)**: Establishes a TLS tunnel using the server certificate, then carries another EAP method (typically MSCHAPv2) inside the tunnel for user authentication. Commonly used with username/password without client certificates.

**EAP-TTLS**: Similar to PEAP — TLS outer tunnel protecting inner authentication. Supports a wider variety of inner authentication methods.

### Rogue Access Points and Evil Twin

A **rogue access point** is an unauthorized AP connected to the corporate network — either installed by an employee for convenience or by an attacker for malicious purposes. Rogue APs can provide direct network access bypassing perimeter security. Detection requires wireless intrusion detection system (WIDS) scanning.

An **evil twin** is an attacker-controlled AP broadcasting the same SSID as a legitimate network to attract clients. Clients that connect to the evil twin expose their traffic to the attacker. 802.1X with server certificate validation prevents evil twin attacks because the client validates the server certificate during EAP authentication — a fake AP cannot present a valid certificate for the organization''s RADIUS server.',
  NULL,
  '{"headers": ["Standard", "Encryption", "Authentication", "Known Weaknesses", "Status"], "rows": [["WEP", "RC4 + 24-bit IV", "Shared key (weak)", "IV reuse → full key recovery in minutes", "Broken — never use"], ["WPA/TKIP", "RC4 + TKIP per-packet key mixing", "PSK or 802.1X", "RC4 weaknesses; Michael MIC attack", "Deprecated — do not use"], ["WPA2-Personal", "AES-CCMP (128-bit)", "Pre-shared key (PSK)", "Offline dictionary attack on handshake; KRACK (2017)", "Acceptable with strong random PSK; WPA3-Personal preferred"], ["WPA2-Enterprise", "AES-CCMP (128-bit)", "802.1X + EAP (RADIUS)", "KRACK (limited impact in enterprise); server cert validation required to prevent evil twin", "Recommended for corporate environments"], ["WPA3-Personal", "AES-CCMP + SAE handshake", "SAE (Dragonfly)", "Side-channel attacks in early implementations (patched)", "Current standard for personal/home networks"], ["WPA3-Enterprise", "AES-256-GCMP (optional)", "802.1X + EAP (RADIUS) + 192-bit suite", "Requires compatible hardware", "Current standard for high-security corporate"]]}'::jsonb,
  'Wireless security exam areas: (1) WEP = broken, use nothing. WPA/TKIP = deprecated. WPA2-CCMP = current baseline. WPA3/SAE = current best practice. (2) WPA2-PSK is vulnerable to offline dictionary attacks; WPA2-Enterprise (802.1X) is not. (3) EAP-TLS = mutual certificate authentication (strongest but requires PKI). PEAP = server cert + user password in TLS tunnel. (4) Evil twin attacks are defeated by validating the server certificate in EAP. (5) KRACK was a WPA2 nonce-reuse vulnerability — WPA3/SAE addresses it.',
  'As a manager, your wireless security posture for a corporate environment should be WPA2-Enterprise or WPA3-Enterprise with 802.1X/EAP-TLS. The use of shared PSKs in a corporate environment is an authentication failure — you cannot attribute network access to an individual and you cannot revoke access for a departed employee without changing the PSK for everyone. Guest networks should be isolated from corporate networks with their own SSID, separate VLAN, and internet-only routing.',
  'WEP-TKIP-WPA2-WPA3: WiFi Evolution Progression. Remember it as WEP is Wretched, TKIP is Troubled, WPA2 is Workable (PSK) or Wonderful (Enterprise), WPA3 is the Winner. For 802.1X EAP variants: EAP-TLS = certificate both sides (Trustworthy both sides). PEAP = Protected EAP = TLS outer shell, password inside.',
  'At the Cable Station in Singapore, the wireless survey dashboard shows three SSIDs. The legacy WEP SSID is colored red with a skull icon — it is kept visible in the museum exhibit only. The corporate WPA2-Enterprise SSID shows 200 connected clients, all authenticated via EAP-TLS certificates managed by the internal PKI. The guest WPA3-Personal SSID uses a long random SAE passphrase, is on a separate VLAN, and routes only to the internet. A rogue AP alert just fired — someone plugged a consumer router into the switch room. The WIDS auto-contains it within seconds.'
);

-- ---------------------------------------------------------------------------
-- 4.7.1 IPSec Protocol Suite
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.7.1',
  'IPSec Protocol Suite',
  'IPSec secures IP communications at Layer 3 using Authentication Header (AH) for integrity/authentication and Encapsulating Security Payload (ESP) for confidentiality — operating in transport mode (endpoint-to-endpoint) or tunnel mode (network-to-network via gateways).',
  '## IPSec Protocol Suite

IPSec (Internet Protocol Security, RFC 4301) is a suite of protocols that provide security services directly at the IP layer (OSI Layer 3). Unlike TLS, which operates above the transport layer and must be built into each application, IPSec protects all IP traffic between endpoints regardless of the application. This makes IPSec ideal for VPNs and for securing communications between network gateways.

### IPSec Core Protocols

**Authentication Header (AH, RFC 4302)**: Provides data integrity and origin authentication for IP packets, but does NOT provide confidentiality (no encryption). AH calculates an HMAC over the entire IP packet (including most of the IP header), detecting any modification of the packet in transit. AH cannot traverse NAT (Network Address Translation) because NAT modifies the IP header, which invalidates the AH integrity check.

**Encapsulating Security Payload (ESP, RFC 4303)**: Provides confidentiality (encryption), integrity, and origin authentication for IP packets. ESP encrypts the payload portion of the IP packet and calculates an integrity check over the ESP header and payload. Unlike AH, ESP does not protect the outer IP header, but ESP can traverse NAT (particularly in NAT-T mode, encapsulated in UDP port 4500). In practice, ESP is the dominant protocol because most deployments require confidentiality, and ESP provides all the security services AH provides (plus encryption).

### IPSec Modes

**Transport Mode**: IPSec operates between two endpoints — the original IP headers are preserved, and only the payload (or the original IP header plus payload, depending on AH vs ESP) is protected. Transport mode is used for end-to-end communications between individual hosts. The endpoints must both speak IPSec.

**Tunnel Mode**: The entire original IP packet is encapsulated inside a new IP packet with new IP headers. The original source and destination addresses are hidden inside the encrypted envelope. Tunnel mode is used for VPNs between network gateways (routers or firewalls), where the gateway speaks IPSec on behalf of hosts on the protected network. The hosts themselves do not need to be IPSec-capable — they route normally to their gateway, which handles the tunnel.

### IKE: Internet Key Exchange

IPSec requires that the communicating parties establish shared keys before encrypted communications begin. IKE (Internet Key Exchange) is the protocol used for this negotiation. IKE operates in two phases:

**IKE Phase 1**: Establishes a secure, authenticated channel between the two IPSec peers using Diffie-Hellman key exchange, digital certificates or pre-shared keys for authentication, and negotiation of cryptographic algorithms. The result is an IKE Security Association (SA) — a secure channel for the next phase.

**IKE Phase 2**: Uses the secure channel from Phase 1 to negotiate the actual IPSec SAs (one for each direction of traffic) — the algorithms, keys, and lifetimes used for the IPSec tunnel itself.

**IKEv2** (RFC 7296, 2014) improves on IKEv1 with fewer message exchanges, better DoS resistance, built-in NAT traversal, and improved reliability. IKEv2 is the current standard.

### Security Associations

A **Security Association (SA)** is a one-directional relationship defining the security parameters for a connection: algorithm suite, key material, lifetime, and sequence number. A bidirectional IPSec connection requires two SAs (one in each direction). SAs are identified by a Security Parameter Index (SPI) in the packet header.',
  NULL,
  '{"headers": ["", "Authentication Header (AH)", "Encapsulating Security Payload (ESP)"], "rows": [["Provides Confidentiality?", "No", "Yes (encryption)"], ["Provides Integrity?", "Yes", "Yes"], ["Provides Authentication?", "Yes", "Yes"], ["NAT compatible?", "No (NAT modifies header; breaks integrity check)", "Yes (with NAT-T; encapsulated in UDP 4500)"], ["What is protected?", "Entire packet including IP header", "Payload (and ESP header); outer IP header not authenticated"], ["RFC", "RFC 4302", "RFC 4303"], ["Practical use today?", "Rare (AH alone provides no encryption)", "Dominant choice in nearly all deployments"]]}'::jsonb,
  'IPSec exam areas: (1) AH = integrity + authentication only (NO encryption); cannot traverse NAT. (2) ESP = confidentiality + integrity + authentication; NAT-traversal capable. (3) Transport mode = end-to-end between hosts. Tunnel mode = gateway-to-gateway (encapsulates entire original packet). (4) IKE Phase 1 = establish secure channel; IKE Phase 2 = negotiate IPSec SAs. (5) ESP is used in practice because AH provides no confidentiality. Watch for questions about NAT + IPSec — AH fails through NAT; ESP with NAT-T works.',
  'As a manager, IPSec is the foundation of site-to-site VPNs between office locations and the remote access VPN infrastructure your workforce depends on. The key operational questions are algorithm selection (ensure the negotiated cipher suites match your cryptographic standards), IKE version (prefer IKEv2), and SA lifetime management. Monitor for VPN tunnel flaps and failed IKE negotiations — they indicate either misconfiguration or active attack attempts against the VPN endpoint.',
  'AH = Authentication Head only (no body = no encryption). ESP = Encrypted Secure Payload (has a body = encrypted). Modes: Transport = same headers (same neighborhood); Tunnel = new wrapper (moving to a new address). IKE = the key exchange before the secret conversation: Phase 1 = meet securely, Phase 2 = agree on what to say privately.',
  'At the Cable Station in Singapore, two network gateways — one in Singapore and one in Frankfurt — are building an IPSec tunnel. The engineers watch the IKE logs: Phase 1 completes (ISAKMP SA established — secure channel for negotiation). Phase 2 completes (two IPSec SAs — one outbound, one inbound). Tunnel mode selected because two entire site networks communicate. ESP chosen because the CFO''s financial data flowing through needs encryption. The AH-only option is crossed off the design doc with a note: "NAT breaks it and no encryption anyway."'
);

-- ---------------------------------------------------------------------------
-- 4.8.1 SSL/TLS Protocol
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.8.1',
  'SSL/TLS Protocol',
  'TLS (Transport Layer Security) provides confidentiality, integrity, and server authentication for application-layer protocols — TLS 1.3 eliminates deprecated ciphers and reduces handshake latency to 1-RTT, while older SSL 2.0/3.0 and TLS 1.0/1.1 are broken and must be disabled.',
  '## SSL/TLS Protocol

TLS (Transport Layer Security) is the cryptographic protocol that secures the majority of internet communications — HTTPS, SMTPS, IMAPS, FTPS, and dozens of other protocols. It provides confidentiality (encryption), integrity (HMAC), and authentication (certificate-based server authentication, optionally mutual). SSL (Secure Sockets Layer) was the predecessor; SSL 2.0 and 3.0 are cryptographically broken. The name "SSL" is still colloquially used, but the current protocol is TLS, most recently TLS 1.3 (RFC 8446, 2018).

### TLS 1.3 Handshake

TLS 1.3 redesigned the handshake for both security and performance. The TLS 1.3 handshake completes in **1-RTT (one round trip time)**, compared to 2-RTT for TLS 1.2. Key steps:

1. **ClientHello**: Client sends supported protocol versions, cipher suites, and key shares (ECDHE public values for multiple groups). TLS 1.3 pre-emptively sends key shares, so the server can begin key derivation immediately.
2. **ServerHello + EncryptedExtensions + Certificate + CertificateVerify + Finished**: Server selects cipher suite, sends its certificate, proves possession of the private key (CertificateVerify), and derives session keys from the ECDHE exchange. From ServerHello onward, the server''s responses are encrypted.
3. **Client Finished**: Client validates the server certificate, derives session keys, and sends a Finished message. Application data can now flow.

TLS 1.3 also supports **0-RTT resumption** for returning clients (session resumption without full handshake), which reduces latency for repeat connections but introduces replay attack risk for non-idempotent requests.

### TLS 1.3 Security Improvements

TLS 1.3 removes all broken and weak cryptographic options from TLS 1.2:
- No more RSA key exchange (which lacked perfect forward secrecy) — only ECDHE/DHE
- No more MD5, SHA-1, RC4, DES, 3DES, or export-grade ciphers
- No more compression (vulnerable to CRIME attack)
- No more renegotiation (vulnerable to renegotiation attack)
- Mandatory perfect forward secrecy (all cipher suites use ephemeral key exchange)

Supported cipher suites in TLS 1.3 are all AEAD: TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384, TLS_CHACHA20_POLY1305_SHA256.

### Certificate Validation

When a TLS client connects, it must validate the server''s certificate: (1) the certificate is signed by a trusted CA (chain of trust to a trusted root); (2) the certificate has not expired; (3) the certificate has not been revoked (CRL or OCSP check); (4) the Subject Alternative Name (SAN) in the certificate matches the hostname being connected to. Failure to validate any of these allows a man-in-the-middle attack using a fraudulent certificate.

### Common TLS Attacks

**BEAST** (Browser Exploit Against SSL/TLS): Exploited CBC mode in TLS 1.0''s predictable IV. Fixed by TLS 1.1+ and mitigated in TLS 1.0 clients.

**POODLE** (Padding Oracle On Downgraded Legacy Encryption): Exploited SSL 3.0''s CBC padding. Fixed by disabling SSL 3.0 entirely.

**HEARTBLEED** (CVE-2014-0160): A buffer over-read in OpenSSL''s implementation of the TLS Heartbeat extension, not a TLS protocol flaw. Allowed attackers to read server memory, potentially exposing private keys. Fixed by OpenSSL update.

**CRIME/BREACH**: Compression side-channel attacks that allow recovery of encrypted HTTP session cookies. Fixed by disabling TLS compression (CRIME) and mitigated in applications (BREACH).

**DROWN**: Attack on TLS servers that supported SSLv2 on any port. Exploited SSLv2 protocol weaknesses to decrypt TLS 1.x sessions. Fixed by disabling SSLv2 globally.',
  NULL,
  '{"headers": ["Protocol Version", "Year", "Status", "Key Weaknesses", "Action"], "rows": [["SSL 2.0", "1994", "Broken — must disable", "Fundamental protocol flaws; DROWN attack", "Disable completely"], ["SSL 3.0", "1996", "Broken — must disable", "POODLE attack; CBC padding oracle", "Disable completely"], ["TLS 1.0", "1999", "Deprecated by PCI DSS and NIST", "BEAST attack; weak cipher support", "Disable; PCI DSS required disabled by June 2018"], ["TLS 1.1", "2006", "Deprecated by RFC 8996 (2021)", "No forward secrecy mandatory; weak ciphers", "Disable"], ["TLS 1.2", "2008", "Acceptable if configured correctly", "Depends on cipher suite selection; allows weak options", "Acceptable with strong cipher suite configuration"], ["TLS 1.3", "2018", "Current standard — required for new deployments", "0-RTT replay risk (mitigable)", "Require for all new deployments"]]}'::jsonb,
  'TLS exam areas: (1) TLS 1.3 uses only ECDHE (perfect forward secrecy mandatory), only AEAD ciphers, 1-RTT handshake. (2) SSL 2.0/3.0 = broken; TLS 1.0/1.1 = deprecated. (3) POODLE = SSL 3.0 / CBC padding. BEAST = TLS 1.0 / CBC IV. HEARTBLEED = OpenSSL implementation bug, not TLS protocol. (4) Certificate validation must check: chain of trust, expiration, revocation, AND hostname match. (5) Perfect forward secrecy = ECDHE key exchange means compromise of long-term private key cannot decrypt past sessions.',
  'As a manager, TLS configuration is an operational compliance matter — TLS 1.0/1.1 is explicitly prohibited by PCI DSS and increasingly by other frameworks. Your TLS configuration should be validated regularly using tools like SSL Labs server test (Qualys SSL Labs), which grades servers against current best practices. Any grade below A is a finding in a PCI audit and a risk in virtually any security assessment.',
  'TLS Timeline: SSL 2.0 (Shattered Legacy), SSL 3.0 (POODLE Killed it), TLS 1.0 (BEAST Broke it), TLS 1.1 (Short-lived), TLS 1.2 (Still Surviving with care), TLS 1.3 (Today''s Standard). HEARTBLEED was OpenSSL''s heart-attack — not TLS itself. Perfect Forward Secrecy = ephemeral keys that vanish after the session, protecting past conversations even if the long-term key is later compromised.',
  'At the Cable Station in Singapore, the TLS monitoring dashboard shows the cipher suite distribution for every inbound connection. TLS 1.3 with ECDHE_AES_256_GCM handles 94% of connections. The remaining 6% TLS 1.2 connections are flagged for migration. A red banner still shows one legacy server accepting TLS 1.0 from an old payment terminal — it is on the remediation list with a 30-day deadline. The certificate monitoring panel shows all certificates renewing automatically via ACME protocol, with OCSP stapling enabled on every production server.'
);

-- ---------------------------------------------------------------------------
-- 4.9.1 Network Attacks
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.9.1',
  'Network Attacks',
  'Network attacks exploit protocol weaknesses at every OSI layer — from IP spoofing (Layer 3) to SYN floods (Layer 4) to DNS poisoning (Layer 7) — with DDoS attacks combining multiple vectors and BGP hijacking posing infrastructure-level routing threats.',
  '## Network Attacks

Network-layer attacks target the protocols and infrastructure that underpin all network communications. Understanding these attacks is essential for designing network security architectures, configuring defensive controls, and recognizing attack indicators. The CISSP exam tests both the mechanism of each attack and the appropriate countermeasures.

### DoS and DDoS

**Denial of Service (DoS)** is any attack that degrades or eliminates the availability of a service, system, or network resource. A DoS attack from a single source is relatively easy to mitigate by blocking the source IP.

**Distributed Denial of Service (DDoS)** uses a large number of compromised systems (a botnet) to simultaneously flood a target, making source blocking infeasible. DDoS attacks may target:
- **Volumetric attacks**: Flood the target with traffic to exhaust bandwidth (UDP floods, ICMP floods, DNS amplification). Measured in bits per second (Gbps).
- **Protocol attacks**: Exhaust network device resources (SYN flood exhausts TCP state tables on firewalls and servers). Measured in packets per second (PPS).
- **Application-layer attacks (Layer 7 DDoS)**: Target application resources with legitimate-looking requests (HTTP floods, Slowloris — sends HTTP headers slowly to hold connections open). Measured in requests per second (RPS).

Mitigations include upstream traffic scrubbing (cloud-based DDoS mitigation services like AWS Shield, Cloudflare, Akamai), rate limiting, SYN cookies (for SYN floods), and ingress/egress filtering (RFC 2827, BCP 38) to reduce spoofed-source traffic.

### SYN Flood

A SYN flood exploits the TCP three-way handshake. An attacker sends large volumes of TCP SYN packets with spoofed source IP addresses. The server responds with SYN-ACK packets to addresses that never complete the handshake, filling the server''s TCP state table (SYN queue) with half-open connections. When the SYN queue is full, legitimate connection attempts are dropped. **SYN cookies** mitigate SYN floods: instead of allocating state for each SYN, the server encodes connection state in the TCP sequence number (cookie) sent in the SYN-ACK, only allocating state when a valid ACK is received.

### ARP Poisoning

ARP (Address Resolution Protocol) maps IP addresses to MAC addresses within a local network segment. ARP has no authentication — any host can send gratuitous ARP replies claiming any IP-to-MAC mapping. An **ARP poisoning attack** (also called ARP spoofing) floods the local network with forged ARP replies, causing other hosts to update their ARP caches with the attacker''s MAC address for a target IP (e.g., the default gateway). Traffic destined for the gateway is then sent to the attacker, who can inspect or modify it before forwarding (man-in-the-middle). Countermeasures include Dynamic ARP Inspection (DAI) on managed switches, static ARP entries for critical hosts, and encrypted communications (which remain confidential even if intercepted).

### DNS Poisoning

**DNS cache poisoning** (also called DNS spoofing) corrupts the DNS resolver''s cache with fraudulent DNS records, redirecting victims to attacker-controlled IP addresses when they resolve domain names. Classic DNS uses UDP without authentication — a well-timed forged DNS response with a matching transaction ID can poison a resolver''s cache. The Kaminsky attack (2008) demonstrated a practical large-scale cache poisoning technique. **DNSSEC** (DNS Security Extensions) adds digital signatures to DNS records, allowing resolvers to validate that DNS responses are authentic and unmodified. Countermeasures also include using source port randomization and randomizing transaction IDs (defense in depth against the Kaminsky attack).

### IP Spoofing

IP spoofing involves forging the source IP address in IP packet headers to disguise the attacker''s identity or impersonate another host. Spoofing is used in DoS/DDoS attacks (SYN floods with spoofed sources), reflection attacks (sending requests to amplifiers with the victim''s IP as the source, so amplified responses flood the victim), and certain authentication bypass attempts. **BCP 38 / RFC 2827 ingress filtering** requires that ISPs and network operators drop packets arriving from customers that do not originate from the customer''s assigned address space, significantly reducing spoofing.

### BGP Hijacking

BGP (Border Gateway Protocol) is the routing protocol that exchanges routing information between autonomous systems (ASes) — the building blocks of the internet. BGP has minimal authentication by default and relies on trust relationships between ISPs. **BGP hijacking** occurs when a malicious or misconfigured AS announces IP prefixes it does not own, causing routers across the internet to direct traffic for those prefixes to the hijacker. BGP hijacking can redirect massive volumes of internet traffic, including traffic to financial institutions, government networks, and critical infrastructure. Countermeasures include RPKI (Resource Public Key Infrastructure), which cryptographically validates that an AS is authorized to originate a specific IP prefix.',
  NULL,
  '{"headers": ["Attack", "OSI Layer", "Mechanism", "Countermeasure", "Protocol Exploited"], "rows": [["SYN Flood", "Layer 4", "Exhausts TCP SYN queue with spoofed half-open connections", "SYN cookies, rate limiting, upstream scrubbing", "TCP"], ["ARP Poisoning", "Layer 2", "Forged ARP replies poison ARP caches → MITM", "Dynamic ARP Inspection (DAI), static ARP, encrypted comms", "ARP"], ["DNS Poisoning", "Layer 7 (DNS application)", "Forged DNS response corrupts resolver cache → redirect", "DNSSEC, source port randomization, DoH/DoT", "DNS (UDP/TCP 53)"], ["IP Spoofing", "Layer 3", "Forged source IP to hide identity or enable amplification/reflection", "BCP 38 ingress filtering, uRPF", "IP"], ["BGP Hijacking", "Layer 3 (routing infrastructure)", "Announce unauthorized IP prefixes to redirect internet routing", "RPKI, BGP prefix filtering, monitoring", "BGP"], ["DDoS Volumetric", "Layer 3-4", "Flood target with traffic to exhaust bandwidth", "Upstream scrubbing, cloud DDoS mitigation, rate limiting", "UDP, ICMP, amplification protocols"], ["DDoS Application", "Layer 7", "Flood target with legitimate-looking requests to exhaust app resources", "WAF, rate limiting, CAPTCHA, CDN", "HTTP/HTTPS"]]}'::jsonb,
  'Network attack exam areas: (1) SYN flood = Layer 4, exhausts TCP state table, mitigated by SYN cookies. (2) ARP poisoning = Layer 2, MITM, mitigated by Dynamic ARP Inspection. (3) DNS poisoning = Layer 7, corrupts resolver cache, mitigated by DNSSEC. (4) IP spoofing = Layer 3, forged source IP, mitigated by BCP 38 ingress filtering. (5) BGP hijacking = routing infrastructure attack, mitigated by RPKI. Know both the mechanism AND the countermeasure for each attack — exams frequently pair them.',
  'As a manager, network attacks that matter most to you are the ones that affect business availability (DDoS) and data integrity (ARP poisoning MITM, DNS poisoning). Ensure your internet-facing services have DDoS mitigation (cloud-based scrubbing services are cost-effective for most organizations). Internal network attacks (ARP poisoning) require managed switch infrastructure with DAI enabled and VLAN segmentation. DNS poisoning requires DNSSEC validation at your resolvers.',
  'SADIBS — SYN flood (Swamps the TCP), ARP Poisoning (Address Resolution Poisoned — MITM), DNS Poisoning (Directs to fake site), IP Spoofing (Impersonates source), BGP Hijacking (Border Gateway Protocol — route theft). Each attack has its layer: SYN=4, ARP=2, DNS=7, IP Spoof=3, BGP=3. Each has a cure: SYN cookies, DAI, DNSSEC, BCP38, RPKI.',
  'At the Cable Station in Singapore, the NOC screens show four active threat indicators. Top left: SYN flood alert — the rate limiter is absorbing 2 million SYN packets per second and SYN cookies are active on the load balancer. Top right: ARP poisoning alert from VLAN 10 — DAI on the access switch has blocked 500 forged ARP replies in the last 60 seconds and quarantined the source port. Bottom left: DNS anomaly alert — a resolver''s cache has an unusual record for the company''s banking site; DNSSEC validation failed, and the record is being flushed. Bottom right: BGP route alert — a foreign AS just announced a more specific prefix for Nexus''s IP space; the RPKI validator has flagged it as invalid and peer ISPs are being notified.'
);

-- ---------------------------------------------------------------------------
-- 4.9.2 VPN Technologies
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  4,
  '4.9.2',
  'VPN Technologies',
  'VPNs create encrypted tunnels over untrusted networks — SSL/TLS VPNs provide clientless browser-based access, IPSec VPNs provide full network connectivity, and split tunneling controls whether all or only corporate-destined traffic traverses the VPN tunnel.',
  '## VPN Technologies

A Virtual Private Network (VPN) creates an encrypted, authenticated tunnel over an untrusted network (typically the internet), allowing remote users and branch offices to securely access private network resources as if they were physically present on the local network. VPN technology is the foundation of secure remote work, site-to-site connectivity, and secure third-party access. NIST SP 800-77 (Guide to IPsec VPNs) and SP 800-113 (Guide to SSL VPNs) provide foundational guidance.

### IPSec VPN

IPSec VPNs use the IPSec protocol suite (AH and ESP, covered separately) to create encrypted tunnels at Layer 3. For remote access, IPSec typically operates in **tunnel mode** with the entire original IP packet encapsulated in a new IP envelope. Site-to-site IPSec VPNs connect two network gateways, with all traffic between the two sites traversing the encrypted tunnel transparently to end users.

IPSec remote access requires a dedicated VPN client installed on the endpoint. The client handles IKE negotiation, tunnel establishment, and routing of corporate-bound traffic through the tunnel. Common IPSec VPN clients include Cisco AnyConnect (which also supports SSL VPN), GlobalProtect (Palo Alto), and built-in OS clients (Windows, macOS, Linux support IKEv2 natively).

**Advantages of IPSec VPN**: Full Layer 3 network connectivity (any IP protocol, not just TCP-based applications); lower overhead than SSL VPN for sustained high-volume traffic; mature and well-understood protocol.

**Limitations**: Requires a VPN client; may be blocked by firewalls that filter non-HTTP traffic (UDP 500 and 4500 for IKE and NAT-T); complex to configure and troubleshoot.

### SSL/TLS VPN

SSL VPNs (more precisely TLS VPNs — but the term "SSL VPN" is standard in the industry) use TLS to create the VPN tunnel, operating over HTTPS (TCP port 443). Because port 443 is permitted through virtually every firewall and is indistinguishable from normal HTTPS traffic, SSL VPNs work reliably from any network environment including hotels, airports, and restrictive corporate networks.

**SSL VPN modes**:

**Clientless SSL VPN**: Access is provided entirely through a web browser — no VPN software installed on the endpoint. The VPN gateway acts as a reverse proxy, presenting a web portal through which users access specific applications (web apps, file shares via web interface, RDP via HTML5 client). Clientless VPN is limited to TCP-based applications accessible through a browser. Useful for managed-device restrictions or guest access scenarios.

**Thin-client SSL VPN**: A small applet (Java or ActiveX historically; modern implementations use downloadable executables) is downloaded and run in the browser to provide access to specific ports and protocols beyond what a browser alone can handle.

**Full-tunnel SSL VPN**: A downloaded client creates a full network tunnel, similar to IPSec. All traffic (or split-tunnel traffic) is routed through the VPN. The client typically provides a better user experience than legacy thin-client approaches.

### Split Tunneling

**Split tunneling** is a VPN configuration that allows the remote user''s traffic to be routed selectively:

- **Split tunneling enabled**: Traffic destined for corporate networks (defined IP ranges or domains) routes through the VPN tunnel; all other traffic (internet browsing, personal cloud services, streaming) goes directly to the internet without passing through the VPN gateway. This reduces VPN gateway load and improves internet performance for users.

- **Full tunneling (split tunneling disabled)**: All traffic from the remote endpoint routes through the VPN tunnel, including internet traffic. The VPN gateway sees and can inspect/filter all user traffic. This approach enables content filtering and DLP for remote users but increases gateway load and adds latency for internet access.

**Security tradeoff**: Split tunneling exposes corporate endpoints to internet threats on the local network side — if an endpoint is compromised while split tunneling is active, malware on the endpoint has both internet access (C2 communication) and VPN access to corporate resources simultaneously. Full tunneling forces all traffic through corporate security controls but at the cost of performance and gateway capacity.

### Always-On VPN

An **always-on VPN** configuration automatically establishes and maintains the VPN connection whenever the device is online, before the user logs in (machine tunnel for initial connectivity) and for all user sessions. Always-on VPN ensures that corporate security policies (filtering, DLP, monitoring) apply to the endpoint at all times, eliminating the security gap between VPN sessions. It is increasingly the standard for corporate endpoints in zero-trust architecture implementations.',
  NULL,
  '{"headers": ["VPN Type", "Protocol", "Client Required?", "Supported Apps", "Firewall Traversal", "Primary Use Case"], "rows": [["IPSec VPN (remote access)", "IPSec (IKEv2, ESP tunnel mode)", "Yes — dedicated VPN client", "All IP protocols", "May be blocked (UDP 500/4500); NAT-T helps", "Corporate remote access with full network connectivity"], ["IPSec VPN (site-to-site)", "IPSec (IKEv2, ESP tunnel mode)", "No client — gateway-to-gateway", "All IP protocols between sites", "Gateway-managed; NAT-T if needed", "Branch office to HQ or data center connectivity"], ["SSL/TLS VPN (clientless)", "TLS (HTTPS port 443)", "No — browser only", "TCP apps accessible via browser (web, RDP/HTML5, file share)", "Excellent — port 443 rarely blocked", "BYOD access, restricted endpoints, guest access"], ["SSL/TLS VPN (full tunnel client)", "TLS (HTTPS port 443)", "Yes — downloaded client", "All TCP; UDP varies by implementation", "Excellent — port 443 rarely blocked", "Remote workforce on any network (hotels, airports, home)"], ["Always-On VPN", "IPSec or TLS", "Yes — pre-installed corporate client", "All (full tunnel)", "Excellent — configured for reliability", "Zero-trust remote work; enforced corporate policy for all endpoints"]]}'::jsonb,
  'VPN exam areas: (1) IPSec VPN = Layer 3 tunnel using IKE + ESP. SSL VPN = TLS tunnel over HTTPS (port 443). (2) Clientless SSL VPN = browser only, limited to TCP/web-accessible apps. Full tunnel SSL VPN = downloaded client, full connectivity. (3) Split tunneling = corporate traffic through VPN, internet traffic direct — reduces gateway load but exposes endpoint. Full tunnel = all traffic through VPN — higher security but more load. (4) Always-on VPN enforces security policies continuously. (5) SSL VPN traverses firewalls more easily than IPSec because port 443 is almost universally permitted.',
  'As a manager, VPN architecture has direct security policy implications. If you enable split tunneling to improve user experience, you are accepting that a compromised remote endpoint has simultaneous internet-facing attack surface and VPN access to corporate resources. For high-trust corporate devices, always-on full-tunnel VPN is the right answer. For BYOD and contractor devices, clientless SSL VPN for specific applications enforces the access boundary without extending full network trust to unmanaged devices. VPN gateway capacity planning is also a management concern — the shift to remote work has caused multiple organizations to experience VPN availability incidents during high-demand periods.',
  'VPN Types: ISS — IPSec (full network, client needed), SSL/TLS VPN (browser-friendly, HTTPS port 443, clientless option), Split tunneling (Selective routing — corporate through VPN, internet direct). Full tunnel = everything through the pipe. Split = selective routing. Always-on = never off. Clientless = just a browser — limited apps. SSL = works everywhere because port 443 is never blocked.',
  'At the Cable Station in Singapore, three VPN configurations are visible on the network diagram. The branch offices in Jakarta and Kuala Lumpur connect via site-to-site IPSec tunnels — IKEv2, AES-256-GCM, always-on gateway tunnels. Remote corporate employees connect via full-tunnel TLS VPN client — all their traffic routes through the Singapore gateway for filtering and DLP inspection (split tunneling is explicitly disabled per security policy). Third-party vendors who need occasional access to specific web applications get access through the clientless SSL VPN portal — they authenticate with MFA, land on a portal showing only the three applications they are authorized to use, and can never access the corporate LAN directly.'
);
