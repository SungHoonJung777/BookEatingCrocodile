package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.common.FileUtil;
import org.fullstack4.springmvc.dto.CartDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.fullstack4.springmvc.service.MemberImageServiceIf;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.fullstack4.springmvc.service.qnaService.QnaServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Random;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;
    private final MemberImageServiceIf memberImageServiceIf;
    private final BbsServiceIf bbsServiceIf;
    private final QnaServiceIf qnaServiceIf;

    @Autowired
    private JavaMailSender mailSender;


    @GetMapping("/view")
    public void view(HttpSession session,
                     HttpServletRequest req,
                     Model model ) {
        log.info("========================");
        log.info("MemberController >> view()");



        String member_id = String.valueOf(session.getAttribute("member_id"));

        MemberDTO memberDTO = memberServiceIf.view(member_id);

//        MemberImageDTO memberImageDTO = memberImageServiceIf.viewImg(memberDTO.getMember_id());


        log.info("member_id : " + member_id);


//        MemberDTO memberDTO = memberServiceIf.view(user_id);
//
//        log.info("user_id : " + user_id);
//        log.info("========================");
        model.addAttribute("member", memberDTO);
//        model.addAttribute("memberImage", memberImageDTO);

//
//        //이거 안해주면 jsp에 값 안넘어온다ㅣ@
//        model.addAttribute("user_id", user_id);
//        model.addAttribute("memberDTO", memberDTO);
    }


    @GetMapping("/join")
    public String joinGET() {
        log.info("============================");
        log.info("MemberController >> joinGET()");
        log.info("============================");
        String url = "/member/joinForm";
        return url;
    }
    @GetMapping("/email")
    @ResponseBody
    public String  emailGET(String email) throws Exception{
        log.info("============================");
        log.info("MemberController >> emailGET()");
        log.info(email);
        log.info("============================");
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "sshu777@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                        "<br><br>" +
                        "인증 번호는 " + checkNum + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

       /* try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);

            mailSender.send(message);


        }catch(Exception e) {
            e.printStackTrace();
        }*/

        String num = Integer.toString(checkNum);

        return num;
    }
