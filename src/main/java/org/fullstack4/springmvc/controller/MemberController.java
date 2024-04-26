package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.Random;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;

    @Autowired
    private JavaMailSender mailSender;


    @GetMapping("/join")
    public String joinGET() {
        log.info("============================");
        log.info("MemberController >> joinGET()");
        log.info("============================");
        String url = "/member/joinForm";
        return url;
    }

    @GetMapping("/email")
    @ResponseBody
    public String emailGET(String email) throws Exception {
        log.info("============================");
        log.info("MemberController >> emailGET()");
        log.info(email);
        log.info("============================");
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "ssfu777@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "<img src=\"/uploads/BEClogo.png\" />" +
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

            mailSender.send(message);


        } catch (Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);

        return num;
    }

    @PostMapping("/memberIdChk")
    @ResponseBody
    public String memberIdChk(String memberId) throws Exception {
        log.info("============================");
        log.info("MemberController >> memberIdChk()");
        log.info(memberId);
        log.info("============================");

        int result = memberServiceIf.idCheck(memberId);

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

        int result = memberServiceIf.regist(memberDTO);

        log.info("registResult : " + result);
        log.info("============================");

        if (result > 0) {
            return "redirect:/login/login";
        } else {

            return "redirect:/member/join";
        }

    }

}
