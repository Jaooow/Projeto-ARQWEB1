package classes;

import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private static List<Usuario> usuarios = new ArrayList<>();

    static {
        usuarios.add(new Usuario("admin", "123"));
    }

    public static Usuario autenticar(String login, String senha) {

        for (Usuario u : usuarios) {
            if (u.getLogin().equals(login) && u.getSenha().equals(senha)) {
                return u;
            }
        }

        return null;
    }

    public static Usuario buscar(String login) {
        for (Usuario u : usuarios) {
            if (u.getLogin().equals(login)) {
                return u;
            }
        }
        return null;
    }

    public static void atualizar(Usuario usuarioAtualizado) {
        for (int i = 0; i < usuarios.size(); i++) {
            if (usuarios.get(i).getLogin().equals(usuarioAtualizado.getLogin())) {
                usuarios.set(i, usuarioAtualizado);
                break;
            }
        }
    }
}