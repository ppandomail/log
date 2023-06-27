# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Parcial junio 2023

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

1. [2 puntos]: Codifíquese en Prolog el problema de aprobar un parcial, teniendo en cuenta: que lo puede aprobar un alumno que lee el material, asiste a clases, hace ejercicios. También lo puede aprobar un sabelotodo. También quien tenga un tutor que haya aprobado el parcial. Tomás y Juan aprueban el parcial.

    ```prolog
    aprueba_parcial(X) :- alumno(X), lee_material(X), asiste_a_clases(X), realiza_ejercicios(X).
    aprueba_parcial(X) :- alumno(X), sabe_todo(X).
    aprueba_parcial(X) :- alumno(X), tutor(Y,X), aprueba_parcial(Y), .
    alum(maria). alum(alfredo). alum(tomas). alum(susana). alum(juan).
    lee_material(alfredo). lee_material(maria).
    asiste_a_clases(alfredo). asiste_a_clases(maria).
    realiza_ejercicios(alfredo). realiza_ejercicios(maria).
    sabe_todo(tomas).
    tutor(maria,juan). tutor(juan,susana).
    ```

1. [2 puntos]: Codifíquese a Prolog la siguiente información y muestre que soporta(mesa, mate) es verdadero.
:
    * Si Algo está encima de Otro, entonces Otro soporta a Algo.
    * Si Algo está arriba de Otro y se tocan una y otra, entonces Algo está encima de Otro.
    * El mate está arriba de la mesa.
    * El mate toca a la mesa.

    ```prolog
    arriba(mate, mesa).
    toca(mesa, mate).
    soporta(mate, mesa).
    encima(Otro, Algo):- soporta(Algo, Otro).
    encima(Otro, Algo):- arriba(Algo, Otro), toca(Algo, Otro).
    ```

1. [2 puntos]: Prográmese en Prolog una regla invertir que dada una lista de listas de longitud 2 o mayor, evalúe True si el segundo argumento es otra lista cuyos elementos están invertidos. Las listas que deben ser tratadas no se deben limitar a una profundidad de dos niveles de paréntesis. Se deben considerar listas de cualquier nivel de anidamiento. Ejemplos: ?– invertir([[a, 1], [a, 2], [b, 1], [b, 2]], [[2, b], [1, b], [2, a], [1, a]]).  ----> True

    ```prolog
    concatenar([], L, L). 
    concatenar([X|Xs], Y, [X|Zs]) :- concatenar(Xs, Y, Zs). 
    invertir([], []). 
    invertir([X|Y], A) :- atomic(X), invertir(Y, B), concatenar(B, [X], A). 
    invertir([X|Y], A) :- not(atomic(X)), invertir(X, X1), invertir(Y, B), concatenar(B, [X1], A). 
    ```

1. [2 puntos]: Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} aux := aux + beta; beta := aux * beta {beta > aux}

    ```plain
    wp(aux := aux + beta; beta := aux * beta, beta > aux)
    wp(aux := aux + beta, wp(beta := aux * beta, beta > aux))
    wp(aux := aux + beta, (beta > aux) {beta/aux * beta})
    wp(aux := aux + beta, aux * beta > aux)
    Alt 1
    wp(aux := aux + beta, (beta > 1 ^ aux >= 0) v (beta < 1 ^ aux <= 0))
    (beta > 1 ^ aux >= 0) v (beta < 1 ^ aux <= 0) {aux / aux + beta}
    (beta > 1 ^ (aux + beta) >= 0) v (beta < 1 ^ (aux + beta) <= 0)
    (beta > 1 ^ aux >= -beta) v (beta < 1 ^ aux <= -beta)
    Alt 2
    aux * beta > aux {aux / aux + beta}
    (aux + beta) * beta > (aux + beta)
    beta > 1

    ```

1. [2 puntos]: Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} if beta = 0 then alfa := 0 else alfa := beta - 1 {alfa = beta}

    ```plain
    wp(if beta = 0 then alfa := 0 else alfa := beta - 1 , alfa = beta)
    (beta = 0 -> wp(alfa := 0, alfa = beta) ^ ¬(beta = 0) -> alfa := beta -1, alfa = beta)
    (beta = 0 -> alfa = beta {alfa / 0}) ^ (beta != 0 -> alfa = beta {alfa / beta - 1})
    (beta = 0 -> beta = 0) ^ (beta != 0 -> beta - 1 = beta)
    T ^ (beta != 0 -> F)
    beta != 0 -> F
    ¬(beta != 0) v F
    beta = 0 
    ```

---
