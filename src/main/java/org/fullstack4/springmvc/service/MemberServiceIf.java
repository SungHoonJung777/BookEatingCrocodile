package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.domain.MemberImageVO;
import org.fullstack4.springmvc.domain.ReviewVO;
import org.fullstack4.springmvc.dto.*;

import java.util.List;

public interface MemberServiceIf {
    int regist(MemberDTO memberDTO);

    MemberDTO view(String member_id);


    int modify(MemberDTO memberDTO);
    int modifyImage(String member_id, String member_img);

    int delete(String member_id);

    int getEmailCount(String email);
    int getIdCount(String nickname);

    List<CartDTO> getCartList(String m_id);

    void cartout(String cart_id);

    List<QnaDTO> getQnaList(String member_id, String qna_category);
    List<OrderDTO> getOrderList(String member_id);
    int orderDelete(int order_idx);
    List<ReviewDTO> getReviewList(String member_id);

    void checkout(int cart_idx);

    void insertOrder(OrderDTO orderDTO);
    int getorderidx(String member_id);
    void insertOrderDetail(int order_idx, int pro_idx, int pro_quantity);
}
