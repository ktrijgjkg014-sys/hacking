# Blog de Hacking Ético - Proyecto Profesional

## 🎯 Características

✅ **Diseño Cyberpunk Elite**
- Colores negro + verde fosforescente
- Efectos glow y scanline
- Tipografía estilo terminal (JetBrains Mono)
- Animaciones sutiles

✅ **Sistema de Artículos Markdown**
- Agregar artículos es súper fácil: solo crea archivos `.md`
- Metadata en frontmatter (título, descripción, tags, etc)
- Soporte completo de Markdown con syntax highlighting
- Renderizado automático de código con colores

✅ **Arquitectura Profesional**
- Next.js 15 con App Router
- TypeScript para seguridad de tipos
- Componentes modulares reutilizables
- SEO optimizado

✅ **Características Técnicas**
- Navegación fluida entre artículos
- Grid responsive (1-3 columnas según pantalla)
- Categorías y tags automáticos
- Ordenamiento por fecha
- Sistema de lectura optimizado

## 📂 Estructura Elite

```
ethical-hacking-blog/
├── content/
│   └── articles/              # Agrega tus .md aquí
├── src/
│   ├── app/
│   │   ├── page.tsx          # Home con grid de artículos
│   │   ├── article/[slug]/   # Vista individual de artículo
│   │   └── globals.css       # Tema cyberpunk
│   ├── components/
│   │   ├── Header.tsx        # Header con nav
│   │   ├── ArticleCard.tsx   # Card de artículo
│   │   └── MarkdownContent.tsx # Renderer de MD
│   └── lib/
│       └── articles.ts       # Lógica de artículos
```

## 🚀 Uso Rápido

### Agregar un Artículo Nuevo

1. Crea `content/articles/mi-articulo.md`
2. Agrega el frontmatter:

```markdown
---
title: "Mi Tutorial de Hacking"
description: "Descripción corta"
date: "2025-01-20"
author: "Tu Nombre"
category: "Pentesting"
tags: ["tutorial", "básico"]
readTime: "10 min"
---

# Contenido aquí...
```

3. ¡Listo! El artículo aparece automáticamente

### Comandos

```bash
bun run dev      # Desarrollo
bun run build    # Compilar
bun run start    # Producción
```

## 🎨 Personalización

### Colores
Edita `src/app/globals.css` líneas 6-34 para cambiar el esquema de colores

### Logo/Nombre
Edita `src/components/Header.tsx` línea 11-15

### Footer
Edita `src/app/page.tsx` línea 86-95

## 📋 Artículos Incluidos

1. **Introducción al Pentesting** - Metodología completa
2. **SQL Injection Avanzado** - Técnicas de exfiltración
3. **Nmap Técnicas Avanzadas** - Escaneo profesional

## 🔒 Código Profesional

- Sin comentarios (código limpio y autoexplicativo)
- TypeScript estricto
- Componentes modulares
- Separación de responsabilidades
- Performance optimizado

## 💡 Próximos Pasos Recomendados

Ver `GUIA-USUARIO.md` para instrucciones detalladas de uso.
