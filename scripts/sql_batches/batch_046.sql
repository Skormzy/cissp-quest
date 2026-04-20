INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'forensic_imaging',
  'A forensic analyst receives a hard drive that needs to be examined for evidence of data theft. Before beginning any analysis, what should the analyst do FIRST?',
  '["Connect a write blocker and create a verified forensic image of the drive", "Search the drive for suspicious files and document findings", "Run antivirus software on the drive to detect any malware", "Create a standard file copy of all user documents on the drive"]'::jsonb,
  0,
  'Before any analysis, a forensic analyst must create a forensic image (bit-for-bit copy) using a write blocker to prevent any modifications to the original evidence. All subsequent analysis is performed on the forensic copy, never the original. A standard file copy would miss deleted files, slack space, and other forensic artifacts. Running tools directly on the original could alter evidence.',
  'Forensic rule #1: NEVER touch the original. Write blocker ON, image FIRST, analyze the COPY.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'A SOC analyst notices that a user account is accessing sensitive files at 3:00 AM, which is outside the employee''s normal working hours. The account is also downloading unusually large volumes of data. Which security technology would MOST LIKELY have detected this anomaly automatically?',
  '["Signature-based IDS", "Data Loss Prevention system", "User and Entity Behavior Analytics (UEBA)", "Network firewall with ACLs"]'::jsonb,
  2,
  'UEBA (User and Entity Behavior Analytics) uses machine learning to establish behavioral baselines for users and entities, then detects deviations from normal patterns. Accessing files at unusual hours and downloading abnormal volumes are exactly the types of behavioral anomalies UEBA is designed to detect. Signature-based IDS looks for known attack patterns. DLP monitors data movement but not behavioral patterns. Firewalls filter traffic based on rules.',
  'UEBA = Understanding Everyone''s Behavior Automatically. It learns what''s normal and flags what''s not.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),
(
  7,
  'recovery_sites',
  'What is the KEY difference between a hot site and a warm site?',
  '["A hot site has no equipment while a warm site has partial equipment", "A hot site is closer to the primary facility than a warm site", "A hot site uses cloud resources while a warm site uses physical hardware", "A hot site has all necessary hardware and software ready, while a warm site has only partial equipment that requires additional setup"]'::jsonb,
  3,
  'A hot site is fully equipped with all necessary hardware, software, and network connectivity — it only lacks current data and personnel, enabling recovery in hours. A warm site has some equipment (basic hardware, power, connectivity) but requires additional setup, configuration, and data loading, taking days to become operational. The key distinction is the level of readiness.',
  'HOT = Hardware On and Topped up (ready to go). WARM = We''ll Arrange Resources and Machines (needs setup). COLD = Can Only Lease the Doors (empty shell).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  7,
  'patch_management',
  'A healthcare organization runs a legacy medical device that cannot be patched because the vendor no longer supports it. The device processes patient data and is connected to the network. Which compensating control strategy BEST addresses this vulnerability?',
  '["Immediately replace the device with a newer model regardless of budget", "Disconnect the device from all networks until it can be replaced", "Segment the device onto an isolated network with strict access controls and enhanced monitoring", "Accept the risk since the device still functions correctly"]'::jsonb,
  2,
  'When patching is not possible, network segmentation with strict access controls and enhanced monitoring provides defense-in-depth as a compensating control. This limits exposure while maintaining the device''s functionality. Immediate replacement may not be feasible due to budget or availability. Complete disconnection disrupts patient care. Simply accepting the risk without mitigation is negligent.',
  'Can''t patch? ISOLATE and MONITOR. Build a security fence around what you can''t fix.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'As the CISO, you receive a report that the incident response team successfully contained a phishing attack that compromised three executive accounts. The IT team has already reset passwords and reimaged affected workstations. What is the MOST important management action at this point?',
  '["Immediately terminate the employees who clicked on the phishing emails", "Conduct a lessons learned review to identify process improvements and prevent recurrence", "Purchase new anti-phishing software to replace the current solution", "Issue a press release about the organization''s successful incident response"]'::jsonb,
  1,
  'After containment and recovery, the most important step is the lessons learned review (post-incident activity). As a manager, you need to understand what failed, what worked, and how to improve detection and prevention. Terminating employees who fell for phishing is counterproductive and punitive. Buying new software without understanding the root cause may not solve the problem. A press release is premature and potentially unnecessary.',
  'After every incident: LEARN. Lessons learned is the final and arguably most valuable phase of IR.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;