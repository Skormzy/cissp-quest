-- ============================================================================
-- CISSP Quest - Complete Database Migration
-- Paste this entire file into Supabase SQL Editor and run
-- ============================================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================================
-- TABLES
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT,
  character_name TEXT,
  character_gender TEXT,
  character_skin INT DEFAULT 1,
  character_hair INT DEFAULT 1,
  character_hair_color TEXT DEFAULT '#2d1b00',
  character_outfit INT DEFAULT 1,
  xp INT DEFAULT 0,
  level INT DEFAULT 1,
  streak_count INT DEFAULT 0,
  streak_last_date DATE,
  subscription_tier TEXT DEFAULT 'free',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.library_topics (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  topic_number TEXT NOT NULL,
  title TEXT NOT NULL,
  one_liner TEXT,
  content_markdown TEXT,
  key_formulas JSONB,
  comparison_table JSONB,
  exam_tips TEXT,
  think_like_manager TEXT,
  memory_hack TEXT,
  memory_anchor TEXT,
  related_topic_ids JSONB DEFAULT '[]',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  domain_id INT NOT NULL CHECK (domain_id BETWEEN 1 AND 8),
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  question_text TEXT NOT NULL,
  options JSONB NOT NULL,
  correct_index INT NOT NULL CHECK (correct_index BETWEEN 0 AND 3),
  explanation TEXT,
  story_context TEXT,
  source TEXT,
  bloom_level TEXT,
  mnemonic_hint TEXT,
  library_topic_id UUID REFERENCES public.library_topics(id),
  is_active BOOLEAN DEFAULT true,
  times_shown INT DEFAULT 0,
  times_correct INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.user_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id),
  selected_index INT NOT NULL,
  is_correct BOOLEAN NOT NULL,
  time_spent_seconds INT,
  xp_earned INT DEFAULT 0,
  session_id UUID,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.story_progress (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  chapter_id INT NOT NULL,
  scene_index INT DEFAULT 0,
  domain_id INT NOT NULL,
  is_complete BOOLEAN DEFAULT false,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, chapter_id)
);

CREATE TABLE IF NOT EXISTS public.achievements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  badge_id TEXT NOT NULL,
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, badge_id)
);

