package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.Criteria.PageMakerDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.OrderTestDTO;
import org.fullstack4.springmvc.service.delivery.DeliveryService;
import org.fullstack4.springmvc.service.delivery.DeliveryServiceImpl;
import org.fullstack4.springmvc.service.memberLoginService.MemberLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
    @Autowired
    private MemberLoginService memberLoginService;
    @Autowired
    private DeliveryService deliveryService;

    @GetMapping("/deliveryLogin")
    public String deliveryLogin() throws Exception{

        return "/delivery/deliveryLogin";
    }

    @PostMapping("/deliveryLogin")
    public String deliveryLoginPOST(Model model , HttpServletRequest request , HttpServletResponse response , String id, String pwd, RedirectAttributes redirectAttributes) throws Exception{
        log.info("==============================");
        log.info("AdminLoginController >> loginPOST()");
        MemberDTO loginMemberDTO = memberLoginService.login_info(id ,pwd);
        log.info("loginMemberDTO : " + loginMemberDTO);
        System.out.println("#######"+loginMemberDTO.getMember_type());
        if (loginMemberDTO != null && loginMemberDTO.getMember_type().equals("c")) {
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginMemberDTO.getMember_id());
            session.setAttribute("loginInfo", loginMemberDTO);
            log.info(session.getAttribute("loginInfo"));
            model.addAttribute("loginInfo", loginMemberDTO);

            return "redirect:/delivery/main";
        }
        else {

            redirectAttributes.addFlashAttribute("error_login", "접근권한이 없는 사용자 입니다.");
            return "redirect:/delivery/login";
        }

    }
    @GetMapping("/main")
    public String adminMain(Model model, Criteria cri, HttpServletRequest request) throws Exception {
        // 세션에서 회원 아이디를 가져옴
        HttpSession session = request.getSession();
        String delivery_member_id = (String) session.getAttribute("member_id");
        System.out.println(delivery_member_id+"asdasdasdasd");
        // 회원 아이디를 기반으로 주문 목록을 조회
        List<OrderDTO> orderList = new ArrayList<>();
        int total = 0;
        if (delivery_member_id != null) { // 회원 아이디가 null이 아닌 경우에만 조회
            orderList = deliveryService.getOrderListMember(delivery_member_id);
            total = deliveryService.getOrderCountKeywordMember(delivery_member_id);

        }

        // 페이징 처리를 위한 PageMakerDTO 생성
/*        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri, total);*/

        // 모델에 데이터 추가
        model.addAttribute("orderList", orderList);
/*
        model.addAttribute("pageMaker", pageMakerDTO);
        model.addAttribute("cri", cri);
*/

        // 관리자 메인 페이지로 이동
        return "/delivery/main";
    }
    @PostMapping("/updateDeliveryStatus")
    @ResponseBody
    public String updateDeliveryStatus(String delivery,String order_idx) throws Exception {
        log.info("============================");
        log.info("updateDeliveryStatus >> updateDeliveryStatus()");
        log.info(delivery);
        log.info("============================");
        int idx = Integer.parseInt(order_idx);


        log.info("============================"+idx);
        int result = deliveryService.updateDeliveryStatus(delivery,idx);

        if (result != 0) {
            return "fail";
        } else {
            return "success";
        }

    }

}
