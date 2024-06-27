% Problema del viajero: Consiste en encontrar la ruta más corta
% que un viajero debe seguir para visitar un conjunto de
% ciudades, pasando por cada ciudad exactamente una vez

% Definición de las ciudades y sus distancias
distancia(londres, paris, 10).
distancia(londres, berlin, 15).
distancia(londres, madrid, 20).
distancia(londres, roma, 10).
distancia(paris, berlin, 25).
distancia(paris, madrid, 30).
distancia(berlin, madrid, 35).
distancia(berlin, roma, 40).
distancia(madrid, roma, 45).
distancia(roma, atenas, 50).

% Definición de la cantidad de individuos en la población
num_individuos(10).

% Generar una población inicial aleatoria
generar_poblacion(Ciudades, Poblacion) :-
    num_individuos(N),
    generar_poblacion_aux(Ciudades, N, Poblacion).

generar_poblacion_aux(_, 0, []).
generar_poblacion_aux(Ciudades, N, [Individuo|Poblacion]) :-
    N > 0,
    generar_individuo(Ciudades, Individuo),
    N1 is N - 1,
    generar_poblacion_aux(Ciudades, N1, Poblacion).

generar_individuo(Ciudades, Individuo) :-
    random_permutation(Ciudades, Individuo).

% Calcular la distancia total de un individuo
distancia_total([_], 0).
distancia_total([Ciudad1, Ciudad2|Resto], Distancia) :-
    distancia(Ciudad1, Ciudad2, Distancia1),
    distancia_total([Ciudad2|Resto], Distancia2),
    Distancia is Distancia1 + Distancia2.

% Modificar la regla para considerar ambas direcciones
distancia_total([Ciudad1, Ciudad2|Resto], Distancia) :-
    distancia(Ciudad2, Ciudad1, Distancia1),
    distancia_total([Ciudad2|Resto], Distancia2),
    Distancia is Distancia1 + Distancia2.

% Seleccionar los mejores individuos en base a su distancia total
seleccionar_mejores(Poblacion, Mejores) :-
    seleccionar_mejores_aux(Poblacion, [], Mejores).

seleccionar_mejores_aux([], Mejores, Mejores).
seleccionar_mejores_aux([Individuo|Resto], MejoresActuales, Mejores) :-
    distancia_total(Individuo, Distancia),
    insertar_ordenado([Individuo, Distancia], MejoresActuales, MejoresNuevos),
    seleccionar_mejores_aux(Resto, MejoresNuevos, Mejores).

insertar_ordenado(Individuo, [], [Individuo]).
insertar_ordenado([I1, D1], [[I2, D2]|Resto], [[I1, D1], [I2, D2]|Resto]) :-
    D1 =< D2.
insertar_ordenado([I1, D1], [[I2, D2]|Resto], [[I2, D2]|NuevoResto]) :-
    D1 > D2,
    insertar_ordenado([I1, D1], Resto, NuevoResto).

% Cruzar dos individuos para crear un nuevo individuo
cruzar(Individuo1, Individuo2, NuevoIndividuo) :-
    length(Individuo1, Longitud),
    random_between(1, Longitud, PuntoCorte),
    dividir(Individuo1, PuntoCorte, Prefijo1, Sufijo1),
    dividir(Individuo2, PuntoCorte, Prefijo2, Sufijo2),
    append(Prefijo1, Sufijo2, Hijo1),
    append(Prefijo2, Sufijo1, Hijo2),
    random(0, 2, 0), % <--- Se completó la expresión lógica.
    (random(0, 2, 0) ->
        NuevoIndividuo = Hijo1
    ;
        NuevoIndividuo = Hijo2
    ).

% Dividir una lista en un punto de corte dado
dividir(Lista, PuntoCorte, Prefijo, Sufijo) :-
    length(Lista, Longitud),
    PuntoCorte =< Longitud,
    length(Prefijo, PuntoCorte),
    append(Prefijo, Sufijo, Lista).

mejor_ruta(Ruta, Distancia) :-
    generar_poblacion([londres, paris, berlin, madrid, roma, atenas], Poblacion),
    seleccionar_mejores(Poblacion, Mejores),
    Mejores = [[Ruta, Distancia|_]|_],
    writeln('Mejor ruta encontrada:'),
    writeln(Ruta),
    writeln('Distancia total:'),
    writeln(Distancia).

% Consultas para probar:
?- distancia_total([londres, paris, berlin, roma, berlin], Distancia).