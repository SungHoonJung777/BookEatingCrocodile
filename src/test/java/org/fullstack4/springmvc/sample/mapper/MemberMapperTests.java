package org.fullstack4.springmvc.sample.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.mapper.BbsMapper;
import org.fullstack4.springmvc.mapper.MemberMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
public class MemberMapperTests {
    @Autowired(required = false)
    //스프링아 우선은 시작하자마자 객체 주입하지 마. 필요할 때 넣을거야
    //초기에는 객체 생성하지 말고 사용할 때 만들어
    private MemberMapper memberMapper;


    @Test
    public void testMemberView() {
        String member_id = "abc01";

        MemberVO memberVO= memberMapper.view(member_id);

        log.info("===============================================");
        log.info("testMemberView memberVO: " + memberVO);
        log.info("===============================================");
    }



}