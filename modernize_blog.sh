#!/bin/bash

echo "🚀 Modernizando tu blog con colores azul/cian y componentes modernos..."
echo ""

# Crear respaldo del layout actual
echo "📋 Creando respaldo de layout.tsx..."
cp src/app/layout.tsx src/app/layout.tsx.backup.$(date +%Y%m%d_%H%M%S)

# Crear nuevo layout.tsx con ModernLayout
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import ModernLayout from "../components/ModernLayout";

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
    url: "https://hacking-8grf.vercel.app/", // CAMBIAR por tu dominio real
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
    creator: "", // CAMBIAR por tu handle de Twitter
    site: "" // CAMBIAR por tu handle de Twitter
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
  authors: [{ name: "Tu Nombre" }],
  creator: "Tu Nombre",
  publisher: "Tu Nombre",
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
        <ModernLayout>
          {children}
        </ModernLayout>
      </body>
    </html>
  );
}
EOF

echo "✅ Layout.tsx actualizado con ModernLayout"

# Renombrar ClientBody para evitar conflictos
if [ -f "src/app/ClientBody.tsx" ]; then
    echo "📦 Renombrando ClientBody.tsx para evitar conflictos..."
    mv src/app/ClientBody.tsx src/app/ClientBody.tsx.disabled
fi

# Instalar dependencias faltantes
echo "📦 Instalando dependencias faltantes..."
npm install react-syntax-highlighter @types/react-syntax-highlighter

echo ""
echo "🎉 ¡Modernización completada!"
echo ""
echo "📝 Para ver los cambios:"
echo "1. Ejecuta: npm run dev"
echo "2. Abre: http://localhost:3000"
echo "3. Presiona Ctrl+F5 (Windows/Linux) o Cmd+Shift+R (Mac) para limpiar caché"
echo ""
echo "🔧 Si tienes problemas, el respaldo está en:"
echo "   src/app/layout.tsx.backup.$(date +%Y%m%d_%H%M%S)"
echo ""
echo "🌟 Ahora verás colores azul/cian en lugar del verde fosforescente!"
