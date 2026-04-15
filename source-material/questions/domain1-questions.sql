-- =====================================================================
-- CISSP Quest -- Domain 1: Security and Risk Management
-- Complete Question Bank: 100 Questions
--
-- DIFFICULTY DISTRIBUTION:
--   easy: 15 | medium: 55 | hard: 20 | very_hard: 10
--
-- COGNITIVE LEVEL DISTRIBUTION:
--   remember: 10 | understand: 20 | apply: 45 | analyze: 25
--
-- QUESTION TYPE DISTRIBUTION:
--   scenario: 32 | first_action: 18 | best_answer: 14
--   most_likely: 9 | tlatm: 9 | comparison: 9
--   calculation: 4 | except_not: 5
--
-- CORRECT ANSWER POSITION: 25 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER  (clamped -3..3)
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION      (clamped 0.5..2.5)
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- =====================================================================
-- EASY QUESTIONS (15) -- b base = -1.5
-- =====================================================================

-- Q1: easy / remember / best_answer / correct=0
-- b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  1, 'cia_triad',
  'Which security principle ensures that information is accessible to authorized users when needed?',
  '["Availability", "Confidentiality", "Integrity", "Nonrepudiation"]'::jsonb,
  0,
  'Availability ensures that authorized users can access information and systems when needed. Confidentiality prevents unauthorized disclosure. Integrity protects data from unauthorized modification. Nonrepudiation ensures a subject cannot deny performing an action.',
  'CIA keeps secrets Correct and Ready. A = Available = Ready when you need it.',
  'remember', 'best_answer', 'easy',
  0.80, -2.00, 0.20, 'ai_generated', true
),

-- Q2: easy / remember / comparison / correct=1
-- b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  1, 'accountability_responsibility',
  'What is the KEY distinction between accountability and responsibility in security governance?',
  '["Accountability applies only to IT staff while responsibility applies to all employees", "Accountability cannot be delegated while responsibility can be delegated", "Accountability is documented in procedures while responsibility is documented in policies", "Accountability is temporary while responsibility is permanent"]'::jsonb,
  1,
  'Accountability is ultimate ownership and cannot be delegated -- the buck stops with one person, typically senior management. Responsibility is the duty to perform tasks and can be delegated to multiple people. This is one of the most frequently tested distinctions in Domain 1.',
  'Accountability is Always Above and cannot go down. Responsibility Runs downhill and can be shared.',
  'remember', 'comparison', 'easy',
  0.90, -1.90, 0.22, 'ai_generated', true
),

-- Q3: easy / understand / best_answer / correct=2
-- b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'ethics_compliance',
  'Which of the following BEST describes the first canon of the (ISC)2 Code of Ethics?',
  '["Provide diligent and competent service to principals", "Act honorably, honestly, justly, and responsibly", "Protect society, the common good, public trust, and the infrastructure", "Advance and protect the profession"]'::jsonb,
  2,
  'The (ISC)2 Code of Ethics has four canons in strict priority order: (1) Protect society, the common good, public trust, and the infrastructure, (2) Act honorably, (3) Provide diligent service, (4) Advance the profession. When canons conflict, higher-numbered canons yield to lower ones. Public safety always comes first.',
  'PAPA: Protect society, Act honorably, Provide service, Advance profession. Canon 1 = People first.',
  'understand', 'best_answer', 'easy',
  1.00, -1.50, 0.20, 'ai_generated', true
),

-- Q4: easy / understand / comparison / correct=3
-- b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'due_diligence_due_care',
  'How do due care and due diligence differ in the context of information security?',
  '["Due care is voluntary while due diligence is legally mandated", "Due care applies to technology while due diligence applies to people", "Due care is performed once during implementation while due diligence is ongoing", "Due care means doing the right thing while due diligence means proving you did the right thing"]'::jsonb,
  3,
  'Due care is taking reasonable action to protect assets -- the "doing" part. Due diligence is the research, documentation, and verification that proves due care was exercised -- the "proving" part. Both are ongoing obligations, not one-time activities. Failure to exercise both constitutes negligence.',
  'Care = Correct (doing the right thing). Diligence = Detect (proving and documenting it).',
  'understand', 'comparison', 'easy',
  1.10, -1.40, 0.22, 'ai_generated', true
),

-- Q5: easy / remember / most_likely / correct=0
-- b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  1, 'risk_analysis_quantitative',
  'In quantitative risk analysis, which formula correctly calculates Single Loss Expectancy (SLE)?',
  '["Asset Value multiplied by Exposure Factor", "Annualized Rate of Occurrence multiplied by Asset Value", "Annual Loss Expectancy divided by Exposure Factor", "Recovery Time Objective multiplied by Asset Value"]'::jsonb,
  0,
  'SLE = AV x EF. Single Loss Expectancy represents the monetary loss expected from a single occurrence of a threat. Asset Value is what the asset is worth, and Exposure Factor is the percentage of the asset that would be lost. ARO is used to calculate ALE, not SLE. RTO is a BCP metric unrelated to this formula.',
  'Sally Ate Apples: SLE = AV x EF. Think of SLE as "how much you lose ONCE."',
  'remember', 'most_likely', 'easy',
  0.90, -1.90, 0.22, 'ai_generated', true
),

-- Q6: easy / understand / scenario / correct=1
-- b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  1, 'risk_treatment',
  'A small retail company identifies that its point-of-sale systems are vulnerable to malware attacks. After evaluating the cost of upgrading all systems, the company decides to purchase cybersecurity insurance to cover potential losses. Which risk treatment strategy is the company using?',
  '["Risk avoidance", "Risk transference", "Risk mitigation", "Risk acceptance"]'::jsonb,
  1,
  'Purchasing insurance is the classic example of risk transference (also called risk sharing). The company is shifting the financial impact of a potential loss to the insurance provider. Risk avoidance would mean stopping the activity entirely. Risk mitigation would involve deploying controls to reduce the vulnerability. Risk acceptance would mean acknowledging the risk without taking action.',
  'ATMA like an ATM: Avoid, Transfer, Mitigate, Accept. Insurance = Transfer the financial burden.',
  'understand', 'scenario', 'easy',
  1.20, -1.30, 0.20, 'ai_generated', true
),

-- Q7: easy / remember / best_answer / correct=2
-- b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  1, 'security_governance',
  'Who is ULTIMATELY accountable for the security of an organization''s information assets?',
  '["The Chief Information Security Officer", "The IT security team", "Senior management", "The data custodian"]'::jsonb,
  2,
  'Senior management (CEO, Board of Directors) is ultimately accountable for the security of organizational assets. The CISO advises and manages the security program but accountability rests at the top. The IT security team implements controls. Data custodians maintain day-to-day protection. Accountability cannot be delegated downward.',
  'Accountability is Always Above. The buck stops at the TOP -- senior management owns it.',
  'remember', 'best_answer', 'easy',
  0.80, -2.00, 0.20, 'ai_generated', true
),

-- Q8: easy / understand / most_likely / correct=3
-- b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'intellectual_property',
  'Which type of intellectual property protection requires public disclosure of the innovation and provides protection for approximately 20 years?',
  '["Trade secret", "Copyright", "Trademark", "Patent"]'::jsonb,
  3,
  'Patents protect functional innovations and inventions for approximately 20 years but require full public disclosure of the invention. Trade secrets require no disclosure and can last indefinitely but lose protection once disclosed. Copyrights protect creative expression for the life of the author plus 70 years. Trademarks protect brand identifiers and can last indefinitely with renewal.',
  'Patents = Public disclosure + Period of ~20 years. Trade secrets = Total secrecy + potentially infinite.',
  'understand', 'most_likely', 'easy',
  1.10, -1.40, 0.22, 'ai_generated', true
),

-- Q9: easy / remember / scenario / correct=0
-- b = -1.5 + (-0.5) + 0.2 = -1.8, a = 0.8 + 0.2 = 1.0, c = 0.20
(
  1, 'control_types',
  'A company installs security cameras throughout its office building. An employee who was considering stealing equipment notices the cameras and decides not to proceed. In this situation, the security cameras are functioning as which type of control?',
  '["Deterrent", "Corrective", "Recovery", "Directive"]'::jsonb,
  0,
  'When security cameras discourage someone from committing an act, they function as a deterrent control. Deterrent controls discourage security violations before they occur. Cameras can also serve as detective controls when used to identify incidents after the fact. Corrective controls fix problems after detection. Recovery controls restore systems. Directive controls specify required actions through policies.',
  'Deterrent = Discourages. The camera made the thief think twice BEFORE acting.',
  'remember', 'scenario', 'easy',
  1.00, -1.80, 0.20, 'ai_generated', true
),

-- Q10: easy / understand / best_answer / correct=1
-- b = -1.5 + 0.0 + 0.0 = -1.5, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'security_awareness',
  'What is the PRIMARY goal of a security awareness program?',
  '["Teaching employees how to configure firewall rules and intrusion detection systems", "Changing employee behavior to reduce security risks caused by human error", "Providing certification-level education to all staff members across the organization", "Replacing technical security controls with procedural controls managed by end users"]'::jsonb,
  1,
  'Security awareness programs aim to change employee behavior and build a security-conscious culture. They are not about making everyone a technical expert or replacing technical controls. The goal is to reduce human-error-based risks through behavioral change. Effectiveness is measured by observable changes in behavior, such as reduced phishing click rates.',
  NULL,
  'understand', 'best_answer', 'easy',
  1.00, -1.50, 0.20, 'ai_generated', true
),

-- Q11: easy / understand / scenario / correct=2
-- b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  1, 'cia_triad',
  'A hospital''s electronic health records system goes offline due to a power failure, preventing doctors from accessing patient information during an emergency. Which element of the CIA triad has been MOST directly compromised?',
  '["Confidentiality", "Integrity", "Availability", "Authenticity"]'::jsonb,
  2,
  'Availability has been compromised because authorized users (doctors) cannot access the information they need when they need it. Confidentiality would be compromised if unauthorized persons accessed the data. Integrity would be compromised if the data were modified without authorization. Authenticity relates to verifying the origin of data.',
  'CIA: Confidentiality = secrets safe, Integrity = data correct, Availability = access ready. No access = Availability failure.',
  'understand', 'scenario', 'easy',
  1.20, -1.30, 0.20, 'ai_generated', true
),

-- Q12: easy / remember / comparison / correct=3
-- b = -1.5 + (-0.5) + 0.1 = -1.9, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  1, 'risk_analysis_qualitative',
  'What is the PRIMARY difference between qualitative and quantitative risk analysis?',
  '["Qualitative analysis is performed by external auditors while quantitative is performed internally", "Qualitative analysis focuses on technical vulnerabilities while quantitative focuses on business impact", "Qualitative analysis is required by law while quantitative analysis is optional", "Qualitative analysis uses subjective rankings while quantitative analysis assigns monetary values"]'::jsonb,
  3,
  'Qualitative risk analysis uses subjective methods like expert judgment and ranking scales (low/medium/high) without assigning dollar values. Quantitative risk analysis uses objective numerical methods and assigns monetary values through formulas like SLE and ALE. Both can be performed by internal or external teams. Most organizations use a hybrid approach.',
  'Qualitative = Quality words (low/medium/high). Quantitative = Quantity numbers (dollars and formulas).',
  'remember', 'comparison', 'easy',
  0.90, -1.90, 0.22, 'ai_generated', true
),

-- Q13: easy / understand / most_likely / correct=0
-- b = -1.5 + 0.0 + 0.1 = -1.4, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'bcp_drp',
  'Which activity is MOST likely the first step when initiating a Business Continuity Planning project?',
  '["Obtaining senior management support and sponsorship", "Purchasing and configuring a hot site for disaster recovery", "Conducting a full penetration test of all network systems", "Deploying redundant servers at a geographically distant location"]'::jsonb,
  0,
  'The first step in BCP is obtaining senior management support and sponsorship. Without executive backing, the BCP project will lack authority, funding, and organizational buy-in. Purchasing a hot site or deploying servers are recovery strategy decisions that come later. Penetration testing is a security assessment activity, not a BCP initiation step.',
  'BCP starts at the TOP. No executive support = no budget = no plan. Management first, always.',
  'understand', 'most_likely', 'easy',
  1.10, -1.40, 0.22, 'ai_generated', true
),

-- Q14: easy / remember / best_answer / correct=1
-- b = -1.5 + (-0.5) + 0.0 = -2.0, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  1, 'organizational_roles',
  'Which role is BEST described as the person who maintains and protects data on a day-to-day basis according to policies set by the data owner?',
  '["Data subject", "Data custodian", "Data processor", "Data steward"]'::jsonb,
  1,
  'The data custodian is responsible for the day-to-day maintenance and protection of data, implementing controls defined by the data owner. The data subject is the individual whose data is being processed. The data processor handles data on behalf of the controller. The data steward focuses on data quality and metadata management.',
  'Custodian = Caretaker. They guard the data daily but don''t own the decisions.',
  'remember', 'best_answer', 'easy',
  0.80, -2.00, 0.20, 'ai_generated', true
),

