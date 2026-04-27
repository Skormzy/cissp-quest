-- 20260427_180000 Library content expansion (Phase 9e)
--
-- Populates the highest-priority library_topics rows with thorough
-- content: full markdown body, exam tips, "Think Like a Manager"
-- framing, memory hack, and memory anchor. Targets the 11 topics
-- flagged as critical gaps in CISSP_COVERAGE_CHECKLIST.md.
--
-- Idempotent: uses UPDATE keyed on (domain_id, topic_number). Safe to
-- re-run. Non-destructive to other rows.

BEGIN;

-- ── 1.1 CIA Triad ──────────────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Confidentiality, Integrity, Availability — the three locks on the security vault.',
  memory_anchor = 'Three locks on a bank vault. Remove any lock and the vault fails.',
  content_markdown = $md$
## The Three Pillars

Every security control, every policy, every architecture decision serves one of three properties. Memorize this — every CISSP question that asks "what was violated?" maps to one of these three.

**Confidentiality** — only authorized parties can read the data. Picked the door lock? Confidentiality broken. Encryption, access controls, and need-to-know enforcement all serve confidentiality.

**Integrity** — data is not tampered with. Modified data in transit? Integrity broken. Hashing, digital signatures, and write-protection serve integrity.

**Availability** — authorized users can access the system when they need it. DDoS attack? Availability broken. Redundancy, failover, and capacity planning serve availability.

## The DAD Triad — the threats

The mirror image of CIA. Memorize this too.

- **Disclosure** — the threat to Confidentiality
- **Alteration** — the threat to Integrity
- **Destruction** (or Denial of service) — the threat to Availability

When the exam asks "what was the impact?" it wants you to think DAD. When it asks "what control protects this?" it wants you to think CIA.

## Trade-offs

The three pillars are in tension. Encryption (Confidentiality) costs CPU which can hurt Availability under load. Strict change control (Integrity) slows deploys which can hurt Availability. There is no "maximum security" answer — there is only the right balance for the business.
$md$,
  exam_tips = 'Every "what was violated?" question maps to one of C / I / A. Read attack? Confidentiality. Modified data? Integrity. System down? Availability. The DAD triad is the threat side.',
  think_like_manager = 'Do not maximize one pillar at the expense of the others. The right answer is usually a balanced control program, not "encrypt everything" or "lock down everything."',
  memory_hack = 'CIA = three locks on a vault. Each lock protects a different property. Remove any lock and the vault is not safe — it is a weighted average, not the maximum.'
WHERE domain_id = 1 AND topic_number = '1.1';

-- ── 1.2 Risk Management Frameworks ─────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Quantify risk, choose treatment, document residual. Risk is a business number.',
  memory_anchor = 'A board sees money, not threats. Translate before you present.',
  content_markdown = $md$
## Quantitative risk

The exam loves these formulas. Memorize them in this order:

- **Single Loss Expectancy (SLE)** = Asset Value × Exposure Factor
- **Annualized Rate of Occurrence (ARO)** = how many times per year you expect this
- **Annualized Loss Expectancy (ALE)** = SLE × ARO

Worked example: a $8M asset, exposure factor 50%, occurs once every two years (ARO = 0.5).
SLE = $8M × 0.5 = $4M. ALE = $4M × 0.5 = $2M / yr. Spend less than $2M / yr to mitigate and you are making a rational decision.

## Risk treatment options (AMTA)

When a risk is identified, four responses are possible:

- **Avoid** — stop the activity that creates the risk
- **Mitigate** — add controls to reduce likelihood or impact (most common)
- **Transfer** — buy insurance or contractually shift the risk
- **Accept** — document the residual risk and live with it

The order does not imply preference. The right choice depends on the cost of the control vs. the value of the asset.

## Frameworks

- **NIST RMF** — six steps: Categorize → Select → Implement → Assess → Authorize → Monitor.
- **ISO 31000** — generic risk management standard, not security-specific.
- **FAIR (Factor Analysis of Information Risk)** — quantitative model that decomposes risk into loss event frequency × loss magnitude.

## Risk register

