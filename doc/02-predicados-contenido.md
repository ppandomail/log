# Lógica de Predicados

## Motivación

* p: Todo natural es entero y q: 2 es un natural. r: Luego 2 es entero
* p, q ⊨ r   es claramente un razonamiento válido pero no es posible demostrarlo desde la Lógica Proposicional
* La Lógica proposicional NO es suficientemente expresiva para captar esta relación
* La validez del razonamiento depende de la estructura interna de las proposiciones ==> debe expresarse usando Lógica de Predicados
* ∀ x (x ∈ N → x ∈ Z)
  * 2 ∈ N entonces 2 ∈ Z

## Lenguaje de Primer Orden

* Símbolos para denotar individuos
  * constantes (ej. 2, Juan, bicicleta)
  * variables (ej. x1, x2, ... o x, y, z, etc.)
  * funciones (ej. sucesor, +, \*, para definir nuevos individuos como sucesor(2), (1+1), (2*1) )
* Símbolos de relaciones {entero(x), hermano(x, y)}
* Conectivos proposicionales {¬, ∧, ∨, ->}
* Cuantificadores {existencial, universal}

* Alfabeto básico consta de los siguientes símbolos:
  * **Símbolos comunes a todo lenguaje**:
    * Variables: Var = {x, y, z, x1, x2, ...}
    * Conectivos: {¬, ∧, ∨, ->}
    * Cuantificadores:  {∀ (universal),  ∃ (existencial)}
    * Símbolos auxiliares: {(, )}
  * **Símbolos propios de cada lenguaje**:
    * Conjunto de símbolos F, símbolos de funciones n-arias, n>=1  f, g, h
    * Conjunto de símbolos C, símbolos de constantes   a, b, c
    * Conjunto de símbolos R, símbolos de relaciones o predicados n-arios, n>=1  P, Q, R

* Caracterizado por sus símbolos propios L = \<R, F, C>  puede ocurrir R = {}, F = {}, o C = {}
* Ejemplo: Sea L1 = <R, F, C>
  * R = {P, Q}    P unario, Q binario
  * F = {f}       f unaria
  * C = {}

  * Fórmulas bien definidas en L1
    * Q(x, x) ∧ ∃xP(x)
    * ∀x(P(x) → Q(f(x), x))

* Ejemplo: Sea L2 = <R, F, C>
  * R = {P}       P binario
  * F = {f, g}    f unaria, g binaria
  * C = {a, b}

  * Fórmulas bien definidas en L2
    * P(f(a), b) → ∀xP(x, b)
    * ∃x(P(x, a) ∧ P(g(x, b), x))

## Términos

* Dado L = <R, F, C>
* Términos de L   Ter(L)   (representan elementos del dominio)
  * C ⊆ Ter(L)    es decir, toda constante es un término
  * Var ⊆ Ter(L)  es decir, toda variable es un término
  * Si t1, t2, ..., tn ∈ Ter(L) y f ∈ F es un símbolo de función n-aria, entonces f(t1, t2, ..., tn) ∈ Ter(L)

* Ejemplos: Sea L2 = <R, F, C>
  * R = {P}     P binario
  * F = {f, g}  f unaria, g binaria
  * C = {a, b}

  * Ter(L2) = {a, b, x, y, ..., f(a), g(a, b), ...}
    * a, b (las C son términos)
    * x, y, ... (las var son términos)
    * f(a), g(a, b), ... (las f son términos)

## Fórmulas Atómicas

* Dado L = <R, F, C>
* Fórmulas Atómicas de L   At(L)
  * Ter(L) ⊆ At(L)   es decir, todo término es una fórmula atómica
  * Si t1, t2, ..., tn ∈ Ter(L) y P ∈ R es un símbolo de relación n-aria, entonces P(t1, t2, ..., tn) ∈ At(L)

* Ejemplos: Sea L2 = <R, F, C>
  * R = {P}     P binario
  * F = {f, g}  f unaria, g binaria
  * C = {a, b}

  * At(L2) = Ter(L2) U {P(a, b), P(a, a), P(x, y), P(x, b), P(f(a), g(a, b)), ...}

## Fórmulas

