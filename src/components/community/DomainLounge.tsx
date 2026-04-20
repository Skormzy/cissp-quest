'use client';

import { useState, useEffect, useRef, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Send, Users } from 'lucide-react';
import { createClient } from '@/lib/supabase/client';
import { useUserStore } from '@/stores/useUserStore';
import CharacterAvatar, { type CharacterConfig } from '@/components/character/CharacterAvatar';
import { Button } from '@/components/ui/button';
import { Textarea } from '@/components/ui/textarea';

interface ChatMessage {
  id: string;
  domain_id: number;
  user_id: string;
  message: string;
  created_at: string;
  character_name: string | null;
  display_name: string | null;
  character_gender: string | null;
  character_skin: number;
  character_hair: number;
  character_hair_color: string;
  character_eye_shape: number;
  character_outfit: number;
}

interface Props {
  domainId: number;
  domainName: string;
  domainColor?: string;
}

const RATE_LIMIT = 5;          // max posts per minute
const RATE_WINDOW_MS = 60_000; // 1 minute
const MAX_CHARS = 2000;

function buildAvatarConfig(msg: ChatMessage): CharacterConfig {
  return {
    gender: (msg.character_gender as CharacterConfig['gender']) ?? 'Man',
    skinTone: msg.character_skin || 1,
    hairStyle: msg.character_hair || 1,
    hairColor: msg.character_hair_color || '#2d1b00',
    eyeShape: msg.character_eye_shape || 1,
    outfit: msg.character_outfit || 1,
  };
}

function formatTime(isoString: string): string {
  const d = new Date(isoString);
  return d.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
}

