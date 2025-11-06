# Cómo Agregar Artículos

## Estructura de un Artículo

Crea un archivo `.md` en esta carpeta con el siguiente formato:

```markdown
---
title: "Título de tu artículo"
description: "Descripción breve del artículo"
date: "2025-01-15"
author: "Tu Nombre"
category: "Categoría"
tags: ["tag1", "tag2", "tag3"]
readTime: "15 min"
---

# Tu contenido aquí

Escribe tu tutorial usando Markdown...
```

## Categorías Sugeridas

- Pentesting
- Web Security
- Network Security
- Malware Analysis
- Forensics
- Social Engineering
- Cryptography

## Sintaxis Markdown Soportada

### Código

\`\`\`bash
nmap -sV target.com
\`\`\`

### Tablas

| Columna 1 | Columna 2 |
|-----------|-----------|
| Dato 1    | Dato 2    |

### Listas

- Item 1
- Item 2
  - Subitem

### Enlaces

[Texto del enlace](https://url.com)

### Imágenes

![Alt text](url-de-imagen.jpg)

## Consejos

- Usa código con syntax highlighting
- Incluye ejemplos prácticos
- Agrega advertencias legales cuando sea necesario
- Estructura tu contenido con headers (##, ###)
