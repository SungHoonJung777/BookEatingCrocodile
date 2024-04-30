package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.fullstack4.springmvc.service.qnaService.QnaServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/faq")
public class FaqController {
    private final MemberServiceIf memberServiceIf;
    private final QnaServiceIf qnaServiceIf;

    @GetMapping("/view")
    public void qnaList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("MemberController >> qnaList()");
        String member_id = (String) session.getAttribute("member_id");
        PageResponseDTO<QnaDTO> qnaList = memberServiceIf.getQnaList("admin", "faq", pageRequestDTO);

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);
        // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("MemberController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }

    @GetMapping("/modify")
    public void modifyAdminGET(@RequestParam(name = "qna_idx", defaultValue = "0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = qnaServiceIf.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/modify")
    public String modifyAdminPOST(@Valid QnaAdminDTO qnaAdminDTO,
                                  QnaDTO qnaDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  Model model) {


        log.info("registPOST");

//        if (bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("qnaAdminDTO", qnaAdminDTO);
//
//            return "redirect:/one/write";
//        }

        qnaServiceIf.modifyQna(qnaDTO);
        int result = qnaServiceIf.registAdmin(qnaAdminDTO);
        if (result > 0) {
            return "redirect:/faq/view";
        } else {
            return "redirect:/faq/view";
        }

    }

    @GetMapping("/delete")
    public String deleteAdminGET(int qna_idx) {
        qnaServiceIf.deleteQna(qna_idx);
        return "redirect:/faq/view";
    }

    @GetMapping("/write")
    public void registAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {

        String member_id = (String) session.getAttribute("member_id");
        model.addAttribute("member_id", "admin");
    }

    @PostMapping("/write")
    public String registAdminPOST(@Valid QnaDTO qnaDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  Model model) {


        log.info("registPOST");

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/faq/write";
        }

        int result = qnaServiceIf.registFaq(qnaDTO);
        if (result > 0) {
            return "redirect:/faq/view";
        } else {
            return "redirect:/faq/view";
        }


    }

}


