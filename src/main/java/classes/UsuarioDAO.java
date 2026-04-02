package classes;

public class UsuarioDAO {

    // USUÁRIO FIXO (ADMIN)
    private static Usuario admin = new Usuario("admin", "123");

    public static Usuario autenticar(String login, String senha) {

        if(admin.getLogin().equals(login) && admin.getSenha().equals(senha)){
            return admin;
        }

        return null;
    }
}