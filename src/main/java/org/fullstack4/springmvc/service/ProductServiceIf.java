package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.List;

public interface ProductServiceIf {
    List<ProductDTO> pro_listAll();

    ProductDTO pro_view(int pro_idx);

    int productTotalCount(PageRequestDTO requestDTO);

    PageResponseDTO<ProductDTO> productListByPage(PageRequestDTO pageRequestDTO);
}