CREATE TABLE IF NOT EXISTS public.chapter_lessons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  chapter_id INT NOT NULL,
  domain_id INT NOT NULL,
  title TEXT NOT NULL,
  content_markdown TEXT,
  knowledge_check_questions JSONB,
  library_topic_ids JSONB DEFAULT '[]',
  display_order INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.user_bookmarks (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  topic_id UUID NOT NULL REFERENCES public.library_topics(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY(user_id, topic_id)
);

CREATE TABLE IF NOT EXISTS public.user_question_schedule (
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  times_seen INT DEFAULT 0,
  times_correct INT DEFAULT 0,
  interval_days INT DEFAULT 1,
  next_review DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY(user_id, question_id)
);

-- ============================================================================
-- ROW LEVEL SECURITY
-- ============================================================================

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.library_topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.story_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.chapter_lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_bookmarks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_question_schedule ENABLE ROW LEVEL SECURITY;

-- Users: own row only
CREATE POLICY "Users can view own profile" ON public.users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON public.users FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Users can insert own profile" ON public.users FOR INSERT WITH CHECK (auth.uid() = id);

-- Questions: public select
CREATE POLICY "Anyone can view questions" ON public.questions FOR SELECT USING (true);

-- Library topics: public select
CREATE POLICY "Anyone can view library topics" ON public.library_topics FOR SELECT USING (true);

-- Chapter lessons: public select
CREATE POLICY "Anyone can view chapter lessons" ON public.chapter_lessons FOR SELECT USING (true);

-- User answers: own row
CREATE POLICY "Users can view own answers" ON public.user_answers FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own answers" ON public.user_answers FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Story progress: own row
CREATE POLICY "Users can view own story progress" ON public.story_progress FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own story progress" ON public.story_progress FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own story progress" ON public.story_progress FOR UPDATE USING (auth.uid() = user_id);

-- Achievements: own row
CREATE POLICY "Users can view own achievements" ON public.achievements FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own achievements" ON public.achievements FOR INSERT WITH CHECK (auth.uid() = user_id);

-- User bookmarks: own row
CREATE POLICY "Users can view own bookmarks" ON public.user_bookmarks FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own bookmarks" ON public.user_bookmarks FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can delete own bookmarks" ON public.user_bookmarks FOR DELETE USING (auth.uid() = user_id);

-- User question schedule: own row
CREATE POLICY "Users can view own schedule" ON public.user_question_schedule FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own schedule" ON public.user_question_schedule FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own schedule" ON public.user_question_schedule FOR UPDATE USING (auth.uid() = user_id);

-- ============================================================================
-- SEED DATA: LIBRARY TOPICS (40+ topics across 8 domains)
-- ============================================================================

-- DOMAIN 1: Security and Risk Management (5 topics)
INSERT INTO public.library_topics (domain_id, topic_number, title, one_liner, content_markdown, key_formulas, comparison_table, exam_tips, think_like_manager, memory_hack, memory_anchor) VALUES

(1, '1.1', 'CIA Triad', 'The three pillars of information security: Confidentiality, Integrity, and Availability.',
'## The Foundation of Security

The CIA Triad is the bedrock of all information security. Think of it as a three-legged stool — remove any leg and the whole thing collapses.

**Confidentiality** ensures that information is accessible only to those authorized to see it. Encryption, access controls, and data classification all serve confidentiality. A hospital keeping patient records private is confidentiality in action.

**Integrity** means that data remains accurate, complete, and unaltered except by authorized parties. Hash functions, digital signatures, and version control protect integrity. When you download software and verify its checksum, you are checking integrity.

**Availability** ensures that systems and data are accessible when needed by authorized users. Redundancy, backups, disaster recovery, and load balancing all support availability. An e-commerce site staying online during Black Friday is availability at work.

The key insight for the CISSP exam is that these three goals often create tension. Increasing confidentiality (e.g., stronger encryption) can reduce availability (slower systems). A security professional must balance all three based on business needs.',
'[{"formula": "Security = Confidentiality + Integrity + Availability", "description": "All three must be balanced based on organizational risk appetite"}]',
'{"headers": ["Pillar", "Threat", "Control Example"], "rows": [["Confidentiality", "Unauthorized disclosure", "Encryption, ACLs"], ["Integrity", "Unauthorized modification", "Hashing, digital signatures"], ["Availability", "Disruption of service", "Redundancy, backups"]]}',
'The CISSP loves asking which pillar is MOST affected. A DDoS attack primarily impacts Availability. Data leakage impacts Confidentiality. A man-in-the-middle modifying data impacts Integrity.',
'As a manager, you need to determine which pillar matters most for each asset. A bank values Integrity (accurate transactions) highly. A streaming service prioritizes Availability. A law firm prioritizes Confidentiality.',
'Think "CIA" like the agency — they keep secrets (Confidentiality), verify intelligence (Integrity), and are always ready (Availability). Remember: C-I-A = Can I Access?',
'🗽 New York - The Breach Discovery'),

(1, '1.2', 'Risk Management Frameworks', 'Structured approaches to identifying, assessing, and mitigating organizational risk.',
'## Managing Risk Systematically

Risk management is not about eliminating all risk — that is impossible. It is about making informed decisions about which risks to accept, mitigate, transfer, or avoid.

**NIST Risk Management Framework (RMF)** follows six steps: Categorize, Select, Implement, Assess, Authorize, Monitor. Think of it as a continuous cycle — you never stop managing risk. NIST SP 800-37 details this process.

**ISO 27001/27005** provides an international standard for information security management systems (ISMS). ISO 27005 specifically addresses risk management. Organizations seeking certification use this framework.

**Risk Assessment Process**: Identify assets → Identify threats → Identify vulnerabilities → Calculate likelihood × impact → Prioritize risks → Select controls. This systematic approach ensures nothing falls through the cracks.

**Risk Response Options**: Accept (live with it), Mitigate (reduce it), Transfer (insure it), Avoid (eliminate the activity). The choice depends on cost-benefit analysis and organizational risk appetite.',
'[{"formula": "Risk = Threat × Vulnerability × Impact", "description": "Risk is the product of how likely a threat exploits a vulnerability and how bad the result would be"}, {"formula": "ALE = ARO × SLE", "description": "Annualized Loss Expectancy = Annual Rate of Occurrence × Single Loss Expectancy"}, {"formula": "SLE = AV × EF", "description": "Single Loss Expectancy = Asset Value × Exposure Factor"}]',
'{"headers": ["Framework", "Origin", "Focus"], "rows": [["NIST RMF", "US Government", "Federal systems, 6-step cycle"], ["ISO 27001", "International", "ISMS certification"], ["COBIT", "ISACA", "IT governance alignment"], ["OCTAVE", "Carnegie Mellon", "Self-directed risk assessment"]]}',
'Quantitative risk analysis uses NUMBERS (ALE, SLE, ARO). Qualitative uses CATEGORIES (High/Medium/Low). The exam loves the ALE formula. If they give you asset value and exposure factor, calculate SLE first, then multiply by ARO.',
'Senior management is ultimately responsible for risk decisions, not the security team. You present options and recommendations; they decide the acceptable risk level. Document everything.',
'Remember ALE with: "A Little Equation" — ALE = ARO × SLE. For risk responses, think "AMTA" — Accept, Mitigate, Transfer, Avoid (A Manager Takes Action).',
'🗽 New York - The Breach Discovery'),

(1, '1.3', 'Security Governance and Policies', 'The framework of policies, standards, procedures, and guidelines that direct security efforts.',
'## The Policy Hierarchy

Security governance starts at the top. Without management support, security programs fail. The policy hierarchy creates a chain from high-level intent to daily actions.

**Policies** are high-level statements of management intent. They are mandatory, approved by senior management, and change infrequently. Example: "All data must be classified according to its sensitivity."

**Standards** specify mandatory requirements for implementing policies. They are more specific and technical. Example: "All passwords must be at least 12 characters with complexity requirements."

**Procedures** are step-by-step instructions for performing tasks. They are the most detailed and change most frequently. Example: "To reset a password: 1. Navigate to portal. 2. Click forgot password. 3. Verify identity..."

**Guidelines** are recommendations and best practices. They are optional — the only non-mandatory item in the hierarchy. Example: "Consider using a password manager to generate unique passwords."

**Baselines** establish the minimum acceptable security configuration. Think of them as the starting line — you must be at least here.',
NULL,
'{"headers": ["Document", "Mandatory?", "Detail Level", "Audience"], "rows": [["Policy", "Yes", "High-level", "Everyone"], ["Standard", "Yes", "Technical specs", "IT staff"], ["Procedure", "Yes", "Step-by-step", "Operators"], ["Guideline", "No", "Advisory", "Everyone"], ["Baseline", "Yes", "Minimum config", "System admins"]]}',
'Guidelines are the ONLY non-mandatory item. This is a favorite CISSP trick question. Also remember: policies are approved by SENIOR MANAGEMENT, not the security team.',
'As a manager, you champion the policy program. Ensure policies are reviewed annually, communicated to all employees, and enforced consistently. Inconsistent enforcement creates legal liability.',
'Remember the hierarchy: "Please Stop Pouring Gravy on my Baseline" — Policy, Standard, Procedure, Guideline, Baseline. Only the G (Guideline) is optional!',
'🗽 New York - The Breach Discovery'),

(1, '1.4', 'Business Continuity Planning', 'Ensuring critical business functions continue during and after a disaster.',
'## Keeping the Business Running

Business Continuity Planning (BCP) is about ensuring the organization survives disruptions. Disaster Recovery Planning (DRP) is a subset focused on restoring IT systems after a disaster.

**BCP Process**: Project initiation → Business Impact Analysis (BIA) → Recovery strategy development → Plan development → Testing and maintenance. The BIA is the most critical step — it identifies which processes are essential and how long you can survive without them.

**Key Metrics**: RTO (Recovery Time Objective) is the maximum acceptable downtime. RPO (Recovery Point Objective) is the maximum acceptable data loss measured in time. If RPO is 4 hours, you need backups at least every 4 hours.

**Testing Types**: Checklist review (least disruptive), tabletop exercise (walkthrough discussion), simulation test, parallel test (systems run simultaneously), full interruption test (most disruptive and most realistic).

**Hot/Warm/Cold Sites**: A hot site is fully equipped and can take over immediately (most expensive). A warm site has hardware but needs data. A cold site is just empty space with power and connectivity (cheapest, slowest recovery).',
'[{"formula": "RTO = Maximum acceptable downtime", "description": "How long before we MUST be back up"}, {"formula": "RPO = Maximum acceptable data loss", "description": "How much data we can afford to lose (in time)"}]',
'{"headers": ["Site Type", "Cost", "Recovery Time", "Equipment"], "rows": [["Hot Site", "Highest", "Minutes to hours", "Fully equipped + current data"], ["Warm Site", "Medium", "Hours to days", "Hardware, needs data"], ["Cold Site", "Lowest", "Days to weeks", "Empty space only"]]}',
'The BIA is the FIRST major step in BCP (after project initiation). RTO and RPO are the two most tested metrics. Remember: RTO is about TIME, RPO is about DATA. Senior management must approve BCP — it is their responsibility.',
'BCP is a BUSINESS decision, not just an IT decision. As a manager, ensure the BIA accurately reflects business priorities. The CEO cares about keeping revenue-generating processes running, not about which server to restore first.',
'Remember RTO vs RPO: "RTO = Return To Operations (time), RPO = Restore Point for Our data (data loss)". For sites: "Hot = Hurry up and go, Warm = Wait a bit, Cold = Could take weeks."',
'🗽 New York - The Breach Discovery'),

(1, '1.5', 'Legal and Compliance', 'Understanding the legal landscape including regulations, privacy laws, and compliance requirements.',
'## Navigating the Legal Landscape

Security professionals must understand the legal framework that governs their work. Ignorance of the law is not a defense.

**Major Regulations**: GDPR (EU data protection — applies globally if you process EU data), HIPAA (US healthcare), PCI-DSS (payment cards), SOX (US financial reporting), GLBA (US financial privacy), FERPA (US education records).

**Privacy Principles**: Notice/awareness, choice/consent, access/participation, integrity/accuracy, enforcement/redress. These form the basis of most privacy laws worldwide. GDPR adds the right to be forgotten and data portability.

**Types of Law**: Criminal law (government prosecution, imprisonment), Civil law (private disputes, monetary damages), Administrative/regulatory law (government agencies, fines), Common law (based on judicial precedent), Statutory law (written legislation).

**Intellectual Property**: Patents (20 years, inventions), Copyrights (life + 70 years, creative works), Trademarks (renewable, brand identity), Trade secrets (unlimited duration, must be kept secret). The CISSP exam loves testing these durations.

**Due Diligence vs Due Care**: Due diligence is researching and understanding risks (the planning). Due care is taking reasonable steps to address them (the action). Both are required to avoid negligence.',
NULL,
'{"headers": ["IP Type", "Duration", "Protects", "Registration"], "rows": [["Patent", "20 years", "Inventions", "Required"], ["Copyright", "Life + 70 years", "Creative works", "Automatic"], ["Trademark", "Renewable indefinitely", "Brand identity", "Recommended"], ["Trade Secret", "As long as kept secret", "Business secrets", "Not applicable"]]}',
'Know the difference between due diligence (research) and due care (action). Know IP durations cold. GDPR applies if you process ANY EU resident data, regardless of where your company is located.',
'As a manager, you must ensure compliance is not just a checkbox exercise. Align security controls with legal requirements. Work with legal counsel. Document your due diligence and due care efforts to demonstrate good faith.',
'IP durations: "Patents are 20 (P=20), Copyrights go to the Coffin + 70 (life+70), Trademarks are Timeless (renewable), Secrets are as long as they Stay Secret." Due diligence = Do your homework. Due care = Do the right thing.',
'🗽 New York - The Breach Discovery'),

-- DOMAIN 2: Asset Security (5 topics)
(2, '2.1', 'Data Classification', 'Categorizing data based on sensitivity to apply appropriate protection levels.',
'## Organizing Data by Sensitivity

Data classification is the process of categorizing data based on its sensitivity level. Without classification, organizations cannot know what to protect or how much to spend protecting it.

**Government Classification**: Top Secret (exceptionally grave damage to national security), Secret (serious damage), Confidential (damage), Unclassified (no damage). These levels are strictly defined by executive orders.

**Commercial Classification**: Confidential/Proprietary (most sensitive — trade secrets, financials), Private (personal information — HR records, medical), Sensitive (internal use — organizational data not for public), Public (freely shareable).

**Classification Process**: The data OWNER (usually a senior manager or executive) assigns the classification level. The data CUSTODIAN (usually IT) implements the technical controls. The data USER must follow the rules. Never confuse owner with custodian — the owner makes decisions, the custodian implements them.

**Handling Procedures**: Each classification level needs defined procedures for storage, transmission, marking/labeling, and destruction. Classified data on a whiteboard should be erased. Classified printouts should be shredded. Classified digital data should be cryptographically erased or degaussed.',
NULL,
'{"headers": ["Government", "Commercial", "Damage if Disclosed"], "rows": [["Top Secret", "Confidential/Proprietary", "Exceptionally grave / Catastrophic"], ["Secret", "Private", "Serious / Significant"], ["Confidential", "Sensitive", "Some damage / Minor"], ["Unclassified", "Public", "No damage"]]}',
'The DATA OWNER assigns classification — this is the most commonly tested concept. The owner is a BUSINESS person (executive), NOT IT. If data from different levels is combined, classify the aggregate at the HIGHEST level.',
'As a manager, YOU are likely a data owner. You decide what classification level your department''s data receives. Take this seriously — under-classifying data leads to breaches, over-classifying wastes resources.',
'Remember the roles: "OCU" — Owner (decides), Custodian (implements), User (follows). For government levels think "TSCU = Top Secret, Secret, Confidential, Unclassified" — starts highest, goes down.',
'🏭 New Jersey - The Data Vault'),

(2, '2.2', 'Data Lifecycle and States', 'Understanding how data flows from creation to destruction and its three states.',
'## Data from Cradle to Grave

Data does not exist in a vacuum — it has a lifecycle from creation to destruction, and at any moment it exists in one of three states. Security controls must address each state.

**Data States**: Data at rest (stored on disk, database, tape), Data in transit (moving across networks), Data in use (being processed in memory). Each state requires different controls. Encryption at rest protects stored data. TLS/IPsec protects data in transit. Memory protection and DLP protect data in use.

**Data Lifecycle**: Create → Store → Use → Share → Archive → Destroy. At each stage, classification determines the appropriate controls. The destruction phase is critical — data must be destroyed in a manner appropriate to its classification.

**Data Destruction Methods**: Overwriting (software-based, least secure), Degaussing (magnetic field disruption — only for magnetic media), Physical destruction (shredding, incineration — most secure). For SSDs, cryptographic erasure is preferred since degaussing does not work on flash memory.

**Data Remanence**: The residual data left after deletion. Simply deleting a file or formatting a drive does NOT remove the data. Proper sanitization requires overwriting, degaussing, or physical destruction depending on media type and data sensitivity.',
NULL,
'{"headers": ["State", "Example", "Key Control"], "rows": [["At Rest", "File on hard drive", "AES encryption, full disk encryption"], ["In Transit", "Email, API call", "TLS, VPN, IPsec"], ["In Use", "Data in RAM", "Memory protection, process isolation"]]}',
'Degaussing does NOT work on SSDs or optical media — only magnetic media. This is a favorite trick question. Also remember that data remanence means simple deletion is insufficient for sensitive data.',
'When deciding destruction methods, consider the cost of the data vs the cost of destruction. Shredding a $100 hard drive to protect $10 million in trade secrets is a no-brainer.',
'Three data states: "RUT" — Rest, Use, Transit. Like being stuck in a rut, data is always in one of these three states! For destruction: "DOPE" — Degaussing (magnetic Only), Physical destruction, Erasure (crypto for SSDs).',
'🏭 New Jersey - The Data Vault'),

(2, '2.3', 'Data Protection Controls', 'Technical and administrative controls for protecting data throughout its lifecycle.',
'## Protecting Data at Every Stage

Protecting data requires a layered approach combining technical, administrative, and physical controls matched to the data''s classification level.

**Data Loss Prevention (DLP)**: Systems that detect and prevent unauthorized data transfers. Network DLP monitors traffic. Endpoint DLP watches local actions (USB, print, email). Discovery DLP scans storage for misplaced sensitive data. DLP uses content inspection, context analysis, and pattern matching.

**Encryption**: The cornerstone of data protection. Symmetric encryption (AES) for bulk data — one key for encrypt and decrypt. Asymmetric encryption (RSA, ECC) for key exchange and digital signatures — public and private key pair. Use AES-256 for data at rest, TLS 1.3 for data in transit.

**Tokenization**: Replaces sensitive data with non-sensitive placeholders (tokens). Unlike encryption, tokenization cannot be reversed mathematically — the mapping is stored in a separate token vault. Commonly used for credit card numbers (PCI-DSS compliance).

**Masking**: Obscures parts of data (showing only last 4 digits of SSN: ***-**-1234). Used for display purposes when full data is not needed. Static masking permanently alters data copies; dynamic masking alters data on-the-fly during queries.',
NULL,
'{"headers": ["Control", "How It Works", "Best For"], "rows": [["Encryption", "Mathematical transformation", "Data at rest and in transit"], ["Tokenization", "Replace with placeholder", "Payment card data"], ["Masking", "Obscure portions", "Display/testing"], ["DLP", "Monitor and block transfers", "Preventing data exfiltration"]]}',
'Know the difference between encryption (reversible with key), tokenization (lookup table), and masking (irreversible display). DLP operates at network, endpoint, and discovery levels. Tokenization is NOT encryption.',
'Choose protection controls based on business requirements and cost. Over-protecting public data wastes money. Under-protecting confidential data invites breaches. Match controls to classification levels.',
'Encryption vs Tokenization: "Encryption has a key to unlock. Tokenization has a table to look up. Masking just hides — no going back." DLP types: "Need Direction? Pick NED" — Network, Endpoint, Discovery.',
'🏭 New Jersey - The Data Vault'),

(2, '2.4', 'Privacy and Data Handling', 'Principles and practices for protecting personally identifiable information (PII).',
'## Respecting Privacy

Privacy is about giving individuals control over their personal information. In an era of massive data collection, privacy protection is both an ethical obligation and a legal requirement.

**PII (Personally Identifiable Information)**: Any data that can identify an individual — name, SSN, email, IP address, biometrics. The definition varies by jurisdiction, but the CISSP exam uses a broad definition. If data can be combined to identify someone, it is PII.

**Privacy by Design**: Build privacy into systems from the start, not as an afterthought. Seven principles: proactive not reactive, privacy as default, privacy embedded in design, full functionality (no trade-offs), end-to-end lifecycle protection, visibility/transparency, respect for user privacy.

**Data Minimization**: Collect only the data you need, retain it only as long as necessary, and destroy it when no longer needed. This reduces risk — you cannot breach data you do not have.

**Cross-Border Data Transfers**: GDPR restricts transferring EU personal data to countries without adequate protection. Mechanisms include Standard Contractual Clauses (SCCs), Binding Corporate Rules (BCRs), and adequacy decisions. The US-EU Data Privacy Framework replaced Privacy Shield.',
NULL, NULL,
'Questions about privacy roles: Data Controller decides WHY and HOW data is processed. Data Processor processes data on behalf of the controller. Under GDPR, the controller has primary responsibility.',
'Privacy is a board-level concern. Data breaches involving PII trigger mandatory notification requirements under GDPR (72 hours), state laws, and industry regulations. Budget for privacy compliance proactively.',
'Privacy principles: "People Can Always Inspect Everything" — Purpose limitation, Consent, Access, Integrity, Enforcement. Data roles: "Controller Controls, Processor Processes" — simple but tested often!',
'🏭 New Jersey - The Data Vault'),

(2, '2.5', 'Asset Management and Retention', 'Tracking, managing, and properly disposing of organizational assets.',
'## Managing Assets Cradle to Grave

Asset management ensures every piece of hardware, software, and data is tracked, protected, and properly disposed of throughout its lifecycle.

**Asset Inventory**: You cannot protect what you do not know about. Maintain a comprehensive inventory of all hardware, software, and data assets. Include ownership, classification, location, and value. Automated discovery tools help keep inventories current.

**Media Management**: Removable media (USB drives, tapes, CDs) require special handling. Label media according to the highest classification of data stored. Track movement with sign-out logs. Sanitize before reuse or disposal.

**Retention Policies**: Define how long to keep different types of data. Legal requirements, business needs, and compliance mandates all factor in. Keep email for 7 years (common legal requirement). Keep financial records per SOX requirements. Do not keep data longer than necessary — excess data is excess risk.

**Secure Disposal**: When assets reach end of life, dispose of them securely. Hard drives: degauss (magnetic) or shred. SSDs: cryptographic erasure or physical destruction. Paper: cross-cut shredding. Maintain destruction certificates as proof of proper disposal.',
NULL, NULL,
'Asset management starts with INVENTORY. You cannot protect what you do not know about. Retention periods are driven by legal and regulatory requirements — the LONGEST applicable requirement wins.',
'Asset management is a governance function. Establish clear ownership, classification, and handling procedures. Budget for proper disposal — cutting corners on destruction leads to data breaches.',
'Asset lifecycle: "I Can Use Some Destroying" — Inventory, Classify, Use, Store, Destroy. For retention: "Keep it as long as the LAW says, not as long as you WANT."',
'🏭 New Jersey - The Data Vault'),

-- DOMAIN 3: Security Architecture and Engineering (5 topics)
(3, '3.1', 'Security Models', 'Formal models that define how security policies are enforced in systems.',
'## The Theory Behind Access Control

Security models are mathematical frameworks that define rules for how subjects (users, processes) access objects (files, data). They translate security policy into enforceable rules.

**Bell-LaPadula (BLP)**: Focuses on CONFIDENTIALITY. Two rules: Simple Security Property (no read up — a subject cannot read data at a higher classification), Star Property (no write down — a subject cannot write data to a lower classification). Think of it as "read down, write up" to prevent information leakage downward.

**Biba Integrity Model**: Focuses on INTEGRITY. The mirror image of Bell-LaPadula. Simple Integrity Axiom (no read down — do not read less trustworthy data), Star Integrity Axiom (no write up — do not contaminate higher-integrity data). Prevents corruption of trusted data by untrusted sources.

**Clark-Wilson**: Focuses on INTEGRITY through well-formed transactions. Uses Constrained Data Items (CDIs), Unconstrained Data Items (UDIs), Integrity Verification Procedures (IVPs), and Transformation Procedures (TPs). All modifications must go through approved transformation procedures — no direct data manipulation.

**Brewer-Nash (Chinese Wall)**: Prevents conflicts of interest. Once a user accesses data from one company, they cannot access data from a competing company. Used in consulting and financial services.',
NULL,
'{"headers": ["Model", "Focus", "Key Rule"], "rows": [["Bell-LaPadula", "Confidentiality", "No read up, no write down"], ["Biba", "Integrity", "No read down, no write up"], ["Clark-Wilson", "Integrity", "Well-formed transactions only"], ["Brewer-Nash", "Conflict of Interest", "Access one competitor, lose access to others"]]}',
'Bell-LaPadula = Confidentiality (Bells ring Loudly = Leaking secrets). Biba = Integrity (Biba sounds like "be pure"). They are OPPOSITES in their read/write rules. This is the most tested security model concept.',
'Choose security models based on what you are protecting. Military/government = Bell-LaPadula (secrets). Financial/healthcare = Biba or Clark-Wilson (data accuracy). Consulting = Brewer-Nash (conflicts).',
'Bell-LaPadula: "BLP = Blocks Leaking of Protected info" — no read UP, no write DOWN (keeps secrets from leaking down). Biba: "BIBA = Block Integrity Breaches Always" — no read DOWN, no write UP (keeps corruption from moving up).',
'🏔️ Zurich - The Architecture Flaw'),

(3, '3.2', 'Cryptography Fundamentals', 'The science of securing communications through mathematical algorithms.',
'## The Language of Secrets

Cryptography transforms readable data (plaintext) into unreadable data (ciphertext) and back. It is the most powerful tool in the security professional''s arsenal.

**Symmetric Encryption**: One key for both encryption and decryption. Fast and efficient for bulk data. Algorithms: AES (current standard, 128/192/256-bit), 3DES (legacy), Blowfish, Twofish. Challenge: key distribution — how do you securely share the key?

**Asymmetric Encryption**: Two keys — public (shared) and private (secret). Slower but solves key distribution. Algorithms: RSA, ECC, Diffie-Hellman (key exchange only). Encrypt with public key, decrypt with private key. Sign with private key, verify with public key.

**Hashing**: One-way function producing a fixed-size digest. Used for integrity verification and password storage. Algorithms: SHA-256 (current standard), SHA-3, MD5 (broken — do not use), SHA-1 (deprecated). A good hash changes completely with even a 1-bit input change (avalanche effect).

**Digital Signatures**: Hash the message, then encrypt the hash with your PRIVATE key. Provides authentication (proves who sent it), integrity (hash verifies content unchanged), and non-repudiation (sender cannot deny sending it). Does NOT provide confidentiality.',
'[{"formula": "Digital Signature = Encrypt(Hash(Message), Private Key)", "description": "Sign with private, verify with public"}, {"formula": "Symmetric key count = n(n-1)/2", "description": "Number of keys needed for n users communicating pairwise"}]',
'{"headers": ["Type", "Speed", "Key Count", "Use Case"], "rows": [["Symmetric", "Fast", "1 shared key", "Bulk data encryption"], ["Asymmetric", "Slow", "2 keys (pair)", "Key exchange, signatures"], ["Hashing", "Fast", "No key", "Integrity, passwords"]]}',
'Digital signatures provide authentication, integrity, and non-repudiation but NOT confidentiality. Know that symmetric is fast (for data) and asymmetric is slow (for keys). The exam tests the n(n-1)/2 formula for symmetric key counts.',
'Invest in proper key management. The algorithm is only as strong as the key management. Rotate keys regularly, protect key storage, and plan for crypto agility (ability to change algorithms when needed).',
'Symmetric: "S = Single key, Speedy." Asymmetric: "A = A pair of keys." Hashing: "H = Hash is one-way, no going Home." Digital signature order: "Hash it, then Hide it with your Private key."',
'🏔️ Zurich - The Architecture Flaw'),

(3, '3.3', 'Secure Design Principles', 'Core principles for building secure systems from the ground up.',
'## Building Security In

Secure design principles guide architects in building systems that resist attacks. These principles should be applied from the earliest design phase, not bolted on after the fact.

**Defense in Depth**: Layer multiple security controls so that if one fails, others still protect the asset. Like a castle with a moat, walls, guards, and a locked treasury — an attacker must bypass ALL layers.

**Least Privilege**: Give users and processes only the minimum permissions needed to do their job. A payroll clerk does not need access to engineering source code. Reduce attack surface by limiting access.

**Separation of Duties (SoD)**: No single person should control all aspects of a critical process. The person who writes checks should not be the person who approves them. Prevents fraud and errors.

**Fail Secure vs Fail Open**: When a system fails, should it deny all access (fail secure/closed) or allow all access (fail open)? A firewall should fail secure (block traffic). An emergency exit door should fail open (allow escape). Choose based on safety vs security priorities.

**Zero Trust**: Never trust, always verify. Assume the network is compromised. Verify every request regardless of source. Micro-segmentation, continuous authentication, and least privilege are key zero trust components.',
NULL, NULL,
'Defense in Depth is the most commonly referenced principle. Least Privilege and Separation of Duties often appear together. Know the difference between fail-secure and fail-open — the exam gives fire safety scenarios.',
'Apply defense in depth to your security budget. No single control is perfect. Layer preventive, detective, and corrective controls. If the firewall fails, IDS should detect. If IDS misses, logs should reveal.',
'Design principles: "Don''t Let Silly Failures Zero-out security" — Defense in depth, Least privilege, Separation of duties, Fail secure, Zero trust.',
'🏔️ Zurich - The Architecture Flaw'),

(3, '3.4', 'PKI and Certificate Management', 'The infrastructure that manages digital certificates and public keys.',
'## Trust on the Internet

Public Key Infrastructure (PKI) is the system of hardware, software, policies, and procedures that creates, manages, distributes, and revokes digital certificates. It is how we establish trust online.

**Certificate Authority (CA)**: The trusted third party that issues digital certificates. The CA verifies the identity of the certificate requestor before issuing a cert. Root CAs are at the top of the trust chain; subordinate CAs handle day-to-day issuance.

**Digital Certificates (X.509)**: Bind a public key to an identity. Contains: subject name, public key, issuer (CA), validity dates, serial number, and the CA''s digital signature. When your browser shows a padlock, it has verified the site''s certificate against trusted CAs.

**Certificate Lifecycle**: Request → Verification → Issuance → Use → Renewal → Revocation. Certificates have expiration dates and can be revoked early if compromised. CRL (Certificate Revocation List) and OCSP (Online Certificate Status Protocol) check revocation status.

**Key Escrow**: Storing a copy of encryption keys with a trusted third party. Enables recovery if keys are lost but creates a single point of compromise. Some governments mandate key escrow for law enforcement access.',
NULL,
'{"headers": ["Component", "Function"], "rows": [["CA", "Issues and signs certificates"], ["RA", "Verifies identity before CA issues cert"], ["CRL", "List of revoked certificates"], ["OCSP", "Real-time certificate status check"]]}',
'OCSP is more efficient than CRL (real-time check vs downloading a list). The RA verifies identity but does NOT issue certificates — only the CA issues. Certificate pinning prevents MITM attacks using fraudulent certificates.',
'PKI requires governance. Establish certificate policies, manage CA hierarchy, plan for certificate rotation, and have revocation procedures ready. A compromised CA is catastrophic.',
'PKI roles: "CA Creates, RA Reviews, CRL is the Crime List, OCSP is Online Status Checking Protocol." Remember: RA does NOT issue certs — only the CA does!',
'🏔️ Zurich - The Architecture Flaw'),

(3, '3.5', 'Physical Security', 'Protecting facilities, equipment, and personnel from physical threats.',
'## The First Line of Defense

Physical security protects the tangible assets of an organization. The most sophisticated firewall is useless if an attacker can walk into the server room.

**Layered Physical Security**: Deterrent (fences, signs, lighting), Preventive (locks, mantraps, bollards), Detective (CCTV, motion sensors, guards), Corrective (fire suppression, backup power). Apply defense in depth physically just as you do logically.

**Access Control Systems**: Card readers, biometric scanners, PINs, and combination locks control physical access. Mantraps (airlocks/sally ports) prevent tailgating — only one door opens at a time. Turnstiles count entries for occupancy management.

**Environmental Controls**: HVAC maintains temperature and humidity for equipment. Positive air pressure prevents contaminants from entering clean rooms. Water detection sensors protect against flooding. Fire suppression: wet pipe (always charged), dry pipe (air-filled until triggered), pre-action (two triggers required), clean agent (FM-200/Novec for electronics).

**Site Selection**: Consider natural disasters, crime rates, proximity to emergency services, and distance from hazards (airports, chemical plants). Avoid single points of failure in utilities. CPTED (Crime Prevention Through Environmental Design) uses architecture and landscaping to reduce crime.',
NULL,
'{"headers": ["Fire Suppression", "Description", "Use Case"], "rows": [["Wet Pipe", "Always water-filled", "General areas, fastest response"], ["Dry Pipe", "Air-filled until alarm", "Cold environments (prevents freezing)"], ["Pre-Action", "Requires two triggers", "Server rooms, museums"], ["Clean Agent", "Gas-based (FM-200)", "Data centers (no water damage)"]]}',
'For data centers: clean agent or pre-action sprinklers. Wet pipe is the most common and fastest. Mantraps prevent tailgating (piggybacking). CPTED is about using DESIGN to prevent crime, not adding guards.',
'Physical security is foundational. Budget for it properly. A well-designed physical security program reduces the load on logical controls. Remember: if they can touch it, they can own it.',
'Fire suppression: "Wet is the Default (fast), Dry is for the cold, Pre-action needs two checks (precious stuff), Clean agent for electronics." Mantrap = "Man Caught in Trap" — prevents tailgating.',
'🏔️ Zurich - The Architecture Flaw'),

-- DOMAIN 4: Communication and Network Security (5 topics)
(4, '4.1', 'OSI and TCP/IP Models', 'The foundational reference models for network communication.',
'## How Networks Communicate

Understanding network models is essential for security professionals. The OSI model provides a theoretical framework; TCP/IP is the practical implementation that runs the internet.

**OSI Model (7 Layers)**: Physical (bits, cables), Data Link (frames, MAC addresses, switches), Network (packets, IP addresses, routers), Transport (segments, TCP/UDP, ports), Session (dialogue management), Presentation (encryption, compression, formatting), Application (HTTP, FTP, SMTP — user-facing protocols).

**TCP/IP Model (4 Layers)**: Network Access (combines OSI Physical + Data Link), Internet (OSI Network), Transport (OSI Transport), Application (combines OSI Session + Presentation + Application). This is the model actually used on the internet.

**Key Protocols by Layer**: Layer 2: ARP (IP to MAC resolution), Ethernet. Layer 3: IP, ICMP, IGMP. Layer 4: TCP (reliable, connection-oriented), UDP (fast, connectionless). Layer 7: HTTP/S, DNS, SMTP, FTP, SSH.

**Security at Each Layer**: Physical: cable locks, signal shielding. Data Link: 802.1X port security, VLANs. Network: IPsec, ACLs, firewalls. Transport: TLS/SSL. Application: WAFs, input validation, authentication.',
NULL,
'{"headers": ["OSI Layer", "PDU", "Devices", "Key Protocol"], "rows": [["7 - Application", "Data", "Firewall, Proxy", "HTTP, DNS, SMTP"], ["4 - Transport", "Segment", "Load Balancer", "TCP, UDP"], ["3 - Network", "Packet", "Router", "IP, ICMP, IPsec"], ["2 - Data Link", "Frame", "Switch", "Ethernet, ARP"], ["1 - Physical", "Bits", "Hub, Cable", "Electrical signals"]]}',
'The exam loves asking which OSI layer a protocol or device operates at. Switches = Layer 2, Routers = Layer 3, Firewalls = Layer 3-7. Encryption at the Presentation layer, TCP/UDP at Transport.',
'Network segmentation is your friend. VLANs at Layer 2, subnets at Layer 3, and micro-segmentation for zero trust. Each layer boundary is an opportunity for a security control.',
'OSI layers: "Please Do Not Throw Sausage Pizza Away" — Physical, Data Link, Network, Transport, Session, Presentation, Application. Layer numbers: Physical=1, Application=7.',
'🌏 Singapore - The Cable Station'),

(4, '4.2', 'Network Attacks and Countermeasures', 'Common network-based attacks and how to defend against them.',
'## Understanding the Threat Landscape

Network attacks exploit vulnerabilities in protocols, configurations, and human behavior. Understanding attack methods is the first step toward effective defense.

**Man-in-the-Middle (MITM)**: Attacker intercepts communication between two parties. ARP spoofing at Layer 2, DNS spoofing at Layer 7. Countermeasures: encryption (TLS), certificate pinning, DNSSEC, ARP inspection.

**Denial of Service (DoS/DDoS)**: Overwhelming a system so legitimate users cannot access it. SYN flood (half-open TCP connections), amplification attacks (DNS, NTP reflection), application-layer attacks (HTTP floods). Countermeasures: rate limiting, SYN cookies, CDN, DDoS scrubbing services.

**Sniffing/Eavesdropping**: Capturing network traffic to read sensitive data. Promiscuous mode on a NIC captures all traffic on the segment. Countermeasures: encryption, switched networks (limit broadcast domain), network segmentation.

**DNS Attacks**: DNS poisoning (corrupting DNS cache), DNS tunneling (hiding data in DNS queries for exfiltration), domain hijacking. Countermeasures: DNSSEC (authenticates DNS responses), DNS filtering, monitoring unusual DNS patterns.

**Session Hijacking**: Stealing or predicting session tokens to impersonate a user. TCP session hijacking, cookie theft, session fixation. Countermeasures: random session IDs, HTTPS, session timeout, IP binding.',
NULL, NULL,
'Know the OSI layer where each attack operates. MITM can happen at multiple layers. DoS attacks Availability. Sniffing attacks Confidentiality. DNSSEC signs DNS records but does not encrypt them.',
'Prioritize attacks by business impact. DDoS against your e-commerce site = revenue loss. Sniffing on an unencrypted network = data breach. Risk-based prioritization helps allocate limited defense budgets.',
'Attack categories: "MSDS = MITM, Sniffing, DoS, Session hijacking" — think Material Safety Data Sheet for your network! For DoS: "SYN flood = S for SYN, S for Swamping connections."',
'🌏 Singapore - The Cable Station'),

(4, '4.3', 'Firewalls and Network Devices', 'Security appliances that control and monitor network traffic.',
'## Gatekeepers of the Network

Firewalls are the primary perimeter defense, but modern networks need multiple types of security devices working in concert.

**Firewall Types**: Packet filter (Layer 3-4, fast, examines headers only), Stateful inspection (tracks connection state, more intelligent), Application proxy (Layer 7, full inspection, slowest), Next-generation (NGFW — combines stateful, DPI, IPS, application awareness).

**Firewall Architectures**: Screened host (single firewall protecting one bastion host), Screened subnet/DMZ (two firewalls creating a buffer zone for public services), Dual-homed host (two NICs, routes between networks).

**IDS vs IPS**: Intrusion Detection System monitors and ALERTS (passive — detective control). Intrusion Prevention System monitors and BLOCKS (active — preventive control). Both use signature-based (known attacks) and anomaly-based (behavior deviation) detection.

**Other Network Security Devices**: WAF (Web Application Firewall — protects web apps), SIEM (collects and correlates logs), NAC (Network Access Control — enforces policy before network access), Proxy server (intermediary that can cache and filter).

**Network Segmentation**: VLANs separate broadcast domains at Layer 2. Subnets separate at Layer 3. Micro-segmentation in SDN creates per-workload isolation. Proper segmentation contains breaches and limits lateral movement.',
NULL,
'{"headers": ["Firewall Type", "OSI Layer", "Speed", "Intelligence"], "rows": [["Packet Filter", "3-4", "Fastest", "Headers only"], ["Stateful", "3-4", "Fast", "Connection tracking"], ["Application Proxy", "7", "Slowest", "Full content inspection"], ["NGFW", "3-7", "Medium", "App-aware + IPS"]]}',
'IDS = Detective (alerts), IPS = Preventive (blocks). A WAF operates at Layer 7 for web apps. Stateful firewalls are the minimum baseline — packet filters alone are insufficient for modern networks.',
'Defense in depth applies to network architecture. Do not rely on a single firewall. Combine perimeter firewalls, internal segmentation, IDS/IPS, and WAF. Monitor everything with SIEM.',
'IDS vs IPS: "IDS = I Detect Stuff (passive), IPS = I Prevent Stuff (active)." Firewall layers: "Packet filters are Primitive, Stateful is Smarter, Proxy is Particular, NGFW is the New Guard."',
'🌏 Singapore - The Cable Station'),

(4, '4.4', 'VPNs and Secure Communication', 'Technologies for creating secure communication channels over untrusted networks.',
'## Tunneling Through Danger

VPNs (Virtual Private Networks) create encrypted tunnels over public networks, allowing secure communication between sites or remote users and corporate networks.

**IPsec**: Operates at the Network layer (Layer 3). Two modes: Transport mode (encrypts payload only — host-to-host) and Tunnel mode (encrypts entire original packet — site-to-site). Two protocols: AH (Authentication Header — integrity and authentication, no encryption) and ESP (Encapsulating Security Payload — encryption + integrity + authentication). IKE (Internet Key Exchange) negotiates the security association.

**TLS/SSL VPN**: Operates at the Transport/Session layer. Easier to deploy than IPsec (runs through web browsers). Portal VPN provides access through a web page. Tunnel VPN provides full network-layer access. TLS 1.3 is the current standard — TLS 1.0/1.1 and all SSL versions are deprecated.

**Site-to-Site vs Remote Access**: Site-to-site VPNs connect two networks (offices). Remote access VPNs connect individual users to the corporate network. Split tunneling sends only corporate traffic through the VPN (bandwidth efficient but less secure). Full tunneling routes ALL traffic through VPN (more secure, more bandwidth).

**SD-WAN**: Software-Defined Wide Area Network replaces traditional MPLS with intelligent routing over internet links. Provides encryption, load balancing, and centralized management. Increasingly replacing traditional site-to-site VPNs.',
NULL,
'{"headers": ["VPN Type", "OSI Layer", "Use Case", "Complexity"], "rows": [["IPsec Tunnel", "3", "Site-to-site", "High"], ["IPsec Transport", "3", "Host-to-host", "High"], ["TLS/SSL VPN", "4-5", "Remote access", "Low"], ["L2TP/IPsec", "2-3", "Remote access", "Medium"]]}',
'IPsec modes: Transport = endpoints only, Tunnel = gateway-to-gateway. AH provides NO encryption (just integrity). ESP provides encryption AND integrity. Full tunneling is more secure than split tunneling.',
'Choose VPN technology based on your use case. Remote workers = TLS VPN (easy deployment). Office connections = IPsec site-to-site. Zero trust environments = per-application tunnels instead of full network VPN.',
'IPsec protocols: "AH = Authentication Helper (no encryption!), ESP = Encrypts Securely the Payload." IPsec modes: "Transport is for Two endpoints, Tunnel is for Two networks (gateways)."',
'🌏 Singapore - The Cable Station'),

(4, '4.5', 'Wireless Security', 'Securing wireless networks and understanding wireless threats.',
'## Invisible Signals, Visible Risks

Wireless networks broadcast data through the air, making them inherently more vulnerable than wired networks. Anyone within range can potentially intercept traffic.

**Wireless Standards (802.11)**: 802.11a (5GHz, 54Mbps), 802.11b (2.4GHz, 11Mbps), 802.11g (2.4GHz, 54Mbps), 802.11n/Wi-Fi 4 (both bands, 600Mbps), 802.11ac/Wi-Fi 5 (5GHz, 6.9Gbps), 802.11ax/Wi-Fi 6 (both bands, 9.6Gbps).

**Wireless Security Protocols**: WEP (broken — never use), WPA (TKIP — deprecated), WPA2 (AES-CCMP — current minimum), WPA3 (SAE — strongest, uses Simultaneous Authentication of Equals). Enterprise modes use 802.1X authentication with RADIUS; personal modes use pre-shared keys (PSK).

**Wireless Attacks**: Evil twin (fake AP mimicking legitimate one), deauthentication (forcing clients to disconnect and reconnect to evil twin), wardriving (scanning for vulnerable networks), KRACK (Key Reinstallation Attack on WPA2), RF jamming (DoS via signal interference).

**Wireless Security Best Practices**: Use WPA3 or WPA2-Enterprise. Disable SSID broadcast for sensitive networks. Use 802.1X for enterprise authentication. Implement wireless IDS/IPS. Segment wireless networks from core infrastructure. Regularly audit for rogue access points.',
NULL,
'{"headers": ["Protocol", "Encryption", "Status"], "rows": [["WEP", "RC4 (broken)", "Do not use"], ["WPA", "TKIP", "Deprecated"], ["WPA2", "AES-CCMP", "Minimum standard"], ["WPA3", "AES-GCMP + SAE", "Recommended"]]}',
'WEP is ALWAYS wrong on the exam — never select it as a solution. WPA3 uses SAE (Simultaneous Authentication of Equals) which protects against offline dictionary attacks. 802.1X is for Enterprise wireless authentication.',
'Deploy WPA2-Enterprise minimum with RADIUS authentication. Monitor for rogue APs continuously. Segment guest wireless from internal networks. Plan wireless coverage to minimize signal leakage outside the building.',
'Wireless evolution: "WEP = Weak, Everyone Passes. WPA = Works, Partially Adequate. WPA2 = Worthy Protection, Actually. WPA3 = Wonderful Protection, Always." Enterprise = RADIUS; Personal = PSK.',
'🌏 Singapore - The Cable Station'),

-- DOMAIN 5: Identity and Access Management (5 topics)
(5, '5.1', 'Authentication Factors and Methods', 'Verifying identity through something you know, have, or are.',
'## Proving Who You Are

Authentication is the process of verifying a claimed identity. It answers the question: "Are you really who you say you are?" The strength of authentication depends on the factors used.

**Three Authentication Factors**: Something you KNOW (passwords, PINs, security questions), Something you HAVE (smart cards, tokens, phones), Something you ARE (biometrics — fingerprints, retina, voice). Multi-factor authentication (MFA) requires at least TWO DIFFERENT factors. Using a password AND a PIN is NOT MFA — both are something you know.

**Biometric Types**: Fingerprint (most common, inexpensive), Retina scan (most accurate, most invasive — maps blood vessels), Iris scan (very accurate, less invasive — maps colored portion), Facial recognition (convenient, contactless), Voice recognition (can be affected by illness).

**Biometric Accuracy**: FRR (False Rejection Rate — Type I error, rejecting legitimate users), FAR (False Acceptance Rate — Type II error, accepting imposters), CER/EER (Crossover Error Rate — where FRR equals FAR, lower is better). The CER is the standard metric for comparing biometric systems.

**Modern Authentication**: Passwordless (FIDO2/WebAuthn), Risk-based authentication (adjusts requirements based on context), Continuous authentication (ongoing verification during session), OAuth 2.0 and OpenID Connect for federated identity.',
NULL,
'{"headers": ["Factor", "Examples", "Strength", "Weakness"], "rows": [["Something you know", "Password, PIN", "Easy to deploy", "Can be guessed/stolen"], ["Something you have", "Smart card, token", "Hard to duplicate", "Can be lost/stolen"], ["Something you are", "Fingerprint, retina", "Hard to forge", "Privacy concerns, cost"]]}',
'MFA requires TWO DIFFERENT factors — password + PIN is single-factor (both "know"). CER/EER is the BEST metric to compare biometric systems (lower CER = better). Type I = False Rejection (FRR). Type II = False Acceptance (FAR). Type II is more dangerous.',
'Implement MFA for all privileged accounts and remote access at minimum. Consider risk-based authentication for user experience. Biometrics work best as part of MFA, not standalone.',
'Authentication factors: "I KNOW my password, I HAVE my phone, I AM my fingerprint." For biometrics: "Type 1 = Too Tight (rejects good people), Type 2 = Too Open (accepts bad people)." CER = "Crossover = Comparison point."',
'🇬🇧 London - The Identity Crisis'),

(5, '5.2', 'Access Control Models', 'Frameworks that determine how subjects access objects in a system.',
'## Who Gets Access to What?

Access control models define the rules for granting, managing, and revoking access to resources. Choosing the right model depends on organizational needs and regulatory requirements.

**DAC (Discretionary Access Control)**: The owner decides who gets access. Like sharing a Google Doc — you choose who can view or edit. Flexible but risky because users can grant access without oversight. Most common in consumer systems and small businesses.

**MAC (Mandatory Access Control)**: The system enforces access based on labels/clearances. Users CANNOT change access permissions. Used in military and government: a SECRET-cleared user cannot access TOP SECRET data regardless of who asks. Based on the Bell-LaPadula model.

**RBAC (Role-Based Access Control)**: Access based on job roles. A "Payroll Clerk" role gets access to payroll systems. Users are assigned to roles, roles are assigned permissions. Most common in enterprises. Simplifies management — change the role, not individual permissions.

**ABAC (Attribute-Based Access Control)**: Access based on attributes of the user, resource, environment, and action. Most flexible and granular. Example: "Allow access if user is a manager AND resource is internal AND time is business hours AND location is corporate network." Used in complex environments needing fine-grained control.

**Rule-Based Access Control**: Access based on predefined rules (like firewall ACLs). Time-of-day restrictions, IP-based rules. Often combined with other models.',
NULL,
'{"headers": ["Model", "Who Decides", "Flexibility", "Use Case"], "rows": [["DAC", "Resource owner", "High", "Consumer, small business"], ["MAC", "System (labels)", "Low", "Military, government"], ["RBAC", "Administrator (roles)", "Medium", "Enterprise"], ["ABAC", "Policy engine (attributes)", "Very high", "Complex environments"]]}',
'DAC = owner decides (Discretionary), MAC = system decides (Mandatory), RBAC = role decides. The exam loves comparing these. MAC is the most restrictive. DAC is the most flexible but least secure. RBAC is the most common in businesses.',
'RBAC is your best friend in enterprise environments. It aligns access with business functions, simplifies onboarding/offboarding, and supports compliance auditing. Start with RBAC and add ABAC for complex requirements.',
'DAC = "Dad Allows Children" (owner grants access). MAC = "Military Assigns Clearances" (system enforces labels). RBAC = "Roles Bring Access to Capabilities." ABAC = "Attributes Build Access Contextually."',
'🇬🇧 London - The Identity Crisis'),

(5, '5.3', 'Single Sign-On and Federation', 'Enabling seamless authentication across multiple systems and organizations.',
'## One Login to Rule Them All

Single Sign-On (SSO) and federation reduce authentication friction while maintaining security. Users authenticate once and gain access to multiple systems.

**SSO Benefits**: Reduced password fatigue (fewer passwords to remember), improved user experience, centralized authentication (one place to enforce MFA), reduced help desk calls for password resets. Risk: single point of failure — if the SSO system is compromised, all connected systems are exposed.

**Kerberos**: The most common enterprise SSO protocol. Uses a Key Distribution Center (KDC) with an Authentication Service (AS) and Ticket Granting Service (TGS). The user authenticates once, receives a Ticket Granting Ticket (TGT), then uses it to request service tickets. Relies on symmetric encryption and timestamps to prevent replay attacks.

**SAML (Security Assertion Markup Language)**: XML-based standard for exchanging authentication data between Identity Providers (IdPs) and Service Providers (SPs). Common in enterprise SSO. Used when you click "Sign in with your corporate account" on a third-party service.

**OAuth 2.0 and OpenID Connect**: OAuth is for AUTHORIZATION (granting access to resources). OpenID Connect adds AUTHENTICATION on top of OAuth. Used when you click "Sign in with Google." OAuth uses tokens (access tokens, refresh tokens) rather than sharing passwords.

**Federation**: Extending trust across organizational boundaries. Organization A trusts Organization B''s identity provider. SAML and OpenID Connect enable federation. Trust relationships must be carefully managed — a compromised partner IDP compromises your resources.',
NULL,
'{"headers": ["Protocol", "Purpose", "Format", "Common Use"], "rows": [["Kerberos", "SSO (enterprise)", "Tickets", "Active Directory"], ["SAML", "SSO/Federation", "XML", "Enterprise web apps"], ["OAuth 2.0", "Authorization", "Tokens", "API access, third-party apps"], ["OIDC", "Authentication + AuthZ", "JSON/JWT", "Consumer sign-in"]]}',
'Kerberos uses TICKETS and a KDC. SAML uses XML assertions. OAuth is for AUTHORIZATION not authentication — OpenID Connect adds authentication. Know these distinctions cold. Kerberos is vulnerable to pass-the-ticket and golden ticket attacks.',
'Choose SSO protocols based on your environment. Enterprise with Active Directory = Kerberos. Web applications = SAML or OIDC. API authorization = OAuth 2.0. Always implement MFA at the SSO level.',
'Kerberos = "Kerberos uses Keys and Tickets (like a movie theater)." SAML vs OAuth: "SAML Says who you Are (Markup Language). OAuth Opens resources for Applications (token-based)." OIDC = "OAuth + ID Card."',
'🇬🇧 London - The Identity Crisis'),

(5, '5.4', 'Privilege Management', 'Controlling and monitoring elevated access rights.',
'## Managing the Keys to the Kingdom

Privileged accounts are the highest-value targets for attackers. Compromising a single admin account can give an attacker full control of an environment.

**Types of Privileged Accounts**: Root/Administrator (full system control), Service accounts (used by applications), Emergency/break-glass accounts (for disaster scenarios), Database admin accounts, Network device admin accounts. Each requires strict controls.

**Privileged Access Management (PAM)**: Centralizes control of privileged credentials. Features: password vaulting (stores admin passwords securely), session recording (records what privileged users do), just-in-time access (grants privileges temporarily when needed), automatic password rotation.

**Principle of Least Privilege**: Users get only the minimum access needed. Applies especially to admins — even admins should use standard accounts for daily work and only elevate when needed. Reduces blast radius if an account is compromised.

**Privilege Escalation Attacks**: Vertical escalation (gaining higher privileges — user becomes admin), Horizontal escalation (accessing another user''s data at the same level). Prevention: input validation, proper authorization checks, regular privilege reviews, removing unnecessary SUID/SGID bits.

**Access Reviews**: Regular audits of who has access to what. Critical for privileged accounts. Remove access that is no longer needed (privilege creep). Automated access certification campaigns streamline this process.',
NULL, NULL,
'Least privilege applies to EVERYONE including admins. Privilege escalation comes in two types: vertical (up) and horizontal (sideways). Access reviews should occur regularly — quarterly for privileged accounts.',
'PAM is not optional for mature security programs. The cost of a single privileged account compromise far exceeds the cost of PAM tooling. Start with password vaulting, then add session recording and JIT access.',
'Privilege escalation: "Vertical = climbing the ladder (user→admin). Horizontal = walking sideways (user→other user)." PAM features: "VPJR = Vault passwords, Play back sessions, Just-in-time access, Rotate credentials."',
'🇬🇧 London - The Identity Crisis'),

(5, '5.5', 'Identity Lifecycle', 'Managing identities from provisioning through deprovisioning.',
'## From Hire to Retire

The identity lifecycle covers every stage of a user''s digital identity within an organization. Proper management at each stage prevents security gaps.

**Provisioning**: Creating accounts and assigning access when a user joins. Should follow a formal process: HR notifies IT → account created based on role → minimum necessary access granted → user trained on acceptable use. Automated provisioning reduces errors and delays.

**Identity Proofing**: Verifying that a person is who they claim to be before granting access. In-person verification with government ID is strongest. Remote verification uses knowledge-based questions, document verification, or video calls. Strength of proofing should match the sensitivity of access granted.

**Access Management**: Ongoing management of what users can access. Regular access reviews catch privilege creep (accumulation of unnecessary access over time). Role changes should trigger access reviews — a promotion should not just add access but also remove old access.

**Deprovisioning**: Removing access when a user leaves or changes roles. CRITICAL: disabled accounts should be immediate for terminations, especially involuntary ones. Retain accounts for a period for legal/compliance reasons but disable all access. The biggest risk is orphaned accounts — active accounts for people who no longer need them.

**Account Types**: User accounts, privileged accounts, service accounts, shared accounts (avoid these), guest accounts, temporary accounts. Each type needs specific lifecycle management procedures.',
NULL, NULL,
'Deprovisioning is the most critical lifecycle step from a security perspective. Involuntary termination = IMMEDIATE account disable. Orphaned accounts are a top audit finding. Shared accounts violate accountability.',
'Automate identity lifecycle wherever possible. Manual processes create delays (provisioning) and gaps (deprovisioning). Connect HR systems to identity management for automatic triggering of lifecycle events.',
'Identity lifecycle: "People Join, Access given, Reviews happen, Termination comes" = PJART. Most critical step: "Deprovisioning = Don''t Procrastinate Account Removal on Termination."',
'🇬🇧 London - The Identity Crisis'),

-- DOMAIN 6: Security Assessment and Testing (5 topics)
(6, '6.1', 'Vulnerability Assessments', 'Systematically identifying weaknesses in systems and networks.',
'## Finding Weaknesses Before Attackers Do

Vulnerability assessments are proactive security evaluations that identify, quantify, and prioritize vulnerabilities in systems, networks, and applications.

**Types of Assessments**: Network vulnerability scans (Nessus, Qualys), Web application scans (OWASP ZAP, Burp Suite), Database scans, Host-based assessments, Wireless assessments. Each targets different attack surfaces.

**Assessment Process**: Define scope → Discover assets → Scan for vulnerabilities → Analyze results → Prioritize by risk → Report → Remediate → Rescan to verify. This is a continuous cycle, not a one-time event.

**Credentialed vs Non-Credentialed Scans**: Credentialed (authenticated) scans log into systems for deeper analysis — they find more vulnerabilities and have fewer false positives. Non-credentialed (unauthenticated) scans see what an external attacker would see.

**CVSS (Common Vulnerability Scoring System)**: Standard scoring from 0.0-10.0. Base score (inherent severity), Temporal score (changes over time), Environmental score (specific to your organization). Critical: 9.0-10.0, High: 7.0-8.9, Medium: 4.0-6.9, Low: 0.1-3.9.

**Common Issues**: False positives (reported vulnerability that does not actually exist), False negatives (missed real vulnerability — more dangerous). Always validate critical findings manually.',
NULL,
'{"headers": ["Scan Type", "Access Level", "Coverage", "False Positives"], "rows": [["Credentialed", "Admin access", "Deep (internal view)", "Fewer"], ["Non-credentialed", "No access", "Surface (external view)", "More"]]}',
'Credentialed scans find MORE vulnerabilities with FEWER false positives. False negatives are more dangerous than false positives (you miss real threats). CVSS provides standardized severity scoring.',
'Vulnerability scanning is necessary but not sufficient. Pair it with penetration testing for validation. Prioritize remediation by CVSS score adjusted for your environment''s exposure and criticality.',
'CVSS: "Critical = Can''t ignore (9+), High = Hurry up (7-8.9), Medium = Make a plan (4-6.9), Low = Look at it later (0-3.9)." Scanning: "Credentialed = Complete view, Non-credentialed = Narrow view."',
'🔬 Tel Aviv - The Evidence'),

(6, '6.2', 'Penetration Testing', 'Simulated attacks to evaluate the effectiveness of security controls.',
'## Thinking Like the Enemy

Penetration testing goes beyond vulnerability assessment by actually EXPLOITING vulnerabilities to demonstrate real-world impact. It proves what an attacker could really do.

**Types of Pen Tests**: Black box (no prior knowledge — simulates external attacker), White box (full knowledge — simulates insider or comprehensive review), Gray box (partial knowledge — most realistic balance). Each provides different insights.

**Pen Test Phases**: Planning/scoping → Reconnaissance (OSINT, scanning) → Exploitation (gaining access) → Post-exploitation (privilege escalation, lateral movement, data exfiltration) → Reporting → Remediation verification.

**Rules of Engagement**: Define what is in/out of scope, testing windows, communication procedures, emergency contacts, and get WRITTEN AUTHORIZATION. Testing without authorization is illegal, regardless of intent. The rules of engagement document is critical.

**Red Team vs Blue Team**: Red team simulates attackers. Blue team defends. Purple team combines both for collaborative improvement. Red team exercises are broader than pen tests — they test people, processes, and technology holistically.

**Social Engineering Tests**: Phishing campaigns, pretexting, tailgating attempts. Often the most revealing results — technical controls mean nothing if users give away credentials. Must be carefully scoped and handled sensitively.',
NULL,
'{"headers": ["Test Type", "Knowledge", "Simulates", "Cost"], "rows": [["Black Box", "None", "External attacker", "Higher (more time)"], ["White Box", "Full", "Insider/comprehensive", "Lower (efficient)"], ["Gray Box", "Partial", "Realistic attacker", "Medium"]]}',
'WRITTEN AUTHORIZATION is mandatory. Without it, a pen test is a crime. Rules of engagement define scope. Black box = attacker perspective. White box = comprehensive coverage. Purple team = collaborative (not adversarial).',
'Commission pen tests at least annually and after significant changes. Ensure findings are tracked to remediation. The value is not in the report — it is in fixing what was found.',
'Pen test types: "Black = Blind (no knowledge), White = Wide open (full knowledge), Gray = Got some info (partial)." Teams: "Red = Really attack, Blue = Block attacks, Purple = Practice together."',
'🔬 Tel Aviv - The Evidence'),

(6, '6.3', 'Security Auditing', 'Formal examination of security controls and compliance.',
'## Trust But Verify

Security audits provide independent assurance that controls are operating effectively. They are the formal accountability mechanism for security programs.

**Internal vs External Audits**: Internal audits are conducted by the organization''s own audit team. They provide ongoing assurance and preparation for external audits. External audits are conducted by independent third parties and carry more weight for compliance and stakeholder assurance.

**Audit Types**: Compliance audit (are we following the rules?), Operational audit (are controls effective?), Financial audit (are financial statements accurate?), IS audit (are IT controls adequate?), Forensic audit (investigating suspected fraud/breach).

**SOC Reports**: SOC 1 (financial controls), SOC 2 (security, availability, processing integrity, confidentiality, privacy — the "Trust Services Criteria"), SOC 3 (general use summary of SOC 2). SOC 2 Type I = point-in-time design assessment. SOC 2 Type II = period-of-time (6-12 months) operational effectiveness assessment. Type II is more valuable.

**Audit Evidence**: Must be sufficient, reliable, relevant, and useful. Types: documentary evidence, testimonial evidence, analytical evidence, physical observation. The audit trail is the chronological record of system activities.

**Audit Findings**: Findings are rated by severity and reported to management. Management response includes agreeing/disagreeing with findings and providing remediation timelines. Follow-up audits verify remediation.',
NULL,
'{"headers": ["SOC Type", "Focus", "Audience", "Detail"], "rows": [["SOC 1", "Financial controls", "Auditors", "Detailed"], ["SOC 2 Type I", "Security controls (design)", "Stakeholders", "Point-in-time"], ["SOC 2 Type II", "Security controls (operations)", "Stakeholders", "Period of time"], ["SOC 3", "General security summary", "Public", "High-level"]]}',
'SOC 2 Type II is the gold standard (covers operational effectiveness over time). SOC 2 Type I only assesses design at a point in time. Management is responsible for responding to audit findings — auditors only report.',
'Treat audits as opportunities, not threats. A good audit program helps you find and fix issues before they become incidents. Build a positive relationship with your auditors.',
'SOC reports: "SOC 1 = Solely financial, SOC 2 = Security stuff, SOC 3 = Summary for the masses." Type I vs Type II: "Type I = one Instance in time, Type II = Two points over Time."',
'🔬 Tel Aviv - The Evidence'),

(6, '6.4', 'Log Management and Monitoring', 'Collecting, analyzing, and retaining security event data.',
'## The Eyes and Ears of Security

Logging and monitoring provide visibility into what is happening across your environment. Without logs, you are flying blind — you cannot detect, investigate, or prove anything.

**What to Log**: Authentication events (login, logout, failures), Authorization events (access granted/denied), System events (startup, shutdown, errors), Application events (transactions, errors), Network events (connections, firewall actions), Administrative actions (configuration changes, account modifications).

**SIEM (Security Information and Event Management)**: Centralizes log collection, normalizes data, correlates events, and generates alerts. Key capabilities: real-time alerting, dashboards, threat intelligence integration, automated response (SOAR integration), compliance reporting. Common platforms: Splunk, Microsoft Sentinel, IBM QRadar.

**Log Analysis Techniques**: Baseline comparison (what is normal?), Correlation (connecting related events across systems), Pattern matching (known attack signatures), Anomaly detection (statistical deviation from normal behavior), Timeline analysis (sequencing events during investigations).

**Log Retention**: Define retention periods based on legal, compliance, and operational requirements. PCI-DSS requires 1 year minimum (3 months immediately accessible). Many regulations require 7 years. Ensure log integrity — use write-once storage, hashing, and centralized collection to prevent tampering.

**Challenges**: Log volume (terabytes per day in large environments), alert fatigue (too many false positives), skill shortage (analysts needed to interpret data), time synchronization (NTP is essential for correlating events across systems).',
NULL, NULL,
'SIEM is a detective control — it detects but does not prevent. NTP (time synchronization) is critical for log correlation. Log integrity must be protected — tampered logs are useless for investigations and compliance.',
'Invest in SIEM capabilities proportional to your risk. Automate routine analysis and response. Focus analysts on high-fidelity alerts. Ensure logs from critical systems are collected redundantly.',
'SIEM: "SIEM = Security Information Events Manager — your digital security guard." Log retention: "When in doubt, keep it. Better to have logs and not need them than need them and not have them."',
'🔬 Tel Aviv - The Evidence'),

(6, '6.5', 'Security Metrics and KPIs', 'Measuring security program effectiveness with meaningful metrics.',
'## Measuring What Matters

You cannot improve what you do not measure. Security metrics transform security from a cost center into a measurable business function.

**Types of Metrics**: KPIs (Key Performance Indicators — measure success), KRIs (Key Risk Indicators — predict problems), Operational metrics (day-to-day), Strategic metrics (program-level), Compliance metrics (regulatory adherence).

**Common Security Metrics**: Mean Time to Detect (MTTD), Mean Time to Respond (MTTR), Patch compliance rate, Vulnerability remediation time, Phishing click rate, Security awareness training completion, Number of incidents by severity, Percentage of systems with MFA enabled.

**Metric Quality**: Good metrics are SMART: Specific, Measurable, Achievable, Relevant, Time-bound. Avoid vanity metrics (numbers that look good but do not drive decisions). Focus on metrics that influence behavior and decision-making.

**Reporting**: Tailor reports to the audience. The board wants risk-level summaries and trends. The CISO wants program effectiveness data. The SOC wants operational metrics. Use dashboards for real-time visibility and periodic reports for trend analysis.

**Maturity Models**: CMM (Capability Maturity Model) levels: Initial (ad hoc), Repeatable (basic processes), Defined (documented), Managed (measured), Optimizing (continuous improvement). Use maturity models to benchmark and improve your security program over time.',
NULL,
'{"headers": ["Level", "Name", "Characteristics"], "rows": [["1", "Initial", "Ad hoc, chaotic"], ["2", "Repeatable", "Basic processes defined"], ["3", "Defined", "Standardized and documented"], ["4", "Managed", "Measured and controlled"], ["5", "Optimizing", "Continuous improvement"]]}',
'MTTD + MTTR measure incident response effectiveness. Lower is better. CMM Level 1 is the lowest (ad hoc). Know the 5 levels. Metrics should drive DECISIONS, not just fill reports.',
'Present metrics in business terms. The board does not care about CVE counts. They care about "our risk of a material breach has decreased 30% this quarter." Tie security metrics to business outcomes.',
'CMM levels: "I Really Did Master Optimization" — Initial, Repeatable, Defined, Managed, Optimizing. MTTD vs MTTR: "Detect then React — both should be as low as possible."',
'🔬 Tel Aviv - The Evidence'),

-- DOMAIN 7: Security Operations (5 topics)
(7, '7.1', 'Incident Response Process', 'The structured approach to handling security incidents.',
'## When Bad Things Happen

Incident response (IR) is the organized approach to addressing and managing the aftermath of a security breach or cyberattack. A well-planned IR process minimizes damage and recovery time.

**IR Phases (NIST SP 800-61)**: Preparation → Detection and Analysis → Containment, Eradication, and Recovery → Post-Incident Activity (Lessons Learned). This is a cycle, not a linear process.

**Preparation**: Build the IR team, define roles and responsibilities, create runbooks for common scenarios, establish communication plans, set up tools and infrastructure, conduct tabletop exercises. Preparation is the most important phase — you cannot plan during a crisis.

**Detection and Analysis**: Identify indicators of compromise (IoCs), assess scope and severity, determine attack vector, classify the incident (privacy breach, malware, DDoS, etc.). Use SIEM, IDS, endpoint detection, and human analysis. Document everything from this point forward.

**Containment**: Stop the spread without destroying evidence. Short-term containment (isolate affected systems), Long-term containment (patch, harden while maintaining business operations). The decision to contain must balance security with business continuity.

**Eradication and Recovery**: Remove the threat completely (malware removal, credential reset, vulnerability patching). Restore systems from known-good backups. Monitor closely after restoration for signs of re-compromise. Gradual return to normal operations.

**Lessons Learned**: Meet within 1-2 weeks of incident closure. What happened? What worked? What didn''t? What can we improve? Update IR plans, runbooks, and controls based on findings. This is how organizations get better.',
NULL,
'{"headers": ["Phase", "Key Activities", "Priority"], "rows": [["Preparation", "Team, tools, plans, training", "Before incident"], ["Detection", "Identify, analyze, classify", "Find the problem"], ["Containment", "Isolate, limit damage", "Stop the bleeding"], ["Eradication", "Remove threat, patch", "Clean up"], ["Recovery", "Restore, monitor", "Return to normal"], ["Lessons Learned", "Document, improve", "Get better"]]}',
'IR phases order: Preparation first, Lessons Learned last. Containment comes before Eradication. Evidence preservation is critical during Containment — do not erase evidence by reimaging too quickly. First responder should NOT turn off the system (preserve volatile memory).',
'The IR plan must have executive sponsorship. Ensure legal counsel is part of the IR team for breach notification decisions. Practice regularly — an untested plan is just a document.',
'IR phases: "People Detect Containment Efforts, Recover Lessons" — Preparation, Detection, Containment, Eradication, Recovery, Lessons learned. Or simpler: "Please Don''t Cry, Everything''s Resolved, Learned."',
'🖥️ New York - The SOC War Room'),

(7, '7.2', 'Disaster Recovery', 'Restoring IT systems and operations after a disruption.',
'## Getting Back on Your Feet

Disaster Recovery Planning (DRP) focuses specifically on restoring IT systems and infrastructure after a disruption. It is the IT-specific component of the broader Business Continuity Plan (BCP).

**DRP vs BCP**: BCP keeps the BUSINESS running during a disaster (people, processes, facilities). DRP gets the IT SYSTEMS back online. DRP is a subset of BCP. Both are required for organizational resilience.

**Recovery Strategies**: Hot site (fully operational mirror — minutes to fail over), Warm site (hardware in place, needs data — hours), Cold site (empty facility — days to weeks), Cloud-based recovery (IaaS for on-demand recovery), Mobile site (portable facility), Reciprocal agreement (partner organization agreement).

**Backup Strategies**: Full backup (everything — longest but simplest restore), Incremental backup (only changes since last backup — fastest backup, slowest restore), Differential backup (changes since last full — moderate both ways). The 3-2-1 rule: 3 copies, 2 different media types, 1 offsite.

**DRP Testing**: Checklist review (simplest), Structured walkthrough (tabletop), Simulation test (scenario-based), Parallel test (activate backup while primary runs), Full interruption test (actually switch to backup — most realistic, most risky). Test at least annually and after significant changes.

**Key Metrics (revisited)**: RTO (maximum acceptable downtime), RPO (maximum acceptable data loss), WRT (Work Recovery Time — time to verify and test recovered systems), MTD (Maximum Tolerable Downtime — total acceptable downtime including recovery and verification).',
'[{"formula": "MTD = RTO + WRT", "description": "Maximum Tolerable Downtime includes both recovery and verification"}, {"formula": "RPO determines backup frequency", "description": "If RPO = 4 hours, backup at least every 4 hours"}]',
'{"headers": ["Backup Type", "Backs Up", "Restore Process", "Speed"], "rows": [["Full", "Everything", "Restore latest full", "Slowest backup, fastest restore"], ["Incremental", "Changes since last backup", "Restore full + all incrementals", "Fastest backup, slowest restore"], ["Differential", "Changes since last full", "Restore full + latest differential", "Moderate both"]]}',
'Full interruption test is the most thorough but also the most risky (you actually switch to backup). MTD > RTO (MTD includes verification time). Incremental has the fastest backup but slowest restore (need full + all incrementals).',
'DRP requires regular testing — an untested plan will fail when needed most. Ensure backups are tested by actually restoring from them. Budget for recovery infrastructure based on RTO/RPO requirements.',
'Backup types: "Full = Fat (everything), Incremental = Itty-bitty pieces (changes since last), Differential = Difference since full." Test types from easiest to hardest: "Cowboys Sit Simply, Practice Fully" — Checklist, Structured walkthrough, Simulation, Parallel, Full interruption.',
'🖥️ New York - The SOC War Room'),

(7, '7.3', 'Change and Configuration Management', 'Controlling changes to systems and maintaining secure configurations.',
'## Controlled Evolution

Change management ensures that modifications to systems are planned, tested, approved, and documented. Without it, well-meaning changes can introduce vulnerabilities or cause outages.

**Change Management Process**: Request → Review → Approve → Test → Implement → Verify → Document. Every change should follow this process. Emergency changes can use an expedited process but must still be documented and reviewed after the fact.

**Change Advisory Board (CAB)**: The group that reviews and approves changes. Includes representatives from IT, security, operations, and business stakeholders. Evaluates risk, impact, and rollback plans for each change.

**Configuration Management**: Maintaining systems in a known, documented state. Configuration baselines define the approved configuration. Configuration items (CIs) are tracked in a Configuration Management Database (CMDB). Drift detection identifies unauthorized changes.

**Patch Management**: A critical subset of change management. Assess patches for applicability and risk → Test in staging → Deploy to production → Verify → Document. Prioritize patches by CVSS score and exploitability. Zero-day patches may need emergency deployment.

**Version Control**: Track changes to code, configurations, and documents over time. Enables rollback to known-good states. Critical for both development and operations. Infrastructure as Code (IaC) brings version control to infrastructure.',
NULL, NULL,
'Every change must follow the change management process — even "simple" changes. Emergency changes still need post-implementation review. Configuration baselines are the starting point for drift detection.',
'Change management prevents self-inflicted outages. Studies show that the majority of outages are caused by changes, not attacks. A mature change management process is a security control and an operational necessity.',
'Change management steps: "Request Review Approval Testing Implementation Verification Documentation" = "R-RATIVD" or simply "Request it, Review it, Approve it, Test it, Implement it, Verify it, Document it."',
'🖥️ New York - The SOC War Room'),

(7, '7.4', 'Digital Forensics', 'Collecting and preserving digital evidence for investigation.',
'## The Science of Digital Evidence

Digital forensics is the process of identifying, preserving, collecting, analyzing, and presenting digital evidence. It must be conducted in a manner that preserves the evidence''s admissibility in court.

**Forensic Process**: Identification (what evidence exists?) → Preservation (protect from alteration) → Collection (acquire evidence properly) → Examination (extract relevant data) → Analysis (draw conclusions) → Presentation (report findings).

**Evidence Handling**: Chain of custody is CRITICAL — document who handled evidence, when, where, and what they did. Any break in the chain can make evidence inadmissible. Use evidence bags, tamper-evident seals, and detailed logs.

**Forensic Imaging**: Create a bit-for-bit copy (forensic image) of storage media. Use write blockers to prevent modification of the original. Verify image integrity with cryptographic hashes (SHA-256). Always work on the copy, never the original.

**Volatile Evidence**: Evidence that disappears when power is lost. Order of volatility (collect first to last): CPU registers/cache → RAM → network state → running processes → disk → remote logs → physical configuration. RAM forensics can reveal encryption keys, running malware, and network connections.

**Legal Considerations**: Evidence must be relevant, authentic, and reliable. Best evidence rule (original preferred). Hearsay rule (computer-generated records may be exempt). Work with legal counsel to ensure evidence collection meets judicial standards.',
NULL,
'{"headers": ["Evidence Type", "Volatility", "Priority"], "rows": [["CPU Registers/Cache", "Highest", "Collect first"], ["RAM", "High", "Collect second"], ["Network State", "High", "Collect third"], ["Running Processes", "Medium", "Collect fourth"], ["Disk", "Low", "Collect fifth"], ["Remote Logs", "Lowest", "Collect last"]]}',
'Order of volatility: most volatile first (CPU → RAM → disk). NEVER analyze the original — always work on a forensic copy. Chain of custody breaks make evidence inadmissible. Write blockers prevent evidence modification.',
'Invest in forensic readiness. Have forensic tools, trained personnel, and procedures BEFORE you need them. The first minutes of evidence collection are the most critical and the most error-prone.',
'Order of volatility: "Can Recalling Numerous Processes During Recovery help?" — CPU, RAM, Network, Processes, Disk, Remote logs. Chain of custody: "Who had it, When, Where, What they did — break the chain, lose the case."',
'🖥️ New York - The SOC War Room'),

(7, '7.5', 'Security Operations Center', 'The centralized function for monitoring and defending the enterprise.',
'## The Nerve Center

A Security Operations Center (SOC) is the centralized unit that deals with security issues on an organizational and technical level. It is the 24/7 heartbeat of security monitoring and response.

**SOC Functions**: Continuous monitoring, threat detection, incident response, threat intelligence, vulnerability management coordination, security tool management, compliance monitoring, reporting.

**SOC Models**: Internal SOC (built and staffed in-house), Outsourced SOC (MSSP — Managed Security Service Provider), Hybrid SOC (internal team augmented by MSSP for off-hours or specialized functions), Virtual SOC (distributed team without a physical center).

**SOC Tiers**: Tier 1 analysts triage alerts (first responders), Tier 2 analysts investigate escalated incidents (deep analysis), Tier 3 analysts handle advanced threats and threat hunting (senior/specialized). SOC manager oversees operations and strategy.

**SOC Technology Stack**: SIEM (correlation and alerting), SOAR (Security Orchestration, Automation, and Response — automates playbooks), EDR (Endpoint Detection and Response), TIP (Threat Intelligence Platform), Network detection tools, Vulnerability scanners.

**SOC Challenges**: Alert fatigue (too many false positives), analyst burnout, skill shortage, keeping pace with evolving threats. SOAR and automation help by handling routine tasks, freeing analysts for complex work.',
NULL,
'{"headers": ["Tier", "Role", "Focus"], "rows": [["Tier 1", "Alert Triage", "Initial review, false positive filtering"], ["Tier 2", "Investigation", "Deep analysis of escalated alerts"], ["Tier 3", "Threat Hunting", "Proactive hunting, advanced threats"], ["Manager", "Leadership", "Strategy, reporting, team management"]]}',
'SOC is a detective and responsive function — it monitors and responds. SOAR automates playbooks to reduce analyst workload. Tier 1 handles the most alerts; Tier 3 handles the most complex. MSSPs are outsourced SOCs.',
'A SOC is only as good as its people and processes. Invest in analyst training, reduce alert fatigue through tuning, and use automation (SOAR) for repetitive tasks. Monitor SOC metrics: MTTD, MTTR, false positive rate.',
'SOC tiers: "Tier 1 = Triage (like ER nurse), Tier 2 = Treatment (like doctor), Tier 3 = Thoracic surgeon (specialist)." SOAR = "SOC Orchestration And Response automation."',
'🖥️ New York - The SOC War Room'),

-- DOMAIN 8: Software Development Security (5 topics)
(8, '8.1', 'SDLC Security', 'Integrating security throughout the software development lifecycle.',
'## Security from the First Line of Code

Secure software development integrates security into every phase of the SDLC, not as a bolt-on at the end. The earlier you find a vulnerability, the cheaper it is to fix — a bug found in design costs 100x less to fix than one found in production.

**SDLC Phases and Security Activities**: Requirements (security requirements, abuse cases, risk assessment), Design (threat modeling, secure architecture, security design review), Implementation (secure coding standards, code review, SAST), Testing (DAST, penetration testing, fuzzing), Deployment (configuration hardening, security scanning), Maintenance (patching, monitoring, incident response).

**Security in Agile**: Security must adapt to agile''s rapid iterations. Security champions in each team, automated security testing in CI/CD pipelines, security-focused sprints, threat modeling during sprint planning.

**DevSecOps**: Integrating security into DevOps. "Shift left" — move security testing earlier in the pipeline. Automated SAST/DAST in CI/CD, infrastructure as code security scanning, container security, automated compliance checks.

**Threat Modeling**: Identify threats to the application during design. STRIDE model: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege. Create data flow diagrams, identify trust boundaries, enumerate threats, define mitigations.',
NULL,
'{"headers": ["SDLC Phase", "Security Activity"], "rows": [["Requirements", "Security requirements, abuse cases"], ["Design", "Threat modeling, architecture review"], ["Implementation", "Secure coding, SAST, code review"], ["Testing", "DAST, pen testing, fuzzing"], ["Deployment", "Hardening, configuration review"], ["Maintenance", "Patching, monitoring"]]}',
'Security should be integrated at EVERY SDLC phase, not just testing. "Shift left" means testing earlier. STRIDE is the most common threat modeling framework. Cost to fix increases 100x from design to production.',
'Mandate secure coding training for all developers. Integrate automated security testing into CI/CD pipelines. Use threat modeling during design to catch architectural flaws before they become code.',
'STRIDE threats: "Spies Tamper, Repudiate, Inform, Deny, Elevate" — Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege. Shift Left = "Start Security Sooner."',
'🤠 Austin - The Dev Lab'),

(8, '8.2', 'OWASP Top 10', 'The most critical web application security risks.',
'## The Hit List of Web Vulnerabilities

The OWASP Top 10 is the most widely recognized list of critical web application security risks. Every developer and security professional should know these by heart.

**A01 - Broken Access Control**: Users can act outside their intended permissions. Examples: modifying URL parameters to access other users'' data, privilege escalation, IDOR (Insecure Direct Object Reference). Prevention: deny by default, implement proper authorization checks, use server-side validation.

**A02 - Cryptographic Failures**: Sensitive data exposed due to weak or missing encryption. Examples: transmitting data in cleartext, using deprecated algorithms (MD5, SHA-1, DES), hardcoded encryption keys. Prevention: encrypt data at rest and in transit, use strong algorithms (AES-256, SHA-256), proper key management.

**A03 - Injection**: Untrusted data sent to an interpreter as part of a command. SQL injection is the classic example. Prevention: parameterized queries/prepared statements, input validation, stored procedures, ORM frameworks.

**A07 - Identification and Authentication Failures**: Session management and authentication weaknesses. Examples: permitting weak passwords, missing MFA, exposing session IDs in URLs. Prevention: MFA, strong password policies, secure session management.

**A09 - Security Logging and Monitoring Failures**: Insufficient logging makes it impossible to detect breaches. Prevention: log all authentication, access control, and server-side validation failures. Ensure logs are monitored and alerts are actionable.',
NULL, NULL,
'SQL injection prevention = parameterized queries (NOT input filtering alone). Broken Access Control is #1 (most common). Know at least the top 5 OWASP risks. XSS is now part of Injection (A03).',
'Mandate OWASP Top 10 training for all developers. Include OWASP checks in code review checklists and automated testing. Track OWASP-related findings as a security metric.',
'Top 3 OWASP: "BAC-CI: Broken Access Control, Cryptographic failures, Injection" — sounds like "back see" — always look back to see if access, crypto, and input are secure.',
'🤠 Austin - The Dev Lab'),

(8, '8.3', 'Secure Coding Practices', 'Writing code that resists attack and handles errors securely.',
'## Building Bulletproof Code

Secure coding is the practice of writing software that is resistant to attack. It requires both knowledge of vulnerabilities and discipline in applying defensive techniques.

**Input Validation**: NEVER trust user input. Validate on the server side (client-side validation is bypassable). Use allowlists (define what IS allowed) rather than denylists (define what ISN''T allowed). Validate type, length, range, and format.

**Output Encoding**: Encode output to prevent injection attacks. HTML encoding prevents XSS when inserting into HTML. URL encoding for URL parameters. SQL parameterization for database queries. Context-aware encoding is essential.

**Error Handling**: Never expose internal details in error messages (stack traces, database errors, file paths). Use generic error messages for users and detailed logs for developers. Fail securely — errors should not bypass security controls.

**Memory Safety**: Buffer overflows remain a critical vulnerability in C/C++. Use bounds checking, safe string functions, and memory-safe languages where possible. ASLR (Address Space Layout Randomization) and DEP (Data Execution Prevention) provide OS-level protection.

**Secrets Management**: Never hardcode credentials, API keys, or encryption keys in source code. Use environment variables, secrets vaults (HashiCorp Vault, AWS Secrets Manager), or configuration management. Rotate secrets regularly. Scan repositories for accidentally committed secrets.',
NULL, NULL,
'Input validation: allowlists are preferred over denylists. Validate server-side (client-side is supplementary only). Error messages should be generic to users — detailed errors go to logs only. Never hardcode secrets.',
'Establish and enforce secure coding standards. Automate detection of common issues in CI/CD. Invest in developer security training — most vulnerabilities are introduced by developers who simply were not taught better.',
'Secure coding rules: "VIBES" — Validate input, Inspect output (encode), Block errors (handle gracefully), Eliminate hardcoded secrets, Sanitize memory. "Allowlist = ALways good, Denylist = Don''t rely on it alone."',
'🤠 Austin - The Dev Lab'),

(8, '8.4', 'Application Security Testing', 'Methods for finding vulnerabilities in applications.',
'## Testing the Code

Application security testing uses various techniques to find vulnerabilities before attackers do. A comprehensive testing program combines multiple methods for maximum coverage.

**SAST (Static Application Security Testing)**: Analyzes source code without executing it. Finds vulnerabilities in code patterns: SQL injection, buffer overflows, hardcoded credentials. Run during development (shift left). Tools: SonarQube, Checkmarx, Fortify. Pro: early detection. Con: high false positive rate, cannot find runtime issues.

**DAST (Dynamic Application Security Testing)**: Tests the running application from the outside, like a black-box attacker. Sends malicious requests and analyzes responses. Finds runtime vulnerabilities: authentication flaws, server misconfigurations, injection flaws. Tools: OWASP ZAP, Burp Suite. Pro: finds real exploitable issues. Con: late in SDLC, limited code coverage.

**IAST (Interactive Application Security Testing)**: Combines SAST and DAST by using agents inside the application during testing. Provides real-time analysis with low false positives. Best of both worlds but more complex to deploy.

**SCA (Software Composition Analysis)**: Analyzes third-party libraries and dependencies for known vulnerabilities. Critical because 80%+ of modern code is open-source dependencies. Tools: Snyk, Dependabot, Black Duck. Checks against CVE databases.

**Fuzzing**: Sends random, malformed, or unexpected data to application inputs to find crashes, memory leaks, and vulnerabilities. Effective for finding edge cases that developers and scanners miss. Types: mutation-based (modifies valid inputs) and generation-based (creates inputs from specification).',
NULL,
'{"headers": ["Testing Type", "When", "Finds", "False Positives"], "rows": [["SAST", "During development", "Code-level flaws", "High"], ["DAST", "During testing", "Runtime flaws", "Medium"], ["IAST", "During testing", "Both code and runtime", "Low"], ["SCA", "During build", "Dependency vulnerabilities", "Low"], ["Fuzzing", "During testing", "Edge cases, crashes", "Low"]]}',
'SAST = white box (sees code), DAST = black box (sees running app). SAST runs earlier (shift left). SCA is CRITICAL — most breaches exploit known vulnerabilities in third-party libraries. Combine multiple methods for best coverage.',
'Build a testing pipeline: SCA in build → SAST during development → DAST in staging → Pen testing before release. Automate everything possible. Track vulnerability trends over time.',
'Testing types: "SAST = See All Source code Text. DAST = Dynamically Attack Software in Testing. IAST = Inside the Application Security Testing. SCA = Supply Chain Analysis."',
'🤠 Austin - The Dev Lab'),

(8, '8.5', 'Database Security', 'Protecting databases from unauthorized access and data breaches.',
'## Guarding the Crown Jewels

Databases contain an organization''s most valuable data. They are prime targets for attackers and require multiple layers of protection.

**Database Access Controls**: Principle of least privilege for database accounts. Role-based access control for database users. Separate accounts for applications, administrators, and users. Never use the database root/sa account for application connections.

**SQL Injection Prevention**: The most common database attack. Use parameterized queries/prepared statements (NOT string concatenation). ORMs (Object-Relational Mappers) help but are not foolproof. Stored procedures provide an additional layer of abstraction. Web Application Firewalls (WAFs) can block known SQL injection patterns.

**Database Encryption**: Transparent Data Encryption (TDE) encrypts data at rest at the database level. Column-level encryption for specific sensitive fields. Always encrypt backups. Key management is critical — store encryption keys separately from encrypted data.

**Database Activity Monitoring (DAM)**: Monitors and audits all database activity. Detects unauthorized access, privilege escalation, and policy violations. Provides real-time alerting and compliance reporting. Works independently of native database auditing (which can be disabled by DBAs).

**Database Security Best Practices**: Apply patches promptly, remove default accounts and databases, disable unnecessary features, encrypt connections (TLS), regular backups with tested restores, database activity monitoring, separation of duties between DBAs and security team.',
NULL, NULL,
'SQL injection prevention: parameterized queries are the PRIMARY defense. WAFs are supplementary, not primary. TDE encrypts at rest; TLS encrypts in transit. Default accounts must be removed or disabled.',
'Database security is a shared responsibility between DBAs, developers, and security. Establish clear ownership. Monitor database access independently of DBAs (they should not be able to cover their own tracks).',
'SQL injection prevention: "Parameterize, Don''t Concatenate!" — Always use prepared statements. Database security layers: "AEMB = Access control, Encryption, Monitoring, Backups" — think "Always Expect Malicious Behavior."',
'🤠 Austin - The Dev Lab');

-- ============================================================================
-- SEED DATA: CHAPTER LESSONS (8 chapters)
-- ============================================================================

INSERT INTO public.chapter_lessons (chapter_id, domain_id, title, content_markdown, knowledge_check_questions, library_topic_ids, display_order) VALUES

(1, 1, 'The Breach: Security and Risk Management',
'# Mission Briefing: Security and Risk Management

Welcome to Nexus HQ, Agent. A critical breach has been detected, and we need you to lead the risk assessment.

## Core Concepts

**The CIA Triad** is your foundation: Confidentiality (keeping secrets), Integrity (keeping data accurate), Availability (keeping systems running). Every security decision balances these three pillars.

**Risk Assessment** follows a systematic process: Identify assets → Identify threats → Identify vulnerabilities → Calculate risk → Prioritize treatment. Use the formula **ALE = ARO × SLE** for quantitative analysis.

## Memory Hack 🧠
Remember "CIA = Can I Access?" — Confidentiality (can I see it?), Integrity (can I trust it?), Availability (can I use it?).

## Key Takeaway
As a security manager, your job is not to eliminate all risk — it is to help the organization make informed decisions about acceptable risk levels.',
'[{"question": "What does the CIA triad stand for?", "options": ["Confidentiality, Integrity, Availability", "Control, Integrity, Authentication", "Confidentiality, Identity, Authorization", "Compliance, Integrity, Availability"], "correct_index": 0, "explanation": "The CIA triad stands for Confidentiality (protecting data from unauthorized disclosure), Integrity (protecting data from unauthorized modification), and Availability (ensuring data and systems are accessible when needed)."},
{"question": "In the formula ALE = ARO × SLE, what does ARO represent?", "options": ["Annual Recovery Objective", "Annualized Rate of Occurrence", "Asset Recovery Operations", "Annual Risk Output"], "correct_index": 1, "explanation": "ARO (Annualized Rate of Occurrence) represents how often a threat event is expected to occur per year. For example, if a flood is expected once every 5 years, the ARO is 0.2."},
{"question": "Which risk response involves purchasing an insurance policy?", "options": ["Risk avoidance", "Risk mitigation", "Risk transfer", "Risk acceptance"], "correct_index": 2, "explanation": "Risk transfer shifts the financial burden of a risk to a third party. Insurance is the most common example. The risk still exists, but the financial impact is borne by the insurer."}]',
'[]', 1),

