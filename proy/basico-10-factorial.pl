factorial(0, 1).
factorial(Num, Res) :- Num > 0, N1 is Num - 1, factorial(N1, F1), Res is Num * F1.