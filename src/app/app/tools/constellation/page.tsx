'use client';

import EvidenceConstellation from '@/components/tools/EvidenceConstellation';
import { ArrowLeft } from 'lucide-react';
import Link from 'next/link';

export default function ConstellationPage() {
  return (
    <div className="min-h-screen" style={{ background: '#080c14' }}>
      <div className="max-w-7xl mx-auto px-4 py-8 space-y-6">
        <Link
          href="/app/tools"
          className="flex items-center gap-2 text-sm transition-colors hover:text-slate-200 w-fit"
          style={{ color: '#64748b' }}
        >
          <ArrowLeft size={14} />
          Back to Tools
        </Link>

        <div>
          <h1 className="text-3xl font-black tracking-tight" style={{ color: '#e2e8f0' }}>
            Evidence Constellation{' '}
            <span className="text-xl font-semibold" style={{ color: '#00e8ff' }}>
              — The CISSP Knowledge Map
            </span>
          </h1>
          <p className="mt-2 text-sm max-w-2xl" style={{ color: '#64748b' }}>
            Every CISSP concept mapped as a living galaxy. Nodes sized by exam weight, colored by domain.
            Explore connections, spot relationships across domains, and navigate straight to the Reference Library.
          </p>
        </div>

        <EvidenceConstellation />
      </div>
    </div>
  );
}