* Dado L = <R, F, C>
* Fórmulas de L   Fm(L)
  * At(L) ⊆ Fm(L)
  * Si A, B ∈ Fm(L) entonces (¬A), (A∧B), (A∨B), (A->B) ∈ Fm(L)
  * Si A ∈ Fm(L) entonces (∀xA),  (∃xA) ∈ Fm(L)     (x ∈ Var)

* Ejemplos: Sea L2 = <R, F, C>
  * R = {P}     P binario
  * F = {f, g}  f unaria, g binaria
  * C = {a, b}

  * Fm(L2) = At(L2) U {(P(a, b) ∧ P(a, a)), (∃x(P(x, y) ∨ (¬P(x, b)))), (P(f(a), g(a, b)) ∧ P(z, f(g(a, b)))), ... }

## Eliminación de paréntesis

* Para simplificar la escritura de las fórmulas, podemos eliminar ciertos paréntesis, siguiendo las reglas:
  * ¬,  ∀x, ∃x tienen mayor precedencia que los conectivos binarios
  * los conectivos binarios tienen la misma precedencia que en la Lógica Proposicional: ∧, ∨, -> (de mayor a menor)
* Ejemplos:

| Fm(L2) | Eliminando paréntesis |
| -- | -- |
| (P(a, b) ∧ P(a, a)) | P(a, b) ∧ P(a, a) |
| (∃x(P(x, y) ∨ (¬P(x, b)))) | ∃x(P(x, y) ∨ ¬P(x, b)) |
| (P(f(a), g(a, b)) ∧ P(z, f(g(a, b)))) | P(f(a), g(a, b)) ∧ P(z, f(g(a, b))) |

## Subfórmulas

* Sea L un lenguaje y A, B ∈ Fm(L). El conjunto de subfórmulas de una fórmula se define como:
  1. Sf(A) = {A}  si A ∈ At(L)
  1. Sf(¬A) = Sf(A) U {¬A}
  1. Sf(A \* B) = Sf(A) U Sf(B) U {A \* B}  donde * es cualquiera de los conectivos binarios ∧, ∨, ->
  1. Sf(∀xA) = Sf(A) U {∀xA}
  1. Sf(∃xA) = Sf(A) U {∃xA}

* Ejemplo: Sf(∃x(P(x, y) ∨ P(x, b)))
  * = Sf(P(x, y) ∨ P(x, b)) U {∃x(P(x, y) ∨ P(x, b))}
  * = Sf(P(x, y)) U Sf(P(x, b)) U {P(x, y) ∨ P(x, b),  ∃x(P(x, y) ∨ P(x, b))}
  * = {P(x, y), P(x, b), P(x, y) ∨ P(x, b), ∃x(P(x, y) ∨ P(x, b))}

## Alcance o radio de un cuantificador

* Es la fórmula afectada por el cuantificador. Si ∀xA o ∃xA es una fórmula, el alcance del cuantificador ∀x o ∃x es la fórmula A
* Ejemplos:
  * ∀x P(x) -> ∀y R(x, y)
  * ∀x P(x) -> ∀x R(x, y)
  * ∀x∀y (P(x) -> R(x, y))

## Variables libres y ligadas

* Una ocurrencia de una variable x en una fórmula A se dice ligada o acotada si está dentro del alcance de un cuantificador. En caso contrario se dice libre
* Ejemplos:
  * ∀x P(x) -> ∀y R(x, y)
  * Ocurrencia libre de x: ∀y R(x, y)
  * Ocurrencia ligada de x: ∀x P(x)
  * Ocurrencia ligada de y: ∀y R(x, y)

* En una fórmula A
  * cada ocurrencia de una variable es o libre o ligada en A
  * una misma variable puede tener ocurrencias libres y ligadas en A

* Una variable x ocurre libre en una fórmula A si:
  * Si A es atómica, x ocurre libre en A si y sólo si x es variable de A
  * Si A = ¬B, x ocurre libre en A si y sólo si x ocurre libre en B
  * Si A = B \* C, x ocurre libre en A si y sólo si x ocurre libre en B o en C (siendo * alguno de los conectivos binarios)
  * Si A = ∀yB o A = ∃yB, x ocurre libre en A si y sólo si x <> y y x ocurre libre en B

  * A(x1, x2, ..., xn) indica que las variables libres de A están en el conjunto {x1, x2, ..., xn}

