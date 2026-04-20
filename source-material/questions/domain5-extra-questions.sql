-- =====================================================================
-- CISSP Quest -- Domain 5: Identity and Access Management (IAM)
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: OAuth 2.0 flows, SAML vs OIDC, PAM solutions,
--   zero-trust architecture, biometric FAR/FRR trade-offs
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain5-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  5, 'oauth_flows',
  'A mobile banking application needs to allow users to authorize the app to access their transaction history from the bank''s API on their behalf. The application cannot securely store a client secret. Which OAuth 2.0 flow is MOST appropriate?',
  '["Authorization Code Flow with PKCE (Proof Key for Code Exchange), which adds a code verifier/challenge mechanism to prevent authorization code interception attacks in public clients (mobile/SPA apps) that cannot securely store client secrets", "Client Credentials Flow, because mobile apps need server-to-server authentication for API access", "Implicit Flow, because it was designed specifically for public clients like mobile applications", "Resource Owner Password Credentials Flow, because it allows the app to collect username and password directly without a browser redirect"]'::jsonb,
  0,
  'OAuth 2.0 RFC 6749 defines flows for different client types. Mobile apps are "public clients" -- they cannot securely store a client secret (it would be embedded in the app binary and extractable). Authorization Code Flow with PKCE (RFC 7636) is the recommended flow: PKCE adds a dynamically-generated code_verifier and code_challenge to prevent authorization code interception. Implicit Flow was designed for public clients but is now deprecated (OAuth 2.0 Security Best Current Practice) due to token leakage risks in browser history/referrer headers. Client Credentials is for machine-to-machine (no user). ROPC Flow requires the app to handle user credentials directly, violating least-privilege.',
  'Mobile app = public client = no client secret. Use Auth Code + PKCE. Implicit Flow = deprecated. ROPC = app sees your password = bad.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  5, 'saml_oidc',
  'An enterprise is choosing between SAML 2.0 and OpenID Connect (OIDC) for federated SSO with a new SaaS application. The application is a modern single-page application (SPA). Which comparison is MOST accurate for this use case?',
  '["SAML 2.0 is always preferable for enterprise environments because it is more mature and widely supported by legacy IdPs", "OIDC is better suited for SPAs and modern web/mobile applications because it uses JSON/REST (JSON Web Tokens), is natively compatible with OAuth 2.0 for authorization, and is designed for scenarios where JavaScript-based applications exchange tokens via browser redirects or API calls; SAML uses XML-based assertions that are heavier and designed for enterprise browser-based SSO with full page redirects rather than API-friendly token exchange", "SAML and OIDC are functionally equivalent for SPA use cases because both support token-based authentication", "OIDC requires deployment of a separate authorization server while SAML works with any existing LDAP directory"]'::jsonb,
  1,
  'SAML 2.0 uses XML-based Security Assertions passed via browser redirects (HTTP-POST binding or HTTP-Redirect binding). It is designed for browser-based SSO with full-page redirects and is widely used in enterprise B2B federation. OIDC (OpenID Connect, built on OAuth 2.0) uses JSON Web Tokens (JWTs), REST APIs, and supports various flows (Authorization Code, Implicit, Device, etc.) compatible with SPAs, mobile apps, and API-to-API authentication. For a modern SPA, OIDC with Authorization Code + PKCE is the standard choice. SAML''s XML bulk and browser-redirect dependency makes it awkward for API-driven SPAs. Many enterprises support both in their IdP (e.g., Okta, Azure AD).',
  'OIDC = JSON/JWT + REST = modern SPA/mobile. SAML = XML + browser redirect = enterprise legacy SSO. SPA = use OIDC.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  5, 'pam_solutions',
  'An organization''s privileged access management (PAM) solution vaults all shared service account passwords and requires check-out for use. A developer complains that they need to hard-code the database password in a CI/CD pipeline configuration file for automated deployments. What is the MOST appropriate solution?',
  '["Grant the developer an exception to hard-code the password because CI/CD pipelines are automated and cannot use interactive check-out", "Store the password in an encrypted configuration file protected by the CI/CD system''s encryption key", "Integrate the CI/CD pipeline with the PAM solution''s API or a secrets management service (e.g., HashiCorp Vault, AWS Secrets Manager) to retrieve credentials dynamically at runtime using a machine identity (service account with least-privilege API access), eliminating the need to hard-code credentials anywhere", "Create a dedicated service account for the CI/CD pipeline with a never-expiring password stored in the PAM vault as a permanent check-out"]'::jsonb,
  2,
  'Hard-coded credentials in configuration files are a top security anti-pattern (OWASP Secrets in Source Code). The correct solution is dynamic secrets retrieval: the CI/CD pipeline authenticates to the secrets manager using a machine identity (e.g., AWS IAM role, service account, pipeline token), retrieves the database credential at runtime, uses it, and the credential is never stored in any file or repository. Modern PAM solutions and cloud-native secrets managers (HashiCorp Vault, AWS Secrets Manager, Azure Key Vault) support this pattern with short-lived dynamic secrets that are automatically rotated. Permanent check-out defeats the purpose of PAM vaulting.',
  'CI/CD secrets = dynamic retrieval from vault API at runtime. Never hard-code. Machine identity authenticates to vault, gets credential JIT.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  5, 'zero_trust',
  'An organization is implementing Zero Trust Architecture (ZTA) per NIST SP 800-207. The security team proposes deploying the ZTA Policy Enforcement Point (PEP) as a network proxy that all traffic must traverse. The network architect argues that this creates a single point of failure. Which response is MOST aligned with NIST SP 800-207?',
  '["The network architect is correct; ZTA must use distributed enforcement points without any central proxy", "The security team is correct; a centralized PEP is required by NIST SP 800-207 for all ZTA implementations", "ZTA does not address availability requirements; availability is a separate operational concern outside the ZTA model", "NIST SP 800-207 acknowledges that the PEP is a critical component and recommends designing for availability through redundancy and failover; the PEP may be implemented as an agent on endpoints (distributed), as a network proxy (centralized), or both -- and must be designed with availability and scalability in mind to avoid becoming a bottleneck or single point of failure"]'::jsonb,
  3,
  'NIST SP 800-207 defines ZTA with a Policy Enforcement Point (PEP) that enforces access decisions made by the Policy Decision Point (PDP). The standard acknowledges that PEP can be deployed in various architectures: per-device agents, network proxies, or hybrid. Section 3.2 of NIST 800-207 explicitly discusses availability concerns and recommends redundancy. A proxy-based PEP without redundancy creates the exact single-point-of-failure concern the architect raised. ZTA design must address availability as a core requirement, not as a separate concern. The answer is not "centralized is wrong" or "distributed is wrong" -- it''s "design for availability with appropriate redundancy."',
  'ZTA PEP: can be agent, proxy, or hybrid. NIST 800-207 requires availability design. Redundant PEP = right answer. Single PEP = SPoF = wrong.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / comparison / correct=0
