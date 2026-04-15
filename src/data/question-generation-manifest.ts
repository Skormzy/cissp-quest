// ═══════════════════════════════════════════════════════════
// Question Generation Manifest
// Defines what questions need to be generated for each
// domain, topic, cognitive level, and question type
// ═══════════════════════════════════════════════════════════

import { CognitiveLevel, QuestionType } from '@/lib/irt-engine';
import { DifficultyRating } from '@/lib/irt-defaults';

// ─── Topic Definitions ───────────────────────────────────

export interface TopicDefinition {
  cluster: string;          // Short ID (e.g., "risk_management")
  name: string;             // Full name
  key_concepts: string[];   // Core concepts to test
  priority: 'high' | 'medium' | 'low';
}

export interface DomainManifest {
  domain_id: number;
  domain_name: string;
  weight: number;           // CISSP exam weight
  topics: TopicDefinition[];
}

// ─── Generation Target ───────────────────────────────────

export interface ManifestTarget {
  domain_id: number;
  topic_cluster: string;
  cognitive_level: CognitiveLevel;
  question_type: QuestionType;
  difficulty_rating: DifficultyRating;
  count: number;
}

// ─── Domain Manifests ────────────────────────────────────

export const DOMAIN_MANIFESTS: DomainManifest[] = [
  // ── Domain 1: Security and Risk Management (15%) ─────
  {
    domain_id: 1,
    domain_name: 'Security and Risk Management',
    weight: 0.15,
    topics: [
      {
        cluster: 'risk_management',
        name: 'Risk Management Concepts',
        key_concepts: ['Risk assessment', 'Risk analysis (quantitative/qualitative)', 'Risk treatment', 'Risk appetite', 'Risk tolerance', 'Residual risk', 'Control selection'],
        priority: 'high',
      },
      {
        cluster: 'security_governance',
        name: 'Security Governance Principles',
        key_concepts: ['Governance frameworks', 'Due care vs due diligence', 'Security roles and responsibilities', 'Board oversight', 'Security steering committee'],
        priority: 'high',
      },
      {
        cluster: 'compliance_legal',
        name: 'Compliance and Legal',
        key_concepts: ['Regulatory requirements', 'Privacy laws (GDPR, HIPAA, etc.)', 'Computer crime laws', 'Intellectual property', 'Contractual obligations', 'Import/export controls'],
        priority: 'high',
      },
      {
        cluster: 'bcp_drp',
        name: 'Business Continuity and Disaster Recovery',
        key_concepts: ['BIA', 'BCP lifecycle', 'DRP', 'Recovery strategies', 'RTO/RPO/MTD', 'Testing types', 'Plan maintenance'],
        priority: 'high',
      },
      {
        cluster: 'security_policies',
        name: 'Security Policies and Standards',
        key_concepts: ['Policy hierarchy', 'Standards', 'Procedures', 'Guidelines', 'Baselines', 'Policy lifecycle'],
        priority: 'medium',
      },
      {
        cluster: 'risk_quantitative',
        name: 'Quantitative Risk Analysis',
        key_concepts: ['ALE', 'SLE', 'ARO', 'EF', 'Cost-benefit analysis', 'Safeguard evaluation'],
        priority: 'high',
      },
      {
        cluster: 'personnel_security',
        name: 'Personnel Security',
        key_concepts: ['Background checks', 'Employment agreements', 'Separation of duties', 'Job rotation', 'Mandatory vacations', 'Termination procedures'],
        priority: 'medium',
      },
      {
        cluster: 'threat_modeling',
        name: 'Threat Modeling',
        key_concepts: ['STRIDE', 'DREAD', 'Attack trees', 'Threat actors', 'Attack vectors', 'Kill chain'],
        priority: 'medium',
      },
      {
        cluster: 'ethics',
        name: 'Professional Ethics',
        key_concepts: ['(ISC)² Code of Ethics', 'Ethical decision making', 'Conflicts of interest', 'Organizational ethics'],
        priority: 'low',
      },
      {
        cluster: 'awareness_training',
        name: 'Security Awareness and Training',
        key_concepts: ['Training program design', 'Phishing awareness', 'Social engineering defense', 'Metrics and effectiveness'],
        priority: 'medium',
      },
    ],
  },

  // ── Domain 2: Asset Security (10%) ───────────────────
  {
    domain_id: 2,
    domain_name: 'Asset Security',
    weight: 0.10,
    topics: [
      {
        cluster: 'data_classification',
        name: 'Data Classification',
        key_concepts: ['Classification levels', 'Labeling', 'Handling', 'Data ownership', 'Data custodian', 'System owner'],
        priority: 'high',
      },
      {
        cluster: 'data_lifecycle',
        name: 'Data Lifecycle',
        key_concepts: ['Create', 'Store', 'Use', 'Share', 'Archive', 'Destroy', 'Data remanence'],
        priority: 'high',
      },
      {
        cluster: 'privacy',
        name: 'Privacy Protection',
        key_concepts: ['PII', 'PHI', 'Privacy principles', 'Data minimization', 'Purpose limitation', 'Consent'],
        priority: 'high',
      },
      {
        cluster: 'data_retention',
        name: 'Data Retention and Destruction',
        key_concepts: ['Retention policies', 'Secure destruction', 'Media sanitization', 'Degaussing', 'Crypto-shredding'],
        priority: 'medium',
      },
      {
        cluster: 'data_roles',
        name: 'Data Roles and Responsibilities',
        key_concepts: ['Data owner', 'Data custodian', 'Data steward', 'Data processor', 'Data controller'],
        priority: 'medium',
      },
    ],
  },

  // ── Domain 3: Security Architecture and Engineering (13%) ─
  {
    domain_id: 3,
    domain_name: 'Security Architecture and Engineering',
    weight: 0.13,
    topics: [
      {
        cluster: 'security_models',
        name: 'Security Models',
        key_concepts: ['Bell-LaPadula', 'Biba', 'Clark-Wilson', 'Brewer-Nash', 'State machine', 'Lattice-based'],
        priority: 'high',
      },
      {
        cluster: 'cryptography',
        name: 'Cryptography',
        key_concepts: ['Symmetric/asymmetric', 'Hash functions', 'Digital signatures', 'PKI', 'Key management', 'Cipher types'],
        priority: 'high',
      },
      {
        cluster: 'secure_design',
        name: 'Secure Design Principles',
        key_concepts: ['Defense in depth', 'Least privilege', 'Fail-safe defaults', 'Economy of mechanism', 'Complete mediation', 'Open design'],
        priority: 'high',
      },
      {
        cluster: 'physical_security',
        name: 'Physical Security',
        key_concepts: ['Perimeter controls', 'CPTED', 'Fire suppression', 'HVAC', 'Power protection', 'Access control systems'],
        priority: 'medium',
      },
      {
        cluster: 'system_architecture',
        name: 'System Architecture',
        key_concepts: ['CPU architecture', 'Memory protection', 'Trusted computing', 'Virtualization', 'Cloud security models'],
        priority: 'medium',
      },
      {
        cluster: 'evaluation_criteria',
        name: 'Security Evaluation Criteria',
        key_concepts: ['Common Criteria', 'EAL levels', 'TCSEC', 'ITSEC', 'Protection profiles'],
        priority: 'low',
      },
    ],
  },

  // ── Domain 4: Communication and Network Security (13%) ─
  {
    domain_id: 4,
    domain_name: 'Communication and Network Security',
    weight: 0.13,
    topics: [
      {
        cluster: 'network_architecture',
        name: 'Network Architecture',
        key_concepts: ['OSI model', 'TCP/IP', 'Network topologies', 'Segmentation', 'DMZ', 'VLAN'],
        priority: 'high',
      },
      {
        cluster: 'network_attacks',
        name: 'Network Attacks',
        key_concepts: ['DoS/DDoS', 'Man-in-the-middle', 'ARP spoofing', 'DNS attacks', 'Session hijacking'],
        priority: 'high',
      },
      {
        cluster: 'network_security_devices',
        name: 'Network Security Devices',
        key_concepts: ['Firewalls', 'IDS/IPS', 'Proxy servers', 'NAC', 'Load balancers', 'WAF'],
        priority: 'high',
      },
      {
        cluster: 'secure_protocols',
        name: 'Secure Protocols',
        key_concepts: ['TLS/SSL', 'IPSec', 'SSH', 'DNSSEC', 'S/MIME', 'HTTPS'],
        priority: 'medium',
      },
      {
        cluster: 'wireless_security',
        name: 'Wireless Security',
        key_concepts: ['WPA3', 'WPA2', 'Rogue APs', '802.1X', 'Bluetooth attacks', 'RFID security'],
        priority: 'medium',
      },
      {
        cluster: 'remote_access',
        name: 'Remote Access and VPN',
        key_concepts: ['VPN types', 'Tunneling protocols', 'Remote desktop', 'Zero trust network access'],
        priority: 'medium',
      },
    ],
  },

  // ── Domain 5: Identity and Access Management (13%) ───
  {
    domain_id: 5,
    domain_name: 'Identity and Access Management',
    weight: 0.13,
    topics: [
      {
        cluster: 'access_control_models',
        name: 'Access Control Models',
        key_concepts: ['DAC', 'MAC', 'RBAC', 'ABAC', 'Rule-based', 'Risk-based'],
        priority: 'high',
      },
      {
        cluster: 'authentication',
        name: 'Authentication Methods',
        key_concepts: ['Multi-factor', 'Biometrics', 'Tokens', 'SSO', 'Federation', 'FIDO2/WebAuthn'],
        priority: 'high',
      },
      {
        cluster: 'identity_management',
        name: 'Identity Management',
        key_concepts: ['Provisioning', 'Deprovisioning', 'Identity lifecycle', 'Directory services', 'Identity federation'],
        priority: 'high',
      },
      {
        cluster: 'authorization',
        name: 'Authorization Mechanisms',
        key_concepts: ['OAuth', 'SAML', 'OpenID Connect', 'Kerberos', 'RADIUS', 'TACACS+'],
        priority: 'medium',
      },
      {
        cluster: 'access_control_attacks',
        name: 'Access Control Attacks',
        key_concepts: ['Brute force', 'Dictionary attacks', 'Password spraying', 'Credential stuffing', 'Privilege escalation'],
        priority: 'medium',
      },
    ],
  },

  // ── Domain 6: Security Assessment and Testing (12%) ──
  {
    domain_id: 6,
    domain_name: 'Security Assessment and Testing',
    weight: 0.12,
    topics: [
      {
        cluster: 'vulnerability_assessment',
        name: 'Vulnerability Assessment',
        key_concepts: ['Vulnerability scanning', 'Penetration testing', 'Red/blue/purple teams', 'Bug bounty programs'],
        priority: 'high',
      },
      {
        cluster: 'security_auditing',
        name: 'Security Auditing',
        key_concepts: ['Audit types', 'SOC reports', 'Log analysis', 'Audit trails', 'SIEM'],
        priority: 'high',
      },
      {
        cluster: 'testing_strategies',
        name: 'Testing Strategies',
        key_concepts: ['Static analysis', 'Dynamic analysis', 'Fuzzing', 'Code review', 'Interface testing'],
        priority: 'medium',
      },
      {
        cluster: 'security_metrics',
        name: 'Security Metrics and KPIs',
        key_concepts: ['KPIs', 'KRIs', 'Maturity models', 'Reporting', 'Dashboards'],
        priority: 'medium',
      },
      {
        cluster: 'compliance_testing',
        name: 'Compliance Testing',
        key_concepts: ['Regulatory audits', 'Compliance frameworks', 'Gap analysis', 'Remediation tracking'],
        priority: 'medium',
      },
    ],
  },

  // ── Domain 7: Security Operations (13%) ──────────────
  {
    domain_id: 7,
    domain_name: 'Security Operations',
    weight: 0.13,
    topics: [
      {
        cluster: 'incident_response',
        name: 'Incident Response',
        key_concepts: ['IR lifecycle', 'Detection', 'Containment', 'Eradication', 'Recovery', 'Lessons learned', 'CSIRT'],
        priority: 'high',
      },
      {
        cluster: 'digital_forensics',
        name: 'Digital Forensics',
        key_concepts: ['Evidence handling', 'Chain of custody', 'Forensic tools', 'Volatile evidence', 'Legal holds'],
        priority: 'high',
      },
      {
        cluster: 'security_operations_center',
        name: 'Security Operations Center',
        key_concepts: ['SOC operations', 'Monitoring', 'Alert triage', 'Threat hunting', 'Playbooks'],
        priority: 'medium',
      },
      {
        cluster: 'change_management',
        name: 'Change and Configuration Management',
        key_concepts: ['Change control process', 'Configuration baselines', 'Patch management', 'Version control'],
        priority: 'medium',
      },
      {
        cluster: 'disaster_recovery_ops',
        name: 'Disaster Recovery Operations',
        key_concepts: ['Backup strategies', 'Recovery procedures', 'Testing', 'Communication plans', 'Alternate sites'],
        priority: 'medium',
      },
      {
        cluster: 'investigations',
        name: 'Investigations',
        key_concepts: ['Investigation types', 'Evidence collection', 'Interview techniques', 'Reporting', 'Legal considerations'],
        priority: 'low',
      },
    ],
  },

  // ── Domain 8: Software Development Security (11%) ────
  {
    domain_id: 8,
    domain_name: 'Software Development Security',
    weight: 0.11,
    topics: [
      {
        cluster: 'sdlc_security',
        name: 'Secure SDLC',
        key_concepts: ['SDLC phases', 'Security in requirements', 'Secure coding', 'Security testing in SDLC', 'DevSecOps'],
        priority: 'high',
      },
      {
        cluster: 'software_vulnerabilities',
        name: 'Software Vulnerabilities',
        key_concepts: ['OWASP Top 10', 'Buffer overflow', 'SQL injection', 'XSS', 'CSRF', 'Race conditions'],
        priority: 'high',
      },
      {
        cluster: 'secure_coding',
        name: 'Secure Coding Practices',
        key_concepts: ['Input validation', 'Output encoding', 'Parameterized queries', 'Error handling', 'Least privilege in code'],
        priority: 'high',
      },
      {
        cluster: 'database_security',
        name: 'Database Security',
        key_concepts: ['Database access controls', 'Encryption at rest', 'SQL injection prevention', 'Database auditing', 'Data masking'],
        priority: 'medium',
      },
      {
        cluster: 'development_methodologies',
        name: 'Development Methodologies',
        key_concepts: ['Agile', 'Waterfall', 'Spiral', 'DevOps', 'CI/CD pipeline security'],
        priority: 'medium',
      },
      {
        cluster: 'api_security',
        name: 'API and Web Services Security',
        key_concepts: ['REST security', 'API authentication', 'Rate limiting', 'Input validation', 'CORS'],
        priority: 'medium',
      },
    ],
  },
];

