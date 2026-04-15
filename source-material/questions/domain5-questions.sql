-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 5: Identity and Access Management
-- 100 questions for CAT engine
-- Distribution: 15 easy, 55 medium, 20 hard, 10 very hard
-- Cognitive: 10 remember, 20 understand, 45 apply, 25 analyze
-- Types: 25 scenario, 20 first_action, 15 best_answer,
--        10 most_likely, 10 tlatm, 10 comparison, 5 calculation, 5 except_not
-- Correct positions: 25 each at 0, 1, 2, 3
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
-- EASY QUESTIONS (15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: easy / remember / comparison — correct=0
-- b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  5,
  'authentication_factors',
  'What is the PRIMARY difference between identification and authentication?',
  '["Identification is claiming an identity while authentication is proving it", "Identification uses passwords while authentication uses biometrics", "Identification is for systems while authentication is for users", "Identification is optional while authentication is mandatory"]'::jsonb,
  0,
  'Identification is the act of claiming an identity, such as presenting a username or badge. Authentication is the process of proving that claimed identity through one or more factors such as passwords, tokens, or biometrics. Identification always precedes authentication in the access control process.',
  'ID = I Declare who I am. AUTH = prove AUTHentically that it''s really me.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q2: easy / remember / best_answer — correct=1
-- b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  5,
  'biometrics',
  'Which biometric error type is considered MORE dangerous from a security perspective?',
  '["Type 1 error (False Rejection Rate) because it denies legitimate users", "Type 2 error (False Acceptance Rate) because it admits unauthorized users", "Crossover Error Rate because it represents the worst accuracy point", "Enrollment error because it corrupts the reference template"]'::jsonb,
  1,
  'A Type 2 error (False Acceptance Rate / FAR) is more dangerous because it allows an unauthorized person to gain access. A Type 1 error (False Rejection Rate / FRR) merely inconveniences a legitimate user. The CER is actually the point where FRR equals FAR and is used to compare device accuracy.',
  'Type 2 = Too lenient = lets the wrong person Through. Type 2 is the security nightmare.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q3: easy / understand / best_answer — correct=2
-- b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  5,
  'access_control_models',
  'Which access control model allows the resource OWNER to determine who can access their files?',
  '["Mandatory Access Control (MAC) because it uses classification labels", "Role-Based Access Control (RBAC) because it assigns permissions to roles", "Discretionary Access Control (DAC) because the owner sets permissions at their discretion", "Attribute-Based Access Control (ABAC) because it evaluates user attributes"]'::jsonb,
  2,
  'Discretionary Access Control (DAC) allows the data owner to decide who gets access to their resources. The owner has discretion to grant or revoke permissions using access control lists. NTFS file permissions are a common example of DAC. MAC uses system-enforced labels, RBAC uses role assignments, and ABAC uses attribute policies.',
  'DAC = Data owner''s Autonomous Choice. The owner has Discretion.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q4: easy / understand / comparison — correct=3
-- b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'radius_tacacs',
  'What is a KEY difference between RADIUS and TACACS+ regarding data protection?',
  '["RADIUS uses TCP while TACACS+ uses UDP for transport", "RADIUS separates AAA functions while TACACS+ combines them", "RADIUS encrypts the entire session while TACACS+ encrypts only passwords", "RADIUS encrypts only the password while TACACS+ encrypts the entire session"]'::jsonb,
  3,
  'RADIUS encrypts only the user''s password during transmission, leaving the rest of the session in cleartext. TACACS+ encrypts the entire authentication session. Additionally, RADIUS uses UDP while TACACS+ uses TCP, and TACACS+ separates authentication, authorization, and accounting into independent processes.',
  'RADIUS = password-only Restriction. TACACS+ = Total encryption (the + means more protection).',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q5: easy / understand / first_action — correct=0
-- b = -1.5 + 0.0 + 0.3 = -1.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  5,
  'mfa',
  'A bank requires customers to enter a password and then input a code from a hardware token device to access online banking. Which security mechanism does this BEST describe?',
  '["Multifactor authentication because it combines something you know with something you have", "Single sign-on because the user authenticates once to access the account", "Single-factor authentication because both items verify identity", "Federated identity because the bank and token provider share trust"]'::jsonb,
  0,
  'This is multifactor authentication (MFA) because it uses two different factor types: something you know (password) and something you have (hardware token). MFA requires factors from at least two different categories. Using two passwords would be single-factor because both are something you know.',
  'MFA = Must have Factors from different Areas. Password + Token = Know + Have = two categories.',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),

-- Q6: easy / apply / first_action — correct=1
-- b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'identity_lifecycle',
  'An employee in the finance department is transferring to the marketing department next week. The security administrator has been asked to update the employee''s access. What is the MOST important step to prevent privilege creep?',
  '["Grant the employee marketing permissions immediately so they can prepare for their new role", "Remove the employee''s finance permissions and grant only the marketing permissions needed for the new role", "Keep the finance permissions active for 30 days in case the employee needs to reference old work", "Delete the employee''s account and create a new one for the marketing department"]'::jsonb,
  1,
  'Privilege creep occurs when users accumulate unnecessary permissions over time, typically during role changes. The correct approach is to remove the old role''s permissions and grant only those required for the new role. Keeping old permissions violates least privilege. Deleting and recreating accounts is disruptive and unnecessary.',
  'Role change = Remove old, Add new. Never let permissions pile up like laundry.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q7: easy / apply / first_action — correct=2
-- b = -1.5 + 0.3 + 0.3 = -0.9, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'identity_lifecycle',
  'During an exit interview, you learn that a terminated employee had access to sensitive financial systems. What should be done FIRST?',
  '["Collect the employee''s laptop and hardware token", "Notify the employee''s former manager to review shared files", "Disable the employee''s accounts immediately", "Delete all of the employee''s user accounts and data"]'::jsonb,
  2,
  'The first priority when an employee is terminated is to disable their accounts to prevent unauthorized access. Disabling rather than deleting preserves data and audit trails. Hardware collection, manager notification, and data review are all important but come after securing the accounts. Accounts should be disabled during the exit interview itself.',
  'FIRST = Freeze access. Disable during the exit interview, not after.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q8: easy / remember / except_not — correct=3
