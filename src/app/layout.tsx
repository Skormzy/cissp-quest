import type { Metadata } from 'next';
import { Geist, Geist_Mono } from 'next/font/google';
import './globals.css';
import { TooltipProvider } from '@/components/ui/tooltip';
import { Toaster } from '@/components/ui/sonner';

const geistSans = Geist({
  variable: '--font-sans',
  subsets: ['latin'],
});

const geistMono = Geist_Mono({
  variable: '--font-geist-mono',
  subsets: ['latin'],
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
      <body className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
        <TooltipProvider delay={300}>
          {children}
        </TooltipProvider>
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
