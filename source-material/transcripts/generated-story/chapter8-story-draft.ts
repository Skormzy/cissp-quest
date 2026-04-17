import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter8: DomainChapterDefinition = {
  domainId: 8,
  title: 'The Root Cause',
  location: 'Dev Lab, Austin',
  locationGradient: 'linear-gradient(135deg, #1a0f23 0%, #2a1a0f 50%, #1a0f1a 100%)',
  acts: [
    // ================================================================
    // ACT 1 — "The Vault Door Was Designed Last"
    // Concepts: SDLC Security Integration, Waterfall vs Agile security,
    // Threat Modeling (STRIDE), Secure Code Review, Security Requirements
    // ================================================================
    {
      actNumber: 1,
      title: 'The Vault Door Was Designed Last',
      description:
        'The forensic trail leads to Austin — the root cause was a code vulnerability in the Nexus authentication service, pushed without security review. Janet and Kai walk through SDLC security integration, threat modeling, and the cultural failure that let it ship.',
      xpReward: 150,
      conceptsCovered: [
        'SDLC Security Integration',
        'Waterfall vs Agile Security',
        'Threat Modeling (STRIDE)',
        'Secure Code Review',
        'Security Requirements Definition',
      ],
      estimatedMinutes: 20,
      nodes: [
        // ─── Transition ──────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd8a1-transition-1',
          location: 'Austin',
          description: 'Nexus Dev Lab — Austin, Texas',
          animation: 'slide',
          timeSkipText: '48 hours after initial containment — the investigation now moves upstream to the source code',
        },

        // ─── Dialogue 1 — Kai opens the dev lab briefing ─────────────
        {
          type: 'dialogue',
          id: 'd8a1-dialogue-1',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'We traced the vulnerability back to a commit made six weeks ago, {player}. A developer added a new authentication path for a partner integration. The code was reviewed by two developers and a QA engineer. Nobody asked: "how could someone abuse this?" That question — right there in the design phase — is the entire point of software security.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Dialogue 2 — Kai introduces SDLC analogy ────────────────
        {
          type: 'dialogue',
          id: 'd8a1-dialogue-2',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'Think of software development like building a secure safe room. You design the vault door during architectural planning — not after you\'ve built all the walls. If you install the walls first and add the security later, you\'re retrofitting — patching gaps in concrete instead of pouring the right foundation. Every phase of the SDLC has a security job.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Visual Aid — SDLC phases with security activities ────────
        {
          type: 'visualAid',
          id: 'd8a1-visual-1',
          title: 'SDLC Security Integration — "Building the Safe Room Right"',
          aidType: 'table',
          headers: ['SDLC Phase', 'Security Activity', 'What Happens if Skipped'],
          rows: [
            ['Requirements', 'Define security requirements (auth, authorization, encryption standards)', 'Security is bolted on at the end — expensive and incomplete'],
            ['Design', 'Threat modeling (STRIDE), security architecture review, trust boundary mapping', 'Attack surfaces are designed in, not out'],
            ['Development', 'Secure coding standards, peer code review for security, SAST', 'Vulnerabilities are written into the codebase'],
            ['Testing', 'DAST, penetration testing, fuzz testing, security regression tests', 'Vulnerabilities shipped to production'],
            ['Deployment', 'Environment hardening, secrets management, access controls on prod', 'Deployment process itself becomes an attack vector'],
            ['Maintenance', 'Patch management, vulnerability scanning, code re-review after changes', 'Drift and decay — the vault door rusts'],
          ],
          speaker: 'kai',
          dialogue:
            'The auth service commit skipped Design-phase threat modeling AND Development-phase secure code review. Both were optional under the team\'s Agile process. On the CISSP, "optional security review" is never the right answer.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Evidence 1 — Git commit and code review record ───────────
        {
          type: 'evidence',
          id: 'd8a1-evidence-1',
          title: 'Shadow Protocol — Root Cause Code Commit Analysis',
          classification: 'CONFIDENTIAL',
          content:
            'Analysis of the commit that introduced the exploited vulnerability. The change added an alternative authentication pathway for partner API integration. No threat model was produced. Code review checklist did not include security questions. No SAST tool was configured for the authentication service repository.',
          evidenceItems: [
            { label: 'Commit Hash', value: 'a3f9b17 — "Add partner SSO bypass for API integration"', highlight: true },
            { label: 'Reviewers', value: '2 developers approved — functional review only, no security checklist', highlight: true },
            { label: 'SAST Coverage', value: 'Auth service not included in CI/CD SAST pipeline — exclusion was undocumented', highlight: true },
            { label: 'Threat Model', value: 'None — team sprint cycle did not require threat modeling for "minor" feature additions', highlight: false },
            { label: 'Security Requirements', value: 'Partner SSO requirement did not include "must not bypass existing access controls" constraint', highlight: true },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'The attacker exploited the "SSO bypass" path. It was designed to allow a partner API to authenticate without a second factor. The developer assumed only authorized partners would use it. The attacker proved otherwise.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'angry',
        },

        // ─── Knowledge Check 1 — SDLC phase to address security reqs ──
        {
          type: 'knowledgeCheck',
          id: 'd8a1-kc-1',
          question:
            'Security requirements stating "all authentication paths must enforce MFA regardless of client type" would MOST appropriately be defined during which SDLC phase?',
          options: [
            'Testing — so QA can write test cases against them',
            'Requirements — so security constraints are established before design begins',
            'Development — so developers can implement them as they code',
            'Maintenance — so requirements can be updated based on operational experience',
          ],
          correctIndex: 1,
          explanation:
            'Security requirements belong in the Requirements phase — the earliest possible point in the SDLC. Defining them here ensures that design decisions accommodate security from the start, rather than retrofitting constraints onto existing design choices. Testing validates compliance with requirements that already exist. Development implements them. Maintenance reviews and updates them. Starting in Testing means the architecture may already violate the requirements.',
          memoryHack:
            'Safe room principle: decide "the door needs a vault lock" BEFORE the architect draws the wall. Requirements = the spec sheet. Design = the blueprint. If the spec sheet has no vault lock requirement, the blueprint won\'t include one.',
          conceptName: 'Security Requirements Definition',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Dialogue 3 — Janet joins and introduces STRIDE ──────────
        {
          type: 'dialogue',
          id: 'd8a1-dialogue-3',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Kai\'s covered the SDLC architecture. Let me talk about the specific threat modeling framework that should have been used here: STRIDE. It gives developers a structured checklist — six threat categories to evaluate against every feature they build. A ten-minute STRIDE review on that SSO bypass would have caught this immediately.',
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
          rightCharacter: 'kai_tanaka',
          rightExpression: 'neutral',
        },

        // ─── Evidence 2 — STRIDE threat model of the SSO bypass ───────
        {
          type: 'evidence',
          id: 'd8a1-evidence-2',
          title: 'Retrospective STRIDE Analysis — Partner SSO Bypass Feature',
          classification: 'CONFIDENTIAL',
          content:
            'STRIDE (Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege) applied retroactively to the partner SSO bypass feature. Every category had at least one unmitigated threat.',
          evidenceItems: [
            { label: 'S — Spoofing', value: 'THREAT: Attacker spoofs a "partner" API call by obtaining or forging a partner token. MISSED — no token validation check.', highlight: true },
            { label: 'T — Tampering', value: 'THREAT: Attacker modifies the bypass request payload to escalate scope. MISSED — no integrity check on bypass parameters.' },
            { label: 'R — Repudiation', value: 'THREAT: Bypass path had no audit logging — attacker\'s activity could not be traced. MISSED — bypass was completely invisible to the SIEM.', highlight: true },
            { label: 'I — Information Disclosure', value: 'THREAT: Error messages on the bypass path exposed internal schema names. MISSED — verbose errors in bypass exception handler.' },
            { label: 'D — Denial of Service', value: 'THREAT: Bypass path had no rate limiting — brute force possible. MISSED — rate limits applied only to the standard auth path.', highlight: false },
            { label: 'E — Elevation of Privilege', value: 'THREAT: Bypass granted partner-level scope that had not been reviewed against least-privilege principle. MISSED — partner scope was admin-equivalent.', highlight: true },
          ],
          speaker: 'janet',
          speakerSide: 'left',
          dialogue:
            'Six categories. Six threats. All six missed. A STRIDE review is a 10-minute conversation during a design meeting. The cost of skipping it was six months of unauthorized access.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 2 — STRIDE categories ───────────────────
        {
          type: 'knowledgeCheck',
          id: 'd8a1-kc-2',
          question:
            'A developer designs a new API endpoint that allows password resets without logging the action or requiring the user to confirm their identity via a second channel. Which STRIDE category does this PRIMARILY violate?',
          options: [
            'Spoofing — an attacker could impersonate the user to reset the password',
            'Repudiation — the lack of logging means the action cannot be attributed or denied',
            'Elevation of Privilege — password reset allows higher-privilege access',
            'Tampering — the reset token could be modified in transit',
          ],
          correctIndex: 1,
          explanation:
            'The PRIMARY concern described — "no logging" — is Repudiation. Repudiation threats involve the ability to deny performing an action. Without audit logging, a malicious user could reset someone\'s password and then claim it never happened. While Spoofing is also a concern (is this the real user?), the specific design flaw highlighted is the absence of a non-repudiable audit trail.',
          memoryHack:
            'STRIDE mnemonic: Spoofing=who you say you are, Tampering=changing data, Repudiation=denying you did it, Information Disclosure=leaking secrets, Denial of Service=making unavailable, Elevation=gaining unauthorized power. "No logging" = Repudiation.',
          conceptName: 'Threat Modeling (STRIDE)',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ─── Timed Decision — Waterfall vs Agile security decision ────
        {
          type: 'timedDecision',
          id: 'd8a1-td-1',
          scenario:
            'Nexus is debating whether to adopt an Agile development model for the rebuilt authentication service. The security team is concerned that Agile\'s fast sprint cycles will make thorough security reviews impossible. The development manager argues that Agile actually allows security issues to be caught earlier through continuous testing.',
          timeLimit: 30,
          conceptName: 'Waterfall vs Agile Security',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'neutral',
          options: [
            {
              text: 'Agile can be equally secure if security activities (threat modeling, SAST, security acceptance criteria) are embedded into each sprint rather than treated as a separate phase.',
              isOptimal: true,
              feedback:
                'Correct framing. Agile is not inherently less secure than Waterfall — it depends on whether security is embedded into the sprint cycle. Security user stories, automated SAST in the CI pipeline, and security acceptance criteria in Definition of Done make Agile security continuous. The Waterfall approach concentrates security review at the end, which can miss issues that compound across phases.',
              xpBonus: 25,
            },
            {
              text: 'Waterfall is always more secure for critical systems because it includes a dedicated security testing phase before deployment.',
              isOptimal: false,
              feedback:
                'Waterfall\'s dedicated security phase comes near the end — which means discovered vulnerabilities require expensive rework of earlier phases. Agile with embedded security ("shift-left") catches issues earlier, when they\'re cheaper to fix. Neither model is inherently more secure. The discipline applied within the model determines security outcomes.',
            },
            {
              text: 'The authentication service should be developed with no formal model — velocity is critical after the breach.',
              isOptimal: false,
              feedback:
                'Abandoning process in the name of speed after a security breach caused by process failure is the exact wrong lesson. Speed without discipline is how we got here.',
            },
          ],
        },

        // ─── Knowledge Check 3 — Secure code review purpose ──────────
        {
          type: 'knowledgeCheck',
          id: 'd8a1-kc-3',
          question:
            'Which of the following BEST describes the purpose of a security-focused code review, as distinct from a standard functional code review?',
          options: [
            'To verify that the code produces the correct output for valid inputs',
            'To identify logic errors that cause incorrect business calculations',
            'To detect security vulnerabilities such as injection flaws, insecure direct object references, and hardcoded credentials',
            'To assess code readability and adherence to style guides',
          ],
          correctIndex: 2,
          explanation:
            'A security-focused code review examines code for security vulnerabilities — input validation failures, authentication bypass flaws, hardcoded secrets, insecure API usage, and improper error handling. Functional code review verifies correct outputs for valid inputs. Logic error detection is part of functional testing. Code style is a quality review concern, not a security one.',
          memoryHack:
            'Security code review = asking "how can someone break this?" not "does this work?" The functional reviewer asks "will this add 2+2 correctly?" The security reviewer asks "what if someone passes 2+DROP TABLE instead of 2?"',
          conceptName: 'Secure Code Review',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },
      ],
    },

    // ================================================================
    // ACT 2 — "The Ten Most Wanted"
    // Concepts: OWASP Top 10, Database Security, DevSecOps,
    // Software Supply Chain Security (SBOM), Environment Separation
    // ================================================================
    {
      actNumber: 2,
      title: 'The Ten Most Wanted',
      description:
        'With the root cause identified, Janet and Kai rebuild the authentication service using DevSecOps principles — and discover a supply chain vulnerability in a third-party library that was never reviewed. The OWASP Top 10 becomes the team\'s hit list.',
      xpReward: 200,
      conceptsCovered: [
        'OWASP Top 10',
        'Database Security (Parameterized Queries, Polyinstantiation, Inference/Aggregation)',
        'DevSecOps (SAST/DAST in CI/CD)',
        'Software Supply Chain Security (SBOM)',
        'Environment Separation',
      ],
      estimatedMinutes: 25,
      nodes: [
        // ─── Transition ──────────────────────────────────────────────
        {
          type: 'transition',
          id: 'd8a2-transition-1',
          location: 'Austin',
          description: 'Nexus Dev Lab — Code Review Session — 72 hours after initial breach',
          animation: 'slide',
        },

        // ─── Dialogue 1 — Janet opens with OWASP analogy ─────────────
        {
          type: 'dialogue',
          id: 'd8a2-dialogue-1',
          speaker: 'janet',
          speakerSide: 'left',
          text: 'Now we rebuild — but this time we have a target list. OWASP publishes the Top 10 most commonly exploited web application vulnerabilities. Think of it as the ten most wanted lock failure modes that every thief knows. Our job is to make sure every one of them is locked down before the auth service goes back into production.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'player',
          rightExpression: 'neutral',
        },

        // ─── Evidence 1 — OWASP Top 10 status in Nexus codebase ──────
        {
          type: 'evidence',
          id: 'd8a2-evidence-1',
          title: 'OWASP Top 10 — Nexus Auth Service Audit Results',
          classification: 'CLASSIFIED',
          content:
            'Code audit of the authentication service against OWASP Top 10 (2021 edition). Results are preliminary — full DAST scan still in progress.',
          evidenceItems: [
            { label: 'A01 — Broken Access Control', value: 'VULNERABLE — SSO bypass granted admin-level access to partner tokens', highlight: true },
            { label: 'A02 — Cryptographic Failures', value: 'PARTIAL — tokens signed with HMAC-SHA1 (deprecated). Active sessions exposed in error logs.', highlight: true },
            { label: 'A03 — Injection', value: 'CLEAN — parameterized queries used consistently', highlight: false },
            { label: 'A07 — Auth and Session Failures', value: 'VULNERABLE — bypass path had no session timeout, no MFA enforcement', highlight: true },
            { label: 'A08 — Software Integrity Failures', value: 'UNDER REVIEW — third-party JWT library has unverified supply chain', highlight: true },
            { label: 'A09 — Logging and Monitoring Failures', value: 'VULNERABLE — bypass path generated no log entries', highlight: true },
          ],
          speaker: 'janet',
          speakerSide: 'left',
          dialogue:
            'Five of the top ten hit. This is what happens when a team treats OWASP Top 10 as optional reading.',
          leftCharacter: 'janet_park',
          leftExpression: 'angry',
        },

        // ─── Knowledge Check 1 — SQL injection and parameterized queries
        {
          type: 'knowledgeCheck',
          id: 'd8a2-kc-1',
          question:
            'A login form passes user input directly into a database query: `SELECT * FROM users WHERE username = \'' + username + '\'`. What is the MOST effective defense against injection attacks on this query?',
          options: [
            'Escaping special characters from user input before passing it to the query',
            'Using parameterized queries (prepared statements) to separate SQL code from user data',
            'Adding a web application firewall to filter malicious input before it reaches the database',
            'Validating that the username field only accepts alphanumeric characters',
          ],
          correctIndex: 1,
          explanation:
            'Parameterized queries (prepared statements) are the definitive defense against SQL injection because they structurally separate the SQL command from the user-supplied data. The database driver treats the user input as data — never as executable SQL code. Character escaping is brittle and can be bypassed. WAFs are a compensating control, not a primary defense. Input validation helps but does not cover all injection vectors. OWASP consistently names parameterized queries as the primary control.',
          memoryHack:
            'SQL injection = a spy slipping a note into the filing system by exploiting the courier\'s habit of accepting notes verbatim: "username=admin\'; DROP TABLE users; --". Parameterized queries = the courier puts your note in a sealed envelope and delivers it as data, never as instructions. The filing clerk never reads it as a command.',
          conceptName: 'OWASP Top 10',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Dialogue 2 — Kai introduces supply chain security ────────
        {
          type: 'dialogue',
          id: 'd8a2-dialogue-2',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'The A08 finding from Janet\'s audit is what keeps me up at night, {player}. The auth service uses a third-party JWT library pulled from a public package registry six months ago. We have no SBOM — no Software Bill of Materials. We don\'t even know what version it is, who maintains it, or whether it\'s been tampered with. We\'re trusting a library we\'ve never verified.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'worried',
          rightCharacter: 'player',
          rightExpression: 'surprised',
        },

        // ─── Evidence 2 — Supply chain / SBOM analysis ───────────────
        {
          type: 'evidence',
          id: 'd8a2-evidence-2',
          title: 'Third-Party Library Supply Chain Analysis — JWT Library',
          classification: 'TOP SECRET',
          content:
            'Initial supply chain investigation of the JWT library used in the Nexus auth service. An SBOM (Software Bill of Materials) would have provided an inventory of all components, their versions, and known vulnerabilities — equivalent to a restaurant\'s ingredients list that lets you spot recalled items before they reach the table.',
          evidenceItems: [
            { label: 'Library Version', value: 'jwt-auth v2.1.3 — pulled 6 months ago, 3 major versions behind current', highlight: true },
            { label: 'Published CVEs', value: '2 known CVEs against v2.1.x — both rated CVSS 7.5 HIGH. No mitigation applied.', highlight: true },
            { label: 'Checksum Verification', value: 'FAILED — package hash does not match registry hash. Possible tampering or corruption.', highlight: true },
            { label: 'Maintainer Status', value: 'Repository archived 8 months ago — no active security patches being issued', highlight: false },
            { label: 'SBOM on File', value: 'NONE — no software bill of materials maintained for any Nexus service', highlight: true },
          ],
          speaker: 'kai',
          speakerSide: 'left',
          dialogue:
            'The checksum mismatch is the most alarming finding. Someone, somewhere in the supply chain, may have modified this library. We\'re quarantining the service until we can verify the full dependency tree.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 2 — SBOM purpose ────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'd8a2-kc-2',
          question:
            'Which of the following BEST describes the security benefit of maintaining an SBOM (Software Bill of Materials)?',
          options: [
            'It prevents developers from using open-source libraries with known vulnerabilities',
            'It enables rapid identification of systems affected when a new vulnerability is disclosed in a component',
            'It replaces the need for vulnerability scanning of production systems',
            'It provides legal protection against liability for third-party component defects',
          ],
          correctIndex: 1,
          explanation:
            'An SBOM\'s primary security value is rapid impact assessment — when a new CVE is published for a component (like Log4Shell), organizations with SBOMs can immediately query the inventory to identify exactly which systems use that component and in which versions. Without an SBOM, this requires manual audit across the entire codebase. SBOMs do not prevent usage of vulnerable libraries or replace vulnerability scanning; they complement it.',
          memoryHack:
            'SBOM = the ingredients list. When the FDA recalls a specific lettuce batch, restaurants with accurate inventory lists know immediately which dishes to pull. Organizations with SBOMs know immediately which services use Log4j 2.0-2.14. No SBOM = checking every dish by hand.',
          conceptName: 'Software Supply Chain Security',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ─── Think Like Manager — DevSecOps pipeline decision ─────────
        {
          type: 'thinkLikeManager',
          id: 'd8a2-tlatm-1',
          scenario:
            'The development team proposes rebuilding the CI/CD pipeline with integrated security gates: SAST after every commit, DAST after every build, and SBOM generation before any deployment. The development manager warns that this will add 45 minutes to every deployment cycle and developers will "code around" failing security gates to maintain sprint velocity.',
          question:
            'As the security manager, what is the BEST response to the development manager\'s concern?',
          options: [
            'Agree — developer velocity is more important than security gates in Agile environments',
            'Make all security gates advisory (warnings only) — developers can acknowledge and override',
            'Tune security gates to block only critical and high findings; medium and low generate alerts but do not block deployment',
            'Remove DAST from the pipeline — it is too slow for CI/CD cadence',
          ],
          correctIndex: 2,
          explanation:
            'Tuning security gates to block on critical/high and alert on medium/low balances security with velocity. Blocking on every low-severity finding creates noise and encourages developers to bypass gates entirely — the behavior the manager correctly identifies. Pure advisory gates (option B) means critical vulnerabilities ship to production routinely. Removing DAST entirely (option D) eliminates the only runtime security check in the pipeline.',
          managerInsight:
            'DevSecOps is a cultural as much as a technical challenge. Security gates that are too aggressive get bypassed. Security gates that are too permissive stop being gates. The manager\'s goal is to make security frictionless for low-risk code and unavoidable for high-risk code. CVSS-threshold gating is the standard answer — block on critical/high, alert on medium/low, and track low findings as tech debt.',
          conceptName: 'DevSecOps',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
          rightCharacter: 'kai_tanaka',
          rightExpression: 'thinking',
        },

        // ─── Dialogue 3 — Kai on database security ───────────────────
        {
          type: 'dialogue',
          id: 'd8a2-dialogue-3',
          speaker: 'kai',
          speakerSide: 'left',
          text: 'While Janet works on the DevSecOps rebuild, I want to talk to you about something that almost made this breach far worse. The attacker got database access. But because of one specific control — database polyinstantiation — they couldn\'t easily aggregate the data they were looking for. That control probably saved us millions in damages.',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'thinking',
        },

        // ─── Knowledge Check 3 — Database security concepts ──────────
        {
          type: 'knowledgeCheck',
          id: 'd8a2-kc-3',
          question:
            'An attacker with read access to a database queries multiple low-sensitivity tables and combines the results to deduce confidential salary information that no individual table would reveal. Which database security threat does this represent?',
          options: [
            'SQL Injection — the attacker is manipulating queries to access unauthorized data',
            'Aggregation Attack — combining individually harmless data points to reveal classified information',
            'Inference Attack — using observed query results to guess the value of concealed data',
            'Polyinstantiation — creating multiple instances of a record with different sensitivity levels',
          ],
          correctIndex: 1,
          explanation:
            'Aggregation is the threat of combining individually non-sensitive data points to derive sensitive information. The classic example: employee name (not sensitive) + department (not sensitive) + location (not sensitive) + salary band (not sensitive) can be combined to identify specific individuals\' salaries even when no salary field is directly accessible. Inference is related but involves deducing values from indirect evidence (e.g., "the query returned 0 results, so the salary must not be in the range I tested"). Polyinstantiation is a countermeasure, not a threat.',
          memoryHack:
            'Aggregation = the puzzle attack. No single piece reveals the picture. But combine enough innocent pieces and the classified image appears. Defense: data minimization, query result restrictions, and user-level data lake separation.',
          conceptName: 'Database Security',
          speaker: 'kai',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ─── Visual Aid — Environment separation table ─────────────────
        {
          type: 'visualAid',
          id: 'd8a2-visual-1',
          title: 'Environment Separation — Dev / Test / Staging / Production',
          aidType: 'table',
          headers: ['Environment', 'Purpose', 'Real Production Data?', 'Security Level'],
          rows: [
            ['Development', 'Active coding and unit testing', 'Never — synthetic data only', 'Lowest — developer laptops, loose controls'],
            ['Test / QA', 'Functional and integration testing', 'Never — anonymized or generated data', 'Medium — controlled access, no prod secrets'],
            ['Staging', 'Pre-production validation with production-equivalent config', 'Never — anonymized production copy at most', 'High — mirrors production security controls'],
            ['Production', 'Live customer-facing systems', 'Yes — real PII and business data', 'Highest — full controls, restricted access, audited'],
          ],
          speaker: 'janet',
          dialogue:
            'The developer who introduced the vulnerability had been testing changes directly in a staging environment that shared the production database — a critical environment separation failure. The \'staging\' system had real customer PII. That\'s not staging. That\'s production with a different name.',
          leftCharacter: 'janet_park',
          leftExpression: 'serious',
        },

        // ─── Knowledge Check 4 — Environment separation ───────────────
        {
          type: 'knowledgeCheck',
          id: 'd8a2-kc-4',
          question:
            'A developer uses a copy of the live production database containing real customer PII in their local development environment for testing. What is the MOST significant risk this creates?',
          options: [
            'The developer may introduce performance bottlenecks from test queries on production data',
            'Real customer data is exposed in a low-security environment, violating data minimization and increasing breach risk',
            'Development environments typically have older software versions that may conflict with production',
            'Test data modifications could inadvertently propagate to production through database replication',
          ],
          correctIndex: 1,
          explanation:
            'Using real PII in development environments violates the principle of data minimization and massively expands the blast radius of a developer laptop compromise. Developer environments have few security controls, are often on personal devices, and are frequently exposed to public networks. Real customer PII belongs only in production — all other environments use synthetic or properly anonymized data. Privacy regulations (GDPR, PIPEDA) treat developer laptops containing production PII as a reportable data exposure risk.',
          memoryHack:
            'Dev environment + real PII = bank vault with a screen door. Production has guards, cameras, and steel walls. A developer\'s laptop has none of those. Never move the gold to the garden shed to count it. Use fake gold for practice.',
          conceptName: 'Environment Separation',
          speaker: 'janet',
          leftCharacter: 'janet_park',
          leftExpression: 'thinking',
        },

        // ─── Transition — Closing the investigation ───────────────────
        {
          type: 'transition',
          id: 'd8a2-transition-2',
          location: 'New York',
          description: 'Nexus HQ — Director Reeves\' Office — The Final Debrief',
          animation: 'fade',
          timeSkipText: '7 days after initial compromise — Operation Shadow Protocol officially closed',
        },

        // ─── Dialogue 4 — Reeves delivers the closing assessment ──────
        {
          type: 'dialogue',
          id: 'd8a2-dialogue-4',
          speaker: 'reeves',
          speakerSide: 'left',
          text: '{player}, in seven days you\'ve traced this breach from a CVSS 8.8 authentication vulnerability in Tel Aviv, through a live incident response in New York, to a failed SDLC process in Austin. You\'ve seen every domain of the CISSP in action — not as concepts, but as real failures with real consequences. That\'s the education no exam can give you.',
          leftCharacter: 'director_reeves',
          leftExpression: 'serious',
          rightCharacter: 'player',
          rightExpression: 'neutral',
        },

        // ─── Dialogue 5 — Reeves closes with player choice ────────────
        {
          type: 'dialogue',
          id: 'd8a2-dialogue-5',
          speaker: 'reeves',
          speakerSide: 'left',
          text: 'Operation Shadow Protocol is closed. The vulnerabilities are patched. The processes are fixed. The people responsible for the gaps have been retrained. But the work of a security professional is never done. The next attacker is already planning their next move. What you\'ve learned here is your most durable weapon.',
          leftCharacter: 'director_reeves',
          leftExpression: 'neutral',
          rightCharacter: 'player',
          rightExpression: 'smile',
          choices: [
            {
              text: '"I\'m ready for whatever comes next, Director."',
              response: 'Reeves allows a rare, genuine smile. "Good. Because there\'s always a next one. And now you\'ll see it coming."',
              xpBonus: 50,
            },
            {
              text: '"This investigation changed how I think about security entirely."',
              response: '"That\'s the mark of a real security professional, {player}. You stopped seeing threats as technical problems and started seeing them as human ones. Systems fail because people fail. Fix the people and the processes — the technology follows."',
              xpBonus: 50,
            },
          ],
        },
      ],
    },

    null,
    null,
    null,
  ],
};
