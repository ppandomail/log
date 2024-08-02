# Lógica de Predicados

## Ejercicios

1. Sea el lenguaje de primer orden L que tiene un símbolo de constante c, dos símbolos de función f y g (f unario y g binario) y dos símbolos de relación binarios P y Q. Decidir cuáles de las siguientes expresiones pertenecen al lenguaje y cuáles no. Para el primer caso determine cuáles son términos, cuáles fórmulas atómicas y cuáles fórmulas. Para las que no pertenecen al lenguaje indique por qué.
    1. (∃f(x)P(f(x,y)))
    1. ∀x (P ∨ Q)
    1. g(f(x),f(y))
    1. ∀x ∃cP(x,c)
    1. ∃x ∃yQ(P(x,y),P(y,x))
    1. P(f(x),f(y))

    ```plain
    (1) (∃f(x)P(f(x,y))) -> no pertenece porque f es unario
    (2) ∀x(P ∨ Q) -> no pertenece porque P y Q son binarios
    (3) g(f(x),f(y))
    Ter(L)={x,f(x),y,f(y),g(f(x),f(y))}
    At(L)=Ter(L)
    Fn(L)=Ter(L)=At(L)
    (4) ∀x∃cP(x,c)
    Ter(L)={x,c}
    At(L)=Ter(L)U{P(x,c)}
    Fn(L)=At(L)U{∀x∃cP(x,c)}
    (5) ∃x∃yQ(P(x,y),P(y,x)) -> No pertenece porque una relación no puede recibir como entrada otra relación
    (6) P(f(x),f(y)) -> no pertenece porque P es binario
    ```

1. Para cada una de las siguientes fórmulas: Determine el alcance de cada cuantificador e indique cuáles son las variables libres y cuáles las ligadas. Determine si es o no cerrada.
    1. ∀x(P(x,y)→Q(x))
    1. ∀xP(x,y)→Q(x)
    1. ∃x(A(x,y)∧∀yB(y))
    1. ∀x(∀yA(x,y,z)→∃xA(x,z,z))

    ```plain
    1. ∀x(P(x,y)→Q(x))
      el alcance del cuantificador es (P(x,y)→Q(x))
      var libre = {y} y var ligada = {x}
      no es cerrada ya que tiene una variable libre
    2. ∀xP(x,y)→Q(x)
      el alcance del cuantificador es P(x,y)
      var libre = {y} y var ligada = {x}
      no es cerrada ya que tiene una variable libre
    3. ∃x(A(x,y)∧∀yB(y))
      el alcance del ∃ es (A(x,y)∧∀yB(y)) y del ∀ es B(y)
      var libre no hay y var ligada = {x,y}
      es cerrada por no hay variables libres
    4. ∀x(∀yA(x,y,z)→∃xA(x,z,z))
      el alcance del ∀x es (∀yA(x,y,z)→∃xA(x,z,z)), el del ∀y es A(x,y,z) y el del ∃ es A(x,z,z)
      var libre = {z} y var ligada = {x,y}
      no es cerrada ya que tiene una variable libre
    ```

1. Para cada una de las siguientes fórmulas, realice las sustituciones indicadas.
    1. A = ∀x(P(x, y) -> Q(x))      ...  A(y/f (c)) para c constante
    1. A = ∀x(P(x, y) -> Q(x))      ...  A(y/f (x))
    1. A = ∀x(P(x, y) -> Q(x))      ...  A(x/f (c)) para c constante
    1. A = ∃x(D(x, y) ∧ ∀yB(y, z))  ...  A(y/f(c), z/c) para c constante
    1. A = ∃x(D(x, y) ∧ ∀yB(y, z))  ...  A(y/f(z), z/y)

    ```plain
    1. ∀x(P(x, f(c)) → Q(x)
    2. ∀x(P(x, f(x)) → Q(x))
    3. ∀x(P(f(c), y) → Q(f(c)))
    4. ∃x(D(x, f(c)) ∧ ∀f(c) B(f(c), c))
    5. ∃x(D(x, y) ∧ ∀f(z) B(f(z), y))
    ```

1. Formalice en el cálculo de predicados de primer orden las siguientes oraciones del lenguaje natural, usando funciones siempre que sea posible:
    1. El padre de Bárbara ama a su madre.
    1. Pedro ama a la hermana de María.
    1. Todo padre quiere mucho a sus hijos.

    ```plain
    1. padre (x, Bárbara)  ama(padre(Bárbara), madre(Bárbara))   ∃b A(p(b), m(b))
    2. ∃p ∃m A(p, h(m))
    3. ∀p ∀h quiere(p, h)
    ```