## Fórmula cerrada

* Una fórmula A se dice cerrada (o sentencia) cuando no tiene variables libres (cada variable está dentro del alcance de un cuantificador)
* Ejemplos:
  * ∀x∀y (P(x)  → R(x, y))   FÓRMULA CERRADA
  * ∀x P(x)  → ∀x R(x, y)    FÓRMULA NO CERRADA (y es libre)

## Clausura universal/existencial de una fórmula

* La **clausura universal de una fórmula** A(x1, x2, ..., xn) es la sentencia:
  * ∀x1, ∀x2, ..., ∀xn A(x1, x2, ..., xn)

* La **clausura existencial de una fórmula** A(x1, x2, ..., xn) es la sentencia:
  * ∃x1, ∃x2, ..., ∃xn A(x1, x2, ..., xn)

## Sustitución

* Sea A una fórmula, x una variable libre de A y t un término, la sustitución de x por t en A, A(x/t), es la fórmula que se obtiene al reemplazar en A cada ocurrencia libre de x por el término t
* Ejemplos
  * A = ∀x R(x, y) ∧ B(y)     A(y/c) = ∀x R(x, c) ∧ B(c)        c constante
  * A = ∀x P(x) -> Q(x)       A(x/c) = ∀x P(x) -> Q(c)          c constante

* **Sustitución simultánea**: si A es una  fórmula A(x1, x2, ..., xn) y t1, t2, ..., tn son términos, entonces la sustitución simultánea A(x1/t1, x2/t2, ..., xn/tn) es la fórmula que se obtiene al reemplazar en A cada ocurrencia libre de xi por el término ti

### Sustitución en términos

* Sean t y h términos y x una variable. La sustitución de x por h en t es el término t(x/h) definido como sigue:
  * Si t = h entonces t(x/h) = h
  * Si t = y, y variable distinta de x, entonces t(x/h) = y
  * Si t = c, c constante, entonces t(x/h) = c
  * Si t = f(t1, t2, ..., tn), f símbolo de función n-aria y t1, t2, ..., tn términos, entonces t(x/h) = f(t1/h, t2/h, ..., tn/h)

### Sustitución en fórmulas

* Sea A una fórmula, h un término y x una variable. La sustitución de x por h en A es la fórmula A(x/h) definida como sigue:
  * Si A = R(t1, t2, ..., tn), R símbolo de predicado n-ario, entonces A(x/h) = R(t1/h, t2/h, ..., tn/h)
  * Si A = ¬B, entonces A(x/h) = (¬B)(x/h)
  * Si A = B \* C, donde \* es ∧, ∨, ->, entonces A(x/h) = (B \* C)(x/h) = B(x/h) \* C(x/h)
  * Si A = ∃xB, entonces A(x/h) = ∃xB
  * Si A = ∃yB, entonces A(x/h) = ∃yB(x/h) siendo x variable libre en B
  * Si A = ∀xB, entonces A(x/h) = ∀xB
  * Si A = ∀yB, entonces A(x/h) = ∀yB(x/h) siendo x variable libre en B

* Un **término t** se dice **libre para una variable x en una fórmula A** si ninguna ocurrencia libre de x está dentro del alcance de un cuantificador ∀y o ∃y donde y es una variable de t
* Si t es libre para x en A entonces t se puede sustituir en todas las ocurrencias libres de x sin que alguna variable y de t quede dentro del alcance de un cuantificador
* Resumiendo:
  * Sólo sustituiremos ocurrencias libres de las variables
  * Las ocurrencias de variables que aporte cada término sustituyente deben resultar libres en la fórmula final
* Estas restricciones garantizan que la fórmula resultante de sustitución será (in)satisfacible si la original lo era

* Ejemplo: A1 = ∀x(B(x) -> C(y))
  * El término t = f(x), f símbolo de función unaria, no es libre para y en A1
  * El término t = f(z) es libre para y en A1
  * **A1(y/f(z)) = ∀x(B(x) -> C(f(z)))**

