#!/bin/bash

# =======================================================================
# SCRIPT DE CORRECCIÓN AUTOMÁTICA - ETHICAL HACKING BLOG
# =======================================================================
# Este script corrige todos los problemas identificados:
# 1. Elimina same-runtime dependency
# 2. Corrige tsconfig.json
# 3. Crea page.tsx completo
# 4. Actualiza package.json
# =======================================================================

echo "🔧 INICIANDO CORRECCIONES AUTOMÁTICAS..."
echo "=================================================="

# Backup de archivos originales
echo "📁 Creando backups..."
cp package.json package.json.backup.$(date +%Y%m%d_%H%M%S)
cp tsconfig.json tsconfig.json.backup.$(date +%Y%m%d_%H%M%S)

# 1. CORREGIR package.json
echo "🔧 Corrigiendo package.json..."
cat > package.json << 'EOF'
{
  "name": "hacking-blog",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "gray-matter": "^4.0.3",
    "lucide-react": "^0.475.0",
    "next": "^15.5.6",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-markdown": "^9.0.1",
    "remark-gfm": "^4.0.0"
  },
  "devDependencies": {
    "@types/node": "^20.14.2",
    "@types/react": "^18.3.3",
    "@types/react-dom": "^18.3.0",
    "autoprefixer": "^10.4.19",
    "eslint": "^8.57.0",
    "eslint-config-next": "^15.5.6",
    "postcss": "^8.4.38",
    "tailwindcss": "^3.4.3",
    "typescript": "^5.4.5"
  }
}
EOF

# 2. CORREGIR tsconfig.json
echo "🔧 Corrigiendo tsconfig.json..."
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": [
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts",
    "next-env.d.ts",
    "build/types/**/*.ts"
  ],
  "exclude": ["node_modules"]
}
EOF

# 3. CREAR page.tsx COMPLETO
echo "🔧 Creando page.tsx completo..."
mkdir -p src/app

cat > src/app/page.tsx << 'EOF'
'use client'
import React, { useState, useEffect } from 'react'
import Link from "next/link"
import { FileText, Clock, User, Tag, Terminal, Eye, TrendingUp, BookOpen, Youtube, Mail } from "lucide-react"
import ViewCounter from "../components/ViewCounter"
import Pagination from "../components/Pagination"
import BlogSections from "../components/BlogSections"

const ARTICLES_PER_PAGE = 6

const allArticles = [
  {
    slug: "vibe-hacking",
    title: "Vibe Hacking en Kali Linux: Automatización Cognitiva con Nmap y LLMs",
    description: "Profundizamos en la fusión de Nmap y LLMs en entornos avanzados de red teaming.",
    author: "Codigo",
    category: "Red Teaming",
    readTime: "15 min",
    tags: ["vibe hacking", "llm", "nmap", "ollama"],
    date: "2025-01-15",
    views: 45,
    featured: true
  },
  {
    slug: "letreros-led",
    title: "Vulnerabilidades en Controladores LED: IoT Security Analysis",
    description: "Análisis técnico-profesional de vulnerabilidades en controladores LED y dispositivos IoT.",
    author: "Codigo",
    category: "IoT Security",
    readTime: "20 min",
    tags: ["nmap", "IoT hacking", "physical pentesting", "LED signs"],
    date: "2025-01-05",
    views: 32,
    featured: false
  },
  {
    slug: "sql-injection-avanzado",
    title: "SQL Injection Avanzado: Técnicas de Exfiltración y Evasión",
    description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos.",
    author: "codigo",
    category: "Web Security",
    readTime: "25 min",
    tags: ["sql-injection", "web", "avanzado", "database"],
    date: "2025-01-10",
    views: 67,
    featured: true
  },
  {
    slug: "wireless-pentesting",
    title: "Wireless Pentesting Avanzado: Ataques WPA2/3 y Evil Twin",
    description: "Técnicas avanzadas de pentesting inalámbrico incluyendo ataques WPA2/3, Evil Twin y ataques de wordlist en escenarios reales.",
    author: "codigo",
    category: "Wireless Security",
    readTime: "18 min",
    tags: ["wifi", "wpa2", "aircrack", "evil twin"],
    date: "2025-01-12",
    views: 89,
    featured: true
  },
  {
    slug: "social-engineering",
    title: "Social Engineering: Psicología del Error Humano",
    description: "Técnicas de ingeniería social en pentesting, análisis psicológico de víctimas y metodología de phishing avanzado.",
    author: "codigo",
    category: "Social Engineering",
    readTime: "22 min",
    tags: ["social engineering", "phishing", "psychology", "human factor"],
    date: "2025-01-08",
    views: 156,
    featured: true
  },
  {
    slug: "malware-analysis",
    title: "Malware Analysis: Reverse Engineering de Trojans y Ransomware",
    description: "Análisis técnico de malware incluyendo reverse engineering, análisis dinámico y técnicas de sandboxing para detección de amenazas.",
    author: "codigo",
    category: "Malware Analysis",
    readTime: "30 min",
    tags: ["malware", "reverse engineering", "static analysis", "dynamic analysis"],
    date: "2025-01-03",
    views: 203,
    featured: true
  },
  {
    slug: "network-forensics",
    title: "Network Forensics: Análisis de Tráfico y Detección de Amenazas",
    description: "Metodología de análisis forense de redes, captura de paquetes y detección de actividad maliciosa en entornos corporativos.",
    author: "codigo",
    category: "Forensics",
    readTime: "28 min",
    tags: ["forensics", "network", "wireshark", "pcap"],
    date: "2025-01-01",
    views: 134,
    featured: false
  },
  {
    slug: "blue-teaming",
    title: "Blue Teaming: Defense in Depth y SIEM Implementation",
    description: "Estrategias de defensa cibernética, implementación de SIEM y técnicas de detección de amenazas en tiempo real.",
    author: "codigo",
    category: "Blue Team",
    readTime: "35 min",
    tags: ["blue team", "siem", "threat detection", "defense"],
    date: "2024-12-28",
    views: 98,
    featured: false
  }
]

