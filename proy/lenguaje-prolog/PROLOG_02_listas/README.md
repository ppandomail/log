# Listas

* Son una de las estructuras de datos más utilizadas en los programas en lenguaje Prolog y responden a la
siguiente definición:
  * [] denota la lista vacia
  * [brasil, argentina, chile] denota una lista con 3 elementos
  * [X|Xs] denota una lista de cabeza X y cola Xs

| Consulta | Respuesta | Explicación |
| -- | -- | -- |
|  ?- [1,2,3] = [1\|[2\|[3\|[]]]]. | Yes | El sistema convierte internamente entre: [X,Y,Z] y [X\|[Y\|[Z\|[]]]]. También  [X,Y\|Z] y [X\|[Y\|Z]] |
| ?- [X\|Xs] = [1,2,3]. | X = 1 , Xs = [2,3] | |
| ?- [X\|Xs] = [1]. | X = 1 , Xs = [] | |
| ?- [X,Y\|Ys] = [1,2,3]. | X = 1 , Y = 2 , Ys = [3] | |
