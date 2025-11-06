#!/bin/bash

echo "🔧 === CORRIGIENDO ERROR DE LAYOUT ==="
echo ""

if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json"
    exit 1
fi

echo "📁 Corrigiendo layout.tsx - eliminando propiedad 'site' inválida..."

# Backup del layout actual
cp src/app/layout.tsx src/app/layout.tsx.backup.$(date +%Y%m%d_%H%M%S)

# Crear layout corregido
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import ClientBody from "./ClientBody";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: {
    default: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad",
    template: "%s | Blog de Ethical Hacking"
  },
  description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad. Aprende técnicas avanzadas de hacking ético, análisis de vulnerabilidades y seguridad de redes.",
  
  // Open Graph para redes sociales (LinkedIn, Facebook, etc.)
  openGraph: {
    type: "website",
    locale: "es_ES",
    url: "https://tu-dominio.vercel.app", // CAMBIAR por tu dominio real
    title: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad",
    description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad. Aprende técnicas avanzadas de hacking ético, análisis de vulnerabilidades y seguridad de redes.",
    siteName: "Blog de Ethical Hacking",
    images: [
      {
        url: "/images/og-banner.jpg", // La imagen que acabas de crear
        width: 1200,
        height: 630,
        alt: "Blog de Ethical Hacking - Tutoriales y Técnicas de Ciberseguridad",
      }
    ],
  },
  
  // Twitter Cards para Twitter
  twitter: {
    card: "summary_large_image",
    title: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad", 
    description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad.",
    images: ["/images/og-banner.jpg"],
    creator: "@tu_usuario_twitter", // CAMBIAR por tu handle de Twitter
    site: "@tu_usuario_twitter" // CAMBIAR por tu handle de Twitter
  },
  
  // Schema.org structured data
  other: {
    "script:type": "application/ld+json",
    "script:content": JSON.stringify({
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Blog de Ethical Hacking",
      "description": "Tutoriales completos de ethical hacking, pentesting y ciberseguridad",
      "url": "https://tu-dominio.vercel.app", // CAMBIAR por tu dominio real
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://tu-dominio.vercel.app/search?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    })
  },
  
  // Metadatos adicionales
  keywords: [
    "ethical hacking", "pentesting", "ciberseguridad", "tutorial hacking", 
    "seguridad informática", "análisis de vulnerabilidades", "redes", 
    "hacking ético", "forensics", "OSINT", "explotación", "payloads"
  ],
  authors: [{ name: "MiniMax Agent" }],
  creator: "MiniMax Agent",
  publisher: "MiniMax Agent",
  formatDetection: {
    telephone: false,
  },
  
  // Configuración de robots
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="es">
      <body className={inter.className}>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  );
}
EOF

echo "✅ Layout.tsx corregido - propiedad 'site' eliminada de OpenGraph"
echo ""

echo "🧹 Limpiando caché..."
rm -rf .next node_modules/.cache

echo "🔨 Probando build..."
if bun run build; then
    echo ""
    echo "🎉 ¡ERROR CORREGIDO - BUILD EXITOSO!"
    echo ""
    echo "✅ Lo que se configuró:"
    echo "   • Meta tags Open Graph (LinkedIn, Facebook, WhatsApp)"
    echo "   • Twitter Cards (Twitter)"
    echo "   • Imagen de banner (1200x630px)"
    echo "   • Schema.org para SEO"
    echo "   • Error TypeScript corregido"
    echo ""
    echo "📋 PASOS FINALES:"
    echo "1. Edita src/app/layout.tsx y cambia:"
    echo "   • 'tu-dominio.vercel.app' por tu dominio real"
    echo "   • '@tu_usuario_twitter' por tu handle real"
    echo ""
    echo "2. Commit y push:"
    echo "   git add -A"
    echo "   git commit -m 'fix: correct social media meta tags'"
    echo "   git push"
    echo ""
    echo "📱 ¡Luego tu link tendrá banner profesional en redes sociales!"
else
    echo "❌ Error en build - revisa los errores arriba"
fi
