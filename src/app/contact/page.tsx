import { Mail, Phone, MapPin, Clock, Send, MessageCircle } from 'lucide-react'
import Link from 'next/link'
import ModernLayout from '@/components/ModernLayout'

export const metadata = {
  title: 'Contacto | Blog de Ethical Hacking',
  description: 'Contacta conmigo para consultas, colaboraciones o proyectos de ciberseguridad'
}

const ContactPage = () => {
  return (
    <ModernLayout>
      <div className="min-h-screen bg-black text-white py-16">
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h1 className="text-5xl font-bold bg-gradient-to-r from-cyan-400 to-blue-500 bg-clip-text text-transparent mb-6">
              Contacto
            </h1>
            <p className="text-xl text-gray-300 max-w-3xl mx-auto">
              ¿Tienes una pregunta, proyecto de ciberseguridad, o quieres colaborar? 
              Estoy aquí para ayudarte.
            </p>
          </div>

          <div className="grid lg:grid-cols-2 gap-12">
            {/* Información de contacto */}
            <div className="space-y-8">
              <div>
                <h2 className="text-3xl font-bold text-cyan-400 mb-8">Información de Contacto</h2>
                
                <div className="space-y-6">
                  <div className="flex items-center space-x-4 p-4 bg-gray-900 rounded-lg">
                    <Mail className="h-6 w-6 text-cyan-400" />
                    <div>
                      <h3 className="font-semibold">Email</h3>
                      <p className="text-gray-300">hacking@cybersec.edu</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center space-x-4 p-4 bg-gray-900 rounded-lg">
                    <Phone className="h-6 w-6 text-cyan-400" />
                    <div>
                      <h3 className="font-semibold">Teléfono</h3>
                      <p className="text-gray-300">+1 (555) 123-4567</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center space-x-4 p-4 bg-gray-900 rounded-lg">
                    <MapPin className="h-6 w-6 text-cyan-400" />
                    <div>
                      <h3 className="font-semibold">Ubicación</h3>
                      <p className="text-gray-300">Madrid, España</p>
                    </div>
                  </div>
                  
                  <div className="flex items-center space-x-4 p-4 bg-gray-900 rounded-lg">
                    <Clock className="h-6 w-6 text-cyan-400" />
                    <div>
                      <h3 className="font-semibold">Horario</h3>
                      <p className="text-gray-300">Lun - Vie: 9:00 - 18:00</p>
                    </div>
                  </div>
                </div>
              </div>

              <div>
                <h3 className="text-2xl font-bold text-cyan-400 mb-4">Redes Sociales</h3>
                <div className="flex space-x-4">
                  <Link href="#" className="p-3 bg-gray-900 rounded-lg hover:bg-gray-800 transition-colors">
                    <MessageCircle className="h-6 w-6 text-cyan-400" />
                  </Link>
                </div>
              </div>
            </div>

            {/* Formulario de contacto */}
            <div className="bg-gray-900 rounded-2xl p-8">
              <h2 className="text-3xl font-bold text-cyan-400 mb-8">Envíame un mensaje</h2>
              
              <form className="space-y-6">
                <div className="grid md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium mb-2">Nombre</label>
                    <input
                      type="text"
                      className="w-full px-4 py-3 bg-black border border-gray-700 rounded-lg focus:border-cyan-400 focus:outline-none"
                      placeholder="Tu nombre"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium mb-2">Email</label>
                    <input
                      type="email"
                      className="w-full px-4 py-3 bg-black border border-gray-700 rounded-lg focus:border-cyan-400 focus:outline-none"
                      placeholder="tu@email.com"
                    />
                  </div>
                </div>
                
                <div>
                  <label className="block text-sm font-medium mb-2">Asunto</label>
                  <input
                    type="text"
                    className="w-full px-4 py-3 bg-black border border-gray-700 rounded-lg focus:border-cyan-400 focus:outline-none"
                    placeholder="¿En qué puedo ayudarte?"
                  />
                </div>
                
                <div>
                  <label className="block text-sm font-medium mb-2">Mensaje</label>
                  <textarea
                    rows={6}
                    className="w-full px-4 py-3 bg-black border border-gray-700 rounded-lg focus:border-cyan-400 focus:outline-none"
                    placeholder="Escribe tu mensaje aquí..."
                  ></textarea>
                </div>
                
                <button
                  type="submit"
                  className="w-full bg-gradient-to-r from-cyan-500 to-blue-500 text-white font-semibold py-3 px-6 rounded-lg hover:from-cyan-600 hover:to-blue-600 transition-all duration-200 flex items-center justify-center space-x-2"
                >
                  <Send className="h-5 w-5" />
                  <span>Enviar Mensaje</span>
                </button>
              </form>
            </div>
          </div>

          {/* FAQ Section */}
          <div className="mt-20">
            <h2 className="text-3xl font-bold text-cyan-400 mb-8 text-center">Preguntas Frecuentes</h2>
            <div className="grid md:grid-cols-2 gap-8">
              <div className="bg-gray-900 rounded-lg p-6">
                <h3 className="text-xl font-semibold text-cyan-400 mb-3">¿Ofreces consultoría en ciberseguridad?</h3>
                <p className="text-gray-300">Sí, ofrezco servicios de consultoría especializada en pentesting, auditorías de seguridad y desarrollo de políticas de ciberseguridad.</p>
              </div>
              <div className="bg-gray-900 rounded-lg p-6">
                <h3 className="text-xl font-semibold text-cyan-400 mb-3">¿Los artículos son gratuitos?</h3>
                <p className="text-gray-300">Absolutamente. Todos los tutoriales y artículos de ciberseguridad son completamente gratuitos y de código abierto.</p>
              </div>
              <div className="bg-gray-900 rounded-lg p-6">
                <h3 className="text-xl font-semibold text-cyan-400 mb-3">¿Puedo solicitar un tema específico?</h3>
                <p className="text-gray-300">¡Por supuesto! Envíame tu propuesta y consideraré incluirla en próximos artículos o tutoriales.</p>
              </div>
              <div className="bg-gray-900 rounded-lg p-6">
                <h3 className="text-xl font-semibold text-cyan-400 mb-3">¿Colaboras con otros profesionales?</h3>
                <p className="text-gray-300">Sí, estoy abierto a colaboraciones con otros profesionales de ciberseguridad y investigación.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </ModernLayout>
  )
}

export default ContactPage
