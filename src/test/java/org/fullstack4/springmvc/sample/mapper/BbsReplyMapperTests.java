package org.fullstack4.springmvc.sample.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsReplyVO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.mapper.BbsReplyMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsReplyMapperTests {

    @Autowired(required = false) //생성자 주입을 통해 의존성 주입을 해주세여 -> 스프링은 어떻게 찾았을까? root-context 또는 servlet-context 뒤져서 빈으로 등록된 애들 찾아온것
    private BbsReplyMapper bbsReplyMapper;

    @Test
    public void testBbsReplyRegist() {
        BbsReplyVO bbsReplyVO = BbsReplyVO.builder()
                .bbs_idx(51)
                .user_id("test")
                .title("댓글 테스트")
                .build();

        int result = bbsReplyMapper.reply_regist(bbsReplyVO);
        log.info("=======================================");
        log.info("testBbsReplyRegist : " + result);
        log.info("=======================================");
    }

}
