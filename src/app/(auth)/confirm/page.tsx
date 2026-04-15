'use client';

import Link from 'next/link';

export default function ConfirmPage() {
  return (
    <div className="min-h-screen flex items-center justify-center px-4" style={{ background: '#080c14' }}>
      <div className="w-full max-w-md text-center">
        <div className="rounded-xl p-8" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <div className="text-5xl mb-4">✅</div>
          <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Email Confirmed!</h2>
          <p className="text-sm mb-6" style={{ color: '#64748b' }}>
            Your account has been verified. You&apos;re ready to begin your CISSP Quest.
          </p>
          <Link
            href="/login"
            className="inline-block px-8 py-3 rounded-lg font-semibold text-sm transition-all hover:opacity-90"
            style={{ background: '#00e8ff', color: '#080c14' }}
          >
            Sign In & Start
          </Link>
        </div>
      </div>
    </div>
  );
}
