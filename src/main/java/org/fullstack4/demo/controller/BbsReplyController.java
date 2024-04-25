package org.fullstack4.demo.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.demo.dto.BbsReplyDTO;
import org.fullstack4.demo.service.BbsReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@Log4j2
@RequestMapping("/reply")
@RequiredArgsConstructor
public class BbsReplyController {
    @Autowired
    private BbsReplyService bbsReplyService;

    @PostMapping("/regist")
    public String registPost(@Valid BbsReplyDTO bbsReplyDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("---------------------");
        log.info("BbsController => registPost()");

        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("dto", bbsReplyDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            // 이런식으로 에러 있는지 bindingResult 체크해서 addFlashAttribute 보내면 처음 리다이렉트 한 페이지에서 한번만 조회하고 끝낼 수 있음.
            // getAllErrors는 Array 형태로 보내짐.
            return "redirect:/bbs/view?idx="+bbsReplyDTO.getBbs_idx();
        }

        int result = bbsReplyService.reply_regist(bbsReplyDTO);
        log.info("BbsDTO : " + bbsReplyDTO.toString());
        log.info("result : " + result);
        log.info("---------------------");
        if (result > 0) {
            return "redirect:/bbs/view?idx="+bbsReplyDTO.getBbs_idx();
        } else {
            return "redirect:/bbs/view?idx="+bbsReplyDTO.getBbs_idx();
        }
    }

}
