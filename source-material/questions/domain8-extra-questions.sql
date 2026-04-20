-- =====================================================================
-- CISSP Quest -- Domain 8: Software Development Security
-- Extra Question Bank: 25 Questions (Hard / Very Hard)
--
-- FOCUS AREAS: OWASP Top 10 2021, SAST/DAST/IAST/RASP differences,
--   DevSecOps pipeline gates, secure API design,
--   dependency confusion attacks
--
-- DIFFICULTY: hard (15) | very_hard (10)
-- COGNITIVE:  apply (14) | analyze (11)
-- TYPES: scenario, tlatm, first_action, comparison, best_answer
-- CORRECT ANSWER POSITION: ~6-7 per position (0,1,2,3)
--
-- IRT: irt_a 1.2-2.0, irt_b 0.8-2.5, irt_c 0.20-0.25
-- Run AFTER domain8-questions.sql
-- =====================================================================

INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES

-- Q1: hard / apply / scenario / correct=0
(
  8, 'owasp_top10',
  'A web application allows users to reset their password by entering their email address. The server responds with "Email sent to {submitted_email}" if the email exists, and "No account found" if it does not. A security researcher reports this as a vulnerability. Which OWASP Top 10 2021 category does this fall under, and what is the fix?',
  '["A07 Identification and Authentication Failures -- the differential response (email found vs. not found) enables user account enumeration, revealing which email addresses have accounts; the fix is to return an identical response regardless of whether the account exists (''If an account exists for this email, instructions have been sent''), preventing user enumeration", "A01 Broken Access Control -- the password reset can be performed without authentication", "A03 Injection -- the email input is vulnerable to SQL injection via the email field", "A09 Security Logging and Monitoring Failures -- the application fails to log password reset attempts"]'::jsonb,
  0,
  'User account enumeration via differential authentication/reset responses falls under OWASP A07:2021 Identification and Authentication Failures. When an application reveals whether an account exists (through different error messages, response times, or status codes), attackers can enumerate valid user accounts for targeted attacks (credential stuffing, spear phishing). Fix: return identical responses for both cases ("If an account exists for this email, you will receive instructions"). Response time normalization is also needed -- if the "email found" path takes longer (due to email sending), timing attacks can still enumerate accounts. This is also known as Username Enumeration.',
  'Differential reset response = user enumeration = OWASP A07. Fix: identical response for found/not-found. Also normalize response times.',
  'apply', 'scenario', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q2: hard / analyze / comparison / correct=1
(
  8, 'sast_dast',
  'A DevSecOps team is selecting security testing tools for their CI/CD pipeline. They evaluate SAST (Static Application Security Testing), DAST (Dynamic Application Security Testing), IAST (Interactive Application Security Testing), and RASP (Runtime Application Self-Protection). Which comparison of IAST and RASP is MOST accurate?',
  '["IAST and RASP are the same technology with different names for different vendor marketing purposes", "IAST instruments the application at runtime during testing to observe how data flows through the code and identify vulnerabilities from inside the running application -- it operates during the test/QA phase; RASP instruments the application at runtime in PRODUCTION to detect and block attacks as they occur in real time -- it operates as a defense control in deployed applications; both work from inside the application but serve fundamentally different phases and purposes", "IAST is a form of DAST that adds more sensors to the test framework", "RASP is a testing tool that must be removed before production deployment"]'::jsonb,
  1,
  'IAST (Interactive AST): instruments running application code with agents/sensors that observe data flow during active testing (functional tests, QA testing). Provides accurate, low false-positive findings because it observes real code execution paths. Used in test/staging environments. RASP (Runtime ASP): instruments running application code in PRODUCTION to detect and block exploits in real time. Monitors function calls, system calls, and data flows for attack patterns. Can terminate malicious requests in real time. Both technologies use instrumentation from inside the application (unlike DAST which is purely external). Key distinction: IAST = finds vulnerabilities during testing. RASP = blocks exploitation during operation. SAST = code analysis without execution. DAST = external black-box testing.',
  'IAST = test phase (find bugs). RASP = production phase (block attacks). Both use runtime instrumentation. Different lifecycle stages.',
  'analyze', 'comparison', 'hard',
  1.80, 1.40, 0.22, 'handcrafted', true
),

-- Q3: hard / apply / scenario / correct=2
(
  8, 'dependency_confusion',
  'In February 2021, a security researcher demonstrated the "dependency confusion" attack against major tech companies, gaining code execution in their build pipelines. A company''s build system uses private npm packages hosted on an internal registry with names like "company-utils" and "company-auth." What is the dependency confusion attack vector, and what is the MOST effective mitigation?',
  '["The attack uploads malicious packages to the internal registry with the same names as public npm packages", "The attack exploits the package manager''s caching system to serve stale, malicious versions of dependencies", "The attack registers the same package names (''company-utils'', ''company-auth'') in the public npm registry with a HIGHER version number than the internal versions; when the build system queries both registries, it prioritizes the higher version number from the public registry, executing the attacker''s malicious code; mitigation: configure the package manager to always prefer the internal registry for packages with the company''s namespace, use scoped packages (@company/utils), implement package integrity verification (checksums), and audit all dependencies for public registry conflicts", "The attack is a DNS poisoning attack that redirects internal registry requests to a malicious public registry"]'::jsonb,
  2,
  'Dependency confusion (also called namespace confusion): attackers discover internal package names by examining package.json files in public repos, JavaScript bundles, or error messages. They register the same names in the public registry with a version number higher than the internal version (e.g., internal=1.0.5, public malicious=9.9.9). Package managers (npm, pip, gem) that query both public and private registries may pull the higher-versioned public package. Mitigations: (1) Scoped packages (@company/package-name) -- npm treats scoped packages from specific registries, reducing confusion risk. (2) Always prioritize internal registry for known internal package namespaces. (3) Check whether any internal package names exist in public registries. (4) Use dependency pinning with hash verification.',
  'Dependency confusion: register internal package names publicly with higher version → build system pulls malicious public version. Fix: scope packages + internal registry priority.',
  'apply', 'scenario', 'hard',
  1.70, 1.50, 0.20, 'handcrafted', true
),

-- Q4: very_hard / analyze / scenario / correct=3
(
  8, 'secure_api',
  'A REST API returns the following response to an authenticated request for a user''s profile: {"user_id": 123, "name": "Alice", "email": "alice@example.com", "internal_credit_score": 750, "admin_flag": false, "password_hash": "bcrypt:$2a$10$..."}. What OWASP Top 10 2021 vulnerability is demonstrated?',
  '["A03 Injection -- the JSON response contains unsanitized user data that could be injected into downstream systems", "A01 Broken Access Control -- the API endpoint is not requiring authentication", "A07 Identification and Authentication Failures -- returning a password hash in the API response defeats the purpose of password hashing", "A03 and A02 are not applicable; the primary vulnerability is A04:2021 Insecure Design, specifically Excessive Data Exposure (OWASP API Security Top 10 API3:2023) -- the API returns sensitive fields (password_hash, internal_credit_score, admin_flag) that the client application never needs and should never receive; the fix is to implement a response DTO (Data Transfer Object) that includes only the fields the client legitimately needs, never exposing internal fields to external callers"]'::jsonb,
  3,
  'This vulnerability is OWASP API Security Top 10 API3:2023 Broken Object Property Level Authorization (formerly Excessive Data Exposure in 2019). The API serializes the entire object and sends it to the client, trusting the client to "filter" what it uses. Problems: (1) password_hash -- even bcrypt hash should never leave the server; attackers can attempt offline cracking. (2) internal_credit_score -- internal field not meant for external disclosure, privacy violation. (3) admin_flag -- disclosing privilege information helps attackers understand the trust model. Fix: design explicit response DTOs (serializers/marshallers) that include ONLY the fields the client needs -- "allowlist by design" vs. "blocklist by exception." Mapping to OWASP Top 10 2021: closest category is A04 Insecure Design and A02 Cryptographic Failures (exposing hash).',
  'Excessive data exposure = A04 insecure design + API3 broken object property. Fix: DTO/serializer with explicit allowlist. Never serialize full objects to external callers.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.00, 0.20, 'handcrafted', true
),

-- Q5: hard / apply / comparison / correct=0
(
  8, 'sast_dast',
  'A security architect compares SAST and DAST for a Java Spring Boot web application. Which assessment of their relative coverage gaps is MOST accurate?',
  '["SAST analyzes source code without execution -- it can find injection vulnerabilities, insecure code patterns, hardcoded secrets, and logic flaws but cannot detect runtime-only issues (authentication bypass requiring specific runtime state, server misconfiguration, race conditions, business logic flaws requiring valid user sessions); DAST tests the running application from outside -- it can find runtime-exploitable vulnerabilities (injection, authentication issues, misconfiguration) but is blind to source code issues not exploitable from an unauthenticated external perspective", "SAST and DAST have identical coverage; the choice between them is based only on cost", "DAST is always superior to SAST because it tests real attack scenarios against the running application", "SAST is always superior to DAST because it analyzes the full codebase rather than just exposed attack surfaces"]'::jsonb,
  0,
  'SAST (Static AST): analyzes source code, bytecode, or compiled binaries without execution. Coverage: insecure coding patterns, injection source-to-sink flows, hardcoded secrets, insecure crypto, null pointer dereferences, SQL injection (via taint analysis). Blind to: runtime-only conditions, server misconfiguration, business logic flaws requiring valid sessions, authentication state-dependent vulnerabilities. DAST: tests running application from an external perspective (like a black-box penetration test). Coverage: injection vulnerabilities exploitable from the outside, authentication failures, SSL/TLS misconfigs, server error responses. Blind to: internal code issues not exposed externally, source-code-only vulnerabilities. Industry best practice: SAST in development + DAST in staging = SHIFT LEFT + VALIDATE RIGHT.',
  'SAST = code analysis (source-to-sink, secrets, patterns). DAST = runtime external testing (injection, auth, misconfig). Each blind to the other''s coverage. Use both.',
  'apply', 'comparison', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q6: hard / analyze / tlatm / correct=1
(
  8, 'devsecops',
  'You are the AppSec lead implementing a DevSecOps pipeline for a financial services company. A developer complains that the SAST tool fails the build with 847 findings, 95% of which are known false positives. The developer threatens to disable the SAST gate entirely. What is the MOST appropriate response?',
  '["Block the developer''s request and maintain all 847 findings as active blockers because all SAST findings represent potential security risks", "Work with the developer to baseline-suppress confirmed false positives, configure the SAST tool''s finding suppression for known-benign patterns (with documented justification), and adjust the build gate to only fail on NEW findings above a defined severity threshold -- measuring security posture improvement over time rather than blocking on legacy technical debt", "Remove the SAST gate entirely and replace it with manual code review to eliminate false positives", "Reduce the SAST tool''s sensitivity to its lowest setting to eliminate all false positives"]'::jsonb,
  1,
  'SAST gates that produce overwhelming false positives create alarm fatigue and developer resistance, ultimately failing to improve security. The solution is progressive remediation: (1) Baseline suppression: review and suppress confirmed false positives with documented justification (not blind suppression). (2) Policy tuning: configure the SAST tool for the specific framework and codebase. (3) Incremental gate: fail on NEW high/critical findings introduced in the PR (delta mode), not on accumulated legacy debt. (4) Track remediation over time. This "fail on new, fix legacy over time" model is the industry-standard approach for introducing SAST into existing codebases without blocking all development. Full sensitivity reduction or removing the gate eliminates security value.',
  'SAST 95% FP problem: baseline-suppress FPs + fail on NEW findings only (delta mode). Not: disable gate or blind sensitivity reduction.',
  'analyze', 'tlatm', 'hard',
  1.70, 1.50, 0.22, 'handcrafted', true
),

-- Q7: very_hard / analyze / scenario / correct=2
(
  8, 'owasp_top10',
  'A web application uses the following PHP code to include files based on a URL parameter: require($_GET["page"] . ".php"). An attacker navigates to: app.php?page=../../../../etc/passwd%00. What vulnerability does this represent, and what is the attack being attempted?',
  '["OWASP A01 Broken Access Control -- the attacker is accessing a restricted admin page without authorization", "OWASP A02 Cryptographic Failures -- the null byte (%00) is used to decrypt the .php extension", "OWASP A05:2021 Security Misconfiguration combined with A03:2021 Injection (Path Traversal / Local File Inclusion): the ../ sequences traverse up the directory tree to reach /etc/passwd; the %00 (null byte) was used in older PHP versions to terminate the string before .php is appended, bypassing the file extension restriction", "OWASP A09 Security Logging and Monitoring Failures -- the application is not logging the suspicious parameter"]'::jsonb,
  2,
  'This is a Local File Inclusion (LFI) attack using Path Traversal. Analysis: (1) ../../../.. traverses up directory levels to the filesystem root. (2) /etc/passwd is the target (Linux user account file). (3) %00 is a URL-encoded null byte (\\x00) -- in old PHP versions (<5.3.4), the null byte truncated strings in file functions, so "../../../../etc/passwd\\x00.php" was treated as "../../../../etc/passwd" (the .php extension was stripped). Modern PHP versions are not vulnerable to null byte injection, but path traversal remains valid. OWASP A03:2021 Injection covers injection flaws including path traversal/LFI. Fix: never include files based on user input; use a whitelist of allowed page names.',
  'LFI + path traversal = A03 injection. %00 null byte = old PHP extension bypass. Fix: whitelist page names, never use user input in file includes.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.20, 'handcrafted', true
),

-- Q8: hard / apply / scenario / correct=3
(
  8, 'secure_api',
  'A developer builds a REST API where the endpoint /api/users/{user_id}/documents returns all documents for a user. The authentication middleware validates the JWT token correctly. However, a penetration tester discovers that user Alice (user_id=1001) can access documents for user Bob (user_id=1002) by changing the user_id in the URL. Which OWASP vulnerability is this?',
  '["A07 Identification and Authentication Failures -- JWT validation is not working correctly", "A05 Security Misconfiguration -- the API endpoint is not configured with proper access controls", "A03 Injection -- the user_id parameter is not properly sanitized and allows SQL injection", "A01:2021 Broken Access Control (specifically IDOR -- Insecure Direct Object Reference): the API validates that the user is authenticated (JWT is valid) but fails to verify that the authenticated user is AUTHORIZED to access the specific resource identified by user_id; the fix is to enforce object-level authorization checks -- compare the user_id in the JWT claims against the user_id in the request path and deny if they don''t match (or the user doesn''t have explicit permission to access another user''s documents)"]'::jsonb,
  3,
  'IDOR (Insecure Direct Object Reference) is the most common manifestation of OWASP A01:2021 Broken Access Control. The authentication check (JWT validation) confirms WHO the user is, but the authorization check (can THIS user access THESE documents?) is missing. Alice is authenticated as user 1001, but the API serves documents for user_id 1002 from the URL without checking if Alice has permission to access Bob''s documents. Fix: implement object-level authorization. At every resource access endpoint, verify the requesting user''s identity against the resource owner. This is also OWASP API Security Top 10 API1:2023 (Broken Object Level Authorization). This is the #1 most prevalent API vulnerability.',
  'IDOR = authenticated but not authorized for specific object. Fix: compare JWT user_id == path user_id at every endpoint. Authentication ≠ authorization.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q9: hard / apply / tlatm / correct=0
(
  8, 'devsecops',
  'A DevSecOps team is designing security gates for their CI/CD pipeline. They want to prevent secrets (API keys, passwords, certificates) from being committed to the source code repository. At which pipeline stage is prevention MOST effective, and why?',
  '["Pre-commit hooks (developer workstation) using tools like git-secrets, TruffleHog, or detect-secrets -- prevention at the developer''s machine before the commit reaches the repository provides the earliest possible intervention; a secret that never enters the repository history requires no cleanup and creates no risk window, whereas detection in CI after push requires secret rotation and history rewrite even if caught immediately", "SAST scanning in the CI build stage because it provides centralized, consistent analysis", "Repository scanning after every push because it provides comprehensive analysis of all committed code", "Production monitoring because secrets that reach production are the most critical to detect"]'::jsonb,
  0,
  'The principle of shifting security left applies maximally to secret detection. Pre-commit hooks: (1) Run on the developer''s machine BEFORE the commit is made, (2) Can prevent the secret from ever entering the repository history, (3) If a secret is caught at pre-commit, NO rotation, NO history rewrite, NO incident. (4) Tools: git-secrets, detect-secrets, TruffleHog, Gitleaks, GitHub''s secret scanning. If a secret reaches the repository -- even for a second -- it must be assumed compromised (especially for public repos, which are constantly scanned by automated tools). Repository-level scanning catches secrets that bypassed pre-commit hooks. Production monitoring is the last resort, not the primary prevention.',
  'Secret detection: pre-commit = EARLIEST prevention. Secret never enters repo = no rotation needed. Shift left maximal: developer workstation.',
  'apply', 'tlatm', 'hard',
  1.80, 1.40, 0.20, 'handcrafted', true
),

-- Q10: very_hard / analyze / comparison / correct=1
(
  8, 'dependency_confusion',
  'A security team is reviewing the software supply chain risk from open-source dependencies. They compare two threat scenarios: (A) A malicious package is published to the public npm registry with a popular package name. (B) A legitimate open-source package is compromised after the original maintainer''s account is hijacked. Which comparison of these threat scenarios is MOST accurate?',
  '["Scenario A (typosquatting) is more dangerous because it affects more organizations simultaneously", "Scenario B (account takeover of a legitimate maintainer) is more dangerous because the malicious code is delivered through the trusted, legitimate package -- existing installations receive the malicious update through their normal update workflow without any warning; Scenario A (typosquatting) requires a developer error (installing the wrong package name) which can be caught with code review or automated tools", "Both scenarios have identical risk profiles because both result in malicious code being executed in the build pipeline", "Scenario A is more likely to occur because npm account security is stronger than package name monitoring"]'::jsonb,
  1,
  'Scenario B (maintainer account compromise/package hijacking) is a higher-impact threat because: (1) The malicious package is delivered through the TRUSTED, LEGITIMATE package -- existing users automatically receive the update. (2) No developer error is required -- the developer did nothing wrong by using the legitimate package. (3) The package has an established reputation and user base. (4) Automated update tools (Dependabot, Renovate) will AUTOMATICALLY update to the malicious version. Examples: event-stream (2018, 2M downloads/week), ua-parser-js (2021). Scenario A (typosquatting) requires a developer to install the wrong package name, which code review, package manager audits, and lockfiles can catch. Both require defense-in-depth responses.',
  'Maintainer hijack > typosquatting. Hijack = trusted package delivers malware to EXISTING users automatically. No developer error needed. Highest supply chain risk.',
  'analyze', 'comparison', 'very_hard',
  1.90, 2.10, 0.22, 'handcrafted', true
),

-- Q11: hard / apply / scenario / correct=2
(
  8, 'owasp_top10',
  'A web application stores session tokens in cookies with the following attributes: Set-Cookie: sessionId=abc123; Path=/; HttpOnly=false; Secure=false; SameSite=None. A security tester reports multiple critical issues with this configuration. Which OWASP category covers ALL of the issues identified, and what are they?',
  '["A09 Security Logging -- cookies without secure flag are not properly logged for audit purposes", "A02 Cryptographic Failures -- using a cookie without HTTPS encryption violates cryptographic requirements", "A05:2021 Security Misconfiguration: (1) Secure=false allows the cookie to be transmitted over HTTP, exposing the session token to network eavesdropping; (2) HttpOnly=false allows JavaScript to access the cookie (XSS can steal the session token); (3) SameSite=None without Secure enables CSRF attacks from any origin; all three are cookie security misconfiguration issues that together create session hijacking risk", "A07 Identification and Authentication Failures -- the session token appears guessable (abc123)"]'::jsonb,
  2,
  'Cookie security attributes are security configuration settings. Missing/incorrect attributes: (1) Secure=false: cookie transmitted over HTTP (unencrypted) -- network sniffing captures session tokens. HTTPS is required for session cookies. (2) HttpOnly=false: JavaScript can read document.cookie -- XSS attacks steal session tokens. HttpOnly prevents JavaScript access. (3) SameSite=None: browser sends cookie with all cross-origin requests -- enables CSRF. SameSite=Strict (same origin only) or SameSite=Lax (same origin + safe cross-origin navigation) prevents CSRF. Combined, these three missing attributes create session hijacking via network sniff, XSS session theft, and CSRF. This is A05:2021 Security Misconfiguration.',
  'Cookie security: Secure=HTTPS only. HttpOnly=no JS access (anti-XSS). SameSite=Strict/Lax (anti-CSRF). Missing all three = A05 Security Misconfiguration.',
  'apply', 'scenario', 'hard',
  1.70, 1.60, 0.20, 'handcrafted', true
),

-- Q12: very_hard / analyze / scenario / correct=3
(
  8, 'secure_api',
  'A microservices architecture has 50 internal services communicating via REST APIs. Service-to-service calls are currently unauthenticated because "they''re all on the same internal network." A security architect wants to implement mutual authentication. Which approach is MOST aligned with zero-trust principles for service-to-service authentication?',
  '["IP allowlisting between service IP ranges is sufficient for internal service authentication because IP addresses are controlled in the cluster", "API keys stored in environment variables on each service provide adequate authentication for service-to-service calls", "mTLS (mutual TLS) with static certificates manually distributed to each service provides the strongest authentication", "Service mesh with mTLS using SPIFFE/SVID (Spiffe Verifiable Identity Document) workload identities: each service receives a cryptographic identity (X.509 SVID) from a SPIFFE-compatible identity provider (e.g., SPIRE), mTLS is enforced between all service pairs, certificates are short-lived and automatically rotated, and the identity is bound to the workload (not the IP address) -- enabling zero-trust service-to-service authentication that remains valid as IPs change in dynamic container environments"]'::jsonb,
  3,
  'SPIFFE (Secure Production Identity Framework for Everyone) and SPIRE (SPIFFE Runtime Environment) provide workload identity for service-to-service authentication. SPIFFE/SVID: each service receives an X.509 certificate with a SPIFFE URI identity (spiffe://trust-domain/service-name). mTLS between services is automated by the service mesh (Istio, Linkerd). Benefits: (1) Workload identity (not IP-based) -- valid as pods reschedule in Kubernetes. (2) Short-lived certificates (1-24h) with automatic rotation -- no long-lived shared secrets. (3) Centralized policy (service A can call service B but not C). IP allowlists break when pods reschedule. API keys in env vars are long-lived, easily exfiltrated, and not workload-bound. Static mTLS certs require manual rotation and don''t scale to 50 services.',
  'Service-to-service zero trust = SPIFFE/SVID + service mesh mTLS. Workload identity (not IP). Short-lived certs. Auto-rotate. Scales to 50 services.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.30, 0.20, 'handcrafted', true
),

-- Q13: hard / apply / best_answer / correct=0
(
  8, 'devsecops',
  'A DevSecOps team wants to implement Software Composition Analysis (SCA) to detect vulnerable open-source dependencies. A developer argues that SCA tools produce too many findings and suggests running SCA only on "critical" repositories. What is the MOST important counter-argument?',
  '["Vulnerable dependencies in any repository -- including internal tools, CI/CD systems, and non-critical services -- can be exploited as supply chain attack vectors (e.g., compromising the build pipeline affects all applications built by it); SCA must be applied to ALL repositories with consistent severity-based SLA policies", "SCA should be run only on customer-facing applications because only those create regulatory and reputational risk", "SCA findings are all false positives because open-source maintainers quickly patch known vulnerabilities", "SCA in ''non-critical'' repositories is low priority because attackers focus on external-facing systems"]'::jsonb,
  0,
  'SCA scope limitation to "critical" repos misses high-impact attack vectors: (1) CI/CD pipeline tools and scripts: a vulnerable npm package in a build tool can compromise every application built in the pipeline (SolarWinds-style attack). (2) Internal admin tools: attackers who compromise internal tools get lateral movement paths. (3) Libraries shared across applications: a vulnerability in an internal shared library may be LOW severity alone but becomes HIGH in the context of what it''s called by. (4) Developer workstations: developer tools with vulnerable dependencies enable supply chain compromise. Supply chain attacks specifically target the weakest, least-monitored points in the software supply chain. Universal SCA with risk-based SLAs (not blanket exemption by criticality) is the correct approach.',
  'SCA everywhere = supply chain defense. CI/CD tools with vulnerable deps = pipeline compromise = affect ALL apps. No "non-critical" repos for SCA.',
  'apply', 'best_answer', 'hard',
  1.60, 1.20, 0.20, 'handcrafted', true
),

-- Q14: hard / analyze / first_action / correct=1
(
  8, 'owasp_top10',
  'A security researcher responsibly discloses an XML External Entity (XXE) vulnerability in a company''s API. The vulnerable endpoint processes XML with an external entity declaration: <!DOCTYPE foo [<!ENTITY xxe SYSTEM "file:///etc/passwd">]>. What is the FIRST priority fix for the development team?',
  '["Deploy a WAF rule to block requests containing DOCTYPE declarations as the primary fix", "Disable XML external entity processing in the XML parser configuration (e.g., setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true) in Java, disable_entity_loader in PHP, or use defusedxml in Python) -- this is the definitive fix that prevents the parser from resolving external entities; WAF rules are a compensating control, not a substitute for fixing the underlying parser configuration", "Sanitize the XML input by removing DOCTYPE and ENTITY strings with a regex filter before parsing", "Upgrade the XML parser library to the latest version to benefit from security patches"]'::jsonb,
  1,
  'XXE (XML External Entity) injection -- OWASP A03:2021 (Injection). The root cause is an XML parser configured to process external entity declarations. Fix: disable external entity processing at the parser level. Language-specific implementations: Java (DocumentBuilderFactory.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true)), PHP (libxml_disable_entity_loader(true) for older PHP, blocked by default in PHP 8.0+), Python (use defusedxml library), .NET (XmlReaderSettings.DtdProcessing = DtdProcessing.Prohibit). WAF rules are a compensating control that can be bypassed by encoding/obfuscation. Regex filters on XML are notoriously incomplete (XML has many ways to express the same structure). Parser library updates help but the configuration fix is the definitive solution.',
  'XXE fix = disable external entity processing in the parser (parser config). WAF = compensating control only. Regex filter = bypassable. Fix the parser first.',
  'apply', 'first_action', 'hard',
  1.80, 1.60, 0.22, 'handcrafted', true
),

-- Q15: very_hard / analyze / scenario / correct=2
(
  8, 'sast_dast',
  'A financial application''s SAST tool reports a finding: "SQL Injection possible via user input parameter ''account_id'' in AccountController.java line 145: String query = ''SELECT * FROM accounts WHERE id = '' + accountId". The developer responds that the finding is a false positive because "the account_id comes from an integer field in the UI and can only be a number." What is the MOST appropriate security assessment of this response?',
  '["The developer is correct -- integer UI fields cannot contain SQL injection characters, so the SAST finding is definitively a false positive", "The developer is partially correct -- the integer constraint is a valid mitigation and the finding can be marked as accepted risk with documentation", "The developer''s defense is insufficient: UI-side input restrictions (integer fields, HTML maxlength, JavaScript validation) can be bypassed by directly crafting HTTP requests with any content in the parameter (using Burp Suite, curl, or any HTTP client); the SAST finding is valid and the fix is to use parameterized queries or prepared statements at the database layer regardless of UI constraints -- server-side input validation and parameterized queries are required, UI validation is not a security control", "The developer should run DAST to confirm whether the injection is actually exploitable before deciding whether to fix it"]'::jsonb,
  2,
  'Client-side input restrictions (integer fields, HTML5 input type=number, JavaScript validators, UI maxlength) are cosmetic controls that can be bypassed with trivially: direct HTTP request crafting with tools like curl, Burp Suite, Postman, or any scripting language. An attacker never uses the UI -- they send raw HTTP requests with any payload. The server cannot trust any client-provided data. The correct fix for SQL injection is ALWAYS parameterized queries (PreparedStatement in Java, parameterized queries in other ORMs) or stored procedures. This is the definitive fix that makes SQL injection impossible regardless of input content. The SAST finding is a TRUE POSITIVE.',
  'UI integer field = bypassable. Send HTTP request directly with SQL injection payload. Client-side validation ≠ security control. Fix: parameterized queries ALWAYS.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.10, 0.20, 'handcrafted', true
),

-- Q16: hard / apply / scenario / correct=3
(
  8, 'secure_api',
  'A REST API implements rate limiting at 100 requests per minute per IP address. A penetration tester bypasses this control and achieves unlimited requests. Which bypass technique is MOST likely being used?',
  '["The tester is using a VPN to change their IP address between requests", "The tester is exploiting a vulnerability in the rate limiting middleware''s algorithm", "The tester is sending requests with invalid IP addresses in the source header to confuse the rate limiting system", "The tester is adding IP-spoofing headers (X-Forwarded-For, X-Real-IP, X-Client-IP) to the requests; if the API uses these headers to determine the ''client IP'' for rate limiting rather than the actual TCP source IP, the attacker can set any value in these headers and effectively have unlimited unique IPs for rate limiting purposes"]'::jsonb,
  3,
  'IP-based rate limiting that trusts X-Forwarded-For or X-Real-IP headers is trivially bypassed: the attacker adds "X-Forwarded-For: 1.2.3.4" to each request, incrementing the IP for each request. The rate limiter sees a different IP address per request and applies no limit. These headers are intended for reverse proxy/load balancer infrastructure (where the load balancer sets the real client IP). Applications should: (1) Only trust these headers from known/trusted reverse proxy IP ranges (not from all clients). (2) Rate limit based on authenticated user identity (for authenticated endpoints) rather than IP alone. (3) For unauthenticated endpoints, use the actual TCP source IP as the basis for rate limiting.',
  'Rate limit bypass = X-Forwarded-For header injection. App trusts header for client IP → attacker sets arbitrary IPs → bypass. Fix: trust only reverse proxy headers, rate limit by user ID.',
  'apply', 'scenario', 'hard',
  1.70, 1.70, 0.20, 'handcrafted', true
),

-- Q17: hard / analyze / comparison / correct=0
(
  8, 'devsecops',
  'A DevSecOps team is establishing a vulnerability remediation SLA based on severity. Management asks why CVSS base score alone is insufficient for SLA prioritization in a software development context. Which explanation is MOST accurate?',
  '["CVSS base score does not account for whether a vulnerability is reachable in the specific deployment context (exploitability depends on how the vulnerable library function is called, not just whether it exists), whether a public exploit exists (EPSS), the business criticality of the affected service, or the difficulty of exploitation in the specific deployment -- a CVSS 9.8 vulnerability in an unused code path with no public exploit may be lower priority than a CVSS 7.5 vulnerability with active public exploitation in a customer-facing authentication service", "CVSS base scores are always accurate and sufficient for prioritization -- higher scores should always be fixed first", "CVSS scores frequently change after initial publication, making them unreliable for SLA commitment", "CVSS base scores are calculated by the vendor and may understate risk for open-source software"]'::jsonb,
  0,
  'CVSS base score measures the theoretical severity of a vulnerability in isolation, not the actual risk in a specific deployment. Four factors CVSS base score misses: (1) Reachability: is the vulnerable code path called in this application? (A buffer overflow in a function never called = no risk). (2) Exploitability: is there a public, weaponized exploit? (EPSS). (3) Asset criticality: is this a customer-facing payment service or an internal batch job? (4) Compensating controls: WAF, network segmentation, or runtime protections may reduce exploitability. Modern SCA tools incorporate exploit intelligence (EPSS, known exploited vulnerabilities list from CISA KEV) into their severity scoring. "Fix by CVSS score alone" wastes remediation effort on theoretical risks while real exploitation goes unaddressed.',
  'CVSS alone = theoretical severity. SLA should = CVSS × reachability × exploitability (EPSS/KEV) × asset criticality. Context changes priority.',
  'analyze', 'comparison', 'hard',
  1.60, 1.40, 0.22, 'handcrafted', true
),

-- Q18: very_hard / analyze / scenario / correct=1
(
  8, 'owasp_top10',
  'A developer implements server-side request forgery (SSRF) protection by checking that the URL entered by a user does not contain "169.254.169.254" (AWS metadata endpoint) before making the HTTP request. A security researcher bypasses this check. Which bypass technique is MOST likely?',
  '["The researcher accessed the metadata API by sending requests directly without using the SSRF vulnerability", "The researcher used alternative representations of the metadata IP: decimal (2852039166), hexadecimal (0xa9fea9fe), octal (025177024776), or an IPv6 representation (::ffff:169.254.169.254), or used a DNS name that resolves to 169.254.169.254 -- all of these bypass string-matching checks while resolving to the same destination", "The researcher found a different internal endpoint more valuable than the metadata service", "The researcher exploited an error in the SSL certificate validation that allowed SSRF through HTTPS"]'::jsonb,
  1,
  'SSRF protection that uses string matching against known IP addresses is bypassed by equivalent representations: (1) Decimal: 169.254.169.254 = 2852039166 in 32-bit integer notation (most HTTP libraries accept this). (2) Hexadecimal: 0xa9fea9fe. (3) Octal: 0251.0376.0251.0376. (4) IPv6: ::ffff:169.254.169.254 or ::ffff:a9fe:a9fe. (5) DNS redirect: attacker controls a DNS record that resolves to 169.254.169.254 (DNS rebinding risk). Fix: SSRF protection must resolve the URL to its final IP address before checking (not just parse the URL string), then check the resolved IP against a blocklist of private/link-local ranges (RFC 1918, 169.254.0.0/16, ::1, etc.). This is OWASP A10:2021 Server-Side Request Forgery (SSRF).',
  'SSRF IP bypass = alternative representations (decimal/hex/octal/IPv6) or DNS rebinding. Fix: resolve URL to IP first, THEN check against blocked ranges.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.20, 0.22, 'handcrafted', true
),

-- Q19: hard / apply / scenario / correct=2
(
  8, 'dependency_confusion',
  'A software supply chain security audit discovers that a company''s production container image contains the following in its npm package-lock.json: "company-internal-utils": {"version": "9.9.9", "resolved": "https://registry.npmjs.org/company-internal-utils/-/9.9.9.tgz"}. The internal version of this package is 1.2.3 and is only hosted on the internal registry. What has occurred?',
  '["The development team published the internal package to the public registry for easier distribution", "The package.json was misconfigured with the wrong version number, causing npm to find the public registry version", "A dependency confusion attack has succeeded: an attacker registered ''company-internal-utils'' on the public npm registry with a higher version number (9.9.9 > 1.2.3) and the build system pulled from the public registry instead of the internal registry; the resolved URL (registry.npmjs.org) confirms the package was downloaded from the public registry, not the internal one -- immediate incident response is required: treat the package as malicious, investigate all systems that ran this code, rotate credentials, and perform forensic analysis of the package contents", "The npm package manager upgraded the internal package to the latest version as part of automatic dependency management"]'::jsonb,
  2,
  'The resolved URL "registry.npmjs.org" is the definitive indicator: the internal package was downloaded from the PUBLIC npm registry, not the internal one. The version number 9.9.9 (far higher than the internal 1.2.3) confirms this is a dependency confusion attack. This is a security incident. Incident response: (1) Immediately analyze the package contents at 9.9.9 on npm -- has it already been removed by npm? (2) Treat any system that ran code containing this package as potentially compromised (malicious packages often include credential harvesters, reverse shells). (3) Rotate credentials, API keys, and secrets accessible from the compromised build environment. (4) Review all build artifacts from the affected pipeline for compromise.',
  'resolved=registry.npmjs.org + higher version = dependency confusion CONFIRMED. Treat as incident. Rotate secrets. Analyze build artifacts. Forensic investigation immediately.',
  'apply', 'scenario', 'hard',
  1.80, 1.80, 0.20, 'handcrafted', true
),

-- Q20: very_hard / analyze / scenario / correct=3
(
  8, 'secure_api',
  'A REST API that manages financial transactions accepts a JSON payload with the field "amount" as a string: {"transaction_id": "tx001", "amount": "100.00", "currency": "USD"}. The server-side code parses the amount with parseFloat(). A security researcher submits: {"amount": "1e308"}. What vulnerability does this represent?',
  '["OWASP A03 Injection -- the scientific notation is an injection attack against the number parsing function", "OWASP A01 Broken Access Control -- the researcher accessed an endpoint they should not have", "OWASP A05 Security Misconfiguration -- the server is not validating the Content-Type header", "OWASP A04:2021 Insecure Design: insufficient input validation for financial data. parseFloat(''1e308'') = Infinity (IEEE 754 floating point overflow); if the application processes this without validation, it may store Infinity in the database (as NULL or a very large number), triggering arithmetic errors in transaction processing, potentially allowing a user to make a payment of ''Infinity'' dollars; financial applications MUST validate monetary amounts with strict type checking, range validation, and use fixed-point arithmetic (not floating-point) to prevent precision and overflow issues"]'::jsonb,
  3,
  'Financial application input validation failure: (1) parseFloat("1e308") evaluates to Infinity in JavaScript/many languages because 1e308 exceeds IEEE 754 double precision maximum (~1.8e308). (2) Infinity stored in a database column may become NULL, a very large integer, or trigger arithmetic exceptions. (3) "Infinity" multiplied by any exchange rate or tax rate = Infinity, potentially bypassing fraud controls. (4) Financial applications must: accept amount as a string, validate against a strict numeric regex (no scientific notation), parse with a library that enforces max precision and range, use fixed-point or decimal types (not float) for monetary values. This is an A04 Insecure Design issue -- the design assumes only reasonable amounts will be submitted.',
  'parseFloat(1e308) = Infinity. Financial data = NEVER float, use fixed-point decimal. Validate: no scientific notation, max value, explicit decimal format.',
  'analyze', 'scenario', 'very_hard',
  1.90, 2.40, 0.20, 'handcrafted', true
),

-- Q21: hard / apply / best_answer / correct=0
(
  8, 'sast_dast',
  'A security team wants to add DAST scanning to their CI/CD pipeline. The application requires authentication and has multi-step workflows (e.g., login → select account → initiate transfer → confirm). Which DAST approach is MOST effective for full coverage of these authenticated workflows?',
  '["Authenticated DAST with a recorded login sequence (Selenium/Playwright script) and crawl configuration that teaches the scanner how to authenticate and navigate multi-step workflows -- providing the scanner with valid session credentials and workflow scripts enables it to reach and test protected pages and multi-step forms that unauthenticated scanning cannot access", "Unauthenticated DAST is sufficient because most critical vulnerabilities are in pre-authentication pages", "Run DAST only on the login page and registration flow because authenticated sections are implicitly trusted", "Schedule DAST after business hours to avoid impacting real users -- this solves the authentication challenge by allowing the scanner to create and use real user accounts"]'::jsonb,
  0,
  'Standard DAST tools scan from an unauthenticated external perspective, missing all protected application functionality. Modern DAST solutions support authenticated scanning through: (1) Selenium/Playwright login automation scripts that perform the authentication flow programmatically. (2) Providing the scanner with valid session cookies or JWT tokens. (3) Workflow scripts for multi-step forms that teach the scanner how to navigate complex transaction flows. Without authenticated scanning, DAST completely misses: IDOR vulnerabilities, privilege escalation, business logic flaws in transaction workflows, insecure direct object references, and authorization bypass. For a financial application with multi-step transfers, authenticated scanning is essential. After-hours scheduling is an operational concern, not an authentication solution.',
  'DAST for authenticated app = Selenium/Playwright login scripts + session credentials. Unauthenticated DAST = misses 80% of the application.',
  'apply', 'best_answer', 'hard',
  1.60, 1.30, 0.20, 'handcrafted', true
),

-- Q22: hard / analyze / first_action / correct=1
(
  8, 'devsecops',
  'A security team implements a DevSecOps pipeline with SCA checks. The SCA tool alerts that a production application depends on log4j version 2.14.1 (vulnerable to Log4Shell, CVE-2021-44228, CVSS 10.0). The patch (2.17.1) is available. The development team says patching requires a 2-week testing cycle. What is the MOST appropriate FIRST action?',
  '["Accept the risk and wait for the normal 2-week testing cycle because rushing patches creates stability risks", "Immediately apply the available mitigations (set log4j2.formatMsgNoLookups=true JVM property, or remove the JndiLookup class from the classpath) as a short-term compensating control while expediting the patch testing cycle -- CVSS 10.0 actively exploited vulnerabilities cannot wait 2 weeks without compensating controls in place", "Block all internet traffic to the affected application until the patch is available", "Shut down the application immediately until the patch can be deployed"]'::jsonb,
  1,
  'Log4Shell (CVE-2021-44228) was a CVSS 10.0 critical vulnerability with active mass exploitation within hours of disclosure. For CVSS 10.0 actively exploited vulnerabilities, the 2-week testing cycle is unacceptable without compensating controls. Immediate mitigations (vendor-recommended while patching): (1) For Log4j 2.10-2.14.1: set system property -Dlog4j2.formatMsgNoLookups=true (disables JNDI lookup processing). (2) Remove the JndiLookup class from the classpath (zip -q -d log4j-core-*.jar org/apache/logging/log4j/core/lookup/JndiLookup.class). These mitigations are low-risk (they disable a specific feature). Full application shutdown is disproportionate. Waiting without mitigations is negligent for CVSS 10.0 actively exploited.',
  'Log4Shell CVSS 10.0 + active exploitation = immediate mitigations NOW. formatMsgNoLookups=true OR remove JndiLookup.class. Then expedite patch. Cannot wait 2 weeks.',
  'apply', 'first_action', 'hard',
  1.80, 1.70, 0.22, 'handcrafted', true
),

-- Q23: very_hard / analyze / tlatm / correct=2
(
  8, 'owasp_top10',
  'You are the AppSec architect for a healthcare application. A developer proposes storing patient diagnostic images in an AWS S3 bucket, with S3 URLs embedded in the application database. The S3 URLs are pre-signed URLs with a 24-hour expiry. An auditor flags this as an OWASP A01 Broken Access Control finding. Is the auditor correct, and why?',
  '["The auditor is incorrect; pre-signed URLs provide adequate access control because they expire after 24 hours", "The auditor is incorrect; S3 pre-signed URLs are cryptographically signed and cannot be guessed or forged, providing strong access control", "The auditor is correct: while pre-signed URLs are cryptographically protected, the 24-hour expiry means a URL can be shared, forwarded, or stolen and used by anyone with the URL during that window; for PHI (Protected Health Information) in a healthcare application, access must be bound to authenticated user identity and authorization context at access time -- not pre-authorized for 24-hour generic access; a better design uses server-side proxy access where the application validates the user''s current authorization, then generates a short-lived (minutes) pre-signed URL or streams the content through the application tier", "The auditor is correct because S3 is not HIPAA-compliant regardless of configuration"]'::jsonb,
  2,
  'Pre-signed URLs provide URL-based authorization without identity verification at access time. Issues for PHI: (1) 24-hour window: a doctor views an image, shares the URL with a non-authorized person (accidentally or otherwise) -- that person has 24 hours of access. (2) URL in browser history, proxy logs, server logs -- persistent URL = persistent access vector. (3) A revoked user can still access images until all their pre-signed URLs expire. (4) HIPAA minimum necessary standard requires access controls bound to user identity. Better design: application-layer proxy -- user authenticates, application validates authorization at access time, generates a 5-minute pre-signed URL for that specific session. This binds access to authenticated identity, not URL possession.',
  'Pre-signed URL = URL possession = access. Not bound to user identity. PHI access must be identity-checked at access time. Use server proxy + short-lived URLs.',
  'analyze', 'tlatm', 'very_hard',
  1.90, 2.30, 0.22, 'handcrafted', true
),

-- Q24: hard / apply / scenario / correct=3
(
  8, 'secure_api',
  'A developer builds a GraphQL API that allows clients to specify which fields to return. The API does not limit query complexity or depth. A security researcher submits a deeply nested query that causes the server to perform O(n^k) database operations, taking the server offline. Which vulnerability does this represent?',
  '["OWASP A09 Security Logging -- the server did not log the malicious query before execution", "OWASP A03 Injection -- the nested query is a form of NoSQL injection against the GraphQL engine", "OWASP A01 Broken Access Control -- the attacker should not be able to specify query structure", "OWASP A04:2021 Insecure Design combined with A05 Security Misconfiguration: this is a GraphQL Denial of Service via unbounded query depth/complexity -- without depth limiting, complexity limiting, and query cost analysis, malicious nested queries create exponential server load; mitigations include: maximum query depth limit (e.g., 10 levels), query complexity scoring (each field has a cost, queries over a threshold are rejected), query cost analysis before execution, and field-level rate limiting"]'::jsonb,
  3,
  'GraphQL-specific security issues are covered in OWASP API Security Top 10. Deeply nested queries (also called "batching attacks" or "alias abuse" in GraphQL) cause exponential database joins. Example: querying friends.friends.friends.friends.friends for a social graph causes 5-level relationship traversal. Mitigations: (1) Depth limiting: reject queries with nesting depth > N (e.g., 10). (2) Query complexity analysis: each field has a cost, reject queries exceeding a total cost threshold. (3) Query cost analysis before execution (not after -- too late). (4) Persistent queries / query whitelisting in production. (5) Per-IP and per-user rate limiting. OWASP API5:2023 Broken Function Level Authorization and API4:2023 Unrestricted Resource Consumption cover this in the API security context.',
  'GraphQL nested query DoS = unbounded complexity/depth. Fix: depth limit + complexity scoring + cost analysis before execution. OWASP A04/A05 Insecure Design.',
  'apply', 'scenario', 'hard',
  1.70, 1.80, 0.20, 'handcrafted', true
),

-- Q25: very_hard / analyze / scenario / correct=0
(
  8, 'devsecops',
  'A DevSecOps team implements a secure CI/CD pipeline with the following security gates: (1) Pre-commit hooks (secrets detection), (2) SAST in PR build, (3) SCA in PR build, (4) Container image scanning on merge, (5) DAST in staging. A sophisticated supply chain attacker compromises the build server''s tool cache (the attacker modifies a cached version of a build tool used by the pipeline). Which gate does NOT catch this attack, and what additional control is needed?',
  '["None of the five gates detect modification of the build tool itself -- all five gates assume the build toolchain is trustworthy; the additional control is build environment integrity verification: use signed build tools verified against a known-good hash at pipeline startup, pin tool versions with checksums in the pipeline configuration (e.g., package.json lockfiles, pip --hash), monitor the build environment for unexpected changes, and implement reproducible builds that can detect tampering by comparing build outputs", "Gate 4 (container image scanning) would detect modified build tools because it scans the final image", "Gate 2 (SAST) would detect the compromise because it analyzes the pipeline configuration files", "Gate 5 (DAST) would detect the attack by testing the output application for behavioral changes"]'::jsonb,
  0,
  'This attack (analogous to the SolarWinds build system compromise) targets the build toolchain itself -- the compiler, test runner, or build tool is modified to inject malicious code into build outputs. All five listed security gates test CODE or the APPLICATION OUTPUT but assume the BUILD TOOLS are trustworthy. Mitigations for build tool integrity: (1) Version pinning with cryptographic checksums (npm --ignore-scripts + lockfile hashes, pip hash, etc.). (2) Signed tool downloads from trusted sources only. (3) Immutable build environments: fresh container per build (no persistent tool cache that can be poisoned). (4) Reproducible builds: deterministic build process; compare outputs from multiple independent builds. (5) Supply chain security frameworks: SLSA (Supply-chain Levels for Software Artifacts) provides requirements for build integrity attestation.',
  'Build tool cache compromise bypasses ALL application security gates. Toolchain = trusted baseline. Fix: pin tool versions with hashes + immutable build environments + SLSA.',
  'analyze', 'scenario', 'very_hard',
  2.00, 2.50, 0.20, 'handcrafted', true
);

-- =====================================================================
-- DISTRIBUTION SUMMARY
-- =====================================================================
-- Difficulty: hard=15, very_hard=10  (Total: 25)
-- Cognitive:  apply=13, analyze=12   (Total: 25)
-- Type:       scenario=12, comparison=4, tlatm=3, best_answer=3, first_action=3
-- Correct:    0=7, 1=6, 2=6, 3=6
-- IRT b range: 1.20 - 2.50
-- =====================================================================
