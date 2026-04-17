import type { DomainChapterDefinition } from '@/lib/story-types';

export const chapter2: DomainChapterDefinition = {
  domainId: 2,
  title: 'The Data Vault',
  location: 'Data Vault, New Jersey',
  locationGradient: 'linear-gradient(135deg, #1a1f35 0%, #0d1b2a 50%, #1a2f1a 100%)',
  acts: [
    // ─── ACT 1: The Classification Failure ───────────────────────────────────
    {
      actNumber: 1,
      title: 'The Classification Failure',
      description: 'Discover how a mislabeled dataset enabled the breach at the Nexus Data Vault.',
      xpReward: 150,
      conceptsCovered: ['Data Classification', 'Data Ownership Roles', 'Data States', 'Data Lifecycle'],
      estimatedMinutes: 20,
      nodes: [
        // ── Transition: Arrival ─────────────────────────────────────────────
        {
          type: 'transition',
          id: 'ch2-act1-transition-arrival',
          location: 'Nexus Data Vault — Newark, New Jersey',
          description: 'Fourteen floors underground. The largest private data repository on the Eastern Seaboard. Three petabytes of customer records, financial transactions, and classified analytics. And somewhere in this vault, a label was wrong.',
          animation: 'glitch',
          timeSkipText: '06 hours after the breach alert',
        },

        // ── Dialogue 1: Kai briefs the player ───────────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act1-d1',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "{player}. Welcome to the part of this job nobody glamorizes — data hygiene. I know what you're thinking. How does a labeling error cause a breach of this scale? Stick with me. You ever seen a bank vault where every safe-deposit box has its own tier? Platinum, gold, silver, standard. The tier determines who can touch it, how it's handled, and what happens if the box goes missing. Nexus runs the same system. Except someone put a platinum-tier box in the standard rack.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Dialogue 2: Player asks what was mislabeled ─────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act1-d2',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "A customer dataset containing full names, Social Security numbers, and transaction histories for 2.3 million clients. Classified as Public. Routed through an unauthenticated API endpoint that any registered developer could call. The data was right there — no credentials required. Not because the attacker was clever. Because a tag said it was fine to share.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'angry',
        },

        // ── Evidence 1: Incident log ─────────────────────────────────────────
        {
          type: 'evidence',
          id: 'ch2-act1-e1',
          title: 'Nexus Data Vault — Incident Report NV-2247',
          classification: 'CLASSIFIED',
          content: `## Data Exposure Event — Classification Failure\n\nOn April 14, the automated data pipeline ingested a refreshed customer dataset and applied classification metadata from the upstream CRM export. The CRM export contained a field called \`data_sensitivity\` with the value \`PUBLIC\`. The vault's access control layer trusted this tag without verification.\n\n**Result:** 2.3M records were assigned to the Public data tier and exposed via the Developer API for 11 hours before detection.\n\n**Root cause:** No secondary review gate existed for classification tags on inbound datasets. The Data Owner had not approved the tag. The Data Custodian accepted it automatically.`,
          evidenceItems: [
            { label: 'Records Exposed', value: '2,312,447', highlight: true },
            { label: 'Exposure Window', value: '11 hours, 14 minutes' },
            { label: 'Classification Applied', value: 'PUBLIC (incorrect)', highlight: true },
            { label: 'Correct Classification', value: 'CONFIDENTIAL' },
            { label: 'Data Owner Approval', value: 'Not obtained', highlight: true },
            { label: 'Custodian Override', value: 'None — automated acceptance' },
          ],
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          dialogue: "Here's the paper trail. The tag came in wrong. The system accepted it. No human ever looked. That's the failure — not the attacker's sophistication.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Visual Aid: Classification levels comparison ─────────────────────
        {
          type: 'visualAid',
          id: 'ch2-act1-va1',
          title: 'Data Classification Levels: Government vs. Commercial',
          aidType: 'comparison',
          headers: ['Level', 'Government Label', 'Commercial Label', 'Who Can Access'],
          rows: [
            ['Highest', 'Top Secret', 'Confidential', 'Strictly need-to-know; board/executive approval'],
            ['High', 'Secret', 'Private', 'Senior staff with formal clearance or NDA'],
            ['Medium', 'Confidential', 'Sensitive', 'Cleared employees within the relevant department'],
            ['Lowest', 'Unclassified', 'Public', 'Anyone — customers, partners, general public'],
          ],
          speaker: 'Kai Tanaka',
          dialogue: "Think of these tiers as the safe-deposit box system I mentioned. Every piece of data gets assigned one shelf in that vault. The label on the box controls who holds a key.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ── Knowledge Check 1: Classification levels ─────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act1-kc1',
          question: "In a commercial data classification scheme, which level sits directly below Confidential and is typically used for internal employee data not intended for public release?",
          options: [
            'Public',
            'Sensitive',
            'Private',
            'Restricted',
          ],
          correctIndex: 2,
          explanation: "Commercial classification typically uses four levels: Confidential (highest), Private, Sensitive, and Public. 'Private' covers internal data — employee records, internal financials — that isn't secret but isn't for external eyes. Sensitive sits one tier lower and covers data that could cause limited harm if disclosed. Public is the lowest tier.",
          memoryHack: "The vault tiers from top to bottom: C-P-S-P. Confidential vault is sealed. Private is staff-only. Sensitive is sign-in required. Public is the lobby.",
          conceptName: 'Commercial Data Classification',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Dialogue 3: Kai introduces ownership roles ───────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act1-d3',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "Now here's where it gets interesting. The tag was wrong — but whose fault is that? In any solid data governance framework, four roles share responsibility for every dataset. The breakdown of who did what — and who failed to act — tells us exactly where this case cracks open.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Visual Aid: Ownership roles ──────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch2-act1-va2',
          title: 'Data Roles: Who Does What',
          aidType: 'list',
          items: [
            {
              label: 'Data Owner',
              description: 'The senior executive or department head who is accountable for the data. They define the classification, approve access policies, and are ultimately responsible if it leaks. Think: the client who rents the safe-deposit box. They decide what goes in it and who else gets a key.',
            },
            {
              label: 'Data Custodian',
              description: 'The IT or operations team that physically manages and protects the data according to the Owner\'s instructions. They run backups, enforce access controls, and maintain storage systems. Think: the bank vault manager — they enforce the rules the client sets, but they don\'t own what\'s in the box.',
            },
            {
              label: 'Data Steward',
              description: 'The subject-matter expert who maintains data quality, accuracy, and consistency. They ensure the data means what it\'s supposed to mean. Think: the bank\'s auditor who checks the vault records are correctly labeled and inventoried.',
            },
            {
              label: 'Data User',
              description: 'Anyone with legitimate access to the data for their job. They use it — they don\'t govern it. They carry responsibility to handle it appropriately within their access rights.',
            },
          ],
          speaker: 'Kai Tanaka',
          dialogue: "In this breach, the Data Owner never approved the classification tag. The Custodian accepted it automatically. The Steward had no alert to review it. Classic role failure — not a system failure.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Knowledge Check 2: Ownership roles ──────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act1-kc2',
          question: "The IT security team implements encryption on the customer database and performs nightly backups per policy. Which data role does this team fulfill?",
          options: [
            'Data Owner — they control the data\'s use',
            'Data Custodian — they protect and manage it on the Owner\'s behalf',
            'Data Steward — they ensure data quality',
            'Data User — they access the data for business operations',
          ],
          correctIndex: 1,
          explanation: "The Data Custodian implements and operates the technical controls that the Data Owner mandates. Encryption, backup, and access enforcement are custodian duties. The Data Owner decides the policy; the Custodian executes it. The IT team here is the vault manager — they run the vault, but the client owns the contents.",
          memoryHack: "Owner = Accountable. Custodian = Operational. Steward = Quality. User = Consumer. The Owner sets the rules. The Custodian follows them.",
          conceptName: 'Data Ownership Roles',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ── Evidence 2: Data state analysis ─────────────────────────────────
        {
          type: 'evidence',
          id: 'ch2-act1-e2',
          title: 'Data State Analysis — Vault Forensics Log',
          classification: 'CONFIDENTIAL',
          content: `## Three States of the Exposed Data\n\nForensic review identified that the exposed dataset transitioned through all three data states during the breach window.\n\n### Data at Rest\nStored in the vault's encrypted SSD array. Access controlled by classification tier. The mislabeled data was stored under the Public tier with insufficient encryption strength (AES-128 vs required AES-256 for Confidential).\n\n### Data in Transit\nTransmitted via the Developer API over HTTPS. However, no token-based authorization was required for Public-tier endpoints — only an API key, which is issued to any registered developer account.\n\n### Data in Use\nLogs confirm the attacker's application loaded and processed approximately 400,000 records during peak query windows. Once in use inside the attacker's environment, vault protections no longer applied.`,
          evidenceItems: [
            { label: 'At Rest Encryption', value: 'AES-128 (insufficient for Confidential)', highlight: true },
            { label: 'In Transit Protection', value: 'HTTPS — but no authorization on Public endpoints', highlight: true },
            { label: 'In Use Controls', value: 'None — once exfiltrated, vault has no reach' },
            { label: 'Records Queried by Attacker', value: '~400,000 before detection' },
          ],
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          dialogue: "Three states. Three different protection requirements. The mislabel cascaded into weaker encryption at rest, no auth in transit, and zero visibility once the data was in use. One wrong tag. Three failure modes.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'worried',
        },

        // ── Knowledge Check 3: Data states ──────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act1-kc3',
          question: "An attacker intercepts a TLS-encrypted session and attempts a decryption attack. Which data state is the attacker targeting?",
          options: [
            'Data at rest — targeting stored database records',
            'Data in transit — targeting data moving across the network',
            'Data in use — targeting data loaded in application memory',
            'Data at disposal — targeting data during secure deletion',
          ],
          correctIndex: 1,
          explanation: "Data in transit is data moving between systems — across a network connection, API call, or file transfer. TLS protects data in transit. Attacking TLS means targeting data while it moves. Data at rest is stored (database, disk). Data in use is actively loaded in memory or being processed by an application.",
          memoryHack: "REST = stored on a shelf. TRANSIT = traveling by courier. USE = in someone's hands being read. Each state needs its own protection.",
          conceptName: 'Data States',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Think Like a Manager: Classification decision ─────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch2-act1-tlm1',
          scenario: "Your organization's data pipeline automatically ingests customer records from three partner systems. Each partner tags their data with a sensitivity label using their own internal classification scheme. Your vault system is designed to accept these tags and route data accordingly.",
          question: "As Data Owner for your vault, what is the MOST appropriate governance control to implement?",
          options: [
            'Trust partner classification tags — they know their own data',
            'Require a human Data Owner review and approval for any inbound classification assignment before the data enters the vault',
            'Implement an automated re-classification engine that overrides partner tags based on data content scanning',
            'Enforce the strictest classification tier on all inbound data regardless of partner labels',
          ],
          correctIndex: 1,
          explanation: "The Data Owner is ultimately accountable for data within their vault. Accepting external classification tags without review means ceding accountability to a third party. Human review at the gate ensures the Owner approves every classification decision — which is their responsibility. Automated re-classification can supplement human review but cannot replace it for accountability purposes. Blanket strict classification creates operational overload and obscures legitimate sensitivity distinctions.",
          managerInsight: "A manager never outsources accountability. The classification tag is a policy decision, not a technical one. Whoever is accountable for the breach will be asked: 'Did you approve this?' Your answer needs to be yes.",
          conceptName: 'Data Owner Accountability',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Dialogue 4: Data lifecycle ───────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act1-d4',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "Before we move to the vault's lower levels, one more concept. Every dataset has a lifespan — a full life cycle from the moment it's created to the moment it's securely destroyed. Classification applies at creation and must be reviewed at each phase. The breach data? It was in the 'active operations' phase. Nobody had reviewed its classification since initial setup eighteen months ago. The business had changed. The sensitivity had not.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ── Visual Aid: Data Lifecycle ───────────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch2-act1-va3',
          title: 'Data Lifecycle Phases',
          aidType: 'list',
          items: [
            { label: 'Create / Collect', description: 'Data is generated, received, or ingested. Classification must be assigned at this phase — not retroactively.' },
            { label: 'Store', description: 'Data persists in a system. Encryption, access controls, and backup requirements apply based on classification.' },
            { label: 'Use', description: 'Data is accessed and processed for business purposes. Least privilege controls who can use what.' },
            { label: 'Share / Transmit', description: 'Data moves between systems or parties. Transit encryption and authorization controls activate.' },
            { label: 'Archive', description: 'Data is retained but no longer actively used. Retention schedules and legal holds may apply.' },
            { label: 'Destroy', description: 'Data reaches end of life. Destruction method must match classification — simple delete is insufficient for Confidential data.' },
          ],
          speaker: 'Kai Tanaka',
          dialogue: "Classification isn't a one-time stamp. It's a living label that should be revisited at every phase transition. Especially when the business context changes.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Timed Decision 1: Classification failure response ─────────────────
        {
          type: 'timedDecision',
          id: 'ch2-act1-td1',
          scenario: "Kai alerts you: the automated pipeline is currently ingesting a new batch of records tagged 'PUBLIC' by the upstream partner. The batch contains what appears to be employee compensation data. You have 30 seconds before it routes to the Public API endpoint.",
          timeLimit: 30,
          options: [
            {
              text: 'Halt the pipeline and quarantine the batch pending Data Owner review',
              isOptimal: true,
              feedback: "Correct. When classification is in doubt, halt and escalate. The Data Owner must approve any classification assignment — especially one this sensitive. Speed is never worth accountability loss.",
              xpBonus: 50,
            },
            {
              text: 'Override the tag to Confidential automatically — it\'s clearly wrong',
              isOptimal: false,
              feedback: "Well-intentioned but procedurally wrong. You don't have Data Owner authority to reclassify data unilaterally. Your override could mask the upstream error and set a precedent for bypassing governance.",
            },
            {
              text: 'Allow it through — the partner system classified it, they have accountability',
              isOptimal: false,
              feedback: "Wrong. You cannot delegate accountability for data inside your vault to an external party. The Data Owner in your organization is responsible for everything stored here, regardless of who tagged it.",
            },
            {
              text: 'Flag it in the audit log but allow it through to avoid disrupting operations',
              isOptimal: false,
              feedback: "Logging without action is documentation of a failure, not a control. The audit log captures what happened — it doesn't prevent the harm.",
            },
          ],
          conceptName: 'Data Classification Governance',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },
      ],
    },

    // ─── ACT 2: The Vault Investigation ──────────────────────────────────────
    {
      actNumber: 2,
      title: 'The Vault Investigation',
      description: 'Dig into the vault\'s data protection and privacy controls — and find what else the attacker accessed.',
      xpReward: 200,
      conceptsCovered: ['Data Retention', 'Data Destruction', 'Pseudonymization', 'Tokenization', 'Anonymization', 'DLP', 'Labeling vs Marking'],
      estimatedMinutes: 25,
      nodes: [
        // ── Transition: Deeper into the vault ───────────────────────────────
        {
          type: 'transition',
          id: 'ch2-act2-transition-lower',
          location: 'Nexus Data Vault — Sub-Level 4, Long-Term Retention Archive',
          description: 'The elevator descends past the active operations floors. Down here, the servers hum differently — slower, colder. This is where data comes to wait. Some of it has been waiting too long.',
          animation: 'fade',
          timeSkipText: '2 hours later',
        },

        // ── Dialogue 1: Kai on retention ─────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act2-d1',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "The attacker didn't just grab live customer data. They found this floor. Sub-Level 4. Archives. Some of these records are seven years old. The company kept them because — honestly? Nobody had a policy that said to destroy them. And in data security, 'we forgot to delete it' is not a legal defense.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Evidence 1: Retention policy gap ─────────────────────────────────
        {
          type: 'evidence',
          id: 'ch2-act2-e1',
          title: 'Archive Audit — Sub-Level 4 Retention Review',
          classification: 'CONFIDENTIAL',
          content: `## Long-Term Archive Inventory\n\nForensic inventory of Sub-Level 4 reveals data retained well beyond business need and legal requirement:\n\n| Dataset | Age | Legal Requirement | Status |\n|---|---|---|---|\n| Customer transaction records | 7 years | 5 years (IRS) | **Overdue for destruction** |\n| Employee PII — terminated staff | 9 years | 7 years (EEOC) | **Overdue for destruction** |\n| Incident logs — legacy system | 4 years | 3 years (policy) | **Overdue for destruction** |\n| Financial audit records | 3 years | 7 years (SOX) | Active legal hold — retain |\n\nThe attacker accessed all overdue datasets. None had been degaussed, overwritten, or destroyed. All were still fully readable.`,
          evidenceItems: [
            { label: 'Datasets Overdue for Destruction', value: '3 of 4 reviewed', highlight: true },
            { label: 'Oldest Exposed Record', value: '9 years old (employee PII)', highlight: true },
            { label: 'Active Legal Hold (correct)', value: 'Financial audit records — properly retained' },
            { label: 'Destruction Policy', value: 'Exists on paper — never enforced' },
          ],
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          dialogue: "Think of this floor like a police evidence room. You can't destroy evidence until the case closes. But when the case is closed? You destroy it. These datasets had their cases closed years ago. Someone just never pulled the trigger.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'angry',
        },

        // ── Knowledge Check 1: Retention ────────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act2-kc1',
          question: "A legal hold has been issued for all records related to an ongoing regulatory investigation. The normal retention schedule would require destruction of the relevant dataset next month. What is the correct action?",
          options: [
            'Destroy the data on schedule — legal holds only apply to physical documents',
            'Destroy the data as scheduled but retain the metadata only',
            'Suspend the destruction schedule for all records covered by the legal hold until the hold is lifted',
            'Transfer the data to an external counsel\'s system and delete your copy',
          ],
          correctIndex: 2,
          explanation: "A legal hold (also called a litigation hold) suspends the normal retention and destruction schedule for any records relevant to anticipated or active legal proceedings. Destroying records under legal hold is evidence tampering. The hold must be formally lifted before destruction can resume. This applies to all formats — digital and physical.",
          memoryHack: "Legal hold = evidence room padlock. Until the case closes and the padlock is removed, nothing leaves that room. Normal schedules are irrelevant while the lock is on.",
          conceptName: 'Data Retention and Legal Holds',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Dialogue 2: Moving to destruction methods ─────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act2-d2',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "Here's what gets people — they think 'delete' means 'gone.' It doesn't. On a magnetic drive, delete just removes the address marker. The data is still physically on the platter. You need to actually destroy the information, and the method depends on the media and the classification level. Let me show you what the vault's destruction bay looks like — or should look like.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Visual Aid: Destruction methods ─────────────────────────────────
        {
          type: 'visualAid',
          id: 'ch2-act2-va1',
          title: 'Data Destruction Methods by Media Type',
          aidType: 'table',
          headers: ['Method', 'How It Works', 'Best For', 'Limitations'],
          rows: [
            ['Overwriting (Wiping)', 'Writes random patterns over all storage locations multiple times (DoD 5220.22-M: 7-pass)', 'HDDs, SSDs, USB drives still in service', 'May not reach all bad sectors on flash media; not suitable for classified'],
            ['Degaussing', 'Applies a powerful magnetic field that randomizes and destroys the magnetic domain structure', 'Magnetic HDDs and tape media', 'Destroys the drive — it cannot be reused. Does NOT work on SSDs or optical media.'],
            ['Physical Destruction', 'Shredding, crushing, incineration, or disintegration of the media itself', 'All media types; required for Top Secret/classified', 'Creates e-waste; needs certified destruction vendor for classified material'],
            ['Cryptographic Erasure', 'Delete the encryption key — without the key, the ciphertext is unreadable', 'Cloud storage; encrypted SSDs; large-scale disposal', 'Only valid if data was encrypted from inception; relies on key management integrity'],
          ],
          speaker: 'Kai Tanaka',
          dialogue: "The vault used overwriting on SSDs. That's already a red flag — overwriting flash storage is unreliable because of wear leveling. The data might still be sitting in cells the OS never targeted.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'worried',
        },

        // ── Knowledge Check 2: Destruction methods ───────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act2-kc2',
          question: "Your organization needs to dispose of 200 decommissioned hard disk drives that stored Top Secret government contract data. Which destruction method is MOST appropriate?",
          options: [
            'Overwrite each drive using a 7-pass DoD wipe tool',
            'Degauss the drives using a certified degausser rated for the media type, then physically destroy the platters',
            'Reformat the drives and donate them to a nonprofit',
            'Encrypt the drives with AES-256 and then delete the encryption keys',
          ],
          correctIndex: 1,
          explanation: "For Top Secret classified media, degaussing alone is not sufficient — physical destruction is also required. The combination of degaussing (which destroys magnetic data) followed by physical destruction (shredding/crushing the platters) meets government standards for Top Secret disposal. Overwriting 7-pass is appropriate for lower classifications but not Top Secret physical media. Reformatting is never sufficient for sensitive data. Cryptographic erasure requires the data was encrypted from the start, which may not be the case.",
          memoryHack: "High classification = double destruction. Degauss the ghost, then destroy the body. Two steps, no survivors.",
          conceptName: 'Data Destruction Methods',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Transition: Privacy engineering floor ────────────────────────────
        {
          type: 'transition',
          id: 'ch2-act2-transition-privacy',
          location: 'Nexus Data Vault — Privacy Engineering Lab, Sub-Level 2',
          description: 'The vault\'s privacy engineering team built three separate anonymization pipelines. They called them "identity shields." The attacker found the difference between the shields — and only one of them actually stopped him.',
          animation: 'slide',
        },

        // ── Dialogue 3: Kai on de-identification ─────────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act2-d3',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "The vault had three flavors of identity protection for its analytics datasets. They used the same word for all three — 'anonymized.' They weren't. Two of them were reversible. One wasn't. The attacker knew exactly which pipeline to target.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Evidence 2: De-identification pipeline analysis ──────────────────
        {
          type: 'evidence',
          id: 'ch2-act2-e2',
          title: 'Privacy Pipeline Analysis — Identity Shield Comparison',
          classification: 'TOP SECRET',
          content: `## De-Identification Methods in Use\n\n### Pipeline A: Pseudonymization\nReal customer names and SSNs replaced with generated identifiers (e.g., CUST-8847291). A mapping table stored in a separate encrypted database links the pseudonym back to the real identity.\n\n**Reversibility:** YES — the mapping table can restore full identity. Intended for analytics that may require re-identification for follow-up.\n\n### Pipeline B: Tokenization\nPrimary Account Numbers (PANs) replaced with random tokens. A secure token vault maps tokens to real values. Used for payment processing analytics.\n\n**Reversibility:** YES — the token vault can return the original PAN. Tokens are meaningless without vault access.\n\n### Pipeline C: Anonymization\nAll direct and indirect identifiers removed using k-anonymity (k=5) and generalization. No mapping table exists. Process is mathematically irreversible.\n\n**Reversibility:** NO — re-identification is not possible without original data.\n\n**Attacker action:** Targeted Pipeline A. Compromised the pseudonym mapping table. Successfully re-identified 1.8M customers.`,
          evidenceItems: [
            { label: 'Pipeline A (Pseudonymization)', value: 'Reversible — mapping table compromised', highlight: true },
            { label: 'Pipeline B (Tokenization)', value: 'Reversible — token vault not accessed' },
            { label: 'Pipeline C (Anonymization)', value: 'Irreversible — attacker could not exploit', highlight: false },
            { label: 'Records Re-identified', value: '1,800,000 via stolen mapping table', highlight: true },
          ],
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          dialogue: "Pseudonymization is witness protection — put the witness in a new city under a new name, but the FBI still has the file that says who they really are. Anonymization is burning the file. The witness is gone. Even the FBI can't find them.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Knowledge Check 3: Pseudonymization vs Anonymization ────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act2-kc3',
          question: "Under GDPR, pseudonymized data is still considered personal data. Which of the following BEST explains why?",
          options: [
            'Because pseudonymization replaces identifiers with random values that cannot be reversed',
            'Because the original identity can be restored using an additional piece of information (the mapping key)',
            'Because GDPR treats all data as personal data regardless of processing method',
            'Because pseudonymized data is only protected if the mapping key uses AES-256 encryption',
          ],
          correctIndex: 1,
          explanation: "GDPR Article 4 defines pseudonymized data as data that can no longer be attributed to a specific person without additional information — as long as that additional information exists somewhere. Because the mapping key (or token vault) allows re-identification, the data is still considered personal and GDPR still applies. True anonymization — where re-identification is mathematically impossible — takes data outside GDPR scope entirely.",
          memoryHack: "Pseudonymization = witness protection. The file still exists. Anonymization = witness never existed. No file, no risk.",
          conceptName: 'Pseudonymization vs Anonymization',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },

        // ── Knowledge Check 4: Tokenization ─────────────────────────────────
        {
          type: 'knowledgeCheck',
          id: 'ch2-act2-kc4',
          question: "A payment processor replaces all 16-digit credit card numbers with random 16-digit tokens in their analytics database. The token-to-PAN mapping is held in an isolated secure vault. How does tokenization differ from encryption in this context?",
          options: [
            'There is no functional difference — both protect data by making it unreadable',
            'Tokenization replaces data with a random surrogate with no mathematical relationship to the original; encryption transforms data using an algorithm that can be reversed with the key',
            'Tokenization is weaker than encryption because tokens can be guessed',
            'Encryption is preferable for payment data because it does not require a token vault',
          ],
          correctIndex: 1,
          explanation: "The critical distinction: encrypted ciphertext has a mathematical relationship to the plaintext — it was derived from it using an algorithm and key. An attacker who obtains the ciphertext and key can always recover the original. Tokenization replaces the PAN with a random value with no mathematical relationship — even knowing the tokenization system, an attacker cannot derive the PAN without accessing the vault. This is why PCI-DSS accepts tokenization as a method to reduce PAN scope.",
          memoryHack: "Encryption = locked box with a key. Token = a coat check stub. The stub has no relationship to the coat. You need the coat check to retrieve what it represents.",
          conceptName: 'Tokenization vs Encryption',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'thinking',
        },

        // ── Timed Decision 2: DLP alert response ─────────────────────────────
        {
          type: 'timedDecision',
          id: 'ch2-act2-td1',
          scenario: "The DLP system fires an alert: a data analyst's workstation is attempting to upload a 4GB compressed archive to a personal Dropbox account. The archive matches the filename pattern of the pseudonym mapping table backup files. You have 30 seconds before the upload completes.",
          timeLimit: 30,
          options: [
            {
              text: 'Block the transfer immediately and isolate the workstation',
              isOptimal: true,
              feedback: "Correct. DLP controls exist precisely for this scenario — stop the exfiltration first, investigate second. Blocking and isolating preserves the chain of evidence and limits damage. You can always unblock if it turns out to be benign.",
              xpBonus: 50,
            },
            {
              text: 'Let it complete — you need to confirm it\'s actually the mapping table before acting',
              isOptimal: false,
              feedback: "Wrong priority order. By the time you confirm, the data is already in an attacker-controlled location. DLP policy exists so you don\'t have to wait for confirmation before acting. Stop the action, then investigate.",
            },
            {
              text: 'Alert the analyst\'s manager and wait for their response',
              isOptimal: false,
              feedback: "Manager notification is correct — but not before blocking the transfer. Waiting for management approval while a potential exfiltration completes is a procedural error that costs you the data.",
            },
            {
              text: 'Monitor the upload and trace the destination for forensic purposes',
              isOptimal: false,
              feedback: "Monitoring is a valid secondary action — but not instead of blocking. Once exfiltrated, you cannot un-exfiltrate it. Forensics can trace the destination from logs without letting the transfer complete.",
            },
          ],
          conceptName: 'DLP Controls',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Think Like a Manager: Labeling policy ─────────────────────────────
        {
          type: 'thinkLikeManager',
          id: 'ch2-act2-tlm1',
          scenario: "Your organization handles both printed reports and digital files containing Confidential financial data. The security team has implemented classification labels on digital files (metadata tags, header watermarks). However, a recent audit found that printed reports containing the same data have no physical marking on them — no header, no footer, no stamp.",
          question: "As the CISO, what is the MOST important reason to enforce physical marking on printed documents containing Confidential data?",
          options: [
            'Printed documents look more professional with classification markings',
            'Physical marking ensures that anyone who handles the document knows its classification and required handling procedures — regardless of whether they have system access to check the metadata',
            'Regulatory compliance requires all documents to have exactly the same format regardless of medium',
            'Marking prevents photocopying by creating a visual deterrent',
          ],
          correctIndex: 1,
          explanation: "Labeling (digital metadata) and marking (visible physical indicators) serve the same purpose: communicate classification and handling requirements to anyone who encounters the data. A printed document that leaves the building has no system-enforced access controls. If a cleaning crew member finds it in a recycling bin, a physical marking tells them exactly what to do — call security, do not recycle. Marking is the last line of communication when technical controls cannot reach.",
          managerInsight: "Think about what happens when data leaves the digital perimeter. Paper can walk out a door in a briefcase. The only control that travels with it is the label on the page. Physical marking isn't bureaucracy — it's the portable security policy.",
          conceptName: 'Labeling vs Marking',
          speaker: 'Kai Tanaka',
          leftCharacter: 'kai_tanaka',
          leftExpression: 'serious',
        },

        // ── Dialogue 4: Act wrap-up ──────────────────────────────────────────
        {
          type: 'dialogue',
          id: 'ch2-act2-d4',
          speaker: 'Kai Tanaka',
          speakerSide: 'left',
          text: "Here's what this vault taught us, {player}. Data security isn't about having locks. It's about having the right lock on the right door for the right duration — and knowing when to destroy the key. The attacker didn't break anything. They walked through doors that should have been closed years ago, carrying labels that said 'welcome.' We fixed the vault. Next stop — Zurich. Janet has something for us on the architecture side.",
          leftCharacter: 'kai_tanaka',
          leftExpression: 'neutral',
        },
      ],
    },
    null,
    null,
    null,
  ],
};
