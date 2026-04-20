INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  3,
  'key_management',
  'A financial institution uses hardware security modules to protect its master encryption keys. During a routine audit, the auditor discovers that the HSM''s firmware is two major versions behind and has a known vulnerability that could allow key extraction through a side-channel attack. However, updating the firmware requires the HSM to be taken offline for 4 hours, during which no cryptographic operations can be performed. The HSM protects real-time transaction processing that generates $50,000 per hour in revenue. What is the BEST approach?',
  '["Accept the risk of the known vulnerability because the revenue impact of downtime is too high", "Schedule the firmware update during the next quarterly maintenance window in 6 weeks", "Implement compensating controls around the HSM network to reduce side-channel attack risk while planning the update", "Deploy a secondary HSM with updated firmware, migrate cryptographic operations to it, then update the primary HSM with zero transaction downtime"]'::jsonb,
  3,
  'The best approach eliminates both risks — the vulnerability AND the downtime. Deploying a secondary HSM with updated firmware and migrating operations creates high availability while addressing the security issue. Accepting a known key extraction vulnerability in a financial HSM is negligent. Waiting 6 weeks with a published vulnerability is excessive risk. Compensating controls help but don''t fix the root cause. The cost of a second HSM is justified against both the revenue risk and the security risk.',
  'Don''t choose between security and availability — architect for BOTH. Redundancy enables zero-downtime security updates.',
  'analyze',
  'scenario',
  'very_hard',
  1.70, 3.00, 0.20,
  'ai_generated', true
),
(
  3,
  'security_models',
  'A military classified information system needs to prevent users from writing data to lower security levels, while a banking transaction system needs to prevent unauthorized modifications to financial records. Which pair of security models BEST addresses these two requirements respectively?',
  '["Clark-Wilson for both, as it handles integrity through well-formed transactions", "Bell-LaPadula for the military system (no write-down) and Biba for the banking system (no write-up for integrity)", "Biba for the military system and Bell-LaPadula for the banking system", "Brewer-Nash for the military system and Clark-Wilson for the banking system"]'::jsonb,
  1,
  'Bell-LaPadula''s star property (*-property) prevents writing to lower classification levels (no write-down), directly addressing the military requirement for preventing data leakage to lower clearance levels. Biba''s integrity star property prevents writing to higher integrity levels (no write-up), preventing untrusted data from corrupting trusted financial records. Reversing them confuses confidentiality and integrity models. Clark-Wilson handles integrity through transactions but isn''t the model-level answer. Brewer-Nash handles conflicts of interest.',
  'Bell-LaPadula = Confidentiality (no write DOWN, no read UP). Biba = Integrity (no write UP, no read DOWN). They''re mirrors!',
  'apply',
  'comparison',
  'medium',
  1.40, 0.40, 0.22,
  'ai_generated', true
),
(
  3,
  'virtualization',
  'A company runs multiple customer tenants on the same physical server using a Type 1 hypervisor. A security researcher publishes a proof-of-concept demonstrating a VM escape vulnerability in the hypervisor version they use. The vendor has released a patch. What is the MOST appropriate immediate response while the patch is being tested?',
  '["Implement micro-segmentation and enhanced monitoring between VMs to detect lateral movement attempts while the patch undergoes testing", "Shut down all virtual machines immediately until the patch is tested and deployed", "Migrate all VMs to physical servers to eliminate the hypervisor attack surface", "Notify all tenant customers and allow them to decide whether to continue operations"]'::jsonb,
  0,
  'While the patch undergoes testing, compensating controls reduce risk without disrupting operations. Micro-segmentation limits lateral movement if a VM escape occurs, and enhanced monitoring enables rapid detection. Shutting down all VMs is a disproportionate business disruption for a proof-of-concept. Migrating to physical servers is impractical and expensive. Tenant notification may be appropriate but doesn''t reduce the technical risk. The patch should be fast-tracked through testing.',
  'Known vuln + patch in testing = COMPENSATE while you test. Don''t shut everything down; add detection and containment.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  3,
  'digital_signatures',
  'An organization''s internal audit team discovers that several digitally signed contracts from the past year used SHA-1 for the hash function in the digital signature. The contracts are legally binding and represent $50 million in commitments. The security team confirms that SHA-1 collision attacks are now practical. What should the organization do FIRST?',
  '["Declare all SHA-1 signed contracts invalid and request re-execution with SHA-256", "Immediately revoke all certificates that used SHA-1 signing", "File legal proceedings against the CA that issued SHA-1 certificates", "Assess whether any contracts show signs of tampering, then plan migration to SHA-256 for future signatures while consulting legal counsel on existing contracts"]'::jsonb,
  3,
  'The first step is assessing actual risk — whether any contracts were actually tampered with — before taking disruptive action. Collision attacks being practical doesn''t mean existing signatures were forged. Declaring contracts invalid would cause massive business disruption and may not be legally required. Revoking certificates doesn''t address already-signed documents. Legal proceedings against the CA are premature. The pragmatic approach: assess for actual tampering, migrate future signing to SHA-256, and work with legal counsel on the existing contract portfolio.',
  'Vulnerability ≠ exploitation. ASSESS first, then MIGRATE forward. Don''t nuke existing business over a theoretical risk.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),
(
  3,
  'fire_suppression',
  'A data center operator notices that the pre-action fire suppression system has activated its first stage — the VESDA smoke detection triggered an alarm — but no water has been released. The operator sees no visible smoke or fire. What is the MOST likely explanation?',
  '["The fire suppression system has malfunctioned and needs immediate maintenance", "The VESDA system has a high false positive rate and should be replaced with a less sensitive detector", "The pre-action system is working as designed — VESDA detects smoke particles at very early stages before visible smoke appears, and water is only released when sprinkler heads also activate from heat", "The pipes were not properly pressurized during the last maintenance cycle"]'::jsonb,
  2,
  'Pre-action systems require two triggers: the detection system (VESDA) and individual sprinkler head activation from heat. This dual-trigger design prevents accidental water discharge from either false alarms or broken sprinkler heads alone. VESDA is an aspirating smoke detection system that detects smoke particles at extremely early stages — well before visible smoke or fire. The system is working correctly by alerting early. The operator should investigate the cause of the early-stage particles while the system waits for the second trigger.',
  'Pre-action = TWO triggers needed. Smoke detection fills the pipes; sprinkler heat OPENS them. Protects against false discharge.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;