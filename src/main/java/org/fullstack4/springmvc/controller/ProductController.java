package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.fullstack4.springmvc.service.ProductServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductServiceIf productServiceIf;

    private ProductMapper productMapper;

    @GetMapping("/main")
    public void pro_list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     RedirectAttributes redirectAttributes,
                     Model model) {
        log.info("========================");
        log.info("ProductController >> list() START");


/*        if (bindingResult.hasErrors()) {
            log.info("ProductController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }*/


        PageResponseDTO<ProductDTO> responseDTO = productServiceIf.productListByPage(pageRequestDTO);
        log.info("responseDTO : " + responseDTO.toString());

        List<ProductDTO> productDTOList = productServiceIf.pro_listAll();


        for(int i = 0; i< responseDTO.getDtoList().size(); i++){
            String sub = responseDTO.getDtoList().get(i).getPro_content().substring(0,40);
            responseDTO.getDtoList().get(i).setPro_content(sub);

        }

        model.addAttribute("productList", productDTOList);
        model.addAttribute("responseDTO", responseDTO);


        log.info("ProductController >> list() END");
        log.info("========================");

    }

    @GetMapping("/view")
    public void pro_view(@RequestParam(name="pro_idx", defaultValue = "0") int pro_idx,
                     Model model ) {
        log.info("========================");
        log.info("ProductController >> view()");
        log.info("pro_idx : " + pro_idx);


        ProductDTO  productDTO = productServiceIf.pro_view(pro_idx);

        model.addAttribute("pro_idx", pro_idx);
        model.addAttribute("product", productDTO);

        log.info("productDTO : " +productDTO);

        log.info("========================");



    }

}
