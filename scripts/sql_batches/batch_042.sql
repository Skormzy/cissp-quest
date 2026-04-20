INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'raid_levels',
  'A small business needs to configure storage for a file server. They have three identical hard drives and want both performance improvement and the ability to survive a single drive failure. Which RAID level should they implement?',
  '["RAID 0", "RAID 5", "RAID 1", "RAID 6"]'::jsonb,
  1,
  'RAID 5 provides both striping for performance and parity for fault tolerance, requiring a minimum of 3 drives and surviving the loss of any single drive. RAID 0 provides striping for performance but no redundancy. RAID 1 provides mirroring (redundancy) with only 2 drives but no performance gain. RAID 6 requires a minimum of 4 drives.',
  'RAID 5 = Five fingers on one hand, lose one finger and you can still function. Minimum 3 drives, tolerates 1 failure.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'An employee reports that their workstation is displaying a ransom message demanding Bitcoin payment. What should be the FIRST action taken?',
  '["Pay the ransom to recover the data quickly", "Immediately power off the workstation to stop encryption", "Isolate the workstation from the network to prevent spread", "Reformat the workstation and restore from backup"]'::jsonb,
  2,
  'The first action for a ransomware incident is containment — isolating the affected system from the network to prevent the malware from spreading to other systems. You should never pay the ransom. Powering off could destroy volatile evidence in memory. Reformatting is a recovery step that comes much later after proper investigation and evidence preservation.',
  'First contain, then investigate. ISOLATE before you INVESTIGATE — stop the bleeding first.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),
(
  7,
  'change_management',
  'A system administrator wants to deploy a new security patch to all production servers. What is the BEST approach according to change management principles?',
  '["Deploy the patch immediately to all servers to minimize exposure time", "Wait for the vendor to release a second version of the patch", "Deploy to half the servers first, then the other half the next day", "Test the patch in a non-production environment, obtain CAB approval, then deploy during a maintenance window"]'::jsonb,
  3,
  'Proper change management requires testing changes in a non-production environment first, obtaining approval from the Change Advisory Board (CAB), and scheduling deployment during a low-impact maintenance window. Deploying untested patches directly to production risks system outages. The process ensures changes are evaluated, approved, tested, and implemented in a controlled manner.',
  'Change management: REQUEST, TEST, APPROVE, DEPLOY, VERIFY. Never skip testing!',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),
(
  7,
  'evidence_types',
  'All of the following are among the five rules of evidence EXCEPT:',
  '["Authentic", "Complete", "Circumstantial", "Admissible"]'::jsonb,
  2,
  'The five rules of evidence are: authentic, accurate, complete, convincing (reliable), and admissible. Circumstantial is a TYPE of evidence (evidence that suggests a fact by implication), not one of the five rules that govern evidence quality and acceptability. These rules determine whether evidence can be used in legal proceedings.',
  'Five rules of evidence: A-A-C-C-A = Authentic, Accurate, Complete, Convincing, Admissible.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),
(
  7,
  'failure_modes',
  'During a building fire, the electronic door locks on all exit doors automatically unlock to allow evacuation. Which failure mode does this represent?',
  '["Fail-secure", "Fail-safe", "Fail-soft", "Fail-closed"]'::jsonb,
  1,
  'Fail-safe prioritizes human safety above all else. When fire is detected, doors unlock automatically to allow people to evacuate, even though this reduces physical security. Fail-secure (also called fail-closed) maintains security by locking doors or blocking access. Fail-soft (also called fail-open) allows reduced functionality to continue operating.',
  'Fail-SAFE = SAFETY first, people get out. Fail-SECURE = SECURITY first, lock it down. Fail-SOFT = SOFTLY degrade but keep going.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;