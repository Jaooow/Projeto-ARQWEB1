package servlet;

import classes.Usuario;
import classes.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        Usuario sessionUser = (Usuario) session.getAttribute("usuario");

        if (sessionUser != null) {


            Usuario realUser = UsuarioDAO.buscar(sessionUser.getLogin());

            if (realUser != null) {

                String novoLogin = request.getParameter("login");
                String novaSenha = request.getParameter("senha");

                // realUser.setLogin(novoLogin);

                if (novaSenha != null && !novaSenha.isEmpty()) {
                    realUser.setSenha(novaSenha);
                }


                session.setAttribute("usuario", realUser);
            }
        }

        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}