# Domain 6: Security Assessment and Testing - Comprehensive Knowledge Summary

---

## 1. COMPLETE TOPIC LIST

### 6.1 Design and Validate Assessment, Test, and Audit Strategies
- Purpose of security assessment and testing
  - Providing assurance that controls are defined, tested, and operating effectively
  - Applying to both new development and ongoing operations (including end-of-life)
  - Two pillars: functional controls and assurance controls
- Validation and verification
  - Validation: "Are we building the right product?" (requirements capture)
  - Verification: "Are we building the product right?" (implementation correctness)
  - Three Cs of verification: completeness, correctness, consistency
  - Level of confidence proportional to system value
- Effort to invest in testing
  - Value drives security investment
  - Proportional to organizational relevance and criticality of the system
- Assessment, testing, and auditing strategies
  - Internal (within organization control)
    - Conducted by organizational employees
    - First-party assessments
  - External (outside organization control)
    - Company employees examining external service provider controls
    - Hiring outside firm to assess internal systems
  - Third-party (outside enterprise control)
    - Three parties: customer, vendor/service provider, independent auditor
    - Common in cloud computing contexts
- Location-based testing
  - On-premise: physical data centers and facilities
  - Cloud: data and applications hosted by cloud service providers
  - Hybrid: connectivity and integration between on-premise and cloud resources
    - Access management integration
    - Data flow security controls
- Role of the security professional
  - Identify risk
  - Advise testing processes
  - Provide support to stakeholders
  - Security team should not perform testing alone; they advise and evaluate

### 6.2 Conduct Security Control Testing
- Software testing stages overview
  - Plan: requirements gathering, validation
  - Design: architecture design, module design, security control inclusion
  - Develop: unit, integration, system, acceptance, and vulnerability testing
  - Deploy: usability, performance, log review, vulnerability assessment
  - Operate: configuration management reviews, vulnerability management, log analysis
  - Retire: data migration integrity, defensible destruction of data
- Software testing levels
  - Unit testing: individual components tested in isolation
  - Interface testing: verifying components connect and communicate properly
  - Integration testing: testing component groups together
  - System testing: testing the entire integrated system
  - Acceptance testing: validating against business requirements
- Testing techniques - Methods/Tools
  - Manual testing: performed by a person, hands-on keyboard
  - Automated testing: performed by tools, scripts, and batch files
- Testing techniques - Runtime
  - Static Application Security Testing (SAST)
    - Code not running; analyzes source code or compiled binaries
    - White box approach (code is visible)
    - Detects buffer overflows, undefined variables, common flaws
    - Integrated into development environments in mature organizations
  - Dynamic Application Security Testing (DAST)
    - Code is running; tests application behavior at runtime
    - Black box approach (no access to underlying code)
    - Web application scanning (XSS, SQL injection detection)
    - Coordination needed for production environment tests
  - Interactive Application Security Testing (IAST)
    - Combines elements of both SAST and DAST
    - Real-time analysis of runtime behavior with access to code
    - Analyzes HTTP/HTTPS traffic, frameworks, backend connections
  - Runtime Application Self-Protection (RASP)
    - Runs on server, intercepts calls to/from application
    - Validates data requests in real time
- Testing techniques - Access to code
  - Black box: no access to source code
  - White box: full access to source code
  - Gray box: partial access (some documentation, limited code visibility)
- Fuzz testing
  - Specialized dynamic testing with random/malformed inputs
  - Mutation (dumb) fuzzing: modifies known good inputs via bit flipping or appending
  - Generational (intelligent) fuzzing: creates inputs from scratch based on data models and protocol understanding
  - Tool example: zzuf for mutation fuzzing
  - Limitations: typically does not achieve full code coverage; best for simple vulnerabilities
- Test types
  - Positive testing: normal usage scenarios, expected behavior
  - Negative testing: error conditions, improper inputs, graceful failure
  - Misuse case testing (abuse case testing): testing from attacker perspective
    - Enumerate known misuse cases first
    - Use manual and automated attack techniques
- Equivalence partitioning and boundary value analysis
  - Equivalence partitioning: dividing inputs into groups with same expected behavior; test representative from each partition
  - Boundary value analysis: testing at the edges of input ranges where behavior changes
- Decision table analysis: mapping input combinations to expected outputs for complex logic
- State-based analysis: defining abstract states and testing transitions (useful for GUIs, communication protocols like TCP/IP)
- Test coverage analysis
  - Formula: (number of use cases tested / total number of use cases) x 100
  - Coverage criteria:
    - Branch coverage: every if/else path executed
    - Condition coverage: every logical test with all input combinations
    - Function coverage: every function called and returned
    - Loop coverage: loops executed multiple times, once, and zero times
    - Statement coverage: every line of code executed
- Vulnerability assessment
  - Purpose: identify vulnerabilities in systems and networks
  - Automated tools: Nessus, Qualys, OpenVAS, InsightVM, Retina
  - Steps: define scope, schedule, obtain approval, reconnaissance, enumeration, vulnerability analysis, reporting
  - Non-intrusive; stops at identifying vulnerabilities (no exploitation)
  - Typically faster than penetration testing (minutes to hours)
- Penetration testing
  - Goes beyond vulnerability assessment to exploit discovered vulnerabilities
  - More manual, takes longer (days to weeks)
  - Requires explicit written authorization and NDA
  - May access confidential information; can impact production systems
  - Phases: reconnaissance, enumeration, vulnerability analysis, execution/exploitation, document findings
  - Red team / Blue team / Purple team exercises
    - Red team: offensive, simulates attackers (pen testing, social engineering, threat intelligence)
    - Blue team: defensive (monitoring, incident response, digital forensics, security operations)
    - White team: observers, judges, referees, document lessons learned
    - Purple team: collaboration between red and blue for knowledge sharing
  - Capture the Flag (CTF) exercises
- Testing perspectives
  - Internal: from inside the corporate network (insider threat simulation)
  - External: from outside the network (internet-facing attack surface)
- Testing approaches
  - Blind: tester given minimal information; internal teams aware of test
  - Double-blind: tester given minimal information; internal teams unaware (only senior management knows)
- Testing knowledge levels
  - Zero knowledge / Black box: no information about target
  - Partial knowledge / Gray box: some information provided
  - Full knowledge / White box: comprehensive information including network diagrams, credentials, IP ranges
- Vulnerability management lifecycle
  - Asset inventory and classification
  - Vulnerability identification (scanning, assessment)
  - Risk analysis and prioritization
  - Remediation (patching, configuration changes)
  - Ongoing review and reassessment
  - Cyclical and continuous process
- Vulnerability scanning
  - Credentialed/authenticated scans: scanner given credentials, deeper scan, fewer false positives
  - Uncredentialed/unauthenticated scans: external perspective, simulates attacker without credentials, more false positives
  - Banner grabbing: identifying software and versions from service banners and error messages
  - OS fingerprinting: identifying OS from packet characteristics and system-level information
  - Tools: Nmap for network discovery, Nessus/Qualys for vulnerability scanning, Nikto for web servers
- Interpreting scan results
  - CVE (Common Vulnerabilities and Exposures): standardized unique ID and description for each known vulnerability
  - CVSS (Common Vulnerability Scoring System): severity score 0-10
  - NVD (National Vulnerability Database): NIST-maintained database
  - False positives: reported vulnerability that does not actually exist (noise)
  - False negatives: missed real vulnerability (dangerous)
- SCAP (Security Content Automation Protocol)
  - Suite of standards for automating security assessment
  - Components: ARF, CCE, CPE, OVAL, OCIL, TMSAD, XCCDF, SWID
  - Used for policy compliance evaluation and monitoring
- Breach Attack Simulation (BAS)
  - Continuous, automated penetration testing and remediation
  - Mimics attacker actions to test defenses continuously
  - Real-world attack scenarios
  - Distinct from SCAP in purpose and approach
