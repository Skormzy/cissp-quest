'use client';

import { useRef, useEffect, useState, useCallback, useMemo } from 'react';
import { Search, X, BookOpen, ExternalLink } from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

export interface ConstellationNode {
  id: string;
  label: string;
  domain: number;
  weight: number; // 1-5, affects node radius
  description: string;
  librarySlug?: string;
  connections: string[];
}

interface SimNode extends ConstellationNode {
  x: number;
  y: number;
  vx: number;
  vy: number;
  locked?: boolean;
}

interface SimEdge {
  source: SimNode;
  target: SimNode;
}

// ─── Domain config ─────────────────────────────────────────────────────────

const DOMAIN_COLORS: Record<number, string> = {
  1: '#ef4444', // Security & Risk Management — red
  2: '#f97316', // Asset Security — orange
  3: '#eab308', // Security Architecture & Engineering — yellow
  4: '#22c55e', // Communication & Network Security — green
  5: '#06b6d4', // Identity & Access Management — cyan
  6: '#8b5cf6', // Security Assessment & Testing — purple
  7: '#ec4899', // Security Operations — pink
  8: '#64748b', // Software Development Security — slate
};

const DOMAIN_NAMES: Record<number, string> = {
  1: 'Security & Risk Mgmt',
  2: 'Asset Security',
  3: 'Security Architecture',
  4: 'Communication & Network',
  5: 'Identity & Access Mgmt',
  6: 'Security Assessment',
  7: 'Security Operations',
  8: 'Software Dev Security',
};

// ─── Constellation data (80+ nodes) ───────────────────────────────────────

