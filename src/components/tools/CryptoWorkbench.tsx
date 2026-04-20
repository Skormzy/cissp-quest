'use client';

import { useState, useEffect, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Brain, Lock, Unlock, Key, ArrowRight, ArrowLeftRight } from 'lucide-react';
import { Button } from '@/components/ui/button';

// ─── Types ────────────────────────────────────────────────────────────────

type Algorithm = 'caesar' | 'rot13' | 'xor' | 'rsa';
type SymMode = 'symmetric' | 'asymmetric';
type Direction = 'encrypt' | 'decrypt';

// ─── Cipher implementations (visual / educational only) ──────────────────

function caesarShift(text: string, shift: number): string {
  return text.replace(/[a-zA-Z]/g, (ch) => {
    const base = ch >= 'a' ? 97 : 65;
    return String.fromCharCode(((ch.charCodeAt(0) - base + shift) % 26) + base);
  });
}

function rot13(text: string): string {
  return caesarShift(text, 13);
}

function xorCipher(text: string, key = 42): string {
  return Array.from(text)
    .map((c) => String.fromCharCode(c.charCodeAt(0) ^ key))
    .join('');
}

function mockRsa(text: string, dir: Direction): string {
  if (dir === 'encrypt') return `[RSA-CIPHER: ${btoa(text.slice(0, 20)).slice(0, 28)}…]`;
  return text.startsWith('[RSA-CIPHER:') ? atob(text.slice(12, 40).trim()) : text;
}

// ─── Key strength config ──────────────────────────────────────────────────

const ALGO_CONFIG: Record<Algorithm, {
  label: string;
  keyStrength: number;
  keyBits: string;
  color: string;
  description: string;
}> = {
  caesar:  { label: 'Caesar Cipher',  keyStrength: 5,   keyBits: '~5 bits',   color: '#ef4444', description: 'Shift each letter by N positions. Trivially breakable — only 26 possible keys.' },
  rot13:   { label: 'ROT13',          keyStrength: 5,   keyBits: 'Fixed key',  color: '#ef4444', description: 'Special case of Caesar with shift=13. Symmetric: applying twice returns original.' },
  xor:     { label: 'XOR (8-bit)',    keyStrength: 40,  keyBits: '8 bits',    color: '#eab308', description: 'XOR each byte with a key byte. Basis of modern stream ciphers (but this demo is insecure).' },
  rsa:     { label: 'RSA (Concept)',  keyStrength: 95,  keyBits: '2048 bits', color: '#22c55e', description: 'Asymmetric cipher. Public key encrypts; private key decrypts. Foundation of HTTPS/TLS.' },
};

// ─── Animated cipher chars ────────────────────────────────────────────────

function CipherReveal({ text, delay = 0 }: { text: string; delay?: number }) {
  return (
    <span>
      {Array.from(text).map((ch, i) => (
        <motion.span
          key={i}
          initial={{ opacity: 0, y: -4 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: delay + i * 0.015, duration: 0.15 }}
          style={{ color: '#00e8ff', fontFamily: 'monospace' }}
        >
          {ch}
        </motion.span>
      ))}
    </span>
  );
}

// ─── Key Diagram: Symmetric ───────────────────────────────────────────────

function SymmetricDiagram() {
  return (
    <div className="flex items-center justify-center gap-4 py-4">
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(234,179,8,0.15)', border: '1px solid #eab30844' }}>
          <span className="text-xl">📄</span>
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Plaintext</span>
      </div>
      <div className="flex flex-col items-center gap-1">
        <ArrowRight size={20} style={{ color: '#eab308' }} />
        <div className="flex items-center gap-1">
          <Key size={12} style={{ color: '#ffd700' }} />
          <span className="text-xs font-bold" style={{ color: '#ffd700' }}>Same Key</span>
        </div>
      </div>
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(0,232,255,0.15)', border: '1px solid #00e8ff44' }}>
          <Lock size={18} style={{ color: '#00e8ff' }} />
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Ciphertext</span>
      </div>
      <div className="flex flex-col items-center gap-1">
        <ArrowRight size={20} style={{ color: '#eab308' }} />
        <div className="flex items-center gap-1">
          <Key size={12} style={{ color: '#ffd700' }} />
          <span className="text-xs font-bold" style={{ color: '#ffd700' }}>Same Key</span>
        </div>
      </div>
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(234,179,8,0.15)', border: '1px solid #eab30844' }}>
          <span className="text-xl">📄</span>
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Plaintext</span>
      </div>
    </div>
  );
}

// ─── Key Diagram: Asymmetric ──────────────────────────────────────────────

