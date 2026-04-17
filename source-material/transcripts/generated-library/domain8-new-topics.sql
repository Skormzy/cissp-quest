-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 8 (Software Development Security)
-- Topics: 8.3.1 through 8.7.1
-- Source basis: ISC2 CBK, OWASP Top 10 (2021), NIST SP 800-218 (SSDF),
--               ISO/IEC 27034, CWE/SANS Top 25, NIST SP 800-161 (supply chain),
--               and public-domain cybersecurity knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 8.3.1 SDLC Security Integration
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  8,
  '8.3.1',
  'SDLC Security Integration',
  'Security is cheaper and more effective when built into each SDLC phase — from requirements and design through testing and maintenance — than when retrofitted after deployment; DevSecOps extends this by integrating security controls into the automated CI/CD pipeline.',
  '## SDLC Security Integration

The **Software Development Lifecycle (SDLC)** is the structured process organizations use to plan, design, develop, test, and deploy software systems. Without intentional security integration, each SDLC phase creates vulnerabilities that accumulate into deployed software with significant attack surface. The principle of **shifting security left** means catching and addressing security issues as early as possible in the SDLC — where fixing them is cheapest and most effective.

### Why Phase Matters for Cost

Research consistently shows that the cost to fix a security defect grows exponentially as it progresses through the SDLC. A requirement flaw caught during requirements review costs tens of dollars to fix (a conversation). The same flaw found during design costs hundreds (a design review). Found during development: thousands (a code change). Found during testing: tens of thousands (regression, retesting). Found after deployment: hundreds of thousands to millions (patch development, deployment to millions of users, potential breach costs). This cost curve is the primary business case for security integration throughout the SDLC.

### SDLC Phases and Security Activities

**Requirements phase**: Define security requirements alongside functional requirements. Identify applicable regulatory and compliance requirements (HIPAA, PCI DSS, GDPR). Conduct abuse case analysis — not just use cases (what should the system do), but abuse cases (what could an attacker do with this system?). Perform data classification for all data the system will handle. Define authentication, authorization, logging, and encryption requirements.

**Design phase**: Conduct threat modeling — systematically identify threats to the system before a line of code is written. STRIDE is the most widely used threat modeling framework (Spoofing identity, Tampering with data, Repudiation, Information disclosure, Denial of service, Elevation of privilege). Each STRIDE threat maps to a security control category. Also during design: apply security architecture principles (least privilege, defense in depth, fail secure, complete mediation, economy of mechanism, open design, separation of privileges). Review the design against security requirements.

**Development phase**: Apply secure coding practices (see OWASP Top 10 and CWE/SANS Top 25). Integrate SAST tools in developer IDEs and CI/CD pipeline for immediate feedback. Conduct peer code review with security focus. Manage third-party libraries through software composition analysis (SCA).

**Testing phase**: Execute DAST against the deployed application. Conduct security-specific testing: penetration testing, fuzz testing, security regression tests. Validate that all security requirements from the requirements phase are verified by a test case (security requirements traceability matrix).

**Deployment phase**: Verify production configuration against security baseline. Conduct deployment authorization (ISSO/AO approval in government contexts). Deploy monitoring (SIEM rules, alerting thresholds, anomaly baselines).

**Maintenance phase**: Manage vulnerability disclosures — monitor CVEs for all components (including third-party libraries). Apply security patches within defined SLAs. Conduct periodic security assessments and penetration tests against the deployed system.

### Waterfall vs Agile Security Challenges

**Waterfall SDLC**: Linear and sequential — each phase completes before the next begins. Security reviews fit naturally at phase gates. Disadvantage: if a security flaw is discovered in testing (late), the cost and schedule impact of fixing a design-level issue are severe. Security-heavy waterfall projects often defer security reviews to avoid schedule impact.

**Agile SDLC**: Iterative, with frequent short sprints. Security must be embedded within each sprint rather than relegated to a final "security sprint" (which is often cut when schedule pressure mounts). Security activities within each sprint: include security requirements in the sprint backlog (user stories with acceptance criteria specifying security behavior), conduct security code review in pull requests, run SAST on every commit, and schedule penetration testing between major releases.

### DevSecOps

