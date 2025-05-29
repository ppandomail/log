% Herramienta CLI:     SWI Prolog (URL: https://www.swi-prolog.org/)
% Herramienta online:  SWISH      (URL: https://swish.swi-prolog.org/)

humano(socrates).        % afirmamos que socrates es humano
humano(platon).          % afirmamos que platon es humano
humano(aristoteles).     % afirmamos que aristoteles es humano
mortal(X) :- humano(X).  % afirmamos que para que X sea mortal, antes tiene que ser humano

% $swipl                         comando para entrar a SWI-Prolog
% ?- halt.                       comando para salir de SWI_Prolog
% ?- load_files('progxxx.pl').   comando para cargar el archivo 
% ?- mortal(socrates).           comando para consultar
% ?- make.                       comando para recompilar un prog fuente modificado 
% ?- consult('progxxx.pl').      comando que carga el archivo, recompila, etc. 


% ¿socrates es humano?
% ?- humano(socrates).
% true.

% ¿socrates es mortal?
% ?- mortal(socrates).
% true.

% ¿y pepe?
% ?- mortal(pepe).
% false.

% ¿quienes son mortales?
% ?- mortal(X).
% X = socrates
% X = platon
% X = aristoteles
