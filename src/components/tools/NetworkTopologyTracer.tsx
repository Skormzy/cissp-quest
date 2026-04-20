'use client';

import { useState, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Brain, Shield, AlertTriangle, CheckCircle, X } from 'lucide-react';
import { Button } from '@/components/ui/button';

// ─── Types ────────────────────────────────────────────────────────────────

interface NetworkNode {
  id: string;
  label: string;
  icon: string;
  x: number; // percentage 0-100
  y: number;
  zone: 'internet' | 'edge' | 'dmz' | 'internal' | 'data';
  role: string;
  controls: string[];
  isChokePoint: boolean;
}

interface AttackPath {
  from: string;
  to: string;
  blockAt?: string; // node ID where user should block
}

// ─── Network Layout ───────────────────────────────────────────────────────

const NODES: NetworkNode[] = [
  {
    id: 'internet',
    label: 'Internet',
    icon: '🌐',
    x: 5, y: 40,
    zone: 'internet',
    role: 'Untrusted external network. Source of all inbound threats and legitimate user traffic.',
    controls: ['No controls owned — this is the threat landscape'],
    isChokePoint: false,
  },
  {
    id: 'router',
    label: 'Border Router',
    icon: '📡',
    x: 20, y: 40,
    zone: 'edge',
    role: 'First device at the network perimeter. Handles routing and basic ACLs.',
    controls: ['ACL (block RFC1918 from internet)', 'BGP route filtering', 'Anti-spoofing (uRPF)'],
    isChokePoint: true,
  },
  {
    id: 'firewall',
    label: 'Firewall',
    icon: '🔥',
    x: 36, y: 40,
    zone: 'edge',
    role: 'Stateful packet inspection. Primary choke point between untrusted and trusted zones.',
    controls: ['Stateful packet inspection', 'DMZ segmentation', 'Default-deny inbound', 'NAT / PAT'],
    isChokePoint: true,
  },
  {
    id: 'webserver',
    label: 'Web Server',
    icon: '🖥️',
    x: 52, y: 20,
    zone: 'dmz',
    role: 'Hosts public-facing application. Lives in DMZ — isolated from internal network.',
    controls: ['WAF (Web Application Firewall)', 'TLS termination', 'Minimal OS footprint', 'No direct DB access'],
    isChokePoint: false,
  },
  {
    id: 'mailserver',
    label: 'Mail Server',
    icon: '📧',
    x: 52, y: 60,
    zone: 'dmz',
    role: 'Handles inbound and outbound email. In DMZ to limit exposure of internal systems.',
    controls: ['SPF / DKIM / DMARC', 'Email gateway / anti-spam', 'Sandboxing of attachments'],
    isChokePoint: false,
  },
  {
    id: 'ids',
    label: 'IDS/IPS',
    icon: '👁️',
    x: 68, y: 40,
    zone: 'internal',
    role: 'Network intrusion detection and prevention. Monitors internal traffic for anomalies.',
    controls: ['Signature-based detection', 'Anomaly-based detection', 'Inline blocking (IPS mode)', 'SIEM integration'],
    isChokePoint: true,
  },
  {
    id: 'switch',
    label: 'Core Switch',
    icon: '🔀',
    x: 80, y: 40,
    zone: 'internal',
    role: 'Layer 2/3 switching for internal LAN. Enables VLAN segmentation.',
    controls: ['VLAN segmentation', '802.1X port authentication', 'Port security (MAC limiting)', 'DHCP snooping'],
    isChokePoint: false,
  },
  {
    id: 'workstations',
    label: 'Workstations',
    icon: '💻',
    x: 88, y: 20,
    zone: 'internal',
    role: 'End-user devices. Primary target for phishing and malware delivery.',
    controls: ['EDR / antivirus', 'Full-disk encryption', 'Least privilege accounts', 'Patch management'],
    isChokePoint: false,
  },
  {
    id: 'database',
    label: 'Database Server',
    icon: '🗄️',
    x: 92, y: 60,
    zone: 'data',
    role: 'Crown jewel. Must never be directly reachable from the internet.',
    controls: ['DB-level encryption', 'App-layer access only (no direct SQL from DMZ)', 'Audit logging', 'Separate DB VLAN'],
    isChokePoint: false,
  },
];

