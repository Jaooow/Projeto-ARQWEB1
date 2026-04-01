<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="pt-Br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fármacos & Cia - Index</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark custom-nav">
                <div class="container-fluid">
                    <!-- Esquerda: Logo com Imagem -->
                    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Logo Fármacos & Cia" class="logo-img me-2">
                        <span>Fármacos & Cia</span>
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarContent">
                        <!-- Centro: Links Principais -->
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/assets/html/sobre.jsp">Sobre</a></li>
                        </ul>

                        <!-- Direita: Busca e Login Separados -->
                        <div class="d-flex align-items-center gap-3">
                            <!-- Barra de Busca -->
                            <form class="d-flex" role="search" action="BuscarMedicamentoServlet" method="GET">
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-0 rounded-start-pill">
                                        <i class="bi bi-search text-muted"></i>
                                    </span>
                                    <!-- Adicionado o atributo 'name' -->
                                    <input name="query" class="form-control border-0 rounded-end-pill search-input" type="search" placeholder="Buscar..." aria-label="Search">
                                </div>
                            </form>

                            <!-- Área de Login/Perfil -->
                            <div class="vr text-white opacity-25 d-none d-lg-block" style="height: 30px;"></div> <!-- Linha divisória vertical -->

                                <!-- Botão que dispara o Modal -->
                                <a href="#" class="btn-login-icon" data-bs-toggle="modal" data-bs-target="#loginModal" title="Fazer Login">
                                    <i class="bi bi-person-circle"></i>
                                    <span class="d-lg-none ms-2">Login</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>