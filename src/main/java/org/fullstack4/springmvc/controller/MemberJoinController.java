package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.memberJoinService.MemberJoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Log4j2
@Controller
@RequestMapping("/memberJoin")
@RequiredArgsConstructor
public class MemberJoinController {
    @Autowired
    private MemberJoinService memberJoinService;
    @Autowired
    private JavaMailSender mailSender;

    @GetMapping("/join")
    public String joinGET() {
        log.info("============================");
        log.info("MemberJoinController >> joinGET()");
        log.info("============================");

        return "/memberJoin/joinForm";
    }

    @GetMapping("/email")
    @ResponseBody
    public String emailGET(String email) throws Exception {

        log.info("============================");
        log.info("MemberController >> emailGET()");
        log.info(email);

        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);


        String setFrom = "ssfu777@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";

        String content = "<img src=\"/resources/uploads/BEClogo.png\" />" +
                "책 먹는 악어를 방문해주셔서 감사합니다." +
                "<br><br>" +
                "인증 번호는 " + checkNum + "입니다." +
                "<br>" +
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            helper.setText(content, true);

            mailSender.send(message);


        } catch (Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);

        return num;

    }


    //ID 중복 확인
    @PostMapping("/memberIdChk")
    @ResponseBody
    public String memberIdChk(String memberId) throws Exception {
        log.info("============================");
        log.info("MemberController >> memberIdChk()");
        log.info(memberId);
        log.info("============================");


        int result = memberJoinService.idCheck(memberId);

        if (result != 0) {
            return "fail";
        } else {
            return "success";
        }

    }

    @PostMapping("/join")
    public String joinPOST(MemberDTO memberDTO) throws Exception {
        log.info("============================");
        log.info("MemberController >> joinPOST()");
        log.info("memberDTO : " + memberDTO.toString());

        int result = memberJoinService.regist(memberDTO);

        log.info("registResult : " + result);
        log.info("============================");

        if (result > 0) {
            return "redirect:/login/login";
        } else {
            return "redirect:/member/join";
        }
    }


}
