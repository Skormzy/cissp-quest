INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'incident_response',
  'What is the PRIMARY difference between a security event and a security incident?',
  '["An event is any observable occurrence, while an incident is an adverse event that negatively impacts CIA", "An event requires management notification, while an incident does not", "An event is always malicious, while an incident may be accidental", "An event originates externally, while an incident originates internally"]'::jsonb,
  0,
  'A security event is any observable occurrence in a system or network, such as a user logging in or a firewall blocking a connection. An incident is specifically an adverse event that negatively impacts the confidentiality, integrity, or availability of information or systems. All incidents are events, but not all events are incidents.',
  'EVENT = Everything that happens. INCIDENT = It''s Negatively impacting CIA, that''s the Distinguishing Element, Now Triage.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),
(
  7,
  'backup_strategies',
  'Which type of backup copies ALL data regardless of the archive bit setting and then resets the archive bit?',
  '["Incremental backup", "Full backup", "Differential backup", "Mirror backup"]'::jsonb,
  1,
  'A full backup copies all selected data regardless of whether the archive bit is set, and then resets the archive bit to 0 (indicating the file has been backed up). Incremental backups only copy files with archive bit set to 1 and then reset it. Differential backups copy files with archive bit set to 1 but do NOT reset it.',
  'FULL = Flush the archive bit. Full backup does it ALL, then resets ALL bits.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),
(
  7,
  'recovery_sites',
  'Which recovery site type provides the FASTEST recovery time but at the highest cost?',
  '["Hot site", "Warm site", "Redundant/mirror site", "Mobile site"]'::jsonb,
  2,
  'A redundant or mirror site is a fully equipped, fully staffed, and continuously operational facility that provides near-instant recovery (seconds). A hot site is fully equipped but lacks current data and staff, requiring hours to become operational. The mirror site is the most expensive option because it maintains real-time data replication and dedicated staff at all times.',
  'Mirror = Me In Real-time, Running On Replica. It''s your twin — always ready, always running.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),
(
  7,
  'backup_strategies',
  'What is the KEY difference between incremental and differential backups?',
  '["Incremental is faster to restore than differential", "Differential copies more data than a full backup", "Incremental requires more storage than differential", "Incremental resets the archive bit while differential does not"]'::jsonb,
  3,
  'The key technical difference is archive bit handling. Incremental backups copy files changed since the last backup of any type and reset the archive bit to 0. Differential backups copy files changed since the last full backup and do NOT reset the archive bit. This means differentials grow larger over time while incrementals stay small, but incrementals require all backup sets for restoration.',
  'INC = I Now Clear the bit. DIFF = Don''t I Fiddle with Flags. Incremental clears, differential doesn''t.',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),
(
  7,
  'malware_types',
  'Which type of malware is MOST LIKELY to spread across a network without any user interaction?',
  '["Worm", "Virus", "Trojan horse", "Logic bomb"]'::jsonb,
  0,
  'Worms are self-propagating malware that spread across networks by exploiting vulnerabilities without requiring user interaction. Viruses require a user action such as opening a file or running a program. Trojans disguise themselves as legitimate software and need a user to install them. Logic bombs wait for a triggering condition and do not self-propagate.',
  'WORM = Wriggles On its own, Replicates through Media. Worms crawl by themselves — no human help needed.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;