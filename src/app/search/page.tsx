import { Search, Filter, X } from 'lucide-react'
import ModernLayout from '@/components/ModernLayout'
import Link from 'next/link'
import { useState, useMemo } from 'react'

export const metadata = {
  title: 'Buscar | Blog de Ethical Hacking',
  description: 'Busca artículos, tutoriales y recursos de ciberseguridad'
}

const SearchPage = () => {
  const [searchQuery, setSearchQuery] = useState('')
  const [selectedCategory, setSelectedCategory] = useState('all')
  const [selectedDifficulty, setSelectedDifficulty] = useState('all')

  const categories = ['all', 'tutoriales', 'herramientas', 'noticias', 'analisis', 'curso']
  const difficulties = ['all', 'basico', 'intermedio', 'avanzado']

  // Mock data - replace with actual article data
  const allArticles = [
    { id: 1, title: 'Introducción al Ethical Hacking', category: 'tutoriales', difficulty: 'basico', excerpt: 'Aprende los fundamentos del hacking ético...', slug: 'introduccion-ethical-hacking' },
    { id: 2, title: 'Nmap: Escaneo de Redes', category: 'herramientas', difficulty: 'intermedio', excerpt: 'Domina el arte del escaneo con Nmap...', slug: 'nmap-escaneo-redes' },
    { id: 3, title: 'SQL Injection: Guía Completa', category: 'tutoriales', difficulty: 'avanzado', excerpt: 'Técnicas avanzadas de inyección SQL...', slug: 'sql-injection-guia' },
  ]

  const filteredArticles = useMemo(() => {
    return allArticles.filter(article => {
      const matchesSearch = searchQuery === '' || 
        article.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        article.excerpt.toLowerCase().includes(searchQuery.toLowerCase())
      
      const matchesCategory = selectedCategory === 'all' || article.category === selectedCategory
      const matchesDifficulty = selectedDifficulty === 'all' || article.difficulty === selectedDifficulty

      return matchesSearch && matchesCategory && matchesDifficulty
    })
  }, [searchQuery, selectedCategory, selectedDifficulty, allArticles])

  const clearFilters = () => {
    setSearchQuery('')
    setSelectedCategory('all')
    setSelectedDifficulty('all')
  }

  return (
    <ModernLayout>
      <div className="min-h-screen bg-black text-white py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent mb-6">
              Buscar Artículos
            </h1>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              Encuentra tutoriales, herramientas y recursos de ciberseguridad
            </p>
          </div>

          {/* Barra de búsqueda principal */}
          <div className="bg-gray-900 rounded-2xl p-6 mb-8">
            <div className="flex flex-col md:flex-row gap-4">
              <div className="flex-1 relative">
                <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                <input
                  type="text"
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Buscar artículos, tutoriales, herramientas..."
                  className="w-full pl-12 pr-4 py-3 bg-black border border-gray-700 rounded-lg focus:border-cyan-400 focus:outline-none"
                />
              </div>
            </div>
          </div>

          {/* Filtros */}
          <div className="bg-gray-900 rounded-2xl p-6 mb-8">
            <div className="flex flex-wrap items-center gap-4">
              <div className="flex items-center space-x-2">
                <Filter className="h-5 w-5 text-cyan-400" />
                <span className="font-semibold">Filtros:</span>
              </div>
              
              <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="bg-black border border-gray-700 rounded-lg px-3 py-2 focus:border-cyan-400 focus:outline-none"
              >
                <option value="all">Todas las categorías</option>
                <option value="tutoriales">Tutoriales</option>
                <option value="herramientas">Herramientas</option>
                <option value="noticias">Noticias</option>
                <option value="analisis">Análisis</option>
                <option value="curso">Curso</option>
              </select>

              <select
                value={selectedDifficulty}
                onChange={(e) => setSelectedDifficulty(e.target.value)}
                className="bg-black border border-gray-700 rounded-lg px-3 py-2 focus:border-cyan-400 focus:outline-none"
              >
                <option value="all">Todas las dificultades</option>
                <option value="basico">Básico</option>
                <option value="intermedio">Intermedio</option>
                <option value="avanzado">Avanzado</option>
              </select>

              {(searchQuery || selectedCategory !== 'all' || selectedDifficulty !== 'all') && (
                <button
                  onClick={clearFilters}
                  className="flex items-center space-x-2 px-3 py-2 bg-red-600 hover:bg-red-700 rounded-lg transition-colors"
                >
                  <X className="h-4 w-4" />
                  <span>Limpiar</span>
                </button>
              )}
            </div>
          </div>

          {/* Resultados */}
          <div className="mb-8">
            <p className="text-gray-300 mb-6">
              Encontrados {filteredArticles.length} artículo{filteredArticles.length !== 1 ? 's' : ''}
            </p>

            {filteredArticles.length > 0 ? (
              <div className="grid gap-6">
                {filteredArticles.map((article) => (
                  <div key={article.id} className="bg-gray-900 rounded-xl p-6 hover:bg-gray-800 transition-colors">
                    <div className="flex flex-wrap items-center gap-2 mb-3">
                      <span className="px-2 py-1 bg-cyan-600 text-white text-xs rounded-full capitalize">
                        {article.category}
                      </span>
                      <span className="px-2 py-1 bg-blue-600 text-white text-xs rounded-full capitalize">
                        {article.difficulty}
                      </span>
                    </div>
                    <h2 className="text-2xl font-bold text-white mb-3 hover:text-cyan-400 transition-colors">
                      <Link href={`/articles/${article.slug}`}>
                        {article.title}
                      </Link>
                    </h2>
                    <p className="text-gray-300 mb-4">{article.excerpt}</p>
                    <Link 
                      href={`/articles/${article.slug}`}
                      className="text-cyan-400 hover:text-cyan-300 font-semibold"
                    >
                      Leer más →
                    </Link>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-12">
                <p className="text-gray-400 text-lg">No se encontraron artículos con esos filtros</p>
                <p className="text-gray-500 mt-2">Prueba ajustando los criterios de búsqueda</p>
              </div>
            )}
          </div>
        </div>
      </div>
    </ModernLayout>
  )
}

export default SearchPage
