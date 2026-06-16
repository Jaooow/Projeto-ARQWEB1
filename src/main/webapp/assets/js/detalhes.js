(async function () {
    const conteudo = document.getElementById('conteudo');
    const id       = new URLSearchParams(window.location.search).get('id');
    const logado   = estaLogado();

    if (!id) {
        conteudo.innerHTML = `<div class="alert alert-danger">ID não informado na URL.</div>`;
        return;
    }

    try {
        const res = await fetch(`${API_BASE}/detalhes?id=${id}`, { credentials: 'include' });
        if (res.status === 401) { tratarNaoAutorizado(); return; }
        if (res.status === 404) {
            conteudo.innerHTML = `<div class="alert alert-warning">Medicamento não encontrado.</div>`;
            return;
        }

        const m = await res.json();
        conteudo.innerHTML = renderDetalhe(m, logado);

        const btnExcluir = document.getElementById('btnExcluir');
        if (btnExcluir) {
            btnExcluir.addEventListener('click', async () => {
                if (!confirm('Tem certeza que deseja remover este medicamento?')) return;
                await excluir(m.id);
            });
        }
    } catch (err) {
        conteudo.innerHTML = `<div class="alert alert-danger">Erro ao carregar. Verifique o backend.</div>`;
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

function renderDetalhe(m, logado) {
    const vencido = isVencido(m.validade);
    const icone   = (m.forma === 'Solução' || m.forma === 'Injetável')
        ? 'bi-droplet-half text-primary' : 'bi-capsule-pill text-success';

    // Botões de editar/excluir só para logado
    const acoesAdmin = logado ? `
        <div class="mt-5 pt-3 d-flex gap-2 border-top">
            <a href="editar.html?id=${m.id}" class="btn btn-warning rounded-pill px-4 fw-bold shadow-sm">
                <i class="bi bi-pencil-square me-2"></i>Editar Dados
            </a>
            <button id="btnExcluir" class="btn btn-outline-danger rounded-pill px-4 fw-bold"
                    onclick="return confirm('Tem certeza que deseja remover?')">
                <i class="bi bi-trash me-2"></i>Remover
            </button>
        </div>` : '';

    return `
    <div class="row g-4">
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm text-center p-4 rounded-4 h-100">
                <div class="py-5">
                    <i class="bi ${icone}" style="font-size:6rem;"></i>
                </div>
                <h3 class="fw-bold" style="color:#0c795a;">${m.nome}</h3>
                <p class="text-muted">${m.principioAtivo}</p>
                <span class="badge rounded-pill px-4 py-2 mb-3"
                      style="background-color:#D8F3DC; color:#0c795a; font-size:1rem;">${m.forma}</span>
                <div class="mt-auto">
                    <p class="small text-muted mb-1">Data de validade:</p>
                    <p class="small fw-bold">${validadeFormatada(m.validade)}</p>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-body p-4 p-md-5">
                    <h4 class="fw-bold mb-4" style="color:#0c795a;">Especificações Técnicas</h4>
                    <div class="row g-4">
                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Fabricante</label>
                            <p class="fs-5 mb-0">${m.fabricante}</p>
                        </div>
                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Dosagem</label>
                            <p class="fs-5 mb-0">${m.dosagem}</p>
                        </div>
                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Lote</label>
                            <p class="fs-5 mb-0">${m.lote}</p>
                        </div>
                        <div class="col-md-6 border-bottom pb-3">
                            <label class="text-muted small text-uppercase fw-bold">Data de Validade</label>
                            <p class="fs-5 mb-0 ${vencido ? 'text-danger fw-bold' : ''}">${validadeFormatada(m.validade)}</p>
                        </div>
                        <div class="col-12 mt-4">
                            <label class="text-muted small text-uppercase fw-bold">Indicação</label>
                            <div class="p-3 rounded-3 mt-2" style="background-color:#f8f9fa; border-left:4px solid #0c795a;">
                                <p class="mb-0">${m.indicacao || 'Não informada'}</p>
                            </div>
                        </div>
                    </div>
                    ${acoesAdmin}
                </div>
            </div>
        </div>
    </div>`;
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
        const json = await res.json();
        alert(json.mensagem);
        window.location.href = 'listar.html';
    } catch (err) {
        alert('Erro ao excluir medicamento.');
    }
}