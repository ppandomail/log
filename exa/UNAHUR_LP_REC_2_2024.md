# UNIVERSIDAD NACIONAL DE HURLINGHAM

## Instituto de Tecnología e Ingeniería

## LÓGICA Y PROGRAMACIÓN

### Profesor: Mag. Ing. Pablo Pandolfo

---

### Recuperatorio Parcial 2 julio 2024

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

1. [3 puntos]: Escríbase una frase y transfórmese a Lógica de predicado, Cláusula de Horn y Prolog

  ```plain
  Frase:  B cuida a P si B está en paro y P es bueno
  L Pred: paro(B) ^ bueno(P) -> cuida(B,P)
  C Horn: cuida(B,P) -> paro(B) ^ bueno(P)
  Prolog: cuida(B,P) :- paro(B), bueno(P).
  ```

1. [4 puntos]: Escríbase un predicado busca(Exp, Lista, Filtro) que dada una expresión regular (\*e, e\*, \*e\*), una lista de cadenas, devuelva en Filtro una lista de palabras que encajen con la expresión regular. Por ejemplo, ?- busca(pa*, [el, papa, de, paco, planto, dos, arboles, con, la, pala], Filtro). El intérprete escribirá [papa, paco, pala]

  ```prolog
  busca(Exp, Lista, Filtro) :-
      findall(Palabra, (member(Palabra, Lista), coincide(Exp, Palabra)), Filtro).

  % Predicado auxiliar para verificar si una palabra coincide con la expresión regular
  coincide(Exp, Palabra) :-
      sub_atom(Exp, 0, 1, _, '*'), !, % Verifica si la expreción empieza con '*'
      sub_atom(Exp, 1, _, 0, E), % Estrae la subcadena después de '*'
      sub_atom(Palabra, _, _, 0, E).

  coincide(Exp, Palabra) :-
      sub_atom(Exp, _, 1, 0, '*'), !, % Verifica si la expresión termina con '*'
      sub_atom(Exp, 0, _, 1, E), % Extrae la subcadena antes de '*'
      sub_atom(Palabra, 0, _, _, E).

  coincide(Exp, Palabra) :-
      sub_atom(Exp, 0, 1, _, '*'), % Verifica si la expresión contiene '*' al inicio y al final
      sub_atom(Exp, 1, _, 1, E), % Extrae la subcadena entre los '*'
      sub_atom(Palabra, _, _, _, E).
  ```

1. [3 puntos] Calcúlese detalladamente la precondición más débil para el siguiente algoritmo {pmd} if y = 0 then x := 0 else x := y - 1 {x > y}

  ```plain
  wp(if y = 0 then x := 0 else x := y - 1, (x > y))
  (y = 0 -> wp(x := 0, x > y)) ^ (y != 0 -> wp(x := y - 1, x > y))
  (y = 0 -> x > y {x/0}) ^ (y != 0 -> x > y {x/y-1})
  (y = 0 -> 0 > y) ^ (y != 0 -> y - 1 > y)
  Falso
  ```
