'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import { LibraryTopic, Question } from '@/lib/types';
import { DOMAINS } from '@/lib/constants';

export default function TopicPage() {
  const params = useParams();
  const topicId = params.topicId as string;
  const [topic, setTopic] = useState<LibraryTopic | null>(null);
  const [relatedTopics, setRelatedTopics] = useState<LibraryTopic[]>([]);
  const [quizQuestions, setQuizQuestions] = useState<Question[]>([]);
  const [isBookmarked, setIsBookmarked] = useState(false);
  const [quizAnswers, setQuizAnswers] = useState<Record<number, number | null>>({});
  const [quizRevealed, setQuizRevealed] = useState<Record<number, boolean>>({});
  const [loading, setLoading] = useState(true);
  const { user } = useUserStore();
  const supabase = createClient();

  useEffect(() => {
    const loadTopic = async () => {
      const { data } = await supabase
        .from('library_topics')
        .select('*')
        .eq('id', topicId)
        .single();

      if (data) {
        setTopic(data);

        // Load related topics
        if (data.related_topic_ids && data.related_topic_ids.length > 0) {
          const { data: related } = await supabase
            .from('library_topics')
            .select('id, title, domain_id, topic_number')
            .in('id', data.related_topic_ids);
          if (related) setRelatedTopics(related as LibraryTopic[]);
        }

        // Load quiz questions for this topic
        const { data: questions } = await supabase
          .from('questions')
          .select('*')
          .eq('library_topic_id', topicId)
          .eq('is_active', true)
          .limit(3);
        if (questions) setQuizQuestions(questions);
      }

      // Check bookmark
      if (user) {
        const { data: bm } = await supabase
          .from('user_bookmarks')
          .select('topic_id')
          .eq('user_id', user.id)
          .eq('topic_id', topicId)
          .single();
        setIsBookmarked(!!bm);
      }

      setLoading(false);
    };

    loadTopic();
  }, [topicId, user]);

  const toggleBookmark = async () => {
    if (!user) return;
    if (isBookmarked) {
      await supabase.from('user_bookmarks').delete().eq('user_id', user.id).eq('topic_id', topicId);
      setIsBookmarked(false);
    } else {
      await supabase.from('user_bookmarks').insert({ user_id: user.id, topic_id: topicId });
      setIsBookmarked(true);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="w-10 h-10 rounded-full border-2 border-t-transparent animate-spin" style={{ borderColor: '#00e8ff', borderTopColor: 'transparent' }} />
      </div>
    );
  }

  if (!topic) {
    return (
      <div className="text-center py-20">
        <div className="text-4xl mb-4">📚</div>
        <p style={{ color: '#64748b' }}>Topic not found</p>
        <Link href="/app/library" className="text-sm mt-4 inline-block" style={{ color: '#00e8ff' }}>Back to Library</Link>
      </div>
    );
  }

  const domain = DOMAINS.find((d) => d.id === topic.domain_id);

  return (
    <div className="max-w-3xl mx-auto space-y-6">
      {/* Back link */}
      <Link href="/app/library" className="inline-flex items-center gap-1 text-sm hover:underline" style={{ color: '#00e8ff' }}>
        ← Back to Library
      </Link>

      {/* Header */}
      <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <div className="flex items-start justify-between gap-4 mb-4">
          <div>
            <div className="inline-flex items-center gap-2 px-2 py-1 rounded-lg text-xs font-medium mb-2" style={{ background: `${domain?.color}22`, color: domain?.color }}>
              {domain?.icon} Domain {topic.domain_id}: {domain?.name}
            </div>
            <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>{topic.title}</h1>
          </div>
          <button
            onClick={toggleBookmark}
            className="text-2xl transition-all hover:scale-110 flex-shrink-0"
            title={isBookmarked ? 'Remove bookmark' : 'Add bookmark'}
          >
            {isBookmarked ? '🔖' : '📑'}
          </button>
        </div>

        {/* One-liner */}
        {topic.one_liner && (
          <div className="rounded-lg p-3" style={{ background: 'rgba(0, 232, 255, 0.08)', border: '1px solid rgba(0, 232, 255, 0.2)' }}>
            <p className="text-sm font-medium" style={{ color: '#00e8ff' }}>{topic.one_liner}</p>
          </div>
        )}

        {/* Memory Anchor */}
        {topic.memory_anchor && (
          <div className="mt-3 flex items-center gap-2 text-sm" style={{ color: '#64748b' }}>
            <span>📍</span>
            <span>{topic.memory_anchor}</span>
          </div>
        )}
      </div>

      {/* Main Content */}
      <div className="rounded-xl p-6 prose-cissp" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
        <ReactMarkdown remarkPlugins={[remarkGfm]}>
          {topic.content_markdown || ''}
        </ReactMarkdown>
      </div>

      {/* Key Formulas */}
      {topic.key_formulas && topic.key_formulas.length > 0 && (
        <div className="rounded-xl p-6" style={{ background: '#0d1a10', border: '1px solid #1a3a1a' }}>
          <h3 className="font-bold mb-3 flex items-center gap-2" style={{ color: '#22c55e' }}>
            📐 Key Formulas
          </h3>
          <div className="space-y-3">
            {topic.key_formulas.map((f, i) => (
              <div key={i} className="rounded-lg p-3" style={{ background: 'rgba(34, 197, 94, 0.08)' }}>
                <code className="text-sm font-bold" style={{ color: '#22c55e' }}>{f.formula}</code>
                <p className="text-xs mt-1" style={{ color: '#94a3b8' }}>{f.description}</p>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Comparison Table */}
      {topic.comparison_table && (
        <div className="rounded-xl p-6 overflow-x-auto" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="font-bold mb-3" style={{ color: '#e2e8f0' }}>📊 Comparison</h3>
          <table className="w-full text-sm">
            <thead>
              <tr>
                {topic.comparison_table.headers.map((h, i) => (
                  <th key={i} className="px-3 py-2 text-left" style={{ background: '#0d1220', color: '#00e8ff', border: '1px solid #1e2d4a' }}>{h}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {topic.comparison_table.rows.map((row, i) => (
                <tr key={i}>
                  {row.map((cell, j) => (
                    <td key={j} className="px-3 py-2" style={{ border: '1px solid #1e2d4a', color: '#cbd5e1' }}>{cell}</td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {/* Exam Tips */}
      {topic.exam_tips && (
        <div className="rounded-xl p-6" style={{ background: '#1a1700', border: '1px solid #3a3000' }}>
          <h3 className="font-bold mb-2 flex items-center gap-2" style={{ color: '#f59e0b' }}>
            ⚠️ Exam Tips
          </h3>
          <p className="text-sm" style={{ color: '#fbbf24' }}>{topic.exam_tips}</p>
        </div>
      )}

      {/* Think Like a Manager */}
      {topic.think_like_manager && (
        <div className="rounded-xl p-6" style={{ background: '#0d1020', border: '1px solid #1e2060' }}>
          <h3 className="font-bold mb-2 flex items-center gap-2" style={{ color: '#60a5fa' }}>
            💼 Think Like a Manager
          </h3>
          <p className="text-sm" style={{ color: '#93c5fd' }}>{topic.think_like_manager}</p>
        </div>
      )}

      {/* Memory Hack */}
      {topic.memory_hack && (
        <div className="rounded-xl p-6" style={{ background: '#1a0d2e', border: '1px solid #2e1a5e' }}>
          <h3 className="font-bold mb-2 flex items-center gap-2" style={{ color: '#a78bfa' }}>
            🧠 Memory Hack
          </h3>
          <p className="text-sm" style={{ color: '#c4b5fd' }}>{topic.memory_hack}</p>
        </div>
      )}

      {/* Video Placeholder */}
      <div className="rounded-xl p-8 text-center" style={{ background: '#111a2e', border: '1px dashed #1e2d4a' }}>
        <div className="text-3xl mb-2">🎬</div>
        <p className="text-sm font-medium" style={{ color: '#64748b' }}>Video lesson coming soon</p>
      </div>

      {/* Related Topics */}
      {relatedTopics.length > 0 && (
        <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="font-bold mb-3" style={{ color: '#e2e8f0' }}>🔗 Related Topics</h3>
          <div className="space-y-2">
            {relatedTopics.map((rt) => (
              <Link
                key={rt.id}
                href={`/app/library/${rt.id}`}
                className="block p-3 rounded-lg transition-all hover:scale-[1.01]"
                style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
              >
                <span className="text-sm" style={{ color: '#00e8ff' }}>
                  {rt.topic_number}. {rt.title}
                </span>
              </Link>
            ))}
          </div>
        </div>
      )}

      {/* Quiz Yourself */}
      {quizQuestions.length > 0 && (
        <div className="rounded-xl p-6" style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}>
          <h3 className="font-bold mb-4" style={{ color: '#e2e8f0' }}>🎯 Quiz Yourself</h3>
          <div className="space-y-6">
            {quizQuestions.map((q, qIndex) => (
              <div key={q.id} className="rounded-lg p-4" style={{ background: '#0d1220' }}>
                <p className="text-sm mb-3" style={{ color: '#e2e8f0' }}>{q.question_text}</p>
                <div className="space-y-2">
                  {q.options.map((opt, oIndex) => {
                    const answered = quizAnswers[qIndex] !== undefined;
                    const isSelected = quizAnswers[qIndex] === oIndex;
                    const isCorrect = oIndex === q.correct_index;
                    const revealed = quizRevealed[qIndex];

                    let optStyle: React.CSSProperties = {
                      background: '#111a2e',
                      border: '1px solid #1e2d4a',
                      color: '#e2e8f0',
                    };

                    if (revealed) {
                      if (isCorrect) {
                        optStyle = { background: 'rgba(34, 197, 94, 0.1)', border: '1px solid #22c55e', color: '#22c55e' };
                      } else if (isSelected && !isCorrect) {
                        optStyle = { background: 'rgba(239, 68, 68, 0.1)', border: '1px solid #ef4444', color: '#ef4444' };
                      }
                    }

                    return (
                      <button
                        key={oIndex}
                        onClick={() => {
                          if (!revealed) {
                            setQuizAnswers({ ...quizAnswers, [qIndex]: oIndex });
                            setQuizRevealed({ ...quizRevealed, [qIndex]: true });
                          }
                        }}
                        className="w-full text-left px-3 py-2 rounded-lg text-sm transition-all"
                        style={optStyle}
                      >
                        <span className="font-medium mr-2">{String.fromCharCode(65 + oIndex)}.</span>
                        {opt}
                      </button>
                    );
                  })}
                </div>
                {quizRevealed[qIndex] && (
                  <div className="mt-3 p-3 rounded-lg text-xs" style={{ background: 'rgba(0, 232, 255, 0.05)', border: '1px solid rgba(0, 232, 255, 0.1)' }}>
                    <p style={{ color: '#94a3b8' }}>{q.explanation}</p>
                  </div>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