**DevSecOps** extends DevOps (the integration of development and operations) by embedding security into the automated CI/CD (Continuous Integration/Continuous Deployment) pipeline. Security controls become automated gates rather than manual review steps: SAST scans run automatically on every commit; SCA (Software Composition Analysis) checks for vulnerable dependencies on every build; secret scanning prevents credentials from being committed; DAST runs automatically against staging environments; and container image scanning runs before deployment. Security engineers become enablers rather than gatekeepers — they build the automated security checks that run without human intervention at pipeline speed.

The NIST Secure Software Development Framework (SSDF, SP 800-218) provides a set of practices for organizations to integrate security into their software development processes.',
  NULL,
  '{"headers": ["SDLC Phase", "Key Security Activities", "Primary Tools/Methods", "What Gets Missed Without It"], "rows": [["Requirements", "Security requirements, abuse cases, regulatory mapping, data classification", "Security requirements checklists, abuse case modeling", "Functional requirements with no security constraints — security bolted on later at high cost"], ["Design", "Threat modeling (STRIDE/DREAD), security architecture review, security design principles", "STRIDE threat model, attack trees, architecture review boards", "Architectural weaknesses that cannot be fixed without redesign (trust boundaries, data flows, privilege separation)"], ["Development", "Secure coding, peer code review, SAST, SCA", "Checkmarx, SonarQube, Snyk SCA, pull request security review", "Injection flaws, hardcoded secrets, insecure dependencies introduced at the code level"], ["Testing", "DAST, penetration testing, fuzzing, security regression tests", "Burp Suite, OWASP ZAP, Metasploit, fuzzing frameworks", "Runtime vulnerabilities, authentication flaws, business logic issues missed by static analysis"], ["Deployment", "Configuration baseline verification, monitoring setup, deployment authorization", "Ansible/Terraform config checks, SIEM baseline, ATO process", "Misconfigured production environment that nullifies all development security work"], ["Maintenance", "Patch management, CVE monitoring, periodic assessments, SCA for new disclosures", "NVD feeds, dependency scanning, vulnerability management platforms", "Deployed vulnerabilities that go unpatched for months or years as the threat landscape evolves"]]}'::jsonb,
  'SDLC security exam areas: (1) Security is cheapest to fix earliest in the SDLC — shifting left reduces cost exponentially. (2) Threat modeling happens during DESIGN (before code is written). (3) SAST = development/code phase. DAST = testing/deployment phase. (4) Agile security must be embedded in every sprint, not deferred to a "security sprint." (5) DevSecOps = security gates automated in CI/CD pipeline. (6) NIST SP 800-218 (SSDF) is the governing framework for secure software development practices.',
  'As a manager, the most valuable investment in software security is threat modeling at design time. A one-hour threat modeling session before development begins can identify and eliminate entire classes of vulnerability before a line of code is written. Budget time for threat modeling reviews during sprint planning for every significant new feature. The second most valuable investment is automated SAST in the CI/CD pipeline — it catches secure coding failures at the moment they are introduced, when they are cheapest to fix, without requiring a separate security team review for every commit.',
  'SDLC Security: Require (requirements), Design (threat model), Develop (SAST + secure code), Test (DAST + pen test), Deploy (config baseline), Maintain (patch management). Shifting Left = catching bugs earlier = cheaper fixes. DevSecOps = security automated in the pipeline. STRIDE = Spoofing, Tampering, Repudiation, Info disclosure, DoS, Elevation — the threat model framework for design phase.',
  'In the Dev Lab in Austin, the software development pipeline is visualized as an assembly line. Station 1 (Requirements): a security analyst is reviewing the new feature''s user stories, adding abuse cases and GDPR data handling requirements. Station 2 (Design): the lead architect is running a STRIDE threat modeling session on the whiteboard — data flows mapped, trust boundaries marked, threats identified for each. Station 3 (Development): the IDE shows a SAST alert in real time as a developer types a SQL query — "potential SQL injection: use parameterized query." Station 4 (Testing): DAST results from last night''s staging run show 3 findings. Station 5 (Deployment): Terraform deployment plan passes the security config check gate. Station 6 (Maintenance): Dependabot flagged a critical CVE in a third-party logging library — auto-PR created for review.'
);

