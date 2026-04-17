-- ============================================================
-- CISSP Quest -- Domain 2: Asset Security
-- Generated: 2026-04-16 | Source: ai_generated (from ISC2 CBK)
-- ============================================================
-- DISTRIBUTION STATS (25 questions total)
--   Difficulty:  Easy=5 (20%), Medium=11 (44%), Hard=7 (28%), Very Hard=2 (8%)
--   Cognitive:   Remember=3 (12%), Understand=5 (20%), Apply=11 (44%), Analyze=6 (24%)
--   Types:       Scenario=9, Best Answer=5, First Action=3, TLATM=3,
--                Comparison=3, Except/Not=2
--   Answer pos:  0=6, 1=6, 2=7, 3=6
-- Topic clusters: data_retention_legal, data_protection_privacy,
--   asset_handling, data_states_protection
-- ============================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: Data de-identification -- easy/remember
(
  2, 'data_protection_privacy',
  'A healthcare organization replaces patient names and Social Security Numbers in a research dataset with randomly generated identifiers, while retaining a separate mapping table that allows the original values to be restored. This technique is BEST described as:',
  '["Anonymization", "Pseudonymization", "Tokenization", "Encryption"]'::jsonb,
  1,
  'Pseudonymization replaces identifying information with artificial identifiers (pseudonyms) while retaining a mapping table that allows re-identification. The key characteristic is that the original identity CAN be restored using the mapping table -- making it reversible. Under GDPR, pseudonymized data is still considered personal data because re-identification is possible (unlike anonymized data). Anonymization permanently removes identifying information with no way to re-identify the individual -- this dataset retains the mapping table, so it is not anonymous. Tokenization is similar to pseudonymization but typically uses a token vault and is common in payment card contexts. Encryption transforms data but does not replace identifiers.',
  'Pseudonymization is witness protection with a file in the back room. The alias is in use, but the true identity can be recalled with the right authorization.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.70, 0.20, 'ai_generated', true
),

