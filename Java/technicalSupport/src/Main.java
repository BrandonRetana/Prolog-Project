import org.jpl7.*;

import java.lang.Integer;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.setProperty("java.library.path", System.getProperty("java.library.path") + ":./lib");
        JPL.init();

        // Consulta Prolog
        Query.hasSolution("consult('D:/Projects/Working/Prolog/Prolog-Project/Prolog/support.pl')");

        // Menú interactivo
        List<String> problemasSeleccionados = seleccionarProblemas();
        obtenerSoluciones(problemasSeleccionados);

        JPL.halt();
    }

    // Función para seleccionar los problemas del menú
    private static List<String> seleccionarProblemas() {
        List<String> problemasSeleccionados = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);

        System.out.println("Seleccione los problemas que tiene (ingrese el número correspondiente):");
        System.out.println("1. Demora del sistema");
        System.out.println("2. Error de conexión");
        System.out.println("3. Versión desactualizada");
        System.out.println("4. Fallos en la instalación");
        System.out.println("5. Memoria insuficiente");
        System.out.println("6. Error en el registro");
        System.out.println("7. Exceso de archivos temporales");
        System.out.println("8. Problema de compatibilidad");
        System.out.println("9. Errores en logs");
        System.out.println("10. Problema de red");

        System.out.print("\nDigite las opciones separadas por coma: ");
        String input = scanner.nextLine().trim();

        if (!input.isEmpty()) {
            String[] opciones = input.split(",");
            for (String opcion : opciones) {
                try {
                    int numero = Integer.parseInt(opcion.trim());
                    if (numero >= 1 && numero <= 10) {
                        problemasSeleccionados.add(obtenerProblemaPorNumero(numero));
                    } else {
                        System.out.println("Opción inválida: " + numero);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Opción inválida: " + opcion);
                }
            }
        }
        return problemasSeleccionados;
    }

    // Función para obtener el nombre del problema según el número seleccionado
    private static String obtenerProblemaPorNumero(int numero) {
        switch (numero) {
            case 1:
                return "demora_del_sistema";
            case 2:
                return "error_de_conexion";
            case 3:
                return "version_desactualizada";
            case 4:
                return "fallos_en_la_instalacion";
            case 5:
                return "memoria_insuficiente";
            case 6:
                return "error_en_el_registro";
            case 7:
                return "exceso_de_archivos_temporales";
            case 8:
                return "problema_de_compatibilidad";
            case 9:
                return "errores_en_logs";
            case 10:
                return "problema_de_red";
            default:
                return "";
        }
    }

    // Función para obtener las soluciones recomendadas para los problemas seleccionados
    private static void obtenerSoluciones(List<String> problemas) {
        Query query = new Query("soluciones_para_problemas(" + problemas.toString() + ", Soluciones)");
        if (query.hasSolution()) {
            java.util.Map<String, Term>[] solutions = query.allSolutions();

            String soluciones = solutions[0].get("Soluciones").toString().replace("[", "").
            replace("]", "").replace("'", ""). replace(",", "\n");

            System.out.println(soluciones);
        } else { System.out.println("No se encontraron soluciones para los problemas seleccionados");}
    }
}


