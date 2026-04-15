'use client';

import { useState, useEffect, useCallback, useRef, useMemo } from 'react';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { CATSession, CATConfig, CATResults, CATState } from '@/lib/cat-session';
import { IRTItem, thetaToPercentile } from '@/lib/irt-engine';
import { shuffleOptions } from '@/lib/cissp-question-rules';

// ─── Review Data (stored per question during quiz) ──────

export interface ReviewQuestionData {
  questionId: string;
  questionNumber: number;
  questionText: string;
  shuffledOptions: string[];
  selectedIndex: number;
  correctIndex: number;
  isCorrect: boolean;
  explanation: string;
  mnemonicHint: string | null;
  difficulty: number;       // IRT b parameter
  cognitiveLevel: string;
  responseTime: number;
}

// ─── Props ───────────────────────────────────────────────

interface CATQuizEngineProps {
  config: CATConfig;
  onPass: (results: CATResults) => void;
  onFail: (results: CATResults) => void;
}

// ─── Theme Colors ────────────────────────────────────────

const THEME_COLORS = {
  cyan: { accent: '#00e8ff', bg: 'rgba(0, 232, 255, 0.06)', border: '#00e8ff33' },
  gold: { accent: '#ffd700', bg: 'rgba(255, 215, 0, 0.06)', border: '#ffd70033' },
  red:  { accent: '#ef4444', bg: 'rgba(239, 68, 68, 0.06)', border: '#ef444433' },
};

// ─── Main Component ──────────────────────────────────────