export const CONSTELLATION_NODES: ConstellationNode[] = [
  // Domain 1 – Security & Risk Management (15%)
  { id: 'cia-triad', label: 'CIA Triad', domain: 1, weight: 5, description: 'Confidentiality, Integrity, Availability — the three pillars every security decision must protect. Think of it as the three-legged stool of security.', librarySlug: 'cia-triad', connections: ['risk-management', 'governance', 'data-classification', 'bcdr', 'security-policies'] },
  { id: 'risk-management', label: 'Risk Management', domain: 1, weight: 5, description: 'The process of identifying, assessing, and mitigating threats. Core lifecycle: identify assets → assess threats → calculate risk → choose treatment.', librarySlug: 'risk-management', connections: ['cia-triad', 'threat-modeling', 'ale-sle-aro', 'risk-treatment', 'bcp'] },
  { id: 'governance', label: 'Security Governance', domain: 1, weight: 4, description: 'Policies, standards, baselines, guidelines, and procedures that form the governance hierarchy. Governance answers "what must we do and why."', librarySlug: 'governance', connections: ['cia-triad', 'security-policies', 'compliance', 'due-care'] },
  { id: 'ale-sle-aro', label: 'ALE / SLE / ARO', domain: 1, weight: 4, description: 'Quantitative risk formulas: SLE = AV × EF; ALE = SLE × ARO. Annualized Loss Expectancy lets you compare countermeasure costs to expected losses.', librarySlug: 'quantitative-risk', connections: ['risk-management', 'asset-valuation', 'countermeasure-selection'] },
  { id: 'threat-modeling', label: 'Threat Modeling', domain: 1, weight: 4, description: 'STRIDE, DREAD, PASTA — structured ways to enumerate what can go wrong. Used in both risk management and software development security.', librarySlug: 'threat-modeling', connections: ['risk-management', 'sdlc', 'vulnerability-assessment'] },
  { id: 'security-policies', label: 'Security Policies', domain: 1, weight: 4, description: 'Mandatory directives from management. Policy → Standard → Baseline → Guideline → Procedure. Policies are "what," procedures are "how."', librarySlug: 'security-policies', connections: ['governance', 'compliance', 'due-care', 'acceptable-use'] },
  { id: 'due-care', label: 'Due Care / Due Diligence', domain: 1, weight: 3, description: 'Due care = doing the right thing (practice). Due diligence = continuous verification. The prudent person rule tests whether reasonable effort was made.', librarySlug: 'due-care', connections: ['governance', 'security-policies', 'compliance'] },
  { id: 'compliance', label: 'Compliance & Regulations', domain: 1, weight: 4, description: 'GDPR, HIPAA, PCI-DSS, SOX, GLBA — external mandates that shape minimum security requirements. Non-compliance carries fines and reputational damage.', librarySlug: 'compliance', connections: ['governance', 'security-policies', 'privacy', 'audit'] },
  { id: 'risk-treatment', label: 'Risk Treatment', domain: 1, weight: 4, description: 'Four options: Avoid (eliminate the activity), Mitigate (reduce likelihood/impact), Transfer (insurance, outsource), Accept (acknowledge residual risk).', librarySlug: 'risk-treatment', connections: ['risk-management', 'countermeasure-selection', 'bcp'] },
  { id: 'privacy', label: 'Privacy', domain: 1, weight: 3, description: 'The right to control personal information. Key principles: data minimization, purpose limitation, consent, right to erasure. Enforced via GDPR/CCPA.', librarySlug: 'privacy', connections: ['compliance', 'data-classification', 'pii'] },
  { id: 'ethics', label: 'Professional Ethics', domain: 1, weight: 2, description: '(ISC)² Code of Ethics: protect society, act honorably, provide competent service, advance the profession. Ethics guide decisions when rules are ambiguous.', connections: ['governance', 'due-care'] },
  { id: 'bcdr', label: 'BCP/DRP', domain: 1, weight: 4, description: 'Business Continuity Plan covers people, process, and technology for long-term disruptions. DRP is the technical subset focused on IT recovery.', librarySlug: 'bcdr', connections: ['cia-triad', 'bcp', 'rto-rpo', 'backup-recovery'] },
  { id: 'bcp', label: 'BCP Process', domain: 1, weight: 3, description: 'Steps: Project initiation → BIA → Strategy development → Plan approval → Training → Testing. BIA is the most critical step — identifies critical functions.', librarySlug: 'bcp', connections: ['bcdr', 'risk-management', 'bia', 'risk-treatment'] },
  { id: 'bia', label: 'Business Impact Analysis', domain: 1, weight: 3, description: 'BIA identifies critical business functions, calculates MTD, RTO, RPO, and financial impact of outages. The BIA drives all recovery decisions.', librarySlug: 'bia', connections: ['bcp', 'rto-rpo', 'bcdr'] },
  { id: 'rto-rpo', label: 'RTO / RPO / MTD', domain: 1, weight: 3, description: 'RTO = how fast to restore; RPO = how much data loss is acceptable; MTD = maximum tolerable downtime before business failure. RPO ≤ RTO ≤ MTD.', librarySlug: 'rto-rpo', connections: ['bia', 'backup-recovery', 'bcdr'] },

  // Domain 2 – Asset Security (10%)
  { id: 'data-classification', label: 'Data Classification', domain: 2, weight: 5, description: 'Organizing data by sensitivity: Top Secret → Secret → Confidential → Unclassified (govt). Commercial: Confidential, Private, Sensitive, Public.', librarySlug: 'data-classification', connections: ['cia-triad', 'asset-valuation', 'data-handling', 'pii', 'dlp'] },
  { id: 'asset-valuation', label: 'Asset Valuation', domain: 2, weight: 4, description: 'Tangible assets (hardware, data) plus intangible (reputation, IP). Asset value drives ALE calculations and determines how much to spend on protection.', librarySlug: 'asset-valuation', connections: ['ale-sle-aro', 'data-classification', 'risk-management'] },
  { id: 'data-handling', label: 'Data Handling & Retention', domain: 2, weight: 4, description: 'Policies covering creation, storage, use, archiving, and destruction. Secure destruction: overwriting, degaussing, shredding, destruction certificates.', librarySlug: 'data-handling', connections: ['data-classification', 'pii', 'media-management'] },
  { id: 'pii', label: 'PII & Sensitive Data', domain: 2, weight: 4, description: 'Personally Identifiable Information. PHI (health), PCI (payment cards), PII. Each has separate regulatory requirements and breach notification rules.', librarySlug: 'pii', connections: ['privacy', 'data-classification', 'compliance', 'dlp'] },
  { id: 'media-management', label: 'Media Management', domain: 2, weight: 3, description: 'Lifecycle: marking, handling, storage, transport, sanitization, destruction. NIST 800-88 defines Clear, Purge, and Destroy methods.', librarySlug: 'media-management', connections: ['data-handling', 'data-classification'] },
  { id: 'dlp', label: 'Data Loss Prevention', domain: 2, weight: 4, description: 'DLP monitors, detects, and prevents unauthorized data exfiltration. Network DLP watches traffic; endpoint DLP watches device activity; cloud DLP covers SaaS.', librarySlug: 'dlp', connections: ['data-classification', 'pii', 'monitoring'] },
  { id: 'acceptable-use', label: 'Acceptable Use Policy', domain: 2, weight: 2, description: 'Governs how users may interact with organizational assets. Covers personal use, BYOD, removable media, and internet access.', connections: ['security-policies', 'data-handling'] },

  // Domain 3 – Security Architecture & Engineering (13%)
  { id: 'security-models', label: 'Security Models', domain: 3, weight: 5, description: 'Bell-LaPadula (confidentiality: no read up, no write down). Biba (integrity: no read down, no write up). Clark-Wilson (transactions). Brewer-Nash (Chinese Wall).', librarySlug: 'security-models', connections: ['access-control-models', 'mac', 'multilevel-security', 'trusted-systems'] },
  { id: 'cryptography', label: 'Cryptography', domain: 3, weight: 5, description: 'Science of secret writing. Symmetric (AES, 3DES) = same key. Asymmetric (RSA, ECC) = key pair. Hash (SHA-256) = one-way fingerprint.', librarySlug: 'cryptography', connections: ['pki', 'symmetric-crypto', 'asymmetric-crypto', 'hash-functions', 'digital-signatures'] },
  { id: 'symmetric-crypto', label: 'Symmetric Encryption', domain: 3, weight: 4, description: 'AES (128/192/256-bit blocks), 3DES (deprecated), Blowfish, RC4. Fast for bulk data. Key distribution is the challenge — solved by asymmetric key exchange.', librarySlug: 'symmetric-crypto', connections: ['cryptography', 'asymmetric-crypto', 'key-management'] },
  { id: 'asymmetric-crypto', label: 'Asymmetric Encryption', domain: 3, weight: 4, description: 'RSA, ECC, Diffie-Hellman. Public key encrypts; private key decrypts. Enables key exchange, digital signatures, and certificate-based authentication.', librarySlug: 'asymmetric-crypto', connections: ['cryptography', 'pki', 'digital-signatures', 'key-management'] },
  { id: 'hash-functions', label: 'Hash Functions', domain: 3, weight: 4, description: 'MD5 (broken), SHA-1 (deprecated), SHA-256/SHA-3 (current). Properties: deterministic, one-way, avalanche effect, collision-resistant.', librarySlug: 'hash-functions', connections: ['cryptography', 'digital-signatures', 'integrity-checking'] },
  { id: 'pki', label: 'PKI', domain: 3, weight: 5, description: 'Public Key Infrastructure: CA hierarchy, certificates (X.509), CRL, OCSP, trust anchors. Enables TLS/HTTPS and email signing at internet scale.', librarySlug: 'pki', connections: ['asymmetric-crypto', 'digital-certificates', 'tls-ssl', 'key-management'] },
  { id: 'digital-signatures', label: 'Digital Signatures', domain: 3, weight: 4, description: 'Hash the message, encrypt hash with sender\'s private key. Provides authentication, integrity, and non-repudiation — but NOT confidentiality.', librarySlug: 'digital-signatures', connections: ['asymmetric-crypto', 'hash-functions', 'pki', 'non-repudiation'] },
  { id: 'key-management', label: 'Key Management', domain: 3, weight: 4, description: 'Key generation, distribution, storage (HSM), rotation, revocation, and destruction. The weakest link in most crypto implementations.', librarySlug: 'key-management', connections: ['symmetric-crypto', 'asymmetric-crypto', 'pki'] },
  { id: 'security-architecture', label: 'Security Architecture', domain: 3, weight: 4, description: 'SABSA, TOGAF, Zachman. Defense in depth: multiple security layers so any single failure doesn\'t compromise the system. Trust but verify → zero trust.', librarySlug: 'security-architecture', connections: ['trusted-systems', 'defense-in-depth', 'zero-trust', 'security-models'] },
  { id: 'defense-in-depth', label: 'Defense in Depth', domain: 3, weight: 4, description: 'Layered security: physical → network → host → application → data. The castle analogy — moat, walls, guards, and vault all working together.', librarySlug: 'defense-in-depth', connections: ['security-architecture', 'firewalls', 'ids-ips', 'endpoint-security'] },
  { id: 'trusted-systems', label: 'Trusted Computing Base', domain: 3, weight: 3, description: 'TCB = all protection mechanisms: hardware, firmware, and software. Reference monitor enforces access decisions. Security kernel implements the reference monitor.', librarySlug: 'trusted-systems', connections: ['security-models', 'security-architecture', 'mac'] },
  { id: 'virtualization', label: 'Virtualization Security', domain: 3, weight: 3, description: 'Hypervisor (Type 1/Type 2) attack surface, VM escape, VM sprawl. Snapshots can persist vulnerable states. Containers share host kernel.', librarySlug: 'virtualization', connections: ['cloud-security', 'defense-in-depth', 'endpoint-security'] },
  { id: 'steganography', label: 'Steganography', domain: 3, weight: 2, description: 'Hiding data in plain sight within images, audio, or video files. Different from cryptography — conceals the existence of the message, not just the content.', connections: ['cryptography', 'dlp'] },

  // Domain 4 – Communication & Network Security (13%)
  { id: 'osi-model', label: 'OSI Model', domain: 4, weight: 5, description: '7 layers: Physical → Data Link → Network → Transport → Session → Presentation → Application. Controls exist at every layer; threats target each.', librarySlug: 'osi-model', connections: ['tcp-ip', 'firewalls', 'network-protocols', 'ids-ips'] },
  { id: 'tcp-ip', label: 'TCP/IP Protocols', domain: 4, weight: 5, description: 'The internet\'s protocol suite. TCP (reliable, three-way handshake), UDP (fast, unreliable), IP (routing). Common attacks: SYN flood, IP spoofing, ICMP tunneling.', librarySlug: 'tcp-ip', connections: ['osi-model', 'firewalls', 'network-protocols', 'vpn'] },
  { id: 'firewalls', label: 'Firewalls', domain: 4, weight: 5, description: 'Packet filter → Stateful inspection → Application-layer (proxy) → NGFW. Each generation adds more context. WAF specifically protects web apps.', librarySlug: 'firewalls', connections: ['osi-model', 'ids-ips', 'defense-in-depth', 'network-segmentation'] },
  { id: 'ids-ips', label: 'IDS / IPS', domain: 4, weight: 4, description: 'IDS detects (alerts); IPS prevents (blocks inline). Signature-based vs anomaly-based detection. False positives waste time; false negatives miss real threats.', librarySlug: 'ids-ips', connections: ['firewalls', 'monitoring', 'incident-response', 'siem'] },
  { id: 'vpn', label: 'VPN', domain: 4, weight: 4, description: 'IPsec (tunnel/transport modes), SSL/TLS VPNs, split tunneling risks. IPsec AH = integrity; ESP = confidentiality + integrity. IKE handles key exchange.', librarySlug: 'vpn', connections: ['tcp-ip', 'tls-ssl', 'remote-access', 'cryptography'] },
  { id: 'network-protocols', label: 'Network Protocols', domain: 4, weight: 4, description: 'DNS (can be poisoned), DHCP (rogue servers), ARP (spoofing), BGP (hijacking). Each protocol has known attack vectors tested on the CISSP exam.', librarySlug: 'network-protocols', connections: ['tcp-ip', 'osi-model', 'network-attacks'] },
  { id: 'network-segmentation', label: 'Network Segmentation', domain: 4, weight: 4, description: 'VLANs, DMZ, microsegmentation, air gaps. Limits blast radius of breaches. DMZ hosts public-facing services while keeping internal network isolated.', librarySlug: 'network-segmentation', connections: ['firewalls', 'defense-in-depth', 'zero-trust', 'cloud-security'] },
  { id: 'wireless-security', label: 'Wireless Security', domain: 4, weight: 4, description: 'WEP (broken), WPA2 (AES/CCMP, acceptable), WPA3 (current best). Evil twin, rogue AP, KRACK attacks. 802.1X for enterprise authentication.', librarySlug: 'wireless-security', connections: ['network-protocols', 'authentication', 'cryptography'] },
  { id: 'tls-ssl', label: 'TLS / SSL', domain: 4, weight: 4, description: 'TLS 1.3 is current. SSL and TLS 1.0/1.1 are deprecated. Provides confidentiality, integrity, and server authentication. Certificate pinning prevents MITM.', librarySlug: 'tls-ssl', connections: ['pki', 'vpn', 'cryptography', 'digital-certificates'] },
  { id: 'network-attacks', label: 'Network Attacks', domain: 4, weight: 4, description: 'DoS/DDoS, MITM, replay, session hijacking, ARP poisoning, DNS spoofing. Understanding attack mechanics helps design effective countermeasures.', librarySlug: 'network-attacks', connections: ['network-protocols', 'ids-ips', 'vulnerability-assessment'] },
  { id: 'zero-trust', label: 'Zero Trust', domain: 4, weight: 4, description: 'Never trust, always verify. Assumes breach. Microsegmentation, continuous verification, least privilege access. NIST SP 800-207 defines the architecture.', librarySlug: 'zero-trust', connections: ['network-segmentation', 'identity-management', 'mfa', 'security-architecture'] },
  { id: 'remote-access', label: 'Remote Access', domain: 4, weight: 3, description: 'VPN, ZTNA, RDP (secure with MFA), SSH (key-based preferred). Telnet, FTP, and unencrypted protocols must be replaced with secure equivalents.', connections: ['vpn', 'authentication', 'mfa'] },

  // Domain 5 – Identity & Access Management (13%)
  { id: 'identity-management', label: 'Identity Management', domain: 5, weight: 5, description: 'IdM covers provisioning, maintenance, and de-provisioning of identities. Joiner/mover/leaver lifecycle. Orphaned accounts are a common audit finding.', librarySlug: 'identity-management', connections: ['access-control-models', 'authentication', 'provisioning', 'sso'] },
  { id: 'authentication', label: 'Authentication', domain: 5, weight: 5, description: 'Three factors: Something you know (password), something you have (token), something you are (biometric). MFA requires two or more different factors.', librarySlug: 'authentication', connections: ['mfa', 'identity-management', 'biometrics', 'sso', 'kerberos'] },
  { id: 'access-control-models', label: 'Access Control Models', domain: 5, weight: 5, description: 'DAC (owner decides), MAC (label-based), RBAC (role-based), ABAC (attribute-based), Rule-BAC. RBAC is most common in enterprise. MAC in government/military.', librarySlug: 'access-control-models', connections: ['identity-management', 'mac', 'security-models', 'least-privilege'] },
  { id: 'mfa', label: 'Multi-Factor Authentication', domain: 5, weight: 4, description: 'Combines multiple factors. OTP (TOTP, HOTP), FIDO2/WebAuthn, smart cards, biometrics. SMS OTP is weak (SIM swapping). Hardware keys are strongest.', librarySlug: 'mfa', connections: ['authentication', 'identity-management', 'zero-trust'] },
  { id: 'sso', label: 'Single Sign-On', domain: 5, weight: 4, description: 'SAML 2.0 (XML, enterprise federation), OAuth 2.0 (authorization), OpenID Connect (authentication on top of OAuth). Kerberos for domain-joined systems.', librarySlug: 'sso', connections: ['identity-management', 'kerberos', 'federation', 'authentication'] },
  { id: 'kerberos', label: 'Kerberos', domain: 5, weight: 4, description: 'Ticket-based authentication. AS → TGT → TGS → service ticket. Vulnerabilities: Pass-the-Hash, Pass-the-Ticket, Golden Ticket, Kerberoasting.', librarySlug: 'kerberos', connections: ['sso', 'authentication', 'active-directory'] },
  { id: 'least-privilege', label: 'Least Privilege', domain: 5, weight: 5, description: 'Grant only the minimum permissions needed to perform a job function. Need-to-know goes further — access only to what you need right now. Reviewed periodically.', librarySlug: 'least-privilege', connections: ['access-control-models', 'privileged-access', 'identity-management', 'separation-of-duties'] },
  { id: 'privileged-access', label: 'Privileged Access Management', domain: 5, weight: 4, description: 'PAM/PIM: just-in-time access, session recording, password vaulting. Admin accounts are the highest-value target. Never use admin accounts for daily work.', librarySlug: 'privileged-access', connections: ['least-privilege', 'monitoring', 'identity-management'] },
  { id: 'biometrics', label: 'Biometrics', domain: 5, weight: 3, description: 'FAR (false accept) vs FRR (false reject). CER = crossover error rate — the lower it is, the better. Type 1 error = false reject (FRR). Type 2 error = false accept (FAR).', librarySlug: 'biometrics', connections: ['authentication', 'mfa'] },
  { id: 'federation', label: 'Identity Federation', domain: 5, weight: 3, description: 'Trusting another domain\'s identity assertions. SAML for B2B, OIDC for B2C. Trust relationships must be carefully managed to prevent federation abuse.', connections: ['sso', 'identity-management', 'cloud-security'] },
  { id: 'mac', label: 'Mandatory Access Control', domain: 5, weight: 3, description: 'System-enforced labels (Top Secret, Secret, Confidential). Users cannot change permissions. Used in government systems. Bell-LaPadula enforces MAC for confidentiality.', connections: ['access-control-models', 'security-models', 'data-classification'] },
  { id: 'separation-of-duties', label: 'Separation of Duties', domain: 5, weight: 4, description: 'No single person controls an entire sensitive process end-to-end. Two-person integrity for critical operations. Prevents fraud and limits insider threat impact.', librarySlug: 'separation-of-duties', connections: ['least-privilege', 'privileged-access', 'audit'] },

  // Domain 6 – Security Assessment & Testing (12%)
  { id: 'vulnerability-assessment', label: 'Vulnerability Assessment', domain: 6, weight: 5, description: 'Identifies and quantifies vulnerabilities. CVE/CVSS scoring. Automated scanners (Nessus, OpenVAS). Different from pen testing — finds weaknesses but doesn\'t exploit them.', librarySlug: 'vulnerability-assessment', connections: ['penetration-testing', 'patch-management', 'audit', 'sast-dast'] },
  { id: 'penetration-testing', label: 'Penetration Testing', domain: 6, weight: 5, description: 'Black box (no knowledge), white box (full knowledge), grey box (partial). Phases: recon → scan → exploit → post-exploit → report. Must have written authorization!', librarySlug: 'penetration-testing', connections: ['vulnerability-assessment', 'threat-modeling', 'red-team'] },
  { id: 'audit', label: 'Security Audits', domain: 6, weight: 4, description: 'Internal (self-assessment) vs external (third-party) vs regulatory. SOC 1/2/3 reports. ISO 27001 certification. Log reviews, access reviews, configuration audits.', librarySlug: 'audit', connections: ['compliance', 'monitoring', 'vulnerability-assessment', 'log-management'] },
  { id: 'sast-dast', label: 'SAST / DAST', domain: 6, weight: 4, description: 'SAST (static) analyzes source code without running it. DAST (dynamic) tests running applications. IAST combines both. Catch bugs early in SDLC when cheapest to fix.', librarySlug: 'sast-dast', connections: ['vulnerability-assessment', 'sdlc', 'code-review'] },
  { id: 'red-team', label: 'Red / Blue / Purple Teams', domain: 6, weight: 4, description: 'Red team attacks; blue team defends; purple team shares intel. Tabletop exercises are discussion-based. War games test specific scenarios without production impact.', librarySlug: 'red-team', connections: ['penetration-testing', 'incident-response', 'monitoring'] },
  { id: 'log-management', label: 'Log Management', domain: 6, weight: 4, description: 'Logs must be: protected from tampering, timestamped (NTP sync critical), retained per policy, and reviewed. SIEM aggregates and correlates logs at scale.', librarySlug: 'log-management', connections: ['siem', 'monitoring', 'audit', 'incident-response'] },
  { id: 'siem', label: 'SIEM', domain: 6, weight: 4, description: 'Security Information and Event Management. Aggregates logs, correlates events, generates alerts. SOAR adds orchestration and automation to SIEM responses.', librarySlug: 'siem', connections: ['log-management', 'monitoring', 'ids-ips', 'incident-response'] },
  { id: 'code-review', label: 'Code Review', domain: 6, weight: 3, description: 'Manual code review (peer review, fagan inspection) and automated review (SAST tools). Finding: 60% of vulnerabilities are logic errors no scanner catches alone.', connections: ['sast-dast', 'sdlc', 'vulnerability-assessment'] },

  // Domain 7 – Security Operations (13%)
  { id: 'incident-response', label: 'Incident Response', domain: 7, weight: 5, description: 'PICERL: Preparation → Identification → Containment → Eradication → Recovery → Lessons Learned. NIST 800-61 is the canonical reference. Order matters on the exam.', librarySlug: 'incident-response', connections: ['forensics', 'siem', 'red-team', 'bcdr', 'evidence-handling'] },
  { id: 'forensics', label: 'Digital Forensics', domain: 7, weight: 5, description: 'Preserve evidence first (forensic image, hash to prove integrity). Order of volatility: registers → cache → RAM → swap → disk → logs → archives. Chain of custody is mandatory.', librarySlug: 'forensics', connections: ['incident-response', 'evidence-handling', 'log-management'] },
  { id: 'evidence-handling', label: 'Evidence Handling', domain: 7, weight: 4, description: 'Chain of custody documents who had evidence, when, and for how long. Best evidence rule: original preferred over copies. Admissibility requires proper collection.', connections: ['forensics', 'incident-response', 'audit'] },
  { id: 'monitoring', label: 'Continuous Monitoring', domain: 7, weight: 4, description: 'ISCM (Information Security Continuous Monitoring). Ongoing awareness of vulnerabilities, threats, and mission risk. Feeds into the C&A/A&A authorization process.', librarySlug: 'monitoring', connections: ['siem', 'ids-ips', 'log-management', 'vulnerability-assessment'] },
  { id: 'patch-management', label: 'Patch Management', domain: 7, weight: 4, description: 'Timely patching is the #1 way to reduce attack surface. Process: discover → assess → test → deploy → verify. Critical patches: 24-72 hrs. Normal: 30 days.', librarySlug: 'patch-management', connections: ['vulnerability-assessment', 'configuration-management', 'change-management'] },
  { id: 'configuration-management', label: 'Configuration Management', domain: 7, weight: 4, description: 'Baselines, hardening (CIS Benchmarks), secure defaults, change tracking. CMDB tracks all assets. Unauthorized config changes are a leading cause of incidents.', librarySlug: 'configuration-management', connections: ['patch-management', 'change-management', 'audit'] },
  { id: 'change-management', label: 'Change Management', domain: 7, weight: 4, description: 'CAB (Change Advisory Board), RFC, rollback plan, testing in lower environments. Emergency changes bypass CAB but require post-hoc review. All changes logged.', connections: ['configuration-management', 'patch-management', 'incident-response'] },
  { id: 'backup-recovery', label: 'Backup & Recovery', domain: 7, weight: 4, description: '3-2-1 rule: 3 copies, 2 media types, 1 offsite. Full vs incremental vs differential. Hot/warm/cold sites for DR. Test restores regularly — untested backups are not backups.', librarySlug: 'backup-recovery', connections: ['bcdr', 'rto-rpo', 'configuration-management'] },
  { id: 'endpoint-security', label: 'Endpoint Security', domain: 7, weight: 4, description: 'AV/EDR, host-based IPS, disk encryption (BitLocker, FileVault), application whitelisting. EDR provides telemetry for forensic investigation post-breach.', librarySlug: 'endpoint-security', connections: ['patch-management', 'monitoring', 'virtualization', 'dlp'] },
  { id: 'physical-security', label: 'Physical Security', domain: 7, weight: 4, description: 'Perimeter (fences, guards, CCTV) → building (card access, mantrap) → server room (biometrics, locked racks) → device (cable locks). Often overlooked but highly testable.', librarySlug: 'physical-security', connections: ['defense-in-depth', 'endpoint-security', 'monitoring'] },
  { id: 'personnel-security', label: 'Personnel Security', domain: 7, weight: 3, description: 'Background checks, least privilege, separation of duties, mandatory vacation (forces job rotation, reveals fraud), NDA, termination procedures.', librarySlug: 'personnel-security', connections: ['separation-of-duties', 'least-privilege', 'insider-threat'] },
  { id: 'insider-threat', label: 'Insider Threat', domain: 7, weight: 3, description: 'Malicious vs negligent. User behavior analytics (UBA) for detection. Privilege creep, data exfiltration patterns, unusual hours. Most damaging attacks are from insiders.', connections: ['personnel-security', 'monitoring', 'dlp', 'privileged-access'] },

  // Domain 8 – Software Development Security (11%)
  { id: 'sdlc', label: 'SDLC', domain: 8, weight: 5, description: 'Waterfall, Agile, DevSecOps. Security must be integrated at every phase — shift left means finding vulnerabilities earlier when they\'re 10-100x cheaper to fix.', librarySlug: 'sdlc', connections: ['threat-modeling', 'sast-dast', 'code-review', 'secure-coding'] },
  { id: 'secure-coding', label: 'Secure Coding', domain: 8, weight: 5, description: 'OWASP Top 10 guides secure coding. Input validation, output encoding, parameterized queries (SQL injection prevention), error handling, secrets management.', librarySlug: 'secure-coding', connections: ['sdlc', 'owasp-top10', 'sast-dast', 'code-review'] },
  { id: 'owasp-top10', label: 'OWASP Top 10', domain: 8, weight: 5, description: 'Top vulnerabilities: Injection, Broken Auth, XSS, Insecure Deserialization, IDOR, Security Misconfiguration, Vulnerable Components, XXE, SSRF, Crypto Failures.', librarySlug: 'owasp-top10', connections: ['secure-coding', 'web-security', 'vulnerability-assessment'] },
  { id: 'web-security', label: 'Web Application Security', domain: 8, weight: 4, description: 'XSS (stored/reflected/DOM), CSRF, SQL injection, command injection, path traversal, XXE, SSRF. WAF is a compensating control, not a replacement for secure code.', librarySlug: 'web-security', connections: ['owasp-top10', 'secure-coding', 'firewalls', 'api-security'] },
  { id: 'api-security', label: 'API Security', domain: 8, weight: 4, description: 'OWASP API Top 10: Broken Object Level Authorization, excessive data exposure, lack of rate limiting, improper inventory. OAuth 2.0 / JWT for API authentication.', librarySlug: 'api-security', connections: ['web-security', 'secure-coding', 'sso'] },
  { id: 'devsecops', label: 'DevSecOps', domain: 8, weight: 4, description: 'Security integrated into CI/CD pipeline. SAST in IDE and CI, DAST in staging, SCA for dependency vulnerabilities, container scanning, IaC scanning.', librarySlug: 'devsecops', connections: ['sdlc', 'sast-dast', 'cloud-security', 'configuration-management'] },
  { id: 'software-supply-chain', label: 'Software Supply Chain', domain: 8, weight: 4, description: 'SolarWinds, Log4j — supply chain attacks compromise trusted software. SBOM (Software Bill of Materials), SCA tools, signed commits and artifacts.', connections: ['sdlc', 'devsecops', 'patch-management', 'risk-management'] },
  { id: 'cloud-security', label: 'Cloud Security', domain: 8, weight: 4, description: 'Shared responsibility model: CSP secures "of the cloud"; customer secures "in the cloud." CASB, CSPM, CWPP for cloud-native security. IaaS/PaaS/SaaS have different scopes.', librarySlug: 'cloud-security', connections: ['virtualization', 'network-segmentation', 'zero-trust', 'devsecops'] },
  { id: 'non-repudiation', label: 'Non-Repudiation', domain: 8, weight: 3, description: 'Proof that an action occurred and cannot be denied. Digital signatures, audit logs, timestamps, and legal agreements all contribute. Essential for digital contracts.', connections: ['digital-signatures', 'audit', 'cryptography'] },
  { id: 'active-directory', label: 'Active Directory', domain: 5, weight: 3, description: 'Microsoft\'s LDAP/Kerberos-based directory. Domain controllers, OUs, GPOs, forests and trusts. Common attack path: escalate to Domain Admin via Kerberoasting or LLMNR poisoning.', connections: ['kerberos', 'identity-management', 'privileged-access', 'provisioning'] },
  { id: 'provisioning', label: 'Identity Provisioning', domain: 5, weight: 3, description: 'Automated workflows for creating, modifying, and removing accounts. SCIM protocol for cross-platform provisioning. Timely deprovisioning prevents ghost accounts.', connections: ['identity-management', 'active-directory', 'least-privilege'] },
  { id: 'digital-certificates', label: 'Digital Certificates', domain: 3, weight: 3, description: 'X.509 format binds public key to identity. Issued by CA, signed by CA private key. Contains: subject, issuer, validity, public key, extensions, signature.', connections: ['pki', 'tls-ssl', 'asymmetric-crypto'] },
  { id: 'multilevel-security', label: 'Multilevel Security', domain: 3, weight: 3, description: 'Systems processing data at multiple classification levels simultaneously. Mandatory requirements: tranquility, trusted subjects, and the reference monitor concept.', connections: ['security-models', 'mac', 'trusted-systems'] },
  { id: 'countermeasure-selection', label: 'Countermeasure Selection', domain: 1, weight: 3, description: 'Safeguard value = ALE before – ALE after – annual cost of safeguard. Select controls where cost < risk reduction. Must also consider non-quantifiable factors.', connections: ['ale-sle-aro', 'risk-treatment', 'defense-in-depth'] },
  { id: 'integrity-checking', label: 'Integrity Checking', domain: 3, weight: 3, description: 'File integrity monitoring (FIM) detects unauthorized changes. Tripwire, AIDE. Hashing binaries and configs at baseline then comparing periodically.', connections: ['hash-functions', 'monitoring', 'configuration-management'] },
];