/*
    @PostMapping("/join")
    public String joinPOST(@Valid MemberDTO memberDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes) {
        log.info("============================");
        log.info("MemberController >> joinPOST()");


        int result2 = memberServiceIf.getIdCount(memberDTO.getUser_id());

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);

            return "redirect:/member/join";
        }

        if (result2 > 0) {
            redirectAttributes.addFlashAttribute("idError", "아이디 중복!");
            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
            return "redirect:/member/join";
        }


        log.info("memberDTO : " + memberDTO.toString());

        int result = memberServiceIf.regist(memberDTO);


        log.info("registResult : " + result);

        log.info("============================");


        if (result > 0) {
            return "redirect:/login/login";
        }
        else {

            return "redirect:/member/join";
        }
    }
*/

    @GetMapping("/modify")
    public void modifyGET(HttpSession session,
                          Model model) {
        log.info("============================");
        log.info("MemberController >> modifyGET()");

        String member_id = String.valueOf(session.getAttribute("member_id"));

        model.addAttribute("member", memberServiceIf.view(member_id));

        log.info("============================");
    }

    @PostMapping("/modify")
    public String modifyPOST(@Valid MemberDTO memberDTO,
                             MemberImageDTO memberImageDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             @RequestParam(name="member_img") String upload,
                             @RequestParam("upload") MultipartFile file) {
        log.info("============================");
        log.info("MemberController >> modifyPOST()");


        String saveFileName = "";
        int resultMemImg = 0;
        if(file != null &&  file.getOriginalFilename() != null && !file.getOriginalFilename().isEmpty() ){

            log.info("file  : "+file);
            log.info("getOriginalFilename : "+file.getOriginalFilename());


            saveFileName = FileUtil.createFile(file);

            log.info("member_file : "+saveFileName);
        }
        if(saveFileName != null && !saveFileName.isEmpty()){
            resultMemImg = memberServiceIf.modifyImage(memberDTO.getMember_id(), saveFileName);

        }   else {
            resultMemImg = memberServiceIf.modifyImage(memberDTO.getMember_id(), upload);

        }


        //int resultImg = memberImageServiceIf.regist(memberDTO.getMember_id(), orgFile, saveFileName);
    //}

//        if (file.isEmpty() || file == null) {
//            FileUtil.deleteFile(saveFileName);
//        }
//        if (bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("memberDTO", memberDTO);
//
//            return "redirect:/member/modify?user_id=" + memberDTO.getUser_id();
//        }
//

        int result = memberServiceIf.modify(memberDTO);


        log.info("modifyResult : " + result);
        log.info("============================");
        if (result > 0) {
            return "redirect:/member/view?" + memberDTO.getMember_id();
        } else {
            return "redirect:/member/modify?user_id=" + memberDTO.getMember_id();
        }
    }

    @PostMapping("/delete")
    public String leavePOST(@RequestParam(name="member_id", defaultValue = "") String member_id,
                            HttpServletRequest req) {
        log.info("============================");
        log.info("MemberController >> leavePOST()");
        log.info("============================");

        int result = memberServiceIf.delete(member_id);
        if (result > 0) {
            HttpSession session = req.getSession();
            session.invalidate();

            return "redirect:/product/main";
        } else {
            return "redirect:/member/view?user_id=" + member_id;
        }
    }
    @GetMapping("/cart")
    public void cartGET(HttpSession session,
                        Model model) {
        String m_id = (String)session.getAttribute("member_id");
        List<CartDTO> cartList = memberServiceIf.getCartList(m_id, "");
        model.addAttribute("cartList", cartList);
    }
    @ResponseBody
    @RequestMapping(value = "/cartout", method = RequestMethod.POST)
    public void cartoutPOST(@RequestParam(name = "cart_idx", defaultValue="") String cart_idx) {
        memberServiceIf.cartout(cart_idx);
        System.out.println("cart_idx : "+ cart_idx);
    }
    @GetMapping("/checkout")
    public void checkout(@RequestParam(name = "cart_idx", defaultValue = "") String cart_idx,
                         HttpSession session,
                        Model model) {
        String m_id = (String)session.getAttribute("member_id");
        List<CartDTO> cartList = memberServiceIf.getCartList(m_id, cart_idx);

        int total = 0;
        for(int i = 0; i < cartList.size(); i++) {
            int tmp = cartList.get(i).getPro_price()*cartList.get(i).getPro_quantity();
            total = total+tmp;
        }
        model.addAttribute("cart_idx", cart_idx);
        model.addAttribute("total", total);
        model.addAttribute("cartList", cartList);
    }
    @PostMapping("/checkout")
    public String Postcheckout(@Valid OrderDTO orderDTO,
                               @RequestParam(name = "cart_idx", defaultValue = "") String cart_idx,
                               HttpSession session,
//                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
//        if (bindingResult.hasErrors()) {
//            log.info("Errors");
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("qnaDTO", orderDTO);
//            redirectAttributes.addFlashAttribute("cart_idx", cart_idx);
//            log.info("===============");
//            return "redirect:/member/checkout";
//        }
        String member_id = (String)session.getAttribute("member_id");
        
        orderDTO.setOrder_addr();
        orderDTO.setMember_id(member_id);
        //선택한 cart의 idx값 이용하여 정보 가져오는 부분
        List<CartDTO> cartList = memberServiceIf.getCartList(member_id, cart_idx);
        int total = 0;
        for(int i = 0; i < cartList.size(); i++) {
            int tmp = cartList.get(i).getPro_price()*cartList.get(i).getPro_quantity();
            total = total+tmp;
        }

        orderDTO.setOrder_total(total+3000);
        orderDTO.setOrder_addr();
        orderDTO.setMember_id(member_id);

        memberServiceIf.insertOrder(orderDTO);//order 테이블 insert
        int order_idx = memberServiceIf.getorderidx(member_id);//insert한ㄴ order_idx값 가져오기
        for(int i = 0; i < cartList.size(); i++) {
            cartList.get(i).setCart_idx(order_idx);
        }
        memberServiceIf.insertOrderDetail(cartList);//order_detail테이블 insert
        for(CartDTO i : cartList) {
            memberServiceIf.minusamount(i.getPro_idx(), i.getPro_quantity());//재고량 마이너스
        }
        memberServiceIf.cartout(cart_idx);//카트에서 주문 상품 제거
        return"redirect:/member/cart";
    }

    @ResponseBody
    @PostMapping("/cartminus")
    public void cartMinus(@RequestParam(name = "cart_idx", defaultValue="") String cart_idx){
        memberServiceIf.cartminus(cart_idx);
    }
    @ResponseBody
    @PostMapping("/cartplus")
    public void cartPlus(@RequestParam(name = "cart_idx", defaultValue="") String cart_idx,
                         @RequestParam(name = "pro_quantity", defaultValue="1") String pro_quantity){
        memberServiceIf.cartplus(cart_idx, pro_quantity);
    }

    @GetMapping("/buy")
    public void buyList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("MemberController >> buyList()");
        String member_id = (String)session.getAttribute("member_id");
        List<OrderDTO> orderList = memberServiceIf.getOrderList(member_id);

