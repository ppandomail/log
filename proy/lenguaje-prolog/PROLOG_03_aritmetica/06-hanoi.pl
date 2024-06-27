% Juego Torres de Hanoi
% Programa en el que se tiene que mover todos los aros hacia el tercer poste,
% usando el segundo como un poste auxiliar. Para calcular los movimientos es
% mov=(2^n )-1, donde n es el # de aros 

hanoi(1, A, B, C) :- write(‘Mueve del ‘), write(A), write(‘ al ‘), write(C), nl.
hanoi(N, A, B, C) :- N>1, M is N-1, hanoi(M, A, C, B), hanoi(1, A, B, C), hanoi(M, B, A, C).

% ?- hanoi(3, a, b, c).
% Mueve del a al c
% Mueve del a al b
% Mueve del c al b
% Mueve del a al c
% Mueve del b al a
% Mueve del b al c
% Mueve del a al c
% Yes