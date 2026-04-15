'use client';

import { useState, useCallback, useEffect } from 'react';
import { VisualNovelEngineProps, StorySceneNode, EvidenceBoardItem } from '@/lib/story-types';
import { LOCATION_GRADIENTS, DOMAIN_LOCATIONS } from '@/lib/story-characters';
import { useStoryModeStore } from '@/stores/useStoryModeStore';
import DialogueRenderer from './DialogueRenderer';
import EvidencePanel from './EvidencePanel';
import KnowledgeCheckPopup from './KnowledgeCheckPopup';
import TimedDecisionOverlay from './TimedDecisionOverlay';
import ThinkLikeManagerPopup from './ThinkLikeManagerPopup';
import VisualAidDisplay from './VisualAidDisplay';
import TransitionOverlay from './TransitionOverlay';
import InteractiveImageDisplay from './InteractiveImageDisplay';
import EvidenceBoard from './EvidenceBoard';

// Reusable nav arrow button
function NavArrow({
  direction,
  onClick,
  visible,
}: {
  direction: 'left' | 'right';
  onClick: () => void;
  visible: boolean;
}) {
  // Always render the wrapper div to hold space; only show the button when visible
  return (
    <div className="shrink-0 w-12 flex items-center justify-center">
      {visible && (
        <button
          onClick={onClick}
          className="w-12 h-12 rounded-full flex items-center justify-center transition-all opacity-60 hover:opacity-100"
          style={{
            background: 'rgba(8, 12, 20, 0.7)',
            border: '1px solid rgba(0, 232, 255, 0.2)',
            color: '#00e8ff',
          }}
          onMouseEnter={(e) => {
            e.currentTarget.style.boxShadow = '0 0 15px rgba(0, 232, 255, 0.3)';
            e.currentTarget.style.borderColor = 'rgba(0, 232, 255, 0.6)';
          }}
          onMouseLeave={(e) => {
            e.currentTarget.style.boxShadow = 'none';
            e.currentTarget.style.borderColor = 'rgba(0, 232, 255, 0.2)';
          }}
          aria-label={direction === 'left' ? 'Previous node' : 'Next node'}
        >
          <svg width="18" height="18" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
            <path d={direction === 'left' ? 'M10 3L5 8L10 13' : 'M6 3L11 8L6 13'} />
          </svg>
        </button>
      )}
    </div>
  );
}

