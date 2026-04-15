'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { DOMAINS } from '@/lib/constants';

interface DomainStats {
  total: number;
  correct: number;
  questionCount: number;
}

export default function DomainsPage() {
  const { user } = useUserStore();
  const [domainStats, setDomainStats] = useState<Record<number, DomainStats>>({});
  const [topicCounts, setTopicCounts] = useState<Record<number, number>>({});
  const supabase = createClient();

  useEffect(() => {
    const loadStats = async () => {
      // Load topic counts
      const { data: topics } = await supabase
        .from('library_topics')
        .select('domain_id');

      if (topics) {
        const tc: Record<number, number> = {};
        topics.forEach((t) => { tc[t.domain_id] = (tc[t.domain_id] || 0) + 1; });
        setTopicCounts(tc);
      }

      // Load user answer stats per domain
      if (user) {
        const { data: answers } = await supabase
          .from('user_answers')
          .select('question_id, is_correct, questions!inner(domain_id)')
          .eq('user_id', user.id);

        if (answers) {
          const stats: Record<number, DomainStats> = {};
          answers.forEach((a: any) => {
            const domainId = a.questions?.domain_id;
            if (domainId) {
              if (!stats[domainId]) stats[domainId] = { total: 0, correct: 0, questionCount: 0 };
              stats[domainId].total++;
              if (a.is_correct) stats[domainId].correct++;
            }
          });
          setDomainStats(stats);
        }
      }
    };

    loadStats();
  }, [user]);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>CISSP Domains</h1>
        <p className="text-sm" style={{ color: '#64748b' }}>Master all 8 domains to conquer the exam</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {DOMAINS.map((domain) => {
          const stats = domainStats[domain.id];
          const accuracy = stats ? Math.round((stats.correct / stats.total) * 100) : 0;
          const topics = topicCounts[domain.id] || 0;

          return (
            <div
              key={domain.id}
              className="rounded-xl p-6 transition-all"
              style={{
                background: '#111a2e',
                border: `1px solid ${domain.color}33`,
              }}
            >
              <div className="flex items-start justify-between mb-4">
                <div className="flex items-center gap-3">
                  <span className="text-3xl">{domain.icon}</span>
                  <div>
                    <h3 className="font-bold" style={{ color: '#e2e8f0' }}>Domain {domain.id}</h3>
                    <p className="text-sm" style={{ color: '#94a3b8' }}>{domain.name}</p>
                  </div>
                </div>
                <span className="text-xs font-medium px-2 py-0.5 rounded-full" style={{ background: `${domain.color}22`, color: domain.color }}>
                  {domain.weight}
                </span>
              </div>

              <div className="flex items-center gap-4 mb-3 text-xs" style={{ color: '#64748b' }}>
                <span>{domain.locationEmoji} {domain.location}</span>
                <span>{topics} topics</span>
              </div>

              {/* Mastery bar */}
              <div className="mb-4">
                <div className="flex items-center justify-between text-xs mb-1">
                  <span style={{ color: '#94a3b8' }}>Mastery</span>
                  <span style={{ color: domain.color }}>{stats ? `${accuracy}%` : '0%'}</span>
                </div>
                <div className="h-2 rounded-full overflow-hidden" style={{ background: '#0d1220' }}>
                  <div
                    className="h-full rounded-full transition-all"
                    style={{ width: `${accuracy}%`, background: domain.color }}
                  />
                </div>
                {stats && (
                  <p className="text-[10px] mt-1" style={{ color: '#64748b' }}>
                    {stats.correct}/{stats.total} correct
                  </p>
                )}
              </div>

              <div className="flex gap-2">
                <Link
                  href={`/app/quiz?mode=domain&domain=${domain.id}&count=10`}
                  className="flex-1 py-2 rounded-lg text-xs font-bold text-center transition-all hover:opacity-90"
                  style={{ background: domain.color, color: '#080c14' }}
                >
                  Quiz this Domain
                </Link>
                <Link
                  href={`/app/library?domain=${domain.id}`}
                  className="flex-1 py-2 rounded-lg text-xs font-medium text-center transition-all"
                  style={{ border: `1px solid ${domain.color}44`, color: domain.color }}
                >
                  Study
                </Link>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
