'use client';

import { useParams, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { useUserStore } from '@/stores/useUserStore';
import { createClient } from '@/lib/supabase/client';
import { findSceneById } from '@/data/story';
import VisualNovelEngine from '@/components/story/VisualNovelEngine';

export default function SceneReplayPage() {
  const params = useParams();
  const searchParams = useSearchParams();
  const sceneId = params.sceneId as string;
  const fromParam = searchParams.get('from') || '/app/story';
  const { user } = useUserStore();
  const supabase = createClient();

  const result = findSceneById(sceneId);

  if (!result) {
    return (
      <div className="max-w-2xl mx-auto text-center py-20">
        <div className="text-4xl mb-4">🔍</div>
        <h2 className="text-xl font-bold mb-2" style={{ color: '#e2e8f0' }}>Scene Not Found</h2>
        <p className="text-sm mb-4" style={{ color: '#94a3b8' }}>
          This scene doesn&apos;t exist or hasn&apos;t been authored yet.
        </p>
        <Link href="/app/story" className="inline-block px-6 py-2 rounded-lg text-sm font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
          Back to Story Hub
        </Link>
      </div>
    );
  }

  const { node, domainId } = result;
  const playerName = user?.character_name || 'Agent';

  const handleSceneComplete = async () => {
    if (!user) return;

    // Increment replay count
    const { data: existing } = await supabase
      .from('scene_unlocks')
      .select('replay_count')
      .eq('user_id', user.id)
      .eq('scene_id', sceneId)
      .single();

    if (existing) {
      await supabase
        .from('scene_unlocks')
        .update({
          replay_count: (existing.replay_count || 0) + 1,
          last_replayed_at: new Date().toISOString(),
        })
        .eq('user_id', user.id)
        .eq('scene_id', sceneId);
    }

    // Update spaced repetition schedule if exists
    await supabase
      .from('spaced_repetition_schedule')
      .update({
        last_reviewed_at: new Date().toISOString(),
        next_review_at: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000).toISOString(), // +7 days
        review_interval_days: 7,
      })
      .eq('user_id', user.id)
      .eq('scene_id', sceneId);
  };

  return (
    <div className="max-w-3xl mx-auto">
      <div className="flex items-center justify-between mb-4">
        <Link href={fromParam} className="text-xs inline-flex items-center gap-1" style={{ color: '#64748b' }}>
          ← Back
        </Link>
        <span className="text-xs px-2 py-0.5 rounded-full" style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff' }}>
          Replay Mode
        </span>
      </div>

      <VisualNovelEngine
        scenes={[node]}
        playerName={playerName}
        onSceneComplete={handleSceneComplete}
        isReplayMode={true}
        replaySource={fromParam}
        domainId={domainId}
      />
    </div>
  );
}
