'use client';

// CISSP concept diagrams. Pure SVG, animated via framer-motion. Each
// diagram embodies a memory hack analogy from the curriculum.
//
// Usage:
//   <ConceptDiagram concept="cia-triad" />
//   <ConceptDiagram concept="bell-lapadula" highlight="no-read-up" />

import { motion, useReducedMotion } from 'framer-motion';

export type ConceptKey =
  | 'cia-triad'
  | 'risk-treatment'
  | 'ale-formula'
  | 'grc-immune'
  | 'policy-pyramid'
  | 'bell-lapadula'
  | 'biba'
  | 'defense-in-depth'
  | 'osi-stack'
  | 'tls-handshake'
  | 'kerberos-flow'
  | 'least-privilege'
  | 'zero-trust'
  | 'biometric-curve'
  | 'evidence-volatility'
  | 'pentest-phases'
  | 'sast-dast-iast'
  | 'nist-ir-cycle'
  | 'siem-soar'
  | 'dr-test-ladder'
  | 'devsecops-pipeline'
  | 'owasp-top-10'
  | 'data-lifecycle'
  | 'aaa-services'
  | 'sanitization-levels'
  | 'cer-curve'
  | 'oauth-flow'
  | 'wireless-auth'
  | 'cap-theorem'
  | 'sd-lc-shift-left';

interface Props {
  concept: ConceptKey;
  width?: number;
  height?: number;
  highlight?: string;
  className?: string;
}

const COLORS = {
  bg:        '#0d1220',
  panel:     '#111a2e',
  border:    '#1e2d4a',
  text:      '#e2e8f0',
  textDim:   '#94a3b8',
  textMuted: '#64748b',
  accent:    '#00e8ff',
  good:      '#22c55e',
  warn:      '#f59e0b',
  bad:       '#ef4444',
  gold:      '#ffd700',
  violet:    '#8b5cf6',
};

export default function ConceptDiagram({
  concept,
  width = 420,
  height = 320,
  highlight,
  className = '',
}: Props) {
  const reduce = useReducedMotion() ?? false;

  switch (concept) {
    case 'cia-triad':
      return <CIATriad width={width} height={height} reduce={reduce} className={className} />;
    case 'risk-treatment':
      return <RiskTreatment width={width} height={height} reduce={reduce} className={className} />;
    case 'ale-formula':
      return <ALEFormula width={width} height={height} reduce={reduce} className={className} />;
    case 'grc-immune':
      return <GRCImmune width={width} height={height} reduce={reduce} className={className} />;
    case 'policy-pyramid':
      return <PolicyPyramid width={width} height={height} reduce={reduce} className={className} />;
    case 'bell-lapadula':
      return <BellLaPadula width={width} height={height} reduce={reduce} highlight={highlight} className={className} />;
    case 'biba':
      return <Biba width={width} height={height} reduce={reduce} className={className} />;
    case 'defense-in-depth':
      return <DefenseInDepth width={width} height={height} reduce={reduce} className={className} />;
    case 'osi-stack':
      return <OSIStack width={width} height={height} reduce={reduce} highlight={highlight} className={className} />;
    case 'tls-handshake':
      return <TLSHandshake width={width} height={height} reduce={reduce} className={className} />;
    case 'kerberos-flow':
      return <KerberosFlow width={width} height={height} reduce={reduce} className={className} />;
    case 'least-privilege':
      return <LeastPrivilege width={width} height={height} reduce={reduce} className={className} />;
    case 'zero-trust':
      return <ZeroTrust width={width} height={height} reduce={reduce} className={className} />;
    case 'biometric-curve':
    case 'cer-curve':
      return <BiometricCurve width={width} height={height} reduce={reduce} className={className} />;
    case 'evidence-volatility':
      return <EvidenceVolatility width={width} height={height} reduce={reduce} className={className} />;
    case 'pentest-phases':
      return <PentestPhases width={width} height={height} reduce={reduce} className={className} />;
    case 'sast-dast-iast':
    case 'sd-lc-shift-left':
      return <SastDastIast width={width} height={height} reduce={reduce} className={className} />;
    case 'nist-ir-cycle':
      return <NISTIRCycle width={width} height={height} reduce={reduce} className={className} />;
    case 'siem-soar':
      return <SiemSoar width={width} height={height} reduce={reduce} className={className} />;
    case 'dr-test-ladder':
      return <DRTestLadder width={width} height={height} reduce={reduce} className={className} />;
    case 'devsecops-pipeline':
      return <DevSecOpsPipeline width={width} height={height} reduce={reduce} className={className} />;
    case 'owasp-top-10':
      return <OWASPTop10 width={width} height={height} reduce={reduce} className={className} />;
    case 'data-lifecycle':
      return <DataLifecycle width={width} height={height} reduce={reduce} className={className} />;
    case 'aaa-services':
      return <AAAServices width={width} height={height} reduce={reduce} className={className} />;
    case 'sanitization-levels':
      return <SanitizationLevels width={width} height={height} reduce={reduce} className={className} />;
    case 'oauth-flow':
      return <OAuthFlow width={width} height={height} reduce={reduce} className={className} />;
    case 'wireless-auth':
      return <WirelessAuth width={width} height={height} reduce={reduce} className={className} />;
    case 'cap-theorem':
      return <CAPTheorem width={width} height={height} reduce={reduce} className={className} />;
    default:
      return null;
  }
}