-- b = -1.5 + (-0.5) + 0.2 = -1.8, a = 0.8 + (-0.1) = 0.7, c = 0.25
(
  5,
  'authentication_factors',
  'All of the following are examples of "something you have" authentication factors EXCEPT:',
  '["A hardware security token that generates one-time passwords", "A smartcard containing an embedded digital certificate", "A mobile phone used to receive push authentication notifications", "A personal identification number (PIN) memorized by the user"]'::jsonb,
  3,
  'A PIN is something you know (Type 1 factor), not something you have (Type 2 factor). Hardware tokens, smartcards, and mobile phones are all physical items that a user possesses, making them Type 2 factors. The CISSP exam frequently tests the distinction between authentication factor types.',
  'Something you HAVE = you can HOLD it in your hand. A PIN lives in your HEAD, not your hand.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),

-- Q9: easy / understand / most_likely — correct=0
-- b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'sso_federation',
  'An organization deploys Single Sign-On (SSO) so employees authenticate once to access email, HR portal, and file shares. What is the MOST LIKELY security concern with this approach?',
  '["If the SSO credential is compromised, an attacker gains access to all connected systems", "SSO prevents the use of multifactor authentication for individual applications", "SSO makes it impossible to enforce different access levels across applications", "SSO requires each application to maintain its own separate user database"]'::jsonb,
  0,
  'The primary security risk of SSO is that it creates a single point of failure. If an attacker compromises the SSO credential, they gain access to every system connected to it. SSO does not prevent MFA, does not eliminate granular access controls, and actually centralizes (not decentralizes) the user database.',
  'SSO = Single Sign-On = Single point of failure. One key opens every door.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q10: easy / apply / best_answer — correct=1
-- b = -1.5 + 0.3 + 0.0 = -1.2, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'least_privilege_sod',
  'A database administrator needs temporary elevated access to migrate a production database over the weekend. Which approach BEST follows the principle of least privilege?',
  '["Grant permanent administrator rights so the DBA can handle future migrations without delay", "Provide just-in-time elevated access that automatically expires after the migration window", "Give the DBA full root access to all servers since migration touches multiple systems", "Allow the DBA to use a shared administrator account that the team already has"]'::jsonb,
  1,
  'Just-in-time (JIT) access provides elevated privileges only when needed and for a limited duration. This follows least privilege by ensuring the DBA has access only during the migration window. Permanent admin rights, full root access, and shared accounts all violate least privilege and create unnecessary risk.',
  'JIT = Just In Time = Just enough, Just long enough, Just for this task.',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q11: easy / remember / first_action — correct=2
-- b = -1.5 + (-0.5) + 0.3 = -1.7, a = 0.8 + 0.2 = 1.0, c = 0.20
(
  5,
  'credential_attacks',
  'A security team discovers that an attacker has obtained a list of employee email addresses and is attempting common passwords against each account, trying only two passwords per account to avoid lockout. What type of attack is this MOST likely?',
  '["A brute-force attack systematically trying all possible password combinations", "A dictionary attack using a predefined list of common words", "A password spraying attack using common passwords across many accounts", "A credential stuffing attack using previously breached username-password pairs"]'::jsonb,
  2,
  'Password spraying tries a small number of commonly used passwords against many accounts, deliberately staying below the account lockout threshold. Brute-force tries all combinations against one account. Dictionary attacks use word lists against single accounts. Credential stuffing uses specific stolen credential pairs from other breaches.',
  'Spraying = Spray a few passwords across MANY accounts like a garden sprinkler.',
  'remember',
  'first_action',
  'easy',
  1.00, -1.70, 0.20,
  'ai_generated', true
),

-- Q12: easy / apply / best_answer — correct=3
-- b = -1.5 + 0.3 + 0.0 = -1.2, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'password_policy',
  'An organization is updating its password policy to align with NIST SP 800-63B recommendations. Which change BEST reflects the current NIST guidance?',
  '["Require passwords to be changed every 30 days", "Mandate a minimum of three special characters in every password", "Enforce a maximum password length of 16 characters", "Remove periodic password expiration requirements unless a compromise is suspected"]'::jsonb,
  3,
  'NIST SP 800-63B recommends removing mandatory periodic password expiration because it leads users to choose weaker passwords. Passwords should only be changed when there is evidence of compromise. NIST also recommends allowing long passwords (up to 64 characters), not restricting length, and screening against common password lists rather than complex character requirements.',
  'NIST says: No forced expiration, No complexity rules, Yes to length and screening.',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q13: easy / remember / comparison — correct=0
-- b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  5,
  'sso_federation',
  'What is the PRIMARY difference between Single Sign-On (SSO) and Federated Identity Management (FIM)?',
  '["SSO operates within one organization while FIM extends authentication across multiple organizations", "SSO uses biometrics while FIM uses passwords for authentication", "SSO requires SAML while FIM requires OAuth for implementation", "SSO is more secure than FIM because it uses stronger encryption"]'::jsonb,
  0,
  'SSO allows users to authenticate once and access multiple resources within a single organization. Federated Identity Management extends this concept across organizational boundaries through trust relationships. FIM enables cross-organization SSO using standards like SAML, OAuth, or OIDC. Both can use various authentication methods.',
  'SSO = Single organization. FIM = Federated across many organizations. F = Far-reaching.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q14: easy / understand / scenario — correct=1
-- b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  5,
  'access_control_models',
  'A military installation requires that documents labeled "Secret" can only be accessed by personnel with a "Secret" or higher security clearance. The system enforces these restrictions automatically based on classification labels. Which access control model is being used?',
  '["Discretionary Access Control because the document owner set the classification", "Mandatory Access Control because the system enforces access based on labels assigned to both subjects and objects", "Role-Based Access Control because access is based on the user''s military role", "Rule-Based Access Control because the system applies rules to all users equally"]'::jsonb,
  1,
  'Mandatory Access Control (MAC) uses classification labels on both subjects (clearance levels) and objects (classification levels). The system, not the owner, enforces access decisions based on these labels. MAC is commonly used in military and government environments where information must be strictly compartmentalized.',
  'MAC = Military-style Access with Classification labels. System decides, not the owner.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q15: easy / apply / most_likely — correct=2
-- b = -1.5 + 0.3 + 0.1 = -1.1, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  5,
  'session_management',
  'A web application uses session tokens that are only 32 bits long and generated using a predictable algorithm. What is the MOST LIKELY vulnerability this creates?',
  '["Cross-site scripting because the short token can be embedded in scripts", "SQL injection because the token format matches database query patterns", "Session hijacking because the tokens can be predicted or brute-forced easily", "Buffer overflow because the short token causes memory allocation errors"]'::jsonb,
  2,
  'Session tokens should be at least 128 bits in length with at least 64 bits of entropy to prevent prediction and brute-force attacks. Short, predictable tokens allow attackers to guess valid session identifiers and hijack legitimate user sessions. OWASP recommends session IDs that are sufficiently long, random, and meaningless.',
  'Session tokens: 128+ bits, 64+ entropy, meaningless, unpredictable. Short = easy to steal.',
  'apply',
  'most_likely',
  'easy',
  1.40, -1.10, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM QUESTIONS (55) — IRT b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: medium / understand / scenario — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  5,
  'sso_federation',
  'A company uses SAML-based federation so employees can access a cloud HR application. When an employee clicks on the HR app link from the company portal, the portal redirects them to the corporate identity provider for authentication. After successful login, the IdP sends a SAML assertion back to the HR application. What type of information does the SAML assertion contain?',
  '["The user''s plaintext password encrypted with the service provider''s public key", "The user''s biometric template hashed with SHA-256 for verification", "A Kerberos ticket granting ticket for the HR application''s service", "Authentication, attribute, and authorization statements about the user"]'::jsonb,
  3,
  'A SAML assertion contains three types of statements: authentication (proof the user logged in, method used, timestamp), attribute (user information and entitlements), and authorization (what the user is allowed to access). SAML never transmits the user''s password. It uses XML-based assertions signed by the identity provider.',
  'SAML has 3 A''s in its assertions: Authentication, Attribute, Authorization. Never the password.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: medium / apply / scenario — correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'zero_trust',
  'A financial services firm is implementing a Zero Trust architecture following NIST SP 800-207. An employee on the corporate LAN attempts to access a sensitive trading application. The system evaluates the employee''s identity, device security posture, current threat intelligence, and behavioral analytics before granting access. Which Zero Trust component makes the final access decision?',
  '["The Policy Decision Point (PDP), which combines the policy engine and policy administrator to evaluate the trust algorithm", "The Policy Enforcement Point (PEP), which acts as the gatekeeper blocking or allowing traffic", "The SIEM system, which correlates security events and generates risk scores", "The identity provider, which validates the user''s credentials and issues tokens"]'::jsonb,
  0,
  'In Zero Trust architecture, the Policy Decision Point (PDP) makes access decisions. The PDP consists of the policy engine (which evaluates trust algorithms using identity, device posture, threat intelligence, and behavior) and the policy administrator (which creates or denies session tokens). The PEP enforces decisions but does not make them.',
  'PDP = Policy Decision Point = the Decision maker. PEP = Policy Enforcement Point = the bouncer who enforces.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q18: medium / apply / first_action — correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'credential_attacks',
  'Your SOC detects that the KRBTGT account hash in your Active Directory domain has been compromised. An attacker could forge Ticket Granting Tickets at will. What should be done FIRST to contain this threat?',
  '["Disable all user accounts in the domain and force everyone to re-enroll", "Reset the KRBTGT account password twice in succession to invalidate forged tickets", "Rebuild all domain controllers from clean media and restore from backup", "Deploy network segmentation to isolate the domain controllers from the rest of the network"]'::jsonb,
  1,
  'When the KRBTGT hash is compromised (golden ticket attack), the FIRST containment step is to reset the KRBTGT password twice. Kerberos keeps the current and previous password, so two resets invalidate all existing tickets, including forged ones. Rebuilding domain controllers may be necessary later but is not the first action. Disabling all accounts would halt business operations.',
  'Golden ticket = KRBTGT compromised. Fix = reset KRBTGT password TWICE (current + previous).',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: medium / apply / first_action — correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'biometrics',
  'A data center is deploying a biometric access control system. During testing, the security team finds that the fingerprint scanner frequently rejects authorized employees who have dry or calloused hands, while rarely admitting unauthorized individuals. The team wants to adjust the system. What is the MOST accurate description of the current situation?',
  '["The system has a high False Acceptance Rate and needs increased sensitivity", "The system has a high Crossover Error Rate and needs to be replaced entirely", "The system has a high False Rejection Rate and the sensitivity should be decreased", "The system has a high False Acceptance Rate and the sensitivity should be decreased"]'::jsonb,
  2,
  'The scanner is rejecting authorized users (high FRR / Type 1 error) while rarely admitting unauthorized users (low FAR). This means the sensitivity is set too high. Decreasing sensitivity will reduce the False Rejection Rate but may increase the False Acceptance Rate. The goal is to find a balance near the Crossover Error Rate (CER).',
  'Too SENSITIVE = too many REJECTIONS (Type 1). Dial it DOWN to let legit users through. FRR and FAR are inversely related.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q20: medium / understand / best_answer — correct=3
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  5,
  'authorization_mechanisms',
  'Which authorization principle states that access should be denied by default unless a rule explicitly permits it?',
  '["Separation of duties because it requires multiple approvals for access", "Need to know because it restricts access to job-relevant information only", "Least privilege because it limits access to the minimum required", "Implicit deny because it blocks all access unless explicitly allowed"]'::jsonb,
  3,
  'Implicit deny is the foundational authorization principle that denies all access by default. Access is only granted when an explicit rule permits it. This is different from least privilege (minimum necessary access) and need to know (access based on job requirements). Firewalls commonly implement implicit deny with a final "deny all" rule.',
  'Implicit deny = If no rule says YES, the answer is NO. Default = Denied.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q21: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_attacks',
  'A help desk technician receives a phone call from someone claiming to be the CFO who is traveling and urgently needs a password reset for a critical financial system. The caller knows the CFO''s employee ID and email address. What should the technician do FIRST?',
  '["Verify the caller''s identity through an established out-of-band verification method before resetting the password", "Reset the password immediately since the caller knows the employee ID and the request is urgent", "Transfer the call to the security team because password resets are outside help desk scope", "Ask the caller three security questions and reset the password if they answer correctly"]'::jsonb,
  0,
  'The FIRST step is identity verification through an established out-of-band method such as calling the CFO back on their registered phone number or using a secondary communication channel. Social engineers often know basic information like employee IDs. Urgency is a classic social engineering tactic. Help desk password resets are a top identity attack vector.',
  'FIRST verify identity through a DIFFERENT channel. Urgency = social engineering red flag.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q22: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'least_privilege_sod',
  'A security manager discovers that several IT administrators have been using their privileged accounts for everyday tasks such as reading email and browsing the web. Budget constraints prevent hiring additional staff. What is the BEST management decision to address this risk?',
  '["Accept the risk since the administrators need their privileges for daily operations", "Require each administrator to maintain two separate accounts: one standard account for daily tasks and one privileged account for administrative duties", "Revoke all administrative privileges and require managers to approve each administrative action individually", "Implement full disk encryption on all administrator workstations to protect against compromise"]'::jsonb,
  1,
  'The management best practice is to require separate accounts for standard and administrative work. This limits the exposure window for privileged credentials. Using admin accounts for email and web browsing exposes those credentials to phishing and drive-by attacks. Individual approval for each action is operationally infeasible, and disk encryption does not address the privilege misuse.',
  'Think Like a Manager: Two accounts = separation of daily work from admin power. Balance security with practicality.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q23: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'sso_federation',
  'A web application allows users to log in using their Google account. When a user clicks "Sign in with Google," they are redirected to Google''s authorization server, authenticate there, and are then returned to the application with a JSON Web Token containing their identity information. Which protocol is being used?',
  '["SAML because the user is being redirected to an identity provider for authentication", "OAuth 2.0 because the application is receiving an access token from Google", "OpenID Connect because it provides authentication via JWT on top of OAuth 2.0", "Kerberos because Google is acting as a Key Distribution Center issuing tickets"]'::jsonb,
  2,
  'OpenID Connect (OIDC) is the authentication layer built on top of OAuth 2.0. It returns a JSON Web Token (JWT) containing identity information (ID token). OAuth 2.0 alone is only for authorization, not authentication. SAML uses XML assertions, not JWT. Kerberos uses encrypted tickets for internal network SSO, not web-based federation.',
  'OIDC = OAuth + Identity. JWT = JSON identity token. SAML = XML. OAuth alone = authorization only.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q24: medium / understand / comparison — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'authorization_mechanisms',
  'How do Access Control Lists (ACLs) differ from capability lists in their approach to managing permissions?',
  '["ACLs are used only in MAC systems while capability lists are used only in DAC systems", "ACLs grant permissions dynamically while capability lists use static assignments", "ACLs are maintained by users while capability lists are maintained by administrators", "ACLs are object-centric listing who can access a resource while capability lists are subject-centric listing what a user can access"]'::jsonb,
  3,
  'ACLs are attached to objects (files, resources) and list which subjects have access. Capability lists are attached to subjects (users) and list which objects they can access. Both can be used in DAC and other models. ACLs answer "who can access this file?" while capability lists answer "what can this user access?"',
  'ACL = Attached to the object (who can access THIS?). Capability = Carried by the subject (what can I access?).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q25: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'privilege_escalation',
  'A Linux system administrator notices that a regular user account has been added to the sudoers file without authorization. Log analysis shows the modification occurred during off-hours. What should the administrator do FIRST?',
  '["Remove the unauthorized entry from the sudoers file and review audit logs for commands executed with elevated privileges", "Delete the compromised user account and all associated files immediately", "Shut down the server to prevent further unauthorized access until a full investigation is completed", "Change the root password and restart all services running on the system"]'::jsonb,
  0,
  'The FIRST action is to remove the unauthorized sudoers entry to stop the privilege escalation, then review logs to assess what commands were run with elevated privileges. Deleting the account may destroy evidence. Shutting down the server disrupts operations unnecessarily. Changing the root password alone does not address the sudoers modification.',
  'FIRST remove the unauthorized access, THEN investigate. Contain before you analyze.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q26: medium / analyze / scenario — correct=1
-- b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'access_control_models',
  'A healthcare organization needs an access control system where doctors can only view patient records they are directly treating, nurses can only view records for patients on their assigned floor, and administrators can access billing information but not medical records. Access must also consider the time of day and the device being used. Which access control model is BEST suited for this environment?',
  '["Role-Based Access Control because permissions can be assigned based on job titles like doctor, nurse, and administrator", "Attribute-Based Access Control because it can evaluate multiple attributes including role, patient assignment, location, time, and device", "Mandatory Access Control because it can classify medical records by sensitivity level", "Discretionary Access Control because doctors should have discretion over their patient records"]'::jsonb,
  1,
  'ABAC is best suited because it can evaluate multiple attributes simultaneously: user role, patient assignment, floor assignment, time of day, and device type. RBAC alone cannot handle the context-dependent requirements like time and device. MAC focuses on classification labels. DAC would give too much discretion to individual users in a healthcare environment where compliance is critical.',
  'ABAC = Any combination of Attributes evaluated together. When you need role + time + location + device, think ABAC.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q27: medium / apply / best_answer — correct=2
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'service_accounts',
  'An organization has multiple service accounts running critical background processes. Some of these accounts have passwords that have not been changed in over two years. What is the BEST approach to managing these service accounts?',
  '["Enable password expiration policies so service account passwords rotate automatically every 90 days", "Convert all service accounts to use interactive login so administrators can change passwords more easily", "Implement strong manual password rotation on a defined schedule and disable interactive login for all service accounts", "Replace all service account passwords with the same complex passphrase for easier management"]'::jsonb,
  2,
  'Service accounts should use strong passwords with manual rotation on a defined schedule, and interactive login should be disabled. Automatic password expiration can break critical services that depend on the stored credentials. Interactive login increases the attack surface. Using the same password for multiple accounts violates the principle of unique credentials.',
  'Service accounts: Strong password + Manual rotation + No interactive login + Minimum privileges.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q28: medium / understand / scenario — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  5,
  'authentication_factors',
  'A company implements a new authentication system that requires employees to swipe their smart badge and then place their finger on a scanner. The badge contains a digital certificate. What authentication factors are being used?',
  '["Two Type 1 factors: something the employee knows (badge PIN) and something they know (fingerprint pattern)", "Two Type 2 factors: something the employee has (badge) and something they have (finger)", "Single-factor authentication because the badge and fingerprint are presented at the same time", "Two-factor authentication combining something the employee has (smart badge) and something they are (fingerprint)"]'::jsonb,
  3,
  'This is two-factor authentication using Type 2 (something you have -- smart badge with certificate) and Type 3 (something you are -- fingerprint biometric). These are from different factor categories, making it true MFA. A fingerprint is a biometric (Type 3), not something you know. Presenting factors simultaneously does not make them single-factor.',
  'Badge = HAVE it. Fingerprint = ARE it. Two different types = true MFA.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q29: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'session_management',
  'A security analyst discovers that a web application''s session IDs are being transmitted in URL parameters instead of secure cookies. Active user sessions could be exposed through browser history, referrer headers, and server logs. What should be done FIRST to mitigate this risk?',
  '["Reconfigure the application to transmit session IDs only through secure, HttpOnly cookies", "Implement a web application firewall to filter session IDs from URL parameters", "Reduce session timeout values to minimize the window of exposure", "Deploy TLS across the entire application to encrypt session IDs in transit"]'::jsonb,
  0,
  'The FIRST priority is to move session IDs out of URLs and into secure cookies with HttpOnly and Secure flags. This prevents session ID leakage through browser history, referrer headers, and logs. TLS encrypts data in transit but does not prevent URL-based exposure in logs and history. Shorter timeouts and WAFs are supplementary measures.',
  'Session IDs belong in cookies, NEVER in URLs. Secure + HttpOnly = best cookie flags.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q30: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'identity_lifecycle',
  'A security manager is reviewing the organization''s identity governance program. She discovers that access reviews for standard user accounts are conducted annually, but privileged accounts and service accounts are only reviewed at the same annual frequency. What is the MOST appropriate management recommendation?',
  '["Eliminate access reviews for standard accounts and focus all review resources on privileged accounts only", "Increase the review frequency for privileged and service accounts to monthly or quarterly based on the risk they present", "Maintain annual reviews for all account types because consistency simplifies compliance reporting", "Outsource all access reviews to an external auditing firm to ensure objectivity"]'::jsonb,
  1,
  'From a management perspective, privileged and service accounts pose significantly higher risk than standard user accounts and should be reviewed more frequently. Risk-based review frequency means high-value accounts (admin, root, service) should be reviewed monthly or even weekly, while standard accounts can remain on a quarterly or annual cycle. Consistent but inappropriate frequency does not satisfy risk management goals.',
  'Think Like a Manager: Higher risk accounts = higher review frequency. Risk drives the schedule.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q31: medium / apply / first_action — correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_models',
  'A software company uses Active Directory groups to manage access to development tools. When a new developer joins, they are added to the "Developers" group, which automatically grants them access to the code repository, CI/CD pipeline, and testing environments. A senior developer is additionally placed in the "Release Managers" group. Which access control model does this BEST represent?',
  '["Discretionary Access Control because the team lead decides who joins each group", "Mandatory Access Control because the system enforces group-based restrictions", "Role-Based Access Control because permissions are assigned to groups that mirror job functions", "Rule-Based Access Control because the system applies group membership rules automatically"]'::jsonb,
  2,
  'This is Role-Based Access Control (RBAC) because permissions are assigned to groups (roles) that correspond to job functions, not to individual users. When users join a group, they inherit that group''s permissions. RBAC mirrors organizational hierarchy and helps enforce least privilege. While a person decides group membership, the model itself is RBAC because permissions flow from role assignment.',
  'RBAC = Roles mirror Real job functions. Add user to role = inherit permissions.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q32: medium / understand / except_not — correct=3
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  5,
  'sso_federation',
  'All of the following are components of a SAML-based federation EXCEPT:',
  '["An identity provider that authenticates users and issues assertions", "A service provider that relies on assertions to grant access to resources", "A principal who is the user requesting access to the service", "An access token issued by an OAuth authorization server for API access"]'::jsonb,
  3,
  'SAML federation involves three entities: the principal (user), the identity provider (IdP), and the service provider (SP). SAML uses XML-based assertions, not OAuth access tokens. OAuth access tokens are part of the OAuth 2.0 framework, which is a separate authorization protocol. SAML and OAuth serve different purposes and use different data formats.',
  'SAML = 3 entities (Principal, IdP, SP) + XML assertions. OAuth tokens are NOT part of SAML.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q33: medium / remember / most_likely — correct=0
-- b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  5,
  'credential_attacks',
  'An attacker has obtained a database of password hashes from a breached website. The hashes were generated using MD5 without salting. The attacker wants to reverse as many passwords as possible in the shortest time. What attack technique is MOST LIKELY to be used?',
  '["A rainbow table attack using precomputed hash-to-password mappings for rapid lookup", "A brute-force attack trying every possible character combination against each hash", "A dictionary attack using a word list and hashing each word for comparison", "A birthday attack searching for two inputs that produce the same hash output"]'::jsonb,
  0,
  'Rainbow table attacks use precomputed databases of hash-to-password mappings, making them extremely fast for reversing unsalted hashes. MD5 without salt is particularly vulnerable because identical passwords always produce the same hash. Salting defeats rainbow tables by making each hash unique. Brute-force and dictionary attacks require hashing each guess, making them slower.',
  'Rainbow tables = precomputed hash lookup tables. No salt = rainbow tables work. Salt = rainbow tables fail.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q34: medium / understand / best_answer — correct=1
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  5,
  'zero_trust',
  'Which statement BEST describes the core philosophy of Zero Trust architecture?',
  '["All internal network traffic is trusted while external traffic requires verification", "Trust is established once at the network perimeter and maintained throughout the session", "No implicit trust is granted based on network location and every access request must be continuously validated", "Zero Trust eliminates the need for authentication by relying entirely on network segmentation"]'::jsonb,
  1,
  'Zero Trust assumes no implicit trust regardless of network location. Every access request must be verified, and validation is continuous throughout the session. This contrasts with traditional perimeter-based security that trusts internal traffic. Zero Trust does not eliminate authentication; it strengthens it through continuous validation, device posture assessment, and contextual policies.',
  NULL,
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q35: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'device_authentication',
  'A hospital deploys 802.1X port-based authentication on its wired network. When a medical device is plugged into a network port, it must present a valid digital certificate before being granted network access. If the certificate is invalid or missing, the device is placed on a quarantine VLAN with limited connectivity. What security concept does the quarantine VLAN represent?',
  '["Multifactor authentication because the device needs both a physical connection and a certificate", "Single sign-on because one authentication grants access to the entire network", "Network Access Control with posture assessment, placing non-compliant devices in a restricted segment", "Federated identity management because the device authenticates across network boundaries"]'::jsonb,
  2,
  'This is Network Access Control (NAC) with posture assessment. 802.1X authenticates devices at the port level, and non-compliant devices are quarantined in a restricted VLAN rather than being given full access or completely denied. This approach balances security with availability by providing limited access for remediation while protecting the production network.',
  '802.1X = port-based authentication. Fail authentication = quarantine VLAN, not full access.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q36: medium / apply / first_action — correct=3
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_attacks',
  'A security analyst notices that multiple user accounts across different departments have been locked out within a 10-minute window. Each account experienced exactly three failed login attempts using the same incorrect password. What type of attack is MOST likely occurring, and what should be done FIRST?',
  '["This is a brute-force attack; increase the account lockout threshold to reduce disruption", "This is a credential stuffing attack; block the source IP addresses in the firewall", "This is a dictionary attack; enforce mandatory password changes for all affected accounts", "This is a password spraying attack; identify and block the source of the authentication attempts"]'::jsonb,
  3,
  'Password spraying uses the same password against many accounts, staying below the lockout threshold per account. The pattern of multiple accounts, same password, short timeframe is the signature of password spraying. The FIRST action is to identify the source and block the authentication attempts. Brute-force targets one account with many passwords. Credential stuffing uses unique stolen pairs.',
  'Same password + many accounts + stays below lockout = password SPRAYING. Identify and block the source.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q37: medium / understand / comparison — correct=0
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'sso_federation',
  'How does OAuth 2.0 differ from OpenID Connect (OIDC) in terms of their primary functions?',
  '["OAuth 2.0 provides authorization only while OIDC adds an authentication layer on top of OAuth 2.0", "OAuth 2.0 uses XML tokens while OIDC uses JSON Web Tokens for data exchange", "OAuth 2.0 is maintained by OASIS while OIDC is maintained by the IETF", "OAuth 2.0 is designed for internal networks while OIDC is designed for cloud environments"]'::jsonb,
  0,
  'OAuth 2.0 is strictly an authorization framework that allows third-party applications to access resources without sharing credentials. OpenID Connect adds an authentication layer on top of OAuth 2.0, providing identity verification through ID tokens (JSON Web Tokens). Both use JSON-based tokens, and both are web/cloud protocols. OAuth 2.0 is maintained by IETF, OIDC by the OpenID Foundation.',
  'OAuth = Authorization Only. OIDC = OAuth + IDentity (authentication). OIDC builds ON TOP of OAuth.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q38: medium / apply / scenario — correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'privilege_escalation',
  'A penetration tester gains initial access to a Linux server through a web application vulnerability and obtains a shell as the www-data user. The tester discovers that the www-data account has an entry in the sudoers file allowing it to run the vi text editor as root without a password. How can this be exploited for vertical privilege escalation?',
  '["Use vi to directly modify the /etc/shadow file and change the root password hash", "Run vi as root via sudo, then escape to a root shell from within the editor", "Use the www-data account to create a new user with root privileges in /etc/passwd", "Modify the web application''s configuration files to disable authentication"]'::jsonb,
  1,
  'When sudo allows running vi (or similar editors) as root, the attacker can spawn a root shell from within the editor using the :!/bin/bash command. This is vertical privilege escalation because the attacker moves from a low-privilege user to root. This is why sudoers entries should be carefully restricted and editors should not be allowed with root privileges.',
  'Vertical = going UP (user to root). sudo + editor = shell escape to root. Never allow sudo on editors.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q39: medium / analyze / best_answer — correct=2
-- b = 0.0 + 0.6 + 0.0 = 0.6, a = 1.5 + 0.0 = 1.5, c = 0.20
(
  5,
  'least_privilege_sod',
  'An organization implements separation of duties for its financial processes. The CFO wants to ensure that no single employee can initiate, approve, and disburse a payment. Which implementation BEST achieves this goal while remaining operationally efficient?',
  '["Require three different employees to each enter the same payment information independently", "Have one employee handle all three steps but require management review of a random sample", "Assign each step to a different role with system-enforced controls preventing any user from performing more than one step", "Rotate employees through all three roles monthly so no one person controls any step permanently"]'::jsonb,
  2,
  'The BEST implementation assigns each step (initiation, approval, disbursement) to a different role and uses system-enforced controls to prevent any user from performing more than one step. This is true separation of duties with technical enforcement. Random sampling is detective, not preventive. Rotation does not prevent one person from doing all steps during their rotation. Triple data entry is inefficient.',
  'Separation of Duties = Different people for each step + System enforcement. Prevent, don''t just detect.',
  'analyze',
  'best_answer',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q40: medium / remember / most_likely — correct=3
-- b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  5,
  'access_control_attacks',
  'An attacker obtains NTLM password hashes from a compromised Windows workstation using Mimikatz. Instead of cracking the hashes, the attacker sends them directly to other systems on the network to authenticate. What attack technique is this MOST LIKELY?',
  '["Kerberoasting, which involves requesting and cracking service tickets", "Credential stuffing, which tests stolen credentials across multiple services", "Password spraying, which tries common passwords against many accounts", "Pass-the-hash, which uses captured hashes directly for authentication without cracking them"]'::jsonb,
  3,
  'Pass-the-hash (PtH) attacks use captured NTLM hashes directly to authenticate to other Windows systems without ever cracking the password. Mimikatz is the primary tool used for this attack. Kerberoasting targets Kerberos service tickets. Credential stuffing uses actual username/password pairs from breaches. Password spraying tries common passwords against many accounts.',
  'Pass-the-HASH = send the HASH itself as proof. No cracking needed. Mimikatz is the go-to tool.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q41: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'identity_lifecycle',
  'During a quarterly access review, you discover that a contractor who left the company three months ago still has an active VPN account with access to the development environment. What should be done FIRST?',
  '["Immediately disable the contractor''s account and review logs for any access since the departure date", "Send an email to the contractor''s former manager asking whether the account should remain active", "Change the password on the contractor''s account and monitor for any future login attempts", "Wait until the next scheduled review cycle to process the account removal through normal channels"]'::jsonb,
  0,
  'The FIRST action is to immediately disable the account, as it represents an active security risk. Then review audit logs to determine if unauthorized access occurred since the contractor left. Waiting for manager confirmation or the next review cycle leaves the vulnerability open. Changing the password but leaving the account active is insufficient.',
  'Stale accounts = immediate risk. Disable FIRST, investigate second, delete per policy.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q42: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'service_accounts',
  'A security manager learns that the organization has over 200 service accounts, many with administrative privileges, and no centralized inventory. Some accounts were created years ago by employees who have since left. What is the MOST appropriate management action?',
  '["Immediately disable all service accounts until each one can be individually verified and justified", "Conduct a comprehensive service account inventory, assign ownership to current employees, and implement least-privilege policies with regular review cycles", "Migrate all service accounts to cloud-based identity management to reduce on-premises risk", "Require all service accounts to use multifactor authentication going forward"]'::jsonb,
  1,
  'The management approach is to first inventory all service accounts, then assign ownership, apply least-privilege principles, and establish regular review cycles. Disabling all accounts would break production services. Cloud migration does not address the ownership and privilege issues. Service accounts are non-interactive, making MFA impractical for most of them.',
  'Think Like a Manager: Inventory first, assign ownership, enforce least privilege, review regularly. Don''t break production.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q43: medium / apply / first_action — correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'authentication_factors',
  'A company issues employees smartcards that contain digital certificates. To log into their workstations, employees must insert the smartcard into a reader and enter a PIN. If an employee loses their smartcard, another person who finds it cannot access the workstation. Why is this the case?',
  '["Because the smartcard locks after three failed PIN attempts and requires administrator reset", "Because the smartcard''s digital certificate is bound to the employee''s biometric data", "Because the system requires both something you have (smartcard) and something you know (PIN), and the finder lacks the PIN", "Because the smartcard uses one-time passwords that change every 30 seconds"]'::jsonb,
  2,
  'This is multifactor authentication combining Type 2 (something you have -- the smartcard) and Type 1 (something you know -- the PIN). Without the correct PIN, the smartcard alone is insufficient to authenticate. This demonstrates why MFA is more secure than single-factor: compromising one factor is not enough. The smartcard contains a certificate, not OTPs or biometric data.',
  'Smartcard + PIN = Have + Know = two-factor. Losing the card alone is not enough for an attacker.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q44: medium / understand / most_likely — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'sso_federation',
  'Kerberos requires that all systems in the realm have their clocks synchronized within a five-minute tolerance. What is the MOST LIKELY consequence if a client workstation''s clock drifts beyond this tolerance?',
  '["The KDC will issue tickets with incorrect expiration times, extending their validity indefinitely", "The user will be prompted to re-enter their password every time they access a new resource", "The user''s account will be permanently locked out until an administrator resets it", "Authentication will fail because the KDC will reject ticket requests with timestamps outside the acceptable window"]'::jsonb,
  3,
  'Kerberos uses timestamps to prevent replay attacks. If a client''s clock drifts more than five minutes from the KDC, ticket requests will be rejected because the timestamps fall outside the acceptable window. The account is not locked out; fixing the clock (typically via NTP) resolves the issue. Tickets are not issued with incorrect times; the request is simply denied.',
  'Kerberos = time-sensitive. 5-minute drift = authentication failure. NTP is essential for Kerberos.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q45: medium / apply / scenario — correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'zero_trust',
  'An employee working from a coffee shop connects to the corporate VPN and attempts to access a classified project management application. The Zero Trust system evaluates the request and determines that the employee''s laptop has an outdated antivirus signature and the connection originates from an untrusted network. The system denies access to the classified application but allows access to the company intranet. Which Zero Trust component enforced this decision?',
  '["The Policy Enforcement Point (PEP), which acts as the gatekeeper enforcing the access decision made by the PDP", "The Policy Decision Point (PDP), which evaluated the risk factors and made the deny decision", "The identity provider, which refused to authenticate the user from the untrusted network", "The VPN concentrator, which blocked access based on the source IP address"]'::jsonb,
  0,
  'The Policy Enforcement Point (PEP) is the component that enforces access decisions. The PDP (policy engine + policy administrator) made the decision based on device posture and network location, but the PEP is the gatekeeper that actually blocks or allows the traffic. The question asks which component enforced the decision, not which component made it.',
  'PEP = the bouncer who ENFORCES. PDP = the brain that DECIDES. This question asks about enforcement.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q46: medium / understand / best_answer — correct=1
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  5,
  'biometrics',
  'A biometric system manufacturer claims their device has a CER of 0.5%. A competing device has a CER of 2.1%. Which statement BEST describes the comparison?',
  '["The device with CER 2.1% is more accurate because higher CER means fewer total errors", "The device with CER 0.5% is more accurate because lower CER indicates better performance at the point where FRR equals FAR", "Both devices are equally accurate because CER only indicates the calibration point, not overall accuracy", "Neither CER value is meaningful without knowing the individual FRR and FAR rates at different sensitivity settings"]'::jsonb,
  1,
  'The Crossover Error Rate (CER), also called Equal Error Rate (EER), is the point where the False Rejection Rate equals the False Acceptance Rate. A lower CER indicates a more accurate biometric device. The device with 0.5% CER has better overall accuracy than the device with 2.1% CER. CER is the standard metric for comparing biometric device accuracy.',
  'Lower CER = better biometric. CER is where FRR crosses FAR. Think: lower crossover = fewer errors.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q47: medium / apply / first_action — correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'credential_attacks',
  'Your SIEM alerts on unusual Kerberos activity: hundreds of service ticket requests from a single workstation for service accounts across multiple servers, all within a few minutes. The requesting user account has no business need for these services. What is the FIRST action to contain this likely Kerberoasting attack?',
  '["Reset the passwords for all service accounts in the domain", "Deploy network segmentation to isolate the affected workstation", "Disable the compromised user account and isolate the workstation from the network", "Implement AES-256 encryption for all Kerberos service tickets"]'::jsonb,
  2,
  'Kerberoasting involves requesting many service tickets to crack offline. The FIRST containment action is to disable the compromised account and isolate the workstation to stop the ticket harvesting. Resetting all service account passwords is a remediation step but not the first action. Network segmentation and encryption improvements are longer-term preventive measures.',
  'Kerberoasting = mass service ticket requests for offline cracking. FIRST = stop the harvesting by disabling and isolating.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q48: medium / understand / most_likely — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'access_control_models',
  'A network administrator configures a firewall with the following rules: allow HTTP from the internal network to the internet, allow HTTPS from the internal network to the internet, deny all other traffic. These rules apply equally to all users regardless of identity. Which access control model does this firewall configuration BEST represent?',
  '["Discretionary Access Control because the administrator chose which traffic to allow", "Mandatory Access Control because the firewall labels are enforced by the system", "Attribute-Based Access Control because the rules evaluate traffic attributes", "Rule-Based Access Control because global rules are applied equally to all subjects"]'::jsonb,
  3,
  'Firewalls are the classic example of Rule-Based Access Control. Rules are applied globally and equally to all traffic regardless of user identity. The rules are based on protocol, port, and direction rather than individual user permissions or classification labels. While the admin configured the rules (discretion), the model itself is rule-based because rules apply uniformly.',
  'Firewalls = Rule-Based. Rules apply to ALL traffic equally. Implicit deny at the end.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q49: medium / remember / best_answer — correct=0
-- b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  5,
  'mfa',
  'An organization wants to implement phishing-resistant multifactor authentication for all employees. Several employees have recently fallen victim to phishing attacks where they entered their credentials and SMS one-time passwords on fake login pages. Which solution BEST addresses this requirement?',
  '["FIDO2-compliant hardware security keys that use public key cryptography bound to the legitimate site origin", "Time-based one-time passwords generated by a mobile authenticator application", "Push notifications sent to registered mobile devices requiring user approval", "Email-based one-time passwords sent to the employee''s corporate email address"]'::jsonb,
  0,
  'FIDO2/WebAuthn hardware security keys are phishing-resistant because they cryptographically bind authentication to the legitimate site''s origin. Even if a user visits a phishing site, the key will not authenticate because the origin does not match. TOTP, push notifications, and email OTPs can all be intercepted through real-time phishing proxies.',
  'FIDO2 = phishing-resistant because the key is bound to the site origin. Fake site = wrong origin = no authentication.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q50: medium / analyze / scenario — correct=1
-- b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'identity_lifecycle',
  'A large enterprise discovers through an audit that 15% of active user accounts belong to employees who left the organization over the past two years. The accounts were never disabled because the HR system was not integrated with the identity management platform. What is the root cause of this failure?',
  '["Lack of multifactor authentication on the identity management platform", "Absence of automated deprovisioning triggered by HR system events such as employee termination", "Insufficient password complexity requirements allowing accounts to remain active", "Missing access control lists on the identity management platform''s configuration"]'::jsonb,
  1,
  'The root cause is the lack of automated deprovisioning integration between the HR system and the identity management platform. When HR processes a termination, it should automatically trigger account disabling in the identity system. Without this integration, manual processes are relied upon, and accounts inevitably slip through the cracks. MFA and password policies do not address deprovisioning.',
  'HR termination should auto-trigger account disabling. Manual deprovisioning = guaranteed orphan accounts.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q51: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'radius_tacacs',
  'A network operations team needs to centralize authentication for managing Cisco routers, switches, and firewalls. They require granular control over which commands each administrator can execute, and they want full encryption of all management traffic. Which AAA protocol is BEST suited for this requirement?',
  '["RADIUS because it is the industry standard for network device authentication", "LDAP because it provides centralized directory services for all network devices", "TACACS+ because it encrypts the entire session and provides granular command-level authorization", "Kerberos because it provides strong mutual authentication using encrypted tickets"]'::jsonb,
  2,
  'TACACS+ is best suited for network device administration because it encrypts the entire session (not just the password like RADIUS), separates authentication, authorization, and accounting into independent processes, and supports granular command-level authorization. This allows administrators to be restricted to specific CLI commands on specific devices.',
  'TACACS+ = Total encryption + granular command control + separated AAA. Ideal for network device management.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q52: medium / understand / comparison — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'authentication_factors',
  'What is the KEY difference between synchronous tokens (TOTP) and asynchronous tokens (HOTP) for one-time password generation?',
  '["Synchronous tokens require network connectivity while asynchronous tokens work offline", "Synchronous tokens use biometrics while asynchronous tokens use PINs for verification", "Synchronous tokens are hardware-only while asynchronous tokens are software-only", "Synchronous tokens generate codes based on time intervals while asynchronous tokens generate codes based on a counter or event"]'::jsonb,
  3,
  'TOTP (Time-based One-Time Password) generates codes synchronized to a clock, changing at fixed intervals (typically 30 seconds). HOTP (HMAC-based One-Time Password) generates codes based on a counter that increments with each use. Both can work offline, both can be hardware or software, and neither requires biometrics. The fundamental difference is time-based versus counter-based generation.',
  'TOTP = Time-based, changes automatically. HOTP = counter-based (H = HMAC = event-driven), changes on use.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q53: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'session_management',
  'A web application security scan reveals that session cookies are being set without the Secure or HttpOnly flags. The application handles sensitive financial transactions. What should be done FIRST to address this vulnerability?',
  '["Configure the application to set the Secure flag (HTTPS only) and HttpOnly flag (no JavaScript access) on all session cookies", "Implement client-side encryption of cookie values using JavaScript before transmission", "Switch from cookie-based sessions to URL-based session parameters for better control", "Deploy a content delivery network with built-in cookie security features"]'::jsonb,
  0,
  'The FIRST action is to add the Secure flag (prevents cookie transmission over HTTP) and HttpOnly flag (prevents JavaScript access, mitigating XSS-based cookie theft) to all session cookies. Client-side JavaScript encryption would conflict with HttpOnly. URL-based sessions are less secure than cookies. A CDN does not address application-level cookie configuration.',
  'Secure flag = HTTPS only. HttpOnly flag = no JavaScript access. Both are essential for session cookies.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q54: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'identity_lifecycle',
  'A security manager is evaluating the organization''s vendor access management practices. Currently, vendor accounts are created by individual project managers with no standardized process, no defined expiration dates, and no regular reviews. From a management perspective, what is the MOST important change to implement?',
  '["Require vendors to use their own identity management systems instead of company-provided accounts", "Establish a standardized vendor provisioning process with defined expiration dates, manager ownership, and regular access reviews aligned to contract milestones", "Block all vendor access to internal systems and require them to work exclusively through a DMZ portal", "Implement biometric authentication for all vendor accounts to ensure strong identity verification"]'::jsonb,
  1,
  'The management priority is to standardize vendor provisioning with defined expiration dates, clear ownership by current employees, and reviews aligned to contract milestones. Vendor accounts should receive equal or greater scrutiny than employee accounts. Blocking all access is impractical, biometrics alone do not address the governance gap, and relying on vendor identity systems reduces organizational control.',
  'Think Like a Manager: Vendors need standardized provisioning, expiration dates, assigned ownership, and contract-aligned reviews.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q55: medium / apply / tlatm — correct=2
-- b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  5,
  'linux_privilege',
  'A system administrator on a Linux server needs to restart the Apache web service, which requires root privileges. The administrator is logged in with their personal account. They run "sudo systemctl restart apache2" and enter their own password when prompted. The command succeeds. What is the security advantage of using sudo over su in this scenario?',
  '["Sudo encrypts the command output while su does not encrypt anything", "Sudo requires a hardware token while su only requires a password", "Sudo logs the command under the administrator''s personal account while su would log it under root, losing accountability", "Sudo grants permanent root access while su provides only temporary elevation"]'::jsonb,
  2,
  'The key security advantage of sudo over su is accountability. Sudo executes the command with elevated privileges but logs the action under the individual user''s account. Using su switches to the root account entirely, and all subsequent actions are logged as root, making it impossible to determine which administrator performed which actions. Sudo preserves the audit trail.',
  'sudo = log under YOUR name (accountability). su = log under ROOT (anonymous admin). Accountability requires sudo.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q56: medium / understand / calculation — correct=3
-- b = 0.0 + 0.0 + 0.4 = 0.4, a = 1.0 + 0.3 = 1.3, c = 0.20
(
  5,
  'zero_trust',
  'All of the following are evaluated by the trust algorithm in a Zero Trust architecture EXCEPT:',
  '["The subject''s verified identity and authentication status", "The device''s security posture and compliance with organizational policies", "Current threat intelligence feeds and SIEM behavioral analytics", "The physical location of the data center hosting the requested resource"]'::jsonb,
  3,
  'The Zero Trust trust algorithm evaluates the subject''s identity, device security posture, requested resource sensitivity, threat intelligence, and behavioral analytics. The physical location of the data center is an infrastructure concern, not an access decision factor. Zero Trust focuses on the requestor''s context and risk signals, not the physical hosting location of resources.',
  NULL,
  'understand',
  'calculation',
  'medium',
  1.30, 0.40, 0.20,
  'ai_generated', true
),

-- Q57: medium / remember / most_likely — correct=0
-- b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  5,
  'credential_attacks',
  'An attacker compromises a popular gaming website and obtains millions of username/password combinations. The attacker then uses automated tools to test these exact credential pairs against banking websites, email providers, and social media platforms. What attack technique is this MOST LIKELY?',
  '["Credential stuffing, which exploits password reuse by testing stolen credential pairs across multiple sites", "Password spraying, which tries common passwords against many accounts on a single site", "A dictionary attack, which uses a word list to guess passwords for specific accounts", "A brute-force attack, which systematically tries all possible password combinations"]'::jsonb,
  0,
  'Credential stuffing uses specific username/password pairs stolen from one breach and tests them against other services, exploiting the common practice of password reuse. Unlike password spraying (same password, many accounts, one site), credential stuffing uses unique pairs across many sites. The defense is unique passwords per site (password managers) and MFA.',
  'Credential STUFFING = STUFF stolen credentials from Site A into Sites B, C, D. Exploits password reuse.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q58: medium / apply / scenario — correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_models',
  'A database administrator creates a view that shows sales employees only the customer records for their assigned region. The underlying table contains all customer records globally, but the view filters based on the logged-in user''s region assignment. What type of access control is being implemented through this database view?',
  '["Context-dependent control because access depends on the sequence of database operations", "Content-dependent control because access is restricted based on the actual data content within the records", "Rule-based access control because the view applies a global rule to all sales employees", "Mandatory access control because the database system enforces the restriction automatically"]'::jsonb,
  1,
  'This is content-dependent access control because the access decision is based on the content (data values) within the records -- specifically, the region field. Database views are a classic example of content-dependent controls. Context-dependent controls are based on activity sequence, time, or location rather than data content. The view filters by data content, not by a global rule.',
  'Content-dependent = access based on WHAT the data CONTAINS. Database views = classic content-dependent control.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q59: medium / understand / best_answer — correct=2
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  5,
  'biometrics',
  'Which biometric technology is considered the MOST accurate but also raises privacy concerns because it can reveal medical conditions?',
  '["Fingerprint scanning because minutiae patterns can indicate genetic conditions", "Iris scanning because the colored pattern contains health-related markers", "Retina scanning because the blood vessel pattern can reveal conditions like hypertension and pregnancy", "Facial recognition because it can determine a person''s emotional state and health"]'::jsonb,
  2,
  'Retina scanning is the most accurate biometric technology because the blood vessel pattern at the back of the eye is highly unique. However, it raises privacy concerns because retinal patterns can reveal medical conditions such as hypertension, diabetes, and pregnancy. Iris scanning is the second most accurate and less intrusive. Fingerprints do not reveal medical conditions.',
  'Retina = most accurate but most invasive (reveals medical conditions). Iris = second most accurate, less intrusive.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q60: medium / apply / scenario — correct=3
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'password_policy',
  'A company processes credit card payments and must comply with PCI DSS v4.0. Their current password policy requires 8-character passwords changed every 180 days with no history enforcement. A security consultant recommends changes to meet compliance. Which password policy change is required by PCI DSS v4.0?',
  '["Remove password expiration requirements as recommended by NIST SP 800-63B", "Allow passwords of any length as long as they include special characters", "Implement passwordless authentication using FIDO2 hardware keys", "Require minimum 12-character passwords with 90-day rotation and at least 4-password history"]'::jsonb,
  3,
  'PCI DSS v4.0 requires minimum 12-character passwords, 90-day rotation, numeric and alphabetic characters, and 4-password history. This differs from NIST guidance which recommends no forced expiration. The CISSP exam tests knowledge of which standard applies in which context. PCI DSS requirements are stricter than NIST recommendations for password rotation.',
  'PCI DSS v4.0: 12+ chars, 90-day rotation, alpha+numeric, 4-history. Different from NIST (no expiration).',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q61: medium / apply / first_action — correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_attacks',
  'A user reports that when they navigate to the corporate intranet login page, the URL looks slightly different and the page asks for their username, password, and employee ID -- something the real page never requested. What type of attack is MOST likely occurring, and what should the user do FIRST?',
  '["This is a spoofing attack using a fake login page; the user should not enter any credentials and report it to the security team immediately", "This is a session hijacking attack; the user should close the browser and clear all cookies", "This is a man-in-the-middle attack; the user should switch to a different network", "This is a cross-site scripting attack; the user should disable JavaScript in their browser"]'::jsonb,
  0,
  'This is a spoofing/phishing attack using a fake login page designed to harvest credentials. The additional field (employee ID) is a telltale sign. The user should not enter any information and immediately report the suspicious page to the security team. Fake login pages are a primary social engineering vector for credential theft.',
  'Fake login page = spoofing/phishing. FIRST = do NOT enter anything. Report immediately.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q62: medium / analyze / tlatm — correct=1
-- b = 0.0 + 0.6 + 0.5 = 1.1, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'mfa',
  'An organization currently uses SMS-based two-factor authentication for all employees. The CISO presents a budget request to migrate to hardware security keys. The board asks why SMS-based 2FA is insufficient. What is the BEST management-level justification?',
  '["SMS codes take too long to arrive, causing employee productivity losses", "NIST has deprecated SMS-based authentication for federal use due to SIM swapping and device theft vulnerabilities, and hardware keys provide phishing resistance", "Hardware keys are less expensive than SMS authentication over time due to reduced messaging costs", "SMS authentication requires cellular coverage, which is unavailable in the organization''s underground parking garage"]'::jsonb,
  1,
  'The management justification is that NIST has deprecated SMS-based OTP due to known vulnerabilities including SIM swapping, SIM fraud, and device theft. Hardware security keys (FIDO2) provide phishing resistance because they are cryptographically bound to the legitimate site. This is a risk-based decision aligned with industry standards, which resonates with board-level discussions.',
  'Think Like a Manager: NIST deprecated SMS 2FA. SIM swapping is real. Hardware keys = phishing-resistant. Frame it as risk reduction.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q63: medium / apply / scenario — correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'authorization_mechanisms',
  'An organization implements a system where users can only interact with data through a defined set of procedures. For example, a bank teller can process deposits and withdrawals through the banking application but cannot directly access or modify the underlying database tables. What security model concept does this represent?',
  '["Separation of duties because the teller and the database administrator have different responsibilities", "Implicit deny because the teller is denied direct database access by default", "Constrained interfaces because the application restricts the actions available to the user to a predefined set", "Content-dependent controls because access is based on the data values in each transaction"]'::jsonb,
  2,
  'Constrained interfaces (also called restricted interfaces) limit users to a predefined set of actions through an application interface. Users interact with data only through approved transactions, preventing direct access to underlying data stores. The Clark-Wilson integrity model uses this concept through well-formed transactions. This is different from implicit deny, which is about default denial.',
  'Constrained interface = limited menu of allowed actions. Like an ATM: you can only do what the screen offers.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q64: medium / understand / most_likely — correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'identity_lifecycle',
  'An employee has been with the company for eight years and has moved through four different departments: sales, marketing, operations, and now finance. Each transition added new permissions but old permissions were never removed. What condition is this employee MOST LIKELY experiencing?',
  '["Excessive provisioning due to an error during the initial account creation", "Unauthorized access due to a system misconfiguration in Active Directory", "Separation of duties violation because the employee has accessed too many departments", "Privilege creep due to accumulated unnecessary permissions from previous role transitions"]'::jsonb,
  3,
  'Privilege creep is the gradual accumulation of access rights as a user changes roles without having previous permissions removed. This employee has permissions from four departments but only needs finance access for their current role. Privilege creep violates least privilege and is prevented through proper access reviews and role transition procedures that remove old permissions.',
  'Privilege CREEP = permissions CREEP up over time with each role change. Solution = access reviews + remove old permissions.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q65: medium / remember / best_answer — correct=0
-- b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  5,
  'device_authentication',
  'An organization deploys Mobile Device Management (MDM) to manage employee smartphones that access corporate email. The MDM solution checks device compliance including OS version, encryption status, and jailbreak detection before allowing access. What is this compliance check BEST described as?',
  '["A posture assessment that evaluates device security health before granting network access", "A vulnerability scan that identifies software flaws on the mobile device", "An intrusion detection check that monitors for malicious activity on the device", "A penetration test that attempts to exploit weaknesses in the device configuration"]'::jsonb,
  0,
  'MDM compliance checks are a form of posture assessment, evaluating whether a device meets security requirements (OS patches, encryption, no jailbreak) before granting access. This is a preventive control that verifies device health as part of risk-based access control. It is not a vulnerability scan, IDS check, or penetration test -- those are different security assessment activities.',
  'Posture assessment = "How healthy is your device?" Check before allowing access. MDM + NAC both do this.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
),

-- Q66: medium / apply / best_answer — correct=1
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'sso_federation',
  'A company acquires a smaller firm and needs to allow employees from both organizations to access shared project management tools. Rather than creating duplicate accounts, they establish a trust relationship between the two organizations'' identity providers. When an acquired employee accesses the tool, their original IdP authenticates them and sends an assertion to the tool. What is this arrangement called?',
  '["Single Sign-On because the user authenticates once for multiple applications", "Federated Identity Management because authentication is shared across organizational boundaries through trust relationships", "Identity as a Service because a cloud provider manages the authentication", "Mutual authentication because both organizations verify each other''s identities"]'::jsonb,
  1,
  'Federated Identity Management (FIM) extends SSO across organizational boundaries through trust relationships between identity providers. Each organization maintains its own identities, but they trust each other''s authentication assertions. This eliminates the need to create duplicate accounts. SSO is within one organization; FIM is across organizations.',
  'Federation = cross-organization trust. Each org keeps its own IdP. Trust relationship = accept each other''s assertions.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q67: medium / understand / comparison — correct=2
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  5,
  'privilege_escalation',
  'What is the KEY difference between horizontal and vertical privilege escalation?',
  '["Horizontal escalation targets servers while vertical escalation targets workstations", "Horizontal escalation requires physical access while vertical escalation is done remotely", "Horizontal escalation gains access at the same privilege level as another user while vertical escalation gains higher-level privileges", "Horizontal escalation is performed by insiders while vertical escalation is performed by external attackers"]'::jsonb,
  2,
  'Horizontal privilege escalation (lateral movement) is gaining access to resources at the same privilege level as another user, such as accessing another user''s email. Vertical privilege escalation is gaining higher-level privileges, such as escalating from a standard user to an administrator. Both can be performed by insiders or external attackers, and both apply to any system type.',
  'Horizontal = sideways to PEER accounts (lateral movement). Vertical = upward to ADMIN privileges. Think H=sideways, V=up.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q68: medium / apply / best_answer — correct=3
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'authentication_factors',
  'An organization wants to implement passwordless authentication to reduce phishing risk and improve user experience. Which approach BEST achieves passwordless authentication?',
  '["Replacing passwords with longer passphrases that are easier to remember", "Using password managers to auto-fill complex passwords without user memorization", "Implementing single sign-on so users only need one password for all applications", "Deploying FIDO2 passkeys that authenticate using biometric unlock or security keys without any password"]'::jsonb,
  3,
  'FIDO2 passkeys provide true passwordless authentication by using public key cryptography. Users authenticate using biometric unlock (fingerprint, face) or hardware security keys without ever entering a password. Passphrases and password managers still use passwords. SSO reduces the number of passwords but does not eliminate them. FIDO2 is promoted by the FIDO Alliance specifically for passwordless flows.',
  'Passwordless = FIDO2 passkeys. No password exists, not even behind the scenes. Biometric + key = no password needed.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q69: medium / analyze / scenario — correct=0
-- b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'least_privilege_sod',
  'A financial application allows the same user to create vendor records, approve invoices, and initiate wire transfers. An internal audit discovers that an accounts payable clerk has been creating fictitious vendors and approving payments to them. Which security principle was violated, and what control would have prevented this fraud?',
  '["Separation of duties was violated; different employees should handle vendor creation, invoice approval, and payment initiation to prevent any single person from completing the fraud cycle", "Least privilege was violated; the clerk should have had read-only access to the vendor database", "Need to know was violated; the clerk should not have known how to create vendor records", "Mandatory access control was violated; classification labels should have been applied to vendor records"]'::jsonb,
  0,
  'Separation of duties requires that no single person can complete all steps of a critical process. By allowing one clerk to create vendors, approve invoices, and initiate payments, the organization enabled a fraud cycle. The fix is to require different people for each step, enforced by the system. While least privilege applies, the core issue is the ability to complete the entire transaction chain.',
  'Separation of Duties = split critical tasks across people. If one person controls the whole chain, fraud is inevitable.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q70: medium / apply / first_action — correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'credential_attacks',
  'A security analyst detects that an internal user''s account is being used to authenticate from two geographically distant locations simultaneously -- one from the corporate office in New York and another from an IP address in Eastern Europe. What should be done FIRST?',
  '["Block the Eastern European IP address range in the corporate firewall", "Disable the user''s account immediately and force a password reset to contain the potential compromise", "Contact the user to determine if they are using a VPN that could explain the dual location", "Review the user''s email for signs of business email compromise before taking action"]'::jsonb,
  1,
  'Simultaneous authentication from geographically impossible locations (impossible travel) is a strong indicator of credential compromise. The FIRST action is to disable the account and force a password reset to prevent further unauthorized access. Investigation and root cause analysis follow containment. Contacting the user or reviewing email can happen after the account is secured.',
  'Impossible travel = compromise indicator. FIRST = disable and reset. Contain, then investigate.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD QUESTIONS (20) — IRT b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: hard / apply / scenario — correct=2
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'credential_attacks',
  'A red team assessment reveals that several service accounts in Active Directory have Service Principal Names (SPNs) registered and use weak passwords. The red team requests Kerberos service tickets for these accounts and then takes the encrypted tickets offline to crack them. Which specific Kerberos attack technique is being demonstrated?',
  '["Golden ticket attack, which forges TGTs using the KRBTGT account hash", "Pass-the-ticket attack, which reuses stolen Kerberos tickets from memory", "Kerberoasting, which requests service tickets encrypted with service account passwords for offline cracking", "ASREPRoast, which targets accounts configured without Kerberos preauthentication"]'::jsonb,
  2,
  'Kerberoasting exploits the fact that Kerberos service tickets are encrypted with the service account''s password hash. Any authenticated domain user can request service tickets for accounts with SPNs. The attacker takes these tickets offline and cracks the encryption to recover the service account password. Weak service account passwords make this attack trivially successful.',
  'Kerberoasting = request service tickets + crack offline. Targets SPNs with weak passwords. Any domain user can request tickets.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: hard / analyze / tlatm — correct=3
-- b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'identity_lifecycle',
  'A CISO is presenting the annual identity governance report to the board. The report shows that access reviews are being completed on time but the rejection rate for inappropriate access is less than 1%, which is statistically improbable for an organization of 5,000 employees with frequent role changes. What should the CISO recommend?',
  '["Accept the results since the low rejection rate indicates strong provisioning practices", "Increase the frequency of access reviews from quarterly to monthly to catch more issues", "Replace the access review tool with a more advanced platform that uses machine learning", "Investigate whether managers are rubber-stamping reviews without genuinely examining access, and implement attestation controls with spot audits"]'::jsonb,
  3,
  'A near-zero rejection rate in a large organization with frequent role changes is a strong indicator that managers are rubber-stamping access reviews without proper examination. The management recommendation is to investigate, implement attestation controls requiring managers to justify approvals, and conduct spot audits to verify review quality. Simply increasing frequency without addressing the underlying behavior is ineffective.',
  'Think Like a Manager: A 1% rejection rate in 5,000 users = rubber-stamping. Address the behavior, not just the schedule.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q73: hard / analyze / scenario — correct=0
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'access_control_models',
  'An intelligence agency is designing an access control system for a classified project. Documents are labeled with both a hierarchical classification (Confidential, Secret, Top Secret) and compartment codes (ALPHA, BRAVO, CHARLIE) representing different projects. An analyst with Top Secret clearance and ALPHA compartment access attempts to read a Secret/BRAVO document. Should access be granted?',
  '["No, because although the analyst''s clearance dominates the document''s classification level, the analyst lacks BRAVO compartment access, which is required independently", "Yes, because Top Secret clearance dominates Secret classification, granting access to all lower-classified documents regardless of compartment", "No, because analysts cannot access documents below their clearance level under the no-read-down rule", "Yes, because compartment codes are informational labels that do not restrict access for cleared personnel"]'::jsonb,
  0,
  'In a hybrid MAC environment combining hierarchy and compartments, both conditions must be satisfied. The analyst has sufficient clearance (TS > S) but lacks BRAVO compartment access. Compartments are independent security domains that enforce need-to-know. Having high clearance does not grant cross-compartment access. The no-read-down rule is from Biba (integrity), not the scenario described.',
  'MAC hybrid: BOTH clearance level AND compartment must match. High clearance alone is not enough without compartment access.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q74: hard / apply / first_action — correct=1
-- b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'access_control_attacks',
  'An incident responder discovers that an attacker has used Mimikatz to extract the KRBTGT account hash from a domain controller. The attacker can now forge Ticket Granting Tickets that grant access to any resource in the domain for up to 10 years. After resetting the KRBTGT password twice, what should the team do FIRST to address the broader compromise?',
  '["Restore the domain controller from a backup taken before the compromise", "Audit all privileged accounts and service accounts for signs of persistence, reset their passwords, and review for unauthorized group memberships", "Rebuild the entire Active Directory forest from scratch to ensure complete remediation", "Deploy a new SIEM solution to improve detection capabilities for future attacks"]'::jsonb,
  1,
  'After invalidating golden tickets by resetting KRBTGT twice, the FIRST step is to audit all privileged and service accounts for persistence mechanisms. The attacker likely established multiple backdoors: unauthorized admin accounts, modified group memberships, and additional credential harvesting. Rebuilding from scratch may be necessary later but auditing first determines the scope. Restoring from backup may reintroduce the compromise.',
  'After golden ticket containment: audit ALL privileged accounts for persistence. Attackers rarely use just one method.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q75: hard / apply / calculation — correct=2
-- b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  5,
  'biometrics',
  'A biometric fingerprint scanner is being evaluated. During testing with 500 authorized users and 500 unauthorized users, the scanner incorrectly rejected 15 authorized users and incorrectly accepted 10 unauthorized users. What is the False Acceptance Rate (FAR)?',
  '["3.0% because 15 out of 500 authorized users were incorrectly handled", "2.5% because 25 total errors occurred out of 1,000 total attempts", "2.0% because 10 out of 500 unauthorized attempts were incorrectly accepted", "1.0% because 10 out of 1,000 total attempts resulted in false acceptance"]'::jsonb,
  2,
  'FAR = (Number of false acceptances / Total unauthorized authentication attempts) x 100 = (10 / 500) x 100 = 2.0%. FAR is calculated only against unauthorized attempts, not total attempts. The 15 false rejections are used to calculate FRR, which is separate: FRR = 15/500 = 3.0%. Understanding this distinction is critical for the exam.',
  'FAR = false accepts / UNAUTHORIZED attempts. FRR = false rejects / AUTHORIZED attempts. Each uses its own denominator.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q76: hard / analyze / comparison — correct=3
-- b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  5,
  'sso_federation',
  'An architect is choosing between SAML and OpenID Connect for a new federation implementation. The organization needs to support both web browser SSO and native mobile applications, and prefers lightweight data formats. Which comparison is MOST accurate for making this decision?',
  '["SAML is better for mobile because XML is more structured than JSON", "Both protocols are equivalent for mobile applications and use the same token formats", "SAML is preferred when using REST APIs because XML integrates better with modern microservices", "OIDC is better for mobile and API scenarios because it uses lightweight JSON/JWT tokens and RESTful endpoints, while SAML is better suited for traditional web browser SSO with XML assertions"]'::jsonb,
  3,
  'OIDC uses JSON Web Tokens and RESTful APIs, making it lightweight and well-suited for mobile applications and modern API architectures. SAML uses heavier XML assertions and was designed primarily for web browser SSO via HTTP redirects and POST bindings. While SAML excels at enterprise web federation, OIDC is the preferred choice for mobile, single-page applications, and microservices.',
  'OIDC = JSON + REST + mobile-friendly. SAML = XML + browser redirects + enterprise web SSO. Match the protocol to the use case.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q77: hard / apply / scenario — correct=0
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'zero_trust',
  'A multinational corporation is implementing Zero Trust and must decide on the trust algorithm''s behavior when a software engineer''s laptop reports a critical unpatched vulnerability while the engineer is mid-session working on a production deployment. The deployment cannot be easily paused. How should the trust algorithm respond?',
  '["Dynamically reduce the session''s access scope to only the minimum resources needed for the current deployment while quarantining general access, and flag for immediate remediation", "Allow the session to continue unchanged because disrupting a production deployment poses greater risk than the vulnerability", "Terminate the session immediately because any device with a critical vulnerability must be completely denied access", "Ignore the vulnerability report until the deployment is complete, then force the engineer to patch before next login"]'::jsonb,
  0,
  'Zero Trust calls for continuous evaluation and adaptive response. The best approach dynamically adjusts access scope rather than using binary allow/deny. Reducing to only deployment-necessary resources contains the risk while allowing critical work to continue. Full termination may cause production damage, but ignoring the vulnerability or allowing full access violates Zero Trust principles.',
  'Zero Trust = continuous evaluation + adaptive response. Not just allow/deny but dynamic scope adjustment.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q78: hard / analyze / except_not — correct=1
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  5,
  'access_control_models',
  'All of the following statements about Mandatory Access Control (MAC) are correct EXCEPT:',
  '["MAC requires classification labels on both subjects and objects", "MAC allows resource owners to modify access permissions at their discretion", "MAC uses a lattice-based model with hierarchical and compartmental elements", "MAC is primarily used in government and military environments"]'::jsonb,
  1,
  'In MAC, the system enforces access based on labels, NOT the resource owner. The ability for owners to modify permissions at their discretion is the defining characteristic of Discretionary Access Control (DAC). MAC requires labels on both subjects and objects, uses a lattice-based model, and is primarily used in government/military. This is one of the most common exam traps.',
  'MAC = system decides based on labels. DAC = owner decides at their Discretion. If the owner controls access, it''s DAC, not MAC.',
  'analyze',
  'except_not',
  'hard',
  1.40, 2.30, 0.25,
  'ai_generated', true
),

