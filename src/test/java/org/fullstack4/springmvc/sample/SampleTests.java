package org.fullstack4.springmvc.sample;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
//1. root-context.xml에서 의존성이 매핑되어 있는것을 읽어와서 의존성을 넣는것
//2. 걍 어노테이션 이용해서 Autowired에 대한것을 설정한 후 의존성을 넣는것
public class SampleTests {
    @Autowired
    private SampleService sampleService;

    @Autowired
    private DataSource dataSource;

    @Test // test annotation 이용, 반드시 public void
    public void testService() {
        log.info("=======================================");
        log.info("sampleService Test : " + sampleService); //의존성 주입이 되어서 객체가 생성되었는지 확인
        log.info("=======================================");

//        sampleService Test : SampleService(sampleDAO=org.fullstack4.springmvc.sample.SampleDAO@1d035be3)
//        사용자 정의 생성자 -> Autowired 로 인해서 생성자에다가 sampleDAO 주입한것!
//        spring이 알아서 생성자에 주입해서 만들어줌. 기본생성자 아님(파라미터가 들어가기 때문에)

        Assertions.assertNotNull(sampleService); //JUnit test에서만 사용하면서 객체가 null이 아닌지 체크, null이면 알아서 로그 찍어줌!
    }

    @Test
    public void testConnection() throws Exception {
        Connection connection = dataSource.getConnection();
        log.info("=======================================");
        log.info("dataSource Test : " + connection);
        log.info("=======================================");

        Assertions.assertNotNull(connection);
        connection.close();
    }


}
