-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 4: Communication and Network Security
-- 100 questions for CAT engine
-- Distribution: 15 easy, 55 medium, 20 hard, 10 very hard
-- Cognitive: 10 remember, 20 understand, 45 apply, 25 analyze
-- Types: 25 scenario, 20 first_action, 15 best_answer,
--        10 most_likely, 10 tlatm, 10 comparison, 5 calculation, 5 except_not
-- Correct answer positions: 25 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY (15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: Easy / Remember / Comparison — correct at 0
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  4,
  'osi_model',
  'What is the PRIMARY difference between a hub and a switch?',
  '["A hub broadcasts to all ports while a switch forwards only to the destination port", "A hub operates at Layer 3 while a switch operates at Layer 2", "A hub encrypts traffic while a switch does not", "A hub supports VLANs while a switch does not"]'::jsonb,
  0,
  'A hub is a Layer 1 device that broadcasts all incoming traffic to every port, creating a single collision domain. A switch is a Layer 2 device that reads MAC addresses and forwards frames only to the specific port where the destination device is connected. This fundamental difference makes switches more efficient and more secure than hubs.',
  'Hub = Hearing Unintelligent Broadcast. Switch = SmartWich-way to send.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q2: Easy / Remember / Best Answer — correct at 1
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  4,
  'osi_model',
  'Which OSI layer is PRIMARILY responsible for logical addressing and routing?',
  '["Layer 2 — Data Link", "Layer 3 — Network", "Layer 4 — Transport", "Layer 5 — Session"]'::jsonb,
  1,
  'The Network layer (Layer 3) is responsible for logical addressing using IP addresses and for routing packets between different networks. Layer 2 handles physical MAC addressing, Layer 4 handles end-to-end communication and port numbers, and Layer 5 manages sessions between applications.',
  'Layer 3 = "Navigate the Network" — IP addresses and routing live here.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q3: Easy / Understand / Best Answer — correct at 2
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  4,
  'tcp_ip_model',
  'Which statement BEST describes the relationship between the OSI model and the TCP/IP model?',
  '["The OSI model is a practical implementation while TCP/IP is theoretical", "The TCP/IP model has seven layers that map directly to the OSI model", "The OSI model is a theoretical reference framework while TCP/IP is the practical implementation used on the Internet", "Both models are identical in structure but use different naming conventions"]'::jsonb,
  2,
  'The OSI model is a seven-layer theoretical reference framework designed to standardize network communication concepts. The TCP/IP model is the four-layer practical implementation that actually powers the Internet. The OSI model layers map loosely to the TCP/IP model but they are not identical in structure.',
  'OSI = Open Systems "Ideal" (theory). TCP/IP = "The Communication Protocol" In Practice.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q4: Easy / Remember / Comparison — correct at 3
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  4,
  'tcp_handshake',
  'What is the PRIMARY difference between TCP and UDP?',
  '["TCP is faster because it has less overhead than UDP", "UDP provides guaranteed delivery while TCP uses best-effort delivery", "TCP uses port numbers while UDP uses socket numbers", "TCP is connection-oriented with guaranteed delivery while UDP is connectionless with best-effort delivery"]'::jsonb,
  3,
  'TCP (Transmission Control Protocol) is connection-oriented, establishing a three-way handshake before data transfer and providing guaranteed delivery through acknowledgments and retransmission. UDP (User Datagram Protocol) is connectionless and uses best-effort delivery with no guarantees. UDP is actually faster due to less overhead, not TCP.',
  'TCP = "Take Care of Packets" (reliable). UDP = "Unreliable Delivery Protocol" (fast but no guarantees).',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q5: Easy / Remember / Best Answer — correct at 0
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  4,
  'firewall_types',
  'Which type of firewall tracks the state of active network connections to make filtering decisions?',
  '["Stateful inspection firewall", "Static packet filtering firewall", "Application-level gateway", "Circuit-level gateway"]'::jsonb,
  0,
  'A stateful inspection firewall, also called a dynamic packet filtering firewall, maintains a state table that tracks active connections. It uses both the rule set and connection context to make filtering decisions. A static packet filter only examines individual packet headers without tracking connections. Application-level gateways inspect at Layer 7, and circuit-level gateways filter at the session layer.',
  'Stateful = "State-full" — it keeps a FULL table of connection STATES.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q6: Easy / Understand / Scenario — correct at 1
-- IRT: b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  4,
  'wireless_security',
  'A small office is setting up a new wireless network. The IT administrator wants to ensure the strongest possible security for the Wi-Fi connections. The access points and all client devices support the latest wireless security standards. Which wireless security protocol should the administrator deploy?',
  '["WPA2 with TKIP encryption", "WPA3 with SAE authentication", "WEP with 128-bit keys", "WPA with AES-CCMP encryption"]'::jsonb,
  1,
  'WPA3 with SAE (Simultaneous Authentication of Equals) is the strongest current wireless security protocol. It replaces the PSK four-way handshake with a zero-knowledge proof mechanism, provides forward secrecy, and uses stronger encryption. WEP is fundamentally broken, WPA with TKIP is deprecated, and while WPA2 is still secure, WPA3 is the strongest option when all devices support it.',
  'WPA3-SAE = "Strongest Available Encryption" for Wi-Fi.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q7: Easy / Apply / Best Answer — correct at 2
-- IRT: b = -1.5 + 0.3 + 0.0 = -1.2, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'vpn_ipsec',
  'An organization needs to provide confidentiality for data transmitted over an IPsec VPN. Which IPsec protocol BEST meets this requirement?',
  '["AH (Authentication Header)", "IKE (Internet Key Exchange)", "ESP (Encapsulating Security Payload)", "ISAKMP (Internet Security Association and Key Management Protocol)"]'::jsonb,
  2,
  'ESP (Encapsulating Security Payload) provides confidentiality through encryption, along with data integrity and authentication. AH provides only integrity and authentication but does NOT encrypt the payload. IKE and ISAKMP are used for negotiating security associations and keys, not for directly encrypting data traffic.',
  'ESP = "Encryption Security Protocol" — the E is for Encryption. AH = Authentication only, no H-iding data.',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q8: Easy / Understand / Most Likely — correct at 3
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'network_attacks',
  'An attacker floods a switch with thousands of frames, each containing a different spoofed source MAC address. What is the MOST LIKELY result of this attack?',
  '["The switch will reboot and clear its configuration", "The switch will block all traffic and enter lockdown mode", "The switch will encrypt all traffic to prevent further attacks", "The switch will fail open and begin broadcasting all traffic like a hub"]'::jsonb,
  3,
  'This describes a CAM (Content Addressable Memory) table overflow attack. When the switch''s MAC address table fills up, it can no longer learn new addresses and begins flooding all traffic out every port, effectively turning it into a hub. This allows the attacker to sniff all network traffic on the segment. Port security is the primary countermeasure.',
  'CAM Overflow = switch becomes a hub. "CAM is CRAMMED, so it CRAMS traffic everywhere."',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q9: Easy / Apply / First Action — correct at 0
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'secure_protocols',
  'A security administrator discovers that the organization is still using Telnet for remote administration of network devices. What should be the FIRST action to address this security concern?',
  '["Replace Telnet with SSH for encrypted remote access", "Implement a VPN for all remote administration sessions", "Deploy a network intrusion detection system to monitor Telnet traffic", "Create an access control list to restrict Telnet access to specific IPs"]'::jsonb,
  0,
  'The first and most direct action is to replace Telnet with SSH. Telnet transmits all data, including credentials, in cleartext. SSH provides encrypted remote access on port 22 and is a direct replacement. While VPNs, IDS, and ACLs can add layers of security, they do not address the fundamental problem of cleartext transmission that SSH resolves.',
  'Telnet = "Tell-everyone-Net" (cleartext). SSH = "Secure SHell" replaces it directly.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q10: Easy / Apply / Scenario — correct at 1
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_segmentation',
  'A hospital network administrator needs to separate medical devices on the network from the guest Wi-Fi and the administrative workstations. All devices are connected to the same physical switch infrastructure. The administrator wants a cost-effective solution that does not require additional hardware. Which approach BEST addresses this requirement?',
  '["Deploy a separate physical network for each group of devices", "Implement VLANs to logically segment the network into separate broadcast domains", "Install a hardware firewall between each group of devices", "Use MAC address filtering to control device access"]'::jsonb,
  1,
  'VLANs (Virtual Local Area Networks) provide logical segmentation on existing switch infrastructure without requiring additional hardware. They create separate broadcast domains, isolating traffic between medical devices, guest Wi-Fi, and administrative workstations. Physical separation would work but requires new hardware. MAC filtering controls access but does not segment traffic.',
  'VLAN = "Virtual LAN" — same physical switches, different logical networks. No new hardware needed.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q11: Easy / Remember / Except Not — correct at 2
-- IRT: b = -1.5 + (-0.5) + 0.2 = -1.8, a = 0.8 + (-0.1) = 0.7, c = 0.25
(
  4,
  'osi_model',
  'All of the following are Layer 2 Data Link technologies EXCEPT:',
  '["Ethernet switches", "VLANs using 802.1Q tagging", "OSPF routing protocol", "MAC address filtering"]'::jsonb,
  2,
  'OSPF (Open Shortest Path First) is a Layer 3 routing protocol that operates at the Network layer, making routing decisions based on IP addresses and link-state information. Ethernet switches, VLANs with 802.1Q tagging, and MAC address filtering all operate at Layer 2 (Data Link) using MAC addresses and frame-level operations.',
  'OSPF has "Path First" — it finds PATHS between NETWORKS, making it Layer 3.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),

-- Q12: Easy / Understand / First Action — correct at 3
-- IRT: b = -1.5 + 0.0 + 0.3 = -1.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  4,
  'email_security',
  'An organization is experiencing a high volume of spoofed emails appearing to come from its own domain. What should be the FIRST step to address this issue?',
  '["Deploy an email encryption gateway using S/MIME", "Install a next-generation firewall with email inspection", "Implement a data loss prevention solution for outbound email", "Configure SPF records in DNS to specify authorized mail servers"]'::jsonb,
  3,
  'SPF (Sender Policy Framework) is the foundational email authentication mechanism that specifies which mail servers are authorized to send email on behalf of a domain. It is published as a DNS TXT record and is the first step in combating domain spoofing. DKIM and DMARC build upon SPF. Encryption, firewalls, and DLP address different problems.',
  'SPF = "Senders Permitted From" — the FIRST line of defense against email spoofing.',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),

-- Q13: Easy / Apply / Scenario — correct at 0
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'ip_addressing',
  'A network technician is configuring a new server and assigns it the IP address 172.20.5.10 with a subnet mask of 255.255.0.0. The server cannot access the Internet, though it can communicate with other internal devices. A packet capture shows the server''s IP address in the source field of outbound packets. What is the MOST LIKELY cause of the Internet connectivity issue?',
  '["The IP address is in a private range (RFC 1918) and requires NAT to access the Internet", "The subnet mask is incorrect and should be 255.255.255.0", "The server has a duplicate IP address on the network", "The default gateway is configured with a public IP address"]'::jsonb,
  0,
  'The address 172.20.5.10 falls within the RFC 1918 private address range (172.16.0.0 - 172.31.255.255). Private IP addresses cannot be routed on the Internet. NAT (Network Address Translation) must be configured on the border router or firewall to translate the private address to a public IP for Internet access. Internal communication works because private addresses are valid within the local network.',
  'RFC 1918 Private Ranges: 10.x.x.x, 172.16-31.x.x, 192.168.x.x — "Private = Not Public-routable."',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q14: Easy / Remember / Comparison — correct at 1
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  4,
  'radius_tacacs',
  'What is the PRIMARY difference between RADIUS and TACACS+ regarding encryption?',
  '["RADIUS encrypts the entire session while TACACS+ encrypts only the password", "RADIUS encrypts only the password while TACACS+ encrypts the entire session", "Neither protocol provides any encryption", "Both protocols provide identical full-session encryption"]'::jsonb,
  1,
  'RADIUS encrypts only the password portion of the authentication packet, leaving the rest of the session data (including username, accounting data, and authorization details) in cleartext. TACACS+ encrypts the entire session payload using TCP, providing significantly more protection for sensitive data transmitted during AAA operations.',
  'RADIUS = "Really only Authenticates Passwords Securely." TACACS+ = "Totally All Communication Under Security."',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q15: Easy / Remember / Best Answer — correct at 2
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  4,
  'dns_security',
  'Which technology BEST protects DNS responses from being tampered with during transit?',
  '["DNS over HTTPS (DoH)", "Split DNS architecture", "DNSSEC (DNS Security Extensions)", "Recursive DNS caching"]'::jsonb,
  2,
  'DNSSEC uses digital signatures to authenticate DNS responses, ensuring that the data has not been modified in transit and that it originated from the authoritative source. DoH encrypts DNS queries for privacy but does not validate the authenticity of DNS data itself. Split DNS separates internal and external name resolution. Recursive caching improves performance but adds no integrity protection.',
  'DNSSEC = "DNS Signed and Ensured Correct" — digital signatures prove the answer is genuine.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM (55) — IRT b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: Medium / Understand / Scenario — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  4,
  'vpn_ipsec',
  'An organization is establishing a site-to-site VPN between its headquarters and a branch office. The security policy requires that the entire original IP packet, including the header, be encrypted to hide the internal addressing scheme from external observers. Which IPsec configuration should be used?',
  '["ESP in transport mode", "AH in tunnel mode", "AH in transport mode", "ESP in tunnel mode"]'::jsonb,
  3,
  'ESP in tunnel mode encrypts the entire original IP packet, including the original IP header, and adds a new IP header for routing. This hides the internal addressing scheme from anyone intercepting the traffic. Transport mode only encrypts the payload, leaving the original IP header visible. AH provides authentication and integrity but does not encrypt, so it cannot hide the addressing scheme regardless of mode.',
  'Tunnel mode = "Total packet Tunneled" (whole packet hidden). Transport mode = payload only.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'firewall_types',
  'A financial services company needs to protect its customer-facing web application from SQL injection, cross-site scripting, and other application-layer attacks. The existing network firewall provides stateful inspection but does not inspect HTTP request content. Which additional security control BEST addresses this gap?',
  '["Web application firewall (WAF)", "Network intrusion prevention system (NIPS)", "Next-generation firewall (NGFW) replacing the existing firewall", "Reverse proxy server with SSL offloading"]'::jsonb,
  0,
  'A WAF (Web Application Firewall) is specifically designed to inspect HTTP/HTTPS traffic and protect web applications from application-layer attacks such as SQL injection and XSS. A NIPS provides broader network protection but lacks the deep HTTP-specific inspection. An NGFW adds application awareness but is not as specialized for web application attacks. A reverse proxy provides load balancing and SSL offloading but is not focused on attack prevention.',
  'WAF = "Web Attack Fighter" — purpose-built for web application threats at Layer 7.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q18: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_attacks',
  'A network administrator notices that users on one VLAN can suddenly access resources on a different VLAN that should be restricted. Log analysis shows suspicious 802.1Q tagged frames on access ports. What should be the FIRST action to mitigate this VLAN hopping attack?',
  '["Enable port security on all switch ports", "Disable auto-trunking (DTP) on all access ports and set them to access mode", "Implement a network intrusion detection system", "Change the IP addressing scheme on both VLANs"]'::jsonb,
  1,
  'VLAN hopping attacks exploit Dynamic Trunking Protocol (DTP) to negotiate trunk links on access ports. The first and most effective action is to disable auto-trunking on all access ports by explicitly setting them to access mode. Port security prevents CAM overflow but does not directly stop VLAN hopping. IDS would detect but not prevent the attack. Changing IP addressing does not address the Layer 2 trunking vulnerability.',
  'VLAN hopping fix: "Don''t Trust auto-Ports" (DTP off). Set access ports to ACCESS mode explicitly.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'nac_802_1x',
  'During a routine network audit, a security analyst discovers several unknown devices connected to the corporate network via open Ethernet ports in conference rooms. What should be the FIRST action to prevent unauthorized device connections?',
  '["Deploy a network intrusion prevention system at the network core", "Install security cameras in all conference rooms", "Implement 802.1X port-based network access control on all switch ports", "Configure static ARP entries for all authorized devices"]'::jsonb,
  2,
  'Implementing 802.1X port-based NAC ensures that any device connecting to a switch port must authenticate before being granted network access. This directly addresses the problem of unauthorized devices on open ports. NIPS detects attacks but does not authenticate devices. Cameras provide physical security awareness but do not restrict network access. Static ARP entries are impractical at scale and do not prevent connectivity.',
  '802.1X = "authenticate before you X-change data." Port stays closed until you prove who you are.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q20: Medium / Understand / Comparison — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'traffic_flows',
  'What is the PRIMARY difference between north-south and east-west network traffic in a data center?',
  '["North-south traffic is encrypted while east-west traffic is in cleartext", "North-south traffic uses TCP while east-west traffic uses UDP", "North-south traffic is internal while east-west traffic crosses the perimeter", "North-south traffic crosses the network perimeter while east-west traffic moves laterally between internal servers"]'::jsonb,
  3,
  'North-south traffic flows in and out of the network, crossing the perimeter boundary to reach external networks like the Internet. East-west traffic moves laterally within the data center between servers and services. This distinction is critical because traditional perimeter security controls primarily inspect north-south traffic, while micro-segmentation is needed to monitor and control east-west traffic.',
  'North-South = "iN and out" (perimeter crossing). East-West = "bEtween internal sErvers" (lateral).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q21: Medium / Apply / TLATM — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  4,
  'sdn_sdwan',
  'A large enterprise is migrating from traditional MPLS WAN links to a software-defined WAN (SD-WAN) solution. The network team wants to maintain security while reducing costs. The SD-WAN controller will manage path selection across multiple ISP connections. Which security benefit does SD-WAN provide over traditional WAN in this scenario?',
  '["Centralized policy management with encrypted tunnels across all transport links", "Elimination of the need for firewalls at branch offices", "Guaranteed zero-latency connectivity between all sites", "Automatic compliance with all regulatory frameworks"]'::jsonb,
  0,
  'SD-WAN provides centralized policy management through its controller architecture and encrypts traffic across all transport links, including broadband Internet connections. This allows organizations to use cheaper Internet links while maintaining security. SD-WAN does not eliminate the need for firewalls, cannot guarantee zero latency, and does not automatically ensure regulatory compliance.',
  'SD-WAN = "Smart, Direct WAN" — centralized brain picks the best path and encrypts everything.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q22: Medium / Analyze / TLATM — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'network_segmentation',
  'A CISO is evaluating the organization''s network architecture after a penetration test revealed that an attacker who compromised a single workstation could move laterally to access sensitive database servers. From a management perspective, which approach would BEST reduce the organization''s risk exposure?',
  '["Deploying additional antivirus software on all workstations", "Implementing network micro-segmentation with per-workload security policies", "Increasing the frequency of vulnerability scans", "Purchasing cyber insurance to cover potential data breach costs"]'::jsonb,
  1,
  'From a management perspective, micro-segmentation directly addresses the identified risk of lateral movement by creating fine-grained security zones around individual workloads. This limits the blast radius of any single compromise. Antivirus is a point solution that does not prevent lateral movement. Vulnerability scanning identifies issues but does not enforce segmentation. Cyber insurance transfers risk but does not reduce it.',
  'Micro-seg = "Micro-Stops-Every-Gap" — limits lateral movement by putting each workload in its own security zone.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q23: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'dns_security',
  'A help desk receives reports that users are being redirected to a fraudulent banking website despite typing the correct URL. The DNS server logs show recently modified records that the administrator did not change. What should be the FIRST action?',
  '["Block all outbound DNS traffic at the firewall", "Reinstall the operating system on all affected workstations", "Flush the DNS cache and verify the integrity of DNS records against a known-good backup", "Deploy DNSSEC on all internal DNS servers"]'::jsonb,
  2,
  'The scenario describes a DNS cache poisoning attack where fraudulent DNS records redirect users to malicious sites. The first action is to flush the poisoned cache entries and verify that DNS records match a known-good backup to restore correct name resolution. Blocking all DNS traffic would cause a service outage. Reinstalling OS is excessive. DNSSEC deployment is a long-term preventive measure, not an immediate response.',
  'DNS poisoning FIRST response: "Flush and Verify" — clean the cache, confirm the records.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q24: Medium / Understand / Most Likely — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'converged_protocols',
  'An organization has deployed VoIP phones on the same VLAN as data workstations to save on switch port costs. Users report that voice quality degrades significantly during periods of high network utilization. What is the MOST LIKELY cause?',
  '["The VoIP phones are using incompatible SIP versions", "The switches do not support Power over Ethernet", "The VoIP encryption is consuming too much processing power", "VoIP traffic is competing with data traffic for bandwidth without QoS prioritization"]'::jsonb,
  3,
  'VoIP is highly sensitive to latency, jitter, and packet loss. When voice and data traffic share the same VLAN without Quality of Service (QoS) prioritization, voice packets compete with data traffic for bandwidth. During high utilization, this causes degraded voice quality. Best practice is to place VoIP on a dedicated voice VLAN with QoS policies that prioritize voice traffic over data.',
  'VoIP needs its own VLAN + QoS: "Voice Over IP = Very Obvious quality Issues without Prioritization."',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q25: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'email_security',
  'A company''s security team discovers that phishing emails are successfully passing through the email gateway by spoofing the company''s own domain name. SPF records are already configured. The team needs to add a mechanism that cryptographically signs outgoing emails to prove they originated from authorized servers. Which technology should be implemented?',
  '["DKIM (DomainKeys Identified Mail) to add cryptographic signatures to outgoing messages", "S/MIME certificates for all employee email accounts", "PGP encryption for all outbound email", "TLS certificates on the email gateway"]'::jsonb,
  0,
  'DKIM adds a cryptographic signature to outgoing email messages using a private key, with the corresponding public key published in DNS. Receiving mail servers verify the signature to confirm the message was sent by an authorized server and was not altered in transit. S/MIME and PGP provide end-to-end encryption but are user-to-user solutions. TLS encrypts the transport but does not sign individual messages.',
  'DKIM = "Domain Keys Identify Messages" — signs each email with a cryptographic key stored in DNS.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q26: Medium / Analyze / TLATM — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'wireless_security',
  'The board of directors asks the CISO why the organization should invest in upgrading from WPA2-Personal to WPA3-Enterprise across all corporate wireless access points. Which response BEST justifies the investment from a business risk perspective?',
  '["WPA3 uses faster encryption algorithms that improve network throughput by 50 percent", "WPA3-Enterprise provides stronger per-user authentication, forward secrecy, and protection against offline dictionary attacks, reducing the risk of credential compromise and data breaches", "WPA3 eliminates the need for network monitoring tools, reducing operational costs", "WPA3 is required by all international regulatory frameworks"]'::jsonb,
  1,
  'From a management perspective, WPA3-Enterprise provides measurable risk reduction through SAE (which prevents offline dictionary attacks), forward secrecy (which protects past sessions even if keys are later compromised), and individual user authentication via 802.1X. These directly reduce the probability and impact of credential compromise and data breaches. The other options contain false claims about throughput, monitoring, and regulatory mandates.',
  'WPA3 business case: "Stronger auth + Forward secrecy = Fewer breaches = Less business risk."',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q27: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'switching_technologies',
  'A network administrator observes that a newly connected switch is causing network loops, resulting in broadcast storms and network outages. What should be the FIRST action to resolve this issue?',
  '["Replace all switches with routers to eliminate broadcast domains", "Disable all ports on the new switch and rebuild the configuration from scratch", "Verify that Spanning Tree Protocol (STP) is properly configured and enable BPDU Guard on access ports", "Implement micro-segmentation across the entire network"]'::jsonb,
  2,
  'Spanning Tree Protocol (STP) prevents Layer 2 loops by blocking redundant paths. The first action when a new switch causes loops is to verify STP configuration and enable BPDU Guard on access ports to prevent unauthorized switches from participating in the STP topology. Replacing switches with routers is impractical. Disabling all ports is overly disruptive. Micro-segmentation addresses a different problem.',
  'STP = "Stops The Problem" of network loops. BPDU Guard = "Block Phony Device Using" the port.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q28: Medium / Understand / First Action — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.3 = 0.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  4,
  'remote_access',
  'A consulting firm needs to provide its remote employees with secure access to internal web applications without requiring a full VPN client installation. Employees use a variety of personal devices and operating systems. The security team wants to minimize the attack surface on employee devices. Which remote access solution BEST meets these requirements?',
  '["IPsec VPN with a mandatory client agent", "Remote Desktop Protocol (RDP) exposed directly to the Internet", "Site-to-site VPN between the employee home networks and the corporate network", "SSL/TLS VPN providing browser-based access to specific web applications"]'::jsonb,
  3,
  'An SSL/TLS VPN provides browser-based access to specific web applications without requiring a full VPN client installation. This works across different operating systems and devices, and limits the attack surface by providing access only to designated applications rather than full network access. IPsec VPN requires client software. Exposing RDP to the Internet is a major security risk. Site-to-site VPN connects entire networks, not individual users.',
  'SSL VPN = "Simple, Secure, Lightweight" access through the browser. No client install needed.',
  'understand',
  'first_action',
  'medium',
  1.20, 0.30, 0.20,
  'ai_generated', true
),

