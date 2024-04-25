package org.fullstack4.demo.controller;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.dto.BbsDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Log4j2
@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @GetMapping("/view")
    public void view(@RequestParam(name = "user_id", defaultValue = "0") String  user_id

            , Model model) {
        log.info("---------");
        log.info("user_id :" + user_id);

        log.info("---------");
        model.addAttribute("user_id", user_id);


    }

    @GetMapping("/join")
    public void registGET() {

    }

    @PostMapping("/join")
    public String registPOST(BbsDTO dto
            , Model model, RedirectAttributes redirectAttributes) {
        log.info("---------");

        return "redirect:/bbs/list";
    }

    @GetMapping("/modify")
    public void modifyGET() {

    }

    @PostMapping("/modify")
    public void modifyPOST() {

    }

    @PostMapping("/leave")
    public void deletePOST() {

    }

    @GetMapping
    public void list2(String s1, int i2){
        log.info("-==-=-=================");
        log.info("BbsController >> list 2 ()");
        log.info("s1" , s1);
        log.info("s2 : ", i2);

        log.info("-==-=-=================");
    }

}
