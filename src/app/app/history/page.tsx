'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { DOMAINS } from '@/lib/constants';

interface HistoryRecord {
  id: string;
  question_id: string;
  domain_id: number;
  difficulty: string;
  selected_answer: number;
  correct_answer: number;
  is_correct: boolean;
  time_spent_seconds: number;
  created_at: string;
  questions: {
    question_text: string;
    options: string[];
    library_topic_id: string | null;
  } | null;
}

export default function HistoryPage() {
  const { user } = useUserStore();
  const [records, setRecords] = useState<HistoryRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [domainFilter, setDomainFilter] = useState<number | 0>(0);
  const [difficultyFilter, setDifficultyFilter] = useState<string>('all');
  const [resultFilter, setResultFilter] = useState<string>('all');
  const [dateFilter, setDateFilter] = useState<string>('all');
  const supabase = createClient();

  useEffect(() => {
    if (!user) return;

    const loadHistory = async () => {
      const { data, error } = await supabase
        .from('user_question_history')
        .select('*, questions(question_text, options, library_topic_id)')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(500);

      if (data) {
        setRecords(data as HistoryRecord[]);
      }
      setLoading(false);
    };

    loadHistory();
  }, [user]);

  // Apply filters
  const filteredRecords = records.filter((r) => {
    if (domainFilter !== 0 && r.domain_id !== domainFilter) return false;
    if (difficultyFilter !== 'all' && r.difficulty !== difficultyFilter) return false;
    if (resultFilter === 'correct' && !r.is_correct) return false;
    if (resultFilter === 'wrong' && r.is_correct) return false;

    if (dateFilter !== 'all') {
      const recordDate = new Date(r.created_at);
      const now = new Date();
      if (dateFilter === 'today') {
        const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        if (recordDate < today) return false;
      } else if (dateFilter === 'week') {
        const weekAgo = new Date(now.getTime() - 7 * 86400000);
        if (recordDate < weekAgo) return false;
      } else if (dateFilter === 'month') {
        const monthAgo = new Date(now.getTime() - 30 * 86400000);
        if (recordDate < monthAgo) return false;
      }
    }

    return true;
  });

  // Stats
  const totalFiltered = filteredRecords.length;
  const correctFiltered = filteredRecords.filter((r) => r.is_correct).length;
  const accuracyFiltered = totalFiltered > 0 ? Math.round((correctFiltered / totalFiltered) * 100) : 0;

  const diffColors: Record<string, string> = { easy: '#22c55e', medium: '#f59e0b', hard: '#ef4444' };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Question History</h1>
        <p className="text-sm" style={{ color: '#64748b' }}>
          {records.length} questions answered &bull; {totalFiltered} shown
        </p>
      </div>

      {/* Summary Stats */}
      <div className="grid grid-cols-3 gap-3">
        <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-xl font-bold" style={{ color: '#e2e8f0' }}>{totalFiltered}</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>Questions</div>
        </div>
        <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-xl font-bold" style={{ color: '#22c55e' }}>{correctFiltered}</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>Correct</div>
        </div>
        <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-xl font-bold" style={{ color: '#00e8ff' }}>{accuracyFiltered}%</div>
          <div className="text-[10px]" style={{ color: '#64748b' }}>Accuracy</div>
        </div>
      </div>

      {/* Filters */}
      <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
          {/* Domain Filter */}
          <div>
            <label className="block text-[10px] font-bold mb-1" style={{ color: '#94a3b8' }}>DOMAIN</label>
            <select
              value={domainFilter}
              onChange={(e) => setDomainFilter(parseInt(e.target.value))}
              className="w-full px-3 py-2 rounded-lg text-xs outline-none"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
            >
              <option value={0}>All Domains</option>
              {DOMAINS.map((d) => (
                <option key={d.id} value={d.id}>{d.icon} D{d.id}: {d.name}</option>
              ))}
            </select>
          </div>

          {/* Difficulty Filter */}
          <div>
            <label className="block text-[10px] font-bold mb-1" style={{ color: '#94a3b8' }}>DIFFICULTY</label>
            <select
              value={difficultyFilter}
              onChange={(e) => setDifficultyFilter(e.target.value)}
              className="w-full px-3 py-2 rounded-lg text-xs outline-none"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
            >
              <option value="all">All</option>
              <option value="easy">Easy</option>
              <option value="medium">Medium</option>
              <option value="hard">Hard</option>
            </select>
          </div>

          {/* Result Filter */}
          <div>
            <label className="block text-[10px] font-bold mb-1" style={{ color: '#94a3b8' }}>RESULT</label>
            <select
              value={resultFilter}
              onChange={(e) => setResultFilter(e.target.value)}
              className="w-full px-3 py-2 rounded-lg text-xs outline-none"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
            >
              <option value="all">All</option>
              <option value="correct">Correct</option>
              <option value="wrong">Wrong</option>
            </select>
          </div>

          {/* Date Filter */}
          <div>
            <label className="block text-[10px] font-bold mb-1" style={{ color: '#94a3b8' }}>DATE RANGE</label>
            <select
              value={dateFilter}
              onChange={(e) => setDateFilter(e.target.value)}
              className="w-full px-3 py-2 rounded-lg text-xs outline-none"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
            >
              <option value="all">All Time</option>
              <option value="today">Today</option>
              <option value="week">Past 7 Days</option>
              <option value="month">Past 30 Days</option>
            </select>
          </div>
        </div>
      </div>

      {/* Records List */}
      {filteredRecords.length === 0 ? (
        <div className="text-center py-12">
          <div className="text-4xl mb-4">📋</div>
          <p style={{ color: '#64748b' }}>
            {records.length === 0 ? 'No question history yet. Take a quiz to get started!' : 'No questions match your filters.'}
          </p>
          {records.length === 0 && (
            <Link href="/app/quiz?mode=quick&count=10" className="inline-block mt-4 px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
              Take a Quiz
            </Link>
          )}
        </div>
      ) : (
        <div className="space-y-2">
          {filteredRecords.map((record) => {
            const domain = DOMAINS.find((d) => d.id === record.domain_id);
            const questionText = record.questions?.question_text || 'Question text unavailable';
            const options = record.questions?.options || [];
            const yourAnswer = options[record.selected_answer] || `Option ${String.fromCharCode(65 + record.selected_answer)}`;
            const correctAnswer = options[record.correct_answer] || `Option ${String.fromCharCode(65 + record.correct_answer)}`;
            const date = new Date(record.created_at);
            const dateStr = date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
            const timeStr = date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });

            return (
              <div
                key={record.id}
                className="rounded-xl p-4"
                style={{
                  background: '#111a2e',
                  borderLeft: `3px solid ${record.is_correct ? '#22c55e' : '#ef4444'}`,
                  border: '1px solid #1e2d4a',
                  borderLeftColor: record.is_correct ? '#22c55e' : '#ef4444',
                  borderLeftWidth: '3px',
                }}
              >
                {/* Top row: status, domain, difficulty, time */}
                <div className="flex items-center gap-2 mb-2 flex-wrap">
                  <span className="text-sm">{record.is_correct ? '✅' : '❌'}</span>
                  <span className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: `${domain?.color}22`, color: domain?.color }}>
                    {domain?.icon} D{record.domain_id}
                  </span>
                  <span className="text-[10px] px-2 py-0.5 rounded-full capitalize" style={{ background: `${diffColors[record.difficulty]}22`, color: diffColors[record.difficulty] }}>
                    {record.difficulty}
                  </span>
                  <span className="text-[10px] font-mono" style={{ color: '#64748b' }}>{record.time_spent_seconds}s</span>
                  <span className="ml-auto text-[10px]" style={{ color: '#64748b' }}>{dateStr} {timeStr}</span>
                </div>

                {/* Question text */}
                <p className="text-sm mb-2 wrap-break-word" style={{ color: '#e2e8f0', overflowWrap: 'anywhere' }}>{questionText}</p>

                {/* Answers */}
                <div className="flex flex-col gap-1 text-xs">
                  <div className="flex items-start gap-2">
                    <span className="shrink-0 font-bold" style={{ color: record.is_correct ? '#22c55e' : '#ef4444' }}>
                      Your answer:
                    </span>
                    <span style={{ color: record.is_correct ? '#22c55e' : '#ef4444' }}>
                      {String.fromCharCode(65 + record.selected_answer)}) {yourAnswer}
                    </span>
                  </div>
                  {!record.is_correct && (
                    <div className="flex items-start gap-2">
                      <span className="shrink-0 font-bold" style={{ color: '#22c55e' }}>
                        Correct:
                      </span>
                      <span style={{ color: '#22c55e' }}>
                        {String.fromCharCode(65 + record.correct_answer)}) {correctAnswer}
                      </span>
                    </div>
                  )}
                </div>

                {/* Library link */}
                {record.questions?.library_topic_id && !record.is_correct && (
                  <Link
                    href={`/app/library/${record.questions.library_topic_id}`}
                    className="inline-block mt-2 text-[10px] px-3 py-1.5 rounded-lg transition-all hover:scale-[1.01]"
                    style={{ background: 'rgba(0, 232, 255, 0.05)', border: '1px solid rgba(0, 232, 255, 0.2)', color: '#00e8ff' }}
                  >
                    📖 Study this concept →
                  </Link>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
