# Domain 8: Software Development Security — Comprehensive Knowledge Summary

> Weight on CISSP Exam: ~11%
> This document synthesizes all major textbook sources into original language for study and question generation.

---

## 1. COMPLETE TOPIC LIST

### 8.1 Understand and Integrate Security in the SDLC
- Security involvement at every phase of development
- SDLC vs. SLC (System Life Cycle) — development vs. full operational lifespan
- SDLC Phases
  - Initiation / Conceptual Definition
  - Functional Requirements Determination
  - Control Specifications Development
  - Architecture and Design (including threat modeling)
  - Development / Coding
  - Code Review Walk-Through
  - Testing (unit, integration, system, acceptance, regression, smoke, canary)
  - Release / Deployment
  - Operations and Maintenance
  - Disposal / Decommissioning
- Development Methodologies
  - Waterfall (linear, sequential, feedback loop limitation)
  - Modified / Iterative Waterfall (with verification and validation)
  - Spiral (risk-driven, iterative prototyping, metamodel)
  - Agile (iterative, sprint-based, Manifesto principles)
    - Scrum (daily scrums, scrum master, sprints, product backlog)
    - Kanban
    - Extreme Programming (XP)
    - Rapid Application Development (RAD)
    - Agile Unified Process (AUP)
    - Dynamic Systems Development Model (DSDM)
  - Scaled Agile Framework (SAFe) — Essential, Large Solution, Portfolio, Full
  - Structured Programming Development
  - Cleanroom Development (defect prevention, certifiable reliability)
  - DevOps (Dev + Ops + QA unification)
  - DevSecOps / SecDevOps (security integrated into DevOps)
  - Combining methodologies
- Maturity Models
  - SW-CMM (Software Capability Maturity Model) — 5 levels: Initial, Repeatable, Defined, Managed, Optimizing
  - CMMI (Capability Maturity Model Integration) — 6 levels (0-5): Incomplete, Initial, Managed, Defined, Quantitatively Managed, Optimizing
  - SAMM (Software Assurance Maturity Model) — OWASP, 5 business functions, 3 maturity levels
  - IDEAL Model — Initiating, Diagnosing, Establishing, Acting, Learning
  - BSIMM (Building Security In Maturity Model)
- Operation and Maintenance
  - Monitoring
  - Periodic evaluation
  - Patching and updates
- Change Management
  - Request Control
  - Change Control
  - Release Control
  - Change Advisory Board (CAB)
  - Security Impact Assessment
  - Configuration Management (identification, control, status accounting, audit)
  - Version control and baselining
- Integrated Product Teams (IPTs)
- Canary Testing / Canary Deployment
- Smoke Testing

### 8.2 Identify and Apply Security Controls in Development Environments
- Programming Languages
  - Language generations (1GL through 5GL)
  - Machine language, assembly language, high-level languages, natural language
  - Compiled vs. interpreted languages
  - Language translators: assemblers, compilers, interpreters
- Libraries
  - Static libraries vs. dynamic (runtime) libraries
  - Code reuse benefits and risks (e.g., Heartbleed in OpenSSL)
  - Software Bill of Materials (SBOM) awareness
- Tool Sets / Software Development Kits (SDKs)
- Integrated Development Environments (IDEs)
  - Code editor, compiler, debugger, automation
  - Examples: Visual Studio, IntelliJ IDEA, Eclipse, RStudio
- Object-Oriented Programming (OOP) Concepts
  - Classes, objects, instances
  - Methods, messages, behaviors
  - Inheritance (parent/superclass to child/subclass)
  - Encapsulation (data hiding, black-box approach)
  - Polymorphism (same message, different behavior)
  - Abstraction (hiding complexity)
  - Delegation (forwarding requests)
  - Cohesion (high is desirable — single-purpose methods)
  - Coupling (low is desirable — minimal interdependence)
- Runtime Environments
  - Java Virtual Machine (JVM)
  - Process isolation
  - Least privilege in runtime
  - Runtime analysis and monitoring
- Continuous Integration / Continuous Delivery / Continuous Deployment (CI/CD)
  - CI: automated integration and testing on commit
  - CD (Delivery): automated release to repository
  - CD (Deployment): automated push to production
  - CI/CD pipeline security
- Software Configuration Management (SCM)
  - Configuration identification
  - Configuration control
  - Configuration status accounting
  - Configuration audit
  - Baseline management
- Code Repositories
  - GitHub, GitLab, Bitbucket, SourceForge
  - Version control (git)
  - Access control (read/write permissions)
  - Sensitive data exposure risk (API keys, passwords)
- SOAR (Security Orchestration, Automation, and Response)
- Code Obfuscation
  - Lexical obfuscation (cosmetic changes — weakest)
  - Data obfuscation (data structure modification)
  - Control flow obfuscation (reordering logic — strongest)
  - Software vault for unaltered source code backup
- Security of Software Environments
  - Separation of development, testing, QA, and production
  - Sandboxing
- Software-Defined Security

### 8.3 Assess the Effectiveness of Software Security
- Auditing and logging of changes
- Risk analysis and mitigation
- Logging and monitoring
- Internal and external audit
- Procurement process security assessment
- Certification and accreditation
  - Certification = technical analysis to verify requirements are met
  - Accreditation = management sign-off to deploy
- Testing and verification
- Code signing
- Software Testing Types
  - White-box testing (access to source code, structural testing)
  - Black-box testing (no code access, user perspective)
  - Gray-box testing (partial code access, combined approach)
  - Static testing / SAST (analyzes code without execution)
  - Dynamic testing / DAST (analyzes running application)
  - Interactive Application Security Testing (IAST) — combines SAST + DAST
  - Runtime Application Self-Protection (RASP)
  - Fuzz testing (random/malformed input)
  - Regression testing (verify unchanged behavior after modifications)
  - Unit testing (individual module testing)
  - Integration testing (modules working together)
  - System testing (complete integrated product)
  - User Acceptance Testing (UAT)
  - Misuse case testing (attacker simulation)
  - Reasonableness checks
- Fagan Inspection (formal code review process)
- Separation of duties in testing (testers ≠ developers)
- Use cases vs. misuse cases

### 8.4 Assess Security Impact of Acquired Software
- Commercial Off-the-Shelf (COTS) Software
  - Pros: verified functionality, vendor support, patches, third-party reviews
  - Cons: no source code access (no white-box testing), vendor lock-in, widely targeted
  - Source code escrow agreements
- Open Source Software (OSS)
  - Pros: code transparency, community support, customizable, independent of vendor viability
  - Cons: community maintenance risks, potential for malicious contributions
  - Example: Heartbleed vulnerability in OpenSSL
- Third-Party Code
  - Apply SDLC security review regardless of source
  - Contractor and vendor code must meet same security standards
- Managed Services / MSPs
  - Evaluate SOC reports
  - Site visits, customer references, regulatory assessments
- Cloud Services (SaaS, IaaS, PaaS)
  - Shared responsibility model
  - Due diligence in cloud migration
  - Security assessment of cloud providers
- Software Assurance Phases for Acquisition
  - Planning / Requirements
  - Contracting
  - Acceptance
  - Monitoring and follow-on
