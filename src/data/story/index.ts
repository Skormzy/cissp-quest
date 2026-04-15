import { ActDefinition, DomainChapterDefinition, StorySceneNode } from '@/lib/story-types';
import { domain1Chapter } from './domain1';
import { domain2Chapter } from './domain2';
import { domain3Chapter } from './domain3';

// ─── Domain Chapter Registry ──────────────────────────────

const chapters: Record<number, DomainChapterDefinition> = {
  1: domain1Chapter,
  2: domain2Chapter,
  3: domain3Chapter,
  // 4-8: Add as content is authored
};

// ─── Public API ───────────────────────────────────────────

export function getDomainChapter(domainId: number): DomainChapterDefinition | null {
  return chapters[domainId] || null;
}

export function getActData(domainId: number, actNumber: number): ActDefinition | null {
  const chapter = chapters[domainId];
  if (!chapter) return null;
  const act = chapter.acts[actNumber - 1]; // acts array is 0-indexed, actNumber is 1-indexed
  return act || null;
}

export function findSceneById(sceneId: string): { node: StorySceneNode; domainId: number; actNumber: number } | null {
  for (const [domainStr, chapter] of Object.entries(chapters)) {
    for (let actIdx = 0; actIdx < chapter.acts.length; actIdx++) {
      const act = chapter.acts[actIdx];
      if (!act) continue;
      const node = act.nodes.find((n) => n.id === sceneId);
      if (node) {
        return { node, domainId: parseInt(domainStr), actNumber: actIdx + 1 };
      }
    }
  }
  return null;
}

export function getAllChapters(): Record<number, DomainChapterDefinition> {
  return chapters;
}
