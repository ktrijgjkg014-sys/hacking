import Link from "next/link"
import { FileText, Clock, User, Tag, Terminal } from "lucide-react"

const articles = [
  {
    slug: "introduccion-pentesting",
    title: "Introducción al Pentesting: Metodología y Fases",
    description: "Aprende las bases del pentesting profesional, sus fases metodológicas y las mejores prácticas para realizar auditorías de seguridad efectivas.",
    author: "Security Research Team",
    category: "Pentesting",
    readTime: "15 min",
    tags: ["pentesting", "metodología", "básico", "seguridad"],
    date: "2025-01-15"
  },
  {
    slug: "nmap-tecnicas-avanzadas", 
    title: "Nmap: Técnicas Avanzadas de Escaneo de Redes",
    description: "Explora técnicas avanzadas de escaneo con Nmap incluyendo evasión de firewalls, NSE scripts y optimización de escaneos a gran escala.",
    author: "Security Research Team",
    category: "Network Security",
    readTime: "20 min",
    tags: ["nmap", "network", "scanning", "firewall"],
    date: "2025-01-05"
  },
  {
    slug: "sql-injection-avanzado",
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
    <div className="min-h-screen bg-black text-green-400">
      {/* Header Terminal Style */}
      <header className="border-b-2 border-green-400 bg-black shadow-lg shadow-green-400/20">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <Terminal className="w-8 h-8 text-green-400 glow-green" />
              <div>
                <h1 className="text-3xl md:text-4xl font-mono font-bold glow-green">
                  &gt; HACKING & PENTESTING BLOG
                </h1>
                <p className="text-green-300 mt-2 text-sm md:text-base">
                  $ Blog técnico sobre pentesting, hacking ético y seguridad informática
                </p>
              </div>
            </div>
            <div className="hidden md:block">
              <div className="flex items-center space-x-4 text-green-300 text-sm">
                <span className="flex items-center border border-green-400 bg-green-400/10 px-3 py-1 rounded">
                  <FileText className="w-4 h-4 mr-1" />
                  {articles.length} ARTÍCULOS
                </span>
                <span className="text-xs">ÚLTIMA ACTUALIZACIÓN: NOV 2025</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-4 py-8">
        {/* Terminal Prompt Section */}
        <div className="text-center mb-12">
          <div className="max-w-4xl mx-auto">
            <div className="bg-black border-2 border-green-400 p-6 rounded-lg shadow-lg shadow-green-400/30">
              <div className="flex items-center mb-4">
                <span className="text-green-400 font-mono mr-2">$</span>
                <h2 className="text-2xl md:text-4xl font-mono font-bold text-green-400 glow-green">
                  ARTÍCULOS TÉCNICOS DE CIBERSEGURIDAD
                </h2>
              </div>
              <p className="text-green-300 text-lg md:text-xl font-mono">
                &gt; Explora técnicas avanzadas de pentesting, análisis de vulnerabilidades y metodologías de seguridad
              </p>
            </div>
          </div>
        </div>

        {/* Articles Grid Terminal Style */}
        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3 mb-12">
          {articles.map((article, index) => (
            <article 
              key={article.slug} 
              className="group card-hacking p-6 rounded-lg hover:scale-105"
              style={{
                animationDelay: `${index * 0.2}s`
              }}
            >
              {/* Article Header */}
              <div className="flex items-center justify-between mb-4">
                <span className="inline-block bg-green-400 text-black px-3 py-1 rounded font-mono text-sm font-bold">
                  &gt; {article.category.toUpperCase()}
                </span>
                <div className="flex items-center text-green-300 text-sm font-mono">
                  <Clock className="w-4 h-4 mr-1" />
                  {article.readTime}
                </div>
              </div>

              {/* Article Title */}
              <h3 className="text-xl font-mono font-bold text-green-400 mb-3 leading-tight group-hover:text-green-200 transition-colors glow-green">
                &gt; {article.title}
              </h3>

              {/* Article Description */}
              <p className="text-green-300 mb-4 leading-relaxed text-sm font-mono">
                $ {article.description}
              </p>

              {/* Tags */}
              <div className="flex flex-wrap gap-2 mb-4">
                {article.tags.slice(0, 3).map((tag) => (
                  <span key={tag} className="inline-flex items-center text-xs text-green-400 bg-black border border-green-400 px-2 py-1 rounded font-mono">
                    <Tag className="w-3 h-3 mr-1" />
                    {tag}
                  </span>
                ))}
                {article.tags.length > 3 && (
                  <span className="text-xs text-green-500 font-mono">+{article.tags.length - 3} más</span>
                )}
              </div>

              {/* Article Footer */}
              <div className="flex items-center justify-between pt-4 border-t border-green-400 mb-4">
                <div className="flex items-center text-sm text-green-300 font-mono">
                  <User className="w-4 h-4 mr-2" />
                  <span>{article.author}</span>
                </div>
                <div className="text-sm text-green-300 font-mono">
                  {new Date(article.date).toLocaleDateString('es-ES', {
                    year: 'numeric',
                    month: 'short',
                    day: 'numeric'
                  })}
                </div>
              </div>

              {/* Read Button */}
              <Link 
                href={`/articles/${article.slug}`}
                className="inline-flex items-center w-full justify-center px-4 py-3 bg-green-400 text-black rounded font-mono font-bold hover:bg-green-300 transition-all duration-200 shadow-lg hover:shadow-green-400/50"
              >
                &gt; LEER ARTÍCULO
                <Terminal className="w-4 h-4 ml-2" />
              </Link>
            </article>
          ))}
        </div>

        {/* Terminal Info Section */}
        <div className="bg-black border-2 border-green-400 rounded-lg p-8 shadow-lg shadow-green-400/30">
          <div className="text-center">
            <div className="flex items-center justify-center mb-4">
              <span className="text-green-400 font-mono mr-2">$</span>
              <h3 className="text-2xl font-mono font-bold text-green-400 glow-green">
                SOBRE ESTE BLOG
              </h3>
            </div>
            <p className="text-green-300 max-w-2xl mx-auto mb-6 font-mono">
              &gt; Este blog está dedicado a profesionales de la ciberseguridad que buscan profundizar 
              en técnicas avanzadas de pentesting y hacking ético. Todos los contenidos son puramente 
              educativos y están destinados a mejorar la seguridad de las organizaciones.
            </p>
            <div className="flex flex-wrap justify-center gap-3 text-sm">
              {[
                "PENTESTING ÉTICO", 
                "ANÁLISIS DE VULNERABILIDADES", 
                "SEGURIDAD EN REDES", 
                "WEB APPLICATION SECURITY", 
                "METODOLOGÍAS PROFESIONALES"
              ].map((topic, index) => (
                <span 
                  key={topic}
                  className="bg-black text-green-400 border border-green-400 px-3 py-1 rounded font-mono text-xs shadow-sm"
                  style={{ animationDelay: `${index * 0.1}s` }}
                >
                  &gt; {topic}
                </span>
              ))}
            </div>
          </div>
        </div>
      </main>

      {/* Footer Terminal Style */}
      <footer className="bg-black border-t-2 border-green-400 mt-16 shadow-lg shadow-green-400/20">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center">
            <div className="mb-4">
              <div className="flex items-center justify-center mb-2">
                <Terminal className="w-6 h-6 text-green-400 mr-2" />
                <h4 className="text-lg font-mono font-bold text-green-400 glow-green">
                  HACKING & PENTESTING BLOG
                </h4>
              </div>
              <p className="text-green-300 font-mono">
                &gt; Contenido educativo para profesionales de ciberseguridad
              </p>
            </div>
            <div className="border-t border-green-400 pt-4">
              <p className="text-sm text-green-300 font-mono">
                © 2025 HACKING & PENTESTING BLOG. TODOS LOS DERECHOS RESERVADOS.
              </p>
              <p className="mt-2 text-xs text-yellow-400 font-mono">
                <strong>DISCLAIMER:</strong> TODO EL CONTENIDO ES ÚNICAMENTE PARA FINES EDUCATIVOS Y DE PENTESTING ÉTICO.
              </p>
            </div>
          </div>
        </div>
      </footer>
    </div>
  )
}