-- Q29: Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'network_monitoring',
  'Which technology BEST provides visibility into network traffic patterns, including source and destination IP addresses, ports, protocols, and byte counts, without capturing full packet content?',
  '["NetFlow analysis", "Full packet capture with Wireshark", "SNMP polling", "Syslog aggregation"]'::jsonb,
  0,
  'NetFlow (and its variants sFlow and IPFIX) collects metadata about network traffic flows including source and destination IPs, ports, protocols, and byte counts without capturing full packet payloads. This provides traffic pattern visibility while being more scalable than full packet capture. Wireshark captures everything but is resource-intensive. SNMP monitors device health. Syslog collects event logs, not traffic flow data.',
  'NetFlow = "Net traffic Flow summary" — metadata about who talked to whom, not the conversation itself.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q30: Medium / Apply / Scenario — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'micro_segmentation',
  'A cloud-native application runs across dozens of containers in a Kubernetes cluster. The security architect needs to enforce communication policies that allow only specific containers to communicate with each other based on their function. Traditional VLAN segmentation cannot provide the required granularity. Which approach BEST addresses this requirement?',
  '["Deploying a hardware firewall in front of the Kubernetes cluster", "Implementing micro-segmentation with network policies applied at the container level", "Creating separate physical networks for each container group", "Using MAC address filtering on the container host switches"]'::jsonb,
  1,
  'Micro-segmentation with container-level network policies provides the fine-grained, per-workload security controls needed in containerized environments. This allows policies to be defined based on container labels and functions rather than IP addresses. Hardware firewalls cannot inspect inter-container traffic within the cluster. Physical separation is impractical for containers. MAC filtering does not apply to container networking.',
  'Micro-seg for containers: "Each container gets its own security fence" — granularity beyond VLANs.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q31: Medium / Analyze / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  4,
  'vpn_ipsec',
  'An organization uses IPsec VPN with AH protocol for a site-to-site connection. After deploying a NAT device on the network path between the two sites, the VPN tunnel stops working. What is the MOST LIKELY explanation?',
  '["NAT devices are incompatible with all VPN protocols", "The AH protocol requires TCP which NAT does not support", "AH authenticates the IP header including source and destination addresses, and NAT modifies these addresses, breaking the authentication", "NAT encrypts traffic which conflicts with the AH encryption"]'::jsonb,
  2,
  'AH (Authentication Header) calculates a hash over the entire IP packet including the IP header. When a NAT device modifies the source or destination IP address in the header, the authentication hash no longer matches, and the receiving end rejects the packet as tampered. This is why AH is incompatible with NAT. ESP does not have this problem because it does not authenticate the outer IP header, and NAT Traversal (NAT-T) encapsulates ESP in UDP port 4500.',
  'AH + NAT = "Authentication Hates NAT" — NAT changes what AH is protecting.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q32: Medium / Apply / Best Answer — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'secure_protocols',
  'An organization wants to secure file transfers between its servers and external business partners. The solution must authenticate both parties, encrypt data in transit, and work through firewalls without requiring special port configurations. Which protocol BEST meets these requirements?',
  '["TFTP (Trivial File Transfer Protocol)", "FTP with anonymous access", "SCP (Secure Copy Protocol) over a dedicated VPN", "SFTP (SSH File Transfer Protocol) over SSH"]'::jsonb,
  3,
  'SFTP runs over SSH (port 22), providing encryption, mutual authentication, and integrity for file transfers. It uses a single port, making it firewall-friendly. TFTP has no security features and is designed for simple transfers. FTP with anonymous access provides no authentication or encryption. SCP over VPN would work but adds unnecessary complexity compared to SFTP, which provides the required security natively.',
  'SFTP = "Secure File Transfer Protocol" — encryption plus authentication in one port (22).',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q33: Medium / Understand / Except Not — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  4,
  'firewall_types',
  'All of the following are characteristics of a next-generation firewall (NGFW) EXCEPT:',
  '["Operating exclusively at Layer 3 without application awareness", "Integrated intrusion prevention system (IPS)", "Deep packet inspection capabilities", "Application-level traffic identification and control"]'::jsonb,
  0,
  'NGFWs are specifically defined by their ability to inspect traffic across multiple layers including the application layer (Layer 7). Operating exclusively at Layer 3 without application awareness describes a traditional packet filtering firewall, not an NGFW. NGFWs combine traditional stateful inspection with integrated IPS, deep packet inspection, and application-level awareness.',
  'NGFW = "Not just a Gateway for the Wire" — it looks at applications, not just packets.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q34: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'wireless_security',
  'A security team discovers a rogue access point connected to the corporate network in an empty office. The access point is broadcasting the corporate SSID and several employees have unknowingly connected to it. What should be the FIRST action?',
  '["Send a company-wide email warning employees about the rogue AP", "Physically disconnect the rogue access point from the network and isolate it for forensic analysis", "Change the corporate Wi-Fi password immediately", "Deploy a wireless intrusion prevention system across the building"]'::jsonb,
  1,
  'The first action is to physically disconnect the rogue access point to stop the immediate threat of data interception. It should be preserved for forensic analysis to determine who placed it and what data may have been captured. Sending emails does not stop the attack. Changing the Wi-Fi password does not address the rogue AP. Deploying WIPS is a long-term preventive measure, not an immediate response.',
  'Rogue AP response: "Pull the Plug, Preserve the Proof" — disconnect first, investigate second.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q35: Medium / Understand / Comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'firewall_types',
  'What is a KEY difference between an application-level proxy firewall and a stateful inspection firewall?',
  '["A stateful firewall inspects application content while a proxy firewall only checks headers", "A proxy firewall is faster because it does not maintain connection state", "A proxy firewall breaks the direct connection between client and server, inspecting full application content at Layer 7", "A stateful firewall requires more processing power than a proxy firewall"]'::jsonb,
  2,
  'An application-level proxy firewall (application gateway) breaks the direct connection between client and server by acting as an intermediary. It receives the request, inspects the full content at Layer 7, then creates a new connection to the destination. A stateful inspection firewall tracks connections at Layers 3-4 but does not inspect application-layer content. Proxy firewalls are actually slower due to the depth of inspection.',
  'Proxy firewall = "middle-man" that breaks and rebuilds connections. Stateful = tracks but does not break.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q36: Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'nac_802_1x',
  'A healthcare organization requires that all devices connecting to the network must have updated antivirus definitions, current OS patches, and an active host-based firewall before being granted access to the production network. Devices that fail compliance checks should be placed on a restricted network where they can download updates. Which solution BEST implements these requirements?',
  '["Static VLAN assignment based on switch port location", "MAC address-based port security with sticky MAC addresses", "Access control lists on the default gateway router", "NAC with pre-admission health checks and a quarantine remediation VLAN"]'::jsonb,
  3,
  'Network Access Control (NAC) with pre-admission health checks validates device compliance (antivirus, patches, firewall) before granting network access. Non-compliant devices are placed on a quarantine VLAN where they can remediate. Static VLANs do not check device health. MAC-based port security controls which devices connect but does not assess compliance. Router ACLs filter traffic but do not evaluate endpoint security posture.',
  'NAC = "Network Admission Check" — verify health before you enter. Quarantine VLAN = hospital waiting room for sick devices.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q37: Medium / Analyze / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.0 = 0.6, a = 1.5 + 0.0 = 1.5, c = 0.20