A live document tracking each risk: description, likelihood, impact, owner, treatment plan, residual risk, review date. The CISSP exam expects you to know this exists and is updated regularly.
$md$,
  key_formulas = '[
    {"formula": "SLE = AV × EF", "description": "Single Loss Expectancy — the cost of one occurrence."},
    {"formula": "ALE = SLE × ARO", "description": "Annualized Loss Expectancy — your annual budget ceiling for controls."},
    {"formula": "Residual Risk = Total Risk - Risk Mitigated by Controls", "description": "What is left after applying controls. Document it. Accept it."}
  ]'::jsonb,
  exam_tips = 'Quantitative questions: work inside-out. SLE first (AV × EF), then ALE (SLE × ARO). Risk treatment: AMTA — Avoid, Mitigate, Transfer, Accept. Mitigate is most common.',
  think_like_manager = 'Risk is communicated to the board in dollars, not threats. ALE is the budget ceiling. Spending more than ALE on controls is over-controlling. Document residual risk explicitly so the business owns the leftover risk.',
  memory_hack = 'Risk treatment = AMTA. Risk math = Single (SLE) before Annual (ALE). Frameworks = "RMF for systems, ISO for governance, FAIR for quantification."'
WHERE domain_id = 1 AND topic_number = '1.2';

-- ── 2.5 Asset Management & Retention ───────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Sanitize before you dispose. Match the method to the classification.',
  memory_anchor = 'Three rungs on a ladder: clear, purge, destroy. Climb to the level the data demands.',
  content_markdown = $md$
## The sanitization ladder (NIST SP 800-88)

Three levels, in order of strength:

1. **Clearing** — overwrite with non-sensitive data. Same media reader could potentially recover. Suitable for re-use within the same organization.
2. **Purging** — degaussing, secure-erase, or cryptographic erasure. Media may be reused but recovery requires advanced lab techniques (impractical).
3. **Destruction** — physical shredding, incineration, disintegration, melting. Media is unrecoverable. Required for the highest classification.

The classification of the data dictates the minimum sanitization level. Restricted = destruction. Confidential / SSDs = purging or destruction. Internal = clearing acceptable.

## SSD trap

**Degaussing only works on magnetic media** (tape, spinning disk). SSDs use flash memory — degaussing has zero effect.

For SSDs the choices are:
- **Crypto-shred** — destroy the encryption key that decrypted the data. Fast, scales, but only works if the SSD was encrypted from the start.
- **Physical destruction** — shred the chips themselves. The only foolproof method.

Overwriting an SSD is unreliable because the wear-leveling controller may keep old blocks alive in spare areas the OS cannot see.

## Data remanence

Even after deletion, data leaves traces — slack space, journal entries, hibernation files, swap files, backup copies. A "delete" or "format" is not sanitization. The CISSP exam will trap candidates who confuse them.

## Lifecycle

Every asset goes Create → Use → Archive → Destroy. Each phase has different controls. The destruction phase is where most organizations fail — old backup tapes, EOL equipment in storage closets, spare drives in lockers.
$md$,
  exam_tips = 'Trap question: "We need to dispose of 200 SSDs holding PII." Degaussing is wrong (SSDs are not magnetic). Crypto-shredding or physical destruction are correct.',
  think_like_manager = 'Disposal is auditable. Maintain a chain-of-custody record from "marked for retirement" through "destroyed" with a witnessed certificate of destruction.',
  memory_hack = 'Three rungs: Clear → Purge → Destroy. Match the rung to the classification. SSDs do NOT degauss — crypto-shred or shred.'
WHERE domain_id = 2 AND topic_number = '2.5';

-- ── 3.1 Security Models ───────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Three models for confidentiality, integrity, and conflict of interest. Know which protects what.',
  memory_anchor = 'BLP keeps secrets sealed. Biba keeps truth uncontaminated. Clark-Wilson protects business processes.',
  content_markdown = $md$
## Bell-LaPadula (BLP) — Confidentiality

Two rules:
- **Simple Security Property** — no read up. A subject cannot read above their clearance.
- **Star (★) Property** — no write down. A subject cannot write classified data to a lower-classified location.

Used in military and government systems. Memory hook: "BLP = Lips sealed = Confidentiality."

## Biba — Integrity

The mirror of BLP. Two rules:
- **Simple Integrity** — no read down. A subject cannot read below their integrity level (corrupt data pollutes the process).
- **Star Integrity** — no write up. A subject cannot write to a higher-integrity object.

Used in financial and audit systems. Memory hook: "Biba = Bible = Integrity. Flip the arrows."

## Clark-Wilson — Commercial Integrity

