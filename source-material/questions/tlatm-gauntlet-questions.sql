-- =====================================================================
-- CISSP Quest -- Think Like a Manager Gauntlet
-- 30 Board-Level Management Decision Questions
--
-- ALL difficulty: hard (15) + very_hard (15)
-- ALL cognitive_level: analyze
-- ALL question_type: tlatm
--
-- CORRECT ANSWER POSITION: 0=8, 1=7, 2=8, 3=7
--
-- IRT parameters (tlatm + analyze):
--   hard:      b = 1.5 + 0.6 + 0.5 = 2.60, a = 1.5 + 0.4 = 1.90, c = 0.20
--   very_hard: b = 2.5 + 0.6 + 0.5 = 3.60 → clamped 3.00, a = 1.90, c = 0.20
--
-- Topics: Board-level decisions, competing priorities, budget constraints,
--         regulatory pressure, risk trade-offs, organizational strategy
--
-- Run AFTER supabase-cat-engine-migration.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- =====================================================================
-- HARD QUESTIONS (15) -- a=1.90, b=2.60, c=0.20
-- =====================================================================

-- Q1: hard / analyze / tlatm / correct=0 / D1
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

-- Q2: hard / analyze / tlatm / correct=1 / D3
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

-- Q3: hard / analyze / tlatm / correct=2 / D5
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

-- Q4: hard / analyze / tlatm / correct=3 / D7
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

