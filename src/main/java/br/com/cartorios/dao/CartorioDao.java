package br.com.cartorios.dao;

import br.com.cartorios.model.Cartorio;

import java.util.List;

/**
 * @author Paulo Pasinato
 */

public interface CartorioDao {

    void save(Cartorio usuario);

    void update(Cartorio usuario);

    void delete(Long id);

    Cartorio getById(Long id);

    List<Cartorio> getListAll();
}
