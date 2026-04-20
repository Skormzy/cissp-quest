INSERT INTO cat_questions (domain_id,topic_cluster,question_text,options,correct_index,explanation,mnemonic_hint,cognitive_level,question_type,difficulty_rating,irt_a,irt_b,irt_c,source,is_active) VALUES
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
(
  5, 'identity_governance',
  'Your organization completed a privileged access management (PAM) rollout, but a red team exercise reveals that attackers can still achieve domain compromise through service account credential theft, Kerberos delegation abuse, and AD certificate template misconfigurations. The PAM tool only protects interactive admin sessions. The CISO must justify additional investment to a skeptical board that believes PAM "solved" the privileged access problem. What is the MOST effective approach?',
  '["Present the board with the full identity attack path from the red team findings, demonstrate that PAM addressed one attack vector (interactive admin sessions) while leaving three others open (service accounts, Kerberos delegation, certificate abuse), and propose an identity threat detection and response (ITDR) strategy that covers the complete identity attack surface with measurable risk reduction targets tied to each phase", "Request budget for a more comprehensive PAM tool that covers service accounts", "Recommend contracting the red team annually to continuously validate PAM effectiveness", "Propose implementing multi-factor authentication for all service accounts"]'::jsonb,
  0,
  'A strategic CISO educates the board that privileged access is an attack surface, not a single tool. Showing the complete attack path demonstrates that PAM was necessary but insufficient. ITDR as a strategy (not just a product) addresses the full surface. A better PAM tool is still tool-focused thinking; annual red teams are point-in-time; MFA for service accounts is one control, not a strategy.',
  'MANAGER MINDSET: Security is about attack surfaces, not tools — show the board the complete picture, not just the piece you''ve already covered',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;