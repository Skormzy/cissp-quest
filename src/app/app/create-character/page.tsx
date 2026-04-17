'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { AnimatePresence, motion } from 'framer-motion';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar, {
  CharacterConfig,
  SKIN_TONES,
  HAIR_COLORS,
  OUTFITS,
} from '@/components/character/CharacterAvatar';

const STEPS = ['Gender', 'Skin', 'Eyes', 'Hair', 'Outfit', 'Name'] as const;
type StepName = (typeof STEPS)[number];

const GENDER_OPTIONS: { value: CharacterConfig['gender']; label: string }[] = [
  { value: 'Man',        label: 'Man'        },
  { value: 'Woman',      label: 'Woman'      },
  { value: 'Non-binary', label: 'Non-binary' },
];

const EYE_SHAPES = [
  { id: 1, label: 'Round',    description: 'Universally neutral'     },
  { id: 2, label: 'Almond',   description: 'Wide, tapered corners'   },
  { id: 3, label: 'Upturned', description: 'Lifted outer corners'    },
  { id: 4, label: 'Monolid',  description: 'Flat lid, no crease'     },
];

const SUGGESTED_NAMES = ['CipherFox', 'NullByte', 'HexWarden', 'SignalOps', 'IronCrypt'];

const DEFAULT_CONFIG: CharacterConfig = {
  gender:    'Man',
  skinTone:  4,
  eyeShape:  1,
  hairStyle: 1,
  hairColor: HAIR_COLORS[1].hex,
  outfit:    5,
};

