'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import Link from 'next/link';
import { ExternalLink, CheckCircle } from 'lucide-react';
import { Button } from '@/components/ui/button';

// ─── Tool registry ────────────────────────────────────────────────────────

interface Tool {
  id: string;
  name: string;
  description: string;
  icon: string;
  domain: string;
  domainId: number;
  domainColor: string;
  href: string;
  tags: string[];
  difficulty: 'Beginner' | 'Intermediate' | 'Advanced';
}

const TOOLS: Tool[] = [
  {
    id: 'risk-calculator',
    name: 'Risk Calculator',
    description:
      'Compute ALE, SLE, and ARO interactively. Load real-world breach scenarios and see how countermeasure costs compare to expected losses.',
    icon: '📊',
    domain: 'Security & Risk Management',
    domainId: 1,
    domainColor: '#ef4444',
    href: '/app/tools/risk-calculator',
    tags: ['ALE', 'SLE', 'ARO', 'Quantitative Risk'],
    difficulty: 'Beginner',
  },
  {
    id: 'access-control-lab',
    name: 'Access Control Lab',
    description:
      'Build and test access control matrices across DAC, MAC, and RBAC models. See Bell-LaPadula violations in action.',
    icon: '🔑',
    domain: 'Identity & Access Management',
    domainId: 5,
    domainColor: '#06b6d4',
    href: '/app/tools/access-control',
    tags: ['DAC', 'MAC', 'RBAC', 'Bell-LaPadula'],
    difficulty: 'Intermediate',
  },
  {
    id: 'crypto-workbench',
    name: 'Crypto Workbench',
    description:
      'Encrypt and decrypt text with Caesar, ROT13, and XOR ciphers. Visualize symmetric vs asymmetric key diagrams.',
    icon: '🔐',
    domain: 'Security Architecture & Engineering',
    domainId: 3,
    domainColor: '#eab308',
    href: '/app/tools/crypto',
    tags: ['Symmetric', 'Asymmetric', 'RSA', 'Cipher'],
    difficulty: 'Beginner',
  },
  {
    id: 'ir-commander',
    name: 'IR Commander',
    description:
      'Race the clock to execute the PICERL incident response framework in the correct order. Three scenarios with increasing complexity.',
    icon: '🚨',
    domain: 'Security Operations',
    domainId: 7,
    domainColor: '#ec4899',
    href: '/app/tools/ir-commander',
    tags: ['PICERL', 'Incident Response', 'NIST', 'SOC'],
    difficulty: 'Intermediate',
  },
  {
    id: 'network-tracer',
    name: 'Network Topology Tracer',
    description:
      'Inspect a live network diagram from internet to database. Launch attack simulations and intercept them at the right choke point.',
    icon: '🌐',
    domain: 'Communication & Network Security',
    domainId: 4,
    domainColor: '#22c55e',
    href: '/app/tools/network-tracer',
    tags: ['DMZ', 'Firewall', 'IDS', 'Defense in Depth'],
    difficulty: 'Advanced',
  },
  {
    id: 'evidence-constellation',
    name: 'Evidence Constellation',
    description:
      'Force-directed knowledge graph of all 80+ CISSP concepts. Explore domain relationships, follow connection trails, and navigate straight to the Reference Library.',
    icon: '✦',
    domain: 'All Domains',
    domainId: 0,
    domainColor: '#00e8ff',
    href: '/app/tools/constellation',
    tags: ['Knowledge Map', 'Concepts', 'All Domains', 'Graph'],
    difficulty: 'Intermediate',
  },
  {
    id: 'forensic-timeline',
    name: 'Forensic Timeline',
    description:
      'Reconstruct digital incidents by placing forensic artefacts on an interactive timeline. Practice evidence sequencing, chain of custody, and log correlation across Operation Shadow Protocol cases.',
    icon: '🕵️',
    domain: 'Security Operations',
    domainId: 7,
    domainColor: '#ec4899',
    href: '/app/tools/forensic-timeline',
    tags: ['Digital Forensics', 'Chain of Custody', 'Log Analysis', 'DFIR'],
    difficulty: 'Advanced',
  },
];

const DIFFICULTY_CONFIG = {
  Beginner:     { color: '#22c55e', bg: 'rgba(34,197,94,0.12)'  },
  Intermediate: { color: '#eab308', bg: 'rgba(234,179,8,0.12)'  },
  Advanced:     { color: '#ef4444', bg: 'rgba(239,68,68,0.12)'  },
};

const DOMAIN_FILTERS = [
  { id: 0,  label: 'All Tools' },
  { id: 1,  label: 'Risk Management' },
  { id: 3,  label: 'Architecture' },
  { id: 4,  label: 'Networks' },
  { id: 5,  label: 'IAM' },
  { id: 7,  label: 'SecOps' },
];

// ─── Tool Card ────────────────────────────────────────────────────────────

