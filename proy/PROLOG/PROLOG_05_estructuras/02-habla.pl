habla(alejandro, ruso).
habla(juan, ingles).
habla(maria, ruso).
habla(maria, ingles).
habla(pablo, portugues).
se_comunica(P1, P2) :- habla(P1, L), habla(P2, L), P1 \== P2.