* Ejemplo: A2 = ∀xB(x, y) -> ∀zB(z, x)
  * El término t = g(x, w), g símbolo de función binaria, no es libre para y en A2
  * El término t = g(y, z) es libre para y en A2 y pero no es libre para x en A2
  * **A2(y/g(y, z)) =  ∀xB(x, g(y, z)) -> ∀zB(z, x)**

## Semántica de Primer Orden

* Para interpretar una fórmula de la lógica de predicados de primer orden hay que definir los modelos o interpretaciones del lenguaje:
  * determinar qué objetos representan los términos (**Dominio**)
  * definir las **funciones** y qué propiedades/relaciones representan los **predicados**
* Determinar el **valor de verdad** de la fórmula

* Las fórmulas de un lenguaje de primer orden se interpretan sobre conjuntos (dominios)
* Ejemplo: L = <R, F, C>
  * R = {R} R binario
  * F = {}
  * C = {c}
* La fórmula ∀y∃xR(y, x)   Esta fórmula es válida sobre la terna <N, <, {0}>, pues para todo elemento y ∈ N existe un elemento x ∈ N tal que x < y.
* Por ejemplo, el elemento y = x + 1 cumple la condición de que x < y: <N, <, {0}> ⊧ ∀y∃xR(y, x)

### Modelos o interpretaciones

* Sea L = {R, F, C} un lenguaje de primer orden
* Un Modelo M en L es una estructura M = <D, R^D, F^D, C^D> donde:
  * **D** dominio o universo de la interpretación: conjunto no vacío del cual las variables del lenguaje toman valores
  * **R^D**: conjunto de relaciones n-arias definidas sobre D tal que para cada símbolo R ∈ R existe una relación R^D ⊆ D^n asignada a R
  * **F^D**: conjunto de funciones n-arias definidas sobre D tal que para cada símbolo f ∈ F existe una función f^D :  D^n -> D asignada a f
  * **C^D** conjunto de elementos distinguidos de D tal que para cada constante c ∈ C existe un elemento c^D ∈ D asignado a c

* Ejemplo: Sea L = <R, F, C> un lenguaje de primer orden con una relación binaria Q, una función unaria f y una constante c
  * Dadas F1 = ∀xQ(x, c)  y  F2 = ∃xQ(f(x), c) -> ∃zQ(z, z) sobre L
  * Para el modelo M = <D, {Q^D}, {f^D},  {c^D}>
    * D = {1, 2, 3}
    * Q^D(x, y) = {(1, 2), (2, 1), (3, 3)}
    * f^D(1) = f^D(2) = 3       f^D(3) = 1
    * c^D= 2

  * F1 es falsa en M
  * F2 es verdadera en M

### Relaciones y Funciones sobre un Dominio

* Sea D un conjunto no vacío
* D^n es el conjunto de todas las n-uplas de D. Una relación n-aria R sobre D es un subconjunto de D^n
* Una función f: D^n → D hace corresponder a cada n-upla de su dominio D^n un elemento de D.
* Ejemplo:  D = {a, b, c}
  * D^2 = {(a, a), (a, b), (a, c), (b, a), (b, b), (b, c), (c, a), (c, b), (c, c)}
  * D^3 = {(a, a, a), (a, a, b), (a, a, c), ... (c, c, a), (c, c, b), (c, c, c)}
* Una relación binaria R es un subconjunto de D^2. Posibles relaciones binarias:
  * R1 = {}
  * R2 = D^2
  * R3 = {(a, a), (a, b), (a, c), (b, b)}

### Valor de verdad de una fórmula en un modelo

* Sea A una sentencia y M un modelo, M = <D, R^D, F^D, C^D>
* El valor de verdad de A en el modelo M, v(A), se define reemplazando primero cada constante aj de A por el elemento dj ∈ D asignado, y luego por inducción sobre la estructura de A:
  1. A = P(a1, ..., an) luego v(A) = T si y sólo si (d1, ...dn) ∈  P^D    P ∈ R
  1. v(¬A) = T  si y sólo si   v(A) = F
  1. A = A1 v A2   v(A) = T si y sólo si  v(A1) = T  o  v(A2) = T
     A = A1 ^ A2   v(A) = T si y sólo si v(A1) = T   y  v(A2) = T
     A = A1 -> A2  v(A) = T si y sólo si v(A1) = T  o  v(A2) = T
  1. A = ∀x A1     v(A) = T si y sólo si para todo   d ∈ D, v(A1[d]) = T
  1. A = ∃x A1     v(A) = T si y sólo si para algún  d ∈ D, v(A1[d]) = T

