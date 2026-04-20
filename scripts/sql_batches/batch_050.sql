INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'incident_response',
  'All of the following are roles typically found on an incident response team EXCEPT:',
  '["Legal counsel", "External auditor as team lead", "Human resources representative", "Public relations spokesperson"]'::jsonb,
  1,
  'An incident response team typically includes representatives from information security, IT, management, legal, HR, and public relations/communications. While external auditors may review the IR process, they do not serve as team leads — the IR team is led by internal security or management personnel. External parties may assist but the team composition is primarily internal stakeholders.',
  'IR Team = Security + IT + Management + Legal + HR + PR. All internal stakeholders with a role in the response.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),
(
  7,
  'backup_strategies',
  'An organization performs a full backup every Sunday. Monday through Saturday, they perform incremental backups. A critical server fails on Friday afternoon. To restore the server completely, which backup sets are required?',
  '["Sunday full backup only", "Sunday full backup plus Friday incremental only", "Sunday full backup plus Thursday and Friday incrementals only", "Sunday full backup plus Monday, Tuesday, Wednesday, Thursday, and Friday incrementals"]'::jsonb,
  3,
  'Incremental backups only capture changes since the LAST backup (full or incremental) and reset the archive bit. Therefore, each incremental contains only that day''s changes. To restore completely, you need the full backup plus every incremental in sequence: Sunday full + Monday + Tuesday + Wednesday + Thursday + Friday incrementals. This is the tradeoff — incrementals are fast to create but slow to restore.',
  'Incremental restore = Full + EVERY single incremental in order. Miss one link and the chain breaks.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'patch_management',
  'A vulnerability scanner identifies that 200 servers across the organization are missing a critical security patch that addresses a known exploited vulnerability. What should be the FIRST step in the remediation process?',
  '["Evaluate the patch in a test environment to verify it does not break existing applications", "Deploy the patch immediately to all 200 servers simultaneously", "Submit a change request and wait for the next CAB meeting for approval", "Disable the affected service on all servers until the patch is applied"]'::jsonb,
  0,
  'Even for critical patches, the first step is to evaluate and test in a non-production environment. This verifies the patch does not cause compatibility issues or break existing applications. After testing, submit an emergency change request for expedited approval. Deploying untested patches to 200 servers risks mass outage. Waiting for the next regular CAB meeting delays response to a critical vulnerability.',
  'Patch process: EVALUATE, TEST, APPROVE, DEPLOY, VERIFY. Always test first, even when urgent.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'What is the BEST description of Security Orchestration, Automation, and Response (SOAR)?',
  '["A type of SIEM that provides enhanced log correlation capabilities", "A platform that integrates security tools and automates incident response workflows to improve SOC efficiency", "A cloud-based security monitoring service provided by a managed security service provider", "An advanced firewall technology that uses AI to block sophisticated attacks"]'::jsonb,
  1,
  'SOAR integrates disparate security tools into a unified platform and automates incident response workflows through playbooks. Its three focus areas are threat and vulnerability management, incident response, and security operations automation. SOAR works alongside SIEM but is distinct — SIEM collects and correlates data, while SOAR orchestrates the response actions.',
  'SOAR = the conductor of the security orchestra. It makes all the tools play together automatically.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  7,
  'recovery_sites',
  'A mid-size company needs a disaster recovery site for their financial trading platform. The platform processes real-time transactions and cannot afford more than 1 hour of downtime. Budget constraints prevent maintaining a fully staffed duplicate facility. Which recovery site type is MOST appropriate?',
  '["Cold site with pre-positioned equipment shipping agreements", "Warm site with weekly data synchronization", "Hot site with real-time data replication", "Reciprocal agreement with a competitor"]'::jsonb,
  2,
  'A hot site with real-time data replication can achieve recovery within hours, meeting the 1-hour RTO requirement. It is fully equipped with hardware, software, and connectivity, and real-time replication ensures minimal data loss. A cold site takes weeks. A warm site takes days. Reciprocal agreements are unreliable for critical real-time systems. The hot site costs less than a mirror site while meeting the requirement.',
  'RTO under a few hours = HOT SITE. Real-time replication keeps data fresh. It''s the sweet spot between mirror and warm.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;