interface DiagramProps {
  width: number;
  height: number;
  reduce: boolean;
  highlight?: string;
  className?: string;
}

// Shared frame primitive
function Frame({
  width,
  height,
  children,
  className,
  title,
}: DiagramProps & { children: React.ReactNode; title?: string }) {
  return (
    <div
      className={`relative rounded-2xl overflow-hidden ${className ?? ''}`}
      style={{
        width,
        background: `linear-gradient(135deg, ${COLORS.bg} 0%, ${COLORS.panel} 100%)`,
        border: `1px solid ${COLORS.border}`,
      }}
    >
      {title && (
        <div
          className="px-3 py-1.5 text-[10px] font-mono uppercase tracking-widest"
          style={{ color: COLORS.accent, background: 'rgba(0,232,255,0.06)' }}
        >
          {title}
        </div>
      )}
      <svg width={width} height={height} viewBox={`0 0 ${width} ${height}`}>
        {children}
      </svg>
    </div>
  );
}

// ─────────────────────────────────────────────────────────────────────
// CIA TRIAD — three vault locks
// ─────────────────────────────────────────────────────────────────────
function CIATriad({ width, height, reduce, className }: DiagramProps) {
  const cx = width / 2;
  const cy = height / 2 + 10;
  const r = Math.min(width, height) * 0.32;
  const apex   = { x: cx,           y: cy - r };
  const left   = { x: cx - r * 0.95, y: cy + r * 0.55 };
  const right  = { x: cx + r * 0.95, y: cy + r * 0.55 };
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="CIA Triad">
      <motion.path
        d={`M ${apex.x} ${apex.y} L ${left.x} ${left.y} L ${right.x} ${right.y} Z`}
        fill="rgba(0,232,255,0.04)"
        stroke={COLORS.accent}
        strokeWidth="1.5"
        initial={reduce ? { opacity: 0 } : { opacity: 0, pathLength: 0 }}
        animate={reduce ? { opacity: 1 } : { opacity: 1, pathLength: 1 }}
        transition={{ duration: reduce ? 0.2 : 0.9, ease: 'easeOut' }}
      />
      {[
        { label: 'C', sub: 'Confidentiality', x: apex.x, y: apex.y - 8, color: COLORS.accent, hint: 'Locks the door' },
        { label: 'I', sub: 'Integrity',       x: left.x - 28, y: left.y + 16, color: COLORS.gold, hint: 'No tampering' },
        { label: 'A', sub: 'Availability',    x: right.x + 28, y: right.y + 16, color: COLORS.good, hint: 'Door opens when needed' },
      ].map((node) => (
        <g key={node.label}>
          <motion.circle
            cx={node.label === 'C' ? apex.x : node.label === 'I' ? left.x : right.x}
            cy={node.label === 'C' ? apex.y : node.label === 'I' ? left.y : right.y}
            r="20"
            fill={`${node.color}22`}
            stroke={node.color}
            strokeWidth="1.5"
            initial={{ scale: 0, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            transition={{ duration: 0.4, delay: reduce ? 0 : 0.3 }}
          />
          <motion.text
            x={node.label === 'C' ? apex.x : node.label === 'I' ? left.x : right.x}
            y={(node.label === 'C' ? apex.y : node.label === 'I' ? left.y : right.y) + 5}
            textAnchor="middle"
            fontSize="20"
            fontWeight="bold"
            fill={node.color}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.6 }}
          >
            {node.label}
          </motion.text>
          <motion.text
            x={node.x}
            y={node.y}
            textAnchor="middle"
            fontSize="11"
            fontWeight="bold"
            fill={node.color}
            initial={{ opacity: 0, y: 4 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.7 }}
          >
            {node.sub}
          </motion.text>
          <motion.text
            x={node.x}
            y={node.y + 14}
            textAnchor="middle"
            fontSize="9"
            fill={COLORS.textMuted}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.85 }}
          >
            {node.hint}
          </motion.text>
        </g>
      ))}
      <text x={cx} y={height - 14} textAnchor="middle" fontSize="9" fill={COLORS.textDim}>
        Three locks. Remove any one and the vault fails.
      </text>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// RISK TREATMENT — 2x2 quadrant