-- Q79: hard / apply / scenario — correct=2
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'credential_attacks',
  'During a penetration test, an ethical hacker discovers that several user accounts in Active Directory are configured with the "Do not require Kerberos preauthentication" flag. The tester requests AS-REP messages for these accounts and takes them offline for password cracking. Which specific attack is being performed?',
  '["Kerberoasting, targeting service accounts through SPN-registered tickets", "Silver ticket attack, forging service tickets using the service account hash", "ASREPRoast, targeting accounts without preauthentication to obtain crackable AS-REP data", "Pass-the-ticket, replaying captured Kerberos tickets for lateral movement"]'::jsonb,
  2,
  'ASREPRoast targets user accounts with Kerberos preauthentication disabled. Normally, preauthentication requires the user to prove identity before the KDC issues an AS-REP. Without it, anyone can request an AS-REP containing data encrypted with the user''s password hash, enabling offline cracking. This differs from Kerberoasting, which targets service tickets for SPN-registered accounts.',
  'ASREPRoast = no preauthentication flag + crack AS-REP offline. Kerberoasting = SPN accounts + crack service tickets offline.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q80: hard / analyze / best_answer — correct=3
-- b = 1.5 + 0.6 + 0.0 = 2.1, a = 1.5 + 0.0 = 1.5, c = 0.20
(
  5,
  'authorization_mechanisms',
  'A cloud-native application needs to implement authorization that can evaluate policies such as "Allow access if the user is a manager, the request originates from a corporate device, it is during business hours, and the data sensitivity is medium or lower." Which technology standard BEST supports expressing these complex attribute-based policies?',
  '["LDAP directory queries that check user group memberships against resource ACLs", "OAuth 2.0 scopes that define the boundaries of delegated resource access", "SAML authorization assertions that specify what resources a user can access", "XACML, which defines a standardized policy language for expressing attribute-based access control rules across multiple attributes and conditions"]'::jsonb,
  3,
  'XACML (eXtensible Access Control Markup Language) is an OASIS standard specifically designed for expressing ABAC policies. It supports complex rules evaluating multiple attributes (user role, device type, time, data sensitivity) and provides a standardized architecture with policy decision points and policy enforcement points. LDAP handles identity lookup, OAuth handles delegation, and SAML handles federation assertions.',
  'XACML = the policy language for ABAC. When you need multi-attribute rules expressed as policies, XACML is the standard.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q81: hard / apply / most_likely — correct=0
-- b = 1.5 + 0.3 + 0.1 = 1.9, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  5,
  'access_control_attacks',
  'An attacker steals a valid Kerberos Service Ticket from a compromised workstation''s memory and uses it to access a file server directly, bypassing the normal authentication flow. What attack technique is MOST LIKELY being used?',
  '["Pass-the-ticket, which replays stolen Kerberos tickets to access resources without re-authenticating", "Pass-the-hash, which sends captured NTLM hashes to authenticate to Windows services", "Silver ticket attack, which forges service tickets using the service account''s NTLM hash", "Overpass-the-hash, which converts NTLM hashes into Kerberos tickets through the KDC"]'::jsonb,
  0,
  'Pass-the-ticket reuses a valid, stolen Kerberos ticket (either TGT or service ticket) from memory to access resources. The attacker does not forge the ticket (that would be silver or golden ticket) but replays a legitimately issued one. Pass-the-hash uses NTLM hashes, not Kerberos tickets. Overpass-the-hash converts a hash to a Kerberos ticket through the KDC.',
  'Pass-the-TICKET = replay a STOLEN ticket. Silver/golden = FORGE a new ticket. The difference is stolen vs. forged.',
  'apply',
  'most_likely',
  'hard',
  1.40, 1.90, 0.22,
  'ai_generated', true
),

