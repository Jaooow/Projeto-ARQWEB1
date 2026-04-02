<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, classes.MedicamentoDAO, classes.Medicamento" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<%
    List<Medicamento> lista = MedicamentoDAO.listar();
%>

<main class="container my-5 min-vh-100">

    <div class="row mb-4 align-items-center">
        <div class="col-md-6">
            <h2 class="fw-bold" style="color: #2D6A4F;">
                Medicamentos em Destaque
            </h2>
            <p class="text-muted">Confira os últimos lançamentos e promoções do dia.</p>
        </div>

        <div class="col-md-6 text-md-end">
            <a href="medicamento?acao=listar" class="btn btn-outline-success rounded-pill px-4">
                Ver Todos
            </a>
        </div>
    </div>

    <!-- GRID -->
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <%
            if(lista != null && !lista.isEmpty()){
                for(Medicamento m : lista){
        %>

        <div class="col">
            <div class="card h-100 border-0 shadow-sm custom-card">

                <div class="card-badge bg-info text-white px-3 py-1 fw-bold">
                    NOVO
                </div>

                <div class="card-body p-4 text-center">

                    <i class="bi bi-capsule text-success mb-3" style="font-size: 3rem;"></i>

                    <h5 class="card-title fw-bold">
                        <%= m.getNome() %>
                    </h5>

                    <p class="text-muted small mb-3">
                        <%= m.getPrincipioAtivo() %>
                    </p>

                    <div class="d-flex justify-content-center gap-2 mb-3">
                        <span class="badge rounded-pill text-success" style="background-color: #D8F3DC;">
                            <%= m.getForma() %>
                        </span>

                        <span class="badge rounded-pill text-secondary bg-light border">
                            Lote: <%= m.getLote() %>
                        </span>
                    </div>

                    <ul class="list-unstyled text-start small mb-4">
                        <li>
                            <i class="bi bi-building me-2"></i>
                            <strong>Fabricante:</strong> <%= m.getFabricante() %>
                        </li>
                        <li>
                            <i class="bi bi-calendar-event me-2"></i>
                            <strong>Validade:</strong> <%= m.getValidadeFormatada() %>
                        </li>
                    </ul>

                    <a href="medicamento?acao=detalhes&id=<%=m.getId()%>"
                       class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold">
                        Ver Detalhes
                    </a>

                </div>
            </div>
        </div>

        <%
            }
        } else {
        %>

        <div class="col-12 text-center text-muted">
            <p>Nenhum medicamento cadastrado ainda.</p>
        </div>

        <%
            }
        %>

    </div>
</main>

<c:import url="/includes/footer.jsp" />