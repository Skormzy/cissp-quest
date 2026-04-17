-- =============================================================================
-- CISSP Quest -- Library Topics: Domain 6 (Security Assessment and Testing)
-- Topics: 6.2.1 through 6.6.1
-- Source basis: ISC2 CBK, NIST SP 800-115 (penetration testing),
--               CVSS v3.1 specification, CVE/NVD, OWASP Testing Guide,
--               NIST SP 800-92 (log management), and public-domain knowledge.
-- Generated: 2026-04-16
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 6.2.1 Vulnerability Assessment vs Penetration Testing
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  6,
  '6.2.1',
  'Vulnerability Assessment vs Penetration Testing',
  'Vulnerability assessments identify and rank potential weaknesses without exploiting them; penetration tests actively exploit vulnerabilities to demonstrate real-world attack paths — both require authorization, but only penetration testing proves whether a vulnerability is actually exploitable in context.',
  '## Vulnerability Assessment vs Penetration Testing

Security testing is not a monolithic activity — it encompasses a spectrum of assessment types with different objectives, methodologies, and outputs. Two of the most commonly confused types are vulnerability assessments and penetration tests. Understanding their differences is essential for selecting the right tool for a security question and for interpreting the results correctly.

### Vulnerability Assessment

A **vulnerability assessment** is a systematic examination of systems and networks to identify, classify, and prioritize security weaknesses — without exploiting them. The goal is a comprehensive inventory of known vulnerabilities with risk rankings, not proof that they can be exploited. Vulnerability assessments use automated scanning tools (Tenable Nessus, Qualys, Rapid7 InsightVM, OpenVAS) to interrogate systems, identify unpatched software versions, check for known misconfigurations, and compare findings against vulnerability databases (CVE/NVD).

Key characteristics: broad in scope (scans many systems), automated at the discovery layer, produces a list of potential vulnerabilities, does not verify exploitability, and does not typically require deep expert analysis for execution (though expert analysis is needed for prioritization and remediation planning). Vulnerability assessments are typically run frequently (weekly or monthly) as part of continuous vulnerability management programs.

The output of a vulnerability assessment is a prioritized list of findings with CVSS scores and recommended remediation. It answers "what vulnerabilities exist?" but not "can an attacker actually exploit this to achieve impact?"

### Penetration Testing

A **penetration test** (pen test) is an authorized simulated attack on a system or network that attempts to exploit vulnerabilities to determine what an attacker could realistically achieve. Penetration testing answers "can this vulnerability actually be exploited, and what damage could result?" The distinction is critical: a scanner might identify a buffer overflow in an application, but a penetration test would attempt to actually exploit that vulnerability and determine whether it yields remote code execution, privilege escalation, or access to sensitive data.

Per NIST SP 800-115 (Technical Guide to Information Security Testing and Assessment), penetration testing is active, not passive — testers attempt to compromise systems using techniques a real attacker would use. Penetration testing is typically less frequent than vulnerability scanning (annually or for specific high-risk events), more expensive (requires skilled human testers), and produces a narrative report demonstrating actual attack paths, not just potential vulnerabilities.

**Critical requirement**: Written authorization. Penetration testing on systems you do not own or without written authorization from the system owner is illegal under the Computer Fraud and Abuse Act (CFAA) and equivalent laws in other jurisdictions. Authorization documentation must specify scope, timing, authorized techniques, and escalation contacts.

### CVSS: Common Vulnerability Scoring System

CVSS (Common Vulnerability Scoring System, currently v3.1) provides a standardized method for scoring the severity of security vulnerabilities. CVSS scores range from 0 to 10 and are calculated from multiple metrics:

**Base Score metrics include**:
- Attack Vector (Network/Adjacent/Local/Physical): Network-based vulnerabilities score higher
- Attack Complexity (Low/High): Low complexity scores higher
- Privileges Required (None/Low/High): None required scores higher
- User Interaction (None/Required): None required scores higher
- Scope (Changed/Unchanged): Changed scope (can affect other components) scores higher
- Confidentiality, Integrity, Availability Impact (None/Low/High)

