package org.fullstack4.springmvc.sample.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class) // 스프링한테 테스트 위임 2. 그 결과로 스프링이 처리
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml") // root-context로 해석하는데 사용. 1. 결과 해석하는데 사용
public class MemberServiceTests {
    @Autowired
    private MemberServiceIf memberServiceIf;

//    @Test // 매개변수 x, public void
//    public void testRegist() {
//        BbsDTO bbsDTO = BbsDTO.builder()
//                .user_id("test")
//                .title("제목 테스트")
//                .content("내용 테스트")
//                .display_date("2024-04-18")
//                .read_cnt(0)
//                .build();
//        int result = memberServiceIf.regist(bbsDTO);
//    }

    @Test
    public void testView() {
        String user_id = "id1";
        MemberDTO memberDTO = memberServiceIf.view(user_id);
        log.info(memberDTO.toString());
    }

}
