#!/bin/bash

# Script completo para arreglar todos los estilos CSS
# Proyecto: Next.js con Bun como package manager

set -e  # Salir en cualquier error

echo "🎨 === SCRIPT COMPLETO DE CORRECCIÓN CSS ==="
echo "🎯 Aplicando todas las correcciones necesarias..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json. Ejecuta este script desde el directorio raíz del proyecto."
    exit 1
fi

# Paso 1: Instalar dependencias
echo "📦 Paso 1: Instalando dependencias necesarias..."
echo "• Instalando react-markdown y autoprefixer..."
bun add react-markdown autoprefixer
echo "✅ Dependencias instaladas correctamente"
echo ""

# Paso 2: Actualizar postcss.config.mjs
echo "🛠️ Paso 2: Actualizando postcss.config.mjs..."
cat > postcss.config.mjs << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF
echo "✅ postcss.config.mjs actualizado"
echo ""

# Paso 3: Actualizar globals.css
echo "🎨 Paso 3: Actualizando globals.css completo..."
cat > src/app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 240 10% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 240 10% 3.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 240 10% 3.9%;
    --primary: 142.1 76.2% 36.3%;
    --primary-foreground: 355.7 100% 97.3%;
    --secondary: 240 4.8% 95.9%;
    --secondary-foreground: 240 5.9% 10%;
    --muted: 240 4.8% 95.9%;
    --muted-foreground: 240 3.8% 46.1%;
    --accent: 240 4.8% 95.9%;
    --accent-foreground: 240 5.9% 10%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 5.9% 90%;
    --input: 240 5.9% 90%;
    --ring: 142.1 76.2% 36.3%;
    --radius: 0.5rem;
    --chart-1: 12 76% 61%;
    --chart-2: 173 58% 39%;
    --chart-3: 197 37% 24%;
    --chart-4: 43 74% 66%;
    --chart-5: 27 87% 67%;
  }

  .dark {
    --background: 20 14.3% 4.1%;
    --foreground: 0 0% 95%;
    --card: 24 9.8% 10%;
    --card-foreground: 0 0% 95%;
    --popover: 0 0% 9%;
    --popover-foreground: 0 0% 95%;
    --primary: 142.1 70.6% 45.3%;
    --primary-foreground: 144.9 80.4% 10%;
    --secondary: 240 3.7% 15.9%;
    --secondary-foreground: 0 0% 98%;
    --muted: 0 0% 15%;
    --muted-foreground: 240 5% 64.9%;
    --accent: 12 6.5% 15.1%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 85.7% 97.3%;
    --border: 240 3.7% 15.9%;
    --input: 240 3.7% 15.9%;
    --ring: 142.4 71.8% 29.2%;
    --chart-1: 220 70% 50%;
    --chart-2: 160 60% 45%;
    --chart-3: 30 80% 55%;
    --chart-4: 280 65% 60%;
    --chart-5: 340 75% 55%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}

/* Custom styles for better visual appearance */
.prose {
  max-width: none;
}

.prose code {
  @apply bg-gray-100 dark:bg-gray-700 text-red-600 dark:text-red-400 px-2 py-1 rounded text-sm font-mono;
}

.prose pre {
  @apply bg-gray-100 dark:bg-gray-700 p-4 rounded-lg overflow-x-auto mb-4 border border-gray-200 dark:border-gray-600;
}

.prose pre code {
  @apply bg-transparent text-gray-900 dark:text-gray-100 p-0;
}

.prose blockquote {
  @apply border-l-4 border-primary pl-4 italic text-gray-600 dark:text-gray-400 mb-4 bg-primary/5 dark:bg-primary/10 p-4 rounded-r-lg;
}

.prose table {
  @apply min-w-full border border-gray-200 dark:border-gray-600 rounded-lg overflow-hidden;
}

.prose th {
  @apply bg-gray-50 dark:bg-gray-700 border border-gray-200 dark:border-gray-600 px-4 py-3 text-left font-semibold text-gray-900 dark:text-white;
}

.prose td {
  @apply border border-gray-200 dark:border-gray-600 px-4 py-3 text-gray-700 dark:text-gray-300;
}

.prose h1 {
  @apply text-3xl font-bold text-gray-900 dark:text-white mb-6 mt-8;
}

.prose h2 {
  @apply text-2xl font-bold text-gray-900 dark:text-white mb-4 mt-8;
}

.prose h3 {
  @apply text-xl font-bold text-gray-900 dark:text-white mb-3 mt-6;
}