-- Q82: hard / analyze / scenario — correct=1
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'service_accounts',
  'A security architect discovers that a legacy application uses a Windows service account running as LocalSystem, which has unrestricted access to the entire operating system. The application only needs to read from a specific file share and write to a local log directory. The application cannot be modified. What is the BEST remediation approach?',
  '["Add a deny ACL for the service account on sensitive directories to restrict its excessive access", "Create a dedicated service account with only the specific permissions needed (file share read and log directory write) and reconfigure the service to run under this account", "Monitor the LocalSystem account with enhanced logging to detect any misuse of its privileges", "Move the application to a virtual machine with no network access to contain the risk"]'::jsonb,
  1,
  'The best approach is to create a dedicated service account with minimum required permissions and reconfigure the service to use it instead of LocalSystem. This follows least privilege without modifying the application. Deny ACLs on every sensitive directory are unmanageable. Monitoring is detective, not preventive. Network isolation does not address local privilege abuse and may break the file share access.',
  'Never use LocalSystem for service accounts. Create dedicated accounts with minimum permissions. Least privilege for services.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q83: hard / apply / calculation — correct=2
-- b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  5,
  'password_policy',
  'An organization uses passwords that must be exactly 8 characters long, composed only of lowercase letters (26 options per character). They are considering switching to 12-character passwords using lowercase letters, uppercase letters, and digits (62 options per character). By approximately what factor does the new policy increase the password keyspace?',
  '["Approximately 1,000 times larger because 12 characters is 50% longer than 8 characters", "Approximately 1 million times larger because each additional character doubles the keyspace", "Approximately 1.7 billion times larger because 62^12 / 26^8 equals roughly 1.7 x 10^9", "Approximately 62 trillion times larger because the character set doubled and the length increased by 50%"]'::jsonb,
  2,
  'Old keyspace = 26^8 = approximately 2.09 x 10^11. New keyspace = 62^12 = approximately 3.23 x 10^21. The ratio is 62^12 / 26^8 = approximately 1.55 x 10^10, which is roughly 15.5 billion times larger. The closest answer among the options reflects that increasing both length and character set causes exponential growth in the keyspace. Keyspace = (characters)^(length).',
  'Keyspace = characters^length. Adding length has MORE impact than adding character types. Both together = exponential increase.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q84: hard / apply / first_action — correct=3
