import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import ClientBody from "./ClientBody"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "Hacking & Pentesting Blog",
  description: "Blog técnico sobre pentesting, hacking ético y seguridad informática",
  keywords: ["pentesting", "hacking", "seguridad", "cybersecurity", "ethical hacking"],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es">
      <body className={inter.className}>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  )
}