- Service-Level Agreements (SLAs)
  - Uptime guarantees, maximum downtime, peak load, failover time
  - Financial remedies for SLA violations

### 8.5 Define and Apply Secure Coding Guidelines and Standards
- Security Weaknesses and Vulnerabilities at Source-Code Level
  - Buffer overflows
  - Covert channels (timing and storage)
  - Memory / object reuse
  - Executable mobile code
  - TOCTOU / race conditions (time-of-check vs. time-of-use)
  - Backdoors / trapdoors / maintenance hooks
  - Malformed input / injection
  - Citizen developers (untrained users with powerful tools)
- Buffer Overflow Prevention
  - Input / bounds / parameter checking
  - Address Space Layout Randomization (ASLR)
  - Safe programming languages and library functions
  - Runtime bounds checking
  - Code review
- Application Programming Interfaces (APIs)
  - REST (lightweight, HTTP-based, multiple output formats)
  - SOAP (XML-based, more rigid, stronger error handling)
  - API security: authentication (API keys, OAuth), encryption (TLS), data validation, gateways, throttling/quotas, testing
  - API key management (treat like passwords)
  - curl for API testing
- Secure Coding Practices
  - Input validation (server-side mandatory)
  - Output encoding (prevent XSS)
  - Authentication and password management
  - Session management (secure cookies, token expiration)
  - Cryptographic practices
  - Error handling and logging (no verbose errors to users)
  - System configuration hardening
  - File and database security
  - Memory management
  - Parameterized queries / prepared statements (prevent SQLi)
  - Escaping input
  - Limit checks
  - Fail-secure vs. fail-open
- Polyinstantiation
  - Multiple data versions at different classification levels
  - Prevents inference by hiding absence of data
- Database Security
  - DBMS architecture (hardware, software, language, users, data)
  - Relational databases (tables/relations, rows/tuples, columns/attributes/fields)
  - Primary keys, candidate keys, alternate keys, foreign keys
  - Entity integrity (primary key validity)
  - Referential integrity (foreign key validity)
  - Cardinality (number of rows) vs. degree (number of columns)
  - SQL (DDL and DML)
  - Database normalization (1NF, 2NF, 3NF)
  - Hierarchical databases (one-to-many, tree structure)
  - Distributed databases (many-to-many)
  - Object-oriented databases / object-relational databases
  - NoSQL databases (key-value stores, graph databases, document stores)
  - ACID properties (Atomicity, Consistency, Isolation, Durability)
  - Concurrency controls and locking
  - Concurrency issues: lost updates, dirty reads, incorrect summaries
  - Database views (restricting access)
  - Aggregation attacks
  - Inference attacks
  - Database partitioning
  - Cell suppression
  - Content-dependent access control
  - Context-dependent access control
  - Noise and perturbation
  - Database contamination (mixing classification levels)
  - Open Database Connectivity (ODBC)
  - Metadata (object-level, collection-level, methodological)
  - Semantic integrity
- Knowledge-Based Systems / AI
  - Expert systems (knowledge base + inference engine)
  - Machine learning (supervised vs. unsupervised)
  - Neural networks / deep learning (Delta rule, training)
  - Decision support systems
- Malware Categories (cross-domain with D7)
  - Viruses (file infector, MBR, macro, polymorphic, metamorphic, stealth, multipartite, encrypted)
  - Worms (self-propagating)
  - Trojan horses
  - Logic bombs
  - Ransomware
  - Advanced Persistent Threats (APTs)
  - Script kiddies vs. organized crime vs. nation-state actors
- Project Management Tools
  - Gantt charts (schedule/timeline visualization)
  - PERT charts (task dependencies, critical path, standard deviation)
- Software-Defined Security
  - Security controls managed through code
  - Integration with CI/CD pipelines
  - Policy-driven, cloud-compatible

---

## 2. KEY DEFINITIONS AND CONCEPTS

