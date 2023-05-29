% Programa en el que se tiene que mover todos los aros hacia el tercer poste,
% usando el segundo como un poste auxiliar. Para calcular los movimientos es
% mov=(2^n )-1, donde n es el # de aros 

mover(1, X, Y, _) :- write('Mover desde arriba '), write(X), write(' hacia '), write(Y), nl.
mover(N, X, Y, Z) :- N > 1, M is N - 1, mover(M, X, Z, Y), mover(1, X, Y, _), mover(M, Z, Y, X).
mover(N) :- mover(N, izq, der, centro). 

% ?- mover(3).