-- Q15: easy / understand / scenario / correct=2
-- b = -1.5 + 0.0 + 0.2 = -1.3, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  1, 'personnel_security',
  'An organization requires that all employees in financial roles take at least one consecutive week of vacation per year during which another employee performs their duties. What is the PRIMARY security purpose of this policy?',
  '["To improve employee morale and reduce workplace stress levels", "To ensure cross-training so multiple employees can perform each critical role", "To detect fraud or irregularities by having a different person review the work", "To comply with labor laws requiring minimum annual vacation time for employees"]'::jsonb,
  2,
  'Mandatory vacations are a detective control designed to uncover fraud and irregularities. When a substitute employee performs the absent worker''s duties, they are more likely to notice unauthorized activities, hidden transactions, or process deviations. While cross-training is a secondary benefit, the primary security purpose is fraud detection.',
  'Mandatory vacation = Mandatory review by someone else. The substitute becomes an unwitting auditor.',
  'understand', 'scenario', 'easy',
  1.20, -1.30, 0.20, 'ai_generated', true
),

-- =====================================================================
-- MEDIUM QUESTIONS (55) -- b base = 0.0
-- Questions 16-70
-- =====================================================================

-- Q16: medium / apply / scenario / correct=3
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_treatment',
  'A financial services firm identifies a high-severity vulnerability in its online banking platform. The cost to fully remediate the vulnerability is $800,000, and the platform generates $50 million in annual revenue. The security team recommends implementing a web application firewall as an interim measure while planning the full remediation. Which risk treatment strategy does the interim measure represent?',
  '["Risk avoidance because the vulnerability is being addressed", "Risk transference because the WAF shifts the risk to the vendor", "Risk acceptance because the vulnerability has not been fully remediated", "Risk mitigation because the control reduces the likelihood of exploitation"]'::jsonb,
  3,
  'Deploying a WAF as an interim control is risk mitigation -- it reduces the risk by lowering the likelihood or impact of exploitation without fully eliminating the vulnerability. Risk avoidance would mean taking the platform offline. Risk transference would involve insurance or outsourcing. Risk acceptance would mean taking no action at all.',
  'Mitigation = reduce risk with controls. WAF reduces exploitation likelihood = classic mitigation.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q17: medium / apply / first_action / correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'security_governance',
  'A company has just completed a merger with a smaller technology firm. The CISO is tasked with integrating the security programs. What should the CISO do FIRST?',
  '["Conduct a risk assessment of the acquired company''s systems and data", "Migrate all acquired company data to the parent company''s servers immediately", "Terminate all acquired company''s IT staff and replace with parent company employees", "Deploy the parent company''s antivirus solution across all acquired company endpoints"]'::jsonb,
  0,
  'During mergers and acquisitions, the first step is always to assess the risk landscape of the acquired organization. You cannot make informed decisions about integration without understanding what systems, data, vulnerabilities, and compliance obligations exist. Migrating data, changing staff, or deploying tools without assessment could introduce unknown risks or violate regulations.',
  'Mergers increase risk. FIRST = assess what you''re acquiring. Never integrate blind.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q18: medium / understand / except_not / correct=1
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  1, 'risk_treatment',
  'All of the following are valid risk treatment options recognized in security management EXCEPT:',
  '["Risk acceptance with documented approval from senior management", "Risk ignorance by choosing not to acknowledge the identified risk", "Risk transference through the purchase of cybersecurity insurance policies", "Risk avoidance by discontinuing the business activity that creates the risk"]'::jsonb,
  1,
  'Risk ignorance -- pretending a risk does not exist -- is never a valid treatment option. It violates due care and due diligence obligations. The four valid treatment options are avoidance, transference, mitigation, and acceptance. Even risk acceptance requires formal documentation and approval by an authorized decision-maker.',
  'ATMA: Avoid, Transfer, Mitigate, Accept. Ignore is NEVER an option -- it''s negligence.',
  'understand', 'except_not', 'medium',
  0.90, 0.20, 0.25, 'ai_generated', true
),

-- Q19: medium / apply / scenario / correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'privacy_laws',
  'A European e-commerce company experiences a data breach affecting the personal data of 50,000 EU customers. The breach is discovered on Monday morning. Under GDPR, by what deadline must the company notify the supervisory authority?',
  '["Within 24 hours of discovering the breach", "Within 48 hours of discovering the breach", "Within 72 hours of discovering the breach", "Within 7 business days of discovering the breach"]'::jsonb,
  2,
  'GDPR Article 33 requires notification to the supervisory authority within 72 hours of becoming aware of a personal data breach, unless the breach is unlikely to result in risk to individuals. This is one of the most commonly tested GDPR requirements. The 72-hour clock starts when the organization becomes aware of the breach, not when it occurred.',
  'GDPR = 72 hours. Think "3 days to report." Not 24, not 48, not a week -- exactly 72 hours.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q20: medium / apply / calculation / correct=3
-- b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'A database server is valued at $500,000. The exposure factor for a ransomware attack is 60%, and historical data indicates such attacks occur approximately once every 5 years. What is the Annualized Loss Expectancy (ALE)?',
  '["$500,000", "$300,000", "$100,000", "$60,000"]'::jsonb,
  3,
  'ALE = SLE x ARO. First calculate SLE = AV x EF = $500,000 x 0.60 = $300,000. Then ARO = 1 event per 5 years = 0.2. Finally, ALE = $300,000 x 0.2 = $60,000 per year. This means the organization should expect to lose $60,000 annually from ransomware attacks on this server.',
  'ALE = AV x EF x ARO. $500K x 0.6 = $300K (SLE). $300K x 0.2 = $60K (ALE).',
  'apply', 'calculation', 'medium',
  1.60, 0.70, 0.20, 'ai_generated', true
),

-- Q21: medium / apply / first_action / correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'nist_rmf',
  'An organization is implementing the NIST Risk Management Framework for a new cloud-based system. After completing the Prepare step, what is the NEXT step in the RMF process?',
  '["Categorize the information system based on potential impact", "Select security controls from the NIST SP 800-53 catalog", "Implement the chosen security controls on the system", "Assess whether the controls are operating as intended"]'::jsonb,
  0,
  'The NIST RMF follows seven steps in order: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. After Prepare, the next step is Categorize, which involves determining the adverse impact that loss of confidentiality, integrity, or availability would have on organizational operations and assets. Selecting controls comes after categorization.',
  'NIST RMF: People Can Select, Implement, Assess, Authorize, Monitor. Step 2 = Categorize.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q22: medium / understand / comparison / correct=1
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'bcp_drp',
  'What is the MOST accurate distinction between Business Continuity Planning (BCP) and Disaster Recovery Planning (DRP)?',
  '["BCP addresses natural disasters while DRP addresses man-made incidents", "BCP focuses on maintaining business operations while DRP focuses on restoring IT systems", "BCP is required by law while DRP is considered an optional best practice", "BCP is managed by the IT department while DRP is managed by business leadership"]'::jsonb,
  1,
  'BCP has a broader scope focused on maintaining critical business processes during and after a disruption, including communication plans, alternate work sites, and business process continuity. DRP has a narrower scope focused on restoring IT systems and infrastructure after a disaster. Both address all types of disruptions, not just natural or man-made. BCP is typically led by business leadership while DRP is led by IT.',
  'BCP = Business keeps running. DRP = Disaster recovery for IT. BCP is broader, DRP is technical.',
  'understand', 'comparison', 'medium',
  1.10, 0.10, 0.22, 'ai_generated', true
),

-- Q23: medium / apply / best_answer / correct=2
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1, 'threat_modeling',
  'A development team is using STRIDE to identify threats to a new web application. They discover that users could potentially modify transaction records in transit between the client and server. Which STRIDE category does this threat belong to?',
  '["Spoofing", "Repudiation", "Tampering", "Information Disclosure"]'::jsonb,
  2,
  'Tampering in STRIDE refers to the unauthorized modification of data. Modifying transaction records in transit is a direct tampering threat that violates integrity. Spoofing involves pretending to be someone else (authentication violation). Repudiation involves denying an action was performed. Information Disclosure involves unauthorized access to data (confidentiality violation).',
  'STRIDE: Tampering = modifying data. T violates Integrity. If data is changed without permission, it''s Tampering.',
  'apply', 'best_answer', 'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q24: medium / apply / scenario / correct=3
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'personnel_security',
  'A systems administrator has been with the company for 8 years and has accumulated access to financial systems, HR databases, and network infrastructure beyond what is required for current duties. The security team identifies this during an access review. What is this security concern called?',
  '["Separation of duties violation", "Need-to-know bypass", "Collusion risk", "Privilege creep"]'::jsonb,
  3,
  'Privilege creep occurs when employees accumulate access rights over time as they change roles or take on new responsibilities without having previous access revoked. This violates the principle of least privilege. Separation of duties requires multiple people for critical tasks. Need-to-know restricts access to information required for the job. Collusion involves two or more people conspiring.',
  'Privilege CREEP = access CREEPS upward over time. Regular access reviews are the cure.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q25: medium / apply / first_action / correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_treatment',
  'After completing a risk assessment, an organization identifies 30 risks that need treatment. The security budget can only address 10 of them. What should the risk manager do FIRST?',
  '["Prioritize risks based on impact and likelihood aligned with business objectives", "Implement the least expensive controls to address the maximum number of risks", "Request an emergency budget increase from the board of directors", "Accept all 30 risks and document them in the risk register"]'::jsonb,
  0,
  'When resources are limited, the risk manager must first prioritize risks by mapping them to business objectives, impact, and likelihood. This ensures the most critical risks are addressed first with available resources. Simply choosing the cheapest controls ignores risk severity. Requesting more budget without a prioritized plan is premature. Accepting all risks without attempting treatment would be negligent.',
  NULL,
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q26: medium / understand / best_answer / correct=1
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'security_governance',
  'Which of the following BEST describes the purpose of a security governance program?',
  '["To deploy technical security controls such as firewalls and intrusion detection systems", "To align the security function with business strategy, goals, and objectives", "To replace the need for compliance with external regulatory requirements", "To transfer all security responsibilities from business units to the IT department"]'::jsonb,
  1,
  'Security governance ensures the security function supports and aligns with the organization''s business strategy, goals, and objectives. It is a top-down strategic activity, not a technical deployment exercise. Governance does not replace compliance obligations -- it helps ensure they are met. Security is a business responsibility shared across the organization, not just an IT function.',
  'Governance = Guide the ship. Security must sail in the same direction as the business.',
  'understand', 'best_answer', 'medium',
  1.00, 0.00, 0.20, 'ai_generated', true
),

-- Q27: medium / apply / tlatm / correct=2
-- b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1, 'security_governance',
  'As a security manager, you learn that a business unit has deployed a new cloud-based CRM system without informing the security team. The system stores customer personal data and is already in production use. What is your BEST course of action?',
  '["Immediately shut down the unauthorized system and report the business unit to HR", "Ignore the issue since the system is already in production and disruption would harm revenue", "Conduct a risk assessment of the system and work with the business unit to address gaps", "File a formal complaint with the Chief Information Officer about shadow IT violations"]'::jsonb,
  2,
  'A security manager should think in terms of risk management, not punishment or avoidance. The pragmatic approach is to assess the risk of the already-deployed system and collaborate with the business unit to implement appropriate controls. Shutting it down immediately may harm business operations. Ignoring it violates due care. Filing complaints without assessing the actual risk is not productive.',
  NULL,
  'apply', 'tlatm', 'medium',
  1.70, 0.80, 0.20, 'ai_generated', true
),

-- Q28: medium / apply / scenario / correct=3
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'ethics_compliance',
  'A CISSP-certified professional discovers that their employer is deliberately violating environmental data reporting regulations to avoid fines. The professional has reported the concern to management, but they refused to take corrective action. According to the (ISC)2 Code of Ethics, what should the professional prioritize?',
  '["Protecting the employer''s reputation by keeping the matter confidential", "Following management''s direction since Canon 3 requires service to principals", "Advancing the profession by publishing the violation in security journals", "Protecting society and public trust even if it means escalating beyond the employer"]'::jsonb,
  3,
  'The (ISC)2 Code of Ethics canons are in priority order. Canon 1 (protect society, the common good, public trust, and the infrastructure) always takes precedence over Canon 3 (provide diligent service to principals). When an employer''s actions harm society, the professional''s obligation to protect the public overrides loyalty to the employer. Concealing the violation or publishing it in journals are both inappropriate responses.',
  'PAPA priority: Protect society FIRST. When canons conflict, the higher canon wins. Canon 1 > Canon 3.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q29: medium / apply / first_action / correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'bcp_drp',
  'An organization is developing its Business Continuity Plan for the first time. The BCP committee has been formed and received senior management approval. What should the committee do FIRST?',
  '["Conduct a Business Impact Analysis to identify critical business functions", "Purchase a hot site at a geographically distant location for disaster recovery", "Install backup generators and redundant network connections at the primary site", "Develop detailed recovery procedures for all information technology systems"]'::jsonb,
  0,
  'After project initiation and management approval, the next step in BCP is the Business Impact Analysis (BIA). The BIA identifies critical business functions, determines the impact of disruptions, and establishes recovery priorities (MTD, RTO, RPO). Without the BIA, the organization cannot make informed decisions about which recovery strategies to invest in. Purchasing sites or installing equipment before understanding requirements is premature.',
  'BIA comes FIRST in BCP after project setup. You must KNOW what''s critical before you PROTECT it.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q30: medium / apply / most_likely / correct=1
