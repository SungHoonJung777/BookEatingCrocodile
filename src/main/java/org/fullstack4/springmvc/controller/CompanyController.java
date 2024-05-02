package org.fullstack4.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {

    @GetMapping("/introduce")
    public void introduce() {

    }

    @GetMapping("/history")
    public void history() {

    }
    @GetMapping("/place")
    public void place() {}
}
