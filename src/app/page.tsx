import Link from 'next/link';
import { DOMAINS, PRICING, CHAPTERS } from '@/lib/constants';

export default function LandingPage() {
  return (
    <div className="min-h-screen" style={{ background: '#080c14', color: '#e2e8f0' }}>
      {/* Top Nav */}
      <nav className="flex items-center justify-between px-6 py-4 max-w-7xl mx-auto">
        <div className="flex items-center gap-2">
          <span className="text-xl font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
          <span className="text-xl font-bold">QUEST</span>
        </div>
        <div className="flex items-center gap-3">
          <Link href="/login" className="px-4 py-2 rounded-lg text-sm font-medium transition-all hover:opacity-80" style={{ color: '#00e8ff' }}>
            Sign In
          </Link>
          <Link href="/signup" className="px-4 py-2 rounded-lg text-sm font-semibold transition-all hover:opacity-90" style={{ background: '#00e8ff', color: '#080c14' }}>
            Start Free
          </Link>
        </div>
      </nav>

      {/* Hero */}
      <section className="text-center py-20 px-6 max-w-4xl mx-auto">
        <div className="inline-block px-4 py-1.5 rounded-full text-xs font-medium mb-6" style={{ background: 'rgba(0, 232, 255, 0.1)', color: '#00e8ff', border: '1px solid rgba(0, 232, 255, 0.2)' }}>
          Operation Shadow Protocol
        </div>
        <h1 className="text-5xl md:text-7xl font-bold mb-6 leading-tight">
          <span style={{ color: '#00e8ff' }}>CISSP</span> QUEST
        </h1>
        <p className="text-xl md:text-2xl mb-4 font-light" style={{ color: '#94a3b8' }}>
          Learn. Quest. Conquer the Exam.
        </p>
        <p className="text-lg mb-10" style={{ color: '#64748b' }}>
          The world&apos;s first story-driven CISSP learning platform
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link href="/signup" className="px-8 py-4 rounded-xl text-lg font-bold transition-all hover:opacity-90 animate-pulse-glow" style={{ background: '#00e8ff', color: '#080c14' }}>
            Begin Your Quest
          </Link>
          <Link href="#domains" className="px-8 py-4 rounded-xl text-lg font-medium transition-all hover:opacity-80" style={{ border: '1px solid #1e2d4a', color: '#e2e8f0' }}>
            Explore Domains
          </Link>
        </div>
      </section>

      {/* How It Works */}
      <section className="py-20 px-6 max-w-6xl mx-auto">
        <h2 className="text-3xl font-bold text-center mb-12" style={{ color: '#e2e8f0' }}>
          How It Works
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {[
            { icon: '📖', title: 'Learn', desc: 'Study CISSP concepts through our comprehensive Reference Library with memory techniques and real-world analogies.' },
            { icon: '🕵️', title: 'Quest', desc: 'Follow Operation Shadow Protocol across 8 global locations. Investigate security breaches as an elite agent.' },
            { icon: '🧠', title: 'Remember', desc: 'Memory Hacks embed concepts using mnemonics, method of loci, spaced repetition, and narrative encoding.' },
            { icon: '🎯', title: 'Conquer', desc: 'Test your knowledge with CISSP-style scenario questions. Track mastery across all 8 domains.' },
          ].map((card, i) => (
            <div
              key={i}
              className="rounded-xl p-6 text-center transition-all hover:scale-105"
              style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
            >
              <div className="text-4xl mb-4">{card.icon}</div>
              <h3 className="text-lg font-bold mb-2" style={{ color: '#00e8ff' }}>{card.title}</h3>
              <p className="text-sm" style={{ color: '#94a3b8' }}>{card.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* World Map */}
      <section className="py-20 px-6 max-w-6xl mx-auto">
        <h2 className="text-3xl font-bold text-center mb-4" style={{ color: '#e2e8f0' }}>
          8 Locations. 8 Domains. 1 Mission.
        </h2>
        <p className="text-center mb-12" style={{ color: '#64748b' }}>
          Travel the globe investigating security breaches at each location
        </p>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {CHAPTERS.map((ch) => (
            <div
              key={ch.id}
              className="rounded-xl p-5 transition-all hover:scale-105"
              style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
            >
              <div className="text-3xl mb-3">{ch.emoji}</div>
              <div className="text-xs font-medium mb-1" style={{ color: '#00e8ff' }}>Chapter {ch.id}</div>
              <h3 className="font-bold mb-1" style={{ color: '#e2e8f0' }}>{ch.title}</h3>
              <p className="text-xs mb-2" style={{ color: '#64748b' }}>{ch.location}</p>
              <p className="text-xs" style={{ color: '#94a3b8' }}>{ch.description}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Domains */}
      <section id="domains" className="py-20 px-6 max-w-6xl mx-auto">
        <h2 className="text-3xl font-bold text-center mb-4" style={{ color: '#e2e8f0' }}>
          All 8 CISSP Domains
        </h2>
        <p className="text-center mb-12" style={{ color: '#64748b' }}>
          Complete coverage of every CISSP exam domain
        </p>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {DOMAINS.map((domain) => (
            <div
              key={domain.id}
              className="rounded-xl p-5 flex items-start gap-4 transition-all hover:scale-[1.02]"
              style={{ background: '#111a2e', border: '1px solid #1e2d4a' }}
            >
              <div className="text-3xl flex-shrink-0">{domain.icon}</div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between mb-1">
                  <h3 className="font-bold text-sm" style={{ color: '#e2e8f0' }}>
                    Domain {domain.id}
                  </h3>
                  <span className="text-xs font-medium px-2 py-0.5 rounded-full" style={{ background: `${domain.color}22`, color: domain.color }}>
                    {domain.weight}
                  </span>
                </div>
                <p className="text-sm" style={{ color: '#94a3b8' }}>{domain.name}</p>
                <div className="flex items-center gap-2 mt-2">
                  <span className="text-xs" style={{ color: '#64748b' }}>{domain.locationEmoji} {domain.location}</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* Pricing */}
      <section className="py-20 px-6 max-w-5xl mx-auto">
        <h2 className="text-3xl font-bold text-center mb-4" style={{ color: '#e2e8f0' }}>
          Choose Your Path
        </h2>
        <p className="text-center mb-12" style={{ color: '#64748b' }}>
          Start free, upgrade when you&apos;re ready to conquer all domains
        </p>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {PRICING.map((plan, i) => (
            <div
              key={i}
              className="rounded-xl p-6 relative transition-all hover:scale-105"
              style={{
                background: plan.highlighted ? 'linear-gradient(135deg, #111a2e, #1a2540)' : '#111a2e',
                border: `1px solid ${plan.highlighted ? '#00e8ff' : '#1e2d4a'}`,
                boxShadow: plan.highlighted ? '0 0 30px rgba(0, 232, 255, 0.1)' : 'none',
              }}
            >
              {plan.highlighted && (
                <div className="absolute -top-3 left-1/2 -translate-x-1/2 px-3 py-1 rounded-full text-xs font-bold" style={{ background: '#00e8ff', color: '#080c14' }}>
                  MOST POPULAR
                </div>
              )}
              <h3 className="text-lg font-bold mb-1" style={{ color: '#e2e8f0' }}>{plan.name}</h3>
              <div className="mb-4">
                <span className="text-3xl font-bold" style={{ color: '#00e8ff' }}>{plan.price}</span>
                <span className="text-sm" style={{ color: '#64748b' }}>{plan.period}</span>
              </div>
              <ul className="space-y-2 mb-6">
                {plan.features.map((f, j) => (
                  <li key={j} className="flex items-start gap-2 text-sm" style={{ color: '#94a3b8' }}>
                    <span style={{ color: '#22c55e' }}>✓</span>
                    {f}
                  </li>
                ))}
              </ul>
              <Link
                href="/signup"
                className="block text-center py-2.5 rounded-lg font-semibold text-sm transition-all hover:opacity-90"
                style={{
                  background: plan.highlighted ? '#00e8ff' : 'transparent',
                  color: plan.highlighted ? '#080c14' : '#00e8ff',
                  border: plan.highlighted ? 'none' : '1px solid #1e2d4a',
                }}
              >
                {plan.cta}
              </Link>
            </div>
          ))}
        </div>
      </section>

      {/* Social Proof */}
      <section className="py-20 px-6 max-w-4xl mx-auto text-center">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
          {[
            { value: '2,500+', label: 'Agents Enrolled' },
            { value: '50,000+', label: 'Questions Answered' },
            { value: '92%', label: 'Pass Rate' },
            { value: '4.9/5', label: 'Student Rating' },
          ].map((stat, i) => (
            <div key={i}>
              <div className="text-2xl md:text-3xl font-bold mb-1" style={{ color: '#00e8ff' }}>{stat.value}</div>
              <div className="text-xs" style={{ color: '#64748b' }}>{stat.label}</div>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      <section className="py-20 px-6 max-w-3xl mx-auto text-center">
        <h2 className="text-3xl font-bold mb-4" style={{ color: '#e2e8f0' }}>
          Ready to Begin Your Quest?
        </h2>
        <p className="mb-8" style={{ color: '#64748b' }}>
          Join thousands of security professionals preparing for the CISSP exam with the power of story-driven learning.
        </p>
        <Link
          href="/signup"
          className="inline-block px-10 py-4 rounded-xl text-lg font-bold transition-all hover:opacity-90 animate-pulse-glow"
          style={{ background: '#00e8ff', color: '#080c14' }}
        >
          Start Your Free Account
        </Link>
      </section>

      {/* Footer */}
      <footer className="border-t py-8 px-6" style={{ borderColor: '#1e2d4a' }}>
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2">
            <span className="font-bold" style={{ color: '#00e8ff' }}>CISSP</span>
            <span className="font-bold">QUEST</span>
          </div>
          <p className="text-xs" style={{ color: '#64748b' }}>
            &copy; 2025 CISSP Quest. Not affiliated with (ISC)&sup2;. CISSP is a registered certification mark of (ISC)&sup2;.
          </p>
        </div>
      </footer>
    </div>
  );
}
