INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  4,
  'nac_802_1x',
  'A corporate campus deploys 802.1X port-based authentication on all network switches. After deployment, the facilities team reports that IP phones, security cameras, and building management IoT sensors have lost connectivity. These devices don''t support 802.1X authentication. The security team cannot exempt entire switch ports from authentication without creating gaps. What is the BEST solution?',
  '["Configure MAC Authentication Bypass (MAB) on ports connected to non-802.1X devices, placing them in a restricted VLAN with appropriate access controls", "Replace all non-802.1X devices with models that support 802.1X authentication", "Create a separate physical network for all non-802.1X devices", "Disable 802.1X on all ports and rely on MAC address filtering instead"]'::jsonb,
  0,
  'MAC Authentication Bypass is the standard solution for devices that cannot perform 802.1X authentication. MAB uses the device''s MAC address as its credential, allowing network access while placing the device in a restricted VLAN with limited access. Replacing all devices is prohibitively expensive. A separate physical network adds infrastructure cost and complexity. Disabling 802.1X entirely abandons network access control for all devices. MAB is less secure than 802.1X but provides reasonable assurance when combined with VLAN restriction.',
  'IoT can''t do 802.1X? Use MAB (MAC Authentication Bypass) into a restricted VLAN. Imperfect but practical.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),
(
  4,
  'dns_security',
  'A security analyst notices that a compromised workstation is making hundreds of DNS queries per minute to unusual subdomains like "a3f2b8.data.evil-domain.com" and "x7d1c4.data.evil-domain.com". Each subdomain is unique and the queries contain what appear to be encoded strings. What type of attack is MOST likely occurring?',
  '["DNS cache poisoning to redirect users to malicious websites", "A DNS amplification DDoS attack targeting the evil-domain.com server", "DNS tunneling being used for data exfiltration by encoding stolen data in DNS query subdomains", "A DNS zone transfer attempt to enumerate all records in the evil-domain.com zone"]'::jsonb,
  2,
  'DNS tunneling encodes data in DNS queries, typically as subdomains. Each unique subdomain query carries a chunk of exfiltrated data encoded in the subdomain string. This technique bypasses most firewalls because DNS (port 53) is almost always allowed outbound. The pattern of hundreds of unique subdomain queries with encoded-looking strings is the classic indicator. Cache poisoning involves manipulating DNS responses, not generating outbound queries. DDoS amplification uses open resolvers. Zone transfers are server-to-server operations.',
  'Unique subdomain queries with encoded strings = DNS TUNNELING for exfiltration. DNS is allowed everywhere, making it a favorite covert channel.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),
(
  5,
  'access_control_attacks',
  'A security team detects that an attacker has obtained a Kerberos Ticket Granting Ticket by compromising the KRBTGT account hash from a domain controller. The attacker can now create tickets for any user, including domain administrators, with any lifetime they choose. What type of attack has occurred, and what is the PRIMARY remediation challenge?',
  '["Silver ticket attack; the challenge is identifying which service accounts were compromised", "Pass-the-hash attack; the challenge is resetting all user passwords in the domain", "Kerberoasting attack; the challenge is changing all service principal names", "Golden ticket attack; the challenge is that the KRBTGT password must be reset twice to fully invalidate the attacker''s forged tickets"]'::jsonb,
  3,
  'Compromising the KRBTGT hash enables golden ticket creation — the attacker can forge Ticket Granting Tickets for any identity with any permissions and expiration. The unique remediation challenge is that KRBTGT has two password versions stored in Active Directory. A single reset only invalidates one version; the attacker can still use tickets based on the previous version. Two consecutive resets are required, spaced apart, to fully invalidate all golden tickets. Silver tickets target specific services. Pass-the-hash uses user hashes. Kerberoasting cracks service account tickets.',
  'KRBTGT compromise = GOLDEN ticket. Reset KRBTGT TWICE (it keeps 2 password versions). Golden > Silver in scope and power.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  5,
  'zero_trust',
  'An organization implementing zero trust architecture is evaluating how to handle access decisions for internal applications. Currently, any user on the corporate network can access most internal applications. Which approach BEST aligns with zero trust principles?',
  '["Every access request must be evaluated based on user identity, device health, location, and behavior regardless of network position, with continuous verification throughout the session", "Users authenticated to the corporate VPN should be trusted for all internal application access during their session", "Role-based access controls should be implemented, granting users access based solely on their job title", "Network segmentation into trusted and untrusted zones with a traditional perimeter firewall between them"]'::jsonb,
  0,
  'Zero trust''s core principle is "never trust, always verify." Every access request must be evaluated regardless of network location. The evaluation considers multiple signals: identity, device posture, behavior patterns, and context. Continuous verification means trust is reassessed throughout the session, not just at login. VPN-based trust is exactly the perimeter model zero trust replaces. RBAC alone ignores device health and context. Network zones with perimeter firewalls are traditional security, not zero trust.',
  'Zero Trust = Never trust, always verify. EVERY request evaluated. Identity + Device + Context + Behavior = continuous decision.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  5,
  'sso_federation',
  'A large enterprise uses SAML-based SSO for all cloud applications. During a security assessment, the team discovers that the identity provider''s SAML assertion signing certificate expires in 7 days. The IdP serves 15,000 users across 40 service providers. The team needs to rotate the certificate. What is the MOST critical risk if the certificate rotation is mishandled?',
  '["Users will see browser certificate warnings when accessing cloud applications", "All federated SSO will break simultaneously — 15,000 users locked out of 40 applications — if any service provider doesn''t update its trust configuration with the new certificate before the old one expires", "The SAML assertions will continue to work but without signature verification", "Only the identity provider will be affected; service providers will continue to accept assertions"]'::jsonb,
  1,
  'SAML federation depends on service providers trusting the identity provider''s signing certificate. When the IdP certificate changes, every SP must update its trust configuration with the new certificate. If any SP is missed or the timing is wrong, that SP will reject all SAML assertions — locking users out of that application. With 40 SPs, the coordination complexity is enormous. Browser warnings relate to TLS certificates, not SAML signing. SPs cannot process unsigned assertions. Both IdP and SPs are affected because trust is bidirectional.',
  'SAML cert rotation = update ALL service providers. Miss one SP = that app is locked out. Coordinate carefully with overlap period.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;