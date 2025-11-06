"use client";
import { useEffect } from "react";

export default function ClientBody({
  children,
}: {
  children: React.ReactNode;
}) {
  useEffect(() => {
    // Asegurar que los estilos de Tailwind se apliquen correctamente
    document.documentElement.classList.add('antialiased');
    document.body.classList.add('antialiased');
    
    // Aplicar clases de tema inicial
    const root = document.documentElement;
    
    // Verificar si el usuario prefiere tema oscuro
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      root.classList.add('dark');
    } else {
      root.classList.remove('dark');
    }
  }, []);

  return <>{children}</>;
}
