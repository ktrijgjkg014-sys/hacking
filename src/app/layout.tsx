import type { Metadata } from 'next'
import { Inter, JetBrains_Mono } from 'next/font/google'
import './globals.css'
import ModernLayout from '@/components/ModernLayout'

const inter = Inter({ 
  subsets: ['latin'],
  variable: '--font-inter',
})

const jetbrainsMono = JetBrains_Mono({ 
  subsets: ['latin'],
  variable: '--font-mono',
})

export const metadata: Metadata = {
  title: {
    default: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad",
    template: "%s | Blog de Ethical Hacking"
  },
  description: "Tutoriales completos de ethical hacking, ciberseguridad, análisis de vulnerabilidades y pentesting. Aprende hacking ético con guías paso a paso.",
  keywords: ["ethical hacking", "ciberseguridad", "pentesting", "vulnerabilidades", "seguridad informática", "hacking ético", "tutoriales"],
  authors: [{ name: "MiniMax Agent", url: "https://cybersec.edu" }],
  creator: "MiniMax Agent",
  publisher: "Blog de Ethical Hacking",
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  metadataBase: new URL(process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000'),
  alternates: {
    canonical: '/',
    languages: {
      'es-ES': '/es',
      'en-US': '/en',
    },
  },
  openGraph: {
    type: 'website',
    locale: 'es_ES',
    url: '/',
    title: 'Blog de Ethical Hacking | Tutoriales de Ciberseguridad',
    description: 'Tutoriales completos de ethical hacking y ciberseguridad',
    siteName: 'Blog de Ethical Hacking',
    images: [
      {
        url: '/images/og-image.jpg',
        width: 1200,
        height: 630,
        alt: 'Blog de Ethical Hacking',
      },
    ],
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Blog de Ethical Hacking | Tutoriales de Ciberseguridad',
    description: 'Tutoriales completos de ethical hacking y ciberseguridad',
    images: ['/images/og-image.jpg'],
    creator: '@cybersec_blog',
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  verification: {
    google: 'your-google-verification-code',
    yandex: 'your-yandex-verification-code',
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es" className={`${inter.variable} ${jetbrainsMono.variable}`}>
      <head>
        <link rel="icon" href="/favicon.ico" />
        <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
        <link rel="manifest" href="/site.webmanifest" />
        <meta name="theme-color" content="#000000" />
        <meta name="msapplication-TileColor" content="#000000" />
      </head>
      <body className="font-sans antialiased">
        <div className="relative flex min-h-screen flex-col">
          <div className="flex-1">
            <ModernLayout>
              {children}
            </ModernLayout>
          </div>
        </div>
      </body>
    </html>
  )
}