-- ---------------------------------------------------------------------------
-- 8.4.1 Secure Coding Practices
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  8,
  '8.4.1',
  'Secure Coding Practices',
  'Secure coding prevents the most common and devastating vulnerabilities — the OWASP Top 10 (2021) defines the critical risk categories, with input validation and parameterized queries defending against injection, and proper error handling and cryptographic practices eliminating entire vulnerability classes.',
  '## Secure Coding Practices

Secure coding is the practice of writing software that resists attack by applying defensive programming techniques throughout the development process. Most of the vulnerabilities that attackers exploit in production applications result from predictable, preventable coding mistakes — not exotic zero-days. The OWASP (Open Web Application Security Project) Top 10 is the most widely referenced framework for web application security risks and is directly cited in CISSP study material.

### OWASP Top 10 (2021)

**A01: Broken Access Control**: Access control restrictions are not properly enforced. Users can act outside their intended permissions — accessing other users'' accounts, elevating privileges, viewing sensitive records. Prevention: enforce access control server-side (never client-side), deny by default, log and alert on access control failures.

**A02: Cryptographic Failures** (formerly "Sensitive Data Exposure"): Weak or absent cryptography exposes sensitive data at rest or in transit. Using MD5 for password hashing, storing credit card numbers in cleartext, using HTTP instead of HTTPS. Prevention: use strong, modern cryptography (AES-256, TLS 1.3, bcrypt/Argon2 for passwords); never store sensitive data that is not needed.

**A03: Injection**: Untrusted data is sent to an interpreter as part of a command or query. SQL injection, LDAP injection, OS command injection, and NoSQL injection allow attackers to manipulate database queries or execute system commands. **Prevention: parameterized queries / prepared statements for SQL; input validation and allow-listing; use of ORM frameworks that abstract query construction; OWASP ESAPI for escaping.**

**A04: Insecure Design**: Security risks from design flaws — not implementation bugs. An application designed without threat modeling, without rate limiting on authentication, without anti-abuse controls. Prevention: threat modeling during design phase, security design patterns, security requirements in sprint backlog.

**A05: Security Misconfiguration**: Misconfigured cloud permissions, default passwords in use, unnecessary features enabled, overly verbose error messages revealing stack traces. Prevention: hardened baseline configurations, removal of default credentials, automated configuration scanning (CSPM), suppress verbose error messages in production.

**A06: Vulnerable and Outdated Components**: Using libraries, frameworks, or server software with known vulnerabilities — the Log4Shell vulnerability (CVE-2021-44228 in Log4j) is the canonical example. Prevention: SCA (Software Composition Analysis) tools to inventory and monitor all dependencies; SBOM; automated alerts when new CVEs affect used components.

**A07: Identification and Authentication Failures** (formerly "Broken Authentication"): Weak authentication implementation — predictable session tokens, no MFA, credential stuffing susceptibility, insecure password storage. Prevention: strong session management (server-side, random, sufficient entropy); MFA; rate limiting on login; secure password storage (bcrypt, Argon2, PBKDF2).

**A08: Software and Data Integrity Failures**: Code and infrastructure that does not verify integrity of updates, critical data, or CI/CD pipeline components. Includes deserialization vulnerabilities and supply chain attacks through untrusted plugins. Prevention: digital signatures on code and artifacts, verified update mechanisms, CI/CD pipeline security.

**A09: Security Logging and Monitoring Failures**: Insufficient logging and monitoring fails to detect attacks in progress. Prevention: log all authentication events, access control failures, and input validation failures; centralize in SIEM; set alerting thresholds; test detection capability.

**A10: Server-Side Request Forgery (SSRF)**: The application fetches a remote resource based on user-supplied URL without validating the URL, allowing attackers to direct the server to make requests to internal services or cloud metadata APIs. Prevention: validate and allow-list URL destinations; disable HTTP redirects; deny internal IP ranges.

### Input Validation

Input validation is the single most impactful secure coding practice — it prevents injection attacks, buffer overflows from oversized input, and business logic bypasses. Principles:

- **Allow-list (whitelist)**: Define what valid input looks like; reject anything that does not match. More secure than deny-listing (blocklist), which attempts to enumerate all bad inputs.
- **Validate on the server side**: Client-side validation is convenience only — attackers bypass it trivially. All validation must occur server-side.
- **Validate type, length, format, and range**: A ZIP code field should accept only 5 digits. A date field should accept only valid dates. An API parameter for user ID should accept only integers in the expected range.

