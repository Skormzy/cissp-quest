# Domain 5: Identity and Access Management (IAM) -- Comprehensive Knowledge Summary

---

## 1. COMPLETE TOPIC LIST

### 5.1 Control Physical and Logical Access to Assets
- Physical access controls (fences, gates, guards, locks, biometric scanners, cipher locks)
- Logical access controls (authentication, authorization, permissions)
- Asset categories requiring protection
  - Information (data in files, databases, paper records)
  - Systems (servers, web apps, IT services)
  - Devices (routers, switches, SAN/NAS, desktops, laptops, tablets, smartphones, BYOD)
  - Facilities (rooms, buildings, complexes)
  - Applications (software with role-based permissions)
  - Services (printing, network capacity, support offerings)
- CIA Triad in access control context
  - Confidentiality: prevent unauthorized data access
  - Integrity: prevent unauthorized modification
  - Availability: ensure authorized access when needed
- Access control principles
  - Need to know
  - Least privilege
  - Separation of duties and responsibilities
- Subjects vs. objects
  - Subject = active entity (user, process, service)
  - Object = passive entity (file, database, printer)
  - Entities can switch roles depending on context
- Groups vs. roles
  - Groups: named collections of users, user-centric, flexible
  - Roles: permission sets tied to job functions, function-centric
- Logical access modes: Create, Read, Read/Write, Update, Execute, Delete
- Access control administration approaches
  - Centralized (single point of control; single point of failure)
  - Decentralized (distributed control; harder to maintain consistency)
  - Hybrid (combination; most common in practice)
- Reference Monitor Concept (RMC) and Security Kernel

### 5.2 Design Identification and Authentication Strategy
- The AAA Model (Authentication, Authorization, Accounting)
  - Sometimes expanded to include Identification as a precursor
- Identification
  - Claiming an identity (username, badge, biometric presentation)
  - Must be unique, nondescriptive of role, securely issued
- Authentication factors
  - Type 1 -- Something you know (password, passphrase, PIN, cognitive passwords/security questions)
  - Type 2 -- Something you have (smartcard, hardware token, software token, mobile device)
  - Type 3 -- Something you are (biometrics -- physiological and behavioral)
  - Additional attributes: somewhere you are (geolocation, IP), context-aware, something you do (gesture, gait)
- Password policies and best practices
  - Maximum age, minimum age, complexity, length, history
  - NIST SP 800-63B recommendations (no forced expiration, allow paste, screen against common passwords, 8-64 chars)
  - PCI DSS v4.0 requirements (12+ chars, 90-day rotation, numeric+alpha, 4-password history)
- Passphrases (longer, easier to remember, harder to crack)
- Smartcards
  - Embedded microprocessor and certificates
  - Contact vs. contactless
  - Provide identification and authentication but not reliable alone for ID
- Memory cards (magnetic stripe, static data, susceptible to skimming)
- Authenticators / Tokens
  - Time-Based One-Time Passwords (TOTP) -- synchronous, clock-based
  - HMAC-Based One-Time Passwords (HOTP) -- asynchronous, counter-based
  - Hardware tokens (RSA SecureID) vs. software tokens (Google Authenticator)
- Biometrics
  - Physiological: fingerprints (minutiae -- loops, whorls, ridges, bifurcations), face scans, retina scans (most accurate, privacy concerns, invasive), iris scans (second most accurate, less intrusive), palm scans (vein patterns), hand geometry
  - Behavioral: voice pattern recognition, signature dynamics, keystroke dynamics, gait analysis
  - Biometric error ratings
    - False Rejection Rate (FRR) / Type 1 error (valid user rejected)
    - False Acceptance Rate (FAR) / Type 2 error (invalid user accepted -- more dangerous)
    - Crossover Error Rate (CER) / Equal Error Rate (EER) -- lower is more accurate
    - Sensitivity adjustment: more sensitive = more Type 1 errors; less sensitive = more Type 2 errors
    - FRR and FAR are inversely related
  - Biometric registration/enrollment (reference template creation)
  - Enrollment time (should be under 2 minutes)
  - Throughput rate (should be 6 seconds or less)
  - Template usage: 1:N for identification, 1:1 for authentication
  - Templates should be hashed/one-way -- never store raw biometric data
- Multifactor Authentication (MFA)
  - Must use two or more different factor types
  - Two items from the same factor = single-factor (e.g., password + PIN = still single-factor)
  - SMS-based 2FA deprecated by NIST due to SIM fraud and device theft
- Passwordless authentication
  - FIDO Alliance standards and passkeys (e.g., YubiKey)
  - Biometric unlock, security tokens, mobile device auth
  - Advantages: reduced phishing risk, eliminates weak passwords, less friction
  - Challenges: device dependency, biometric limitations, higher implementation costs
- Device authentication
  - Computer/system accounts, domain join
  - Device fingerprinting (OS, browser, fonts, plug-ins, screen resolution)
  - 802.1X port-based authentication
  - MDM with context-aware authentication and NAC
- Service authentication
  - Service accounts (non-human accounts for apps/services)
  - Built-in accounts (e.g., SQL Server sa account)
  - Password never expires setting; manual rotation with strong passwords
  - Certificate-based authentication for services
  - API-based authentication for web services
  - Noninteractive login configuration
- Mutual authentication (both parties verify each other, typically via certificates)
- Registration, proofing, and establishment of identity
  - In-person proofing (passport, license, birth certificate)
  - Knowledge-Based Authentication (KBA) for online proofing (credit bureau questions)
  - Cognitive passwords / security questions (static, user-selected; NIST discourages)
  - Identity Proofing is part of provisioning in the identity lifecycle
- Authenticator Assurance Levels (AAL) per NIST SP 800-63B
  - AAL1: some assurance, single-factor, secure protocol
  - AAL2: high confidence, MFA, approved cryptographic techniques
  - AAL3: very high confidence, MFA, hardware cryptographic authenticator, impersonation resistance
- Session management
  - Session identifiers, web frameworks for session creation/maintenance/termination
  - Session timeouts (high-value: 2-5 min; low-value: 15-30 min)
  - Session hijacking prevention (re-authentication, schedule limitations, login limitations, timeouts, screensavers)
  - Session encryption, continuous re-authentication (VPN)
  - Session ID security: sufficient length (128+ bits), sufficient entropy (64+ bits), meaningless/unpredictable
- CAPTCHA (prevent automated account creation, spam, brute-force)
- Seven Laws of Identity (Kim Cameron)
  - User control and consent, minimal disclosure, justifiable parties, directed identity, pluralism, human integration, consistent experience
- Credential management systems
  - W3C Credential Management API
  - Password vaults / password managers (encrypted database, master password, single point of failure)
  - Windows Credential Manager
  - Scripted access / logon scripts (stored credentials in cleartext -- must protect)
- Single Sign-On (SSO)
  - Centralized authentication, authenticate once for multiple resources
  - Pros: better UX, stronger passwords, centralized administration, enforced timeouts
  - Cons: single point of failure (availability and security), legacy system integration challenges
- LDAP and directory services
  - Lightweight Directory Access Protocol
  - Microsoft Active Directory Domain Services (AD DS)
  - Domains, trusts (one-way, two-way), security domains
  - LDAP used by PKI for certificate queries
