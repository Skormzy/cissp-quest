INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  8,
  'api_security',
  'A large e-commerce platform exposes a GraphQL API for its mobile applications. A security assessment reveals that the API allows deeply nested queries that can cause exponential database joins, authenticated users can query any other user''s data by modifying the user ID parameter, and the API returns detailed error messages including stack traces. The security team has resources to address only ONE issue immediately. Which vulnerability should be fixed FIRST?',
  '["Deep query nesting causing exponential database joins, because it enables denial-of-service attacks", "Detailed error messages with stack traces, because they help attackers understand internal architecture", "All three should be fixed simultaneously since they are equally severe", "Broken object-level authorization allowing access to any user''s data, because it directly enables mass data breach of customer information"]'::jsonb,
  3,
  'Broken object-level authorization (IDOR/BOLA) is the most critical because it allows any authenticated user to access any other user''s data by simply changing the user ID. This can lead to mass data breach affecting all customers. DoS through nested queries causes availability issues, and error messages aid attackers, but neither directly exposes customer data at the scale that broken authorization does.',
  'Prioritize by IMPACT: direct data exposure > denial of service > information leakage. Fix the one that causes mass data breach first.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'change_management',
  'As the IT governance director, you discover that the organization''s change management process has become so bureaucratic that developers routinely wait 6-8 weeks for CAB approval on minor changes. This has led to three consequences: developers are bypassing the process for urgent fixes, security reviews are being skipped to save time, and the business is losing competitive advantage due to slow feature delivery. How should you restructure the process?',
  '["Implement a tiered change classification system with expedited approval paths for low-risk changes while maintaining rigorous review for high-risk changes", "Eliminate the CAB entirely and trust developers to make good security decisions independently", "Maintain the current process unchanged because security must always take priority over speed", "Outsource change management to a third-party governance firm to remove internal political conflicts"]'::jsonb,
  0,
  'The correct management approach is implementing tiered change classification. Low-risk changes (minor UI updates, documentation) can have expedited approval, while high-risk changes (security controls, database schema, authentication) maintain rigorous CAB review. This balances security governance with business agility, addressing the root cause of process bypass while preserving security for critical changes.',
  NULL,
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'containerization',
  'A cloud-native application uses a microservices architecture with 50 containerized services orchestrated by Kubernetes. During a security assessment, the team discovers that a compromised container was able to access the Kubernetes API server, enumerate all running pods, read secrets from other namespaces, and ultimately pivot to a database container holding customer PII. Analysis reveals the compromised container was running with a default service account that had cluster-wide read permissions. Which combination of controls would MOST effectively prevent this attack chain?',
  '["Encrypting all container images and implementing mandatory code signing for all deployments", "Implementing least-privilege RBAC on service accounts, enabling namespace isolation with network policies, and mounting service account tokens only when explicitly needed", "Deploying a container-aware firewall at the cluster perimeter to filter all inbound traffic", "Implementing mandatory vulnerability scanning of all container images before deployment"]'::jsonb,
  1,
  'The attack succeeded because of overly permissive service accounts and lack of namespace isolation. The fix requires: RBAC with least privilege (restricting what each service account can access), network policies (preventing cross-namespace communication), and disabling automatic service account token mounting (reducing API server exposure). These controls address each step of the attack chain.',
  'Container security triad: RBAC (who), Network Policies (where), Service Account controls (how). Lock down all three.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  8,
  'secure_sdlc',
  'An organization uses a hybrid development approach combining Agile sprints for feature development with waterfall-style gates for security certification. During Sprint 12, a developer introduces a new authentication module that passes all unit tests and integration tests. However, during the waterfall security gate review, the module is found to have a fundamental design flaw — it stores session tokens in client-side localStorage, making them vulnerable to XSS-based token theft. Redesigning the module will delay the release by two sprints. What does this scenario MOST LIKELY indicate about the organization''s SDLC?',
  '["The Agile methodology is fundamentally incompatible with security requirements", "The security gate review process is too strict and should accept known risks to maintain velocity", "Security requirements and threat modeling were not adequately integrated into the sprint planning and design phases, causing a late discovery of an architectural flaw", "The waterfall security gate should be removed and replaced with automated DAST scanning"]'::jsonb,
  2,
  'This scenario illustrates the failure to shift security left. If security requirements (such as secure session token storage) and threat modeling had been part of sprint planning, the design flaw would have been caught during Sprint 12''s design phase rather than at a downstream gate. The two-sprint delay is the cost of finding architectural issues late — exactly what shift-left aims to prevent.',
  'Late security discovery = shift-left failure. Security requirements and threat modeling must be part of SPRINT PLANNING, not just final gates.',
  'analyze',
  'most_likely',
  'very_hard',
  1.60, 3.00, 0.22,
  'ai_generated', true
),
(
  8,
  'database_security',
  'All of the following are valid countermeasures against database inference attacks EXCEPT:',
  '["Polyinstantiation to provide different data versions at different classification levels", "Cell suppression to hide specific values that could enable deductive reasoning", "Noise and perturbation to add random variations that mask true data patterns", "Database normalization to reduce data redundancy through first, second, and third normal forms"]'::jsonb,
  3,
  'Database normalization (1NF, 2NF, 3NF) is a data design technique to reduce redundancy and improve integrity — it has nothing to do with preventing inference attacks. Polyinstantiation prevents inference by hiding data absence, cell suppression hides specific values that could enable deduction, and noise/perturbation masks patterns that analysts could exploit. Normalization is good database design but not a security countermeasure against inference.',
  'Inference defenses: Polyinstantiation, Cell Suppression, Noise/Perturbation, Context-dependent access control. Normalization = data design, NOT inference defense.',
  'analyze',
  'except_not',
  'very_hard',
  1.40, 3.00, 0.25,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;