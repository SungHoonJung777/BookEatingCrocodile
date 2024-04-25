package org.fullstack4.demo.service;


import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.dto.BbsDTO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsServiceTest {
    @Autowired(required = false)
    private BbsService bbsService;

    @Test
    public void registTest(){
        BbsDTO bbsDTO = BbsDTO.builder()
                .user_id("test")
                .title("testTile")
                .content("cntnet")
                .display_date("")
                .read_cnt(0)
                .build();

        int result = bbsService.regist(bbsDTO);

    }



}
