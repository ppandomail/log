# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Parcial junio 2024

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

1. [2.5 puntos]: Prográmese en Prolog la solución al problema de reducción de datos, por ejemplo: reduce([a, a, a, b, c, c, c, c, d, e], R). Donde R es el resultado R = [(a, 3), b, (c, 4), d, e]

    ```prolog
    /* Lista vacia */ 
    reduce([],[]).
    /* Un unico elemento */
    reduce([E], [E]).
    /* Cuando tenga solo un elemento no contiguo con otro no se hara compresion */
    reduce([C,C|Resto], [(C,2)|R] ) :- reduce([C|Resto], [C|R]).
    /* Toma los 2 primeros, si ambos son iguales*/
    reduce([C,C|Resto], [(C,N2)|R] ):- reduce([C|Resto], [(C,N)|R]), N2 is N+1.
    /* Toma los 2 primeros, si no son iguales  */
    reduce([C1,C2|Resto], [C1|R]):- C1 \= C2, reduce([C2|Resto], R).
    ```

1. [2.5 puntos]: Prográmese en Prolog la solución al problema de ampliación de datos, por ejemplo: amplia([3-a, b, 4-c, d, e], R). donde R es el resultado R = [a, a, a, b, c, c, c, c, d, e]

    ```prolog
    amplia([],[]).
    amplia([1-X|L1],[X|L2]) :- !, amplia(L1,L2).
    amplia([N-X|L1],[X|L2]) :- !, N1 is N - 1, amplia([N1-X|L1],L2).
    amplia([X|L1],[X|L2]) :- amplia(L1,L2).
    ```

1. [2.5 puntos]: Prográmese en Prolog un autómata dado el siguiente lenguaje: palabras que empieza con a, luego pueden o no venir a, b o c. Las palabras no pueden terminar con c. Ejemplos: {a, abbcca, acbccbb, ...}

    ```prolog
    final(q1).
    trans(q0, a, q1).
    trans(q1, a, q1).
    trans(q1, b, q1).
    trans(q1, c, q2).
    trans(q2, c, q2).
    trans(q2, a, q1).
    trans(q2, b, q1).
    acepta([], E) :- final(E).
    acepta([H|Q], E) :- trans(E, H, E2), !, acepta(Q, E2).
    ```

1. [0.5 puntos]: Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} x := x + 1; a := a - 1; {a + x > 0}

    ```plain
    a + x > 0
    ```

1. [0.5 puntos]: Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} if x >= y then x := 0 else x := 2 {(x = 0 v x = 2) ^ y = 1}

    ```plain
    y = 1
    ```

1. [1.5 punto]: Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} if x >= y then skip else x, y := y, x {x >= y}

    ```plain
    True
    ```

---
