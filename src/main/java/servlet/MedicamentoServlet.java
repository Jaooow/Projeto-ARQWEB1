package servlet;

import classes.Medicamento;
import classes.MedicamentoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/medicamento")
public class MedicamentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if (acao == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        switch (acao) {

            case "listar":
                HttpSession session = request.getSession(false);

                if (session == null || session.getAttribute("usuario") == null) {
                    response.sendRedirect(request.getContextPath() + "/assets/html/error.jsp");
                    return;
                }

                request.setAttribute("lista", MedicamentoDAO.listar());
                request.getRequestDispatcher("/assets/html/gerenciar.jsp").forward(request, response);
                break;

            case "buscar":

                String termo = request.getParameter("busca");

                request.setAttribute("lista", MedicamentoDAO.buscar(termo));
                request.setAttribute("busca", termo);

                request.getRequestDispatcher("/index.jsp").forward(request, response);

                break;

            case "editar":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("med", MedicamentoDAO.buscarPorId(id));
                    request.getRequestDispatcher("/assets/html/editar.jsp").forward(request, response);
                } catch (Exception e) {
                    response.sendRedirect(request.getContextPath() + "/medicamento?acao=listar");
                }
                break;

            case "excluir":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    MedicamentoDAO.remover(id);
                } catch (Exception e) {
                    // evita crash
                }
                response.sendRedirect(request.getContextPath() + "/medicamento?acao=listar");
                break;

            case "detalhes":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("med", MedicamentoDAO.buscarPorId(id));
                    request.getRequestDispatcher("/assets/html/detalhes.jsp").forward(request, response);
                } catch (Exception e) {
                    response.sendRedirect(request.getContextPath() + "/medicamento?acao=listar");
                }
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParam = request.getParameter("id");

            String nome = request.getParameter("nome");
            String principio = request.getParameter("principio");
            String fabricante = request.getParameter("fabricante");
            String lote = request.getParameter("lote");
            String validade = request.getParameter("validade");
            String indicacao = request.getParameter("indicacao");
            String dosagem = request.getParameter("dosagem");
            String forma = request.getParameter("forma");

            if (idParam != null && !idParam.isEmpty()) {

                int id = Integer.parseInt(idParam);

                Medicamento m = MedicamentoDAO.buscarPorId(id);

                if (m != null) {
                    m.setNome(nome);
                    m.setPrincipioAtivo(principio);
                    m.setFabricante(fabricante);
                    m.setLote(lote);
                    m.setIndicacao(indicacao);
                    m.setDosagem(dosagem);
                    m.setForma(forma);
                    m.setValidade(java.time.LocalDate.parse(validade));
                }

            } else {
                Medicamento m = new Medicamento(
                        nome, principio, fabricante,
                        lote, validade, indicacao,
                        dosagem, forma
                );

                MedicamentoDAO.adicionar(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/medicamento?acao=listar");
    }
}