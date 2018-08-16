package br.com.cartorios.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Paulo Pasinato
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String showHomepage() {
        return "redirect:/cartorio/todos";
    }
}