### Secure Error Handling

Error messages shown to users must never reveal internal system details — stack traces, database schema, server file paths, or internal IP addresses. Such information is invaluable to attackers for reconnaissance. In production: log detailed errors server-side (for debugging), return generic, user-friendly messages to the client. Distinguish between errors that should be logged-and-alerted (security violations) and errors that are operational noise.

### Memory Safety and Buffer Overflow Prevention

Buffer overflow vulnerabilities arise when an application writes more data to a fixed-size buffer than the buffer can hold, overwriting adjacent memory. Prevention: use memory-safe languages (Rust, Go, Java, Python) that perform bounds checking automatically; in C/C++, use safe string functions (strncpy, strncat) with explicit length limits; enable compiler protections (stack canaries, ASLR, DEP/NX bit); use FORTIFY_SOURCE compiler flag.',
  NULL,
  '{"headers": ["OWASP Top 10 (2021)", "Root Cause", "Example Attack", "Primary Prevention"], "rows": [["A01: Broken Access Control", "Missing or bypassed authorization checks", "User changes account ID in URL to access another account", "Server-side access control enforcement; deny by default"], ["A02: Cryptographic Failures", "Weak/absent crypto for sensitive data", "MD5-hashed passwords cracked by rainbow table", "AES-256 at rest; TLS 1.3 in transit; bcrypt/Argon2 for passwords"], ["A03: Injection", "Untrusted input interpreted as code/query", "SQL injection: '' OR ''1''=''1 in login field → authentication bypass", "Parameterized queries; input validation; ORM use"], ["A04: Insecure Design", "Security not considered in architecture/design", "No rate limiting on authentication → credential stuffing at scale", "Threat modeling; abuse case analysis; security design patterns"], ["A05: Security Misconfiguration", "Default/insecure configuration in production", "Verbose error messages reveal stack trace and DB schema", "Hardened baselines; config scanning; suppress error details in prod"], ["A06: Vulnerable Components", "Using libraries with known vulnerabilities", "Log4Shell (CVE-2021-44228) — RCE via JNDI lookup in log message", "SCA scanning; SBOM; automated CVE alerting for dependencies"], ["A07: Auth Failures", "Weak authentication implementation", "Session token predictable → session hijacking", "Random high-entropy session tokens; MFA; rate limiting; secure password storage"], ["A08: Integrity Failures", "No verification of software/data integrity", "Malicious plugin injected into CI/CD pipeline → backdoored release", "Digital signatures on artifacts; verified update mechanisms"], ["A09: Logging Failures", "Insufficient security logging", "Attacker operates undetected for months — no SIEM alerts", "Log auth events, access failures; centralize in SIEM; test alerts"], ["A10: SSRF", "Server fetches user-supplied URL without validation", "http://169.254.169.254/latest/meta-data/ fetched → cloud credentials exposed", "URL allow-list; block internal IP ranges; disable redirects"]]}'::jsonb,
  'Secure coding exam areas: (1) OWASP Top 10 is the reference framework — know the category names and their root causes. (2) Injection (#A03) prevention = parameterized queries (prepared statements). (3) Broken access control (#A01) is the most common web application vulnerability class. (4) Never show stack traces or internal details in error messages. (5) Input validation: allow-list (whitelist) is stronger than deny-list (blacklist). (6) Buffer overflow prevention = memory-safe languages, bounds checking, stack canaries, ASLR. Know which OWASP category a given vulnerability scenario falls into.',
  'As a manager, the OWASP Top 10 is your security requirements checklist for any web application development project. Require developers to address each category as part of the definition of done for every sprint that touches a web-facing component. The most impactful investments are: SAST tools that catch injection vulnerabilities before they reach testing, mandatory parameterized queries as a coding standard enforced by code review, and automated dependency scanning with mandatory remediation SLAs for critical CVEs. Do not let the team treat security findings as optional cleanup — they belong in the sprint backlog like any other requirement.',
  'OWASP Top 10 2021: BAI-SCV-ALSi — Broken Access, Auth failures, Injection, Security Misconfiguration, Cryptographic failures, Vulnerable components, Insecure Design, Logging failures, Software integrity failures, SSRF. Or group them: Control failures (A01, A07), Crypto failures (A02), Input failures (A03, A10), Design failures (A04), Config failures (A05), Component failures (A06), Integrity failures (A08), Detection failures (A09). Input validation: Always Allow-list over deny-list. Always server-side.',
  'In the Dev Lab in Austin, the daily code review session has the OWASP Top 10 checklist on the screen. The senior developer reviews a pull request for the new user profile feature. Finding 1: direct SQL string concatenation with user input — A03 Injection. Rejected with comment: "parameterized queries required." Finding 2: user ID taken from client-side cookie without server validation — A01 Broken Access Control. Rejected: "validate session and authorization server-side." Finding 3: forgot to log failed profile update attempts — A09 Logging Failure. Added to the acceptance criteria. Finding 4: new npm dependency flagged by Snyk SCA — CVE-9.8 critical in its cryptographic module — A06 Vulnerable Components. PR blocked until dependency updated. The review takes 30 minutes and catches four production vulnerabilities before they ever compile.'
);

