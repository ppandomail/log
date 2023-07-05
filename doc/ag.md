# Algoritmos Genéticos (AG)

* Son métodos adaptativos que pueden ser utilizados para implementar búsquedas y problemas de optimización.
* Son una clase particular de algoritmos evolutivos.
* Su característica principal es que se basan en técnicas inspiradas en la evolución biológica y genética.
* Utilizan reproducción, selección natural y mutación para resolver problemas complejos.

![AG que son](img/ag-definicion.jpg)

## Elementos

* **Operadores genéticos**: son los diferentes métodos u operaciones que se pueden ejercer sobre una población y que nos permite obtener poblaciones nuevas.
* **Población**: conjunto de individuos (cromosomas). El método de AGs consiste en ir obteniendo de forma sucesiva distintas poblaciones.
* **Individuo**: es un cromosoma y es el código de información sobre el cual opera el algoritmo. Cada solución parcial del problema a optimizar está codificada en forma de cadena o string en un alfabeto determinado, que puede ser binario.

![AG mapa](img/ag-mapa.jpg)

* Los operadores genéticos (recombinación y mutación) combinan y modifican soluciones existentes usando **principios lógicos**.
* La función de aptitud utiliza **lógica** para evaluar la calidad de las soluciones
* El proceso de selección se basa en **principios lógicos de selección natural**. El criterio de parada se define **lógicamente** para determinar cuándo detener el algoritmo.

## Funcionamiento

1. Establecimiento de la función objetivo y las restricciones iniciales. Medir la calidad de cada solución con respecto al problema a resolver.
1. Creación de la población inicial y aleatoria (cromosomas, que son la codificación de soluciones candidatas a un problema)
1. Evaluación de cada individuo. Asignar un valor de supervivencia a cada miembro de la población.
1. Si (se ha llegado a la solución óptima o el número máximo de generaciones) entonces FIN
1. Creación de una nueva población (generación) usando la reproducción (seleccionar padres y crear descendencia), combinación (de la descendencia con la población actual para crear nueva población) y mutación (alteración genética). Volver al punto 3.

![AG funcionamiento](img/ag-func1.PNG)

![AG funcionamiento](img/ag-func2.PNG)

## Áreas de aplicación

* Optimización
* Aprendizaje automatizado
* Diseño de productos y procesos
* Economía y finanzas
* Bioinformática
* Robótica y control

## Ventajas

* Exploración eficiente del espacio de búsqueda
* Capacidad para encontrar soluciones óptimas o subóptimas
* Adaptabilidad a problemas complejos con múltiples variables y restricciones
* Tolerancia a ruido o incertidumbre en los datos
* Potencial para la optimización multiobjetivo

## Desventajas

* Necesidad de definir una representación adecuada para el problema
* Posible convergencia prematura hacia una solución subóptima
* Requieren un número considerable de evaluaciones de la función objetivo
* Sensibilidad a la elección de parámetros y operadores
* No garantizan encontrar la solución óptima en todos los casos
