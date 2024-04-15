# Lógica Proposicional

## Definiciones básicas

* Proposición
* Alfabeto
* Expresión
* Lenguaje de la LP

## Proposición

* Enunciado del que puede afirmarse si es verdadero o falso.
* Oración declarativa.
* ¿Cuáles de las siguientes son proposiciones?
  * Pedro es alto
  * Juan es estudiante
  * Ayer llovió
  * ¿Quién es?
  * Esta mesa es azul
  * 3 es impar

* Proposición **simple**:
  * Mi perro es negro
  * Juan es estudiante

* Proposición **compuesta**:
  * Maria es arquitecta o Juan es músico
  * Si ayer llovió entonces hoy sale el sol
  * 2 * 3 = 6 y 7 no es par

## Definición del Lenguaje de Lógica Proposicional

* **Sintaxis**: cómo definir fórmulas bien formadas (fórmulas como expresiones o cadenas de símbolos)
  * Alfabeto, Expresión, Lenguaje.

* **Semántica**: cómo interpretar esas fórmulas, es decir, como asignarles significado a los símbolos, un valor de verdad (fórmulas como enunciados que pueden ser verdaderos o falsos)
  * Interpretaciones o Valuaciones.

## Sintaxis

### Alfabeto (Σ)

* Es un conjunto de símbolos (caracteres) necesarios para representar proposiciones sobre el mundo.
* Σ = Var ∪ Conectivos_prop ∪ Símbolos_auxiliares
  * Var: Variables o símbolos proposicionales o símbolos de predicados  = {a, b, c, ..., p, q, ...}
  * Conectivos lógicos o proposicionales = {¬, ^, v, ->}
  * Símbolos auxiliares = {(, )}  

### Lecturas y representaciones alternativas

| Representación | se lee | nombre | alternativa |
| -- | -- | -- | -- |
| ¬p | "no p" | negación | ∼p |
| p ^ q | "p y q" | conjunción | p & q |
| p v q | "p o q" | disyunción | p \| q |
| p -> q| "p entonces q" | condicional | p ⊃ q, p ⇒ q |

* Tanto p -> q como p <=> q pueden verse como abreviaturas de (¬p v q)  y de ((¬p v q) ^ (¬q v p)) respectivamente.

### Expresión

