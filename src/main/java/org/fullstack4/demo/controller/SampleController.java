package org.fullstack4.demo.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@Log4j2
public class SampleController {


    @GetMapping("/hello")
    public void hello(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        log.info("----------------------------");
        log.info("hi");
        log.info("----------------------------");

        request.getRequestDispatcher("/WEB-INF/views/hello2.jsp").forward(request,response);

    }


}
