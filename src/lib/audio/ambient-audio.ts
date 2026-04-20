'use client';

// ── CISSP Quest Ambient Audio System ──────────────────────────────────────
// Generates procedural ambient soundscapes per story location using Tone.js.
// All sounds are synthesized — no audio files required.
// User can toggle off globally in settings (stored in localStorage + Supabase).

let ToneModule: typeof import('tone') | null = null;

async function getTone() {
  if (!ToneModule) {
    ToneModule = await import('tone');
  }
  return ToneModule;
}

export type LocationId =
  | 'toronto'    // D1: Security and Risk Management
  | 'london'     // D2: Asset Security
  | 'munich'     // D3: Security Architecture
  | 'singapore'  // D4: Network Security
  | 'new_york'   // D5: IAM
  | 'remote_lab' // D6: Security Assessment
  | 'tokyo'      // D7: Security Operations
  | 'sf';        // D8: Software Development Security

export interface LocationAudio {
  id:          LocationId;
  name:        string;
  description: string;  // what the listener will hear
  bpm?:        number;
}

export const LOCATION_AUDIO: Record<LocationId, LocationAudio> = {
  toronto:    { id: 'toronto',    name: 'Toronto HQ',     description: 'Corporate lobby ambience, distant conversations, elevator dings' },
  london:     { id: 'london',     name: 'London Office',  description: 'Rainy window, keyboard clicks, soft office hum' },
  munich:     { id: 'munich',     name: 'Munich Lab',     description: 'Server room hum, cooling fans, quiet workspace' },
  singapore:  { id: 'singapore',  name: 'Singapore NOC',  description: 'Network operations center, alert beeps, scrolling data' },
  new_york:   { id: 'new_york',   name: 'New York SOC',   description: 'SOC war room, monitors, alert pings, tense energy' },
  remote_lab: { id: 'remote_lab', name: 'Remote Lab',     description: 'Digital silence, occasional keystroke, deep focus' },
  tokyo:      { id: 'tokyo',      name: 'Tokyo IR Center', description: 'Neon city atmosphere, rain on glass, distant traffic' },
  sf:         { id: 'sf',         name: 'San Francisco',  description: 'Bay wind, modern tech office, calm productivity' },
};

// ── Audio Engine Class ──────────────────────────────────────────────────

class CISSPAmbientAudio {
  private nodes: import('tone').ToneAudioNode[] = [];
  private isPlaying   = false;
  private currentLoc: LocationId | null = null;
  private masterGain: import('tone').Gain | null = null;
  private volume      = 0.3;  // 0-1

  async start(locationId: LocationId) {
    if (this.isPlaying && this.currentLoc === locationId) return;
    await this.stop();

    const Tone = await getTone();
    await Tone.start();

    this.masterGain = new Tone.Gain(this.volume).toDestination();
    this.currentLoc = locationId;
    this.isPlaying  = true;

    switch (locationId) {
      case 'toronto':    await this.buildToronto(Tone);    break;
      case 'london':     await this.buildLondon(Tone);     break;
      case 'munich':     await this.buildMunich(Tone);     break;
      case 'singapore':  await this.buildSingapore(Tone);  break;
      case 'new_york':   await this.buildNewYork(Tone);    break;
      case 'remote_lab': await this.buildRemoteLab(Tone);  break;
      case 'tokyo':      await this.buildTokyo(Tone);      break;
      case 'sf':         await this.buildSF(Tone);         break;
    }
  }

  async stop() {
    for (const node of this.nodes) {
      try { node.dispose(); } catch { /* ignore */ }
    }
    this.nodes = [];
    if (this.masterGain) {
      try { this.masterGain.dispose(); } catch { /* ignore */ }
      this.masterGain = null;
    }
    this.isPlaying  = false;
    this.currentLoc = null;
  }

  setVolume(v: number) {
    this.volume = Math.max(0, Math.min(1, v));
    if (this.masterGain) this.masterGain.gain.rampTo(this.volume, 0.5);
  }

  getVolume() { return this.volume; }
  getIsPlaying() { return this.isPlaying; }
  getCurrentLocation() { return this.currentLoc; }

