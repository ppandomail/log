# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Parcial mayo 2023

* ALUMNO:  
* LU:
* CARRERA:

---

### NOTA: EL EXAMEN ESCRITO ES UN DOCUMENTO DE GRAN IMPORTANCIA PARA LA EVALUACIÓN DE LOS CONOCIMIENTOS ADQUIRIDOS, POR LO TANTO, SE SOLICITA LEER ATENTAMENTE LO SIGUIENTE

* Responda claramente cada punto, detallando con la mayor precisión posible lo solicitado.
* Sea prolijo y ordenado en el desarrollo de los temas.
* Sea cuidadoso con las faltas de ortografía y sus oraciones.
* No desarrollar el examen en lápiz.
* Aprobación del examen: Con nota mayor o igual a 4 (cuatro)
* Condiciones de aprobación: 60%
* Duración de examen: 2 horas.

---

1. [1 punto]: Tradúzcase al lenguaje simbólico el siguiente enunciado: Para aprobar la materia Lógica y Programación, el estudiante debe concurrir a clase, desarrollar un TP aceptable y demostrar que dicho TP ha sido desarrollado por él; o desarrollar un TP aceptable y aprobar el final.

    ```plain
    Sol:
    p = El estudiante concurre a clase.
    q = El estudiante desarrolla un TP aceptable.
    r = El estudiante demuestra que el TP ha sido desarrollado por él.
    s = El estudiante aprueba el final.
    t = El estudiante aprueba la materia Lógica y Programación.

    ((p ^ q ^ r) v (q ^ s)) -> t
    ```

1. [1 punto]: Decídase, mediante tabla de verdad, si la fórmula F : (p ^ q -> r v ¬s) -> (¬r ^ q -> ¬p) es tautología.

    ```plain
    Sol: F no es tautología 
    ```

1. [2 puntos]: Dedúzcase la verdad o falsedad del siguiente enunciado: El segundo parcial de Lógica y Programación es el 12 de junio. Se sabe que: El repositorio del GitHub tiene un error o el segundo parcial de Lógica y Programación no es el 12 de junio. Si el segundo parcial de Lógica y Programación es el 12 de junio entonces el repositorio del GitHub tiene un error. El segundo parcial de Lógica y Programación es el 19 de junio si y solo si el repositorio del GitHub tiene un error y el período de parciales no termina el 16 de junio. Teniendo en cuenta que el período de parciales termina el 16 de junio y que el repositorio del GitHub tiene un error.

    ```plain
    Sol:
    p = El repositorio del GitHub tiene un error.
    q = El segundo parcial de Lógica y Programación es el 12 de junio.
    r = El segundo parcial de Lógica y Programación es el 19 de junio.
    s = El período de parciales termina el 16 de junio.

    (p v ¬q), (q -> p), (r <-> (p ^ ¬s)) .:. q

    Jugando con los valores de verdad, dado p verdadero, si q fuera falsa, por ejemplo, se puede observar que los dos primeros enunciados son verdaderos. Para el tercer enunciado suponiendo s verdadero, por el complemento queda falso. P ya era verdadero así es que esa conjunción queda falsa. Asumo que r es falso para lograr que ese bincondicional sea verdadero y así poder mostrar que dados los enunciados verdaderos, la conclusión es falsa.

    (p v ¬q), (q -> p), (r <-> (p ^ ¬s)) .:. q

    (p v ¬q):
      p : V (ya se daba por defecto)
     ¬q : V (puse F, pero por el complemento cambió a V)

    (q -> p):
      q : F
      p : V (ya se daba por defecto)

    (r <-> (p ^ ¬s)):
      r : F (la única manera que el bicondicional sea V)
      p : V (ya se daba por defecto)
     ¬s : F (ya se daba por defecto s verdadero)

    [Solución](https://github.com/lpamoroso/Fundamentos-de-teoria-de-la-computacion/blob/master/practica_6.md)

    ```

1. [2 puntos]: Formalícese la siguiente sentencia utilizando los símbolos indicados: No hay ningún programa que resuelva todos los problemas.
(Símbolos: P(x) representa que x es un programa y R(x, y) representa que x resuelva a y).

    ```plain
    Sol: ¬∃x(P(x) ^ ∀y(P(y) -> R(x, y)))
    ```

1. [1 punto]: Cálculese la forma normal conjuntiva de la fómula F : p ∨ q <-> ¬r

    ```plain
    Sol:
    p ∨ q <-> ¬r
    ≡ (p ∨ q -> ¬r) ^ (¬r -> p ∨ q)         [por (1)]
    ≡ (¬(p ∨ q) ∨ ¬r) ^ (¬¬r ∨ p ∨ q)       [por (2)]
    ≡ ((¬p ^ ¬q) ∨ ¬r) ^ (r ∨ p ∨ q)        [por (3) y (5)]
    ≡ ((¬p ∨ ¬r) ^ (¬q ∨ ¬r)) ^ (r ∨ p ∨ q) [por (7)]
    ```

1. [3 puntos]: Explíquese la interpretación adecuada y cuales son las fórmulas que corresponden a cada uno de los enunciados: E1: Algunos robots sólo obedecen a los amigos del programador jefe. E2: Todos los robots obedecen a los amigos del programador jefe. Y las cuatro fórmulas que siguen:
    F1: ∀x ∀y (P(x) ^ S(y, c) -> R(x, y))
    F2: ∃x (P(x) ^ ∀y (R(x, y) -> S(y, c)))
    F3: ∀y (S(y, c) -> ¬∃x (P(x) ^ ¬R(x, y)))
    F4: ∃x ∀y (P(x) ^ ¬(R(x, y) ^ ¬S(y, c)))

    ```plain
    Sol:
    La interpretación adecuada de los símbolos de las fórmulas es
    P(x) : x es un robot
    R(x, y) : x obedece a y
    S(x, y) : x es amigo de y
    c : el programador jefe
    Las fórmulas F1 y F3 representan el enunciado E2 y las fórmulas F2 y F4 representan el enunciado E1.
    ```
