package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;

import java.util.List;

public interface ProductMapper {

    List<ProductVO> pro_listAll();

    ProductVO pro_view(int pro_idx);

    int productTotalCount(PageRequestDTO requestDTO);

    List<ProductVO> productListByPage(PageRequestDTO pageRequestDTO);

/*    List<ProductVO> indexRandomList();*/

}
