'use client';

import { useState, useEffect, useCallback } from 'react';
import { StoryScene, StoryChoice } from '@/lib/types';

interface VisualNovelSceneProps {
  scene: StoryScene;
  playerName: string;
  onContinue: () => void;
  onChoice?: (choice: StoryChoice) => void;
}

const BG_GRADIENTS: Record<string, string> = {
  'Nexus HQ': 'linear-gradient(135deg, #0a0a2e, #1a1a4e, #0d0d3a)',
  'Data Vault': 'linear-gradient(135deg, #0a1a0a, #1a3a1a, #0d2d0d)',
  'Server Farm': 'linear-gradient(135deg, #1a1a2e, #2a2a4e, #0d0d3a)',
  'Cable Station': 'linear-gradient(135deg, #0a2a2a, #1a4a3a, #0d3d2d)',
  'Office': 'linear-gradient(135deg, #2a1a0a, #4a3a1a, #3d2d0d)',
  'Forensics Lab': 'linear-gradient(135deg, #1a0a2a, #3a1a4a, #2d0d3d)',
  'SOC War Room': 'linear-gradient(135deg, #2a0a0a, #4a1a1a, #3d0d0d)',
  'Dev Lab': 'linear-gradient(135deg, #0a1a2a, #1a3a4a, #0d2d3d)',
};

export default function VisualNovelScene({ scene, playerName, onContinue, onChoice }: VisualNovelSceneProps) {
  const [displayedText, setDisplayedText] = useState('');
  const [isTyping, setIsTyping] = useState(true);
  const [showChoices, setShowChoices] = useState(false);

  const fullText = scene.dialogue.replace('{player}', playerName);
  const bgGradient = BG_GRADIENTS[scene.background] || BG_GRADIENTS['Nexus HQ'];

  useEffect(() => {
    setDisplayedText('');
    setIsTyping(true);
    setShowChoices(false);

    let i = 0;
    const timer = setInterval(() => {
      i++;
      setDisplayedText(fullText.slice(0, i));
      if (i >= fullText.length) {
        clearInterval(timer);
        setIsTyping(false);
        if (scene.type === 'choice') {
          setShowChoices(true);
        }
      }
    }, 25);

    return () => clearInterval(timer);
  }, [scene, fullText]);

  const handleClick = useCallback(() => {
    if (isTyping) {
      setDisplayedText(fullText);
      setIsTyping(false);
      if (scene.type === 'choice') {
        setShowChoices(true);
      }
    } else if (scene.type !== 'choice') {
      onContinue();
    }
  }, [isTyping, fullText, scene.type, onContinue]);

  return (
    <div
      className="relative w-full rounded-xl overflow-hidden cursor-pointer select-none"
      style={{ minHeight: '400px', maxHeight: '500px', background: bgGradient }}
      onClick={handleClick}
    >
      {/* Location badge */}
      <div className="absolute top-4 left-4 z-10">
        <div className="px-3 py-1.5 rounded-lg text-xs font-medium backdrop-blur-sm" style={{ background: 'rgba(0, 0, 0, 0.5)', color: '#00e8ff', border: '1px solid rgba(0, 232, 255, 0.3)' }}>
          📍 {scene.locationName}
        </div>
      </div>

      {/* Character portraits */}
      <div className="absolute bottom-28 left-0 right-0 flex justify-between px-8 pointer-events-none">
        {/* Left character */}
        {scene.leftCharacter && (
          <div className={`flex flex-col items-center transition-all duration-300 ${scene.speakerSide === 'left' ? 'opacity-100 scale-100' : 'opacity-60 scale-95'}`}>
            <div className="w-16 h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center text-3xl md:text-4xl" style={{ background: scene.leftCharacter.color, border: scene.speakerSide === 'left' ? '2px solid #00e8ff' : '2px solid transparent' }}>
              {scene.leftCharacter.emoji}
            </div>
            {scene.speakerSide === 'left' && (
              <div className="mt-1 px-2 py-0.5 rounded text-[10px] font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
                {scene.leftCharacter.name}
              </div>
            )}
          </div>
        )}

        {/* Right character */}
        {scene.rightCharacter && (
          <div className={`flex flex-col items-center transition-all duration-300 ${scene.speakerSide === 'right' ? 'opacity-100 scale-100' : 'opacity-60 scale-95'}`}>
            <div className="w-16 h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center text-3xl md:text-4xl" style={{ background: scene.rightCharacter.color, border: scene.speakerSide === 'right' ? '2px solid #00e8ff' : '2px solid transparent' }}>
              {scene.rightCharacter.emoji}
            </div>
            {scene.speakerSide === 'right' && (
              <div className="mt-1 px-2 py-0.5 rounded text-[10px] font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
                {scene.rightCharacter.name}
              </div>
            )}
          </div>
        )}
      </div>

      {/* Dialogue box */}
      <div className="absolute bottom-0 left-0 right-0" style={{ background: 'linear-gradient(transparent, rgba(0,0,0,0.9) 30%)' }}>
        <div className="px-6 py-5 md:px-8">
          {scene.speaker && (
            <div className="mb-2">
              <span className="px-3 py-1 rounded-t-lg text-xs font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
                {scene.speaker === '{player}' ? playerName : scene.speaker}
              </span>
            </div>
          )}
          <div className="rounded-lg p-4" style={{ background: 'rgba(17, 26, 46, 0.9)', border: '1px solid rgba(30, 45, 74, 0.5)' }}>
            <p className="text-sm md:text-base leading-relaxed" style={{ color: '#e2e8f0' }}>
              {displayedText}
              {isTyping && <span className="inline-block w-0.5 h-4 ml-0.5 animate-pulse" style={{ background: '#00e8ff' }} />}
            </p>
          </div>

          {/* Choices */}
          {showChoices && scene.choices && (
            <div className="mt-3 space-y-2">
              {scene.choices.map((choice, i) => (
                <button
                  key={i}
                  onClick={(e) => {
                    e.stopPropagation();
                    onChoice?.(choice);
                  }}
                  className="w-full text-left px-4 py-3 rounded-lg text-sm transition-all hover:scale-[1.02]"
                  style={{ background: 'rgba(0, 232, 255, 0.1)', border: '1px solid rgba(0, 232, 255, 0.3)', color: '#e2e8f0' }}
                >
                  <span className="font-bold mr-2" style={{ color: '#00e8ff' }}>{String.fromCharCode(65 + i)}.</span>
                  {choice.text}
                  {choice.xpBonus > 0 && (
                    <span className="ml-2 text-xs" style={{ color: '#ffd700' }}>+{choice.xpBonus} XP</span>
                  )}
                </button>
              ))}
            </div>
          )}

          {/* Continue indicator */}
          {!isTyping && scene.type !== 'choice' && (
            <div className="text-center mt-2">
              <span className="text-xs animate-pulse" style={{ color: '#64748b' }}>
                ▼ Tap to continue
              </span>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