| Term | Definition |
|------|-----------|
| **SDLC** | Structured framework governing phases of software creation from requirements through deployment |
| **SLC (System Life Cycle)** | Broader lifecycle encompassing production operations, maintenance, and eventual retirement |
| **Waterfall Model** | Sequential development approach where each phase completes before the next begins; limited backtracking |
| **Spiral Model** | Risk-driven iterative approach that cycles through planning, risk analysis, engineering, and evaluation; a "metamodel" wrapping around waterfall iterations |
| **Agile** | Philosophy prioritizing individuals, working software, customer collaboration, and responsiveness to change over rigid processes |
| **Scrum** | Agile methodology using daily stand-up meetings, time-boxed sprints (1-4 weeks), scrum masters, and product backlogs |
| **Scrum Master** | Facilitator who shields the team from interference, enforces scrum principles, removes barriers, and enables close cooperation |
| **SAFe** | Scaled Agile Framework for coordinating Agile across large organizations with multiple teams; four configurations (Essential, Large Solution, Portfolio, Full) |
| **DevOps** | Integrating development, QA, and operations into a unified workflow for faster, more reliable software delivery |
| **DevSecOps** | Extending DevOps by embedding security practices throughout the pipeline rather than bolting them on at the end |
| **Shift Left** | Moving security activities earlier in the development process to catch issues when they are cheaper and easier to fix |
| **CI/CD** | Automation pipeline: Continuous Integration merges and tests code frequently; Continuous Delivery/Deployment automates release to repository or production |
| **SW-CMM** | Five-level maturity model (Initial, Repeatable, Defined, Managed, Optimizing) for assessing software process maturity |
| **CMMI** | Evolved maturity model with six levels (0-5), focusing on process integration across the organization |
| **SAMM** | OWASP maturity model for software assurance across five business functions: Governance, Design, Implementation, Verification, Operations |
| **IDEAL Model** | Five-phase improvement model: Initiating, Diagnosing, Establishing, Acting, Learning |
| **IPT** | Integrated Product Team — cross-functional group bringing together development, operations, QA, and security |
| **Canary Deployment** | Releasing changes to a small subset of users first to detect problems before full rollout |
| **Smoke Testing** | Quick preliminary testing after a change to verify core functionality still works |
| **Regression Testing** | Re-running prior test cases after code changes to verify that existing functionality remains intact |
| **UAT** | User Acceptance Testing — end users verify the system meets their requirements before production deployment |
| **Fagan Inspection** | Formal, structured code review process with defined roles and steps |
| **SAST** | Static Application Security Testing — white-box analysis of source code without execution |
| **DAST** | Dynamic Application Security Testing — black-box testing of the running application |
| **IAST** | Interactive Application Security Testing — combines SAST and DAST during application execution with code visibility |
| **RASP** | Runtime Application Self-Protection — security built into the application that monitors and blocks attacks in real time |
| **Fuzz Testing** | Providing random, unexpected, or malformed data as input to find crashes and vulnerabilities |
| **Input Validation** | Verifying user-supplied data conforms to expected format, type, length, and range before processing |
| **Parameterized Query** | Pre-compiled SQL statement where user input is treated as data, not executable code, preventing injection |
| **Escaping** | Replacing dangerous characters with safe equivalents so they render visually but do not execute |
| **Fail-Secure** | System defaults to a secure/locked state when a failure occurs |
| **Fail-Open** | System defaults to a permissive/accessible state when a failure occurs — rarely appropriate |
| **Buffer Overflow** | Condition where input data exceeds allocated memory, potentially overwriting adjacent memory with executable code |
| **ASLR** | Address Space Layout Randomization — randomizes memory locations of executables to defeat buffer overflow exploits |
| **TOCTOU** | Time-of-Check to Time-of-Use — race condition exploiting the gap between a security check and the use of the checked resource |
| **Covert Channel** | Unauthorized communication path; two types: storage (manipulating shared data) and timing (manipulating processing timing) |
| **Backdoor / Trapdoor** | Hidden access mechanism left by developers, sometimes intentionally for maintenance, always a security risk if not removed |
| **Polyinstantiation** | Maintaining multiple versions of the same data at different classification levels to prevent inference from data absence |
| **Aggregation** | Combining multiple low-sensitivity data items to derive higher-sensitivity information |
| **Inference** | Using deductive reasoning on accessible data to determine information that should be restricted |
| **Tuple** | A single row/record in a relational database table |
| **Attribute** | A single column/field in a relational database table |
| **Cardinality** | The number of rows (tuples) in a database table |
| **Degree** | The number of columns (attributes) in a database table |
| **Primary Key** | Column(s) that uniquely identify each record in a table; enforces entity integrity |
| **Foreign Key** | Column(s) in one table that reference the primary key in another table; enforces referential integrity |
| **Entity Integrity** | Rule requiring every primary key value to be valid, unique, and non-null |
| **Referential Integrity** | Rule requiring every foreign key value to correspond to an existing primary key in the referenced table |
| **ACID** | Atomicity (all-or-nothing), Consistency (rules maintained), Isolation (transactions invisible until complete), Durability (committed changes persist) |
| **Database Normalization** | Process of organizing tables to reduce redundancy (1NF, 2NF, 3NF) |
| **ODBC** | Open Database Connectivity — middleware proxy enabling applications to communicate with various database backends |
| **NoSQL** | Databases using non-relational models (key-value, graph, document) for speed or flexible data structures |
| **Expert System** | AI system with a knowledge base (if/then rules) and an inference engine that draws conclusions |
| **Neural Network** | Layered computational model simulating biological reasoning; uses training data and the Delta rule to learn |
| **Machine Learning** | Algorithms that learn from data: supervised (labeled data) or unsupervised (unlabeled data) |
| **Obfuscation** | Deliberately making code difficult to read/reverse-engineer; three types: lexical, data, control flow |
| **Software-Defined Security** | Security controls implemented, managed, and automated through software rather than hardware |
| **COTS** | Commercial Off-the-Shelf software — pre-built, purchased products |
| **OSS** | Open Source Software — source code freely available for inspection, modification, and redistribution |
| **Source Code Escrow** | Third-party holds source code to protect the buyer if the vendor ceases operations |
| **SCM** | Software Configuration Management — systematic tracking and control of code changes |
| **API** | Application Programming Interface — defined methods for software components to communicate |
| **REST** | Representational State Transfer — lightweight, HTTP-based API using multiple output formats (JSON, XML, CSV) |
| **SOAP** | Simple Object Access Protocol — XML-based API with rigid standards and strong error handling |
| **SDK** | Software Development Kit — collection of tools, libraries, documentation, and APIs for building software |
| **SLA** | Service-Level Agreement — contractual performance commitments (uptime, response time, remedies) |
| **SOAR** | Security Orchestration, Automation, and Response — integrates threat management, incident response, and automation |
| **Certification** | Technical analysis confirming a system meets specified security requirements |
| **Accreditation** | Management's formal acceptance of risk and authorization to operate a system |

---

## 3. CALCULATIONS AND FORMULAS

### Code Coverage Metrics
- **Statement Coverage** = (Number of executed statements / Total statements) x 100
- **Branch Coverage** = (Number of executed branches / Total branches) x 100
- **Path Coverage** = (Number of executed paths / Total paths) x 100
- Higher coverage percentages indicate more thorough testing, though 100% does not guarantee security

### Defect Density
- **Defect Density** = Number of known defects / Size of software (usually per KLOC — thousand lines of code)
- Lower defect density indicates higher code quality

### Database Metrics
- **Cardinality** = count of rows (tuples) in a table — changes frequently with normal operations
- **Degree** = count of columns (attributes) in a table — changes infrequently, requires admin intervention

### PERT Estimation
- **Expected Time** = (Optimistic + 4 x Most Likely + Pessimistic) / 6
- Used for project scheduling and risk assessment in software development

### Maturity Levels (numerical)
- **SW-CMM**: Level 1 (Initial) through Level 5 (Optimizing) — 5 levels
- **CMMI**: Level 0 (Incomplete) through Level 5 (Optimizing) — 6 levels
- **SAMM**: Level 1 through Level 3

### XP (for the CISSP Quest app)
- Easy questions = 25 XP, Medium = 50 XP, Hard = 100 XP, Wrong answer = 5 XP
- Level = floor(1 + sqrt(xp / 100))

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Waterfall Traps
- The waterfall model does allow stepping back **one** phase (feedback loop) — but NOT jumping back multiple phases
- Many candidates confuse the iterative waterfall (with feedback) with the original strict sequential waterfall
- The modified waterfall added verification and validation but was superseded by the spiral model before gaining traction

### Maturity Model Confusion
- **SW-CMM Level 4 = "Managed"** but **CMMI Level 4 = "Quantitatively Managed"** — these names differ
- CMMI has 6 levels (starts at 0 = Incomplete); SW-CMM has 5 levels (starts at 1 = Initial)
- The exam may describe an organization's characteristics and ask you to identify the maturity level — focus on behaviors, not just names

### ACID Traps
- **Isolation** means transactions are invisible to other transactions until complete — not that they run in isolation from the system
- **Atomicity** means all-or-nothing, NOT that the transaction is small
- If a database fails mid-transaction, the transaction is **rolled back** (not partially committed)

### Database Key Traps
- **Foreign keys** enforce **referential** integrity (not entity integrity)
- **Primary keys** enforce **entity** integrity
- The **degree** of a table is the number of **columns**, NOT rows — a common confusion since "degree" sounds like magnitude
- **Cardinality** = rows (think: "cards" = individual records)

### Testing Traps
- **SAST = white box** (sees code), **DAST = black box** (does not see code) — candidates sometimes reverse these
- **Dynamic testing** does NOT require source code; **static testing** DOES
- **Release control** is where acceptance testing happens, NOT change control
- Regression testing checks that **old functionality still works** after changes — it does not test new features

### Aggregation vs. Inference
- **Aggregation** = combining many low-value items to derive high-value information (mathematical/SQL functions)
- **Inference** = using logic/deduction to derive restricted information from accessible data
- Both are database attacks, but they use different mechanisms — the exam will try to make you confuse them

### Change Management Traps
- Three components: **Request Control, Change Control, Release Control**
- Configuration management is SEPARATE from change management (though related)
- **Configuration audit** is part of configuration management, NOT change management