// ─────────────────────────────────────────────────────────────────────
function RiskTreatment({ width, height, reduce, className }: DiagramProps) {
  const w = width - 20;
  const h = height - 60;
  const x0 = 10;
  const y0 = 30;
  const cells = [
    { label: 'Avoid',    sub: 'Stop the activity',           color: COLORS.accent, x: x0,         y: y0 },
    { label: 'Mitigate', sub: 'Add controls (most common)',  color: COLORS.good,   x: x0 + w / 2, y: y0 },
    { label: 'Transfer', sub: 'Insurance / contract',        color: COLORS.violet, x: x0,         y: y0 + h / 2 },
    { label: 'Accept',   sub: 'Document and live with it',   color: COLORS.warn,   x: x0 + w / 2, y: y0 + h / 2 },
  ];
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="Risk Treatment Options">
      {cells.map((c, i) => (
        <motion.g
          key={c.label}
          initial={{ opacity: 0, y: reduce ? 0 : 8 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.35, delay: reduce ? 0 : i * 0.1 }}
        >
          <rect
            x={c.x}
            y={c.y}
            width={w / 2 - 4}
            height={h / 2 - 4}
            rx="10"
            fill={`${c.color}10`}
            stroke={c.color}
            strokeWidth="1"
          />
          <text x={c.x + 14} y={c.y + 28} fontSize="14" fontWeight="bold" fill={c.color}>
            {c.label}
          </text>
          <text x={c.x + 14} y={c.y + 46} fontSize="10" fill={COLORS.textDim}>
            {c.sub}
          </text>
        </motion.g>
      ))}
      <text x={width / 2} y={height - 12} textAnchor="middle" fontSize="9" fill={COLORS.textDim}>
        AMTA: Avoid · Mitigate · Transfer · Accept
      </text>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// ALE FORMULA — formula tree
// ─────────────────────────────────────────────────────────────────────
function ALEFormula({ width, height, reduce, className }: DiagramProps) {
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="ALE Formula Tree">
      <motion.g initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ duration: 0.4 }}>
        <text x={width / 2} y={36} textAnchor="middle" fontSize="22" fontWeight="bold" fill={COLORS.gold}>
          ALE = SLE × ARO
        </text>
        <text x={width / 2} y={56} textAnchor="middle" fontSize="10" fill={COLORS.textMuted}>
          Annualized Loss Expectancy
        </text>
        <line x1={width / 2} y1={66} x2={width / 4} y2={100} stroke={COLORS.border} strokeWidth="1.5" />
        <line x1={width / 2} y1={66} x2={(3 * width) / 4} y2={100} stroke={COLORS.border} strokeWidth="1.5" />
        <rect x={width / 4 - 60} y={100} width={120} height={70} rx="8" fill="rgba(0,232,255,0.06)" stroke={COLORS.accent} />
        <text x={width / 4} y={122} textAnchor="middle" fontSize="14" fontWeight="bold" fill={COLORS.accent}>
          SLE
        </text>
        <text x={width / 4} y={140} textAnchor="middle" fontSize="10" fill={COLORS.textDim}>
          AV × EF
        </text>
        <text x={width / 4} y={156} textAnchor="middle" fontSize="9" fill={COLORS.textMuted}>
          Single Loss
        </text>
        <rect x={(3 * width) / 4 - 60} y={100} width={120} height={70} rx="8" fill="rgba(34,197,94,0.06)" stroke={COLORS.good} />
        <text x={(3 * width) / 4} y={122} textAnchor="middle" fontSize="14" fontWeight="bold" fill={COLORS.good}>
          ARO
        </text>
        <text x={(3 * width) / 4} y={140} textAnchor="middle" fontSize="10" fill={COLORS.textDim}>
          incidents / yr
        </text>
        <text x={(3 * width) / 4} y={156} textAnchor="middle" fontSize="9" fill={COLORS.textMuted}>
          Annual Rate
        </text>
        <text x={width / 2} y={height - 50} textAnchor="middle" fontSize="11" fill={COLORS.textDim}>
          Asset $8M · EF 50% · ARO 0.5
        </text>
        <text x={width / 2} y={height - 32} textAnchor="middle" fontSize="13" fontWeight="bold" fill={COLORS.gold}>
          → SLE $4M → ALE $2M / yr
        </text>
        <text x={width / 2} y={height - 14} textAnchor="middle" fontSize="9" fill={COLORS.textMuted}>
          Single first, then Annual
        </text>
      </motion.g>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// BELL-LAPADULA — no read up, no write down
