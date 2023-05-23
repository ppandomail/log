% Las listas son estructuras que contiene una secuencia ordenada de cualquier tipo de términos.
% Está formada recursivamente por una cabeza, que es el primer elemento de la lista y una cola, 
% que es una lista del resto de elementos.
% La notación para las componentes de una lista es: [A | B], donde A es la cabeza y B es el cuerpo.

% Obtener el primer elemento de una lista
% ---------------------------------------

primero([H|_], H).


% Obtener la cola de la lista
% ---------------------------

cola([_|Q], Q).

% Obtener el ultimo elemento de una lista
% ---------------------------------------

ultimo([E], E) :- !.						
ultimo([_|Q], E) :- ultimo(Q, E).


% Obtener el penultimo elemento de una lista
% ------------------------------------------

penultimo([], []) :- !.
penultimo([X,_], X) :- !.
penultimo([_|Q], E) :- penultimo(Q, E).


% Obtener el elemento k de una lista
% ----------------------------------

elemento_k([E|_], 0, E).
elemento_k([_|Q], K, E) :- K > 0, K1 is K - 1, elemento_k(Q, K1, E).



% Verificar existencia de elemento en la lista
% --------------------------------------------

existe([X|_], X) :- !.                     
existe([_|Q], X) :- existe(Q, X).   


% Calcular la longitud de una lista
% ---------------------------------

longitud([], 0).
longitud([_|Q], N) :- longitud(Q, N1), N is N1 + 1.

% Contar elementos en una lista
% -----------------------------

contar([], _, 0).
contar([E|Q], E, N) :- !, contar(Q, E, N1), N is N1 + 1.
contar([_|Q], E, N) :- contar(Q, E, N).


% Verificar que todos los elementos de la lista son iguales
% ---------------------------------------------------------

todos_iguales([]).
todos_iguales([_]) :- !.
todos_iguales([H, H | Q]) :- todos_iguales([H | Q]).


% Verificar si una lista es palindromo
% ------------------------------------

es_palindromo(L) :- reverse(L,L).


% Obtener el valor numérico maximo de una lista
% ---------------------------------------------

maximo([H], H).
maximo([H|Q], E) :- maximo(Q, E1), E is max(E1, H).


% Crear una lista que contenga los enteros de un rango dado
% ---------------------------------------------------------

rango(I, I, [I]).
rango(I, K, [I|L]):- I < K, I1 is I + 1, rango(I1, K, L).


% Sumar los elementos de una lista
% --------------------------------

suma([], 0).
suma([H|Q], N) :- suma(Q, C), N is C + H.
