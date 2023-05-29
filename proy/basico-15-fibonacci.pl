% La sucesi´on de Fibonacci es 0, 1, 1, 2, 3, 5, 8, ...
% y est´a definida por
% . f(0) = 0
% . f(1) = 1
% . f(n) = f(n-1)+f(n-2), si n > 1

fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,X) :- N > 1, N1 is N-1, fibonacci(N1,X1), 
                         N2 is N-2, fibonacci(N2,X2), X is X1+X2.
