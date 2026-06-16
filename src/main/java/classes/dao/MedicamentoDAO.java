package classes.dao;

import classes.model.Medicamento;

import java.util.*;

public interface MedicamentoDAO {

    Medicamento inserir(Medicamento medicamento);

    List<Medicamento> listar();

    Medicamento buscarPorId(int id);

    Medicamento atualizar(Medicamento medicamento);

    boolean remover(int id);

}