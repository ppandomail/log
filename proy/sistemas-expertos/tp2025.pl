/**
El siguiente sistema experto es un Sistema Basado en Reglas (Rule-Based Systems): Usa reglas de 
inferencia para brindar el conocimiento experto. Permitirá evaluar el nivel de conocimiento de 
programación de distintos estudiantes y recomendarles qué conceptos estudiar en base a los 
conocimientos ya adquiridos.
**/

% HECHOS
%lista de estudiantes
estudiantes([carlos, david, esteban, julian, matias, javier, paola]).

% Conceptos clave por nivel
principiantes([clases, variables, metodos, ciclos]).
intermedios([hilos, bases_datos, web_services]).
avanzados([patrones, metodologias]).

% Conceptos de programación
conceptosprogramacion(clases).
conceptosprogramacion(variables).
conceptosprogramacion(metodos).
conceptosprogramacion(ciclos).
conceptosprogramacion(hilos).
conceptosprogramacion(bases_datos).
conceptosprogramacion(patrones).
conceptosprogramacion(metodologias).
conceptosprogramacion(web_services).

% Conceptos adquiridos por los estudiantes
%david
conoce(david, clases).
conoce(david, variables).
conoce(david, metodos).
conoce(david, ciclos).
conoce(david, hilos).
conoce(david, bases_datos).
conoce(david, web_services).
conoce(david, patrones).
conoce(david, metodologias).

%javier
conoce(javier, clases).
conoce(javier, variables).
conoce(javier, metodos).
conoce(javier, ciclos).
conoce(javier, hilos).
conoce(javier, bases_datos).
conoce(javier, web_services).

%esteban
conoce(esteban, hilos).
conoce(esteban, bases_datos).
conoce(esteban, web_services).
conoce(esteban, clases). 
conoce(esteban, variables). 
conoce(esteban, metodos). 
conoce(esteban, ciclos).

%carlos
conoce(carlos, clases). 
conoce(carlos, variables). 
conoce(carlos, metodos). 

%julian
conoce(julian, clases). 
conoce(julian, variables). 
conoce(julian, metodos). 

%matias
conoce(matias, clases). 
conoce(matias, variables). 
conoce(matias, metodos). 
conoce(matias, ciclos).

% Reglas

% Estudiante válido
estudiante(X) :- estudiantes(L), pertenece(X, L).

% Conocimiento válido
conoce_concepto(E, C) :- estudiante(E), conceptosprogramacion(C), conoce(E, C).

% Niveles de conocimiento
nivelprincipiante(X) :- 
    conoce_concepto(X, clases),
    conoce_concepto(X, variables),
    conoce_concepto(X, metodos),
    conoce_concepto(X, ciclos),
    \+ nivelintermedio(X),
    \+ nivelavanzado(X),!.

nivelintermedio(X) :- 
    conoce_concepto(X, hilos),
    conoce_concepto(X, bases_datos),
    conoce_concepto(X, web_services),
    \+ nivelavanzado(X),!.

nivelavanzado(X) :- 
    conoce_concepto(X, metodologias),
    conoce_concepto(X, patrones),!.

mostrar(Mensaje) :-
    writeln(Mensaje), !.

pertenece(X, [X|_]).
pertenece(X, [_|T]) :- pertenece(X, T).

% Consultas sistema experto:
% Construir lista de faltantes recursivamente
conceptos_faltantes(_, [], []). 
conceptos_faltantes(E, [C|R], [C|Faltantes]) :- 
    \+ conoce(E, C),
    conceptos_faltantes(E, R, Faltantes),!.
conceptos_faltantes(E, [_|R], Faltantes) :- 
    conceptos_faltantes(E, R, Faltantes),!.

% Qué conceptos le faltan para completar el nivel
faltan_de_principiante(E) :-
    principiantes(L),
    conceptos_faltantes(E, L, Faltantes),
    mostrar('-- Le faltan estos conceptos para el nivel principiante:  --'),
    listar_lista(Faltantes).

faltan_de_intermedio(E) :-
    intermedios(L),
    conceptos_faltantes(E, L, Faltantes),
    mostrar('-- Le faltan estos conceptos para el nivel intermedio:  --'),
    listar_lista(Faltantes).

faltan_de_avanzado(E) :-
    avanzados(L),
    conceptos_faltantes(E, L, Faltantes),
    mostrar('-- Le faltan estos conceptos para el nivel avanzado:  --'),
    listar_lista(Faltantes).

% que conceptos le faltan para graduarse:
faltan_para_graduarse(E) :-
    faltan_de_principiante(E),
    faltan_de_intermedio(E),
    faltan_de_avanzado(E).

