'use client'
import React, { useState } from 'react'
import Link from 'next/link'
import {
    Terminal,
    Home,
    BookOpen,
    Mail,
    Youtube,
    Menu,
    X,
    FileText,
    Search,
    User,
    Github,
    Linkedin,
    Twitter,
    Heart
} from 'lucide-react'
interface ModernLayoutProps {
    children: React.ReactNode
    title?: string
    description?: string
}
export default function ModernLayout({ children, title, description }: ModernLayoutProps) {
    const [isMenuOpen, setIsMenuOpen] = useState(false)
    const [isDark, setIsDark] = useState(true) // Por defecto modo oscuro
    const navigationItems = [
        { name: 'Inicio', href: '/', icon: Home },
        { name: 'Artículos', href: '/articles', icon: FileText },
        { name: 'Cursos', href: '/courses', icon: BookOpen },
        { name: 'Contacto', href: '/contact', icon: Mail },
        { name: 'YouTube', href: '/youtube', icon: Youtube }
    ]
    const isActive = (href: string) => {
        if (href === '/') {
            return typeof window !== 'undefined' && window.location.pathname === '/'
        }
        return typeof window !== 'undefined' && window.location.pathname.startsWith(href)
    }
    const currentYear = new Date().getFullYear()
    return (
        <div className={`min-h-screen bg-background text-foreground ${isDark ? 'dark' : ''}`}>
            {/* Navigation Header */}
            <nav className="sticky top-0 z-50 bg-background/95 backdrop-blur-sm border-b border-border">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between items-center h-16">
                        {/* Logo */}
                        <Link href="/" className="flex items-center space-x-3 group">
                            <div className="p-2 bg-primary/10 rounded-lg group-hover:bg-primary/20 transition-colors">
                                <Terminal className="w-6 h-6 text-primary glow-cyan" />
                            </div>
                            <div className="hidden sm:block">
                                <h1 className="text-lg font-bold text-foreground">
                                    Hacking Blog
                                </h1>
                                <p className="text-xs text-muted-foreground -mt-1">
                                    Ethical Hacking & Pentesting
                                </p>
                            </div>
                        </Link>
                        {/* Desktop Navigation */}
                        <div className="hidden md:flex items-center space-x-1">
                            {navigationItems.map((item) => {
                                const IconComponent = item.icon
                                return (
                                    <Link
                                        key={item.name}
                                        href={item.href}
                                        className={`
flex items-center px-4 py-2 rounded-lg text-sm font-medium transition-all
${isActive(item.href)
                                                ? 'bg-primary text-primary-foreground shadow-md'
                                                : 'text-muted-foreground hover:text-foreground hover:bg-accent'
                                            }
`}
                                    >
                                        <IconComponent className="w-4 h-4 mr-2" />
                                        {item.name}
                                    </Link>
                                )
                            })}
                        </div>
                        {/* Desktop Actions */}
                        <div className="hidden md:flex items-center space-x-3">
                            <Link
                                href="/search"
                                className="p-2 text-muted-foreground hover:text-foreground hover:bg-accent rounded-lg transition-colors"
                                title="Buscar"
                            >
                                <Search className="w-5 h-5" />
                            </Link>
                            <Link
                                href="/profile"
                                className="p-2 text-muted-foreground hover:text-foreground hover:bg-accent rounded-lg transition-colors"
                                title="Perfil"
                            >
                                <User className="w-5 h-5" />
                            </Link>
                        </div>
                        {/* Mobile menu button */}
                        <button
                            onClick={() => setIsMenuOpen(!isMenuOpen)}
                            className="md:hidden p-2 text-muted-foreground hover:text-foreground hover:bg-accent rounded-lg transition-colors"
                            aria-label="Toggle menu"
                        >
                            {isMenuOpen ? (
                                <X className="w-6 h-6" />
                            ) : (
                                <Menu className="w-6 h-6" />
                            )}
                        </button>
                    </div>
                </div>
                {/* Mobile Navigation Menu */}
                {isMenuOpen && (
                    <div className="md:hidden border-t border-border bg-background/98 backdrop-blur-sm">
                        <div className="px-4 py-3 space-y-1">
                            {navigationItems.map((item) => {
                                const IconComponent = item.icon
                                return (
                                    <Link
                                        key={item.name}
                                        href={item.href}
                                        onClick={() => setIsMenuOpen(false)}
                                        className={`
flex items-center px-3 py-3 rounded-lg text-sm font-medium transition-all
${isActive(item.href)
                                                ? 'bg-primary text-primary-foreground'
                                                : 'text-muted-foreground hover:text-foreground hover:bg-accent'
                                            }
`}
                                    >
                                        <IconComponent className="w-5 h-5 mr-3" />
                                        {item.name}
                                    </Link>
                                )
                            })}
                            {/* Mobile Actions */}
                            <div className="flex items-center space-x-1 pt-3 mt-3 border-t border-border">
                                <Link
                                    href="/search"
                                    onClick={() => setIsMenuOpen(false)}
                                    className="flex items-center px-3 py-2 text-sm text-muted-foreground hover:text-foreground hover:bg-accent rounded-lg transition-colors flex-1"
                                >
                                    <Search className="w-4 h-4 mr-3" />
                                    Buscar
                                </Link>
                                <Link
                                    href="/profile"
                                    onClick={() => setIsMenuOpen(false)}
                                    className="flex items-center px-3 py-2 text-sm text-muted-foreground hover:text-foreground hover:bg-accent rounded-lg transition-colors flex-1"
                                >
                                    <User className="w-4 h-4 mr-3" />
                                    Perfil
                                </Link>
                            </div>
                        </div>
                    </div>
                )}
            </nav>
            {/* Page Header (opcional) */}
            {title && (
                <div className="bg-gradient-to-r from-primary/5 to-accent/5 border-b border-border">
                    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                        <div className="text-center">
                            <h1 className="text-4xl font-bold mb-4 glow-cyan">{title}</h1>
                            {description && (
                                <p className="text-xl text-muted-foreground max-w-3xl mx-auto leading-relaxed">
                                    {description}
                                </p>
                            )}
                        </div>
                    </div>
                </div>
            )}
            {/* Main Content */}
            <main className="flex-1">
                {children}
            </main>
            {/* Footer */}
            <footer className="bg-card/50 border-t border-border mt-20">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
                    <div className="grid gap-8 md:grid-cols-4">
                        {/* Brand */}
                        <div className="md:col-span-2">
                            <div className="flex items-center space-x-3 mb-4">
                                <div className="p-2 bg-primary/10 rounded-lg">
                                    <Terminal className="w-6 h-6 text-primary" />
                                </div>
                                <div>
                                    <h3 className="text-lg font-bold">Hacking Blog</h3>
                                    <p className="text-sm text-muted-foreground">
                                        Ethical Hacking & Pentesting
                                    </p>
                                </div>
                            </div>
                            <p className="text-muted-foreground mb-4 max-w-md">
                                Blog dedicado al aprendizaje y práctica del hacking ético y pentesting.
                                Contenido educativo para profesionales de la ciberseguridad.
                            </p>
                            <div className="flex space-x-4">
                                <a href="#" className="text-muted-foreground hover:text-primary transition-colors">
                                    <Github className="w-5 h-5" />
                                </a>
                                <a href="#" className="text-muted-foreground hover:text-primary transition-colors">
                                    <Linkedin className="w-5 h-5" />
                                </a>
                                <a href="#" className="text-muted-foreground hover:text-primary transition-colors">
                                    <Twitter className="w-5 h-5" />
                                </a>
                            </div>
                        </div>
                        {/* Quick Links */}
                        <div>
                            <h4 className="font-semibold mb-4">Enlaces Rápidos</h4>
                            <ul className="space-y-2">
                                <li><Link href="/articles" className="text-muted-foreground hover:text-primary transition-colors">Artículos</Link></li>
                                <li><Link href="/courses" className="text-muted-foreground hover:text-primary transition-colors">Cursos</Link></li>
                                <li><Link href="/contact" className="text-muted-foreground hover:text-primary transition-colors">Contacto</Link></li>
                                <li><Link href="/youtube" className="text-muted-foreground hover:text-primary transition-colors">YouTube</Link></li>
                            </ul>
                        </div>
                        {/* Resources */}
                        <div>
                            <h4 className="font-semibold mb-4">Recursos</h4>
                            <ul className="space-y-2">
                                <li><Link href="/tools" className="text-muted-foreground hover:text-primary transition-colors">Herramientas</Link></li>
                                <li><Link href="/guides" className="text-muted-foreground hover:text-primary transition-colors">Guías</Link></li>
                                <li><Link href="/community" className="text-muted-foreground hover:text-primary transition-colors">Comunidad</Link></li>
                                <li><Link href="/newsletter" className="text-muted-foreground hover:text-primary transition-colors">Newsletter</Link></li>
                            </ul>
                        </div>
                    </div>
                    <div className="border-t border-border mt-8 pt-8 flex flex-col md:flex-row justify-between items-center">
                        <div className="flex items-center text-sm text-muted-foreground">
                            <span>© {currentYear} Hacking Blog. Todos los derechos reservados.</span>
                        </div>
                        <div className="flex items-center text-sm text-muted-foreground mt-4 md:mt-0">
                            <span>Hecho con</span>
                            <Heart className="w-4 h-4 mx-1 text-red-500" />
                            <span>para la comunidad de ciberseguridad</span>
                        </div>
                    </div>
                    <div className="mt-4 p-4 bg-yellow-500/10 border border-yellow-500/20 rounded-lg">
                        <p className="text-sm text-yellow-600 dark:text-yellow-400">
                            <strong>Disclaimer:</strong> Todo el contenido de este blog es únicamente para fines educativos
                            y de pentesting ético. Los lectores son responsables de usar esta información de manera legal y ética.
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    )
}
