-- ═══════════════════════════════════════════════════════════
-- CISSP Quest — Domain 2: Asset Security Question Bank
-- 100 questions for CAT engine
--
-- Distribution:
--   Difficulty: 15 easy, 55 medium, 20 hard, 10 very_hard
--   Cognitive:  10 remember, 20 understand, 45 apply, 25 analyze
--   Type:       25 scenario, 20 first_action, 15 best_answer,
--               10 most_likely, 10 tlatm, 10 comparison,
--               5 calculation, 5 except_not
--   Correct index: 25 each at 0, 1, 2, 3
--
-- IRT parameters computed via irt-defaults.ts logic:
--   b = DIFFICULTY_BASE + COGNITIVE_OFFSET + TYPE_MODIFIER
--   a = COGNITIVE_DISCRIMINATION + TYPE_DISCRIMINATION
--   c = GUESSING_BY_TYPE
--
-- Run AFTER supabase-cat-engine-migration.sql
-- ═══════════════════════════════════════════════════════════

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- ═══════════════════════════════════════════════════════════
-- EASY QUESTIONS (Q1-Q15) — IRT b base = -1.5
-- ═══════════════════════════════════════════════════════════

-- Q1: easy / remember / comparison — correct at 0
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.90, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  2,
  'data_ownership_roles',
  'What is the PRIMARY difference between a data owner and a data custodian?',
  '["The data owner classifies data and is accountable for protection, while the custodian implements day-to-day technical controls", "The data owner performs backups and restores, while the custodian defines access policies", "The data owner is an IT administrator, while the custodian is a senior executive", "The data owner processes data for third parties, while the custodian monitors compliance"]'::jsonb,
  0,
  'The data owner is a senior executive who classifies data, approves access, and bears ultimate accountability for data protection. The data custodian is typically IT staff who implements controls, performs backups, and manages day-to-day storage. Option B reverses the roles. Option C reverses the organizational levels. Option D describes a data processor and compliance officer, not these roles.',
  'Owner = OWNS the decision. Custodian = CARETAKER who does the daily work.',
  'remember',
  'comparison',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q2: easy / remember / best_answer — correct at 1
-- IRT: b = -1.5 + (-0.5) + 0.0 = -2.00, a = 0.8 + 0.0 = 0.80, c = 0.20
(
  2,
  'data_classification',
  'Which of the following BEST describes the purpose of data classification?',
  '["To organize data alphabetically for easier retrieval by end users", "To assign sensitivity levels that drive proportionate protection decisions", "To determine the physical location where data must be stored", "To calculate the total cost of data storage across the enterprise"]'::jsonb,
  1,
  'Data classification assigns sensitivity levels based on value, impact of disclosure, and regulatory requirements. These levels then drive all subsequent protection decisions including access controls, encryption, and handling procedures. Option A describes data indexing. Option C describes data location planning. Option D describes storage cost analysis. None of these capture the core purpose of classification.',
  'CLASSify = assign a CLASS (level) that determines how you protect it.',
  'remember',
  'best_answer',
  'easy',
  0.80, -2.00, 0.20,
  'ai_generated', true
),

-- Q3: easy / understand / best_answer — correct at 2
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.50, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  2,
  'data_states',
  'Which of the following BEST describes data at rest?',
  '["Data being transmitted between two servers over a TLS connection", "Data actively loaded into application memory for processing by a user", "Data stored on a hard drive, database, or backup tape that is not currently being accessed", "Data being entered by a user into a web form before submission"]'::jsonb,
  2,
  'Data at rest refers to data stored on any media that is not actively being accessed or transmitted. This includes hard drives, databases, backup tapes, and USB drives. Option A describes data in transit. Option B describes data in use. Option D describes data in use during input. A common exam trap is backup tapes being transported -- they are still data at rest because the data is not traversing a network.',
  'Data at REST = sitting still on a shelf, RESTING.',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q4: easy / understand / comparison — correct at 3
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.40, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'pseudonymization_tokenization',
  'How does pseudonymization differ from anonymization?',
  '["Pseudonymization permanently removes all identifying data, while anonymization is reversible", "Pseudonymization uses random tokens stored in a vault, while anonymization uses aliases", "Pseudonymization encrypts data with AES-256, while anonymization uses hashing algorithms", "Pseudonymization is reversible and GDPR still applies, while anonymization is irreversible and GDPR does not apply"]'::jsonb,
  3,
  'Pseudonymization replaces identifying data with artificial identifiers (pseudonyms) but is reversible through a separate lookup dataset. GDPR still applies to pseudonymized data, though with reduced requirements. Anonymization permanently and irreversibly removes identifying data, and if done correctly, GDPR no longer applies. Option A reverses the definitions. Option B describes tokenization, not pseudonymization. Option C describes encryption methods, not de-identification techniques.',
  'Pseudo = FAKE name (reversible, like a pen name). Anon = truly ANONYMOUS (gone forever).',
  'understand',
  'comparison',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q5: easy / understand / most_likely — correct at 0
-- IRT: b = -1.5 + 0.0 + 0.1 = -1.40, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'data_destruction',
  'An organization simply deletes files from a hard drive and empties the recycle bin. What is the MOST LIKELY outcome regarding data recovery?',
  '["The data can be easily recovered because only the directory pointers were removed, not the actual data", "The data is permanently destroyed because the operating system overwrites deleted sectors", "The data is partially recoverable depending on the brand of hard drive used", "The data is encrypted by the operating system upon deletion, making recovery impossible"]'::jsonb,
  0,
  'When files are deleted and the recycle bin is emptied, only the file system pointers are removed. The actual data remains on the disk until the sectors are overwritten by new data. This is the lowest level of sanitization (erasing) and data is easily recoverable with forensic tools. Option B is incorrect because the OS does not automatically overwrite. Option C incorrectly ties recovery to drive brand. Option D is incorrect because deletion does not trigger encryption.',
  'DELETE just removes the ADDRESS, not the HOUSE. The data is still living there.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),

-- Q6: easy / apply / scenario — correct at 1
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_ownership_roles',
  'A hospital''s Chief Medical Officer determines that patient treatment records should be classified as confidential and restricts access to authorized clinical staff. The IT department then configures access controls, implements encryption, and manages daily backups of those records. In this scenario, which role is the IT department performing?',
  '["Data owner responsible for classification and accountability", "Data custodian responsible for implementing technical controls", "Data controller determining the purpose of data processing", "Data steward ensuring data accuracy and quality"]'::jsonb,
  1,
  'The IT department is performing the data custodian role by implementing the technical controls (access controls, encryption, backups) as directed by the data owner. The CMO acts as the data owner by classifying the data and defining access policies. Option A is wrong because the IT department did not classify the data. Option C describes the GDPR controller role. Option D describes ensuring data quality, which is the steward''s business-level function.',
  'OCCU-PS: Owner Classifies, Custodian Upholds (implements), Processor Serves controller, Steward checks quality.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q7: easy / apply / first_action — correct at 2
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.90, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A company acquires a smaller firm and gains access to a large repository of unclassified customer data. What should the acquiring company do FIRST with this data?',
  '["Encrypt all the data using AES-256 before anyone accesses it", "Implement a data loss prevention solution to monitor the repository", "Classify the data based on its sensitivity, value, and applicable regulatory requirements", "Archive the data to long-term storage until a full audit can be completed"]'::jsonb,
  2,
  'Before you can protect data, you must first classify it. Classification determines the sensitivity level, which then drives the selection of appropriate controls such as encryption, access restrictions, and DLP. Option A applies a control without knowing what level of protection is needed. Option B monitors data without understanding its classification. Option D delays protection without addressing the fundamental classification need. You cannot protect what you have not classified.',
  'FIRST classify, THEN protect. You cannot choose the right lock without knowing what is inside the safe.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q8: easy / apply / best_answer — correct at 3
-- IRT: b = -1.5 + 0.3 + 0.0 = -1.20, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'labeling_marking',
  'A government agency needs to ensure that both automated systems and human personnel can identify the classification level of sensitive documents. Which approach BEST achieves this?',
  '["Apply only digital watermarks visible when documents are printed", "Use electronic metadata tags exclusively for all classification identification", "Rely on employee training to verbally communicate classification levels", "Implement both system-readable labels (metadata) and human-readable markings (headers and watermarks)"]'::jsonb,
  3,
  'Effective classification identification requires both labeling (system-readable metadata and electronic tags for automated systems) and marking (human-readable elements like headers, footers, and watermarks for personnel). Option A addresses only human-readable needs. Option B addresses only system-readable needs. Option C is unreliable and does not provide persistent identification. The combination ensures classification is recognized by both humans and systems.',
  'Labels = Logical (for machines). Markings = Manual (for humans). You need BOTH.',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
),

-- Q9: easy / apply / scenario — correct at 0
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_states',
  'A financial analyst downloads a quarterly earnings report from the company database to her workstation, opens it in a spreadsheet application, and begins modifying figures for a forecast model. The report was stored encrypted on the database server. While the analyst is actively editing, in which state is the data on her workstation?',
  '["Data in use, because it is actively loaded in memory and being processed by the application", "Data at rest, because it resides on the workstation hard drive", "Data in transit, because it was recently transferred from the database server", "Data at rest encrypted, because the original file was encrypted on the server"]'::jsonb,
  0,
  'Data that is actively loaded into memory and being processed by a user or application is data in use. The transfer from the server is complete, so it is no longer in transit. While a copy may exist on the workstation''s disk (data at rest), the actively edited version in application memory is in use. Option B ignores that the data is being actively processed. Option C describes the prior state during transfer. Option D incorrectly assumes server encryption persists on the workstation.',
  'Data in USE = someone is USING it right now. In memory, on screen, being edited.',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q10: easy / understand / scenario — correct at 1
-- IRT: b = -1.5 + 0.0 + 0.2 = -1.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  2,
  'data_classification',
  'A defense contractor processes both Secret and Confidential documents on the same workstation. A security auditor asks what classification level should be assigned to the workstation itself. The IT manager reviews the classification policy. What classification should the workstation receive?',
  '["Confidential, because that is the most frequently processed classification level", "Secret, because hardware inherits the classification of the highest level of data it processes", "Unclassified, because the workstation itself does not contain classified information", "A dual classification label showing both Secret and Confidential"]'::jsonb,
  1,
  'Hardware and media inherit the classification of the highest level of data they contain or process. Since the workstation processes Secret data, it must be classified as Secret regardless of what other levels it also handles. Option A incorrectly bases classification on frequency. Option C ignores that the workstation does contain/process classified data. Option D is not a recognized classification approach; the highest level prevails.',
  'Hardware takes the HIGHEST classification of data it touches. One drop of Top Secret makes the whole system Top Secret.',
  'understand',
  'scenario',
  'easy',
  1.20, -1.30, 0.20,
  'ai_generated', true
),

-- Q11: easy / remember / most_likely — correct at 2
-- IRT: b = -1.5 + (-0.5) + 0.1 = -1.90, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  2,
  'privacy_principles',
  'Under GDPR, an individual whose personal data is collected and processed by an organization is MOST LIKELY referred to as which of the following?',
  '["Data controller", "Data processor", "Data subject", "Data custodian"]'::jsonb,
  2,
  'Under GDPR, the individual whose personal data is being collected, processed, or stored is called the data subject. The data controller determines the purposes and means of processing. The data processor processes data on behalf of the controller. Data custodian is a CISSP role concept, not a GDPR-defined term. The subject has rights including access, rectification, erasure, and portability.',
  'The data SUBJECT is the SUBJECT of the data -- the person it is ABOUT.',
  'remember',
  'most_likely',
  'easy',
  0.90, -1.90, 0.22,
  'ai_generated', true
),

-- Q12: easy / apply / first_action — correct at 3
-- IRT: b = -1.5 + 0.3 + 0.3 = -0.90, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'retention_policies',
  'A company''s legal department notifies the CISO that a lawsuit has been filed against the organization. The company has an automated 90-day email deletion policy. What should the CISO do FIRST?',
  '["Encrypt all email archives to prevent unauthorized access during the lawsuit", "Notify all employees to manually save any relevant emails to a shared drive", "Begin a forensic investigation of all email servers to identify relevant communications", "Implement a litigation hold to suspend automated deletion of potentially relevant data"]'::jsonb,
  3,
  'When litigation is reasonably anticipated or filed, the organization must immediately implement a litigation hold to preserve all potentially relevant data. Failure to do so constitutes spoliation of evidence and carries severe legal penalties. Option A protects confidentiality but does not address preservation. Option B is ad hoc and unreliable. Option C may be needed later but is not the first priority; preservation comes before investigation.',
  'Lawsuit filed? HOLD everything! Litigation HOLD = FREEZE all deletion immediately.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),

-- Q13: easy / understand / best_answer — correct at 0
-- IRT: b = -1.5 + 0.0 + 0.0 = -1.50, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  2,
  'data_destruction',
  'Which method BEST describes degaussing as a data sanitization technique?',
  '["Applying a strong magnetic field to erase data on magnetic media, potentially rendering the drive unusable", "Physically shredding the storage media into pieces smaller than 2mm", "Encrypting all data on a drive and then destroying the encryption keys", "Overwriting all data sectors with random patterns multiple times"]'::jsonb,
  0,
  'Degaussing uses a powerful magnetic field to disrupt the magnetic domains on storage media, erasing all data. It often renders the drive unusable because it also destroys the servo tracks needed for operation. Critically, degaussing only works on magnetic media (HDDs, tapes) and has no effect on SSDs, flash, or optical media. Option B describes physical destruction. Option C describes crypto shredding. Option D describes clearing/overwriting.',
  'DeGAUSS = De-MAGNET. Gauss is a unit of magnetic field strength. Magnetic only!',
  'understand',
  'best_answer',
  'easy',
  1.00, -1.50, 0.20,
  'ai_generated', true
),

-- Q14: easy / apply / scenario — correct at 2
-- IRT: b = -1.5 + 0.3 + 0.2 = -1.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'dlp',
  'A marketing department employee attempts to email a spreadsheet containing 500 customer Social Security numbers to her personal email address. The company''s email gateway blocks the message and alerts the security team. The employee claims she needed to work from home. Which technology MOST LIKELY prevented this data exfiltration?',
  '["A cloud access security broker monitoring SaaS application usage", "An intrusion detection system analyzing network traffic patterns", "A network data loss prevention system scanning outbound email content", "A digital rights management system enforcing document licensing"]'::jsonb,
  2,
  'Network DLP sits at the network edge and scans outbound communications for sensitive content patterns such as Social Security numbers. It detected the SSN pattern in the spreadsheet and blocked the transmission. Option A describes a CASB, which monitors cloud service usage, not email content. Option B detects intrusions, not data exfiltration by pattern. Option D controls document usage rights, not content-based transmission blocking.',
  'DLP = Data Loss PREVENTION. Network DLP guards the EXIT (email gateway, web proxy).',
  'apply',
  'scenario',
  'easy',
  1.50, -1.00, 0.20,
  'ai_generated', true
),

