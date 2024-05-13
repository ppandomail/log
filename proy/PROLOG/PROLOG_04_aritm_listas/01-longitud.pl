% Longitud de una lista

longitud([], 0).
longitud([_|L], N) :- longitud(L, N1), N is N1 + 1. 

% ?- longitud([a, b, c], L).
% L=3
