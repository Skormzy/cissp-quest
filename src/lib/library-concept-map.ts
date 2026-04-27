// Library topic -> concept-diagram key.
//
// Best-effort mapping. The library topics live in the database, so
// topic.id values vary. This mapper accepts a topic record (id, title,
// domain_id) and returns the most-relevant ConceptKey, or null.

import type { ConceptKey } from '@/components/diagrams/ConceptDiagram';

interface TopicLike {
  id?: string;
  title?: string | null;
  domain_id?: number | null;
  topic_number?: number | string | null;
}

const KEYWORD_MAP: { keywords: string[]; key: ConceptKey }[] = [
  { keywords: ['cia triad', 'confidentiality integrity availability', 'cia'], key: 'cia-triad' },
  { keywords: ['risk treatment', 'risk response', 'avoid mitigate transfer accept'], key: 'risk-treatment' },
  { keywords: ['ale', 'sle', 'aro', 'annualized loss'],                key: 'ale-formula' },
  { keywords: ['grc', 'governance risk compliance'],                    key: 'grc-immune' },
  { keywords: ['policy hierarchy', 'standards procedures guidelines', 'security policy'], key: 'policy-pyramid' },
  { keywords: ['bell-lapadula', 'bell lapadula', 'bell-la padula', 'no read up', 'no write down'], key: 'bell-lapadula' },
  { keywords: ['biba', 'no read down', 'no write up', 'integrity model'], key: 'biba' },
  { keywords: ['defense in depth', 'layered defense', 'defense-in-depth'], key: 'defense-in-depth' },
  { keywords: ['osi model', 'osi layer', 'osi stack', 'seven layer'],     key: 'osi-stack' },
  { keywords: ['tls 1.3', 'tls handshake', 'forward secrecy'],            key: 'tls-handshake' },
  { keywords: ['kerberos', 'tgt', 'tgs', 'ticket granting'],              key: 'kerberos-flow' },
  { keywords: ['least privilege', 'minimum access', 'privilege management'], key: 'least-privilege' },
  { keywords: ['zero trust'],                                              key: 'zero-trust' },
  { keywords: ['biometric', 'far frr', 'crossover error rate', 'cer'],     key: 'biometric-curve' },
  { keywords: ['evidence acquisition', 'volatility', 'order of volatility', 'rfc 3227'], key: 'evidence-volatility' },
  { keywords: ['penetration test', 'pentest', 'ptes'],                     key: 'pentest-phases' },
  { keywords: ['sast', 'dast', 'iast', 'rasp'],                            key: 'sast-dast-iast' },
  { keywords: ['nist ir', 'incident response lifecycle', 'incident response phases'], key: 'nist-ir-cycle' },
  { keywords: ['siem', 'soar', 'security information', 'security orchestration'], key: 'siem-soar' },
  { keywords: ['dr test', 'disaster recovery test', 'parallel test', 'tabletop'], key: 'dr-test-ladder' },
  { keywords: ['devsecops', 'shift left', 'security gate', 'pipeline security'], key: 'devsecops-pipeline' },
  { keywords: ['owasp top 10', 'owasp a01', 'broken access control'],       key: 'owasp-top-10' },
  { keywords: ['data lifecycle', 'data states', 'create use archive destroy'], key: 'data-lifecycle' },
  { keywords: ['aaa', 'authentication authorization accounting'],           key: 'aaa-services' },
  { keywords: ['sanitization', 'media disposal', 'clearing purging destruction', 'media destruction'], key: 'sanitization-levels' },
  { keywords: ['oauth', 'authorization code', 'pkce'],                      key: 'oauth-flow' },
  { keywords: ['wpa2', 'wpa3', 'eap-tls', 'wireless authentication', '802.1x'], key: 'wireless-auth' },
  { keywords: ['cap theorem'],                                              key: 'cap-theorem' },
];

export function mapTopicToConcept(topic: TopicLike): ConceptKey | null {
  const haystack = [topic.id, topic.title]
    .filter(Boolean)
    .join(' ')
    .toLowerCase();
  if (!haystack) return null;
  for (const { keywords, key } of KEYWORD_MAP) {
    for (const kw of keywords) {
      if (haystack.includes(kw)) return key;
    }
  }
  return null;
}
