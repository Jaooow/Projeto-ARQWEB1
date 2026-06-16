package classes.controller;

import classes.dao.MedicamentoDAOJson;
import classes.dao.UsuarioDAOJson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/init", loadOnStartup = 1)
public class InicializadorSistemaServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data/");

        MedicamentoDAOJson medicamentoDAO = new MedicamentoDAOJson(basePath + "medicamentos.json");
        UsuarioDAOJson usuarioDAO = new UsuarioDAOJson(basePath + "usuarios.json");

        getServletContext().setAttribute("medicamentoDAO", medicamentoDAO);
        getServletContext().setAttribute("usuarioDAO", usuarioDAO);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().print("OK");
    }

}