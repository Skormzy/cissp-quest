INSERT INTO cat_questions (domain_id,topic_cluster,question_text,options,correct_index,explanation,mnemonic_hint,cognitive_level,question_type,difficulty_rating,irt_a,irt_b,irt_c,source,is_active) VALUES
(
  5, 'access_management',
  'After a merger, your organization now has three separate identity providers, two HR systems, and overlapping role definitions that have created 15,000+ unique access combinations. Segregation of duties violations are appearing in audit reports. The integration project is 18 months behind schedule. What is the MOST appropriate management priority?',
  '["Accelerate the integration project by adding resources to merge all identity providers within 6 months", "Freeze all new access provisioning until identity systems are consolidated", "Implement a centralized identity governance layer that provides unified visibility and SoD enforcement across all three identity providers as an interim measure, while the long-term consolidation continues on a realistic timeline with defined milestones", "Accept the audit findings with a remediation plan tied to the integration project completion"]'::jsonb,
  2,
  'A manager addresses immediate risk (SoD violations) without waiting for the perfect long-term solution. An identity governance layer provides unified visibility and enforcement now while consolidation proceeds. Accelerating an already-delayed project risks quality; freezing provisioning stops business operations; accepting audit findings without interim controls leaves the organization exposed.',
  'MANAGER MINDSET: Implement interim controls for immediate risk while long-term solutions mature',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  6, 'audit_management',
  'Your organization received qualified audit opinions in three consecutive years for the same control weakness: inadequate change management for production systems. Each year, management responded with policy updates, but the underlying behavior hasn''t changed. The audit committee is frustrated. As CISO, what do you recommend?',
  '["Issue stricter penalties for change management policy violations", "Implement additional detective controls to catch unauthorized changes faster", "Commission an independent review of the change management process to identify root causes", "Conduct a root cause analysis of why policy changes haven''t translated to behavioral changes, then implement technical enforcement controls (automated change gates, pipeline-enforced approvals) that make non-compliance technically impossible rather than merely prohibited, and establish metrics that measure actual compliance behavior rather than policy existence"]'::jsonb,
  3,
  'Three years of policy-only fixes prove that policy alone doesn''t change behavior. A manager shifts from administrative to technical controls that enforce compliance automatically. Penalties don''t fix broken processes; detective controls only find violations after the fact; an independent review without a change in control philosophy will yield the same recommendations.',
  'MANAGER MINDSET: When policy repeatedly fails, shift to technical enforcement — make non-compliance impossible, not just prohibited',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  7, 'security_operations',
  'Your SOC processes 50,000 alerts per day with a team of 8 analysts. The false positive rate is 97%. Analyst burnout and turnover are at all-time highs. The SIEM vendor suggests upgrading to their AI-powered platform for $1.2M annually. A competing proposal from your SOC manager recommends investing the same amount in alert tuning, automation playbooks, and two additional senior analysts. What is the BEST management decision?',
  '["Invest in the SOC manager''s proposal for alert tuning, automation, and staffing, because reducing the 97% false positive rate through tuning and automating tier-1 triage addresses root causes rather than adding AI to a poorly tuned detection pipeline — then evaluate AI augmentation once the baseline is optimized", "Purchase the AI-powered SIEM upgrade to leverage machine learning for automatic alert prioritization", "Implement both solutions simultaneously to maximize detection capability", "Outsource tier-1 SOC operations to a managed security service provider"]'::jsonb,
  0,
  'A manager addresses root causes before adding technology layers. AI on top of a 97% false positive rate will automate bad data. Tuning reduces noise at the source, automation eliminates repetitive work, and senior analysts improve decision quality. The vendor solution may be valuable later, once the baseline is clean. Both simultaneously wastes budget; outsourcing transfers the problem without fixing it.',
  'MANAGER MINDSET: Fix the foundation before adding technology — AI amplifies your current state, good or bad',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  4, 'network_architecture',
  'Your organization is implementing zero trust architecture. The network team has completed microsegmentation for the data center, but 60% of traffic now flows through SaaS applications that bypass traditional network controls. The identity team has MFA deployed but lacks continuous authentication. Budget allows one major initiative this year. What should the CISO prioritize?',
  '["Continue expanding microsegmentation to cover remaining on-premises infrastructure", "Deploy a CASB to gain visibility and control over all SaaS application traffic", "Prioritize implementing continuous adaptive authentication and authorization for SaaS applications integrated with a CASB for visibility, since 60% of traffic flows outside your microsegmented perimeter — aligning security controls with where data actually moves", "Implement a secure web gateway to filter all outbound traffic to SaaS providers"]'::jsonb,
  2,
  'A manager aligns security investment with where risk actually exists. If 60% of traffic bypasses network controls via SaaS, then identity-based controls with SaaS visibility address the largest gap. More microsegmentation improves the 40% that''s already partially protected. CASB alone without authentication is incomplete. SWG doesn''t address the identity gap.',
  'MANAGER MINDSET: Invest where the risk IS, not where you''ve already built controls',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  2, 'asset_management',
  'A shadow IT discovery scan reveals 340 unauthorized SaaS applications in use across the organization, including 12 that process sensitive customer data. Business units argue these tools are essential for productivity and were adopted because IT couldn''t provide alternatives fast enough. What is the MOST effective management approach?',
  '["Block all unauthorized SaaS applications immediately at the network perimeter", "Transfer ownership of SaaS application decisions to individual business units", "Add all 340 applications to the approved list to reflect actual business usage", "Triage the 340 applications by data sensitivity and business criticality: immediately secure the 12 processing customer data through approved configurations or migration to sanctioned alternatives, establish a fast-track SaaS approval process to prevent future shadow IT, and create a 90-day rationalization plan for the remaining applications"]'::jsonb,
  3,
  'A manager triages by risk and addresses root causes. The 12 sensitive-data apps need immediate attention, but the root cause (slow IT provisioning) must also be fixed through a fast-track process. Blocking everything disrupts business; blanket approval ignores risk; decentralizing control eliminates governance.',
  'MANAGER MINDSET: Triage by risk + fix root causes — blocking shadow IT without fixing WHY it exists guarantees recurrence',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;