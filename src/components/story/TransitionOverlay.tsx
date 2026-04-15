'use client';

import { useState, useEffect, useRef } from 'react';
import { TransitionNode } from '@/lib/story-types';
import { LOCATION_GRADIENTS } from '@/lib/story-characters';

interface TransitionOverlayProps {
  node: TransitionNode;
  onComplete: () => void;
}

export default function TransitionOverlay({ node, onComplete }: TransitionOverlayProps) {
  const [phase, setPhase] = useState<'enter' | 'show' | 'exit'>('enter');
  const onCompleteRef = useRef(onComplete);
  onCompleteRef.current = onComplete;

  useEffect(() => {
    const enterTimer = setTimeout(() => setPhase('show'), 300);
    const exitTimer = setTimeout(() => setPhase('exit'), 2500);
    const completeTimer = setTimeout(() => onCompleteRef.current(), 3200);
    return () => {
      clearTimeout(enterTimer);
      clearTimeout(exitTimer);
      clearTimeout(completeTimer);
    };
  }, []);

  const gradient = LOCATION_GRADIENTS[node.location] || LOCATION_GRADIENTS['new-york'];

  const getTransformStyle = (): React.CSSProperties => {
    switch (node.animation) {
      case 'slide':
        return {
          transform: phase === 'enter' ? 'translateY(100%)' : phase === 'exit' ? 'translateY(-100%)' : 'translateY(0)',
          transition: 'transform 0.6s ease-in-out, opacity 0.6s ease-in-out',
        };
      case 'glitch':
        return {
          opacity: phase === 'show' ? 1 : 0,
          transition: 'opacity 0.15s ease-in-out',
          filter: phase === 'enter' ? 'hue-rotate(90deg) blur(4px)' : 'none',
        };
      default: // fade
        return {
          opacity: phase === 'show' ? 1 : 0,
          transition: 'opacity 0.6s ease-in-out',
        };
    }
  };

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center"
      style={{
        background: gradient,
        ...getTransformStyle(),
      }}
      onClick={onComplete}
    >
      <div className="text-center">
        {node.timeSkipText && (
          <p className="text-xs font-mono tracking-widest mb-3 animate-pulse" style={{ color: '#00e8ff' }}>
            {node.timeSkipText}
          </p>
        )}
        <h2 className="text-3xl font-bold mb-2" style={{ color: '#e2e8f0', textShadow: '0 0 20px rgba(0,232,255,0.3)' }}>
          {node.location.split('-').map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')}
        </h2>
        <p className="text-sm" style={{ color: '#94a3b8' }}>{node.description}</p>
      </div>
    </div>
  );
}
