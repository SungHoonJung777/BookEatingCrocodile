package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.Criteria.PageMakerDTO;
import org.fullstack4.springmvc.dto.AttachImageDTO;
import org.fullstack4.springmvc.dto.BlackFridayDTO;
import org.fullstack4.springmvc.dto.CartDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.service.admin.AdminService;
import org.fullstack4.springmvc.service.blackFriday.BlackFirdayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.*;
import java.util.List;

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
    public String blackFridayStart(Model model , HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        model.addAttribute("member_id", session.getAttribute("member_id"));
        int count = blackFirdayService.countBlack();

        if(count > 0){
            BlackFridayDTO dto = blackFirdayService.blackFridayStart();
            model.addAttribute("list", dto);

            if(dto.getBlack_status().equals("s")){
                return "/event/blackFridayStart";
            } else {
                return "/event/blackFridayLoad";
            }

        } else {
            return "/event/blackFridayLoading";
        }



    }

    @GetMapping("/timerStart")
    public String timerStart(String time, Model model) throws Exception{
        int timer = Integer.parseInt(time);


        timer = timer * 60;
        blackFirdayService.blackStatusChange(timer);

        TimerThread timerThread = new TimerThread(timer,blackFirdayService);
        timerThread.start();
      /*  try {
            timerThread.join();
            return "redirect:/event/blackFridayStart";
        } catch (InterruptedException e) {
            e.printStackTrace();
        }*/
        System.out.println("timer : " + timer);
        model.addAttribute("timer", timer);
        return "redirect:/event/blackFridayStart";
    }

    @PostMapping("/registBlack")
    public String registBlack(String member_id, String price) throws Exception{
        int registPrice = Integer.parseInt(price);
        int uResult = blackFirdayService.registBlack(member_id,registPrice);


        if(uResult > 0){
            return "redirect:/event/blackFridayStart";
        } else {
            return "redirect:/event/blackFridayStart";
        }

    }
}
class TimerThread extends Thread {
    private int timeInSeconds;
    private BlackFirdayService blackFirdayService;

    public TimerThread(int timeInSeconds, BlackFirdayService blackFirdayService) {
        this.timeInSeconds = timeInSeconds;
        this.blackFirdayService = blackFirdayService;
    }

    @Override
    public void run() {
        try {
            System.out.println("타이머 시작: " + timeInSeconds + " 분");
            int minus = timeInSeconds - 1; // 매 초마다 감소할 값

            for (int i = timeInSeconds; i > 0 ; i--) {
                minus = minus -1;
                blackFirdayService.timeMinus(minus);
                Thread.sleep(1000); // 1초 대기
            }

            System.out.println("타이머 종료: " + timeInSeconds + " 분");
        } catch (InterruptedException e) {
            System.out.println("타이머가 중단되었습니다.");
        } finally {
            blackFirdayService.finalStatus();
            List<BlackFridayDTO> dto = blackFirdayService.blackFridayList();
            CartDTO cartDTO = new CartDTO();
            cartDTO.setMember_id(dto.get(0).getMember_id());
            cartDTO.setPro_idx(dto.get(0).getPro_idx());
            cartDTO.setPro_img(dto.get(0).getPro_image());
            cartDTO.setPro_price(dto.get(0).getBlack_price());
            cartDTO.setPro_title(dto.get(0).getPro_name());
            cartDTO.setPro_quantity(1);
            blackFirdayService.addCart(cartDTO);
        }
    }
}
