package classes.dao;

import classes.model.Medicamento;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.io.*;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class MedicamentoDAOJson implements MedicamentoDAO {

    private final String caminhoArquivo;
    private final Gson gson;

    public MedicamentoDAOJson(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
        this.gson = new GsonBuilder().setPrettyPrinting().create();
        inicializarArquivo();
    }

    // Popula o arquivo com os mesmos dados iniciais que estavam no bloco static do DAO original
    private void inicializarArquivo() {
        File arquivo = new File(caminhoArquivo);
        if (!arquivo.exists() || arquivo.length() == 0) {
            List<Medicamento> inicial = new ArrayList<>();

            Medicamento m1 = new Medicamento("Amoxicilina 500mg", "Amoxicilina Tri-hidratada", "MedLey", "45A8", "2026-12-31", "Infecções bacterianas", "500mg", "Cápsula");
            m1.setPromocao(true);

            Medicamento m2 = new Medicamento("Dexametasona", "Elixir 0,1mg/mL", "EMS", "12B2", "2027-08-15", "Processos inflamatórios", "0,1mg/mL", "Solução");
            m2.setPromocao(false);

            Medicamento m3 = new Medicamento("Dipirona Monoidratada", "Dipirona", "Medley", "99C3", "2025-05-20", "Dor e febre", "500mg", "Comprimido");
            m3.setPromocao(true);

            inicial.add(m1);
            inicial.add(m2);
            inicial.add(m3);

            salvar(inicial);
        } else{
            // Se o arquivo já existe, precisamos sincronizar o gerador de IDs
            List<Medicamento> existentes = carregar();
            int maiorId = existentes.stream().mapToInt(Medicamento::getId).max().orElse(0);
            Medicamento.atualizarContadorId(maiorId);
        }
    }

    private List<Medicamento> carregar() {
        File arquivo = new File(caminhoArquivo);
        if (!arquivo.exists() || arquivo.length() == 0) return new ArrayList<>();
        try (Reader reader = new FileReader(arquivo)) {
            Type tipo = new TypeToken<List<Medicamento>>() {}.getType();
            List<Medicamento> lista = gson.fromJson(reader, tipo);
            return lista != null ? lista : new ArrayList<>();
        } catch (IOException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    private void salvar(List<Medicamento> lista) {
        File arquivo = new File(caminhoArquivo);
        if (arquivo.getParentFile() != null) arquivo.getParentFile().mkdirs();
        try (Writer writer = new FileWriter(arquivo)) {
            gson.toJson(lista, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private int proximoId(List<Medicamento> lista) {
        return lista.stream().mapToInt(Medicamento::getId).max().orElse(0) + 1;
    }

    @Override
    public Medicamento inserir(Medicamento medicamento) {
        List<Medicamento> lista = carregar();
        medicamento.setId(proximoId(lista));
        lista.add(medicamento);
        salvar(lista);
        return medicamento;
    }

    @Override
    public List<Medicamento> listar() {
        return carregar();
    }

    @Override
    public Medicamento buscarPorId(int id) {
        return carregar().stream().filter(m -> m.getId() == id).findFirst().orElse(null);
    }

    @Override
    public Medicamento atualizar(Medicamento medicamento) {
        List<Medicamento> lista = carregar();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).getId() == medicamento.getId()) {
                lista.set(i, medicamento);
                salvar(lista);
                return medicamento;
            }
        }
        return null;
    }

    @Override
    public boolean remover(int id) {
        List<Medicamento> lista = carregar();
        boolean removido = lista.removeIf(m -> m.getId() == id);
        if (removido) salvar(lista);
        return removido;
    }

}
