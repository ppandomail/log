# Algoritmos Genéticos (AG)

* Son métodos adaptativos que pueden ser utilizados para implementar búsquedas y problemas de optimización.
* Son una clase particular de algoritmos evolutivos.
* Su característica principal es que se basan en técnicas inspiradas en la evolución biológica.

![AG que son](img/ag-definicion.jpg)

## Elementos

* **Operadores genéticos**: son los diferentes métodos u operaciones que se pueden ejercer sobre una población y que nos permite obtener poblaciones nuevas.
* **Población**: conjunto de individuos (cromosomas). El método de AGs consiste en ir obteniendo de forma sucesiva distintas poblaciones.
* **Individuo**: es un cromosoma y es el código de información sobre el cual opera el algoritmo. Cada solución parcial del problema a optimizar está codificada en forma de cadena o string en un alfabeto determinado, que puede ser binario.

![AG mapa](img/ag-mapa.jpg)

## Funcionamiento

1. Establecimiento de la función objetivo y las restricciones iniciales. Medir la calidad de cada solución con respecto al problema a resolver.
1. Creación de la población inicial y aleatoria (cromosomas, que son la codificación de soluciones candidatas a un problema)
1. Evaluación de cada individuo. Asignar un valor de supervivencia a cada miembro de la población.
1. Si (se ha llegado a la solución óptima o el número máximo de generaciones) entonces FIN
1. Creación de una nueva población (generación) usando la reproducción (seleccionar padres y crear descendencia), combinación (de la descendencia con la población actual para crear nueva población) y mutación (alteración genética). Volver al punto 3.

![AG funcionamiento](img/ag-func1.PNG)

![AG funcionamiento](img/ag-func2.PNG)
