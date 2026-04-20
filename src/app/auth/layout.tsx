import type { Metadata } from 'next';
import Link from 'next/link';
import { Layers } from 'lucide-react';

export const metadata: Metadata = {
  title: 'CISSP Quest — Sign In',
  description: 'Sign in or create your CISSP Quest account.',
};

export default function AuthLayout({ children }: { children: React.ReactNode }) {
  return (
    <div
      className="min-h-screen flex flex-col"
      style={{ background: '#080c14', color: '#e2e8f0' }}
    >
      {/* Minimal top nav */}
      <nav className="flex items-center justify-between px-6 py-4 border-b"
        style={{ borderColor: '#1e2d4a', background: '#0a0f1a' }}>
        <Link href="/" className="flex items-center gap-2">
          <Layers className="w-4 h-4" style={{ color: '#00e8ff' }} />
          <span className="text-base font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
          <span className="text-base font-bold">QUEST</span>
        </Link>
        <Link href="/" className="text-sm transition-colors hover:text-white" style={{ color: '#64748b' }}>
          Back to home
        </Link>
      </nav>

      {/* Content */}
      <div className="flex-1 flex items-center justify-center px-4 py-12">
        {children}
      </div>

      {/* Footer */}
      <footer className="py-4 text-center text-xs border-t" style={{ borderColor: '#1e2d4a', color: '#4a5568' }}>
        &copy; 2025 CISSP Quest. Not affiliated with (ISC)&sup2;.
      </footer>
    </div>
  );
}
