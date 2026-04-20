INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;