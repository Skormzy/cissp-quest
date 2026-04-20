INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;