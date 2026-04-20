INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  5,
  'biometrics',
  'A government facility is evaluating biometric authentication systems for its secure area entrance. The security officer wants to minimize the risk of unauthorized persons gaining access, even if it means some authorized employees will occasionally be denied entry. Which biometric system configuration should the security officer select?',
  '["A system tuned for a low Crossover Error Rate to balance security and convenience", "A system tuned for a high False Acceptance Rate to ensure quick throughput", "A system tuned for a low False Acceptance Rate, accepting a higher False Rejection Rate as a trade-off", "A system tuned for a low False Rejection Rate to minimize employee inconvenience"]'::jsonb,
  2,
  'The security officer prioritizes preventing unauthorized access (low FAR) over convenience (accepting higher FRR). False Acceptance Rate measures how often the system incorrectly accepts unauthorized users — lowering this directly reduces unauthorized access. The trade-off is a higher False Rejection Rate, meaning authorized employees will occasionally be rejected and need to retry. A low CER balances both but doesn''t prioritize security. High FAR is the opposite of the requirement. Low FRR prioritizes convenience over security.',
  'High security = low FAR (don''t let bad guys in). High convenience = low FRR (don''t lock good guys out). CER is the balance point.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  5,
  'identity_lifecycle',
  'During a quarterly access review, an auditor discovers 340 active accounts belonging to employees who left the organization between 3 and 18 months ago. Several of these orphaned accounts have VPN access and elevated database permissions. What should the IAM team do FIRST?',
  '["Generate a detailed report of all orphaned accounts and present it to management for review", "Immediately disable all 340 orphaned accounts and revoke their VPN and database access", "Investigate whether any of the orphaned accounts show signs of unauthorized usage before taking action", "Update the offboarding procedure to prevent this from happening in the future"]'::jsonb,
  1,
  'With 340 accounts having VPN and elevated database access for up to 18 months after employee departure, the immediate priority is eliminating the active threat by disabling all accounts. This stops any potential unauthorized access immediately. Investigation of usage patterns is important but secondary — you close the unlocked doors first, then check if anyone walked through them. Generating a report delays remediation. Updating procedures prevents recurrence but doesn''t address the existing 340-account exposure.',
  'Orphaned accounts = unlocked doors. DISABLE first, investigate second, fix the process third. Stop the bleeding immediately.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),
(
  5,
  'radius_tacacs',
  'A network administrator is choosing between RADIUS and TACACS+ for managing access to 200 network devices. The security requirements include: encrypting the full authentication session, separate authorization for different command levels on switches, and detailed accounting of all commands executed. Which protocol BEST meets these requirements?',
  '["RADIUS, because it is the industry standard for network device authentication", "RADIUS, because it combines authentication and authorization into a single efficient process", "TACACS+, because it uses UDP for faster performance in network device environments", "TACACS+, because it encrypts the entire packet payload, separates AAA functions independently, and supports per-command authorization"]'::jsonb,
  3,
  'TACACS+ meets all three requirements: it encrypts the entire packet payload (RADIUS only encrypts the password), separates authentication, authorization, and accounting as independent functions (allowing granular per-command authorization), and provides detailed command-level accounting. RADIUS combines authn/authz, making per-command authorization impossible. RADIUS being the standard for network access doesn''t address the specific requirements. TACACS+ uses TCP (port 49), not UDP — RADIUS uses UDP.',
  'TACACS+ = full encryption + separate AAA + per-command auth. RADIUS = password-only encryption + combined authn/authz. Cisco devices prefer TACACS+.',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),
(
  6,
  'penetration_testing',
  'A penetration testing team completes a white-box test of a financial application and reports finding a critical SQL injection vulnerability. The development team claims the finding is a false positive because their WAF blocks all SQL injection attempts. The pen testers demonstrate that the vulnerability is exploitable by using encoding techniques to bypass the WAF. However, the development team argues that in a real attack scenario, the WAF would be tuned to catch these encoding variations. What is the MOST appropriate resolution?',
  '["The SQL injection vulnerability must be fixed in the application code regardless of WAF protection, because defense in depth requires fixing root causes rather than relying on compensating controls that can be bypassed", "Accept the WAF as adequate mitigation and close the finding since the WAF will be tuned to catch the bypass", "Classify the finding as informational since the WAF provides sufficient protection in the production environment", "Conduct a black-box test to verify whether the vulnerability is exploitable without knowledge of the WAF configuration"]'::jsonb,
  0,
  'Defense in depth requires fixing vulnerabilities at their source. A WAF is a compensating control that can be bypassed — the pen test demonstrated this. Relying solely on a WAF means a single control failure leads to exploitation. The application code is the root cause and must be fixed. Accepting the WAF alone violates secure coding principles. Informational classification understates a critical finding. A black-box test doesn''t change the underlying vulnerability. Fix the code AND keep the WAF for defense in depth.',
  'WAF is a BANDAID, not a cure. Fix the ROOT CAUSE in code. Defense in depth = fix the vuln AND keep the compensating control.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  6,
  'sast_dast_iast',
  'A DevSecOps team wants to integrate security testing into their CI/CD pipeline. The application processes credit card data and must comply with PCI DSS. They need testing that can find vulnerabilities early in development and also test the running application. Which testing strategy BEST achieves comprehensive coverage?',
  '["Run DAST in production only, since it tests the real application environment", "Run SAST before every commit to catch all vulnerabilities before deployment", "Integrate SAST in the build pipeline to catch code-level vulnerabilities early, and DAST in the staging environment to find runtime and configuration issues before production", "Run IAST in development only, which combines the benefits of both SAST and DAST"]'::jsonb,
  2,
  'Combining SAST and DAST provides comprehensive coverage. SAST analyzes source code during build, catching injection flaws, hardcoded secrets, and insecure patterns before deployment. DAST tests the running application in staging, finding runtime vulnerabilities like misconfigurations, authentication flaws, and issues that only manifest in the deployed state. DAST in production risks disruption. SAST alone misses runtime issues. IAST is valuable but development-only testing misses staging environment configurations. The combination covers both code and runtime.',
  'SAST in BUILD (see the code). DAST in STAGING (see the app). Together = comprehensive pipeline security.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;