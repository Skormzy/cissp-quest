import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get('code');
  const next = searchParams.get('next') ?? '/app/dashboard';

  if (code) {
    const supabase = await createClient();
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) {
      const { data: { user } } = await supabase.auth.getUser();
      if (user) {
        // Ensure a minimal users row exists. player_profile (canonical
        // identity + progression) is created by the character creator;
        // do NOT seed character_*/xp/level here.
        const { data: existingUser } = await supabase
          .from('users')
          .select('id')
          .eq('id', user.id)
          .maybeSingle();

        if (!existingUser) {
          await supabase
            .from('users')
            .insert({ id: user.id, display_name: user.email });
        }

        // Onboarding gate: send to character creator unless player_profile
        // exists AND onboarding has been completed.
        const { data: profile } = await supabase
          .from('player_profile')
          .select('onboarding_completed_at')
          .eq('user_id', user.id)
          .maybeSingle();

        if (!profile?.onboarding_completed_at) {
          return NextResponse.redirect(`${origin}/app/create-character`);
        }
      }
      return NextResponse.redirect(`${origin}${next}`);
    }
  }

  return NextResponse.redirect(`${origin}/login?error=auth`);
}
