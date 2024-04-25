package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;

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

    @GetMapping("/join")
    public void joinGET() {
        log.info("============================");
        log.info("MemberController >> joinGET()");
        log.info("============================");
    }

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

    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="user_id", defaultValue = "") String user_id,
                          Model model) {
        log.info("============================");
        log.info("MemberController >> modifyGET()");

        log.info("user_id : " + user_id);

        model.addAttribute("memberDTO", memberServiceIf.view(user_id));

        log.info("============================");
    }

    @PostMapping("/modify")
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

    }

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
