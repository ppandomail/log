# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Parcial 2 julio 2023

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

1. Transfórmese la siguiente frase "A es hija de B si A es mujer y B es padre de A" a:
    * [1 punto] Lógica de predicado
    * [1 punto] Cláusula de Horn
    * [1 punto] Prolog

    ```plain
    Lógica de predicado: (mujer(A) ^ padre(B, A)) -> hija(A, B)
    Cláusula de Horn:    ¬mujer(A) v ¬padre(B, A) v hija(A, B)
    Prolog:              hija(A, B) :- mujer(A), padre(B, A).
    ```

1. [4 puntos]: Escríbase un predicado cond(L) que dada una lista de enteros L, escriba la lista que, para cada elemento de L dice cuantas veces aparece este elemento en L. Por ejemplo, si hacemos la consulta ?- cond([1, 2, 1, 5, 1, 3, 3, 7]). El intérprete escibirá [[1,3], [2,1], [5,1], [3,2], [7,1]]

1. [3 puntos] Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} x := 4;  y := 2; x := x+1; y := y+3 {x > y}

    ```plain
    wp(x := 4;  y := 2; x := x+1; y := y+3, x > y)
    wp(x := 4;  y := 2; x := x+1; wp(y := y+3, x > y))
    wp(x := 4;  y := 2; x := x+1; x > y {y / y+3})
    wp(x := 4;  y := 2; x := x+1; x > y+3)
    wp(x := 4;  y := 2; wp(x := x+1, x > y+3))
    wp(x := 4;  y := 2; x > y+3 {x / x+1})
    wp(x := 4;  y := 2; x+1 > y+3)
    wp(x := 4;  wp(y := 2, x+1 > y+3))
    wp(x := 4; x+1 > y+3 {y / 2})
    wp(x := 4; x+1 > 5)
    x+1 > 5 {x / 4}
    5 > 5
    F
    ```
