'use client';

import { create } from 'zustand';
import { Question, QuizAnswer } from '@/lib/types';

interface QuizState {
  questions: Question[];
  currentIndex: number;
  answers: QuizAnswer[];
  mode: 'story' | 'quick' | 'domain' | 'review' | 'custom';
  domainFilter: number | null;
  streak: number;
  bestStreak: number;
  totalXpEarned: number;
  sessionId: string;
  isActive: boolean;
  showResult: boolean;
  selectedIndex: number | null;
  questionStartTime: number;
  quizStartTime: number;
  initQuiz: (questions: Question[], mode: 'story' | 'quick' | 'domain' | 'review' | 'custom', domainFilter?: number | null) => void;
  selectAnswer: (index: number) => void;
  recordAnswer: (answer: QuizAnswer) => void;
  nextQuestion: () => void;
  finishQuiz: () => void;
  reset: () => void;
}

export const useQuizStore = create<QuizState>((set) => ({
  questions: [],
  currentIndex: 0,
  answers: [],
  mode: 'quick',
  domainFilter: null,
  streak: 0,
  bestStreak: 0,
  totalXpEarned: 0,
  sessionId: '',
  isActive: false,
  showResult: false,
  selectedIndex: null,
  questionStartTime: Date.now(),
  quizStartTime: Date.now(),
  initQuiz: (questions, mode, domainFilter = null) =>
    set({
      questions,
      currentIndex: 0,
      answers: [],
      mode,
      domainFilter,
      streak: 0,
      bestStreak: 0,
      totalXpEarned: 0,
      sessionId: crypto.randomUUID(),
      isActive: true,
      showResult: false,
      selectedIndex: null,
      questionStartTime: Date.now(),
      quizStartTime: Date.now(),
    }),
  selectAnswer: (index) => set({ selectedIndex: index, showResult: true }),
  recordAnswer: (answer) =>
    set((state) => {
      const newStreak = answer.isCorrect ? state.streak + 1 : 0;
      return {
        answers: [...state.answers, answer],
        streak: newStreak,
        bestStreak: Math.max(state.bestStreak, newStreak),
        totalXpEarned: state.totalXpEarned + answer.xpEarned,
      };
    }),
  nextQuestion: () =>
    set((state) => ({
      currentIndex: state.currentIndex + 1,
      showResult: false,
      selectedIndex: null,
      questionStartTime: Date.now(),
    })),
  finishQuiz: () => set({ isActive: false }),
  reset: () =>
    set({
      questions: [],
      currentIndex: 0,
      answers: [],
      streak: 0,
      bestStreak: 0,
      totalXpEarned: 0,
      isActive: false,
      showResult: false,
      selectedIndex: null,
    }),
}));
