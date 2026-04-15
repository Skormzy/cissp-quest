import { DomainChapterDefinition } from '@/lib/story-types';
import { domain2Act1 } from './act1';
import { domain2Act2 } from './act2';
import { domain2Act4 } from './act4';

export const domain2Chapter: DomainChapterDefinition = {
  domainId: 2,
  title: 'The Data Vault',
  location: 'The Data Vault, New Jersey',
  locationGradient: 'linear-gradient(135deg, #0c0a09 0%, #292524 50%, #0c0a09 100%)',
  acts: [
    domain2Act1,  // Act 1: The Briefing
    domain2Act2,  // Act 2: The Investigation
    // Field Test is handled via quiz engine, not act content
    domain2Act4,  // Act 4: The Escalation
  ],
};
