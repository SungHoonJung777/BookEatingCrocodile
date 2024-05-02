package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.fullstack4.springmvc.mapper.ReviewMapper;
import org.fullstack4.springmvc.service.ProductServiceIf;
import org.fullstack4.springmvc.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
public class indexController {
    private final ProductServiceIf productServiceIf;
    private final ReviewServiceIf reviewServiceIf;
    private ProductMapper productMapper;
    private ReviewMapper reviewMapper;

    @RequestMapping(value = "/")
    public String indexList(PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model,
                            @RequestParam(name="pro_idx", defaultValue = "0") int pro_idx) {

        log.info("========================");
        log.info("indexController >> indexNewList() START");

     /*   if (bindingResult.hasErrors()) {
            log.info("indexController >> indexRandomList Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }*/

        // 전체 상품 목록 조회
        List<ProductDTO> productDTOList = productServiceIf.pro_listAll();
        List<ProductDTO> indexNewList = productServiceIf.indexNewList();
        List<ProductDTO> indexPopularList = productServiceIf.indexPopularList();

        for(int i = 0; i < indexNewList.size(); i++){
            String sub = indexNewList.get(i).getPro_content().substring(0,40);
            indexNewList.get(i).setPro_content(sub);
        }

        for(int i = 0; i < indexPopularList.size(); i++){
            String sub = indexPopularList.get(i).getPro_content().substring(0,40);
            indexPopularList.get(i).setPro_content(sub);
        }

        //페이징
        PageResponseDTO<ProductDTO> responseDTO = productServiceIf.productListByPage(pageRequestDTO);

        log.info("search_word : " + responseDTO.getSearch_word());


        model.addAttribute("productList", productDTOList);
        model.addAttribute("indexNewList", indexNewList);
        model.addAttribute("indexPopularList", indexPopularList);
        model.addAttribute("responseDTO", responseDTO);


        log.info("indexNewList : " + indexNewList);
        log.info("indexPopularList : " + indexPopularList);

        log.info("indexController >> indexList() END");
        log.info("========================");

        return "index";
    }

}
