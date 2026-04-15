import { DomainChapterDefinition } from '@/lib/story-types';
import { domain3Act1 } from './act1';
import { domain3Act2 } from './act2';
import { domain3Act4 } from './act4';

export const domain3Chapter: DomainChapterDefinition = {
  domainId: 3,
  title: 'The Architecture Flaw',
  location: 'Server Farm, Zurich',
  locationGradient: 'linear-gradient(135deg, #0f172a 0%, #164e63 50%, #0f172a 100%)',
  acts: [
    domain3Act1,  // Act 1: The Briefing
    domain3Act2,  // Act 2: The Investigation
    // Field Test is handled via quiz engine, not act content
    domain3Act4,  // Act 4: The Escalation
  ],
};
