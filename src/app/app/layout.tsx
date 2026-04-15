'use client';

import { useEffect } from 'react';
import { useRouter } from 'next/navigation';
import Navbar from '@/components/nav/Navbar';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';

export default function AppLayout({ children }: { children: React.ReactNode }) {
  const { user, setUser, setLoading } = useUserStore();
  const router = useRouter();
  const supabase = createClient();

  useEffect(() => {
    const loadUser = async () => {
      const { data: { user: authUser } } = await supabase.auth.getUser();
      if (!authUser) {
        router.push('/login');
        return;
      }

      const { data: profile } = await supabase
        .from('users')
        .select('*')
        .eq('id', authUser.id)
        .single();

      if (profile) {
        setUser(profile);
        if (!profile.character_name) {
          router.push('/app/create-character');
        }
      } else {
        // Create user profile if it doesn't exist
        const { data: newProfile } = await supabase
          .from('users')
          .insert({ id: authUser.id, display_name: authUser.email })
          .select()
          .single();
        if (newProfile) {
          setUser(newProfile);
          router.push('/app/create-character');
        }
      }
      setLoading(false);
    };

    loadUser();

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (!session) {
        setUser(null);
        router.push('/login');
      }
    });

    return () => subscription.unsubscribe();
  }, []);

  return (
    <div className="min-h-screen" style={{ background: '#080c14' }}>
      <Navbar />
      <main className="max-w-7xl mx-auto px-4 py-6">
        {children}
      </main>
    </div>
  );
}