### Fórmulas válidas en M

* Dada una fórmula A y un modelo M, si v(A) = T en M diremos que A es válida en el modelo M, o que M es un modelo para A. M ⊧ A

* Ejemplo: Sea L = <{P}, {f, g}, {a, b}> P binario, f y g binarias, se define M = <Z, {P^D},  {f^D, g^D}, {a^D, b^D}>   Z: conjunto de números enteros.
  * P^D(x, y) = {(x, y) ∈ D^2: x ≤ y }
  * f^D(x, y) = x * y
  * g^D(x, y) = x + y
  * a^D = 0
  * b^D = 2

  * Fórmulas válidas en M:
    1. M ⊧ P(a, b)
    2. M ⊧ ¬P(g(b, b)), b)
    3. M ⊧ P(a, b) v P(b, a)
    4. M ⊧ ∀x (P(x, a) -> P(a, f(x, x)))
    5. M ⊧ ∃x P(g(b, b), x)

---

* Ejemplo: M = <Z, {P^D},  {f^D, g^D}, {a^D, b^D}>   Z: conjunto de números enteros.
  * P^D(x, y) = {(x, y) ∈ D^2: x ≤ y }
  * f^D(x, y) = x * y
  * g^D(x, y) = x + y
  * a^D = 0
  * b^D = 2
  * A(x) = P(g(x, b), b)      x variable libre
  * En M   A(x) = x + 2 ≤ 2   x variable libre
  * Es verdadera en M cuando a x se asignen valores negativos o 0
  * **Valuación: asigna elementos del dominio a variable libres**

---

* Ejemplo: Sea M = <D, {P^D, Q^D, R^D}, { }, {c^D}>   P y Q unarios y R binario
  * D = {1, 2, 3, 4}
  * P^D = {1, 2}
  * Q^D = {3, 4}
  * R^D = {(1, 2), (1, 3), (2, 4)}
  * c^D = 2

  * A(x) = ∃yR(x, y) es válida bajo una valuación en M
  * A(x) = P(x) v Q(x) es válida en M (válida bajo toda valuación)
  * A(x) = P(x) ^ Q(x) es falsa en M (falsa bajo toda valuación)
  * A = ∀x∃y(R(x, y) v Q(y)) es válida en M
  * A = ∃y∀x(R(x, y) ^ Q(y)) es falsa en M

## Definiciones

* Sea A una fórmula
* A es **satisfacible** si y sólo sí A es **válida en al menos un modelo**
* A es **válida o lógicamente válida** si y sólo si A es **válida en todo modelo**
* A es **contradictoria** si y sólo si A es **falsa en todo modelo**

* Ejemplo: Sea M = <D, {A^D, B^D, C^D}, {f^D, g^D}, {c^D, d^D}>
  * D = {x ∈ {a, b}\* y x empieza con a}
  * A^D(x, y) = {(x, y) ∈ D^2: x es prefijo de y}   (es decir, y = xz  para x ∈ {a, b}*)
  * B^D(x, y) = {(x, y) ∈ D^2: x es subcadena de y}
  * C^D(x, y) = {(x, y) ∈ D^2: x = y}
  * f^D(x, y) = xy (x concatenada con y)
  * g^D (x) = a
  * c^D = a
  * d^D = aa

  * ∃x ∀y(A(x, y) ^ ¬C(x, d))
  * ∀x ∀y(C(x, f(c, y)) -> A(f(c, c), x))
  * ∀x (B(y, x) -> A(y, x))
  * ∀x ∀y ∀z(A(x, y) -> A(f(x, z), f(y, z)))

## Equivalencia Lógica

* Sean A y B fórmulas con las mismas variables libres
* A ≡ B si y sólo si para todo modelo M, M ⊧ A  ↔ M ⊧ B
* Es decir, A y B son válidas en los mismos modelos
* Para cualquier fórmula A se verifica:
  * ¬∀xA ≡ ∃x¬A
  * ¬∃xA ≡ ∀x¬A
  * ∀xA ≡ ¬∃x¬A
  * ∃xA ≡ ¬∀x¬A

