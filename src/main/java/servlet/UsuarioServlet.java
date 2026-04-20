package servlet;

import classes.Usuario;
import classes.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig; // Importante!
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@WebServlet("/usuario")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UsuarioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        HttpSession session = request.getSession();
        Usuario sessionUser = (Usuario) session.getAttribute("usuario");

        if (sessionUser != null) {
            Usuario realUser = UsuarioDAO.buscar(sessionUser.getLogin());

            if (realUser != null) {
                // ... (seu código de login e senha já existente)

                // LÓGICA DA IMAGEM
                Part filePart = request.getPart("foto"); // "foto" deve ser o name do input no JSP

                if (filePart != null && filePart.getSize() > 0) {
                    InputStream inputStream = filePart.getInputStream();
                    byte[] bytes = inputStream.readAllBytes();

                    // Converte os bytes para String Base64
                    String base64Image = Base64.getEncoder().encodeToString(bytes);
                    realUser.setFotoBase64(base64Image);
                }

                session.setAttribute("usuario", realUser);
            }
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}