-- ---------------------------------------------------------------------------
-- 8.5.1 Database Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  8,
  '8.5.1',
  'Database Security',
  'Database security controls include parameterized queries (preventing SQLi), polyinstantiation (resolving multi-level security conflicts), inference and aggregation attack prevention, database activity monitoring (DAM), and access control at the view and row level to limit data exposure.',
  '## Database Security

Databases are frequently the ultimate target of attacks against web applications — they store the credentials, personal data, financial records, and intellectual property that attackers seek. Database security requires controls at the application layer (preventing SQLi), the database configuration layer (access control, audit logging), and the architecture layer (network segmentation, encryption at rest). The CISSP exam tests several database-specific security concepts that do not appear elsewhere in the curriculum.

### SQL Injection and Parameterized Queries

**SQL injection (SQLi)** is the most critical database attack vector. It occurs when an application constructs SQL queries by concatenating user-supplied input with SQL syntax, allowing an attacker to alter the query''s meaning. A classic example:

```sql
-- Vulnerable:
query = "SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "'"
-- Attacker inputs: username = '' OR ''1''=''1'' --
-- Resulting query authenticates as first user in database
```

**Parameterized queries** (prepared statements) separate the SQL code from the data by defining the query structure first with placeholders, then binding data values separately. The database driver handles escaping and type enforcement — the data cannot alter the query structure regardless of its content:

```sql
-- Safe: parameterized query
query = "SELECT * FROM users WHERE username=? AND password=?"
stmt.setString(1, username)
stmt.setString(2, password)
```

Other SQL injection variants include blind SQLi (no direct output — boolean-based or time-based inference), second-order SQLi (data stored then executed later), and out-of-band SQLi (data exfiltrated through DNS or HTTP).

### Polyinstantiation

**Polyinstantiation** is a multi-level security (MLS) database concept that addresses the inference problem: in a database with records at different classification levels, a Secret-clearance user who queries for a record and receives "no record found" may be able to infer that a Top Secret record with that key exists (because the query would not return it due to the classification difference). Polyinstantiation solves this by allowing different versions of the same record to exist simultaneously at different classification levels, each visible only to subjects with appropriate clearance. The Secret-clearance user sees the Secret version of the record (even if it has different data), preventing the inference that a Top Secret version exists.

### Inference and Aggregation Attacks

**Inference attacks** allow an attacker to derive sensitive information from non-sensitive data. Even if direct access to sensitive fields is denied, querying patterns, statistical outputs, or combinations of permitted fields may allow the attacker to infer the sensitive value. Example: a healthcare database denies direct access to HIV status, but allows queries of medication type and pharmacy — combining these fields can often infer HIV status with high accuracy.

**Aggregation attacks** combine multiple individually non-sensitive data points to infer sensitive information. Each individual query returns only public information, but the aggregate reveals something that would not be directly disclosed. Example: a user''s name (public), employer (public), home neighborhood (public), and daily commute time (public) can aggregate into a profile that identifies their home address and daily routine — a stalking risk.

Mitigations include: differential privacy (adding statistical noise to query results), k-anonymity (suppressing records that would create unique combinations), query result cell suppression (suppressing statistical cells with too few records), and access controls that restrict which combinations of fields can be queried simultaneously.

### Database Activity Monitoring (DAM)