### Fail-Secure vs. Fail-Open
- Almost always, the correct answer is **fail-secure** (deny access on failure)
- Fail-open is appropriate ONLY in very limited circumstances as part of a multilayered defense
- The exam default: security over availability unless explicitly stated otherwise

### DevOps vs. DevSecOps
- DevOps alone does NOT inherently include security — that is why DevSecOps exists
- If asked what DevOps is missing, the answer is typically "security" or "information security"

### API Traps
- REST is lighter, faster, more flexible; SOAP is heavier, more rigid, XML-only, but has better error handling
- API keys should be treated like passwords — never stored in public repositories
- The exam may test whether you know that API throttling/rate limiting is a security control

---

## 5. COMPARISONS AND DISTINCTIONS

### Waterfall vs. Agile vs. Spiral vs. DevOps

| Characteristic | Waterfall | Agile | Spiral | DevOps |
|---------------|-----------|-------|--------|--------|
| Approach | Linear, sequential | Iterative, sprint-based | Iterative, risk-driven | Continuous, integrated |
| Flexibility | Rigid; backtrack only one phase | Highly flexible; welcomes change | Moderate; cycles through phases | Flexible; rapid iteration |
| Customer involvement | Primarily at start and end | Continuous throughout | At each prototype review | Continuous feedback loop |
| Documentation | Heavy emphasis | Minimal; working software preferred | Moderate | Automated as possible |
| Risk management | Addressed in one phase | Addressed in each sprint | Central focus of each cycle | Automated security testing |
| Best for | Well-defined, stable requirements | Evolving requirements | Large, complex, high-risk projects | Rapid deployment environments |
| Security integration | Separate phase | Security stories in backlog | Risk analysis each cycle | DevSecOps adds security to pipeline |

### SAST vs. DAST vs. IAST vs. RASP

| Feature | SAST | DAST | IAST | RASP |
|---------|------|------|------|------|
| Testing type | White-box | Black-box | Gray-box (hybrid) | Runtime defense |
| Code access | Full source code | No source code | Source code visible during execution | Embedded in application |
| When used | During development | Post-deployment or in staging | During QA/testing while running | In production |
| Finds | Code-level flaws (SQLi, XSS, buffer overflows) | Runtime vulnerabilities, configuration issues | Both code and runtime issues | Real-time attacks |
| Limitation | Cannot find runtime issues | Cannot pinpoint code location | More complex setup | Performance overhead |

### Compiled vs. Interpreted Languages

| Aspect | Compiled | Interpreted |
|--------|----------|-------------|
| Process | Source code converted to executable by compiler | Source code executed line-by-line by interpreter at runtime |
| Distribution | Binary executable distributed | Source code distributed |
| Security advantage | End users cannot easily view code | End users can inspect code for malicious content |
| Security risk | Easier to hide malicious code (backdoors) | Easier for anyone to modify (tamper) |
| Examples | C, C++, Java, Fortran | Python, JavaScript, Ruby, VBScript, R |
| Performance | Generally faster execution | Generally slower due to runtime translation |

### SQL Injection vs. XSS vs. CSRF

| Attack | Target | Mechanism | Prevention |
|--------|--------|-----------|------------|
| SQL Injection | Database through application | Malicious SQL commands in input fields | Parameterized queries, input validation, stored procedures, least privilege DB permissions |
| XSS (Cross-Site Scripting) | User's browser | Injecting malicious scripts into trusted web pages | Output encoding, input validation, Content Security Policy |
| CSRF (Cross-Site Request Forgery) | Authenticated user session | Forcing authenticated users to submit unwanted requests | Anti-CSRF tokens, same-site cookies, verifying origin headers |

- **Persistent (Stored) XSS**: Malicious script stored on server (e.g., in forum posts); executes for every visitor
- **Reflected (Non-persistent) XSS**: Malicious script embedded in a URL; executes when victim clicks the link

### Aggregation vs. Inference

| Aspect | Aggregation | Inference |
|--------|-------------|-----------|
| Method | SQL aggregate functions (COUNT, SUM, AVG) | Human deductive reasoning |
| Mechanism | Mathematical combination of many records | Logical deduction from available data patterns |
| Example | Counting troops per base from individual transfer records | Deducing a new hire's salary by comparing payroll totals before and after their start date |
| Defense | Restrict access to aggregate functions, least privilege | Polyinstantiation, data blurring, database partitioning |

### REST vs. SOAP

| Feature | REST | SOAP |
|---------|------|------|
| Protocol basis | HTTP | XML |
| Weight | Lightweight, fast | Heavyweight, more capability |
| Flexibility | Multiple output formats (JSON, XML, CSV, RSS) | XML only |
| Error handling | Basic | Strong, built-in |
| Learning curve | Easy to learn | Steeper learning curve |
| Origin | Newer standard | Older, originally Microsoft |
| Extensibility | Flexible by design | Extended through WS-* standards |

### Cohesion vs. Coupling

| Concept | Desired State | Meaning |
|---------|--------------|---------|
| **Cohesion** | HIGH | Methods within a module/class are closely related and serve a single purpose |
| **Coupling** | LOW | Modules are independent with minimal dependencies on each other |
| Bad combination | Low cohesion + high coupling = poorly designed, fragile, hard to maintain |
| Good combination | High cohesion + low coupling = well-designed, modular, easy to maintain and troubleshoot |

### SW-CMM vs. CMMI

| Feature | SW-CMM | CMMI |
|---------|--------|------|
| Levels | 5 (1-5) | 6 (0-5) |
| Level 0 | Not defined | Incomplete |
| Level 4 name | Managed | Quantitatively Managed |
| Focus | Individual software processes | Integration among processes |
| Status | Largely superseded | Current standard |

---

## 6. LEGAL AND REGULATORY

### Software Licensing
- **COTS Licensing**: Most vendors provide only binaries; source code access requires special agreements or escrow
- **Open Source Licenses**: Vary in restrictiveness (GPL requires derivative works to be open source; MIT/BSD are more permissive)
- **License Compliance**: Organizations must track and comply with all software license terms, including open source components embedded in proprietary products

### Intellectual Property in Software
- **Copyright**: Protects the expression of code (the specific written form), not the underlying idea or algorithm
- **Patents**: Can protect algorithms, processes, and methods if they are novel, useful, and non-obvious
- **Trade Secrets**: Protect proprietary code, algorithms, and processes that derive value from being secret
- **Trademarks**: Protect software names, logos, and branding

### Liability for Insecure Code
- Organizations can face legal liability for deploying insecure applications that lead to data breaches
- Negligence claims may arise when reasonable security practices (input validation, encryption) are not followed
- Regulatory penalties (GDPR, HIPAA, PCI DSS) can result from software that fails to protect personal data
- Software vendors may limit liability through End User License Agreements (EULAs) and terms of service

### Export Controls
- Cryptographic software may be subject to export controls under the Wassenaar Arrangement
- The U.S. International Traffic in Arms Regulations (ITAR) and Export Administration Regulations (EAR) regulate export of certain software technologies
- Organizations must verify that software with strong cryptography complies with export regulations before international distribution

