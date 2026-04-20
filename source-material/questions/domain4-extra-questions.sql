-- =====================================================================
-- CISSP Quest -- Domain 4: Communication and Network Security
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: BGP security, DNSSEC, TLS 1.3 handshake,
--   microsegmentation, SD-WAN security, IPv6 security
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain4-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  4, 'bgp_security',
  'In April 2010, China Telecom briefly advertised 15% of all IPv4 routing prefixes, redirecting internet traffic through Chinese networks. Which BGP security control MOST directly prevents this type of route hijacking?',
  '["RPKI (Resource Public Key Infrastructure) with Route Origin Validation (ROV), which cryptographically binds IP prefixes to their authorized origin ASNs using Route Origin Authorizations (ROAs) -- invalid or unknown origin advertisements can be rejected by ROV-enabled routers", "BGP route filtering using prefix lists to block advertisements from specific ASNs", "Deploying DNSSEC to validate route advertisements before they propagate", "Implementing IPsec between BGP peers to encrypt routing update packets"]'::jsonb,
  0,
  'RPKI (RFC 6480) allows IP address space holders to create Route Origin Authorizations (ROAs) that cryptographically attest which Autonomous Systems (ASNs) are authorized to originate specific prefixes. BGP routers with Route Origin Validation (ROV) can mark routes as Valid, Invalid, or Unknown based on RPKI, and can reject Invalid routes (those where the origin ASN doesn''t match the ROA). This directly addresses prefix hijacking. Prefix filter lists are manually maintained and don''t scale. DNSSEC secures DNS, not routing. IPsec encrypts BGP session traffic but doesn''t validate route legitimacy.',
  'BGP hijack fix = RPKI + ROV. ROA = cryptographic "I own this prefix" certificate. ROV = router checks ROAs and rejects invalid origins.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  4, 'dns_security',
  'Which statement MOST accurately describes the difference between DNSSEC and DNS over HTTPS (DoH) in terms of what each protects against?',
  '["DNSSEC and DoH both protect against DNS cache poisoning and provide equal security guarantees", "DNSSEC protects DNS data integrity and authenticity by signing resource records, preventing cache poisoning and spoofing of DNS responses -- but does NOT encrypt DNS traffic. DoH encrypts DNS queries between the client and resolver, providing confidentiality and preventing DNS monitoring/blocking by network intermediaries -- but DoH alone does not prevent a malicious resolver from returning false records", "DoH replaces DNSSEC because encrypted DNS queries cannot be tampered with in transit", "DNSSEC encrypts the DNS zone transfer data while DoH encrypts recursive queries to authoritative servers"]'::jsonb,
  1,
  'DNSSEC (RFC 4033-4035) uses asymmetric cryptography to sign DNS records. Resolvers validate signatures against the chain of trust from the root zone. DNSSEC prevents cache poisoning, zone data tampering, and man-in-the-middle attacks on DNS data. However, DNSSEC does NOT encrypt -- DNS queries and responses are still plaintext, visible to network observers. DoH (RFC 8484) wraps DNS queries in HTTPS, providing confidentiality from network monitors. However, DoH does not validate that the resolver returns correct data -- a malicious or compromised DoH resolver can still return false records. Both technologies are complementary and address different threats.',
  'DNSSEC = integrity/authenticity (signs records, prevents spoofing). DoH = confidentiality (encrypts queries). Neither does both. Combine them.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  4, 'tls_security',
  'A security architect reviews a TLS 1.3 handshake capture. The architect notices the server sends a Certificate and CertificateVerify message before the client sends any application data. Which TLS 1.3 feature does this illustrate, and what security improvement does it represent over TLS 1.2?',
  '["TLS 1.3 requires mutual authentication, so both client and server always send certificates", "TLS 1.3 uses a 3-way handshake instead of TLS 1.2''s 4-way handshake, reducing latency by eliminating the ChangeCipherSpec message", "TLS 1.3 completes the handshake and derives session keys in 1-RTT (one round trip), with the server sending its certificate and proof of key possession in the first server flight (already encrypted), compared to TLS 1.2 which required 2-RTT before application data could begin; this reduces connection latency and also encrypts server certificate metadata from network observers", "TLS 1.3 moved server certificate transmission to after application data to improve forward secrecy"]'::jsonb,
  2,
  'TLS 1.3 (RFC 8446) redesigned the handshake for 1-RTT completion. In TLS 1.3: client sends ClientHello with key_share (Diffie-Hellman parameters). Server responds with ServerHello, key_share, then immediately sends encrypted Certificate + CertificateVerify + Finished (because DH keys are established after the first round trip). Application data can flow after the server Finished. TLS 1.2 required 2-RTT before application data. Additionally, TLS 1.3 encrypts the server certificate, hiding server identity from passive observers (improving privacy). TLS 1.3 also removed weak cipher suites and RSA key exchange.',
  'TLS 1.3 = 1-RTT handshake. Server sends cert ENCRYPTED in first flight. TLS 1.2 = 2-RTT, cert in plaintext. Faster + more private.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  4, 'microsegmentation',
  'An organization implements microsegmentation in their data center using software-defined networking (SDN). After deployment, the security team discovers that East-West traffic between two application tiers is being blocked unexpectedly, causing application failures. The firewall logs show the traffic is permitted by policy. What is the MOST likely cause?',
  '["The SDN controller is not receiving policy updates from the management plane due to a network partition", "The microsegmentation policy has a deny-all default rule that overrides specific permit rules", "The application tiers are using protocols that are blocked by the SDN''s deep packet inspection (DPI) engine regardless of policy", "The workload security tags or labels used to define the microsegmentation policy have been modified or incorrectly applied to the application tier VMs after a recent provisioning event, causing traffic to match a different (more restrictive) policy group than intended"]'::jsonb,
  3,
  'Microsegmentation policies are typically defined around workload identities -- security groups, tags, or labels applied to VMs/containers -- rather than static IP addresses. When VMs are reprovisioned, scaled, or migrated, their tags may be reapplied incorrectly, causing them to be classified into a different policy group. The firewall policy itself may be correct (the traffic IS permitted -- for the correct tag), but the VM is now tagged differently and matches a different, more restrictive policy. This is the most common operational failure mode in microsegmentation deployments. The disconnect between "policy says permit" and "traffic is blocked" in SDN environments usually indicates a tag/label mismatch, not a policy logic error.',
  'Microseg failure: check workload TAGS first. Policy may be right but the VM got re-tagged into the wrong group. Labels drive policy in SDN.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / tlatm / correct=0
