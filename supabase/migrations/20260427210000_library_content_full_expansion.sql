-- 20260427_210000 Library content full expansion (Sprint Coverage)
--
-- Populates the remaining 29 library_topics rows with thorough content
-- to match the depth of the 11 already populated by migration
-- 20260427180000. After this migration, ALL 40 seeded topics have
-- full content_markdown, exam_tips, think_like_manager, memory_hack,
-- and memory_anchor.
--
-- Idempotent: UPDATE keyed on (domain_id, topic_number).

BEGIN;

-- ── 1.3 Security Governance and Policies ──────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Policy at the top, guidelines at the bottom. Each layer answers a different question.',
  memory_anchor = 'A city: Constitution → Building Codes → Construction Manuals → Suggestions.',
  content_markdown = $md$
## The four-tier hierarchy

- **Policy** — high-level WHAT and WHY. Approved by the board. Rarely changes. ("Confidential data must be encrypted.")
- **Standard** — mandatory HOW. ("AES-256 for data at rest. TLS 1.3 minimum in transit.")
- **Procedure** — step-by-step. ("To rotate a key: 1...2...3...")
- **Guideline** — recommended, not mandatory. ("Prefer FIPS 140-3 modules where available.")

## Governance bodies

- **Board** — owns risk appetite. Approves policy.
- **Steering committee** — directs the program. CISO + business leads.
- **Working groups** — implementation by domain (network, app, IAM).

## Roles

- **Senior management** — accountable.
- **CISO** — strategy and risk.
- **Asset owner** — accountable for a specific asset.
- **Custodian** — operates / maintains.
- **User** — uses per policy.
- **Auditor** — independent assurance.

## Policy types

- Organizational, issue-specific, system-specific, baseline.
- AUP (Acceptable Use), Privacy, BYOD, Remote Work, Encryption, Access Control.

## Common pitfalls

- Policy without standards = ambiguity ("encrypt" but how?).
- Standards without procedures = inconsistent implementation.
- Procedures that drift from policy = audit findings.
$md$,
  exam_tips = 'Policy = WHAT (board). Standard = HOW (mandatory). Procedure = STEPS. Guideline = RECOMMENDED. Roles: owner accountable, custodian operational.',
  think_like_manager = 'Policy stability is a feature. Frequent rewrites confuse the org. Update standards and procedures more often; policy rarely.',
  memory_hack = 'PSPG hierarchy: Policy → Standard → Procedure → Guideline. Memory hook: "Plan, Specify, Perform, Guide."'
WHERE domain_id = 1 AND topic_number = '1.3';

-- ── 1.4 Business Continuity Planning ──────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Keep the business running when something breaks. BCP plans operations; DRP recovers IT.',
  memory_anchor = 'BCP = "can we keep the lights on?" DRP = "can we rebuild?"',
  content_markdown = $md$
## BCP vs DRP

- **BCP** — Business Continuity Plan. Keeps mission-essential functions operating during a disruption (alternate facility, manual fallbacks, surge staffing).
- **DRP** — Disaster Recovery Plan. Restores IT systems and data after an outage. A subset of BCP focused on technology.

## BIA — Business Impact Analysis (the foundation)

Every BCP/DRP starts with a BIA:

- Identify mission-critical processes.
- Quantify outage impact (financial, reputational, regulatory).
- Set RTO, RPO, MTD, WRT for each process.
- Identify upstream and downstream dependencies.

## The metrics

- **MTD** — Maximum Tolerable Downtime. Beyond this, the business is irreparably harmed.
- **RTO** — Recovery Time Objective. Target time to restore the technology.
- **RPO** — Recovery Point Objective. Acceptable data loss (e.g. RPO = 15 min means up to 15 min of transactions can be lost).
- **WRT** — Work Recovery Time. After tech restored, how long to catch up business operations.
- **Equation:** MTD = RTO + WRT.

## DR site types

Cold → Warm → Hot → Mirrored. Cost rises with readiness. RTO drives the choice.

## Testing

Tabletop → Walkthrough → Simulation → Parallel → Full Interruption. Test at least annually; immutable / audit-trailed.

## BCP organization

- Crisis Management Team (CMT) — strategic, leads the response.
- Damage Assessment Team — quantifies and reports.
- Operations / IT Recovery Team — executes runbooks.
- Communications Team — internal and external messaging.
$md$,
  key_formulas = '[
    {"formula": "MTD = RTO + WRT", "description": "Maximum Tolerable Downtime equals Recovery Time Objective plus Work Recovery Time."},
    {"formula": "RPO = data loss tolerance", "description": "Drives backup frequency. RPO 15 min = backups at least every 15 min."}
  ]'::jsonb,
  exam_tips = 'BCP > DRP (BCP is the parent). MTD = RTO + WRT. Lower RTO = hotter site. Test types from cheapest to most realistic: Tabletop, Walkthrough, Simulation, Parallel, Full Interruption.',
  think_like_manager = 'The BIA, not the DR plan, is where executive-level decisions live. Without a BIA, the DR investment is unjustified to the board.',
  memory_hack = 'BCP plans operations. DRP recovers IT. BIA quantifies. RTO/RPO/MTD/WRT drive design. Hot site = ready, Cold site = empty.'
WHERE domain_id = 1 AND topic_number = '1.4';

-- ── 1.5 Legal and Compliance ──────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'The exam tests REGULATORY recognition. Match the regulation to its scope.',
  memory_anchor = 'Health=HIPAA, Cards=PCI, EU=GDPR, Public=SOX, California=CCPA.',
  content_markdown = $md$
## Major regulations cheat-sheet

| Regulation | Scope | Trigger |
|---|---|---|
| HIPAA | US healthcare PHI | Health providers, plans, clearinghouses, business associates |
| HITECH | Strengthens HIPAA | Breach notification, increased penalties |
| GLBA | US financial privacy | Banks, investment firms |
| SOX | Public company financial integrity | SEC-registered companies |
| PCI DSS | Payment card data | Anyone storing/processing cards (contractual, not law) |
| GDPR | EU resident personal data | Any controller / processor handling EU residents (extraterritorial) |
| CCPA / CPRA | California residents | Companies meeting thresholds (revenue or volume) |
| HITRUST | Healthcare combined framework | Combines HIPAA + NIST + ISO |
| FERPA | Student educational records | Schools receiving federal funding |
| COPPA | Children under 13 | Online services collecting child data |
| CFAA | Unauthorized computer access | Federal criminal statute (US) |
| FISMA | Federal IT systems | US government agencies |
| NERC-CIP | Bulk electric system | North American power grid |
| LGPD | Brazilian personal data | GDPR-style |
| PIPEDA | Canadian private sector | Federal privacy law |
| APPI | Japan personal data | Cross-border transfer rules |

## Legal categories

- **Criminal** — government prosecutes; jail time. Standard: beyond reasonable doubt.
- **Civil** — private lawsuit; damages. Standard: preponderance of evidence.
- **Administrative / Regulatory** — agency enforces; fines.
- **Contract** — breach of agreement; damages.

## Privacy principles (GDPR Article 5)

Lawfulness · Fairness · Transparency · Purpose Limitation · Data Minimization · Accuracy · Storage Limitation · Integrity & Confidentiality · Accountability.

## Data subject rights (GDPR)

Access · Rectification · Erasure (right to be forgotten) · Restriction · Portability · Objection · Automated Decision Making.

## Breach notification timers

- GDPR: 72 hours to authority.
- HIPAA: 60 days.
- US state laws: vary, typically 30-90 days.
- PCI DSS: immediate to card brands.

## Cross-border transfer

GDPR Standard Contractual Clauses (SCCs), adequacy decisions, Binding Corporate Rules (BCRs). Schrems II ruled US Privacy Shield inadequate; replaced by EU-US Data Privacy Framework.
$md$,
  exam_tips = 'Match regulation to data type or industry. GDPR is extraterritorial (applies to non-EU companies handling EU data). HIPAA covers PHI. SOX covers financial reporting integrity. PCI is contractual.',
  think_like_manager = 'Document compliance evidence continuously. Audit-time scrambling fails. Map controls to multiple regulations at once where possible (HITRUST consolidates HIPAA + NIST + ISO).',
  memory_hack = 'Legal categories: Criminal (jail), Civil (damages), Admin (fines), Contract (breach). GDPR breach = 72 hr. HIPAA = 60 days.'
WHERE domain_id = 1 AND topic_number = '1.5';

-- ── 2.1 Data Classification ───────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Label your data so controls can apply. Classification drives every protection decision.',
  memory_anchor = 'Public, Internal, Confidential, Restricted — four floors of a building.',
  content_markdown = $md$
## Why classify

Without classification, every record gets the same control. Classification lets you:
- Apply expensive controls (encryption, DLP, audit) only where needed.
- Justify investment to the board.
- Comply with regulations that require differential protection.

## Classification levels (typical commercial)

- **Public** — no harm if disclosed (marketing copy).
- **Internal** — embarrassing but not damaging if disclosed (org chart).
- **Confidential** — significant harm (M&A plans, customer pricing).
- **Restricted** — severe harm (PII, financial accounts, trade secrets).

## Government classifications

Unclassified · Confidential · Secret · Top Secret. Above TS: SCI, SAP (compartmentalized).

## Roles

- **Data Owner** — senior business manager, ACCOUNTABLE for classification decisions.
- **Data Custodian** — IT operations, IMPLEMENTS the controls per the owner's decisions.
- **Data User** — follows policy.

## Classification process

1. Inventory data.
2. Assign classification at creation, based on the owner's risk assessment.
3. Apply MARKING (human-readable) and LABELING (machine-readable).
4. Drive control selection from the classification.
5. Reclassify on schedule or on event.

## Common pitfalls

- Owner not engaged → custodians or auditors classify by default → mis-classification.
- Static classification → data ages, sensitivity changes, no review.
- Over-classification → costs balloon, users circumvent.
- Under-classification → DLP and access controls miss enforcement.

## Categorization vs classification

- Classification = the LABEL on DATA.
- Categorization = the LABEL on the SYSTEM = the highest classification of data it processes.
$md$,
  exam_tips = 'Owner accountable, custodian operational. Categorization inherits the highest data classification. Over-classification is as harmful as under-classification.',
  think_like_manager = 'Classification only works if owners actually review. Quarterly recertification with auditable evidence beats one-time labeling.',
  memory_hack = 'Public-Internal-Confidential-Restricted = PICR. Owner decides, custodian does, user uses. Highest data class drives system class.'
