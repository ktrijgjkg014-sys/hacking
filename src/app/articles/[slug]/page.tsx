import { notFound } from 'next/navigation'
import fs from 'fs/promises'
import path from 'path'
import matter from 'gray-matter'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import Link from 'next/link'

interface ArticlePageProps {
  params: Promise<{
    slug: string
  }>
}

export default async function ArticlePage({ params }: ArticlePageProps) {
  const { slug } = await params
  
  try {
    const articlesDir = path.join(process.cwd(), 'content', 'articles')
    const filePath = path.join(articlesDir, `${slug}.md`)
    
    const fileExists = await fs.access(filePath).then(() => true).catch(() => false)
    if (!fileExists) {
      return notFound()
    }
    
    const fileContent = await fs.readFile(filePath, 'utf8')
    const { data: frontmatter, content } = matter(fileContent)
    
    const title = frontmatter.title || 'Artículo sin título'
    const description = frontmatter.description || 'Sin descripción'
    const date = frontmatter.date || 'Sin fecha'
    const author = frontmatter.author || 'Autor desconocido'
    const category = frontmatter.category || 'Sin categoría'
    const tags = frontmatter.tags || []
    const readTime = frontmatter.readTime || '5 min'
    
    return (
      <div className="min-h-screen bg-black text-green-400 font-mono">
        <div className="max-w-4xl mx-auto px-6 py-12">
          <div className="mb-8">
            <div className="flex items-center gap-4 mb-4">
              <div className="text-green-400">$</div>
              <div className="text-green-400">cat article/{slug}.md</div>
            </div>
            <div className="border-l-2 border-green-400 pl-4 mb-6">
              <h1 className="text-3xl font-bold text-green-400 mb-2 glow-green">
                {title}
              </h1>
              <p className="text-green-300 text-lg mb-4">{description}</p>
              <div className="text-green-500 text-sm">
                <span className="mr-4">📅 {date}</span>
                <span className="mr-4">👤 {author}</span>
                <span className="mr-4">🏷️ {category}</span>
                <span className="mr-4">⏱️ {readTime}</span>
              </div>
              {tags.length > 0 && (
                <div className="mt-2">
                  {tags.map((tag: string) => (
                    <span key={tag} className="inline-block bg-green-900/30 text-green-400 px-2 py-1 text-xs mr-2 mb-1 border border-green-600">
                      #{tag}
                    </span>
                  ))}
                </div>
              )}
            </div>
          </div>
          
          <div className="bg-black/50 border border-green-600 p-6 rounded-lg">
            <div className="flex items-center gap-2 mb-6">
              <div className="text-green-400">$</div>
              <div className="text-green-400">less article/{slug}.md</div>
            </div>
            <div className="prose prose-green prose-invert max-w-none text-green-300 leading-relaxed">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>
                {content}
              </ReactMarkdown>
            </div>
          </div>
          
          <div className="mt-8 pt-6 border-t border-green-600">
            <div className="flex items-center gap-2">
              <div className="text-green-400">$</div>
              <div className="text-green-400">ls -la</div>
            </div>
            <div className="mt-4">
              <Link 
                href="/" 
                className="inline-flex items-center gap-2 bg-green-900/30 text-green-400 px-4 py-2 rounded border border-green-600 hover:bg-green-900/50 transition-colors glow-green"
              >
                <span>←</span>
                <span>Volver al blog</span>
              </Link>
            </div>
          </div>
        </div>
      </div>
    )
  } catch (error) {
    console.error('Error al cargar el artículo:', error)
    return notFound()
  }
}

export async function generateMetadata({ params }: ArticlePageProps) {
  const { slug } = await params
  
  try {
    const articlesDir = path.join(process.cwd(), 'content', 'articles')
    const filePath = path.join(articlesDir, `${slug}.md`)
    
    const fileContent = await fs.readFile(filePath, 'utf8')
    const { data: frontmatter } = matter(fileContent)
    
    return {
      title: `${frontmatter.title || 'Artículo'} | Blog de Ethical Hacking`,
      description: frontmatter.description || 'Artículo sobre ethical hacking y pentesting',
    }
  } catch {
    return {
      title: 'Artículo no encontrado | Blog de Ethical Hacking',
      description: 'El artículo solicitado no pudo ser encontrado',
    }
  }
}
