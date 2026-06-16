package classes.dao;


import classes.model.Usuario;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.io.*;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOJson implements UsuarioDAO {

    private final String caminhoArquivo;
    private final Gson gson;

    public UsuarioDAOJson(String caminhoArquivo) {
        this.caminhoArquivo = caminhoArquivo;
        this.gson = new GsonBuilder().setPrettyPrinting().create();
        inicializarArquivo();
    }

    private void inicializarArquivo() {
        File arquivo = new File(caminhoArquivo);
        if (!arquivo.exists() || arquivo.length() == 0) {
            List<Usuario> inicial = new ArrayList<>();
            inicial.add(new Usuario("admin", "123"));
            salvar(inicial);
        }
    }

    private List<Usuario> carregar() {
        File arquivo = new File(caminhoArquivo);
        if (!arquivo.exists() || arquivo.length() == 0) return new ArrayList<>();
        try (Reader reader = new FileReader(arquivo)) {
            Type tipo = new TypeToken<List<Usuario>>() {}.getType();
            List<Usuario> lista = gson.fromJson(reader, tipo);
            return lista != null ? lista : new ArrayList<>();
        } catch (IOException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    private void salvar(List<Usuario> lista) {
        File arquivo = new File(caminhoArquivo);
        if (arquivo.getParentFile() != null) arquivo.getParentFile().mkdirs();
        try (Writer writer = new FileWriter(arquivo)) {
            gson.toJson(lista, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Usuario inserir(String login, String senha) {
        List<Usuario> lista = carregar();
        Usuario novo = new Usuario(login, senha);
        lista.add(novo);
        salvar(lista);
        return novo;
    }

    @Override
    public Usuario buscarPorLogin(String login) {
        return carregar().stream().filter(u -> u.getLogin().equals(login)).findFirst().orElse(null);
    }

    @Override
    public List<Usuario> listar() {
        return carregar();
    }

    public Usuario autenticar(String login, String senha) {
        return carregar().stream()
                .filter(u -> u.getLogin().equals(login) && u.getSenha().equals(senha))
                .findFirst().orElse(null);
    }

}
