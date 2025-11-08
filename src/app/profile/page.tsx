import { User, BookOpen, Award, TrendingUp, Settings, Bell } from 'lucide-react'
import ModernLayout from '@/components/ModernLayout'

export const metadata = {
  title: 'Mi Perfil | Blog de Ethical Hacking',
  description: 'Gestiona tu perfil, progreso de cursos y configuraciones'
}

const ProfilePage = () => {
  const progress = 65
  const completedCourses = 3
  const totalCourses = 6
  const currentStreak = 7

  const achievements = [
    { title: 'Primera Vulnerabilidad', description: 'Encontraste tu primera vulnerabilidad', icon: '🐛' },
    { title: 'Pentester Principiante', description: 'Completaste 3 ejercicios básicos', icon: '🛡️' },
    { title: 'Analista Forense', description: 'Completaste el curso de Forense Digital', icon: '🔍' },
  ]

  const recentActivity = [
    { action: 'Completó el módulo', item: 'Nmap: Escaneo de Puertos', time: 'Hace 2 horas' },
    { action: 'Comenzó el curso', item: 'Web Security: SQL Injection', time: 'Hace 1 día' },
    { action: 'Completó el ejercicio', item: 'Configuración de Burp Suite', time: 'Hace 3 días' },
  ]

  return (
    <ModernLayout>
      <div className="min-h-screen bg-black text-white py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-12">
            <h1 className="text-5xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent mb-6">
              Mi Perfil
            </h1>
            <p className="text-xl text-gray-300">Gestiona tu progreso y configuraciones</p>
          </div>

          <div className="grid lg:grid-cols-3 gap-8">
            {/* Perfil principal */}
            <div className="lg:col-span-2 space-y-8">
              {/* Información del usuario */}
              <div className="bg-gray-900 rounded-2xl p-6">
                <div className="flex items-center space-x-6">
                  <div className="w-20 h-20 bg-gradient-to-br from-cyan-500 to-blue-600 rounded-full flex items-center justify-center">
                    <User className="h-10 w-10 text-white" />
                  </div>
                  <div>
                    <h2 className="text-2xl font-bold text-white">Hacker Ético</h2>
                    <p className="text-gray-300">Pentester en formación</p>
                    <div className="flex items-center space-x-2 mt-2">
                      <span className="text-sm text-gray-400">Racha actual:</span>
                      <span className="text-cyan-400 font-semibold">{currentStreak} días</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Progreso general */}
              <div className="bg-gray-900 rounded-2xl p-6">
                <h3 className="text-xl font-bold text-cyan-400 mb-4">Progreso General</h3>
                <div className="mb-4">
                  <div className="flex justify-between text-sm text-gray-300 mb-2">
                    <span>Completado: {completedCourses}/{totalCourses} cursos</span>
                    <span>{progress}%</span>
                  </div>
                  <div className="w-full bg-gray-800 rounded-full h-3">
                    <div 
                      className="bg-gradient-to-r from-cyan-500 to-blue-500 h-3 rounded-full transition-all duration-300"
                      style={{ width: `${progress}%` }}
                    ></div>
                  </div>
                </div>
                <div className="grid md:grid-cols-3 gap-4">
                  <div className="text-center">
                    <BookOpen className="h-6 w-6 text-cyan-400 mx-auto mb-2" />
                    <p className="text-2xl font-bold text-white">{completedCourses}</p>
                    <p className="text-sm text-gray-300">Cursos Completados</p>
                  </div>
                  <div className="text-center">
                    <TrendingUp className="h-6 w-6 text-cyan-400 mx-auto mb-2" />
                    <p className="text-2xl font-bold text-white">{currentStreak}</p>
                    <p className="text-sm text-gray-300">Días de Racha</p>
                  </div>
                  <div className="text-center">
                    <Award className="h-6 w-6 text-cyan-400 mx-auto mb-2" />
                    <p className="text-2xl font-bold text-white">{achievements.length}</p>
                    <p className="text-sm text-gray-300">Logros</p>
                  </div>
                </div>
              </div>

              {/* Logros recientes */}
              <div className="bg-gray-900 rounded-2xl p-6">
                <h3 className="text-xl font-bold text-cyan-400 mb-4">Logros Recientes</h3>
                <div className="space-y-4">
                  {achievements.map((achievement, index) => (
                    <div key={index} className="flex items-center space-x-4 p-4 bg-gray-800 rounded-lg">
                      <span className="text-3xl">{achievement.icon}</span>
                      <div>
                        <h4 className="font-semibold text-white">{achievement.title}</h4>
                        <p className="text-sm text-gray-300">{achievement.description}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* Sidebar */}
            <div className="space-y-6">
              {/* Actividad reciente */}
              <div className="bg-gray-900 rounded-2xl p-6">
                <h3 className="text-lg font-bold text-cyan-400 mb-4">Actividad Reciente</h3>
                <div className="space-y-3">
                  {recentActivity.map((activity, index) => (
                    <div key={index} className="border-l-2 border-cyan-400 pl-4">
                      <p className="text-sm text-white">{activity.action}</p>
                      <p className="text-sm text-gray-300">{activity.item}</p>
                      <p className="text-xs text-gray-500">{activity.time}</p>
                    </div>
                  ))}
                </div>
              </div>

              {/* Configuraciones */}
              <div className="bg-gray-900 rounded-2xl p-6">
                <h3 className="text-lg font-bold text-cyan-400 mb-4">Configuraciones</h3>
                <div className="space-y-3">
                  <button className="w-full flex items-center space-x-3 p-3 text-left hover:bg-gray-800 rounded-lg transition-colors">
                    <Settings className="h-5 w-5 text-gray-400" />
                    <span>Configuración de Cuenta</span>
                  </button>
                  <button className="w-full flex items-center space-x-3 p-3 text-left hover:bg-gray-800 rounded-lg transition-colors">
                    <Bell className="h-5 w-5 text-gray-400" />
                    <span>Notificaciones</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </ModernLayout>
  )
}

export default ProfilePage
