'use client';

import { Suspense, useEffect, useState } from 'react';
import Link from 'next/link';
import { useSearchParams, useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { DOMAINS } from '@/lib/constants';
import { LibraryTopic } from '@/lib/types';

export default function LibraryPageWrapper() {
  return (
    <Suspense fallback={
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
      </div>
    }>
      <LibraryPage />
    </Suspense>
  );
}

function LibraryPage() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const [topics, setTopics] = useState<LibraryTopic[]>([]);
  const [bookmarks, setBookmarks] = useState<string[]>([]);
  const [search, setSearch] = useState('');
  const [tab, setTab] = useState<'all' | 'bookmarks'>('all');
  const [loading, setLoading] = useState(true);
  const [domainFilter, setDomainFilter] = useState<number | null>(null);
  const { user } = useUserStore();
  const supabase = createClient();

  // Read domain filter from URL on mount
  useEffect(() => {
    const domainParam = searchParams.get('domain');
    if (domainParam) {
      const parsed = parseInt(domainParam);
      if (parsed >= 1 && parsed <= 8) {
        setDomainFilter(parsed);
      }
    }
  }, [searchParams]);

  useEffect(() => {
    const loadData = async () => {
      const { data } = await supabase
        .from('library_topics')
        .select('*')
        .order('domain_id')
        .order('topic_number');

      if (data) setTopics(data);

      if (user) {
        const { data: bm } = await supabase
          .from('user_bookmarks')
          .select('topic_id')
          .eq('user_id', user.id);
        if (bm) setBookmarks(bm.map((b) => b.topic_id));
      }

      setLoading(false);
    };

    loadData();
  }, [user]);

  const clearDomainFilter = () => {
    setDomainFilter(null);
    // Update URL without the domain param
    router.replace('/app/library');
  };

  const filteredTopics = topics.filter((t) => {
    const matchesDomain = !domainFilter || t.domain_id === domainFilter;
    const matchesSearch = !search ||
      t.title.toLowerCase().includes(search.toLowerCase()) ||
      t.one_liner?.toLowerCase().includes(search.toLowerCase());
    const matchesTab = tab === 'all' || bookmarks.includes(t.id);
    return matchesDomain && matchesSearch && matchesTab;
  });

  const groupedByDomain = DOMAINS.map((domain) => ({
    ...domain,
    topics: filteredTopics.filter((t) => t.domain_id === domain.id),
  }));

  const activeDomain = domainFilter ? DOMAINS.find((d) => d.id === domainFilter) : null;

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Reference Library</h1>
          <p className="text-sm" style={{ color: '#64748b' }}>{topics.length} topics across 8 domains</p>
        </div>

        {/* Tabs */}
        <div className="flex gap-2 flex-wrap">
          <button
            onClick={() => setTab('all')}
            className="px-4 py-1.5 rounded-lg text-sm font-medium transition-all"
            style={{
              background: tab === 'all' ? 'rgba(0, 232, 255, 0.15)' : '#0d1220',
              color: tab === 'all' ? '#00e8ff' : '#94a3b8',
              border: `1px solid ${tab === 'all' ? '#00e8ff' : '#1e2d4a'}`,
            }}
          >
            All Topics
          </button>
          <button
            onClick={() => setTab('bookmarks')}
            className="px-4 py-1.5 rounded-lg text-sm font-medium transition-all"
            style={{
              background: tab === 'bookmarks' ? 'rgba(0, 232, 255, 0.15)' : '#0d1220',
              color: tab === 'bookmarks' ? '#00e8ff' : '#94a3b8',
              border: `1px solid ${tab === 'bookmarks' ? '#00e8ff' : '#1e2d4a'}`,
            }}
          >
            My Bookmarks ({bookmarks.length})
          </button>
          <Link
            href="/app/library/glossary"
            className="px-4 py-1.5 rounded-lg text-sm font-medium transition-all"
            style={{
              background: '#0d1220',
              color: '#94a3b8',
              border: '1px solid #1e2d4a',
            }}
          >
            Glossary
          </Link>
        </div>
      </div>

      {/* Domain Filter Banner */}
      {activeDomain && (
        <div
          className="flex items-center justify-between rounded-xl px-4 py-3"
          style={{ background: `${activeDomain.color}11`, border: `1px solid ${activeDomain.color}33` }}
        >
          <div className="flex items-center gap-2">
            <span className="text-lg">{activeDomain.icon}</span>
            <span className="text-sm font-bold" style={{ color: activeDomain.color }}>
              Showing Domain {activeDomain.id}: {activeDomain.name}
            </span>
          </div>
          <button
            onClick={clearDomainFilter}
            className="text-xs font-medium px-3 py-1 rounded-lg transition-all hover:opacity-80"
            style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff', border: '1px solid rgba(0, 232, 255, 0.2)' }}
          >
            Show All
          </button>
        </div>
      )}

      {/* Search */}
      <div className="relative">
        <span className="absolute left-3 top-1/2 -translate-y-1/2 text-lg">🔍</span>
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search topics..."
          className="w-full pl-10 pr-4 py-3 rounded-xl text-sm outline-none"
          style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
        />
      </div>

      {/* Domain Cards */}
      <div className="space-y-6">
        {groupedByDomain.map((domain) => {
          if (domain.topics.length === 0) return null;
          return (
            <div key={domain.id}>
              <div className="flex items-center gap-3 mb-3">
                <span className="text-xl">{domain.icon}</span>
                <div>
                  <h2 className="font-bold" style={{ color: '#e2e8f0' }}>
                    Domain {domain.id}: {domain.name}
                  </h2>
                  <p className="text-xs" style={{ color: '#64748b' }}>
                    {domain.topics.length} topics &bull; {domain.weight} of exam
                  </p>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                {domain.topics.map((topic) => (
                  <Link
                    key={topic.id}
                    href={`/app/library/${topic.id}`}
                    className="rounded-xl p-4 transition-all hover:scale-[1.02]"
                    style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
                  >
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <h3 className="font-bold text-sm" style={{ color: '#e2e8f0' }}>
                        {topic.topic_number}. {topic.title}
                      </h3>
                      {bookmarks.includes(topic.id) && <span className="text-sm">🔖</span>}
                    </div>
                    <p className="text-xs" style={{ color: '#94a3b8' }}>{topic.one_liner}</p>
                    {topic.memory_anchor && (
                      <p className="text-xs mt-2" style={{ color: '#64748b' }}>{topic.memory_anchor}</p>
                    )}
                  </Link>
                ))}
              </div>
            </div>
          );
        })}

        {filteredTopics.length === 0 && (
          <div className="text-center py-12">
            <div className="text-4xl mb-4">📚</div>
            <p style={{ color: '#64748b' }}>
              {tab === 'bookmarks' ? 'No bookmarks yet. Bookmark topics to find them here.' : 'No topics match your search.'}
            </p>
          </div>
        )}
      </div>
    </div>
  );
}