(2, 2, 'The Data Vault: Asset Security',
'# Mission Briefing: Asset Security

We have arrived at the Data Vault facility. The breach appears to involve misclassified data — sensitive information was stored without proper protection.

## Core Concepts

**Data Classification** is how we determine the level of protection data needs. Government uses: Top Secret, Secret, Confidential, Unclassified. Commercial uses: Confidential, Private, Sensitive, Public.

**Data Roles**: The Owner (business executive) DECIDES the classification. The Custodian (IT) IMPLEMENTS controls. The User FOLLOWS the rules. Never confuse these — the exam loves testing this.

**Data States**: At Rest (encrypted on disk), In Transit (encrypted with TLS), In Use (protected in memory). Each state needs different controls.

## Memory Hack 🧠
Data roles: "OCU = Owner Commands, Custodian Upholds, User Complies."',
'[{"question": "Who is responsible for classifying data?", "options": ["The IT department", "The data custodian", "The data owner", "The security team"], "correct_index": 2, "explanation": "The data owner (a business executive or manager) is responsible for classifying data. The custodian implements the technical controls, but the classification decision is a business decision made by the owner."},
{"question": "Which data destruction method is appropriate for SSDs?", "options": ["Degaussing", "Cryptographic erasure", "Overwriting once", "Simple deletion"], "correct_index": 1, "explanation": "Degaussing only works on magnetic media and has no effect on SSDs (flash memory). Cryptographic erasure destroys the encryption key, rendering the data unrecoverable. Simple deletion and single overwriting are insufficient for sensitive data on SSDs."}]',
'[]', 1),

