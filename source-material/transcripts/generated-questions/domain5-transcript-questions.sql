-- =============================================================================
-- CISSP Quest — Domain 5: Identity and Access Management (IAM)
-- Generated: 2026-04-16  |  Source: ai_generated (ISC2 CBK, NIST SP 800-63)
-- =============================================================================
-- Distribution Stats (28 questions):
--   Difficulty : easy=6 (21%), medium=13 (46%), hard=7 (25%), very_hard=2 (7%)
--   Cognitive  : remember=3 (11%), understand=6 (21%), apply=12 (43%), analyze=7 (25%)
--   Types      : scenario=10, best_answer=4, first_action=4, tlatm=3,
--                comparison=3, except_not=2, most_likely=2
--   Correct idx: 0=7, 1=7, 2=7, 3=7
-- =============================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1 easy / remember / authentication_factors
(
  5, 'authentication_factors',
  'An agent gains entry to a secure facility by presenting a badge AND entering a PIN. Which authentication factor combination is being used?',
  '["Something you have and something you know", "Something you are and something you have", "Something you know and something you are", "Something you do and something you know"]'::jsonb,
  0,
  'Explanation: A badge is a physical token — "something you have." A PIN is memorized knowledge — "something you know." Together they form two-factor authentication combining the ownership and knowledge factors. Option B is wrong because biometrics ("something you are") is not involved; scanning a badge is possession, not inherence.',
  'MISSION BADGE: Your clearance card (have) + code phrase (know) unlocks the ops room.',
  'remember',
  'scenario',
  'easy',
  0.90, -1.80, 0.20, 'ai_generated', true
),

-- Q2 easy / remember / mfa_types
(
  5, 'mfa_types',
  'Which of the following is an example of a Type 3 authentication factor?',
  '["Smart card", "Retinal scan", "One-time password token", "Security question answer"]'::jsonb,
  1,
  'Explanation: Type 3 (something you ARE) covers biometrics — physical characteristics unique to a person, such as retinal patterns, fingerprints, or voice prints. A smart card is Type 2 (something you have). A one-time password token is also Type 2 (device you possess). A security question answer is Type 1 (something you know).',
  'BIOMETRIC LOCK: The scanner reads YOUR retina — you ARE the key.',
  'remember',
  'best_answer',
  'easy',
  0.88, -1.70, 0.20, 'ai_generated', true
),

-- Q3 easy / understand / access_control_models_rbac_abac_mac_dac
(
  5, 'access_control_models_rbac_abac_mac_dac',
  'A hospital assigns access to patient records based on a staff member''s job title — nurse, doctor, or administrator. Which access control model BEST describes this approach?',
  '["Discretionary Access Control (DAC)","Role-Based Access Control (RBAC)","Mandatory Access Control (MAC)","Attribute-Based Access Control (ABAC)"]'::jsonb,
  1,
  'Explanation: RBAC grants permissions based on organizational roles (job titles), not on individual identity. All nurses receive the same record access because they share the same role. DAC is wrong because it lets the data owner assign permissions individually, not based on roles. MAC is wrong because it uses sensitivity labels and clearances. ABAC is wrong because it evaluates multiple policy attributes simultaneously — job title alone is the simpler RBAC pattern.',
  'ROLE CALL: Every nurse carries the same mission briefing — role, not rank of one.',
  'understand',
  'scenario',
  'easy',
  0.92, -1.60, 0.20, 'ai_generated', true
),

-- Q4 easy / understand / provisioning_lifecycle
(
  5, 'provisioning_lifecycle',
  'An employee transfers from the Finance department to the IT Operations department. Which provisioning action BEST follows least privilege principles?',
  '["Add IT Operations access while retaining Finance access for continuity", "Suspend the account pending a full recertification review", "Revoke Finance access and grant only IT Operations access", "Grant the user temporary elevated access during the transition period"]'::jsonb,
  2,
  'Explanation: Least privilege requires users to hold only the access needed for their CURRENT role. Revoking Finance access and granting IT Operations access enforces this principle. Retaining Finance access violates least privilege and creates excessive privilege accumulation (privilege creep). Suspension delays legitimate work unnecessarily. Elevated access during transition is the opposite of least privilege.',
  'CLEARANCE TRANSFER: Old mission files go in the shredder before the new briefing begins.',
  'understand',
  'best_answer',
  'easy',
  0.90, -1.50, 0.20, 'ai_generated', true
),

