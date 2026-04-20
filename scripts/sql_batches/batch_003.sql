INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;