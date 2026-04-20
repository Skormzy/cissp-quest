INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;