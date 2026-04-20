INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'bia_process',
  'As the CISO, the CFO asks you to justify the cost of maintaining a hot site when the organization has never experienced a disaster. What is the BEST management justification?',
  '["Hot sites are required by law for all organizations", "The BIA determined that critical systems have RTOs that can only be met with hot site capabilities, and the cost of extended downtime exceeds the annual hot site cost", "Competitors use hot sites so we need one to maintain market position", "The IT team prefers hot sites for their technical capabilities"]'::jsonb,
  1,
  'Think like a manager: justify costs with business impact data. The BIA quantifies the financial impact of downtime for critical systems and establishes RTOs. If the RTO can only be met with a hot site, and the cost of exceeding MTD (lost revenue, regulatory fines, reputation damage) exceeds the hot site cost, the investment is justified. This is a risk-based business decision, not a technical preference.',
  'Justify with BUSINESS IMPACT. The BIA is your evidence — show the cost of downtime vs. cost of the hot site.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'A financial institution''s security team notices that its egress monitoring system has flagged large volumes of encrypted data leaving the network to an external IP address during off-hours. The traffic originates from a server in the human resources department. What does this activity MOST likely indicate?',
  '["Normal backup operations replicating data to a cloud storage provider", "Scheduled software updates being downloaded from vendor servers", "Routine data synchronization with a partner organization", "Potential data exfiltration that requires immediate investigation"]'::jsonb,
  3,
  'Large volumes of encrypted data leaving the network during off-hours from an HR server (which contains sensitive PII) to an unknown external IP is a strong indicator of data exfiltration. Egress monitoring is specifically designed to detect this pattern. While legitimate explanations are possible, the combination of off-hours timing, volume, encryption, and sensitive data source warrants immediate investigation as a potential breach.',
  'Egress monitoring red flags: unusual VOLUME + unusual TIME + unusual DESTINATION + sensitive SOURCE = investigate immediately.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'change_management',
  'An organization implements a change but does not update the configuration documentation or create a new baseline. What problem is this MOST LIKELY to cause?',
  '["Configuration drift where the documented state no longer matches the actual system state", "Immediate system failure due to the undocumented change", "Regulatory fines for non-compliance with change management standards", "Automatic rollback of the change by the configuration management system"]'::jsonb,
  0,
  'When changes are implemented without updating documentation and baselines, configuration drift occurs — the documented state diverges from the actual system state. Over time, this makes troubleshooting difficult, security auditing unreliable, and disaster recovery uncertain because the recovery documentation no longer reflects reality. This is why the final step of change management is updating documentation and baselines.',
  'No documentation update = configuration DRIFT. Your map no longer matches the territory.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'After containing and eradicating a security incident, the recovery team restores affected systems from clean backups. Before returning the systems to production, what is the BEST next step?',
  '["Immediately put the systems back into production to minimize downtime", "Notify all customers that the breach has been resolved", "Verify the integrity and security configuration of restored systems before returning them to production", "Delete all log files from the incident to prevent confusion with future monitoring"]'::jsonb,
  2,
  'After restoration, the Work Recovery Time (WRT) phase requires verifying system integrity, confirming security configurations match the baseline, validating data integrity, and ensuring no remnants of the compromise remain before returning systems to production. This verification step is critical — putting unverified systems back into production risks reintroducing the compromise or operating on corrupted data.',
  'After restore, VERIFY before going live. WRT = the quality check after recovery. Don''t skip it.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),
(
  7,
  'bia_process',
  'In business continuity planning, what is ALWAYS the top priority?',
  '["Protecting critical data and intellectual property", "Safety of people", "Maintaining revenue-generating operations", "Preserving the organization''s reputation"]'::jsonb,
  1,
  'The three goals of business continuity management in priority order are: (1) safety of people, (2) minimization of damage, and (3) survival of the business. Human safety is ALWAYS the top priority, above all other concerns including data protection, revenue, and reputation. This principle applies to all disaster and emergency response scenarios.',
  'BCM Priority #1: PEOPLE. Always. No system, no data, no profit is worth a human life.',
  'remember',
  'best_answer',
  'medium',
  0.80, -0.50, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;