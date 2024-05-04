package org.fullstack4.springmvc.service.admin;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.Criteria.Criteria;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.dto.OrderDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.AdminMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public int getMemberCount() {
        int count = adminMapper.getMemberCount();

        return count;
    }

    @Override
    public int getTotalOrder() {
        int total_count = adminMapper.getTotalOrder();

        return total_count;
    }

    @Override
    public int getProductCount() {
        int totalProduct = adminMapper.getProductCount();

        return totalProduct;
    }

    @Override
    public int getQnaAnswer() {
        int qnaAnswerCount = adminMapper.getQnaAnswer();
        return qnaAnswerCount;
    }

    @Override
    public List<MemberDTO> getMemberList(Criteria criteria) {
        List<MemberDTO> memberList = adminMapper.getMemberList(criteria).stream()
                .map(vo->modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        return memberList;
    }

    @Override
    public int getMemberCountKeyword(Criteria cri) {
        int count = adminMapper.getMemberCountKeyword(cri);
        return count;
    }

    @Override
    public int deleteMember(String member_id) {
        int dResult = adminMapper.deleteMember(member_id);
        return dResult;
    }

    @Override
    public List<ProductDTO> getProductList(Criteria cri) {
        List<ProductDTO> productList = adminMapper.getProductList(cri).stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());

        return productList;
    }

    @Override
    public int getProductCountKeyword(Criteria cri) {
        int count = adminMapper.getProductCountKeyword(cri);
        return count;
    }

    @Override
    public ProductDTO getProductDetail(int idx) {
        ProductVO productVO = adminMapper.getProductDetail(idx);
        ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);



        return productDTO;
    }

    @Override
    public int productModify(ProductDTO dto) {

        ProductVO productVO = modelMapper.map(dto, ProductVO.class);
        int result = adminMapper.productModify(productVO);
        return result;
    }

    @Override
    public int deleteProduct(int idx) {
        int dResult = adminMapper.deleteProduct(idx);
        return dResult;
    }

    @Override
    public int insertProduct(ProductDTO dto) {
        ProductVO productVO = modelMapper.map(dto, ProductVO.class);

        int iResult = adminMapper.insertProduct(productVO);
        return 0;
    }
    @Override
    public List<OrderDTO> getOrderList(Criteria cri) {
        List<OrderDTO> orderList = adminMapper.getOrderList(cri).stream()
                .map(vo->modelMapper.map(vo, OrderDTO.class))
                .collect(Collectors.toList());

        return orderList;
    }

    @Override
    public int getOrderCountKeyword(Criteria cri) {
        int count = adminMapper.getOrderCountKeyword(cri);
        return count;
    }

    @Override
    public List<MemberDTO> getDeleveryList(Criteria cri) {
        List<MemberDTO> memberList = adminMapper.getDeleveryList(cri).stream()
                .map(vo->modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());

        return memberList;
    }

    @Override
    public int getDeleveryCountKeyword(Criteria cri) {
        int count = adminMapper.getDeleveryCountKeyword(cri);
        return count;
    }

    @Override
    public int deliveryRegist(String member_id, int idx) {
        int count = adminMapper.deliveryRegist(member_id, idx);
        return count;

    }
}