// ─────────────────────────────────────────────────────────────────────
function BellLaPadula({ width, height, reduce, className, highlight }: DiagramProps) {
  const x = width / 2;
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="Bell-LaPadula · Confidentiality">
      {[
        { y: 60,  label: 'TOP SECRET',   color: COLORS.bad },
        { y: 130, label: 'SECRET',       color: COLORS.warn },
        { y: 200, label: 'CONFIDENTIAL', color: COLORS.accent },
        { y: 260, label: 'UNCLASSIFIED', color: COLORS.textDim },
      ].map((tier, i) => (
        <motion.g
          key={tier.label}
          initial={{ opacity: 0, y: reduce ? 0 : 8 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.3, delay: reduce ? 0 : i * 0.08 }}
        >
          <rect x={x - 100} y={tier.y - 18} width="200" height="36" rx="8" fill={`${tier.color}14`} stroke={tier.color} />
          <text x={x} y={tier.y + 5} textAnchor="middle" fontSize="11" fontWeight="bold" fill={tier.color}>
            {tier.label}
          </text>
        </motion.g>
      ))}
      <motion.g
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: reduce ? 0 : 0.5 }}
      >
        <line x1={x - 130} y1={250} x2={x - 130} y2={75} stroke={highlight === 'no-read-up' ? COLORS.bad : COLORS.bad} strokeWidth="2" markerEnd="url(#arrow-bad)" strokeDasharray="6 3" />
        <text x={x - 175} y={160} fontSize="10" fontWeight="bold" fill={COLORS.bad}>NO</text>
        <text x={x - 175} y={172} fontSize="9" fill={COLORS.bad}>READ</text>
        <text x={x - 175} y={184} fontSize="9" fill={COLORS.bad}>UP</text>
        <line x1={x + 130} y1={70} x2={x + 130} y2={245} stroke={COLORS.bad} strokeWidth="2" markerEnd="url(#arrow-bad)" strokeDasharray="6 3" />
        <text x={x + 145} y={160} fontSize="10" fontWeight="bold" fill={COLORS.bad}>NO</text>
        <text x={x + 145} y={172} fontSize="9" fill={COLORS.bad}>WRITE</text>
        <text x={x + 145} y={184} fontSize="9" fill={COLORS.bad}>DOWN</text>
      </motion.g>
      <defs>
        <marker id="arrow-bad" markerWidth="6" markerHeight="6" refX="5" refY="3" orient="auto">
          <polygon points="0 0, 6 3, 0 6" fill={COLORS.bad} />
        </marker>
      </defs>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// BIBA — mirrored: no read down, no write up
// ─────────────────────────────────────────────────────────────────────
function Biba({ width, height, reduce, className }: DiagramProps) {
  const x = width / 2;
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="Biba · Integrity">
      {[
        { y: 60,  label: 'HIGH INTEGRITY',  color: COLORS.good },
        { y: 130, label: 'AUDIT LOG',       color: COLORS.accent },
        { y: 200, label: 'USER PROCESS',    color: COLORS.warn },
        { y: 260, label: 'COMPROMISED',     color: COLORS.bad },
      ].map((tier, i) => (
        <motion.g
          key={tier.label}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.3, delay: reduce ? 0 : i * 0.08 }}
        >
          <rect x={x - 100} y={tier.y - 18} width="200" height="36" rx="8" fill={`${tier.color}14`} stroke={tier.color} />
          <text x={x} y={tier.y + 5} textAnchor="middle" fontSize="11" fontWeight="bold" fill={tier.color}>
            {tier.label}
          </text>
        </motion.g>
      ))}
      <motion.g initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: reduce ? 0 : 0.5 }}>
        <line x1={x - 130} y1={75} x2={x - 130} y2={250} stroke={COLORS.bad} strokeWidth="2" markerEnd="url(#arrow-bad-2)" strokeDasharray="6 3" />
        <text x={x - 175} y={160} fontSize="10" fontWeight="bold" fill={COLORS.bad}>NO</text>
        <text x={x - 175} y={172} fontSize="9" fill={COLORS.bad}>READ</text>
        <text x={x - 175} y={184} fontSize="9" fill={COLORS.bad}>DOWN</text>
        <line x1={x + 130} y1={245} x2={x + 130} y2={75} stroke={COLORS.bad} strokeWidth="2" markerEnd="url(#arrow-bad-2)" strokeDasharray="6 3" />
        <text x={x + 145} y={160} fontSize="10" fontWeight="bold" fill={COLORS.bad}>NO</text>
        <text x={x + 145} y={172} fontSize="9" fill={COLORS.bad}>WRITE</text>
        <text x={x + 145} y={184} fontSize="9" fill={COLORS.bad}>UP</text>
      </motion.g>
      <defs>
        <marker id="arrow-bad-2" markerWidth="6" markerHeight="6" refX="5" refY="3" orient="auto">
          <polygon points="0 0, 6 3, 0 6" fill={COLORS.bad} />
        </marker>
      </defs>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// DEFENSE IN DEPTH — concentric castle rings
