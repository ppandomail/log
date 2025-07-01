% Población inicial
poblacion_inicial([34, 87, 12, 63]). % Preguntar a los compañeros y al profe

% Evaluar aptitud (más cerca de 100 es mejor)
evaluar(X, Aptitud) :-
    Distancia is abs(100 - X),
    Aptitud is 100 - Distancia.


% Seleccionar los dos mejores
seleccionar_mejores(Poblacion, Mejor1, Mejor2) :-
    map_list_to_pairs(evaluar, Poblacion, Pares),
    keysort(Pares, Ordenados),
    reverse(Ordenados, [_-Mejor1, _-Mejor2 | _]).

% Cruce (promedio entre dos padres)
cruzar(PadreX, PadreY, Hijo) :-
    H is (PadreX + PadreY) // 2,
    Hijo = H.

% Mutación (sumar o restar un valor aleatorio pequeño)
mutar(Hijo, Mutado) :-
    random_between(-10, 10, ValorAleatorio),
    writeln('Función mutar: '),
    write('Valor sumado a mutado: '), writeln(ValorAleatorio),
    writeln('------------------------------------'),
    Mutado is Hijo + ValorAleatorio.

% Evolucionar una generación
evolucionar(PoblacionActual, NuevaPoblacion) :-
    seleccionar_mejores(PoblacionActual, Mutacion1, Mutacion2),
    cruzar(Mutacion1, Mutacion2, Hijo1), mutar(Hijo1, M1Mutado),
    cruzar(Mutacion2, Mutacion1, Hijo2), mutar(Hijo2, M2Mutado),
    NuevaPoblacion = [Mutacion1, Mutacion2, M1Mutado, M2Mutado].


% Correr:
%     	poblacion_inicial(PrimeraGeneracion), 
%    	evolucionar(PrimeraGeneracion, SegundaGeneracion),
%		seleccionar_mejores(SegundaGeneracion, Mejor, _), 	
%    	evaluar(Mejor, AptitudDelMejor).