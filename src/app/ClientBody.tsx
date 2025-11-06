"use client";
import { useEffect } from "react";

export default function ClientBody({
  children,
}: {
  children: React.ReactNode;
}) {
  useEffect(() => {
    // Aplicar tema HACKING: siempre oscuro con verde fosforescente
    document.documentElement.classList.add('dark', 'antialiased');
    document.body.classList.add('antialiased');
    
    // Forzar fondo negro y texto verde
    document.body.style.backgroundColor = '#000000';
    document.body.style.color = '#00ff00';
  }, []);

  return <>{children}</>;
}
