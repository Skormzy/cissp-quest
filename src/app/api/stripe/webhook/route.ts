import { NextRequest, NextResponse } from 'next/server';
import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, { apiVersion: '2026-01-28.clover' });

// Use service role to bypass RLS in webhook
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.SUPABASE_SERVICE_ROLE_KEY!,
  { auth: { persistSession: false } },
);

type TierName = 'free' | 'pro' | 'premium' | 'expert';

// Stripe's subscription shape — `current_period_end` exists at runtime even if not in all TS defs
type StripeSubLike = { id: string; current_period_end: number; metadata: Record<string, string> };

async function upgradeTier(userId: string, tier: TierName, subscriptionId?: string, expiresAt?: Date) {
  await supabase.from('users').update({
    subscription_tier:       tier,
    stripe_subscription_id:  subscriptionId ?? null,
    subscription_expires_at: expiresAt?.toISOString() ?? null,
  }).eq('id', userId);
}

export async function POST(req: NextRequest) {
  const body = await req.text();
  const sig  = req.headers.get('stripe-signature') ?? '';
  const webhookSecret = process.env.STRIPE_WEBHOOK_SECRET;

  let event: Stripe.Event;
  try {
    event = webhookSecret
      ? stripe.webhooks.constructEvent(body, sig, webhookSecret)
      : JSON.parse(body) as Stripe.Event;
  } catch {
    return NextResponse.json({ error: 'Webhook signature failed' }, { status: 400 });
  }

  switch (event.type) {
    case 'checkout.session.completed': {
      const session = event.data.object as Stripe.Checkout.Session;
      const userId  = session.metadata?.supabase_user_id;
      const tier    = session.metadata?.tier as TierName | undefined;
      if (!userId || !tier) break;

      if (session.mode === 'payment') {
        await upgradeTier(userId, tier);
      } else if (session.mode === 'subscription' && session.subscription) {
        const sub = await stripe.subscriptions.retrieve(session.subscription as string) as unknown as StripeSubLike;
        const exp = new Date(sub.current_period_end * 1000);
        await upgradeTier(userId, tier, sub.id, exp);
      }
      break;
    }

    case 'customer.subscription.updated': {
      const sub    = event.data.object as unknown as StripeSubLike;
      const userId = sub.metadata?.supabase_user_id;
      const tier   = sub.metadata?.tier as TierName | undefined;
      if (!userId || !tier) break;
      const exp = new Date(sub.current_period_end * 1000);
      await upgradeTier(userId, tier, sub.id, exp);
      break;
    }

    case 'customer.subscription.deleted': {
      const sub    = event.data.object as unknown as StripeSubLike;
      const userId = sub.metadata?.supabase_user_id;
      if (!userId) break;
      await upgradeTier(userId, 'free');
      break;
    }

    case 'invoice.payment_failed': {
      const invoice = event.data.object as unknown as { subscription?: string };
      if (invoice.subscription) {
        const sub    = await stripe.subscriptions.retrieve(invoice.subscription) as unknown as StripeSubLike;
        const userId = sub.metadata?.supabase_user_id;
        if (userId) {
          await supabase.from('notification_queue').insert({
            user_id: userId,
            type:    'streak_reminder',
            payload: { message: 'Your subscription payment failed. Please update your billing info.' },
          });
        }
      }
      break;
    }
  }

  return NextResponse.json({ received: true });
}
