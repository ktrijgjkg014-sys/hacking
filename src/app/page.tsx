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