-- Q15: easy / understand / first_action — correct at 1
-- IRT: b = -1.5 + 0.0 + 0.3 = -1.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  2,
  'data_lifecycle',
  'An organization is establishing a new data governance program. What should be done FIRST before any technical controls are implemented?',
  '["Deploy encryption across all databases and file servers", "Identify and inventory all data assets and assign ownership", "Purchase a comprehensive DLP solution and configure policies", "Conduct penetration testing against data storage systems"]'::jsonb,
  1,
  'Before implementing any technical controls, the organization must first identify what data it has, where it resides, and who is responsible for it. Asset identification and ownership assignment form the foundation of any data governance program. Option A implements a control without knowing what needs protection. Option C purchases technology without understanding the data landscape. Option D tests security without first establishing what requires protection.',
  'You cannot protect what you do not know you have. INVENTORY first, then PROTECT.',
  'understand',
  'first_action',
  'easy',
  1.20, -1.20, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- MEDIUM QUESTIONS (Q16-Q70) — IRT b base = 0.0
-- ═══════════════════════════════════════════════════════════

-- Q16: medium / understand / scenario — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  2,
  'data_ownership_roles',
  'A multinational corporation outsources its payroll processing to a third-party service provider. The corporation defines which employee data elements are collected, specifies how long the data must be retained, and dictates the security controls the provider must implement. Under GDPR terminology, which role does the third-party payroll provider fulfill?',
  '["Data owner, because they physically possess and store the employee data", "Data controller, because they have direct access to process the personal data", "Data steward, because they ensure the accuracy of payroll calculations", "Data processor, because they process personal data on behalf of and as directed by the controller"]'::jsonb,
  3,
  'Under GDPR, the data processor processes personal data on behalf of and under the direction of the data controller. The corporation is the controller because it determines the purposes and means of processing. The payroll provider merely executes processing as instructed. Option A confuses possession with ownership. Option B confuses access with control authority. Option C describes a quality assurance role, not the GDPR processing relationship.',
  'Controller = CONTROLS the what and why. Processor = PROCESSES as told. The company calls the shots; the vendor follows orders.',
  'understand',
  'scenario',
  'medium',
  1.20, 0.20, 0.20,
  'ai_generated', true
),

-- Q17: medium / apply / first_action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_destruction',
  'A cloud service provider hosts an organization''s sensitive financial data across multiple shared storage arrays in geographically distributed data centers. The organization decides to terminate the cloud contract and must ensure all its data is irrecoverably removed. Physical access to the storage hardware is not possible. Which sanitization method is MOST appropriate?',
  '["Crypto shredding, by destroying all encryption keys used to protect the data", "Degaussing the cloud provider''s storage arrays remotely", "Requesting the cloud provider to perform a full disk format on all affected arrays", "Overwriting the data sectors with random patterns using a remote management tool"]'::jsonb,
  0,
  'Crypto shredding (cryptographic erasure) is the primary sanitization method for cloud environments where physical access to media is not feasible. By encrypting data with strong algorithms and then securely destroying all copies of the encryption keys, the data becomes permanently unreadable. Option B is impossible because degaussing requires physical access and does not work on SSDs. Option C only removes directory pointers. Option D is impractical in shared multi-tenant storage environments.',
  'Cloud = Crypto shredding. No physical access? Destroy the KEYS, not the DRIVES.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q18: medium / apply / first_action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A healthcare organization discovers that patient records stored in a legacy database have never been formally classified. Some records date back fifteen years and may be subject to multiple regulatory requirements. What should the organization do FIRST?',
  '["Immediately encrypt all records in the legacy database with AES-256", "Classify the data based on sensitivity, regulatory requirements, and organizational value", "Migrate all records to a modern database platform with built-in security features", "Delete all records older than seven years to reduce the organization''s risk exposure"]'::jsonb,
  1,
  'Classification must precede all other protective actions because it determines the appropriate level of protection, retention requirements, and handling procedures. Without classification, the organization cannot know which controls are needed or whether deletion is legally permissible. Option A applies a control without knowing if it is sufficient or necessary. Option C addresses technology but not the governance gap. Option D could violate HIPAA retention requirements if records must be kept longer.',
  'Always CLASSIFY before you CONTROL. Step 1 in any data governance gap: know what you have and how sensitive it is.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q19: medium / apply / best_answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'casb',
  'An organization has migrated several workloads to multiple cloud providers but is struggling to enforce consistent security policies across all cloud environments. Which solution BEST addresses this challenge?',
  '["Deploy a network intrusion prevention system at each cloud provider''s entry point", "Implement endpoint detection and response agents on all cloud virtual machines", "Deploy a Cloud Access Security Broker to enforce unified policies between users and cloud services", "Install a web application firewall in front of each cloud-hosted application"]'::jsonb,
  2,
  'A CASB sits logically between users and cloud services, providing a single point of policy enforcement across multiple cloud providers. It handles authentication, authorization, logging, monitoring, and can detect shadow IT. Option A provides network security but not unified policy enforcement across cloud providers. Option B monitors endpoints but does not enforce cloud access policies. Option D protects individual applications but does not provide unified cross-cloud governance.',
  'CASB = Cloud Access Security BROKER. It BROKERS the relationship between your policies and the cloud.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q20: medium / apply / first_action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'A research hospital wants to share patient outcome data with a university for a medical study. The hospital must comply with GDPR and wants to minimize its compliance burden while still allowing researchers to analyze treatment effectiveness. The hospital replaces patient names and identifiers with random codes and retains a separate lookup table. Which data protection technique is the hospital using?',
  '["Anonymization, which permanently removes all identifying information", "Tokenization, which replaces data with random tokens stored in a secure vault", "Data masking, which permanently alters production data for research use", "Pseudonymization, which replaces identifiers with artificial codes while maintaining a reversible link"]'::jsonb,
  3,
  'The hospital is using pseudonymization because it replaces identifying data with artificial identifiers while retaining a separate lookup table that allows reversal. GDPR recognizes pseudonymization as a data protection technique with reduced compliance requirements, but the data remains subject to GDPR. Option A is wrong because the hospital retains the lookup table, making it reversible. Option B describes tokenization which typically involves a third-party vault. Option C describes a different technique that does not maintain reversibility.',
  'Pseudo = FAKE identity but can be UNMASKED. The lookup table is the key difference from anonymization.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q21: medium / understand / comparison — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'data_states',
  'How does link encryption differ from end-to-end encryption when protecting data in transit?',
  '["Link encryption encrypts the entire packet including headers and decrypts at each node, while end-to-end encrypts only the payload and keeps it encrypted until the destination", "Link encryption protects only the data payload, while end-to-end encryption protects headers and payload simultaneously", "Link encryption uses asymmetric algorithms exclusively, while end-to-end encryption uses only symmetric algorithms", "Link encryption is used only for wireless networks, while end-to-end encryption is used only for wired networks"]'::jsonb,
  0,
  'Link encryption encrypts the entire packet (headers and data) between each pair of nodes but decrypts at every intermediate node, meaning plaintext is exposed at each hop. End-to-end encryption encrypts only the data payload from source to destination, leaving routing headers visible but keeping data encrypted through all intermediary nodes. Option B reverses the descriptions. Option C incorrectly limits each to specific algorithm types. Option D incorrectly limits each to specific network types.',
  'LINK = encrypts EVERYTHING between LINKS (nodes), but exposes at each stop. END-to-END = data stays encrypted from END to END.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q22: medium / apply / tlatm — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  2,
  'retention_policies',
  'As the newly appointed CISO, you discover that your organization retains all customer data indefinitely with no formal retention policy. The general counsel warns that several previous lawsuits required expensive e-discovery processes due to the volume of retained data. Which management decision BEST addresses this situation?',
  '["Immediately delete all customer data older than one year to minimize legal exposure", "Establish a formal data retention policy aligned with legal requirements, business needs, and industry regulations, then implement automated enforcement", "Outsource all data storage to a cloud provider to transfer retention responsibility", "Assign the IT department full authority to determine how long each type of data should be kept"]'::jsonb,
  1,
  'A manager establishes governance frameworks rather than making ad hoc decisions. A formal retention policy considers legal requirements, regulatory mandates, and business needs, with automated enforcement to ensure consistency. Option A is reckless and could violate regulations requiring longer retention. Option C does not transfer accountability and ignores the governance gap. Option D places a business and legal decision in the hands of a technical team without appropriate authority.',
  'Think Like a Manager: Build POLICY first, then AUTOMATE enforcement. Retention = Legal + Business + Regulatory requirements.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q23: medium / apply / calculation — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.70, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  2,
  'drm_irm',
  'A software company distributes its proprietary applications to enterprise customers through a licensing portal. Customers download the application but can only run it after online activation, which verifies the license key against the vendor''s server. The application periodically re-authenticates and logs all usage. If the license expires, the application becomes non-functional. Which technology framework governs these protections?',
  '["Data Loss Prevention with endpoint enforcement agents", "Information Rights Management applied to internal documents", "Digital Rights Management using licensing, persistent authentication, and audit trails", "Cloud Access Security Broker enforcing access policies"]'::jsonb,
  2,
  'This scenario describes classic DRM techniques: licensing agreements, persistent online authentication, continuous audit trails, and automatic expiration. DRM protects copyrighted works and intellectual property from unauthorized use. Option A prevents data exfiltration, not software licensing enforcement. Option B is a subset of DRM focused on organizational documents, not commercial software distribution. Option D monitors cloud service access, not software licensing.',
  'DRM = Digital Rights MANAGEMENT. It MANAGES your RIGHT to use digital content (license, authenticate, audit, expire).',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q24: medium / understand / except_not — correct at 3
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + (-0.1) = 0.90, c = 0.25
(
  2,
  'privacy_principles',
  'All of the following are OECD Privacy Principles EXCEPT:',
  '["Collection Limitation Principle", "Purpose Specification Principle", "Accountability Principle", "Right to Be Forgotten Principle"]'::jsonb,
  3,
  'The OECD Privacy Principles include Collection Limitation, Data Quality, Purpose Specification, Use Limitation, Security Safeguards, Openness, Individual Participation, and Accountability. The Right to Be Forgotten is a GDPR concept (Article 17), not an OECD principle. This is a frequently tested distinction on the CISSP exam. Options A, B, and C are all legitimate OECD principles.',
  'OECD has 8 principles. The Right to be Forgotten is a GDPR baby, not an OECD original.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q25: medium / apply / first_action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_destruction',
  'An organization is decommissioning a batch of servers that processed top-secret government data. The servers contain both traditional HDDs and modern NVMe SSDs. What should the security team do FIRST in the sanitization process?',
  '["Identify the media types and select appropriate destruction methods for each, since SSDs and HDDs require different sanitization approaches", "Degauss all drives simultaneously to ensure rapid and complete data erasure across the entire batch", "Overwrite all drives with a seven-pass DoD pattern to meet government sanitization standards", "Format all drives and reinstall the operating system to prepare them for transfer to a lower classification"]'::jsonb,
  0,
  'The first step is identifying the media types because SSDs and HDDs require fundamentally different sanitization approaches. Degaussing works on HDDs but has zero effect on SSDs. Overwriting is unreliable on SSDs due to wear-leveling. For top-secret data, physical destruction is the only trusted method for both types. Option B would fail for the SSDs. Option C is unreliable for SSDs and insufficient for top-secret data. Option D provides no actual sanitization.',
  'FIRST identify WHAT you have, THEN choose HOW to destroy it. SSDs and HDDs are different animals.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- -------------------------------------------------------
-- Q26-Q40: medium continued
-- -------------------------------------------------------

-- Q26: medium / analyze / scenario — correct at 1
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.80, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'data_sovereignty',
  'A European financial services company uses a US-based cloud provider for its customer data processing. The cloud provider''s primary data center is in Virginia with a failover site in Ireland. During a routine audit, the company discovers that some customer records were replicated to a secondary facility in Singapore without notification. The compliance officer must assess the regulatory impact. Which issue is MOST critical?',
  '["The data may not be encrypted during replication to the Singapore facility", "GDPR cross-border data transfer restrictions may have been violated because Singapore has not received an EU adequacy decision", "The Singapore facility may have different physical security standards than the Virginia data center", "The cloud provider''s service level agreement may not cover the Singapore facility"]'::jsonb,
  1,
  'GDPR restricts transfers of personal data to countries outside the EU unless adequate safeguards exist. Singapore has not received an adequacy decision from the EU, meaning transfers require additional safeguards such as standard contractual clauses or binding corporate rules. Unauthorized replication to Singapore without these safeguards violates GDPR. Option A is a security concern but not the most critical regulatory issue. Option C and D are operational concerns subordinate to the regulatory violation.',
  'Data SOVEREIGNTY = data follows the LAWS of where it LIVES. GDPR restricts where EU data can travel.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q27: medium / apply / most_likely — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.1 = 0.40, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  2,
  'data_remanence',
  'An organization replaces its fleet of enterprise SSDs every three years. The IT team performs a standard overwrite using a single-pass zero-fill before reselling the drives. A security consultant warns that this approach may be insufficient. What is the MOST LIKELY reason the consultant raised this concern?',
  '["Single-pass overwrites do not meet the DoD 5220.22-M standard which requires seven passes", "SSDs use wear-leveling algorithms that distribute writes across cells, leaving original data in cells that were not overwritten", "The zero-fill pattern is easily distinguishable from actual data under electron microscope analysis", "SSD firmware automatically backs up data to a hidden partition that cannot be overwritten"]'::jsonb,
  2,
  'SSDs use wear-leveling algorithms to extend drive life by distributing writes evenly across memory cells. When an overwrite command is issued, the SSD controller may write to different physical cells than those containing the original data, leaving remnants in the original cells. This makes standard overwriting unreliable for SSDs. Option A is outdated and not specific to SSDs. Option C is not the primary concern with SSDs. Option D is not how SSD firmware operates.',
  'SSD wear-leveling = the SSD decides WHERE to write. Your overwrite may go to a NEW cell while the OLD cell keeps its secrets.',
  'apply',
  'most_likely',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),