1. Formalice en el cálculo de predicados de primer orden las siguientes oraciones del lenguaje natural:
    1. Algunos caballos son salvajes.
    1. No hay un número primo entre 23 y 29.
    1. No todos los pájaros pueden volar.
    1. Cada persona es amada por alguien.
    1. Todas las personas tienen algún amigo.

    ```plain
    1. ∃c / s(c)
    2. ~∃n entre(23, 29, primo(n))
    3. ∃p volar(p)
    4. ∀p ∃a amada(p, a)
    5. ∀p  ∃a tiene(p, a)
    ```

1. Dados los siguientes predicados, reescriba en lenguaje natural las siguientes fórmulas del cálculo de predicados
    * real(x) x es un número real
    * int(x) x es un número entero
    * primo(x) x es un número primo
    * par(x) x es un número par
    * impar(x) x es un número impar
    * mayor(x,y) x es mayor que y
    * suma(x,y,z) x+y=z
    * resta(x,y,z) x−y=z
    * mult(x, y, z) x ∗ y = z
    * div(x, y, z) ⌊x/y⌋=z
    * pos(x) x es un número positivo
    * factor(x,y) x es factor de y

    1. ∀x(¬par(x) -> primo(x))
    1. ∀x(int(x) -> real(x))
    1. ∀x(primo(x) ∧ mayor(x, 2) -> impar(x))
    1. ∃x(int(x) ∧ par(x) ∧ primo(x))
    1. ∀x∀y∃z(int(x) ∧ int(y) -> int(z) ∧ suma(x, y, z))
    1. ∃z∀x∀y(int(x) ∧ int(y) -> int(z) ∧ suma(x, y, z))
    1. ∀x∀y∃z(int(x) ∧ int(y) ∧ int(z) ∧ div(x, y, z) -> mult(y, z, x))
    1. ∃x∀y(int(x) ∧ int(y) -> ∃z(int(z) ∧ pos(z) ∧ resta(x, y, z)))
    1. ∀x∀y(real(x) ∧ real(y) ∧ pos(x) ∧ ¬pos(y) -> mayor(y, x))
    1. ∀x∀y(real(x) ∧ real(y) ∧ pos(x) ∧ ¬pos(y) -> factor(x, y)

    ```plain
    1. Todo número impar es primo.
    2. Todo número entero es real.
    3. Todo número primo mayor que 2 es impar
    4. Existe un número entero que es primo y es par a la vez
    5. Para toda suma de dos números enteros existe como resultado un número  entero.
    6. Existe un número entero que es el resultado de sumar otros 2.
    7. Para toda división de dos números enteros existe un número entero como resultado el cual si multiplicamos por  su divisor nos da su dividendo que es un entero.
    8. Existe una resta en donde existe un minuendo y cualquier sustraendo ambos siendo enteros su resultado es un entero positivo.
    9. Para todo número real negativo mayor que un real positivo.
    10. Para todo número real positivo es factor de un real no positivo.
    ```

1. Formalice en el cálculo de predicados de primer orden las siguientes oraciones en lenguaje natural, primero sin utilizar cuantificadores existenciales y después sin utilizar cuantificadores universales
    1. Algunas personas son simpáticas o altas.
    1. No todas las bicicletas tienen dos ruedas.
    1. Ningún ratón es más pesado que un elefante.
    1. Todo número es negativo o posee raíz cuadrada.

    ```plain
    1. Algunas personas son simpáticas o altas. 
    Sin ∃ - ¬∀x(S(x) v A(x))
    Sin ∀ - ∃x(S(x) v A(x))
    2. No todas las bicicletas tienen dos ruedas.
    Sin ∃ - ¬∀b(T(b, 2x))
    Sin ∀ - ∃b¬(T(b, 2x))
    3. Ningún ratón es más pesado que un elefante. 
    Sin ∃ - ∀r, e  ¬pesado(r, e)
    Sin ∀ - ¬∃r, pesado(r, e)
    4. Todo número es negativo o posee raíz cuadrada.
    Sin ∃ - ∀n negativo(n) v raiz2(n)
    Sin ∀ - ∃n negativo(n) ^ ¬raiz2(n)
    ```

1. Formalice en el cálculo de predicados de primer orden las siguientes oraciones del lenguaje natural:
    1. No todos los individuos son alumnos.
    1. No existe ningún individuo que sea alumno.
    1. No existe ningún profesor que sea alto.
    1. Existe un profesor que está más ocupado o tiene más éxito que cualquier alumno.
    1. Si todos los individuos son alumnos, no existe ninguno que vaya al gimnasio.

    ```plain
    1. ∃i / alumno(i)
    2. ∀i / ¬alumno(i)
    3. ∀p / ¬alto(p)
    4. ∀a, ∃p / ocupado(p, a) v exitoso(p, a)
    5. ∀i, alumno(i) ^ gimnasio(i)
    ```

1. Formalice los siguientes argumentos en el cálculo de predicados de primer orden:
    1. Cualquiera que estudie y haga deporte es amigo de Pedro. Si María es perezosa no es amiga de Pedro, pero si no lo es, trabajará con Hernán. Sabemos que nadie trabaja con Hernán. Por lo tanto, María no estudia o no hace deporte.
    1. A todos los gatos les gusta el queso o los ratones o ambas cosas. Blanco y Negro son gatos. A nadie que le gusta el queso le gusta el jamón. Únicamente a los que les gusta la gaseosa les gustan los ratones. A Blanco no le gusta lo que le gusta a Negro, y sí le gusta lo que no le gusta a Negro. A Blanco le gusta el jamón y la gaseosa. Por lo tanto, hay un gato al que le gusta el queso y no le gustan los ratones.

    ```plain
    1. ∀x / estudie(x) ^ deporte(x) => ~amigo(x, Pedro)
    ```

1. Sea el lenguaje de primer orden L que tiene dos símbolos de constante c, d, y un símbolo de relación binario P, y dado el modelo M = <D, {P}, {}, {c, d}> donde D = N (conjunto de los números naturales) es el dominio P^N(x, y)={(x, y) ∈ N × N : x ≤ y}; c^N = 0; d^N = 1. Determine y justifique si las siguientes afirmaciones son o no correctas:
    1. P(c, x) es válida bajo una valuación en M.
    1. P(c, x) es válida en M.
    1. ∀xP(c, x) es lógicamente válida.
    1. ∀x∃yP(x, y) es válida en M.
    1. ∃y∀xP(x, y) es válida en M.
    1. P(d, c) ∧ ¬P(d, c) es contradictoria.

    ```plain
    1. Es válida Ej: P(0, 1) 0 E N ^ 1 E N ^ 0 <= 1
    2. Es válida Ej: P(0, 1) 0 E N ^ 1 E N ^ 0 <= 1
    3. Es válida ∀xP(c, x) no importa cuanto valga x siempre va a ser >= a c
    4. Es válida ∃y∀xP(x, y) es válida en M Ej: P(2,4) 2<= 4
    5. Es válida ∃y∀xP(x, y) es válida en M Ej: P(2,4) 2<= 4
    5. Es válida P(d, c) ∧ ¬P(d, c) entonces (1 <= 0) ^ ~( 0 <=1)
    ```

1. Sea L un lenguaje de primer orden que tiene un símbolo de constante c, un símbolo de relación unaria A, un símbolo de relación binaria B y un símbolo de función unaria f. En el lenguaje L sea el modelo M = <D, {A, B}, {f}, {c}> donde D = {1, 2, 3}; A^D = {1}; B^D = {(1, 1), (2, 2), (3, 3), (1, 2), (2, 1)}; f^D(1) = 1; f^D(2) = 3; f^D(3) = 2; c^D = 2. Determine si cada una de las siguientes fórmulas es válida bajo una valuación, válida, o falsa en el modelo dado. Justifique en cada caso.
    1. ∀xB(x, x) -> ∃x∃y(B(x, y) ∧ B(f(y), x))
    1. ∀x(B(x, y) -> B(f(x), f(y)))
    1. ∃x(B(x, f(y)) -> ¬A(x)) ∨ ∀x¬A(x)
    1. ∀x(¬B(x, y) -> A(x))

    ```plain
    1. Es válido. Existe: x = 1, y = 1 B(1, 1) ∧ B(f(1), 1)) 
    2. Es falsa porque si x = 1, y = 3 en B no existe (1, 3)
    3. No es válida porque A solo tiene al 1
    4. No es válida, no existe B(1, 3)
    ```

1. Defina al menos dos modelos para un lenguaje de primer orden con únicamente un símbolo de relación binario P, y traduzca las fórmulas dadas a oraciones apropiadas en lenguaje natural:
    1. ∀x ∀y(P(x, y) -> P(y, x))
    1. ∀xP(x, x)
    1. ∀x ∀y ∀z(P(x, y) ∧ P(y, z) -> P(x, z))

1. Sea el lenguaje de primer orden L que tiene un símbolo de constante c, un símbolo de función unaria f1, dos símbolos de funciones binarias f2 y f3, dos símbolos de predicados binarios P1 y P2, y dado el modelo M1 = <N, {=, <}, {suc, +, ∗}, {0}> donde D = N (conjunto de los números naturales) es el dominio; c^N = 0; P1^N(x, y) = {(x, y) ∈ N × N : x = y}; P2^N(x, y) = {(x, y) ∈ N × N : x < y}; f1^N(x) = suc(x) = x + 1; f2^N(x, y) = x + y; f3^N(x, y) = x ∗ y
    1. Traduzca las siguientes fórmulas a oraciones apropiadas en lenguaje natural:
        * P2 (c, f1(f1(c)))
        * ∀x1P2(x1, f1(x1))
        * ∀x1 ∃x2P1(x2, f3(x2,x1))
        * ∃x1 ∀x2P1(f1(x2), x1)
        * ∀x1 ∀x2P1(x1, x2) -> P1(x2, x1)
    1. Determine si cada una de las fórmulas del inciso anterior es válida bajo una valuación, válida o falsa en el modelo dado.
    1. Usando el lenguaje dado represente cada una de las siguientes proposiciones:
        * 0 no tiene sucesor.
        * 0 es el predecesor de 1.
        * Todo número natural tiene un sucesor.
        * Si dos números tienen el mismo sucesor son iguales.
        * El sucesor del sucesor de cualquier número es mayor que el sucesor de ese mismo número.

    ```plain
    1. 
    P2 (c, f1 (f1(c)))  “El sucesor del sucesor de 0 es mayor a 0”
    ∀x1P2(x1, f1(x1)) “Todo número es menor al sucesor del mismo número”
    ∀x1 ∃x2 P1(x2, f3(x2, x1)) “Todo número “a” tiene un número “b” donde la multiplicación entre un número “a” y “b” es igual al número “a”
    ∃x1 ∀x2 P1(f1(x2), x1) “Existe un número donde el sucesor es igual a cualquier número”
    ∀x1 ∀x2 P1(x1, x2)→P1(x2, x1) “Si dos números son iguales, entonces son conmutativos”

    2.

    3.
    0 no tiene sucesor:  ¬∃ f1(0)
    0 es el predecesor de 1: 
    Todo número natural tiene un sucesor : ∀xf1(x)
    Si dos números tienen el mismo sucesor son iguales: ∀x,y P1(f1(x), f2(y))
    El sucesor del sucesor de cualquier número es mayor que el sucesor de ese mismo número: ∀x P2(f1(x)),f1(f1(x)))
    ```

1. Sea L un lenguaje de primer orden que tiene dos símbolos de constante c y d, cuatro símbolos de relación binaria A, B, C y E, un síımbolo de función binaria f, y un símbolo de función unaria g. En el lenguaje L, sea el modelo M = <D, {A^D, B^D, C^D, E^D}, {f^D, g^D}, {c^D,d^D}> donde D = {x ∈ {a, b}*  y  x ̸= ε}; c^D = a; d^D = b; g^D(x) = x^R (reversa de x); f^D(x, y) = x.y (x concatenada con y); A^D(x, y) = {(x, y) ∈ D^2 : x es prefijo de y} (es decir y = x.z para z ∈ {a,b}∗); B^D(x, y) = {(x, y) ∈ D^2 : x es subcadena de y}; C^D(x, y) = {(x, y) ∈ D^2 : x = y}; E^D(x, y) = {(x, y) ∈ D^2 : x tiene la misma longitud que y}. Determine si cada una de las siguientes fórmulas es válida, válida bajo una valuación o falsa en el modelo dado. Justifique en cada caso. Para las fórmulas válidas bajo una valuación, dé una valuación que las satisfaga.
    1. ∃y(E(x, y) ∧ A(y, x) -> C(x, y))
    1. ∀xE(x, g(x)) ∧ ∃x ∃y(A(x, y) ∧ ¬B(x, y))
    1. ∀y ∃x(A(x, y) -> A(g(x), g(g(y))))
    1. ∀x ∃yB(y, x) -> ∀x ∃yC(x, g(y))

1. Sea L un lenguaje de primer orden que tiene un símbolo de constante c, un símbolo de relación binaria A. En el lenguaje L sea el modelo M = <D, {A}, {}, {c} > donde D = {María, Juan, Luis}; A^D = {(María, María), (Juan, María), (Luis, María)}; c^D =María Y dada la siguiente oración en lenguaje natural: "Nadie que admire a los que admiran a María, la admira a ella". Formalícela en el cálculo de predicados y analice su validez en el modelo dado. En caso de que no sea válida, y de ser posible, proponga una modificación al modelo dado para que sí lo sea.

    ```plain
    No es válida. 
    M = <D, {A}, {}, {c}> donde D = {María, Juan, Luis}; A^D = {(Juan, María),(Luis, Juan),(Juan, Luis),(Luis, María)}; c^D = María
    ∀a , am A(a,am) ^ A(a,c) => ~A(a,c)
    ```

1. Defina para cada una de las siguientes fórmulas un modelo en donde sea válida y un modelo en donde sea falsa (cuando sea posible). Justifique la elección del modelo en cada caso.
    1. ∀xR(x) -> ∃xR(x)
    1. ∃x ∀yA(x, y) -> ∀x ∃yA(x, y)
    1. ¬∃x(¬(D(x) ∨ D(x))
    1. ∃xA(x, y) -> ∀xA(x, y)
    1. ∀x(A(x) ∨ B(x)) -> ∀xA(x) ∨ ∀xB(x)
    1. ∃xA(x) ∨ ∃xB(x) -> ∃x(A(x) ∨ B(x))

    ```plain
    1.
    Modelo válido - <D, {R}, {},{}> D = var R= {(a),(b)...}
    Modelo invalido - <D, {R}, {},{}> D = var  R= {(a,b),(b,a)...}
    2.
    Modelo válido - <D, {A}, {},{}> D={x, y}  A={(x,y)}
    Modelo invalido - <D,{A},{},{}> D={x} A={(x,y)}
    3. 
    Modelo válido - <D, {D}, {},{}> D={x}  D={(x)}
    Modelo invalido - <D,{A},{},{}> D={x,y} D={(x,y)}
    4.
    Modelo válido - <D, {D}, {},{}> D={x,y}  A={(x,y)}
    Modelo invalido - <D,{A},{},{}> D={x,y,z} D={(x,y,z)}
    5. 
    Modelo válido - <D, {A,B},{},{}> D={x}  A={(x)} B = {(x)}
    Modelo invalido - <D,{A},{},{}> D={x,y,z} D={(x,y,z)}
    6.
    Modelo válido - <D, {A,B},{},{}> D={x}  A={(x)} B = {(x)}
    Modelo invalido - <D,{A},{},{}> D={x,y,z} D={(x,y,z)}
    ```

1. Sea L un lenguaje de primer orden que tiene un símbolo de constante c, un símbolo de relación binaria A y un símbolo de función binaria f. En el lenguaje L sea el modelo M = <D, {A}, {f}, {c}> donde D = N (conjunto de los números naturales); A^D ={(x, y) ∈ N^2 : x ≥ y}; f^D(x, y) = {z ∈ N : (x, y) ∈ N^2; z=x+y}; c^D = 0. Escribir en todos los casos que sea posible (cuando no sea posible fundamentar por qué), fórmulas bien formadas en el lenguaje L que sean:
    1. falsa en M, pero no contradictoria.
    1. contradictoria
    1. válida bajo una valuación en M, pero no válida en M
    1. válida en M, pero no válida bajo una valuación en M

1. Para cada una de las siguientes fórmulas, encuentre si es posible un modelo en el cual la última fórmula sea falsa pero las primeras sean válidas:
    1. ∃xA(x) -> ∃xB(x), B(a), ∀x(A(x) -> B(x)) siendo a constante
    1. ∀x ∀y(A(x) ∧ A(y) -> C(x, y)), ∃xA(x), ∃xA(f(x)), ∃xC(f(x), x)

    ```plain
    1. <D, {A, B}, {}, {a}>; B={(a),(1)}; A={(1)}; D={1, 2, 3}
    2. <D, {A, C}, {f}, {}>; f={(1, 1)}; A={(1), (2), (3)}; C={(1, 2), (2, 1),(1, 1), (2, 3), (3, 2), (2, 2), (3, 1), (1, 3), (3, 3)}; D={1, 2, 3}
    ```

1. Convierta cada una de las siguientes fórmulas a la forma prenexa:
    1. ∀xA(x) -> ∃x ∀y(B(x) ∧ C(x, y))
    1. ∀z(∃x ∀y(A(x, y) ∧ B(y, z)) -> ∃xC(x ,z))
    1. ∀x(∀y(A(x, y) -> ∃zB(y, z)) -> ∀z ∃xC(x, z))
