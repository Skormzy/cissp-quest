INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
(
  4, 'network_resilience',
  'Your organization''s network architecture was designed for 99.99% availability. After three consecutive outages caused by BGP hijacking, DNS poisoning, and a certificate authority compromise, the board questions whether the architecture is fundamentally flawed. Each incident was caused by trusting a different element of internet infrastructure that the organization doesn''t control. What is the MOST strategic architectural recommendation?',
  '["Build a completely private network infrastructure that eliminates all dependence on public internet infrastructure", "Adopt a zero-trust networking approach that treats all network paths as potentially compromised: implement RPKI for BGP route validation, deploy DNSSEC with multiple independent resolvers, establish certificate transparency monitoring with automated revocation capabilities, and architect applications for graceful degradation when any single infrastructure trust anchor fails — accepting that internet infrastructure dependencies cannot be eliminated but can be validated, diversified, and designed around", "Migrate all services to a single cloud provider that controls its own network infrastructure end-to-end", "Implement redundant connections through multiple ISPs to prevent single points of failure"]'::jsonb,
  1,
  'A strategic architect recognizes that internet infrastructure dependencies are unavoidable but can be managed through validation (RPKI, DNSSEC), diversification (multiple resolvers, CT monitoring), and resilient design (graceful degradation). Private networks are impractical for most organizations; single-cloud creates new dependencies; multiple ISPs only address connectivity, not trust infrastructure.',
  'MANAGER MINDSET: You can''t eliminate infrastructure trust dependencies — validate them, diversify them, and design for their failure',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;