### Data Protection and Privacy in Software
- GDPR requires privacy by design — security must be built into software that processes EU personal data
- HIPAA mandates security controls in software that handles protected health information (PHI)
- PCI DSS requires secure coding practices for payment applications (PA-DSS)
- Software handling children's data must comply with COPPA

---

## 7. FRAMEWORKS AND METHODOLOGIES

### SDLC Models (Summary)
1. **Waterfall**: Linear, sequential, each phase completed before next, limited backtracking via feedback loop
2. **Iterative/Modified Waterfall**: Added verification (meets specs?) and validation (meets real needs?) to each phase
3. **Spiral**: Risk-centric, iterative prototyping (P1, P2, P3...), four quadrants per iteration (planning, risk analysis, engineering, evaluation)
4. **Agile/Scrum**: Sprint-based, 1-4 week iterations, daily scrums, product backlog, continuous customer involvement
5. **SAFe**: Scales Agile to enterprise level with Agile Release Trains (ARTs), program increments (8-12 weeks), four configurations
6. **Cleanroom**: Focuses on defect prevention rather than detection; produces certifiably reliable software
7. **Structured Programming**: Logical approach emphasizing structured control flow; foundational to OOP

### OWASP
- **OWASP Top 10**: Regularly updated list of the most critical web application security risks
- **OWASP Secure Coding Practices**: Guidelines covering input validation, authentication, session management, access control, cryptographic practices, error handling, data protection, communication security, system configuration, database security, file management, memory management
- **OWASP SAMM**: Software assurance maturity model with five business functions
- **OWASP Testing Guide**: Comprehensive methodology for web application security testing

### SAMM Business Functions (OWASP)
1. **Governance**: Strategy, metrics, policy, compliance, education, guidance
2. **Design**: Threat modeling, threat assessment, security requirements, security architecture
3. **Implementation**: Secure build, secure deployment, defect management
4. **Verification**: Architecture assessment, requirements-driven testing, security testing
5. **Operations**: Incident management, environment management, operational management

### BSIMM (Building Security In Maturity Model)
- Observational model that measures what organizations actually do for software security
- Provides benchmarking data for comparing software security initiatives across organizations
- Complementary to prescriptive models like SAMM

### DevSecOps Pipeline Security
1. **Plan**: Define security requirements alongside functional requirements
2. **Code**: Follow secure coding guidelines; use IDE security plugins
3. **Build**: Automated SAST scans in the build process
4. **Test**: DAST, IAST, fuzz testing in staging environments
5. **Release**: Code signing, release control approval, remove debug code and backdoors
6. **Deploy**: Configuration hardening, infrastructure as code security scanning
7. **Operate**: Runtime monitoring, logging, incident response
8. **Monitor**: Continuous vulnerability scanning, threat detection, feedback loop to planning

### CI/CD Security Integration
- Automated security gates at each pipeline stage
- Pre-commit hooks for secrets scanning
- Build-time SAST integration
- Container image scanning
- Infrastructure as Code (IaC) security scanning
- Automated deployment to sandboxed environments for DAST
- Post-deployment runtime monitoring

### Change Management Process
1. **Request Control**: Users submit modification requests; managers perform cost/benefit analysis; developers prioritize
2. **Change Control**: Developers reproduce issue, design solution, test in non-production environment; quality control; documentation
3. **Release Control**: Final approval; verify removal of debug code/backdoors; acceptance testing; deployment to production

### Software Configuration Management (SCM) Components
1. **Configuration Identification**: Document current software configurations
2. **Configuration Control**: Ensure changes follow approved policies
3. **Configuration Status Accounting**: Track all authorized changes
4. **Configuration Audit**: Verify production matches accounting records; detect unauthorized changes

---

## 8. PROCESS FLOWS AND LIFECYCLES

### SDLC Phase Flow
```
Initiation/Conceptual Definition
    → Requirements Analysis (functional + security requirements)
        → Architecture & Design (threat modeling, security architecture)
            → Development/Coding (secure coding practices)
                → Testing (unit → integration → system → UAT; SAST/DAST/fuzz)
                    → Certification & Accreditation
                        → Release/Deployment
                            → Operations & Maintenance (monitoring, patching, periodic assessment)
                                → Disposal/Decommissioning (data sanitization, archival)
```

### Secure Code Review Process
1. Define scope and objectives for the review
2. Select reviewers (should include security-aware developers who did NOT write the code)
3. Prepare code for review (provide documentation, architecture context)
4. Conduct review (manual walkthrough + automated static analysis)
5. Document findings (categorize by severity)
6. Remediate identified issues
7. Re-review remediated code
8. Approve or reject code for progression

### Change/Release Management Flow
```
Change Request Submitted
    → Security Impact Assessment
        → Change Advisory Board (CAB) Review
            → Approval / Rejection
                → If Approved: Build & Test in non-production
                    → Notify stakeholders
                        → Implement change
                            → Validate change
                                → Update version/baseline documentation
```

### Database Normalization Steps
1. **First Normal Form (1NF)**: Eliminate repeating groups; each field contains only atomic (indivisible) values; each record is unique
2. **Second Normal Form (2NF)**: Must be in 1NF; remove partial dependencies (non-key attributes must depend on the entire primary key)
3. **Third Normal Form (3NF)**: Must be in 2NF; remove transitive dependencies (non-key attributes must not depend on other non-key attributes)
- Goal: reduce redundancy, prevent update anomalies, ensure data integrity

### ACID Transaction Flow
```
BEGIN TRANSACTION
    → Execute Statement 1
        → Execute Statement 2
            → ... Execute Statement N
                → If all succeed → COMMIT (changes become permanent and durable)
                → If any fail → ROLLBACK (all changes reversed; database returns to pre-transaction state)
```

### Software Acquisition Process Flow
```
Planning/Requirements (define what's needed, security requirements)
    → Contracting (vendor selection, SLA negotiation, security clauses)
        → Acceptance (testing, security validation, certification/accreditation)
            → Monitoring & Follow-On (ongoing security assessment, patch management, vendor audits)
```

### CI/CD Pipeline Flow
```
Developer commits code → Source repository
    → Continuous Integration: automated build + unit tests + SAST scan
        → Continuous Delivery: automated integration tests + DAST + staging deployment
            → Continuous Deployment: automated production deployment (if all gates pass)
                → Runtime monitoring + feedback loop
```

---

## 9. THINK LIKE A MANAGER

### Build vs. Buy Decisions
- Managers must weigh the costs, risks, and benefits of developing custom software vs. purchasing COTS or using open source
- **Build**: Greater control, tailored to needs, but higher cost, longer timeline, requires in-house expertise
- **Buy**: Faster deployment, vendor support, but less customization, potential vendor lock-in, dependency on vendor security posture
- Security professionals should ensure security requirements are in the evaluation criteria regardless of approach

### Evaluating COTS Security
- Request vendor security certifications and third-party audit reports (SOC 2, ISO 27001)
- Review the vendor's vulnerability disclosure and patch management track record
- Negotiate source code escrow agreements for critical applications
- Include security requirements in the procurement RFP and contract
- Plan for compensating controls (WAF, network segmentation) when source code review is not possible

