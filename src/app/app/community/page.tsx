'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { MessageSquare, Swords, Users, Lock } from 'lucide-react';
import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs';
import { Badge } from '@/components/ui/badge';
import DomainLounge from '@/components/community/DomainLounge';
import WeeklyLeaderboard from '@/components/community/WeeklyLeaderboard';
import { useUserStore } from '@/stores/useUserStore';
import { hasAccess } from '@/lib/stripe/config';

const DOMAIN_LOUNGES = [
  { id: 1, name: 'Risk Management', color: '#ef4444', emoji: '🛡️' },
  { id: 2, name: 'Asset Security',  color: '#f97316', emoji: '🏦' },
  { id: 3, name: 'Architecture',    color: '#eab308', emoji: '🏗️' },
  { id: 4, name: 'Network Security',color: '#22c55e', emoji: '🌐' },
  { id: 5, name: 'IAM',             color: '#06b6d4', emoji: '🔑' },
  { id: 6, name: 'Assessment',      color: '#8b5cf6', emoji: '🔬' },
  { id: 7, name: 'Sec Operations',  color: '#ec4899', emoji: '🚨' },
  { id: 8, name: 'Soft Dev Sec',    color: '#00e8ff', emoji: '💻' },
];

function LockedOverlay({ feature }: { feature: string }) {
  return (
    <div className="flex flex-col items-center justify-center py-24 gap-4">
      <div className="w-16 h-16 rounded-full flex items-center justify-center" style={{ background: '#111a2e' }}>
        <Lock className="w-8 h-8" style={{ color: '#4a5568' }} />
      </div>
      <p className="text-base font-semibold" style={{ color: '#94a3b8' }}>{feature} requires Premium</p>
      <a
        href="/app/upgrade"
        className="px-5 py-2 rounded-lg text-sm font-bold transition-opacity hover:opacity-80"
        style={{ background: '#00e8ff', color: '#080c14' }}
      >
        Upgrade to Premium
      </a>
    </div>
  );
}

export default function CommunityPage() {
  const { user } = useUserStore();
  const [selectedLounge, setSelectedLounge] = useState<number | null>(null);

  const tier = (user?.subscription_tier ?? 'free') as 'free' | 'pro' | 'premium' | 'expert';
  const hasCommunity = hasAccess(tier, 'premium');

  return (
    <div className="max-w-5xl mx-auto px-4 py-8 space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl font-bold" style={{ color: '#e2e8f0' }}>Community</h1>
        <p className="text-sm mt-1" style={{ color: '#64748b' }}>
          Study together. Compete. Conquer the CISSP.
        </p>
      </div>

      <Tabs defaultValue="lounges">
        <TabsList className="border-b w-full rounded-none justify-start gap-0 bg-transparent">
          {[
            { value: 'lounges', label: 'Domain Lounges', icon: MessageSquare },
            { value: 'warroom', label: 'War Room',        icon: Swords        },
            { value: 'squads',  label: 'Study Squads',    icon: Users         },
            { value: 'weekly',  label: 'Leaderboard',     icon: null          },
          ].map(({ value, label, icon: Icon }) => (
            <TabsTrigger
              key={value}
              value={value}
              className="rounded-none border-b-2 border-transparent data-[state=active]:border-[#00e8ff] data-[state=active]:text-[#00e8ff] px-4 py-3 text-sm font-medium"
              style={{ color: '#64748b' }}
            >
              <span className="flex items-center gap-2">
                {Icon && <Icon className="w-4 h-4" />}
                {label}
              </span>
            </TabsTrigger>
          ))}
        </TabsList>

        {/* Domain Lounges */}
        <TabsContent value="lounges" className="mt-6">
          {!hasCommunity ? (
            <LockedOverlay feature="Domain Lounges" />
          ) : selectedLounge !== null ? (
            <AnimatePresence mode="wait">
              <motion.div
                key={selectedLounge}
                initial={{ opacity: 0, x: 20 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: -20 }}
                transition={{ duration: 0.25 }}
              >
                <button
                  className="flex items-center gap-2 mb-4 text-sm transition-colors hover:text-white"
                  style={{ color: '#64748b' }}
                  onClick={() => setSelectedLounge(null)}
                >
                  ← Back to lounges
                </button>
                <DomainLounge
                  domainId={selectedLounge}
                  domainName={DOMAIN_LOUNGES.find(d => d.id === selectedLounge)?.name ?? ''}
                />
              </motion.div>
            </AnimatePresence>
          ) : (
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
              {DOMAIN_LOUNGES.map((lounge, i) => (
                <motion.button
                  key={lounge.id}
                  className="rounded-xl p-4 text-left border transition-colors hover:border-[#00e8ff33]"
                  style={{ background: '#0d1220', borderColor: '#1e2d4a' }}
                  initial={{ opacity: 0, y: 12 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: i * 0.05 }}
                  onClick={() => setSelectedLounge(lounge.id)}
                >
                  <div className="text-2xl mb-2">{lounge.emoji}</div>
                  <p className="text-xs font-bold" style={{ color: '#e2e8f0' }}>D{lounge.id}</p>
                  <p className="text-xs mt-0.5" style={{ color: '#64748b' }}>{lounge.name}</p>
                  <div className="mt-2 w-full h-0.5 rounded-full" style={{ background: lounge.color, opacity: 0.4 }} />
                </motion.button>
              ))}
            </div>
          )}
        </TabsContent>

        {/* War Room */}
        <TabsContent value="warroom" className="mt-6">
          {!hasCommunity ? (
            <LockedOverlay feature="War Room" />
          ) : (
            <div className="rounded-xl border p-6" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
              <div className="flex items-center gap-3 mb-4">
                <Swords className="w-5 h-5" style={{ color: '#00e8ff' }} />
                <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>War Room</h2>
                <Badge variant="outline" style={{ borderColor: '#00e8ff33', color: '#00e8ff', fontSize: '11px' }}>
                  Premium
                </Badge>
              </div>
              <p className="text-sm" style={{ color: '#64748b' }}>
                The War Room is your battleground for full CISSP debates. Post tricky scenarios, challenge
                explanations, and refine your thinking with peers.
              </p>
              <div className="mt-6 text-center py-12 rounded-lg border border-dashed" style={{ borderColor: '#1e2d4a' }}>
                <p className="text-sm" style={{ color: '#475569' }}>Forum posts coming soon</p>
              </div>
            </div>
          )}
        </TabsContent>

        {/* Study Squads */}
        <TabsContent value="squads" className="mt-6">
          {!hasCommunity ? (
            <LockedOverlay feature="Study Squads" />
          ) : (
            <div className="rounded-xl border p-6" style={{ background: '#0d1220', borderColor: '#1e2d4a' }}>
              <div className="flex items-center gap-3 mb-4">
                <Users className="w-5 h-5" style={{ color: '#00e8ff' }} />
                <h2 className="text-lg font-bold" style={{ color: '#e2e8f0' }}>Study Squads</h2>
              </div>
              <p className="text-sm mb-6" style={{ color: '#64748b' }}>
                Form a squad of up to 5 people. Share progress, hold each other accountable, and compete
                on the weekly leaderboard together.
              </p>
              <div className="text-center py-12 rounded-lg border border-dashed" style={{ borderColor: '#1e2d4a' }}>
                <p className="text-sm" style={{ color: '#475569' }}>Squad creation coming soon</p>
              </div>
            </div>
          )}
        </TabsContent>

        {/* Weekly Leaderboard */}
        <TabsContent value="weekly" className="mt-6">
          <WeeklyLeaderboard />
        </TabsContent>
      </Tabs>
    </div>
  );
}
