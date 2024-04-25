package org.fullstack4.springmvc.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j2
@Controller //스프링아, 이건 너가 환경설정에서 알아서 찾아서 빈으로 등록해서 관리해야 할 대상이야
public class SampleController {
    @GetMapping("/hello")
    public void hello() {
        log.info("==========================================");
        log.info("hello~~~~~~");
        log.info("==========================================");
    }
}
