package org.fullstack4.springmvc.controller.admin;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.common.FileUtil;
import org.fullstack4.springmvc.dto.DataDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.service.data.DataServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.stream.Stream;

@Log4j2
@Controller
@RequestMapping("/admin/data")
@RequiredArgsConstructor
public class AdminDataController {
    private final DataServiceIf dataServiceIf;

    @GetMapping("/write")
    public void registDataGET(HttpSession session,
                             Model model) {
        String member_id = (String) session.getAttribute("member_id");
        model.addAttribute("member_id", "abc01");

    }

    @PostMapping("/write")
    public String registDataPOST(@Valid DataDTO dataDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                 @RequestParam("upload") MultipartFile file,
                                Model model) {


        log.info("=========registDataPOST START");



        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/admin/data/write";
        }


        int resultFile = 0;
        String comu_file = "";
        if(file != null &&  file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty() ){

            log.info("file  : "+file);
            log.info("getOriginalFilename : "+file.getOriginalFilename());


            comu_file = FileUtil.dataCreateFile(file);

            log.info("comu_file : "+comu_file);
        }

            resultFile = dataServiceIf.data_fileUpload(dataDTO.getMember_id(),comu_file, dataDTO.getComu_title(), dataDTO.getComu_content(),  dataDTO.getCommu_category());



        log.info("resultFile : "+ resultFile);
/*
            if (file.isEmpty() || file == null) {
                FileUtil.dataDeleteFile(comu_file);
            }*/





        log.info("DataController >> dataViewPOST END");
        log.info("=====================================");
        /*      int result = dataServiceIf.modifyData(dataDTO);*/
        if (resultFile > 0) {
            return "redirect:/admin/dataList";
        }
        else {
            return "redirect:/admin/data/write";
        }


    }
    @GetMapping("/main")
    public void dataList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("DataController >> dataList() START");

        String member_id = (String)session.getAttribute("member_id");
        pageRequestDTO.setCommu_category("d");
        PageResponseDTO<DataDTO> dataList = dataServiceIf.dataList( pageRequestDTO);

        model.addAttribute("dataList", dataList);


        log.info(dataList);
        log.info("DataController >> dataList() END");
        log.info("========================");
        log.info("============================");
    }

    @GetMapping("/view")
    public void dataViewGET(@RequestParam(name = "comu_idx", defaultValue="0") int comu_idx,
                        HttpSession session,
                        Model model) {
        DataDTO dataDTO = dataServiceIf.viewData(comu_idx);
        model.addAttribute("dataDTO", dataDTO);
    }


    @GetMapping("/modify")
    public void dataModifyGET(@RequestParam(name = "comu_idx", defaultValue="0") int comu_idx,
                              HttpSession session,
                              Model model) {
        DataDTO dataDTO = dataServiceIf.viewData(comu_idx);
        model.addAttribute("dataDTO", dataDTO);
    }

    @PostMapping("/modify")
    public String dataViewPOST(@Valid DataDTO dataDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               @RequestParam("file") MultipartFile file,
                               @RequestParam(name="upload") String upload,
                               Model model) {

        log.info("=====================================");
        log.info("DataController >> dataViewPOST START");
        log.info("dataDTO : "+dataDTO.toString());
        log.info("filefilefilefilefilefile : "+file);
/*
        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);

            return "redirect:/data/modify?comu_idx=" + dataDTO.getComu_idx();
        }*/

        int resultFile = 0;
        String comu_file = "";
        if(file != null &&  file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty() ){

            log.info("file  : "+file);
            log.info("getOriginalFilename : "+file.getOriginalFilename());


            comu_file = FileUtil.dataCreateFile(file);

            log.info("comu_file : "+comu_file);
        }
        if(comu_file != null && !comu_file.isEmpty()){
            resultFile = dataServiceIf.modifyData(dataDTO.getComu_title(), dataDTO.getComu_content(), comu_file, dataDTO.getComu_idx());

        }   else {
            resultFile = dataServiceIf.modifyData(dataDTO.getComu_title(), dataDTO.getComu_content(), upload, dataDTO.getComu_idx());

        }


        log.info("resultFile : "+ resultFile);
/*
            if (file.isEmpty() || file == null) {
                FileUtil.dataDeleteFile(comu_file);
            }*/





        log.info("DataController >> dataViewPOST END");
        log.info("=====================================");
  /*      int result = dataServiceIf.modifyData(dataDTO);*/
        if (resultFile > 0) {
            return "redirect:/admin/data/view?comu_idx=" + dataDTO.getComu_idx();
        }
        else {
            return "redirect:/admin/data/modify?comu_idx=" + dataDTO.getComu_idx();
        }

    }

    @GetMapping("/delete")
    public String dataDeletePOST(
            @RequestParam(name="comu_idx", required=false) String idxList) {

//        log.info("faqDeleteController");
//        if (qna_idx > 0) {
//            qnaServiceIf.deleteQna(qna_idx);
//            log.info("하나 삭제할게");
//        }
//        log.info(idxList);
//        if (idxList != null && idxList.length > 0) {
//
//        }
//
//        delete from bec_qna where idx in (idxList)
        //체크박스 삭제
        String[] arrIdx = idxList.split(",");
        Integer[] newArr = Stream.of(arrIdx).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
        dataServiceIf.deleteDataList(newArr);

        log.info("idxList : " + idxList);
        return "redirect:/admin/dataList";
    }

  /*  @RequestMapping(value = "/resources/resources/uploads/data/{comu_file}", method = RequestMethod.GET)
    public void downloadFile(@PathVariable("comu_file") String comu_file, HttpServletResponse response) throws IOException {
        // 파일을 가져오는 로직 (파일 시스템에서 또는 데이터베이스에서)
        // 여기서는 예시로 파일 시스템에서 가져온다고 가정합니다.
        String filePath = "D:\\JAVA4\\BEC\\src\\main\\webapp\\resources\\uploads\\data" + comu_file; // 파일이 저장된 경로


        try {
            File file = new File(filePath);
            InputStream inputStream = new FileInputStream(file);

            // 파일을 응답에 첨부하여 전송
            response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
            FileCopyUtils.copy(inputStream, response.getOutputStream());
            response.flushBuffer();
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }*/
}