(
  4,
  'dns_security',
  'An organization deploys both DNSSEC and DNS over HTTPS (DoH). Which statement BEST describes how these two technologies complement each other?',
  '["DNSSEC validates the authenticity and integrity of DNS responses while DoH encrypts DNS queries to protect privacy", "DNSSEC encrypts DNS traffic while DoH authenticates DNS responses", "Both technologies serve the same purpose and deploying both is redundant", "DNSSEC protects against DDoS attacks while DoH prevents DNS cache poisoning"]'::jsonb,
  0,
  'DNSSEC and DoH address different aspects of DNS security. DNSSEC uses digital signatures to verify that DNS responses have not been tampered with and come from the authoritative source (integrity and authenticity). DoH encrypts DNS queries and responses over HTTPS to prevent eavesdropping and protect user privacy. Together, they provide both integrity and confidentiality for DNS operations.',
  'DNSSEC = "Is this answer REAL?" (integrity). DoH = "Can anyone SEE my query?" (privacy). Both needed.',
  'analyze',
  'best_answer',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q38: Medium / Understand / Most Likely — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'network_attacks',
  'An attacker positions themselves between a user''s workstation and the default gateway on a local network. The attacker sends gratuitous ARP replies to both the workstation and the gateway, associating the attacker''s MAC address with the other device''s IP address. What type of attack is MOST LIKELY being performed?',
  '["DNS cache poisoning", "ARP spoofing leading to a man-in-the-middle attack", "SYN flood denial of service", "VLAN hopping attack"]'::jsonb,
  1,
  'This describes an ARP spoofing (ARP poisoning) attack, where the attacker sends forged ARP replies to associate their MAC address with the IP addresses of legitimate devices. This redirects traffic through the attacker''s machine, enabling a man-in-the-middle attack. Dynamic ARP Inspection (DAI) and DHCP snooping are the primary countermeasures for this attack.',
  'ARP spoofing = "Address Resolution Poisoning" — fake MAC-to-IP mappings redirect traffic to the attacker.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q39: Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'converged_protocols',
  'Which approach BEST secures VoIP communications by addressing both signaling and media stream protection?',
  '["Deploying SRTP for signaling and SIPS for the media stream", "Using only TLS encryption on the data VLAN", "Using SIPS for signaling protection and SRTP for media stream encryption", "Implementing QoS policies with traffic prioritization"]'::jsonb,
  2,
  'Complete VoIP security requires protecting both the signaling (call setup) and the media stream (actual voice data). SIPS (SIP over TLS) secures the signaling protocol, while SRTP (Secure Real-time Transport Protocol) encrypts the media stream. The first option reverses the protocols. TLS alone on the data VLAN does not specifically address VoIP protocols. QoS improves quality but does not provide security.',
  'VoIP security needs TWO protections: SIPS = "Secure call Setup." SRTP = "Secure Real Talk (voice data)."',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q40: Medium / Analyze / Scenario — correct at 3
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'sdn_sdwan',
  'A security architect is reviewing the organization''s SDN deployment. The SDN controller manages all network switches and routers through a centralized API. During a security assessment, the architect identifies that if the SDN controller is compromised, an attacker could reconfigure the entire network. Which risk does this scenario PRIMARILY represent?',
  '["Distributed denial of service vulnerability", "Insider threat from network administrators", "Supply chain compromise of network hardware", "Single point of failure and centralized attack surface in the control plane"]'::jsonb,
  3,
  'SDN centralizes network management in the control plane through the SDN controller. While this provides agility and automation benefits, it also creates a single point of failure and a high-value target. If the controller is compromised, the attacker gains control over the entire network''s data plane. This is the primary security trade-off of SDN architecture and must be mitigated through controller redundancy, strong authentication, and network segmentation.',
  'SDN risk: "Single controller = Single point of Doom if Not protected."',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q41: Medium / Apply / First Action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_attacks',
  'A security operations center detects a SYN flood attack targeting the organization''s public-facing web server. The server is becoming unresponsive as its connection table fills up with half-open connections. What should be the FIRST action to mitigate the attack while maintaining service availability?',
  '["Enable SYN cookies on the web server to handle half-open connections without consuming state table resources", "Shut down the web server to prevent further damage", "Block all TCP traffic at the perimeter firewall", "Upgrade the web server hardware to handle more connections"]'::jsonb,
  0,
  'SYN cookies allow the server to respond to SYN requests without allocating state table resources until the three-way handshake is completed. This directly addresses the SYN flood by preventing the connection table from filling up while still allowing legitimate connections. Shutting down the server or blocking all TCP traffic eliminates availability. Hardware upgrades take time and do not solve the root cause.',
  'SYN cookies = "SYN without State" — server responds without committing resources until handshake completes.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q42: Medium / Remember / Best Answer — correct at 1
-- IRT: b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  4,
  'network_segmentation',
  'Which statement BEST describes the purpose of a DMZ (screened subnet) in network architecture?',
  '["To provide a high-speed connection between the internal network and the Internet", "To create a buffer zone between the Internet and the internal network where public-facing services are hosted", "To encrypt all traffic between internal network segments", "To replace the need for firewalls by physically isolating network segments"]'::jsonb,
  1,
  'A DMZ (Demilitarized Zone or screened subnet) is a network segment positioned between the internal network and the Internet. It hosts public-facing services such as web servers, email gateways, and DNS servers. The DMZ provides an additional layer of security so that if a public-facing server is compromised, the attacker does not have direct access to the internal network. DMZs typically use two firewalls or a single firewall with three interfaces.',
  'DMZ = "De-Militarized Zone" — a buffer no-man''s-land between the Internet battlefield and your internal castle.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q43: Medium / Apply / First Action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_monitoring',
  'A company''s network team needs to centralize log collection from firewalls, switches, routers, and servers across multiple data centers. The solution must support real-time log forwarding and use a standardized protocol. The team also needs the ability to correlate events from different sources. Which combination of technologies BEST meets these requirements?',
  '["NetFlow collectors on each device with manual log review", "SNMP traps sent to a network management station", "Syslog forwarding to a centralized SIEM (Security Information and Event Management) platform", "Periodic manual export of log files to a shared network drive"]'::jsonb,
  2,
  'Syslog is the standard protocol for forwarding log messages to a centralized server, and a SIEM platform provides the ability to aggregate, correlate, and analyze events from multiple sources in real time. NetFlow provides traffic metadata, not system logs. SNMP traps are for device health alerts, not comprehensive logging. Manual log export is not real-time and does not scale.',
  'Syslog + SIEM = "Send logs Somewhere, SIEM sorts them out" — centralized logging with correlation.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q44: Medium / Apply / First Action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'switching_technologies',
  'A network engineer discovers that unknown devices are connecting to the network by spoofing MAC addresses of legitimate devices. The switches currently have no port-level security controls. What should be the FIRST action to prevent MAC spoofing on switch ports?',
  '["Implement network-wide encryption using IPsec", "Deploy an intrusion detection system on each switch", "Redesign the network topology to use only routers", "Enable port security with sticky MAC addresses and limit the number of MAC addresses per port"]'::jsonb,
  3,
  'Port security with sticky MAC addresses automatically learns and saves the first MAC address seen on a port, then restricts the port to only that address. Limiting MAC addresses per port prevents multiple devices from using one port. This directly addresses MAC spoofing at the switch level. IPsec encrypts traffic but does not prevent unauthorized devices. IDS detects but does not prevent. Router-only networks are impractical.',
  'Port security + sticky MAC = "stick to the first device you see, reject strangers."',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q45: Medium / Analyze / TLATM — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'remote_access',
  'An organization is deciding between implementing a full-tunnel VPN and a split-tunnel VPN for remote workers. The security team favors full tunnel, while the network team argues that split tunnel reduces bandwidth costs. As the security manager, which recommendation BEST balances security and operational needs?',
  '["Implement full-tunnel VPN for all users who access sensitive data, and evaluate split tunnel only for users who do not handle regulated information, with compensating controls such as endpoint protection and DNS filtering", "Always use split tunnel because bandwidth savings outweigh security concerns", "Avoid VPN entirely and rely on cloud-based application access", "Implement full tunnel for all users regardless of their role or data access requirements"]'::jsonb,
  0,
  'A risk-based approach considers the data sensitivity and user roles. Full tunnel routes all traffic through the corporate network, providing complete visibility and control but consuming more bandwidth. Split tunnel reduces bandwidth but allows some traffic to bypass corporate security controls. The best management approach assigns full tunnel to users handling sensitive data while allowing split tunnel for lower-risk users with compensating controls.',
  'Full vs Split tunnel: "Full = Full control, Split = Split the risk." Match the tunnel to the data sensitivity.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q46: Medium / Understand / Calculation — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.4 = 0.4, a = 1.0 + 0.3 = 1.3, c = 0.20
(
  4,
  'ip_addressing',
  'A network administrator is configuring a new subnet for a department that requires exactly 50 host addresses. The administrator must minimize wasted IP addresses. The available address block is 10.10.10.0/24. Which subnet mask should the administrator use for this new subnet?',
  '["255.255.255.128 (/25) providing 126 usable addresses", "255.255.255.192 (/26) providing 62 usable addresses", "255.255.255.224 (/27) providing 30 usable addresses", "255.255.255.0 (/24) providing 254 usable addresses"]'::jsonb,
  1,
  'A /26 subnet provides 64 total addresses (2^6 = 64), with 62 usable host addresses (subtracting network and broadcast addresses). This is the smallest subnet that accommodates 50 hosts while minimizing waste. A /27 only provides 30 usable addresses, which is insufficient. A /25 provides 126 usable addresses, wasting more space. A /24 provides 254, which is far more than needed.',
  'Subnetting: 2^h - 2 usable hosts. /26 = 6 host bits = 62 hosts. Smallest subnet fitting 50 devices.',
  'understand',
  'calculation',
  'medium',
  1.30, 0.40, 0.20,
  'ai_generated', true
),

-- Q47: Medium / Understand / Comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'switching_technologies',
  'What is the PRIMARY difference between cut-through switching and store-and-forward switching?',
  '["Cut-through switches check the entire frame for errors before forwarding", "Store-and-forward switches forward frames after reading only the destination MAC address", "Cut-through switches begin forwarding after reading the destination MAC address, while store-and-forward switches read the entire frame and verify the CRC before forwarding", "Cut-through switches are slower but more reliable than store-and-forward switches"]'::jsonb,
  2,
  'Cut-through switching begins forwarding the frame as soon as the destination MAC address is read, providing lower latency but no error checking. Store-and-forward switching reads the entire frame, checks the CRC (cyclic redundancy check) for errors, and only then forwards the frame. This makes store-and-forward more reliable but slightly slower. Fragment-free switching is a hybrid that reads the first 64 bytes.',
  'Cut-through = "Cut corners, send fast." Store-and-forward = "Store it, check it, Forward it."',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q48: Medium / Remember / Most Likely — correct at 3
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  4,
  'wireless_security',
  'An organization disables the SSID broadcast on its corporate wireless access points as a security measure. A security auditor reports that this control is insufficient. What is the MOST LIKELY reason the auditor considers SSID hiding inadequate?',
  '["Disabling SSID broadcast prevents WPA3 from functioning properly", "Hidden SSIDs cause frequent disconnections for legitimate users", "SSID hiding conflicts with 802.1X authentication mechanisms", "The SSID is still transmitted in probe requests and responses, making it easily discoverable with wireless analysis tools"]'::jsonb,
  3,
  'Hiding the SSID by disabling broadcast provides only minimal obscurity, not real security. The SSID is still contained in probe requests sent by clients and in probe responses from access points. Any wireless sniffer or analysis tool can easily capture these frames and discover the SSID. This is a commonly tested exam trap: SSID hiding should never be considered a primary security control.',
  'Hidden SSID = "Hiding in plain sight" — wireless sniffers find it in seconds through probe frames.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q49: Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'email_security',
  'A financial institution wants to implement a comprehensive email authentication strategy to prevent spoofing of its domain. SPF and DKIM are already configured and working. The security team now needs to implement a policy that instructs receiving mail servers to reject any email from the domain that fails both SPF and DKIM validation. Which technology completes this implementation?',
  '["DMARC (Domain-based Message Authentication, Reporting, and Conformance) with a reject policy", "S/MIME encryption for all outbound email", "A new MX record pointing to a secure email gateway", "TLS enforcement on all SMTP connections"]'::jsonb,
  0,
  'DMARC builds on SPF and DKIM by allowing domain owners to publish a policy in DNS that specifies how receiving mail servers should handle messages that fail authentication checks. A DMARC policy set to "reject" instructs receiving servers to reject unauthenticated messages. DMARC also provides reporting capabilities. S/MIME, MX records, and TLS serve different purposes and cannot enforce SPF/DKIM policy decisions.',
  'DMARC = "Domain Message Authentication Rules and Compliance." SPF + DKIM + DMARC = the email security trinity.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q50: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_monitoring',
  'A network administrator receives an alert that SNMP community strings for several network devices are set to the default values of "public" and "private." These devices are accessible from the general corporate network. What should be the FIRST action?',
  '["Disable SNMP on all network devices immediately", "Change all SNMP community strings to complex, unique values and restrict SNMP access to the management network", "Upgrade all devices to the latest firmware version", "Deploy network access control on all switch ports"]'::jsonb,
  1,
  'Default SNMP community strings are well-known and allow anyone to read (public) or modify (private) device configurations. The first action is to change these to complex, unique strings and restrict SNMP access to the management network using ACLs. Disabling SNMP entirely would eliminate monitoring capability. Firmware updates and NAC are valid improvements but do not address the immediate credential exposure.',
  'SNMP defaults: "public" reads, "private" writes. Change them or attackers will "publicly" read your "private" configs.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q51: Medium / Understand / Scenario — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  4,
  'tcp_handshake',
  'A network security analyst is examining a packet capture and observes the following sequence: a SYN packet from a client, a SYN/ACK from the server, and then an ACK from the client. Immediately after, encrypted data begins flowing in both directions. Which process has the analyst observed?',
  '["A UDP connection establishment with subsequent TLS encryption", "An IPsec tunnel negotiation using IKE Phase 1", "A TCP three-way handshake followed by a TLS session", "A DNS recursive query with DNSSEC validation"]'::jsonb,
  2,
  'The SYN, SYN/ACK, ACK sequence is the TCP three-way handshake that establishes a reliable connection. The subsequent encrypted data flow indicates a TLS session was established on top of the TCP connection. UDP does not use a handshake. IPsec IKE does not use the SYN/SYN-ACK/ACK sequence. DNS queries are typically single request-response pairs.',
  'TCP handshake = "SYN, SYN/ACK, ACK" — three steps to shake hands before talking securely.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q52: Medium / Apply / First Action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_segmentation',
  'A manufacturing company operates an industrial control system (ICS) network that manages critical production equipment. The IT team wants to allow engineers to access the ICS network for monitoring purposes from the corporate network, but the ICS devices must be completely isolated from general Internet traffic and unauthorized internal users. Which network architecture BEST achieves this?',
  '["Placing ICS devices on the same VLAN as engineering workstations", "Connecting ICS devices directly to the corporate network with MAC filtering", "Using a single firewall with an open rule set between the corporate and ICS networks", "Deploying an air-gapped ICS network with a jump box or data diode for controlled access from the corporate network"]'::jsonb,
  3,
  'An air-gapped network provides complete physical isolation for the ICS environment. A jump box (bastion host) or data diode allows controlled, monitored access from the corporate network without creating a direct network path. This is the standard approach for critical infrastructure. Shared VLANs, MAC filtering alone, and open firewall rules all fail to provide adequate isolation for ICS environments.',
  'ICS isolation: "Air gap = Air-tight security." Jump box = controlled drawbridge over the gap.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q53: Medium / Understand / Comparison — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'radius_tacacs',
  'An organization is choosing between RADIUS and TACACS+ for managing administrative access to network devices. The security team requires granular command-level authorization and full session encryption. Which protocol BEST meets these requirements and why?',
  '["TACACS+ because it separates AAA functions, encrypts the entire session, and provides granular command authorization", "RADIUS because it uses TCP for reliable transport and encrypts the entire session", "RADIUS because it provides more granular authorization controls than TACACS+", "TACACS+ because it uses UDP for faster authentication and encrypts only the password"]'::jsonb,
  0,
  'TACACS+ separates authentication, authorization, and accounting into independent processes, allowing granular command-level authorization. It encrypts the entire session (not just the password) using TCP for reliable transport. RADIUS uses UDP, encrypts only the password, and combines authentication and authorization. For network device administration requiring granular control, TACACS+ is the better choice.',
  'TACACS+ for admin: "Total Access Control And Complete Separation." RADIUS for network access: "Remote Access Dial-In User Service."',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q54: Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'secure_protocols',
  'During a security audit, the auditor finds that the organization''s internal web applications still use HTTP instead of HTTPS for transmitting employee credentials to authentication servers. What should be the FIRST action to remediate this finding?',
  '["Deploy a WAF to inspect all HTTP traffic", "Enable TLS on all internal web servers and redirect HTTP to HTTPS", "Implement multi-factor authentication to compensate for the cleartext transmission", "Segment the internal network to reduce the attack surface"]'::jsonb,
  1,
  'The immediate priority is to encrypt credentials in transit by enabling TLS on internal web servers and redirecting HTTP to HTTPS. This directly addresses the cleartext credential exposure. A WAF inspects traffic but does not encrypt it. MFA adds a layer but does not fix the cleartext problem. Network segmentation reduces risk but does not protect the credentials during transmission.',
  'HTTP to HTTPS: "Always encrypt credentials in transit." HTTPS = HTTP + TLS = HTTP Secured.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q55: Medium / Understand / Except Not — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  4,
  'vpn_ipsec',
  'All of the following are true about IPsec tunnel mode EXCEPT:',
  '["It encrypts the entire original IP packet including the header", "It adds a new IP header for routing purposes", "It is primarily used for end-to-end communication between individual hosts", "It is the standard mode for site-to-site VPN connections"]'::jsonb,
  2,
  'IPsec tunnel mode encrypts the entire original packet and adds a new IP header, making it the standard for site-to-site (gateway-to-gateway) VPNs. It is NOT primarily used for end-to-end host communication; that is transport mode''s primary use case. Transport mode encrypts only the payload while preserving the original IP header, making it suitable for direct host-to-host connections.',
  'Tunnel = gateway-to-gateway (site-to-site). Transport = host-to-host (end-to-end). Do not confuse them.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q56: Medium / Apply / Most Likely — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  4,
  'network_attacks',
  'A security analyst notices that DNS queries from the internal network are being sent to an external DNS server controlled by an unknown party. Packet captures reveal that DNS responses contain large TXT records with encoded data that does not match any legitimate DNS entries. The analyst suspects data is being exfiltrated from the network. Which attack technique is MOST LIKELY being used?',
  '["DNS amplification attack", "BGP route hijacking", "DNS zone transfer exploitation", "DNS tunneling for data exfiltration"]'::jsonb,
  3,
  'DNS tunneling encodes data within DNS queries and responses to exfiltrate information through the DNS protocol. Attackers use TXT or other record types to carry encoded data, bypassing traditional security controls that allow DNS traffic by default. DNS amplification is a DDoS technique. BGP hijacking redirects traffic at the routing level. Zone transfer exploitation exposes zone data but does not use encoded TXT records for exfiltration.',
  'DNS tunneling = "Data smuggled inside DNS queries" — looks like legitimate DNS but carries stolen data.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q57: Medium / Remember / Best Answer — correct at 0
-- IRT: b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  4,
  'osi_model',
  'Which OSI layer is BEST described as responsible for data formatting, encryption, and compression to ensure that information from the application layer of one system can be read by the application layer of another?',
  '["Layer 6 — Presentation", "Layer 7 — Application", "Layer 5 — Session", "Layer 4 — Transport"]'::jsonb,
  0,
  'The Presentation layer (Layer 6) handles data formatting, translation, encryption, and compression. It ensures that data from the sending application can be understood by the receiving application regardless of different data representations. The Application layer provides network services to end users. The Session layer manages dialog control. The Transport layer handles end-to-end delivery.',
  'Layer 6 = "Presents data in the right format" — translation, encryption, compression happen here.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q58: Medium / Apply / Calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  4,
  'ip_addressing',
  'An organization is assigned the network 192.168.10.0/24 and needs to create subnets with at least 25 usable host addresses each. What is the maximum number of subnets that can be created from this address block?',
  '["2 subnets", "8 subnets", "4 subnets", "16 subnets"]'::jsonb,
  1,
  'To support at least 25 hosts, you need at least 5 host bits (2^5 - 2 = 30 usable addresses). A /27 subnet mask uses 3 bits for subnetting from the original /24, leaving 5 host bits. With 3 subnet bits, you can create 2^3 = 8 subnets, each with 30 usable host addresses. A /28 would only give 14 hosts per subnet, which is insufficient for 25.',
  'Subnetting formula: need 25 hosts, so 2^5 - 2 = 30 (enough). 24 network bits + 3 subnet bits = /27. 2^3 = 8 subnets.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q59: Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'tcp_ip_model',
  'A security engineer is analyzing an application that sends data using a protocol that provides no delivery guarantees, no connection establishment, and no error recovery. The protocol is being used to stream real-time video to multiple recipients simultaneously. At which layer of the TCP/IP model does this protocol operate, and which protocol is it?',
  '["Internet layer using ICMP", "Application layer using HTTP", "Transport layer using UDP", "Network Access layer using ARP"]'::jsonb,
  2,
  'UDP (User Datagram Protocol) operates at the Transport layer of the TCP/IP model. It is connectionless, provides no delivery guarantees or error recovery, and is ideal for real-time streaming where speed is more important than reliability. Multicast streaming commonly uses UDP because retransmitting lost packets would cause more delay than simply dropping them. ICMP is at the Internet layer. HTTP uses TCP. ARP is at the Network Access layer.',
  'UDP at Transport layer: "Unreliable but fast Delivery for real-time." Used for streaming, VoIP, DNS queries.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q60: Medium / Understand / Most Likely — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'network_monitoring',
  'An organization''s SIEM system generates thousands of alerts daily, many of which are false positives. The security team is overwhelmed and missing genuine threats. A recent incident went undetected because the alert was buried among false positives. What is the MOST LIKELY root cause of this operational failure?',
  '["The SIEM software has a critical bug that generates false alerts", "The network bandwidth is insufficient to handle the log volume", "The organization does not have enough security cameras", "The SIEM correlation rules and alert thresholds have not been properly tuned to the organization''s specific environment"]'::jsonb,
  3,
  'SIEM systems require careful tuning of correlation rules, alert thresholds, and baselines to match the specific environment. Out-of-the-box configurations generate excessive false positives because they are not calibrated to the organization''s normal traffic patterns and system behaviors. Proper tuning reduces noise and ensures that genuine threats are prioritized. This is an operational maturity issue, not a software bug or bandwidth problem.',
  'SIEM tuning: "A SIEM is only as good as its tuning." Untuned SIEM = noise machine hiding real threats.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q61: Medium / Apply / First Action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_segmentation',
  'A security administrator discovers that management traffic for network switches and routers is flowing over the same network segments as production user traffic. An attacker who compromises a user workstation could potentially sniff administrative credentials. What should be the FIRST action to address this risk?',
  '["Implement out-of-band management by moving all device management interfaces to a dedicated, isolated management network", "Encrypt all production user traffic with IPsec", "Deploy additional intrusion detection sensors on the production network", "Disable remote management and require console-only access for all devices"]'::jsonb,
  0,
  'Out-of-band management separates management traffic from production traffic using a dedicated management network. This prevents attackers on the production network from intercepting administrative credentials or management commands. IPsec encryption of user traffic does not protect management traffic specifically. IDS detects but does not prevent credential sniffing. Console-only access is impractical at scale.',
  'Out-of-band = "Out of Band-its reach" — management traffic on a separate, isolated network.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q62: Medium / Apply / Best Answer — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'tcp_ip_model',
  'A security architect needs to implement encryption at a layer that protects all IP-based traffic transparently, without requiring changes to individual applications. Which protocol BEST meets this requirement?',
  '["TLS at the application layer", "IPsec at the network layer", "SSH for each individual application", "WPA3 at the data link layer"]'::jsonb,
  1,
  'IPsec operates at the network layer (Layer 3) and encrypts all IP traffic transparently. Applications do not need to be modified or aware of the encryption. TLS operates at the transport/application layer and requires application-level integration. SSH protects individual sessions, not all traffic. WPA3 only protects wireless traffic at the link layer and does not cover wired communications.',
  NULL,
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q63: Medium / Understand / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'osi_model',
  'A user reports that they cannot access a website. The network administrator verifies that the Ethernet cable is firmly connected, the link light is on, and the device can ping the default gateway by IP address. However, the browser shows a "server not found" error. At which OSI layer is the problem MOST LIKELY occurring?',
  '["Layer 1 — Physical", "Layer 3 — Network", "Layer 7 — Application (DNS resolution)", "Layer 2 — Data Link"]'::jsonb,
  2,
  'Since the physical connection is working (link light on) and the device can reach the gateway by IP (Layers 1-3 functional), the issue is most likely at the application layer with DNS resolution. The browser cannot translate the domain name to an IP address, resulting in a "server not found" error. This is a common troubleshooting scenario that tests the ability to isolate issues by OSI layer.',
  'Troubleshooting by layer: "Can ping by IP but not browse by name? DNS (Layer 7) is the problem."',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q64: Medium / Apply / First Action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'wireless_security',
  'An enterprise with 500 employees needs to deploy a wireless network that provides individual user authentication, automatic key rotation, and centralized credential management integrated with their existing Active Directory infrastructure. Which wireless security configuration BEST meets these requirements?',
  '["WPA2-Personal with a strong pre-shared key changed monthly", "WEP with dynamic key rotation enabled", "Open network with a captive portal for user login", "WPA2-Enterprise or WPA3-Enterprise using 802.1X with a RADIUS server integrated with Active Directory"]'::jsonb,
  3,
  'WPA2/WPA3-Enterprise with 802.1X provides individual user authentication through a RADIUS server, which can be integrated with Active Directory for centralized credential management. Each user session gets unique encryption keys that rotate automatically. WPA2-Personal uses a shared key for all users, making individual accountability impossible. WEP is broken. Open networks with captive portals provide no encryption for wireless traffic.',
  'Enterprise mode = "Each Employee gets their own Encryption" via 802.1X + RADIUS + AD integration.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q65: Medium / Analyze / TLATM — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'converged_protocols',
  'The CTO proposes replacing the traditional PBX phone system with a VoIP solution to reduce costs. The security manager must advise the executive team on the security implications. Which recommendation BEST reflects a management-level understanding of VoIP security risks?',
  '["VoIP introduces new attack vectors including eavesdropping, toll fraud, and denial of service that require dedicated voice VLANs, encrypted signaling and media, and VoIP-aware security controls, which should be factored into the total cost of ownership", "VoIP is inherently more secure than traditional PBX because it uses digital encryption by default", "VoIP security concerns are minimal because the existing network firewall will protect voice traffic", "The organization should avoid VoIP entirely because the security risks outweigh the cost savings"]'::jsonb,
  0,
  'A balanced management response acknowledges both the cost benefits and the additional security requirements of VoIP. VoIP introduces specific attack vectors that require dedicated controls including voice VLANs, SIPS/SRTP encryption, and VoIP-aware IDS. These costs must be factored into the TCO analysis. VoIP is not inherently more secure, standard firewalls are not sufficient, and avoiding VoIP entirely ignores the legitimate business benefits.',
  'VoIP management advice: "Save on phones, but budget for securing them." New technology = new risks to manage.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q66: Medium / Apply / Calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  4,
  'ip_addressing',
  'A network uses the address space 10.0.0.0/8. How many total usable host addresses are available in this single network?',
  '["65,534", "16,777,214", "254", "16,777,216"]'::jsonb,
  1,
  'A /8 network has 24 host bits (32 - 8 = 24). The total number of addresses is 2^24 = 16,777,216. Subtracting 2 for the network address and broadcast address gives 16,777,214 usable host addresses. The formula is always 2^h - 2 where h is the number of host bits. 65,534 corresponds to a /16, and 254 corresponds to a /24.',
  'Host calculation: 2^h - 2. /8 = 24 host bits = 2^24 - 2 = 16,777,214 usable addresses.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q67: Medium / Understand / Comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'remote_access',
  'What is the PRIMARY difference between a forward proxy and a reverse proxy?',
  '["A forward proxy encrypts traffic while a reverse proxy decrypts it", "A forward proxy operates at Layer 3 while a reverse proxy operates at Layer 7", "A forward proxy protects internal clients accessing external resources, while a reverse proxy protects internal servers from external clients", "A forward proxy is faster than a reverse proxy due to reduced processing overhead"]'::jsonb,
  2,
  'A forward proxy sits between internal clients and the Internet, protecting clients by filtering content, caching, and providing anonymity. A reverse proxy sits between the Internet and internal servers, protecting servers by providing load balancing, SSL offloading, and shielding server identity. Both typically operate at Layer 7. The key distinction is which side they protect: forward protects clients, reverse protects servers.',
  'Forward proxy = "For the clients, Forwarding their requests." Reverse proxy = "Receives requests on behalf of servers."',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q68: Medium / Understand / Comparison — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  4,
  'ip_addressing',
  'An organization is transitioning from IPv4 to IPv6. During the transition period, both protocols must coexist on the network. The network team needs a strategy that allows IPv6 traffic to traverse IPv4-only network segments without requiring all intermediate devices to support IPv6. Which coexistence strategy BEST addresses this requirement?',
  '["Replacing all network devices with IPv6-only hardware", "Using NAT64 to translate all IPv6 addresses to IPv4 permanently", "Implementing dual-stack on all intermediate devices", "Encapsulating IPv6 packets within IPv4 tunnels to traverse IPv4-only segments"]'::jsonb,
  3,
  'IPv6-over-IPv4 tunneling encapsulates IPv6 packets within IPv4 packets, allowing them to traverse IPv4-only network segments without requiring intermediate devices to support IPv6. This is the most practical approach when not all devices can be upgraded simultaneously. Replacing all hardware is costly and impractical. NAT64 is for ongoing translation, not transition. Dual-stack requires all devices to support both protocols.',
  'IPv6 tunneling = "IPv6 rides inside IPv4" across segments that only speak IPv4.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q69: Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'network_attacks',
  'Which countermeasure BEST prevents ARP spoofing attacks on a switched network?',
  '["Dynamic ARP Inspection (DAI) combined with DHCP snooping", "Implementing WPA3 on all wireless access points", "Deploying a web application firewall", "Configuring static routes on all routers"]'::jsonb,
  0,
  'Dynamic ARP Inspection (DAI) validates ARP packets against the DHCP snooping binding table, which maps legitimate IP-to-MAC address associations. DAI drops ARP packets that do not match known-good bindings, preventing ARP spoofing. WPA3 protects wireless networks, not switched Ethernet. WAFs protect web applications. Static routes address routing, not ARP-level attacks.',
  'DAI + DHCP snooping = "Dynamic ARP Inspection catches fake ARP, DHCP snooping provides the truth table."',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q70: Medium / Apply / Scenario — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'secure_protocols',
  'A company is setting up secure communication between its TLS 1.2 web servers and clients. The security team wants to ensure that if a server''s private key is compromised in the future, previously recorded encrypted sessions cannot be decrypted. Which cipher suite feature is MOST important for this requirement?',
  '["Using AES-256 encryption for the session", "Enabling Perfect Forward Secrecy (PFS) using ephemeral Diffie-Hellman key exchange", "Implementing certificate pinning on all clients", "Configuring mutual TLS with client certificates"]'::jsonb,
  1,
  'Perfect Forward Secrecy (PFS) uses ephemeral (temporary) Diffie-Hellman keys for each session. Even if the server''s long-term private key is later compromised, past session keys cannot be derived because each session used a unique, temporary key that was discarded. Without PFS, an attacker with the private key could decrypt all previously recorded sessions. AES-256, certificate pinning, and mutual TLS do not provide forward secrecy.',
  NULL,
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD (20) — IRT b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: Hard / Apply / Scenario — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'vpn_ipsec',
  'A multinational corporation operates IPsec VPN tunnels between its headquarters and 15 branch offices. Each branch requires a unique bidirectional security association with headquarters. The security team is auditing the total number of IPsec Security Associations needed for this hub-and-spoke topology. Considering that IPsec SAs are unidirectional, how many total SAs are required for just the headquarters-to-branch connections?',
  '["15 SAs", "225 SAs", "30 SAs", "60 SAs"]'::jsonb,
  2,
  'IPsec Security Associations are unidirectional, meaning each connection requires two SAs: one for traffic from headquarters to the branch, and one for traffic from the branch to headquarters. With 15 branch offices in a hub-and-spoke topology, each branch has one connection to headquarters, requiring 2 SAs per connection. Total: 15 connections x 2 SAs = 30 SAs. If full mesh were required, the calculation would be n(n-1) = 15(14) = 210 SAs for branches alone.',
  'IPsec SAs are unidirectional: "One SA sends, another SA receives." Each tunnel = 2 SAs.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: Hard / Analyze / TLATM — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'micro_segmentation',
  'The CISO presents two competing proposals to the executive committee for improving data center security. Proposal A adds a next-generation firewall at the data center perimeter at a cost of $200,000. Proposal B implements micro-segmentation with per-workload policies at a cost of $500,000. Recent threat intelligence shows that 80 percent of breaches involved lateral movement after initial perimeter compromise. Which recommendation BEST serves the organization''s security posture?',
  '["Implement Proposal A because it provides the best return on investment", "Implement both proposals simultaneously to maximize defense in depth", "Delay both proposals until after the next annual risk assessment", "Implement Proposal B because it directly addresses the primary threat vector of lateral movement, which the perimeter firewall cannot prevent once an attacker is inside"]'::jsonb,
  3,
  'The threat intelligence shows that lateral movement (east-west traffic) is the dominant attack vector. A perimeter firewall (Proposal A) only inspects north-south traffic and cannot prevent lateral movement once an attacker is inside. Micro-segmentation (Proposal B) directly addresses this by creating per-workload security zones that limit the blast radius of any compromise. While more expensive, it targets the actual risk. A manager should make risk-informed investment decisions aligned with threat intelligence.',
  'Security investment: "Spend where the threat is." 80% lateral movement = micro-segmentation has 80% of the impact.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q73: Hard / Apply / First Action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_attacks',
  'A security team detects that an attacker has compromised a BGP router and is advertising false routes, causing traffic destined for a major banking website to be redirected through the attacker''s infrastructure. This is affecting thousands of customers. What should be the FIRST action?',
  '["Contact the upstream ISP to filter the malicious BGP advertisements and restore correct routing", "Shut down all Internet-facing services to prevent further data interception", "Deploy DNSSEC on the banking website to authenticate DNS responses", "Implement IPsec on all customer connections"]'::jsonb,
  0,
  'BGP route hijacking requires immediate coordination with the upstream ISP to filter the malicious route advertisements and restore correct routing. This is the most effective first action because the organization typically cannot directly control BGP routing beyond its own autonomous system. Shutting down services eliminates availability. DNSSEC protects DNS, not BGP routing. IPsec on all customer connections is impractical for a public website.',
  'BGP hijack response: "Call your upstream ISP FIRST" — they control the routing tables that need fixing.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q74: Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'secure_protocols',
  'A security architect is reviewing the organization''s TLS configuration. The current setup uses TLS 1.2 with RSA key exchange. The architect recommends migrating to TLS 1.3. The CTO asks what specific security improvements TLS 1.3 provides over TLS 1.2 with RSA key exchange. Which response is MOST accurate?',
  '["TLS 1.3 uses longer encryption keys, making brute force attacks impossible", "TLS 1.3 mandates forward secrecy by requiring ephemeral key exchange, reduces the handshake to one round trip, and removes support for insecure cipher suites like RSA key exchange and CBC mode", "TLS 1.3 is identical to TLS 1.2 but runs on a different port number", "TLS 1.3 eliminates the need for digital certificates by using pre-shared keys exclusively"]'::jsonb,
  1,
  'TLS 1.3 makes significant security improvements over TLS 1.2: it mandates forward secrecy by only supporting ephemeral Diffie-Hellman key exchange (removing static RSA key exchange), reduces the handshake from two round trips to one (1-RTT), and eliminates support for legacy insecure algorithms including RC4, SHA-1, CBC mode, and static RSA. TLS 1.3 still uses certificates for authentication and does not change port numbers.',
  'TLS 1.3 improvements: "1 RTT, Forward secrecy mandatory, old crypto removed." Faster AND more secure.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q75: Hard / Analyze / Except Not — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  4,
  'network_segmentation',
  'All of the following are valid security benefits of implementing VLANs EXCEPT:',
  '["Reducing the size of broadcast domains to limit broadcast-based attacks", "Isolating sensitive systems from general user traffic", "Providing encryption of traffic between VLAN members", "Enabling policy-based access control between network segments through inter-VLAN routing with ACLs"]'::jsonb,
  2,
  'VLANs provide logical segmentation, broadcast domain reduction, and enable policy enforcement through inter-VLAN routing with ACLs. However, VLANs do NOT encrypt traffic. Data transmitted within or between VLANs remains in cleartext unless additional encryption such as TLS, IPsec, or MACsec is applied. This is a critical exam trap: segmentation is not encryption.',
  'VLANs = "Virtually Labeling And Narrowing" traffic scope. They SEPARATE, they do NOT ENCRYPT.',
  'analyze',
  'except_not',
  'hard',
  1.40, 2.30, 0.25,
  'ai_generated', true
),