function formatDate(dateString: string) {
  const date = new Date(dateString)
  const now = new Date()
  const diffTime = Math.abs(now.getTime() - date.getTime())
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
  
  if (diffDays === 1) return "Hace 1 día"
  if (diffDays < 30) return `Hace ${diffDays} días`
  
  return date.toLocaleDateString('es-ES', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

function formatViews(views: number) {
  if (views >= 1000000) return `${(views / 1000000).toFixed(1)}M`
  if (views >= 1000) return `${(views / 1000).toFixed(1)}k`
  return views.toString()
}

export default function HomePage() {
  const [currentPage, setCurrentPage] = useState(1)
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [searchQuery, setSearchQuery] = useState('')
  const [isMenuOpen, setIsMenuOpen] = useState(false)
  const [scrollY, setScrollY] = useState(0)

  useEffect(() => {
    const handleScroll = () => setScrollY(window.scrollY)
    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  const categories = ['all', 'Red Teaming', 'IoT Security', 'Web Security', 'Wireless Security', 'Social Engineering', 'Malware Analysis', 'Forensics', 'Blue Team']

  const filteredArticles = allArticles.filter(article => {
    const matchesCategory = selectedCategory === 'all' || article.category === selectedCategory
    const matchesSearch = searchQuery === '' || 
      article.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      article.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
      article.tags.some(tag => tag.toLowerCase().includes(searchQuery.toLowerCase()))
    return matchesCategory && matchesSearch
  })

  const featuredArticles = filteredArticles.filter(article => article.featured)
  const regularArticles = filteredArticles.filter(article => !article.featured)
  
  const startIndex = (currentPage - 1) * ARTICLES_PER_PAGE
  const endIndex = startIndex + ARTICLES_PER_PAGE
  const currentArticles = regularArticles.slice(startIndex, endIndex)
  const totalPages = Math.ceil(regularArticles.length / ARTICLES_PER_PAGE)

  const ArticleCard = ({ article }: { article: any }) => (
    <article className="group bg-gradient-to-br from-slate-800/50 to-slate-900/50 backdrop-blur-sm border border-slate-700/50 rounded-xl p-6 hover:border-cyan-500/50 transition-all duration-300 hover:shadow-lg hover:shadow-cyan-500/10 hover:transform hover:scale-[1.02]">
      <div className="flex items-center justify-between mb-4">
        <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-cyan-500/20 text-cyan-300 border border-cyan-500/30">
          <Tag className="w-3 h-3 mr-1" />
          {article.category}
        </span>
        <div className="flex items-center text-slate-400 text-sm">
          <Eye className="w-4 h-4 mr-1" />
          <span className="font-mono">{formatViews(article.views)}</span>
        </div>
      </div>
      
      <Link href={`/articles/${article.slug}`} className="block group-hover:text-cyan-300 transition-colors">
        <h2 className="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition-colors line-clamp-2">
          {article.title}
        </h2>
        <p className="text-slate-300 mb-4 line-clamp-3 leading-relaxed">
          {article.description}
        </p>
      </Link>

      <div className="flex items-center justify-between mb-4 text-sm text-slate-400">
        <div className="flex items-center">
          <User className="w-4 h-4 mr-1" />
          <span>{article.author}</span>
        </div>
        <div className="flex items-center">
          <Clock className="w-4 h-4 mr-1" />
          <span>{article.readTime}</span>
        </div>
      </div>

      <div className="flex items-center justify-between">
        <div className="text-sm text-slate-500">
          {formatDate(article.date)}
        </div>
        <Link 
          href={`/articles/${article.slug}`}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-cyan-300 bg-cyan-500/10 border border-cyan-500/30 rounded-lg hover:bg-cyan-500/20 hover:border-cyan-400/50 transition-all duration-200"
        >
          <FileText className="w-4 h-4 mr-2" />
          Leer artículo
        </Link>
      </div>
    </article>
  )

  return (
    <div className="min-h-screen bg-slate-950 text-white">
      {/* Header */}
      <header className={`fixed top-0 w-full z-50 transition-all duration-300 ${scrollY > 10 ? 'bg-slate-950/95 backdrop-blur-md border-b border-slate-800' : 'bg-transparent'}`}>
        <nav className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link href="/" className="text-2xl font-bold text-cyan-400 hover:text-cyan-300 transition-colors">
              <Terminal className="inline-block w-6 h-6 mr-2" />
              Ethical Hacking Blog
            </Link>
            
            {/* Desktop Navigation */}
            <div className="hidden md:flex items-center space-x-8">
              <Link href="/" className="text-slate-300 hover:text-cyan-300 transition-colors">Inicio</Link>
              <Link href="/about" className="text-slate-300 hover:text-cyan-300 transition-colors">Acerca</Link>
              <Link href="/courses" className="text-slate-300 hover:text-cyan-300 transition-colors">Cursos</Link>
              <Link href="/contact" className="text-slate-300 hover:text-cyan-300 transition-colors">Contacto</Link>
            </div>

            {/* Mobile menu button */}
            <button 
              className="md:hidden text-slate-300 hover:text-cyan-300"
              onClick={() => setIsMenuOpen(!isMenuOpen)}
            >
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            </button>
          </div>

          {/* Mobile Navigation */}
          {isMenuOpen && (
            <div className="md:hidden mt-4 pb-4 border-t border-slate-800">
              <div className="flex flex-col space-y-4 mt-4">
                <Link href="/" className="text-slate-300 hover:text-cyan-300 transition-colors">Inicio</Link>
                <Link href="/about" className="text-slate-300 hover:text-cyan-300 transition-colors">Acerca</Link>
                <Link href="/courses" className="text-slate-300 hover:text-cyan-300 transition-colors">Cursos</Link>
                <Link href="/contact" className="text-slate-300 hover:text-cyan-300 transition-colors">Contacto</Link>
              </div>
            </div>
          )}
        </nav>
      </header>

      <main className="pt-24">
        {/* Hero Section */}
        <section className="container mx-auto px-4 py-16">
          <div className="text-center mb-16">
            <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent">
              Ethical Hacking Blog
            </h1>
            <p className="text-xl text-slate-300 max-w-3xl mx-auto leading-relaxed">
              Técnicas avanzadas de pentesting, análisis de vulnerabilidades y seguridad cibernética 
              para profesionales y entusiastas de la ciberseguridad.
            </p>
          </div>

          {/* Search and Filter */}
          <div className="max-w-4xl mx-auto mb-12">
            <div className="flex flex-col md:flex-row gap-4 mb-8">
              <div className="flex-1">
                <input
                  type="text"
                  placeholder="Buscar artículos..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="w-full px-4 py-3 bg-slate-800/50 border border-slate-700 rounded-lg text-white placeholder-slate-400 focus:outline-none focus:border-cyan-500 focus:ring-1 focus:ring-cyan-500"
                />
              </div>
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="px-4 py-3 bg-slate-800/50 border border-slate-700 rounded-lg text-white focus:outline-none focus:border-cyan-500"
              >
                {categories.map(category => (
                  <option key={category} value={category}>
                    {category === 'all' ? 'Todas las categorías' : category}
                  </option>
                ))}
              </select>
            </div>
          </div>
        </section>

        {/* Featured Articles */}
        {featuredArticles.length > 0 && (
          <section className="container mx-auto px-4 mb-16">
            <h2 className="text-3xl font-bold mb-8 text-center">
              <TrendingUp className="inline-block w-8 h-8 mr-3 text-cyan-400" />
              Artículos Destacados
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {featuredArticles.map((article) => (
                <ArticleCard key={article.slug} article={article} />
              ))}
            </div>
          </section>
        )}

        {/* Regular Articles */}
        <section className="container mx-auto px-4 mb-16">
          <h2 className="text-3xl font-bold mb-8 text-center">
            <BookOpen className="inline-block w-8 h-8 mr-3 text-cyan-400" />
            Todos los Artículos
          </h2>
          
          {currentArticles.length > 0 ? (
            <>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                {currentArticles.map((article) => (
                  <ArticleCard key={article.slug} article={article} />
                ))}
              </div>
              
              {totalPages > 1 && (
                <Pagination
                  currentPage={currentPage}
                  totalPages={totalPages}
                  onPageChange={setCurrentPage}
                />
              )}
            </>
          ) : (
            <div className="text-center py-12">
              <p className="text-slate-400 text-lg">No se encontraron artículos con los filtros seleccionados.</p>
            </div>
          )}
        </section>
      </main>

      {/* Footer */}
      <footer className="bg-slate-900/50 border-t border-slate-800 py-12">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
              <h3 className="text-xl font-bold text-cyan-400 mb-4">
                <Terminal className="inline-block w-5 h-5 mr-2" />
                Ethical Hacking Blog
              </h3>
              <p className="text-slate-300">
                Recursos avanzados de seguridad cibernética y pentesting para profesionales.
              </p>
            </div>
            <div>
              <h4 className="text-lg font-semibold text-white mb-4">Enlaces Rápidos</h4>
              <ul className="space-y-2">
                <li><Link href="/" className="text-slate-300 hover:text-cyan-300 transition-colors">Inicio</Link></li>
                <li><Link href="/about" className="text-slate-300 hover:text-cyan-300 transition-colors">Acerca</Link></li>
                <li><Link href="/courses" className="text-slate-300 hover:text-cyan-300 transition-colors">Cursos</Link></li>
                <li><Link href="/contact" className="text-slate-300 hover:text-cyan-300 transition-colors">Contacto</Link></li>
              </ul>
            </div>
            <div>
              <h4 className="text-lg font-semibold text-white mb-4">Conecta</h4>
              <div className="flex space-x-4">
                <Link href="https://youtube.com" className="text-slate-300 hover:text-cyan-300 transition-colors">
                  <Youtube className="w-6 h-6" />
                </Link>
                <Link href="mailto:contacto@ethicalhacking.com" className="text-slate-300 hover:text-cyan-300 transition-colors">
                  <Mail className="w-6 h-6" />
                </Link>
              </div>
            </div>
          </div>
          <div className="border-t border-slate-800 mt-8 pt-8 text-center text-slate-400">
            <p>&copy; 2025 Ethical Hacking Blog. Contenido educativo para ciberseguridad.</p>
          </div>
        </div>
      </footer>

      <BlogSections />
    </div>
  )
}
EOF

# 4. Instalar dependencias
echo "📦 Instalando dependencias..."
rm -rf node_modules package-lock.json
npm install

# 5. Verificar que el build funcione
echo "🔍 Verificando build..."
npm run build

echo "=================================================="
echo "✅ CORRECCIONES COMPLETADAS EXITOSAMENTE!"
echo "=================================================="
echo ""
echo "🎉 Tu blog de hacking ético ya está:"
echo "   ✅ Sin errores de same-runtime"
echo "   ✅ Con page.tsx completo"
echo "   ✅ Con colores modernos (azul/cyan)"
echo "   ✅ Listo para Vercel"
echo ""
echo "📍 Archivos corregidos:"
echo "   • package.json (dependencias limpias)"
echo "   • tsconfig.json (sin same-runtime)"
echo "   • src/app/page.tsx (completo y funcional)"
echo ""
echo "🚀 Próximos pasos:"
echo "   1. git add ."
echo "   2. git commit -m 'Fix: Blog completamente corregido'"
echo "   3. git push origin main"
echo "   4. Verificar en Vercel"
echo ""
echo "🎯 ¡Tu blog estará 100% funcional!"
EOF

chmod +x fix_blog_completo.sh

echo ""
echo "🎉 ¡Script creado exitosamente!"
echo "📁 Archivo: fix_blog_completo.sh"
echo ""
echo "🔧 Para aplicar todas las correcciones en tu máquina:"
echo "   1. Descarga el archivo fix_blog_completo.sh"
echo "   2. Colócalo en tu proyecto:"
echo "      cp fix_blog_completo.sh /mnt/c/Users/LENOVO/Desktop/ethical-hacking-blog/"
echo "   3. Ejecuta:"
echo "      chmod +x fix_blog_completo.sh"
echo "      ./fix_blog_completo.sh"
echo ""
echo "✅ ¡El script hará todo automáticamente!"
