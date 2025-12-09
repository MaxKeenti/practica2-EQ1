#import "portada-template.typ": portada

#let integrantes = (
  "Gonzalez Calzada Maximiliano",
  "Sotelo Jiménez Mildred Joana",
  "Tapia Hernández Belinda",
)

#portada(
  "ACADEMIA",
  "MATERIA",
  "PRÁCTICA 2",
  "SECUENCIA Y PERIODO",
  "INTEGRANTES",
  "PROFESORA",
  "FECHA DE ENTREGA",
  "Redes",
  "Comunicación de Datos",
  "Comprobación Lógica de Cableado y Conectividad de una Red de Área Local",
  "5CV50 2026-1",
  integrantes,
  "Nancy Lorena Ortiz Castrejón",
  "09 de diciembre de 2025",
)

#set text(
  font: "ITC Avant Garde Gothic",
  lang: "es",
  weight: "semibold",
)

#set page(
  paper: "us-letter",
  margin: (left: 3cm, top: 2.5cm, right: 2.5cm, bottom: 2.5cm),
  numbering: "1",
)

#outline(
  title: "Índice",
  indent: auto,
)

#pagebreak()
#set par(justify: true, leading: 1.4em)
#set heading(numbering: "1.")
#set list(indent: 1.5em)
#v(1cm)

#set align(center)
#title("COMPROBACIÓN LÓGICA DE CABLEADO Y CONECTIVIDAD DE UNA RED DE ÁREA LOCAL")
#set align(left)

= Comandos de Red

== PING @ping_ms
El comando ping (Packet Internet Groper) permite comprobar si existe conectividad entre tu computadora y otro dispositivo dentro de la red o en Internet.

Funciona enviando pequeños paquetes llamados ICMP Echo Request, y si el destino está disponible, este responde con ICMP Echo Reply.

Sirve para:
- Verificar si un host (PC, router, servidor) está encendido y accesible.
- Identificar fallas en la red (si no hay respuesta, puede haber un problema físico o lógico).
- Medir el tiempo de ida y vuelta de los paquetes (latencia), lo cual ayuda a detectar lentitud y saber si el problema es local (LAN) o externo (Internet).

=== Ejemplos (Windows):
- `ping -t`: hace ping continuo.
- `ping -4`: fuerza uso de IPv4.
- `ping -n 10`: envía un número específico de paquetes.

=== MacOS / UNIX
En sistemas basados en UNIX como macOS y Linux, el comando es el mismo (`ping`), pero tiene diferencias en sus banderas:
- Por defecto, se ejecuta indefinidamente (equivalente a `ping -t`). Se detiene con `Ctrl + C`.
- `ping -c <n>`: Envía un número específico de paquetes (equivalente a `ping -n` de Windows).

== IPCONFIG @ipconfig_ms
El comando ipconfig muestra la información de configuración de red de la computadora en Windows y permite conocer direcciones IP asignadas, máscaras de subred, gateway, DNS, tipo de adaptador, entre otros datos fundamentales.

Sirve para:
- Poder ver la IP actual del equipo.
- Identificar el adaptador que está en uso (Ethernet o WiFi).
- Saber si la PC recibió una IP del router mediante DHCP.
- Diagnosticar problemas cuando la IP comienza con 169.254.x.x (red APIPA) y renovar o liberar la IP cuando hay conflictos de direccionamiento.

=== Ejemplos (Windows)
- `ipconfig`: muestra IP básica.
- `ipconfig /all`: muestra toda la información detallada (DNS, MAC, DHCP).
- `ipconfig /reléase`: libera la IP actual.
- `ipconfig /renew`: solicita una nueva IP al servidor DHCP.
- `ipconfig /flushdns`: limpia la caché DNS.

=== MacOS / UNIX: IFCONFIG
En macOS y Linux, el comando equivalente principal es `ifconfig`:
- `ifconfig`: Muestra el estado de las interfaces de red activas.
- `ifconfig en0`: Muestra detalles de la interfaz específica (comúnmente WiFi en Mac).
- `ipconfig getifaddr en0`: Comando específico de macOS para obtener rápidamente solo la dirección IP.

== TRACERT @tracert_ms
El comando tracert (Trace Route) permite rastrear la ruta que siguen los paquetes desde tu computadora hasta un destino.

Muestra todos los routers o saltos por los que pasan los paquetes antes de llegar al final.

Puede:
- Identificar dónde se rompe la comunicación en caso de fallas.
- Medir el tiempo de respuesta de cada salto.
- Analizar la ruta que los datos siguen dentro de una red grande o hacia Internet.
- Saber si un problema está dentro de la red local o en la red del proveedor de Internet.

Funciona de la siguiente forma:

tracert envía paquetes con un valor llamado TTL (Time to Live):
- TTL = 1 - solo llega al primer router.
- TTL = 2 - llega al segundo, y así sucesivamente.

Cada router responde indicando que pasó por ahí. Eso permite ver toda la ruta.

=== MacOS / UNIX: TRACEROUTE
El comando equivalente es `traceroute`.
- Funciona de manera similar, mostrando los saltos hasta el destino.
- `traceroute google.com`

== NETSTAT @netstat_ms
El comando netstat (Network Statistics) muestra todas las conexiones de red activas, los puertos en uso y estadísticas del protocolo TCP/IP.

Ayuda a:
- Poder ver las conexiones TCP/UDP abiertas en la computadora.
- Identificar puertos utilizados por aplicaciones (útil en seguridad y diagnóstico).
- Revisar qué programas están comunicándose a Internet.
- Detectar conexiones sospechosas o actividad anormal.
- Consultar el estado de cada conexión (LISTENING, ESTABLISHED, TIME_WAIT, etc.).

