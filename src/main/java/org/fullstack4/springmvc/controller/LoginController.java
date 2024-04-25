package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.LoginDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.net.URLEncoder;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value="/login")
public class LoginController {
    private final LoginServiceIf loginServiceIf;

    @RequestMapping(value="/login", method={RequestMethod.GET})
    public String loginGET(HttpServletRequest req,
                         LoginDTO loginDTO,
                         MemberDTO memberDTO,
                         Model model) {
        log.info("==============================");
        log.info("LoginController >> loginGET()");

        String auto_user_id = "";

        HttpSession session = req.getSession();

        Cookie[] cookies = req.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("auto_user_id")) {
                auto_user_id = c.getValue();
            }
        }

        if (auto_user_id != null) {
            MemberDTO loginMemberDTO = loginServiceIf.login_cookie(auto_user_id);
            if (loginMemberDTO != null) {
                model.addAttribute("member", loginMemberDTO);
                session.setAttribute("user_id", auto_user_id);
                session.setAttribute("loginInfo", loginMemberDTO);

                return "redirect:/bbs/list";
            }
        }

        model.addAttribute("acc_url", req.getHeader("referer"));

        log.info("==============================");

        return "/login/login";
    }

    @RequestMapping(value="/login", method={RequestMethod.POST})
    public String loginPOST(@Valid LoginDTO loginDTO,
                            BindingResult bindingResult,
                            @RequestParam(name="acc_url", defaultValue = "/bbs/list", required = false) String acc_url, //null이어도 되는데 없으면 여기로 갈거야
                            Model model,
                            RedirectAttributes redirectAttributes,
                            HttpServletRequest req,
                            HttpServletResponse res) {

        String rtn_url = "";
        try {
            rtn_url = URLEncoder.encode(acc_url, "UTF-8");
        } catch (Exception e) {

        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/login/login";
        }
        log.info("==============================");
        log.info("LoginController >> loginPOST()");
        log.info("acc_url : " + rtn_url);
        log.info("memberDTO : " + loginDTO.toString());



        MemberDTO loginMemberDTO = loginServiceIf.login_info(loginDTO.getUser_id(), loginDTO.getPwd()); //db에서 갖고온 dto
        log.info("loginMemberDTO : " + loginMemberDTO);



        if (loginMemberDTO != null) {
            HttpSession session = req.getSession(); // ()랑 (false)의 차이는? 로그아웃할 때 false 넣고 invalid 하면 깔끔하게 날라감.
            //() : 만약 세션이 형성이 안되어있으면 세션을 바로 생성해서 리턴. 있으면 있는 생성정보를 리턴.
            //(false) : 없더라도 생성안함. 그냥 세션만 리턴(null)
            session.setAttribute("user_id", loginDTO.getUser_id());
            session.setAttribute("loginInfo", loginMemberDTO);
            log.info(session.getAttribute("loginInfo"));
            model.addAttribute("loginInfo", loginMemberDTO);
            if (req.getParameter("save_id") != null && req.getParameter("save_id").equals("Y")) {
                Cookie cookie1 = new Cookie("save_id", "checked");
                cookie1.setDomain("");
                cookie1.setPath("/");
                cookie1.setMaxAge(60*60*24);
                res.addCookie(cookie1);

                Cookie cookie2 = new Cookie("user_id", loginDTO.getUser_id());
                cookie2.setDomain("");
                cookie2.setPath("/");
                cookie2.setMaxAge(60*60*24);
                res.addCookie(cookie2);
            }
            if (req.getParameter("save_id") == null) {
                Cookie cookie1 = new Cookie("save_id", "");
                cookie1.setDomain("");
                cookie1.setPath("/");
                cookie1.setMaxAge(0);
                res.addCookie(cookie1);

                Cookie cookie2 = new Cookie("user_id", "");
                cookie2.setDomain("");
                cookie2.setPath("/");
                cookie2.setMaxAge(0);
                res.addCookie(cookie2);

            }
            if (req.getParameter("auto_login") != null && req.getParameter("auto_login").equals("Y")) {
                Cookie cookie1 = new Cookie("auto_user_id", loginDTO.getUser_id());
                cookie1.setDomain("");
                cookie1.setPath("/");
                cookie1.setMaxAge(60*60*24);
                res.addCookie(cookie1);

//                Cookie cookie2 = new Cookie("pwd", loginDTO.getPwd());
//                cookie2.setDomain("");
//                cookie2.setPath("/");
//                cookie2.setMaxAge(60*60*24);
//                res.addCookie(cookie2);
            }
            return "redirect:"+ acc_url;
        }
        else {
            redirectAttributes.addFlashAttribute("error_login", "사용자 정보가 일치하지 않습니다.");
            return "redirect:/login/login";
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

        Cookie cookie = new Cookie("auto_user_id", "");
        cookie.setDomain("");
        cookie.setPath("/");
        cookie.setMaxAge(0);
        res.addCookie(cookie);

        Cookie cookie2 = new Cookie("pwd", "");
        cookie2.setDomain("");
        cookie2.setPath("/");
        cookie2.setMaxAge(0);
        res.addCookie(cookie2);

        log.info("LoginController >> logout()");
        log.info("==============================");

        return "redirect:/bbs/list";
    }
}