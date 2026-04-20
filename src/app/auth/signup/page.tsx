'use client';

import { useState } from 'react';
import Link from 'next/link';
import { motion } from 'framer-motion';
import { Mail, Lock, Eye, EyeOff, UserPlus, CheckCircle } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';

const PASSWORD_RULES = [
  { label: 'At least 8 characters', test: (p: string) => p.length >= 8 },
  { label: 'One uppercase letter', test: (p: string) => /[A-Z]/.test(p) },
  { label: 'One number', test: (p: string) => /\d/.test(p) },
];

function PasswordStrength({ password }: { password: string }) {
  const passing = PASSWORD_RULES.filter((r) => r.test(password)).length;
  const colors = ['#ef4444', '#f59e0b', '#22c55e'];
  const color = password.length === 0 ? '#1e2d4a' : colors[passing - 1] ?? '#1e2d4a';

  return (
    <div className="mt-2 space-y-2">
      <div className="flex gap-1">
        {PASSWORD_RULES.map((_, i) => (
          <div
            key={i}
            className="flex-1 h-1 rounded-full transition-all duration-300"
            style={{ background: i < passing ? color : '#1e2d4a' }}
          />
        ))}
      </div>
      <div className="space-y-1">
        {PASSWORD_RULES.map((rule) => {
          const ok = password.length > 0 && rule.test(password);
          return (
            <div key={rule.label} className="flex items-center gap-1.5 text-xs"
              style={{ color: ok ? '#22c55e' : '#4a5568' }}>
              <CheckCircle className="w-3 h-3 flex-shrink-0" />
              {rule.label}
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default function SignupPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [showPw, setShowPw] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState(false);
  const [loading, setLoading] = useState(false);
  const [googleLoading, setGoogleLoading] = useState(false);

  const supabase = createClient();

  const handleSignup = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    if (password !== confirmPassword) {
      setError('Passwords do not match.');
      return;
    }

    const failing = PASSWORD_RULES.filter((r) => !r.test(password));
    if (failing.length > 0) {
      setError(`Password must include: ${failing.map((r) => r.label.toLowerCase()).join(', ')}.`);
      return;
    }

    setLoading(true);

    const { error: signUpError } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${window.location.origin}/auth/callback`,
      },
    });

    if (signUpError) {
      setError(signUpError.message);
      setLoading(false);
      return;
    }

    setSuccess(true);
    setLoading(false);
  };

  const handleGoogleSignUp = async () => {
    setGoogleLoading(true);
    const { error: oauthError } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    });
    if (oauthError) {
      setError(oauthError.message);
      setGoogleLoading(false);
    }
  };

  if (success) {
    return (
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className="w-full max-w-md text-center"
      >
        <div
          className="rounded-2xl p-10 shadow-2xl"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
        >
          <motion.div
            initial={{ scale: 0 }}
            animate={{ scale: 1 }}
            transition={{ delay: 0.1, type: 'spring', stiffness: 200 }}
            className="text-6xl mb-5"
          >
            📧
          </motion.div>
          <h2 className="text-2xl font-extrabold mb-3" style={{ color: '#e2e8f0' }}>
            Check Your Email
          </h2>
          <p className="text-sm mb-2" style={{ color: '#94a3b8' }}>
            A confirmation link has been sent to
          </p>
          <p className="text-sm font-semibold mb-6" style={{ color: '#00e8ff' }}>
            {email}
          </p>
          <p className="text-xs mb-8" style={{ color: '#64748b' }}>
            Click the link in the email to activate your account and begin Operation Shadow Protocol.
          </p>
          <Link href="/auth/login"
            className="inline-flex w-full items-center justify-center rounded-lg h-11 text-sm font-bold transition-opacity hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}>
            Go to Sign In
          </Link>
        </div>
      </motion.div>
    );
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: 24 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5 }}
      className="w-full max-w-md"
    >
      {/* Heading */}
      <div className="text-center mb-8">
        <h1 className="text-3xl font-extrabold mb-2" style={{ color: '#e2e8f0' }}>
          Join the Mission
        </h1>
        <p className="text-sm" style={{ color: '#64748b' }}>
          Free to start. No credit card needed.
        </p>
      </div>

      {/* Card */}
      <div
        className="rounded-2xl p-8 shadow-2xl"
        style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
      >
        {error && (
          <motion.div
            initial={{ opacity: 0, scale: 0.97 }}
            animate={{ opacity: 1, scale: 1 }}
            className="rounded-lg p-3 mb-5 text-sm"
            style={{
              background: 'rgba(239, 68, 68, 0.08)',
              border: '1px solid rgba(239, 68, 68, 0.3)',
              color: '#ef4444',
            }}
          >
            {error}
          </motion.div>
        )}

        {/* Google OAuth */}
        <Button
          type="button"
          variant="outline"
          className="w-full h-11 mb-4 text-sm font-medium flex items-center justify-center gap-3"
          style={{
            background: '#111a2e',
            borderColor: '#1e2d4a',
            color: '#e2e8f0',
          }}
          onClick={handleGoogleSignUp}
          disabled={googleLoading}
        >
          <svg className="w-4 h-4" viewBox="0 0 24 24" fill="none">
            <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
            <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
            <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
            <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.47 2.09 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
          </svg>
          {googleLoading ? 'Redirecting…' : 'Continue with Google'}
        </Button>

        <div className="flex items-center gap-3 mb-5">
          <div className="flex-1 h-px" style={{ background: '#1e2d4a' }} />
          <span className="text-xs" style={{ color: '#4a5568' }}>or sign up with email</span>
          <div className="flex-1 h-px" style={{ background: '#1e2d4a' }} />
        </div>

        <form onSubmit={handleSignup} className="space-y-4">
          {/* Email */}
          <div className="space-y-1.5">
            <Label htmlFor="email" style={{ color: '#94a3b8' }}>Email</Label>
            <div className="relative">
              <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4" style={{ color: '#4a5568' }} />
              <Input
                id="email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                placeholder="agent@example.com"
                className="pl-10 h-11 text-sm"
                style={{ background: '#080c14', borderColor: '#1e2d4a', color: '#e2e8f0' }}
              />
            </div>
          </div>

          {/* Password */}
          <div className="space-y-1.5">
            <Label htmlFor="password" style={{ color: '#94a3b8' }}>Password</Label>
            <div className="relative">
              <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4" style={{ color: '#4a5568' }} />
              <Input
                id="password"
                type={showPw ? 'text' : 'password'}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                placeholder="Create a strong password"
                className="pl-10 pr-10 h-11 text-sm"
                style={{ background: '#080c14', borderColor: '#1e2d4a', color: '#e2e8f0' }}
              />
              <button type="button" onClick={() => setShowPw((v) => !v)}
                className="absolute right-3 top-1/2 -translate-y-1/2" style={{ color: '#4a5568' }}>
                {showPw ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
              </button>
            </div>
            {password.length > 0 && <PasswordStrength password={password} />}
          </div>

          {/* Confirm */}
          <div className="space-y-1.5">
            <Label htmlFor="confirm" style={{ color: '#94a3b8' }}>Confirm Password</Label>
            <div className="relative">
              <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4" style={{ color: '#4a5568' }} />
              <Input
                id="confirm"
                type={showConfirm ? 'text' : 'password'}
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                required
                placeholder="Repeat your password"
                className="pl-10 pr-10 h-11 text-sm"
                style={{
                  background: '#080c14',
                  borderColor: confirmPassword.length > 0
                    ? (confirmPassword === password ? 'rgba(34,197,94,0.5)' : 'rgba(239,68,68,0.5)')
                    : '#1e2d4a',
                  color: '#e2e8f0',
                }}
              />
              <button type="button" onClick={() => setShowConfirm((v) => !v)}
                className="absolute right-3 top-1/2 -translate-y-1/2" style={{ color: '#4a5568' }}>
                {showConfirm ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
              </button>
            </div>
          </div>

          <Button
            type="submit"
            disabled={loading}
            className="w-full h-11 text-sm font-bold flex items-center justify-center gap-2 mt-2"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            {loading ? (
              <>
                <div className="w-4 h-4 border-2 border-current border-t-transparent rounded-full animate-spin" />
                Creating account…
              </>
            ) : (
              <>
                <UserPlus className="w-4 h-4" />
                Create Free Account
              </>
            )}
          </Button>
        </form>

        <p className="text-center text-sm mt-5" style={{ color: '#64748b' }}>
          Already have an account?{' '}
          <Link href="/auth/login" className="font-semibold hover:underline" style={{ color: '#00e8ff' }}>
            Sign in
          </Link>
        </p>
      </div>
    </motion.div>
  );
}
