<%
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("error.jsp");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, classes.Medicamento" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<main class="container my-5 min-vh-100">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold" style="color: #0c795a;">Gerenciar Medicamentos</h2>

        <a href="${pageContext.request.contextPath}/assets/html/cadastro.jsp" class="btn btn-success rounded-pill px-4 shadow-sm">
            <i class="bi bi-plus-lg me-2"></i>Novo Medicamento
        </a>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">

                <thead style="background-color: #0c795a; color: white;">
                <tr>
                    <th class="ps-4">Medicamento</th>
                    <th>Fabricante</th>
                    <th>Validade</th>
                    <th>Lote</th>
                    <th>Dosagem</th>
                    <th class="text-center">Ações</th>
                </tr>
                </thead>

                <tbody>

                <%
                    List<Medicamento> lista = (List<Medicamento>) request.getAttribute("lista");

                    if(lista != null && !lista.isEmpty()){
                        for(Medicamento m : lista){
                %>

                <tr>
                    <td class="ps-4">
                        <div class="fw-bold"><%= m.getNome() %></div>
                        <small class="text-muted"><%= m.getForma() %></small>
                    </td>

                    <td><%= m.getFabricante() %></td>

                    <!-- DATA FORMATADA -->

                    <td>
                        <span class="badge <%= m.isVencido() ? "bg-danger" : "bg-light text-dark border" %>">
                            <%= m.getValidadeFormatada() %>
                        </span>
                    </td>
                    <td><%= m.getLote() %></td>
                    <td><%= m.getDosagem() %></td>

                    <td class="text-center">
                        <div class="btn-group shadow-sm rounded-pill bg-white p-1">

                            <!-- DETALHES -->
                            <a href="medicamento?acao=detalhes&id=<%=m.getId()%>"
                               class="btn btn-sm btn-outline-primary border-0 rounded-circle me-1"
                               title="Ver">
                                <i class="bi bi-eye"></i>
                            </a>

                            <!-- EDITAR -->
                            <a href="medicamento?acao=editar&id=<%=m.getId()%>"
                               class="btn btn-sm btn-outline-warning border-0 rounded-circle me-1"
                               title="Editar">
                                <i class="bi bi-pencil-square"></i>
                            </a>

                            <!-- EXCLUIR -->
                            <a href="medicamento?acao=excluir&id=<%=m.getId()%>"
                               class="btn btn-sm btn-outline-danger border-0 rounded-circle"
                               title="Excluir"
                               onclick="return confirm('Tem certeza que deseja excluir?')">
                                <i class="bi bi-trash"></i>
                            </a>

                        </div>
                    </td>
                </tr>

                <%
                    }
                } else {
                %>

                <tr>
                    <td colspan="6" class="text-center py-4 text-muted">
                        Nenhum medicamento cadastrado.
                    </td>
                </tr>

                <%
                    }
                %>

                </tbody>

            </table>
        </div>
    </div>
</main>

<c:import url="/includes/footer.jsp" />