-- Q28: medium / apply / first_action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'classification_categorization',
  'A company has recently experienced rapid growth through acquisitions. Each acquired company used different data classification schemes — some had three levels, others had five, and one had no formal classification at all. The CISO needs to integrate these into a unified data governance program. What should be done FIRST?',
  '["Automatically assign the highest classification level to all data from acquired companies until review is complete", "Purchase a data classification tool that can scan and auto-classify all data across the enterprise", "Mandate that all acquired companies immediately adopt the parent company''s classification scheme", "Establish a unified classification policy defining standard levels, criteria, and ownership responsibilities"]'::jsonb,
  3,
  'Before any technical implementation or operational changes, the organization needs a unified classification policy that defines standard levels, criteria for each level, and clear ownership responsibilities. This policy provides the foundation for all subsequent classification activities. Option A over-classifies and wastes resources. Option B is a tool without governance. Option C imposes a scheme without first ensuring it is comprehensive and appropriate for the merged entity.',
  'POLICY before PRACTICE. You cannot classify until you define the classification system itself.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q29: medium / understand / best_answer — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  2,
  'information_obfuscation',
  'A retail company wants to provide realistic customer data to its development team for application testing without exposing actual customer information. Which technique BEST meets this requirement?',
  '["Data fabrication, creating synthetic datasets that mimic real data patterns without containing actual customer information", "Data trimming, showing only the last four digits of customer identification numbers", "Pseudonymization, replacing customer names with coded identifiers while retaining a lookup table", "Full database encryption using AES-256 with developer-accessible decryption keys"]'::jsonb,
  0,
  'Data fabrication creates entirely synthetic datasets that maintain the statistical properties and format of real data without containing any actual customer information. This is ideal for development and testing environments. Option B still exposes partial real data. Option C still contains real data with reversible identifiers, creating unnecessary risk in a dev environment. Option D gives developers access to real data through decryption, defeating the purpose.',
  'FABRICATE = make FAKE data. Developers get realistic data to test with, but zero real customer exposure.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q30: medium / apply / calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.70, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  2,
  'scoping_tailoring',
  'A small e-commerce company is implementing NIST SP 800-53 security controls. During the review, the security team identifies several controls related to mainframe computing environments. The company operates entirely on cloud infrastructure with no mainframe systems. The team documents the justification and removes these controls from their baseline. Which process is the team performing?',
  '["Tailoring the baseline by modifying controls to fit organizational requirements", "Scoping the baseline by removing controls that are not applicable to the system being protected", "Standards selection by choosing which NIST controls to adopt", "Risk assessment by evaluating the likelihood of mainframe-related threats"]'::jsonb,
  1,
  'Scoping is the process of reviewing baseline controls and eliminating those that do not apply to the specific system or environment being protected. Removing mainframe controls for a cloud-only environment is a textbook example of scoping. Option A describes tailoring, which modifies applicable controls rather than removing inapplicable ones. Option C describes choosing which standards framework to adopt. Option D evaluates risk rather than control applicability.',
  'S = Scoping = SUBTRACT. T = Tailoring = TWEAK. Removing inapplicable controls = Scoping.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q31: medium / analyze / tlatm — correct at 2
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.10, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'data_collection_limitation',
  'Your organization''s marketing department wants to collect customers'' browsing history, purchase patterns, social media activity, religious affiliation, and political views for a new personalization engine. As the Data Protection Officer, which management recommendation is MOST appropriate?',
  '["Approve the collection because more data enables better customer experiences and increases revenue", "Allow collection of all requested data but require encryption at rest and in transit", "Recommend limiting collection to browsing history and purchase patterns, rejecting religious and political data as unnecessary for personalization and high-risk under privacy regulations", "Deny all data collection until a full privacy impact assessment has been completed for every data element"]'::jsonb,
  2,
  'The data collection limitation principle states that organizations should collect only data that is necessary for the stated purpose. Browsing history and purchase patterns directly support personalization, but religious affiliation and political views are sensitive categories under GDPR and most privacy regulations with no clear connection to product personalization. Option A ignores privacy principles. Option B applies controls but does not address excessive collection. Option D is overly restrictive for clearly justifiable data elements.',
  'Think Like a Manager: Collect only what you NEED. More data = more risk = more liability. PURPOSE drives COLLECTION.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q32: medium / apply / scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_states',
  'A medical research firm uses homomorphic encryption to allow a cloud-based analytics platform to process patient health records and generate statistical reports. The analytics platform never decrypts the data during computation. The research firm can decrypt only the final results using their private key. This approach primarily protects data in which state?',
  '["Data at rest, because the data is stored encrypted on the cloud platform", "Data in transit, because the data moves between the research firm and the cloud", "Data at rest and in transit simultaneously through combined encryption modes", "Data in use, because homomorphic encryption allows computation on data without decryption"]'::jsonb,
  3,
  'Homomorphic encryption specifically protects data in use by allowing computations to be performed on encrypted data without first decrypting it. The results, when decrypted, are the same as if the operations had been performed on plaintext. While the data may also be at rest (stored encrypted) or in transit, the defining characteristic of this technology is protecting data during active processing. Options A, B, and C address other states but miss the core purpose of homomorphic encryption.',
  'Homomorphic = data stays encrypted even while being USED. The cloud does math on ciphertext. Magic math on locked boxes.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q33: medium / analyze / best_answer — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.0 = 0.60, a = 1.5 + 0.0 = 1.50, c = 0.20
(
  2,
  'retention_policies',
  'An organization''s data retention policy specifies a three-year retention period for financial records. During a routine audit, the compliance team discovers that the finance department has been retaining records for ten years because the department head believes longer retention is safer. Which statement BEST describes the risk of this practice?',
  '["Over-retention increases legal exposure because retained data can be subject to e-discovery in litigation, creating unnecessary cost and liability", "Over-retention is beneficial because it provides more historical data for financial trend analysis", "Over-retention only creates storage cost issues but has no legal or compliance implications", "Over-retention is required by SOX regulations for all publicly traded companies"]'::jsonb,
  0,
  'Over-retention creates significant legal liability. Data retained beyond required periods can be subpoenaed during litigation, increasing e-discovery costs and potentially exposing the organization to information that could be used against it. The Boeing case, where 14,000 backup tapes led to a $92.5 million settlement, illustrates this risk. Option B ignores the legal risk. Option C understates the consequences. Option D misrepresents SOX requirements, which specify minimum retention, not indefinite retention.',
  'More data kept = more data discoverable in court. The Boeing lesson: 14,000 tapes = $92.5 million settlement.',
  'analyze',
  'best_answer',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q34: medium / understand / most_likely — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'casb',
  'An organization''s security team discovers that employees across multiple departments have been signing up for unauthorized cloud storage services to share files with external partners. The security team has no visibility into which services are being used or what data is being uploaded. Which technology is MOST LIKELY to address this challenge?',
  '["Network-based data loss prevention scanning outbound web traffic", "A Cloud Access Security Broker capable of discovering and monitoring shadow IT usage", "A security information and event management system correlating log data", "An endpoint protection platform monitoring local file system changes"]'::jsonb,
  1,
  'A CASB is specifically designed to detect and monitor shadow IT -- unauthorized cloud service usage by employees. It sits between users and cloud services, providing visibility into which services are being used, who is using them, and what data is being transferred. Option A can block sensitive data but lacks cloud service discovery capabilities. Option C aggregates logs but does not provide real-time cloud service discovery. Option D monitors local activity, not cloud service registrations.',
  'Shadow IT = employees going ROGUE with cloud services. CASB = the SHADOW detective that finds them.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q35: medium / apply / first_action — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_destruction',
  'A hospital is replacing its aging MRI machine that has an integrated computer system with a hard drive containing years of patient scan data classified as PHI. The hospital plans to donate the MRI to a medical school. What should be done FIRST regarding the hard drive?',
  '["Donate the entire MRI including the hard drive, since the recipient is also a medical institution", "Encrypt the hard drive contents and provide the decryption key to the medical school", "Remove or sanitize the hard drive to ensure all PHI is irrecoverably destroyed before donation", "Format the hard drive and reinstall the MRI operating system before transferring"]'::jsonb,
  2,
  'PHI must be protected regardless of who receives the equipment. Before any transfer, the hard drive must be sanitized or removed to ensure no patient data remains accessible. HIPAA requires the protection of PHI at every stage of the data lifecycle, including disposal. Option A violates HIPAA by transferring PHI without authorization. Option B shares PHI with an unauthorized party. Option D provides insufficient sanitization, as formatting does not prevent data recovery.',
  'PHI follows the drive, not the machine. Sanitize BEFORE donating. HIPAA does not care that the recipient is a hospital.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q36: medium / apply / first_action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'labeling_marking',
  'A government agency requires that all classified documents display their classification level in both printed and digital formats. The agency''s automated document management system must also enforce access restrictions based on the classification level without human intervention. The security administrator configures headers, footers, and watermarks on all documents, and also embeds security metadata into each file''s properties. What combination of techniques is the administrator implementing?',
  '["Encryption and access control lists applied to the document management system", "Data loss prevention rules combined with endpoint protection policies", "Digital rights management with persistent online authentication requirements", "Marking through human-readable visual indicators combined with labeling through system-readable metadata"]'::jsonb,
  3,
  'Marking refers to human-readable indicators such as headers, footers, and watermarks that allow people to visually identify classification levels. Labeling refers to system-readable attributes such as metadata, electronic labels, and digital signatures that allow automated systems to enforce policies. The administrator is implementing both. Option A describes access control mechanisms, not classification identification. Option B describes monitoring tools. Option C describes content protection, not classification identification.',
  'Marking = for HUMAN eyes (watermarks, headers). Labeling = for MACHINE eyes (metadata, tags). Both needed for full coverage.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q37: medium / analyze / most_likely — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.70, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'dlp',
  'A company deploys a network DLP solution at its internet gateway. An employee encrypts a file containing customer credit card numbers using PGP before attaching it to an email and sending it to a personal account. The DLP system does not flag or block the message. What is the MOST LIKELY reason the DLP failed to detect this exfiltration?',
  '["DLP cannot inspect encrypted content, so the PGP-encrypted file bypassed pattern matching and content inspection", "The DLP was configured to monitor only inbound traffic and ignored outbound email", "Network DLP solutions only scan web traffic and do not examine email attachments", "The credit card numbers were formatted in a non-standard way that the DLP could not recognize"]'::jsonb,
  0,
  'DLP solutions rely on inspecting unencrypted content for patterns, keywords, and sensitive data formats. When data is encrypted before reaching the DLP, the system cannot inspect the ciphertext and will not detect sensitive content. This is a well-known limitation of DLP technology. Option B describes a misconfiguration, not a fundamental limitation. Option C is incorrect since network DLP does scan email. Option D is possible but not the most likely cause given the encryption.',
  'DLP sees through GLASS, not through WALLS. Encryption = a wall DLP cannot see through.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q38: medium / apply / calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.70, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  2,
  'privacy_principles',
  'A European e-commerce company with global annual revenue of 800 million Euros suffers a GDPR violation for unlawful processing of personal data. Under GDPR, what is the MAXIMUM potential fine the supervisory authority could impose?',
  '["20 million Euros, the fixed maximum for all GDPR violations", "32 million Euros, because the penalty is 4% of global annual revenue which exceeds the 20 million Euro threshold", "80 million Euros, because the penalty is 10% of global annual revenue", "800 million Euros, because the penalty can equal total global annual revenue"]'::jsonb,
  1,
  'GDPR fines for the most serious violations can be up to 4% of global annual revenue or 20 million Euros, whichever is HIGHER. For this company: 4% of 800 million = 32 million Euros. Since 32 million exceeds 20 million, the maximum fine is 32 million Euros. Option A incorrectly treats 20 million as a fixed cap. Option C uses an incorrect percentage (10%). Option D uses an incorrect percentage (100%).',
  'GDPR 4-20 Rule: 4% of revenue OR 20 million Euros, whichever is HIGHER. Always calculate both and pick the bigger number.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q39: medium / understand / comparison — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'scoping_tailoring',
  'How does scoping differ from tailoring when implementing a security baseline?',
  '["Scoping adds additional controls beyond the baseline, while tailoring removes unnecessary controls", "Scoping involves selecting which framework to adopt, while tailoring involves selecting individual controls", "Scoping removes controls that do not apply to the system, while tailoring modifies applicable controls to align with organizational requirements", "Scoping is performed by auditors, while tailoring is performed by system administrators"]'::jsonb,
  2,
  'Scoping reviews baseline controls and removes those not applicable to the system being protected (e.g., removing mainframe controls from a cloud environment). Tailoring modifies the remaining applicable controls to align with the organization''s mission, risk tolerance, and specific requirements. Scoping subtracts; tailoring tweaks. Option A reverses the concepts. Option B confuses scoping with standards selection. Option D incorrectly assigns roles.',
  'Scoping = SUBTRACT what does not apply. Tailoring = TWEAK what remains to fit your org.',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q40: medium / apply / tlatm — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  2,
  'data_ownership_roles',
  'The CEO of a mid-size company asks why the organization needs both a data owner and a data custodian for the same dataset. As the CISO, which explanation BEST justifies this separation of roles from a management perspective?',
  '["It reduces IT costs by distributing the workload between two different departments", "It satisfies auditor requirements for showing dual control over sensitive data", "It ensures the data custodian has final authority over who can access the data", "It separates accountability for data protection decisions from the technical implementation, ensuring proper governance and expertise at each level"]'::jsonb,
  3,
  'The separation exists because data protection requires both business judgment (what to protect and why) and technical expertise (how to protect it). The data owner, as a senior executive, has the authority and accountability for classification and access decisions. The custodian has the technical expertise to implement those decisions properly. Option A focuses on cost, missing the governance rationale. Option B cites compliance rather than governance value. Option C incorrectly gives the custodian access authority.',
  'Think Like a Manager: The owner DECIDES, the custodian DOES. Separation = right decisions + right implementation.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- -------------------------------------------------------
-- Q41-Q55: medium continued
-- -------------------------------------------------------

-- Q41: medium / remember / scenario — correct at 0
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'An e-commerce company processes credit card transactions through a payment gateway. When a customer enters their card number, the payment gateway replaces the real card number with a randomly generated substitute value and stores the original in a secure vault. The merchant''s systems only ever see the substitute value. Future charges reference the substitute rather than the real card number. Which data protection technique is this?',
  '["Tokenization, where sensitive data is replaced with random tokens and the mapping is stored in a secure vault", "Pseudonymization, where identifying data is replaced with aliases and a lookup table is maintained", "Anonymization, where all identifying data is permanently and irreversibly removed", "Data masking, where production data is permanently altered for non-production environments"]'::jsonb,
  0,
  'This describes tokenization: the real credit card number is replaced with a random token that has no mathematical relationship to the original. The mapping between token and real number is stored in a secure vault managed by the payment gateway. If the merchant is breached, only useless tokens are exposed. Option B uses aliases with a lookup table, not a third-party vault system. Option C is irreversible, but tokenization is reversible via the vault. Option D permanently alters data, while tokenization preserves the original securely.',
  'TOKEN = random TICKET with no value outside the vault. The merchant never touches the real card number.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q42: medium / understand / first_action — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.3 = 0.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  2,
  'e_discovery',
  'A company receives notification that it is the subject of a federal investigation. The legal team determines that electronically stored information across multiple departments may be relevant. What should be done FIRST?',
  '["Hire an external forensics firm to begin collecting all electronic evidence", "Issue a litigation hold notice to preserve all potentially relevant electronically stored information", "Begin reviewing all employee emails for evidence of wrongdoing", "Encrypt all potentially relevant data to prevent unauthorized access during the investigation"]'::jsonb,
  1,
  'When litigation or investigation is anticipated, the first obligation is to preserve potentially relevant data by issuing a litigation hold. This suspends all routine data deletion, archiving, and modification of potentially relevant information. Option A may be needed but comes after preservation. Option C begins review before ensuring preservation. Option D protects confidentiality but does not address the primary obligation of preservation.',
  'Investigation? HOLD first, investigate second. Preservation always precedes collection.',
  'understand',
  'first_action',
  'medium',
  1.20, 0.30, 0.20,
  'ai_generated', true
),

-- Q43: medium / apply / best_answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'security_baselines',
  'An organization categorizes its new customer relationship management system as a moderate-impact system under FIPS 199. Which security baseline from NIST SP 800-53B should be applied as the starting point?',
  '["The low-impact baseline, supplemented with additional controls selected by the system owner", "The high-impact baseline, reduced through scoping to remove excessive controls", "The moderate-impact baseline, which includes all low-impact controls plus additional controls appropriate for moderate risk", "The privacy control baseline, since the system processes customer personal information"]'::jsonb,
  2,
  'NIST SP 800-53B organizes baselines by impact level. The moderate-impact baseline includes all controls from the low-impact baseline plus additional controls to address moderate-level risks. The appropriate baseline matches the impact categorization. Option A starts too low and relies on ad hoc additions. Option B starts too high and relies on reductions, which is not the intended approach. Option D applies only to privacy-specific controls and does not replace the impact-based baseline.',
  'Match the BASELINE to the IMPACT level: Low system = Low baseline, Moderate = Moderate, High = High. Each level STACKS on the one below.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q44: medium / analyze / first_action — correct at 3
