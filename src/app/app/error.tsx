'use client';

import { useEffect } from 'react';
import Link from 'next/link';
import { Button } from '@/components/ui/button';

export default function AppErrorBoundary({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    console.error('[app-error-boundary]', error);
  }, [error]);

  return (
    <div className="flex min-h-[60vh] items-center justify-center px-4">
      <div
        className="max-w-md w-full rounded-2xl p-6 text-center"
        style={{
          background: '#111a2e',
          border: '1px solid #1e2d4a',
          boxShadow: '0 0 32px rgba(0,232,255,0.08)',
        }}
        role="alert"
        aria-live="assertive"
      >
        <div className="text-3xl mb-3" aria-hidden="true">⚠️</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>
          Operation interrupted
        </h2>
        <p className="text-sm mb-5" style={{ color: '#94a3b8' }}>
          Something went sideways while loading this screen. The mission console kept your progress safe.
        </p>
        {error.digest && (
          <p className="text-xs font-mono mb-4" style={{ color: '#64748b' }}>
            ref: {error.digest}
          </p>
        )}
        <div className="flex flex-col sm:flex-row gap-2 justify-center">
          <Button onClick={() => reset()} variant="default">
            Try again
          </Button>
          <Link
            href="/app/dashboard"
            className="inline-flex items-center justify-center px-4 py-2 rounded-md text-sm font-medium border transition-colors hover:opacity-90"
            style={{ borderColor: '#1e2d4a', color: '#e2e8f0' }}
          >
            Return to dashboard
          </Link>
        </div>
      </div>
    </div>
  );
}