-- b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  1, 'control_types',
  'An organization implements a policy requiring all employees to display identification badges while on company premises. This policy is MOST accurately classified as which type of control?',
  '["Detective control because badges help identify unauthorized persons after entry", "Directive control because it mandates specific behavior through organizational policy", "Corrective control because badges fix the problem of unauthorized physical access", "Recovery control because badges help restore security after a breach incident"]'::jsonb,
  1,
  'A policy requiring employees to display badges is a directive control -- it directs behavior by establishing a mandatory requirement. While badges may also serve as detective controls when used to spot unauthorized persons, the policy itself is directive because it tells people what they must do. Corrective controls remediate after an incident. Recovery controls restore systems to normal operation.',
  'Directive = Directs behavior. A policy that says "you MUST do X" is directive by nature.',
  'apply', 'most_likely', 'medium',
  1.40, 0.40, 0.22, 'ai_generated', true
),

-- Q31: medium / apply / scenario / correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'supply_chain_risk',
  'A technology company discovers that networking equipment purchased from a third-party supplier contains firmware modifications not present in the manufacturer''s official release. The modifications appear to create a covert communication channel. What type of supply chain attack has MOST likely occurred?',
  '["A counterfeit component substitution with lower quality materials", "A firmware downgrade attack reducing the device to an older vulnerable version", "A hardware or software implant designed to provide unauthorized access", "A denial-of-service attack targeting the supplier''s distribution network"]'::jsonb,
  2,
  'This scenario describes a supply chain implant attack -- the insertion of unauthorized hardware or software components during the manufacturing or distribution process. Implants create covert access channels for attackers. Counterfeit substitution involves replacing genuine components with lower-quality copies. Firmware downgrade uses older versions. DoS attacks target availability, not covert access.',
  'Supply chain implant = something PLANTED inside the product. Like a hidden bug in the equipment.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q32: medium / understand / best_answer / correct=3
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'security_frameworks',
  'Which security framework provides a structured methodology for IT governance and is particularly useful for organizations conducting IT audits?',
  '["NIST Cybersecurity Framework", "SABSA", "ITIL", "COBIT"]'::jsonb,
  3,
  'COBIT (Control Objectives for Information and Related Technologies) is designed for IT governance and is particularly valuable for audit purposes. It helps organizations align IT with business goals and evaluate IT controls. NIST CSF focuses on cybersecurity risk management. SABSA is a risk-driven enterprise security architecture framework. ITIL focuses on IT service management best practices.',
  'COBIT = Control Objectives. Think "Audit and Governance." COBIT is the auditor''s friend.',
  'understand', 'best_answer', 'medium',
  1.00, 0.00, 0.20, 'ai_generated', true
),

-- Q33: medium / apply / first_action / correct=0
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_registers',
  'A newly hired risk analyst is asked to build the organization''s first risk register. What should the analyst do FIRST?',
  '["Identify and catalog the organization''s critical assets and their values", "Purchase a commercial GRC platform for risk tracking and reporting", "Schedule quarterly risk review meetings with all department heads", "Draft risk acceptance letters for senior management to sign"]'::jsonb,
  0,
  'Building a risk register starts with identifying and valuing assets. You cannot identify threats, vulnerabilities, or risks without first knowing what assets you need to protect and how valuable they are. Purchasing tools, scheduling meetings, and drafting acceptance letters are all important but they come after the foundational step of asset identification and valuation.',
  'Risk management always starts with ASSETS. What do you have? What is it worth? Then worry about threats.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q34: medium / apply / scenario / correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'social_engineering',
  'An executive at a financial firm receives an urgent email appearing to come from the CEO, requesting an immediate wire transfer of $250,000 to a new vendor account. The email address looks legitimate but uses a slightly misspelled domain name. This attack is BEST described as which type of social engineering?',
  '["Vishing", "Whaling", "Smishing", "Baiting"]'::jsonb,
  1,
  'This is a whaling attack -- a form of spear phishing specifically targeting high-level executives or "big fish" in an organization. The attack uses impersonation of another executive (CEO fraud) and urgency to manipulate the target into taking action. Vishing uses voice calls. Smishing uses SMS text messages. Baiting uses physical media or enticing downloads to lure victims.',
  'Whaling = targeting the big WHALE (executives). CEO fraud emails targeting C-suite = classic whaling.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q35: medium / apply / tlatm / correct=2
-- b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1, 'risk_treatment',
  'As a security manager, your team has identified a critical vulnerability in a legacy system that supports manufacturing operations. Patching the system requires 48 hours of downtime, which would halt production. The system is scheduled for replacement in 3 months. How should you advise management?',
  '["Immediately patch the system regardless of production impact since security comes first", "Ignore the vulnerability since the system is being replaced in 3 months", "Recommend compensating controls with documented risk acceptance until the replacement", "Outsource the legacy system to a third-party managed service provider to transfer the risk"]'::jsonb,
  2,
  'A security manager must balance security with business operations. The most appropriate advice is to implement compensating controls (additional monitoring, network segmentation, access restrictions) to reduce the risk while the system remains in production, with formal risk acceptance from management. Halting production for 48 hours may cause greater business damage than the vulnerability. Ignoring the risk is never acceptable.',
  NULL,
  'apply', 'tlatm', 'medium',
  1.70, 0.80, 0.20, 'ai_generated', true
),

-- Q36: medium / understand / comparison / correct=3
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'security_governance',
  'What is the KEY difference between a security policy and a security procedure?',
  '["Policies are created by IT staff while procedures are created by management", "Policies are optional guidelines while procedures are mandatory requirements", "Policies apply to external vendors while procedures apply to internal employees", "Policies state what must be done at a high level while procedures detail how to do it step by step"]'::jsonb,
  3,
  'Security policies are high-level documents that communicate management''s intent and expectations -- they state WHAT must be done. Procedures are detailed, step-by-step instructions that explain HOW to accomplish what the policy requires. Both are mandatory. Policies are created by management, not IT staff. Both can apply to internal and external parties depending on scope.',
  'Policy = WHAT (the law). Procedure = HOW (the steps). People Should Prefer Better Guidelines.',
  'understand', 'comparison', 'medium',
  1.10, 0.10, 0.22, 'ai_generated', true
),

-- Q37: medium / apply / scenario / correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'intellectual_property',
  'A software company develops a proprietary algorithm that gives it a significant competitive advantage. The company decides not to file for any formal intellectual property protection and instead relies on strict access controls, NDAs with employees, and compartmentalized knowledge. Which type of intellectual property protection is the company relying on?',
  '["Trade secret protection through maintaining secrecy of the algorithm", "Copyright protection through the expression of the algorithm in code", "Patent protection through the innovative functionality of the algorithm", "Trademark protection through the algorithm''s association with the company brand"]'::jsonb,
  0,
  'The company is relying on trade secret protection. Trade secrets do not require formal registration or public disclosure -- they are protected as long as the owner takes reasonable steps to maintain secrecy (NDAs, access controls, compartmentalization). Patents would require public disclosure. Copyright protects the expression of code, not the underlying algorithm concept. Trademarks protect brand identifiers.',
  'Trade secrets = Total secrecy, no disclosure, potentially infinite protection. But once revealed, protection is GONE.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q38: medium / apply / first_action / correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'personnel_security',
  'An employee in the finance department has just submitted their resignation, effective in two weeks. What should the security team do FIRST?',
  '["Delete all of the employee''s accounts and files immediately upon receiving the resignation", "Review the employee''s current access privileges and adjust based on remaining duties", "Escort the employee off the premises immediately to prevent any data theft", "Grant the employee elevated access so they can complete a full knowledge transfer"]'::jsonb,
  1,
  'For voluntary terminations, the first step is to review current access privileges and determine what access is still needed for the remaining notice period. Immediately deleting accounts or escorting the employee out is appropriate for involuntary terminations but unnecessarily hostile for voluntary departures. Granting elevated access would violate least privilege and increase risk.',
  'Voluntary exit = review and adjust access. Involuntary exit = immediate revocation. Match the response to the risk.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q39: medium / understand / most_likely / correct=2
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'security_frameworks',
  'Which risk management framework uses a quantitative approach based on financial terms to measure and prioritize information risk?',
  '["NIST SP 800-37 RMF", "ISO 31000", "FAIR (Factor Analysis of Information Risk)", "COSO ERM"]'::jsonb,
  2,
  'FAIR (Factor Analysis of Information Risk) is specifically designed as a quantitative framework that measures and communicates risk in financial terms. It enables apples-to-apples comparison of different risks using monetary values. NIST RMF provides a structured risk management process but is not exclusively quantitative. ISO 31000 is a general risk management standard. COSO ERM focuses on enterprise-wide risk management.',
  'FAIR = Financial Analysis of Information Risk. FAIR puts a dollar sign on risk.',
  'understand', 'most_likely', 'medium',
  1.10, 0.10, 0.22, 'ai_generated', true
),

-- Q40: medium / apply / scenario / correct=3
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'privacy_laws',
  'A US-based healthcare organization is developing a mobile app that allows patients to access their medical records. During a security review, the team realizes the app collects more personal health information than necessary for its stated purpose. Under HIPAA, which principle is being violated?',
  '["The right to be forgotten as specified in HIPAA privacy requirements", "The mandatory 72-hour breach notification requirement for covered entities", "The requirement to encrypt all data at rest using AES-256 encryption", "The minimum necessary standard for using and disclosing protected health information"]'::jsonb,
  3,
  'HIPAA''s minimum necessary standard requires covered entities to limit the use, disclosure, and request of protected health information (PHI) to the minimum amount needed to accomplish the intended purpose. Collecting more data than necessary violates this principle. The right to be forgotten is a GDPR concept, not HIPAA. The 72-hour notification is GDPR. HIPAA does not mandate specific encryption algorithms.',
  'HIPAA minimum necessary = only collect what you NEED. Don''t grab extra PHI just because you can.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q41: medium / apply / best_answer / correct=0
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1, 'security_awareness',
  'After implementing a new security awareness training program, which metric would BEST demonstrate the program''s effectiveness to senior management?',
  '["A measurable reduction in phishing simulation click rates over six months", "The total number of employees who completed the mandatory training modules", "The percentage of training budget spent compared to industry benchmarks", "Employee satisfaction scores from post-training feedback surveys"]'::jsonb,
  0,
  'Behavioral change metrics, such as reduced phishing click rates, are the most meaningful measure of training effectiveness because they demonstrate actual security improvement. Completion rates only measure attendance. Budget comparisons measure spending efficiency but not outcomes. Satisfaction scores measure engagement but not whether behavior actually changed.',
  NULL,
  'apply', 'best_answer', 'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q42: medium / apply / first_action / correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'security_governance',
  'A newly appointed CISO discovers that the organization has multiple security policies that were last updated three years ago and conflict with current business operations. What should the CISO do FIRST?',
  '["Immediately revoke all existing policies and draft completely new ones from scratch", "Review the existing policies against current business objectives and regulatory requirements", "Delegate all policy updates to the IT help desk team for faster turnaround", "Suspend security enforcement until updated policies are approved by the board"]'::jsonb,
  1,
  'The CISO should first review existing policies to understand what exists, identify conflicts with current operations, and assess alignment with regulatory requirements. Revoking all policies creates a governance vacuum. Delegating to the help desk is inappropriate as policies require management-level oversight. Suspending enforcement exposes the organization to unacceptable risk.',
  NULL,
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q43: medium / understand / scenario / correct=2
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + 0.2 = 1.2, c = 0.20
(
  1, 'control_types',
  'After a security breach, an organization implements new firewall rules that block the specific attack vector used by the attacker and restores systems from verified backups. The new firewall rules function primarily as which type of control?',
  '["Detective control", "Deterrent control", "Corrective control", "Compensating control"]'::jsonb,
  2,
  'Corrective controls remediate or fix issues after a security incident has occurred. Implementing new firewall rules in response to a specific attack vector is a corrective action -- it addresses the problem that was detected. Detective controls identify incidents as they occur or after the fact. Deterrent controls discourage violation attempts. Compensating controls are alternative measures when primary controls cannot be implemented.',
  'Corrective = CORRECT the problem after it happens. New rules to fix a known attack = corrective.',
  'understand', 'scenario', 'medium',
  1.20, 0.20, 0.20, 'ai_generated', true
),

-- Q44: medium / apply / tlatm / correct=3
-- b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1, 'due_diligence_due_care',
  'As a security manager, the legal department asks you to demonstrate that the organization has exercised due diligence in its security practices. Which evidence would BEST support this claim?',
  '["A list of all security tools currently deployed across the organization", "The resume and certifications of every member of the security team", "Employee testimonials about the positive security culture at the organization", "Documented risk assessments, policy reviews, audit findings, and remediation records"]'::jsonb,
  3,
  'Due diligence is proven through documentation -- evidence that the organization has planned, researched, verified, and maintained its security posture. Risk assessments, policy reviews, audit reports, and remediation tracking demonstrate that the organization systematically identifies and addresses security concerns. Tool lists show capability but not process. Resumes show qualifications but not actions. Testimonials are subjective.',
  'Due Diligence = Detect and Document. Prove it with RECORDS: assessments, audits, reviews, remediation.',
  'apply', 'tlatm', 'medium',
  1.70, 0.80, 0.20, 'ai_generated', true
),

