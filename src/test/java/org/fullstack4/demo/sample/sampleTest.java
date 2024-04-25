package org.fullstack4.demo.sample;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class sampleTest {

    @Autowired
    private SampleService sampleService;


    @Autowired
    private DataSource  dataSource;






    @Test
    public void testService(){
        System.out.println("sampleSErviceTEst" + sampleService);
    /*    log.info("----------------------------------------------");
        log.info("-----"+sampleService+"-------------");
        log.info("----------------------------------------------");*/
        Assertions.assertNotNull(sampleService);

    }



    @Test
    public void testConnection () throws Exception{
        Connection connection = dataSource.getConnection();

        Assertions.assertNotNull(connection);
        connection.close();
    }
}
