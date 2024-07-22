# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Integrador 2024

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

1. [1.5 puntos]: Formalizar la siguientes frases:
    * Si saco buena nota en el selectivo me matricularé o en Física o en Matemáticas
    * Felicitaremos a nuestros jugadores ganen o pierdan
    * Si cuando corres 5 km terminas agotado, cuando te sugieran participar en una maratón recházalo

1. [1.5 puntos]: Formalizar las siguientes frases:
    * Hay programas que funcionan tanto en Linux como en Windows
    * Únicamente los programas que funcionan perfectamente son puestos a la venta
    * No es cierto que haya alguien que toque el piano a quien no le gusten las sinfonías de Beethoven

1. [1 puntos]: Respóndase ¿Cúal sería el valor de verdad de las siguientes fórmulas?, en el modelo M cuyo dominio son **C**írculos y c**U**adrados que pueden tomar estilos: Plain, **N**egrita y ***K***ursiva. Ejemplo: Universo = {**(b)**, ***(a)***, ()}>
    * K(a)
    * ∃x P(x) ^ (U(x) v C(b))
    * P(a) -> U(b)
    * K(a) ^ N(b)
    * ¬U(a)
    * N(a) -> ∃x P(x) ^ U(x)

1. [1 punto]: Constrúyase un nuevo modelo del universo anterior y enumérese dos fórmulas cuantificadas (una verdadera y la otra falsa)

1. [1.5 puntos]: Escríbase una frase y transfórmese a Lógica de predicado, Cláusula de Horn y Prolog

1. [2 puntos]: Escríbase un predicado busca(Exp, Lista, Filtro) que dada una expresión regular (\*e, e\*, \*e\*), una lista de cadenas, devuelva en Filtro una lista de palabras que encajen con la expresión regular. Por ejemplo, ?- busca(pa*, [el, papa, de, paco, planto, dos, arboles, con, la, pala], Filtro). El intérprete escribirá [papa, paco, pala]

1. [1.5 puntos] Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} if y = 0 then x := 0 else x := y - 1 {x > y}