-- Q76: Hard / Apply / Calculation — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  4,
  'ip_addressing',
  'A network engineer needs to determine the broadcast address for the subnet containing host 172.16.45.130/21. What is the broadcast address for this subnet?',
  '["172.16.45.255", "172.16.47.255", "172.16.39.255", "172.16.48.255"]'::jsonb,
  1,
  'For a /21 network, the subnet mask is 255.255.248.0. The third octet block size is 256 - 248 = 8. Starting from 172.16.0.0, the subnets increment by 8 in the third octet: 0, 8, 16, 24, 32, 40, 48. Host 172.16.45.130 falls in the 172.16.40.0/21 subnet (40 is the largest multiple of 8 not exceeding 45). The broadcast address is the last address before the next subnet: 172.16.47.255 (40 + 8 - 1 = 47 in the third octet).',
  'Subnet broadcast: find the block size (256 - mask), find your subnet start, add block size minus 1. /21 block = 8, subnet = .40.0, broadcast = .47.255.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q77: Hard / Apply / Scenario — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'firewall_types',
  'A security architect is designing the network for a new e-commerce platform. The architecture must inspect incoming HTTPS traffic for malicious payloads, provide SSL offloading for backend servers, and enforce application-specific security rules. The solution must handle 10,000 concurrent connections with sub-millisecond latency additions. Which firewall deployment architecture BEST meets all requirements?',
  '["A reverse proxy WAF deployed inline before the web server cluster, performing SSL termination and deep HTTP inspection", "A stateful inspection firewall at the network perimeter with NAT", "A host-based firewall on each web server", "A circuit-level gateway between the Internet and the web servers"]'::jsonb,
  0,
  'A reverse proxy WAF deployed inline performs SSL termination (offloading TLS processing from backend servers), deep HTTP content inspection for malicious payloads, and application-specific rule enforcement. This architecture inspects decrypted traffic before forwarding to backend servers. Stateful firewalls do not perform deep HTTP inspection. Host-based firewalls lack centralized management and SSL offloading. Circuit-level gateways operate at Layer 5, not Layer 7.',
  'WAF as reverse proxy: "Terminates SSL, Inspects HTTP, Forwards clean traffic" — all three requirements in one.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q78: Hard / Analyze / Most Likely — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  4,
  'wireless_security',
  'An organization deploys WPA2-Enterprise with PEAP-MSCHAPv2 for wireless authentication. A security researcher demonstrates that by setting up a rogue RADIUS server and evil twin access point, they can capture the MSCHAPv2 challenge-response exchange and crack the password offline. What is the MOST LIKELY reason this attack succeeded?',
  '["The WPA2 AES encryption was disabled on the access points", "The wireless clients were not configured to validate the RADIUS server''s certificate, allowing them to connect to the rogue server", "WPA2-Enterprise does not actually authenticate users individually", "The RADIUS shared secret between the AP and server was too short"]'::jsonb,
  1,
  'PEAP (Protected EAP) creates a TLS tunnel to protect the inner authentication exchange, but this protection depends on the client validating the RADIUS server''s certificate. If clients are not configured to verify the server certificate (a common misconfiguration), they will connect to a rogue RADIUS server without warning. The attacker can then capture the MSCHAPv2 exchange inside the tunnel. The fix is to enforce server certificate validation on all wireless clients.',
  'PEAP attack: "If clients don''t check the server cert, anyone can BE the server." Always validate RADIUS certificates.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q79: Hard / Apply / First Action — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'email_security',
  'A forensic analyst determines that an attacker gained initial access to the organization by sending a phishing email that passed SPF validation. Investigation reveals the attacker used a compromised third-party marketing service that is listed as an authorized sender in the organization''s SPF record. What should be the FIRST action?',
  '["Remove all entries from the SPF record to block all external email", "Disable email entirely until a full investigation is complete", "Remove the compromised third-party service from the SPF record and notify the marketing team to use an alternative service", "Deploy end-to-end encryption for all internal email communications"]'::jsonb,
  2,
  'The first action is to remove the compromised service from the SPF record to immediately revoke its authorization to send email on behalf of the organization''s domain. The marketing team must be notified to use an alternative service. Removing all SPF entries would break legitimate email. Disabling email entirely is too disruptive. End-to-end encryption does not prevent phishing attacks that exploit SPF trust.',
  'Compromised SPF entry: "Remove the rotten apple from the barrel." Revoke authorization, then find an alternative.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q80: Hard / Apply / Scenario — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'nac_802_1x',
  'A university hospital is implementing 802.1X NAC across its campus network. Medical devices such as infusion pumps and patient monitors do not support 802.1X supplicant software. These devices must remain on the network for patient safety but cannot be left on unsecured ports. The security team needs a solution that authenticates these devices without modifying their software. Which approach BEST addresses this challenge?',
  '["Disable 802.1X on ports connected to medical devices and rely on physical security", "Connect all medical devices through a single unmanaged hub to bypass NAC", "Configure all medical devices with static IP addresses and disable DHCP", "Implement MAC Authentication Bypass (MAB) on ports connected to medical devices, combined with dedicated VLANs and enhanced monitoring"]'::jsonb,
  3,
  'MAC Authentication Bypass (MAB) allows devices that cannot support 802.1X to authenticate using their MAC address. When combined with dedicated VLANs that restrict network access and enhanced monitoring for anomalous behavior, this provides a practical security solution for legacy devices. Disabling 802.1X leaves ports unprotected. An unmanaged hub undermines all security. Static IPs without NAC provide no authentication.',
  'MAB for legacy devices: "MAC Address acts as the Badge" when the device cannot carry a supplicant.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q81: Hard / Analyze / Scenario — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'sdn_sdwan',
  'An organization has deployed SDN across its data center. The security team discovers that the northbound API between the SDN controller and the management applications uses HTTP without authentication. An attacker who gains access to the management network could send arbitrary API calls to reconfigure the entire network. The security architect must recommend a remediation plan. Which approach BEST addresses this vulnerability?',
  '["Secure the northbound API with mutual TLS authentication, implement role-based access control for API operations, and deploy API gateway monitoring to detect anomalous requests", "Disable the northbound API and manage the SDN controller exclusively through the console", "Replace SDN with traditional network management using SNMP", "Add a packet filter firewall between the management applications and the SDN controller"]'::jsonb,
  0,
  'Securing the northbound API requires multiple controls: mutual TLS ensures both the client and server authenticate each other, RBAC limits what each management application can do, and API monitoring detects anomalous behavior. Disabling the API defeats the purpose of SDN automation. Reverting to SNMP abandons SDN benefits. A packet filter alone does not provide authentication or authorization for API calls.',
  'SDN API security: "Authenticate, Authorize, Audit" every API call. Unsecured APIs = keys to the kingdom.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q82: Hard / Analyze / Comparison — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  4,
  'network_monitoring',
  'A security engineer must choose between deploying an IDS inline (as an IPS) or in passive/tap mode for monitoring a critical financial transaction network. The network processes real-time payment transactions where any latency or dropped packets could result in failed transactions and financial losses. Which deployment mode is MORE appropriate and why?',
  '["Inline IPS because it can block attacks immediately without any performance impact", "Passive/tap mode because it monitors traffic without introducing latency or risk of dropping legitimate transactions, while still providing detection and alerting capabilities", "Neither mode is appropriate because IDS/IPS systems cannot monitor encrypted financial transactions", "Inline IPS with all signature rules enabled to maximize detection coverage"]'::jsonb,
  1,
  'For a critical real-time financial network, passive/tap mode is more appropriate because it copies traffic for analysis without being in the data path. An inline IPS introduces latency and risk: a false positive could block a legitimate transaction, and a device failure could disrupt all traffic. Passive mode still provides detection and alerting without the availability risk. IDS/IPS can inspect unencrypted segments of the network. Enabling all rules on an inline device maximizes both detection and false positive risk.',
  'IDS deployment: "Critical systems = passive tap (no risk to traffic). General networks = inline IPS (active blocking)."',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q83: Hard / Apply / Scenario — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'dns_security',
  'A large enterprise operates split DNS with internal and external DNS servers. An attacker compromises the external DNS server and modifies records to point the organization''s webmail domain to a phishing site. Internal users accessing webmail from within the corporate network are unaffected, but remote workers using the external DNS are redirected to the phishing site. Which combination of controls would have BEST prevented this attack?',
  '["Implementing MAC address filtering on the DNS server", "Deploying a WAF in front of the external DNS server", "Deploying DNSSEC to sign DNS records and implementing DNS monitoring to detect unauthorized record changes", "Moving all DNS records to the internal DNS server and blocking external DNS access"]'::jsonb,
  2,
  'DNSSEC digitally signs DNS records, so even if an attacker modifies records on the server, resolvers that validate DNSSEC signatures will reject the forged responses. DNS monitoring provides alerts when records change unexpectedly. MAC filtering does not protect DNS records. A WAF protects web applications, not DNS. Moving all records internally would break external name resolution for customers and partners.',
  'Split DNS protection: "Sign records with DNSSEC + Monitor for changes" — detect AND prevent tampering.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q84: Hard / Analyze / TLATM — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'network_segmentation',
  'An organization''s internal audit report identifies that the flat network architecture creates excessive risk because a single compromised endpoint provides unrestricted access to all network resources. The CISO must present a network security improvement roadmap to the board. Which phased approach BEST demonstrates sound security management?',
  '["Deploy endpoint antivirus on all devices as the only remediation", "Implement full zero trust architecture immediately across the entire organization", "Hire additional security staff and defer technical changes until next fiscal year", "Phase 1: Implement VLAN segmentation for critical assets. Phase 2: Deploy NAC for device compliance. Phase 3: Implement micro-segmentation with zero trust policies. Each phase reduces risk incrementally while allowing the organization to build operational maturity"]'::jsonb,
  3,
  'A phased approach demonstrates sound management by breaking a large transformation into incremental steps. Each phase delivers measurable risk reduction: VLANs provide immediate segmentation, NAC ensures device compliance, and micro-segmentation with zero trust provides the most granular protection. This approach manages budget, allows staff training, and avoids the risk of a big-bang deployment. Antivirus alone is insufficient. Immediate full zero trust is unrealistic. Deferring action leaves the risk unaddressed.',
  'Network security roadmap: "Crawl (VLANs), Walk (NAC), Run (Zero Trust)" — phased maturity reduces risk incrementally.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q85: Hard / Apply / First Action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'network_attacks',
  'A SOC analyst detects that an internal server is sending large volumes of ICMP echo request packets to an external IP address. The packets contain unusually large payloads with what appears to be encoded data. Normal ICMP echo requests from this server should not contain data payloads. What should be the FIRST action?',
  '["Isolate the server from the network and capture the ICMP traffic for forensic analysis, as this likely represents data exfiltration via ICMP tunneling", "Ignore the alert because ICMP is a normal diagnostic protocol", "Reboot the server to clear any running malicious processes", "Upgrade the server''s antivirus definitions"]'::jsonb,
  0,
  'Large ICMP packets with encoded data payloads strongly suggest ICMP tunneling, a technique used to exfiltrate data by embedding it within ICMP packets that many firewalls allow by default. The first action is to isolate the server to stop the exfiltration and preserve evidence for forensic analysis. Ignoring the alert misses active data theft. Rebooting destroys forensic evidence. Antivirus updates do not address the immediate threat.',
  'ICMP tunneling: "Pings should not carry Payloads." Large ICMP data = data exfiltration. Isolate immediately.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q86: Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'converged_protocols',
  'An organization is deploying iSCSI for storage area network communication between application servers and a storage array across the existing Ethernet infrastructure. The storage traffic will carry sensitive financial data. The network team proposes using the same physical network as general user traffic to minimize costs. Which security concern should the security architect raise as the MOST significant risk?',
  '["iSCSI performance will be degraded by user traffic congestion", "iSCSI traffic on a shared network is vulnerable to sniffing and man-in-the-middle attacks because storage protocols were not designed for untrusted networks, and sensitive block-level data could be intercepted or manipulated", "iSCSI is incompatible with Ethernet and requires Fibre Channel infrastructure", "Storage traffic will cause network routing loops"]'::jsonb,
  1,
  'iSCSI transmits block-level storage data over TCP/IP. When this traffic shares the same physical network as user traffic, it is exposed to sniffing and man-in-the-middle attacks. An attacker on the network could intercept or modify raw storage blocks containing sensitive data. Best practice is to isolate iSCSI on a dedicated network or VLAN with CHAP authentication and IPsec encryption. Performance is a secondary concern to security. iSCSI works on Ethernet by design.',
  'iSCSI on shared networks: "Block storage in the open = blocks of data for attackers." Isolate or encrypt.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q87: Hard / Apply / Best Answer — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.0 = 1.8, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'micro_segmentation',
  'Which technology BEST enables micro-segmentation in a virtualized data center where workloads frequently migrate between physical hosts?',
  '["Hardware-based firewalls at the data center perimeter", "Traditional VLAN segmentation with 802.1Q trunking", "Distributed virtual firewalls with policies attached to individual virtual machines that follow them during migration", "Physical network air gaps between server racks"]'::jsonb,
  2,
  'Distributed virtual firewalls attach security policies directly to individual virtual machines. When a VM migrates to a different physical host, the security policy follows it, maintaining consistent enforcement. Hardware firewalls at the perimeter cannot inspect east-west traffic between VMs. Traditional VLANs do not provide per-workload granularity. Air gaps are impractical in virtualized environments where workloads are designed to be mobile.',
  'Distributed virtual firewalls: "Security travels with the VM" — policies follow the workload, not the port.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- Q88: Hard / Analyze / Scenario — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'vpn_ipsec',
  'A multinational corporation operates IPsec VPNs between offices in countries with different encryption regulations. Country A allows AES-256, Country B restricts encryption to AES-128, and Country C prohibits encryption entirely but allows authentication. The security architect must design a VPN topology that complies with all local laws while maximizing security. Which approach BEST meets these requirements?',
  '["Use AES-256 for all tunnels and ignore local regulations", "Disable all VPN connections to Country C to avoid legal risk", "Use the same AES-128 encryption for all connections as the lowest common denominator", "Configure AES-256 for Country A tunnels, AES-128 for Country B tunnels, and IPsec AH-only (authentication without encryption) for Country C tunnels"]'::jsonb,
  3,
  'This approach maximizes security within each jurisdiction''s legal constraints. Country A gets the strongest encryption available, Country B gets the strongest encryption permitted, and Country C gets authentication and integrity protection through AH even though encryption is prohibited. Ignoring regulations creates legal liability. Disconnecting Country C eliminates business operations. Using AES-128 everywhere unnecessarily weakens Country A''s security.',
  'VPN compliance: "Maximize security within each country''s legal boundaries." Different laws = different configs.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q89: Hard / Apply / Best Answer — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.0 = 1.8, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'network_monitoring',
  'An organization needs to detect both known attack signatures and previously unknown zero-day attacks on its network. Which IDS detection methodology BEST provides coverage for both known and unknown threats?',
  '["A combination of signature-based detection for known attacks and anomaly-based detection for deviations from established baselines", "Signature-based detection with frequent signature updates", "Anomaly-based detection exclusively, without any signature rules", "Protocol analysis focused only on HTTP traffic"]'::jsonb,
  0,
  'Combining signature-based and anomaly-based detection provides the most comprehensive coverage. Signatures detect known attacks with high accuracy and low false positives. Anomaly-based detection establishes behavioral baselines and identifies deviations that may indicate unknown or zero-day attacks, though with higher false positive rates. Neither approach alone covers both categories. Protocol analysis on one protocol is too narrow.',
  'IDS detection: "Signatures catch the KNOWN bad. Anomaly detection catches the UNKNOWN weird." Use both.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- Q90: Hard / Apply / Scenario — correct at 1
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'traffic_flows',
  'A security architect is designing monitoring for a new data center. The architecture uses a spine-leaf network topology with most traffic flowing between application tiers (web servers to application servers to database servers) rather than through the perimeter. Traditional perimeter IDS sensors only see north-south traffic. Which monitoring strategy BEST provides visibility into the predominant traffic patterns?',
  '["Adding more sensors at the Internet perimeter to increase north-south monitoring capacity", "Deploying distributed IDS sensors and traffic taps at the leaf switch layer to capture east-west traffic between application tiers", "Monitoring only the spine switches since all traffic passes through them", "Relying on endpoint-based antivirus for application tier security"]'::jsonb,
  1,
  'In a spine-leaf architecture with predominantly east-west traffic, monitoring must be placed at the leaf switches where inter-tier traffic originates. Distributed IDS sensors and taps at the leaf layer capture lateral traffic between web, application, and database tiers. Perimeter-only monitoring misses the majority of traffic. Spine switches handle aggregated traffic but individual flows may be harder to inspect. Endpoint AV is not a network monitoring solution.',
  'Spine-leaf monitoring: "East-west traffic hides at the leaves." Put sensors where the traffic IS, not where it exits.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD (10) — IRT b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: Very Hard / Analyze / TLATM — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'sdn_sdwan',
  'The CEO has asked the CISO to evaluate whether the organization should adopt a zero trust network architecture to replace the existing perimeter-based security model. The current infrastructure includes legacy applications that cannot support modern authentication protocols, regulatory requirements for network segmentation auditing, and a workforce that is 60 percent remote. Which response BEST demonstrates strategic security thinking?',
  '["Zero trust is unnecessary because the existing perimeter firewall provides adequate protection for all scenarios", "Zero trust should be avoided because legacy applications cannot be adapted", "Zero trust should be adopted incrementally: begin with identity-centric controls for remote workers, implement micro-segmentation for cloud workloads, create secure enclaves for legacy applications with compensating controls, and align the roadmap with regulatory audit requirements", "Implement zero trust immediately across the entire organization within 90 days to maximize security"]'::jsonb,
  2,
  'Strategic security thinking recognizes that zero trust is a journey, not a single deployment. The recommended approach addresses each challenge: identity-centric controls serve the 60% remote workforce, micro-segmentation secures cloud workloads, secure enclaves protect legacy applications that cannot be modernized, and the roadmap aligns with regulatory requirements. Dismissing zero trust ignores evolving threats. Avoiding it due to legacy limitations is defeatist. A 90-day full deployment is unrealistic and risky.',
  'Zero trust adoption: "Think Like A Manager" — phased implementation matching business realities, not all-or-nothing.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q92: Very Hard / Analyze / Scenario — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'network_attacks',
  'A threat intelligence team identifies that a nation-state actor is using a sophisticated multi-stage attack against the organization''s network. Stage 1 uses DNS tunneling for command and control. Stage 2 exploits a zero-day in the VPN concentrator to establish persistent access. Stage 3 uses encrypted lateral movement through legitimate administrative protocols (SSH and RDP). Stage 4 exfiltrates data through steganography embedded in HTTPS image requests. Which combination of controls would BEST detect this attack chain?',
  '["Perimeter firewall with stateful inspection and antivirus on all endpoints", "Full packet capture at the perimeter and monthly vulnerability scanning", "Network segmentation with VLANs and annual penetration testing", "DNS traffic anomaly analysis, VPN endpoint behavioral monitoring, east-west traffic analysis with machine learning baselines, and TLS inspection with data loss prevention for outbound HTTPS"]'::jsonb,
  3,
  'Each stage of this attack requires a different detection mechanism. DNS anomaly analysis catches tunneling (Stage 1). VPN behavioral monitoring detects zero-day exploitation patterns (Stage 2). East-west ML-based analysis identifies unusual lateral movement even through legitimate protocols (Stage 3). TLS inspection with DLP examines decrypted outbound content for steganographic exfiltration (Stage 4). The other options lack the depth and breadth needed to detect all four stages.',
  'Multi-stage attack detection: "Match each attack stage with a specific detection control." One tool cannot catch everything.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q93: Very Hard / Analyze / Calculation — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.4 = 3.0 (clamped), a = 1.5 + 0.3 = 1.8, c = 0.20
