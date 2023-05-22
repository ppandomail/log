% El problema consiste en determinar caminos entre ciudades. 
% Hay un camino entre dos ciudades si hay una ruta que las une. 
% Además, hay un camino entre una ciudad x y una ciudad z, si hay una ruta que une a x con otra ciudad t, seguida de un camino de t a z.
% Dadas 6 ciudades ba, lp, mdq, jy, mi y bb, se sabe que hay ruta entre: ba y lp; ba y jy; 
% mi y bb; ba y mdq; ba y mi; mdq y mi; lp y mi
% Se pide contestar: ¿Existe algún camino a la ciudad mdq?. Si existe, ¿desde que ciudad/es?

ruta(ba, lp).
ruta(ba, jy).
ruta(mi, bb).
ruta(ba, mdq).
ruta(ba, mi).
ruta(mdq, mi).
ruta(lp, mi).
camino(O, D) :- ruta(O, D).
camino(O, D) :- ruta(O, I), camino(I, D).
