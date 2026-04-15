'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { DOMAINS } from '@/lib/constants';

export default function CustomQuizBuilder() {
  const router = useRouter();

  // Form state
  const [selectedDomains, setSelectedDomains] = useState<number[]>([]);
  const [selectedDifficulties, setSelectedDifficulties] = useState<string[]>(['easy', 'medium', 'hard']);
  const [questionCount, setQuestionCount] = useState(10);
  const [source, setSource] = useState<'all' | 'new' | 'wrong'>('all');
  const [adaptiveMode, setAdaptiveMode] = useState(false);
  const [loading, setLoading] = useState(false);

  const toggleDomain = (id: number) => {
    setSelectedDomains((prev) =>
      prev.includes(id) ? prev.filter((d) => d !== id) : [...prev, id]
    );
  };

  const toggleDifficulty = (diff: string) => {
    setSelectedDifficulties((prev) => {
      if (prev.includes(diff)) {
        if (prev.length === 1) return prev; // must have at least one
        return prev.filter((d) => d !== diff);
      }
      return [...prev, diff];
    });
  };

  const selectAllDomains = () => {
    if (selectedDomains.length === 8) {
      setSelectedDomains([]);
    } else {
      setSelectedDomains(DOMAINS.map((d) => d.id));
    }
  };

  const handleStartQuiz = () => {
    setLoading(true);
    const params = new URLSearchParams();
    params.set('mode', 'custom');
    params.set('count', questionCount.toString());

    if (selectedDomains.length > 0 && selectedDomains.length < 8) {
      params.set('domains', selectedDomains.join(','));
    }

    if (selectedDifficulties.length > 0 && selectedDifficulties.length < 3) {
      params.set('difficulties', selectedDifficulties.join(','));
    }

    if (source !== 'all') {
      params.set('source', source);
    }

    if (adaptiveMode) {
      params.set('adaptive', 'true');
    }

    router.push(`/app/quiz?${params.toString()}`);
  };

  const diffColors: Record<string, string> = { easy: '#22c55e', medium: '#f59e0b', hard: '#ef4444' };
  const diffXp: Record<string, number> = { easy: 25, medium: 50, hard: 100 };

  const shortDomainNames: Record<number, string> = {
    1: 'Security & Risk Mgmt',
    2: 'Asset Security',
    3: 'Security Architecture',
    4: 'Comm & Network Security',
    5: 'IAM',
    6: 'Security Assessment',
    7: 'Security Operations',
    8: 'Software Dev Security',
  };

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Custom Quiz Builder</h1>
          <p className="text-sm" style={{ color: '#64748b' }}>Build your own quiz with custom filters</p>
        </div>
        <Link
          href="/app/dashboard"
          className="text-sm px-3 py-1.5 rounded-lg"
          style={{ border: '1px solid #1e2d4a', color: '#94a3b8' }}
        >
          Cancel
        </Link>
      </div>

      {/* Domain Selection */}
      <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-sm font-bold" style={{ color: '#94a3b8' }}>DOMAINS</h2>
          <button
            onClick={selectAllDomains}
            className="text-[10px] font-medium px-2 py-1 rounded"
            style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff' }}
          >
            {selectedDomains.length === 8 ? 'Deselect All' : 'Select All'}
          </button>
        </div>
        <p className="text-xs mb-4" style={{ color: '#64748b' }}>
          {selectedDomains.length === 0 ? 'All domains (none selected = all included)' : `${selectedDomains.length} domain${selectedDomains.length > 1 ? 's' : ''} selected`}
        </p>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
          {DOMAINS.map((domain) => {
            const isSelected = selectedDomains.includes(domain.id);
            return (
              <button
                key={domain.id}
                onClick={() => toggleDomain(domain.id)}
                className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-left transition-all"
                style={{
                  background: isSelected ? `${domain.color}15` : '#0d1220',
                  border: `1px solid ${isSelected ? domain.color : '#1e2d4a'}`,
                }}
              >
                <span className="text-lg">{domain.icon}</span>
                <div className="flex-1 min-w-0">
                  <div className="text-xs font-bold" style={{ color: isSelected ? domain.color : '#94a3b8' }}>
                    D{domain.id}: {shortDomainNames[domain.id]}
                  </div>
                  <div className="text-[10px]" style={{ color: '#64748b' }}>{domain.weight}</div>
                </div>
                <div
                  className="w-5 h-5 rounded-md flex items-center justify-center text-xs"
                  style={{
                    background: isSelected ? domain.color : 'transparent',
                    border: `2px solid ${isSelected ? domain.color : '#1e2d4a'}`,
                    color: isSelected ? '#080c14' : 'transparent',
                  }}
                >
                  {isSelected ? '✓' : ''}
                </div>
              </button>
            );
          })}
        </div>
      </div>

      {/* Difficulty Selection */}
      <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="text-sm font-bold mb-3" style={{ color: '#94a3b8' }}>DIFFICULTY</h2>
        <div className="grid grid-cols-3 gap-3">
          {(['easy', 'medium', 'hard'] as const).map((diff) => {
            const isSelected = selectedDifficulties.includes(diff);
            return (
              <button
                key={diff}
                onClick={() => toggleDifficulty(diff)}
                className="rounded-lg p-3 text-center transition-all"
                style={{
                  background: isSelected ? `${diffColors[diff]}15` : '#0d1220',
                  border: `2px solid ${isSelected ? diffColors[diff] : '#1e2d4a'}`,
                }}
              >
                <div className="text-sm font-bold capitalize mb-1" style={{ color: isSelected ? diffColors[diff] : '#64748b' }}>
                  {diff}
                </div>
                <div className="text-[10px]" style={{ color: '#64748b' }}>
                  +{diffXp[diff]} XP
                </div>
              </button>
            );
          })}
        </div>
      </div>

      {/* Question Count */}
      <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="text-sm font-bold mb-3" style={{ color: '#94a3b8' }}>QUESTION COUNT</h2>
        <div className="flex items-center gap-4">
          <div className="flex-1">
            <input
              type="range"
              min={5}
              max={50}
              step={5}
              value={questionCount}
              onChange={(e) => setQuestionCount(parseInt(e.target.value))}
              className="w-full accent-cyan-400"
            />
            <div className="flex justify-between mt-1">
              <span className="text-[10px]" style={{ color: '#64748b' }}>5</span>
              <span className="text-[10px]" style={{ color: '#64748b' }}>50</span>
            </div>
          </div>
          <span
            className="text-2xl font-bold font-mono w-14 text-center"
            style={{ color: '#00e8ff' }}
          >
            {questionCount}
          </span>
        </div>
      </div>

      {/* Source Filter */}
      <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h2 className="text-sm font-bold mb-3" style={{ color: '#94a3b8' }}>QUESTION SOURCE</h2>
        <div className="grid grid-cols-3 gap-3">
          {([
            { value: 'all', label: 'All Questions', desc: 'Random mix', icon: '🎲' },
            { value: 'new', label: 'New Only', desc: "Haven't seen", icon: '✨' },
            { value: 'wrong', label: 'Wrong Only', desc: 'Previously missed', icon: '❌' },
          ] as const).map((opt) => {
            const isSelected = source === opt.value;
            return (
              <button
                key={opt.value}
                onClick={() => setSource(opt.value)}
                className="rounded-lg p-3 text-center transition-all"
                style={{
                  background: isSelected ? 'rgba(0, 232, 255, 0.08)' : '#0d1220',
                  border: `2px solid ${isSelected ? '#00e8ff' : '#1e2d4a'}`,
                }}
              >
                <div className="text-lg mb-1">{opt.icon}</div>
                <div className="text-xs font-bold mb-0.5" style={{ color: isSelected ? '#00e8ff' : '#94a3b8' }}>
                  {opt.label}
                </div>
                <div className="text-[10px]" style={{ color: '#64748b' }}>{opt.desc}</div>
              </button>
            );
          })}
        </div>
      </div>

      {/* Adaptive Mode Toggle */}
      <div className="rounded-xl p-5" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-sm font-bold" style={{ color: '#94a3b8' }}>ADAPTIVE MODE (CAT)</h2>
            <p className="text-xs mt-1" style={{ color: '#64748b' }}>
              Questions adapt to your ability level using IRT. Harder when you answer correctly, easier when you don&apos;t.
            </p>
          </div>
          <button
            onClick={() => setAdaptiveMode(!adaptiveMode)}
            className="w-14 h-7 rounded-full relative transition-all flex-shrink-0 ml-4"
            style={{
              background: adaptiveMode ? '#00e8ff' : '#1e2d4a',
            }}
          >
            <div
              className="w-5 h-5 rounded-full absolute top-1 transition-all"
              style={{
                left: adaptiveMode ? '2rem' : '0.25rem',
                background: adaptiveMode ? '#080c14' : '#64748b',
              }}
            />
          </button>
        </div>
        {adaptiveMode && (
          <div className="mt-3 p-2 rounded-lg text-xs" style={{ background: 'rgba(0, 232, 255, 0.04)', color: '#00e8ff' }}>
            Adaptive mode ignores difficulty filters — the engine selects difficulty based on your performance.
          </div>
        )}
      </div>

      {/* Summary & Start */}
      <div className="rounded-xl p-5" style={{ background: 'linear-gradient(135deg, #111a2e, #1a2540)', border: '1px solid #00e8ff' }}>
        <div className="mb-4">
          <h3 className="text-sm font-bold" style={{ color: '#e2e8f0' }}>Quiz Summary</h3>
          <div className="flex flex-wrap gap-2 mt-2">
            <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: '#0d1220', color: '#00e8ff' }}>
              {questionCount} questions
            </span>
            <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: '#0d1220', color: '#94a3b8' }}>
              {selectedDomains.length === 0 ? 'All domains' : `${selectedDomains.length} domain${selectedDomains.length > 1 ? 's' : ''}`}
            </span>
            <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: '#0d1220', color: '#94a3b8' }}>
              {selectedDifficulties.join(', ')}
            </span>
            <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: '#0d1220', color: '#94a3b8' }}>
              {source === 'all' ? 'All questions' : source === 'new' ? 'New only' : 'Wrong only'}
            </span>
            {adaptiveMode && (
              <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff' }}>
                Adaptive (CAT)
              </span>
            )}
          </div>
        </div>

        <button
          onClick={handleStartQuiz}
          disabled={loading}
          className="w-full py-3 rounded-xl font-bold text-sm transition-all hover:opacity-90 disabled:opacity-50"
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          {loading ? 'Loading Quiz...' : 'Start Custom Quiz'}
        </button>
      </div>
    </div>
  );
}