(
  4,
  'ip_addressing',
  'An organization has been allocated the public IP block 203.0.113.0/24. They need to create exactly 6 subnets for different departments, each requiring a minimum of 20 usable host addresses. After allocating the subnets, how many IP addresses from the original /24 block remain unallocated?',
  '["64 addresses remain unallocated", "32 addresses remain unallocated", "0 addresses remain unallocated", "128 addresses remain unallocated"]'::jsonb,
  0,
  'To support 20 hosts, each subnet needs at least 5 host bits (2^5 - 2 = 30 usable). This means each subnet is a /27 (32 addresses per subnet). Six subnets require 6 x 32 = 192 addresses. The original /24 contains 256 addresses. 256 - 192 = 64 addresses remain unallocated. These could form two additional /27 subnets or one /26 subnet for future use.',
  'Subnet allocation: 6 subnets x /27 (32 each) = 192 used. 256 - 192 = 64 remaining. Always account for waste.',
  'analyze',
  'calculation',
  'very_hard',
  1.80, 3.00, 0.20,
  'ai_generated', true
),

-- Q94: Very Hard / Analyze / Except Not — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  4,
  'secure_protocols',
  'All of the following are improvements in TLS 1.3 over TLS 1.2 EXCEPT:',
  '["Reduced handshake latency from two round trips to one round trip (1-RTT)", "Support for static RSA key exchange to maintain backward compatibility with older servers", "Mandatory use of perfect forward secrecy through ephemeral key exchange", "Removal of support for legacy cipher suites including RC4, 3DES, and CBC mode ciphers"]'::jsonb,
  1,
  'TLS 1.3 explicitly REMOVES support for static RSA key exchange, not maintains it. Static RSA key exchange does not provide forward secrecy because the same server private key is used to decrypt all sessions. TLS 1.3 mandates ephemeral Diffie-Hellman key exchange for all connections. The other options are all genuine TLS 1.3 improvements: 1-RTT handshake, mandatory PFS, and removal of insecure legacy ciphers.',
  'TLS 1.3 REMOVED static RSA: "RSA key exchange = Removed for Security Advancement." Only ephemeral keys allowed.',
  'analyze',
  'except_not',
  'very_hard',
  1.40, 3.00, 0.25,
  'ai_generated', true
),

