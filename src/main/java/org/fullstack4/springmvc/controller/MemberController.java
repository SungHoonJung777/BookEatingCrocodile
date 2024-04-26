package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.CartDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;

import org.fullstack4.springmvc.dto.MemberImageDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.MemberImageServiceIf;

import org.fullstack4.springmvc.service.MemberServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.Random;
import java.io.File;
import java.util.List;
import java.util.UUID;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;
    private final MemberImageServiceIf memberImageServiceIf;

    @Autowired
    private JavaMailSender mailSender;


    @GetMapping("/view")
    public void view(//@RequestParam(name="user_id", defaultValue = "") String user_id,
                     //idx가 빈값이면 value에 0을 넣어줘. 근데 이건 String "0"임. 왜? 자바에서 request의 리턴타입은 무조건 String이라서!
                     HttpServletRequest req,
                     Model model) {
        log.info("========================");
        log.info("MemberController >> view()");

<<<<<<< HEAD
//        HttpSession session = req.getSession();
//        String user_id = String.valueOf(session.getAttribute("user_id"));
//
//        MemberDTO memberDTO = memberServiceIf.view(user_id);
//
//        log.info("user_id : " + user_id);
//        log.info("========================");
//
//
//        //이거 안해주면 jsp에 값 안넘어온다ㅣ@
//        model.addAttribute("user_id", user_id);
//        model.addAttribute("memberDTO", memberDTO);
=======
        String member_id = "abc01";
        MemberDTO memberDTO = memberServiceIf.view(member_id);

        MemberImageDTO memberImageDTO = memberImageServiceIf.viewImg(memberDTO.getMember_id());


        log.info("member_id : " + member_id);
        HttpSession session = req.getSession();
        String user_id = String.valueOf(session.getAttribute("user_id"));

        log.info("user_id : " + user_id);
        log.info("========================");
        model.addAttribute("member", memberDTO);
        model.addAttribute("memberImage", memberImageDTO);


        //이거 안해주면 jsp에 값 안넘어온다ㅣ@
        model.addAttribute("user_id", user_id);
        model.addAttribute("memberDTO", memberDTO);
>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3
    }


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
        @GetMapping("/modify")
        public void modifyGET (//@RequestParam(name="member_id", defaultValue = "") String member_id,
                Model model){
            log.info("============================");
            log.info("MemberController >> modifyGET()");

<<<<<<< HEAD
    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="user_id", defaultValue = "") String user_id,
                          Model model) {
        log.info("============================");
        log.info("MemberController >> modifyGET()");

=======
            String member_id = "abc01";

            model.addAttribute("member", memberServiceIf.view(member_id));
            model.addAttribute("memberImage", memberImageServiceIf.viewImg(memberServiceIf.view(member_id).getMember_id()));
>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3

            log.info("============================");
        }

        @PostMapping("/modify")
        public String modifyPOST (@Valid MemberDTO memberDTO,
                MemberImageDTO memberImageDTO,
                BindingResult bindingResult,
                RedirectAttributes redirectAttributes,
                @RequestParam("upload") MultipartFile file){
            log.info("============================");
            log.info("MemberController >> modifyPOST()");

            String uploadFolder = "D:\\java4\\BEC\\src\\main\\webapp\\resources\\uploads\\img";
            String orgFile = file.getOriginalFilename(); //원래 파일의 이름
            long size = file.getSize();
            String fileExt = orgFile.substring(orgFile.lastIndexOf("."), orgFile.length()); // 확장자명
            //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

            log.info("============================");
            log.info("uploadFolder : " + uploadFolder);
            log.info("fileRealName : " + orgFile);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);


            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);

            String saveFileName = newName + fileExt;

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

<<<<<<< HEAD
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
    @GetMapping("/cart")
    public void cartGET(HttpSession session,
                        Model model) {
        String m_id = (String)session.getAttribute("m_id");
        List<CartDTO> cartList = memberServiceIf.getCartList("cheolsu");
        System.out.println(cartList);
        model.addAttribute("cartList", cartList);
    }
    @ResponseBody
    @RequestMapping(value = "/cartout", method = RequestMethod.POST)
    public void cartoutPOST(@RequestParam(name = "cart_idx", defaultValue="") String cart_idx) {
        memberServiceIf.cartout(cart_idx);
    }
    @GetMapping("/checkout")
    public void checkout(HttpSession session,
                        Model model) {
        String m_id = (String)session.getAttribute("m_id");
        List<CartDTO> cartList = memberServiceIf.getCartList("cheolsu");

        String pro_idx = "";
        for(int i = 0; i < cartList.size(); i++){
            if(i == 0) {
                pro_idx = pro_idx + cartList.get(i).getPro_idx();
            }else{
                pro_idx = pro_idx+", " +cartList.get(i).getPro_idx();
            }
        }
        model.addAttribute("cartList", cartList);
    }
=======

//        if (bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
//
//            return "redirect:/member/modify?user_id=" + memberDTO.getUser_id();
//        }
//

            int result = memberServiceIf.modify(memberDTO);
            int resultMemImg = memberServiceIf.modifyImage(memberDTO.getMember_id(), saveFileName);
            int resultImg = memberImageServiceIf.regist(memberDTO.getMember_id(), orgFile, saveFileName);
>>>>>>> 8e87c59e050ef967060f4df4c526b13d7b1c4ed3

            log.info("modifyResult : " + result);
            log.info("============================");
            if (result > 0 && resultImg > 0) {
                return "redirect:/member/view?" + memberDTO.getMember_id();
            } else {
                return "redirect:/member/modify?user_id=" + memberDTO.getMember_id();
            }
        }

        @PostMapping("/delete")
        public String leavePOST (@RequestParam(name = "member_id", defaultValue = "") String member_id,
                HttpServletRequest req){
            log.info("============================");
            log.info("MemberController >> leavePOST()");
            log.info("============================");
            int result = memberServiceIf.delete(member_id);
            if (result > 0) {
                HttpSession session = req.getSession();
                session.invalidate();

                return "redirect:/bbs/list";
            } else {
                return "redirect:/member/view?user_id=" + member_id;
            }

        }
        @GetMapping("/cart")
        public void cartGET (HttpSession session,
                Model model){
            String m_id = (String) session.getAttribute("m_id");
            List<ProductDTO> cartList = memberServiceIf.getCartList("cheolsu");
            model.addAttribute("cartList", cartList);
        }

    }
