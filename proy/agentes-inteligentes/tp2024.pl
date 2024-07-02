% Ejemplo en Prolog que muestra cómo un agente puede recomendar libros a estudiantes 
% basándose en los libros que ya han leído y las continuaciones de los mismos

% Libros
libro('l1', 'm1', 'Python', 'Moreles_Javier').
libro('l2', 'm1', 'Python2', 'Moreles_Javier').
libro('l3', 'm2', 'Java', 'Perez_Luisa').
libro('l4', 'm2', 'Java2', 'Perez_Luisa').
libro('l5', 'm3', 'C++', 'Gomez_Carlos').
libro('l6', 'm3', 'C++2', 'Gomez_Carlos').
libro('l7', 'm1', 'Python3', 'Moreles_Javier').
libro('l8', 'm1', 'Python4', 'Moreles_Javier').

% Estudiantes
estudiante('est1', 'Juan', 'Perez').
estudiante('est2', 'Maria', 'Lopez').
estudiante('est3', 'Carlos', 'Martinez').
estudiante('est4', 'Luisa', 'Garcia').
estudiante('est5', 'Ana', 'Gonzalez').
estudiante('est6', 'Jose', 'Rodriguez').
estudiante('est7', 'Elena', 'Hernandez').
estudiante('est8', 'Miguel', 'Fernandez').
estudiante('est9', 'Laura', 'Gomez').
estudiante('est10', 'David', 'Sanchez').

% Qué libros leyeron los estudiantes
leido('est1', 'l1'). leido('est1', 'l3'). leido('est1', 'l2').
leido('est2', 'l1'). leido('est2', 'l2').
leido('est3', 'l1'). leido('est3', 'l3').
leido('est4', 'l4').
leido('est5', 'l2'). leido('est5', 'l5').
leido('est6', 'l6').
leido('est7', 'l1').
leido('est8', 'l3').
leido('est9', 'l5').
leido('est10', 'l2').

% Continuaciones
es_continuacion('l2', 'l1'). %Python y Python2
es_continuacion('l7', 'l2'). %Python2 y Python3
es_continuacion('l8', 'l7'). %Python3 y Python4
es_continuacion('l4', 'l3'). %Java y Java2
es_continuacion('l6', 'l5'). %C++ y C++2

% Niveles de los libros
nivel('l1', 'Inicial').
nivel('l2', 'Intermedio').
nivel('l3', 'Inicial').
nivel('l4', 'Intermedio').
nivel('l5', 'Intermedio').
nivel('l6', 'Avanzado').
nivel('l7', 'Avanzado').
nivel('l8', 'Avanzado').

% Predicado para saber cuántas lecturas tiene un libro.
cant_lecturas(LibroID, Cant) :- 
    findall(Persona, leido(Persona, LibroID), PersonasLectoras),
    length(PersonasLectoras, Cant).

% Predicado para saber qué libro fue el más leído de una lista.
mas_leido([], _, 0).
mas_leido([Libro|L], LibroMasLeido, Veces) :-
    libro(LibroID, _, Libro, _),
    cant_lecturas(LibroID, Cant1), 
    mas_leido(L, Libro2, Cant2), 
    (   Cant1 >= Cant2 ->  
    		LibroMasLeido = LibroID, Veces = Cant1
    	;   
    		LibroMasLeido = Libro2, Veces = Cant2
    ).
mas_leido(L, LibroMasLeido) :- mas_leido(L, LibroMasLeido, _).

% Predicado para buscar las continuaciones de una lista de libros
recomendar_continuacion(EstudianteID, Recomendaciones) :-
    findall(NombreLibro,
        (leido(EstudianteID, LibroID),
         buscar_continuaciones(LibroID, NombreLibro)),
        Recomendaciones).

% Predicado para buscar la continuación de un libro
buscar_continuaciones(LibroID, NombreLibro) :-
    es_continuacion(ContinuacionID, LibroID),
    libro(ContinuacionID, _, NombreLibro, _).

% Predicado para recomendar libros del mismo nivel
recomendar_nivel(EstudianteID, Recomendaciones) :-
    findall(LibroID, leido(EstudianteID, LibroID), LibrosLeidos),
    findall(NombreLibro,
        (leido(EstudianteID, LibroID),
         nivel(LibroID, Nivel),
         nivel(LibroRecomendado, Nivel),
         libro(LibroRecomendado, _, NombreLibro, _),
         \+ member(LibroRecomendado, LibrosLeidos)),
        Recomendaciones).

% Predicado para generar una lista de libros para recomendar.
libros_a_recomendar(EstudianteID, SetFinal) :-
    recomendar_continuacion(EstudianteID, RecomendacionesContinuacion),
    recomendar_nivel(EstudianteID, RecomendacionesNivel),
    append(RecomendacionesContinuacion, RecomendacionesNivel, ListaReco),
    findall(Nombres, 
            (leido(EstudianteID, Libro), libro(Libro, _, Nombres, _)), 
           LibrosLeidos),
    list_to_set(ListaReco, Set1),
    list_to_set(LibrosLeidos, Set2),
    subtract(Set1, Set2, SetFinal).

% Predicado para listar las recomendaciones
listar_recomendaciones([]).
listar_recomendaciones([Primera|Resto]) :-
    write('* '), write(Primera), write('.'), nl,
    listar_recomendaciones(Resto).

% Predicado para listar los libros que se recomiendan leer.
recomendar_libros(EstudianteID) :-
    libros_a_recomendar(EstudianteID, Recomendaciones),
    write('Recomendaciones para leer: '), nl,
    listar_recomendaciones(Recomendaciones).

% Predicado para recomendar un libro.
recomendar_libro(EstudianteID) :-
    libros_a_recomendar(EstudianteID, Recomendaciones),
    mas_leido(Recomendaciones, LibroMasLeido),
    libro(LibroMasLeido, _, NombreLibro, _),
    write('El libro por el que te recomiendo seguir: '), nl,
    write(NombreLibro).

% Menú
menu :- write('\n *** Recomendador de Libros de Biblioteca *** \n'), nl,
        write('1. Imprimir libros recomendados'), nl,
        write('2. Recomendar libro para continuar'), nl,
        write('0. Salir'), nl,
        read(Opcion),
        ejecutar(Opcion).

ejecutar(1) :- 
    write('Ingrese el ID del estudiante (por ejemplo, est1, est2, etc.): '), 
    read(EstudianteID), recomendar_libros(EstudianteID), menu.
ejecutar(2) :- 
    write('Ingrese el ID del estudiante (por ejemplo, est1, est2, etc.): '), 
    read(EstudianteID), recomendar_libro(EstudianteID), menu.
ejecutar(0) :- write('Saliendo del programa...'), nl, !.
ejecutar(_) :- write('Opción no válida, intente de nuevo.'), nl, menu.