- Log reviews and analysis
  - Log what is relevant (guided by risk management)
  - Review logs (automated via SIEM or manual review)
  - Identify errors, unauthorized modifications, and breaches
  - Log lifecycle: generation, transmission, collection, normalization, analysis, retention, disposal
  - Syslog standard for network devices, Linux/Unix systems
  - Log event time synchronization via NTP (Network Time Protocol)
  - Limiting log sizes:
    - Circular overwrite: oldest entries overwritten when max size reached
    - Clipping levels: threshold-based logging (only log after threshold exceeded)
  - NetFlow logs for investigating security incidents
  - Windows Event Logs: System, Application, Security, Setup
- Synthetic transactions and benchmarks
  - Synthetic performance monitoring: scripted/automated transactions to test functionality, availability, response times
  - Benchmarks: predefined performance standards (response time, throughput, error rates, resource utilization)
  - Smoke tests: quick tests of critical functionality
- Real User Monitoring (RUM)
  - Passive monitoring of actual user interactions
  - Real-time analysis of usage, performance, errors
  - Only detects issues after they occur for real users
- Website monitoring
  - Passive monitoring: captures actual network traffic
  - Active/synthetic monitoring: artificial transactions to detect issues proactively
- Code review and testing
  - Peer review / code review: developers review each other's code
  - Fagan inspections: most formal code review process
    - Six steps: Planning, Overview, Preparation, Inspection, Rework, Follow-up
    - Defined entry and exit criteria between stages
    - Used in high-criticality environments
  - Less formal options: code walkthroughs, senior developer sign-off, automated review tools
- Misuse case testing
  - Enumerate known misuse scenarios
  - Attempt exploitation via manual and automated techniques
  - Examples: banking fraud attempts, input manipulation for unauthorized access
- Interface testing
  - Application Programming Interfaces (APIs): standardized module interactions
  - User Interfaces (UIs): GUIs and command-line interfaces
  - Network Interfaces: data exchange between systems over networks
  - Physical Interfaces: interactions with machinery, logic controllers
- Breach attack simulations
  - Automated tools simulating real-world attacker tactics
  - Continuous and always running
  - Tests network defenses and security measures
- Compliance checks
  - Regular review and analysis of controls against security requirements
  - Gap assessments against standards (ISO 27000, PCI-DSS, etc.)
  - Verify alignment with policies, standards, procedures, baselines
  - Pre-audit compliance verification
- Regression testing
  - Verifying previously tested software still works after updates
  - Performed after enhancements, patches, configuration changes
  - Results reported using "metrics that matter" appropriate to audience

### 6.3 Collect Security Process Data (Technical and Administrative)
- SMART metrics
  - Specific: clearly stated, easy to understand
  - Measurable: result can be quantified with available data
  - Achievable/Actionable: results can drive desired outcomes
  - Relevant: aligned to business strategy
  - Timely: results available when needed
- Key Performance Indicators (KPIs)
  - Backward-looking metrics
  - Indicate achievement of performance targets
  - Insights about risk events that have already affected the organization
  - Examples: mean time to detect (MTTD), mean time to respond/repair (MTTR), number of open vulnerabilities, time to resolve vulnerabilities, defect recurrence, compromised accounts
- Key Risk Indicators (KRIs)
  - Forward-looking metrics
  - Indicate level of exposure to operational risk
  - Monitor potential future shifts in risk conditions or emerging risks
  - Drive risk-related decision-making
- Account management metrics
  - User account reviews, last logon time, account status
  - Mean time to resolution for support tickets
  - Verification of authorized access vs. actual access
  - Privileged account reviews
  - Sampling for account reviews (must be random)
  - IAM vendor workflows for automated review
- Management review and approval
  - Review and approval of products, processes, and changes
  - Time to resolve defects, defect detection effectiveness, average cost per defect
- Backup verification data
  - Routine restores to confirm availability and integrity
  - Number of backups verified, time between verifications
  - Full restoration exercises for worst-case scenarios
- Training and awareness metrics
  - Number of employees completing training
  - Phishing simulation results
  - User attempts to visit known malicious sites
  - Repeat audit findings
- Disaster Recovery (DR) and Business Continuity (BC)
  - Recovery Time Objective (RTO) and Recovery Point Objective (RPO)
  - Testing types by impact level: checklist review, tabletop exercise, parallel test, full interruption test
  - Plans covering critical processes, actual restore times, time between plan updates

### 6.4 Analyze Test Output and Generate Report
- Remediation
  - Address identified vulnerabilities based on testing output
  - Security advises and supports; ultimate accountability rests with owners and management
  - Prioritize based on severity and business impact
  - Document remediation steps for all findings
- Exception handling
  - In automated testing: ensure one test failure does not cascade to other tests
  - In vulnerability management: document why a vulnerability will not be remediated
  - Cost/benefit analysis for exceptions
  - Formal exception tracking and approval
- Ethical disclosure
  - Responsibility to report newly discovered vulnerabilities to vendors
  - Private disclosure first, allowing vendor time to develop patches
  - If vendor does not correct within reasonable time, public disclosure
  - All testing findings should be released to all relevant stakeholders
  - Even findings that delay implementation or increase costs must be disclosed
- Report generation
  - Objective pass/fail decisions
  - Right detail for right audience (executive summary vs. technical detail)
  - Metrics that matter
  - Findings prioritized by severity

### 6.5 Conduct or Facilitate Security Audits
- Audit vs. Assessment distinction
  - Audit: formal, structured, measures against defined criteria
  - Assessment: broader evaluation that may include testing, interviews, observation
- Audit approaches
  - Internal audits: conducted by organizational employees, for management use
  - External audits: conducted by third-party audit firms, for governing body
  - Third-party audits: independent auditor examines service provider, produces report for customers
- Audit plan components
  - Define audit objective
  - Define audit scope
  - Determine audit goals
  - Involve right business unit leaders
  - Choose audit team
  - Plan the audit
  - Conduct the audit
  - Document results
  - Communicate results
  - Refine the audit process
- Audit standards evolution
  - SAS 70 (legacy) -> SSAE 16 -> SSAE 18 (current US standard)
  - ISAE 3402 (international equivalent)
  - Governed by AICPA in the United States
- System and Organization Controls (SOC) reports
  - SOC 1: focused on financial reporting risks (relevant to financial auditors)
  - SOC 2: focused on five trust services criteria
    - Security (always included)
    - Availability
    - Confidentiality
    - Processing Integrity (optional)
    - Privacy (optional)
    - Contains confidential organizational information; distribution restricted
  - SOC 3: summarized and sanitized version of SOC 2
    - For public distribution and marketing purposes
    - Less detailed; suitable for general audiences
  - Type I (Type 1): point-in-time assessment of control design
    - Are controls properly designed?
    - Typically used in first year of auditing
    - No assessment of operational effectiveness
  - Type II (Type 2): assessment over a period of time (usually 6-12 months)
    - Covers both design and operating effectiveness
    - Examines population of transactions and samples
    - Most comprehensive and desirable for security professionals
- Audit roles and responsibilities
  - Executive (Senior) Management: sets tone from the top, promotes audit process
  - Audit Committee: Board members and senior stakeholders providing oversight
  - Security Officer (CSO/CISO): advises on security-related risks to evaluate
  - Compliance Manager: ensures compliance with laws, regulations, standards, policies
  - Internal Auditors: company employees providing assurance on internal controls
  - External Auditors: independent, unbiased audit reports
- Audit location considerations
  - On-premise audits: physical infrastructure and data center evaluations
  - Cloud audits: cloud-hosted systems, data, and application security
  - Hybrid audits: integration points between on-premise and cloud environments

---

## 2. KEY DEFINITIONS AND CONCEPTS

**Validation** - The process of confirming that the right product is being built; ensures business requirements are correctly captured and understood before development begins.

**Verification** - The process of confirming that the product is being built correctly; develops confidence that the implementation meets all defined requirements. Includes the 3 Cs: completeness, correctness, consistency.

**Static Application Security Testing (SAST)** - Analysis of source code or compiled application without executing it. Considered white box testing because the tester has visibility into the code. Identifies flaws like buffer overflows, injection vulnerabilities, and insecure coding patterns.