Different shape: subjects do not directly access objects. Instead:
- **Constrained Data Items (CDIs)** — protected data
- **Unconstrained Data Items (UDIs)** — input from the outside world
- **Transformation Procedures (TPs)** — only TPs can modify CDIs
- **Integrity Verification Procedures (IVPs)** — verify CDIs are in a valid state

Plus separation of duties (no single person controls a process end-to-end). Used in commercial banking and ERP systems.

## Brewer-Nash (Chinese Wall) — Conflict of Interest

A subject who has accessed data from one company cannot then access data from a competing company. Used in consulting firms, financial advisors. Access permissions change dynamically based on history.

## Comparison cheat-sheet

| Model | Protects | Rule of thumb |
|-------|----------|---------------|
| Bell-LaPadula | Confidentiality | No read up, no write down |
| Biba | Integrity | No read down, no write up |
| Clark-Wilson | Commercial integrity | Subjects → TP → Objects (no direct write) |
| Brewer-Nash | Conflict of interest | Access depends on prior access history |
$md$,
  exam_tips = 'BLP = lips (Confidentiality). Biba = Bible (Integrity). Clark-Wilson = Commercial. Brewer-Nash = wall. The rules invert between BLP and Biba — flip the arrows.',
  think_like_manager = 'Pick the model based on the threat that hurts most. Government / national security = BLP. Financial transactions = Biba or Clark-Wilson. Conflicting clients = Brewer-Nash.',
  memory_hack = 'BLP = Lips sealed (Confidentiality, "no read UP, no write DOWN"). Biba = Bible (Integrity, "no read DOWN, no write UP"). Clark-Wilson = Commercial (TP gates).'
WHERE domain_id = 3 AND topic_number = '3.1';

-- ── 3.2 Cryptography Fundamentals (PKI focus) ──────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Symmetric for speed, asymmetric for trust, hashing for integrity. PKI ties identity to public keys.',
  memory_anchor = 'Sign with PRIVATE, verify with PUBLIC. Encrypt with their PUBLIC, decrypt with your PRIVATE.',
  content_markdown = $md$
## Three families

- **Symmetric** — same key to encrypt and decrypt. Fast. Hard part is sharing the key. Examples: AES (current), 3DES (deprecated), DES (broken).
- **Asymmetric (Public Key)** — key pair: public encrypts, private decrypts; OR private signs, public verifies. Slow. Solves the key-sharing problem. Examples: RSA, ECC, ElGamal.
- **Hashing** — one-way. Cannot be reversed. Used for integrity and password storage. Examples: SHA-2, SHA-3, BLAKE2. MD5 and SHA-1 are broken — do not use.

## PKI — Public Key Infrastructure

Trust-at-scale for asymmetric crypto.

- **Certificate Authority (CA)** — root of trust. Browsers ship with hundreds of trusted CAs.
- **Registration Authority (RA)** — verifies identity before the CA issues a cert.
- **X.509 Certificate** — binds a public key to a subject identity, signed by the CA.
- **CRL (Certificate Revocation List)** — list of revoked certs. Pull-model, can be slow.
- **OCSP (Online Certificate Status Protocol)** — real-time check, push or stapled.
- **Cert Lifecycle** — Enrollment → Issuance → Use → Renewal → Revocation → Expiration.

## Digital signature workflow

1. Sender hashes the message (SHA-256).
2. Sender encrypts the hash with their PRIVATE key — that is the signature.
3. Sender transmits message + signature.
4. Receiver hashes the received message themselves.
5. Receiver decrypts the signature with the sender's PUBLIC key.
6. If the two hashes match, the signature is valid.

