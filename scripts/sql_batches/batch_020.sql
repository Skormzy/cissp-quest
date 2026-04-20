INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;