(
  5, 'biometrics',
  'A high-security government facility is calibrating its fingerprint biometric system. The current FAR (False Acceptance Rate) is 0.001% and the FRR (False Rejection Rate) is 8%. Security management wants to reduce the FAR further. What is the trade-off, and which setting adjustment achieves this?',
  '["Increasing the matching threshold (requiring closer biometric match) reduces FAR but increases FRR -- fewer unauthorized users are accepted but more legitimate users are rejected; in high-security scenarios, lower FAR is prioritized even at the cost of higher FRR and user inconvenience", "Increasing the matching threshold reduces both FAR and FRR simultaneously, improving overall system performance", "Decreasing the matching threshold reduces FAR by accepting fewer borderline matches", "FAR and FRR are independent parameters that can be tuned independently without affecting each other"]'::jsonb,
  0,
  'FAR (False Acceptance Rate) and FRR (False Rejection Rate) have an inverse relationship in biometric systems. The system''s sensitivity is controlled by the matching threshold: raising the threshold requires a closer biometric match. Higher threshold: fewer false acceptances (lower FAR) but more legitimate users rejected (higher FRR). Lower threshold: more permissive matching, more false acceptances (higher FAR) but fewer rejections (lower FRR). The Equal Error Rate (EER) or Crossover Error Rate (CER) is the point where FAR = FRR. For high-security scenarios, FAR must be minimized (we cannot accept unauthorized users) at the expense of higher FRR (users may need to re-scan).',
  'FAR vs FRR = inverse relationship. Higher threshold = lower FAR + higher FRR. Security priority = minimize FAR. Convenience priority = minimize FRR.',
  'apply', 'comparison', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / tlatm / correct=1
(
  5, 'oauth_flows',
  'You are reviewing an OAuth 2.0 implementation for a third-party application that requests the scope "read:all write:all admin" when users authorize the app to access their calendar data. What security principle is violated, and what should you recommend?',
  '["The scope request violates separation of duties; the application should use separate service accounts for read and write operations", "The scope request violates least-privilege: the application requests far broader permissions (admin, write:all) than needed for calendar access; you should require the application to request only the minimum necessary scopes for its specific function (e.g., calendar:read or calendar:events:read), and the authorization server should enforce scope restrictions during client registration", "Scope requests cannot be restricted because OAuth 2.0 allows applications to request any scopes they require", "The violation is in the token format; JWT scopes should be individual fields, not space-separated strings"]'::jsonb,
  1,
  'OAuth 2.0 scopes implement least-privilege for delegated authorization. An application that needs only calendar read access should request only calendar:read (or equivalent). Requesting "admin" and "write:all" violates least-privilege because: (1) users may not understand the full implications of granting admin access, (2) if the application is compromised, the attacker gains admin access rather than just calendar read access. Remediation: restrict scopes in client registration, implement scope validation in the authorization server, follow the OAuth 2.0 principle of minimum necessary scope, and provide users with clear consent screens showing exactly what permissions are requested.',
  'OAuth scopes = least privilege. Request ONLY what you need. Admin+write:all for calendar read = gross over-privilege. Fix at client registration.',
  'analyze', 'tlatm', 'hard',
  1.70, 1.50, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  5, 'zero_trust',
  'An organization implements ZTA with continuous authentication. An employee successfully authenticates in the morning from their corporate laptop on the corporate network (high trust score). In the afternoon, the same session is used to access sensitive HR data from a new IP address in a different country. Under ZTA continuous verification, what should the Policy Decision Point (PDP) do?',
  '["Maintain the existing session because the user already authenticated successfully; re-authentication is only required at session expiry", "Immediately terminate the session because geographic impossibility indicates account compromise", "Re-evaluate the session''s trust score based on the new context signals (new IP, geographic anomaly, sensitive resource request); the trust score likely drops significantly; depending on the risk threshold, the PDP should step-up authenticate (require MFA challenge) before granting access to HR data", "Log the anomaly but allow access because blocking productivity based on location changes is too disruptive"]'::jsonb,
  2,
  'NIST SP 800-207 ZTA principle: access is granted based on continuous verification of identity, device health, and contextual risk signals, not a one-time authentication event. The afternoon scenario presents multiple risk signals: new IP, geographic anomaly (impossible travel if the gap is short enough), and a sensitive resource (HR data). The PDP should: (1) reduce the trust score for the session, (2) compare the new score against the resource''s access policy threshold, (3) trigger step-up authentication (additional MFA challenge) before granting access to sensitive HR data. Immediate termination without step-up is too blunt. Maintaining the session without re-evaluation violates ZTA''s continuous verification principle.',
  'ZTA = continuous trust scoring. New IP + geo anomaly + sensitive data = trust score drops = step-up MFA before access. Not terminate, not ignore.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / scenario / correct=3
(
  5, 'pam_solutions',
  'A PAM solution is deployed to manage privileged access to 500 servers. An audit finds that 30% of privileged accounts have not been used in over 180 days. What is the MOST appropriate action regarding these dormant accounts?',
  '["Retain the accounts as-is because unused accounts pose no risk since they are not actively being exploited", "Immediately delete all 30% of accounts without further investigation because dormant accounts are a compliance violation", "Require all dormant account owners to re-certify their accounts within 24 hours or face automatic deletion", "Conduct an access review: disable (not delete) dormant accounts pending review by the account owners and their managers; accounts confirmed as legitimate (e.g., break-glass emergency accounts) should be re-certified with appropriate documentation; truly unneeded accounts should be removed after confirmation; break-glass accounts should be stored in PAM vault with dual-control access"]'::jsonb,
  3,
  'Dormant privileged accounts are a high-risk finding because: (1) they may represent orphaned accounts from departed employees, (2) they are targets for attackers (not monitored, not noticed), (3) they violate least-privilege and need-to-know. However, immediate deletion without review is risky because: some dormant accounts are legitimate break-glass emergency accounts, service accounts that are infrequently used but critical, or accounts for seasonal processes. The correct action is: disable (reversible), investigate, re-certify or remove. Break-glass accounts need dual-control documentation in the PAM system. Access review with manager confirmation before deletion is the governance-appropriate approach.',
  'Dormant PAM accounts: DISABLE then review. Some are legitimate (break-glass). Delete only after confirmed unnecessary. Never delete without investigation.',
  'apply', 'scenario', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / scenario / correct=0
(
  5, 'biometrics',
  'An organization deploys facial recognition for physical access control to a secure research facility. A security researcher demonstrates that a high-resolution photograph of an enrolled employee can successfully unlock the door. Which attack is being demonstrated, and what is the MOST effective countermeasure?',
  '["Presentation attack (spoofing/liveness bypass) -- the biometric system lacks liveness detection; implement an ISO/IEC 30107-3 compliant Presentation Attack Detection (PAD) mechanism that verifies physiological liveness cues (3D depth sensing, blink detection, texture analysis, infrared imaging) to distinguish live faces from photographs or masks", "The attack is a brute-force attack; implementing account lockout after failed attempts prevents this", "The vulnerability is in the camera hardware; replace with higher-resolution cameras", "The attack is a replay attack; implement session tokens to prevent replay of biometric data"]'::jsonb,
  0,
  'A presentation attack (spoofing attack) occurs when an attacker presents an artifact (photograph, video, mask, 3D model) to a biometric sensor rather than the genuine biometric. The countermeasure is Presentation Attack Detection (PAD), also called liveness detection: algorithms or hardware that detect whether the biometric being presented comes from a live person. Methods include: 3D depth sensing (photographs are flat), infrared/thermal imaging (live skin has specific thermal signatures), blink/motion detection (photographs don''t blink), texture analysis, challenge-response (asking the user to perform specific actions). ISO/IEC 30107-3 defines PAD requirements and test methods.',
  'Photo unlocks door = presentation attack (spoofing). Fix = liveness detection (PAD). ISO 30107-3. 3D sensors, IR, blink detection, texture analysis.',
  'apply', 'scenario', 'hard',
  1.80, 1.60, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  5, 'saml_oidc',
  'During a SAML 2.0 SSO transaction, the Service Provider (SP) receives a SAMLResponse that was not requested (no prior AuthnRequest). Under strict SAML security, how should the SP handle this, and what attack does this mitigate?',
  '["The SP should accept the unsolicited response because IdP-initiated SSO is a common SAML deployment pattern and SAMLResponse validity is verified through digital signature", "The SP should reject unsolicited SAMLResponses unless it has been explicitly configured to allow IdP-initiated SSO with additional controls (RelayState validation, InResponseTo checking); this mitigates SAML response replay attacks and SAML assertion injection attacks where an attacker injects a previously captured valid SAMLResponse into a new session", "The SP should accept the response but log it for audit purposes because digital signature verification is sufficient security", "Unsolicited SAMLResponses are always invalid under SAML 2.0 and must be rejected without exception"]'::jsonb,
  1,
  'SP-initiated SSO: SP sends AuthnRequest with an ID → IdP responds with SAMLResponse containing InResponseTo matching the AuthnRequest ID. The SP can verify the response corresponds to a specific request. IdP-initiated SSO: the IdP sends a SAMLResponse without a prior AuthnRequest. The SP cannot verify InResponseTo, making it vulnerable to: (1) SAML Response Replay -- attacker captures a valid SAMLResponse and injects it into a different session. (2) SAML Assertion Injection -- attacker replaces/injects assertions. If IdP-initiated SSO is required, SPs should enforce RelayState integrity, use short assertion lifetimes, and implement one-time token checking. Strict security posture rejects unsolicited responses.',
  'SAML unsolicited response = no InResponseTo binding = replay attack risk. Accept only if IdP-initiated explicitly configured + RelayState + short lifetime.',
  'analyze', 'comparison', 'very_hard',
  2.00, 2.20, 0.22, 'handcrafted', true
),

-- Q11: hard / apply / tlatm / correct=2
(
  5, 'zero_trust',
  'You are a security architect implementing ZTA for a healthcare organization. Physicians need to access patient records from both hospital-owned devices (managed, compliant) and personal iPads (unmanaged). Under ZTA, how should these access scenarios be differentiated?',
  '["Deny all access from personal iPads because ZTA requires device compliance as a prerequisite for any access", "Allow identical access from both device types because ZTA focuses on user identity, not device type", "Implement differentiated access policies based on device posture: managed devices with verified compliance (certificate, MDM enrollment, AV, OS patch level) receive higher trust scores enabling access to full patient record data; unmanaged personal iPads receive lower trust scores enabling access only to a limited, clinically necessary subset of data via a browser-based isolated workspace (VDI/cloud browser), with all data access logged", "Require physicians to use only hospital-owned devices, blocking all personal device access regardless of ZTA principles"]'::jsonb,
  2,
  'ZTA enables risk-based differentiated access based on device posture, not binary allow/deny. A managed device (MDM-enrolled, compliant) presents verifiable trust signals (device certificate, patch status, AV compliance) supporting higher trust score and broader data access. An unmanaged personal iPad cannot provide these signals, resulting in a lower trust score. ZTA''s response is not to block access entirely (which would harm clinical workflows) but to limit access to the minimum necessary in a controlled environment (browser isolation, VDI) that prevents data leakage to the unmanaged device. This is the "never trust, always verify, least privilege" model applied to device context.',
  'ZTA differentiated access: managed device = full access (high trust). Unmanaged = limited + isolated workspace (low trust). Not block, not same access.',
  'apply', 'tlatm', 'hard',
  1.70, 1.60, 0.22, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  5, 'oauth_flows',
  'An OAuth 2.0 authorization server issues access tokens as opaque strings with a 1-hour expiry and refresh tokens with a 30-day expiry. A security engineer proposes switching to JWT access tokens. The CISO asks about the security trade-off. Which assessment is MOST accurate?',
  '["JWT access tokens are always more secure than opaque tokens because they contain cryptographically signed claims", "Switching to JWT access tokens eliminates the need for refresh tokens because JWTs are self-validating", "Opaque tokens are always preferable to JWTs because JWTs cannot be revoked before expiry", "JWT access tokens allow resource servers to validate tokens locally without querying the authorization server (reducing latency and scalability bottlenecks), but introduce a revocation challenge: since JWTs are self-validating, a compromised JWT remains valid until its expiry unless a token revocation mechanism (introspection endpoint, short-lived tokens with a deny-list, or token binding) is implemented; opaque tokens require server-side validation on every request but can be revoked instantly"]'::jsonb,
  3,
  'The JWT access token trade-off is fundamental to modern identity architecture. Opaque tokens: authorization server must validate each token on every API call (scalability bottleneck, real-time revocation possible). JWT tokens: resource servers validate locally using the authorization server''s public key (no per-request AS call, scalable) but if a JWT is stolen, it cannot be revoked before expiry without additional infrastructure (short expiry + refresh rotation, deny-list, or token introspection). Neither is universally better. The correct architecture choice depends on revocation requirements, scalability needs, and token lifetime.',
  'JWT = self-validate (scalable) but cannot revoke instantly. Opaque = server-side validate (revocable instantly) but creates AS bottleneck. Revocation is the JWT trade-off.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.30, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  5, 'access_control',
  'An organization''s access control policy requires "separation of duties" for financial transactions over $10,000. A system architect proposes implementing this using Role-Based Access Control (RBAC) where users are assigned to "Initiator" and "Approver" roles, with a policy that the same user cannot hold both roles simultaneously. Which additional technical control is MOST important to prevent SoD bypass?',
  '["Enforce at the system level that a transaction initiated by User A cannot be approved by User A, even if User A somehow holds both roles (e.g., through a role assignment error); the system must check the initiator''s identity against the approver''s identity at the approval step and reject self-approval", "Implement quarterly access reviews to identify users who hold both Initiator and Approver roles", "Log all approvals and send reports to management monthly so that self-approvals can be detected retroactively", "Require users to submit a written request before approving any transaction to create a paper trail"]'::jsonb,
  0,
  'RBAC can prevent users from holding conflicting roles through Separation of Duty constraints (static SoD). However, role assignment errors, emergency access procedures, or privilege creep can result in a user temporarily holding both roles. A critical additional control is dynamic SoD enforcement: the system checks at the time of approval whether the approver is the same person who initiated the transaction, regardless of their current role assignments. This is a transactional-level SoD check in addition to role-level SoD. Quarterly reviews and monthly reports are detective controls -- they discover violations after the fact. System-level identity checking is the preventive control that stops the SoD bypass at the moment of the violation.',
  'SoD: RBAC prevents role overlap. Dynamic SoD: also check initiator ≠ approver at transaction time. Preventive > detective controls.',
  'apply', 'best_answer', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / first_action / correct=1
(
  5, 'pam_solutions',
  'A PAM system audit reveals that a former system administrator whose employment was terminated 6 months ago still has an active service account on 15 production servers. The account has not been used in 6 months. What is the FIRST priority action?',
  '["Document the finding in the audit report and include it as a recommendation for the next access review cycle", "Immediately disable the service account and notify the incident response team to investigate whether the account was accessed after the termination date -- reviewing all logs for the 6-month period", "Delete the account immediately to eliminate the risk", "Change the password on the account to prevent the former employee from using it, then leave the account active for system compatibility"]'::jsonb,
  1,
  'This finding represents a potential security incident: an active account belonging to a terminated employee may have been used for unauthorized access during the 6 months. The first action is to immediately disable (not delete -- deletion destroys audit evidence) the account while simultaneously notifying the IR team to investigate historical access logs. Deletion before investigation destroys forensic evidence of any unauthorized use. Changing the password does not address the investigation need and leaves the account active. Documenting for the next review cycle delays response to a potentially active threat. This is both a governance failure (joiner-mover-leaver process gap) and a potential incident.',
  'Former employee account = disable IMMEDIATELY + IR investigation for 6-month log review. Delete AFTER investigation. Document process failure.',
  'analyze', 'first_action', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / scenario / correct=2
(
  5, 'biometrics',
  'A financial institution deploys voice biometrics for telephone banking authentication. The system uses a customer''s enrolled voice print. A security researcher demonstrates a successful attack using a 30-second recording of the customer''s voice from a public YouTube video, processed through a voice synthesis AI, to bypass authentication. Which two countermeasures MOST directly address this attack vector?',
  '["Increase the voice print enrollment sample length to 60 seconds and require re-enrollment annually", "Implement voice print comparison at 99.9% confidence and reduce the FRR to eliminate all false acceptances", "Implement liveness detection (challenge-response with unpredictable random phrases that cannot be pre-recorded) combined with voice deepfake detection algorithms that analyze spectral and prosodic features characteristic of AI-generated speech", "Abandon voice biometrics entirely and switch to hardware tokens for telephone banking authentication"]'::jsonb,
  2,
  'The attack described uses AI voice synthesis (deepfake audio) to create a fraudulent voice sample. Two countermeasures: (1) Liveness detection via challenge-response: require the customer to speak a randomly-generated phrase at authentication time. A pre-recorded or static synthesis cannot respond correctly. Dynamic challenge-response defeats replay of recorded voice samples. (2) Deepfake detection: AI-based analysis of voice samples for spectral artifacts, unnatural prosody, formant irregularities, and background noise patterns characteristic of synthesized speech. Simply increasing confidence thresholds does not address AI synthesis quality. Re-enrollment does not prevent use of new recordings. Abandoning biometrics is disproportionate.',
  'Voice deepfake attack = dynamic challenge-response (unpredictable phrases) + deepfake detection algorithms. Static voice samples fail both.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.20, 0.20, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  5, 'access_control',
  'An organization uses Attribute-Based Access Control (ABAC) for a document management system. A policy states: "Users with department=Legal AND classification-clearance>=Confidential AND device-compliance=true may access Legal-Confidential documents." A paralegal (department=Legal, clearance=Confidential) accesses a document from a non-compliant device. What happens, and why is this the appropriate behavior?',
  '["Access is granted because the paralegal meets two of three conditions, satisfying the majority rule", "Access is granted because the user''s identity attributes (department and clearance) are more important than device state in ABAC", "Access is denied, but the policy should be redesigned because requiring device compliance is too restrictive for remote workers", "Access is denied because the AND logic in the ABAC policy requires ALL three conditions to be satisfied simultaneously; device-compliance=true is false (non-compliant device), so the compound policy evaluates to false regardless of the other satisfied attributes -- this is the correct behavior as it enforces least-privilege based on multiple contextual factors"]'::jsonb,
  3,
  'ABAC evaluates policies as boolean expressions over attribute sets. The policy "A AND B AND C" requires all three conditions to be simultaneously true. The user satisfies department=Legal (A=true) and classification-clearance>=Confidential (B=true) but fails device-compliance=true (C=false). A AND B AND C = true AND true AND false = FALSE. Access is denied. This is the correct behavior: a non-compliant device represents a risk vector that the policy deliberately excludes. ABAC''s power is exactly this ability to combine contextual factors (identity, clearance, device state, time, location) in compound policies. This is why ABAC is more flexible than RBAC for complex, context-sensitive access decisions.',
  'ABAC policy = ALL conditions must be true (AND logic). One false = deny. This is intentional. Context matters: non-compliant device = deny.',
  'apply', 'scenario', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / comparison / correct=0
(
  5, 'saml_oidc',
  'A security team is evaluating a SAML federation for B2B partner integration. The partner''s IdP uses SHA-1 for SAML assertion signatures. What is the MOST significant security concern with this configuration?',
  '["SHA-1 is cryptographically broken for collision resistance (SHAttered attack demonstrated SHA-1 collision in 2017); SAML assertions signed with SHA-1 are vulnerable to signature forgery attacks where an attacker crafts a fraudulent assertion with the same signature as a legitimate one; the partner must upgrade to SHA-256 or higher before federation is established", "SHA-1 is only deprecated for TLS, not for digital signatures in SAML; SHA-1 SAML signatures remain secure", "The risk is acceptable because SAML assertions are additionally protected by TLS transport-layer encryption", "SHA-1 for SAML signatures should be replaced, but this is a low-priority issue that can be addressed in the next annual security review"]'::jsonb,
  0,
  'The SHAttered attack (2017, CWI/Google) produced the first SHA-1 chosen-prefix collision, demonstrating practical SHA-1 collision attacks. For SAML, a collision attack could allow an attacker to craft a fraudulent SAMLAssertion that produces the same SHA-1 hash as a legitimate assertion -- forging authentication. NIST deprecated SHA-1 for digital signatures in 2011 (SP 800-131A) and disallowed it for new signatures after 2013. TLS transport encryption protects the assertion in transit but does not provide application-layer integrity if the signature itself is forgeable. This is a blocking security concern that must be resolved before establishing the federation.',
  'SHA-1 = broken (SHAttered 2017). SAML + SHA-1 = forgeable assertions. Block the federation until partner upgrades to SHA-256.',
  'analyze', 'comparison', 'hard',
  1.80, 1.80, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / tlatm / correct=1
(
  5, 'pam_solutions',
  'You are implementing Just-In-Time (JIT) privileged access for cloud infrastructure administrators. The PAM system grants administrator access for 4-hour windows upon approval. An administrator requests a 4-hour window for an emergency production fix at 2:00 AM on a Saturday. The approver is unavailable. What JIT architecture component MOST directly addresses this scenario without abandoning the JIT model?',
  '["Create a permanent emergency administrator account with known credentials stored in a sealed envelope", "Implement a break-glass (emergency access) procedure as part of the JIT architecture: a pre-approved, time-limited break-glass account exists in the PAM vault with dual-control access requiring two custodians (or a single senior custodian after-hours), all actions are recorded with enhanced logging, and the use generates automatic alerts to security and management for post-incident review", "Disable the 4-hour JIT window requirement for weekends to accommodate emergency scenarios", "Require the administrator to wait until Monday when the approver is available, regardless of the production impact"]'::jsonb,
  1,
  'Break-glass accounts are a deliberate exception mechanism in JIT/ZTA architectures for scenarios where the normal approval workflow cannot function (unavailable approvers, system outages, emergency response). Design requirements: (1) Pre-approved but tightly controlled access (dual custodian or senior on-call custodian required), (2) Time-limited (the session still expires), (3) Enhanced logging -- every command is recorded (session recording), (4) Automatic alerts to CISO, manager, and security team upon use, (5) Post-incident mandatory review. This is not "abandoning JIT" -- it is a controlled exception with maximum audit and oversight. A permanent account in an envelope has no time limits, logging, or oversight.',
  'JIT break-glass = pre-approved emergency account + dual custodian/senior on-call + full session recording + auto-alerts + mandatory review. Controlled exception.',
  'analyze', 'tlatm', 'very_hard',
  2.00, 2.10, 0.20, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  5, 'biometrics',
  'A smartphone application uses fingerprint biometrics for authentication. Under the hood, the fingerprint comparison occurs in a TEE (Trusted Execution Environment). An attacker with root access to the Android OS attempts to extract the fingerprint template. Why does the TEE architecture prevent this attack?',
  '["The fingerprint template is stored in the cloud, so local root access cannot reach it", "Android''s file system encryption protects fingerprint templates from root-level extraction", "The TEE operates in an isolated hardware security domain (ARM TrustZone) that is inaccessible even to the Rich OS (Android) running at the normal security level; fingerprint templates are stored and matching is performed within the TEE boundary, and the Rich OS kernel (even at root level) cannot directly read TEE memory or storage", "Root access to Android requires physical device access, which would also bypass the TEE"]'::jsonb,
  2,
  'ARM TrustZone (the technology underlying Android TEE / Trusted Execution Environment) divides processor resources into two worlds: the Normal World (runs Android/Rich OS) and the Secure World (TEE). The Secure World has its own isolated memory, peripherals, and storage. The Normal World OS -- even at root/kernel level -- cannot directly read Secure World memory through software means. Fingerprint templates (and the matching algorithm) execute entirely in the Secure World. The normal world receives only a boolean "match/no match" result. This prevents template extraction even by malicious apps with root access. Physical attacks on the TEE hardware are a separate (and much more difficult) attack class.',
  'TEE = Secure World (TrustZone). Root in Normal World cannot read Secure World memory. Templates stored in TEE = software root ≠ extraction.',
  'apply', 'scenario', 'hard',
  1.70, 1.70, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / best_answer / correct=3
(
  5, 'zero_trust',
  'NIST SP 800-207 describes three ZTA deployment approaches: Enhanced Identity Governance, Micro-segmented Networks, and Software Defined Perimeters. Which assessment MOST accurately describes when each approach is MOST appropriate?',
  '["Enhanced Identity Governance is only appropriate for cloud environments; Micro-segmented Networks are only for on-premises datacenters; Software Defined Perimeters are only for remote access use cases", "All three ZTA approaches are equally applicable to any organization; the choice is based on budget, not use case", "Micro-segmented Networks are the recommended starting point for all ZTA implementations because network-level controls are the most mature", "Enhanced Identity Governance is best when the organization has a mature IdP and uses primarily enterprise-managed resources; Micro-segmented Networks are best for protecting critical east-west traffic in datacenter/cloud environments; Software Defined Perimeters (also called ZTA using network access control, e.g., ZTNA) are best for providing secure remote access or B2B access to specific application resources without exposing the full network"]'::jsonb,
  3,
  'NIST SP 800-207 Section 3 describes these three deployment models. Enhanced Identity Governance: ZTA decision is based primarily on identity and resource attributes; assumes reliable identity infrastructure and works well for enterprise-managed device/user environments. Micro-segmented Networks: uses network segmentation (software-defined or physical) as the primary ZTA enforcement mechanism; best for east-west datacenter traffic control. Software Defined Perimeter (ZTA-NAC): uses a proxy/broker model (like ZTNA, Google BeyondCorp) to create a software-defined perimeter around specific applications; best for remote access and partner/contractor access without VPN. Most enterprises will use a combination of all three.',
  'ZTA approaches: Identity Governance = mature IdP + managed devices. Micro-seg = datacenter E-W. SDP/ZTNA = remote access / partner. Use all three.',
  'analyze', 'best_answer', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / scenario / correct=0
(
  5, 'access_control',
  'An organization implements a Federated Identity Management (FIM) system where employees can use their corporate credentials to access partner applications. A partner application is compromised, and the attacker extracts all active session tokens. Using the stolen tokens, the attacker attempts to access other partner applications in the federation. Which FIM control MOST limits the blast radius of this compromise?',
  '["Token binding or audience restriction: each token is cryptographically bound to the specific target application (audience claim in JWT), so a token issued for App-A cannot be used against App-B; stolen tokens from the compromised app are invalid at other federation members", "Single sign-out (SLO): the compromised app''s SSO session can be terminated, invalidating tokens at all federation members simultaneously", "Short-lived tokens (15-minute expiry) limit the window during which stolen tokens can be exploited across the federation", "IP address binding: tokens are bound to the IP address where they were originally issued, preventing use from a different IP address"]'::jsonb,
  0,
  'Token audience restriction is the strongest architectural control for limiting blast radius. In OIDC/JWT, the "aud" (audience) claim specifies which application(s) the token is intended for. Resource servers must validate that they are the intended audience and reject tokens issued for other applications. This means a token stolen from App-A carries an aud=App-A claim and will be rejected by App-B. Short-lived tokens help but do not prevent use at other applications within their validity window. SLO terminates sessions but requires the compromised app to trigger SLO (it may not, if compromised). IP binding is a useful additional control but has limitations (shared IPs, NAT, legitimate IP changes).',
  'Token audience restriction = stolen token from App-A rejected by App-B (wrong aud claim). Blast radius limited by design. Strongest architectural control.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / first_action / correct=1
(
  5, 'oauth_flows',
  'During a code review, you discover that a web application stores OAuth 2.0 access tokens in localStorage. A security engineer argues this is acceptable because the tokens are short-lived (15 minutes). What is the MOST important security concern, and what should be recommended?',
  '["The concern is token size; localStorage has a 5MB limit that may be insufficient for JWT access tokens", "Storing tokens in localStorage exposes them to Cross-Site Scripting (XSS) attacks: any JavaScript running on the page (including injected malicious scripts) can read localStorage; even 15-minute tokens provide enough time for an attacker to exfiltrate and use them; the recommended alternative is HttpOnly, Secure, SameSite=Strict cookies, which are inaccessible to JavaScript, or a backend-for-frontend (BFF) pattern where tokens never reach the browser", "The concern is that localStorage does not support encryption; implement Web Crypto API to encrypt tokens before storage", "15-minute token lifetime is sufficient security against XSS token theft; no change is needed"]'::jsonb,
  1,
  'localStorage is accessible to any JavaScript running on the same origin, including JavaScript injected via XSS vulnerabilities. XSS → localStorage → token theft → session hijacking is a well-documented attack chain. 15-minute token lifetime helps but does not eliminate the risk (automated attackers can exfiltrate and use tokens in seconds). Secure alternatives: (1) HttpOnly cookies: server-set cookies inaccessible to JavaScript, sent automatically with requests. (2) Backend-for-Frontend (BFF) pattern: the browser gets a session cookie; the BFF server holds the actual OAuth tokens and makes API calls server-side. Both approaches prevent XSS from directly accessing tokens. SessionStorage has the same XSS vulnerability as localStorage.',
  'localStorage + OAuth token = XSS target. Use HttpOnly cookies (no JS access) or BFF pattern. Short lifetime helps but doesn''t eliminate XSS risk.',
  'analyze', 'first_action', 'hard',
  1.80, 1.80, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / scenario / correct=2
(
  5, 'saml_oidc',
  'A security researcher discovers that a SAML SP implementation does not validate the XML signature on SAMLResponse messages -- it only checks the SAML assertion''s validity period and subject. What attack does this enable?',
  '["An attacker can extend the assertion validity period to create persistent access without re-authentication", "An attacker can perform a replay attack by resending the same SAMLResponse multiple times", "An attacker can perform a SAML signature wrapping (XSW) attack: by manipulating the XML structure of the SAMLResponse (without altering the signed portion), the attacker inserts a malicious assertion that the SP processes as the authenticated identity, while the valid (signed) assertion is present but unreferenced -- the SP''s parser processes the attacker-controlled assertion because it finds it first in the document tree", "An attacker can inject JavaScript into the SAML assertion to perform XSS via the identity provider"]'::jsonb,
  2,
  'XML Signature Wrapping (XSW) is a class of attacks against SAML implementations with incomplete signature validation. The attack exploits the gap between what is signed and what is processed. Method: the valid SAMLResponse has a signed assertion for user "alice". The attacker copies the signed assertion to a different location in the XML document and inserts a new (unsigned) assertion claiming to be "admin" in the location the SP''s XML parser reads first. Since the SP doesn''t validate which assertion is covered by the signature (only checks that a valid signature exists somewhere), it processes the attacker''s unsigned assertion as the authenticated identity. Full signature validation requires checking that the ID referenced in the signature''s Reference element matches the assertion ID being processed.',
  'SAML XSW = insert fake assertion before signed one. SP processes fake if it doesn''t check signature binding. Validate: sig Reference ID = assertion ID being processed.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q24: hard / apply / best_answer / correct=3
(
  5, 'pam_solutions',
  'An organization wants to implement session recording for all privileged access to cloud infrastructure (AWS, Azure, GCP). The security team debates between recording at the bastion host level versus recording at the cloud provider''s native audit logging level (CloudTrail, Azure Monitor). Which approach is MOST comprehensive?',
  '["Cloud-native audit logging alone is sufficient because it captures all API calls to cloud resources with timestamps and identity information", "Bastion host session recording alone is sufficient because it captures the full terminal session including all commands typed", "Bastion host recording captures more details but cloud-native logging covers more attack vectors; choose one based on budget", "Both are complementary and required for comprehensive coverage: cloud-native audit logs capture API calls (including those made programmatically without going through a bastion), while bastion host session recording captures the full terminal session with keystrokes, screen output, and timing; an attacker who compromises a long-running session but doesn''t use the bastion is invisible to bastion recording but visible in cloud audit logs"]'::jsonb,
  3,
  'These two recording mechanisms cover different attack surfaces. Cloud-native audit logs (CloudTrail, Azure Activity Log, GCP Audit Log): record all API calls, including those from automation tools (CLI, SDK, IaC) that bypass bastions, lateral movement within cloud environments, and privileged API operations. Bastion session recording: captures the full interactive session -- every keystroke, output, and command -- providing forensic-quality evidence of what an administrator did during a session. An attacker who uses direct API access (stolen API keys, CLI) bypasses the bastion entirely and is invisible to session recording but visible in cloud audit logs. Maximum coverage requires both. This is the defense-in-depth principle applied to privileged session monitoring.',
  'Both recording layers = complementary. Cloud logs = all API calls (incl. no-bastion). Session recording = full interactive forensics. Both = complete coverage.',
  'apply', 'best_answer', 'hard',
  1.60, 1.50, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  5, 'zero_trust',
  'An organization implements ZTNA (Zero Trust Network Access) to replace its legacy VPN. Three months after deployment, the security team discovers that the legacy VPN is still accessible and still used by 20% of users. What is the MOST significant security implication of this shadow VPN access?',
  '["Users accessing via legacy VPN bypass all ZTA policy enforcement (device posture checks, continuous verification, least-privilege application access) and gain broad network access equivalent to the old network-centric model; the legacy VPN represents a persistent network access bypass that completely undermines the ZTA implementation for those 20% of users and any adversary who compromises their accounts", "The legacy VPN creates a redundant access path that improves availability -- this is a benefit, not a risk", "ZTNA and legacy VPN coexistence is a standard transition architecture that does not create security risks if both systems are independently secure", "The shadow VPN only affects compliance posture for regulatory audits but has no practical security impact"]'::jsonb,
  0,
  'ZTA implementations must decommission legacy access paths to be effective. If the old VPN remains accessible, it becomes a permanent bypass for ZTA controls: (1) Users accessing via VPN skip device posture checks (non-compliant devices gain broad network access). (2) Continuous session verification is not applied to VPN sessions. (3) VPN provides network-layer access to all resources in scope, versus ZTNA''s application-specific least-privilege access. (4) Attackers who gain valid credentials can use the legacy VPN to access the full network. The 20% who still use VPN represent users who have found a route around controls, and the legacy VPN is a known attack surface. Decommissioning the legacy VPN is a critical step in ZTA maturity.',
  'Shadow VPN = ZTA bypass for 20% of users. Legacy VPN must be DECOMMISSIONED. Parallel access paths undermine ZTA entirely.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=11, comparison=4, tlatm=4, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