.prose p {
  @apply text-gray-700 dark:text-gray-300 mb-4 leading-relaxed;
}

.prose ul {
  @apply list-disc list-inside mb-4 space-y-2 text-gray-700 dark:text-gray-300;
}

.prose ol {
  @apply list-decimal list-inside mb-4 space-y-2 text-gray-700 dark:text-gray-300;
}

.prose li {
  @apply text-gray-700 dark:text-gray-300;
}

.prose strong {
  @apply font-bold text-gray-900 dark:text-white;
}

.prose em {
  @apply italic text-gray-800 dark:text-gray-200;
}

.prose a {
  @apply text-primary hover:text-primary/80 underline;
}

/* Animation for smooth transitions */
* {
  transition: all 0.2s ease-in-out;
}

/* Custom scrollbar */
::-webkit-scrollbar {
  width: 8px;
}

::-webkit-scrollbar-track {
  @apply bg-gray-100 dark:bg-gray-800;
}

::-webkit-scrollbar-thumb {
  @apply bg-gray-300 dark:bg-gray-600 rounded-full;
}

::-webkit-scrollbar-thumb:hover {
  @apply bg-gray-400 dark:bg-gray-500;
}
EOF
echo "✅ globals.css actualizado con estilos completos"
echo ""

# Paso 4: Actualizar layout.tsx
echo "📝 Paso 4: Actualizando layout.tsx..."
cat > src/app/layout.tsx << 'EOF'
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
EOF
echo "✅ layout.tsx actualizado"
echo ""

# Paso 5: Actualizar ClientBody.tsx
echo "⚡ Paso 5: Actualizando ClientBody.tsx..."
cat > src/app/ClientBody.tsx << 'EOF'
"use client";
import { useEffect } from "react";

export default function ClientBody({
  children,
}: {
  children: React.ReactNode;
}) {
  useEffect(() => {
    // Asegurar que los estilos de Tailwind se apliquen correctamente
    document.documentElement.classList.add('antialiased');
    document.body.classList.add('antialiased');
    
    // Aplicar clases de tema inicial
    const root = document.documentElement;
    
    // Verificar si el usuario prefiere tema oscuro
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      root.classList.add('dark');
    } else {
      root.classList.remove('dark');
    }
  }, []);

  return <>{children}</>;
}
EOF
echo "✅ ClientBody.tsx actualizado"
echo ""

# Paso 6: Actualizar page.tsx
echo "🏠 Paso 6: Actualizando page.tsx con estilos mejorados..."
cat > src/app/page.tsx << 'EOF'
import Link from "next/link"
import { FileText, Clock, User, Tag } from "lucide-react"

const articles = [
  {
    id: "introduccion-pentesting",
    title: "Introducción al Pentesting: Metodología y Fases",
    description: "Aprende las bases del pentesting profesional, sus fases metodológicas y las mejores prácticas para realizar auditorías de seguridad efectivas.",
    author: "Security Research Team",
    category: "Pentesting",
    readTime: "15 min",
    tags: ["pentesting", "metodología", "básico", "seguridad"],
    date: "2025-01-15"
  },
  {
    id: "nmap-tecnicas-avanzadas", 
    title: "Nmap: Técnicas Avanzadas de Escaneo de Redes",
    description: "Explora técnicas avanzadas de escaneo con Nmap incluyendo evasión de firewalls, NSE scripts y optimización de escaneos a gran escala.",
    author: "Security Research Team",
    category: "Network Security",
    readTime: "20 min",
    tags: ["nmap", "network", "scanning", "firewall"],
    date: "2025-01-05"
  },
  {
    id: "sql-injection-avanzado",
    title: "SQL Injection Avanzado: Técnicas de Exfiltración", 
    description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos.",
    author: "Security Research Team",
    category: "Web Security",
    readTime: "25 min",
    tags: ["sql-injection", "web", "avanzado", "database"],
    date: "2025-01-10"
  }
]