-- IRT: b = 0.0 + 0.6 + 0.3 = 0.90, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'data_lifecycle',
  'During a quarterly data governance review, the data steward discovers that several customer email addresses in the CRM system are outdated, phone numbers have invalid formats, and mailing addresses contain inconsistencies that cause delivery failures. The steward reports this to the data owner. What should the data owner authorize FIRST?',
  '["Immediately delete all records with invalid data to cleanse the database", "Implement additional encryption on the CRM database to protect the invalid records", "Outsource the database to a third-party provider with better data validation capabilities", "Initiate a data quality improvement program to validate, correct, and update the inaccurate records"]'::jsonb,
  3,
  'The data steward identified data quality issues, which is their primary responsibility. The data owner should authorize a systematic program to correct these issues rather than taking extreme action. Option A deletes potentially valuable records that simply need updating. Option B addresses security, not quality. Option C transfers the problem without solving it. A structured data quality program validates existing data, corrects errors, and establishes ongoing quality controls.',
  'Data Steward finds quality problems, Data Owner authorizes the fix. Quality issues need REPAIR, not DELETION.',
  'analyze',
  'first_action',
  'medium',
  1.70, 0.90, 0.20,
  'ai_generated', true
),

-- Q45: medium / remember / scenario — correct at 0
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'data_classification',
  'A defense contractor''s system administrator is setting up a workstation that will process both Confidential and Secret documents. The administrator also connects a printer to this workstation. The security officer asks what classification label should be applied to the printer. According to classification policy, what is the correct classification for the printer?',
  '["Secret, because the printer inherits the classification of the highest level of data it processes", "Confidential, because printers should be classified at the lowest level of data they process", "Unclassified, because printers are output devices and do not store classified data", "Both Confidential and Secret, using a dual-classification label"]'::jsonb,
  0,
  'Assets inherit the classification of the highest level of data they contain, process, or output. Since the printer will output Secret documents, it must be classified as Secret. This ensures the printer receives the appropriate physical security, access controls, and handling procedures. Option B uses the wrong level. Option C ignores that printers process and may retain classified data in memory or internal storage. Option D is not a recognized classification approach.',
  'The printer touches Secret data, so it becomes a Secret printer. HIGHEST data level wins for ALL connected assets.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q46: medium / understand / most_likely — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'data_ownership_roles',
  'A data analytics firm receives customer purchase data from a retail chain and processes it to generate market trend reports as instructed by the retailer. The analytics firm does not decide what data to collect or how it will ultimately be used. The retail chain makes all decisions about data collection scope, retention periods, and who receives the final reports. Under GDPR, which role does the analytics firm occupy?',
  '["Data owner, because they physically store the data during processing", "Data processor, because they process personal data under the direction and on behalf of the controller", "Data controller, because they transform the data into new analytical products", "Data steward, because they ensure the quality and accuracy of the processed data"]'::jsonb,
  1,
  'The analytics firm is a data processor because it processes personal data solely under the direction of and on behalf of the retail chain (the controller). The retailer determines the purposes (market analysis) and means (data collection scope, retention, distribution) of processing. The analytics firm has no independent authority over these decisions. Option A confuses physical possession with the GDPR ownership concept. Option C confuses data transformation with controlling purpose and means. Option D describes a quality-focused role.',
  'Processor = follows ORDERS. Controller = gives ORDERS. The retailer decides what/why; the analytics firm does what it is told.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q47: medium / apply / best_answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'data_states',
  'A financial institution needs to protect customer account data stored in its database servers, transmitted between branch offices, and displayed on teller workstations during transactions. Which combination of controls BEST addresses all three data states?',
  '["Full-disk encryption for servers, firewall rules between offices, and antivirus on workstations", "Database access logging, intrusion detection between offices, and physical locks on workstations", "AES-256 column-level encryption at rest, TLS for data in transit, and RBAC with clean-desk policies for data in use", "Network segmentation for servers, VPN between offices, and strong passwords on workstations"]'::jsonb,
  2,
  'This option addresses all three data states appropriately: AES-256 column-level encryption protects data at rest in the database, TLS protects data in transit between offices, and RBAC with clean-desk policies protect data in use on teller workstations. Option A partially addresses at rest but misses encryption in transit and data in use. Option B focuses on monitoring rather than protection. Option D provides some protection but misses data at rest encryption and data in use protections.',
  'RUT = Rest (encrypt storage), Use (RBAC + clean desk), Transit (TLS/VPN). Match the CONTROL to the STATE.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q48: medium / remember / scenario — correct at 3
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'information_obfuscation',
  'A bank''s online portal displays customer account numbers. For security, the portal shows only the last four digits of each account number to customer service representatives, with the remaining digits replaced by asterisks. The representatives can still identify the account by the last four digits to assist customers. Which information obfuscation technique is being applied?',
  '["Data concealing, which completely hides all data from view", "Data pruning, which removes entire data fields from the display", "Pseudonymization, which replaces the account number with an artificial identifier", "Data trimming, which shows only a partial attribute value to reduce exposure while maintaining usability"]'::jsonb,
  3,
  'Data trimming shows partial attribute values -- in this case, only the last four digits of the account number. This reduces exposure while maintaining enough information for the representative to identify the account and assist the customer. Option A would hide all data, making the representative unable to assist. Option B would remove the entire field. Option C would replace the number with a different identifier entirely, not show a partial value.',
  'TRIMMING = trim away most of the data, show just enough. Like showing only the last 4 digits of your credit card.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q49: medium / analyze / comparison — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.1 = 0.70, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'drm_irm',
  'How does Information Rights Management (IRM) differ from Data Loss Prevention (DLP) in protecting organizational documents?',
  '["IRM embeds access restrictions directly into documents that persist regardless of location, while DLP monitors data movement at network boundaries and endpoints", "IRM scans document content for sensitive patterns, while DLP encrypts documents and restricts usage rights", "IRM only protects documents stored on company servers, while DLP protects documents everywhere including personal devices", "IRM requires persistent internet connectivity for all document access, while DLP operates entirely offline"]'::jsonb,
  0,
  'IRM embeds access controls (view, edit, copy, print, forward restrictions) directly into documents, so protections travel with the document regardless of where it goes. DLP monitors data at network boundaries and endpoints, detecting and blocking sensitive data in motion. Option B reverses the technologies. Option C is incorrect because IRM protections follow documents everywhere. Option D is not a defining characteristic of either technology.',
  'IRM = the lock travels WITH the document. DLP = the guard watches the EXIT doors. Different approaches, both protect data.',
  'analyze',
  'comparison',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),

-- Q50: medium / apply / first_action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A pharmaceutical company completes a clinical trial and no longer needs the participant health data for research purposes. The data retention policy specifies a ten-year retention period for clinical trial data to meet FDA requirements. Five years have passed since the trial ended. What should the data owner do FIRST?',
  '["Destroy the data immediately since the research purpose has been fulfilled", "Verify that the data is properly archived with appropriate access controls for the remaining five years of the retention period", "Transfer the data to the research participants since it is their personal health information", "Move the data to the cheapest available storage to minimize retention costs"]'::jsonb,
  1,
  'Even though the research purpose is fulfilled, regulatory requirements mandate a ten-year retention period. With five years remaining, the data must be properly archived with controls matching its sensitivity classification. Option A violates the retention requirement. Option C misunderstands data subject rights in the context of regulatory retention. Option D prioritizes cost over security, which could compromise sensitive health data.',
  'Retention trumps purpose completion. Even when you are DONE with data, the law may say KEEP IT. Archive properly until the clock runs out.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q51: medium / understand / except_not — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.2 = 0.20, a = 1.0 + (-0.1) = 0.90, c = 0.25
(
  2,
  'data_destruction',
  'All of the following are valid data sanitization methods defined in NIST SP 800-88 EXCEPT:',
  '["Clearing by overwriting media with predefined patterns", "Purging through advanced methods rendering data unrecoverable by known techniques", "Reformatting the drive using the operating system''s quick format utility", "Physical destruction through incineration, shredding, or disintegration"]'::jsonb,
  2,
  'NIST SP 800-88 defines three categories of sanitization: Clear, Purge, and Destroy. Quick formatting is not considered a valid sanitization method because it only removes directory structures and file pointers without actually removing the data. Data remains easily recoverable after formatting. Options A (clearing), B (purging), and D (destroying) are the three recognized NIST SP 800-88 sanitization categories.',
  'NIST 800-88 has THREE methods: Clear, Purge, Destroy. Formatting is NOT on the list.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
),

-- Q52: medium / apply / scenario — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.2 = 0.50, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_sovereignty',
  'A US-based technology company stores its European customer data in a cloud provider''s data center located in Germany. The company''s disaster recovery plan replicates this data to a backup facility in Brazil. During a compliance review, the Data Protection Officer flags a concern about the Brazil replication. The CTO argues that encryption makes the data location irrelevant. Why is the DPO''s concern valid despite the encryption?',
  '["Encryption algorithms approved in the EU are not recognized as valid in Brazil", "The Brazilian data center may experience more frequent natural disasters than the German facility", "Brazilian internet infrastructure may not support the same encryption protocols used in Germany", "Data sovereignty laws subject data to the jurisdiction where it is stored, regardless of encryption status, and Brazil may not meet GDPR adequacy requirements"]'::jsonb,
  3,
  'Data sovereignty means that data is subject to the laws of the country where it is physically located. Encryption does not change jurisdictional applicability. GDPR restricts transfers to countries without adequate data protection levels unless additional safeguards are in place. The DPO is correct that encryption alone does not resolve the sovereignty concern. Option A is incorrect as encryption standards are generally universal. Options B and C are operational issues, not data sovereignty concerns.',
  'Encryption protects CONFIDENTIALITY, not JURISDICTION. Data sovereignty = the LAW of the LAND where data LANDS.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),

-- Q53: medium / analyze / tlatm — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.10, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'data_classification',
  'As the CISO, you discover that multiple departments classify the same type of customer financial data at different levels -- the marketing team labels it as Internal, while the finance team classifies it as Confidential. This inconsistency has led to marketing staff handling financial data with fewer protections than the finance team requires. What is the BEST management approach to resolve this?',
  '["Establish a cross-departmental classification board with representatives from each business unit to create and enforce a unified classification standard", "Accept the marketing team''s lower classification since they have fewer compliance requirements", "Require all departments to immediately classify everything at the highest available level", "Delegate classification decisions entirely to the IT department since they manage the systems"]'::jsonb,
  0,
  'A manager builds governance structures rather than imposing unilateral decisions. A classification board with cross-departmental representation ensures that all stakeholders'' perspectives are considered, classifications are consistent, and enforcement is organizationally supported. Option B reduces protections based on departmental preference. Option C wastes resources through over-classification. Option D places a business decision in the wrong hands -- IT manages systems, not data value.',
  'Think Like a Manager: Classification is a BUSINESS decision. Build a BOARD with stakeholders. Consistency across the enterprise is non-negotiable.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q54: medium / remember / most_likely — correct at 1
-- IRT: b = 0.0 + (-0.5) + 0.1 = -0.40, a = 0.8 + 0.1 = 0.90, c = 0.22
(
  2,
  'data_remanence',
  'A forensic investigator examines a hard drive that was formatted and had a new operating system installed. The investigator successfully recovers deleted files that existed before the format. Which concept explains why data was still present despite the formatting?',
  '["The operating system created automatic backups before formatting", "Data remanence, because formatting only removes file system pointers while the actual data remains in unallocated disk sectors until overwritten", "The hard drive manufacturer embeds a hidden recovery partition that preserves all data", "File system journaling automatically created copies of all files in a protected log area"]'::jsonb,
  1,
  'Data remanence is the persistence of data on storage media after deletion or formatting. Formatting removes the file system structure (directory pointers) but does not overwrite the actual data sectors. The data persists in unallocated space until those specific sectors are overwritten by new data. This is why sanitization methods like clearing (overwriting) or destruction are needed. Option A is not how formatting works. Option C is incorrect about manufacturer partitions. Option D overstates journaling capabilities.',
  'FORMAT removes the TABLE OF CONTENTS, not the PAGES. The data remains until new data writes over those exact sectors.',
  'remember',
  'most_likely',
  'medium',
  0.90, -0.40, 0.22,
  'ai_generated', true
),

-- Q55: medium / understand / first_action — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.3 = 0.30, a = 1.0 + 0.2 = 1.20, c = 0.20
(
  2,
  'privacy_principles',
  'A social media company collects user location data for its mapping feature. The company later decides to sell this location data to advertising partners without notifying or obtaining consent from its users. The company argues that users already agreed to share location data when they enabled the mapping feature. Under the OECD Use Limitation Principle, why is this practice problematic?',
  '["Location data is not considered personal data under most privacy regulations", "The company has not encrypted the location data before sharing it with partners", "Data collected for one specified purpose should not be used for a different purpose without additional consent from the data subject", "The advertising partners may store the data in a country with inadequate privacy protections"]'::jsonb,
  2,
  'The OECD Use Limitation Principle states that personal data should not be used for purposes other than those specified at the time of collection, except with the consent of the data subject or by authority of law. Users consented to location sharing for mapping, not for advertising sales. Option A is incorrect as location data is widely recognized as personal data. Option B addresses security, not purpose limitation. Option D raises a sovereignty issue but not the core use limitation violation.',
  'Use Limitation: Data collected for purpose A cannot be used for purpose B without new consent. PURPOSE SPECIFIC, not purpose flexible.',
  'understand',
  'first_action',
  'medium',
  1.20, 0.30, 0.20,
  'ai_generated', true
),

-- -------------------------------------------------------
-- Q56-Q70: medium continued (final batch)
-- -------------------------------------------------------

-- Q56: medium / apply / first_action — correct at 3
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_classification',
  'A newly hired CISO at a technology startup discovers that the company has never implemented a formal data classification program. Engineers freely share source code, customer data, and financial projections through the same communication channels. What should the CISO recommend as the FIRST step?',
  '["Deploy a DLP solution to automatically classify and protect all corporate data", "Require all employees to encrypt every file before sharing it with colleagues", "Hire an external consultant to conduct a full data inventory before any decisions are made", "Identify and categorize all types of data the organization creates, processes, and stores, then assign ownership"]'::jsonb,
  3,
  'Before any classification program can function, the organization must identify what data exists, categorize it by type, and assign ownership. Only after this inventory can appropriate classification levels and controls be applied. Option A deploys technology before understanding the data landscape. Option B applies blanket encryption without context. Option C delays action unnecessarily when the CISO can initiate the inventory internally.',
  'You cannot classify what you have not identified. INVENTORY and OWNERSHIP come first in every data governance program.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q57: medium / analyze / scenario — correct at 0
