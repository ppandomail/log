
% Red neuronal: clasifica si puede donar sangre

red_neuronal(X1, X2, Y) :-

w1(W1),

w2(W2),

b(B),

suma_ponderada(X1, X2, W1, W2, B, Z),

activacion(Z, Y).


% Pesos sinápticos y sesgo

w1(0.6).

w2(0.6).

b(-0.8).



% Cálculo de la suma ponderada

suma_ponderada(X1, X2, W1, W2, B, Z) :-

Z is X1 * W1 + X2 * W2 + B.



% Función de activación tipo umbral

activacion(Z, 1) :- Z >= 0. %puede donar sangre

activacion(Z, 0) :- Z < 0. %no puede donar sangre



% Base de conocimiento: personas

% persona(Nombre, MayorDeEdad, Saludable)

persona(ana, 1, 1).        % mayor y saludable

persona(juan, 1, 0).       % mayor pero no saludable

persona(lucia, 0, 1).      % menor pero saludable

persona(marcos, 0, 0).     % menor y no saludable



% Clasificación

clasificar_persona(Nombre) :-

persona(Nombre, X1, X2),

red_neuronal(X1, X2, Y),


Y = 1,

format('~w puede donar sangre.~n', [Nombre]).


clasificar_persona(Nombre) :-

persona(Nombre, X1, X2),

red_neuronal(X1, X2, Y),


Y = 0,

format('~w NO puede donar sangre.~n', [Nombre]).
