-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Final Boss Cross-Domain Questions
-- 50 questions spanning all 8 domains
-- Difficulty: 3-5 only (medium, hard, very_hard)
-- Cognitive: apply and analyze only
-- Weighted by CISSP exam: D1=15%, D2=10%, D3=13%, D4=13%,
--   D5=13%, D6=12%, D7=13%, D8=11%
-- D1=8, D2=5, D3=7, D4=7, D5=6, D6=6, D7=6, D8=5
--
-- IRT parameters via irt-defaults.ts
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 1 — Security and Risk Management (8 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q1: D1 / Medium / Analyze / Scenario — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'risk_treatment',
  'A global retail company identifies a risk that its e-commerce platform could experience a distributed denial-of-service attack during the holiday shopping season. The estimated annual loss from such an attack is $2 million. The company can purchase DDoS mitigation services for $500,000 annually, which would reduce the impact by approximately 80%. Alternatively, they can purchase cyber insurance covering DDoS losses for $300,000 annually with a $200,000 deductible. From a risk management perspective, which approach provides the BEST risk treatment strategy?',
  '["Purchase the cyber insurance because it has the lowest annual cost at $300,000", "Implement the DDoS mitigation service because it directly reduces the technical risk", "Combine the DDoS mitigation service with cyber insurance for the residual risk that mitigation cannot address", "Accept the risk because the annual cost of either control exceeds 25% of the potential loss"]'::jsonb,
  2,
  'The best approach combines risk mitigation (DDoS service reducing 80% of impact) with risk transfer (insurance for residual risk). The mitigation service reduces the expected loss from $2M to $400K, but the remaining $400K risk still exists. Insurance alone doesn''t prevent the operational disruption and reputational damage. Accepting a $2M risk when cost-effective controls exist is negligent. Defense in depth applies to risk treatment too — layer your responses.',
  'Risk treatment isn''t one-or-the-other. MITIGATE the bulk, TRANSFER the residual. Layer your risk responses.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- FB-Q2: D1 / Hard / Apply / First Action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1,
  'bcp_drp',
  'A multinational corporation''s primary data center in Dallas experiences a catastrophic failure due to a tornado. The BCP coordinator has been activated. Business units are reporting critical system outages. The media is calling for statements. Employees are asking whether to report to work. What should the BCP coordinator do FIRST?',
  '["Activate the crisis management team and follow the pre-established communication plan to coordinate all response activities", "Begin failing over critical systems to the disaster recovery site to restore operations", "Issue a press release acknowledging the disaster and providing a timeline for recovery", "Send employees instructions to work from home until further notice"]'::jsonb,
  0,
  'In a major disaster, the BCP coordinator''s first action is activating the crisis management team, which then coordinates all response streams — IT recovery, communications, personnel safety, and business continuity. Jumping straight to technical failover without crisis management coordination risks uncoordinated actions. Media response must go through the designated spokesperson after the team assembles. Employee communications come after the team establishes the response posture. The crisis management team is the command center.',
  'Crisis = activate the TEAM first. The team coordinates everything else. Don''t freelance in a disaster.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- FB-Q3: D1 / Medium / Apply / TLATM — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.8, a = 1.3 + 0.4 = 1.7, c = 0.20
(
  1,
  'security_governance',
  'As the newly hired CISO of a healthcare organization, you discover that the security team reports to the IT director, security policies haven''t been updated in three years, and there is no formal risk register. The CEO asks you to present your top priority for the first 90 days. What should you PRIMARILY focus on?',
  '["Conduct a comprehensive penetration test to identify all technical vulnerabilities", "Establish proper governance structure with direct reporting to executive leadership and initiate a risk assessment", "Deploy advanced security tools including SIEM, EDR, and DLP solutions", "Hire additional security analysts to staff a 24/7 security operations center"]'::jsonb,
  1,
  'Governance before technology. The reporting structure issue means security decisions are subordinated to IT priorities — a fundamental governance failure. Establishing proper reporting ensures security has executive visibility. A risk assessment identifies what actually needs protecting. Penetration testing finds technical issues but doesn''t fix structural governance gaps. Tools without governance produce alerts without action. Staff without governance direction work without strategic alignment. Fix the foundation first.',
  'GOVERNANCE first, TOOLS second. You can''t buy your way to security — structure and process come before products.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- FB-Q4: D1 / Medium / Analyze / Scenario — correct at 3
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.8, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'threat_modeling',
  'A software development team is designing a new customer-facing web application that will process credit card payments. The security architect recommends performing threat modeling before development begins. The development manager asks which threat modeling framework would be MOST appropriate for identifying threats specific to this application''s design. Which framework should the security architect recommend?',
  '["DREAD, because it provides a quantitative risk scoring system for each identified threat", "OCTAVE, because it focuses on organizational risk assessment and asset identification", "NIST RMF, because it provides a comprehensive framework for managing security risks", "STRIDE, because it systematically identifies threats by category — spoofing, tampering, repudiation, information disclosure, denial of service, and elevation of privilege"]'::jsonb,
  3,
  'STRIDE is specifically designed for application threat modeling and maps directly to the security properties developers need to address. Each STRIDE category maps to a security property: Spoofing (Authentication), Tampering (Integrity), Repudiation (Non-repudiation), Information Disclosure (Confidentiality), Denial of Service (Availability), Elevation of Privilege (Authorization). DREAD is a risk rating model, not a threat identification framework. OCTAVE focuses on organizational risk, not application design. NIST RMF is an enterprise risk management framework.',
  'STRIDE = 6 threat types for SOFTWARE. Each maps to a security property. Perfect for application threat modeling.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- FB-Q5: D1 / Hard / Analyze / TLATM — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.6, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  1,
  'intellectual_property',
  'As a security manager at a pharmaceutical company, your R&D department has developed a new drug formulation process. The legal team asks for your input on which intellectual property protection is MOST appropriate. The process relies on a specific combination of commonly known ingredients mixed in a proprietary sequence. What should you recommend?',
  '["Patent protection, which provides 20 years of exclusive rights with public disclosure of the process", "Copyright protection, which automatically applies to the written documentation of the process", "Trade secret protection, because the value lies in the secret combination and sequence that competitors cannot easily reverse-engineer", "Trademark protection to brand the unique formulation process"]'::jsonb,
  2,
  'Trade secret protection is optimal here because the proprietary value lies in the specific combination sequence, not in novel invention. A patent requires full public disclosure — competitors would learn the exact process. Since the ingredients are commonly known, the secret is HOW they''re combined. Copyright protects written expression, not processes. Trademarks protect brand names, not manufacturing processes. Coca-Cola''s formula is the classic example of trade secret over patent.',
  'If the VALUE is in the SECRET: trade secret. If the VALUE is in the NOVELTY: patent. Secret process = trade secret.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- FB-Q6: D1 / Very Hard / Analyze / Scenario — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  1,
  'control_types',
  'An organization experienced a data breach where an employee emailed a customer database to their personal account before resigning. In response, management wants to implement controls to prevent future insider data theft. The security team proposes: (A) DLP monitoring on all email gateways, (B) mandatory exit interviews with asset review, (C) a policy requiring all departing employees to sign a data handling acknowledgment, and (D) quarterly access reviews for all users with access to sensitive databases. Which combination represents the correct pairing of control categories?',
  '["A=Technical/Detective, B=Administrative/Corrective, C=Administrative/Deterrent, D=Technical/Preventive", "A=Technical/Preventive, B=Administrative/Detective, C=Administrative/Deterrent, D=Administrative/Detective", "A=Technical/Detective, B=Administrative/Preventive, C=Administrative/Preventive, D=Administrative/Corrective", "A=Technical/Corrective, B=Administrative/Detective, C=Administrative/Directive, D=Technical/Preventive"]'::jsonb,
  1,
  'DLP can block (prevent) outbound data — it''s Technical/Preventive. Exit interviews with asset review detect whether company data was taken — Administrative/Detective. Requiring signatures deters (discourages) data theft through awareness of consequences — Administrative/Deterrent. Quarterly access reviews detect excessive permissions — Administrative/Detective. The key distinctions: DLP actively blocks, making it preventive not just detective. Exit interviews discover after-the-fact. Signing acknowledgments create psychological deterrence.',
  'Controls have TWO dimensions: Category (Admin/Technical/Physical) × Function (Preventive/Detective/Corrective/Deterrent). Match BOTH.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q7: D1 / Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  1,
  'privacy_laws',
  'A US-based company with European customers receives a GDPR data subject access request from an EU citizen asking for all personal data the company holds about them. The company has never processed a DSAR before. Which of the following BEST describes the company''s obligation?',
  '["Provide all personal data within 30 days, in a commonly used machine-readable format, free of charge for the first request", "Provide only the data stored in the primary customer database within 60 days for a reasonable administrative fee", "Redirect the request to the company''s EU-based data processor for handling within 90 days", "Provide a summary of data categories held but not the actual data to protect other customers'' privacy"]'::jsonb,
  0,
  'Under GDPR Article 15, organizations must provide all personal data within one month (approximately 30 days), in a structured, commonly used, machine-readable format, free of charge for the first request. The response must cover ALL systems where personal data is stored, not just the primary database. The controller (not processor) is responsible for responding. A summary of categories is insufficient — the actual data must be provided.',
  'GDPR DSAR: ALL data, 30 days, machine-readable, FREE (first time). No shortcuts.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q8: D1 / Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  1,
  'risk_analysis_quantitative',
  'A financial institution''s web application server has an asset value of $800,000. Analysis shows that a successful SQL injection attack would compromise 60% of the server''s value. Historical data indicates such attacks occur approximately twice every five years. What is the Annualized Loss Expectancy?',
  '["$480,000", "$960,000", "$240,000", "$192,000"]'::jsonb,
  3,
  'ALE = SLE × ARO. The SLE = Asset Value × Exposure Factor = $800,000 × 0.60 = $480,000. The ARO = 2 attacks per 5 years = 0.4 attacks per year. Therefore ALE = $480,000 × 0.4 = $192,000. This means the expected annual loss from SQL injection is $192,000, which sets the maximum justifiable annual spend on countermeasures.',
  'ALE = SLE × ARO. SLE = AV × EF. Always convert "per X years" to annual rate (divide).',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 2 — Asset Security (5 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q9: D2 / Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  2,
  'dlp',
  'A multinational bank deploys network-based DLP to prevent sensitive data exfiltration. After three months, a security audit reveals that engineers in the R&D department have been successfully exfiltrating proprietary trading algorithms by encrypting files before emailing them to personal accounts. The DLP system never flagged these transmissions. What is the MOST effective remediation?',
  '["Upgrade the DLP solution to one that can decrypt TLS traffic in real-time for content inspection", "Deploy endpoint DLP agents that inspect content before encryption occurs on the workstation", "Block all personal email services at the network firewall to prevent data exfiltration", "Implement a policy requiring all engineers to use only company-approved encryption tools"]'::jsonb,
  1,
  'Network DLP cannot inspect encrypted content — this is a fundamental limitation. Endpoint DLP inspects files at the point of creation or before encryption, catching sensitive data before it''s encrypted. Decrypting TLS at the network level introduces significant privacy and performance concerns and may not catch pre-encrypted attachments. Blocking personal email is easily bypassed with other transfer methods. Policy alone doesn''t provide technical enforcement. The fix must be at the endpoint, before encryption.',
  'Network DLP is BLIND to encryption. Move DLP to the ENDPOINT to see data BEFORE it''s encrypted.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q10: D2 / Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'A hospital system needs to share patient treatment outcome data with medical researchers while complying with HIPAA privacy requirements. The researchers need to track individual patient journeys across multiple visits but do not need to know patient identities. Which data protection technique BEST meets these requirements?',
  '["Full anonymization by removing all identifying fields from the dataset", "Encryption of patient names using AES-256 with researcher-provided keys", "Pseudonymization by replacing patient identifiers with consistent tokens that allow re-linking across visits", "Data masking by replacing the first three characters of patient names with asterisks"]'::jsonb,
  2,
  'Pseudonymization replaces identifying information with consistent pseudonyms, allowing researchers to track the same patient across visits without knowing their identity. Full anonymization would prevent tracking patient journeys across visits since there''s no linking key. Encryption with researcher keys would give researchers the ability to decrypt identities. Data masking is insufficient for privacy protection and may still allow re-identification. GDPR and HIPAA both recognize pseudonymization as a valid privacy-preserving technique.',
  'Pseudonymization: consistent substitution, reversible by the holder. Anonymization: permanent, irreversible. Choose based on whether you need to RE-LINK.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q11: D2 / Very Hard / Analyze / TLATM — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  2,
  'data_sovereignty',
  'As the Chief Privacy Officer of a global SaaS company, you learn that a new data protection law in Brazil requires all Brazilian customer data to be stored within Brazilian borders. Your platform currently uses a US-based cloud provider with data centers in Virginia and Ireland only. The engineering team proposes three options: migrate Brazilian data to a new Brazilian data center, implement encryption where only Brazilian staff hold keys, or exit the Brazilian market. From a governance perspective, what is the MOST appropriate recommendation?',
  '["Negotiate with the cloud provider to establish a Brazilian region and migrate the data, while evaluating the cost impact against Brazilian market revenue", "Implement encryption with Brazilian-held keys since encrypted data is not considered personal data under most frameworks", "Exit the Brazilian market to avoid the complexity of data residency compliance", "Continue current operations and challenge the law through legal proceedings in Brazilian courts"]'::jsonb,
  0,
  'Data sovereignty laws require physical residency of data, not just encryption. The governance approach weighs compliance cost against business value. Establishing a Brazilian region directly addresses the legal requirement. Encryption does not satisfy data residency requirements — the data physically resides in the US regardless of who holds keys. Exiting a market should be a last resort after cost-benefit analysis. Challenging the law is expensive, uncertain, and doesn''t address near-term compliance. The business case drives the decision.',
  'Data sovereignty = data must PHYSICALLY be there. Encryption doesn''t change WHERE data lives. Assess cost vs. market value.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q12: D2 / Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  2,
  'data_destruction',
  'An organization is decommissioning 500 laptop hard drives that contained classified government data at the Secret level. The organization wants to reuse the drives in unclassified systems. Which data destruction method would allow the drives to be safely reused while meeting federal requirements for Secret-level media?',
  '["Performing a single-pass overwrite using a DoD-approved wiping utility", "Formatting the drives using the operating system''s built-in format tool", "Encrypting the entire drive and then deleting the encryption keys", "The drives cannot be reused for unclassified systems; they must be physically destroyed when downgrading from Secret classification"]'::jsonb,
  3,
  'For government classified data at the Secret level, NSA/CSS Policy Manual 9-12 and NIST SP 800-88 require physical destruction (degaussing followed by physical destruction, or just physical destruction) when media will be used outside the classified environment. Overwriting is not sufficient for classified data — data remanence concerns at the magnetic level mean overwriting cannot guarantee complete removal. Formatting only removes file system references. Crypto-shredding is not approved for government classified data declassification. Classified media going to lower classification must be destroyed.',
  'CLASSIFIED government data = physical destruction. No shortcuts. You can''t "wipe" Secret-level media for reuse outside.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q13: D2 / Hard / Analyze / First Action — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  2,
  'casb',
  'A CASB deployment reveals that employees across 12 departments are using 47 unauthorized cloud storage services to share work files. The data includes customer PII, financial records, and intellectual property. The IT security team wants to immediately block all unauthorized cloud services. What should the security manager do FIRST?',
  '["Block all 47 unauthorized services immediately and deal with the business impact afterward", "Classify the shadow IT services by risk level and data sensitivity, then work with business units to migrate critical workflows to approved alternatives before blocking high-risk services", "Report the finding to legal counsel and wait for their guidance before taking any action", "Send a company-wide email reminding employees of the acceptable use policy and monitor for compliance"]'::jsonb,
  1,
  'Immediately blocking 47 services that 12 departments depend on would cause massive business disruption and likely push users to even harder-to-detect alternatives. The strategic approach is to classify the risk, understand the business needs driving shadow IT, provide approved alternatives, then block. This ensures business continuity while reducing risk. Waiting for legal delays risk remediation. An email alone provides no enforcement. Risk-based prioritization is the management approach.',
  'Shadow IT = users found a need you didn''t fill. Classify risk, provide alternatives, THEN block. Don''t just cut the cord.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 3 — Security Architecture and Engineering (7 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q14: D3 / Hard / Analyze / Scenario — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  3,
  'pki_certificates',
  'A security team discovers that a certificate authority in their PKI hierarchy has been compromised. The compromised CA had issued certificates for 200 internal web servers and 50 external-facing services. The security team needs to respond. Which aspect of the response is MOST critical to address first?',
  '["Revoke all certificates issued by the compromised CA and publish updated CRLs or OCSP responses immediately to prevent trust of fraudulent certificates", "Generate new key pairs for all 250 services before revoking the compromised CA certificates", "Contact the root CA vendor to request a new intermediate CA certificate", "Notify all external customers that the organization''s certificates may be compromised"]'::jsonb,
  0,
  'When a CA is compromised, the immediate priority is revoking all certificates it issued and publishing updated revocation information. Until certificates are revoked, an attacker with the compromised CA''s private key can issue fraudulent certificates that will be trusted. Generating new keys before revocation leaves the window of trust exploitation open. Getting a new CA cert is important but secondary to stopping trust of compromised certificates. Customer notification comes after the technical response is initiated.',
  'Compromised CA = REVOKE first. Every second those certs are trusted is a second the attacker can forge identities.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q15: D3 / Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  3,
  'cloud_security',
  'An organization is migrating its application stack to the cloud. The application tier will run on IaaS virtual machines, the database will use a PaaS managed database service, and file storage will use a SaaS collaboration platform. Which statement BEST describes the organization''s security responsibilities?',
  '["The organization is responsible for security at all layers across all three service models since it owns the data", "The cloud provider is responsible for all infrastructure security, and the organization only needs to manage user access", "The organization must secure the OS and applications on IaaS VMs, configure database security settings on PaaS, and manage user access and data classification on SaaS", "The organization should apply the same security controls uniformly across all three service models"]'::jsonb,
  2,
  'The shared responsibility model varies by service type. With IaaS, the customer manages everything from the OS up (patching, hardening, application security). With PaaS, the provider manages the OS and runtime, but the customer configures database access controls and security settings. With SaaS, the customer manages user access and data governance. Each model has different responsibility boundaries. Uniform controls ignore these differences. The provider doesn''t handle everything, and customer responsibility varies by model.',
  'IaaS = you manage the MOST. PaaS = provider manages OS/runtime. SaaS = you manage LEAST (just users and data). Responsibility DECREASES up the stack.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q16: D3 / Very Hard / Analyze / Scenario — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  3,
  'key_management',
  'A financial institution uses hardware security modules to protect its master encryption keys. During a routine audit, the auditor discovers that the HSM''s firmware is two major versions behind and has a known vulnerability that could allow key extraction through a side-channel attack. However, updating the firmware requires the HSM to be taken offline for 4 hours, during which no cryptographic operations can be performed. The HSM protects real-time transaction processing that generates $50,000 per hour in revenue. What is the BEST approach?',
  '["Accept the risk of the known vulnerability because the revenue impact of downtime is too high", "Schedule the firmware update during the next quarterly maintenance window in 6 weeks", "Implement compensating controls around the HSM network to reduce side-channel attack risk while planning the update", "Deploy a secondary HSM with updated firmware, migrate cryptographic operations to it, then update the primary HSM with zero transaction downtime"]'::jsonb,
  3,
  'The best approach eliminates both risks — the vulnerability AND the downtime. Deploying a secondary HSM with updated firmware and migrating operations creates high availability while addressing the security issue. Accepting a known key extraction vulnerability in a financial HSM is negligent. Waiting 6 weeks with a published vulnerability is excessive risk. Compensating controls help but don''t fix the root cause. The cost of a second HSM is justified against both the revenue risk and the security risk.',
  'Don''t choose between security and availability — architect for BOTH. Redundancy enables zero-downtime security updates.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q17: D3 / Medium / Apply / Comparison — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  3,
  'security_models',
  'A military classified information system needs to prevent users from writing data to lower security levels, while a banking transaction system needs to prevent unauthorized modifications to financial records. Which pair of security models BEST addresses these two requirements respectively?',
  '["Clark-Wilson for both, as it handles integrity through well-formed transactions", "Bell-LaPadula for the military system (no write-down) and Biba for the banking system (no write-up for integrity)", "Biba for the military system and Bell-LaPadula for the banking system", "Brewer-Nash for the military system and Clark-Wilson for the banking system"]'::jsonb,
  1,
  'Bell-LaPadula''s star property (*-property) prevents writing to lower classification levels (no write-down), directly addressing the military requirement for preventing data leakage to lower clearance levels. Biba''s integrity star property prevents writing to higher integrity levels (no write-up), preventing untrusted data from corrupting trusted financial records. Reversing them confuses confidentiality and integrity models. Clark-Wilson handles integrity through transactions but isn''t the model-level answer. Brewer-Nash handles conflicts of interest.',
  'Bell-LaPadula = Confidentiality (no write DOWN, no read UP). Biba = Integrity (no write UP, no read DOWN). They''re mirrors!',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- FB-Q18: D3 / Medium / Apply / Scenario — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  3,
  'virtualization',
  'A company runs multiple customer tenants on the same physical server using a Type 1 hypervisor. A security researcher publishes a proof-of-concept demonstrating a VM escape vulnerability in the hypervisor version they use. The vendor has released a patch. What is the MOST appropriate immediate response while the patch is being tested?',
  '["Implement micro-segmentation and enhanced monitoring between VMs to detect lateral movement attempts while the patch undergoes testing", "Shut down all virtual machines immediately until the patch is tested and deployed", "Migrate all VMs to physical servers to eliminate the hypervisor attack surface", "Notify all tenant customers and allow them to decide whether to continue operations"]'::jsonb,
  0,
  'While the patch undergoes testing, compensating controls reduce risk without disrupting operations. Micro-segmentation limits lateral movement if a VM escape occurs, and enhanced monitoring enables rapid detection. Shutting down all VMs is a disproportionate business disruption for a proof-of-concept. Migrating to physical servers is impractical and expensive. Tenant notification may be appropriate but doesn''t reduce the technical risk. The patch should be fast-tracked through testing.',
  'Known vuln + patch in testing = COMPENSATE while you test. Don''t shut everything down; add detection and containment.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q19: D3 / Hard / Apply / First Action — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  3,
  'digital_signatures',
  'An organization''s internal audit team discovers that several digitally signed contracts from the past year used SHA-1 for the hash function in the digital signature. The contracts are legally binding and represent $50 million in commitments. The security team confirms that SHA-1 collision attacks are now practical. What should the organization do FIRST?',
  '["Declare all SHA-1 signed contracts invalid and request re-execution with SHA-256", "Immediately revoke all certificates that used SHA-1 signing", "File legal proceedings against the CA that issued SHA-1 certificates", "Assess whether any contracts show signs of tampering, then plan migration to SHA-256 for future signatures while consulting legal counsel on existing contracts"]'::jsonb,
  3,
  'The first step is assessing actual risk — whether any contracts were actually tampered with — before taking disruptive action. Collision attacks being practical doesn''t mean existing signatures were forged. Declaring contracts invalid would cause massive business disruption and may not be legally required. Revoking certificates doesn''t address already-signed documents. Legal proceedings against the CA are premature. The pragmatic approach: assess for actual tampering, migrate future signing to SHA-256, and work with legal counsel on the existing contract portfolio.',
  'Vulnerability ≠ exploitation. ASSESS first, then MIGRATE forward. Don''t nuke existing business over a theoretical risk.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- FB-Q20: D3 / Medium / Analyze / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  3,
  'fire_suppression',
  'A data center operator notices that the pre-action fire suppression system has activated its first stage — the VESDA smoke detection triggered an alarm — but no water has been released. The operator sees no visible smoke or fire. What is the MOST likely explanation?',
  '["The fire suppression system has malfunctioned and needs immediate maintenance", "The VESDA system has a high false positive rate and should be replaced with a less sensitive detector", "The pre-action system is working as designed — VESDA detects smoke particles at very early stages before visible smoke appears, and water is only released when sprinkler heads also activate from heat", "The pipes were not properly pressurized during the last maintenance cycle"]'::jsonb,
  2,
  'Pre-action systems require two triggers: the detection system (VESDA) and individual sprinkler head activation from heat. This dual-trigger design prevents accidental water discharge from either false alarms or broken sprinkler heads alone. VESDA is an aspirating smoke detection system that detects smoke particles at extremely early stages — well before visible smoke or fire. The system is working correctly by alerting early. The operator should investigate the cause of the early-stage particles while the system waits for the second trigger.',
  'Pre-action = TWO triggers needed. Smoke detection fills the pipes; sprinkler heat OPENS them. Protects against false discharge.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 4 — Communication and Network Security (7 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q21: D4 / Hard / Analyze / Scenario — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  4,
  'network_segmentation',
  'A healthcare network architect is redesigning the network to comply with HIPAA requirements. The network currently has a flat topology with all departments — including medical devices, patient registration, billing, and guest Wi-Fi — on the same network segment. After implementing proper segmentation, the architect notices that east-west traffic between the medical device VLAN and the billing VLAN has increased by 300%. What is the MOST likely explanation and concern?',
  '["Medical devices are communicating with billing systems through an application dependency that wasn''t identified during the segmentation planning, and this traffic should be analyzed for necessity and secured", "The network switches are misconfigured and allowing traffic to leak between VLANs", "The increase is normal as segmented networks always show higher inter-VLAN traffic due to routing overhead", "Billing users are deliberately bypassing the segmentation to access medical devices"]'::jsonb,
  0,
  'The most likely explanation is an undiscovered application dependency. Medical devices often communicate with billing systems for procedure coding, patient identification, or insurance verification. Proper segmentation makes this traffic visible for the first time. The concern is that this traffic may contain ePHI traversing segments without appropriate encryption or access controls. Switch misconfiguration would show random traffic, not a 300% increase in a specific pattern. Segmentation doesn''t inherently increase traffic. User bypass is unlikely.',
  'Segmentation reveals hidden dependencies. New visibility into east-west traffic often uncovers surprising application relationships. Document, analyze, secure.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q22: D4 / Medium / Apply / Best Answer — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  4,
  'secure_protocols',
  'An organization is replacing insecure legacy protocols across its infrastructure. Which mapping BEST represents the correct secure replacement for each protocol?',
  '["Telnet→SSH, HTTP→HTTPS, FTP→FTPS, SNMP v1→SNMP v2c", "Telnet→SSH, HTTP→HTTPS, FTP→SFTP, SNMP v1→SNMP v3", "Telnet→RDP, HTTP→HTTPS, FTP→SCP, SNMP v1→SNMP v2c", "Telnet→SSH, HTTP→TLS, FTP→TFTP, SNMP v1→SNMP v3"]'::jsonb,
  1,
  'The correct secure replacements are: Telnet→SSH (encrypted remote access), HTTP→HTTPS (TLS-encrypted web traffic), FTP→SFTP (SSH-based encrypted file transfer), SNMP v1→SNMP v3 (authentication and encryption). SNMP v2c still uses community strings without encryption — not a secure upgrade. RDP is not a Telnet replacement (different protocol entirely). TFTP is less secure than FTP, not a replacement. SCP works but SFTP is the standard replacement. TLS alone isn''t a protocol name for web access.',
  'Secure protocol upgrades: Telnet→SSH, HTTP→HTTPS, FTP→SFTP, SNMPv1→SNMPv3. The ''S'' usually means Secure.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q23: D4 / Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'email_security',
  'Users at a corporation report receiving phishing emails that appear to come from the company''s own domain. The emails pass SPF checks because the sending server is a legitimate cloud email marketing service the company uses. The security team needs to prevent these spoofed emails from reaching users. Which combination of email security controls would BEST address this issue?',
  '["Implement a web application firewall to filter incoming email content", "Deploy end-to-end encryption for all internal email communications", "Add IP-based blocking rules for the cloud marketing service at the mail gateway", "Configure DKIM to cryptographically sign legitimate emails and set a DMARC policy to reject emails that fail both SPF and DKIM alignment"]'::jsonb,
  3,
  'The attack exploits the fact that SPF alone verifies the sending server, not the message sender. DKIM adds cryptographic signing so recipients can verify the email was genuinely sent by the organization. DMARC ties SPF and DKIM together with a policy — emails that fail both checks are rejected. This stops spoofed emails even when they come from SPF-valid servers. A WAF doesn''t handle email. E2E encryption doesn''t prevent spoofing. Blocking the marketing service would break legitimate campaigns.',
  'SPF alone isn''t enough. Add DKIM (signature) + DMARC (policy) = complete email authentication. Three layers work together.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q24: D4 / Very Hard / Analyze / TLATM — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  4,
  'micro_segmentation',
  'As the network security director, your organization is adopting zero trust architecture for its data center. The current perimeter-based model uses traditional VLANs and firewalls. The CTO wants to implement micro-segmentation using software-defined networking. The operations team pushes back, arguing that the complexity will increase outage risk. The compliance team notes that PCI DSS requires network segmentation. How should you frame this initiative to the executive committee?',
  '["Position it as a compliance requirement and emphasize that PCI DSS mandates micro-segmentation specifically", "Focus on the cost savings from eliminating physical firewalls throughout the data center", "Present micro-segmentation as a risk reduction initiative that limits blast radius of breaches, supports compliance requirements, and can be implemented incrementally to manage operational complexity", "Recommend postponing the initiative until the next budget cycle to allow thorough evaluation"]'::jsonb,
  2,
  'The management approach frames the initiative in terms executives understand: risk reduction and business value. Micro-segmentation limits breach blast radius (reducing potential incident costs), supports compliance (PCI DSS requires segmentation, though not micro-segmentation specifically), and can be implemented incrementally to address operations concerns. PCI DSS doesn''t mandate micro-segmentation specifically — misrepresenting requirements damages credibility. Cost savings alone don''t justify the project. Postponing doesn''t address the risk. Incremental implementation manages the operational complexity concern.',
  'Frame security as RISK REDUCTION with BUSINESS VALUE. Address all stakeholder concerns. Incremental implementation manages change risk.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q25: D4 / Medium / Apply / First Action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.6, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'vpn_ipsec',
  'A remote worker reports that their IPsec VPN connection keeps dropping every few minutes when working from a hotel. The VPN uses ESP in transport mode. The worker can browse the internet normally. What should the network administrator check FIRST?',
  '["Whether the hotel Wi-Fi bandwidth is sufficient for VPN traffic", "Whether the hotel network uses NAT, which is incompatible with ESP in transport mode without NAT traversal", "Whether the worker''s laptop firewall is blocking VPN keep-alive packets", "Whether the VPN concentrator has reached its maximum connection limit"]'::jsonb,
  1,
  'ESP (Encapsulating Security Payload) in transport mode modifies the IP header in a way that is incompatible with NAT (Network Address Translation). Hotel networks almost universally use NAT. Without NAT-T (NAT Traversal, which encapsulates ESP in UDP port 4500), ESP packets are dropped or corrupted by NAT devices. The fact that internet browsing works normally confirms network connectivity is fine — it''s specifically the ESP/NAT incompatibility. Bandwidth issues would affect all traffic. Laptop firewalls typically allow established VPN sessions. Connection limits would prevent initial connection.',
  'ESP + NAT = broken. Hotel WiFi = NAT. Enable NAT-T (UDP 4500) to tunnel ESP through NAT. AH is also NAT-incompatible.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- FB-Q26: D4 / Hard / Apply / Scenario — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  4,
  'nac_802_1x',
  'A corporate campus deploys 802.1X port-based authentication on all network switches. After deployment, the facilities team reports that IP phones, security cameras, and building management IoT sensors have lost connectivity. These devices don''t support 802.1X authentication. The security team cannot exempt entire switch ports from authentication without creating gaps. What is the BEST solution?',
  '["Configure MAC Authentication Bypass (MAB) on ports connected to non-802.1X devices, placing them in a restricted VLAN with appropriate access controls", "Replace all non-802.1X devices with models that support 802.1X authentication", "Create a separate physical network for all non-802.1X devices", "Disable 802.1X on all ports and rely on MAC address filtering instead"]'::jsonb,
  0,
  'MAC Authentication Bypass is the standard solution for devices that cannot perform 802.1X authentication. MAB uses the device''s MAC address as its credential, allowing network access while placing the device in a restricted VLAN with limited access. Replacing all devices is prohibitively expensive. A separate physical network adds infrastructure cost and complexity. Disabling 802.1X entirely abandons network access control for all devices. MAB is less secure than 802.1X but provides reasonable assurance when combined with VLAN restriction.',
  'IoT can''t do 802.1X? Use MAB (MAC Authentication Bypass) into a restricted VLAN. Imperfect but practical.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- FB-Q27: D4 / Medium / Analyze / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  4,
  'dns_security',
  'A security analyst notices that a compromised workstation is making hundreds of DNS queries per minute to unusual subdomains like "a3f2b8.data.evil-domain.com" and "x7d1c4.data.evil-domain.com". Each subdomain is unique and the queries contain what appear to be encoded strings. What type of attack is MOST likely occurring?',
  '["DNS cache poisoning to redirect users to malicious websites", "A DNS amplification DDoS attack targeting the evil-domain.com server", "DNS tunneling being used for data exfiltration by encoding stolen data in DNS query subdomains", "A DNS zone transfer attempt to enumerate all records in the evil-domain.com zone"]'::jsonb,
  2,
  'DNS tunneling encodes data in DNS queries, typically as subdomains. Each unique subdomain query carries a chunk of exfiltrated data encoded in the subdomain string. This technique bypasses most firewalls because DNS (port 53) is almost always allowed outbound. The pattern of hundreds of unique subdomain queries with encoded-looking strings is the classic indicator. Cache poisoning involves manipulating DNS responses, not generating outbound queries. DDoS amplification uses open resolvers. Zone transfers are server-to-server operations.',
  'Unique subdomain queries with encoded strings = DNS TUNNELING for exfiltration. DNS is allowed everywhere, making it a favorite covert channel.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 5 — Identity and Access Management (6 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q28: D5 / Hard / Analyze / Scenario — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'access_control_attacks',
  'A security team detects that an attacker has obtained a Kerberos Ticket Granting Ticket by compromising the KRBTGT account hash from a domain controller. The attacker can now create tickets for any user, including domain administrators, with any lifetime they choose. What type of attack has occurred, and what is the PRIMARY remediation challenge?',
  '["Silver ticket attack; the challenge is identifying which service accounts were compromised", "Pass-the-hash attack; the challenge is resetting all user passwords in the domain", "Kerberoasting attack; the challenge is changing all service principal names", "Golden ticket attack; the challenge is that the KRBTGT password must be reset twice to fully invalidate the attacker''s forged tickets"]'::jsonb,
  3,
  'Compromising the KRBTGT hash enables golden ticket creation — the attacker can forge Ticket Granting Tickets for any identity with any permissions and expiration. The unique remediation challenge is that KRBTGT has two password versions stored in Active Directory. A single reset only invalidates one version; the attacker can still use tickets based on the previous version. Two consecutive resets are required, spaced apart, to fully invalidate all golden tickets. Silver tickets target specific services. Pass-the-hash uses user hashes. Kerberoasting cracks service account tickets.',
  'KRBTGT compromise = GOLDEN ticket. Reset KRBTGT TWICE (it keeps 2 password versions). Golden > Silver in scope and power.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q29: D5 / Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  5,
  'zero_trust',
  'An organization implementing zero trust architecture is evaluating how to handle access decisions for internal applications. Currently, any user on the corporate network can access most internal applications. Which approach BEST aligns with zero trust principles?',
  '["Every access request must be evaluated based on user identity, device health, location, and behavior regardless of network position, with continuous verification throughout the session", "Users authenticated to the corporate VPN should be trusted for all internal application access during their session", "Role-based access controls should be implemented, granting users access based solely on their job title", "Network segmentation into trusted and untrusted zones with a traditional perimeter firewall between them"]'::jsonb,
  0,
  'Zero trust''s core principle is "never trust, always verify." Every access request must be evaluated regardless of network location. The evaluation considers multiple signals: identity, device posture, behavior patterns, and context. Continuous verification means trust is reassessed throughout the session, not just at login. VPN-based trust is exactly the perimeter model zero trust replaces. RBAC alone ignores device health and context. Network zones with perimeter firewalls are traditional security, not zero trust.',
  'Zero Trust = Never trust, always verify. EVERY request evaluated. Identity + Device + Context + Behavior = continuous decision.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q30: D5 / Very Hard / Analyze / Scenario — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'sso_federation',
  'A large enterprise uses SAML-based SSO for all cloud applications. During a security assessment, the team discovers that the identity provider''s SAML assertion signing certificate expires in 7 days. The IdP serves 15,000 users across 40 service providers. The team needs to rotate the certificate. What is the MOST critical risk if the certificate rotation is mishandled?',
  '["Users will see browser certificate warnings when accessing cloud applications", "All federated SSO will break simultaneously — 15,000 users locked out of 40 applications — if any service provider doesn''t update its trust configuration with the new certificate before the old one expires", "The SAML assertions will continue to work but without signature verification", "Only the identity provider will be affected; service providers will continue to accept assertions"]'::jsonb,
  1,
  'SAML federation depends on service providers trusting the identity provider''s signing certificate. When the IdP certificate changes, every SP must update its trust configuration with the new certificate. If any SP is missed or the timing is wrong, that SP will reject all SAML assertions — locking users out of that application. With 40 SPs, the coordination complexity is enormous. Browser warnings relate to TLS certificates, not SAML signing. SPs cannot process unsigned assertions. Both IdP and SPs are affected because trust is bidirectional.',
  'SAML cert rotation = update ALL service providers. Miss one SP = that app is locked out. Coordinate carefully with overlap period.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q31: D5 / Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  5,
  'biometrics',
  'A government facility is evaluating biometric authentication systems for its secure area entrance. The security officer wants to minimize the risk of unauthorized persons gaining access, even if it means some authorized employees will occasionally be denied entry. Which biometric system configuration should the security officer select?',
  '["A system tuned for a low Crossover Error Rate to balance security and convenience", "A system tuned for a high False Acceptance Rate to ensure quick throughput", "A system tuned for a low False Acceptance Rate, accepting a higher False Rejection Rate as a trade-off", "A system tuned for a low False Rejection Rate to minimize employee inconvenience"]'::jsonb,
  2,
  'The security officer prioritizes preventing unauthorized access (low FAR) over convenience (accepting higher FRR). False Acceptance Rate measures how often the system incorrectly accepts unauthorized users — lowering this directly reduces unauthorized access. The trade-off is a higher False Rejection Rate, meaning authorized employees will occasionally be rejected and need to retry. A low CER balances both but doesn''t prioritize security. High FAR is the opposite of the requirement. Low FRR prioritizes convenience over security.',
  'High security = low FAR (don''t let bad guys in). High convenience = low FRR (don''t lock good guys out). CER is the balance point.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q32: D5 / Hard / Analyze / First Action — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  5,
  'identity_lifecycle',
  'During a quarterly access review, an auditor discovers 340 active accounts belonging to employees who left the organization between 3 and 18 months ago. Several of these orphaned accounts have VPN access and elevated database permissions. What should the IAM team do FIRST?',
  '["Generate a detailed report of all orphaned accounts and present it to management for review", "Immediately disable all 340 orphaned accounts and revoke their VPN and database access", "Investigate whether any of the orphaned accounts show signs of unauthorized usage before taking action", "Update the offboarding procedure to prevent this from happening in the future"]'::jsonb,
  1,
  'With 340 accounts having VPN and elevated database access for up to 18 months after employee departure, the immediate priority is eliminating the active threat by disabling all accounts. This stops any potential unauthorized access immediately. Investigation of usage patterns is important but secondary — you close the unlocked doors first, then check if anyone walked through them. Generating a report delays remediation. Updating procedures prevents recurrence but doesn''t address the existing 340-account exposure.',
  'Orphaned accounts = unlocked doors. DISABLE first, investigate second, fix the process third. Stop the bleeding immediately.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
),

-- FB-Q33: D5 / Medium / Apply / Comparison — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.4, a = 1.3 + 0.1 = 1.4, c = 0.22
(
  5,
  'radius_tacacs',
  'A network administrator is choosing between RADIUS and TACACS+ for managing access to 200 network devices. The security requirements include: encrypting the full authentication session, separate authorization for different command levels on switches, and detailed accounting of all commands executed. Which protocol BEST meets these requirements?',
  '["RADIUS, because it is the industry standard for network device authentication", "RADIUS, because it combines authentication and authorization into a single efficient process", "TACACS+, because it uses UDP for faster performance in network device environments", "TACACS+, because it encrypts the entire packet payload, separates AAA functions independently, and supports per-command authorization"]'::jsonb,
  3,
  'TACACS+ meets all three requirements: it encrypts the entire packet payload (RADIUS only encrypts the password), separates authentication, authorization, and accounting as independent functions (allowing granular per-command authorization), and provides detailed command-level accounting. RADIUS combines authn/authz, making per-command authorization impossible. RADIUS being the standard for network access doesn''t address the specific requirements. TACACS+ uses TCP (port 49), not UDP — RADIUS uses UDP.',
  'TACACS+ = full encryption + separate AAA + per-command auth. RADIUS = password-only encryption + combined authn/authz. Cisco devices prefer TACACS+.',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 6 — Security Assessment and Testing (6 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q34: D6 / Hard / Analyze / Scenario — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  6,
  'penetration_testing',
  'A penetration testing team completes a white-box test of a financial application and reports finding a critical SQL injection vulnerability. The development team claims the finding is a false positive because their WAF blocks all SQL injection attempts. The pen testers demonstrate that the vulnerability is exploitable by using encoding techniques to bypass the WAF. However, the development team argues that in a real attack scenario, the WAF would be tuned to catch these encoding variations. What is the MOST appropriate resolution?',
  '["The SQL injection vulnerability must be fixed in the application code regardless of WAF protection, because defense in depth requires fixing root causes rather than relying on compensating controls that can be bypassed", "Accept the WAF as adequate mitigation and close the finding since the WAF will be tuned to catch the bypass", "Classify the finding as informational since the WAF provides sufficient protection in the production environment", "Conduct a black-box test to verify whether the vulnerability is exploitable without knowledge of the WAF configuration"]'::jsonb,
  0,
  'Defense in depth requires fixing vulnerabilities at their source. A WAF is a compensating control that can be bypassed — the pen test demonstrated this. Relying solely on a WAF means a single control failure leads to exploitation. The application code is the root cause and must be fixed. Accepting the WAF alone violates secure coding principles. Informational classification understates a critical finding. A black-box test doesn''t change the underlying vulnerability. Fix the code AND keep the WAF for defense in depth.',
  'WAF is a BANDAID, not a cure. Fix the ROOT CAUSE in code. Defense in depth = fix the vuln AND keep the compensating control.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q35: D6 / Medium / Apply / Best Answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  6,
  'sast_dast_iast',
  'A DevSecOps team wants to integrate security testing into their CI/CD pipeline. The application processes credit card data and must comply with PCI DSS. They need testing that can find vulnerabilities early in development and also test the running application. Which testing strategy BEST achieves comprehensive coverage?',
  '["Run DAST in production only, since it tests the real application environment", "Run SAST before every commit to catch all vulnerabilities before deployment", "Integrate SAST in the build pipeline to catch code-level vulnerabilities early, and DAST in the staging environment to find runtime and configuration issues before production", "Run IAST in development only, which combines the benefits of both SAST and DAST"]'::jsonb,
  2,
  'Combining SAST and DAST provides comprehensive coverage. SAST analyzes source code during build, catching injection flaws, hardcoded secrets, and insecure patterns before deployment. DAST tests the running application in staging, finding runtime vulnerabilities like misconfigurations, authentication flaws, and issues that only manifest in the deployed state. DAST in production risks disruption. SAST alone misses runtime issues. IAST is valuable but development-only testing misses staging environment configurations. The combination covers both code and runtime.',
  'SAST in BUILD (see the code). DAST in STAGING (see the app). Together = comprehensive pipeline security.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q36: D6 / Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'soc_reports',
  'An organization is evaluating a cloud service provider for hosting its financial application. The provider offers a SOC 2 Type I report from last month. The organization''s auditor says this is insufficient and requests a SOC 2 Type II report. Why is the Type II report preferred?',
  '["Type II covers a broader scope of trust service criteria than Type I", "Type II is more recent and therefore reflects the current security posture", "Type II is required by law for all cloud providers handling financial data", "Type II evaluates controls over a period of time, demonstrating consistent operational effectiveness rather than just point-in-time design adequacy"]'::jsonb,
  3,
  'SOC 2 Type I evaluates control design at a specific point in time — it confirms controls exist and are suitably designed. SOC 2 Type II evaluates the same controls but over a period (typically 6-12 months), demonstrating that controls operate effectively over time. A control might be designed well but not consistently followed — Type II catches this. Both types cover the same trust service criteria. Type II is not legally required. Recency alone is not the differentiator — the testing period is.',
  'Type I = designed RIGHT (one day snapshot). Type II = WORKS right over time (6-12 months). Type II proves operational effectiveness.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q37: D6 / Very Hard / Analyze / TLATM — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  6,
  'security_metrics',
  'As the CISO, you are presenting security metrics to the board of directors. Your team tracks MTTD (Mean Time to Detect) and MTTR (Mean Time to Respond) for security incidents. Over the past year, MTTD decreased from 45 days to 12 days while MTTR increased from 3 days to 7 days. The CFO questions why response time is getting worse. What is the BEST way to explain this to the board?',
  '["Acknowledge that the response team needs additional training to improve their speed", "Explain that faster detection means finding more complex, deeply embedded threats that inherently require longer investigation and remediation, and that the combined dwell time dropped from 48 to 19 days — a 60% improvement in total exposure", "Request additional budget for automated response tools to reduce MTTR back to 3 days", "Propose hiring additional incident responders to reduce the workload per analyst"]'::jsonb,
  1,
  'This is a classic metrics interpretation challenge. The improved MTTD means the organization is now detecting sophisticated threats that previously went unnoticed for 45+ days. These complex threats naturally require more investigation time, increasing MTTR. The key metric for the board is TOTAL DWELL TIME (MTTD + MTTR), which dropped from 48 to 19 days — a dramatic improvement. Admitting the team needs training concedes a problem that doesn''t exist. Budget requests and hiring may be needed but don''t answer the question. Context is everything in security metrics.',
  'Board metrics: focus on TOTAL DWELL TIME, not individual components. Better detection of harder threats = longer response is EXPECTED.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q38: D6 / Hard / Apply / First Action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.1, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  6,
  'cve_cvss',
  'A vulnerability scan returns 2,400 findings across the organization''s infrastructure. The security team has limited resources and cannot address all findings simultaneously. The findings include: 15 critical CVSS 9.0+ with known exploits, 200 high CVSS 7.0-8.9, 800 medium CVSS 4.0-6.9, and 1,385 low/informational. What should the team do FIRST?',
  '["Prioritize the 15 critical findings with known exploits for immediate remediation, as they represent the highest risk of active exploitation", "Create a remediation plan that addresses all 2,400 findings in CVSS score order over the next quarter", "Focus on the 800 medium findings first since they represent the largest group by volume", "Re-scan the environment to validate the findings before taking any remediation action"]'::jsonb,
  0,
  'With limited resources, risk-based prioritization is essential. The 15 critical findings with known exploits represent imminent, exploitable threats. CVSS score combined with exploit availability creates the highest risk category. Addressing all 2,400 sequentially is unrealistic and delays critical fixes. Volume-based prioritization ignores severity. Re-scanning delays remediation of known critical vulnerabilities. The threat intelligence context (known exploits) elevates priority beyond CVSS score alone.',
  'CVSS + Known Exploit = patch NOW. Limited resources = risk-based prioritization. Critical with exploits first, always.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- FB-Q39: D6 / Medium / Analyze / Most Likely — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  6,
  'fuzz_testing',
  'A software testing team runs a fuzz testing tool against an API endpoint for two weeks. The tool generates millions of malformed inputs but finds zero crashes or unexpected behaviors. The development team concludes the API is secure. What is the MOST likely issue with this conclusion?',
  '["The fuzz testing tool is malfunctioning and not actually sending malformed inputs", "The API has been hardened by a previous security review, making it truly immune to fuzzing attacks", "The fuzzer may be using mutation-based fuzzing that doesn''t understand the API''s input grammar, generating inputs that are rejected by basic parsing before reaching deeper logic", "The two-week testing window was insufficient and the testing should continue for at least 90 days"]'::jsonb,
  2,
  'A mutation-based fuzzer randomly modifies valid inputs without understanding the input format. For structured APIs (JSON, XML, protocol buffers), most mutated inputs fail basic parsing and never exercise deeper application logic. A generational (grammar-based) fuzzer that understands the input structure would be more effective. Zero findings doesn''t mean zero vulnerabilities — it means the testing approach may not have sufficient coverage. The tool functioning correctly doesn''t mean it''s testing effectively. Time alone doesn''t solve input quality issues.',
  'Fuzzing results depend on INPUT QUALITY. Mutation fuzzing = random. Generational fuzzing = smart. Zero findings ≠ zero bugs.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 7 — Security Operations (6 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q40: D7 / Hard / Analyze / Scenario — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'chain_of_custody',
  'During a criminal investigation into insider trading, a forensic analyst creates a bit-for-bit image of a suspect''s hard drive. The analyst generates MD5 and SHA-256 hashes of both the original drive and the forensic image, confirming they match. Six months later at trial, the defense attorney argues the evidence should be excluded. The attorney presents evidence that the chain of custody log has a 4-hour gap where no custodian was documented. The hashes still match. Should the evidence be admitted?',
  '["Yes, because the matching hashes prove the evidence was not tampered with regardless of custody gaps", "Yes, because digital evidence does not require the same chain of custody as physical evidence", "No, because MD5 is known to have collision vulnerabilities, making the hash verification unreliable", "The court may exclude it because chain of custody must be maintained continuously — matching hashes support integrity but do not replace the legal requirement for documented, unbroken custody"]'::jsonb,
  3,
  'Chain of custody and data integrity serve different legal purposes. Hashes verify the data wasn''t modified, but chain of custody documents WHO had access and WHEN. A custody gap means the evidence was potentially accessible to unknown parties during those 4 hours. Even though hashes prove no modification occurred, the defense can argue the gap creates reasonable doubt about the evidence''s handling. Courts may still admit it with the hash as supporting evidence, but the custody gap weakens the case. The hash doesn''t replace the custody requirement.',
  'Hashes prove INTEGRITY. Chain of custody proves HANDLING. Both are needed. A gap in custody ≠ tampering, but it weakens the legal case.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q41: D7 / Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  7,
  'recovery_sites',
  'An organization is selecting a disaster recovery site. The RTO from the BIA is 4 hours and the RPO is 15 minutes. The organization processes real-time financial transactions. Which recovery site type BEST meets these requirements?',
  '["A hot site with real-time data replication, pre-configured systems, and the ability to begin operations within 1-2 hours of activation", "A warm site with daily backup restoration capability and a 12-24 hour activation time", "A cold site with network connectivity and power, requiring 48-72 hours to procure and install equipment", "A mobile site that can be deployed to any location within 8-12 hours"]'::jsonb,
  0,
  'With a 4-hour RTO and 15-minute RPO, only a hot site meets both requirements. Hot sites maintain real-time or near-real-time data replication (meeting the 15-minute RPO) and can begin operations within hours (meeting the 4-hour RTO). A warm site with daily backups would lose up to 24 hours of data, violating the 15-minute RPO. A cold site''s 48-72 hour activation far exceeds the 4-hour RTO. A mobile site''s deployment time also exceeds the RTO.',
  'Match the site to the metrics: Hot site = hours RTO, minutes RPO. Warm = day RTO, hours RPO. Cold = days RTO, day RPO.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q42: D7 / Very Hard / Analyze / First Action — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.3 = 3.0, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  7,
  'incident_response',
  'A hospital''s SIEM detects ransomware actively encrypting files on a network share used by the radiology department. The affected share contains current patient imaging studies needed for ongoing surgeries. Surgeons report they cannot access critical images for a patient currently under anesthesia. The backup system has yesterday''s images. What should the incident response team do FIRST?',
  '["Restore the entire network share from yesterday''s backup immediately", "Isolate the infected system to stop the encryption spread, then restore the specific critical patient files from backup to enable the surgery to proceed", "Pay the ransom to decrypt the files since a patient''s life is at immediate risk", "Shut down the entire hospital network to prevent the ransomware from spreading further"]'::jsonb,
  1,
  'Life safety is the top priority. The response must balance stopping the attack with enabling the critical surgery. Isolating the infected system stops the ransomware spread while minimizing disruption. Restoring the specific patient files needed for the active surgery addresses the immediate life-safety concern. A full share restore takes too long for the patient under anesthesia. Paying ransom is never recommended and doesn''t guarantee decryption. Shutting down the entire network disrupts all hospital operations including life-critical systems beyond just this surgery.',
  'LIFE SAFETY first, always. Contain the threat, restore what''s needed for the patient. Surgical precision in incident response.',
  'analyze',
  'first_action',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q43: D7 / Medium / Apply / Scenario — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'raid_levels',
  'A database administrator needs to configure storage for a high-transaction OLTP database that requires both fast write performance and fault tolerance. The database performs many small random writes throughout the day. The administrator has 6 identical drives available. Which RAID configuration provides the BEST balance of write performance and redundancy for this workload?',
  '["RAID 5, which distributes parity across all drives for good read performance", "RAID 1, which mirrors two drives for simple redundancy", "RAID 10, which combines striping and mirroring for fast writes with drive failure tolerance", "RAID 6, which uses double distributed parity for maximum fault tolerance"]'::jsonb,
  2,
  'RAID 10 is optimal for OLTP databases with heavy random writes. It stripes across mirrored pairs, providing fast write performance because writes go to two drives simultaneously (no parity calculation). RAID 5 suffers from the write penalty — every write requires reading old data, reading old parity, calculating new parity, and writing both — making it 4 I/O operations per write. RAID 1 with only 2 drives provides minimal capacity. RAID 6 has an even worse write penalty than RAID 5 with double parity calculations.',
  'RAID 10 for DATABASES (writes!). RAID 5 for FILE SERVERS (reads). Write-heavy = avoid parity overhead.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q44: D7 / Medium / Analyze / Comparison — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.7, a = 1.5 + 0.1 = 1.6, c = 0.22
(
  7,
  'drp_testing',
  'What is the PRIMARY advantage of a tabletop exercise over a simulation test for disaster recovery plan validation?',
  '["A tabletop exercise validates the plan with minimal cost and operational risk by walking through scenarios verbally, making it ideal for initial plan validation and identifying gaps in roles and communication", "A tabletop exercise provides more realistic results because participants physically perform recovery procedures", "A tabletop exercise is more comprehensive because it tests both technical and communication aspects simultaneously", "A tabletop exercise takes longer but provides higher confidence in the plan''s effectiveness"]'::jsonb,
  0,
  'Tabletop exercises gather decision-makers around a table to walk through disaster scenarios verbally, discussing roles, responsibilities, and responses. Their primary advantage is low cost and zero operational risk — no systems are affected. They excel at identifying communication gaps, unclear responsibilities, and decision-making bottlenecks. Simulation tests actually activate recovery procedures, providing more realistic validation but with greater cost and risk. Tabletop exercises don''t physically test procedures — that''s what simulations do. They''re typically shorter, not longer.',
  'Tabletop = TALK through it (cheap, safe, finds gaps). Simulation = DO it (expensive, realistic, validates procedures). Start with tabletop.',
  'analyze',
  'comparison',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- FB-Q45: D7 / Hard / Apply / Scenario — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.0, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  7,
  'backup_strategies',
  'An organization performs full backups Sunday night and incremental backups Monday through Saturday. A server crash occurs on Thursday afternoon and the system must be restored. The backup administrator discovers that Wednesday''s incremental backup tape has a read error and is unusable. What is the MOST appropriate recovery approach?',
  '["Restore only from Sunday''s full backup, accepting the loss of Monday through Thursday''s data", "Restore from Sunday''s full backup plus Monday''s and Tuesday''s incremental backups, accepting the loss of Wednesday and Thursday''s data", "Switch to differential backups going forward and accept the data loss for this incident", "Restore from Sunday''s full backup, apply Monday''s and Tuesday''s incremental backups, skip the corrupted Wednesday tape, then apply Thursday''s incremental if it exists — though any data changed only on Wednesday is lost"]'::jsonb,
  3,
  'Incremental backups capture only changes since the last backup. The restore requires: Sunday full (baseline) + Monday incremental + Tuesday incremental + Wednesday incremental + Thursday incremental. With Wednesday''s tape corrupted, you skip it but can still apply Thursday''s backup. Data that was only changed on Wednesday (and not modified again on Thursday) will be lost, but all Monday, Tuesday, and Thursday changes are recoverable. Stopping at Tuesday unnecessarily loses Thursday''s changes.',
  'Incremental restore: Full + each day IN ORDER. Missing a day? Skip it, continue — you only lose that day''s unique changes.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- DOMAIN 8 — Software Development Security (5 questions)
-- ═══════════════════════════════════════════════════════════

-- FB-Q46: D8 / Hard / Analyze / Scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.3, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  8,
  'owasp_top_10',
  'A web application security assessment reveals that the application constructs SQL queries by directly concatenating user input from form fields. The development team argues that their web application firewall blocks all known SQL injection patterns. A senior developer also notes they validate input length on the client side. The security team insists the code must be changed. Who is correct, and why?',
  '["The development team is correct — the WAF combined with input validation provides adequate protection", "The security team is correct — parameterized queries must be used because WAFs can be bypassed, client-side validation can be circumvented, and defense in depth requires fixing the root cause in code", "Both are partially correct — the WAF is sufficient for now but parameterized queries should be added in the next development cycle", "The security team is overreacting — SQL injection is a well-understood attack and modern WAFs can prevent it completely"]'::jsonb,
  1,
  'The security team is correct. String concatenation for SQL queries is the root vulnerability. WAFs are a compensating control that can be bypassed through encoding, obfuscation, and novel attack patterns. Client-side validation is trivially bypassed by modifying requests directly. Parameterized queries prevent SQL injection at the code level by separating data from commands — the input physically cannot be interpreted as SQL code. This is defense in depth: fix the code AND keep the WAF. No WAF provides complete protection against all injection variants.',
  'Parameterized queries = the CURE for SQL injection. WAFs and validation = BANDAIDS. Fix the root cause in code, always.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- FB-Q47: D8 / Medium / Apply / Best Answer — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.3, a = 1.3 + 0.0 = 1.3, c = 0.20
(
  8,
  'development_methodologies',
  'An organization needs to develop a critical healthcare application with strict regulatory requirements. Requirements are well-documented and unlikely to change. The application must pass FDA validation before deployment. Which development methodology BEST fits this project?',
  '["Waterfall, because its sequential phases with formal documentation and gate reviews align with regulatory validation requirements", "Agile Scrum, because its iterative sprints allow for rapid adaptation to changing requirements", "DevOps, because continuous integration and deployment accelerates time to market", "Spiral, because its risk-driven approach is best for projects with uncertain requirements"]'::jsonb,
  0,
  'Waterfall is ideal for projects with stable requirements and regulatory validation needs. Its sequential phases (Requirements, Design, Implementation, Testing, Deployment) with formal documentation at each gate align with FDA validation processes that require traceable requirements, design documents, and test evidence. Agile''s strength — adapting to changing requirements — isn''t needed here. DevOps accelerates delivery but doesn''t address regulatory documentation. Spiral is for uncertain requirements, which contradicts the stated scenario.',
  'Stable requirements + regulatory validation = WATERFALL. Changing requirements + speed = AGILE. Match methodology to project characteristics.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- FB-Q48: D8 / Very Hard / Analyze / TLATM — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.0, a = 1.5 + 0.4 = 1.9, c = 0.20
(
  8,
  'devsecops',
  'As the VP of Engineering, your organization''s CI/CD pipeline currently has no security gates. The security team wants to add SAST, DAST, SCA, container scanning, and secrets detection to every pipeline run. The development team pushes back, saying adding five security scans will increase build times from 10 minutes to 45 minutes, destroying developer productivity. How should you resolve this conflict?',
  '["Side with the development team and skip security scanning to maintain productivity", "Side with the security team and mandate all five scans in every pipeline run regardless of build time impact", "Implement a tiered approach: fast scans (secrets detection, SCA) run on every commit, SAST runs on pull requests, and DAST plus container scanning run nightly or on release candidates", "Hire more security engineers to manually review code instead of automated scanning"]'::jsonb,
  2,
  'The tiered approach balances security and productivity by matching scan frequency to speed and impact. Secrets detection and SCA are fast (seconds) and critical for every commit. SAST takes longer but catches code-level issues — running on PRs catches problems before merge without blocking every commit. DAST and container scanning are slowest and most appropriate for nightly builds or release candidates. This delivers comprehensive coverage without destroying the developer feedback loop. Skipping security is negligent. Mandating everything on every commit is impractical. Manual review doesn''t scale.',
  'Security scanning = TIERED by speed. Fast scans on every commit, medium on PRs, slow on nightly/release. Don''t block developers unnecessarily.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- FB-Q49: D8 / Medium / Apply / Scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.5, a = 1.3 + 0.2 = 1.5, c = 0.20
(
  8,
  'database_security',
  'A database developer is designing a medical records system. Different user groups need access to different subsets of patient data: doctors see all fields, nurses see vitals and medications but not billing, and billing staff see insurance and payment information but not clinical notes. The developer wants a solution that enforces these restrictions at the database level. Which approach is MOST appropriate?',
  '["Create separate database tables for each user group with only the fields they need", "Implement application-level access checks that filter query results before displaying to users", "Encrypt the restricted fields and only provide decryption keys to authorized user groups", "Create database views for each role that expose only the permitted columns and grant access to the views instead of the base tables"]'::jsonb,
  3,
  'Database views provide virtual tables that expose only specific columns (and optionally rows) from base tables. By creating role-specific views and granting access to views rather than base tables, access control is enforced at the database level. This is more secure than application-level checks because it protects against direct database access and SQL tools. Separate tables create data duplication and consistency issues. Application-level checks don''t protect against direct database queries. Field-level encryption is complex and doesn''t restrict what users can query.',
  'Views = virtual tables for ACCESS CONTROL. Show different columns to different roles. Database-level enforcement beats application-level.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- FB-Q50: D8 / Hard / Analyze / First Action — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.3 = 2.4, a = 1.5 + 0.2 = 1.7, c = 0.20
(
  8,
  'secure_sdlc',
  'A security audit of a major e-commerce platform reveals that the development team has been deploying code directly to production without security testing for the past 18 months. The codebase has grown to 2 million lines of code across 15 microservices. Management wants all security issues found and fixed before the next release in 30 days. What should the security team recommend FIRST?',
  '["Conduct a comprehensive manual code review of all 2 million lines before the next release", "Perform risk-based triage by running automated SAST/SCA scans across all services, prioritize critical findings in customer-facing payment services first, and establish security gates for all future deployments", "Halt all development and releases until a complete security assessment is finished", "Hire an external penetration testing firm to test all 15 microservices simultaneously"]'::jsonb,
  1,
  'With 18 months of security debt across 2M lines and only 30 days, a risk-based approach is essential. Automated SAST/SCA provides broad coverage quickly, identifying the most critical issues. Prioritizing payment-facing services focuses limited time on the highest-risk areas. Establishing security gates prevents further debt accumulation. Manual review of 2M lines is impossible in 30 days. Halting development is disproportionate business disruption. External pen testing finds symptoms but doesn''t address the code-level root causes or establish ongoing processes.',
  '18 months of debt can''t be fixed in 30 days. TRIAGE: automate scanning, prioritize by risk, fix critical first, gate future releases.',
  'analyze',
  'first_action',
  'hard',
  1.70, 2.40, 0.20,
  'ai_generated', true
);

-- ═══════════════════════════════════════════════════════════
-- END OF FINAL BOSS QUESTION BANK (50 questions)
-- Domain distribution: D1=8, D2=5, D3=7, D4=7, D5=6, D6=6, D7=6, D8=5
-- ═══════════════════════════════════════════════════════════
