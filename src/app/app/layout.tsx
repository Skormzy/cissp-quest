'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import AppShell from '@/components/layout/AppShell';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';

export default function AppLayout({ children }: { children: React.ReactNode }) {
  const { setUser, setProfile, setLoading } = useUserStore();
  const router = useRouter();
  const supabase = createClient();

  useEffect(() => {
    const loadUser = async () => {
      const { data: { user: authUser } } = await supabase.auth.getUser();
      if (!authUser) {
        router.push('/login');
        return;
      }

      const [{ data: userRow }, { data: profileRow }] = await Promise.all([
        supabase.from('users').select('*').eq('id', authUser.id).maybeSingle(),
        supabase.from('player_profile').select('*').eq('user_id', authUser.id).maybeSingle(),
      ]);

      if (userRow) {
        setUser(userRow);
      } else {
        const { data: newUser } = await supabase
          .from('users')
          .insert({ id: authUser.id, display_name: authUser.email })
          .select()
          .single();
        if (newUser) setUser(newUser);
      }

      // player_profile is canonical for identity + progression. If it's
      // missing or onboarding hasn't completed, send the user to the
      // character creator.
      if (profileRow && profileRow.onboarding_completed_at) {
        setProfile(profileRow);
      } else {
        setProfile(profileRow ?? null);
        router.push('/app/create-character');
      }

      setLoading(false);
    };

    loadUser();

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!session) {
        setUser(null);
        setProfile(null);
        router.push('/login');
      }
    });

    return () => subscription.unsubscribe();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return <AppShell>{children}</AppShell>;
}
