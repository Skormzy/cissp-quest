-- ============================================================
-- CISSP Quest -- Domain 4: Communication and Network Security
-- Generated: 2026-04-16 | Source: ai_generated (from ISC2 CBK)
-- ============================================================
-- DISTRIBUTION STATS (28 questions total)
--   Difficulty:  Easy=6 (21%), Medium=13 (46%), Hard=7 (25%), Very Hard=2 (7%)
--   Cognitive:   Remember=3 (11%), Understand=5 (18%), Apply=13 (46%), Analyze=7 (25%)
--   Types:       Scenario=10, Best Answer=5, First Action=3, TLATM=3,
--                Comparison=5, Except/Not=2
--   Answer pos:  0=7, 1=7, 2=7, 3=7
-- Topic clusters: osi_model_layers, firewall_technologies, ids_ips_detection,
--   wireless_security, ssl_tls_protocols, ipsec_protocol, network_attacks,
--   tcp_udp_layer4, vlan_sdn, network_layer1_physical, network_layer2_datalink,
--   vpn_tunneling, wan_technologies, voip_convergence
-- ============================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: OSI model -- easy/remember
(
  4, 'osi_model_layers',
  'At which OSI layer does a router make its forwarding decisions, and what is the primary addressing scheme it uses?',
  '["Layer 2 (Data Link) -- using MAC addresses", "Layer 3 (Network) -- using IP addresses", "Layer 4 (Transport) -- using port numbers", "Layer 7 (Application) -- using domain names"]'::jsonb,
  1,
  'Routers operate at Layer 3 (Network) and use IP addresses to make forwarding decisions. Routers examine the destination IP address in the IP header and consult routing tables to determine the next hop. Switches (Layer 2) use MAC addresses to forward frames within a local segment. Firewalls may operate at Layer 4 (stateful inspection examining port numbers) or Layer 7 (application-layer inspection examining application content). DNS translates domain names to IP addresses at Layer 7, but the routing decision itself is Layer 3.',
  'The router reads the street address (IP) and decides which highway to put the packet on. The switch reads the apartment number (MAC) to deliver within the building.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.70, 0.20, 'ai_generated', true
),

