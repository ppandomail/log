% El objetivo es implementar una red neuronal que pueda clasificar 
% si un animal es un mamífero o no, en función de dos características: 
% Si tiene pelo y si produce leche

% Definición de la red neuronal:
% Pesos sinápticos
% Sesgo
neural_network(X1, X2, Y) :-
    w1(W1),  
    w2(W2),
    b(B),    

% Cálculo de la suma ponderada
weighted_sum(X1, X2, W1, W2, B, Z), 

% Función de activación
activation_function(Z, Y). 

% Pesos sinápticos y sesgo predefinidos
w1(0.5).
w2(0.5).
b(-0.7).

% Función para calcular la suma ponderada:
weighted_sum(X1, X2, W1, W2, B, Z) :- Z is X1 * W1 + X2 * W2 + B.

% Función de activación (umbral):
activation_function(Z, 1) :- Z >= 0.
activation_function(Z, 0) :- Z < 0.

% Ejemplos de animales:
animal(gato, 1, 1).      % Tiene pelo y produce leche
animal(tigre, 1, 0).     % Tiene pelo, pero no produce leche
animal(ballena, 0, 1).   % No tiene pelo, pero produce leche
animal(cocodrilo, 0, 0). % No tiene pelo ni produce leche

% Predicado para clasificar animales:
classify_animal(Animal) :-
    animal(Animal, X1, X2), % Obtener las características del animal
    neural_network(X1, X2, Y), % Clasificar utilizando la red neuronal
    Y = 1, % Y = 1 representa que es un mamífero
    format('~w es un mamífero.~n', [Animal]).

classify_animal(Animal) :-
    animal(Animal, X1, X2),
    neural_network(X1, X2, Y),
    Y = 0,
    format('~w no es un mamífero.~n', [Animal]).

% Para utilizar la red neuronal, se llama al predicado classify_animal/1 pasando 
% el nombre del animal como argumento. Ejemplos:
% classify_animal(gato).
% classify_animal(ballena).
% classify_animal(tigre).
% classify_animal(cocodrilo).

% Detalles de la implementación:
% Definición de la red neuronal: se define mediante el predicado neural_network/3. 
% Toma tres argumentos: X1, X2 (las características del animal) y 
% Y (la salida de la red neuronal, que representa si el animal es un mamífero o no).

% Pesos sinápticos y sesgo:
% Los pesos sinápticos (w1 y w2) y el sesgo (b) están predefinidos en el código. 
% Estos valores determinan la importancia relativa de las características en la clasificación.

% Cálculo de la suma ponderada:
% El predicado weighted_sum/6 se encarga de calcular la suma ponderada de las 
% características (X1 y X2) utilizando los pesos sinápticos (W1 y W2) y el sesgo (B).
% La suma ponderada se almacena en Z.

% Función de activación: determina el valor de salida (Y) de la red neuronal en función 
% de la suma ponderada (Z). Si Z es mayor o igual a cero, Y se establece en 1, lo que representa que el animal es un mamífero. Si Z es menor que cero, Y se establece en 0, lo que representa que el animal no es un mamífero.

% Ejemplos de animales:
% El código proporciona ejemplos de animales junto con sus características.
% Cada animal se define mediante el predicado animal/3, que toma el nombre del animal, 
% X1 y X2 como argumentos.

% Predicado para clasificar animales: classify_animal/1 se utiliza para clasificar un animal dado.
% Toma el nombre del animal como argumento, obtiene sus características utilizando el predicado animal/3 y 
% luego utiliza la red neuronal (neural_network/3) para determinar si el animal es un mamífero o no. 
% Dependiendo del valor de Y, se muestra un mensaje indicando si el animal es un mamífero o no.
