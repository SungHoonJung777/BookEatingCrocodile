package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.springmvc.domain.*;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface MemberMapper {
    int regist(MemberVO memberVO);
    int modify(MemberVO memberVO);
    int modifyImage(String member_id, String member_img);

    MemberVO view(String member_id);



    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<CartVO> getCartList(String m_id);

    void cartout(String cart_id);

    MemberVO login_info(String id, String pwd);

    List<QnaVO> getQnaList(String member_id, String qna_category);
    List<OrderVO> getOrderList(String member_id);

    int orderDelete(int order_idx);
    List<ReviewVO> getReviewList(String member_id);
    //아래 결제 정보 저장 부분
    void insertOrder(OrderDTO orderDTO);
    int getorderidx(String member_id);
    void insertOrderDetail(@Param("order_idx") int order_idx, @Param("pro_idx") int pro_idx, @Param("pro_quantity") int pro_quantity);
}
