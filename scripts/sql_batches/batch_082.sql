INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  1,
  'control_types',
  'An organization experienced a data breach where an employee emailed a customer database to their personal account before resigning. In response, management wants to implement controls to prevent future insider data theft. The security team proposes: (A) DLP monitoring on all email gateways, (B) mandatory exit interviews with asset review, (C) a policy requiring all departing employees to sign a data handling acknowledgment, and (D) quarterly access reviews for all users with access to sensitive databases. Which combination represents the correct pairing of control categories?',
  '["A=Technical/Detective, B=Administrative/Corrective, C=Administrative/Deterrent, D=Technical/Preventive", "A=Technical/Preventive, B=Administrative/Detective, C=Administrative/Deterrent, D=Administrative/Detective", "A=Technical/Detective, B=Administrative/Preventive, C=Administrative/Preventive, D=Administrative/Corrective", "A=Technical/Corrective, B=Administrative/Detective, C=Administrative/Directive, D=Technical/Preventive"]'::jsonb,
  1,
  'DLP can block (prevent) outbound data — it''s Technical/Preventive. Exit interviews with asset review detect whether company data was taken — Administrative/Detective. Requiring signatures deters (discourages) data theft through awareness of consequences — Administrative/Deterrent. Quarterly access reviews detect excessive permissions — Administrative/Detective. The key distinctions: DLP actively blocks, making it preventive not just detective. Exit interviews discover after-the-fact. Signing acknowledgments create psychological deterrence.',
  'Controls have TWO dimensions: Category (Admin/Technical/Physical) × Function (Preventive/Detective/Corrective/Deterrent). Match BOTH.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  1,
  'privacy_laws',
  'A US-based company with European customers receives a GDPR data subject access request from an EU citizen asking for all personal data the company holds about them. The company has never processed a DSAR before. Which of the following BEST describes the company''s obligation?',
  '["Provide all personal data within 30 days, in a commonly used machine-readable format, free of charge for the first request", "Provide only the data stored in the primary customer database within 60 days for a reasonable administrative fee", "Redirect the request to the company''s EU-based data processor for handling within 90 days", "Provide a summary of data categories held but not the actual data to protect other customers'' privacy"]'::jsonb,
  0,
  'Under GDPR Article 15, organizations must provide all personal data within one month (approximately 30 days), in a structured, commonly used, machine-readable format, free of charge for the first request. The response must cover ALL systems where personal data is stored, not just the primary database. The controller (not processor) is responsible for responding. A summary of categories is insufficient — the actual data must be provided.',
  'GDPR DSAR: ALL data, 30 days, machine-readable, FREE (first time). No shortcuts.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  1,
  'risk_analysis_quantitative',
  'A financial institution''s web application server has an asset value of $800,000. Analysis shows that a successful SQL injection attack would compromise 60% of the server''s value. Historical data indicates such attacks occur approximately twice every five years. What is the Annualized Loss Expectancy?',
  '["$480,000", "$960,000", "$240,000", "$192,000"]'::jsonb,
  3,
  'ALE = SLE × ARO. The SLE = Asset Value × Exposure Factor = $800,000 × 0.60 = $480,000. The ARO = 2 attacks per 5 years = 0.4 attacks per year. Therefore ALE = $480,000 × 0.4 = $192,000. This means the expected annual loss from SQL injection is $192,000, which sets the maximum justifiable annual spend on countermeasures.',
  'ALE = SLE × ARO. SLE = AV × EF. Always convert "per X years" to annual rate (divide).',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  2,
  'dlp',
  'A multinational bank deploys network-based DLP to prevent sensitive data exfiltration. After three months, a security audit reveals that engineers in the R&D department have been successfully exfiltrating proprietary trading algorithms by encrypting files before emailing them to personal accounts. The DLP system never flagged these transmissions. What is the MOST effective remediation?',
  '["Upgrade the DLP solution to one that can decrypt TLS traffic in real-time for content inspection", "Deploy endpoint DLP agents that inspect content before encryption occurs on the workstation", "Block all personal email services at the network firewall to prevent data exfiltration", "Implement a policy requiring all engineers to use only company-approved encryption tools"]'::jsonb,
  1,
  'Network DLP cannot inspect encrypted content — this is a fundamental limitation. Endpoint DLP inspects files at the point of creation or before encryption, catching sensitive data before it''s encrypted. Decrypting TLS at the network level introduces significant privacy and performance concerns and may not catch pre-encrypted attachments. Blocking personal email is easily bypassed with other transfer methods. Policy alone doesn''t provide technical enforcement. The fix must be at the endpoint, before encryption.',
  'Network DLP is BLIND to encryption. Move DLP to the ENDPOINT to see data BEFORE it''s encrypted.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),
(
  2,
  'pseudonymization_tokenization',
  'A hospital system needs to share patient treatment outcome data with medical researchers while complying with HIPAA privacy requirements. The researchers need to track individual patient journeys across multiple visits but do not need to know patient identities. Which data protection technique BEST meets these requirements?',
  '["Full anonymization by removing all identifying fields from the dataset", "Encryption of patient names using AES-256 with researcher-provided keys", "Pseudonymization by replacing patient identifiers with consistent tokens that allow re-linking across visits", "Data masking by replacing the first three characters of patient names with asterisks"]'::jsonb,
  2,
  'Pseudonymization replaces identifying information with consistent pseudonyms, allowing researchers to track the same patient across visits without knowing their identity. Full anonymization would prevent tracking patient journeys across visits since there''s no linking key. Encryption with researcher keys would give researchers the ability to decrypt identities. Data masking is insufficient for privacy protection and may still allow re-identification. GDPR and HIPAA both recognize pseudonymization as a valid privacy-preserving technique.',
  'Pseudonymization: consistent substitution, reversible by the holder. Anonymization: permanent, irreversible. Choose based on whether you need to RE-LINK.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;