CVSS scores are categorized: 0.0=None, 0.1-3.9=Low, 4.0-6.9=Medium, 7.0-8.9=High, 9.0-10.0=Critical. CVE (Common Vulnerabilities and Exposures) is the identification system for individual vulnerabilities; NVD (National Vulnerability Database, NIST) enriches CVE records with CVSS scores and additional metadata.',
  '[{"formula":"CVSS Base Score = f(AV, AC, PR, UI, S, C, I, A)","description":"CVSS v3.1 Base Score calculated from Attack Vector, Attack Complexity, Privileges Required, User Interaction, Scope, and CIA Impact metrics — result ranges from 0-10"}]'::jsonb,
  '{"headers": ["Dimension", "Vulnerability Assessment", "Penetration Testing"], "rows": [["Goal", "Identify and rank potential weaknesses", "Prove exploitability and demonstrate attack paths"], ["Methodology", "Automated scanning + analysis", "Manual exploitation attempts (with automation support)"], ["Exploitation", "No — identifies only", "Yes — actively exploits vulnerabilities"], ["Scope", "Broad (many systems)", "Targeted (specific systems/scenarios defined in scope)"], ["Frequency", "Frequent (weekly/monthly)", "Periodic (annually, or for specific events/changes)"], ["Output", "Prioritized vulnerability list with CVSS scores", "Narrative report of attack paths, what was compromised, evidence"], ["Cost", "Lower (mostly automated)", "Higher (skilled labor intensive)"], ["Answers", "What weaknesses exist?", "Can weaknesses be exploited? What damage results?"]]}'::jsonb,
  'Assessment exam areas: (1) Vulnerability assessment = find weaknesses without exploiting. Penetration test = actively exploit. (2) Penetration testing requires written authorization — unauthorized testing is illegal. (3) CVSS scores: 0-3.9 Low, 4-6.9 Medium, 7-8.9 High, 9-10 Critical. Know the key CVSS metrics (Attack Vector, Complexity, Privileges Required, Impact). (4) CVE identifies specific vulnerabilities (CVE-2021-44228 = Log4Shell). NVD is NIST''s enriched database. (5) The output difference: VA = list of potential issues; pen test = evidence of actual compromise.',
  'As a manager, vulnerability assessments and penetration tests serve different governance needs. Vulnerability scanning is your ongoing hygiene program — it tells you what needs patching. Penetration testing is your adversarial validation — it tells you whether your defenses and detection capabilities work against a real attack scenario. Both are necessary. The classic mistake is substituting scanning for testing: a clean scan result does not mean your organization is resilient against a skilled attacker. Budget for annual penetration testing of critical systems with a focus on what matters most to the business.',
  'VA = Visiting Assessor (looks at weaknesses, takes notes, leaves). PT = Penetration Tester (knocks the door down to prove it can be done). VA = harmless tourist. PT = authorized burglar. CVSS = the wound severity score from 0-10: Critical is 9-10 (arterial bleed), High is 7-8.9 (broken bone), Medium is 4-6.9 (bruise), Low is 0.1-3.9 (paper cut). CVE = the wound''s name (CVE-2021-44228). NVD = the wound database.',
  'In the Forensics Lab in Tel Aviv, two teams work side by side. The first team runs Nessus across all 500 production servers — the scan completes in 4 hours and produces 2,340 findings, ranked by CVSS score. The 12 Critical findings go directly to the CISO''s remediation queue. This is the vulnerability assessment team — they never touched a system. The second team is a three-person pen test crew given a two-week window and a scope document signed by the CTO. They pick up three of those Critical findings and turn them into a working exploit chain that achieves domain admin access in 6 hours — demonstrating that the theoretical vulnerability is an actual catastrophic attack path. Two reports. Two different answers to two different questions.'
);

-- ---------------------------------------------------------------------------
-- 6.3.1 Penetration Testing Phases
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  6,
  '6.3.1',
  'Penetration Testing Phases',
  'Penetration testing follows structured phases — reconnaissance, scanning, exploitation, post-exploitation, and reporting — governed by Rules of Engagement that define scope, authorized techniques, timing, and escalation contacts before any testing begins.',
  '## Penetration Testing Phases

Penetration testing is not ad hoc hacking — it is a structured, authorized assessment process with defined phases, governance requirements, and deliverable standards. NIST SP 800-115 and the PTES (Penetration Testing Execution Standard) both document structured methodologies. Understanding the phases and the critical governance requirements (especially Rules of Engagement) is directly tested in CISSP.

### Pre-Engagement: Rules of Engagement

Before any testing begins, the penetration test must be governed by a **Rules of Engagement (RoE)** document (also called a Statement of Work, Test Authorization, or Get-Out-of-Jail-Free letter) that specifies:

- **Scope**: Which systems, IP ranges, domains, and applications are in scope. Anything not listed is out of scope — testing out-of-scope systems is unauthorized.
- **Authorized techniques**: What methods are permitted (social engineering, physical access attempts, denial of service simulation, credential attacks, web application testing)
- **Timing**: Testing windows (business hours vs off-hours), maintenance windows to avoid
- **Escalation procedures**: Who to contact if critical vulnerabilities are discovered during testing, or if testing accidentally causes disruption
- **Data handling**: How to handle sensitive data discovered during testing (credentials, PII, business-sensitive information)
- **Physical locations**: Whether physical access attempts are in scope

