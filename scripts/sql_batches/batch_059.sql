INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'incident_response',
  'A multinational financial services company discovers that an advanced persistent threat group has compromised their Active Directory infrastructure, including all domain controllers across four countries. The attackers have created golden ticket capabilities and have been present for an estimated 90 days. Normal incident response containment by isolating systems is impractical given the scope. What should be the FIRST strategic action?',
  '["Immediately reset all user passwords across the enterprise to invalidate stolen credentials", "Rebuild every domain controller from clean media before resetting the KRBTGT account", "Engage external incident response specialists and notify relevant financial regulators in all jurisdictions", "Establish an isolated out-of-band communication channel and begin planning a coordinated forest recovery"]'::jsonb,
  3,
  'With a 90-day APT compromise of Active Directory including golden ticket capability, the attacker can monitor all normal communications. The first action must be establishing secure, out-of-band communications the attacker cannot observe, then planning a coordinated recovery. Simply resetting passwords is ineffective against golden tickets — the KRBTGT account itself is compromised. Rebuilding DCs piecemeal without coordination allows the attacker to re-compromise from remaining infected systems. External engagement is important but communication security comes first.',
  'APT in AD = they see EVERYTHING. Step 1: Communicate where they CAN''T hear you. Then plan the coordinated strike.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  7,
  'backup_strategies',
  'A cloud-native SaaS company stores all customer data in a multi-region database service. They perform continuous replication to a secondary region and daily logical backups to object storage. After a developer accidentally deploys a migration script that corrupts the primary database schema, the corruption replicates to the secondary region within seconds. The most recent clean logical backup is 18 hours old. The RTO is 4 hours and the RPO is 1 hour. Which approach BEST addresses this situation?',
  '["Restore from the 18-hour-old logical backup and accept the data loss while investigating point-in-time recovery options from transaction logs to minimize the gap", "Fail over to the secondary region since it has a separate copy of the data", "Request the cloud provider restore the database from their internal infrastructure backups", "Roll back the migration script and run a repair operation on the corrupted schema"]'::jsonb,
  0,
  'The secondary region has the same corruption due to replication, so failover won''t help. Cloud provider infrastructure backups are not guaranteed and are not under the organization''s control. Rolling back the script may not repair already corrupted data. The best approach is restoring from the last known clean backup (18 hours old) and then using transaction logs or write-ahead logs to perform point-in-time recovery as close to the corruption event as possible, minimizing data loss. This exceeds the 1-hour RPO, highlighting the need for more frequent backups.',
  'Replication copies CORRUPTION too. When the backup is your only clean copy, restore it + replay transaction logs.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  7,
  'change_management',
  'As the VP of Security Operations, you are reviewing the annual metrics and notice that 40% of all production incidents were caused by changes that went through the standard change management process. The CAB approved all of these changes, and each had documented rollback plans. The CTO is questioning whether the change management process adds value. What is your BEST response from a governance perspective?',
  '["Recommend eliminating the CAB and replacing it with automated change validation in the CI/CD pipeline", "Present data showing the process prevents many incidents, but recommend enhancing pre-implementation testing requirements and adding post-implementation verification checkpoints", "Agree with the CTO that the process needs to be removed since it clearly is not preventing incidents", "Recommend adding more approvers to the CAB to increase the scrutiny of each proposed change"]'::jsonb,
  1,
  'The data shows the process needs improvement, not elimination. The CAB is a governance control that provides risk management, audit trail, and organizational oversight. The correct response acknowledges the valid concern while strengthening the process. Adding enhanced testing and post-implementation verification addresses the root cause — changes that are approved but inadequately tested. Eliminating the CAB removes governance oversight. Simply adding approvers creates bureaucracy without improving technical validation. Agreeing to remove the process abandons change governance.',
  'Process not working perfectly ≠ remove the process. IMPROVE it: better testing, verification checkpoints, metrics-driven refinement.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'A SOC analyst notices that SIEM alerts for a particular subnet dropped to zero three days ago. Prior to that, the subnet consistently generated 50-100 alerts daily. Network connectivity to the subnet appears normal, and the systems are responding to pings. What is the MOST likely explanation?',
  '["All vulnerabilities on the subnet were successfully patched, eliminating security alerts", "Log forwarding from the subnet''s systems to the SIEM has been disrupted or disabled, possibly by an attacker", "The SIEM correlation rules for that subnet were accidentally modified during a recent update", "The users on that subnet are on vacation, resulting in no activity to generate alerts"]'::jsonb,
  1,
  'A sudden drop to zero alerts from a previously active subnet is a strong indicator that log forwarding has been disrupted. Sophisticated attackers often disable or redirect logging as one of their first actions after compromising systems. While patching reduces some alerts, reaching zero is extremely unlikely. SIEM rule changes would affect alert categories, not eliminate all alerts from a specific subnet. Vacation doesn''t explain zero alerts since automated systems still generate events. Zero alerts is more suspicious than high alerts.',
  'ZERO alerts is MORE suspicious than too many. If a noisy subnet goes silent, the logs may be compromised.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),
(
  7,
  'raid_levels',
  'An organization needs a storage solution with both redundancy and performance. They have 8 identical 2TB drives. If they configure a RAID 10 array using all 8 drives, what is the usable storage capacity?',
  '["12 TB", "6 TB", "8 TB", "14 TB"]'::jsonb,
  2,
  'RAID 10 (1+0) combines mirroring and striping. First, drives are paired into mirrors (RAID 1), then the mirrors are striped (RAID 0). With 8 drives of 2TB each: 4 mirror pairs are created, each with 2TB usable (half the raw capacity per pair). The 4 mirrors are then striped, giving 4 x 2TB = 8TB usable. RAID 10 always uses 50% of raw capacity for redundancy. Total raw = 16TB, usable = 8TB.',
  'RAID 10 = 50% capacity. Mirror first, then stripe. 8 drives x 2TB = 16TB raw ÷ 2 = 8TB usable.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;