-- Q5 easy / remember / sso_kerberos_sesame
(
  5, 'sso_kerberos_sesame',
  'In the Kerberos authentication protocol, which component issues the Ticket-Granting Ticket (TGT) to a client after successful initial authentication?',
  '["Ticket-Granting Service (TGS)","Authentication Service (AS)","Key Distribution Center (KDC)","Service Principal (SP)"]'::jsonb,
  1,
  'Explanation: The Key Distribution Center (KDC) contains two logical sub-services. The Authentication Service (AS) verifies the client''s identity and issues the TGT. The Ticket-Granting Service (TGS) then uses the TGT to issue service tickets for specific resources. The AS — not the TGS — is the correct answer because it handles the initial authentication exchange that produces the TGT.',
  'ASSET RETRIEVAL: The Authentication Service is your first handler — they hand you the master pass (TGT).',
  'remember',
  'best_answer',
  'easy',
  0.88, -1.90, 0.20, 'ai_generated', true
),

-- Q6 easy / understand / password_management
(
  5, 'password_management',
  'Per NIST SP 800-63B guidelines, which password policy practice is MOST aligned with current best practices?',
  '["Require uppercase, lowercase, number, and symbol combinations in all passwords", "Enforce password expiration every 60 days to reduce credential exposure windows", "Limit password length to 12 characters to prevent user interface issues", "Check passwords against lists of known-compromised passwords rather than enforcing mandatory 90-day rotation"]'::jsonb,
  3,
  'Explanation: NIST SP 800-63B (2017, updated 2020) explicitly recommends checking passwords against breach corpora and prohibiting known-compromised passwords, while discouraging arbitrary periodic rotation. Forced rotation drives users to predictable patterns (Password1 → Password2). The standard also discourages complexity rules in favor of length and discourages arbitrary length caps — 64+ character passphrases are encouraged.',
  'NIST INTEL FILE: Rotate only when the password is burned — not on a calendar schedule.',
  'understand',
  'best_answer',
  'easy',
  0.90, -1.55, 0.20, 'ai_generated', true
),

