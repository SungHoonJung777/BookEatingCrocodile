package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.MemberImageDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.MemberImageServiceIf;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;
    private final MemberImageServiceIf memberImageServiceIf;

    @GetMapping("/view")
    public void view(//@RequestParam(name="user_id", defaultValue = "") String user_id,
                     //idx가 빈값이면 value에 0을 넣어줘. 근데 이건 String "0"임. 왜? 자바에서 request의 리턴타입은 무조건 String이라서!
                     HttpServletRequest req,
                     Model model ) {
        log.info("========================");
        log.info("MemberController >> view()");

        String member_id = "abc01";
        MemberDTO memberDTO = memberServiceIf.view(member_id);

        MemberImageDTO memberImageDTO = memberImageServiceIf.viewImg(memberDTO.getMember_id());


        log.info("member_id : " + member_id);
        log.info("========================");
        model.addAttribute("member", memberDTO);
        model.addAttribute("memberImage", memberImageDTO);

//        HttpSession session = req.getSession();
//        String user_id = String.valueOf(session.getAttribute("user_id"));


    }

    @GetMapping("/join")
    public void joinGET() {
        log.info("============================");
        log.info("MemberController >> joinGET()");
        log.info("============================");
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
    public void modifyGET(//@RequestParam(name="member_id", defaultValue = "") String member_id,
                          Model model) {
        log.info("============================");
        log.info("MemberController >> modifyGET()");

        String member_id = "abc01";

        model.addAttribute("member", memberServiceIf.view(member_id));
        model.addAttribute("memberImage", memberImageServiceIf.viewImg(memberServiceIf.view(member_id).getMember_id()));

        log.info("============================");
    }

    @PostMapping("/modify")
    public String modifyPOST(@Valid MemberDTO memberDTO,
                             MemberImageDTO memberImageDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             @RequestParam("upload") MultipartFile file) {
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
        }
        catch(Exception e) {
            e.printStackTrace();
        }


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

        log.info("modifyResult : " + result);
        log.info("============================");
        if (result > 0 && resultImg > 0) {
            return "redirect:/member/view?" + memberDTO.getMember_id();
        } else {
            return "redirect:/member/modify?user_id=" + memberDTO.getMember_id();
        }
    }

    @PostMapping("/delete")
    public String leavePOST(@RequestParam(name="member_id", defaultValue = "") String member_id,
                            HttpServletRequest req) {
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
    public void cartGET(HttpSession session,
                        Model model) {
        String m_id = (String)session.getAttribute("m_id");
        List<ProductDTO> cartList = memberServiceIf.getCartList("cheolsu");
        model.addAttribute("cartList", cartList);
    }

}
