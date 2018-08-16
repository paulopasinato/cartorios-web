package br.com.cartorios.dao;

import br.com.cartorios.model.Cartorio;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * @author Paulo Pasinato
 */

@Repository
@Transactional
public class CartorioDaoImpl implements CartorioDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void save(Cartorio cartorio) {
        em.persist(cartorio);
    }

    @Override
    public void update(Cartorio cartorio) {
        em.merge(cartorio);
    }

    @Override
    public void delete(Long id) {
        em.remove(em.getReference(Cartorio.class, id));
    }

    @Transactional(readOnly = true)
    @Override
    public Cartorio getById(Long id) {
        return em.find(Cartorio.class, id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Cartorio> getListAll() {
        return em.createQuery("select c from Cartorio c", Cartorio.class).getResultList();
    }
}