## Sentencias satisfacibles

* Sea Γ un conjunto de sentencias en un lenguaje L
* Γ es satisfacible si existe un modelo M tal que M ⊧ A para toda sentencia A ∈ Γ
* En caso contrario Γ es insatisfacible
* Ejemplo:
  * Γ = {∃x(P(x) ^ Q(x)), ∀x(P(x) -> R(x, x)), ∀x(Q(x) -> ¬R(x, x))}
    * Es un conjunto de sentencias insatisfacibles
  * Γ = {∀x ∃yR(x, y), ∀x ∃y(R(x, y) -> ¬R(y, x))}
    * Es un conjunto de sentencias satisfacible.

## Consecuencia semántica

* Una fórmula A es consecuencia semántica de un conjunto de sentencias Γ, Γ ⊧ A, si para cada modelo M tal que M ⊧ Γ entonces M ⊧ A
* Ejemplo: {∀x(P(x) -> ¬Q(x)), ∀x(P(x) ^ T(x))} ⊧ ∀x(T(x) ^ ¬Q(x))
* Propiedades de la Consecuencia Semántica. Sea Γ un conjunto de sentencias y A una sentencia. Entonces:
  * Si A ∈ Γ entonces  Γ ⊧ A
  * Si Γ ⊧ A y Γ ⊆ Δ entonces Δ ⊧ A       Δ conjunto de sentencias
  * Si Γ ⊧ A y A ⊧ B entonces Γ ⊧ B

* Ejemplo: El conjunto de sentencias Γ = {∀x ∃y(P(x) -> R(x, y)), ∀x ∃y(¬R(x, y) -> (¬P(x) v ¬P(y)))}. Es satisfacible, pues por ejemplo, en el modelo M = <D, P^D, R^D>, donde:
  * D = {1, 2, 3}
  * P^D = {1, 2}
  * R^D = {(1, 1), (2, 1), (1, 2)}
* Las sentencias son válidas

* Ejemplo: El conjunto de sentencias Γ = {∃y(P(x) ^ Q(x)), ∀x(P(x) -> R(x, x)), ∀x(Q(x) -> ¬R(x, x))} Es insatisfacible. Para comprobar esta afirmación razonamos por contradicción. supongamos que existe un modelo M que satisface a las 3 sentencias simultáneamente. Como satisface a la 1er sentencia existe a ∈ D tal que M ⊧ P(a) y M ⊧ Q(a). La 2da. sentencia también debe ser satisfecha por el elemento a, es decir M ⊧ P(a) -> R(a, a). Por tanto, como M ⊧ P(a) entonces M ⊧ R(a, a). Pero también el elemento a debe satisfacer la 3er. sentencia; M ⊧ Q(a) -> ¬R(a, a), y como M ⊧ Q(a) entonces M ⊧ ¬R(a, a), lo que es una contradicción. En consecuencia, el conjunto de sentencias Γ es insatisfacible

## Teorema de la deducción

* Teorema de la deducción:
  * Sea Γ U {A, B} un conjunto de sentencias
  * Γ U {A} ⊧ B si y sólo si Γ ⊧ A -> B

* Corolario:
  * Sea Γ U {A} un conjunto de sentencias
  * Γ ⊧ A si y sólo si Γ U {¬A} es insatisfacible

## Formas Normales

* Literal: fórmula atómica o negación de fórmula atómica. Se denota con I y su complemento I^c
* Ejemplo:
  * L = <{P, Q}, {f}, {c}>  P binario, Q unario, f unaria.
  * I1 = P(c, f(c))
  * I2 = I1^c = ¬P(c, f(c))
  * I3 = ¬P(x, y)
  * I4 = I3^c = P(x, y)

### FNC (Forma Normal Conjuntiva)

* Es una conjunción de disyunciones de literales

### Forma Prenexa

* Es una conjunción de disyunciones de literales con la siguiente forma: Q1x1 Q2x2 ... Qnxn M(x1, x2, ..., xn)
  * Q1x1...Qnxn : prefijo
  * M(x1, ..., xn) : matriz libre de cuantificadores, en FNC
  * Qi : cuantificadores
