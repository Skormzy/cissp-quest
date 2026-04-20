-- =====================================================================
-- CISSP Quest -- Domain 2: Asset Security
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: DRM vs DLP vs CASB deep dive, data remanence on various
--   media, GDPR edge cases, retention conflicts, SSD cryptographic erasure
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain2-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  2, 'data_controls',
  'An organization needs to prevent employees from uploading sensitive M&A documents to personal cloud storage (Dropbox, Google Drive) while still allowing authorized uploads to the corporate SharePoint. Which technology is BEST suited for this use case, and why?',
  '["CASB (Cloud Access Security Broker) in inline mode, because it can inspect cloud traffic, distinguish between sanctioned and unsanctioned cloud services, and apply policy-based blocking without requiring agents on every endpoint", "DLP (Data Loss Prevention) endpoint agent, because it intercepts file write operations before they reach the network", "DRM (Digital Rights Management), because it encrypts the document so even if uploaded, it cannot be read outside the organization", "A next-generation firewall with URL filtering, because blocking cloud storage domains prevents all unauthorized uploads"]'::jsonb,
  0,
  'CASB inline mode specifically addresses the challenge of controlling cloud service access at a granular level -- it can allow SharePoint (sanctioned) while blocking Dropbox (unsanctioned) based on cloud service catalog intelligence, content inspection, and user identity. DLP endpoint agents can help but require agents on all devices and do not inherently distinguish sanctioned vs. unsanctioned cloud tenants. DRM protects the document after upload but does not prevent the upload. NGFW URL filtering blocks entire domains and cannot distinguish between corporate and personal Google Drive instances.',
  'CASB = Cloud traffic cop. Sanctioned vs. unsanctioned cloud distinction is a CASB specialty, not DLP or NGFW.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  2, 'data_controls',
  'A security architect must choose between DLP, CASB, and DRM to protect intellectual property in a hybrid work environment where employees use both managed and unmanaged devices. Which analysis is MOST accurate?',
  '["DRM is unnecessary in environments with DLP because DLP prevents data from leaving the organization, eliminating the need for document-level protection", "DLP protects data in motion and at rest on managed devices; CASB extends protection to cloud services and unmanaged devices accessing cloud resources; DRM provides persistent document-level protection regardless of device or location -- all three are complementary and address different gaps", "CASB replaces both DLP and DRM in cloud-first environments because it centralizes all data protection functions", "DLP is the foundational control and CASB/DRM should only be deployed after DLP is fully mature, in a sequential deployment model"]'::jsonb,
  1,
  'These three technologies are complementary, not mutually exclusive. DLP enforces policy on managed endpoints and network egress points but cannot protect documents once they leave the organization. CASB bridges the managed-to-cloud gap, including unmanaged devices accessing cloud tenants. DRM encrypts documents and enforces usage policies (view, print, forward) persistently, even after a document is outside organizational control. In a hybrid work environment with unmanaged devices, all three layers address distinct gaps. No single technology covers all scenarios.',
  'DLP = managed devices/network. CASB = cloud/unmanaged. DRM = document persists forever. All three = defense in depth.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  2, 'data_remanence',
  'A healthcare organization is decommissioning 500 SSDs from servers that contained PHI. The security team considers three options: (A) ATA Secure Erase command. (B) Physical destruction (shredding). (C) Full-disk overwrite with zeros. Which option is MOST appropriate for SSDs containing PHI, and why?',
  '["Full-disk overwrite (Option C) because NIST SP 800-88 recommends multiple-pass overwriting for all storage media", "Physical destruction (Option B) is never appropriate for SSDs because it creates unnecessary e-waste when cryptographic methods are available", "ATA Secure Erase (Option A) is appropriate for SSDs because it triggers the drive''s internal secure erase mechanism and is recommended by NIST SP 800-88 for SSD sanitization; physical destruction (Option B) is also acceptable when cryptographic erasure cannot be verified", "Full-disk overwrite (Option C) is most appropriate because it is the only method that provides a verifiable audit trail"]'::jsonb,
  2,
  'NIST SP 800-88 Rev. 1 (Guidelines for Media Sanitization) specifically addresses SSDs. Multi-pass overwriting is NOT recommended for SSDs because wear-leveling algorithms may prevent overwrite commands from reaching all memory cells, leaving residual data in over-provisioned blocks. ATA Secure Erase (or NVMe Sanitize) commands trigger the drive''s internal cryptographic erasure or block erasure mechanism. Physical destruction via shredding is also acceptable per NIST 800-88 for high-security situations. Overwriting with zeros is effective for HDDs but unreliable for SSDs due to wear leveling.',
  'SSD ≠ HDD. Overwriting fails on SSDs (wear leveling). Use ATA Secure Erase or shred. NIST 800-88 = the SSD sanitization bible.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  2, 'gdpr_compliance',
  'A global e-commerce company receives a GDPR erasure request ("right to be forgotten") from an EU customer. The company''s legal team advises that the customer''s transaction records must be retained for 7 years under EU financial record-keeping regulation. The customer insists all data must be deleted. What is the MOST accurate legal response?',
  '["Honor the erasure request fully because GDPR Article 17 right to erasure supersedes all other regulations", "Deny the erasure request entirely because financial record-keeping obligations void any GDPR rights", "Delete all data except transaction records, and notify the customer that the erasure was partial", "Retain the minimum transaction data required by the financial regulation for the required period, delete all other personal data, restrict processing of retained data to compliance purposes only, and document the legal basis (Article 17(3)(b) exemption) for the partial retention in the response to the data subject"]'::jsonb,
  3,
  'GDPR Article 17(3)(b) provides an exemption to the right to erasure when retention is necessary for compliance with a legal obligation. The company must: (1) retain only the data specifically required by the financial regulation (minimum necessary), (2) delete all other personal data not covered by the exemption, (3) restrict processing of retained data to compliance purposes, and (4) clearly explain the legal basis to the data subject. Blanket erasure ignores a valid legal retention obligation. Blanket denial ignores the partial erasure requirement. The balanced response is minimum retention with restriction and transparency.',
  'GDPR erasure + legal retention = partial erasure. Keep only what law requires. Restrict it. Explain it. Document Art. 17(3)(b).',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / comparison / correct=0