const EDGES: [string, string][] = [
  ['internet', 'router'],
  ['router', 'firewall'],
  ['firewall', 'webserver'],
  ['firewall', 'mailserver'],
  ['firewall', 'ids'],
  ['ids', 'switch'],
  ['switch', 'workstations'],
  ['switch', 'database'],
];

const ATTACK_PATHS: AttackPath[] = [
  {
    from: 'internet',
    to: 'database',
    blockAt: 'firewall',
  },
  {
    from: 'internet',
    to: 'workstations',
    blockAt: 'ids',
  },
];

const ZONE_COLORS: Record<NetworkNode['zone'], string> = {
  internet: '#ef4444',
  edge:     '#f97316',
  dmz:      '#eab308',
  internal: '#22c55e',
  data:     '#8b5cf6',
};

// ─── SVG layout helpers ───────────────────────────────────────────────────

const W = 800;
const H = 320;

function nodePos(n: NetworkNode) {
  return { x: (n.x / 100) * W, y: (n.y / 100) * H };
}

function getEdgePoints(fromId: string, toId: string) {
  const f = NODES.find((n) => n.id === fromId)!;
  const t = NODES.find((n) => n.id === toId)!;
  return { x1: (f.x / 100) * W, y1: (f.y / 100) * H, x2: (t.x / 100) * W, y2: (t.y / 100) * H };
}

// ─── Animated packet ──────────────────────────────────────────────────────

interface PacketProps {
  path: { x: number; y: number }[];
  onReach: (nodeIdx: number) => void;
  color?: string;
}