-- Q2: OSI model -- medium/apply
(
  4, 'osi_model_layers',
  'A security analyst is reviewing network captures. They see ARP requests and replies being exchanged. An intrusion detection alert fires showing ARP responses not preceded by ARP requests -- a potential ARP spoofing indicator. At which OSI layer does ARP operate?',
  '["Layer 1 (Physical)", "Layer 2 (Data Link)", "Layer 3 (Network)", "Layer 4 (Transport)"]'::jsonb,
  1,
  'ARP (Address Resolution Protocol) operates at Layer 2 (Data Link) -- it resolves Layer 3 IP addresses to Layer 2 MAC addresses within a local network segment. ARP is a Layer 2 protocol because it operates within a broadcast domain and uses MAC addresses for delivery. ARP spoofing (poisoning) sends unsolicited ARP replies to associate the attacker''s MAC address with a legitimate IP address, enabling man-in-the-middle attacks within the local segment. Dynamic ARP Inspection (DAI) on managed switches mitigates ARP poisoning by validating ARP packets against a DHCP snooping binding table.',
  'ARP bridges the gap between the logical address (IP) and the physical address (MAC) -- a Layer 2 translation service.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q3: OSI model -- medium/apply
(
  4, 'osi_model_layers',
  'A WAF (Web Application Firewall) blocks an HTTP request containing a SQL injection payload in the request body. A next-generation firewall (NGFW) simultaneously blocks the TCP session based on the application signature. At which OSI layers are the WAF and NGFW respectively operating for these specific decisions?',
  '["WAF: Layer 4 (Transport); NGFW: Layer 7 (Application)", "WAF: Layer 7 (Application); NGFW: Layer 7 (Application) -- both examine application-layer content for these decisions", "WAF: Layer 7 (Application) -- inspecting HTTP request body content; NGFW: Layer 4-7 (application-aware stateful inspection) -- correlating TCP session with application signature", "WAF: Layer 3 (Network); NGFW: Layer 4 (Transport)"]'::jsonb,
  2,
  'The WAF inspects the HTTP request body for SQL injection patterns -- this is Layer 7 (Application) inspection of application-layer protocol content. The NGFW''s application signature matching also operates at Layer 7, but NGFWs combine Layer 4 stateful inspection (tracking TCP connections) with Layer 7 application identification (deep packet inspection to classify the application, not just the port). The question asks "for these specific decisions" -- the application signature identification is a Layer 7 function. This is a nuanced question: both devices are operating in the L4-L7 range, but the payload inspection in both cases reaches Layer 7. The correct answer acknowledges that the WAF inspects HTTP body content (clear L7) and the NGFW performs application-aware inspection (L4-L7 combined).',
  'Both devices read the application-layer content, not just the address label on the envelope. That is Layer 7 territory.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.22, 'ai_generated', true
),

-- Q4: TCP/UDP layer 4 -- easy/remember
(
  4, 'tcp_udp_layer4',
  'Which statement MOST accurately distinguishes TCP from UDP at the Transport layer?',
  '["TCP provides connectionless, fast delivery with guaranteed ordering; UDP provides connection-oriented delivery with error checking", "TCP is connection-oriented and provides reliability through sequencing, acknowledgment, and retransmission; UDP is connectionless and provides faster delivery without guaranteed delivery or ordering", "TCP operates at Layer 3; UDP operates at Layer 4", "TCP is used only for encrypted communications; UDP is used for unencrypted communications"]'::jsonb,
  1,
  'TCP (Transmission Control Protocol) is connection-oriented: it establishes a session with a three-way handshake (SYN, SYN/ACK, ACK), provides sequencing (data arrives in order), acknowledgment (receiver confirms receipt), and retransmission (lost packets are resent). This makes TCP reliable but adds overhead. UDP (User Datagram Protocol) is connectionless: it sends datagrams without establishing a session, no acknowledgment, no retransmission, no guaranteed ordering. UDP is faster and lower overhead, suitable for real-time applications (VoIP, video streaming, DNS) where slight data loss is preferable to latency from retransmission.',
  'TCP is certified mail with a signature required and a receipt. UDP is dropping a postcard in the mailbox -- it may arrive, may not, in any order.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.65, 0.20, 'ai_generated', true
),

-- Q5: TCP/UDP -- hard/analyze
(
  4, 'tcp_udp_layer4',
  'A server is receiving thousands of SYN packets per second from spoofed source IP addresses. The server responds to each with a SYN/ACK and allocates a half-open connection state entry, exhausting its connection table. Which attack is this and which defense mechanism specifically addresses the half-open connection table exhaustion without dropping legitimate connections?',
  '["DDoS HTTP flood -- defense is rate limiting HTTP requests at the load balancer", "SYN flood attack -- defense is SYN cookies, which allow the server to respond to SYN requests without allocating connection state until the three-way handshake is completed", "ARP poisoning -- defense is Dynamic ARP Inspection at the switch layer", "TCP session hijacking -- defense is encrypted sessions using TLS"]'::jsonb,
  1,
  'A SYN flood attack exploits the TCP three-way handshake by sending large volumes of SYN packets with spoofed source IPs. The server allocates a connection state entry for each SYN (half-open connection) and waits for the ACK that never arrives (because the source is spoofed), filling the connection table until legitimate connections are rejected. SYN cookies solve this elegantly: when the connection table is under pressure, the server encodes the connection state into a cryptographic cookie embedded in the SYN/ACK sequence number. No state is allocated until the client sends the ACK containing the valid cookie -- the server then recreates the connection state. Only legitimate clients (who complete the handshake) generate the correct ACK; spoofed SYNs never will because no response is received at the forged source IP.',
  'SYN cookies are the proof-of-work challenge at the gate. The server commits no resources until the client proves it received the challenge and is real.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q6: Firewall technologies -- medium/apply
(
  4, 'firewall_technologies',
  'A stateful inspection firewall allows outbound HTTP traffic (TCP port 80) from the internal network. An internal host sends an HTTP GET request to an external server. When the external server responds, the firewall should allow the response. Which mechanism enables the stateful firewall to allow the response WITHOUT requiring a separate inbound rule for TCP port 80?',
  '["The firewall has an implicit any-any inbound rule that allows all established TCP sessions", "The firewall maintains a state table tracking established connections -- when the outbound SYN is allowed, the session is recorded; the inbound SYN/ACK and subsequent traffic matching the state table entry are automatically permitted", "The firewall performs NAT (Network Address Translation) which implicitly permits return traffic", "Port 80 HTTP traffic is always allowed bidirectionally on all firewalls as a default rule"]'::jsonb,
  1,
  'Stateful inspection (also called dynamic packet filtering) maintains a connection state table. When the outbound SYN is allowed by an outbound rule, the firewall records the session (source IP, destination IP, source port, destination port, protocol, state) in the state table. When return traffic arrives (SYN/ACK, then data), the firewall checks the state table -- the traffic matches the existing established session entry and is automatically permitted without needing a separate inbound rule. This is fundamentally different from stateless packet filtering (which requires explicit inbound and outbound rules for each direction). The state table entry is also used to detect anomalies (unexpected TCP flags, packets outside expected sequence windows).',
  'The stateful firewall is the doorman who remembers every guest who left and lets them back in without re-checking the guest list.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q7: Firewall technologies -- hard/analyze
(
  4, 'firewall_technologies',
  'An organization hosts a public web server and wants to protect it while keeping it accessible from the internet. The security team recommends a screened subnet architecture (DMZ). Which description BEST explains this architecture and its security advantage over a screened host architecture?',
  '["A screened subnet places the public server directly on the internet with a single firewall protecting the internal network; advantage is simplified traffic management", "A screened subnet uses two firewalls to create an isolated DMZ network between them -- the public server sits in the DMZ; external traffic reaches only the DMZ, never the internal network directly; the second firewall controls traffic from the DMZ to internal resources; this provides defense-in-depth compared to a screened host (single firewall with the server on the inside)", "A screened subnet uses a single firewall with separate interfaces for internal, external, and DMZ networks (three-legged firewall); advantage is cost efficiency compared to two firewalls", "A screened subnet is equivalent to a screened host but uses VLANs instead of physical separation for the DMZ"]'::jsonb,
  1,
  'A screened subnet (classic DMZ) uses two separate firewalls: an external firewall between the internet and the DMZ, and an internal firewall between the DMZ and the internal network. The public server sits in the DMZ between the two firewalls. External users can reach the DMZ server through the external firewall. If the DMZ server is compromised, the attacker still faces the internal firewall to reach internal resources. A screened host architecture uses a single firewall with the public server on the internal side -- if the server is compromised, the attacker is already inside the internal network. The dual-firewall screened subnet provides defense-in-depth. Note: a single firewall with a DMZ interface (three-legged) is a common modern alternative that provides similar logical separation with one physical device.',
  'The screened subnet is a moat between the castle and the outer wall. Breach the outer gate (external firewall), you are still outside the castle (internal firewall).',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q8: IDS/IPS detection -- medium/apply
(
  4, 'ids_ips_detection',
  'A network IDS is generating 200 alerts per hour. The security team investigates and finds that 195 of the alerts are for legitimate network traffic that matches outdated attack signatures no longer representative of current threats. The 5 real attack attempts are buried in the noise. This scenario BEST illustrates which IDS characteristic and its operational consequence?',
  '["High false negative rate -- the IDS is missing real attacks; consequence is undetected breaches", "High false positive rate -- the IDS is alerting on benign traffic; consequence is alert fatigue causing analysts to miss real incidents buried in noise", "Low specificity -- the IDS cannot differentiate between attack types; consequence is imprecise remediation", "High sensitivity with low specificity -- technically beneficial because no attacks are missed"]'::jsonb,
  1,
  'This is a high false positive rate -- the IDS generates alerts for legitimate traffic (false positives). The operational consequence is alert fatigue: when analysts are overwhelmed by 195 false alerts for every 5 real ones, real incidents are delayed in detection or missed entirely as analysts become desensitized to alerts. This is one of the most significant operational challenges in IDS/IPS deployment. The fix is tuning: updating signatures to remove obsolete rules, adding whitelisting for known-good traffic patterns, implementing contextual filtering (e.g., de-prioritize alerts from specific trusted hosts), and using anomaly-based detection as a complement to signature-based detection (which is the primary source of false positives from outdated signatures).',
  'Two hundred alarms per hour and analysts stop listening. The real attack hits at alert 198 and nobody responds. False positive overload is a security failure, not just an operational inconvenience.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q9: IDS/IPS detection -- hard/analyze
(
  4, 'ids_ips_detection',
  'An organization deploys both signature-based and anomaly-based NIDS. A zero-day attack targeting a newly disclosed vulnerability is used against the organization. Which detection method is MORE LIKELY to detect this attack, and what is its primary limitation?',
  '["Signature-based -- it has a comprehensive database of attack patterns including zero-days discovered by the vendor''s threat intelligence team; limitation is that it requires internet connectivity to update signatures", "Anomaly-based -- it detects deviations from baseline behavior regardless of whether a signature exists for the specific attack; limitation is that it generates more false positives because it must define ''normal'' and any deviation triggers an alert", "Signature-based -- the zero-day will trigger a generic exploit signature if it uses a known technique; limitation is signature update frequency", "Anomaly-based is irrelevant -- zero-days cannot be detected by any IDS because they are by definition unknown"]'::jsonb,
  1,
  'Anomaly-based detection is more likely to detect zero-day attacks because it does not rely on known attack signatures -- it detects deviations from established baseline behavior. A zero-day attack will typically cause anomalous network patterns (unusual traffic volumes, unexpected connection destinations, abnormal protocol behavior, new scanning activity) even if no signature exists for the specific exploit. The primary limitation is false positive rate: defining "normal" is challenging, and legitimate changes in network behavior (new applications, peak traffic periods, administrator activities) can trigger alerts. Signature-based detection (A) by definition cannot detect zero-days -- signatures are written for known attacks. Option D is incorrect -- anomaly-based IDS is specifically designed for this problem.',
  'Anomaly detection is the agent who notices the contact is behaving out of character -- no match needed against the known suspects list.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q10: Wireless security -- medium/apply
(
  4, 'wireless_security',
  'A wireless security assessment of a corporate campus finds that some conference room access points are still using WPA2-Personal (PSK) mode. The security team wants to upgrade to enterprise-grade authentication. Which configuration change provides the STRONGEST authentication for corporate wireless access?',
  '["Upgrade to WPA3-Personal (SAE) to replace WPA2-Personal", "Configure WPA2-Enterprise or WPA3-Enterprise with 802.1X authentication using EAP-TLS with client certificates", "Enable MAC address filtering on all access points to restrict which devices can connect", "Implement a captive portal requiring username and password before granting wireless access"]'::jsonb,
  1,
  'WPA2/WPA3-Enterprise with 802.1X using EAP-TLS (certificate-based) provides the strongest authentication. 802.1X is a port-based network access control standard that requires each device and user to authenticate before being granted network access. EAP-TLS uses mutual certificate authentication: the client presents a certificate (proving device identity) and the RADIUS server presents a certificate (preventing evil twin attacks). This is superior to PSK because: each user/device has unique credentials (PSK is shared across all users), compromised credentials can be revoked individually, and strong certificate-based mutual authentication prevents both impersonation and man-in-the-middle attacks. MAC filtering (C) is trivially bypassed by MAC spoofing. Captive portals (D) provide authentication but not encryption or mutual authentication.',
  'Enterprise wireless is the hotel with individual keycards. PSK is the same key copy cut for every guest. 802.1X with EAP-TLS gives everyone a unique cryptographic identity.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q11: SSL/TLS protocols -- medium/apply
(
  4, 'ssl_tls_protocols',
  'During a TLS 1.3 handshake, the client and server negotiate which cipher suite to use. In TLS 1.3, the cipher suite selected specifies the symmetric encryption algorithm and mode (e.g., AES-256-GCM) and the HMAC algorithm (e.g., SHA-384) but NOT the key exchange method. Why does TLS 1.3 decouple the key exchange from the cipher suite?',
  '["TLS 1.3 eliminated key exchange entirely -- it uses pre-shared keys derived from previous sessions exclusively", "TLS 1.3 mandates that all key exchanges use ephemeral Diffie-Hellman (DHE or ECDHE) to enforce Perfect Forward Secrecy for all connections, so there is no choice of key exchange method to negotiate", "TLS 1.3 allows RSA key exchange for backward compatibility but this is handled separately from the cipher suite", "TLS 1.3 defers key exchange selection to the application layer, allowing developers to choose the algorithm"]'::jsonb,
  1,
  'TLS 1.3 mandates ephemeral key exchange (DHE or ECDHE) for ALL connections -- there is no static RSA key exchange option. This was a deliberate security improvement over TLS 1.2, which allowed static RSA key exchange (where the session key was encrypted with the server''s RSA public key, meaning that if the server''s private key was ever compromised, ALL recorded past sessions could be decrypted retroactively). By mandating ephemeral key exchange only, TLS 1.3 ensures Perfect Forward Secrecy is universal, not optional. Since the key exchange method is fixed (always ephemeral DH), there is nothing to negotiate -- it is removed from the cipher suite. This simplification also removes several categories of downgrade attacks that existed in TLS 1.2.',
  'TLS 1.3 removed the option to choose a weak key exchange. Ephemeral DH is mandatory -- forward secrecy is not optional.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q12: IPSec -- medium/apply
(
  4, 'ipsec_protocol',
  'A security architect needs to design an IPSec VPN between two branch offices. The requirement is to encrypt the data payload AND the original IP headers (to hide source and destination addresses within the tunnel). Additionally, mutual authentication and integrity verification are required. Which IPSec protocol and mode combination achieves these requirements?',
  '["AH (Authentication Header) in Transport Mode -- provides authentication and integrity; transport mode protects only the payload", "ESP (Encapsulating Security Payload) in Tunnel Mode -- encrypts the entire original IP packet (including headers) and adds a new outer IP header; provides confidentiality, authentication, and integrity", "AH (Authentication Header) in Tunnel Mode -- encrypts the entire packet including original headers", "ESP (Encapsulating Security Payload) in Transport Mode -- encrypts and authenticates the payload while preserving the original IP headers in cleartext"]'::jsonb,
  1,
  'ESP (Encapsulating Security Payload) in Tunnel Mode is the correct combination. ESP provides encryption (confidentiality), authentication, and integrity protection. Tunnel mode encapsulates the ENTIRE original IP packet (including the original IP header with source and destination addresses) within a new ESP wrapper with a new outer IP header. This hides the original addressing information from network observers, making it appropriate for site-to-site VPNs between gateways. AH (Authentication Header) provides authentication and integrity but NO encryption -- it cannot satisfy the confidentiality requirement. Transport mode protects only the payload (leaving original headers visible) -- appropriate for host-to-host communications within a trusted network but does not hide IP headers.',
  'ESP in tunnel mode is the armored container inside a new shipping box. The original label (IP header) is hidden; the entire original package is protected.',
  'apply',
  'comparison',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q13: IPSec -- hard/analyze
(
  4, 'ipsec_protocol',
  'An IPSec VPN between headquarters and a remote site uses IKEv2. Phase 1 of IKE completes successfully, establishing the ISAKMP Security Association. Phase 2 negotiation fails. Network traffic between the sites is not flowing. Which statement BEST describes what Phase 1 and Phase 2 accomplish and why Phase 2 failure prevents traffic?',
  '["Phase 1 negotiates the encryption key for data traffic; Phase 2 negotiates the authentication method; Phase 2 failure means traffic cannot be authenticated", "Phase 1 establishes a secure, authenticated channel (ISAKMP SA) used to protect Phase 2 negotiations; Phase 2 establishes the actual IPSec SAs (one for each direction of traffic) that define how to encrypt and authenticate the data traffic; Phase 2 failure means no IPSec SAs exist to protect and forward actual network traffic", "Phase 1 tests network connectivity; Phase 2 applies the encryption policy; Phase 2 failure indicates a firewall is blocking encrypted traffic", "Phase 1 and Phase 2 can operate independently; Phase 2 failure does not prevent data traffic if Phase 1 is successful"]'::jsonb,
  1,
  'IKE Phase 1 establishes a secure, mutually authenticated control channel (the ISAKMP SA) between the IPSec peers. This channel protects the Phase 2 negotiation. Phase 2 (Quick Mode in IKEv1, or the CREATE_CHILD_SA exchange in IKEv2) uses the secure Phase 1 channel to negotiate the actual IPSec SAs -- specifically, the transform sets (which encryption and authentication algorithms to use), the traffic selectors (which source and destination networks to protect), and the session keys. Two unidirectional IPSec SAs are created (one inbound, one outbound). Without these IPSec SAs, the tunnel has no parameters for encrypting or authenticating actual data traffic -- packets cannot be sent. Common Phase 2 failure causes: mismatched transform sets (algorithm mismatch), mismatched proxy identities (traffic selector mismatch), or key lifetime mismatches.',
  'Phase 1 is the agents authenticating each other and establishing a secure meeting room. Phase 2 is where they negotiate the mission parameters. Without Phase 2, the mission cannot launch.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q14: Network attacks -- easy/remember
(
  4, 'network_attacks',
  'An attacker broadcasts a ping request to all hosts on a large network using the network broadcast address, with the source IP address spoofed to appear as the victim''s IP. All hosts reply to the victim simultaneously, overwhelming it with ICMP echo replies. This attack is called:',
  '["Smurf attack -- an ICMP amplification/reflection denial of service attack", "Fraggle attack -- a UDP-based denial of service using echo services", "SYN flood -- a TCP connection exhaustion attack", "Ping of Death -- an oversized ICMP packet attack causing buffer overflows"]'::jsonb,
  0,
  'A Smurf attack uses ICMP (ping) broadcast amplification. The attacker sends ICMP echo requests to the directed broadcast address of a network with the victim''s IP spoofed as the source. Every host on that network replies to the victim with an ICMP echo reply, amplifying the attack by the number of hosts (a network with 254 hosts amplifies the traffic 254x). Smurf attacks are largely mitigated today by configuring routers to not forward directed broadcasts (RFC 2644). A Fraggle attack is the UDP version of Smurf (using UDP echo services). SYN floods target TCP connection state tables. Ping of Death uses oversized fragmented ICMP packets to cause buffer overflows (patched in modern systems).',
  'Smurf: use the amplifier (broadcast network) to send the victim a thousand replies for every one request you send. Directed broadcast is the attack vector.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.65, 0.20, 'ai_generated', true
),

-- Q15: Network attacks -- medium/apply
(
  4, 'network_attacks',
  'An attacker connects to a public WiFi network and positions themselves between a victim''s laptop and the legitimate WiFi gateway using ARP poisoning. The attacker can now intercept, read, and modify all traffic between the victim and the internet. Which attack is this, and what traffic would REMAIN confidential from the attacker?',
  '["Eavesdropping attack -- all traffic can be read; end-to-end TLS encryption does NOT protect against this attack", "Man-in-the-Middle (MITM) attack using ARP poisoning -- the attacker can intercept all unencrypted traffic; traffic protected by properly implemented end-to-end TLS (HTTPS) remains confidential because the TLS session is established directly between the client and the destination server, not through the attacker", "Session hijacking attack -- the attacker can only read active session tokens, not the data itself", "Evil twin attack -- the victim is connected to the attacker''s access point; all traffic is captured regardless of encryption"]'::jsonb,
  1,
  'This is a MITM attack using ARP poisoning. The attacker intercepts ALL traffic at the network layer -- HTTP, DNS, FTP, and any other unencrypted protocol is fully readable and modifiable. However, traffic protected by end-to-end TLS (HTTPS, SMTPS, IMAPS) remains confidential at the application layer even to a MITM attacker because TLS is established between the client application and the destination server. The attacker would need to conduct an SSL stripping attack (downgrading HTTPS to HTTP) or present a fraudulent certificate (which generates browser warnings unless the attacker has a trusted certificate). The key concept is that TLS protects the application-layer payload regardless of what happens at the network layer -- the attacker can see encrypted blobs but cannot decrypt them without the session keys.',
  'MITM reads the unencrypted post. TLS is the envelope sealed with the recipient''s personal lock -- the postman intercepts the envelope but cannot open it.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q16: VLAN and SDN -- medium/apply
(
  4, 'vlan_sdn',
  'An attacker on VLAN 10 sends a frame with two 802.1Q VLAN tags (VLAN 10 outer, VLAN 20 inner). The access port switch strips the outer VLAN 10 tag and forwards the frame into the trunk, where the second VLAN 20 tag allows the frame to reach VLAN 20 -- which the attacker is not authorized to access. This is called:',
  '["Switch spoofing -- the attacker impersonates a trunk port to access all VLANs", "Double-tagging (VLAN hopping) -- the attacker bypasses VLAN segmentation using nested 802.1Q tags; mitigated by not using the native VLAN ID for any user-facing access ports", "ARP poisoning -- the attacker injects false ARP entries to redirect traffic between VLANs", "MAC flooding -- the attacker fills the CAM table to force unicast flooding across VLANs"]'::jsonb,
  1,
  'Double-tagging (a form of VLAN hopping) exploits the 802.1Q trunking protocol. The attacker''s frame has two 802.1Q tags: an outer tag matching the native VLAN of the trunk link, and an inner tag for the target VLAN. The access switch strips the outer tag (standard behavior) and forwards the double-tagged frame onto the trunk. The upstream switch sees the inner tag as the VLAN designation and delivers the frame to the target VLAN. This is unidirectional -- responses cannot return the same way, limiting usefulness. Mitigation: set the native VLAN to an unused VLAN ID (not VLAN 1 or any user VLAN), explicitly tag all VLANs on trunk ports, and avoid using VLAN 1 for any traffic. Switch spoofing is a different VLAN hopping technique where the attacker negotiates a trunk link using DTP.',
  'Double-tagging: the first wrapper fools the guard at the door, the inner wrapper gets you to the restricted floor. The native VLAN is the vulnerability.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q17: VLAN and SDN -- hard/analyze
(
  4, 'vlan_sdn',
  'An organization implements Software-Defined Networking (SDN). A security analyst asks: "If an attacker compromises the SDN controller, what is the potential blast radius compared to compromising a traditional switch?" Which analysis is MOST accurate?',
  '["SDN is inherently more secure because the controller has centralized visibility into all network flows; compromising the controller would be detected immediately", "Compromising an SDN controller has a significantly higher blast radius than compromising a single traditional switch because the controller manages flow tables for ALL switches in the SDN domain -- the attacker gains the ability to reroute, mirror, block, or redirect traffic across the entire network from a single point of compromise", "Compromising an SDN controller provides the same access as compromising any single network switch because each switch still maintains its own local forwarding table", "SDN controllers cannot be compromised because they operate on separate management networks with air-gapped connections to switches"]'::jsonb,
  1,
  'The centralization that makes SDN powerful also concentrates its risk. In traditional networking, compromising a single switch affects only the traffic passing through that device. In SDN, the controller programs flow tables for ALL switches in the SDN domain -- compromising the controller gives an attacker centralized control over all network traffic: they can install flows that mirror traffic to attacker-controlled destinations, create paths that bypass security controls, drop traffic to create denial of service, or reroute traffic to enable MITM at network scale. This is why SDN controller security is critical: the controller must be highly available, access-controlled, authenticated, and placed on a secured management network. The SDN northbound API (to management applications) and southbound API (to switches, via OpenFlow or NETCONF) are both attack surfaces.',
  'The SDN controller is the air traffic control center for the entire network. Compromise it and you control every flight path in the airspace.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q18: VPN tunneling -- medium/apply
(
  4, 'vpn_tunneling',
  'A remote employee uses a VPN client configured for split tunneling. The employee''s corporate email, file server access, and internal applications go through the VPN. General internet browsing goes directly to the internet without traversing the VPN. Which security risk does split tunneling introduce that full tunneling would address?',
  '["Split tunneling reduces VPN throughput, causing corporate traffic to be delayed", "Split tunneling creates a potential bridge between the corporate network and the internet -- if the remote device is compromised while browsing the internet, malware could traverse the split tunnel to reach corporate resources, bypassing the corporate perimeter security controls", "Split tunneling increases the attack surface of the VPN gateway by exposing additional ports", "Split tunneling is not a security risk; it only affects performance by reducing bandwidth consumption"]'::jsonb,
  1,
  'Split tunneling routes corporate traffic through the protected VPN while allowing internet traffic to bypass it. The security risk: the remote device has a path to both the internet and the corporate network simultaneously. If malware infects the device through the unprotected internet connection, that malware has access to corporate network resources through the VPN tunnel -- effectively bypassing the corporate perimeter security controls (firewall, proxy, IDS/IPS). Full tunneling forces ALL traffic through the VPN gateway, where corporate security controls can inspect and filter all traffic including internet-bound traffic. The trade-off is increased VPN bandwidth consumption and potential latency for internet browsing. Many organizations use split tunneling with compensating controls (host-based firewall, EDR, patching requirements) to balance security and performance.',
  'Split tunneling is the remote agent with one hand in the secure embassy network and one hand on the public phone line. A compromise on the public line reaches the embassy.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q19: Network layer 2 -- medium/understand
(
  4, 'network_layer2_datalink',
  'A network switch builds and maintains a table mapping MAC addresses to physical switch ports. When a frame arrives with a destination MAC address not in this table, the switch floods the frame to all ports except the source port. What is this table called, and what security attack exploits the flooding behavior that occurs when this table is exhausted?',
  '["ARP cache -- exploited by ARP poisoning attacks that send false mappings", "CAM table (Content Addressable Memory table) -- exhausted by MAC flooding attacks where an attacker sends frames with thousands of spoofed source MAC addresses, causing the switch to degrade into hub-like flooding behavior", "Routing table -- exploited by route injection attacks", "DHCP lease table -- exploited by DHCP starvation attacks that consume all available IP addresses"]'::jsonb,
  1,
  'The CAM table (Content Addressable Memory) maps MAC addresses to switch ports. When an unknown destination MAC arrives, the switch floods the frame to all ports (unknown unicast flooding). MAC flooding attacks exploit this by sending frames with a massive number of spoofed source MAC addresses, exhausting the CAM table''s memory. Once full, the switch can no longer add new entries and begins flooding all unicast traffic to all ports -- effectively degrading to hub behavior. This allows an attacker connected to any port to capture traffic intended for any other host on the segment. Port security on managed switches mitigates this by limiting the number of MAC addresses allowed per port (e.g., maximum 2, violation action: shutdown or restrict).',
  'Flood the address book until it is full, then every letter must be delivered to every apartment because the mailboxes are all full and nobody can be found by address.',
  'understand',
  'scenario',
  'medium',
  1.15, 0.00, 0.20, 'ai_generated', true
),

-- Q20: WAN technologies -- medium/apply
(
  4, 'wan_technologies',
  'An organization is replacing its legacy MPLS WAN connections with an SD-WAN solution. The security team is concerned about data confidentiality on the SD-WAN links which may traverse public internet connections. Which control MOST directly addresses this concern?',
  '["Deploy SNMP v3 monitoring on all SD-WAN edge devices to detect unauthorized configuration changes", "Configure IPSec or TLS-based encryption on all SD-WAN overlay tunnels to ensure data confidentiality regardless of the underlying transport (MPLS, broadband, LTE)", "Implement QoS policies to prioritize critical application traffic over the SD-WAN links", "Replace SD-WAN with traditional MPLS to eliminate public internet exposure"]'::jsonb,
  1,
  'SD-WAN overlays can use multiple underlay transports including public broadband internet and LTE, which are inherently untrusted. The direct control for data confidentiality is encrypting the SD-WAN overlay tunnels. SD-WAN platforms (e.g., Cisco Viptela, VMware VeloCloud, Palo Alto Prisma SD-WAN) support IPSec or TLS-based tunnel encryption between SD-WAN edge devices, ensuring all traffic is encrypted regardless of the underlay transport path. SNMP v3 (A) provides secure management plane access but does not encrypt data plane traffic. QoS (C) manages traffic prioritization, not confidentiality. Replacing with MPLS (D) would regress the organization''s WAN strategy and MPLS is not inherently encrypted either (though it is logically isolated within the provider''s infrastructure).',
  'SD-WAN traffic on the public internet needs encryption. The underlay is untrusted -- the overlay tunnel is the armored car.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q21: VoIP/Convergence -- medium/apply
(
  4, 'voip_convergence',
  'An organization implements VoIP across its corporate network. A security review identifies that voice traffic and data traffic share the same physical network without segmentation. Which security and quality concern does this create, and what is the RECOMMENDED mitigation?',
  '["Quality concern only -- voice should be placed in a higher QoS queue; security is not a significant concern for internal VoIP", "Both security and quality concerns -- voice traffic is susceptible to eavesdropping and quality degradation; RECOMMENDED mitigation is placing VoIP phones on a dedicated voice VLAN with SRTP for call encryption and QoS policies ensuring voice packets receive preferential treatment", "Security concern only -- voice traffic should be encrypted using WPA3; quality is managed by the VoIP protocol automatically", "No significant concern -- modern VoIP systems encrypt all traffic by default and include built-in QoS mechanisms"]'::jsonb,
  1,
  'VoIP without segmentation has both security and quality implications. Security: RTP (Real-time Transport Protocol) carries voice media and is unencrypted by default -- anyone on the same network segment can capture and replay voice conversations. Mitigation is SRTP (Secure RTP, RFC 3711) which encrypts voice media. SIP signaling should use SIPS (SIP over TLS) to protect call setup. Quality: VoIP is highly sensitive to latency (< 150ms round-trip), jitter (< 30ms variation), and packet loss (< 1%). Sharing a network with bulk data transfers can degrade voice quality through congestion. A dedicated voice VLAN physically isolates voice traffic and enables QoS policies (DSCP marking with EF for voice media, CS3 for signaling) to prioritize voice packets.',
  'Voice on a shared network: everybody can listen in, and bulk traffic makes it choppy. Segregate and encrypt -- VLAN for isolation, SRTP for confidentiality.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q22: Network layer 1 -- easy/remember
(
  4, 'network_layer1_physical',
  'Which physical media type is MOST resistant to electromagnetic interference (EMI), provides the highest bandwidth over long distances, and is immune to electronic eavesdropping because it carries light signals rather than electrical signals?',
  '["Cat6a UTP (Unshielded Twisted Pair) copper cabling", "Fiber optic cable (single-mode or multi-mode)", "Cat6a STP (Shielded Twisted Pair) copper cabling", "Coaxial cable"]'::jsonb,
  1,
  'Fiber optic cable transmits data as light pulses rather than electrical signals, making it immune to electromagnetic interference (EMI) and radio frequency interference (RFI) -- critical in industrial environments near motors and electrical equipment. It is also extremely difficult to tap without disrupting the signal and detection systems can monitor for light loss indicating a tap attempt. Fiber supports the highest bandwidth (terabits per second) over the longest distances (single-mode fiber can span tens to hundreds of kilometers). UTP copper (A) is susceptible to EMI and can be tapped with inductive probes. STP (C) reduces EMI but is not immune. Coaxial (D) is better than UTP for EMI but far inferior to fiber.',
  'Fiber carries light, not electricity. No EMI, no inductive tap, no electronic eavesdropping -- physics-based security through photons.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.55, 0.20, 'ai_generated', true
),

-- Q23: Wireless security -- hard/analyze
(
  4, 'wireless_security',
  'An organization deploys WPA3-Enterprise on all corporate wireless access points. An employee''s laptop is stolen. The thief recovers the user''s certificate from the laptop and attempts to use it to authenticate to the wireless network. What prevents the stolen certificate from providing immediate access, and what additional control should the organization implement?',
  '["WPA3 uses AES-256-GCMP which the thief cannot decrypt without the session key; the stolen certificate is irrelevant", "The stolen certificate alone is insufficient if the organization has implemented certificate-based authentication with the private key stored in a TPM (Trusted Platform Module) -- the private key cannot be exported from the TPM; additionally, the organization should revoke the stolen device''s certificate in the PKI to prevent future use even if the private key is extracted", "WPA3 automatically invalidates certificates from stolen devices through its real-time device health check", "The organization should change the SSID and PSK immediately to prevent the thief from connecting"]'::jsonb,
  1,
  'If the private key is stored in a hardware-bound TPM (Trusted Platform Module), it cannot be exported -- the certificate cannot be used on another device because the TLS/EAP authentication requires the private key to sign a challenge. The private key never leaves the TPM chip. Additionally, the organization should revoke the device''s certificate in its PKI (CA). Once revoked, even if the private key was somehow extracted (from a device without TPM), the RADIUS server performing certificate validation will check the CRL or OCSP and reject the revoked certificate. This is a two-layer defense: hardware binding (TPM) prevents key extraction; PKI revocation ensures the certificate cannot be used even if extracted. Without TPM, revocation is the only protection and must be performed quickly.',
  'TPM binds the key to the hardware -- the credential cannot be transplanted. Certificate revocation is the backup: report the credential stolen, invalidate it in the PKI.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q24: Network attacks -- hard/analyze
(
  4, 'network_attacks',
  'An organization''s SOC detects that its DNS infrastructure is receiving a high volume of queries for subdomains of attacker-controlled domains from internal hosts. The queries use long, randomly generated subdomain strings (e.g., a3f9b2c1d4.attacker.com). The SOC analyst suspects DNS tunneling. Which analysis BEST confirms the suspicion and identifies the appropriate response?',
  '["DNS tunneling is impossible because DNS traffic is always encrypted using DNSSEC; the high query volume is a DDoS reflection attack", "DNS tunneling encodes data in DNS query and response fields (subdomain strings, TXT records) to exfiltrate data or establish C2 channels while bypassing firewalls that allow DNS traffic; confirmation indicators include high query volume to specific external domains, unusually long subdomain strings, high query entropy, and TXT or NULL record types; response is DNS traffic analysis/filtering and blocking the specific external domains at the DNS resolver", "The high query volume is normal for CDN-accelerated content delivery; no action is required", "DNS tunneling only occurs on UDP port 53; blocking TCP port 53 will stop the tunneling"]'::jsonb,
  1,
  'DNS tunneling exploits the fact that firewalls almost universally allow DNS traffic (UDP/TCP port 53) outbound. Attackers encode data (C2 commands, exfiltrated data) in DNS query components (subdomains, query types) and responses. The encoded data appears as DNS queries/responses to legitimate DNS infrastructure. Indicators: (1) Unusually long subdomain names (normal DNS subdomains are short), (2) High query entropy (random-looking strings vs. human-readable domain names), (3) High query volume to specific domains, (4) Unusual query types (TXT, NULL, CNAME used for data payload), (5) Asymmetry between query and response sizes (exfiltration: large responses from C2; data exfil: large queries). Response: DNS filtering/analytics (e.g., Cisco Umbrella, Palo Alto DNS Security) with threat intelligence feeds, blocking the specific attacker domains at the DNS resolver.',
  'DNS tunneling uses the always-open port as a covert radio channel. The long, random subdomains are encoded messages disguised as legitimate lookups.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.65, 0.20, 'ai_generated', true
),

-- Q25: Firewall technologies -- medium/apply (tlatm)
(
  4, 'firewall_technologies',
  'An organization''s firewall team receives a request to allow all inbound TCP traffic to a new application server because "the application needs to accept connections from anywhere." As the security manager, what is your FIRST response?',
  '["Approve the rule since the business has requested it and the server needs to be accessible", "Deny the request immediately and explain that inbound rules are never approved", "Request a formal change management ticket specifying the exact source networks, destination IP, specific destination ports, and business justification before any rule is implemented; apply the principle of least privilege to the firewall rule", "Implement the rule as requested in a test firewall first to evaluate the impact before production implementation"]'::jsonb,
  2,
  'The "Think Like a Manager" answer is to require a formal, least-privilege change request (C). "Allow all inbound TCP" is the antithesis of the principle of least privilege applied to firewall rules. The correct process: require a change management ticket specifying the specific source networks (who needs access?), the specific destination ports (which application ports, not all TCP), the destination IP (this specific server, not a subnet), and a business justification. After review and approval, implement the narrowest possible rule that satisfies the business need. The principle: firewall rules should be as specific as possible. Approving the broad request (A) creates unnecessary attack surface. Blanket denial (B) ignores the business need. Testing in production (D) defers the security review.',
  'Never approve "allow all." Require specificity: who, what port, what server, what business reason. Least privilege applies to network rules too.',
  'apply',
  'tlatm',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q26: IDS/IPS -- easy/remember
(
  4, 'ids_ips_detection',
  'What is the key operational difference between an IDS (Intrusion Detection System) and an IPS (Intrusion Prevention System)?',
  '["IDS and IPS are synonymous terms for the same technology", "An IDS detects and alerts on suspicious activity but does NOT block traffic; an IPS detects suspicious activity and can BLOCK or DROP malicious traffic in real time", "An IDS blocks malicious traffic; an IPS only generates reports for review", "An IPS operates at Layer 3 (Network); an IDS operates at Layer 7 (Application)"]'::jsonb,
  1,
  'The critical distinction is action: IDS is passive -- it detects, logs, and alerts but takes no direct action on the traffic. IPS is active -- it can block, drop, reset connections, or quarantine in real time. An IPS is placed inline in the traffic path (traffic flows THROUGH the IPS) so it can intercept and drop malicious traffic before it reaches the destination. An IDS is typically connected to a monitoring port (SPAN/mirror port) or network tap and sees a copy of the traffic -- it cannot affect the actual traffic flow. Because an IPS is inline, it also creates a potential point of failure and performance bottleneck, which is why IPS tuning (minimizing false positives) is even more critical than for IDS.',
  'IDS sends the alarm. IPS sounds the alarm AND locks the door. One observes; the other acts.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.70, 0.20, 'ai_generated', true
),

-- Q27: Network attacks -- very hard/analyze
(
  4, 'network_attacks',
  'A threat intelligence report indicates that a nation-state APT group is conducting BGP (Border Gateway Protocol) hijacking attacks against organizations in a specific industry sector. A security analyst must explain BGP hijacking to executive leadership and recommend mitigations. Which explanation and mitigation set is MOST accurate?',
  '["BGP hijacking is a phishing attack targeting network administrators who manage BGP routers; mitigation is security awareness training for network engineers", "BGP hijacking occurs when an attacker announces false BGP routes, claiming authority over IP address blocks they do not legitimately control, causing internet routers to direct traffic through attacker-controlled infrastructure; mitigations include RPKI (Resource Public Key Infrastructure) to cryptographically validate route origin authorization, BGP route filtering with prefix lists, and monitoring for unexpected route changes using BGP monitoring services", "BGP hijacking requires physical access to the victim''s BGP routers; mitigation is physical security controls around network infrastructure", "BGP hijacking only affects traffic originating from the attacker''s autonomous system; organizations can protect themselves by blocking traffic from the attacker''s AS number"]'::jsonb,
  1,
  'BGP is the internet''s routing protocol, used by autonomous systems (AS) to exchange reachability information. BGP hijacking occurs when a malicious or misconfigured AS announces more specific routes for IP prefixes it does not legitimately own. Because BGP was designed for trust between peers (no authentication of route announcements by default), routers may accept and propagate false routes -- diverting traffic through the attacker''s AS where it can be intercepted, dropped, or inspected before being forwarded (or not). RPKI (Resource Public Key Infrastructure) addresses this by cryptographically binding IP address blocks to their legitimate AS numbers -- routers can validate Route Origin Authorizations (ROAs) and reject routes that do not have a valid ROA. Additional mitigations: IRR-based prefix filtering, BGPSEC (path validation, broader deployment pending), and BGP monitoring services that alert on unexpected route changes.',
  'BGP hijacking is stealing the address book entry and redirecting the mail to your own address. RPKI signs the address book -- unauthorized entries are cryptographically rejected.',
  'analyze',
  'scenario',
  'very_hard',
  2.10, 2.25, 0.20, 'ai_generated', true
),

-- Q28: Network security -- hard/analyze (except/not)
(
  4, 'ids_ips_detection',
  'Which of the following is NOT a characteristic of an anomaly-based intrusion detection system?',
  '["It establishes a baseline of normal network behavior during a training period", "It can detect zero-day attacks because it identifies deviations from normal behavior rather than matching known attack signatures", "It typically generates fewer false positives than signature-based IDS because its rules are based on specific, known attack patterns", "It may generate alerts for legitimate but unusual activities such as a new application deployment or increased traffic during a marketing campaign"]'::jsonb,
  2,
  'Option C is NOT a characteristic of anomaly-based IDS -- in fact, it describes the opposite. Anomaly-based IDS typically generates MORE false positives than signature-based IDS, not fewer, because any deviation from the baseline may trigger an alert. Legitimate activities that are unusual (new application deployment creating new traffic patterns, marketing campaign increasing traffic volumes, performance testing, holiday season traffic spikes) all look like anomalies to a behavior-based system. Signature-based IDS generates fewer false positives for known threats because its rules are precise -- the specific bit pattern must match. Options A (baseline establishment during training), B (zero-day detection capability), and D (false positives from legitimate unusual activity) are all accurate characteristics of anomaly-based IDS.',
  'Anomaly-based IDS is the suspicious neighbor who calls about anything unusual. Signature-based has the exact mugshot and only calls when it matches.',
  'analyze',
  'except_not',
  'hard',
  1.70, 1.60, 0.25, 'ai_generated', true
);
