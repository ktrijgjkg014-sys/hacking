#!/bin/bash

echo "🔧 Solucionando error de Vercel..."
echo ""

# Crear backup del package.json actual
echo "📋 Creando backup de archivos actuales..."
cp package.json package.json.backup.$(date +%Y%m%d_%H%M%S)
if [ -f "next.config.js" ]; then
    cp next.config.js next.config.js.backup.$(date +%Y%m%d_%H%M%S)
fi

# Reemplazar package.json con versión limpia
echo "📦 Reemplazando package.json con versión compatible con Vercel..."
cat > package.json << 'EOF'
{
  "name": "hacking-blog",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "autoprefixer": "^10.4.21",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "gray-matter": "^4.0.3",
    "lucide-react": "^0.475.0",
    "next": "^15.3.2",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-markdown": "^10.1.0",
    "remark-gfm": "^4.0.1",
    "tailwind-merge": "^3.3.0",
    "tailwindcss-animate": "^1.0.7"
  },
  "devDependencies": {
    "@types/node": "^20.17.50",
    "@types/react": "^18.3.22",
    "@types/react-dom": "^18.3.7",
    "eslint": "^9.27.0",
    "eslint-config-next": "15.1.7",
    "postcss": "^8.5.3",
    "tailwindcss": "^3.4.17",
    "typescript": "^5.8.3"
  }
}
EOF

# Reemplazar next.config.js con versión limpia
echo "⚙️  Reemplazando next.config.js..."
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;
EOF

# Limpiar node_modules y package-lock.json
echo "🧹 Limpiando dependencias actuales..."
rm -rf node_modules package-lock.json

# Instalar dependencias nuevas
echo "📦 Instalando dependencias limpias..."
npm install

# Probar build local
echo "🧪 Probando build local..."
npm run build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ ¡BUILD EXITOSO! Tu proyecto está listo para Vercel."
    echo ""
    echo "🚀 Para desplegar en Vercel:"
    echo "1. git add ."
    echo "2. git commit -m 'Fix: package.json para Vercel'"
    echo "3. git push origin main"
    echo "4. Vercel detectará automáticamente los cambios"
    echo ""
    echo "📋 Archivos de respaldo creados:"
    echo "- package.json.backup.$(date +%Y%m%d_%H%M%S)"
    if [ -f "next.config.js.backup.$(date +%Y%m%d_%H%M%S)" ]; then
        echo "- next.config.js.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    echo ""
    echo "🌟 Tu blog tendrá colores azul/cian cuando se despliegue!"
else
    echo ""
    echo "❌ Error en el build. Revisa los mensajes de error arriba."
    echo "🆘 Para restaurar archivos anteriores:"
    echo "cp package.json.backup.$(date +%Y%m%d_%H%M%S) package.json"
    if [ -f "next.config.js.backup.$(date +%Y%m%d_%H%M%S)" ]; then
        echo "cp next.config.js.backup.$(date +%Y%m%d_%H%M%S) next.config.js"
    fi
    echo "rm -rf node_modules && npm install"
fi
