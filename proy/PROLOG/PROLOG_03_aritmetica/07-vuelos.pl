% Precio de vuelos

vuelo(ezeiza,natal,200).
vuelo(natal,ezeiza,100).
vuelo(ezeiza,paulo,100).
vuelo(paulo,ezeiza,80).
vuelo(paulo,natal,50).
vuelo(natal,paulo,50).
vuelo(natal,recife,50).
vuelo(recife,natal,50).
vuelo(X, Y, Precio) :- vuelo(X, Z, P1), vuelo(Z, Y, P2), Precio is P1+P2.
idavuelta(X, Y, Precio) :- vuelo(X, Y, P1), vuelo(Y, X, P2), Precio is P1+P2.

% ?- idavuelta(ezeiza,recife,P).
% P = 400