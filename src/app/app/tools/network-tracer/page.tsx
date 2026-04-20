'use client';

import NetworkTopologyTracer from '@/components/tools/NetworkTopologyTracer';
import { ArrowLeft } from 'lucide-react';
import Link from 'next/link';

export default function NetworkTracerPage() {
  return (
    <div className="min-h-screen" style={{ background: '#080c14' }}>
      <div className="max-w-4xl mx-auto px-4 py-8 space-y-6">
        <Link href="/app/tools" className="flex items-center gap-2 text-sm transition-colors hover:text-slate-200" style={{ color: '#64748b' }}>
          <ArrowLeft size={14} />
          Back to Tools
        </Link>
        <NetworkTopologyTracer />
      </div>
    </div>
  );
}
