import type { Metadata } from 'next';
import { Space_Grotesk, JetBrains_Mono, Inter } from 'next/font/google';
import './globals.css';
import { TooltipProvider } from '@/components/ui/tooltip';
import { Toaster } from '@/components/ui/sonner';
import XpToastHost from '@/components/effects/XpToast';
import LevelUpHost from '@/components/effects/LevelUpOverlay';

// Display: Space Grotesk for headlines, mission cards, level-up moments.
// Body: Inter for dialogue, paragraphs, dense reading.
// Mono: JetBrains Mono for terminals, codes, callsigns, telemetry.
const spaceGrotesk = Space_Grotesk({
  variable: '--font-display',
  subsets: ['latin'],
  display: 'swap',
});

const inter = Inter({
  variable: '--font-sans',
  subsets: ['latin'],
  display: 'swap',
});

const jetbrainsMono = JetBrains_Mono({
  variable: '--font-mono',
  subsets: ['latin'],
  display: 'swap',
});

export const metadata: Metadata = {
  title: 'CISSP Quest — Story-Driven Exam Prep',
  description:
    'The world\'s most engaging CISSP certification platform. Follow Agent Alex Mercer through the Meridian Global breach across 8 global missions. Learn. Quest. Pass.',
  openGraph: {
    title: 'CISSP Quest — Story-Driven Exam Prep',
    description: 'CISSP certification prep through narrative, not memorization.',
    type: 'website',
  },
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en" className="dark">
      <body className={`${inter.variable} ${spaceGrotesk.variable} ${jetbrainsMono.variable} antialiased`}>
        <TooltipProvider delay={300}>
          {children}
        </TooltipProvider>
        <XpToastHost />
        <LevelUpHost />
        <Toaster
          position="bottom-right"
          toastOptions={{
            style: {
              background: '#111a2e',
              border: '1px solid #1e2d4a',
              color: '#e2e8f0',
            },
          }}
        />
      </body>
    </html>
  );
}
