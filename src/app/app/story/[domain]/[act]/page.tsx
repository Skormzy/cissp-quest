// V1 act route. Redirects to V2 Meridian engine. Server component for
// zero-flash redirect, no JS shipped, no spinner state.
//
// Original V1 implementation preserved at
// src/legacy/v1-backup/v1-act-route.bak/.

import { redirect } from 'next/navigation';

export default async function V1ActRedirect({
  params,
}: {
  params: Promise<{ domain: string; act: string }>;
}) {
  const { domain } = await params;
  const id = parseInt(domain, 10);
  if (!Number.isFinite(id) || id < 1 || id > 8) redirect('/app/story');
  redirect(`/app/story/meridian/${id}`);
}
