'use client';

import { useState, useMemo, useEffect, useCallback, useRef } from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { DOMAINS } from '@/lib/constants';
import { GLOSSARY_TERMS } from '@/data/glossary';

export default function GlossaryPage() {
  const { user } = useUserStore();
  const supabase = createClient();
  const [search, setSearch] = useState('');
  const [domainFilter, setDomainFilter] = useState<number>(0);
  const [domainAccuracy, setDomainAccuracy] = useState<Record<number, number>>({});
  const [showScrollTop, setShowScrollTop] = useState(false);
  const [bookmarkedTerms, setBookmarkedTerms] = useState<Set<string>>(new Set());
  const [showBookmarkedOnly, setShowBookmarkedOnly] = useState(false);

  // Refs for sticky column header + horizontal scroll sync
  const stickyHeaderRef = useRef<HTMLDivElement>(null);
  const colHeaderRef = useRef<HTMLDivElement>(null);
  const tableBodyRef = useRef<HTMLDivElement>(null);
  const [colHeaderTop, setColHeaderTop] = useState(200);

  // Measure sticky header height to position column headers below it
  useEffect(() => {
    const measure = () => {
      if (stickyHeaderRef.current) {
        // Navbar is h-14 (56px), sticky header sits at top-14
        setColHeaderTop(56 + stickyHeaderRef.current.offsetHeight);
      }
    };
    measure();
    const observer = new ResizeObserver(measure);
    if (stickyHeaderRef.current) observer.observe(stickyHeaderRef.current);
    return () => observer.disconnect();
  }, [showBookmarkedOnly]);

  // Sync horizontal scroll from table body to column header
  const syncScroll = useCallback(() => {
    if (colHeaderRef.current && tableBodyRef.current) {
      colHeaderRef.current.scrollLeft = tableBodyRef.current.scrollLeft;
    }
  }, []);

  // Load per-domain accuracy from user_question_history
  useEffect(() => {
    if (!user) return;

    const loadAccuracy = async () => {
      const { data } = await supabase
        .from('user_question_history')
        .select('domain_id, is_correct')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(500);

      if (data) {
        const byDomain: Record<number, { correct: number; total: number }> = {};
        data.forEach((r) => {
          if (!byDomain[r.domain_id]) byDomain[r.domain_id] = { correct: 0, total: 0 };
          byDomain[r.domain_id].total++;
          if (r.is_correct) byDomain[r.domain_id].correct++;
        });

        const acc: Record<number, number> = {};
        Object.entries(byDomain).forEach(([domainId, stats]) => {
          acc[parseInt(domainId)] = Math.round((stats.correct / stats.total) * 100);
        });
        setDomainAccuracy(acc);
      }
    };

    loadAccuracy();
  }, [user]);

  // Load glossary bookmarks
  useEffect(() => {
    if (!user) return;

    const loadBookmarks = async () => {
      const { data } = await supabase
        .from('user_glossary_bookmarks')
        .select('term')
        .eq('user_id', user.id);

      if (data) {
        setBookmarkedTerms(new Set(data.map((b) => b.term)));
      }
    };

    loadBookmarks();
  }, [user]);

  // Scroll listener for scroll-to-top button
  useEffect(() => {
    const handleScroll = () => {
      setShowScrollTop(window.scrollY > 400);
    };
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  const toggleBookmark = useCallback(async (termName: string) => {
    if (!user) return;

    const isBookmarked = bookmarkedTerms.has(termName);

    // Optimistic update
    setBookmarkedTerms((prev) => {
      const next = new Set(prev);
      if (isBookmarked) {
        next.delete(termName);
      } else {
        next.add(termName);
      }
      return next;
    });

    if (isBookmarked) {
      await supabase
        .from('user_glossary_bookmarks')
        .delete()
        .eq('user_id', user.id)
        .eq('term', termName);
    } else {
      await supabase
        .from('user_glossary_bookmarks')
        .insert({ user_id: user.id, term: termName });
    }
  }, [user, bookmarkedTerms, supabase]);

  const filteredTerms = useMemo(() => {
    return GLOSSARY_TERMS.filter((term) => {
      const matchesDomain = domainFilter === 0 || term.domain_id === domainFilter;
      const matchesSearch = !search ||
        term.term.toLowerCase().includes(search.toLowerCase()) ||
        term.definition.toLowerCase().includes(search.toLowerCase());
      const matchesBookmark = !showBookmarkedOnly || bookmarkedTerms.has(term.term);
      return matchesDomain && matchesSearch && matchesBookmark;
    });
  }, [search, domainFilter, showBookmarkedOnly, bookmarkedTerms]);

  // Group by first letter for alphabetical navigation
  const letters = useMemo(() => {
    const letterSet = new Set(filteredTerms.map((t) => t.term[0].toUpperCase()));
    return Array.from(letterSet).sort();
  }, [filteredTerms]);

  // Build a flat row index for alternating shading
  let rowIndex = 0;

  const domainColor = (id: number) => DOMAINS.find((d) => d.id === id)?.color || '#94a3b8';
  const domainIcon = (id: number) => DOMAINS.find((d) => d.id === id)?.icon || '';

  return (
    <div>
      {/* Sticky header section */}
      <div
        ref={stickyHeaderRef}
        className="sticky top-14 z-20 pb-4 pt-2 space-y-4"
        style={{ background: '#080c14' }}
      >
        {/* Header */}
        <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
          <div>
            <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>CISSP Master Glossary</h1>
            <p className="text-sm" style={{ color: '#64748b' }}>
              {GLOSSARY_TERMS.length} terms across 8 domains &bull; {filteredTerms.length} shown
              {showBookmarkedOnly && ` &bull; ${bookmarkedTerms.size} bookmarked`}
            </p>
          </div>
          <Link
            href="/app/library"
            className="px-4 py-1.5 rounded-lg text-sm font-medium shrink-0"
            style={{ background: '#0d1220', color: '#00e8ff', border: '1px solid #1e2d4a' }}
          >
            Back to Library
          </Link>
        </div>

        {/* Search + Filter + Bookmark toggle */}
        <div className="flex flex-col sm:flex-row gap-3">
          <div className="relative flex-1">
            <span className="absolute left-3 top-1/2 -translate-y-1/2 text-lg">🔍</span>
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Search terms or definitions..."
              className="w-full pl-10 pr-4 py-2.5 rounded-xl text-sm outline-none"
              style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
            />
          </div>
          <select
            value={domainFilter}
            onChange={(e) => setDomainFilter(parseInt(e.target.value))}
            className="px-4 py-2.5 rounded-xl text-sm outline-none shrink-0"
            style={{ background: '#111a2e', border: '1px solid #1e2d4a', color: '#e2e8f0' }}
          >
            <option value={0}>All Domains</option>
            {DOMAINS.map((d) => (
              <option key={d.id} value={d.id}>{d.icon} D{d.id}: {d.name}</option>
            ))}
          </select>
          <button
            onClick={() => setShowBookmarkedOnly(!showBookmarkedOnly)}
            className="px-4 py-2.5 rounded-xl text-sm font-medium shrink-0 transition-all"
            style={{
              background: showBookmarkedOnly ? 'rgba(250, 204, 21, 0.12)' : '#111a2e',
              border: `1px solid ${showBookmarkedOnly ? '#facc15' : '#1e2d4a'}`,
              color: showBookmarkedOnly ? '#facc15' : '#94a3b8',
            }}
          >
            {showBookmarkedOnly ? '★ Bookmarked' : '☆ Bookmarked'}
            {bookmarkedTerms.size > 0 && ` (${bookmarkedTerms.size})`}
          </button>
        </div>

        {/* Alphabet Quick Nav */}
        <div className="flex flex-wrap gap-1">
          {letters.map((letter) => (
            <a
              key={letter}
              href={`#letter-${letter}`}
              className="w-7 h-7 rounded text-xs font-bold flex items-center justify-center transition-all hover:scale-110"
              style={{ background: 'rgba(0, 232, 255, 0.08)', color: '#00e8ff', border: '1px solid rgba(0, 232, 255, 0.2)' }}
            >
              {letter}
            </a>
          ))}
        </div>

        {/* Bottom border for sticky header */}
        <div className="h-px" style={{ background: '#1e2d4a' }} />
      </div>

      {/* Domain Accuracy Overview */}
      {Object.keys(domainAccuracy).length > 0 && (
        <div className="rounded-xl p-4 mt-4 mb-4" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="text-xs font-bold mb-3" style={{ color: '#94a3b8' }}>YOUR DOMAIN ACCURACY</h3>
          <div className="grid grid-cols-4 sm:grid-cols-8 gap-2">
            {DOMAINS.map((d) => {
              const acc = domainAccuracy[d.id];
              return (
                <div key={d.id} className="text-center">
                  <div className="text-lg">{d.icon}</div>
                  <div className="text-xs font-bold" style={{ color: acc !== undefined ? d.color : '#64748b' }}>
                    {acc !== undefined ? `${acc}%` : '—'}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Terms Table */}
      {filteredTerms.length === 0 ? (
        <div className="text-center py-12">
          <div className="text-4xl mb-4">{showBookmarkedOnly ? '☆' : '📖'}</div>
          <p style={{ color: '#64748b' }}>
            {showBookmarkedOnly ? 'No bookmarked terms yet. Star terms you want to review later.' : 'No terms match your search.'}
          </p>
        </div>
      ) : (
        <>
          {/* Sticky column headers — positioned below sticky filter header */}
          <div
            ref={colHeaderRef}
            className="sticky z-[19]"
            style={{
              top: colHeaderTop,
              overflowX: 'hidden',
              background: '#0d1220',
              borderTop: '1px solid #1e2d4a',
              borderLeft: '1px solid #1e2d4a',
              borderRight: '1px solid #1e2d4a',
              borderRadius: '12px 12px 0 0',
            }}
          >
            <div className="flex" style={{ minWidth: 950 }}>
              <div className="shrink-0 px-2 py-3" style={{ width: 40 }} />
              <div className="shrink-0 px-3 py-3 text-[10px] font-bold whitespace-nowrap" style={{ width: 160, color: '#94a3b8' }}>TERM</div>
              <div className="shrink-0 px-3 py-3 text-[10px] font-bold whitespace-nowrap" style={{ width: 70, color: '#94a3b8' }}>DOMAIN</div>
              <div className="flex-1 px-3 py-3 text-[10px] font-bold" style={{ minWidth: 250, color: '#94a3b8' }}>DEFINITION</div>
              <div className="shrink-0 px-3 py-3 text-[10px] font-bold" style={{ width: 230, color: '#94a3b8' }}>EXAM TIP</div>
              <div className="shrink-0 px-3 py-3 text-[10px] font-bold" style={{ width: 200, color: '#94a3b8' }}>MEMORY HACK</div>
            </div>
          </div>

          {/* Scrollable table body */}
          <div
            ref={tableBodyRef}
            className="overflow-x-auto"
            onScroll={syncScroll}
            style={{
              borderLeft: '1px solid #1e2d4a',
              borderRight: '1px solid #1e2d4a',
              borderBottom: '1px solid #1e2d4a',
              borderRadius: '0 0 12px 12px',
            }}
          >
            <table className="w-full" style={{ minWidth: 950, tableLayout: 'fixed' }}>
              <colgroup>
                <col style={{ width: 40 }} />
                <col style={{ width: 160 }} />
                <col style={{ width: 70 }} />
                <col />
                <col style={{ width: 230 }} />
                <col style={{ width: 200 }} />
              </colgroup>
              <tbody>
                {letters.map((letter) => {
                  const termsForLetter = filteredTerms.filter((t) => t.term[0].toUpperCase() === letter);
                  if (termsForLetter.length === 0) return null;

                  return termsForLetter.map((term, i) => {
                    const currentRow = rowIndex++;
                    const isEven = currentRow % 2 === 0;
                    const isStarred = bookmarkedTerms.has(term.term);

                    return (
                      <tr
                        key={term.term}
                        id={i === 0 ? `letter-${letter}` : undefined}
                        className="border-t"
                        style={{
                          borderColor: '#1e2d4a',
                          background: isEven ? '#111a2e' : '#0e1628',
                          scrollMarginTop: colHeaderTop + 40,
                        }}
                      >
                        {/* Bookmark Star */}
                        <td className="px-2 py-3 align-top text-center">
                          <button
                            onClick={() => toggleBookmark(term.term)}
                            className="text-sm transition-all hover:scale-125"
                            style={{ color: isStarred ? '#facc15' : '#334155' }}
                            title={isStarred ? 'Remove bookmark' : 'Bookmark this term'}
                          >
                            {isStarred ? '★' : '☆'}
                          </button>
                        </td>

                        {/* Term */}
                        <td className="px-3 py-3 align-top">
                          <span className="text-sm font-bold" style={{ color: '#e2e8f0' }}>{term.term}</span>
                        </td>

                        {/* Domain Badge */}
                        <td className="px-3 py-3 align-top">
                          <span
                            className="text-[10px] px-2 py-0.5 rounded-full whitespace-nowrap inline-flex items-center gap-1"
                            style={{ background: `${domainColor(term.domain_id)}22`, color: domainColor(term.domain_id) }}
                          >
                            {domainIcon(term.domain_id)} D{term.domain_id}
                          </span>
                        </td>

                        {/* Definition */}
                        <td className="px-3 py-3 align-top">
                          <p className="text-xs leading-relaxed" style={{ color: '#e2e8f0' }}>{term.definition}</p>
                        </td>

                        {/* Exam Tip */}
                        <td className="px-3 py-3 align-top">
                          {term.exam_tip ? (
                            <p className="text-xs leading-relaxed" style={{ color: '#fca5a5' }}>{term.exam_tip}</p>
                          ) : (
                            <span className="text-xs" style={{ color: '#64748b' }}>—</span>
                          )}
                        </td>

                        {/* Memory Hack */}
                        <td className="px-3 py-3 align-top">
                          {term.memory_hack ? (
                            <p className="text-xs leading-relaxed" style={{ color: '#c4b5fd' }}>{term.memory_hack}</p>
                          ) : (
                            <span className="text-xs" style={{ color: '#64748b' }}>—</span>
                          )}
                        </td>
                      </tr>
                    );
                  });
                })}
              </tbody>
            </table>
          </div>
        </>
      )}

      {/* Scroll to Top Button */}
      {showScrollTop && (
        <button
          onClick={scrollToTop}
          className="fixed bottom-6 right-6 z-50 w-11 h-11 rounded-full flex items-center justify-center transition-all hover:scale-110 shadow-lg"
          style={{
            background: '#111a2e',
            border: '2px solid #00e8ff',
            color: '#00e8ff',
            boxShadow: '0 0 20px rgba(0, 232, 255, 0.2)',
          }}
          title="Scroll to top"
        >
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
            <polyline points="18 15 12 9 6 15" />
          </svg>
        </button>
      )}
    </div>
  );
}