  // ── Toronto: Corporate lobby ──────────────────────────────
  private async buildToronto(Tone: typeof import('tone')) {
    // Low hum of HVAC
    const hvac = new Tone.Noise('brown').connect(
      new Tone.Filter(200, 'lowpass').connect(
        new Tone.Gain(0.04).connect(this.masterGain!)
      )
    );
    hvac.start();
    this.nodes.push(hvac);

    // Occasional elevator ding
    const ding = new Tone.Synth({ oscillator: { type: 'sine' }, envelope: { attack: 0.01, decay: 0.5, sustain: 0, release: 0.3 } })
      .connect(new Tone.Gain(0.15).connect(this.masterGain!));
    const dingPart = new Tone.Part((time: number) => {
      ding.triggerAttackRelease('C6', '0.1n', time);
      ding.triggerAttackRelease('E6', '0.1n', Tone.Time(time).toSeconds() + 0.1);
    }, [['0:0', null], ['8:0', null], ['16:0', null], ['24:0', null]]);
    dingPart.loop = true;
    dingPart.loopEnd = '32:0';
    dingPart.start(0);
    Tone.getTransport().start();
    this.nodes.push(ding, dingPart as unknown as import('tone').ToneAudioNode);
  }

  // ── London: Rain + office ─────────────────────────────────
  private async buildLondon(Tone: typeof import('tone')) {
    // Rain: white noise through highpass
    const rain = new Tone.Noise('white').connect(
      new Tone.Filter(2000, 'highpass').connect(
        new Tone.Filter(8000, 'lowpass').connect(
          new Tone.Gain(0.06).connect(this.masterGain!)
        )
      )
    );
    rain.start();
    this.nodes.push(rain);

    // Soft keyboard clicks (pink noise bursts)
    const click = new Tone.NoiseSynth({ noise: { type: 'pink' }, envelope: { attack: 0.001, decay: 0.05, sustain: 0, release: 0.02 } })
      .connect(new Tone.Gain(0.1).connect(this.masterGain!));
    const clickLoop = new Tone.Loop((time: number) => {
      if (Math.random() > 0.6) click.triggerAttackRelease('16n', time);
    }, '8n');
    clickLoop.start(0);
    Tone.getTransport().bpm.value = 120;
    Tone.getTransport().start();
    this.nodes.push(click, clickLoop as unknown as import('tone').ToneAudioNode);
  }

  // ── Munich: Server room hum ──────────────────────────────
  private async buildMunich(Tone: typeof import('tone')) {
    // Server fan hum — multiple frequencies
    const buildFan = (freq: number, gain: number) => {
      const osc = new Tone.Oscillator(freq, 'sawtooth').connect(
        new Tone.Filter(freq * 3, 'lowpass').connect(
          new Tone.Gain(gain).connect(this.masterGain!)
        )
      );
      osc.start();
      return osc;
    };
    this.nodes.push(buildFan(60, 0.04), buildFan(120, 0.02), buildFan(180, 0.01));
  }

  // ── Singapore: NOC beeps ─────────────────────────────────
  private async buildSingapore(Tone: typeof import('tone')) {
    const baseHum = new Tone.Noise('brown').connect(
      new Tone.Filter(300, 'lowpass').connect(new Tone.Gain(0.03).connect(this.masterGain!))
    );
    baseHum.start();
    this.nodes.push(baseHum);

    // Alert beep sequence
    const beep = new Tone.Synth({ oscillator: { type: 'square' }, envelope: { attack: 0.001, decay: 0.1, sustain: 0.1, release: 0.1 } })
      .connect(new Tone.Gain(0.08).connect(this.masterGain!));
    const seq = new Tone.Sequence((time: number, note: string) => {
      beep.triggerAttackRelease(note, '16n', time);
    // Tone.js accepts null for rests at runtime; TypeScript types are stricter
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    }, ['A5', null, null, 'C6', null, null, null, null, null, 'A5', null, null] as any[], '8n');
    seq.loop = true;
    seq.start(0);
    Tone.getTransport().bpm.value = 80;
    Tone.getTransport().start();
    this.nodes.push(beep, seq as unknown as import('tone').ToneAudioNode);
  }

