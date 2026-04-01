import java.io.Serializable;
import java.time.LocalDate;

public class Medicamento implements Serializable {
    private static int id_atual = 0;

    private int id;
    private String nomeComercial;
    private String principioAtivo;
    private String fabricante;
    private String dosagem;
    private String formaFarmaceutica;
    private String lote;
    private LocalDate dataValidade;
    private String indicacao;

    public Medicamento(){
        this.id = ++id_atual;
    }

    public Medicamento(int id, String nomeComercial, String principioAtivo, String fabricante, String dosagem, String formaFarmaceutica, String lote, LocalDate dataValidade, String indicacao) {
        this.id = id;
        this.nomeComercial = nomeComercial;
        this.principioAtivo = principioAtivo;
        this.fabricante = fabricante;
        this.dosagem = dosagem;
        this.formaFarmaceutica = formaFarmaceutica;
        this.lote = lote;
        this.dataValidade = dataValidade;
        this.indicacao = indicacao;
    }

    public boolean isVencido(){
        if(getDataValidade() == null){
            return false;
        }
        return getDataValidade().isBefore(LocalDate.now());
    }

    public int getId() {
        return id;
    }

    public String getNomeComercial() {
        return nomeComercial;
    }

    public void setNomeComercial(String nomeComercial) {
        this.nomeComercial = nomeComercial;
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

    public String getFormaFarmaceutica() {
        return formaFarmaceutica;
    }

    public void setFormaFarmaceutica(String formaFarmaceutica) {
        this.formaFarmaceutica = formaFarmaceutica;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public LocalDate getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(LocalDate dataValidade) {
        this.dataValidade = dataValidade;
    }

    public String getIndicacao() {
        return indicacao;
    }

    public void setIndicacao(String indicacao) {
        this.indicacao = indicacao;
    }
}
