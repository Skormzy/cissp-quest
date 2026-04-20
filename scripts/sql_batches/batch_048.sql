INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'containment_strategies',
  'During a network intrusion, your incident response team identifies that the attacker has compromised a DMZ web server and is using it as a pivot point to probe internal systems. The web server hosts a public-facing customer portal. Analysis shows no internal systems have been compromised yet. Which containment approach is MOST appropriate?',
  '["Shut down the entire DMZ to prevent any further probing", "Allow the attacker to continue while gathering intelligence for law enforcement", "Block the pivot traffic from the DMZ to internal networks while keeping the customer portal accessible through an alternate path", "Immediately notify all customers that their data may have been compromised"]'::jsonb,
  2,
  'The best containment approach addresses the specific attack vector (pivot traffic from DMZ to internal) while maintaining business services (customer portal). Blocking pivot traffic stops lateral movement without shutting down customer-facing services entirely. Shutting down the DMZ disrupts business. Allowing continued probing risks internal compromise. Customer notification should follow investigation, not precede containment.',
  NULL,
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),
(
  7,
  'raid_levels',
  'An organization implements RAID 5 using five 2TB hard drives. What is the total usable storage capacity?',
  '["10 TB", "8 TB", "6 TB", "4 TB"]'::jsonb,
  1,
  'RAID 5 uses one drive''s worth of capacity for distributed parity across all drives. With 5 drives of 2TB each, the formula is (N-1) x drive size = (5-1) x 2TB = 8TB usable capacity. One drive''s worth of space (2TB) is consumed by parity data distributed across all drives. Total raw capacity is 10TB, but usable is 8TB.',
  'RAID 5 usable = (N-1) x drive size. You lose ONE drive''s worth to parity. 5 drives minus 1 = 4 drives worth of usable space.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),
(
  7,
  'drp_testing',
  'As a security manager, you want to test your organization''s disaster recovery plan for the first time. The CEO is concerned about any risk to production systems. Which test type should you recommend?',
  '["A tabletop exercise where stakeholders walk through the plan and discuss their roles without activating any systems", "A full-interruption test to get the most realistic results possible", "A parallel test that brings up the recovery site alongside production", "A simulation test that intentionally disrupts one production system"]'::jsonb,
  0,
  'For an organization testing its DRP for the first time, a tabletop/walkthrough exercise is the safest choice. It involves no risk to production systems — stakeholders simply discuss the plan and their roles around a table. Full-interruption tests are the riskiest and should only be attempted after all other test types succeed. Parallel tests and simulations involve more complexity. Think like a manager: start safe, build confidence.',
  'DRP testing order: Read, Walk, Simulate, Parallel, Full. Start with the safest test first and work your way up.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'Your organization''s monitoring systems detect unusual outbound traffic from several workstations to an external IP address known to be associated with a command-and-control server. The affected workstations belong to employees in the finance department. What should be the FIRST action?',
  '["Notify the finance department employees that their workstations are compromised", "Immediately disconnect all finance department workstations from the network", "Report the incident to law enforcement as a potential cyberattack", "Isolate the affected workstations specifically identified in the alert while preserving their current state for forensic analysis"]'::jsonb,
  3,
  'The first action should be targeted containment — isolating only the specific workstations identified in the alert, not the entire department. This stops the C2 communication while preserving evidence on the compromised machines. Notifying users first could alert the attacker. Disconnecting all finance workstations is too broad and disrupts uninvolved employees. Law enforcement notification comes after initial containment.',
  'Contain PRECISELY — isolate the confirmed compromised systems, not everything in sight. Surgical, not scorched earth.',
  'analyze',
  'first_action',
  'medium',
  1.70, 0.90, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'An organization wants to proactively search for advanced persistent threats (APTs) that may have evaded existing security controls. Which activity BEST describes this approach?',
  '["Vulnerability scanning", "Penetration testing", "Threat hunting", "Security auditing"]'::jsonb,
  2,
  'Threat hunting is the proactive, human-driven process of searching for APTs and sophisticated threats that have evaded automated detection. Unlike vulnerability scanning (finding known weaknesses) or penetration testing (simulating attacks), threat hunting assumes a breach may have already occurred and actively looks for indicators of compromise using hypothesis-driven analysis.',
  'Threat HUNTING = you go LOOKING for the threat. You''re the hunter, not waiting for the alarm to ring.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;