The RoE must be signed by an authorized representative of the organization. Testers must carry a copy when conducting on-site testing.

### Phase 1: Reconnaissance (Information Gathering)

Reconnaissance collects publicly available information about the target organization without directly probing its systems. **Passive reconnaissance** uses open-source intelligence (OSINT) — DNS records, WHOIS data, LinkedIn employee profiles, job postings (revealing technology stack), GitHub repositories (for exposed credentials or source code), Shodan (for internet-exposed devices), Google dorking (using advanced search operators to find exposed files and systems), and public certificate transparency logs (to discover subdomains). No traffic is sent to the target''s systems during passive reconnaissance.

**Active reconnaissance** involves directly probing the target''s systems — DNS zone transfer attempts, network scanning, SMTP enumeration, banner grabbing. Active reconnaissance generates network traffic that appears in the target''s logs.

### Phase 2: Scanning and Enumeration

Scanning identifies live hosts, open ports, running services, and operating system versions. Tools include Nmap (port scanning, OS fingerprinting, service version detection), Nessus/OpenVAS (vulnerability scanning), and application-specific scanners for web applications (Burp Suite, OWASP ZAP). Enumeration extracts detailed information from identified services: user accounts from LDAP or SNMP, share names from SMB, database schema from exposed DBs.

### Phase 3: Exploitation

Exploitation attempts to leverage discovered vulnerabilities to gain unauthorized access, execute code, or escalate privileges. Exploitation uses exploit frameworks (Metasploit, manual exploitation, custom tools), credential attacks (dictionary attacks, credential stuffing, pass-the-hash), and web application attacks (SQL injection, command injection, SSRF). Testers document every exploit attempt — successful and unsuccessful — with evidence (screenshots, command output, timestamps).

### Phase 4: Post-Exploitation

Post-exploitation simulates what an attacker would do after gaining an initial foothold. Activities include: privilege escalation (attempting to gain higher privileges from the initial access level), lateral movement (pivoting to other systems from the compromised host), persistence establishment (planting backdoors to simulate long-term attacker presence), and data exfiltration simulation (identifying and staging sensitive data, often without actually exfiltrating it, or exfiltrating a token file). Post-exploitation demonstrates the full impact of the initial compromise.

### Phase 5: Reporting

The final deliverable is a written report containing: an executive summary (business risk findings for non-technical leadership), a technical summary (detailed findings with evidence, exploitation steps, and recommended remediation for technical teams), and a risk-ranked finding list. Reports must be delivered securely — they contain sensitive information about how to attack the tested environment. Remediation guidance should be specific, actionable, and prioritized.',
  NULL,
  '{"headers": ["Phase", "Objective", "Techniques", "Governance Requirement"], "rows": [["Pre-Engagement", "Define scope and authorize testing", "Rules of Engagement document, statement of work", "Signed authorization from system owner — MANDATORY before testing begins"], ["Reconnaissance", "Collect information about target", "OSINT, DNS, WHOIS, LinkedIn, Shodan, Google dorking (passive); DNS enumeration, Nmap (active)", "Passive recon is legal; active recon must be in scope"], ["Scanning/Enumeration", "Identify live hosts, services, vulnerabilities", "Nmap, Nessus, Burp Suite, LDAP/SNMP enumeration", "Only in-scope systems; log all scanning activity"], ["Exploitation", "Gain unauthorized access by exploiting vulnerabilities", "Metasploit, credential attacks, web application attacks, social engineering (if in scope)", "Document all attempts; escalate critical findings immediately per RoE"], ["Post-Exploitation", "Demonstrate impact and depth of compromise", "Privilege escalation, lateral movement, persistence, data staging", "Do not actually exfiltrate real customer data; document evidence of access"], ["Reporting", "Communicate findings and risk to stakeholders", "Executive summary + technical findings with evidence and remediation guidance", "Deliver report securely; protect sensitive content"]]}'::jsonb,
  'Penetration testing exam areas: (1) Rules of Engagement are mandatory BEFORE testing. Testing out-of-scope systems is illegal regardless of context. (2) Know all five phases: reconnaissance, scanning, exploitation, post-exploitation, reporting. (3) Passive recon = no traffic to target. Active recon = traffic sent to target. (4) The exam distinguishes between black box (no knowledge), gray box (partial knowledge — user credentials, network diagram), and white box (full knowledge — source code, network docs). (5) The final deliverable is a report with executive summary AND technical findings.',
  'As a manager, you are the authorizing official for any penetration test on systems under your oversight. The most important governance decision you make is defining the scope: too narrow and you miss critical attack paths; too broad and you risk testing systems that production operations teams are not prepared for. Require a briefing from the pen test team on their methodology before they begin, and ensure your incident response team is notified that testing is occurring and what to expect — you do not want your IR team detecting the pen testers and triggering a full incident response.',
  'RSEPR — Recon, Scan, Exploit, Post-exploit, Report. Or: "Really Smart Engineers Perform Remarkably." Rules of Engagement come BEFORE all phases — no RoE, no testing. Black box = you know nothing (attacker perspective). Gray box = you know some (insider threat perspective). White box = you know everything (code review perspective). Passive recon = observation only. Active recon = pinging the target.',
  'In the Forensics Lab in Tel Aviv, the pen test team begins Day 1 with the Rules of Engagement laminated card on each desk — scope, timing, escalation contacts. Day 1: passive recon — LinkedIn shows the company uses Cisco ASAs and Microsoft Exchange 2019. Shodan reveals an unpatched Exchange server. Day 2: active scanning — Nmap confirms the Exchange server''s version, Nessus flags CVE-2021-26855 (ProxyLogon). Day 3: exploitation — the ProxyLogon vulnerability yields SYSTEM access on Exchange. Day 4: post-exploitation — lateral movement to the domain controller using extracted credentials. Day 5: report drafted — executive summary leads with "domain admin access achieved in 72 hours via unpatched Exchange server." RoE upheld throughout.'
);

