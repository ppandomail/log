% Sumar 2 números ingresados por teclado

suma(A, B, C) :- C is A + B.
suma(C) :- read(A), read(B), C is A + B.
suma :- read(A), read(B), C is A + B, write('La suma es'), nl, write(C).

% Imprimir los números en un rango

secuencia(M, N):- M<N+1, nl, write(M), NuevoM is M+1, secuencia(NuevoM, N).

% ?- secuencia(1, 4).
% 1
% 2
% 3
% 4