-- IRT: b = 0.0 + 0.6 + 0.2 = 0.80, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'data_destruction',
  'A government agency needs to dispose of hard drives that contained Secret-level classified data. The security officer proposes degaussing the drives and then verifying the sanitization with spot-check testing before releasing the drives for surplus sale. The agency''s information assurance team objects to this plan. The agency operates under guidelines where purging is not trusted for data classified above Confidential. What is the MOST significant flaw in the security officer''s proposal?',
  '["For Secret-level data, physical destruction is required because purging methods including degaussing are not trusted above Confidential classification", "Degaussing should be followed by overwriting rather than spot-check testing", "The drives should be donated to another government agency rather than sold as surplus", "Spot-check testing is insufficient and every drive must be individually verified"]'::jsonb,
  0,
  'Government guidelines do not trust purging methods (including degaussing) for data classified above Confidential. Secret-level data requires physical destruction -- incineration, shredding, disintegration, or similar methods that render the media completely unrecoverable. Option B suggests additional software methods that are also insufficient. Option C changes the recipient but does not address the sanitization inadequacy. Option D improves verification but does not fix the fundamental method deficiency.',
  'Secret and Top Secret = physical DESTRUCTION only. Degaussing and purging are not trusted above Confidential for government data.',
  'analyze',
  'scenario',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q58: medium / apply / calculation — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.4 = 0.70, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  2,
  'retention_policies',
  'A company stores 50 terabytes of archived data at a cost of $0.02 per gigabyte per month. The data has a mandatory retention period of 7 years. What is the approximate total storage cost for retaining this data through the full retention period?',
  '["$8,400", "$84,000", "$840,000", "$8,400,000"]'::jsonb,
  1,
  'The calculation: 50 TB = 50,000 GB. Monthly cost = 50,000 GB x $0.02 = $1,000/month. Annual cost = $1,000 x 12 = $12,000/year. Seven-year cost = $12,000 x 7 = $84,000. This does not include additional costs such as media replacement, environmental controls, or personnel. Option A calculates for only 7 months. Option C multiplies by an extra factor of 10. Option D is off by two orders of magnitude.',
  'Storage cost = Volume x Rate x Time. 50,000 GB x $0.02 x 84 months = $84,000.',
  'apply',
  'calculation',
  'medium',
  1.60, 0.70, 0.20,
  'ai_generated', true
),

-- Q59: medium / understand / best_answer — correct at 2
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  2,
  'data_lifecycle',
  'Which of the following BEST describes the relationship between data classification and the data lifecycle?',
  '["Classification is assigned only when data is created and remains unchanged until destruction", "Classification applies only during the storage and archival phases of the lifecycle", "Classification should be assigned when data is created and can change at any point during the lifecycle based on changing value or sensitivity", "Classification is determined automatically by the storage system based on access frequency"]'::jsonb,
  2,
  'Data classification should be applied at creation and reviewed throughout the lifecycle. Classification can change at any phase as the data''s value, sensitivity, or regulatory requirements evolve. A document might be classified as Confidential during creation but downgraded to Internal after public release. Option A incorrectly makes classification permanent. Option B limits classification to certain phases. Option D describes automated tiering, not classification.',
  'Classification is a LIVING label. It is born with the data but can CHANGE at any lifecycle phase as circumstances evolve.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q60: medium / remember / scenario — correct at 3
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'dlp',
  'A financial services firm deploys endpoint DLP agents on all employee laptops. An employee attempts to copy a spreadsheet containing 10,000 customer Social Security numbers to a personal USB drive. The endpoint DLP blocks the copy operation and generates an alert. Which DLP capability prevented this data exfiltration?',
  '["Network content filtering that scans traffic at the firewall perimeter", "Cloud-based behavioral analytics that monitors user activity patterns", "Email gateway scanning that inspects outbound message attachments", "Endpoint DLP content inspection that detected sensitive data patterns in a file being copied to removable media"]'::jsonb,
  3,
  'Endpoint DLP operates directly on the device, monitoring file operations including copying to removable media, printing, and screen capture. It detected the SSN pattern in the spreadsheet and blocked the USB copy operation. Option A describes network DLP at the perimeter, not endpoint. Option B describes behavioral analytics, which may detect anomalies but does not perform content inspection. Option C describes email DLP, not removable media monitoring.',
  'Endpoint DLP = the BODYGUARD on the device. It watches USB ports, printers, and screen. Network DLP watches the NETWORK EXIT.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q61: medium / understand / most_likely — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'data_ownership_roles',
  'In NIST SP 800-18, the information owner is responsible for establishing rules of behavior for systems under their authority. Which of the following is this concept MOST LIKELY equivalent to in corporate terminology?',
  '["An acceptable use policy that defines how users may interact with organizational data and systems", "A disaster recovery plan that outlines data restoration procedures", "A change management policy governing system modifications", "A penetration testing policy defining authorized testing activities"]'::jsonb,
  0,
  'NIST SP 800-18 defines rules of behavior as the rules established by the information owner regarding appropriate use and protection of data and systems. This is equivalent to an acceptable use policy (AUP) in corporate terminology. Option B addresses recovery, not usage rules. Option C addresses change processes. Option D addresses security testing. The rules of behavior concept focuses on defining expected user conduct.',
  'NIST rules of behavior = corporate Acceptable Use Policy. Both define: here is what you CAN and CANNOT do with our data.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q62: medium / remember / scenario — correct at 1
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'security_baselines',
  'A federal agency is deploying a new system that processes citizen tax return data. The agency performs a FIPS 199 categorization and determines that unauthorized disclosure of this data would cause serious adverse effects on individuals and the agency''s operations. Under NIST guidelines, which impact level should be assigned and which SP 800-53B baseline should be applied?',
  '["Low impact with the low-impact baseline, since tax data is routinely processed", "Moderate impact with the moderate-impact baseline, since serious adverse effects indicate moderate impact", "High impact with the high-impact baseline, because any financial data requires maximum protection", "Privacy baseline only, since tax returns contain personally identifiable information"]'::jsonb,
  1,
  'Under FIPS 199, serious adverse effects correspond to moderate impact. Moderate impact means loss of confidentiality, integrity, or availability could be expected to have a serious adverse effect on organizational operations, assets, or individuals. The corresponding NIST SP 800-53B moderate-impact baseline should be applied. Option A underestimates the impact. Option C overstates it -- severe or catastrophic effects would indicate high impact. Option D is supplementary, not a replacement for impact-based baselines.',
  'FIPS 199 impact levels: Limited = Low, Serious = Moderate, Severe/Catastrophic = High. Match the ADJECTIVE to the LEVEL.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q63: medium / apply / best_answer — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.0 = 0.30, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'data_destruction',
  'An organization is decommissioning laptops that contained proprietary business data classified as Confidential. The laptops will be donated to a charity. Which sanitization approach BEST balances security requirements with the goal of reuse?',
  '["Physical destruction of the hard drives and replacement with new drives before donation", "Simple deletion of all user files and factory reset of the operating system", "Clearing the drives by overwriting all sectors with a verified pattern, then documenting the sanitization process", "Removing the hard drives entirely and donating the laptops without any storage media"]'::jsonb,
  2,
  'For Confidential-level data on reusable media, clearing through verified overwriting is the appropriate NIST SP 800-88 method. It renders data unrecoverable by standard tools, allows the media to be reused, and when documented provides defensible sanitization. Option A is excessive for Confidential data and defeats the reuse goal. Option B is insufficient as it does not actually remove data. Option D is functional but unnecessarily wasteful when clearing is adequate for this classification level.',
  'Match the SANITIZATION METHOD to the CLASSIFICATION LEVEL. Confidential = clearing is sufficient. Top Secret = destroy. Do not over-destroy or under-protect.',
  'apply',
  'best_answer',
  'medium',
  1.30, 0.30, 0.20,
  'ai_generated', true
),

-- Q64: medium / analyze / tlatm — correct at 3
-- IRT: b = 0.0 + 0.6 + 0.5 = 1.10, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'A healthcare researcher publishes a study using patient data that has been anonymized. A data scientist later cross-references the published study data with publicly available voter registration records and census data, successfully identifying several individual patients. This demonstrates a failure of which privacy concept?',
  '["Data encryption, because the research data should have been encrypted before publication", "Data classification, because the data was not properly classified before release", "Tokenization, because the researcher should have used tokens instead of anonymization", "Anonymization, because the process did not adequately prevent reidentification through inference attacks using external datasets"]'::jsonb,
  3,
  'This scenario illustrates the reidentification risk inherent in anonymization. Even when all direct identifiers are removed, combining the anonymized dataset with external data sources can allow inference attacks that reveal individual identities. True anonymization must resist these correlation attacks. Option A addresses confidentiality, not the anonymization failure. Option B is tangential. Option C would not solve the inference problem since tokens are also vulnerable if the dataset structure enables correlation.',
  'Anonymization risk: remove the NAME but keep enough attributes, and outsiders can still CONNECT THE DOTS. Inference attacks defeat weak anonymization.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),

-- Q65: medium / apply / first_action — correct at 0
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A company''s marketing department requests access to archived customer purchase data from five years ago for a new analytics initiative. The data is currently stored in offline backup tapes with access restricted to the data custodian. What should happen FIRST before the marketing team receives access?',
  '["The data owner must review and approve the access request based on the current classification and purpose justification", "The data custodian should immediately restore the data and provide access to the marketing team", "The IT department should create a copy of the archived data in the marketing team''s shared drive", "The legal department should review the archived data for any litigation hold restrictions"]'::jsonb,
  0,
  'The data owner has authority over access decisions. Before any access is granted, the owner must verify that the requesting party has a legitimate business need, the current classification permits this use, and the access aligns with the data''s approved purposes. Option B bypasses the owner''s authority. Option C also bypasses authorization. Option D may be needed but is not the first step -- the owner''s approval is the gateway.',
  'Access requests go through the OWNER, not the CUSTODIAN. The custodian IMPLEMENTS what the owner APPROVES.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- Q66: medium / understand / comparison — correct at 1
-- IRT: b = 0.0 + 0.0 + 0.1 = 0.10, a = 1.0 + 0.1 = 1.10, c = 0.22
(
  2,
  'classification_categorization',
  'How does data classification differ from data categorization?',
  '["Classification groups data by file type, while categorization groups data by department", "Classification assigns hierarchical sensitivity levels that determine protection requirements, while categorization sorts data into non-hierarchical groups based on type or function", "Classification is performed by IT staff, while categorization is performed by data owners", "Classification applies only to government data, while categorization applies only to commercial data"]'::jsonb,
  1,
  'Classification assigns hierarchical sensitivity levels (e.g., Top Secret > Secret > Confidential > Unclassified) that drive protection decisions. Categorization sorts data into non-hierarchical classes based on characteristics such as type, department, or function (e.g., financial data, HR data, customer data). Option A confuses both concepts with file management. Option C incorrectly assigns roles. Option D incorrectly limits applicability.',
  'CLASSification = levels in a HIERARCHY (top to bottom). CATEGORization = groups in CATEGORIES (side by side, no ranking).',
  'understand',
  'comparison',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),

-- Q67: medium / apply / tlatm — correct at 2
-- IRT: b = 0.0 + 0.3 + 0.5 = 0.80, a = 1.3 + 0.4 = 1.70, c = 0.20
(
  2,
  'data_destruction',
  'The board of directors asks you, the CISO, to recommend a data destruction strategy for the organization''s cloud-hosted data warehouse when the cloud contract ends. The data includes customer PII, financial records, and trade secrets. Physical destruction of the cloud provider''s hardware is not possible. From a management perspective, which strategy is MOST appropriate?',
  '["Request that the cloud provider certify that all data has been deleted from their systems", "Negotiate contract terms requiring the cloud provider to physically destroy the relevant storage media", "Implement crypto shredding by ensuring all data was encrypted with organization-controlled keys, then securely destroying all copies of the encryption keys upon contract termination", "Simply terminate the contract and rely on the cloud provider''s standard data deletion procedures"]'::jsonb,
  2,
  'Crypto shredding is the primary data destruction method for cloud environments because the organization typically cannot access or destroy the physical media. By encrypting data with keys the organization controls and then destroying all key copies, the data becomes permanently unreadable even if it persists on the provider''s storage. Option A provides no guarantee of actual destruction. Option B is often impractical in shared infrastructure. Option D provides no assurance whatsoever.',
  'Think Like a Manager: In the cloud, you control the KEYS, not the DRIVES. Crypto shredding = destroy the keys = destroy the data.',
  'apply',
  'tlatm',
  'medium',
  1.70, 0.80, 0.20,
  'ai_generated', true
),

-- Q68: medium / remember / scenario — correct at 3
-- IRT: b = 0.0 + (-0.5) + 0.2 = -0.30, a = 0.8 + 0.2 = 1.00, c = 0.20
(
  2,
  'data_states',
  'A company ships backup tapes containing encrypted customer financial data to an offsite storage facility via an armored courier service. During shipment, one of the tapes falls from the transport vehicle and is found by a passerby. The security team must assess the data state of the lost tape to determine the appropriate incident response. In what state was the data on the tape?',
  '["Data in transit, because the tape was physically moving between locations", "Data in use, because the courier was actively transporting and handling the tape", "Data in motion, because the tape was in a state of physical movement", "Data at rest, because backup tape data is stored on media regardless of whether the media is being physically transported"]'::jsonb,
  3,
  'This is a classic CISSP exam trap. Data in transit (or in motion) refers specifically to data traversing a NETWORK, not physical transportation of media. A backup tape being shipped is data at rest because the data is stored on physical media and is not being transmitted electronically. The physical movement of the media does not change the data''s state. Options A, B, and C all incorrectly characterize the data state based on the tape''s physical movement rather than the data''s electronic state.',
  'EXAM TRAP: Physical transport of media = data at REST. Data in transit = data on a NETWORK. The tape is resting ON the tape, even when the truck is moving.',
  'remember',
  'scenario',
  'medium',
  1.00, -0.30, 0.20,
  'ai_generated', true
),

-- Q69: medium / understand / best_answer — correct at 0
-- IRT: b = 0.0 + 0.0 + 0.0 = 0.00, a = 1.0 + 0.0 = 1.00, c = 0.20
(
  2,
  'data_ownership_roles',
  'Which of the following BEST describes the primary responsibility of a data steward?',
  '["Ensuring data accuracy, reliability, and quality through ongoing business-level oversight", "Implementing technical security controls such as encryption and access management", "Determining the classification level and approved access for organizational data", "Processing personal data on behalf of and as directed by the data controller"]'::jsonb,
  0,
  'The data steward is responsible for data quality at the business level. They ensure that data is accurate, reliable, consistent, and fit for its intended purpose. This is distinct from the custodian (technical implementation), the owner (classification and access decisions), and the processor (processing on behalf of the controller). Option B describes the custodian. Option C describes the owner. Option D describes the processor.',
  'Steward = STEWARDSHIP of quality. They are the quality inspector, ensuring data is ACCURATE and RELIABLE at the business level.',
  'understand',
  'best_answer',
  'medium',
  1.00, 0.00, 0.20,
  'ai_generated', true
),

-- Q70: medium / apply / first_action — correct at 1
-- IRT: b = 0.0 + 0.3 + 0.3 = 0.60, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'scoping_tailoring',
  'A healthcare organization has adopted the NIST SP 800-53 moderate-impact baseline for its electronic health records system. During implementation, the security team adjusts the minimum password length from the baseline''s recommended 12 characters to 14 characters to align with the organization''s stricter internal policy. They also add a requirement for biometric authentication that was not in the original baseline. Which process describes these modifications?',
  '["Scoping, because the team is selecting which controls apply to their environment", "Tailoring, because the team is modifying and supplementing baseline controls to align with organizational requirements", "Standards selection, because the team is choosing specific control parameters", "Risk assessment, because the team is evaluating the adequacy of baseline controls"]'::jsonb,
  1,
  'Tailoring involves modifying baseline controls to align with organizational mission, goals, and risk tolerance. This includes adjusting control parameters (changing password length) and supplementing baselines with additional controls (adding biometrics). Scoping would involve removing controls, not modifying or adding them. Option A describes removal of inapplicable controls. Option C describes framework adoption. Option D describes risk evaluation, not control modification.',
  'TAILORING = TWEAK controls to fit YOUR organization. Changing parameters + adding controls = tailoring.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- HARD QUESTIONS (Q71-Q90) — IRT b base = 1.5
