package classes.controller;

import classes.dao.UsuarioDAOJson;
import classes.model.Usuario;
import classes.dao.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UsuarioDAOJson usuarioDAO;

    @Override
    public void init() {
        usuarioDAO = (UsuarioDAOJson) getServletContext().getAttribute("usuarioDAO");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        request.setCharacterEncoding("UTF-8");

        String login = request.getParameter("login");
        String senha  = request.getParameter("senha");

        if (login == null || login.trim().isEmpty() || senha == null || senha.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().print("{\"mensagem\":\"Login e senha são obrigatórios\",\"problemas\":[\"login e senha não podem ser vazios\"]}");
            return;
        }

        // Mesma lógica de autenticação do LoginServlet original
        Usuario usuario = usuarioDAO.autenticar(login.trim(), senha.trim());

        if (usuario == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().print("{\"mensagem\":\"Usuário ou senha inválidos\"}");
            return;
        }

        // Igual ao original: armazena o objeto Usuario na sessão
        HttpSession session = request.getSession();
        session.setAttribute("usuario", usuario);

        response.getWriter().print("{\"mensagem\":\"Login realizado com sucesso\",\"login\":\"" + usuario.getLogin() + "\"}");
    }

    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setStatus(HttpServletResponse.SC_OK);
    }
}