-- Q95: Very Hard / Analyze / TLATM — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'firewall_types',
  'A regulated financial institution is evaluating its firewall architecture during an annual security review. The current architecture uses a single NGFW at the perimeter. The compliance team requires PCI DSS compliance, the operations team reports that the NGFW creates a bottleneck during peak trading hours, and the application team needs granular control over API traffic between microservices. As the security manager, which architectural recommendation BEST addresses all three concerns?',
  '["Add a second identical NGFW in active-passive failover at the perimeter", "Replace the NGFW with a faster stateless packet filter to eliminate the bottleneck", "Deploy a tiered architecture: NGFW at the perimeter for north-south traffic (PCI compliance), distributed WAFs for API microservice protection, and load-balanced active-active firewalls to eliminate the bottleneck during peak hours", "Remove the firewall and rely on host-based security controls on each server"]'::jsonb,
  2,
  'A tiered architecture addresses all three requirements simultaneously. The perimeter NGFW maintains PCI DSS compliance for cardholder data flows. Distributed WAFs provide granular API-level control between microservices. Active-active load balancing eliminates the single-point bottleneck during peak hours. A second NGFW in failover does not solve the bottleneck. Stateless filters sacrifice security. Removing the firewall violates PCI DSS requirements.',
  'Tiered firewall architecture: "Right tool for each job." Perimeter NGFW + distributed WAFs + load balancing = all requirements met.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q96: Very Hard / Apply / Scenario — correct at 3