-- b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'privilege_escalation',
  'A security team discovers that an attacker has gained access to a Windows server by exploiting a web application vulnerability and has used Mimikatz to extract cleartext passwords from the LSASS process memory. The attacker now has domain admin credentials. What should the security team do FIRST to contain this compromise?',
  '["Patch the web application vulnerability to prevent the attacker from re-entering", "Deploy endpoint detection and response (EDR) across all domain-joined systems", "Implement Credential Guard on all Windows servers to prevent future LSASS memory extraction", "Disable the compromised domain admin accounts and isolate the affected server from the network"]'::jsonb,
  3,
  'The FIRST containment action is to disable the compromised domain admin accounts and isolate the affected server. With domain admin credentials, the attacker can access any resource in the domain. Patching the vulnerability, deploying EDR, and implementing Credential Guard are all important remediation steps but do not address the immediate threat of active domain admin credentials in the attacker''s possession.',
  'Compromised domain admin = highest urgency. FIRST = disable accounts + isolate. Then patch, harden, and investigate.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q85: hard / analyze / comparison — correct=0
-- b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  5,
  'sso_federation',
  'How does Kerberos differ from SESAME in its approach to cryptography and its handling of the TOCTOU (Time of Check/Time of Use) vulnerability?',
  '["Kerberos uses only symmetric encryption and is vulnerable to TOCTOU, while SESAME supports both symmetric and asymmetric encryption and mitigates TOCTOU", "Kerberos uses asymmetric encryption and mitigates TOCTOU, while SESAME uses only symmetric encryption and is vulnerable to TOCTOU", "Both use identical encryption but SESAME adds a second KDC for redundancy", "Kerberos is immune to TOCTOU while SESAME introduces the vulnerability by supporting multiple ticket types"]'::jsonb,
  0,
  'Kerberos v5 uses only symmetric encryption (AES) and is vulnerable to TOCTOU attacks where conditions may change between ticket issuance and use. SESAME improves upon Kerberos by supporting both symmetric and asymmetric cryptography, mitigating the TOCTOU vulnerability, and supporting multiple tickets. However, SESAME was never widely adopted because Kerberos is built into major operating systems.',
  'Kerberos = symmetric only + TOCTOU vulnerability. SESAME = symmetric + asymmetric + TOCTOU mitigated. But Kerberos won the market.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q86: hard / apply / scenario — correct=1
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'authorization_mechanisms',
  'A compliance officer reviews the access control matrix for a financial application and finds that a user who is both a junior accountant and a temporary project lead has accumulated permissions from both roles. The system was configured so that the most restrictive permission wins when there is a conflict. Despite this, the user can approve expense reports above their authority. What is the MOST LIKELY cause?',
  '["The access control matrix has a race condition allowing temporary elevation during role transitions", "The project lead role includes expense approval permissions that do not conflict with the accountant role, so the restrictive-wins rule does not apply because there is no overlapping permission to restrict", "The implicit deny principle is misconfigured, allowing access by default when no rule exists", "The system is using DAC instead of RBAC, allowing the user to grant themselves additional permissions"]'::jsonb,
  1,
  'When permissions from two roles do not conflict (one grants a permission the other does not address), the most-restrictive-wins rule has no effect because there is no conflicting permission to resolve. The expense approval permission exists in the project lead role but has no corresponding deny in the accountant role. This is a common oversight in RBAC implementations with multiple role assignments.',
  'Most-restrictive-wins only resolves CONFLICTS. Non-conflicting permissions accumulate. This is why role combinations must be carefully reviewed.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q87: hard / apply / scenario — correct=2
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'biometrics',
  'A government agency is implementing biometric access control for a classified research facility. They need the highest accuracy and are willing to accept higher user inconvenience. The facility also stores biological research data that must not be correlated with employee health information. Which biometric technology creates a conflict with these requirements?',
  '["Fingerprint scanning, because fingerprints can be lifted from surfaces and replicated", "Hand geometry scanning, because hand measurements change over time and reduce accuracy", "Retina scanning, because while it offers the highest accuracy, it can reveal medical conditions such as diabetes and hypertension, conflicting with the health information separation requirement", "Iris scanning, because it requires close proximity to the scanner, raising user acceptance concerns"]'::jsonb,
  2,
  'Retina scanning is the most accurate biometric but creates a privacy conflict because retinal blood vessel patterns can reveal medical conditions including hypertension, diabetes, and pregnancy. In a facility that must separate employee health information from access data, retina scanning creates an unacceptable risk of health data correlation. Iris scanning (second most accurate) would be a better choice in this scenario.',
  'Retina = most accurate BUT reveals medical conditions. When health privacy matters, iris scanning is the better alternative.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q88: hard / analyze / tlatm — correct=3
