package servlet;

import classes.Usuario;
import classes.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        // teste console
        System.out.println("Login recebido: " + login);
        System.out.println("Senha recebida: " + senha);

        Usuario user = UsuarioDAO.autenticar(login, senha);

        if(user != null){
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);

            response.sendRedirect(request.getContextPath() + "/index.jsp");

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("erroLogin", "Usuário ou senha inválidos");

            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}