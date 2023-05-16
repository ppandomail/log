% Prolog, proveniente del francés PROgrammation en LOGique
% Es un LP lógico e interpretado usado en el campo de IA, LN, Autómatas
% Nació ppios de los 70 en la Univ. de Marsella, Francia
% por Alain Colmerauer y Philippe Roussel
% Los programas se componen de cláusulas de Horn
% "Si es verdad el antecente, entonces es verdad el consecuente"

% Conceptos Generales: 
% . Objetos y Relaciones.     Ejemplo:  gato(tom).
% . Hechos: afirmaciones.               
% . Reglas: cabeza :- cuerpo  Ejemplo: es_par(X) :- 0 is X mod 2. 
% . Preguntas: consultas      Ejemplo: ?- gato(tom).
%                                      true.

% Herramienta desktop: SWI Prolog (URL: https://www.swi-prolog.org/)
% Herramienta online:  SWISH      (URL: https://swish.swi-prolog.org/)

humano(socrates).
humano(platon).
humano(aristoteles).
mortal(X) :- humano(X).

% $swipl                         comando para entrar a SWI-Prolog
% ?- halt.                       comando para salir de SWI_Prolog
% ?- load_files('progxxx.pl').   comando para cargar el archivo 
% ?- mortal(socrates).           comando para consultar
% ?- make.                       comando para recompilar un prog fuente modificado 
% ?- consult('progxxx.pl').      comando que carga el archivo, recompila, etc. 
