% Consideraciones:
%   La constante lógica v es verdadera
%   Existe una lista de variables lógicas, todas las cuales son ciertas por definición.
%   [neg, A] es cierto si A es falsa.
%   [A, and, B] es cierto si A es cierto y B es cierto.
%   [A, or, B] es cierto si A es cierto.
%   [A, or, B] es cierto si B es cierto.
%   [A, then, B] es cierto si A no es cierto.
%   [A, then, B] es cierto si B es cierto.
%   Suponemos que q y r son ciertas y todas las demás variables son falsas:

true(q).
true(r).
true([neg, A]) :- \+(true(A)).
true([A, and, B]) :- true(A), true(B).
true([A, or, _]) :- true(A).
true([_, or, B]) :- true(B).
true([_, then, B]) :- true(B).
true([A, then, _]) :- \+(true(A)).


% p ^ (q -> ¬r)
% ?- true([p, and, [q, then, [neg, r]]]).
% false
