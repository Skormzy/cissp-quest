'use client';

import { useEffect, useState, useCallback } from 'react';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import { useUserStore } from '@/stores/useUserStore';
import VisualNovelEngineV2 from '@/components/story/VisualNovelEngineV2';
import {
  GHOST_POV_CHAPTERS,
  GHOST_SCENE_TITLES,
} from '@/lib/ghost-pov-content';

// ─── Scene selector ────────────────────────────────────────

function SceneSelector({
  activeScene,
  onSelect,
  completedScenes,
}: {
  activeScene: number;
  onSelect: (index: number) => void;
  completedScenes: number[];
}) {
  return (
    <div className="flex gap-3 flex-wrap">
      {GHOST_SCENE_TITLES.map((title, i) => {
        const isActive = i === activeScene;
        const isCompleted = completedScenes.includes(i);
        return (
          <motion.button
            key={i}
            onClick={() => onSelect(i)}
            className="flex-1 min-w-[140px] text-left px-4 py-3 rounded-xl text-xs transition-all"
            style={{
              background: isActive
                ? 'rgba(220,50,50,0.2)'
                : 'rgba(220,50,50,0.05)',
              border: isActive
                ? '1px solid rgba(220,50,50,0.5)'
                : '1px solid rgba(220,50,50,0.15)',
              color: isActive ? 'rgba(255,160,160,0.95)' : 'rgba(180,100,100,0.7)',
            }}
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
          >
            <div className="flex items-center gap-1.5 mb-1">
              <span
                className="text-[9px] font-bold px-1.5 py-0.5 rounded"
                style={{
                  background: isCompleted
                    ? 'rgba(50,200,50,0.2)'
                    : 'rgba(220,50,50,0.2)',
                  color: isCompleted ? '#4ade80' : 'rgba(255,120,120,0.8)',
                }}
              >
                {isCompleted ? '✓' : `0${i + 1}`}
              </span>
            </div>
            <p className="font-semibold leading-tight">{title}</p>
          </motion.button>
        );
      })}
    </div>
  );
}

// ─── Premium Banner ────────────────────────────────────────

function ClassifiedBanner() {
  return (
    <motion.div
      className="rounded-xl px-5 py-3 flex items-center gap-3"
      style={{
        background: 'rgba(220,50,50,0.08)',
        border: '1px solid rgba(220,50,50,0.25)',
      }}
      initial={{ opacity: 0, y: -8 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4 }}
    >
      <span className="text-lg">🔒</span>
      <div>
        <p className="text-xs font-bold" style={{ color: 'rgba(255,120,120,0.9)' }}>
          CLASSIFIED — PREMIUM FEATURE
        </p>
        <p className="text-xs" style={{ color: 'rgba(180,100,100,0.7)' }}>
          Ghost&apos;s perspective is available to all players during early access.
          Premium subscription will be required in a future update.
        </p>
      </div>
    </motion.div>
  );
}

// ─── Watermark ─────────────────────────────────────────────

function AdversaryWatermark() {
  return (
    <div
      className="fixed inset-0 pointer-events-none z-0 flex items-center justify-center select-none overflow-hidden"
      aria-hidden="true"
    >
      <div
        className="text-[120px] font-black tracking-widest opacity-[0.025] rotate-[-35deg] whitespace-nowrap"
        style={{ color: '#ef4444' }}
      >
        ADVERSARY PERSPECTIVE
      </div>
    </div>
  );
}

// ─── Page ──────────────────────────────────────────────────