  // ── New York: SOC tension ──────────────────────────────
  private async buildNewYork(Tone: typeof import('tone')) {
    // Low tension drone
    const drone = new Tone.Synth({ oscillator: { type: 'sawtooth' }, envelope: { attack: 2, decay: 0, sustain: 1, release: 2 } })
      .connect(new Tone.Filter(400, 'lowpass').connect(new Tone.Gain(0.05).connect(this.masterGain!)));
    drone.triggerAttack('D2');
    this.nodes.push(drone);

    // Monitor noise
    const monitor = new Tone.Noise('pink').connect(
      new Tone.Filter(1000, 'bandpass').connect(new Tone.Gain(0.02).connect(this.masterGain!))
    );
    monitor.start();
    this.nodes.push(monitor);
  }

  // ── Remote Lab: Digital silence ───────────────────────
  private async buildRemoteLab(Tone: typeof import('tone')) {
    // Very subtle electronic hum
    const hum = new Tone.Oscillator(50, 'sine')
      .connect(new Tone.Gain(0.01).connect(this.masterGain!));
    hum.start();

    // Occasional single digital blip
    const blip = new Tone.Synth({ oscillator: { type: 'sine' }, envelope: { attack: 0.001, decay: 0.1, sustain: 0, release: 0.05 } })
      .connect(new Tone.Gain(0.06).connect(this.masterGain!));
    const blipLoop = new Tone.Loop((time: number) => {
      if (Math.random() > 0.85) blip.triggerAttackRelease('G6', '32n', time);
    }, '4n');
    blipLoop.start(0);
    Tone.getTransport().start();
    this.nodes.push(hum, blip, blipLoop as unknown as import('tone').ToneAudioNode);
  }

  // ── Tokyo: Neon rain ─────────────────────────────────
  private async buildTokyo(Tone: typeof import('tone')) {
    // Rain
    const rain = new Tone.Noise('white').connect(
      new Tone.Filter(3000, 'highpass').connect(new Tone.Gain(0.04).connect(this.masterGain!))
    );
    rain.start();

    // Distant traffic (low rumble)
    const traffic = new Tone.Noise('brown').connect(
      new Tone.Filter(100, 'lowpass').connect(new Tone.Gain(0.03).connect(this.masterGain!))
    );
    traffic.start();

    // Soft synth pad (neon atmosphere)
    const pad = new Tone.PolySynth(Tone.Synth, { oscillator: { type: 'sine' }, envelope: { attack: 2, decay: 1, sustain: 0.7, release: 3 } })
      .connect(new Tone.Reverb(4).connect(new Tone.Gain(0.04).connect(this.masterGain!)));
    pad.triggerAttack(['D3', 'A3', 'C4']);
    this.nodes.push(rain, traffic, pad);
  }

  // ── San Francisco: Bay wind ──────────────────────────
  private async buildSF(Tone: typeof import('tone')) {
    // Wind
    const wind = new Tone.Noise('pink').connect(
      new Tone.AutoFilter({ frequency: '4n', baseFrequency: 400, octaves: 4 }).connect(
        new Tone.Gain(0.04).connect(this.masterGain!)
      )
    );
    wind.start();
    (wind as unknown as { connect: () => void });

    // Tech office hum
    const hum = new Tone.Noise('brown').connect(
      new Tone.Filter(250, 'lowpass').connect(new Tone.Gain(0.02).connect(this.masterGain!))
    );
    hum.start();
    this.nodes.push(wind, hum);
  }
}

// Singleton
let instance: CISSPAmbientAudio | null = null;

export function getAudioEngine(): CISSPAmbientAudio {
  if (typeof window === 'undefined') {
    throw new Error('Audio engine only available in browser');
  }
  if (!instance) instance = new CISSPAmbientAudio();
  return instance;
}

// ── Audio Settings Persistence ───────────────────────────────────────────
const AUDIO_KEY = 'cissp_audio_enabled';
const VOLUME_KEY = 'cissp_audio_volume';

export function getAudioEnabled(): boolean {
  if (typeof window === 'undefined') return true;
  return localStorage.getItem(AUDIO_KEY) !== 'false';
}

export function setAudioEnabled(enabled: boolean) {
  localStorage.setItem(AUDIO_KEY, enabled ? 'true' : 'false');
}

export function getSavedVolume(): number {
  if (typeof window === 'undefined') return 0.3;
  return parseFloat(localStorage.getItem(VOLUME_KEY) ?? '0.3');
}

export function saveVolume(v: number) {
  localStorage.setItem(VOLUME_KEY, v.toString());
}