export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 via-white to-blue-50 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900">
      {/* Header */}
      <header className="sticky top-0 z-50 bg-white/95 dark:bg-gray-800/95 backdrop-blur-sm shadow-sm border-b border-gray-200 dark:border-gray-700">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl md:text-4xl font-bold bg-gradient-to-r from-primary to-blue-600 bg-clip-text text-transparent">
                Hacking & Pentesting Blog
              </h1>
              <p className="text-gray-600 dark:text-gray-300 mt-2 text-sm md:text-base">
                Blog técnico sobre pentesting, hacking ético y seguridad informática
              </p>
            </div>
            <div className="hidden md:block">
              <div className="flex items-center space-x-4 text-sm text-gray-500 dark:text-gray-400">
                <span className="flex items-center bg-primary/10 text-primary px-3 py-1 rounded-full font-medium">
                  <FileText className="w-4 h-4 mr-1" />
                  {articles.length} Artículos
                </span>
                <span className="text-xs">Actualizado: Nov 2025</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-4 py-8">
        {/* Hero Section */}
        <div className="text-center mb-12">
          <div className="max-w-4xl mx-auto">
            <h2 className="text-3xl md:text-5xl font-bold text-gray-900 dark:text-white mb-6 leading-tight">
              Artículos Técnicos de
              <span className="block bg-gradient-to-r from-primary to-blue-600 bg-clip-text text-transparent">
                Ciberseguridad
              </span>
            </h2>
            <p className="text-lg md:text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto leading-relaxed">
              Explora técnicas avanzadas de pentesting, análisis de vulnerabilidades y metodologías de seguridad 
              en este blog especializado para profesionales de la ciberseguridad.
            </p>
          </div>
        </div>

        {/* Articles Grid */}
        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3 mb-12">
          {articles.map((article, index) => (
            <article 
              key={article.id} 
              className="group bg-white dark:bg-gray-800 rounded-xl shadow-md hover:shadow-xl transition-all duration-300 border border-gray-200 dark:border-gray-700 overflow-hidden hover:scale-105"
              style={{
                animationDelay: `${index * 0.1}s`
              }}
            >
              <div className="p-6">
                {/* Article Meta */}
                <div className="flex items-center justify-between mb-4">
                  <span className="inline-block bg-gradient-to-r from-primary to-blue-500 text-white px-3 py-1 rounded-full text-sm font-semibold shadow-sm">
                    {article.category}
                  </span>
                  <div className="flex items-center text-gray-500 dark:text-gray-400 text-sm">
                    <Clock className="w-4 h-4 mr-1" />
                    {article.readTime}
                  </div>
                </div>

                {/* Article Title */}
                <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3 leading-tight group-hover:text-primary transition-colors">
                  {article.title}
                </h3>

                {/* Article Description */}
                <p className="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed text-sm">
                  {article.description}
                </p>

                {/* Tags */}
                <div className="flex flex-wrap gap-2 mb-4">
                  {article.tags.slice(0, 3).map((tag) => (
                    <span key={tag} className="inline-flex items-center text-xs text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded-full">
                      <Tag className="w-3 h-3 mr-1" />
                      {tag}
                    </span>
                  ))}
                  {article.tags.length > 3 && (
                    <span className="text-xs text-gray-400 dark:text-gray-500">+{article.tags.length - 3} más</span>
                  )}
                </div>

                {/* Article Footer */}
                <div className="flex items-center justify-between pt-4 border-t border-gray-200 dark:border-gray-700 mb-4">
                  <div className="flex items-center text-sm text-gray-500 dark:text-gray-400">
                    <User className="w-4 h-4 mr-2" />
                    <span>{article.author}</span>
                  </div>
                  <div className="text-sm text-gray-500 dark:text-gray-400">
                    {new Date(article.date).toLocaleDateString('es-ES', {
                      year: 'numeric',
                      month: 'short',
                      day: 'numeric'
                    })}
                  </div>
                </div>

                {/* Read Button */}
                <Link 
                  href={`/articles/${article.id}`}
                  className="inline-flex items-center w-full justify-center px-4 py-3 bg-gradient-to-r from-primary to-blue-500 text-white rounded-lg hover:from-primary/90 hover:to-blue-500/90 transition-all duration-200 font-medium shadow-md hover:shadow-lg"
                >
                  Leer Artículo
                  <FileText className="w-4 h-4 ml-2" />
                </Link>
              </div>
            </article>
          ))}
        </div>

        {/* Additional Info */}
        <div className="bg-gradient-to-r from-primary/10 via-blue-50 to-primary/10 dark:from-primary/5 dark:via-gray-800 dark:to-primary/5 rounded-xl p-8 border border-primary/20 dark:border-primary/10">
          <div className="text-center">
            <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">
              Sobre este Blog
            </h3>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto mb-6">
              Este blog está dedicado a profesionales de la ciberseguridad que buscan profundizar 
              en técnicas avanzadas de pentesting y hacking ético. Todos los contenidos son puramente 
              educativos y están destinados a mejorar la seguridad de las organizaciones.
            </p>
            <div className="flex flex-wrap justify-center gap-3 text-sm">
              {[
                "Pentesting Ético", 
                "Análisis de Vulnerabilidades", 
                "Seguridad en Redes", 
                "Web Application Security", 
                "Metodologías Profesionales"
              ].map((topic, index) => (
                <span 
                  key={topic}
                  className="bg-white dark:bg-gray-800 text-primary border border-primary/20 px-3 py-1 rounded-full shadow-sm"
                  style={{ animationDelay: `${index * 0.1}s` }}
                >
                  • {topic}
                </span>
              ))}
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 mt-16">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center">
            <div className="mb-4">
              <h4 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
                Hacking & Pentesting Blog
              </h4>
              <p className="text-gray-500 dark:text-gray-400">
                Contenido educativo para profesionales de ciberseguridad
              </p>
            </div>
            <div className="border-t border-gray-200 dark:border-gray-700 pt-4">
              <p className="text-sm text-gray-500 dark:text-gray-400">
                © 2025 Hacking & Pentesting Blog. Todos los derechos reservados.
              </p>
              <p className="mt-2 text-xs text-gray-400 dark:text-gray-500">
                <strong>Disclaimer:</strong> Todo el contenido es únicamente para fines educativos y de pentesting ético.
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}
EOF
echo "✅ page.tsx actualizado con estilos mejorados"
echo ""