(3, 3, 'The Architecture Flaw: Security Architecture',
'# Mission Briefing: Security Architecture and Engineering

Our investigation has led us to Zurich where a critical flaw in the security architecture was exploited. Understanding security models and design principles is essential.

## Core Concepts

**Bell-LaPadula** protects CONFIDENTIALITY: No read up, no write down. Prevents classified information from leaking to lower clearance levels.

**Biba** protects INTEGRITY: No read down, no write up. The mirror of Bell-LaPadula. Prevents trusted data from being corrupted by untrusted sources.

**Secure Design Principles**: Defense in Depth (layers), Least Privilege (minimum access), Separation of Duties (no single person controls everything), Fail Secure (deny access on failure).

## Memory Hack 🧠
"BLP Blocks Leaking of Protected info" (confidentiality). "Biba Blocks Integrity Breaches Always" (integrity). They are mirror opposites!',
'[{"question": "Which security model enforces confidentiality with no-read-up and no-write-down rules?", "options": ["Biba", "Clark-Wilson", "Bell-LaPadula", "Brewer-Nash"], "correct_index": 2, "explanation": "Bell-LaPadula (BLP) enforces confidentiality. The Simple Security Property prevents reading above your clearance (no read up), and the Star Property prevents writing below your clearance (no write down), preventing information leakage."},
{"question": "What does fail secure mean?", "options": ["The system reboots automatically", "The system denies access when it fails", "The system allows access when it fails", "The system sends an alert when it fails"], "correct_index": 1, "explanation": "Fail secure (also called fail closed) means the system defaults to a secure state (denying access) when it fails. This is appropriate for most security systems. Fail open (allowing access on failure) is appropriate for safety systems like emergency exits."}]',
'[]', 1),

(4, 4, 'The Network Trail: Communication and Network Security',
'# Mission Briefing: Communication and Network Security

The trail has led us to Singapore where the attackers exploited network vulnerabilities. Understanding network architecture and protocols is critical.

## Core Concepts

**OSI Model**: 7 layers from Physical (1) to Application (7). Remember: "Please Do Not Throw Sausage Pizza Away." Security controls exist at every layer.

**Network Attacks**: MITM (intercepts communication), DoS (overwhelms systems), Sniffing (captures traffic). Each requires specific countermeasures.

**Firewalls**: Packet filter (fast, basic), Stateful (tracks connections), Application proxy (deep inspection), NGFW (all-in-one). IDS detects, IPS prevents.

## Memory Hack 🧠
IDS = "I Detect Stuff" (passive). IPS = "I Prevent Stuff" (active). Simple but effective!',
'[{"question": "At which OSI layer do routers operate?", "options": ["Layer 1 - Physical", "Layer 2 - Data Link", "Layer 3 - Network", "Layer 4 - Transport"], "correct_index": 2, "explanation": "Routers operate at Layer 3 (Network layer) because they make forwarding decisions based on IP addresses (Layer 3 addresses). Switches operate at Layer 2 using MAC addresses, and hubs operate at Layer 1."},
{"question": "What is the primary difference between IDS and IPS?", "options": ["IDS is hardware, IPS is software", "IDS detects and alerts, IPS detects and blocks", "IDS is for networks, IPS is for hosts", "IDS uses signatures, IPS uses anomalies"], "correct_index": 1, "explanation": "IDS (Intrusion Detection System) is a detective control that monitors and alerts on suspicious activity. IPS (Intrusion Prevention System) is a preventive control that can automatically block or mitigate threats in real-time."}]',
'[]', 1),

(5, 5, 'The Identity Crisis: Identity and Access Management',
'# Mission Briefing: Identity and Access Management

An insider threat at the London office has compromised identity systems. Understanding authentication, authorization, and access control is essential.

## Core Concepts

**Authentication Factors**: Something you KNOW (password), HAVE (token), ARE (biometric). MFA requires TWO DIFFERENT factors. Password + PIN = single factor (both "know").

**Access Control Models**: DAC (owner decides), MAC (system enforces labels), RBAC (roles determine access), ABAC (attributes and context).

**SSO and Federation**: Kerberos (enterprise, tickets), SAML (web, XML), OAuth (authorization, tokens), OIDC (authentication + authorization).

## Memory Hack 🧠
Access models: "DAC = Dad Allows Children, MAC = Military Assigns Clearances, RBAC = Roles Bring Access Capabilities."',
'[{"question": "Using a password and a PIN together is an example of:", "options": ["Multi-factor authentication", "Two-factor authentication", "Single-factor authentication", "Dual-factor authentication"], "correct_index": 2, "explanation": "Both a password and a PIN are something you KNOW. Multi-factor authentication requires at least two DIFFERENT factors (know + have, know + are, or have + are). Using two items from the same factor category is still single-factor authentication."},
{"question": "Which access control model is based on labels and clearance levels?", "options": ["DAC", "MAC", "RBAC", "ABAC"], "correct_index": 1, "explanation": "MAC (Mandatory Access Control) uses labels (classification levels) and clearances assigned by the system. Users cannot change permissions. It is the most restrictive model and is based on the Bell-LaPadula security model."}]',
'[]', 1),

(6, 6, 'The Evidence: Security Assessment and Testing',
'# Mission Briefing: Security Assessment and Testing

At the Tel Aviv forensics lab, we analyze the evidence gathered throughout the investigation. Security testing is how we find weaknesses before attackers do.

## Core Concepts

**Vulnerability Assessments** identify weaknesses. Credentialed scans (logged in) find more with fewer false positives than non-credentialed scans.

**Penetration Testing** exploits vulnerabilities to prove impact. Black box (no knowledge), White box (full knowledge), Gray box (partial). WRITTEN AUTHORIZATION is mandatory.

**SOC Reports**: SOC 2 Type II is the gold standard — it proves controls worked over a period of time, not just at a single point.

## Memory Hack 🧠
Pen test types: "Black = Blind, White = Wide open, Gray = Got some info." SOC 2: "Type I = one Instance, Type II = period of Time."',
'[{"question": "Which type of penetration test provides the most realistic simulation of an external attacker?", "options": ["White box", "Gray box", "Black box", "Red box"], "correct_index": 2, "explanation": "Black box testing gives the tester no prior knowledge of the target, simulating a real external attacker who must discover everything. White box provides full knowledge, and gray box provides partial knowledge."},
{"question": "What distinguishes SOC 2 Type II from SOC 2 Type I?", "options": ["Type II covers more controls", "Type II assesses controls over a period of time", "Type II is performed by a different auditor", "Type II includes financial controls"], "correct_index": 1, "explanation": "SOC 2 Type I assesses the design of controls at a single point in time. SOC 2 Type II assesses whether those controls actually operated effectively over a period of time (typically 6-12 months), making it far more valuable."}]',
'[]', 1),

