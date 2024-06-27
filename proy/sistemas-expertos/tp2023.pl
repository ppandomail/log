% Como ejemplo de un sistema experto, emulamos un pequeño sistema de orientación vocacional, 
% que utiliza como dato la afinidad de una persona con determinadas materias, y permite determinar 
% el área de estudio más acorde a la misma.

% Hechos: que materias le gusta a cada persona
le_gusta(mario, literatura).
le_gusta(mario, historia).
le_gusta(mario, deporte).
le_gusta(ailen, biología).
le_gusta(ailen, química).
le_gusta(silvana, matemáticas).
le_gusta(silvana, programación).
le_gusta(silvana, música).
le_gusta(mario, arte).
le_gusta(fabián, deporte).
le_gusta(giselle, matemáticas).

% Reglas: el área de estudio recomendo para determinada persona, depende de las materias que le guste. 
area_de_estudio(X, humanidades):- le_gusta(X, literatura), le_gusta(X, historia).
area_de_estudio(X, ciencias):- le_gusta(X, biología), le_gusta(X, química).
area_de_estudio(X, deporte):- le_gusta(X, deporte).
area_de_estudio(X, ingeniería):- le_gusta(X, matemáticas), le_gusta(X, programación); le_gusta(X, matemáticas).
area_de_estudio(X, arte):- le_gusta(X, música), le_gusta(X, arte).

% Ejemplo de consultas que pueden realizarse:
% area_de_estudio(mario, X).        % Que área de estudio es recomendable para mario.
% area_de_estudio(mario, deporte).  % Si el área de estudio de Mario se correspone con el deporte.
% area_de_estudio(X, Y).            % Que área de estudio es recomendable para cada persona.
% area_de_estudio(X, ciencias).     % A que personas se les recomienda el área de estudio Ciencias.
% le_gusta(X, matemáticas).         % A qué personas les gusta las matemáticas.
% le_gusta(silvana, X).             % Qué materias le gustan a Silvana.
% le_gusta(X,Y).                    % Qué materias les gustan a cada persona.

% El motor de inferencia en Prolog realiza un proceso de búsqueda y unificación (mecanismo mediante el cuál las variables lógicas
% toman valor) para encontrar soluciones que satisfagan las consultas y condiciones definidas en las reglas y hechos del programa.
% En el código, los hechos representan las preferencias de diferentes personas en cuanto a materias específicas. 
% Por ejemplo, el hecho le_gusta(mario, literatura) indica que a Mario le gusta la literatura.
% Las reglas en el código definen relaciones entre las preferencias de materias y las áreas de estudio. Por ejemplo, la regla 
% area_de_estudio(X, humanidades):- le_gusta(X, literatura), le_gusta(X, historia) establece que si a alguien 
% (representado por la variable X) le gusta la literatura y la historia, entonces su área de estudio es humanidades.
% Cuando se realiza una consulta, por ejemplo, area_de_estudio(X, ingeniería), el motor de inferencia busca una solución
% que unifique con la consulta. En este caso, busca a las personas (representadas por la variable X) a las que les gusta
% las matemáticas y la programación, o solo las matemáticas.
% El motor de inferencia busca en los hechos para unificar los gustos de las personas con las preferencias específicas.
% Por ejemplo, buscará si a alguien le gusta matemáticas y programación, o solo matemáticas, y verificará si esas preferencias
% coinciden con la consulta.
% Si encuentra una solución válida, devuelve el resultado. En el caso de la consulta area_de_estudio(X, ingeniería), el motor
% de inferencia buscará a las personas cuyas preferencias cumplan con la condición de gustarles matemáticas y programación, 
% o solo matemáticas, y devolverá los valores de X que unifiquen con esa condición.
% El motor de inferencia utiliza el proceso de unificación y backtracking (utiliza una estrategia de búsqueda de soluciones en 
% estructuras de árboles denominada primero en profundidad) para buscar múltiples soluciones.
% En el caso de las preferencias de área de estudio, buscará diferentes combinaciones de preferencias que cumplan con las 
% condiciones establecidas en las reglas.