* Es una secuencia finita de símbolos (cadena) tomados de Σ.
* Ejemplos:
  * (, (pq, (-> ¬ p), ( p v ^ p), (r -> -> p v q¬)
  * p, (¬p), (p -> q), ((p v p) ^ q), ((r -> q) ^ (r -> (¬q))) : Fórmulas o EBF (expresión bien formada)

### Fórmula

* Todo símbolo de predicado es una fórmula.
* Si F y G son fórmulas, entonces (F ^ G), (F v G) y (F -> G) son fórmulas.
* Si F es una fórmula, entonces  ¬ F es una fórmula.
* Nada más es una fórmula.

### Lenguaje

* Conjunto de Fórmulas de la LP (Fm).
* Fm es el conjunto de expresiones o cadenas de símbolos de Σ, Fm ⊆ Σ*, que se obtiene aplicando las siguientes reglas:
  * ∀p ∈ Var, entonces p ∈ Fm , es decir, Var ⊆ Fm             F. atómica
  * Si A ∈ Fm , entonces ¬ A ∈ Fm                              F. no atómica
  * Si A, B ∈ Fm , entonces (A ^ B), (A v B), (A -> B) ∈ Fm    F. no atómica

* Ejemplos de Fórmulas de Fm:
  * ((p ^ q) v r)
  * ((p -> q) v ¬q)

* Ejemplos de No Fórmulas de Fm:
  * p ^ v q ^ r
  * ((p -> ) v ¬q)

### Longitud de una Fórmula A (long A)

* Si A = p, p ∈ Var, entonces long(p) = 1
* Si A = ¬B, B ∈ Fm , entonces long(A) = long(B) + 1
* Si A = B \* C, con B, C ∈ Fm , y * es uno de los conectivos ^, v, ->, entonces long(A) = long(B) + long(C) + 1

* Ejemplo: A = p -> (q v r)
  * long(A) = long(p) + long(q v r) + 1
  * long(A) = long(p) + [long(q) + long(r) + 1] + 1
  * long(A) = 1 + [1 + 1 + 1] + 1
  * long(A) = 5

### Subfórmulas de una Fórmula A (Sf(A))

* Sf(p) = {p} si p ∈ Var
* Sf(¬A) = Sf(A) U {¬A} si A ∈ Fm
* Sf((A \* B)) = Sf(A) U Sf(B) U {(A \* B)} si A, B ∈ Fm , y * es uno de los conectivos ^, v, ->

* Ejemplo: A = (p -> q) v ¬q
  * Sf(A) = Sf((p -> q)) U Sf(¬q) U {A}
  * Sf(A) = Sf(p) U Sf(q) U {p -> q} U Sf(q) U {¬q} U {A}
  * Sf(A) = {p} U {q} U {p -> q} U {¬q} U {A}

### GIC

```grammar
<form_log> ::= <form_log> -> <form_or> | <form_or>
<form_or> ::= <form_or> v <form_and> | <form_and>
<form_and> ::= <form_and> ^ <factor_log> | <factor_log>
<factor_log> ::= (<form_log>) |¬ <factor_log> | <var_prop>
<var_prop> ::= a | b | c | ... | z
```

* Esta definición tiene en cuenta precedencia de conectivos: ¬, ^, v, -> (de mayor a menor)

### Representación en árbol

* Las fórmulas, vistas como cadenas de símbolos, no son ambiguas: existe una única forma de entenderlas.
* Formalmente, para cada fórmula Fm existe un único árbol que representa la construcción de Fm según la definición de la sintaxis de la lógica proposicional.
* Ejemplo, las fórmulas
  * (p -> q) v ¬q
  * ((p ^ q) v ¬(r ^ ¬q))

## Semántica

* Interpretación de fórmulas como enunciados a los que se puede asignar sólo uno de dos valores: Verdadero (1, V, T) ó Falso (0, F, ⟘).
* La interpretación o valuación de una fórmula se obtiene como sigue:
  * se asigna un valor de verdad (1 ó 0) a las variables proposicionales.
  * se interpretan las fórmulas no atómicas teniendo en cuenta el significado de los conectivos que contienen.

| p | q | p ^ q | p v q | p -> q|
| -- | -- | -- | -- | -- |
| v | v | v | v | v |
| v | f | f | v | f |
| f | v | f | v | v |
| f | f | f | f | v |

### Valuación

* Es una función v: Fm -> {0, 1} que cumple con las siguientes propiedades ∀ A, B ∈ Fm
  * v(¬A) = ¬ v(A)
  * v(A ^ B) = v(A) ^ v(B)
  * v(A v B) = v(A) v v(B)
  * v(A -> B) = v(A) -> v(B)
* Es decir, v es una función que, para cada símbolo de predicado, nos dice si es 1 (cierto, true) o 0 (falso, false).
* Ejemplo: Dada la fórmula A = (p ^ q) -> ¬ q y la valuación v(p) = 1 y v(q) = 1
  * v(A) = v((p ^ q) -> ¬ q)
  * v(A) = v(p ^ q) -> v(¬ q)
  * v(A) = (v(p) ^ v(q)) -> ¬v(q)
  * v(A) = (1 ^ 1) -> ¬1
  * v(A) = 1 -> 0
  * v(A) = 0

### Tablas de Verdad

* Permiten calcular todos los posibles valores de verdad de una fórmula considerando todas las valuaciones posibles.
* Fórmula : secuencia finita de variables y conectivos.
  * conociendo el valor de verdad de las k variables de la fórmula se puede construir la tabla de verdad.
  * Tamaño de la tabla de verdad = 2^k filas

* Ejemplo: Para la fórmula A = p ^ q -> ¬q

| p | q | p ^ q | ¬q | p ^ q -> ¬q |
| -- | -- | -- | -- | -- |
| 0 | 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 | 1 |
| 1 | 0 | 0 | 1 | 1 |
| 1 | 1 | 1 | 0 | 0 |

### Problemas que se pueden formalizar con la Lógica Proposicional

* Esta lógica sirve para representar (y razonar formalmente sobre) problemas o situaciones de la vida real que puedan expresarse mediante proposiciones, es decir, mediante afirmaciones que sólo puedan ser o bien ciertas o bien falsas.
* Por ejemplo, si Var = {llueve, hace_calor, hace_viento}, cada interpretación o valuación v para esta Var representa una situación meteorológica del estilo de "si llueve, no hace calor y no hace viento", es decir:
  * v(llueve) = 1
  * v(hace_calor) = 0
  * v(hace_viento) = 0

* Con esta interpretación v podemos evaluar la fórmula A: llueve ^ ¬(hace_calor v hace_viento)
  * v(A) = v(llueve ^ ¬(hace_calor v hace_viento))
  * v(A) = v(llueve) ^ ¬v(hace_calor v hace_viento)
  * v(A) = v(llueve) ^ ¬v(v(hace_calor) v v(hace_viento))
  * v(A) = 1 ^ ¬v(0 v 0)
  * v(A) = 1 ^ 1
  * v(A) = 1 (Es decir, A es cierta en v, o lo que es lo mismo v satisface A)

* Similarmente, si B es la fórmula: ¬llueve v (hace_calor v hace_viento)
  * v(B) = v(¬llueve v (hace_calor v hace_viento))
  * v(B) = v(¬llueve) v v(hace_calor v hace_viento)
  * v(B) = ¬1 v  v(hace_calor) v v(hace_viento)
  * v(B) = 0 v 0 v 0
  * v(B) = 0 (Entonces v no satisface B)

### Tautología

* Es una fórmula A que es verdadera bajo toda valuación. Es decir, A es tautología si y sólo sí ∀ valuación v, v(A) = 1.
* En la tabla de verdad, todos los elementos de la columna correspondiente a la fórmula son 1.
* En símbolos  ⊧ A
* ⊧ ¬p v p. Se comprueba que para toda valuación v, v(¬p v p) = 1. Casos:
  * Si v(p) = 1, entonces v(¬p) = ¬v(p) = ¬1 = 0. Por lo tanto, v(¬p v p) = ¬v(p) v v(p) = 0 v 1 = 1.
  * Si v(p) = 0, entonces v(¬p) = ¬v(p) = ¬0 = 1. Por lo tanto, v(¬p v p) = ¬v(p) v v(p) = 1 v 0 = 1.
* Se concluye que la fórmula ¬p v p es una tautología.
* Lista de fórmulas que son tautologías:
  * A -> A
  * A -> (B -> A)
  * (A -> B) -> ((B -> C) -> (A -> C))
  * (¬A -> A) -> A
  * ¬A -> (A -> B)
  * ((A -> B) -> A) -> A
  * ((A -> B) ^ A) -> B

### Contradicción

* Es una fórmula A que es falsa bajo toda valuación. Es decir, A es contradicción sí y sólo sí︎ ∀ valuación v, v(A) = 0.
* En la tabla de verdad, todos los elementos de la columna correspondiente a la fórmula son 0.

### Contingencia

* Es una fórmula A que no es ni tautología ni contradicción.
* Una fórmula A es una tautología si y sólo sí su negación ¬A es una contradicción.

### Satisfacibilidad

* Una valuación v satisface una fórmula A si v(A) = 1
* Una fórmula A se dice satisfacible si existe alguna valuación v que la satisfaga, es decir, para alguna valuación v, v(A) = 1. En caso contrario, A es insatisfacible (contradicción).
* Una valuación v satisface un conjunto de fórmulas Γ ⊆ Fm si v satisface cada fórmula de Γ, es decir, v(A) = 1 ∀ fórmula A ∈ Γ
* Un conjunto de fórmulas Γ son mutuamente satisfacibles, o consistentes entre sí, si existe al menos una valuación v que satisface cada fórmula de Γ, es decir, v(A) = 1 ∀ fórmula A ∈ Γ

### Equivalencia

* Dos fórmulas A y B se dicen equivalentes, A ≡ B, sí y sólo sí ∀ valuación v, v(A) = v(B)
* ≡ es una relación de equivalencia en el conjunto de las fórmulas Fm, es decir, cumple las propiedades:
  * Reflexiva: A ≡ A
  * Simétrica: Si A ≡ B, entonces B ≡ A
  * Transitiva: Si A ≡ B y B ≡ C, entonces A ≡ C
* Lista de equivalencias lógicas:
  * A ≡ ¬¬A
  * A ≡ A ^ A
  * A ≡ A v A
  * A ^ B ≡ B ^ A
  * A v B ≡ B v A
  * A v ¬A ≡ A -> A
  * A -> B ≡ ¬A v B
  * A -> B ≡ ¬B -> ¬A
  * A v (B ^ C) ≡ (A v B) ^ (A v C)
  * A ^ (B v C) ≡ (A ^ B) v (A ^ C)
  * ¬ (A v B) ≡ ¬A ^ ¬B
  * ¬ (A ^ B) ≡ ¬A v ¬B
  * A v B ≡ ¬(¬A ^ ¬B)
  * A ^ B ≡ ¬ (¬A v ¬B)

* **Lema**: Sean A, B ∈ Fm. Entonces A ≡ B si y sólo sí v(A <-> B) = 1 ∀ valuación v. Demostración:
  * Si A ≡ B entonces para cualquier valuación v, v(A) = v(B).
  * Por lo tanto v(A -> B) = v(A) -> v(A) = 1 y v(B -> A) = v(B) -> v(B) = 1.
  * Entonces v(A <-> B) = v(A -> B) ^ v(B -> A) = 1

### Sustitución

* Es una función e: Fm -> Fm que cumple con las siguientes propiedades ∀ A, B ∈ Fm
  * e(¬A) = ¬e(A)
  * e(A ^ B) = e(A) ^ e(B)
  * e(A v B) = e(A) v e(B)
  * e(A -> B) = e(A) -> e(B)

* **Teorema**: Dadas A, B ∈ Fm tal que A ≡ B, y dada la sustitución e, entonces e(A) ≡ e(B). Ejemplo:
  * Sea p -> q ≡ ¬p v q
  * Sea e(p) = a ^ b
  * Sea e(q) = a v c
  * Aplicando e
  * a ^ b -> a v c ≡ ¬(a ^ b) v a v c  (se reemplaza cada ocurrencia de la variable)

* Sea A ≡ B y X una fórmula donde A puede aparecer varias veces como subfórmula. Si se reemplaza en X la subfórmula A por B (en todas o alguna de sus ocurrencias) la fórmula Y obtenida es equivalente a X. Ejemplo:
  * Sea X = (p -> q) -> ((p -> q) ^ p)  y la equivalencia p -> q = ¬p v q
  * Reemplazamos en X se obtiene la fórmula Y = (¬p v q) -> ((p -> q) ^ p)
  * Se puede verificar que X ≡ Y

* La **sustitución** preserva la equivalencia entre las dos fórmulas porque se hace en toda ocurrencia de la fórmula sustituida (no requiere que la fórmula sustituida sea equivalente a la sustituyente)
* El **reemplazo** preserva la equivalencia porque la fórmula sustituyente es equivalente a la sustituida (no requiere realizarse en toda ocurrencia de la fórmula sustituida)

* Una valuación v satisface una fórmula A si v(A) = 1
* Una valuación v satisface un conjunto de fórmulas Γ ⊆ Fm si v satisface cada fórmula de Γ, es decir,  v(A) = 1 ∀ fórmula A ∈ Γ
* **Teorema**: Sea Γ = {A1, A2, ..., An} ⊆ Fm
  * Γ = {A1, A2, ..., An} es satisfacible si y sólo si la fórmula A1 ^ A2  ^ ... ^ An es satisfacible.
  * Γ = {A1, A2, ..., An} es insatisfacible si y sólo si la fórmula A1 ^ A2  ^ ... ^ An es una contradicción.
* Observación: Sea Γ = {}. Toda valuación v satisface a Γ

### Formas Normales

* **Literal**: es una variable proposicional o la negación de una variable proposicional. Ejemplo: p, ¬p
* **Cláusula**: es una fórmula del tipo C = \/ li, con li literales. Una cláusula dual es una fórmula del tipo C = /\ li donde li son literales. Ejemplo: C = p v ¬q v r
* Tipos:
  * Forma Normal Disyuntiva (FND)
  * Forma Normal Conjuntiva (FNC)

#### FNC

* Una fórmula A está en FNC si es una conjunción de cláusulas, es decir, A es de la forma:
* A = /\ Cj  =  /\       \/  Iij , donde Iij son literales.
          j = 1, ..., n i = 1, ..., m

* Ejemplo: (¬p v q v r) ^ (q v ¬r) ^ ¬p

#### FND

* Una fórmula A está en FND si es una disyunción de cláusulas duales, es decir, A es de la forma:
* A =  \/       /\  Iij , donde Iij son literales.
j = 1, ..., n  i = 1, ..., m

* Ejemplo: (p ^ q ^ ¬r) v (q ^ ¬r) v (¬p ^ r)
* Las siguientes fórmulas no están ni la FNC ni en la FND:
  * (p ^ q ^ ¬r) v ((q ^ ¬r) v p) v (¬p ^r)
  * ¬(p ^ q ^ ¬r) v (¬p ^ r)

#### Convertir una fórmula en la FNC

* Utilizar la equivalencia A -> B ≡ ¬A v B (para eliminar el conectivo ->)
* Utilizar las leyes de De Morgan (para poner la negación inmediatamente antes de las fórmulas)
* Utilizar ¬¬A ≡ A (para eliminar la doble negación)
* Utilizar las leyes distributivas A v (B ^ C) ≡ (A v B) ^ (A v C)  
  * y A ^ (B v C) ≡ (A ^ B) v (A ^ C)  (para eliminar las conjunciones entre disyunciones)
* Utilizar las leyes A ≡ A v A  y  A ≡ A ^ A  (para eliminar repeticiones de fórmulas)

* Ejemplo: determinar una fórmula equivalente a la fórmula A que esté en la FND
  * A = ¬(p → (q ^ r)) → (¬(p v q) ^ r)
  * A ≡ ¬(¬(p → (q ^ r))) v (¬(p v q) ^ r)
  * A ≡ (p → (q ^ r)) v (¬(p v q) ^ r)
  * A ≡ (¬p v (q ^ r)) v (¬(p v q) ^ r)
  * A ≡ ¬p v (q ^ r ) v (¬p ^ ¬q ^ r)

### Consecuencia semántica

* Se usan argumentos para aseverar cosas o hechos.
* Un argumento es una deducción que permite llegar a una conclusión a partir de un cierto conjunto de premisas o hipótesis.
* Un argumento o razonamiento es válido o correcto cuando toda valuación que hace verdaderas a las hipótesis, hace verdadera a la conclusión (no hay valuación que haga verdaderas a las hipótesis y falsa a la conclusión)
* Ejemplo: Dados a, b, c ∈ N. Si a < b y b < c entonces a < c

| p | q | p -> q | ¬p | ¬p v q |
| -- | -- | -- | -- | -- |
| 0 | 0 | **1** | **1** | **1** |
| 0 | 1 | **1** | **1** | **1** |
| 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 1 |

* Hipótesis (o premisas): p -> q,  ¬p
* Conclusión (o consecuencia semántica): ¬p v q
* En cada fila que p -> q y ¬p son verdaderas la fórmula ¬p v q también es verdadera. Diremos que ¬p v q es consecuencia semántica de las fórmulas p -> q y ¬p

* Ejemplo: Probar que si las fórmulas p -> q, q -> r son verdaderas bajo una valuación, entonces la fórmula p -> r es verdadera bajo la misma valuación. Es decir, {p -> q, q -> r } ⊧ p -> r

| p | r | q | p -> q | q -> r | p -> r |
| -- | -- | -- | -- | -- | -- |
| 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 0 |  |
| 0 | 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 1 |  |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 |  |
| 1 | 1 | 1 | 1 | 1 | 1 |

* Una valuación v satisface una fórmula A si v(A) = 1.
* Una valuación v satisface un conjunto de fórmulas Γ si v(A) = 1 para toda fórmula A ∈ Γ. En este caso escribiremos v(Γ) = 1.
* Una fórmula o un conjunto de fórmulas se dice **satisfacible** si existe alguna valuación que la (lo) satisfaga. Es **insatisfacible** en caso contrario.
* Una fórmula es satisfacible si y sólo si es una contingencia o una tautología, y es insatisfacible si y sólo si es una contradicción.

* Sea Γ U {A} ⊆ Fm
* A es consecuencia semántica de Γ, en símbolos Γ ⊨ A, sí para toda valuación v que satisfaga a Γ, también satisface a la fórmula A.
* Γ ⊨ A <-> ∀ valuación v / v(Γ) = 1, entonces v(A) = 1
* De esta definición resulta que ⊨ A si y sólo si A es una tautología.

* Propiedades: Sean Γ U ∆ U {A, B} ⊆ Fm
  * A ⊨ A    toda fórmula es consecuencia semántica de sí misma (Reflexividad)
  * Γ ⊨ A  y  A ⊨ B    entonces Γ ⊨ B   (Transitividad)
  * Si A ∈ Γ   entonces Γ ⊨ A
  * Si Γ ⊨ A  y  Γ ⊆ ∆  entonces ∆ ⊨ A  (si de un conjunto de hipótesis se sigue una conclusión, agregando hipótesis al conjunto, la conclusión sigue siendo consecuencia semántica)

## Anexo: Fórmulas lógicamente equivalentes

1. Leyes conmutativas
    1. (A ∧ B) ≡ (B ∧ A)
    2. (A ∨ B) ≡ (B ∨ A)
    3. (A <-> B) ≡ (B <-> A)
2. Leyes asociativas
    1. A ∧ (B ∧ C) ≡ (A ∧ B) ∧ C
    2. A ∨ (B ∨ C) ≡ (A ∨ B) ∨ C
3. Leyes distributivas
    1. A ∨ (B ∧ C) ≡ (A ∨ B) ∧ (A ∨ C)
    2. A ∧ (B ∨ C) ≡ (A ∧ B) ∨ (A ∧ C)
4. Leyes de De Morgan
    1. ¬(A ∧ B) ≡ ¬A ∨ ¬B
    2. ¬(A ∨ B) ≡ ¬A ∧ ¬B
5. Ley de negación
    * ¬(¬A) ≡ A
6. Ley del tercero excluido
    * A ∨ ¬A ≡ 1
7. Ley de contradicción
   * A ∧ ¬A ≡ 0
8. Ley de implicación
   * A -> B ≡ ¬A ∨ B
9. Leyes de simplificación del ∨
    1. A ∨ A ≡ A
    2. A ∨ 1 ≡ 1
    3. A ∨ 0 ≡ A
    4. A ∨ (A ∧ B) ≡ A
10. Leyes de simplificación del ∧
    1. A ∧ A ≡ A
    2. A ∧ 1 ≡ A
    3. A ∧ 0 ≡ 0
    4. A ∧ (A ∨ B) ≡ A
11. A -> B ≡ ¬B -> ¬A
12. (A <-> B) ≡ (A -> B) ∧ (B -> A)

## Ejercicios

1. Sean a,b,c y d variables proposicionales. Elimine tantos paréntesis como sea posible de las siguientes fórmulas:
    1. ((b -> (¬a)) ∧ c)
    1. (a ∨ (b ∨ c))
    1. (((a ∧ (¬b)) ∧ c) ∨ d)

    ```plain
    1. (b -> ¬a) ∧ c 
    2. a ∨ b ∨ c
    3. (a ∧ ¬b ∧ c) ∨ d
    ```

1. Sean p, q y r variables proposicionales. De acuerdo a las leyes de precedencia de operadores, la fórmula ¬p -> ¬q ∧ r es implícitamente una de las siguientes. ¿Cuál de ellas? Justifique.
    1. ((¬p) -> (¬q)) ∧ r
    1. (¬p) -> ¬(q ∧ r)
    1. ¬(p -> ¬(q ∧ r))
    1. (¬p) -> ((¬q) ∧ r)
    1. ¬(p -> ((¬q) ∧ r))

    ```plain
    (¬p) -> ((¬q) ∧ r), porque al eliminar los paréntesis queda igual a la fórmula ¬p -> ¬q ∧ r. Precedencia de conectivos: ¬, ^, v, ->
    ```

1. Sea F el conjunto de fórmulas lógicas definido por la siguiente definición BNF

    ```grammar
    <form log> ::= <form log> -> <form or> | <form or>
    <form or> ::= <form or> ∨ <form and> | <form and>
    <form and> ::= <form and> ∧ <factor log> | <factor log>
    <factor log> ::= (<form log>) | ¬ <factor log> | <var prop>                                      
    <var prop> ::= a | b | c | ... | z
    ```

    1. Escriba 5 cadenas que no sean fórmulas de F y 5 que sí lo sean.
    1. Para la fórmula del ejercicio 4.(a), determine usando árboles de derivación, si es una fórmula de F.

    ```plain
    1.  
    no_fórmulas = {p ^ ^ q, -> -> p, ¬q p, q¬, ((p), ...}
    fórmulas = {p, (p), p ^ q, ¬p, (¬p), ...}

    2.  
    <form log> => <form or> => <form and> => <form and> ^ <factor log> => ...  Es una fórmula de F.
    ```

1. Sean p, q y r variables proposicionales. Para cada una de las siguientes fórmulas, construya la tabla de verdad y determine si es una tautología, una contradicción o una contingencia:
    1. (p -> q) ∧ (q -> p)
    1. p ∧ (p -> q) -> q
    1. ¬(p ∧ q ∧ r -> p ∨ q)
    1. (¬p -> ¬q) v (q -> p)

    ```plain
    1. Contingencia 
    2. Tautología
    3. Contradicción
    4. Contingencia
    ```

1. Sean p, q y r variables proposicionales. ¿Cuáles de las siguientes fórmulas proposicionales son tautologías?
    1. (p -> (q -> p))
    1. q ∨ r -> (¬r -> q)
    1. (¬p -> ¬q) -> (q -> p)
    1. (p -> (q -> r)) -> p ∧ ¬q ∨ r
    1. (p -> (q -> r)) -> ((p -> q) -> (p -> r))

    ```plain
    1, 2, 3, 5 son tautologías.
    4 es contingencia.
    ```

1. Sean p, q y r variables proposicionales. Usando tablas de verdad, muestre si los siguientes pares de fórmulas son o no equivalentes:
    1. p ∧ ( q ∨ r)   y   p ∧ q ∨ p ∧ r
    1. p ∨ q ∧ r   y   (p ∨ q) ∧ (p ∨ r)  
    1. p ∨ p ∧ q   y   p
    1. p ∧ q ∨ ¬q  y   p ∨ ¬q
    1. (p ∧ q) ∨ (p ∧ ¬q)   y   p

    ```plain
    1. Es equivalente.
    2. No es equivalente.
    3. No es equivalente.
    4. Es equivalente.
    5. Es equivalente.
    ```

1. Sean a, b y c variables proposicionales. Usando las leyes de equivalencias para fórmulas lógicas, determine cuáles de los siguientes pares de fórmulas son equivalencias lógicas
1. a -> b    y   ¬(a ∧ ¬b)
1. a <-> b   y   (¬a ∨ b) ∧ (¬b ∨ a)
1. a -> (b -> c)   y   (a -> b) -> c

```plain
1. Equivalentes, a -> b ≡ ¬a v b ≡ ¬(a ∧ ¬b)
1. Equivalentes, a <-> b ≡ (a -> b) ^ (b -> a) ≡ (¬a v b) ^ (¬b v a)
1. No equivalentes, a -> (b -> c) ≡ a -> (¬b v c) ≡ ¬a v (¬b v c)  y   (a -> b) -> c ≡ (¬a v b) -> c ≡ ¬(¬a v b) v c ≡ a ^ ¬b v c
```

1. Sean x e y variables proposicionales. Simplifique cada una de las siguientes fórmulas hasta obtener 1, 0, x, y, x ∧ y, x ∨ y.
    1. ¬y -> y
    1. ¬y -> ¬y
    1. x ∨ (y ∨ x) ∨ ¬y

    ```plain
    1. ¬y -> y ≡ ¬¬y v y ≡ y v y ≡ y
    2. ¬y -> ¬y ≡ ¬¬y v ¬y ≡ y v ¬y  ≡ 1 
    3. x ∨ (y ∨ x) ∨ ¬y  ≡ (y v ¬y) v (x v x)  ≡ 1 v x ≡ 1
    ```

1. Sean p, q y r variables proposicionales. Dadas las siguientes fórmulas lógicas, encuentre fórmulas equivalentes a ellas usando solamente los siguientes conectivos: (a) {¬, ∧}  (b) {¬, ∨}  (c) {¬, →}
    1. p -> (q -> r)
    1. p <-> q
    1. p ∧ q ∧ r

    ```plain
    1. p -> (q -> r) ≡ p -> (¬q v r) ≡ ¬p v (¬q v r) ≡ ¬p v ¬q v r
    2. p <-> q ≡ (p -> q) ^ (q -> p) ≡ (¬p v q) ^ (¬q v p) ...
    3. p ∧ q ∧ r ≡ ...
    ```

1. Sean p, q, r y s variables proposicionales. Determine si cada uno de los siguientes conjuntos de fórmulas es o no satisfacible. Para las fórmulas mutuamente satisfacibles, dé una valuación v que las satisfaga.
    1. {p ∧ q,  ¬p ∧ q}
    1. {p ∧ q,  ¬p ∨ q}
    1. {p -> q,  p ∨ q, ¬q}
    1. {p -> q, q -> r, r -> s, p -> s}
    1. {p -> q, q -> r ,r -> s, p ∧ ¬s}
    1. {p ∨ q, p ∨ (q ∧ r), p -> ¬r}
    1. {p -> q, (p ∧ q) -> r, q -> ¬p}

    ```plain
    Uso v(p) = 0      v(q) =  1        v(r) = 1
    1. v(p ∧ q) = v(p) ^ v(q)   v(¬p ∧ q) = v(¬p) ^ v(q) = ¬v(p) ^ v(q)   NO
    2. v(p ∧ q) = v(p) ^ v(q)   v(¬p ∨ q) = v(¬p) v v(q)                  SI
    3. v(p -> q) = v(p) -> v(q)   v(p ∨ q) = v(p) v v(q)   v(¬q) = ¬v(q)     NO 
    4.
    5.
    6.
    7. v(p -> q) = v(p) -> v(q)   v((p ∧ q) -> r) = v(p) ^ v(q) -> v(r)   v(q -> ¬p) = v(q) -> ¬v(p)   SI
    ```

1. Sea G el conjunto de fórmulas lógicas definido por la siguiente definición BNF:

    ```grammar
    <form log> ::= <form log> -> <form log> | <form log> ∨ <form log> | <form log> ∧ <form log> | ¬<form log> | (<form log>) | <var prop>
    <var prop> ::= a | b | c | ... | z
    ```

    * Sea v(p) = 1, v(q) = 1 y v(r) = 1, los valores de verdad asociados a las variables proposicionales p, q y r, respectivamente.
    1. Usando árboles de derivación determine si la siguiente fórmula lógica es una fórmula de G. Si es posible construir más de un árbol de derivación, construirlos y determine el valor de verdad de la fórmula en cada caso. {p -> q ∨ r ∧ ¬r}
    1. Realice el mismo procedimiento que en el inciso anterior según la definición BNF dada en el ejercicio 3)

    ```plain
    1.
    <form log> => <form log> → <form log> => ... Es una fórmula de G
    v(p) = v(q) = v(r) = 1

    2.
    <form log> => <form log> -> <form or> => ...
    ```

1. Determinar la opción correcta al formalizar las siguientes frases en lenguaje natural como fórmulas del cálculo proposicional
    1. Un país va bien si y sólo si hay crecimiento económico y no hay inflación.
        1. p <-> (q ∧ r)
        1. (p -> q ∧ ¬r) ∧ (q ∧ ¬r -> p)
        1. p -> q ∧ ¬r
        1. (q ∧ r -> p) ∧ (p -> q ∧ r)
    1. En Argentina hay inflación y no hay crecimiento económico, por tanto, Argentina no va bien.
        1. p ∧ ¬q -> ¬r
        1. ¬r -> p ∧ ¬q
        1. p ∧ q -> r
        1. p -> ¬r

    ```plain
    1. p <-> (q ∧ r)
    2. p ∧ q -> r
    ```

1. Reescriba las siguientes oraciones en lenguaje natural como fórmulas del cálculo proposicional clásico:
    1. Handel es un gran músico, y Vivaldi también.
    1. Si hay poco tránsito y salimos temprano, llegaremos más tarde de lo previsto.
    1. El tránsito y la lluvia lo han puesto de mal humor.

    ```plain
    1. p ^ q
    2. p ^ q -> r
    3. p ^ q -> r
    ```

1. Reescriba el siguiente par de oraciones equivalentes en lenguaje natural como un par de fórmulas equivalentes y demuestre dicha equivalencia: "Si n es un número natural, entonces si n es par su cuadrado es par" y "Si n es un número natural y es par, entonces su cuadrado es par"

1. Dadas las siguientes oraciones en lenguaje natural, formalícela en el cálculo proposicional y escriba otras dos oraciones en lenguaje natural para cada una de ellas que sean lógicamente equivalentes.
    1. Llevo piloto sólo si llueve.
    1. Llevo piloto sólo si no hay sol.
    1. No llevo piloto sólo si hay sol.

    ```plain
    1. p -> q
    2. p -> r 
    3. ¬p -> ¬r
    ```

1. Determine si las siguientes oraciones en lenguaje natural son mutuamente satisfacibles:
    1. Llueve o está nublado. No llueve. Está nublado.
    1. Si me levanto temprano, estaré cansado. Me levanto temprano. No estoy cansado.
    1. Si hay sol, vamos al club. Si es sábado, vamos al club. Si hay sol y es sábado entonces vamos al club.

    ```plain
    1. {p v q, ¬p, q}
    2. {p -> q, p, ¬q}
    3. {p -> q, r -> q, p ^ r -> q}
    ```

1. Sean p, q y r variables proposicionales. Muestre por tabla de verdad que las siguientes consecuencias semánticas son o no son válidas:
    1. ¬p ∨ (q -> p) ⊨ ¬p ∧ q
    1. p -> (q -> r) ⊨ p -> (r -> q)
    1. {¬p, p ∨ q} ⊨ ¬q

    ```plain
    1. válida
    2. válida
    3. inválida
    ```

1. Sean A, B, C ∈ Fm. Pruebe las siguientes consecuencias semánticas:
    1. {¬B, A -> (¬B -> C)} ⊨ A -> C
    1. {A -> B, A -> C} ⊨ A -> B ∧ C
    1. {A -> C, B -> C} ⊨ A ∧ B -> C

1. Determine cuáles de las siguientes fórmulas son consecuencia semántica de la fórmula A ∧ B y cuáles de la fórmula A ∨ ¬B: A, ¬B -> A, ¬A ∨ B, B -> ¬A

1. Sean p,q y r variables proposicionales. Determine cuáles de las siguientes consecuencias semánticas son válidas. Justifique
    1. {p ∨ q} ⊨ p -> q
    1. {p ∧ ¬p} ⊨ r <-> r ∨ q
    1. {p -> q, ¬r -> ¬q} ⊨ p -> r
    1. {p -> q, q -> p ∧ r} ⊨ p -> (p -> q) -> r

    ```plain
    1. Válida
    2. Inválida
    3. Válida
    4. Válida
    ```

1. Sean A, B, C ∈ Fm Pruebe las siguientes tautologías.
    1. ⊨ (A -> (B -> (A ∧ B)))
    1. ⊨ (A -> B) -> (¬B -> ¬A)
    1. ⊨ ¬A ∧ ¬B -> ¬(A ∨ B)

1. Sean A, B, C ∈ Fm.
    1. Pruebe la siguiente consecuencia semántica: {B, A -> (B -> C)} ⊨ A -> C
    1. Si se agrega al conjunto de hipótesis la fórmula ¬B ∧ A, el conjunto de hipótesis resultante ¿es satisfacible o insatisfacible?

1. Formalice en el lenguaje del cálculo proposicional: Tres personas A, B y C son acusadas de un asesinato. En el juicio ellos declaran lo siguiente: A dice: "Lo hizo B, C es inocente". B dice: "Si A es culpable, también lo es C". C dice: "Yo no lo hice, lo hizo uno de los otros dos".

    ```plain
    p: A es inocente   q: B es inocente    r: C es inocente
    {¬q ^ r, ¬p ^ ¬r,  ¬p v ¬q}
    ```

1. Formalice el problema usando lógica proposicional: Buscando a Sir Morgan, un lógico encuentra a dos personajes. Junto a ellos, un caballo, una lanza y un escudo. El primer personaje dice, "Éste es el caballo de Sir Morgan, ésta es su lanza, pero éste no es su escudo". El segundo dice, "En efecto, éste es el caballo de Sir Morgan, pero, si ésta es su lanza, éste no es su escudo".

    ```plain
    p: caballo    q: lanza      r: escudo
    {p ^ q ^ ¬r, p ^ (q -> ¬r}
    ```

1. Formalice el problema usando lógica proposicional: Un rey somete a un prisionero a la siguiente prueba: lo enfrenta a dos puertas, de las que el prisionero debe elegir una, y entrar en la habitación correspondiente. Se informa al prisionero que hay un tigre y una dama, cada uno ubicado en una de las habitaciones. Como es natural, el prisionero debe elegir la puerta que lo lleva a la dama (entre otras cosas, para no ser devorado por el tigre). Para ayudarlo, en cada puerta hay un cartel:
    * Puerta 1: en esta habitación hay una dama y en la otra un tigre.
    * Puerta 2: en una de estas habitaciones hay una dama si y sólo si en la otra hay un tigre.

1. Formalice el problema usando lógica proposicional: Se denunció un robo de dinero y la policía detuvo a 4 sospechosos. Los 4 fueron interrogados, y se sabe que uno solo dijo la verdad.
    * El sospechoso número 1 dijo que él no robó el dinero.
    * El sospechoso número 2 dijo que el número 1 mentía.
    * El sospechoso número 3 dijo que el número 2 mentía.
    * El sospechoso número 4 dijo que el número 2 fue quien robó el dinero.

1. En cada uno de los siguientes casos determine si la conclusión se sigue de las premisas:
    1. X será contratado si pasa todas las entrevistas. Si X tiene experiencia previa y no participa activamente en las reuniones, será contratado. X tiene experiencia previa. Además, X pasará todas las entrevistas si participa activamente en las reuniones. Entonces X será contratado.
    1. Si llueve o hace frío, me quedo en casa. Si es domingo y me quedo en casa, me aburro a menos que me visite algún amigo. Si me visita algún amigo, me divierto. No me divierto y es domingo.
    Por lo tanto, si no hace frío me aburro.
    1. Cuando vengo, estás trabajando o durmiendo. Si estás durmiendo, es que no he venido aún o te acostaste muy tarde. Pero no te acostaste muy tarde. Luego estás trabajando o no he venido.

1. Determine si cada una de las siguientes afirmaciones es verdadera o falsa. Justifique su respuesta en cada caso.
    1. Dado un conjunto de fórmulas del cálculo proposicional A = {A1, A2, ..., An}, A es insatisfacible si para toda valuación v, v(A) = 0.
    1. Dados un conjunto de fórmulas del cálculo proposicional A = {A1, A2, ..., An} y B una tautología, si A es satisfacible entonces A ∪ {B} también es satisfacible.
    1. Dado un conjunto de fórmulas del cálculo proposicional A = {A1, A2, ..., An}, si A es insatisfacible entonces {A1, A2} es insatisfacible.

1. Dadas A y B fórmulas del cálculo proposicional, ¿es cierto que siempre ocurre que si A y A -> B son verdaderas entonces B también lo es? Fundamente su respuesta y ejemplifique con algunos ejemplos concretos escritos en lenguaje natural.

1. Sea Γ, ∆ ⊆ Fm y sean A, B, C ∈ Fm, pruebe las siguientes afirmaciones:
    1. Si A ∈ Γ entonces Γ ⊨ A
    1. Si Γ ⊨ A y Γ ⊆ ∆ entonces ∆ ⊨ A
    1. Si Γ ⊨ A y A ⊨ B entonces Γ ⊨ B

1. Sean p, q ,r y s variables proposicionales.Convierta cada una de las siguientes fórmulas a la forma normal conjuntiva, aplicando leyes de equivalencia.
    1. p -> (q ∧ r)
    1. p <-> (q ∧ r)
    1. ¬(p -> q) ∨ (p ∨ q)

1. Sean p, q y r variables proposicionales. Decidir usando formas normales si cada una de las siguientes fórmulas es una contradicción, una tautología o una contingencia
    1. (p -> ¬(q -> ¬r)) ∧ (r -> ¬q)
    1. (p -> q ∧ r) -> (p -> q) ∨ (p -> r)

1. Sean p, q, r, s, t y u variables proposicionales, donde:
    * p representa la afirmación "María abusa de la comida basura"
    * q representa la afirmación "Tomás abusa de la comida basura"
    * r representa la afirmación "María está enferma"
    * s representa la afirmación "Tomás está enfermo"
    * t representa la afirmación "María fuma"
    * u representa la afirmación "Tomás fuma"

    1. De acuerdo con lo anterior, expresar los hechos representados por la siguiente fórmula: (t v u) -> (t ^ u)
    1. Formalice en el lenguaje del cálculo proposicional: "Si María no fuma entonces está sana si no abusa de la comida basura"

    ```plain
    1. "Si María o Tomás fuman entonces María y Tomás fuman"
    2. ¬t -> (¬p -> ¬r) o  bien  ¬p -> (¬t -> ¬r).  En este caso ambas fórmulas son lógicamente equivalentes. Son abreviaciones de t v (p v ¬r)  y  p v (t v ¬r)
    ```
