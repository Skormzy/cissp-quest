INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;