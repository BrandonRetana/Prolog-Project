% Base de conocimiento para soporte técnico de software

% Atributos
atributo(reinicio_del_sistema).
atributo(verificación_de_conexiones).
atributo(actualización_del_software).
atributo(reinstalación_del_software).
atributo(limpieza_de_archivos_temporales).
atributo(verificación_de_recursos_del_sistema).
atributo(análisis_de_logs).

% Resultados de diagnóstico
diagnostico(demora_del_sistema, [reinicio_del_sistema, verificación_de_conexiones, limpieza_de_archivos_temporales]).
diagnostico(error_de_conexión, [verificación_de_conexiones, reinicio_del_sistema]).
diagnostico(versión_desactualizada, [actualización_del_software, reinicio_del_sistema]).
diagnostico(fallos_en_la_instalación, [reinstalación_del_software, verificación_de_recursos_del_sistema]).
diagnostico(memoria_insuficiente, [verificación_de_recursos_del_sistema]).
diagnostico(error_en_el_registro, [reinstalación_del_software]).
diagnostico(exceso_de_archivos_temporales, [limpieza_de_archivos_temporales]).
diagnostico(problema_de_compatibilidad, [actualización_del_software, reinicio_del_sistema]).
diagnostico(errores_en_logs, [análisis_de_logs, verificación_de_conexiones]).
diagnostico(problema_de_red, [verificación_de_conexiones, reinicio_del_sistema]).

% Reglas
solucion(X) :-
    diagnostico(X, _),
    write('Posible diagnóstico: '), write(X), nl,
    write('Acciones recomendadas:'), nl,
    acciones_recomendadas(X).

acciones_recomendadas(Diagnostico) :-
    diagnostico(Diagnostico, Acciones),
    listar_acciones(Acciones).

listar_acciones(Acciones) :-
    listar_acciones_aux(Acciones, 1).

listar_acciones_aux([], _).
listar_acciones_aux([Accion|Resto], Numero) :-
    write(Numero), write('. '), write(Accion), nl,
    NuevoNumero is Numero + 1,
    listar_acciones_aux(Resto, NuevoNumero).
