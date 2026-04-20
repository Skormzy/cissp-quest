INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  4,
  'network_segmentation',
  'A healthcare network architect is redesigning the network to comply with HIPAA requirements. The network currently has a flat topology with all departments — including medical devices, patient registration, billing, and guest Wi-Fi — on the same network segment. After implementing proper segmentation, the architect notices that east-west traffic between the medical device VLAN and the billing VLAN has increased by 300%. What is the MOST likely explanation and concern?',
  '["Medical devices are communicating with billing systems through an application dependency that wasn''t identified during the segmentation planning, and this traffic should be analyzed for necessity and secured", "The network switches are misconfigured and allowing traffic to leak between VLANs", "The increase is normal as segmented networks always show higher inter-VLAN traffic due to routing overhead", "Billing users are deliberately bypassing the segmentation to access medical devices"]'::jsonb,
  0,
  'The most likely explanation is an undiscovered application dependency. Medical devices often communicate with billing systems for procedure coding, patient identification, or insurance verification. Proper segmentation makes this traffic visible for the first time. The concern is that this traffic may contain ePHI traversing segments without appropriate encryption or access controls. Switch misconfiguration would show random traffic, not a 300% increase in a specific pattern. Segmentation doesn''t inherently increase traffic. User bypass is unlikely.',
  'Segmentation reveals hidden dependencies. New visibility into east-west traffic often uncovers surprising application relationships. Document, analyze, secure.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  4,
  'secure_protocols',
  'An organization is replacing insecure legacy protocols across its infrastructure. Which mapping BEST represents the correct secure replacement for each protocol?',
  '["Telnet→SSH, HTTP→HTTPS, FTP→FTPS, SNMP v1→SNMP v2c", "Telnet→SSH, HTTP→HTTPS, FTP→SFTP, SNMP v1→SNMP v3", "Telnet→RDP, HTTP→HTTPS, FTP→SCP, SNMP v1→SNMP v2c", "Telnet→SSH, HTTP→TLS, FTP→TFTP, SNMP v1→SNMP v3"]'::jsonb,
  1,
  'The correct secure replacements are: Telnet→SSH (encrypted remote access), HTTP→HTTPS (TLS-encrypted web traffic), FTP→SFTP (SSH-based encrypted file transfer), SNMP v1→SNMP v3 (authentication and encryption). SNMP v2c still uses community strings without encryption — not a secure upgrade. RDP is not a Telnet replacement (different protocol entirely). TFTP is less secure than FTP, not a replacement. SCP works but SFTP is the standard replacement. TLS alone isn''t a protocol name for web access.',
  'Secure protocol upgrades: Telnet→SSH, HTTP→HTTPS, FTP→SFTP, SNMPv1→SNMPv3. The ''S'' usually means Secure.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  4,
  'email_security',
  'Users at a corporation report receiving phishing emails that appear to come from the company''s own domain. The emails pass SPF checks because the sending server is a legitimate cloud email marketing service the company uses. The security team needs to prevent these spoofed emails from reaching users. Which combination of email security controls would BEST address this issue?',
  '["Implement a web application firewall to filter incoming email content", "Deploy end-to-end encryption for all internal email communications", "Add IP-based blocking rules for the cloud marketing service at the mail gateway", "Configure DKIM to cryptographically sign legitimate emails and set a DMARC policy to reject emails that fail both SPF and DKIM alignment"]'::jsonb,
  3,
  'The attack exploits the fact that SPF alone verifies the sending server, not the message sender. DKIM adds cryptographic signing so recipients can verify the email was genuinely sent by the organization. DMARC ties SPF and DKIM together with a policy — emails that fail both checks are rejected. This stops spoofed emails even when they come from SPF-valid servers. A WAF doesn''t handle email. E2E encryption doesn''t prevent spoofing. Blocking the marketing service would break legitimate campaigns.',
  'SPF alone isn''t enough. Add DKIM (signature) + DMARC (policy) = complete email authentication. Three layers work together.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  4,
  'micro_segmentation',
  'As the network security director, your organization is adopting zero trust architecture for its data center. The current perimeter-based model uses traditional VLANs and firewalls. The CTO wants to implement micro-segmentation using software-defined networking. The operations team pushes back, arguing that the complexity will increase outage risk. The compliance team notes that PCI DSS requires network segmentation. How should you frame this initiative to the executive committee?',
  '["Position it as a compliance requirement and emphasize that PCI DSS mandates micro-segmentation specifically", "Focus on the cost savings from eliminating physical firewalls throughout the data center", "Present micro-segmentation as a risk reduction initiative that limits blast radius of breaches, supports compliance requirements, and can be implemented incrementally to manage operational complexity", "Recommend postponing the initiative until the next budget cycle to allow thorough evaluation"]'::jsonb,
  2,
  'The management approach frames the initiative in terms executives understand: risk reduction and business value. Micro-segmentation limits breach blast radius (reducing potential incident costs), supports compliance (PCI DSS requires segmentation, though not micro-segmentation specifically), and can be implemented incrementally to address operations concerns. PCI DSS doesn''t mandate micro-segmentation specifically — misrepresenting requirements damages credibility. Cost savings alone don''t justify the project. Postponing doesn''t address the risk. Incremental implementation manages the operational complexity concern.',
  'Frame security as RISK REDUCTION with BUSINESS VALUE. Address all stakeholder concerns. Incremental implementation manages change risk.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  4,
  'vpn_ipsec',
  'A remote worker reports that their IPsec VPN connection keeps dropping every few minutes when working from a hotel. The VPN uses ESP in transport mode. The worker can browse the internet normally. What should the network administrator check FIRST?',
  '["Whether the hotel Wi-Fi bandwidth is sufficient for VPN traffic", "Whether the hotel network uses NAT, which is incompatible with ESP in transport mode without NAT traversal", "Whether the worker''s laptop firewall is blocking VPN keep-alive packets", "Whether the VPN concentrator has reached its maximum connection limit"]'::jsonb,
  1,
  'ESP (Encapsulating Security Payload) in transport mode modifies the IP header in a way that is incompatible with NAT (Network Address Translation). Hotel networks almost universally use NAT. Without NAT-T (NAT Traversal, which encapsulates ESP in UDP port 4500), ESP packets are dropped or corrupted by NAT devices. The fact that internet browsing works normally confirms network connectivity is fine — it''s specifically the ESP/NAT incompatibility. Bandwidth issues would affect all traffic. Laptop firewalls typically allow established VPN sessions. Connection limits would prevent initial connection.',
  'ESP + NAT = broken. Hotel WiFi = NAT. Enable NAT-T (UDP 4500) to tunnel ESP through NAT. AH is also NAT-incompatible.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;