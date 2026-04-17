-- =============================================================================
-- CISSP Quest — Domain 8: Software Development Security
-- Generated: 2026-04-16  |  Source: ai_generated (ISC2 CBK, OWASP Top 10 2021, NIST SSDF)
-- =============================================================================
-- Distribution Stats (28 questions):
--   Difficulty : easy=6 (21%), medium=13 (46%), hard=7 (25%), very_hard=2 (7%)
--   Cognitive  : remember=3 (11%), understand=5 (18%), apply=13 (46%), analyze=7 (25%)
--   Types      : scenario=10, best_answer=4, first_action=4, tlatm=3,
--                comparison=3, except_not=2, most_likely=2
--   Correct idx: 0=7, 1=7, 2=7, 3=7
-- =============================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1 easy / remember / sdlc_security_integration
(
  8, 'sdlc_security_integration',
  'During which SDLC phase is threat modeling MOST cost-effective to perform?',
  '["Design phase — before code is written, architectural security decisions can be changed with no rework cost", "Testing phase — when the system is complete and can be tested against threat scenarios", "Requirements phase — before the project scope is defined", "Deployment phase — when the production environment is fully configured"]'::jsonb,
  0,
  'Explanation: Threat modeling is most cost-effective during the design phase. At this point, architecture decisions (data flows, trust boundaries, component choices) are being made but no code has been written — changing a design decision costs nothing compared to rewriting implemented code. The classic rule from the NIST SSDF and Microsoft SDL is that the cost to fix a security issue grows by an order of magnitude with each phase passed. Threat modeling in testing catches issues late and expensively. Requirements is too early — the system architecture is not yet defined. Deployment is the worst time to discover design-level security flaws.',
  'DESIGN-PHASE BLUEPRINT: Threat model before the first line of code — changes cost nothing on paper.',
  'remember',
  'best_answer',
  'easy',
  0.90, -1.85, 0.20, 'ai_generated', true
),

-- Q2 easy / remember / secure_coding_standards
(
  8, 'secure_coding_standards',
  'Which OWASP Top 10 2021 category represents the MOST common web application vulnerability class, ranked number one?',
  '["Injection", "Broken Access Control", "Cryptographic Failures", "Security Misconfiguration"]'::jsonb,
  1,
  'Explanation: The OWASP Top 10 2021 elevated Broken Access Control to the #1 position, up from #5 in the 2017 edition. 94% of tested applications had some form of broken access control. This category includes failures to enforce access restrictions on authenticated users — such as accessing other users'' accounts, viewing privileged pages, or modifying other users'' data. Injection (SQL, OS command, LDAP) dropped to #3 in 2021. Cryptographic Failures is #2. Security Misconfiguration is #5.',
  'OWASP #1 TARGET: Broken access control — the most exploited flaw in production web apps today.',
  'remember',
  'best_answer',
  'easy',
  0.88, -1.80, 0.20, 'ai_generated', true
),

-- Q3 easy / understand / database_security
(
  8, 'database_security',
  'A developer uses parameterized queries (prepared statements) instead of string concatenation when building SQL queries. What security vulnerability does this practice PRIMARILY prevent?',
  '["Cross-site scripting — parameterized queries sanitize HTML output","SQL injection — parameterized queries separate SQL code from user-supplied data, preventing user input from being interpreted as SQL commands","Buffer overflow — parameterized queries limit input string length","Cross-site request forgery — parameterized queries validate user session tokens"]'::jsonb,
  1,
  'Explanation: Parameterized queries (prepared statements) work by pre-compiling the SQL template with placeholders, then binding user input as data parameters — the database driver ensures user input is never interpreted as SQL code. This is the primary defense against SQL injection, which OWASP lists as part of the Injection category (#3 in 2021). Parameterized queries have no effect on XSS (which requires output encoding), buffer overflows (which require input length validation or safe languages), or CSRF (which requires token validation or SameSite cookies).',
  'PREPARED STATEMENT DEFENSE: The SQL skeleton is pre-built — the user''s data fills in the blanks, never the commands.',
  'understand',
  'scenario',
  'easy',
  0.90, -1.75, 0.20, 'ai_generated', true
),

-- Q4 easy / understand / sdlc_security_integration
(
  8, 'sdlc_security_integration',
  'In the Waterfall SDLC model, what is the PRIMARY security disadvantage compared to Agile or iterative development?',
  '["Waterfall produces more vulnerabilities per line of code than Agile methodologies", "Waterfall prohibits the use of automated security scanning tools", "Waterfall development teams cannot perform code review because phases are strictly sequential", "Security testing occurs only in the late testing phase, making design-level flaws expensive to fix and often deferred to future releases"]'::jsonb,
  3,
  'Explanation: Waterfall''s sequential, phase-gated structure means security testing is typically deferred to the dedicated testing phase — after all code is written. At this point, architectural and design vulnerabilities discovered require code rework across potentially the entire codebase. In practice, near-deadline schedule pressure causes these findings to be deferred to future releases or accepted as risk. Agile''s sprint-based model integrates security testing continuously, catching issues when the affected code is still fresh and isolated. Waterfall does not inherently produce more vulnerabilities per line of code, nor does it prohibit automated tools or code review.',
  'WATERFALL LATE CATCH: Security shows up at the end of the falls — by then the water has already landed.',
  'understand',
  'comparison',
  'easy',
  0.88, -1.65, 0.20, 'ai_generated', true
),

