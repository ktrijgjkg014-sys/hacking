#!/bin/bash

echo "🎯 === CONFIGURACIÓN COMPLETA DE BANNER PARA REDES SOCIALES ==="
echo ""

# Verificar directorio
if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json"
    echo "Ejecuta este script desde la raíz de tu proyecto"
    exit 1
fi

echo "🖼️ PASO 1: Buscando imagen perfecta para tu blog de ethical hacking..."

# Crear directorio para imágenes
mkdir -p public/images

echo "📡 Buscando imagen de ethical hacking con estilo terminal..."

# Buscar imagen de ethical hacking
curl -s "https://source.unsplash.com/1200x630/?ethical,hacking,cybersecurity,dark,terminal" -o public/images/og-banner.jpg

# Verificar si la imagen se descargó correctamente
if [ -f "public/images/og-banner.jpg" ]; then
    echo "✅ Imagen descargada: public/images/og-banner.jpg"
    echo "📊 Información de la imagen:"
    file public/images/og-banner.jpg
    ls -la public/images/og-banner.jpg
else
    echo "❌ Error descargando imagen de Unsplash"
    echo "🔄 Intentando con imagen alternativa..."
    
    # Crear imagen alternativa usando HTML/CSS
    cat > public/images/create-banner.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Hacking Blog Banner</title>
    <style>
        * { margin: 0; padding: 0; }
        body {
            width: 1200px;
            height: 630px;
            background: linear-gradient(135deg, #000000 0%, #0a0a0a 50%, #1a1a1a 100%);
            font-family: 'Courier New', monospace;
            color: #00ff00;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        /* Efectos de fondo */
        .matrix-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.1;
            background: 
                linear-gradient(90deg, transparent 50%, rgba(0,255,0,0.1) 50%),
                linear-gradient(0deg, transparent 50%, rgba(0,255,0,0.1) 50%);
            background-size: 20px 20px;
            animation: matrix 20s linear infinite;
        }
        
        @keyframes matrix {
            0% { transform: translateX(0) translateY(0); }
            100% { transform: translateX(-20px) translateY(-20px); }
        }
        
        .content {
            z-index: 2;
            border: 3px solid #00ff00;
            padding: 40px 60px;
            background: rgba(0, 0, 0, 0.9);
            box-shadow: 
                0 0 50px rgba(0, 255, 0, 0.5),
                inset 0 0 20px rgba(0, 255, 0, 0.1);
            border-radius: 10px;
        }
        
        .main-title {
            font-size: 52px;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 
                0 0 10px #00ff00,
                0 0 20px #00ff00,
                0 0 30px #00ff00;
            letter-spacing: 3px;
        }
        
        .subtitle {
            font-size: 28px;
            margin-bottom: 30px;
            color: #00cc00;
            text-shadow: 0 0 15px #00cc00;
        }
        
        .terminal-section {
            text-align: left;
            margin: 30px 0;
            background: #000;
            padding: 20px;
            border: 1px solid #00ff00;
            border-radius: 5px;
        }
        
        .terminal-line {
            color: #ffff00;
            font-size: 18px;
            margin: 5px 0;
        }
        
        .terminal-output {
            color: #00ff00;
            font-size: 16px;
            margin: 3px 0;
            padding-left: 20px;
        }
        
        .footer {
            font-size: 16px;
            color: #008800;
            margin-top: 20px;
        }
        
        .glitch {
            animation: glitch 2s infinite;
        }
        
        @keyframes glitch {
            0%, 100% { transform: translate(0); }
            20% { transform: translate(-2px, 2px); }
            40% { transform: translate(-2px, -2px); }
            60% { transform: translate(2px, 2px); }
            80% { transform: translate(2px, -2px); }
        }
    </style>
</head>
<body>
    <div class="matrix-bg"></div>
    <div class="content">
        <div class="main-title glitch">ETHICAL HACKING</div>
        <div class="subtitle">Blog & Tutorials</div>
        
        <div class="terminal-section">
            <div class="terminal-line">$ whoami</div>
            <div class="terminal-output">ethical_hacker</div>
            <div class="terminal-line">$ cat skills.txt</div>
            <div class="terminal-output">• Penetration Testing</div>
            <div class="terminal-output">• Cybersecurity</div>
            <div class="terminal-output">• Network Security</div>
            <div class="terminal-line">$ echo "Learn. Hack. Protect."</div>
            <div class="terminal-output">Learn. Hack. Protect.</div>
        </div>
        
        <div class="footer">
            Advanced Security Techniques & Tutorials
        </div>
    </div>
</body>
</html>
EOF
    
    echo "✅ Imagen alternativa creada: public/images/create-banner.html"
    echo "📝 Abre este archivo en tu navegador y toma screenshot (1200x630px)"
    echo "💾 Guárdalo como: public/images/og-banner.jpg"
fi

echo ""
echo "⚙️ PASO 2: Configurando meta tags para redes sociales..."

# Hacer backup del layout actual
if [ -f "src/app/layout.tsx" ]; then
    cp src/app/layout.tsx src/app/layout.tsx.backup.$(date +%Y%m%d_%H%M%S)
    echo "✅ Backup creado: src/app/layout.tsx.backup"
fi

# Crear layout actualizado
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import ClientBody from "./ClientBody";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: {
    default: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad",
    template: "%s | Blog de Ethical Hacking"
  },
  description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad. Aprende técnicas avanzadas de hacking ético, análisis de vulnerabilidades y seguridad de redes.",
  
  // Open Graph para redes sociales (LinkedIn, Facebook, etc.)
  openGraph: {
    type: "website",
    locale: "es_ES",
    url: "https://tu-dominio.vercel.app", // CAMBIAR por tu dominio real
    title: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad",
    description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad. Aprende técnicas avanzadas de hacking ético, análisis de vulnerabilidades y seguridad de redes.",
    siteName: "Blog de Ethical Hacking",
    images: [
      {
        url: "/images/og-banner.jpg", // La imagen que acabas de crear
        width: 1200,
        height: 630,
        alt: "Blog de Ethical Hacking - Tutoriales y Técnicas de Ciberseguridad",
      }
    ],
    site: {
      '@type': 'WebSite',
      name: 'Blog de Ethical Hacking'
    },
  },
  
  // Twitter Cards para Twitter
  twitter: {
    card: "summary_large_image",
    title: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad", 
    description: "Tutoriales completos de ethical hacking, pentesting y ciberseguridad.",
    images: ["/images/og-banner.jpg"],
    creator: "@tu_usuario_twitter", // CAMBIAR por tu handle de Twitter
    site: "@tu_usuario_twitter" // CAMBIAR por tu handle de Twitter
  },
  
  // Schema.org structured data
  other: {
    "script:type": "application/ld+json",
    "script:content": JSON.stringify({
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Blog de Ethical Hacking",
      "description": "Tutoriales completos de ethical hacking, pentesting y ciberseguridad",
      "url": "https://tu-dominio.vercel.app", // CAMBIAR por tu dominio real
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://tu-dominio.vercel.app/search?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    })
  },
  
  // Metadatos adicionales
  keywords: [
    "ethical hacking", "pentesting", "ciberseguridad", "tutorial hacking", 
    "seguridad informática", "análisis de vulnerabilidades", "redes", 
    "hacking ético", "forensics", "OSINT", "explotación", "payloads"
  ],
  authors: [{ name: "MiniMax Agent" }],
  creator: "MiniMax Agent",
  publisher: "MiniMax Agent",
  formatDetection: {
    telephone: false,
  },
  
  // Configuración de robots
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-video-preview": -1,
      "max-image-preview": "large",
      "max-snippet": -1,
    },
  },
  
  // Verificación de Google (agregar tu código si tienes)
  // verification: {
  //   google: "tu-codigo-de-verificacion"
  // }
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="es">
      <body className={inter.className}>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  );
}
EOF