**Database Activity Monitoring** solutions monitor and log all database activity in real time — every query, every administrative action, every login and logout — independently of the database''s own logging. DAM systems can detect anomalous query patterns (unusually large result sets, queries at unusual hours, queries from unexpected source IPs, access to tables not normally queried by a given user) and alert on potential data exfiltration or insider threat activity.

DAM provides an audit trail independent of database administrators (who might otherwise be able to delete logs from the database itself), making it particularly valuable for privileged user monitoring and compliance (SOX, PCI DSS, HIPAA all have requirements for privileged access monitoring in database environments).

### Views and Row-Level Security

**Database views** are virtual tables defined by a query — they expose only a subset of columns or rows from an underlying table. Access to sensitive tables can be restricted entirely, with users granted access only to views that expose the data they are authorized to see. Views implement need-to-know access control at the database layer.

**Row-Level Security (RLS)** is a database feature (supported by PostgreSQL, SQL Server, Oracle, and others) that restricts which rows a user can see based on the user''s identity or role, transparently applied to every query. An RLS policy might specify that a regional sales manager can only query sales records for their assigned region — the filtering happens automatically at the database layer regardless of how the application constructs its queries.',
  NULL,
  '{"headers": ["Database Security Control", "What It Prevents / Detects", "Implementation Level", "Example"], "rows": [["Parameterized queries / Prepared statements", "SQL injection — prevents user input from altering query structure", "Application layer (developer responsibility)", "PreparedStatement in Java; parameterized queries in .NET; ORM query builders"], ["Polyinstantiation", "Inference of higher-classification records by lower-clearance users in MLS systems", "Database design and MLS policy", "Multiple versions of same record at different classification levels (Secret, Top Secret)"], ["Inference/Aggregation controls", "Inference of sensitive data from permitted non-sensitive queries", "Database + application layer", "Query suppression, differential privacy, k-anonymity, query logging and anomaly detection"], ["Database Activity Monitoring (DAM)", "Privileged user abuse, data exfiltration, policy violations; provides independent audit trail", "Infrastructure layer (separate from DBMS)", "Imperva DAM, IBM Guardium, McAfee DAM"], ["Database views", "Unauthorized access to sensitive columns or rows", "Database layer (DBA responsibility)", "CREATE VIEW SalesRegionA AS SELECT ... WHERE region=''A'' — user granted view access, not table access"], ["Row-Level Security (RLS)", "Cross-tenant data leakage, unauthorized row access", "Database layer (policy-based, transparent)", "PostgreSQL RLS policy: tenant_id = current_tenant_id() applied to every SELECT automatically"]]}'::jsonb,
  'Database security exam areas: (1) Parameterized queries / prepared statements = the correct prevention for SQL injection. (2) Polyinstantiation = MLS concept for preventing inference of higher-classification records in the same database. (3) Aggregation attack = combining multiple non-sensitive data points to infer sensitive information. Inference attack = deriving sensitive info from query results. (4) DAM = independent monitoring of database activity, including privileged users. (5) Views and RLS enforce need-to-know at the database layer. (6) The exam may ask what control prevents inference attacks in a classified database — that is polyinstantiation.',
  'As a manager, your database security program must address both the application interface (parameterized queries enforced as a development standard, SAST to catch violations) and the database layer (RLS, DAM, privileged account monitoring, encryption at rest). The most common real-world failure is the first one: developers who concatenate user input into SQL queries because it is faster to write. Treat SQL string concatenation with user input as a zero-tolerance coding violation — no exceptions, no deadline pressure justification. The second most common failure is inadequate privileged access monitoring: DBAs who can query any table, delete logs, and export data without any independent monitoring.',
  'SPIDER — SQL injection (Parameterized queries prevent it), Polyinstantiation (inference prevention in MLS), Inference attacks (combining permitted data to learn forbidden data), DAM (Database Activity Monitoring — the independent audit camera), Encryption at rest, Row-level Security and Views (restrict what users see). Parameterized = the only answer to SQLi. Polyinstantiation = the MLS database concept. Aggregation = many small non-sensitive facts → one sensitive conclusion.',
  'In the Dev Lab in Austin, the database security review covers three scenarios. Scenario 1: a developer''s code review shows SQL string concatenation — flagged as critical, returned with: "Use PreparedStatement with parameter binding." Scenario 2: the military client''s classified database needs to show Secret users a record without revealing the Top Secret version exists — the architect specifies polyinstantiation: two rows for the same key, one at Secret classification, one at Top Secret, each visible only to the appropriate clearance level. Scenario 3: the analytics team''s aggregate query about patient demographics is returning cells with fewer than 5 patients — the DBA applies cell suppression to prevent inference of individual patient data from small cell sizes. DAM logs every query to the production database; the SIEM fires an alert when the analytics account queries the prescriptions table at 2 AM — an anomaly that leads to discovering a rogue query script exfiltrating data.'
);

