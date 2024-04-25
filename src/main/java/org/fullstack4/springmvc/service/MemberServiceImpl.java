package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
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

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.regist(memberVO);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> registResult : " + result);
        log.info("========================================================");

        return result;
    }

    @Override
    public MemberDTO view(String user_id) {
        MemberVO memberVO = memberMapper.view(user_id);
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
    public int delete(String user_id) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> delete(idx) : " + user_id);


        int result = memberMapper.delete(user_id);

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
    public int getIdCount(String user_id) {
        log.info("========================================================");
        log.info("MemberServiceImpl >> getOneByUserId(email) : " + user_id);

        int result = memberMapper.getIdCount(user_id);

        log.info("========================================================");
        return result;
    }


}