**Dynamic Application Security Testing (DAST)** - Testing an application while it is running, without access to the source code. Considered black box testing. Common examples include web vulnerability scanning for XSS and SQL injection.

**Interactive Application Security Testing (IAST)** - A hybrid approach combining SAST and DAST that performs real-time analysis during application runtime while also having access to the source code. Monitors HTTP traffic, frameworks, and backend connections.

**Runtime Application Self-Protection (RASP)** - Technology that runs on a server to intercept application calls and validate data requests in real time, providing inline security protection.

**Fuzz Testing** - A dynamic testing technique that sends malformed, unexpected, or random data as inputs to discover crashes, buffer overflows, and other vulnerabilities. Two types: mutation (dumb) and generational (intelligent).

**Mutation Fuzzing (Dumb Fuzzing)** - Takes valid input and randomly modifies it through techniques like bit flipping. No understanding of input structure.

**Generational Fuzzing (Intelligent Fuzzing)** - Creates test inputs from scratch based on understanding of the expected data format or protocol specification.

**Vulnerability Assessment** - An automated or semi-automated process that identifies known vulnerabilities in systems, networks, and applications without attempting exploitation. Produces a findings report.

**Penetration Testing** - Goes beyond vulnerability assessment by actively attempting to exploit identified vulnerabilities to prove they can be leveraged by an attacker. More manual, takes longer, and requires explicit authorization.

**Red Team** - Offensive security professionals who simulate real-world attacks using techniques like penetration testing, social engineering, and threat intelligence.

**Blue Team** - Defensive security personnel responsible for monitoring, incident response, security operations, and digital forensics.

**Purple Team** - A collaborative effort between red and blue teams to share attack and defense knowledge, improving overall organizational security.

**White Team** - Observers and judges during security exercises who referee disputes, document lessons learned, and ensure exercises do not cause production issues.

**Credentialed Scan** - A vulnerability scan where the scanner authenticates to the target system using provided credentials, enabling deeper inspection and reducing false positives.

**Uncredentialed Scan** - A vulnerability scan without authentication credentials, simulating an external attacker perspective. Produces more false positives but reveals what an unauthenticated attacker can see.

**Banner Grabbing** - A technique to identify software, services, and versions running on a target system by examining responses, error messages, or service banners.

**OS Fingerprinting** - Identifying the operating system of a target by analyzing unique characteristics in how it forms packets and handles network communications.

**CVE (Common Vulnerabilities and Exposures)** - A standardized dictionary of publicly known security vulnerabilities, each assigned a unique identifier (e.g., CVE-2024-12345) to ensure consistent identification across tools and organizations.

**CVSS (Common Vulnerability Scoring System)** - A framework that assigns severity scores (0-10) to vulnerabilities based on characteristics like attack vector, complexity, impact, and exploitability. Higher scores indicate more severe vulnerabilities.

**NVD (National Vulnerability Database)** - A NIST-maintained repository of vulnerability data that builds on CVE entries with additional analysis, severity scoring, and impact information.

**SCAP (Security Content Automation Protocol)** - A suite of interoperable specifications for automating policy compliance evaluation, vulnerability management, and security measurement. Components include ARF, CCE, CPE, OVAL, OCIL, TMSAD, XCCDF, and SWID.

**Breach Attack Simulation (BAS)** - Continuous, automated tools that mimic real-world attacker behaviors to test an organization's defenses and validate security controls on an ongoing basis.

**False Positive** - An alert indicating a vulnerability or threat exists when none actually does. Creates noise and administrative overhead.

**False Negative** - A failure to detect an actual vulnerability or threat. More dangerous than false positives because the organization remains unaware of real risks.

**SIEM (Security Information and Event Management)** - A platform that collects, correlates, and analyzes log data from multiple sources to detect security events and support incident response.

**NTP (Network Time Protocol)** - Protocol used to synchronize clocks across network devices, critical for log correlation and forensic analysis.

**Circular Overwrite** - A log management method that overwrites the oldest log entries when the maximum file size or entry count is reached.

**Clipping Level** - A threshold-based logging approach that only records events after a specified threshold is exceeded, filtering out routine noise while preserving significant events.

**Real User Monitoring (RUM)** - Passive monitoring that captures actual user interactions with a website or application to provide real-world performance and usage data.

**Synthetic Performance Monitoring** - Active monitoring using scripted, artificial transactions to test system functionality, availability, and response times under controlled conditions.

**Regression Testing** - Testing performed after software changes (patches, enhancements) to verify that existing functionality has not been broken.

**Fagan Inspection** - The most formal code review methodology, consisting of six phases (planning, overview, preparation, inspection, rework, follow-up) with defined entry and exit criteria.

**SOC (System and Organization Controls) Reports** - Audit reports defined by SSAE 18 that provide assurance about service organization controls. Three types (SOC 1, 2, 3) with two report levels (Type I, Type II).

**Five Trust Services Criteria** - The basis for SOC 2 reports: security, availability, confidentiality, processing integrity, and privacy.

**KPI (Key Performance Indicator)** - A backward-looking metric that measures whether performance targets have been achieved. Reflects past performance.

**KRI (Key Risk Indicator)** - A forward-looking metric that indicates the level of exposure to operational risk and helps anticipate future risk conditions.

**SMART Metrics** - A framework for useful metrics: Specific, Measurable, Achievable/Actionable, Relevant, and Timely.

**Ethical Disclosure** - The principle that security professionals who discover vulnerabilities have a duty to report them privately to the vendor first, then publicly if not remediated within a reasonable timeframe.

**Misuse Case Testing (Abuse Case Testing)** - Testing a system from the perspective of someone attempting to misuse or attack it. Enumerates known misuse scenarios and attempts to exploit them.

**Equivalence Partitioning** - A testing technique that divides inputs into groups (partitions) that exhibit the same behavior, then tests representative values from each group rather than every possible value.

**Boundary Value Analysis** - A testing technique that focuses on values at the edges of input ranges where behavior changes, as these boundaries are most likely to contain bugs.

**Test Coverage Analysis** - A measurement of the percentage of code or use cases that have been exercised by tests, used to assess the thoroughness of the testing effort.

---

## 3. CALCULATIONS AND FORMULAS

### Test Coverage
```
Test Coverage (%) = (Number of Use Cases Tested / Total Number of Use Cases) x 100
```
Example: If an application has 100 use cases and 75 have been tested, test coverage = 75%.

This metric is highly subjective because accurately enumerating all possible use cases is exceptionally difficult. The quality of the metric depends entirely on the quality of the use case enumeration.

### CVSS Score Interpretation
| Score Range | Severity |
|-------------|----------|
| 0.0 | None |
| 0.1 - 3.9 | Low |
| 4.0 - 6.9 | Medium |
| 7.0 - 8.9 | High |
| 9.0 - 10.0 | Critical |

CVSS uses base, temporal, and environmental metric groups to calculate the score.

### XP Calculations (App-Specific)
Per CISSP Quest design:
- Easy questions: 25 XP
- Medium questions: 50 XP
- Hard questions: 100 XP
- Wrong answers: 5 XP
- Level = floor(1 + sqrt(XP / 100))

### Key Security Metrics
- **MTTD (Mean Time to Detect)**: Average time between a security event occurring and its detection.
- **MTTR (Mean Time to Respond/Repair)**: Average time from detection to resolution.
- **Defect Detection Effectiveness**: (Defects found during testing / Total defects found) x 100
- **Vulnerability Remediation Rate**: (Vulnerabilities remediated / Total vulnerabilities identified) x 100

### Port Number Reference for Scanning
| Port | Service |
|------|---------|
| 20/21 | FTP |
| 22 | SSH/SCP/SFTP |
| 23 | Telnet |
| 25 | SMTP |
| 53 | DNS |
| 80 | HTTP |
| 110 | POP3 |
| 137-139 | NetBIOS |
| 143 | IMAP |
| 443 | HTTPS |
| 445 | SMB/Microsoft-DS |
| 1433 | Microsoft SQL Server |
| 3389 | RDP |

