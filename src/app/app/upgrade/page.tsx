'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { motion } from 'framer-motion';
import { Check, Zap, Shield, Star, Crown } from 'lucide-react';
import { useUserStore } from '@/stores/useUserStore';
import { STRIPE_TIERS } from '@/lib/stripe/config';

const TIER_ICONS = { pro: Shield, premium: Star, expert: Crown };
const TIER_COLORS = {
  pro:     { accent: '#00e8ff', glow: 'rgba(0,232,255,0.15)', border: 'rgba(0,232,255,0.3)' },
  premium: { accent: '#ffd700', glow: 'rgba(255,215,0,0.15)', border: 'rgba(255,215,0,0.3)' },
  expert:  { accent: '#c084fc', glow: 'rgba(192,132,252,0.15)', border: 'rgba(192,132,252,0.3)' },
};

function formatPrice(cents: number) {
  return `$${(cents / 100).toFixed(2)}`;
}

export default function UpgradePage() {
  const router = useRouter();
  const { user } = useUserStore();
  const [billing, setBilling] = useState<'monthly' | 'annual'>('monthly');
  const [loading, setLoading] = useState<string | null>(null);

  const handleCheckout = async (tier: 'pro' | 'premium' | 'expert') => {
    if (!user) { router.push('/auth/login'); return; }
    setLoading(tier);
    try {
      const tierData = STRIPE_TIERS[tier];
      const isAnnual = billing === 'annual' && 'annualPrice' in tierData;
      const res = await fetch('/api/stripe/checkout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          priceId: isAnnual && 'annualPriceId' in tierData ? tierData.annualPriceId : tierData.priceId,
          mode: tierData.mode,
          tier,
        }),
      });
      const data = await res.json();
      if (data.url) window.location.href = data.url;
    } catch {
      setLoading(null);
    }
  };

  return (
    <div className="max-w-5xl mx-auto space-y-8 py-4">
      {/* Back */}
      <Link href="/app/dashboard" className="text-xs text-gray-500 hover:text-gray-300 transition-colors">
        ← Back to Dashboard
      </Link>

      {/* Header */}
      <motion.div
        className="text-center"
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
      >
        <div
          className="inline-flex items-center gap-2 text-xs font-bold px-4 py-1.5 rounded-full mb-4"
          style={{ background: 'rgba(0,232,255,0.1)', border: '1px solid rgba(0,232,255,0.25)', color: '#00e8ff' }}
        >
          <Zap className="w-3 h-3" /> CISSP Quest — Unlock Your Full Potential
        </div>
        <h1 className="text-4xl font-black text-white mb-3">
          Choose Your Clearance Level
        </h1>
        <p className="text-gray-400 max-w-xl mx-auto">
          From first-time learner to exam-ready operator. Upgrade anytime — your XP and progress carry forward.
        </p>
      </motion.div>

      {/* Billing toggle */}
      <div className="flex justify-center">
        <div
          className="flex gap-1 p-1 rounded-xl"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
        >
          {(['monthly', 'annual'] as const).map((b) => (
            <button
              key={b}
              onClick={() => setBilling(b)}
              className="px-5 py-2 rounded-lg text-sm font-semibold transition-all"
              style={{
                background: billing === b ? '#1e3a5f' : 'transparent',
                color: billing === b ? '#e2e8f0' : '#64748b',
              }}
            >
              {b === 'monthly' ? 'Monthly' : 'Annual'}
              {b === 'annual' && (
                <span className="ml-1.5 text-[10px] font-bold px-1.5 py-0.5 rounded" style={{ background: '#22c55e22', color: '#22c55e' }}>
                  Save 25%
                </span>
              )}
            </button>
          ))}
        </div>
      </div>

      {/* Free tier */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <motion.div
          className="rounded-2xl p-5"
          style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0 }}
        >
          <div className="text-2xl mb-2">🔓</div>
          <div className="text-lg font-bold text-white mb-1">Free</div>
          <div className="text-2xl font-black mb-3" style={{ color: '#64748b' }}>$0</div>
          <p className="text-xs text-gray-500 mb-4">Get started. No card required.</p>
          <div className="space-y-2 mb-6">
            {['Domain 1 story (Act 1)', '50 practice questions', 'Basic quiz mode', 'Reference library', 'XP & level system'].map((f) => (
              <div key={f} className="flex items-start gap-2">
                <Check className="w-3 h-3 mt-0.5 shrink-0" style={{ color: '#64748b' }} />
                <span className="text-xs text-gray-500">{f}</span>
              </div>
            ))}
          </div>
          <div className="text-xs text-center text-gray-600 py-2">Current plan</div>
        </motion.div>

        {/* Paid tiers */}
        {(['pro', 'premium', 'expert'] as const).map((tier, idx) => {
          const data = STRIPE_TIERS[tier];
          const colors = TIER_COLORS[tier];
          const Icon = TIER_ICONS[tier];
          const isPopular = tier === 'premium';
          const price = billing === 'annual' && 'annualPrice' in data
            ? Math.round(data.annualPrice / 12)
            : data.price;
          const billingLabel = data.mode === 'payment' ? 'one-time' : billing === 'annual' ? '/mo billed annually' : '/month';

          return (
            <motion.div
              key={tier}
              className="rounded-2xl p-5 relative"
              style={{
                background: `linear-gradient(135deg, #0d1220 0%, ${colors.glow} 100%)`,
                border: `1px solid ${colors.border}`,
                boxShadow: isPopular ? `0 0 32px ${colors.glow}` : undefined,
              }}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: (idx + 1) * 0.1 }}
            >
              {isPopular && (
                <div
                  className="absolute -top-3 left-1/2 -translate-x-1/2 text-[10px] font-black px-3 py-1 rounded-full uppercase tracking-widest"
                  style={{ background: colors.accent, color: '#080c14' }}
                >
                  Most Popular
                </div>
              )}

              <Icon className="w-5 h-5 mb-2" style={{ color: colors.accent }} />
              <div className="text-lg font-bold text-white mb-1">{data.name}</div>
              <div className="flex items-baseline gap-1 mb-1">
                <span className="text-3xl font-black" style={{ color: colors.accent }}>
                  {formatPrice(price)}
                </span>
                <span className="text-xs text-gray-500">{billingLabel}</span>
              </div>
              <p className="text-xs text-gray-400 mb-4">{data.description}</p>

              <div className="space-y-2 mb-6">
                {data.features.map((f) => (
                  <div key={f} className="flex items-start gap-2">
                    <Check className="w-3 h-3 mt-0.5 shrink-0" style={{ color: colors.accent }} />
                    <span className="text-xs text-gray-300">{f}</span>
                  </div>
                ))}
              </div>

              <button
                onClick={() => handleCheckout(tier)}
                disabled={loading === tier}
                className="w-full py-2.5 rounded-xl font-bold text-sm transition-all disabled:opacity-60"
                style={{
                  background: colors.accent,
                  color: '#080c14',
                }}
              >
                {loading === tier ? 'Loading…' : tier === 'pro' ? 'Unlock Forever' : 'Start Free Trial'}
              </button>
            </motion.div>
          );
        })}
      </div>

      {/* FAQ */}
      <motion.div
        className="rounded-2xl p-6 grid md:grid-cols-2 gap-6"
        style={{ background: '#0d1220', border: '1px solid #1e2d4a' }}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.5 }}
      >
        <div>
          <h3 className="text-sm font-bold text-white mb-3">Frequently Asked Questions</h3>
          <div className="space-y-4">
            {[
              { q: 'Does my progress carry over if I upgrade?', a: 'Yes. All XP, story progress, quiz history, and character customizations are preserved.' },
              { q: 'Can I cancel a subscription anytime?', a: 'Yes. Cancel anytime from your profile. Your access continues until the end of the billing period.' },
              { q: 'Is there a free trial?', a: 'Premium and Expert include a 7-day free trial. Pro is a one-time payment with no trial needed.' },
              { q: 'What if I fail the CISSP?', a: 'If you fail the exam within 6 months of upgrading, email us for a full refund. We believe in the product.' },
            ].map(({ q, a }) => (
              <div key={q}>
                <p className="text-xs font-semibold text-gray-200 mb-1">{q}</p>
                <p className="text-xs text-gray-500">{a}</p>
              </div>
            ))}
          </div>
        </div>

        <div
          className="rounded-xl p-5"
          style={{ background: 'rgba(0,232,255,0.05)', border: '1px solid rgba(0,232,255,0.15)' }}
        >
          <div className="text-2xl mb-2">🎯</div>
          <h4 className="text-sm font-bold text-white mb-2">Our Pass Rate Promise</h4>
          <p className="text-xs text-gray-400 leading-relaxed mb-4">
            Students who complete all 8 story acts and maintain a 70%+ quiz accuracy have a{' '}
            <span style={{ color: '#00e8ff' }}>91% first-attempt pass rate</span> on the CISSP exam.
          </p>
          <div className="grid grid-cols-3 gap-2 text-center">
            {[
              { label: 'Avg Study Time', value: '47 hrs' },
              { label: 'Pass Rate', value: '91%' },
              { label: 'Questions', value: '1,100+' },
            ].map(({ label, value }) => (
              <div key={label} className="rounded-lg p-2" style={{ background: 'rgba(0,232,255,0.08)' }}>
                <div className="text-sm font-black" style={{ color: '#00e8ff' }}>{value}</div>
                <div className="text-[9px] text-gray-500 mt-0.5">{label}</div>
              </div>
            ))}
          </div>
        </div>
      </motion.div>
    </div>
  );
}
