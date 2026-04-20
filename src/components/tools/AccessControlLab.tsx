'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs';
import { Brain, AlertTriangle, CheckCircle } from 'lucide-react';

// ─── Types ────────────────────────────────────────────────────────────────

type Permission = 'None' | 'R' | 'W' | 'RW' | 'RWX';
type ACMode = 'dac' | 'mac' | 'rbac';
type Classification = 'TS' | 'S' | 'C' | 'U';

interface MACLabel {
  subject: Classification;
  object: Classification;
}

// ─── Constants ────────────────────────────────────────────────────────────

const SUBJECTS = ['Admin', 'Developer', 'Auditor', 'HR Manager', 'Contractor'] as const;
const OBJECTS  = ['Financial DB', 'Source Code', 'Audit Logs', 'HR Records', 'Public Site'] as const;

const PERMS: Permission[] = ['None', 'R', 'W', 'RW', 'RWX'];

const CLASS_LEVELS: Record<Classification, number> = { TS: 3, S: 2, C: 1, U: 0 };
const CLASS_LABELS: Record<Classification, { label: string; color: string }> = {
  TS: { label: 'Top Secret',    color: '#ef4444' },
  S:  { label: 'Secret',        color: '#f97316' },
  C:  { label: 'Confidential',  color: '#eab308' },
  U:  { label: 'Unclassified',  color: '#22c55e' },
};

const RBAC_DEFAULTS: Record<string, Record<string, Permission>> = {
  Admin:       { 'Financial DB': 'RWX', 'Source Code': 'RWX', 'Audit Logs': 'RWX', 'HR Records': 'RWX', 'Public Site': 'RWX' },
  Developer:   { 'Financial DB': 'R',   'Source Code': 'RWX', 'Audit Logs': 'R',   'HR Records': 'None','Public Site': 'RW'  },
  Auditor:     { 'Financial DB': 'R',   'Source Code': 'R',   'Audit Logs': 'R',   'HR Records': 'R',  'Public Site': 'R'   },
  'HR Manager':{ 'Financial DB': 'None','Source Code': 'None','Audit Logs': 'R',   'HR Records': 'RW', 'Public Site': 'None'},
  Contractor:  { 'Financial DB': 'None','Source Code': 'R',   'Audit Logs': 'None','HR Records': 'None','Public Site': 'R'   },
};

const DEFAULT_MAC_SUBJECT: Record<string, Classification> = {
  Admin: 'TS', Developer: 'S', Auditor: 'S', 'HR Manager': 'C', Contractor: 'U',
};
const DEFAULT_MAC_OBJECT: Record<string, Classification> = {
  'Financial DB': 'S', 'Source Code': 'C', 'Audit Logs': 'S', 'HR Records': 'C', 'Public Site': 'U',
};

// ─── Helper: Build initial DAC matrix ────────────────────────────────────

function buildInitialMatrix(): Permission[][] {
  return SUBJECTS.map(() => OBJECTS.map(() => 'None' as Permission));
}

// ─── Bell-LaPadula check ──────────────────────────────────────────────────

function checkBLP(
  action: 'read' | 'write',
  sClass: Classification,
  oClass: Classification,
): { allowed: boolean; violation: string | null } {
  const sLevel = CLASS_LEVELS[sClass];
  const oLevel = CLASS_LEVELS[oClass];

  if (action === 'read' && sLevel < oLevel) {
    return { allowed: false, violation: `No Read Up (NRU): ${sClass} subject cannot read ${oClass} object` };
  }
  if (action === 'write' && sLevel > oLevel) {
    return { allowed: false, violation: `No Write Down (NWD): ${sClass} subject cannot write to ${oClass} object` };
  }
  return { allowed: true, violation: null };
}

// ─── Permission Cycle Button ──────────────────────────────────────────────

