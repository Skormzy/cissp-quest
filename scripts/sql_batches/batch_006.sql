INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;