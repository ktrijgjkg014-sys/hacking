'use client'
import React from 'react'
import Link from 'next/link'
import { ChevronLeft, ChevronRight, MoreHorizontal } from 'lucide-react'
interface PaginationProps {
    currentPage: number
    totalPages: number
    basePath?: string
    showPageNumbers?: boolean
    maxVisiblePages?: number
}
export default function Pagination({
    currentPage,
    totalPages,
    basePath = '/',
    showPageNumbers = true,
    maxVisiblePages = 5
}: PaginationProps) {
    // Si solo hay una página, no mostrar paginación
    if (totalPages <= 1) {
        return null
    }
    // Generar números de página visibles
    const generatePageNumbers = () => {
        const pages: (number | string)[] = []
        const half = Math.floor(maxVisiblePages / 2)
        let start = Math.max(1, currentPage - half)
        let end = Math.min(totalPages, start + maxVisiblePages - 1)
        // Ajustar start si end está limitado
        if (end - start + 1 < maxVisiblePages) {
            start = Math.max(1, end - maxVisiblePages + 1)
        }
        // Primera página
        if (start > 1) {
            pages.push(1)
            if (start > 2) {
                pages.push('...')
            }
        }
        // Páginas intermedias
        for (let i = start; i <= end; i++) {
            pages.push(i)
        }
        // Última página
        if (end < totalPages) {
            if (end < totalPages - 1) {
                pages.push('...')
            }
            pages.push(totalPages)
        }
        return pages
    }
    const pageNumbers = generatePageNumbers()
    const getPageUrl = (page: number) => {
        if (page === 1) {
            return basePath
        }
        return `${basePath}page/${page}`
    }
    return (
        <nav className="pagination" role="navigation" aria-label="Navegación de páginas">
            {/* Botón anterior */}
            <Link
                href={getPageUrl(currentPage - 1)}
                className={`pagination-button ${currentPage === 1 ? 'disabled' : ''}`}
                aria-label="Página anterior"
                style={{ opacity: currentPage === 1 ? 0.5 : 1, pointerEvents: currentPage === 1 ? 'none' : 'auto' }}
            >
                <ChevronLeft className="w-4 h-4" />
                <span className="hidden sm:inline ml-1">Anterior</span>
            </Link>
            {/* Números de página */}
            {showPageNumbers && (
                <div className="flex items-center gap-1">
                    {pageNumbers.map((page, index) => {
                        if (page === '...') {
                            return (
                                <span
                                    key={`ellipsis-${index}`}
                                    className="px-2 text-muted-foreground"
                                    aria-hidden="true"
                                >
                                    <MoreHorizontal className="w-4 h-4" />
                                </span>
                            )
                        }
                        const pageNumber = page as number
                        const isActive = pageNumber === currentPage
                        return (
                            <Link
                                key={pageNumber}
                                href={getPageUrl(pageNumber)}
                                className={`pagination-button ${isActive ? 'active' : ''}`}
                                aria-label={isActive ? `Página actual: ${pageNumber}` : `Ir a página ${pageNumber}`}
                                aria-current={isActive ? 'page' : undefined}
                            >
                                {pageNumber}
                            </Link>
                        )
                    })}
                </div>
            )}
            {/* Botón siguiente */}
            <Link
                href={getPageUrl(currentPage + 1)}
                className={`pagination-button ${currentPage === totalPages ? 'disabled' : ''}`}
                aria-label="Página siguiente"
                style={{ opacity: currentPage === totalPages ? 0.5 : 1, pointerEvents: currentPage === totalPages ? 'none' : 'auto' }}
            >
                <span className="hidden sm:inline mr-1">Siguiente</span>
                <ChevronRight className="w-4 h-4" />
            </Link>
            {/* Información de página */}
            <div className="hidden md:flex items-center ml-4 text-sm text-muted-foreground">
                Página {currentPage} de {totalPages}
            </div>
        </nav>
    )
}
// Estilos CSS adicionales (se pueden mover a globals.css si se prefiere)
const paginationStyles = `
.pagination {
display: flex;
justify-content: center;
align-items: center;
gap: 0.5rem;
margin: 2rem 0;
flex-wrap: wrap;
}
.pagination-button {
background: hsla(214, 100%, 12%, 0.8);
border: 1px solid hsla(188, 100%, 42%, 0.3);
color: hsl(var(--foreground));
padding: 0.75rem 1rem;
border-radius: 0.5rem;
cursor: pointer;
transition: all 0.2s ease;
font-weight: 500;
text-decoration: none;
display: inline-flex;
align-items: center;
justify-content: center;
min-width: 2.5rem;
height: 2.5rem;
}
.pagination-button:hover {
background: hsla(188, 100%, 42%, 0.1);
border-color: hsla(188, 100%, 42%, 0.5);
color: hsl(var(--primary));
text-decoration: none;
}
.pagination-button.active {
background: hsla(188, 100%, 42%, 0.2);
border-color: hsla(188, 100%, 42%, 0.7);
color: hsl(var(--primary));
font-weight: 600;
}
.pagination-button:disabled {
opacity: 0.5;
cursor: not-allowed;
}
@media (max-width: 640px) {
.pagination {
gap: 0.25rem;
}
.pagination-button {
padding: 0.5rem 0.75rem;
min-width: 2rem;
height: 2rem;
font-size: 0.875rem;
}
}
`
