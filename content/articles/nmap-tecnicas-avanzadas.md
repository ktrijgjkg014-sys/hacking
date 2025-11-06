---
title: "Nmap: Técnicas Avanzadas de Escaneo de Redes"
description: "Explora técnicas avanzadas de escaneo con Nmap incluyendo evasión de firewalls, NSE scripts y optimización de escaneos a gran escala."
date: "2025-01-05"
author: "Security Research Team"
category: "Network Security"
tags: ["nmap", "networking", "reconocimiento", "avanzado"]
readTime: "20 min"
---

# Nmap: Técnicas Avanzadas

Nmap es la herramienta más poderosa para reconocimiento de redes. Este tutorial cubre técnicas avanzadas para profesionales.

## Tipos de Escaneo

### SYN Scan (Stealth Scan)

```bash
nmap -sS target.com
```

### TCP Connect Scan

```bash
nmap -sT target.com
```

### UDP Scan

```bash
nmap -sU target.com
```

### Escaneo Completo

```bash
nmap -p- -sV -sC -A -T4 -oA full_scan target.com
```

## Evasión de Firewalls

### Fragmentación de Paquetes

```bash
nmap -f target.com
```

### Decoy Scanning

```bash
nmap -D RND:10 target.com
```

### Source Port Spoofing

```bash
nmap --source-port 53 target.com
```

## NSE (Nmap Scripting Engine)

### Vulnerability Scanning

```bash
nmap --script vuln target.com
```

### SMB Enumeration

```bash
nmap --script smb-enum-shares,smb-enum-users target.com
```

### SSL/TLS Analysis

```bash
nmap --script ssl-enum-ciphers -p 443 target.com
```

## Optimización de Escaneos

### Timing Templates

```bash
nmap -T0  # Paranoid
nmap -T1  # Sneaky
nmap -T2  # Polite
nmap -T3  # Normal
nmap -T4  # Aggressive
nmap -T5  # Insane
```

### Parallel Scanning

```bash
nmap --min-parallelism 100 target.com
```

## Output Formats

```bash
nmap -oN output.txt target.com    # Normal
nmap -oX output.xml target.com    # XML
nmap -oG output.gnmap target.com  # Grepable
nmap -oA output target.com        # All formats
```

## Conclusión

Dominar Nmap es esencial para cualquier profesional de seguridad. La práctica constante te hará más eficiente.
