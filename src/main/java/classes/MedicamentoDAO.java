package classes;

import java.util.*;

public class MedicamentoDAO {

    public static List<Medicamento> buscar(String termo){
        List<Medicamento> resultado = new ArrayList<>();

        for(Medicamento m : lista){
            if(m.getNome().toLowerCase().contains(termo.toLowerCase())){
                resultado.add(m);
            }
        }

        return resultado;
    }

    private static List<Medicamento> lista = new ArrayList<>();

    public static void adicionar(Medicamento m) {
        lista.add(m);
    }

    public static List<Medicamento> listar() {
        return lista;
    }

    public static Medicamento buscarPorId(int id) {
        for (Medicamento m : lista) {
            if (m.getId() == id) return m;
        }
        return null;
    }

    public static void remover(int id) {
        lista.removeIf(m -> m.getId() == id);
    }
}