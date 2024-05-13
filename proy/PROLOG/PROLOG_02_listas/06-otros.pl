% Definir la relación cons(X, L1, L2) que se verifique si L2 es la lista obtenida añadiendo X a L1 como primer elemento.

cons(X, L, [X|L]).

% Definir la relación inversa(L1, L2) que se verifique si L2 es la lista obtenida invirtiendo el orden de los elementos de la lista L1.

inversa([],[]).
inversa([X|L1], L2) :- inversa(L1, L3), append(L3, [X], L2).

% Definir la relación palíndromo(L) que se verifique si la lista L es un palíndromo.

palíndromo(L) :- reverse(L, L).
    
% Definir la relación último(X, L) que se verifique si X es el último elemento de la lista L.

ultimo_v1(X, L) :- append(_, [X], L).
ultimo_v2(X, L) :- reverse(L, [X|_]).
ultimo_v3((X, [X]).   
ultimo_v3(X, [_|L]) :- ultimo_v3(X, L).

% Definir la relación penúltimo(X, L) que se verifique si X es el penúltimo elemento de la lista L.

penúltimo_v1(X, L) :- append(_, [X, _], L).
penúltimo_v2(X, L) :- reverse(L, [_, X | _]).
penúltimo_v3((X, [X]).
penúltimo_v3(X, [_,Y|L]) :- penúltimo_v3(X, [Y,L]).

% Definir la relación selecciona(X, L1, L2) que se verifique si L2 es la lista obtenida eliminando una ocurrencia de X en L1.

selecciona(X, [X|Y], L).
selecciona(X, [Y|L1], [Y|L2]) :- selecciona(X, L1, L2).

% Definir la relación inserta(X, L1, L2) que se verifique si L2 es una lista obtenida insertando X en L1.

inserta(X, L1, L2) :- select(X, L2, L1).

% Definir la relación sublista(L1, L2) que se verifique si L1 es una sublista de L2.

sublista(L1, L2) :- append(_L3, L4, L2), append(L1, _L5, L4).

% Definir la relación todos_iguales(L) que se verifique si todos los elementos de la lista L son iguales entre sí.

todos_iguales([]).
todos_iguales([_]).
todos_iguales([X, X|L]) :- todos_iguales([X|L]).

% Definir la relación longitud_par(L) que se verifique si la longitud de la lista L es par.

longitud_par([]).
longitud_par([_|L]) :- longitud_impar(L).
longitud_impar([_]).
longitud_impar([_|L]) :- longitud_par(L).

% Definir la relación rota(L1, L2) que se verifique si L2 es la lista obtenida a partir de L1 colocando su primer elemento al final.

rota([X|L1], L) :- append(L1, [X], L).

% Definir la relación subconjunto(L1, L2) que se verifique si L2 es un subconjunto de L1.

subconjunto([], []).
subconjunto([X|L1], [X|L2]) :- subconjunto(L1, L2).
subconjunto([_|L1], L2) :- subconjunto(L1, L2).