-- IRT: b = 2.5 + 0.3 + 0.2 = 3.0 (clamped), a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'email_security',
  'A security architect is designing an email security architecture for a healthcare organization that must comply with HIPAA. The requirements include: protecting ePHI in email from unauthorized access during transit and at rest, preventing email spoofing of the organization''s domain, providing non-repudiation for emails containing clinical orders, and enabling secure communication with external partners who may not have compatible email infrastructure. Which comprehensive solution addresses ALL requirements?',
  '["TLS enforcement on all SMTP connections and SPF records in DNS", "PGP encryption for all internal users with a web-of-trust model", "End-to-end encryption with proprietary software installed on all partner systems", "S/MIME with organizational certificates for encryption and digital signatures (transit/rest protection + non-repudiation), SPF/DKIM/DMARC for anti-spoofing, and a secure email portal for partners without S/MIME capability"]'::jsonb,
  3,
  'This comprehensive solution addresses each requirement: S/MIME provides encryption in transit and at rest (HIPAA compliance), digital signatures provide non-repudiation for clinical orders, SPF/DKIM/DMARC prevent domain spoofing, and a secure portal enables external partners without S/MIME to access encrypted messages through a web interface. TLS alone does not protect at rest or provide non-repudiation. PGP''s web-of-trust is unsuitable for organizational use. Proprietary software is impractical for all partners.',
  'Healthcare email security: "S/MIME signs and seals, DMARC blocks spoofs, Portal bridges the gap" with external partners.',
  'apply',
  'scenario',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q97: Very Hard / Analyze / Scenario — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'wireless_security',
  'An organization with a highly secure facility discovers that an attacker has been exfiltrating data using a covert wireless channel. Investigation reveals the attacker planted a small device that converts sensitive data into modulated light pulses transmitted through an office window to a receiver across the street. The facility''s wireless security monitoring detected no Wi-Fi, Bluetooth, or cellular anomalies. Which security control would have MOST effectively prevented or detected this attack vector?',
  '["Physical security controls including window treatments that block optical transmission (blinds, IR-filtering film), TEMPEST shielding for the facility, and regular physical security sweeps to detect unauthorized devices", "Upgrading the wireless IDS to support newer Wi-Fi protocols", "Implementing WPA3-Enterprise on all access points", "Deploying additional network-based DLP sensors"]'::jsonb,
  0,
  'This attack uses Li-Fi (light-based data transmission), which operates outside the radio frequency spectrum monitored by wireless IDS. Detection and prevention require physical security controls: window treatments to block optical transmission, TEMPEST-level shielding to prevent electromagnetic and optical emanations, and physical sweeps to find planted devices. Wi-Fi upgrades, WPA3, and network DLP address radio-frequency and network-based threats, not optical covert channels.',
  'Covert channels beyond Wi-Fi: "Light, sound, heat — not just radio." Physical security addresses physical emanations.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q98: Very Hard / Analyze / First Action — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.3 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'network_segmentation',
  'During a security assessment of a critical infrastructure organization, the assessor discovers that the SCADA network controlling power generation equipment is connected to the corporate network through a dual-homed engineering workstation. The workstation has both a SCADA network NIC and a corporate network NIC, effectively bridging the air gap. Removing the bridge immediately would disrupt monitoring of safety-critical systems. What should be the FIRST action?',
  '["Immediately disconnect the corporate NIC to restore the air gap regardless of operational impact", "Install a unidirectional security gateway (data diode) to replace the dual-homed connection, allowing SCADA monitoring data to flow out to the corporate network while preventing any inbound traffic from reaching the SCADA network", "Deploy antivirus software on the engineering workstation as a temporary measure", "Add a firewall rule to restrict corporate network traffic to the workstation"]'::jsonb,
  1,
  'A data diode (unidirectional gateway) allows monitoring data to flow from the SCADA network to the corporate network for visibility while physically preventing any traffic from flowing back into the SCADA network. This maintains the safety-critical monitoring capability while eliminating the bidirectional bridge that compromised the air gap. Immediate disconnection risks safety. Antivirus does not address the architectural flaw. Firewall rules can be misconfigured or bypassed.',
  'Data diode for SCADA: "One-way street for data" — monitoring flows OUT, attacks cannot flow IN.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: Very Hard / Analyze / Most Likely — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.1 = 3.0 (clamped), a = 1.5 + 0.1 = 1.6, c = 0.22