-- ---------------------------------------------------------------------------
-- 6.4.1 Software Testing Types
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  6,
  '6.4.1',
  'Software Testing Types',
  'SAST (static analysis) inspects source code without running it; DAST (dynamic analysis) attacks a running application from outside; IAST (interactive) monitors from within during runtime — complemented by fuzz testing for unexpected inputs and black/gray/white box perspectives that define how much internal knowledge the tester starts with.',
  '## Software Testing Types

Software security testing encompasses a range of techniques that examine applications from different perspectives, at different stages of the development lifecycle, and with different levels of knowledge about the application internals. The CISSP exam tests your ability to distinguish these approaches and identify which is appropriate for a given security objective.

### SAST: Static Application Security Testing

**Static analysis** (SAST) examines source code, bytecode, or binary code without executing it — like a code review performed at scale by an automated tool. SAST tools parse the code and identify patterns associated with security vulnerabilities: SQL query construction from user input (SQL injection risk), use of dangerous functions (strcpy, system()), hardcoded secrets, insecure cryptographic API usage, and common CWE (Common Weakness Enumeration) patterns.

SAST advantages: can be integrated into CI/CD pipelines to scan every code commit; identifies vulnerabilities at the source level where they are cheapest to fix; can achieve high code coverage; no running application required. SAST limitations: high false positive rate (code that looks vulnerable in isolation may not be exploitable in context); cannot detect vulnerabilities that arise from runtime configuration, third-party library behavior, or the interaction between components; cannot test business logic flaws. Tools: Checkmarx, Veracode Static, SonarQube, Semgrep.

### DAST: Dynamic Application Security Testing

**Dynamic analysis** (DAST) tests a running application from the outside, simulating an external attacker with no knowledge of the application''s internals. DAST tools crawl the application, submit test inputs through all discovered interfaces, and observe the application''s responses for evidence of vulnerabilities. This is essentially automated penetration testing of the application''s external interface.

DAST advantages: finds vulnerabilities that only manifest at runtime (race conditions, authentication logic flaws, server misconfiguration, injection through runtime behavior); low false positive rate (findings are demonstrated rather than inferred from code patterns); no source code access required. DAST limitations: application must be deployed and running; cannot reach code paths not exposed through the external interface; blind to the root cause in source code; slower to run than static analysis. Tools: OWASP ZAP, Burp Suite, Acunetix, Invicti (formerly Netsparker).

### IAST: Interactive Application Security Testing

**Interactive analysis** (IAST) deploys a sensor/agent inside the running application that monitors its behavior from within during normal operation or testing. IAST combines the accuracy of DAST (real runtime behavior observed) with the source-level insight of SAST (the agent can pinpoint the exact code path that produced a vulnerability). IAST operates passively during functional testing — as QA runs test cases, the IAST agent records security-relevant behaviors.

IAST advantages: very low false positive rate; provides precise source code location for vulnerabilities found at runtime; integrates with functional testing pipelines. IAST limitations: requires agent installation (language-specific support); performance overhead; coverage depends on functional test coverage. Tools: Contrast Security, Seeker by Synopsys.

### Fuzzing (Fuzz Testing)

**Fuzzing** submits large volumes of random, malformed, or semi-random inputs to an application and monitors for crashes, hangs, memory errors, or unexpected behavior. Fuzzing is highly effective at discovering memory corruption vulnerabilities (buffer overflows, use-after-free, heap overflows) that are difficult to find through manual code review or SAST.

