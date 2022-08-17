# Verificación Formal de Programas

## Enfoques

* Uno de los enfoques para determinar si un programa es correcto es establecer una actividad de testing. Esta consiste en seleccionar un conjunto de datos de entrada para determinar si los resultados producidos por el programa con esos datos coinciden o no con los valores esperados.
* El testing sólo puede mostrar la presencia de errores y no su ausencia.

* Otro enfoque, la prueba formal de programas, es una técnica que se basa en el cálculo de predicados.
* Consiste en justificar que un programa cumpla una especificación formal de su comportamiento.
* Es un método de validación estática en el que, partiendo de un conjunto axiomático, reglas de inferencia y algún lenguaje lógico (como la lógica de primer orden), se puede encontrar una demostración o prueba de correción de un programa, algoritmo, etc.
* Primero, se debe describir el comportamiento de cada instrucción del lenguaje
formalmente. Es decir, se debe definir la semántica de un lenguaje de programación en términos de
fórmulas lógicas.
* Para probar un programa, se debe expresar su semántica en términos de fórmulas
lógicas y luego probar que el programa significa lo mismo que su especificación.
* Una prueba formal de un programa asegura que el programa es correcto con respecto a una especificación para todas las entradas.
* Hay dos problemas importantes con la prueba formal de programas:
  1. la manipulación lógica puede ser tediosa y propensa a errores;
  2. la prueba solamente muestra que el programa implementa la especificación correctamente. No hay certeza de que la especificación describe lo que el usuario realmente desea.

## Estado de un programa

* Si un programa usa n variables (x1, x2, ..., xn) el estado s es una tupla de valores (X1,
X2, ..., Xn) donde Xi es el valor de la variable xi.
* Ejemplo:
  * Dado el estado s = (x, y) = (7, 8),
  * El resultado de ejecutar la sentencia de asignación x := 2*y+1 es el estado ...
  * s’= (x, y) = (17, 8)
* Una variable se usa en un programa para describir una posición de memoria que puede contener
valores diferentes en diferentes estados.
* Una manera de describir un conjunto de estados es utilizando fórmulas del cálculo de predicados.

## Predicado característico de un conjunto de estados de un programa

* Sea U el conjunto de todos los posibles estados del programa y sea S ⊆ U.
* Se define Ps, el predicado característico de S, tal que S = { s’ ∈ S / Ps(s’) }.
* Es decir, es el predicado que solamente es satisfecho por los estados que pertenecen al conjunto S.
* Por ejemplo, en vez de decir que la sentencia x:= 2*y+1 transforma el estado s = (x, y) en el estado s’= (2*y+1, y), definiremos predicados P(x, y) y P’(x’, y’) tal que si P(x, y) es verdadero en el estado s entonces P’(x’, y’) será verdadero después de ejecutar la sentencia x := 2*y+1.
* Ejemplo:
  * Se quiere probar x ≤ 7 después de ejecutar x := 2*y+1. Esto es verdadero si 2*y+1 ≤ 7
antes de ejecutar la sentencia, es decir y ≤ 3.
  * { y ≤ 3 } x := 2*y+1 { x ≤ 7 }
  * { y ≤ 3 } y { x ≤ 7 } se denominan aserciones.

## Aserción

* Es una fórmula del cálculo de predicados ubicada en un programa, que es verdadera cada vez que el programa pasa por ese punto.

## Espeficación formal de un programa

* {P} S {Q}, donde P y Q son aserciones llamadas pre-condición y post-condición respectivamente y S es un fragmento de programa.
* Se interpreta como sigue: si la ejecución de S empieza en un estado caracterizado por P y S termina, entonces terminará en un estado caracterizado por Q.
* S se dice parcialmente correcto con respecto a P y Q.
* Si además se garantiza que S termina, S es totalmente correcto con respecto a P y Q.
* {P} S {Q} se denomina especificación formal de S.

## Ejemplo 1

* Dados dos números naturales a y b, b ≠ 0, encontrar el cociente entre a y b.
  * P: { a, b ∈ N ∧ b > 0}
  * S: c = a/b
  * Q: { a = b*c + r ∧ 0 ≤ r < b ∧ c ≥ 0 }

## Ejemplo 2

* Encontrar el valor máximo de un arreglo de n números enteros.
  * P: {∀i: 1 ≤ i ≤ n: (integer(a[i]) ∧ a[i] = A[i]) } A referencia el valor de los elementos del arreglo a antes de iniciar la ejecución
  * Q: {∃i: 1 ≤ i ≤ n: (max = a[i] ∧ ∀j: 1 ≤ j ≤ n: (a[j] ≤ max ∧ a[j] = A[j] ))}

## continua

