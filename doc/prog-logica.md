# Prolog

## Programación lógica

* El modelo de base de datos más utilizado en la actualidad es el relacional (MR).
* En el MR se expresan los datos mediante relaciones o tuplas, ofreciendo gran flexibilidad en la consulta (SQL) a diferencias de otros modelos (jerárquico y red) que era necesario tener en cuenta detalles de implementación.

```prolog
padre(juan, pedro)
padre(maria, pedro)
% ...
hermano(pedro, vicente)
hermano(pedro, alberto)
% ...
```

* Suponer que queremos tener la relación tio que exprese quien es el tio de quien.

```prolog
tio(juan, vicente)
```

* Si hacemos esto, requeriria una cantidad cuadrática de espacio y podria introducir inconsistencias entre relaciones, al ser la relación tio una consecuencia lógica de las otras dos.
* Una solución mejor puede ser el Modelo de BD deductivas, que permite agregar reglas deductivas:

```prolog
VxVyVz (tio(x, y) v ¬padre(x, z) v ¬hermano(z, y)))
```

* Sin los cuantificadores universales, puede escribirse como la cláusula de Horn

```prolog
tio(x, y) v ¬padre(x, z) v ¬hermano(z, y)
```

* En la programación lógica, el programa especifica conocimiento acerca del problema a resolver; se hace pregunta y se deja que el sistema deduzca la respuesta usando procesos basados en la lógica matemática (lógica de predicado).
  * Basado en lógica de primer orden (reglas de la lógica, lenguaje preciso para expresar conocimiento).
  * Deducir consecuencias a partir de premisas (inferir conclusiones a partir de datos).

### Programas lógicos

* La misma BD del ejemplo, también puede escribirse como un programa lógico.
* Ejemplo en PROLOG:

```prolog
padre(juan, pedro).
padre(maria, pedro).
hermano(pedro, vicente).
hermano(pedro, alberto).
tio(x, y) :- padre(x, z), hermano(z, y).

```

* Todas las claúsulas de un programa Prolog son cláusulas de Horn.
* Basado en lógica de primer orden: lenguaje preciso para expresar conocimiento.
* Establece QUE es lo que se dabe hacer sin dar ninguna especificación sobre el COMO hacerlo.
* Al programa lógico (BD deductiva), formada por la conjunción de las 5 cláusulas lo llamaremos F.
* Suponer que queremos saber si F |= 3u 3v tio(u, v), es decir, si existe un sobrino u cuyo tio es v.
* Clausula objetivo (literales negativos, negación de lo queremos demostrar): ¬tio(u, v)
* Forma clausal (numerada):

```prolog
1: padre(juan, pedro)
2: padre(maria, pedro)
3: hermano(pedro, vicente)
4: hermano(pedro, alberto)
5: tio(x, y) v ¬padre(x, z) v ¬hermano(z, y)
6: ¬tio(u, v)
```

* Ahora por resolución, podemos obtener la siguiente refutación:

```prolog
7: ¬padre(u, z) v ¬hermano(z, v)   (de 5 y 6)
8: ¬hermano(pedro, v)              (de 7 y 1)
9: []                              (de 8 y 3)
```

* Se ha obtenido la clausula vacia, sabemos que efectivamente F |= 3u 3v tio(u, v). También podemos saber quiénes son este sobrino u y su tio v.
* Si inspeccionamos la refutación, vemos que u se ha instanciado con juan y v con vicente.
* Se ha calculado la respuesta (juan, vicente) para la pregunta "¿ F |= 3u 3v tio(u, v)  ?"

## Historia

* PROLOG: del francés PROgrammation en LOGique.
* Originado en Francia a principio de los 70s (1972) por Alain Colmerauer y Philippe Roussel (Universidad de Marsella, Francia).
* En 1995 fue estandarizado,bajo ISO (como C++, Ada, Fortran)
* Es un lenguaje de programación lógico (declarativo opuesto a procedimentales) e interpretado.
* Basado en reglas de la lógica.
* Usado habitualmente en el campo de la Inteligencia Artificial, particularmente en el campo de sistemas expertos y procesamiento del lenguaje natural.
* También es útil en problemas combinatorios, dada la naturaleza combinatoria del mecanismo de backtracking.

