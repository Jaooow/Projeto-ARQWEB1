package classes;

import java.util.*;

public class MedicamentoDAO {

    public static List<Medicamento> buscar(String termo){


        if (termo == null || termo.trim().isEmpty()) {
            return listar(); // retorna lista se a busca estiver vazia
        }
        List<Medicamento> resultado = new ArrayList<>();

        for(Medicamento m : lista){
            if(m.getNome().toLowerCase().contains(termo.toLowerCase())){
                resultado.add(m);
            }
        }

        return resultado;
    }

    private static List<Medicamento> lista = new ArrayList<>();
    // executa uma única vez quando a classe é carregada
    static {
        Medicamento m1 = new Medicamento("Amoxicilina 500mg", "Amoxicilina Tri-hidratada", "MedLey", "45A8", "2026-12-31", "Infecções bacterianas", "500mg", "Cápsula");
        m1.setPromocao(true);

        Medicamento m2 = new Medicamento("Dexametasona", "Elixir 0,1mg/mL", "EMS", "12B2", "2027-08-15", "Processos inflamatórios", "0,1mg/mL", "Solução");
        m2.setPromocao(false);

        Medicamento m3 = new Medicamento("Dipirona Monoidratada", "Dipirona", "Medley", "99C3", "2025-05-20", "Dor e febre", "500mg", "Comprimido");
        m3.setPromocao(true);

        lista.add(m1);
        lista.add(m2);
        lista.add(m3);
    }

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