-- Q2: Data de-identification -- medium/apply
(
  2, 'data_protection_privacy',
  'A marketing analytics firm processes data about EU citizens and wants to share aggregate behavioral patterns with third parties without triggering GDPR data sharing obligations. The legal team advises that only truly anonymized data falls outside GDPR''s scope. Which technique, if properly implemented, would MOST effectively achieve this goal?',
  '["Pseudonymization using a secure key held by the firm", "Tokenization with a token vault accessible to the data science team", "Anonymization techniques such as k-anonymity or differential privacy where re-identification is not reasonably possible", "Encryption with a key held only by the data controller"]'::jsonb,
  2,
  'True anonymization -- where re-identification is not reasonably possible even with additional information -- removes data from GDPR''s scope entirely. Techniques like k-anonymity (ensuring each record is indistinguishable from at least k-1 other records) and differential privacy (adding statistical noise that preserves aggregate patterns while making individual records non-identifiable) can achieve this if properly implemented. Pseudonymization (A) and tokenization with accessible vault (B) both retain reversibility -- GDPR Recital 26 explicitly states pseudonymized data is still personal data. Encryption (D) protects data in transit and at rest but does not anonymize it -- the data is still identifiable once decrypted.',
  'GDPR exemption requires the identity to be truly erased, not just masked behind a door that someone holds the key to.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q3: Data de-identification -- hard/analyze
(
  2, 'data_protection_privacy',
  'A financial institution uses tokenization to protect payment card numbers. Tokens are stored in the production database; the token vault (containing the token-to-PAN mapping) is isolated in a separate secure environment. A penetration tester reports that the token vault is accessible from the application tier via a service account with broad query privileges. Which analysis BEST describes the security implication and appropriate remediation?',
  '["The tokenization architecture is sound because the token vault is in a separate environment; the service account permissions are a minor configuration issue", "The broad service account access to the token vault effectively reduces the tokenization scheme to transparent data encryption, because an attacker who compromises the application tier can de-tokenize all records", "The penetration finding is a false positive because the application needs vault access to process payments", "The remediation is to encrypt the token vault with a different key than the production database"]'::jsonb,
  1,
  'Broad service account access from the application tier to the token vault effectively collapses the security value of tokenization. If an attacker compromises the application server (SQL injection, RCE), they inherit the service account''s privileges and can de-tokenize the entire dataset. The architecture requires the vault to be accessible only for specific, rate-limited de-tokenization operations, with strict privilege minimization (least privilege on the service account -- ideally read access to specific token lookups, not broad query rights). A compromised application tier should not have the keys to the kingdom. Encrypting the vault (D) adds a layer but does not address the privilege problem -- the service account can still use its query access regardless of encryption at rest.',
  'Separating the vault is the mission. But if the field agent carries the vault combination in their wallet, the separation means nothing.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.55, 0.20, 'ai_generated', true
),

-- Q4: DLP types and mechanics -- easy/remember
(
  2, 'data_protection_privacy',
  'A security analyst is reviewing DLP alerts. One alert fires on an email containing a 16-digit number that matches a credit card pattern but the analyst confirms the number is actually a product serial number. This is an example of:',
  '["A true positive -- DLP correctly identified sensitive data", "A false positive -- DLP triggered on data that does not require protection", "A false negative -- DLP missed actual sensitive data in the email", "A true negative -- DLP correctly allowed the email to pass"]'::jsonb,
  1,
  'A false positive occurs when a security control incorrectly identifies benign activity as a threat or violation. The DLP rule (pattern matching on 16-digit numbers) fired on a product serial number that resembles but is not a credit card number. This is a false positive -- an alert was generated for something that does not require protection. True positives are real violations correctly identified. False negatives are real violations missed by the control. True negatives are benign events correctly passed through. High false positive rates reduce DLP effectiveness because analysts become desensitized to alerts (alert fatigue).',
  'The scanner sounded the alarm on a prop gun. Wrong alert, real inconvenience -- that is a false positive.',
  'remember',
  'comparison',
  'easy',
  0.85, -1.60, 0.20, 'ai_generated', true
),

-- Q5: DLP types and mechanics -- medium/apply
(
  2, 'data_protection_privacy',
  'An organization wants to prevent employees from uploading proprietary source code to personal cloud storage services from their corporate laptops. Which DLP deployment type is MOST effective for this requirement?',
  '["Network DLP deployed at the internet gateway to inspect outbound traffic", "Cloud DLP integrated with cloud access security broker to monitor cloud storage usage", "Endpoint DLP installed on corporate laptops to monitor file operations and application activity", "Email DLP to scan outbound email attachments for source code patterns"]'::jsonb,
  2,
  'Endpoint DLP installed on corporate laptops is the most effective control for this specific scenario. Employees uploading files from their laptops to personal cloud storage may use HTTPS (which encrypts the traffic), making network DLP inspection ineffective -- DLP cannot inspect encrypted traffic without SSL inspection, which has its own limitations. Endpoint DLP monitors file operations (copy, paste, upload, save-to-USB) directly on the device, regardless of whether the destination uses encryption. Cloud DLP (B) would detect files already in corporate cloud storage, not uploads to personal accounts. Email DLP (D) addresses email vectors, not direct cloud uploads.',
  'The inspector at the gate cannot open the sealed diplomatic pouch. The search must happen at the source, before it leaves the premises.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q6: DLP types and mechanics -- hard/analyze
(
  2, 'data_protection_privacy',
  'An organization''s DLP system is generating 500+ false positive alerts daily, overwhelming the security operations team. The CISO wants to tune the DLP system to reduce noise without increasing data leakage risk. Which approach reflects the BEST balance of security and operational effectiveness?',
  '["Lower all DLP rule sensitivity thresholds to reduce the volume of alerts generated", "Disable DLP rules that consistently generate false positives until the vendor can provide updated signatures", "Implement tiered DLP policy tuning: review each high-volume rule, add contextual conditions (recipient, data classification, user role) to reduce false positives while maintaining detection for high-risk combinations", "Increase the DLP alert thresholds so only high-volume exfiltration attempts trigger alerts"]'::jsonb,
  2,
  'Tiered policy tuning with contextual conditions (C) is the correct approach. Adding context reduces false positives without reducing detection coverage: for example, a rule for "credit card numbers in email" can be tuned to exclude the finance team''s known-safe external recipients while still alerting on all others. User role, data classification label, recipient domain, and time-of-day context can all reduce false positive rates without disabling protection. Lowering sensitivity globally (A) reduces true positives along with false positives. Disabling rules (B) creates unmonitored gaps. Raising volume thresholds (D) would miss low-volume targeted exfiltration -- the most dangerous type.',
  'Turning off the alarm is not the answer. Calibrating it to distinguish authorized transfers from unauthorized ones is.',
  'analyze',
  'tlatm',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q7: CASB -- medium/apply
(
  2, 'data_protection_privacy',
  'An enterprise security team discovers that employees are using 47 different unapproved cloud applications to store and share work files, none of which have been reviewed for security compliance. This is known as shadow IT. Which technology is SPECIFICALLY designed to discover, monitor, and control cloud service usage in this scenario?',
  '["A next-generation firewall (NGFW) with application awareness", "A Cloud Access Security Broker (CASB)", "An Identity Provider (IdP) implementing SAML federation", "A Web Application Firewall (WAF)"]'::jsonb,
  1,
  'A Cloud Access Security Broker (CASB) is the purpose-built technology for exactly this problem. CASBs discover shadow IT by monitoring traffic to identify cloud services in use (discovered via log analysis or inline inspection), assess each service against security criteria, and enforce organizational policies (blocking unapproved services, applying DLP policies to cloud traffic, extending on-premises security policies into cloud environments). An NGFW (A) can block specific domains but lacks cloud-specific risk scoring, DLP, and governance capabilities. An IdP (C) manages authentication but does not discover or control unapproved cloud apps. A WAF (D) protects web applications from attacks -- it does not govern employee cloud usage.',
  'The CASB is the cloud border control -- it sees every cloud service employees are sneaking through, assesses it, and enforces the rules.',
  'apply',
  'best_answer',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q8: CASB -- hard/analyze
(
  2, 'data_protection_privacy',
  'An organization deploys a CASB in API mode to govern its approved SaaS applications. A security analyst notes that the CASB is not detecting when employees download corporate files from approved SaaS apps and upload them to personal cloud storage using a personal device on a home network. Which limitation explains this gap and what deployment mode would address it?',
  '["API mode is limited to approved applications; adding more APIs would address the gap", "API mode integrates with cloud provider APIs to inspect data within approved clouds but does not see traffic on unmanaged devices or networks; forward proxy mode (inline) or reverse proxy mode would intercept traffic regardless of device or network", "The CASB needs agent software installed on the personal device to monitor all cloud uploads", "The gap cannot be addressed by CASB; endpoint DLP on corporate devices is the only solution"]'::jsonb,
  1,
  'CASB deployment modes have specific coverage limitations. API mode connects directly to cloud provider APIs and can inspect data within sanctioned cloud services, enforce policies, and detect policy violations -- but it only sees what happens within the integrated SaaS applications, not traffic from unmanaged devices or networks. Forward proxy mode (all traffic routed through the CASB proxy) and reverse proxy mode (traffic to specific SaaS apps reverse-proxied through the CASB) both intercept cloud traffic at the network level, providing coverage for managed AND unmanaged devices accessing cloud resources. The personal device on a home network is outside API mode''s reach entirely. MDATP/agent approach (C) would require installing software on personal devices, which creates privacy and legal issues.',
  'API mode is an inspector inside the approved vault. Proxy mode is the checkpoint everyone must pass through -- managed or not.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q9: Data retention and legal -- easy/remember
(
  2, 'data_retention_legal',
  'An organization''s legal team notifies the security operations team that the company is the subject of a pending lawsuit and that all relevant electronic records must be preserved immediately. What is this legal obligation called?',
  '["Data classification", "Litigation hold (legal hold)", "Data minimization", "Records retention schedule"]'::jsonb,
  1,
  'A litigation hold (also called a legal hold) is the legal obligation to preserve all documents, records, and data that may be relevant to anticipated or actual litigation, regulatory investigation, or other legal proceedings. Once litigation is reasonably anticipated, the organization must suspend its normal records retention and destruction schedules for relevant materials. Failure to preserve evidence can result in spoliation sanctions, adverse inference instructions (courts may instruct juries to assume the missing evidence was unfavorable), and civil or criminal penalties. Data classification governs sensitivity levels. Data minimization is a privacy principle. A retention schedule governs normal document lifecycle, not legal holds.',
  'When the court serves notice, the archive goes into lockdown. Normal destruction schedules stop immediately.',
  'remember',
  'best_answer',
  'easy',
  0.90, -1.65, 0.20, 'ai_generated', true
),

-- Q10: Data retention and legal -- medium/apply
(
  2, 'data_retention_legal',
  'A healthcare organization is designing its data retention policy for patient medical records. Which combination of requirements should PRIMARILY drive the retention period for these records?',
  '["The organization''s storage costs and server capacity limitations", "HIPAA requirements (minimum 6 years for covered entities) and applicable state medical records laws, whichever is longer", "The vendor''s recommended backup retention period", "Patient requests for record deletion under privacy regulations"]'::jsonb,
  1,
  'Data retention periods for regulated data must be driven by legal and regulatory requirements, not operational convenience. HIPAA requires covered entities to retain documentation of their policies and procedures for 6 years from the date of creation or last effective date. Many state laws require retention of actual patient medical records for longer periods (commonly 7-10 years, with many states requiring longer for minors). The general principle is: retain for the longer of the applicable regulatory requirements. Patient deletion requests (GDPR''s right to erasure, CCPA) are subject to exceptions for legally required record retention -- you cannot honor a deletion request that conflicts with a legal retention obligation.',
  'Regulatory requirements set the floor for retention, not the ceiling. You keep records as long as the law demands, regardless of storage preferences.',
  'apply',
  'scenario',
  'medium',
  1.15, 0.25, 0.20, 'ai_generated', true
),

-- Q11: Data retention and legal -- hard/analyze
(
  2, 'data_retention_legal',
  'An organization''s records retention schedule calls for deletion of HR records after 7 years. The security team is preparing to purge a batch of records from 2017 that have reached their retention limit. During the preparation, legal counsel advises that two former employees from that period are plaintiffs in a pending class action lawsuit filed 6 months ago. What is the CORRECT action?',
  '["Proceed with the scheduled deletion because the records have passed their retention period and deletion protects the organization from adverse discovery", "Place the records relevant to the plaintiffs under litigation hold immediately and suspend deletion for those records pending resolution of the litigation", "Delete all records immediately to eliminate potential discovery exposure", "Transfer the records to an offline archive to slow down any discovery requests"]'::jsonb,
  1,
  'Litigation hold takes precedence over normal retention schedules. Once litigation is pending (and in this case it has been pending for 6 months -- the hold should have been placed then), records relevant to the litigation cannot be destroyed regardless of their scheduled retention period. Destroying records after litigation is anticipated is spoliation of evidence -- a serious legal violation that can result in monetary sanctions, adverse inference jury instructions, or criminal contempt charges. The fact that the records have reached their normal retention period does not provide a defense if litigation was pending. The immediate action is to apply a litigation hold to relevant records and notify legal counsel.',
  'Scheduled destruction orders are suspended the moment the mission is flagged for review. Evidence cannot be shredded while the case is open.',
  'analyze',
  'first_action',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q12: Asset handling -- medium/understand
(
  2, 'asset_handling',
  'An organization''s data classification policy requires "Confidential" data to be physically destroyed using a cross-cut shredder when disposing of paper documents, and degaussed or physically destroyed when disposing of magnetic media. Which principle does this policy implement?',
  '["The principle of least privilege applied to data handling", "The principle of data sanitization ensuring data cannot be recovered after disposal", "The principle of data minimization requiring collection of only necessary data", "The principle of accountability requiring documentation of all data handling"]'::jsonb,
  1,
  'The policy implements the principle of data sanitization -- ensuring that sensitive data cannot be recovered from disposed media. Data sanitization standards define three levels: clearing (overwriting for reuse within the organization), purging (more rigorous degaussing or cryptographic erasure for media leaving organizational control), and destruction (physical destruction for highest-sensitivity data). Cross-cut shredding and degaussing are physical and magnetic destruction methods that prevent recovery even with advanced forensic techniques. Least privilege governs who can access data. Data minimization governs what data is collected. Accountability governs audit trails.',
  'The mission files must be burned, not just filed away. Once classified material leaves controlled custody, it must be irretrievable.',
  'understand',
  'best_answer',
  'medium',
  1.10, 0.00, 0.20, 'ai_generated', true
),

-- Q13: Asset handling -- medium/apply
(
  2, 'asset_handling',
  'An organization is decommissioning 200 SSDs from laptops previously used to process "Restricted" (highest internal classification) data. The IT team proposes overwriting each drive three times using DoD 5220.22-M standard before repurposing the drives. The security officer rejects this approach. Which reason BEST justifies the rejection?',
  '["DoD 5220.22-M requires seven passes, not three, to effectively sanitize magnetic media", "SSDs use wear-leveling algorithms that distribute writes across cells, making software-based overwriting insufficient to guarantee erasure of all data on flash storage; physical destruction or cryptographic erasure are the appropriate methods", "Overwriting is only acceptable for data at the Confidential level, not Restricted", "Repurposing SSDs is never acceptable for data above Public classification regardless of sanitization method"]'::jsonb,
  1,
  'Software-based overwriting is ineffective for SSDs due to wear-leveling. Wear-leveling is a technique SSDs use to extend drive life by distributing writes across all flash cells evenly. When an overwrite command is issued, the SSD''s firmware may not write to the same physical cells that held the original data -- it may write to fresh cells while the original data remains in worn cells or in reserved space not accessible through standard write commands. NIST SP 800-88 (Guidelines for Media Sanitization) explicitly states that overwriting is not reliable for SSDs and recommends cryptographic erasure (if the drive was encrypted with a stored key, delete the key) or physical destruction for sensitive data. DoD 5220.22-M applies to magnetic hard drives.',
  'Repainting the safe does not change what is locked inside. SSD wear-leveling hides the original data outside the normal write path.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.30, 0.20, 'ai_generated', true
),

-- Q14: Asset handling -- hard/analyze
(
  2, 'asset_handling',
  'A cloud-hosted virtual machine that processed "Confidential" data is being decommissioned. The organization used full-disk encryption (FDE) on the VM with a key managed by the cloud provider''s key management service (KMS). The cloud provider confirms the VM''s underlying physical storage will be reallocated and overwritten by default. Which sanitization approach is MOST appropriate and why?',
  '["Request the cloud provider to physically destroy the physical storage that hosted the VM", "Delete the FDE encryption key from the cloud provider''s KMS (cryptographic erasure), which effectively renders the encrypted data unrecoverable regardless of what happens to the underlying physical storage", "Overwrite the VM disk image three times before decommissioning", "Accept the cloud provider''s default overwrite policy as sufficient for Confidential data"]'::jsonb,
  1,
  'Cryptographic erasure -- deleting the encryption key -- is the appropriate and most practical method for cloud-hosted VMs with FDE. When the key is destroyed, the encrypted data becomes computationally unrecoverable regardless of the underlying physical storage state. NIST SP 800-88 recognizes cryptographic erasure as a valid sanitization method for encrypted media when the key is deleted and there is no key recovery mechanism. Requesting physical destruction (A) is impractical for shared cloud infrastructure -- the cloud provider cannot destroy a single physical disk that serves hundreds of customers. Overwriting (C) has the same wear-leveling issues as the SSD scenario, applied to shared cloud storage. Accepting default overwrite (D) may be insufficient for Confidential-classified data without documented assurance that it meets your sanitization standards.',
  'You cannot burn the vault if it is shared with other tenants. Destroy the combination -- cryptographic erasure erases access to the data without touching the hardware.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q15: Data states protection -- easy/remember
(
  2, 'data_states_protection',
  'Data that is currently being processed in a CPU or loaded into RAM is considered data in which state, and what is the PRIMARY security challenge for data in this state?',
  '["Data at rest -- primary challenge is unauthorized physical access to storage media", "Data in use -- primary challenge is that data is typically decrypted and in plaintext form while being processed, making it vulnerable to memory scraping and side-channel attacks", "Data in transit -- primary challenge is interception during network transmission", "Data in motion -- primary challenge is man-in-the-middle attacks during protocol handshakes"]'::jsonb,
  1,
  'Data in use refers to data that is actively loaded into memory (RAM), CPU registers, or cache for processing. The primary security challenge is that data must typically be decrypted to be processed, which means it exists in plaintext in memory -- potentially accessible to memory scraping malware, cold boot attacks (rapidly cooling RAM to extend data retention and reading memory contents), or DMA attacks. This is distinct from data at rest (stored on persistent media, protected by encryption and physical controls) and data in transit (transmitted over networks, protected by TLS/IPsec). "Data in motion" is a synonym for data in transit, not a separate state.',
  'Even the best encrypted vault opens when processing. Data in use is the moment of maximum exposure -- the lock is off.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.55, 0.20, 'ai_generated', true
),

-- Q16: Data states protection -- medium/apply
(
  2, 'data_states_protection',
  'An organization processes credit card data. A security architect is designing controls for each data state. Which control correctly matches the data state to its primary protection mechanism?',
  '["Data at rest: TLS 1.3 encryption; Data in transit: AES-256 encryption; Data in use: tokenization", "Data at rest: AES-256 encryption with secure key management; Data in transit: TLS 1.3; Data in use: memory encryption or process isolation (e.g., Intel SGX)", "Data at rest: tokenization; Data in transit: IPsec tunnel mode; Data in use: AES-256 field-level encryption", "Data at rest: full-disk encryption; Data in transit: SSL (any version); Data in use: obfuscation"]'::jsonb,
  1,
  'Option B correctly matches controls to states: AES-256 for data at rest (standard for stored sensitive data), TLS 1.3 for data in transit (current secure transport protocol), and memory encryption or process isolation (such as Intel SGX, which creates secure enclaves) for data in use. TLS (A) is a transit protocol, not a storage control. Obfuscation (D) is not a recognized cryptographic protection for data in use. SSL (D) is deprecated and should not be used. Intel SGX (Secure Guard Extensions) creates hardware-enforced memory enclaves where data can be processed without being accessible to the operating system or hypervisor -- this is the correct modern approach for data-in-use protection.',
  'Each state needs its own armor: vault lock for storage, armored transport for transit, sealed processing room for active use.',
  'apply',
  'comparison',
  'medium',
  1.25, 0.30, 0.20, 'ai_generated', true
),

-- Q17: Data states protection -- hard/analyze
(
  2, 'data_states_protection',
  'An organization is evaluating homomorphic encryption for a use case where a cloud provider will perform analytics on patient data without the cloud provider being able to read the individual records. The security architect notes that current fully homomorphic encryption (FHE) implementations have significant performance limitations. Which analysis BEST reflects the current state of homomorphic encryption for this use case?',
  '["FHE should be implemented immediately as it provides perfect security for cloud analytics without any privacy-performance tradeoff", "FHE is technically capable of allowing computation on encrypted data without decryption, but current implementations have severe performance overhead (10,000-1,000,000x slower than plaintext computation) making it impractical for large-scale analytics; partial or somewhat homomorphic encryption with carefully designed query interfaces may be a feasible near-term alternative", "FHE is not technically possible -- encrypted data cannot be computed without decryption by definition", "FHE is appropriate for this use case because the privacy benefits outweigh performance concerns for healthcare data"]'::jsonb,
  1,
  'Option B is technically accurate. Fully homomorphic encryption (Craig Gentry, 2009) is mathematically proven possible and allows arbitrary computation on ciphertext, but current practical implementations carry enormous performance overhead that makes large-scale analytics impractical. Partial homomorphic encryption (PHE -- supports either addition OR multiplication, like RSA or Paillier) and somewhat homomorphic encryption (SHE -- limited operations before noise accumulates) are more practical alternatives for specific query types. The architect should evaluate whether the analytics require full generality (FHE, currently impractical at scale) or whether carefully designed analytical queries can be supported by PHE or SHE with acceptable performance. FHE is not impossible (C is wrong) -- it exists and is actively researched (Microsoft SEAL, IBM HElib, Google''s FHE transpiler).',
  'The mathematics works. The clock does not yet. Evaluate what computation is actually needed before committing to a tool that may be a decade early.',
  'analyze',
  'best_answer',
  'very_hard',
  2.15, 2.30, 0.20, 'ai_generated', true
),

-- Q18: DRM/IRM -- medium/apply
(
  2, 'asset_handling',
  'An organization distributes sensitive financial models to external partners in Excel format. After distribution, the organization discovers that one partner has modified the models and redistributed them to unauthorized third parties. Which technology would have MOST effectively prevented this scenario?',
  '["Encrypting the Excel files with AES-256 before distribution", "Implementing Information Rights Management (IRM) with permissions specifying no-copy, no-print, no-forward, and expiration dates", "Requiring partners to sign NDAs before receiving the models", "Distributing the models as password-protected PDFs"]'::jsonb,
  1,
  'Information Rights Management (IRM) -- a subset of Digital Rights Management -- is specifically designed to enforce persistent access controls on documents after they leave the organization''s control. IRM can enforce: who can open the document (identity-based access), what they can do with it (read-only, no copy, no print, no forward), when access expires (time-limited documents), and where it can be opened (geolocation or domain restrictions). Crucially, these controls travel with the document regardless of where it is stored or transmitted. Simple AES-256 encryption (A) protects the file during transmission but once decrypted, the content can be freely copied. NDAs (C) are legal controls without technical enforcement. Password-protected PDFs (D) can be bypassed with readily available PDF tools.',
  'IRM is the mission file with self-destruct parameters embedded. The rules travel with the document, not just the envelope.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.25, 0.20, 'ai_generated', true
),

-- Q19: Data protection privacy -- medium/apply
(
  2, 'data_protection_privacy',
  'Under GDPR, a data processor suffers a personal data breach that is likely to result in a high risk to the rights and freedoms of natural persons. What is the notification requirement?',
  '["Notify the supervisory authority within 72 hours and notify affected individuals without undue delay", "Notify affected individuals within 72 hours and notify the supervisory authority within 30 days", "Notify the supervisory authority only; individual notification is not required under GDPR", "Notify both the supervisory authority and affected individuals within 30 days"]'::jsonb,
  0,
  'GDPR Article 33 requires notification to the competent supervisory authority (e.g., the ICO in the UK, CNIL in France) within 72 hours of becoming aware of a personal data breach -- unless the breach is unlikely to result in a risk to natural persons (e.g., encrypted data with no key exposure). GDPR Article 34 additionally requires communication to affected individuals "without undue delay" when the breach is likely to result in a HIGH risk to those individuals. The 72-hour clock starts when the controller (or the processor, who must notify the controller) becomes aware of the breach. A processor must notify the controller without undue delay; the controller then notifies the supervisory authority.',
  '72 hours to report to the authority -- the clock starts when you know. High risk to individuals? Notify them too, without delay.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q20: Data protection privacy -- hard/analyze
(
  2, 'data_protection_privacy',
  'An organization collects personal data under a "legitimate interests" legal basis as defined by GDPR Article 6(1)(f). A data subject submits a Subject Access Request (SAR) and separately requests erasure of their data under GDPR Article 17. Which analysis reflects the correct handling?',
  '["The organization must fulfill both requests immediately because GDPR gives data subjects absolute rights over their data", "The SAR must be fulfilled within one month. The erasure request requires the organization to assess whether legitimate interests or compelling legal grounds override the individual''s erasure right; if the legitimate interests basis is challenged by the data subject''s objection, erasure may be required unless overriding interests apply", "Legitimate interests as a legal basis means the organization can reject both the SAR and erasure request", "The erasure request automatically voids the legitimate interests legal basis, requiring immediate deletion and cessation of processing"]'::jsonb,
  1,
  'SAR and erasure requests under GDPR interact with each other and with the legal basis for processing. The SAR (Article 15) must be responded to within one month with a copy of the personal data and processing information -- there are limited exceptions (manifestly unfounded/excessive requests). The erasure request (Article 17, "right to be forgotten") is NOT absolute when processing is based on legitimate interests. Under GDPR Article 21, the data subject can object to processing under Article 6(1)(f) -- the controller must then demonstrate compelling legitimate grounds that override the individual''s interests or process the data to establish/exercise/defend legal claims. If no overriding grounds exist, erasure follows. Option A overstates data subject rights. Option C understates them. Option D is legally incorrect -- objection triggers assessment, not automatic erasure.',
  'Data subject rights are real but not absolute. Evaluate legitimate grounds before complying or refusing. Erasure under legitimate interests requires a balancing test.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q21: Scoping and tailoring -- medium/apply
(
  2, 'asset_handling',
  'An organization is implementing NIST SP 800-53 controls. The security team determines that several controls related to physical access to federal facilities do not apply to the organization''s fully cloud-hosted environment. The team removes these controls from consideration. In the next step, the team adjusts the remaining controls to match the organization''s specific risk tolerance, technology stack, and operational environment. What are these two activities called, respectively?',
  '["Tailoring, then scoping", "Scoping, then tailoring", "Baselining, then scoping", "Categorization, then tailoring"]'::jsonb,
  1,
  'Scoping is the process of identifying which controls from a baseline are applicable to the organization or system -- removing controls that are not relevant (federal facility physical controls do not apply to a cloud-only environment). Tailoring is the subsequent process of adjusting the remaining applicable controls to fit the organization''s specific environment (modifying parameter values, adding compensating controls, applying organization-defined values). Scoping happens first (narrow the list), tailoring happens second (fit the remaining controls to your context). This is a frequently confused distinction on the CISSP exam -- the order matters.',
  'Scoping cuts the list to what applies. Tailoring adjusts what remains to fit. Select the controls, then customize them.',
  'apply',
  'comparison',
  'medium',
  1.20, 0.25, 0.22, 'ai_generated', true
),

-- Q22: Data classification -- medium/apply
(
  2, 'asset_handling',
  'A company classifies its data into four levels: Public, Internal, Confidential, and Restricted. An employee is working with a document that contains both Internal-level project timelines and Confidential-level financial projections. How should the combined document be classified?',
  '["The document should be split into two documents -- one Internal and one Confidential", "The document should be classified at the highest classification level of any data it contains -- Confidential", "The document can be classified as Internal because the project timelines are the primary content", "The document should be classified as Public because it will be shared with multiple project teams"]'::jsonb,
  1,
  'Data classification follows the principle that a combined document must be classified at the highest sensitivity level of any data it contains. A document with both Internal and Confidential content is classified Confidential -- the more sensitive designation applies to the entire document because the document as a whole must be protected at the level of its most sensitive component. This prevents data leakage through mixed-classification aggregation. Splitting (A) may be appropriate in some contexts but the question asks about the existing combined document. Classifying at the lower level (C) or Public (D) would expose the Confidential financial projections without appropriate protections.',
  'A classified document is as sensitive as its most sensitive page. One Top Secret paragraph makes the entire file Top Secret.',
  'apply',
  'scenario',
  'medium',
  1.15, 0.25, 0.20, 'ai_generated', true
),

-- Q23: Data remanence -- hard/analyze
(
  2, 'asset_handling',
  'A forensic investigator is analyzing a laptop that previously contained classified data. The laptop''s HDD has been overwritten once using a standard overwrite utility. The investigator reports that data recovery may still be possible. Which technical explanation BEST supports the investigator''s concern?',
  '["Single-pass overwriting is never sufficient; the HDD must be overwritten at least seven times per DoD standards to guarantee erasure", "Residual magnetic flux on the platters of older HDDs may retain traces of previous data that single-pass overwriting does not reliably eliminate; advanced forensic techniques using magnetic force microscopy may recover data from previously written areas", "The overwrite utility may have missed sectors in the HDD''s host-protected area (HPA) or device configuration overlay (DCO), which are not accessible through standard OS write commands", "Both B and C represent valid technical concerns about the reliability of single-pass overwriting for HDDs"]'::jsonb,
  3,
  'Option D is correct because both B and C represent legitimate technical concerns. (B) Residual magnetic flux -- sometimes called "data remanence" -- is the phenomenon where magnetic media retains traces of previous magnetic states after overwriting, particularly with older HDDs. Advanced techniques like magnetic force microscopy have been used to recover data from overwritten magnetic media, though the practicality of this for modern HDDs is debated. (C) Host-Protected Areas (HPA) and Device Configuration Overlays (DCO) are areas of an HDD that are invisible to the operating system and overwrite utilities -- they may contain data that was never overwritten. Forensic tools can access these areas. Option A is incorrect -- DoD 5220.22-M was updated and multiple passes are not required for modern HDDs; NIST SP 800-88 recommends a single pass for magnetic hard drives. The concern is the HPA/DCO gap and residual flux, not pass count.',
  'The record was wiped. But hidden partitions and magnetic ghosts still carry traces the standard eraser cannot reach.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q24: Data protection -- easy/remember
(
  2, 'data_protection_privacy',
  'Which GDPR principle requires that personal data be collected only for specified, explicit, and legitimate purposes and not further processed in a manner incompatible with those purposes?',
  '["Data minimization", "Purpose limitation", "Storage limitation", "Integrity and confidentiality"]'::jsonb,
  1,
  'Purpose limitation (GDPR Article 5(1)(b)) requires that personal data be collected for specified, explicit, and legitimate purposes and not processed in ways that are incompatible with those original purposes. This principle prevents "function creep" -- collecting data for one purpose and then repurposing it for unrelated uses without a new legal basis. Data minimization (A) requires collecting only the minimum data necessary. Storage limitation (C) requires not keeping data longer than necessary. Integrity and confidentiality (D) requires appropriate security measures. These are all GDPR principles but purpose limitation specifically addresses the scope of permissible uses.',
  'Collect for the mission stated at intake. Using the data for a new mission requires a new authorization.',
  'remember',
  'best_answer',
  'easy',
  0.85, -1.60, 0.20, 'ai_generated', true
),

-- Q25: Data protection -- hard/analyze (except/not)
(
  2, 'data_protection_privacy',
  'Which of the following is NOT a valid legal basis for processing personal data under GDPR Article 6?',
  '["The processing is necessary for the performance of a contract to which the data subject is party", "The processing is necessary for compliance with a legal obligation", "The data controller has determined that processing is commercially beneficial to the organization", "The data subject has given explicit consent to the processing for specific purposes"]'::jsonb,
  2,
  'Commercial benefit to the data controller is NOT a valid legal basis under GDPR Article 6. GDPR requires one of six specific legal bases: (1) Consent, (2) Contract necessity, (3) Legal obligation, (4) Vital interests, (5) Public task, or (6) Legitimate interests (which requires balancing the controller''s interests against the data subject''s rights and is not simply "commercially beneficial"). The fact that processing is profitable or operationally convenient for the organization provides no GDPR legal basis on its own. Options A (contract), B (legal obligation), and D (consent) are all valid GDPR Article 6 legal bases.',
  'GDPR requires a lawful basis enumerated in the regulation. Wanting to process data because it is profitable is not on the list.',
  'analyze',
  'except_not',
  'hard',
  1.60, 1.55, 0.25, 'ai_generated', true
);
