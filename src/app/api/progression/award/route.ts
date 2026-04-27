import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';
import { awardXp } from '@/lib/progression';

// POST /api/progression/award
// Body: { amount: number, reason: string }
// Auth: Supabase session cookie. user_id resolved from auth.getUser() — never trusted from body.
export async function POST(request: Request) {
  let body: { amount?: unknown; reason?: unknown };
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ ok: false, error: 'invalid json' }, { status: 400 });
  }

  const amount = typeof body.amount === 'number' ? body.amount : Number(body.amount);
  const reason = typeof body.reason === 'string' ? body.reason : '';

  if (!Number.isFinite(amount) || amount < 0 || amount > 10000) {
    return NextResponse.json({ ok: false, error: 'invalid amount' }, { status: 400 });
  }
  if (!reason || reason.length > 200) {
    return NextResponse.json({ ok: false, error: 'invalid reason' }, { status: 400 });
  }

  const supabase = await createClient();
  const { data: { user }, error: authErr } = await supabase.auth.getUser();
  if (authErr || !user) {
    return NextResponse.json({ ok: false, error: 'unauthorized' }, { status: 401 });
  }

  const result = await awardXp(user.id, amount, reason);
  if (!result.ok) {
    return NextResponse.json(result, { status: 500 });
  }
  return NextResponse.json(result);
}