- Kerberos
  - SSO protocol using symmetric encryption (AES in v5)
  - Key Distribution Center (KDC) = Authentication Service (AS) + Ticket Granting Service (TGS)
  - Ticket Granting Ticket (TGT) -- proof of authentication
  - Service Ticket (ST) -- proof of authorization for specific resource
  - Kerberos principal, Kerberos realm
  - Authentication flow: client -> AS -> TGT -> TGS -> service ticket -> resource server
  - Password never crosses network (encrypted with hash of user password)
  - Requires time synchronization (5-minute tolerance, NTP)
  - Uses port 88
  - Single point of failure (KDC compromise = all keys compromised)
  - Vulnerabilities: TOCTOU attacks, session hijacking
  - Kerberos exploitation attacks: overpass the hash, pass the ticket, silver ticket, golden ticket, Kerberoasting, ASREPRoast, Kerberos brute force
- SESAME (Secure European System for Applications in a Multi-Vendor Environment)
  - Improved Kerberos: supports symmetric AND asymmetric crypto, issues multiple tickets
  - Mitigates TOCTOU vulnerability
  - Not widely adopted because Kerberos is built into Windows, macOS, Linux
- Federated Identity Management (FIM)
  - Extends SSO across organizational boundaries
  - Trust relationships between organizations
  - Three components: principal/user, identity provider (IdP), relying party/service provider (SP)
  - On-premises federation (most control)
  - Cloud-based federation (third-party managed)
  - Hybrid federation (combination)
  - Just-in-Time (JIT) provisioning in federated systems
- Federated access standards
  - SAML (Security Assertion Markup Language)
    - Open XML-based standard for exchanging authentication and authorization data
    - OASIS standard since 2005 (SAML 2.0)
    - Three entities: principal, service provider, identity provider
    - Four components: assertions, protocol, bindings, profiles
    - Three assertion types: authentication, attribute, authorization
    - Does NOT contain user password in assertion
    - Provides both authentication and authorization
  - OAuth 2.0
    - Authorization framework (NOT authentication)
    - RFC 6749
    - Uses access tokens, API-based
    - Never shares user credentials with third parties
    - Not backward compatible with OAuth 1.0
  - OpenID Connect (OIDC)
    - Authentication layer built on OAuth 2.0
    - Provides BOTH authentication and authorization
    - Uses JSON Web Tokens (JWT) / ID tokens
    - RESTful API for user profile information
    - Maintained by OpenID Foundation
  - WS-Federation (authentication and authorization, OASIS standard, IBM/Microsoft/Verisign)
- Identity as a Service (IDaaS)
  - Cloud-based IAM providing SSO, MFA, provisioning, directory services
  - Identity types: cloud identity, synced identity, linked identity, federated identity
  - Risks: availability, data protection, third-party trust
- RADIUS (Remote Authentication Dial-In User Service)
  - Centralized AAA for remote access
  - UDP by default (port 1812 auth, port 1813 accounting)
  - Encrypts only password (not full session)
  - Can use TLS over TCP (port 2083, RFC 6614)
  - Network access server is RADIUS client
  - Callback security for dial-up
- TACACS+ (Terminal Access Controller Access Control System Plus)
  - Cisco-developed, released as open standard
  - Separates authentication, authorization, and accounting into independent processes
  - Encrypts ALL authentication data (not just password)
  - TCP port 49
  - Higher reliability than RADIUS
- Zero Trust architecture
  - No trust boundary, no network edge
  - Continuous authentication and validation
  - NIST SP 800-207
  - Components: subjects, policy engine, policy administrator, policy enforcement point (PEP), policy decision point (PDP = policy engine + policy administrator)
  - Trust algorithm evaluates: identity, permissions, system config, threat intelligence, security posture
- Access policy enforcement
  - Policy Decision Point (PDP) -- makes access decisions based on rules
  - Policy Enforcement Point (PEP) -- enforces decisions, acts as gatekeeper

### 5.3 Federated Identity with a Third-Party Service
- On-premises federation
- Cloud-based federation
- Hybrid federation
- IDaaS capabilities and risks
- Identity types in IDaaS (cloud, synced, linked, federated)

### 5.4 Implement and Manage Authorization Mechanisms
- Discretionary Access Control (DAC)
  - Owner determines access
  - Uses ACLs (Access Control Lists)
  - Flexible but less secure
  - NTFS is an example
  - Identity-based access control is a DAC subset
- Role-Based Access Control (RBAC)
  - Permissions assigned to roles/groups, not individual users
  - Mirrors organizational hierarchy
  - Types: Non-RBAC, Limited RBAC, Hybrid RBAC, Full RBAC
  - Helps enforce least privilege, prevents privilege creep
  - Task-Based Access Control (TBAC) is a related variant
- Rule-Based Access Control
  - Global rules applied to all subjects equally
  - Firewalls are the classic example (ACL with implicit deny)
  - Restrictions/filters
- Attribute-Based Access Control (ABAC)
  - Rules with multiple attributes (user, device, environment, resource, action)
  - More flexible than rule-based
  - Used in SDN, SD-WAN
  - Plain language policy statements
  - eXtensible Access Control Markup Language (XACML) standard
- Mandatory Access Control (MAC)
  - Classification labels on subjects AND objects
  - System determines access based on labels
  - Lattice-based model
  - Hierarchical environment (Top Secret > Secret > Confidential > Unclassified)
  - Compartmentalized environment (isolated security domains, no relationship between compartments)
  - Hybrid environment (hierarchy + compartments)
  - Prohibitive/implicit deny philosophy
  - More secure but less flexible/scalable than DAC
  - Primarily used in government/military
  - Enforces need-to-know through compartmentalization
- Non-discretionary access control (someone other than owner determines access)
- Risk-Based Access Control
  - Evaluates environment, situation, and security policies dynamically
  - May use machine learning for predictive decisions
  - Can check MFA compliance and device compliance
  - NAC posture assessment is a form of risk-based control
- Authorization mechanisms
  - Implicit deny (deny by default)
  - Access control matrix (subjects x objects x permissions)
  - Access Control Lists (ACLs) -- object-focused
  - Capability lists -- subject-focused
  - Constrained interfaces / restricted interfaces
  - Content-dependent controls (access based on data content, e.g., database views)
  - Context-dependent controls (access based on activity sequence, time, location)
- Permissions vs. rights vs. privileges
  - Permissions: access granted for an object (read, write, delete, execute)
  - Rights: ability to take an action on a system
  - Privileges: combination of elevated rights and permissions

### 5.5 Manage the Identity and Access Provisioning Lifecycle
- Provisioning and onboarding
  - Account creation (enrollment/registration)
  - Identity proofing (photo ID, background check, credit check, clearance verification)
  - Automated provisioning systems
  - Group/role assignment based on department/job
  - Hardware issuance (laptops, tokens, smartcards)
  - Onboarding activities (AUP signing, security training, password manager setup, 2FA config)
- Deprovisioning and offboarding
  - Account deletion vs. disabling (disable preferred initially for data access)
  - Disabling during exit interview for terminated employees
  - Hardware collection
  - Benefit termination
  - 30-day typical policy for deleting disabled accounts
  - Sabotage risk if access retained after termination
  - Account revocation
- Role definition and transition
  - Creating new roles for new job functions
  - Mapping roles to groups with appropriate privileges
  - Updating access when employees change positions
- Account maintenance
  - Ongoing rights/privileges adjustment
  - Following established procedures for access changes