// ─────────────────────────────────────────────────────────────────────
function DefenseInDepth({ width, height, reduce, className }: DiagramProps) {
  const cx = width / 2;
  const cy = height / 2;
  const rings = [
    { r: 130, label: 'Perimeter',    color: COLORS.accent },
    { r: 100, label: 'Network',      color: COLORS.violet },
    { r: 75,  label: 'Host',         color: COLORS.gold },
    { r: 50,  label: 'Application',  color: COLORS.warn },
    { r: 25,  label: 'Data',         color: COLORS.good },
  ];
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="Defense in Depth">
      {rings.map((ring, i) => (
        <motion.g
          key={ring.label}
          initial={{ opacity: 0, scale: reduce ? 1 : 0.6 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.4, delay: reduce ? 0 : i * 0.12 }}
        >
          <circle cx={cx} cy={cy} r={ring.r} fill="none" stroke={ring.color} strokeWidth="1.5" opacity="0.7" />
          <text x={cx + ring.r - 6} y={cy} textAnchor="end" fontSize="10" fontWeight="bold" fill={ring.color}>
            {ring.label}
          </text>
        </motion.g>
      ))}
      <text x={cx} y={cy + 4} textAnchor="middle" fontSize="11" fontWeight="bold" fill={COLORS.gold}>
        🏰
      </text>
      <text x={cx} y={height - 14} textAnchor="middle" fontSize="9" fill={COLORS.textDim}>
        Layered controls. No single point of failure.
      </text>
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// OSI 7-LAYER STACK
// ─────────────────────────────────────────────────────────────────────
function OSIStack({ width, height, reduce, className, highlight }: DiagramProps) {
  const layers = [
    { num: 7, label: 'Application',  example: 'HTTP, DNS' },
    { num: 6, label: 'Presentation', example: 'TLS, JPEG' },
    { num: 5, label: 'Session',      example: 'NetBIOS' },
    { num: 4, label: 'Transport',    example: 'TCP, UDP' },
    { num: 3, label: 'Network',      example: 'IP, ICMP' },
    { num: 2, label: 'Data Link',    example: 'Ethernet, ARP' },
    { num: 1, label: 'Physical',     example: 'Cables, RJ45' },
  ];
  const rowH = (height - 40) / 7;
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="OSI Model · Please Do Not Throw Sausage Pizza Away">
      {layers.map((l, i) => {
        const isHighlighted = highlight && highlight.toLowerCase() === l.label.toLowerCase();
        const color = isHighlighted ? COLORS.accent : COLORS.textDim;
        return (
          <motion.g
            key={l.num}
            initial={{ opacity: 0, x: reduce ? 0 : -8 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.25, delay: reduce ? 0 : i * 0.05 }}
          >
            <rect
              x={20}
              y={20 + i * rowH}
              width={width - 40}
              height={rowH - 4}
              rx="6"
              fill={isHighlighted ? `${COLORS.accent}18` : 'rgba(255,255,255,0.02)'}
              stroke={color}
              strokeWidth={isHighlighted ? 1.5 : 1}
            />
            <text x={36} y={20 + i * rowH + rowH / 2 + 4} fontSize="11" fontWeight="bold" fill={color}>
              L{l.num}
            </text>
            <text x={70} y={20 + i * rowH + rowH / 2 + 4} fontSize="11" fontWeight="bold" fill={isHighlighted ? COLORS.text : COLORS.textDim}>
              {l.label}
            </text>
            <text x={width - 40} y={20 + i * rowH + rowH / 2 + 4} textAnchor="end" fontSize="9" fill={COLORS.textMuted}>
              {l.example}
            </text>
          </motion.g>
        );
      })}
    </Frame>
  );
}

