<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
    <main class="container my-5">
        <!-- Botão Voltar -->
        <div class="mb-4">
            <a href="index.html" class="text-decoration-none text-success fw-bold">
                <i class="bi bi-arrow-left me-2"></i>Voltar para a Listagem
            </a>
        </div>

        <div class="row g-4">
            <!-- Coluna da Esquerda: Resumo Visual -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm text-center p-4 rounded-4 h-100">
                    <div class="py-5">
                        <i class="bi bi-capsule-pill text-success" style="font-size: 6rem;"></i>
                    </div>
                    <h3 class="fw-bold" style="color: #0c795a;">Amoxicilina</h3>
                    <p class="text-muted">Amoxicilina Tri-hidratada</p>
                    <span class="badge rounded-pill px-4 py-2 mb-3" style="background-color: #D8F3DC; color: #0c795a; font-size: 1rem;">
                        Cápsula
                    </span>
                    <div class="mt-auto">
                        <p class="small text-muted mb-1">Última atualização do registro:</p>
                        <p class="small fw-bold">26/03/2026</p>
                    </div>
                </div>
            </div>

            <!-- Coluna da Direita: Informações Técnicas -->
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm rounded-4 h-100">
                    <div class="card-body p-4 p-md-5">
                        <h4 class="fw-bold mb-4" style="color: #0c795a;">Especificações Técnicas</h4>

                        <div class="row g-4">
                            <div class="col-md-6 border-bottom pb-3">
                                <label class="text-muted small text-uppercase fw-bold">Fabricante</label>
                                <p class="fs-5 mb-0">MedLey S.A.</p>
                            </div>
                            <div class="col-md-6 border-bottom pb-3">
                                <label class="text-muted small text-uppercase fw-bold">Dosagem</label>
                                <p class="fs-5 mb-0">500mg</p>
                            </div>
                            <div class="col-md-6 border-bottom pb-3">
                                <label class="text-muted small text-uppercase fw-bold">Lote</label>
                                <p class="fs-5 mb-0">45A8-2026</p>
                            </div>
                            <div class="col-md-6 border-bottom pb-3">
                                <label class="text-muted small text-uppercase fw-bold">Data de Validade</label>
                                <p class="fs-5 mb-0 text-danger fw-bold">12/2026</p>
                            </div>

                            <div class="col-12 mt-4">
                                <label class="text-muted small text-uppercase fw-bold">Indicação</label>
                                <div class="p-3 rounded-3 mt-2" style="background-color: #f8f9fa; border-left: 4px solid #0c795a;">
                                    <p class="mb-0">
                                        Indicado para o tratamento de infecções bacterianas causadas por germes sensíveis à ação da amoxicilina.
                                        Uso sob prescrição médica obrigatória.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Ações de Gerenciamento (Visíveis apenas se logado) -->
                        <div class="mt-5 pt-3 d-flex gap-2 border-top">
                            <button class="btn btn-warning rounded-pill px-4 fw-bold shadow-sm">
                                <i class="bi bi-pencil-square me-2"></i>Editar Dados
                            </button>
                            <button class="btn btn-outline-danger rounded-pill px-4 fw-bold">
                                <i class="bi bi-trash me-2"></i>Remover
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
<c:import url="/includes/footer.jsp" />