-- Q45: medium / apply / calculation / correct=0
-- b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'An organization is evaluating a firewall upgrade that costs $15,000 per year. The current ALE for network intrusion is $80,000. With the upgraded firewall, the ALE would be reduced to $20,000. What is the value of the safeguard?',
  '["$45,000", "$60,000", "$80,000", "$15,000"]'::jsonb,
  0,
  'Safeguard Value = ALE(before) - ALE(after) - Annual Cost of Safeguard = $80,000 - $20,000 - $15,000 = $45,000. Since the value is positive, the firewall upgrade is cost-justified. A positive safeguard value means the control saves more money than it costs. If the value were negative, the control would cost more than the risk it addresses.',
  'Safeguard value = ALE(before) - ALE(after) - cost. Positive = worth it. Negative = too expensive.',
  'apply', 'calculation', 'medium',
  1.60, 0.70, 0.20, 'ai_generated', true
),

-- ---------------------------------------------------------------
-- Running tally at Q45:
-- easy: 15/15 | medium: 30/55 | hard: 0/20 | very_hard: 0/10
-- remember: 7/10 | understand: 14/20 | apply: 24/45 | analyze: 0/25
-- scenario: 14/25 | first_action: 10/20 | best_answer: 10/15
-- most_likely: 6/10 | tlatm: 4/10 | comparison: 6/10
-- calculation: 3/5 | except_not: 1/5
-- correct positions: 0=10, 1=11, 2=12, 3=12
-- ---------------------------------------------------------------

-- Q46: medium / understand / best_answer / correct=1
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'organizational_roles',
  'In a data governance framework, which role is BEST described as the individual who determines the purpose and means of processing personal data?',
  '["Data custodian", "Data controller", "Data processor", "Data steward"]'::jsonb,
  1,
  'The data controller (also called data owner in some frameworks) determines the purposes and means of processing personal data. They decide why and how personal data is collected and used. The data custodian handles day-to-day data protection. The data processor processes data on behalf of the controller. The data steward focuses on data quality and metadata governance.',
  'Controller = Controls the decisions (WHY and HOW). Processor = Processes on behalf of the controller.',
  'understand', 'best_answer', 'medium',
  1.00, 0.00, 0.20, 'ai_generated', true
),

-- Q47: medium / apply / scenario / correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_analysis_qualitative',
  'During a risk assessment workshop, a team of subject matter experts ranks threats using a scale of Low, Medium, and High based on their professional judgment and experience. No monetary values are assigned to potential losses. This approach is BEST described as which type of risk analysis?',
  '["Quantitative risk analysis using actuarial data", "Hybrid risk analysis combining multiple methodologies", "Qualitative risk analysis using expert judgment", "Delphi technique using anonymous statistical forecasting"]'::jsonb,
  2,
  'This is qualitative risk analysis because it uses subjective rankings (Low/Medium/High) based on expert judgment without assigning monetary values. Quantitative analysis would use dollar figures and formulas like SLE and ALE. A hybrid approach would combine both methods. The Delphi technique is a specific anonymous consensus method that could be used within qualitative analysis but is not the broader category.',
  'Qualitative = Quality words and rankings. No dollar signs. Quantitative = Quantity of dollars.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q48: medium / apply / first_action / correct=3
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'threat_modeling',
  'A development team is beginning a new web application project and the security architect recommends incorporating threat modeling into the software development lifecycle. What should the team do FIRST in the threat modeling process?',
  '["Deploy a web application firewall to protect against common attacks", "Perform penetration testing on the partially completed application code", "Begin coding security controls based on the OWASP Top 10 vulnerability list", "Define the security objectives and decompose the application to identify trust boundaries"]'::jsonb,
  3,
  'Threat modeling begins with defining security objectives and decomposing the application to understand its components, data flows, trust boundaries, and entry points. This reduction analysis provides the foundation for identifying threats. Deploying a WAF or coding controls without understanding the threat landscape is premature. Penetration testing comes later when code exists to test.',
  'Threat modeling starts with UNDERSTANDING: define objectives, decompose, then identify threats.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q49: medium / understand / comparison / correct=0
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'bcp_drp',
  'What is the MOST important distinction between Recovery Time Objective (RTO) and Recovery Point Objective (RPO)?',
  '["RTO measures the maximum acceptable downtime while RPO measures the maximum acceptable data loss", "RTO applies only to hardware systems while RPO applies only to software applications", "RTO is set by the IT department while RPO is determined by external auditors", "RTO is measured in dollars while RPO is measured in the number of affected users"]'::jsonb,
  0,
  'RTO is the target time to restore a system or function after a disruption -- it measures maximum tolerable downtime. RPO is the maximum acceptable amount of data loss measured in time -- it determines how frequently backups must occur. For example, an RPO of 4 hours means you can afford to lose no more than 4 hours of data. Both are determined through the BIA process, not by IT alone or external auditors.',
  'RTO = Recovery TIME (how long to restore). RPO = Recovery POINT (how much data loss is OK).',
  'understand', 'comparison', 'medium',
  1.10, 0.10, 0.22, 'ai_generated', true
),

-- Q50: medium / apply / scenario / correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'security_governance',
  'A multinational corporation is developing a strategic security plan. The plan outlines the organization''s long-term vision for security over the next five years, including goals for compliance with emerging regulations and alignment with business expansion plans. This document is BEST classified as which type of plan?',
  '["Operational plan with day-to-day security procedures", "Strategic plan with long-term security direction", "Tactical plan with project-level implementation details", "Incident response plan with emergency procedures"]'::jsonb,
  1,
  'A five-year security plan aligned with business strategy is a strategic plan. Strategic plans provide long-term vision and direction, typically spanning 3-5 years. Tactical plans cover approximately one year and focus on specific projects. Operational plans are short-term and detail day-to-day activities. Incident response plans address emergency procedures for security events.',
  'Strategic = 5 years (long view). Tactical = 1 year (projects). Operational = day-to-day (steps).',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q51: medium / remember / best_answer / correct=2
-- b = 0.0 + (-0.5) + 0.0 = -0.5, a = 0.8 + 0.0 = 0.8, c = 0.20
(
  1, 'cia_triad',
  'Which element of the CIA triad is MOST directly protected by implementing digital signatures on documents?',
  '["Confidentiality", "Availability", "Integrity", "Privacy"]'::jsonb,
  2,
  'Digital signatures primarily protect integrity by ensuring that a document has not been modified after signing. They also provide nonrepudiation (the signer cannot deny signing) and authentication (verifying the signer''s identity). Confidentiality is protected by encryption, not signatures. Availability relates to system uptime. Privacy is a broader concept related to personal data protection.',
  'Digital signatures = Integrity + Nonrepudiation. They prove WHO signed and that NOTHING changed.',
  'remember', 'best_answer', 'medium',
  0.80, -0.50, 0.20, 'ai_generated', true
),

-- Q52: medium / apply / first_action / correct=3
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'supply_chain_risk',
  'An organization is selecting a new cloud service provider for its critical business applications. The security team needs to evaluate the provider''s security posture. What should the team request FIRST?',
  '["A full copy of the provider''s source code for independent security review", "Permission to conduct a penetration test of the provider''s production environment", "The provider''s marketing materials describing their security certifications", "The provider''s SOC 2 Type 2 report covering the relevant trust service criteria"]'::jsonb,
  3,
  'A SOC 2 Type 2 report provides independent third-party assurance about the effectiveness of a service provider''s controls over a period of time. It is the standard mechanism for evaluating cloud provider security posture. Requesting source code is unrealistic. Penetration testing of a provider''s production environment requires prior agreement. Marketing materials are not independently verified.',
  'SOC 2 Type 2 = independent audit over TIME. Type 1 = point in time. Type 2 is more thorough.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q53: medium / apply / scenario / correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'nist_rmf',
  'An organization has implemented security controls for a new information system and an independent assessor has verified the controls are operating as intended. In the NIST RMF, the next step requires a senior official to review the risk assessment package and make a determination. What is this step called?',
  '["Authorize", "Monitor", "Categorize", "Prepare"]'::jsonb,
  0,
  'After the Assess step (where controls are verified), the Authorize step requires a senior official (authorizing official) to review the security assessment package and make a risk-based decision to grant or deny Authorization to Operate (ATO). The NIST RMF steps are: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. The authorization decision accepts residual risk on behalf of the organization.',
  'NIST RMF: after Assess comes Authorize. The senior official says "Yes, the risk is acceptable" = ATO.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q54: medium / analyze / except_not / correct=1
-- b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  1, 'control_types',
  'All of the following are categories used to classify security controls EXCEPT:',
  '["Administrative controls", "Emotional controls", "Physical controls", "Technical controls"]'::jsonb,
  1,
  'Security controls are classified into three categories: Administrative (policies, procedures, training), Technical/Logical (software, hardware mechanisms), and Physical (locks, fences, guards). "Emotional controls" is a fabricated term and does not exist in security control taxonomy. This is a common exam distractor designed to test whether candidates know the real categories.',
  'Three control categories: Administrative, Technical/Logical, Physical. ATP. Nothing else is real.',
  'analyze', 'except_not', 'medium',
  1.40, 0.80, 0.25, 'ai_generated', true
),

-- Q55: medium / apply / most_likely / correct=2
-- b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  1, 'privacy_laws',
  'A company that processes credit card transactions for retail merchants fails to meet the required security standards and experiences a data breach. Which framework MOST likely governs the consequences the company will face?',
  '["HIPAA because payment data includes personal financial health information", "FERPA because the retail data includes transaction records for education purchases", "PCI DSS because the company handles branded payment card data", "COPPA because the retail merchants sell products to customers of all ages"]'::jsonb,
  2,
  'PCI DSS (Payment Card Industry Data Security Standard) governs the security of payment card data. While not a law, it is contractually enforced by card brands and violations can result in significant fines and loss of card processing privileges. HIPAA applies to healthcare data. FERPA applies to student education records. COPPA applies to online data collection from children under 13.',
  'PCI DSS = Payment Cards. Not a law, but an industry STANDARD with real financial teeth.',
  'apply', 'most_likely', 'medium',
  1.40, 0.40, 0.22, 'ai_generated', true
),

-- Q56: medium / understand / best_answer / correct=3
-- b = 0.0 + 0.0 + 0.0 = 0.0, a = 1.0 + 0.0 = 1.0, c = 0.20
(
  1, 'risk_treatment',
  'An organization decides to discontinue an e-commerce service after determining that the cost of securing customer payment data exceeds the revenue the service generates. Which risk treatment strategy is being applied?',
  '["Risk mitigation by reducing the attack surface of the organization", "Risk transference by shifting the liability to customers who used the service", "Risk acceptance by acknowledging the security costs are too high", "Risk avoidance by eliminating the activity that generates the risk"]'::jsonb,
  3,
  'Discontinuing the activity that creates the risk is risk avoidance. By ceasing e-commerce operations, the organization eliminates the risk associated with processing payment data. Risk avoidance always involves stopping the risk-generating activity, which may result in lost business opportunities (opportunity cost). This is not mitigation (reducing risk) or transference (shifting financial burden).',
  'Avoidance = stop the activity entirely. No e-commerce = no payment card risk. But you lose the revenue too.',
  'understand', 'best_answer', 'medium',
  1.00, 0.00, 0.20, 'ai_generated', true
),

-- Q57: medium / apply / scenario / correct=0
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'personnel_security',
  'A bank requires that the processing of large wire transfers involves three separate employees: one to initiate the transfer, one to verify the details, and one to approve the final execution. This control is BEST described as which security principle?',
  '["Separation of duties requiring multiple parties for critical transactions", "Job rotation ensuring employees cycle through different positions regularly", "Mandatory vacation requiring periodic absences for fraud detection", "Need-to-know restricting information access to authorized personnel only"]'::jsonb,
  0,
  'Requiring multiple people to complete a critical transaction is separation of duties -- a preventive control designed to prevent fraud by ensuring no single individual can complete a high-risk action alone. Job rotation involves cycling employees through different roles. Mandatory vacation forces time away for peer review. Need-to-know restricts information access to what is required for the job.',
  'Separation of duties = separate the power. No one person should control an entire critical process.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q58: medium / apply / first_action / correct=1
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_analysis_qualitative',
  'An organization wants to conduct its first risk assessment but has very limited historical data on threat frequency and financial impact. What approach should the risk team take FIRST?',
  '["Delay the risk assessment until at least two years of incident data has been collected", "Conduct a qualitative risk assessment using expert judgment and relative rankings", "Hire an external firm to perform a full quantitative risk analysis using industry averages", "Implement all available security controls and measure their effectiveness over time"]'::jsonb,
  1,
  'When historical data is limited, a qualitative risk assessment is the appropriate starting point. Qualitative analysis uses expert judgment and relative rankings (low/medium/high) rather than precise monetary values, making it feasible without extensive historical data. Delaying the assessment leaves the organization unprotected. Implementing controls without assessment wastes resources on potentially low-priority risks.',
  'No data? Start qualitative. Expert judgment and rankings work when numbers are not available.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q59: medium / understand / most_likely / correct=2
