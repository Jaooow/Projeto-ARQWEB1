<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
    <main class="container my-5 min-vh-100">
        <div class="row mb-4 align-items-center">
            <div class="col-md-6">
                <h2 class="fw-bold" style="color: #2D6A4F;">
                    <i style="color: #FFD700;"></i>Medicamentos em Destaque
                </h2>
                <p class="text-muted">Confira os últimos lançamentos e promoções do dia.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" class="btn btn-outline-success rounded-pill px-4">Ver Todos</a>
            </div>
        </div>

        <!-- Grid de Medicamentos -->
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

            <!-- Card de Exemplo 1 -->
            <div class="col">
                <div class="card h-100 border-0 shadow-sm custom-card">
                    <div class="card-badge bg-warning text-dark px-3 py-1 fw-bold">PROMOÇÃO</div>
                    <div class="card-body p-4 text-center">
                        <i class="bi bi-capsule text-success mb-3" style="font-size: 3rem;"></i>
                        <h5 class="card-title fw-bold">Amoxicilina 500mg</h5>
                        <p class="text-muted small mb-3">Amoxicilina Tri-hidratada</p>

                        <div class="d-flex justify-content-center gap-2 mb-3">
                            <span class="badge rounded-pill text-success" style="background-color: #D8F3DC;">Cápsula</span>
                            <span class="badge rounded-pill text-secondary bg-light border">Lote: 45A8</span>
                        </div>

                        <ul class="list-unstyled text-start small mb-4">
                            <li><i class="bi bi-building me-2"></i><strong>Fabricante:</strong> MedLey</li>
                            <li><i class="bi bi-calendar-event me-2"></i><strong>Validade:</strong> 12/2026</li>
                        </ul>

                        <button class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold">
                            Ver Detalhes
                        </button>
                    </div>
                </div>
            </div>

            <!-- Card de Exemplo 2 (Lançamento) -->
            <div class="col">
                <div class="card h-100 border-0 shadow-sm custom-card">
                    <div class="card-badge bg-info text-white px-3 py-1 fw-bold">NOVO</div>
                    <div class="card-body p-4 text-center">
                        <i class="bi bi-droplet-half text-primary mb-3" style="font-size: 3rem;"></i>
                        <h5 class="card-title fw-bold">Dexametasona</h5>
                        <p class="text-muted small mb-3">Elixir 0,1mg/mL</p>

                        <div class="d-flex justify-content-center gap-2 mb-3">
                            <span class="badge rounded-pill text-success" style="background-color: #D8F3DC;">Solução</span>
                            <span class="badge rounded-pill text-secondary bg-light border">Lote: 12B2</span>
                        </div>

                        <ul class="list-unstyled text-start small mb-4">
                            <li><i class="bi bi-building me-2"></i><strong>Fabricante:</strong> EMS</li>
                            <li><i class="bi bi-calendar-event me-2"></i><strong>Validade:</strong> 08/2027</li>
                        </ul>

                        <button class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold">
                            Ver Detalhes
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>
<c:import url="/includes/footer.jsp" />