* Volviendo al ejemplo { y ≤ 3 } x := 2*y+1 { x ≤ 7 },
* { y ≤ 3 } no es la única pre-condición que hace verdadera la post-condición después de la ejecución de la sentencia de asignación.
* Otra precondición podría ser { y = 1 ∨ y = 3}. Pero esta última es menos interesante porque no caracteriza todos los estados desde los cuales se puede alcanzar un estado caracterizado por la post-condición.
* Se desea determinar como pre-condiciones aquellas fórmulas que describan tantos estados como sea
posible. Esto se hace eligiendo el predicado menos restrictivo posible.

## Fórmulas debiles y fuertes

* Una fórmula A es más débil que una fórmula B si B → A (B es más fuerte que A).
* Como A es más débil que B, A describe más estados que B.
* Una aserción es una fórmula del cálculo de predicados; como casos especiales se pueden distinguir
las fórmulas T (true) y F(false).
* Como T es verdadero en todo estado, es la más débil entre las fórmulas.
* F es más fuerte que toda fórmula.
* Por ejemplo, y ≤ 3 es más débil que (y = 1 ∨ y =3) porque (y = 1 ∨ y =3) → y ≤ 3

## Predicado transformador

* Para todo fragmento de programa S y fórmula Q, se define la pre-condición más débil
R = wp(S, Q) tal que {R} S {Q} es verdadero. Es decir, wp(S, Q) representa todos los estados tal
que la ejecución de S que comenzó en cualquiera de ellos, si termina, termina en un estado que
satisface Q.
* La notación {P} S {Q} (definida anteriormente) es otra notación para P → wp(S, Q).
* wp se denomina también predicado transformador, ya que para cualquier fragmento de programa
define una transformación de un predicado post-condición en un predicado pre-condición.
* Es decir, en vez de describir cómo un programa transforma un conjunto de estados iniciales en un conjunto de estados finales, describe cómo un programa transforma un predicado post-condición, que
caracteriza el conjunto de estados finales, en un predicado pre-condición que caracteriza el conjunto de estados iniciales.
* Esto significa que para probar formalmente un programa se comenzará desde la
post-condición y se trabajará “hacia atrás” para verificar cada una de las sentencias individuales del programa.

### Predicado wp para un lenguaje de programación con una sentencia de asignación

* La regla de asignación requiere que las variables implicadas no compartan el mismo espacio de memoria. Esto excluye el uso de punteros y de variables con índices (arrays).
* Las sentencias de asignación son sentencias de la forma V := E, en donde V es una variable y E es una expresión.
* Si S es una sentencia de la forma V := E con la postcondición {Q}, entonces la precondición de S puede hallarse sustituyendo todos los caso de V en Q por E.
* wp(V := E, Q) = Q {V/E}

#### Ejemplo 1

* wp(y = b, y ≥ 0}
* (y ≥ 0) {y/b}
* b ≥ 0

#### Ejemplo 2

* wp(x = x+1, x = 5)
* (x = 5) {x/x+1}
* (x+1 = 5)
* (x = 4)

#### Ejemplo 3

* wp( i = 2*i,  i < 6)
* (i < 6) {i/2*i}
* 2*i < 6
* i < 6/2
* i < 3

### Predicado wp para un lenguaje de programación con una secuencia de sentencias de asignación

* La concatenación significa que las partes del programa se ejecutan secuencialmente de tal forma que el estado final de la primera parte de un código se convierte en el estado inicial de la
segunda parte del programa.
* Sean S1 y S2 dos partes de un código y sea S1;S2 su concatenación.
* Si {P}S1{R} y {R}S2{Q} Son ternas de Hoare correctas entonces se puede afirmar que:

* wp(S1; S2, Q) = wp(S1, wp(S2, Q))

#### Ejemplo

* Calcular la pre-condición más débil del siguiente fragmento de programa:
  * x = x+1;
  * y = y+2
  * {x < y}

* wp(x = x+1; y = y+2, x < y)
* wp(x = x+1, wp(y = y+2, x < y))
* wp(x = x+1, x < y+2)
* x < y+1

* Esto se puede escribir también como sigue
  * { x < y+1 }
  * x = x+1;
  * { x < y+2 }
  * y = y+2
  * { x < y }

### Predicado wp para un lenguaje de programación con sentencia condicional (if B S1 else S2)

* wp(if B S1 else S2, Q) = (B → wp(S1, Q)) ∧ (¬B → wp(S2, Q))

#### Ejemplo

* Calcular la pre-condición más débil del siguiente fragmento de programa:
  * if y = 0
  * x = 0
  * else
  * x = y – 1
  * { x = y }

* wp(if y = 0 x = 0 else x = y-1, x = y)
* ( y = 0 → wp(x = 0, x = y)) ∧ (¬(y = 0) → wp(x = y-1, x = y))
* ( y = 0 → y = 0) ∧ (y ≠ 0 → y-1 = y)
* T ∧ (y ≠ 0 → F)
* (y ≠ 0 → F)
* (¬(y ≠ 0) ∨ F)
* ¬(y ≠ 0)
* (y = 0)
Por lo tanto la pre-condición más débil es P: { y = 0 }
