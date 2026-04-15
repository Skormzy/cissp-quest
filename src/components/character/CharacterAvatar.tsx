'use client';

interface CharacterAvatarProps {
  skin: number;
  hair: number;
  hairColor: string;
  gender: string;
  outfit: number;
  size?: number;
  className?: string;
}

const SKIN_COLORS = ['#f8d7b4', '#e8b98a', '#d4a574', '#b8865e', '#8d5c3e', '#5c3a1e'];

const HAIR_PATHS: Record<string, string[]> = {
  Male: [
    'M20,18 Q25,8 35,10 Q45,8 50,18 L48,22 Q40,16 30,16 Q22,16 20,22 Z', // short crop
    'M18,20 Q20,6 35,5 Q50,6 52,20 L50,24 Q42,14 28,14 Q20,14 18,24 Z', // slicked back
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z', // long top
    'M15,25 Q15,5 35,3 Q55,5 55,25 Q52,10 35,8 Q18,10 15,25 Z', // curly
    'M20,20 Q22,8 35,7 Q48,8 50,20 L48,18 Q42,12 35,12 Q28,12 22,18 Z', // neat
    'M14,28 Q14,4 35,2 Q56,4 56,28 Q54,8 35,6 Q16,8 14,28 Z', // long
    'M20,20 Q24,10 35,9 Q46,10 50,20 Q44,14 35,14 Q26,14 20,20 Z', // buzzcut
    'M18,22 Q20,6 35,4 Q50,6 52,22 Q48,10 35,8 Q22,10 18,22 Z', // pompadour
  ],
  Female: [
    'M14,22 Q16,4 35,3 Q54,4 56,22 L56,45 Q54,30 50,28 L50,24 Q42,12 28,12 Q20,12 20,24 L20,28 Q16,30 14,45 Z', // long straight
    'M12,25 Q12,2 35,0 Q58,2 58,25 Q56,35 54,45 Q52,28 48,24 Q42,10 28,10 Q18,10 22,24 Q18,28 16,45 Q14,35 12,25 Z', // long wavy
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z', // bob
    'M15,24 Q15,4 35,2 Q55,4 55,24 Q50,12 35,10 Q20,12 15,24 Z M20,22 Q20,30 22,40 M50,22 Q50,30 48,40', // twin tails
    'M14,22 Q16,4 35,2 Q54,4 56,22 Q56,35 52,32 L50,24 Q42,10 28,10 Q18,10 20,24 L18,32 Q14,35 14,22 Z', // shoulder length
    'M15,24 Q18,3 35,1 Q52,3 55,24 L54,20 Q48,8 35,6 Q22,8 16,20 Z', // pixie
    'M14,24 Q14,2 35,0 Q56,2 56,24 Q56,40 54,50 Q52,32 50,26 Q42,10 28,10 Q18,10 20,26 Q18,32 16,50 Q14,40 14,24 Z', // very long
    'M16,22 Q18,4 35,3 Q52,4 54,22 Q52,15 48,20 Q42,8 28,8 Q18,8 22,20 Q18,15 16,22 Z', // messy bob
  ],
  'Non-binary': [
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,30 Q44,12 26,12 Q18,12 18,30 Z', // mid-length
    'M18,20 Q20,6 35,5 Q50,6 52,20 L50,24 Q42,14 28,14 Q20,14 18,24 Z', // swept
    'M14,22 Q16,4 35,3 Q54,4 56,22 L54,35 Q50,22 48,20 Q42,10 28,10 Q18,10 22,20 Q20,22 16,35 Z', // asymmetric
    'M15,24 Q15,4 35,2 Q55,4 55,24 Q50,12 35,10 Q20,12 15,24 Z', // undercut
    'M16,22 Q18,4 35,3 Q52,4 54,22 L52,26 Q44,12 26,12 Q18,12 16,26 Z', // textured crop
    'M14,25 Q14,3 35,1 Q56,3 56,25 Q54,10 35,8 Q16,10 14,25 Z', // voluminous
    'M20,20 Q22,8 35,7 Q48,8 50,20 L48,18 Q42,12 35,12 Q28,12 22,18 Z', // fade
    'M14,22 Q16,4 35,2 Q54,4 56,22 Q56,38 52,30 L50,24 Q42,10 28,10 Q18,10 20,24 L18,30 Q14,38 14,22 Z', // flowing
  ],
};

export default function CharacterAvatar({ skin, hair, hairColor, gender, outfit, size = 120, className = '' }: CharacterAvatarProps) {
  const skinColor = SKIN_COLORS[skin - 1] || SKIN_COLORS[0];
  const genderKey = gender || 'Male';
  const hairPaths = HAIR_PATHS[genderKey] || HAIR_PATHS['Male'];
  const hairPath = hairPaths[(hair - 1) % hairPaths.length] || hairPaths[0];

  const outfitColors = [
    { primary: '#1e3a5f', secondary: '#2563eb' },
    { primary: '#1e3a1e', secondary: '#22c55e' },
    { primary: '#3a1e3a', secondary: '#8b5cf6' },
    { primary: '#3a1e1e', secondary: '#ef4444' },
    { primary: '#1e2d4a', secondary: '#00e8ff' },
  ];
  const outfitColor = outfitColors[(outfit - 1) % outfitColors.length];

  return (
    <svg width={size} height={size} viewBox="0 0 70 80" className={className}>
      {/* Body/Outfit */}
      <path
        d="M20,52 Q20,48 25,46 L35,44 L45,46 Q50,48 50,52 L52,72 Q52,76 48,76 L22,76 Q18,76 18,72 Z"
        fill={outfitColor.primary}
        stroke={outfitColor.secondary}
        strokeWidth="0.5"
      />
      {/* Collar detail */}
      <path d="M28,46 L35,50 L42,46" fill="none" stroke={outfitColor.secondary} strokeWidth="1" />

      {/* Neck */}
      <rect x="31" y="40" width="8" height="7" rx="2" fill={skinColor} />

      {/* Head */}
      <ellipse cx="35" cy="28" rx="16" ry="18" fill={skinColor} />

      {/* Hair */}
      <path d={hairPath} fill={hairColor} opacity="0.95" />

      {/* Eyes */}
      <g>
        {/* Left eye */}
        <ellipse cx="28" cy="28" rx="3.5" ry="4" fill="white" />
        <ellipse cx="29" cy="28" rx="2" ry="2.5" fill="#1a1a2e" />
        <circle cx="29.5" cy="27" r="0.8" fill="white" />
        {/* Right eye */}
        <ellipse cx="42" cy="28" rx="3.5" ry="4" fill="white" />
        <ellipse cx="41" cy="28" rx="2" ry="2.5" fill="#1a1a2e" />
        <circle cx="41.5" cy="27" r="0.8" fill="white" />
      </g>

      {/* Eyebrows */}
      <path d="M24,23 Q28,21 32,23" fill="none" stroke={hairColor} strokeWidth="1.2" strokeLinecap="round" />
      <path d="M38,23 Q42,21 46,23" fill="none" stroke={hairColor} strokeWidth="1.2" strokeLinecap="round" />

      {/* Nose */}
      <path d="M34,31 Q35,33 36,31" fill="none" stroke={`${skinColor}99`} strokeWidth="0.8" />

      {/* Mouth */}
      <path d="M30,35 Q35,38 40,35" fill="none" stroke="#d4756b" strokeWidth="1" strokeLinecap="round" />

      {/* Ears */}
      <ellipse cx="18" cy="28" rx="3" ry="4" fill={skinColor} />
      <ellipse cx="52" cy="28" rx="3" ry="4" fill={skinColor} />
    </svg>
  );
}
