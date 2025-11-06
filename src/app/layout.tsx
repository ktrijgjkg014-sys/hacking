import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import ClientBody from "./ClientBody"

const inter = Inter({ 
  subsets: ["latin"],
  display: "swap", // Mejora el rendimiento de carga de fuentes
})

export const metadata: Metadata = {
  title: "Hacking & Pentesting Blog",
  description: "Blog técnico sobre pentesting, hacking ético y seguridad informática",
  keywords: ["pentesting", "hacking", "seguridad", "cybersecurity", "ethical hacking"],
  authors: [{ name: "Security Research Team" }],
  creator: "Security Research Team",
  publisher: "Hacking & Pentesting Blog",
  viewport: "width=device-width, initial-scale=1",
  robots: "index, follow",
  themeColor: [
    { media: "(prefers-color-scheme: light)", color: "white" },
    { media: "(prefers-color-scheme: dark)", color: "#111827" },
  ],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es" suppressHydrationWarning>
      <head>
        {/* Asegurar que Tailwind se cargue correctamente */}
        <link rel="preload" href="/globals.css" as="style" />
      </head>
      <body className={inter.className} suppressHydrationWarning>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  )
}
