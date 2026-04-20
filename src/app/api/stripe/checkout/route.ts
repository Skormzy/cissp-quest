import { NextRequest, NextResponse } from 'next/server';
import Stripe from 'stripe';
import { createClient } from '@/lib/supabase/server';
import { STRIPE_TIERS, StripeTier } from '@/lib/stripe/config';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, { apiVersion: '2026-01-28.clover' });

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

    const { tier, annual = false } = await req.json() as { tier: StripeTier; annual?: boolean };
    if (!STRIPE_TIERS[tier]) return NextResponse.json({ error: 'Invalid tier' }, { status: 400 });

    const tierConfig = STRIPE_TIERS[tier];

    // Get or create Stripe customer
    const { data: userData } = await supabase
      .from('users')
      .select('stripe_customer_id')
      .eq('id', user.id)
      .single();

    let customerId = userData?.stripe_customer_id;
    if (!customerId) {
      const customer = await stripe.customers.create({
        email: user.email,
        metadata: { supabase_user_id: user.id },
      });
      customerId = customer.id;
      await supabase.from('users').update({ stripe_customer_id: customerId }).eq('id', user.id);
    }

    // Select price ID
    const priceId = tierConfig.mode === 'payment'
      ? tierConfig.priceId
      : annual && 'annualPriceId' in tierConfig
        ? tierConfig.annualPriceId
        : tierConfig.priceId;

    if (!priceId) {
      return NextResponse.json({ error: 'Price not configured — set STRIPE_*_PRICE_ID env vars' }, { status: 500 });
    }

    const origin = req.headers.get('origin') ?? 'http://localhost:3000';

    const session = await stripe.checkout.sessions.create({
      customer:    customerId,
      mode:        tierConfig.mode,
      line_items: [{ price: priceId, quantity: 1 }],
      success_url: `${origin}/app/dashboard?upgrade=success&tier=${tier}`,
      cancel_url:  `${origin}/pricing?upgrade=cancelled`,
      metadata: {
        supabase_user_id: user.id,
        tier,
      },
      subscription_data: tierConfig.mode === 'subscription' ? {
        metadata: { supabase_user_id: user.id, tier },
      } : undefined,
    });

    return NextResponse.json({ url: session.url });
  } catch (err) {
    console.error('Stripe checkout error:', err);
    return NextResponse.json({ error: 'Checkout failed' }, { status: 500 });
  }
}