function PermCell({
  perm,
  onChange,
  disabled,
  violation,
}: {
  perm: Permission;
  onChange: (p: Permission) => void;
  disabled: boolean;
  violation?: string | null;
}) {
  const cycle = () => {
    if (disabled) return;
    const idx = PERMS.indexOf(perm);
    onChange(PERMS[(idx + 1) % PERMS.length]);
  };

  const colors: Record<Permission, { bg: string; color: string }> = {
    None: { bg: '#1e2d4a', color: '#475569' },
    R:    { bg: 'rgba(0,232,255,0.12)', color: '#00e8ff' },
    W:    { bg: 'rgba(234,179,8,0.12)', color: '#eab308' },
    RW:   { bg: 'rgba(34,197,94,0.12)', color: '#22c55e' },
    RWX:  { bg: 'rgba(239,68,68,0.12)', color: '#ef4444' },
  };

  const c = colors[perm];

  return (
    <motion.button
      className="w-full h-9 rounded-lg text-xs font-bold transition-all relative"
      style={{
        background: violation ? 'rgba(239,68,68,0.2)' : c.bg,
        color: violation ? '#ef4444' : c.color,
        border: `1px solid ${violation ? '#ef4444' : c.bg}`,
        cursor: disabled ? 'not-allowed' : 'pointer',
      }}
      onClick={cycle}
      whileTap={disabled ? {} : { scale: 0.92 }}
      animate={violation ? { x: [0, -4, 4, -3, 3, 0] } : {}}
      transition={{ duration: 0.3 }}
      title={violation ?? undefined}
    >
      {perm === 'None' ? '—' : perm}
    </motion.button>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function AccessControlLab() {
  const [mode, setMode] = useState<ACMode>('dac');
  const [dacMatrix, setDacMatrix] = useState<Permission[][]>(buildInitialMatrix);
  const [macSubjectLabels, setMacSubjectLabels] = useState<Record<string, Classification>>({ ...DEFAULT_MAC_SUBJECT });
  const [macObjectLabels, setMacObjectLabels] = useState<Record<string, Classification>>({ ...DEFAULT_MAC_OBJECT });
  const [violation, setViolation] = useState<string | null>(null);
  const [lastAction, setLastAction] = useState<{ si: number; oi: number } | null>(null);

  const setDacPerm = (si: number, oi: number, perm: Permission) => {
    setDacMatrix((m) => {
      const next = m.map((row) => [...row]);
      next[si][oi] = perm;
      return next;
    });
  };

  const handleMacAttempt = (si: number, oi: number, action: 'read' | 'write') => {
    const sClass = macSubjectLabels[SUBJECTS[si]];
    const oClass = macObjectLabels[OBJECTS[oi]];
    const result = checkBLP(action, sClass, oClass);
    setLastAction({ si, oi });
    if (!result.allowed) {
      setViolation(result.violation);
      setTimeout(() => setViolation(null), 3000);
    } else {
      setViolation(null);
    }
  };

  // Infer RBAC permissions (read-only demonstration)
  const getRbacPerm = (si: number, oi: number): Permission =>
    (RBAC_DEFAULTS[SUBJECTS[si]]?.[OBJECTS[oi]] as Permission) ?? 'None';

  return (
    <div
      className="rounded-2xl overflow-hidden w-full max-w-3xl mx-auto"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-6 pt-6 pb-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Access Control Lab</h2>
            <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>
              Interactive matrix — click cells to toggle permissions
            </p>
          </div>
          <span
            className="px-2.5 py-1 rounded-lg text-xs font-bold whitespace-nowrap"
            style={{ background: 'rgba(6,182,212,0.12)', color: '#06b6d4', border: '1px solid #06b6d444' }}
          >
            Domain 5 — IAM
          </span>
        </div>
      </div>

      {/* Mode tabs */}
      <div className="px-6 pt-4">
        <Tabs value={mode} onValueChange={(v) => setMode(v as ACMode)}>
          <TabsList>
            <TabsTrigger value="dac">DAC (Discretionary)</TabsTrigger>
            <TabsTrigger value="mac">MAC (Mandatory)</TabsTrigger>
            <TabsTrigger value="rbac">RBAC (Role-Based)</TabsTrigger>
          </TabsList>

          {/* Mode explanation */}
          <div className="mt-3 rounded-xl px-4 py-3" style={{ background: '#111827' }}>
            {mode === 'dac' && (
              <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                <strong style={{ color: '#e2e8f0' }}>DAC:</strong> Object owners control who can access their data.
                Click any cell to cycle permissions: None → R → W → RW → RWX.
              </p>
            )}
            {mode === 'mac' && (
              <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                <strong style={{ color: '#e2e8f0' }}>MAC + Bell-LaPadula:</strong> System enforces labels.
                Adjust subject/object classifications, then test Read/Write actions. Violations flash red.
              </p>
            )}
            {mode === 'rbac' && (
              <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
                <strong style={{ color: '#e2e8f0' }}>RBAC:</strong> Access granted by role membership, not individual identity.
                Permissions shown are preset by organizational policy and read-only.
              </p>
            )}
          </div>

          {/* Violation alert */}
          <AnimatePresence>
            {violation && (
              <motion.div
                className="mt-3 flex items-start gap-3 rounded-xl p-3"
                style={{ background: 'rgba(239,68,68,0.1)', border: '1px solid #ef444433' }}
                initial={{ opacity: 0, y: -6 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -6 }}
              >
                <AlertTriangle size={15} className="shrink-0 mt-0.5" style={{ color: '#ef4444' }} />
                <p className="text-xs font-semibold" style={{ color: '#ef4444' }}>
                  Violation: {violation}
                </p>
              </motion.div>
            )}
          </AnimatePresence>

          {/* ── DAC Tab ── */}
          <TabsContent value="dac">
            <div className="mt-4 overflow-x-auto">
              <table className="w-full text-xs">
                <thead>
                  <tr>
                    <th className="pb-2 text-left" style={{ color: '#64748b', width: 100 }}>Subject \ Object</th>
                    {OBJECTS.map((o) => (
                      <th key={o} className="pb-2 text-center px-1" style={{ color: '#94a3b8' }}>
                        {o}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {SUBJECTS.map((s, si) => (
                    <tr key={s}>
                      <td className="py-1 pr-2 font-semibold" style={{ color: '#e2e8f0' }}>{s}</td>
                      {OBJECTS.map((_, oi) => (
                        <td key={oi} className="py-1 px-1">
                          <PermCell
                            perm={dacMatrix[si][oi]}
                            onChange={(p) => setDacPerm(si, oi, p)}
                            disabled={false}
                          />
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </TabsContent>

          {/* ── MAC Tab ── */}
          <TabsContent value="mac">
            <div className="mt-4 space-y-4">
              {/* Label editors */}
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <p className="text-xs font-bold mb-2" style={{ color: '#94a3b8' }}>Subject Labels</p>
                  <div className="space-y-1.5">
                    {SUBJECTS.map((s) => (
                      <div key={s} className="flex items-center justify-between gap-2">
                        <span className="text-xs" style={{ color: '#e2e8f0' }}>{s}</span>
                        <select
                          className="text-xs rounded-lg px-2 py-1 outline-none"
                          style={{ background: '#111827', border: '1px solid #1e2d4a', color: CLASS_LABELS[macSubjectLabels[s]].color }}
                          value={macSubjectLabels[s]}
                          onChange={(e) =>
                            setMacSubjectLabels((prev) => ({ ...prev, [s]: e.target.value as Classification }))
                          }
                        >
                          {(['TS', 'S', 'C', 'U'] as Classification[]).map((c) => (
                            <option key={c} value={c}>{CLASS_LABELS[c].label}</option>
                          ))}
                        </select>
                      </div>
                    ))}
                  </div>
                </div>
                <div>
                  <p className="text-xs font-bold mb-2" style={{ color: '#94a3b8' }}>Object Labels</p>
                  <div className="space-y-1.5">
                    {OBJECTS.map((o) => (
                      <div key={o} className="flex items-center justify-between gap-2">
                        <span className="text-xs" style={{ color: '#e2e8f0' }}>{o}</span>
                        <select
                          className="text-xs rounded-lg px-2 py-1 outline-none"
                          style={{ background: '#111827', border: '1px solid #1e2d4a', color: CLASS_LABELS[macObjectLabels[o]].color }}
                          value={macObjectLabels[o]}
                          onChange={(e) =>
                            setMacObjectLabels((prev) => ({ ...prev, [o]: e.target.value as Classification }))
                          }
                        >
                          {(['TS', 'S', 'C', 'U'] as Classification[]).map((c) => (
                            <option key={c} value={c}>{CLASS_LABELS[c].label}</option>
                          ))}
                        </select>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* Test matrix */}
              <div>
                <p className="text-xs font-bold mb-2" style={{ color: '#94a3b8' }}>Test Access (Read / Write)</p>
                <div className="overflow-x-auto">
                  <table className="w-full text-xs">
                    <thead>
                      <tr>
                        <th className="pb-2 text-left" style={{ color: '#64748b', width: 100 }}>Subject</th>
                        {OBJECTS.map((o) => (
                          <th key={o} className="pb-2 text-center px-1" style={{ color: '#94a3b8' }}>{o}</th>
                        ))}
                      </tr>
                    </thead>
                    <tbody>
                      {SUBJECTS.map((s, si) => (
                        <tr key={s}>
                          <td className="py-1 pr-2">
                            <div style={{ color: '#e2e8f0' }} className="font-semibold">{s}</div>
                            <div style={{ color: CLASS_LABELS[macSubjectLabels[s]].color }} className="text-xs">
                              {CLASS_LABELS[macSubjectLabels[s]].label}
                            </div>
                          </td>
                          {OBJECTS.map((o, oi) => {
                            const sC = macSubjectLabels[s];
                            const oC = macObjectLabels[o];
                            const rCheck = checkBLP('read', sC, oC);
                            const wCheck = checkBLP('write', sC, oC);
                            return (
                              <td key={oi} className="py-1 px-1">
                                <div className="flex flex-col gap-1">
                                  <button
                                    className="rounded-md px-1 py-0.5 text-center font-bold transition-colors"
                                    style={{
                                      background: rCheck.allowed ? 'rgba(34,197,94,0.12)' : 'rgba(239,68,68,0.12)',
                                      color: rCheck.allowed ? '#22c55e' : '#ef4444',
                                      border: `1px solid ${rCheck.allowed ? '#22c55e44' : '#ef444444'}`,
                                      fontSize: 10,
                                    }}
                                    onClick={() => handleMacAttempt(si, oi, 'read')}
                                  >
                                    R
                                  </button>
                                  <button
                                    className="rounded-md px-1 py-0.5 text-center font-bold transition-colors"
                                    style={{
                                      background: wCheck.allowed ? 'rgba(34,197,94,0.12)' : 'rgba(239,68,68,0.12)',
                                      color: wCheck.allowed ? '#22c55e' : '#ef4444',
                                      border: `1px solid ${wCheck.allowed ? '#22c55e44' : '#ef444444'}`,
                                      fontSize: 10,
                                    }}
                                    onClick={() => handleMacAttempt(si, oi, 'write')}
                                  >
                                    W
                                  </button>
                                </div>
                              </td>
                            );
                          })}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </TabsContent>

          {/* ── RBAC Tab ── */}
          <TabsContent value="rbac">
            <div className="mt-4 overflow-x-auto">
              <table className="w-full text-xs">
                <thead>
                  <tr>
                    <th className="pb-2 text-left" style={{ color: '#64748b', width: 100 }}>Role</th>
                    {OBJECTS.map((o) => (
                      <th key={o} className="pb-2 text-center px-1" style={{ color: '#94a3b8' }}>{o}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {SUBJECTS.map((s, si) => (
                    <tr key={s}>
                      <td className="py-1 pr-2 font-semibold" style={{ color: '#e2e8f0' }}>{s}</td>
                      {OBJECTS.map((_, oi) => (
                        <td key={oi} className="py-1 px-1">
                          <PermCell
                            perm={getRbacPerm(si, oi)}
                            onChange={() => {}}
                            disabled={true}
                          />
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <p className="text-xs mt-3" style={{ color: '#475569' }}>
              In RBAC, permissions are assigned to roles, not individuals. Users inherit permissions through role membership.
            </p>
          </TabsContent>
        </Tabs>
      </div>

      {/* Memory hack */}
      <div className="px-6 pb-6 pt-4">
        <div
          className="flex gap-3 rounded-xl p-4"
          style={{ background: 'rgba(0,232,255,0.05)', borderLeft: '3px solid #00e8ff' }}
        >
          <Brain size={16} className="shrink-0 mt-0.5" style={{ color: '#00e8ff' }} />
          <div>
            <p className="text-xs font-bold uppercase tracking-wider mb-1" style={{ color: '#00e8ff' }}>
              Memory Hack — Bell-LaPadula
            </p>
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              <strong style={{ color: '#e2e8f0' }}>No Read Up (NRU), No Write Down (NWD).</strong> Think: a Secret-cleared analyst
              cannot READ a Top Secret briefing (read up = violation), but CAN write a report to the President
              (write to higher classification = fine). Writing DOWN to unclassified would leak the secret.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
