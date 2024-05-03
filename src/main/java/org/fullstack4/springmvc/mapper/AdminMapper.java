package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.domain.OrderVO;
import org.fullstack4.springmvc.domain.ProductVO;

import java.util.List;

public interface AdminMapper {
    int getMemberCount();
    int getTotalOrder();
    int getMemberCountKeyword(Criteria cri);
    int getProductCount();

    int getQnaAnswer();

    List<MemberVO> getMemberList(Criteria criteria);

    int deleteMember(String member_Id);
    List<ProductVO> getProductList(Criteria criteria);

    int getProductCountKeyword(Criteria cri);

    ProductVO getProductDetail(int idx);

    int productModify(ProductVO vo);

    int deleteProduct(int idx);

    int insertProduct(ProductVO vo);

    List<OrderVO> getOrderList(Criteria cri);

    int getOrderCountKeyword(Criteria criteria);


    List<MemberVO> getDeleveryList(Criteria cri);
    int getDeleveryCountKeyword(Criteria cri);

    int deliveryRegist(String member_id, int idx);
}
