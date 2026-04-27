'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { StoryQuizEngineProps } from '@/lib/story-types';
import { Question } from '@/lib/types';
import { calculateQuestionXp, getGrade } from '@/lib/xp';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { awardXpClient } from '@/lib/award-xp-client';
import { quizReward } from '@/lib/xp-rewards';

interface AnswerRecord {
  questionId: string;
  selectedIndex: number;
  isCorrect: boolean;
  timeSpent: number;
  xpEarned: number;
}

export default function StoryQuizEngine({ config, onPass, onFail }: StoryQuizEngineProps) {
  const { user, updateXp } = useUserStore();
  const supabase = createClient();

  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<AnswerRecord[]>([]);
  const [selectedIndex, setSelectedIndex] = useState<number | null>(null);
  const [showResult, setShowResult] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [streak, setStreak] = useState(0);
  const [totalXp, setTotalXp] = useState(0);
  const [quizFinished, setQuizFinished] = useState(false);

  // Global timer
  const [timeLeft, setTimeLeft] = useState(config.timeLimitMinutes * 60);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const questionStartRef = useRef(Date.now());
  const sessionId = useRef(crypto.randomUUID());

  const themeColors = {
    cyan: { accent: '#00e8ff', bg: 'rgba(0, 232, 255, 0.06)' },
    gold: { accent: '#ffd700', bg: 'rgba(255, 215, 0, 0.06)' },
    red:  { accent: '#ef4444', bg: 'rgba(239, 68, 68, 0.06)' },
  };
  const theme = themeColors[config.theme];

  // Load questions
  useEffect(() => {
    const loadQuestions = async () => {
      try {
        let allQuestions: Question[] = [];

        if (config.domainWeights) {
          // Final Boss: load weighted from multiple domains
          for (const [domainStr, count] of Object.entries(config.domainWeights)) {
            const domain = parseInt(domainStr);
            const { data } = await supabase
              .from('questions')
              .select('*')
              .eq('domain_id', domain)
              .eq('is_active', true)
              .in('difficulty', config.difficulties)
              .limit(count * 3); // overfetch, then sample

            if (data) {
              const shuffled = data.sort(() => Math.random() - 0.5).slice(0, count);
              allQuestions.push(...shuffled);
            }
          }
        } else if (config.domainId) {
          const { data } = await supabase
            .from('questions')
            .select('*')
            .eq('domain_id', config.domainId)
            .eq('is_active', true)
            .in('difficulty', config.difficulties)
            .limit(config.questionCount * 3);

          if (data) {
            allQuestions = data.sort(() => Math.random() - 0.5).slice(0, config.questionCount);
          }
        }

        if (allQuestions.length === 0) {
          setError('No questions available for this configuration.');
        } else {
          setQuestions(allQuestions.sort(() => Math.random() - 0.5));
        }
      } catch {
        setError('Failed to load questions.');
      } finally {
        setLoading(false);
      }
    };
    loadQuestions();
  }, [config.domainId, config.domainWeights, config.difficulties, config.questionCount, supabase]);

  // Start timer (skip if untimed)
  useEffect(() => {
    if (config.timeLimitMinutes === 0 || loading || quizFinished) return;
    timerRef.current = setInterval(() => {
      setTimeLeft((prev) => {
        if (prev <= 1) {
          if (timerRef.current) clearInterval(timerRef.current);
          finishQuiz();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
  }, [loading, config.timeLimitMinutes, quizFinished]);

  const finishQuiz = useCallback(() => {
    if (timerRef.current) clearInterval(timerRef.current);
    setQuizFinished(true);
  }, []);

  // Handle selecting an answer
  const handleSelect = async (index: number) => {
    if (showResult || selectedIndex !== null) return;

    const question = questions[currentIndex];
    const isCorrect = index === question.correct_index;
    const timeSpent = (Date.now() - questionStartRef.current) / 1000;
    const newStreak = isCorrect ? streak + 1 : 0;
    setStreak(newStreak);

    const xpResult = calculateQuestionXp(question.difficulty, isCorrect, newStreak, timeSpent);

    const record: AnswerRecord = {
      questionId: question.id,
      selectedIndex: index,
      isCorrect,
      timeSpent,
      xpEarned: xpResult.totalXp,
    };

    setSelectedIndex(index);
    setShowResult(true);
    setAnswers((prev) => [...prev, record]);
    setTotalXp((prev) => prev + xpResult.totalXp);

    // Update XP in store
    if (xpResult.totalXp > 0) {
      updateXp(xpResult.totalXp);
    }

    if (user) {
      await supabase.from('player_question_history').insert({
        user_id: user.id,
        question_id: question.id,
        domain_id: question.domain_id,
        difficulty: question.difficulty,
        selected_answer: index,
        correct_answer: question.correct_index,
        is_correct: isCorrect,
        time_spent_seconds: Math.round(timeSpent),
      });

      await awardXpClient(
        quizReward(isCorrect, question.difficulty),
        `story-quiz:${question.difficulty}:${isCorrect ? 'correct' : 'incorrect'}`,
      );
    }
  };

  const handleNext = () => {
    if (currentIndex + 1 >= questions.length) {
      finishQuiz();
    } else {
      setCurrentIndex((prev) => prev + 1);
      setSelectedIndex(null);
      setShowResult(false);
      questionStartRef.current = Date.now();
    }
  };

  // Finished state
  useEffect(() => {
    if (!quizFinished || questions.length === 0) return;
    const correct = answers.filter((a) => a.isCorrect).length;
    const scorePercent = (correct / questions.length) * 100;
    const passed = scorePercent >= config.passingPercentage;

    if (passed) {
      onPass(scorePercent, totalXp);
    } else {
      const domainMisses: Record<number, number> = {};
      answers.forEach((a, i) => {
        if (!a.isCorrect) {
          const q = questions[i];
          domainMisses[q.domain_id] = (domainMisses[q.domain_id] || 0) + 1;
        }
      });
      const weakDomains = Object.entries(domainMisses)
        .sort(([, a], [, b]) => b - a)
        .slice(0, 3)
        .map(([d]) => parseInt(d));
      onFail(scorePercent, weakDomains);
    }
  }, [quizFinished, answers, questions, config.passingPercentage, onPass, onFail, totalXp]);

  // Loading
  if (loading) {
    return (
      <div className="flex items-center justify-center py-20">
        <div className="text-center">
          <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin mx-auto mb-4" style={{ borderColor: theme.accent, borderTopColor: 'transparent' }} />
          <p style={{ color: '#64748b' }}>Loading {config.title}...</p>
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

  if (quizFinished) {
    const correct = answers.filter((a) => a.isCorrect).length;
    const scorePercent = questions.length > 0 ? (correct / questions.length) * 100 : 0;
    const passed = scorePercent >= config.passingPercentage;
    const grade = getGrade(scorePercent / 100);

    return (
      <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: `1px solid ${passed ? '#22c55e' : '#ef4444'}44` }}>
        <div className="text-5xl mb-3">{passed ? '🏆' : '💪'}</div>
        <h2 className="text-2xl font-bold mb-1" style={{ color: passed ? '#22c55e' : '#f97316' }}>
          {passed ? `${config.title} Passed!` : `${config.title} — Not Yet`}
        </h2>
        <div className="text-4xl font-bold my-4" style={{ color: grade.color }}>
          {grade.grade}
        </div>
        <div className="grid grid-cols-3 gap-4 max-w-sm mx-auto mb-4">
          <div>
            <div className="text-lg font-bold" style={{ color: '#e2e8f0' }}>{correct}/{questions.length}</div>
            <div className="text-xs" style={{ color: '#64748b' }}>Correct</div>
          </div>
          <div>
            <div className="text-lg font-bold" style={{ color: '#e2e8f0' }}>{Math.round(scorePercent)}%</div>
            <div className="text-xs" style={{ color: '#64748b' }}>Score</div>
          </div>
          <div>
            <div className="text-lg font-bold" style={{ color: '#ffd700' }}>+{totalXp}</div>
            <div className="text-xs" style={{ color: '#64748b' }}>XP</div>
          </div>
        </div>
        {!passed && (
          <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>
            You need {config.passingPercentage}% to pass. Review the material and try again!
          </p>
        )}
      </div>
    );
  }

  // Active quiz
  const question = questions[currentIndex];
  const timerMinutes = Math.floor(timeLeft / 60);
  const timerSeconds = timeLeft % 60;

  return (
    <div>
      {/* Header: title + timer + progress */}
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-sm font-bold" style={{ color: theme.accent }}>{config.title}</h3>
          <span className="text-xs" style={{ color: '#64748b' }}>
            Question {currentIndex + 1} of {questions.length}
          </span>
        </div>
        <div className="flex items-center gap-3">
          <span className="text-xs" style={{ color: '#ffd700' }}>+{totalXp} XP</span>
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

      {/* Timer bar */}
      {config.timeLimitMinutes > 0 && (
        <div className="h-1 rounded-full mb-4" style={{ background: '#1e2d4a' }}>
          <div
            className="h-full rounded-full transition-all duration-1000"
            style={{
              width: `${(timeLeft / (config.timeLimitMinutes * 60)) * 100}%`,
              background: timeLeft < 120 ? '#ef4444' : theme.accent,
            }}
          />
        </div>
      )}

      {/* Question card */}
      <div className="rounded-xl p-5 mb-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-center gap-2 mb-3">
          <span className="text-xs px-2 py-0.5 rounded-full" style={{
            background: question.difficulty === 'easy' ? 'rgba(34,197,94,0.1)' : question.difficulty === 'medium' ? 'rgba(245,158,11,0.1)' : 'rgba(239,68,68,0.1)',
            color: question.difficulty === 'easy' ? '#22c55e' : question.difficulty === 'medium' ? '#f59e0b' : '#ef4444',
          }}>
            {question.difficulty}
          </span>
        </div>
        <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>{question.question_text}</p>
      </div>

      {/* Options */}
      <div className="space-y-2">
        {question.options.map((opt, i) => {
          let bg = '#0d1220';
          let border = '#1e2d4a';
          let textColor = '#e2e8f0';

          if (showResult) {
            if (i === question.correct_index) {
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
            {question.explanation}
          </div>
          {question.mnemonic_hint && (
            <div className="p-3 rounded-lg text-sm" style={{ background: 'rgba(255, 215, 0, 0.04)', border: '1px solid #ffd70022' }}>
              <span className="font-bold text-xs block mb-1" style={{ color: '#ffd700' }}>Memory Hack</span>
              <span style={{ color: '#e2e8f0' }}>{question.mnemonic_hint}</span>
            </div>
          )}
          <button
            onClick={handleNext}
            className="w-full py-3 rounded-xl text-sm font-bold transition-all hover:opacity-90"
            style={{ background: theme.accent, color: '#080c14' }}
          >
            {currentIndex + 1 >= questions.length ? 'Finish' : 'Next Question'}
          </button>
        </div>
      )}
    </div>
  );
}