### Managing Legacy Code Risk
- Legacy applications often cannot be easily updated but may process critical business data
- Managers must decide: accept the risk (with compensating controls), plan migration, or retire the application
- Compensating controls may include network isolation, enhanced monitoring, WAFs, and tighter access controls
- Document risk acceptance decisions with business justification and executive sign-off

### Security Requirements in RFPs
- Include specific security standards (encryption algorithms, authentication methods, logging requirements)
- Require compliance with relevant regulations (GDPR, HIPAA, PCI DSS)
- Specify right to audit and penetration test
- Define incident notification requirements and SLA terms
- Require secure development practices documentation from the vendor

### Managing Development Teams Securely
- Enforce separation of duties: developers should not test their own code or deploy to production
- Implement code review requirements before merging to main branches
- Use separate environments (dev, test, staging, production) with appropriate access controls
- Conduct security training for all developers, including secure coding practices and OWASP awareness
- Background checks for developers with access to sensitive systems or data

### Third-Party Code Risk
- All third-party code (libraries, frameworks, APIs) expands the attack surface
- Maintain an inventory of all third-party components (software bill of materials)
- Monitor for vulnerabilities in dependencies (automated dependency scanning)
- Evaluate the security practices and reputation of third-party code providers
- Have a plan for rapid response when a critical vulnerability is discovered in a dependency (e.g., Heartbleed, Log4Shell)

### When to Accept Risk in Software
- A manager might accept risk when the cost of remediation exceeds the expected loss
- Risk acceptance must be documented, approved by appropriate authority, and reviewed periodically
- Compensating controls should be identified and implemented when risk is accepted
- Never accept risk that violates legal or regulatory requirements

---

## 10. EXAM STRATEGY

### How Domain 8 Is Tested
- Domain 8 represents approximately 11% of the CISSP exam
- Questions tend to focus on:
  - SDLC phases and what security activities belong in each phase
  - Comparing development methodologies (especially waterfall vs. agile)
  - Database concepts (keys, normalization, ACID, aggregation vs. inference)
  - Maturity model level identification based on organizational descriptions
  - Secure coding practices (especially input validation and its role in preventing multiple attack types)
  - Change management components (request, change, release control)
  - Testing types and when to use them
  - OOP concepts (especially cohesion, coupling, inheritance, polymorphism)

### Question Patterns
- **"BEST" questions**: When asked what is the BEST defense against SQL injection, XSS, and buffer overflow simultaneously — the answer is usually **input validation** (the common root cause)
- **"FIRST" questions**: Security should be considered FIRST in the requirements/planning phase
- **"MOST LIKELY" questions**: When a user sees classified data they should not — think aggregation or inference depending on whether it involves SQL functions or deduction
- **Scenario-based**: You will be given descriptions of organizational processes and asked to identify the maturity level, development methodology, or security gap

### Wrong-Answer Traps
- **Technology solutions over process**: The exam favors managerial/process answers over specific technology products
- **Overly specific answers**: If an answer is too specific or technical when a broader principle applies, it is likely wrong
- **"Always" or "never"**: Absolute answers are typically incorrect; security is context-dependent
- **Security at the end**: Any answer suggesting security should be added after development is wrong
- **Fail-open preference**: Unless specifically justified by a multilayered architecture, fail-open is the wrong answer

### Time Management
- Do not overthink database math questions (cardinality, degree) — they are straightforward counting
- Maturity model questions require matching descriptions to levels — study the distinguishing characteristics
- For methodology questions, focus on the KEY differentiator (waterfall = sequential, spiral = risk-driven, agile = iterative sprints)

---

## 11. CROSS-DOMAIN CONNECTIONS

### Domain 3: Security Architecture and Engineering
- **Database systems** (section 3.5.3) overlap heavily with D8 database security concepts
- **Security models** (Bell-LaPadula, Biba) relate to multilevel database security and polyinstantiation
- **Defense in depth** is a design principle applied in secure software architecture
- **Threat modeling** (STRIDE, DREAD, PASTA) bridges architecture design and secure SDLC
- **Common Criteria** (evaluation assurance levels) connects to software certification and accreditation

### Domain 5: Identity and Access Management
- **Application authentication** methods (SSO, MFA, OAuth, SAML) are implemented in software
- **Session management** is both an IAM and secure coding concern
- **Access control models** (RBAC, ABAC, MAC) must be implemented correctly in application code
- **API authentication** (API keys, OAuth tokens) bridges D5 identity concepts with D8 API security

### Domain 6: Security Assessment and Testing
- **SAST, DAST, IAST, fuzz testing** — covered in both D6 (testing techniques) and D8 (development controls)
- **Penetration testing** of applications spans both domains
- **Code review** is both a D6 assessment technique and a D8 development practice
- **Vulnerability assessment** results feed back into the SDLC for remediation

### Domain 7: Security Operations
- **Change management** is covered in D7 (operational change control) and D8 (software change management)
- **Configuration management** spans both operational infrastructure (D7) and software configurations (D8)
- **Incident response** connects to application security monitoring and logging
- **Malware** (viruses, worms, trojans) is an operational concern (D7) with root causes in insecure development (D8)
- **Patch management** bridges operations (D7) with software maintenance (D8)
- **SOAR** tools are covered in both D7 and D8 contexts

### Domain 1: Security and Risk Management
- **Risk analysis** during SDLC requirements phase uses D1 risk management principles
- **Security governance** includes policies for secure software development
- **Third-party risk management** applies to software acquisition decisions
- **Due diligence/due care** standards apply to software vendor selection

### Domain 2: Asset Security
- **Data classification** determines security requirements for software handling different data types
- **Data lifecycle management** connects to software decommissioning and data sanitization
- **Data handling** requirements must be implemented in application code

### Domain 4: Communication and Network Security
- **Layer 7 (Application layer) attacks** originate from software vulnerabilities covered in D8
- **TLS/SSL** implementation in software is both a network security and secure coding concern
- **API security** over networks bridges D4 (transport) and D8 (application)

---

## 12. REAL-WORLD APPLICATION

### Heartbleed (2014)
- **What**: A buffer over-read vulnerability (CVE-2014-0160) in the OpenSSL library's implementation of the TLS heartbeat extension
- **Root Cause**: Missing bounds checking — the code failed to validate the length field in heartbeat requests, allowing attackers to read up to 64KB of server memory per request
- **Impact**: Exposed private keys, session cookies, passwords, and sensitive data on millions of servers worldwide
- **Lesson**: Third-party library vulnerabilities affect all systems that incorporate them; organizations must track dependencies and respond rapidly to library vulnerabilities; input validation and bounds checking are essential

### Equifax Breach (2017)
- **What**: Exploitation of a known Apache Struts vulnerability (CVE-2017-5638) that Equifax failed to patch
- **Root Cause**: Failure in patch management — the vulnerability was publicly known and a patch was available months before the breach
- **Impact**: Personal data of 147 million people exposed, including Social Security numbers
- **Lesson**: Patch management is critical; third-party software components must be monitored and updated; the SDLC does not end at deployment — operations and maintenance are security-critical phases