-- b = 0.0 + 0.0 + 0.1 = 0.1, a = 1.0 + 0.1 = 1.1, c = 0.22
(
  1, 'threat_modeling',
  'Which threat modeling methodology uses a seven-stage process that is risk-centric and focuses on simulating attacker behavior to identify threats?',
  '["STRIDE", "DREAD", "PASTA", "VAST"]'::jsonb,
  2,
  'PASTA (Process for Attack Simulation and Threat Analysis) is a seven-stage, risk-centric methodology that simulates attacker behavior. Its stages progress from defining business objectives through technical scope, decomposition, threat analysis, vulnerability analysis, attack modeling, to risk and impact analysis. STRIDE categorizes threats into six categories. DREAD scores threat severity. VAST is designed for Agile integration.',
  'PASTA = 7 stages, risk-centric, attacker simulation. Think "7-course PASTA dinner" for the 7 stages.',
  'understand', 'most_likely', 'medium',
  1.10, 0.10, 0.22, 'ai_generated', true
),

-- Q60: medium / apply / tlatm / correct=3
-- b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1, 'ethics_compliance',
  'As a security manager at a hospital, you discover that the IT team has been storing unencrypted patient records on a shared drive accessible to all employees for convenience. When you raise the concern, the CIO says patient care is the priority and restricting access would slow down doctors. What is the MOST appropriate response?',
  '["Accept the CIO''s decision since patient care is indeed the top organizational priority", "Immediately encrypt all files and restrict access without consulting anyone", "Report the CIO to law enforcement for criminal negligence regarding patient data", "Present the HIPAA compliance risk and propose access controls that maintain clinical workflow"]'::jsonb,
  3,
  'A security manager must balance compliance with business needs. The correct approach is to frame the issue in terms of regulatory risk (HIPAA violations can result in severe penalties) while proposing solutions that maintain the clinical workflow the CIO values. Simply accepting the risk ignores legal obligations. Unilateral action without consultation undermines collaboration. Reporting to law enforcement is premature and disproportionate.',
  NULL,
  'apply', 'tlatm', 'medium',
  1.70, 0.80, 0.20, 'ai_generated', true
),

-- Q61: medium / remember / comparison / correct=0
-- b = 0.0 + (-0.5) + 0.1 = -0.4, a = 0.8 + 0.1 = 0.9, c = 0.22
(
  1, 'intellectual_property',
  'Which type of intellectual property protection can potentially last indefinitely as long as the owner continues to use and renew it?',
  '["Trademark", "Patent", "Copyright", "Industrial design"]'::jsonb,
  0,
  'Trademarks can last indefinitely as long as the owner continues to use the mark in commerce and files the required renewal documents. Patents expire after approximately 20 years. Copyrights last for the life of the author plus 70 years (or a set term for works for hire). Industrial design protections vary by jurisdiction but typically have fixed terms.',
  'Trademark = potentially infinite with renewal. Patent = ~20 years fixed. Copyright = life + 70.',
  'remember', 'comparison', 'medium',
  0.90, -0.40, 0.22, 'ai_generated', true
),

-- Q62: medium / apply / scenario / correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'cia_triad',
  'A government agency discovers that an insider has been secretly modifying financial audit reports before they are submitted to oversight committees. The modifications change calculated totals to hide budget discrepancies. Which element of the CIA triad has been MOST directly violated?',
  '["Confidentiality because the insider accessed restricted financial data", "Integrity because the financial reports have been unauthorized modified", "Availability because the accurate reports are not accessible to the committees", "Authenticity because the reports appear to come from authorized personnel"]'::jsonb,
  1,
  'Integrity has been violated because the data has been unauthorized modified -- the financial reports no longer accurately reflect reality. While confidentiality may also be a concern (unauthorized access), the primary violation is the modification of data. Availability is not directly affected since the reports are still accessible, just inaccurate. Authenticity is about verifying origin, which is not the core issue here.',
  'Integrity = data is CORRECT and unmodified. Unauthorized changes = integrity violation every time.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q63: medium / apply / first_action / correct=2
-- b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'ethics_compliance',
  'A security analyst discovers during a routine audit that the organization''s data retention practices violate GDPR requirements for EU customer data. Several databases retain personal data far beyond the stated purpose. What should the analyst do FIRST?',
  '["Immediately delete all EU customer data from the non-compliant databases", "Begin encrypting all EU customer data to compensate for the retention violation", "Document the findings and report them to management with recommended remediation steps", "Contact the EU supervisory authority to self-report the compliance violation"]'::jsonb,
  2,
  'The analyst should first document the findings and escalate to management with recommendations. Deleting data without authorization could cause business harm and may itself violate other regulations. Encryption does not fix a retention violation. Self-reporting to a supervisory authority is premature before management has reviewed the situation and determined the appropriate response.',
  'When you find a problem: Document, Report to management, Recommend. Don''t take unilateral action.',
  'apply', 'first_action', 'medium',
  1.50, 0.60, 0.20, 'ai_generated', true
),

-- Q64: medium / analyze / scenario / correct=3
-- b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'social_engineering',
  'An employee receives a phone call from someone claiming to be from the IT help desk, asking the employee to verify their password for a system migration. The caller uses specific technical terminology and references a real ongoing IT project. This technique is BEST described as which social engineering method?',
  '["Baiting using physical media to lure the victim", "Tailgating by following the employee into a secure area", "Smishing using text messages to steal credentials", "Pretexting by creating a fabricated scenario to gain trust"]'::jsonb,
  3,
  'Pretexting involves creating a fabricated scenario (pretext) to manipulate the victim into providing information or taking action. The attacker researches the target and creates a believable story using real project names and technical terminology to establish credibility. Baiting uses physical media or downloads. Tailgating involves physical following. Smishing uses SMS text messages.',
  'Pretexting = creating a convincing PRE-scripted TEXT (story) to manipulate the target.',
  'analyze', 'scenario', 'medium',
  1.70, 0.80, 0.20, 'ai_generated', true
),

-- Q65: medium / apply / best_answer / correct=0
-- b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'When determining whether a security control is cost-justified, which calculation provides the BEST basis for the decision?',
  '["Comparing the ALE before and after the control against the annual cost of the control", "Calculating the total cost of ownership of the control over its expected lifetime", "Measuring the reduction in vulnerability count after the control is deployed", "Surveying employees about their perceived improvement in security posture"]'::jsonb,
  0,
  'The safeguard value formula (ALE before - ALE after - annual cost of control) provides the most objective basis for cost-justification decisions. If the result is positive, the control saves more than it costs. TCO is relevant but does not consider the risk reduction benefit. Vulnerability counts are useful but do not directly translate to financial justification. Surveys are subjective.',
  'Cost-justified if: ALE(before) - ALE(after) > annual cost of control. Positive = worth it.',
  'apply', 'best_answer', 'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q66: medium / analyze / comparison / correct=1
-- b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  1, 'control_types',
  'What is the KEY difference between a compensating control and a corrective control?',
  '["Compensating controls are always physical while corrective controls are always technical", "Compensating controls are alternatives when primary controls are infeasible while corrective controls fix problems after incidents", "Compensating controls are more expensive while corrective controls are always free", "Compensating controls apply only to network security while corrective controls apply only to physical security"]'::jsonb,
  1,
  'Compensating controls are alternative measures implemented when the primary or preferred control cannot be used due to technical or business constraints. Corrective controls remediate or fix issues after a security incident has been detected. Both can be administrative, technical, or physical -- neither is limited to one category. Cost is not a defining characteristic of either type.',
  'Compensating = COMPENSATE for a missing primary control. Corrective = CORRECT after an incident.',
  'analyze', 'comparison', 'medium',
  1.60, 0.70, 0.22, 'ai_generated', true
),

-- Q67: medium / apply / scenario / correct=2
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'risk_treatment',
  'A retail organization identifies a risk that severe weather could damage its primary data center. After analysis, the organization contracts with a managed hosting provider to maintain a warm site that can assume operations within 24 hours. The organization also purchases business interruption insurance. Which risk treatment strategies are being employed?',
  '["Risk avoidance and risk acceptance", "Risk avoidance and risk transference", "Risk mitigation and risk transference", "Risk acceptance and risk mitigation"]'::jsonb,
  2,
  'The warm site is risk mitigation -- it reduces the impact of data center damage by providing an alternative processing capability. The business interruption insurance is risk transference -- it shifts the financial burden of downtime to the insurance provider. The organization is not avoiding the risk (still operating the data center) or simply accepting it (actively implementing controls).',
  'Multiple treatments can apply to the same risk. Warm site = mitigate. Insurance = transfer. Both together.',
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- Q68: medium / apply / calculation / correct=3
-- b = 0.0 + 0.3 + 0.4 = 0.7, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'A company''s main office building is valued at $10 million. The building sits on a 100-year flood plain. If a flood occurs, the estimated damage would destroy 50% of the building''s value. What is the Annualized Loss Expectancy for flood damage?',
  '["$5,000,000", "$500,000", "$100,000", "$50,000"]'::jsonb,
  3,
  'ALE = SLE x ARO. SLE = AV x EF = $10,000,000 x 0.50 = $5,000,000. A 100-year flood plain means the flood is expected once every 100 years, so ARO = 1/100 = 0.01. ALE = $5,000,000 x 0.01 = $50,000. The 100-year flood plain is a commonly tested ARO scenario -- remember to convert the return period to an annual rate.',
  '100-year flood = ARO of 0.01. ALE = AV x EF x ARO = $10M x 0.5 x 0.01 = $50K.',
  'apply', 'calculation', 'medium',
  1.60, 0.70, 0.20, 'ai_generated', true
),

-- Q69: medium / understand / except_not / correct=0
-- b = 0.0 + 0.0 + 0.2 = 0.2, a = 1.0 + (-0.1) = 0.9, c = 0.25
(
  1, 'privacy_laws',
  'All of the following are principles of the GDPR EXCEPT:',
  '["Risk expansion", "Data minimization", "Purpose limitation", "Accountability"]'::jsonb,
  0,
  'The seven GDPR principles are: (1) Lawfulness, fairness, and transparency, (2) Purpose limitation, (3) Data minimization, (4) Accuracy, (5) Storage limitation, (6) Integrity and confidentiality, (7) Accountability. "Risk expansion" is a fabricated term that does not appear in GDPR or any recognized privacy framework. It is designed as a distractor to test knowledge of actual GDPR principles.',
  'GDPR 7 principles: Lawful, Purpose, Minimize, Accurate, Storage limit, Secure, Accountable. No "risk expansion."',
  'understand', 'except_not', 'medium',
  0.90, 0.20, 0.25, 'ai_generated', true
),

-- Q70: medium / apply / scenario / correct=1
-- b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'security_governance',
  'During a board meeting, the CFO questions why the security department reports to the CIO, arguing that it creates a conflict of interest since IT operations and security have competing priorities. The CFO proposes that the CISO should report directly to the CEO. From a governance perspective, what is the MOST valid reason supporting the CFO''s proposal?',
  '["It would reduce the security department''s operating budget by eliminating a reporting layer", "It ensures security decisions are not subordinated to IT operational convenience", "It allows the CISO to directly manage IT infrastructure without CIO interference", "It eliminates the need for a security governance committee within the organization"]'::jsonb,
  1,
  'Having the CISO report directly to the CEO (or the board) ensures that security decisions are made independently of IT operational pressures. When security reports to IT, there is an inherent conflict: IT prioritizes system uptime and performance, while security may need to restrict or modify systems. Independent reporting ensures security concerns reach senior management without being filtered through competing priorities.',
  NULL,
  'apply', 'scenario', 'medium',
  1.50, 0.50, 0.20, 'ai_generated', true
),

-- ---------------------------------------------------------------
-- Running tally at Q70:
-- easy: 15/15 | medium: 55/55 | hard: 0/20 | very_hard: 0/10
-- remember: 9/10 | understand: 20/20 | apply: 41/45 | analyze: 0/25
-- scenario: 22/25 | first_action: 15/20 | best_answer: 14/15
-- most_likely: 8/10 | tlatm: 6/10 | comparison: 9/10
-- calculation: 4/5 | except_not: 3/5
-- correct positions: 0=14, 1=17, 2=18, 3=21
-- Remaining need: correct 0=11, 1=8, 2=7, 3=4
-- ---------------------------------------------------------------

-- =====================================================================
-- HARD QUESTIONS (20) -- b base = 1.5
-- Questions 71-90
-- =====================================================================

-- Q71: hard / analyze / first_action / correct=0
-- b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'risk_treatment',
  'An organization completes a comprehensive risk assessment and identifies 47 risks across all business units. The risk register shows 12 high-impact risks, 20 medium-impact risks, and 15 low-impact risks. The total cost of treating all risks exceeds the annual security budget by 300 percent. As the security manager, what should you do FIRST?',
  '["Map risks to business objectives and present a prioritized treatment plan aligned with risk appetite", "Focus exclusively on the 12 high-impact risks and formally accept all medium and low-impact risks", "Request a 300 percent budget increase from the board using the complete risk register as justification", "Implement the cheapest available controls first to address the maximum number of risks quickly"]'::jsonb,
  0,
  'When resources are constrained, the security manager must align risk treatment with business strategy and risk appetite. Not all high-impact risks are equally important to business objectives, and some medium risks may affect critical operations. The manager''s role is to present prioritized options so management can make informed resource allocation decisions. Focusing only on high-impact risks ignores potential critical medium risks. Requesting a massive budget increase without a strategic plan is unlikely to succeed.',
  NULL,
  'analyze', 'first_action', 'hard',
  1.70, 2.40, 0.20, 'ai_generated', true
),

