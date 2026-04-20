INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'banner_grabbing',
  'A security analyst connects to port 80 on a target server using Telnet and receives a response showing "Apache/2.4.51 (Ubuntu)". What technique has the analyst MOST LIKELY performed?',
  '["OS fingerprinting to determine the server operating system", "Vulnerability exploitation to gain unauthorized access", "Banner grabbing to identify the web server software and version", "Port scanning to enumerate all open services"]'::jsonb,
  2,
  'Banner grabbing is a technique used to identify software, services, and versions running on a target system by examining responses, error messages, or service banners. Connecting to port 80 via Telnet and receiving the server identification string is a classic banner grabbing technique. While the response reveals the OS (Ubuntu), the primary technique used is banner grabbing, not OS fingerprinting.',
  'Banner grabbing = reading the welcome sign on the door. It tells you what software and version is running.',
  'understand',
  'most_likely',
  'medium',
  1.10, 0.10, 0.22,
  'ai_generated', true
),
(
  6,
  'log_review_siem',
  'A healthcare organization''s SIEM generates thousands of alerts daily. The security team is overwhelmed and unable to investigate all alerts, resulting in genuine incidents being missed among the noise. The team discovers that many alerts are triggered by routine administrative activities. What is the BEST approach to address this situation?',
  '["Disable all low-priority alerts to reduce volume immediately", "Hire additional analysts to manually review every alert", "Replace the SIEM with a simpler log aggregation tool", "Tune the SIEM correlation rules and implement clipping levels to filter routine activity"]'::jsonb,
  3,
  'SIEM tuning involves adjusting correlation rules to reduce false positives and implementing clipping levels (thresholds) that filter routine activities while preserving significant events. Disabling alerts risks missing real threats, hiring alone does not solve the root cause, and replacing the SIEM loses correlation capabilities. Proper tuning balances alert volume with detection effectiveness.',
  'SIEM tuning = teaching the system what matters. Clipping levels = only alert after threshold exceeded.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'As a security director, you are presenting quarterly security metrics to the executive committee. The mean time to detect (MTTD) security incidents has decreased from 72 hours to 24 hours, but the mean time to respond (MTTR) has increased from 4 hours to 8 hours. What is the MOST appropriate management interpretation of these metrics?',
  '["Detection capabilities have improved significantly, but response processes need attention and additional resources", "The security program is failing because response times should decrease proportionally with detection times", "The SIEM should be replaced because faster detection should automatically lead to faster response", "These metrics are unreliable and should be replaced with purely financial indicators"]'::jsonb,
  0,
  'From a management perspective, decreased MTTD shows improved detection capabilities, which is positive. However, increased MTTR suggests response processes may be strained, possibly because faster detection is surfacing more incidents than the response team can handle efficiently. A balanced view recognizes the detection improvement while identifying response as an area needing process improvement or additional resources.',
  'MTTD = how fast you spot it. MTTR = how fast you fix it. Both matter — improvement in one may strain the other.',
  'analyze',
  'tlatm',
  'medium',
  1.90, 1.10, 0.20,
  'ai_generated', true
),
(
  6,
  'code_review',
  'A software development team has just completed a major update to their web application''s authentication module. Several developers made changes across multiple code files. Before deploying to production, what should be the FIRST security-focused review activity?',
  '["Deploy to production with enhanced monitoring for the first week", "Conduct a peer code review focused on the authentication changes", "Run a full penetration test against the development environment", "Schedule a Fagan inspection for next quarter''s review cycle"]'::jsonb,
  1,
  'Peer code review is the most practical and effective first step for reviewing specific code changes before deployment. It allows developers to examine each other''s work for security flaws, logic errors, and coding standard violations. Penetration testing is more appropriate after deployment to a staging environment, Fagan inspections are too formal for routine changes, and deploying without review introduces unnecessary risk.',
  'Code review = first line of defense before deployment. Peer eyes catch what the coder''s eyes miss.',
  'apply',
  'first_action',
  'medium',
  1.50, 0.60, 0.20,
  'ai_generated', true
),
(
  6,
  'penetration_testing',
  'All of the following are phases of a standard penetration testing methodology EXCEPT:',
  '["Reconnaissance and information gathering", "Enumeration of services and ports", "Continuous real-time monitoring of production systems", "Vulnerability analysis and exploitation"]'::jsonb,
  2,
  'The standard penetration testing phases are reconnaissance, enumeration, vulnerability analysis, exploitation, and documentation. Continuous real-time monitoring is a security operations function, not a penetration testing phase. Penetration tests are time-bound engagements with defined start and end dates, not continuous monitoring activities.',
  'Pen test phases: REVED = Recon, Enumerate, Vuln analysis, Exploit, Document. Monitoring is SOC work, not pen testing.',
  'understand',
  'except_not',
  'medium',
  0.90, 0.20, 0.25,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;