// Redireciona se não estiver logado
if (!estaLogado()) {
    window.location.href = 'login.html?msg=requer_login';
}

document.getElementById('formCadastrar').addEventListener('submit', async function (e) {
    e.preventDefault();

    const alertaSucesso = document.getElementById('alertaSucesso');
    const alertaErro    = document.getElementById('alertaErro');
    alertaSucesso.classList.add('d-none');
    alertaErro.classList.add('d-none');

    try {
        const res = await fetch(`${API_BASE}/cadastrar`, {
            method: 'POST',
            credentials: 'include',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams(new FormData(this))
        });

        const json = await res.json();

        if (res.status === 401) { tratarNaoAutorizado(); return; }

        if (res.status === 400) {
            alertaErro.classList.remove('d-none');
            const lista = (json.problemas || []).map(p => `<li>${p}</li>`).join('');
            alertaErro.innerHTML = `<strong>${json.mensagem}</strong><ul class="mb-0 mt-2">${lista}</ul>`;
            return;
        }

        if (res.ok) {
            alertaSucesso.classList.remove('d-none');
            alertaSucesso.textContent = json.mensagem;
            this.reset();
        }

    } catch (err) {
        alertaErro.classList.remove('d-none');
        alertaErro.textContent = 'Erro de comunicação com o servidor.';
    }
});