// ─── Force simulation engine ───────────────────────────────────────────────

const REPULSION   = 8000;
const ATTRACTION  = 0.04;
const DAMPING     = 0.82;
const CENTER_PULL = 0.004;
const MAX_VEL     = 8;

function initSimNodes(nodes: ConstellationNode[], width: number, height: number): SimNode[] {
  return nodes.map((n, i) => {
    const angle = (i / nodes.length) * Math.PI * 2;
    const radius = Math.min(width, height) * 0.32;
    return {
      ...n,
      x: width / 2 + Math.cos(angle) * radius * (0.5 + Math.random() * 0.5),
      y: height / 2 + Math.sin(angle) * radius * (0.5 + Math.random() * 0.5),
      vx: 0,
      vy: 0,
    };
  });
}

function tickSim(nodes: SimNode[], edges: SimEdge[], width: number, height: number) {
  const cx = width / 2;
  const cy = height / 2;

  // Repulsion (simplified O(n²))
  for (let i = 0; i < nodes.length; i++) {
    for (let j = i + 1; j < nodes.length; j++) {
      const a = nodes[i];
      const b = nodes[j];
      const dx = b.x - a.x;
      const dy = b.y - a.y;
      const dist2 = dx * dx + dy * dy + 1;
      const force = REPULSION / dist2;
      const fx = (dx / Math.sqrt(dist2)) * force;
      const fy = (dy / Math.sqrt(dist2)) * force;
      a.vx -= fx;
      a.vy -= fy;
      b.vx += fx;
      b.vy += fy;
    }
  }

  // Attraction on edges
  for (const edge of edges) {
    const dx = edge.target.x - edge.source.x;
    const dy = edge.target.y - edge.source.y;
    const dist = Math.sqrt(dx * dx + dy * dy) + 1;
    const force = (dist - 180) * ATTRACTION;
    const fx = (dx / dist) * force;
    const fy = (dy / dist) * force;
    edge.source.vx += fx;
    edge.source.vy += fy;
    edge.target.vx -= fx;
    edge.target.vy -= fy;
  }

  // Integrate + center gravity + clamp
  for (const n of nodes) {
    if (n.locked) continue;
    n.vx += (cx - n.x) * CENTER_PULL;
    n.vy += (cy - n.y) * CENTER_PULL;
    n.vx *= DAMPING;
    n.vy *= DAMPING;
    n.vx = Math.max(-MAX_VEL, Math.min(MAX_VEL, n.vx));
    n.vy = Math.max(-MAX_VEL, Math.min(MAX_VEL, n.vy));
    n.x += n.vx;
    n.y += n.vy;
    n.x = Math.max(20, Math.min(width - 20, n.x));
    n.y = Math.max(20, Math.min(height - 20, n.y));
  }
}