export default function DomainLounge({ domainId, domainName, domainColor = '#00e8ff' }: Props) {
  const { user } = useUserStore();
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(true);
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [onlineCount, setOnlineCount] = useState(1);

  const bottomRef = useRef<HTMLDivElement>(null);
  const recentPostsRef = useRef<number[]>([]);
  const supabase = createClient();

  const scrollToBottom = useCallback(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, []);

  const fetchMessages = useCallback(async () => {
    const { data, error: fetchErr } = await supabase
      .from('chatroom_messages')
      .select(`
        id,
        domain_id,
        user_id,
        message,
        created_at,
        users!inner(
          character_name,
          display_name,
          character_gender,
          character_skin,
          character_hair,
          character_hair_color,
          character_eye_shape,
          character_outfit
        )
      `)
      .eq('domain_id', domainId)
      .order('created_at', { ascending: true })
      .limit(100);

    if (!fetchErr && data) {
      const mapped: ChatMessage[] = data.map((row) => {
        const u = Array.isArray(row.users) ? row.users[0] : row.users;
        return {
          id: row.id,
          domain_id: row.domain_id,
          user_id: row.user_id,
          message: row.message,
          created_at: row.created_at,
          character_name: u?.character_name ?? null,
          display_name: u?.display_name ?? null,
          character_gender: u?.character_gender ?? null,
          character_skin: u?.character_skin ?? 1,
          character_hair: u?.character_hair ?? 1,
          character_hair_color: u?.character_hair_color ?? '#2d1b00',
          character_eye_shape: u?.character_eye_shape ?? 1,
          character_outfit: u?.character_outfit ?? 1,
        };
      });
      setMessages(mapped);
    }
    setLoading(false);
    setTimeout(scrollToBottom, 50);
  }, [domainId, supabase, scrollToBottom]);

  useEffect(() => {
    fetchMessages();

    // Realtime messages
    const msgChannel = supabase
      .channel(`domain-lounge-${domainId}`)
      .on(
        'postgres_changes',
        { event: 'INSERT', schema: 'public', table: 'chatroom_messages', filter: `domain_id=eq.${domainId}` },
        () => { fetchMessages(); }
      )
      .subscribe();

    // Presence for online count
    if (user) {
      const presenceChannel = supabase.channel(`presence-domain-${domainId}`, {
        config: { presence: { key: user.id } },
      });

      presenceChannel
        .on('presence', { event: 'sync' }, () => {
          const state = presenceChannel.presenceState();
          setOnlineCount(Object.keys(state).length);
        })
        .subscribe(async (status) => {
          if (status === 'SUBSCRIBED') {
            await presenceChannel.track({ user_id: user.id });
          }
        });

      return () => {
        supabase.removeChannel(msgChannel);
        supabase.removeChannel(presenceChannel);
      };
    }

    return () => {
      supabase.removeChannel(msgChannel);
    };
  }, [domainId, user, supabase, fetchMessages]);

  const handleSend = async () => {
    if (!input.trim() || !user || sending) return;
    setError(null);

    // Client-side rate limit
    const now = Date.now();
    recentPostsRef.current = recentPostsRef.current.filter((t) => now - t < RATE_WINDOW_MS);
    if (recentPostsRef.current.length >= RATE_LIMIT) {
      setError('You are posting too quickly. Please wait a moment.');
      return;
    }

    const text = input.trim().slice(0, MAX_CHARS);
    setSending(true);
    recentPostsRef.current.push(now);

    const { error: insertErr } = await supabase
      .from('chatroom_messages')
      .insert({ domain_id: domainId, user_id: user.id, message: text });

    if (insertErr) {
      setError('Failed to send message. Please try again.');
      recentPostsRef.current.pop();
    } else {
      setInput('');
    }
    setSending(false);
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <div
      className="flex flex-col rounded-xl overflow-hidden"
      style={{
        background: '#0d1220',
        border: '1px solid #1e2d4a',
        height: 520,
      }}
    >
      {/* Header */}
      <div className="flex items-center justify-between px-4 py-3 border-b flex-shrink-0"
        style={{ borderColor: '#1e2d4a', background: '#080c14' }}>
        <div className="flex items-center gap-2">
          <div className="w-2 h-2 rounded-full animate-pulse" style={{ background: domainColor }} />
          <h3 className="text-sm font-bold" style={{ color: '#e2e8f0' }}>
            {domainName}
          </h3>
          <span className="text-xs px-2 py-0.5 rounded-full"
            style={{ background: `${domainColor}20`, color: domainColor }}>
            Lounge
          </span>
        </div>
        <div className="flex items-center gap-1.5 text-xs" style={{ color: '#94a3b8' }}>
          <Users className="w-3.5 h-3.5" />
          <span>{onlineCount} online</span>
        </div>
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto px-4 py-3 space-y-4 min-h-0">
        {loading ? (
          <div className="flex items-center justify-center h-full text-sm" style={{ color: '#4a5568' }}>
            Loading messages…
          </div>
        ) : messages.length === 0 ? (
          <div className="flex flex-col items-center justify-center h-full gap-2 text-center">
            <span className="text-3xl">💬</span>
            <p className="text-sm" style={{ color: '#4a5568' }}>
              No messages yet. Start the conversation!
            </p>
          </div>
        ) : (
          <AnimatePresence initial={false}>
            {messages.map((msg, idx) => {
              const isOwn = msg.user_id === user?.id;
              const avatarCfg = buildAvatarConfig(msg);
              const agentName = msg.character_name ?? msg.display_name ?? 'Agent';
              const prev = messages[idx - 1];
              const sameAuthor = prev?.user_id === msg.user_id;

              return (
                <motion.div
                  key={msg.id}
                  initial={{ opacity: 0, y: 12 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ duration: 0.2 }}
                  className={`flex items-end gap-2 ${isOwn ? 'flex-row-reverse' : ''}`}
                >
                  {/* Avatar — only show if first message in a sequence */}
                  <div className="flex-shrink-0" style={{ width: 28, height: 28, opacity: sameAuthor ? 0 : 1 }}>
                    {!sameAuthor && (
                      <div className="w-7 h-7 rounded-full overflow-hidden"
                        style={{ border: '1px solid #1e2d4a' }}>
                        <CharacterAvatar config={avatarCfg} size={28} />
                      </div>
                    )}
                  </div>

                  {/* Bubble */}
                  <div className={`flex flex-col ${isOwn ? 'items-end' : 'items-start'} max-w-[75%]`}>
                    {!sameAuthor && (
                      <div className="flex items-center gap-2 mb-1 px-1">
                        <span className="text-xs font-semibold"
                          style={{ color: isOwn ? '#00e8ff' : '#94a3b8' }}>
                          {agentName}
                        </span>
                        <span className="text-xs" style={{ color: '#4a5568' }}>
                          {formatTime(msg.created_at)}
                        </span>
                      </div>
                    )}
                    <div
                      className="px-3 py-2 rounded-2xl text-sm break-words"
                      style={{
                        background: isOwn ? `${domainColor}22` : '#111a2e',
                        border: `1px solid ${isOwn ? `${domainColor}40` : '#1e2d4a'}`,
                        color: '#e2e8f0',
                        borderBottomRightRadius: isOwn ? 4 : undefined,
                        borderBottomLeftRadius: isOwn ? undefined : 4,
                      }}
                    >
                      {msg.message}
                    </div>
                    {sameAuthor && (
                      <span className="text-xs mt-0.5 px-1" style={{ color: '#4a5568' }}>
                        {formatTime(msg.created_at)}
                      </span>
                    )}
                  </div>
                </motion.div>
              );
            })}
          </AnimatePresence>
        )}
        <div ref={bottomRef} />
      </div>

      {/* Input */}
      <div className="px-4 py-3 border-t flex-shrink-0" style={{ borderColor: '#1e2d4a', background: '#080c14' }}>
        {error && (
          <p className="text-xs mb-2 px-1" style={{ color: '#ef4444' }}>{error}</p>
        )}
        {!user ? (
          <p className="text-sm text-center py-2" style={{ color: '#4a5568' }}>
            Sign in to join the conversation.
          </p>
        ) : (
          <div className="flex items-end gap-2">
            <Textarea
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder="Message the lounge… (Enter to send)"
              maxLength={MAX_CHARS}
              rows={1}
              className="flex-1 resize-none text-sm min-h-[38px] max-h-24 py-2"
              style={{
                background: '#111a2e',
                border: '1px solid #1e2d4a',
                color: '#e2e8f0',
              }}
            />
            <div className="flex flex-col items-end gap-1">
              <span className="text-xs" style={{ color: '#4a5568' }}>
                {input.length}/{MAX_CHARS}
              </span>
              <Button
                onClick={handleSend}
                disabled={!input.trim() || sending}
                size="sm"
                className="px-3 h-8"
                style={{ background: domainColor, color: '#080c14' }}
              >
                <Send className="w-3.5 h-3.5" />
              </Button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
