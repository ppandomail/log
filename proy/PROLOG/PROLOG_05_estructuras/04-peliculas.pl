actuo(leoDiCaprio, wolfOfWallStreet).
actuo(margotRobbie, wolfOfWallStreet).
actuo(jonahHill, wolfOfWallStreet).
actuo(leoDiCaprio, onceUponATimeInHollywood).
actuo(bradPitt, onceUponATimeInHollywood).
actuo(margotRobbie, onceUponATimeInHollywood).
actuo(joePesci, goodFellas).
actuo(robertDeNiro, goodFellas).
actuo(rayLiotta, goodFellas).
actuo(lorraineBracco, goodFellas).
actuo(leoDiCaprio, catchMeIfYouCan).
actuo(tomHanks, catchMeIfYouCan).
actuo(michaelKeaton, birdman).
actuo(emmaStone, birdman).

ganoElOscar(birdman).

% un suertude es aquel que actuó en una película que ganó el Oscar
% p ^ q -> r
% p: actuó en una película
% q: ganó el Oscar
% r: es suertude

suertude(Persona) :- actuo(Persona, Pelicula), ganoElOscar(Pelicula).