**Mutation fuzzing**: Takes valid input samples and mutates them randomly or with guided heuristics. **Generation-based fuzzing**: Generates inputs from scratch based on protocol or format specifications. **Coverage-guided fuzzing** (e.g., American Fuzzy Lop / AFL, libFuzzer): Uses code coverage instrumentation to guide input generation toward unexplored code paths.

### Knowledge Level: Black, Gray, and White Box

These terms apply to any testing type (manual pen testing, DAST, etc.) and describe how much knowledge the tester starts with:

**Black box**: The tester has no prior knowledge of the application''s internals — they approach it as an external attacker would. Simulates an outsider attack. Most realistic external attacker simulation; misses vulnerabilities visible only with internal knowledge.

**Gray box**: The tester has partial knowledge — user credentials, a network diagram, a basic architecture overview, or limited documentation. Simulates an authenticated user or an attacker who has done reconnaissance. Most common in practice (balanced between realism and efficiency).

**White box**: The tester has full knowledge — source code, architecture documentation, database schemas, credentials. Allows the most thorough testing and is most efficient for identifying all vulnerabilities. Used in code review-based testing and design-level security assessments.',
  NULL,
  '{"headers": ["Testing Type", "When Run", "Knowledge of Internals?", "Requires Running App?", "False Positive Rate", "Best For Finding"], "rows": [["SAST (Static)", "Early SDLC — code commit, pre-build", "Yes (source/binary analyzed)", "No", "High", "Injection flaws, hardcoded secrets, insecure API use, code-level CWEs"], ["DAST (Dynamic)", "Late SDLC — deployed application", "No (black/gray box by nature)", "Yes", "Low", "Runtime vulnerabilities, authentication flaws, server misconfiguration"], ["IAST (Interactive)", "During QA/functional testing", "Yes (agent inside app)", "Yes", "Very Low", "Combines SAST accuracy with DAST runtime validation — precise vulnerability location"], ["Fuzzing", "Any phase (unit testing, integration, production-like)", "No", "Yes (for binary/API fuzzing)", "Low (crashes are real)", "Memory corruption, parsing vulnerabilities, unexpected input handling"], ["Manual Code Review", "Code review phase", "Yes (full source)", "No", "Low (human judgment)", "Logic flaws, complex vulnerability chains, business logic errors"]]}'::jsonb,
  'Software testing exam areas: (1) SAST = static code analysis (no running app; finds code-level issues; high false positives). (2) DAST = dynamic attack on running app (no source code; low false positives; black box). (3) IAST = agent inside running app (low FP; precise source location). (4) Fuzzing = random/malformed inputs for crash discovery. (5) Black box = no knowledge; gray box = partial knowledge; white box = full knowledge. (6) Know which method is best for which phase of the SDLC: SAST = development; DAST = QA/staging; IAST = integrated with QA.',
  'As a manager, a mature application security program uses all three analysis types in complementary roles — SAST in the CI/CD pipeline for immediate developer feedback, DAST in the staging environment before releases, and IAST where high-value applications need continuous security validation during QA. The mistake is treating them as alternatives rather than complements. Also: fuzzing should be standard practice for any application that parses external file formats, network protocols, or complex data structures — it finds an entire class of vulnerabilities that symbolic analysis tools miss.',
  'SDI — SAST (Static = Source code), DAST (Dynamic = Deployed attack), IAST (Interactive = Inside the app). SAST runs early; DAST runs late; IAST runs during QA. Black box = no knowledge (blindfold on), Gray box = some knowledge (one eye open), White box = full knowledge (lights on). Fuzz = throw random inputs and watch what breaks.',
  'In the Forensics Lab in Tel Aviv, the application security pipeline diagram shows three layers. First: SAST runs on every git commit — 47 findings yesterday, 12 high severity, all assigned to developers in their IDE (static, early, code-level). Second: DAST runs nightly against the staging environment — 8 findings this week, 2 confirmed authentication bypass issues that SAST missed (dynamic, runtime, realistic). Third: IAST agents run in the QA environment during the regression test suite — 3 findings with exact stack traces linking to the vulnerable source lines (interactive, precise, low false positive). Fuzzing runs weekly against the API layer in an isolated environment — found a buffer overflow in the CSV parser last month.'
);

-- ---------------------------------------------------------------------------
-- 6.5.1 Security Metrics
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  6,
  '6.5.1',
  'Security Metrics',
  'KPIs measure current security performance against targets; KRIs measure emerging risk levels; MTTD and MTTR quantify detection and response speed — and effective security dashboards present metrics that drive decisions rather than generate compliance checkbox outputs.',
  '## Security Metrics

