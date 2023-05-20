% Base de conocimiento para soporte técnico de software

% Resultados de diagnostico
diagnostico(demora_del_sistema, [reinicio_del_sistema, verificacion_de_conexiones, limpieza_de_archivos_temporales]).
diagnostico(error_de_conexion, [verificacion_de_conexiones, reinicio_del_sistema]).
diagnostico(version_desactualizada, [actualizacion_del_software, reinicio_del_sistema]).
diagnostico(fallos_en_la_instalacion, [reinstalacion_del_software, verificacion_de_recursos_del_sistema]).
diagnostico(memoria_insuficiente, [verificacion_de_recursos_del_sistema]).
diagnostico(error_en_el_registro, [reinstalacion_del_software]).
diagnostico(exceso_de_archivos_temporales, [limpieza_de_archivos_temporales]).
diagnostico(problema_de_compatibilidad, [actualizacion_del_software, reinicio_del_sistema]).
diagnostico(errores_en_logs, [analisis_de_logs, verificacion_de_conexiones]).
diagnostico(problema_de_red, [verificacion_de_conexiones, reinicio_del_sistema]).

% Reglas
soluciones_para_problemas([], []).
soluciones_para_problemas([Problema | Resto], [Solucion | SolucionesResto]) :-
    diagnostico(Problema, Acciones),
    Diagnostico = Problema, % En este caso, asumimos que el diagnostico es el mismo que el problema
    format(atom(Solucion), "Posible diagnostico: ~w\nAcciones recomendadas:\n~w\n", [Diagnostico, Acciones]),
    soluciones_para_problemas(Resto, SolucionesResto).


% Funcion para imprimir las soluciones de manera bonita
imprimir_soluciones([]).
imprimir_soluciones([Solucion | SolucionesResto]) :-
    writeln(Solucion),
    writeln('------------------------------------'),
    imprimir_soluciones(SolucionesResto).

% Ejemplo de uso
%    soluciones_para_problemas([memoria_insuficiente, problema_de_red], Soluciones), imprimir_soluciones(Soluciones).

