package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;


@Log4j2
@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginServiceIf{

    private final LoginMapper loginXmlMapper;
    private final ModelMapper modelMapper;


    @Override
    public MemberDTO login_info(String id, String pwd) {
        log.info("====================================");
        log.info("LoginServiceImpl >> login_info(id, pwd) : " + id + ", " + pwd);
        MemberVO memberVO = null;
        if (id != null && id != "" && pwd != "" && pwd != null) {
            memberVO = loginXmlMapper.login_info(id, pwd); //쿼리를 날려서 value를 memberVO 객체에 넣는다
            log.info("LoginServiceImpl >> login_info(id, pwd) >> memberVO : " + memberVO.toString());
        }

        MemberDTO memberDTO = null;
        if (memberVO != null && memberVO.getPwd().equals(pwd)) { //db에서 갖고온 객체가 존재할 때만 매핑
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            log.info("LoginServiceImpl >> login_info(id, pwd) >> memberDTO : " + memberDTO.toString());
        }
        log.info("====================================");
        return memberDTO;
    }

    @Override
    public MemberDTO login_cookie(String id) {
        log.info("LoginServiceImpl >> login_cookie(id) : " + id);
        MemberVO memberVO = loginXmlMapper.login_cookie(id);
        MemberDTO memberDTO = null;
        if (memberVO != null) {
             memberDTO = modelMapper.map(memberVO, MemberDTO.class);
        }
        return memberDTO;
    }
}