function ToolCard({ tool, used }: { tool: Tool; used: boolean }) {
  const diff = DIFFICULTY_CONFIG[tool.difficulty];

  return (
    <motion.div
      className="relative flex flex-col rounded-2xl overflow-hidden h-full"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
      whileHover={{ y: -3, borderColor: `${tool.domainColor}66` }}
      transition={{ duration: 0.2 }}
      layout
    >
      {/* Used indicator */}
      {used && (
        <div className="absolute top-3 right-3">
          <CheckCircle size={16} style={{ color: '#22c55e' }} />
        </div>
      )}

      {/* Card body */}
      <div className="p-5 flex flex-col flex-1 gap-3">
        {/* Icon + domain */}
        <div className="flex items-start gap-3">
          <div
            className="w-12 h-12 rounded-2xl flex items-center justify-center text-2xl shrink-0"
            style={{ background: `${tool.domainColor}15`, border: `1px solid ${tool.domainColor}44` }}
          >
            {tool.icon}
          </div>
          <div>
            <h3 className="text-sm font-bold leading-tight" style={{ color: '#e2e8f0' }}>
              {tool.name}
            </h3>
            <p className="text-xs mt-0.5" style={{ color: tool.domainColor }}>
              Domain {tool.domainId}
            </p>
          </div>
        </div>

        {/* Description */}
        <p className="text-xs leading-relaxed flex-1" style={{ color: '#94a3b8' }}>
          {tool.description}
        </p>

        {/* Tags */}
        <div className="flex flex-wrap gap-1.5">
          {tool.tags.map((tag) => (
            <span
              key={tag}
              className="px-2 py-0.5 rounded-md text-xs"
              style={{ background: '#111827', border: '1px solid #1e2d4a', color: '#64748b' }}
            >
              {tag}
            </span>
          ))}
        </div>

        {/* Difficulty + Launch */}
        <div className="flex items-center justify-between pt-1">
          <span
            className="px-2 py-0.5 rounded-md text-xs font-semibold"
            style={{ background: diff.bg, color: diff.color }}
          >
            {tool.difficulty}
          </span>

          <Link href={tool.href}>
            <Button
              size="sm"
              className="gap-1.5 text-xs font-bold"
              style={{ background: tool.domainColor, color: '#080c14' }}
            >
              Launch
              <ExternalLink size={12} />
            </Button>
          </Link>
        </div>
      </div>
    </motion.div>
  );
}

// ─── Main Page ────────────────────────────────────────────────────────────

export default function ToolsHubPage() {
  const [domainFilter, setDomainFilter] = useState(0);
  const [usedTools] = useState<Set<string>>(() => {
    if (typeof window === 'undefined') return new Set();
    try {
      const stored = localStorage.getItem('cissp-used-tools');
      return new Set(stored ? JSON.parse(stored) : []);
    } catch {
      return new Set();
    }
  });

  const filtered = domainFilter === 0
    ? TOOLS
    : TOOLS.filter((t) => t.domainId === domainFilter);

  return (
    <div className="min-h-screen" style={{ background: '#080c14' }}>
      <div className="max-w-5xl mx-auto px-4 py-10 space-y-8">

        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
        >
          <h1 className="text-3xl font-black tracking-tight" style={{ color: '#e2e8f0' }}>
            Interactive Tools
          </h1>
          <p className="mt-2 text-sm" style={{ color: '#64748b' }}>
            Hands-on labs for the concepts that matter most on the CISSP exam.
            Each tool teaches by doing — not by reading.
          </p>
        </motion.div>

        {/* Domain filter tabs */}
        <div className="flex flex-wrap gap-2">
          {DOMAIN_FILTERS.map((f) => (
            <button
              key={f.id}
              className="px-3 py-1.5 rounded-xl text-xs font-semibold transition-all"
              style={{
                background: domainFilter === f.id ? '#00e8ff22' : '#111827',
                border: `1px solid ${domainFilter === f.id ? '#00e8ff' : '#1e2d4a'}`,
                color: domainFilter === f.id ? '#00e8ff' : '#64748b',
              }}
              onClick={() => setDomainFilter(f.id)}
            >
              {f.label}
            </button>
          ))}
        </div>

        {/* Progress note */}
        {usedTools.size > 0 && (
          <motion.div
            className="flex items-center gap-2 text-xs"
            style={{ color: '#64748b' }}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
          >
            <CheckCircle size={13} style={{ color: '#22c55e' }} />
            {usedTools.size} of {TOOLS.length} tools used
          </motion.div>
        )}

        {/* Tool grid */}
        <motion.div
          className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4"
          layout
        >
          <AnimatePresence mode="popLayout">
            {filtered.map((tool, i) => (
              <motion.div
                key={tool.id}
                layout
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.95 }}
                transition={{ duration: 0.2, delay: i * 0.05 }}
              >
                <ToolCard tool={tool} used={usedTools.has(tool.id)} />
              </motion.div>
            ))}
          </AnimatePresence>
        </motion.div>

        {/* Empty state */}
        {filtered.length === 0 && (
          <div className="text-center py-16">
            <p className="text-3xl mb-3">🔧</p>
            <p style={{ color: '#64748b' }}>No tools for this domain yet. More coming soon.</p>
          </div>
        )}
      </div>
    </div>
  );
}