//        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("orderList", orderList);
        log.info("MemberController >> buyList() END");
        log.info("============================");
    }


    @GetMapping("/one")
    public void oneList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("MemberController >> qnaList()");
        String member_id = (String)session.getAttribute("member_id");
//        PageResponseDTO<QnaDTO> qnaList = memberServiceIf.getQnaList(member_id, "one", pageRequestDTO);
        pageRequestDTO.setQna_category("one");
        pageRequestDTO.setMember_id(member_id);
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.getQna(pageRequestDTO);


        model.addAttribute("qnaList", qnaList);
       // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("MemberController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }


    @GetMapping("/qna")
    public void qnaList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("MemberController >> qnaList()");
//        String member_id = (String)session.getAttribute("member_id");
//        PageResponseDTO<QnaDTO> qnaList = memberServiceIf.getQnaList(member_id, "qna", pageRequestDTO);
        String member_id = (String)session.getAttribute("member_id");
        pageRequestDTO.setQna_category("qna");
        pageRequestDTO.setMember_id(member_id);
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.getQna(pageRequestDTO);
        log.info("qnaList : "+qnaList.toString());

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);
        // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("MemberController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }

    @PostMapping("/orderDelete")
    public String orderDelete(@RequestParam(name="order_idx", defaultValue = "0") int order_idx,
                            HttpServletRequest req) {
        log.info("============================");
        log.info("MemberController >> orderDelete()");
        log.info("============================");
        int result = memberServiceIf.orderDelete(order_idx);
        if (result > 0) {
            return "redirect:/member/buy";
        } else {
            return "redirect:/member/buy";
        }
    }

    @GetMapping("/review")
    public void review(HttpSession session,
                       @Valid PageRequestDTO pageRequestDTO,
                       Model model) {
        String member_id = (String)session.getAttribute("member_id");
        List<ReviewDTO> reviewList = memberServiceIf.getReviewList(member_id);
        log.info(reviewList.toString());

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("reviewList", reviewList);
    }
    @ResponseBody
    @PostMapping("/addcart")
    public void addcart(HttpSession session,
                        @RequestParam(value = "pro_idx",defaultValue = "") String pro_idx,
                        @RequestParam(value = "pro_quantity",defaultValue = "1") String pro_quantity){
        String member_id = (String)session.getAttribute("member_id");
        int check = 0;
        String cart_idx = "";
        List<CartDTO> cartList = memberServiceIf.getCartList(member_id, "");
        for(CartDTO list:cartList){
            if(Integer.parseInt(pro_idx)==list.getPro_idx()){
                cart_idx = String.valueOf(list.getCart_idx());
                check+=1;
            }
        }
        if(check >= 1){
            memberServiceIf.cartplus(cart_idx, pro_quantity);
        }else{
            memberServiceIf.addcart(pro_idx, member_id, pro_quantity);
        }

    }

    @ResponseBody
    @PostMapping("/orderdetail")
    public List  orderdetail(Model model,
                            @RequestParam(value = "order_idx", defaultValue = "") String order_idx){
        OrderDTO orderdto = memberServiceIf.orderinfo(order_idx);
        List list = memberServiceIf.orderDetail(order_idx);
        list.add(orderdto);

        return list;
    }
}
