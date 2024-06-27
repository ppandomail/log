% Suma de los elementos de una lista de números

suma_lista([], 0).
suma_lista([X|L], Y) :- suma_lista(L, Y1), Y is X + Y1.

% ?- suma_lista([1,2,3,4], X).
% X = 10.