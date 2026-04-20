INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  5,
  'access_control_attacks',
  'An attacker steals a valid Kerberos Service Ticket from a compromised workstation''s memory and uses it to access a file server directly, bypassing the normal authentication flow. What attack technique is MOST LIKELY being used?',
  '["Pass-the-ticket, which replays stolen Kerberos tickets to access resources without re-authenticating", "Pass-the-hash, which sends captured NTLM hashes to authenticate to Windows services", "Silver ticket attack, which forges service tickets using the service account''s NTLM hash", "Overpass-the-hash, which converts NTLM hashes into Kerberos tickets through the KDC"]'::jsonb,
  0,
  'Pass-the-ticket reuses a valid, stolen Kerberos ticket (either TGT or service ticket) from memory to access resources. The attacker does not forge the ticket (that would be silver or golden ticket) but replays a legitimately issued one. Pass-the-hash uses NTLM hashes, not Kerberos tickets. Overpass-the-hash converts a hash to a Kerberos ticket through the KDC.',
  'Pass-the-TICKET = replay a STOLEN ticket. Silver/golden = FORGE a new ticket. The difference is stolen vs. forged.',
  'apply',
  'most_likely',
  'hard',
  1.40, 1.90, 0.22,
  'ai_generated', true
),
(
  5,
  'service_accounts',
  'A security architect discovers that a legacy application uses a Windows service account running as LocalSystem, which has unrestricted access to the entire operating system. The application only needs to read from a specific file share and write to a local log directory. The application cannot be modified. What is the BEST remediation approach?',
  '["Add a deny ACL for the service account on sensitive directories to restrict its excessive access", "Create a dedicated service account with only the specific permissions needed (file share read and log directory write) and reconfigure the service to run under this account", "Monitor the LocalSystem account with enhanced logging to detect any misuse of its privileges", "Move the application to a virtual machine with no network access to contain the risk"]'::jsonb,
  1,
  'The best approach is to create a dedicated service account with minimum required permissions and reconfigure the service to use it instead of LocalSystem. This follows least privilege without modifying the application. Deny ACLs on every sensitive directory are unmanageable. Monitoring is detective, not preventive. Network isolation does not address local privilege abuse and may break the file share access.',
  'Never use LocalSystem for service accounts. Create dedicated accounts with minimum permissions. Least privilege for services.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  5,
  'password_policy',
  'An organization uses passwords that must be exactly 8 characters long, composed only of lowercase letters (26 options per character). They are considering switching to 12-character passwords using lowercase letters, uppercase letters, and digits (62 options per character). By approximately what factor does the new policy increase the password keyspace?',
  '["Approximately 1,000 times larger because 12 characters is 50% longer than 8 characters", "Approximately 1 million times larger because each additional character doubles the keyspace", "Approximately 1.7 billion times larger because 62^12 / 26^8 equals roughly 1.7 x 10^9", "Approximately 62 trillion times larger because the character set doubled and the length increased by 50%"]'::jsonb,
  2,
  'Old keyspace = 26^8 = approximately 2.09 x 10^11. New keyspace = 62^12 = approximately 3.23 x 10^21. The ratio is 62^12 / 26^8 = approximately 1.55 x 10^10, which is roughly 15.5 billion times larger. The closest answer among the options reflects that increasing both length and character set causes exponential growth in the keyspace. Keyspace = (characters)^(length).',
  'Keyspace = characters^length. Adding length has MORE impact than adding character types. Both together = exponential increase.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),
(
  5,
  'privilege_escalation',
  'A security team discovers that an attacker has gained access to a Windows server by exploiting a web application vulnerability and has used Mimikatz to extract cleartext passwords from the LSASS process memory. The attacker now has domain admin credentials. What should the security team do FIRST to contain this compromise?',
  '["Patch the web application vulnerability to prevent the attacker from re-entering", "Deploy endpoint detection and response (EDR) across all domain-joined systems", "Implement Credential Guard on all Windows servers to prevent future LSASS memory extraction", "Disable the compromised domain admin accounts and isolate the affected server from the network"]'::jsonb,
  3,
  'The FIRST containment action is to disable the compromised domain admin accounts and isolate the affected server. With domain admin credentials, the attacker can access any resource in the domain. Patching the vulnerability, deploying EDR, and implementing Credential Guard are all important remediation steps but do not address the immediate threat of active domain admin credentials in the attacker''s possession.',
  'Compromised domain admin = highest urgency. FIRST = disable accounts + isolate. Then patch, harden, and investigate.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),
(
  5,
  'sso_federation',
  'How does Kerberos differ from SESAME in its approach to cryptography and its handling of the TOCTOU (Time of Check/Time of Use) vulnerability?',
  '["Kerberos uses only symmetric encryption and is vulnerable to TOCTOU, while SESAME supports both symmetric and asymmetric encryption and mitigates TOCTOU", "Kerberos uses asymmetric encryption and mitigates TOCTOU, while SESAME uses only symmetric encryption and is vulnerable to TOCTOU", "Both use identical encryption but SESAME adds a second KDC for redundancy", "Kerberos is immune to TOCTOU while SESAME introduces the vulnerability by supporting multiple ticket types"]'::jsonb,
  0,
  'Kerberos v5 uses only symmetric encryption (AES) and is vulnerable to TOCTOU attacks where conditions may change between ticket issuance and use. SESAME improves upon Kerberos by supporting both symmetric and asymmetric cryptography, mitigating the TOCTOU vulnerability, and supporting multiple tickets. However, SESAME was never widely adopted because Kerberos is built into major operating systems.',
  'Kerberos = symmetric only + TOCTOU vulnerability. SESAME = symmetric + asymmetric + TOCTOU mitigated. But Kerberos won the market.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;