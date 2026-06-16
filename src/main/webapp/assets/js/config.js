const API_BASE = 'http://localhost:8080/ProjetoARQWEB1_JavaServlet';

function estaLogado() {
    return sessionStorage.getItem('usuarioLogado') !== null;
}

function getLoginUsuario() {
    return sessionStorage.getItem('usuarioLogado') || '';
}

function tratarNaoAutorizado() {
    sessionStorage.removeItem('usuarioLogado');
    window.location.href = 'login.html?msg=sessao_expirada';
}