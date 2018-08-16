package br.com.cartorios.controller;

import br.com.cartorios.dao.CartorioDao;
import br.com.cartorios.model.Cartorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * @author Paulo Pasinato
 */

@Controller
@RequestMapping("/cartorio")
public class CartorioController {

    @Autowired
    CartorioDao cartorioDao;

    @RequestMapping(value = "/todos", method = RequestMethod.GET)
    public ModelAndView listarCartorios(ModelMap model) {
        model.addAttribute("listaCartorios", cartorioDao.getListAll());
        return new ModelAndView("index", model);
    }

    @GetMapping("/cadastro")
    public String cadastro(@ModelAttribute("cartorio") Cartorio cartorio) {
        return "/cartorio/cadastro";
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("cartorio") Cartorio cartorio, BindingResult result, RedirectAttributes attr) {
        if (result.hasErrors()) {
            return "/cartorio/cadastro";
        }
        attr.addFlashAttribute("message", "Registro salvo com sucesso.");
        cartorioDao.save(cartorio);
        return "redirect:/cartorio/todos";
    }

    @GetMapping("/update/{id}")
    public ModelAndView preUpdate(@PathVariable("id") Long id, ModelMap model) {
        Cartorio cartorio = cartorioDao.getById(id);
        model.addAttribute("cartorio", cartorio);
        return new ModelAndView("/cartorio/cadastro", model);
    }

    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("cartorio") Cartorio cartorio, BindingResult result, RedirectAttributes attr) {
        if (result.hasErrors()) {
            return "/cartorio/cadastro";
        }
        cartorioDao.update(cartorio);
        attr.addFlashAttribute("message", "Registro alterado com sucesso.");
        return "redirect:/cartorio/todos";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes attr){
        cartorioDao.delete(id);
        attr.addFlashAttribute("message", "Registro excluído com sucesso.");
        return "redirect:/cartorio/todos";
    }
}
