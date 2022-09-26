# Lógica de Predicados

## Motivación

* p: Todo natural es entero y q: 2 es un natural. r: Luego 2 es entero.
* p, q ⊨ r   es claramente un razonamiento válido pero no es posible demostrarlo desde la Lógica Proposicional.
* La Lógica proposicional NO es suficientemente expresiva para captar esta relación.
* La validez del razonamiento depende de la estructura interna de las proposiciones ==> debe expresarse usando Lógica de Predicados.
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
  * C ⊆ Ter(L)    es decir, toda constante es un término.
  * Var ⊆ Ter(L)  es decir, toda variable es un término.
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
  * Ter(L) ⊆ At(L)   es decir, todo término es una fórmula atómica.
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
  * ¬,  ∀x, ∃x tienen mayor precedencia que los conectivos binarios.
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

* Una ocurrencia de una variable x en una fórmula A se dice ligada o acotada si está dentro del alcance de un cuantificador. En caso contrario se dice libre.
* Ejemplos:
  * ∀x P(x) -> ∀y R(x, y)
  * Ocurrencia libre de x: ∀y R(x, y)
  * Ocurrencia ligada de x: ∀x P(x)
  * Ocurrencia ligada de y: ∀y R(x, y)

* En una fórmula A
  * cada ocurrencia de una variable es o libre o ligada en A.
  * una misma variable puede tener ocurrencias libres y ligadas en A

* Una variable x ocurre libre en una fórmula A si:
  * Si A es atómica, x ocurre libre en A si y sólo si x es variable de A
  * Si A = ¬B, x ocurre libre en A si y sólo si x ocurre libre en B
  * Si A = B \* C, x ocurre libre en A si y sólo si x ocurre libre en B o en C (siendo * alguno de los conectivos binarios)
  * Si A = ∀yB o A = ∃yB, x ocurre libre en A si y sólo si x <> y y x ocurre libre en B.

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

* Sea A una fórmula, x una variable libre de A y t un término, la sustitución de x por t en A, A(x/t), es la fórmula que se obtiene al reemplazar en A cada ocurrencia libre de x por el término t.
* Ejemplos
  * A = ∀x R(x, y) ∧ B(y)     A(y/c) = ∀x R(x, c) ∧ B(c)        c constante
  * A = ∀x P(x) -> Q(x)       A(x/c) = ∀x P(x) -> Q(c)          c constante

* **Sustitución simultánea**: si A es una  fórmula A(x1, x2, ..., xn) y t1, t2, ..., tn son términos, entonces la sustitución simultánea A(x1/t1, x2/t2, ..., xn/tn) es la fórmula que se obtiene al reemplazar en A cada ocurrencia libre de xi por el término ti.

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

* Un **término t** se dice **libre para una variable x en una fórmula A** si ninguna ocurrencia libre de x está dentro del alcance de un cuantificador ∀y o ∃y donde y es una variable de t.
* Si t es libre para x en A entonces t se puede sustituir en todas las ocurrencias libres de x sin que alguna variable y de t quede dentro del alcance de un cuantificador.
* Resumiendo:
  * Sólo sustituiremos ocurrencias libres de las variables.
  * Las ocurrencias de variables que aporte cada término sustituyente deben resultar libres en la fórmula final.
* Estas restricciones garantizan que la fórmula resultante de sustitución será (in)satisfacible si la original lo era.

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

* Las fórmulas de un lenguaje de primer orden se interpretan sobre conjuntos (dominios).
* Ejemplo: L = <R, F, C>
  * R = {R} R binario
  * F = {}
  * C = {c}
* La fórmula ∀y∃xR(y, x)   Esta fórmula es válida sobre la terna <N, <, {0}>, pues para todo elemento y ∈ N existe un elemento x ∈ N tal que x < y.
* Por ejemplo, el elemento y = x + 1 cumple la condición de que x < y: <N, <, {0}> ⊧ ∀y∃xR(y, x)

### Modelos o interpretaciones

* Sea L = {R, F, C} un lenguaje de primer orden.
* Un Modelo M en L es una estructura M = <D, R^D, F^D, C^D> donde:
  * **D** dominio o universo de la interpretación: conjunto no vacío del cual las variables del lenguaje toman valores.
  * **R^D**: conjunto de relaciones n-arias definidas sobre D tal que para cada símbolo R ∈ R existe una relación R^D ⊆ D^n asignada a R.
  * **F^D**: conjunto de funciones n-arias definidas sobre D tal que para cada símbolo f ∈ F existe una función f^D :  D^n -> D asignada a f.
  * **C^D** conjunto de elementos distinguidos de D tal que para cada constante c ∈ C existe un elemento c^D ∈ D asignado a c.

