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
* Usado habitualmente en el campo de la Inteligencia Artificial.

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

### Backtracking - Algoritmo

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