-- ═══════════════════════════════════════════════════════════

-- Q71: hard / apply / scenario — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_destruction',
  'A defense contractor is decommissioning a storage area network that processed Top Secret data across 200 enterprise SSDs. The contractor''s security team proposes using the manufacturer''s built-in secure erase command (ATA Secure Erase) on all drives, followed by verification sampling of 10% of the drives. The information assurance officer reviews the proposal. Which assessment is MOST accurate?',
  '["The proposal is adequate because ATA Secure Erase meets NIST SP 800-88 purging requirements for all media types", "The proposal is acceptable if the sampling rate is increased to 100% verification of all drives", "The proposal is inadequate because Top Secret data on SSDs requires physical destruction, as software-based methods are not trusted for the highest classification levels", "The proposal is acceptable because SSD secure erase commands bypass wear-leveling concerns"]'::jsonb,
  2,
  'For Top Secret classified data, government guidelines mandate physical destruction regardless of media type. Software-based sanitization methods, including manufacturer secure erase commands, are not trusted for the highest classification levels because of residual data risks from wear-leveling, over-provisioned cells, and potential firmware limitations. Option A overstates the capability of ATA Secure Erase. Option B improves verification but does not fix the fundamental method inadequacy. Option D is incorrect about wear-leveling bypass.',
  'Top Secret = PHYSICAL DESTRUCTION. Period. No software method is trusted. Shred, disintegrate, or incinerate.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q72: hard / analyze / tlatm — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.60, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'data_sovereignty',
  'Your multinational corporation operates in 30 countries and is evaluating a cloud-first strategy. The general counsel identifies conflicting data sovereignty requirements: the EU requires certain data to remain within EU borders, China mandates data localization for critical information infrastructure, and the US CLOUD Act potentially compels disclosure of data stored abroad. As the CISO advising the board, which approach demonstrates the BEST management judgment?',
  '["Select a single cloud provider headquartered in a neutral country to avoid all jurisdictional conflicts", "Store all data on-premises in each country to completely eliminate cross-border data flow concerns", "Encrypt all data with the strongest available algorithms, making jurisdictional location irrelevant", "Implement a multi-region cloud architecture with data residency controls per jurisdiction, supported by legal analysis of each country''s requirements and appropriate contractual safeguards"]'::jsonb,
  3,
  'A manager recognizes that conflicting sovereignty requirements demand a nuanced, jurisdiction-by-jurisdiction approach rather than a one-size-fits-all solution. Multi-region architecture with data residency controls ensures compliance per jurisdiction, while legal analysis and contractual safeguards address specific requirements. Option A ignores that neutrality does not exempt an organization from specific national laws. Option B is prohibitively expensive and may not be feasible. Option C incorrectly assumes encryption resolves jurisdictional concerns.',
  'Think Like a Manager: Global operations need LOCAL compliance. One cloud does not fit all. Map JURISDICTIONS to ARCHITECTURES.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- Q73: hard / apply / first_action — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.10, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'e_discovery',
  'During a merger negotiation, the acquiring company''s legal team issues a broad preservation notice covering all electronic communications for the past three years. The target company''s IT department discovers that their automated retention policy already deleted emails older than 18 months, and the backup rotation cycle overwrote tapes from that period. The CISO must advise the CEO. What should be recommended FIRST?',
  '["Immediately preserve all remaining data and notify legal counsel of the gap between the preservation notice scope and available data, as this could constitute spoliation", "Begin recreating the deleted emails from employee personal accounts and local PST files", "Engage a forensic recovery firm to attempt data recovery from the overwritten backup tapes", "Continue the merger negotiations without disclosing the data gap to avoid complicating the deal"]'::jsonb,
  0,
  'The immediate priority is preserving what remains and notifying legal counsel about the gap. The deletion occurred before the preservation notice, which may provide a defense against spoliation, but only if properly documented. Legal counsel must assess the implications before any other action. Option B may recover some data but is not the first priority. Option C may be attempted later but recovery from overwritten tapes is unlikely. Option D constitutes concealment and creates enormous legal liability.',
  'Preservation gaps must be DISCLOSED to legal immediately. Hiding a gap is worse than having one. Preserve what you have, then assess.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q74: hard / analyze / scenario — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'information_obfuscation',
  'A health insurance company releases a dataset of 50,000 anonymized claim records for academic research. The dataset includes diagnosis codes, treatment dates, zip codes, dates of birth, and gender -- but no names, Social Security numbers, or policy numbers. A research team cross-references this data with public voter registration records and hospital discharge summaries, successfully reidentifying 87% of individuals. The company claims the data was properly anonymized. Which analysis MOST accurately identifies the root cause of this failure?',
  '["The company should have used encryption instead of anonymization to protect the data", "The combination of quasi-identifiers (zip code, date of birth, gender) created a unique fingerprint for most individuals, enabling reidentification through linkage attacks despite removing direct identifiers", "The research team used illegal data mining techniques that violate privacy regulations", "The dataset was too large, and a smaller sample would have prevented reidentification"]'::jsonb,
  1,
  'Quasi-identifiers are attributes that individually do not identify a person but in combination can create a unique profile that enables reidentification. Research has shown that 87% of the US population can be uniquely identified by zip code, date of birth, and gender alone. Proper anonymization must address quasi-identifiers through techniques like k-anonymity, l-diversity, or data generalization. Option A does not address the fundamental issue. Option C blames the researchers rather than the inadequate anonymization. Option D does not solve the quasi-identifier problem.',
  'Quasi-identifiers are the silent threat to anonymization. ZIP + DOB + gender = 87% unique in the US. Remove direct IDs but forget quasi-IDs and anonymization fails.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q75: hard / apply / best_answer — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.0 = 1.80, a = 1.3 + 0.0 = 1.30, c = 0.20
(
  2,
  'dlp',
  'An organization needs to prevent sensitive data exfiltration across all channels including email, web uploads, USB devices, and cloud storage. The environment includes on-premises servers, employee laptops used both in-office and remotely, and multiple SaaS applications. Which DLP architecture BEST provides comprehensive coverage?',
  '["Network DLP at the internet gateway with deep packet inspection for all traffic", "Endpoint DLP on all devices combined with a CASB for cloud services and network DLP at the perimeter", "Cloud DLP integrated with SaaS applications and endpoint protection agents", "Network DLP with SSL inspection at the perimeter combined with encrypted USB drive requirements"]'::jsonb,
  2,
  'Comprehensive DLP requires coverage at all three points: network (perimeter scanning), endpoint (local device monitoring including USB and print), and cloud (CASB for SaaS applications). Option A misses endpoint protections and cloud coverage, and remote users bypass the gateway. Option C misses network perimeter coverage and does not specifically address USB. Option D misses endpoint content inspection and cloud coverage, and encrypted USBs do not prevent authorized users from copying data.',
  'Complete DLP = NEC: Network + Endpoint + Cloud. Miss any one and you leave a gap attackers will find.',
  'apply',
  'best_answer',
  'hard',
  1.30, 1.80, 0.20,
  'ai_generated', true
),

-- Q76: hard / analyze / comparison — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'data_states',
  'An organization evaluates three encryption approaches for protecting sensitive data transmitted between its headquarters and branch offices. Option X encrypts only the data payload while leaving routing headers in plaintext. Option Y encrypts the entire packet at each hop but decrypts and re-encrypts at every intermediate router. Option Z wraps data in multiple encryption layers, with each intermediate node removing one layer. Which analysis MOST accurately compares the security tradeoffs?',
  '["Option X provides the best anonymity because routing information is hidden from all nodes", "Option Y provides the strongest end-to-end confidentiality because data is encrypted at every point", "Option Z is the weakest because multiple decryption steps create more opportunities for interception", "Option X exposes routing metadata but keeps data encrypted end-to-end; Option Y hides routing between hops but exposes plaintext at each node; Option Z provides anonymity and confidentiality but at the cost of performance"]'::jsonb,
  3,
  'Option X (end-to-end encryption) keeps the payload encrypted from source to destination but leaves routing headers visible. Option Y (link encryption) hides routing info between hops but decrypts at each intermediate node, exposing plaintext. Option Z (onion encryption) provides both anonymity and confidentiality but introduces performance overhead. Option A is wrong because end-to-end leaves headers visible. Option B is wrong because link encryption exposes plaintext at nodes. Option C mischaracterizes onion security.',
  'ELO comparison: End-to-end = payload safe, headers exposed. Link = everything encrypted between hops, but plaintext at every node. Onion = maximum privacy, minimum speed.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q77: hard / apply / except_not — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + (-0.1) = 1.20, c = 0.25
(
  2,
  'casb',
  'A global consulting firm discovers through network traffic analysis that employees in 15 countries are using 47 different unauthorized cloud storage services to share client deliverables. Some of these services store data in regions that violate client contractual requirements. The firm has no existing cloud governance framework. The CISO proposes deploying a CASB as part of the remediation plan. A skeptical CTO asks what specific capabilities a CASB provides that existing firewalls and web proxies cannot. Which response MOST accurately describes the CASB''s unique value?',
  '["A CASB provides cloud service discovery to identify shadow IT, enforces granular data policies per cloud application, monitors user activity across cloud platforms, and ensures data residency compliance -- capabilities that traditional perimeter tools lack", "A CASB replaces the need for firewalls and web proxies by consolidating all network security into a single cloud-based platform", "A CASB provides faster internet connectivity by optimizing traffic routing to cloud services", "A CASB encrypts all cloud traffic using proprietary algorithms that are stronger than standard TLS"]'::jsonb,
  0,
  'CASBs provide four pillars of capability that traditional perimeter tools lack: visibility (cloud service discovery and shadow IT detection), compliance (data residency and regulatory enforcement), data security (granular policies per cloud application), and threat protection (user activity monitoring across cloud platforms). Option B incorrectly suggests replacement rather than complementing existing tools. Option C describes a WAN optimizer, not a CASB. Option D misrepresents CASB encryption capabilities.',
  'CASB four pillars: Visibility + Compliance + Data Security + Threat Protection. It is the cloud-specific layer that firewalls were never designed to provide.',
  'apply',
  'except_not',
  'hard',
  1.20, 2.00, 0.25,
  'ai_generated', true
),

-- Q78: hard / analyze / except_not — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + (-0.1) = 1.40, c = 0.25
(
  2,
  'data_lifecycle',
  'All of the following are valid reasons for reclassifying data during its lifecycle EXCEPT:',
  '["The data has been publicly disclosed through an authorized press release, reducing its sensitivity", "The storage costs for maintaining the current classification level exceed the IT department''s quarterly budget", "Regulatory changes impose new protection requirements on previously unregulated data categories", "A merger creates new competitive sensitivities around data that was previously classified at a lower level"]'::jsonb,
  1,
  'Classification decisions are based on data value, sensitivity, regulatory requirements, and potential impact -- not on IT budget constraints. If the cost of protection seems disproportionate, the conversation should be about risk acceptance, not reclassification to reduce cost. Options A (public disclosure reduces sensitivity), C (new regulations increase requirements), and D (business changes affect competitive sensitivity) are all legitimate triggers for reclassification.',
  'Classification follows VALUE and RISK, not BUDGET. Never reclassify data just because protecting it is expensive. That is risk acceptance, not reclassification.',
  'analyze',
  'except_not',
  'hard',
  1.40, 2.30, 0.25,
  'ai_generated', true
),

-- Q79: hard / apply / most_likely — correct at 2
-- IRT: b = 1.5 + 0.3 + 0.1 = 1.90, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  2,
  'data_remanence',
  'An organization uses full-disk encryption (BitLocker) on all employee laptops. When laptops reach end-of-life, the IT team decrypts the drives, performs a single-pass overwrite, and then donates the laptops. A security auditor questions this process. What is the MOST LIKELY concern the auditor would raise?',
  '["BitLocker decryption leaves residual encryption artifacts that could be mistakenly identified as sensitive data", "The single-pass overwrite does not meet the seven-pass DoD standard required for all media sanitization", "Decrypting the drive before overwriting unnecessarily exposes plaintext data; crypto shredding by simply discarding the BitLocker recovery keys would be more efficient and equally effective", "The laptops should be physically destroyed rather than donated regardless of the sanitization method used"]'::jsonb,
  2,
  'If the drives were encrypted with BitLocker, the most efficient sanitization approach is crypto shredding: simply destroy all copies of the recovery and encryption keys. The encrypted data remains on the drive but is permanently unreadable without the keys. Decrypting first creates unnecessary exposure of plaintext data and adds processing time. Option A is not a real concern. Option B references an outdated standard. Option D may be excessive depending on the data classification level.',
  'If the drive is already ENCRYPTED, just destroy the KEYS. Decrypting first is backwards -- you are removing your own protection before sanitizing.',
  'apply',
  'most_likely',
  'hard',
  1.40, 1.90, 0.22,
  'ai_generated', true
),

-- Q80: hard / analyze / tlatm — correct at 3
-- IRT: b = 1.5 + 0.6 + 0.5 = 2.60, a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'retention_policies',
  'As the CISO of a publicly traded financial services company, you must balance data retention requirements from multiple sources: SEC requires broker-dealer records for 6 years, IRS requires financial records for 7 years, state regulations require customer correspondence for 3 years, and the legal department requests a blanket 10-year retention for litigation protection. The CEO asks for your recommendation. Which approach demonstrates the BEST management judgment?',
  '["Adopt the 10-year blanket retention as requested by legal to provide maximum litigation protection across all data types", "Adopt the shortest retention period (3 years) for all data to minimize storage costs and legal exposure", "Adopt the 7-year IRS requirement for all data as a reasonable middle ground", "Implement differentiated retention periods matching each data type to its specific regulatory requirement, with documented justification for the selected periods and automated enforcement"]'::jsonb,
  3,
  'Effective retention management requires matching each data type to its specific regulatory requirement. Blanket policies either under-retain (creating compliance violations) or over-retain (creating unnecessary legal exposure and cost). Differentiated retention with automated enforcement ensures compliance while minimizing risk. Option A creates over-retention liability for data types requiring shorter periods. Option B violates SEC and IRS requirements. Option C under-retains for some and over-retains for others.',
  'Think Like a Manager: One size does NOT fit all for retention. Match each data TYPE to its LEGAL requirement. Automate enforcement. Document everything.',
  'analyze',
  'tlatm',
  'hard',
  1.90, 2.60, 0.20,
  'ai_generated', true
),

-- -------------------------------------------------------
-- Q81-Q90: hard continued
-- -------------------------------------------------------

