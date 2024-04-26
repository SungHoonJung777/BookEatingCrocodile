package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberImageVO;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.MemberImageDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.MemberImageMapper;
import org.fullstack4.springmvc.mapper.MemberMapper;
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
    @Override
    public int regist(MemberDTO memberDTO) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> regist(memberDTO) : " + memberDTO.toString());
        memberDTO.setMileage(5000);
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());

        int result = memberMapper.regist(memberVO);
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
    public List<ProductDTO> getCartList(String m_id){
        List<ProductDTO> cartList = memberMapper.getCartList(m_id).stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());
        log.info("m_id : "+m_id);
        log.info("cartList : "+cartList);
        return cartList;
    }

    @Override
    public int idCheck(String memberId) {
        int rResult = memberMapper.idCheck(memberId);

        return rResult;
    }
}