* Ejemplo: Sea L = <R, F, C> un lenguaje de primer orden con una relación binaria Q, una función unaria f y una constante c.
  * Dadas F1 = ∀xQ(x, c)  y  F2 = ∃xQ(f(x), c) -> ∃zQ(z, z) sobre L
  * Para el modelo M = <D, {Q^D}, {f^D},  {c^D}>
    * D = {1, 2, 3}
    * Q^D(x, y) = {(1, 2), (2, 1), (3, 3)}
    * f^D(1) = f^D(2) = 3       f^D(3) = 1
    * c^D= 2

  * F1 es falsa en M
  * F2 es verdadera en M

### Relaciones y Funciones sobre un Dominio

* Sea D un conjunto no vacío.
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

* Sea A una fórmula.
* A es **satisfacible** si y sólo sí A es **válida en al menos un modelo**.
* A es **válida o lógicamente válida** si y sólo si A es **válida en todo modelo**.
* A es **contradictoria** si y sólo si A es **falsa en todo modelo**.

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

* Sean A y B fórmulas con las mismas variables libres.
* A ≡ B si y sólo si para todo modelo M, M ⊧ A  ↔ M ⊧ B.
* Es decir, A y B son válidas en los mismos modelos.
* Para cualquier fórmula A se verifica:
  * ¬∀xA ≡ ∃x¬A
  * ¬∃xA ≡ ∀x¬A
  * ∀xA ≡ ¬∃x¬A
  * ∃xA ≡ ¬∀x¬A

## Sentencias satisfacibles

* Sea Γ un conjunto de sentencias en un lenguaje L.
* Γ es satisfacible si existe un modelo M tal que M ⊧ A para toda sentencia A ∈ Γ.
* En caso contrario Γ es insatisfacible.
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
* Las sentencias son válidas.

* Ejemplo: El conjunto de sentencias Γ = {∃y(P(x) ^ Q(x)), ∀x(P(x) -> R(x, x)), ∀x(Q(x) -> ¬R(x, x))} Es insatisfacible. Para comprobar esta afirmación razonamos por contradicción. supongamos que existe un modelo M que satisface a las 3 sentencias simultáneamente. Como satisface a la 1er sentencia existe a ∈ D tal que M ⊧ P(a) y M ⊧ Q(a). La 2da. sentencia también debe ser satisfecha por el elemento a, es decir M ⊧ P(a) -> R(a, a). Por tanto, como M ⊧ P(a) entonces M ⊧ R(a, a). Pero también el elemento a debe satisfacer la 3er. sentencia; M ⊧ Q(a) -> ¬R(a, a), y como M ⊧ Q(a) entonces M ⊧ ¬R(a, a), lo que es una contradicción. En consecuencia, el conjunto de sentencias Γ es insatisfacible.

## Teorema de la deducción

* Teorema de la deducción:
  * Sea Γ U {A, B} un conjunto de sentencias.
  * Γ U {A} ⊧ B si y sólo si Γ ⊧ A -> B

* Corolario:
  * Sea Γ U {A} un conjunto de sentencias.
  * Γ ⊧ A si y sólo si Γ U {¬A} es insatisfacible.

## Formas Normales

* Literal: fórmula atómica o negación de fórmula atómica. Se denota con I y su complemento I^c
* Ejemplo:
  * L = <{P, Q}, {f}, {c}>  P binario, Q unario, f unaria.
  * I1 = P(c, f(c))
  * I2 = I1^c = ¬P(c, f(c))
  * I3 = ¬P(x, y)
  * I4 = I3^c = P(x, y)

### FNC (Forma Normal Conjuntiva)

* Es una conjunción de disyunciones de literales.

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

* Una fórmula está en forma clausular (o clausal, o forma normal de Skolem) si es una conjunción de cláusulas.

## Formalización del Lenguaje Natural

* Formalizar frase en lenguaje natural -> encontrar expresión en lenguaje formal que la represente fielmente (expresar en lógica de predicados el conjunto de hipótesis y conclusión)
* No existen procedimientos generales para la formalización.
* Existen algunas estrategias o heurísticas:
  * Definir el dominio al cual pertenecen los elementos a usar.
  * Determinar constantes: elementos concretos del dominio.
  * Determinar variables: elementos genéricos.
  * Determinar funciones: representan cómo un elem queda determinado por otros.
  * Determinar predicados unarios: representan propiedades de un elemento.
  * Determinar predicados de aridad > 1: representan relaciones entre elementos.
  * Identificar conectivas lingüísticas y cuantificadores y sustituir por conectivos y cuantificadores de la lógica de primer orden.

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