-- Q81: hard / apply / scenario — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'A payment processor handles credit card transactions for 5,000 merchants. The processor replaces each credit card number with a randomly generated token upon receipt and stores the actual card number in a highly secured, PCI DSS-compliant vault accessible only to the processor''s authorization system. When a merchant needs to process a refund, they submit the token, and the processor''s system retrieves the actual card number from the vault to complete the transaction. If a merchant''s system is breached, an attacker obtains thousands of tokens. Why do these tokens have limited value to the attacker?',
  '["The tokens have no mathematical relationship to the original card numbers and are useless without access to the processor''s secure vault", "The tokens are encrypted with AES-256 and would take centuries to decrypt without the key", "The tokens automatically expire after 24 hours and become invalid for any transactions", "The tokens are linked to the merchant''s IP address and cannot be used from a different network"]'::jsonb,
  0,
  'Tokenization replaces sensitive data with random tokens that have no mathematical or algorithmic relationship to the original values. Without access to the tokenization vault, which maps tokens to actual card numbers, the tokens are meaningless strings. This is a key advantage of tokenization over encryption, where the ciphertext has a mathematical relationship to the plaintext. Option B describes encryption, not tokenization. Option C describes time-limited tokens, which is not the primary security mechanism. Option D describes network restrictions.',
  'Tokens are RANDOM -- no math connects them to the real data. Break the merchant, get useless tokens. The VAULT is the only bridge.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q82: hard / apply / first_action — correct at 1
-- IRT: b = 1.5 + 0.3 + 0.3 = 2.10, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_classification',
  'A biotechnology company is developing a gene therapy product. The company''s research data includes proprietary formulas (trade secrets), patient clinical trial data (PHI), employee records (PII), and published research papers (public). Currently all data resides in the same shared network drive with uniform access controls. The CISO is tasked with implementing a proper data governance framework. What should the CISO do FIRST?',
  '["Encrypt the entire shared drive with AES-256 to protect all data equally", "Inventory and classify each data type based on its sensitivity, regulatory requirements, and value, then assign data owners for each category", "Migrate all data to a cloud provider with built-in classification capabilities", "Implement role-based access controls on the shared drive based on department membership"]'::jsonb,
  1,
  'The first step in any data governance program is to identify, inventory, and classify data, then assign ownership. Different data types have vastly different sensitivity levels and regulatory requirements (trade secrets vs. PHI vs. PII vs. public), so uniform treatment is inappropriate. Option A provides uniform protection without understanding what needs more or less protection. Option C changes location without addressing governance. Option D applies access controls without understanding data sensitivity differences.',
  'Different data = different classification = different controls. Step 1 is always: WHAT do you have, HOW sensitive is it, and WHO owns it?',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q83: hard / analyze / scenario — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.2 = 2.30, a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'privacy_principles',
  'A technology company collects user data under a privacy policy that states data will be used solely for service improvement. The company later develops a new revenue stream by selling aggregated user behavior analytics to third-party advertisers. The company''s legal team argues this is permissible because: (1) the data is aggregated, not individual; (2) the privacy policy includes a clause allowing unilateral policy updates; and (3) users were notified of the update via email. A privacy advocate challenges this practice. Which analysis MOST accurately identifies the privacy violation?',
  '["The practice is permissible because aggregated data is not subject to privacy regulations", "The practice is permissible because users were notified of the policy change via email", "The practice violates the Purpose Specification and Use Limitation principles because data collected for one purpose cannot be repurposed without meaningful consent, regardless of aggregation or unilateral policy changes", "The practice is only problematic if the aggregated data can be reidentified to specific individuals"]'::jsonb,
  2,
  'The OECD Purpose Specification Principle requires that the purposes for which data is collected be specified at or before the time of collection. The Use Limitation Principle restricts use to those specified purposes unless the data subject provides new consent. Unilateral policy changes and email notifications do not constitute meaningful consent. Option A incorrectly exempts aggregated data from all privacy considerations. Option B conflates notification with consent. Option D focuses on reidentification rather than the fundamental purpose violation.',
  'Purpose Specification + Use Limitation: You said SERVICE IMPROVEMENT, not ADVERTISING SALES. New purpose requires NEW CONSENT, not a policy update email.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
),

-- Q84: hard / apply / calculation — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.4 = 2.20, a = 1.3 + 0.3 = 1.60, c = 0.20
(
  2,
  'privacy_principles',
  'A global social media company with annual revenue of 600 million Euros faces two simultaneous GDPR enforcement actions. The first action involves failing to obtain valid consent for data processing (Tier 2 violation: up to 4% of global annual revenue or 20 million Euros, whichever is higher). The second involves failing to maintain proper records of processing activities (Tier 1 violation: up to 2% of global annual revenue or 10 million Euros, whichever is higher). What is the combined MAXIMUM potential fine exposure?',
  '["30 million Euros", "32 million Euros", "24 million Euros", "36 million Euros"]'::jsonb,
  3,
  'Tier 2 maximum: 4% of 600M = 24M Euros. Compare with 20M threshold: 24M > 20M, so use 24M (whichever is higher). Tier 1 maximum: 2% of 600M = 12M Euros. Compare with 10M threshold: 12M > 10M, so use 12M. Combined maximum: 24M + 12M = 36M Euros. Option A incorrectly uses the fixed thresholds (20M + 10M). Option B miscalculates. Option C only calculates the Tier 2 amount without adding Tier 1.',
  'GDPR has TWO tiers of penalties. Calculate EACH separately: Tier 2 = max(4% of revenue, 20M). Tier 1 = max(2% of revenue, 10M). Then ADD them for multiple violations.',
  'apply',
  'calculation',
  'hard',
  1.60, 2.20, 0.20,
  'ai_generated', true
),

-- Q85: hard / analyze / best_answer — correct at 0
-- IRT: b = 1.5 + 0.6 + 0.0 = 2.10, a = 1.5 + 0.0 = 1.50, c = 0.20
(
  2,
  'data_ownership_roles',
  'A large hospital system has a Chief Medical Officer (data owner for patient records), an IT Director (data custodian), a Clinical Data Analyst (data steward), and a cloud-based EHR vendor (data processor). During a security audit, it is discovered that the EHR vendor has been using deidentified patient data to train a machine learning algorithm for a separate commercial product without the hospital''s knowledge. Which analysis BEST identifies the accountability failure?',
  '["The data processor exceeded its authorized processing scope by using data for purposes not directed by the controller, and the data owner failed in accountability by not establishing and monitoring contractual processing limitations", "The data custodian should have implemented technical controls to prevent the vendor from accessing deidentified data", "The data steward failed to maintain data quality standards during the deidentification process", "The IT Director is solely responsible because they selected the cloud vendor without adequate security evaluation"]'::jsonb,
  0,
  'This is a dual failure: the processor (vendor) violated its role by processing data beyond the controller''s instructions, and the owner failed in accountability by not establishing proper contractual limitations and monitoring compliance. Under GDPR, the controller must ensure processors only process data as instructed. Option B misplaces responsibility on the custodian for a governance issue. Option C misidentifies the steward''s role. Option D focuses on vendor selection rather than ongoing governance.',
  'The Processor went ROGUE and the Owner was not WATCHING. Processor = follow orders ONLY. Owner = VERIFY they are following orders.',
  'analyze',
  'best_answer',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),

-- Q86: hard / apply / scenario — correct at 1
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'scoping_tailoring',
  'A federal agency categorizes its new system as high-impact under FIPS 199. During the implementation of NIST SP 800-53 high-impact baseline controls, the security team encounters a control requiring hardware-based cryptographic key storage modules. The agency''s system operates entirely in an air-gapped environment with no external network connectivity, and the risk assessment determines that the specific threat this control addresses is negligible in the air-gapped context. The team documents this assessment. What actions constitute proper baseline modification?',
  '["Removing the control entirely through scoping since air-gapped systems are exempt from cryptographic requirements", "Scoping out the specific control with documented justification based on the risk assessment, then selecting a compensating control that addresses residual risk in the air-gapped environment", "Tailoring the control by reducing the cryptographic key length requirement to align with the air-gapped environment", "Ignoring the control since risk assessments override baseline requirements"]'::jsonb,
  1,
  'When a control is determined to be inapplicable or unnecessary for a specific system, scoping removes it with documented justification. However, best practice requires selecting compensating controls to address any residual risk. The documentation provides defensible rationale if the decision is questioned during audits. Option A overgeneralizes -- air-gapped systems are not exempt from all crypto requirements. Option C modifies the control (tailoring) but does not address the inapplicability finding. Option D lacks proper governance.',
  'Scope OUT with DOCUMENTATION and COMPENSATE for residual risk. Never just delete a control -- document WHY and cover the gap.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q87: hard / analyze / most_likely — correct at 2
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'information_obfuscation',
  'A pharmaceutical company needs to share clinical trial data with regulatory agencies while protecting participant privacy. The privacy team applies k-anonymity with k=5, ensuring each combination of quasi-identifiers appears in at least five records. A data scientist on the team warns that k-anonymity alone may be insufficient. What is the MOST LIKELY vulnerability the data scientist is concerned about?',
  '["K-anonymity does not protect against attribute linkage attacks -- a group of k identical quasi-identifiers may all share the same sensitive attribute value, revealing information about every member of the group", "K-anonymity requires too much computational power for large datasets and may produce inaccurate results", "K-anonymity only works with numerical data and cannot protect text-based attributes like diagnosis codes", "K-anonymity prevents all forms of reidentification but may corrupt the statistical validity of the research data"]'::jsonb,
  2,
  'K-anonymity ensures that each record is indistinguishable from at least k-1 other records based on quasi-identifiers. However, if all records in a k-anonymous group share the same sensitive attribute (e.g., all five people with the same zip/age/gender combination have the same diagnosis), an attacker learns the sensitive value for everyone in that group. This is called homogeneity attack, which l-diversity and t-closeness were designed to address. Option B misrepresents computational requirements. Option C incorrectly limits data types. Option D overstates protection.',
  NULL,
  'analyze',
  'most_likely',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- Q88: hard / apply / scenario — correct at 3
-- IRT: b = 1.5 + 0.3 + 0.2 = 2.00, a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A software company''s product development team uses a staging environment populated with a complete copy of the production customer database for integration testing. The staging environment has relaxed access controls compared to production, and several contractors have unrestricted access. The data includes customer names, email addresses, payment history, and support ticket content. A security assessor identifies this as a significant finding. Which aspect of data lifecycle management has been most severely violated?',
  '["Data archiving, because production data should be archived rather than copied", "Data destruction, because old test data should be destroyed after each testing cycle", "Data retention, because the staging copy creates an unnecessary duplicate with an undefined retention period", "Data handling, because production data containing sensitive customer information should never be placed in an environment with reduced security controls and broader access"]'::jsonb,
  3,
  'The most severe violation is data handling. Sensitive production data should not be placed in environments with weaker controls and broader access than the data''s classification requires. The staging environment with relaxed controls and contractor access does not meet the protection requirements for the customer data it contains. Option A misidentifies archiving as the issue. Option B identifies a secondary concern. Option C identifies a valid but less critical issue than the fundamental handling violation.',
  'Data must be protected according to its CLASSIFICATION, not its LOCATION. Moving sensitive data to a weaker environment is a handling violation.',
  'apply',
  'scenario',
  'hard',
  1.50, 2.00, 0.20,
  'ai_generated', true
),

-- Q89: hard / apply / comparison — correct at 0
-- IRT: b = 1.5 + 0.3 + 0.1 = 1.90, a = 1.3 + 0.1 = 1.40, c = 0.22
(
  2,
  'data_destruction',
  'An organization must sanitize three types of storage media: (1) traditional magnetic hard drives from a decommissioned file server, (2) enterprise SSDs from a database server, and (3) data stored in an IaaS cloud environment. How should the sanitization approach differ for each?',
  '["HDDs can be degaussed or physically destroyed; SSDs should be physically destroyed due to wear-leveling limitations; cloud data should use crypto shredding since physical destruction is not feasible", "All three should be overwritten with a seven-pass pattern to ensure consistent sanitization across all media types", "HDDs should be physically destroyed; SSDs can be degaussed; cloud data should be deleted through the provider''s management console", "All three should use crypto shredding since it is the most universally effective sanitization method"]'::jsonb,
  0,
  'Each media type requires a different approach based on its characteristics. HDDs respond to degaussing (magnetic media) or physical destruction. SSDs require physical destruction because wear-leveling makes overwriting unreliable and degaussing has zero effect on non-magnetic media. Cloud data requires crypto shredding because physical access is not available. Option B applies a uniform method that is unreliable for SSDs and impractical in cloud. Option C incorrectly applies degaussing to SSDs. Option D ignores that crypto shredding requires pre-encryption.',
  'Match the METHOD to the MEDIA: HDDs = degauss or destroy. SSDs = destroy (degaussing is useless). Cloud = crypto shred (no physical access).',
  'apply',
  'comparison',
  'hard',
  1.40, 1.90, 0.22,
  'ai_generated', true
),

-- Q90: hard / analyze / comparison — correct at 1
-- IRT: b = 1.5 + 0.6 + 0.1 = 2.20, a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'data_classification',
  'A multinational bank''s classification board is debating whether to classify a new type of AI-generated customer risk score as Confidential or Internal. The risk scores are derived from aggregated transaction patterns and do not contain any individual customer identifiers. However, a data scientist demonstrates that combining the risk scores with publicly available data could potentially identify high-net-worth customers. The legal team notes that the risk scores also constitute proprietary intellectual property representing significant R&D investment. Which classification argument is MOST compelling?',
  '["Internal classification is sufficient because the risk scores do not contain direct customer identifiers", "Confidential classification is warranted because the reidentification potential creates privacy risk and the proprietary nature represents significant competitive value", "The data should remain unclassified until the reidentification risk is empirically validated through testing", "The classification should be deferred to the IT department since they understand the technical nature of the data"]'::jsonb,
  1,
  'Classification should be based on the highest applicable risk factor. The risk scores present two classification drivers: (1) potential privacy impact through reidentification, and (2) proprietary value as intellectual property. Both factors support Confidential classification. Option A focuses narrowly on direct identifiers and ignores inference risk and IP value. Option C delays protection during a validation period when the data may be exposed. Option D misplaces the classification decision -- it belongs to data owners, not IT.',
  'Classify based on the HIGHEST risk factor. Privacy risk + IP value = higher classification wins. Absence of direct identifiers does not mean absence of risk.',
  'analyze',
  'comparison',
  'hard',
  1.60, 2.20, 0.22,
  'ai_generated', true
),

-- ═══════════════════════════════════════════════════════════
-- VERY HARD QUESTIONS (Q91-Q100) — IRT b base = 2.5
-- ═══════════════════════════════════════════════════════════