You cannot manage what you cannot measure. Security metrics translate program effectiveness into quantifiable terms that can drive resource allocation, program improvement, and executive communication. The CISSP exam tests the distinction between key performance indicators (KPIs) and key risk indicators (KRIs), and the understanding of foundational operational metrics like MTTD and MTTR.

### KPI vs KRI

**Key Performance Indicator (KPI)**: Measures how well the security program is performing against defined targets. KPIs measure outcomes and operational effectiveness. Examples: percentage of systems with current patches applied (patch compliance rate), percentage of security training completed on time (training completion rate), number of security incidents this quarter versus last quarter, mean time to patch critical vulnerabilities after disclosure, phishing simulation click rate trend.

KPIs answer "how are we doing?" They are backward-looking or present-state measures of program execution. A KPI showing 95% patch compliance is a positive performance indicator. A KPI showing 60% patch compliance is a performance failure that requires action.

**Key Risk Indicator (KRI)**: Measures factors that indicate increasing or decreasing risk exposure — early warning signals rather than performance outcomes. KRIs answer "what is our risk level trending toward?" Examples: number of unpatched critical vulnerabilities (leading indicator of breach risk), volume of failed authentication attempts (indicator of brute-force attack risk), number of privileged accounts with no MFA (indicator of credential compromise risk), percentage of third-party vendors with overdue security questionnaires (indicator of supply chain risk).

KRIs can change before incidents occur, making them valuable for proactive risk management. A rising KRI warrants investigation and preventive action rather than waiting for an incident to materialize.

### MTTD and MTTR

**MTTD (Mean Time to Detect)**: The average time elapsed between the start of a security incident and its detection by the security team. A lower MTTD means the organization detects attacks earlier, limiting the time an attacker has to achieve their objectives. The IBM Cost of a Data Breach Report consistently shows that organizations with longer dwell times (time before detection) suffer significantly higher breach costs. MTTD is directly influenced by the quality of monitoring, alerting, and detection rules in the SIEM.

**MTTR (Mean Time to Respond)**: The average time elapsed between incident detection and containment/resolution. A lower MTTR means the organization contains and neutralizes incidents faster, limiting damage. MTTR is influenced by the quality of incident response procedures, team readiness, tool availability, and communication effectiveness during incidents.

MTTD and MTTR should be measured separately because they have different drivers and different improvement levers. An organization with excellent detection (low MTTD) but poor response procedures (high MTTR) needs process improvement, not better monitoring tools.

**MTD (Mean Time to Detect) vs RTO/RPO**: These are different metrics for different contexts. RTO (Recovery Time Objective) and RPO (Recovery Point Objective) are business continuity metrics; MTTD and MTTR are security operations metrics.

### Dashboard Design Principles

Effective security dashboards present the right information to the right audience:

**Executive dashboard**: Business-risk framing. "X% of critical systems are protected by MFA. Incidents this quarter decreased 30% versus last quarter. Our mean time to detect stands at X hours." No technical jargon. Focus on trend, compliance status, and investment impact.

**Operational dashboard**: Tactical. Current alert queue, open incidents by severity, MTTD/MTTR trends, patch compliance by business unit, vulnerability age distribution. Drives daily SOC decisions.

**Risk dashboard**: KRI-focused. Unpatched critical CVEs by severity and age, privileged accounts without MFA, third-party risk heat map, threat intelligence indicators. Drives risk treatment decisions.

