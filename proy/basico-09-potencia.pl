potencia(Base, 0, 1) :- Base \== 0.
potencia(Base, Exp, Res) :- Exp > 0, Exp1 is Exp - 1, potencia(Base, Exp1, Res1), Res is Base * Res1.