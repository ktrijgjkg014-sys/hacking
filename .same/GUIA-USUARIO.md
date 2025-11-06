# Guía de Uso - Blog de Hacking Ético

## 📝 Cómo Agregar Artículos

### Paso 1: Crear un Archivo Markdown

1. Ve a la carpeta `content/articles/`
2. Crea un nuevo archivo `.md` (ejemplo: `mi-tutorial.md`)

### Paso 2: Estructura del Artículo

Copia esta plantilla al inicio de tu archivo:

```markdown
---
title: "Título de tu Artículo"
description: "Descripción breve que aparecerá en la tarjeta del artículo"
date: "2025-01-20"
author: "Tu Nombre"
category: "Categoría Principal"
tags: ["tag1", "tag2", "tag3"]
readTime: "15 min"
---

# Tu Título Principal

Aquí empieza tu contenido...
```

### Paso 3: Escribir Contenido

Usa Markdown normal:

#### Código con Syntax Highlighting

\`\`\`bash
nmap -sV target.com
\`\`\`

\`\`\`python
import socket
print("Hola mundo")
\`\`\`

#### Tablas

```
| Herramienta | Descripción |
|-------------|-------------|
| Nmap        | Port scanner|
| Burp Suite  | Web proxy   |
```

#### Listas

```
- Punto 1
- Punto 2
  - Subpunto
```

#### Enlaces e Imágenes

```
[Texto del enlace](https://url.com)
![Descripción](url-imagen.jpg)
```

## 🎨 Personalización de Colores

Los colores están en `src/app/globals.css`:

- `--primary`: Verde fosforescente principal
- `--background`: Fondo negro
- Modifica las variables CSS para cambiar el esquema de colores

## 📁 Estructura del Proyecto

```
ethical-hacking-blog/
├── content/
│   └── articles/          # TUS ARTÍCULOS AQUÍ (.md)
├── src/
│   ├── app/
│   │   ├── page.tsx       # Página principal
│   │   └── article/[slug]/
│   │       └── page.tsx   # Página de artículo individual
│   ├── components/
│   │   ├── Header.tsx
│   │   ├── ArticleCard.tsx
│   │   └── MarkdownContent.tsx
│   └── lib/
│       └── articles.ts    # Lógica de carga de artículos
```

## 🚀 Comandos

```bash
bun run dev     # Iniciar servidor de desarrollo
bun run build   # Compilar para producción
bun run start   # Ejecutar en producción
```

## 💡 Consejos

1. **Nombres de archivos**: Usa kebab-case (mi-articulo.md)
2. **Fechas**: Formato YYYY-MM-DD (2025-01-20)
3. **Categorías**: Pentesting, Web Security, Network Security, etc.
4. **Tags**: Usa 3-5 tags relevantes por artículo
5. **ReadTime**: Estima el tiempo de lectura (10 min, 20 min, etc)

## ⚠️ Importante

- Los artículos se ordenan por fecha (más reciente primero)
- El archivo `README.md` en articles/ está excluido automáticamente
- Usa código con syntax highlighting para mejor visualización
- Incluye advertencias legales en tutoriales sensibles

## 🎯 Categorías Recomendadas

- **Pentesting**: Metodologías y técnicas generales
- **Web Security**: Vulnerabilidades web (XSS, SQLi, CSRF)
- **Network Security**: Escaneo, análisis de tráfico
- **Malware Analysis**: Análisis de malware
- **Forensics**: Análisis forense digital
- **Social Engineering**: Ingeniería social
- **Cryptography**: Criptografía y cifrado

## 📊 URLs de Artículos

Los artículos se generan automáticamente con esta estructura:

```
/article/nombre-del-archivo
```

Por ejemplo:
- `introduccion-pentesting.md` → `/article/introduccion-pentesting`
