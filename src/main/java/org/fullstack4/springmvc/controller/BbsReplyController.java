package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/bbsReply")
@RequiredArgsConstructor
public class BbsReplyController {

    private final BbsReplyServiceIf bbsReplyServiceIf;

    @PostMapping("/regist")
    public String replyRegistPOST(@Valid BbsReplyDTO bbsReplyDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("BbsReplyController >> replyRegistPOST()");


        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsReplyDTO", bbsReplyDTO);

            return "redirect:/bbs/view?idx=" + bbsReplyDTO.getBbs_idx();
        }

        log.info("bbsDTO : " + bbsReplyDTO.toString());

        int result = bbsReplyServiceIf.reply_regist(bbsReplyDTO);

        log.info("replyResult : " + result);
        log.info("============================");

        return "redirect:/bbs/view?idx=" + bbsReplyDTO.getBbs_idx();
    }


}