-- ---------------------------------------------------------------------------
-- 8.6.1 Software Supply Chain Security
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  8,
  '8.6.1',
  'Software Supply Chain Security',
  'Software supply chain attacks target the development pipeline — compromising build tools, package repositories, or open-source libraries to inject malicious code into trusted software — defended through SBOMs, SCA scanning, dependency pinning, and CI/CD pipeline integrity controls.',
  '## Software Supply Chain Security

The **software supply chain** is the ecosystem of source code, dependencies, build tools, CI/CD infrastructure, and distribution mechanisms that transform developer intentions into deployed applications. Supply chain attacks target this ecosystem rather than the final application, inserting malicious code at a point in the pipeline where it is trusted and propagated automatically. The 2020 SolarWinds incident (malicious code injected into the Orion build process, distributed as a signed update to 18,000 organizations) and the 2021 Log4Shell vulnerability (critical RCE in a ubiquitous open-source library) demonstrated the scale and impact of software supply chain risk.

### Software Bill of Materials (SBOM)

An SBOM is a formal, machine-readable inventory of every software component in an application, including:
- First-party code (developed internally)
- Third-party open-source libraries and their transitive dependencies (dependencies of dependencies)
- Commercial off-the-shelf (COTS) components
- Version information for every component
- License information

SBOMs enable organizations to rapidly identify which applications are affected when a new vulnerability is disclosed in a specific component version (as occurred with Log4Shell — organizations with SBOMs could identify every affected application in hours; those without SBOMs spent weeks on manual inventory).

Standard SBOM formats include: **SPDX** (Software Package Data Exchange, ISO/IEC 5962 — Linux Foundation standard) and **CycloneDX** (OWASP standard, particularly focused on security use cases). U.S. Executive Order 14028 (2021) mandated SBOMs for software sold to the U.S. federal government.

### Software Composition Analysis (SCA)

SCA is the automated process of identifying open-source components in an application and checking their versions against known vulnerability databases (NVD, GitHub Advisory Database, OSV). SCA tools analyze package manager manifests (package.json, requirements.txt, pom.xml, go.sum, Cargo.lock), lockfiles, and binary artifacts to identify component versions, then alert when CVEs are published against those versions.

SCA tools include: Snyk Open Source, OWASP Dependency-Check, Dependabot (GitHub), Black Duck, and Veracode SCA. Integration into CI/CD pipelines enables SCA to run automatically on every build, blocking deployments that introduce components with critical vulnerabilities.

### Dependency Pinning and Lock Files

**Dependency pinning** specifies exact versions of dependencies in the project configuration (pin to a specific version rather than a version range). Pinning prevents automatic upgrades to new versions that may introduce vulnerabilities or breaking changes. **Lockfiles** (package-lock.json for npm, poetry.lock for Python, Cargo.lock for Rust, go.sum for Go) record the exact resolved version of every dependency (including transitive dependencies), ensuring that builds are reproducible across environments and that new versions cannot be silently introduced.

Dependency confusion attacks exploit organizations that use internal package feeds: an attacker publishes a public package with the same name as an internal private package at a higher version number, causing package managers to download the attacker''s public version instead of the internal one. Defenses include: namespace reservation on public registries, scoped packages, explicit registry configuration in package manager settings.

### Build Pipeline Integrity

A compromised CI/CD pipeline is as dangerous as compromised source code because the pipeline controls what gets deployed to production. Build pipeline integrity controls include:

