'use client'
import React, { useState, useEffect } from 'react'
import { Eye, EyeOff } from 'lucide-react'
interface ViewCounterProps {
    slug: string
    className?: string
}
interface ViewData {
    count: number
    lastUpdated: string
}
export default function ViewCounter({ slug, className = '' }: ViewCounterProps) {
    const [views, setViews] = useState<number>(0)
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    useEffect(() => {
        if (!slug) return
        const updateViews = async () => {
            try {
                // Intentar incrementar las vistas
                const response = await fetch('/api/views', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ slug }),
                })
                if (response.ok) {
                    const data = await response.json()
                    setViews(data.count || 0)
                } else {
                    // Si falla el POST, intentar GET para obtener el count actual
                    const getResponse = await fetch(`/api/views/${slug}`)
                    if (getResponse.ok) {
                        const getData = await getResponse.json()
                        setViews(getData.count || 0)
                    }
                }
            } catch (err) {
                console.error('Error updating views:', err)
                // Fallback: usar localStorage para tracking local
                const localKey = `views-${slug}`
                const localViews = parseInt(localStorage.getItem(localKey) || '0', 10)
                const newViews = localViews + 1
                localStorage.setItem(localKey, newViews.toString())
                setViews(newViews)
                setError('Tracking local - API no disponible')
            } finally {
                setLoading(false)
            }
        }
        updateViews()
    }, [slug])
    const formatViewCount = (count: number): string => {
        if (count < 1000) {
            return count.toString()
        } else if (count < 1000000) {
            return `${(count / 1000).toFixed(1)}K`
        } else {
            return `${(count / 1000000).toFixed(1)}M`
        }
    }
    const getViewText = (count: number): string => {
        if (count === 0) return 'Sin vistas'
        if (count === 1) return '1 vista'
        return `${count} vistas`
    }
    if (loading) {
        return (
            <div className={`view-counter loading ${className}`}>
                <Eye className="eye-icon animate-pulse" />
                <span className="count">--</span>
            </div>
        )
    }
    if (error) {
        return (
            <div className={`view-counter ${className}`} title="Vista counter con tracking local">
                <EyeOff className="eye-icon text-muted-foreground" />
                <span className="count text-muted-foreground">
                    {formatViewCount(views)}
                </span>
            </div>
        )
    }
    return (
        <div
            className={`view-counter ${className}`}
            title={getViewText(views)}
        >
            <Eye className="eye-icon" />
            <span className="count">{formatViewCount(views)}</span>
            {views < 10 && (
                <span className="sr-only">{getViewText(views)}</span>
            )}
        </div>
    )
}
// Hook para usar en componentes que necesitan acceso directo al count
export const useViewCount = (slug: string) => {
    const [viewCount, setViewCount] = useState<number>(0)
    const [loading, setLoading] = useState(true)
    useEffect(() => {
        const getViewCount = async () => {
            try {
                const response = await fetch(`/api/views/${slug}`)
                if (response.ok) {
                    const data = await response.json()
                    setViewCount(data.count || 0)
                }
            } catch (err) {
                console.error('Error getting view count:', err)
                // Fallback a localStorage
                const localKey = `views-${slug}`
                const localViews = parseInt(localStorage.getItem(localKey) || '0', 10)
                setViewCount(localViews)
            } finally {
                setLoading(false)
            }
        }
        if (slug) {
            getViewCount()
        }
    }, [slug])
    return { viewCount, loading }
}