export default function CATQuizEngine({ config, onPass, onFail }: CATQuizEngineProps) {
  const { user, updateXp } = useUserStore();
  const supabase = createClient();
  const theme = THEME_COLORS[config.theme];

  // Session state
  const sessionRef = useRef<CATSession | null>(null);
  const [catState, setCatState] = useState<CATState | null>(null);
  const [currentQuestion, setCurrentQuestion] = useState<IRTItem | null>(null);
  const [questionOptions, setQuestionOptions] = useState<string[]>([]);
  const [questionText, setQuestionText] = useState('');
  const [explanation, setExplanation] = useState('');
  const [mnemonicHint, setMnemonicHint] = useState<string | null>(null);
  const [correctIndex, setCorrectIndex] = useState(0);

  // UI state
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [showResult, setShowResult] = useState(false);
  const [finished, setFinished] = useState(false);
  const [results, setResults] = useState<CATResults | null>(null);
  const [showReview, setShowReview] = useState(true);
  const [displayQuestionNumber, setDisplayQuestionNumber] = useState(1);

  // Timer
  const [timeLeft, setTimeLeft] = useState(config.timeLimitMinutes * 60);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const questionStartRef = useRef(Date.now());

  // Review data (built up during quiz for results screen)
  const reviewDataRef = useRef<ReviewQuestionData[]>([]);

  // Question data cache (maps question ID to full question data from DB)
  const questionCacheRef = useRef<Map<string, {
    question_text: string;
    options: string[];
    correct_index: number;
    explanation: string;
    mnemonic_hint: string | null;
  }>>(new Map());

  // ── Load questions and start session ───────────────────
  useEffect(() => {
    const loadAndStart = async () => {
      try {
        let query = supabase
          .from('cat_questions')
          .select('*')
          .eq('is_active', true);

        if (config.domainFilter) {
          query = query.eq('domain_id', config.domainFilter);
        }

        // Overfetch to ensure good pool diversity
        query = query.limit(config.maxQuestions * 5);

        const { data, error: dbError } = await query;

        if (dbError) throw dbError;
        if (!data || data.length === 0) {
          setError('No questions available for this configuration. Questions need to be loaded into the database first.');
          setLoading(false);
          return;
        }

        // Map DB rows to IRTItems and cache full question data
        const items: IRTItem[] = data.map((row: Record<string, unknown>) => {
          // Cache the display data
          questionCacheRef.current.set(row.id as string, {
            question_text: row.question_text as string,
            options: row.options as string[],
            correct_index: row.correct_index as number,
            explanation: row.explanation as string,
            mnemonic_hint: (row.mnemonic_hint as string) || null,
          });

          return {
            id: row.id as string,
            a: row.irt_a as number,
            b: row.irt_b as number,
            c: row.irt_c as number,
            domain_id: row.domain_id as number,
            topic_cluster: row.topic_cluster as string,
            cognitive_level: row.cognitive_level as IRTItem['cognitive_level'],
            question_type: row.question_type as IRTItem['question_type'],
          };
        });

        // Create and start session
        const session = new CATSession(config);
        sessionRef.current = session;
        const firstItem = session.start(items);

        if (firstItem) {
          loadQuestionDisplay(firstItem, 1);
          setCatState(session.getState());
        } else {
          setError('Could not select an initial question.');
        }
      } catch {
        setError('Failed to load questions. Please try again.');
      } finally {
        setLoading(false);
      }
    };

    loadAndStart();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ── Timer ──────────────────────────────────────────────
  useEffect(() => {
    if (config.timeLimitMinutes === 0 || loading || finished) return;
    timerRef.current = setInterval(() => {
      setTimeLeft((prev) => {
        if (prev <= 1) {
          if (timerRef.current) clearInterval(timerRef.current);
          handleTimeUp();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [loading, finished]);

  // ── Load question display data ─────────────────────────
  const loadQuestionDisplay = useCallback((item: IRTItem, questionNum?: number) => {
    const cached = questionCacheRef.current.get(item.id);
    if (cached) {
      // Shuffle options so correct answer position is randomized
      const shuffled = shuffleOptions(cached.options, cached.correct_index);

      setCurrentQuestion(item);
      setQuestionText(cached.question_text);
      setQuestionOptions(shuffled.options);
      setCorrectIndex(shuffled.correctIndex);
      setExplanation(cached.explanation);
      setMnemonicHint(cached.mnemonic_hint);
      setSelectedIndex(null);
      setShowResult(false);
      if (questionNum !== undefined) {
        setDisplayQuestionNumber(questionNum);
      }
      questionStartRef.current = Date.now();
    }
  }, []);

  // ── Handle answer selection ────────────────────────────
  const handleSelect = useCallback(async (index: number) => {
    if (showResult || selectedIndex !== null || !sessionRef.current || !currentQuestion) return;

    const isCorrect = index === correctIndex;
    const responseTime = (Date.now() - questionStartRef.current) / 1000;

    setSelectedIndex(index);
    setShowResult(true);

    // Store review data for this question
    reviewDataRef.current.push({
      questionId: currentQuestion.id,
      questionNumber: displayQuestionNumber,
      questionText,
      shuffledOptions: [...questionOptions],
      selectedIndex: index,
      correctIndex,
      isCorrect,
      explanation,
      mnemonicHint: mnemonicHint,
      difficulty: currentQuestion.b,
      cognitiveLevel: currentQuestion.cognitive_level,
      responseTime,
    });

    // Process answer in CAT session
    const nextItem = sessionRef.current.answer(isCorrect ? 1 : 0, responseTime);
    const newState = sessionRef.current.getState();
    setCatState(newState);

    // Save to DB
    if (user) {
      await supabase.from('question_performance').insert({
        question_id: currentQuestion.id,
        user_id: user.id,
        response: isCorrect ? 1 : 0,
        response_time_seconds: responseTime,
        theta_at_response: newState.theta,
        se_at_response: newState.se,
        question_number: newState.totalQuestions,
      });
    }

    // Check if session is done
    if (!nextItem || newState.status === 'finished') {
      // Session complete — will finish when user clicks Next
      if (!nextItem) {
        setTimeout(() => finishSession(), 100);
      }
    }
  }, [showResult, selectedIndex, currentQuestion, correctIndex, user, supabase, displayQuestionNumber, questionText, questionOptions, explanation, mnemonicHint]);

  // ── Handle next question ───────────────────────────────
  const handleNext = useCallback(() => {
    if (!sessionRef.current) return;
    const state = sessionRef.current.getState();

    if (state.status === 'finished' || !state.currentQuestion) {
      finishSession();
    } else {
      loadQuestionDisplay(state.currentQuestion, displayQuestionNumber + 1);
      setCatState(state);
    }
  }, [loadQuestionDisplay, displayQuestionNumber]);

  // ── Finish session ─────────────────────────────────────
  const finishSession = useCallback(async () => {
    if (!sessionRef.current) return;
    if (timerRef.current) clearInterval(timerRef.current);

    sessionRef.current.stop();
    const finalResults = sessionRef.current.getResults();
    setResults(finalResults);
    setFinished(true);

    // Update XP
    if (finalResults.xpEarned > 0) {
      updateXp(finalResults.xpEarned);
    }

    // Save session to DB
    if (user) {
      await supabase.from('cat_sessions').insert({
        user_id: user.id,
        session_type: config.sessionType,
        domain_filter: config.domainFilter || null,
        config: config,
        final_theta: finalResults.finalTheta,
        final_se: finalResults.finalSE,
        passed: finalResults.passed,
        cut_score: config.cutScore,
        total_questions: finalResults.totalQuestions,
        correct_answers: finalResults.correctAnswers,
        time_spent_seconds: finalResults.totalTimeSeconds,
        responses: finalResults.responses,
        theta_history: finalResults.thetaHistory,
        domain_breakdown: finalResults.domainBreakdown,
        xp_earned: finalResults.xpEarned,
        status: 'completed',
        completed_at: new Date().toISOString(),
      });
    }

    // Notify parent
    if (finalResults.passed) {
      onPass(finalResults);
    } else {
      onFail(finalResults);
    }
  }, [config, user, supabase, updateXp, onPass, onFail]);

  // ── Time's up handler ──────────────────────────────────
  const handleTimeUp = useCallback(() => {
    finishSession();
  }, [finishSession]);

  // ══════════════════════════════════════════════════════
  // RENDER: Loading State
  // ══════════════════════════════════════════════════════

  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4"
            style={{ borderColor: theme.accent, borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading {config.title}...</p>
          <p className="text-xs mt-2" style={{ color: '#475569' }}>Preparing adaptive assessment</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: '1px solid #ef444444' }}>
        <p className="text-sm" style={{ color: '#ef4444' }}>{error}</p>
      </div>
    );
  }

  // ══════════════════════════════════════════════════════
  // RENDER: Results Screen
  // ══════════════════════════════════════════════════════

  if (finished && results) {
    return <ResultsScreen results={results} config={config} theme={theme}
      questionCache={questionCacheRef.current} showReview={showReview}
      setShowReview={setShowReview} reviewData={reviewDataRef.current} />;
  }

  // ══════════════════════════════════════════════════════
  // RENDER: Active Quiz
  // ══════════════════════════════════════════════════════

  if (!currentQuestion || !catState) return null;
  const timerMinutes = Math.floor(timeLeft / 60);
  const timerSeconds = timeLeft % 60;

  return (
    <div>
      {/* Header */}
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-sm font-bold" style={{ color: theme.accent }}>{config.title}</h3>
          <span className="text-xs" style={{ color: '#64748b' }}>
            Question {displayQuestionNumber}{config.sessionType === 'custom' ? ` of ${config.maxQuestions}` : ''} {catState.canStop && <span style={{ color: '#22c55e' }}>(can finish)</span>}
          </span>
        </div>
        <div className="flex items-center gap-3">
          {config.timeLimitMinutes > 0 && (
            <span
              className="text-sm font-mono font-bold px-2 py-1 rounded"
              style={{
                color: timeLeft < 120 ? '#ef4444' : theme.accent,
                background: timeLeft < 120 ? 'rgba(239, 68, 68, 0.1)' : theme.bg,
              }}
            >
              {timerMinutes}:{timerSeconds.toString().padStart(2, '0')}
            </span>
          )}
        </div>
      </div>

      {/* Confidence bar */}
      <div className="mb-4">
        <div className="h-1 rounded-full" style={{ background: '#1e2d4a' }}>
          <div className="h-full rounded-full transition-all duration-500"
            style={{
              width: `${catState.totalQuestions > 0 ? (catState.correct / catState.totalQuestions) * 100 : 0}%`,
              background: '#22c55e',
            }} />
        </div>
      </div>

      {/* Timer bar */}
      {config.timeLimitMinutes > 0 && (
        <div className="h-1 rounded-full mb-4" style={{ background: '#1e2d4a' }}>
          <div className="h-full rounded-full transition-all duration-1000"
            style={{
              width: `${(timeLeft / (config.timeLimitMinutes * 60)) * 100}%`,
              background: timeLeft < 120 ? '#ef4444' : theme.accent,
            }} />
        </div>
      )}

      {/* Question card */}
      <div className="rounded-xl p-5 mb-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>{questionText}</p>
      </div>

      {/* Options */}
      <div className="space-y-2">
        {questionOptions.map((opt, i) => {
          let bg = '#0d1220';
          let border = '#1e2d4a';
          let textColor = '#e2e8f0';

          if (showResult) {
            if (i === correctIndex) {
              bg = 'rgba(34, 197, 94, 0.1)';
              border = '#22c55e';
              textColor = '#22c55e';
            } else if (i === selectedIndex) {
              bg = 'rgba(239, 68, 68, 0.1)';
              border = '#ef4444';
              textColor = '#ef4444';
            }
          }

          return (
            <button
              key={i}
              onClick={() => handleSelect(i)}
              disabled={showResult}
              className="w-full text-left px-4 py-3 rounded-lg text-sm transition-all"
              style={{ background: bg, border: `1px solid ${border}`, color: textColor }}
            >
              <span className="font-bold mr-2">{String.fromCharCode(65 + i)}.</span>
              {opt}
            </button>
          );
        })}
      </div>

      {/* Explanation + Next */}
      {showResult && (
        <div className="mt-4 space-y-3">
          <div className="p-3 rounded-lg text-sm" style={{ background: 'rgba(0, 232, 255, 0.04)', border: '1px solid #00e8ff22', color: '#94a3b8' }}>
            {explanation}
          </div>
          {mnemonicHint && (
            <div className="p-3 rounded-lg text-sm" style={{ background: 'rgba(255, 215, 0, 0.04)', border: '1px solid #ffd70022' }}>
              <span className="font-bold text-xs block mb-1" style={{ color: '#ffd700' }}>Memory Hack</span>
              <span style={{ color: '#e2e8f0' }}>{mnemonicHint}</span>
            </div>
          )}
          <button
            onClick={handleNext}
            className="w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
            style={{ background: theme.accent, color: '#080c14' }}
          >
            {catState.status === 'finished' || !catState.currentQuestion ? 'View Results' : 'Next Question'}
          </button>
        </div>
      )}
    </div>
  );
}

// ═══════════════════════════════════════════════════════════
// Results Screen Component
// ═══════════════════════════════════════════════════════════

interface ResultsScreenProps {
  results: CATResults;
  config: CATConfig;
  theme: { accent: string; bg: string; border: string };
  questionCache: Map<string, {
    question_text: string;
    options: string[];
    correct_index: number;
    explanation: string;
    mnemonic_hint: string | null;
  }>;
  showReview: boolean;
  setShowReview: (v: boolean) => void;
  reviewData: ReviewQuestionData[];
}

function ResultsScreen({ results, config, theme, questionCache, showReview, setShowReview, reviewData }: ResultsScreenProps) {
  const passed = results.passed;
  const borderColor = passed ? '#22c55e' : '#ef4444';

  return (
    <div className="space-y-4">
      {/* Main result card */}
      <div className="rounded-xl p-6 text-center" style={{ background: '#111a2e', border: `1px solid ${borderColor}44` }}>
        <div className="text-5xl mb-3">{passed ? '🏆' : '💪'}</div>
        <h2 className="text-2xl font-bold mb-1" style={{ color: passed ? '#22c55e' : '#f97316' }}>
          {passed ? `${config.title} Passed!` : `${config.title} — Not Yet`}
        </h2>

        {/* Accuracy + correct count */}
        <p className="text-lg font-bold mb-2" style={{ color: '#e2e8f0' }}>
          {results.correctAnswers}/{results.totalQuestions} correct — {results.accuracy}%
        </p>

        {/* XP earned */}
        <div className="inline-flex items-center gap-1 px-3 py-1.5 rounded-lg" style={{ background: '#0d1220' }}>
          <span className="text-sm font-bold" style={{ color: '#ffd700' }}>+{results.xpEarned} XP</span>
        </div>
      </div>

      {/* Session stats */}
      <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <h3 className="text-sm font-bold mb-3" style={{ color: '#e2e8f0' }}>Session Details</h3>
        <div className="grid grid-cols-2 gap-3">
          <StatItem label="Total Time" value={formatTime(results.totalTimeSeconds)} />
          <StatItem label="Avg Response" value={`${results.averageResponseTime.toFixed(1)}s`} />
          <StatItem label="Accuracy" value={`${results.accuracy}%`} />
          <StatItem label="Questions" value={`${results.totalQuestions}`} />
        </div>
      </div>

      {/* Domain breakdown */}
      {Object.keys(results.domainBreakdown).length > 1 && (
        <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="text-sm font-bold mb-3" style={{ color: '#e2e8f0' }}>Domain Performance</h3>
          <div className="space-y-2">
            {Object.entries(results.domainBreakdown).map(([domainId, data]) => {
              const accuracy = data.total > 0 ? (data.correct / data.total) * 100 : 0;
              const barColor = accuracy >= 70 ? '#22c55e' : accuracy >= 50 ? '#f59e0b' : '#ef4444';
              return (
                <div key={domainId} className="flex items-center gap-3">
                  <span className="text-xs w-8 text-right font-mono" style={{ color: '#64748b' }}>D{domainId}</span>
                  <div className="flex-1 h-2 rounded-full" style={{ background: '#1e2d4a' }}>
                    <div className="h-full rounded-full transition-all" style={{ width: `${accuracy}%`, background: barColor }} />
                  </div>
                  <span className="text-xs w-14 text-right font-mono" style={{ color: '#94a3b8' }}>
                    {data.correct}/{data.total}
                  </span>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Question Review Section */}
      <QuestionReviewSection
        reviewData={reviewData}
        showReview={showReview}
        setShowReview={setShowReview}
      />
    </div>
  );
}

// ─── Helper Components ───────────────────────────────────

function StatItem({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex justify-between items-center px-2 py-1">
      <span className="text-xs" style={{ color: '#64748b' }}>{label}</span>
      <span className="text-xs font-mono font-bold" style={{ color: '#e2e8f0' }}>{value}</span>
    </div>
  );
}

function formatTime(seconds: number): string {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  if (mins === 0) return `${secs}s`;
  return `${mins}m ${secs}s`;
}

// ─── Difficulty Label Helper ─────────────────────────────

function getDifficultyLabel(b: number): { label: string; color: string } {
  if (b < -0.5) return { label: 'Easy', color: '#22c55e' };
  if (b < 1.0) return { label: 'Medium', color: '#f59e0b' };
  return { label: 'Hard', color: '#ef4444' };
}

function getCognitiveLabelColor(level: string): string {
  switch (level) {
    case 'remember': return '#94a3b8';
    case 'understand': return '#60a5fa';
    case 'apply': return '#22c55e';
    case 'analyze': return '#f59e0b';
    case 'evaluate': return '#f97316';
    case 'create': return '#ef4444';
    default: return '#94a3b8';
  }
}

// ═══════════════════════════════════════════════════════════
// Question Review Section Component
// ═══════════════════════════════════════════════════════════

interface QuestionReviewSectionProps {
  reviewData: ReviewQuestionData[];
  showReview: boolean;
  setShowReview: (v: boolean) => void;
}

function QuestionReviewSection({ reviewData, showReview, setShowReview }: QuestionReviewSectionProps) {
  const [filterWrongOnly, setFilterWrongOnly] = useState(false);
  // All cards expanded by default
  const [expandedCards, setExpandedCards] = useState<Set<number>>(
    () => new Set(reviewData.map(q => q.questionNumber))
  );

  const wrongCount = reviewData.filter(q => !q.isCorrect).length;
  const displayData = filterWrongOnly ? reviewData.filter(q => !q.isCorrect) : reviewData;

  // When filter changes, expand all visible cards
  useEffect(() => {
    setExpandedCards(new Set(displayData.map(q => q.questionNumber)));
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filterWrongOnly]);

  const toggleCard = (questionNumber: number) => {
    setExpandedCards(prev => {
      const next = new Set(prev);
      if (next.has(questionNumber)) {
        next.delete(questionNumber);
      } else {
        next.add(questionNumber);
      }
      return next;
    });
  };

  const expandAll = () => {
    setExpandedCards(new Set(displayData.map(q => q.questionNumber)));
  };

  const collapseAll = () => {
    setExpandedCards(new Set());
  };

  return (
    <div>
      {/* Toggle button */}
      <button
        onClick={() => setShowReview(!showReview)}
        className="w-full py-2 rounded-lg text-sm transition-all"
        style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#94a3b8' }}
      >
        {showReview ? 'Hide Question Review' : `Review All Questions (${reviewData.length})`}
      </button>

      {showReview && (
        <div className="mt-4 space-y-3">
          {/* Header with count and controls */}
          <div className="flex items-center justify-between">
            <h3 className="text-sm font-bold" style={{ color: '#e2e8f0' }}>
              Question Review
              <span className="ml-2 font-normal text-xs" style={{ color: '#64748b' }}>
                {displayData.length} question{displayData.length !== 1 ? 's' : ''}
                {filterWrongOnly ? ` (${wrongCount} wrong)` : ''}
              </span>
            </h3>
            <div className="flex items-center gap-2">
              <button
                onClick={() => expandedCards.size > 0 ? collapseAll() : expandAll()}
                className="text-xs px-2 py-1 rounded"
                style={{ color: '#64748b', background: '#0d1220' }}
              >
                {expandedCards.size > 0 ? 'Collapse All' : 'Expand All'}
              </button>
            </div>
          </div>

          {/* Filter toggle */}
          {wrongCount > 0 && (
            <div className="flex gap-2">
              <button
                onClick={() => setFilterWrongOnly(false)}
                className="text-xs px-3 py-1 rounded-full transition-all"
                style={{
                  background: !filterWrongOnly ? '#00e8ff22' : '#0d1220',
                  border: `1px solid ${!filterWrongOnly ? '#00e8ff44' : '#1e2d4a'}`,
                  color: !filterWrongOnly ? '#00e8ff' : '#64748b',
                }}
              >
                Show All ({reviewData.length})
              </button>
              <button
                onClick={() => setFilterWrongOnly(true)}
                className="text-xs px-3 py-1 rounded-full transition-all"
                style={{
                  background: filterWrongOnly ? '#ef444422' : '#0d1220',
                  border: `1px solid ${filterWrongOnly ? '#ef444444' : '#1e2d4a'}`,
                  color: filterWrongOnly ? '#ef4444' : '#64748b',
                }}
              >
                Show Wrong Only ({wrongCount})
              </button>
            </div>
          )}

          {/* Question cards */}
          {displayData.map((q) => {
            const isExpanded = expandedCards.has(q.questionNumber);
            const diff = getDifficultyLabel(q.difficulty);
            const cogColor = getCognitiveLabelColor(q.cognitiveLevel);

            return (
              <div
                key={q.questionNumber}
                className="rounded-lg overflow-hidden"
                style={{
                  background: '#0d1220',
                  border: `1px solid ${q.isCorrect ? '#22c55e22' : '#ef444422'}`,
                  borderLeft: `3px solid ${q.isCorrect ? '#22c55e' : '#ef4444'}`,
                }}
              >
                {/* Card header (always visible, clickable) */}
                <button
                  onClick={() => toggleCard(q.questionNumber)}
                  className="w-full text-left px-4 py-3 flex items-center justify-between"
                >
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-bold" style={{ color: q.isCorrect ? '#22c55e' : '#ef4444' }}>
                      Q{q.questionNumber}
                    </span>
                    <span className="text-xs" style={{ color: q.isCorrect ? '#22c55e' : '#ef4444' }}>
                      {q.isCorrect ? '✓' : '✗'}
                    </span>
                    <span className="text-xs truncate max-w-[250px]" style={{ color: '#94a3b8' }}>
                      {q.questionText.length > 80 ? q.questionText.slice(0, 80) + '...' : q.questionText}
                    </span>
                  </div>
                  <span className="text-xs" style={{ color: '#475569' }}>
                    {isExpanded ? '▲' : '▼'}
                  </span>
                </button>

                {/* Expanded content */}
                {isExpanded && (
                  <div className="px-4 pb-4 space-y-3">
                    {/* Badges */}
                    <div className="flex items-center gap-2">
                      <span className="text-xs px-2 py-0.5 rounded-full" style={{
                        background: `${diff.color}15`,
                        border: `1px solid ${diff.color}33`,
                        color: diff.color,
                      }}>
                        {diff.label}
                      </span>
                      <span className="text-xs px-2 py-0.5 rounded-full capitalize" style={{
                        background: `${cogColor}15`,
                        border: `1px solid ${cogColor}33`,
                        color: cogColor,
                      }}>
                        {q.cognitiveLevel}
                      </span>
                      <span className="text-xs font-mono" style={{ color: '#475569' }}>
                        {q.responseTime.toFixed(1)}s
                      </span>
                    </div>

                    {/* Full question text */}
                    <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
                      {q.questionText}
                    </p>

                    {/* All 4 options with highlighting */}
                    <div className="space-y-1.5">
                      {q.shuffledOptions.map((opt, i) => {
                        const isUserSelected = i === q.selectedIndex;
                        const isCorrectOption = i === q.correctIndex;

                        let optBg = '#111a2e';
                        let optBorder = '#1e2d4a';
                        let optColor = '#94a3b8';
                        let marker = '';

                        if (isCorrectOption) {
                          optBg = 'rgba(34, 197, 94, 0.08)';
                          optBorder = '#22c55e55';
                          optColor = '#22c55e';
                          marker = ' ✓';
                        }
                        if (isUserSelected && !q.isCorrect) {
                          optBg = 'rgba(239, 68, 68, 0.08)';
                          optBorder = '#ef444455';
                          optColor = '#ef4444';
                          marker = ' ← your answer';
                        }
                        if (isUserSelected && q.isCorrect) {
                          marker = ' ✓ your answer';
                        }

                        return (
                          <div
                            key={i}
                            className="px-3 py-2 rounded-lg text-xs"
                            style={{ background: optBg, border: `1px solid ${optBorder}`, color: optColor }}
                          >
                            <span className="font-bold mr-2">{String.fromCharCode(65 + i)}.</span>
                            {opt}
                            {marker && (
                              <span className="ml-2 text-xs font-bold">{marker}</span>
                            )}
                          </div>
                        );
                      })}
                    </div>

                    {/* Explanation */}
                    <div className="p-3 rounded-lg text-xs" style={{ background: 'rgba(0, 232, 255, 0.04)', border: '1px solid #00e8ff22', color: '#94a3b8' }}>
                      {q.explanation}
                    </div>

                    {/* Mnemonic hint */}
                    {q.mnemonicHint && (
                      <div className="p-3 rounded-lg text-xs" style={{ background: 'rgba(255, 215, 0, 0.04)', border: '1px solid #ffd70022' }}>
                        <span className="font-bold block mb-1" style={{ color: '#ffd700' }}>Memory Hack</span>
                        <span style={{ color: '#e2e8f0' }}>{q.mnemonicHint}</span>
                      </div>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}
