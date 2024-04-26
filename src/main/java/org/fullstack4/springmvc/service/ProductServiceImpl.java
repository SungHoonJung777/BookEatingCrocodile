package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.domain.ProductVO;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.dto.ProductDTO;
import org.fullstack4.springmvc.mapper.ProductMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductServiceIf {

    private final ProductMapper productMapper;
    private final ModelMapper modelMapper;
    @Override
    public List<ProductDTO> pro_listAll() {
        List<ProductDTO> productDTOList = productMapper.pro_listAll().stream()
                .map(vo->modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());
        return productDTOList;
    }

    @Override
    public ProductDTO pro_view(int pro_idx) {
        ProductVO productVO = productMapper.pro_view(pro_idx);
        ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);
        return productDTO;
    }
    @Override
    public int productTotalCount(PageRequestDTO requestDTO) {

        return  productMapper.productTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<ProductDTO> productListByPage(PageRequestDTO pageRequestDTO) {
        List<ProductVO> voList = productMapper.productListByPage(pageRequestDTO);
        List<ProductDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ProductDTO.class))
                .collect(Collectors.toList());

        int total_count = productMapper.productTotalCount(pageRequestDTO);

        PageResponseDTO<ProductDTO> responseDTO = PageResponseDTO.<ProductDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }

}