% Recomendaciones de estudio:
recomendar(E) :- 
    sin_nivel(E),
    mostrar('--- Recomendación ---'),
    mostrar('Estás comenzando. Te recomiendo iniciar con estos conceptos:'),
    principiantes(L),
    conceptos_faltantes(E, L, F),
    listar_lista(F), !.

recomendar(E) :- 
    nivelprincipiante(E),
    mostrar('--- Recomendación ---'),
    mostrar('tenés base de principiante. continua con el nivel intermedio:'),
    intermedios(L),
    conceptos_faltantes(E, L, F),
    listar_lista(F), !.

recomendar(E) :- 
    nivelintermedio(E),
    mostrar('--- Recomendación ---'),
    mostrar('Buen trabajo. Estás listo para abordar el nivel avanzado:'),
    avanzados(L),
    conceptos_faltantes(E, L, F),
    listar_lista(F), !.

recomendar(E) :- 
    nivelavanzado(E),
    mostrar('--- Recomendación ---'),
    mostrar('Ya dominás todos los niveles. Se recomienda realizar un máster o mentorías avanzadas.'), !.

% Listar estudiantes por nivel completo
listar_por_nivel :-
    mostrar('--- Sin nivel completo ---'),listar_sin_nivel,
    mostrar('--- Principiantes ---'), listar(nivelprincipiante),
    mostrar('--- Intermedios ---'), listar(nivelintermedio),
    mostrar('--- Avanzados ---'), listar(nivelavanzado).

% Listar estudiantes de un nivel especifico.
listar(Nivel) :-
    estudiantes(Es),
    forall( pertenece(E, Es), (call(Nivel, E) -> writeln(E); true)).

% Listar estudiantes sin nivel principiante completo.
listar_sin_nivel :-
    estudiantes(Es),
     forall( pertenece(E, Es),
            (sin_nivel(E) -> writeln(E); true)).

% Estudiantes sin conocimientos registrados
sin_nivel(E) :-
    estudiantes(Es),
    pertenece(E, Es), 
          (\+ call(nivelprincipiante, E), 
          \+ call(nivelintermedio, E), 
          \+ call(nivelavanzado, E)),!.

% listar conceptos por nivel
listar_conceptos_por_nivel :-
    mostrar('--- Conceptos de Nivel Principiante ---'), listar_conceptos(principiantes),
    mostrar('--- Conceptos de Nivel Intermedio ---'), listar_conceptos(intermedios),
    mostrar('--- Conceptos de Nivel Avanzado ---'), listar_conceptos(avanzados).

listar_conceptos(Nivel) :-
    call(Nivel, Conceptos),
    listar_lista(Conceptos).
%Metodo auxiliar para mostrar elementos de una lista
listar_lista([]).
listar_lista([H|T]) :- mostrar(H), listar_lista(T).

/*
Definiciones:
call: 
    Es una función que te permite ejecutar un predicado de forma dinámica,
	es como decir: usá esta variable como si fuera el nombre de un predicado 
    y ejecutalo
	¿Por qué usar call?
	Porque te permite escribir una sola regla general (listar_conceptos/1)
	que sirve para cualquier nivel: principiantes, intermedios o avanzados.
forall: 
    Recorrer una lista (o generar soluciones) y asegurarse de que todas cumplan una 
    cierta condición o de ejecutar una acción para cada una de ellas. 
    EJ: forall(CondiciónGeneradora, Acción).
*/

/** <examples>
EJEMPLOS DE USO
Ver nivel de cada estudiante o de uno especifico.
?- nivelprincipiante(matias).
?- nivelavanzado(matias).
?- nivelavanzado(david).
?- nivelintermedio(javier).

¿Qué le falta a paola del nivel principiante?
?- faltan_de_principiante(paola).

¿Qué le falta a Carlos del nivel intermedio?
?- faltan_de_intermedio(carlos).

¿Qué le falta a javier del nivel avanzado?
?- faltan_de_avanzado(javier).
%F = [patrones, metodologias].

Listar todos los estudiantes clasificados por los distintos niveles completos:
?- listar_por_nivel.

Listar los estudiantes clasificados por un nivel especifico:
?- listar(nivelprincipiante).

Listar todos los conceptos ordenados por nivel:
?- listar_conceptos_por_nivel.

Ver si hay algún estudiante sin nivel principiante:
?- listar_sin_nivel.

Conceptos que les faltan:
?- faltan_para_graduarse(carlos).
?- faltan_de_principiante(carlos).
?- faltan_de_intermedio(paola).
?- faltan_de_avanzado(julian).


conceptos recomendados para un estudiante:
?- recomendar(carlos).
?- recomendar(javier).
?- recomendar(david).
*/