Total possible ports: 65,536 (0-65,535) for both TCP and UDP.

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Vulnerability Assessment vs. Penetration Testing
- **Trap**: Confusing the two. The critical differentiator is that vulnerability assessments STOP at identifying vulnerabilities, while penetration tests EXPLOIT them.
- **Trap**: Thinking vulnerability assessments are manual. They are primarily automated. Penetration tests are primarily manual (though they use automated tools too).

### SAST vs. DAST
- **Trap**: Reversing which is white box and which is black box. SAST = white box (sees code), DAST = black box (code not visible).
- **Trap**: Forgetting IAST exists. IAST combines both SAST and DAST characteristics.

### SOC Report Confusion
- **Trap**: Mixing up SOC 1, SOC 2, and SOC 3. SOC 1 = financial reporting controls. SOC 2 = five trust services criteria. SOC 3 = public-friendly summary of SOC 2.
- **Trap**: Confusing Type I and Type II. Type I = point in time (design only). Type II = period of time (design AND operational effectiveness).
- **Trap**: Forgetting that processing integrity and privacy are OPTIONAL in SOC 2 reports while security is always included.
- **Trap**: Thinking SOC 3 is more detailed than SOC 2. SOC 3 is a stripped-down, sanitized version for public consumption.

### False Positives vs. False Negatives
- **Trap**: Thinking false positives are worse. False NEGATIVES are more dangerous because real vulnerabilities go undetected.
- **Trap**: Credentialed scans produce fewer false positives. Uncredentialed scans produce more.

### Black Box vs. White Box vs. Gray Box
- **Trap**: "Black box" means the tester has NO knowledge/access. "White box" means FULL knowledge/access. Gray box is in between.
- **Trap**: These terms apply to both software testing (code access) and penetration testing (knowledge of target). Context matters.

### Blind vs. Double-Blind
- **Trap**: In blind testing, the pen test team has minimal information but the internal security team KNOWS a test is coming. In double-blind, NEITHER the tester NOR the internal security team knows (only senior management is aware).

### Mutation vs. Generational Fuzzing
- **Trap**: Mutation = "dumb" (randomly modifies existing input). Generational = "intelligent" (creates input from scratch based on understanding of expected format).

### Log Management
- **Trap**: Circular overwrite may delete critical breach evidence. Clipping levels preserve significant events and are better for breach detection.
- **Trap**: NTP is essential for log correlation, not optional. Without synchronized timestamps, forensic investigation becomes extremely difficult.

### Role of Security Professional
- **Trap**: Thinking security professionals perform all testing. Their role is to identify risk, advise, support, and evaluate results -- not to perform all tests themselves.

### Audit Responsibility
- **Trap**: Thinking the auditor is responsible for fixing issues. Remediation accountability rests with system owners and management. Security supports and advises.

### SSAE Evolution
- **Trap**: SAS 70 is legacy and has been superseded. The current standard is SSAE 18. Exam questions may test knowledge of this evolution.

### Regression Testing
- **Trap**: Regression testing is not initial testing; it specifically verifies that changes have not broken previously working functionality.

### Validation vs. Verification
- **Trap**: Validation happens BEFORE building (right product?). Verification happens DURING and AFTER building (built right?). Do not reverse these.

---

## 5. COMPARISONS AND DISTINCTIONS

### Vulnerability Assessment vs. Penetration Testing

| Attribute | Vulnerability Assessment | Penetration Testing |
|-----------|------------------------|-------------------|
| Approach | Primarily automated | Primarily manual |
| Exploitation | No exploitation; stops at identification | Actively exploits vulnerabilities |
| Duration | Minutes to hours | Days to weeks |
| Intrusiveness | Non-intrusive | Intrusive; may impact production |
| Authorization | Required | Required (more stringent; NDA often needed) |
| Output | List of vulnerabilities with severity | Proof of exploitability and impact demonstration |
| False positives | More common | Confirmed through exploitation |
| Skill dependency | Tool-dependent | Highly dependent on tester skill |

### SAST vs. DAST vs. IAST

| Attribute | SAST | DAST | IAST |
|-----------|------|------|------|
| Testing phase | Code not running | Code running | Code running |
| Code access | White box (full access) | Black box (no access) | Both (access + runtime) |
| What it finds | Source code flaws, patterns | Runtime vulnerabilities | Real-time behavior + code flaws |
| Examples | Buffer overflows, insecure patterns | XSS, SQL injection | HTTP traffic analysis, framework issues |
| When used | During development | After deployment or in staging | During runtime testing |
| Limitation | Cannot find runtime issues | Cannot pinpoint code location | More complex setup |

### SOC 1 vs. SOC 2 vs. SOC 3

| Attribute | SOC 1 | SOC 2 | SOC 3 |
|-----------|-------|-------|-------|
| Focus | Financial reporting controls | Five trust services criteria | Same as SOC 2 (summarized) |
| Audience | Financial auditors, regulators | Security professionals, customers (under NDA) | General public |
| Detail level | Basic | Comprehensive, often confidential | Sanitized summary |
| Distribution | Restricted | Restricted (NDA typically required) | Unrestricted (marketing tool) |
| Trust criteria | Financial controls only | Security + optional: availability, confidentiality, processing integrity, privacy | Same as SOC 2 but summarized |

### Type I vs. Type II Reports

| Attribute | Type I (Type 1) | Type II (Type 2) |
|-----------|----------------|-----------------|
| Timeframe | Point in time (single date) | Period of time (typically 6-12 months) |
| Scope | Design of controls only | Design AND operating effectiveness |
| Depth | Reviews policies, procedures, documentation | Examines populations, samples transactions, tests effectiveness |
| Use case | First-year audits, initial assessments | Ongoing annual audits |
| Desirability | Less comprehensive | Most desirable for security professionals |
| What it proves | Controls are properly designed on paper | Controls actually work as designed over time |

### Black Box vs. White Box vs. Gray Box

| Attribute | Black Box | White Box | Gray Box |
|-----------|-----------|-----------|----------|
| Knowledge level | Zero | Full | Partial |
| Also known as | Zero knowledge, closed box | Full knowledge, open box, crystal box | Partial knowledge |
| Code access | None | Complete source code | Limited/partial |
| Simulates | External attacker | Insider with full access | Partially privileged user or partner |
| Testing depth | Surface-level | Deepest | Moderate |

### Internal vs. External Audits vs. Third-Party Audits

| Attribute | Internal | External | Third-Party |
|-----------|----------|----------|-------------|
| Performed by | Organization's own employees | External audit firm | Independent auditor hired by service provider |
| Purpose | Self-assessment for management | Independent assurance for governing body | Assurance for service provider's customers |
| Independence | Limited (employee bias possible) | High (independent firm) | High (three-party structure) |
| Parties | 1 (organization itself) | 2 (organization + audit firm) | 3 (customer, vendor, auditor) |
| Common context | Ongoing compliance monitoring | Regulatory requirements | Cloud services, outsourced operations |

### Credentialed vs. Uncredentialed Scanning

| Attribute | Credentialed | Uncredentialed |
|-----------|-------------|----------------|
| Authentication | Scanner authenticates to target | No authentication |
| Depth | Deep scanning of configurations | Surface-level external view |
| False positives | Fewer | More |
| Simulates | Insider or authorized user | External attacker |
| Detail | Checks specific config settings, patches | Identifies obvious vulnerabilities |
| Baseline comparison | Can verify configuration baselines | Cannot verify internal configs |

### Circular Overwrite vs. Clipping Levels

| Attribute | Circular Overwrite | Clipping Levels |
|-----------|-------------------|-----------------|
| Method | Overwrites oldest entries at max size | Only logs events exceeding threshold |
| Data loss risk | May overwrite breach evidence | Preserves significant events |
| Size control | Fixed maximum file size/entries | Reduced by filtering noise |
| Best for | Space-constrained systems | Security breach detection |
| Data deletion | Deletes old data automatically | Does not delete data |

### RUM vs. Synthetic Monitoring