- Account access review
  - Regular review of user, privileged, system, and service accounts
  - Automated scripts for finding inactive accounts
  - Privilege monitoring for elevated accounts
  - Frequency based on account value and risk
  - Privileged/admin accounts reviewed most frequently (potentially weekly)
  - Access review mitigates privilege creep and excessive privileges
- Privilege creep
  - Accumulation of unneeded privileges over time as roles change
  - Violates least privilege principle
  - Prevented by proper access reviews and role transitions
- Excessive privileges
  - User has more access than job requires
  - Detected through access reviews
- Vendor access provisioning
  - Same or greater care as employee provisioning
  - May include security review or vendor facility inspection
  - Third-party vendor relationships represent significant risk
- Privilege escalation
  - Horizontal: gaining similar privileges from other accounts (lateral movement)
  - Vertical: gaining higher-level privileges (e.g., user to admin)
  - Prevention: limiting permissions, sanitizing inputs, disabling unused ports/services
  - Using su and sudo on Linux
    - su: switches to root, logs as root account
    - sudo: runs command with elevated privileges, logs under user's account
    - sudoers file controls who can use sudo
    - Privileged users should maintain two accounts (standard + admin)
  - Service account privilege escalation (avoid using LocalSystem; create dedicated service accounts)
  - Mimikatz and related tools
- Service account management
  - Non-human accounts for applications, services, systems
  - Password never expires setting with strong manual rotation
  - Limit to single purpose, minimum necessary privileges
  - Disable interactive login
  - Regular review and monitoring

### 5.6 Implement Authentication Systems
- SAML implementation considerations
- OpenID Connect / OAuth implementation
- Kerberos deployment (Active Directory requirement on Windows)
- RADIUS configuration and deployment
- TACACS+ configuration and deployment
- Zero trust implementation

### Access Control Attacks
- Password attacks
  - Dictionary attacks (predefined word lists, foreign words included)
  - Brute-force attacks (systematic all-combination attempts)
  - Hybrid attacks (dictionary + brute-force with modifications)
  - Password spraying (same password across many accounts to avoid lockout)
  - Credential stuffing (stolen credentials tested across many sites)
  - Birthday attacks (finding hash collisions)
  - Rainbow table attacks (precomputed hash databases)
    - Defeated by salting (random bits added before hashing)
    - Pepper adds further protection (large constant stored separately)
    - Salting algorithms: Argon2, bcrypt, PBKDF2
- Pass-the-hash (PtH) attacks
  - Captured hash sent directly to authentication service
  - Primarily Windows NTLM/Kerberos
  - Tools: Mimikatz, DCSync
- Kerberos exploitation attacks
  - Overpass the hash / pass the key
  - Pass the ticket
  - Silver ticket (forged TGS ticket using service account hash)
  - Golden ticket (forged TGT using KRBTGT account hash)
  - ASREPRoast (targeting users without preauthentication)
  - Kerberoasting (harvesting encrypted TGS tickets for offline cracking)
  - Kerberos brute force (kerbrute.py, Rubeus)
- Sniffer/eavesdropping attacks
  - Mitigations: encryption, avoid insecure protocols, OTPs, physical security, IDS monitoring
- Spoofing/masquerading/impersonation attacks
  - IP spoofing, email spoofing, phone number spoofing, fake login screens
- Mimikatz capabilities
  - Read passwords from memory (LSASS)
  - Extract Kerberos tickets
  - Extract certificates and private keys
  - Read LM/NTLM hashes
  - Read cleartext passwords from LSASS
  - List running processes
  - Can run as fileless malware via PowerShell
- Social engineering (help desk password resets, phishing)

---

## 2. KEY DEFINITIONS AND CONCEPTS

**Access Control**: The collection of mechanisms protecting organizational assets while allowing controlled access to authorized subjects.

**Subject**: An active entity that accesses a passive object. Users, programs, processes, services, computers.

**Object**: A passive entity providing information to active subjects. Files, databases, printers, storage media.

**Identification**: The process of a subject claiming an identity (e.g., entering a username). Must be unique.

**Authentication**: Verifying the claimed identity by comparing one or more factors against a trusted database.

**Authorization**: Granting or restricting access to objects based on a subject's proven identity and assigned privileges.

**Accounting (Auditing)**: Tracking and recording subject activities to create an audit trail for accountability.

**Accountability**: The ability to hold users responsible for their actions. Requires effective identification, authentication, and auditing. The "Principle of Access Control."

**Nonrepudiation**: A user cannot believably deny actions recorded in audit logs after proper authentication.

**Need to Know**: Access is restricted to only what is required to perform a specific job function.

**Least Privilege**: Granting only the minimum permissions necessary for a user or system to function.

**Separation of Duties**: Requiring more than one person to complete a sensitive task, preventing fraud and errors.

**Implicit Deny**: Access is denied by default unless explicitly granted. Foundational authorization principle.

**Privilege Creep**: Gradual accumulation of unnecessary access rights as a user changes roles over time.

**Excessive Privilege**: A user having more access than their job requires at any given point.

**Single Sign-On (SSO)**: Authenticating once and accessing multiple resources without re-authenticating.

**Federated Identity Management (FIM)**: Linking user identities across organizations for cross-boundary SSO via trust relationships.

**Identity as a Service (IDaaS)**: Cloud-based identity and access management providing SSO, MFA, provisioning, and directory services.

**Just-in-Time (JIT) Access**: Granting elevated privileges only when needed, for a limited duration, often automated.

**JIT Provisioning**: Automatically creating accounts on third-party systems at the time of first access.

**Key Distribution Center (KDC)**: The trusted third-party server in Kerberos that issues tickets. Contains the AS and TGS.

**Ticket Granting Ticket (TGT)**: Encrypted proof that a subject has authenticated through the KDC.

**Service Ticket (ST)**: Encrypted proof that a subject is authorized to access a specific resource.

**SAML Assertion**: An XML-based message from an identity provider containing authentication, attribute, or authorization statements.

**OAuth Access Token**: A token issued by an authorization server that grants a third-party application permission to access resources without sharing credentials.

**JSON Web Token (JWT)**: The ID token format used by OpenID Connect for conveying authentication and profile information.

**Crossover Error Rate (CER) / Equal Error Rate (EER)**: The point where FRR equals FAR on a biometric system. Lower CER = more accurate device.

**False Rejection Rate (FRR) / Type 1 Error**: Rate at which a biometric system incorrectly rejects a valid user.

**False Acceptance Rate (FAR) / Type 2 Error**: Rate at which a biometric system incorrectly accepts an invalid user. More dangerous than Type 1.

**Biometric Template**: A hashed digital representation of a person's unique biometric features, stored instead of raw data.

**XACML (eXtensible Access Control Markup Language)**: An OASIS standard defining attribute-based access control policy language, architecture, and processing model.

**Reference Monitor Concept (RMC)**: An abstract concept where a rules-based decision tool mediates all access between subjects and objects, with all activity logged. An implementation of the RMC is a security kernel.

**Policy Decision Point (PDP)**: The component that makes access control decisions based on predefined policies and rules.

**Policy Enforcement Point (PEP)**: The component that enforces access decisions made by the PDP, acting as a gatekeeper.

**Zero Trust**: A security model assuming no implicit trust; every action is validated continuously regardless of network location.

**RADIUS**: A UDP-based AAA protocol for centralizing remote access authentication. Encrypts only the password.

