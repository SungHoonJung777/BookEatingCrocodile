package org.fullstack4.springmvc.sample.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.LoginMapper;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class LoginServiceTest {
    @Autowired
    private LoginServiceIf loginServiceIf;


    @Test
    public void testLogin() {
        String user_id = "id1";
        String pwd = "1234";
        MemberDTO dto = loginServiceIf.login_info(user_id, pwd);
        //log.info(dto.toString());
    }
}
