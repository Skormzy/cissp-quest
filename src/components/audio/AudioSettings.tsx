'use client';

import { useState, useEffect, useCallback } from 'react';
import { Volume2, VolumeX, Volume1, Music } from 'lucide-react';
import { Switch } from '@/components/ui/switch';
import { Slider } from '@/components/ui/slider';
import {
  getAudioEnabled, setAudioEnabled,
  getSavedVolume, saveVolume,
  type LocationId,
} from '@/lib/audio/ambient-audio';

const LOCATIONS: { id: LocationId; label: string; emoji: string }[] = [
  { id: 'toronto',    label: 'Toronto HQ',        emoji: '🏢' },
  { id: 'london',     label: 'London Office',      emoji: '🌧️' },
  { id: 'munich',     label: 'Munich Lab',         emoji: '🖥️' },
  { id: 'singapore',  label: 'Singapore NOC',      emoji: '📡' },
  { id: 'new_york',   label: 'New York SOC',       emoji: '🚨' },
  { id: 'remote_lab', label: 'Remote Lab',         emoji: '💻' },
  { id: 'tokyo',      label: 'Tokyo IR Center',    emoji: '🌸' },
  { id: 'sf',         label: 'San Francisco',      emoji: '🌁' },
];

interface AudioSettingsProps {
  currentLocation?: LocationId;
}

export default function AudioSettings({ currentLocation }: AudioSettingsProps) {
  const [enabled, setEnabled] = useState(true);
  const [volume, setVolumeState] = useState(0.3);
  const [previewLocation, setPreviewLocation] = useState<LocationId | null>(null);
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    setEnabled(getAudioEnabled());
    setVolumeState(getSavedVolume());
  }, []);

  const handleToggle = useCallback(async (on: boolean) => {
    setEnabled(on);
    setAudioEnabled(on);

    if (typeof window === 'undefined') return;
    const { getAudioEngine } = await import('@/lib/audio/ambient-audio');
    const engine = getAudioEngine();

    if (!on) {
      await engine.stop();
    } else if (currentLocation) {
      setIsLoading(true);
      await engine.start(currentLocation);
      setIsLoading(false);
    }
  }, [currentLocation]);

  const handleVolume = useCallback(async (v: number) => {
    setVolumeState(v);
    saveVolume(v);

    if (typeof window === 'undefined') return;
    const { getAudioEngine } = await import('@/lib/audio/ambient-audio');
    getAudioEngine().setVolume(v);
  }, []);

  const handlePreview = useCallback(async (locId: LocationId) => {
    if (typeof window === 'undefined') return;
    setIsLoading(true);
    setPreviewLocation(locId);
    const { getAudioEngine } = await import('@/lib/audio/ambient-audio');
    const engine = getAudioEngine();
    await engine.start(locId);
    engine.setVolume(volume);
    setIsLoading(false);
  }, [volume]);

  const VolumeIcon = volume === 0 ? VolumeX : volume < 0.4 ? Volume1 : Volume2;

  return (
    <div className="space-y-5">
      {/* Enable toggle */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Music className="w-4 h-4" style={{ color: '#00e8ff' }} />
          <div>
            <p className="text-sm font-semibold" style={{ color: '#e2e8f0' }}>Ambient Audio</p>
            <p className="text-xs" style={{ color: '#475569' }}>Synthesized soundscapes per location</p>
          </div>
        </div>
        <Switch
          checked={enabled}
          onCheckedChange={handleToggle}
          disabled={isLoading}
        />
      </div>

      {/* Volume slider */}
      {enabled && (
        <div className="space-y-2">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <VolumeIcon className="w-4 h-4" style={{ color: '#94a3b8' }} />
              <span className="text-xs" style={{ color: '#94a3b8' }}>Volume</span>
            </div>
            <span className="text-xs font-mono" style={{ color: '#64748b' }}>
              {Math.round(volume * 100)}%
            </span>
          </div>
          <Slider
            min={0}
            max={100}
            value={[Math.round(volume * 100)]}
            onValueChange={(v) => handleVolume((v as number[])[0] / 100)}
          />
        </div>
      )}

      {/* Location previews */}
      {enabled && (
        <div>
          <p className="text-xs font-semibold uppercase tracking-widest mb-2" style={{ color: '#4a5568' }}>
            Preview Location
          </p>
          <div className="grid grid-cols-2 gap-1.5">
            {LOCATIONS.map((loc) => {
              const isActive = (previewLocation ?? currentLocation) === loc.id;
              return (
                <button
                  key={loc.id}
                  className="flex items-center gap-2 px-2 py-1.5 rounded-lg text-left text-xs transition-colors"
                  style={{
                    background: isActive ? '#111a2e' : 'transparent',
                    color: isActive ? '#00e8ff' : '#64748b',
                    border: `1px solid ${isActive ? '#00e8ff33' : 'transparent'}`,
                  }}
                  onClick={() => handlePreview(loc.id)}
                  disabled={isLoading}
                >
                  <span>{loc.emoji}</span>
                  <span className="truncate">{loc.label}</span>
                </button>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
}