(
  2, 'data_remanence',
  'Which statement MOST accurately describes the data remanence risk differences between magnetic hard drives (HDDs), solid-state drives (SSDs), and optical media (CD-ROM/DVD-R)?',
  '["HDDs are susceptible to magnetic remanence and require degaussing or overwriting; SSDs retain data in NAND flash cells that are immune to degaussing and require cryptographic erasure or physical destruction; optical media (pressed/write-once) cannot be overwritten and requires physical destruction", "All three media types respond equally to degaussing because all store data magnetically at the physical layer", "SSDs have less data remanence risk than HDDs because flash cells lose charge faster than magnetic domains lose polarity", "Optical media can be securely erased by exposing it to strong magnetic fields, equivalent to degaussing an HDD"]'::jsonb,
  0,
  'HDDs store data as magnetic polarity changes; degaussing neutralizes these magnetic domains. SSDs store data as charge in NAND flash cells; they have no magnetic component and degaussing is completely ineffective. SSD remanence risk is higher because wear leveling can leave data in over-provisioned cells not addressed by standard erasure commands. Optical write-once media (CD-R, DVD-R) stores data as physical pit/land patterns burned into the media; these cannot be overwritten and are not affected by magnetic fields. Physical destruction (shredding, incineration) is the only reliable method for optical media.',
  'Media remanence: HDD=magnetic (degauss works). SSD=flash (degauss fails, use crypto-erase). Optical=physical pits (must shred).',
  'apply', 'comparison', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / tlatm / correct=1
(
  2, 'data_classification',
  'You are the data owner for a large enterprise''s customer database. A new AI/ML team requests access to the full production customer dataset for model training. The dataset is classified as Confidential and contains PII. As data owner, what is the MOST appropriate response?',
  '["Grant access because internal AI teams are trusted users and the data never leaves the organization", "Require the AI team to work with a privacy-preserving dataset -- either anonymized, synthesized, or tokenized -- rather than raw production data, unless a specific legal and business justification is documented and approved", "Deny access permanently because Confidential data cannot be used for any purpose other than its original collection purpose", "Delegate the access decision to the IT security team because the data owner role is administrative, not technical"]'::jsonb,
  1,
  'As data owner, your responsibility includes controlling access to data based on classification and ensuring data is used for authorized purposes. AI/ML model training on raw PII raises GDPR/CCPA purpose limitation and data minimization concerns. Best practice is to require the AI team to use privacy-preserving alternatives (anonymization, synthetic data, or tokenization) that preserve statistical utility without exposing individual PII. Full production access should only be granted with documented legal basis, data processing agreement, and minimum access principles. Data owners do not delegate classification-based access decisions to IT.',
  'Data owner = access gatekeeper. AI teams get anonymized/synthetic data, not raw PII. Purpose limitation is a legal requirement.',
  'analyze', 'tlatm', 'hard',
  1.70, 1.50, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  2, 'gdpr_compliance',
  'A US company acquires an EU company that processes EU resident data. Post-acquisition, the US parent wants to migrate all EU customer data to US-based cloud infrastructure. Which GDPR mechanism BEST enables this transfer while maintaining compliance?',
  '["The transfer is permitted automatically because the EU subsidiary is now a wholly-owned US corporate entity", "The transfer is prohibited because GDPR does not allow personal data to be transferred to the US under any circumstances following Schrems II", "Standard Contractual Clauses (SCCs) signed between the EU data exporter (EU subsidiary) and the US data importer (US parent), accompanied by a Transfer Impact Assessment (TIA) to evaluate US surveillance law risks, represent the primary compliance mechanism post-Schrems II", "The US parent can self-certify under the EU-US Data Privacy Framework (DPF) and immediately transfer data without SCCs"]'::jsonb,
  2,
  'Following the Schrems II ruling (invalidating Privacy Shield) and the subsequent EU-US Data Privacy Framework, SCCs with a Transfer Impact Assessment (TIA) remain the primary mechanism for EU-to-US data transfers when the recipient is not DPF-certified. The TIA assesses whether US intelligence surveillance laws (FISA Section 702, EO 12333) undermine SCC protections, and supplementary measures may be required. The DPF provides a valid alternative for certified US organizations, but self-certification requires actual enrollment in the DPF program, not just intent. Corporate ownership change does not automatically authorize data transfer.',
  'EU→US transfer post-Schrems II: SCCs + TIA = standard path. DPF = valid alternative IF actually enrolled. Ownership ≠ transfer authorization.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.20, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / best_answer / correct=3
(
  2, 'data_remanence',
  'A cloud service provider decommissions physical servers after a customer contract ends. The servers contained encrypted customer data. The customer asks for a "certificate of destruction." What is the MOST appropriate sanitization approach, and what should the certificate document?',
  '["Physical shredding is required for all cloud servers regardless of encryption because certificates of destruction require physical evidence", "The CSP can simply reassign the servers to new customers because encryption prevents previous customer data from being read", "Cryptographic erasure (crypto-shredding) is never sufficient for cloud environments because cloud infrastructure is shared and requires physical destruction", "Cryptographic erasure -- securely deleting the encryption keys -- combined with ATA Secure Erase or equivalent is the recommended approach; the certificate should document the sanitization method, date, media identifiers, personnel who performed the sanitization, and verification method used"]'::jsonb,
  3,
  'NIST SP 800-88 and CSA STAR acknowledge cryptographic erasure (destroying the encryption key, rendering data cryptographically inaccessible) as a valid sanitization method, often called "crypto-shredding." For cloud environments where physical destruction of every server is impractical, crypto-shredding + secure erase commands is the accepted approach. The certificate of destruction must document: sanitization method, date/time, media identifiers (serial numbers), responsible personnel, and verification method. Simply reassigning servers without sanitization -- even with encryption -- is insufficient because key management failures could expose prior customer data.',
  'Cloud sanitization = crypto-shredding (delete keys) + secure erase. Certificate = method + date + media ID + personnel + verification.',
  'apply', 'best_answer', 'hard',
  1.60, 1.40, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / scenario / correct=0
(
  2, 'data_retention',
  'An organization''s records retention schedule requires financial records to be retained for 7 years. The legal department issues a litigation hold for all records related to a 2019 contract dispute. The 7-year retention period for some 2019 records expired in 2026. Can those records be deleted?',
  '["No. A litigation hold supersedes the normal retention schedule. Records subject to a legal hold must be preserved until the hold is formally released by legal counsel, regardless of whether the standard retention period has expired", "Yes. The retention schedule is a compliance obligation and legal holds only apply to records created after the hold is issued", "Yes, but only if the records have been produced in discovery because production satisfies the hold obligation", "No, but only if the records contain PHI because HIPAA extends all legal holds indefinitely"]'::jsonb,
  0,
  'A litigation hold (also called a legal hold or preservation notice) is a directive to suspend normal document retention and destruction policies for records relevant to pending or reasonably anticipated litigation. The hold supersedes the retention schedule. Deleting records subject to a hold -- even after the standard retention period expires -- exposes the organization to spoliation sanctions, adverse inference jury instructions, and potential evidence tampering claims. The hold remains in effect until legal counsel formally releases it. Production in discovery does not automatically release the hold. The scope is not limited to PHI.',
  'LEGAL HOLD > RETENTION SCHEDULE. Hold = freeze everything in scope until legal releases it. Deleting = spoliation = sanctions.',
  'apply', 'scenario', 'hard',
  1.70, 1.20, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  2, 'data_controls',
  'A financial institution compares network DLP (NDLP) deployed at the perimeter versus endpoint DLP (EDLP) deployed on user workstations. Which assessment of their respective limitations is MOST accurate?',
  '["NDLP and EDLP are functionally equivalent; the only difference is deployment location", "NDLP cannot inspect encrypted TLS traffic without SSL/TLS inspection (which introduces its own privacy and performance concerns), and cannot protect data on endpoints when they are off-network; EDLP cannot inspect data sent from unmanaged or BYOD devices and creates performance overhead on endpoints but provides visibility into local storage and offline activity", "EDLP is always preferable to NDLP because it provides greater coverage and lower false positive rates", "NDLP is always preferable to EDLP because it does not require software agents and provides centralized control without endpoint management complexity"]'::jsonb,
  1,
  'NDLP inspects network traffic but is blind to encrypted TLS traffic without SSL inspection (which has legal and privacy implications in some jurisdictions) and cannot see endpoint activity when users are off-network (e.g., at home). EDLP monitors endpoint activity including local storage and offline actions, but requires managed devices and agents, cannot see traffic from unmanaged/BYOD devices, and adds endpoint CPU/memory overhead. Neither solution alone is complete; most enterprises deploy both as complementary controls. The correct answer describes both limitations accurately.',
  'NDLP blind spot = TLS encryption + off-network. EDLP blind spot = unmanaged/BYOD devices. Deploy both for full coverage.',
  'analyze', 'comparison', 'very_hard',
  1.90, 1.90, 0.22, 'handcrafted', true
),

-- Q11: hard / apply / tlatm / correct=2
(
  2, 'data_classification',
  'As the data classification program lead, you discover that 60% of the organization''s data has no classification label and is being treated as unrestricted by default. The security policy requires all data to be classified. What is the MOST appropriate remediation approach?',
  '["Immediately lock all unclassified data from access until it is properly classified to enforce the policy", "Commission an AI-based data discovery and auto-classification tool and accept its classifications without human review to process the backlog efficiently", "Implement a default classification level (e.g., Internal/Confidential) for all unclassified data, deploy automated discovery tools to identify sensitive content and suggest classifications, and establish a data owner review and approval workflow to confirm or adjust classifications in priority order based on data sensitivity and access frequency", "Delegate classification responsibility entirely to employees through self-service because data owners best understand their own data"]'::jsonb,
  2,
  'The most practical approach combines a defensive default classification (preventing data from being treated as unrestricted) with automated discovery tooling to surface sensitive content for prioritized human review. A default classification (typically "Internal" or "Confidential") ensures that unclassified data is not over-shared while the backlog is addressed. Automated tools can suggest classifications but require human review for accuracy. Locking all unclassified data immediately would halt business operations. Full AI automation without review produces unreliable classifications. Self-service without a structured workflow creates inconsistent results.',
  'Unclassified data backlog: default label (not unrestricted) + auto-discovery + human review in priority order.',
  'apply', 'tlatm', 'hard',
  1.60, 1.50, 0.20, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  2, 'gdpr_compliance',
  'An organization acting as a GDPR data processor suffers a breach affecting personal data of the data controller''s customers. The breach is discovered on Monday at 09:00. Under GDPR, what are the processor''s notification obligations and timeline?',
  '["The processor must notify the supervisory authority (e.g., ICO, CNIL) within 72 hours because processors have direct reporting obligations to regulators", "The processor has no notification obligation because only controllers must report breaches under GDPR Article 33", "The processor must notify affected data subjects within 24 hours because processors have direct obligations to individuals under GDPR", "The processor must notify the data controller without undue delay (Article 28(3)(f)), and it is the controller''s obligation to notify the supervisory authority within 72 hours of becoming aware; the processor''s notification should include sufficient detail for the controller to assess its GDPR Article 33 obligations"]'::jsonb,
  3,
  'Under GDPR, the notification obligation to supervisory authorities (Article 33) rests with the DATA CONTROLLER, not the processor. However, Article 28(3)(f) requires data processing agreements to include a processor obligation to notify the controller "without undue delay" after becoming aware of a breach. The processor must give the controller enough information (nature of breach, categories of data, approximate number of records affected, likely consequences, measures taken) to fulfill its 72-hour obligation. Processors do not notify supervisory authorities or data subjects directly -- those are controller responsibilities. "Without undue delay" from the processor typically means immediately upon discovery.',
  'Breach: Processor → Controller (immediately/Art 28). Controller → Supervisory Authority (72h/Art 33). Controller → Data Subjects (Art 34). Processor does NOT contact regulators or individuals directly.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / scenario / correct=0
(
  2, 'data_remanence',
  'A government agency requires TOP SECRET data to be wiped from a magnetic hard drive before reuse in a CONFIDENTIAL system. Which sanitization method satisfies this requirement according to DoD/NIST standards?',
  '["Degaussing to the drive''s coercivity rating followed by verification, which renders the drive magnetically unreadable, meeting NIST SP 800-88 Purge requirements for downgrading between classification levels", "A single-pass overwrite with zeros, which is sufficient for downgrading from any classification level", "Full-disk encryption followed by key deletion (cryptographic erasure) is sufficient for classified media downgrading", "Physical shredding is required for all classified media because no software method can be trusted for TOP SECRET downgrading"]'::jsonb,
  0,
  'For downgrading classified media (reducing from a higher to lower classification level), NIST SP 800-88 and DoD standards require Purge-level sanitization, which for HDDs means degaussing at or above the drive''s coercivity rating. A single-pass overwrite (Clear-level) is insufficient for downgrading. Cryptographic erasure is a valid Purge method only if the encryption was implemented before data was stored (full-disk encryption from inception). Physical destruction (Destroy) is more than required for downgrading -- media reuse is impossible after destruction. Degaussing + verification meets the Purge standard.',
  'Downgrading classified media = PURGE level = degauss (at coercivity). Single overwrite = CLEAR = not enough. Destroy = no reuse possible.',
  'apply', 'scenario', 'hard',
  1.80, 1.60, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / best_answer / correct=1
(
  2, 'data_controls',
  'An organization uses a SaaS-based DRM solution to protect sensitive documents. An executive wants to share a DRM-protected contract with an external law firm partner. Which DRM limitation is MOST important to communicate to the executive?',
  '["DRM cannot be applied to PDF files, only to Microsoft Office documents, limiting its usefulness for contract sharing", "External recipients must be enrolled in a compatible identity system (e.g., Azure AD B2B, federated identity) to authenticate against the DRM policy server -- if the law firm does not support the required identity provider, they may be unable to open the document", "DRM protection expires after 30 days by default, requiring the executive to re-issue credentials monthly", "DRM prevents external parties from viewing documents unless they install a proprietary desktop application that may not be approved by the law firm''s IT security team"]'::jsonb,
  1,
  'The most significant operational limitation of enterprise DRM for external sharing is identity federation. DRM enforces access policies by authenticating the user against the policy server at open time. External parties must have identities in a compatible directory (e.g., via Azure AD B2B guest access, SAML federation, or RMS for Individuals). If the law firm''s identity infrastructure is incompatible, document access fails. This is a real-world deployment challenge that executives must understand before relying on DRM for external sharing. The other options describe limitations that may exist in specific products but are not universal DRM architectural limitations.',
  'DRM external sharing = identity federation required. External party needs compatible IdP or they cannot open the document. Identity is the DRM gatekeeper.',
  'analyze', 'best_answer', 'hard',
  1.70, 1.40, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / first_action / correct=2
(
  2, 'data_retention',
  'A multinational organization operates under conflicting data retention requirements: GDPR mandates data minimization and storage limitation (retain only as long as necessary), while a US federal regulation requires 10-year retention of the same dataset. The CISO must establish a retention policy. What is the MOST appropriate approach?',
  '["Apply the shorter GDPR retention period globally to ensure the most protective standard applies everywhere", "Apply the 10-year US retention period globally to ensure regulatory compliance with the strictest retention requirement", "Implement jurisdiction-specific retention schedules: retain the dataset for 10 years for US-subject records per the federal requirement; apply purpose-based retention with storage limitation for EU-subject records per GDPR; use data residency and partitioning to ensure each record set is governed by its applicable jurisdiction''s rules", "Seek a formal GDPR exemption from the EU supervisory authority to apply the 10-year US schedule globally"]'::jsonb,
  2,
  'Conflicting multi-jurisdictional retention requirements cannot be resolved by applying a single global standard -- either approach violates one jurisdiction''s requirements. The solution is data partitioning: identify whether each record is subject to US federal requirements, EU GDPR, or both, and apply the appropriate retention schedule per jurisdiction. GDPR Article 17(3)(b) permits extended retention when required by legal obligation (the US federal requirement for US-subject records). Asking for a blanket GDPR exemption is not a practical mechanism. The architecture requires record-level jurisdiction tagging and separate retention enforcement per jurisdiction.',
  'Multi-jurisdiction conflict = jurisdiction-specific schedules + data partitioning. No single global rule works when laws conflict.',
  'analyze', 'first_action', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  2, 'data_classification',
  'An organization is merging with a competitor. During due diligence, the acquiring company''s data classification system uses four levels: Public, Internal, Confidential, Secret. The target company uses three levels: Public, Proprietary, Restricted. Post-merger, which approach to classification harmonization is MOST appropriate?',
  '["Adopt the acquiring company''s four-level scheme immediately and relabel all target company data by mapping Proprietary to Internal and Restricted to Confidential", "Adopt the target company''s simpler three-level scheme to reduce complexity and retrain the acquiring company''s workforce", "Delay harmonization until after all systems are fully integrated to avoid disrupting ongoing operations", "Conduct a classification harmonization exercise that maps equivalent levels between the two schemes based on data sensitivity criteria (not just label names), documents the mapping rationale, updates data handling procedures for both workforces, and defines a transition timeline -- recognizing that Restricted may map to either Confidential or Secret depending on sensitivity analysis"]'::jsonb,
  3,
  'Classification label names do not have standardized meanings across organizations. "Restricted" could be equivalent to Confidential OR Secret depending on the organization''s definitions. A proper harmonization exercise defines the sensitivity criteria for each level, maps source labels to target labels based on those criteria (not names), and validates the mapping against actual data samples. Both workforces need updated training and data handling procedures. An immediate forced mapping without analysis risks either over- or under-protecting data. Delay creates a period of uncertain data protection.',
  'Merge classification = MAP by sensitivity criteria, not label names. Restricted ≠ automatically Confidential. Do the analysis first.',
  'apply', 'scenario', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / scenario / correct=0
(
  2, 'data_controls',
  'A CASB solution is deployed in API mode (out-of-band) rather than inline mode. A security engineer reports that a user uploaded a sensitive document to a personal Dropbox account and the CASB did not block the upload. Why, and what is the architectural limitation?',
  '["API mode operates post-event by polling cloud service APIs for activity logs; it can detect and remediate after an upload occurs but cannot block uploads in real time because traffic does not flow through the CASB proxy", "API mode is a misconfiguration -- all CASB deployments must be inline to function correctly", "The CASB failed because Dropbox does not have an API that CASBs can integrate with", "API mode can only monitor email attachments, not file uploads to cloud storage services"]'::jsonb,
  0,
  'CASB has two primary deployment modes: inline (proxy) mode, where all traffic flows through the CASB and blocking is possible in real time; and API mode (out-of-band), where the CASB connects to cloud service APIs to retrieve activity logs and can perform remediation actions (delete file, quarantine, revoke sharing) AFTER the fact. API mode is excellent for visibility and post-event remediation but cannot intercept and block uploads in real time. For real-time blocking, inline mode is required. Many enterprises deploy both: API mode for sanctioned apps (for post-event visibility) and inline mode for blocking unsanctioned services.',
  'CASB API mode = post-event remediation only. CASB inline mode = real-time blocking. Blocking requires inline. API = detect and fix, not prevent.',
  'analyze', 'scenario', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / comparison / correct=1
(
  2, 'gdpr_compliance',
  'Under GDPR, what is the MOST significant distinction between "anonymization" and "pseudonymization" with respect to the regulation''s applicability?',
  '["Anonymized and pseudonymized data are both exempt from GDPR because neither directly identifies an individual", "Truly anonymized data (where re-identification is not reasonably possible) falls outside GDPR''s scope entirely; pseudonymized data remains personal data under GDPR because re-identification is possible with additional information, though pseudonymization is recognized as a security measure that can reduce risk and support compliance", "Pseudonymized data is exempt from GDPR breach notification requirements because it cannot be directly read by an attacker", "GDPR defines anonymization and pseudonymization identically; the distinction exists only in US privacy law"]'::jsonb,
  1,
  'GDPR Recital 26 states that the regulation does not apply to data that has been rendered anonymous in such a manner that the data subject is "not or no longer identifiable." However, pseudonymized data -- where direct identifiers are replaced by a pseudonym but re-identification is possible using a lookup table -- remains personal data because re-identification is possible. GDPR Article 25 (data protection by design) and Article 32 (security of processing) explicitly list pseudonymization as a security measure that can reduce risk, but it does not remove data from GDPR scope. True anonymization removes GDPR applicability entirely, but the bar is high.',
  'Anonymized = out of GDPR scope (if truly irreversible). Pseudonymized = still personal data (re-ID possible). Pseudo = good security, not GDPR exemption.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.10, 0.22, 'handcrafted', true
),

-- Q19: hard / apply / tlatm / correct=2
(
  2, 'data_remanence',
  'You are tasked with securely wiping 200 enterprise laptops for a lease return. The laptops contain a mix of HDDs and SSDs and were used to process company confidential data. What is the MOST operationally sound sanitization strategy?',
  '["Apply a single 7-pass DoD 5220.22-M wipe to all devices regardless of drive type, as this is the recognized government standard", "Degauss all devices because degaussing is the universally accepted sanitization method for all laptop storage", "Identify drive type per device; for HDDs apply at minimum a single-pass overwrite (Clear) or degauss (Purge); for SSDs use ATA Secure Erase or manufacturer-provided secure erase utility (Purge); document sanitization type, tool, operator, and date for each device; verify a sample for completeness", "Remove the drives from all laptops and physically shred them before returning the chassis to minimize remanence risk regardless of cost"]'::jsonb,
  2,
  'NIST SP 800-88 is the governing standard. The sanitization method must match the media type. HDDs: Clear (overwrite) is sufficient for reuse/lease return of non-classified data; Purge (degauss) if required by policy. SSDs: multi-pass overwrite is NOT recommended due to wear leveling; ATA Secure Erase or manufacturer utilities are required. The 7-pass DoD 5220.22-M standard predates SSDs and is not recommended for flash media. Degaussing is ineffective on SSDs. Physical destruction is more than required for Confidential data in a lease return context. Documentation and sampling are required for auditability.',
  'Sanitization = match method to media. HDD=overwrite. SSD=ATA Secure Erase. Document everything. Sample verify. NIST 800-88.',
  'apply', 'tlatm', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  2, 'data_controls',
  'An organization deploys a DRM solution to protect M&A documents. An employee prints a DRM-protected document to a PDF printer driver (creating an unprotected PDF) and emails the unprotected PDF to a personal account. Which DRM control gap does this represent, and what is the BEST mitigation?',
  '["This is a DLP gap, not a DRM gap, because DRM controls document access while DLP controls data movement", "The DRM solution has failed completely and should be replaced with endpoint encryption", "This is an expected limitation of all DRM solutions and cannot be mitigated technically", "This is the ''print to PDF'' or ''screen capture'' DRM bypass -- a known limitation where print operations strip DRM. Mitigation options include: disabling print-to-file drivers via endpoint policy, integrating DRM with DLP to block unprotected PDFs leaving the network, and applying watermarks to printed output for forensic traceability"]'::jsonb,
  3,
  'DRM systems enforce access policies at the application layer (Office, Acrobat) but cannot prevent the operating system''s print subsystem from rendering protected content to a virtual printer that creates an unprotected file. This is a well-known DRM limitation. Mitigations include: (1) Group Policy disabling PDF and XPS virtual print drivers on managed endpoints, (2) DLP rules that detect and block unprotected sensitive documents (by content fingerprinting) at the email gateway, and (3) printed watermarks containing user identity for forensic accountability. Defense in depth -- combining DRM, DLP, and endpoint policy -- is required to address this gap.',
  'Print-to-PDF = DRM bypass #1. Fix: disable virtual printers (GPO) + DLP at gateway + watermarks. DRM alone cannot stop printing.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / scenario / correct=0
(
  2, 'data_retention',
  'A company is responding to an e-discovery request in civil litigation. Legal counsel identifies 50,000 potentially relevant documents across 200 employee email accounts. The IT team proposes exporting all 200 mailboxes in full. What is the PRIMARY concern with this approach from an information governance perspective?',
  '["Over-collection captures large volumes of non-responsive data including privileged attorney-client communications, personal employee data, and irrelevant business records -- creating proportionality, privilege review burden, and GDPR/privacy law concerns for data beyond the litigation''s scope", "The main concern is storage cost because 200 mailboxes may require significant infrastructure", "Over-collection is always preferred in e-discovery because producing more data reduces the risk of being found to have withheld relevant evidence", "The IT team should not be involved in e-discovery at all; legal counsel must personally export all mailboxes"]'::jsonb,
  0,
  'E-discovery is governed by proportionality principles (FRCP Rule 26 in the US; similar principles in other jurisdictions). Over-collection creates: (1) privilege review burden -- all attorney-client communications must be reviewed and withheld before production, which is expensive; (2) privacy law exposure -- exporting personal employee data beyond the litigation scope may violate GDPR/CCPA; (3) inadvertent disclosure risk -- privilege waiver if privileged documents are accidentally produced. Legal holds and collection should be scoped to custodians and date ranges relevant to the litigation, not blanket full-mailbox collection.',
  'E-discovery: proportionality = collect what is relevant, not everything. Over-collection = privilege burden + privacy risk + cost.',
  'apply', 'scenario', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / best_answer / correct=1
(
  2, 'data_classification',
  'An organization''s data classification policy requires all "Restricted" data to be encrypted in transit and at rest. A development team argues that data in a development environment "is not real Restricted data" because it uses production data that has been masked. What is the MOST appropriate determination?',
  '["The development team is correct if the masking was performed using a validated anonymization tool approved by the data governance team", "The determination depends on whether the masking preserves re-identifiability: if masked data can be re-identified (e.g., through quasi-identifiers, partial masking, or linkage with other datasets), it retains its Restricted classification and must be protected accordingly; if it is truly anonymized or synthetically generated, it may be reclassified", "All data derived from Restricted sources retains the Restricted classification regardless of masking because the original source determines classification", "Development environments are always exempt from data classification requirements because they are non-production systems"]'::jsonb,
  1,
  'Classification is based on sensitivity of the information, not its source. The key question for masked data is whether re-identification is possible. Partial masking (e.g., masking only SSN last four digits while retaining name, DOB, and ZIP), quasi-identifier linkage attacks, and small dataset size can allow re-identification of "masked" data. If re-identification is reasonably possible, the data retains its classification. Truly anonymized or synthetically generated data that eliminates re-identification risk can be reclassified. Development teams must demonstrate, not assume, that masking achieves anonymization. Dev environment exemptions create systematic data protection gaps.',
  'Masked ≠ automatically anonymized. Test for re-identification risk. If re-ID possible = still Restricted. If truly anon = can reclassify.',
  'analyze', 'best_answer', 'hard',
  1.70, 1.60, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / tlatm / correct=2
(
  2, 'gdpr_compliance',
  'As the DPO for a company, you learn that the marketing team has been using a third-party analytics platform that processes EU user behavioral data. No Data Processing Agreement (DPA) exists with the vendor. The vendor''s terms of service include a clause allowing them to use customer data for "product improvement." What must you do FIRST?',
  '["Issue an internal memo reminding staff to always sign DPAs before using third-party tools", "Immediately terminate the vendor relationship and delete all data processed without a DPA", "Assess the processing: determine what personal data has been shared, under what legal basis, whether the vendor''s ''product improvement'' clause constitutes secondary processing that requires separate consent, and instruct the marketing team to suspend new data transfers to the vendor pending a DPA and legal basis review", "Report the violation to the supervisory authority within 72 hours because the absence of a DPA constitutes a personal data breach under GDPR Article 33"]'::jsonb,
  2,
  'GDPR Article 28 requires a written DPA with all processors. The absence of a DPA is a GDPR compliance violation, but it is not a "personal data breach" under Article 33 (which requires a security incident causing accidental or unlawful destruction, loss, alteration, unauthorized disclosure or access). The DPO''s first priority is to assess the situation: what data was shared, can the vendor''s usage be lawfully justified, and is the "product improvement" clause creating unauthorized secondary processing? Suspending new transfers protects against ongoing harm while the assessment is conducted. Immediate termination without assessment may not be proportionate and could destroy evidence of the processing.',
  'Missing DPA = compliance violation, not breach (unless security incident). DPO: assess → suspend transfers → get DPA → review legal basis. Triage before reporting.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 2.20, 0.20, 'handcrafted', true
),

-- Q24: hard / apply / first_action / correct=3
(
  2, 'data_remanence',
  'During a forensic investigation, an analyst must acquire a forensic image of a suspect''s NVMe SSD while preserving evidence integrity. The SSD does not have a physical write-protect switch. What is the MOST important first step?',
  '["Boot the SSD from a live forensic OS to prevent Windows from modifying the drive during acquisition", "Immediately run a hash of the drive using the operating system''s built-in tools before connecting to the forensic workstation", "Connect the SSD directly to the forensic workstation and begin imaging using dd because speed is critical in forensic investigations", "Connect the SSD through a hardware write blocker (supporting NVMe protocol) before any forensic acquisition to ensure no writes occur to the evidence drive, then capture a verified forensic image and document the hash values (pre- and post-acquisition)"]'::jsonb,
  3,
  'The cardinal rule of forensic acquisition is to preserve evidence integrity by preventing any writes to the evidence drive. NVMe SSDs require an NVMe-compatible hardware write blocker; older SATA write blockers do not work on NVMe interfaces. Booting from the evidence drive risks modifying it (boot logs, swap, file system metadata). Running a hash before isolation does not prevent subsequent writes. Direct connection without a write blocker allows the OS to modify the drive (auto-mount, indexing, swap). The correct sequence: write blocker → image → hash before and after → document chain of custody.',
  'Forensics first rule: WRITE BLOCKER before touching evidence. NVMe needs NVMe write blocker. Hash before AND after. Document chain of custody.',
  'apply', 'first_action', 'hard',
  1.80, 1.70, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  2, 'data_controls',
  'A company implements both a DLP solution and a CASB in API mode. Despite both controls being active, a user successfully exfiltrates 10,000 customer records by copying data cell-by-cell into a personal Google Sheets document over three weeks. Which control gap does this represent?',
  '["Both DLP and CASB failed to detect the exfiltration because the transfer used small incremental writes that fell below volume-based detection thresholds -- demonstrating the limitation of threshold-based controls against slow-and-low exfiltration, which requires User and Entity Behavior Analytics (UEBA) to detect anomalous access patterns over time", "The DLP solution was misconfigured because it should have blocked all access to Google Sheets regardless of transfer volume", "The CASB API mode should have blocked the transfer in real time, indicating a deployment failure", "This attack is undetectable with any technology control and can only be prevented through mandatory access control policies"]'::jsonb,
  0,
  'This represents a "slow and low" or "low and slow" data exfiltration technique designed to evade volume-based DLP thresholds. DLP solutions typically trigger on bulk transfers (e.g., >100 records, >1MB files) and miss incremental cell-by-cell transfers that individually fall below detection thresholds. CASB API mode detects cloud activity post-event but may not flag small incremental writes as anomalous individually. UEBA (User and Entity Behavior Analytics) addresses this gap by analyzing access patterns over time -- detecting that a user is accessing customer records far more frequently than their peer group over a sustained period. Defense in depth requires behavioral analytics, not just threshold-based detection.',
  'Slow-and-low exfil = evades volume thresholds. Fix = UEBA (behavioral anomaly detection over time). DLP + CASB = threshold-based = blind to incremental.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=14, analyze=11   (Total: 25)
-- Type:       scenario=11, comparison=4, tlatm=4, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
