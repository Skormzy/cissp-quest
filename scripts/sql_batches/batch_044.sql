INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'forensic_imaging',
  'A forensic examiner creates a bit-for-bit copy of a suspect''s hard drive. After creating the image, the examiner generates an MD5 hash of both the original drive and the forensic copy. The hashes match. What does this verify?',
  '["The forensic copy is an exact duplicate of the original drive and the data has not been altered", "The original drive has never been tampered with by the suspect", "The data on the drive is authentic and admissible in court", "The chain of custody has been properly maintained"]'::jsonb,
  0,
  'Matching hash values between the original drive and the forensic copy verify that the copy is an exact, unaltered duplicate of the original. This ensures data integrity of the forensic image. It does not prove the original was never tampered with, nor does it guarantee admissibility or chain of custody. Hash verification is one component of maintaining evidence integrity.',
  'HASH MATCH = Exact copy confirmed. Same hash = same data, bit for bit.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),
(
  7,
  'containment_strategies',
  'A security operations center detects that an attacker has compromised a web server and is actively exfiltrating customer data. The web server hosts a critical e-commerce application generating $50,000 per hour in revenue. The SOC team needs to decide on a containment strategy. Which approach BEST balances security and business needs?',
  '["Shut down the web server immediately to stop the exfiltration", "Isolate the web server at the network level while redirecting traffic to a backup server", "Allow the attack to continue while monitoring to gather intelligence on the attacker", "Notify customers of the breach before taking any technical action"]'::jsonb,
  1,
  'Network-level isolation stops the exfiltration while redirecting traffic to a backup server maintains business operations. This balances security (stopping the breach) with business continuity (maintaining revenue). Shutting down entirely stops revenue unnecessarily. Allowing continued exfiltration increases liability. Customer notification is required but is not a containment action.',
  NULL,
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'Your organization''s SIEM generates an alert indicating a potential data breach affecting servers containing personally identifiable information (PII). As the incident response lead, what should be your FIRST action?',
  '["Immediately notify all affected customers about the potential breach", "Begin reformatting affected servers to eliminate the threat", "Verify and validate the alert to confirm whether an actual incident has occurred", "Contact law enforcement to report the potential breach"]'::jsonb,
  2,
  'Before taking any major action, the incident response lead must first verify and validate the alert. SIEM alerts can be false positives, and launching a full response without confirmation wastes resources and may cause unnecessary business disruption. Once confirmed as a real incident, the team can proceed to containment, notification, and other response steps in the proper order.',
  'Verify before you mobilize. Don''t pull the fire alarm until you confirm there''s actually smoke.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  7,
  'investigation_types',
  'An organization suspects an employee has been embezzling funds over the past year. Which type of investigation is MOST appropriate?',
  '["Criminal investigation led by law enforcement", "Regulatory investigation led by industry body", "Operational investigation led by IT department", "Administrative investigation led by management with HR and legal support"]'::jsonb,
  3,
  'An administrative investigation is an internal organizational investigation into policy violations or misconduct. Suspected embezzlement by an employee starts as an administrative matter handled by management, HR, and legal counsel. If evidence supports criminal activity, the organization may then refer the matter to law enforcement for a criminal investigation, but the initial investigation is administrative.',
  'Internal employee issue = Administrative investigation FIRST. Keep it in-house initially, then escalate if needed.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  7,
  'dr_metrics',
  'A financial services company determines that its core banking application can tolerate a maximum of 4 hours of downtime before suffering unacceptable business impact. The IT team estimates system restoration will take 2.5 hours, and data verification will require 1 hour. What is the current risk status regarding MTD?',
  '["The organization is within acceptable limits because RTO (2.5h) + WRT (1h) = 3.5h, which is less than MTD (4h)", "The organization exceeds MTD because the total downtime would be 7.5 hours", "The organization needs to increase its MTD to 6 hours to be safe", "The organization should eliminate WRT to ensure faster recovery"]'::jsonb,
  0,
  'MTD = RTO + WRT. In this scenario, RTO is 2.5 hours and WRT is 1 hour, totaling 3.5 hours. Since 3.5 hours is less than the 4-hour MTD, the organization is within acceptable limits. You cannot simply eliminate WRT because verifying data integrity after restoration is a critical step. MTD is determined by business impact, not adjusted to fit technical capabilities.',
  'MTD = RTO + WRT. Always check: does RTO + WRT fit inside the MTD window? If yes, you''re safe.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;