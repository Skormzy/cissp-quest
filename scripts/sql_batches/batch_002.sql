INSERT INTO cat_questions (
  domain_id, topic_cluster, question_text, options, correct_index,
  explanation, mnemonic_hint, cognitive_level, question_type,
  difficulty_rating, irt_a, irt_b, irt_c, source, is_active
) VALUES
(
  5,
  'identity_lifecycle',
  'An employee in the finance department is transferring to the marketing department next week. The security administrator has been asked to update the employee''s access. What is the MOST important step to prevent privilege creep?',
  '["Grant the employee marketing permissions immediately so they can prepare for their new role", "Remove the employee''s finance permissions and grant only the marketing permissions needed for the new role", "Keep the finance permissions active for 30 days in case the employee needs to reference old work", "Delete the employee''s account and create a new one for the marketing department"]'::jsonb,
  1,
  'Privilege creep occurs when users accumulate unnecessary permissions over time, typically during role changes. The correct approach is to remove the old role''s permissions and grant only those required for the new role. Keeping old permissions violates least privilege. Deleting and recreating accounts is disruptive and unnecessary.',
  'Role change = Remove old, Add new. Never let permissions pile up like laundry.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),
(
  5,
  'identity_lifecycle',
  'During an exit interview, you learn that a terminated employee had access to sensitive financial systems. What should be done FIRST?',
  '["Collect the employee''s laptop and hardware token", "Notify the employee''s former manager to review shared files", "Disable the employee''s accounts immediately", "Delete all of the employee''s user accounts and data"]'::jsonb,
  2,
  'The first priority when an employee is terminated is to disable their accounts to prevent unauthorized access. Disabling rather than deleting preserves data and audit trails. Hardware collection, manager notification, and data review are all important but come after securing the accounts. Accounts should be disabled during the exit interview itself.',
  'FIRST = Freeze access. Disable during the exit interview, not after.',
  'apply',
  'first_action',
  'easy',
  1.50, -0.90, 0.20,
  'ai_generated', true
),
(
  5,
  'authentication_factors',
  'All of the following are examples of "something you have" authentication factors EXCEPT:',
  '["A hardware security token that generates one-time passwords", "A smartcard containing an embedded digital certificate", "A mobile phone used to receive push authentication notifications", "A personal identification number (PIN) memorized by the user"]'::jsonb,
  3,
  'A PIN is something you know (Type 1 factor), not something you have (Type 2 factor). Hardware tokens, smartcards, and mobile phones are all physical items that a user possesses, making them Type 2 factors. The CISSP exam frequently tests the distinction between authentication factor types.',
  'Something you HAVE = you can HOLD it in your hand. A PIN lives in your HEAD, not your hand.',
  'remember',
  'except_not',
  'easy',
  0.70, -1.80, 0.25,
  'ai_generated', true
),
(
  5,
  'sso_federation',
  'An organization deploys Single Sign-On (SSO) so employees authenticate once to access email, HR portal, and file shares. What is the MOST LIKELY security concern with this approach?',
  '["If the SSO credential is compromised, an attacker gains access to all connected systems", "SSO prevents the use of multifactor authentication for individual applications", "SSO makes it impossible to enforce different access levels across applications", "SSO requires each application to maintain its own separate user database"]'::jsonb,
  0,
  'The primary security risk of SSO is that it creates a single point of failure. If an attacker compromises the SSO credential, they gain access to every system connected to it. SSO does not prevent MFA, does not eliminate granular access controls, and actually centralizes (not decentralizes) the user database.',
  'SSO = Single Sign-On = Single point of failure. One key opens every door.',
  'understand',
  'most_likely',
  'easy',
  1.10, -1.40, 0.22,
  'ai_generated', true
),
(
  5,
  'least_privilege_sod',
  'A database administrator needs temporary elevated access to migrate a production database over the weekend. Which approach BEST follows the principle of least privilege?',
  '["Grant permanent administrator rights so the DBA can handle future migrations without delay", "Provide just-in-time elevated access that automatically expires after the migration window", "Give the DBA full root access to all servers since migration touches multiple systems", "Allow the DBA to use a shared administrator account that the team already has"]'::jsonb,
  1,
  'Just-in-time (JIT) access provides elevated privileges only when needed and for a limited duration. This follows least privilege by ensuring the DBA has access only during the migration window. Permanent admin rights, full root access, and shared accounts all violate least privilege and create unnecessary risk.',
  'JIT = Just In Time = Just enough, Just long enough, Just for this task.',
  'apply',
  'best_answer',
  'easy',
  1.30, -1.20, 0.20,
  'ai_generated', true
)
ON CONFLICT (question_text) DO NOTHING;