## Instalación

```sh
$sudo apt-get update
$sudo apt-get install gprolog
```

* Para usarlo online:  [Prolog Online](https://swish.swi-prolog.org/)

## Sintaxis

* Un programa en Prolog es un conjunto de Hechos (átomos) y Reglas (cláusulas de Horn, es la condición).
* Clausulas de Horn, constituyen reglas del tipo "modus ponendo ponens", es decir, "si es verdad el antecedente, entonces es verdad el consecuente".
* Forma de escribir las cláusulas de Horn es al contrario de lo habitual. Primero se escribe el consecuente y luego el antecedente. Ejemplo: "Si el león come carne, entonces es carnívoro" ---->>>  carnivoro(leon) := comecarne(leon).
* El antecedente puede ser una conjunción de condiciones que se denomina secuencia de objetivos.
* Las variables (elementos indeterminados) empiezan con mayúsculas o el carácter subrayado. Ejemplo: Contador.
* Las constantes o átomos (elementos determinados, que representan algo) empiezan con minúsculas. Ejemplo: socrates.
* No se aceptan constantes con espacios en blanco, en lugar de ello se usa el guión bajo. Ejemplo: primer_ministro.
* Los números son cadenas de texto compuestas de dígitos. No se distingue entre ints, floats, etc. Ejemplo: 15.
* Los compuestos son términos recursivos, se componen de un átomo y entre paréntesis y separados por comas, más términos. Ejemplo: libro(don_quijote, cervantes).
* Cada afirmación debe terminar con un punto.
* Los comentarios empiezan con el símbolo %. Ejemplo: % un comentario
* Los términos pueden llevar asociado un cuerpo. El cuerpo es un conjunto de predicados que tienen que ser verdaderos para poder afirmar que el término es verdadero. A esto se lo llama regla.
* Si el término no lleva cuerpo, se dice que es un hecho y es verdadero siempre.
* Sintaxis GIC:

```grammar
H -> TER.
R -> TERS :- TERS.
Q -> TERS. 
TER -> NUM | ATOMO | VAR | ATOMO (TERS)
TERS -> TER | TER,TERS
```

* Ejemplos de términos: 1975, pepe, X, padre(pepe, ana), ...

### Ejemplo socrates

```prolog
humano(socrates).
mortal(X) :- humano(X).

% ¿socrates es humano?
?- humano(socrates).
true.

% ¿socrates es mortal?
?- mortal(socrates).
true.

% ¿Y adrian?
?- mortal(adrian).
false.

% ¿Cuántos humanos hay?
?- humano(X).
X = socrates.

% ¿Y cuantos mortales?
?- mortal(X).
X = socrates.

% hola mundo clásico, podemos usar write y nl.
?- write('Hola Mundo'), nl.
Hola Mundo
true.
```

### Ejemplo Familia

```prolog
padre(juan, pedro).
padre(maria, pedro).
hermano(pedro, vicente).
hermano(pedro, alberto).
hermano(A, B) :- padre(P, A), padre(P, B), A\==B.
nieto(A, B) :- padre(P, A), padre(B, P).
tio(X, Y) :- padre(X, Z), hermano(Z, Y).
```

### Ejemplo Comunicacion

```prolog
habla(ale, ruso).
habla(juan, ingles).
habla(maria, ruso).
habla(maria, ingles).
se_comunica(X, Y) :- habla(X, L), habla(Y, L), X \==Y.
```

### Ejemplo Edades

```prolog
persona(ana).
persona(pepe).
persona(juan).
persona(jose).
edad(23, ana).
edad(19, pepe).
edad(14, juan).
edad(5, jose).
persona_mayor_edad(P) :- persona(P), edad(E, P), E > 18.
persona_mayor_que(P1, P2) :- persona(P1), persona(P2), edad(E1, P1), edad(E2, P2), E1 > E2.

?- persona_mayor_edad(pepe).
yes.

?- persona_mayor_que(jose, ana).
no.
```

### Ejemplo Hanoi

```prolog
hanoi(1, A, B, C) :- write(‘Mueve del ‘), write(A), write(‘ al ‘), write(C), nl.
hanoi(N, A, B, C) :- N>1, M is N-1, hanoi(M, A, C, B), hanoi(1, A, B, C), hanoi(M, B, A, C).

?- hanoi(3, a, b, c).
Mueve del a al c
Mueve del a al b
Mueve del c al b
Mueve del a al c
Mueve del b al a
Mueve del b al c
Mueve del a al c
yes.
```

## Semántica

* Los programas Prolog son una base de conocimiento.
* Esta base de conocimiento es dinámica.
* El código fuente es simplemente el estado inicial de la base de "datos"
* Inicialmente Prolog se diseña como un lenguaje orientado a consultas (como SQL).
* La información se extrae por medio de consultas (Querys). Su ejecución se basa en unificación y backtracking.
* No es necesario programar el mecanismo de búsqueda.
* En el terminal escribimos predicados para ver si son ciertos o no, dado el conocimiento del programa.
* Cuando introducimos variables, busca valores para las variables que cumplan el predicado.
* La estrategia de resolución de Prolog se llama resolución SLD (Selection-rule driven Linear resolution for Definite clauses); es decir, generalización del modus ponendo ponens junto con la unificación.

### Backtracking

* Rastreo inverso.
* Permite encontrar una solución si es que existe alguna.
* Cuando fracasa la unificación de un predicado vuelta atrás y ensayo de otra unificación.
* Algoritmo:
   1. Dado un objetivo, busca algún compuesto con el mismo functor, en la base de conocimiento (de arriba a abajo).
   2. Si es un hecho, unifica con él. (explicación más adelante)
   3. Si es una regla, pasa a tratar de demostrar el cuerpo de la regla.
   4. Si llega a un punto en el que no puede continuar, falla. Vuelve hacia atrás, deshace todas las unificaciones realizadas y si hay algún punto de elección, toma otra ruta.
* Podemos pensar que el algoritmo va haciendo un árbol intentando encontrar algo en la base de conocimiento que satisfaga el predicado de entrada.
* O viendo cada predicado, podemos ver como puede pasar Prolog en un sentido hacia delante o hacia atrás.

´´´
?- trace, mortal(X).
Call:mortal(_1390)
 Call:humano(_436)
 Exit:humano(socrates)
Exit:mortal(socrates)
X = socrates

?- trace, tio(U, V).            % objetivo
Call:tio(_1578,_1574)           % busca la 1ra cláusula que unifique
 Call:padre(_472,_708)          % nos da, un nuevo objetivo (meta)
 Exit:padre(juan,pedro)         % unifica
 Call:hermano(pedro,_468)       % nos da, un nuevo objetivo (meta)
 Exit:hermano(pedro,vicente)    % unifica
Exit:tio(juan,vicente)          % unifica
U = juan,
V = vicente
´´´

### Unificación

* En Prolog, la operación más básica es la unificación.
* Deducción a través de sustituciones.
* Permite usar variables como lugares para acomodar datos, lugares que se utilizarán después.
* Proceso de localizar patrones que "emparejen" términos.
* Se realiza mediante el operador =
* Si hay una variable y una constante, la variable queda ligada a la constante (sustitución)

```prolog
?- a = X.
X = a.

?- f(X, a) = f(b, Y)
X = b
Y = a

?- book(Name, Author) = book('Don Quijote', 'Cervantes').
Name = 'Don Quijote', Author = 'Cervantes'.
```

* Si hay dos constantes, se comprueba que sean iguales.

```prolog
?- a = b.
false.

?- a = a.
true.
```

* Si hay dos variables, se recuerda que ambas tienen que valer lo mismo, a partir de ese momento.

```prolog
?- X = Y.
X = Y.
```

## Operadores

* =   es el operador de unificación.
* \=  es el operador de no unificación.
* ,   es el operador lógico AND
* ;   es el operador lógico OR
* \+  es el operador lógico NOT
* is  es el operador = pero evalua el lado derecho antes (ej. X is 2+2)
* =:= es el operador = pero evalua ambos lados antes (ej. 4+5 =:= 3+6)

```prolog
?- X is 2+3.
X = 5


suma(A, B, C) :- C is A + B.

?- suma(3, 4, C).
C = 7


fact(0, 1).
fact(X, F) :- X1 is X-1, fact(X1, F1), F is X*F1.

?- fact(6, F).
F = 720


vuelo(ezeiza,natal,200).
vuelo(natal,ezeiza,100).
vuelo(ezeiza,paulo,100).
vuelo(paulo,ezeiza,80).
vuelo(paulo,natal,50).
vuelo(natal,paulo,50).
vuelo(natal,recife,50).
vuelo(recife,natal,50).
vuelo(X, Y, Precio) :- vuelo(X, Z, P1), vuelo(Z, Y, P2), Precio is P1+P2.
idavuelta(X, Y, Precio) :- vuelo(X, Y, P1), vuelo(Y, X, P2), Precio is P1+P2.

?- idavuelta(ezeiza,recife,P).
P = 400
```

## Estructuras

* Se pueden utilizar varios datos a las vez:

```prolog
nacimiento(pablo, fecha(9,nov,1985)).

?- nacimiento(pablo, X).
X = fecha(9,nov,1985)

?- nacimiento(X, fecha(D,nov,A)).
A = 1985
D = 9
X = pablo

?- nacimiento(X, fecha(_,nov,_)).
X = pablo

```

## Ciclos

* En Prolog, casi no se usan los ciclos.
* En lugar de ellos se aplica recursividad
* Ejemplo: para imprimir los números del 1 al 10:

```prolog
lista(M, N):- M<N+1, nl, write(M), NuevoM is M+1, lista(NuevoM, N).

?- lista(1, 4).
1
2
3
4
```

## Listas

* No hay matrices, en su lugar se usan listas.
* La lista en Prolog es una estructura de datos básica.
* Es una lista enlazada, implementada mediante términos compuestos.
* Las listas se definen con corchetes y se puede usar la barra vertical para separar el primer elemento del resto.

```prolog
% lista con 3 elementos
[brasil, argentina, chile]

% lista vacia
[]
```

* Si se tiene la lista [a, b, c, d], la a es la cabeza y la cola es la lista [b, c, d]
* Una lista cuya cabeza es A y cola es B se anota como [A | B].
* El predicado primer_elemento(X, [X|_]). tiene éxito si X es el primer elemento de la lista.

```prolog
?- [X, Y|L] = [a, b, c]
X = a
Y = b
L = [c]
```

* Existen diversos predicados estándar para trabajar con listas como length/2, member/2, append/3, nth0 (elemento N contando desde cero en una lista), nth1 (elemento N contando desde 1 en una lista).

```prolog
?- length([a,b,c], N).
   N = 3.
?- length(X, 5).
   X = [_A,_B,_C,_D,_E].
?- member(X, [socrates,platon,aristoteles]).
   X = socrates
;  X = platon
;  X = aristoteles
?- member(platon, [socrates, platon, aristoteles]).
   true
?- append([a,b],[c,d], X).
   X = "abcd".
?- append([a,b],X,[a,b,c,d]).
   X = "cd".
?- append(X,Y,[a,b,c,d]).
   X = [], Y = "abcd"
?- append(X,Y,[a,b,c,d]).
   X = [], Y = "abcd"
;  X = "a", Y = "bcd"
;  X = "ab", Y = "cd"
;  X = "abc", Y = "d"
;  X = "abcd", Y = []

```

### Longitud de una lista

```prolog
long([], 0).
long([X|Y], N) :- long(Y, M), N is M+1.

?- longitud([a, b, c], L).
L=3
```

### Suma de una lista de números

```prolog
suma([], 0).
suma([H|T], S) :- suma(T, S1), S is H+S1.

?- suma([1,2,3,4], X).
X = 10.
```

### Pertenencia a una lista

```prolog
pert(X, [X|_]).                     % caso base: o bien X es el primero, o bien
pert(X, [_|L]) :- pert(X, L).       % caso recursivo: pertenece a la lista de los demás
                                    % el subrayado es una variable anonima. 

?- pert(X, [a, b, c]).
X = a
X = b
X = c
no
```

### Contar variables iguales en una lista

```prolog
contar(_,[],0).
contar(X,[X|L],C) :- !, contar(X,L,C1), C is C1+1.
contar(X,[_|L],C) :- contar(X,L,C).
```

### Concatenación de listas

```prolog
concat([], L, L).
concat([X, L1], L2, [X, L3]) :- concat(L1, L2, L3).

?- concat([a, b, c], [c, d, e], L).
L = [a, b, c, c, d, e]
yes
```

## Entrada/Salida

### Comando write

* Se usa para desplegar un texto o una variable en la pantalla.

```prolog
saludo(X):- nl, tab(4), write('Hola '), nl, tab(20), write(X).

?- saludo(pablo).
    Hola
                    pablo    

?- tio(U, V), write([U, V]), nl, fail.
[juan, vicente]
[juan, alberto]
[maria, vicente]
[maria, alberto]
no


imprimir([]).
imprimir( [A | B] ):- write(A), imprimir(B).

?- imprimir([1, 2, 3, 4]).
1234
```

### Comando read

* Se usa para capturar desde el teclado.

```prolog
name:- write('Nombre: '), read(Nombre), nl, write('Hola'), write(Nombre).

?- name.

```

## Operador de corte

* Operador de corte: un corte "!" siempre se satisface.
* Cuando se invoca detiene las inferencias y fijas las decisiones tomadas hasta ese momento.
* Impide el retroceso.
* Si se consigue unificar, entonces no hay que considerar la siguiente cláusula como alternativa.

```prolog
fact(0, 1) :- !.
fact(X, F) :- X1 is X-1, fact(X1, F1), F is X*F1.

?- fact(6, F).
F = 720
```

## Ejemplo evaluador de expresiones

* Representación de operadores lógicos como listas
* La negación se puede representar como una lista de dos elementos: la palabra neg y una expresión lógica.
* Las conjunciones, disyunciones, implicaciones y equivalencias se pueden representar como una lista de tres elementos: el alcance izquierdo, la conexión lógica y el alcance derecho.

* Conexiones binarias: and, or, then, iif
* Constantes lógicas son expresiones: v,f
* Variables lógicas son expresiones: p, q, r y s.
* Si A es una expresión: [neg, A] también lo es.
* Si A y B son expresiones y Con es una conexión lógica: [A, Con, B] es una expresión.

```prolog
conbi(and).
conbi(or).
conbi(then).
conbi(iif).
clog(v).
clog(f).
vlog(p).
vlog(q).
vlog(r).
vlog(s).
expr(X) :- clog(X).
expr(X) :- vlog(X).
expr([neg, A]) :- expr(A).
expr([A, Con, B]) :- expr(A), conbi(Con), expr(B).

% p & (q -> ¬r)
?- expr( [p, and, [q, then, [neg, r]]]).
true
```

* Consideraciones:
  1. La constante lógica v es verdadera
  2. Existe una lista de variables lógicas, todas las cuales son ciertas por definición.
  3. [neg, A] es cierto si A es falsa.
  4. [A, and, B] es cierto si A es cierto y B es cierto.
  5. [A, or, B] es cierto si A es cierto.
  6. [A, or, B] es cierto si B es cierto.
  7. [A, then, B] es cierto si A no es cierto.
  8. [A, then, B] es cierto si B es cierto.
  9. [A, iif, B] es cierto si [A, then, B] y [B, then, A] son ciertos.
  10. Suponemos que q y r son ciertas y todas las demás variables son falsas:

```prolog
true(q).
true(r).
true([neg, A]) :- \+(true(A)).
true([A, and, B]) :- true(A), true(B).
true([A, or, _]) :- true(A).
true([_, or, B]) :- true(B).
true([_, then, B]) :- true(B).
true([A, then, _]) :- \+(true(A)).
true([A, iif, B]) :- true([A, then, B]), true([B, then, A]).

% p ^ q
?- true([p, and, q]).
false

% p ^ (q -> ¬r)
?- true([p, and, [q, then, [neg, r]]]).
false


% r v (q -> ¬r)
?- true( [r, or, [q, then, [neg, r]]]).
true

```

## Ejercicios

1. Elabore un programa en Prolog con su árbol genealógico, donde los hechos sean únicamente predicados del tipo padre(-, -) o madre (-, -). Programe los predicados con las reglas necesarias para encontrar las relaciones de parentesco más comunes, tales como:
      1. hermano(A, B).
      1. primo(A, B).
      1. tio(A, B).
      1. hijo(A, B).
      1. nieto(A, B).
      1. abuelo(A, B).
      1. bisabuelo(A, B).
      1. bisnieto(A, B).
      1. cuñado(A, B).
      1. concuñado(A, B).

      ```prolog
      hermano(A, B) :- padre(P, A), padre(P, B).
      primo(A, B) :- padre(PA, A), padre(PB, B), hermano(PA, PB), PA \== PB.
      tio(A, B) :- padre(PB, B), hermano(PB, A).
      hijo(A, B) :- padre(B, A).
      ```

1. Traduzca los siguientes programas Prolog a fórmulas del cálculo de predicados de primer orden:
      1. humano(Sócrates). mortal(X):- humano(X). consulta: mortal(X).
      1. mujer(Maria). mujer(Ana). padre(Juan, Maria). hija(X, Y):- padre(Y, X), mujer(X). abuelo(X, Z):- padre(X, U), padre(U, Z). consulta: hija(X, Juan).

1. Definir la relación primero (L, X) que se verifique si X es el primer elemento de la lista L.

      ```prolog
      primero([X | _], X).
      ```

1. Definir la relación resto (L1, L2) que se verifique si L2 es la lista obtenida a partir de la lista L1 suprimiendo el primer elemento.

      ```prolog
      resto([_ | L], L).
      ```

1. Definir la relación cons(X, L1, L2) que se verifique si L2 es la lista obtenida añadiendo X a L1 como primer elemento.

      ```prolog
      cons(X, L, [X | L]).
      ```

1. Definir la relación pertenece (X, L) que se verifique si X es un elemento de la lista L.

      ```prolog
      pertenece(X, [X | _).
      pertenece(X, [_ | L) :- pertenece(X, L).
      ```

1. Definir la relación conc(L1, L2, L3) que se verifique si L3 es la lista obtenida escribiendo los elementos de L2 a continuación de los elementos de L1.

      ```prolog
      conc([], L, L).
      conc([X | L1], L2, [X | L3]) :- conc(L1, L2, L3).
      ```

1. Definir la relación inversa(L1, L2) que se verifique si L2 es la lista obtenida invirtiendo el orden de los elementos de la lista L1.

      ```prolog
      inversa([],[]).
      inversa([X | L1], L2) :- inversa(L1, L3), append(L3, [X], L2).
      ```

1. Definir la relación palíndromo(L) que se verifique si la lista L es un palíndromo.

      ```prolog
      palíndromo(L) :- reverse(L, L).
      ```

1. Definir la relación último(X, L) que se verifique si X es el último elemento de la lista L.

      ```prolog
      Sol1:   ultimo(X, L) :- append(_, [X], L).
      Sol2:   ultimo(X, L) :- reverse(L, [X | _]).
      Sol3:   ultimo((X, [X]).   ultimo(X, [_ | L]) :- ultimo(X, L).
      ```

1. Definir la relación penúltimo(X, L) que se verifique si X es el penúltimo elemento de la lista L.

      ```prolog
      Sol1:   penúltimo(X, L) :- append(_, [X, _], L).
      Sol2:   penúltimo(X, L) :- reverse(L, [_, X | _]).
      Sol3:   penúltimo((X, [X]).   penúltimo(X, [_, Y | L]) :- penúltimo(X, [Y, L]).
      ```

1. Definir la relación selecciona(X, L1, L2) que se verifique si L2 es la lista obtenida eliminando una ocurrencia de X en L1.

      ```prolog
      selecciona(X, [X | Y], L).
      selecciona(X, [Y | L1], [Y | L2]) :- selecciona(X, L1, L2).
      ```

1. Definir la relación inserta(X, L1, L2) que se verifique si L2 es una lista obtenida insertando X en L1.

      ```prolog
      inserta(X, L1, L2) :- select(X, L2, L1).
      ```

1. Definir la relación sublista(L1, L2) que se verifique si L1 es una sublista de L2.

      ```prolog
      sublista(L1, L2) :- append(_L3, L4, L2), append(L1, _L5, L4).
      ```

1. Definir la relación todos_iguales(L) que se verifique si todos los elementos de la lista L son iguales entre sí.

      ```prolog
      todos_iguales([ ]).
      todos_iguales([_]).
      todos_iguales([X, X | L]) :- todos_iguales([X | L]).
      ```

1. Definir la relación longitud_par(L) que se verifique si la longitud de la lista L es par.

      ```prolog
      longitud_par([ ]).
      longitud_par([_ | L]) :- longitud_impar(L).
      longitud_impar([ _ ]).
      longitud_impar([_ | L]) :- longitud_par(L).
      ```

1. Definir la relación rota(L1, L2) que se verifique si L2 es la lista obtenida a partir de L1 colocando su primer elemento al final.

      ```prolog
      rota([X | L1], L) :- append(L1, [X], L).
      ```

1. Definir la relación subconjunto(L1, L2) que se verifique si L2 es un subconjunto de L1.

      ```prolog
      subconjunto([ ], [ ]).
      subconjunto([X | L1], [X | L2]) :- subconjunto(L1, L2).
      subconjunto([_ | L1], L2) :- subconjunto(L1, L2).
      ```

1. Definir la relación máximo(X, Y, Z) que se verifique si Z es el máximo de X e Y.

      ```prolog
      máximo(X, Y, X) :- X >= Y.
      máximo(X, Y, Y) :- X < Y.
      ```

1. Definir la relación factorial(X, Y) que se verifique si Y es el factorial de X.

      ```prolog
      factorial(1, 1).
      factorial(X, Y) :- X > 1, X1 is X-1, factorial(X1, Y1), Y is X * Y1.  
      ```

1. Definir la relación fibonacci(N, X) que se verifique si X es el N-ésimo término de la sucesión de Fibonacci.

      ```prolog
      fibonacci(0, 0).
      fibonacci(1, 1).
      fibonacci(N, X) :- N > 1, N1 is N-1, fibonacci(N1, X1), N2 is N-2, fibonacci(N2, X2), X is X1+X2.
      ```

1. Definir la relación longitud(L, N) que se verifique si N es la longitud de la lista L.

      ```prolog
      longitud([ ], 0).
      longitud([_ | L], N) :- longitud(L, N1), N is N1 + 1. 
      ```

1. Definir la relación lista_acotada(L) que se verifique si todos los elementos de la lista de números L son menores que la longitud de L.

      ```prolog
      lista_acotada(L) :- length(L, N), lista_acotada_aux(L, N).
      lista_acotada_aux([ ], _).
      lista_acotada_aux([X | L], N) :- X < N, lista_acotada_aux(L, N).
      ```

1. Definir la relación max_lista(L, X) que se verifique si X es el máximo de la lista de números L.

      ```prolog
      max_lista([X], X).
      max_lista([X1, X2 | L], Y) :- X3 is max(X1, X2), max_lista([X3 | L], Y).
      ```

1. Definir la relación suma_lista(L, X) que se verifique si X es la suma de los elementos de la lista de números L.

      ```prolog
      suma_lista([ ], 0).
      suma_lista([X | L], Y) :- suma_lista(L, Y1), Y is X+Y1.
      ```

1. Definir la relación ordenada(L) que se verifique si la lista de números está ordenada de manera creciente.

      ```prolog
      ordenada([_]).
      ordenada([X, Y | L]) :- X =< Y, ordenada([Y | L]).
      ```

1. Definir la relación lista(N, L) que se verifique si L es la lista de longitud N cuyos elementos son N.

      ```prolog
      lista(N, L) :- lista_aux(N, N, L).
      lista_aux(_, 0, [ ]).
      lista_aux(N, M, [N | L]) :- M > 0, M1 is M-1, lista_aux(N, M1, L).
      ```

1. Definir la relación entre(N1, N2, X) que se verifique si X es un número entero tal que N1 ≤ X ≤ N2.

      ```prolog
      entre(N1, N2, N1) :- N1 =< N2.
      entre(N1, N2, X) :- N1 < N2, N3 is N1+1, entre(N3, N2, X).
      ```

1. Definir la relación elemento_en(K, L, X) que se verifique si X es el K-ésimo elemento de la lista L(se empieza a numerar en 1).

      ```prolog
      elemento_en(1, [X | _], X).
      elemento_en(K, [_ | L], X) :- K > 1, K1 is K-1, elemento_en(K1, L, X).
      ```

1. Definir la relación multiplicada(L1, N, L2) que se verifica si L2 es la lista obtenida repitiendo N veces los elementos de la lista L1

      ```prolog
      multiplicada(L1, N, L2) :- multiplicada_aux(L1, N, N, L2).
      multiplicada_aux([ ], _, _, [ ]).
      multiplicada_aux([_ | L1], 0, N, L2) :- multiplicada_aux(L1, N, N, L2).
      multiplicada_aux([X | L1], K, N, [X | L2]) :- K > 0, K1 is K-1, multiplicada_aux([X |L1], K1, N, L2). 
      ```

1. Supongamos que representamos los puntos del plano mediante términos de la forma punto(X, Y) donde X e Y son números, y los segmentos del plano mediante términos de la forma segmento(P1, P2 donde P1 y P2 son los puntos extremos del segmento. Definir las relaciones vertical(S) y horizontal(S) que se verifiquen si el segmento S es vertical (resp. horizontal).

      ```prolog
      vertical(segmento(punto(X, Y), punto(X, Y1))).
      horizontal(segmento(punto(X, Y), punto(X1, Y))).
      ```

1. Representar un autómata finito utilizando las siguientes relaciones:
final(X) que se verifica si X es el estado final.
trans(E1, X, E2) que se verifica si se puede pasar del estado E1 al estado E2 usando la letra X.
nulo(E1, E2) que se verifica si se puede pasar del estado E1 al estado E2 mediante un movimiento nulo.
Definir la relación acepta(E, L) que se verifica si el autómata, a partir del estado E, acepta la lista L.

      ```prolog
      final(e3).
      trans(e1, a, e1).
      trans(e1, a, e2).
      trans(e1, b, e1).
      trans(e2, b, e3).
      trans(e3, b, e4).
      nulo(e2, e4).
      nulo(e3, e1).
      acepta(E, [ ]) :- final(E).
      acepta(E, [X | L]) :- trans(E, X, E1), acepta(E1, L).
      acepta(E, L) :- nulo(E, E1), acepta(E1, L).
      ```

1. El problema consiste en determinar caminos entre ciudades. Hay un camino entre dos ciudades si hay una ruta que las une. Además, hay un camino entre una ciudad x y una ciudad z, si hay una ruta que une a x con otra ciudad t, seguida de un camino de t a z.
    * Dadas cuatro ciudades a, b, c y d, se sabe que hay ruta entre: a y b;  a y c; b y c; c y d.
    * Se pide contestar: ¿Existe algún camino a la ciudad d?. Si existe, ¿desde que ciudad/es?
    * Formalizamos el problema en lógica de predicados de primer orden:
        * Dominio:  D = {a, b, c, d}
        * Predicados básicos:
            * ruta(x, y) = {(x, y) ∈ D^2: hay ruta de x a y} : ∀x ∀y(ruta(x, y) -> camino(x, y))
            * camino(x, y) = {(x, y) ∈ D^2: hay camino de x a y} : ∀x∀z∀t (ruta(x, t) ^ camino(t, z) → camino(x, z))

      ```prolog
      ruta(a, b).
      ruta(b, a).
      ruta(a, c).
      ruta(c, a).
      ruta(b, c).
      ruta(c, b).
      ruta(c, d).
      ruta(d, c).
      camino(X, Y) :- ruta(X, Y). 
      camino(W, Z) :- ruta(W, T), camino(T, Z).
      ```
