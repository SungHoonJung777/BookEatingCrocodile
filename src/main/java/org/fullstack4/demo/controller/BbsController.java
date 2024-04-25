package org.fullstack4.demo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.Criteria.Criteria;
import org.fullstack4.demo.Criteria.PageMakerDTO;
import org.fullstack4.demo.dto.BbsDTO;
import org.fullstack4.demo.service.BbsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value = "/bbs")
@RequiredArgsConstructor
public class BbsController {

    @Autowired
    private BbsService bbsService;
    @GetMapping("/list")
    public void getListpaging(Model model, Criteria cri) {
        log.info("---------");

        List<BbsDTO> list = bbsService.getListPaging(cri);


        log.info("boardListGET");

        int total = bbsService.getTotal(cri);

        PageMakerDTO pageMake = new PageMakerDTO(cri, total);

        model.addAttribute("pageMaker", pageMake);
        model.addAttribute("list",list);
        model.addAttribute("cri",cri);

    }
/*
    @GetMapping("/list")
    public void list(Model model) {
        log.info("---------");

        List<BbsDTO> list = bbsService.list();

        System.out.println("Bbs List : " + bbsService.list());
        model.addAttribute("list",list);


    }*/

    @GetMapping("/view")
    public void view(@RequestParam(name = "idx", defaultValue = "0") int idx

            , Model model) {
        log.info("---------");
        log.info("idx :" + idx);

        log.info("---------");
        BbsDTO bbsDTO = bbsService.view(idx);

        model.addAttribute("list", bbsDTO);


    }

    @GetMapping("/regist")
    public void registGET() {

    }
    @PostMapping("/regist")
    public String registPost(@Valid BbsDTO dto,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("---------------------");
        log.info("BbsController => registPost()");

        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("dto", dto);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            // 이런식으로 에러 있는지 bindingResult 체크해서 addFlashAttribute 보내면 처음 리다이렉트 한 페이지에서 한번만 조회하고 끝낼 수 있음.
            // getAllErrors는 Array 형태로 보내짐.
            return "redirect:/bbs/regist";
        }

        int result = bbsService.regist(dto);
        log.info("BbsDTO : " + dto.toString());
        log.info("result : " + result);
        log.info("---------------------");
        if (result > 0) {
            return "redirect:/bbs/list";
        } else {
            return "redirect:/bbs/regist";
        }
    }


    @GetMapping("/modify")
    public void modifyGET(int idx, Model model) {
        log.info("---------");
        log.info("idx :" + idx);

        log.info("---------");
        BbsDTO bbsDTO = bbsService.view(idx);

        model.addAttribute("list", bbsDTO);
    }

    @PostMapping("/modify")
    public String modifyPOST(BbsDTO dto) {
        log.info("---------");

        log.info("user_id :" + dto.getUser_id());
        log.info("title :" + dto.getTitle());
        log.info("content " + dto.getContent());
        log.info("display_date : " + dto.getDisplay_date());
        log.info("display_date : " + dto.getIdx());
        log.info("---------");

        int result = bbsService.modify(dto);
        if(result > 0){
            return "redirect:/bbs/view?idx=" + dto.getIdx();
        } else {
            return "/bbs/modify";
        }


    }

    @PostMapping("/delete")
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

    @GetMapping("/fileUpload")
    public String fileUploadGET() {
        return "/bbs/fileUpload";
    }

    @PostMapping("/fileUpload")
    public String fileUploadPOST(@RequestParam("file") MultipartFile file) {
        String uploadFolder = "C:\\java4\\spring\\springweb\\demo\\src\\main\\webapp\\upload";
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
    @GetMapping("/fileUpload2")
    public String fileUploadGET2() {
        return "/bbs/fileUpload2";
    }

    @PostMapping("/fileUpload2")
    public String fileUploadPOST2( MultipartHttpServletRequest files) {
        String uploadFolder = "C:\\java4\\spring\\springweb\\demo\\src\\main\\webapp\\upload";

        List<MultipartFile> list = files.getFiles("files");
        for(int i=0; i<list.size(); i++){
            String fileRealName = list.get(i).getOriginalFilename();
            long size  = list.get(i).getSize();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
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
                list.get(i).transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }

        return "/bbs/fileUpload2";

    }
}