Metrics must be actionable — a metric that generates no decision should be removed from dashboards. Vanity metrics (total vulnerabilities ever found, total patches applied all time) clutter dashboards without driving decisions.',
  '[{"formula":"MTTD = Sum of (Time of Detection - Time of Incident Start) / Number of Incidents","description":"Mean Time to Detect: average elapsed time from incident start to detection by security team"},{"formula":"MTTR = Sum of (Time of Resolution - Time of Detection) / Number of Incidents","description":"Mean Time to Respond: average elapsed time from detection to incident containment or resolution"}]'::jsonb,
  '{"headers": ["Metric Category", "Examples", "Answers", "Audience", "Used For"], "rows": [["KPI", "Patch compliance %, training completion %, phishing click rate trend, incidents per quarter", "How well is the program performing?", "Security leadership, executives", "Program management, resource allocation, accountability"], ["KRI", "Unpatched critical CVE count, % privileged accounts without MFA, vendor questionnaire backlog", "What is our risk trending toward?", "CISO, risk committee, executives", "Proactive risk identification, early warning, preventive action"], ["MTTD", "Average hours/days from incident start to detection", "How fast do we detect attacks?", "SOC leadership, CISO, executives", "Detection capability improvement, dwell time reduction"], ["MTTR", "Average hours/days from detection to containment", "How fast do we respond and contain?", "SOC leadership, incident commanders, CISO", "Response process improvement, IR team readiness measurement"]]}'::jsonb,
  'Metrics exam areas: (1) KPI = performance (how well are we doing now?). KRI = risk indicator (what risk are we trending toward?). They measure different things. (2) MTTD = detection speed. MTTR = response speed. Lower is better for both. (3) The exam may ask which metric measures how quickly an incident is detected (MTTD) vs. how quickly it is resolved (MTTR). (4) A security metric must be measurable, meaningful, and actionable — pure compliance counts are poor metrics without context.',
  'As a manager, your most important metrics discipline is distinguishing between metrics that demonstrate compliance and metrics that drive decisions. Training completion at 100% is a KPI that looks good but tells you nothing about whether employees can actually identify phishing. Phishing simulation click rate (KRI trending) tells you something actionable. Build your security reporting cadence around metrics that provoke questions and drive investment — not metrics that generate comfortable numbers for the board packet.',
  'KPI = Key Performance (past/present results). KRI = Key Risk (future risk signal). MTTD = Minutes To Discover (how fast you find it). MTTR = Minutes To Resolve (how fast you fix it). Dashboards face three audiences: executives (risk and trend), operators (today''s queue), risk managers (KRI heat maps). Actionable metrics in, vanity metrics out.',
  'In the Forensics Lab in Tel Aviv, three screens face three different audiences in the daily briefing. Screen 1 (Executive): "Critical systems with MFA: 94%. Incidents this quarter: 12 (down from 19 last quarter). MTTD trend: improving — 4.2 hours average." Screen 2 (SOC Operators): "Current alert queue: 23 open, 4 critical. MTTR this week: 6.1 hours. Three incidents in triage." Screen 3 (Risk): "Unpatched critical CVEs older than 30 days: 8 (KRI elevated — trend rising). Privileged accounts without MFA: 6 (target: 0). Third-party questionnaire backlog: 3 overdue." Each screen tells a different story to a different decision maker.'
);