export default function CreateCharacterPage() {
  const router  = useRouter();
  const supabase = createClient();
  const { user, setUser } = useUserStore();

  const [stepIndex, setStepIndex] = useState(0);
  const [direction, setDirection] = useState(1);
  const [config, setConfig] = useState<CharacterConfig>(DEFAULT_CONFIG);
  const [name, setName] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [isEditing, setIsEditing] = useState(false);

  useEffect(() => {
    if (user?.character_name) {
      setIsEditing(true);
      setName(user.character_name);
      setConfig({
        gender:    (user.character_gender as CharacterConfig['gender']) ?? 'Man',
        skinTone:  user.character_skin ?? 4,
        eyeShape:  user.character_eye_shape ?? 1,
        hairStyle: user.character_hair ?? 1,
        hairColor: user.character_hair_color ?? HAIR_COLORS[1].hex,
        outfit:    user.character_outfit ?? 5,
      });
    }
  }, [user]);

  function advance() {
    setDirection(1);
    setStepIndex((i) => Math.min(i + 1, STEPS.length - 1));
  }

  function retreat() {
    setDirection(-1);
    setStepIndex((i) => Math.max(i - 1, 0));
  }

  function patch(update: Partial<CharacterConfig>) {
    setConfig((c) => ({ ...c, ...update }));
  }

  async function handleSave() {
    if (!name.trim()) { setError('Enter your agent codename'); return; }
    setLoading(true);
    setError('');

    const { data: { user: authUser } } = await supabase.auth.getUser();
    if (!authUser) { setError('Not authenticated'); setLoading(false); return; }

    const payload = {
      id:                  authUser.id,
      character_name:      name.trim(),
      character_gender:    config.gender,
      character_skin:      config.skinTone,
      character_eye_shape: config.eyeShape,
      character_hair:      config.hairStyle,
      character_hair_color: config.hairColor,
      character_outfit:    config.outfit,
      display_name:        name.trim(),
    };

    const { data, error: dbError } = await supabase
      .from('users')
      .upsert(payload)
      .select()
      .single();

    if (dbError) { setError(dbError.message); setLoading(false); return; }
    if (data) setUser(data);
    router.push('/app/dashboard');
  }

  const currentStep = STEPS[stepIndex];
  const isFirst = stepIndex === 0;
  const isLast  = stepIndex === STEPS.length - 1;

  return (
    <div
      className="min-h-screen flex flex-col items-center justify-center px-4 py-10"
      style={{ background: '#080c14' }}
    >
      {/* ── Header ── */}
      <div className="w-full max-w-2xl text-center mb-6">
        <p className="text-xs font-mono tracking-widest uppercase mb-1" style={{ color: '#00e8ff' }}>
          Sentinel Dynamics · Personnel File
        </p>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>
          {isEditing ? 'Edit Agent Profile' : 'Create Your Agent'}
        </h1>
      </div>

      {/* ── Step Indicator ── */}
      <div className="w-full max-w-2xl flex items-center justify-center gap-1 mb-8">
        {STEPS.map((step, i) => (
          <div key={step} className="flex items-center">
            <div
              className="w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold transition-all duration-300"
              style={{
                background: i < stepIndex ? '#00e8ff' : i === stepIndex ? 'rgba(0,232,255,0.15)' : '#0d1220',
                border: `2px solid ${i <= stepIndex ? '#00e8ff' : '#1e2d4a'}`,
                color:  i < stepIndex ? '#080c14' : i === stepIndex ? '#00e8ff' : '#334155',
              }}
            >
              {i < stepIndex ? '✓' : i + 1}
            </div>
            {i < STEPS.length - 1 && (
              <div
                className="transition-all duration-500"
                style={{
                  width: 28,
                  height: 2,
                  background: i < stepIndex ? '#00e8ff' : '#1e2d4a',
                  margin: '0 2px',
                }}
              />
            )}
          </div>
        ))}
      </div>

      {/* ── Main Layout ── */}
      <div className="w-full max-w-2xl flex flex-col md:flex-row gap-6">
        {/* Left: Avatar preview */}
        <div className="md:w-48 flex flex-col items-center gap-3 shrink-0">
          <div
            className="w-full rounded-2xl p-6 flex flex-col items-center gap-3"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          >
            <motion.div
              key={`${config.gender}-${config.skinTone}-${config.eyeShape}-${config.hairStyle}-${config.hairColor}-${config.outfit}`}
              initial={{ scale: 0.9, opacity: 0.6 }}
              animate={{ scale: 1,   opacity: 1   }}
              transition={{ duration: 0.22 }}
            >
              <CharacterAvatar config={config} size={140} animated />
            </motion.div>

            <p className="text-sm font-bold text-center" style={{ color: '#e2e8f0' }}>
              {name || 'Agent ???'}
            </p>
            <p className="text-xs text-center" style={{ color: '#334155' }}>
              {config.gender} · {SKIN_TONES.find(s => s.id === config.skinTone)?.label}
            </p>
          </div>

          {/* Mini outline */}
          <div
            className="w-full rounded-xl p-3 text-xs space-y-1"
            style={{ background: '#0a0f1a', border: '1px solid #111a2e', color: '#334155' }}
          >
            <div className="flex justify-between">
              <span>Eyes</span>
              <span style={{ color: '#4a5568' }}>{EYE_SHAPES.find(e => e.id === config.eyeShape)?.label}</span>
            </div>
            <div className="flex justify-between">
              <span>Hair</span>
              <span style={{ color: '#4a5568' }}>Style {config.hairStyle}</span>
            </div>
            <div className="flex justify-between">
              <span>Outfit</span>
              <span style={{ color: '#4a5568' }}>{OUTFITS.find(o => o.id === config.outfit)?.label}</span>
            </div>
          </div>
        </div>

        {/* Right: Step content */}
        <div className="flex-1 flex flex-col">
          <div className="relative overflow-hidden">
            <AnimatePresence mode="wait" custom={direction}>
              <motion.div
                key={currentStep}
                custom={direction}
                variants={{
                  enter:  (d: number) => ({ x: d * 70, opacity: 0   }),
                  center:             ({ x: 0,         opacity: 1   }),
                  exit:   (d: number) => ({ x: d * -70, opacity: 0  }),
                }}
                initial="enter"
                animate="center"
                exit="exit"
                transition={{ duration: 0.26, ease: 'easeInOut' }}
              >
                <div
                  className="rounded-2xl p-5"
                  style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
                >
                  {/* Step title */}
                  <div className="mb-4">
                    <h2 className="text-base font-bold" style={{ color: '#e2e8f0' }}>
                      {currentStep === 'Gender'  && 'Who are you?'}
                      {currentStep === 'Skin'    && 'Skin Tone'}
                      {currentStep === 'Eyes'    && 'Eye Shape'}
                      {currentStep === 'Hair'    && 'Hair'}
                      {currentStep === 'Outfit'  && 'Field Outfit'}
                      {currentStep === 'Name'    && 'Your Codename'}
                    </h2>
                    <p className="text-xs mt-0.5" style={{ color: '#334155' }}>
                      {currentStep === 'Gender'  && 'Your identity on the mission'}
                      {currentStep === 'Skin'    && '8 tones representing the full human spectrum'}
                      {currentStep === 'Eyes'    && 'Small detail, significant character'}
                      {currentStep === 'Hair'    && 'Style and color — your signature look'}
                      {currentStep === 'Outfit'  && 'Your Sentinel Dynamics field kit'}
                      {currentStep === 'Name'    && 'What the team will call you in the field'}
                    </p>
                  </div>

                  {/* ── Gender ── */}
                  {currentStep === 'Gender' && (
                    <div className="grid grid-cols-3 gap-3">
                      {GENDER_OPTIONS.map(({ value, label }) => (
                        <button
                          key={value}
                          onClick={() => patch({ gender: value })}
                          className="flex flex-col items-center gap-2 p-3 rounded-xl transition-all duration-200"
                          style={{
                            background: config.gender === value ? 'rgba(0,232,255,0.1)' : '#080c14',
                            border: `2px solid ${config.gender === value ? '#00e8ff' : '#1e2d4a'}`,
                          }}
                        >
                          <CharacterAvatar config={{ ...config, gender: value, hairStyle: 1 }} size={72} />
                          <span
                            className="text-xs font-medium"
                            style={{ color: config.gender === value ? '#00e8ff' : '#64748b' }}
                          >
                            {label}
                          </span>
                        </button>
                      ))}
                    </div>
                  )}

                  {/* ── Skin ── */}
                  {currentStep === 'Skin' && (
                    <div className="grid grid-cols-4 gap-3">
                      {SKIN_TONES.map((tone) => (
                        <button
                          key={tone.id}
                          onClick={() => patch({ skinTone: tone.id })}
                          className="flex flex-col items-center gap-2 p-3 rounded-xl transition-all duration-200"
                          style={{
                            background: '#080c14',
                            border: `2px solid ${config.skinTone === tone.id ? '#00e8ff' : 'transparent'}`,
                          }}
                        >
                          <div
                            className="w-10 h-10 rounded-full"
                            style={{
                              background: tone.hex,
                              boxShadow: config.skinTone === tone.id ? `0 0 14px ${tone.hex}99` : 'none',
                            }}
                          />
                          <span
                            className="text-xs"
                            style={{ color: config.skinTone === tone.id ? '#00e8ff' : '#4a5568' }}
                          >
                            {tone.label}
                          </span>
                        </button>
                      ))}
                    </div>
                  )}

                  {/* ── Eyes ── */}
                  {currentStep === 'Eyes' && (
                    <div className="grid grid-cols-2 gap-3">
                      {EYE_SHAPES.map((eye) => (
                        <button
                          key={eye.id}
                          onClick={() => patch({ eyeShape: eye.id })}
                          className="flex flex-col items-center gap-2 p-4 rounded-xl transition-all duration-200"
                          style={{
                            background: config.eyeShape === eye.id ? 'rgba(0,232,255,0.1)' : '#080c14',
                            border: `2px solid ${config.eyeShape === eye.id ? '#00e8ff' : '#1e2d4a'}`,
                          }}
                        >
                          <CharacterAvatar config={{ ...config, eyeShape: eye.id }} size={72} />
                          <div className="text-center">
                            <p
                              className="text-sm font-medium"
                              style={{ color: config.eyeShape === eye.id ? '#00e8ff' : '#e2e8f0' }}
                            >
                              {eye.label}
                            </p>
                            <p className="text-xs" style={{ color: '#334155' }}>{eye.description}</p>
                          </div>
                        </button>
                      ))}
                    </div>
                  )}

                  {/* ── Hair ── */}
                  {currentStep === 'Hair' && (
                    <div className="space-y-4">
                      <p className="text-xs font-medium uppercase tracking-widest" style={{ color: '#334155' }}>Style</p>
                      <div className="grid grid-cols-6 gap-2">
                        {Array.from({ length: 12 }, (_, i) => i + 1).map((styleId) => (
                          <button
                            key={styleId}
                            onClick={() => patch({ hairStyle: styleId })}
                            className="aspect-square rounded-lg overflow-hidden transition-all duration-200 flex items-center justify-center"
                            style={{
                              background: config.hairStyle === styleId ? 'rgba(0,232,255,0.1)' : '#080c14',
                              border: `2px solid ${config.hairStyle === styleId ? '#00e8ff' : '#1e2d4a'}`,
                            }}
                          >
                            <CharacterAvatar config={{ ...config, hairStyle: styleId }} size={40} />
                          </button>
                        ))}
                      </div>

                      <p className="text-xs font-medium uppercase tracking-widest pt-1" style={{ color: '#334155' }}>Color</p>
                      <div className="grid grid-cols-6 gap-2">
                        {HAIR_COLORS.map((color) => (
                          <button
                            key={color.hex}
                            onClick={() => patch({ hairColor: color.hex })}
                            title={color.label}
                            className="w-9 h-9 rounded-full transition-all duration-200 mx-auto"
                            style={{
                              background: color.hex,
                              border: `3px solid ${config.hairColor === color.hex ? '#00e8ff' : 'transparent'}`,
                              boxShadow: config.hairColor === color.hex ? `0 0 12px ${color.hex}88` : 'none',
                            }}
                          />
                        ))}
                      </div>
                    </div>
                  )}

                  {/* ── Outfit ── */}
                  {currentStep === 'Outfit' && (
                    <div className="grid grid-cols-3 gap-3">
                      {OUTFITS.map((outfit) => (
                        <button
                          key={outfit.id}
                          onClick={() => patch({ outfit: outfit.id })}
                          className="flex flex-col items-center gap-2 p-3 rounded-xl transition-all duration-200"
                          style={{
                            background: config.outfit === outfit.id ? 'rgba(0,232,255,0.1)' : '#080c14',
                            border: `2px solid ${config.outfit === outfit.id ? '#00e8ff' : '#1e2d4a'}`,
                          }}
                        >
                          <CharacterAvatar config={{ ...config, outfit: outfit.id }} size={72} />
                          <div className="flex items-center gap-1.5">
                            <div className="w-2.5 h-2.5 rounded-full" style={{ background: outfit.secondary }} />
                            <span
                              className="text-xs font-medium"
                              style={{ color: config.outfit === outfit.id ? '#00e8ff' : '#64748b' }}
                            >
                              {outfit.label}
                            </span>
                          </div>
                        </button>
                      ))}
                    </div>
                  )}

                  {/* ── Name ── */}
                  {currentStep === 'Name' && (
                    <div className="space-y-4">
                      <input
                        type="text"
                        value={name}
                        onChange={(e) => { setName(e.target.value); setError(''); }}
                        maxLength={20}
                        placeholder="Enter your codename..."
                        autoFocus
                        onKeyDown={(e) => e.key === 'Enter' && !loading && handleSave()}
                        className="w-full px-4 py-3 rounded-xl text-sm outline-none transition-colors"
                        style={{
                          background: '#080c14',
                          border: `1px solid ${error ? '#ef4444' : '#1e2d4a'}`,
                          color: '#e2e8f0',
                        }}
                      />
                      {error && (
                        <p className="text-xs" style={{ color: '#ef4444' }}>{error}</p>
                      )}
                      <p className="text-xs" style={{ color: '#334155' }}>Quick picks:</p>
                      <div className="flex flex-wrap gap-2">
                        {SUGGESTED_NAMES.map((n) => (
                          <button
                            key={n}
                            onClick={() => { setName(n); setError(''); }}
                            className="px-3 py-1.5 rounded-lg text-xs font-mono transition-all hover:opacity-80"
                            style={{
                              background: 'rgba(0,232,255,0.07)',
                              border: '1px solid rgba(0,232,255,0.2)',
                              color: '#00e8ff',
                            }}
                          >
                            {n}
                          </button>
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              </motion.div>
            </AnimatePresence>
          </div>

          {/* ── Nav buttons ── */}
          <div className="flex gap-3 mt-4">
            {!isFirst && (
              <button
                onClick={retreat}
                className="px-5 py-2.5 rounded-xl text-sm font-medium transition-all hover:opacity-80"
                style={{ border: '1px solid #1e2d4a', color: '#64748b' }}
              >
                ← Back
              </button>
            )}
            {isLast ? (
              <button
                onClick={handleSave}
                disabled={loading}
                className="flex-1 py-2.5 rounded-xl text-sm font-bold transition-all hover:opacity-90 disabled:opacity-50"
                style={{ background: '#00e8ff', color: '#080c14' }}
              >
                {loading ? 'Deploying agent...' : isEditing ? 'Save Changes' : 'Deploy to Sentinel Dynamics →'}
              </button>
            ) : (
              <button
                onClick={advance}
                className="flex-1 py-2.5 rounded-xl text-sm font-bold transition-all hover:opacity-90"
                style={{ background: '#00e8ff', color: '#080c14' }}
              >
                Continue →
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
