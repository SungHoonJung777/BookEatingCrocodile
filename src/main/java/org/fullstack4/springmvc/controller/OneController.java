package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.QnaAdminDTO;
import org.fullstack4.springmvc.dto.QnaDTO;
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
@RequestMapping("/one")
@RequiredArgsConstructor
public class OneController {
    private final QnaServiceIf qnaServiceIf;

    @GetMapping("/write")
    public void registQnaGET(HttpSession session,
                             Model model) {
        String member_id = (String) session.getAttribute("member_id");
        model.addAttribute("member_id", "abc01");

    }

    @PostMapping("/write")
    public String registQnaPOST(@Valid QnaDTO qnaDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {



        log.info("registPOST");

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/one/write";
        }

        int result = qnaServiceIf.registQna(qnaDTO);
        if (result > 0) {

            return "redirect:/member/one";
        }

        else {
            return "redirect:/one/write";
        }

    }

    @GetMapping("/view")
    public void viewGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                          HttpSession session,
                          Model model) {
         QnaDTO qnaDTO = qnaServiceIf.viewQna(qna_idx);
         model.addAttribute("qnaDTO", qnaDTO);
    }



    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                            HttpSession session,
                            Model model) {
        QnaDTO qnaDTO = qnaServiceIf.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }
    @PostMapping("/modify")
    public String viewPOST(@Valid QnaDTO qnaDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/one/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

        int result = qnaServiceIf.modifyQna(qnaDTO);

        if (result > 0) {
            return "redirect:/one/view?qna_idx=" + qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/one/modify";
        }

    }

    @GetMapping("/delete")
    public String deletePOST(int qna_idx) {
        qnaServiceIf.deleteQna(qna_idx);

        return "redirect:/member/one";
    }

    @GetMapping("/adminWrite")
    public void registAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = qnaServiceIf.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/adminWrite")
    public String registAdminPOST(@Valid QnaAdminDTO qnaAdminDTO,
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

        int result = qnaServiceIf.registAdmin(qnaAdminDTO);
        if (result > 0) {
            return "redirect:/one/view?qna_idx=" + qnaAdminDTO.getQna_idx();
        }

        else {
            return "redirect:/one/view?qna_idx=" + qnaAdminDTO.getQna_idx();
        }

    }

    @GetMapping("/adminDelete")
    public String deleteAdminGET(int qna_idx) {
        qnaServiceIf.deleteAdmin(qna_idx);
        return "redirect:/one/view?qna_idx=" + qna_idx;
    }
}
