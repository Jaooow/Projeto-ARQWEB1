<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Medicamento" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<%
    Medicamento m = (Medicamento) request.getAttribute("med");

    if(m == null){
        response.sendRedirect("error.jsp");
        return;
    }
%>

<main class="container my-5">

    <div class="mb-4">
        <a href="medicamento?acao=listar" class="text-decoration-none text-success fw-bold">
            <i class="bi bi-arrow-left me-2"></i>Voltar para a Listagem
        </a>
    </div>

    <div class="row g-4">

        <!-- ESQUERDA -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm text-center p-4 rounded-4 h-100">

                <div class="py-5">
                    <i class="bi bi-capsule-pill text-success" style="font-size: 6rem;"></i>
                </div>

                <h3 class="fw-bold" style="color: #0c795a;">
                    <%= m.getNome() %>
                </h3>

                <p class="text-muted">
                    <%= m.getPrincipioAtivo() %>
                </p>

                <span class="badge rounded-pill px-4 py-2 mb-3"
                      style="background-color: #D8F3DC; color: #0c795a; font-size: 1rem;">
                    <%= m.getForma() %>
                </span>

                <div class="mt-auto">
                    <p class="small text-muted mb-1">Data de validade:</p>
                    <p class="small fw-bold">
                        <%= m.getValidadeFormatada() %>
                    </p>
                </div>
            </div>
        </div>

        <!-- DIREITA -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4 p-md-5">

                    <h4 class="fw-bold mb-4" style="color: #0c795a;">
                        Especificações Técnicas
                    </h4>

                    <div class="row g-4">

                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Fabricante</label>
                            <p class="fs-5 mb-0"><%= m.getFabricante() %></p>
                        </div>

                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Dosagem</label>
                            <p class="fs-5 mb-0"><%= m.getDosagem() %></p>
                        </div>

                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Lote</label>
                            <p class="fs-5 mb-0"><%= m.getLote() %></p>
                        </div>

                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Data de Validade</label>
                            <p class="fs-5 mb-0 text-danger fw-bold">
                                <%= m.getValidadeFormatada() %>
                            </p>
                        </div>

                        <div class="col-12 mt-4">
                            <label class="text-muted small text-uppercase fw-bold">Indicação</label>
                            <div class="p-3 rounded-3 mt-2"
                                 style="background-color: #f8f9fa; border-left: 4px solid #0c795a;">
                                <p class="mb-0">
                                    <%= m.getIndicacao() %>
                                </p>
                            </div>
                        </div>

                    </div>

                    <!-- AÇÕES -->
                    <%
                        if(session.getAttribute("usuario") != null){
                    %>
                    <div class="mt-5 pt-3 d-flex gap-2 border-top">

                        <!-- EDITAR -->
                        <a href="medicamento?acao=editar&id=<%=m.getId()%>"
                           class="btn btn-warning rounded-pill px-4 fw-bold shadow-sm">
                            <i class="bi bi-pencil-square me-2"></i>Editar Dados
                        </a>

                        <!-- EXCLUIR -->
                        <a href="medicamento?acao=excluir&id=<%=m.getId()%>"
                           class="btn btn-outline-danger rounded-pill px-4 fw-bold"
                           onclick="return confirm('Tem certeza que deseja remover?')">
                            <i class="bi bi-trash me-2"></i>Remover
                        </a>

                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
        </div>

    </div>
</main>

<c:import url="/includes/footer.jsp" />