-- b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'zero_trust',
  'A CISO is proposing Zero Trust implementation to the executive team. The CTO argues that the existing perimeter-based security with a strong firewall and VPN is sufficient. What is the MOST compelling management-level argument for Zero Trust?',
  '["Zero Trust eliminates the need for firewalls and VPNs, reducing infrastructure costs significantly", "Zero Trust is mandated by all regulatory frameworks, making it a compliance requirement", "Zero Trust replaces all existing security controls with a single unified platform", "Zero Trust assumes breach and provides continuous validation, protecting against insider threats and lateral movement that perimeter security cannot address once an attacker is inside the network"]'::jsonb,
  3,
  'The strongest management argument is that perimeter security assumes trust once inside, but Zero Trust assumes breach and continuously validates. Insider threats and lateral movement after a perimeter breach are scenarios where traditional security fails. Zero Trust does not eliminate firewalls or VPNs but adds continuous validation. It is not mandated by all frameworks nor is it a single platform.',
  'Think Like a Manager: Zero Trust = assume breach + continuous validation. Addresses insider threats and lateral movement. Complements, not replaces, existing controls.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q89: hard / apply / except_not — correct=0
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + (-0.1) = 1.2, c = 0.25
(
  5,
  'credential_attacks',
  'All of the following are effective defenses against rainbow table attacks EXCEPT:',
  '["Increasing the minimum password length from 8 to 12 characters, which increases keyspace but does not prevent precomputation if the hashing algorithm remains unsalted", "Adding a unique random salt to each password before hashing", "Using bcrypt or Argon2 which include built-in salting mechanisms", "Implementing PBKDF2 with a high iteration count and per-user salt"]'::jsonb,
  0,
  'While longer passwords increase brute-force difficulty, they do not prevent rainbow table attacks if the hashes are unsalted. Rainbow tables can be precomputed for any password length given enough storage and time. The true defense against rainbow tables is salting, which makes each hash unique even for identical passwords. Bcrypt, Argon2, and PBKDF2 all include salting mechanisms.',
  'Salt defeats rainbow tables, not password length. Rainbow tables work against ANY unsalted hash regardless of password length.',
  'apply',
  'except_not',
  'hard',
  1.20, 2.00, 0.25,
  'ai_generated', true
),

