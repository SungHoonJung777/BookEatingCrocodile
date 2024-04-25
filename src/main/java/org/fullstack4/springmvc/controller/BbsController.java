package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.fullstack4.springmvc.service.BbsServiceImpl;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {
    private final BbsServiceIf bbsServiceIf;
    private final LoginServiceIf loginServiceIf;
    private final BbsReplyServiceIf bbsReplyServiceIf;

//    public BbsController(BbsServiceIf bbsServiceIf) { @RequiredArgsConstructor가 이거 해주는거야!
//        this.bbsServiceIf = bbsServiceIf;
//    }

//    @GetMapping("/list")
//    public void list(Model model) {
//        log.info("========================");
//        log.info("BbsController >> list()");
//
//        List<BbsDTO> bbsDTOList = bbsServiceIf.listAll();
//
//        model.addAttribute("bbsList", bbsDTOList);
//
//        log.info("========================");
//
//    }
@GetMapping("/list")
public void list(@Valid PageRequestDTO pageRequestDTO,
                 BindingResult bindingResult,
                 RedirectAttributes redirectAttributes,
                 Model model) {
    log.info("========================");
    log.info("BbsController >> list() START");

    if (bindingResult.hasErrors()) {
        log.info("BbsController >> list Error");
        redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
    }
    PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);
    log.info("responseDTO : " + responseDTO.toString());
    model.addAttribute("responseDTO", responseDTO);

    log.info("BbsController >> list() END");
    log.info("========================");

}

    @GetMapping("/view")
    public void view(@RequestParam(name="idx", defaultValue = "0") int idx,
                     //idx가 빈값이면 value에 0을 넣어줘. 근데 이건 String "0"임. 왜? 자바에서 request의 리턴타입은 무조건 String이라서!
                     Model model ) {
        log.info("========================");
        log.info("BbsController >> view()");
        log.info("idx : " + idx);


        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        List<BbsReplyDTO> bbsReplyDTOList = bbsReplyServiceIf.reply_list(idx);

        //이거 안해주면 jsp에 값 안넘어온다
        model.addAttribute("idx", idx);
        model.addAttribute("bbs", bbsDTO);
        model.addAttribute("bbsReply", bbsReplyDTOList);
        log.info("========================");

    }

    @GetMapping("/regist")
    public String registGET(HttpServletRequest req,
                            Model model
                            ) {
        log.info("============================");
        log.info("BbsController >> registGET()");


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

            }
        }
        if (auto_user_id == null || auto_user_id.equals("")) {
            if (session.getAttribute("loginInfo") != null) {
                model.addAttribute("acc_url", req.getHeader("referer"));
                return "/bbs/regist";
            } else {
                return "redirect:/login/login";
            }
        }

        else {
            model.addAttribute("acc_url", req.getHeader("referer"));

            log.info("==============================");
            return "/bbs/regist";
        }



}





    @PostMapping("/regist")
    public String registPOST(@Valid BbsDTO bbsDTO, //dto 객체에 어노테이션 되어있는 애들만 체크해서 기본메세지 던져줌!
                             BindingResult bindingResult, // Valid가 체크된 값으로 여기에 바인딩 시켜줄거임
                             RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("BbsController >> registPOST()");


        if (bindingResult.hasErrors()) { //array 객체 형태로 저장됨
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors()); //휘발성 저장. 모든 에러를 담아서 보냄
            redirectAttributes.addFlashAttribute("bbsDTO", bbsDTO);

            return "redirect:/bbs/regist";
        }

        log.info("bbsDTO : " + bbsDTO.toString());

        int result = bbsServiceIf.regist(bbsDTO);

        log.info("registResult : " + result);
        log.info("============================");

        if (result > 0) {
            return "redirect:/bbs/list";
        } else {
            return "/bbs/regist";
        }

    }

    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name="idx", defaultValue = "0") int idx,
                          HttpServletRequest req,
                          Model model) {
        log.info("============================");
        log.info("BbsController >> modifyGET()");

        log.info("idx : " + idx);



        BbsDTO bbsDTO = bbsServiceIf.view(idx);

        //이거 안해주면 jsp에 값 안넘어온다
        model.addAttribute("idx", idx);
        model.addAttribute("bbs", bbsDTO);
        log.info("============================");

//        HttpSession session = req.getSession();
//        String auto_user_id = "";
//
//        Cookie[] cookies = req.getCookies();
//        for (Cookie c : cookies) {
//            if (c.getName().equals("auto_user_id")) {
//                auto_user_id = c.getValue();
//            }
//        }
//
//        if (auto_user_id != null) {
//            MemberDTO loginMemberDTO = loginServiceIf.login_cookie(auto_user_id);
//            if (loginMemberDTO != null) {
//                model.addAttribute("member", loginMemberDTO);
//                session.setAttribute("user_id", auto_user_id);
//                session.setAttribute("loginInfo", loginMemberDTO);
//
//            }
//        }
//        if (auto_user_id == null || auto_user_id.equals("")) {
//            if (session.getAttribute("loginInfo") != null) {
//                model.addAttribute("acc_url", req.getHeader("referer"));
//                return "/bbs/modify?idx="+idx;
//            } else {
//                return "redirect:/login/login";
//            }
//        }
//
//        else {
//            model.addAttribute("acc_url", req.getHeader("referer"));
//
//            log.info("==============================");
//            return "/bbs/modify?idx="+idx;
//        }


    }

    @PostMapping("/modify")
    public String modifyPOST(BbsDTO bbsDTO,
                           Model model, RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("BbsController >> modifyPOST()");
        log.info("bbsDTO : " + bbsDTO.toString());
        log.info("============================");

        int result = bbsServiceIf.modify(bbsDTO);
        if (result > 0) {
            return "redirect:/bbs/view?idx=" + bbsDTO.getIdx();
        } else {
            return "/bbs/modify";
        }

    }

    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name="idx", defaultValue = "0") int idx,
                           Model model) {
        log.info("============================");
        log.info("BbsController >> deletePOST()");
        log.info("============================");

        int result = bbsServiceIf.delete(idx);
        if (result > 0) {
            return "redirect:/bbs/list";
        } else {
            return "/bbs/view?idx=" + idx;
        }


    }

