INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'forensic_imaging',
  'A forensic examiner is investigating a server suspected of being used for unauthorized cryptocurrency mining. The server is currently running with encrypted volumes mounted. The examiner needs to preserve evidence but the server cannot be taken offline immediately. Which forensic approach is MOST appropriate?',
  '["Perform live forensics to capture RAM (including encryption keys), running processes, and network connections, then create a forensic image of the mounted volumes before any shutdown", "Power off the server immediately and create a forensic image of the encrypted drives", "Wait until a maintenance window to perform the forensic capture to avoid business disruption", "Copy only the log files from the server since they contain all necessary evidence"]'::jsonb,
  0,
  'Live forensics is essential here because: (1) encryption keys for mounted volumes exist only in RAM and will be lost on shutdown, (2) running processes show the mining software in action, and (3) network connections reveal the mining pool. Powering off would make the encrypted volumes inaccessible without the keys. Waiting risks evidence destruction. Logs alone miss critical artifacts.',
  'Encrypted volumes + running system = LIVE forensics. Capture RAM first — encryption keys vanish on power-off.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'As the CISO, your organization has just discovered a data breach that exposed 500,000 customer records including Social Security numbers. Legal counsel confirms breach notification requirements apply in multiple jurisdictions with varying timelines. The PR team wants to delay notification until the full scope is understood. Marketing is concerned about stock price impact. What is the BEST management approach?',
  '["Delay notification until all forensic analysis is complete to provide customers with accurate information", "Follow the shortest applicable notification timeline across all jurisdictions while coordinating a consistent communication strategy through legal counsel", "Notify only the jurisdictions with the strictest penalties first and address others later", "Allow the PR team to control the timeline to minimize reputational damage"]'::jsonb,
  1,
  'As a manager, you must comply with ALL applicable breach notification laws. When multiple jurisdictions apply with different timelines, follow the shortest timeline to ensure compliance everywhere. Legal counsel coordinates the messaging. Delaying beyond legal requirements creates liability. Selective notification violates laws in skipped jurisdictions. PR concerns are valid but cannot override legal obligations.',
  'Multiple jurisdictions? Follow the SHORTEST deadline — it covers all the longer ones too. Legal leads, PR supports.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),
(
  7,
  'wrt_mtd',
  'A system has an MTBF of 2,000 hours and an MTTR of 8 hours. What is the system''s availability percentage?',
  '["99.5%", "99.0%", "99.6%", "99.8%"]'::jsonb,
  2,
  'Availability = MTBF / (MTBF + MTTR) = 2000 / (2000 + 8) = 2000 / 2008 = 0.99601... which rounds to 99.6%. MTBF is the average time between failures for repairable systems, and MTTR is the average time to repair. Higher MTBF and lower MTTR both increase availability.',
  'Availability = MTBF / (MTBF + MTTR). Plug in and divide. 2000 / 2008 = ~99.6%.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'An organization''s SOC uses both signature-based and anomaly-based detection. After a thorough review, the team finds that the signature-based IDS consistently misses certain attacks while the anomaly-based system generates many false positives. What is the BEST strategy to improve overall detection?',
  '["Replace the signature-based IDS with a second anomaly-based system", "Disable the anomaly-based system since it generates too many false positives", "Increase the signature database update frequency to daily", "Combine both approaches with tuned anomaly baselines and prioritize alerts based on correlation between both systems"]'::jsonb,
  3,
  'The best detection strategy uses defense-in-depth by combining both approaches. Signature-based catches known threats; anomaly-based catches unknown threats. Tuning the anomaly baselines reduces false positives. Correlating alerts between both systems increases confidence — if both systems flag the same activity, it is more likely to be a genuine threat. Removing either system creates detection gaps.',
  'Signature catches the KNOWN. Anomaly catches the UNKNOWN. Use BOTH and correlate for best results.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'During a late-night shift, a junior SOC analyst discovers evidence suggesting a massive data breach affecting millions of customer records. The analyst''s manager is unreachable. The incident response plan designates the CISO as the incident commander for major breaches. What should the analyst do FIRST?',
  '["Follow the escalation procedures in the IR plan to contact the CISO or designated alternate", "Begin containing the breach independently to prevent further data loss", "Wait until the morning shift when more senior staff will be available", "Contact the media to disclose the breach publicly"]'::jsonb,
  0,
  'The IR plan exists precisely for situations like this. The analyst should follow established escalation procedures to reach the CISO or the designated alternate. A breach of this magnitude requires senior leadership involvement for proper decision-making. Acting independently risks making mistakes on a high-impact incident. Waiting until morning allows continued data loss. Media contact is never the analyst''s role.',
  'Follow the PLAN. Escalation procedures exist for a reason — follow them, even at 3 AM.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;