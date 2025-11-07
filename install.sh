#!/bin/bash

# 🛠️ Script de Instalación Automática - Blog de Ethical Hacking
# Versión: 2.0.0
# Descripción: Configura automáticamente el blog modernizado

set -e  # Salir en cualquier error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para print con colores
print_step() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}🚀 INSTALACIÓN BLOG HACKING v2.0${NC}"
    echo -e "${PURPLE}================================${NC}"
    echo ""
}

# Función para verificar dependencias
check_dependencies() {
    print_step "Verificando dependencias del sistema..."
    
    # Verificar Node.js
    if ! command -v node &> /dev/null; then
        print_error "Node.js no está instalado. Por favor instala Node.js 18+ desde https://nodejs.org"
        exit 1
    fi
    
    # Verificar versión de Node.js
    NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -lt 18 ]; then
        print_error "Node.js versión 18+ requerida. Versión actual: $(node -v)"
        exit 1
    fi
    
    print_success "Node.js $(node -v) detectado ✓"
    
    # Verificar npm
    if ! command -v npm &> /dev/null; then
        print_error "npm no está instalado"
        exit 1
    fi
    
    print_success "npm $(npm -v) detectado ✓"
}

# Función para crear directorios necesarios
create_directories() {
    print_step "Creando estructura de directorios..."
    
    # Crear directorios principales
    mkdir -p src/components
    mkdir -p src/app/api
    mkdir -p src/app/api/views
    mkdir -p src/app/api/views/\[slug\]
    mkdir -p src/types
    mkdir -p data
    
    print_success "Estructura de directorios creada ✓"
}

# Función para instalar dependencias
install_dependencies() {
    print_step "Instalando dependencias de Node.js..."
    
    # Verificar si package.json existe
    if [ ! -f "package.json" ]; then
        print_error "package.json no encontrado. Asegúrate de estar en el directorio raíz del proyecto."
        exit 1
    fi
    
    # Instalar dependencias
    npm install
    
    print_success "Dependencias instaladas ✓"
}

# Función para verificar archivos críticos
check_critical_files() {
    print_step "Verificando archivos críticos..."
    
    local required_files=(
        "src/app/page.tsx"
        "src/app/layout.tsx"
        "src/app/globals.css"
        "src/components/ModernLayout.tsx"
        "src/components/CopyCodeBlock.tsx"
        "src/components/ViewCounter.tsx"
        "src/components/Pagination.tsx"
        "src/components/MarkdownRenderer.tsx"
        "src/components/BlogSections.tsx"
        "src/components/ModernNavigation.tsx"
    )
    
    for file in "${required_files[@]}"; do
        if [ -f "$file" ]; then
            print_success "✓ $file"
        else
            print_warning "⚠ $file no encontrado"
        fi
    done
}

# Función para construir el proyecto
build_project() {
    print_step "Construyendo el proyecto..."
    
    # Limpiar cache anterior
    rm -rf .next
    
    # Ejecutar build
    npm run build
    
    if [ $? -eq 0 ]; then
        print_success "Proyecto construido exitosamente ✓"
    else
        print_error "Error al construir el proyecto"
        exit 1
    fi
}

# Función para crear archivos de configuración adicionales
create_config_files() {
    print_step "Creando archivos de configuración adicionales..."
    
    # Crear .gitignore si no existe
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << EOF
# Dependencies
/node_modules
/.pnp
.pnp.js

# Testing
/coverage

# Next.js
/.next/
/out/

# Production
/build

# Misc
.DS_Store
*.pem

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Local env files
.env*.local

# Vercel
.vercel

# TypeScript
*.tsbuildinfo
next-env.d.ts

# Data files (optional - para views counter)
data/views.json
EOF
        print_success "✓ .gitignore creado"
    fi
    
    # Crear .env.example si no existe
    if [ ! -f ".env.example" ]; then
        cat > .env.example << EOF
# Configuración de ejemplo para el blog

# Base URL del sitio
NEXT_PUBLIC_SITE_URL=http://localhost:3000

# Configuración de analytics (opcional)
NEXT_PUBLIC_GA_ID=your_google_analytics_id

# Configuración de email (para contacto)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password

# Configuración de base de datos (futuro)
DATABASE_URL=your_database_url
EOF
        print_success "✓ .env.example creado"
    fi
}

# Función para mostrar instrucciones finales
show_final_instructions() {
    echo ""
    echo -e "${CYAN}🎉 ¡INSTALACIÓN COMPLETADA EXITOSAMENTE!${NC}"
    echo ""
    echo -e "${GREEN}📋 PASOS SIGUIENTES:${NC}"
    echo ""
    echo -e "${YELLOW}1. Ejecutar en desarrollo:${NC}"
    echo -e "   ${BLUE}npm run dev${NC}"
    echo ""
    echo -e "${YELLOW}2. Abrir en navegador:${NC}"
    echo -e "   ${BLUE}http://localhost:3000${NC}"
    echo ""
    echo -e "${YELLOW}3. Para producción:${NC}"
    echo -e "   ${BLUE}npm run build${NC}"
    echo -e "   ${BLUE}npm run start${NC}"
    echo ""
    echo -e "${YELLOW}4. Subir a GitHub:${NC}"
    echo -e "   ${BLUE}git add .${NC}"
    echo -e "   ${BLUE}git commit -m 'Modernización completa del blog'${NC}"
    echo -e "   ${BLUE}git push origin main${NC}"
    echo ""
    echo -e "${PURPLE}🚀 CARACTERÍSTICAS IMPLEMENTADAS:${NC}"
    echo -e "   ✓ Colores modernos (azul oscuro + cian)"
    echo -e "   ✓ Código copiable con botones Copy"
    echo -e "   ✓ Contador de vistas tipo Telegram"
    echo -e "   ✓ Paginación inteligente (6 artículos/página)"
    echo -e "   ✓ Diseño totalmente responsivo"
    echo -e "   ✓ Secciones: Cursos, Contacto, YouTube"
    echo -e "   ✓ Navegación móvil mejorada"
    echo -e "   ✓ SEO optimizado"
    echo ""
    echo -e "${GREEN}📖 DOCUMENTACIÓN:${NC}"
    echo -e "   • README.md - Guía completa"
    echo -e "   • CHANGELOG.md - Cambios implementados"
    echo -e "   • .env.example - Configuración de ejemplo"
    echo ""
    echo -e "${RED}⚠️  IMPORTANTE:${NC}"
    echo -e "   • El blog ahora usa colores modernos en lugar de verde fosforescente"
    echo -e "   • Los artículos existentes siguen siendo compatibles"
    echo -e "   • Revisa y personaliza el contenido según tus necesidades"
    echo ""
}

# Función principal
main() {
    print_header
    
    # Mostrar información del sistema
    echo -e "${CYAN}📊 INFORMACIÓN DEL SISTEMA:${NC}"
    echo -e "   • OS: $(uname -s)"
    echo -e "   • Node.js: $(node -v)"
    echo -e "   • npm: $(npm -v)"
    echo -e "   • Directorio actual: $(pwd)"
    echo ""
    
    # Confirmar instalación
    echo -e "${YELLOW}¿Proceder con la instalación? (y/n)${NC}"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Instalación cancelada."
        exit 0
    fi
    
    echo ""
    
    # Ejecutar pasos de instalación
    check_dependencies
    create_directories
    install_dependencies
    check_critical_files
    build_project
    create_config_files
    show_final_instructions
}

# Manejar errores
trap 'print_error "Error en la línea $LINENO. Salida con código $?"' ERR

# Ejecutar función principal
main "$@"
