<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <footer class="custom-footer mt-5">
            <div class="container py-5">
                <div class="row g-4">
                    <!-- Coluna 1: Sobre / Logo -->
                    <div class="col-lg-4 col-md-6">
                        <h5 class="fw-bold mb-3 text-white"><i class="bi bi-capsule-pill me-2"></i>Fármacos & Cia</h5>
                        <p class="text-footer-muted">
                            Sistema de gerenciamento farmacêutico dedicado à organização, 
                            segurança e controle de medicamentos para profissionais da saúde.
                        </p>
                        <div class="social-links d-flex gap-3">
                            <a href="#"><i class="bi bi-instagram"></i></a>
                            <a href="#"><i class="bi bi-linkedin"></i></a>
                            <a href="#"><i class="bi bi-github"></i></a>
                        </div>
                    </div>

                    <!-- Coluna 2: Links Rápidos -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="text-white fw-bold mb-3">Navegação</h6>
                        <ul class="list-unstyled footer-links">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Sobre o Sistema</a></li>
                            <li><a href="#">Medicamentos</a></li>
                            <li><a href="#">Relatórios</a></li>
                        </ul>
                    </div>

                    <!-- Coluna 3: Suporte/Privacidade -->
                    <div class="col-lg-2 col-md-6">
                        <h6 class="text-white fw-bold mb-3">Suporte</h6>
                        <ul class="list-unstyled footer-links">
                            <li><a href="#">Ajuda</a></li>
                            <li><a href="#">Privacidade</a></li>
                            <li><a href="#">Termos de Uso</a></li>
                            <li><a href="#">Contato</a></li>
                        </ul>
                    </div>

                   <!-- Contato -->
                    <div class="col-lg-4 col-md-6">
                        <h6 class="text-white fw-bold mb-3">Atendimento</h6>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <i class="bi bi-geo-alt"></i>
                                <span>Av. das Farmácias, 123 - Centro</span>
                            </li>
                            <li class="mb-2">
                                <i class="bi bi-envelope"></i>
                                <span>suporte@farmacos.com.br</span>
                            </li>
                            <li class="mb-2">
                                <i class="bi bi-telephone"></i>
                                <span>(11) 4002-8922</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Barra de Direitos Autorais -->
            <div class="footer-bottom py-3">
                <div class="container text-center">
                    <p class="mb-0 text-footer-muted small">
                        &copy; 2026 Fármacos & Cia. Todos os direitos reservados. 
                        <span class="d-block d-md-inline">Desenvolvido por <strong>João Pedro & Marcus</strong></span>
                    </p>
                </div>
            </div>
        </footer>

        <!-- Modal de Login -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow-lg">
                <!-- Cabeçalho com cor da paleta -->
                <div class="modal-header text-white" style="background-color: #2D6A4F;">
                    <h5 class="modal-title fw-bold" id="loginModalLabel">
                        <i class="bi bi-lock-fill me-2"></i>Acesso Restrito
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body p-4">
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold" style="color: #2D6A4F;">Usuário ou E-mail</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-person text-muted"></i></span>
                                <input type="email" name="email" class="form-control border-start-0 bg-light" id="email" placeholder="nome@exemplo.com">
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="password" class="form-label fw-semibold" style="color: #2D6A4F;">Senha</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-key text-muted"></i></span>
                                <input type="password" name="senha" class="form-control border-start-0 bg-light" id="password" placeholder="Digite sua senha">
                            </div>
                        </div>

                        <button type="submit" class="btn w-100 fw-bold py-2 shadow-sm" style="background-color: #2D6A4F; color: white; transition: 0.3s;">
                            Entrar no Sistema
                        </button>
                    </form>
                </div>
                
                <div class="modal-footer justify-content-center border-0 bg-light">
                    <small class="text-muted">Esqueceu sua senha? <a href="#" class="text-decoration-none" style="color: #2D6A4F;">Clique aqui</a></small>
                </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    </body>
</html>