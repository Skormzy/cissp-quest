INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
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
(
  1, 'risk_quantification',
  'The board is evaluating two competing security investment proposals. Proposal A: $3M for a data loss prevention (DLP) program that reduces estimated annual breach costs by $8M (based on ALE calculation). Proposal B: $3M for a security awareness program that reduces phishing success rates from 15% to 3% (based on simulation data). Both claim positive ROI. The CFO asks which provides better risk reduction per dollar. Neither team can agree on methodology. What is the BEST management approach to resolve this?',
  '["Choose Proposal A because the ALE methodology provides quantified dollar figures that are directly comparable", "Acknowledge that the proposals use fundamentally different risk quantification approaches (loss-based ALE vs. probability reduction), commission a FAIR-based analysis that normalizes both investments into comparable loss exceedance curves, present the board with probability distributions of outcomes rather than point estimates, and recommend a phased investment that allows empirical validation of projected returns before full commitment", "Choose Proposal B because reducing the primary initial attack vector (phishing) has cascading benefits across all threat categories", "Split the budget equally between both proposals to diversify the security investment portfolio"]'::jsonb,
  1,
  'A strategic CISO recognizes that comparing ALE (dollar-based) with probability reduction (percentage-based) requires normalization. FAIR provides a framework to express both as comparable loss distributions. Phased investment allows validation before commitment. Point estimates create false precision; choosing either without comparable analysis is uninformed; splitting equally isn''t risk-based.',
  'MANAGER MINDSET: Normalize risk quantification methods before comparing investments — point estimates hide uncertainty',
  'analyze', 'tlatm', 'very_hard',
  1.90, 3.00, 0.20, 'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;