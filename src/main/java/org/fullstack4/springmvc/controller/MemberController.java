package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
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

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;

    @Autowired
    private JavaMailSender mailSender;
/*

    @GetMapping("/view")
    public void view(//@RequestParam(name="user_id", defaultValue = "") String user_id,
                     //idx가 빈값이면 value에 0을 넣어줘. 근데 이건 String "0"임. 왜? 자바에서 request의 리턴타입은 무조건 String이라서!
                     HttpServletRequest req,
                     Model model ) {
        log.info("========================");
        log.info("MemberController >> view()");

        HttpSession session = req.getSession();
        String user_id = String.valueOf(session.getAttribute("user_id"));

        MemberDTO memberDTO = memberServiceIf.view(user_id);

        log.info("user_id : " + user_id);
        log.info("========================");


        //이거 안해주면 jsp에 값 안넘어온다ㅣ@
        model.addAttribute("user_id", user_id);
        model.addAttribute("memberDTO", memberDTO);
    }
*/

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
    public String  emailGET(String email) throws Exception{
        log.info("============================");
        log.info("MemberController >> emailGET()");
        log.info(email);
        log.info("============================");
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "sshu777@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "인증 번호는 " + checkNum + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

       /* try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);

            mailSender.send(message);


        }catch(Exception e) {
            e.printStackTrace();
        }*/

        String num = Integer.toString(checkNum);

        return num;
    }
/*
    @PostMapping("/join")
    public String joinPOST(@Valid MemberDTO memberDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("MemberController >> joinPOST()");


        int result2 = memberServiceIf.getIdCount(memberDTO.getUser_id());

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);

            return "redirect:/member/join";
        }

        if (result2 > 0) {
            redirectAttributes.addFlashAttribute("idError", "아이디 중복!");
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/join";
        }


        log.info("memberDTO : " + memberDTO.toString());

        int result = memberServiceIf.regist(memberDTO);


        log.info("registResult : " + result);

        log.info("============================");


        if (result > 0) {
            return "redirect:/login/login";
        }
        else {

            return "redirect:/member/join";
        }
    }
*/

    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="user_id", defaultValue = "") String user_id,
                          Model model) {
        log.info("============================");
        log.info("MemberController >> modifyGET()");

        log.info("user_id : " + user_id);

        model.addAttribute("memberDTO", memberServiceIf.view(user_id));

        log.info("============================");
    }

/*    @PostMapping("/modify")
    public String modifyPOST(@Valid MemberDTO memberDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("MemberController >> modifyPOST()");

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);

            return "redirect:/member/modify?user_id=" + memberDTO.getUser_id();
        }

        int result = memberServiceIf.modify(memberDTO);
        log.info("modifyResult : " + result);
        log.info("============================");
        if (result > 0) {
            return "redirect:/member/view?" + memberDTO.getUser_id();
        } else {
            return "redirect:/member/modify?user_id=" + memberDTO.getUser_id();
        }

    }*/

    @PostMapping("/delete")
    public String leavePOST(@RequestParam(name="user_id", defaultValue = "") String user_id,
                            HttpServletRequest req) {
        log.info("============================");
        log.info("MemberController >> leavePOST()");
        log.info("============================");
        int result = memberServiceIf.delete(user_id);
        if (result > 0) {
            HttpSession session = req.getSession();
            session.invalidate();
            return "redirect:/bbs/list";
        } else {
            return "redirect:/member/view?user_id=" + user_id;
        }
    }

}
