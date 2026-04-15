<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, classes.MedicamentoDAO, classes.Medicamento" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />

<%
    // Recupera a lista enviada pela Servlet (busca)
    List<Medicamento> lista = (List<Medicamento>) request.getAttribute("lista");

    // Se a lista for nula (acesso direto à home), carrega os produtos pre-setados do DAO
    if(lista == null){
        lista = MedicamentoDAO.listar();
    }

    String termoBusca = (String) request.getAttribute("busca");
%>

<main class="container my-5 min-vh-100">

    <div class="row mb-5 align-items-center">
        <div class="col-md-7">
            <h2 class="fw-bold" style="color: #0c795a;">
                <i class="bi text-warning me-2"></i>
                <%= (termoBusca != null) ? "Resultados para: " + termoBusca : "Medicamentos em Destaque" %>
            </h2>
            <p class="text-muted lead">
                <%= (termoBusca != null) ? "Encontramos " + lista.size() + " item(ns) para sua pesquisa." : "Confira os itens em promoção e os últimos lançamentos do nosso estoque." %>
            </p>
        </div>

        <div class="col-md-5 text-md-end">
            <a href="medicamento?acao=listar" class="btn btn-outline-success rounded-pill px-4 fw-bold">
                <i class="bi bi-grid-3x3-gap me-2"></i>Ver Painel Geral
            </a>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <%
            if(lista != null && !lista.isEmpty()){
                for(Medicamento m : lista){

                    // Se o medicamento está vencido E o usuário NÃO está logado, pula para o próximo da lista
                    if(m.isVencido() && session.getAttribute("usuario") == null) {
                        continue;
                    }

        %>

        <div class="col">
            <div class="card h-100 border-0 shadow-sm custom-card">

                <% if(m.isVencido()) { %>
                    <div class="card-badge bg-danger text-white px-3 py-1 fw-bold">VENCIDO</div>
                <% } else if(m.isPromocao()) { %>
                    <div class="card-badge bg-warning text-dark px-3 py-1 fw-bold">PROMOÇÃO</div>
                <% } else { %>
                    <div class="card-badge bg-info text-white px-3 py-1 fw-bold">NOVO</div>
                <% } %>

                <div class="card-body p-4 text-center">

                    <div class="mb-3">
                        <% if(m.getForma().equalsIgnoreCase("Solução") || m.getForma().equalsIgnoreCase("Injetável")) { %>
                            <i class="bi bi-droplet-half text-primary" style="font-size: 3.5rem;"></i>
                        <% } else { %>
                            <i class="bi bi-capsule text-success" style="font-size: 3.5rem;"></i>
                        <% } %>
                    </div>

                    <h5 class="card-title fw-bold text-dark mb-1">
                        <%= m.getNome() %>
                    </h5>

                    <p class="text-muted small mb-3">
                        <%= m.getPrincipioAtivo() %>
                    </p>

                    <div class="d-flex justify-content-center gap-2 mb-4">
                        <span class="badge rounded-pill text-success" style="background-color: #D8F3DC; font-size: 0.85rem;">
                            <%= m.getForma() %>
                        </span>
                        <span class="badge rounded-pill text-secondary bg-light border" style="font-size: 0.85rem;">
                            Lote: <%= m.getLote() %>
                        </span>
                    </div>

                    <ul class="list-unstyled text-start small mb-4 p-3 rounded-3" style="background-color: #f8f9fa;">
                        <li class="mb-2">
                            <i class="bi bi-building text-success me-2"></i>
                            <strong>Fabricante:</strong> <%= m.getFabricante() %>
                        </li>
                        <li>
                            <i class="bi bi-calendar-check text-success me-2"></i>
                            <strong>Validade:</strong>
                            <span class="<%= m.isVencido() ? "text-danger fw-bold" : "" %>">
                                <%= m.getValidadeFormatada() %>
                            </span>
                        </li>
                    </ul>

                    <a href="medicamento?acao=detalhes&id=<%=m.getId()%>"
                       class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold shadow-sm">
                        Ver Detalhes Técnicos
                    </a>

                </div>
            </div>
        </div>

        <%
            }
        } else {
        %>

        <div class="col-12 text-center py-5">
            <i class="bi bi-search text-muted" style="font-size: 4rem;"></i>
            <h4 class="mt-4 text-muted">Nenhum medicamento encontrado</h4>
            <p class="text-muted">Tente buscar por outro termo ou cadastre novos itens no painel.</p>
            <a href="index.jsp" class="btn btn-success rounded-pill mt-3">Limpar Busca</a>
        </div>

        <%
            }
        %>

    </div>
</main>

<c:import url="/includes/footer.jsp" />