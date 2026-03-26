<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
     <main class="container my-5 min-vh-100 d-flex align-items-center justify-content-center">
        <div class="row justify-content-center w-100">
            <div class="col-md-8 col-lg-6">
                <div class="card border-0 shadow-lg text-center p-5 rounded-4">
                    <div class="card-body">
                        <!-- Ícone de Alerta Farmacêutico -->
                        <div class="mb-4">
                            <i class="bi bi-exclamation-octagon text-warning" style="font-size: 5rem;"></i>
                        </div>

                        <h1 class="fw-bold mb-3" style="color: #0c795a;">Acesso Não Autorizado</h1>

                        <p class="text-muted lead mb-4">
                            Ops! Parece que você tentou acessar uma área restrita do sistema.
                            <strong>Apenas usuários registrados</strong> podem realizar operações de gerenciamento.
                        </p>

                        <div class="alert alert-light border-0 mb-4" style="background-color: #f1f8f5; color: #0c795a;">
                            <i class="bi bi-info-circle me-2"></i>
                            Por favor, realize o login para continuar.
                        </div>

                        <!-- Botões de Ação -->
                        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                            <a href="index.html" class="btn btn-success rounded-pill px-4 py-2 fw-bold" style="background-color: #0c795a;">
                                <i class="bi bi-house-door me-2"></i>Voltar para Home
                            </a>
                            <!-- Botão que abre o modal de login que já criamos -->
                            <button class="btn btn-outline-success rounded-pill px-4 py-2 fw-bold" data-bs-toggle="modal" data-bs-target="#loginModal">
                                <i class="bi bi-person-lock me-2"></i>Fazer Login
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Rodapé da mensagem de erro -->
                <p class="text-center text-muted mt-4 small">
                    Código do Erro: <strong>403 Forbidden</strong><br>
                    Fármacos & Cia - Sistema de Segurança
                </p>
            </div>
        </div>
    </main>
<c:import url="/includes/footer.jsp" />