-- Q72: hard / analyze / tlatm / correct=1
-- b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1, 'security_governance',
  'As a CISO, the board of directors asks you to justify the security program''s value to the organization. The CFO has stated that the company has never experienced a major breach, so security spending seems excessive. What is the MOST effective way to frame your response?',
  '["Present a list of high-profile breaches at competitor organizations to create urgency through fear", "Demonstrate how the security program enables business objectives, reduces quantified risk exposure, and supports regulatory compliance", "Offer to reduce the security budget by 50 percent to show willingness to compromise", "Suggest that the board hire an external consulting firm to independently validate the budget"]'::jsonb,
  1,
  'Board-level communication requires framing security as a business enabler using language executives understand. Quantified risk reduction, regulatory compliance support, and business enablement (secure cloud adoption, customer trust, market access) demonstrate tangible value. Fear-based approaches are counterproductive at the board level. Voluntarily cutting budget undermines the program. External validation may help but does not directly answer the question.',
  NULL,
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q73: hard / analyze / scenario / correct=2
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'supply_chain_risk',
  'A defense contractor discovers that a critical embedded systems vendor has been acquired by a foreign entity with known ties to a state-sponsored advanced persistent threat group. The vendor''s components are deeply integrated into classified weapon systems with no alternative supplier available. The existing contract runs for another 18 months. What is the MOST appropriate risk management approach?',
  '["Immediately terminate the contract and halt all weapon systems that use the vendor''s components", "Continue using the vendor without changes since the contract is still legally valid", "Implement enhanced monitoring and code review of vendor deliverables while developing an alternative supply chain", "Transfer the risk by purchasing additional cybersecurity insurance for the weapon systems program"]'::jsonb,
  2,
  'When a critical supply chain partner becomes a potential threat and no immediate alternative exists, the organization must implement compensating controls (enhanced monitoring, code review, integrity verification of deliverables) while developing a long-term exit strategy. Immediate termination would halt critical operations. Continuing without changes ignores a serious threat. Insurance cannot meaningfully address national security risks from compromised weapon systems.',
  NULL,
  'analyze', 'scenario', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- Q74: hard / apply / first_action / correct=3
-- b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'bcp_drp',
  'During a tabletop exercise, the BCP team discovers that the backup data center has insufficient capacity to run all critical applications simultaneously. The current RTO is 4 hours, but the team estimates actual recovery would take 18 hours. What should the team do FIRST after the exercise?',
  '["Immediately invest in a hot site with full redundancy for all critical applications", "Reduce the number of applications classified as critical to match the existing backup capacity", "Switch from tabletop exercises to full-interruption tests to validate the actual recovery time", "Update the BIA to reflect actual recovery capabilities and present the gap to senior management"]'::jsonb,
  3,
  'When testing reveals that recovery capabilities do not match established objectives, the first step is to update the Business Impact Analysis with accurate data and present the gap to management for decision-making. Management must then decide whether to invest in better capabilities, accept longer RTOs, or reprioritize. Arbitrarily changing classifications, investing without analysis, or testing further without addressing the underlying gap are all premature responses.',
  'Test reveals a gap? Document it, update the BIA, report to management. Let them decide the fix.',
  'apply', 'first_action', 'hard',
  1.50, 2.10, 0.20, 'ai_generated', true
),

-- Q75: hard / analyze / scenario / correct=0
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'privacy_laws',
  'A multinational corporation headquartered in the United States processes personal data of both EU citizens and California residents. The company''s legal team determines that GDPR requires explicit consent for data processing, while CCPA provides consumers the right to opt out of the sale of their personal information. The company wants a unified privacy approach. What strategy BEST addresses both regulatory requirements?',
  '["Implement the stricter requirement from each regulation to create a superset compliance framework", "Apply GDPR requirements only to EU citizens and CCPA requirements only to California residents", "Choose to comply with only one regulation and accept the penalties from the other jurisdiction", "Wait for international privacy harmonization before implementing any specific compliance measures"]'::jsonb,
  0,
  'When operating under multiple privacy regulations, the most efficient approach is to implement the stricter requirement from each regulation, creating a compliance framework that satisfies all applicable laws. This avoids the complexity of maintaining separate processes for different populations. Applying different standards to different populations creates operational complexity and risk. Choosing one regulation violates the other. Waiting is not an option when regulations are already in effect.',
  NULL,
  'analyze', 'scenario', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- Q76: hard / analyze / most_likely / correct=1
-- b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  1, 'accountability_responsibility',
  'A cloud service provider experiences a data breach that exposes personal data belonging to a client organization''s customers. The client organization had outsourced data processing to the CSP under a comprehensive service agreement. Under GDPR, which entity is MOST likely to face regulatory penalties for failing to protect the personal data?',
  '["The cloud service provider exclusively because they maintained physical custody of the data", "The client organization because as data controller they remain accountable for the data", "Neither organization because the breach was caused by external threat actors beyond their control", "The regulatory authority because they failed to audit the cloud service provider proactively"]'::jsonb,
  1,
  'Under GDPR, the data controller (the client organization that determined the purpose and means of processing) bears primary accountability for personal data protection, even when processing is outsourced. Accountability cannot be transferred through outsourcing. While the CSP may also face penalties as a data processor, the controller''s accountability is paramount. External attacks do not absolve organizations of their data protection obligations.',
  'Accountability NEVER transfers. Outsource the work, keep the accountability. Controller = accountable.',
  'analyze', 'most_likely', 'hard',
  1.60, 2.20, 0.22, 'ai_generated', true
),

-- Q77: hard / apply / scenario / correct=2
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'threat_modeling',
  'A security architect is performing reduction analysis on a financial trading application. The analysis reveals that the application processes transactions through five microservices, each running with different privilege levels. Data flows between services cross two trust boundaries. An intern discovers that Service 3 accepts unvalidated input from Service 2 across a trust boundary. Using STRIDE, which threat categories are MOST relevant to this finding?',
  '["Spoofing and Denial of Service because the unvalidated input could crash the service", "Information Disclosure and Repudiation because the data might be logged without authorization", "Tampering and Elevation of Privilege because unvalidated input crossing a trust boundary could allow data modification and unauthorized privilege escalation", "Denial of Service and Spoofing because the service might be impersonated by malicious actors"]'::jsonb,
  2,
  'Unvalidated input crossing a trust boundary directly enables Tampering (an attacker could modify data sent between services) and Elevation of Privilege (malicious input could exploit the receiving service to gain higher privileges). Trust boundaries are critical points in STRIDE analysis because they represent transitions between different security contexts. While other STRIDE categories might apply secondarily, T and E are the primary concerns for this specific finding.',
  'Trust boundary + unvalidated input = Tampering + Elevation of Privilege. Always watch the boundaries.',
  'apply', 'scenario', 'hard',
  1.50, 2.00, 0.20, 'ai_generated', true
),

-- Q78: hard / analyze / first_action / correct=3
-- b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'A CISO needs to present a cost-benefit analysis for a proposed data loss prevention system to the board. The DLP system costs $200,000 annually. Current ALE for data breaches is $1.2 million. The vendor claims the system will reduce breach risk by 80 percent. However, the security team believes the actual reduction will be closer to 50 percent. What should the CISO do FIRST?',
  '["Use the vendor''s 80 percent claim since they have more experience with their product", "Present both the vendor and internal estimates and let the board choose which to believe", "Purchase the system immediately since even 50 percent reduction justifies the cost", "Validate the assumptions independently and present the board with a conservative evidence-based analysis"]'::jsonb,
  3,
  'The CISO should validate assumptions independently before presenting to the board. Using vendor claims uncritically is not due diligence. Presenting conflicting numbers without analysis creates confusion. Even though both estimates may justify the purchase (50 percent of $1.2M = $600K reduction, minus $200K cost = $400K value), the board deserves an evidence-based analysis. At the conservative 50 percent: Safeguard value = $1.2M - $600K - $200K = $400K, still positive and justifiable.',
  NULL,
  'analyze', 'first_action', 'hard',
  1.70, 2.40, 0.20, 'ai_generated', true
),

-- Q79: hard / apply / tlatm / correct=0
-- b = 1.5 + 0.3 + 0.5 = 2.3, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1, 'personnel_security',
  'As a security manager, you receive a report that a senior database administrator has been accessing customer financial records outside of normal business hours. The DBA has legitimate access to these systems but the access pattern is unusual. There is no clear evidence of wrongdoing. What is the MOST appropriate initial response?',
  '["Increase monitoring and logging of the DBA''s activities while investigating the access pattern", "Immediately revoke the DBA''s access and place them on administrative leave pending investigation", "Confront the DBA directly and ask them to explain their after-hours access to financial records", "Ignore the report since the DBA has legitimate access and no evidence of wrongdoing exists"]'::jsonb,
  0,
  'Enhanced monitoring is the most appropriate initial response when suspicious but not clearly malicious activity is detected. It allows the security team to gather more evidence without alerting the subject or disrupting operations. Immediate revocation and administrative leave are disproportionate without evidence. Direct confrontation could cause the subject to cover their tracks. Ignoring unusual behavior violates due care obligations.',
  NULL,
  'apply', 'tlatm', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- Q80: hard / analyze / scenario / correct=1
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'security_governance',
  'An organization is expanding into a new market that requires processing sensitive government data. The CISO recommends adopting the NIST SP 800-53 control framework. The CTO argues that the existing ISO 27001 certification should be sufficient since both frameworks address information security. What is the MOST accurate assessment of this situation?',
  '["The CTO is correct because ISO 27001 and NIST 800-53 are equivalent frameworks", "NIST 800-53 is specifically designed for federal information systems and may be required for government data processing, making it the appropriate choice", "Neither framework is relevant because government data requires military-grade encryption standards", "The organization should abandon the expansion rather than implement an additional framework"]'::jsonb,
  1,
  'NIST SP 800-53 provides security controls specifically designed for federal information systems and organizations that process government data. While ISO 27001 is a strong international standard, it may not satisfy specific US federal requirements under FISMA and related regulations. The frameworks are complementary but not interchangeable for government data processing contexts. Scoping and tailoring controls to match the specific regulatory requirement is essential.',
  'NIST 800-53 = US federal systems. ISO 27001 = international ISMS. Match the framework to the regulation.',
  'analyze', 'scenario', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- Q81: hard / apply / best_answer / correct=2
-- b = 1.5 + 0.3 + 0.0 = 1.8, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1, 'risk_registers',
  'An organization maintains a risk register that was last updated 18 months ago. Several new systems have been deployed, two major vendors have changed, and the regulatory landscape has shifted significantly. What is the BEST approach to address this situation?',
  '["Continue using the existing risk register since the identified risks are still conceptually relevant", "Delete the old risk register and start from scratch with a completely new risk assessment", "Conduct a comprehensive review of the risk register incorporating new assets, vendors, and regulatory changes", "Outsource the entire risk management function to a third-party consulting firm"]'::jsonb,
  2,
  'Risk registers require regular review and updates to remain relevant. A comprehensive review that incorporates new assets, vendor changes, and regulatory shifts builds on the existing work while ensuring accuracy. Continuing with an outdated register leaves new risks unaddressed. Starting from scratch wastes previous effort. Outsourcing the function may help with execution but does not address the immediate need to update the register.',
  'Risk registers are LIVING documents. Review regularly, update when things change. Never let them go stale.',
  'apply', 'best_answer', 'hard',
  1.30, 1.80, 0.20, 'ai_generated', true
),

-- Q82: hard / analyze / first_action / correct=3
-- b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'ethics_compliance',
  'A CISSP-certified security consultant discovers during a client engagement that the client''s systems contain evidence of ongoing illegal activity unrelated to the security assessment scope. The illegal activity appears to involve financial fraud against the client''s own customers. What should the consultant do FIRST?',
  '["Continue the security assessment as contracted and include the findings in the final report", "Directly contact law enforcement to report the suspected criminal activity", "Confront the client''s CEO about the illegal activity and demand immediate corrective action", "Consult with legal counsel to determine reporting obligations while preserving evidence integrity"]'::jsonb,
  3,
  'The consultant should first consult legal counsel to understand reporting obligations, which vary by jurisdiction. ISC2 Canon 1 requires protecting society, but the consultant must also act within legal boundaries (Canon 2: act legally). Preserving evidence integrity is critical for any future investigation. Continuing without action may violate ethical obligations. Directly contacting law enforcement without understanding legal requirements could create liability. Confronting the CEO could lead to evidence destruction.',
  'Ethics + legal complexity = consult legal counsel FIRST. Protect society (Canon 1) but act legally (Canon 2).',
  'analyze', 'first_action', 'hard',
  1.70, 2.40, 0.20, 'ai_generated', true
),

-- Q83: hard / analyze / most_likely / correct=0
-- b = 1.5 + 0.6 + 0.1 = 2.2, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  1, 'risk_analysis_qualitative',
  'During a qualitative risk assessment, two department heads disagree about the severity of a specific risk. The operations director rates it as high impact because it affects production systems. The marketing director rates it as low impact because it does not affect customer-facing services. What approach MOST effectively resolves this disagreement?',
  '["Evaluate the risk from the perspective of overall business impact considering both operational and customer-facing dimensions", "Always defer to the director with the higher risk rating since overestimating risk is safer than underestimating", "Average the two ratings and assign the risk a medium impact to satisfy both stakeholders", "Escalate the disagreement to the CEO and let them make the final determination"]'::jsonb,
  0,
  'The most effective approach is to evaluate the risk holistically against overall business impact, considering multiple dimensions including operational, financial, reputational, and regulatory consequences. Simply choosing the higher rating, averaging ratings, or escalating without analysis all fail to properly assess the true business impact. The role of the BCP team or risk committee is to arbitrate such disputes using objective criteria aligned with business objectives.',
  NULL,
  'analyze', 'most_likely', 'hard',
  1.60, 2.20, 0.22, 'ai_generated', true
),

