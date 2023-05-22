% Representación de operadores lógicos como listas
% La negación se puede representar como una lista de dos elementos: la palabra neg y una expresión lógica.
% Las conjunciones, disyunciones e implicaciones se pueden representar como una lista de tres elementos: el alcance izquierdo, la conexión lógica y el alcance derecho.
% Conexiones binarias: and, or, then
% Constantes lógicas son expresiones: v,f
% Variables lógicas son expresiones: p, q, r y s.
% Si A es una expresión: [neg, A] también lo es.
% Si A y B son expresiones y Con es una conexión lógica: [A, Con, B] es una expresión.

conbi(and).
conbi(or).
conbi(then).
clog(v).
clog(f).
vlog(p).
vlog(q).
vlog(r).
vlog(s).
expr(X) :- clog(X).
expr(X) :- vlog(X).
expr([neg, A]) :- expr(A).
expr([A, Con, B]) :- expr(A), conbi(Con), expr(B).

% p & (q -> ¬r)
% ?- expr( [p, and, [q, then, [neg, r]]]).
% true