function AsymmetricDiagram() {
  return (
    <div className="flex items-center justify-center gap-3 py-4 flex-wrap">
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(234,179,8,0.15)', border: '1px solid #eab30844' }}>
          <span className="text-xl">📄</span>
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Plaintext</span>
      </div>
      <div className="flex flex-col items-center gap-1">
        <ArrowRight size={20} style={{ color: '#ffd700' }} />
        <div className="flex items-center gap-1">
          <Key size={12} style={{ color: '#ffd700' }} />
          <span className="text-xs font-bold" style={{ color: '#ffd700' }}>Public Key</span>
        </div>
      </div>
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(0,232,255,0.15)', border: '1px solid #00e8ff44' }}>
          <Lock size={18} style={{ color: '#00e8ff' }} />
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Ciphertext</span>
      </div>
      <div className="flex flex-col items-center gap-1">
        <ArrowRight size={20} style={{ color: '#ef4444' }} />
        <div className="flex items-center gap-1">
          <Key size={12} style={{ color: '#ef4444' }} />
          <span className="text-xs font-bold" style={{ color: '#ef4444' }}>Private Key</span>
        </div>
      </div>
      <div className="flex flex-col items-center gap-1">
        <div className="w-10 h-10 rounded-xl flex items-center justify-center" style={{ background: 'rgba(234,179,8,0.15)', border: '1px solid #eab30844' }}>
          <span className="text-xl">📄</span>
        </div>
        <span className="text-xs" style={{ color: '#64748b' }}>Plaintext</span>
      </div>
    </div>
  );
}

// ─── Main Component ───────────────────────────────────────────────────────

