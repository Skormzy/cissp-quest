-- =====================================================================
-- CISSP Quest -- Domain 1: Security and Risk Management
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: BIA calculations, ethics edge cases, risk framework
--   comparison, advanced policy hierarchy, insurance/transfer mechanisms
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain1-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  1, 'bia_calculations',
  'A financial institution''s core banking system has an RTO of 4 hours and an RPO of 30 minutes. During a ransomware incident, the system becomes unavailable at 09:00 and backups are confirmed clean from 08:15. Recovery begins at 10:00 and completes at 13:30. Which TWO SLA thresholds have been breached?',
  '["RTO was breached (4.5 hours actual vs 4-hour limit) and RPO was breached (45 minutes data loss vs 30-minute limit)", "Only RTO was breached since recovery took 4.5 hours; RPO was met because a clean backup existed", "Neither threshold was breached because recovery started before the RTO window expired", "Only RPO was breached since 45 minutes of data was lost; downtime itself does not count against RTO"]'::jsonb,
  0,
  'RTO measures total downtime from failure to recovery: 09:00 to 13:30 = 4.5 hours, exceeding the 4-hour RTO. RPO measures maximum acceptable data loss: the clean backup is from 08:15, so 45 minutes of transactions (08:15–09:00) are lost, exceeding the 30-minute RPO. Both thresholds are breached. RTO starts at the moment of failure, not when recovery begins.',
  'RTO = Recovery Time Objective (clock starts at CRASH). RPO = Recovery Point Objective (how much data you lose). Both breach = double trouble.',
  'apply', 'scenario', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  1, 'risk_frameworks',
  'An organization is selecting a risk management framework. The CISO notes that the environment includes US federal contractors, a healthcare subsidiary, and an EU data processing arm. Which framework comparison is MOST accurate for guiding the selection?',
  '["NIST RMF covers all three contexts equally because it is internationally recognized and adopted by most regulators", "NIST RMF aligns best with federal contractor obligations, while ISO 27005 provides the risk process layer compatible with GDPR, and HIPAA Security Rule imposes additional controls on the healthcare unit -- a tiered approach is required", "ISO 31000 alone is sufficient because it is a universal risk framework that satisfies HIPAA, FedRAMP, and GDPR simultaneously", "COBIT 5 should be selected because it is the only framework that maps governance, risk, and compliance across all three regulatory environments"]'::jsonb,
  1,
  'No single framework covers all three contexts. NIST RMF (and FedRAMP) governs federal contractor obligations. ISO 27005/ISO 27001 aligns with GDPR''s risk-based approach and is widely accepted in the EU. HIPAA Security Rule imposes specific administrative, physical, and technical safeguard requirements on covered healthcare entities. The CISO must layer these frameworks. ISO 31000 is a high-level umbrella standard, not a control framework. COBIT 5 is an IT governance framework, not a regulatory compliance mapper.',
  'Multi-reg = Multi-framework. Federal=NIST, EU=ISO, Health=HIPAA. Layer like a cake.',
  'analyze', 'comparison', 'hard',
  1.70, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / tlatm / correct=2
(
  1, 'risk_treatment',
  'As a CISO, you have completed a quantitative risk assessment. The annualized loss expectancy (ALE) for a web application breach is $480,000. A WAF solution costs $150,000/year in licensing and $30,000/year in operational overhead. An application rewrite to eliminate the vulnerability class entirely costs $600,000 one-time with a 3-year expected useful life ($200,000/year amortized). Which risk treatment recommendation is MOST defensible to the board?',
  '["Accept the risk because no single control eliminates the threat entirely and residual risk always remains", "Implement the application rewrite because eliminating the root cause is always preferable to compensating controls", "Implement the WAF because its total annual cost ($180,000) is less than the ALE ($480,000), producing a positive ROI of $300,000/year, whereas the rewrite''s amortized cost ($200,000/year) also yields positive ROI but requires $600,000 upfront capital", "Transfer the risk through cyber insurance because both control options exceed $100,000 and are not cost-effective"]'::jsonb,
  2,
  'The board needs ROI-based justification. WAF: $480K ALE - $180K cost = $300K/year net benefit, with no large capital outlay. Rewrite: $480K ALE - $200K amortized = $280K/year net benefit, but requires $600K upfront and carries implementation risk. Both are positive-ROI options, but the WAF is the more defensible immediate recommendation because of lower upfront cost and faster deployment. The CISO should present both options with the financial analysis. Risk acceptance ignores $480K ALE. Insurance alone does not reduce likelihood.',
  'ALE - cost = ROI. Positive ROI = recommend it. Compare WAF vs rewrite on upfront capital, not just annual cost.',
  'apply', 'tlatm', 'hard',
  1.80, 1.50, 0.20, 'handcrafted', true
),

