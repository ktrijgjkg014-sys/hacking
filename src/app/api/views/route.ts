import { NextRequest, NextResponse } from 'next/server'
import { promises as fs } from 'fs'
import path from 'path'

const viewsFilePath = path.join(process.cwd(), 'data', 'views.json')

// Función auxiliar para asegurar que el archivo existe
async function ensureViewsFile() {
    try {
        await fs.access(viewsFilePath)
    } catch {
        await fs.mkdir(path.dirname(viewsFilePath), { recursive: true })
        await fs.writeFile(viewsFilePath, JSON.stringify({}), 'utf8')
    }
}

// Función auxiliar para leer las vistas
async function readViews() {
    await ensureViewsFile()
    try {
        const data = await fs.readFile(viewsFilePath, 'utf8')
        return JSON.parse(data || '{}')
    } catch {
        return {}
    }
}

// Función auxiliar para escribir las vistas
async function writeViews(views: Record<string, number>) {
    await ensureViewsFile()
    await fs.writeFile(viewsFilePath, JSON.stringify(views, null, 2), 'utf8')
}

export async function GET(request: NextRequest) {
    try {
        const views = await readViews()
        return NextResponse.json({ views, total: Object.values(views).reduce((a, b) => a + b, 0) })
    } catch (error) {
        console.error('Error reading views:', error)
        return NextResponse.json({ error: 'Failed to read views' }, { status: 500 })
    }
}

export async function POST(request: NextRequest) {
    try {
        const { slug } = await request.json()

        if (!slug || typeof slug !== 'string') {
            return NextResponse.json({ error: 'Invalid slug' }, { status: 400 })
        }

        const views = await readViews()

        // Incrementar la vista
        views[slug] = (views[slug] || 0) + 1

        await writeViews(views)

        return NextResponse.json({
            success: true,
            count: views[slug],
            slug
        })
    } catch (error) {
        console.error('Error updating views:', error)
        return NextResponse.json({ error: 'Failed to update views' }, { status: 500 })
    }
}
