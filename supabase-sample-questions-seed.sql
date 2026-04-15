-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 1 Sample Questions Seed
-- 20 questions for CAT engine testing
-- Distribution: 5 easy, 8 medium, 5 hard, 2 very hard
-- Correct answer positions: 5 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY (5) — IRT b ≈ -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: Easy / Remember / Definition — correct at 0
-- IRT: b = -1.5 + (-0.5) + (-0.3) = -2.3, a = 0.8 + (-0.3) = 0.5, c = 0.22
(
  1,
  'risk_management',
  'Which of the following BEST defines residual risk?',
  '["The risk that remains after controls have been implemented", "The total risk present before any controls are applied", "The risk of a control failing during its implementation", "The risk associated with natural disasters exclusively"]'::jsonb,
  0,
  'Residual risk is the risk that remains after security controls have been applied. It is the portion of inherent risk that controls cannot eliminate. Organizations must accept residual risk if it falls within their risk tolerance.',
  'Residual = Remainder. What''s LEFT over after you''ve done your best.',
  'remember',
  'definition',
  'easy',
  0.50, -2.30, 0.22,
  'manual'
),

-- Q2: Easy / Remember / Comparison — correct at 1
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  1,
  'security_governance',
  'What is the PRIMARY difference between due care and due diligence?',
  '["Due care applies to employees only; due diligence applies to management", "Due care is acting reasonably; due diligence is researching and verifying", "Due care is a legal requirement; due diligence is an optional best practice", "Due care involves technology controls; due diligence involves physical controls"]'::jsonb,
  1,
  'Due care means acting as a reasonable, prudent person would under similar circumstances — taking appropriate action. Due diligence means doing your homework: researching, investigating, and verifying before making decisions. Due care is "doing"; due diligence is "knowing."',
  'Due CARE = I CARE enough to ACT. Due DILIGENCE = I''m DILIGENT enough to RESEARCH.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'manual'
),

-- Q3: Easy / Understand / Best Answer — correct at 2
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1,
  'security_policies',
  'Which of the following BEST describes the purpose of a security policy?',
  '["To provide step-by-step technical instructions for system configuration", "To define the budget allocation for security tools and staff positions", "To communicate management''s expectations for security requirements", "To list all known vulnerabilities and their remediation timelines"]'::jsonb,
  2,
  'A security policy is a high-level document that communicates management''s intent, expectations, and requirements for security within the organization. It is strategic, not tactical — it says WHAT must be done, not HOW. Procedures provide the step-by-step instructions.',
  NULL,
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'manual'
),

-- Q4: Easy / Understand / Definition — correct at 3
-- IRT: b = -1.5 + 0.0 + (-0.3) = -1.8, a = 1.0 + (-0.3) = 0.7, c = 0.22
(
  1,
  'risk_quantitative',
  'In quantitative risk analysis, what does ALE represent?',
  '["The total cost of all security controls deployed in a year", "The maximum possible loss from any single security incident", "The average time needed to recover from a security incident", "The expected yearly financial loss from a specific threat"]'::jsonb,
  3,
  'Annual Loss Expectancy (ALE) represents the expected yearly financial loss from a specific threat. It is calculated as ALE = SLE × ARO, where SLE (Single Loss Expectancy) is the loss per incident and ARO (Annualized Rate of Occurrence) is how often the threat is expected to occur per year.',
  'ALE = SLE × ARO. "Annual Loss Expected" — how much you EXPECT to lose per YEAR.',
  'understand',
  'definition',
  'easy',
  0.70, -1.80, 0.22,
  'manual'
),

-- Q5: Easy / Understand / Best Answer — correct at 3
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1,
  'ethics',
  'Which of the following is the FIRST canon of the (ISC)² Code of Ethics?',
  '["Provide diligent and competent service to organizational principals", "Act honorably, honestly, justly, responsibly, and legally in all dealings", "Advance and protect the profession through education and research", "Protect society, the common good, public trust, and the infrastructure"]'::jsonb,
  3,
  'The (ISC)² Code of Ethics has four canons in priority order: 1) Protect society, 2) Act honorably, 3) Provide diligent service, 4) Advance the profession. The order matters — public safety always comes first, even above employer loyalty.',
  'PAPA: Protect society, Act honorably, Provide service, Advance profession.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'manual'
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM (8) — IRT b ≈ 0.0
-- ═══════════════════════════════════════════════════════════

