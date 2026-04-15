// ═══════════════════════════════════════════════════════════
// Domain 1: Security and Risk Management — Sample Questions
// 20 questions for end-to-end CAT engine testing
// Distribution: 5 easy, 8 medium, 5 hard, 2 very hard
// Position distribution: 5 at each of positions 0, 1, 2, 3
// ═══════════════════════════════════════════════════════════

import { createManualQuestion } from '@/lib/question-generator';

export const DOMAIN_1_SAMPLE_QUESTIONS = [

  // ═══════════════════════════════════════════════════════
  // EASY (5) — IRT b ≈ -1.5
  // ═══════════════════════════════════════════════════════

  // 1. Easy / Remember / Definition — correct at 0
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_management',
    question_text: 'Which of the following BEST defines residual risk?',
    options: [
      'The risk that remains after controls have been implemented',
      'The total risk present before any controls are applied',
      'The risk of a control failing during its implementation',
      'The risk associated with natural disasters exclusively',
    ],
    correct_index: 0,
    explanation: 'Residual risk is the risk that remains after security controls have been applied. It is the portion of inherent risk that controls cannot eliminate. Organizations must accept residual risk if it falls within their risk tolerance.',
    mnemonic_hint: 'Residual = Remainder. What\'s LEFT over after you\'ve done your best.',
    cognitive_level: 'remember',
    question_type: 'definition',
    difficulty_rating: 'easy',
  }),

  // 2. Easy / Remember / Comparison — correct at 1
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'security_governance',
    question_text: 'What is the PRIMARY difference between due care and due diligence?',
    options: [
      'Due care applies to employees only; due diligence applies to management',
      'Due care is acting reasonably; due diligence is researching and verifying',
      'Due care is a legal requirement; due diligence is an optional best practice',
      'Due care involves technology controls; due diligence involves physical controls',
    ],
    correct_index: 1,
    explanation: 'Due care means acting as a reasonable, prudent person would under similar circumstances — taking appropriate action. Due diligence means doing your homework: researching, investigating, and verifying before making decisions. Due care is "doing"; due diligence is "knowing."',
    mnemonic_hint: 'Due CARE = I CARE enough to ACT. Due DILIGENCE = I\'m DILIGENT enough to RESEARCH.',
    cognitive_level: 'remember',
    question_type: 'comparison',
    difficulty_rating: 'easy',
  }),

  // 3. Easy / Understand / Best Answer — correct at 2
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'security_policies',
    question_text: 'Which of the following BEST describes the purpose of a security policy?',
    options: [
      'To provide step-by-step technical instructions for system configuration',
      'To define the budget allocation for security tools and staff positions',
      'To communicate management\'s expectations for security requirements',
      'To list all known vulnerabilities and their remediation timelines',
    ],
    correct_index: 2,
    explanation: 'A security policy is a high-level document that communicates management\'s intent, expectations, and requirements for security within the organization. It is strategic, not tactical — it says WHAT must be done, not HOW. Procedures provide the step-by-step instructions.',
    cognitive_level: 'understand',
    question_type: 'best_answer',
    difficulty_rating: 'easy',
  }),

  // 4. Easy / Understand / Definition — correct at 3
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_quantitative',
    question_text: 'In quantitative risk analysis, what does ALE represent?',
    options: [
      'The total cost of all security controls deployed in a year',
      'The maximum possible loss from any single security incident',
      'The average time needed to recover from a security incident',
      'The expected yearly financial loss from a specific threat',
    ],
    correct_index: 3,
    explanation: 'Annual Loss Expectancy (ALE) represents the expected yearly financial loss from a specific threat. It is calculated as ALE = SLE × ARO, where SLE (Single Loss Expectancy) is the loss per incident and ARO (Annualized Rate of Occurrence) is how often the threat is expected to occur per year.',
    mnemonic_hint: 'ALE = SLE × ARO. "Annual Loss Expected" — how much you EXPECT to lose per YEAR.',
    cognitive_level: 'understand',
    question_type: 'definition',
    difficulty_rating: 'easy',
  }),

  // 5. Easy / Understand / Best Answer — correct at 3
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'ethics',
    question_text: 'Which of the following is the FIRST canon of the (ISC)² Code of Ethics?',
    options: [
      'Provide diligent and competent service to organizational principals',
      'Act honorably, honestly, justly, responsibly, and legally in all dealings',
      'Advance and protect the profession through education and research',
      'Protect society, the common good, public trust, and the infrastructure',
    ],
    correct_index: 3,
    explanation: 'The (ISC)² Code of Ethics has four canons in priority order: 1) Protect society, 2) Act honorably, 3) Provide diligent service, 4) Advance the profession. The order matters — public safety always comes first, even above employer loyalty.',
    mnemonic_hint: 'PAPA: Protect society, Act honorably, Provide service, Advance profession.',
    cognitive_level: 'understand',
    question_type: 'best_answer',
    difficulty_rating: 'easy',
  }),

  // ═══════════════════════════════════════════════════════
  // MEDIUM (8) — IRT b ≈ 0.0
  // ═══════════════════════════════════════════════════════

  // 6. Medium / Apply / Scenario — correct at 1
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_management',
    question_text: 'A security team has identified a vulnerability in a legacy system that would cost $500,000 to remediate. The system is scheduled for decommissioning in 6 months. The CISO decides to monitor the vulnerability and accept the risk with compensating controls. Which risk treatment strategy is being applied?',
    options: [
      'Risk avoidance through system elimination',
      'Risk acceptance with compensating controls',
      'Risk transference to an insurance provider',
      'Risk rejection by ignoring the vulnerability',
    ],
    correct_index: 1,
    explanation: 'The CISO is accepting the risk (acknowledging it exists and choosing not to fully remediate) while applying compensating controls to reduce it. This is risk acceptance with mitigation — a pragmatic approach when full remediation cost exceeds the time-limited exposure. Risk avoidance would mean eliminating the system immediately.',
    cognitive_level: 'apply',
    question_type: 'scenario',
    difficulty_rating: 'medium',
  }),

  // 7. Medium / Apply / Calculation — correct at 0
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_quantitative',
    question_text: 'An organization\'s web server has an asset value of $200,000. A risk assessment determines the exposure factor for a DDoS attack is 30% and the annualized rate of occurrence is 2. What is the Annualized Loss Expectancy (ALE)?',
    options: [
      '$120,000',
      '$60,000',
      '$200,000',
      '$400,000',
    ],
    correct_index: 0,
    explanation: 'ALE = SLE × ARO. First, SLE = Asset Value × Exposure Factor = $200,000 × 0.30 = $60,000. Then, ALE = SLE × ARO = $60,000 × 2 = $120,000. This means the organization can expect to lose $120,000 per year from DDoS attacks on this server.',
    mnemonic_hint: 'ALE = AV × EF × ARO. Asset Value × Exposure Factor = SLE, then × ARO = ALE.',
    cognitive_level: 'apply',
    question_type: 'calculation',
    difficulty_rating: 'medium',
  }),

  // 8. Medium / Understand / Comparison — correct at 2
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'bcp_drp',
    question_text: 'What is the PRIMARY difference between Recovery Time Objective (RTO) and Maximum Tolerable Downtime (MTD)?',
    options: [
      'RTO applies exclusively to IT systems; MTD applies only to business processes',
      'RTO is established by technical teams; MTD is determined by insurance providers',
      'RTO is the target time to restore operations; MTD is the maximum tolerable outage',
      'RTO measures acceptable data loss in hours; MTD measures total financial impact',
    ],
    correct_index: 2,
    explanation: 'RTO is the TARGET time to restore a system or function after disruption — it\'s a goal set by the organization. MTD is the MAXIMUM time the business can tolerate the outage before suffering unacceptable damage. RTO must always be less than MTD: you need to recover (RTO) before the deadline (MTD).',
    mnemonic_hint: 'RTO < MTD always. RTO = goal to restore. MTD = deadline of doom.',
    cognitive_level: 'understand',
    question_type: 'comparison',
    difficulty_rating: 'medium',
  }),

  // 9. Medium / Apply / Best Answer — correct at 1
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'personnel_security',
    question_text: 'An organization discovers that a systems administrator has been accessing financial records outside their job responsibilities. Which personnel security control would have been MOST effective in detecting this behavior earlier?',
    options: [
      'Background checks during the hiring process',
      'Mandatory vacation policies for key personnel',
      'Non-disclosure agreements with all staff members',
      'Recurring security awareness training programs',
    ],
    correct_index: 1,
    explanation: 'Mandatory vacations force employees to step away from their duties, during which time a substitute performs the role. This is one of the most effective controls for detecting fraud and unauthorized activities because the substitute is likely to notice irregularities. Background checks are preventive but wouldn\'t detect ongoing abuse.',
    cognitive_level: 'apply',
    question_type: 'best_answer',
    difficulty_rating: 'medium',
  }),

  // 10. Medium / Understand / Except/Not — correct at 0
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'bcp_drp',
    question_text: 'All of the following are phases of the Business Continuity Planning lifecycle EXCEPT:',
    options: [
      'Vulnerability scanning',
      'Business Impact Analysis',
      'Strategy development',
      'Plan testing and maintenance',
    ],
    correct_index: 0,
    explanation: 'The BCP lifecycle includes: 1) Project initiation, 2) Business Impact Analysis (BIA), 3) Recovery strategy development, 4) Plan development, 5) Testing and exercises, 6) Plan maintenance. Vulnerability scanning is a security assessment activity (Domain 6), not a phase of the BCP lifecycle.',
    cognitive_level: 'understand',
    question_type: 'except_not',
    difficulty_rating: 'medium',
  }),

  // 11. Medium / Apply / Scenario — correct at 2
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'compliance_legal',
    question_text: 'A multinational corporation based in the United States collects personal data from European Union citizens through its website. The company has not obtained explicit consent for data processing. Under GDPR, what is the MOST significant risk the company faces?',
    options: [
      'Mandatory suspension of all website operations for a minimum of 30 days',
      'Criminal prosecution of the company\'s chief executive and board members',
      'Fines up to 4% of annual global revenue or €20 million, whichever is greater',
      'Automatic revocation of the company\'s business license in EU member states',
    ],
    correct_index: 2,
    explanation: 'GDPR imposes significant financial penalties for non-compliance. The maximum fine for serious violations (like processing without consent) is up to 4% of annual global turnover or €20 million, whichever is greater. This makes GDPR one of the most financially impactful privacy regulations globally.',
    cognitive_level: 'apply',
    question_type: 'scenario',
    difficulty_rating: 'medium',
  }),

  // 12. Medium / Apply / Most Likely — correct at 0
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'threat_modeling',
    question_text: 'During a threat modeling exercise using STRIDE, the team identifies a concern about a user being able to deny performing a critical financial transaction. Which STRIDE category does this threat fall under?',
    options: [
      'Repudiation',
      'Information Disclosure',
      'Tampering',
      'Elevation of Privilege',
    ],
    correct_index: 0,
    explanation: 'STRIDE categorizes threats as: Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, and Elevation of privilege. A user denying they performed an action is a Repudiation threat. The countermeasure is non-repudiation controls like digital signatures and audit logs.',
    mnemonic_hint: 'Repudiation = "I didn\'t do it!" The threat of denying actions. Counter with non-repudiation.',
    cognitive_level: 'apply',
    question_type: 'most_likely',
    difficulty_rating: 'medium',
  }),

  // 13. Medium / Understand / Best Answer — correct at 3
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'awareness_training',
    question_text: 'Which of the following is the MOST effective way to measure the effectiveness of a security awareness training program?',
    options: [
      'Count the number of employees who completed the training modules',
      'Review the training budget compared to published industry benchmarks',
      'Survey employees on whether they found the training content valuable',
      'Track phishing simulation click rates before and after training',
    ],
    correct_index: 3,
    explanation: 'Measuring behavioral change (like reduced phishing click rates) is the most effective way to evaluate training effectiveness because it shows actual behavior modification. Completion rates measure attendance, not learning. Satisfaction surveys measure enjoyment, not security improvement.',
    cognitive_level: 'understand',
    question_type: 'best_answer',
    difficulty_rating: 'medium',
  }),

  // ═══════════════════════════════════════════════════════
  // HARD (5) — IRT b ≈ 1.5
  // ═══════════════════════════════════════════════════════

  // 14. Hard / Analyze / First Action — correct at 1
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_management',
    question_text: 'A newly appointed CISO discovers that the organization has no formal risk management program. The board has asked for a plan to establish one. What should the CISO do FIRST?',
    options: [
      'Purchase and deploy a GRC platform to centralize risk tracking processes',
      'Define the organization\'s risk appetite and tolerance with senior leadership',
      'Conduct a comprehensive vulnerability scan of all IT assets in the network',
      'Hire a dedicated team of risk analysts to begin quantitative risk assessments',
    ],
    correct_index: 1,
    explanation: 'Before any technical activities can begin, the organization must define its risk appetite (how much risk it\'s willing to accept) and risk tolerance (acceptable variation) with executive buy-in. This strategic foundation drives all subsequent risk management decisions. Without it, technical assessments lack context for prioritization.',
    cognitive_level: 'analyze',
    question_type: 'first_action',
    difficulty_rating: 'hard',
  }),

  // 15. Hard / Analyze / TLATM — correct at 2
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'security_governance',
    question_text: 'As a security manager, the development team wants to bypass the change management process to deploy a critical feature update requested by a major client. The client has threatened to leave if the feature is not available within 48 hours. What is your PRIMARY concern?',
    options: [
      'Preventing any deployment until the complete change management process is followed',
      'Immediately approving the bypass request to retain the important client relationship',
      'Ensuring the risk of bypassing change management is formally accepted by proper authority',
      'Escalating the situation to law enforcement due to the potential for client coercion',
    ],
    correct_index: 2,
    explanation: 'A security manager must think in terms of risk management, not rigid compliance. The correct approach is to ensure that if the change management process is bypassed, the risk is formally acknowledged and accepted by someone with the authority to do so (like a senior executive). This balances business needs with security governance.',
    cognitive_level: 'analyze',
    question_type: 'tlatm',
    difficulty_rating: 'hard',
  }),

  // 16. Hard / Apply / Scenario — correct at 3
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'bcp_drp',
    question_text: 'An organization conducts a tabletop exercise for its disaster recovery plan. During the exercise, participants discover that the backup data center has insufficient capacity to run all critical applications simultaneously. The current RTO is 4 hours but the team estimates actual recovery would take 12 hours. What is the MOST appropriate next step?',
    options: [
      'Immediately invest in a hot site with full redundancy for all critical applications',
      'Reduce the number of applications classified as critical to match existing capacity',
      'Switch from tabletop exercises to full-scale interruption tests for all systems',
      'Update the BIA to reflect actual capabilities and present revised RTOs to management',
    ],
    correct_index: 3,
    explanation: 'When testing reveals that recovery capabilities don\'t match objectives, the first step is to update the Business Impact Analysis with accurate data and present the gap to management. Management must then decide whether to invest in better capabilities or accept longer RTOs. Arbitrarily changing classifications or investing without analysis is premature.',
    cognitive_level: 'apply',
    question_type: 'scenario',
    difficulty_rating: 'hard',
  }),

  // 17. Hard / Analyze / Most Likely — correct at 3
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'compliance_legal',
    question_text: 'An organization operating in multiple jurisdictions discovers that compliance with Country A\'s data localization requirements conflicts with Country B\'s data access requirements for law enforcement. What approach BEST addresses this conflict?',
    options: [
      'Comply with whichever jurisdiction imposes the higher penalties for non-compliance',
      'Store separate copies of all regulated data in each jurisdiction to satisfy both',
      'Seek formal exemptions from both countries\' regulatory bodies to resolve the conflict',
      'Engage legal counsel for conflict-of-laws analysis and design compliant architecture',
    ],
    correct_index: 3,
    explanation: 'Cross-jurisdictional compliance conflicts require legal analysis specific to the situation. A conflict-of-laws analysis identifies where requirements overlap, conflict, and can be reconciled through technical architecture (like data residency with controlled access). Simply choosing the highest penalty ignores legal obligations to both jurisdictions.',
    cognitive_level: 'analyze',
    question_type: 'most_likely',
    difficulty_rating: 'hard',
  }),

  // 18. Hard / Analyze / Scenario — correct at 1
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_management',
    question_text: 'During a risk assessment, the team identifies that a critical third-party SaaS provider has no SOC 2 report and refuses to undergo an independent security audit. The provider\'s service is deeply integrated into the organization\'s core business process with no viable alternative. What is the BEST risk management approach?',
    options: [
      'Begin a project to replace the SaaS provider with a fully in-house developed solution',
      'Implement compensating controls at integration points and add contractual security SLAs',
      'Accept the risk without additional controls since the provider is critical to operations',
      'Discontinue use of the provider and temporarily halt the affected business process',
    ],
    correct_index: 1,
    explanation: 'When a critical vendor cannot provide assurance, the best approach combines compensating controls (monitor what you can\'t audit), contractual requirements (shift liability), and increased oversight. Replacement may be a long-term goal but the immediate response must manage current risk. Blind acceptance and business disruption are both inappropriate extremes.',
    cognitive_level: 'analyze',
    question_type: 'scenario',
    difficulty_rating: 'hard',
  }),

  // ═══════════════════════════════════════════════════════
  // VERY HARD (2) — IRT b ≈ 2.5
  // ═══════════════════════════════════════════════════════

  // 19. Very Hard / Analyze / TLATM — correct at 2
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'security_governance',
    question_text: 'As a CISO presenting to the board of directors, you need to justify a $2 million investment in a zero-trust architecture initiative. The CFO argues that the current perimeter-based security has prevented any major breaches. The CEO asks for your recommendation. What is the MOST effective approach to justify this investment?',
    options: [
      'Present a list of recent breaches at competitor organizations that used perimeter security',
      'Demonstrate the technical superiority of zero-trust components through a proof-of-concept lab',
      'Frame zero trust as a business enabler using quantitative risk analysis to show ROI versus cost',
      'Recommend starting with a smaller pilot program and requesting the remaining budget next year',
    ],
    correct_index: 2,
    explanation: 'Board-level communication requires business language, not technical jargon. The most effective justification combines business value (enablement, not just protection), quantitative risk analysis (ROI language the CFO understands), and strategic alignment (regulatory trends, workforce changes). Fear-based selling, technical demos, and delayed investment don\'t address the board\'s need for business justification.',
    cognitive_level: 'analyze',
    question_type: 'tlatm',
    difficulty_rating: 'very_hard',
  }),

  // 20. Very Hard / Analyze / First Action — correct at 0
  createManualQuestion({
    domain_id: 1,
    topic_cluster: 'risk_management',
    question_text: 'An organization completes a comprehensive risk assessment and identifies 47 risks across all business units. The risk register shows 12 high-impact risks, 20 medium-impact risks, and 15 low-impact risks. The total cost of treating all risks exceeds the annual security budget by 300%. As the security manager, what should you do FIRST?',
    options: [
      'Map risks to business objectives and present a prioritized plan aligned with risk appetite',
      'Focus exclusively on the 12 high-impact risks and accept all medium and low-impact risks',
      'Request a 300% budget increase from the board using the full risk register as justification',
      'Implement the cheapest available controls first to address the maximum number of risks',
    ],
    correct_index: 0,
    explanation: 'When resources are limited (always), the security manager must prioritize by aligning risk treatment with business strategy and risk appetite. Not all high risks may be equally important to the business, and some medium risks may affect critical objectives. The manager\'s role is to present options and let management make informed decisions about resource allocation — not to make those decisions unilaterally.',
    cognitive_level: 'analyze',
    question_type: 'first_action',
    difficulty_rating: 'very_hard',
  }),
];