// ─── EvidenceConstellation component ─────────────────────────────────────

interface Props {
  unlockedConcepts?: string[];
}

export default function EvidenceConstellation({ unlockedConcepts }: Props) {
  const canvasRef    = useRef<HTMLCanvasElement>(null);
  const simRef       = useRef<SimNode[]>([]);
  const edgesRef     = useRef<SimEdge[]>([]);
  const rafRef       = useRef<number>(0);
  const stepsRef     = useRef(0);
  const MAX_SIM_STEPS = 600;

  const containerRef = useRef<HTMLDivElement>(null);
  const [size, setSize]               = useState({ w: 900, h: 620 });
  const [selectedNode, setSelectedNode] = useState<SimNode | null>(null);
  const [hoveredNode, setHoveredNode]   = useState<SimNode | null>(null);
  const [searchQuery, setSearchQuery]   = useState('');
  const [activeDomains, setActiveDomains] = useState<Set<number>>(new Set([1,2,3,4,5,6,7,8]));
  const [zoom, setZoom]                  = useState(1);
  const [pan, setPan]                    = useState({ x: 0, y: 0 });
  const isPanning                         = useRef(false);
  const lastPan                           = useRef({ x: 0, y: 0 });
  const [simRunning, setSimRunning]       = useState(true);

  // Build unlocked set
  const unlockedSet = useMemo(() => {
    if (!unlockedConcepts) return new Set(CONSTELLATION_NODES.map(n => n.id));
    return new Set(unlockedConcepts);
  }, [unlockedConcepts]);

  // Search match set
  const matchSet = useMemo(() => {
    if (!searchQuery.trim()) return new Set<string>();
    const q = searchQuery.toLowerCase();
    return new Set(
      CONSTELLATION_NODES
        .filter(n => n.label.toLowerCase().includes(q) || n.description.toLowerCase().includes(q))
        .map(n => n.id)
    );
  }, [searchQuery]);

  // Resize observer
  useEffect(() => {
    if (!containerRef.current) return;
    const ro = new ResizeObserver(entries => {
      for (const entry of entries) {
        const { width } = entry.contentRect;
        setSize({ w: Math.max(320, width), h: Math.max(400, Math.min(700, width * 0.65)) });
      }
    });
    ro.observe(containerRef.current);
    return () => ro.disconnect();
  }, []);

  // Init simulation
  useEffect(() => {
    const { w, h } = size;
    const nodes = initSimNodes(CONSTELLATION_NODES, w, h);
    const idMap = new Map(nodes.map(n => [n.id, n]));
    const edges: SimEdge[] = [];
    const seen = new Set<string>();
    for (const src of nodes) {
      for (const tgtId of src.connections) {
        const key = [src.id, tgtId].sort().join('|');
        if (!seen.has(key) && idMap.has(tgtId)) {
          seen.add(key);
          edges.push({ source: src, target: idMap.get(tgtId)! });
        }
      }
    }
    simRef.current = nodes;
    edgesRef.current = edges;
    stepsRef.current = 0;
    setSimRunning(true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [size]);

  // Animation loop
  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    const draw = () => {
      const { w, h } = size;
      const nodes = simRef.current;
      const edges = edgesRef.current;

      if (stepsRef.current < MAX_SIM_STEPS && simRunning) {
        tickSim(nodes, edges, w, h);
        stepsRef.current++;
        if (stepsRef.current >= MAX_SIM_STEPS) setSimRunning(false);
      }

      ctx.clearRect(0, 0, w, h);
      ctx.save();
      ctx.translate(pan.x, pan.y);
      ctx.scale(zoom, zoom);

      // Draw edges
      for (const edge of edges) {
        const srcDimmed = !activeDomains.has(edge.source.domain) || !activeDomains.has(edge.target.domain);
        ctx.beginPath();
        ctx.moveTo(edge.source.x, edge.source.y);
        ctx.lineTo(edge.target.x, edge.target.y);
        ctx.strokeStyle = srcDimmed ? 'rgba(255,255,255,0.03)' : 'rgba(0,232,255,0.08)';
        ctx.lineWidth = 0.8;
        ctx.stroke();
      }

      // Draw highlighted edges on hover/select
      const activeNode = hoveredNode || selectedNode;
      if (activeNode) {
        const connSet = new Set(activeNode.connections);
        const activeId = activeNode.id;
        for (const edge of edges) {
          const linked =
            (edge.source.id === activeId && connSet.has(edge.target.id)) ||
            (edge.target.id === activeId && connSet.has(edge.source.id));
          if (linked) {
            ctx.beginPath();
            ctx.moveTo(edge.source.x, edge.source.y);
            ctx.lineTo(edge.target.x, edge.target.y);
            ctx.strokeStyle = `${DOMAIN_COLORS[activeNode.domain]}88`;
            ctx.lineWidth = 1.5;
            ctx.stroke();
          }
        }
      }

      // Draw nodes
      for (const node of nodes) {
        const isUnlocked  = unlockedSet.has(node.id);
        const isDimmed    = !activeDomains.has(node.domain);
        const isMatched   = matchSet.size > 0 && matchSet.has(node.id);
        const isSearching = matchSet.size > 0;
        const isSelected  = selectedNode?.id === node.id;
        const isHovered   = hoveredNode?.id === node.id;

        const r = 4 + node.weight * 2.2;
        const color = DOMAIN_COLORS[node.domain] ?? '#ffffff';

        const alpha = isDimmed ? 0.12
          : isSearching && !isMatched ? 0.18
          : isUnlocked ? 1 : 0.35;

        ctx.save();
        ctx.globalAlpha = alpha;

        // Outer glow on selected / hovered
        if (isSelected || isHovered || isMatched) {
          ctx.shadowColor = color;
          ctx.shadowBlur = isSelected ? 24 : isMatched ? 18 : 12;
        }

        // Node circle
        ctx.beginPath();
        ctx.arc(node.x, node.y, r, 0, Math.PI * 2);
        ctx.fillStyle = isUnlocked ? color : '#334155';
        ctx.fill();

        // Ring on selected
        if (isSelected) {
          ctx.beginPath();
          ctx.arc(node.x, node.y, r + 4, 0, Math.PI * 2);
          ctx.strokeStyle = color;
          ctx.lineWidth = 2;
          ctx.stroke();
        }

        ctx.shadowBlur = 0;

        // Label
        const labelAlpha = isDimmed ? 0.12
          : isSearching && !isMatched ? 0.1
          : isHovered || isSelected || isMatched ? 1 : 0.55;
        ctx.globalAlpha = alpha * labelAlpha;
        ctx.font = `${isHovered || isSelected || isMatched ? 'bold ' : ''}${Math.max(9, 8 + node.weight)}px system-ui, sans-serif`;
        ctx.fillStyle = '#e2e8f0';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText(node.label, node.x, node.y + r + 9);

        ctx.restore();
      }

      ctx.restore();
      rafRef.current = requestAnimationFrame(draw);
    };

    rafRef.current = requestAnimationFrame(draw);
    return () => cancelAnimationFrame(rafRef.current);
  }, [size, activeDomains, matchSet, selectedNode, hoveredNode, unlockedSet, zoom, pan, simRunning]);

  // Hit-test helper (in world coordinates)
  const hitTest = useCallback((clientX: number, clientY: number): SimNode | null => {
    const canvas = canvasRef.current;
    if (!canvas) return null;
    const rect = canvas.getBoundingClientRect();
    const px = (clientX - rect.left - pan.x) / zoom;
    const py = (clientY - rect.top  - pan.y) / zoom;
    let best: SimNode | null = null;
    let bestD2 = Infinity;
    for (const n of simRef.current) {
      const r = (4 + n.weight * 2.2) + 6; // extra hit area
      const dx = n.x - px;
      const dy = n.y - py;
      const d2 = dx * dx + dy * dy;
      if (d2 < r * r && d2 < bestD2) {
        bestD2 = d2;
        best = n;
      }
    }
    return best;
  }, [pan, zoom]);

  const handleMouseMove = useCallback((e: React.MouseEvent) => {
    if (isPanning.current) {
      const dx = e.clientX - lastPan.current.x;
      const dy = e.clientY - lastPan.current.y;
      setPan(p => ({ x: p.x + dx, y: p.y + dy }));
      lastPan.current = { x: e.clientX, y: e.clientY };
      return;
    }
    const n = hitTest(e.clientX, e.clientY);
    setHoveredNode(n);
    if (canvasRef.current) {
      canvasRef.current.style.cursor = n ? 'pointer' : 'grab';
    }
  }, [hitTest]);

  const handleMouseDown = useCallback((e: React.MouseEvent) => {
    isPanning.current = true;
    lastPan.current = { x: e.clientX, y: e.clientY };
    if (canvasRef.current) canvasRef.current.style.cursor = 'grabbing';
  }, []);

  const handleMouseUp = useCallback((e: React.MouseEvent) => {
    if (!isPanning.current) return;
    isPanning.current = false;
    // If delta small → treat as click
    const dx = e.clientX - lastPan.current.x;
    const dy = e.clientY - lastPan.current.y;
    if (Math.abs(dx) < 3 && Math.abs(dy) < 3) {
      const n = hitTest(e.clientX, e.clientY);
      setSelectedNode(prev => (prev?.id === n?.id ? null : n));
    }
    if (canvasRef.current) canvasRef.current.style.cursor = 'grab';
  }, [hitTest]);

  const handleWheel = useCallback((e: React.WheelEvent) => {
    e.preventDefault();
    const factor = e.deltaY < 0 ? 1.1 : 0.91;
    setZoom(z => Math.max(0.3, Math.min(4, z * factor)));
  }, []);

  const toggleDomain = (d: number) => {
    setActiveDomains(prev => {
      const next = new Set(prev);
      if (next.has(d)) { if (next.size > 1) next.delete(d); }
      else next.add(d);
      return next;
    });
  };

  // Search: zoom to first match
  const handleSearch = (q: string) => {
    setSearchQuery(q);
    if (!q.trim()) return;
    const ql = q.toLowerCase();
    const match = simRef.current.find(n =>
      n.label.toLowerCase().includes(ql) || n.id.toLowerCase().includes(ql)
    );
    if (match) {
      setSelectedNode(match);
      const { w, h } = size;
      setPan({
        x: w / 2 - match.x * zoom,
        y: h / 2 - match.y * zoom,
      });
    }
  };

  const resetView = () => {
    setZoom(1);
    setPan({ x: 0, y: 0 });
    setSearchQuery('');
    setSelectedNode(null);
  };

  return (
    <div className="flex flex-col gap-4 select-none" style={{ fontFamily: 'system-ui, sans-serif' }}>

      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-3">
        <div>
          <h2 className="text-2xl font-black tracking-tight" style={{ color: '#00e8ff' }}>
            Evidence Constellation
          </h2>
          <p className="text-xs mt-1" style={{ color: '#64748b' }}>
            {CONSTELLATION_NODES.length} concepts across 8 CISSP domains. Click a node to explore. Scroll to zoom, drag to pan.
          </p>
        </div>

        {/* Search */}
        <div className="relative flex-shrink-0 w-full sm:w-64">
          <Search size={13} className="absolute left-3 top-1/2 -translate-y-1/2" style={{ color: '#64748b' }} />
          <input
            type="text"
            placeholder="Search concepts..."
            value={searchQuery}
            onChange={e => handleSearch(e.target.value)}
            className="w-full pl-8 pr-8 py-2 rounded-xl text-xs outline-none"
            style={{
              background: '#111a2e',
              border: '1px solid #1e2d4a',
              color: '#e2e8f0',
            }}
          />
          {searchQuery && (
            <button
              onClick={() => { setSearchQuery(''); setSelectedNode(null); }}
              className="absolute right-2.5 top-1/2 -translate-y-1/2"
              style={{ color: '#64748b' }}
            >
              <X size={13} />
            </button>
          )}
        </div>
      </div>

      {/* Domain legend */}
      <div className="flex flex-wrap gap-1.5">
        {Object.entries(DOMAIN_NAMES).map(([d, name]) => {
          const dn = parseInt(d);
          const active = activeDomains.has(dn);
          const color = DOMAIN_COLORS[dn];
          return (
            <button
              key={d}
              onClick={() => toggleDomain(dn)}
              className="flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-medium transition-all"
              style={{
                background: active ? `${color}18` : '#0d1220',
                border: `1px solid ${active ? color + '66' : '#1e2d4a'}`,
                color: active ? color : '#334155',
                opacity: active ? 1 : 0.6,
              }}
            >
              <span className="w-1.5 h-1.5 rounded-full" style={{ background: active ? color : '#334155' }} />
              D{d}
            </button>
          );
        })}
        <button
          onClick={resetView}
          className="px-2.5 py-1 rounded-lg text-xs font-medium transition-all ml-auto"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#64748b' }}
        >
          Reset view
        </button>
      </div>

      {/* Canvas + info panel */}
      <div className="flex flex-col lg:flex-row gap-3">

        {/* Canvas */}
        <div
          ref={containerRef}
          className="relative rounded-2xl overflow-hidden flex-1"
          style={{ background: '#08101e', border: '1px solid #1e2d4a', minHeight: 400 }}
        >
          <canvas
            ref={canvasRef}
            width={size.w}
            height={size.h}
            style={{ display: 'block', width: '100%', height: size.h, cursor: 'grab' }}
            onMouseMove={handleMouseMove}
            onMouseDown={handleMouseDown}
            onMouseUp={handleMouseUp}
            onMouseLeave={() => { isPanning.current = false; setHoveredNode(null); }}
            onWheel={handleWheel}
          />

          {/* Zoom controls */}
          <div
            className="absolute bottom-3 right-3 flex flex-col gap-1"
          >
            {[
              { label: '+', action: () => setZoom(z => Math.min(4, z * 1.2)) },
              { label: '−', action: () => setZoom(z => Math.max(0.3, z / 1.2)) },
            ].map(btn => (
              <button
                key={btn.label}
                onClick={btn.action}
                className="w-8 h-8 rounded-lg flex items-center justify-center text-sm font-bold transition-all"
                style={{
                  background: '#111a2e',
                  border: '1px solid #1e2d4a',
                  color: '#64748b',
                }}
              >
                {btn.label}
              </button>
            ))}
          </div>

          {/* Sim still running badge */}
          {simRunning && (
            <div
              className="absolute top-3 left-3 text-xs px-2 py-0.5 rounded-full animate-pulse"
              style={{ background: '#00e8ff18', border: '1px solid #00e8ff44', color: '#00e8ff' }}
            >
              Settling…
            </div>
          )}

          {/* Node count overlay */}
          <div
            className="absolute bottom-3 left-3 text-xs"
            style={{ color: '#334155' }}
          >
            {CONSTELLATION_NODES.length} nodes · {edgesRef.current.length} edges
          </div>
        </div>

        {/* Info panel */}
        <div
          className="lg:w-72 rounded-2xl p-4 flex flex-col gap-3"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', minHeight: 200 }}
        >
          {selectedNode ? (
            <>
              <div className="flex items-start justify-between gap-2">
                <div>
                  <span
                    className="text-xs font-bold px-2 py-0.5 rounded-full"
                    style={{
                      background: `${DOMAIN_COLORS[selectedNode.domain]}18`,
                      color: DOMAIN_COLORS[selectedNode.domain],
                      border: `1px solid ${DOMAIN_COLORS[selectedNode.domain]}44`,
                    }}
                  >
                    Domain {selectedNode.domain}
                  </span>
                  <h3 className="mt-2 text-base font-black" style={{ color: '#e2e8f0' }}>
                    {selectedNode.label}
                  </h3>
                  <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>
                    {DOMAIN_NAMES[selectedNode.domain]}
                  </p>
                </div>
                <button onClick={() => setSelectedNode(null)} style={{ color: '#334155', flexShrink: 0 }}>
                  <X size={14} />
                </button>
              </div>

              {/* Weight indicator */}
              <div className="flex items-center gap-2">
                <span className="text-xs" style={{ color: '#64748b' }}>Exam weight</span>
                <div className="flex gap-0.5">
                  {[1,2,3,4,5].map(i => (
                    <div
                      key={i}
                      className="w-3 h-1.5 rounded-sm"
                      style={{
                        background: i <= selectedNode.weight
                          ? DOMAIN_COLORS[selectedNode.domain]
                          : '#1e2d4a',
                      }}
                    />
                  ))}
                </div>
              </div>

              <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                {selectedNode.description}
              </p>

              {/* Connections */}
              <div>
                <p className="text-xs font-semibold mb-1.5" style={{ color: '#64748b' }}>
                  Connected concepts ({selectedNode.connections.length})
                </p>
                <div className="flex flex-wrap gap-1">
                  {selectedNode.connections.slice(0, 8).map(cid => {
                    const cn = CONSTELLATION_NODES.find(n => n.id === cid);
                    if (!cn) return null;
                    return (
                      <button
                        key={cid}
                        onClick={() => {
                          const simN = simRef.current.find(n => n.id === cid);
                          if (simN) {
                            setSelectedNode(simN);
                            setPan({
                              x: size.w / 2 - simN.x * zoom,
                              y: size.h / 2 - simN.y * zoom,
                            });
                          }
                        }}
                        className="text-xs px-2 py-0.5 rounded-lg transition-all hover:opacity-80"
                        style={{
                          background: `${DOMAIN_COLORS[cn.domain]}15`,
                          border: `1px solid ${DOMAIN_COLORS[cn.domain]}33`,
                          color: DOMAIN_COLORS[cn.domain],
                        }}
                      >
                        {cn.label}
                      </button>
                    );
                  })}
                  {selectedNode.connections.length > 8 && (
                    <span className="text-xs px-2 py-0.5" style={{ color: '#334155' }}>
                      +{selectedNode.connections.length - 8} more
                    </span>
                  )}
                </div>
              </div>

              {/* Library link */}
              {selectedNode.librarySlug && (
                <a
                  href={`/app/library/${selectedNode.librarySlug}`}
                  className="flex items-center gap-2 px-3 py-2 rounded-xl text-xs font-semibold transition-all hover:opacity-80 mt-auto"
                  style={{
                    background: '#00e8ff18',
                    border: '1px solid #00e8ff44',
                    color: '#00e8ff',
                  }}
                >
                  <BookOpen size={12} />
                  Study in Library
                  <ExternalLink size={10} className="ml-auto" />
                </a>
              )}
            </>
          ) : (
            <div className="flex flex-col items-center justify-center h-full gap-3 py-8 text-center">
              <div
                className="w-12 h-12 rounded-2xl flex items-center justify-center text-2xl"
                style={{ background: '#00e8ff08', border: '1px solid #00e8ff22' }}
              >
                ✦
              </div>
              <div>
                <p className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>
                  Click any node
                </p>
                <p className="text-xs mt-1 max-w-[18ch] mx-auto leading-relaxed" style={{ color: '#64748b' }}>
                  Explore concept definitions, connections, and study links.
                </p>
              </div>
              {hoveredNode && (
                <div
                  className="px-3 py-1.5 rounded-xl text-xs"
                  style={{
                    background: `${DOMAIN_COLORS[hoveredNode.domain]}12`,
                    border: `1px solid ${DOMAIN_COLORS[hoveredNode.domain]}44`,
                    color: DOMAIN_COLORS[hoveredNode.domain],
                  }}
                >
                  {hoveredNode.label}
                </div>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Search results count */}
      {searchQuery.trim() && (
        <p className="text-xs" style={{ color: '#64748b' }}>
          {matchSet.size} concept{matchSet.size !== 1 ? 's' : ''} matching &ldquo;{searchQuery}&rdquo;
        </p>
      )}
    </div>
  );
}
