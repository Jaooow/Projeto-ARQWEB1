(async function () {
    const tbody      = document.getElementById('tabelaBody');
    const alertaErro = document.getElementById('alertaErro');
    const btnNovo    = document.getElementById('btnNovo');
    const logado     = estaLogado();

    if (logado && btnNovo) btnNovo.classList.remove('d-none');

    try {
        const res = await fetch(`${API_BASE}/listar`, { credentials: 'include' });
        if (res.status === 401) { tratarNaoAutorizado(); return; }

        const lista = await res.json();

        if (!lista || lista.length === 0) {
            tbody.innerHTML = `<tr><td colspan="6" class="text-center py-4 text-muted">Nenhum medicamento cadastrado.</td></tr>`;
            return;
        }

        tbody.innerHTML = lista.map(m => criarLinha(m, logado)).join('');

        document.querySelectorAll('.btn-excluir').forEach(btn => {
            btn.addEventListener('click', async (e) => {
                const id = e.currentTarget.dataset.id;
                if (!confirm('Tem certeza que deseja excluir?')) return;
                await excluir(id);
            });
        });

    } catch (err) {
        alertaErro.classList.remove('d-none');
        alertaErro.textContent = 'Erro ao carregar. Verifique se o backend está em execução.';
        tbody.innerHTML = '';
    }
})();

function isVencido(validade) {
    if (!validade) return false;
    return new Date(validade + 'T00:00:00') < new Date();
}

function validadeFormatada(validade) {
    if (!validade) return '';
    const [ano, mes, dia] = validade.split('-');
    return `${dia}/${mes}/${ano}`;
}

function criarLinha(m, logado) {
    const vencido = isVencido(m.validade);
    const badgeValidade = `<span class="badge ${vencido ? 'bg-danger' : 'bg-light text-dark border'}">${validadeFormatada(m.validade)}</span>`;

    // Botões de editar/excluir só aparecem para logado
    const botoesAdmin = logado ? `
        <a href="editar.html?id=${m.id}" class="btn btn-sm btn-outline-warning border-0 rounded-circle me-1" title="Editar">
            <i class="bi bi-pencil-square"></i>
        </a>
        <button class="btn btn-sm btn-outline-danger border-0 rounded-circle btn-excluir" data-id="${m.id}" title="Excluir">
            <i class="bi bi-trash"></i>
        </button>` : '';

    return `
    <tr>
        <td class="ps-4">
            <div class="fw-bold">${m.nome}</div>
            <small class="text-muted">${m.forma}</small>
        </td>
        <td>${m.fabricante}</td>
        <td>${badgeValidade}</td>
        <td>${m.lote}</td>
        <td>${m.dosagem}</td>
        <td class="text-center">
            <div class="btn-group shadow-sm rounded-pill bg-white p-1">
                <a href="detalhes.html?id=${m.id}" class="btn btn-sm btn-outline-primary border-0 rounded-circle me-1" title="Ver">
                    <i class="bi bi-eye"></i>
                </a>
                ${botoesAdmin}
            </div>
        </td>
    </tr>`;
}

async function excluir(id) {
    try {
        const res = await fetch(`${API_BASE}/excluir`, {
            method: 'POST',
            credentials: 'include',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({ id })
        });
        if (res.status === 401) { tratarNaoAutorizado(); return; }
        window.location.reload();
    } catch (err) {
        alert('Erro ao excluir medicamento.');
    }
}