- **Hermetic builds**: The build process uses only explicitly declared inputs (no network access during build, no implicit dependencies) — ensures that the output is fully reproducible from the inputs
- **Build artifact signing**: Digitally signing build outputs (artifacts, container images) with developer or CI/CD system keys, enabling consumers to verify artifact authenticity (sigstore/cosign for container images, GPG signing for packages)
- **Pipeline access controls**: Principle of least privilege for CI/CD service accounts; no direct production deployments from developer workstations — all deployments through the pipeline
- **Secrets management in pipelines**: Secrets (API keys, credentials) are injected from a secrets manager (HashiCorp Vault, AWS Secrets Manager) at runtime — never stored in source code or CI/CD configuration files

### Third-Party Library Vetting

Not all open-source libraries deserve equal trust. Vetting criteria for new dependencies include: active maintenance (regular commits, responsive to vulnerability reports), security track record, community adoption and scrutiny, license compatibility (GPL license implications for proprietary software), dependency footprint (avoid transitive dependency bloat), and review of the library''s own security practices (does the project use SAST, signed releases, responsible disclosure policies).',
  NULL,
  '{"headers": ["Supply Chain Attack Vector", "Example", "Defense", "Relevant Standard/Tool"], "rows": [["Malicious code in open-source library", "Event-stream npm package backdoor (2018); colors.js sabotage (2022)", "SCA scanning; dependency pinning; vetted dependency policy", "NIST SP 800-161; Snyk; OWASP Dependency-Check"], ["Compromised build system", "SolarWinds Orion build process injection → signed malicious update", "Hermetic builds; build pipeline access controls; artifact signing", "SLSA framework; sigstore/cosign; build provenance attestation"], ["Dependency confusion attack", "Attacker publishes same-named public package at higher version than internal package", "Namespace reservation; scoped packages; explicit registry config", "npm scopes; PyPI trusted publishers; Cargo alternative registries"], ["Typosquatting", "''request'' vs ''requst'' — malicious package with similar name to popular package", "Careful dependency addition review; SCA scanning; lockfiles", "Manual review; SCA tooling; lockfile enforcement"], ["Compromised package registry", "Supply chain attack on PyPI, npm, or RubyGems infrastructure directly", "Package signing verification; sigstore; checksum verification", "TUF (The Update Framework); sigstore; package signing standards"]]}'::jsonb,
  'Software supply chain exam areas: (1) SBOM = inventory of all software components — enables rapid vulnerability response when new CVEs drop. (2) SCA = automated open-source dependency vulnerability scanning. (3) Dependency pinning + lockfiles = prevent silent dependency version changes. (4) Build pipeline integrity = hermetic builds, artifact signing, least-privilege CI/CD accounts. (5) Dependency confusion = attacker-published package with same name as internal package at higher version. (6) SolarWinds is the canonical supply chain attack example — compromise of build process, not the application code directly.',
  'As a manager, software supply chain security has moved from an advanced concern to a baseline requirement. The dependency graph of a typical enterprise application — often thousands of direct and transitive dependencies — represents thousands of potential attack surfaces. Mandate SCA scanning in your CI/CD pipeline with a clear policy: critical CVEs block deployment; high CVEs require remediation within 7 days. Require SBOMs for all deployed applications. Designate approved package registries and proxy all dependency downloads through internal mirrors with security scanning. These controls are not optional for any organization with a responsible vulnerability management program.',
  'SBOM = Software Birth cOntrol Manifest (every ingredient listed). SCA = Software Component Audit (check ingredients against known hazards). Pinning = nailing the version down so it can''t change. Hermetic build = sealed room — only approved ingredients enter. Sign artifacts = put your seal on the box. Dependency confusion = doppelganger attack on your package registry. SolarWinds = the canonical "the factory was compromised, not the product" attack.',
  'In the Dev Lab in Austin, the CI/CD pipeline dashboard shows every security gate in sequence. Gate 1: Secret scanning (no credentials in code commits). Gate 2: SAST (code quality and security analysis). Gate 3: SCA scan — Snyk checks all 847 direct and transitive dependencies against NVD. Today''s scan flagged one critical CVE (9.1) in a JSON parsing library — build blocked. Gate 4 (after fix): build produces artifacts; cosign signs the container image with the build system''s key. Gate 5: SLSA provenance attestation generated — this artifact can be verified back to this specific build run. Gate 6: staging DAST run. Gate 7: deployment to production — only signed, attested artifacts from the pipeline are accepted. A developer who tries to push a container image from their local machine gets rejected at Gate 7: "unsigned artifact — policy violation."'
);
