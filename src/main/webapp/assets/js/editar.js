if (!estaLogado()) {
    window.location.href = 'login.html?msg=requer_login';
}

(async function () {
    const div = document.getElementById('conteudoForm');
    const id  = new URLSearchParams(window.location.search).get('id');

    if (!id) {
        div.innerHTML = `<div class="alert alert-danger">ID não informado na URL.</div>`;
        return;
    }

    try {
        const res = await fetch(`${API_BASE}/detalhes?id=${id}`, { credentials: 'include' });
        if (res.status === 401) { tratarNaoAutorizado(); return; }
        if (res.status === 404) {
            div.innerHTML = `<div class="alert alert-warning">Medicamento não encontrado.</div>`;
            return;
        }

        const m = await res.json();
        div.innerHTML = renderForm(m);

        document.getElementById('formEditar').addEventListener('submit', async function (e) {
            e.preventDefault();
            await salvar(new URLSearchParams(new FormData(this)));
        });

    } catch (err) {
        div.innerHTML = `<div class="alert alert-danger">Erro ao carregar dados. Verifique o backend.</div>`;
    }
})();

function renderForm(m) {

    const formas = ['Comprimido', 'Cápsula', 'Solução'];
    const opcoesForma = formas.map(f =>
        `<option value="${f}" ${m.forma === f ? 'selected' : ''}>${f}</option>`
    ).join('');

    return `
    <form id="formEditar">
        <input type="hidden" name="id" value="${m.id}">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="fw-bold">Nome Comercial</label>
                <input type="text" name="nome" class="form-control" value="${m.nome}" required>
            </div>
            <div class="col-md-6">
                <label class="fw-bold">Princípio Ativo</label>
                <input type="text" name="principioAtivo" class="form-control" value="${m.principioAtivo}" required>
            </div>
            <div class="col-md-4">
                <label class="fw-bold">Fabricante</label>
                <input type="text" name="fabricante" class="form-control" value="${m.fabricante}" required>
            </div>
            <div class="col-md-4">
                <label class="fw-bold">Dosagem</label>
                <input type="text" name="dosagem" class="form-control" value="${m.dosagem}" required>
            </div>
            <div class="col-md-4">
                <label class="fw-bold">Forma</label>
                <select name="forma" class="form-select">${opcoesForma}</select>
            </div>
            <div class="col-md-4">
                <label class="fw-bold">Lote</label>
                <input type="text" name="lote" class="form-control" value="${m.lote}" required>
            </div>
            <div class="col-md-4">
                <label class="fw-bold">Validade</label>
                <input type="date" name="validade" class="form-control" value="${m.validade}" required>
            </div>
            <div class="col-12">
                <label class="fw-bold">Indicação</label>
                <textarea name="indicacao" class="form-control" rows="3">${m.indicacao || ''}</textarea>
            </div>
            <div class="col-12 d-flex gap-2 mt-4">
                <button type="submit" class="btn px-5 rounded-pill fw-bold text-white" style="background-color:#0c795a;">
                    Salvar Alterações
                </button>
                <a href="listar.html" class="btn btn-outline-secondary px-5 rounded-pill">Cancelar</a>
            </div>
        </div>
    </form>`;
}

async function salvar(dados) {
    const alertaSucesso = document.getElementById('alertaSucesso');
    const alertaErro    = document.getElementById('alertaErro');
    alertaSucesso.classList.add('d-none');
    alertaErro.classList.add('d-none');

    try {
        const res = await fetch(`${API_BASE}/editar`, {
            method: 'POST',
            credentials: 'include',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: dados
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
            setTimeout(() => { window.location.href = 'listar.html'; }, 1500);
        }

    } catch (err) {
        alertaErro.classList.remove('d-none');
        alertaErro.textContent = 'Erro de comunicação com o servidor.';
    }
}