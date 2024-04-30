package org.fullstack4.springmvc.service.admin;

import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import java.util.ArrayList;
import java.util.List;

public interface AdminService {
    int getMemberCount();
    int getMemberCountKeyword(Criteria cri);
    int getTotalOrder();

    int getProductCount();

    int getQnaAnswer();

    List<MemberDTO> getMemberList(Criteria cri);

    int deleteMember(String member_id);

    List<ProductDTO> getProductList(Criteria cri);
    int getProductCountKeyword(Criteria cri);

    ProductDTO getProductDetail(int idx);

    int productModify(ProductDTO dto);

    int deleteProduct(int idx);

    int insertProduct(ProductDTO dto);


    List<OrderDTO> getOrderList(Criteria cri);

    int getOrderCountKeyword(Criteria cri);

    List<MemberDTO> getDeleveryList(Criteria cri);
    int getDeleveryCountKeyword(Criteria cri);
}