WHERE domain_id = 2 AND topic_number = '2.1';

-- ── 2.2 Data Lifecycle and States ─────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Four phases (Create, Use, Archive, Destroy) and three states (At Rest, In Transit, In Use).',
  memory_anchor = 'Data is born, lived, retired, and destroyed. At each life stage, different threats apply.',
  content_markdown = $md$
## Lifecycle phases

1. **Create** — classify at the moment of creation. The hardest discipline.
2. **Use** — process, share, transmit. DLP and access control apply.
3. **Archive** — retain per policy. Encryption, integrity verification.
4. **Destroy** — sanitize per classification. Document chain-of-custody.

## States

- **At Rest** — disk, database, backup. Default control: AES-256 full-disk or column-level encryption.
- **In Transit** — wire. Default: TLS 1.3, IPSec, signed APIs.
- **In Use** — actively in memory during processing. Until recently always plaintext. Modern options: enclaves (Intel SGX, AWS Nitro), homomorphic encryption, secure multi-party computation.

## Retention

Driven by:
- Regulation (HIPAA = 6 yr, SOX = 7 yr, GDPR = "no longer than necessary").
- Litigation hold (suspends normal retention).
- Business need.

## Disposal

Match the sanitization level to the classification:
- Public / Internal → clearing
- Confidential → purging or destruction
- Restricted / Top Secret → destruction

For SSDs: degaussing does NOT work. Crypto-shred or physically destroy.

## Pitfalls

- Forgotten archives (old backup tapes) — uninventoried, uncontrolled.
- Cloud snapshots — survive deletion, kept for 30+ days by default.
- Email exports — leak data outside the controlled environment.
$md$,
  exam_tips = 'Lifecycle = CUAD (Create/Use/Archive/Destroy). States = at rest, in transit, in use. Each state has its own control. SSDs do NOT degauss.',
  think_like_manager = 'Disposal is auditable. Maintain a written destruction certificate for every retired drive holding Restricted data.',
  memory_hack = 'CUAD lifecycle. ARTRUSE states (At Rest, In Transit, In Use). Match controls to BOTH the phase and the state.'
WHERE domain_id = 2 AND topic_number = '2.2';

-- ── 2.3 Data Protection Controls ──────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Encryption, DLP, CASB, DRM/IRM. Match the tool to the data state and the threat.',
  memory_anchor = 'DLP = data leaving. CASB = cloud apps gateway. DRM = consumer. IRM = enterprise documents.',
  content_markdown = $md$
## Encryption (the foundation)

- **At rest** — AES-256 (full-disk, database column, file-level). Native cloud-provider encryption.
- **In transit** — TLS 1.3, IPSec, mTLS. Avoid TLS 1.0/1.1, RC4, DES, 3DES.
- **In use** — enclaves (SGX, Nitro), homomorphic, MPC.

## DLP — Data Loss Prevention

Three deployment flavors:
- **Network DLP** — egress inspection. Catches email exfil, large transfers.
- **Endpoint DLP** — agent on workstations. Catches USB, copy/paste.
- **Cloud DLP** — API-based scanning of SaaS storage.

Detection methods:
- Pattern matching (regex for SSN, credit card).
- Fingerprinting (hash of known sensitive documents).
- Statistical / machine learning.

Action on detection: alert, quarantine, block.

## CASB — Cloud Access Security Broker

Sits between users and cloud SaaS. Four pillars:
- **Visibility** — discover shadow IT.
- **Compliance** — audit cloud configurations.
- **Threat protection** — anomalous user behavior, malware in cloud storage.
- **Data security** — DLP, encryption, tokenization for cloud data.

## DRM vs IRM

- **DRM (Digital Rights Management)** — consumer content protection (movies, music, e-books).
- **IRM (Information Rights Management)** — enterprise document protection. Encrypts documents; recipients need a license to decrypt. Enforces no-print, no-screenshot, expiration.

## Tokenization

Replaces sensitive data (e.g. credit card) with a non-sensitive token. Vault holds the original. Used for PCI scope reduction.

## Key management

- Centralized via HSM or cloud KMS (AWS KMS, Azure Key Vault, GCP KMS).
- Separation of duties: encryption key custody separate from data custody.
- Key rotation, escrow, recovery procedures.
- BYOK (Bring Your Own Key) and HYOK (Hold Your Own Key) for cloud.
$md$,
  exam_tips = 'Three states need three controls. DLP for data leaving (network/endpoint/cloud). CASB for SaaS visibility + control. IRM = enterprise DRM.',
  think_like_manager = 'Encryption alone is not protection — key management is. Without HSM-backed keys and rotation, encryption is a paper control.',
  memory_hack = 'Encryption × 3 states. DLP = leaving. CASB = SaaS gateway. DRM = consumer. IRM = corporate documents. Tokenize for PCI scope reduction.'
WHERE domain_id = 2 AND topic_number = '2.3';

-- ── 2.4 Privacy and Data Handling ─────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Privacy frameworks, PII handling, data subject rights. Differs from security but overlaps deeply.',
  memory_anchor = 'Privacy = control over your data. Security = preventing unauthorized access.',
  content_markdown = $md$
## Privacy vs security

- **Security** — preventing unauthorized access, modification, destruction.
- **Privacy** — the individual\'s control over their personal data: collection, use, disclosure, retention.

You can have security without privacy (a surveillance state). You cannot have privacy without security.

## PII categories

- **PII** — Personally Identifiable Information (US term).
- **Personal Data** — GDPR equivalent, broader.
- **PHI** — Protected Health Information (HIPAA).
- **Sensitive PII / Special Categories** — health, religion, sexuality, race, biometrics, political opinion, criminal records (GDPR Article 9).

## Privacy principles (Cavoukian's PbD + GDPR Article 5)

Lawfulness · Fairness · Transparency · Purpose Limitation · Data Minimization · Accuracy · Storage Limitation · Integrity & Confidentiality · Accountability.

## Data subject rights (GDPR Articles 12-22)

Access · Rectification · Erasure · Restriction · Portability · Objection · Not subject to automated decision-making.

## Privacy techniques

- **Pseudonymization** — replace PII with reversible alias. Mapping table exists. STILL personal data under GDPR.
- **Tokenization** — replace with non-sensitive token. Vault-held mapping. Used for scope reduction.
- **Anonymization** — irreversibly destroy linkage. NO mapping. OUT of GDPR scope when truly anonymous.
- **Differential privacy** — add statistical noise to queries; protects individual records while preserving aggregate accuracy.
- **k-Anonymity / l-Diversity / t-Closeness** — formal anonymization metrics.

## Cross-border transfer

GDPR rules:
- Adequacy decisions (allowed: UK, Switzerland, Japan, Canada commercial).
- Standard Contractual Clauses (SCCs).
- Binding Corporate Rules (BCRs).
- Derogations (consent, contract, vital interests).

Schrems II killed Privacy Shield; replaced by EU-US Data Privacy Framework.

## Privacy roles

- **Data Subject** — the individual.
- **Controller** — decides why and how data is processed. ACCOUNTABLE.
- **Processor** — processes on behalf of controller (cloud vendor).
- **DPO (Data Protection Officer)** — mandatory under GDPR for public bodies, large-scale monitoring, large-scale special-category processing.
$md$,
  exam_tips = 'Privacy ≠ security but overlaps. Pseudonymization = reversible, IN scope. Anonymization = irreversible, OUT of scope. Controller is accountable; processor follows instructions.',
  think_like_manager = 'Document a Data Processing Agreement (DPA) with every vendor handling personal data. Without it, GDPR fines fall on you for their breach.',
  memory_hack = 'Privacy principles: GDPR Article 5 = Lawful, Fair, Transparent, Purpose-Limited, Minimized, Accurate, Storage-Limited, Secure, Accountable.'
WHERE domain_id = 2 AND topic_number = '2.4';

-- ── 3.3 Secure Design Principles ──────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Defense in depth, fail secure, least privilege, separation of duties — design from these principles.',
  memory_anchor = 'A castle has many walls. A secure system has many controls.',
  content_markdown = $md$
## The principles

- **Defense in depth** — layered controls. No single point of failure.
- **Least privilege** — minimum permissions for the job.
- **Separation of duties** — no single person controls a critical process end-to-end.
- **Need to know** — even cleared subjects only see what is required.
- **Fail secure / fail safe** — on failure, default to safe state. Fail-secure denies access; fail-safe protects life (fire doors fail OPEN).
- **Open design** — security through obscurity does not work. Crypto algorithms are public; KEYS are secret.
- **Complete mediation** — every access checked. No bypass paths.
- **Economy of mechanism** — keep security mechanisms simple. Complex = bug-prone.
- **Least common mechanism** — minimize shared state between users.
- **Psychological acceptability** — security must be usable; users circumvent friction.
- **Weakest link** — chain is as strong as its weakest control.
- **Trust but verify** — old model. Modern: zero trust, never trust, always verify.

## Trust boundaries

A trust boundary is where data crosses from one trust level to another. Threat models map them:
- User input → application (boundary, validate).
- Application → database (boundary, parameterize).
- Internal → external API (boundary, sign + encrypt).
- DMZ → internal network (boundary, firewall).

## Secure architecture patterns

- **Zero Trust** — every access verified.
- **Microsegmentation** — east-west isolation.
- **Bastion / jump host** — single audited entry to sensitive zones.
- **Defense-in-depth zones** — perimeter, network, host, app, data.
- **Bulkhead pattern** — isolate failures (one bad service does not cascade).

## Failure modes

- **Fail-open** — door unlocks (allows access on failure). Used for fire/safety.
- **Fail-closed / fail-secure** — door locks (denies access on failure). Used for security.
- **Graceful degradation** — system reduces capability rather than crash.
$md$,
  exam_tips = 'Open design = Kerckhoffs principle (algorithms public, keys secret). Fail-secure denies access; fail-safe protects life. Weakest link decides chain strength.',
  think_like_manager = 'Defense in depth costs more than single-layer. Justify each layer to the board with the residual-risk reduction it produces.',
  memory_hack = 'Saltzer & Schroeder eight design principles, plus zero-trust modern additions. Layer controls, fail securely, mediate completely, keep it simple.'
