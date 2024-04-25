package org.fullstack4.springmvc.sample.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.mapper.TimeMapper;
import org.fullstack4.springmvc.mapper.TimeMapper2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TimeMapperTests {
    @Autowired(required = false) //생성자에 파라미터 넣지 않아도 빈 생성자 일단 만들어. 그 다음에 쓸게
    private TimeMapper timeMapper;

    @Test
    public void testGetTime() {
        log.info("=======================================");
        log.info("timeMapper.getTime() : " + timeMapper.getTime());
        log.info("=======================================");
    }

    @Autowired(required = false)
    private TimeMapper2 timeMapper2;

    @Test
    public void testNow() {
        log.info("=======================================");
        log.info("timeMapper2.getNow() : " + timeMapper2.getNow());
        log.info("=======================================");
    }
}
