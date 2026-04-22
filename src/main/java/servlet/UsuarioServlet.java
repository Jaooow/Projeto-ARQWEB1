package servlet;

import classes.Usuario;
import classes.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/usuario")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        HttpSession session = request.getSession();
        Usuario sessionUser = (Usuario) session.getAttribute("usuario");

        if (sessionUser != null) {
            // busca usuario
            Usuario realUser = UsuarioDAO.buscar(sessionUser.getLogin());

            if (realUser != null) {

                // tratar a img
                Part filePart = request.getPart("foto");
                if (filePart != null && filePart.getSize() > 0) {
                    try (InputStream inputStream = filePart.getInputStream()) {
                        byte[] bytes = inputStream.readAllBytes();
                        String base64Image = Base64.getEncoder().encodeToString(bytes);
                        realUser.setFotoBase64(base64Image);
                    }
                }

                //  tratar senha
                String novaSenha = request.getParameter("senha");
                if (novaSenha != null && !novaSenha.isEmpty()) {
                    realUser.setSenha(novaSenha);
                }

                //  sincronizar
                UsuarioDAO.atualizar(realUser);

                // att a seção
                session.setAttribute("usuario", realUser);
            }
        }


        response.sendRedirect(request.getContextPath() + "/assets/html/perfil.jsp");
    }
}