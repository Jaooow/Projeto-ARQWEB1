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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark custom-nav">
        <div class="container-fluid">

            <!-- Logo -->
            <a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/index.jsp">
                <img src="${pageContext.request.contextPath}/assets/img/logo.png" class="logo-img me-2">
                <span>Fármacos & Cia</span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarContent">

                <!-- MENU CENTRAL -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/index.jsp">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/assets/html/sobre.jsp">Sobre</a>
                    </li>

                    <!-- SÓ APARECE SE ESTIVER LOGADO -->
                    <%
                        if(session.getAttribute("usuario") != null){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/assets/html/cadastro.jsp">Adicionar</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/medicamento?acao=listar">Gerenciar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/assets/html/perfil.jsp">
                            Meu Perfil
                        </a>
                    </li>
                    <%
                        }
                    %>
                </ul>

                <!-- DIREITA -->
                <div class="d-flex align-items-center gap-3">

                    <!-- BUSCA -->
                    <form class="d-flex" action="medicamento" method="GET">
                        <input type="hidden" name="acao" value="buscar">

                        <div class="input-group">
                            <span class="input-group-text bg-white border-0 rounded-start-pill">
                                <i class="bi bi-search text-muted"></i>
                            </span>
                            <input name="busca" class="form-control border-0 rounded-end-pill search-input"
                                   type="search" placeholder="Buscar..." required>
                        </div>
                    </form>

                    <div class="vr text-white opacity-25 d-none d-lg-block" style="height: 30px;"></div>

                    <!-- ÁREA DINÂMICA LOGIN -->
                    <%
                        if(session.getAttribute("usuario") != null){
                    %>

                    <!-- LOGADO -->
                    <span class="text-white"> Olá, <%= ((classes.Usuario)session.getAttribute("usuario")).getLogin() %> </span>

                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">
                        Logout
                    </a>

                    <%
                    } else {
                    %>

                    <!-- NÃO LOGADO -->
                    <a href="#" class="btn-login-icon" data-bs-toggle="modal" data-bs-target="#loginModal">
                        <i class="bi bi-person-circle"></i>
                        <span class="d-lg-none ms-2">Login</span>
                    </a>

                    <%
                        }
                    %>

                </div>
            </div>
        </div>
    </nav>
</header>