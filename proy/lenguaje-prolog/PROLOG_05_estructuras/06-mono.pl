% Un mono se encuentra en la puerta de una habitación. En el centro de
% la habitación hay una banana colgada del techo. El mono está
% hambriento y desea agarrar la banana, pero no la alcanza desde el
% suelo. En la ventana de la habitación hay una silla que el mono puede
% usar. El mono puede realizar las siguientes acciones:
% * pasear de un lugar a otro de la habitación,
% * empujar la silla de un lugar a otro de la habitación (si está en el
%   mismo lugar que la silla),
% * subirse en la silla (si está en el mismo lugar que la silla) y
% * agarrar la banana (si está encima de la silla en el centro de la
%   habitación).  
%
% Definir el predicado
%    solucion(E,S)
% de forma que S sea una sucesión de acciones que aplicadas al estado S
% permiten al mono agarrar la banana. Por ejemplo,
%    ?- solucion(estado(puerta,suelo,ventana,sin),L).
%    L = [pasear(puerta, ventana), empujar(ventana, centro), subir, agarrar]
% donde 
%    estado(PM,EM,PS,X)
% significa que el mono se encuentra en la posición PM (puerta, centro o
% ventana) encima de EM (suelo o silla), la silla se encuentra en la
% posición PS (puerta, centro o ventana) y el mono tiene (X=con) o no
% (X=sin) el plátano. 

solucion(estado(_,_,_,con),[]).
solucion(E1,[A|L]) :- movimiento(E1,A,E2), solucion(E2,L).

% movimiento(estado(PM1,EM1,PS1,X1),A,estado(PM2,EM2,PS2,X2)) se
% verifica si en el estado(PM1,EM1,PS1,X1) se puede aplicar la acción A
% y se pasa al estado(PM2,EM2,PS2,X2) 
movimiento(estado(centro,silla,centro,sin), agarrar, estado(centro,silla,centro,con)).
movimiento(estado(X,suelo,X,U), subir, estado(X,silla,X,U)).
movimiento(estado(X1,suelo,X1,U), empujar(X1,X2), estado(X2,suelo,X2,U)).
movimiento(estado(X,suelo,Z,U), pasear(X,Z), estado(Z,suelo,Z,U)).
