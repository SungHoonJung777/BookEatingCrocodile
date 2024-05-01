package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.mapper.MemberMapper;
import org.fullstack4.springmvc.mapper.QnaMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{

    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;
    private final QnaMapper qnaMapper;
    @Override
    public int regist(MemberDTO memberDTO) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> regist(memberDTO) : " + memberDTO.toString());

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.regist(memberVO);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> registResult : " + result);
        log.info("========================================================");

        return result;
    }

    @Override
    public MemberDTO view(String member_id) {
        MemberVO memberVO = memberMapper.view(member_id);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        return memberDTO;
    }



    @Override
    public int modify(MemberDTO memberDTO) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> modify(bbsDTO) : " + memberDTO.toString());

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.modify(memberVO);

        log.info("MemberServiceImpl >> bbsVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> modifyResult : " + result);
        log.info("========================================================");

        return result;
    }

    @Override
    public int modifyImage(String member_id, String member_img) {
        int result = memberMapper.modifyImage(member_id, member_img);
        return result;
    }

    @Override
    public int delete(String member_id) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> delete(idx) : " + member_id);


        int result = memberMapper.delete(member_id);

        log.info("MemberServiceImpl >> deleteResult : " + result);
        log.info("========================================================");
        return result;
    }

    @Override
    public int getEmailCount(String email) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> getEmailCount(email) : " + email);

        int result = memberMapper.getEmailCount(email);

        log.info("========================================================");
        return result;
    }

    @Override
    public int getIdCount(String member_id) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> getOneByUserId(email) : " + member_id);

        int result = memberMapper.getIdCount(member_id);

        log.info("========================================================");
        return result;
    }

    @Override
    public List<CartDTO> getCartList(String m_id){
        List<CartDTO> cartList = memberMapper.getCartList(m_id).stream()
                .map(vo->modelMapper.map(vo, CartDTO.class))
                .collect(Collectors.toList());
        log.info("m_id : "+m_id);
        log.info("cartList : "+cartList);
        return cartList;
    }

    @Override
    public void cartout(String cart_id){
        memberMapper.cartout(cart_id);
    }
    @Override
    public PageResponseDTO<QnaDTO> getQnaList(String member_id, String qna_category,PageRequestDTO pageRequestDTO) {
        List<QnaDTO> qnaList = memberMapper.getQnaList(member_id, qna_category,pageRequestDTO).stream()
                .map(vo->modelMapper.map(vo, QnaDTO.class))
                .collect(Collectors.toList());

        int total_count = qnaMapper.totalQna(member_id, qna_category, pageRequestDTO);

        log.info("impl qnaList : "+qnaList);

        PageResponseDTO<QnaDTO> responseDTO = PageResponseDTO.<QnaDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(qnaList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public List<OrderDTO> getOrderList(String member_id) {
        List<OrderDTO> orderList = memberMapper.getOrderList(member_id).stream()
                .map(vo->modelMapper.map(vo, OrderDTO.class))
                .collect(Collectors.toList());
        log.info("impl orderList : "+orderList);
        return orderList;
    }

    @Override
    public int orderDelete(int order_idx) {
        int result = memberMapper.orderDelete(order_idx);
        return result;
    }

    @Override
    public List<ReviewDTO> getReviewList(String member_id) {
        List<ReviewDTO> reviewList = memberMapper.getReviewList(member_id);
        return reviewList;
    }

    @Override
    public void checkout(int cart_idx) {

    }
    @Override
    public void insertOrder(OrderDTO orderDTO){
        memberMapper.insertOrder(orderDTO);
    }
    @Override
    public int getorderidx(String member_id){
        int result = memberMapper.getorderidx(member_id);
        return result;
    }
    @Override
    public void insertOrderDetail(int order_idx, int pro_idx, int pro_quantity){
        memberMapper.insertOrderDetail(order_idx, pro_idx, pro_quantity);
    }


}