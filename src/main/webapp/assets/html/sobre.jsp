<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
    <main class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Card Principal de Conteúdo -->
                <div class="card border-0 shadow-lg overflow-hidden" style="border-radius: 25px;">
                    <div class="row g-0">
                        <!-- Lateral Decorativa -->
                        <div class="col-md-4 d-none d-md-flex align-items-center justify-content-center" style="background-color: #0c795a;">
                            <i class="bi bi-info-circle text-white" style="font-size: 8rem;"></i>
                        </div>

                        <div class="col-md-8">
                            <div class="card-body p-5">
                                <h1 class="fw-bold mb-4" style="color: #0c795a;">Sobre o Sistema</h1>
                                <p class="lead text-muted">
                                    O <strong>Fármacos & Cia</strong> é uma plataforma robusta desenvolvida para o gerenciamento simplificado de estoques e informações de medicamentos.
                                </p>
                                <hr class="my-4">
                                <h5 class="fw-bold text-dark">Objetivo do Projeto</h5>
                                <p>
                                    Desenvolvido por <strong>João Pedro & Marcus</strong>, o sistema permite o controle total do ciclo de vida dos medicamentos, desde o cadastro técnico (princípio ativo, lote, fabricante) até a supervisão de datas de validade e dosagens.
                                </p>

                                <h5 class="fw-bold text-dark mt-4">Tecnologias Utilizadas</h5>
                                <div class="d-flex flex-wrap gap-2 mt-2">
                                    <span class="badge rounded-pill px-3 py-2" style="background-color: #D8F3DC; color: #0c795a;">Java Servlet</span>
                                    <span class="badge rounded-pill px-3 py-2" style="background-color: #D8F3DC; color: #0c795a;">JavaScript</span>
                                    <span class="badge rounded-pill px-3 py-2" style="background-color: #D8F3DC; color: #0c795a;">Bootstrap 5</span>
                                    <span class="badge rounded-pill px-3 py-2" style="background-color: #D8F3DC; color: #0c795a;">CSS3 Custom</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
<c:import url="/includes/footer.jsp" />