| Attribute | Real User Monitoring (RUM) | Synthetic Monitoring |
|-----------|--------------------------|---------------------|
| Type | Passive | Active |
| Data source | Actual user traffic | Scripted transactions |
| Detection timing | After issues occur | Can detect issues before users experience them |
| Accuracy | High (real-world data) | Simulated (may miss real-world variations) |
| Load testing | No (only observes real usage) | Yes (can simulate high load) |
| Completeness | Limited to actual user paths | Limited to scripted scenarios |

### KPI vs. KRI

| Attribute | KPI | KRI |
|-----------|-----|-----|
| Time orientation | Backward-looking | Forward-looking |
| Purpose | Measure past performance against targets | Predict future risk exposure |
| Examples | MTTD, MTTR, vulnerabilities remediated | Risk score trends, emerging threat indicators |
| Decision support | "Did we meet our goals?" | "What risks are increasing?" |

---

## 6. LEGAL AND REGULATORY

### Authorization for Testing
- Penetration testing ALWAYS requires explicit written authorization from system owners
- Scope, schedule, and boundaries must be clearly defined and agreed upon
- NDA (Non-Disclosure Agreement) should be in place before pen testing begins, as testers may access confidential or sensitive information
- Testing without authorization can be considered illegal (Computer Fraud and Abuse Act applies)
- Double-blind tests still require authorization from senior management, even though internal teams are unaware

### Compliance Testing Requirements
- **PCI-DSS (Payment Card Industry Data Security Standard)**
  - Large organizations must hire Qualified Security Assessors (QSAs) for compliance checks
  - Smaller organizations may self-certify
  - Regular vulnerability scanning and penetration testing required
  - Annual assessments mandatory
- **HIPAA** - Requires regular risk assessments and security evaluations for protected health information (PHI)
- **GDPR** - Requires organizations to conduct data protection impact assessments (DPIAs) for high-risk processing activities
- **SOX (Sarbanes-Oxley)** - Requires internal controls over financial reporting; audited through SOC 1 reports

### Audit Standards
- **SSAE 18 (Statement on Standards for Attestation Engagements No. 18)** - Current US standard for third-party auditing, governed by AICPA
- **ISAE 3402 (International Standard on Assurance Engagements 3402)** - International equivalent to SSAE 18 with slight variations
- **SAS 70** - Legacy standard, superseded by SSAE 16, then SSAE 18
- **ISO 27001/27002** - Information security management system standards that organizations may be assessed against

### Ethical and Legal Obligations
- Ethical disclosure requires reporting discovered vulnerabilities to vendors privately before public disclosure
- Reasonable time must be given for vendor remediation before public disclosure
- Testing should involve all relevant stakeholders
- All findings must be disclosed to interested parties, even if they delay implementation or increase costs
- Log data may be subject to legal retention requirements and can serve as evidence (hearsay rule applies -- system administrators may need to authenticate logs for court admissibility)
- Record retention policies must comply with legal and regulatory requirements

### COBIT (Control Objectives for Information and Related Technologies)
- Framework describing requirements organizations should have for their information systems
- Used as an audit and compliance framework
- Provides governance and management framework for enterprise IT

---

## 7. FRAMEWORKS AND METHODOLOGIES

### Penetration Testing Frameworks
- **OWASP Testing Guide**: Comprehensive methodology for web application security testing, covering input validation, authentication, session management, and more
- **NIST SP 800-115 (Technical Guide to Information Security Testing and Assessment)**: Provides guidance on planning and conducting technical security assessments, including testing techniques, review techniques, and target identification
- **PTES (Penetration Testing Execution Standard)**: Defines penetration testing in seven phases: pre-engagement interactions, intelligence gathering, threat modeling, vulnerability analysis, exploitation, post-exploitation, reporting
- **OSSTMM (Open Source Security Testing Methodology Manual)**: Provides a scientific methodology for characterizing operational security through testing and analysis

### Vulnerability Assessment Methodology
1. Define scope and obtain authorization
2. Perform reconnaissance (passive information gathering)
3. Conduct enumeration (active scanning of IPs, ports, services)
4. Run vulnerability analysis (automated scanning)
5. Validate findings (eliminate false positives)
6. Compile and prioritize findings report

### Audit Frameworks
- **SSAE 18**: Current US standard for attestation engagements; defines SOC report types and requirements
- **ISAE 3402**: International assurance engagement standard; similar to SSAE 18
- **COBIT**: Framework for IT governance and management; provides audit criteria for information systems
- **ISO 27001**: International standard for information security management systems; provides basis for certification audits
- **PCI-DSS**: Payment card industry standard with specific testing and assessment requirements

### Threat Modeling Methodologies (Supporting D6 Assessment)
- **STRIDE**: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege
- **PASTA**: Process for Attack Simulation and Threat Analysis

### SCAP Component Standards
- **ARF (Asset Reporting Format)**: Standard format for reporting asset information
- **CCE (Common Configuration Enumeration)**: Unique identifiers for system configuration issues
- **CPE (Common Platform Enumeration)**: Standardized naming scheme for IT systems, platforms, and packages
- **OVAL (Open Vulnerability and Assessment Language)**: Language for determining presence of vulnerabilities and configuration issues
- **OCIL (Open Checklist Interactive Language)**: Framework for expressing security checks as questions
- **TMSAD (Trust Model for Security Automation Data)**: Trust model for security automation data exchange
- **XCCDF (Extensible Configuration Checklist Description Format)**: Language for authoring security checklists
- **SWID (Software Identification)**: Tags for identifying installed software

### Software Testing Lifecycle Alignment
Testing aligns with SDLC phases:
- **Planning**: Requirements validation, security requirements capture
- **Design**: Architecture review, threat modeling, control specification
- **Development**: Unit testing, code review (SAST), integration testing
- **Testing/QA**: System testing, DAST, fuzz testing, acceptance testing
- **Deployment**: Performance testing, vulnerability scanning, log review
- **Operations**: Continuous monitoring, vulnerability management, compliance checks
- **Retirement**: Data migration validation, defensible destruction verification

### Code Review Methodologies
- **Fagan Inspection**: Six-phase formal review (Planning -> Overview -> Preparation -> Inspection -> Rework -> Follow-up)
- **Walkthroughs**: Developer-led informal reviews with peers
- **Automated Tools**: Static analysis tools integrated into CI/CD pipelines
- **Pair Programming**: Real-time code review during development

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Penetration Testing Methodology (5 Phases)

```
1. RECONNAISSANCE (Passive)
   |  Gather publicly available info: DNS, WHOIS, social media, job listings
   |  Target cannot detect this activity
   v
2. ENUMERATION (Active)
   |  Active scanning: IP addresses, ports, hostnames, user accounts
   |  Target CAN detect these scans
   |  Identify systems and services behind IP addresses
   v
3. VULNERABILITY ANALYSIS
   |  Identify potential vulnerabilities in discovered systems
   |  [FORK POINT: Vuln Assessment stops here -> Report]
   v
4. EXECUTION / EXPLOITATION (Pen Test Only)
   |  Attempt to exploit identified vulnerabilities
   |  Confirm true positives vs. false positives
   |  May access confidential information
   v
5. DOCUMENT FINDINGS / REPORTING
   Compile findings, techniques, tools used
   Identify severity and prioritize
   Provide mitigation recommendations
   Eliminate false positives from report
   Tailor report to audience
```

### Vulnerability Management Lifecycle

```
1. ASSET INVENTORY
   |  Identify all organizational assets
   |  Establish data/asset classification and categorization
   |  Assign owners to each asset
   v
2. VULNERABILITY IDENTIFICATION
   |  Run automated vulnerability scans
   |  Perform credentialed and uncredentialed scans
   |  Banner grabbing and fingerprinting
   v
3. RISK ANALYSIS AND PRIORITIZATION
   |  Assess severity using CVSS scores
   |  Map vulnerabilities to CVE entries
   |  Evaluate business impact
   |  Prioritize based on risk (likelihood x impact)
   v
4. REMEDIATION
   |  Patch, update, reconfigure
   |  Implement compensating controls where patches unavailable
   |  Follow change management processes
   v
5. VALIDATION
   |  Re-scan to confirm remediation
   |  Verify no new vulnerabilities introduced
   v
6. ONGOING MONITORING AND REASSESSMENT
   |  Continuous scanning schedule
   |  Update asset inventory
   |  Review new vulnerability disclosures
   [Cycle repeats]
```