-- Q5: hard / analyze / tlatm / correct=0 / D2
(
  2, 'data_governance',
  'Your organization completed a data classification initiative, but 18 months later, an audit reveals that 40% of data assets remain unclassified and classification labels on existing assets are inconsistent across business units. The data governance committee asks for your recommendation. What is the MOST effective management strategy?',
  '["Implement automated data discovery and classification tools integrated with DLP, assign data stewards per business unit with quarterly compliance reporting to the governance committee, and tie classification accuracy to departmental KPIs", "Mandate that all business units complete classification of remaining assets within 90 days with weekly progress reports", "Hire a consulting firm to reclassify all data assets using a standardized taxonomy", "Reduce the number of classification levels from five to three to simplify the process"]'::jsonb,
  0,
  'Sustainable governance requires automation, accountability (stewards + KPIs), and ongoing oversight (quarterly reporting). Mandating completion without tooling repeats the original failure. External consultants provide a one-time fix without building internal capability. Simplifying categories doesn''t address the compliance gap.',
  'MANAGER MINDSET: Sustainable governance = Automation + Accountability + Ongoing oversight',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q6: hard / analyze / tlatm / correct=1 / D4
(
  4, 'network_security',
  'Your organization operates in 12 countries with varying data sovereignty requirements. The network team proposes consolidating all traffic through two centralized data centers to simplify security monitoring. The privacy team objects that this routes EU citizen data through non-EU jurisdictions. The CFO supports consolidation for cost savings. As CISO, what is the BEST recommendation?',
  '["Support the consolidation plan and implement encryption in transit to address privacy concerns", "Recommend a distributed security architecture with regional inspection points that keep regulated data within jurisdictional boundaries while feeding normalized telemetry to a centralized SIEM for unified monitoring and correlation", "Advise against consolidation entirely and maintain the current distributed architecture", "Propose consolidating only non-EU traffic and maintaining separate infrastructure for EU operations"]'::jsonb,
  1,
  'A manager finds architectures that satisfy multiple constraints simultaneously. Regional inspection points maintain data sovereignty compliance while centralized SIEM achieves the monitoring goal. Encryption doesn''t solve data routing issues; full decentralization loses monitoring benefits; EU-only separation is an incomplete solution for 12-country operations.',
  'MANAGER MINDSET: Design architectures that satisfy ALL constraints — don''t sacrifice one requirement for another',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q7: hard / analyze / tlatm / correct=2 / D6
(
  6, 'security_assessment',
  'The board requests a comprehensive security posture assessment. Your team completed a vulnerability scan last quarter, a penetration test 6 months ago, and an internal audit 3 months ago. Each produced different risk ratings for the same systems. The board wants a single, coherent risk picture. What is the MOST appropriate management approach?',
  '["Commission a new comprehensive penetration test to provide a single authoritative assessment", "Present all three reports separately and let the board determine their own risk conclusions", "Create a unified risk dashboard that normalizes findings across all assessment types using a common risk scoring framework, maps findings to business impact, and identifies gaps where assessment coverage overlaps or is missing", "Average the risk ratings from all three assessments to create a single composite score"]'::jsonb,
  2,
  'Different assessment types measure different things and produce different ratings by design. A manager normalizes these into a coherent picture using common risk scoring, business impact mapping, and gap identification. A new pentest doesn''t replace the value of audits/scans; separate reports burden the board; averaging different methodologies is statistically invalid.',
  'MANAGER MINDSET: Integrate assessment data into a unified risk picture — don''t just stack reports',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q8: hard / analyze / tlatm / correct=3 / D8
(
  8, 'sdlc_security',
  'Your development organization ships 200 microservices with a 2-week sprint cycle. A recent security review found that only 30% of services have completed threat models, and SAST tools generate 2,000+ findings per sprint that developers largely ignore. The VP of Engineering says security is slowing delivery. What is the MOST effective management strategy?',
  '["Require all services to complete threat models before the next release and halt deployments until SAST findings reach zero", "Reduce SAST sensitivity to decrease the finding volume and make results more actionable for developers", "Remove SAST from the pipeline entirely and rely on periodic penetration testing instead", "Implement risk-tiered security requirements where critical services get full threat modeling and strict SAST policies, while lower-risk services use lightweight security checklists and focused SAST rules — and integrate security champions within development teams to triage findings"]'::jsonb,
  3,
  'A manager applies proportional security based on risk. Not all 200 services carry equal risk, so tiered requirements focus effort where it matters most. Security champions embedded in teams address the cultural gap. Halting all deployments is disproportionate; reducing sensitivity masks real issues; removing SAST eliminates a valuable control.',
  'MANAGER MINDSET: Risk-proportional controls + embedded security culture > one-size-fits-all mandates',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q9: hard / analyze / tlatm / correct=0 / D1
(
  1, 'business_continuity',
  'Your organization''s BIA reveals that the ERP system has an RTO of 4 hours and RPO of 1 hour, but the current disaster recovery capability only supports RTO of 24 hours and RPO of 8 hours. Closing this gap requires a $2.5M investment. The CFO argues the organization has never experienced a disaster and the investment is unnecessary. How should the CISO BEST present this to the board?',
  '["Frame the investment in terms of business impact: quantify the hourly cost of ERP downtime against revenue, contractual SLA penalties, and regulatory fines, then compare the $2.5M investment against the expected annual loss from even a single event exceeding current capabilities", "Cite industry best practices and standards that require DR capabilities to match BIA requirements", "Present historical disaster statistics from peer organizations to justify the investment probability", "Recommend accepting the current DR gap and purchasing cyber insurance to cover the financial exposure"]'::jsonb,
  0,
  'A manager speaks in business terms, not technical terms. Quantifying the cost of downtime against the investment makes a business case the CFO and board can evaluate. Best practices alone don''t drive budget decisions; peer statistics may not apply; insurance doesn''t restore operations and may not cover all losses.',
  'MANAGER MINDSET: Translate technical gaps into business-impact language the board understands',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q10: hard / analyze / tlatm / correct=1 / D3
(
  3, 'cryptography',
  'Your organization''s cryptographic inventory reveals 340 applications using RSA-2048 for data encryption. NIST has announced post-quantum cryptography standards with a recommended migration timeline of 5-7 years. Your team estimates the full migration will cost $8M and take 3 years. The CTO asks whether to begin migration now or wait. What is the BEST management recommendation?',
  '["Wait until quantum computers become a practical threat before investing in migration to avoid premature spending", "Begin a phased migration program immediately, prioritizing systems that protect data with long confidentiality requirements (harvest-now-decrypt-later risk), implement crypto-agility in new applications, and establish a cryptographic governance committee to manage the multi-year transition", "Migrate all 340 applications simultaneously within 12 months to eliminate the quantum risk window", "Implement quantum key distribution as an alternative to post-quantum algorithms"]'::jsonb,
  1,
  'Harvest-now-decrypt-later attacks mean data encrypted today could be decrypted by future quantum computers. A manager prioritizes by data longevity, builds crypto-agility into new systems, and governs the transition. Waiting ignores harvest attacks; simultaneous migration is unrealistic; QKD is not a practical enterprise solution.',
  'MANAGER MINDSET: Prioritize by risk exposure timeline — long-lived secrets face harvest-now-decrypt-later threats TODAY',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- Q11: hard / analyze / tlatm / correct=2 / D5
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

-- Q12: hard / analyze / tlatm / correct=3 / D6
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

-- Q13: hard / analyze / tlatm / correct=0 / D7
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

-- Q14: hard / analyze / tlatm / correct=2 / D4
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

-- Q15: hard / analyze / tlatm / correct=3 / D2
(
  2, 'asset_management',
  'A shadow IT discovery scan reveals 340 unauthorized SaaS applications in use across the organization, including 12 that process sensitive customer data. Business units argue these tools are essential for productivity and were adopted because IT couldn''t provide alternatives fast enough. What is the MOST effective management approach?',
  '["Block all unauthorized SaaS applications immediately at the network perimeter", "Transfer ownership of SaaS application decisions to individual business units", "Add all 340 applications to the approved list to reflect actual business usage", "Triage the 340 applications by data sensitivity and business criticality: immediately secure the 12 processing customer data through approved configurations or migration to sanctioned alternatives, establish a fast-track SaaS approval process to prevent future shadow IT, and create a 90-day rationalization plan for the remaining applications"]'::jsonb,
  3,
  'A manager triages by risk and addresses root causes. The 12 sensitive-data apps need immediate attention, but the root cause (slow IT provisioning) must also be fixed through a fast-track process. Blocking everything disrupts business; blanket approval ignores risk; decentralizing control eliminates governance.',
  'MANAGER MINDSET: Triage by risk + fix root causes — blocking shadow IT without fixing WHY it exists guarantees recurrence',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
),

-- =====================================================================
-- VERY HARD QUESTIONS (15) -- a=1.90, b=3.00, c=0.20
-- =====================================================================

-- Q16: very_hard / analyze / tlatm / correct=0 / D1
(
  1, 'governance',
  'Your organization operates in healthcare, financial services, and government contracting — each with different regulatory frameworks (HIPAA, GLBA, FedRAMP). The board wants to reduce compliance costs by 30% while maintaining all certifications. Three compliance teams currently operate independently with separate tools, processes, and audit schedules. What is the MOST strategic management approach?',
  '["Implement a unified compliance framework that maps common controls across HIPAA, GLBA, and FedRAMP into a single control catalog, consolidate tools into a GRC platform with automated evidence collection, align audit schedules to maximize shared evidence, and maintain regulatory-specific supplements only where frameworks genuinely diverge", "Outsource all compliance functions to a single managed compliance provider", "Eliminate the lowest-revenue business line to reduce the number of regulatory frameworks", "Maintain separate compliance programs but reduce headcount by 30% across all three teams"]'::jsonb,
  0,
  'A strategic manager identifies that many regulatory controls overlap (access control, encryption, logging, etc.) and eliminates redundant effort through unified frameworks and shared evidence. Outsourcing surrenders institutional knowledge; eliminating business lines is a business strategy decision, not a security decision; cutting headcount without process change just increases risk.',
  'MANAGER MINDSET: Unified control frameworks eliminate redundancy across regulations — map once, comply many',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q17: very_hard / analyze / tlatm / correct=1 / D8
(
  8, 'secure_development',
  'Your AppSec program has matured over 3 years: SAST/DAST in all pipelines, developer security champions in 70% of teams, and mandatory threat modeling for critical applications. Despite this, production vulnerability density has plateaued at 3.2 per 1,000 lines of code. The CISO asks why investment isn''t yielding further improvement. What is the MOST insightful management analysis?',
  '["The organization has reached the theoretical minimum for vulnerability density given current technology", "The remaining vulnerabilities likely stem from design-level flaws and business logic errors that code-scanning tools cannot detect — recommend investing in architecture reviews, abuse case testing, and runtime application self-protection (RASP) to address the class of vulnerabilities that traditional AppSec tooling misses, while measuring secure design metrics alongside code-level findings", "Developer security champions need more training to identify the remaining vulnerabilities", "Replace current SAST/DAST tools with more advanced alternatives that have lower false negative rates"]'::jsonb,
  1,
  'A strategic manager recognizes diminishing returns and identifies the category of vulnerabilities remaining. SAST/DAST catch implementation bugs but not design flaws or business logic errors. The next improvement requires different approaches: architecture reviews and abuse case testing. The plateau isn''t a tool problem or training problem — it''s a methodology gap.',
  'MANAGER MINDSET: When controls plateau, the remaining risk is in a different category — shift methodology, don''t just intensify the same approach',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q18: very_hard / analyze / tlatm / correct=2 / D3
(
  3, 'security_models',
  'Your organization is designing a next-generation data platform that must simultaneously support: (1) military-grade data compartmentalization for government contracts, (2) open collaboration for research teams, and (3) strict Chinese wall isolation for financial advisory clients. These requirements appear fundamentally contradictory. What is the MOST architecturally sound management recommendation?',
  '["Implement the most restrictive model (Bell-LaPadula) across the entire platform and grant exceptions for collaboration", "Build three separate platforms, each optimized for its specific security model", "Design a policy-driven security architecture using attribute-based access control (ABAC) with dynamic policy evaluation, where security models (MLS for government, Brewer-Nash for financial, discretionary for research) are implemented as composable policy modules applied per data context rather than per platform — enabling a single platform with context-appropriate enforcement", "Implement role-based access control with a complex role hierarchy that approximates all three models"]'::jsonb,
  2,
  'A strategic architect recognizes that ABAC with dynamic policies can compose different security models as context-appropriate policy modules. This is fundamentally different from trying to force one model onto everything. Separate platforms triple costs; the most restrictive model kills collaboration; RBAC cannot truly implement Chinese walls or MLS.',
  'MANAGER MINDSET: Composable policy architectures solve "contradictory" requirements by applying different models contextually',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q19: very_hard / analyze / tlatm / correct=3 / D7
(
  7, 'disaster_recovery',
  'A ransomware attack has encrypted 80% of your production systems. Your DR plan assumed natural disasters and your backups are network-accessible (and now also encrypted). The CEO is on the phone with the attacker. The FBI advises against paying. Your cyber insurance carrier says payment is covered but may affect future premiums. Business losses are $500K/hour. What is the MOST appropriate CISO response?',
  '["Recommend paying the ransom immediately to minimize business losses since insurance covers the payment", "Refuse payment categorically and begin full system rebuilds from installation media", "Contact a ransomware negotiation firm to buy time while attempting to recover from backups", "Advise the CEO to defer the ransom decision by 24 hours while you execute parallel workstreams: engage the FBI for potential decryptor availability, assess which systems can be rebuilt from offline/offsite sources, activate the cyber insurance carrier''s incident response retainer for forensics and negotiation, and establish a decision framework that weighs rebuild-vs-pay for each system based on recovery time, data criticality, and rebuild feasibility"]'::jsonb,
  3,
  'A CISO in crisis doesn''t make binary pay/don''t-pay decisions immediately. Parallel workstreams maximize options: FBI may have decryptors; some systems may be rebuildable; insurance retainer provides expert resources; and a system-by-system framework ensures rational decisions. Immediate payment removes leverage; categorical refusal may be irresponsible; negotiation alone doesn''t address recovery.',
  'MANAGER MINDSET: In crisis, maximize options through parallel workstreams before committing to irreversible decisions',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q20: very_hard / analyze / tlatm / correct=0 / D5
(
  5, 'identity_governance',
  'Your organization completed a privileged access management (PAM) rollout, but a red team exercise reveals that attackers can still achieve domain compromise through service account credential theft, Kerberos delegation abuse, and AD certificate template misconfigurations. The PAM tool only protects interactive admin sessions. The CISO must justify additional investment to a skeptical board that believes PAM "solved" the privileged access problem. What is the MOST effective approach?',
  '["Present the board with the full identity attack path from the red team findings, demonstrate that PAM addressed one attack vector (interactive admin sessions) while leaving three others open (service accounts, Kerberos delegation, certificate abuse), and propose an identity threat detection and response (ITDR) strategy that covers the complete identity attack surface with measurable risk reduction targets tied to each phase", "Request budget for a more comprehensive PAM tool that covers service accounts", "Recommend contracting the red team annually to continuously validate PAM effectiveness", "Propose implementing multi-factor authentication for all service accounts"]'::jsonb,
  0,
  'A strategic CISO educates the board that privileged access is an attack surface, not a single tool. Showing the complete attack path demonstrates that PAM was necessary but insufficient. ITDR as a strategy (not just a product) addresses the full surface. A better PAM tool is still tool-focused thinking; annual red teams are point-in-time; MFA for service accounts is one control, not a strategy.',
  'MANAGER MINDSET: Security is about attack surfaces, not tools — show the board the complete picture, not just the piece you''ve already covered',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q21: very_hard / analyze / tlatm / correct=1 / D4
(
  4, 'secure_communications',
  'Your organization''s threat intelligence team reports that a nation-state adversary is actively targeting your industry sector using compromised network equipment from a major vendor. Your organization uses this vendor''s equipment in 70% of its infrastructure. Rip-and-replace would cost $15M and take 18 months. The threat is assessed as active and ongoing. What is the MOST appropriate strategic response?',
  '["Initiate an immediate emergency rip-and-replace program regardless of cost", "Implement a defense-in-depth mitigation strategy: deploy out-of-band monitoring on all suspect equipment, implement network traffic analysis that doesn''t rely on the compromised vendor''s infrastructure, establish encrypted overlay networks for sensitive communications, begin a prioritized replacement program starting with systems handling the most sensitive data, and engage with government threat-sharing programs for ongoing intelligence about the adversary''s TTPs", "Disable the vendor''s remote management capabilities and apply all available patches", "Accept the risk with enhanced monitoring until the next planned infrastructure refresh cycle"]'::jsonb,
  1,
  'A strategic CISO implements layered mitigations for immediate risk while executing prioritized replacement for long-term resolution. Full rip-and-replace creates operational disruption; patching may be insufficient if the compromise is at the hardware/firmware level; waiting for a refresh cycle accepts unacceptable risk. The key is parallel action: mitigate now, replace by priority, and leverage threat intelligence.',
  'MANAGER MINDSET: Layer mitigations for immediate threats while executing strategic replacement — urgency doesn''t mean panic',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q22: very_hard / analyze / tlatm / correct=2 / D6
(
  6, 'security_metrics',
  'The board requests a security metrics dashboard. Your team presents 47 operational metrics including patch compliance, mean time to detect, vulnerability counts, and firewall rule counts. The board chair says: "I can''t make any decisions from this data." You have one week to redesign the dashboard for the next board meeting. What is the MOST effective management approach?',
  '["Reduce the metrics to the top 10 most commonly used security KPIs in the industry", "Add trend lines and RAG (Red/Amber/Green) status to make the existing 47 metrics easier to interpret", "Redesign the dashboard around 5-7 strategic risk indicators that map directly to business objectives and board-level decisions: translate operational metrics into business impact terms (e.g., \"financial exposure from unpatched critical systems\" instead of \"patch compliance %\"), include trend analysis showing whether risk is increasing or decreasing, and provide decision-relevant context for each metric", "Ask each board member which metrics they want to see and customize the dashboard accordingly"]'::jsonb,
  2,
  'Board members make strategic decisions, not operational ones. They need metrics translated into business risk terms that inform their decisions. 47 operational metrics are noise at the board level. Industry top-10 still may not be relevant to this organization''s risk; adding formatting doesn''t fix the content problem; customization creates inconsistency.',
  'MANAGER MINDSET: Board metrics must be decision-relevant — translate operational data into business risk language',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q23: very_hard / analyze / tlatm / correct=3 / D2
(
  2, 'data_lifecycle',
  'Your organization''s data retention policy requires deletion of customer data 7 years after contract termination. A legal hold from ongoing litigation prevents deletion of data for 200 former customers. Machine learning models trained on this data continue to serve predictions. GDPR Article 17 erasure requests are arriving for some of these customers. The legal, data science, and privacy teams have conflicting positions. What is the MOST appropriate management resolution?',
  '["Delete all data as required by GDPR, regardless of the legal hold, since GDPR takes precedence", "Maintain all data under the legal hold, as litigation preservation supersedes GDPR erasure rights", "Retrain all machine learning models to exclude the affected customer data before responding to requests", "Implement a tiered response: legal hold data is preserved in isolated, access-restricted storage with documented legal basis (GDPR Article 6(1)(f) legitimate interest) for the litigation subset, ML models are flagged for retraining upon hold release with interim documentation of training data provenance, and GDPR responses cite the legal proceedings exception under Article 17(3)(e) while providing transparency about the restriction to affected data subjects"]'::jsonb,
  3,
  'This question requires synthesizing three legal frameworks simultaneously: data retention, litigation hold, and GDPR. A manager finds the nuanced path: GDPR Article 17(3)(e) provides a legal proceedings exception, data isolation limits exposure, ML model provenance is documented, and transparency maintains trust. Binary delete-or-keep approaches ignore the legal complexity.',
  'MANAGER MINDSET: When legal frameworks conflict, find the specific provisions that create a defensible path — never apply one framework blindly',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q24: very_hard / analyze / tlatm / correct=0 / D3
(
  3, 'cloud_security',
  'Your multi-cloud strategy spans AWS, Azure, and GCP. Each has its own security tooling, IAM model, and compliance controls. A recent cross-cloud attack exploited trust relationships between cloud environments to escalate from a low-privilege Azure function to an AWS admin role through a compromised CI/CD pipeline in GCP. None of the cloud-native security tools detected the lateral movement because each only had visibility into its own environment. What is the MOST strategic management response?',
  '["Implement a cloud-native application protection platform (CNAPP) that spans all three cloud providers, establish a unified identity perimeter that treats cross-cloud trust relationships as high-risk boundaries requiring explicit authentication, deploy cross-cloud detection rules that correlate events across providers, and conduct quarterly cross-cloud attack path analysis to identify and remediate trust relationship chains before adversaries exploit them", "Consolidate to a single cloud provider to eliminate cross-cloud attack surfaces", "Deploy the same SIEM in all three clouds to create unified visibility", "Implement additional network segmentation between cloud environments"]'::jsonb,
  0,
  'Cross-cloud attacks exploit the seams between environments. A strategic response addresses identity trust (the attack vector), detection correlation (the visibility gap), and continuous analysis (the prevention mechanism). Single-cloud eliminates business flexibility; same-SIEM doesn''t address the identity trust problem; network segmentation doesn''t prevent identity-based lateral movement.',
  'MANAGER MINDSET: Attacks exploit seams between environments — your security architecture must specifically address boundary trust relationships',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q25: very_hard / analyze / tlatm / correct=1 / D1
(
  1, 'risk_quantification',
  'The board is evaluating two competing security investment proposals. Proposal A: $3M for a data loss prevention (DLP) program that reduces estimated annual breach costs by $8M (based on ALE calculation). Proposal B: $3M for a security awareness program that reduces phishing success rates from 15% to 3% (based on simulation data). Both claim positive ROI. The CFO asks which provides better risk reduction per dollar. Neither team can agree on methodology. What is the BEST management approach to resolve this?',
  '["Choose Proposal A because the ALE methodology provides quantified dollar figures that are directly comparable", "Acknowledge that the proposals use fundamentally different risk quantification approaches (loss-based ALE vs. probability reduction), commission a FAIR-based analysis that normalizes both investments into comparable loss exceedance curves, present the board with probability distributions of outcomes rather than point estimates, and recommend a phased investment that allows empirical validation of projected returns before full commitment", "Choose Proposal B because reducing the primary initial attack vector (phishing) has cascading benefits across all threat categories", "Split the budget equally between both proposals to diversify the security investment portfolio"]'::jsonb,
  1,
  'A strategic CISO recognizes that comparing ALE (dollar-based) with probability reduction (percentage-based) requires normalization. FAIR provides a framework to express both as comparable loss distributions. Phased investment allows validation before commitment. Point estimates create false precision; choosing either without comparable analysis is uninformed; splitting equally isn''t risk-based.',
  'MANAGER MINDSET: Normalize risk quantification methods before comparing investments — point estimates hide uncertainty',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q26: very_hard / analyze / tlatm / correct=2 / D7
(
  7, 'continuity_planning',
  'Your organization''s business continuity plan was tested through a tabletop exercise. The exercise revealed that: (1) the crisis communication plan assumed office phones would work during a cloud outage, (2) the recovery sequence had circular dependencies between the authentication system and the recovery orchestration platform, (3) key recovery personnel had single points of failure with no trained alternates, and (4) the plan referenced three systems that were decommissioned 18 months ago. The BC committee asks whether the plan is salvageable. What is the MOST appropriate management response?',
  '["Declare the current plan invalid and initiate a complete BCP rewrite from the latest BIA", "Focus on fixing only the four identified issues since they represent isolated problems", "Classify the findings as minor documentation issues that can be resolved through a plan update cycle", "Recommend a structured plan remediation that addresses the four findings as symptoms of a deeper governance problem: establish a BC plan lifecycle management process with mandatory semi-annual reviews tied to change management, implement automated dependency mapping to prevent circular recovery sequences, require all critical roles to have documented and exercised alternates, and validate communication channels through actual failover tests rather than assumptions"]'::jsonb,
  2,
  'The four findings aren''t isolated bugs — they indicate the plan lacks lifecycle governance. A manager treats symptoms while fixing root causes: automated dependency mapping prevents circular dependencies, semi-annual reviews catch decommissioned systems, alternate training eliminates SPOFs, and communication testing validates assumptions. A complete rewrite wastes existing work; fixing only four issues ignores the governance gap; minimizing them ensures recurrence.',
  'MANAGER MINDSET: Individual BCP failures indicate systemic governance gaps — fix the process that creates plans, not just the plan itself',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q27: very_hard / analyze / tlatm / correct=3 / D5
(
  5, 'zero_trust',
  'Your organization has been implementing zero trust for 2 years. Identity verification and microsegmentation are in place. However, a sophisticated insider threat case reveals that a trusted employee with legitimate access exfiltrated data over 6 months by accessing it in normal patterns that didn''t trigger any behavioral analytics alerts. The data access was within their authorized scope, but the volume and timing (just before resignation) suggest malicious intent. The board asks why zero trust didn''t prevent this. What is the MOST accurate management analysis?',
  '["Zero trust was not properly implemented because it should have prevented all unauthorized data access", "The organization needs more restrictive access policies that limit data access volumes for all users", "Behavioral analytics tools need to be tuned with lower thresholds to catch subtle exfiltration patterns", "Zero trust verifies identity and enforces authorization but was never designed to detect abuse of legitimately authorized access — this gap requires complementary controls: data-centric security with usage analytics that track cumulative access patterns over time, context-aware DLP that correlates access with employment lifecycle events, and insider threat programs that integrate HR signals with security telemetry to create composite risk indicators"]'::jsonb,
  3,
  'A strategic CISO accurately scopes what zero trust does and doesn''t do. ZT verifies identity and enforces policy but can''t detect legitimate access used for illegitimate purposes. That requires complementary controls: cumulative usage analytics, employment lifecycle correlation, and integrated insider threat programs. Claiming ZT failed mischaracterizes the model; universal volume limits damage productivity; lower thresholds increase false positives.',
  'MANAGER MINDSET: Know the boundaries of each security model — zero trust addresses authorization, not authorized-but-malicious access',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q28: very_hard / analyze / tlatm / correct=0 / D8
(
  8, 'supply_chain_security',
  'A critical open-source library used in 85% of your applications has a single maintainer who announces retirement. The library has no corporate sponsorship, no succession plan, and 3 unpatched CVEs. Your applications have 2,400 transitive dependencies on this library. The engineering VP says "it still works, we''ll deal with it when it breaks." What is the MOST responsible management position?',
  '["Escalate this as a strategic supply chain risk to the CTO: propose a three-pronged approach — (1) immediately assess exploitability of the 3 CVEs against your deployment context and implement compensating controls, (2) contribute engineering resources to fork and maintain the library or fund a community maintenance coalition, and (3) begin a medium-term migration plan to identify and validate alternative libraries for the most critical applications, with a decision checkpoint at 6 months", "Accept the engineering VP''s position and monitor the library for future issues", "Immediately begin migrating all applications away from the library to eliminate the dependency", "Report the CVEs to the open-source community and wait for someone else to maintain the library"]'::jsonb,
  0,
  'A strategic manager treats unmaintained critical dependencies as supply chain risk, not a technical inconvenience. The three-pronged approach addresses immediate risk (CVE assessment), medium-term sustainability (maintenance contribution), and long-term strategy (migration). Accepting the VP''s position ignores a predictable failure; immediate full migration is unrealistic for 85% of apps; waiting is not risk management.',
  'MANAGER MINDSET: Single-maintainer critical dependencies are a strategic supply chain risk — don''t wait for failure to act',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q29: very_hard / analyze / tlatm / correct=3 / D6
(
  6, 'third_party_risk',
  'Your third-party risk management program assesses 400 vendors annually using questionnaires. A recent breach occurred through a vendor rated "low risk" in the last assessment because they accurately reported their SOC 2 Type II certification and ISO 27001 compliance. The breach exploited a misconfigured API that was outside the scope of both certifications. The board questions the value of the entire TPRM program. What is the MOST constructive management response?',
  '["Replace questionnaire-based assessments with continuous monitoring tools for all 400 vendors", "Require all vendors to expand their certification scopes to include API security", "Reduce the vendor portfolio to minimize third-party risk exposure", "Acknowledge that certification-based assessments verify control frameworks but not operational security posture — evolve the TPRM program to a risk-tiered model where critical vendors receive technical validation (API security testing, configuration reviews, continuous monitoring) beyond compliance attestations, while lower-risk vendors continue with streamlined assessments, and integrate vendor risk signals into your own threat detection to identify anomalous vendor behavior"]'::jsonb,
  3,
  'A strategic manager recognizes the gap between compliance attestations and operational security. Certifications verify process maturity, not specific technical configurations. The evolved program layers technical validation on top of compliance for critical vendors while keeping the program scalable. Continuous monitoring for 400 vendors is cost-prohibitive; expanding cert scopes depends on vendor cooperation; reducing vendors limits business capability.',
  'MANAGER MINDSET: Compliance attestations verify control frameworks, not security outcomes — layer technical validation for critical third parties',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
),

-- Q30: very_hard / analyze / tlatm / correct=1 / D4
(
  4, 'network_resilience',
  'Your organization''s network architecture was designed for 99.99% availability. After three consecutive outages caused by BGP hijacking, DNS poisoning, and a certificate authority compromise, the board questions whether the architecture is fundamentally flawed. Each incident was caused by trusting a different element of internet infrastructure that the organization doesn''t control. What is the MOST strategic architectural recommendation?',
  '["Build a completely private network infrastructure that eliminates all dependence on public internet infrastructure", "Adopt a zero-trust networking approach that treats all network paths as potentially compromised: implement RPKI for BGP route validation, deploy DNSSEC with multiple independent resolvers, establish certificate transparency monitoring with automated revocation capabilities, and architect applications for graceful degradation when any single infrastructure trust anchor fails — accepting that internet infrastructure dependencies cannot be eliminated but can be validated, diversified, and designed around", "Migrate all services to a single cloud provider that controls its own network infrastructure end-to-end", "Implement redundant connections through multiple ISPs to prevent single points of failure"]'::jsonb,
  1,
  'A strategic architect recognizes that internet infrastructure dependencies are unavoidable but can be managed through validation (RPKI, DNSSEC), diversification (multiple resolvers, CT monitoring), and resilient design (graceful degradation). Private networks are impractical for most organizations; single-cloud creates new dependencies; multiple ISPs only address connectivity, not trust infrastructure.',
  'MANAGER MINDSET: You can''t eliminate infrastructure trust dependencies — validate them, diversify them, and design for their failure',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
);