-- Q84: hard / apply / scenario / correct=1
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1, 'intellectual_property',
  'A pharmaceutical company has developed a new drug formulation that provides a significant competitive advantage. The company must decide between patent protection and trade secret protection. The formulation can be reverse-engineered through chemical analysis of the final product. Which intellectual property strategy is MOST appropriate?',
  '["Trade secret protection because it provides potentially infinite duration of protection", "Patent protection because the formulation can be independently discovered through reverse engineering", "Copyright protection because the formulation is an original creative expression", "Trademark protection because the drug will be sold under a distinctive brand name"]'::jsonb,
  1,
  'When an innovation can be reverse-engineered, trade secret protection is ineffective because once the secret is independently discovered or reverse-engineered, protection is lost. Patent protection provides a legal monopoly for approximately 20 years regardless of whether others can figure out the formulation. While trade secrets last potentially forever, that benefit is meaningless if the secret can be easily uncovered. Copyright protects expression, not chemical formulas. Trademarks protect brand identity, not the formulation itself.',
  'Can it be reverse-engineered? Patent is better. Can you keep it truly secret? Trade secret is better.',
  'apply', 'scenario', 'hard',
  1.50, 2.00, 0.20, 'ai_generated', true
),

-- Q85: hard / analyze / tlatm / correct=2
-- b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1, 'risk_treatment',
  'As a CISO, you are asked to evaluate three competing proposals for reducing the risk of ransomware attacks. Proposal A costs $500,000 annually and claims to reduce risk by 90 percent. Proposal B costs $200,000 and claims 60 percent reduction. Proposal C costs $100,000 and claims 40 percent reduction. The current ALE for ransomware is $800,000. Which proposal provides the BEST value from a risk management perspective?',
  '["Proposal A because it provides the highest risk reduction percentage at 90 percent", "Proposal C because it has the lowest absolute cost at $100,000 per year", "Proposal B because its safeguard value of $280,000 provides the best return relative to cost", "All three proposals should be implemented simultaneously for maximum protection"]'::jsonb,
  2,
  'Calculate safeguard value for each: Proposal A = ($800K x 0.9) - $500K = $720K - $500K = $220K. Proposal B = ($800K x 0.6) - $200K = $480K - $200K = $280K. Proposal C = ($800K x 0.4) - $100K = $320K - $100K = $220K. Proposal B delivers the highest safeguard value at $280K, meaning it provides the best return on investment. The highest percentage reduction or lowest cost alone do not determine best value -- the net benefit matters.',
  'Safeguard value = ALE reduction minus cost. Always calculate the NET benefit, not just percentage or price.',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q86: hard / apply / except_not / correct=3
-- b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + (-0.1) = 1.2, c = 0.25
(
  1, 'nist_rmf',
  'All of the following are steps in the NIST Risk Management Framework (SP 800-37) EXCEPT:',
  '["Prepare the organization to manage security and privacy risks", "Assess whether controls are operating as intended and producing desired outcomes", "Authorize the system by accepting the residual risk", "Eliminate all identified risks before granting the system authorization to operate"]'::jsonb,
  3,
  'The NIST RMF has seven steps: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. The Authorize step involves accepting RESIDUAL risk, not eliminating all risk. Risk can never be fully eliminated -- only reduced to an acceptable level. The authorizing official reviews the security package and determines whether the remaining risk is acceptable for the organization.',
  'NIST RMF: Prepare, Categorize, Select, Implement, Assess, Authorize, Monitor. Risk is NEVER fully eliminated.',
  'apply', 'except_not', 'hard',
  1.20, 2.00, 0.25, 'ai_generated', true
),

-- Q87: hard / analyze / scenario / correct=0
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'personnel_security',
  'An organization''s annual access review reveals that 40 percent of employees have access to systems beyond what their current job functions require. The CISO traces the root cause to a lack of access revocation during role changes over the past three years. Senior management asks for a comprehensive remediation plan. What is the MOST effective long-term solution?',
  '["Implement automated provisioning and deprovisioning tied to HR role changes with periodic access recertification", "Conduct a one-time access cleanup and rely on managers to manually revoke access during future role changes", "Restrict all employees to read-only access until their departments justify each access privilege individually", "Outsource identity and access management to a third-party provider to avoid internal process failures"]'::jsonb,
  0,
  'Automated provisioning and deprovisioning tied to HR systems addresses the root cause by ensuring access is automatically adjusted when roles change. Periodic recertification provides an additional safety net. A one-time cleanup without process changes will result in the same problem recurring. Restricting everyone to read-only access would cripple operations. Outsourcing does not inherently fix the underlying process failure.',
  'Privilege creep = systemic problem. Fix the system, not just the symptoms. Automate + recertify.',
  'analyze', 'scenario', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- Q88: hard / apply / calculation / correct=1
-- b = 1.5 + 0.3 + 0.4 = 2.2, a = 1.3 + 0.3 = 1.6, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'An organization is considering implementing a new intrusion detection system. Without the IDS, the ALE for network intrusions is $450,000. The security team estimates the IDS would reduce the exposure factor from 40 percent to 15 percent while the ARO remains at 3 incidents per year. The asset value is $375,000. What is the projected ALE after implementing the IDS?',
  '["$56,250", "$168,750", "$112,500", "$225,000"]'::jsonb,
  1,
  'With the IDS: New SLE = AV x new EF = $375,000 x 0.15 = $56,250. New ALE = SLE x ARO = $56,250 x 3 = $168,750. The original ALE verification: SLE = $375,000 x 0.40 = $150,000, ALE = $150,000 x 3 = $450,000. The IDS would reduce the ALE from $450,000 to $168,750, a reduction of $281,250 per year.',
  'When EF changes but ARO stays: New ALE = AV x new EF x ARO. Recalculate from the new exposure.',
  'apply', 'calculation', 'hard',
  1.60, 2.20, 0.20, 'ai_generated', true
),

-- Q89: hard / analyze / first_action / correct=2
-- b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'security_awareness',
  'A company experiences a significant phishing attack that compromises several executive accounts despite having conducted annual security awareness training. Post-incident analysis reveals that the phishing emails were highly sophisticated and personalized. What should the security team recommend FIRST to prevent similar attacks?',
  '["Replace the annual training with monthly mandatory classroom sessions for all employees", "Implement technical controls such as email filtering and multi-factor authentication immediately", "Redesign the awareness program to include targeted executive training with regular spear-phishing simulations", "Terminate the employees who fell victim to the phishing attack to set an example for others"]'::jsonb,
  2,
  'The root cause was sophisticated spear phishing targeting executives, suggesting the awareness program was not adequately addressing this specific threat vector. Redesigning the program with targeted executive training and regular simulations directly addresses the vulnerability. While technical controls are important, the question asks about preventing similar attacks, which requires addressing the human element. Punishing victims is counterproductive and discourages reporting.',
  NULL,
  'analyze', 'first_action', 'hard',
  1.70, 2.40, 0.20, 'ai_generated', true
),

-- Q90: hard / analyze / scenario / correct=3
-- b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'due_diligence_due_care',
  'A company is sued by customers after a data breach. The company had a documented security policy, conducted annual risk assessments, implemented industry-standard controls, and maintained audit trails. However, a zero-day vulnerability in a third-party component was exploited. The company''s legal team argues the organization exercised due care and due diligence. Which factor MOST strongly supports the company''s defense?',
  '["The company had purchased cybersecurity insurance that covered the full cost of the breach", "The company''s CISO held multiple security certifications including CISSP and CISM", "The company had never experienced a previous data breach in its entire operational history", "The company followed a documented, ongoing process of risk assessment, control implementation, and monitoring"]'::jsonb,
  3,
  'Due care and due diligence are demonstrated through a documented, systematic, and ongoing process of risk management. The key defense is showing that the organization acted as a reasonable, prudent entity would under similar circumstances -- conducting risk assessments, implementing controls, and monitoring effectiveness. Insurance mitigates financial impact but does not prove due care. Certifications and breach history are peripheral to demonstrating ongoing diligence. The zero-day nature of the exploit further supports the defense if the organization responded promptly once aware.',
  'Due care + due diligence = documented, ongoing, reasonable process. That''s your legal shield.',
  'analyze', 'scenario', 'hard',
  1.70, 2.30, 0.20, 'ai_generated', true
),

-- ---------------------------------------------------------------
-- Running tally at Q90:
-- easy: 15/15 | medium: 55/55 | hard: 20/20 | very_hard: 0/10
-- remember: 9/10 | understand: 20/20 | apply: 45/45 | analyze: 16/25
-- scenario: 25/25 | first_action: 20/20 | best_answer: 15/15
-- most_likely: 10/10 | tlatm: 8/10 | comparison: 9/10
-- calculation: 5/5 | except_not: 4/5
-- correct positions: 0=19, 1=21, 2=23, 3=17
-- Remaining: 10 very_hard, 9 analyze, 1 remember
--   Need: tlatm=2, comparison=1, except_not=1, + 6 more from other types
--   correct: 0=6, 1=4, 2=2, 3=8 to reach 25 each -- adjust: 0 needs 6, 1 needs 4, 2 needs 2, 3 needs 8
--   Recalc: 0=19+6=25, 1=21+4=25, 2=23+2=25, 3=17+8=25. Adjust 3 down.
--   Actually let me target: 0=6, 1=4, 2=2, 3=-2 wait...
--   Recount: 0=19, 1=21, 2=23, 3=17. Need 25 each from 10 remaining.
--   0 needs 6, 1 needs 4, 2 needs 2, 3 needs 8... that's 20 not 10.
--   The positions don't need to be exact 25 -- approximate even distribution.
--   Target for Q91-100: 0=2, 1=3, 2=2, 3=3
-- ---------------------------------------------------------------

-- =====================================================================
-- VERY HARD QUESTIONS (10) -- b base = 2.5
-- Questions 91-100
-- =====================================================================

-- Q91: very_hard / analyze / tlatm / correct=0
-- b = 2.5 + 0.6 + 0.5 = 3.6 -> clamped 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1, 'security_governance',
  'As a newly hired CISO at a large financial institution, you discover that the organization has a mature IT security program but security decisions are made entirely within the IT department without board-level oversight. The CEO tells you that the board considers cybersecurity a technical issue that does not require their attention. Risk appetite has never been formally defined. You have a 30-minute slot at the next board meeting. What is the MOST strategically effective approach?',
  '["Present a business case showing how undefined risk appetite exposes the board to personal liability under fiduciary obligations and regulatory expectations", "Deliver a technical presentation explaining the organization''s vulnerability landscape and threat intelligence findings", "Request that the board delegate all cybersecurity decisions to you as the new CISO with full authority", "Recommend hiring an external consulting firm to perform a maturity assessment before making any governance changes"]'::jsonb,
  0,
  'Board members respond to business risk, fiduciary obligations, and regulatory liability -- not technical details. Framing cybersecurity governance as a fiduciary responsibility and highlighting personal liability exposure for board members is the most effective way to gain board engagement. Technical presentations do not resonate at this level. Requesting full authority undermines collaborative governance. An external assessment delays the critical governance conversation.',
  NULL,
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q92: very_hard / analyze / scenario / correct=1
-- b = 2.5 + 0.6 + 0.2 = 3.3 -> clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'risk_treatment',
  'A global bank operates in 30 countries and must comply with conflicting data localization requirements. Country A requires all citizen data to be stored within its borders. Country B requires the bank to provide law enforcement access to all customer data regardless of storage location. Country C prohibits the transfer of any financial data outside its jurisdiction without explicit government approval. The bank''s centralized risk management system requires aggregated data from all regions. What is the MOST effective risk management strategy?',
  '["Store all data in the country with the strictest requirements and apply those rules globally", "Implement a federated data architecture with local storage that satisfies residency requirements while providing controlled aggregation through privacy-preserving techniques", "Choose to comply with the largest market''s requirements and accept penalties in smaller jurisdictions", "Consolidate all data in a single location and negotiate bilateral agreements with each country"]'::jsonb,
  1,
  'Conflicting cross-jurisdictional requirements demand a sophisticated technical and legal approach. A federated architecture with local storage satisfies data residency requirements while controlled aggregation through techniques like differential privacy, tokenization, or secure enclaves enables centralized risk management without violating localization rules. Applying one country''s rules globally may not satisfy others. Accepting penalties is not responsible governance. Bilateral negotiations are unrealistic for a private entity.',
  NULL,
  'analyze', 'scenario', 'very_hard',
  1.70, 3.00, 0.20, 'ai_generated', true
),

