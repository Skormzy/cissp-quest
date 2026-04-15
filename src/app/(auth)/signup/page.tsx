'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import Link from 'next/link';
import { useRouter } from 'next/navigation';

export default function SignupPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const supabase = createClient();

  const handleSignup = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (password !== confirmPassword) {
      setError('Passwords do not match');
      return;
    }

    if (password.length < 6) {
      setError('Password must be at least 6 characters');
      return;
    }

    setLoading(true);

    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${window.location.origin}/auth/callback`,
      },
    });

    if (error) {
      setError(error.message);
      setLoading(false);
      return;
    }

    setSuccess(true);
    setLoading(false);
  };

  if (success) {
    return (
      <div className="min-h-screen flex items-center justify-center px-4" style={{ background: '#080c14' }}>
        <div className="w-full max-w-md text-center">
          <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
            <div className="text-5xl mb-4">📧</div>
            <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Check Your Email</h2>
            <p className="text-sm mb-4" style={{ color: '#64748b' }}>
              We&apos;ve sent a confirmation link to <strong style={{ color: '#00e8ff' }}>{email}</strong>.
              Click the link to activate your account and begin your quest.
            </p>
            <Link href="/login" className="inline-block px-6 py-2 rounded-lg text-sm font-semibold" style={{ background: '#00e8ff', color: '#080c14' }}>
              Go to Login
            </Link>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex items-center justify-center px-4" style={{ background: '#080c14' }}>
      <div className="w-full max-w-md">
        <div className="text-center mb-8">
          <Link href="/" className="inline-block">
            <h1 className="text-3xl font-bold" style={{ color: '#00e8ff' }}>CISSP QUEST</h1>
          </Link>
          <p className="mt-2" style={{ color: '#64748b' }}>Create your account and join the mission</p>
        </div>

        <form onSubmit={handleSignup} className="rounded-xl p-8 space-y-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
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
              className="w-full px-4 py-3 rounded-lg text-sm outline-none transition-all"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
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
              className="w-full px-4 py-3 rounded-lg text-sm outline-none transition-all"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
              placeholder="••••••••"
            />
          </div>

          <div>
            <label className="block text-sm font-medium mb-2" style={{ color: '#e2e8f0' }}>Confirm Password</label>
            <input
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
              className="w-full px-4 py-3 rounded-lg text-sm outline-none transition-all"
              style={{ background: '#0d1220', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
              placeholder="••••••••"
            />
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full py-3 rounded-lg font-semibold text-sm transition-all hover:opacity-90 disabled:opacity-50"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            {loading ? 'Creating Account...' : 'Create Account'}
          </button>

          <p className="text-center text-sm" style={{ color: '#64748b' }}>
            Already have an account?{' '}
            <Link href="/login" className="hover:underline" style={{ color: '#00e8ff' }}>
              Sign in
            </Link>
          </p>
        </form>
      </div>
    </div>
  );
}