(7, 7, 'The War Room: Security Operations',
'# Mission Briefing: Security Operations

Back at the SOC War Room, we coordinate the incident response. Security operations is where policy meets reality — detecting, responding to, and recovering from security events.

## Core Concepts

**Incident Response Phases**: Preparation → Detection → Containment → Eradication → Recovery → Lessons Learned. Preparation is the most important — you cannot plan during a crisis.

**Disaster Recovery**: Hot site (immediate failover), Warm site (hours), Cold site (days/weeks). Backup types: Full, Incremental (fastest backup), Differential.

**Digital Forensics**: Preserve evidence before analyzing it. Order of volatility: CPU → RAM → Network → Disk. NEVER analyze the original — always use forensic copies.

## Memory Hack 🧠
IR phases: "People Detect Containment Efforts, Recover Lessons" — Preparation, Detection, Containment, Eradication, Recovery, Lessons Learned.',
'[{"question": "What is the correct order of incident response phases?", "options": ["Detection, Containment, Preparation, Recovery, Eradication", "Preparation, Detection, Containment, Eradication, Recovery, Lessons Learned", "Containment, Detection, Eradication, Preparation, Recovery", "Preparation, Containment, Detection, Recovery, Eradication"], "correct_index": 1, "explanation": "The correct NIST IR phases are: Preparation, Detection and Analysis, Containment/Eradication/Recovery, and Post-Incident Activity (Lessons Learned). Preparation always comes first because you must be ready before an incident occurs."},
{"question": "In digital forensics, what should be collected first?", "options": ["Hard drive contents", "Network logs", "RAM contents", "Configuration files"], "correct_index": 2, "explanation": "RAM (volatile memory) should be collected before hard drive contents because RAM data is lost when power is removed. The order of volatility dictates collecting the most volatile evidence first: CPU registers → RAM → network state → disk → remote logs."}]',
'[]', 1),

(8, 8, 'The Root Cause: Software Development Security',
'# Mission Briefing: Software Development Security

The root cause has been traced to a software vulnerability in the Dev Lab. Understanding secure development practices prevents vulnerabilities at their source.

## Core Concepts

**Secure SDLC**: Integrate security at every phase. Requirements (security requirements), Design (threat modeling with STRIDE), Implementation (secure coding, SAST), Testing (DAST, pen testing), Deployment (hardening).

**OWASP Top 10**: Broken Access Control (#1), Cryptographic Failures (#2), Injection (#3). SQL injection prevention = parameterized queries, NOT input filtering alone.

**Testing Types**: SAST (static, sees code), DAST (dynamic, sees running app), SCA (checks dependencies for known vulnerabilities).

## Memory Hack 🧠
OWASP Top 3: "BAC-CI = Broken Access Control, Cryptographic failures, Injection." Testing: "SAST Sees Source, DAST Dynamically Attacks."',
'[{"question": "What is the primary defense against SQL injection?", "options": ["Input validation", "Web application firewall", "Parameterized queries", "Output encoding"], "correct_index": 2, "explanation": "Parameterized queries (prepared statements) are the PRIMARY defense against SQL injection because they separate SQL code from data, making injection impossible. Input validation and WAFs provide additional layers but are not sufficient alone."},
{"question": "What does SAST analyze?", "options": ["Running application behavior", "Network traffic patterns", "Source code without executing it", "Third-party library vulnerabilities"], "correct_index": 2, "explanation": "SAST (Static Application Security Testing) analyzes source code, bytecode, or binaries WITHOUT executing the application. It finds code-level vulnerabilities like SQL injection patterns, buffer overflows, and hardcoded credentials. DAST tests the running application, and SCA checks third-party dependencies."}]',
'[]', 1);

-- ============================================================================
-- SEED DATA: QUESTIONS (120+ across all 8 domains)
-- ============================================================================

DO $$
DECLARE
  -- Domain 1: Security and Risk Management
  v_topic_cia UUID;
  v_topic_risk UUID;
  v_topic_governance UUID;
  v_topic_bcp UUID;
  v_topic_legal UUID;
  -- Domain 2: Asset Security
  v_topic_classification UUID;
  v_topic_lifecycle UUID;
  v_topic_data_protection UUID;
  v_topic_privacy UUID;
  v_topic_asset_mgmt UUID;
  -- Domain 3: Security Architecture and Engineering
  v_topic_models UUID;
  v_topic_crypto UUID;
  v_topic_design UUID;
  v_topic_pki UUID;
  v_topic_physical UUID;
  -- Domain 4: Communication and Network Security
  v_topic_osi UUID;
  v_topic_net_attacks UUID;
  v_topic_firewalls UUID;
  v_topic_vpn UUID;
  v_topic_wireless UUID;
  -- Domain 5: Identity and Access Management
  v_topic_authn UUID;
  v_topic_access_models UUID;
  v_topic_sso UUID;
  v_topic_privilege UUID;
  v_topic_identity_lifecycle UUID;
  -- Domain 6: Security Assessment and Testing
  v_topic_vuln UUID;
  v_topic_pentest UUID;
  v_topic_audit UUID;
  v_topic_logging UUID;
  v_topic_metrics UUID;
  -- Domain 7: Security Operations
  v_topic_ir UUID;
  v_topic_dr UUID;
  v_topic_change UUID;
  v_topic_forensics UUID;
  v_topic_soc UUID;
  -- Domain 8: Software Development Security
  v_topic_sdlc UUID;
  v_topic_owasp UUID;
  v_topic_secure_coding UUID;
  v_topic_app_testing UUID;
  v_topic_db_security UUID;
