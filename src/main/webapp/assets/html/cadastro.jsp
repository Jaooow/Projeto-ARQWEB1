<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
    <main class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-header p-4 border-0" style="background-color: #0c795a; color: white; border-radius: 15px 15px 0 0;">
                        <h4 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Cadastrar Novo Medicamento</h4>
                    </div>
                    <div class="card-body p-4">
                        <!-- O action apontará para sua Servlet futuramente -->
                        <form action="SalvarMedicamentoServlet" method="POST">
                            <div class="row g-3">
                                <!-- Nome Comercial -->
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Nome Comercial</label>
                                    <input type="text" name="nomeComercial" class="form-control" placeholder="Ex: Amoxicilina" required>
                                </div>

                                <!-- Princípio Ativo -->
                                <div class="col-md-6">
                                    <label class="form-label fw-bold">Princípio Ativo</label>
                                    <input type="text" name="principioAtivo" class="form-control" placeholder="Ex: Amoxicilina Tri-hidratada" required>
                                </div>

                                <!-- Fabricante -->
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Fabricante</label>
                                    <input type="text" name="fabricante" class="form-control" placeholder="Ex: MedLey" required>
                                </div>

                                <!-- Dosagem -->
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Dosagem</label>
                                    <input type="text" name="dosagem" class="form-control" placeholder="Ex: 500mg" required>
                                </div>

                                <!-- Forma Farmacêutica -->
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Forma Farmacêutica</label>
                                    <select name="formaFarmaceutica" class="form-select">
                                        <option value="Comprimido">Comprimido</option>
                                        <option value="Cápsula">Cápsula</option>
                                        <option value="Solução">Solução/Xarope</option>
                                        <option value="Injetável">Injetável</option>
                                    </select>
                                </div>

                                <!-- Lote -->
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Lote</label>
                                    <input type="text" name="lote" class="form-control" placeholder="Ex: 45A8" required>
                                </div>

                                <!-- Data de Validade -->
                                <div class="col-md-4">
                                    <label class="form-label fw-bold">Data de Validade</label>
                                    <input type="date" name="dataValidade" class="form-control" required>
                                </div>

                                <!-- Indicação -->
                                <div class="col-12">
                                    <label class="form-label fw-bold">Indicação</label>
                                    <textarea name="indicacao" class="form-control" rows="3" placeholder="Descreva brevemente a indicação do medicamento..."></textarea>
                                </div>

                                <!-- Botões -->
                                <div class="col-12 d-flex gap-2 mt-4">
                                    <button type="submit" class="btn btn-success px-5 rounded-pill fw-bold" style="background-color: #0c795a;">
                                        Salvar Medicamento
                                    </button>
                                    <a href="gerenciar.html" class="btn btn-outline-secondary px-5 rounded-pill">
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