// ─────────────────────────────────────────────────────────────────────
// Remaining diagrams (compact stack-based renderers)
// ─────────────────────────────────────────────────────────────────────
function StackList({ width, height, reduce, className, title, items, accent }: DiagramProps & { title: string; items: { label: string; sub: string }[]; accent?: string }) {
  const rowH = (height - 50) / items.length;
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title={title}>
      {items.map((item, i) => {
        const c = accent ?? COLORS.accent;
        return (
          <motion.g
            key={item.label}
            initial={{ opacity: 0, x: reduce ? 0 : -8 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.25, delay: reduce ? 0 : i * 0.06 }}
          >
            <rect x={16} y={16 + i * rowH} width={width - 32} height={rowH - 6} rx="8" fill={`${c}10`} stroke={`${c}55`} />
            <circle cx={34} cy={16 + i * rowH + rowH / 2} r="11" fill={`${c}30`} stroke={c} />
            <text x={34} y={16 + i * rowH + rowH / 2 + 4} textAnchor="middle" fontSize="11" fontWeight="bold" fill={c}>
              {i + 1}
            </text>
            <text x={56} y={16 + i * rowH + rowH / 2 - 3} fontSize="11" fontWeight="bold" fill={COLORS.text}>
              {item.label}
            </text>
            <text x={56} y={16 + i * rowH + rowH / 2 + 11} fontSize="9" fill={COLORS.textDim}>
              {item.sub}
            </text>
          </motion.g>
        );
      })}
    </Frame>
  );
}

function GRCImmune(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="GRC · Corporate Immune System"
      accent={COLORS.violet}
      items={[
        { label: 'Governance',  sub: 'The brain — sets rules and decisions' },
        { label: 'Risk',        sub: 'Immune cells — scan for threats' },
        { label: 'Compliance',  sub: 'Antibodies — verify rules followed' },
      ]}
    />
  );
}

function PolicyPyramid(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Policy Hierarchy · City Analogy"
      accent={COLORS.gold}
      items={[
        { label: 'Policy',     sub: 'The Constitution — what must be protected' },
        { label: 'Standards',  sub: 'Building codes — how it gets done' },
        { label: 'Procedures', sub: 'Construction manuals — step-by-step' },
        { label: 'Guidelines', sub: 'Suggestions — recommended, not mandatory' },
      ]}
    />
  );
}

function TLSHandshake(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="TLS 1.3 Handshake (1-RTT)"
      accent={COLORS.accent}
      items={[
        { label: 'ClientHello',                sub: 'Cipher suites + ephemeral DH key share' },
        { label: 'ServerHello + Certificate',  sub: 'Server picks cipher, sends cert' },
        { label: 'Both compute shared secret', sub: 'Forward secrecy via ephemeral DH' },
        { label: 'Encrypted application data', sub: 'AES-GCM / ChaCha20 encrypted traffic' },
      ]}
    />
  );
}

function KerberosFlow(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Kerberos · The Three-Headed Dog"
      accent={COLORS.warn}
      items={[
        { label: 'AS Request',     sub: 'Password presented once to Authentication Server' },
        { label: 'TGT issued',     sub: 'Master VIP pass (10h validity)' },
        { label: 'TGS Request',    sub: 'Present TGT, name target service' },
        { label: 'Service Ticket', sub: 'Specific room key — no password re-entry' },
      ]}
    />
  );
}

function LeastPrivilege(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Least Privilege · Keycard Model"
      accent={COLORS.good}
      items={[
        { label: 'Identify role',         sub: 'What is this user expected to do?' },
        { label: 'Map required access',   sub: 'Minimum doors needed' },
        { label: 'Grant minimum',         sub: 'Keycard opens only those doors' },
        { label: 'Recertify periodically', sub: 'Quarterly access review' },
      ]}
    />
  );
}

function ZeroTrust(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Zero Trust · Never Trust, Always Verify"
      accent={COLORS.violet}
      items={[
        { label: 'Verify identity',        sub: 'Strong auth on every request' },
        { label: 'Verify device posture',  sub: 'Health, patch level, enrollment' },
        { label: 'Apply least privilege',  sub: 'Just-enough, just-in-time' },
        { label: 'Continuously monitor',   sub: 'Re-evaluate during the session' },
      ]}
    />
  );
}