**TACACS+**: A TCP-based AAA protocol that separates authentication, authorization, and accounting into independent processes and encrypts all data.

**Passkey**: A hardware-based passwordless authentication credential (e.g., YubiKey), promoted by the FIDO Alliance.

---

## 3. CALCULATIONS AND FORMULAS

### Biometric Error Rates
- **FRR (False Rejection Rate)** = (Number of false rejections / Total valid authentication attempts) x 100
- **FAR (False Acceptance Rate)** = (Number of false acceptances / Total invalid authentication attempts) x 100
- **CER (Crossover Error Rate)** = The sensitivity setting where FRR = FAR. Used to compare biometric device accuracy. Lower CER = better device.

### Password Keyspace
- **Keyspace** = (Number of possible characters)^(Password length)
- Adding 8 bits to an encryption key increases the keyspace by a factor of 2^8 = 256.
- Longer passwords exponentially increase brute-force difficulty.

### Birthday Paradox (Applied to Hash Collisions)
- With N possible hash values, there is a 50% chance of collision after approximately sqrt(N) hashed values.
- For a hash producing 2^n possible outputs, collisions become probable after approximately 2^(n/2) attempts.

### XP Calculations (CISSP Quest Game)
- Easy question: 25 XP
- Medium question: 50 XP
- Hard question: 100 XP
- Wrong answer: 5 XP
- Level = floor(1 + sqrt(XP / 100))

---

## 4. COMMON EXAM TRAPS AND GOTCHAS

### Authentication Factor Confusion
- **Trap**: A password AND a PIN used together is NOT multifactor authentication. Both are "something you know" -- still single-factor.
- **Gotcha**: A smartcard + PIN IS multifactor (something you have + something you know).
- **Trap**: SMS-based OTP is deprecated by NIST for federal use but still widely used commercially.

### Biometric Error Types
- **Trap**: Type 1 = False REJECTION (valid user denied). Type 2 = False ACCEPTANCE (invalid user admitted).
- **Gotcha**: Type 2 is always worse from a security perspective. The exam loves asking which is "more dangerous."
- **Trap**: Lower CER = MORE accurate (not less). Students often reverse this.
- **Gotcha**: Retina scans are the MOST accurate biometric but raise privacy concerns (can reveal medical conditions). Iris scans are SECOND most accurate.

### Access Control Model Confusion
- **Trap**: DAC = owner decides. MAC = system decides based on labels. Non-discretionary = someone other than owner decides.
- **Gotcha**: The Destination CISSP text places RBAC, rule-based, and ABAC as subtypes of DAC (owner discretion). The Chapple text treats RBAC and others as nondiscretionary. The exam generally treats MAC as the only truly mandatory model and all others as forms of DAC or nondiscretionary.
- **Trap**: RBAC can use groups OR roles -- they are different concepts. Groups are user-centric collections; roles are function-centric permission sets.
- **Gotcha**: MAC requires BOTH subjects AND objects to have labels. Not just objects.

### OAuth vs. OIDC vs. SAML
- **Trap**: OAuth is ONLY authorization (not authentication). OIDC provides authentication ON TOP of OAuth.
- **Gotcha**: SAML provides both authentication AND authorization. It uses XML. OIDC uses JSON (JWT).
- **Trap**: OAuth 2.0 is NOT backward compatible with OAuth 1.0.

### Kerberos
- **Trap**: Kerberos passwords NEVER traverse the network. The KDC encrypts a session key with the hash of the user's password.
- **Gotcha**: Kerberos requires clocks synchronized within 5 minutes. Time drift = authentication failure.
- **Trap**: Kerberos v5 uses AES (symmetric only). It does NOT support asymmetric encryption. SESAME does.
- **Gotcha**: Golden ticket = KRBTGT hash compromised = attacker can forge any ticket indefinitely.

### RADIUS vs. TACACS+
- **Trap**: RADIUS encrypts only the password. TACACS+ encrypts the entire session.
- **Gotcha**: RADIUS uses UDP; TACACS+ uses TCP. TACACS+ separates AAA functions; RADIUS combines authentication and authorization.

### Provisioning Lifecycle
- **Trap**: When an employee leaves, disable the account FIRST (not delete). Deletion may destroy access to encrypted data.
- **Gotcha**: Account should be disabled during the exit interview, not after.
- **Trap**: Privilege creep happens when employees CHANGE roles without having old permissions removed. It is not the same as excessive provisioning at hire time.

### Zero Trust
- **Trap**: The PDP (Policy Decision Point) = Policy Engine + Policy Administrator. The PEP (Policy Enforcement Point) is separate.
- **Gotcha**: Policy administrators in zero trust are NOT human individuals -- they are system components.

### Password Best Practices
- **Trap**: NIST now says passwords should NOT expire unless compromised. PCI DSS still requires 90-day rotation. The exam may test which standard applies.
- **Gotcha**: Increasing password LENGTH has more impact against brute-force than increasing complexity requirements.

---

## 5. COMPARISONS AND DISTINCTIONS

### DAC vs. MAC vs. RBAC vs. ABAC

| Feature | DAC | MAC | RBAC | ABAC |
|---------|-----|-----|------|------|
| Who decides access | Resource owner | System (labels) | Administrator (roles) | Policy engine (attributes) |
| Flexibility | High | Low | Moderate | Very high |
| Scalability | Moderate | Low | High | Very high |
| Common use | File systems (NTFS) | Military/government | Enterprise IT | Cloud, SDN, SD-WAN |
| Key mechanism | ACLs set by owner | Classification labels | Role/group membership | Attribute-based rules |
| Security level | Lower | Highest | Moderate-high | High |
| Central control | No | Yes | Yes | Yes |
| Example | Windows file sharing | Top Secret documents | Active Directory groups | "Allow managers from HQ during business hours" |

### Kerberos vs. SAML vs. OAuth vs. OIDC

| Feature | Kerberos | SAML | OAuth 2.0 | OIDC |
|---------|----------|------|-----------|------|
| Primary function | Authentication + SSO | Authentication + Authorization | Authorization only | Authentication + Authorization |
| Protocol type | Ticket-based | XML assertion-based | Token-based (API) | Token-based (JWT) |
| Environment | Internal network (LAN) | Web/cloud (federation) | Web/cloud (API access) | Web/cloud (identity layer) |
| Data format | Encrypted tickets | XML assertions | Access tokens | JSON Web Tokens |
| Encryption | Symmetric (AES) | TLS + digital signatures | TLS | TLS |
| Standard body | MIT/IETF | OASIS | IETF (RFC 6749) | OpenID Foundation |
| Shares credentials | No (hash-based proof) | No (assertions only) | No (tokens only) | No (tokens only) |

### RADIUS vs. TACACS+

| Feature | RADIUS | TACACS+ |
|---------|--------|---------|
| Developer | Open standard | Cisco (open standard) |
| Transport | UDP (1812/1813) | TCP (49) |
| Encryption | Password only | Full session |
| AAA separation | Combined auth+authz | Separate auth, authz, acct |
| Primary use | Remote access, ISP | Network device management |
| Flexibility | Less granular | More granular control |

### Type 1 vs. Type 2 Biometric Errors

