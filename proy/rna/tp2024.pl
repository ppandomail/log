% Definición de la red neuronal:
% Pesos sinápticos
% Sesgo
red_neuronal(HorasEstudio, HorasSueño, Y) :- 
  w1(W1), 
  w2(W2), 
  b(B), 
  suma_ponderada(HorasEstudio, HorasSueño, W1, W2, B, Z),
  activacion(Z, Y).

% Pesos sinápticos y sesgo predefinidos
w1(0.6).
w2(-0.4).
b(-0.5).

% Función para calcular la suma ponderada:
suma_ponderada(HorasEstudio, HorasSueño, W1, W2, B, Z) :- Z is HorasEstudio * W1 + HorasSueño * W2 + B.

% Función de activación (umbral):
activacion(Z, 1) :- Z >= 0.5.
activacion(Z, 0) :- Z < 0.5.

% Ejemplos de estudiantes:
estudiante(pepe, 10, 7).       % Estudia 10 horas a la semana, duerme 7 horas diarias
estudiante(sebastian, 5, 8).   % Estudia 5 horas a la semana, duerme 8 horas diarias
estudiante(laura, 8, 5).       % Estudia 8 horas a la semana, duerme 5 horas diarias
estudiante(adriana, 3, 6).     % Estudia 3 horas a la semana, duerme 6 horas diarias

% Predicado para clasificar éxito académico de estudiantes:
clasificar_estudiante(Estudiante) :-
  estudiante(Estudiante, HorasEstudio, HorasSueño),
  red_neuronal(HorasEstudio, HorasSueño, Y),
  Y = 1,
  format('~w tiene éxito académico.~n', [Estudiante]).

clasificar_estudiante(Estudiante) :-
  estudiante(Estudiante, HorasEstudio, HorasSueño),
  red_neuronal(HorasEstudio, HorasSueño, Y),
  Y = 0,
  format('~w no tiene éxito académico.~n', [Estudiante]).
