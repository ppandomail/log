animal(conejo).
animal(perro).
carnivoro(perro).
masDebil(conejo, perro).
herbivoro(conejo).
plantaComestible(lechuga).
come(A, B) :- carnivoro(A), animal(B), masDebil(B, A); herbivoro(A), plantaComestible(B).