function AnimatedPacket({ path, onReach, color = '#ef4444' }: PacketProps) {
  const totalLen = path.length - 1;

  return (
    <>
      {path.slice(0, -1).map((pt, i) => {
        const next = path[i + 1];
        return (
          <motion.circle
            key={i}
            r={6}
            fill={color}
            cx={pt.x}
            cy={pt.y}
            initial={{ cx: pt.x, cy: pt.y, opacity: 0 }}
            animate={{ cx: next.x, cy: next.y, opacity: 1 }}
            transition={{ delay: i * 0.6, duration: 0.5, ease: 'easeInOut' }}
            onAnimationComplete={() => onReach(i + 1)}
          />
        );
      })}
    </>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function NetworkTopologyTracer() {
  const [selectedNode, setSelectedNode] = useState<NetworkNode | null>(null);
  const [attackPhase, setAttackPhase] = useState<'idle' | 'running' | 'blocked' | 'breached'>('idle');
  const [activePathIdx, setActivePathIdx] = useState(0);
  const [packetPos, setPacketPos] = useState(0);
  const [blockedAt, setBlockedAt] = useState<string | null>(null);
  const [attackPathNodes, setAttackPathNodes] = useState<NetworkNode[]>([]);
  const [attackKey, setAttackKey] = useState(0);

  const currentAttack = ATTACK_PATHS[activePathIdx];

  const buildAttackPath = useCallback((ap: AttackPath): NetworkNode[] => {
    // BFS-ish: find shortest path through edges from ap.from to ap.to
    const adjList: Record<string, string[]> = {};
    EDGES.forEach(([a, b]) => {
      adjList[a] = [...(adjList[a] ?? []), b];
      adjList[b] = [...(adjList[b] ?? []), a];
    });

    const queue = [[ap.from]];
    while (queue.length) {
      const path = queue.shift()!;
      const last = path[path.length - 1];
      if (last === ap.to) return path.map((id) => NODES.find((n) => n.id === id)!);
      for (const next of adjList[last] ?? []) {
        if (!path.includes(next)) queue.push([...path, next]);
      }
    }
    return [];
  }, []);

  const startAttack = useCallback(() => {
    const ap = ATTACK_PATHS[activePathIdx];
    const path = buildAttackPath(ap);
    setAttackPathNodes(path);
    setPacketPos(0);
    setBlockedAt(null);
    setAttackPhase('running');
    setAttackKey((k) => k + 1);
  }, [activePathIdx, buildAttackPath]);

  const handleBlockAttempt = useCallback(() => {
    if (attackPhase !== 'running') return;
    const ap = currentAttack;
    const expectedBlockNode = NODES.find((n) => n.id === ap.blockAt);
    if (!expectedBlockNode) return;
    setBlockedAt(expectedBlockNode.id);
    setAttackPhase('blocked');
  }, [attackPhase, currentAttack]);

  const handlePacketReach = useCallback(
    (nodeIdx: number) => {
      setPacketPos(nodeIdx);
      const reached = attackPathNodes[nodeIdx];
      if (!reached) return;
      if (reached.id === currentAttack.to && attackPhase === 'running') {
        setAttackPhase('breached');
      }
    },
    [attackPathNodes, currentAttack, attackPhase],
  );

  const resetAttack = () => {
    setAttackPhase('idle');
    setBlockedAt(null);
    setPacketPos(0);
  };

  return (
    <div
      className="rounded-2xl overflow-hidden w-full max-w-3xl mx-auto"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-6 pt-6 pb-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Network Topology Tracer</h2>
            <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>
              Click nodes to inspect security controls. Launch an attack and click Block to stop it.
            </p>
          </div>
          <span
            className="px-2.5 py-1 rounded-lg text-xs font-bold whitespace-nowrap"
            style={{ background: 'rgba(34,197,94,0.12)', color: '#22c55e', border: '1px solid #22c55e44' }}
          >
            Domain 4 — Networks
          </span>
        </div>
      </div>

      {/* Zone legend */}
      <div className="px-6 pt-4 flex flex-wrap gap-3">
        {Object.entries(ZONE_COLORS).map(([zone, color]) => (
          <div key={zone} className="flex items-center gap-1.5">
            <div className="w-2 h-2 rounded-full" style={{ background: color }} />
            <span className="text-xs capitalize" style={{ color: '#64748b' }}>{zone}</span>
          </div>
        ))}
      </div>

      {/* SVG Diagram */}
      <div className="px-6 pt-3 overflow-x-auto">
        <svg
          viewBox={`0 0 ${W} ${H}`}
          width="100%"
          style={{ minWidth: 500, display: 'block' }}
        >
          {/* Zone backgrounds */}
          <rect x={0}   y={0} width={140} height={H} fill="rgba(239,68,68,0.04)"  rx={0} />
          <rect x={140} y={0} width={180} height={H} fill="rgba(249,115,22,0.04)" rx={0} />
          <rect x={320} y={0} width={220} height={H} fill="rgba(234,179,8,0.04)"  rx={0} />
          <rect x={540} y={0} width={180} height={H} fill="rgba(34,197,94,0.04)"  rx={0} />
          <rect x={720} y={0} width={80}  height={H} fill="rgba(139,92,246,0.04)" rx={0} />

          {/* Zone labels */}
          {[
            { label: 'Internet', x: 4,   color: '#ef4444' },
            { label: 'Edge',     x: 144, color: '#f97316' },
            { label: 'DMZ',      x: 324, color: '#eab308' },
            { label: 'Internal', x: 544, color: '#22c55e' },
            { label: 'Data',     x: 724, color: '#8b5cf6' },
          ].map((z) => (
            <text key={z.label} x={z.x + 4} y={14} fontSize={9} fill={z.color} opacity={0.7}
              fontFamily="sans-serif" fontWeight="bold">
              {z.label}
            </text>
          ))}

          {/* Edges */}
          {EDGES.map(([a, b]) => {
            const pts = getEdgePoints(a, b);
            const isAttackEdge = attackPathNodes.some((n) => n.id === a) && attackPathNodes.some((n) => n.id === b);
            return (
              <line
                key={`${a}-${b}`}
                x1={pts.x1} y1={pts.y1} x2={pts.x2} y2={pts.y2}
                stroke={isAttackEdge && attackPhase === 'running' ? '#ef4444' : '#1e2d4a'}
                strokeWidth={isAttackEdge && attackPhase === 'running' ? 2 : 1.5}
                strokeDasharray={isAttackEdge && attackPhase === 'running' ? '6 3' : undefined}
              />
            );
          })}

          {/* Nodes */}
          {NODES.map((node) => {
            const pos = nodePos(node);
            const isSelected = selectedNode?.id === node.id;
            const isBlockPoint = node.id === currentAttack.blockAt;
            const isBlocked = blockedAt === node.id;
            const zoneColor = ZONE_COLORS[node.zone];

            return (
              <g key={node.id} onClick={() => setSelectedNode(isSelected ? null : node)} style={{ cursor: 'pointer' }}>
                {/* Glow ring for choke points */}
                {node.isChokePoint && (
                  <circle cx={pos.x} cy={pos.y} r={28} fill="none" stroke={zoneColor} strokeWidth={1} opacity={0.3} />
                )}
                {/* Block indicator ring */}
                {isBlockPoint && attackPhase === 'running' && (
                  <motion.circle
                    cx={pos.x} cy={pos.y} r={30}
                    fill="none" stroke="#ef4444" strokeWidth={2}
                    animate={{ r: [28, 34, 28] }}
                    transition={{ repeat: Infinity, duration: 1 }}
                  />
                )}
                {/* Node circle */}
                <circle
                  cx={pos.x} cy={pos.y} r={22}
                  fill={isSelected ? `${zoneColor}33` : '#111827'}
                  stroke={isBlocked ? '#22c55e' : isSelected ? zoneColor : '#1e2d4a'}
                  strokeWidth={isSelected || isBlocked ? 2 : 1.5}
                />
                {/* Emoji */}
                <text x={pos.x} y={pos.y + 1} textAnchor="middle" dominantBaseline="middle" fontSize={16}>
                  {node.icon}
                </text>
                {/* Label */}
                <text x={pos.x} y={pos.y + 32} textAnchor="middle" fontSize={9}
                  fill={isSelected ? '#e2e8f0' : '#64748b'} fontFamily="sans-serif">
                  {node.label}
                </text>
                {/* Choke point marker */}
                {node.isChokePoint && (
                  <text x={pos.x + 18} y={pos.y - 16} fontSize={9} fill={zoneColor}>🔒</text>
                )}
              </g>
            );
          })}

          {/* Animated attack packet */}
          {attackPhase === 'running' && attackPathNodes.length > 0 && (
            <AnimatedPacket
              key={attackKey}
              path={attackPathNodes.map(nodePos)}
              onReach={handlePacketReach}
              color="#ef4444"
            />
          )}

          {/* Blocked indicator */}
          {attackPhase === 'blocked' && blockedAt && (() => {
            const n = NODES.find((x) => x.id === blockedAt);
            if (!n) return null;
            const pos = nodePos(n);
            return (
              <text x={pos.x} y={pos.y - 34} textAnchor="middle" fontSize={18}>✅</text>
            );
          })()}
        </svg>
      </div>

      {/* Attack controls */}
      <div className="px-6 pt-3 pb-4 flex flex-wrap gap-3 items-center">
        <select
          className="text-xs rounded-xl px-3 py-2 outline-none"
          style={{ background: '#111827', border: '1px solid #1e2d4a', color: '#94a3b8' }}
          value={activePathIdx}
          onChange={(e) => { setActivePathIdx(Number(e.target.value)); resetAttack(); }}
        >
          {ATTACK_PATHS.map((ap, i) => (
            <option key={i} value={i}>
              Attack: {ap.from} → {ap.to}
            </option>
          ))}
        </select>

        {attackPhase === 'idle' && (
          <Button size="sm" onClick={startAttack} style={{ background: '#ef4444', color: '#fff' }}>
            <AlertTriangle size={13} className="mr-1.5" />
            Launch Attack
          </Button>
        )}

        {attackPhase === 'running' && (
          <Button size="sm" onClick={handleBlockAttempt} style={{ background: '#22c55e', color: '#fff' }}>
            <Shield size={13} className="mr-1.5" />
            Block Attack
          </Button>
        )}

        {(attackPhase === 'blocked' || attackPhase === 'breached') && (
          <Button size="sm" variant="outline" onClick={resetAttack} style={{ borderColor: '#1e2d4a' }}>
            Reset
          </Button>
        )}

        {/* Status messages */}
        <AnimatePresence>
          {attackPhase === 'blocked' && (
            <motion.span
              className="text-xs font-bold flex items-center gap-1"
              style={{ color: '#22c55e' }}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
            >
              <CheckCircle size={13} /> Attack blocked at {NODES.find((n) => n.id === blockedAt)?.label}!
            </motion.span>
          )}
          {attackPhase === 'breached' && (
            <motion.span
              className="text-xs font-bold flex items-center gap-1"
              style={{ color: '#ef4444' }}
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
            >
              <AlertTriangle size={13} /> Breach! Click Block faster next time.
            </motion.span>
          )}
          {attackPhase === 'running' && (
            <motion.span className="text-xs" style={{ color: '#eab308' }} initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
              Click Block at the right choke point!
            </motion.span>
          )}
        </AnimatePresence>
      </div>

      {/* Node detail panel */}
      <AnimatePresence>
        {selectedNode && (
          <motion.div
            className="mx-6 mb-4 rounded-2xl p-4"
            style={{ background: '#111827', border: `1px solid ${ZONE_COLORS[selectedNode.zone]}44` }}
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            exit={{ opacity: 0, height: 0 }}
          >
            <div className="flex items-start justify-between gap-3 mb-2">
              <div className="flex items-center gap-2">
                <span className="text-xl">{selectedNode.icon}</span>
                <div>
                  <p className="text-sm font-bold" style={{ color: '#e2e8f0' }}>{selectedNode.label}</p>
                  <p className="text-xs capitalize" style={{ color: ZONE_COLORS[selectedNode.zone] }}>
                    {selectedNode.zone} zone {selectedNode.isChokePoint ? '· 🔒 Choke Point' : ''}
                  </p>
                </div>
              </div>
              <button onClick={() => setSelectedNode(null)}>
                <X size={14} style={{ color: '#475569' }} />
              </button>
            </div>
            <p className="text-xs mb-2 leading-relaxed" style={{ color: '#94a3b8' }}>{selectedNode.role}</p>
            <div className="flex flex-wrap gap-1.5">
              {selectedNode.controls.map((c, i) => (
                <span
                  key={i}
                  className="px-2 py-0.5 rounded-md text-xs"
                  style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#64748b' }}
                >
                  {c}
                </span>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Memory hack */}
      <div className="px-6 pb-6 pt-2">
        <div
          className="flex gap-3 rounded-xl p-4"
          style={{ background: 'rgba(0,232,255,0.05)', borderLeft: '3px solid #00e8ff' }}
        >
          <Brain size={16} className="shrink-0 mt-0.5" style={{ color: '#00e8ff' }} />
          <div>
            <p className="text-xs font-bold uppercase tracking-wider mb-1" style={{ color: '#00e8ff' }}>
              Memory Hack — DMZ
            </p>
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              <strong style={{ color: '#e2e8f0' }}>DMZ = De-Militarized Zone.</strong> Think of it like an airport customs hall —
              you're between the outside world and the secure interior, controlled but not fully trusted.
              Web servers live in the DMZ so attackers who compromise them can't pivot directly to internal systems.
              <strong style={{ color: '#e2e8f0' }}> Defense in Depth:</strong> multiple layers mean one breach doesn't equal full compromise.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
