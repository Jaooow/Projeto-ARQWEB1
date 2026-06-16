// Renderiza o menu e a área de login da navbar conforme estado de autenticação
function renderizarNav() {
    const menuNav   = document.getElementById('menuNav');
    const areaLogin = document.getElementById('areaLogin');
    if (!menuNav || !areaLogin) return;

    if (estaLogado()) {
        menuNav.innerHTML += `
            <li class="nav-item">
                <a class="nav-link" href="cadastrar.html">Adicionar Medicamento</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listar.html">Meus Medicamentos</a>
            </li>`;

        areaLogin.innerHTML = `
            <span class="text-white">Olá, <strong>${getLoginUsuario()}</strong></span>
            <button class="btn btn-outline-light btn-sm" id="btnLogout">Logout</button>`;

        document.getElementById('btnLogout').addEventListener('click', fazerLogout);
    } else {
        areaLogin.innerHTML = `
            <a href="login.html" class="btn-login-icon">
                <i class="bi bi-person-circle"></i>
                <span class="d-lg-none ms-2">Login</span>
            </a>`;
    }
}

async function fazerLogout() {
    try {
        await fetch(`${API_BASE}/logout`, { method: 'POST', credentials: 'include' });
    } catch (e) { }
    sessionStorage.removeItem('usuarioLogado');
    window.location.href = 'index.html';
}

renderizarNav();