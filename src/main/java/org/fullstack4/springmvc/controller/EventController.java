package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.Criteria.PageMakerDTO;
import org.fullstack4.springmvc.dto.AttachImageDTO;
import org.fullstack4.springmvc.dto.BlackFridayDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.admin.AdminService;
import org.fullstack4.springmvc.service.blackFriday.BlackFirdayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/event")
@RequiredArgsConstructor
public class EventController {
    @Autowired
    private BlackFirdayService blackFirdayService;
    @Autowired
    private AdminService adminService;
    @GetMapping("/choice")
    public String choice() throws  Exception{
        return "/event/choice";
    }

    @GetMapping("/blackFridayRegist")
    public String blackFridayRegist() throws  Exception{
        return "/event/blackFridayRegist";
    }

    @GetMapping("/productList")
    public String productList(Model model, Criteria cri) throws Exception{
        List<ProductDTO> productDTOList = adminService.getProductList(cri);
        log.info("------------------------------------");
        log.info("eventProductList : " + productDTOList);
        log.info("------------------------------------");
        int total = adminService.getProductCountKeyword(cri);

        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);
        model.addAttribute("productList",productDTOList);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);

        return "/event/productList";
    }
    @GetMapping("/productChoice")
    public String productChoice(String pro_idx , Model model, HttpServletResponse response)throws Exception{
        int idx = Integer.parseInt(pro_idx);

        ProductDTO productDTO = adminService.getProductDetail(idx);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<script>");
        if (productDTO != null) {
            out.println("alert('상품 선택이 완료되었습니다.');");
        } else {
            out.println("alert('상품 선택에 실패했습니다.');");
        }
        out.println("window.close();");
        out.println("</script>");
        model.addAttribute("productDetail", productDTO);
        return "/event/blackFridayRegist";
    }
    @PostMapping("/blackFridayRegist")
    public String blackFridayRegistPOST(BlackFridayDTO dto) throws Exception{
        log.info("------------------------------------");
        log.info("BlackFridayDTO : " + dto.toString());

        List<AttachImageDTO> list = new ArrayList<>();

        int insertResult = blackFirdayService.blackFridayRegist(dto);
        if(insertResult > 0){
            return "redirect:/event/blackFridayList";
        } else {
            return "redirect:/event/blackFridayList";
        }

    }

    @GetMapping("/blackFridayList")
    public String blackFridayList(Model model) throws  Exception{
        List<BlackFridayDTO> blackFridayDTOS = blackFirdayService.blackFridayList();
        log.info("BlackFridayDTO : " +blackFridayDTOS);
        model.addAttribute("list", blackFridayDTOS);
        return "/event/blackFridayList";
    }

    @GetMapping("/blackFridayStart")
    public String blackFridayStart(Model model) throws Exception {

        int count = blackFirdayService.countBlack();

        if(count > 0){
            BlackFridayDTO dto = blackFirdayService.blackFridayStart();
            model.addAttribute("list", dto);
            return "/event/blackFridayStart";
        } else {
            return "/event/blackFridayLoading";
        }



    }

    @GetMapping("/timerStart")
    public String timerStart(String time, Model model) throws Exception{
        int timer = Integer.parseInt(time);
        int uResult = blackFirdayService.blackStatusChange();

        // 타이머 기능을 가진 스레드를 생성하고 시작합니다.
        TimerThread timerThread = new TimerThread(timer);
        timerThread.start();
        System.out.println("timer : " + timer);
        model.addAttribute("timer", timer);
        return "redirect:/event/blackFridayStart";
    }
}
class TimerThread extends Thread {
    private int timeInSeconds;

    public TimerThread(int timeInSeconds) {
        this.timeInSeconds = timeInSeconds;
    }

    @Override
    public void run() {
        try {
            System.out.println("타이머 시작: " + timeInSeconds + " 초");
            Thread.sleep(timeInSeconds * 1000 * 60); // 입력된 시간만큼 스레드를 일시 정지합니다.
            System.out.println("타이머 종료: " + timeInSeconds + " 초");
        } catch (InterruptedException e) {
            System.out.println("타이머가 중단되었습니다.");
        }
    }

}