function BiometricCurve({ width, height, reduce, className }: DiagramProps) {
  return (
    <Frame width={width} height={height} reduce={reduce} className={className} title="Biometric Trade-off · CER">
      <line x1="40" y1={height - 40} x2={width - 20} y2={height - 40} stroke={COLORS.border} />
      <line x1="40" y1={20} x2="40" y2={height - 40} stroke={COLORS.border} />
      <text x={width / 2} y={height - 20} textAnchor="middle" fontSize="9" fill={COLORS.textDim}>
        Sensitivity →
      </text>
      <text x="20" y={height / 2} fontSize="9" fill={COLORS.textDim} transform={`rotate(-90 20 ${height / 2})`}>
        Error rate →
      </text>
      <motion.path
        d={`M 40 ${height - 60} Q ${width / 2} ${height - 220} ${width - 25} ${height - 50}`}
        fill="none"
        stroke={COLORS.bad}
        strokeWidth="2"
        initial={reduce ? { opacity: 0 } : { pathLength: 0 }}
        animate={reduce ? { opacity: 1 } : { pathLength: 1 }}
        transition={{ duration: 0.7 }}
      />
      <motion.path
        d={`M 40 ${height - 50} Q ${width / 2} ${height - 220} ${width - 25} ${height - 60}`}
        fill="none"
        stroke={COLORS.warn}
        strokeWidth="2"
        initial={reduce ? { opacity: 0 } : { pathLength: 0 }}
        animate={reduce ? { opacity: 1 } : { pathLength: 1 }}
        transition={{ duration: 0.7, delay: 0.2 }}
      />
      <circle cx={width / 2} cy={height - 130} r="6" fill={COLORS.gold} />
      <text x={width / 2 + 12} y={height - 124} fontSize="11" fontWeight="bold" fill={COLORS.gold}>
        CER
      </text>
      <text x={width - 60} y={height - 80} fontSize="10" fill={COLORS.bad}>FAR</text>
      <text x={width - 60} y={height - 60} fontSize="10" fill={COLORS.warn}>FRR</text>
      <text x={width / 2} y={height - 6} textAnchor="middle" fontSize="9" fill={COLORS.textMuted}>
        Lower CER = better biometric
      </text>
    </Frame>
  );
}

function EvidenceVolatility(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Evidence Volatility · Most Volatile First"
      accent={COLORS.bad}
      items={[
        { label: 'CPU registers / cache',     sub: 'Lost in microseconds' },
        { label: 'RAM / memory',              sub: 'Lost on power off' },
        { label: 'Running processes / sockets', sub: 'Lost on reboot' },
        { label: 'Temp files / swap',         sub: 'May survive reboot' },
        { label: 'Disk storage',              sub: 'Persists without power' },
        { label: 'Off-system logs / SIEM',    sub: 'Most durable' },
      ]}
    />
  );
}

function PentestPhases(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="PTES · Pentest Phases"
      accent={COLORS.accent}
      items={[
        { label: 'Pre-engagement',     sub: 'Scope · ROE · authorization' },
        { label: 'Intelligence',       sub: 'OSINT · attack surface' },
        { label: 'Threat modeling',    sub: 'Highest-value targets' },
        { label: 'Vulnerability analysis', sub: 'Scan + manual testing' },
        { label: 'Exploitation',       sub: 'Confirm exploitability' },
        { label: 'Post-exploitation',  sub: 'Persistence · lateral · privesc' },
        { label: 'Reporting',          sub: 'Findings + executive summary' },
      ]}
    />
  );
}

function SastDastIast(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="App Security Testing · Shift Left"
      accent={COLORS.good}
      items={[
        { label: 'SAST',  sub: 'Source code analysis (static, pre-deploy)' },
        { label: 'DAST',  sub: 'Deployed app testing (dynamic, post-build)' },
        { label: 'IAST',  sub: 'Instrumented (inside + outside during tests)' },
        { label: 'RASP',  sub: 'Runtime self-protection (live, in production)' },
      ]}
    />
  );
}

function NISTIRCycle(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="NIST IR Lifecycle"
      accent={COLORS.warn}
      items={[
        { label: 'Preparation',                  sub: 'Tools, runbooks, training' },
        { label: 'Detection & Analysis',         sub: 'Identify and triage incidents' },
        { label: 'Containment · Eradication · Recovery', sub: 'Stop · remove · restore' },
        { label: 'Post-Incident Activity',       sub: 'Lessons learned, tune controls' },
      ]}
    />
  );
}

