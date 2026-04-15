'use client';

import { create } from 'zustand';
import { StorySceneNode, EvidenceBoardItem } from '@/lib/story-types';

interface DialogueHistoryEntry {
  speaker: string;
  text: string;
  nodeId: string;
}

interface StoryModeState {
  // Scene state
  currentDomain: number | null;
  currentAct: number | null;
  currentNodeIndex: number;
  scenes: StorySceneNode[];

  // UI state
  isTyping: boolean;
  showEvidence: boolean;
  activeCheck: string | null;   // nodeId of active knowledge check
  timerActive: boolean;
  timerSeconds: number;
  dialogueHistory: DialogueHistoryEntry[];

  // Evidence board
  evidenceBoardItems: EvidenceBoardItem[];

  // Replay
  isReplayMode: boolean;
  replaySource: string | null;

  // Actions
  setScene: (domain: number, act: number, scenes: StorySceneNode[]) => void;
  advanceNode: () => void;
  skipTypewriter: () => void;
  setTyping: (typing: boolean) => void;
  setShowEvidence: (show: boolean) => void;
  setActiveCheck: (nodeId: string | null) => void;
  answerCheck: (nodeId: string, isCorrect: boolean) => void;
  startTimer: (seconds: number) => void;
  tickTimer: () => void;
  stopTimer: () => void;
  setReplayMode: (isReplay: boolean, source?: string) => void;
  addToHistory: (entry: DialogueHistoryEntry) => void;
  goToNode: (index: number) => void;
  addToEvidenceBoard: (item: EvidenceBoardItem) => void;
  toggleEvidenceBoard: () => void;
  reset: () => void;
}

export const useStoryModeStore = create<StoryModeState>((set) => ({
  currentDomain: null,
  currentAct: null,
  currentNodeIndex: 0,
  scenes: [],
  isTyping: false,
  showEvidence: false,
  activeCheck: null,
  timerActive: false,
  timerSeconds: 0,
  dialogueHistory: [],
  evidenceBoardItems: [],
  isReplayMode: false,
  replaySource: null,

  setScene: (domain, act, scenes) =>
    set({
      currentDomain: domain,
      currentAct: act,
      scenes,
      currentNodeIndex: 0,
      isTyping: false,
      showEvidence: false,
      activeCheck: null,
      timerActive: false,
      timerSeconds: 0,
      dialogueHistory: [],
    }),

  advanceNode: () =>
    set((state) => ({
      currentNodeIndex: state.currentNodeIndex + 1,
      isTyping: false,
      showEvidence: false,
      activeCheck: null,
      timerActive: false,
      timerSeconds: 0,
    })),

  skipTypewriter: () => set({ isTyping: false }),

  setTyping: (isTyping) => set({ isTyping }),

  setShowEvidence: (showEvidence) => set({ showEvidence }),

  setActiveCheck: (activeCheck) => set({ activeCheck }),

  answerCheck: (_nodeId, _isCorrect) =>
    set((state) => ({
      activeCheck: null,
      currentNodeIndex: state.currentNodeIndex,
    })),

  startTimer: (seconds) => set({ timerActive: true, timerSeconds: seconds }),

  tickTimer: () =>
    set((state) => {
      if (!state.timerActive || state.timerSeconds <= 0) {
        return { timerActive: false, timerSeconds: 0 };
      }
      return { timerSeconds: state.timerSeconds - 1 };
    }),

  stopTimer: () => set({ timerActive: false, timerSeconds: 0 }),

  setReplayMode: (isReplayMode, replaySource) =>
    set({ isReplayMode, replaySource: replaySource || null }),

  addToHistory: (entry) =>
    set((state) => ({
      dialogueHistory: [...state.dialogueHistory, entry],
    })),

  goToNode: (index) =>
    set({
      currentNodeIndex: index,
      isTyping: false,
      showEvidence: false,
      activeCheck: null,
      timerActive: false,
      timerSeconds: 0,
    }),

  addToEvidenceBoard: (item) =>
    set((state) => {
      // Don't add duplicates
      if (state.evidenceBoardItems.some((e) => e.conceptName === item.conceptName)) {
        return state;
      }
      return { evidenceBoardItems: [...state.evidenceBoardItems, item] };
    }),

  toggleEvidenceBoard: () =>
    set((state) => ({ showEvidence: !state.showEvidence })),

  reset: () =>
    set({
      currentDomain: null,
      currentAct: null,
      currentNodeIndex: 0,
      scenes: [],
      isTyping: false,
      showEvidence: false,
      activeCheck: null,
      timerActive: false,
      timerSeconds: 0,
      dialogueHistory: [],
      evidenceBoardItems: [],
      isReplayMode: false,
      replaySource: null,
    }),
}));
