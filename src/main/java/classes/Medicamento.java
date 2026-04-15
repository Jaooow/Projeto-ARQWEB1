package classes;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Medicamento implements Serializable {

    private static int idAtual = 0;

    private int id;
    private String nome;
    private String principioAtivo;
    private String fabricante;
    private String dosagem;
    private String forma;
    private String lote;
    private LocalDate validade;
    private String indicacao;

    private boolean promocao;

    // CONSTRUTOR PADRÃO
    public Medicamento() {
        this.id = ++idAtual;
    }

    // CONSTRUTOR PRINCIPAL
    public Medicamento(String nome, String principioAtivo, String fabricante,
                       String lote, String validade, String indicacao,
                       String dosagem, String forma) {
        this();
        this.id = ++idAtual;
        this.nome = nome;
        this.principioAtivo = principioAtivo;
        this.fabricante = fabricante;
        this.lote = lote;
        this.indicacao = indicacao;
        this.dosagem = dosagem;
        this.forma = forma;

        if (validade != null && !validade.isEmpty()) {
            this.validade = LocalDate.parse(validade);
        }
    }

    // Verificacao se está vencido medicamento
    public boolean isVencido() {
        if (validade == null) return false;
        return validade.isBefore(LocalDate.now());
    }

    // GETTERS E SETTERS
    public boolean isPromocao() {
        return promocao;
    }

    public void setPromocao(boolean promocao) {
        this.promocao = promocao;
    }


    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPrincipioAtivo() {
        return principioAtivo;
    }

    public void setPrincipioAtivo(String principioAtivo) {
        this.principioAtivo = principioAtivo;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }

    public String getDosagem() {
        return dosagem;
    }

    public void setDosagem(String dosagem) {
        this.dosagem = dosagem;
    }

    public String getForma() {
        return forma;
    }

    public void setForma(String forma) {
        this.forma = forma;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public LocalDate getValidade() {
        return validade;
    }

    public void setValidade(LocalDate validade) {
        this.validade = validade;
    }

    public String getIndicacao() {
        return indicacao;
    }

    public void setIndicacao(String indicacao) {
        this.indicacao = indicacao;
    }

    public String getValidadeFormatada() {
        if (validade == null) return "";
        return validade.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}