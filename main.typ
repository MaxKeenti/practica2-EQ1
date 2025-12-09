#import "portada-template.typ": portada

#let integrantes = (
  "Gonzalez Calzada Maximiliano",
  "Sotelo Jiménez Mildred Joana",
  "Tapia Hernández Belinda",
)

#portada(
  "ACADEMIA",
  "MATERIA",
  "PRÁCTICA 1",
  "SECUENCIA Y PERIODO",
  "INTEGRANTES",
  "PROFESORA",
  "FECHA DE ENTREGA",
  "Redes",
  "Comunicación de Datos",
  "ARMADO DE CABLES DE RED STRAIGHT THROUGH Y CROSSOVER",
  "5CV50 2026-1",
  integrantes,
  "Nancy Lorena Ortiz Castrejón",
  "2 de diciembre de 2025",
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
#title("ARMADO DE CABLES DE RED STRAIGHT THROUGH Y CROSSOVER")
#set align(left)

= Calificación y observaciones
#v(3cm)

= Objetivo
Armar un cable o directo (Straight Through) UTP CAT. 5e y un cable cruzado (crossover) UTP CAT. 5e según la norma ANSI/EIA/TIA 568A y 568B.

= Consideraciones Teóricas
== Investigar la configuración ANSI/EIA/TIA 568A y 568B.

Las normas T568A y T568B son estándares de cableado para conectores RJ45 @wikipedia_ansi. La diferencia principal radica en la posición de los pares naranja y verde @flukenetworks_568.

=== T568A:
- Pin 1: Blanco/Verde
- Pin 2: _`Verde`_
- Pin 3: Blanco/Naranja
- Pin 4: Azul
- Pin 5: Blanco/Azul
- Pin 6: _`Naranja`_
- Pin 7: Blanco/Café
- Pin 8: Café

=== T568B:
- Pin 1: Blanco/Naranja
- Pin 2: _`Naranja`_
- Pin 3: Blanco/Verde
- Pin 4: Azul
- Pin 5: Blanco/Azul
- Pin 6: _`Verde`_
- Pin 7: Blanco/Café
- Pin 8: Café

== Explique la configuración de ambas normas, describiendo la función de cada color de los pares trenzados.

En redes Ethernet 10/100Base-T, solo se utilizan dos pares (4 hilos) para la comunicación: uno para transmitir (Tx) y otro para recibir (Rx) @techtarget.

- *Pines 1 y 2 (Tx):* Se utilizan para la transmisión de datos.
  - En T568A, corresponde al par Verde.
  - En T568B, corresponde al par Naranja.
- *Pines 3 y 6 (Rx):* Se utilizan para la recepción de datos.
  - En T568A, corresponde al par Naranja.
  - En T568B, corresponde al par Verde.
- *Pines 4, 5, 7 y 8:* No se utilizan en 10/100Base-T, pero son necesarios para Gigabit Ethernet (1000Base-T) y PoE (Power over Ethernet), donde se usan los cuatro pares.

== Explique la razón por la cual los pares se encuentran cruzados en un cable crossover.

Un cable cruzado (Crossover) se utiliza para conectar dispositivos del mismo tipo (ej. PC a PC, Switch a Switch sin Auto-MDIX). Esto es necesario porque ambos dispositivos intentan transmitir por los pines 1 y 2, y recibir por los pines 3 y 6. Si se usara un cable directo, la transmisión de uno chocaría con la transmisión del otro (Tx con Tx) @techtarget.

El cruce conecta los pines de transmisión (Tx) de un extremo con los pines de recepción (Rx) del otro extremo:
- Pin 1 (Tx) <-> Pin 3 (Rx)
- Pin 2 (Tx) <-> Pin 6 (Rx)

Esto se logra configurando un extremo con la norma T568A y el otro con la norma T568B.

== ¿Cuantas categorías de cable UTP existen? Explique las aplicaciones de cada categoría.

Existen varias categorías, siendo las más comunes actualmente @telco_data_categories:

- *Cat 5e (Enhanced):* Soporta velocidades de hasta 1 Gbps (Gigabit Ethernet) a 100 MHz. Es el estándar mínimo para redes domésticas y de oficina actuales.
- *Cat 6:* Soporta hasta 1 Gbps a 100 metros y 10 Gbps a distancias cortas (hasta 55 metros). Frecuencia de 250 MHz. Ideal para oficinas con mayor tráfico de datos.
- *Cat 6a (Augmented):* Soporta 10 Gbps a 100 metros. Frecuencia de 500 MHz. Tiene mejor aislamiento contra diafonía (crosstalk). Usado en centros de datos y redes corporativas de alto rendimiento.
- *Cat 7:* Soporta 10 Gbps a 100 metros con frecuencias de hasta 600 MHz. Cada par está blindado individualmente. Usado en aplicaciones industriales y centros de datos con alta interferencia.
- *Cat 8:* Soporta 25 Gbps o 40 Gbps a distancias cortas (hasta 30 metros). Frecuencia de hasta 2000 MHz. Diseñado principalmente para enlaces entre servidores en centros de datos.

= Desarrollo de la práctica

== Configuración del cableado T568-A y T568-B

