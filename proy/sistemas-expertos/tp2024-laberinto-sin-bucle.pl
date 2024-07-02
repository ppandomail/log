% No se puede avanzar si hay una pared
% No se puede retroceder
% Se avanza de una celda a la vez
% Existe un único punto de entra y uno de salida
% El eje de las ordenas se representa con letras del abecedario
% El eje de las abscisas se representa con números

% Hechos
dirigeA(e3, e2).
dirigeA(e2, e1).
dirigeA(e2, d2).
dirigeA(d2, c2).
dirigeA(c2, b2).
dirigeA(c2, c3).
dirigeA(b2, b1).
dirigeA(b1, a1).
dirigeA(b1, c1).
dirigeA(c1, d1).
dirigeA(c3, d3).
dirigeA(d3, d4).
dirigeA(d4, d5).
dirigeA(d5, e5).
dirigeA(d5, c5).
dirigeA(e5, e4).
dirigeA(c5, c4).
dirigeA(c4, b4).
dirigeA(b4, b3).
dirigeA(b4, b5).
dirigeA(b3, a3).
dirigeA(a3, a2).
dirigeA(b5, a5).
dirigeA(a5, a4).

%laberinto sin bucle
sePuedeLlegarDelOrigenAlDestino(Origen, Destino) :- 
  dirigeA(Origen, Destino); 
  dirigeA(Origen, PuntoIntermedio), 
  sePuedeLlegarDelOrigenAlDestino(PuntoIntermedio, Destino).

sePuedeLlegarDelOrigenAlDestino2(Origen, Destino) :- 
  sePuedeLlegarDelOrigenAlDestino2(Origen, Destino, [Origen]).
sePuedeLlegarDelOrigenAlDestino2(Destino, Destino, _).
sePuedeLlegarDelOrigenAlDestino2(Origen, Destino, Visitados) :- 
  dirigeA(Origen, PuntoIntermedio), 
  \+ member(PuntoIntermedio, Visitados), 
  sePuedeLlegarDelOrigenAlDestino2(PuntoIntermedio, Destino, [PuntoIntermedio|Visitados]).

caminoAlDestino(Origen, Destino, Camino) :- caminoAlDestino(Origen, Destino, [Origen], CaminoInvertido), reverse(CaminoInvertido, Camino).
caminoAlDestino(Destino, Destino, CaminoActual, CaminoActual).
caminoAlDestino(Origen, Destino, CaminoActual, Camino) :- dirigeA(Origen, PuntoIntermedio), \+ member(PuntoIntermedio, CaminoActual), caminoAlDestino(PuntoIntermedio, Destino, [PuntoIntermedio|CaminoActual], Camino).