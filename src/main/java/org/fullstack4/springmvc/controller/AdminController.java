package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.Criteria.PageMakerDTO;
import org.fullstack4.springmvc.dto.*;
import org.fullstack4.springmvc.mapper.QnaMapper;
import org.fullstack4.springmvc.service.admin.AdminService;
import org.fullstack4.springmvc.service.memberLoginService.MemberLoginService;
import org.fullstack4.springmvc.service.qnaService.QnaServiceIf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
    @Autowired
    private MemberLoginService memberLoginService;
    @Autowired
    private AdminService adminService;
    private final QnaServiceIf qnaServiceIf;

    @GetMapping("/login")
    public String adminLogin() throws Exception{
        log.info("============================");
        log.info("AdminController >> AdminLoginGET()");
        log.info("============================");
        return "/admin/login";
    }

    @PostMapping("/login")
    public String loginPOST(Model model , HttpServletRequest request , HttpServletResponse response , String id, String pwd, RedirectAttributes redirectAttributes) {
        log.info("==============================");
        log.info("AdminLoginController >> loginPOST()");
        MemberDTO loginMemberDTO = memberLoginService.login_info(id ,pwd);
        log.info("loginMemberDTO : " + loginMemberDTO);
        System.out.println("#######"+loginMemberDTO.getMember_type());
        if (loginMemberDTO != null && loginMemberDTO.getMember_type().equals("a")) {
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginMemberDTO.getMember_id());
            session.setAttribute("loginInfo", loginMemberDTO);
            log.info(session.getAttribute("loginInfo"));
            model.addAttribute("loginInfo", loginMemberDTO);

            return "redirect:/admin/main";
        }
        else {

            redirectAttributes.addFlashAttribute("error_login", "접근권한이 없는 사용자 입니다.");
            return "redirect:/admin/login";
        }
    }

    @GetMapping("/main")
    public String adminMain(HttpServletRequest request) throws Exception{
        int memberCount = adminService.getMemberCount();
        log.info("memberCount : " + memberCount);
        request.setAttribute("memberCount",memberCount);

        int total_order = adminService.getTotalOrder();
        log.info("total_order : " + total_order);
        request.setAttribute("total_order",total_order);

        int productCount = adminService.getProductCount();
        log.info("productCount : " + productCount);
        request.setAttribute("productCount",productCount);

        int qnaCountN = adminService.getQnaAnswer();
        log.info("qnaCountN : " + qnaCountN);
        request.setAttribute("qnaCountN",qnaCountN);
        return "/admin/main";
    }

    @GetMapping("/memberList")
    public String memberList(Model model, Criteria cri){
        List<MemberDTO> memberList = adminService.getMemberList(cri);
        int total = adminService.getMemberCountKeyword(cri);

        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);
        log.info("------------------------------------");
        log.info("MemberDTO : " + memberList);
        log.info("------------------------------------");
        model.addAttribute("memberList" , memberList);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);
        return "/admin/memberList";
    }

    @GetMapping("/memberDelete")
    public String memberDelete(String member_id) throws Exception{
        int deleteResult = adminService.deleteMember(member_id);

        if(deleteResult > 0){
            return "redirect:/admin/memberList?success=true";
        } else {
            return "redirect:/admin/memberList?error=true";
        }
    }


    @GetMapping("/productList")
    public String productList(Model model, Criteria cri) throws Exception {
        List<ProductDTO> productDTOList = adminService.getProductList(cri);
        log.info("------------------------------------");
        log.info("productDTOList : " + productDTOList);
        log.info("------------------------------------");
        int total = adminService.getProductCountKeyword(cri);

        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);
        model.addAttribute("productList",productDTOList);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);
        return "/admin/productList";
    }

    @GetMapping("/productModify")
    public String productModify(String pro_idx , Model model)throws Exception{
        int idx = Integer.parseInt(pro_idx);

        ProductDTO productDTO = adminService.getProductDetail(idx);
        model.addAttribute("productDetail", productDTO);
        return "/admin/productModify";
    }

    @PostMapping("/productModify")
    public String productModifyPost(ProductDTO dto) throws Exception{
        log.info("################" + dto.toString());
        int uResult = adminService.productModify(dto);
        if(uResult > 0){
            return "redirect:/admin/productList?success=true";
        } else{
            return "redirect:/admin/productList?error=true";
        }

    }
    @GetMapping("/productDelete")
    public String productDelete(String pro_idx) throws Exception{
        int idx = Integer.parseInt(pro_idx);
        int deleteResult = adminService.deleteProduct(idx);

        if(deleteResult > 0){
            return "redirect:/admin/productList?success=true";
        } else {
            return "redirect:/admin/productList?error=true";
        }
    }

    @GetMapping("/productRegist")
    public String productRegist() throws Exception{
        return "/admin/productRegist";
    }

    @PostMapping("/productRegistPro")
    public String productRegistPOST(ProductDTO dto, @RequestParam("file") MultipartFile file) throws Exception{
        log.info("------------------------------------");
        log.info("productDTOList : " + dto.toString());
        log.info("###"+file.getOriginalFilename());
        log.info("------------------------------------");
        List<AttachImageDTO> list = new ArrayList<>();

        String uploadFolder = "C:\\java4\\spring\\springweb\\crocodile\\src\\main\\webapp\\resources\\img\\books";
        String fileRealName = file.getOriginalFilename(); //원래 파일의 이름
        long size = file.getSize();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
        //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("fileRealName : " + fileRealName);
        log.info("size : " + size);
        log.info("fileExt : " + fileExt);


        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        log.info("uuid : " + uuid);
        log.info("uuids : " + uuids);
        log.info("newName : " + newName);


        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);
        AttachImageDTO img = new AttachImageDTO();
        try {


            file.transferTo(saveFile);
            File thunsailFile = new File(uploadFolder + "\\" + newName + fileExt);

            img.setFileName(newName);
            img.setUploadPath(uploadFolder);
            img.setUuid(newName);


            BufferedImage bo_image = ImageIO.read(saveFile);
            double ratio = 3;
            int width = (int) (bo_image.getWidth() / ratio);
            int height = (int) (bo_image.getHeight() / ratio);


            BufferedImage bt_image = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphics2D = bt_image.createGraphics();
            graphics2D.drawImage(bo_image,0,0,width,height,null);

            ImageIO.write(bt_image,fileExt,thunsailFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        list.add(img);

        dto.setPro_image(newName + fileExt);

        int insertResult = adminService.insertProduct(dto);
        if(insertResult > 0){
            return "redirect:/admin/productList?success=true";
        } else {
            return "redirect:/admin/productList?error=true";
        }

    }
/*
    @PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<AttachImageDTO>> uploadAjaxAcctionPost(MultipartFile file){


        System.out.println("#######file#########" + file);
        List<AttachImageDTO> list = new ArrayList<>();
        String uploadFolder = "C:\\java4\\spring\\springweb\\crocodile\\src\\main\\webapp\\resources\\img\\books";
        String fileRealName = file.getOriginalFilename(); //원래 파일의 이름
        long size = file.getSize();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); // 확장자명
        //엑셀.파.일xxx.xls --> 제일 마지막 인덱스의 . 에서부터 파일이름 끝에를 파싱

        log.info("============================");
        log.info("uploadFolder : " + uploadFolder);
        log.info("fileRealName : " + fileRealName);
        log.info("size : " + size);
        log.info("fileExt : " + fileExt);


        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        log.info("uuid : " + uuid);
        log.info("uuids : " + uuids);
        log.info("newName : " + newName);


        File saveFile = new File(uploadFolder + "\\" + newName + fileExt);

        try {
            file.transferTo(saveFile);
            File thunsailFile = new File(uploadFolder + "\\" + newName + fileExt);
            BufferedImage bo_image = ImageIO.read(saveFile);
            double ratio = 3;
            int width = (int) (bo_image.getWidth() / ratio);
            int height = (int) (bo_image.getHeight() / ratio);


            BufferedImage bt_image = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            Graphics2D graphics2D = bt_image.createGraphics();
            graphics2D.drawImage(bo_image,0,0,width,height,null);

            ImageIO.write(bt_image,fileExt,thunsailFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            e.printStackTrace();
        }

        ResponseEntity<List<AttachImageDTO>> result = new ResponseEntity<List<AttachImageDTO>>(list, HttpStatus.OK);

        return null;
    }*/


    @GetMapping("/delivery")
    public String deliveryView(Model model, Criteria cri) throws Exception{
        List<OrderDTO> orderList = adminService.getOrderList(cri);
        int total = adminService.getOrderCountKeyword(cri);
        System.out.println(total+"asdasd");
        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);
        log.info("------------------------------------");
        log.info("OrderDTO : " + orderList);
        log.info("------------------------------------");
        model.addAttribute("orderList" , orderList);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);

        return "/admin/deliveryList";
    }
    @GetMapping("/deleveryChoice")
    public String deleveryChoice(Model model, Criteria cri, String order_idx) throws Exception{
        List<MemberDTO> memberList = adminService.getDeleveryList(cri);
        int total = adminService.getDeleveryCountKeyword(cri);

        int idx = Integer.parseInt(order_idx);
        PageMakerDTO pageMakerDTO = new PageMakerDTO(cri,total);
        log.info("------------------------------------");
        log.info("MemberDTO : " + memberList);
        log.info("------------------------------------");
        model.addAttribute("memberList" , memberList);
        model.addAttribute("pageMaker",pageMakerDTO);
        model.addAttribute("cri",cri);
        model.addAttribute("order_idx",idx);
        return "/admin/deleveryChoice";
    }

    @GetMapping("/deliveryRegist")
    public void deliveryRegist(String member_id, String order_idx, HttpServletResponse response) throws Exception {
        int idx = Integer.parseInt(order_idx);
        int result = adminService.deliveryRegist(member_id, idx);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<script>");
        if (result > 0) {
            out.println("alert('배송 등록이 완료되었습니다.');");
        } else {
            out.println("alert('배송 등록에 실패했습니다.');");
        }
        out.println("window.close();");
        out.println("</script>");

    }

    @GetMapping("/qnaList")
    public void qnaList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("QnaController >> qnaList()");
        pageRequestDTO.setQna_category("qna");
        String member_id = (String)session.getAttribute("member_id");
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.getQna( pageRequestDTO);

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);
        // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("QnaController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }
    @GetMapping("/oneList")
    public void oneList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("QnaController >> qnaList()");
        pageRequestDTO.setQna_category("one");
        String member_id = (String)session.getAttribute("member_id");
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.getQna( pageRequestDTO);

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);
        // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("QnaController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }

    @GetMapping("/faqList")
    public void faqList(HttpSession session,
                        @Valid PageRequestDTO pageRequestDTO,
                        Model model) {
        log.info("============================");
        log.info("MemberController >> qnaList()");
        pageRequestDTO.setQna_category("faq");
        String member_id = (String)session.getAttribute("member_id");
        PageResponseDTO<QnaDTO> qnaList = qnaServiceIf.getQna( pageRequestDTO);

        //PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("qnaList", qnaList);
        // model.addAttribute("responseDTO", responseDTO);

        log.info(qnaList);
        log.info("MemberController >> qnaList() END");
        log.info("========================");
        log.info("============================");
    }
}