| Aspect | Type 1 (False Rejection) | Type 2 (False Acceptance) |
|--------|--------------------------|---------------------------|
| What happens | Valid user is rejected | Invalid user is accepted |
| Also called | False negative, FRR | False positive, FAR |
| Impact | User frustration, productivity loss | Security breach, unauthorized access |
| Severity | Less dangerous | More dangerous |
| Caused by | Sensitivity too high | Sensitivity too low |

### Authentication vs. Authorization vs. Accountability

| Concept | Purpose | Example |
|---------|---------|---------|
| Authentication | Prove who you are | Enter username + password + fingerprint |
| Authorization | Determine what you can do | User has read-only access to finance folder |
| Accountability | Track what you did | Audit log records user accessed file at 3:15 PM |

### Identification vs. Authentication

| Aspect | Identification | Authentication |
|--------|----------------|----------------|
| Action | Claiming an identity | Proving that identity |
| Example | Entering a username | Entering the matching password |
| Nature | Public (not secret) | Private (must be protected) |
| Alone | Insufficient for access | Requires identification first |

### ACL vs. Capability List

| Aspect | ACL | Capability List |
|--------|-----|-----------------|
| Focus | Object-centric | Subject-centric |
| Lists | Users/groups with access to an object | Objects a subject can access |
| Example | File X: Alice=RW, Bob=R | Alice: File X=RW, File Y=R, Printer=Print |

### Centralized vs. Decentralized Access Control

| Aspect | Centralized | Decentralized |
|--------|-------------|---------------|
| Administration | Single entity/team | Multiple teams/individuals |
| Overhead | Lower | Higher |
| Consistency | Uniform | May be inconsistent |
| Single point of failure | Yes | No |
| Scalability | Good (add controllers) | Limited by coordination |
| Example | Active Directory | Individual system logins |

### SSO vs. FIM

| Aspect | SSO | FIM |
|--------|-----|-----|
| Scope | Within one organization | Across multiple organizations |
| Trust | Internal | Cross-organizational trust relationships |
| Example | AD domain login | Google account used to log into Pinterest |

### Synchronous vs. Asynchronous Tokens

| Aspect | Synchronous (TOTP) | Asynchronous (HOTP) |
|--------|---------------------|----------------------|
| Mechanism | Time-based code generation | Counter-based code generation |
| Requirement | Clock synchronization | Button press / event trigger |
| Expiry | Changes automatically at intervals | Valid until used |
| Example | Google Authenticator | RSA SecureID challenge-response |
| Prevalence | More common | Less common, more complex |

---

## 6. LEGAL AND REGULATORY

### Identity-Related Laws and Regulations
- **NIST SP 800-63B (Digital Identity Guidelines)**: Federal guidance on authentication lifecycle management, AAL levels, password policy, deprecation of SMS-based 2FA.
- **PCI DSS v4.0**: Payment card industry requirements for password policies (12+ chars, 90-day rotation, complexity, 4-password history). Applies to organizations handling cardholder data.
- **HIPAA**: Healthcare regulations requiring access controls to protect PHI. Need-to-know and minimum necessary standards apply to identity and access.
- **GDPR**: European data protection regulation requiring consent for identity data processing, right to erasure, data minimization for identity attributes.
- **FERPA**: Education records privacy. Access controls for student information systems.
- **SOX (Sarbanes-Oxley)**: Financial reporting controls including separation of duties, access reviews, and audit trails for financial systems.
- **GLBA (Gramm-Leach-Bliley Act)**: Financial institution requirements for protecting customer identity and financial data.

### Privacy Considerations for Biometric Data
- Biometric data is uniquely sensitive -- cannot be changed if compromised.
- Must be stored as hashed templates, never raw data.
- Retina scans can reveal medical conditions (blood pressure, pregnancy), raising privacy concerns.
- Some jurisdictions have specific biometric privacy laws (e.g., Illinois BIPA).

### Identity Governance Requirements
- Audit trails and logging required by most regulatory frameworks.
- Regular access reviews mandated by SOX, HIPAA, PCI DSS.
- Service account management and privileged access monitoring are compliance requirements.

---

## 7. FRAMEWORKS AND METHODOLOGIES

### Access Control Models
- **Bell-LaPadula Model**: MAC model focused on confidentiality. "No read up, no write down." Subjects cannot read objects above their clearance or write to objects below their clearance.
- **Biba Model**: MAC model focused on integrity. "No read down, no write up." Prevents corruption of higher-integrity data.
- **Clark-Wilson Model**: Integrity model using well-formed transactions and separation of duties. Implements constrained interfaces.
- **Brewer-Nash Model (Chinese Wall)**: Prevents conflicts of interest by dynamically restricting access based on what a user has previously accessed.

### Identity Governance Framework
- Identity lifecycle management (provisioning, review, revocation)
- Access certification/recertification campaigns
- Segregation of duties enforcement
- Role mining and role engineering
- Privileged access management (PAM)
- Automated provisioning and deprovisioning

### NIST Zero Trust Architecture (SP 800-207)
- Core components: subjects, policy engine, policy administrator, PDP, PEP
- Trust algorithm evaluates multiple factors before granting access
- Continuous authentication throughout session
- No implicit trust based on network location

### NIST Digital Identity Guidelines (SP 800-63)
- SP 800-63A: Enrollment and Identity Proofing
- SP 800-63B: Authentication and Lifecycle Management (AAL1/2/3)
- SP 800-63C: Federation and Assertions

### FIDO Alliance Framework
- FIDO2 / WebAuthn standards for passwordless authentication
- Hardware passkeys (YubiKey, Titan Security Key)
- Phishing-resistant authentication

### Kim Cameron's Seven Laws of Identity
1. User control and consent
2. Minimal disclosure and constrained use
3. Justifiable parties
4. Directed identity (omni-directional for public, uni-directional for private)
5. Pluralism of operators and technologies
6. Human integration
7. Consistent experience across contexts

### OWASP Session Management Guidelines
- Session ID generation best practices (128+ bit length, 64+ bit entropy, meaningless/unpredictable)
- Timeout recommendations (2-5 min for high-value, 15-30 min for low-value)
- Secure cookie attributes, session fixation prevention

---

## 8. PROCESS FLOWS AND LIFECYCLES

### Identity Lifecycle (Provisioning -> Managing -> Deprovisioning)

```
1. PROVISIONING (Onboarding)
   - Identity proofing (government ID, background check)
   - Account creation (unique username, nondescriptive)
   - Biometric enrollment (if applicable)
   - Role/group assignment based on job function
   - Hardware issuance (laptop, token, smartcard)
   - Onboarding training (AUP, security practices, 2FA setup)

2. MANAGEMENT (Ongoing)
   - Access reviews (frequency based on account value/risk)
   - Role transitions (add new permissions, REMOVE old ones)
   - Privilege monitoring (elevated accounts reviewed most)
   - Password management and rotation
   - Service account review

3. DEPROVISIONING (Offboarding)
   - Disable account during exit interview
   - Supervisor reviews user data and encrypted files
   - Hardware collection
   - Benefit termination
   - Delete disabled account within policy timeframe (typically 30 days)
```

### Kerberos Authentication Flow

