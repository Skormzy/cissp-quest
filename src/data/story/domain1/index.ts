import { DomainChapterDefinition } from '@/lib/story-types';
import { domain1Act1 } from './act1';
import { domain1Act2 } from './act2';
import { domain1Act4 } from './act4';

export const domain1Chapter: DomainChapterDefinition = {
  domainId: 1,
  title: 'The Breach',
  location: 'Nexus HQ, New York',
  locationGradient: 'linear-gradient(135deg, #0f172a 0%, #1e1b4b 50%, #0f172a 100%)',
  acts: [
    domain1Act1,  // Act 1: The Briefing
    domain1Act2,  // Act 2: The Investigation
    // Field Test is handled via quiz engine, not act content
    domain1Act4,  // Act 4: The Escalation
  ],
};
