<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/includes/header.jsp" />
    <main class="container my-5 min-vh-100">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold" style="color: #0c795a;">Gerenciar Medicamentos</h2>
            <button class="btn btn-success rounded-pill px-4 shadow-sm">
                <i class="bi bi-plus-lg me-2"></i>Novo Medicamento
            </button>
        </div>

        <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead style="background-color: #0c795a; color: white;">
                        <tr>
                            <th class="ps-4">Medicamento</th>
                            <th>Fabricante</th>
                            <th>Validade</th>
                            <th>Lote</th>
                            <th>Dosagem</th>
                            <th class="text-center">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Exemplo de Linha 1 -->
                        <tr>
                            <td class="ps-4">
                                <div class="fw-bold">Amoxicilina</div>
                                <small class="text-muted">Cápsula</small>
                            </td>
                            <td>MedLey</td>
                            <td><span class="badge bg-light text-dark border">12/2026</span></td>
                            <td>45A8</td>
                            <td>500mg</td>
                            <td class="text-center">
                                <div class="btn-group shadow-sm rounded-pill bg-white p-1">
                                    <button class="btn btn-sm btn-outline-warning border-0 rounded-circle me-1" title="Editar">
                                        <i class="bi bi-pencil-square"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger border-0 rounded-circle" title="Excluir">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <!-- Outras linhas seriam geradas pelo seu loop Java no futuro -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>
<c:import url="/includes/footer.jsp" />