-- Q6: Medium / Apply / Scenario — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1,
  'risk_management',
  'A security team has identified a vulnerability in a legacy system that would cost $500,000 to remediate. The system is scheduled for decommissioning in 6 months. The CISO decides to monitor the vulnerability and accept the risk with compensating controls. Which risk treatment strategy is being applied?',
  '["Risk avoidance through system elimination", "Risk acceptance with compensating controls", "Risk transference to an insurance provider", "Risk rejection by ignoring the vulnerability"]'::jsonb,
  1,
  'The CISO is accepting the risk (acknowledging it exists and choosing not to fully remediate) while applying compensating controls to reduce it. This is risk acceptance with mitigation — a pragmatic approach when full remediation cost exceeds the time-limited exposure. Risk avoidance would mean eliminating the system immediately.',
  NULL,
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'manual'
),

-- Q7: Medium / Apply / Calculation — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  1,
  'risk_quantitative',
  'An organization''s web server has an asset value of $200,000. A risk assessment determines the exposure factor for a DDoS attack is 30% and the annualized rate of occurrence is 2. What is the Annualized Loss Expectancy (ALE)?',
  '["$120,000", "$60,000", "$200,000", "$400,000"]'::jsonb,
  0,
  'ALE = SLE × ARO. First, SLE = Asset Value × Exposure Factor = $200,000 × 0.30 = $60,000. Then, ALE = SLE × ARO = $60,000 × 2 = $120,000. This means the organization can expect to lose $120,000 per year from DDoS attacks on this server.',
  'ALE = AV × EF × ARO. Asset Value × Exposure Factor = SLE, then × ARO = ALE.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'manual'
),

-- Q8: Medium / Understand / Comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1,
  'bcp_drp',
  'What is the PRIMARY difference between Recovery Time Objective (RTO) and Maximum Tolerable Downtime (MTD)?',
  '["RTO applies exclusively to IT systems; MTD applies only to business processes", "RTO is established by technical teams; MTD is determined by insurance providers", "RTO is the target time to restore operations; MTD is the maximum tolerable outage", "RTO measures acceptable data loss in hours; MTD measures total financial impact"]'::jsonb,
  2,
  'RTO is the TARGET time to restore a system or function after disruption — it''s a goal set by the organization. MTD is the MAXIMUM time the business can tolerate the outage before suffering unacceptable damage. RTO must always be less than MTD: you need to recover (RTO) before the deadline (MTD).',
  'RTO < MTD always. RTO = goal to restore. MTD = deadline of doom.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'manual'
),

-- Q9: Medium / Apply / Best Answer — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1,
  'personnel_security',
  'An organization discovers that a systems administrator has been accessing financial records outside their job responsibilities. Which personnel security control would have been MOST effective in detecting this behavior earlier?',
  '["Background checks during the hiring process", "Mandatory vacation policies for key personnel", "Non-disclosure agreements with all staff members", "Recurring security awareness training programs"]'::jsonb,
  1,
  'Mandatory vacations force employees to step away from their duties, during which time a substitute performs the role. This is one of the most effective controls for detecting fraud and unauthorized activities because the substitute is likely to notice irregularities. Background checks are preventive but wouldn''t detect ongoing abuse.',
  NULL,
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'manual'
),

-- Q10: Medium / Understand / Except/Not — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  1,
  'bcp_drp',
  'All of the following are phases of the Business Continuity Planning lifecycle EXCEPT:',
  '["Vulnerability scanning", "Business Impact Analysis", "Strategy development", "Plan testing and maintenance"]'::jsonb,
  0,
  'The BCP lifecycle includes: 1) Project initiation, 2) Business Impact Analysis (BIA), 3) Recovery strategy development, 4) Plan development, 5) Testing and exercises, 6) Plan maintenance. Vulnerability scanning is a security assessment activity (Domain 6), not a phase of the BCP lifecycle.',
  NULL,
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'manual'
),

-- Q11: Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1,
  'compliance_legal',
  'A multinational corporation based in the United States collects personal data from European Union citizens through its website. The company has not obtained explicit consent for data processing. Under GDPR, what is the MOST significant risk the company faces?',
  '["Mandatory suspension of all website operations for a minimum of 30 days", "Criminal prosecution of the company''s chief executive and board members", "Fines up to 4% of annual global revenue or €20 million, whichever is greater", "Automatic revocation of the company''s business license in EU member states"]'::jsonb,
  2,
  'GDPR imposes significant financial penalties for non-compliance. The maximum fine for serious violations (like processing without consent) is up to 4% of annual global turnover or €20 million, whichever is greater. This makes GDPR one of the most financially impactful privacy regulations globally.',
  NULL,
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'manual'
),

