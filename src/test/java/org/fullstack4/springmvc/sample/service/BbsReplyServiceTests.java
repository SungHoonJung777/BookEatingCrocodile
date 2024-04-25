package org.fullstack4.springmvc.sample.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class) // 스프링한테 테스트 위임 2. 그 결과로 스프링이 처리
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml") // root-context로 해석하는데 사용. 1. 결과 해석하는데 사용
public class BbsReplyServiceTests {
    @Autowired
    private BbsReplyServiceIf bbsReplyServiceIf;

    @Test // 매개변수 x, public void
    public void testReplyRegist() {
        BbsReplyDTO bbsReplyDTO = BbsReplyDTO.builder()
                .bbs_idx(51)
                .user_id("test")
                .title("제목 댓글 테스트")
//                .user_id(null) -> AOP 에서 막아줌
//                .title(null)
                .build();
        int result = bbsReplyServiceIf.reply_regist(bbsReplyDTO);
    }


}
