package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.domain.ReviewVO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.fullstack4.springmvc.mapper.ReviewMapper;
import org.fullstack4.springmvc.service.ProductServiceIf;
import org.fullstack4.springmvc.service.ReviewServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/product")
@RequiredArgsConstructor
public class ProductController {
    private final ProductServiceIf productServiceIf;
    private final ReviewServiceIf reviewServiceIf;
    private ProductMapper productMapper;
    private ReviewMapper reviewMapper;

    @GetMapping("/main")
    public void pro_list(@Valid PageRequestDTO pageRequestDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         Model model,
                         @RequestParam(name="pro_idx", defaultValue = "0") int pro_idx,
                         @RequestParam(name = "pro_category1", defaultValue = "") String pro_category1,
                         @RequestParam(name = "pro_category2", defaultValue = "") String pro_category2,
                         @RequestParam(name = "pro_category3", defaultValue = "") String pro_category3,
                         @RequestParam(name = "sortMethod", defaultValue = "") String sortMethod,
                         @RequestParam(name = "search_word", defaultValue = "") String search_word
          /*               @RequestParam(name = "page_block_start", defaultValue = "") int page_block_start,
                         @RequestParam(name = "page_block_end", defaultValue = "") int page_block_end,
                         @RequestParam(name = "page", defaultValue = "") int page*/


    ) {
        log.info("========================");
        log.info("ProductController >> list() START");

        if (bindingResult.hasErrors()) {
            log.info("ProductController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        String sortField = "pro_reg_date";
        String sortDir = "desc";

        log.info("sortMethod :"+sortMethod);
        if(sortMethod != null && !sortMethod.isEmpty()) {
            sortField = sortMethod.substring(0, sortMethod.indexOf("||"));
            sortDir = sortMethod.substring(sortMethod.indexOf("||")).replace("||", "");
        }

        // 카테고리 정보를 PageRequestDTO에 설정
        pageRequestDTO.setPro_category1(pro_category1);
        pageRequestDTO.setPro_category2(pro_category2);
        pageRequestDTO.setPro_category3(pro_category3);


        // 정렬 정보를 PageRequestDTO에 설정
        pageRequestDTO.setSortField(sortField);
        pageRequestDTO.setSortDir(sortDir);

        // 검색어 정보를 PageRequestDTO에 설정
        pageRequestDTO.setSearch_word(search_word);

  /*      pageRequestDTO.setPage_block_start(page_block_start);
        pageRequestDTO.setPage(page);
        pageRequestDTO.setPage_block_end(page_block_end);*/


        log.info("pageRequestDTO : "+pageRequestDTO.toString());
        //페이징
        PageResponseDTO<ProductDTO> responseDTO = productServiceIf.productListByPage(pageRequestDTO);

        // 전체 상품 목록 조회
        List<ProductDTO> productDTOList = productServiceIf.pro_listAll();


        for(int i = 0; i < responseDTO.getDtoList().size(); i++){
            String sub = responseDTO.getDtoList().get(i).getPro_content().substring(0,40);
            responseDTO.getDtoList().get(i).setPro_content(sub);
        }



        model.addAttribute("productList", productDTOList);
        model.addAttribute("responseDTO", responseDTO);
        model.addAttribute("search_word", search_word);


        log.info("ProductController >> list() END");
        log.info("========================");
    }

    @GetMapping("/view")
    public void pro_view(@RequestParam(name="pro_idx", defaultValue = "0") int pro_idx,
                         Model model ) {
        log.info("========================");
        log.info("ProductController >> view()");
        log.info("pro_idx : " + pro_idx);

        String pro_content = "";

        ProductDTO productDTO = productServiceIf.pro_view(pro_idx);

        List<ReviewVO> reviewVOList = reviewServiceIf.review_list(pro_idx);

        int review_star_avg = reviewServiceIf.review_star_avg(pro_idx);

        pro_content = productDTO.getPro_content();
        pro_content = (pro_content != null ? pro_content.replace("\r\n", "<br>") : "");
        pro_content = (pro_content != null ? pro_content.replace(" ", "&nbsp;") : "");

        model.addAttribute("pro_idx", pro_idx);
        model.addAttribute("product", productDTO);
        model.addAttribute("pro_content", pro_content);

        model.addAttribute("reviewVO", reviewVOList);

        model.addAttribute("review_star_avg", review_star_avg);

        log.info("review_star_avg" +review_star_avg);

        log.info("productDTO : " +productDTO);

        log.info("reviewVO : " +reviewVOList);
        log.info("========================");



    }


    @PostMapping("/view")
    public String pro_view_POST(@Valid ReviewDTO reviewDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes) {

        log.info("==========================");
        log.info("ProductController >> pro_view_POST()");

        log.info("reviewDTO : "+ reviewDTO.toString()) ;
        redirectAttributes.addFlashAttribute("pro_idx", reviewDTO.getPro_idx());

        int result = reviewServiceIf.review_regist(reviewDTO);


        if(result > 0) {
            return "redirect:/product/view?pro_idx="+reviewDTO.getPro_idx();
        } else {
            return "product/view?pro_idx=" + reviewDTO.getPro_idx();
        }
    }

    @PostMapping("/reviewDelete")
    public String delete_POST(@RequestParam(name = "review_idx", defaultValue = "0") int review_idx,
                              Model model,
                              @Valid ReviewDTO reviewDTO,
                              RedirectAttributes redirectAttributes) {

        redirectAttributes.addFlashAttribute("pro_idx", reviewDTO.getPro_idx());

        int result = reviewServiceIf.review_delete(review_idx);

        if(result > 0) {
            return "redirect:/product/view?pro_idx="+reviewDTO.getPro_idx();
        } else {
            return "product/view?pro_idx="+reviewDTO.getPro_idx();
        }
    }

}
