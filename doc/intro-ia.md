# Introducción a la IA

* Es la capacidad dada a una computadora para resolver una tarea con información obtenida a través del análisis de un contexto.
* Es la capacidad de una máquina para imitar el comportamiento humano a través de algoritmos sacando provecho de los datos y el poder computacional.
* Hace referencia a la forma en la que las máquinas aprenden y llevan a cabo acciones similares a las que un humano podría desempeñar, eliminando el margen de error que se espera de una persona.
* Un programa de IA consiste en obtener datos, procesarlos, generar una respuesta y tomar una decisión.
* Para mejorar las respuestas, el programa suele aprender e identificar patrones.

## Tipos de IA

* **Débil**: desarrollada para hacer una tarea en particular.
* **Fuerte**: creada para contar con habilidades cognitivas en un área.

* **Narrow IA**: realiza tareas específicas como reconocer un rostro o una voz. Ejemplo: Google Lens
* **General IA**: similar a la conducta humana, toma el conocimiento en lo que hasido entrenado y aprende algo nuevo. Ejemplo: Siri oo Alexa
* **Super IA**: es proyecto que permanece en la fantasía, pero se cree que superará la inteligencia de los humanos. Ejemplo: J.A.R.V.I.S. del universo Marvel.

## Agentes Inteligentes

* Es una entidad que basándose en su propio conocimiento, realiza un conjunto de operaciones destinadas a satisfacer las necesidades de un usuario o un programa.
* Es capaz de percibir su entorno con la ayuda de sensores y actuar en ese medio utilizando actuadores (elementos que reaccionan a un estímulo realizando una acción).
* ¿Por qué utilizar agentes? La utilización de agentes y técnicas multiagente permite la gestión inteligente de un sistema complejo, coordinando los distintos subsistemas que lo componen e integrando objetivos particulares de cada subsistema en un objetivo común.

* Funciones básicas de la tecnología de agentes:
  * Ejecución de tareas
  * Conocimiento de su entorno
    * Conocimiento a priori
    * Aprendizaje
  * Capacidad de comunicación
    * Con usuario
    * Inter-agente

* Clasificación:
  * **Agentes híbridos**: son la combinación de dos o más filosofías dentro de un agente simple. Están formados por una parte reactiva y otra deliberativa estructuradas en capas con diferentes niveles de abstracción.
  * **Agentes de búsqueda**: es un programa que, imitando el comportamiento de una persona y actuando de forma autónoma, recorre automáticamente internet aprovechando la estructura de enlaces de la web.
  * **Agentes reactivos**: representan una categoría especial de agentes que no poseen modelos simbólicos de su entorno. Este tipo de agentes actúa en función de los estímulos externos sin tener en cuenta el tiempo pasado del entorno ni el futuro del mismo. Responden de forma directa proporcionando un tiempo de respuesta y de proceso muy alto.
  * **Agentes de información**: necesita un campo de cobertura no muy amplio que le permita interactuar perfectamente con el medio en que se desarrolla y tienden a hacer transparente la complejidad almacenada en la red.
  * **Agentes móviles**: es el que lleva a cabo alguna tarea para el usuario y que al hacerlo, visita varios ordenadores de una red. El agente logra realizar esta función porque su código es copado en el ordenador remoto y se ejecuta allí.
  * **Agentes de interfaz**: son los que apoyan y dan asistencia, principalmente al usuario, para que aprenda a utilizar una aplicación en particular.

## Sistemas expertos (SE)

* Es un sistema informático que simula los procesos de aprendizaje, memorización, razonamiento, comunicación y acción de un experto humano en una determinada rama de la ciencia.

* Características:
  * **Habilidad para adquirir el conocimiento**: esto es igual a decir que el software haya sido bien diseñado.
  * **Fiabilidad**: que nos proporcione resultados con el menor número de errores posible.
  * **Capacidad**: poder responder al mayor número de problemas en su área.

* Clasificación:
  * **CBR** (Case Based Reasoning): es decir, razonamiento basado en casos.
  * **RBR** (Rules Based Reasoning): es el que viene dado por la sujeción a reglas preestablecidas.
  * **Basados en redes bayesianas**: aquí se fusionan el teorema de Bayes y la teoría de la probabilidad, con lo que se consigue un sinnúmero de variables aleatorias.