export default function VisualNovelEngine({
  scenes,
  playerName,
  onSceneComplete,
  onActComplete,
  onKnowledgeCheckAnswer,
  onConceptDiscovered,
  isReplayMode = false,
  domainId,
  initialNodeIndex = 0,
  onNodeChange,
}: VisualNovelEngineProps & { initialNodeIndex?: number; onNodeChange?: (index: number) => void }) {
  const [currentIndex, setCurrentIndex] = useState(initialNodeIndex);
  const [choiceResponse, setChoiceResponse] = useState<string | null>(null);
  const [showCompletion, setShowCompletion] = useState(false);
  const [isNodeTyping, setIsNodeTyping] = useState(false);
  const [skipSignal, setSkipSignal] = useState(0);

  const { evidenceBoardItems, showEvidence, addToEvidenceBoard, toggleEvidenceBoard } =
    useStoryModeStore();

  const locationKey = domainId ? DOMAIN_LOCATIONS[domainId] : 'new-york';
  const bgGradient = LOCATION_GRADIENTS[locationKey] || LOCATION_GRADIENTS['new-york'];

  const currentNode: StorySceneNode | undefined = scenes[currentIndex];

  const advance = useCallback(() => {
    setChoiceResponse(null);
    const nextIndex = currentIndex + 1;
    if (nextIndex >= scenes.length) {
      setShowCompletion(true);
      onActComplete?.();
    } else {
      if (currentNode) {
        onSceneComplete?.(currentNode.id);

        // Auto-add concepts to evidence board from certain node types
        const conceptName =
          (currentNode.type === 'knowledgeCheck' && currentNode.conceptName) ||
          (currentNode.type === 'interactiveImage' && currentNode.conceptName) ||
          (currentNode.type === 'thinkLikeManager' && currentNode.conceptName) ||
          (currentNode.type === 'timedDecision' && currentNode.conceptName);

        if (conceptName && domainId) {
          const item: EvidenceBoardItem = {
            conceptName,
            analogyName: conceptName,
            npcId: ('speaker' in currentNode && currentNode.speaker) || 'reeves',
            domainNumber: domainId,
            sceneId: currentNode.id,
          };
          addToEvidenceBoard(item);
          onConceptDiscovered?.(item);
        }
      }
      setCurrentIndex(nextIndex);
      onNodeChange?.(nextIndex);
    }
  }, [currentIndex, scenes.length, currentNode, onSceneComplete, onActComplete, domainId, addToEvidenceBoard, onConceptDiscovered, onNodeChange]);

  const handleChoice = useCallback((choiceIndex: number) => {
    if (!currentNode || currentNode.type !== 'dialogue' || !currentNode.choices) return;
    const choice = currentNode.choices[choiceIndex];
    if (choice.response) {
      setChoiceResponse(choice.response);
    } else {
      advance();
    }
  }, [currentNode, advance]);

  const handleChoiceResponseContinue = useCallback(() => {
    setChoiceResponse(null);
    advance();
  }, [advance]);

  const goBack = useCallback(() => {
    if (currentIndex > 0) {
      setChoiceResponse(null);
      setCurrentIndex(currentIndex - 1);
    }
  }, [currentIndex]);

  // Can the current node be advanced via click/keyboard?
  const canAdvance = !currentNode ? false
    : choiceResponse ? true
    : currentNode.type === 'dialogue' ? (!currentNode.choices || currentNode.choices.length === 0)
    : currentNode.type === 'evidence' || currentNode.type === 'visualAid' ? true
    : false;

  const handleNavigateForward = useCallback(() => {
    if (choiceResponse) {
      handleChoiceResponseContinue();
      return;
    }
    if (isNodeTyping) {
      setSkipSignal(s => s + 1);
      return;
    }
    if (canAdvance) {
      advance();
    }
  }, [choiceResponse, handleChoiceResponseContinue, isNodeTyping, canAdvance, advance]);

  const handleSceneClick = useCallback(() => {
    if (currentNode?.type !== 'dialogue' && !choiceResponse) return;
    handleNavigateForward();
  }, [currentNode, choiceResponse, handleNavigateForward]);

  // Reset typing state and skip signal when node changes
  useEffect(() => {
    setSkipSignal(0);
    if (currentNode?.type !== 'dialogue') {
      setIsNodeTyping(false);
    }
  }, [currentIndex, currentNode?.type]);

  // Keyboard navigation
  useEffect(() => {
    if (showCompletion) return;
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.target instanceof HTMLInputElement || e.target instanceof HTMLTextAreaElement) return;
      // Don't intercept Enter/Space on buttons — let them trigger naturally
      if (e.target instanceof HTMLButtonElement && (e.key === 'Enter' || e.key === ' ')) return;

      switch (e.key) {
        case 'ArrowRight':
        case ' ':
        case 'Enter':
          e.preventDefault();
          handleNavigateForward();
          break;
        case 'ArrowLeft':
          e.preventDefault();
          goBack();
          break;
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [handleNavigateForward, goBack, showCompletion]);

  if (showCompletion && !isReplayMode) {
    return (
      <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: '1px solid #00e8ff33' }}>
        <div className="text-5xl mb-4">🎖️</div>
        <h2 className="text-2xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Act Complete!</h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>Great work, {playerName}. Your progress has been saved.</p>
      </div>
    );
  }

  if (showCompletion && isReplayMode) {
    return (
      <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: '1px solid #00e8ff33' }}>
        <div className="text-4xl mb-3">🔁</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Replay Complete</h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>Scene replay finished.</p>
      </div>
    );
  }

  if (!currentNode) {
    return (
      <div className="text-center py-10">
        <p style={{ color: '#64748b' }}>No scenes to display.</p>
      </div>
    );
  }

  // Progress bar
  const progress = ((currentIndex + 1) / scenes.length) * 100;
  const showLeftArrow = currentIndex > 0;
  const showRightArrow = isNodeTyping || canAdvance;

  return (
    <div>
      {/* Progress bar + evidence board toggle */}
      <div className="mb-4 flex items-center gap-3">
        <div className="flex-1 h-1.5 rounded-full overflow-hidden" style={{ background: '#1e2d4a' }}>
          <div
            className="h-full rounded-full transition-all duration-300"
            style={{ width: `${progress}%`, background: '#00e8ff' }}
          />
        </div>
        <span className="text-[10px] font-mono" style={{ color: '#64748b' }}>
          {currentIndex + 1}/{scenes.length}
        </span>
        {evidenceBoardItems.length > 0 && (
          <button
            onClick={toggleEvidenceBoard}
            className="px-2 py-1 rounded-lg text-[10px] font-bold transition-all"
            style={{
              background: showEvidence ? '#00e8ff22' : '#111a2e',
              color: '#00e8ff',
              border: '1px solid #00e8ff33',
            }}
          >
            🔍 {evidenceBoardItems.length}
          </button>
        )}
      </div>

      {/* Desktop layout: arrows flanking the scene */}
      <div className="hidden md:flex items-center gap-3">
        <NavArrow direction="left" onClick={goBack} visible={showLeftArrow} />

        {/* Scene container */}
        <div
          className="flex-1 min-w-0 rounded-xl p-6 min-h-[400px]"
          style={{
            background: bgGradient,
            border: '1px solid #1e2d4a',
          }}
          onClick={handleSceneClick}
        >
          {/* Choice response overlay */}
          {choiceResponse && (
            <div
              className="rounded-xl p-5 mb-4 cursor-pointer"
              onClick={(e) => { e.stopPropagation(); handleChoiceResponseContinue(); }}
              style={{ background: '#111a2eee', border: '1px solid #00e8ff22' }}
            >
              <p className="text-sm" style={{ color: '#e2e8f0' }}>{choiceResponse}</p>
              <span className="text-xs mt-2 block animate-pulse" style={{ color: '#64748b' }}>Click to continue...</span>
            </div>
          )}

          {/* Render node */}
          {!choiceResponse && renderNode(currentNode, {
            playerName,
            onAdvance: advance,
            onChoice: handleChoice,
            onKnowledgeCheckAnswer,
            onTypingStateChange: setIsNodeTyping,
            skipSignal,
          })}
        </div>

        <NavArrow direction="right" onClick={handleNavigateForward} visible={showRightArrow} />
      </div>

      {/* Mobile layout: scene full-width, arrows below */}
      <div className="md:hidden">
        {/* Scene container */}
        <div
          className="rounded-xl p-6 min-h-[400px]"
          style={{
            background: bgGradient,
            border: '1px solid #1e2d4a',
          }}
          onClick={handleSceneClick}
        >
          {/* Choice response overlay */}
          {choiceResponse && (
            <div
              className="rounded-xl p-5 mb-4 cursor-pointer"
              onClick={(e) => { e.stopPropagation(); handleChoiceResponseContinue(); }}
              style={{ background: '#111a2eee', border: '1px solid #00e8ff22' }}
            >
              <p className="text-sm" style={{ color: '#e2e8f0' }}>{choiceResponse}</p>
              <span className="text-xs mt-2 block animate-pulse" style={{ color: '#64748b' }}>Click to continue...</span>
            </div>
          )}

          {/* Render node */}
          {!choiceResponse && renderNode(currentNode, {
            playerName,
            onAdvance: advance,
            onChoice: handleChoice,
            onKnowledgeCheckAnswer,
            onTypingStateChange: setIsNodeTyping,
            skipSignal,
          })}
        </div>

        {/* Bottom arrow row */}
        {(showLeftArrow || showRightArrow) && (
          <div className="flex justify-center gap-4 mt-3">
            <NavArrow direction="left" onClick={goBack} visible={showLeftArrow} />
            <NavArrow direction="right" onClick={handleNavigateForward} visible={showRightArrow} />
          </div>
        )}
      </div>

      {/* Evidence Board sidebar */}
      <EvidenceBoard
        items={evidenceBoardItems}
        isOpen={showEvidence}
        onClose={toggleEvidenceBoard}
        domainFilter={domainId}
      />
    </div>
  );
}

