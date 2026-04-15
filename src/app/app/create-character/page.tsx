'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar from '@/components/character/CharacterAvatar';
import { SKIN_TONES, HAIR_COLORS } from '@/lib/constants';

export default function CreateCharacterPage() {
  const [name, setName] = useState('');
  const [gender, setGender] = useState('Male');
  const [skin, setSkin] = useState(1);
  const [hair, setHair] = useState(1);
  const [hairColor, setHairColor] = useState('#2d1b00');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [isEditing, setIsEditing] = useState(false);
  const router = useRouter();
  const supabase = createClient();
  const { user, setUser } = useUserStore();

  const hairStyleCount = 8;

  // Load existing character data if the user already has one
  useEffect(() => {
    if (user?.character_name) {
      setIsEditing(true);
      setName(user.character_name);
      setGender(user.character_gender || 'Male');
      setSkin(user.character_skin || 1);
      setHair(user.character_hair || 1);
      setHairColor(user.character_hair_color || '#2d1b00');
    }
  }, [user]);

  const handleSave = async () => {
    if (!name.trim()) {
      setError('Please enter a character name');
      return;
    }
    setLoading(true);
    setError('');

    const { data: { user: authUser } } = await supabase.auth.getUser();
    if (!authUser) {
      setError('Not authenticated');
      setLoading(false);
      return;
    }

    const characterData = {
      character_name: name.trim(),
      character_gender: gender,
      character_skin: skin,
      character_hair: hair,
      character_hair_color: hairColor,
      display_name: name.trim(),
    };

    const { data, error: dbError } = await supabase
      .from('users')
      .update(characterData)
      .eq('id', authUser.id)
      .select()
      .single();

    if (dbError) {
      // Try upsert if update returns nothing (new user)
      const { data: insertData, error: insertError } = await supabase
        .from('users')
        .upsert({
          id: authUser.id,
          ...characterData,
        })
        .select()
        .single();

      if (insertError) {
        setError(insertError.message);
        setLoading(false);
        return;
      }
      if (insertData) setUser(insertData);
    } else if (data) {
      setUser(data);
    }

    router.push('/app/dashboard');
  };

  return (
    <div className="min-h-screen flex items-center justify-center px-4 py-8" style={{ background: '#080c14' }}>
      <div className="w-full max-w-2xl">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold mb-2" style={{ color: '#00e8ff' }}>
            {isEditing ? 'Edit Your Agent' : 'Create Your Agent'}
          </h1>
          <p style={{ color: '#64748b' }}>
            {isEditing ? 'Update your character appearance' : 'Customize your character for Operation Shadow Protocol'}
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Preview */}
          <div className="flex flex-col items-center justify-center rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <CharacterAvatar skin={skin} hair={hair} hairColor={hairColor} gender={gender} outfit={user?.character_outfit || 1} size={200} />
            <p className="mt-4 text-lg font-bold" style={{ color: '#e2e8f0' }}>
              {name || 'Agent ???'}
            </p>
            <p className="text-xs" style={{ color: '#64748b' }}>
              {isEditing ? `Level ${user?.level || 1}` : 'Level 1 Rookie'}
            </p>
          </div>

          {/* Controls */}
          <div className="space-y-5">
            {/* Name */}
            <div>
              <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Agent Name</label>
              <input
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
                maxLength={20}
                className="w-full px-4 py-3 rounded-lg text-sm outline-none"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
                placeholder="Enter your codename..."
              />
            </div>

            {/* Gender */}
            <div>
              <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Gender</label>
              <div className="flex gap-2">
                {['Male', 'Female', 'Non-binary'].map((g) => (
                  <button
                    key={g}
                    onClick={() => setGender(g)}
                    className="flex-1 py-2 rounded-lg text-sm font-medium transition-all"
                    style={{
                      background: gender === g ? 'rgba(0, 232, 255, 0.15)' : '#0d1220',
                      border: `1px solid ${gender === g ? '#00e8ff' : '#1e2d4a'}`,
                      color: gender === g ? '#00e8ff' : '#94a3b8',
                    }}
                  >
                    {g}
                  </button>
                ))}
              </div>
            </div>

            {/* Skin Tone */}
            <div>
              <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Skin Tone</label>
              <div className="flex gap-3">
                {SKIN_TONES.map((color, i) => (
                  <button
                    key={i}
                    onClick={() => setSkin(i + 1)}
                    className="w-10 h-10 rounded-full transition-all"
                    style={{
                      background: color,
                      border: skin === i + 1 ? '3px solid #00e8ff' : '3px solid transparent',
                      boxShadow: skin === i + 1 ? '0 0 10px rgba(0, 232, 255, 0.3)' : 'none',
                    }}
                  />
                ))}
              </div>
            </div>

            {/* Hair Style */}
            <div>
              <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Hair Style</label>
              <div className="grid grid-cols-4 gap-2">
                {Array.from({ length: hairStyleCount }, (_, i) => (
                  <button
                    key={i}
                    onClick={() => setHair(i + 1)}
                    className="aspect-square rounded-lg flex items-center justify-center transition-all"
                    style={{
                      background: hair === i + 1 ? 'rgba(0, 232, 255, 0.15)' : '#0d1220',
                      border: `1px solid ${hair === i + 1 ? '#00e8ff' : '#1e2d4a'}`,
                    }}
                  >
                    <CharacterAvatar skin={skin} hair={i + 1} hairColor={hairColor} gender={gender} outfit={1} size={40} />
                  </button>
                ))}
              </div>
            </div>

            {/* Hair Color */}
            <div>
              <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Hair Color</label>
              <div className="flex gap-3">
                {HAIR_COLORS.map((color, i) => (
                  <button
                    key={i}
                    onClick={() => setHairColor(color)}
                    className="w-8 h-8 rounded-full transition-all"
                    style={{
                      background: color,
                      border: hairColor === color ? '3px solid #00e8ff' : '3px solid transparent',
                      boxShadow: hairColor === color ? '0 0 10px rgba(0, 232, 255, 0.3)' : 'none',
                    }}
                  />
                ))}
              </div>
            </div>

            {error && (
              <p className="text-sm" style={{ color: '#ef4444' }}>{error}</p>
            )}

            <button
              onClick={handleSave}
              disabled={loading}
              className="w-full py-3 rounded-lg font-bold text-sm transition-all hover:opacity-90 disabled:opacity-50"
              style={{ background: '#00e8ff', color: '#080c14' }}
            >
              {loading ? 'Saving...' : isEditing ? 'Save Changes' : 'Confirm & Begin Mission'}
            </button>

            {isEditing && (
              <button
                onClick={() => router.push('/app/profile')}
                className="w-full py-2 rounded-lg text-sm font-medium transition-all hover:opacity-80"
                style={{ border: '1px solid #1e2d4a', color: '#94a3b8' }}
              >
                Cancel
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
