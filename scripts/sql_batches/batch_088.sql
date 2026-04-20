INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  6,
  'soc_reports',
  'An organization is evaluating a cloud service provider for hosting its financial application. The provider offers a SOC 2 Type I report from last month. The organization''s auditor says this is insufficient and requests a SOC 2 Type II report. Why is the Type II report preferred?',
  '["Type II covers a broader scope of trust service criteria than Type I", "Type II is more recent and therefore reflects the current security posture", "Type II is required by law for all cloud providers handling financial data", "Type II evaluates controls over a period of time, demonstrating consistent operational effectiveness rather than just point-in-time design adequacy"]'::jsonb,
  3,
  'SOC 2 Type I evaluates control design at a specific point in time — it confirms controls exist and are suitably designed. SOC 2 Type II evaluates the same controls but over a period (typically 6-12 months), demonstrating that controls operate effectively over time. A control might be designed well but not consistently followed — Type II catches this. Both types cover the same trust service criteria. Type II is not legally required. Recency alone is not the differentiator — the testing period is.',
  'Type I = designed RIGHT (one day snapshot). Type II = WORKS right over time (6-12 months). Type II proves operational effectiveness.',
  'apply',
  'scenario',
  'medium',
  1.50, 0.50, 0.20,
  'ai_generated', true
),
(
  6,
  'security_metrics',
  'As the CISO, you are presenting security metrics to the board of directors. Your team tracks MTTD (Mean Time to Detect) and MTTR (Mean Time to Respond) for security incidents. Over the past year, MTTD decreased from 45 days to 12 days while MTTR increased from 3 days to 7 days. The CFO questions why response time is getting worse. What is the BEST way to explain this to the board?',
  '["Acknowledge that the response team needs additional training to improve their speed", "Explain that faster detection means finding more complex, deeply embedded threats that inherently require longer investigation and remediation, and that the combined dwell time dropped from 48 to 19 days — a 60% improvement in total exposure", "Request additional budget for automated response tools to reduce MTTR back to 3 days", "Propose hiring additional incident responders to reduce the workload per analyst"]'::jsonb,
  1,
  'This is a classic metrics interpretation challenge. The improved MTTD means the organization is now detecting sophisticated threats that previously went unnoticed for 45+ days. These complex threats naturally require more investigation time, increasing MTTR. The key metric for the board is TOTAL DWELL TIME (MTTD + MTTR), which dropped from 48 to 19 days — a dramatic improvement. Admitting the team needs training concedes a problem that doesn''t exist. Budget requests and hiring may be needed but don''t answer the question. Context is everything in security metrics.',
  'Board metrics: focus on TOTAL DWELL TIME, not individual components. Better detection of harder threats = longer response is EXPECTED.',
  'analyze',
  'tlatm',
  'very_hard',
  1.90, 3.00, 0.20,
  'ai_generated', true
),
(
  6,
  'cve_cvss',
  'A vulnerability scan returns 2,400 findings across the organization''s infrastructure. The security team has limited resources and cannot address all findings simultaneously. The findings include: 15 critical CVSS 9.0+ with known exploits, 200 high CVSS 7.0-8.9, 800 medium CVSS 4.0-6.9, and 1,385 low/informational. What should the team do FIRST?',
  '["Prioritize the 15 critical findings with known exploits for immediate remediation, as they represent the highest risk of active exploitation", "Create a remediation plan that addresses all 2,400 findings in CVSS score order over the next quarter", "Focus on the 800 medium findings first since they represent the largest group by volume", "Re-scan the environment to validate the findings before taking any remediation action"]'::jsonb,
  0,
  'With limited resources, risk-based prioritization is essential. The 15 critical findings with known exploits represent imminent, exploitable threats. CVSS score combined with exploit availability creates the highest risk category. Addressing all 2,400 sequentially is unrealistic and delays critical fixes. Volume-based prioritization ignores severity. Re-scanning delays remediation of known critical vulnerabilities. The threat intelligence context (known exploits) elevates priority beyond CVSS score alone.',
  'CVSS + Known Exploit = patch NOW. Limited resources = risk-based prioritization. Critical with exploits first, always.',
  'apply',
  'first_action',
  'hard',
  1.50, 2.10, 0.20,
  'ai_generated', true
),
(
  6,
  'fuzz_testing',
  'A software testing team runs a fuzz testing tool against an API endpoint for two weeks. The tool generates millions of malformed inputs but finds zero crashes or unexpected behaviors. The development team concludes the API is secure. What is the MOST likely issue with this conclusion?',
  '["The fuzz testing tool is malfunctioning and not actually sending malformed inputs", "The API has been hardened by a previous security review, making it truly immune to fuzzing attacks", "The fuzzer may be using mutation-based fuzzing that doesn''t understand the API''s input grammar, generating inputs that are rejected by basic parsing before reaching deeper logic", "The two-week testing window was insufficient and the testing should continue for at least 90 days"]'::jsonb,
  2,
  'A mutation-based fuzzer randomly modifies valid inputs without understanding the input format. For structured APIs (JSON, XML, protocol buffers), most mutated inputs fail basic parsing and never exercise deeper application logic. A generational (grammar-based) fuzzer that understands the input structure would be more effective. Zero findings doesn''t mean zero vulnerabilities — it means the testing approach may not have sufficient coverage. The tool functioning correctly doesn''t mean it''s testing effectively. Time alone doesn''t solve input quality issues.',
  'Fuzzing results depend on INPUT QUALITY. Mutation fuzzing = random. Generational fuzzing = smart. Zero findings ≠ zero bugs.',
  'analyze',
  'most_likely',
  'medium',
  1.60, 0.70, 0.22,
  'ai_generated', true
),
(
  7,
  'chain_of_custody',
  'During a criminal investigation into insider trading, a forensic analyst creates a bit-for-bit image of a suspect''s hard drive. The analyst generates MD5 and SHA-256 hashes of both the original drive and the forensic image, confirming they match. Six months later at trial, the defense attorney argues the evidence should be excluded. The attorney presents evidence that the chain of custody log has a 4-hour gap where no custodian was documented. The hashes still match. Should the evidence be admitted?',
  '["Yes, because the matching hashes prove the evidence was not tampered with regardless of custody gaps", "Yes, because digital evidence does not require the same chain of custody as physical evidence", "No, because MD5 is known to have collision vulnerabilities, making the hash verification unreliable", "The court may exclude it because chain of custody must be maintained continuously — matching hashes support integrity but do not replace the legal requirement for documented, unbroken custody"]'::jsonb,
  3,
  'Chain of custody and data integrity serve different legal purposes. Hashes verify the data wasn''t modified, but chain of custody documents WHO had access and WHEN. A custody gap means the evidence was potentially accessible to unknown parties during those 4 hours. Even though hashes prove no modification occurred, the defense can argue the gap creates reasonable doubt about the evidence''s handling. Courts may still admit it with the hash as supporting evidence, but the custody gap weakens the case. The hash doesn''t replace the custody requirement.',
  'Hashes prove INTEGRITY. Chain of custody proves HANDLING. Both are needed. A gap in custody ≠ tampering, but it weakens the legal case.',
  'analyze',
  'scenario',
  'hard',
  1.70, 2.30, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;