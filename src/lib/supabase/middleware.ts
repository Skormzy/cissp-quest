import { createServerClient } from '@supabase/ssr';
import { createClient } from '@supabase/supabase-js';
import { NextResponse, type NextRequest } from 'next/server';

const ONBOARDING_PATH = '/app/create-character';

// Service-role admin client used ONLY to verify profile existence in the
// middleware. Never trust user-supplied data with this client; never write
// with it. RLS bypass is intentional here so a flaky SSR cookie context
// can't bounce a user with a real profile back to onboarding.
let adminClientCache: ReturnType<typeof createClient> | null = null;
function getAdminClient() {
  if (adminClientCache) return adminClientCache;
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!url || !serviceKey) return null;
  adminClientCache = createClient(url, serviceKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  return adminClientCache;
}

export async function updateSession(request: NextRequest) {
  let supabaseResponse = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const pathname = request.nextUrl.pathname;

  if (!user && pathname.startsWith('/app')) {
    const url = request.nextUrl.clone();
    url.pathname = '/login';
    return NextResponse.redirect(url);
  }

  if (user && (pathname === '/login' || pathname === '/signup')) {
    const url = request.nextUrl.clone();
    url.pathname = '/app/dashboard';
    return NextResponse.redirect(url);
  }

  if (
    user &&
    pathname.startsWith('/app') &&
    pathname !== ONBOARDING_PATH &&
    !pathname.startsWith('/api') &&
    !pathname.startsWith('/auth')
  ) {
    // Use the admin client to bypass RLS for the existence check. This avoids
    // a class of bug where a row exists but the SSR cookie context fails to
    // propagate auth.uid() to RLS, returning a false-negative null.
    const admin = getAdminClient();
    const client = admin ?? supabase;

    const { data: profile, error } = await client
      .from('player_profile')
      .select('user_id')
      .eq('user_id', user.id)
      .maybeSingle();

    // If the lookup itself errored, fail OPEN (let them through) rather than
    // bouncing them to onboarding. A 500 from the DB should not nuke an
    // existing user's session.
    if (error) {
      console.warn('[middleware] player_profile lookup failed', {
        userId: user.id,
        message: error.message,
      });
      return supabaseResponse;
    }

    if (!profile) {
      const url = request.nextUrl.clone();
      url.pathname = ONBOARDING_PATH;
      return NextResponse.redirect(url);
    }
  }

  return supabaseResponse;
}
