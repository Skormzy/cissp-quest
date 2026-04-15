'use client';

import { create } from 'zustand';

type StoryPhase = 'arrival' | 'briefing' | 'knowledge-check' | 'investigation' | 'mission-quiz' | 'debrief';

interface StoryState {
  currentChapter: number;
  currentSceneIndex: number;
  phase: StoryPhase;
  isTyping: boolean;
  dialogueComplete: boolean;
  setChapter: (chapter: number) => void;
  setSceneIndex: (index: number) => void;
  setPhase: (phase: StoryPhase) => void;
  nextScene: () => void;
  setTyping: (typing: boolean) => void;
  setDialogueComplete: (complete: boolean) => void;
  reset: () => void;
}

export const useStoryStore = create<StoryState>((set) => ({
  currentChapter: 1,
  currentSceneIndex: 0,
  phase: 'arrival',
  isTyping: false,
  dialogueComplete: false,
  setChapter: (chapter) => set({ currentChapter: chapter, currentSceneIndex: 0, phase: 'arrival' }),
  setSceneIndex: (index) => set({ currentSceneIndex: index }),
  setPhase: (phase) => set({ phase }),
  nextScene: () => set((state) => ({ currentSceneIndex: state.currentSceneIndex + 1, dialogueComplete: false })),
  setTyping: (isTyping) => set({ isTyping }),
  setDialogueComplete: (dialogueComplete) => set({ dialogueComplete }),
  reset: () => set({ currentChapter: 1, currentSceneIndex: 0, phase: 'arrival', isTyping: false, dialogueComplete: false }),
}));
