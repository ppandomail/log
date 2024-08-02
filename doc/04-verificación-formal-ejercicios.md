# Verificación Formal de Programas

## Ejercicios

1. Para cada una de las siguientes ternas de Hoare, determinar si es verdadera o falsa.
    1. {true} X ::= 5; Y ::= 0 {X = 5}
    1. {X = 1} X ::= Y + 1 {1 = Y+1}
    1. {X = 2 & X = 3} X ::= 5 {X = 0}
    1. {X = Y} IF X = 0 THEN X ::= Y + 1 ELSE Z ::= Y + 1 {(X = Y + 1) | (Z = X + 1)}
    1. {X = Y} IF X = 0 THEN X ::= Y + 1 ELSE Z ::= Y + 1 {(Z = 1) => (X = 1)}
    1. {X = x & Y = y} X ::= Y; Y ::= X {X = Y}
    1. {z = y + 1} x ::= z * 2 {x = 4}
    1. {y = 7} x ::= y + 3 {x > 5}
    1. {false} x ::= 2 / y {true}
    1. {y < 16} x ::= 2 / y {x < 8}

    ```plain
    {true} X ::= 5; Y ::= 0 {X = 5}  VERDADERA
    {X = 1} X ::= Y + 1 {1 = Y+1}  VERDADERA
    {X = 2 & X = 3} X ::= 5 {X = 0}  FALSA
    {X = Y} IF X = 0 THEN X ::= Y + 1 ELSE Z ::= Y + 1 {(X = Y + 1) | (Z = X + 1)} VERDADERA
    {X = Y} IF X = 0 THEN X ::= Y + 1 ELSE Z ::= Y + 1 {(Z = 1) => (X = 1)} FALSA
    {X = x & Y = y} X ::= Y; Y ::= X {X = Y} FALSA
    {z = y + 1} x ::= z * 2 {x = 4}   FALSA
    {y = 7} x ::= y + 3 {x > 5}  VERDADERA
    {false} x ::= 2 / y {true}   FALSA
    {y < 16} x ::= 2 / y {x < 8}  VERDADERA
    ```

1. Completar las precondiciones o postcondiciones faltantes con predicados que hagan a cada tripla de Hoare válida:
    1. {x = y} x ::= y * 2 {}
    1. {} x ::= x + 3 { x = z}
    1. {} x ::= x + 1; y ::= y \* x {y = 2 * z}
    1. {} if x > 0 then y ::= x else y ::= 0 {y > 0}

    ```plain
    {x = y} x ::= y * 2 {x = 0 & y = 0} 
    {z = x + 3} x ::= x + 3 {x = z}
    {z = 0 & x = -1} x ::= x + 1; y ::= y * x {y = 2 * z} 
    {x > 0} if x > 0 then y ::= x else y ::= 0 {y > 0}
    ```

1. Determinar la precondición para que la terna siguiente sea correcta:
    1. {P} i := 2*i {i < 6}
    1. {P} j := i + 1 {j > 0}
    1. {P} y := x2 {y > 1}
    1. {P}  x:= 1/x { x ≥ 0}

    ```plain
    {i < 3} i := 2*i {i < 6}  
    {i + 1 > 0} j := i + 1 {j > 0}
    {x^2 > 1} y := x2 {y > 1}
    {x > 0}  x:= 1/x { x ≥ 0}
    ```

1. Demostrar que el siguiente código es correcto:
    1. {} c := a+b; c := c/2 {c = (a+b)/2}
    1. {} s := 1; s := s+r; s := s+r*r {s = 1+r+r^2}
    1. {a=A, b=B} h := a;  a := b;  b := h {a = B,  b = A}

1. Demostrar que el siguiente código es correcto:
    1. {} if a > b then m := a else m := b { (m ≥ a) ^ (m ≥ b)}