=== Material a utilizar
- 2 cables UTP CAT 5e o CAT 6 de 1.0 mts.
- 6 conectores RJ45 para el tipo y categoría de cable que eligió.
- Pela cables de red
- Tester de continuidad para RJ45
- Crimpadora (ponchadora) para cable RJ45

== Pasos
=== Corte del cable
Para construir un cable de conexión directa de acuerdo a la configuración T568-A, corte un trozo de cable de par trenzado no blindado Cat. 5e o superior de una longitud de 1.0 metros.
#figure(
  image("media/foto1.jpg", width: 25%),
  caption: [
    Corte del cable
  ],
)

=== Retiro de protección
Retire 3 cm. de la protección plástica de uno de los extremos del cable UTP.
#figure(
  image("media/foto2.jpg", width: 25%),
  caption: [
    Retiro de protección
  ],
)

=== Ordenamiento de pares
Sostenga el cable, destrence y ordene los pares de hilos de modo que cumplan con el diagrama de color del cableado T568-B.
#figure(
  image("media/diagrama1.jpg", width: 25%),
  caption: [
    Diagrama T568-B
  ],
)
#figure(
  image("media/foto3.jpg", width: 25%),
  caption: [
    Ordenamiento de pares
  ],
)

=== Corte de hilos
Aplane, enderece y haga coincidir los hilos, luego recórtelos en línea recta alrededor de 1.20 cm. a 1.90 cm. del borde de la protección plástica del UTP.
#figure(
  image("media/foto4.jpg", width: 25%),
  caption: [
    Corte de hilos
  ],
)

=== Colocación del conector
Coloque un conector RJ-45 en el extremo del cable, con la lengüeta hacia abajo.
#figure(
  image("media/foto5.jpg", width: 25%),
  caption: [
    Colocación del conector
  ],
)

=== Verificación visual
Empuje suavemente los hilos dentro del conector hasta que pueda visualizar las puntas de cobre de éstos a través del extremo superior del conector. Asegúrese de que el forro plástico del cable también este dentro del conector aprox. 0.5 cms. y de que todos los hilos estén en el orden correcto de acuerdo a la norma.
#figure(
  image("media/foto6.jpg", width: 25%),
  caption: [
    Verificación visual
  ],
)

=== Ponchado
Utilice las pinzas para ponchado y apriete el conector con suficiente fuerza como para forzar los contactos a través del aislamiento en los hilos, completando así el camino conductor.
#figure(
  image("media/foto7.jpg", width: 25%),
  caption: [
    Ponchado
  ],
)

=== Segundo extremo
Repita los pasos 2 al 7 para construir el otro extremo del cable de conexión straight -through con la configuración T568-B.
#figure(
  image("media/foto8.jpg", width: 25%),
  caption: [
    Segundo extremo
  ],
)

=== Cable cruzado
Repita los pasos 2 al 9 para el otro tramo de cable UPT, pero ahora para la construcción de un cable de conexión crossover, utilizando la configuración T568-B en un extremo y para el otro la configuración T568-A.
#figure(
  image("media/foto9.jpg", width: 25%),
  caption: [
    Cable cruzado
  ],
)

=== Prueba con analizador
Finalmente pruebe los cables terminados empleando el analizador de continuidad ethernet.
#figure(
  image("media/foto10.jpg", width: 25%),
  caption: [
    Prueba con analizador
  ],
)
#figure(
  image("media/foto13.jpg", width: 25%),
  caption: [
    Prueba con analizador
  ],
)

=== Evidencia fotográfica
Incorpore una fotografía de los integrantes del equipo para evidencia que se presentaron a la práctica.
#figure(
  image("media/foto11.jpg", width: 25%),
  caption: [
    Evidencia fotográfica
  ],
)

Realice la práctica y documente para cada pregunta o ejercicio con fotos y capturas de pantallas para todos los puntos e incisos.

De los puntos 4 al 7 y en todos los incisos, deberá incorporarse un esquema, diagrama o ilustración referente a lo que se pregunta.

= Notas importantes
- Deberán anotar por orden alfabético en la portada de esta práctica, los nombres correctos y completos de cada integrante.
- Incorporar la fotografía de los integrantes del equipo. Identificándose en la foto con su nombre.
- *No se tomará en cuenta para la calificación de la práctica, aquellos integrantes que no aparezcan sus nombres en la portada. Una vez entregada la práctica, si se cometió un error u omisión ya no es posible corregirlo.*
- La práctica se elaborará y se entregará en equipo.
- Para validar esta práctica todos los alumnos deberán realizarla en tiempo real, durante la clase. (quien no la realice no será sujeto a evaluación).
- El archivo se nombrará con la siguiente nomenclatura: `Practica1_5CV50_equipo#` Donde \# es el número de equipo.
- La práctica será enviada al _Drive_ @drive_folder después de que termine la clase, el archivo fuente @github_repo y PDF.
- Se debe crear una Carpeta nombrada con el numero de su equipo ejemplo “Equipo 1”.
- La entrega de la practica es solo durante el tiempo de clase.
- Si no se cumple con algún requisito u observaciones antes señaladas, afectará en la calificación en la práctica.

#bibliography("media/bibliografia.bib", style: "apa")
