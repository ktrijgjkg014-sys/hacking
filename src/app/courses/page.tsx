import { BookOpen, Users, Clock, Star, Play, CheckCircle } from 'lucide-react'
import ModernLayout from '@/components/ModernLayout'
import Link from 'next/link'

export const metadata = {
  title: 'Cursos | Blog de Ethical Hacking',
  description: 'Aprende ciberseguridad con nuestros cursos completos de ethical hacking y pentesting'
}

const CoursesPage = () => {
  const courses = [
    {
      id: 'network-pentesting',
      title: 'Network Pentesting',
      description: 'Domina las técnicas de pentesting en redes con herramientas profesionales',
      level: 'Intermedio',
      duration: '40 horas',
      students: 234,
      rating: 4.8,
      modules: 8,
      price: 'Gratuito',
      image: '/images/course-network.jpg'
    },
    {
      id: 'web-security',
      title: 'Web Security',
      description: 'Aprende a identificar y explotar vulnerabilidades en aplicaciones web',
      level: 'Avanzado',
      duration: '60 horas',
      students: 189,
      rating: 4.9,
      modules: 12,
      price: 'Gratuito',
      image: '/images/course-web.jpg'
    },
    {
      id: 'social-engineering',
      title: 'Social Engineering',
      description: 'Técnicas avanzadas de ingeniería social y conciencia de seguridad',
      level: 'Básico',
      duration: '20 horas',
      students: 156,
      rating: 4.6,
      modules: 5,
      price: 'Gratuito',
      image: '/images/course-social.jpg'
    },
    {
      id: 'malware-analysis',
      title: 'Malware Analysis',
      description: 'Análisis forense de malware y técnicas de ingeniería inversa',
      level: 'Avanzado',
      duration: '50 horas',
      students: 98,
      rating: 4.7,
      modules: 10,
      price: 'Gratuito',
      image: '/images/course-malware.jpg'
    },
    {
      id: 'digital-forensics',
      title: 'Digital Forensics',
      description: 'Investigación forense digital y análisis de evidencias',
      level: 'Intermedio',
      duration: '35 horas',
      students: 145,
      rating: 4.5,
      modules: 7,
      price: 'Gratuito',
      image: '/images/course-forensics.jpg'
    },
    {
      id: 'incident-response',
      title: 'Incident Response',
      description: 'Gestión de incidentes de seguridad y respuesta ante ciberataques',
      level: 'Avanzado',
      duration: '45 horas',
      students: 78,
      rating: 4.8,
      modules: 9,
      price: 'Gratuito',
      image: '/images/course-incident.jpg'
    }
  ]

  return (
    <ModernLayout>
      <div className="min-h-screen bg-black text-white py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h1 className="text-5xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent mb-6">
              Academia de Ciberseguridad
            </h1>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              Cursos completos y gratuitos para convertirte en un profesional de la ciberseguridad
            </p>
          </div>

          {/* Estadísticas */}
          <div className="grid md:grid-cols-4 gap-6 mb-12">
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <BookOpen className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">6</h3>
              <p className="text-gray-300">Cursos</p>
            </div>
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <Users className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">900+</h3>
              <p className="text-gray-300">Estudiantes</p>
            </div>
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <Clock className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">250h</h3>
              <p className="text-gray-300">Contenido</p>
            </div>
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <Star className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">4.7</h3>
              <p className="text-gray-300">Rating</p>
            </div>
          </div>

          {/* Lista de cursos */}
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            {courses.map((course) => (
              <div key={course.id} className="bg-gray-900 rounded-xl overflow-hidden hover:bg-gray-800 transition-all duration-300 group">
                <div className="aspect-video bg-gradient-to-br from-cyan-500 to-blue-600 flex items-center justify-center">
                  <BookOpen className="h-16 w-16 text-white" />
                </div>
                <div className="p-6">
                  <div className="flex items-center justify-between mb-3">
                    <span className={`px-2 py-1 rounded-full text-xs font-semibold ${
                      course.level === 'Básico' ? 'bg-green-600 text-white' :
                      course.level === 'Intermedio' ? 'bg-yellow-600 text-white' :
                      'bg-red-600 text-white'
                    }`}>
                      {course.level}
                    </span>
                    <div className="flex items-center space-x-1">
                      <Star className="h-4 w-4 text-yellow-400 fill-current" />
                      <span className="text-sm text-gray-300">{course.rating}</span>
                    </div>
                  </div>
                  
                  <h3 className="text-xl font-bold text-white mb-3 group-hover:text-cyan-400 transition-colors">
                    {course.title}
                  </h3>
                  
                  <p className="text-gray-300 text-sm mb-4 line-clamp-2">
                    {course.description}
                  </p>
                  
                  <div className="space-y-2 mb-4">
                    <div className="flex items-center text-sm text-gray-400">
                      <Clock className="h-4 w-4 mr-2" />
                      {course.duration}
                    </div>
                    <div className="flex items-center text-sm text-gray-400">
                      <Users className="h-4 w-4 mr-2" />
                      {course.students} estudiantes
                    </div>
                    <div className="flex items-center text-sm text-gray-400">
                      <Play className="h-4 w-4 mr-2" />
                      {course.modules} módulos
                    </div>
                  </div>
                  
                  <div className="flex items-center justify-between">
                    <span className="text-cyan-400 font-semibold">{course.price}</span>
                    <Link 
                      href={`/courses/${course.id}`}
                      className="bg-cyan-600 hover:bg-cyan-700 text-white px-4 py-2 rounded-lg transition-colors"
                    >
                      Ver Curso
                    </Link>
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Call to action */}
          <div className="text-center mt-16">
            <h2 className="text-3xl font-bold text-cyan-400 mb-4">¿Listo para comenzar?</h2>
            <p className="text-gray-300 mb-8">Únete a cientos de estudiantes y comienza tu camino en la ciberseguridad</p>
            <div className="space-x-4">
              <Link 
                href="/courses/network-pentesting"
                className="inline-flex items-center space-x-2 bg-cyan-600 hover:bg-cyan-700 text-white font-semibold py-3 px-6 rounded-lg transition-colors"
              >
                <Play className="h-5 w-5" />
                <span>Empezar Ahora</span>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </ModernLayout>
  )
}

export default CoursesPage