-- Q12: Medium / Apply / Most Likely — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  1,
  'threat_modeling',
  'During a threat modeling exercise using STRIDE, the team identifies a concern about a user being able to deny performing a critical financial transaction. Which STRIDE category does this threat fall under?',
  '["Repudiation", "Information Disclosure", "Tampering", "Elevation of Privilege"]'::jsonb,
  0,
  'STRIDE categorizes threats as: Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, and Elevation of privilege. A user denying they performed an action is a Repudiation threat. The countermeasure is non-repudiation controls like digital signatures and audit logs.',
  'Repudiation = "I didn''t do it!" The threat of denying actions. Counter with non-repudiation.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'manual'
),

-- Q13: Medium / Understand / Best Answer — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1,
  'awareness_training',
  'Which of the following is the MOST effective way to measure the effectiveness of a security awareness training program?',
  '["Count the number of employees who completed the training modules", "Review the training budget compared to published industry benchmarks", "Survey employees on whether they found the training content valuable", "Track phishing simulation click rates before and after training"]'::jsonb,
  3,
  'Measuring behavioral change (like reduced phishing click rates) is the most effective way to evaluate training effectiveness because it shows actual behavior modification. Completion rates measure attendance, not learning. Satisfaction surveys measure enjoyment, not security improvement.',
  NULL,
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'manual'
),

-- ═══════════════════════════════════════════════════════════
-- HARD (5) — IRT b ≈ 1.5
-- ═══════════════════════════════════════════════════════════

-- Q14: Hard / Analyze / First Action — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'risk_management',
  'A newly appointed CISO discovers that the organization has no formal risk management program. The board has asked for a plan to establish one. What should the CISO do FIRST?',
  '["Purchase and deploy a GRC platform to centralize risk tracking processes", "Define the organization''s risk appetite and tolerance with senior leadership", "Conduct a comprehensive vulnerability scan of all IT assets in the network", "Hire a dedicated team of risk analysts to begin quantitative risk assessments"]'::jsonb,
  1,
  'Before any technical activities can begin, the organization must define its risk appetite (how much risk it''s willing to accept) and risk tolerance (acceptable variation) with executive buy-in. This strategic foundation drives all subsequent risk management decisions. Without it, technical assessments lack context for prioritization.',
  NULL,
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'manual'
),

-- Q15: Hard / Analyze / TLATM — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1,
  'security_governance',
  'As a security manager, the development team wants to bypass the change management process to deploy a critical feature update requested by a major client. The client has threatened to leave if the feature is not available within 48 hours. What is your PRIMARY concern?',
  '["Preventing any deployment until the complete change management process is followed", "Immediately approving the bypass request to retain the important client relationship", "Ensuring the risk of bypassing change management is formally accepted by proper authority", "Escalating the situation to law enforcement due to the potential for client coercion"]'::jsonb,
  2,
  'A security manager must think in terms of risk management, not rigid compliance. The correct approach is to ensure that if the change management process is bypassed, the risk is formally acknowledged and accepted by someone with the authority to do so (like a senior executive). This balances business needs with security governance.',
  NULL,
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'manual'
),

-- Q16: Hard / Apply / Scenario — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1,
  'bcp_drp',
  'An organization conducts a tabletop exercise for its disaster recovery plan. During the exercise, participants discover that the backup data center has insufficient capacity to run all critical applications simultaneously. The current RTO is 4 hours but the team estimates actual recovery would take 12 hours. What is the MOST appropriate next step?',
  '["Immediately invest in a hot site with full redundancy for all critical applications", "Reduce the number of applications classified as critical to match existing capacity", "Switch from tabletop exercises to full-scale interruption tests for all systems", "Update the BIA to reflect actual capabilities and present revised RTOs to management"]'::jsonb,
  3,
  'When testing reveals that recovery capabilities don''t match objectives, the first step is to update the Business Impact Analysis with accurate data and present the gap to management. Management must then decide whether to invest in better capabilities or accept longer RTOs. Arbitrarily changing classifications or investing without analysis is premature.',
  NULL,
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'manual'
),

