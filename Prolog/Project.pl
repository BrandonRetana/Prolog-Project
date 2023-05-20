
%                                                   TAREA PROGRAMADA III

% -------------------------------------------------------------------------------------------
% DEFINICION DE HECHOS
% -------------------------------------------------------------------------------------------
conection(a,b,10).
conection(b,c,3).
conection(b,e,5).
conection(b,d,4).
conection(e,h,2).
conection(d,h,1).
conection(c,f,2).
conection(f,i,3).
conection(f,j,3).
conection(g,j,1).
conection(h,f,1).
conection(h,i,6).
percentage(a, b, 5.0).
percentage(b, c, 1.0).
percentage(b, e, 2.0).
percentage(b, d, 2.0).
percentage(e, h, 1.0).
percentage(d, h, 0.5).
percentage(c, f, 1.0).
percentage(f, i, 2.0).
percentage(f, j, 2.0).
percentage(g, j, 0.5).
percentage(h, f, 0.5).
percentage(h, i, 3.0).
percentage(b, a, 5.0).
percentage(c, b, 1.0).
percentage(e, b, 2.0).
percentage(d, b, 2.0).
percentage(h, e, 1.0).
percentage(h, d, 0.5).
percentage(f, c, 1.0).
percentage(i, f, 2.0).
percentage(j, f, 2.0).
percentage(j, g, 0.5).
percentage(f, h, 0.5).
percentage(i, h, 3.0).
percentage(_ , [], 0.0).

% -------------------------------------------------------------------------------------------
% FUNCION RECURSIVA CAMINO QUE VA CONECTANDO LOS NODOS
% -------------------------------------------------------------------------------------------
camino(A, B, [A, B], X) :-
    conection(A, B, X).
camino(A, B, CaminoAB, Largo) :-
    conection(A, C, X),
    camino(C, B, CaminoCB, LargoCB),
    CaminoAB = [A | CaminoCB],
    Largo is X + LargoCB.


% -------------------------------------------------------------------------------------------
% FUNCION PRINCIPAL QUE SE LLAMA EN LA INTERFAZ, ORDENA EL CAMINO Y LO IMPRIME AL USUARIO, LLAMA A LA FUNCION CAMINO
% -------------------------------------------------------------------------------------------
caminoMasCorto(A, B) :-
    findall(p(Costo, Camino),
            camino(A, B, Camino, Costo),
            Caminos),
    sort(Caminos, Lista),
    Lista = [p(Costo1, Camino1) | _],
    printCamino(Camino1),
    printpercentage(Camino1, Comision1),
    writef(' (con distancia de %d km y una comision de %d%)\n', [Costo1, Comision1]).


% -------------------------------------------------------------------------------------------
% FUNCION RECURSIVA QUE RECORRE LA LISTA DEL CAMINO SOLUCION E IMPRIME EL COSTO EN percentage
% -------------------------------------------------------------------------------------------
printpercentage([], 0).
printpercentage([X|T], Y) :-
	car(T, Cabeza),
    percentage(X, Cabeza, Comision),
    printpercentage(T, C),
    Y is Comision + C.

% -------------------------------------------------------------------------------------------
% EXTRAE LA CABEZA DE UNA LISTA, SE USA EN PRINT percentage
% -------------------------------------------------------------------------------------------
car([], []).
car([X|Y], X).

% -------------------------------------------------------------------------------------------
% FUNCION RECURSIVA QUE RECORRE LA LISTA DE SOLUCION E IMPRIME LA SOLUCION
% -------------------------------------------------------------------------------------------
printCamino([]).
printCamino([X]) :-
    !, write(X).
printCamino([X|T]) :-
    write(X),
    write(', '),
    printCamino(T).

