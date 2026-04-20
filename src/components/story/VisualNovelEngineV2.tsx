'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  StoryScene,
  DomainChapter,
  NPC_REGISTRY_V2,
  NPCId,
} from '@/lib/story-types-v2';
import KnowledgeCheck from './KnowledgeCheck';

// ─── NPC Portrait ─────────────────────────────────────────

interface NPCPortraitProps {
  npcId: NPCId;
  side: 'left' | 'right';
  isActive: boolean;
  expression?: string;
}

function getNPCPortraitSrc(npcId: NPCId, expression?: string): string | undefined {
  if (npcId === 'alex') return undefined; // player character — no portrait
  const expr = expression || 'neutral';
  return `/images/story/npc_${npcId}_${expr}.webp`;
}

function NPCPortrait({ npcId, side, isActive, expression }: NPCPortraitProps) {
  const npc = NPC_REGISTRY_V2[npcId];
  const [fallbackToNeutral, setFallbackToNeutral] = useState(false);

  // Reset fallback when expression changes
  const prevExprRef = useRef(expression);
  if (prevExprRef.current !== expression) {
    prevExprRef.current = expression;
    if (fallbackToNeutral) setFallbackToNeutral(false);
  }

  const activeExpression = fallbackToNeutral ? undefined : expression;
  const portraitSrc = getNPCPortraitSrc(npcId, activeExpression);
  const useImage = !!portraitSrc;

  return (
    <motion.div
      className={`flex flex-col items-center gap-1 ${side === 'right' ? 'items-end' : ''}`}
      initial={{ opacity: 0, x: side === 'left' ? -20 : 20 }}
      animate={{
        opacity: isActive ? 1 : 0.45,
        x: 0,
        scale: isActive ? 1 : 0.94,
      }}
      transition={{ duration: 0.3 }}
    >
      {useImage ? (
        <div
          className="relative overflow-hidden rounded-xl"
          style={{
            width: 80,
            height: 120,
            border: `2px solid ${isActive ? npc.color : 'rgba(30,45,74,0.5)'}`,
            boxShadow: isActive ? `0 0 20px ${npc.color}55` : 'none',
            transition: 'box-shadow 0.3s, border-color 0.3s',
          }}
        >
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={portraitSrc}
            alt={npc.name}
            onError={() => {
              if (!fallbackToNeutral) setFallbackToNeutral(true);
            }}
            className="w-full h-full object-cover object-top"
          />
          {!isActive && (
            <div className="absolute inset-0" style={{ background: 'rgba(0,0,0,0.4)' }} />
          )}
        </div>
      ) : (
        <div
          className="w-16 h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center text-3xl md:text-4xl"
          style={{
            background: `${npc.color}22`,
            border: `2px solid ${isActive ? npc.color : 'rgba(30,45,74,0.5)'}`,
            boxShadow: isActive ? `0 0 20px ${npc.color}44` : 'none',
            transition: 'box-shadow 0.3s, border-color 0.3s',
          }}
        >
          {npc.emoji}
        </div>
      )}
      <AnimatePresence>
        {isActive && (
          <motion.span
            className="text-[10px] font-bold px-2 py-0.5 rounded-full whitespace-nowrap"
            style={{ background: npc.color, color: '#080c14' }}
            initial={{ opacity: 0, y: 4 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 4 }}
            transition={{ duration: 0.15 }}
          >
            {npc.name.split(' ').slice(0, 2).join(' ')}
          </motion.span>
        )}
      </AnimatePresence>
    </motion.div>
  );
}

// ─── Location Title Card ──────────────────────────────────

