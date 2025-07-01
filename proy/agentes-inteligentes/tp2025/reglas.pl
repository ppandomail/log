:- consult('conocimiento').

% Verifica si una materia se puede cursar dadas las materias ya aprobadas
puede_cursar(Materia, Aprobadas) :-
    materia(Materia),
    (
        \+ correlativa(Materia, _)  % No tiene correlativas
    ;
        findall(Correlativa, correlativa(Materia, Correlativa), Reqs),
        subset(Reqs, Aprobadas)
    ).

% Verifica que todos los elementos de la primera lista están en la segunda
subset([], _).
subset([X|Xs], L) :- member(X, L), subset(Xs, L).

% Lista de materias que se pueden cursar y aún no fueron aprobadas
materias_disponibles(Aprobadas, MateriasPosibles) :-
    setof(M, puede_cursar(M, Aprobadas), Todas), % obtiene todas las materias posibles
    subtract(Todas, Aprobadas, MateriasPosibles). % elimina las ya aprobadas

% Agrupa las materias disponibles por año
materias_por_anio(Aprobadas, PorAnio) :-
    materias_disponibles(Aprobadas, Disponibles),
    agrupar_por_anio(Disponibles, PorAnio).

% Construye pares Año-Materias
agrupar_por_anio(Materias, Resultado) :-
    findall(A, (member(M, Materias), anio(M, A)), Anios),
    sort(Anios, AniosUnicos),
    findall(Anio-Mats,
        (member(Anio, AniosUnicos),
         findall(M, (member(M, Materias), anio(M, Anio)), Mats)),
        Resultado).

% Recomienda materias disponibles agrupadas por año
recomendar_materias_por_anio(Aprobadas, RecomendacionesPorAnio) :-
    materias_por_anio(Aprobadas, RecomendacionesPorAnio).

recomendar_materias(Aprobadas, Recomendadas) :-
    materias_por_anio(Aprobadas, PorAnio),
    juntar_materias(PorAnio, Todas),
    length(Recomendadas, 4),
    append(Recomendadas, _, Todas).  % toma solo las primeras 4

% Junta materias disponibles por orden de año
juntar_materias([], []).

juntar_materias([_-Mats|Resto], Resultado) :-
    juntar_materias(Resto, RestoMats),
    append(Mats, RestoMats, Resultado).

% Obtiene todas las materias agrupadas por año
todas_las_materias_por_anio(Resultado) :-
    findall(Anio, anio(_, Anio), AniosDuplicados),
    sort(AniosDuplicados, Anios),
    findall(Anio-Materias,
        (
            member(Anio, Anios),
            findall(Materia, anio(Materia, Anio), Materias)
        ),
        Resultado).