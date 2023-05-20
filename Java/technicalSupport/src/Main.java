import org.jpl7.*;

import org.jpl7.*;

public class Main {
    public static void main(String[] args) {
        System.setProperty("java.library.path", System.getProperty("java.library.path") + ":./lib");
        JPL.init();

        Query.hasSolution("consult('ruta/a/tu_archivo_prolog.pl')");
        Query query = new Query("tu_predicado_prolog(X, Y)");
        while (query.hasMoreSolutions()) {
            java.util.Map<String, Term> solution = query.nextSolution();
            Term x = solution.get("X");
            Term y = solution.get("Y");
            System.out.println("X = " + x);
            System.out.println("Y = " + y);
        }

        JPL.halt();
    }
}