function LocationTitleCard({
  chapter,
  onDone,
}: {
  chapter: DomainChapter;
  onDone: () => void;
}) {
  useEffect(() => {
    const t = setTimeout(onDone, 2200);
    return () => clearTimeout(t);
  }, [onDone]);

  return (
    <motion.div
      className="fixed inset-0 z-50 flex flex-col items-center justify-center"
      style={{ background: chapter.background }}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      transition={{ duration: 0.5 }}
    >
      <motion.div
        className="text-center px-8"
        initial={{ opacity: 0, y: 24 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.3, duration: 0.5 }}
      >
        <p
          className="text-5xl mb-4"
          style={{ textShadow: '0 0 40px rgba(0,232,255,0.6)' }}
        >
          {chapter.locationEmoji}
        </p>
        <h1
          className="text-2xl md:text-3xl font-extrabold mb-2"
          style={{ color: '#e2e8f0', textShadow: '0 2px 20px rgba(0,0,0,0.8)' }}
        >
          {chapter.location}
        </h1>
        <p className="text-sm font-medium" style={{ color: '#00e8ff' }}>
          Domain {chapter.domainId}: {chapter.domainName}
        </p>
      </motion.div>
    </motion.div>
  );
}

// ─── Memory Hack Modal ────────────────────────────────────

function MemoryHackModal({
  title,
  body,
  onClose,
}: {
  title: string;
  body: string;
  onClose: () => void;
}) {
  return (
    <motion.div
      className="fixed inset-0 z-50 flex items-center justify-center p-4"
      style={{ background: 'rgba(8,12,20,0.9)', backdropFilter: 'blur(6px)' }}
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
    >
      <motion.div
        className="w-full max-w-lg rounded-2xl overflow-hidden"
        initial={{ scale: 0.9, y: 24 }}
        animate={{ scale: 1, y: 0 }}
        exit={{ scale: 0.9, y: 24 }}
        transition={{ type: 'spring', stiffness: 300, damping: 26 }}
        style={{
          background: 'linear-gradient(135deg, #0d1220, #111a2e)',
          border: '1px solid rgba(255,215,0,0.3)',
          boxShadow: '0 0 60px rgba(255,215,0,0.08)',
        }}
      >
        {/* Header */}
        <div
          className="px-6 py-4 flex items-center gap-3"
          style={{
            background: 'rgba(255,215,0,0.06)',
            borderBottom: '1px solid rgba(255,215,0,0.15)',
          }}
        >
          <span className="text-xl">🧠</span>
          <div>
            <p className="text-xs font-bold uppercase tracking-widest" style={{ color: '#ffd700' }}>
              Memory Hack
            </p>
            <p className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>
              {title}
            </p>
          </div>
        </div>

        {/* Body */}
        <div className="p-6">
          <pre
            className="text-sm leading-relaxed whitespace-pre-wrap font-sans"
            style={{ color: '#e2e8f0' }}
          >
            {body}
          </pre>

          <motion.button
            onClick={onClose}
            className="mt-6 w-full py-3 rounded-xl text-sm font-bold"
            style={{
              background: 'rgba(255,215,0,0.12)',
              border: '1px solid rgba(255,215,0,0.3)',
              color: '#ffd700',
            }}
            whileHover={{ scale: 1.02, boxShadow: '0 0 20px rgba(255,215,0,0.2)' }}
            whileTap={{ scale: 0.98 }}
          >
            Got it — lock it in
          </motion.button>
        </div>
      </motion.div>
    </motion.div>
  );
}

// ─── Typewriter Text ──────────────────────────────────────

function TypewriterText({
  text,
  onDone,
  skipSignal,
}: {
  text: string;
  onDone: () => void;
  skipSignal: number;
}) {
  const [displayed, setDisplayed] = useState('');
  const [done, setDone] = useState(false);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const completeNow = useCallback(() => {
    if (intervalRef.current) clearInterval(intervalRef.current);
    setDisplayed(text);
    setDone(true);
    onDone();
  }, [text, onDone]);

  useEffect(() => {
    setDisplayed('');
    setDone(false);
    let i = 0;
    intervalRef.current = setInterval(() => {
      i++;
      setDisplayed(text.slice(0, i));
      if (i >= text.length) {
        if (intervalRef.current) clearInterval(intervalRef.current);
        setDone(true);
        onDone();
      }
    }, 22);
    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
    };
    // Only run when text changes
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [text]);

  // Skip when skipSignal increments
  useEffect(() => {
    if (skipSignal > 0 && !done) {
      completeNow();
    }
  }, [skipSignal, done, completeNow]);

  return (
    <span>
      {displayed}
      {!done && (
        <span
          className="inline-block w-0.5 h-4 ml-0.5 align-middle animate-pulse"
          style={{ background: '#00e8ff' }}
        />
      )}
    </span>
  );
}