```
1. User enters username + password on client workstation
2. Client sends plaintext username to Authentication Service (AS)
   (password is NOT sent)
3. AS verifies username in database
4. KDC generates:
   a. Session key encrypted with hash of user's password
   b. Ticket Granting Ticket (TGT) encrypted with TGS secret key
5. Both sent to client
6. Client decrypts session key using hash of entered password
   (proves user knows password without sending it)
7. Client stores TGT for future use

--- When accessing a resource: ---

8. Client sends TGT + request to Ticket Granting Service (TGS)
9. TGS verifies TGT, checks access control matrix
10. TGS creates Service Ticket (ST) encrypted with target service's key
11. Client sends ST to target resource server
12. Resource server verifies ST with KDC
13. Access granted; session established
```

### SAML Assertion Flow (SP-Initiated)

```
1. User (principal) attempts to access a resource at the Service Provider (SP)
2. SP determines user is not authenticated
3. SP redirects user to Identity Provider (IdP)
4. User authenticates at IdP (username/password/MFA)
5. IdP generates SAML assertion containing:
   - Authentication statement (proof of login, method, time)
   - Attribute statement (user info, entitlements)
   - Authorization statement (what user can access)
6. IdP sends SAML assertion to SP (via user's browser redirect)
7. SP reads assertion, makes authorization decision
8. SP grants or denies access to the requested resource
```

### OAuth 2.0 Authorization Flow

```
1. User wants to use third-party app (Client) to access resources
2. Client redirects user to Authorization Server (resource owner)
3. User authenticates with Authorization Server
4. Authorization Server shows user what permissions the Client requests
5. User approves access
6. Authorization Server sends authorization code to Client
7. Client exchanges code for access token
8. Client uses access token in API calls to access resources
9. Resource server validates token and returns requested data
```

### Access Review Process

```
1. Generate list of users and their current permissions for a system
2. Send list to system/data owner for verification
3. Owner confirms or flags each user's access level
4. Remove access for users who no longer require it
5. Investigate any unauthorized or excessive permissions
6. Document findings and actions taken
7. Schedule next review (frequency based on asset value)
   - High-value accounts (admin/root/service): weekly to monthly
   - Standard user accounts: quarterly to annually
```

### Zero Trust Access Flow

```
1. Subject (user/device/service) initiates access request
2. Request arrives at Policy Enforcement Point (PEP)
3. PEP forwards request to Policy Decision Point (PDP)
4. PDP (Policy Engine + Policy Administrator) evaluates:
   - Subject identity and authentication status
   - Device security posture and compliance
   - Requested resource sensitivity
   - Threat intelligence feeds
   - SIEM data and behavioral analytics
5. Trust algorithm produces grant/deny/revoke decision
6. Policy Administrator creates session token (if granted)
   or instructs PEP to terminate connection (if denied)
7. PEP enforces the decision
8. Continuous monitoring throughout session
9. Access can be revoked at any time based on new risk signals
```

---

## 9. THINK LIKE A MANAGER

### Identity Governance Decisions
- **Risk-based access reviews**: Prioritize review frequency based on the sensitivity of systems and data. Admin accounts and service accounts should be reviewed far more frequently than standard user accounts.
- **Automated provisioning vs. manual**: Automated provisioning reduces errors and ensures consistency. Manual processes introduce delays and inconsistencies. Managers should push for automation through IAM platforms.
- **Balancing security with usability**: SSO and passwordless solutions reduce friction for users while maintaining strong security. The manager's job is to find the sweet spot between strict controls and productive access.

### Access Certification Reviews
- Managers are accountable for their team's access. They must regularly certify that each team member's permissions are appropriate for their current role.
- When an employee transfers departments, the MANAGER of the old department is responsible for initiating access revocation, and the new manager is responsible for requesting appropriate new access.
- Rubber-stamping access reviews is a compliance failure. Managers must actually examine each user's access.

### Privileged Access Management (PAM)
- Administrative accounts should never be used for daily work (email, browsing). Admins should have separate standard and elevated accounts.
- Just-in-time access for privileged operations reduces the window of exposure.
- All privileged actions should be logged and regularly audited.
- Service accounts with excessive privileges are a top attack vector. Managers should insist on least-privilege service accounts.

### Vendor and Third-Party Access
- Treat vendor access with equal or greater scrutiny than employee access. Vendors are an extension of your attack surface.
- Vendor accounts should have defined expiration dates and be reviewed at contract milestones.
- Ensure contracts specify vendor responsibilities for protecting credentials and identity data.

### Incident Response for Identity Compromise
- When credentials are suspected compromised: immediately disable the account, force password reset, review audit logs, and assess lateral movement.
- A compromised privileged account (especially KRBTGT in AD) may require rebuilding the entire domain.
- Manager decision: when a breach involves identity systems, assume the worst and verify everything.

### Key Manager-Level Questions
- "Does this user NEED this access to do their job?" (Need to know + least privilege)
- "Are we reviewing access often enough for our highest-risk systems?"
- "Do we have automated deprovisioning when employees leave?"
- "Are our service accounts limited to minimum required privileges?"
- "Can we prove accountability for every action in our audit trail?"

---

## 10. EXAM STRATEGY

### How Domain 5 Is Tested
- Domain 5 accounts for approximately 13% of the CISSP exam.
- Questions tend to be scenario-based: "An organization wants to..." or "A security manager discovers..."
- Heavy emphasis on understanding the WHY behind controls, not just the WHAT.
- Expect drag-and-drop matching questions (e.g., match access control models to descriptions).

### Common Question Patterns
1. **"Which factor type?"** -- Given a scenario, identify if the authentication is something you know/have/are. Watch for trick answers mixing two items from the same factor.
2. **"Which access control model?"** -- Given a scenario description, identify DAC/MAC/RBAC/ABAC. Look for keywords: "owner decides" = DAC, "labels/clearance" = MAC, "job role/group" = RBAC, "attributes/context" = ABAC.
3. **"What should the manager do?"** -- These test judgment. The answer usually involves access reviews, least privilege enforcement, or proper deprovisioning.
4. **"Which protocol?"** -- SAML for XML-based SSO federation, OAuth for API authorization, OIDC for authentication + authorization with JSON, Kerberos for internal network SSO.
5. **"What type of error?"** -- Biometric Type 1 = valid user rejected, Type 2 = invalid user accepted. Type 2 is always the more concerning error.
6. **"What addresses privilege creep?"** -- Account access review, removing old permissions when roles change.

### Wrong-Answer Traps
- Answers that combine two items from the same authentication factor and call it MFA.
- Choosing "delete the account immediately" when the correct answer is "disable the account."
- Selecting RADIUS when the question describes encrypted full-session AAA (that is TACACS+).
- Confusing OAuth (authorization only) with SAML or OIDC (authentication).
- Choosing the most technically complex answer when the question asks for the BEST or MOST APPROPRIATE answer from a management perspective.

### Test-Taking Tips for Domain 5
- When in doubt, apply the principle of least privilege.
- "Think like a manager" means choosing the answer that balances security, cost, and usability.
- For "BEST" or "MOST" questions, eliminate obviously wrong answers first, then compare the remaining options against core principles (need to know, least privilege, separation of duties).
- Remember: accountability requires identification + authentication + auditing. Without all three, you cannot have accountability.
- SAML = XML, OAuth = tokens/APIs, OIDC = JSON/JWT, Kerberos = tickets/symmetric encryption.

---

## 11. CROSS-DOMAIN CONNECTIONS