-- Q17: Hard / Analyze / Most Likely — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  1,
  'compliance_legal',
  'An organization operating in multiple jurisdictions discovers that compliance with Country A''s data localization requirements conflicts with Country B''s data access requirements for law enforcement. What approach BEST addresses this conflict?',
  '["Comply with whichever jurisdiction imposes the higher penalties for non-compliance", "Store separate copies of all regulated data in each jurisdiction to satisfy both", "Seek formal exemptions from both countries'' regulatory bodies to resolve the conflict", "Engage legal counsel for conflict-of-laws analysis and design compliant architecture"]'::jsonb,
  3,
  'Cross-jurisdictional compliance conflicts require legal analysis specific to the situation. A conflict-of-laws analysis identifies where requirements overlap, conflict, and can be reconciled through technical architecture (like data residency with controlled access). Simply choosing the highest penalty ignores legal obligations to both jurisdictions.',
  NULL,
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'manual'
),

-- Q18: Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'risk_management',
  'During a risk assessment, the team identifies that a critical third-party SaaS provider has no SOC 2 report and refuses to undergo an independent security audit. The provider''s service is deeply integrated into the organization''s core business process with no viable alternative. What is the BEST risk management approach?',
  '["Begin a project to replace the SaaS provider with a fully in-house developed solution", "Implement compensating controls at integration points and add contractual security SLAs", "Accept the risk without additional controls since the provider is critical to operations", "Discontinue use of the provider and temporarily halt the affected business process"]'::jsonb,
  1,
  'When a critical vendor cannot provide assurance, the best approach combines compensating controls (monitor what you can''t audit), contractual requirements (shift liability), and increased oversight. Replacement may be a long-term goal but the immediate response must manage current risk. Blind acceptance and business disruption are both inappropriate extremes.',
  NULL,
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'manual'
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD (2) — IRT b ≈ 2.5 (clamped to 3.0)
-- ═══════════════════════════════════════════════════════════

-- Q19: Very Hard / Analyze / TLATM — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.6 → clamped 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1,
  'security_governance',
  'As a CISO presenting to the board of directors, you need to justify a $2 million investment in a zero-trust architecture initiative. The CFO argues that the current perimeter-based security has prevented any major breaches. The CEO asks for your recommendation. What is the MOST effective approach to justify this investment?',
  '["Present a list of recent breaches at competitor organizations that used perimeter security", "Demonstrate the technical superiority of zero-trust components through a proof-of-concept lab", "Frame zero trust as a business enabler using quantitative risk analysis to show ROI versus cost", "Recommend starting with a smaller pilot program and requesting the remaining budget next year"]'::jsonb,
  2,
  'Board-level communication requires business language, not technical jargon. The most effective justification combines business value (enablement, not just protection), quantitative risk analysis (ROI language the CFO understands), and strategic alignment (regulatory trends, workforce changes). Fear-based selling, technical demos, and delayed investment don''t address the board''s need for business justification.',
  NULL,
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'manual'
),

-- Q20: Very Hard / Analyze / First Action — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.3 = 3.4 → clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'risk_management',
  'An organization completes a comprehensive risk assessment and identifies 47 risks across all business units. The risk register shows 12 high-impact risks, 20 medium-impact risks, and 15 low-impact risks. The total cost of treating all risks exceeds the annual security budget by 300%. As the security manager, what should you do FIRST?',
  '["Map risks to business objectives and present a prioritized plan aligned with risk appetite", "Focus exclusively on the 12 high-impact risks and accept all medium and low-impact risks", "Request a 300% budget increase from the board using the full risk register as justification", "Implement the cheapest available controls first to address the maximum number of risks"]'::jsonb,
  0,
  'When resources are limited (always), the security manager must prioritize by aligning risk treatment with business strategy and risk appetite. Not all high risks may be equally important to the business, and some medium risks may affect critical objectives. The manager''s role is to present options and let management make informed decisions about resource allocation — not to make those decisions unilaterally.',
  NULL,
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'manual'
);

-- ═══════════════════════════════════════════════════════════
-- Verification query — run after insert to confirm
-- ═══════════════════════════════════════════════════════════

-- SELECT
--   COUNT(*) AS total,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'easy') AS easy,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'medium') AS medium,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'hard') AS hard,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'very_hard') AS very_hard,
--   COUNT(*) FILTER (WHERE correct_index = 0) AS pos_a,
--   COUNT(*) FILTER (WHERE correct_index = 1) AS pos_b,
--   COUNT(*) FILTER (WHERE correct_index = 2) AS pos_c,
--   COUNT(*) FILTER (WHERE correct_index = 3) AS pos_d
-- FROM cat_questions
-- WHERE domain_id = 1 AND source = 'manual';
