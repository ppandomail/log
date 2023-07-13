# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Parcial 1 julio 2023

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

1. [2 puntos]: Demuéstrese que (p ^ (p -> q)) -> es una tautología.

1. [2 puntos]: Demuéstrese que (p v q) ^ (r v p) ^ (¬q v ¬r v p) es equivalente a p.

1. Si el conjunto de símbolos de predicados es P = \<fe, al, est>, con el significado: fe(x) : "x se siente feliz"; al(x) : "x ama la lógica"; est(x, y) : "x es estudiante de y". Formalizar las frases:
    * [3 puntos] Todo profesor se siente feliz si todos sus estudiantes aman la lógica
    * [3 puntos] Todo profesor se siente feliz si no tiene estudiante

        ```plain
        ∀x (∀y (est(y, x) -> al(y)) -> fe(x))
        ∀x(∀y ¬est(y, x) -> fe(x))
        ```
