#!/bin/bash
echo "🔧 === CORRIGIENDO ERROR DE PARAMS EN NEXT.JS 15+ ==="
echo ""
# Verificar si estamos en el directorio correcto
if [ ! -f "package.json" ]; then
echo "❌ Error: No se encontró package.json en el directorio actual"
echo "Asegúrate de ejecutar este script desde la raíz de tu proyecto"
exit 1
fi
echo "📁 Arreglando archivo src/app/articles/[slug]/page.tsx..."
# Crear el archivo corregido con params como Promise
cat > src/app/articles/[slug]/page.tsx << 'EOF'
import { notFound } from 'next/navigation'
import fs from 'fs/promises'
import path from 'path'
import matter from 'gray-matter'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
interface ArticlePageProps {
params: Promise<{
slug: string
}>
}
export default async function ArticlePage({ params }: ArticlePageProps) {
// Descomponer params como Promise en Next.js 15+
const { slug } = await params
try {
// Leer el archivo markdown desde content/articles/
const articlesDir = path.join(process.cwd(), 'content', 'articles')
const filePath = path.join(articlesDir, `${slug}.md`)
// Verificar si el archivo existe
const fileExists = await fs.access(filePath).then(() => true).catch(() => false)
if (!fileExists) {
console.log(`Archivo no encontrado: ${filePath}`)
return notFound()
}
// Leer y parsear el contenido markdown
const fileContent = await fs.readFile(filePath, 'utf8')
const { data: frontmatter, content } = matter(fileContent)
// Extraer metadatos
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
{/* Header */}
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
{/* Contenido del artículo */}
<div className="bg-black/50 border border-green-600 p-6 rounded-lg">
<div className="flex items-center gap-2 mb-6">
<div className="text-green-400">$</div>
<div className="text-green-400">less article/{slug}.md</div>
</div>
<div className="prose prose-green prose-invert max-w-none">
<ReactMarkdown 
remarkPlugins={[remarkGfm]}
className="text-green-300 leading-relaxed"
components={{
h1: ({children}) => <h1 className="text-2xl font-bold text-green-400 mb-4 border-b border-green-600 pb-2 glow-green">{children}</h1>,
h2: ({children}) => <h2 className="text-xl font-bold text-green-400 mb-3 glow-green">{children}</h2>,
h3: ({children}) => <h3 className="text-lg font-bold text-green-400 mb-2 glow-green">{children}</h3>,
p: ({children}) => <p className="mb-4 text-green-300 leading-relaxed">{children}</p>,
ul: ({children}) => <ul className="list-disc list-inside mb-4 text-green-300 space-y-2">{children}</ul>,
ol: ({children}) => <ol className="list-decimal list-inside mb-4 text-green-300 space-y-2">{children}</ol>,
li: ({children}) => <li className="text-green-300">{children}</li>,
code: ({children}) => <code className="bg-green-900/30 text-green-400 px-2 py-1 rounded text-sm border border-green-600">{children}</code>,
pre: ({children}) => <pre className="bg-green-900/20 text-green-400 p-4 rounded border border-green-600 overflow-x-auto mb-4 glow-green">{children}</pre>,
blockquote: ({children}) => <blockquote className="border-l-4 border-green-500 pl-4 text-green-300 italic mb-4 bg-green-900/10">{children}</blockquote>,
strong: ({children}) => <strong className="text-green-400 font-bold">{children}</strong>,
em: ({children}) => <em className="text-green-400 italic">{children}</em>,
a: ({children, href}) => <a href={href} className="text-green-400 underline hover:text-green-300 glow-green">{children}</a>,
}}
>
{content}
</ReactMarkdown>
</div>
</div>
{/* Footer con comando para volver */}
<div className="mt-8 pt-6 border-t border-green-600">
<div className="flex items-center gap-2">
<div className="text-green-400">$</div>
<div className="text-green-400">ls -la</div>
</div>
<div className="mt-4">
<a 
href="/" 
className="inline-flex items-center gap-2 bg-green-900/30 text-green-400 px-4 py-2 rounded border border-green-600 hover:bg-green-900/50 transition-colors glow-green"
>
<span>←</span>
<span>Volver al blog</span>
</a>
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
// Generar metadatos para SEO
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
EOF
echo "✅ Archivo src/app/articles/[slug]/page.tsx corregido"
echo ""
echo "🧹 Limpiando caché de Next.js..."
rm -rf .next
rm -rf node_modules/.cache
echo "🔨 Probando build nuevamente..."
if bun run build; then
echo ""
echo "🎉 ¡BUILD EXITOSO!"
echo "✅ El error de params ha sido corregido"
echo "✅ Los artículos ahora deberían funcionar correctamente"
echo ""
echo "🚀 Puedes proceder con el commit y push:"
echo "   git add -A"
echo "   git commit -m 'fix: corrected Next.js 15+ params Promise handling'"
echo "   git push"
else
echo ""
echo "❌ Aún hay errores en el build. Por favor, comparte el output completo."
fi
