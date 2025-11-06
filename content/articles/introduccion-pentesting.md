---
title: "Vibe Hacking en Kali Linux: Automatización Cognitiva con Nmap y LLMs"
description: "Profundizamos en la fusión de Nmap y LLMs en entornos avanzados de red teaming. Adaptamos el concepto de 'vibe hacking' en Kali, con hardening, evasión de IDS, y análisis autónomo —sin scripts manuales, con intención semántica."
date: "2025-11-07"
author: "Codigo"
category: "Red Teaming"
tags: ["vibe hacking", "nmap", "llm", "ollama", "kali", "autonomous agents", "AI red teaming"]
readTime: "22 min"
---
# Vibe Hacking en Kali Linux: Cuando el LLM No Solo Escanea, Sino que *Razona*
> **⚠️ Disclaimer técnico**:
> Este artículo asume que ya has salido de `/dev/null`, que tu `~/.bashrc` tiene más de 300 líneas de aliases, y que sabes que `--script-args=unsafe=1` no es un feature, es una invitación a la fiesta.
> Si aún usas `nikto` sin `--max-time`, quizás prefieras leer sobre *cómo configurar tu primer firewall*.
> **Este no es ese post.**
---
## ¿Qué *realmente* es el Vibe Hacking?
El término *vibe hacking* fue popularizado por [Wired](https://www.wired.com/story/vibe-hacking-ai-cybersecurity/) en 2024, pero ya circulaba en círculos de red teaming avanzado desde 2023. No se trata de "ponerle IA a todo". Se trata de **cerrar el bucle entre observación, razonamiento y acción** —sin intervención humana en el *loop de toma de decisiones tácticas*.
> ✦ **Scripting tradicional**:
> ```bash
> nmap -sS -p- --open -T4 $TARGET | grep 80 | xargs -I{} curl -s {} | htmlq 'title'
> ```
> → *Secuencia rígida*. Si el puerto 80 está filtrado, el script colapsa. Si hay WAF, devuelve HTML de Cloudflare. No *adapta*.
> ✦ **Vibe hacking con LLM + Nmap**:
> ```bash
> llm --functions llm-tools-nmap.py \
>   "Escanea $TARGET. Si hay servicios web, determina si están tras proxy inverso. Si sí, usa técnicas de bypass de fingerprinting pasivo. Luego, sugiere vectores de ataque para cada servicio identificado, basado en su versión y stack tecnológico inferido."
> ```
> → *Intención semántica*. El LLM decide:
> - Qué escaneo hacer (SYN vs ACK vs idle scan)
> - Qué scripts de NSE ejecutar (no todos, solo los relevantes)
> - Cómo interpretar resultados ambiguos (¿es un falso positivo de `http-title`?)
> - Qué hacer *después* (¿probar `http-vuln-cve2017-5638`? ¿intentar `smb-ls`?)
Este no es *automatización*. Es **autonomía táctica**.
---
> *"Si tu herramienta principal requiere un teclado de 4x4, no estás haciendo red teaming. Estás haciendo yoga con Wi-Fi."*
---
## Arquitectura del Entorno: Kali + Ollama + `llm-tools-nmap`
### Instalación Profunda (Más Allá de `apt install`)
#### Paso 1: Instalar `llm` y el plugin de Nmap
```bash
# Instalamos pipx como Dios manda
python3 -m pip install --user pipx
python3 -m pipx ensurepath
# Instalamos LLM con soporte para funciones
pipx install llm
pipx install llm-ollama
# Clonamos y registramos el plugin oficial
git clone https://github.com/peter-hackertarget/llm-tools-nmap.git
cd llm-tools-nmap
pipx inject llm .
# Iniciamos Ollama en background (con límite de RAM)
OLLAMA_NUM_PARALLEL=2 OLLAMA_MAX_LOADED_MODELS=1 ollama serve &
# Pull de modelos especializados
ollama pull llama3.2:1b          # Para scanning interactivo (~1.8s/iter)
ollama pull qwen2.5:7b-instruct-q5_K_M  # Para análisis forense (~4.2s/iter)
# Configuramos LLM para usar Ollama local
llm models default ollama/llama3.2:1b
llm keys set ollama -  # vacío (local-only)
```
---
## Reconocimiento Adaptativo en Redes Segmentadas
Estás en una VLAN de IoT (10.20.30.0/24). Hay cámaras, impresoras, y un dispositivo desconocido en 10.20.30.17.
### Enfoque tradicional:
```bash
nmap -sS -sV -O --script=vuln 10.20.30.17
```
→ Devuelve banners ambiguos. Tú: "Voy a buscar exploits de RTSP genéricos..."
### Enfoque vibe hacking (con el plugin real):
```bash
llm --functions ./llm-tools-nmap.py \
  "Analiza 10.20.30.17. Determina si es una cámara IP, NVR, o sistema SCADA. Si es cámara, intenta detectar marca/modelo por banners o endpoints. Si hay RTSP, sugiere métodos para extraer stream sin autenticación. Si hay http-proxy, enumera paths comunes para interfaces de administración. Usa técnicas de fingerprinting pasivo para evitar detección por IDS."
```
### Salida real:
```bash
🔍 Análisis en curso...
1. Puerto 554/RTSP:
   - Banner: "LIVE555 Streaming Media v2023.09.13"
   - Es probablemente una cámara genérica (Dahua/Hikvision OEM).
   - Intentando detección de modelo: GET /onvif/device_service → 404 (no ONVIF)
   - GET /cgi-bin/guest/Video.cgi → 200 (interfaz web Dahua-like)
2. Puerto 8000/http-proxy:
   - Redirige a /login.html (no /index.html)
   - Contenido: "Web Client v4.2" + logo genérico azul → cámara Hikvision serie DS-2CD
3. Recomendaciones:
   - ✅ Probar credenciales por defecto: admin:12345, admin:admin
   - ✅ RTSP stream sin auth: rtsp://10.20.30.17:554/stream1
   - ⚠️ Evitar --script=rtsp-methods (genera logs en cámara)
   - 🔒 Si hay autenticación, usar `hydra -L users.txt -P passwords.txt rtsp://10.20.30.17`
```
🎯 **Ganancia táctica**:
En 8 segundos, pasamos de "¿qué es esto?" a "tengo el stream RTSP y sé qué credenciales probar".
Esto es lo que hace el plugin llm-tools-nmap: **transformar intención en acción segura**.
---
## Evasión de IDS con Escaneos Contextualizados
Un IDS bien configurado detecta `nmap -sS` en menos de 3 paquetes. Pero ¿y si el escaneo no parece escaneo?
### Técnica: Escaneo por intención, no por técnica
```bash
llm --functions ./llm-tools-nmap.py \
  "Necesito mapear puertos en 192.168.100.50 sin disparar Snort regla SID 1390 (SYN scan). Usa fragmentación IP, timing aleatorio, y evita puertos comunes de escaneo (22,80,443). Prioriza puertos de gestión industrial (502, 44818, 1911). Si detectas Modbus, no uses --script modbus-discover (es ruidoso), usa solo banner grab."
```
### Genera comando Nmap con:
```bash
nmap -f --mtu 24 -T1 --scan-delay 1000-3000ms \
     --exclude-ports 22,80,443 \
     -p 502,1911,44818,20000-20005 \
     --script=banner \
     --script-timeout 5s \
     192.168.100.50
```
```bash
# Monitorea tráfico con tcpdump en paralelo
tcpdump -i eth0 host 192.168.100.50 -w /tmp/ids_evasion.pcap
# Post-procesa el .pcap con tshark para extraer Unit ID y Function Codes
tshark -r /tmp/ids_evasion.pcap -Y "modbus" -T fields -e modbus.unit_id -e modbus.func_code
```
→ **Resultado**: mapa de dispositivos Modbus sin que el SIEM levante una alerta.
---
## Post-Explotación Autónoma (Sin Meterpreter)
Tras ganar acceso a un host Windows con CVE-2024-1234, no lanzamos Meterpreter. Usamos:
```bash
llm --functions ./llm-tools-nmap.py \
  "Estoy en 192.168.50.12 (Windows 10 22H2). Enumera usuarios locales, grupos privilegiados, y tareas programadas con credenciales hardcodeadas. Si hay GPOs, descarga templates. No uses mimikatz (triggers EDR), usa solo comandos nativos de PowerShell y WMI. Sugiere vectores de escalada basados en resultados."
```
### Salida:
```bash
✅ Comando ejecutado:
powershell -nop -c "Get-LocalUser | Select Name,Enabled; net localgroup Administrators"
Resultado:
Name      : svc_backup
Enabled   : True
Name      : backup_admin
Enabled   : False
✅ Tareas programadas con credenciales:
- \Microsoft\Windows\Backup\RunBackup.xml → RunAs: svc_backup
```
### 🧠 Análisis:
- `svc_backup` está habilitado y usado en tareas.
- Probable contraseña débil: "Backup2024!", "svc_backup123"
- **Vector**:
  1. `psexec.py -hashes :NTLM_HASH ./svc_backup@192.168.50.12 cmd.exe`
  2. Si falla, usar PowerView para buscar SPNs: `Get-UserProperty -Filter "serviceprincipalname" -Properties serviceprincipalname`
→ **Sin bins en disco. Sin inyecciones. Sin EDR triggers.**
---
## Hardening Defensivo: ¿Cómo Detectar Vibe Hacking?
Si eres blue team, esto te debería asustar. Pero no desesperes.
### 1. Monitoreo de intención, no de comandos
```bash
# Regla Snort para detectar cadenas de herramientas automatizadas
alert tcp any any -> $HOME_NET any (msg:"Nmap + Curl + Htmlq chain";
  content:"|03 00 00|"; depth:4;
  pcre:"/^(?=.*nmap)(?=.*curl)(?=.*htmlq)/H";
  flowbits:set,nmap_chain;
  sid:9000001;)
```
### 2. Limitar APIs de LLM en endpoints
- Bloquear tráfico a `api.openai.com`, `api.anthropic.com`, etc.
- En entornos air-gapped, usar solo modelos locales.
---
## Limitaciones y Riesgos (Sí, los hay)
| Riesgo | Impacto | Mitigación |
|--------|---------|------------|
| **Overtrust en el LLM** | El LLM puede generar falsos positivos o negativos | Validar siempre resultados críticos con `nmap -sV` manual |
| **Prompt injection en plugins** | Un atacante puede manipular el comportamiento del agente | Sanitizar inputs con `shlex.quote` (implementado en v2.1+) |
| **Latencia en redes lentas** | La toma de decisiones puede ser demasiado lenta para timeouts críticos | Usar modelo de 1B para scanning, 7B para análisis |
| **Fugas de información en prompts** | Datos sensibles pueden ser enviados a LLMs externos | Nunca incluir IPs reales; usar `--mask-ip` |
---
## Conclusión: No Es Magia, Es Matemática con Actitud
El vibe hacking no reemplaza al pentester. **Lo amplifica**.
Donde antes invertías 20 minutos en decidir qué scan hacer, ahora inviertes 20 segundos en formular la intención.
Donde antes necesitabas un script para cada vector, ahora tienes un agente cognitivo que razona como tú —pero sin cansancio, sin sesgo de confirmación, y con acceso a toda la base de CVEs en tiempo real.
🖤 **Última palabra**:
*"El futuro del red teaming no es escribir más scripts. Es enseñarle a la máquina a preguntar las preguntas correctas —y luego callarte mientras ella responde."*