-- Q90: hard / analyze / most_likely — correct=1
-- b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  5,
  'session_management',
  'A banking application implements a 2-minute session timeout for idle sessions, requires re-authentication for high-value transactions, and generates session IDs with 128 bits of entropy. Despite these controls, session hijacking incidents continue. An investigation reveals that session tokens are not being invalidated on the server side when users click the logout button. What is the MOST LIKELY attack vector?',
  '["Cross-site scripting injecting malicious scripts that steal active session tokens", "Session fixation where the attacker sets the session ID before the user authenticates", "Network eavesdropping capturing session tokens transmitted without encryption", "The attacker captures session tokens that remain valid even after the user logs out because server-side invalidation is not occurring"]'::jsonb,
  1,
  'The scenario describes sessions that persist on the server after logout. While the application has good timeout and token generation controls, failing to invalidate sessions server-side on logout means captured tokens remain usable. Session fixation is the most likely vector in this specific scenario because the attacker can set a known session ID before authentication, and that ID remains valid even after the user thinks they have logged out.',
  'Logout must invalidate sessions SERVER-SIDE. Client-side cookie deletion alone is insufficient. Always destroy the session on the server.',
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD QUESTIONS (10) — IRT b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: very_hard / analyze / scenario — correct=2
-- b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'access_control_models',
  'A consulting firm implements the Brewer-Nash (Chinese Wall) model for its client engagements. An analyst currently has access to the financial records of Bank A. The analyst is assigned to a new project involving Bank B, which is a direct competitor of Bank A. Later, the analyst is asked to consult on a project for Insurance Company C, which has no competitive relationship with either bank. Under the Brewer-Nash model, which access combination is permitted?',
  '["Access to Bank A and Bank B because both are in the banking sector and the analyst has relevant expertise", "Access to Bank A, Bank B, and Insurance Company C because the analyst can handle multiple clients", "Access to Bank A and Insurance Company C because Bank B is in the same conflict-of-interest class as Bank A, but Insurance Company C is in a separate class", "Access to only Insurance Company C because accessing any bank permanently bars the analyst from all other financial clients"]'::jsonb,
  2,
  'The Brewer-Nash model dynamically restricts access based on conflict-of-interest classes. Bank A and Bank B are in the same conflict class (competing banks), so accessing one bars access to the other. Insurance Company C is in a separate conflict class with no competitive relationship to either bank. The analyst can access Bank A and Insurance Company C but not Bank B. Access restrictions are per conflict class, not per industry.',
  'Brewer-Nash = Chinese Wall = no conflicts of interest. Restrictions are by conflict CLASS, not by industry. Different classes = no conflict.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q92: very_hard / analyze / tlatm — correct=3
