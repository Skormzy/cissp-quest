INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'restoration_order',
  'After a disaster, an organization activates its hot site. When the primary facility is later repaired and ready for use, the team must move operations back. In what order should systems be restored to the primary site?',
  '["Most critical systems first to minimize time at the hot site", "All systems simultaneously to minimize the transition period", "Systems in the same order they were brought up at the hot site", "Least critical systems first to verify primary site stability before moving critical operations"]'::jsonb,
  3,
  'When moving BACK to the primary site from a DR site, the restoration order is reversed: least critical systems first. This approach verifies that the primary site is stable and functioning correctly before risking critical systems. If something goes wrong, the most critical systems remain safely at the hot site. Moving TO the DR site uses most critical first; moving BACK uses least critical first.',
  'Going TO DR = most critical FIRST (save the important stuff). Going BACK = least critical FIRST (test the waters safely).',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'During a security incident, an analyst discovers that an attacker has installed a rootkit on a critical database server. What should be the FIRST priority before beginning remediation?',
  '["Create a forensic image of the compromised server to preserve evidence", "Immediately reformat the server to remove the rootkit", "Disconnect the server from the network and restore from the most recent backup", "Scan all other servers on the network for similar rootkits"]'::jsonb,
  0,
  'Before any remediation action, evidence must be preserved through forensic imaging. Creating a forensic image captures the current state of the compromised system, including the rootkit and any artifacts the attacker left behind. This evidence is crucial for understanding the attack, identifying the entry point, and potentially for legal proceedings. Reformatting or restoring would destroy this evidence.',
  'Before you CLEAN, you must CAPTURE. Forensic image first, remediation second.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  7,
  'bia_process',
  'What is the BEST description of the primary purpose of a Business Impact Analysis (BIA)?',
  '["To identify all potential threats and their likelihood of occurrence", "To determine the criticality of business functions and establish time-based recovery requirements", "To calculate the annual loss expectancy for each identified risk", "To create a prioritized list of security controls to implement"]'::jsonb,
  1,
  'The BIA determines the criticality of business functions, processes, and systems, and establishes time-based recovery requirements including MTD, RTO, RPO, and WRT. It answers the question: how long can each function be unavailable before unacceptable impact occurs? Threat identification is part of risk assessment. ALE calculation is quantitative risk analysis. Control prioritization comes after the BIA.',
  'BIA answers: WHAT is critical and HOW FAST must we recover it? It sets the recovery clock.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),
(
  7,
  'change_management',
  'All of the following are standard steps in the change management process EXCEPT:',
  '["Submitting a change request through a ticketing system", "Testing the change in a non-production environment", "Deploying the change without a rollback plan to save time", "Obtaining approval from the Change Advisory Board"]'::jsonb,
  2,
  'Deploying changes without a rollback plan is NOT part of proper change management — in fact, having a rollback/backout plan is a critical requirement. The standard change management process includes: submit request, assess impact, obtain approval (CAB), build and test, notify stakeholders, implement with rollback plan, validate, and update documentation.',
  'Change management steps: REQUEST, ASSESS, APPROVE, TEST, NOTIFY, IMPLEMENT (with rollback!), VALIDATE, DOCUMENT.',
  'apply',
  'except_not',
  'medium',
  1.20, 0.50, 0.25,
  'ai_generated', true
),
(
  7,
  'malware_types',
  'A disgruntled database administrator writes code that will automatically delete all production databases if their employee account is ever disabled. Which type of malware is this MOST LIKELY classified as?',
  '["Ransomware", "Worm", "Trojan horse", "Logic bomb"]'::jsonb,
  3,
  'A logic bomb is malicious code that executes when a specific logical condition is met. In this case, the triggering condition is the employee''s account being disabled. Logic bombs are commonly associated with insider threats, particularly disgruntled employees who plant time-delayed or condition-triggered destructive code. It is not ransomware (no demand for payment), not a worm (no self-propagation), and not a Trojan (not disguised as legitimate software).',
  'LOGIC BOMB = Lurks until a LOGICAL condition triggers it. IF account disabled THEN kaboom.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;