BEGIN
  -- Fetch topic IDs by title
  SELECT id INTO v_topic_cia FROM public.library_topics WHERE title = 'CIA Triad' LIMIT 1;
  SELECT id INTO v_topic_risk FROM public.library_topics WHERE title = 'Risk Management Frameworks' LIMIT 1;
  SELECT id INTO v_topic_governance FROM public.library_topics WHERE title = 'Security Governance and Policies' LIMIT 1;
  SELECT id INTO v_topic_bcp FROM public.library_topics WHERE title = 'Business Continuity Planning' LIMIT 1;
  SELECT id INTO v_topic_legal FROM public.library_topics WHERE title = 'Legal and Compliance' LIMIT 1;

  SELECT id INTO v_topic_classification FROM public.library_topics WHERE title = 'Data Classification' LIMIT 1;
  SELECT id INTO v_topic_lifecycle FROM public.library_topics WHERE title = 'Data Lifecycle and States' LIMIT 1;
  SELECT id INTO v_topic_data_protection FROM public.library_topics WHERE title = 'Data Protection Controls' LIMIT 1;
  SELECT id INTO v_topic_privacy FROM public.library_topics WHERE title = 'Privacy and Data Handling' LIMIT 1;
  SELECT id INTO v_topic_asset_mgmt FROM public.library_topics WHERE title = 'Asset Management and Retention' LIMIT 1;

  SELECT id INTO v_topic_models FROM public.library_topics WHERE title = 'Security Models' LIMIT 1;
  SELECT id INTO v_topic_crypto FROM public.library_topics WHERE title = 'Cryptography Fundamentals' LIMIT 1;
  SELECT id INTO v_topic_design FROM public.library_topics WHERE title = 'Secure Design Principles' LIMIT 1;
  SELECT id INTO v_topic_pki FROM public.library_topics WHERE title = 'PKI and Certificate Management' LIMIT 1;
  SELECT id INTO v_topic_physical FROM public.library_topics WHERE title = 'Physical Security' LIMIT 1;

  SELECT id INTO v_topic_osi FROM public.library_topics WHERE title = 'OSI and TCP/IP Models' LIMIT 1;
  SELECT id INTO v_topic_net_attacks FROM public.library_topics WHERE title = 'Network Attacks and Countermeasures' LIMIT 1;
  SELECT id INTO v_topic_firewalls FROM public.library_topics WHERE title = 'Firewalls and Network Devices' LIMIT 1;
  SELECT id INTO v_topic_vpn FROM public.library_topics WHERE title = 'VPNs and Secure Communication' LIMIT 1;
  SELECT id INTO v_topic_wireless FROM public.library_topics WHERE title = 'Wireless Security' LIMIT 1;

  SELECT id INTO v_topic_authn FROM public.library_topics WHERE title = 'Authentication Factors and Methods' LIMIT 1;
  SELECT id INTO v_topic_access_models FROM public.library_topics WHERE title = 'Access Control Models' LIMIT 1;
  SELECT id INTO v_topic_sso FROM public.library_topics WHERE title = 'Single Sign-On and Federation' LIMIT 1;
  SELECT id INTO v_topic_privilege FROM public.library_topics WHERE title = 'Privilege Management' LIMIT 1;
  SELECT id INTO v_topic_identity_lifecycle FROM public.library_topics WHERE title = 'Identity Lifecycle' LIMIT 1;

  SELECT id INTO v_topic_vuln FROM public.library_topics WHERE title = 'Vulnerability Assessments' LIMIT 1;
  SELECT id INTO v_topic_pentest FROM public.library_topics WHERE title = 'Penetration Testing' LIMIT 1;
  SELECT id INTO v_topic_audit FROM public.library_topics WHERE title = 'Security Auditing' LIMIT 1;
  SELECT id INTO v_topic_logging FROM public.library_topics WHERE title = 'Log Management and Monitoring' LIMIT 1;
  SELECT id INTO v_topic_metrics FROM public.library_topics WHERE title = 'Security Metrics and KPIs' LIMIT 1;

  SELECT id INTO v_topic_ir FROM public.library_topics WHERE title = 'Incident Response Process' LIMIT 1;
  SELECT id INTO v_topic_dr FROM public.library_topics WHERE title = 'Disaster Recovery' LIMIT 1;
  SELECT id INTO v_topic_change FROM public.library_topics WHERE title = 'Change and Configuration Management' LIMIT 1;
  SELECT id INTO v_topic_forensics FROM public.library_topics WHERE title = 'Digital Forensics' LIMIT 1;
  SELECT id INTO v_topic_soc FROM public.library_topics WHERE title = 'Security Operations Center' LIMIT 1;

  SELECT id INTO v_topic_sdlc FROM public.library_topics WHERE title = 'SDLC Security' LIMIT 1;
  SELECT id INTO v_topic_owasp FROM public.library_topics WHERE title = 'OWASP Top 10' LIMIT 1;
  SELECT id INTO v_topic_secure_coding FROM public.library_topics WHERE title = 'Secure Coding Practices' LIMIT 1;
  SELECT id INTO v_topic_app_testing FROM public.library_topics WHERE title = 'Application Security Testing' LIMIT 1;
  SELECT id INTO v_topic_db_security FROM public.library_topics WHERE title = 'Database Security' LIMIT 1;

  -- ========================================================================
  -- DOMAIN 1: Security and Risk Management (15 questions)
  -- ========================================================================
  INSERT INTO public.questions (domain_id, difficulty, question_text, options, correct_index, explanation, story_context, bloom_level, mnemonic_hint, library_topic_id) VALUES

  (1, 'medium', 'A security analyst discovers that a critical financial database has been modified by an unauthorized process. The data has been changed but the system remains fully operational. Which element of the CIA triad has been PRIMARILY compromised?',
  '["Confidentiality", "Integrity", "Availability", "Non-repudiation"]',
  1,
  'Integrity has been compromised because the data was modified without authorization. Confidentiality would involve unauthorized viewing of data. Availability is intact since the system is operational. Non-repudiation is an accountability concept, not a CIA triad element.',
  '_During the Nexus HQ breach investigation, the team discovers altered transaction records..._',
  'apply', 'CIA = Can I Access? Integrity = "Can I TRUST it?" If data is changed without authorization, integrity is gone.', v_topic_cia),

  (1, 'easy', 'Which of the following BEST describes the purpose of a security policy?',
  '["To provide step-by-step technical instructions for system hardening", "To define management''s intent for protecting organizational assets", "To list all firewall rules and network configurations", "To document the results of a recent penetration test"]',
  1,
  'A security policy defines management''s intent and direction for protecting assets. It is a high-level document. Technical instructions belong in procedures. Firewall rules belong in configuration documents. Pen test results belong in assessment reports.',
  NULL,
  'remember', 'Policies = Purpose and direction from management. Procedures = step-by-step "how to."', v_topic_governance),

  (1, 'hard', 'An organization calculates that a specific server has an asset value of $200,000, an exposure factor of 40% for a flood event, and the flood is expected to occur once every 5 years. What is the Annualized Loss Expectancy (ALE)?',
  '["$16,000", "$40,000", "$80,000", "$200,000"]',
  0,
  'SLE = Asset Value x Exposure Factor = $200,000 x 0.40 = $80,000. ARO = 1/5 = 0.2. ALE = SLE x ARO = $80,000 x 0.2 = $16,000. This means the organization should expect to lose $16,000 per year on average from flood damage to this server.',
  '_Agent Cipher calculates the financial impact of threats to the Nexus data center..._',
  'apply', 'ALE = ARO x SLE. "Annual Loss Expected = Annual Rate x Single Loss." Always calculate SLE first, then multiply by how often it happens.', v_topic_risk),

  (1, 'medium', 'During a BIA, the team determines that the order processing system must be restored within 4 hours after a disruption, and no more than 1 hour of transaction data can be lost. Which statement is correct?',
  '["The RTO is 1 hour and the RPO is 4 hours", "The RTO is 4 hours and the RPO is 1 hour", "The MTD is 4 hours and the RTO is 1 hour", "The RPO is 4 hours and the MTD is 1 hour"]',
  1,
  'RTO (Recovery Time Objective) is the maximum acceptable downtime: 4 hours. RPO (Recovery Point Objective) is the maximum acceptable data loss: 1 hour. MTD (Maximum Tolerable Downtime) is always greater than or equal to RTO. These are commonly confused on the exam.',
  NULL,
  'apply', 'RTO = Recovery TIME (how long down). RPO = Recovery POINT (how much data lost). RPO drives backup frequency.', v_topic_bcp),

  (1, 'hard', 'A multinational company processes payment card data in the EU and stores customer records in the US. Which compliance requirement would MOST likely require the organization to appoint a Data Protection Officer?',
  '["PCI DSS", "HIPAA", "GDPR", "SOX"]',
  2,
  'GDPR (General Data Protection Regulation) requires organizations that process EU personal data at scale to appoint a Data Protection Officer (DPO). PCI DSS requires a security program but not specifically a DPO. HIPAA requires a Privacy Officer (different role). SOX deals with financial reporting, not data protection officers.',
  '_The investigation reveals the Shadow Protocol operatives exploited cross-border data handling gaps..._',
  'analyze', 'GDPR = EU data protection, requires DPO. HIPAA = US health data, requires Privacy Officer. PCI DSS = payment cards. SOX = financial reporting.', v_topic_legal),

  (1, 'easy', 'What is the PRIMARY purpose of separation of duties?',
  '["To improve operational efficiency", "To prevent any single individual from completing a critical task alone", "To ensure all employees receive cross-training", "To reduce the number of administrators needed"]',
  1,
  'Separation of duties prevents fraud and errors by ensuring no single person can complete a critical action alone. It requires collusion between two or more people to commit fraud. It may actually reduce efficiency but improves security. It is not primarily about training or headcount.',
  NULL,
  'remember', 'Separation of Duties = "Two keys to launch the missile." No one person can do it all.', v_topic_governance),

  (1, 'medium', 'An organization decides to purchase cyber insurance to address the risk of a data breach. This is an example of which risk response strategy?',
  '["Risk avoidance", "Risk mitigation", "Risk transference", "Risk acceptance"]',
  2,
  'Risk transference (transfer) shifts the financial impact of a risk to a third party, typically through insurance or contractual clauses. The risk still exists, but the financial burden is shared or moved. Avoidance eliminates the activity. Mitigation reduces likelihood or impact. Acceptance takes no action.',
  '_Nexus HQ evaluates their options after the initial breach assessment..._',
  'understand', 'Transfer = "Give the financial pain to someone else." Insurance and contracts are classic transfer mechanisms.', v_topic_risk),

  (1, 'hard', 'Which of the following is the MOST important consideration when developing a Business Continuity Plan?',
  '["Ensuring all IT systems have redundant hardware", "Obtaining senior management support and sponsorship", "Selecting the best hot site vendor", "Documenting all technical recovery procedures"]',
  1,
  'Senior management support is the MOST important factor in BCP success because it ensures funding, authority, and organizational commitment. Without executive sponsorship, BCPs fail regardless of technical quality. Hardware redundancy, site selection, and documentation are all important but secondary to management support.',
  NULL,
  'analyze', 'BCP golden rule: "Management support FIRST, everything else follows." No executive buy-in = no budget = no program.', v_topic_bcp),

  (1, 'easy', 'Which of the following BEST describes the concept of due diligence?',
  '["Implementing security controls after a risk assessment", "Conducting research and investigation before making decisions", "Following established procedures and standards daily", "Purchasing insurance to transfer risk"]',
  1,
  'Due diligence is the act of investigating and understanding risks before making decisions (the research phase). Due care is the ongoing practice of implementing and maintaining appropriate controls (the action phase). Due diligence = "do your homework." Due care = "do the right thing."',
  NULL,
  'remember', 'Due DILIGENCE = Do your homework (research). Due CARE = Carry out the right actions (implement).', v_topic_governance),

  (1, 'medium', 'A company wants to ensure that its BCP addresses the scenario where its primary office building becomes permanently inaccessible. Which BCP component BEST addresses this concern?',
  '["Vital records program", "Occupant emergency plan", "Crisis communication plan", "Facility recovery strategy"]',
  3,
  'A facility recovery strategy addresses alternative work locations when the primary facility is unavailable. The vital records program protects critical documents. The occupant emergency plan addresses immediate life safety. The crisis communication plan handles stakeholder notification. Permanent loss of a building requires a facility strategy.',
  '_After the Singapore data center was compromised, the team activates their facility recovery plan..._',
  'apply', 'Facility recovery = where do we GO? Vital records = what do we SAVE? Crisis comms = who do we TELL?', v_topic_bcp),

  (1, 'hard', 'Under the GDPR, a data controller discovers a personal data breach that is likely to result in a high risk to individuals. Within what timeframe must affected individuals be notified?',
  '["Within 24 hours of discovery", "Within 72 hours of becoming aware", "Without undue delay after notifying the supervisory authority", "Within 30 days of the breach"]',
  2,
  'Under GDPR, when a breach poses high risk to individuals, they must be notified "without undue delay" after the supervisory authority is notified. The 72-hour requirement applies to notifying the supervisory authority, not the individuals directly. There is no specific 24-hour or 30-day requirement for individual notification.',
  NULL,
  'analyze', 'GDPR breach notification: 72 hours to AUTHORITY, "without undue delay" to INDIVIDUALS (when high risk). Authority first, then people.', v_topic_legal),

  (1, 'medium', 'Which risk analysis approach assigns dollar values to assets and calculates expected losses using formulas like ALE = ARO x SLE?',
  '["Qualitative risk analysis", "Quantitative risk analysis", "Hybrid risk analysis", "Delphi risk analysis"]',
  1,
  'Quantitative risk analysis uses numerical values and financial formulas (ALE, SLE, ARO, EF). Qualitative uses subjective ratings (high/medium/low). Hybrid combines both. Delphi is a consensus technique used within either approach, not a type of risk analysis itself.',
  NULL,
  'remember', 'QuaNTitative = Numbers and dollar values. QuaLitative = Labels (high/medium/low). The N and L help you remember.', v_topic_risk),

  (1, 'easy', 'What is the PRIMARY goal of a security awareness training program?',
  '["To certify employees as security professionals", "To change employee behavior regarding security", "To satisfy the IT department requirements", "To teach employees how to configure firewalls"]',
  1,
  'The primary goal of security awareness training is to change employee behavior so they act more securely. It is not about certification, IT requirements, or technical training. Awareness programs aim to create a security-conscious culture where employees recognize and respond appropriately to threats.',
  NULL,
  'understand', 'Awareness training = change BEHAVIOR. Technical training = build SKILLS. Awareness is for everyone; technical training is for IT staff.', v_topic_governance),

  (1, 'hard', 'An organization operates in both the healthcare and financial sectors. When developing security policies, which approach BEST ensures comprehensive compliance?',
  '["Implement only the strictest regulation and ignore others", "Create separate security programs for each regulation", "Map controls to a unified framework that satisfies all applicable regulations", "Focus on the regulation with the highest penalties first"]',
  2,
  'Mapping controls to a unified framework (such as NIST or ISO 27001) that covers all applicable regulations is the most efficient and comprehensive approach. Implementing only the strictest may miss specific requirements of other regulations. Separate programs create inefficiency and gaps. Penalty-based prioritization ignores legal obligations.',
  '_The Nexus investigation reveals compliance gaps across multiple jurisdictions..._',
  'analyze', 'Unified framework approach: "One framework to map them all." Map HIPAA, PCI DSS, SOX, etc. to common controls. Reduces duplication, ensures coverage.', v_topic_legal),

  (1, 'medium', 'Which type of law is PRIMARILY concerned with the relationship between individuals and organizations, such as contract disputes and negligence claims?',
  '["Criminal law", "Civil law", "Administrative law", "Regulatory law"]',
  1,
  'Civil law governs relationships between individuals and organizations, including contracts, torts (negligence), and property disputes. Criminal law addresses offenses against society. Administrative law governs government agencies. Regulatory law (a subset of administrative) covers specific industry rules.',
  NULL,
  'understand', 'Civil = disputes between parties (money damages). Criminal = offenses against society (jail time). "Civil suits seek settlements."', v_topic_legal),

  -- ========================================================================
  -- DOMAIN 2: Asset Security (15 questions)
  -- ========================================================================

  (2, 'easy', 'In a data classification scheme, who is PRIMARILY responsible for determining the classification level of information?',
  '["The IT security team", "The data custodian", "The data owner", "The system administrator"]',
  2,
  'The data owner (typically a business executive or manager) is responsible for classifying data. The data custodian (IT) implements controls based on the classification. System administrators maintain systems. The security team advises but does not classify data.',
  NULL,
  'remember', 'Owner = CLASSIFIES. Custodian = CARES for it. User = COMPLIES with rules. "OCU = Owner Commands, Custodian Upholds."', v_topic_classification),

  (2, 'medium', 'A company is decommissioning old hard drives that contained top-secret government data. Which data destruction method provides the MOST assurance that data cannot be recovered?',
  '["Degaussing", "Overwriting with three passes", "Physical destruction (shredding)", "Cryptographic erasure"]',
  2,
  'Physical destruction (shredding, incineration, pulverizing) provides the highest assurance because the media is completely destroyed. Degaussing works on magnetic media but can fail if not properly executed. Overwriting may leave residual data. Cryptographic erasure depends on the encryption implementation. For top-secret data, physical destruction is the standard.',
  '_The team discovers improperly decommissioned drives at a Shadow Protocol facility..._',
  'apply', 'For the highest classification: destroy it physically. "When in doubt, shred it out." Physical destruction is the only method that eliminates ALL doubt.', v_topic_asset_mgmt),

  (2, 'hard', 'An organization stores sensitive data in a cloud environment. The cloud provider encrypts data at rest using its own managed keys. A security architect argues this is insufficient. What is the MOST valid concern?',
  '["Cloud encryption algorithms are weaker than on-premises solutions", "The cloud provider controls the encryption keys and could theoretically access the data", "Encrypted data cannot be backed up properly in cloud environments", "Cloud encryption does not protect data in transit"]',
  1,
  'When the cloud provider manages the encryption keys, they have the theoretical ability to decrypt and access the data. This is a valid concern for highly sensitive data. Customer-managed keys (BYOK) or client-side encryption addresses this. Cloud encryption algorithms are typically strong (AES-256). Encrypted data can be backed up. Transit encryption is a separate control.',
  NULL,
  'analyze', 'Key management = who controls the keys controls the data. "He who holds the key holds the kingdom." BYOK gives YOU the control.', v_topic_data_protection),

  (2, 'easy', 'Which data state describes information being transmitted across a network?',
  '["Data at rest", "Data in transit", "Data in use", "Data in processing"]',
  1,
  'Data in transit (also called data in motion) is data being transmitted across a network. Data at rest is stored on a disk or media. Data in use is actively being processed in memory. Data in processing is not a standard CISSP term for data states.',
  NULL,
  'remember', 'Three data states: Rest (stored), Transit (moving), Use (in memory). "RTU = Rest, Transit, Use."', v_topic_lifecycle),

  (2, 'medium', 'A hospital needs to share patient records with a research institution for a clinical study. Under HIPAA, what MUST be done FIRST to the data before sharing?',
  '["Encrypt the data with AES-256", "De-identify or obtain patient authorization", "Sign a non-disclosure agreement", "Transfer the data using a VPN"]',
  1,
  'Under HIPAA, Protected Health Information (PHI) must be either de-identified (removing 18 specified identifiers) or the patient must provide authorization before sharing. Encryption, NDAs, and VPNs are security controls but do not address the legal requirement for authorization or de-identification.',
  '_The investigation uncovers unauthorized health data sharing between Nexus partner organizations..._',
  'apply', 'HIPAA sharing: "De-identify or get permission FIRST." Technical controls (encryption, VPN) protect the data but do not authorize the sharing.', v_topic_privacy),

  (2, 'hard', 'An organization is implementing a data loss prevention (DLP) solution. The security team wants to detect credit card numbers being sent via email. Which DLP detection method is MOST appropriate?',
  '["Exact data matching against a database of known card numbers", "Pattern matching using regular expressions for card number formats", "Digital watermarking of all documents containing financial data", "Statistical analysis of email traffic volume anomalies"]',
  1,
  'Pattern matching with regular expressions can identify credit card number formats (e.g., 16-digit patterns matching Luhn algorithm) across all emails efficiently. Exact data matching requires a database of all known numbers (impractical for card numbers). Watermarking requires pre-tagging documents. Statistical analysis detects volume anomalies, not specific data content.',
  NULL,
  'analyze', 'DLP detection methods: Pattern matching = known formats (SSN, CC#). Exact match = specific known data. Watermarking = tagged documents. Choose based on what you are looking for.', v_topic_data_protection),

  (2, 'medium', 'A company''s data retention policy requires financial records to be kept for 7 years. After 7 years, what should happen to these records?',
  '["They should be archived to long-term storage indefinitely", "They should be securely destroyed according to the disposal policy", "They should be reclassified as public information", "They should be transferred to the legal department"]',
  1,
  'After the retention period expires, data should be securely destroyed per the disposal policy. Keeping data beyond its retention period increases risk and storage costs without legal benefit. Data should never be reclassified just because it is old. The legal department does not automatically become the custodian.',
  NULL,
  'apply', 'Retention = keep it this long. Disposal = destroy it after. "Keep only what you must, destroy what you should." Overretention is a risk.', v_topic_asset_mgmt),

  (2, 'easy', 'Which of the following roles is responsible for the day-to-day implementation of data protection controls?',
  '["Data owner", "Data custodian", "Data processor", "Data subject"]',
  1,
  'The data custodian (typically IT operations) is responsible for the day-to-day implementation and maintenance of data protection controls. The data owner classifies and makes policy decisions. The data processor processes data on behalf of the controller. The data subject is the individual whose data is being processed.',
  NULL,
  'remember', 'Custodian = "Caretaker." They implement backups, encryption, access controls on a daily basis. Owner decides; custodian does.', v_topic_classification),

  (2, 'hard', 'An organization is subject to both GDPR and CCPA. A customer in California who is also an EU citizen requests deletion of their personal data. Which regulation provides the BROADER right to erasure?',
  '["CCPA because it covers more types of data", "GDPR because it provides a comprehensive right to erasure with fewer exceptions", "Both provide identical erasure rights", "Neither provides a right to erasure"]',
  1,
  'GDPR''s "right to erasure" (Article 17) is broader than CCPA''s deletion right. GDPR covers more grounds for deletion and has fewer exceptions. CCPA''s right to delete has more exceptions (e.g., completing transactions, legal obligations, security). When both apply, the organization should generally follow the stricter requirement.',
  '_Cross-border data rights complicate the Shadow Protocol investigation..._',
  'analyze', 'When regulations overlap, apply the STRICTEST one. GDPR is generally stricter on data subject rights than CCPA. "GDPR = Gold standard for privacy rights."', v_topic_privacy),

  (2, 'medium', 'Which of the following BEST describes the concept of data remanence?',
  '["Data that remains in memory after an application closes", "Residual data left on storage media after deletion attempts", "Data that is duplicated across multiple backup systems", "Temporary data created during transaction processing"]',
  1,
  'Data remanence refers to residual data that remains on storage media after deletion or formatting attempts. Simple deletion only removes file pointers; the actual data remains. This is why secure destruction methods (overwriting, degaussing, physical destruction) are necessary for sensitive data.',
  NULL,
  'understand', 'Remanence = "Remains." Data ghosts linger on media after deletion. Simple delete = remove the signpost, not the destination.', v_topic_lifecycle),

  (2, 'easy', 'Which data classification level in a government scheme would apply to information whose disclosure could cause "exceptionally grave damage" to national security?',
  '["Confidential", "Secret", "Top Secret", "Unclassified"]',
  2,
  'Top Secret applies to information whose unauthorized disclosure could cause "exceptionally grave damage" to national security. Secret = "serious damage." Confidential = "damage." Unclassified = no damage to national security. The exam tests these specific damage descriptions.',
  NULL,
  'remember', 'Government classification damage levels: Top Secret = Exceptionally Grave, Secret = Serious, Confidential = just Damage. "TSC = Terrible, Serious, Concerning."', v_topic_classification),

  (2, 'medium', 'An organization wants to ensure that deleted data on SSDs cannot be recovered. Degaussing is proposed as the solution. Why is this approach INEFFECTIVE?',
  '["Degaussing is too expensive for SSDs", "SSDs use flash memory which is not affected by magnetic fields", "Degaussing only works on optical media", "SSDs automatically overwrite deleted data"]',
  1,
  'SSDs store data using electrical charges in flash memory cells, not magnetic patterns. Degaussing uses strong magnetic fields to disrupt magnetic storage and has zero effect on flash memory. For SSDs, cryptographic erasure or physical destruction are appropriate methods. SSDs do not automatically overwrite deleted data.',
  '_The forensics team finds intact data on "degaussed" SSDs at a compromised site..._',
  'understand', 'Degaussing = magnetic destruction. SSDs = not magnetic. "You cannot erase a whiteboard with a magnet." Use crypto-erase or physical destruction for SSDs.', v_topic_asset_mgmt),

  (2, 'hard', 'A multinational corporation is implementing a privacy program. The legal team requires that personal data collected in the EU can only be transferred to countries with "adequate" data protection. Which legal mechanism would BEST allow transfers to a country without an adequacy decision?',
  '["Binding Corporate Rules (BCRs)", "Encrypting the data before transfer", "Anonymizing all transferred data", "Storing a copy in the EU before transferring"]',
  0,
  'Binding Corporate Rules (BCRs) are a GDPR-approved mechanism for transferring personal data from the EU to countries without adequacy decisions. They are internal rules adopted by multinational corporations for intra-group transfers. Encryption alone does not satisfy GDPR transfer requirements. Anonymized data is no longer personal data (so GDPR would not apply). Storing a copy in the EU does not authorize the transfer.',
  NULL,
  'analyze', 'GDPR cross-border transfers: Adequacy decision, BCRs, Standard Contractual Clauses (SCCs), or explicit consent. "ABC = Adequacy, BCRs, Contracts."', v_topic_privacy),

  (2, 'medium', 'Which of the following BEST ensures the integrity of data during long-term archival storage?',
  '["Encrypting the archived data with AES-256", "Creating cryptographic hashes of the data at the time of archival", "Storing the data on WORM (Write Once Read Many) media", "Compressing the data to reduce storage requirements"]',
  1,
  'Cryptographic hashes (like SHA-256) created at archival time allow verification that data has not been altered during storage. Encryption protects confidentiality, not integrity verification. WORM media prevents modification but does not detect corruption. Compression reduces size but does not ensure integrity. Hashes can be verified at any time to confirm data remains unchanged.',
  NULL,
  'apply', 'Hashes = integrity verification. Encryption = confidentiality. WORM = prevents intentional modification. For PROVING integrity, hashes are the answer.', v_topic_data_protection),

  (2, 'easy', 'What is the PRIMARY purpose of an asset inventory?',
  '["To calculate the organization''s net worth", "To know what assets exist so they can be properly protected", "To satisfy the finance department requirements", "To determine which assets to sell"]',
  1,
  'An asset inventory exists so the organization knows what assets it has in order to protect them appropriately. You cannot protect what you do not know about. While asset inventories support financial and compliance functions, the primary security purpose is enabling proper protection and classification.',
  NULL,
  'remember', 'Asset inventory: "You cannot protect what you do not know you have." Discovery first, protection second.', v_topic_asset_mgmt),

  -- ========================================================================
  -- DOMAIN 3: Security Architecture and Engineering (15 questions)
  -- ========================================================================

  (3, 'medium', 'A military organization needs to prevent classified information from being leaked to users with lower security clearances. Which security model BEST addresses this requirement?',
  '["Biba", "Clark-Wilson", "Bell-LaPadula", "Brewer-Nash (Chinese Wall)"]',
  2,
  'Bell-LaPadula (BLP) enforces confidentiality through "no read up" (Simple Security Property) and "no write down" (Star Property), preventing information leakage to lower classification levels. Biba addresses integrity. Clark-Wilson addresses commercial integrity with separation of duties. Brewer-Nash prevents conflicts of interest.',
  '_The Zurich facility uses military-grade access controls based on clearance levels..._',
  'apply', 'BLP = "Blocks Leaking of Protected info." No read UP, no write DOWN. Protects CONFIDENTIALITY. Think of a military hierarchy.', v_topic_models),

  (3, 'easy', 'What is the PRIMARY purpose of the principle of least privilege?',
  '["To simplify system administration", "To give users only the minimum access needed to perform their job", "To ensure all users have equal access", "To reduce the number of user accounts"]',
  1,
  'Least privilege ensures users receive only the minimum access necessary to perform their duties. This limits the damage that can be caused by accidents, errors, or malicious actions. It does not simplify administration (it may complicate it). It does not equalize or reduce access broadly.',
  NULL,
  'remember', 'Least Privilege = "Need to know, need to do." Only the minimum access required. Nothing more.', v_topic_design),

  (3, 'hard', 'An organization is choosing between AES-128 and AES-256 for encrypting classified data. The security architect notes that AES-128 provides adequate security for most purposes but the data will need protection for 30+ years. Which encryption strength should be recommended and why?',
  '["AES-128 because it is faster and currently unbreakable", "AES-256 because it provides a larger security margin against future cryptanalytic advances", "Either is acceptable since both AES variants are equally secure", "Neither, because symmetric encryption should not be used for long-term data protection"]',
  1,
  'AES-256 is recommended for long-term protection (30+ years) because it provides a larger security margin against future advances in computing power and cryptanalysis, including potential quantum computing threats. While AES-128 is currently secure, the longer key provides better future-proofing. Both use the same algorithm but AES-256 has a significantly larger key space.',
  '_The team must encrypt recovered evidence for long-term court proceedings..._',
  'analyze', 'Longer key = longer protection. AES-256 is future-proof. "When protecting for decades, pick the bigger lock." Quantum threats affect symmetric less, but bigger is still safer.', v_topic_crypto),

  (3, 'medium', 'Which security design principle states that a system should deny access by default and only grant access when explicitly permitted?',
  '["Defense in depth", "Fail secure", "Default deny", "Separation of duties"]',
  2,
  'Default deny (also called "deny by default" or "implicit deny") means that unless access is explicitly granted, it is denied. This is a fundamental security principle. Defense in depth uses multiple layers. Fail secure denies access when the system fails. Separation of duties divides critical functions among multiple people.',
  NULL,
  'understand', 'Default deny: "If the rules do not say yes, the answer is no." Whitelisting approach. Much safer than default allow.', v_topic_design),

  (3, 'easy', 'Which type of cryptography uses the same key for both encryption and decryption?',
  '["Asymmetric cryptography", "Symmetric cryptography", "Hashing", "Digital signatures"]',
  1,
  'Symmetric cryptography uses one shared key for both encryption and decryption (examples: AES, DES, 3DES). Asymmetric uses a key pair (public and private). Hashing is one-way and does not use keys for encryption. Digital signatures use asymmetric cryptography.',
  NULL,
  'remember', 'Symmetric = Same key. "S" for Same and Symmetric. Asymmetric = two different keys (public + private).', v_topic_crypto),

  (3, 'hard', 'An e-commerce company wants to implement a system where a transaction can only be processed if it passes through three stages: data entry by a clerk, validation by a supervisor, and execution by a separate operator. Which security model BEST supports this requirement?',
  '["Bell-LaPadula", "Biba", "Clark-Wilson", "Graham-Denning"]',
  2,
  'Clark-Wilson enforces integrity in commercial environments through well-formed transactions and separation of duties. It requires Constrained Data Items (CDIs) to be modified only by Transformation Procedures (TPs) and enforces separation of duties. The three-stage process with different roles is a classic Clark-Wilson implementation. BLP is for confidentiality. Biba is simpler integrity. Graham-Denning defines access control operations.',
  '_The Zurich bank''s transaction processing follows strict separation protocols..._',
  'analyze', 'Clark-Wilson = Commercial integrity with separation of duties. "CDIs + TPs + Separation = Clark-Wilson." For commerce and transactions, think Clark-Wilson.', v_topic_models),

  (3, 'medium', 'A user receives a digitally signed email. What can the recipient verify about the message?',
  '["Only that the message was encrypted during transit", "The identity of the sender and that the message was not altered", "Only that the message came from a trusted domain", "That no one else read the message"]',
  1,
  'A digital signature provides authentication (verifying the sender''s identity) and integrity (verifying the message was not altered). It does NOT provide confidentiality (the message is not encrypted by signing). Domain trust is verified by SPF/DKIM, which is different from digital signatures.',
  NULL,
  'apply', 'Digital signatures provide: Authentication + Integrity + Non-repudiation. They do NOT provide confidentiality. "Signing is not sealing."', v_topic_pki),

  (3, 'easy', 'What does a Certificate Authority (CA) do in a PKI system?',
  '["Encrypts all network traffic", "Issues and manages digital certificates", "Generates passwords for users", "Monitors network traffic for intrusions"]',
  1,
  'A Certificate Authority (CA) is a trusted third party that issues, manages, and revokes digital certificates. It binds public keys to identities. It does not encrypt traffic, generate passwords, or monitor networks. The CA is the foundation of trust in a PKI system.',
  NULL,
  'remember', 'CA = Certificate Authority = issues digital IDs. Like a government issuing passports. "CA = Certifies Authenticity."', v_topic_pki),

  (3, 'hard', 'An architect is designing a data center and must address the risk of electromagnetic emanations being intercepted by adversaries. Which countermeasure MOST directly addresses this threat?',
  '["Network segmentation with VLANs", "Full-disk encryption on all servers", "TEMPEST shielding and Faraday caging", "Multi-factor authentication for all access"]',
  2,
  'TEMPEST is the NSA/DoD specification for limiting electromagnetic emanations. Faraday cages block electromagnetic signals from escaping. This directly addresses the risk of eavesdropping on electromagnetic emissions. VLANs, encryption, and MFA address different threats (network, data, and access respectively).',
  '_The Zurich secure facility uses TEMPEST-certified equipment to prevent signal leakage..._',
  'apply', 'TEMPEST = protection against electromagnetic eavesdropping. Faraday cage = blocks signals in and out. For emanation security, think TEMPEST.', v_topic_physical),

  (3, 'medium', 'Which defense in depth layer would a Web Application Firewall (WAF) BEST represent?',
  '["Network layer", "Host layer", "Application layer", "Data layer"]',
  2,
  'A WAF operates at the application layer, inspecting HTTP/HTTPS traffic for attacks like SQL injection, XSS, and other web-specific threats. It sits in front of web applications and understands application-layer protocols. Network firewalls operate at the network layer. Host-based controls are on endpoints. Data-layer controls protect the data itself.',
  NULL,
  'understand', 'WAF = Web APPLICATION Firewall. It understands web traffic (HTTP). "WAF protects the App." Different from network firewalls that inspect packets.', v_topic_design),

  (3, 'medium', 'In asymmetric cryptography, which key should be used to encrypt a message that only the intended recipient can read?',
  '["The sender''s private key", "The sender''s public key", "The recipient''s private key", "The recipient''s public key"]',
  3,
  'To ensure only the recipient can read the message, encrypt with the recipient''s PUBLIC key. Only the recipient''s corresponding PRIVATE key can decrypt it. Encrypting with the sender''s private key would create a digital signature, not confidential encryption. You never encrypt with someone''s private key for confidentiality.',
  NULL,
  'apply', 'Encrypt with PUBLIC key of RECIPIENT = confidentiality. Sign with PRIVATE key of SENDER = authentication. "Public locks, private unlocks."', v_topic_crypto),

  (3, 'easy', 'What is the main purpose of a mantrap (security vestibule)?',
  '["To detect metal objects on personnel", "To prevent tailgating by allowing only one person through at a time", "To verify biometric identity of all visitors", "To record video of all entries"]',
  1,
  'A mantrap (now called a security vestibule) prevents tailgating/piggybacking by creating an airlock-style entry where only one person can pass through at a time. The first door must close before the second opens. While cameras and biometrics may be integrated, the primary purpose is preventing unauthorized physical entry.',
  NULL,
  'remember', 'Mantrap = "One in, one out." Prevents tailgating. Two doors, one person. Like an airlock on a spaceship.', v_topic_physical),

  (3, 'hard', 'A security architect must select a hashing algorithm for verifying the integrity of software updates distributed to millions of devices. The updates are not time-sensitive but must be protected against collision attacks. Which algorithm is MOST appropriate?',
  '["MD5", "SHA-1", "SHA-256", "CRC-32"]',
  2,
  'SHA-256 is the most appropriate because it is resistant to known collision attacks and widely supported. MD5 and SHA-1 are both vulnerable to collision attacks and should not be used for security purposes. CRC-32 is a checksum for error detection, not a cryptographic hash, and is trivially susceptible to collisions.',
  NULL,
  'analyze', 'Hash algorithm selection: MD5 and SHA-1 = broken (collision attacks found). SHA-256+ = current standard. CRC = not cryptographic. "If it matters, use SHA-256."', v_topic_crypto),

  (3, 'medium', 'Which secure design principle involves implementing multiple overlapping security controls so that if one fails, others continue to provide protection?',
  '["Least privilege", "Defense in depth", "Single point of failure elimination", "Security through obscurity"]',
  1,
  'Defense in depth (layered security) uses multiple overlapping controls so that failure of one does not compromise the entire system. Least privilege limits access. Single point of failure elimination is about availability, not layered security specifically. Security through obscurity is NOT a valid security principle.',
  NULL,
  'understand', 'Defense in depth = layers like an onion. "If the fence fails, the lock holds. If the lock fails, the alarm sounds." Multiple independent layers.', v_topic_design),

  (3, 'easy', 'Which of the following is an example of a detective physical security control?',
  '["A fence around the perimeter", "A CCTV surveillance camera", "A security guard at the entrance", "A locked door with a badge reader"]',
  1,
  'A CCTV camera is a detective control because it detects and records events for review. A fence is preventive (deters/blocks entry). A security guard can be both preventive and detective. A locked door with a badge reader is preventive (blocks unauthorized entry). The exam distinguishes between controls that prevent, detect, and correct.',
  NULL,
  'remember', 'Detective = DISCOVERS what happened. Preventive = STOPS it from happening. CCTV detects; locks prevent. "Cameras catch, locks block."', v_topic_physical),

  -- ========================================================================
  -- DOMAIN 4: Communication and Network Security (15 questions)
  -- ========================================================================

  (4, 'easy', 'At which layer of the OSI model does encryption via TLS/SSL primarily operate?',
  '["Layer 3 - Network", "Layer 4 - Transport", "Layer 5 - Session", "Layer 6 - Presentation"]',
  3,
  'TLS/SSL operates at the Presentation layer (Layer 6) of the OSI model, though it also has Session layer components. In practice, TLS sits between the Application and Transport layers. The exam typically associates TLS with Layer 6 (Presentation) because that layer handles encryption, compression, and data formatting.',
  NULL,
  'remember', 'Layer 6 = Presentation = encryption and formatting. "Present the data in a secure format." TLS makes data presentable (encrypted) before transmission.', v_topic_osi),

  (4, 'medium', 'A network administrator notices that a user''s ARP cache contains a MAC address that maps to the gateway IP but does not match the actual gateway''s MAC address. What type of attack is MOST likely occurring?',
  '["DNS poisoning", "ARP spoofing/poisoning", "DHCP starvation", "MAC flooding"]',
  1,
  'ARP spoofing (poisoning) occurs when an attacker sends fake ARP replies to map their MAC address to the gateway''s IP address, redirecting traffic through their system (man-in-the-middle). DNS poisoning targets name resolution. DHCP starvation exhausts available IP addresses. MAC flooding overwhelms switch CAM tables.',
  '_The Singapore network team detects suspicious ARP entries during the breach investigation..._',
  'apply', 'ARP spoofing = fake MAC-to-IP mapping. Attacker says "I am the gateway" to redirect traffic. Countermeasure: Dynamic ARP Inspection (DAI).', v_topic_net_attacks),

  (4, 'hard', 'An organization is deploying a next-generation firewall (NGFW). The security team wants to inspect encrypted HTTPS traffic for malware. What technique must the NGFW use, and what is the PRIMARY security concern with this approach?',
  '["Deep packet inspection; it increases network latency", "SSL/TLS inspection (break and inspect); it requires the firewall to act as a man-in-the-middle, which can introduce certificate trust issues", "Application-layer filtering; it cannot inspect encrypted traffic at all", "Stateful inspection; it may break encrypted sessions"]',
  1,
  'SSL/TLS inspection requires the NGFW to terminate the encrypted session, inspect the plaintext content, then re-encrypt it. This is essentially a controlled man-in-the-middle. The primary concern is certificate trust: clients must trust the firewall''s CA certificate, and some applications use certificate pinning which will break. Privacy and compliance concerns also arise.',
  NULL,
  'analyze', 'SSL inspection = NGFW breaks encryption to inspect, then re-encrypts. "Break and inspect." Concern: trust issues, privacy implications, certificate pinning breakage.', v_topic_firewalls),

  (4, 'easy', 'What is the PRIMARY difference between a hub and a switch?',
  '["A hub is faster than a switch", "A switch forwards traffic only to the intended destination port; a hub broadcasts to all ports", "A hub operates at Layer 3; a switch operates at Layer 2", "A switch requires IP addresses; a hub does not"]',
  1,
  'A switch forwards frames only to the port where the destination MAC address is located (using its CAM/MAC address table). A hub broadcasts all traffic to all ports, creating a shared collision domain. Switches are faster and more secure. Both operate at Layer 2 (Data Link), though hubs are sometimes described as Layer 1.',
  NULL,
  'remember', 'Hub = "shouts to everyone" (broadcast). Switch = "whispers to the right person" (unicast). Switches are smarter and more secure.', v_topic_osi),

  (4, 'medium', 'An organization connects two office locations using an IPsec VPN in tunnel mode. What does tunnel mode provide that transport mode does not?',
  '["Encryption of the payload data", "Authentication of the sender", "Encryption of the entire original IP packet including headers", "Faster throughput than transport mode"]',
  2,
  'IPsec tunnel mode encapsulates and encrypts the ENTIRE original IP packet (including the original IP headers) within a new IP packet. Transport mode only encrypts the payload, leaving the original IP headers exposed. Tunnel mode is used for site-to-site VPNs where hiding the internal IP addresses is important. Both modes provide authentication.',
  '_The secure communication tunnel between Singapore and London uses IPsec tunnel mode..._',
  'understand', 'Tunnel mode = hides EVERYTHING (new headers wrap the original). Transport mode = hides the PAYLOAD only. "Tunnel = Total coverage."', v_topic_vpn),

  (4, 'hard', 'A wireless network administrator discovers that an attacker has set up a rogue access point with the same SSID as the corporate network. Employees are unknowingly connecting to it. What is this attack called, and what is the BEST countermeasure?',
  '["Bluesnarfing; implement MAC filtering", "Evil twin attack; implement 802.1X authentication with server certificate validation", "War driving; hide the SSID", "Deauthentication attack; enable WPA3"]',
  1,
  'An evil twin is a rogue AP with the same SSID as a legitimate network. The best countermeasure is 802.1X (EAP-TLS) with server certificate validation, which allows clients to verify they are connecting to a legitimate AP. MAC filtering is easily bypassed. Hiding SSIDs provides no real security. WPA3 helps but does not prevent connecting to rogue APs without certificate validation.',
  '_A rogue access point is discovered near the Singapore field office broadcasting "NexusSecure"..._',
  'analyze', 'Evil twin = fake AP with same SSID. 802.1X with certificate validation = clients verify the AP is legitimate before connecting. "Trust but verify the access point."', v_topic_wireless),

  (4, 'medium', 'Which protocol provides both authentication and confidentiality in an IPsec implementation?',
  '["AH (Authentication Header) only", "ESP (Encapsulating Security Payload) only", "AH and ESP combined", "IKE (Internet Key Exchange) only"]',
  1,
  'ESP provides both authentication AND confidentiality (encryption). AH provides only authentication and integrity (no encryption). While AH and ESP can be combined, ESP alone provides both capabilities. IKE is used for key exchange and security association negotiation, not directly for data protection.',
  NULL,
  'understand', 'ESP = Encrypts + authenticates (does both). AH = Authenticates only (no encryption). "ESP = Encryption Security Protocol."', v_topic_vpn),

  (4, 'easy', 'What type of network attack overwhelms a target system with traffic to make it unavailable to legitimate users?',
  '["Man-in-the-middle", "Denial of Service (DoS)", "Session hijacking", "Replay attack"]',
  1,
  'A Denial of Service (DoS) attack overwhelms a target with excessive traffic or requests, making it unavailable to legitimate users. MITM intercepts communications. Session hijacking takes over an active session. Replay attacks retransmit captured authentication data.',
  NULL,
  'remember', 'DoS = "Deny Others Service." Overwhelm with traffic. DDoS = Distributed DoS (many sources). "Flood the restaurant so no one can eat."', v_topic_net_attacks),

  (4, 'hard', 'A company''s web application is accessible from the internet. The security architect proposes placing the web server in a DMZ. Which network configuration BEST implements this?',
  '["Web server on the internal network with a NAT rule on the external firewall", "Web server between two firewalls: one facing the internet, one facing the internal network", "Web server on the same subnet as the database server with a single firewall", "Web server connected directly to the internet with host-based firewall only"]',
  1,
  'A proper DMZ places the web server between two firewalls (or two interfaces of one firewall): an external firewall filtering internet traffic and an internal firewall protecting the internal network. This provides defense in depth. NAT alone is insufficient. Placing web and database servers together increases risk. A host-based firewall alone lacks network-level protection.',
  '_The Nexus web portal was compromised because the DMZ was improperly configured..._',
  'apply', 'DMZ = "De-Militarized Zone" between two firewalls. External firewall controls internet access. Internal firewall protects the core network. "Two walls, one zone."', v_topic_firewalls),

  (4, 'medium', 'WPA3 introduced Simultaneous Authentication of Equals (SAE) to replace WPA2''s four-way handshake vulnerability. What specific attack does SAE PRIMARILY prevent?',
  '["Evil twin attacks", "Deauthentication attacks", "Offline dictionary attacks against the Wi-Fi password", "Rogue DHCP server attacks"]',
  2,
  'SAE (also known as Dragonfly) in WPA3 prevents offline dictionary attacks that were possible against WPA2-PSK''s four-way handshake (the KRACK vulnerability area). With WPA2, an attacker could capture the handshake and brute-force the password offline. SAE uses a zero-knowledge proof that does not expose password-derived data for offline attack.',
  NULL,
  'apply', 'WPA3-SAE = "Stops offline password cracking." Each session generates unique keys even with the same password. Replacement for WPA2''s vulnerable 4-way handshake.', v_topic_wireless),

  (4, 'easy', 'Which device operates at Layer 3 of the OSI model and makes forwarding decisions based on IP addresses?',
  '["Hub", "Switch", "Router", "Bridge"]',
  2,
  'Routers operate at Layer 3 (Network layer) and make forwarding decisions based on IP addresses. Hubs operate at Layer 1 (Physical). Switches operate at Layer 2 (Data Link) using MAC addresses. Bridges also operate at Layer 2.',
  NULL,
  'remember', 'Layer 1 = Hub. Layer 2 = Switch/Bridge. Layer 3 = Router. "Hubs are dumb, switches are smart, routers are smarter."', v_topic_osi),

  (4, 'medium', 'An IDS has been generating many alerts for a particular attack signature, but investigation reveals these are all legitimate business traffic. What should the security team do FIRST?',
  '["Disable the IDS to stop the alerts", "Tune the IDS rule to reduce false positives", "Switch from signature-based to anomaly-based detection", "Ignore the alerts since they are false positives"]',
  1,
  'The FIRST action should be to tune the IDS rule to reduce false positives while maintaining detection capability. Disabling the IDS removes all protection. Switching detection methods is a larger architectural change, not the first step. Ignoring alerts leads to alert fatigue and missed real incidents.',
  '_The SOC team is overwhelmed by false positives from the Singapore network sensors..._',
  'apply', 'False positives = tune the rules. "Calibrate, do not eliminate." Alert fatigue is dangerous because real attacks get buried in noise.', v_topic_firewalls),

  (4, 'hard', 'An organization discovers that DNS queries from internal hosts are being redirected to a malicious DNS server. The attacker modified DNS records in the local resolver cache. Which attack is this, and what is the MOST effective prevention?',
  '["DNS amplification; implement rate limiting", "DNS cache poisoning; implement DNSSEC", "DNS tunneling; block outbound DNS to external servers", "DNS hijacking; change to a different DNS provider"]',
  1,
  'DNS cache poisoning inserts fraudulent DNS records into a resolver''s cache, redirecting users to malicious sites. DNSSEC (Domain Name System Security Extensions) is the most effective prevention because it digitally signs DNS records, allowing resolvers to verify their authenticity. DNS amplification is a DDoS technique. DNS tunneling exfiltrates data via DNS. DNS hijacking targets the authoritative DNS.',
  NULL,
  'analyze', 'DNS poisoning = fake records in cache. DNSSEC = digital signatures on DNS records to verify authenticity. "DNSSEC = DNS with a seal of authenticity."', v_topic_net_attacks),

  (4, 'medium', 'What is the PRIMARY security benefit of network segmentation?',
  '["Improved network performance and throughput", "Reduced hardware costs", "Limiting the blast radius of a security breach", "Simplified network administration"]',
  2,
  'Network segmentation limits the blast radius (impact) of a breach by containing threats within network segments. If one segment is compromised, others remain protected. While segmentation can improve performance and help administration, the PRIMARY security benefit is containment and breach impact reduction.',
  NULL,
  'understand', 'Segmentation = "Contain the fire to one room." Breach in one segment does not spread to others. Microsegmentation takes this further at the workload level.', v_topic_firewalls),

  (4, 'easy', 'Which wireless security protocol is currently considered the MOST secure for enterprise Wi-Fi networks?',
  '["WEP", "WPA", "WPA2-Enterprise", "WPA3-Enterprise"]',
  3,
  'WPA3-Enterprise is the most secure wireless protocol currently available, offering 192-bit security, SAE key exchange, and mandatory Protected Management Frames. WEP is completely broken. WPA has known vulnerabilities. WPA2-Enterprise is still acceptable but WPA3 is the current gold standard.',
  NULL,
  'remember', 'Wireless security evolution: WEP (broken) → WPA (better) → WPA2 (good) → WPA3 (best). "Each generation fixes the last one''s flaws."', v_topic_wireless),

  -- ========================================================================
  -- DOMAIN 5: Identity and Access Management (15 questions)
  -- ========================================================================

  (5, 'easy', 'A user logs in with a password and then must enter a code from a hardware token. How many authentication factors are being used?',
  '["One factor", "Two factors", "Three factors", "Four factors"]',
  1,
  'Two factors: something you KNOW (password) and something you HAVE (hardware token). Multi-factor authentication requires at least two DIFFERENT categories. A password and PIN would be single-factor (both "know"). The hardware token is a separate factor category from the password.',
  NULL,
  'remember', 'Three factor types: Know (password/PIN), Have (token/phone), Are (biometric). MFA = at least 2 DIFFERENT types. "Know + Have = Two Factors."', v_topic_authn),

  (5, 'medium', 'An organization uses role-based access control (RBAC). A developer is temporarily assigned to also work on the security audit team. Under RBAC, how should this be handled?',
  '["Create a new combined role with both sets of permissions", "Assign the developer an additional role for the audit team", "Give the developer individual permissions for audit tasks", "Change the developer''s existing role to include audit permissions"]',
  1,
  'In RBAC, users are assigned roles, and roles have permissions. A user can hold multiple roles simultaneously. Assigning an additional role is the cleanest RBAC approach. Creating a combined role defeats the purpose of role-based separation. Individual permissions bypass RBAC. Changing the existing role would affect all developers.',
  '_The London IAM team must manage cross-functional assignments during the investigation..._',
  'apply', 'RBAC = roles assigned to users, permissions assigned to roles. Users can have MULTIPLE roles. "Add a hat, do not redesign the wardrobe."', v_topic_access_models),

  (5, 'hard', 'A cloud-based application uses SAML 2.0 for single sign-on. A security auditor asks how replay attacks are prevented in the SAML assertion flow. What is the BEST answer?',
  '["SAML assertions are encrypted with the recipient''s public key", "SAML assertions include a timestamp and conditions with NotBefore and NotOnOrAfter attributes that limit the assertion''s validity window", "SAML uses Kerberos tickets to prevent replay", "SAML assertions are hashed to detect tampering"]',
  1,
  'SAML assertions include time-based conditions (NotBefore and NotOnOrAfter) that define a validity window, preventing replay attacks outside that window. Combined with unique assertion IDs that Service Providers track (preventing reuse within the window), this mitigates replay attacks. Encryption protects confidentiality. Kerberos is a separate protocol. Hashing alone does not prevent replay.',
  NULL,
  'analyze', 'SAML anti-replay: time-limited assertions + unique IDs. "Assertions expire like milk — use before the date or it is no good." NotBefore/NotOnOrAfter are the key attributes.', v_topic_sso),

  (5, 'easy', 'Which access control model allows the OWNER of a resource to determine who can access it?',
  '["Mandatory Access Control (MAC)", "Discretionary Access Control (DAC)", "Role-Based Access Control (RBAC)", "Attribute-Based Access Control (ABAC)"]',
  1,
  'DAC allows the resource owner to decide who has access. It is the most flexible but least centrally controlled model. MAC uses system-enforced labels. RBAC uses organizational roles. ABAC uses attributes and policies. DAC is the default in most operating systems (file owners set permissions).',
  NULL,
  'remember', 'DAC = "Dad Allows Children" — the owner decides. MAC = "Military Assigns Clearances" — the system decides. Owner control = DAC.', v_topic_access_models),

  (5, 'medium', 'An organization implements a privileged access management (PAM) solution. Which feature is MOST important for reducing the risk of compromised privileged accounts?',
  '["Password complexity requirements for privileged accounts", "Just-in-time (JIT) privilege elevation with automatic expiration", "Monthly review of privileged account activity logs", "Restricting privileged accounts to specific workstations"]',
  1,
  'Just-in-time (JIT) privilege elevation grants elevated access only when needed and automatically revokes it after a defined period. This minimizes the window of opportunity for attackers. Password complexity helps but does not limit exposure time. Monthly log reviews are too infrequent. Workstation restrictions help but do not address temporal exposure.',
  '_The insider threat at London HQ exploited a permanently elevated admin account..._',
  'apply', 'JIT = "Just In Time, then it is gone." Minimize standing privileges. Less time elevated = less time vulnerable. "Elevate, use, expire."', v_topic_privilege),

  (5, 'hard', 'OAuth 2.0 and OpenID Connect (OIDC) are often confused. What is the MOST accurate distinction between them?',
  '["OAuth 2.0 handles authentication; OIDC handles authorization", "OAuth 2.0 is an authorization framework; OIDC adds an authentication layer on top of OAuth 2.0", "OAuth 2.0 is for web applications; OIDC is for mobile applications", "OAuth 2.0 uses tokens; OIDC uses certificates"]',
  1,
  'OAuth 2.0 is an AUTHORIZATION framework (it determines what you can access, not who you are). OIDC adds an AUTHENTICATION layer on top of OAuth 2.0, providing identity verification via ID tokens. OIDC extends OAuth 2.0 — it does not replace it. Both use tokens. Both work across web and mobile.',
  NULL,
  'analyze', 'OAuth 2.0 = AUTHORIZATION ("what can you do?"). OIDC = AUTHENTICATION + authorization ("who are you?" built on OAuth). "OIDC = OAuth + ID."', v_topic_sso),

  (5, 'medium', 'Which biometric measurement has the LOWEST false acceptance rate (FAR) while maintaining practical usability?',
  '["Fingerprint scanning", "Iris scanning", "Voice recognition", "Facial recognition"]',
  1,
  'Iris scanning has the lowest FAR among common biometric methods due to the iris''s unique, stable, and complex patterns (over 200 unique features). It is also practical and non-intrusive. Retinal scanning has a similarly low FAR but is more intrusive. Fingerprint, voice, and facial recognition all have higher FAR.',
  NULL,
  'understand', 'Iris scanning = most accurate common biometric. "The iris is unique like a snowflake — even identical twins differ." Low FAR + practical = best balance.', v_topic_authn),

  (5, 'easy', 'What is the purpose of account lockout policies?',
  '["To prevent users from logging in during maintenance windows", "To disable accounts after a specified number of failed login attempts", "To automatically delete inactive user accounts", "To force password changes at regular intervals"]',
  1,
  'Account lockout policies disable an account temporarily after a specified number of consecutive failed login attempts. This mitigates brute-force and password guessing attacks. Maintenance lockouts, account deletion, and password rotation are separate controls.',
  NULL,
  'remember', 'Lockout = too many wrong tries = locked out. "Three strikes and you are out." Prevents brute-force attacks. Set a reasonable threshold (typically 3-5 attempts).', v_topic_authn),

  (5, 'medium', 'An employee leaves the organization. The security team disables their account but does not remove it for 90 days in case of legal holds. Which identity lifecycle phase does this represent?',
  '["Provisioning", "Maintenance", "De-provisioning", "Account review"]',
  2,
  'De-provisioning is the process of removing or disabling access when it is no longer needed. Disabling (rather than deleting) is a common de-provisioning approach that preserves the account for audit or legal purposes. Provisioning creates accounts. Maintenance manages ongoing changes. Account review is a periodic validation.',
  '_After the insider was identified, the London team follows strict off-boarding procedures..._',
  'apply', 'De-provisioning = disable IMMEDIATELY, delete LATER. "Disable on day one, delete when legal says so." Speed of disabling is critical to prevent ex-employee access.', v_topic_identity_lifecycle),

  (5, 'hard', 'A hospital implements ABAC for its electronic health records system. Which scenario demonstrates the UNIQUE advantage of ABAC over RBAC?',
  '["A nurse can access patient records based on their role as a nurse", "A doctor can access records only during their scheduled shift, for patients on their ward, from approved workstations", "An administrator can assign permissions to groups of users", "A pharmacist can view medication records but not lab results"]',
  1,
  'ABAC evaluates multiple attributes (user, resource, environment, action) to make access decisions. The doctor scenario combines role (doctor), time (scheduled shift), relationship (their patients), location (their ward), and device (approved workstations) — which is impossible with pure RBAC. RBAC can handle role-based restrictions but not dynamic contextual attributes.',
  NULL,
  'analyze', 'ABAC = Attribute-Based = considers WHO + WHAT + WHEN + WHERE + HOW. RBAC only considers WHO (role). "ABAC adds context to every access decision."', v_topic_access_models),

  (5, 'easy', 'Which SSO protocol is MOST commonly associated with enterprise Windows environments and uses "tickets" for authentication?',
  '["SAML", "OAuth", "Kerberos", "RADIUS"]',
  2,
  'Kerberos is the default authentication protocol in Active Directory/Windows enterprise environments. It uses Ticket Granting Tickets (TGTs) and service tickets issued by the Key Distribution Center (KDC). SAML is for web SSO. OAuth is for authorization delegation. RADIUS is for network access authentication.',
  NULL,
  'remember', 'Kerberos = "Key Distribution Center gives Tickets." Named after the three-headed dog (KDC has 3 parts). Windows Active Directory = Kerberos.', v_topic_sso),

  (5, 'medium', 'An organization discovers that a terminated contractor still has active VPN access three weeks after their last day. Which control failure does this PRIMARILY indicate?',
  '["Weak authentication mechanisms", "Insufficient access logging", "Failure in the identity lifecycle de-provisioning process", "Inadequate network segmentation"]',
  2,
  'This is a de-provisioning failure. The identity lifecycle should include timely removal of all access when employment ends. Active VPN access weeks after termination indicates the off-boarding process did not include VPN access revocation. Authentication, logging, and segmentation are separate concerns.',
  NULL,
  'apply', 'De-provisioning must cover ALL access points: network, VPN, cloud, physical, etc. "One missed door = total failure." Automate de-provisioning with HR triggers.', v_topic_identity_lifecycle),

  (5, 'hard', 'A security architect is evaluating whether to implement RADIUS or TACACS+ for network device authentication. Which statement BEST describes a key advantage of TACACS+ over RADIUS?',
  '["TACACS+ is faster because it uses UDP", "TACACS+ encrypts the entire packet payload, while RADIUS only encrypts the password", "TACACS+ is an open standard supported by all vendors", "TACACS+ combines authentication and authorization into a single process"]',
  1,
  'TACACS+ encrypts the entire body of the packet, providing better confidentiality than RADIUS which only encrypts the password field. TACACS+ uses TCP (not UDP — RADIUS uses UDP). TACACS+ is a Cisco-proprietary protocol, not an open standard. TACACS+ separates authentication, authorization, and accounting (AAA), which is an advantage for granular control.',
  NULL,
  'analyze', 'TACACS+ vs RADIUS: TACACS+ = TCP + full encryption + separates AAA. RADIUS = UDP + encrypts password only + combines auth+authz. "TACACS+ = Total encryption, TCP, separated AAA."', v_topic_authn),

  (5, 'medium', 'Which of the following BEST describes the principle of least privilege as applied to service accounts?',
  '["Service accounts should use the same credentials as the system administrator", "Service accounts should have only the specific permissions needed for their function", "Service accounts should be shared among multiple applications to simplify management", "Service accounts do not need password rotation since they are not used by humans"]',
  1,
  'Service accounts should follow least privilege just like user accounts, having only the permissions needed for their specific function. They should not share admin credentials, should not be shared across applications, and should have passwords rotated regularly (or use certificate-based authentication). Service accounts are often over-privileged and a prime attack target.',
  NULL,
  'apply', 'Service accounts: least privilege + unique per application + rotated credentials. "Every service gets its own minimal key." Over-privileged service accounts are a top attack vector.', v_topic_privilege),

  (5, 'medium', 'An organization is implementing a zero-trust architecture. Which principle is MOST fundamental to the zero-trust model?',
  '["Trust all internal network traffic by default", "Never trust, always verify every access request regardless of network location", "Grant permanent access based on initial strong authentication", "Rely on VPN connections to establish trust"]',
  1,
  'Zero trust operates on the principle of "never trust, always verify." Every access request must be authenticated and authorized regardless of whether it originates from inside or outside the network perimeter. This eliminates implicit trust based on network location. VPNs create trusted tunnels, which is the opposite of zero trust. Permanent access violates continuous verification.',
  '_The London office implements zero-trust after the insider breach proved perimeter trust was insufficient..._',
  'understand', 'Zero trust = "Never trust, always verify." No implicit trust based on location. Every request is authenticated. "The network perimeter is dead; identity is the new perimeter."', v_topic_access_models),

  -- ========================================================================
  -- DOMAIN 6: Security Assessment and Testing (15 questions)
  -- ========================================================================

  (6, 'easy', 'What is the PRIMARY difference between a vulnerability assessment and a penetration test?',
  '["Vulnerability assessments are automated; penetration tests are manual", "Vulnerability assessments identify weaknesses; penetration tests exploit them", "Vulnerability assessments are external; penetration tests are internal", "Vulnerability assessments require authorization; penetration tests do not"]',
  1,
  'Vulnerability assessments identify and classify weaknesses but do not exploit them. Penetration tests go further by actively exploiting vulnerabilities to determine actual impact. Both can be automated or manual. Both can be internal or external. Both require authorization.',
  NULL,
  'remember', 'Vulnerability assessment = "find the unlocked doors." Penetration test = "walk through them." Assessment identifies; pen test exploits.', v_topic_vuln),

  (6, 'medium', 'A security team performs a credentialed vulnerability scan and a non-credentialed scan on the same system. The credentialed scan finds significantly more vulnerabilities. Why?',
  '["Credentialed scans use more aggressive scanning techniques", "Credentialed scans can examine internal system configurations, patches, and software versions that are not visible externally", "Non-credentialed scans only check for network-level vulnerabilities", "Credentialed scans have access to the vulnerability database"]',
  1,
  'Credentialed (authenticated) scans log into the system and can examine internal configurations, installed patches, software versions, registry settings, and other details not visible from the outside. Non-credentialed scans can only probe externally visible services and make inferences. Both use the same vulnerability databases. Both check for similar vulnerability types.',
  '_The Tel Aviv team runs authenticated scans on compromised Nexus servers to assess the full damage..._',
  'understand', 'Credentialed scan = "full physical exam" (sees inside). Non-credentialed = "looking through the window" (sees outside only). Always more findings with credentials.', v_topic_vuln),

  (6, 'hard', 'During a penetration test, the tester discovers a SQL injection vulnerability that could expose the entire customer database. The rules of engagement state that data exfiltration is out of scope. What should the tester do?',
  '["Exploit the vulnerability to prove the full extent of the risk", "Document the finding with evidence of the vulnerability without extracting actual customer data", "Stop testing immediately and notify the client", "Ignore the finding since data exfiltration is out of scope"]',
  1,
  'The tester should document the vulnerability with evidence (such as demonstrating access to the database structure without extracting real data) while respecting the scope limitations. Exploiting beyond scope violates the rules of engagement. Stopping completely is excessive. Ignoring the finding would be negligent. The goal is to prove the risk without violating scope.',
  '_The testing team discovers a critical vulnerability but must stay within their authorized scope..._',
  'analyze', 'Rules of engagement are the law. "Prove the risk without breaking the rules." Document, demonstrate capability, do not exceed scope. Always follow the written authorization.', v_topic_pentest),

  (6, 'easy', 'What type of SOC report provides assurance about security controls over a period of time rather than at a single point?',
  '["SOC 1", "SOC 2 Type I", "SOC 2 Type II", "SOC 3"]',
  2,
  'SOC 2 Type II examines whether security controls operated effectively over a period of time (typically 6-12 months). Type I only assesses design at a single point in time. SOC 1 focuses on financial controls. SOC 3 is a general-use summary of SOC 2 findings.',
  NULL,
  'remember', 'SOC 2 Type I = "one Instance in time." SOC 2 Type II = "over a period of Time." Type II is more valuable because it proves controls actually WORK.', v_topic_audit),

  (6, 'medium', 'A SIEM generates an alert indicating a potential brute-force attack against a VPN endpoint. The SOC analyst reviews the logs and determines the activity is from a legitimate automated backup system with poor authentication retry logic. How should this event be classified?',
  '["True positive", "True negative", "False positive", "False negative"]',
  2,
  'This is a false positive: the SIEM correctly detected unusual authentication behavior, but the activity was legitimate (not an actual attack). A true positive correctly identifies an actual attack. A true negative correctly identifies normal activity. A false negative misses an actual attack.',
  '_The SOC War Room team triages hundreds of alerts, separating real threats from false alarms..._',
  'apply', 'False positive = alert fired but nothing bad happened. False NEGATIVE = missed a real attack (most dangerous). "False positive = crying wolf. False negative = wolf in sheep''s clothing."', v_topic_logging),

  (6, 'hard', 'An organization wants to measure the effectiveness of its security awareness program. Which metric would provide the MOST meaningful assessment?',
  '["Number of employees who completed training", "Percentage reduction in successful phishing simulation clicks over time", "Total training hours delivered per quarter", "Number of security awareness posters displayed"]',
  1,
  'Reduction in phishing click rates over time directly measures behavioral change, which is the goal of awareness programs. Completion counts and training hours measure participation, not effectiveness. Poster counts measure effort, not outcome. Behavioral metrics are always more meaningful than activity metrics.',
  NULL,
  'analyze', 'Effective metrics measure OUTCOMES, not ACTIVITIES. "Did behavior change?" matters more than "did they attend?" Phishing click rate directly measures awareness effectiveness.', v_topic_metrics),

  (6, 'medium', 'Which of the following is the MOST critical requirement before conducting a penetration test?',
  '["Having a vulnerability assessment completed first", "Obtaining written authorization from the system owner", "Purchasing cyber insurance", "Notifying all employees"]',
  1,
  'Written authorization is mandatory before any penetration test. Without it, the tester could face criminal charges for unauthorized access. Vulnerability assessments are helpful but not required first. Insurance is prudent but not the most critical requirement. Employee notification is not always necessary.',
  NULL,
  'remember', 'Pen testing golden rule: "Get it in writing or go to jail." Written authorization = legal protection. No authorization = criminal hacking, regardless of intent.', v_topic_pentest),

  (6, 'easy', 'What does MTTD measure in security operations?',
  '["Mean Time to Deploy patches", "Mean Time to Detect security incidents", "Mean Time to Destroy compromised data", "Mean Time to Document findings"]',
  1,
  'MTTD (Mean Time to Detect) measures the average time from when a security incident begins to when it is detected by the organization. Lower MTTD means faster detection. Combined with MTTR (Mean Time to Respond), these are the primary incident response effectiveness metrics.',
  NULL,
  'remember', 'MTTD = Mean Time to DETECT (how fast you find it). MTTR = Mean Time to RESPOND (how fast you fix it). Both should be as LOW as possible.', v_topic_metrics),

  (6, 'hard', 'An auditor is evaluating the organization''s security program against the Capability Maturity Model (CMM). The organization has documented security processes that are followed consistently, and they are beginning to collect metrics on process performance. What CMM level has the organization MOST likely achieved?',
  '["Level 2 - Repeatable", "Level 3 - Defined", "Level 4 - Managed", "Level 5 - Optimizing"]',
  1,
  'Level 3 (Defined) means processes are documented and standardized across the organization. They are beginning to collect metrics, which is the transition toward Level 4 (Managed), where processes are measured and controlled. Level 2 (Repeatable) has basic processes but they are not yet standardized. Level 5 (Optimizing) uses metrics for continuous improvement.',
  NULL,
  'analyze', 'CMM progression: 1=Initial (chaos), 2=Repeatable (basic), 3=Defined (documented), 4=Managed (measured), 5=Optimizing (improving). "I Really Did Master Optimization."', v_topic_metrics),

  (6, 'medium', 'During a log review, an analyst notices that authentication logs from two different servers show the same user logged in at the same time but the timestamps are 3 minutes apart. What is the MOST likely explanation?',
  '["The user''s account has been compromised", "The servers have a time synchronization issue (NTP)", "The user is using a load balancer", "The logging system is misconfigured"]',
  1,
  'Time synchronization issues (lack of NTP) commonly cause timestamp discrepancies across servers. When servers are not synchronized, correlating events across systems becomes unreliable. While account compromise is possible, a 3-minute timestamp difference most likely indicates an NTP issue. This is why NTP is critical for security logging.',
  NULL,
  'apply', 'NTP = essential for log correlation. "Without time sync, your timeline is fiction." A few minutes of drift makes forensic analysis unreliable. Always verify NTP first.', v_topic_logging),

  (6, 'easy', 'Which type of penetration test gives the tester NO prior knowledge of the target environment?',
  '["White box", "Gray box", "Black box", "Red box"]',
  2,
  'Black box testing provides the tester with no prior knowledge of the target, simulating an external attacker. White box provides full knowledge (source code, architecture). Gray box provides partial knowledge. "Red box" is not a standard penetration testing term.',
  NULL,
  'remember', 'Black = Blind (no knowledge). White = Wide open (full knowledge). Gray = Got some info (partial). "The darker the box, the less you see."', v_topic_pentest),

  (6, 'medium', 'An organization wants third-party assurance that its cloud service meets the Trust Services Criteria for security, availability, and confidentiality. Which report should they request from their cloud provider?',
  '["SOC 1 Type II", "SOC 2 Type II", "ISO 27001 certification", "PCI DSS Report on Compliance"]',
  1,
  'SOC 2 Type II specifically addresses the Trust Services Criteria (security, availability, processing integrity, confidentiality, and privacy) and provides assurance over a period of time. SOC 1 focuses on financial controls. ISO 27001 addresses information security broadly but not the specific Trust Services Criteria. PCI DSS applies to payment card data.',
  NULL,
  'apply', 'SOC 2 = Trust Services Criteria (security, availability, processing integrity, confidentiality, privacy). "SOC 2 = Security stuff. SOC 1 = financial stuff."', v_topic_audit),

  (6, 'hard', 'A security team is designing a vulnerability management program. They have limited resources and must prioritize remediation. Which approach provides the MOST risk-informed prioritization?',
  '["Prioritize by CVSS score alone, fixing critical vulnerabilities first", "Combine CVSS score with asset criticality, exploit availability, and network exposure to calculate a risk-based priority", "Fix all vulnerabilities in alphabetical order by CVE identifier", "Focus exclusively on vulnerabilities that have been exploited in the past year"]',
  1,
  'A risk-based approach that considers multiple factors (CVSS severity, asset importance, whether exploits exist in the wild, and network exposure/reachability) provides the most informed prioritization. CVSS alone lacks business context. Alphabetical order is arbitrary. Historical exploitation alone misses new threats. Combining these factors ensures the highest-risk items are addressed first.',
  NULL,
  'analyze', 'Risk-based vulnerability prioritization: Severity x Asset Value x Exploit Availability x Exposure. "Not all criticals are equal — context matters." A critical vuln on an isolated test server is less urgent than a high on a public-facing database.', v_topic_vuln),

  (6, 'medium', 'What is the PRIMARY purpose of a tabletop exercise in security testing?',
  '["To actively exploit vulnerabilities in production systems", "To walk through incident scenarios in a discussion-based format without operational impact", "To test backup and recovery procedures", "To scan the network for vulnerabilities"]',
  1,
  'A tabletop exercise is a discussion-based walkthrough of scenarios where participants talk through their responses without actually executing them. It has no operational impact and is an effective way to test plans, identify gaps, and train staff. Active exploitation is penetration testing. Recovery testing is DR testing. Scanning is vulnerability assessment.',
  NULL,
  'understand', 'Tabletop = "talk it through." No systems affected. Low cost, high value. "Sit around a table and ask: what would we do if...?" Identifies gaps in plans and communication.', v_topic_pentest),

  (6, 'easy', 'Which of the following BEST describes the purpose of a security audit?',
  '["To exploit vulnerabilities and demonstrate impact", "To provide independent assurance that controls are operating effectively", "To install and configure security tools", "To develop security policies and procedures"]',
  1,
  'A security audit provides independent assurance that controls are designed properly and operating effectively. It is an accountability mechanism. Exploiting vulnerabilities is penetration testing. Installing tools is operations. Developing policies is governance.',
  NULL,
  'remember', 'Audit = "independent verification." Auditors check that controls work. They report findings, they do not fix them. "Trust but verify."', v_topic_audit),

  -- ========================================================================
  -- DOMAIN 7: Security Operations (15 questions)
  -- ========================================================================

  (7, 'easy', 'According to the NIST incident response process, which phase comes FIRST?',
  '["Detection and Analysis", "Containment", "Preparation", "Lessons Learned"]',
  2,
  'Preparation is always the first phase of incident response. You must have plans, teams, tools, and training BEFORE an incident occurs. The order is: Preparation → Detection and Analysis → Containment, Eradication, Recovery → Post-Incident Activity (Lessons Learned).',
  NULL,
  'remember', 'IR starts with PREPARATION. "You cannot plan during a panic." Preparation = team + tools + plans + training. Everything else flows from readiness.', v_topic_ir),

  (7, 'medium', 'During an incident, the IR team determines that malware has spread to 15 workstations. The CISO asks what to do first. What is the MOST appropriate immediate action?',
  '["Reimage all 15 workstations immediately", "Contain the affected systems by isolating them from the network", "Conduct a full forensic analysis of each workstation", "Notify law enforcement about the malware infection"]',
  1,
  'Containment is the immediate priority to prevent further spread. Isolating affected systems stops the malware from spreading to additional systems. Reimaging (eradication) comes after containment and should not be done until evidence is preserved. Forensic analysis takes time and should not delay containment. Law enforcement notification may be needed but is not the first technical action.',
  '_In the SOC War Room, the team races to contain the breach before it spreads further..._',
  'apply', 'Containment FIRST to stop the spread. "Stop the bleeding before you start surgery." Contain → Preserve evidence → Eradicate → Recover. Do not skip containment.', v_topic_ir),

  (7, 'hard', 'An organization''s RTO is 4 hours and RPO is 1 hour for their critical ERP system. They currently perform daily full backups at midnight. A disaster occurs at 11:00 AM. How much data could potentially be lost, and does this meet their RPO?',
  '["11 hours of data could be lost; this does NOT meet the 1-hour RPO", "4 hours of data could be lost; this meets the RPO", "1 hour of data could be lost; this meets the RPO", "No data would be lost because of the daily backup"]',
  0,
  'With daily backups at midnight and a disaster at 11 AM, up to 11 hours of data could be lost (from midnight to 11 AM). This far exceeds the 1-hour RPO. To meet a 1-hour RPO, the organization needs backups at least every hour (or real-time replication). RPO drives backup frequency — a 1-hour RPO requires hourly or more frequent backups.',
  '_The Nexus team discovers their backup strategy is inadequate for their recovery objectives..._',
  'analyze', 'RPO = maximum acceptable data loss = backup frequency. "1-hour RPO means backup every hour or less." Daily backups can never meet an RPO shorter than 24 hours.', v_topic_dr),

  (7, 'easy', 'Which type of backup copies ONLY the data that has changed since the last backup of any type?',
  '["Full backup", "Incremental backup", "Differential backup", "Mirror backup"]',
  1,
  'Incremental backup copies only data changed since the LAST backup (of any type — full or incremental). Differential copies all changes since the last FULL backup. Full copies everything. Mirror creates an exact copy. Incremental is fastest to perform but slowest to restore (requires full + all incrementals).',
  NULL,
  'remember', 'Incremental = since LAST backup (any type). Differential = since last FULL backup. "Incremental = tiny pieces. Differential = growing pile."', v_topic_dr),

  (7, 'medium', 'A system administrator wants to apply a critical security patch to a production web server. Following change management best practices, what should be done FIRST?',
  '["Apply the patch immediately during the next maintenance window", "Submit a change request and test the patch in a staging environment", "Back up the server and apply the patch during business hours", "Email the security team for approval and apply the patch"]',
  1,
  'Change management requires a formal change request that includes testing in a non-production environment before applying to production. Even critical patches should be tested to avoid introducing new issues. Emergency changes may use an expedited process but still require testing and documentation. Applying without testing risks breaking production systems.',
  NULL,
  'apply', 'Change management: Request → Review → Approve → TEST → Implement → Verify → Document. "Always test before production." Even emergencies need testing.', v_topic_change),

  (7, 'hard', 'A forensic investigator arrives at the scene of a suspected data breach. The server is still running. According to forensic best practices, what is the FIRST evidence the investigator should collect?',
  '["Create a forensic image of the hard drive", "Photograph the physical setup and screen contents", "Capture the contents of RAM (volatile memory)", "Collect the server''s log files from disk"]',
  2,
  'RAM (volatile memory) should be collected first because it is lost when the system is powered off. The order of volatility dictates collection priority: CPU registers/cache → RAM → network state → running processes → disk. Disk-based evidence (hard drive image, log files) will persist. Physical documentation (photographs) should happen concurrently but RAM capture takes technical priority.',
  '_The forensics team at the New York SOC must preserve evidence before it disappears..._',
  'apply', 'Order of volatility: "Most volatile FIRST." RAM disappears at power-off. Disk survives. "Catch the butterfly before photographing the garden."', v_topic_forensics),

  (7, 'medium', 'What is the PRIMARY purpose of a post-incident review (lessons learned)?',
  '["To assign blame for the incident", "To identify improvements to the incident response process and prevent recurrence", "To calculate the financial impact of the incident", "To satisfy regulatory reporting requirements"]',
  1,
  'The primary purpose of lessons learned is to identify what worked, what did not, and what can be improved to prevent recurrence and strengthen the IR process. It is explicitly NOT about blame. Financial impact assessment and regulatory reporting are separate activities. A blameless post-incident culture encourages honest reporting.',
  NULL,
  'understand', 'Lessons learned = "What happened? What worked? What did not? How do we improve?" NEVER about blame. "Blameless post-mortems produce better lessons."', v_topic_ir),

  (7, 'easy', 'Which recovery site type provides the FASTEST failover capability?',
  '["Cold site", "Warm site", "Hot site", "Mobile site"]',
  2,
  'A hot site is a fully operational mirror of the production environment with real-time or near-real-time data replication. Failover can occur in minutes. A warm site has equipment but needs data loading (hours). A cold site is an empty facility (days to weeks). A mobile site is a portable facility with variable recovery time.',
  NULL,
  'remember', 'Hot = immediate (minutes). Warm = soon (hours). Cold = slow (days/weeks). "Hot = coffee ready. Warm = needs heating. Cold = need to buy coffee."', v_topic_dr),

  (7, 'hard', 'During a forensic investigation, the investigator creates a bit-for-bit copy of a hard drive. What is the MOST important step after creating the forensic image?',
  '["Begin analyzing the forensic image immediately", "Generate a cryptographic hash of both the original and the copy to verify they are identical", "Store the original in a secure evidence locker", "Submit the copy to law enforcement"]',
  1,
  'Generating cryptographic hashes (SHA-256) of both the original and the copy verifies that the forensic image is an exact duplicate. This is essential for maintaining evidence integrity and admissibility. If the hashes match, the copy is verified. Analysis should be performed on the copy. Storage and law enforcement submission come later.',
  NULL,
  'apply', 'Hash verification = "proof of identical copy." SHA-256 of original must match SHA-256 of copy. "Matching hashes = bulletproof evidence." Always hash, always verify.', v_topic_forensics),

  (7, 'medium', 'A CAB (Change Advisory Board) is reviewing a proposed firewall rule change. What should the CAB evaluate FIRST?',
  '["The cost of implementing the change", "The risk and potential impact of the change", "Whether the change follows the correct template format", "The technical skills of the person implementing the change"]',
  1,
  'The CAB''s primary function is to evaluate the risk and potential impact of proposed changes. This includes assessing what could go wrong, what systems are affected, and whether a rollback plan exists. Cost, formatting, and personnel skills are secondary considerations. Risk assessment drives the approve/deny decision.',
  '_The SOC team evaluates changes to the network configuration during the breach remediation..._',
  'apply', 'CAB evaluates RISK first. "What could go wrong?" is the key question. Impact analysis, rollback plans, and testing requirements follow from risk assessment.', v_topic_change),

  (7, 'easy', 'What is the PRIMARY function of a Security Operations Center (SOC)?',
  '["Developing security policies and procedures", "Continuous monitoring and detection of security threats", "Conducting annual security audits", "Managing the organization''s firewall rules"]',
  1,
  'A SOC provides continuous (24/7) monitoring and detection of security threats. While SOCs may be involved in other activities, their primary function is detecting and responding to security events. Policy development is governance. Audits are the audit function. Firewall management is one tool among many.',
  NULL,
  'remember', 'SOC = "Security Operations Center" = the security nerve center. 24/7 monitoring, detection, response. "The SOC never sleeps."', v_topic_soc),

  (7, 'hard', 'An organization experiences a ransomware attack. The IR team has contained the spread and preserved evidence. The attackers demand $500,000 in cryptocurrency. Management asks for a recommendation. What is the MOST appropriate guidance?',
  '["Pay the ransom immediately to minimize downtime", "Never pay the ransom under any circumstances", "Evaluate the decision based on backup availability, business impact, legal implications, and the likelihood of key delivery, while engaging law enforcement", "Pay the ransom only if cyber insurance covers it"]',
  2,
  'The decision to pay ransomware demands is complex and depends on multiple factors: whether backups exist and are viable, the business impact of extended downtime, legal and regulatory implications (some payments may violate sanctions), and the uncertain likelihood of receiving decryption keys. Law enforcement should always be engaged. There is no universal "always pay" or "never pay" answer.',
  NULL,
  'analyze', 'Ransomware payment: no simple answer. Consider backups, impact, legal issues, and criminal reliability. "Engage law enforcement, evaluate options, decide based on facts." FBI recommends against paying but understands business realities.', v_topic_ir),

  (7, 'medium', 'Which BEST describes the relationship between DRP and BCP?',
  '["DRP and BCP are the same thing", "DRP is focused on IT system recovery; BCP is focused on maintaining overall business operations", "BCP is a subset of DRP", "DRP handles prevention; BCP handles recovery"]',
  1,
  'DRP (Disaster Recovery Planning) focuses specifically on recovering IT systems and infrastructure. BCP (Business Continuity Planning) is broader, encompassing people, processes, facilities, and technology. DRP is a subset of BCP — it is the IT component of the overall business continuity strategy.',
  NULL,
  'understand', 'DRP = IT recovery (systems and data). BCP = Business continuity (everything). "DRP is a chapter in the BCP book." DRP is a SUBSET of BCP.', v_topic_dr),

  (7, 'medium', 'A security team discovers that a server''s baseline configuration has drifted from the approved standard. Several unauthorized software packages have been installed. What process should have PREVENTED this?',
  '["Incident response", "Configuration management", "Vulnerability management", "Access management"]',
  1,
  'Configuration management maintains systems in a known, documented state. Configuration baselines define approved configurations, and drift detection identifies unauthorized changes. If configuration management were properly implemented with monitoring, the unauthorized software installations would have been detected and prevented or flagged immediately.',
  NULL,
  'apply', 'Configuration management = maintaining known-good state. Drift detection = finding unauthorized changes. "Baselines define normal; drift means trouble."', v_topic_change),

  (7, 'easy', 'In digital forensics, what does "chain of custody" document?',
  '["The sequence of events in a cyber attack", "Who handled evidence, when, and what was done with it", "The chain of command in the incident response team", "The steps taken to contain an incident"]',
  1,
  'Chain of custody documents who handled evidence, when they handled it, where it was stored, and what was done with it at each step. Any break in the chain can make evidence inadmissible in court. It is about evidence handling, not attack sequences, organizational hierarchy, or containment steps.',
  NULL,
  'remember', 'Chain of custody = "Who, When, Where, What was done." Break the chain = lose the case. "Every handoff must be documented."', v_topic_forensics),

  -- ========================================================================
  -- DOMAIN 8: Software Development Security (15 questions)
  -- ========================================================================

  (8, 'easy', 'What does "shifting left" mean in the context of software security?',
  '["Moving security controls from the cloud to on-premises", "Integrating security testing earlier in the development lifecycle", "Reducing the number of security controls", "Assigning security responsibility to left-handed developers"]',
  1,
  'Shifting left means moving security activities earlier (to the left on a timeline) in the SDLC. Finding and fixing vulnerabilities during design or development is much cheaper and faster than finding them in production. This is a core DevSecOps principle.',
  NULL,
  'remember', '"Shift left = start security sooner." The earlier you find a bug, the cheaper the fix. Design-phase fixes cost 100x less than production fixes.', v_topic_sdlc),

  (8, 'medium', 'A developer uses string concatenation to build SQL queries with user input. An attacker enters '' OR ''1''=''1 into the login form and gains unauthorized access. What vulnerability was exploited?',
  '["Cross-site scripting (XSS)", "SQL injection", "Buffer overflow", "Cross-site request forgery (CSRF)"]',
  1,
  'SQL injection occurs when untrusted user input is concatenated into SQL queries without proper sanitization or parameterization. The attacker''s input ('' OR ''1''=''1) modifies the SQL logic to always return true. The fix is parameterized queries (prepared statements), which separate code from data.',
  '_The Dev Lab team traces the initial breach to an unparameterized database query..._',
  'apply', 'SQL injection = unsanitized input in SQL queries. Fix = parameterized queries (prepared statements). "Parameterize, do not concatenate!" The #1 database attack.', v_topic_owasp),

  (8, 'hard', 'A security architect is reviewing the threat model for a new web application. Using STRIDE, they identify that users could deny having performed certain transactions. Which STRIDE category does this fall under, and what is the BEST countermeasure?',
  '["Spoofing; implement strong authentication", "Repudiation; implement comprehensive audit logging with tamper-proof storage", "Information Disclosure; encrypt all transaction data", "Tampering; implement digital signatures on all data"]',
  1,
  'Repudiation is the threat that a user can deny performing an action. The countermeasure is comprehensive, tamper-proof audit logging that provides non-repudiation. Digital signatures also provide non-repudiation for specific transactions. Spoofing relates to identity. Information disclosure relates to data exposure. Tampering relates to data modification.',
  '_The threat model for the Nexus portal reveals repudiation risks in the transaction system..._',
  'analyze', 'STRIDE: Spoofing, Tampering, Repudiation, Information disclosure, DoS, Elevation of privilege. Repudiation = "I did not do that." Fix = audit logs + digital signatures for non-repudiation.', v_topic_sdlc),

  (8, 'easy', 'Which OWASP Top 10 vulnerability is ranked #1 (most common)?',
  '["Injection", "Cryptographic Failures", "Broken Access Control", "Security Misconfiguration"]',
  2,
  'Broken Access Control is the #1 vulnerability in the current OWASP Top 10. It occurs when users can act outside their intended permissions, such as accessing other users'' data or elevating privileges. Injection dropped to #3. Cryptographic Failures is #2. Security Misconfiguration is #5.',
  NULL,
  'remember', 'OWASP Top 3: "BAC-CI" — Broken Access Control (#1), Cryptographic failures (#2), Injection (#3). "Broken Access is the Biggest problem."', v_topic_owasp),

  (8, 'medium', 'A code review reveals that the application displays detailed stack traces to users when errors occur. What security risk does this create?',
  '["Denial of service", "Information disclosure", "SQL injection", "Cross-site scripting"]',
  1,
  'Displaying detailed error messages (stack traces, database errors, file paths, version numbers) to users is an information disclosure vulnerability. Attackers use this information to understand the technology stack, identify vulnerable components, and plan targeted attacks. Error messages to users should be generic; detailed errors should go to logs only.',
  NULL,
  'understand', 'Detailed errors to users = information disclosure. "Tell users nothing useful to attackers." Generic messages to users, detailed logs for developers. "Fail gracefully, log privately."', v_topic_secure_coding),

  (8, 'hard', 'An organization''s SCA (Software Composition Analysis) tool reports that a widely-used open-source library in their application has a critical CVE with a CVSS score of 9.8. The library is deeply integrated and a replacement would take weeks. What is the MOST appropriate immediate action?',
  '["Remove the library immediately regardless of application impact", "Implement compensating controls (WAF rules, network restrictions) while planning the library update", "Wait for the library maintainers to release a patch", "Ignore it since the CVSS score does not consider the specific application context"]',
  1,
  'When immediate remediation is not feasible, implementing compensating controls (WAF rules to block known exploit patterns, network restrictions to limit exposure, enhanced monitoring) provides interim protection while the team plans the update. Removing without a replacement breaks the application. Waiting passively is too risky for a 9.8 CVSS. Ignoring is negligent.',
  '_A critical vulnerability in a third-party library threatens the entire Nexus application stack..._',
  'analyze', 'When you cannot patch immediately: compensating controls. WAF + network restrictions + monitoring = "virtual patching." "Protect now, fix properly later." CVSS 9.8 cannot be ignored.', v_topic_app_testing),

  (8, 'medium', 'Which application security testing method analyzes source code WITHOUT executing the application?',
  '["DAST", "SAST", "IAST", "Fuzzing"]',
  1,
  'SAST (Static Application Security Testing) analyzes source code, bytecode, or binary code without executing the application. DAST tests the running application dynamically. IAST combines both by instrumenting the running application. Fuzzing sends malformed inputs to the running application.',
  NULL,
  'remember', 'SAST = Static = "See All Source Text" (reads code). DAST = Dynamic = "Dynamically Attacks" (tests running app). SAST = early. DAST = late.', v_topic_app_testing),

  (8, 'easy', 'What is the PRIMARY defense against cross-site scripting (XSS)?',
  '["Parameterized queries", "Output encoding", "Network firewalls", "Strong passwords"]',
  1,
  'Output encoding (escaping) is the primary defense against XSS. It converts special characters (like < > " '') into their HTML entity equivalents so they are displayed as text rather than executed as code. Parameterized queries defend against SQL injection. Firewalls and passwords address different threats entirely.',
  NULL,
  'remember', 'XSS prevention = output encoding. SQL injection prevention = parameterized queries. "Encode the output, parameterize the query." Each attack has its specific defense.', v_topic_secure_coding),

  (8, 'hard', 'A development team practices continuous deployment, releasing code multiple times per day. The security team cannot perform manual security reviews at this pace. What is the MOST effective approach to maintain security in this environment?',
  '["Slow down deployments to allow manual security reviews", "Implement automated security testing (SAST, DAST, SCA) integrated into the CI/CD pipeline", "Hire more security reviewers to keep pace", "Accept the increased risk as a trade-off for faster delivery"]',
  1,
  'Automated security testing integrated into the CI/CD pipeline is the most effective approach for high-velocity development. SAST runs on code commits, SCA checks dependencies during builds, DAST runs against staging deployments. This provides continuous security validation without slowing delivery. Manual reviews cannot scale. Slowing delivery loses competitive advantage. Accepting risk is irresponsible.',
  NULL,
  'analyze', 'DevSecOps = security automation in CI/CD. "Automate security gates in the pipeline." SAST on commit → SCA on build → DAST on deploy. Humans for design reviews and edge cases.', v_topic_sdlc),

  (8, 'medium', 'A web application allows users to upload profile pictures. Without proper validation, an attacker uploads a PHP file disguised as a JPEG. What type of vulnerability is this?',
  '["SQL injection", "Unrestricted file upload", "Directory traversal", "Server-side request forgery"]',
  1,
  'Unrestricted file upload allows attackers to upload malicious files (web shells, malware) to the server. Prevention includes: validating file types server-side (not just extension), checking file headers/magic bytes, storing uploads outside the web root, renaming files, and restricting execution permissions on upload directories.',
  '_An attacker uploads a disguised web shell to the Nexus employee portal..._',
  'apply', 'File upload security: validate type (server-side), check magic bytes, store outside web root, rename files, no execution permissions. "Never trust the file extension."', v_topic_secure_coding),

  (8, 'easy', 'In the SDLC, during which phase should threat modeling FIRST be performed?',
  '["Requirements", "Design", "Implementation", "Testing"]',
  1,
  'Threat modeling should first be performed during the Design phase when the architecture is being defined. This allows threats to be identified and mitigations designed into the architecture. While security considerations should start at Requirements, formal threat modeling (using STRIDE, attack trees, etc.) happens during Design when the system structure is known.',
  NULL,
  'remember', 'Threat modeling = Design phase. "Model the threats when you model the system." STRIDE + data flow diagrams = identify threats before writing code.', v_topic_sdlc),

  (8, 'hard', 'A security review of a web application reveals that the application uses JWT (JSON Web Tokens) for session management. The tokens are signed but not encrypted, and the "alg" header accepts "none" as a valid algorithm. What is the MOST critical risk?',
  '["The tokens expire too quickly for good user experience", "An attacker can forge valid tokens by setting the algorithm to none, bypassing signature verification entirely", "The tokens consume too much bandwidth", "Users cannot log out because JWTs are stateless"]',
  1,
  'Accepting "none" as a valid algorithm in the JWT "alg" header means an attacker can create a token with no signature that the server will accept as valid. This allows complete authentication bypass — the attacker can forge tokens for any user. This is a well-known JWT vulnerability. The fix is to explicitly whitelist allowed algorithms and reject "none."',
  NULL,
  'analyze', 'JWT "alg: none" vulnerability = authentication bypass. "Always validate the algorithm. Never accept none." Whitelist specific algorithms (RS256, HS256). "None means no security."', v_topic_secure_coding),

  (8, 'medium', 'Which database security control MOST effectively prevents a compromised application from reading data from tables it should not access?',
  '["Transparent Data Encryption (TDE)", "Database Activity Monitoring (DAM)", "Principle of least privilege applied to the database connection account", "Regular database patching"]',
  2,
  'Applying least privilege to the database connection account ensures the application can only access the specific tables and operations it needs. If compromised, the attacker is limited to what that account can access. TDE protects data at rest but does not restrict access. DAM detects but does not prevent. Patching addresses vulnerabilities but not access scope.',
  NULL,
  'apply', 'Database least privilege: "The app account should only reach its own tables." If compromised, the blast radius is limited. "Least privilege limits the damage."', v_topic_db_security),

  (8, 'medium', 'What is the PRIMARY purpose of a Web Application Firewall (WAF) in the context of application security?',
  '["To replace secure coding practices", "To filter and monitor HTTP traffic for common web application attacks", "To encrypt all web traffic", "To perform load balancing for web servers"]',
  1,
  'A WAF filters and monitors HTTP/HTTPS traffic to detect and block common web attacks like SQL injection, XSS, and CSRF. It operates at the application layer (Layer 7). A WAF supplements but does NOT replace secure coding. Encryption is handled by TLS. Load balancing is a separate function. A WAF is a compensating/additional control.',
  NULL,
  'understand', 'WAF = "Web Application Filter." Blocks common web attacks at Layer 7. "A WAF is a safety net, not a replacement for building safely." Defense in depth.', v_topic_owasp),

  (8, 'easy', 'Which of the following is an example of input validation using an allowlist approach?',
  '["Blocking known malicious characters like < > and ;", "Accepting only alphanumeric characters for a username field", "Scanning input for SQL keywords like SELECT and DROP", "Limiting input length to 255 characters"]',
  1,
  'An allowlist (whitelist) defines exactly what IS allowed and rejects everything else. Accepting only alphanumeric characters is an allowlist approach. Blocking specific characters is a denylist (blocklist) approach. Scanning for SQL keywords is pattern matching (denylist). Length limiting is a separate validation control.',
  NULL,
  'remember', 'Allowlist = "Only these are OK" (safer). Denylist = "These are NOT OK" (can be bypassed). "Allowlist = Always preferred. Denylist = Dangerous to rely on alone."', v_topic_secure_coding);

END $$;