-- Q91: very_hard / analyze / scenario — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'data_destruction',
  'A national intelligence agency is decommissioning a classified data center. The facility contains 2,000 magnetic HDDs (Top Secret), 500 enterprise SSDs (Top Secret), 300 magnetic backup tapes (Secret), and a SAN with 50 encrypted virtual volumes hosted on shared spinning-disk arrays (Secret). The agency must sanitize all media according to the strictest government standards. A contractor proposes: degauss all HDDs, use ATA Secure Erase on SSDs, degauss all tapes, and crypto-shred the SAN volumes. An information assurance analyst reviews the proposal. Which elements of the proposal are MOST critically flawed?',
  '["The tape degaussing is flawed because Secret data requires physical destruction, while the SSD approach is acceptable", "The HDD degaussing is flawed because magnetic media at Top Secret requires physical destruction, not degaussing", "The SSD sanitization is critically flawed because degaussing has no effect on non-magnetic media, and ATA Secure Erase is not trusted for Top Secret data -- physical destruction is required; the remaining elements are acceptable", "All four elements are equally flawed because the only acceptable method for any classified data is incineration"]'::jsonb,
  2,
  'The most critical flaw is the SSD proposal. Degaussing has zero effect on SSDs (non-magnetic media), and ATA Secure Erase is a software method not trusted for Top Secret data. SSDs require physical destruction (disintegration to 2mm or smaller). HDDs can be degaussed effectively (magnetic media). Tapes can be degaussed (magnetic media). Crypto shredding of SAN volumes is reasonable for Secret-level encrypted data. Option A reverses the flaws. Option B incorrectly claims degaussing fails for magnetic HDDs. Option D overstates requirements.',
  'SSDs are the trap: not magnetic, so degaussing fails. Top Secret = physical destruction for non-magnetic media. Know which methods work on which media types.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q92: very_hard / analyze / tlatm — correct at 3
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.00 (clamped), a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'data_sovereignty',
  'Your organization operates in 12 EU countries, 5 Asian countries, and the United States. The board has approved a cloud-first strategy. During the architecture review, you identify the following conflicts: (1) China''s Cybersecurity Law requires critical data to remain within China; (2) GDPR requires adequate protections for EU resident data; (3) The US CLOUD Act enables US law enforcement to compel disclosure of data stored by US companies anywhere in the world; (4) Russia''s data localization law requires Russian citizen data to be stored on servers in Russia. The cloud provider is a US-headquartered company. As the CISO, which architectural decision BEST demonstrates management-level understanding of these intersecting requirements?',
  '["Use a single US cloud provider with strong encryption for all regions, since encryption makes data location irrelevant to sovereignty concerns", "Select a European cloud provider to avoid US CLOUD Act jurisdiction while satisfying GDPR requirements", "Move all data on-premises in each country to completely eliminate cross-border data flow issues", "Implement a multi-cloud, multi-region architecture with jurisdiction-specific providers where required, data residency controls per regulation, contractual provisions addressing the CLOUD Act, and continuous compliance monitoring across all jurisdictions"]'::jsonb,
  3,
  'Complex multinational data sovereignty requires a nuanced, multi-layered approach. China and Russia require local storage. GDPR requires adequacy mechanisms. The CLOUD Act creates potential conflicts with non-US regulations. A multi-cloud, multi-region architecture with jurisdiction-specific controls is the only approach that addresses all requirements. Option A ignores that encryption does not resolve sovereignty. Option B does not solve China or Russia requirements and may not fully mitigate CLOUD Act concerns. Option C is prohibitively expensive and still does not address cross-border business needs.',
  'Think Like a Manager: Global operations = global regulations. No single provider or approach fits all jurisdictions. Layer your architecture to match the regulatory map.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q93: very_hard / analyze / scenario — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + 0.2 = 1.70, c = 0.20
(
  2,
  'pseudonymization_tokenization',
  'A health insurance company implements a data sharing architecture to support research collaboration with three universities. Patient records are pseudonymized using a keyed hash function before sharing. University A receives records with diagnosis codes and treatment dates. University B receives records with prescription data and demographic attributes. University C receives records with billing codes and provider information. All three universities receive the same pseudonymous patient identifiers. A privacy researcher raises a concern about this architecture. What is the MOST significant privacy risk?',
  '["The keyed hash function could be reversed through brute-force computation to recover original patient identifiers", "The pseudonymous identifiers may collide, causing records from different patients to be incorrectly linked", "Since all three universities share the same pseudonymous identifiers, they could collude to combine their datasets and reconstruct comprehensive patient profiles that approach full reidentification", "The treatment dates could be used independently by any single university to identify patients without needing the pseudonymous identifiers"]'::jsonb,
  2,
  'The critical flaw is using consistent pseudonymous identifiers across all three recipients. If any two or all three universities combine their datasets, they can link records using the shared identifiers and reconstruct comprehensive patient profiles (diagnosis + prescription + demographics + billing + provider). This combination dramatically increases reidentification risk. Option A is unlikely with a properly implemented keyed hash. Option B is theoretically possible but unlikely with good hash functions. Option D overstates the identifying power of dates alone.',
  'Same pseudonym across multiple recipients = COLLUSION risk. Each recipient should get DIFFERENT pseudonyms to prevent cross-linking.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),

-- Q94: very_hard / apply / first_action — correct at 3
-- IRT: b = 2.5 + 0.3 + 0.3 = 3.00 (clamped), a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'data_lifecycle',
  'A financial services organization discovers that a legacy data warehouse contains 15 years of customer transaction data. The warehouse was built before any data governance program existed. Some data is subject to SEC 6-year retention rules, some to IRS 7-year rules, some to state regulations requiring only 3 years, and some data has no regulatory retention requirement. Additionally, 2 years of data may be subject to an ongoing regulatory investigation. The organization wants to reduce its data footprint and associated liability. What should the CISO recommend FIRST?',
  '["Immediately delete all data older than 7 years since the longest regulatory requirement is 7 years", "Encrypt the entire data warehouse and defer the cleanup until the regulatory investigation concludes", "Engage outside counsel to perform a comprehensive data mapping to categorize all records by applicable retention requirement and investigate holds", "Implement a litigation hold on the entire 15-year data warehouse until legal review is complete, then classify each data type according to its applicable retention requirement before any deletion occurs"]'::jsonb,
  3,
  'The FIRST step is to preserve everything (litigation hold due to the ongoing investigation) and then systematically classify each data type by its applicable retention requirement. Deleting any data while an investigation is ongoing could constitute spoliation. Only after classification and legal review can appropriate retention/destruction decisions be made. Option A risks destroying data under investigation hold and ignores the investigation. Option B defers action without addressing the classification need. Option C is a reasonable step but skips the immediate preservation requirement.',
  'When an investigation exists: HOLD first, CLASSIFY second, DELETE only after legal clearance. Never destroy data during an active investigation.',
  'apply',
  'first_action',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q95: very_hard / analyze / except_not — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.2 = 3.00 (clamped), a = 1.5 + (-0.1) = 1.40, c = 0.25
(
  2,
  'data_classification',
  'All of the following represent valid factors that a classification board should consider when assigning a classification level to organizational data EXCEPT:',
  '["The physical size of the data files and total storage volume consumed", "The potential impact of unauthorized disclosure on organizational reputation and competitive advantage", "Applicable legal and regulatory requirements governing the data category", "The cost of recreating the data if it were lost or destroyed"]'::jsonb,
  0,
  'Classification is based on the data''s value, sensitivity, regulatory requirements, and impact of disclosure -- not on its physical size or storage volume. A 1-kilobyte file containing a trade secret formula is far more sensitive than a 1-terabyte collection of public marketing materials. File size is a storage management concern, not a classification factor. Options B (impact of disclosure), C (regulatory requirements), and D (recreation cost/value) are all legitimate classification factors.',
  'Classification follows VALUE and IMPACT, not FILE SIZE. A tiny file can be Top Secret. A massive file can be Public. Size is irrelevant to sensitivity.',
  'analyze',
  'except_not',
  'very_hard',
  1.40, 3.00, 0.25,
  'ai_generated', true
),

-- Q96: very_hard / apply / scenario — correct at 1
-- IRT: b = 2.5 + 0.3 + 0.2 = 3.00 (clamped), a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'dlp',
  'An enterprise deploys a comprehensive DLP solution covering network, endpoint, and cloud channels. Six months later, the security team discovers a data breach: an employee had been exfiltrating customer records by photographing their screen with a personal smartphone, then uploading the photos from their home network. The DLP never generated an alert. The CISO must explain to the board why the DLP investment failed to prevent this breach. Which analysis is MOST accurate?',
  '["The DLP solution was misconfigured and should have detected the screen photography through camera detection sensors", "DLP solutions monitor digital data channels and cannot prevent analog exfiltration methods such as screen photography; this risk requires complementary physical controls like device restrictions in sensitive areas and camera detection", "The endpoint DLP agent should have detected the smartphone via Bluetooth and blocked screen capture", "The DLP failure indicates a defective product, and the organization should demand a refund and switch vendors"]'::jsonb,
  1,
  'DLP monitors digital data channels -- network traffic, file operations, email attachments, cloud uploads. It cannot detect or prevent analog exfiltration methods like photographing a screen. This gap must be addressed through complementary physical security controls such as banning personal devices in sensitive areas, using camera detection systems, and implementing privacy screens. Option A overstates DLP capabilities. Option C misrepresents Bluetooth detection capabilities. Option D blames the product for a gap inherent in the technology category.',
  'DLP = DIGITAL Loss Prevention. It cannot stop ANALOG exfiltration (photos, handwriting, memorization). Physical controls fill the gap.',
  'apply',
  'scenario',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q97: very_hard / analyze / best_answer — correct at 2
-- IRT: b = 2.5 + 0.6 + 0.0 = 3.00 (clamped), a = 1.5 + 0.0 = 1.50, c = 0.20
(
  2,
  'data_remanence',
  'An organization''s forensic team discovers that an employee suspected of corporate espionage used a TRIM-enabled SSD laptop. The employee deleted sensitive files three weeks ago and the laptop remained in regular use. The forensic team attempts to recover the deleted files. Which statement BEST describes the recovery prospects and the underlying technical reason?',
  '["Recovery is likely because TRIM only marks sectors for future erasure and the SSD controller may not have processed all TRIM commands yet", "Recovery is guaranteed because SSDs retain all data in write-leveled cells even after TRIM commands", "Recovery is unlikely because TRIM instructs the SSD controller to zero out the underlying data blocks, and with three weeks of continued use, the controller has almost certainly completed the garbage collection process", "Recovery is impossible because TRIM immediately and permanently encrypts deleted data blocks with a one-time key that is then discarded"]'::jsonb,
  2,
  'TRIM is an operating system command that informs the SSD controller which data blocks are no longer in use. The controller then zeroes out these blocks during garbage collection to prepare them for future writes. After three weeks of continued use, the garbage collection process would have processed the TRIM commands and zeroed out the blocks containing the deleted files, making recovery extremely unlikely. Option A overstates the persistence of unmarked blocks after three weeks. Option B misunderstands TRIM behavior. Option D fabricates a non-existent encryption mechanism.',
  'TRIM + garbage collection = data is TRULY gone on SSDs. Unlike HDDs where deleted data persists, SSDs actively ERASE trimmed blocks.',
  'analyze',
  'best_answer',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q98: very_hard / apply / scenario — correct at 3
-- IRT: b = 2.5 + 0.3 + 0.2 = 3.00 (clamped), a = 1.3 + 0.2 = 1.50, c = 0.20
(
  2,
  'information_obfuscation',
  'A government statistical agency publishes census microdata for academic research. To protect privacy, the agency applies the following de-identification strategy: remove all direct identifiers (names, SSNs), generalize ages into 5-year ranges, reduce geographic precision from street addresses to county level, and suppress any cell with fewer than 3 observations. An external review team evaluates the released dataset and identifies a vulnerability: in several rural counties, the combination of generalized age range, gender, ethnicity, and occupation creates unique or near-unique records. What specific privacy-preserving technique would BEST address this residual vulnerability?',
  '["Apply differential privacy by adding calibrated statistical noise to the query results rather than releasing raw microdata", "Increase the suppression threshold from 3 to 10 observations to eliminate small cells", "Replace all demographic attributes with randomly generated synthetic data", "Apply l-diversity to ensure that each equivalence class contains at least l well-represented values for sensitive attributes, preventing attribute disclosure from unique demographic combinations"]'::jsonb,
  3,
  'The vulnerability is that some equivalence classes (groups with identical quasi-identifier combinations) contain too few records, making individuals distinguishable. L-diversity extends k-anonymity by requiring that each equivalence class contains at least l well-represented values for sensitive attributes, preventing attribute disclosure. Option A is a valid alternative approach but fundamentally changes the data release model from microdata to query results. Option B helps but does not address the structural vulnerability of near-unique combinations. Option C destroys data utility.',
  'K-anonymity ensures group size. L-diversity ensures DIVERSITY within groups. When demographic combos create near-unique records, l-diversity prevents attribute disclosure.',
  'apply',
  'scenario',
  'very_hard',
  1.50, 3.00, 0.20,
  'ai_generated', true
),

-- Q99: very_hard / analyze / tlatm — correct at 0
-- IRT: b = 2.5 + 0.6 + 0.5 = 3.00 (clamped), a = 1.5 + 0.4 = 1.90, c = 0.20
(
  2,
  'data_ownership_roles',
  'As the newly hired CISO of a Fortune 500 company, you discover that the organization treats data classification as a one-time activity performed during system deployment. Classifications have not been reviewed in five years despite significant changes including cloud migration, two major acquisitions, new privacy regulations (GDPR and CCPA), and expansion into Asian markets with data localization requirements. The CEO asks for a concise recommendation to present to the board. Which recommendation demonstrates the MOST comprehensive management understanding of the problem?',
  '["Propose a comprehensive data governance transformation: establish a cross-functional classification board, conduct a full data inventory and reclassification effort, implement continuous classification review triggers tied to business changes, align classifications with current regulatory requirements across all jurisdictions, and establish metrics to measure ongoing compliance", "Hire a consulting firm to reclassify all data according to current regulations", "Request budget for a data classification software tool that can automatically scan and classify all organizational data", "Propose that each department head reclassify their own department''s data within 90 days"]'::jsonb,
  0,
  'A CISO-level recommendation to the board must address the systemic governance failure, not just the symptoms. The proposal establishes ongoing governance (classification board), addresses the immediate gap (inventory and reclassification), prevents recurrence (continuous review triggers), ensures compliance (multi-jurisdictional alignment), and enables oversight (metrics). Option B outsources without building internal capability. Option C relies on technology without governance. Option D distributes work without providing framework, criteria, or coordination.',
  'Think Like a Manager: Board-level recommendations address ROOT CAUSES and build SYSTEMS, not just fix the immediate problem. Governance + Process + Technology + Metrics.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),

-- Q100: very_hard / analyze / comparison — correct at 1
-- IRT: b = 2.5 + 0.6 + 0.1 = 3.00 (clamped), a = 1.5 + 0.1 = 1.60, c = 0.22
(
  2,
  'pseudonymization_tokenization',
  'A healthcare data exchange platform facilitates data sharing between hospitals, insurers, and research institutions. The platform architect must choose between pseudonymization, tokenization, and anonymization for different data flows. Hospitals share patient records with insurers for claims processing, with researchers for clinical studies, and with a government registry for public health reporting. How should the architect MOST appropriately apply these three techniques across the different data flows?',
  '["Use anonymization for all three flows because it provides the strongest privacy protection regardless of use case", "Use tokenization for insurer claims processing (reversibility needed for claim adjudication), pseudonymization for research sharing (researchers need consistent identifiers across records but should not access real identities), and anonymization for public health reporting (individual identification is unnecessary and should be impossible)", "Use pseudonymization for all three flows because it provides GDPR compliance with reduced requirements", "Use encryption for all three flows because it protects data regardless of the recipient or purpose"]'::jsonb,
  1,
  'Each data flow has different requirements. Claims processing requires the ability to link back to real patients (tokenization with secure vault). Research needs consistent identifiers for longitudinal studies without revealing identities (pseudonymization). Public health reporting needs aggregate data with no individual identification (anonymization). Option A sacrifices claims processing functionality. Option C applies one technique regardless of different requirements. Option D does not address the de-identification needs specific to each use case.',
  'Match the DE-IDENTIFICATION technique to the USE CASE: Tokenization = need to reverse for transactions. Pseudonymization = need consistent IDs without real identity. Anonymization = no individual identification needed or wanted.',
  'analyze',
  'comparison',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
);

-- ═══════════════════════════════════════════════════════════
-- END OF DOMAIN 2 QUESTION BANK (100 questions)
-- ═══════════════════════════════════════════════════════════