### SolarWinds Supply Chain Attack (2020)
- **What**: Attackers compromised the build process of SolarWinds' Orion software, inserting malicious code into legitimate software updates
- **Root Cause**: Compromise of the CI/CD pipeline and build environment
- **Impact**: Backdoor access to approximately 18,000 organizations, including U.S. government agencies
- **Lesson**: Secure the entire software supply chain, including build environments; code signing alone is insufficient if the build process is compromised; CI/CD pipeline security is critical

### Log4Shell (2021)
- **What**: Critical remote code execution vulnerability (CVE-2021-44228) in the Apache Log4j logging library
- **Root Cause**: The JNDI lookup feature allowed injection of arbitrary code through log messages
- **Impact**: Affected billions of devices and applications worldwide due to Log4j's ubiquitous use
- **Lesson**: Dependencies on widely-used libraries create systemic risk; organizations need software bills of materials (SBOMs) to quickly identify exposure; defense in depth (WAF, network segmentation) provides protection while patches are developed

### SQL Injection in the Real World
- SQL injection remains one of the most common web application attacks years after it was first identified
- Parameterized queries eliminate the root cause, yet many legacy and poorly maintained applications remain vulnerable
- Real-world examples include e-commerce sites where attackers extracted entire customer databases through unvalidated search fields
- Prevention requires developer education, code review, and automated scanning — not just network-level controls

### Buffer Overflow Exploits
- The Morris Worm (1988) exploited a buffer overflow in the Unix `finger` daemon — one of the first major internet security incidents
- Buffer overflows continue to be found in C/C++ applications that do not use bounds checking
- Modern mitigations like ASLR and DEP (Data Execution Prevention) significantly raise the bar for exploitation but do not eliminate the risk
- The fundamental solution is secure coding practices and use of memory-safe languages where possible

---

## 13. MEMORY AIDS AND MNEMONICS

### SDLC Phases
**"Real Architects Design Coded Tests Before Deploying Operating Disposals"**
- Requirements → Architecture/Design → Development/Coding → Testing → (Cert/Accred) → Deployment → Operations/Maintenance → Disposal

### SW-CMM Levels (1-5)
**"I Really Defined My Optimization"**
- **I**nitial → **R**epeatable → **D**efined → **M**anaged → **O**ptimizing

### CMMI Levels (0-5)
**"I Initially Managed Definitions, Quantified Optimization"**
- **I**ncomplete → **I**nitial → **M**anaged → **D**efined → **Q**uantitatively Managed → **O**ptimizing

### IDEAL Model
**"I Diagnose, Establish, Act, then Learn"**
- **I**nitiating → **D**iagnosing → **E**stablishing → **A**cting → **L**earning

### SW-CMM + IDEAL Combined (from Chapple)
**"I...I, Dr. Ed, am Lo(w)"**
- Extracts to: **I-I, D-R, E-D, A-M, L-O**
- Left column = IDEAL (Initiating, Diagnosing, Establishing, Acting, Learning)
- Right column = SW-CMM (Initial, Repeatable, Defined, Managed, Optimizing)

### ACID Properties
**"A Consistent, Isolated Database is Atomic and Durable"**
- **A**tomicity (all or nothing)
- **C**onsistency (rules maintained)
- **I**solation (transactions invisible until complete)
- **D**urability (committed = permanent)

### Database Terms
- **CARDinality** = number of **CARD**s (rows) stacked on a desk
- **DEGREE** = temperature **DEGREE** on a thermometer (column/vertical)
- **Tuple** = a **T**uple is a row (**T**rack horizontally)
- **Attribute** = a column (**A**ttribute = **A**djective describing the data field)

