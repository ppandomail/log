% Definir la relación factorial(X, Y) que se verifique si Y es el factorial de X.

factorial(0, 1).
factorial(X, Y) :- X > 0, X1 is X-1, factorial(X1, Y1), Y is X * Y1.  

% ?- factorial(5,V)
% V = 120

% ?- factorial(6,F).
% F = 720