-- Q5 easy / remember / threat_modeling_sdlc
(
  8, 'threat_modeling_sdlc',
  'The STRIDE threat modeling framework categorizes security threats. What does the "T" in STRIDE stand for?',
  '["Tracking — monitoring user activity without consent","Tampering — unauthorized modification of data or code","Timing — exploiting race conditions in concurrent systems","Token — credential theft for session hijacking"]'::jsonb,
  1,
  'Explanation: STRIDE is a threat categorization acronym developed by Microsoft: Spoofing (identity), Tampering (data integrity), Repudiation (deniability of actions), Information Disclosure (confidentiality breach), Denial of Service (availability), Elevation of Privilege (authorization breach). Tampering specifically addresses threats to data integrity — unauthorized modification of data in transit, at rest, or in process. The other options are invented definitions not part of the STRIDE framework.',
  'STRIDE DECODER: Spoofing, Tampering, Repudiation, Info Disclosure, DoS, Elevation — your threat classification codebook.',
  'remember',
  'best_answer',
  'easy',
  0.88, -1.80, 0.20, 'ai_generated', true
),

-- Q6 easy / understand / environment_security
(
  8, 'environment_security',
  'A developer uses real customer records containing PII to test a new feature in the development environment. Which security principle does this MOST directly violate?',
  '["Data minimization and environment separation — production data should not be used in non-production environments", "Need-to-know — developers should not have access to customer records", "Availability — using production data in development risks data loss", "Non-repudiation — using real records prevents audit trail integrity"]'::jsonb,
  0,
  'Explanation: Environment separation requires that development, test, staging, and production environments be isolated from each other. Using real production PII in development exposes sensitive data to a less-controlled environment: developers may have broader access, security controls may be weaker, and data may be logged or cached in insecure locations. Data minimization (a GDPR and privacy principle) also applies — use synthesized or anonymized test data instead. Need-to-know is a related access control principle but is secondary to the environment separation violation. Availability and non-repudiation are not the primary principles violated here.',
  'ENVIRONMENT QUARANTINE: Real PII belongs in the production vault — use synthetic data in the test range.',
  'understand',
  'scenario',
  'easy',
  0.90, -1.65, 0.20, 'ai_generated', true
),

