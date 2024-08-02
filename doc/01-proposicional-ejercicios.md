# Lógica Proposicional

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
