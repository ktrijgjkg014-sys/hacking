import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import ClientBody from "./ClientBody"

const inter = { 
  className: "font-mono" // Monospace para estilo terminal
}

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
    { media: "(prefers-color-scheme: dark)", color: "#000000" },
  ],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es" className="dark">
      <body className={inter.className}>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  )
}