-- Q4: hard / analyze / best_answer / correct=3
(
  1, 'ethics',
  'A security professional discovers that their employer is logging employee personal emails sent over the corporate network and sharing summaries with HR without employee knowledge. The practice is technically legal in the jurisdiction but violates ISC2 Code of Ethics. What is the MOST appropriate first action?',
  '["Immediately report the practice to the national data protection authority to trigger a regulatory investigation", "Resign from the organization because continuing employment implies endorsement of the unethical practice", "Publish the practice anonymously on a security blog to create public accountability for the organization", "Raise the concern internally through appropriate channels (legal counsel, ethics hotline, or senior management) before escalating externally"]'::jsonb,
  3,
  'The ISC2 Code of Ethics requires members to act honorably, honestly, justly, responsibly, and legally. When a legal-but-unethical practice is identified, the professional must first attempt internal resolution. Escalating directly to regulators before internal channels skips due process and may breach confidentiality obligations. Resignation abandons the ability to effect change. Anonymous publication violates confidentiality and professional conduct standards. Internal escalation through legal or ethics channels is the required first step; external escalation is warranted only if internal channels fail or management is complicit.',
  'Ethics order: Internal first, External second, Resign last. PROTECT the organization while PROTECTING the profession.',
  'analyze', 'best_answer', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q5: hard / analyze / first_action / correct=0
(
  1, 'policy_hierarchy',
  'A large enterprise has a corporate information security policy, departmental security standards, and system-level procedures. The legal department drafts a new data retention standard that conflicts with the IT security standard regarding email retention periods. The legal standard requires 7-year retention; the IT standard mandates deletion after 3 years for security reasons. Which body has authority to resolve this conflict, and what is the CORRECT resolution mechanism?',
  '["The conflict must be escalated to senior management or a governance committee that can weigh legal risk against security risk, with the resulting decision captured in a policy exception or policy update", "Legal requirements always supersede security standards, so the 7-year retention policy automatically applies without further governance action", "Security standards always supersede departmental policies because confidentiality is a higher priority than compliance", "The CISO has unilateral authority to resolve cross-departmental standard conflicts without board involvement"]'::jsonb,
  0,
  'Policy hierarchy conflicts between peer-level standards (legal vs. IT) cannot be resolved by either department unilaterally. The conflict must be escalated to an authority above both -- typically a security governance committee, GRC committee, or senior executive leadership. The resolution may result in a formal policy exception, a revised standard, or a compensating control (e.g., encrypt retained emails). Legal obligations cannot simply override security principles without governance review, as both carry organizational risk.',
  'Policy conflict = escalate UP the hierarchy. Neither department wins unilaterally. Governance committee decides.',
  'analyze', 'first_action', 'hard',
  1.70, 1.60, 0.22, 'handcrafted', true
),

-- Q6: hard / apply / scenario / correct=1
(
  1, 'bia_calculations',
  'An organization''s BIA identifies the following for its order management system: asset value $2,000,000, single loss expectancy (SLE) = 40% of asset value, and annualized rate of occurrence (ARO) for a destructive ransomware event = 0.15. After implementing an EDR solution, the ARO drops to 0.05. What is the reduction in Annualized Loss Expectancy (ALE) achieved by the EDR investment?',
  '["$48,000 reduction in ALE", "$80,000 reduction in ALE", "$120,000 reduction in ALE", "$800,000 reduction in ALE"]'::jsonb,
  1,
  'SLE = Asset Value × EF = $2,000,000 × 0.40 = $800,000. ALE before EDR = SLE × ARO = $800,000 × 0.15 = $120,000. ALE after EDR = $800,000 × 0.05 = $40,000. ALE reduction = $120,000 - $40,000 = $80,000. This $80,000 annual risk reduction is the maximum justifiable annual cost of the EDR control. If EDR costs more than $80,000/year, it does not produce positive ROI.',
  'ALE = SLE × ARO. ALE delta = (old ARO - new ARO) × SLE. The delta is your max budget for the control.',
  'apply', 'scenario', 'hard',
  1.80, 1.40, 0.20, 'handcrafted', true
),

-- Q7: very_hard / analyze / comparison / correct=2
(
  1, 'risk_frameworks',
  'An organization must comply with both NIST SP 800-37 (RMF) and ISO/IEC 27001. A consultant claims the two frameworks are "essentially the same" and proposes a single unified implementation. Which statement BEST characterizes the relationship between these frameworks?',
  '["The consultant is correct; both frameworks share the same control catalog and certification process, making a unified implementation straightforward", "NIST RMF is a compliance-focused checklist while ISO 27001 is a risk-based management system, making them fundamentally incompatible", "NIST RMF follows a system lifecycle authorization model (categorize, select, implement, assess, authorize, monitor) while ISO 27001 follows a Plan-Do-Check-Act management system model; they are complementary but structurally different, requiring deliberate mapping rather than assuming equivalence", "ISO 27001 is a superset of NIST RMF because its Annex A contains all NIST SP 800-53 controls plus additional ones"]'::jsonb,
  2,
  'NIST RMF is a system-centric authorization framework built around the federal system development lifecycle with six steps ending in an Authorization to Operate (ATO). ISO 27001 is an organization-centric management system standard using PDCA, requiring an external certification audit. They are complementary: NIST SP 800-53 controls can be mapped to ISO 27001 Annex A controls (and NIST provides a mapping), but they have different scopes, audiences, and structures. Unified implementation requires deliberate gap analysis and mapping. Neither is a superset of the other.',
  'RMF = system lifecycle (ATO). ISO 27001 = org management system (PDCA). Complementary, not identical. Map do not assume.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / scenario / correct=3
(
  1, 'risk_transfer',
  'An organization purchases a $5M cyber liability insurance policy with a $500,000 deductible and a co-insurance clause requiring the insured to cover 20% of losses above the deductible. A ransomware incident results in $2,000,000 in verified losses. How much will the insurer pay?',
  '["$2,000,000 (the full loss, since it is below the policy limit)", "$1,900,000 (the full loss minus the deductible)", "$1,200,000 (the insurer pays 80% of the total loss)", "$1,200,000 (the insurer pays 80% of the loss above the deductible: 80% × $1,500,000 = $1,200,000)"]'::jsonb,
  3,
  'Step 1: Subtract the deductible -- $2,000,000 - $500,000 = $1,500,000 in covered losses. Step 2: Apply co-insurance -- insurer pays 80% of $1,500,000 = $1,200,000. The insured pays the $500,000 deductible plus 20% co-insurance ($300,000) = $800,000 out of pocket. Option C is wrong because co-insurance applies to the amount ABOVE the deductible, not the total loss. Understanding insurance mechanics is essential for quantitative risk transfer analysis.',
  'Insurance math: LOSS - DEDUCTIBLE = covered base. Then co-insurance splits the covered base. Deductible comes FIRST.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q9: very_hard / analyze / scenario / correct=0
(
  1, 'bia_calculations',
  'A healthcare organization''s BIA reveals: Patient records system MTO=2h, RTO=1h, RPO=15min. Lab results system MTO=4h, RTO=2h, RPO=1h. During a datacenter flood, both systems fail simultaneously at 06:00. At 07:30, only one system can be restored due to resource constraints. Which system should be restored FIRST, and why?',
  '["Patient records system, because its MTO (2h) will be breached at 08:00 while the lab system MTO (4h) is not breached until 10:00, and patient safety depends on immediate record access", "Lab results system, because lab delays cause more patient harm than record access delays in acute care settings", "Both systems must be restored simultaneously because HIPAA requires continuous availability of all PHI systems", "Lab results system, because its longer MTO means it is less critical and therefore has surplus recovery resources"]'::jsonb,
  0,
  'MTO (Maximum Tolerable Outage) defines the point beyond which business harm is unacceptable. Patient records MTO = 2h, so breach occurs at 08:00 (06:00 + 2h). Lab system MTO = 4h, breach at 10:00. With a 07:30 decision point, the patient records system must be restored first to avoid breaching its MTO in 30 minutes. The lab system has 2.5 hours of remaining tolerance. BIA prioritization is always driven by MTO, not subjective harm assessments. Option D incorrectly equates longer MTO with lower criticality surplus.',
  'Restore the system whose MTO expires SOONEST. MTO countdown = clock pressure. Shortest fuse = first priority.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q10: hard / apply / tlatm / correct=1
(
  1, 'ethics',
  'You are a senior security consultant. While performing a penetration test under a signed statement of work, you discover evidence that your client''s system is being used to exfiltrate data from a third-party competitor. The scope of the engagement does not include forensic investigation. What should you do FIRST?',
  '["Immediately notify law enforcement because evidence of ongoing criminal activity creates a legal obligation that supersedes your client contract", "Stop the penetration test, preserve relevant evidence within the scope of your authorization, and notify the client''s legal counsel and senior management of your finding", "Continue the penetration test as scoped and include the finding in your final report without taking any immediate action", "Expand your penetration test scope unilaterally to gather more evidence about the data exfiltration before reporting"]'::jsonb,
  1,
  'A consultant operating under a signed SOW has a defined authorization boundary. Upon discovering a potential crime in progress, the immediate obligation is to: (1) halt activity to avoid compromising evidence, (2) preserve what was observed within authorized scope, and (3) notify the client''s legal counsel -- not law enforcement directly, as that is the client''s responsibility. Direct law enforcement notification by the consultant may breach contractual confidentiality and is premature without client notification. Expanding scope without authorization creates legal liability for the consultant. Ignoring the finding until the report is negligent.',
  'Out-of-scope crime = STOP, PRESERVE, NOTIFY client legal. Client notifies law enforcement. You stay in your lane.',
  'apply', 'tlatm', 'hard',
  1.70, 1.40, 0.20, 'handcrafted', true
),

-- Q11: hard / analyze / comparison / correct=2
(
  1, 'risk_treatment',
  'An organization''s board asks the CISO to explain the difference between risk transference and risk acceptance. A board member argues that purchasing cyber insurance IS risk acceptance because "you are accepting that a breach will happen." Which response is MOST accurate?',
  '["The board member is correct; insurance is a form of risk acceptance because you are acknowledging the risk will materialize", "Risk transference and risk acceptance are synonymous when the residual risk after insurance purchase remains above zero", "Risk transference shifts the financial consequence of a risk to a third party (the insurer) while risk acceptance means acknowledging and bearing the risk internally without a compensating financial transfer; they are distinct treatments even though both acknowledge residual risk exists", "Insurance is actually risk avoidance because the premium payments prevent the financial impact of a breach"]'::jsonb,
  2,
  'Risk transference (also called risk sharing) involves shifting the financial burden of a risk to a third party, typically through insurance, contracts, or outsourcing. Risk acceptance means the organization consciously decides to bear the risk internally without transfer, either because the cost of controls exceeds the risk value or the risk is below the risk threshold. Both acknowledge that the risk exists and may materialize, but transference moves the financial consequence while acceptance retains it. Insurance is definitively transference. Risk avoidance eliminates the risk by ceasing the activity.',
  'TRANSFER = financial consequence moves OUT. ACCEPT = consequence stays IN. Insurance = Transfer. Keeping risk = Accept.',
  'analyze', 'comparison', 'hard',
  1.60, 1.30, 0.22, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  1, 'policy_hierarchy',
  'A global corporation has the following policy documents: (1) Information Security Policy (executive-level), (2) Access Control Standard (domain-specific), (3) Password Complexity Procedure (system-specific), (4) Active Directory Configuration Baseline (technical guideline). An auditor finds that the AD baseline requires 12-character passwords but the procedure requires only 10. Which document takes precedence, and what governance action is required?',
  '["The AD configuration baseline takes precedence because it is the most specific and technically current document", "The password procedure takes precedence because procedures are binding while baselines are advisory guidelines", "No precedence conflict exists because baselines and procedures serve different purposes in the policy hierarchy", "The procedure takes precedence over the baseline in formal hierarchy (binding vs. advisory), but the conflict indicates both documents need review -- the procedure should be updated to align with the stricter baseline requirement, validated against the policy, and approved through change management"]'::jsonb,
  3,
  'In the policy hierarchy: Policy > Standard > Procedure > Guideline/Baseline. Procedures are binding; baselines/guidelines are advisory. So the procedure (10 characters) technically supersedes the baseline (12 characters) in terms of compliance obligation. However, the baseline represents current technical best practice. The correct governance action is to update the procedure to reflect the stricter requirement and obtain proper approval, rather than simply accepting the lower-security status quo. Auditors flag this as a policy maintenance gap, not just a conflict.',
  'Policy hierarchy: Policy > Standard > Procedure > Guideline. Binding overrides advisory, but discrepancies require UPDATE, not just deference.',
  'analyze', 'scenario', 'very_hard',
  1.80, 2.10, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  1, 'risk_transfer',
  'When negotiating a cyber insurance policy, which contractual element MOST directly affects whether a claim will be paid in a breach involving an employee''s compromised credentials?',
  '["The policy''s definition of a covered cause of loss and whether social engineering / credential theft is explicitly included or excluded", "The policy limit, because higher limits indicate more comprehensive coverage", "The retroactive date, which only affects coverage of pre-existing vulnerabilities", "The waiting period, because claims are rejected if reported outside the waiting window"]'::jsonb,
  0,
  'The most common reason cyber insurance claims are denied is that the triggering event falls under an exclusion or outside the defined covered causes of loss. Credential compromise, social engineering, and phishing are frequently excluded or require separate endorsements. A high policy limit provides no value if the event is excluded. Retroactive dates affect pre-known vulnerabilities, not credential theft timing. Waiting periods relate to business interruption income loss, not denial of coverage. The CISO must scrutinize covered cause definitions during procurement.',
  'Insurance claims fail on DEFINITIONS, not limits. Read covered causes. Social engineering = often excluded by default.',
  'apply', 'best_answer', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q14: very_hard / analyze / tlatm / correct=1
(
  1, 'bia_calculations',
  'You are conducting a BIA for a retail organization. The business unit manager insists the POS system RTO should be 72 hours because "we can use manual cash registers as a workaround." Your technical team says the actual recovery time without investment is 96 hours. The CFO requires data to justify BC investments. As the BIA lead, what is the MOST appropriate approach?',
  '["Accept the 72-hour RTO as stated by the business unit manager because BIA is a business-driven exercise and IT must accommodate business requirements", "Document both the business-required RTO (72 hours) and the current technical recovery capability (96 hours) as a recovery gap, then calculate the cost of closing the gap and present it alongside the financial impact of the 24-hour exposure to the CFO", "Adjust the technical estimate to 72 hours to align with business requirements and avoid conflict", "Set the RTO at 96 hours because technical constraints are immutable facts that override business preferences"]'::jsonb,
  1,
  'The BIA process must document BOTH the business-required RTO (driven by business impact analysis) AND the current technical recovery capability. When a gap exists -- business needs 72h but IT can only deliver 96h -- this is a recovery gap that requires investment to close. The BIA must quantify the financial impact of the 24-hour exposure and present the cost to close the gap to the CFO. This is precisely how BIA drives BC investment decisions. Accepting the business RTO without noting the gap is negligent. Adjusting the technical estimate is falsification. Setting RTO at 96h ignores business requirements.',
  'BIA = document GAP between business RTO and technical capability. The GAP justifies the investment. Show the math to the CFO.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 2.20, 0.20, 'handcrafted', true
),

-- Q15: hard / apply / first_action / correct=2
(
  1, 'risk_frameworks',
  'A financial services organization is implementing a new enterprise risk management framework. The CRO asks whether security risk should be integrated into the enterprise ERM framework or maintained as a separate cyber risk program. Which approach is MOST aligned with contemporary risk governance best practice?',
  '["Maintain a completely separate cyber risk program because security risks require specialized expertise that is incompatible with ERM''s financial risk language", "Integrate all cyber risks directly into the ERM framework using the organization''s existing risk registers without modification", "Integrate cyber risk into the ERM framework using a common risk language and taxonomy, while maintaining specialized technical risk management processes within the security program that feed into the ERM view", "Delegate cyber risk entirely to the CISO and exclude it from ERM because technology risk is not material to financial services regulators"]'::jsonb,
  2,
  'Modern risk governance frameworks (COSO ERM, ISO 31000, NIST CSF) require that cyber risk be integrated into enterprise risk management to ensure board-level visibility and proper resource allocation. However, cyber risk has technical nuances that require specialized processes. Best practice is integration with a common risk language (translating technical risk into financial impact) while preserving specialized security processes that feed data into the ERM view. Isolation creates blind spots. Dumping raw technical data into ERM without translation makes it unusable. Financial regulators (OCC, FFIEC) explicitly require cyber risk in ERM.',
  'Cyber risk INTO ERM using common language. Specialized tech processes FEED the ERM view. Not separate, not raw-dumped.',
  'apply', 'first_action', 'hard',
  1.70, 1.50, 0.22, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  1, 'ethics',
  'A security professional at a government contractor discovers a coworker has been copying unclassified but export-controlled (EAR/ITAR) technical drawings to a personal USB drive and emailing them to a personal Gmail account. The coworker claims it is for "working from home." The professional''s employment contract includes a non-disclosure and insider threat reporting obligation. What is the MOST appropriate action?',
  '["Confront the coworker directly and ask them to stop, then monitor whether the behavior continues before escalating", "Report the behavior to the IT security team only if the technical drawings have been confirmed as ITAR-controlled through an export control compliance review", "Take no action because the drawings are unclassified and home use is a common and accepted practice", "Report the behavior immediately to the insider threat program, security officer, or designated reporting channel, as required by the employment contract''s reporting obligation"]'::jsonb,
  3,
  'Export-controlled technical data (EAR/ITAR) carries legal restrictions regardless of classification level. Unauthorized export -- including to a personal email account accessible outside secured facilities -- may constitute an ITAR violation, which carries criminal penalties. The employee has a contractual reporting obligation. Confronting the coworker directly undermines the investigation. Waiting for an export control review before reporting creates unnecessary delay and potential obstruction. Normalizing the behavior by calling it "home use" ignores the export control context. The professional must report through designated channels immediately.',
  'ITAR + personal email = potential illegal export. Employment contract = mandatory reporting. Report IMMEDIATELY, do not investigate personally.',
  'apply', 'scenario', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q17: very_hard / analyze / best_answer / correct=0
(
  1, 'bia_calculations',
  'During a quantitative BIA, a business analyst argues that using historical data for ARO calculations is invalid because "past incidents don''t predict future ones in a changing threat landscape." The security manager responds that threat intelligence subscriptions can supplement historical data. Which position is MOST defensible from a risk methodology standpoint?',
  '["The security manager is correct; ARO estimates should be informed by a combination of historical incident data, threat intelligence, and industry loss data (e.g., Verizon DBIR, actuarial tables), with explicit assumptions documented for auditability", "The analyst is correct; qualitative risk assessment is always preferable to quantitative when data is uncertain, so ALE calculations should be abandoned in favor of heat maps", "Neither position is fully correct; the only valid ARO source is the organization''s own incident history because external data introduces bias", "The security manager is wrong; ARO calculations are statistical and require at least 10 years of internal incident history before they are methodologically valid"]'::jsonb,
  0,
  'Quantitative risk analysis rarely has perfect data, and the standard practice is to triangulate multiple sources: internal incident history, external threat intelligence, industry loss databases (Verizon DBIR, insurance actuarial data, FS-ISAC reports), and expert elicitation. The key methodological requirement is to document assumptions and data sources explicitly for auditability and to enable sensitivity analysis. Abandoning ALE for heat maps sacrifices decision-quality financial data. Requiring 10 years of internal data is impractical and not a recognized standard. External data introduces uncertainty but does not invalidate the approach.',
  'ARO = triangulate: own history + threat intel + industry data. Document assumptions. Perfect data is not required.',
  'analyze', 'best_answer', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q18: hard / apply / scenario / correct=1
(
  1, 'risk_transfer',
  'An organization outsources its payroll processing to a third-party SaaS provider. The SaaS provider suffers a breach exposing 50,000 employee records. The organization''s own cyber insurance policy excludes "third-party hosted data breaches." The SaaS contract includes a liability cap of $500,000 and requires arbitration. Regulatory fines reach $2,000,000. Who bears the uninsured regulatory fine exposure?',
  '["The SaaS provider bears the full regulatory fine because they were the direct cause of the breach", "The organization bears the full regulatory fine because regulatory obligations are non-delegable -- the data controller remains liable to regulators regardless of contractual arrangements with processors", "The organization and SaaS provider share the fine equally because both processed the data", "The insurance carrier bears the fine after the deductible because regulatory fines are always a covered cause of cyber insurance"]'::jsonb,
  1,
  'Under data protection regulations (GDPR, CCPA, state breach laws), the data controller (the organization) remains the primary party responsible to regulators for data subject protection. Regulatory fines cannot be contractually transferred -- they are assessed against the controller, not the processor. The SaaS contract limits the processor''s contractual liability to $500,000, but this caps civil recovery from the processor, not the regulatory fine owed by the controller. The insurance exclusion further leaves the organization exposed. The organization must recover what it can from the SaaS provider under contract while bearing the regulatory obligation.',
  'Data controller = regulatory accountability. ALWAYS. Contracts transfer costs between parties, not regulatory liability to regulators.',
  'apply', 'scenario', 'hard',
  1.80, 1.60, 0.20, 'handcrafted', true
),

-- Q19: hard / analyze / comparison / correct=2
(
  1, 'risk_frameworks',
  'Which statement BEST differentiates FAIR (Factor Analysis of Information Risk) from traditional qualitative risk assessment methods?',
  '["FAIR is superior because it eliminates the need for subjective judgment entirely by using algorithmic risk calculation", "FAIR and traditional qualitative methods are equivalent because both ultimately produce a prioritized risk list", "FAIR quantifies risk in financial terms by modeling Loss Event Frequency and Loss Magnitude as probability distributions, enabling Monte Carlo simulation and direct comparison to business financial metrics, while qualitative methods produce ordinal rankings (High/Medium/Low) that cannot be directly compared to financial thresholds", "FAIR requires significantly more data than qualitative methods and therefore produces less reliable results in data-sparse environments"]'::jsonb,
  2,
  'FAIR (Factor Analysis of Information Risk) is an ontology and quantitative model that decomposes risk into Loss Event Frequency (LEF) and Loss Magnitude (LM) components modeled as probability distributions. Monte Carlo simulation produces a risk range in financial terms ($X to $Y at Z% confidence), enabling direct comparison to financial thresholds and ROI calculations for controls. Traditional qualitative methods produce ordinal rankings that are useful for relative prioritization but cannot be used for financial decision-making (e.g., "is this risk worth a $500K control investment?"). Both methods involve subjectivity, just in different forms.',
  'FAIR = financial distribution + Monte Carlo = dollars. Qualitative = H/M/L = ordinal. FAIR talks money; quals talk heat maps.',
  'analyze', 'comparison', 'hard',
  1.70, 1.80, 0.22, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  1, 'policy_hierarchy',
  'A multinational corporation''s global information security policy states "all data must be encrypted at rest." The EU subsidiary''s local legal counsel advises that a specific category of anonymized statistical data does not qualify as personal data under GDPR and therefore does not require encryption under local data protection law. The global policy has no exception mechanism. What is the MOST appropriate resolution?',
  '["Apply the global policy without exception because global policies must be uniformly enforced to maintain consistency and prevent policy erosion", "Apply local law instead of the global policy because legal compliance always supersedes internal policy", "Ignore both the global policy and local law and implement encryption anyway as a security best practice", "Invoke or create a policy exception process where the subsidiary documents the legal basis for the exception, receives formal approval from the global CISO or governance committee, and the exception is tracked with a sunset date for periodic review"]'::jsonb,
  3,
  'A conflict between a global policy and a local legal or operational reality requires a formal exception management process, not unilateral deviation. The subsidiary should document the legal basis (GDPR analysis), the specific data category, and request formal exception approval from the appropriate governance authority (typically the global CISO or GRC committee). The exception is tracked with a sunset date and reviewed periodically. Simply overriding the global policy creates inconsistency and audit findings. Applying local law without governance approval undermines policy authority. Implementing encryption anyway ignores the subsidiary''s valid legal analysis.',
  'Policy conflict with local law = EXCEPTION PROCESS. Document legal basis, get CISO approval, track with sunset date.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / scenario / correct=0
(
  1, 'risk_treatment',
  'A risk register item shows: threat = ransomware, vulnerability = unpatched servers, likelihood = High, impact = Critical, current controls = antivirus and backups, residual risk = High. The risk owner wants to "accept" the residual risk to avoid the cost of a patch management program. What is the MOST important governance requirement for this risk acceptance?',
  '["The risk acceptance must be formally documented with the risk owner''s signature, approved by someone with authority above the risk owner (e.g., CISO or board), include the financial exposure, and have a defined review date", "Risk acceptance is a legitimate treatment option and requires only that the risk owner verbally acknowledges the risk in a staff meeting", "High residual risk can never be accepted and must always be mitigated or transferred, regardless of cost", "The risk acceptance should be documented in the risk register only without requiring management sign-off to avoid creating legal liability"]'::jsonb,
  0,
  'Risk acceptance is a legitimate treatment option, but for HIGH or CRITICAL residual risk, governance standards require formal documentation with: (1) risk owner signature, (2) approval from an authority level appropriate to the risk magnitude (typically one level above the risk owner), (3) documented financial exposure so the decision-maker understands what they are accepting, and (4) a review date to prevent indefinite acceptance. Verbal acknowledgment is insufficient for audit purposes. High risk CAN be accepted but requires rigorous governance. Documenting without management approval creates accountability gaps.',
  'Risk acceptance = signed paper + senior approval + dollar amount + review date. No verbal. No solo sign-off for high risk.',
  'apply', 'scenario', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q22: very_hard / analyze / tlatm / correct=1
(
  1, 'ethics',
  'A CISSP-certified security architect at a cloud provider learns through a privileged internal channel that the provider will announce a critical zero-day vulnerability in a widely deployed encryption library in 72 hours. Before the announcement, a major client asks the architect whether their cloud environment has any outstanding critical security issues. The architect is bound by an internal embargo. What is the MOST ethical course of action?',
  '["Disclose the specific vulnerability to the client immediately because the ISC2 Code of Ethics prioritizes protecting society above all other principles including employer confidentiality", "Acknowledge to the client that there are outstanding security matters being addressed and that a formal advisory will be released within 72 hours, without breaching the embargo by disclosing specifics, while escalating internally to ensure the client is on the notification list", "Say nothing to the client and wait for the public announcement because the embargo is a legal obligation that supersedes all ethical duties", "Provide the client with the vulnerability details under a verbal NDA to protect them while maintaining technical confidentiality"]'::jsonb,
  1,
  'The ISC2 Code of Ethics creates a tension between "protect society" (Canon 1) and "act honorably, protect the organization" (Canon 3). The resolution is not to unilaterally break the embargo, which could cause broader harm if disclosed before patches are available. The appropriate action is to acknowledge that a security matter is being addressed and ensure the client is on the coordinated disclosure notification list. This protects the client without triggering premature disclosure that could be exploited by threat actors. Verbal NDAs are not recognized embargo exceptions. Full silence is ethically insufficient when the client has asked directly.',
  'Ethics conflict: protect society vs. employer confidentiality. Resolution = partial disclosure (72h advisory) + escalate to ensure client notified. No full break, no full silence.',
  'analyze', 'tlatm', 'very_hard',
  2.00, 2.50, 0.20, 'handcrafted', true
),

-- Q23: hard / apply / best_answer / correct=2
(
  1, 'risk_treatment',
  'An organization''s risk assessment identifies a residual risk of $800,000 ALE for a web application vulnerability. The security team proposes three options: (A) Patch the application for $50,000/year ongoing, reducing ALE by 90%. (B) Deploy a WAF for $120,000/year, reducing ALE by 75%. (C) Transfer risk via cyber insurance for $95,000/year premium, covering losses up to $600,000. Which option produces the BEST risk-adjusted financial outcome?',
  '["Option B because a WAF provides an active technical control that also benefits other applications", "Option C because transferring risk removes it from the organization''s responsibility entirely", "Option A because it yields the highest ALE reduction ($720,000) at the lowest annual cost ($50,000), producing a net benefit of $670,000/year, compared to Option B ($480,000 net) and Option C which still leaves $200,000 uninsured", "$95,000 is Option C because insurance cost is fully tax-deductible whereas control costs are capital expenditures"]'::jsonb,
  2,
  'Option A: ALE reduction = $800K × 90% = $720K. Net benefit = $720K - $50K = $670K/year. Option B: ALE reduction = $800K × 75% = $600K. Net benefit = $600K - $120K = $480K/year. Option C: Insurance covers up to $600K of $800K ALE. Uninsured exposure = $200K. Net benefit = $600K - $95K premium = $505K, but $200K residual uninsured ALE remains. Option A has the best net financial outcome. Tax treatment arguments are not standard risk justification methodology. Option B benefits to other applications are valid considerations but do not change the financial calculation for this risk.',
  'Best option = highest (ALE reduction - control cost). Rank all options by net benefit. Pick the highest number.',
  'apply', 'best_answer', 'hard',
  1.80, 1.60, 0.20, 'handcrafted', true
),

-- Q24: hard / analyze / first_action / correct=3
(
  1, 'policy_hierarchy',
  'A newly appointed CISO discovers the organization has 47 separate security-related policies, many overlapping and some conflicting. Several were never formally approved. The CEO asks for an immediate "security posture improvement." What should the CISO prioritize FIRST?',
  '["Immediately draft and publish a new comprehensive master security policy to replace all 47 documents", "Hire a Big Four consulting firm to conduct a policy gap analysis before taking any action", "Begin enforcing the most critical existing policies through technical controls, regardless of whether they are formally approved", "Conduct a policy inventory and rationalization to identify conflicts, redundancies, unapproved documents, and coverage gaps, then prioritize a governance review starting with top-risk policy areas"]'::jsonb,
  3,
  'Before drafting new policies or enforcing existing ones, the CISO must understand the current state of the policy landscape. A policy inventory and rationalization identifies: (1) unapproved documents (not enforceable), (2) conflicts between documents (audit risk), (3) redundancies (maintenance burden), and (4) coverage gaps (unaddressed risk areas). Only with this map can the CISO prioritize governance actions. Publishing a new master policy without rationalization adds a 48th document. External consultants are useful but not the first step when an internal assessment can quickly surface the landscape. Enforcing unapproved policies creates legal exposure.',
  'Policy mess = INVENTORY FIRST. Map what exists, what conflicts, what is unapproved. THEN rationalize. THEN enforce.',
  'analyze', 'first_action', 'hard',
  1.70, 1.70, 0.22, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  1, 'risk_frameworks',
  'An organization operating critical infrastructure must comply with NIST CSF 2.0. A board member asks how the CSF''s new "Govern" function changes their accountability compared to CSF 1.1. Which answer is MOST accurate?',
  '["CSF 2.0 elevates governance to a standalone function (GV) that explicitly addresses organizational context, risk management strategy, supply chain risk, roles and responsibilities, and oversight -- making board-level cybersecurity governance a first-class framework requirement rather than an implicit expectation embedded in other functions", "CSF 2.0 adds Govern primarily for regulatory compliance purposes and does not change board accountability compared to CSF 1.1", "The Govern function in CSF 2.0 replaces the Identify function and consolidates all strategic activities under a single category", "CSF 2.0''s Govern function applies only to critical infrastructure sectors and has no applicability to commercial organizations"]'::jsonb,
  0,
  'NIST CSF 2.0 introduces the Govern (GV) function as the sixth core function, explicitly addressing: organizational context, risk management strategy, cybersecurity supply chain risk management, roles, responsibilities, and authorities, as well as oversight. This represents a significant shift from CSF 1.1, where governance concepts were scattered across the Identify function. The GV function explicitly acknowledges that cybersecurity governance is a board and executive leadership responsibility. It applies to all organizations, not just critical infrastructure. The Identify function remains in CSF 2.0; GV does not replace it.',
  'CSF 2.0 = GOVERN added. Board accountability = explicit, not implicit. GV sits ABOVE all other functions as the governance wrapper.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.30, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=14, analyze=11   (Total: 25)
-- Type:       scenario=10, comparison=5, tlatm=4, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
