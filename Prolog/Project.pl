% DEFINICION DE HECHOS
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
percentage(_ , [], 0.0).


% FUNCION RECURSIVA CAMINO QUE VA CONECTANDO LOS NODOS
camino(A, B, [A, B], X) :-
    conection(A, B, X).
camino(A, B, CaminoAB, Largo) :-
    conection(A, C, X),
    camino(C, B, CaminoCB, LargoCB),
    CaminoAB = [A | CaminoCB],
    Largo is X + LargoCB.


% FUNCION PRINCIPAL QUE BUSCA EL CAMINO MAS CORTO ENTRE DOS NODOS
shortestPath(A, B) :-
    findall(p(Costo, Camino),
            camino(A, B, Camino, Costo),
            Caminos),
    sort(Caminos, Lista),
    Lista = [p(Costo1, Camino1) | _],
    printPath(Camino1),
    printpercentage(Camino1, Comision1),
    writef(' (con distancia de %d km y una comision de %d%)\n', [Costo1, Comision1]).


% FUNCION RECURSIVA QUE RECORRE LA LISTA DEL CAMINO SOLUCION E IMPRIME EL COSTO TOTAL EN PORCENTAJE
printpercentage([], 0).
printpercentage([X|T], Y) :-
	car(T, Cabeza),
    percentage(X, Cabeza, Comision),
    printpercentage(T, C),
    Y is Comision + C.


% EXTRAE LA CABEZA DE UNA LISTA
car([], []).
car([X|Y], X).

% FUNCION RECURSIVA QUE RECORRE LA LISTA DE SOLUCION E IMPRIME LA SOLUCION
printPath([]).
printPath([X]) :-
    !, write(X).
printPath([X|T]) :-
    write(X),
    write(', '),
    printPath(T).