export default function CryptoWorkbench() {
  const [algo, setAlgo] = useState<Algorithm>('caesar');
  const [input, setInput] = useState('Hello World');
  const [output, setOutput] = useState('');
  const [direction, setDirection] = useState<Direction>('encrypt');
  const [caesarShiftVal, setCaesarShiftVal] = useState(3);
  const [symMode, setSymMode] = useState<SymMode>('symmetric');
  const [animKey, setAnimKey] = useState(0);

  const cfg = ALGO_CONFIG[algo];

  const compute = useCallback(() => {
    const text = input.slice(0, 100);
    let result = '';
    if (algo === 'caesar') {
      const shift = direction === 'encrypt' ? caesarShiftVal : 26 - caesarShiftVal;
      result = caesarShift(text, shift);
    } else if (algo === 'rot13') {
      result = rot13(text); // self-inverse
    } else if (algo === 'xor') {
      result = xorCipher(text); // self-inverse with fixed key=42
    } else {
      result = mockRsa(text, direction);
    }
    setOutput(result);
    setAnimKey((k) => k + 1);
  }, [algo, input, direction, caesarShiftVal]);

  useEffect(() => { compute(); }, [compute]);

  return (
    <div
      className="rounded-2xl overflow-hidden w-full max-w-2xl mx-auto"
      style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
    >
      {/* Header */}
      <div className="px-6 pt-6 pb-4 border-b" style={{ borderColor: '#1e2d4a' }}>
        <div className="flex items-start justify-between gap-4">
          <div>
            <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Crypto Workbench</h2>
            <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>
              Visual encryption demonstration (educational only, no real crypto)
            </p>
          </div>
          <span
            className="px-2.5 py-1 rounded-lg text-xs font-bold whitespace-nowrap"
            style={{ background: 'rgba(234,179,8,0.12)', color: '#eab308', border: '1px solid #eab30844' }}
          >
            Domain 3 — Crypto
          </span>
        </div>
      </div>

      <div className="px-6 pt-5 space-y-5">
        {/* Algorithm selector */}
        <div>
          <p className="text-xs font-bold uppercase tracking-wider mb-2" style={{ color: '#64748b' }}>Algorithm</p>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
            {(Object.keys(ALGO_CONFIG) as Algorithm[]).map((a) => (
              <button
                key={a}
                className="rounded-xl px-3 py-2.5 text-xs font-bold text-center transition-all"
                style={{
                  background: algo === a ? `${ALGO_CONFIG[a].color}22` : '#111827',
                  border: `1px solid ${algo === a ? ALGO_CONFIG[a].color : '#1e2d4a'}`,
                  color: algo === a ? ALGO_CONFIG[a].color : '#64748b',
                }}
                onClick={() => setAlgo(a)}
              >
                {ALGO_CONFIG[a].label}
              </button>
            ))}
          </div>
          <p className="text-xs mt-2 leading-relaxed" style={{ color: '#475569' }}>{cfg.description}</p>
        </div>

        {/* Key strength meter */}
        <div>
          <div className="flex items-center justify-between mb-1">
            <span className="text-xs" style={{ color: '#64748b' }}>Key Strength</span>
            <span className="text-xs font-mono font-bold" style={{ color: cfg.color }}>{cfg.keyBits}</span>
          </div>
          <div className="h-2 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
            <motion.div
              className="h-full rounded-full"
              style={{ background: `linear-gradient(90deg, #ef4444, #eab308, #22c55e)` }}
              animate={{ width: `${cfg.keyStrength}%` }}
              transition={{ duration: 0.4 }}
            />
          </div>
        </div>

        {/* Caesar shift (only for caesar) */}
        {algo === 'caesar' && (
          <div>
            <label className="text-xs font-semibold" style={{ color: '#e2e8f0' }}>
              Shift Value: <span style={{ color: '#00e8ff' }}>{caesarShiftVal}</span>
            </label>
            <input
              type="range"
              min={1}
              max={25}
              value={caesarShiftVal}
              onChange={(e) => setCaesarShiftVal(Number(e.target.value))}
              className="w-full mt-1 accent-cyan-400"
            />
          </div>
        )}

        {/* Symmetric / Asymmetric toggle (only for RSA) */}
        {algo === 'rsa' && (
          <div>
            <p className="text-xs font-bold uppercase tracking-wider mb-2" style={{ color: '#64748b' }}>Key Mechanism</p>
            <div className="flex gap-2">
              {(['symmetric', 'asymmetric'] as SymMode[]).map((m) => (
                <button
                  key={m}
                  className="flex-1 rounded-xl py-2 text-xs font-bold transition-all"
                  style={{
                    background: symMode === m ? 'rgba(0,232,255,0.12)' : '#111827',
                    border: `1px solid ${symMode === m ? '#00e8ff' : '#1e2d4a'}`,
                    color: symMode === m ? '#00e8ff' : '#64748b',
                  }}
                  onClick={() => setSymMode(m)}
                >
                  {m.charAt(0).toUpperCase() + m.slice(1)}
                </button>
              ))}
            </div>
            {symMode === 'symmetric' ? <SymmetricDiagram /> : <AsymmetricDiagram />}
          </div>
        )}

        {/* Direction */}
        <div className="flex gap-2">
          {(['encrypt', 'decrypt'] as Direction[]).map((d) => (
            <button
              key={d}
              className="flex-1 flex items-center justify-center gap-2 rounded-xl py-2.5 text-sm font-semibold transition-all"
              style={{
                background: direction === d ? 'rgba(0,232,255,0.12)' : '#111827',
                border: `1px solid ${direction === d ? '#00e8ff' : '#1e2d4a'}`,
                color: direction === d ? '#00e8ff' : '#64748b',
              }}
              onClick={() => setDirection(d)}
            >
              {d === 'encrypt' ? <Lock size={14} /> : <Unlock size={14} />}
              {d.charAt(0).toUpperCase() + d.slice(1)}
            </button>
          ))}
        </div>

        {/* Input */}
        <div>
          <label className="text-xs font-semibold block mb-1.5" style={{ color: '#94a3b8' }}>Input</label>
          <textarea
            className="w-full rounded-xl p-3 text-sm resize-none outline-none"
            style={{
              background: '#111827',
              border: '1px solid #1e2d4a',
              color: '#e2e8f0',
              fontFamily: 'monospace',
              minHeight: 64,
            }}
            maxLength={100}
            value={input}
            onChange={(e) => setInput(e.target.value)}
            placeholder="Type up to 100 characters…"
          />
        </div>

        {/* Output */}
        <div>
          <label className="text-xs font-semibold block mb-1.5" style={{ color: '#94a3b8' }}>
            Output <span style={{ color: '#475569' }}>(animated)</span>
          </label>
          <div
            className="w-full rounded-xl p-3 text-sm min-h-[64px] break-all"
            style={{
              background: '#111827',
              border: '1px solid #00e8ff33',
              fontFamily: 'monospace',
            }}
          >
            <CipherReveal key={animKey} text={output} />
          </div>
        </div>
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
              Memory Hack
            </p>
            <p className="text-xs leading-relaxed" style={{ color: '#94a3b8' }}>
              <strong style={{ color: '#e2e8f0' }}>Symmetric = Same key</strong> (think: "sym = same" — one golden key locks and unlocks).
              <strong style={{ color: '#e2e8f0' }}> Asymmetric = two keys</strong> (think: a couple — one public gold key anyone can use, one private red key only the owner holds).
              RSA is asymmetric. AES is symmetric. TLS uses both: asymmetric to exchange a symmetric session key.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