=== Ejemplos (Windows)
- `netstat`: muestra conexiones activas.
- `netstat -n`: muestra IPs y puertos en formato numérico.
- `netstat -a`: muestra todos los puertos en escucha.
- `netstat -b`: muestra qué programa usa qué conexión (requiere permisos).
- `netstat -r`:  muestra la tabla de enrutamiento.

=== MacOS / UNIX
El comando `netstat` existe, pero algunas banderas difieren y es común usar otras herramientas:
- `netstat -r`: Muestra tablas de enrutamiento (igual que en Windows).
- `netstat -an`: Muestra conexiones y puertos en formato numérico.
- `lsof -i`: ("List Open Files") Es una herramienta muy potente en UNIX para listar archivos de red abiertos y puertos en uso.

= Conexión Punto a Punto con Cable Crossover

¿Cómo conectar 2 computadoras punto a punto con un cable crossover?

Se utiliza un cable crossover porque las computadoras transmiten datos en un par y reciben en otro. Al cruzarlos, las señales de una PC llegan al puerto correcto de la otra PC @tia_standard.

En cables crossover:
- El par que transmite en una PC llega al par receptor de la otra.
- Esto permite la comunicación directa @flukenetworks_568.

#figure(
  image("media/diagrama1.jpg", width: 50%),
  caption: [Diagrama explicativo],
)

=== Conecta el cable crossover
Cada extremo va conectado al adaptador de red Ethernet de cada computadora.

#figure(
  image("media/foto1.jpg", width: 40%),
  caption: [Conexión del cable],
)

=== Asigna direcciones IP en la misma red
Como no hay router, cada PC debe tener una IP manual.

Ejemplo:

*PC 1*
- IP: 192.168.10.1
- Máscara: 255.255.255.0

*PC 2*
- IP: 192.168.10.2
- Máscara: 255.255.255.0

No se asigna puerta de enlace porque no hay salida a internet.

=== Verifica conectividad
En cada PC ejecuta con el comando ping.

#figure(
  image("media/foto10.png", width: 40%),
  caption: [Verificación con Ping],
)

= Desarrollo de la práctica
Desarrollo de la práctica:

=== Identificación
Identifique las conexiones del router, y explíquelas:

Un router normalmente tiene:
- Puerto WAN / Internet: se conecta al módem o a la red externa.
- Puertos LAN (1–4): sirven para conectar computadoras con cables straight through.
- Conector de energía: alimenta al router.
- Botón Reset: restablece la configuración de fábrica.
- (Opcional) WiFi: antenas para comunicación inalámbrica.

#figure(
  image("media/foto2.jpg", width: 40%),
  caption: [Puertos del router parte trasera],
)
#figure(
  image("media/foto3.jpg", width: 40%),
  caption: [Indicadores del router],
)

== Conexión
Conectar los equipos al router:
- Cada equipo se conecta a un puerto LAN con un cable UTP straight-through.
- El router les da dirección IP automáticamente (si DHCP está activado).
Para comprobarlo se usa:
Ipconfig

#figure(
  image("media/foto4.jpg", width: 40%),
  caption: [Equipos conectados al router],
)
#figure(
  image("media/foto6.jpg", width: 40%),
  caption: [Equipos detectados por el router],
)

== Comprobación
Aplicar y comprobar los comandos MS-DOS
Ya con la red funcionando, ejecuta en cada PC:
- ipconfig
  - Para ver la IP asignada.
- ping al router (ej. 192.168.1.1).
  - Para verificar conexión.
- tracert a algún dominio.
  - Para ver la ruta de salida.
- netstat
  - Para ver conexiones activas.
Esto comprueba que la PC está bien conectada al router.

#figure(
  image("media/foto7.jpg", width: 40%),
  caption: [ipconfig],
)
#figure(
  image("media/foto12.jpg", width: 40%),
  caption: [ping],
)
#figure(
  image("media/foto13.png", width: 40%),
  caption: [tracert],
)
#figure(
  image("media/foto14.png", width: 40%),
  caption: [netstat],
)

== Crossover
Realice una red punto a punto entre los dos equipos de cómputo con el cable cruzado. Asigne direccionamiento IP dentro del mismo segmento y rango de direccionamiento entre computadoras.

#figure(
  image("media/foto11.png", width: 40%),
  caption: [Equipo 1 configuración],
)
#figure(
  image("media/foto15.png", width: 40%),
  caption: [Equipo 2 configuración],
)

== Comprobación
Compruebe los comandos MS-DOS que se investigaron.
#figure(
  image("media/foto12.jpg", width: 40%),
  caption: [ping Equipo 1],
)
#figure(
  image("media/foto10.png", width: 40%),
  caption: [ping Equipo 2],
)

= Conclusiones
La realización de esta práctica ha permitido consolidar el conocimiento sobre los comandos fundamentales de red como `ping`, `ipconfig`, `tracert` y `netstat`. Se ha demostrado su utilidad para diagnosticar problemas de conectividad, obtener información detallada de la configuración de red, rastrear rutas de paquetes y monitorear conexiones activas.

Asimismo, se ha comprendido la importancia del cableado estructurado al configurar una conexión punto a punto utilizando un cable crossover, destacando la necesidad de asignar direcciones IP estáticas en el mismo segmento de red. La experiencia con la conexión a un router ha reforzado el entendimiento del funcionamiento de DHCP y la interconexión de dispositivos en una red de área local.

En resumen, esta práctica ha proporcionado una base sólida para la comprobación lógica de cableado y la conectividad de redes, equipando con herramientas esenciales para la administración y resolución de problemas en entornos de red.

#figure(
  image("media/foto16.jpg", width: 40%),
  caption: [Equipo 8],
)

#bibliography("media/bibliografia.bib", style: "apa")
