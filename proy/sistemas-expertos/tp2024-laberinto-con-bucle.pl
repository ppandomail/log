dirigeA(e3, d3).
dirigeA(d3, d4).
dirigeA(d3, d2).
dirigeA(d4, d5).
dirigeA(d5, e5).
dirigeA(e5, e4).
dirigeA(d5, c5).
dirigeA(c4, c3).
dirigeA(c3, c2).
dirigeA(c2, c1).
dirigeA(c1, d1).
dirigeA(d1, e1).
dirigeA(e1, e2).
dirigeA(d1, d2).
dirigeA(d2, d3).
dirigeA(c3, b3).
dirigeA(b3, a3).
dirigeA(d2, d1).
dirigeA(d1, c1).
dirigeA(c1, c2).
dirigeA(c2, c3).
dirigeA(c3, c4).
dirigeA(c4, c5).
dirigeA(c5, d5).
dirigeA(d5, d4).
dirigeA(d4, d3).

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

caminoAlDestino(Origen, Destino, Camino) :-
  caminoAlDestino(Origen, Destino, [Origen], CaminoInvertido), 
  reverse(CaminoInvertido, Camino).
caminoAlDestino(Destino, Destino, CaminoActual, CaminoActual).
caminoAlDestino(Origen, Destino, CaminoActual, Camino) :- 
  dirigeA(Origen, PuntoIntermedio), 
  \+ member(PuntoIntermedio, CaminoActual), 
  caminoAlDestino(PuntoIntermedio, Destino, [PuntoIntermedio|CaminoActual], Camino).