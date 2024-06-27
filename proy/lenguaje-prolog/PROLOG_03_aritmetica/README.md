# Aritmética

* Con el fin de aprovechar las posibilidades aritméticas de los computadores convencionales, el lenguaje Prolog
contiene una serie de predicados de evaluación aritmética.
* Al encontrar un objetivo de la forma “? X is E“ el sistema:
  * Evalúa la expresión E hasta obtener un valor aritmético v (si no puede, devuelve un error)
  * El objetivo se cumple si X unifica con v
* La expresión E puede contener los operadores aritméticos clásicos (+, -, *, mod, etc.) y valores numéricos. Si contiene variables, éstas deben estar instanciadas a un valor numérico en el momento de la evaluación.

| Consulta | Respuesta | Explicación |
| -- | -- | -- |
| ?- X is 3+5. | X = 8 | La evaluación de 3+5 se realiza internamente en una instrucción del procesador |
| ?- X is pepe. | Error al evaluar | Si la expresión no resulta en un valor aritmético, se obtiene un error |
| ?- 8 is 3+5. | Yes | |
| ?- 4 is 3+5. | No | |
| ?- X is 4/0. | Error aritmético | Al evaluar pueden producirse errores |
| ?- X is X + 1. | Error al evaluar | |
| ?- X = 3, Y is X + 5. | X = 3 , Y = 8 | |
| ?- X=0, X is X + 1. | No | |
| ?- X = 3 + 5. | X = 3 + 5 | El operador = unifica sus argumentos pero no evalúa |

```pl
par(X) :- 0 is X mod 2.
impar(X) :- 1 is X mod 2.
suma(X,Y,Z):- Z is X + Y.
```

| Consulta | Respuesta | Explicación |
| -- | -- | -- |
| ?- par(3). | No | |
| ?- par(4). | Yes | |
| ?- suma(2,3,V). | V = 5 | |
| ?- suma(2,V,5). | Error al evaluar | |

* Además del predicado is, los predicados de comparación realizan una evaluación aritmética de sus argumentos y
se cumplen si los valores obtenidos cumplen las relaciones correspondientes:

| Consulta | Respuesta | Explicación |
| -- | -- | -- |
| ?- 3+5 > 2+6. | No | |
| ?- 3+5 >= 2+6. | Yes | |
| ?- 3+5 < 2+6. | Yes | |
| ?- 3+5 =< 2+6. | Yes | |
| ?- 3+5 =:= 2+6. | Yes | Es el operador = pero evalua ambos lados antes |
| ?- 3+5 =\= 2+6. | No | |
