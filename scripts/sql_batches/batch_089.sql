INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'recovery_sites',
  'An organization is selecting a disaster recovery site. The RTO from the BIA is 4 hours and the RPO is 15 minutes. The organization processes real-time financial transactions. Which recovery site type BEST meets these requirements?',
  '["A hot site with real-time data replication, pre-configured systems, and the ability to begin operations within 1-2 hours of activation", "A warm site with daily backup restoration capability and a 12-24 hour activation time", "A cold site with network connectivity and power, requiring 48-72 hours to procure and install equipment", "A mobile site that can be deployed to any location within 8-12 hours"]'::jsonb,
  0,
  'With a 4-hour RTO and 15-minute RPO, only a hot site meets both requirements. Hot sites maintain real-time or near-real-time data replication (meeting the 15-minute RPO) and can begin operations within hours (meeting the 4-hour RTO). A warm site with daily backups would lose up to 24 hours of data, violating the 15-minute RPO. A cold site''s 48-72 hour activation far exceeds the 4-hour RTO. A mobile site''s deployment time also exceeds the RTO.',
  'Match the site to the metrics: Hot site = hours RTO, minutes RPO. Warm = day RTO, hours RPO. Cold = days RTO, day RPO.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'A hospital''s SIEM detects ransomware actively encrypting files on a network share used by the radiology department. The affected share contains current patient imaging studies needed for ongoing surgeries. Surgeons report they cannot access critical images for a patient currently under anesthesia. The backup system has yesterday''s images. What should the incident response team do FIRST?',
  '["Restore the entire network share from yesterday''s backup immediately", "Isolate the infected system to stop the encryption spread, then restore the specific critical patient files from backup to enable the surgery to proceed", "Pay the ransom to decrypt the files since a patient''s life is at immediate risk", "Shut down the entire hospital network to prevent the ransomware from spreading further"]'::jsonb,
  1,
  'Life safety is the top priority. The response must balance stopping the attack with enabling the critical surgery. Isolating the infected system stops the ransomware spread while minimizing disruption. Restoring the specific patient files needed for the active surgery addresses the immediate life-safety concern. A full share restore takes too long for the patient under anesthesia. Paying ransom is never recommended and doesn''t guarantee decryption. Shutting down the entire network disrupts all hospital operations including life-critical systems beyond just this surgery.',
  'LIFE SAFETY first, always. Contain the threat, restore what''s needed for the patient. Surgical precision in incident response.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  7,
  'raid_levels',
  'A database administrator needs to configure storage for a high-transaction OLTP database that requires both fast write performance and fault tolerance. The database performs many small random writes throughout the day. The administrator has 6 identical drives available. Which RAID configuration provides the BEST balance of write performance and redundancy for this workload?',
  '["RAID 5, which distributes parity across all drives for good read performance", "RAID 1, which mirrors two drives for simple redundancy", "RAID 10, which combines striping and mirroring for fast writes with drive failure tolerance", "RAID 6, which uses double distributed parity for maximum fault tolerance"]'::jsonb,
  2,
  'RAID 10 is optimal for OLTP databases with heavy random writes. It stripes across mirrored pairs, providing fast write performance because writes go to two drives simultaneously (no parity calculation). RAID 5 suffers from the write penalty — every write requires reading old data, reading old parity, calculating new parity, and writing both — making it 4 I/O operations per write. RAID 1 with only 2 drives provides minimal capacity. RAID 6 has an even worse write penalty than RAID 5 with double parity calculations.',
  'RAID 10 for DATABASES (writes!). RAID 5 for FILE SERVERS (reads). Write-heavy = avoid parity overhead.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'drp_testing',
  'What is the PRIMARY advantage of a tabletop exercise over a simulation test for disaster recovery plan validation?',
  '["A tabletop exercise validates the plan with minimal cost and operational risk by walking through scenarios verbally, making it ideal for initial plan validation and identifying gaps in roles and communication", "A tabletop exercise provides more realistic results because participants physically perform recovery procedures", "A tabletop exercise is more comprehensive because it tests both technical and communication aspects simultaneously", "A tabletop exercise takes longer but provides higher confidence in the plan''s effectiveness"]'::jsonb,
  0,
  'Tabletop exercises gather decision-makers around a table to walk through disaster scenarios verbally, discussing roles, responsibilities, and responses. Their primary advantage is low cost and zero operational risk — no systems are affected. They excel at identifying communication gaps, unclear responsibilities, and decision-making bottlenecks. Simulation tests actually activate recovery procedures, providing more realistic validation but with greater cost and risk. Tabletop exercises don''t physically test procedures — that''s what simulations do. They''re typically shorter, not longer.',
  'Tabletop = TALK through it (cheap, safe, finds gaps). Simulation = DO it (expensive, realistic, validates procedures). Start with tabletop.',
  'analyze',
  'comparison',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),
(
  7,
  'backup_strategies',
  'An organization performs full backups Sunday night and incremental backups Monday through Saturday. A server crash occurs on Thursday afternoon and the system must be restored. The backup administrator discovers that Wednesday''s incremental backup tape has a read error and is unusable. What is the MOST appropriate recovery approach?',
  '["Restore only from Sunday''s full backup, accepting the loss of Monday through Thursday''s data", "Restore from Sunday''s full backup plus Monday''s and Tuesday''s incremental backups, accepting the loss of Wednesday and Thursday''s data", "Switch to differential backups going forward and accept the data loss for this incident", "Restore from Sunday''s full backup, apply Monday''s and Tuesday''s incremental backups, skip the corrupted Wednesday tape, then apply Thursday''s incremental if it exists — though any data changed only on Wednesday is lost"]'::jsonb,
  3,
  'Incremental backups capture only changes since the last backup. The restore requires: Sunday full (baseline) + Monday incremental + Tuesday incremental + Wednesday incremental + Thursday incremental. With Wednesday''s tape corrupted, you skip it but can still apply Thursday''s backup. Data that was only changed on Wednesday (and not modified again on Thursday) will be lost, but all Monday, Tuesday, and Thursday changes are recoverable. Stopping at Tuesday unnecessarily loses Thursday''s changes.',
  'Incremental restore: Full + each day IN ORDER. Missing a day? Skip it, continue — you only lose that day''s unique changes.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;