### Audit Process Flow

```
1. DEFINE AUDIT OBJECTIVE
   |  What is being evaluated?
   v
2. DEFINE AUDIT SCOPE
   |  What systems, processes, and controls are included?
   v
3. INVOLVE BUSINESS UNIT LEADERS
   |  Ensure appropriate stakeholders are engaged
   v
4. CHOOSE AUDIT TEAM
   |  Internal, external, or third-party auditors
   v
5. PLAN THE AUDIT
   |  Timeline, resources, methodology, sampling approach
   v
6. CONDUCT THE AUDIT
   |  Examine controls, documentation, populations, samples
   |  Interview personnel, observe processes
   v
7. DOCUMENT RESULTS
   |  Findings, observations, exceptions
   |  Severity classifications and recommendations
   v
8. COMMUNICATE RESULTS
   |  Tailored to audience (management vs. technical teams)
   v
9. REFINE THE AUDIT PROCESS
   Follow-up on remediation
   Lessons learned for future audits
```

### Security Assessment Planning Flow

```
1. DETERMINE ASSESSMENT TYPE
   |  Internal, external, or third-party
   |  On-premise, cloud, or hybrid
   v
2. SELECT TESTING STRATEGY
   |  Based on system value and assurance level needed
   |  Combine strategies as appropriate
   v
3. DEFINE SCOPE AND SCHEDULE
   |  What systems, networks, applications are in scope?
   |  When will testing occur? (Maintenance windows for production)
   v
4. OBTAIN AUTHORIZATION
   |  Written approval from system owners
   |  NDA if sensitive data may be accessed
   v
5. EXECUTE TESTING
   |  Vulnerability scans, pen tests, code reviews, log reviews
   |  Follow chosen methodology (OWASP, NIST, PTES)
   v
6. ANALYZE RESULTS
   |  Validate findings, eliminate false positives
   |  Prioritize by severity and business impact
   v
7. GENERATE REPORTS
   |  Technical details for security teams
   |  Executive summaries for management
   v
8. REMEDIATE AND FOLLOW UP
   Track remediation progress
   Verify fixes through re-testing
   Document exceptions and risk acceptance
```

### Software Testing Sequence

```
Unit Testing -> Interface Testing -> Integration Testing -> System Testing -> Acceptance Testing
     |                |                      |                    |                |
  Individual      Component            Component group       Whole system     Business
  components      connections          interaction          as integrated    requirements
                                                                            validated
```

### Log Management Lifecycle

```
Generation -> Transmission -> Collection -> Normalization -> Analysis -> Retention -> Disposal
```

---

## 9. THINK LIKE A MANAGER

### Assessment Program Management
- A manager's role is to oversee the PROGRAM, not perform individual tests
- The security team advises, monitors, supports, and evaluates -- but does not own all testing
- Testing investment should be proportional to the value the system represents to the organization
- Use risk assessments to determine testing priorities and frequency
- Ensure all relevant stakeholders are involved in testing planning

### Choosing Assessment Types
- Consider the question: "What level of assurance do we need?"
- Higher-value systems warrant more rigorous testing (white box pen tests, formal code reviews)
- Lower-value systems may only need automated vulnerability scans
- Combine internal, external, and third-party assessments for comprehensive coverage
- Location matters: on-premise, cloud, and hybrid environments each require different approaches
- Remember that the MOST ACCURATE test is production testing, but it carries the MOST RISK

### Audit Preparation
- Set the tone from the top: executive management must champion the audit process
- Prepare documentation BEFORE auditors arrive (policies, procedures, baselines)
- Conduct pre-audit compliance checks and gap assessments
- Address known deficiencies proactively rather than waiting for auditors to find them
- First-year: pursue a Type I audit to identify gaps; subsequent years: Type II for operational effectiveness
- SOC 2 Type II is the gold standard for demonstrating ongoing security control effectiveness

### Remediation Prioritization
- Not all vulnerabilities require immediate action; prioritize based on:
  - CVSS severity score
  - Business impact if exploited
  - Exploitability (is there a known exploit in the wild?)
  - Asset value and exposure (internet-facing vs. internal)
- Document ALL remediation decisions, including exceptions (why a vulnerability was accepted)
- Use change management processes for all remediation actions
- Track remediation progress with metrics (time to remediate, vulnerability aging)

### Communicating Findings to Leadership
- Tailor reports to the audience: executives need high-level summaries with business impact; technical teams need detailed findings
- Use "metrics that matter" -- connect findings to business outcomes
- Present risk in business terms, not technical jargon
- Highlight trends over time (are we getting better or worse?)
- Include actionable recommendations, not just findings
- Focus on pass/fail decisions that drive action

### Third-Party Assessment Management
- When using cloud services, request SOC 2 Type II reports
- SOC 3 reports are insufficient for security assessment purposes (marketing documents)
- Include right-to-audit clauses in vendor contracts
- Understand the shared responsibility model -- know what the provider covers and what you must test
- Three-party audit structure provides the most objective assurance
- Review SOC reports annually and track any noted exceptions or qualifications

### Manager Decision Framework
When a D6 question asks what to do FIRST, BEST, or MOST:
- **FIRST**: Define scope and obtain authorization before any testing
- **BEST**: Choose the answer that provides the most comprehensive assurance proportional to risk
- **MOST IMPORTANT**: Accountability for remediation rests with system owners, not security
- **PRIORITY**: Address false negatives before false positives (undetected threats are worse)
- Think about governance, oversight, and program management rather than technical execution

---

## 10. EXAM STRATEGY

### How D6 is Tested (12% of exam, approximately 18 questions)
- Scenario-based questions describing testing situations and asking for the BEST approach
- Comparison questions: "What is the difference between X and Y?"
- Process order questions: "What is the FIRST step in a penetration test?"
- Report type questions: "Which SOC report should be requested?"
- Tool selection questions: given a scenario, which tool is most appropriate
- Metric and indicator questions: KPI vs. KRI, what to measure, SMART metrics

### Question Patterns
1. **"Which type of testing..."**: Usually testing whether you understand SAST vs. DAST, black box vs. white box, or vulnerability assessment vs. penetration testing
2. **"What is the FIRST step..."**: Reconnaissance comes before enumeration; define scope before testing; get authorization before anything
3. **"Which report should..."**: Test SOC type knowledge -- SOC 2 Type II for security assurance over time; SOC 1 for financial; SOC 3 for public info
4. **"A security professional discovers a vulnerability in a vendor's product..."**: Tests ethical disclosure -- report to vendor privately first
5. **"Which metric..."**: KPI = backward looking (did we meet the goal?); KRI = forward looking (what risks are emerging?)

### Wrong-Answer Traps
- Answers that suggest performing tests without authorization
- Answers that confuse validation (right product) with verification (product built right)
- Answers suggesting SOC 3 provides adequate security assurance (it is a marketing document)
- Answers where the security team performs remediation (management is accountable)
- Answers suggesting false positives are more dangerous than false negatives
- Answers that have penetration testing as primarily automated or quick
- Answers placing vulnerability assessment after exploitation (that would be a pen test)

### Key Exam Tips
- When in doubt, the manager does NOT perform the testing -- they oversee, advise, and review results
- Authorization and scope definition ALWAYS come first
- The exam favors risk-based decision-making: choose the answer that aligns testing effort with system value
- Remember the testing hierarchy: unit -> interface -> integration -> system -> acceptance
- SOC 2 Type II is always the most comprehensive SOC option for security professionals
- Clipping levels are better for security than circular overwrite
- Credentialed scans provide deeper insight and fewer false positives
- NTP is essential for log correlation -- this is a frequently tested detail

---

## 11. CROSS-DOMAIN CONNECTIONS

