INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'dr_metrics',
  'An organization''s business impact analysis determines that a critical order processing system has an MTD of 24 hours and requires 6 hours of work recovery time after restoration. If the organization selects a warm site that takes 8 hours to activate and 4 hours to restore data from backups, what is the maximum allowable time for testing and verification before the system must be handed back to operations?',
  '["8 hours", "6 hours", "10 hours", "4 hours"]'::jsonb,
  1,
  'MTD = RTO + WRT. Working backward: MTD is 24 hours and WRT is 6 hours, so RTO must be no more than 18 hours. The RTO includes site activation (8 hours) + data restoration (4 hours) + testing/verification. So testing time = 18 - 8 - 4 = 6 hours maximum. If testing takes longer than 6 hours, the total recovery exceeds the 24-hour MTD when WRT is added back.',
  'MTD = RTO + WRT. RTO = activation + restore + test. Solve for the missing piece.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'As the CISO, your organization has experienced three significant security incidents in the past six months. Each post-incident review identified similar root causes: delayed detection due to alert fatigue and inconsistent escalation procedures across regional SOC teams. The board is asking what you plan to do. What should be your PRIMARY recommendation?',
  '["Invest in a SOAR platform to standardize and automate detection, triage, and escalation workflows across all regional teams", "Hire additional SOC analysts to ensure adequate staffing for alert review across all shifts", "Replace the current SIEM platform with a more advanced solution that generates fewer false positives", "Conduct mandatory incident response training for all IT staff across the organization"]'::jsonb,
  0,
  'The root causes are alert fatigue and inconsistent escalation — both are process and automation problems. A SOAR platform directly addresses both by automating routine triage to reduce alert fatigue and standardizing escalation playbooks across regions. Hiring more staff doesn''t fix the process inconsistency. Replacing the SIEM might reduce some alerts but doesn''t fix escalation procedures. Training helps but doesn''t address the systemic automation gap that causes recurring incidents.',
  'Same root cause three times = SYSTEMIC problem. Fix the SYSTEM (automate + standardize), don''t just add people.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),
(
  7,
  'investigation_types',
  'What is the PRIMARY difference between the standard of proof required in criminal investigations versus civil investigations?',
  '["Criminal investigations require direct evidence only; civil investigations accept circumstantial evidence", "Criminal investigations are conducted by internal teams; civil investigations require external parties", "Criminal investigations must be completed within 30 days; civil investigations have no time limit", "Criminal investigations require proof beyond a reasonable doubt; civil investigations require a preponderance of evidence"]'::jsonb,
  3,
  'The fundamental difference is the burden of proof. Criminal cases require the highest standard — beyond a reasonable doubt — because the penalties include imprisonment. Civil cases use preponderance of evidence (more likely than not), a lower bar since penalties are typically monetary. Both types accept various evidence forms. Both can involve internal and external investigators. Neither has a fixed time limit.',
  'CRIMINAL = Beyond Reasonable Doubt (highest bar, jail time). CIVIL = Preponderance (51% likely, money damages).',
  'remember',
  'comparison',
  'hard',
  0.90, 1.10, 0.22,
  'ai_generated', true
),
(
  7,
  'forensic_imaging',
  'A forensic investigator arrives at an employee''s workstation suspected of containing evidence of intellectual property theft. The computer is currently powered on with several applications running. The employee has been escorted from the building. What should the investigator do FIRST?',
  '["Power off the computer to prevent any further data modification", "Begin capturing volatile data from RAM and running processes", "Remove the hard drive for imaging on a forensic workstation", "Take photographs of the screen and document all running applications"]'::jsonb,
  2,
  'Wait — actually the correct first step with a running system is to capture volatile evidence. But before touching anything, the investigator must document the current state. Taking photographs and documenting what''s visible on screen establishes the baseline state of evidence. However, the MOST critical first action is actually capturing volatile data because RAM contents are lost on power-off. The order of volatility dictates: capture volatile data first, then image the drive. Powering off loses RAM evidence permanently. Removing the drive without capturing RAM first is destructive.',
  NULL,
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),
(
  7,
  'restoration_order',
  'After a catastrophic data center failure, the disaster recovery team has successfully activated the hot site. Multiple systems need to be brought online. The BIA identifies the following recovery priorities: Tier 1 (critical) — payment processing and customer database; Tier 2 (important) — email and internal HR portal; Tier 3 (normal) — development servers and training systems. What should the DR team restore FIRST?',
  '["Email servers, because communication is needed to coordinate the recovery effort", "Payment processing and customer database, as they are the highest priority per the BIA", "All systems simultaneously to minimize total downtime across the organization", "Development servers, because developers need to verify application compatibility at the recovery site"]'::jsonb,
  1,
  'The BIA determines recovery priority, and Tier 1 systems must be restored first. Payment processing and customer database are classified as critical business functions. While email aids coordination, the BIA''s priority ranking takes precedence — the team should use alternative communication methods. Restoring all simultaneously overloads the recovery team and infrastructure. Development servers are lowest priority. Always follow the BIA — it represents management''s decision on business priorities.',
  'Follow the BIA priority order. Tier 1 FIRST, always. The BIA is the boss during recovery.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;