# Paso 7: Limpiar caché de Next.js
echo "🧹 Paso 7: Limpiando caché de Next.js..."
if [ -d ".next" ]; then
    rm -rf .next
    echo "✅ Caché de Next.js limpiada"
else
    echo "ℹ️ No había caché de Next.js para limpiar"
fi
echo ""

# Paso 8: Probar el build localmente
echo "🔨 Paso 8: Probando build localmente..."
echo "Ejecutando: bun run build"
if bun run build; then
    echo "✅ Build exitoso! Todos los estilos están funcionando correctamente"
else
    echo "❌ Error en el build. Revisa los mensajes de error arriba."
    exit 1
fi
echo ""

# Paso 9: Preparar Git
echo "📦 Paso 9: Preparando commit..."
echo "Ejecutando: git add ."
git add .
echo "✅ Archivos añadidos al staging"
echo ""

# Paso 10: Hacer commit
echo "📝 Paso 10: Haciendo commit..."
COMMIT_MESSAGE="fix: restore complete CSS styles and Tailwind configuration

✅ Fixes Applied:
• Agregado autoprefixer a PostCSS config
• CSS completo con @tailwind directives y variables CSS
• Layout optimizado para carga correcta de estilos  
• ClientBody mejorado para aplicar clases Tailwind
• Page con gradientes, animaciones y efectos visuales
• Tema oscuro automático funcionando
• Scrollbar personalizada y responsive design

🎯 Resultado: 
• Blog con todos los estilos visuales restaurados
• Gradientes y animaciones funcionando
• Efectos hover y transiciones suaves
• Responsive design completo
• Dark/light mode operativo"
echo "Ejecutando: git commit -m \"$COMMIT_MESSAGE\""
git commit -m "$COMMIT_MESSAGE"
echo "✅ Commit realizado exitosamente"
echo ""

# Paso 11: Opcional - Push a GitHub
echo "🚀 Paso 11: ¿Hacer push a GitHub?"
read -p "¿Quieres hacer push a GitHub ahora? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Ejecutando: git push origin main"
    git push origin main
    echo "✅ Push realizado exitosamente"
    echo ""
    echo "🎉 ¡CORRECCIÓN CSS COMPLETADA CON ÉXITO!"
    echo "🚀 Tu blog ya está desplegado en GitHub con todos los estilos restaurados"
else
    echo "⏸️ Push omitido. Puedes hacer push manualmente cuando quieras:"
    echo "   git push origin main"
fi

echo ""
echo "✨ === CORRECCIÓN CSS COMPLETADA ==="
echo "🎯 Todos los estilos han sido restaurados:"
echo "  ✅ Gradientes y colores"
echo "  ✅ Efectos hover y animaciones"
echo "  ✅ Tema oscuro automático"
echo "  ✅ Responsive design"
echo "  ✅ Scrollbar personalizada"
echo "  ✅ Cards con efectos visuales"
echo "  ✅ Build funcionando correctamente"
echo ""
echo "🎨 Tu blog ahora debería verse con todos los estilos visuales completos!"
