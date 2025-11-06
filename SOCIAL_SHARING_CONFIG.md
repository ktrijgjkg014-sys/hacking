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

