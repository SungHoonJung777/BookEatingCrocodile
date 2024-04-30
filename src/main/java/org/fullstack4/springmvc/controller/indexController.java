package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.fullstack4.springmvc.mapper.ReviewMapper;
import org.fullstack4.springmvc.service.ProductServiceIf;
import org.fullstack4.springmvc.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/")
@RequiredArgsConstructor
public class indexController {
    private final ProductServiceIf productServiceIf;
    private final ReviewServiceIf reviewServiceIf;
    private ProductMapper productMapper;
    private ReviewMapper reviewMapper;


   /* public void indexRandomList(RedirectAttributes redirectAttributes,
                                BindingResult bindingResult,
                                Model model,
                                @RequestParam(name="pro_idx", defaultValue = "0") int pro_idx) {

        log.info("========================");
        log.info("indexController >> indexRandomList() START");

        if (bindingResult.hasErrors()) {
            log.info("indexController >> indexRandomList Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        List<ProductDTO> productDTOList = productServiceIf.pro_listAll();
        List<ProductDTO> imgRandomList = productServiceIf.indexRandomList();

        model.addAttribute("productList", productDTOList);
        model.addAttribute("imgRandomList", imgRandomList);


        log.info("indexController >> indexRandomList() END");
        log.info("========================");
    }*/
}