### OOP Concepts
**"MICE PAD"**
- **M**ethods (actions an object performs)
- **I**nheritance (child gets parent's methods)
- **C**ohesion (high = good, single purpose)
- **E**ncapsulation (data hiding, black box)
- **P**olymorphism (same message, different behavior)
- **A**bstraction (hiding complexity)
- **D**elegation (forwarding to another object)

### Coupling and Cohesion
**"Low Coupling, High Cohesion = LOVE CODE"**
- **LO**w coupling + high cohesion = good design
- Think: modules that "love" their own code (high cohesion) and are independent (low coupling)

### Change Management Components
**"RCR" = "Request, Change, Release"**
- **R**equest Control (users submit, managers analyze)
- **C**hange Control (developers build and test)
- **R**elease Control (approval, acceptance testing, deployment)

### Testing Types Spectrum
**"White sees all, Black sees nothing, Gray sees some"**
- **White box** = full code visibility (SAST)
- **Black box** = no code visibility (DAST)
- **Gray box** = partial visibility (IAST)

### OWASP Top 10 (2021 version as reference)
**"BAD SICS SILK"** (approximate mnemonic)
- **B**roken Access Control
- **A**uthentication failures (Cryptographic Failures)
- **D**ata Injection
- **S**ecurity Misconfiguration
- **I**nsecure Design
- **C**omponent vulnerabilities (Vulnerable/Outdated Components)
- **S**erver-Side Request Forgery
- **I**dentification and Authentication Failures
- **L**ogging and Monitoring Failures
- **K**nown Software and Data Integrity Failures

### Buffer Overflow Prevention
**"BASIC" protection**
- **B**ounds checking
- **A**SLR (Address Space Layout Randomization)
- **S**afe languages and libraries
- **I**mproved development processes
- **C**ode review

### Obfuscation Types (weakest to strongest)
**"LCD" (like a screen — harder to see through)**
- **L**exical (cosmetic changes — weakest)
- **C**ontrol flow (reordering logic)
- **D**ata (modifying data structures — conceptually strongest)

### API Security Controls
**"AEDQTV"** — sounds like "educate-v"
- **A**uthentication/Authorization (OAuth, API keys)
- **E**ncryption (TLS)
- **D**ata validation
- **Q**uotas and throttling
- **T**esting and validation
- (API) **G**ateways

---

## 14. PRACTICE QUESTION PATTERNS

### Pattern 1: Identify the Development Methodology
- Scenario describes a team's development approach
- Ask: which methodology is being used?
- Key differentiators: sequential (waterfall), risk-driven iterations (spiral), sprints with scrum master (Agile/Scrum), Dev + Ops unified (DevOps)
- Distractor: mixing up SAFe with basic Agile, or confusing DevOps with DevSecOps

### Pattern 2: Maturity Level Identification
- Scenario describes an organization's development process characteristics
- Ask: what SW-CMM or CMMI level is this?
- Key: "ad hoc, disorganized but gets work done" = Initial; "formal documented processes" = Defined; "quantitative metrics" = Managed/Quantitatively Managed; "continuous improvement" = Optimizing
- Distractor: confusing SW-CMM "Managed" (Level 4) with CMMI "Managed" (Level 2)

### Pattern 3: Database Concept Application
- Scenario involves database structure, keys, or security
- Ask: what type of key, what database attack, what integrity rule
- Common: foreign key enforces referential integrity (not entity integrity); aggregation uses SQL functions vs. inference uses reasoning
- Distractor: confusing cardinality (rows) with degree (columns)

### Pattern 4: Attack Identification
- Scenario describes a web application attack or database exploit
- Ask: what type of attack is this?
- XSS = script in web page; CSRF = forced action by authenticated user; SQL injection = database commands in input; directory traversal = ../ sequences
- Distractor: confusing persistent XSS (stored) with reflected XSS; confusing CSRF with XSS

### Pattern 5: Best Security Control
- Scenario describes a vulnerability (buffer overflow, SQLi, XSS)
- Ask: what is the BEST control?
- Input validation is frequently the answer when the question involves multiple vulnerability types
- Parameterized queries for SQL injection specifically
- Output encoding for XSS specifically
- ASLR or bounds checking for buffer overflows specifically
- Distractor: choosing a network control (firewall, IDS) over an application control (input validation)

### Pattern 6: Change Management Components
- Scenario describes a step in the change process
- Ask: which component is this? (Request Control, Change Control, or Release Control)
- Request Control = user-initiated, cost/benefit analysis, prioritization
- Change Control = developer builds solution, tests in non-production
- Release Control = final approval, acceptance testing, deployment; includes removal of debug code
- Distractor: confusing configuration management components with change management components

### Pattern 7: Testing Type Selection
- Scenario describes a testing situation
- Ask: what type of testing? (white/black/gray box, SAST/DAST, regression/UAT/unit/integration)
- Source code access = white box/SAST; no code access = black box/DAST; code visible during execution = gray box/IAST
- Comparing old vs. new behavior = regression testing; end-user validation = UAT
- Distractor: stating dynamic testing requires source code (it does not)

### Pattern 8: ACID Property Application
- Scenario involves a database transaction failure or behavior
- Ask: which ACID property is relevant?
- Mid-transaction failure and rollback = Atomicity
- Two transactions not interfering = Isolation
- Committed data survives crash = Durability
- Rules maintained throughout = Consistency
- Distractor: confusing Isolation with Atomicity

### Pattern 9: Secure Coding Practice
- Scenario describes a coding vulnerability or development decision
- Ask: what practice should be applied?
- Server-side input validation (never client-side only)
- Parameterized queries (not string concatenation for SQL)
- Fail-secure (not fail-open)
- Detailed errors to logs only (never to end users)
- Distractor: suggesting client-side validation as sufficient

### Pattern 10: Acquired Software Assessment
- Scenario involves purchasing or using third-party software
- Ask: what should the organization do?
- Always test for security vulnerabilities regardless of source
- Cannot do white-box testing on COTS (no source code access)
- Source code escrow protects against vendor failure
- Notify vendor and request patch for COTS vulnerabilities (cannot modify code yourself)
- Distractor: suggesting modifying COTS source code or ignoring open source security review

---

## 15. GAPS TO ADD

### Topics NOT Currently in Story Mode
The current story mode covers: Secure SDLC phases, OWASP Top 10 (all 10), Secure Coding Practices (parameterized queries, input validation, output encoding, error handling, session management), SAST/DAST/IAST, DevSecOps/CI/CD, and Shift Left principle.

**The following topics should be added to story mode:**

1. **Database Security Concepts**
   - Relational database structure (tables, tuples, attributes, keys)
   - Primary keys, foreign keys, entity integrity, referential integrity
   - ACID properties and their significance
   - Concurrency controls and locking mechanisms
   - Aggregation and inference attacks (with countermeasures)
   - Polyinstantiation as an inference defense
   - Database normalization (1NF, 2NF, 3NF basics)
   - NoSQL database types and security considerations
   - Database views for access control

2. **Development Methodologies (Deep Dive)**
   - Waterfall model specifics (seven stages, feedback loop limitation)
   - Spiral model (risk-driven iterations, prototyping, metamodel concept)
   - SAFe (Scaled Agile Framework) — four configurations and when to use them
   - Cleanroom development methodology
   - Structured Programming Development
   - Extreme Programming (XP)
   - RAD (Rapid Application Development)
   - When and why to combine methodologies

3. **Maturity Models**
   - SW-CMM five levels with distinguishing characteristics
   - CMMI six levels and how they differ from SW-CMM
   - SAMM five business functions (Governance, Design, Implementation, Verification, Operations)
   - IDEAL model phases
   - BSIMM as observational/benchmarking model

4. **Object-Oriented Programming Security**
   - Inheritance, encapsulation, polymorphism — security implications
   - Cohesion (high = good) and coupling (low = good)
   - Abstraction as a security mechanism
   - Delegation
   - Object-relational databases

5. **Code Obfuscation**
   - Three types: lexical, data, control flow
   - Purpose: prevent reverse engineering
   - Risk: disaster recovery impact (need software vault for unaltered code)

6. **Change Management (Detailed)**
   - Three components: Request Control, Change Control, Release Control
   - Configuration Management four components
   - Change Advisory Board (CAB) role
   - File integrity monitoring integration with change management

7. **Buffer Overflow (Deeper)**
   - How buffer overflows enable privilege escalation
   - ASLR mechanism and limitations
   - DEP (Data Execution Prevention)
   - Stack vs. heap overflows
   - Bounds checking implementation

8. **Knowledge-Based Systems / AI**
   - Expert systems (knowledge base + inference engine)
   - Machine learning (supervised vs. unsupervised)
   - Neural networks and deep learning (Delta rule)
   - AI applications in cybersecurity (anomaly detection, log analysis)

9. **Software Acquisition Security**
   - COTS evaluation process (pros/cons)
   - Open source evaluation process (pros/cons, Heartbleed case study)
   - Source code escrow agreements
   - Managed service provider assessment
   - Software assurance phases for acquisition

10. **Advanced Testing Concepts**
    - Fagan inspection (formal code review)
    - Use cases vs. misuse cases
    - Reasonableness checks
    - Separation of duties in testing
    - Regression testing vs. smoke testing vs. canary testing
    - Unit → Integration → System → UAT testing progression

11. **Covert Channels**
    - Storage covert channels
    - Timing covert channels
    - Detection and prevention methods

12. **TOCTOU / Race Conditions**
    - How the timing gap between check and use creates vulnerability
    - Real-world examples and prevention strategies

13. **Project Management Tools**
    - Gantt charts (timeline visualization)
    - PERT charts (task dependencies, critical path, estimation formula)

14. **Service-Level Agreements (SLAs)**
    - Key metrics (uptime percentage, maximum consecutive downtime)
    - Financial remedies
    - Security requirements in SLAs

15. **Software-Defined Security**
    - Security controls implemented through code
    - Cloud and virtualization contexts
    - Policy-driven security management
    - Integration with CI/CD pipelines

16. **Metadata**
    - Object-level metadata
    - Collection-level metadata
    - Methodological metadata
    - Security implications of metadata exposure

17. **Citizen Developers**
    - Risks of non-technical users with powerful development tools
    - Governance and training requirements
    - Shadow IT implications

18. **ODBC / Database Connectivity**
    - ODBC as proxy between applications and databases
    - Security considerations for database connectivity layers