// ─── Choice Panel ─────────────────────────────────────────

interface ChoicePanelProps {
  choices: NonNullable<StoryScene['choices']>;
  onSelect: (index: number) => void;
  responded: string | null;
}

function ChoicePanel({ choices, onSelect, responded }: ChoicePanelProps) {
  if (responded !== null) {
    return (
      <motion.div
        className="mt-4 p-4 rounded-xl text-sm leading-relaxed"
        style={{
          background: 'rgba(0,232,255,0.06)',
          border: '1px solid rgba(0,232,255,0.15)',
          color: '#94a3b8',
        }}
        initial={{ opacity: 0, y: 8 }}
        animate={{ opacity: 1, y: 0 }}
      >
        <p className="font-semibold text-xs mb-1" style={{ color: '#00e8ff' }}>
          Response:
        </p>
        {responded}
      </motion.div>
    );
  }

  return (
    <motion.div
      className="mt-4 space-y-2"
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.25 }}
    >
      {choices.map((choice, i) => (
        <motion.button
          key={i}
          onClick={() => onSelect(i)}
          className="w-full text-left px-4 py-3 rounded-xl text-sm"
          style={{
            background: 'rgba(0,232,255,0.06)',
            border: '1px solid rgba(0,232,255,0.2)',
            color: '#e2e8f0',
          }}
          whileHover={{
            scale: 1.01,
            background: 'rgba(0,232,255,0.12)',
            borderColor: 'rgba(0,232,255,0.4)',
          }}
          whileTap={{ scale: 0.99 }}
        >
          <span className="font-bold mr-2" style={{ color: '#00e8ff' }}>
            {String.fromCharCode(65 + i)}.
          </span>
          {choice.text}
          {choice.xpBonus > 0 && (
            <span className="ml-2 text-[10px] font-bold" style={{ color: '#ffd700' }}>
              +{choice.xpBonus} XP
            </span>
          )}
        </motion.button>
      ))}
    </motion.div>
  );
}

// ─── Evidence Scene ───────────────────────────────────────

function EvidenceScene({
  scene,
  onContinue,
}: {
  scene: StoryScene;
  onContinue: () => void;
}) {
  return (
    <div className="space-y-4">
      {/* Evidence header */}
      <div
        className="px-4 py-2 rounded-lg flex items-center gap-2 text-xs font-bold uppercase tracking-widest"
        style={{
          background: 'rgba(239,68,68,0.1)',
          border: '1px solid rgba(239,68,68,0.3)',
          color: '#ef4444',
        }}
      >
        <span>🔍</span>
        CLASSIFIED EVIDENCE
      </div>

      {/* NPC dialogue about the evidence */}
      <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
        {scene.dialogue}
      </p>

      <motion.button
        onClick={onContinue}
        className="mt-4 w-full py-3 rounded-xl text-sm font-bold"
        style={{ background: '#00e8ff', color: '#080c14' }}
        whileHover={{ scale: 1.02, boxShadow: '0 0 20px rgba(0,232,255,0.4)' }}
        whileTap={{ scale: 0.98 }}
      >
        Continue
      </motion.button>
    </div>
  );
}

// ─── Props ────────────────────────────────────────────────

export interface VisualNovelEngineV2Props {
  chapter: DomainChapter;
  initialSceneIndex?: number;
  playerName: string;
  onSceneComplete?: (sceneId: string, sceneIndex: number) => void;
  onChapterComplete?: () => void;
  onXPEarned?: (amount: number) => void;
}

// ─── Main Engine ──────────────────────────────────────────

