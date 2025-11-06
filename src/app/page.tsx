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
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900">
      {/* Header */}
      <header className="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">
                Hacking & Pentesting Blog
              </h1>
              <p className="text-gray-600 dark:text-gray-300 mt-2">
                Blog técnico sobre pentesting, hacking ético y seguridad informática
              </p>
            </div>
            <div className="hidden md:block">
              <div className="flex items-center space-x-4 text-sm text-gray-500 dark:text-gray-400">
                <span className="flex items-center">
                  <FileText className="w-4 h-4 mr-1" />
                  {articles.length} Artículos
                </span>
                <span>Actualizado: Nov 2025</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-4 py-8">
        {/* Hero Section */}
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Artículos Técnicos de Seguridad
          </h2>
          <p className="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
            Explora técnicas avanzadas de pentesting, análisis de vulnerabilidades y metodologías de seguridad 
            en este blog especializado para profesionales de la ciberseguridad.
          </p>
        </div>

        {/* Articles Grid */}
        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
          {articles.map((article) => (
            <article key={article.id} className="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 border border-gray-200 dark:border-gray-700">
              <div className="p-6">
                {/* Article Meta */}
                <div className="flex items-center justify-between mb-4">
                  <span className="inline-block bg-primary/10 text-primary px-3 py-1 rounded-full text-sm font-medium">
                    {article.category}
                  </span>
                  <div className="flex items-center text-gray-500 dark:text-gray-400 text-sm">
                    <Clock className="w-4 h-4 mr-1" />
                    {article.readTime}
                  </div>
                </div>

                {/* Article Title */}
                <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3 leading-tight">
                  {article.title}
                </h3>

                {/* Article Description */}
                <p className="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed">
                  {article.description}
                </p>

                {/* Tags */}
                <div className="flex flex-wrap gap-2 mb-4">
                  {article.tags.map((tag) => (
                    <span key={tag} className="inline-flex items-center text-xs text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded">
                      <Tag className="w-3 h-3 mr-1" />
                      {tag}
                    </span>
                  ))}
                </div>

                {/* Article Footer */}
                <div className="flex items-center justify-between pt-4 border-t border-gray-200 dark:border-gray-700">
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
                <div className="mt-4">
                  <Link 
                    href={`/articles/${article.id}`}
                    className="inline-flex items-center px-4 py-2 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90 transition-colors duration-200 font-medium"
                  >
                    Leer Artículo
                    <FileText className="w-4 h-4 ml-2" />
                  </Link>
                </div>
              </div>
            </article>
          ))}
        </div>

        {/* Additional Info */}
        <div className="mt-16 bg-white dark:bg-gray-800 rounded-lg p-8 border border-gray-200 dark:border-gray-700">
          <div className="text-center">
            <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">
              Sobre este Blog
            </h3>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto mb-6">
              Este blog está dedicado a profesionales de la ciberseguridad que buscan profundizar 
              en técnicas avanzadas de pentesting y hacking ético. Todos los contenidos son puramente 
              educativos y están destinados a mejorar la seguridad de las organizaciones.
            </p>
            <div className="flex flex-wrap justify-center gap-4 text-sm text-gray-500 dark:text-gray-400">
              <span>• Pentesting Ético</span>
              <span>• Análisis de Vulnerabilidades</span>
              <span>• Seguridad en Redes</span>
              <span>• Web Application Security</span>
              <span>• Metodologías Profesionales</span>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 mt-16">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center text-gray-500 dark:text-gray-400">
            <p>&copy; 2025 Hacking & Pentesting Blog. Contenido educativo para profesionales de ciberseguridad.</p>
            <p className="mt-2 text-sm">
              <strong>Disclaimer:</strong> Todo el contenido es únicamente para fines educativos y de pentesting ético.
            </p>
          </div>
        </div>
      </footer>
    </div>
  )
}
