'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import Link from 'next/link';
import { useRouter } from 'next/navigation';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const supabase = createClient();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    const { error } = await supabase.auth.signInWithPassword({ email, password });

    if (error) {
      setError(error.message);
      setLoading(false);
      return;
    }

    // Check if user has created a character
    const { data: { user } } = await supabase.auth.getUser();
    if (user) {
      const { data: profile } = await supabase
        .from('users')
        .select('character_name')
        .eq('id', user.id)
        .single();

      if (!profile?.character_name) {
        router.push('/app/create-character');
        return;
      }
    }

    router.push('/app/dashboard');
  };

  return (
    <div className="min-h-screen flex items-center justify-center px-4" style={{ background: '#080c14' }}>
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <Link href="/" className="inline-block">
            <h1 className="text-3xl font-bold" style={{ color: '#00e8ff' }}>CISSP QUEST</h1>
          </Link>
          <p className="mt-2" style={{ color: '#64748b' }}>Sign in to continue your mission</p>
        </div>

        <form onSubmit={handleLogin} className="rounded-xl p-8 space-y-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          {error && (
            <div className="rounded-lg p-3 text-sm" style={{ background: 'rgba(239, 68, 68, 0.1)', border: '1px solid rgba(239, 68, 68, 0.3)', color: '#ef4444' }}>
              {error}
            </div>
          )}

          <div>
            <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="w-full px-4 py-3 rounded-lg text-sm outline-none transition-all focus:ring-2"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0', '--tw-ring-color': '#00e8ff' } as React.CSSProperties}
              placeholder="agent@cissp-quest.com"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Password</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
              className="w-full px-4 py-3 rounded-lg text-sm outline-none transition-all focus:ring-2"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' } as React.CSSProperties}
              placeholder="••••••••"
            />
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full py-3 rounded-lg font-semibold text-sm transition-all hover:opacity-90 disabled:opacity-50"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            {loading ? 'Signing in...' : 'Sign In'}
          </button>

          <div className="text-center space-y-2">
            <Link href="/reset-password" className="block text-sm hover:underline" style={{ color: '#00e8ff' }}>
              Forgot password?
            </Link>
            <p className="text-sm" style={{ color: '#64748b' }}>
              No account?{' '}
              <Link href="/signup" className="hover:underline" style={{ color: '#00e8ff' }}>
                Create one
              </Link>
            </p>
          </div>
        </form>
      </div>
    </div>
  );
}
