package org.fullstack4.springmvc.sample.service;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class) // 스프링한테 테스트 위임 2. 그 결과로 스프링이 처리
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml") // root-context로 해석하는데 사용. 1. 결과 해석하는데 사용
public class BbsServiceTests {
    @Autowired
    private BbsServiceIf bbsServiceIf;

    @Test // 매개변수 x, public void
    public void testRegist() {
        BbsDTO bbsDTO = BbsDTO.builder()
                .user_id("test")
                .title("제목 테스트")
                .content("내용 테스트")
                .display_date("2024-04-18")
                .read_cnt(0)
                .build();
        int result = bbsServiceIf.regist(bbsDTO);
    }

    @Test
    public void testView() {
        int idx = 10;
        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        log.info(bbsDTO.toString());
    }

    @Test
    public void testBbsTotalCount() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .search_type(new String[]{"t", "u"})
                .search_word("제목")
                .search_date1("2024-04-07")
                .search_date2("2024-04-20")
                .build();

        int total_count = bbsServiceIf.bbsTotalCount(pageRequestDTO);

        log.info("===============================================");
        log.info("BbsServiceTests >> testBbsTotalCount : " + total_count);
        log.info("===============================================");
    }

    @Test
    public void testbbsListByPage() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .search_type(new String[]{"t", "u"})
                .search_word("제목")
                .search_date1("2024-04-07")
                .search_date2("2024-04-20")
                .build();
        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        log.info("===============================================");
        log.info("BbsServiceTests >> testbbsListByPage START");
        responseDTO.getDtoList().forEach(
                vo->log.info(vo)
        );
        log.info("BbsServiceTests >> testbbsListByPage END");
        log.info("===============================================");
    }

}