This delivers three properties at once: authenticity (only the sender's private key could have signed), integrity (any tampering breaks the hash match), non-repudiation (the sender cannot deny signing).

## Common gotcha — direction of the keys

- **Encrypting for confidentiality** — encrypt with the RECIPIENT's PUBLIC key. They decrypt with their PRIVATE key.
- **Signing for authenticity** — sign with the SENDER's PRIVATE key. Anyone can verify with the sender's PUBLIC key.

Reverse them and the math works but the security property is lost.
$md$,
  exam_tips = 'Direction of keys: encrypt with recipient public, sign with sender private. CRL is pull/slow, OCSP is real-time. RSA-1024 is deprecated, use 2048+ or ECC.',
  think_like_manager = 'PKI is operationally heavy. Cert renewals, key rotation, revocation propagation, HSM management. If you cannot staff this, use a managed CA or an SSO/cloud identity provider.',
  memory_hack = 'Sign with PRIVATE, verify with PUBLIC. Encrypt to recipient with their PUBLIC, decrypt with their PRIVATE. Backwards is wrong.'
WHERE domain_id = 3 AND topic_number = '3.2';

-- ── 4.3 Firewalls and Network Devices ─────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Five generations of firewall, three flavors of detection. Pick the right one for the layer.',
  memory_anchor = 'IDS Detects, IPS Prevents. WAF lives at L7 in front of the app.',
  content_markdown = $md$
## Firewall generations

1. **Packet filter** — header inspection only (src/dst IP, port, protocol). Stateless. Fast, dumb. Allows return traffic without context.
2. **Stateful inspection** — tracks connection state. A packet must belong to an established TCP session or be a valid SYN. Modern minimum.
3. **Application proxy** — terminates the connection on both sides. Inspects payload. Slow but thorough.
4. **Next-Gen Firewall (NGFW)** — combines stateful + IPS + app awareness + identity + threat intelligence. Most enterprise firewalls today.
5. **Web Application Firewall (WAF)** — Layer 7 only. Specific to HTTP/HTTPS. Blocks SQLi, XSS, CSRF based on rules + signatures.

## Detection systems

- **IDS** — Intrusion Detection System. Watches and ALERTS. Out-of-band (passive tap).
- **IPS** — Intrusion Prevention System. Watches and BLOCKS. Inline (in the traffic path).
- **NIDS / NIPS** — network-based. Sees network traffic.
- **HIDS / HIPS** — host-based. Sees one host's logs, file integrity, processes.

## Detection methods

- **Signature-based** — matches known attack patterns. Fast, low false positive, MISSES zero-days.
- **Anomaly-based** — flags deviations from a learned baseline. Catches novel attacks, higher false-positive rate.
- **Behavior-based** — looks at sequences ("user normally logs in from US, now Russia"). Used in UEBA / Zero Trust.

## Defense-in-depth placement

- **Perimeter** — firewall + DDoS protection.
- **DMZ boundary** — application proxy or NGFW.
- **East-west** — micro-segmentation (NSX, Calico, host firewalls).
- **App layer** — WAF in front of the web tier.
- **Endpoint** — HIPS / EDR.
- **Out of band** — NIDS sniffing traffic, SIEM correlating across all of the above.
$md$,
  exam_tips = 'IDS = detect, IPS = prevent. WAF is L7 / web-only. Stateful inspection is the modern minimum; packet filtering alone is a trap question.',
  think_like_manager = 'No single firewall protects against everything. Defense in depth means firewalls at the perimeter, segmentation between zones, WAF in front of web apps, and host-based controls on critical servers.',
  memory_hack = 'IDS Detects, IPS Prevents. NGFW = Stateful + IPS + Identity + App-aware. WAF = HTTP-only.'
WHERE domain_id = 4 AND topic_number = '4.3';

-- ── 5.1 Authentication Factors and Methods ────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Three factor types: know, have, are. Real MFA mixes types, not items within a type.',
  memory_anchor = 'Three categories. Two passwords is not MFA. A password and a phone-token IS MFA.',
  content_markdown = $md$
## The three factor types

- **Type 1 — Something you KNOW** — password, PIN, security question, passphrase.
- **Type 2 — Something you HAVE** — smart card, hardware token, USB security key, phone with TOTP/HOTP, mobile push app.
- **Type 3 — Something you ARE** — fingerprint, iris, retina, palm, face, voice, keystroke dynamics, gait.

Some sources add a fourth and fifth:
- **Type 4 — Somewhere you ARE** — geolocation, IP block.
- **Type 5 — Something you DO** — behavior pattern.

## What counts as MFA

True multi-factor requires factors from DIFFERENT types. The classic exam trap:

- Password + PIN + Security Question = ALL TYPE 1 = NOT MFA.
- Password + SMS code = Type 1 + Type 2 = MFA.
- Fingerprint + Hardware token = Type 3 + Type 2 = MFA.

## Token types

- **TOTP** (Time-based One-Time Password) — Google Authenticator, Authy. Re-generates every 30 sec.
- **HOTP** (HMAC-based One-Time Password) — counter-based, advances on use.
- **U2F / FIDO2 / WebAuthn** — hardware security key. Phishing-resistant because the key signs the origin.
- **Smart card / PIV** — certificate on a chip. Government / enterprise standard.

## Biometric considerations

Biometric systems trade off two error rates:

- **FAR** (False Acceptance Rate) — letting the wrong person in.
- **FRR** (False Rejection Rate) — locking out the right person.
- **CER** (Crossover Error Rate) — the sensitivity setting where FAR = FRR. Lower CER means a better biometric system overall.

Tuning the system to be more permissive lowers FRR but raises FAR. Tuning to be stricter does the opposite.

## Password best practices (NIST SP 800-63B)

- Length matters more than complexity. 12+ characters.
- No mandatory periodic rotation unless evidence of compromise.
- Block common passwords and previously-breached passwords.
- Allow paste, allow long passphrases, allow special characters but do not require them.
- Use MFA. Always.
$md$,
  exam_tips = 'MFA requires DIFFERENT types. Multiple Type-1 inputs is "stronger single-factor." Lower CER is better. NIST 800-63B no longer mandates periodic rotation.',
  think_like_manager = 'Add MFA in priority order: privileged accounts within 30 days, all sensitive systems within 60 days, all accounts within 90. Phased rollout beats blanket mandates.',
  memory_hack = 'Three types: Know · Have · Are. MFA = at least two of THE THREE TYPES, not two items within one type.'
WHERE domain_id = 5 AND topic_number = '5.1';

-- ── 5.2 Access Control Models ─────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Five models: DAC, MAC, RBAC, ABAC, Rule-Based. Match the model to the environment.',
  memory_anchor = 'DAC = Owner decides. MAC = System enforces labels. RBAC = job role. ABAC = situation. Rule = rules.',
  content_markdown = $md$
## DAC — Discretionary Access Control

The OWNER of the resource decides who gets access. Linux file permissions, most consumer file shares, basic SharePoint.

- Flexible. Sprawls. Owners can grant access without IT involvement.
- Vulnerable to privilege creep — accumulated grants over time.

## MAC — Mandatory Access Control

The SYSTEM enforces access based on labels (on objects) and clearances (on subjects). Subjects cannot override.

- Used in government, military, defense contractors.
- Rigid. Highly secure. Expensive to administer.
- Bell-LaPadula (confidentiality) and Biba (integrity) are MAC models.

## RBAC — Role-Based Access Control

Access is tied to JOB ROLE, not the individual. Users get assigned to roles; roles have permissions.

- Most enterprise IAM. Active Directory groups, Okta groups.
- Easier to administer at scale than DAC.
- Trap: role explosion. Too many narrow roles becomes unmanageable.

## ABAC — Attribute-Based Access Control

Access decided per request by evaluating ATTRIBUTES of subject, object, action, and environment.

- "This nurse, but only for this patient, only during this shift, only from a hospital network."
- Modern cloud, Zero Trust architectures (XACML, AWS IAM policies, Azure conditional access).
- Most flexible. Hardest to debug.

## Rule-Based Access Control

Uniform rules applied independent of user identity.

- Firewall ACLs, "no logins after 11 PM," "Backups run only between 2-4 AM."
- Often combined with one of the models above.

## Reference Monitor + Security Kernel

The conceptual gatekeeper that enforces access decisions. Three properties (always-tested):

- **Always invoked** — every access goes through it.
- **Tamperproof** — cannot be bypassed.
- **Verifiable** — small enough to be tested exhaustively.

The Security Kernel is the implementation of the reference monitor.
$md$,
  exam_tips = 'DAC = owner. MAC = system + labels. RBAC = role. ABAC = attributes. Rule = blanket rule. Reference monitor properties: invoked, tamperproof, verifiable.',
  think_like_manager = 'Most enterprises run RBAC for the bulk of access and ABAC for sensitive cases. MAC is heavyweight; reserve it for systems that handle classified or regulated data.',
  memory_hack = 'DAC=Discretion (owner). MAC=Mandatory (labels). RBAC=Role. ABAC=Attributes. Rule=blanket rule. Reference monitor = "always Invoked, Tamperproof, Verifiable."'
WHERE domain_id = 5 AND topic_number = '5.2';

-- ── 5.4 Privilege Management ──────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Privileged accounts are the highest-value attack target. PAM, JIT, and audit are mandatory.',
  memory_anchor = 'Master keys to the building. Track every use. Rotate on every exit.',
  content_markdown = $md$
## Privileged accounts

Five categories the exam tests:

1. **Root / Administrator** — full system control. The crown jewels.
2. **Service accounts** — used by applications and automated processes.
3. **Emergency / break-glass** — sealed accounts used only in disasters.
4. **Database admin (DBA)** — direct DB access.
5. **Network admin** — switch / router / firewall access.

## Privileged Access Management (PAM)

Centralizes control. Core features:

- **Password vaulting** — admin credentials stored encrypted, never directly known to the user.
- **Session recording** — every privileged session screen-recorded for audit.
- **Just-In-Time (JIT) access** — privileges granted temporarily, expire automatically.
- **Automatic rotation** — passwords change after every use.
- **MFA enforcement** — never reach a privileged credential without strong auth.

## Least Privilege + Separation of Duties + Need to Know

Three principles that work together:

- **Least Privilege** — minimum permissions for the job.
- **Separation of Duties (SoD)** — no single person controls a critical end-to-end process.
- **Need to Know** — even cleared subjects only see what is required for their current task.

Even ADMINISTRATORS should follow least privilege. Use a regular account for daily work and elevate only when needed.

## Privilege escalation attacks

- **Vertical escalation** — gaining higher privileges (user → admin).
- **Horizontal escalation** — accessing another user's data at the same level.

Both are mitigated by least privilege, MFA on privileged tier, JIT access, session monitoring, and behavior-based detection.
$md$,
  exam_tips = 'Privilege management questions: PAM is the answer if the scenario describes shared admin credentials, lack of audit, or persistent admin access. JIT access reduces standing privilege.',
  think_like_manager = 'Admins should have two accounts: a daily-driver account with no privileges, and a privileged account used only when needed and monitored. JIT + session recording + automatic rotation is the modern standard.',
  memory_hack = 'PAM = Password vaulting + Audit (session record) + Minimum standing privilege. Three principles: Least Privilege, Separation of Duties, Need to Know.'
WHERE domain_id = 5 AND topic_number = '5.4';

-- ── 8.1 SDLC Security ─────────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'Build security into every phase. Shifting left is cheaper than shifting right.',
  memory_anchor = 'A bug caught in code costs 1x. The same bug in production costs 100x.',
  content_markdown = $md$
## SDLC phases

1. **Requirements** — security requirements alongside functional requirements.
2. **Design** — threat modeling (STRIDE), architecture review, abuse cases.
3. **Development** — secure coding standards, SAST in IDE, code review.
4. **Testing** — DAST, IAST, fuzzing, pen test.
5. **Deployment** — IaC scanning, container scanning, secret detection.
6. **Maintenance** — patch management, vulnerability management, RASP, WAF.
7. **Disposal** — secure decommission, data sanitization.

## Methodologies

- **Waterfall** — sequential, gated. Security review is late and expensive.
- **Spiral** — iterative loops with risk assessment per loop. Risk-driven.
- **Agile / Scrum** — short sprints, continuous delivery. Embedded security via DevSecOps.
- **DevOps / DevSecOps** — CI/CD with automated security gates inside the pipeline.

The trend: shift-left. Catch bugs in code (cost = 1x) instead of production (cost = 100x).

## DevSecOps pipeline gates

- **Code** — pre-commit hooks (secret scanning), IDE SAST plugins.
- **Commit** — SAST + SCA dependency scan + license check.
- **Build** — container image scan, secret detection.
- **Test** — DAST + IAST in functional test runs.
- **Deploy** — IaC scan, policy gates.
- **Runtime** — RASP, WAF, SIEM/SOAR.

## Maturity models

Measure how disciplined your SDLC is:

- **CMMI** — 5 levels: Initial → Managed → Defined → Quantitatively Managed → Optimizing.
- **SAMM** — Software Assurance Maturity Model (OWASP). Prescriptive.
- **BSIMM** — Building Security In Maturity Model. Observational, what real firms do.
- **IDEAL** — Initiating, Diagnosing, Establishing, Acting, Learning.

## Secure coding hits

- Input validation + parameterized queries (prevents injection).
- Output encoding (prevents XSS).
- Session management with secure cookies (HttpOnly, Secure, SameSite).
- Error handling that does not leak stack traces or sensitive data.
- Logging that does not capture passwords / PII / secrets.
- Cryptographic practices: never roll your own crypto, use vetted libraries.
$md$,
  exam_tips = 'Shift-left = cheaper. Methodology questions: Waterfall=sequential, Spiral=risk loops, Agile=sprints, DevOps=continuous. Maturity models: CMMI is 5 levels.',
  think_like_manager = 'Mandatory security gates beat advisory ones. Tune the false-positive rate so developers do not bypass the gates. Investment in good tuning > investment in more gates.',
  memory_hack = 'Methodologies: Waterfall walks, Spiral spirals, Agile sprints, DevOps streams. Catch bugs LEFT (1x) not RIGHT (100x).'
WHERE domain_id = 8 AND topic_number = '8.1';

-- ── 8.2 OWASP Top 10 ──────────────────────────────────────────────────
UPDATE public.library_topics SET
  one_liner = 'The ten most prevalent web app vulnerabilities. Memorize the 2021 top five.',
  memory_anchor = 'Access first, Crypto second, Inject third. Most apps fail one of these three.',
  content_markdown = $md$
## OWASP Top 10 (2021)

| Rank | Category | One-liner |
|------|----------|-----------|
| A01 | Broken Access Control | Most prevalent (94% of tested apps). IDOR, missing authz checks, privilege escalation. |
| A02 | Cryptographic Failures | Was "Sensitive Data Exposure." Weak crypto, missing TLS, hard-coded keys. |
| A03 | Injection | SQL, NoSQL, LDAP, OS command, XSS (now folded in). |
| A04 | Insecure Design | New category. Missing threat modeling, missing security requirements. |
| A05 | Security Misconfiguration | Default creds, exposed admin, verbose errors, missing security headers. |
| A06 | Vulnerable & Outdated Components | Old libraries, unpatched dependencies. SCA flags these. |
| A07 | Identification & Authentication Failures | Was "Broken Authentication." Weak passwords, session bugs, no MFA. |
| A08 | Software & Data Integrity Failures | Insecure deserialization, unsigned packages, dependency confusion. |
| A09 | Security Logging & Monitoring Failures | Missing logs, missing alerts, missing IR readiness. |
| A10 | Server-Side Request Forgery (SSRF) | App fetches a URL the attacker controls. AWS metadata theft is the canonical example. |

## Key changes from 2017

- Broken Access Control jumped from #5 to #1.
- Injection dropped from #1 (10-year reign) to #3.
- XSS folded INTO Injection.
- New: Insecure Design, Software/Data Integrity Failures, SSRF.

## Defenses (by category)

- **A01 Access Control** — deny by default, mediate every request, write authorization tests.
- **A02 Crypto** — TLS everywhere, no MD5/SHA-1, AES-256, vetted libraries only.
- **A03 Injection** — parameterized queries, output encoding, allow-list input validation.
- **A04 Design** — threat modeling, abuse cases, security requirements upfront.
- **A05 Misconfig** — automated config baselines, IaC scanning, no defaults.
- **A06 Components** — SCA tooling, SBOM, automated dependency updates.
- **A07 Auth** — MFA, password length over complexity, session timeouts, no common passwords.
- **A08 Integrity** — code signing, signed packages, integrity verification on dependencies.
- **A09 Logging** — audit log every access, monitor centrally, alert on anomalies.
- **A10 SSRF** — allow-list outbound destinations, block link-local + RFC1918.

## Cross-app threat trio (test favorites)

- **XSS** — attacker payload runs in the victim's browser. Stored / Reflected / DOM-based.
- **CSRF** — victim's browser submits an attacker-crafted request using the victim's authenticated session. Defense: SameSite cookies, anti-CSRF tokens.
- **SSRF** — attacker tricks the server into making a request on their behalf. Defense: allow-list outbound destinations.
$md$,
  exam_tips = '2021 top three: Access (A01), Crypto (A02), Injection (A03). XSS is now under A03. SSRF is its own category at A10.',
  think_like_manager = 'Mandate SAST + SCA + DAST gates in CI/CD. Tune them. The Top 10 list is the minimum coverage; real apps need full threat modeling.',
  memory_hack = '"Access, Crypto, Inject, Design, Misconfig, Components, Auth, Integrity, Logging, SSRF" — A through "Server" — A1 → A10. Top 3 = "Access, Crypto, Inject."'
WHERE domain_id = 8 AND topic_number = '8.2';

COMMIT;

-- Verification:
-- SELECT topic_number, title, length(content_markdown) FROM library_topics
-- WHERE topic_number IN ('1.1','1.2','2.5','3.1','3.2','4.3','5.1','5.2','5.4','8.1','8.2')
-- ORDER BY domain_id, topic_number;
-- Expect: 11 rows, content_markdown length > 1000 chars each.