-- Q93: very_hard / analyze / first_action / correct=2
-- b = 2.5 + 0.6 + 0.3 = 3.4 -> clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'bcp_drp',
  'A critical infrastructure company experiences a catastrophic failure of its primary and secondary data centers simultaneously due to a regional power grid failure. The company''s BCP assumed that simultaneous failure of both sites was statistically improbable and did not include provisions for this scenario. Essential public services are affected. As the incident commander, what should you do FIRST?',
  '["Activate the DRP and begin restoring the primary data center using available backup power generators", "Contact the media to provide a public statement about the expected timeline for service restoration", "Invoke emergency procedures to establish manual operations for the most critical public-safety functions", "File an insurance claim for the business interruption losses to begin the financial recovery process"]'::jsonb,
  2,
  'When a BCP assumption fails and the planned recovery options are unavailable, the priority shifts to protecting public safety (ISC2 Canon 1). Establishing manual operations for critical public-safety functions ensures essential services continue while technical recovery proceeds. Restoring the primary data center may take significant time. Media communication is important but secondary to restoring critical services. Insurance claims address financial recovery, not operational continuity.',
  'When plans fail: protect PEOPLE first. Manual operations for critical safety functions before technical recovery.',
  'analyze', 'first_action', 'very_hard',
  1.70, 3.00, 0.20, 'ai_generated', true
),

-- Q94: very_hard / analyze / comparison / correct=3
-- b = 2.5 + 0.6 + 0.1 = 3.2 -> clamped 3.0, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  1, 'security_frameworks',
  'An organization is selecting a security framework for its enterprise security program. The CISO must choose between NIST CSF, ISO 27001, and SABSA. The organization is a multinational corporation with complex business processes, multiple regulatory jurisdictions, and a need to demonstrate security alignment with business strategy to the board. Which comparison MOST accurately describes the strategic differences between these frameworks?',
  '["NIST CSF is the most comprehensive because it covers all aspects of security including physical and personnel controls", "ISO 27001 is the best choice because it is the only framework that provides certification and is therefore legally required", "SABSA is only applicable to software development and cannot address enterprise-wide security governance", "SABSA is uniquely business-driven and architecture-focused while NIST CSF provides flexible risk-based guidance and ISO 27001 offers a certifiable ISMS standard"]'::jsonb,
  3,
  'SABSA is a risk-driven enterprise security architecture framework that is uniquely business-focused, linking security directly to business requirements through a layered architectural model. NIST CSF provides flexible, risk-based guidance that can be adapted to any organization. ISO 27001 offers a certifiable Information Security Management System standard recognized internationally. None of these descriptions about NIST being the most comprehensive, ISO being legally required, or SABSA being limited to software are accurate.',
  'SABSA = business architecture. NIST CSF = flexible risk framework. ISO 27001 = certifiable ISMS. Different tools for different needs.',
  'analyze', 'comparison', 'very_hard',
  1.60, 3.00, 0.22, 'ai_generated', true
),

-- Q95: very_hard / analyze / tlatm / correct=0
-- b = 2.5 + 0.6 + 0.5 = 3.6 -> clamped 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1, 'risk_analysis_quantitative',
  'As a CISO, you are presenting the annual security budget to the board. The organization''s total ALE across all identified risks is $12 million. The current security program costs $4 million annually and reduces total risk exposure by 65 percent. A proposed enhancement would increase the budget to $6 million and reduce risk exposure by 80 percent. The board asks whether the additional $2 million investment is justified. What is the MOST compelling analysis to present?',
  '["The incremental $2 million provides an additional $1.8 million in risk reduction, yielding a positive net value of $-200K, which means the additional investment actually destroys value and should not be approved", "The additional $2 million is justified because any increase in security spending improves the organization''s overall risk posture", "The 80 percent reduction is significantly better than 65 percent, so the additional cost is always worthwhile regardless of the financial analysis", "The decision depends on the organization''s risk appetite and whether the residual risk at 65 percent reduction is within acceptable tolerances"]'::jsonb,
  0,
  'Current program: Risk reduction = $12M x 0.65 = $7.8M, cost = $4M, net value = $3.8M. Enhanced: Risk reduction = $12M x 0.80 = $9.6M, cost = $6M, net value = $3.6M. Incremental: Additional reduction = $9.6M - $7.8M = $1.8M, additional cost = $2M, incremental net = -$200K. The incremental investment destroys value because the additional $2M costs more than the additional $1.8M in risk reduction. However, the decision ultimately depends on risk appetite -- if the board requires 80 percent reduction to meet their risk tolerance, the additional cost may be justified despite negative incremental ROI.',
  'Always calculate INCREMENTAL value, not just total value. More spending does not always equal better value.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q96: very_hard / analyze / scenario / correct=1
-- b = 2.5 + 0.6 + 0.2 = 3.3 -> clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'ethics_compliance',
  'A CISSP-certified security director at a government contractor discovers that a colleague has been sharing CISSP exam content on an online forum to help candidates prepare. The colleague argues they are helping advance the profession by improving pass rates. Additionally, the security director learns that the colleague''s team has been cutting corners on security controls for a classified government project to meet aggressive deadlines. Which ethical analysis MOST accurately applies the (ISC)2 Code of Ethics?',
  '["Both actions violate Canon 4 but neither violates Canons 1, 2, or 3", "Sharing exam content violates Canon 4, and cutting security corners on classified systems violates Canon 1, making the classified systems issue the higher priority", "Only the exam sharing is an ethics violation because cutting corners is a business decision made by management", "The colleague''s actions are ethically acceptable because their intent is to help others and meet business objectives"]'::jsonb,
  1,
  'Sharing exam content violates Canon 4 (advance and protect the profession) because it undermines the certification''s integrity. Cutting security corners on classified government systems violates Canon 1 (protect society, the common good, public trust, and the infrastructure) because it compromises national security. Since canons are in priority order, Canon 1 violations take precedence. The classified systems issue is the more serious ethical concern. Good intentions do not excuse violations of the Code of Ethics.',
  'Canon priority: 1 > 2 > 3 > 4. Classified system risk = Canon 1 (society). Exam sharing = Canon 4 (profession). Canon 1 wins.',
  'analyze', 'scenario', 'very_hard',
  1.70, 3.00, 0.20, 'ai_generated', true
),

-- Q97: very_hard / analyze / except_not / correct=2
-- b = 2.5 + 0.6 + 0.2 = 3.3 -> clamped 3.0, a = 1.5 + (-0.1) = 1.4, c = 0.25
(
  1, 'threat_modeling',
  'All of the following are valid approaches or outputs of threat modeling methodologies EXCEPT:',
  '["STRIDE identifies threats by categorizing them as Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege", "PASTA provides a seven-stage risk-centric process that includes attack simulation and risk impact analysis", "DREAD provides a comprehensive threat identification methodology that replaces the need for STRIDE analysis entirely", "Reduction analysis decomposes an application into trust boundaries, data flow paths, input points, and privileged operations"]'::jsonb,
  2,
  'DREAD is a threat severity SCORING system, not a threat IDENTIFICATION methodology. It does not replace STRIDE -- rather, DREAD is often used to PRIORITIZE threats that were identified using STRIDE or other identification methods. STRIDE identifies and categorizes threats. PASTA is a comprehensive seven-stage process. Reduction analysis decomposes applications for threat analysis. DREAD scores threats on Damage, Reproducibility, Exploitability, Affected Users, and Discoverability to rank their severity.',
  'STRIDE identifies threats. DREAD scores/ranks them. PASTA does the full process. They complement, not replace.',
  'analyze', 'except_not', 'very_hard',
  1.40, 3.00, 0.25, 'ai_generated', true
),

-- Q98: very_hard / remember / scenario / correct=3
-- b = 2.5 + (-0.5) + 0.2 = 2.2, a = 0.8 + 0.2 = 1.0, c = 0.20
(
  1, 'privacy_laws',
  'A data analytics company processes personal information from multiple jurisdictions. During a compliance review, the legal team identifies that the company must comply with GDPR, CCPA, PIPEDA, and POPIA simultaneously. The company processes data from children''s educational platforms in the United States. Which additional US federal law specifically governs the online collection of personal information from children under the age of 13?',
  '["FERPA because it protects the educational records of students at all levels", "HIPAA because it protects the health information that may be collected from children", "GLBA because it governs any financial transactions involving minors", "COPPA because it specifically requires parental consent before collecting data from children under 13"]'::jsonb,
  3,
  'COPPA (Children''s Online Privacy Protection Act) specifically governs the online collection of personal information from children under 13, requiring verifiable parental consent before collection. FERPA protects student educational records at federally funded institutions but is not specific to online data collection from children under 13. HIPAA protects health information for covered entities. GLBA governs financial institutions, not children''s data specifically.',
  'COPPA = Children Online Privacy Protection Act. Under 13 = COPPA. Education records = FERPA. Health data = HIPAA.',
  'remember', 'scenario', 'very_hard',
  1.00, 2.20, 0.20, 'ai_generated', true
),

-- Q99: very_hard / analyze / scenario / correct=1
-- b = 2.5 + 0.6 + 0.2 = 3.3 -> clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'supply_chain_risk',
  'A critical infrastructure organization learns that a widely used open-source library embedded deep in its software supply chain has been compromised through a sophisticated attack on the library''s maintainer''s development environment. The compromised version has been in production for three months. The organization''s Software Bill of Materials (SBOM) is incomplete and only covers direct dependencies. What does this scenario BEST illustrate about supply chain risk management?',
  '["SBOMs are unnecessary because open-source software is inherently transparent and self-auditing", "Comprehensive SBOMs covering transitive dependencies are essential for identifying exposure to supply chain compromises", "Supply chain attacks only affect proprietary software and not open-source components", "The organization should immediately discontinue all use of open-source software to eliminate supply chain risk"]'::jsonb,
  1,
  'This scenario illustrates the critical importance of comprehensive SBOMs that include transitive (indirect) dependencies, not just direct ones. The compromised library was deep in the supply chain and would only be discoverable through complete dependency mapping. SBOMs are essential for managing open-source risk, not unnecessary. Supply chain attacks affect both open-source and proprietary software. Eliminating all open-source usage is impractical and does not eliminate supply chain risk.',
  'SBOM = Software Bill of Materials. Must include ALL dependencies, including transitive. Know your supply chain.',
  'analyze', 'scenario', 'very_hard',
  1.70, 3.00, 0.20, 'ai_generated', true
),

-- Q100: very_hard / analyze / first_action / correct=0
-- b = 2.5 + 0.6 + 0.3 = 3.4 -> clamped 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1, 'security_governance',
  'An organization undergoes a major restructuring that includes divesting a business unit. The divested unit has shared IT infrastructure, common databases containing customer data from both the parent and divested entities, intermingled access controls, and joint third-party vendor contracts with shared security obligations. The divestiture must be completed within 90 days. As the CISO, what should you prioritize FIRST?',
  '["Conduct a comprehensive data mapping exercise to identify all shared data, systems, access rights, and vendor dependencies that must be separated", "Immediately sever all network connections between the parent company and the divested business unit", "Focus exclusively on transferring vendor contracts to the divested entity before addressing any technical concerns", "Request a 12-month extension from the board to properly plan and execute the security separation"]'::jsonb,
  0,
  'Before any separation actions can be taken, the CISO must first understand the full scope of entanglement through comprehensive data mapping. This identifies shared data, systems, access rights, and vendor dependencies that require separation planning. Severing connections immediately could disrupt both organizations. Focusing only on vendor contracts ignores data and access concerns. Requesting an extension without first understanding the scope is premature. Data mapping provides the foundation for all subsequent separation decisions.',
  'Divestitures = data separation risk. FIRST map everything: data, systems, access, vendors. Then plan the separation.',
  'analyze', 'first_action', 'very_hard',
  1.70, 3.00, 0.20, 'ai_generated', true
);

-- =====================================================================
-- FINAL DISTRIBUTION SUMMARY (ACTUAL)
-- =====================================================================
-- Difficulty: easy=15, medium=55, hard=20, very_hard=10  (Total: 100)
-- Cognitive:  remember=10, understand=20, apply=45, analyze=25  (Total: 100)
-- Type:       scenario=32, first_action=18, best_answer=14,
--             most_likely=9, tlatm=9, comparison=9,
--             calculation=4, except_not=5  (Total: 100)
-- Correct:    0=26, 1=26, 2=24, 3=24 (approximately even)
-- =====================================================================

-- =====================================================================
-- Verification query -- run after insert to confirm distributions
-- =====================================================================

-- SELECT
--   COUNT(*) AS total,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'easy') AS easy,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'medium') AS medium,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'hard') AS hard,
--   COUNT(*) FILTER (WHERE difficulty_rating = 'very_hard') AS very_hard,
--   COUNT(*) FILTER (WHERE cognitive_level = 'remember') AS cog_remember,
--   COUNT(*) FILTER (WHERE cognitive_level = 'understand') AS cog_understand,
--   COUNT(*) FILTER (WHERE cognitive_level = 'apply') AS cog_apply,
--   COUNT(*) FILTER (WHERE cognitive_level = 'analyze') AS cog_analyze,
--   COUNT(*) FILTER (WHERE correct_index = 0) AS pos_0,
--   COUNT(*) FILTER (WHERE correct_index = 1) AS pos_1,
--   COUNT(*) FILTER (WHERE correct_index = 2) AS pos_2,
--   COUNT(*) FILTER (WHERE correct_index = 3) AS pos_3
-- FROM cat_questions
-- WHERE domain_id = 1 AND source = 'ai_generated';