(
  4,
  'tcp_handshake',
  'A forensic analyst examining network captures from a suspected compromise observes the following pattern: the attacker''s system sends a SYN packet to port 80 on each of 1,000 internal hosts, but instead of completing the three-way handshake, it immediately sends a RST after receiving the SYN/ACK. For hosts that respond with RST/ACK (indicating a closed port), no further action is taken. What is the MOST LIKELY purpose of this activity?',
  '["The attacker is performing a DDoS attack against the internal network", "The attacker is attempting to establish encrypted tunnels to each host", "The attacker is performing a TCP SYN scan (half-open scan) to identify hosts with port 80 open while avoiding full connection logging on the target systems", "The attacker is testing the bandwidth capacity of the internal network"]'::jsonb,
  2,
  'A TCP SYN scan (half-open scan) sends SYN packets and analyzes responses without completing the handshake. A SYN/ACK response means the port is open; a RST/ACK means it is closed. By sending RST immediately after receiving SYN/ACK, the scanner avoids establishing a full connection, which on many systems prevents the connection from being logged in application logs. This is a common reconnaissance technique used to map network services while attempting to avoid detection.',
  'SYN scan = "Sneak peek at ports." SYN sent, SYN/ACK = open, RST sent = no full connection = less logging.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),

-- Q100: Very Hard / Analyze / TLATM — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'remote_access',
  'An organization experienced a data breach through a compromised VPN connection. Post-incident analysis reveals the attacker used stolen VPN credentials to access the network, then exploited the full network access provided by the VPN to move laterally to sensitive systems. The CISO must recommend a strategic architecture change to prevent similar incidents. Which recommendation BEST addresses the root cause from a management perspective?',
  '["Require longer and more complex VPN passwords with 90-day rotation", "Deploy a second VPN concentrator for redundancy", "Add network monitoring tools to detect lateral movement faster", "Transition from VPN-based network access to a zero trust architecture with identity-aware proxies, continuous authentication, least-privilege access per application, and device health verification before granting access to each specific resource"]'::jsonb,
  3,
  'The root cause is the VPN''s implicit trust model: once authenticated, the user received full network access. Zero trust eliminates this by requiring continuous verification for each resource request, granting access only to specific applications (not the entire network), verifying device health, and applying least-privilege principles. Stronger passwords do not prevent credential theft. A second VPN concentrator adds availability, not security. Monitoring detects but does not prevent the architectural flaw.',
  'VPN to Zero Trust: "VPN trusts the user, Zero Trust trusts nothing." The architecture IS the vulnerability — change the architecture.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
);