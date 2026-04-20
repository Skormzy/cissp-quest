INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  5,
  'access_control_models',
  'A consulting firm implements the Brewer-Nash (Chinese Wall) model for its client engagements. An analyst currently has access to the financial records of Bank A. The analyst is assigned to a new project involving Bank B, which is a direct competitor of Bank A. Later, the analyst is asked to consult on a project for Insurance Company C, which has no competitive relationship with either bank. Under the Brewer-Nash model, which access combination is permitted?',
  '["Access to Bank A and Bank B because both are in the banking sector and the analyst has relevant expertise", "Access to Bank A, Bank B, and Insurance Company C because the analyst can handle multiple clients", "Access to Bank A and Insurance Company C because Bank B is in the same conflict-of-interest class as Bank A, but Insurance Company C is in a separate class", "Access to only Insurance Company C because accessing any bank permanently bars the analyst from all other financial clients"]'::jsonb,
  2,
  'The Brewer-Nash model dynamically restricts access based on conflict-of-interest classes. Bank A and Bank B are in the same conflict class (competing banks), so accessing one bars access to the other. Insurance Company C is in a separate conflict class with no competitive relationship to either bank. The analyst can access Bank A and Insurance Company C but not Bank B. Access restrictions are per conflict class, not per industry.',
  'Brewer-Nash = Chinese Wall = no conflicts of interest. Restrictions are by conflict CLASS, not by industry. Different classes = no conflict.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  5,
  'identity_lifecycle',
  'A multinational bank undergoes a merger. The combined organization has 50,000 employees with identity systems from both companies. The CISO must present an identity integration strategy to the board. Active Directory forests, SAML federations, and IDaaS subscriptions exist on both sides. Some employees will be laid off, some will change roles, and all systems must remain operational during transition. What is the MOST appropriate management strategy?',
  '["Immediately consolidate both organizations into a single Active Directory forest to eliminate complexity", "Maintain completely separate identity systems permanently and use manual processes for cross-organization access", "Freeze all identity changes during the merger and resume normal provisioning once integration is complete", "Establish federated trust between both identity systems for immediate interoperability, then plan phased consolidation with automated deprovisioning for departing employees and access reviews for role changes"]'::jsonb,
  3,
  'The management approach is federation first for immediate interoperability, then phased consolidation. Immediate AD consolidation is risky and disruptive. Permanent separation creates management overhead and security gaps. Freezing changes during a merger with layoffs and role changes would leave departed employees with active accounts. Federation provides immediate SSO while consolidation is planned carefully.',
  'Think Like a Manager: Merger = federate first for interop, consolidate in phases. Never freeze identity changes during transitions with personnel changes.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  5,
  'credential_attacks',
  'An attacker compromises a service account that has a registered SPN in Active Directory. Using the service account''s NTLM hash, the attacker forges a Kerberos Service Ticket for a specific target service. This forged ticket is never validated by the KDC because service tickets are verified using the service account''s own key. The attacker uses this ticket to access the target service with any permissions they specify. What specific attack is this?',
  '["A silver ticket attack, because the attacker forges a service ticket using a compromised service account hash, and the forged ticket is accepted by the target service without KDC validation", "A golden ticket attack, because the attacker forges a ticket using a compromised account hash", "A Kerberoasting attack, because the attacker targets a service account with an SPN", "An overpass-the-hash attack, because the attacker converts an NTLM hash into a Kerberos ticket"]'::jsonb,
  0,
  'A silver ticket is a forged Kerberos Service Ticket created using a compromised service account''s NTLM hash. Unlike golden tickets (which forge TGTs using the KRBTGT hash), silver tickets target specific services. The key characteristic is that service tickets are validated by the target service itself using its own key, not by the KDC, so the forgery bypasses central authentication. Silver tickets have limited scope but are harder to detect.',
  'Silver ticket = forged SERVICE ticket from service account hash. Golden ticket = forged TGT from KRBTGT hash. Silver = specific service, Golden = entire domain.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  5,
  'biometrics',
  'A biometric system is being calibrated. At the current sensitivity setting, the FRR is 4% and the FAR is 1%. The security team increases sensitivity to reduce unauthorized access. After adjustment, the FAR drops to 0.5%. Based on the inverse relationship between FRR and FAR, what is the MOST LIKELY effect on the FRR?',
  '["FRR decreases to approximately 2% because both error rates improve with better calibration", "FRR increases because reducing FAR (making the system more restrictive) causes more legitimate users to be rejected", "FRR remains at 4% because FRR and FAR are independent measurements", "FRR drops to 0% because maximum sensitivity eliminates all biometric errors"]'::jsonb,
  1,
  'FRR and FAR are inversely related. When sensitivity is increased to reduce FAR (fewer unauthorized acceptances), FRR increases (more legitimate rejections). This is because a more restrictive system demands closer matches, rejecting more legitimate users whose biometric samples have slight variations. The only point where both rates are equal is the CER/EER.',
  'FRR and FAR = inverse relationship. Tighten security (lower FAR) = more false rejections (higher FRR). Can''t reduce both simultaneously.',
  'apply',
  'calculation',
  'very_hard',
  1.60, 3.00, 0.20,
  'ai_generated', true
),
(
  5,
  'access_control_attacks',
  'An organization''s SOC detects that an attacker has compromised a domain admin account and is using DCSync to replicate Active Directory data, including all password hashes, from a domain controller. The attacker has already obtained the KRBTGT hash and multiple service account hashes. The SOC has confirmed the attacker has been active for at least 72 hours. What should be done FIRST?',
  '["Reset the KRBTGT password twice and all service account passwords", "Disconnect the compromised domain controller from the network and begin forensic imaging", "Isolate the attacker''s known access points and disable all compromised accounts while maintaining domain controller availability for legitimate operations", "Begin rebuilding the Active Directory forest from scratch using clean media"]'::jsonb,
  2,
  'The FIRST action is to isolate known attack vectors and disable compromised accounts while keeping domain controllers available for legitimate business. Disconnecting domain controllers would halt all authentication for the organization. KRBTGT resets and service account password changes are critical but come after initial containment. A full forest rebuild may be necessary but is not the first step in active incident response.',
  'FIRST = contain without destroying availability. Isolate attacker access + disable compromised accounts. Then reset KRBTGT + investigate. AD rebuild is last resort.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;