function renderNode(
  node: StorySceneNode,
  handlers: {
    playerName: string;
    onAdvance: () => void;
    onChoice: (index: number) => void;
    onKnowledgeCheckAnswer?: (nodeId: string, isCorrect: boolean) => void;
    onTypingStateChange?: (isTyping: boolean) => void;
    skipSignal?: number;
  },
) {
  switch (node.type) {
    case 'dialogue':
      return (
        <DialogueRenderer
          key={node.id}
          node={node}
          playerName={handlers.playerName}
          onAdvance={handlers.onAdvance}
          onChoice={handlers.onChoice}
          onTypingStateChange={handlers.onTypingStateChange}
          skipSignal={handlers.skipSignal}
        />
      );
    case 'evidence':
      return (
        <EvidencePanel
          key={node.id}
          node={node}
          playerName={handlers.playerName}
          onAdvance={handlers.onAdvance}
        />
      );
    case 'knowledgeCheck':
      return (
        <KnowledgeCheckPopup
          key={node.id}
          node={node}
          onAnswer={(isCorrect) => handlers.onKnowledgeCheckAnswer?.(node.id, isCorrect)}
          onAdvance={handlers.onAdvance}
        />
      );
    case 'timedDecision':
      return (
        <TimedDecisionOverlay
          key={node.id}
          node={node}
          onDecision={() => {}}
          onAdvance={handlers.onAdvance}
        />
      );
    case 'thinkLikeManager':
      return (
        <ThinkLikeManagerPopup
          key={node.id}
          node={node}
          onAnswer={(isCorrect) => handlers.onKnowledgeCheckAnswer?.(node.id, isCorrect)}
          onAdvance={handlers.onAdvance}
        />
      );
    case 'visualAid':
      return (
        <VisualAidDisplay
          key={node.id}
          node={node}
          playerName={handlers.playerName}
          onAdvance={handlers.onAdvance}
        />
      );
    case 'transition':
      return (
        <TransitionOverlay
          key={node.id}
          node={node}
          onComplete={handlers.onAdvance}
        />
      );
    case 'interactiveImage':
      return (
        <InteractiveImageDisplay
          key={node.id}
          node={node}
          playerName={handlers.playerName}
          onAdvance={handlers.onAdvance}
        />
      );
    default:
      return <p style={{ color: '#ef4444' }}>Unknown node type</p>;
  }
}
