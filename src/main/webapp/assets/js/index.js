// Carrega medicamentos em destaque via GET /listar
(async function () {
    const container  = document.getElementById('cardsMedicamentos');
    const alertaErro = document.getElementById('alertaErro');
    const logado     = estaLogado();

    try {
        const res = await fetch(`${API_BASE}/listar`, { credentials: 'include' });

        if (res.status === 401) { tratarNaoAutorizado(); return; }

        const lista = await res.json();

        const visiveis = lista.filter(m => logado || !isVencido(m.validade));

        if (visiveis.length === 0) {
            container.innerHTML = `
                <div class="col-12 text-center py-5">
                    <i class="bi bi-search text-muted" style="font-size:4rem;"></i>
                    <h4 class="mt-4 text-muted">Nenhum medicamento encontrado</h4>
                    <p class="text-muted">Tente buscar por outro termo ou cadastre novos itens no painel.</p>
                    <a href="index.html" class="btn btn-success rounded-pill mt-3">Limpar Busca</a>
                </div>`;
            return;
        }

        container.innerHTML = visiveis.map(m => criarCard(m)).join('');

    } catch (err) {
        alertaErro.classList.remove('d-none');
        alertaErro.textContent = 'Erro ao carregar medicamentos. Verifique se o backend está em execução.';
        container.innerHTML = '';
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

function criarCard(m) {
    const vencido = isVencido(m.validade);

    const badgeClass = vencido ? 'bg-danger text-white' : (m.promocao ? 'bg-warning text-dark' : 'bg-info text-white');
    const badgeLabel = vencido ? 'VENCIDO' : (m.promocao ? 'PROMOÇÃO' : 'NOVO');

    const icone = (m.forma === 'Solução' || m.forma === 'Injetável')
        ? 'bi-droplet-half text-primary'
        : 'bi-capsule text-success';
    const validadeClass = vencido ? 'text-danger fw-bold' : '';

    return `
    <div class="col">
        <div class="card h-100 border-0 shadow-sm custom-card">
            <div class="card-badge ${badgeClass} px-3 py-1 fw-bold">${badgeLabel}</div>
            <div class="card-body p-4 text-center">
                <div class="mb-3">
                    <i class="bi ${icone}" style="font-size:3.5rem;"></i>
                </div>
                <h5 class="card-title fw-bold text-dark mb-1">${m.nome}</h5>
                <p class="text-muted small mb-3">${m.principioAtivo}</p>
                <div class="d-flex justify-content-center gap-2 mb-4">
                    <span class="badge rounded-pill text-success" style="background-color:#D8F3DC; font-size:0.85rem;">${m.forma}</span>
                    <span class="badge rounded-pill text-secondary bg-light border" style="font-size:0.85rem;">Lote: ${m.lote}</span>
                </div>
                <ul class="list-unstyled text-start small mb-4 p-3 rounded-3" style="background-color:#f8f9fa;">
                    <li class="mb-2">
                        <i class="bi bi-building text-success me-2"></i>
                        <strong>Fabricante:</strong> ${m.fabricante}
                    </li>
                    <li>
                        <i class="bi bi-calendar-check text-success me-2"></i>
                        <strong>Validade:</strong>
                        <span class="${validadeClass}">${validadeFormatada(m.validade)}</span>
                    </li>
                </ul>
                <a href="detalhes.html?id=${m.id}" class="btn btn-primary-custom w-100 py-2 rounded-pill fw-bold shadow-sm">
                    Ver Detalhes Técnicos
                </a>
            </div>
        </div>
    </div>`;
}