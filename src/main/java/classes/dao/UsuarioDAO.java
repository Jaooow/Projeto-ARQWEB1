package classes.dao;

import classes.model.Usuario;

import java.util.List;

public interface UsuarioDAO {

    Usuario inserir(String login, String senha);

    Usuario buscarPorLogin(String login);

    List<Usuario> listar();

}