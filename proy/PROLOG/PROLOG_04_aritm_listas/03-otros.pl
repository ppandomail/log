% Definir la relación lista_acotada(L) que se verifique si todos los elementos de la lista de números L son menores que la longitud de L.

lista_acotada(L) :- length(L, N), lista_acotada_aux(L, N).
lista_acotada_aux([ ], _).
lista_acotada_aux([X | L], N) :- X < N, lista_acotada_aux(L, N).

% Definir la relación max_lista(L, X) que se verifique si X es el máximo de la lista de números L.

max_lista([X], X).
max_lista([X1, X2 | L], Y) :- X3 is max(X1, X2), max_lista([X3 | L], Y).

% Definir la relación ordenada(L) que se verifique si la lista de números está ordenada de manera creciente.

ordenada([_]).
ordenada([X, Y | L]) :- X =< Y, ordenada([Y | L]).

% Definir la relación lista(N, L) que se verifique si L es la lista de longitud N cuyos elementos son N.

lista(N, L) :- lista_aux(N, N, L).
lista_aux(_, 0, [ ]).
lista_aux(N, M, [N | L]) :- M > 0, M1 is M-1, lista_aux(N, M1, L).

% Definir la relación entre(N1, N2, X) que se verifique si X es un número entero tal que N1 ≤ X ≤ N2.

entre(N1, N2, N1) :- N1 =< N2.
entre(N1, N2, X) :- N1 < N2, N3 is N1+1, entre(N3, N2, X).

% Definir la relación elemento_en(K, L, X) que se verifique si X es el K-ésimo elemento de la lista L(se empieza a numerar en 1).

elemento_en(1, [X | _], X).
elemento_en(K, [_ | L], X) :- K > 1, K1 is K-1, elemento_en(K1, L, X).

% Definir la relación multiplicada(L1, N, L2) que se verifica si L2 es la lista obtenida repitiendo N veces los elementos de la lista L1

multiplicada(L1, N, L2) :- multiplicada_aux(L1, N, N, L2).
multiplicada_aux([ ], _, _, [ ]).
multiplicada_aux([_ | L1], 0, N, L2) :- multiplicada_aux(L1, N, N, L2).
multiplicada_aux([X | L1], K, N, [X | L2]) :- K > 0, K1 is K-1, multiplicada_aux([X |L1], K1, N, L2). 
