padre(alberto, juan).
padre(alberto, luis).
padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(geronimo, luisa).
hermano(A, B) :- padre(P, A), padre(P, B), A \== B.
nieto(A, B) :- padre(P, A), padre(B, P).