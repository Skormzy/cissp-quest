'use client';

import { Suspense, useEffect, useState, useCallback, useRef } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { useQuizStore } from '@/stores/useQuizStore';
import { calculateQuestionXp, getGrade } from '@/lib/xp';
import { DOMAINS } from '@/lib/constants';
import { Question, QuizAnswer } from '@/lib/types';
import CATQuizEngine from '@/components/quiz/CATQuizEngine';
import { CAT_CONFIGS, CATResults } from '@/lib/cat-session';
import { awardXpClient } from '@/lib/award-xp-client';
import { quizReward } from '@/lib/xp-rewards';

export default function QuizPageWrapper() {
  return (
    <Suspense fallback={
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading quiz...</p>
        </div>
      </div>
    }>
      <QuizPage />
    </Suspense>
  );
}

// ==================== HELPER: generate AI performance summary ====================
function generatePerformanceSummary(
  questions: Question[],
  answers: QuizAnswer[],
  accuracy: number,
): string {
  // Gather domain names for correct/wrong answers
  const correctDomains: Set<string> = new Set();
  const wrongDomains: Set<string> = new Set();
  const wrongTopics: string[] = [];

  answers.forEach((a, i) => {
    const q = questions[i];
    const domain = DOMAINS.find((d) => d.id === q.domain_id);
    if (a.isCorrect) {
      if (domain) correctDomains.add(domain.name);
    } else {
      if (domain) wrongDomains.add(domain.name);
      wrongTopics.push(q.question_text.slice(0, 60));
    }
  });

  // Find fastest correct answers - what topics are solid
  const correctAnswers = answers
    .map((a, i) => ({ ...a, question: questions[i] }))
    .filter((a) => a.isCorrect)
    .sort((a, b) => a.timeSpent - b.timeSpent);

  const fastTopicDomains = correctAnswers.slice(0, 3).map((a) => {
    const d = DOMAINS.find((dom) => dom.id === a.question.domain_id);
    return d?.name || 'Unknown';
  });

  // Build sentences
  const sentences: string[] = [];

  if (correctDomains.size > 0) {
    const topCorrect = Array.from(correctDomains).slice(0, 2).join(' and ');
    sentences.push(`Strong grasp of ${topCorrect}.`);
  }

  if (wrongDomains.size > 0) {
    const topWrong = Array.from(wrongDomains).slice(0, 2).join(' and ');
    sentences.push(`Struggled with ${topWrong} — review these topics in the Library.`);
  } else {
    sentences.push('No wrong answers — impressive performance!');
  }

  if (fastTopicDomains.length > 0) {
    const uniqueFast = Array.from(new Set(fastTopicDomains)).slice(0, 2).join(' and ');
    sentences.push(`Your fastest answers were in ${uniqueFast}, suggesting solid fundamentals there.`);
  }

  // Recommendation
  if (accuracy < 0.5) {
    sentences.push('Focus next on reading Library topics before attempting more quizzes. Build your foundation first.');
  } else if (accuracy < 0.7) {
    const weakDomain = Array.from(wrongDomains)[0];
    sentences.push(`Focus next on: ${weakDomain || 'reviewing missed questions'} — use the Study links below to strengthen weak areas.`);
  } else if (accuracy < 0.9) {
    sentences.push('You\'re close to mastery. Focus on the questions you missed and try a domain-specific quiz to sharpen those areas.');
  } else {
    sentences.push('Excellent mastery demonstrated. Consider moving to harder difficulty or the next domain.');
  }

  return sentences.join(' ');
}