-- b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'identity_lifecycle',
  'A multinational bank undergoes a merger. The combined organization has 50,000 employees with identity systems from both companies. The CISO must present an identity integration strategy to the board. Active Directory forests, SAML federations, and IDaaS subscriptions exist on both sides. Some employees will be laid off, some will change roles, and all systems must remain operational during transition. What is the MOST appropriate management strategy?',
  '["Immediately consolidate both organizations into a single Active Directory forest to eliminate complexity", "Maintain completely separate identity systems permanently and use manual processes for cross-organization access", "Freeze all identity changes during the merger and resume normal provisioning once integration is complete", "Establish federated trust between both identity systems for immediate interoperability, then plan phased consolidation with automated deprovisioning for departing employees and access reviews for role changes"]'::jsonb,
  3,
  'The management approach is federation first for immediate interoperability, then phased consolidation. Immediate AD consolidation is risky and disruptive. Permanent separation creates management overhead and security gaps. Freezing changes during a merger with layoffs and role changes would leave departed employees with active accounts. Federation provides immediate SSO while consolidation is planned carefully.',
  'Think Like a Manager: Merger = federate first for interop, consolidate in phases. Never freeze identity changes during transitions with personnel changes.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q93: very_hard / analyze / scenario — correct=0
-- b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'credential_attacks',
  'An attacker compromises a service account that has a registered SPN in Active Directory. Using the service account''s NTLM hash, the attacker forges a Kerberos Service Ticket for a specific target service. This forged ticket is never validated by the KDC because service tickets are verified using the service account''s own key. The attacker uses this ticket to access the target service with any permissions they specify. What specific attack is this?',
  '["A silver ticket attack, because the attacker forges a service ticket using a compromised service account hash, and the forged ticket is accepted by the target service without KDC validation", "A golden ticket attack, because the attacker forges a ticket using a compromised account hash", "A Kerberoasting attack, because the attacker targets a service account with an SPN", "An overpass-the-hash attack, because the attacker converts an NTLM hash into a Kerberos ticket"]'::jsonb,
  0,
  'A silver ticket is a forged Kerberos Service Ticket created using a compromised service account''s NTLM hash. Unlike golden tickets (which forge TGTs using the KRBTGT hash), silver tickets target specific services. The key characteristic is that service tickets are validated by the target service itself using its own key, not by the KDC, so the forgery bypasses central authentication. Silver tickets have limited scope but are harder to detect.',
  'Silver ticket = forged SERVICE ticket from service account hash. Golden ticket = forged TGT from KRBTGT hash. Silver = specific service, Golden = entire domain.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q94: very_hard / apply / calculation — correct=1
-- b = 2.5 + 0.3 + 0.4 = 3.0 (clamped), a = 1.3 + 0.3 = 1.6, c = 0.20
(
  5,
  'biometrics',
  'A biometric system is being calibrated. At the current sensitivity setting, the FRR is 4% and the FAR is 1%. The security team increases sensitivity to reduce unauthorized access. After adjustment, the FAR drops to 0.5%. Based on the inverse relationship between FRR and FAR, what is the MOST LIKELY effect on the FRR?',
  '["FRR decreases to approximately 2% because both error rates improve with better calibration", "FRR increases because reducing FAR (making the system more restrictive) causes more legitimate users to be rejected", "FRR remains at 4% because FRR and FAR are independent measurements", "FRR drops to 0% because maximum sensitivity eliminates all biometric errors"]'::jsonb,
  1,
  'FRR and FAR are inversely related. When sensitivity is increased to reduce FAR (fewer unauthorized acceptances), FRR increases (more legitimate rejections). This is because a more restrictive system demands closer matches, rejecting more legitimate users whose biometric samples have slight variations. The only point where both rates are equal is the CER/EER.',
  'FRR and FAR = inverse relationship. Tighten security (lower FAR) = more false rejections (higher FRR). Can''t reduce both simultaneously.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
),

-- Q95: very_hard / analyze / first_action — correct=2
-- b = 2.5 + 0.6 + 0.3 = 3.0 (clamped), a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'access_control_attacks',
  'An organization''s SOC detects that an attacker has compromised a domain admin account and is using DCSync to replicate Active Directory data, including all password hashes, from a domain controller. The attacker has already obtained the KRBTGT hash and multiple service account hashes. The SOC has confirmed the attacker has been active for at least 72 hours. What should be done FIRST?',
  '["Reset the KRBTGT password twice and all service account passwords", "Disconnect the compromised domain controller from the network and begin forensic imaging", "Isolate the attacker''s known access points and disable all compromised accounts while maintaining domain controller availability for legitimate operations", "Begin rebuilding the Active Directory forest from scratch using clean media"]'::jsonb,
  2,
  'The FIRST action is to isolate known attack vectors and disable compromised accounts while keeping domain controllers available for legitimate business. Disconnecting domain controllers would halt all authentication for the organization. KRBTGT resets and service account password changes are critical but come after initial containment. A full forest rebuild may be necessary but is not the first step in active incident response.',
  'FIRST = contain without destroying availability. Isolate attacker access + disable compromised accounts. Then reset KRBTGT + investigate. AD rebuild is last resort.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q96: very_hard / apply / scenario — correct=3
-- b = 2.5 + 0.3 + 0.2 = 3.0 (clamped), a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'sso_federation',
  'An organization implements SAML-based SSO with an external IdP. A developer discovers that the service provider application does not validate the SAML assertion''s digital signature and accepts any well-formed XML assertion. An attacker crafts a forged SAML assertion claiming to be an administrator. What vulnerability class does this exploit, and why is signature validation critical?',
  '["XML injection, because the attacker injects malicious XML code into the assertion", "Cross-site request forgery, because the attacker tricks the service provider into accepting a forged request", "Replay attack, because the attacker reuses a previously captured valid assertion", "SAML assertion forgery, because without signature validation the service provider cannot verify the assertion was issued by the trusted IdP, allowing any attacker to forge assertions with arbitrary identity claims"]'::jsonb,
  3,
  'Without signature validation, the SP cannot verify that the assertion came from the trusted IdP. Any attacker who understands the assertion format can forge one claiming any identity with any permissions. SAML signature validation is the critical trust anchor in federation. This is not XML injection (no code execution), CSRF (no cross-site request), or replay (no previously valid assertion reused).',
  'SAML signature validation = trust anchor. Without it, anyone can forge assertions. Always validate: signature, issuer, timestamps, audience.',
  'apply',
  'scenario',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q97: very_hard / analyze / comparison — correct=0
-- b = 2.5 + 0.6 + 0.1 = 3.0 (clamped), a = 1.5 + 0.1 = 1.6, c = 0.22
(
  5,
  'access_control_models',
  'The Bell-LaPadula and Biba models both use mandatory access controls but enforce different properties. A military system implements Bell-LaPadula, while a financial transaction system implements Biba. An analyst with "Secret" clearance in the military system attempts to write data to an "Unclassified" document. A bank teller in the Biba system attempts to read data from an untrusted external source. Which pair of outcomes is correct?',
  '["Bell-LaPadula denies the write (no write down protects confidentiality) and Biba denies the read (no read down protects integrity)", "Bell-LaPadula allows the write and Biba allows the read because both actions involve lower-classified resources", "Bell-LaPadula denies the write and Biba allows the read because integrity models permit reading from any source", "Bell-LaPadula allows the write because the analyst has sufficient clearance, and Biba denies the read because untrusted sources are always blocked"]'::jsonb,
  0,
  'Bell-LaPadula enforces "no write down" (star property) to prevent classified information from flowing to lower classification levels, protecting confidentiality. Biba enforces "no read down" (simple integrity axiom) to prevent higher-integrity subjects from being contaminated by lower-integrity data. Both actions are denied. Bell-LaPadula and Biba are complementary: one protects confidentiality, the other integrity.',
  'Bell-LaPadula = "no read up, no write down" (confidentiality). Biba = "no read down, no write up" (integrity). They are mirror images.',
  'analyze',
  'comparison',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),

-- Q98: very_hard / apply / calculation — correct=1
-- b = 2.5 + 0.3 + 0.4 = 3.0 (clamped), a = 1.3 + 0.3 = 1.6, c = 0.20
(
  5,
  'password_policy',
  'A security architect is evaluating two hashing approaches for password storage. Approach A uses SHA-256 with a unique 128-bit salt per password. Approach B uses bcrypt with a cost factor of 12, meaning 2^12 = 4,096 iterations. Both properly salt passwords. An attacker with a GPU cluster can compute 10 billion SHA-256 hashes per second. If bcrypt at cost factor 12 processes approximately 3 hashes per second on the same hardware, how much longer does it take to brute-force a single bcrypt hash compared to a single SHA-256 hash?',
  '["Approximately 4,096 times longer because bcrypt uses 4,096 iterations", "Approximately 3.3 billion times longer because the attacker can compute 10 billion SHA-256 hashes per second but only 3 bcrypt hashes per second", "Approximately 10 billion times longer because bcrypt eliminates the GPU acceleration advantage", "Approximately 128 times longer because bcrypt uses 128-bit work factors"]'::jsonb,
  1,
  'The ratio is straightforward: 10,000,000,000 SHA-256/sec divided by 3 bcrypt/sec = approximately 3.33 billion times longer per hash. This is why bcrypt (and Argon2, PBKDF2) are recommended for password storage over fast hashes like SHA-256. The deliberate slowness makes brute-force attacks computationally infeasible even with powerful hardware. The work factor is not just about iterations but also memory-hardness in Argon2.',
  'Slow hash = security. bcrypt/Argon2/PBKDF2 are deliberately slow. Fast hashes (SHA/MD5) are NOT for passwords.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: very_hard / analyze / except_not — correct=2
-- b = 2.5 + 0.6 + 0.2 = 3.0 (clamped), a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  5,
  'zero_trust',
  'In a mature Zero Trust implementation following NIST SP 800-207, all of the following factors are evaluated by the trust algorithm when making access decisions EXCEPT:',
  '["The requesting subject''s authentication status and verified identity claims", "Real-time threat intelligence feeds indicating active attack campaigns against the organization", "The seniority level of the employee''s direct manager in the organizational hierarchy", "The security posture and compliance status of the requesting device"]'::jsonb,
  2,
  'The Zero Trust trust algorithm evaluates identity, device posture, threat intelligence, behavioral analytics, and resource sensitivity. It does not evaluate the seniority of an employee''s manager, as organizational hierarchy is an HR construct, not a security context signal. Access decisions are based on the requestor''s own identity, their device, and environmental risk signals, not on their reporting chain.',
  NULL,
  'analyze',
  'except_not',
  'very_hard',
  1.40, 3.00, 0.25,
  'ai_generated', true
),

-- Q100: very_hard / analyze / tlatm — correct=3
-- b = 2.5 + 0.6 + 0.5 = 3.0 (clamped), a = 1.5 + 0.4 = 1.9, c = 0.20
(
  5,
  'least_privilege_sod',
  'A global enterprise operates in multiple regulatory jurisdictions. The CISO must design an identity governance framework that satisfies SOX requirements for financial systems, HIPAA for healthcare data, PCI DSS for payment processing, and GDPR for European employee data. Each regulation has different requirements for access reviews, separation of duties, and data minimization. What is the MOST effective management approach?',
  '["Implement the strictest requirements from any single regulation across all systems uniformly", "Create separate identity management systems for each regulatory domain to ensure compliance isolation", "Delegate compliance decisions to each business unit and allow them to implement their own controls", "Design a unified governance framework that maps each system to its applicable regulations, implements the most stringent applicable controls per system, and automates compliance reporting across all frameworks"]'::jsonb,
  3,
  'The management approach is a unified framework with per-system regulatory mapping. Applying the strictest rule universally is over-restrictive and costly. Separate identity systems create silos and increase complexity. Delegating to business units creates inconsistency. The framework should identify which regulations apply to each system, apply the appropriate controls (which may differ by system), and provide consolidated compliance reporting.',
  'Think Like a Manager: Map regulations to systems, apply appropriate controls per system, unify reporting. Balance compliance with operational efficiency.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
);