* Ejemplo de fórmula en Forma Prenexa: ∀x∃y((P(x, c) v Q(y)) ^ ¬P(x, y) ^ (Q(f(c)) v ¬P(c, x)))
* Cómo llevar una fórmula a Forma Prenexa:
  1. Renombrar variables si es necesario. Ejemplo: ∀xA(x) = ∀yA(y)   ∃xA(x) = ∃yA(y)    y no es variable de A
  1. Eliminar implicaciones: A -> B ≡ ¬A v B
  1. Hacer que la negación aparezca inmediatamente antes de una fórmula atómica:
      * ¬(A ^ B) ≡ ¬A v ¬B
      * ¬(A v B) ≡ ¬A ^ ¬B
      * ¬¬A ≡ A
      * ¬∀xA(x) ≡ ∃x¬A(x)
      * ¬∃xA(x) ≡ ∀x¬A(x)
  1. Escribir todos los cuantificadores al principio:
      * ∀xA(x) ^ B ≡ ∀x(A(x) ^ B)     x ∉ Var(B)
      * ∀xA(x) v B ≡ ∀x(A(x) v B)     x ∉ Var(B)
      * ∃xA(x) ^ B ≡  ∃x(A(x) ^ B)    x ∉ Var(B)
      * ∃xA(x) v B ≡  ∃x(A(x) v B)    x ∉ Var(B)
  1. Aplicar la ley distributiva: A v B v C ≡ (A v B) ^ (A v C)

* Ejemplo: F = ∃xP(x, c) v  ∀xP(x, c) ^ ∀xP(c, x) -> ∀x∃yP(x, y)
* Aplicando los 5 pasos anteriores, se obtiene F’ en forma prenexa F’ ≡ F
* F’ = ∀x ∃z ∃u ∀w ∃y ( (¬P(x, c) v P(w, y)) ^ (¬P(z, c) v ¬P(c, u) v P(w, y)) )

### Cláusula

* Es un sentencia escrita en forma prenexa que en el prefijo sólo tiene cuantificadores universales y la matriz es una disyunción de literales.
* ∀x1 ∀x2 ... ∀xn (I1 v I2 v ... v In)
  * li literales
  * ∀x1 ∀x2 ... ∀xn : prefijo
  * (I1 v I2 v ... v In) : matriz - disyunción de literales

### Forma clausular (o clausal)

* Una fórmula está en forma clausular (o clausal, o forma normal de Skolem) si es una conjunción de cláusulas

## Formalización del Lenguaje Natural

* Formalizar frase en lenguaje natural -> encontrar expresión en lenguaje formal que la represente fielmente (expresar en lógica de predicados el conjunto de hipótesis y conclusión)
* No existen procedimientos generales para la formalización
* Existen algunas estrategias o heurísticas:
  * Definir el dominio al cual pertenecen los elementos a usar
  * Determinar constantes: elementos concretos del dominio
  * Determinar variables: elementos genéricos
  * Determinar funciones: representan cómo un elem queda determinado por otros
  * Determinar predicados unarios: representan propiedades de un elemento
  * Determinar predicados de aridad > 1: representan relaciones entre elementos
  * Identificar conectivas lingüísticas y cuantificadores y sustituir por conectivos y cuantificadores de la lógica de primer orden

* Patrones más habituales:

| Patrón | Natural | Simbólico |
| -- | -- | -- |
| Universo afirmativo | Todo A es B. Sólo los B son A. No hay ningún A que no sea B | ∀x(A(x) -> B(x)) |
| Universo negativo | Ningún A es B | ∀x(A(x) -> ¬B(x)) |
| Existencial afirmativo | Algún A es B. Alguien es a la vez A y B | ∃x(A(x) ^ B(x)) |
| Existencial negativo | Algún A no es B. No todos los A son B | ∃x(A(x) ^ ¬B(x)) |

* Relación entre cuantitficadores

| Relación | Natural | Simbólico |
| -- | -- | -- |
| Universal/Existencial | No todos son A. Algunos no son A | ¬∀xA(x) ≡ ∃x¬A(x) |
| Existencial/Universal | No hay A. Todos son no A | ¬∃xA(x) ≡ ∀x¬A(x) |
