package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.ProductServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductServiceIf productServiceIf;

    @GetMapping("/main")
    public void list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     RedirectAttributes redirectAttributes,
                     Model model) {
        log.info("========================");
        log.info("ProductController >> list() START");


/*        if (bindingResult.hasErrors()) {
            log.info("ProductController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }*/

        List<ProductDTO> productDTOList = productServiceIf.listAll();
        for(int i=0; i<productDTOList.size();i++){
            String sub = productDTOList.get(i).getPro_content().substring(0,40);
            productDTOList.get(i).setPro_content(sub);
        }
        model.addAttribute("productList", productDTOList);


        log.info("ProductController >> list() END");
        log.info("========================");

    }

}
