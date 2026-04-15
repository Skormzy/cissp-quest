import { ActDefinition } from '@/lib/story-types';

export const domain1Act2: ActDefinition = {
  actNumber: 2,
  title: 'The Investigation',
  description: 'Quantify the breach damage, navigate legal frameworks, and trace the social engineering attack chain.',
  xpReward: 250,
  conceptsCovered: [
    'Quantitative Risk Analysis',
    'Qualitative Risk Analysis',
    'Risk Treatment',
    'Cost-Benefit Analysis',
    'Intellectual Property',
    'Privacy Laws',
    'OECD Privacy Guidelines',
    'Due Diligence vs Due Care',
    'Security Doc Hierarchy',
    'Scoping and Tailoring',
    'Social Engineering',
    'PIA/DPIA',
    'PDCA Cycle',
  ],
  estimatedMinutes: 20,
  nodes: [
    // ────────────────────────────────────────────────────────
    // SCENE 1: Narrative Transition — Day 2
    // Type: narrative
    // ────────────────────────────────────────────────────────

    // 1a. Transition — Day 2 at the SOC floor
    {
      type: 'transition',
      id: 'd1a2s1-transition-1',
      location: 'new-york',
      description: 'Nexus Cybersecurity HQ — SOC Floor, Manhattan',
      animation: 'fade',
      timeSkipText: 'Day 2 — 0800 Hours',
    },

    // 1b. Reeves opens Day 2
    {
      type: 'dialogue',
      id: 'd1a2s1-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Good morning, {player}. Yesterday was the overview. Today, we calculate the damage. Janet\'s team has been running the numbers all night.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 1c. Janet sets the stage
    {
      type: 'dialogue',
      id: 'd1a2s1-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The breach isn\'t just a technical problem — it\'s a financial and legal one. Let me show you how we measure the real cost.',
      leftCharacter: 'janet',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 2: Quantitative Risk Analysis — SLE/ARO/ALE
    // Janet teaches "Insurance Math" analogy
    // Type: teaching + interactiveImage + 2 knowledge checks
    // ────────────────────────────────────────────────────────

    // 2a. Janet introduces quantitative risk analysis
    {
      type: 'dialogue',
      id: 'd1a2s2-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Insurance companies have been doing risk math for centuries. We use the same approach. I call it "Insurance Math" — and once you learn these formulas, you\'ll never forget them.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 2b. Janet walks through the formulas
    {
      type: 'dialogue',
      id: 'd1a2s2-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'There are five components to quantitative risk analysis. First, AV — Asset Value. How much is the thing worth? Second, EF — Exposure Factor. What percentage gets damaged, from 0% to 100%? Multiply them together and you get SLE — Single Loss Expectancy. That\'s the cost of ONE incident.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 2c. Janet continues with ARO and ALE
    {
      type: 'dialogue',
      id: 'd1a2s2-dialogue-3',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Then there\'s ARO — Annualized Rate of Occurrence. How often does this happen per year? Once every 5 years means ARO is 0.2. Twice a year means ARO is 2. Finally, ALE = SLE times ARO. That\'s your annual cost of living with this risk.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 2d. Interactive Image — Insurance Math calculation
    {
      type: 'interactiveImage',
      id: 'd1a2s2-interactive-1',
      title: 'Insurance Math — Quantitative Risk Analysis',
      imageType: 'calculation',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #1a1040 40%, #0d1f3c 100%)',
      conceptName: 'Quantitative Risk Analysis',
      speaker: 'janet',
      dialogue: 'Click each component to see how the numbers work for our breach. Think of it like calculating your insurance premium — same logic, different context.',
      completionDialogue: 'Now you can speak the language of risk in dollars and cents. When you present to the board, they don\'t want to hear about vulnerabilities — they want to hear about annual expected losses.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'av-hotspot',
          label: 'AV',
          x: 10,
          y: 30,
          width: 16,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Asset Value — the total worth. Our customer database? $2 million. That includes the data itself, the infrastructure, and the business value of those customer relationships.',
          detail: 'AV = Total value of the asset. For the Nexus customer database: $2,000,000.',
        },
        {
          id: 'ef-hotspot',
          label: 'EF',
          x: 28,
          y: 30,
          width: 16,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'Exposure Factor — percentage lost. The breach exposed 30% of records, so EF = 0.30. If the entire database had been wiped, EF would be 1.0 — total loss.',
          detail: 'EF = Percentage of asset lost (0.0 to 1.0). Nexus breach: 30% = 0.30.',
        },
        {
          id: 'sle-hotspot',
          label: 'SLE',
          x: 46,
          y: 30,
          width: 16,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'SLE = $2,000,000 times 0.30 = $600,000. One breach costs $600K. That\'s your Single Loss Expectancy — the price tag of a single incident.',
          detail: 'SLE = AV x EF. $2,000,000 x 0.30 = $600,000 per incident.',
        },
        {
          id: 'aro-hotspot',
          label: 'ARO',
          x: 64,
          y: 30,
          width: 16,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'How often? Similar breaches happen about once every 5 years = ARO of 0.2. If it happened every year, ARO would be 1. Twice a year? ARO = 2.',
          detail: 'ARO = Frequency per year. Once every 5 years = 1/5 = 0.2.',
        },
        {
          id: 'ale-hotspot',
          label: 'ALE',
          x: 82,
          y: 30,
          width: 16,
          height: 20,
          shape: 'rectangle',
          npcSpeaker: 'janet',
          dialogue: 'ALE = $600,000 times 0.2 = $120,000 per year. That\'s our annual risk cost. This is the number the board needs to see — it tells them what this risk costs the company every single year.',
          detail: 'ALE = SLE x ARO. $600,000 x 0.2 = $120,000/year.',
        },
      ],
    },

    // 2e. Knowledge Check 1 — ALE calculation
    {
      type: 'knowledgeCheck',
      id: 'd1a2s2-kc-1',
      question: 'A database server valued at $500,000 has a 60% exposure factor for ransomware attacks occurring once every 5 years. What is the ALE?',
      options: [
        '$300,000',
        '$100,000',
        '$60,000',
        '$500,000',
      ],
      correctIndex: 2,
      explanation: 'SLE = $500,000 x 0.60 = $300,000. ARO = 1/5 = 0.2. ALE = $300,000 x 0.2 = $60,000. Option A ($300,000) is the SLE, not ALE. Option B ($100,000) uses the wrong ARO. Option D ($500,000) is just the asset value.',
      memoryHack: 'Insurance Math: SLE = AV x EF (how much ONE incident costs), ALE = SLE x ARO (annual cost). Think: Single x Annual Rate = Annual Cost.',
      conceptName: 'Quantitative Risk Analysis',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // 2f. Knowledge Check 2 — ARO concept
    {
      type: 'knowledgeCheck',
      id: 'd1a2s2-kc-2',
      question: 'What does the Annualized Rate of Occurrence (ARO) represent?',
      options: [
        'The total cost of all security incidents in a year',
        'The estimated frequency of a threat occurring per year',
        'The percentage of asset value lost per incident',
        'The number of vulnerabilities discovered annually',
      ],
      correctIndex: 1,
      explanation: 'ARO represents how often a specific threat is expected to occur per year. It\'s a frequency, not a cost or percentage. Option A describes ALE. Option C describes Exposure Factor. Option D describes vulnerability scanning results, not risk frequency.',
      memoryHack: 'Insurance Math: ARO = how many storms per year. Once every 10 years = 0.1. Twice a year = 2. It\'s always "times per year."',
      conceptName: 'Quantitative Risk Analysis',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 3: Qualitative Risk Analysis
    // Kai teaches "Restaurant Star Ratings" analogy
    // Type: teaching + interactiveImage + knowledge check
    // ────────────────────────────────────────────────────────

    // 3a. Kai introduces qualitative analysis
    {
      type: 'dialogue',
      id: 'd1a2s3-dialogue-1',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Not everything can be reduced to a dollar amount. Sometimes you need qualitative analysis — think of it like restaurant star ratings.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 3b. Kai explains
    {
      type: 'dialogue',
      id: 'd1a2s3-dialogue-2',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Instead of exact dollar values, you use categories: Low, Medium, High, Critical — or 1-to-5 scales. It\'s faster but less precise. You don\'t need years of historical data — you just need experienced people making informed judgments.',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 3c. Interactive Image — Qualitative vs Quantitative comparison
    {
      type: 'interactiveImage',
      id: 'd1a2s3-interactive-1',
      title: 'Qualitative vs Quantitative — Rating Approaches',
      imageType: 'comparison',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #0d2a1a 40%, #0d1f3c 100%)',
      conceptName: 'Qualitative Risk Analysis',
      speaker: 'kai',
      dialogue: 'Both approaches have strengths. Explore each to understand when you\'d use one over the other — or both.',
      completionDialogue: 'The takeaway? Most organizations use both. Qualitative for the first pass, quantitative for the high-value assets that need precise numbers. Don\'t let anyone tell you one is "better" — they serve different purposes.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      hotspots: [
        {
          id: 'qualitative-hotspot',
          label: 'Qualitative',
          x: 10,
          y: 25,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue: 'Star ratings — subjective, fast, uses expert judgment. Good when you lack hard data. Categories like Low/Medium/High/Critical let you prioritize quickly without needing exact dollar amounts.',
          detail: 'Qualitative: Subjective categories, expert judgment, faster, less precise.',
        },
        {
          id: 'quantitative-hotspot',
          label: 'Quantitative',
          x: 35,
          y: 25,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue: 'Exact dollar amounts — objective, precise, but needs historical data. AV, EF, SLE, ARO, ALE — the Insurance Math Janet just taught you. Great for justifying security budgets to the CFO.',
          detail: 'Quantitative: Objective dollar values, historical data needed, more precise, more time-consuming.',
        },
        {
          id: 'hybrid-hotspot',
          label: 'Hybrid',
          x: 60,
          y: 25,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue: 'Most organizations use BOTH — qualitative for initial screening, quantitative for high-value assets. Start with star ratings to find your biggest risks, then crunch the numbers on those.',
          detail: 'Hybrid: Qualitative screening first, then quantitative deep-dive on high-priority risks.',
        },
        {
          id: 'risk-matrix-hotspot',
          label: 'Risk Matrix',
          x: 85,
          y: 25,
          width: 12,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'kai',
          dialogue: 'Plot likelihood on the rows and impact on the columns — gives you a visual heat map. Red squares in the upper-right? Those are your critical risks. Green squares in the lower-left? Low priority.',
          detail: 'Risk Matrix: Visual heat map with likelihood vs. impact. Quick prioritization tool.',
        },
      ],
    },

    // 3d. Knowledge Check — When to use qualitative
    {
      type: 'knowledgeCheck',
      id: 'd1a2s3-kc-1',
      question: 'Which risk analysis approach is MOST appropriate when an organization lacks historical loss data but needs a quick risk assessment?',
      options: [
        'Qualitative',
        'Quantitative',
        'Automated',
        'Residual',
      ],
      correctIndex: 0,
      explanation: 'Qualitative analysis uses expert judgment and categorical ratings, making it ideal when you don\'t have historical data for precise dollar calculations. Quantitative requires historical loss data for AV, EF, and ARO. "Automated" is not a risk analysis type. "Residual" refers to remaining risk after controls, not an analysis method.',
      memoryHack: 'Restaurant Star Ratings: No precise data? Use star ratings (qualitative). Have exact numbers? Use dollar amounts (quantitative). Most real orgs use a hybrid.',
      conceptName: 'Qualitative Risk Analysis',
      speaker: 'kai',
      leftCharacter: 'kai',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 4: Risk Treatment Options
    // Reeves teaches "Flood Insurance Choices" analogy
    // Type: teaching + interactiveImage + TLATM + knowledge check
    // ────────────────────────────────────────────────────────

    // 4a. Reeves introduces risk treatment
    {
      type: 'dialogue',
      id: 'd1a2s4-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Once you\'ve identified and analyzed risks, you have four choices. Think of it like living in a flood zone.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 4b. Reeves explains the four options
    {
      type: 'dialogue',
      id: 'd1a2s4-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Avoid — move to higher ground. Stop the risky activity entirely. Transfer — buy flood insurance and share the financial impact with a third party. Mitigate — build a levee to reduce the likelihood or impact. Accept — stay put because the cost of moving exceeds the flood risk. Every risk gets one of these four treatments.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4c. Interactive Image — Risk Treatment Decision Map
    {
      type: 'interactiveImage',
      id: 'd1a2s4-interactive-1',
      title: 'Risk Treatment Decision Map — Flood Insurance Choices',
      imageType: 'decision_map',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #2a1030 40%, #0d1f3c 100%)',
      conceptName: 'Risk Treatment',
      speaker: 'reeves',
      dialogue: 'Four options, four strategies. Explore each one to understand when you\'d choose it.',
      completionDialogue: 'Remember — "accept" doesn\'t mean "ignore." Risk acceptance must be a documented, conscious decision approved by management. And no matter what you transfer, accountability always stays with you.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      hotspots: [
        {
          id: 'avoid-hotspot',
          label: 'Avoid',
          x: 10,
          y: 30,
          width: 18,
          height: 22,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'Move away from the flood zone entirely. In security: stop using the vulnerable system. If a legacy application is too risky to secure, you shut it down. No risk if the activity doesn\'t exist.',
          detail: 'Risk Avoidance: Eliminate the risk by stopping the activity. Example: discontinue an insecure legacy system.',
        },
        {
          id: 'transfer-hotspot',
          label: 'Transfer',
          x: 32,
          y: 30,
          width: 18,
          height: 22,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'Buy insurance — share the financial impact. In security: cyber insurance, outsourcing to a managed security provider. You\'re not eliminating the risk — you\'re sharing the financial burden. But accountability still stays with you.',
          detail: 'Risk Transfer: Share the financial impact with a third party. Example: cyber insurance, outsourced SOC.',
        },
        {
          id: 'mitigate-hotspot',
          label: 'Mitigate',
          x: 54,
          y: 30,
          width: 18,
          height: 22,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'Build levees and drainage — reduce likelihood or impact. In security: implement controls like MFA, encryption, firewalls, training. This is the most common treatment. You rarely eliminate risk entirely, but you reduce it to an acceptable level.',
          detail: 'Risk Mitigation: Implement controls to reduce likelihood or impact. Most common treatment option.',
        },
        {
          id: 'accept-hotspot',
          label: 'Accept',
          x: 76,
          y: 30,
          width: 18,
          height: 22,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'Stay put — the cost of moving or building exceeds the flood risk. In security: when the cost of controls exceeds the potential loss, you accept the risk. But it MUST be documented and approved by management. "Accept" never means "ignore."',
          detail: 'Risk Acceptance: Acknowledge the risk when controls cost more than potential losses. Must be documented.',
        },
      ],
    },

    // 4d. Think Like a Manager — Risk treatment cost analysis
    {
      type: 'thinkLikeManager',
      id: 'd1a2s4-tlatm-1',
      scenario: 'Nexus has identified that its legacy payroll system has critical vulnerabilities. A full replacement costs $2M. Annual expected loss from the vulnerabilities is $50,000. The CISO recommends replacement.',
      question: 'As a risk-aware manager, what is the MOST appropriate risk treatment?',
      options: [
        'Avoid the risk by shutting down the payroll system immediately',
        'Transfer the risk by purchasing cyber insurance for $2M',
        'Accept the risk with enhanced monitoring — the replacement cost far exceeds the annual loss',
        'Mitigate by replacing the system regardless of cost',
      ],
      correctIndex: 2,
      explanation: 'When the cost of controls ($2M) far exceeds the annual expected loss ($50K), risk acceptance with monitoring is the financially sound choice. It would take 40 years of losses to equal the replacement cost. Option A shuts down a critical business system — you can\'t just stop paying employees. Option B makes no sense — insurance premium shouldn\'t equal replacement cost. Option D ignores cost-benefit analysis entirely.',
      managerInsight: 'CISSP expects you to think like a business leader. Security decisions must be cost-justified. Spending $2M to prevent $50K/year in losses is poor risk management. The exam loves testing whether you can make practical, cost-aware decisions.',
      conceptName: 'Risk Treatment',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 4e. Knowledge Check — Risk transfer identification
    {
      type: 'knowledgeCheck',
      id: 'd1a2s4-kc-1',
      question: 'An organization purchases a cyber insurance policy to cover potential data breach costs. This is an example of which risk treatment option?',
      options: [
        'Risk avoidance',
        'Risk transfer',
        'Risk mitigation',
        'Risk acceptance',
      ],
      correctIndex: 1,
      explanation: 'Purchasing insurance transfers the financial impact of a risk to a third party (the insurance company). The organization still owns the risk and the accountability, but the financial burden is shared. Risk avoidance would mean stopping the activity. Risk mitigation would mean implementing controls. Risk acceptance would mean doing nothing.',
      memoryHack: 'Flood Insurance Choices: Transfer = buying insurance. You\'re sharing the financial burden with someone else. Note: you transfer the FINANCIAL impact, but accountability still stays with you.',
      conceptName: 'Risk Treatment',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 5: Cost-Benefit Analysis
    // Janet teaches "Home Alarm ROI" analogy
    // Type: teaching + evidence + knowledge check
    // ────────────────────────────────────────────────────────

    // 5a. Janet introduces CBA
    {
      type: 'dialogue',
      id: 'd1a2s5-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Now that you know the risk math, let me show you how we justify security spending. Think of it like deciding whether a home alarm system is worth it.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 5b. Janet explains CBA formula
    {
      type: 'dialogue',
      id: 'd1a2s5-dialogue-2',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'The formula is simple: Value of Safeguard = ALE before the control, minus ALE after the control, minus the annual cost of the safeguard. If the result is positive, the control is cost-justified. If negative, you\'re spending more than you\'re saving.',
      leftCharacter: 'janet',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 5c. Evidence — CBA for Shadow Protocol Controls
    {
      type: 'evidence',
      id: 'd1a2s5-evidence-1',
      title: 'Cost-Benefit Analysis — Shadow Protocol Controls',
      classification: 'CONFIDENTIAL',
      content: 'Analysis of proposed Multi-Factor Authentication (MFA) deployment to prevent future credential-based breaches. Using the ALE figures from our quantitative analysis to determine if MFA is cost-justified.',
      evidenceItems: [
        { label: 'ALE Before Controls', value: '$120,000/year', highlight: true },
        { label: 'Proposed Control', value: 'Enterprise MFA Solution' },
        { label: 'Breach Probability Reduction', value: '80%' },
        { label: 'ALE After Controls', value: '$24,000/year', highlight: false },
        { label: 'Annual Cost of MFA Solution', value: '$35,000/year' },
        { label: 'Safeguard Value', value: '$120,000 - $24,000 - $35,000 = $61,000', highlight: true },
        { label: 'Recommendation', value: 'COST-JUSTIFIED — Positive safeguard value', highlight: true },
      ],
      speaker: 'janet',
      speakerSide: 'left',
      dialogue: 'See that? The MFA solution saves us $96,000 in reduced risk but costs $35,000 to run. Net value: $61,000. That\'s a clear win — positive means we should deploy it.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
    },

    // 5d. Knowledge Check — CBA calculation
    {
      type: 'knowledgeCheck',
      id: 'd1a2s5-kc-1',
      question: 'An organization\'s ALE for data breaches is $200,000. After implementing a $50,000/year security control, the ALE drops to $40,000. What is the value of the safeguard to the organization?',
      options: [
        '$150,000',
        '$110,000',
        '$160,000',
        '$10,000',
      ],
      correctIndex: 1,
      explanation: 'Safeguard Value = ALE(before) - ALE(after) - Annual Cost = $200,000 - $40,000 - $50,000 = $110,000. Positive value = cost-justified. Option A ($150,000) forgets to subtract the annual cost of the control. Option C ($160,000) uses incorrect subtraction. Option D ($10,000) subtracts incorrectly.',
      memoryHack: 'Home Alarm ROI: Value = What you SAVE minus What you SPEND. ALE(before) - ALE(after) = savings. Subtract the cost. Positive = worth it.',
      conceptName: 'Cost-Benefit Analysis',
      speaker: 'janet',
      leftCharacter: 'janet',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 6: Intellectual Property Laws
    // Reeves teaches "Creative Protection Toolkit" analogy
    // Type: teaching + interactiveImage + knowledge check
    // ────────────────────────────────────────────────────────

    // 6a. Reeves introduces IP law
    {
      type: 'dialogue',
      id: 'd1a2s6-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The breach exposed proprietary algorithms and trade secrets. Let me explain the different types of intellectual property protection — think of it as a "Creative Protection Toolkit."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 6b. Reeves explains the four types
    {
      type: 'dialogue',
      id: 'd1a2s6-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'There are four tools in the kit. Trade Secrets — like the Coca-Cola formula. No disclosure required, infinite protection, but once exposed, it\'s gone forever. Patents — you disclose your invention in exchange for about 20 years of exclusive rights. Must be novel, useful, and non-obvious.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6c. Reeves continues with copyrights and trademarks
    {
      type: 'dialogue',
      id: 'd1a2s6-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Copyrights — protects creative expression in a fixed medium. Automatic upon creation, lasts the life of the creator plus 70 years. But here\'s the key: it protects the expression, NOT the underlying idea. And Trademarks — brand identifiers like logos, names, even sounds. Think Intel\'s chime. Infinite protection as long as you keep renewing.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 6d. Interactive Image — Creative Protection Toolkit
    {
      type: 'interactiveImage',
      id: 'd1a2s6-interactive-1',
      title: 'Creative Protection Toolkit — IP Law Types',
      imageType: 'comparison',
      backgroundGradient: 'linear-gradient(135deg, #0a1628 0%, #1a2840 40%, #0d1f3c 100%)',
      conceptName: 'Intellectual Property',
      speaker: 'reeves',
      dialogue: 'Each tool protects something different. Explore them to understand when you\'d use each one.',
      completionDialogue: 'For our breach, the exposed algorithms were trade secrets. Once the attacker extracted them, that protection was effectively lost. This is why trade secrets require strong access controls — they\'re only as good as your ability to keep them secret.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      hotspots: [
        {
          id: 'trade-secret-hotspot',
          label: 'Trade Secret',
          x: 8,
          y: 30,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'The secret recipe — no filing, no disclosure, infinite protection. BUT: once someone discovers it independently, you can\'t stop them. If leaked, protection is lost forever. Think Coca-Cola — they\'ve kept it secret for over a century.',
          detail: 'Trade Secret: No disclosure, no registration, infinite duration. Lost if exposed or independently discovered.',
        },
        {
          id: 'patent-hotspot',
          label: 'Patent',
          x: 30,
          y: 30,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'The registered invention — you MUST disclose how it works. In return: approximately 20 years of exclusive rights. Others can see it but can\'t use it commercially. Must be novel, useful, and non-obvious to qualify.',
          detail: 'Patent: Requires disclosure, ~20 years protection, must be novel/useful/non-obvious.',
        },
        {
          id: 'copyright-hotspot',
          label: 'Copyright',
          x: 52,
          y: 30,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'The creative work — protects HOW you express an idea, not the idea itself. Automatic upon creation, though registration helps in court. Duration: life of creator plus 70 years. Your code is copyrighted the moment you write it.',
          detail: 'Copyright: Automatic protection, expression not ideas, life + 70 years.',
        },
        {
          id: 'trademark-hotspot',
          label: 'Trademark',
          x: 74,
          y: 30,
          width: 20,
          height: 25,
          shape: 'rectangle',
          npcSpeaker: 'reeves',
          dialogue: 'The brand mark — logos, names, even sounds like Intel\'s chime. Infinite protection with renewal. Prevents marketplace confusion. The Nexus logo, our brand name — all trademarked.',
          detail: 'Trademark: Brand identifiers, infinite with renewal, prevents consumer confusion.',
        },
      ],
    },

    // 6e. Knowledge Check — IP identification
    {
      type: 'knowledgeCheck',
      id: 'd1a2s6-kc-1',
      question: 'A software company develops a proprietary algorithm but chooses NOT to patent it, instead keeping it confidential. What type of intellectual property protection are they relying on?',
      options: [
        'Trade secret',
        'Patent',
        'Copyright',
        'Trademark',
      ],
      correctIndex: 0,
      explanation: 'By keeping the algorithm confidential and not filing for a patent, the company is relying on trade secret protection. This offers infinite protection but comes with a major risk: if someone independently discovers or reverse-engineers the algorithm, they can use it freely. A patent would require disclosure. Copyright protects expression, not algorithms. Trademarks protect brand identifiers.',
      memoryHack: 'Creative Protection Toolkit: No disclosure + infinite protection = Trade Secret. Disclosure + 20 years = Patent. Expression + life+70 = Copyright. Brand + infinite renewal = Trademark.',
      conceptName: 'Intellectual Property',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 7: Privacy Laws + OECD
    // Reeves teaches "Global Privacy Passport" + "Privacy Bill of Rights"
    // Type: teaching + evidence + timed decision
    // ────────────────────────────────────────────────────────

    // 7a. Reeves introduces privacy laws
    {
      type: 'dialogue',
      id: 'd1a2s7-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'The breach exposed customer PII across multiple jurisdictions. We need to understand privacy laws — think of privacy regulations as a "Global Privacy Passport."',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 7b. Reeves explains key privacy laws
    {
      type: 'dialogue',
      id: 'd1a2s7-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Every country — and sometimes every state — has its own privacy rules. GDPR in the EU is the gold standard: 72-hour breach notification, right to erasure, data portability. HIPAA covers US healthcare. GLBA handles financial data. And CCPA and CPRA give California residents the right to know, delete, and opt out.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7c. Reeves introduces OECD
    {
      type: 'dialogue',
      id: 'd1a2s7-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'But before all these laws came the OECD Privacy Guidelines — I call them the "Privacy Bill of Rights." Eight principles that form the foundation for most privacy laws worldwide. Nearly every modern privacy regulation traces back to these.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 7d. Evidence — Global Privacy Regulatory Requirements
    {
      type: 'evidence',
      id: 'd1a2s7-evidence-1',
      title: 'Global Privacy Regulatory Requirements',
      classification: 'CONFIDENTIAL',
      content: 'Regulatory landscape affecting the Nexus breach response. Multiple jurisdictions triggered due to international customer base. Immediate focus: GDPR 72-hour notification deadline.',
      evidenceItems: [
        { label: 'GDPR (EU)', value: '72-hour breach notification, right to erasure, data portability, extraterritorial scope', highlight: true },
        { label: 'HIPAA (US Healthcare)', value: 'Protected Health Information (PHI), Business Associate Agreements, breach notification rules' },
        { label: 'CCPA/CPRA (California)', value: 'Right to know, right to delete, right to opt-out of sale of personal information' },
        { label: 'GLBA (US Financial)', value: 'Annual privacy notices, Safeguards Rule, pretexting protections' },
        { label: 'OECD Principles', value: 'Collection Limitation, Data Quality, Purpose Specification, Use Limitation, Security Safeguards, Openness, Individual Participation, Accountability', highlight: true },
      ],
      speaker: 'reeves',
      speakerSide: 'left',
      dialogue: 'Notice the GDPR line — 72 hours. That\'s not 72 business hours. That\'s 72 actual hours from the moment you become aware of the breach. The clock is ticking for us right now.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
    },

    // 7e. Timed Decision — GDPR notification deadline
    {
      type: 'timedDecision',
      id: 'd1a2s7-timed-1',
      scenario: 'Nexus discovers that 50,000 EU customer records were accessed in the breach. It\'s now been 48 hours since discovery. Legal asks when GDPR requires notification to the supervisory authority.',
      timeLimit: 30,
      conceptName: 'Privacy Laws',
      options: [
        {
          text: 'Within 72 hours of becoming aware — we have 24 hours left',
          isOptimal: true,
          feedback: 'Correct! GDPR Article 33 requires notification to the supervisory authority within 72 hours of becoming aware of a personal data breach. You have 24 hours remaining. Missing this deadline can result in massive fines — up to 4% of global annual revenue.',
          xpBonus: 25,
        },
        {
          text: 'Within 24 hours',
          isOptimal: false,
          feedback: '24 hours is too aggressive for GDPR. GDPR requires 72 hours, not 24. Some jurisdictions and specific regulations have shorter windows, but GDPR Article 33 clearly states 72 hours from awareness.',
        },
        {
          text: 'Within 30 days',
          isOptimal: false,
          feedback: '30 days is far too long for GDPR. That might apply to some US state laws, but GDPR requires 72 hours — not 30 days. Missing the 72-hour window can result in significant regulatory penalties.',
        },
      ],
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 8: Due Diligence vs Due Care
    // Reeves teaches "Home Inspection vs Maintenance" analogy
    // Type: teaching + knowledge check
    // ────────────────────────────────────────────────────────

    // 8a. Reeves introduces due diligence and due care
    {
      type: 'dialogue',
      id: 'd1a2s8-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Let me clarify two concepts that trip up many CISSP candidates — due diligence and due care. I use the "Home Inspection vs Maintenance" analogy.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 8b. Reeves explains due diligence
    {
      type: 'dialogue',
      id: 'd1a2s8-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Due diligence is the home inspection before you buy. You research, investigate, document, and plan. In security, that means conducting risk assessments, vulnerability scans, background checks — doing your homework BEFORE making decisions.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8c. Reeves explains due care
    {
      type: 'dialogue',
      id: 'd1a2s8-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Due care is the ongoing maintenance after you buy. Fix the leaky faucet, mow the lawn, keep the furnace serviced. In security, that means patching systems, updating policies, training employees — acting responsibly on an ongoing basis.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 8d. Reeves ties it to negligence
    {
      type: 'dialogue',
      id: 'd1a2s8-dialogue-4',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Failure to exercise both equals negligence. If we didn\'t research known vulnerabilities — that\'s no diligence. If we knew about the vulnerabilities but didn\'t patch them — that\'s no care. Either way, negligence. And negligence is what gets organizations sued.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'worried',
    },

    // 8e. Knowledge Check — Due diligence identification
    {
      type: 'knowledgeCheck',
      id: 'd1a2s8-kc-1',
      question: 'An organization conducts a thorough risk assessment and vulnerability scan before deploying a new system. This is BEST described as an example of:',
      options: [
        'Due care',
        'Due diligence',
        'Risk acceptance',
        'Compliance testing',
      ],
      correctIndex: 1,
      explanation: 'Conducting assessments and scans BEFORE deployment is due diligence — investigating and planning ahead. Due care would be the ongoing maintenance and patching AFTER deployment. Risk acceptance is a treatment option. Compliance testing checks against specific standards, not overall security posture.',
      memoryHack: 'Home Inspection vs Maintenance: Due DILIGENCE = DETECT problems (inspect, research, plan). Due CARE = CORRECT problems (maintain, fix, act responsibly). Both are required — missing either = negligence.',
      conceptName: 'Due Diligence vs Due Care',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 9: Security Doc Hierarchy + Scoping/Tailoring
    // Reeves teaches "Government Hierarchy" + "Tailored Suit" analogies
    // Type: teaching + visualAid + knowledge check
    // ────────────────────────────────────────────────────────

    // 9a. Reeves introduces security document hierarchy
    {
      type: 'dialogue',
      id: 'd1a2s9-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Let me expand on what we covered about governance documents yesterday. Think of the security document hierarchy like a "Government Hierarchy."',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 9b. Reeves explains three levels of security policies
    {
      type: 'dialogue',
      id: 'd1a2s9-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'There are three levels of security policies. The Overarching Policy — the constitution. Strategic direction from senior management, covering the entire organization. Functional Policies — state laws. Specific security areas like email policy, password policy, or acceptable use policy. System-Specific Policies — local ordinances. Rules for particular systems, like "the firewall must block all inbound traffic except ports 80 and 443."',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9c. Reeves explains scoping and tailoring
    {
      type: 'dialogue',
      id: 'd1a2s9-dialogue-3',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'When applying frameworks like NIST, you don\'t use every control blindly. Scoping decides which controls apply to your environment. Tailoring customizes the selected controls. It\'s like buying a suit off the rack — scoping is picking which suits to try on, tailoring is getting them altered to fit you perfectly.',
      leftCharacter: 'reeves',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 9d. Visual Aid — Policy levels + Scoping vs Tailoring
    {
      type: 'visualAid',
      id: 'd1a2s9-visual-1',
      title: 'Government Hierarchy — Security Policy Levels & Tailored Suit Approach',
      aidType: 'list',
      items: [
        {
          label: 'Overarching Policy (Constitution)',
          description: 'Strategic direction from senior management. Sets the tone for the entire security program. Example: "All information assets shall be classified and protected according to their sensitivity."',
        },
        {
          label: 'Functional Policy (State Laws)',
          description: 'Covers specific security domains. Examples: email security policy, password policy, remote access policy, incident response policy.',
        },
        {
          label: 'System-Specific Policy (Local Ordinances)',
          description: 'Rules for individual systems. Example: "Database servers must use TLS 1.3 for all connections and rotate credentials every 90 days."',
        },
        {
          label: 'Scoping (Picking the Suits)',
          description: 'Determining which controls from a framework apply to your environment. If you don\'t have wireless networks, wireless controls don\'t apply — scope them out.',
        },
        {
          label: 'Tailoring (Getting Them Altered)',
          description: 'Customizing selected controls to fit your specific environment. Adjusting control parameters, adding compensating controls, or modifying implementation guidance.',
        },
      ],
      speaker: 'reeves',
      dialogue: 'Remember from yesterday — policies sit at the top of the governance hierarchy, above standards, procedures, and guidelines. These three policy levels give you finer granularity within that top tier.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
    },

    // 9e. Knowledge Check — Scoping and tailoring
    {
      type: 'knowledgeCheck',
      id: 'd1a2s9-kc-1',
      question: 'When implementing NIST SP 800-53 controls, an organization determines that certain controls don\'t apply to their cloud environment and modifies others to fit their specific infrastructure. What TWO processes are being performed?',
      options: [
        'Risk assessment and gap analysis',
        'Certification and accreditation',
        'Scoping and tailoring',
        'Auditing and monitoring',
      ],
      correctIndex: 2,
      explanation: 'Determining which controls apply is scoping. Modifying controls to fit the specific environment is tailoring. Both are key steps in implementing any security framework. Risk assessment identifies risks, not control applicability. Certification and accreditation evaluate the overall system. Auditing and monitoring are ongoing operational activities.',
      memoryHack: 'Tailored Suit: Scoping = picking which suits to try on (which controls apply). Tailoring = getting them altered to fit (customizing to your environment). Scope first, then tailor.',
      conceptName: 'Scoping and Tailoring',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 10: Social Engineering
    // Kai teaches "Con Artist Playbook" analogy
    // Type: teaching + evidence + knowledge check
    // ────────────────────────────────────────────────────────

    // 10a. Kai introduces social engineering
    {
      type: 'dialogue',
      id: 'd1a2s10-dialogue-1',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Here\'s something that directly relates to our breach — the attacker didn\'t just hack systems. They hacked PEOPLE. Social engineering is the "Con Artist Playbook."',
      leftCharacter: 'kai',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 10b. Kai explains social engineering types
    {
      type: 'dialogue',
      id: 'd1a2s10-dialogue-2',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Phishing — mass email lures cast wide, hoping someone bites. Spear phishing — targeted at specific individuals using personal details. Whaling — going after the big fish, executives and C-suite. Then there\'s vishing — voice phishing over the phone, and smishing — the same thing but over SMS text messages.',
      leftCharacter: 'kai',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 10c. Kai explains pretexting and ties to the breach
    {
      type: 'dialogue',
      id: 'd1a2s10-dialogue-3',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'And then there\'s pretexting — creating a false scenario to manipulate the target. "Hi, I\'m from IT, we need to verify your credentials." The jchen_dev account was compromised via spear phishing — the attacker sent a targeted email that looked like it came from IT support.',
      leftCharacter: 'kai',
      leftExpression: 'worried',
      rightCharacter: 'player',
      rightExpression: 'surprised',
    },

    // 10d. Evidence — Social Engineering Attack Chain
    {
      type: 'evidence',
      id: 'd1a2s10-evidence-1',
      title: 'Shadow Protocol — Social Engineering Attack Chain',
      classification: 'CLASSIFIED',
      content: 'Forensic reconstruction of how the attacker compromised the jchen_dev developer account using social engineering techniques.',
      evidenceItems: [
        { label: 'Step 1: Reconnaissance', value: 'Attacker researches target (jchen_dev) on LinkedIn — finds role, tech stack, team members', highlight: false },
        { label: 'Step 2: Weapon Crafting', value: 'Crafts spear phishing email mimicking IT support — uses internal terminology and manager\'s name', highlight: true },
        { label: 'Step 3: Credential Harvest', value: 'Developer clicks link, enters credentials on fake portal — identical to real Nexus login page', highlight: true },
        { label: 'Step 4: Initial Access', value: 'Attacker captures credentials, accesses production systems using legitimate jchen_dev account', highlight: false },
        { label: 'Step 5: Lateral Movement', value: 'Moves through network using compromised account — accesses financial DB, HR systems, customer portal', highlight: true },
      ],
      speaker: 'kai',
      speakerSide: 'left',
      dialogue: 'Five steps. The attacker spent more time on LinkedIn than they spent on actual hacking. The weakest link in any security chain is almost always a person.',
      leftCharacter: 'kai',
      leftExpression: 'serious',
    },

    // 10e. Knowledge Check — Social engineering identification
    {
      type: 'knowledgeCheck',
      id: 'd1a2s10-kc-1',
      question: 'An attacker sends a carefully crafted email to the CFO, impersonating the CEO and requesting an urgent wire transfer. This is BEST described as:',
      options: [
        'Phishing',
        'Spear phishing',
        'Whaling',
        'Pretexting',
      ],
      correctIndex: 2,
      explanation: 'This is whaling — a targeted attack against a senior executive (the CFO). While it\'s also technically spear phishing (targeted at one person), the term "whaling" is more specific because the target is a high-level executive — a "big fish." Regular phishing is untargeted mass email. Pretexting creates a false scenario but doesn\'t specifically target executives.',
      memoryHack: 'Con Artist Playbook: Phishing = casting a wide net. Spear phishing = targeting ONE person. Whaling = targeting the BIG FISH (executives). The bigger the target, the more specific the attack.',
      conceptName: 'Social Engineering',
      speaker: 'kai',
      leftCharacter: 'kai',
      leftExpression: 'thinking',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 11: PIA/DPIA + PDCA
    // Reeves teaches "Environmental Impact Study"
    // Kai teaches "Training Montage Loop"
    // Type: teaching + visualAid + knowledge check
    // ────────────────────────────────────────────────────────

    // 11a. Reeves introduces PIA/DPIA
    {
      type: 'dialogue',
      id: 'd1a2s11-dialogue-1',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'Before deploying any system that processes personal data, we need a Privacy Impact Assessment. Think of it like an "Environmental Impact Study" — you assess the impact BEFORE you build.',
      leftCharacter: 'reeves',
      leftExpression: 'neutral',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11b. Reeves explains PIA vs DPIA
    {
      type: 'dialogue',
      id: 'd1a2s11-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'PIA is the general term — Privacy Impact Assessment. It evaluates how a project will affect the privacy of individuals. DPIA is the GDPR-specific version — Data Protection Impact Assessment. Under GDPR, a DPIA is required when processing is likely to result in high risk to individuals\' rights and freedoms. Think: large-scale profiling, sensitive data, new technologies.',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11c. Kai introduces PDCA
    {
      type: 'dialogue',
      id: 'd1a2s11-dialogue-3',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'And to ensure our security program keeps improving after assessments like those, we use the PDCA cycle — Plan, Do, Check, Act. I call it the "Training Montage Loop." Think Rocky Balboa.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 11d. Kai explains PDCA
    {
      type: 'dialogue',
      id: 'd1a2s11-dialogue-4',
      speaker: 'kai',
      speakerSide: 'left',
      text: 'Plan — Rocky identifies his weaknesses and designs a training regimen. Do — he actually trains. Check — he tests his performance and measures results. Act — he adjusts his approach based on what worked and what didn\'t. Then the loop starts over. Continuous improvement, every cycle.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'thinking',
    },

    // 11e. Visual Aid — PDCA cycle
    {
      type: 'visualAid',
      id: 'd1a2s11-visual-1',
      title: 'Training Montage Loop — PDCA Continuous Improvement Cycle',
      aidType: 'list',
      items: [
        {
          label: 'Plan (Design the Training Regimen)',
          description: 'Identify issues and develop solutions. Establish objectives, policies, and procedures. "Rocky watches tapes of his opponent and plans his training."',
        },
        {
          label: 'Do (Hit the Gym)',
          description: 'Implement the plan. Deploy controls, execute procedures, train staff. "Rocky runs the stairs, punches the meat, does the work."',
        },
        {
          label: 'Check (Test Performance)',
          description: 'Measure results against objectives. Audit, monitor, review. "Rocky sparring sessions — is the training actually working?"',
        },
        {
          label: 'Act (Adjust the Approach)',
          description: 'Correct and improve based on findings. Update policies, refine controls, address gaps. "Rocky drops the bad habits, doubles down on what works."',
        },
      ],
      speaker: 'kai',
      dialogue: 'The key insight: PDCA never stops. It\'s a loop, not a one-time process. After you Act, you go right back to Plan. That\'s how mature security programs work — continuous improvement, never complacent.',
      leftCharacter: 'kai',
      leftExpression: 'smile',
    },

    // 11f. Knowledge Check — DPIA requirement
    {
      type: 'knowledgeCheck',
      id: 'd1a2s11-kc-1',
      question: 'Under GDPR, when is a Data Protection Impact Assessment (DPIA) REQUIRED?',
      options: [
        'For every new IT system deployment',
        'When processing is likely to result in high risk to individuals\' rights and freedoms',
        'Only when processing data of EU government employees',
        'When the organization has more than 500 employees',
      ],
      correctIndex: 1,
      explanation: 'GDPR Article 35 requires a DPIA when processing is "likely to result in a high risk to the rights and freedoms of natural persons." This includes large-scale profiling, processing sensitive data categories, and systematic monitoring of public areas. It\'s not required for every system (A), not limited to government employees (C), and has nothing to do with company size (D).',
      memoryHack: 'Environmental Impact Study: PIA/DPIA = assess privacy impact BEFORE building. GDPR requires DPIA when there\'s HIGH RISK to individuals. Think: would this project cause environmental (privacy) damage?',
      conceptName: 'PIA/DPIA',
      speaker: 'reeves',
      leftCharacter: 'reeves',
      leftExpression: 'thinking',
      rightCharacter: 'kai',
      rightExpression: 'neutral',
    },

    // ────────────────────────────────────────────────────────
    // SCENE 12: Wrap-up + Cliffhanger
    // Type: narrative + player choice
    // ────────────────────────────────────────────────────────

    // 12a. Janet wraps up the day
    {
      type: 'dialogue',
      id: 'd1a2s12-dialogue-1',
      speaker: 'janet',
      speakerSide: 'left',
      text: 'Impressive work today, {player}. We\'ve quantified the breach damage, mapped the legal landscape, and traced the social engineering attack chain.',
      leftCharacter: 'janet',
      leftExpression: 'smile',
      rightCharacter: 'player',
      rightExpression: 'neutral',
    },

    // 12b. Reeves drops the cliffhanger
    {
      type: 'dialogue',
      id: 'd1a2s12-dialogue-2',
      speaker: 'reeves',
      speakerSide: 'left',
      text: 'But there\'s something we haven\'t addressed. Our business continuity plans weren\'t activated during the breach. Our disaster recovery procedures were outdated. And worst of all — we found evidence that the attacker may have an insider contact.',
      leftCharacter: 'reeves',
      leftExpression: 'worried',
      rightCharacter: 'janet',
      rightExpression: 'surprised',
    },

    // 12c. Player response with choices
    {
      type: 'dialogue',
      id: 'd1a2s12-dialogue-3',
      speaker: 'player',
      speakerSide: 'right',
      text: '{player} considers the implications of an insider threat...',
      leftCharacter: 'reeves',
      leftExpression: 'serious',
      rightCharacter: 'player',
      rightExpression: 'thinking',
      choices: [
        {
          text: '"An insider? That changes everything. We need to review personnel security immediately."',
          response: 'Reeves nods gravely. "Exactly. Act 4 will test everything you\'ve learned — and introduce threats we didn\'t anticipate."',
          xpBonus: 15,
        },
        {
          text: '"What about our business continuity plan? If the attacker strikes again, are we ready?"',
          response: 'Janet shakes her head. "That\'s exactly what we need to find out. The Escalation is coming."',
          xpBonus: 10,
        },
      ],
    },
  ],
};
