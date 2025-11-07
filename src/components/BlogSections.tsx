'use client'
import React, { useState } from 'react'
import { GraduationCap, Mail, Youtube, Send, ExternalLink, BookOpen, Video, Phone } from 'lucide-react'
import Link from 'next/link'
interface Course {
    id: string
    title: string
    description: string
    level: 'Principiante' | 'Intermedio' | 'Avanzado'
    duration: string
    price: string
    image?: string
    tags: string[]
}
interface YouTubeVideo {
    id: string
    title: string
    description: string
    thumbnail: string
    duration: string
    views: string
    publishedAt: string
}
export default function BlogSections() {
    const [activeSection, setActiveSection] = useState<'cursos' | 'contacto' | 'youtube'>('cursos')
    const [contactForm, setContactForm] = useState({
        name: '',
        email: '',
        subject: '',
        message: ''
    })
    // Datos de ejemplo - reemplazar con datos reales
    const courses: Course[] = [
        {
            id: '1',
            title: 'Hacking Ético Fundamentos',
            description: 'Introducción completa al hacking ético y pentesting con herramientas profesionales.',
            level: 'Principiante',
            duration: '8 semanas',
            price: '€299',
            tags: ['Kali Linux', 'Nmap', 'Metasploit', 'Burp Suite']
        },
        {
            id: '2',
            title: 'Web Application Security',
            description: 'Técnicas avanzadas para encontrar y explotar vulnerabilidades en aplicaciones web.',
            level: 'Intermedio',
            duration: '12 semanas',
            price: '€499',
            tags: ['SQLi', 'XSS', 'CSRF', 'OWASP Top 10']
        },
        {
            id: '3',
            title: 'Red Team Operations',
            description: 'Metodologías avanzadas de red teaming y evasión de detección.',
            level: 'Avanzado',
            duration: '16 semanas',
            price: '€799',
            tags: ['C2 Frameworks', 'Living off the Land', 'Evasión']
        }
    ]
    const youtubeVideos: YouTubeVideo[] = [
        {
            id: '1',
            title: 'Configuración de laboratorio de pentesting',
            description: 'Aprende a configurar un entorno completo para practicar hacking ético',
            thumbnail: '/api/placeholder/300/200',
            duration: '15:32',
            views: '12.5K',
            publishedAt: '2025-01-10'
        },
        {
            id: '2',
            title: 'Análisis de vulnerabilidades con Nmap',
            description: 'Técnicas avanzadas de reconocimiento y escaneo de redes',
            thumbnail: '/api/placeholder/300/200',
            duration: '22:45',
            views: '8.9K',
            publishedAt: '2025-01-08'
        },
        {
            id: '3',
            title: 'SQL Injection: De básico a avanzado',
            description: 'Exploración completa de vulnerabilidades SQL con casos prácticos',
            thumbnail: '/api/placeholder/300/200',
            duration: '28:17',
            views: '15.2K',
            publishedAt: '2025-01-05'
        }
    ]
    const handleContactSubmit = async (e: React.FormEvent) => {
        e.preventDefault()
        // Aquí iría la lógica para enviar el formulario
        console.log('Form submitted:', contactForm)
        alert('¡Mensaje enviado! Te contactaremos pronto.')
        setContactForm({ name: '', email: '', subject: '', message: '' })
    }
    const getLevelColor = (level: Course['level']) => {
        switch (level) {
            case 'Principiante': return 'bg-green-100 text-green-800 border-green-200'
            case 'Intermedio': return 'bg-yellow-100 text-yellow-800 border-yellow-200'
            case 'Avanzado': return 'bg-red-100 text-red-800 border-red-200'
            default: return 'bg-gray-100 text-gray-800 border-gray-200'
        }
    }
    return (
        <div className="max-w-6xl mx-auto py-16">
            {/* Navigation Tabs */}
            <div className="flex flex-wrap justify-center mb-12 bg-background/50 backdrop-blur-sm rounded-lg p-2">
                <button
                    onClick={() => setActiveSection('cursos')}
                    className={`flex items-center px-6 py-3 rounded-md font-medium transition-all ${activeSection === 'cursos'
                            ? 'bg-primary text-primary-foreground shadow-md'
                            : 'text-muted-foreground hover:text-foreground hover:bg-accent'
                        }`}
                >
                    <GraduationCap className="w-5 h-5 mr-2" />
                    Cursos
                </button>
                <button
                    onClick={() => setActiveSection('contacto')}
                    className={`flex items-center px-6 py-3 rounded-md font-medium transition-all ${activeSection === 'contacto'
                            ? 'bg-primary text-primary-foreground shadow-md'
                            : 'text-muted-foreground hover:text-foreground hover:bg-accent'
                        }`}
                >
                    <Mail className="w-5 h-5 mr-2" />
                    Contacto
                </button>
                <button
                    onClick={() => setActiveSection('youtube')}
                    className={`flex items-center px-6 py-3 rounded-md font-medium transition-all ${activeSection === 'youtube'
                            ? 'bg-primary text-primary-foreground shadow-md'
                            : 'text-muted-foreground hover:text-foreground hover:bg-accent'
                        }`}
                >
                    <Youtube className="w-5 h-5 mr-2" />
                    YouTube
                </button>
            </div>
            {/* Content Sections */}
            <div className="min-h-[600px]">
                {/* Cursos Section */}
                {activeSection === 'cursos' && (
                    <div className="space-y-8">
                        <div className="text-center mb-12">
                            <h2 className="text-3xl font-bold mb-4 flex items-center justify-center">
                                <BookOpen className="w-8 h-8 mr-3 text-primary" />
                                Cursos de Ciberseguridad
                            </h2>
                            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
                                Desarrolla tus habilidades en hacking ético y pentesting con nuestros cursos profesionales
                            </p>
                        </div>
                        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
                            {courses.map((course) => (
                                <div key={course.id} className="card-modern p-6 hover-scale">
                                    <div className="flex items-center justify-between mb-4">
                                        <span className={`px-3 py-1 rounded-full text-xs font-medium border ${getLevelColor(course.level)}`}>
                                            {course.level}
                                        </span>
                                        <div className="text-right">
                                            <div className="text-2xl font-bold text-primary">{course.price}</div>
                                            <div className="text-sm text-muted-foreground">{course.duration}</div>
                                        </div>
                                    </div>
                                    <h3 className="text-xl font-bold mb-3">{course.title}</h3>
                                    <p className="text-muted-foreground mb-4 leading-relaxed">{course.description}</p>
                                    <div className="flex flex-wrap gap-2 mb-6">
                                        {course.tags.map((tag) => (
                                            <span key={tag} className="px-2 py-1 bg-accent/20 text-accent text-xs rounded-md">
                                                {tag}
                                            </span>
                                        ))}
                                    </div>
                                    <button className="w-full bg-primary text-primary-foreground py-3 rounded-md font-medium hover:bg-primary/90 transition-colors flex items-center justify-center">
                                        Más información
                                        <ExternalLink className="w-4 h-4 ml-2" />
                                    </button>
                                </div>
                            ))}
                        </div>
                    </div>
                )}
                {/* Contacto Section */}
                {activeSection === 'contacto' && (
                    <div className="max-w-2xl mx-auto">
                        <div className="text-center mb-12">
                            <h2 className="text-3xl font-bold mb-4 flex items-center justify-center">
                                <Phone className="w-8 h-8 mr-3 text-primary" />
                                Contáctanos
                            </h2>
                            <p className="text-muted-foreground text-lg">
                                ¿Tienes preguntas sobre ciberseguridad o quieres colaborar? ¡Escríbenos!
                            </p>
                        </div>
                        <form onSubmit={handleContactSubmit} className="space-y-6">
                            <div className="grid gap-6 md:grid-cols-2">
                                <div>
                                    <label htmlFor="name" className="block text-sm font-medium mb-2">
                                        Nombre *
                                    </label>
                                    <input
                                        type="text"
                                        id="name"
                                        required
                                        value={contactForm.name}
                                        onChange={(e) => setContactForm({ ...contactForm, name: e.target.value })}
                                        className="w-full px-4 py-3 bg-background border border-border rounded-md focus:ring-2 focus:ring-primary focus:border-primary transition-colors"
                                        placeholder="Tu nombre completo"
                                    />
                                </div>
                                <div>
                                    <label htmlFor="email" className="block text-sm font-medium mb-2">
                                        Email *
                                    </label>
                                    <input
                                        type="email"
                                        id="email"
                                        required
                                        value={contactForm.email}
                                        onChange={(e) => setContactForm({ ...contactForm, email: e.target.value })}
                                        className="w-full px-4 py-3 bg-background border border-border rounded-md focus:ring-2 focus:ring-primary focus:border-primary transition-colors"
                                        placeholder="tu@email.com"
                                    />
                                </div>
                            </div>
                            <div>
                                <label htmlFor="subject" className="block text-sm font-medium mb-2">
                                    Asunto *
                                </label>
                                <input
                                    type="text"
                                    id="subject"
                                    required
                                    value={contactForm.subject}
                                    onChange={(e) => setContactForm({ ...contactForm, subject: e.target.value })}
                                    className="w-full px-4 py-3 bg-background border border-border rounded-md focus:ring-2 focus:ring-primary focus:border-primary transition-colors"
                                    placeholder="¿En qué podemos ayudarte?"
                                />
                            </div>
                            <div>
                                <label htmlFor="message" className="block text-sm font-medium mb-2">
                                    Mensaje *
                                </label>
                                <textarea
                                    id="message"
                                    required
                                    rows={6}
                                    value={contactForm.message}
                                    onChange={(e) => setContactForm({ ...contactForm, message: e.target.value })}
                                    className="w-full px-4 py-3 bg-background border border-border rounded-md focus:ring-2 focus:ring-primary focus:border-primary transition-colors resize-none"
                                    placeholder="Cuéntanos más detalles sobre tu consulta..."
                                />
                            </div>
                            <button
                                type="submit"
                                className="w-full bg-primary text-primary-foreground py-3 rounded-md font-medium hover:bg-primary/90 transition-colors flex items-center justify-center"
                            >
                                Enviar mensaje
                                <Send className="w-4 h-4 ml-2" />
                            </button>
                        </form>
                        <div className="mt-12 text-center">
                            <p className="text-muted-foreground mb-4">¿Prefieres contactarnos directamente?</p>
                            <div className="flex flex-wrap justify-center gap-4">
                                <a href="mailto:contacto@hackingblog.com" className="text-primary hover:underline">
                                    contacto@hackingblog.com
                                </a>
                                <a href="tel:+34123456789" className="text-primary hover:underline">
                                    +34 123 456 789
                                </a>
                            </div>
                        </div>
                    </div>
                )}
                {/* YouTube Section */}
                {activeSection === 'youtube' && (
                    <div className="space-y-8">
                        <div className="text-center mb-12">
                            <h2 className="text-3xl font-bold mb-4 flex items-center justify-center">
                                <Video className="w-8 h-8 mr-3 text-primary" />
                                Canal de YouTube
                            </h2>
                            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
                                Tutoriales en video sobre técnicas de pentesting y ciberseguridad
                            </p>
                        </div>
                        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
                            {youtubeVideos.map((video) => (
                                <div key={video.id} className="card-modern overflow-hidden hover-scale">
                                    <div className="aspect-video bg-muted relative group cursor-pointer">
                                        <div className="absolute inset-0 bg-black/20 flex items-center justify-center group-hover:bg-black/40 transition-colors">
                                            <div className="w-16 h-16 bg-red-600 rounded-full flex items-center justify-center group-hover:scale-110 transition-transform">
                                                <Youtube className="w-8 h-8 text-white ml-1" />
                                            </div>
                                        </div>
                                        <div className="absolute bottom-2 right-2 bg-black/80 text-white px-2 py-1 rounded text-sm">
                                            {video.duration}
                                        </div>
                                    </div>
                                    <div className="p-6">
                                        <h3 className="text-lg font-bold mb-2 line-clamp-2">{video.title}</h3>
                                        <p className="text-muted-foreground mb-4 line-clamp-2">{video.description}</p>
                                        <div className="flex items-center justify-between text-sm text-muted-foreground">
                                            <span>{video.views} vistas</span>
                                            <span>{new Date(video.publishedAt).toLocaleDateString('es-ES')}</span>
                                        </div>
                                        <Link
                                            href={`https://youtube.com/watch?v=${video.id}`}
                                            target="_blank"
                                            className="block w-full mt-4 bg-red-600 text-white text-center py-2 rounded-md font-medium hover:bg-red-700 transition-colors"
                                        >
                                            Ver en YouTube
                                        </Link>
                                    </div>
                                </div>
                            ))}
                        </div>
                        <div className="text-center">
                            <Link
                                href="https://youtube.com/@hackingblog"
                                target="_blank"
                                className="inline-flex items-center bg-red-600 text-white px-8 py-3 rounded-md font-medium hover:bg-red-700 transition-colors"
                            >
                                <Youtube className="w-5 h-5 mr-2" />
                                Ver todos los videos
                                <ExternalLink className="w-4 h-4 ml-2" />
                            </Link>
                        </div>
                    </div>
                )}
            </div>
        </div>
    )
}