// ─── Generation Targets ──────────────────────────────────
// Defines the question count targets per assessment type

export interface AssessmentTargets {
  sessionType: string;
  poolSize: number;
  perDomain: number;
  cognitiveDistribution: Record<CognitiveLevel, number>;
  typeDistribution: Partial<Record<QuestionType, number>>;
  difficultyDistribution: Record<DifficultyRating, number>;
}

export const ASSESSMENT_TARGETS: AssessmentTargets[] = [
  {
    sessionType: 'field_test',
    poolSize: 480,
    perDomain: 60,
    cognitiveDistribution: { remember: 0.20, understand: 0.35, apply: 0.30, analyze: 0.15 },
    typeDistribution: { scenario: 0.25, best_answer: 0.20, definition: 0.15, comparison: 0.15, most_likely: 0.10, first_action: 0.10, except_not: 0.05 },
    difficultyDistribution: { easy: 0.30, medium: 0.40, hard: 0.25, very_hard: 0.05 },
  },
  {
    sessionType: 'boss_battle',
    poolSize: 800,
    perDomain: 100,
    cognitiveDistribution: { remember: 0.10, understand: 0.25, apply: 0.35, analyze: 0.30 },
    typeDistribution: { scenario: 0.30, best_answer: 0.20, first_action: 0.15, most_likely: 0.10, tlatm: 0.10, comparison: 0.05, except_not: 0.05, calculation: 0.05 },
    difficultyDistribution: { easy: 0.15, medium: 0.35, hard: 0.35, very_hard: 0.15 },
  },
  {
    sessionType: 'final_boss',
    poolSize: 200,
    perDomain: 25,
    cognitiveDistribution: { remember: 0.05, understand: 0.20, apply: 0.35, analyze: 0.40 },
    typeDistribution: { scenario: 0.30, tlatm: 0.20, first_action: 0.15, best_answer: 0.15, most_likely: 0.10, calculation: 0.05, except_not: 0.05 },
    difficultyDistribution: { easy: 0.05, medium: 0.25, hard: 0.40, very_hard: 0.30 },
  },
  {
    sessionType: 'gauntlet',
    poolSize: 47,
    perDomain: 6,
    cognitiveDistribution: { remember: 0, understand: 0, apply: 0.40, analyze: 0.60 },
    typeDistribution: { tlatm: 0.60, scenario: 0.25, first_action: 0.15 },
    difficultyDistribution: { easy: 0, medium: 0.20, hard: 0.50, very_hard: 0.30 },
  },
];

