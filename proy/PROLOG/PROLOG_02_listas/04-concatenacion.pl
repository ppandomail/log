% Concatenación de listas

concatenacion([], L, L).
concatenacion([X|L1], L2, [X|L3]) :- concatenacion(L1, L2, L3).

% ?- concatenacion([a, b, c], [c, d, e], L).
% L = [a, b, c, c, d, e]
% Yes