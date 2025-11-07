'use client'
import React, { useState, useEffect } from 'react'
import Link from "next/link"
import { FileText, Clock, User, Tag, Terminal, Eye, TrendingUp, BookOpen, Youtube, Mail } from "lucide-react"
import ViewCounter from "../components/ViewCounter"
import Pagination from "../components/Pagination"
import BlogSections from "../components/BlogSections"
const ARTICLES_PER_PAGE = 6
const allArticles = [
  {
    slug: "vibe-hacking",
    title: "Vibe Hacking en Kali Linux: Automatización Cognitiva con Nmap y LLMs",
    description: "Profundizamos en la fusión de Nmap y LLMs en entornos avanzados de red teaming.",
    author: "Codigo",
    category: "Red Teaming",
    readTime: "15 min",
    tags: ["vibe hacking", "llm", "nmap", "ollama"],
    date: "2025-01-15",
    views: 45,
    featured: true
  },
  {
    slug: "letreros-led",
    title: "Vulnerabilidades en Controladores LED: IoT Security Analysis",
    description: "Análisis técnico-profesional de vulnerabilidades en controladores LED y dispositivos IoT.",
    author: "Codigo",
    category: "IoT Security",
    readTime: "20 min",
    tags: ["nmap", "IoT hacking", "physical pentesting", "LED signs"],
    date: "2025-01-05",
    views: 32,
    featured: false
  },
  {
    slug: "sql-injection-avanzado",
    title: "SQL Injection Avanzado: Técnicas de Exfiltración y Evasión",
    description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos.",
    author: "codigo",
    category: "Web Security",
    readTime: "25 min",
    tags: ["sql-injection", "web", "avanzado", "database"],
    date: "2025-01-10",
    views: 67,
    featured: true
  },
  {
    slug: "wireless-pentesting",
