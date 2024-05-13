% Definir la relación máximo(X, Y, Z) que se verifique si Z es el máximo de X e Y.

máximo(X, Y, X) :- X >= Y.
máximo(X, Y, Y) :- X < Y.
