if (estaLogado()) {
    window.location.href = 'index.html';
}

// Exibe mensagem se veio redirecionado de uma página protegida
(function () {
    const msg    = new URLSearchParams(window.location.search).get('msg');
    const alerta = document.getElementById('alertaInfo');
    if (!alerta) return;
    if (msg === 'sessao_expirada') {
        alerta.classList.remove('d-none');
        alerta.textContent = 'Sua sessão expirou. Por favor, faça login novamente.';
    } else if (msg === 'requer_login') {
        alerta.classList.remove('d-none');
        alerta.textContent = 'Você precisa estar logado para acessar essa página.';
    }
})();

document.getElementById('formLogin').addEventListener('submit', async function (e) {
    e.preventDefault();

    const alertaErro = document.getElementById('alertaErro');
    alertaErro.classList.add('d-none');

    try {
        const res = await fetch(`${API_BASE}/login`, {
            method: 'POST',
            credentials: 'include',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams(new FormData(this))
        });

        const json = await res.json();

        if (res.ok) {
            sessionStorage.setItem('usuarioLogado', json.login);
            window.location.href = 'index.html';
        } else {
            alertaErro.classList.remove('d-none');
            alertaErro.textContent = json.mensagem || 'Credenciais inválidas.';
        }

    } catch (err) {
        alertaErro.classList.remove('d-none');
        alertaErro.textContent = 'Erro de comunicação com o servidor.';
    }
});