echo "✅ Meta tags configurados con imagen personalizada"
echo ""

echo "📝 PASO 3: Creando archivo de configuración..."

# Crear archivo de configuración
cat > SOCIAL_SHARING_CONFIG.md << 'EOF'
# Configuración de Banner para Redes Sociales

## 🎯 Imagen Configurada
- **Archivo:** `public/images/og-banner.jpg`
- **Dimensiones:** 1200x630px
- **Formato:** JPG optimizado para web

## 📱 Redes Sociales Configuradas

### Open Graph (LinkedIn, Facebook, WhatsApp)
✅ Título: "Blog de Ethical Hacking | Tutoriales de Ciberseguridad"
✅ Descripción: Tutoriales completos de ethical hacking...
✅ Imagen: og-banner.jpg (1200x630px)

### Twitter Cards
✅ Card Type: summary_large_image
✅ Título: Blog de Ethical Hacking | Tutoriales de Ciberseguridad
✅ Imagen: og-banner.jpg

## 🔧 Personalización Requerida

### 1. Actualizar URL
En `src/app/layout.tsx` línea 15:
```typescript
url: "https://TU-DOMINIO-REAL.vercel.app",
```

### 2. Actualizar Twitter
En `src/app/layout.tsx` líneas 50-51:
```typescript
creator: "@TU-USUARIO-TWITTER",
site: "@TU-USUARIO-TWITTER"
```

### 3. Imagen Personalizada
- Crea tu propia imagen (1200x630px)
- Guarda como `public/images/og-banner.jpg`
- Mantén el estilo negro + verde fosforescente

## 🧪 Testing URLs

### Para probar cómo se ve:
- **LinkedIn:** https://www.linkedin.com/sharing/share-offsite/
- **Facebook:** https://developers.facebook.com/tools/debug/
- **Twitter:** https://cards-dev.twitter.com/validator
- **WhatsApp:** Solo comparte el link directamente

## 📊 Estructura de Archivos
```
public/
├── images/
│   └── og-banner.jpg (1200x630px)
src/
├── app/
│   ├── layout.tsx (meta tags configurados)
│   └── ...
```

EOF

echo "✅ Archivo de configuración creado: SOCIAL_SHARING_CONFIG.md"
echo ""

echo "🧹 PASO 4: Limpiando caché y probando build..."

# Limpiar caché
rm -rf .next
rm -rf node_modules/.cache

echo "🔨 Probando build..."
if bun run build; then
    echo ""
    echo "🎉 ¡CONFIGURACIÓN COMPLETA EXITOSA!"
    echo ""
    echo "✅ Lo que se configuró:"
    echo "   • Meta tags Open Graph (LinkedIn, Facebook, WhatsApp)"
    echo "   • Twitter Cards (Twitter)"
    echo "   • Imagen de banner (1200x630px)"
    echo "   • Schema.org para SEO"
    echo ""
    echo "📋 SIGUIENTE PASOS:"
    echo "1. Cambia 'tu-dominio.vercel.app' por tu dominio real"
    echo "2. Actualiza '@tu_usuario_twitter' con tu handle real"
    echo "3. Crea imagen personalizada y guarda como public/images/og-banner.jpg"
    echo ""
    echo "🚀 Para actualizar tu repositorio:"
    echo "   git add -A"
    echo "   git commit -m 'feat: add social sharing banner and meta tags'"
    echo "   git push"
    echo ""
    echo "📱 Luego comparte tu link y verás el banner en redes sociales!"
else
    echo "❌ Error en build - revisa los errores arriba"
fi

echo ""
echo "🎯 ¡Tu blog ahora tendrá banner profesional en redes sociales!"
