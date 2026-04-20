INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
(
  3, 'cryptography',
  'Your organization''s cryptographic inventory reveals 340 applications using RSA-2048 for data encryption. NIST has announced post-quantum cryptography standards with a recommended migration timeline of 5-7 years. Your team estimates the full migration will cost $8M and take 3 years. The CTO asks whether to begin migration now or wait. What is the BEST management recommendation?',
  '["Wait until quantum computers become a practical threat before investing in migration to avoid premature spending", "Begin a phased migration program immediately, prioritizing systems that protect data with long confidentiality requirements (harvest-now-decrypt-later risk), implement crypto-agility in new applications, and establish a cryptographic governance committee to manage the multi-year transition", "Migrate all 340 applications simultaneously within 12 months to eliminate the quantum risk window", "Implement quantum key distribution as an alternative to post-quantum algorithms"]'::jsonb,
  1,
  'Harvest-now-decrypt-later attacks mean data encrypted today could be decrypted by future quantum computers. A manager prioritizes by data longevity, builds crypto-agility into new systems, and governs the transition. Waiting ignores harvest attacks; simultaneous migration is unrealistic; QKD is not a practical enterprise solution.',
  'MANAGER MINDSET: Prioritize by risk exposure timeline — long-lived secrets face harvest-now-decrypt-later threats TODAY',
  'analyze', 'tlatm', 'hard',
  1.90, 2.60, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;