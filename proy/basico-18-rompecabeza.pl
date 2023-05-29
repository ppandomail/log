% En una conversación, Santiago, Cristina y Pablo descubren que tienen
% distintas profesiones y que tocan diferentes intrumentos
% musicales. Sus profesiones son médico, abogado e ingeniero. Los
% instrumentos que tocan son piano, flauta y violín. Además,
%    1. Cristina está casada con el médico.
%    2. El abogado toca el piano.
%    3. Cristina no es ingeniero.
%    4. Santiago es paciente del violinista.
% ¿Quién toca la flauta?

solucion(Flauta) :-
   % Tienen distintas profesiones.
   personas_distintas(Medico,Abogado,Ingeniero),
   % Tocan distintos instrumentos.
   personas_distintas(Piano,Violin,Flauta),
   % Cristina está casada con el médico.
   \+ cristina = Medico,
   % El abogado toca el piano.
   Abogado = Piano,
   % Cristina no es ingeniero.
   \+ Ingeniero = cristina,
   % Santiago es paciente del violinista.
   Violin = Medico,                              
   \+ santiago = Violin.     

% personas_distintas(A,B,C) se verifica si A, B y C son tres personas
% distintas. 
personas_distintas(A,B,C) :-
   persona(A), persona(B), persona(C),  
   \+ A=B, \+ A=C, \+ B=C. 

% persona(X) se verifica si X es una persona.
persona(cristina).
persona(santiago).
persona(pablo).