//    예외처리 확인
//    @GetMapping("/list2")
//    public void list2(String s1, int i2) {
//        log.info("============================");
//        log.info("BbsController >> list2()");
//        log.info("s1 : " + s1);
//        log.info("i2 : " + i2);
//        log.info("============================");
//    }

    @RequestMapping(value="/fileUpload", method= RequestMethod.GET)
    public String fileUploadGET() {
        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload", method=RequestMethod.POST)
    public String fileUploadPOST(@RequestParam("file") MultipartFile file) {
        String uploadFolder = "D:\\java4\\uploads";
        String fileRealName = file.getOriginalFilename(); //원래 파일의 이름
        long size = file.getSize();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
        //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("fileRealName : " + fileRealName);
        log.info("size : " + size);
        log.info("fileExt : " + fileExt);


        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        log.info("uuid : " + uuid);
        log.info("uuids : " + uuids);
        log.info("newName : " + newName);


        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }



        log.info("============================");

        return "/bbs/fileUpload";
    }

    @RequestMapping(value="/fileUpload2", method= RequestMethod.GET)
    public String fileUploadGET2() {
        return "/bbs/fileUpload2";
    }

    @RequestMapping(value="/fileUpload2", method=RequestMethod.POST)
    public String fileUploadPOST2(MultipartHttpServletRequest files) { //복수개의 파일이 넘어올 거에요
        String uploadFolder = "D:\\java4\\uploads";
        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);

        List<MultipartFile> list = files.getFiles("files");
        for (int i = 0; i < list.size(); i++) {
            String fileRealName = list.get(i).getOriginalFilename();
            long size = list.get(i).getSize();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());

            log.info("fileRealName : " + fileRealName);
            log.info("size : " + size);
            log.info("fileExt : " + fileExt);

            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];

            log.info("uuid : " + uuid);
            log.info("uuids : " + uuids);
            log.info("newName : " + newName);

            File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

            try {
                list.get(i).transferTo(saveFile);
            } catch (IllegalStateException e) { //파일 업로드 실패했을 때 백업하는 로직을 여기나 밑에 catch문에 추가하면 돼
                e.printStackTrace();
            }
            catch(Exception e) {
                e.printStackTrace();
            }

        }

        log.info("============================");

        return "/bbs/fileUpload2";
    }

}
