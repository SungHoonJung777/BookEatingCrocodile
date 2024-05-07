package org.fullstack4.springmvc.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.memberLoginService.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/login")
public class MemberLoginController {
    private final MemberLoginService memberLoginService;
    @Autowired
    private JavaMailSender mailSender;
    @GetMapping("/login")
    public String loginGET(HttpServletRequest request, MemberDTO memberDTO, Model model) {
        log.info("==============================");
        log.info("MemberLoginController >> loginGET()");

        String auto_user_id = "";

/*
        HttpSession session = request.getSession();

       Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("auto_user_id")) {
                auto_user_id = c.getValue();
            }
        }

        if (auto_user_id != null) {
            MemberDTO loginMemberDTO = loginService.login_cookie(auto_user_id);
            if (loginMemberDTO != null) {
                model.addAttribute("member", loginMemberDTO);
                session.setAttribute("user_id", auto_user_id);
                session.setAttribute("loginInfo", loginMemberDTO);

                return "redirect:/bbs/list";
            }
        }
*/

        model.addAttribute("acc_url", request.getHeader("referer"));

        log.info("==============================");

        return "/login/login";
    }

    @PostMapping("/login")
    public String loginPOST( Model model ,HttpServletRequest request ,HttpServletResponse response , String id, String pwd,   RedirectAttributes redirectAttributes) {
        log.info("==============================");
        log.info("LoginController >> loginPOST()");
        MemberDTO loginMemberDTO = memberLoginService.login_info(id ,pwd);
        log.info("loginMemberDTO : " + loginMemberDTO);



        if (loginMemberDTO != null) {
            HttpSession session = request.getSession(); // ()랑 (false)의 차이는? 로그아웃할 때 false 넣고 invalid 하면 깔끔하게 날라감.
            //() : 만약 세션이 형성이 안되어있으면 세션을 바로 생성해서 리턴. 있으면 있는 생성정보를 리턴.
            //(false) : 없더라도 생성안함. 그냥 세션만 리턴(null)
            session.setAttribute("member_id", loginMemberDTO.getMember_id());
            session.setAttribute("member_type",loginMemberDTO.getMember_type());
            session.setAttribute("loginInfo", loginMemberDTO);
            log.info(session.getAttribute("loginInfo"));
            model.addAttribute("loginInfo", loginMemberDTO);

            return "redirect:/";
        }
        else {

            redirectAttributes.addFlashAttribute("error_login", "사용자 정보가 일치하지 않습니다.");
            return "redirect:/login/login";
        }
    }

    @GetMapping("/pwdFind")
    public String pwdFile(){
        log.info("==============================");
        log.info("MemberLoginController >> pwdFindGET()");
        log.info("==============================");

        return "/login/pwdFind";
    }
    @PostMapping("/pwdFind")
    public String pwdFind(String member_id, String member_email, String member_phone , Model model,HttpServletRequest request) throws  Exception{
        log.info("==============================");
        log.info("MemberLoginController >> pwdFindPost()");
        log.info("==============================");
        String url = "/login/pwdFind";
        int result = memberLoginService.pwdFind(member_id,member_email,member_phone);
        if (result > 0) {


            Random random = new Random();
            int checkNum = random.nextInt(888888) + 111111;

            int uResult = memberLoginService.pwdChange(member_id ,checkNum);
            if (uResult > 0) {
                log.info("인증번호 " + checkNum);


                String setFrom = "ssfu777@gmail.com";
                String toMail = member_email;
                String title = "책 먹는 악어 임시 비밀번호 발급 안내드립니다.";

                String content =
                        "책 먹는 악어를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "임시 비밀번호는 " + "crocodile"+checkNum + "입니다." +
                        "<br>" +
                        "해당 임시 비밀번호를 입력하여 로그인 후 마이페이지에서 정보를 변경해주세요.";

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
            }
            request.setAttribute("success_login", "이메일로 임시 비밀번호를 발급해드렸습니다.");

            return url;
        }
        else {
            request.setAttribute("error_login", "입력하신 정보와 맞는 정보가 없습니다.");

            return url;
        }
    }

    @RequestMapping(value="/logout")
    public String logout(HttpServletRequest req,
                         HttpServletResponse res) {
        log.info("==============================");

        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }



        log.info("LoginController >> logout()");
        log.info("==============================");

        return "redirect:/";
    }
}