export default function GhostPOVPage() {
  const { user, updateXp } = useUserStore();
  const [activeScene, setActiveScene] = useState(0);
  const [completedScenes, setCompletedScenes] = useState<number[]>([]);
  const [xpTotal, setXpTotal] = useState(0);
  const [sceneKeys, setSceneKeys] = useState<number[]>([0, 0, 0]);

  const chapter = GHOST_POV_CHAPTERS[activeScene];

  const handleSceneSelect = useCallback(
    (index: number) => {
      if (index === activeScene) return;
      setActiveScene(index);
    },
    [activeScene],
  );

  const handleChapterComplete = useCallback(() => {
    setCompletedScenes((prev) =>
      prev.includes(activeScene) ? prev : [...prev, activeScene],
    );
  }, [activeScene]);

  const handleXPEarned = useCallback(
    (amount: number) => {
      setXpTotal((prev) => prev + amount);
      updateXp(amount);
    },
    [updateXp],
  );

  const handleReplay = useCallback(() => {
    setSceneKeys((prev) => {
      const next = [...prev];
      next[activeScene] = next[activeScene] + 1;
      return next;
    });
  }, [activeScene]);

  return (
    <div className="max-w-3xl mx-auto space-y-6 relative">
      <AdversaryWatermark />

      {/* Back nav */}
      <div className="flex items-center justify-between relative z-10">
        <Link
          href="/app/story"
          className="text-xs inline-flex items-center gap-1 transition-opacity hover:opacity-80"
          style={{ color: 'rgba(180,100,100,0.7)' }}
        >
          ← Story Hub
        </Link>
        {xpTotal > 0 && (
          <span
            className="text-xs font-bold px-3 py-1 rounded-full"
            style={{
              background: 'rgba(255,215,0,0.1)',
              color: '#ffd700',
              border: '1px solid rgba(255,215,0,0.2)',
            }}
          >
            +{xpTotal} XP
          </span>
        )}
      </div>

      {/* Header */}
      <motion.div
        className="relative z-10"
        initial={{ opacity: 0, y: -16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
      >
        <div className="flex items-center gap-3 mb-1">
          <span className="text-2xl">🕵️</span>
          <div>
            <h1
              className="text-xl font-bold"
              style={{ color: 'rgba(255,160,160,0.95)' }}
            >
              Ghost&apos;s Files
            </h1>
            <p
              className="text-xs"
              style={{ color: 'rgba(180,100,100,0.7)' }}
            >
              Adversary Perspective — Inside the Meridian Breach
            </p>
          </div>
        </div>
        <p
          className="text-xs leading-relaxed mt-2 max-w-2xl"
          style={{ color: 'rgba(150,80,80,0.8)' }}
        >
          These scenes show the human element behind the Meridian breach through
          Ghost Holloway&apos;s eyes. This is not glorifying hacking — it is showing
          how organisations fail the people who try to protect them, and what
          the ISC² Code of Ethics requires when that happens.
        </p>
      </motion.div>

      {/* Classified banner */}
      <div className="relative z-10">
        <ClassifiedBanner />
      </div>

      {/* Scene selector */}
      <div className="relative z-10">
        <p
          className="text-[10px] font-bold uppercase tracking-widest mb-2"
          style={{ color: 'rgba(180,100,100,0.5)' }}
        >
          Classified Scenes
        </p>
        <SceneSelector
          activeScene={activeScene}
          onSelect={handleSceneSelect}
          completedScenes={completedScenes}
        />
      </div>

      {/* Scene title */}
      <div className="relative z-10">
        <div
          className="rounded-xl px-5 py-3"
          style={{
            background: 'rgba(220,50,50,0.06)',
            border: '1px solid rgba(220,50,50,0.2)',
          }}
        >
          <p
            className="text-[10px] font-bold uppercase tracking-widest mb-1"
            style={{ color: 'rgba(220,50,50,0.6)' }}
          >
            Now Playing
          </p>
          <h2
            className="text-sm font-bold"
            style={{ color: 'rgba(255,160,160,0.9)' }}
          >
            {GHOST_SCENE_TITLES[activeScene]}
          </h2>
        </div>
      </div>

      {/* Visual Novel Engine */}
      <div className="relative z-10">
        <AnimatePresence mode="wait">
          <motion.div
            key={`scene-${activeScene}-${sceneKeys[activeScene]}`}
            initial={{ opacity: 0, y: 16 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -16 }}
            transition={{ duration: 0.3 }}
          >
            <VisualNovelEngineV2
              key={`vne-${activeScene}-${sceneKeys[activeScene]}`}
              chapter={chapter}
              initialSceneIndex={0}
              playerName={user?.character_name || 'Alex'}
              onChapterComplete={handleChapterComplete}
              onXPEarned={handleXPEarned}
            />
          </motion.div>
        </AnimatePresence>
      </div>

      {/* Replay / Next Scene */}
      <div
        className="relative z-10 flex gap-3 justify-end pb-8"
      >
        <motion.button
          onClick={handleReplay}
          className="px-4 py-2 rounded-lg text-xs font-bold transition-all"
          style={{
            background: 'rgba(220,50,50,0.1)',
            border: '1px solid rgba(220,50,50,0.25)',
            color: 'rgba(255,120,120,0.8)',
          }}
          whileHover={{ scale: 1.02, background: 'rgba(220,50,50,0.18)' }}
          whileTap={{ scale: 0.98 }}
        >
          Replay Scene
        </motion.button>
        {activeScene < GHOST_POV_CHAPTERS.length - 1 && (
          <motion.button
            onClick={() => handleSceneSelect(activeScene + 1)}
            className="px-4 py-2 rounded-lg text-xs font-bold transition-all"
            style={{
              background: 'rgba(220,50,50,0.15)',
              border: '1px solid rgba(220,50,50,0.35)',
              color: 'rgba(255,160,160,0.9)',
            }}
            whileHover={{ scale: 1.02, background: 'rgba(220,50,50,0.22)' }}
            whileTap={{ scale: 0.98 }}
          >
            Next Scene →
          </motion.button>
        )}
      </div>
    </div>
  );
}