// ─── Generate Manifest Targets ───────────────────────────
// Creates the full list of generation targets from the manifests

export function generateManifestTargets(sessionType: string): ManifestTarget[] {
  const targets: ManifestTarget[] = [];
  const assessment = ASSESSMENT_TARGETS.find(a => a.sessionType === sessionType);
  if (!assessment) return targets;

  for (const domain of DOMAIN_MANIFESTS) {
    const domainQuestionCount = assessment.perDomain;

    for (const topic of domain.topics) {
      // Distribute questions across cognitive levels and types
      for (const [cogLevel, cogRatio] of Object.entries(assessment.cognitiveDistribution)) {
        if (cogRatio === 0) continue;

        for (const [qType, typeRatio] of Object.entries(assessment.typeDistribution)) {
          if (!typeRatio || typeRatio === 0) continue;

          for (const [diff, diffRatio] of Object.entries(assessment.difficultyDistribution)) {
            if (diffRatio === 0) continue;

            const count = Math.max(1, Math.round(
              domainQuestionCount / domain.topics.length * cogRatio * typeRatio * diffRatio
            ));

            if (count > 0) {
              targets.push({
                domain_id: domain.domain_id,
                topic_cluster: topic.cluster,
                cognitive_level: cogLevel as CognitiveLevel,
                question_type: qType as QuestionType,
                difficulty_rating: diff as DifficultyRating,
                count,
              });
            }
          }
        }
      }
    }
  }

  return targets;
}
