edad(pablo, 38).
edad(ana, 15).
edad(pedro, 16).
edad(maria, 27).
edad(juan, 32).
edad(luis, 20).
menor_edad(P) :- edad(P, E), E < 18.
mayor_que(P1, P2) :- edad(P1, E1), edad(P2, E2), E1 > E2.