### D5 <-> D1 (Security and Risk Management)
- Personnel security policies govern identity lifecycle (hiring, transfers, terminations)
- Separation of duties and dual control are D1 governance concepts enforced through D5 access controls
- Security awareness training (D1) includes teaching users about password hygiene and social engineering
- Risk management (D1) drives the selection of authentication strength and access control models
- AUP (Acceptable Use Policy) from D1 is enforced through D5 authorization mechanisms

### D5 <-> D3 (Security Architecture and Engineering)
- Cryptography underpins authentication: password hashing (SHA-3, bcrypt), Kerberos encryption (AES), digital certificates for mutual authentication
- Security models (Bell-LaPadula, Biba, Clark-Wilson) from D3 are implemented through D5 access control mechanisms
- Smart cards use asymmetric cryptography (D3) as D5 authentication tokens
- PKI and digital certificates (D3) support service authentication and mutual authentication in D5

### D5 <-> D4 (Communication and Network Security)
- Network access control (NAC) enforces D5 identity requirements at the network level
- 802.1X provides port-based authentication for device access
- VPN authentication uses RADIUS/TACACS+ from D5
- Remote access security relies on D5 AAA protocols
- Network protocols (TLS, IPSec) protect authentication traffic

### D5 <-> D7 (Security Operations)
- Logging and monitoring (D7) provide the accounting component of AAA
- SIEM systems (D7) correlate identity events for anomaly detection
- Incident response (D7) procedures address compromised credentials
- Privilege monitoring and audit trail review are operational functions
- Account reviews and access recertification are ongoing D7 operational tasks

### D5 <-> D8 (Software Development Security)
- Application-level authentication (login pages, session management, API keys)
- OWASP guidelines for session management, input validation (preventing privilege escalation)
- OAuth and OIDC integration in web applications
- Database access controls (views as content-dependent controls)
- CAPTCHA as anti-automation control in web applications
- Application roles (RBAC within applications like WordPress)
- API authentication and authorization for microservices

### D5 <-> D2 (Asset Security)
- Data classification drives MAC label assignment
- Data ownership determines who authorizes access in DAC models
- Data handling requirements influence authentication strength
- Identity data (biometrics, passwords) is itself a sensitive asset requiring protection

### D5 <-> D6 (Security Assessment and Testing)
- Penetration testing may target authentication systems (password attacks, Mimikatz, Kerberos exploitation)
- Access control audits and account reviews are assessment activities
- Vulnerability scanning may reveal weak authentication configurations
- Social engineering testing targets identity systems (help desk password resets)

---

## 12. REAL-WORLD APPLICATION

### Identity Breach Scenarios

**Credential Stuffing at Scale**: When a major service suffers a data breach and millions of username/password pairs are exposed, attackers use automated tools to test those credentials across hundreds of other services. Users who reuse passwords across sites find multiple accounts compromised. Defense: unique passwords per site (password managers), MFA on all critical accounts.

**Golden Ticket Attack in Enterprise AD**: An attacker who gains domain admin access can extract the KRBTGT hash from Active Directory. With this hash, they can forge Kerberos tickets for any user or service indefinitely, even after the initial vulnerability is patched. The only remediation is to reset the KRBTGT password twice (due to password history) and rebuild trust across the domain.

**SIM Swapping for MFA Bypass**: Attackers social-engineer mobile carriers into transferring a victim's phone number to an attacker-controlled SIM card. This allows the attacker to intercept SMS-based OTPs, defeating SMS-based two-factor authentication. This is why NIST deprecated SMS for 2FA in federal environments.

**Privilege Creep Leading to Data Exposure**: An employee changes roles three times over five years. Each time, they receive new access permissions, but old permissions are never revoked. They accumulate access to financial systems, HR records, and engineering data. An audit reveals the excessive access only after a data incident.

**Service Account Exploitation**: A web application is configured to run under the LocalSystem account instead of a dedicated service account. An attacker exploits an application vulnerability and gains full administrative control of the server, then uses PowerShell to move laterally through the network.

**Mimikatz in the Wild**: After compromising a single workstation through a phishing email, an attacker uses Mimikatz to extract password hashes from LSASS memory. They discover that a domain administrator recently logged onto that machine. Using pass-the-hash, the attacker authenticates as the domain admin and gains control of the entire Active Directory environment.

**Help Desk Social Engineering**: An attacker calls an organization's help desk, impersonates a senior executive, and convinces the help desk technician to reset the executive's password. The attacker then uses the new password to access sensitive systems. Defense: require callback verification, identity proofing questions, and manager approval for password resets of privileged accounts.

---

## 13. MEMORY AIDS AND MNEMONICS

### AAA Model
**"Triple-A Battery Powers Security"**
- Authentication: Who are you?
- Authorization: What can you do?
- Accounting: What did you do?

### Three Authentication Factors
**"Know-Have-Are"**
- Something you KNOW (password, PIN) -- Type 1
- Something you HAVE (token, smartcard) -- Type 2
- Something you ARE (biometric) -- Type 3
- Memory trick: The factors go from weakest to strongest in order (1, 2, 3).

### Biometric Error Types
**"Rejection = 1, Acceptance = 2 -- FAR worse!"**
- Type 1 = False Rejection (FRR) -- "One" valid user turned away
- Type 2 = False Acceptance (FAR) -- "Two" people (valid + invalid) get in
- Type 2 is always worse (FAR worse -- the pun helps remember)

### CER Comparison
**"Lower is Better (like golf)"** -- Lower CER = more accurate biometric device.

### Access Control Models
**"DRAM" -- like computer memory**
- **D**iscretionary (owner decides)
- **R**ole-based (job function decides)
- **A**ttribute-based (context/attributes decide)
- **M**andatory (labels/system decides)

### Kerberos Components
**"KDC is the Key Master"**
- **K**ey **D**istribution **C**enter holds all secrets
- **AS** = **A**uthentication **S**ervice (verifies identity)
- **TGS** = **T**icket **G**ranting **S**ervice (issues service tickets)
- **TGT** = **T**icket **G**ranting **T**icket (your "hall pass")
- **ST** = **S**ervice **T**icket (your "room key")

### Kerberos Flow Memory Aid
**"I ASK for TGT, TGS gives ST"**
- User asks AS for TGT
- User presents TGT to TGS
- TGS gives Service Ticket
- User presents ST to service

### SAML Components
**"A P B P -- Assertions flow through Protocols over Bindings into Profiles"**
- Assertion (authentication, attribute, authorization)
- Protocol (how entities request/respond)
- Bindings (mapping to communication protocols like HTTP)
- Profiles (business use cases like Web SSO)

### OAuth vs. OIDC
**"OAuth = Open door for Authorization, OIDC = Open door for ID Check"**
- OAuth: Authorization only (who can access what)
- OIDC: Identity check (who are you) + authorization

### RADIUS vs. TACACS+
**"RADIUS is Raw, TACACS+ is Total"**
- RADIUS: Raw -- only encrypts password, uses UDP
- TACACS+: Total -- encrypts everything, uses TCP, separates AAA

### Privilege Escalation Direction
**"Horizon = Horizontal (same level, different accounts), Vertical = going UP"**
- Think of the ocean horizon going left-right = horizontal escalation
- Think of an elevator going up = vertical escalation (user to admin)

### Identity Lifecycle
**"PaRR -- Provision, Review, Revoke"**
- Provision (create/onboard)
- Review (audit/verify)
- Revoke (disable/delete/offboard)