### Domain 1: Security and Risk Management
- Risk assessment directly feeds D6 testing decisions: what to test, how much to invest, and what to prioritize
- Vulnerability management is a component of the broader risk management program
- CVSS scores and CVE entries feed risk analysis calculations
- Threat modeling (STRIDE, PASTA) from D1 identifies what D6 should test
- Compliance requirements from D1 drive D6 compliance checks
- Governance frameworks determine audit requirements
- Ethics (ISC2 Code of Ethics) underlies ethical disclosure practices

### Domain 3: Security Architecture and Engineering
- Architecture reviews are a form of security assessment
- Vulnerability assessments test the effectiveness of architectural controls
- SCAP components validate security configurations against baselines
- Defense-in-depth principles determine what layers need testing
- Pen testing validates whether architectural controls actually prevent unauthorized access

### Domain 5: Identity and Access Management
- Account management reviews (D6) verify IAM controls (D5)
- Credentialed vs. uncredentialed scanning relates to authentication mechanisms
- Privileged account reviews are a critical D6 activity that validates D5 controls
- Access control effectiveness is tested through both vulnerability assessment and pen testing

### Domain 7: Security Operations
- Log review and SIEM overlap significantly between D6 and D7
- Incident response (D7) uses D6 testing outputs as inputs
- Continuous monitoring (D7) implements ongoing D6 assessment
- Disaster recovery testing (tabletop, parallel, full interruption) bridges D6 and D7
- Backup verification spans both domains
- NetFlow analysis supports both operational security and assessment activities

### Domain 8: Software Development Security
- Code review, SAST, DAST, and fuzz testing directly overlap D6 and D8
- Software testing lifecycle (unit, integration, system, acceptance) is shared content
- Misuse case testing validates D8 secure coding practices
- Interface testing ensures D8 API security
- Fagan inspections and other code review methodologies span both domains
- Regression testing after patches or updates bridges D6 assessment with D8 development

### Domain 2: Asset Security
- Asset inventory and classification drive D6 testing scope and priorities
- Data classification determines the level of testing rigor required
- Data lifecycle management intersects with retirement-phase testing (defensible destruction)

### Domain 4: Communication and Network Security
- Network vulnerability scanning tests D4 controls
- Port scanning identifies exposed network services
- Banner grabbing and fingerprinting probe network-accessible services
- State-based testing applies to network protocols (TCP/IP)
- War driving and war dialing are assessment techniques for wireless and telephony networks

---

## 12. REAL-WORLD APPLICATION

### Assessment Scenario: Cloud Service Provider Evaluation
An organization considering migration to AWS wants assurance about the security of the cloud environment. The security team should:
1. Request the provider's SOC 2 Type II report to evaluate control effectiveness over time
2. Review the report for any noted exceptions or qualifications
3. Determine which of the five trust services criteria were covered
4. Conduct their own vulnerability assessments of their cloud-hosted resources (shared responsibility model)
5. Evaluate connectivity between on-premise and cloud environments (hybrid assessment)

### Pen Test Case Study: Financial Institution
A bank commissions a double-blind penetration test:
- Only the CISO and CTO are aware of the test
- External testers begin with reconnaissance of the bank's public-facing assets
- Enumeration reveals several web servers, an exposed VPN gateway, and email servers
- Vulnerability analysis identifies an unpatched web application server
- Exploitation confirms SQL injection vulnerability in a customer-facing portal
- Report reveals the attack path and demonstrates potential access to customer data
- Remediation: immediate patching, WAF deployment, code review of the application
- Follow-up scan validates the fix

### Audit Finding Example
During a SOC 2 Type II audit of a SaaS provider:
- Auditor examines 200 change management requests from the past year
- Samples 25 changes for detailed review
- Findings: 3 changes lacked documented approval from the change management review board
- Result: Exception noted in the audit report
- Impact: Provider must demonstrate corrective action before next audit cycle
- Security team implements automated workflow requiring documented approvals

### Vulnerability Management in Practice
A manufacturing company discovers 500 vulnerabilities across their network:
- 15 critical (CVSS 9.0+): internet-facing systems with known exploits
- 80 high (CVSS 7.0-8.9): internal servers with significant vulnerabilities
- 200 medium: various configuration weaknesses
- 205 low/informational: minor issues
- Prioritization: critical vulnerabilities on internet-facing systems first, within 48 hours
- High vulnerabilities on production systems within 2 weeks
- Medium within 30 days; low at next scheduled maintenance
- Exception documented for legacy system that cannot be patched (compensating control: network segmentation)

### Log Review Incident Detection
Security analyst reviewing SIEM alerts notices:
- Multiple failed login attempts (exceeding clipping level threshold of 15 failures)
- Failed attempts originate from multiple IP addresses targeting a single admin account
- NTP-synchronized timestamps show attack occurring during 2:00-4:00 AM local time
- Cross-reference with NetFlow logs shows no normal traffic from those IPs
- Conclusion: coordinated credential-stuffing attack against administrative account
- Response: account lockout, IP blocking, incident report, password reset, review of access controls

### Compliance Assessment Example
A healthcare organization prepares for HIPAA audit:
- Internal team conducts gap assessment against HIPAA Security Rule requirements
- Vulnerability scans run against all systems handling PHI
- Penetration test conducted on electronic health record (EHR) system
- Training completion metrics reviewed (98% of staff completed annual HIPAA training)
- Backup verification confirms daily backups of PHI systems with quarterly restore tests
- Access reviews completed for all users with PHI access
- Documentation compiled for auditor review

---

## 13. MEMORY AIDS AND MNEMONICS