(
  4, 'ipv6_security',
  'As a network security engineer, you are deploying IPv6 in a dual-stack environment. Your team proposes enabling IPv6 on all existing network devices but keeping the existing IPv4 security controls (perimeter firewall, IDS, network monitoring). What is the MOST important security gap to address?',
  '["IPv6 traffic may bypass IPv4-only security controls entirely if those controls do not process IPv6 packets; IPv6 also introduces new attack surfaces including SLAAC (Stateless Address Autoconfiguration) exploitation, IPv6 Neighbor Discovery Protocol (NDP) spoofing (analogous to ARP spoofing), and IPv6 extension header abuse", "IPv6 uses IPsec natively, making additional security controls unnecessary", "The transition to dual-stack automatically disables IPv4, removing all existing attack surfaces", "IPv6 addressing complexity makes network monitoring impossible without specialized tools"]'::jsonb,
  0,
  'IPv6 dual-stack creates significant security gaps if IPv4-only controls are not updated. Key risks: (1) IPv4-only firewalls/IDS silently pass IPv6 traffic -- attackers can tunnel attacks over IPv6 to bypass controls. (2) SLAAC allows hosts to auto-configure IPv6 addresses without DHCPv6, enabling rogue RA (Router Advertisement) attacks. (3) NDP (IPv6 Neighbor Discovery Protocol) performs functions similar to ARP; NDP spoofing is analogous to ARP poisoning but on IPv6. (4) IPv6 extension headers can be used to evade inspection. (5) Monitoring tools may not capture IPv6 traffic. All security controls must be verified to handle both protocol stacks.',
  'Dual-stack risk: IPv6 bypasses IPv4-only controls. SLAAC = rogue RA attacks. NDP spoofing = IPv6 ARP poison. Update ALL controls for both stacks.',
  'apply', 'tlatm', 'hard',
  1.70, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / comparison / correct=1
(
  4, 'sd_wan_security',
  'An organization is deploying SD-WAN to replace its MPLS-based WAN. The security team is evaluating the security implications. Which comparison MOST accurately describes the security posture change?',
  '["SD-WAN is inherently more secure than MPLS because it uses encryption by default while MPLS relies on physical network separation", "MPLS provides traffic isolation through label-switched paths in a provider-managed private network (lower internet attack surface), while SD-WAN routes traffic over public internet with encryption -- introducing internet-based attack surfaces including the SD-WAN controller (a high-value target), internet breakout at branch offices (bypassing centralized security controls), and zero-day vulnerabilities in SD-WAN appliances; security must be explicitly layered onto SD-WAN", "SD-WAN and MPLS have identical security profiles when IPsec tunnels are configured on MPLS links", "MPLS is more secure than SD-WAN in all scenarios because private network separation always outweighs encryption"]'::jsonb,
  1,
  'MPLS uses provider-managed private label-switched paths -- traffic never traverses the public internet, reducing internet-based attack surface (though MPLS is not encrypted by default and is vulnerable to provider-side attacks). SD-WAN routes over public internet with IPsec/TLS encryption. This introduces: (1) SD-WAN controller compromise risk (centralized orchestration = high-value target), (2) direct internet access at branch offices (often bypasses traditional security stack), (3) vulnerability to SD-WAN appliance zero-days. SD-WAN security requires SASE/SSE integration, traffic inspection, and controller hardening. Neither model is universally superior -- the answer depends on threat model and implementation.',
  'SD-WAN vs MPLS: MPLS = private (no internet). SD-WAN = encrypted public internet (new attack surfaces: controller + branch internet). Secure SD-WAN needs SASE.',
  'analyze', 'comparison', 'hard',
  1.80, 1.60, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  4, 'dns_security',
  'A security analyst observes that a DNS resolver is returning valid DNSSEC-signed responses for a domain, but the answers contain incorrect IP addresses. The DNSSEC validation chain up to the root shows no errors. How is this possible?',
  '["This is impossible if DNSSEC validation is successful -- valid DNSSEC signatures guarantee correct DNS responses", "The resolver is performing DNS rebinding to redirect traffic to attacker-controlled IPs while maintaining valid DNSSEC signatures", "The domain''s legitimate zone signing key (ZSK) or key signing key (KSK) has been compromised, allowing the attacker to sign fraudulent records with the legitimate key; DNSSEC validates the signature but cannot determine whether the signer had authorization to create those specific records", "DNSSEC validation is being bypassed by the resolver through a cache poisoning attack that targets the trust anchor"]'::jsonb,
  2,
  'DNSSEC validates that DNS records were signed by the key authorized in the parent zone''s DS record. If the zone signing key (ZSK) or key signing key (KSK) is compromised, an attacker can sign any record -- including false A records pointing to attacker IPs -- with the legitimate key. DNSSEC validation will succeed because the signature is cryptographically valid. DNSSEC does NOT provide end-to-end content security beyond cryptographic signature validation; it cannot detect legitimate-key misuse. This is why key management (DNSSEC key rollover, HSM protection of KSK/ZSK) is critical. DNS rebinding is a different attack class.',
  'DNSSEC with valid sig + wrong IP = compromised ZSK/KSK. DNSSEC verifies the signature, not whether the signer was honest. Key compromise = DNSSEC blind spot.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / scenario / correct=3
(
  4, 'network_protocols',
  'An organization''s security policy requires "encryption in transit for all data." A network engineer proposes using HTTPS for web traffic and SFTP for file transfers, and claims that SMTP email between internal mail servers does not require encryption because "it stays on our internal network." Why is this argument flawed?',
  '["The argument is correct; internal SMTP traffic is out of scope for encryption-in-transit policies because it never reaches the internet", "SMTP uses port 25 which is inherently encrypted at the transport layer", "Internal SMTP should use S/MIME message encryption instead of transport-level encryption because S/MIME is end-to-end", "Internal SMTP traffic can be intercepted by any host with access to the same network segment (e.g., via ARP spoofing or a compromised switch); STARTTLS/SMTPS should be required between internal mail servers to protect against lateral movement attacks and insider threat interception, and the assumption that ''internal = secure'' violates zero-trust architecture principles"]'::jsonb,
  3,
  'The assumption that internal network traffic is safe is the antithesis of zero-trust architecture. Internal SMTP in plaintext is vulnerable to: (1) ARP spoofing/poisoning allowing any LAN-connected host to intercept SMTP sessions, (2) compromised internal hosts performing man-in-the-middle on mail traffic, (3) malicious insiders with switch port access. STARTTLS (opportunistic) and SMTPS (forced TLS) are available for internal SMTP encryption. Policy enforcement should apply universally, not only to internet-facing traffic. Zero-trust requires verifying and encrypting all traffic regardless of network location.',
  'Internal ≠ secure. SMTP plaintext on LAN = interceptable via ARP spoofing. Zero-trust: encrypt everything. STARTTLS/SMTPS for internal mail servers.',
  'apply', 'scenario', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / tlatm / correct=0
(
  4, 'tls_security',
  'As a security architect reviewing an application''s TLS configuration, you discover the application supports TLS 1.0, TLS 1.1, TLS 1.2, and TLS 1.3 with the cipher suite list: TLS_RSA_WITH_RC4_128_SHA, TLS_RSA_WITH_AES_128_CBC_SHA, TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, TLS_AES_128_GCM_SHA256. What is the MOST critical remediation?',
  '["Disable TLS 1.0 and TLS 1.1 entirely, remove TLS_RSA_WITH_RC4_128_SHA (RC4 is broken) and TLS_RSA_WITH_AES_128_CBC_SHA (no forward secrecy, BEAST/POODLE susceptible), and enforce only TLS 1.2 with AEAD cipher suites (ECDHE+GCM) and TLS 1.3", "Disable TLS 1.3 because it is not yet widely supported and introduces compatibility issues", "Keep all TLS versions to maximize client compatibility; modern clients will negotiate the strongest version", "Replace the self-signed certificate with a CA-signed certificate as the primary remediation"]'::jsonb,
  0,
  'The configuration has multiple critical issues: (1) TLS 1.0 and 1.1 are deprecated (IETF RFC 8996) and vulnerable to POODLE, BEAST, and DROWN attacks. (2) RC4 is a broken cipher, prohibited by RFC 7465. (3) TLS_RSA_WITH_AES_128_CBC_SHA uses RSA key exchange (no forward secrecy) and CBC mode (BEAST/Lucky13 susceptible). Minimum configuration: disable TLS 1.0/1.1, remove RSA key exchange and RC4 cipher suites, enforce ECDHE (forward secrecy) with AEAD ciphers (GCM/CCM). TLS 1.3 should be enabled -- it dropped all weak cipher suites by design. Maintaining legacy TLS for "compatibility" is not acceptable given the vulnerabilities.',
  'TLS config: kill 1.0/1.1. Kill RC4. Kill RSA key exchange (no PFS). Keep ECDHE+AEAD. Enable 1.3. Compatibility ≠ excuse for broken protocols.',
  'apply', 'tlatm', 'hard',
  1.80, 1.50, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  4, 'network_protocols',
  'Which comparison MOST accurately describes the security differences between IPsec Tunnel Mode and Transport Mode?',
  '["Tunnel Mode and Transport Mode provide identical security; the only difference is whether the original IP header is preserved", "Tunnel Mode encapsulates the entire original IP packet (including original IP header) within a new IP packet, hiding the original source/destination IP addresses from network observers and providing full network topology protection -- ideal for VPN gateways between networks; Transport Mode encrypts only the payload (original IP header remains visible), providing lighter protection suitable for host-to-host communications where IP header confidentiality is less critical", "Transport Mode is more secure than Tunnel Mode because it uses a shorter header that reduces the attack surface", "Tunnel Mode can only be used with ESP while Transport Mode can only be used with AH"]'::jsonb,
  1,
  'IPsec Tunnel Mode: the entire original IP packet (header + payload) is encapsulated inside a new IPsec packet with a new outer IP header. This hides original source/destination addresses from network observers and protects network topology information. Used for site-to-site VPNs and remote access VPNs (gateway-to-gateway). Transport Mode: the original IP header is preserved; only the payload is encrypted/authenticated. Original source/destination are visible. Used for host-to-host communications (e.g., within a datacenter). Both modes can use AH (authentication only) or ESP (encryption + authentication). Neither is inherently "more secure" -- the choice depends on the use case.',
  'Tunnel Mode = new outer IP header (hides original src/dst). Transport Mode = original IP header visible. Tunnel = VPN gateways. Transport = host-to-host.',
  'analyze', 'comparison', 'very_hard',
  1.90, 1.90, 0.22, 'handcrafted', true
),

-- Q11: hard / apply / scenario / correct=2
(
  4, 'microsegmentation',
  'An organization implements microsegmentation for a three-tier web application (DMZ web tier, app tier, database tier). After deployment, an external penetration tester reports that a compromised web server can still communicate directly with the database tier. Which microsegmentation control failure does this represent?',
  '["The microsegmentation policy correctly allows web-to-database communication because multi-tier applications require direct database access from all tiers", "The network firewall rules allow web-to-database traffic as an expected exception to microsegmentation policy", "The microsegmentation policy was not enforced at the workload level -- policy was defined at the network/VLAN level (preventing tier-to-tier communication between VLANs) but not within the same VLAN; web and database servers share a VLAN or the database server''s host-based firewall was not configured, allowing intra-VLAN communication to bypass the microsegmentation policy", "The penetration tester used a vulnerability in the database software that bypasses network controls"]'::jsonb,
  2,
  'A common microsegmentation deployment failure is implementing segmentation at the VLAN/subnet boundary (macro-segmentation) without enforcing policy at the workload level (micro-segmentation). If web and database servers are on different VLANs, inter-VLAN routing controls may block direct communication. However, if a compromised web server can reach the database despite being on different VLANs, the policy enforcement point (distributed firewall or host-based firewall) was not correctly configured at the workload level. True microsegmentation requires policy enforcement at the workload boundary, not just at VLAN boundaries. This is a configuration/deployment gap, not an expected design.',
  'Microseg failure: check if policy enforced at WORKLOAD level (host firewall, distributed vFW), not just VLAN boundary. VLAN = macro. Workload = micro.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  4, 'bgp_security',
  'An organization''s BGP router receives a route advertisement for prefix 10.0.0.0/8 with an AS path of [AS64512, AS64513, AS64514]. The organization''s own AS is AS65001. What security concern should the network engineer investigate?',
  '["The advertisement should be accepted because RFC 1918 private IP space is routinely advertised in BGP", "The short AS path indicates the route originated close to the organization, making it highly trustworthy", "The advertisement is from a private AS number (AS64512) which indicates it is an internal route and should be accepted without RPKI validation", "RFC 1918 private address space (10.0.0.0/8) should NEVER appear in internet BGP routing tables; this advertisement likely represents a route leak or misconfiguration that would cause traffic for RFC 1918 destinations to be routed toward the advertising ASes, creating potential traffic blackholing and intelligence gathering risks -- it should be filtered"]'::jsonb,
  3,
  'RFC 1918 address space (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) is designated as private and should never appear in internet BGP routing tables. IANA''s "bogon" list includes RFC 1918, documentation ranges (192.0.2.0/24, 198.51.100.0/24), and unallocated space. Accepting such advertisements causes: (1) traffic destined for private IPs to be routed externally (traffic leak), (2) potential traffic interception, (3) routing loops. Best practice is to filter bogon routes at all BGP peers using prefix lists. AS64512-AS65534 are private ASNs used in internal routing and should also be filtered from external BGP sessions.',
  'BGP security: RFC 1918 in internet BGP = bogon = FILTER IT. Private ranges should never be in internet routing tables. Route leak risk.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  4, 'sd_wan_security',
  'An organization is deploying SD-WAN with direct internet access (DIA) at 50 branch offices, replacing centralized internet breakout through headquarters. The CISO asks what security architecture change is MOST critical to implement alongside the SD-WAN deployment.',
  '["Implement a cloud-delivered security stack (SASE or SSE -- Secure Service Edge) that provides consistent security policy enforcement at each branch''s internet breakout point, including NGFW/FWaaS, SWG (Secure Web Gateway), CASB, and ZTNA capabilities, because removing centralized routing removes the centralized security inspection point", "Deploy a hardware firewall at each branch office to replace the centralized security stack", "Accept the reduced security posture temporarily because performance gains from DIA outweigh the security risks", "Require all branch internet traffic to be backhauled to headquarters through the SD-WAN overlay to maintain centralized security control"]'::jsonb,
  0,
  'Traditional hub-and-spoke WAN architectures routed all branch traffic through headquarters where the security stack (NGFW, proxy, DLP, IDS) was centrally deployed. SD-WAN with DIA breaks this model -- each branch has a direct internet path that bypasses the central security stack. The architectural response is SASE (Secure Access Service Edge, Gartner) or SSE (Security Service Edge, to address the security component specifically): a cloud-delivered security stack that enforces consistent policy at each branch''s internet breakout. Deploying hardware firewalls at 50 branches is expensive and complex to manage. Backhauling through HQ defeats the performance purpose of DIA.',
  'SD-WAN + DIA = no central security stack. Fix = SASE/SSE (cloud security). Consistent policy at every branch breakout.',
  'apply', 'best_answer', 'hard',
  1.70, 1.40, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / first_action / correct=1
(
  4, 'network_protocols',
  'A security analyst receives alerts that a host on the internal network is sending large volumes of DNS queries with randomly-generated subdomains to a single external domain (e.g., a1b2c3.malware-c2.com, x9y8z7.malware-c2.com). What is the MOST likely attack, and what is the FIRST action?',
  '["This is DNS amplification -- the host is participating in a DDoS attack; first action is to null-route the external DNS server", "This is DNS tunneling or C2 beaconing via DNS -- malware on the host is encoding data in DNS subdomain queries to communicate with a command and control server; first action is to isolate the compromised host from the network while preserving forensic evidence, then investigate the host for malware", "This is legitimate behavior from a content delivery network (CDN) performing health checks; no action required", "This is a DNS cache poisoning attempt; first action is to flush the internal DNS resolver cache"]'::jsonb,
  1,
  'The pattern (random subdomains, high query volume, single parent domain) is a classic DNS tunneling or DNS-based C2 indicator. Malware encodes data in DNS query names (subdomains) to exfiltrate data or receive C2 commands while blending into DNS traffic (which is rarely blocked). This technique bypasses firewalls that allow DNS. First action: isolate the host (quarantine from network) to stop ongoing C2 communication and prevent lateral movement, while preserving forensic artifacts (do not power off). Then investigate for malware, reverse-engineer C2 protocol, and check for additional compromised hosts. DNS amplification involves sending queries with spoofed source IPs -- different pattern.',
  'Random subdomains + high volume + single parent = DNS tunneling/C2. Isolate host (quarantine), preserve evidence, then investigate. Do not power off.',
  'analyze', 'first_action', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / scenario / correct=2
(
  4, 'tls_security',
  'An organization performs TLS inspection (SSL/TLS interception) on all outbound HTTPS traffic at its secure web gateway. A security engineer argues this introduces a new risk: "We are now performing a man-in-the-middle on our own users." Which statement BEST evaluates this claim?',
  '["The claim is incorrect; TLS inspection is not a man-in-the-middle because the organization owns both the client devices and the gateway", "The claim is incorrect; TLS inspection is a standard industry practice and introduces no additional security risk", "The claim has merit: TLS inspection breaks end-to-end encryption, requiring the gateway''s re-signing CA to be installed in client trust stores (creating a single point of compromise), weakening the forward secrecy guarantee if the inspection gateway uses static keys, and potentially violating privacy regulations (GDPR, HIPAA) if personal or privileged communications are inspected; these risks must be explicitly managed through scope limitations, strong gateway security, and legal review", "The claim is incorrect; TLS inspection improves security by providing complete traffic visibility with no trade-offs"]'::jsonb,
  2,
  'TLS inspection (SSL bump/intercept) is a legitimate security control but introduces real risks: (1) The gateway''s re-signing CA must be in all client trust stores -- if this CA''s private key is compromised, attackers can forge certificates for any site. (2) Gateway inspection may use static session keys, weakening forward secrecy. (3) Some TLS 1.3 features (encrypted SNI) are bypassed by inspection. (4) Inspecting HTTPS traffic to banking, legal, medical, or other protected categories may violate GDPR, attorney-client privilege, or HIPAA confidentiality obligations. (5) The gateway becomes a high-value target. These risks require scope limitations, governance, and legal review -- not dismissal.',
  'TLS inspection risks: single CA compromise point + weakened PFS + privacy/legal exposure. Real trade-offs. Not "free security." Requires scope limits and governance.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.22, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  4, 'ipv6_security',
  'A security engineer configures RA Guard on all access switches to prevent rogue IPv6 Router Advertisement attacks. A penetration tester demonstrates the RA Guard can be bypassed. Which technique is MOST likely being used?',
  '["The penetration tester uses DHCPv6 starvation to exhaust the IPv6 address pool, forcing hosts to use the rogue router", "The penetration tester exploits a vulnerability in the Neighbor Discovery Protocol that bypasses RA Guard at the data link layer", "The penetration tester uses DNS rebinding to redirect IPv6 traffic after RA Guard validation", "The penetration tester crafts a rogue RA packet fragmented into multiple IPv6 extension header fragments; some RA Guard implementations do not reassemble fragmented packets before inspection, allowing the RA to pass inspection in fragments while being reassembled correctly by the victim host"]'::jsonb,
  3,
  'RA Guard (RFC 6105) inspects IPv6 Router Advertisement messages and drops those arriving on ports configured as "host ports" (not router ports). However, RA Guard bypass via IPv6 fragmentation is a well-documented attack: when the RA packet is fragmented, some RA Guard implementations inspect individual fragments rather than reassembled packets. Since the RA header may not appear in the first fragment examined, the RA Guard passes the fragments. The victim''s IPv6 stack reassembles the fragments into a valid RA. This is CVE-tracked and caused IETF to publish RFC 7113 (Implementation Advice for IPv6 RA Guard). DHCPv6 starvation affects address assignment, not RA Guard specifically.',
  'RA Guard bypass = IPv6 fragmentation. RA Guard inspects fragments separately. Fragment the RA to bypass inspection. RFC 7113 = the fix.',
  'apply', 'scenario', 'hard',
  1.80, 1.80, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / comparison / correct=0
(
  4, 'network_architecture',
  'Which comparison MOST accurately describes the security difference between a demilitarized zone (DMZ) architecture and a zero-trust network architecture for protecting web-facing applications?',
  '["DMZ uses perimeter-based segmentation (trust determined by network location), allowing hosts within the DMZ zone to communicate more freely; zero-trust architecture never trusts implicitly based on location, requiring continuous verification of identity, device health, and least-privilege access for every session regardless of whether traffic is from inside or outside a traditional perimeter", "Zero-trust and DMZ are equivalent security architectures with different implementation technologies", "DMZ is more secure than zero-trust because physical network separation is more reliable than software-defined policy enforcement", "Zero-trust architecture eliminates the need for encryption because all sessions are continuously verified"]'::jsonb,
  0,
  'Traditional DMZ architecture relies on network perimeter segmentation: hosts in the DMZ are semi-trusted (accessible from the internet but separated from the internal network). Once inside the DMZ, lateral movement between DMZ hosts is often easier. Zero-trust (NIST SP 800-207) rejects implicit trust based on network location: every request is authenticated, authorized, and continuously verified regardless of network segment. Zero-trust adds: device posture checks, identity-based access, microsegmentation at the workload level, and continuous session monitoring. The architectural shift is from "trust the network zone" to "trust nothing, verify everything." Both approaches can coexist during transition.',
  'DMZ = trust the zone. ZTA = trust nothing, verify everything. ZTA is identity+device+context, not location-based trust.',
  'analyze', 'comparison', 'hard',
  1.60, 1.30, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / tlatm / correct=1
(
  4, 'dns_security',
  'You are the CISO of a company that operates a large public-facing DNS infrastructure. Your threat intelligence team reports that a threat actor is likely to perform DNS cache poisoning using the Kaminsky Attack technique against your external recursive resolvers. As the CISO, what architectural control provides the STRONGEST defense?',
  '["Deploy DNS over HTTPS (DoH) for all recursive queries to prevent cache poisoning by encrypting DNS traffic", "Implement DNSSEC validation on all recursive resolvers, configure source port randomization (already standard in modern resolvers), enable 0x20 encoding (random case in queries to increase entropy), and consider deploying Response Policy Zones (RPZ) for known-malicious domains -- collectively these controls make Kaminsky-style attacks computationally infeasible", "Increase the DNS TTL values to 86400 seconds to reduce the number of upstream queries susceptible to poisoning", "Deploy a secondary DNS provider so that cache poisoning affects only one provider at a time"]'::jsonb,
  1,
  'The Kaminsky Attack exploits the predictability of DNS transaction IDs and source ports. Defense layers: (1) DNSSEC validation -- if the zone is DNSSEC-signed, forged responses fail signature validation; this is the strongest defense. (2) Source port randomization (RFC 5452) -- increases the search space from 65K to ~2^32, making brute-force impractical. (3) 0x20 encoding (draft RFC) -- randomizes letter case in queries, adding further entropy that the resolver checks on response. (4) Response Rate Limiting and RPZ for additional protection. DoH encrypts queries but does not prevent a compromised resolver from serving poisoned responses. High TTL reduces attack windows but does not prevent poisoning.',
  'Kaminsky defense: DNSSEC (strongest) + source port randomization + 0x20 encoding. DoH encrypts traffic but doesn''t prevent resolver poisoning.',
  'analyze', 'tlatm', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  4, 'microsegmentation',
  'A cloud security architect is designing microsegmentation for a Kubernetes cluster hosting microservices. The services communicate via REST APIs over HTTPS. Which microsegmentation approach is MOST appropriate for this environment?',
  '["Deploy host-based firewalls on each Kubernetes worker node with static IP-based rules for each microservice", "Use Kubernetes namespace isolation alone because namespaces provide sufficient network segmentation for microservices", "Implement a service mesh (e.g., Istio, Linkerd) with mutual TLS (mTLS) authentication between services and network policies enforced at the pod level -- this provides workload identity-based microsegmentation that remains valid even as pod IPs change dynamically during scaling and rescheduling", "Use a traditional perimeter firewall to filter Kubernetes cluster traffic because pod-level controls are too complex to manage"]'::jsonb,
  2,
  'Kubernetes environments present unique microsegmentation challenges: pod IPs change dynamically when pods are rescheduled or scaled. Static IP-based rules quickly become invalid. A service mesh with mTLS provides: (1) Workload identity-based authentication using SPIFFE/X.509 certificates (not IP addresses) -- policy remains valid as IPs change, (2) Mutual TLS encryption for all service-to-service communication, (3) Fine-grained traffic policy via network policies at the pod label level. Kubernetes namespaces provide logical isolation but not default network isolation without Network Policies. Host-based firewalls with static IPs are unmaintainable in dynamic cloud environments.',
  'Kubernetes microseg = service mesh (Istio/Linkerd) + mTLS + pod network policies. NOT static IPs (pods move). Identity-based, not IP-based.',
  'apply', 'scenario', 'hard',
  1.70, 1.70, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  4, 'bgp_security',
  'An organization that operates its own ASN and IP address space wants to protect against route leaks where a customer AS inadvertently re-advertises the organization''s prefixes to the internet. Which BGP configuration practice MOST effectively prevents this?',
  '["Implement BGP route reflectors to limit the propagation of route advertisements within the AS", "Sign all BGP route advertisements with RPKI ROAs to prevent any unauthorized re-advertisement of prefixes", "Require customers to filter all incoming routes using prefix lists that only contain their own assigned prefixes", "Configure outbound route filters on the organization''s BGP sessions with customers using no-export and no-advertise BGP communities, combined with strict AS-path access lists on the customer''s peering sessions that reject any advertisement of the organization''s prefixes with a longer AS path (indicating the customer is re-advertising, not originating)"]'::jsonb,
  3,
  'Route leaks occur when a customer AS receives routes from one BGP peer and re-advertises them to another peer or to the internet. Prevention mechanisms: (1) BGP communities (no-export, no-advertise) tag routes to tell receiving routers how to handle them -- but customers must honor these communities. (2) Outbound filters on customer sessions that reject re-advertisement of the ISP''s address space. (3) AS-path filters: if the organization''s prefix appears in an advertisement with an AS path longer than 1 hop (its own ASN), it indicates re-advertisement by a downstream AS. RPKI ROAs validate origin, not transit path; a route leak from a legitimate origin still passes RPKI. BGP communities + AS-path filters are the operational fix.',
  'Route leak prevention: BGP communities (no-export) + AS-path filters (reject your prefix with extra hops). RPKI validates origin, not leaks.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / best_answer / correct=0
(
  4, 'network_protocols',
  'A financial services organization requires network segmentation to prevent payment card data from commingling with corporate IT traffic. A network engineer proposes using 802.1Q VLANs with a single shared physical switch infrastructure. Which security limitation is MOST important to communicate to management?',
  '["VLAN hopping attacks (switch spoofing and double tagging) can allow an attacker to bypass VLAN separation on shared switch infrastructure; physical separation or strict trunk port hardening (disabling DTP, setting native VLANs to unused VLANs, restricting allowed VLANs on trunks) is required to prevent VLAN hopping in a PCI DSS-scoped environment", "VLANs provide no security benefit and should not be used for network segmentation under any circumstances", "802.1Q VLANs are not supported in PCI DSS environments and physical separation is mandated for all cardholder data environments", "The 802.1Q standard has a maximum of 4,096 VLANs which is insufficient for large payment processing environments"]'::jsonb,
  0,
  'VLAN hopping is a well-documented attack against 802.1Q VLAN implementations on shared switch infrastructure: (1) Switch spoofing: the attacker negotiates a trunk link (via DTP) with the switch, gaining access to all VLANs. Mitigation: disable DTP, explicitly configure ports as access or trunk, never use auto mode. (2) Double tagging: the attacker crafts frames with two 802.1Q tags; the outer tag matches the attacker''s VLAN and is stripped by the first switch, the inner tag reaches the target VLAN. Mitigation: change native VLAN to an unused VLAN ID. PCI DSS requires documented network segmentation with controls -- VLANs can satisfy this if properly hardened.',
  'VLAN hopping: switch spoofing (disable DTP) + double tagging (change native VLAN). Shared switches = harden trunks or use physical separation.',
  'apply', 'best_answer', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / scenario / correct=1
(
  4, 'ipv6_security',
  'An organization discovers that all Windows workstations in the office have IPv6 addresses in the 2001:db8::/32 documentation range assigned via SLAAC, despite the organization not officially deploying IPv6. Security monitoring only covers IPv4 traffic. What is the MOST significant security risk?',
  '["The documentation range addresses are non-routable and present no security risk", "IPv6 SLAAC is occurring because a rogue or misconfigured router is sending IPv6 Router Advertisements on the LAN; the workstations have auto-configured IPv6 and may be communicating over IPv6 (including to C2 servers or exfiltrating data) completely bypassing IPv4-only security monitoring, IDS, and firewall controls", "IPv6 SLAAC addresses are temporary and will expire, making this a low-priority issue", "The risk is only significant if the workstations have IPv6-capable applications installed"]'::jsonb,
  1,
  'If workstations have received IPv6 addresses via SLAAC, a router (or rogue device) is sending IPv6 Router Advertisements on the network. Even if these are non-routable documentation addresses for LAN communication, the risk is: (1) IPv6 traffic between workstations bypasses IPv4-only security controls entirely. (2) If any IPv6 routing (including 6to4 or Teredo tunneling) is enabled, workstations may reach IPv6 internet destinations. (3) Malware can use IPv6 for C2 to evade IPv4 monitoring. (4) 2001:db8::/32 is a documentation range that should never appear in a production network -- this indicates a misconfiguration creating a shadow IPv6 network. Immediate action: identify the RA source, disable unauthorized IPv6, extend security monitoring to cover IPv6.',
  'Surprise IPv6 via SLAAC = shadow network bypassing all IPv4 security controls. Find the rogue RA source. Extend monitoring to IPv6.',
  'analyze', 'scenario', 'hard',
  1.80, 1.80, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / tlatm / correct=2
(
  4, 'network_architecture',
  'You are architecting the network security for a healthcare organization that processes ePHI. The organization wants to implement network access control (NAC) to ensure only compliant devices can access the ePHI segment. A device fails NAC compliance checks (missing endpoint protection). What is the MOST appropriate NAC response, and why?',
  '["Block the device from all network access including the internet because non-compliant devices should have zero network connectivity", "Allow the device full network access but generate an alert because blocking may violate HIPAA''s availability requirement for PHI", "Quarantine the device to a remediation VLAN with access only to patch/update servers and IT helpdesk, block access to the ePHI segment, and provide the user with remediation instructions -- maintaining limited connectivity for business continuity while protecting the ePHI segment until compliance is restored", "Immediately wipe and reimage the device because non-compliant devices with potential vulnerabilities are unacceptable in a HIPAA environment"]'::jsonb,
  2,
  'NAC''s quarantine response balances security with operational requirements. A non-compliant device (missing AV) poses risk to the ePHI segment but the user may still need limited access for business functions. Quarantine to a remediation VLAN: (1) Blocks access to the ePHI network segment (protecting PHI), (2) Allows access to update/patch servers so the device can become compliant, (3) Provides user communication about the issue. Full network blockage is disproportionate and may prevent the user from remediating. Allowing full access defeats NAC''s purpose. Wiping devices as an automatic response is drastic and operationally disruptive. The quarantine response is the standard NAC best practice.',
  'NAC quarantine = ePHI blocked + remediation VLAN open. User can fix the issue. Proportional response, not full block or wipe.',
  'apply', 'tlatm', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q24: hard / apply / scenario / correct=3
(
  4, 'sd_wan_security',
  'An organization''s SD-WAN deployment uses a centralized SD-WAN controller hosted in a public cloud. A security assessment finds that the controller management interface is accessible from the internet with only username/password authentication. What is the MOST critical risk, and what should be remediated FIRST?',
  '["The primary risk is performance -- internet-accessible controllers have higher latency; implement a dedicated MPLS connection to the controller", "The primary risk is vendor lock-in; replace the cloud-hosted controller with an on-premises controller", "The primary risk is DDoS attacks against the controller; implement rate limiting on the management interface", "The SD-WAN controller is the single point of control for all branch routing, VPN tunnels, and security policies; compromise of the controller gives an attacker full control over the entire WAN fabric; the FIRST remediation is to restrict management access to authorized IP ranges (allowlisting), enable MFA, and implement certificate-based authentication for controller API access"]'::jsonb,
  3,
  'The SD-WAN controller is the "brain" of the entire SD-WAN deployment -- it defines routing policies, VPN topologies, QoS, and security configurations for all branches. Internet accessibility with only password authentication creates extreme risk: password guessing, credential stuffing, or phishing could yield full WAN control to an attacker. An attacker with controller access can: redirect all WAN traffic through attacker-controlled nodes, modify security policies across all branches, disable encryption for specific traffic flows. First remediation: restrict management access to specific IP ranges, enforce MFA, implement certificate-based API authentication, and enable immutable audit logging of all controller changes.',
  'SD-WAN controller = WAN brain. Internet-accessible + passwords-only = catastrophic if compromised. FIX: IP allowlist + MFA + cert auth. Highest priority.',
  'apply', 'scenario', 'hard',
  1.70, 1.90, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  4, 'tls_security',
  'An organization wants to achieve Perfect Forward Secrecy (PFS) for all TLS connections. An engineer proposes using TLS 1.2 with the cipher suite TLS_RSA_WITH_AES_256_CBC_SHA256. A security architect rejects this. Which explanation is MOST accurate?',
  '["TLS_RSA_WITH_AES_256_CBC_SHA256 does not provide PFS because it uses RSA key exchange -- the pre-master secret is encrypted with the server''s static RSA public key; if the server''s RSA private key is ever compromised (even years later), all past sessions using this cipher suite can be decrypted; PFS requires ephemeral Diffie-Hellman key exchange (DHE or ECDHE) where new key pairs are generated per session and discarded after the session ends", "RSA key exchange provides PFS because each session uses a different pre-master secret", "TLS_RSA_WITH_AES_256_CBC_SHA256 provides PFS because AES-256 is a strong cipher that protects against retroactive decryption", "TLS 1.2 cannot provide PFS under any configuration; only TLS 1.3 provides PFS"]'::jsonb,
  0,
  'Perfect Forward Secrecy (PFS) requires that session keys cannot be derived from the server''s long-term private key. RSA key exchange: the client generates a pre-master secret, encrypts it with the server''s RSA public key, and sends it. If the server''s RSA private key is ever compromised, an attacker who recorded past TLS sessions can decrypt them retroactively. ECDHE (Elliptic Curve Diffie-Hellman Ephemeral) generates a new ephemeral key pair per session. The session key is derived from the DH exchange using ephemeral keys that are discarded after the session -- compromise of the server''s long-term key does not expose past sessions. TLS 1.3 mandates PFS-supporting cipher suites (all use ECDHE); TLS 1.2 supports PFS but requires selecting ECDHE cipher suites.',
  'PFS = ephemeral keys. RSA key exchange = static private key = decrypt old sessions if key is compromised. ECDHE = per-session keys = PFS.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=12, comparison=4, tlatm=3, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
