<%
    if(session.getAttribute("usuario") == null){
        response.sendRedirect("error.jsp");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="classes.Medicamento" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<%
    Medicamento m = (Medicamento) request.getAttribute("med");
    if (m == null) {
        response.sendRedirect(request.getContextPath() + "/medicamento?acao=listar");
        return;
    }
%>

<main class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <div class="card border-0 shadow-lg rounded-4">

                <!-- HEADER -->
                <div class="card-header text-white p-4"
                     style="background-color:#0c795a; border-radius:15px 15px 0 0;">
                    <h4 class="mb-0 fw-bold">
                        <i class="bi bi-pencil-square me-2"></i>Editar Medicamento
                    </h4>
                </div>

                <!-- BODY -->
                <div class="card-body p-4">

                    <form action="${pageContext.request.contextPath}/medicamento" method="post">

                        <!-- ID escondido -->
                        <input type="hidden" name="id" value="<%= m.getId() %>">

                        <div class="row g-3">

                            <div class="col-md-6">
                                <label class="fw-bold">Nome Comercial</label>
                                <input type="text" name="nome" class="form-control"
                                       value="<%= m.getNome() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label class="fw-bold">Princípio Ativo</label>
                                <input type="text" name="principio" class="form-control"
                                       value="<%= m.getPrincipioAtivo() %>" required>
                            </div>

                            <div class="col-md-4">
                                <label class="fw-bold">Fabricante</label>
                                <input type="text" name="fabricante" class="form-control"
                                       value="<%= m.getFabricante() %>" required>
                            </div>

                            <div class="col-md-4">
                                <label class="fw-bold">Dosagem</label>
                                <input type="text" name="dosagem" class="form-control"
                                       value="<%= m.getDosagem() %>" required>
                            </div>

                            <div class="col-md-4">
                                <label class="fw-bold">Forma</label>
                                <select name="forma" class="form-select">
                                    <option <%= m.getForma().equals("Comprimido") ? "selected" : "" %>>Comprimido</option>
                                    <option <%= m.getForma().equals("Cápsula") ? "selected" : "" %>>Cápsula</option>
                                    <option <%= m.getForma().equals("Solução") ? "selected" : "" %>>Solução</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label class="fw-bold">Lote</label>
                                <input type="text" name="lote" class="form-control"
                                       value="<%= m.getLote() %>" required>
                            </div>

                            <div class="col-md-4">
                                <label class="fw-bold">Validade</label>
                                <input type="date" name="validade" class="form-control"
                                       value="<%= m.getValidade() %>" required>
                            </div>

                            <div class="col-12">
                                <label class="fw-bold">Indicação</label>
                                <textarea name="indicacao" class="form-control" rows="3"><%= m.getIndicacao() %></textarea>
                            </div>

                            <!-- BOTÕES -->
                            <div class="col-12 d-flex gap-2 mt-4">
                                <button type="submit"
                                        class="btn px-5 rounded-pill fw-bold text-white"
                                        style="background-color:#0c795a;">
                                    Salvar Alterações
                                </button>

                                <a href="medicamento?acao=listar"
                                   class="btn btn-outline-secondary px-5 rounded-pill">
                                    Cancelar
                                </a>
                            </div>

                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</main>

<c:import url="/includes/footer.jsp" />