-- ---------------------------------------------------------------------------
-- 6.6.1 Log Management and Analysis
-- ---------------------------------------------------------------------------
INSERT INTO library_topics (
  domain_id, topic_number, title, one_liner, content_markdown,
  key_formulas, comparison_table, exam_tips, think_like_manager,
  memory_hack, memory_anchor
) VALUES (
  6,
  '6.6.1',
  'Log Management and Analysis',
  'Log management encompasses collection, normalization, storage, and analysis of security-relevant events from across the environment — with SIEM platforms centralizing correlation, retention policies balancing cost against legal requirements, and chain of custody protecting log integrity for forensic and legal use.',
  '## Log Management and Analysis

Logs are the foundational evidence layer for security detection, forensic investigation, incident response, and compliance. Without logs, you cannot detect attacks in progress, cannot investigate past incidents, cannot demonstrate compliance to auditors, and cannot support legal proceedings. NIST SP 800-92 (Guide to Computer Security Log Management) provides the authoritative framework for log management programs.

### Log Types and Sources

Security-relevant logs come from multiple sources across the environment:

**Authentication logs**: Authentication attempts (successful and failed), MFA events, account lockouts, privilege escalation events. Sources: Active Directory/domain controllers, RADIUS servers, IdP platforms, application login systems.

**Network logs**: Firewall allow/deny decisions, IDS/IPS alerts, VPN connection events, proxy request logs, DNS queries, NetFlow data. Sources: firewalls, routers, switches, IDS/IPS, VPN concentrators, proxy servers.

**System logs**: OS audit logs (Windows Security Event Log, Linux /var/log/auth.log and syslog), process creation events, file system access events, scheduled task modifications, registry changes. Sources: all servers, workstations, VMs.

**Application logs**: Application-specific events — web server access logs (Apache/Nginx), database query logs, application error logs, transaction logs. Sources: web servers, databases, custom applications.

**Security tool logs**: Antivirus/EDR detections, DLP alerts, vulnerability scanner findings, PAM session recordings, CASB events.

**Cloud audit logs**: AWS CloudTrail, Azure Monitor Activity Log, Google Cloud Audit Logs — record all API calls and management actions in cloud environments.

### SIEM: Security Information and Event Management

A SIEM (Security Information and Event Management) platform aggregates logs from across the environment, normalizes them into a common format, correlates events across sources and time windows to identify attack patterns, generates alerts, and provides search and investigation capabilities. Core SIEM functions:

**Collection and normalization**: Ingest logs from hundreds of source types through agents, syslog, API, and file-based collection. Normalize different event formats into a common schema.

**Correlation rules**: Define conditions that identify attack patterns across multiple events (e.g., 10 failed logins followed by a successful login from the same IP within 5 minutes = brute-force success indicator).

**Alerting**: Generate alerts when correlation rules trigger, with severity ranking and assignment to analyst queues.

**Search and investigation**: Full-text and structured search across the log database for incident investigation and threat hunting.

### Log Retention

Log retention periods must balance legal and regulatory requirements, operational needs (how long back can you investigate?), and storage cost. Key retention requirements by framework:

- **PCI DSS**: 12 months total retention, with at least 3 months immediately accessible online
- **HIPAA**: Not specified in the regulation; security documentation 6 years (retention of specific logs follows organizational policy)
- **SOX**: 7 years for financial records (applies to financial system logs)
- **FedRAMP (NIST 800-53 AU-11)**: Audit records retained for a minimum defined period, typically 3 years for federal systems

### Chain of Custody for Logs

For forensic and legal use, logs must maintain **chain of custody** — a documented record of who has had access to the logs from the moment of collection through presentation as evidence. Logs used in legal proceedings or forensic investigations must be:

- **Collected without modification**: Using forensic tools that preserve original timestamps and metadata
- **Stored with integrity protection**: Cryptographic hashing (SHA-256) of log files at collection time; write-once or append-only storage that prevents tampering
- **Access-controlled**: Only authorized personnel with logged access
- **Documented**: Chain of custody form documenting every transfer of possession, every access, and every analysis performed

SIEM platforms that allow administrators to delete or modify events break the chain of custody for those records. Forward-only (write-once) log storage architectures are preferred for compliance and forensic-grade log management.',
  NULL,
  '{"headers": ["Log Source", "What It Captures", "Key Security Value", "Typical Format/Protocol"], "rows": [["Domain Controller (Windows Security Log)", "Authentication, privilege use, account changes, Kerberos events", "Detect credential attacks, lateral movement, privilege escalation", "Windows Event Log (WEL), forwarded via WEF or agent"], ["Firewall", "Allow/deny decisions by IP, port, protocol; connection state", "Detect reconnaissance, exfiltration, policy violations", "Syslog; vendor-specific formats"], ["Web Server (Apache/Nginx)", "HTTP requests: method, URL, user agent, response code, client IP", "Detect web attacks (SQLi, XSS, scanning), data exfiltration via web", "Combined Log Format (CLF), JSON"], ["DNS Server", "All DNS queries and responses: name, type, client, response", "Detect C2 beaconing (DGA domains), data exfiltration via DNS tunneling", "Syslog, passive DNS capture"], ["VPN Concentrator", "VPN connection events, authentication, client IP, session duration", "Detect unauthorized remote access, impossible travel scenarios", "Syslog; RADIUS accounting"], ["Cloud (AWS CloudTrail)", "All API calls to AWS services: caller identity, service, action, resource, time", "Detect unauthorized cloud resource access, configuration changes, data exfiltration", "JSON, delivered to S3/CloudWatch"]]}'::jsonb,
  'Log management exam areas: (1) Logs serve detection, investigation, and compliance purposes. (2) SIEM = aggregate, normalize, correlate, alert, search. (3) PCI DSS = 12 months total, 3 months online. (4) Chain of custody = documented, unbroken record of log handling for forensic/legal use. (5) Log integrity = cryptographic hashing, write-once storage. (6) NIST SP 800-92 is the governing guidance. Watch for questions about what makes logs admissible in legal proceedings — chain of custody and integrity protection.',
  'As a manager, your log management program is your most important forensic capability. Organizations that lack centralized logging routinely discover breaches months or years after the fact because the evidence needed to reconstruct the attack timeline was never collected or has been overwritten. The minimum viable logging program: centralized SIEM with all authentication systems, network perimeter devices, and critical servers feeding into it; 12 months retention for security logs; automated alerting on critical events; and regular log review procedures. This is table stakes for any organization that wants to claim they can detect and respond to incidents.',
  'SIEM = Security Information and Event Machine: Collects everything, Normalizes it, Correlates patterns, Alerts on threats, Searches for investigations — CNCAS. Chain of custody for logs = PHAD: Preserve integrity (hash), Handle with documentation, Access control, Document every transfer. PCI: 12 months total, 3 months online. SOX: 7 years for financial.',
  'In the Forensics Lab in Tel Aviv, the SIEM wall shows real-time event ingestion: 47,000 events per second from 2,300 sources. A correlation rule fires — 15 failed logins followed by a successful VPN connection from an IP that geolocates to Ukraine, while the user''s AD account shows they swiped into the Singapore office 2 hours ago. The SIEM alert auto-assigns to the Level 2 analyst queue with severity Critical. In the evidence room, a previous incident''s log package is ready for the legal team: SHA-256 hashes of every log file at collection, write-once storage audit trail, and a chain of custody form with every access logged. The logs hold up in court because nobody ever had the ability to modify them.'
);