* Tareas que pueden realizar:
  * **Monitorización**: ser capaz de determinar en forma continua el estado en que esté funcionando el sistema donde se encuentra instalado.
  * **Planificación**: para ordenar de manera ideal actividades que requieren de un desenvolvimiento paso a paso.
  * **Simulación**: esta es la actividad primordial de un SE.
  * **Diseño**: útil para evitar omisiones en sectores donde la exactitud juega un rol primordial.
  * **Control**: el mantenimiento de las unidades donde se encuentran instalados los SE.
  * **Instrucción**: permite el aprendizaje y la corrección de errores.
  * **Recuperación de información**: su capacidad de razonar adecuadamente según la forma en que haya sido alimentado.

## Redes Neuronales Artificiales (RNA)

* Son modelos de la IA que se inspiran en el comportamiento de las neuronas y las conexiones cerebrales para resolver problemas.
* Es un modelo simplificado que simula cómo los cerebros de los seres vivos, en especial el humano, procesa información.
* Las RNA se inspiran en el sistema nervioso y el comportamiento biológico, creando un sistema de interconexión en capas de neuronas artificiales que colaboran para procesar datos de entrada y generar salidas.
* Las RNA se diferencian de otros modelos de IA en tener la capacidad de aprender en forma automática Este proceso también es conocido como machine learning o aprendizaje de máquina.

* Aplicaciones generales:
  * Sistemas inteligentes para la toma de decisiones en la gestión empresarial.
  * Predicción.
  * Reconocimiento de tendencias.
  * Reconocimiento de patrones y gestión de riesgo, aplicados por ejemplo en la detección de fraude.
  * Artefactos inteligentes con capacidad de aprendizaje, por ejemplo, parlantes inteligentes.
  * Hogar inteligente.
  * Vehículos autónomos y energías renovables.

* Perceptrón simple: es un modelo neuronal binario lineal que separa los resultados en solo dos grupos, aplicado para software IA de agrupación de datos binarios. Cuenta con:
  * Entradas x1, x2 y x3 (valores iniciales binarios: 0 y 1)
  * Pesos sinápticos w1, w2 y w3 correspondientes a cada entrada (valores entre -1 y 1 aleatorios)
  * Función de Iteración wj = wj + e(tj) \* xj (nuevo peso = peso actual + factor de aprendizaje \* valor esperado * entrada)
  * Función de activación f(x) = 1 si el resultado de fórmula es >= 0; caso contrario 0
  * Salida y (se espera obtener los valores esperados binarios)

  * Algoritmo:
    1. Ingresar los valores binarios.
    1. Realizar el cálculo iterativo de nuevos pesos hasta obtener los valores esperados.
    1. Obtener los valores esperados.

## Algoritmos Genéticos (AG)

* Son métodos adaptativos que pueden ser utilizados para implementar búsquedas y problemas de optimización.
* Son una clase particular de algoritmos evolutivos.
* Su característica principal es que se basan en técnicas inspiradas en la evolución biológica.
* Elementos:
  * **Operadores genéticos**: son los diferentes métodos u operaciones que se pueden ejercer sobre una población y que nos permite obtener poblaciones nuevas.
  * **Población**: conjunto de individuos (cromosomas). El método de AGs consiste en ir obteniendo de forma sucesiva distintas poblaciones.
  * **Individuo**: es un cromosoma y es el código de información sobre el cual opera el algoritmo. Cada solución parcial del problema a optimizar está codificada en forma de cadena o string en un alfabeto determinado, que puede ser binario.

* Funcionamiento:
  1. Establecimiento de la función objetivo y las restricciones iniciales. Medir la calidad de cada solución con respecto al problema a resolver.
  1. Creación de la población inicial y aleatoria (cromosomas, que son la codificación de soluciones candidatas a un problema)
  1. Evaluación de cada individuo. Asignar un valor de supervivencia a cada miembro de la población.
  1. Si (se ha llegado a la solución óptima o el número máximo de generaciones) entonces FIN
  1. Creación de una nueva población (generación) usando la reproducción (seleccionar padres y crear descendencia), combinación (de la descendencia con la población actual para crear nueva población) y mutación (alteración genética). Volver al punto 3.
