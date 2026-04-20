INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
)
ON CONFLICT (question_text) DO NOTHING;