function SiemSoar(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="SIEM vs SOAR"
      accent={COLORS.accent}
      items={[
        { label: 'SIEM · Detect',       sub: 'Collect, normalize, correlate, alert' },
        { label: 'SOAR · Respond',      sub: 'Automated response playbooks' },
        { label: 'Smoke detector',      sub: 'SIEM analogy' },
        { label: 'Sprinkler system',    sub: 'SOAR analogy' },
      ]}
    />
  );
}

function DRTestLadder(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="DR Test Ladder · Talk → Cut"
      accent={COLORS.violet}
      items={[
        { label: 'Tabletop',         sub: 'Talk through the plan' },
        { label: 'Walkthrough',      sub: 'Trace each step' },
        { label: 'Simulation',       sub: 'Mock crisis in test env' },
        { label: 'Parallel',         sub: 'Run DR alongside production' },
        { label: 'Full Interruption', sub: 'Cut the cord — production fails over' },
      ]}
    />
  );
}

function DevSecOpsPipeline(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="DevSecOps Pipeline Gates"
      accent={COLORS.good}
      items={[
        { label: 'Code',     sub: 'Pre-commit hooks · IDE SAST plugins' },
        { label: 'Commit',   sub: 'SAST · SCA dependency scan' },
        { label: 'Build',    sub: 'Container scan · secret detection' },
        { label: 'Test',     sub: 'DAST · IAST during functional tests' },
        { label: 'Deploy',   sub: 'IaC scan · policy gates' },
        { label: 'Runtime',  sub: 'RASP · WAF · SIEM/SOAR' },
      ]}
    />
  );
}

function OWASPTop10(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="OWASP Top 10 (2021) · Top 5"
      accent={COLORS.bad}
      items={[
        { label: 'A01 Broken Access Control',  sub: 'Most prevalent (94% of apps)' },
        { label: 'A02 Cryptographic Failures', sub: 'Was: Sensitive Data Exposure' },
        { label: 'A03 Injection',              sub: 'Was #1 for a decade' },
        { label: 'A04 Insecure Design',        sub: 'New category' },
        { label: 'A05 Security Misconfiguration', sub: 'Default creds, exposed mgmt' },
      ]}
    />
  );
}

function DataLifecycle(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Data Lifecycle · Cradle to Grave"
      accent={COLORS.accent}
      items={[
        { label: 'Create',  sub: 'Classify at the moment of creation' },
        { label: 'Use',     sub: 'Process · share · transmit' },
        { label: 'Archive', sub: 'Retain per policy / regulation' },
        { label: 'Destroy', sub: 'Sanitize per classification level' },
      ]}
    />
  );
}

function AAAServices(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="AAA Services"
      accent={COLORS.violet}
      items={[
        { label: 'Authentication', sub: 'WHO are you? (factor verification)' },
        { label: 'Authorization',  sub: 'What can you DO? (permissions)' },
        { label: 'Accounting',     sub: 'What did you do? (audit logs)' },
      ]}
    />
  );
}

function SanitizationLevels(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Media Sanitization · NIST 800-88"
      accent={COLORS.warn}
      items={[
        { label: 'Clearing',     sub: 'Overwrite. Same media reusable.' },
        { label: 'Purging',      sub: 'Degauss / crypto-erase.' },
        { label: 'Destruction',  sub: 'Shred / incinerate. Restricted data.' },
      ]}
    />
  );
}

function OAuthFlow(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="OAuth 2.0 Authorization Code + PKCE"
      accent={COLORS.accent}
      items={[
        { label: 'User → IdP',        sub: 'Login + consent screen' },
        { label: 'IdP → App (code)',  sub: 'Short-lived authorization code' },
        { label: 'App → IdP (server)', sub: 'Exchange code + PKCE verifier for token' },
        { label: 'App → API',         sub: 'Bearer token on each request' },
      ]}
    />
  );
}

function WirelessAuth(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="Wireless Authentication · Strongest Last"
      accent={COLORS.good}
      items={[
        { label: 'WPA2-Personal',     sub: 'Shared passphrase. Dictionary-attackable.' },
        { label: 'WPA3-Personal/SAE', sub: 'No offline crack. Still shared secret.' },
        { label: '802.1X + EAP-TLS',  sub: 'Per-user certificate. Gold standard.' },
      ]}
    />
  );
}

function CAPTheorem(p: DiagramProps) {
  return (
    <StackList
      {...p}
      title="CAP Theorem · Pick Two"
      accent={COLORS.violet}
      items={[
        { label: 'Consistency',         sub: 'All nodes see same data at same time' },
        { label: 'Availability',        sub: 'Every request gets a response' },
        { label: 'Partition Tolerance', sub: 'System survives network splits' },
      ]}
    />
  );
}
