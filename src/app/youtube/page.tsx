import { Youtube, Play, Users, TrendingUp } from 'lucide-react'
import ModernLayout from '@/components/ModernLayout'

export const metadata = {
  title: 'Canal de YouTube | Blog de Ethical Hacking',
  description: 'Suscríbete a nuestro canal de YouTube para tutoriales en video de ethical hacking y ciberseguridad'
}

const YouTubePage = () => {
  const videos = [
    { id: '1', title: 'Introducción al Ethical Hacking', views: '1.2K', duration: '15:30', thumbnail: '/images/thumb1.jpg' },
    { id: '2', title: 'Nmap: Masterclass Completa', views: '2.5K', duration: '28:45', thumbnail: '/images/thumb2.jpg' },
    { id: '3', title: 'SQL Injection en Profundidad', views: '3.1K', duration: '42:12', thumbnail: '/images/thumb3.jpg' },
  ]

  return (
    <ModernLayout>
      <div className="min-h-screen bg-black text-white py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <div className="flex items-center justify-center space-x-3 mb-6">
              <Youtube className="h-12 w-12 text-red-500" />
              <h1 className="text-5xl font-bold bg-gradient-to-r from-red-400 to-red-600 bg-clip-text text-transparent">
                Canal de YouTube
              </h1>
            </div>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              Suscríbete para recibir los últimos tutoriales de ciberseguridad y ethical hacking en video
            </p>
          </div>

          {/* Estadísticas del canal */}
          <div className="grid md:grid-cols-3 gap-6 mb-12">
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <Users className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">1.5K</h3>
              <p className="text-gray-300">Suscriptores</p>
            </div>
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <Play className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">25</h3>
              <p className="text-gray-300">Videos</p>
            </div>
            <div className="bg-gray-900 rounded-xl p-6 text-center">
              <TrendingUp className="h-8 w-8 text-cyan-400 mx-auto mb-3" />
              <h3 className="text-2xl font-bold text-white">15.8K</h3>
              <p className="text-gray-300">Visualizaciones</p>
            </div>
          </div>

          {/* Video embebido */}
          <div className="bg-gray-900 rounded-2xl p-8 mb-12">
            <h2 className="text-3xl font-bold text-cyan-400 mb-6">Último Video</h2>
            <div className="aspect-video bg-black rounded-lg mb-4 flex items-center justify-center">
              <div className="text-center">
                <Play className="h-16 w-16 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-400">Video no disponible</p>
                <p className="text-sm text-gray-500 mt-2">Configura NEXT_PUBLIC_YOUTUBE_ID en Vercel</p>
              </div>
            </div>
          </div>

          {/* Lista de videos */}
          <div>
            <h2 className="text-3xl font-bold text-cyan-400 mb-8">Últimos Videos</h2>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
              {videos.map((video) => (
                <div key={video.id} className="bg-gray-900 rounded-xl overflow-hidden hover:bg-gray-800 transition-colors">
                  <div className="aspect-video bg-gray-800 flex items-center justify-center">
                    <Play className="h-12 w-12 text-gray-400" />
                  </div>
                  <div className="p-4">
                    <h3 className="font-semibold text-white mb-2">{video.title}</h3>
                    <div className="flex justify-between text-sm text-gray-400">
                      <span>{video.views} vistas</span>
                      <span>{video.duration}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Call to action */}
          <div className="text-center mt-12">
            <a 
              href={`https://youtube.com/channel/${process.env.NEXT_PUBLIC_YOUTUBE_CHANNEL_ID}`}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center space-x-2 bg-red-600 hover:bg-red-700 text-white font-semibold py-3 px-6 rounded-lg transition-colors"
            >
              <Youtube className="h-5 w-5" />
              <span>Suscribirse al Canal</span>
            </a>
          </div>
        </div>
      </div>
    </ModernLayout>
  )
}

export default YouTubePage
