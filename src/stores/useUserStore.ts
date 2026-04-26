'use client';

import { create } from 'zustand';
import { User, PlayerProfile } from '@/lib/types';

interface UserState {
  user: User | null;
  profile: PlayerProfile | null;
  isLoading: boolean;
  setUser: (user: User | null) => void;
  setProfile: (profile: PlayerProfile | null) => void;
  setLoading: (loading: boolean) => void;
  updateXp: (amount: number) => void;
  updateStreak: (count: number) => void;
}

export const useUserStore = create<UserState>((set) => ({
  user: null,
  profile: null,
  isLoading: true,
  setUser: (user) =>
    set((state) => ({
      user,
      profile: user && state.user?.id === user.id ? state.profile : null,
      isLoading: false,
    })),
  setProfile: (profile) => set({ profile }),
  setLoading: (isLoading) => set({ isLoading }),
  updateXp: (amount) =>
    set((state) => {
      if (!state.user) return state;
      const newXp = state.user.xp + amount;
      const newLevel = Math.floor(1 + Math.sqrt(newXp / 100));
      return { user: { ...state.user, xp: newXp, level: newLevel } };
    }),
  updateStreak: (count) =>
    set((state) => {
      if (!state.user) return state;
      return { user: { ...state.user, streak_count: count } };
    }),
}));
