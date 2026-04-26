'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { AnimatePresence, motion } from 'framer-motion';
import { format } from 'date-fns';
import { CalendarIcon } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar, {
  CharacterConfig,
  SKIN_TONES,
  HAIR_COLORS,
  OUTFITS,
  EYE_COLORS,
} from '@/components/character/CharacterAvatar';
import {
  avatarGenderToDb,
  dbGenderToAvatar,
  defaultPronounsFor,
  type AvatarGender,
  type PronounSet,
} from '@/lib/player-tokens';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Calendar } from '@/components/ui/calendar';
import { Popover, PopoverTrigger, PopoverContent } from '@/components/ui/popover';
import { cn } from '@/lib/utils';

const STEPS = ['Gender', 'Pronouns', 'Skin', 'Eyes', 'Hair', 'Outfit', 'Identity'] as const;
type StepName = (typeof STEPS)[number];

const GENDER_OPTIONS: { value: AvatarGender; label: string }[] = [
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
const NAME_MIN = 1;
const NAME_MAX = 40;
const PROFANITY = ['fuck', 'shit', 'cunt', 'asshole', 'bitch', 'nigger', 'faggot', 'retard'];

function isCleanName(name: string): boolean {
  const lower = name.toLowerCase();
  return !PROFANITY.some((w) => lower.includes(w));
}

const DEFAULT_CONFIG: CharacterConfig = {
  gender:    'Man',
  skinTone:  4,
  eyeShape:  1,
  hairStyle: 1,
  hairColor: HAIR_COLORS[1].hex,
  outfit:    5,
  eyeColor:  EYE_COLORS[2].hex,
};

export default function CreateCharacterPage() {
  const router = useRouter();
  const supabase = createClient();
  const { profile, setProfile } = useUserStore();

  const [stepIndex, setStepIndex] = useState(0);
  const [direction, setDirection] = useState(1);
  const [config, setConfig] = useState<CharacterConfig>(DEFAULT_CONFIG);
  const [name, setName] = useState('');
  const [examDate, setExamDate] = useState<Date | undefined>(undefined);
  const [pronouns, setPronouns] = useState<PronounSet>(defaultPronounsFor('Man'));
  const [pronounsTouched, setPronounsTouched] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    if (!pronounsTouched) {
      setPronouns(defaultPronounsFor(config.gender));
    }
  }, [config.gender, pronounsTouched]);

  // Prefill once when the async-loaded profile arrives. The ref guards against
  // re-runs that would clobber in-progress wizard edits if profile updates later.
  const hasPrefilledRef = useRef(false);
  useEffect(() => {
    if (!profile || hasPrefilledRef.current) return;
    hasPrefilledRef.current = true;
    setName(profile.display_name);
    if (profile.exam_date) {
      setExamDate(new Date(profile.exam_date + 'T00:00:00'));
    }
    setPronouns({
      subject:    profile.pronoun_subject as PronounSet['subject'],
      object:     profile.pronoun_object as PronounSet['object'],
      possessive: profile.pronoun_possessive as PronounSet['possessive'],
      reflexive:  profile.pronoun_reflexive as PronounSet['reflexive'],
    });
    setPronounsTouched(true);
    setConfig({
      gender:    dbGenderToAvatar(profile.gender),
      skinTone:  profile.skin_tone,
      eyeShape:  profile.eye_shape,
      eyeColor:  profile.eye_color ?? EYE_COLORS[2].hex,
      hairStyle: profile.hair_style,
      hairColor: profile.hair_color,
      outfit:    profile.outfit,
    });
  }, [profile]);

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

  function patchPronoun<K extends keyof PronounSet>(key: K, value: string) {
    setPronounsTouched(true);
    setPronouns((p) => ({ ...p, [key]: value as PronounSet[K] }));
  }

  async function handleSave() {
    const trimmed = name.trim();
    if (trimmed.length < NAME_MIN) { setError('Display name is required.'); return; }
    if (trimmed.length > NAME_MAX) { setError(`Display name must be ${NAME_MAX} characters or fewer.`); return; }
    if (!isCleanName(trimmed)) { setError('Please choose a different display name.'); return; }
    if (examDate && examDate.getTime() <= Date.now()) {
      setError('Exam date must be in the future.');
      return;
    }

    setLoading(true);
    setError('');

    const { data: { user: authUser } } = await supabase.auth.getUser();
    if (!authUser) { setError('Not authenticated.'); setLoading(false); return; }

    const payload = {
      user_id:            authUser.id,
      display_name:       trimmed,
      gender:             avatarGenderToDb(config.gender),
      pronoun_subject:    pronouns.subject,
      pronoun_object:     pronouns.object,
      pronoun_possessive: pronouns.possessive,
      pronoun_reflexive:  pronouns.reflexive,
      skin_tone:          config.skinTone,
      eye_shape:          config.eyeShape,
      eye_color:          config.eyeColor ?? null,
      hair_style:         config.hairStyle,
      hair_color:         config.hairColor,
      outfit:             config.outfit,
      exam_date:          examDate ? format(examDate, 'yyyy-MM-dd') : null,
    };

    const { data, error: dbError } = await supabase
      .from('player_profile')
      .upsert(payload, { onConflict: 'user_id' })
      .select()
      .single();

    if (dbError) { setError(dbError.message); setLoading(false); return; }
    if (data) setProfile(data);
    router.push('/app/dashboard');
  }

  const currentStep = STEPS[stepIndex];
  const isFirst = stepIndex === 0;
  const isLast  = stepIndex === STEPS.length - 1;

  const previewSentence =
    `Tanaka watches ${pronouns.object} prove ${pronouns.reflexive}.`;

  return (
    <div
      className="min-h-screen flex flex-col items-center justify-center px-4 py-10"
      style={{ background: '#080c14' }}
    >
      <div className="w-full max-w-2xl text-center mb-6">
        <p className="text-xs font-mono tracking-widest uppercase mb-1" style={{ color: '#00e8ff' }}>
          Sentinel Dynamics · Personnel File
        </p>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Create Your Agent</h1>
      </div>

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
                  width: 22,
                  height: 2,
                  background: i < stepIndex ? '#00e8ff' : '#1e2d4a',
                  margin: '0 2px',
                }}
              />
            )}
          </div>
        ))}
      </div>

      <div className="w-full max-w-2xl flex flex-col md:flex-row gap-6">
        <div className="md:w-48 flex flex-col items-center gap-3 shrink-0">
          <div
            className="w-full rounded-2xl p-6 flex flex-col items-center gap-3"
            style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          >
            <motion.div
              key={`${config.gender}-${config.skinTone}-${config.eyeShape}-${config.hairStyle}-${config.hairColor}-${config.outfit}-${config.eyeColor}`}
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

          <div
            className="w-full rounded-xl p-3 text-xs space-y-1"
            style={{ background: '#0a0f1a', border: '1px solid #111a2e', color: '#334155' }}
          >
            <div className="flex justify-between"><span>Pronouns</span><span style={{ color: '#4a5568' }}>{pronouns.subject}/{pronouns.object}</span></div>
            <div className="flex justify-between"><span>Eyes</span><span style={{ color: '#4a5568' }}>{EYE_SHAPES.find(e => e.id === config.eyeShape)?.label}</span></div>
            <div className="flex justify-between"><span>Hair</span><span style={{ color: '#4a5568' }}>Style {config.hairStyle}</span></div>
            <div className="flex justify-between"><span>Outfit</span><span style={{ color: '#4a5568' }}>{OUTFITS.find(o => o.id === config.outfit)?.label}</span></div>
          </div>
        </div>

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
                  <div className="mb-4">
                    <h2 className="text-base font-bold" style={{ color: '#e2e8f0' }}>
                      {currentStep === 'Gender'   && 'Who are you?'}
                      {currentStep === 'Pronouns' && 'How do NPCs refer to you?'}
                      {currentStep === 'Skin'     && 'Skin Tone'}
                      {currentStep === 'Eyes'     && 'Eye Shape & Color'}
                      {currentStep === 'Hair'     && 'Hair'}
                      {currentStep === 'Outfit'   && 'Field Outfit'}
                      {currentStep === 'Identity' && 'Codename & Exam Date'}
                    </h2>
                    <p className="text-xs mt-0.5" style={{ color: '#334155' }}>
                      {currentStep === 'Gender'   && 'Your identity on the mission'}
                      {currentStep === 'Pronouns' && 'These are how NPCs will refer to you in dialogue. You can change them later.'}
                      {currentStep === 'Skin'     && '8 tones representing the full human spectrum'}
                      {currentStep === 'Eyes'     && 'Shape and color — small details, significant character'}
                      {currentStep === 'Hair'     && 'Style and color — your signature look'}
                      {currentStep === 'Outfit'   && 'Your Sentinel Dynamics field kit'}
                      {currentStep === 'Identity' && 'What the team will call you and when you sit the exam'}
                    </p>
                  </div>

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

                  {currentStep === 'Pronouns' && (
                    <div className="space-y-4">
                      <div className="grid grid-cols-2 gap-3">
                        <div>
                          <Label htmlFor="p-subject" className="text-xs uppercase tracking-widest text-slate-500">Subject</Label>
                          <Input
                            id="p-subject"
                            value={pronouns.subject}
                            onChange={(e) => patchPronoun('subject', e.target.value)}
                            maxLength={12}
                            className="mt-1"
                          />
                        </div>
                        <div>
                          <Label htmlFor="p-object" className="text-xs uppercase tracking-widest text-slate-500">Object</Label>
                          <Input
                            id="p-object"
                            value={pronouns.object}
                            onChange={(e) => patchPronoun('object', e.target.value)}
                            maxLength={12}
                            className="mt-1"
                          />
                        </div>
                        <div>
                          <Label htmlFor="p-possessive" className="text-xs uppercase tracking-widest text-slate-500">Possessive</Label>
                          <Input
                            id="p-possessive"
                            value={pronouns.possessive}
                            onChange={(e) => patchPronoun('possessive', e.target.value)}
                            maxLength={12}
                            className="mt-1"
                          />
                        </div>
                        <div>
                          <Label htmlFor="p-reflexive" className="text-xs uppercase tracking-widest text-slate-500">Reflexive</Label>
                          <Input
                            id="p-reflexive"
                            value={pronouns.reflexive}
                            onChange={(e) => patchPronoun('reflexive', e.target.value)}
                            maxLength={14}
                            className="mt-1"
                          />
                        </div>
                      </div>
                      <div
                        className="rounded-xl p-3 text-sm italic"
                        style={{ background: '#080c14', border: '1px solid #1e2d4a', color: '#94a3b8' }}
                      >
                        Preview: &quot;{previewSentence}&quot;
                      </div>
                    </div>
                  )}

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
                          <span className="text-xs" style={{ color: config.skinTone === tone.id ? '#00e8ff' : '#4a5568' }}>
                            {tone.label}
                          </span>
                        </button>
                      ))}
                    </div>
                  )}

                  {currentStep === 'Eyes' && (
                    <div className="space-y-4">
                      <p className="text-xs font-medium uppercase tracking-widest" style={{ color: '#334155' }}>Shape</p>
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
                              <p className="text-sm font-medium" style={{ color: config.eyeShape === eye.id ? '#00e8ff' : '#e2e8f0' }}>
                                {eye.label}
                              </p>
                              <p className="text-xs" style={{ color: '#334155' }}>{eye.description}</p>
                            </div>
                          </button>
                        ))}
                      </div>

                      <p className="text-xs font-medium uppercase tracking-widest pt-1" style={{ color: '#334155' }}>Color</p>
                      <div className="grid grid-cols-6 gap-2">
                        {EYE_COLORS.map((color) => (
                          <button
                            key={color.hex}
                            onClick={() => patch({ eyeColor: color.hex })}
                            title={color.label}
                            className="w-9 h-9 rounded-full transition-all duration-200 mx-auto"
                            style={{
                              background: color.hex,
                              border: `3px solid ${config.eyeColor === color.hex ? '#00e8ff' : 'transparent'}`,
                              boxShadow: config.eyeColor === color.hex ? `0 0 12px ${color.hex}88` : 'none',
                            }}
                          />
                        ))}
                      </div>
                    </div>
                  )}

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
                            <span className="text-xs font-medium" style={{ color: config.outfit === outfit.id ? '#00e8ff' : '#64748b' }}>
                              {outfit.label}
                            </span>
                          </div>
                        </button>
                      ))}
                    </div>
                  )}

                  {currentStep === 'Identity' && (
                    <div className="space-y-5">
                      <div>
                        <Label htmlFor="cc-name" className="text-xs uppercase tracking-widest text-slate-500">Display name</Label>
                        <Input
                          id="cc-name"
                          value={name}
                          onChange={(e) => { setName(e.target.value); setError(''); }}
                          maxLength={NAME_MAX}
                          placeholder="Enter your codename..."
                          autoFocus
                          onKeyDown={(e) => e.key === 'Enter' && !loading && handleSave()}
                          className="mt-1"
                        />
                        <div className="mt-2 flex flex-wrap gap-2">
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

                      <div>
                        <Label className="text-xs uppercase tracking-widest text-slate-500">CISSP exam date (optional)</Label>
                        <Popover>
                          <PopoverTrigger
                            render={
                              <Button
                                variant="outline"
                                className={cn(
                                  'mt-1 w-full justify-start text-left font-normal',
                                  !examDate && 'text-muted-foreground'
                                )}
                              >
                                <CalendarIcon className="mr-2 h-4 w-4" />
                                {examDate ? format(examDate, 'PPP') : 'Pick a date'}
                              </Button>
                            }
                          />
                          <PopoverContent className="w-auto p-0" align="start">
                            <Calendar
                              mode="single"
                              selected={examDate}
                              onSelect={(d) => { setExamDate(d); setError(''); }}
                              disabled={(d) => d.getTime() <= Date.now()}
                              autoFocus
                            />
                          </PopoverContent>
                        </Popover>
                        <p className="text-xs mt-1" style={{ color: '#334155' }}>
                          Optional. Powers your dashboard countdown and adaptive study pacing.
                        </p>
                      </div>

                      {error && <p className="text-xs text-red-400">{error}</p>}
                    </div>
                  )}
                </div>
              </motion.div>
            </AnimatePresence>
          </div>

          <div className="flex gap-3 mt-4">
            {!isFirst && (
              <Button variant="outline" onClick={retreat}>← Back</Button>
            )}
            {isLast ? (
              <Button onClick={handleSave} disabled={loading} className="flex-1">
                {loading ? 'Deploying agent...' : 'Deploy to Sentinel Dynamics →'}
              </Button>
            ) : (
              <Button onClick={advance} className="flex-1">Continue →</Button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