export default function VisualNovelEngineV2({
  chapter,
  initialSceneIndex = 0,
  playerName,
  onSceneComplete,
  onChapterComplete,
  onXPEarned,
}: VisualNovelEngineV2Props) {
  const [showLocationCard, setShowLocationCard] = useState(initialSceneIndex === 0);
  const [currentIndex, setCurrentIndex] = useState(initialSceneIndex);
  const [textDone, setTextDone] = useState(false);
  const [skipSignal, setSkipSignal] = useState(0);
  const [choiceResponse, setChoiceResponse] = useState<string | null>(null);
  const [showMemoryHack, setShowMemoryHack] = useState(false);
  const [showKnowledgeCheck, setShowKnowledgeCheck] = useState(false);
  const [kcCompleted, setKcCompleted] = useState(false);
  const [chapterDone, setChapterDone] = useState(false);

  const scenes = chapter.scenes;
  const scene = scenes[currentIndex];

  // Substitute {player} in dialogue
  const processDialogue = (text: string) =>
    text.replace(/\{player\}/g, playerName);

  const advanceToNextScene = useCallback(() => {
    const nextIndex = currentIndex + 1;
    if (nextIndex >= scenes.length) {
      setChapterDone(true);
      onChapterComplete?.();
      return;
    }
    onSceneComplete?.(scene.id, currentIndex);
    if (scene.xpReward && scene.xpReward > 0) {
      onXPEarned?.(scene.xpReward);
    }
    setCurrentIndex(nextIndex);
    setTextDone(false);
    setSkipSignal(0);
    setChoiceResponse(null);
    setShowMemoryHack(false);
    setShowKnowledgeCheck(false);
    setKcCompleted(false);
  }, [currentIndex, scenes.length, scene, onSceneComplete, onChapterComplete, onXPEarned]);

  const handleContinue = useCallback(() => {
    if (!textDone) {
      // Skip typewriter
      setSkipSignal((s) => s + 1);
      return;
    }
    // For scenes with knowledge checks that haven't been dismissed
    if (scene.knowledgeCheck && !kcCompleted) {
      setShowKnowledgeCheck(true);
      return;
    }
    // For memory hack scenes, show the overlay first
    if (scene.type === 'memory_hack' && !showMemoryHack) {
      setShowMemoryHack(true);
      return;
    }
    // If choice response is visible, advance after that
    if (choiceResponse) {
      advanceToNextScene();
      return;
    }
    // For scenes with choices, don't advance via click — wait for choice
    if (scene.type === 'choice' && !choiceResponse) return;

    advanceToNextScene();
  }, [
    textDone,
    scene,
    kcCompleted,
    showMemoryHack,
    choiceResponse,
    advanceToNextScene,
  ]);

  const handleChoice = useCallback(
    (index: number) => {
      if (!scene.choices) return;
      const choice = scene.choices[index];
      setChoiceResponse(choice.response);
      if (choice.xpBonus > 0) {
        onXPEarned?.(choice.xpBonus);
      }
    },
    [scene, onXPEarned],
  );

  const handleKnowledgeCheckComplete = useCallback(
    (isCorrect: boolean) => {
      setShowKnowledgeCheck(false);
      setKcCompleted(true);
      if (isCorrect) {
        onXPEarned?.(50);
      }
    },
    [onXPEarned],
  );

  // Keyboard navigation
  useEffect(() => {
    if (showLocationCard || showMemoryHack || showKnowledgeCheck || chapterDone) return;
    const handler = (e: KeyboardEvent) => {
      if (e.target instanceof HTMLInputElement || e.target instanceof HTMLTextAreaElement) return;
      if (e.target instanceof HTMLButtonElement && (e.key === 'Enter' || e.key === ' ')) return;
      switch (e.key) {
        case 'ArrowRight':
        case ' ':
        case 'Enter':
          e.preventDefault();
          handleContinue();
          break;
      }
    };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, [showLocationCard, showMemoryHack, showKnowledgeCheck, chapterDone, handleContinue]);

  // Progress
  const progress = ((currentIndex + 1) / scenes.length) * 100;

  const speakerNPC = scene?.speaker && scene.speaker !== 'narrator'
    ? NPC_REGISTRY_V2[scene.speaker as NPCId]
    : null;

  // ── Chapter complete screen ──────────────────────────────
  if (chapterDone) {
    return (
      <motion.div
        className="rounded-2xl p-8 text-center space-y-4"
        style={{ background: '#111a2e', border: '1px solid rgba(0,232,255,0.2)' }}
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
      >
        <div className="text-5xl">{chapter.locationEmoji}</div>
        <h2 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>
          Chapter Complete
        </h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>
          Domain {chapter.domainId}: {chapter.domainName} — {chapter.location}
        </p>
        <div
          className="inline-flex items-center gap-2 px-4 py-2 rounded-full text-sm font-bold"
          style={{ background: 'rgba(0,232,255,0.1)', color: '#00e8ff', border: '1px solid rgba(0,232,255,0.3)' }}
        >
          🏅 Domain Briefing Complete
        </div>
      </motion.div>
    );
  }

  return (
    <div className="relative">
      {/* Location title card */}
      <AnimatePresence>
        {showLocationCard && (
          <LocationTitleCard
            chapter={chapter}
            onDone={() => setShowLocationCard(false)}
          />
        )}
      </AnimatePresence>

      {/* Memory hack overlay */}
      <AnimatePresence>
        {showMemoryHack && scene.memoryHack && (
          <MemoryHackModal
            title={scene.memoryHack.title}
            body={scene.memoryHack.body}
            onClose={() => {
              setShowMemoryHack(false);
              advanceToNextScene();
            }}
          />
        )}
      </AnimatePresence>

      {/* Knowledge check overlay */}
      <AnimatePresence>
        {showKnowledgeCheck && scene.knowledgeCheck && (
          <KnowledgeCheck
            data={scene.knowledgeCheck}
            onComplete={handleKnowledgeCheckComplete}
            xpReward={50}
          />
        )}
      </AnimatePresence>

      {/* Progress bar */}
      <div className="mb-4 flex items-center gap-3">
        <div
          className="flex-1 h-1.5 rounded-full overflow-hidden"
          style={{ background: '#1e2d4a' }}
        >
          <motion.div
            className="h-full rounded-full"
            style={{ background: '#00e8ff' }}
            animate={{ width: `${progress}%` }}
            transition={{ duration: 0.4 }}
          />
        </div>
        <span className="text-[10px] font-mono" style={{ color: '#64748b' }}>
          {currentIndex + 1}/{scenes.length}
        </span>
      </div>

      {/* Scene container */}
      <AnimatePresence mode="wait">
        <motion.div
          key={currentIndex}
          className="rounded-2xl overflow-hidden"
          style={{
            background: scene.background,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            backgroundRepeat: 'no-repeat',
            border: '1px solid rgba(30,45,74,0.8)',
            minHeight: '420px',
          }}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.25 }}
        >
          {/* Location badge */}
          <div className="absolute top-4 left-4 z-10">
            <div
              className="px-3 py-1 rounded-lg text-xs font-medium backdrop-blur-sm"
              style={{
                background: 'rgba(0,0,0,0.55)',
                border: '1px solid rgba(0,232,255,0.25)',
                color: '#00e8ff',
              }}
            >
              📍 {scene.location}
            </div>
          </div>

          {/* Scene type badge */}
          {scene.type === 'tlatm' && (
            <div className="absolute top-4 right-4 z-10">
              <div
                className="px-3 py-1 rounded-lg text-[10px] font-bold backdrop-blur-sm"
                style={{
                  background: 'rgba(255,215,0,0.15)',
                  border: '1px solid rgba(255,215,0,0.4)',
                  color: '#ffd700',
                }}
              >
                💼 THINK LIKE A MANAGER
              </div>
            </div>
          )}

          {/* NPC portraits */}
          <div className="absolute bottom-48 left-0 right-0 flex justify-between px-6 pointer-events-none">
            {scene.leftNPC && (
              <NPCPortrait
                npcId={scene.leftNPC}
                side="left"
                isActive={scene.speaker === scene.leftNPC}
                expression={scene.speaker === scene.leftNPC ? scene.speakerExpression : undefined}
              />
            )}
            {/* Push right portrait to far right */}
            <div className="flex-1" />
            {scene.rightNPC && (
              <NPCPortrait
                npcId={scene.rightNPC}
                side="right"
                isActive={scene.speaker === scene.rightNPC}
                expression={scene.speaker === scene.rightNPC ? scene.speakerExpression : undefined}
              />
            )}
          </div>

          {/* Dialogue box */}
          <div
            className="absolute bottom-0 left-0 right-0"
            style={{ background: 'linear-gradient(to top, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.7) 60%, transparent 100%)' }}
            onClick={
              scene.type === 'evidence'
                ? undefined
                : () => handleContinue()
            }
          >
            <div className="px-6 pb-6 pt-2">
              {/* Speaker name */}
              {speakerNPC && (
                <div className="mb-2">
                  <span
                    className="px-3 py-1 rounded-t-lg text-xs font-bold"
                    style={{ background: speakerNPC.color, color: '#080c14' }}
                  >
                    {speakerNPC.name}
                  </span>
                </div>
              )}
              {scene.speaker === 'narrator' && (
                <div className="mb-2">
                  <span
                    className="px-3 py-1 rounded-t-lg text-xs font-bold"
                    style={{ background: '#1e2d4a', color: '#94a3b8' }}
                  >
                    NARRATOR
                  </span>
                </div>
              )}

              {/* Dialogue content */}
              <div
                className="rounded-xl p-4"
                style={{
                  background: 'rgba(13,18,32,0.92)',
                  border: '1px solid rgba(30,45,74,0.6)',
                  backdropFilter: 'blur(8px)',
                }}
              >
                {/* Evidence scenes have their own renderer */}
                {scene.type === 'evidence' ? (
                  <EvidenceScene scene={scene} onContinue={advanceToNextScene} />
                ) : (
                  <>
                    <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
                      <TypewriterText
                        text={processDialogue(scene.dialogue)}
                        onDone={() => setTextDone(true)}
                        skipSignal={skipSignal}
                      />
                    </p>

                    {/* Choices */}
                    {textDone && scene.choices && (
                      <ChoicePanel
                        choices={scene.choices}
                        onSelect={handleChoice}
                        responded={choiceResponse}
                      />
                    )}

                    {/* Continue hint — not shown for choice scenes awaiting selection */}
                    {textDone &&
                      !showKnowledgeCheck &&
                      !showMemoryHack &&
                      (scene.type !== 'choice' || choiceResponse !== null) && (
                        <motion.p
                          className="text-[10px] text-center mt-3 animate-pulse select-none"
                          style={{ color: '#475569' }}
                          initial={{ opacity: 0 }}
                          animate={{ opacity: 1 }}
                          transition={{ delay: 0.5 }}
                        >
                          {scene.type === 'memory_hack'
                            ? '▼ Tap to open Memory Hack'
                            : scene.knowledgeCheck && !kcCompleted
                            ? '▼ Tap to answer the Knowledge Check'
                            : '▼ Tap to continue'}
                        </motion.p>
                      )}
                  </>
                )}
              </div>
            </div>
          </div>
        </motion.div>
      </AnimatePresence>

      {/* Nav: back/forward arrows below scene on mobile */}
      <div className="flex justify-between items-center mt-3 md:hidden">
        <button
          onClick={() => {
            if (currentIndex > 0) {
              setCurrentIndex((i) => i - 1);
              setTextDone(false);
              setSkipSignal(0);
              setChoiceResponse(null);
              setShowKnowledgeCheck(false);
              setKcCompleted(false);
            }
          }}
          disabled={currentIndex === 0}
          className="px-4 py-2 rounded-lg text-xs font-bold transition-opacity disabled:opacity-20"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#94a3b8' }}
        >
          ← Back
        </button>
        <button
          onClick={handleContinue}
          className="px-4 py-2 rounded-lg text-xs font-bold transition-all"
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          {textDone ? 'Continue →' : 'Skip →'}
        </button>
      </div>
    </div>
  );
}