### Zero Trust Components
**"PEP stands at the gate, PDP makes the call"**
- PEP = Policy Enforcement Point (gatekeeper)
- PDP = Policy Decision Point (decision maker)
- PDP = Policy Engine + Policy Administrator

### Session Management Methods
**"SLTS prevents session hijacking"**
- **S**chedule limitations
- **L**ogin limitations (no concurrent sessions)
- **T**imeouts (inactivity expiration)
- **S**creensavers (lock screen)

---

## 14. PRACTICE QUESTION PATTERNS

### Pattern 1: Factor Identification
A user logs in with a fingerprint scan and enters a six-digit code from their phone app. How many authentication factors are used?
- Tests: Distinguishing factor TYPES (not factor COUNT). Fingerprint = Type 3 (something you are), phone app code = Type 2 (something you have). Answer: Two factors (MFA).

### Pattern 2: Access Control Model Selection
An organization classifies all documents and assigns clearance levels to all employees. The system automatically grants or denies access based on comparing the user's clearance to the document's classification label. Which model?
- Tests: Identifying MAC by its defining features (labels, system-enforced, clearance-based). Distractors will include RBAC and DAC.

### Pattern 3: Protocol Selection
A company wants to allow users to log in to a third-party cloud application using their corporate credentials. The solution must provide both authentication and user attribute information using an XML-based standard. Which protocol?
- Tests: SAML vs. OAuth vs. OIDC. Key clues: "XML-based" and "authentication + attributes" = SAML.

### Pattern 4: Lifecycle Management
An employee transfers from the finance department to marketing. What should the organization do FIRST?
- Tests: Understanding that old permissions must be revoked before or simultaneously with granting new permissions to prevent privilege creep. Not just "add new permissions."

### Pattern 5: Biometric Accuracy
An organization deploys fingerprint scanners for building entry. Security is the top priority. Should they tune for lower FRR or lower FAR?
- Tests: Understanding that in high-security environments, you accept higher FRR (more false rejections / user inconvenience) to achieve lower FAR (fewer unauthorized entries).

### Pattern 6: Manager Decision
During an audit, a reviewer discovers that a service account used by a monitoring tool has domain admin privileges. What is the BEST action?
- Tests: Applying least privilege. The answer is to reduce the service account's privileges to only what the monitoring tool requires, not delete the account or ignore the finding.

### Pattern 7: Protocol Differentiation
A developer wants to allow a third-party application to post updates to a user's social media account without receiving the user's password. Which standard should be used?
- Tests: OAuth (authorization delegation without credential sharing). SAML is a distractor here because the question is about API authorization, not SSO.

### Pattern 8: Attack Identification
An attacker obtains the KRBTGT account hash from a domain controller. What type of attack can they perform?
- Tests: Kerberos exploitation knowledge. KRBTGT hash = Golden Ticket attack (forge any TGT). Distractors include silver ticket, pass-the-hash, and Kerberoasting.

### Pattern 9: Password Policy
An organization follows NIST SP 800-63B guidelines. A security engineer proposes requiring password changes every 60 days. Is this aligned with the standard?
- Tests: NIST recommends against forced password expiration unless the password is known to be compromised. The answer is no.

### Pattern 10: Deprovisioning Timing
An employee is being involuntarily terminated. When should their access be revoked?
- Tests: Access should be disabled at the time of notification/exit interview (or even before in high-risk scenarios), not at the end of the day or after a waiting period.

---

## 15. GAPS TO ADD

### Topics NOT Currently Covered in Story Mode

The current story mode covers: Authentication Factors, MFA, SSO/Federated Identity (Kerberos, SAML, OAuth/OIDC), Access Control Models (DAC/MAC/RBAC/ABAC), Least Privilege, Separation of Duties, Privilege Escalation, Identity Lifecycle, Credential Stuffing.

**The following topics are NOT currently covered and should be added:**

1. **Biometric Deep Dive**
   - Specific biometric types (retina vs. iris vs. palm vs. face)
   - CER/EER concept and device comparison
   - Type 1 vs. Type 2 errors with sensitivity tuning
   - Biometric template storage and 1:N vs. 1:1 matching
   - Enrollment time and throughput rate considerations
   - Privacy concerns with retina scans

2. **RADIUS and TACACS+**
   - How each protocol works and where each is used
   - Key differences (encryption, transport, AAA separation)
   - Use cases for network device AAA

3. **Zero Trust Architecture**
   - NIST SP 800-207 components
   - Policy Engine, Policy Administrator, PDP, PEP
   - Continuous authentication concept
   - Trust algorithm and its inputs

4. **Session Management**
   - Session hijacking and prevention methods
   - Session ID security (entropy, length, predictability)
   - Timeout configurations for different risk levels
   - OWASP session management recommendations

5. **Access Control Attacks (Beyond Credential Stuffing)**
   - Dictionary attacks, brute-force, spraying attacks
   - Rainbow table attacks and salting/peppering
   - Pass-the-hash attacks and Mimikatz
   - Kerberos exploitation (golden ticket, silver ticket, Kerberoasting, ASREPRoast)
   - Birthday attacks on hash functions
   - Sniffer/eavesdropping attacks
   - Spoofing/masquerading

6. **Password Policy Details**
   - NIST SP 800-63B recommendations vs. PCI DSS requirements
   - Password history, minimum/maximum age, complexity debates
   - Passphrases as superior alternative

7. **Service Account Management**
   - Non-interactive login configuration
   - Password management for service accounts
   - Risks of using LocalSystem/root for services
   - Certificate-based service authentication

8. **su vs. sudo on Linux**
   - How each works, audit trail differences
   - sudoers file management
   - Dual-account best practice for administrators

9. **Device Authentication**
   - 802.1X port-based authentication
   - Device fingerprinting
   - NAC integration with MDM
   - Context-aware authentication

10. **Authenticator Assurance Levels (AAL)**
    - NIST AAL1/AAL2/AAL3 definitions and requirements
    - Mapping authentication methods to assurance levels

11. **CAPTCHA**
    - Purpose and mechanism
    - Use against automated attacks

12. **Authorization Mechanisms (Detail)**
    - Access control matrix, capability lists, constrained interfaces
    - Content-dependent vs. context-dependent controls
    - Implicit deny principle
    - Permissions vs. rights vs. privileges distinction

13. **Credential Management Systems**
    - W3C Credential Management API
    - Password vault security considerations
    - Browser-based credential storage

14. **Vendor Access Provisioning**
    - Third-party identity management
    - Vendor security reviews and facility inspections
    - Contract-based access requirements

15. **Account Access Review Process**
    - Review frequency based on account type and risk
    - Automated vs. manual reviews
    - Privilege monitoring for admin accounts
    - Detecting inactive and orphaned accounts

16. **Identity Governance Concepts**
    - Kim Cameron's Seven Laws of Identity
    - Role engineering and role mining
    - Entitlement management
    - Identity analytics and risk scoring

17. **SESAME Protocol**
    - Comparison with Kerberos
    - Symmetric + asymmetric support
    - Multiple ticket issuance
    - Why it was not widely adopted

18. **Mutual Authentication**
    - Certificate-based mutual authentication
    - VPN and TLS mutual auth scenarios
    - Prevention of rogue server attacks

19. **XACML**
    - Standard for attribute-based access control
    - Policy language and processing model

20. **Risk-Based Access Control**
    - Dynamic risk evaluation
    - Machine learning in access decisions
    - NAC posture assessment as risk-based control