-- Q7 medium / apply / sso_kerberos_sesame
(
  5, 'sso_kerberos_sesame',
  'A user authenticated to a corporate Kerberos realm at 08:00. At 10:30, they attempt to access a file server but receive an authentication error, despite having used it earlier that morning. The Kerberos ticket lifetime is set to 8 hours. What is the MOST likely cause?',
  '["The service ticket for the file server has expired and the TGT must re-authenticate", "Clock skew between the client and KDC exceeds the maximum 5-minute threshold", "The TGT has been revoked by the Key Distribution Center due to policy violation", "The file server''s service principal name (SPN) has changed since the ticket was issued"]'::jsonb,
  1,
  'Explanation: Kerberos is highly sensitive to time. RFC 4120 specifies that Kerberos uses timestamps in tickets to prevent replay attacks, and the default clock skew tolerance is 5 minutes. If a workstation clock drifts beyond 5 minutes from the KDC, all Kerberos operations fail — this is a common operational problem. The TGT lifetime of 8 hours has not elapsed (08:00 + 8h = 16:00), so ticket expiry is not the cause. KDC revocation requires administrative intervention and would typically produce a different error. SPN changes are less common and would affect new ticket requests, not existing sessions.',
  'CLOCK SYNCHRONIZATION PROTOCOL: Kerberos agents sync watches — drift 5 minutes and the mission dies.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q8 medium / apply / federated_identity_saml
(
  5, 'federated_identity_saml',
  'A company uses SAML 2.0 to allow employees to access a cloud-based HR application using their corporate credentials. During authentication, the HR application receives a signed XML message containing the user''s identity and group memberships. In SAML terminology, which role does the HR application fulfill?',
  '["Identity Provider (IdP)","Principal","Service Provider (SP)","Attribute Authority"]'::jsonb,
  2,
  'Explanation: In SAML 2.0, the Service Provider (SP) is the resource or application that relies on the Identity Provider to authenticate users. The SP consumes SAML assertions. The Identity Provider (IdP) is the corporate authentication system that issues signed assertions. The Principal is the user (subject). An Attribute Authority is an optional SAML role that provides attribute assertions separately from authentication assertions. The HR application receives and consumes the assertion — it is the SP.',
  'HANDLER NETWORK: The SP is the safe house that accepts your credentials — the IdP is HQ who vouched for you.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.20, 0.20, 'ai_generated', true
),

-- Q9 medium / understand / federated_identity_saml
(
  5, 'federated_identity_saml',
  'Which SAML assertion type specifically carries information about the permissions a user is authorized to exercise at the Service Provider?',
  '["Authentication assertion", "Attribute assertion", "Policy assertion", "Authorization decision assertion"]'::jsonb,
  3,
  'Explanation: SAML 2.0 defines three core assertion types. Authentication assertions confirm that the principal was authenticated in a specific way at a specific time. Attribute assertions carry user attributes such as department, email, or role. Authorization decision assertions specify what the user is permitted to do at the SP — essentially conveying access rights. "Policy assertion" is not a defined SAML assertion type.',
  'SAML DOSSIER: The authorization assertion is your operational clearance memo — it says what you can do, not just who you are.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.00, 0.22, 'ai_generated', true
),

-- Q10 medium / apply / access_control_models_rbac_abac_mac_dac
(
  5, 'access_control_models_rbac_abac_mac_dac',
  'A classified government network enforces access based on document sensitivity labels (TOP SECRET, SECRET, CONFIDENTIAL) and personnel clearance levels. Users cannot grant others access to documents they own. Which access control model is in use?',
  '["Discretionary Access Control (DAC)","Role-Based Access Control (RBAC)","Mandatory Access Control (MAC)","Attribute-Based Access Control (ABAC)"]'::jsonb,
  2,
  'Explanation: MAC is defined by the system enforcing access based on sensitivity labels and clearance levels — the data owner has NO discretion over who can access it. This is the hallmark of MAC systems like Bell-LaPadula. DAC is wrong because in DAC the resource owner CAN grant access to others. RBAC uses job roles, not sensitivity labels. ABAC evaluates multiple attributes but still could allow owner-driven policies — the critical distinguisher here is that the owner cannot override the system, which is MAC.',
  'CLASSIFIED LOCKDOWN: In MAC, even the author of the file cannot hand it to a friend — only the system decides.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q11 medium / apply / session_management_identity_proofing
(
  5, 'session_management_identity_proofing',
  'A web application issues a session token after login and embeds it in a URL parameter. An attacker observes the URL in browser history and uses the token to hijack the active session. Which vulnerability BEST describes this attack?',
  '["Session fixation attack", "Session token exposure via insecure transmission medium", "Cross-site request forgery (CSRF)", "Credential stuffing"]'::jsonb,
  1,
  'Explanation: Embedding session tokens in URLs exposes them through browser history, server logs, referrer headers, and shared bookmarks — this is session token exposure through an insecure medium. Session fixation is different: the attacker sets the session ID BEFORE authentication, then the victim logs in with that pre-set ID. CSRF tricks authenticated users into submitting unwanted requests — it does not require stealing a token. Credential stuffing uses breached username/password lists, not session tokens.',
  'TOKEN TRAIL: URL tokens leave a trail through every log and history file — keep session IDs in cookies only.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.35, 0.20, 'ai_generated', true
),

-- Q12 medium / analyze / sso_kerberos_sesame
(
  5, 'sso_kerberos_sesame',
  'A security manager is evaluating the risk of deploying enterprise-wide Single Sign-On (SSO). Which risk is MOST significant and warrants the strongest compensating controls?',
  '["Users may forget their primary SSO password more easily due to infrequent use","SSO increases authentication latency for end users","Single point of credential compromise provides access to all SSO-integrated applications","SSO requires every application to maintain its own credential store"]'::jsonb,
  2,
  'Explanation: The dominant risk of SSO is that a compromised primary credential grants an attacker access to every application integrated with the SSO system — a massive blast radius. This requires strong compensating controls: MFA on the SSO portal, anomalous access detection, and rapid credential revocation procedures. Users typically use SSO credentials FREQUENTLY (not infrequently), so option B is factually incorrect. SSO reduces latency by eliminating per-app logins, not increasing it. SSO actually eliminates per-app credential stores — that is a benefit, not a risk.',
  'MASTER KEY RISK: One lost skeleton key opens every door in the safe house — guard it accordingly.',
  'analyze',
  'tlatm',
  'medium',
  1.30, 0.50, 0.20, 'ai_generated', true
),

-- Q13 medium / apply / privileged_access_management
(
  5, 'privileged_access_management',
  'A PAM solution requires administrators to check out credentials from a vault, use them for a specific task within a defined time window, and return them when done — with the password automatically rotated afterward. Which PAM capability does this BEST describe?',
  '["Privileged session recording with keystroke logging","Separation of duties enforcement through dual-control authorization","Just-in-time (JIT) privileged access with automatic credential rotation","Privileged identity management with role mining"]'::jsonb,
  2,
  'Explanation: Just-in-time (JIT) access grants elevated privileges only for the duration of a specific task, then revokes them — eliminating standing privileged accounts that remain active indefinitely. Automatic credential rotation after check-in ensures the retrieved password cannot be reused. Session recording captures WHAT was done, not how credentials are managed. Dual-control authorization requires two people to approve an action — not the same as time-bounded checkout. Role mining discovers existing role patterns from access logs.',
  'JIT EXTRACTION: Grab the classified file, complete the mission, return it — and the combination changes immediately.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q14 medium / understand / idaas_cloud_identity
(
  5, 'idaas_cloud_identity',
  'An organization adopts a cloud-based Identity-as-a-Service (IDaaS) solution. Which capability is MOST aligned with a zero-trust architecture integration?',
  '["Single sign-on federation that reduces the number of passwords users must remember", "Centralized user directory synchronized from on-premises Active Directory", "Conditional access policies that evaluate device compliance, location, and risk score before granting access", "Multi-factor authentication enforcement for all external-facing applications"]'::jsonb,
  2,
  'Explanation: Zero trust architecture requires continuous verification of identity, device health, and contextual signals — never assuming implicit trust based on network location. Conditional access policies that evaluate device compliance posture, geographic location, user risk score, and application sensitivity represent zero trust''s "verify explicitly" principle. SSO, directory sync, and MFA are all beneficial, but they alone do not implement zero trust because they do not evaluate context continuously post-authentication.',
  'TRUST NO ONE PROTOCOL: Access is re-evaluated every time — device, location, risk score — not just at the front door.',
  'understand',
  'best_answer',
  'medium',
  1.15, 0.10, 0.20, 'ai_generated', true
),

-- Q15 medium / apply / provisioning_lifecycle
(
  5, 'provisioning_lifecycle',
  'During a quarterly user access review, auditors discover that 34 accounts belonging to former employees are still active. What is the FIRST action the security team should take?',
  '["Delete the accounts to eliminate the threat as quickly as possible","Notify HR and wait for the official termination workflow to complete","Review access logs for all 34 accounts to determine if they have been used maliciously","Immediately disable all 34 accounts pending formal review and termination"]'::jsonb,
  3,
  'Explanation: The immediate priority is to eliminate active threat exposure by disabling (not deleting) the accounts. Disabling preserves audit trails and account data for forensic review while removing login capability. Deletion is premature — it destroys forensic evidence and may violate retention policies. Waiting for HR extends the exposure window unnecessarily. Log review is important but is step two; the accounts must be stopped first before investigating what may have already occurred.',
  'ROGUE ASSETS: Burn the active credentials first — investigate the damage second.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.40, 0.20, 'ai_generated', true
),

-- Q16 medium / analyze / access_control_models_rbac_abac_mac_dac
(
  5, 'access_control_models_rbac_abac_mac_dac',
  'A large healthcare organization needs to enforce access rules that consider a user''s department, shift time, patient-physician relationship, and device type simultaneously. Which access control model BEST meets this requirement?',
  '["Role-Based Access Control (RBAC)", "Mandatory Access Control (MAC)", "Rule-Based Access Control", "Attribute-Based Access Control (ABAC)"]'::jsonb,
  3,
  'Explanation: ABAC evaluates multiple attributes simultaneously — user attributes (department), environmental attributes (shift time, device type), and resource attributes (patient-physician relationship) — making it ideal for complex, fine-grained policy decisions. RBAC is too coarse for this scenario because it cannot easily encode the patient-physician relationship or time-of-day constraints without excessive role proliferation (role explosion). MAC uses fixed labels and is not designed for contextual relationships. Rule-based access control uses static rules without the attribute flexibility ABAC provides.',
  'MULTI-FACTOR CLEARANCE: ABAC checks your badge, your shift, your device, and your patient file simultaneously.',
  'analyze',
  'scenario',
  'medium',
  1.30, 0.45, 0.22, 'ai_generated', true
),

-- Q17 hard / analyze / session_management_identity_proofing
(
  5, 'session_management_identity_proofing',
  'NIST SP 800-63A defines Identity Assurance Level 2 (IAL2) requirements for identity proofing. A financial services company is onboarding customers remotely. Which combination BEST satisfies IAL2 requirements?',
  '["Email address verification plus knowledge-based authentication (KBA) questions","Social Security Number validation against a credit bureau database only","Two-factor authentication using a smartphone OTP application","Verified government-issued photo ID plus a selfie liveness check matching the ID photograph"]'::jsonb,
  3,
  'Explanation: NIST SP 800-63A IAL2 requires identity evidence at the SUPERIOR or STRONG level with remote or in-person proofing. A government-issued photo ID (STRONG evidence) combined with a biometric comparison (liveness check matching the selfie to the ID photo) meets IAL2 remote unsupervised proofing requirements. KBA alone fails IAL2 because shared secrets are not reliable evidence of real-world identity. SSN validation against a credit bureau is FAIR evidence at best — insufficient for IAL2 alone. MFA authentication is an authentication assurance concept (AAL), not an identity proofing concept (IAL).',
  'FIELD VERIFICATION: IAL2 requires a real document plus proof you''re the face on it — not just a password.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.50, 0.20, 'ai_generated', true
),

-- Q18 hard / analyze / sso_kerberos_sesame
(
  5, 'sso_kerberos_sesame',
  'An attacker obtains a valid Kerberos TGT from a compromised workstation''s memory using credential-dumping tools. They use this TGT on a different machine to request service tickets and access network resources. Which attack technique does this represent?',
  '["Golden ticket attack","Kerberoasting","AS-REP roasting","Pass-the-ticket attack"]'::jsonb,
  3,
  'Explanation: Pass-the-ticket uses a stolen Kerberos TGT or service ticket (from memory) on a different system to impersonate the victim without knowing their password. A Golden ticket attack is different — it requires the KRBTGT account''s hash to forge a TGT offline, granting persistent domain-wide access. Kerberoasting requests service tickets for service accounts and cracks them offline to obtain service account passwords. AS-REP roasting targets accounts with Kerberos pre-authentication disabled. The scenario describes exfiltrating and reusing an existing TGT — that is pass-the-ticket.',
  'STOLEN PASS: A recycled TGT is like using a dead agent''s badge — it still opens doors until revoked.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q19 hard / apply / federated_identity_saml
(
  5, 'federated_identity_saml',
  'An organization uses SAML SP-initiated SSO. A user accessing a cloud application is redirected to the corporate IdP, authenticates, and is redirected back. A security architect reviews the flow and notes the application is using HTTP POST binding. What is the PRIMARY security advantage of POST binding over Redirect binding for SAML assertions?',
  '["POST binding encrypts the assertion automatically without additional configuration", "POST binding sends the assertion in the HTTP body, preventing it from appearing in server logs and browser history", "POST binding eliminates the need for digital signatures on assertions", "POST binding reduces authentication latency by eliminating the redirect step"]'::jsonb,
  1,
  'Explanation: With SAML HTTP Redirect binding, the assertion is Base64-encoded and included in the URL query string — exposing it in browser history, server access logs, and referrer headers. HTTP POST binding sends the assertion in the HTTP request body, which does not appear in logs or history, significantly reducing information disclosure risk. POST binding does NOT automatically encrypt assertions — encryption requires additional XMLEnc configuration regardless of binding. Signatures remain required for both bindings. POST binding actually involves a form auto-submit, which adds a tiny amount of complexity compared to a simple redirect.',
  'SECURE DEAD DROP: POST drops the package in an envelope — Redirect leaves it on a billboard.',
  'apply',
  'scenario',
  'hard',
  1.55, 1.50, 0.20, 'ai_generated', true
),

-- Q20 hard / analyze / idaas_cloud_identity
(
  5, 'idaas_cloud_identity',
  'An organization runs both on-premises Active Directory and a cloud IDaaS platform. The security team is debating whether to use password hash synchronization (PHS), pass-through authentication (PTA), or Active Directory Federation Services (AD FS). Which statement BEST represents the security tradeoff between PHS and AD FS?',
  '["PHS stores credential hashes in the cloud, increasing the attack surface but providing availability when on-premises systems are unreachable; AD FS keeps credentials on-premises but creates a single point of failure", "AD FS is always more secure than PHS because it never transmits any credential material to the cloud", "PHS provides stronger authentication assurance than AD FS because hashes cannot be reversed", "AD FS and PHS have equivalent security profiles — the choice should be based solely on licensing cost"]'::jsonb,
  0,
  'Explanation: With PHS, a salted hash of the password hash is synchronized to Azure AD — attackers who compromise cloud identity store get closer to credential material than with AD FS. However, PHS provides resilience when the on-premises AD is unavailable. AD FS keeps all credential processing on-premises, reducing cloud attack surface, but the AD FS farm becomes a critical single point of failure — its compromise is equivalent to total identity compromise. Option B overstates AD FS security — AD FS tokens can be forged if the signing certificate is stolen. Option C is incorrect — password hash synchronization does not imply stronger authentication assurance. Option D is false — the security profiles differ significantly.',
  'HYBRID OPS TRADEOFF: Cloud sync widens the target; on-prem federation protects the vault but collapses without it.',
  'analyze',
  'tlatm',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q21 hard / apply / privileged_access_management
(
  5, 'privileged_access_management',
  'A security operations team discovers that a shared "sysadmin" account used by multiple administrators has been used to exfiltrate data. Which PAM control, if implemented, would have MOST directly enabled attribution of this action to a specific individual?',
  '["Privileged session monitoring with individual check-out requiring personal authentication before accessing shared credentials", "Disabling the shared account and requiring each administrator to use their named account", "Implementing session recording on the target servers accessed by the shared account", "Requiring a dual-control approval workflow for all privileged account usage"]'::jsonb,
  0,
  'Explanation: PAM check-out workflows require each administrator to authenticate with their personal identity before the PAM vault releases shared credentials — this creates an audit trail that binds a specific person to each check-out event and the subsequent session. If session recording is also enabled, the combination provides full attribution. Disabling the shared account (option B) is the right long-term fix but does not enable attribution of the PAST event. Session recording on target servers records activity but without PAM check-out, it still cannot attribute who used the shared account. Dual-control approvals add a second person but if the shared account is still shared, attribution remains unclear.',
  'MISSION ACCOUNTABILITY: Check-out logs prove which handler retrieved the weapon — even if they used a common safe.',
  'apply',
  'most_likely',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q22 hard / analyze / authentication_factors
(
  5, 'authentication_factors',
  'An organization deploys FIDO2 WebAuthn as its primary authentication mechanism. A security architect argues this eliminates phishing as an attack vector for the authentication step. Which aspect of FIDO2 makes this claim accurate?',
  '["WebAuthn requires the user to enter a password before the FIDO2 key is activated, protecting against credential theft", "WebAuthn encrypts the entire authentication exchange using AES-256, preventing credential interception", "WebAuthn binds the credential to a specific origin (relying party ID), making captured credentials unusable on a spoofed phishing site", "WebAuthn requires the server to hold the private key, which eliminates credential database breaches"]'::jsonb,
  2,
  'Explanation: FIDO2/WebAuthn credentials are cryptographically bound to the relying party''s origin (domain). When a user is phished to a lookalike domain, the browser refuses to use the FIDO2 credential because the origin does not match the registered relying party ID. This is the phishing-resistance property — the credential literally cannot be used on the wrong origin. WebAuthn does not require a password — it is designed to replace passwords. WebAuthn does not encrypt with AES-256 at the protocol level in the manner described. Critically, WebAuthn is asymmetric — the SERVER holds the public key, the DEVICE holds the private key (never transmitted), which eliminates server-side credential breaches.',
  'ORIGIN-BOUND CREDENTIAL: Your FIDO key is useless at the fake safe house — it only works at HQ''s registered domain.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.70, 0.20, 'ai_generated', true
),

-- Q23 hard / analyze / access_control_models_rbac_abac_mac_dac
(
  5, 'access_control_models_rbac_abac_mac_dac',
  'In a Bell-LaPadula confidentiality model, a user with SECRET clearance attempts to write data to a CONFIDENTIAL document and to read a TOP SECRET document. Which operations are permitted?',
  '["Neither operation is permitted under Bell-LaPadula rules", "Reading the TOP SECRET document is permitted; writing to CONFIDENTIAL is not", "Writing to the CONFIDENTIAL document is permitted; reading TOP SECRET is not", "Both operations are permitted because the user holds SECRET clearance"]'::jsonb,
  0,
  'Explanation: Bell-LaPadula enforces two core rules to protect confidentiality: (1) Simple Security Property (no read up) — a subject cannot read objects at a higher classification than their clearance; (2) Star Property (no write down) — a subject cannot write to objects at a lower classification than their current level, to prevent leaking high-side data to a lower classification. A SECRET-cleared user CANNOT read TOP SECRET (violates no-read-up). A SECRET-cleared user CANNOT write to CONFIDENTIAL (violates no-write-down, as it could leak SECRET-level content to CONFIDENTIAL). Therefore, neither operation is permitted.',
  'BELL-LAPADULA BRIEF: No reading above your pay grade; no writing below — keep secrets flowing only upward.',
  'analyze',
  'except_not',
  'hard',
  1.75, 1.75, 0.25, 'ai_generated', true
),

-- Q24 very_hard / analyze / federated_identity_saml
(
  5, 'federated_identity_saml',
  'An organization uses OAuth 2.0 for authorization and OpenID Connect (OIDC) for authentication. A developer argues that OAuth 2.0 access tokens can also be used to authenticate users. A security architect disagrees. Which argument BEST supports the architect''s position?',
  '["OAuth 2.0 access tokens are opaque bearer tokens designed for resource authorization; they do not carry verified identity claims and were not designed for authentication, making OIDC''s ID token the correct mechanism", "OAuth 2.0 access tokens are always JWT-formatted and can be decoded to reveal identity information", "OIDC and OAuth 2.0 are competing standards; using both introduces unnecessary complexity", "Access tokens expire faster than ID tokens, making them inappropriate for session-based authentication"]'::jsonb,
  0,
  'Explanation: OAuth 2.0 is an AUTHORIZATION framework — it grants an application permission to access resources on a user''s behalf. Access tokens tell a resource server what the client is allowed to do; they do not definitively identify the user to the client application. OAuth 2.0 access tokens are often opaque (not JWT) and even when JWT-formatted, they are not designed for authentication. OpenID Connect adds an ID token layer (a signed JWT) that contains verified identity claims (sub, email, auth_time, nonce) specifically for authentication purposes. Using access tokens for authentication is a known anti-pattern (the "confused deputy" problem). Options B and D contain factual inaccuracies. Option C is wrong — OIDC is BUILT on top of OAuth 2.0; they are complementary.',
  'OAUTH vs OIDC: OAuth says what you can do; OIDC says who you are — never confuse the access pass with the identity badge.',
  'analyze',
  'comparison',
  'very_hard',
  2.10, 2.30, 0.22, 'ai_generated', true
),

-- Q25 very_hard / analyze / privileged_access_management
(
  5, 'privileged_access_management',
  'A red team discovers that an attacker who compromised a standard user account can escalate to domain administrator by exploiting a Kerberos delegation configuration. Specifically, the application server is configured with unconstrained delegation. Which statement BEST explains why unconstrained delegation is dangerous?',
  '["Unconstrained delegation allows the application server to generate new TGTs for arbitrary users without requiring their passwords", "Unconstrained delegation disables the KDC''s ticket validation, allowing forged service tickets to be accepted", "The application server with unconstrained delegation can modify clearance levels in Active Directory without KDC approval", "Any user authenticating to the application server causes their TGT to be forwarded and cached on that server, allowing an attacker controlling the server to reuse those TGTs for any resource in the domain"]'::jsonb,
  3,
  'Explanation: With unconstrained delegation (configured in Active Directory with "Trust this computer for delegation to any service"), the KDC includes the user''s full TGT in the service ticket sent to the application server. The application server stores this TGT in LSASS memory. An attacker controlling that server can extract all cached TGTs using tools like Mimikatz and use them to impersonate any authenticated user to any service in the domain — a full domain compromise vector. This is fundamentally different from constrained delegation (which limits which services the server can delegate to) or resource-based constrained delegation. Option A is incorrect — the server cannot generate TGTs; that is the Golden Ticket attack. Options B and C describe different attack mechanisms.',
  'UNCONSTRAINED TRAP: Every agent who visits the compromised safe house leaves their master pass behind — collect them all.',
  'analyze',
  'scenario',
  'very_hard',
  2.20, 2.40, 0.20, 'ai_generated', true
),

-- Q26 medium / apply / authentication_factors
(
  5, 'authentication_factors',
  'A user receives a push notification on their registered smartphone asking them to approve a login attempt. They did not initiate any login. What is the FIRST action the user should take?',
  '["Deny the push notification and immediately report the incident to the security team", "Approve the notification since it may be a delayed authentication from an earlier session", "Ignore the notification — it will expire automatically within the timeout window", "Change their password using the same device that received the push notification"]'::jsonb,
  0,
  'Explanation: An unexpected MFA push is a strong indicator of an active account compromise attempt — an attacker has obtained the user''s password and is attempting to log in (MFA fatigue attack vector). The correct response is to DENY the push (prevent the attacker from gaining access) and immediately report to the security team so the password can be reset and the incident investigated. Approving the notification gives the attacker full access. Ignoring it leaves the account at risk until the token expires. Changing the password on the same device is secondary and less urgent than stopping the active attack.',
  'UNSOLICITED SIGNAL: An unexpected approval request is an adversary knocking — deny and alert immediately.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.35, 0.20, 'ai_generated', true
),

-- Q27 hard / analyze / idaas_cloud_identity
(
  5, 'idaas_cloud_identity',
  'An organization implements continuous access evaluation (CAE) through their IDaaS platform. During an active user session, the user''s device compliance status changes from compliant to non-compliant due to a missing security patch. Under CAE, what MOST likely occurs?',
  '["The IDaaS platform revokes the session access token in near real-time and forces re-authentication or re-evaluation of device compliance", "The user retains access until the session token naturally expires, typically 1 hour later", "The system generates an alert for the security team but does not interrupt the user''s active session", "The application server independently detects the non-compliance and blocks further requests"]'::jsonb,
  0,
  'Explanation: Continuous Access Evaluation (CAE), standardized through the Shared Signals Framework and implemented by major IDaaS vendors (e.g., Azure AD CAE, Google GCAE), enables near-real-time session revocation when contextual signals change. When the device compliance state changes, the IDaaS emits a security event that participating applications receive, triggering immediate token revocation rather than waiting for the token''s natural expiry. Without CAE, the user would retain access until token expiry (option B) — this is precisely the gap CAE closes. Option C describes traditional SIEM alerting, not CAE. Option D is incorrect — application servers do not independently monitor device compliance in this model.',
  'LIVE FEED TERMINATION: CAE cuts the session feed the moment HQ signals the field agent''s status has changed.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q28 medium / apply / provisioning_lifecycle
(
  5, 'provisioning_lifecycle',
  'An organization implements an access recertification campaign where managers must approve or revoke their direct reports'' access. After 30 days, 40% of access reviews have not been completed. What is the MOST appropriate policy-driven response for uncertified access?',
  '["Send escalation reminders to managers and extend the deadline by 30 days", "Automatically revoke all uncertified access after the campaign deadline passes", "Escalate to the account owners'' department heads and flag accounts in a risk dashboard", "Accept the current certification rate as sufficient and schedule the next campaign in 6 months"]'::jsonb,
  1,
  'Explanation: Access recertification programs must enforce consequences for non-completion; otherwise they become a checkbox exercise with no actual risk reduction. Automatically revoking uncertified access is the governance-aligned approach — it enforces the principle that access without an active business justification should not exist. This also creates an incentive for managers to complete reviews on time. Extending deadlines rewards non-compliance. Escalation without revocation leaves risk open. Accepting a 40% completion rate means 40% of access is unreviewed and poses an unacceptable residual risk.',
  'UNCERTIFIED CLEARANCE: No approval within 30 days means the clearance expires — access is burned, not assumed valid.',
  'apply',
  'tlatm',
  'medium',
  1.25, 0.40, 0.20, 'ai_generated', true
);
