INSERT INTO cat_questions (domain_id,topic_cluster,question_text,options,correct_index,explanation,mnemonic_hint,cognitive_level,question_type,difficulty_rating,irt_a,irt_b,irt_c,source,is_active) VALUES
(
  1, 'risk_management',
  'As CISO, you discover that your organization''s annual cybersecurity budget covers only 60% of identified risks. The board demands full compliance with a new industry regulation within 6 months. Your risk register shows 14 critical findings. What is the MOST appropriate management approach?',
  '["Present the board with a risk-prioritized remediation roadmap that addresses regulatory requirements first while formally accepting or transferring remaining risks with documented justification", "Request an emergency budget increase to address all 14 findings simultaneously before the regulatory deadline", "Hire additional contractors to accelerate remediation of all critical findings within the 6-month window", "Delay the regulatory compliance timeline and negotiate an extension with the regulator"]'::jsonb,
  0,
  'A manager must prioritize based on regulatory requirements while using formal risk acceptance/transfer for items that cannot be immediately addressed. This demonstrates risk-based decision making within resource constraints. Requesting full budget is unrealistic, hiring contractors alone doesn''t address prioritization, and delaying compliance creates legal exposure.',
  'MANAGER MINDSET: Prioritize by regulation → Accept/Transfer the rest → Document everything',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  3, 'security_architecture',
  'Your organization is migrating its core banking platform to a cloud-native architecture. The development team wants to use serverless functions for transaction processing to reduce costs. The compliance team insists on dedicated infrastructure for PCI DSS scope reduction. As the security architect reporting to the CTO, what is the BEST management decision?',
  '["Mandate dedicated infrastructure for all payment processing to eliminate compliance risk entirely", "Implement a hybrid architecture using serverless for non-PCI workloads and isolated dedicated infrastructure for cardholder data processing, with clear network segmentation boundaries", "Allow the development team to proceed with full serverless architecture and compensate with enhanced monitoring controls", "Postpone the migration until the PCI SSC issues formal guidance on serverless architectures"]'::jsonb,
  1,
  'A manager balances competing organizational needs. The hybrid approach satisfies both cost optimization (serverless for non-PCI) and compliance requirements (dedicated for PCI scope). Full dedicated is over-engineering; full serverless creates compliance risk; postponing delays business value.',
  'MANAGER MINDSET: Balance business needs AND compliance — hybrid solutions satisfy both stakeholders',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  5, 'iam_governance',
  'During a board meeting, the CEO requests that all executives receive unrestricted access to all company systems to "remove bureaucratic barriers." The CISO knows this violates least privilege and creates audit findings. Three board members support the CEO''s position. What is the MOST effective management response?',
  '["Immediately comply with the CEO''s request and document the risk acceptance in the risk register", "Refuse the request outright and cite regulatory requirements that prohibit such access", "Propose a streamlined executive access program with expedited approval workflows, time-limited elevated access, and enhanced monitoring — achieving speed without abandoning access controls", "Escalate the disagreement to the external auditor for a binding opinion"]'::jsonb,
  2,
  'A manager finds solutions that satisfy business needs while maintaining security principles. The streamlined program addresses the CEO''s concern (speed/convenience) while preserving least privilege through time-limited access and monitoring. Blind compliance creates risk; outright refusal damages relationships; escalating externally is inappropriate for an internal governance matter.',
  'MANAGER MINDSET: Never say "no" — say "yes, AND here''s how we do it securely"',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  7, 'incident_management',
  'Your SOC detects indicators of a potential data breach affecting customer records at 4:30 PM on Friday before a holiday weekend. The forensics team needs 48 hours for a complete investigation. Your state has a 72-hour breach notification law. The legal team advises waiting for forensics to complete before notifying. The PR team wants to issue a statement immediately. What is the BEST management approach?',
  '["Issue an immediate public statement acknowledging the potential breach before the holiday weekend", "Wait for the full 48-hour forensic investigation to complete before taking any notification actions", "Begin notification preparations now but wait for forensic confirmation before sending, risking timeline pressure", "Activate the incident response plan immediately, begin parallel workstreams for forensics, legal notification preparation, and customer communication drafts, and establish a decision checkpoint at 24 hours to evaluate notification timing against the 72-hour statutory requirement"]'::jsonb,
  3,
  'A manager coordinates parallel workstreams rather than sequential actions. Starting forensics, legal prep, and communication drafts simultaneously maximizes the organization''s options. The 24-hour checkpoint ensures decisions are made with best available information while preserving the notification timeline. Immediate public statements without facts create liability; waiting risks the statutory deadline; preparation-only without coordination wastes time.',
  'MANAGER MINDSET: Parallel workstreams + decision checkpoints = maximum flexibility under time pressure',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),
(
  2, 'data_governance',
  'Your organization completed a data classification initiative, but 18 months later, an audit reveals that 40% of data assets remain unclassified and classification labels on existing assets are inconsistent across business units. The data governance committee asks for your recommendation. What is the MOST effective management strategy?',
  '["Implement automated data discovery and classification tools integrated with DLP, assign data stewards per business unit with quarterly compliance reporting to the governance committee, and tie classification accuracy to departmental KPIs", "Mandate that all business units complete classification of remaining assets within 90 days with weekly progress reports", "Hire a consulting firm to reclassify all data assets using a standardized taxonomy", "Reduce the number of classification levels from five to three to simplify the process"]'::jsonb,
  0,
  'Sustainable governance requires automation, accountability (stewards + KPIs), and ongoing oversight (quarterly reporting). Mandating completion without tooling repeats the original failure. External consultants provide a one-time fix without building internal capability. Simplifying categories doesn''t address the compliance gap.',
  'MANAGER MINDSET: Sustainable governance = Automation + Accountability + Ongoing oversight',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;