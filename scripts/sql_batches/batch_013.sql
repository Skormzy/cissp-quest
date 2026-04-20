INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;