WHERE domain_id = 3 AND topic_number = '3.3';

-- ── 3.4 PKI and Certificate Management ────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Trust at scale for asymmetric crypto. CAs, certificates, lifecycle, revocation.',
  memory_anchor = 'A digital passport system: CA = passport office, certificate = passport, revocation = canceled passport.',
  content_markdown = $md$
## Components

- **Certificate Authority (CA)** — root of trust. Issues certificates. Public CAs: DigiCert, Let's Encrypt, GlobalSign. Private CAs for internal use.
- **Registration Authority (RA)** — verifies the requester's identity before the CA issues.
- **Certificate** — X.509 standard. Binds a public key to an identity. Signed by the CA.
- **Subordinate / Intermediate CA** — chain of trust. Roots are kept offline; subordinates issue end-entity certificates.
- **Cross-certification / Bridge CA** — inter-organization trust without merging hierarchies.

## Certificate lifecycle

1. **Enrollment** — CSR (Certificate Signing Request) generated with the keypair.
2. **Identity proofing** — RA verifies the requester (DV, OV, or EV level).
3. **Issuance** — CA signs the certificate.
4. **Distribution** — installed on servers, devices.
5. **Use** — TLS handshakes, code signing, S/MIME, client auth.
6. **Renewal** — before expiry; new keypair recommended.
7. **Revocation** — if private key compromised or no longer valid.
8. **Expiration** — certificates have limited lifetime (90 days for Let's Encrypt, 1 year max for public CAs).

## Revocation mechanisms

- **CRL** — Certificate Revocation List. Pull-model. CA publishes a list; clients download and check. Slow.
- **OCSP** — Online Certificate Status Protocol. Real-time check.
- **OCSP Stapling** — server attaches a recent OCSP response to the TLS handshake. Avoids client-side OCSP queries.
- **Short-lived certificates** — instead of revocation, rotate frequently (Let's Encrypt 90-day default).

## Trust models

- **Hierarchical** — single root, subordinate chain. Most common.
- **Mesh** — peer-to-peer trust, manually established.
- **Hybrid** — cross-certification between hierarchies.
- **Web of trust** — PGP-style, no central CA.

## Common attacks

- **Stolen private key** — attacker can impersonate. Defense: HSM-protected keys.
- **Rogue CA** — compromised CA issues fraudulent certs. Defense: Certificate Transparency logs; pinning for high-value services.
- **Wildcard cert misuse** — \*.example.com cert covers all subdomains; theft compromises all.
- **Expired cert outage** — operational, not security; but causes downtime.

## Modern best practices

- HSM-backed CA private keys.
- Short-lived end-entity certs (90 days).
- Automation (ACME protocol, cert-manager in Kubernetes).
- Certificate Transparency monitoring.
- Pinning for mobile apps where appropriate (HPKP deprecated for browsers).
$md$,
  exam_tips = 'CRL = pull, slow. OCSP = real-time. Stapling = server attaches OCSP response. EV / OV / DV = identity proofing rigor. Short-lived certs reduce revocation burden.',
  think_like_manager = 'Cert expiry causes more outages than cert theft. Automate renewal end-to-end (ACME), monitor CT logs, alert 30 days before expiry.',
  memory_hack = 'PKI = "Passport Kingdom Infrastructure." CA issues. RA verifies. CRL is the "wanted list." OCSP is "live check." Short-lived certs > long-lived + revocation.'
WHERE domain_id = 3 AND topic_number = '3.4';

-- ── 3.5 Physical Security ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Locks, fences, badges, environmental controls. The first line of defense.',
  memory_anchor = 'CPTED, mantraps, fire suppression. From outside in.',
  content_markdown = $md$
## Layered physical defenses

**Perimeter:** bollards, fencing (4-7 ft = deterrent, 8+ ft + barbed top = serious), lighting (CPTED principle), CCTV, guards.

**Building entry:** mantraps (interlocking doors prevent tailgating), turnstiles, badge readers (RFID, smart card) + PIN, biometric, visitor logs and escort policy.

**Interior:** tempered glass / safety film, locks (pin tumbler, electronic, biometric), server cabinets locked separately, cable locks for laptops.

## CPTED — Crime Prevention Through Environmental Design

Three principles:
- **Natural surveillance** — eyes on the street, clear sightlines, lighting.
- **Natural access control** — defined entry paths, landscaping that funnels movement.
- **Territorial reinforcement** — clear ownership cues (signage, paint).

## Environmental controls

- **HVAC** — temperature 64-80°F, humidity 40-60%.
- **Fire detection** — smoke detectors, heat sensors, VESDA (very early aspirating).
- **Fire suppression**:
  - **Wet pipe** — water in pipes, sprinklers fire on heat.
  - **Dry pipe** — pipes empty until alarm; reduces accidental discharge.
  - **Pre-action** — two triggers required (smoke alarm AND heat).
  - **Deluge** — open heads, all sprinklers fire at once.
  - **Gas (FM-200, Inergen, CO2)** — preferred for server rooms; no water damage.
- **Water sensors** — under raised floors.
- **UPS + generator** — redundant power.
- **EMI / EMP shielding** — Faraday cage for sensitive areas.

## Locks

- **Pin tumbler** — physical key, picked or bumped.
- **Wafer / disc** — file cabinet level.
- **Electronic** — keypad or magstripe; logs access.
- **Smart lock** — Bluetooth / cloud-managed.
- **Biometric** — fingerprint, iris, face.
- **Mechanical combo** — combination dial.
- **Class ratings** — UL grade indicates resistance time.

## Surveillance

- **CCTV** — analog or IP. Coverage of entries, exits, sensitive areas. Retention per policy.
- **Motion detection** — PIR (passive infrared), microwave, dual-tech.
- **Glass-break sensors**.

## Vehicle security

Bollards, crash barriers, vehicle inspection, K-rated barriers (K4 stops 7.5 mph, K12 stops 50 mph trucks).
$md$,
  exam_tips = 'Mantraps stop tailgating. Pre-action sprinklers prevent accidental discharge. FM-200 / Inergen / CO2 = gas suppression for server rooms. CPTED = surveillance, access control, territory.',
  think_like_manager = 'Physical security failures often surface as security incidents (badge loss, tailgating). Treat physical and logical IR jointly.',
  memory_hack = 'Layered physical: Perimeter → Building → Interior → Equipment. CPTED = SAT (Surveillance, Access, Territory). Server rooms = gas suppression.'
WHERE domain_id = 3 AND topic_number = '3.5';

-- ── 4.1 OSI and TCP/IP Models ─────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Seven layers conceptually (OSI), four layers practically (TCP/IP). Memorize both.',
  memory_anchor = 'Please Do Not Throw Sausage Pizza Away.',
  content_markdown = $md$
## OSI 7-layer model

| Layer | Name | Examples | Attack examples |
|---|---|---|---|
| 7 | Application | HTTP, DNS, SMTP | XSS, SQLi, app-layer DDoS |
| 6 | Presentation | TLS, JPEG, ASCII | Crypto downgrade, encoding bugs |
| 5 | Session | NetBIOS, RPC | Session hijacking |
| 4 | Transport | TCP, UDP | SYN flood, port scanning |
| 3 | Network | IP, ICMP, IPSec | IP spoofing, routing attacks |
| 2 | Data Link | Ethernet, ARP, MAC | ARP poisoning, VLAN hopping |
| 1 | Physical | Cables, RJ45, RF | Cable tap, jamming |

## TCP/IP model (4 layers)

- **Application** (≈ OSI 5,6,7) — HTTP, DNS, SSH, SMTP.
- **Transport** (≈ OSI 4) — TCP (reliable handshake), UDP (fire-and-forget).
- **Internet** (≈ OSI 3) — IP, ICMP, ARP.
- **Link / Network Access** (≈ OSI 1,2) — Ethernet, Wi-Fi.

## Must-know ports

| Port | Protocol |
|---|---|
| 20/21 | FTP (cleartext) |
| 22 | SSH / SFTP / SCP |
| 23 | Telnet (cleartext, never use) |
| 25 | SMTP |
| 53 | DNS (UDP queries, TCP zone xfer) |
| 67/68 | DHCP server/client |
| 80 | HTTP |
| 88 | Kerberos |
| 110 | POP3 |
| 123 | NTP |
| 143 | IMAP |
| 161/162 | SNMP / SNMP traps |
| 389 | LDAP (cleartext) |
| 443 | HTTPS |
| 445 | SMB |
| 465/587 | SMTPS / SMTP submission |
| 514 | Syslog |
| 636 | LDAPS |
| 993 | IMAPS |
| 995 | POP3S |
| 1433 / 1521 / 3306 / 5432 | MSSQL / Oracle / MySQL / Postgres |
| 3389 | RDP |
| 8080 | HTTP alt |

## TCP vs UDP

- **TCP** — connection-oriented, reliable, ordered, flow-controlled. 3-way handshake (SYN, SYN-ACK, ACK).
- **UDP** — connectionless, fire-and-forget. Used where speed > reliability (DNS, voice, video, gaming).

## IP addressing

- **IPv4** — 32 bits. Range 0.0.0.0 - 255.255.255.255.
- **Private (RFC 1918)** — 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16.
- **Loopback** — 127.0.0.0/8.
- **APIPA / link-local** — 169.254.0.0/16 (DHCP failure).
- **Multicast** — 224.0.0.0/4.
- **IPv6** — 128 bits. Loopback ::1. Link-local fe80::/10.
$md$,
  exam_tips = 'Mnemonic: Please Do Not Throw Sausage Pizza Away (Physical → Application). Memorize port numbers. ARP is L2, not L3 (despite using IPs).',
  think_like_manager = 'Port memorization seems trivial but is testable. Master the top 25 ports and the full OSI mapping.',
  memory_hack = 'OSI: PDNTSPA (Physical-Data Link-Network-Transport-Session-Presentation-Application). TCP/IP: Application-Transport-Internet-Link.'
WHERE domain_id = 4 AND topic_number = '4.1';

-- ── 4.2 Network Attacks and Countermeasures ───────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Sniffing, spoofing, hijacking, denial. Each maps to a layer; each has a defense.',
  memory_anchor = 'Attacks live at every layer. Defenses must too.',
  content_markdown = $md$
## Layer 2 attacks

- **ARP poisoning** — forged ARP replies redirect traffic via attacker. Defense: dynamic ARP inspection, static ARP for critical hosts.
- **MAC flooding** — fill the switch CAM table, force fail-open broadcast. Defense: port security, MAC limiting.
- **VLAN hopping** — switch spoofing (DTP) or double-tagging. Defense: disable DTP on access ports, change native VLAN.
- **Rogue DHCP** — attacker offers config first. Defense: DHCP snooping.
- **STP attacks** — claim root bridge. Defense: BPDU Guard, Root Guard.

## Layer 3 attacks

- **IP spoofing** — forge source IP. Defense: ingress/egress filtering, RPF (reverse path filtering).
- **ICMP flood (smurf)** — broadcast ICMP with spoofed source. Defense: disable directed broadcast, rate-limit ICMP.
- **Ping of Death** — oversize ICMP. Defense: modern OSes patched.
- **Teardrop** — overlapping IP fragments. Defense: patched OSes.
- **Routing attacks** — BGP hijacking, OSPF LSA injection. Defense: RPKI, neighbor authentication (HMAC).

## Layer 4 attacks

- **SYN flood** — half-open connections exhaust state. Defense: SYN cookies, SYN proxies.
- **Port scanning** — reconnaissance. Defense: hide unused services, IPS detection.
- **Session hijacking** — predict / steal session tokens. Defense: random tokens, rotate on auth, TLS.

## Layer 7 attacks

- **DNS poisoning / cache poisoning** — forged DNS responses. Defense: DNSSEC validation.
- **HTTP-layer DDoS (Slowloris, GET flood)** — Defense: WAF, rate limiting.
- **SQL injection, XSS, CSRF, SSRF** — see Domain 8.
- **Password spray / credential stuffing** — Defense: MFA, anomaly detection.

## DDoS classes

- **Volumetric** — fill the pipe. Reflection attacks (NTP, DNS, Memcached amplification).
- **Protocol** — exhaust state. SYN flood, Smurf.
- **Application** — Slowloris, HTTP GET flood.

## Wireless attacks

- **Evil twin / rogue AP** — Defense: 802.1X, WIDS.
- **Deauthentication** — kick clients off. Defense: 802.11w (PMF).
- **WPS PIN brute force** — Defense: disable WPS.
- **WEP cracking** — Defense: never use WEP. WPA2/3 only.

## MITM techniques

- **ARP poisoning** (L2)
- **Rogue DHCP** offering attacker as gateway
- **Rogue Wi-Fi AP**
- **TLS stripping** (SSLstrip) — downgrade HTTPS to HTTP. Defense: HSTS.
- **DNS spoofing**

## Reconnaissance

Passive (whois, DNS, OSINT) → Active (port scan, banner grab, vuln scan) → Exploitation.
$md$,
  exam_tips = 'Match attack to layer. ARP poisoning = L2. SYN flood = L4. DDoS classes: volumetric, protocol, application. DNSSEC defends DNS poisoning, NOT DoH bypass.',
  think_like_manager = 'A WAF and DDoS protection are insurance: cheap when not needed, irreplaceable in an event. Keep them on, tune the rules, do not let them lapse.',
  memory_hack = 'Attacks at each layer: L2 ARP, L3 IP spoof, L4 SYN flood, L7 SQL/XSS. DDoS = volumetric/protocol/application.'
WHERE domain_id = 4 AND topic_number = '4.2';

-- ── 4.4 VPNs and Secure Communication ─────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'IPSec at L3, SSL/TLS VPN at L7, ZTNA replacing both. Pick by threat model.',
  memory_anchor = 'VPN = encrypted tunnel. Where the tunnel terminates determines the visibility.',
  content_markdown = $md$
## VPN types

- **Site-to-site** — gateway-to-gateway. Branch office to HQ. IPSec common.
- **Remote access** — user device to corporate network. Historically IPSec; modern often SSL/TLS VPN or ZTNA.
- **Client-to-server** — TLS to a specific application (not "VPN" in the classic sense).

## IPSec

- Operates at Layer 3 (IP).
- **AH (Authentication Header)** — integrity + authenticity, NO confidentiality.
- **ESP (Encapsulating Security Payload)** — integrity + authenticity + confidentiality.
- **Transport mode** — only payload encrypted (host-to-host).
- **Tunnel mode** — full IP packet encrypted, new IP header (gateway-to-gateway).
- **IKE (Internet Key Exchange)** — negotiates parameters. IKEv2 modern.
- Wraps ALL IP traffic = stronger isolation than SSL VPN.

## SSL/TLS VPN

- Operates at Layer 4-7 depending on mode.
- **Clientless** — browser SSL portal proxies specific apps.
- **Client** — full tunnel via browser plugin or thick client.
- Easier to deploy (no special client / OS support); easier to firewall (HTTPS).
- Risk: **split tunneling** — non-corporate traffic goes direct to internet, bypassing inspection.

## ZTNA — Zero Trust Network Access

- Replaces VPN with per-app brokered access.
- User authenticates and is GRANTED access ONLY to the specific app, not the network.
- No lateral movement risk if user is compromised.
- Examples: Cloudflare Access, Zscaler ZPA, Tailscale, Palo Alto Prisma Access.

## Secure protocols (in transit)

- **TLS 1.3** — current. Forward secrecy, removed weak ciphers.
- **SSH** — terminal access, file transfer, port forwarding.
- **HTTPS** — HTTP over TLS.
- **mTLS** — mutual TLS, both sides present certificates. Service-to-service trust.
- **WireGuard** — modern, lean, fast VPN protocol. Replacing IPSec/OpenVPN in many deployments.

## Out-of-band channels

For management traffic:
- **Console / serial** — physical access only.
- **iLO / iDRAC / IPMI** — out-of-band management interfaces. Should be on isolated management VLAN with strong auth.

## Trade-offs

| Technology | Layer | Strength | Weakness |
|---|---|---|---|
| IPSec | 3 | Full traffic, strong | Complex, NAT issues |
| SSL/TLS VPN | 4-7 | Easy to deploy | Split tunneling risk |
| ZTNA | App | Per-app, no lateral | Requires modern stack |
| WireGuard | 3 | Fast, simple | Less enterprise tooling |
$md$,
  exam_tips = 'IPSec = L3, full traffic. SSL VPN = L7, app-specific. ZTNA replaces VPN. AH = integrity only; ESP = integrity + confidentiality. Tunnel mode = gateway-to-gateway.',
  think_like_manager = 'VPNs grant network access. ZTNA grants app access. Modern programs migrate from VPN to ZTNA to eliminate the lateral-movement risk.',
  memory_hack = 'IPSec: AH integrity, ESP encrypt. Modes: Transport (host-host), Tunnel (gateway). SSL VPN = browser-based. ZTNA = per-app, no network grant.'
WHERE domain_id = 4 AND topic_number = '4.4';

-- ── 4.5 Wireless Security ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'WPA3 + 802.1X + EAP-TLS for enterprise. Anything less is pre-2018 thinking.',
  memory_anchor = 'WEP < WPA < WPA2 < WPA3. EAP-TLS is the gold standard.',
  content_markdown = $md$
## Wireless authentication evolution

- **WEP** — 1997. RC4 + weak IV. Crackable in minutes. NEVER use.
- **WPA** — 2003. TKIP. Transitional patch on WEP. Still weak.
- **WPA2** — 2004. AES-CCMP. KRACK attack (2017) on the 4-way handshake.
- **WPA3** — 2018. SAE (Simultaneous Authentication of Equals) replaces the 4-way handshake. Forward secrecy. No offline dictionary attack.

## Personal vs Enterprise

- **Personal (PSK)** — pre-shared passphrase. Same key for everyone. Compromise = re-key everyone.
- **Enterprise (802.1X)** — per-user / per-device authentication via RADIUS. Compromise = revoke that one identity.

## EAP methods

- **EAP-TLS** — mutual cert-based. STRONGEST. Both client and server present X.509 certs. No passwords.
- **EAP-TTLS** — server cert + tunnel; client uses password inside the tunnel.
- **PEAP** — server cert + tunnel; client password inside (Microsoft's variant of TTLS).
- **EAP-FAST** — Cisco's tunneled method. Largely deprecated.
- **LEAP** — Cisco legacy. BROKEN. Do not use.

## Wireless attacks

- **Evil twin / rogue AP** — attacker creates an SSID matching corporate. Defense: 802.1X mutual auth, WIDS.
- **Deauth flood** — kicks legitimate clients off. Defense: 802.11w PMF (Protected Management Frames).
- **WPS PIN brute force** — 8-digit PIN broken in hours. Defense: disable WPS.
- **KRACK** — patched in WPA2 firmware updates.
- **Dragonblood** — attacks on early WPA3-SAE implementations. Patched.

## WIDS / WIPS

- Wireless Intrusion Detection / Prevention System. Detects rogue APs, evil twins, attacks. Often built into enterprise APs.

## Other wireless

- **Bluetooth** — bluejacking (unwanted messages), bluesnarfing (data theft), bluebugging (full takeover). Defense: latest BT version, no discoverable mode, pairing PINs.
- **NFC** — short range; eavesdropping at 1m possible. Use TLS-equivalent over NFC for payments.
- **RFID** — cloning, replay. Defense: shielded sleeves, encrypted RFID.
- **Zigbee / Z-Wave / LoRa** — IoT mesh. Often weak default keys.
- **5G** — improved over 4G; mutual authentication, encrypted IMSI.
$md$,
  exam_tips = 'WPA3 + 802.1X + EAP-TLS = strongest. EAP-TLS uses certs on both sides. PEAP/TTLS use server cert + password tunnel. WPS = disable always.',
  think_like_manager = 'Guest Wi-Fi is segregated to its own VLAN with internet only. Corporate Wi-Fi requires 802.1X. Trust nothing in between.',
  memory_hack = 'WEP-WPA-WPA2-WPA3 generations. EAP-TLS = mutual cert, no passwords. WPS = disable. Evil twin = rogue AP with your SSID.'
WHERE domain_id = 4 AND topic_number = '4.5';

-- ── 5.3 Single Sign-On and Federation ─────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'SSO = one login, many apps. Federation = trust between domains. SAML, OIDC, OAuth.',
  memory_anchor = 'IdP authenticates. SP serves the app. SAML = enterprise XML. OIDC = modern JSON.',
  content_markdown = $md$
## SSO basics

Single Sign-On lets a user authenticate once and access multiple apps without re-entering credentials. The SSO server is the IdP (Identity Provider). Apps (Service Providers / Relying Parties) trust the IdP.

## SAML 2.0

- XML-based assertions.
- IdP signs assertions; SP validates signature.
- Three statement types: Authentication, Attribute, Authorization Decision.
- Bindings: HTTP-Redirect (URL param), HTTP-POST (form), Artifact (reference fetched separately).
- Common in enterprise (Okta, Azure AD, ADFS, Ping).

## OAuth 2.0

- AUTHORIZATION protocol. Delegates limited access.
- Grant types:
  - Authorization Code (+ PKCE) — gold standard for web/mobile.
  - Client Credentials — machine-to-machine.
  - Implicit — DEPRECATED.
  - Resource Owner Password Credentials — DEPRECATED.
- Tokens: access token (short-lived), refresh token (longer).

## OpenID Connect (OIDC)

- AUTHENTICATION on top of OAuth 2.0.
- Adds the ID Token: a JWT proving the user's identity.
- Modern, JSON-based, mobile-friendly.
- Replaces SAML in greenfield apps.

## JWT — JSON Web Token

- Three parts: HEADER.PAYLOAD.SIGNATURE (base64-encoded, dot-separated).
- SIGNED, not encrypted. Anyone with the token reads the payload.
- For confidentiality use JWE.
- Algorithms: RS256 (RSA), ES256 (ECDSA), HS256 (HMAC).
- Common claims: iss (issuer), sub (subject), aud (audience), exp (expiration), iat (issued at).

## SCIM

- System for Cross-domain Identity Management.
- RESTful API for provisioning user accounts across SaaS.
- Standard endpoints: /Users, /Groups.
- Pairs with SAML/OIDC: SCIM provisions, SAML/OIDC authenticates.

## Federation models

- **Hub-and-spoke** — central IdP, multiple SPs (most common).
- **Mesh** — bilateral trust between IdPs.
- **Trust frameworks** — government / inter-org (e.g., InCommon, eduGAIN).

## Identity proofing levels (NIST SP 800-63A)

- **IAL1** — self-asserted.
- **IAL2** — remote ID verification (document scan, biometric match).
- **IAL3** — in-person verification.

## Authenticator assurance levels (NIST SP 800-63B)

- **AAL1** — single-factor.
- **AAL2** — multi-factor.
- **AAL3** — multi-factor with hardware-backed authenticator and verifier impersonation resistance.
$md$,
  exam_tips = 'SAML = XML, enterprise. OIDC = JSON, modern. OAuth = authorization (delegation). OIDC adds authentication. JWT signed (not encrypted). SCIM = provisioning.',
  think_like_manager = 'Phishing-resistant auth (FIDO2) at AAL3 for privileged accounts. AAL2 (MFA) for general users. Plain password (AAL1) only for low-value, public-facing apps.',
  memory_hack = '"OAuth opens the door, OIDC checks the ID, SAML is the legacy enterprise bouncer with a fax machine, SCIM does the paperwork."'
WHERE domain_id = 5 AND topic_number = '5.3';

-- ── 5.5 Identity Lifecycle ────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Joiner-Mover-Leaver. The Mover step is where privilege creep is born.',
  memory_anchor = 'JML — every account has three transitions. Most orgs nail Joiner, fail Leaver and Mover.',
  content_markdown = $md$
## Joiner-Mover-Leaver (JML)

### Joiner
- HR system creates the identity record.
- Identity proofing (background check, ID verification).
- Provisioning into directory + role-based app access via SCIM.
- Mandatory training before access activates.
- Day-one MFA enrollment.
- Issue equipment, set up email, calendar.

### Mover (the dangerous step)
- Internal transfer or role change.
- OLD access REMOVED — most common failure point. Privilege creep starts here.
- NEW access granted by new role.
- Manager attestation.
- Update conflict-of-interest, separation-of-duties checks.
- Update reporting structure.

### Leaver
- IMMEDIATE disable of authentication (NOT just delete — preserve audit trail).
- IMMEDIATE revoke of session tokens (active SSO sessions, OAuth refresh tokens).
- Mailbox conversion / forwarding rules.
- Hardware return (laptop, phone, tokens, badges).
- Knowledge transfer.
- Account formally deleted after retention period.
- Off-platform credentials (cloud admin, SaaS, vendor portals, code repos).

## Privilege creep

Accumulated permissions over a career via Mover events without OLD-access removal. Mitigated by:
- Quarterly access recertification.
- Attribute-based access (rules update automatically with role).
- Time-bound access for privileged grants.

## Access recertification

- Cycle: quarterly for high-risk, annually for general.
- Reviewer: data owner or manager (NOT IT).
- Tool: GRC platform with workflow.
- Outcome: confirm, modify, or revoke. Auditable.

## Third-party / vendor access

- Same lifecycle but with EXPLICIT EXPIRY by default.
- Scoped privileges.
- Contract-mandated offboarding triggers.
- Separate identity store often (B2B IdP).

## Service accounts

- Non-human; used by applications and automation.
- Often the WEAKEST controls. Watch for:
  - No password rotation.
  - No MFA possible.
  - Broad permissions.
- Modern fix: managed identities (Azure MI, AWS IAM roles), gMSA (group-managed service accounts in AD).

## Break-glass accounts

- Sealed accounts for disaster recovery.
- Strong password split between custodians (Shamir secret sharing).
- Use triggers an alert.
- Reviewed quarterly.
$md$,
  exam_tips = 'JML lifecycle. Mover = OLD access must be removed before NEW granted. Leaver = disable AUTH first (preserve audit). Service accounts = weakest tier.',
  think_like_manager = 'Automate JML via SCIM and HR-driven triggers. Manual ticket-based provisioning fails at scale and breeds privilege creep.',
  memory_hack = 'JML: Joiner → Mover → Leaver. The Mover step is where privilege creep is born. Quarterly recertification cleans it up.'
WHERE domain_id = 5 AND topic_number = '5.5';

-- ── 6.1 Vulnerability Assessments ─────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Automated, broad, no-exploit scans. The first half of the assessment pipeline.',
  memory_anchor = 'Scan finds weaknesses; pen test confirms exploitability.',
  content_markdown = $md$
## Vulnerability assessment scope

- **Network scan** — ports, services, banners. Tools: Nessus, Qualys, OpenVAS, Rapid7.
- **Web app scan** — known web vulns. Tools: OWASP ZAP, Burp, Acunetix.
- **Authenticated scan** — credentials provided to scan deeper. Reveals OS-level patches, config drift.
- **Database scan** — DB-specific weaknesses. Tools: AppDetectivePro, DBProtect.
- **Container / IaC scan** — image vulns, misconfigurations. Tools: Trivy, Snyk, Checkov.
- **Code scan (SAST)** — see Domain 8.

## CVSS — Common Vulnerability Scoring System

v3.1 Base Score = AV/AC/PR/UI × C/I/A.

| Score | Severity |
|---|---|
| 9.0-10.0 | Critical |
| 7.0-8.9 | High |
| 4.0-6.9 | Medium |
| 0.1-3.9 | Low |
| 0.0 | None |

Base / Temporal / Environmental metric groups. Most orgs use Base.

## CVE — Common Vulnerabilities and Exposures

- Standardized identifier (CVE-YYYY-NNNN).
- Maintained by MITRE.
- Cross-references between vendors / tools.

## Vulnerability management lifecycle

1. **Discover** — scan + asset inventory.
2. **Prioritize** — CVSS + business criticality + exploitability (KEV catalog from CISA).
3. **Remediate** — patch, mitigate, accept.
4. **Verify** — re-scan to confirm.
5. **Report** — metrics: time-to-patch, KPI vs SLA.

## SLAs (typical)

- Critical CVE: 14 days.
- High: 30 days.
- Medium: 90 days.
- Low: best effort.

## False positives

The scanner says vulnerable but the vuln is mitigated by configuration or compensating control. Document the analysis; do not just dismiss.

## Vulnerability vs threat vs risk

- **Threat** — anyone or anything that could harm.
- **Vulnerability** — a weakness that a threat could exploit.
- **Risk** — the combination: probability + impact.
$md$,
  exam_tips = 'Scan = automated, no exploit. Pen test = manual + tools, exploitation. CVSS Critical = 9.0+. KEV catalog (CISA) lists actively exploited CVEs - prioritize these.',
  think_like_manager = 'Vulnerability count is a vanity metric. Time-to-patch and KEV-coverage are the real KPIs.',
  memory_hack = 'CVE = ID. CVSS = severity. Vuln scan continuous. Pen test periodic. KEV = "currently being exploited" — patch first.'
WHERE domain_id = 6 AND topic_number = '6.1';

-- ── 6.3 Security Auditing ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Independent verification that controls work as designed. Internal, external, third-party.',
  memory_anchor = 'Audit = evidence collection + control testing + opinion. Not the same as monitoring.',
  content_markdown = $md$
## Audit types

- **Internal audit** — own staff (or rotated). Preparatory; finds gaps before external.
- **External audit** — third party. Required for SOC 2, ISO 27001, financial.
- **Regulatory audit** — government (HIPAA, FFIEC, PCI assessor).
- **Vendor / third-party audit** — assess your suppliers.

## SOC reports (AICPA)

- **SOC 1** — financial reporting controls (controls AT a service org affecting financial statements).
- **SOC 2** — security/availability/confidentiality/processing integrity/privacy controls.
- **SOC 3** — public-friendly version of SOC 2.
- **Type I** — point in time. Design only.
- **Type II** — period of time (typically 6+ months). Design AND operating effectiveness.

## ISO 27001 certification

- Information Security Management System (ISMS).
- Annex A = 93 controls (in 27001:2022).
- Three-year cycle: stage 1 (documentation review) + stage 2 (operational review), surveillance audits annually, recertification every 3 years.

## Key audit concepts

- **Audit trail** — chronological log of events. Tamper-evident, retained.
- **Sampling** — statistical test of a population. Stratified, random.
- **Materiality** — threshold below which findings are insignificant.
- **Walkthrough** — auditor observes a process end-to-end with the operator.
- **Inquiry, observation, inspection, re-performance** — auditor evidence-gathering methods.
- **Audit opinion** — unqualified (clean), qualified, adverse, disclaimer.

## Audit logging

What to log:
- Authentication (success and failure)
- Authorization (privilege use)
- Data access (especially sensitive)
- Changes (config, code, schema)
- System events (start/stop)
- Security events (IDS alerts, AV detections)

What NOT to log:
- Passwords / secrets
- Full PAN (PCI) — last four only
- Full PHI in plaintext
- Session tokens

## Log management

- Forward to central SIEM.
- Tamper-protect (write-once, hash chains).
- Retain per regulation (typically 1-7 years).
- Time-synchronized via NTP.

## SOX-specific

- IT general controls (ITGCs): access, change management, operations, data backup.
- Tested annually.
- Material weakness vs significant deficiency vs control deficiency.
$md$,
  exam_tips = 'SOC 2 Type II > Type I (Type I is point-in-time only). ISO 27001 = ISMS certification, 3-yr cycle. Audit logs must NOT contain secrets or full PAN.',
  think_like_manager = 'Audits find issues that monitoring misses. Treat audit findings as a roadmap, not a punishment. Track remediation in a CAP (Corrective Action Plan).',
  memory_hack = 'SOC 1 = $$ controls. SOC 2 = security controls. Type II > Type I. ISO 27001 = ISMS certification. Audit trail = tamper-evident log.'
WHERE domain_id = 6 AND topic_number = '6.3';

-- ── 6.4 Log Management and Monitoring ─────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Central collection, correlation, alerting, retention. SIEM is the hub.',
  memory_anchor = 'Logs are forensic gold — only if collected, centralized, and protected.',
  content_markdown = $md$
## Sources

- **Authentication** — login success/failure across all systems.
- **Authorization** — privilege grants and use.
- **Network** — firewall denies, IDS alerts, DNS queries, NetFlow.
- **Endpoint** — process execution, file access, EDR alerts.
- **Application** — admin actions, sensitive data access, errors.
- **Cloud** — AWS CloudTrail, Azure Activity Log, GCP Audit Logs.
- **Identity** — SSO events, MFA events, PAM session recordings.

## Centralization

- Forward via syslog (UDP 514, TCP 514, TLS 6514).
- Or via agent (Splunk Universal Forwarder, Filebeat, Wazuh).
- Or via API (cloud-native sources).

## SIEM functions

- **Collect** — ingest from heterogeneous sources.
- **Normalize** — parse into a common schema.
- **Correlate** — rules ("login from new country AND privileged action within 1 hr").
- **Alert** — to SOC analysts.
- **Store** — retention, search, forensic evidence.

## SOAR

- Security Orchestration, Automation, and Response.
- Playbooks automate response (block IP, isolate host, create ticket).
- Reduces analyst toil and MTTR.

## UEBA

- User and Entity Behavior Analytics.
- Baselines normal behavior; flags deviations.
- Often a feature inside SIEM/XDR.

## Log integrity

- WORM (Write-Once-Read-Many) storage.
- Hash chains.
- Immutable cloud bucket policies.
- Forwarded copies to a separate, restricted-access archive.

## Time synchronization

- NTP critical for forensic correlation.
- Use authoritative time source (GPS or atomic clock).
- Time skew breaks Kerberos, certificate validation, log analysis.

## Retention

- HIPAA: 6 years.
- SOX: 7 years.
- PCI: 1 year online + 1 year archive.
- GDPR: only as long as needed; document the rationale.

## Metrics

- **MTTD** — Mean Time To Detect.
- **MTTR** — Mean Time To Respond.
- **MTTC** — Mean Time To Contain.
- **False positive rate** — high rates erode SOC effectiveness.
- **Alert volume** — fewer, higher-fidelity alerts > many low-quality alerts.
$md$,
  exam_tips = 'SIEM = collect+correlate+alert. SOAR = automate response. UEBA = baseline behavior. WORM storage for log integrity. NTP critical for forensic correlation.',
  think_like_manager = 'Tune the SIEM relentlessly. A SOC drowning in false positives is worse than no SOC.',
  memory_hack = 'SIEM = collect, normalize, correlate, alert, store. SOAR = automate. UEBA = behavior baseline. Logs = WORM + NTP + central + retained.'
WHERE domain_id = 6 AND topic_number = '6.4';

-- ── 6.5 Security Metrics and KPIs ─────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'You manage what you measure. Pick metrics the board cares about.',
  memory_anchor = 'KPIs = performance. KRIs = risk. Both report up.',
  content_markdown = $md$
## Leading vs lagging indicators

- **Leading** — predict future state. Patch coverage, MFA enrollment %, training completion, MTTD trend.
- **Lagging** — measure past performance. Incidents per quarter, breach cost, audit findings, SLA misses.

## KPI vs KRI

- **KPI (Key Performance Indicator)** — measures program performance toward goals.
- **KRI (Key Risk Indicator)** — early warning of an emerging risk.

## Top metrics to track

### Identity & Access
- MFA enrollment %
- Privileged accounts with PAM coverage %
- Access recertifications completed on time
- Average time-to-deprovision after termination
- Service accounts with rotated credentials

### Vulnerability & Patch
- Time to patch (critical / high / medium SLAs)
- KEV catalog coverage
- Endpoints with current patches %
- Recurring findings (same CVE multiple cycles)

### Threat Detection
- MTTD, MTTR, MTTC
- False positive rate
- Threat hunt findings
- Phishing simulation click rate (trending down)

### Operational
- Patch SLA compliance %
- Change management failure rate
- Backup restore test pass rate
- Tabletop exercise completion
- Security awareness training completion

### Business
- Compliance audit findings (count + severity)
- Cost of incidents
- Insurance premium delta YoY

## Reporting cadence

- Daily: SOC ops dashboards.
- Weekly: SOC manager.
- Monthly: CISO.
- Quarterly: board / risk committee.
- Annually: comprehensive review.

## Metric pitfalls

- **Vanity metrics** — count of alerts, count of CVEs. Unactionable.
- **Goodhart\'s Law** — "When a measure becomes a target, it ceases to be a good measure." (E.g., "close 100 tickets per week" leads to closing tickets without resolving.)
- **Survivorship bias** — measuring only what survives the breach (the breach victim has zero "clean" days).
$md$,
  exam_tips = 'KPI = performance. KRI = risk. Leading > lagging for proactive programs. Avoid vanity metrics (alert count). Phishing simulation click rate is a real metric.',
  think_like_manager = 'Pick 5-7 metrics the board can absorb. Tell a story: "MFA coverage rose from 60% to 95%, privileged account dwell time dropped from 215 hrs to 8 hrs."',
  memory_hack = 'KPI / KRI / leading / lagging. MTTD, MTTR, MTTC. Patch SLA. Recertification %. Phishing click rate. Goodhart says: do not optimize the measure.'
WHERE domain_id = 6 AND topic_number = '6.5';

-- ── 7.2 Disaster Recovery ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Restore IT operations after disruption. RTO drives the architecture.',
  memory_anchor = 'Cold → Warm → Hot → Mirrored. Cost rises with readiness.',
  content_markdown = $md$
## DR foundations

DR = recovering IT systems and data after disruption. A subset of BCP focused on technology.

## DR site types

- **Cold site** — building + power + cooling. No hardware. Cheapest. Restore: weeks.
- **Warm site** — building + power + cooling + hardware (powered off or partial). No current data. Restore: hours to a day.
- **Hot site** — fully equipped + replicated data. Can take production load within minutes. Expensive.
- **Mirrored site** — active-active. Continuous load sharing. Most expensive. RTO ≈ 0.
- **Mobile site** — trailer that drives to your location. FEMA, some financial.
- **Cloud DR** — pay-per-use compute. Pilot light, warm standby, hot standby.

## Backup strategies

- **Full** — copies everything. Slow backup, fast restore.
- **Incremental** — changes since last backup. Fast backup, slow restore (chain).
- **Differential** — changes since last full. Medium speed both ways.
- **Synthetic full** — modern; combines full + incrementals server-side.

### 3-2-1 Rule
- 3 copies of data
- 2 different media types
- 1 offsite (or air-gapped / immutable)

### 3-2-1-1-0 (ransomware-aware)
- + 1 immutable / offline copy
- + 0 errors verified by restore test

## Data replication

- **Synchronous** — write to both sites before acknowledging. RPO ≈ 0. Distance-limited (latency).
- **Asynchronous** — write locally, replicate after. RPO measurable. Long-distance OK.
- **Snapshot-based** — point-in-time copies. Schedule-driven.
- **Continuous data protection (CDP)** — every write logged; granular point-in-time recovery.

## Recovery types

- **Failover** — automatic switch to standby.
- **Failback** — return to primary after primary is restored.
- **Database log shipping** — periodic log replay to standby.
- **Database mirroring** — synchronous mirror.

## DR test types

| Test | Description | Disruption | Realism |
|---|---|---|---|
| Tabletop | Discussion-only | None | Low |
| Walkthrough | Trace the steps | None | Low-medium |
| Simulation | Mock crisis in test env | Low | Medium |
| Parallel | Run DR alongside prod | Low | High |
| Full interruption | Cut the cord | High | Highest |

## Critical metrics

- **RTO** — Recovery Time Objective.
- **RPO** — Recovery Point Objective.
- **MTD** — Maximum Tolerable Downtime.
- **WRT** — Work Recovery Time.
- MTD = RTO + WRT.

## Common pitfalls

- **DR plan never tested** — fails on day one.
- **Backup not restored** — backup that has never restored is unverified.
- **Single tape format / single vendor** — diversification of media + provider matters.
- **Documentation in the affected data center** — store offsite copies.
$md$,
  exam_tips = '3-2-1 rule. Hot site = ready, cold site = empty. Synchronous replication = RPO 0 but distance-limited. Test types: tabletop (cheapest) → full interruption (most realistic).',
  think_like_manager = 'Restore tests are the only way to validate DR. Quarterly random-sample restores; annual full DR exercise.',
  memory_hack = 'Site types: Cold-Warm-Hot-Mirrored. Backup: 3-2-1 (or 3-2-1-1-0 for ransomware). Sync = RPO 0, distance-limited.'
WHERE domain_id = 7 AND topic_number = '7.2';

-- ── 7.3 Change and Configuration Management ───────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Documented, peer-reviewed, approved, scheduled, with rollback. Change discipline prevents most outages.',
  memory_anchor = 'Every change has a ticket, an approver, a window, and a rollback.',
  content_markdown = $md$
## Change management process

1. **Request for Change (RFC)** — submit details, business justification.
2. **Impact analysis** — affected systems, downstream consequences.
3. **Peer review** — technical sanity check.
4. **Change Advisory Board (CAB)** — approves non-routine changes. Includes ops, security, business owners.
5. **Schedule** — communicate the window. Avoid critical periods.
6. **Implement** — execute the change.
7. **Verify** — confirm intended effect, no unexpected side effects.
8. **Document** — close the ticket with results.

## Change types

- **Standard** — pre-approved, low-risk, repeatable (e.g., user password reset).
- **Normal** — requires CAB approval.
- **Emergency** — must happen immediately to fix a critical issue. Still requires expedited approval and post-implementation review.

## Configuration management

- **Baseline** — golden configuration for a system class. CIS Benchmarks, DISA STIGs.
- **Drift detection** — automated comparison against baseline; alert on deviation.
- **Configuration items (CIs)** — tracked components in the CMDB.
- **CMDB** — Configuration Management Database. Inventories CIs and relationships.

## IaC — Infrastructure as Code

- Terraform, CloudFormation, Pulumi, Ansible, Puppet, Chef.
- Configuration becomes versioned code.
- Pull request review = change approval.
- Drift detection = comparing live state to repo.

## Patch management

- **SLAs** — critical 14 days, high 30, medium 90.
- **Test rings** — dev → staging → prod (canary subset → full).
- **Emergency patches** — out-of-band; expedited change ticket.
- **Vulnerability-driven** — patch the CVEs that are being exploited (KEV catalog) first.

## Common change pitfalls

- **No rollback plan** — change fails, recovery improvised.
- **Production change without ticket** — silent change = unauditable.
- **CAB rubber-stamping** — meeting becomes performative; no real review.
- **Dependency surprises** — change breaks downstream service nobody flagged.

## Change windows

- Maintenance windows: scheduled times when changes are allowed.
- Freeze periods: blackout (e.g., year-end financial close, holiday peak).
- Break-fix exceptions: only with executive approval.

## ITIL alignment

CISSP often references ITIL (IT Infrastructure Library) for change management. Service Strategy → Service Design → Service Transition (Change Mgmt lives here) → Service Operation → Continual Service Improvement.
$md$,
  exam_tips = 'Standard / Normal / Emergency changes. CAB approves normal. Baseline + drift detection = configuration management. IaC makes change a PR.',
  think_like_manager = 'Without change management, every outage becomes "we changed something but nobody knows what." With it, RCA is fast and learning is structured.',
  memory_hack = 'Change types: Standard (pre-approved), Normal (CAB), Emergency (expedited + post-review). Configuration: Baseline → Drift Detection → Remediate.'
WHERE domain_id = 7 AND topic_number = '7.3';

-- ── 7.4 Digital Forensics ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Collect, preserve, analyze, present. Chain of custody is the heart of admissibility.',
  memory_anchor = 'Image first, analyze the copy, lock the original.',
  content_markdown = $md$
## Forensic process

1. **Identification** — what is the evidence?
2. **Preservation** — write-blocker, isolated environment.
3. **Collection** — bit-for-bit image. Hash before and after to prove integrity.
4. **Examination** — recover deleted files, parse artifacts, extract IOCs.
5. **Analysis** — reconstruct events, build timeline.
6. **Presentation** — report + expert testimony.

## Order of volatility (RFC 3227)

Capture from MOST to LEAST volatile:

1. CPU registers / cache
2. RAM
3. Running processes / network connections
4. Temp files / swap
5. Disk
6. Off-system logs / SIEM
7. Physical media (backups, optical)

NEVER pull power on a running compromised system before capturing RAM. Decryption keys, malware, active C2 connections live in RAM.

## Chain of custody

- WHO has the evidence
- WHEN they had it
- WHERE it was stored
- WHY it was accessed
- WHAT (if anything) was done

Any break in the chain = inadmissible in court.

## Tools

- **Imaging** — FTK Imager, dd, EnCase, X-Ways, Autopsy.
- **Memory** — Volatility, Rekall.
- **Network** — Wireshark, NetworkMiner.
- **File systems** — Sleuth Kit, Autopsy.
- **Mobile** — Cellebrite UFED, Magnet AXIOM.
- **Cloud** — provider-specific (AWS Detective, Azure Sentinel, GCP Chronicle).

## Integrity

Hash the original (MD5/SHA-256) before imaging. Hash the image. Hashes must match. Any analysis happens on a copy of the image, never the original.

## Anti-forensics

- **Encryption** — full-disk, file-level. Mitigated by capturing keys from RAM before shutdown.
- **Steganography** — data hidden inside other files (image LSBs).
- **File carving** — recovers fragments after deletion.
- **Timestomping** — modifying file timestamps. Detect via filesystem-level metadata.
- **Wipers** — secure-delete tools. Recovery often impossible.

## Legal admissibility

- **Daubert standard** (US federal) — scientific reliability of expert testimony.
- **Frye standard** (some states) — general acceptance.
- **Best evidence rule** — original preferred, but digital "originals" = forensic image + hash.
- **Hearsay** — out-of-court statements offered for truth. Logs are typically business records exception.

## Incident vs investigation

- **Incident response** — primary goal: contain and recover.
- **Forensic investigation** — primary goal: understand and prove.

These overlap but have different priorities. IR may take actions that contaminate evidence (e.g., reboot to clear malware). Forensics requires evidence preservation first.
$md$,
  exam_tips = 'RFC 3227 order. NEVER power off before RAM capture. Chain of custody = WHO/WHEN/WHERE/WHY/WHAT. Hash before and after imaging. Daubert standard for expert testimony.',
  think_like_manager = 'In a serious incident, engage qualified forensic counsel BEFORE actions are taken. Untrained IR can destroy admissibility.',
  memory_hack = 'Image first → analyze the copy → lock the original. Volatility order: CPU → RAM → processes → temp → disk → logs → tape.'
WHERE domain_id = 7 AND topic_number = '7.4';

-- ── 7.5 Security Operations Center ────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'The 24/7 hub for monitoring, detection, response. Tier 1 → Tier 3 + threat hunting.',
  memory_anchor = 'SOC = "see something, do something." Continuously.',
  content_markdown = $md$
## SOC functions

- **Monitoring** — alerts from SIEM/EDR/XDR/NDR.
- **Triage** — classify, prioritize, escalate.
- **Investigation** — confirm threat, scope.
- **Response** — contain, eradicate, recover.
- **Threat hunting** — proactive search for adversaries that bypass detection.
- **Threat intelligence** — consume external feeds, generate internal.
- **Reporting** — daily ops, weekly trends, monthly KPIs.

## SOC tiers

- **Tier 1** — initial alert review. Triage, escalate, false-positive dismissal. Often via runbooks.
- **Tier 2** — investigation, deeper analysis, contain. More experienced analysts.
- **Tier 3** — advanced response, malware analysis, threat hunting, IR leadership.
- **Threat hunters** — proactive, hypothesis-driven.

## Tools stack

- **SIEM** — Splunk, Microsoft Sentinel, Elastic, IBM QRadar.
- **SOAR** — Phantom (Splunk SOAR), Cortex XSOAR, Tines.
- **EDR / XDR** — CrowdStrike, Microsoft Defender, SentinelOne, Cortex XDR.
- **NDR** — Darktrace, Vectra, Corelight.
- **TIP** — Threat Intel Platform: MISP, Anomali.
- **Ticketing** — ServiceNow, Jira.

## Models

- **In-house SOC** — full ownership. Most expensive.
- **MSSP (Managed Security Service Provider)** — outsourced monitoring.
- **MDR (Managed Detection & Response)** — outsourced + active response.
- **Hybrid** — in-house tier 3 + MSSP tier 1.
- **Co-managed** — joint operation with vendor.

## Metrics

- **MTTD** — Mean Time To Detect.
- **MTTR** — Mean Time To Respond.
- **MTTC** — Mean Time To Contain.
- **Alert fidelity** — % of alerts that are real incidents.
- **Coverage** — % of MITRE ATT&CK techniques detectable.

## Threat hunting

- **Hypothesis-driven** — "if attacker X were here, we would see Y."
- **IOC-driven** — search for indicators across logs.
- **TTP-driven** — hunt for specific techniques (e.g., process injection, lateral movement via WMI).

## Burn-out and analyst retention

- Tier 1 churn is industry-wide. Symptoms: alert fatigue, runbook robotism, no growth path.
- Mitigation: rotate, automate (SOAR), invest in training, clear T1→T2→T3 ladder.
$md$,
  exam_tips = 'Tier 1 triage, Tier 2 investigate, Tier 3 advanced. MSSP outsources monitoring; MDR outsources response too. Hunt = proactive (no alert required).',
  think_like_manager = 'Buy / build decision: pure in-house at scale is rare and expensive. Most enterprises co-manage with an MSSP. Always retain Tier 3 in-house.',
  memory_hack = 'SOC tiers 1-2-3 + hunters. Tools: SIEM (collect+correlate) + SOAR (automate) + EDR/XDR/NDR (telemetry). MTTD / MTTR / MTTC.'
WHERE domain_id = 7 AND topic_number = '7.5';

-- ── 8.3 Secure Coding Practices ───────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Input validation, output encoding, parameterized queries, secure session, fail-closed.',
  memory_anchor = 'Never trust input. Encode on output. Parameterize queries. Fail closed.',
  content_markdown = $md$
## Input validation

- **Allow-list (positive validation)** — only accept known-good. Preferred.
- **Deny-list (negative validation)** — reject known-bad. Easy to bypass.
- Validate: type, length, range, format, charset.
- Validate at the trust boundary (server-side; client-side is UX only).

## Output encoding

- HTML — encode `<`, `>`, `"`, `'`, `&` (mitigates XSS).
- URL — percent-encode (mitigates URL injection).
- JavaScript — context-specific escaping.
- SQL — parameterized queries (prepared statements). NEVER string-concatenate user input.
- Shell — argument array execution; never use shell-string interpolation.
- LDAP — context-specific escaping for DN and filter.

## Parameterized queries

```sql
-- WRONG
"SELECT * FROM users WHERE name = '" + name + "'"

-- RIGHT (prepared statement)
"SELECT * FROM users WHERE name = ?"
ps.setString(1, name);
```

ORM frameworks (Hibernate, Sequelize, Prisma) use parameters by default. Don't escape into raw SQL without re-parameterizing.

## Authentication & sessions

- Length over complexity for passwords (NIST SP 800-63B).
- Hash with bcrypt / scrypt / Argon2 (slow KDFs). Never plain SHA, MD5, or unsalted.
- Session tokens: cryptographically random, rotate on auth boundary, time-limited, secure cookie attributes (HttpOnly, Secure, SameSite=Lax/Strict).
- Logout invalidates server-side session.

## Common vulnerabilities

- **Buffer overflow** — write past buffer boundary. C/C++ classic. Modern: ASLR, DEP, stack canaries, but underlying bug is bounds-check missing.
- **Integer overflow** — arithmetic exceeds type range. Cast attacks.
- **Race conditions / TOCTOU** — Time-Of-Check vs Time-Of-Use. Defense: atomic operations, locking.
- **Format string** — printf(user_input). Defense: never pass user input as format spec.
- **Insecure deserialization** — accepting serialized objects allows arbitrary code. Defense: reject untrusted serialized data; use JSON with strict schemas.

## Error handling

- Don\'t leak stack traces, schema, paths, or version info to users.
- Log full error server-side; show generic message client-side.
- Fail-closed: on error, deny access (do not default to allow).

## Cryptography in code

- Never roll your own.
- Use vetted libraries (libsodium, OpenSSL, BouncyCastle, native cloud KMS SDKs).
- Use AEAD modes (AES-GCM, ChaCha20-Poly1305).
- Generate IVs / nonces randomly.
- Store keys in HSM or cloud KMS — never in code, config files, or env vars in cleartext.

## Logging

- Audit-log every authentication, authorization, and sensitive data access.
- DO NOT log: passwords, full PAN, PHI, session tokens.
- Forward to central SIEM.

## Dependency management

- SCA (Software Composition Analysis) on every commit.
- SBOM (Software Bill of Materials) generated and tracked.
- Update dependencies regularly; pin versions but allow security patches.

## Secrets management

- Never commit secrets to repo.
- Use a secrets manager (AWS Secrets Manager, HashiCorp Vault, Azure Key Vault).
- Rotate regularly.
- Detect with pre-commit hooks (git-secrets, detect-secrets).
$md$,
  exam_tips = 'Allow-list > deny-list. Output encoding context-specific. Parameterized queries always. bcrypt/scrypt/Argon2 for passwords. HttpOnly + Secure + SameSite cookies.',
  think_like_manager = 'Security training for developers must include hands-on (CTF, secure code review). Compliance videos do not change behavior; doing changes behavior.',
  memory_hack = 'Validate input, encode output, parameterize queries, hash passwords with KDF, secure session cookies, never roll your own crypto.'
WHERE domain_id = 8 AND topic_number = '8.3';

-- ── 8.4 Application Security Testing ──────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'SAST, DAST, IAST, RASP, SCA. Each targets a different stage and surface.',
  memory_anchor = 'SAST = source code. DAST = running app. IAST = inside running tests. RASP = production runtime.',
  content_markdown = $md$
## The testing alphabet

- **SAST (Static Application Security Testing)** — analyzes source code without executing. Catches injection, hardcoded secrets, weak crypto. Runs in CI on every PR. Examples: SonarQube, Checkmarx, Semgrep, Snyk Code, GitHub Advanced Security.

- **DAST (Dynamic Application Security Testing)** — attacks the running app from outside (HTTP). Catches deployment-only vulns: misconfig, server-side errors, runtime issues. Runs in staging. Examples: OWASP ZAP, Burp Suite, Acunetix.

- **IAST (Interactive Application Security Testing)** — instruments the app during testing. Sees both code AND runtime. Catches what SAST misses (runtime) and DAST misses (code paths not exercised). Examples: Contrast Security, Synopsys Seeker.

- **RASP (Runtime Application Self-Protection)** — agent inside the running app in production. Detects and blocks attacks in real time. Examples: Contrast Protect, Imperva RASP.

- **SCA (Software Composition Analysis)** — scans dependencies for known CVEs and license issues. Examples: Snyk, Dependabot, OWASP Dependency-Check.

- **Container scanning** — scans Docker images for CVEs in base image, OS packages, libraries. Examples: Trivy, Aqua, Snyk Container.

- **IaC scanning** — Terraform, CloudFormation, K8s manifests for misconfig. Examples: Checkov, Terrascan, KICS.

- **Secret scanning** — pre-commit hooks + repo scanning for committed secrets. Examples: git-secrets, detect-secrets, GitGuardian, GitHub Secret Scanning.

## Pipeline integration

| Stage | Tools |
|---|---|
| Code / IDE | SAST plugins, secret detection |
| Commit / PR | SAST, SCA, IaC scan, secret scan |
| Build | Container scan |
| Test | DAST, IAST, fuzzing |
| Deploy | Final IaC validation, policy gates |
| Production | RASP, WAF, runtime monitoring |

## Other testing

- **Penetration testing** — manual + tools, exploitation. Annual.
- **Code review** — peer review, formal Fagan inspection.
- **Threat modeling** — design-time. STRIDE, PASTA, DREAD.
- **Fuzzing** — generate random / mutated inputs, look for crashes. Coverage-guided fuzzing (AFL, libFuzzer).
- **Mutation testing** — modify code, verify tests catch it. Measures test quality.

## False positives & tuning

- Initial deployment: 30-70% false positive rate is normal.
- Tune progressively: suppress known-safe patterns, customize rules to your stack.
- Goal: 95%+ true positives so devs trust the tool.

## "Shift left" vs "shift right"

- **Shift left** — catch bugs earlier (lower cost): SAST in IDE, threat modeling in design.
- **Shift right** — observe in production: RASP, WAF, observability, chaos engineering.

Both matter. Don\'t pick one over the other; they cover different failure modes.
$md$,
  exam_tips = 'SAST = static, source code. DAST = dynamic, running. IAST = instrumented during tests. RASP = runtime in production. SCA = dependencies.',
  think_like_manager = 'Security gates must be MANDATORY (build fails on critical findings) and TUNED (low false-positive rate). Optional gates are skipped under deadline pressure.',
  memory_hack = 'Pipeline left-to-right: IDE→Commit→Build→Test→Deploy→Run. SAST + Secret + SCA → Container → DAST + IAST → IaC → RASP. Shift LEFT to save money.'
WHERE domain_id = 8 AND topic_number = '8.4';

-- ── 8.5 Database Security ─────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Encrypt, parameterize, audit, backup. ACID guarantees only matter if the DB is accessible.',
  memory_anchor = 'A database is the crown jewel. Treat it like one.',
  content_markdown = $md$
## ACID properties

- **Atomicity** — transactions are all-or-nothing.
- **Consistency** — invariants hold (constraints, triggers).
- **Isolation** — concurrent transactions don\'t see each other\'s in-flight state.
- **Durability** — committed data survives crashes.

Isolation levels (weakest to strongest): Read Uncommitted → Read Committed → Repeatable Read → Serializable. Stronger = more locks = slower.

## Database security controls

### Authentication & authorization
- Database users with least privilege.
- Application accounts separate from human accounts.
- Row-Level Security (RLS) for multi-tenant data.
- Column-level encryption / masking for sensitive fields.
- Stored procedures encapsulate logic and parameterize input.

### Encryption
- **At rest** — TDE (Transparent Data Encryption) or column-level.
- **In transit** — TLS to the DB.
- **Backup encryption** — encrypted backups with separate key.

### Auditing
- Log: data access, schema changes, login attempts, privilege grants.
- Forward to SIEM.
- DAM (Database Activity Monitoring) tools: Imperva, IBM Guardium.

### Patching
- DB engine patches (CVEs).
- OS patches under DB.
- Schema migrations carefully versioned.

## Database vulnerabilities

- **SQL injection** — see Domain 8 secure coding. Defense: parameterized queries.
- **Excessive privilege** — app account has more than needed. Defense: least privilege.
- **Weak audit** — no record of access. Defense: enable native audit + DAM.
- **Backup theft** — unencrypted backups in S3. Defense: encrypt + restrict access.
- **Inference / aggregation** — see Domain 3.

## NoSQL considerations

- MongoDB, Cassandra, DynamoDB.
- Often default-permissive (early days had unauthenticated MongoDB instances on the internet).
- NoSQL injection is real (especially with JavaScript-evaluated queries).

## Database types

- **Relational (RDBMS)** — Postgres, MySQL, Oracle, SQL Server. ACID, structured.
- **Document** — MongoDB, Couchbase. JSON-like.
- **Key-value** — Redis, DynamoDB. Simple K/V.
- **Column-family** — Cassandra, HBase. Wide-column.
- **Graph** — Neo4j, Neptune. Nodes + edges.
- **Time-series** — InfluxDB, TimescaleDB. Time-indexed metrics.

## Backup and recovery

- Full + incremental + log shipping.
- Point-in-time recovery (PITR) using transaction logs.
- Encrypted offsite backups.
- Restore tested quarterly.

## Multi-tenancy patterns

- Shared schema, tenant_id column (with RLS).
- Schema-per-tenant.
- Database-per-tenant.

Strict tenant isolation tested explicitly (cross-tenant reads should fail).
$md$,
  exam_tips = 'ACID. Isolation levels (Serializable strongest). Parameterized queries. Encrypt backups. Audit log + DAM for sensitive DBs.',
  think_like_manager = 'Database backups are the ransomware insurance. Encrypted, immutable, restore-tested quarterly, offsite.',
  memory_hack = 'ACID = Atomicity-Consistency-Isolation-Durability. RDBMS-Document-KV-Column-Graph-Timeseries. Least privilege on accounts. RLS for multi-tenant.'
WHERE domain_id = 8 AND topic_number = '8.5';

COMMIT;

-- Verification:
-- SELECT topic_number, title, length(content_markdown) AS chars
-- FROM library_topics ORDER BY domain_id, topic_number;
-- All 40 rows should now have chars > 1500.
