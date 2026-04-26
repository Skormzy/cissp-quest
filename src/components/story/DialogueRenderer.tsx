'use client';

import { useState, useEffect, useCallback, useRef } from 'react';
import CharacterPortrait from './portraits/CharacterPortrait';
import { DialogueNode } from '@/lib/story-types';
import { NPC_REGISTRY } from '@/lib/story-characters';
import { useUserStore } from '@/stores/useUserStore';
import { substituteTokens } from '@/lib/player-tokens';

interface DialogueRendererProps {
  node: DialogueNode;
  playerName: string;
  onAdvance: () => void;
  onChoice?: (choiceIndex: number) => void;
  onTypingStateChange?: (isTyping: boolean) => void;
  skipSignal?: number;
}

const CHAR_DELAY = 12; // ms per character

export default function DialogueRenderer({ node, playerName, onAdvance, onChoice, onTypingStateChange, skipSignal }: DialogueRendererProps) {
  const profile = useUserStore((s) => s.profile);
  const [displayedText, setDisplayedText] = useState('');
  const [isTyping, setIsTyping] = useState(true);

  const typingCallbackRef = useRef(onTypingStateChange);
  typingCallbackRef.current = onTypingStateChange;

  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const skippedTextRef = useRef<string | null>(null);

  const tokens = profile
    ? {
        display_name:       profile.display_name,
        pronoun_subject:    profile.pronoun_subject,
        pronoun_object:     profile.pronoun_object,
        pronoun_possessive: profile.pronoun_possessive,
        pronoun_reflexive:  profile.pronoun_reflexive,
      }
    : {
        display_name:       playerName,
        pronoun_subject:    'they',
        pronoun_object:     'them',
        pronoun_possessive: 'their',
        pronoun_reflexive:  'themself',
      };
  const fullText = substituteTokens(node.text.replace(/\{player\}/g, tokens.display_name), tokens);

  // Shared skip logic: clear interval, mark text as skipped, show full text
  const skipTypewriter = useCallback(() => {
    if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
    skippedTextRef.current = fullText;
    setDisplayedText(fullText);
    setIsTyping(false);
    typingCallbackRef.current?.(false);
  }, [fullText]);

  // Typewriter effect — restarts only when fullText changes to a NEW value
  useEffect(() => {
    // If this exact text was manually skipped, keep it fully displayed
    if (skippedTextRef.current === fullText) {
      return;
    }
    skippedTextRef.current = null;

    setDisplayedText('');
    setIsTyping(true);
    typingCallbackRef.current?.(true);
    let index = 0;
    const id = setInterval(() => {
      index++;
      setDisplayedText(fullText.slice(0, index));
      if (index >= fullText.length) {
        clearInterval(id);
        if (intervalRef.current === id) intervalRef.current = null;
        setIsTyping(false);
        typingCallbackRef.current?.(false);
      }
    }, CHAR_DELAY);
    intervalRef.current = id;
    return () => {
      clearInterval(id);
      if (intervalRef.current === id) intervalRef.current = null;
    };
  }, [fullText]);

  // Handle skip signal from parent (keyboard/arrow navigation)
  const skipSignalRef = useRef(skipSignal ?? 0);
  useEffect(() => {
    if (skipSignal !== undefined && skipSignal !== skipSignalRef.current && skipSignal > 0) {
      skipSignalRef.current = skipSignal;
      skipTypewriter();
    }
  }, [skipSignal, skipTypewriter]);

  const handleClick = useCallback((e: React.MouseEvent) => {
    e.stopPropagation();
    if (isTyping) {
      skipTypewriter();
    } else if (!node.choices || node.choices.length === 0) {
      onAdvance();
    }
  }, [isTyping, skipTypewriter, node.choices, onAdvance]);

  const speakerNpc = NPC_REGISTRY[node.speaker === 'player' ? 'player' : node.speaker] || null;
  const speakerName = node.speaker === 'player' ? tokens.display_name : (speakerNpc?.name || node.speaker);
  const accentColor = speakerNpc?.accentColor || '#00e8ff';

  return (
    <div className="relative cursor-pointer" onClick={handleClick}>
      {/* Portrait row */}
      <div className="flex items-end justify-between mb-3 px-2">
        <div className="w-20 h-20">
          {node.leftCharacter && (
            <CharacterPortrait
              characterId={node.leftCharacter}
              expression={node.leftExpression as any || 'neutral'}
              size={80}
            />
          )}
        </div>
        <div className="w-20 h-20">
          {node.rightCharacter && (
            <CharacterPortrait
              characterId={node.rightCharacter}
              expression={node.rightExpression as any || 'neutral'}
              size={80}
              flipped
            />
          )}
        </div>
      </div>

      {/* Speech bubble */}
      <div
        className="rounded-xl p-5 relative"
        style={{
          background: '#111a2e',
          border: `1px solid ${accentColor}33`,
          boxShadow: `0 0 20px ${accentColor}11`,
        }}
      >
        {/* Speaker name tag */}
        <div className="flex items-center gap-2 mb-2">
          <span
            className="text-xs font-bold px-2 py-0.5 rounded-full"
            style={{ background: `${accentColor}22`, color: accentColor }}
          >
            {speakerName}
          </span>
          {node.speakerSide && (
            <div
              className="w-0 h-0"
              style={{
                borderLeft: node.speakerSide === 'left' ? `6px solid ${accentColor}` : '6px solid transparent',
                borderRight: node.speakerSide === 'right' ? `6px solid ${accentColor}` : '6px solid transparent',
                borderBottom: '6px solid transparent',
                borderTop: '6px solid transparent',
              }}
            />
          )}
        </div>

        {/* Dialogue text */}
        <p className="text-sm leading-relaxed" style={{ color: '#e2e8f0' }}>
          {displayedText}
          {isTyping && (
            <span className="inline-block w-0.5 h-4 ml-0.5 animate-pulse" style={{ background: accentColor }} />
          )}
        </p>

        {/* Click to continue hint */}
        {!isTyping && (!node.choices || node.choices.length === 0) && (
          <div className="mt-3 text-right">
            <span className="text-xs animate-pulse" style={{ color: '#64748b' }}>Click to continue...</span>
          </div>
        )}
      </div>

      {/* Choices */}
      {!isTyping && node.choices && node.choices.length > 0 && (
        <div className="mt-3 space-y-2">
          {node.choices.map((choice, i) => (
            <button
              key={i}
              onClick={(e) => {
                e.stopPropagation();
                onChoice?.(i);
              }}
              className="w-full text-left px-4 py-3 rounded-lg text-sm transition-all hover:scale-[1.01]"
              style={{
                background: '#0d1220',
                border: '1px solid #1e2d4a',
                color: '#e2e8f0',
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.borderColor = accentColor;
                e.currentTarget.style.boxShadow = `0 0 10px ${accentColor}22`;
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.borderColor = '#1e2d4a';
                e.currentTarget.style.boxShadow = 'none';
              }}
            >
              <span className="font-bold mr-2" style={{ color: accentColor }}>
                {String.fromCharCode(65 + i)}.
              </span>
              {choice.text}
              {choice.xpBonus && choice.xpBonus > 0 && (
                <span className="ml-2 text-xs" style={{ color: '#ffd700' }}>+{choice.xpBonus} XP</span>
              )}
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
