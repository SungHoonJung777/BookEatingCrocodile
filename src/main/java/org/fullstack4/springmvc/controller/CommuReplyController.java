package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.CommuReplyDTO;
import org.fullstack4.springmvc.service.data.CommuReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/data")
@RequiredArgsConstructor
public class CommuReplyController {

    private final CommuReplyServiceIf commuReplyServiceIf;

    @PostMapping("/replyRegist")
    public String replyRegistPOST(@Valid CommuReplyDTO commuReplyDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("BbsReplyController >> replyRegistPOST()");


        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("bbsReplyDTO", commuReplyDTO);

            return "redirect:/data/view?comu_idx=" + commuReplyDTO.getComu_idx();
        }

        log.info("commuReplyDTO : " + commuReplyDTO.toString());

        int result = commuReplyServiceIf.reply_regist(commuReplyDTO);

        log.info("replyResult : " + result);
        log.info("============================");

        return "redirect:/data/view?comu_idx=" + commuReplyDTO.getComu_idx();
    }

    @PostMapping("/deleteReply")
    public String deleteReply(@RequestParam(name = "reply_idx", defaultValue="0") int reply_idx,
                              @RequestParam(name = "comu_idx", defaultValue="0") int comu_idx) {

        int result = commuReplyServiceIf.deleteReply(reply_idx, comu_idx);

        return "redirect:/data/view?comu_idx=" + comu_idx;
    }
}