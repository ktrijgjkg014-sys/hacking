# Blog de Ethical Hacking - Versión Modernizada

## 🚀 Características

- **Diseño Moderno**: Interfaz oscura con acentos cian/azul
- **Funcionalidades Completas**: Contacto, búsqueda, YouTube, cursos, perfil
- **Vercel Ready**: Configuración optimizada para deployment
- **TypeScript**: Tipado completo y seguro
- **Responsive**: Compatible con todos los dispositivos
- **SEO Optimizado**: Meta tags, Open Graph, Schema.org

## 📁 Estructura

```
src/
├── app/
│   ├── page.tsx                 # Página principal
│   ├── layout.tsx               # Layout principal
│   ├── contact/
│   │   └── page.tsx            # Página de contacto
│   ├── search/
│   │   └── page.tsx            # Búsqueda avanzada
│   ├── youtube/
│   │   └── page.tsx            # Canal de YouTube
│   ├── courses/
│   │   ├── page.tsx            # Lista de cursos
│   │   └── [id]/
│   │       └── page.tsx        # Detalle de curso
│   ├── profile/
│   │   └── page.tsx            # Perfil de usuario
│   └── api/
│       └── views/
│           └── [slug]/
│               └── route.ts     # API de vistas
├── components/
│   ├── ModernLayout.tsx        # Layout moderno
│   ├── CopyCodeBlock.tsx       # Bloque de código copiable
│   └── ViewCounter.tsx         # Contador de vistas
├── content/articles/            # Artículos en markdown
└── types/                       # Definiciones de TypeScript
```

## 🛠️ Instalación

1. **Clonar repositorio**
```bash
git clone https://github.com/ktrijgjkg014-sys/hacking.git
cd hacking
```

2. **Instalar dependencias**
```bash
bun install
```

3. **Configurar variables de entorno**
```bash
cp .env.example .env.local
# Edita .env.local con tus configuraciones
```

4. **Ejecutar en desarrollo**
```bash
bun run dev
```

5. **Build para producción**
```bash
bun run build
bun run start
```

## 📦 Deployment en Vercel

1. **Conectar repositorio**
   - Ve a [Vercel](https://vercel.com)
   - Importa tu repositorio de GitHub
   - Selecciona el framework "Next.js"

2. **Configurar variables de entorno**
   - `NEXT_PUBLIC_SITE_URL`: Tu dominio de Vercel
   - `NEXT_PUBLIC_YOUTUBE_CHANNEL_ID`: ID de tu canal de YouTube
   - Otras variables según necesidad

3. **Deploy**
   - Vercel detectará automáticamente Next.js
   - Usará `bun install` para dependencias
   - Deployment automático en cada push

## 🎨 Características Implementadas

### ✅ Correcciones
- Layout metadata corregido para Vercel
- JSON-LD estructurado correctamente
- Todas las rutas funcionales
- TypeScript sin errores

### ✅ Nuevas Páginas
- **Contacto**: Formulario funcional, información de contacto, FAQ
- **Búsqueda**: Filtros avanzados, búsqueda en tiempo real
- **YouTube**: Videos embebidos, estadísticas del canal
- **Cursos**: 6 cursos completos, progreso de usuario
- **Perfil**: Dashboard de usuario, logros, actividad

### ✅ Mejoras Técnicas
- Bundler optimizado con Bun
- Configuración Vercel completa
- Headers de seguridad
- SEO mejorado
- Performance optimizado

## 🛡️ Configuración de Seguridad

El proyecto incluye headers de seguridad automáticos:
- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY
- X-XSS-Protection: 1; mode=block
- Referrer-Policy: strict-origin-when-cross-origin

## 📊 Monitoreo

Configura analytics en `.env.local`:
- Google Analytics: `NEXT_PUBLIC_GA_ID`
- Plausible: `NEXT_PUBLIC_PLAUSIBLE_DOMAIN`

## 🔧 Personalización

1. **Colores**: Modifica `tailwind.config.ts`
2. **Contenido**: Edita archivos en `src/content/articles/`
3. **Componentes**: Personaliza en `src/components/`
4. **Estilos**: Modifica `src/app/globals.css`

## 📞 Soporte

Si encuentras problemas:

1. Verifica la configuración de variables de entorno
2. Ejecuta `bun run dev` para desarrollo local
3. Revisa la consola del navegador para errores
4. Consulta la documentación de [Next.js](https://nextjs.org)

## 📄 Licencia

Este proyecto está bajo licencia MIT. Puedes usar, modificar y distribuir libremente.

---

**Desarrollado por MiniMax Agent** 🤖
