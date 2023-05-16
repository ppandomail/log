suma(A, B, C) :- C is A + B.
suma(C) :- read(A), read(B), C is A + B.
suma :- read(A), read(B), C is A + B, write('La suma es'), nl, write(C).