-- Q7 medium / apply / secure_coding_standards
(
  8, 'secure_coding_standards',
  'A web application reflects user input directly in an error message: "Error: user input not found." The input is rendered in the browser without encoding. An attacker crafts a URL with a JavaScript payload as the input parameter and sends the link to a victim. Which vulnerability is being exploited?',
  '["Stored XSS — the malicious script is saved in the database and served to all visitors","SQL injection — the attacker''s input is interpreted as a database query","Reflected Cross-Site Scripting (XSS) — unsanitized user input is included in the HTTP response and executed in the victim''s browser","Cross-site request forgery (CSRF) — the attacker forges a request using the victim''s session"]'::jsonb,
  2,
  'Explanation: Reflected XSS occurs when user-supplied data is immediately reflected in the server''s HTTP response without proper output encoding. The attacker crafts a malicious URL, tricks a victim into clicking it, and the victim''s browser executes the script in the context of the vulnerable application. Stored XSS requires the payload to be persisted server-side (database, file) and served to multiple users — the scenario describes a URL-based attack, not server storage. SQL injection targets the database, not the browser. CSRF exploits the victim''s authenticated session to submit unwanted requests — it does not involve script injection.',
  'REFLECTED PAYLOAD: The server mirrors back the weapon — the victim''s browser fires it.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q8 medium / apply / devsecops_pipeline
(
  8, 'devsecops_pipeline',
  'A DevSecOps team integrates security scanning into their CI/CD pipeline. At which pipeline stage is SAST MOST appropriately placed to provide the earliest feedback to developers?',
  '["After deployment to the staging environment, as a pre-production gate", "On every code commit or pull request, before merge — scanning code as it is written provides immediate feedback while the developer still has full context", "In the production monitoring phase, to detect vulnerabilities in running code", "Once per sprint during a dedicated security sprint, separate from the development pipeline"]'::jsonb,
  1,
  'Explanation: The principle of shift-left security is to catch vulnerabilities as early as possible — ideally when the developer is still working on the affected code. Integrating SAST as a pull request gate (scanning before merge to the main branch) ensures that vulnerabilities are identified immediately, the developer has context to fix them quickly, and no vulnerable code reaches shared branches. Post-staging SAST is useful but represents a later stage. Production monitoring cannot perform SAST (static analysis requires source code, not runtime behavior). Sprint-based security testing is a periodic batch approach that delays feedback.',
  'SHIFT-LEFT SCAN: Catch the vulnerable line at commit time — the developer still knows what they wrote.',
  'apply',
  'best_answer',
  'medium',
  1.20, 0.20, 0.20, 'ai_generated', true
),

-- Q9 medium / apply / database_security
(
  8, 'database_security',
  'A classified database contains records labeled SECRET and TOP SECRET. A user with SECRET clearance queries the database for aggregate statistics. The database returns average salary data that, when combined with publicly known individual salaries, allows the user to infer the salary of a TOP SECRET-cleared employee. Which database attack does this represent?',
  '["Inference attack — combining low-classification query results to deduce high-classification information", "Aggregation attack — combining multiple low-sensitivity data items to create high-sensitivity information", "SQL injection — malicious queries extracting unauthorized data", "Covert channel — using a communication mechanism not intended for data transfer"]'::jsonb,
  1,
  'Explanation: Aggregation attack occurs when an attacker combines multiple pieces of individually low-sensitivity data to derive information at a higher sensitivity level — the aggregate is more sensitive than any individual piece. Inference attack is closely related: the attacker uses indirect reasoning or statistical analysis to deduce sensitive information from non-sensitive query results. The scenario best describes aggregation (combining average salary with known individual data to calculate an unknown individual''s salary), though inference is also present. The key distinction: aggregation = combining multiple low-sensitivity data points; inference = deducing sensitive information from non-sensitive results. Both terms are often used together. SQL injection involves malicious query modification, not statistical deduction. Covert channels use hidden communication paths.',
  'AGGREGATION THREAT: Add up enough unclassified facts and the classified answer reveals itself.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.35, 0.20, 'ai_generated', true
),

-- Q10 medium / apply / software_acquisition_sbom
(
  8, 'software_acquisition_sbom',
  'An organization discovers that a critical third-party library used across 40 internal applications contains a critical vulnerability (CVE with CVSS 9.1). The SBOM (Software Bill of Materials) indicates 40 applications use this library. What is the MOST effective process for managing this remediation?',
  '["Patch only the internet-facing applications first and wait for the next scheduled maintenance cycle for internal ones","Remove the library from all applications and rebuild without a replacement until a patch is available","Use the SBOM to immediately identify all 40 affected applications, prioritize by exposure and criticality, and coordinate parallel patching across teams","Wait for the vendor to release a security advisory before taking action"]'::jsonb,
  2,
  'Explanation: The SBOM''s primary value is enabling rapid, comprehensive impact assessment when a vulnerability is discovered in a component. The SBOM-driven process: (1) identify all 40 affected applications immediately (the SBOM already provides this inventory), (2) risk-rank them by internet exposure, data sensitivity, and business criticality, (3) coordinate parallel patch deployment across teams rather than sequential patching. Patching only internet-facing applications (option B) leaves internal applications vulnerable — internal threats are real. Removing the library without a replacement (option C) breaks application functionality disproportionately. Waiting for a vendor advisory when the CVE is already published delays necessary action.',
  'SBOM TARGETING LIST: The Bill of Materials tells you exactly which 40 agents carry the compromised gadget.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q11 medium / analyze / threat_modeling_sdlc
(
  8, 'threat_modeling_sdlc',
  'A development team uses STRIDE during threat modeling for a new API gateway. They identify that an external client can call the API with another client''s API key. Which STRIDE category BEST classifies this threat?',
  '["Elevation of Privilege — using another client''s key grants access to resources the attacker should not have", "Tampering — the attacker modifies API requests using the stolen key", "Spoofing — the attacker impersonates a legitimate client''s identity using their API key", "Information Disclosure — the attacker gains access to another client''s data"]'::jsonb,
  2,
  'Explanation: Using another party''s API key to impersonate them is Spoofing — the threat to authentication integrity. The attacker presents a legitimate credential (the stolen API key) to assume a false identity. While privilege escalation and information disclosure may be consequences of successful spoofing, the threat category that characterizes the PRIMARY attack vector is Spoofing (S in STRIDE). STRIDE assigns threats to the root mechanism, not the downstream impact. The root mechanism is identity deception using stolen credentials.',
  'SPOOFING CLASSIFICATION: Using someone else''s credential to pretend you are them — that''s S in STRIDE.',
  'analyze',
  'scenario',
  'medium',
  1.25, 0.45, 0.20, 'ai_generated', true
),

-- Q12 medium / apply / devsecops_pipeline
(
  8, 'devsecops_pipeline',
  'A DevSecOps engineer discovers that API keys and database passwords are hardcoded in the application''s source code repository. Which control MOST directly prevents this issue from recurring?',
  '["Mandate code review by a security engineer for all commits touching configuration files","Store API keys in environment variables set at deployment time rather than in source code","Integrate a secrets scanning tool as a pre-commit hook and CI pipeline gate that blocks commits containing credential patterns","Implement a vault solution (e.g., HashiCorp Vault, AWS Secrets Manager) for all credential management"]'::jsonb,
  2,
  'Explanation: The most direct preventive control is secrets scanning at the pre-commit level — tools like GitGuardian, TruffleHog, or git-secrets scan for credential patterns before code is committed to the repository, blocking the commit if secrets are detected. This prevents the secret from ever entering version history. Storing secrets in environment variables (option C) is a best practice for deployment but does not prevent a developer from accidentally committing them to code. A vault solution (option D) is the correct architectural solution for secret management but does not directly prevent accidental commits. Manual security code review (option B) is too slow and inconsistent to catch every commit.',
  'PRE-COMMIT SENTINEL: The scanner checks every commit for credentials before they touch the repository.',
  'apply',
  'first_action',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q13 medium / apply / code_review_techniques
(
  8, 'code_review_techniques',
  'A security team conducts a code review of a web application''s authentication module. They find the following pattern: the login function catches all exceptions and returns a generic "Login failed" message, but different exception types cause different response delays (200ms for invalid username, 800ms for valid username/invalid password). Which vulnerability does this represent?',
  '["Improper error handling — exceptions are not logged server-side","Broken authentication — the password comparison function is incorrect","Timing side-channel — response time differences allow attackers to enumerate valid usernames","Information disclosure — the application reveals the exception type to the client"]'::jsonb,
  2,
  'Explanation: A timing side-channel leaks information through the time dimension rather than the content of responses. Even though the application shows a generic message, a measurable difference in response time (200ms vs 800ms) allows an attacker to statistically distinguish between "username does not exist" and "username exists but wrong password." This enables username enumeration — a significant reconnaissance advantage. Constant-time comparison functions (e.g., hmac.compare_digest in Python) and uniform response delays prevent this. The error handling catches exceptions (so improper logging may also be a finding), but the primary security vulnerability is the timing oracle.',
  'TIMING ORACLE: The clock reveals what the message hides — different delays for different failures betray the truth.',
  'apply',
  'scenario',
  'medium',
  1.30, 0.45, 0.20, 'ai_generated', true
),

-- Q14 medium / apply / software_testing_security
(
  8, 'software_testing_security',
  'A quality assurance engineer is testing an e-commerce application. They discover that navigating directly to /admin/orders without being an administrator returns the full order list. Which OWASP Top 10 2021 category does this represent?',
  '["Security Misconfiguration — the admin route was not properly protected in the server configuration", "Identification and Authentication Failures — the user was not properly identified before accessing the resource", "Insecure Direct Object References — a predictable URL parameter exposes an internal object", "Broken Access Control — the application fails to enforce authorization for privileged resources"]'::jsonb,
  3,
  'Explanation: Broken Access Control (#1 in OWASP Top 10 2021) encompasses failures to enforce what authenticated (or unauthenticated) users are allowed to do. Accessing an administrative endpoint without administrator authorization is a direct authorization enforcement failure — the application checked whether the user was authenticated (possibly) but did not verify they had the required role or permission. Security Misconfiguration relates to missing security headers, default credentials, or unprotected error pages — not authorization logic. Authentication failures relate to login and session management. IDOR is a subset of Broken Access Control but specifically refers to predictable object IDs exposing individual records — not role-based access enforcement.',
  'ACCESS CONTROL GAP: The admin door was unlocked — any user who walked down the right hallway got in.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.25, 0.20, 'ai_generated', true
),

-- Q15 medium / analyze / sdlc_security_integration
(
  8, 'sdlc_security_integration',
  'An organization adopts DevSecOps. A security champion argues that all security testing should shift to the development phase, eliminating dedicated security testing in later SDLC phases. A security manager disagrees. Which argument MOST effectively supports the security manager''s position?',
  '["Different testing types discover different vulnerability classes at different phases — SAST in development, DAST and integration security testing in staging, penetration testing pre-production are each necessary and complementary", "Developers cannot be trusted to perform security testing because they have a conflict of interest in their own code", "Later SDLC security testing is a compliance requirement that cannot be eliminated regardless of early testing coverage", "Shifting security testing to development phase is not technically feasible because most security tools require a running application"]'::jsonb,
  0,
  'Explanation: The "shift-left only" argument is a common misconception. SAST in development catches source code vulnerabilities, but DAST requires a running application and finds runtime vulnerabilities that SAST cannot detect (authentication state issues, race conditions, complex multi-step attack chains). Integration security testing finds vulnerabilities that emerge from component interactions not visible in unit-level testing. Penetration testing evaluates the system holistically with an adversarial mindset. Each phase adds distinct value. Eliminating later phases would create blind spots. Option B is overstated. Option C cites compliance but is not the strongest technical argument. Option D is false — SAST does not require a running application.',
  'DEFENSE IN DEPTH TESTING: SAST catches the source flaw; DAST catches the runtime flaw — both are mission critical.',
  'analyze',
  'tlatm',
  'medium',
  1.30, 0.50, 0.20, 'ai_generated', true
),

-- Q16 hard / analyze / secure_coding_standards
(
  8, 'secure_coding_standards',
  'A developer implementing an authentication system uses the following approach: store passwords as MD5(password + username) with the username as a static salt. A security reviewer flags this as insufficient. Which specific weakness does the reviewer MOST likely identify?',
  '["MD5 should be replaced with SHA-256, which is the industry standard for password hashing","The username should not be combined with the password because it reduces the entropy of the hash input","Static salts prevent all rainbow table attacks, making this implementation secure despite MD5''s weaknesses","MD5 is a fast hash function not designed for password storage; a static per-user salt prevents cross-user rainbow tables but not targeted brute force; use Argon2, bcrypt, or scrypt which are deliberately slow and include cost factors"]'::jsonb,
  3,
  'Explanation: The critical flaw is using MD5 — a fast cryptographic hash. Password hashing requires a SLOW function with a configurable cost factor (work factor) that makes brute force attacks computationally expensive. MD5 can be computed at billions of hashes per second on modern GPUs. Argon2 (winner of the Password Hashing Competition), bcrypt, and scrypt are designed specifically for password storage with configurable memory and time costs. A static per-user salt (username) does prevent cross-account rainbow tables, but targeted attack against a single account is still feasible with MD5''s speed. SHA-256 (option B) is also a fast hash — equally inappropriate for passwords. Option C is incorrect — adding username salt improves security. Option D is false — static salts do NOT prevent targeted brute force.',
  'PASSWORD HASH SPEED TRAP: MD5 runs at GPU speed — Argon2 forces the attacker to slow down.',
  'analyze',
  'scenario',
  'hard',
  1.65, 1.60, 0.20, 'ai_generated', true
),

-- Q17 hard / analyze / devsecops_pipeline
(
  8, 'devsecops_pipeline',
  'A CI/CD pipeline includes SAST, dependency scanning, container image scanning, and DAST stages. The security team proposes adding IaC scanning (infrastructure-as-code security linting). Which threat does IaC scanning MOST directly address that the other pipeline stages do not?',
  '["Vulnerabilities in application source code introduced by developers","Known CVEs in third-party libraries included in the application","Runtime vulnerabilities in the running web application''s behavior under attack","Misconfigured cloud resources and infrastructure — open S3 buckets, permissive IAM policies, unencrypted storage volumes — that exist in the deployment environment rather than in application code"]'::jsonb,
  3,
  'Explanation: SAST scans application source code. Dependency scanning identifies CVEs in third-party libraries. Container image scanning checks the container OS and packages. DAST tests the running application. None of these address infrastructure configuration — the Terraform, CloudFormation, Pulumi, or Kubernetes YAML files that define cloud resources. IaC scanning (tools like Checkov, tfsec, KICS) detects security misconfigurations in infrastructure templates: public S3 bucket ACLs, IAM policies with wildcard permissions, security groups allowing 0.0.0.0/0, unencrypted EBS volumes, missing CloudTrail logging. These misconfigurations are major root causes of cloud breaches but exist in infra code, not application code.',
  'INFRA CODE SCANNER: The app code is clean — but the Terraform file left the S3 bucket door wide open.',
  'analyze',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q18 hard / apply / database_security
(
  8, 'database_security',
  'A multilevel security database implements polyinstantiation to address a specific threat. A user with SECRET clearance attempts to insert a record with the key "Project Alpha" at the SECRET classification level. The database already contains a record with the key "Project Alpha" at the TOP SECRET level. What does polyinstantiation allow the database to do?',
  '["Reject the insert to prevent classification confusion, notifying the user that the key already exists", "Create a separate SECRET-level version of the record, allowing the SECRET user to see and work with their version without revealing that a TOP SECRET version exists", "Elevate the SECRET user''s clearance temporarily to resolve the record conflict", "Merge the SECRET and TOP SECRET records into a single record at the higher classification level"]'::jsonb,
  1,
  'Explanation: Polyinstantiation is a database technique that allows multiple versions of a record with the same key to coexist at different classification levels. A SECRET-cleared user inserting "Project Alpha" at SECRET creates a SECRET-level instance of that record, separate from the TOP SECRET instance invisible to them. This prevents a covert channel: if the database rejected the insert with "record already exists," it would reveal to the SECRET user that a higher-classified record with that key exists — leaking TOP SECRET information. Polyinstantiation allows each classification level to have its own isolated view of the data. Options A, C, and D all violate the confidentiality model in different ways.',
  'POLYINSTANTIATION COVER: Each clearance level sees its own version — the classified record''s existence stays hidden.',
  'apply',
  'scenario',
  'hard',
  1.65, 1.65, 0.20, 'ai_generated', true
),

-- Q19 hard / analyze / software_acquisition_sbom
(
  8, 'software_acquisition_sbom',
  'An organization acquires a commercial off-the-shelf (COTS) software product. The vendor refuses to share source code or a Software Bill of Materials (SBOM). The software processes sensitive financial data. Which risk management approach MOST effectively addresses the supply chain risk given these constraints?',
  '["Accept the vendor''s assurance that the software is secure based on their reputation and market position","Deploy the software in an isolated network segment to limit the blast radius if the software is compromised","Perform DAST against the running application to identify runtime vulnerabilities","Require the vendor to provide a SOC 2 Type II report covering the software development process, a contractual right-to-audit clause, and conduct binary analysis of the software for known vulnerable components"]'::jsonb,
  3,
  'Explanation: When source code and SBOM are unavailable, supply chain risk management must rely on independent assurance mechanisms: (1) A SOC 2 Type II report covering the SDLC and change management processes provides independent CPA attestation of the vendor''s development security practices; (2) A contractual right-to-audit clause provides recourse if the vendor''s security posture deteriorates; (3) Binary composition analysis (tools like Black Duck, FOSSA, or Veracode Binary SCA) can extract SBOM information from compiled software and identify known vulnerable components without source code access. Accepting vendor assurance without evidence is insufficient for sensitive data. Network isolation reduces blast radius but does not address the supply chain risk itself. DAST alone does not address supply chain component risks.',
  'VENDOR TRUST VERIFICATION: No source code, no SBOM? Binary scan the artifact and demand a SOC 2.',
  'analyze',
  'scenario',
  'hard',
  1.70, 1.65, 0.20, 'ai_generated', true
),

-- Q20 hard / apply / software_testing_security
(
  8, 'software_testing_security',
  'A security tester discovers a memory corruption vulnerability in a C++ application. When a specific input exceeds 256 bytes, the application crashes. The tester suspects this is a buffer overflow. What is the NEXT step to determine whether this vulnerability is exploitable for arbitrary code execution?',
  '["Report the crash as a critical vulnerability immediately — any crash is automatically exploitable","Discard the finding if the input length (256 bytes) is unlikely in normal usage","Patch the application by increasing the buffer size to 512 bytes to accommodate the oversized input","Analyze whether the overflow overwrites the stack return address or a function pointer, and whether memory protections (ASLR, DEP/NX, stack canaries) are in place that would prevent exploitation"]'::jsonb,
  3,
  'Explanation: A crash is a denial-of-service — whether it is exploitable for arbitrary code execution requires further analysis. The exploitability assessment involves: (1) Do we control what overwrites after the buffer? If the return address on the stack is overwritten, code execution may be possible. (2) What memory protections are active? ASLR (address space layout randomization) randomizes memory layout. DEP/NX (Data Execution Prevention/No Execute) prevents executing injected code in data regions. Stack canaries detect stack corruption before the return. These protections can prevent exploitation even when a buffer overflow exists. Option B overstates impact. Option C underestimates risk based on input likelihood. Option D fixes symptoms without addressing the root cause (the buffer needs bounds checking, not enlargement).',
  'EXPLOITABILITY ANALYSIS: A crash is a lead — memory protections and control flow determine if it''s a weapon.',
  'apply',
  'scenario',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q21 hard / analyze / code_review_techniques
(
  8, 'code_review_techniques',
  'A security team is choosing between peer code review and automated static analysis (SAST) for a high-output development team producing 500+ commits per month. Which statement MOST accurately characterizes the relative strengths and limitations of each approach for this volume?',
  '["SAST is always more accurate than peer review because it never introduces human bias", "SAST scales to all commits automatically and excels at pattern-based vulnerability detection but generates false positives and misses logic-level business rule violations; peer review catches context-dependent issues but cannot scale to cover every commit", "Peer code review should be applied to every commit and SAST reserved for quarterly security audits", "SAST and peer review discover identical vulnerability classes with only speed as the differentiating factor"]'::jsonb,
  1,
  'Explanation: The empirical distinction: SAST tools excel at identifying syntactic and structural patterns — SQL injection sinks, hardcoded credentials, insecure API usage, known anti-patterns — at unlimited scale and speed with zero analyst fatigue. However, they generate false positives, miss business logic vulnerabilities (e.g., a checkout flow that allows negative prices), and lack contextual understanding. Peer review catches what SAST misses — intent vs. implementation mismatches, business rule violations, design-level flaws — but human reviewers cannot scale to 500+ commits/month without coverage gaps or reviewer fatigue. The optimal model combines automated SAST on every commit with human review targeted at high-risk code areas (auth, crypto, data access). Option A is false — SAST introduces different biases (tool-specific rule sets). Option C inverts the scaling argument. Option D is demonstrably false.',
  'SAST vs HUMAN REVIEW: The robot catches the pattern; the human catches the flaw in the business logic.',
  'analyze',
  'comparison',
  'hard',
  1.65, 1.60, 0.22, 'ai_generated', true
),

-- Q22 hard / analyze / sdlc_security_integration
(
  8, 'sdlc_security_integration',
  'An organization uses a Spiral SDLC model. A security architect argues this model is inherently better suited for security than Waterfall. Which property of the Spiral model MOST justifiably supports this claim?',
  '["The Spiral model''s explicit risk assessment phase at the start of each cycle forces security risks to be identified and addressed before each iteration, creating continuous security feedback loops", "The Spiral model is faster than Waterfall and therefore reduces the time during which vulnerabilities exist in the codebase", "The Spiral model eliminates the need for security testing because risks are managed through documentation", "The Spiral model requires external security consultants to participate in every cycle, ensuring independent oversight"]'::jsonb,
  0,
  'Explanation: The Spiral model, proposed by Barry Boehm, is characterized by iterative development cycles where EACH cycle begins with risk identification and resolution. This means security risks are explicitly assessed at the start of each iteration — before implementation begins — and mitigation strategies are planned. This creates a structured, recurring cadence of security-informed decision making that is absent from Waterfall''s single-phase structure. Spiral is not necessarily faster than Waterfall. The Spiral model does not eliminate testing — it includes a verification phase. External security consultants are not a required component of the Spiral model.',
  'SPIRAL RISK LOOP: Every orbit starts with risk — security gets a vote before every build cycle.',
  'analyze',
  'tlatm',
  'hard',
  1.60, 1.55, 0.20, 'ai_generated', true
),

-- Q23 very_hard / analyze / devsecops_pipeline
(
  8, 'devsecops_pipeline',
  'A threat actor compromises a build server in an organization''s CI/CD pipeline. The attacker injects malicious code into compiled artifacts before they are signed and deployed to production. This attack succeeds without any changes to the monitored source code repository. Which security control would MOST effectively detect or prevent this attack?',
  '["Code signing of all artifacts using the organization''s private key", "Source code integrity monitoring with hash verification of every file in the repository", "Reproducible builds with independent build verification — rebuilding the artifact from the same source in an isolated environment and comparing cryptographic hashes with the pipeline-produced artifact", "Mandatory penetration testing of the build server environment annually"]'::jsonb,
  2,
  'Explanation: This attack is a "build pipeline compromise" (a software supply chain attack vector highlighted in the SLSA framework and seen in incidents like the 3CX supply chain attack). The attacker modified the binary AFTER compilation but BEFORE signing — the source code was never touched. Code signing (option A) confirms the artifact was signed by the organization''s key, but if the build server is compromised, the attacker signs the malicious artifact with the legitimate key. Source code monitoring (option B) is irrelevant — the source was unchanged. Annual penetration testing (option D) would not catch an active compromise between tests. Reproducible builds create the same output from the same source in an isolated, trusted environment. If the CI/CD-produced binary hash differs from the independently reproduced binary hash, tampering is detected. This is the control the SLSA (Supply chain Levels for Software Artifacts) framework promotes.',
  'SUPPLY CHAIN VERIFICATION: Rebuild it clean in isolation — if the hashes differ, the pipeline was poisoned.',
  'analyze',
  'scenario',
  'very_hard',
  2.15, 2.35, 0.20, 'ai_generated', true
),

-- Q24 very_hard / analyze / database_security
(
  8, 'database_security',
  'A security architect is designing a highly sensitive database for a government agency. The data contains both SECRET and TOP SECRET records. The architect must choose between implementing Bell-LaPadula (BLP) and Biba integrity models at the database layer. Which statement MOST accurately describes the trade-off for this use case?',
  '["BLP enforces confidentiality (no read up, no write down) which is appropriate for preventing disclosure of higher-classification data; Biba enforces integrity (no read down, no write up) which prevents lower-integrity data from contaminating higher-integrity data — a classified environment primarily needs BLP, with Biba applied to write paths where data quality is critical", "Biba is always preferred over BLP in government environments because integrity is more important than confidentiality for classified data", "BLP and Biba are identical models with different naming conventions — implementing either achieves the same security outcome", "Applying both models simultaneously is impossible because their rules directly contradict each other in all scenarios"]'::jsonb,
  0,
  'Explanation: Bell-LaPadula (BLP) was designed specifically for government classified data confidentiality: "no read up" (subjects cannot read objects above their clearance) and "no write down" (subjects cannot write to lower classification, preventing high-side data leakage). Biba addresses integrity: "no read down" (subjects cannot read lower-integrity data, preventing contamination) and "no write up" (subjects cannot write to higher-integrity objects they might corrupt). For a classified database, BLP is the primary model — confidentiality (preventing unauthorized disclosure) is the dominant requirement. Biba''s "no write up" complements BLP''s "no write down" on write paths. The two models can coexist in an implementation — Biba''s "no read down" can conflict with BLP''s "read at or below clearance" in some configurations, which is a real implementation challenge, but "impossible" overstates it. Option B is false — classified systems are defined by confidentiality requirements. Option C is false — the models have distinct rules.',
  'BLP vs BIBA: BLP guards secrets from disclosure; Biba guards data from corruption — classified systems need BLP first.',
  'analyze',
  'comparison',
  'very_hard',
  2.20, 2.40, 0.22, 'ai_generated', true
),

-- Q25 medium / apply / environment_security
(
  8, 'environment_security',
  'A development team merges code directly to the production branch without going through the staging environment. A critical bug is discovered in production 2 hours after deployment. Which environment management control, if implemented, would have been MOST likely to prevent this?',
  '["Daily backups of the production environment to enable rapid rollback", "Read-only access to the production branch for all development team members", "A mandatory promotion pipeline requiring code to pass integration tests, security scans, and QA approval in staging before deployment to production", "Blue-green deployment enabling immediate rollback to the previous version"]'::jsonb,
  2,
  'Explanation: A mandatory promotion pipeline with stage gates (integration testing, security scanning, QA sign-off) creates a controlled path from development to production where defects are caught in staging before reaching users. The bug would have been caught during staging testing. Backups and blue-green deployment (options A and D) enable recovery AFTER a bad deployment — they are reactive, not preventive. Read-only production branch access (option B) prevents direct commits to production code but does not enforce testing before deployment if the pipeline can be bypassed.',
  'STAGE GATE REQUIREMENT: Code earns its way to production — it does not skip the staging checkpoint.',
  'apply',
  'scenario',
  'medium',
  1.20, 0.30, 0.20, 'ai_generated', true
),

-- Q26 medium / apply / software_acquisition_sbom
(
  8, 'software_acquisition_sbom',
  'An organization''s security team discovers that an open-source library used in their flagship application has been abandoned by its maintainer for 18 months and has two unpatched CVEs with CVSS scores of 7.8 and 8.2. The library provides a utility function used in one module. What is the MOST appropriate response?',
  '["Evaluate replacing the library with an actively maintained alternative or implementing the utility function internally, and track the remediation in the risk register until completed", "Accept the risk because open-source library abandonment is a normal industry condition", "Remove the library immediately and rebuild the affected module without a replacement, accepting temporary feature loss", "Request the library''s original maintainer to resume maintenance and patch the CVEs"]'::jsonb,
  0,
  'Explanation: An abandoned library with unpatched high-severity CVEs (7.8 and 8.2) represents a supply chain risk that will not self-resolve. The appropriate risk-based response is to evaluate alternatives: (1) identify an actively maintained library with equivalent functionality, (2) if no drop-in replacement exists, consider implementing the utility function internally (especially if the function scope is limited), (3) document the current exposure in the risk register with a target remediation date and interim mitigating controls. Accepting the risk without remediation planning is insufficient for CVSS 7.8+ vulnerabilities. Immediate removal without a replacement risks breaking functionality in a more disruptive way than planned migration. Requesting the original maintainer to resume is not a viable security control.',
  'ABANDONED SUPPLY CHAIN: An unmaintained library with open CVEs is a ticking package — replace or internalize it.',
  'apply',
  'best_answer',
  'medium',
  1.25, 0.35, 0.20, 'ai_generated', true
),

-- Q27 medium / apply / threat_modeling_sdlc
(
  8, 'threat_modeling_sdlc',
  'A threat modeling session using PASTA (Process for Attack Simulation and Threat Analysis) is underway for a new payment processing microservice. The team has completed stages 1-5 (definition, scope, decomposition, threat analysis, vulnerability analysis). What is the PRIMARY activity in PASTA Stage 6?',
  '["Attack modeling — simulating realistic attack scenarios and attack trees to understand how identified vulnerabilities can be chained into actual attacks", "Defining security requirements and controls for the application", "Decomposing the application into components, trust boundaries, and data flows", "Risk and impact analysis to quantify the business impact of successful attacks"]'::jsonb,
  0,
  'Explanation: PASTA (Process for Attack Simulation and Threat Analysis) has seven stages: 1. Define objectives, 2. Define technical scope, 3. Application decomposition, 4. Threat analysis, 5. Vulnerability and weakness analysis, 6. Attack modeling (attack simulation, attack trees), 7. Risk and impact analysis. Stage 6 is the attack modeling stage, where the team builds attack trees to model how specific vulnerabilities identified in Stage 5 can be exploited in realistic attack scenarios. Stage 7 then quantifies the business risk of those simulated attacks. Stage 3 is decomposition (already completed). Security requirements are typically defined in Stage 1 objectives. Risk and impact analysis is Stage 7.',
  'PASTA STAGE 6 MISSION: Build the attack trees — map every route an adversary could take through the identified weaknesses.',
  'apply',
  'scenario',
  'medium',
  1.25, 0.40, 0.20, 'ai_generated', true
),

-- Q28 medium / analyze / environment_security
(
  8, 'environment_security',
  'An organization''s change control policy requires that all production code changes go through a documented approval workflow before deployment. A developer argues that hotfixes for critical security vulnerabilities should bypass this process to minimize exposure time. A security manager disagrees. Which position MOST correctly balances security and change management governance?',
  '["Allow developers to deploy security patches directly to production without approval to minimize vulnerability exposure windows", "Apply the full standard change process to all changes including security patches, accepting longer exposure as the cost of control", "Defer all hotfixes to the next scheduled maintenance window, regardless of severity, to maintain predictable deployment cadence", "Implement an expedited emergency change path with abbreviated but still documented approval (similar to an ITIL emergency change process) to reduce patch cycle time while maintaining governance"]'::jsonb,
  3,
  'Explanation: The false dichotomy is "full process vs. no process." The correct governance model is an expedited emergency path — a pre-defined, streamlined approval workflow for critical security patches that maintains documented authorization (even if by a single senior approver rather than a full CAB) while reducing cycle time. This is analogous to ITIL''s emergency change process. Bypassing approval entirely (option A) creates accountability gaps and introduces uncontrolled changes. Applying the full standard process (option B) to critical CVEs may be operationally reckless. Deferring to maintenance windows (option C) regardless of severity ignores risk-based prioritization entirely.',
  'EMERGENCY CHANGE PATH: Speed AND governance — abbreviated approval still means approval.',
  'analyze',
  'tlatm',
  'medium',
  1.30, 0.50, 0.20, 'ai_generated', true
);
