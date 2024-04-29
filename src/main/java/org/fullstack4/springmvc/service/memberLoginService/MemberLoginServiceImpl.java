package org.fullstack4.springmvc.service.memberLoginService;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.memberLogin.MemberLoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j2
public class MemberLoginServiceImpl implements MemberLoginService{
    @Autowired
    private MemberLoginMapper memberLoginMapper;
    @Autowired
    private  ModelMapper modelMapper;


    @Override
    public MemberDTO login_info(String id, String pwd) {
        log.info("====================================");
        log.info("MemberLoginServiceImpl >> login_info(id, pwd) : " + id + ", " + pwd);
        MemberVO memberVO = null;
        if (id != null && id != "" && pwd != "" && pwd != null) {
            System.out.println("#####"+ id + pwd);
            memberVO = memberLoginMapper.login_info(id, pwd);

        }

        MemberDTO memberDTO = null;
        if (memberVO != null && memberVO.getMember_pwd().equals(pwd)) {
            memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            log.info("====================================");
            return memberDTO;
        } else {
            return null;
        }

    }

    @Override
    public int pwdFind(String member_id, String member_email, String member_phone) {
        int result = memberLoginMapper.pwdFind(member_id,member_email,member_phone);

        System.out.println(member_id + "member" + member_email +"email" + member_phone);


        System.out.println(result+"result :: ");
        return result;
    }

    @Override
    public int pwdChange(String member_id, int checkNum) {
        int uResult = memberLoginMapper.pwdChange(member_id,  checkNum);

        return uResult;
    }
}