### Pen Test Phases: "REVVED" (or "REVER")
- **R**econnaissance (passive)
- **E**numeration (active)
- **V**ulnerability analysis
- **V**erify/Exploit (execution -- pen test only)
- **E**vidence/**D**ocument findings (report)

### SOC Reports: "1-2-3 = F-S-P"
- SOC **1** = **F**inancial controls
- SOC **2** = **S**ecurity and trust criteria (the "serious" one)
- SOC **3** = **P**ublic/marketing summary (the "pretty" one for the public)

### Type I vs. Type II: "I = Instant, II = In-depth over time"
- Type **I** = point **I**n time (snapshot of design)
- Type **II** = over a per**II**od (operating effectiveness)

### Five Trust Services Criteria: "SCAPP" or "SAPCP"
- **S**ecurity (always required)
- **A**vailability
- **P**rocessing integrity
- **C**onfidentiality
- **P**rivacy
(Processing integrity and Privacy are optional in SOC 2)

### SAST vs. DAST: "S = Still, D = Doing"
- **S**AST = code is **S**till (not running) = white box
- **D**AST = code is **D**oing (running) = black box

### Fuzzing Types: "M = Mutate (Modify existing), G = Generate (create new)"
- **M**utation = **M**odify existing input = dumb
- **G**enerational = **G**enerate from scratch = intelligent

### Black/White/Gray Box: "B = Blind, W = Wide open, G = Glimpse"
- **B**lack box = **B**lind (zero knowledge)
- **W**hite box = **W**ide open (full knowledge)
- **G**ray box = **G**limpse (partial knowledge)

### Testing Levels: "U-I-I-S-A" (say "You Eye Isa")
- **U**nit -> **I**nterface -> **I**ntegration -> **S**ystem -> **A**cceptance

### False Positives/Negatives: "FP = Falsely Positive (crying wolf), FN = Falsely Negative (hidden danger)"
- False Positive = alarm with no real threat (annoying but not dangerous)
- False Negative = no alarm with real threat (dangerous!)
- Remember: **False Negatives are WORSE** because you do not know the threat exists

### SMART Metrics: Standard acronym
- **S**pecific
- **M**easurable
- **A**chievable/Actionable
- **R**elevant
- **T**imely

### KPI vs. KRI: "P = Past, R = Rising risk"
- **K**ey **P**erformance **I**ndicator = looking at the **P**ast (backward)
- **K**ey **R**isk **I**ndicator = looking at **R**ising future risks (forward)

### Validation vs. Verification: "Val = Valid product, Ver = Verified build"
- **Val**idation = Is this the right product? (before building)
- **Ver**ification = Is this product built right? (during/after building)

### 3 Cs of Verification: "CCC"
- **C**ompleteness (all use cases covered)
- **C**orrectness (each use case represents actual requirement)
- **C**onsistency (functionality specified consistently everywhere)

### Log Management: "C = Circle around, CL = CLip the noise"
- **C**ircular overwrite = goes around in circles, may lose data
- **CL**ipping levels = clips the noise, preserves the important stuff

### Audit Standard Evolution: "SAS 70 -> SSAE 16 -> SSAE 18"
- Think "7-16-18" -- ascending numbers as standards mature
- SSAE 18 is current; if you see SAS 70, it is legacy

### Red/Blue/Purple Teams: "R = Raid (attack), B = Block (defend), P = Partner (collaborate)"
- **R**ed team = **R**aids the network (offensive)
- **B**lue team = **B**locks attacks (defensive)
- **P**urple team = **P**artners together (collaboration)
- **W**hite team = **W**atches and judges (observer)

### Credentialed vs. Uncredentialed Scans: "Cred = Credentials = deeper + cleaner"
- Credentialed = deeper scan, fewer false positives
- Uncredentialed = shallower, more false positives, simulates attacker

---

## 14. PRACTICE QUESTION PATTERNS

### Pattern 1: "What type of testing is described?"
Scenario describes a tester analyzing source code without executing the application. The answer is SAST (static testing). Distractors: DAST (running code), fuzz testing (random inputs), regression testing (after changes).

### Pattern 2: "Which SOC report should be requested?"
Scenario asks a security manager evaluating a cloud provider's security over time. The answer is SOC 2 Type II. Distractors: SOC 1 (financial only), SOC 2 Type I (point in time only), SOC 3 (marketing summary), external vulnerability scan (unlikely allowed).

### Pattern 3: "What is the FIRST step?"
Scenario asks about beginning a penetration test. The answer involves defining scope and obtaining authorization. Distractors: starting enumeration, running exploits, generating reports.

### Pattern 4: "Which is MORE dangerous?"
Scenario compares false positives and false negatives. The answer is false negatives (real threats go undetected). Distractors: false positives (annoying but detectable), both are equal (incorrect).

### Pattern 5: "What differentiates a vulnerability assessment from a pen test?"
The key differentiator is EXPLOITATION. Vulnerability assessments identify but do not exploit. Penetration tests exploit to prove vulnerability is real.

### Pattern 6: "Which scan provides deeper results?"
Credentialed scans provide deeper, more accurate results with fewer false positives than uncredentialed scans.

### Pattern 7: "Who is accountable for remediation?"
System owners and management are accountable. Security advises and supports but does not own remediation.

### Pattern 8: "Which testing technique is BEST for testing business logic?"
Manual testing is best for evaluating business logic, as automated tools (fuzzers, scanners) cannot assess whether business logic flows correctly.

### Pattern 9: "What type of team performs offensive security exercises?"
Red team performs offensive operations. Blue team defends. Purple team collaborates. White team observes.

### Pattern 10: "What protocol is critical for log correlation?"
NTP (Network Time Protocol) is essential for synchronizing timestamps across systems for log correlation.

### Pattern 11: Port-Based Identification Questions
Given open ports, identify the likely system type. Example: TCP 137-139, TCP 445, TCP 1433 = Windows SQL Server. TCP 443 = HTTPS web server (use Nikto for scanning).

### Pattern 12: Tool Selection Questions
- Network discovery: Nmap
- Vulnerability scanning: Nessus, Qualys, OpenVAS
- Web application scanning: Nikto, OWASP ZAP
- Exploitation: Metasploit
- Fuzzing: zzuf, Peach
- SQL injection: sqlmap

### Pattern 13: "What log management method preserves evidence?"
Clipping levels preserve significant events while filtering noise. Circular overwrite may destroy evidence. Clipping is better for security.

### Pattern 14: Compliance Framework Identification
- PCI-DSS for payment card data
- HIPAA for health information
- COBIT as an audit/compliance framework
- ISO 27001 for information security management
- SOX for financial reporting controls

### Pattern 15: Code Review Formality
Fagan inspection is the MOST formal code review process with six defined phases and strict entry/exit criteria.

---

## 15. GAPS TO ADD (Topics Not in Current Story Mode)

Current story mode covers:
- Vulnerability Assessment vs. Penetration Testing
- Penetration testing methodology
- Testing approaches (Black/White/Gray Box)
- Log Reviews/SIEM
- SOC 2 Type I vs. Type II
- Security Metrics/KPIs (MTTD, MTTR)
- Vulnerability scan validation

### Topics NOT yet in story mode that should be added:

**High Priority (Core Exam Topics)**
1. SAST vs. DAST vs. IAST -- Static, dynamic, and interactive application security testing distinctions
2. Fuzz testing (mutation vs. generational) -- Two types of fuzzing and when each is appropriate
3. Code review processes -- Fagan inspections, peer review, walkthroughs, automated tools
4. SOC 1 vs. SOC 2 vs. SOC 3 -- Full comparison of all three SOC report types (not just SOC 2 Type I/II)
5. SSAE 18 / ISAE 3402 audit standards -- Evolution from SAS 70 and international equivalents
6. Validation vs. Verification -- The fundamental "right product" vs. "built right" distinction
7. Red Team vs. Blue Team vs. Purple Team vs. White Team -- Team roles in security exercises
8. Credentialed vs. uncredentialed vulnerability scanning -- Differences and implications
9. CVE and CVSS -- How vulnerabilities are identified and scored
10. False positives vs. false negatives -- Understanding alert types and which is more dangerous

**Medium Priority (Supporting Topics)**
11. Equivalence partitioning and boundary value analysis -- Testing efficiency techniques
12. Test coverage analysis -- Formula and coverage criteria (branch, condition, function, loop, statement)
13. Interface testing types -- API, UI, network, physical interfaces
14. Misuse case / abuse case testing -- Testing from attacker perspective
15. Breach Attack Simulation (BAS) -- Continuous automated pen testing
16. SCAP (Security Content Automation Protocol) -- Suite of automation standards
17. KRI (Key Risk Indicators) -- Forward-looking metrics (KPIs are covered, but KRIs may not be)
18. SMART metrics framework -- Specific, Measurable, Achievable, Relevant, Timely
19. Circular overwrite vs. clipping levels -- Log management techniques
20. NTP and log time synchronization -- Critical for forensics and correlation

**Lower Priority (Supplementary Content)**
21. Synthetic performance monitoring vs. RUM -- Active vs. passive monitoring techniques
22. Regression testing -- Verifying changes have not broken existing functionality
23. Decision table analysis and state-based analysis -- Advanced testing techniques
24. Blind vs. double-blind testing approaches -- Testing approach nuances
25. Audit roles and responsibilities -- Executive management, audit committee, compliance manager, etc.
26. Banner grabbing and OS fingerprinting -- Reconnaissance and enumeration techniques
27. Ethical disclosure obligations -- Responsible vulnerability disclosure process
28. Compliance checks and gap assessments -- Pre-audit preparation
29. Software testing levels (unit -> interface -> integration -> system -> acceptance) -- Testing hierarchy
30. War driving and war dialing -- Legacy assessment techniques still tested on the exam
31. Smoke testing -- Quick verification of critical functionality
32. Positive, negative, and misuse testing types -- Three approaches to system testing
33. Fagan inspection six phases -- Most formal code review process
34. Account management reviews and sampling -- Verification of authorized access

### Recommended Story Mode Integration Priority
The story mode should first add SAST/DAST/IAST (gap #1), fuzz testing (gap #2), and the full SOC report comparison (gap #4), as these are the most heavily tested D6 topics not currently covered and lend themselves well to narrative scenarios in the "Operation Shadow Protocol" storyline. Team exercises (gap #7) and code review (gap #3) would also create engaging story content where the player character participates in red team exercises or reviews code for vulnerabilities.
