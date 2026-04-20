INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;