function QuizPage() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const { user, updateXp } = useUserStore();
  const quiz = useQuizStore();
  const [timer, setTimer] = useState(0);
  const [xpPopup, setXpPopup] = useState<{ amount: number; critical: boolean } | null>(null);
  const [loading, setLoading] = useState(true);
  const [previousAccuracy, setPreviousAccuracy] = useState<number | null>(null);
  const [adaptiveResult, setAdaptiveResult] = useState<'idle' | 'pass' | 'fail'>('idle');
  const [adaptiveResults, setAdaptiveResults] = useState<CATResults | null>(null);
  const supabase = createClient();
  const quizInitialized = useRef(false);

  const mode = (searchParams.get('mode') || 'quick') as 'story' | 'quick' | 'domain' | 'review' | 'custom';
  const domainParam = searchParams.get('domain');
  const countParam = parseInt(searchParams.get('count') || '10');
  const chapterParam = searchParams.get('chapter');
  const adaptiveParam = searchParams.get('adaptive') === 'true';
  // Custom quiz builder params
  const domainsParam = searchParams.get('domains'); // comma-separated domain IDs
  const difficultiesParam = searchParams.get('difficulties'); // comma-separated
  const sourceParam = searchParams.get('source'); // 'all' | 'new' | 'wrong'

  // ── Adaptive (CAT) Mode ──────────────────────────────
  if (adaptiveParam) {
    const domainFilter = domainsParam
      ? parseInt(domainsParam.split(',')[0])
      : domainParam ? parseInt(domainParam) : undefined;

    const catConfig = CAT_CONFIGS.custom({
      domainFilter,
      minQuestions: Math.max(10, Math.floor(countParam * 0.8)),
      maxQuestions: countParam,
      timeLimitMinutes: 0,
    });

    return (
      <div className="max-w-3xl mx-auto">
        <Link href="/app/quiz/custom" className="text-xs inline-flex items-center gap-1 mb-4" style={{ color: '#64748b' }}>
          ← Back to Quiz Builder
        </Link>
        <CATQuizEngine
          config={catConfig}
          onPass={(results) => { setAdaptiveResults(results); setAdaptiveResult('pass'); }}
          onFail={(results) => { setAdaptiveResults(results); setAdaptiveResult('fail'); }}
        />
        {/* Navigation links after quiz completes */}
        {(adaptiveResult === 'pass' || adaptiveResult === 'fail') && (
          <div className="flex gap-3 justify-center mt-6">
            <Link href="/app/dashboard" className="px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
              Dashboard
            </Link>
            <Link href="/app/quiz/custom" className="px-6 py-2 rounded-lg text-sm" style={{ border: '1px solid #1e2d4a', color: '#94a3b8' }}>
              New Quiz
            </Link>
          </div>
        )}
      </div>
    );
  }

  // Load questions ONCE
  useEffect(() => {
    if (!user || quizInitialized.current) return;
    quizInitialized.current = true;

    const loadQuestions = async () => {
      let query = supabase
        .from('questions')
        .select('*')
        .eq('is_active', true);

      // Domain filter — single domain param or multi-domain from custom builder
      if (domainsParam) {
        const domainIds = domainsParam.split(',').map(Number).filter(Boolean);
        if (domainIds.length > 0) {
          query = query.in('domain_id', domainIds);
        }
      } else if (domainParam) {
        query = query.eq('domain_id', parseInt(domainParam));
      }

      // Difficulty filter from custom builder
      if (difficultiesParam) {
        const diffs = difficultiesParam.split(',').filter(Boolean);
        if (diffs.length > 0 && diffs.length < 3) {
          query = query.in('difficulty', diffs);
        }
      }

      // Review mode: spaced repetition
      if (mode === 'review') {
        const today = new Date().toISOString().split('T')[0];
        const { data: schedule } = await supabase
          .from('user_question_schedule')
          .select('question_id')
          .eq('user_id', user.id)
          .lte('next_review', today)
          .limit(countParam);

        if (schedule && schedule.length > 0) {
          const qIds = schedule.map((s) => s.question_id);
          const { data } = await supabase
            .from('questions')
            .select('*')
            .in('id', qIds);
          if (data && data.length > 0) {
            quiz.initQuiz(shuffleArray(data), mode, domainParam ? parseInt(domainParam) : null);
            setLoading(false);
            return;
          }
        }
      }

      // Source filter from custom builder: 'new' or 'wrong'
      if (sourceParam === 'new' && user) {
        const { data: answeredIds } = await supabase
          .from('user_question_history')
          .select('question_id')
          .eq('user_id', user.id);
        if (answeredIds && answeredIds.length > 0) {
          const seen = answeredIds.map((a) => a.question_id);
          query = query.not('id', 'in', `(${seen.join(',')})`);
        }
      } else if (sourceParam === 'wrong' && user) {
        const { data: wrongAnswers } = await supabase
          .from('user_question_history')
          .select('question_id')
          .eq('user_id', user.id)
          .eq('is_correct', false);
        if (wrongAnswers && wrongAnswers.length > 0) {
          const wrongIds = [...new Set(wrongAnswers.map((a) => a.question_id))];
          query = query.in('id', wrongIds);
        }
      }

      query = query.limit(countParam);
      const { data } = await query;

      if (data && data.length > 0) {
        quiz.initQuiz(shuffleArray(data), mode, domainParam ? parseInt(domainParam) : null);
      }
      setLoading(false);

      // Load previous accuracy for comparison (if domain quiz)
      if (domainParam && user) {
        const { data: prevAnswers } = await supabase
          .from('user_question_history')
          .select('is_correct')
          .eq('user_id', user.id)
          .eq('domain_id', parseInt(domainParam))
          .order('created_at', { ascending: false })
          .limit(50);

        if (prevAnswers && prevAnswers.length >= 5) {
          const prevCorrect = prevAnswers.filter((a) => a.is_correct).length;
          setPreviousAccuracy(prevCorrect / prevAnswers.length);
        }
      }
    };

    loadQuestions();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user]);

  // Timer
  useEffect(() => {
    if (!quiz.isActive || quiz.showResult) return;
    const interval = setInterval(() => setTimer((t) => t + 1), 1000);
    return () => clearInterval(interval);
  }, [quiz.isActive, quiz.showResult, quiz.currentIndex]);

  useEffect(() => {
    setTimer(0);
  }, [quiz.currentIndex]);

  const handleAnswer = useCallback(async (index: number) => {
    if (quiz.showResult || !user) return;

    const question = quiz.questions[quiz.currentIndex];
    const isCorrect = index === question.correct_index;
    const timeSpent = timer;

    const xpResult = calculateQuestionXp(
      question.difficulty,
      isCorrect,
      isCorrect ? quiz.streak + 1 : 0,
      timeSpent
    );

    const answer: QuizAnswer = {
      questionId: question.id,
      selectedIndex: index,
      isCorrect,
      timeSpent,
      xpEarned: xpResult.totalXp,
      isCriticalHit: xpResult.isCriticalHit,
    };

    quiz.selectAnswer(index);
    quiz.recordAnswer(answer);

    if (xpResult.totalXp > 0) {
      updateXp(xpResult.totalXp);
      setXpPopup({ amount: xpResult.totalXp, critical: xpResult.isCriticalHit });
      setTimeout(() => setXpPopup(null), 2000);
    }

    await awardXpClient(
      quizReward(isCorrect, question.difficulty),
      `quiz:${question.difficulty}:${isCorrect ? 'correct' : 'incorrect'}`,
    );

    await supabase.from('player_question_history').insert({
      user_id: user.id,
      question_id: question.id,
      domain_id: question.domain_id,
      difficulty: question.difficulty,
      selected_answer: index,
      correct_answer: question.correct_index,
      is_correct: isCorrect,
      time_spent_seconds: timeSpent,
    });

    // Update spaced repetition
    await supabase.from('user_question_schedule').upsert({
      user_id: user.id,
      question_id: question.id,
      times_seen: 1,
      times_correct: isCorrect ? 1 : 0,
      interval_days: isCorrect ? 3 : 1,
      next_review: new Date(Date.now() + (isCorrect ? 3 : 1) * 86400000).toISOString().split('T')[0],
    });
  }, [quiz, user, timer, updateXp, supabase]);

  const handleNext = () => {
    if (quiz.currentIndex >= quiz.questions.length - 1) {
      quiz.finishQuiz();
    } else {
      quiz.nextQuestion();
    }
  };

  // ==================== LOADING ====================
  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading questions...</p>
        </div>
      </div>
    );
  }

  // ==================== NO QUESTIONS ====================
  if (quiz.questions.length === 0) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">📭</div>
        <p className="mb-2" style={{ color: '#e2e8f0' }}>No questions available</p>
        <p className="text-sm mb-6" style={{ color: '#64748b' }}>
          {mode === 'review' ? 'No questions are due for review.' : 'No questions found for this filter.'}
        </p>
        <Link href="/app/dashboard" className="px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
          Back to Dashboard
        </Link>
      </div>
    );
  }

  // ==================== RESULTS SCREEN ====================
  if (!quiz.isActive && quiz.answers.length > 0) {
    const correct = quiz.answers.filter((a) => a.isCorrect).length;
    const total = quiz.answers.length;
    const accuracy = correct / total;
    const grade = getGrade(accuracy);

    // Timing stats
    const totalTime = quiz.answers.reduce((sum, a) => sum + a.timeSpent, 0);
    const avgTime = Math.round(totalTime / total);
    const totalMinutes = Math.floor(totalTime / 60);
    const totalSeconds = totalTime % 60;

    // Fastest and slowest
    const answerTimes = quiz.answers.map((a, i) => ({
      index: i,
      time: a.timeSpent,
      question: quiz.questions[i],
      isCorrect: a.isCorrect,
    }));
    const fastest = answerTimes.reduce((min, a) => (a.time < min.time ? a : min), answerTimes[0]);
    const slowest = answerTimes.reduce((max, a) => (a.time > max.time ? a : max), answerTimes[0]);

    // Difficulty breakdown
    const diffBreakdown: Record<string, { correct: number; total: number }> = {};
    quiz.answers.forEach((a, i) => {
      const diff = quiz.questions[i].difficulty;
      if (!diffBreakdown[diff]) diffBreakdown[diff] = { correct: 0, total: 0 };
      diffBreakdown[diff].total++;
      if (a.isCorrect) diffBreakdown[diff].correct++;
    });

    // Domain breakdown
    const domainBreakdown: Record<number, { correct: number; total: number }> = {};
    quiz.answers.forEach((a, i) => {
      const q = quiz.questions[i];
      if (!domainBreakdown[q.domain_id]) domainBreakdown[q.domain_id] = { correct: 0, total: 0 };
      domainBreakdown[q.domain_id].total++;
      if (a.isCorrect) domainBreakdown[q.domain_id].correct++;
    });

    // Improvement comparison
    const improvementDelta = previousAccuracy !== null ? Math.round((accuracy - previousAccuracy) * 100) : null;

    // AI Performance Summary
    const aiSummary = generatePerformanceSummary(quiz.questions, quiz.answers, accuracy);

    const diffColors: Record<string, string> = { easy: '#22c55e', medium: '#f59e0b', hard: '#ef4444' };

    return (
      <div className="max-w-lg mx-auto space-y-6">
        {/* Grade Card */}
        <div className="rounded-xl p-8 text-center" style={{ background: 'linear-gradient(135deg, #111a2e, #1a2540)', border: '1px solid #1e2d4a' }}>
          <div className="text-7xl font-bold mb-2" style={{ color: grade.color }}>{grade.grade}</div>
          <p className="text-xl font-bold mb-1" style={{ color: '#e2e8f0' }}>Quiz Complete!</p>
          <p className="text-sm mb-2" style={{ color: '#64748b' }}>
            Completed in {totalMinutes}m {totalSeconds}s
          </p>
          {improvementDelta !== null && (
            <p className="text-sm font-bold" style={{ color: improvementDelta >= 0 ? '#22c55e' : '#ef4444' }}>
              {improvementDelta >= 0 ? '↑' : '↓'} {Math.abs(improvementDelta)}% from last attempt
            </p>
          )}
        </div>

        {/* Core Stats */}
        <div className="grid grid-cols-4 gap-3">
          <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-xl font-bold" style={{ color: '#22c55e' }}>{correct}/{total}</div>
            <div className="text-[10px]" style={{ color: '#64748b' }}>Score</div>
          </div>
          <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-xl font-bold" style={{ color: '#e2e8f0' }}>{Math.round(accuracy * 100)}%</div>
            <div className="text-[10px]" style={{ color: '#64748b' }}>Accuracy</div>
          </div>
          <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-xl font-bold" style={{ color: '#ffd700' }}>+{quiz.totalXpEarned}</div>
            <div className="text-[10px]" style={{ color: '#64748b' }}>XP Earned</div>
          </div>
          <div className="rounded-xl p-3 text-center" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-xl font-bold" style={{ color: '#f97316' }}>{quiz.bestStreak}</div>
            <div className="text-[10px]" style={{ color: '#64748b' }}>Best Streak</div>
          </div>
        </div>

        {/* Time Stats */}
        <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="text-xs font-bold mb-3" style={{ color: '#94a3b8' }}>TIME ANALYSIS</h3>
          <div className="grid grid-cols-2 gap-3 text-center mb-3">
            <div>
              <div className="text-lg font-bold font-mono" style={{ color: '#00e8ff' }}>{avgTime}s</div>
              <div className="text-[10px]" style={{ color: '#64748b' }}>Avg per question</div>
            </div>
            <div>
              <div className="text-lg font-bold font-mono" style={{ color: '#00e8ff' }}>{totalMinutes}m {totalSeconds}s</div>
              <div className="text-[10px]" style={{ color: '#64748b' }}>Total time</div>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div className="rounded-lg p-2" style={{ background: '#0d1220' }}>
              <div className="flex items-center gap-1 mb-1">
                <span className="text-xs">⚡</span>
                <span className="text-[10px] font-bold" style={{ color: '#22c55e' }}>Fastest: {fastest.time}s</span>
              </div>
              <p className="text-[10px] truncate" style={{ color: '#94a3b8' }}>
                Q{fastest.index + 1}: {fastest.question.question_text.slice(0, 40)}...
              </p>
            </div>
            <div className="rounded-lg p-2" style={{ background: '#0d1220' }}>
              <div className="flex items-center gap-1 mb-1">
                <span className="text-xs">🐢</span>
                <span className="text-[10px] font-bold" style={{ color: '#f59e0b' }}>Slowest: {slowest.time}s</span>
              </div>
              <p className="text-[10px] truncate" style={{ color: '#94a3b8' }}>
                Q{slowest.index + 1}: {slowest.question.question_text.slice(0, 40)}...
              </p>
            </div>
          </div>
        </div>

        {/* Difficulty Breakdown */}
        <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="text-xs font-bold mb-3" style={{ color: '#94a3b8' }}>DIFFICULTY BREAKDOWN</h3>
          <div className="flex gap-3">
            {(['easy', 'medium', 'hard'] as const).map((diff) => {
              const stats = diffBreakdown[diff];
              if (!stats) return null;
              const pct = Math.round((stats.correct / stats.total) * 100);
              return (
                <div key={diff} className="flex-1 rounded-lg p-3 text-center" style={{ background: '#0d1220' }}>
                  <div className="text-xs font-bold capitalize mb-1" style={{ color: diffColors[diff] }}>{diff}</div>
                  <div className="text-lg font-bold" style={{ color: '#e2e8f0' }}>{stats.correct}/{stats.total}</div>
                  <div className="text-[10px]" style={{ color: '#64748b' }}>{pct}%</div>
                  <div className="h-1 rounded-full mt-2 overflow-hidden" style={{ background: '#1e2d4a' }}>
                    <div className="h-full rounded-full" style={{ width: `${pct}%`, background: diffColors[diff] }} />
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Domain Breakdown */}
        {Object.keys(domainBreakdown).length > 1 && (
          <div className="rounded-xl p-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <h3 className="text-xs font-bold mb-3" style={{ color: '#94a3b8' }}>DOMAIN BREAKDOWN</h3>
            <div className="space-y-2">
              {Object.entries(domainBreakdown).map(([domainId, stats]) => {
                const domain = DOMAINS.find((d) => d.id === parseInt(domainId));
                const pct = Math.round((stats.correct / stats.total) * 100);
                return (
                  <div key={domainId} className="flex items-center gap-3">
                    <span className="text-sm w-6">{domain?.icon}</span>
                    <div className="flex-1">
                      <div className="h-2 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
                        <div className="h-full rounded-full" style={{ width: `${pct}%`, background: domain?.color }} />
                      </div>
                    </div>
                    <span className="text-xs w-20 text-right" style={{ color: domain?.color }}>{stats.correct}/{stats.total} ({pct}%)</span>
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {/* AI Performance Summary */}
        <div className="rounded-xl p-4" style={{ background: 'rgba(139, 92, 246, 0.08)', border: '1px solid rgba(139, 92, 246, 0.2)' }}>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-sm">🤖</span>
            <h3 className="text-xs font-bold" style={{ color: '#a78bfa' }}>PERFORMANCE ANALYSIS</h3>
          </div>
          <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
            {aiSummary}
          </p>
        </div>

        {/* Action Buttons */}
        <div className="flex flex-col gap-3">
          <Link
            href="/app/dashboard"
            className="w-full py-3 rounded-xl text-sm font-bold text-center transition-all hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            Return to Dashboard
          </Link>
          <div className="flex gap-3 justify-center flex-wrap">
            {chapterParam && (
              <Link
                href={`/app/story/${chapterParam}`}
                className="px-6 py-2 rounded-lg text-sm font-medium"
                style={{ border: '1px solid #1e2d4a', color: '#00e8ff' }}
              >
                Back to Story
              </Link>
            )}
            <button
              onClick={() => {
                quiz.reset();
                quizInitialized.current = false;
                router.push('/app/quiz?mode=quick&count=10');
                window.location.reload();
              }}
              className="px-6 py-2 rounded-lg text-sm font-medium"
              style={{ border: '1px solid #1e2d4a', color: '#00e8ff' }}
            >
              Quiz Again
            </button>
            <Link
              href="/app/quiz/custom"
              className="px-6 py-2 rounded-lg text-sm font-medium"
              style={{ border: '1px solid #1e2d4a', color: '#00e8ff' }}
            >
              Build Another Quiz
            </Link>
            <Link
              href="/app/library"
              className="px-6 py-2 rounded-lg text-sm font-medium"
              style={{ border: '1px solid #1e2d4a', color: '#00e8ff' }}
            >
              📖 Library
            </Link>
          </div>
        </div>

        {/* Answer Review */}
        <div className="space-y-3">
          <h3 className="font-bold" style={{ color: '#e2e8f0' }}>Review Answers</h3>
          {quiz.answers.map((answer, i) => {
            const q = quiz.questions[i];
            const domain = DOMAINS.find((d) => d.id === q.domain_id);
            return (
              <div
                key={i}
                className="rounded-xl p-4"
                style={{
                  background: '#111a2e',
                  border: `1px solid ${answer.isCorrect ? '#22c55e' : '#ef4444'}`,
                }}
              >
                <div className="flex items-center gap-2 mb-2 flex-wrap">
                  <span>{answer.isCorrect ? '✅' : '❌'}</span>
                  <span className="text-xs px-2 py-0.5 rounded-full" style={{ background: `${domain?.color}22`, color: domain?.color }}>
                    {domain?.name}
                  </span>
                  <span className="text-xs font-mono px-2 py-0.5 rounded-full" style={{ background: '#0d1220', color: '#64748b' }}>
                    {answer.timeSpent}s
                  </span>
                  {answer.xpEarned > 0 && (
                    <span className="text-xs" style={{ color: '#ffd700' }}>+{answer.xpEarned} XP</span>
                  )}
                  {answer.isCriticalHit && <span className="text-xs font-bold" style={{ color: '#ffd700' }}>CRITICAL!</span>}
                </div>
                <p className="text-sm mb-2" style={{ color: '#e2e8f0' }}>{q.question_text}</p>
                <p className="text-xs" style={{ color: '#94a3b8' }}>{q.explanation}</p>

                {!answer.isCorrect && (
                  <div className="mt-3 space-y-2">
                    {q.library_topic_id && (
                      <Link
                        href={`/app/library/${q.library_topic_id}`}
                        className="block text-xs px-3 py-2 rounded-lg transition-all hover:scale-[1.01]"
                        style={{ background: 'rgba(0, 232, 255, 0.05)', border: '1px solid rgba(0, 232, 255, 0.2)', color: '#00e8ff' }}
                      >
                        📖 Study this concept in the Library →
                      </Link>
                    )}
                    {q.mnemonic_hint && (
                      <div className="text-xs px-3 py-2 rounded-lg" style={{ background: 'rgba(139, 92, 246, 0.1)', border: '1px solid rgba(139, 92, 246, 0.2)', color: '#a78bfa' }}>
                        🧠 Memory Hack: {q.mnemonic_hint}
                      </div>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    );
  }

  // ==================== ACTIVE QUIZ ====================
  const question = quiz.questions[quiz.currentIndex];
  const domain = DOMAINS.find((d) => d.id === question.domain_id);
  const currentAnswer = quiz.answers[quiz.currentIndex];

  return (
    <div className="max-w-2xl mx-auto space-y-6 relative">
      {/* XP Popup */}
      {xpPopup && (
        <div className="fixed top-20 left-1/2 -translate-x-1/2 z-50 pointer-events-none">
          <div
            className="text-2xl font-bold animate-bounce"
            style={{
              color: '#ffd700',
              textShadow: '0 0 10px rgba(255, 215, 0, 0.5)',
              animation: 'xpFloat 2s ease-out forwards',
            }}
          >
            +{xpPopup.amount} XP{xpPopup.critical ? ' CRITICAL HIT!' : ''}
          </div>
        </div>
      )}

      {/* Header */}
      <div className="flex items-center justify-between flex-wrap gap-2">
        <div className="flex items-center gap-2 flex-wrap">
          <span className="text-xs font-medium px-2 py-0.5 rounded-full whitespace-nowrap" style={{ background: `${domain?.color}22`, color: domain?.color }}>
            {domain?.icon} {domain?.name}
          </span>
          <span className="text-xs font-medium px-2 py-0.5 rounded-full" style={{
            background: question.difficulty === 'easy' ? '#22c55e22' : question.difficulty === 'medium' ? '#f59e0b22' : '#ef444422',
            color: question.difficulty === 'easy' ? '#22c55e' : question.difficulty === 'medium' ? '#f59e0b' : '#ef4444',
          }}>
            {question.difficulty}
          </span>
        </div>

        <div className="flex items-center gap-3">
          <span className="text-xs font-mono" style={{ color: '#64748b' }}>{timer}s</span>
          {quiz.streak >= 3 && (
            <span className="text-xs font-bold px-2 py-0.5 rounded-full" style={{ background: '#f9731622', color: '#f97316' }}>
              🔥 {quiz.streak} streak
            </span>
          )}
        </div>
      </div>

      {/* Progress bar */}
      <div className="h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
        <div
          className="h-full rounded-full transition-all duration-300"
          style={{ width: `${((quiz.currentIndex + 1) / quiz.questions.length) * 100}%`, background: '#00e8ff' }}
        />
      </div>
      <div className="text-xs text-right font-medium" style={{ color: '#64748b' }}>
        {quiz.currentIndex + 1} / {quiz.questions.length}
      </div>

      {/* Question */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        {question.story_context && (
          <p className="text-xs italic mb-4 pb-3" style={{ color: '#64748b', borderBottom: '1px solid #1e2d4a' }}>
            {question.story_context}
          </p>
        )}

        <p className="text-base mb-6" style={{ color: '#e2e8f0' }}>{question.question_text}</p>

        <div className="space-y-3">
          {question.options.map((opt: string, i: number) => {
            let optStyle: React.CSSProperties = {
              background: '#0d1220',
              border: '1px solid #1e2d4a',
              color: '#e2e8f0',
            };

            if (quiz.showResult) {
              if (i === question.correct_index) {
                optStyle = { background: 'rgba(34, 197, 94, 0.15)', border: '2px solid #22c55e', color: '#22c55e' };
              } else if (i === quiz.selectedIndex && i !== question.correct_index) {
                optStyle = { background: 'rgba(239, 68, 68, 0.15)', border: '2px solid #ef4444', color: '#ef4444' };
              } else {
                optStyle = { ...optStyle, opacity: 0.4 };
              }
            }

            return (
              <button
                key={i}
                onClick={() => handleAnswer(i)}
                disabled={quiz.showResult}
                className="w-full text-left px-4 py-3 rounded-xl text-sm transition-all hover:scale-[1.01] disabled:cursor-default"
                style={optStyle}
              >
                <span className="inline-block w-7 h-7 rounded-full text-center leading-7 text-xs font-bold mr-3" style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff' }}>
                  {String.fromCharCode(65 + i)}
                </span>
                {opt}
                {quiz.showResult && i === question.correct_index && (
                  <span className="ml-2 text-xs font-bold" style={{ color: '#22c55e' }}>✓ Correct</span>
                )}
                {quiz.showResult && i === quiz.selectedIndex && i !== question.correct_index && (
                  <span className="ml-2 text-xs font-bold" style={{ color: '#ef4444' }}>✗ Your answer</span>
                )}
              </button>
            );
          })}
        </div>
      </div>

      {/* Explanation Panel */}
      {quiz.showResult && (
        <div className="space-y-3" style={{ animation: 'slideUp 0.3s ease-out' }}>
          <div
            className="rounded-xl p-4"
            style={{
              background: currentAnswer?.isCorrect ? 'rgba(34, 197, 94, 0.08)' : 'rgba(239, 68, 68, 0.08)',
              border: `1px solid ${currentAnswer?.isCorrect ? '#22c55e' : '#ef4444'}`,
            }}
          >
            <div className="flex items-center gap-2 mb-3">
              {currentAnswer?.isCorrect ? (
                <span className="text-base font-bold" style={{ color: '#22c55e' }}>✅ Correct!</span>
              ) : (
                <span className="text-base font-bold" style={{ color: '#ef4444' }}>❌ Incorrect</span>
              )}
              {currentAnswer?.xpEarned > 0 && (
                <span className="text-sm font-bold ml-auto" style={{ color: '#ffd700' }}>+{currentAnswer.xpEarned} XP</span>
              )}
            </div>

            <div className="mb-3">
              <p className="text-xs font-bold mb-1" style={{ color: '#94a3b8' }}>EXPLANATION</p>
              <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>{question.explanation}</p>
            </div>

            <div className="text-sm rounded-lg p-3 mb-2" style={{ background: 'rgba(34, 197, 94, 0.08)', border: '1px solid rgba(34, 197, 94, 0.2)' }}>
              <p className="text-xs font-bold mb-1" style={{ color: '#22c55e' }}>
                ✓ Correct: {String.fromCharCode(65 + question.correct_index)}) {question.options[question.correct_index]}
              </p>
            </div>

            {!currentAnswer?.isCorrect && (
              <div className="text-sm rounded-lg p-3" style={{ background: 'rgba(239, 68, 68, 0.05)', border: '1px solid rgba(239, 68, 68, 0.15)' }}>
                <p className="text-xs font-bold mb-1" style={{ color: '#ef4444' }}>
                  ✗ You chose: {String.fromCharCode(65 + (quiz.selectedIndex ?? 0))}) {question.options[quiz.selectedIndex ?? 0]}
                </p>
                <p className="text-xs" style={{ color: '#94a3b8' }}>
                  This is not the best answer. Review the explanation above to understand why.
                </p>
              </div>
            )}
          </div>

          {question.library_topic_id && (
            <Link
              href={`/app/library/${question.library_topic_id}`}
              className="block text-sm px-4 py-3 rounded-xl transition-all hover:scale-[1.01]"
              style={{ background: 'rgba(0, 232, 255, 0.05)', border: '1px solid rgba(0, 232, 255, 0.2)', color: '#00e8ff' }}
            >
              📖 Study this concept in the Library →
            </Link>
          )}

          {question.mnemonic_hint && (
            <div className="text-sm px-4 py-3 rounded-xl" style={{ background: 'rgba(139, 92, 246, 0.1)', border: '1px solid rgba(139, 92, 246, 0.2)', color: '#a78bfa' }}>
              🧠 <span className="font-bold">Memory Hack:</span> {question.mnemonic_hint}
            </div>
          )}

          <button
            onClick={handleNext}
            className="w-full py-3 rounded-xl font-bold text-sm transition-all hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            {quiz.currentIndex >= quiz.questions.length - 1 ? 'See Results' : 'Next Question →'}
          </button>
        </div>
      )}

      <style jsx>{`
        @keyframes xpFloat {
          0% { opacity: 1; transform: translateY(0); }
          100% { opacity: 0; transform: translateY(-80px); }
        }
        @keyframes slideUp {
          0% { opacity: 0; transform: translateY(20px); }
          100% { opacity: 1; transform: translateY(0); }
        }
      `}</style>
    </div>
  );
}

function shuffleArray<T>(array: T[]): T[] {
  const shuffled = [...array];
  for (let i = shuffled.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
  }
  return shuffled;
}
