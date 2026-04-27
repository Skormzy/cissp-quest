'use client';

// V1 domain entry page. Replaced with a redirect to the V2 Meridian
// engine, which is now the single source of truth for story playback.
//
// The original V1 implementation (act-list selector with progress
// indicators) is preserved in src/legacy/v1-backup/v1-domain-page.tsx.bak
// for reference.

import { useEffect } from 'react';
import { useParams, useRouter } from 'next/navigation';

export default function V1DomainRedirect() {
  const params = useParams();
  const router = useRouter();

  useEffect(() => {
    const domainId = parseInt(params.domain as string, 10);
    if (!Number.isFinite(domainId) || domainId < 1 || domainId > 8) {
      router.replace('/app/story');
      return;
    }
    router.replace(`/app/story/meridian/${domainId}`);
  }, [params, router]);

  return (
    <div className="flex items-center justify-center min-h-[60vh]">
      <div
        className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin"
        style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }}
      />
    </div>
  );
}
