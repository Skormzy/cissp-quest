INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  7,
  'chain_of_custody',
  'A security analyst discovers a compromised laptop that may contain evidence of corporate espionage. What should be the FIRST step regarding the evidence?',
  '["Document the current state and preserve the scene without altering the evidence", "Create a forensic image of the hard drive immediately", "Turn off the laptop to prevent further data loss", "Contact law enforcement to take possession of the device"]'::jsonb,
  0,
  'The first step in evidence handling is to secure and document the scene. This means photographing the current state, noting what is on screen, and preventing anyone from altering the evidence. Creating a forensic image comes after documentation. Turning off the laptop could destroy volatile data in RAM. Law enforcement notification is important but comes after initial preservation.',
  'Evidence handling first step: STOP and DOCUMENT. Secure the scene before you touch anything.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),
(
  7,
  'logging_monitoring',
  'A company wants to aggregate security logs from firewalls, IDS sensors, servers, and endpoints into a single platform for correlation and alerting. Which technology BEST meets this requirement?',
  '["IPS", "EDR", "DLP", "SIEM"]'::jsonb,
  3,
  'A Security Information and Event Management (SIEM) system is specifically designed to aggregate logs from multiple sources, normalize the data into a standard format, correlate events across systems, and generate alerts. IPS blocks malicious traffic. EDR monitors endpoints specifically. DLP prevents data loss. Only SIEM provides the centralized log aggregation and correlation described.',
  'SIEM = Security Information and Event Management. It''s the central brain that SEES everything from all sources.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),
(
  7,
  'drp_testing',
  'Which DRP test type involves stakeholders gathering to discuss and walk through the plan step by step without activating any systems?',
  '["Checklist/read-through test", "Full-interruption test", "Tabletop/walkthrough exercise", "Parallel test"]'::jsonb,
  2,
  'A tabletop or walkthrough exercise brings together key stakeholders to discuss the disaster recovery plan step by step. Participants talk through their roles and responses to a hypothetical scenario without actually activating systems. A checklist/read-through is done individually by the plan author. A parallel test activates recovery systems alongside production. A full-interruption test actually disrupts production.',
  'TABLETOP = Talk Around the TABLE. Everyone sits at a TABLE and TALKS through the plan — no systems touched.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),
(
  7,
  'incident_response',
  'According to the incident response lifecycle, what must an organization do BEFORE any incidents occur?',
  '["Conduct forensic analysis of potential threats", "Perform root cause analysis on previous attacks", "Establish an incident response plan and train the response team", "Deploy containment measures across all network segments"]'::jsonb,
  2,
  'Preparation is the first phase of incident response. This includes developing the IR plan, forming and training the incident response team, acquiring necessary tools, and establishing communication procedures. All other options describe activities that happen during or after an incident. You cannot respond effectively without preparation beforehand.',
  'IR starts with PREPARATION. You can''t fight a fire without a fire extinguisher — prepare BEFORE the flames.',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),
(
  7,
  'malware_types',
  'An employee opens an email attachment that appears to be a legitimate invoice PDF. Shortly after, unauthorized software is installed on their workstation. Which type of malware MOST LIKELY caused this?',
  '["Worm", "Logic bomb", "Rootkit", "Trojan horse"]'::jsonb,
  3,
  'A Trojan horse disguises itself as legitimate software to trick users into executing it. The scenario describes malware hidden inside what appears to be a normal PDF invoice — classic Trojan behavior. Worms self-propagate without user interaction. Logic bombs activate based on a condition, not user execution. Rootkits hide their presence but typically arrive via another attack vector.',
  'TROJAN = Tricks you into Running it. Like the Trojan Horse from mythology — looks like a gift, hides an army inside.',
  'apply',
  'most_likely',
  'easy',
  1.40, -1.10, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;