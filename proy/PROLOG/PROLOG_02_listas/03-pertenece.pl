% Pertenencia de un elemento en una lista

pertenece(X, [X|_]).                          % caso base: o bien X es el primero, o bien
pertenece(X, [_|L]) :- pertenece(X, L).       % caso recursivo: pertenece a la lista de los demás
                                              % el subrayado es una variable anonima. 

% ?- pertenece(X, [a, b, c]).
% X = a
% X = b
% X = c
% No