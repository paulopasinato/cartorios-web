package br.com.cartorios.resource;

import br.com.cartorios.dao.CartorioDao;
import br.com.cartorios.model.Cartorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Paulo Pasinato
 */

@RestController
@RequestMapping("/cartorios")
public class CartorioResource {

    @Autowired
    private CartorioDao cartorioDao;

    @GetMapping(produces = "application/json")
    public @ResponseBody List<Cartorio> listaCartorios(){
        return cartorioDao.getListAll();
    }
}
